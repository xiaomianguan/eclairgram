#!/usr/bin/env python3
"""本地冒烟客户端：模拟 Android 2.1 Talk 的 MCS 会话，验证服务器行为。

它不依赖模拟器，用和客户端**相同的字段读取方式**（见 test_mcs_proto 里的
sim_* 函数）解析服务器回包，因此可以离线确认花名册/在线状态/消息的线格式。

用法：
    python3 server/mtalk_server.py --cert certs/alt/server2.crt \
        --key certs/alt/server2.key --port 15228 &
    python3 server/smoke_client.py --port 15228
"""
import argparse
import os
import socket
import ssl
import sys
import time

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

import mcs_proto as pb  # noqa: E402
from test_mcs_proto import (  # noqa: E402
    sim_parse_iq, sim_parse_roster, sim_parse_batch_presence,
    sim_parse_message)


def read_exact(sock, n):
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
    while True:
        b = read_exact(sock, 1)[0]
        value |= (b & 0x7f) << shift
        if not (b & 0x80):
            return value
        shift += 7


def read_frame(sock):
    tag = read_exact(sock, 1)[0]
    length = read_varint(sock)
    payload = read_exact(sock, length) if length else b''
    return tag, payload


def send_frame(sock, tag, payload=b''):
    sock.sendall(bytes([tag]) + pb.encode_varint(len(payload)) + payload)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--host', default='127.0.0.1')
    ap.add_argument('--port', type=int, default=5228)
    ap.add_argument('--plain', action='store_true',
                    help='明文模式：不使用 TLS')
    args = ap.parse_args()

    raw = socket.create_connection((args.host, args.port), timeout=5)
    if args.plain:
        tls = raw
        print('plain TCP (no TLS)')
    else:
        ctx = ssl.SSLContext(ssl.PROTOCOL_TLS_CLIENT)
        ctx.check_hostname = False
        ctx.verify_mode = ssl.CERT_NONE
        ctx.minimum_version = ssl.TLSVersion.TLSv1
        ctx.maximum_version = ssl.TLSVersion.TLSv1_2
        ctx.set_ciphers('AES128-SHA:AES256-SHA:DES-CBC3-SHA:@SECLEVEL=0')
        tls = ctx.wrap_socket(raw, server_hostname='mtalk.google.com')
        print('TLS:', tls.version(), tls.cipher())

    tls.sendall(b'\x04')
    server_version = read_exact(tls, 1)[0]
    assert server_version == 4, server_version
    print('版本字节 OK: 0x%02x' % server_version)

    # 1) LOGIN_REQUEST
    login = (pb.pb_string(1, 'smoke-1') + pb.pb_string(2, 'gmail.com')
             + pb.pb_string(3, 'tester') + pb.pb_string(4, 'android-smoke')
             + pb.pb_string(5, 'PRIVATE_mail_tester@gmail.com')
             + pb.pb_string(6, 'android-smoke'))
    send_frame(tls, pb.TAG_LOGIN_REQUEST, login)
    tag, payload = read_frame(tls)
    assert tag == pb.TAG_LOGIN_RESPONSE, tag
    f = pb.parse_fields(payload)
    jid = pb.get_string(f, 2)
    print('LOGIN_RESPONSE jid=%s' % jid)
    assert jid.startswith('tester@gmail.com/')

    # 2) 花名册查询（扩展 ID = 1）
    ext = pb.build_extension(pb.EXT_ROSTER_QUERY, pb.build_roster_query(etag=''))
    iq = pb.build_iq_stanza(pb.IQ_TYPE_GET, packet_id='smoke-roster',
                            extension=ext)
    send_frame(tls, pb.TAG_IQ, iq)

    tag, payload = read_frame(tls)
    assert tag == pb.TAG_IQ, tag
    out = sim_parse_iq(payload)
    assert out['id'] == 'smoke-roster'
    assert out['iq_type'] == pb.IQ_TYPE_RESULT
    assert out['ext_id'] == pb.EXT_ROSTER_QUERY
    roster = sim_parse_roster(out['ext_data'])
    print('花名册 %d 位：' % len(roster['items']))
    for it in roster['items']:
        print('   - %-20s %-10s sub=%s groups=%s'
              % (it['jid'], it['name'], it['subscription'], it['groups']))
    assert len(roster['items']) > 0

    # 3) 批量在线状态
    tag, payload = read_frame(tls)
    assert tag == pb.TAG_BATCH_PRESENCE, tag
    bp = sim_parse_batch_presence(payload)
    print('批量在线状态 %d 条：' % len(bp['presences']))
    for p in bp['presences']:
        state = 'AVAILABLE' if p['type'] is None else 'type=%s' % p['type']
        print('   - %-20s %-10s %s' % (p['from'], state, p['status']))

    # 4) 心跳
    send_frame(tls, pb.TAG_HEARTBEAT_PING, b'')
    tag, payload = read_frame(tls)
    assert tag == pb.TAG_HEARTBEAT_ACK, tag
    print('心跳 PING -> ACK OK')

    print('\n冒烟测试全部通过 ✅')
    tls.close()


if __name__ == '__main__':
    main()
