#!/usr/bin/env python3
"""私有 MTalk / MCS 服务器。

实现目标：让 Android 2.1 的 Google Talk 客户端在**不改动 UI** 的前提下
重新登录、拉取好友列表、显示在线状态、收发消息，从而截取原始界面截图。

已实现：
  * TLS 监听 5228（兼容 Android 2.1 的旧密码套件）
  * MCS 帧解析：[tag:1][varint length][protobuf]
  * 版本字节握手（双方各发 0x04）
  * LOGIN_REQUEST(2)  -> LOGIN_RESPONSE(3)
  * IQ_STANZA(7)       -> 花名册应答（RosterQuery，扩展 ID=1）
  * BATCH_PRESENCE(9)  -> 好友在线状态
  * PRESENCE_STANZA(6) -> 单条在线状态 / 探测应答
  * MESSAGE_STANZA(5)  -> 在真实设备之间转发聊天消息
  * HEARTBEAT_PING(0)  <-> HEARTBEAT_ACK(1)

好友列表默认是**动态**的：谁连上来，谁就是好友（见 DynamicRoster）。两台设备
只要在“本机邮箱”里填各自地址、连同一台服务器，就能互相看到并互发消息。
用 --roster 可指定静态 JSON 覆盖（单机演示/回归测试用）。

字段编号来自反编译产物，详见 server/mcs_proto.py 顶部注释。

运行示例：
    python3 server/mtalk_server.py --plain --host 0.0.0.0 --port 5228
    # 单机演示也可指定静态花名册：
    python3 server/mtalk_server.py --plain --roster my_roster.json
"""
import argparse
import json
import base64
import hashlib
import os
import socket
import ssl
import threading
import time
from typing import Dict, List, Optional

import mcs_proto as pb

HOST = '0.0.0.0'
PORT = 5228
CERT = 'certs/alt/server2.crt'
KEY = 'certs/alt/server2.key'

LOG_LOCK = threading.Lock()
_VERBOSE = True

# 好友列表默认是“动态”的：好友就是当前连上来的其它真实设备（见 DynamicRoster）。
# 如需单机演示/回归测试，可用 --roster 指定一个静态 JSON 覆盖。
#
# 每台设备在“本机邮箱”里填自己的地址，登录后即可互相看到、互发消息。


def display_name(jid: str) -> str:
    """把 JID 变成好友列表里显示的名字（默认用 @ 前面那段）。"""
    return jid.split('@', 1)[0]


# 每条下行消息都要有**唯一**的 packet id 与**严格递增**的时间戳：
#   * 客户端按 packet_id 去重，同一毫秒内多条消息若 id 相同会被丢掉；
#   * 时间戳相同又会让排序出现并列。
# 用一个全局序号保证两者都唯一，消息就不会丢、顺序也稳定。
_MSG_SEQ = 0
_MSG_TS = 0
_MSG_LOCK = threading.Lock()


def next_message_id() -> str:
    global _MSG_SEQ
    with _MSG_LOCK:
        _MSG_SEQ += 1
        return 'm-%d-%d' % (int(time.time() * 1000), _MSG_SEQ)


def next_timestamp() -> int:
    """严格递增的毫秒时间戳（同一毫秒内多条消息也各不相同）。"""
    global _MSG_TS
    with _MSG_LOCK:
        now = int(time.time() * 1000)
        if now <= _MSG_TS:
            now = _MSG_TS + 1
        _MSG_TS = now
        return now


def log(msg: str) -> None:
    with LOG_LOCK:
        print('[%s] %s' % (time.strftime('%H:%M:%S'), msg), flush=True)


def hexdump(data: bytes, prefix: str = '') -> None:
    if not _VERBOSE:
        return
    for i in range(0, len(data), 16):
        chunk = data[i:i + 16]
        hexs = ' '.join('%02x' % b for b in chunk)
        text = ''.join(chr(b) if 32 <= b < 127 else '.' for b in chunk)
        log('%s%04x  %-47s  %s' % (prefix, i, hexs, text))


# ============================================================ 线协议 IO
def read_exact(sock, n: int) -> bytes:
    buf = b''
    while len(buf) < n:
        chunk = sock.recv(n - len(buf))
        if not chunk:
            raise EOFError('连接已关闭')
        buf += chunk
    return buf


def read_varint(sock):
    value = 0
    shift = 0
    raw = b''
    while True:
        b = read_exact(sock, 1)
        raw += b
        value |= (b[0] & 0x7f) << shift
        if not (b[0] & 0x80):
            return value, raw
        shift += 7
        if shift > 35:
            raise ValueError('varint 过长')


def send_frame(tls, tag: int, payload: bytes = b'') -> None:
    frame = bytes([tag]) + pb.encode_varint(len(payload)) + payload
    tls.sendall(frame)
    log('SENT tag=%d(%s) len=%d' % (tag, pb.TAG_NAMES.get(tag, '?'), len(payload)))
    hexdump(payload, 'SENT ')


# ============================================================ 花名册/在线状态
class Roster:
    """静态花名册（仅在用 --roster 指定 JSON 时使用）。"""

    def __init__(self, entries: List[dict]):
        self._entries = entries

    @classmethod
    def load(cls, path: Optional[str]) -> Optional['Roster']:
        if not path:
            return None
        with open(path, encoding='utf-8') as fh:
            data = json.load(fh)
        if isinstance(data, dict):
            data = data.get('roster', [])
        return cls(data)

    @property
    def entries(self) -> List[dict]:
        return self._entries

    def item_bytes(self) -> List[bytes]:
        out = []
        for e in self.entries:
            out.append(pb.build_roster_item(
                jid=e['jid'],
                name=e.get('name') or e['jid'],
                subscription=pb.SUBSCRIPTION_BOTH,
                groups=tuple(e.get('groups') or ()),
                # 客户端好友列表默认走“常用联系人”过滤条件：
                #   account=? AND type!=3 AND subscriptionType>=4
                #   AND (qc=1 OR last_message_date!=0 OR subscriptionType=5)
                # 只有把条目标成 quick contact，才会出现在列表里。
                quick_contact=True,
            ))
        return out

    def presence_bytes(self, to: Optional[str]) -> List[bytes]:
        out = []
        for e in self.entries:
            out.append(self._presence_for(e, to))
        return out

    def _presence_for(self, e: dict, to: Optional[str]) -> bytes:
        if not e.get('online'):
            return pb.build_presence_stanza(
                from_=e['jid'], to=to, ptype=pb.PRESENCE_UNAVAILABLE)
        show = e.get('show')
        show_val = None
        if show == 'away':
            show_val = pb.SHOW_AWAY
        elif show == 'dnd':
            show_val = pb.SHOW_DND
        elif show == 'xa':
            show_val = pb.SHOW_XA
        return pb.build_presence_stanza(
            from_=e['jid'], to=to, show=show_val,
            status=e.get('status') or None,
            client_type=pb.CLIENT_ANDROID,
            avatar_hash=((AVATARS.get(e['jid'].lower()) or {}).get('hash')))

    def find(self, jid: str) -> Optional[dict]:
        bare = jid.split('/', 1)[0].lower()
        for e in self.entries:
            if e['jid'].lower() == bare:
                return e
        return None


class DynamicRoster(Roster):
    """按“当前在线会话”实时生成的花名册：好友就是其它真实设备。"""

    def __init__(self, registry: 'PeerRegistry', self_user: Optional[str]):
        self.registry = registry
        self.self_user = (self_user or '').lower()

    @property
    def entries(self) -> List[dict]:
        out = []
        for jid in self.registry.known():
            if jid == self.self_user:
                continue
            sess = self.registry.find(jid)
            out.append({
                'jid': jid,
                'name': display_name(jid),
                'groups': ['Friends'],
                'online': sess is not None and not sess._closed,
                'status': (sess.status if sess else '') or '',
            })
        return out


# ============================================================ 在线会话表
class PeerRegistry:
    """记录当前在线的会话，供动态花名册与消息路由使用。

    以**裸 JID**（user@domain）为键；同时按本地名（user）建一份索引，
    因为 Talk 客户端发消息时 to 字段用的是联系人的本地名。
    """

    def __init__(self):
        self._lock = threading.Lock()
        self._sessions: Dict[str, 'Session'] = {}
        self._by_local: Dict[str, 'Session'] = {}
        self._known: List[str] = []

    def register(self, session: 'Session') -> None:
        if not session.user:
            return
        bare = session.user.lower()
        with self._lock:
            self._sessions[bare] = session
            self._by_local[bare.split('@', 1)[0]] = session
            if bare not in self._known:
                self._known.append(bare)

    def unregister(self, session: 'Session') -> None:
        if not session.user:
            return
        bare = session.user.lower()
        with self._lock:
            if self._sessions.get(bare) is session:
                del self._sessions[bare]
            if self._by_local.get(bare.split('@', 1)[0]) is session:
                del self._by_local[bare.split('@', 1)[0]]

    def online(self) -> List['Session']:
        with self._lock:
            return [s for s in self._sessions.values() if not s._closed]

    def known(self) -> List[str]:
        with self._lock:
            return list(self._known)

    def find(self, jid: str) -> Optional['Session']:
        bare = jid.split('/', 1)[0].lower()
        with self._lock:
            s = self._sessions.get(bare)
            if s is None:
                s = self._by_local.get(bare.split('@', 1)[0])
            return s


REGISTRY = PeerRegistry()

# 用户头像：裸 JID -> {'data': bytes, 'hash': sha1hex}
# 客户端通过 vCard（扩展 ID=4）上传/下载头像。
AVATARS: Dict[str, Dict[str, object]] = {}


def avatar_hash(data: bytes) -> str:
    """与客户端 VCard.getAvatarHash() 一致：SHA-1 的十六进制。"""
    return hashlib.sha1(data).hexdigest()


AVATAR_FILE = os.environ.get('AVATAR_FILE', 'logs/avatars.json')


def load_avatars() -> None:
    """启动时把上次存下的头像读回来（服务器重启后仍然有效）。"""
    try:
        with open(AVATAR_FILE, encoding='utf-8') as fh:
            data = json.load(fh)
        for jid, rec in data.items():
            AVATARS[jid] = {'data': base64.b64decode(rec['data']),
                            'hash': rec['hash']}
        log('已载入 %d 个头像' % len(AVATARS))
    except (OSError, ValueError, KeyError):
        pass


def save_avatars() -> None:
    try:
        os.makedirs(os.path.dirname(AVATAR_FILE) or '.', exist_ok=True)
        with open(AVATAR_FILE, 'w', encoding='utf-8') as fh:
            json.dump({j: {'data': base64.b64encode(v['data']).decode(),
                           'hash': v['hash']}
                       for j, v in AVATARS.items()}, fh)
    except OSError:
        pass


def broadcast_roster_update(exclude: Optional['Session'] = None) -> None:
    """好友上线/下线后，让其余会话刷新花名册与在线状态。"""
    for s in REGISTRY.online():
        if s is exclude:
            continue
        try:
            s.send_roster('roster-%d' % int(time.time() * 1000))
            s.send_batch_presence()
        except Exception as exc:
            log('刷新花名册失败：%r' % (exc,))


# ============================================================ 连接会话
class Session:
    """一条客户端连接。"""

    def __init__(self, tls, addr, roster: Optional[Roster], args):
        self.tls = tls
        self.addr = addr
        self.static_roster = roster
        self.roster: Optional[Roster] = roster
        self.args = args
        self.jid: Optional[str] = None
        self.user: Optional[str] = None
        self.domain: Optional[str] = None
        self.resource: Optional[str] = None
        self.local: Optional[str] = None
        self.status: Optional[str] = None
        self.show: Optional[int] = None
        self.invisible: bool = False
        self._send_lock = threading.Lock()
        self._closed = False
        self._hb_stop = threading.Event()
        self._outbox: List[dict] = []
        self._outbox_lock = threading.Lock()

    # -------------------------------------------------- 发送
    def send(self, tag: int, payload: bytes) -> None:
        with self._send_lock:
            if self._closed:
                return
            try:
                send_frame(self.tls, tag, payload)
            except Exception as exc:      # 连接已断开
                log('发送失败: %r' % (exc,))
                self._closed = True

    def send_roster(self, packet_id: str, etag: Optional[str] = None) -> None:
        if self.roster is None:
            return
        payload = pb.build_roster_response(
            packet_id, tuple(self.roster.item_bytes()), etag=etag,
            avatar_size=self.args.avatar_size, to=self.jid)
        self.send(pb.TAG_IQ, payload)
        log('已下发花名册：%d 位好友' % len(self.roster.entries))

    def send_batch_presence(self) -> None:
        if self.roster is None:
            return
        presences = tuple(self.roster.presence_bytes(self.jid))
        payload = pb.build_batch_presence(
            packet_id='bp-%d' % int(time.time() * 1000),
            to=self.jid, presences=presences)
        self.send(pb.TAG_BATCH_PRESENCE, payload)
        online = sum(1 for e in self.roster.entries if e.get('online'))
        log('已下发批量在线状态：%d/%d 在线' % (online, len(self.roster.entries)))

    def send_presence_for(self, jid: str) -> None:
        e = self.roster.find(jid)
        if e is None:
            return
        payload = self.roster._presence_for(e, self.jid)
        self.send(pb.TAG_PRESENCE, payload)

    def _presence_show(self) -> Optional[int]:
        """把 SharedStatus 的 show 映射成 presence 的 show。"""
        if self.show == 1:          # dnd
            return pb.SHOW_DND
        if self.show == 2:          # away
            return pb.SHOW_AWAY
        return None                 # available

    def broadcast_presence(self) -> None:
        """把自己的在线状态/签名发给其它所有在线设备。"""
        entry = AVATARS.get((self.user or '').lower())
        hash_ = entry['hash'] if entry else None
        for s in REGISTRY.online():
            if s is self:
                continue
            stanza = pb.build_presence_stanza(
                from_=self.user, to=s.jid,
                ptype=(pb.PRESENCE_UNAVAILABLE if self.invisible else None),
                show=self._presence_show(),
                status=self.status or None,
                client_type=pb.CLIENT_ANDROID,
                avatar_hash=hash_)
            s.send(pb.TAG_PRESENCE, stanza)

    def send_chat(self, from_jid: str, text: str,
                  to: Optional[str] = None) -> None:
        payload = pb.build_message_stanza(
            packet_id=next_message_id(),
            mtype=pb.MSG_CHAT, from_=from_jid, to=to or self.jid,
            body=text, timestamp=next_timestamp())
        self.send(pb.TAG_MESSAGE, payload)
        log('已下发聊天消息 from=%s: %s' % (from_jid, text))

    def send_ping(self) -> None:
        self.send(pb.TAG_HEARTBEAT_PING, b'')

    def _schedule_batch_presence(self) -> None:
        delay = getattr(self.args, 'presence_delay', 0)
        if delay <= 0:
            self.send_batch_presence()
            return
        threading.Timer(delay, self.send_batch_presence).start()

    # -------------------------------------------------- 心跳
    def start_heartbeat(self) -> None:
        interval = self.args.heartbeat_interval
        if interval <= 0:
            return

        def loop():
            while not self._hb_stop.wait(interval):
                if self._closed:
                    return
                self.send_ping()

        threading.Thread(target=loop, daemon=True).start()

    # -------------------------------------------------- 控制命令循环
    def start_command_loop(self) -> None:
        """独立线程周期性地执行控制命令。

        不能只在收到客户端帧时 drain：客户端空闲时不会有帧，命令会一直积压。
        """
        def loop():
            while not self._closed:
                time.sleep(0.3)
                self._drain_commands()

        threading.Thread(target=loop, daemon=True).start()

    # -------------------------------------------------- 控制文件
    def enqueue_command(self, cmd: dict) -> None:
        with self._outbox_lock:
            self._outbox.append(cmd)

    def _drain_commands(self) -> None:
        with self._outbox_lock:
            cmds, self._outbox = self._outbox, []
        for cmd in cmds:
            self._handle_command(cmd)

    def _handle_command(self, cmd: dict) -> None:
        # 可选：命令里带 "to" 时只发给该账号（便于精确给某台设备发消息）。
        to = (cmd.get('to') or '').lower()
        if to and (self.user or '').lower() != to:
            return
        kind = cmd.get('cmd')
        if kind == 'chat':
            self.send_chat(cmd.get('from', 'bob@gmail.com'),
                           cmd.get('text', '你好'))
        elif kind == 'presence':
            e = self.roster.find(cmd['jid'])
            if e is not None:
                e['online'] = bool(cmd.get('online', True))
                if 'status' in cmd:
                    e['status'] = cmd['status']
                self.send_presence_for(e['jid'])
        elif kind == 'roster':
            self.send_roster('roster-%d' % int(time.time() * 1000))
        elif kind == 'batch':
            self.send_batch_presence()
        elif kind == 'ping':
            self.send_ping()
        else:
            log('未知控制命令: %r' % (cmd,))

    # -------------------------------------------------- 入站帧
    def handle(self) -> None:
        log('连接来自 %s' % (self.addr,))
        if getattr(self.args, 'plain', False):
            # 明文模式：不做 TLS，直接在裸 TCP 上跑 MCS。
            # 这样生产机（ro.secure=1）无需装 CA、也无需 socket.relaxsslcheck。
            log('明文模式：不使用 TLS')
        else:
            try:
                ctx = ssl.SSLContext(ssl.PROTOCOL_TLS_SERVER)
                ctx.minimum_version = ssl.TLSVersion.TLSv1
                ctx.maximum_version = ssl.TLSVersion.TLSv1_2
                ctx.set_ciphers('AES128-SHA:AES256-SHA:DES-CBC3-SHA:@SECLEVEL=0')
                ctx.load_cert_chain(self.args.cert, self.args.key)
                self.tls = ctx.wrap_socket(self.tls, server_side=True)
                log('TLS 已建立：%s %s' % (self.tls.version(), self.tls.cipher()))
            except Exception as exc:
                log('TLS 失败：%r' % (exc,))
                self._close_raw()
                return

        try:
            # 双方各先发一个版本字节，客户端才肯发数据。
            self.tls.sendall(b'\x04')
            log('已发送 MCS 版本字节 0x04')
            client_version = read_exact(self.tls, 1)[0]
            log('客户端 MCS 版本字节 = 0x%02x' % client_version)
        except Exception as exc:
            log('版本握手失败：%r' % (exc,))
            self._close_raw()
            return

        self.start_heartbeat()
        self.start_command_loop()
        try:
            self._loop()
        except Exception as exc:
            log('连接结束：%r' % (exc,))
        finally:
            self._hb_stop.set()
            self._closed = True
            try:
                self.tls.close()
            except Exception:
                pass
            REGISTRY.unregister(self)
            broadcast_roster_update(exclude=self)

    def _close_raw(self):
        self._closed = True
        try:
            self.tls.close()
        except Exception:
            pass

    def _loop(self) -> None:
        while True:
            tag = read_exact(self.tls, 1)[0]
            length, _ = read_varint(self.tls)
            payload = read_exact(self.tls, length) if length else b''
            log('FRAME tag=%d(%s) len=%d' % (tag, pb.TAG_NAMES.get(tag, '?'), length))
            hexdump(payload)
            self._drain_commands()
            self._dispatch(tag, payload)

    def _dispatch(self, tag: int, payload: bytes) -> None:
        if tag == pb.TAG_LOGIN_REQUEST:
            self._on_login(payload)
        elif tag == pb.TAG_IQ:
            self._on_iq(payload)
        elif tag == pb.TAG_PRESENCE:
            self._on_presence(payload)
        elif tag == pb.TAG_BATCH_PRESENCE:
            self._on_batch_presence(payload)
        elif tag == pb.TAG_MESSAGE:
            self._on_message(payload)
        elif tag == pb.TAG_HEARTBEAT_PING:
            self.send(pb.TAG_HEARTBEAT_ACK, b'')
        elif tag == pb.TAG_HEARTBEAT_ACK:
            log('收到心跳应答')
        elif tag == pb.TAG_CLOSE:
            log('客户端请求关闭连接')
            self._closed = True

    # -------------------------------------------------- 各帧处理
    def _on_login(self, payload: bytes) -> None:
        req = pb.parse_login_request(payload)
        log('LOGIN_REQUEST id=%s user=%s@%s resource=%s'
            % (req.packet_id, req.user, req.domain, req.resource))
        self.jid = req.jid
        self.domain = req.domain
        self.resource = req.resource
        # self.user 用裸 JID（user@domain）：好友列表与消息路由都以它为准。
        self.user = ('%s@%s' % (req.user, req.domain)) if req.domain else req.user
        self.local = req.user
        self.send(pb.TAG_LOGIN_RESPONSE,
                  pb.build_login_response(req.packet_id or '', req.jid))
        log('LOGIN_RESPONSE jid=%s' % req.jid)
        # 注册到全局在线表；没有 --roster 时用动态花名册（好友=其它真实设备）。
        if self.static_roster is not None:
            self.roster = self.static_roster
        else:
            self.roster = DynamicRoster(REGISTRY, self.user)
        REGISTRY.register(self)
        # 通知其它设备：有新好友上线了。
        broadcast_roster_update(exclude=self)

    def _on_iq(self, payload: bytes) -> None:
        iq = pb.Iq(payload)
        log('IQ %r' % (iq,))
        if iq.ext_id == pb.EXT_POST_AUTH_BATCH_QUERY:
            # 登录后客户端发的初始批量查询（扩展 ID=11）。它同时把
            # hasRequestedRoster 置为 true，所以客户端不会再单独发花名册请求。
            # 服务器应直接把花名册（扩展 ID=1）+ 在线状态推下去。
            info = pb.parse_post_auth_batch_query(iq.ext_data or b'')
            log('POST_AUTH_BATCH_QUERY online=%s roster_etag=%r'
                % (info['online'], info['roster_etag']))
            self.send_roster(iq.packet_id or 'roster-0',
                             etag=self.args.roster_etag)
            self._schedule_batch_presence()
        elif iq.ext_id == pb.EXT_ROSTER_QUERY:
            # 单独的花名册请求（扩展 ID=1）：同样回 RESULT + 花名册。
            self.send_roster(iq.packet_id or 'roster-0',
                             etag=self.args.roster_etag)
            self._schedule_batch_presence()
        elif iq.ext_id == pb.EXT_SHARED_STATUS:
            # 客户端改“签名 / 在线状态”时发的是 SharedStatus IQ（扩展 ID=5），
            # 而不是 presence。解析出签名与 show，回 RESULT 并转发给其它设备。
            ss = pb.parse_shared_status(iq.ext_data or b'')
            self.status = ss.get('status') or ''
            self.show = ss.get('show')
            self.invisible = bool(ss.get('invisible'))
            log('SHARED_STATUS status=%r show=%s invisible=%s'
                % (self.status, self.show, self.invisible))
            self.send(pb.TAG_IQ, pb.build_iq_stanza(
                pb.IQ_TYPE_RESULT, packet_id=iq.packet_id,
                from_=iq.to, to=iq.from_))
            self.broadcast_presence()
        elif iq.ext_id == pb.EXT_VCARD:
            # 头像（vCard，扩展 ID=4）：SET 是上传自己的头像，GET 是请求别人的。
            vc = pb.parse_vcard(iq.ext_data or b'')
            photo = vc.get('photo') or {}
            data = photo.get('data')
            if iq.iq_type == pb.IQ_TYPE_SET and data:
                AVATARS[self.user.lower()] = {
                    'data': data, 'hash': avatar_hash(data)}
                save_avatars()
                log('VCARD 上传头像 user=%s %d 字节' % (self.user, len(data)))
                self.send(pb.TAG_IQ, pb.build_iq_stanza(
                    pb.IQ_TYPE_RESULT, packet_id=iq.packet_id,
                    from_=iq.to, to=iq.from_))
                # 头像变了，通知其它设备（presence 里带新的 avatar hash）。
                self.broadcast_presence()
            else:
                target = (iq.to or '').split('/', 1)[0].lower()
                entry = AVATARS.get(target)
                self.send(pb.TAG_IQ, pb.build_vcard_response(
                    packet_id=iq.packet_id, to=iq.from_, from_=target,
                    photo=(entry or {}).get('data')))
                log('VCARD 下发头像 target=%s has=%s' % (target, bool(entry)))
        elif iq.iq_type in (pb.IQ_TYPE_GET, pb.IQ_TYPE_SET):
            # 其它 GET/SET：回一个空的 RESULT，避免客户端一直等。
            self.send(pb.TAG_IQ, pb.build_iq_stanza(
                pb.IQ_TYPE_RESULT, packet_id=iq.packet_id,
                from_=iq.to, to=iq.from_))

    def _on_presence(self, payload: bytes) -> None:
        p = pb.Presence(payload)
        log('PRESENCE %r' % (p,))
        if p.ptype == pb.PRESENCE_PROBE and p.from_:
            # 客户端探测某位好友的在线状态。
            self.send_presence_for(p.from_)
            return
        if p.ptype == pb.PRESENCE_SUBSCRIBE and p.to:
            # 好友邀请：A 请求订阅 B。回 SUBSCRIBED 给 A，并把邀请转给 B。
            to = p.to.split('/', 1)[0].lower()
            target = REGISTRY.find(to)
            self.send(pb.TAG_PRESENCE, pb.build_presence_stanza(
                from_=to, to=self.jid, ptype=pb.PRESENCE_SUBSCRIBED))
            if target is not None:
                target.send(pb.TAG_PRESENCE, pb.build_presence_stanza(
                    from_=self.user, to=target.jid,
                    ptype=pb.PRESENCE_SUBSCRIBE))
            log('好友邀请：%s -> %s' % (self.user, to))
            return
        if p.ptype in (pb.PRESENCE_SUBSCRIBED, pb.PRESENCE_UNSUBSCRIBE,
                       pb.PRESENCE_UNSUBSCRIBED):
            # 订阅/退订的确认：原样转给对方即可。
            to = (p.to or '').split('/', 1)[0].lower()
            target = REGISTRY.find(to) if to else None
            if target is not None:
                target.send(pb.TAG_PRESENCE, pb.build_presence_stanza(
                    from_=self.user, to=target.jid, ptype=p.ptype))
            return
        # 客户端上报自己的在线状态（from 为空）：更新状态并告知其它设备。
        self.status = p.status or ''
        self.show = p.show
        for s in REGISTRY.online():
            if s is self:
                continue
            stanza = pb.build_presence_stanza(
                from_=self.user, to=s.jid,
                ptype=p.ptype, show=p.show, status=p.status,
                client_type=pb.CLIENT_ANDROID)
            s.send(pb.TAG_PRESENCE, stanza)

    def _on_batch_presence(self, payload: bytes) -> None:
        info = pb.parse_batch_presence(payload)
        log('BATCH_PRESENCE id=%s 请求 %d 条'
            % (info['packet_id'], len(info['presences'])))
        # 无论客户端问哪些，直接回全部在线状态。
        self.send_batch_presence()

    def _on_message(self, payload: bytes) -> None:
        m = pb.Message(payload)
        log('MESSAGE %r' % (m,))
        to = (m.to or '').split('/', 1)[0].lower()
        if not to:
            log('消息缺少收件人，忽略')
            return
        target = REGISTRY.find(to)
        if target is None:
            log('收件人不在线：%s' % to)
            return
        # 转发给对端：from 用裸 JID，收件人的好友列表里才认得这个人。
        out = pb.build_message_stanza(
            packet_id=next_message_id(),
            mtype=pb.MSG_CHAT,
            from_=self.user,
            to=target.jid,
            body=m.body or '',
            timestamp=next_timestamp())
        target.send(pb.TAG_MESSAGE, out)
        log('转发消息 %s -> %s: %s' % (self.user, to, m.body))


# ============================================================ 控制文件
class ControlWatcher:
    """轮询一个 JSONL 文件，把命令分发给当前所有会话。

    每行一条 JSON，例如：
        {"cmd": "chat", "from": "bob@gmail.com", "text": "你好"}
        {"cmd": "presence", "jid": "carol@gmail.com", "online": true}
        {"cmd": "roster"}
        {"cmd": "batch"}
        {"cmd": "ping"}
    """

    def __init__(self, path: str, sessions: List[Session]):
        self.path = path
        self.sessions = sessions
        self._offset = 0
        self._stop = threading.Event()

    def start(self) -> None:
        os.makedirs(os.path.dirname(self.path) or '.', exist_ok=True)
        open(self.path, 'a').close()
        self._offset = os.path.getsize(self.path)
        threading.Thread(target=self._loop, daemon=True).start()
        log('控制文件已启用：%s（追加 JSONL 行即可下发命令）' % self.path)

    def _loop(self) -> None:
        while not self._stop.wait(0.5):
            try:
                size = os.path.getsize(self.path)
                if size < self._offset:
                    self._offset = size
                if size == self._offset:
                    continue
                with open(self.path, encoding='utf-8') as fh:
                    fh.seek(self._offset)
                    lines = fh.readlines()
                    self._offset = fh.tell()
            except OSError:
                continue
            for line in lines:
                line = line.strip()
                if not line:
                    continue
                try:
                    cmd = json.loads(line)
                except ValueError:
                    log('控制文件：无法解析 %r' % line)
                    continue
                # 顺手清掉已断开的会话，避免列表无限增长。
                self.sessions[:] = [s for s in self.sessions if not s._closed]
                for s in list(self.sessions):
                    s.enqueue_command(cmd)


# ============================================================ 主程序
SESSIONS: List[Session] = []
SESSIONS_LOCK = threading.Lock()


def serve_forever(args) -> None:
    roster = Roster.load(args.roster)
    load_avatars()
    if args.control:
        ControlWatcher(args.control, SESSIONS).start()

    srv = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    srv.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    srv.bind((args.host, args.port))
    srv.listen(8)
    if roster is None:
        log('监听 %s:%d，动态花名册（好友=在线的其它设备）' % (args.host, args.port))
    else:
        log('监听 %s:%d，静态好友数=%d' % (args.host, args.port, len(roster.entries)))

    while True:
        conn, addr = srv.accept()
        session = Session(conn, addr, roster, args)
        with SESSIONS_LOCK:
            SESSIONS.append(session)
        threading.Thread(target=session.handle, daemon=True).start()


def parse_args(argv=None):
    parser = argparse.ArgumentParser(description='私有 MTalk/MCS 服务器')
    parser.add_argument('--host', default=HOST)
    parser.add_argument('--port', type=int, default=PORT)
    parser.add_argument('--cert', default=CERT)
    parser.add_argument('--key', default=KEY)
    parser.add_argument('--plain', action='store_true',
                        help='明文模式：不使用 TLS（本地网络推荐，免 CA）')
    parser.add_argument('--roster', default=None,
                        help='静态好友列表 JSON（默认动态：好友=在线的其它设备）')
    parser.add_argument('--roster-etag', default='liangmian-1',
                        help='花名册 etag（客户端会缓存，用于增量更新）')
    parser.add_argument('--avatar-size', type=int, default=0,
                        help='花名册里请求头像的边长（0=不要头像）')
    parser.add_argument('--heartbeat-interval', type=float, default=0,
                        help='服务器主动心跳间隔秒数（0=关闭）')
    parser.add_argument('--presence-delay', type=float, default=1.5,
                        help='花名册下发后延迟多少秒再推在线状态（默认 1.5）')
    parser.add_argument('--control', default=None,
                        help='控制文件路径（JSONL），用于手动下发消息/状态')
    parser.add_argument('--quiet', action='store_true', help='不打印帧十六进制')
    return parser.parse_args(argv)


def main(argv=None) -> None:
    global _VERBOSE
    args = parse_args(argv)
    _VERBOSE = not args.quiet
    serve_forever(args)


if __name__ == '__main__':
    main()
