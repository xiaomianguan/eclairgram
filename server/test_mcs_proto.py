#!/usr/bin/env python3
"""对 MCS 编解码的单元测试。

关键思路：**模拟客户端的解析器**。每个 sim_* 函数都严格照着反编译出来的
parseRoster / parsePresence / parseMessage / parseBatchPresence 的字段读取顺序
实现，用服务器构造的字节喂给它，验证客户端最终能拿到什么。

运行：
    cd server && python3 -m unittest -v test_mcs_proto
"""
import json
import os
import sys
import tempfile
import unittest

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

import mcs_proto as pb  # noqa: E402


# ==================================================== 客户端解析器模拟
def sim_parse_iq(payload: bytes):
    """照 PacketReader.parseIQ(ProtoBuf)。"""
    f = pb.parse_fields(payload)
    out = {
        'id': pb.get_string(f, 3),
        'rmq_id': pb.get_int(f, 1),
        'from': pb.get_string(f, 4),
        'to': pb.get_string(f, 5),
        'iq_type': pb.get_int(f, 2, 0),
        'ext_id': None,
        'ext_data': None,
    }
    ext = pb.get_bytes(f, 7)
    if ext is not None:
        ef = pb.parse_fields(ext)
        out['ext_id'] = pb.get_int(ef, 1)
        out['ext_data'] = pb.get_bytes(ef, 2)
    return out


def sim_parse_roster(query: bytes):
    """照 PacketReader.parseRoster(ProtoBuf)。"""
    f = pb.parse_fields(query)
    out = {'etag': None, 'not_modified': None, 'items': []}
    if 1 in f:
        out['etag'] = pb.get_string(f, 1)
    elif 2 in f and pb.get_bool(f, 2):
        out['not_modified'] = True
    for raw in pb.get_messages(f, 3):
        it = pb.parse_fields(raw)
        item = {
            'jid': pb.get_string(it, 1),
            'name': pb.get_string(it, 2),
            'subscription': pb.get_int(it, 3),
            'ask': pb.get_int(it, 4),
            'groups': [v.decode('utf-8') for (w, v) in it.get(5, [])],
            'quick_contact': pb.get_bool(it, 6) if 6 in it else None,
            'display': pb.get_int(it, 7) if 7 in it else None,
            'rejected': pb.get_bool(it, 8) if 8 in it else None,
        }
        out['items'].append(item)
    return out


def sim_parse_presence(payload: bytes):
    """照 PacketParserUtils.parsePresence(ProtoBuf)。"""
    f = pb.parse_fields(payload)
    ptype = pb.get_int(f, 2)          # None -> AVAILABLE
    return {
        'id': pb.get_string(f, 3),
        'from': pb.get_string(f, 4),
        'to': pb.get_string(f, 5),
        'type': ptype,
        'show': pb.get_int(f, 6),
        'status': pb.get_string(f, 7),
        'priority': pb.get_int(f, 8, 0),
        'client': pb.get_int(f, 11),
    }


def sim_parse_batch_presence(payload: bytes):
    """照 PacketParserUtils.parseBatchPresence(ProtoBuf)。"""
    f = pb.parse_fields(payload)
    return {
        'id': pb.get_string(f, 1),
        'to': pb.get_string(f, 2),
        'presences': [sim_parse_presence(p) for p in pb.get_messages(f, 3)],
    }


def sim_parse_message(payload: bytes):
    """照 PacketParserUtils.parseMessage(ProtoBuf)。"""
    f = pb.parse_fields(payload)
    return {
        'id': pb.get_string(f, 3),
        'type': pb.get_int(f, 2, pb.MSG_NORMAL),
        'from': pb.get_string(f, 4),
        'to': pb.get_string(f, 5),
        'subject': pb.get_string(f, 6),
        'body': pb.get_string(f, 7),
        'thread': pb.get_string(f, 8),
        'timestamp': pb.get_int(f, 12),
    }


# ==================================================== 测试
class VarintTest(unittest.TestCase):
    def test_roundtrip(self):
        for v in (0, 1, 127, 128, 300, 0x146c, 2 ** 31, 2 ** 63 - 1):
            data = pb.encode_varint(v)
            got, end = pb.decode_varint(data, 0)
            self.assertEqual(got, v)
            self.assertEqual(end, len(data))

    def test_known_bytes(self):
        self.assertEqual(pb.encode_varint(300), b'\xac\x02')
        self.assertEqual(pb.encode_varint(0x146c), b'\xec\x28')


class FieldTest(unittest.TestCase):
    def test_string_and_varint_parse(self):
        data = pb.pb_string(3, 'hello') + pb.pb_varint(2, 5)
        f = pb.parse_fields(data)
        self.assertEqual(pb.get_string(f, 3), 'hello')
        self.assertEqual(pb.get_int(f, 2), 5)

    def test_utf8(self):
        data = pb.pb_string(7, '你好，世界')
        f = pb.parse_fields(data)
        self.assertEqual(pb.get_string(f, 7), '你好，世界')


class RosterTest(unittest.TestCase):
    def test_response_is_roster_result_with_ext_id_1(self):
        items = (
            pb.build_roster_item('alice@gmail.com', 'Alice',
                                 groups=('Friends',)),
            pb.build_roster_item('bob@gmail.com', 'Bob',
                                 groups=('Friends',)),
        )
        payload = pb.build_roster_response('req-42', items, etag='e1',
                                           to='me@gmail.com')
        iq = sim_parse_iq(payload)
        self.assertEqual(iq['id'], 'req-42')
        self.assertEqual(iq['iq_type'], pb.IQ_TYPE_RESULT)
        self.assertEqual(iq['ext_id'], pb.EXT_ROSTER_QUERY)
        self.assertEqual(iq['to'], 'me@gmail.com')

        roster = sim_parse_roster(iq['ext_data'])
        self.assertEqual(roster['etag'], 'e1')
        self.assertEqual([i['jid'] for i in roster['items']],
                         ['alice@gmail.com', 'bob@gmail.com'])
        self.assertEqual(roster['items'][0]['name'], 'Alice')
        self.assertEqual(roster['items'][0]['subscription'],
                         pb.SUBSCRIPTION_BOTH)
        self.assertEqual(roster['items'][0]['groups'], ['Friends'])

    def test_not_modified(self):
        payload = pb.build_roster_response('x', (), etag=None)
        # 没有 etag 时不应误判为 not_modified
        iq = sim_parse_iq(payload)
        roster = sim_parse_roster(iq['ext_data'])
        self.assertIsNone(roster['etag'])
        self.assertIsNone(roster['not_modified'])
        self.assertEqual(roster['items'], [])


class PresenceTest(unittest.TestCase):
    def test_available_omits_type(self):
        payload = pb.build_presence_stanza(
            from_='alice@gmail.com', to='me@gmail.com',
            status='hi', client_type=pb.CLIENT_ANDROID)
        p = sim_parse_presence(payload)
        self.assertIsNone(p['type'])          # 缺省即 AVAILABLE
        self.assertEqual(p['from'], 'alice@gmail.com')
        self.assertEqual(p['status'], 'hi')
        self.assertEqual(p['client'], pb.CLIENT_ANDROID)

    def test_unavailable_is_type_zero(self):
        payload = pb.build_presence_stanza(
            from_='carol@gmail.com', ptype=pb.PRESENCE_UNAVAILABLE)
        p = sim_parse_presence(payload)
        self.assertEqual(p['type'], pb.PRESENCE_UNAVAILABLE)

    def test_batch_presence(self):
        presences = (
            pb.build_presence_stanza(from_='a@gmail.com', status='x',
                                     client_type=pb.CLIENT_ANDROID),
            pb.build_presence_stanza(from_='b@gmail.com',
                                     ptype=pb.PRESENCE_UNAVAILABLE),
        )
        payload = pb.build_batch_presence(packet_id='bp1', to='me@gmail.com',
                                          presences=presences)
        bp = sim_parse_batch_presence(payload)
        self.assertEqual(bp['id'], 'bp1')
        self.assertEqual(len(bp['presences']), 2)
        self.assertIsNone(bp['presences'][0]['type'])
        self.assertEqual(bp['presences'][1]['type'],
                         pb.PRESENCE_UNAVAILABLE)


class MessageTest(unittest.TestCase):
    def test_chat(self):
        payload = pb.build_message_stanza(
            packet_id='m1', mtype=pb.MSG_CHAT,
            from_='bob@gmail.com', to='me@gmail.com',
            body='在吗？', timestamp=1234567890)
        m = sim_parse_message(payload)
        self.assertEqual(m['type'], pb.MSG_CHAT)
        self.assertEqual(m['from'], 'bob@gmail.com')
        self.assertEqual(m['to'], 'me@gmail.com')
        self.assertEqual(m['body'], '在吗？')
        self.assertEqual(m['timestamp'], 1234567890)


class FrameTest(unittest.TestCase):
    def test_send_frame_wire_format(self):
        """[tag][varint len][payload]，与 ProtoBufStreamSerializerImpl 一致。"""
        payload = pb.build_roster_response('r', ())
        frame = bytes([pb.TAG_IQ]) + pb.encode_varint(len(payload)) + payload
        self.assertEqual(frame[0], pb.TAG_IQ)
        ln, i = pb.decode_varint(frame, 1)
        self.assertEqual(ln, len(payload))
        self.assertEqual(frame[i:], payload)


def _static_roster():
    """测试用的小静态花名册。"""
    from mtalk_server import Roster
    return Roster([
        {'jid': 'bob@gmail.com', 'name': 'Bob', 'groups': ['Friends'],
         'online': True, 'status': 'Busy'},
        {'jid': 'carol@gmail.com', 'name': 'Carol', 'groups': ['Family'],
         'online': False, 'status': ''},
    ])


class RosterModelTest(unittest.TestCase):
    def test_load_none_is_dynamic_file_is_static(self):
        from mtalk_server import Roster
        # 不传 --roster 时为动态花名册（好友=在线的其它设备），故 load(None) 返回 None。
        self.assertIsNone(Roster.load(None))

        with tempfile.NamedTemporaryFile('w', suffix='.json', delete=False,
                                         encoding='utf-8') as fh:
            json.dump({'roster': [
                {'jid': 'x@y.com', 'name': 'X', 'online': True},
                {'jid': 'z@y.com', 'name': 'Z', 'online': False},
            ]}, fh, ensure_ascii=False)
            path = fh.name
        try:
            r2 = Roster.load(path)
            self.assertEqual(len(r2.entries), 2)
            self.assertEqual(len(r2.item_bytes()), len(r2.entries))
            pres = r2.presence_bytes('me@y.com')
            self.assertEqual(len(pres), 2)
            self.assertIsNone(sim_parse_presence(pres[0])['type'])
            self.assertEqual(sim_parse_presence(pres[1])['type'],
                             pb.PRESENCE_UNAVAILABLE)
        finally:
            os.unlink(path)

    def test_find_strips_resource(self):
        r = _static_roster()
        jid = r.entries[0]['jid']
        self.assertIsNotNone(r.find(jid + '/Talk.v1.3'))
        self.assertIsNone(r.find('nobody@nowhere.com'))


class _FakeArgs:
    cert = 'unused.crt'
    key = 'unused.key'
    avatar_size = 0
    heartbeat_interval = 0
    roster_etag = 'test-etag'


class SessionLogicTest(unittest.TestCase):
    """直接测会话的分发逻辑（不需要真实 socket）。"""

    def setUp(self):
        from mtalk_server import REGISTRY
        # 每个用例都从干净的在线表开始。
        REGISTRY._sessions.clear()
        REGISTRY._known.clear()

    def _session(self, roster=None):
        from mtalk_server import Session
        s = Session(None, ('127.0.0.1', 1),
                    roster if roster is not None else _static_roster(),
                    _FakeArgs())
        s.sent = []
        s.send = lambda tag, payload: s.sent.append((tag, payload))
        return s

    def test_login_replies_login_response(self):
        s = self._session()
        req = (pb.pb_string(1, 'pkt-1') + pb.pb_string(2, 'gmail.com')
               + pb.pb_string(3, 'tester') + pb.pb_string(4, 'android')
               + pb.pb_string(5, 'tok') + pb.pb_string(6, 'dev'))
        s._on_login(req)
        self.assertEqual(len(s.sent), 1)
        tag, payload = s.sent[0]
        self.assertEqual(tag, pb.TAG_LOGIN_RESPONSE)
        f = pb.parse_fields(payload)
        self.assertEqual(pb.get_string(f, 1), 'pkt-1')
        self.assertEqual(pb.get_string(f, 2), 'tester@gmail.com/android')

    def test_roster_query_triggers_roster_and_batch_presence(self):
        s = self._session()
        s.jid = 'me@gmail.com'
        ext = pb.build_extension(pb.EXT_ROSTER_QUERY,
                                 pb.build_roster_query(etag=''))
        iq = pb.build_iq_stanza(pb.IQ_TYPE_GET, packet_id='rq-1',
                                extension=ext)
        s._on_iq(iq)
        self.assertEqual([t for (t, _) in s.sent],
                         [pb.TAG_IQ, pb.TAG_BATCH_PRESENCE])
        roster_iq = sim_parse_iq(s.sent[0][1])
        self.assertEqual(roster_iq['id'], 'rq-1')
        self.assertEqual(roster_iq['iq_type'], pb.IQ_TYPE_RESULT)
        self.assertEqual(roster_iq['ext_id'], pb.EXT_ROSTER_QUERY)
        roster = sim_parse_roster(roster_iq['ext_data'])
        self.assertGreater(len(roster['items']), 0)

        bp = sim_parse_batch_presence(s.sent[1][1])
        self.assertEqual(len(bp['presences']), len(roster['items']))

    def test_post_auth_batch_query_triggers_roster(self):
        """扩展 ID=11 是登录后的 PostAuthBatchQuery，应触发花名册 + 在线状态。"""
        s = self._session()
        s.jid = 'me@gmail.com'
        bq = (pb.pb_bool(1, True) + pb.pb_string(5, 'old-etag')
              + pb.pb_string(8, 'bq-1'))
        ext = pb.build_extension(pb.EXT_POST_AUTH_BATCH_QUERY, bq)
        iq = pb.build_iq_stanza(pb.IQ_TYPE_GET, packet_id='bq-1',
                                extension=ext)
        s._on_iq(iq)
        self.assertEqual([t for (t, _) in s.sent],
                         [pb.TAG_IQ, pb.TAG_BATCH_PRESENCE])
        roster_iq = sim_parse_iq(s.sent[0][1])
        self.assertEqual(roster_iq['ext_id'], pb.EXT_ROSTER_QUERY)
        self.assertEqual(roster_iq['iq_type'], pb.IQ_TYPE_RESULT)
        self.assertGreater(len(sim_parse_roster(roster_iq['ext_data'])['items']), 0)

    def test_parse_post_auth_batch_query(self):
        bq = (pb.pb_bool(1, True) + pb.pb_bool(2, True)
              + pb.pb_varint(4, 2) + pb.pb_string(5, 'e') + pb.pb_string(8, 'i'))
        info = pb.parse_post_auth_batch_query(bq)
        self.assertTrue(info['online'])
        self.assertTrue(info['device_idle'])
        self.assertEqual(info['shared_status_version'], 2)
        self.assertEqual(info['roster_etag'], 'e')
        self.assertEqual(info['vcard_query_stanza_id'], 'i')

    def test_unknown_get_iq_gets_result(self):
        s = self._session()
        iq = pb.build_iq_stanza(pb.IQ_TYPE_GET, packet_id='q-9',
                                from_='srv', to='me')
        s._on_iq(iq)
        self.assertEqual(len(s.sent), 1)
        out = sim_parse_iq(s.sent[0][1])
        self.assertEqual(out['iq_type'], pb.IQ_TYPE_RESULT)
        self.assertEqual(out['id'], 'q-9')

    def test_presence_probe_replies(self):
        s = self._session()
        s.jid = 'me@gmail.com'
        jid = s.roster.entries[0]['jid']
        probe = pb.build_presence_stanza(from_=jid, to='me@gmail.com',
                                         ptype=pb.PRESENCE_PROBE)
        s._on_presence(probe)
        self.assertEqual(len(s.sent), 1)
        self.assertEqual(s.sent[0][0], pb.TAG_PRESENCE)
        self.assertEqual(sim_parse_presence(s.sent[0][1])['from'], jid)

    def test_heartbeat_ping_gets_ack(self):
        s = self._session()
        s._dispatch(pb.TAG_HEARTBEAT_PING, b'')
        self.assertEqual(s.sent[0][0], pb.TAG_HEARTBEAT_ACK)

    def test_chat_command(self):
        s = self._session()
        s.jid = 'me@gmail.com'
        s._handle_command({'cmd': 'chat', 'from': 'bob@gmail.com',
                           'text': '你好'})
        self.assertEqual(s.sent[0][0], pb.TAG_MESSAGE)
        m = sim_parse_message(s.sent[0][1])
        self.assertEqual(m['body'], '你好')
        self.assertEqual(m['type'], pb.MSG_CHAT)

    def test_dynamic_roster_lists_online_peers(self):
        """动态花名册：好友就是其它在线会话，且显示为在线。"""
        from mtalk_server import DynamicRoster, REGISTRY
        a = self._session()
        a.user = 'a@gmail.com'
        REGISTRY.register(a)
        r = DynamicRoster(REGISTRY, 'b@gmail.com')
        self.assertEqual([e['jid'] for e in r.entries], ['a@gmail.com'])
        self.assertTrue(r.entries[0]['online'])
        # 自己不会出现在自己的花名册里。
        self.assertEqual(DynamicRoster(REGISTRY, 'a@gmail.com').entries, [])

    def test_message_is_forwarded_to_peer(self):
        """A 发的消息应转发给在线的 B，from 用裸 JID。"""
        from mtalk_server import REGISTRY
        a = self._session()
        a.user = 'a@gmail.com'
        a.jid = 'a@gmail.com/andr'
        b = self._session()
        b.user = 'b@gmail.com'
        b.jid = 'b@gmail.com/andr'
        REGISTRY.register(a)
        REGISTRY.register(b)
        msg = pb.build_message_stanza(packet_id='m1', mtype=pb.MSG_CHAT,
                                      from_='a@gmail.com/andr',
                                      to='b@gmail.com', body='你好')
        a._on_message(msg)
        self.assertEqual(len(b.sent), 1)
        self.assertEqual(b.sent[0][0], pb.TAG_MESSAGE)
        out = sim_parse_message(b.sent[0][1])
        self.assertEqual(out['body'], '你好')
        self.assertEqual(out['from'], 'a@gmail.com')
        self.assertEqual(out['to'], 'b@gmail.com/andr')

    def test_message_to_offline_peer_is_dropped(self):
        from mtalk_server import REGISTRY
        a = self._session()
        a.user = 'a@gmail.com'
        REGISTRY.register(a)
        msg = pb.build_message_stanza(packet_id='m1', mtype=pb.MSG_CHAT,
                                      from_='a@gmail.com', to='nobody@gmail.com',
                                      body='hi')
        a._on_message(msg)      # 不应抛异常
        self.assertEqual(a.sent, [])


if __name__ == '__main__':
    unittest.main()
