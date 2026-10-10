#!/usr/bin/env python3
"""MCS / MTalk protobuf 编解码工具（纯标准库）。

字段编号全部来自反编译产物，权威来源：

  * 外层帧 tag：com/google/android/gtalkservice/proto/MobileProtoBufStreamConfiguration
  * 各消息字段：com/google/android/gtalkservice/proto/*.smali（接口常量）
    以及 GtalkCoreMessageTypes / GtalkExtensionsMessageTypes 里的
    ProtoBufType.addElement(type, field, default) 调用。

客户端解析入口（务必对齐，否则界面不会更新）：

  * LOGIN_RESPONSE : PacketReader.parseLoginResponse
  * IQ_STANZA      : PacketReader.parseIQ(ProtoBuf) + parseRoster(ProtoBuf)
  * PRESENCE_STANZA: PacketParserUtils.parsePresence(ProtoBuf)
  * MESSAGE_STANZA : PacketParserUtils.parseMessage(ProtoBuf)
  * BATCH_PRESENCE : PacketParserUtils.parseBatchPresence(ProtoBuf)

本模块只做编解码，不含任何网络逻辑，便于单元测试。
"""
from __future__ import annotations

from typing import Dict, List, Optional, Tuple, Union

# ---------------------------------------------------------------- 外层帧 tag
TAG_HEARTBEAT_PING = 0
TAG_HEARTBEAT_ACK = 1
TAG_LOGIN_REQUEST = 2
TAG_LOGIN_RESPONSE = 3
TAG_CLOSE = 4
TAG_MESSAGE = 5
TAG_PRESENCE = 6
TAG_IQ = 7
TAG_DATA_MESSAGE = 8
TAG_BATCH_PRESENCE = 9
TAG_STREAM_ERROR = 10
TAG_HTTP_REQUEST = 11
TAG_HTTP_RESPONSE = 12

TAG_NAMES = {
    TAG_HEARTBEAT_PING: 'HEARTBEAT_PING',
    TAG_HEARTBEAT_ACK: 'HEARTBEAT_ACK',
    TAG_LOGIN_REQUEST: 'LOGIN_REQUEST',
    TAG_LOGIN_RESPONSE: 'LOGIN_RESPONSE',
    TAG_CLOSE: 'CLOSE',
    TAG_MESSAGE: 'MESSAGE_STANZA',
    TAG_PRESENCE: 'PRESENCE_STANZA',
    TAG_IQ: 'IQ_STANZA',
    TAG_DATA_MESSAGE: 'DATA_MESSAGE_STANZA',
    TAG_BATCH_PRESENCE: 'BATCH_PRESENCE_STANZA',
    TAG_STREAM_ERROR: 'STREAM_ERROR_STANZA',
    TAG_HTTP_REQUEST: 'HTTP_REQUEST',
    TAG_HTTP_RESPONSE: 'HTTP_RESPONSE',
}

# ------------------------------------------------------------ IQ 子扩展 ID
# 见 ProviderManager：0 与 1 在 PacketReader.parseIQ 里硬编码，其余来自各
# *Provider.getTag()。花名册应答必须用 EXT_ROSTER_QUERY。
EXT_XML_STANZA = 0
EXT_ROSTER_QUERY = 1
EXT_RMQ_LAST_ID = 2
EXT_RMQ_ACK = 3
EXT_VCARD = 4
EXT_SHARED_STATUS = 5
EXT_CHAT_READ = 6
EXT_CHAT_CLOSED = 7
EXT_OTR_QUERY = 9
EXT_IDLE = 10
# 登录后客户端先发 PostAuthBatchQuery（见 PostAuthBatchQuery.getExtensionProtoBuf：
# setInt(1, 0xb)），请求服务器把花名册/在线状态等一次性推下来。服务器应回应
# 一个扩展 ID=1 的花名册 IQ（parseIQ 里 case 1 -> parseRoster）。
EXT_POST_AUTH_BATCH_QUERY = 11
EXT_SELECTIVE_ACK = 12
EXT_STREAM_ACK = 13

# --------------------------------------------------------------- 枚举取值
# IqStanza.type
IQ_TYPE_GET = 0
IQ_TYPE_SET = 1
IQ_TYPE_RESULT = 2
IQ_TYPE_ERROR = 3

# RosterItem.subscription
SUBSCRIPTION_NONE = 0
SUBSCRIPTION_TO = 1
SUBSCRIPTION_FROM = 2
SUBSCRIPTION_BOTH = 3
SUBSCRIPTION_REMOVE = 4

# RosterItem.display (G_STATUS)
DISPLAY_DEFAULT = 0
DISPLAY_BLOCKED = 0   # 注意：parseRoster 的 switch 0->BLOCKED
DISPLAY_HIDDEN = 1
DISPLAY_PINNED = 2

# PresenceStanza.type（缺省 = AVAILABLE）
PRESENCE_UNAVAILABLE = 0
PRESENCE_SUBSCRIBE = 1
PRESENCE_SUBSCRIBED = 2
PRESENCE_UNSUBSCRIBE = 3
PRESENCE_UNSUBSCRIBED = 4
PRESENCE_PROBE = 5
PRESENCE_ERROR = 6

# PresenceStanza.show（缺省 = AVAILABLE）
SHOW_AWAY = 0
SHOW_CHAT = 1
SHOW_DND = 2
SHOW_XA = 3

# PresenceStanza.client
CLIENT_MOBILE = 0
CLIENT_ANDROID = 1

# MessageStanza.type
MSG_NORMAL = 0
MSG_CHAT = 1
MSG_GROUPCHAT = 2
MSG_HEADLINE = 3
MSG_ERROR = 4

WIRE_VARINT = 0
WIRE_64BIT = 1
WIRE_LENGTH = 2
WIRE_SGROUP = 3
WIRE_EGROUP = 4
WIRE_32BIT = 5


# ============================================================ 基础编码
def encode_varint(value: int) -> bytes:
    """无符号 LEB128（protobuf varint）。"""
    if value < 0:
        # protobuf 对 int32/int64 的负数是 10 字节补码形式；本服务器不使用负数。
        value &= (1 << 64) - 1
    out = bytearray()
    while True:
        b = value & 0x7f
        value >>= 7
        if value:
            out.append(b | 0x80)
        else:
            out.append(b)
            return bytes(out)


def _key(field: int, wire: int) -> bytes:
    return encode_varint((field << 3) | wire)


def pb_varint(field: int, value: int) -> bytes:
    return _key(field, WIRE_VARINT) + encode_varint(value)


def pb_bool(field: int, value: bool) -> bytes:
    return pb_varint(field, 1 if value else 0)


def pb_bytes(field: int, data: bytes) -> bytes:
    return _key(field, WIRE_LENGTH) + encode_varint(len(data)) + data


def pb_string(field: int, value: str) -> bytes:
    return pb_bytes(field, value.encode('utf-8'))


def pb_message(field: int, data: bytes) -> bytes:
    return pb_bytes(field, data)


# ============================================================ 基础解码
def decode_varint(data: bytes, i: int) -> Tuple[int, int]:
    value = 0
    shift = 0
    while True:
        if i >= len(data):
            raise ValueError('varint 越界')
        b = data[i]
        i += 1
        value |= (b & 0x7f) << shift
        if not (b & 0x80):
            return value, i
        shift += 7
        if shift > 70:
            raise ValueError('varint 过长')


def parse_fields(data: bytes, strict: bool = True) -> Dict[int, List[Tuple[int, Union[int, bytes]]]]:
    """把一段 protobuf 解析成 {字段号: [(wire, 值), ...]}。

    wire==0 -> int；wire==2 -> bytes；其余原样返回 bytes。
    strict=False 时，遇到未知 wire type（例如 SharedStatus 状态列表用的 protobuf
    group，wire=3/4）直接跳过，不抛异常。
    """
    out: Dict[int, List[Tuple[int, Union[int, bytes]]]] = {}
    i = 0
    while i < len(data):
        key, i = decode_varint(data, i)
        field = key >> 3
        wire = key & 7
        if wire == WIRE_VARINT:
            val, i = decode_varint(data, i)
        elif wire == WIRE_LENGTH:
            ln, i = decode_varint(data, i)
            if i + ln > len(data):
                raise ValueError('length-delimited 越界')
            val = data[i:i + ln]
            i += ln
        elif wire == WIRE_64BIT:
            val = data[i:i + 8]
            i += 8
        elif wire == WIRE_32BIT:
            val = data[i:i + 4]
            i += 4
        elif wire in (WIRE_SGROUP, WIRE_EGROUP):
            # protobuf group（开始/结束标记）：SharedStatus 的状态列表会用到。
            if strict:
                raise ValueError('未知 wire type %d' % wire)
            continue
        else:
            if strict:
                raise ValueError('未知 wire type %d' % wire)
            continue
        out.setdefault(field, []).append((wire, val))
    return out


def _first(fields, n):
    v = fields.get(n)
    return v[0][1] if v else None


def get_int(fields, n, default=None):
    v = _first(fields, n)
    return default if v is None else v


def get_bool(fields, n, default=False):
    v = _first(fields, n)
    return default if v is None else bool(v)


def get_string(fields, n, default=None):
    v = _first(fields, n)
    if v is None:
        return default
    return v.decode('utf-8', 'replace') if isinstance(v, bytes) else str(v)


def get_bytes(fields, n, default=None):
    v = _first(fields, n)
    return default if v is None else v


def get_messages(fields, n) -> List[bytes]:
    return [v for (wire, v) in fields.get(n, []) if wire == WIRE_LENGTH]


# ============================================================ 消息构造
def build_extension(ext_id: int, data: bytes) -> bytes:
    """Extension{ id=1, data=2 }（GtalkCoreMessageTypes.EXTENSION）。"""
    return pb_varint(1, ext_id) + pb_message(2, data)


def build_iq_stanza(iq_type: int, packet_id: Optional[str] = None,
                    from_: Optional[str] = None, to: Optional[str] = None,
                    extension: Optional[bytes] = None,
                    rmq_id: Optional[int] = None) -> bytes:
    """IqStanza（tag=7 的载荷）。"""
    out = b''
    if rmq_id is not None:
        out += pb_varint(1, rmq_id)
    out += pb_varint(2, iq_type)          # 必填：parseIQ 用 getInt(2)
    if packet_id is not None:
        out += pb_string(3, packet_id)
    if from_ is not None:
        out += pb_string(4, from_)
    if to is not None:
        out += pb_string(5, to)
    if extension is not None:
        out += pb_message(7, extension)
    return out


def build_roster_item(jid: str, name: Optional[str] = None,
                      subscription: Optional[int] = SUBSCRIPTION_BOTH,
                      ask: Optional[int] = None,
                      groups: Tuple[str, ...] = (),
                      quick_contact: Optional[bool] = None,
                      display: Optional[int] = None,
                      rejected: Optional[bool] = None) -> bytes:
    """RosterItem。jid 会由客户端转小写后写入 TalkProvider。"""
    out = pb_string(1, jid)
    if name is not None:
        out += pb_string(2, name)
    if subscription is not None:
        out += pb_varint(3, subscription)
    if ask is not None:
        out += pb_varint(4, ask)
    for g in groups:
        out += pb_string(5, g)
    if quick_contact is not None:
        out += pb_bool(6, quick_contact)
    if display is not None:
        out += pb_varint(7, display)
    if rejected is not None:
        out += pb_bool(8, rejected)
    return out


def build_roster_query(etag: Optional[str] = None,
                       not_modified: Optional[bool] = None,
                       items: Tuple[bytes, ...] = (),
                       avatar_width: Optional[int] = None,
                       avatar_height: Optional[int] = None) -> bytes:
    """RosterQuery（花名册应答的扩展数据）。"""
    out = b''
    if etag is not None:
        out += pb_string(1, etag)
    if not_modified is not None:
        out += pb_bool(2, not_modified)
    for it in items:
        out += pb_message(3, it)
    if avatar_width is not None:
        out += pb_varint(4, avatar_width)
    if avatar_height is not None:
        out += pb_varint(5, avatar_height)
    return out


def build_roster_response(packet_id: str, items: Tuple[bytes, ...],
                          etag: Optional[str] = None,
                          avatar_size: int = 0,
                          to: Optional[str] = None) -> bytes:
    """完整的花名册应答 IqStanza 载荷。"""
    query = build_roster_query(
        etag=etag, items=items,
        avatar_width=avatar_size, avatar_height=avatar_size)
    ext = build_extension(EXT_ROSTER_QUERY, query)
    return build_iq_stanza(IQ_TYPE_RESULT, packet_id=packet_id, to=to,
                           extension=ext)


def build_presence_stanza(from_: Optional[str] = None,
                          to: Optional[str] = None,
                          ptype: Optional[int] = None,
                          show: Optional[int] = None,
                          status: Optional[str] = None,
                          priority: Optional[int] = None,
                          client_type: Optional[int] = None,
                          avatar_hash: Optional[str] = None,
                          packet_id: Optional[str] = None) -> bytes:
    """PresenceStanza（tag=6 的载荷）。

    ptype 缺省 = AVAILABLE（parsePresence 的默认值）；UNAVAILABLE 要显式传 0。
    """
    out = b''
    if packet_id is not None:
        out += pb_string(3, packet_id)
    if ptype is not None:
        out += pb_varint(2, ptype)
    if from_ is not None:
        out += pb_string(4, from_)
    if to is not None:
        out += pb_string(5, to)
    if show is not None:
        out += pb_varint(6, show)
    if status is not None:
        out += pb_string(7, status)
    if priority is not None:
        out += pb_varint(8, priority)
    if client_type is not None:
        out += pb_varint(11, client_type)
    if avatar_hash is not None:
        out += pb_string(12, avatar_hash)
    return out


def build_batch_presence(packet_id: Optional[str] = None,
                         to: Optional[str] = None,
                         presences: Tuple[bytes, ...] = ()) -> bytes:
    """BatchPresenceStanza（tag=9 的载荷）。"""
    out = b''
    if packet_id is not None:
        out += pb_string(1, packet_id)
    if to is not None:
        out += pb_string(2, to)
    for p in presences:
        out += pb_message(3, p)
    return out


def build_message_stanza(packet_id: Optional[str] = None,
                         mtype: int = MSG_CHAT,
                         from_: Optional[str] = None,
                         to: Optional[str] = None,
                         body: Optional[str] = None,
                         subject: Optional[str] = None,
                         thread: Optional[str] = None,
                         timestamp: Optional[int] = None) -> bytes:
    """MessageStanza（tag=5 的载荷）。"""
    out = b''
    if packet_id is not None:
        out += pb_string(3, packet_id)
    if from_ is not None:
        out += pb_string(4, from_)
    if to is not None:
        out += pb_string(5, to)
    if subject is not None:
        out += pb_string(6, subject)
    if body is not None:
        out += pb_string(7, body)
    if thread is not None:
        out += pb_string(8, thread)
    if timestamp is not None:
        out += pb_varint(12, timestamp)
    out += pb_varint(2, mtype)
    return out


def build_login_response(packet_id: str, jid: str) -> bytes:
    """LOGIN_RESPONSE（tag=3 的载荷）。"""
    return pb_string(1, packet_id) + pb_string(2, jid)


# ============================================================ 请求解析
class LoginRequest:
    def __init__(self, packet_id, domain, user, resource, token, device_id):
        self.packet_id = packet_id
        self.domain = domain
        self.user = user
        self.resource = resource
        self.token = token
        self.device_id = device_id

    @property
    def jid(self):
        return '%s@%s/%s' % (self.user, self.domain, self.resource)


def parse_login_request(payload: bytes) -> LoginRequest:
    f = parse_fields(payload)
    return LoginRequest(
        packet_id=get_string(f, 1),
        domain=get_string(f, 2),
        user=get_string(f, 3),
        resource=get_string(f, 4),
        token=get_string(f, 5),
        device_id=get_string(f, 6),
    )


class Iq:
    def __init__(self, raw):
        self.raw = raw
        self.fields = parse_fields(raw)
        self.packet_id = get_string(self.fields, 3)
        self.iq_type = get_int(self.fields, 2, IQ_TYPE_GET)
        self.from_ = get_string(self.fields, 4)
        self.to = get_string(self.fields, 5)
        self.rmq_id = get_int(self.fields, 1)
        self.ext_id = None
        self.ext_data = None
        ext = get_bytes(self.fields, 7)
        if ext is not None:
            ef = parse_fields(ext)
            self.ext_id = get_int(ef, 1)
            self.ext_data = get_bytes(ef, 2)

    def __repr__(self):
        return 'Iq(id=%r type=%r ext=%r)' % (
            self.packet_id, self.iq_type, self.ext_id)


class Presence:
    def __init__(self, raw):
        self.raw = raw
        self.fields = parse_fields(raw)
        self.packet_id = get_string(self.fields, 3)
        self.ptype = get_int(self.fields, 2)   # None = AVAILABLE
        self.from_ = get_string(self.fields, 4)
        self.to = get_string(self.fields, 5)
        self.show = get_int(self.fields, 6)
        self.status = get_string(self.fields, 7)

    def __repr__(self):
        return 'Presence(from=%r type=%r)' % (self.from_, self.ptype)


class Message:
    def __init__(self, raw):
        self.raw = raw
        self.fields = parse_fields(raw)
        self.packet_id = get_string(self.fields, 3)
        self.mtype = get_int(self.fields, 2, MSG_NORMAL)
        self.from_ = get_string(self.fields, 4)
        self.to = get_string(self.fields, 5)
        self.body = get_string(self.fields, 7)

    def __repr__(self):
        return 'Message(from=%r to=%r body=%r)' % (
            self.from_, self.to, self.body)


def parse_batch_presence(payload: bytes):
    f = parse_fields(payload)
    return {
        'packet_id': get_string(f, 1),
        'to': get_string(f, 2),
        'presences': [Presence(p) for p in get_messages(f, 3)],
    }


def parse_shared_status(data: bytes) -> dict:
    """SharedStatus（扩展 ID=5）的请求数据。

    字段：4=STATUS（默认签名），5=SHOW（0=default，1=dnd），
    6=默认状态列表，7=DND 状态列表，9=INVISIBLE。
    客户端改“签名/在线状态”时就是发这个 IQ（不是 presence）。
    """
    f = parse_fields(data, strict=False)
    status = get_string(f, 4, '') or ''
    show = get_int(f, 5, 0)
    invisible = get_bool(f, 9)
    # 状态列表里也带签名（组内 field 8 是字符串）；默认签名取第一个非空的。
    statuses = []
    for field_no in (6, 7):
        for grp in get_messages(f, field_no):
            gf = parse_fields(grp)
            for s in get_messages(gf, 8):
                statuses.append(s.decode('utf-8', 'replace'))
    if not status and statuses:
        status = statuses[0]
    return {'status': status, 'show': show, 'invisible': invisible,
            'statuses': statuses}


def parse_vcard(data: bytes) -> dict:
    """VCard（扩展 ID=4）的请求/应答数据。

    字段：1=VERSION，2=FULL_NAME，3=PHOTO（子消息：1=mime，2=bytes），
    4=AVATAR_HASH，5=MODIFIED。
    客户端上传头像时带 PHOTO；请求头像时带 AVATAR_HASH（不带 PHOTO）。
    """
    f = parse_fields(data, strict=False)
    photo = None
    for grp in get_messages(f, 3):
        pf = parse_fields(grp, strict=False)
        photo = {
            'mime': get_string(pf, 1, 'image/jpeg'),
            'data': get_bytes(pf, 2),
        }
    return {
        'version': get_string(f, 1),
        'full_name': get_string(f, 2),
        'photo': photo,
        'avatar_hash': get_string(f, 4),
        'modified': get_bool(f, 5),
    }


def build_vcard_response(packet_id: Optional[str], to: Optional[str],
                         from_: Optional[str],
                         photo: Optional[bytes] = None,
                         mime: str = 'image/jpeg') -> bytes:
    """构造 vCard 应答（扩展 ID=4）。photo 为头像字节。"""
    vcard = b''
    if photo is not None:
        photo_msg = pb_string(1, mime) + pb_message(2, photo)
        vcard += pb_message(3, photo_msg)
    ext = build_extension(EXT_VCARD, vcard)
    return build_iq_stanza(IQ_TYPE_RESULT, packet_id=packet_id,
                           from_=from_, to=to, extension=ext)


def parse_post_auth_batch_query(data: bytes) -> dict:
    """PostAuthBatchQuery（扩展 ID=11）的请求数据。"""
    f = parse_fields(data)
    return {
        'online': get_bool(f, 1),
        'device_idle': get_bool(f, 2),
        'show_mobile_indicator': get_bool(f, 3),
        'shared_status_version': get_int(f, 4, 0),
        'roster_etag': get_string(f, 5),
        'otr_etag': get_string(f, 6),
        'avatar_hash': get_string(f, 7),
        'vcard_query_stanza_id': get_string(f, 8),
    }
