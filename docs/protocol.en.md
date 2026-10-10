# Protocol Notes - Google Talk for Android 2.1 (English)

Subject: `com.google.android.apps.gtalkservice` v1.3
(APK: `apks/gtalkservice-USCCi500-2009__gtalkservice.apk`)

Chinese version: [`protocol.md`](protocol.md)

## 1. Transport

- Connection class: `org.jivesoftware.smack.SSLXMPPConnection`
  (extends `XMPPConnection`): an XMPP *framework* carried over TLS.
- Defaults (from `com.google.android.gtalkservice.Account`):
  - `DEFAULT_GTALK_HOST = "mtalk.google.com"`
  - `DEFAULT_SECURE_GTALK_PORT = 0x146c = 5228`
  - Fallback ports: 5222 (plain), 5223 (`0x1467`)
- If `gtalk_hostname == "talk.google.com"` and the port is 5223, they are forced
  back to `mtalk.google.com:5228`.
- Host and port come from Gservices (`Settings.Gservices.QueryMap`); when
  unavailable the defaults above apply.

## 2. Authentication

`AuthTokenFetcher.fetch()`:

```java
AccountManager.get(context)
    .blockingGetAuthToken(new Account(username, "com.google"), mAuthTokenType, true);
```

However `GTalkService.getAccount()` checks
`gls.peekCredentials(username, "mail")` **first** and only falls back to the
AccountManager path when that returns an empty string. Because we implement
`IGoogleLoginService` ourselves and return a non-empty token, **no account
authenticator is required**.

`XMPPConnection` sets `useProtoBuf = 1`, so the client uses
`ProtoBufAuthentication` (Google's private MCS/MTalk binary protocol),
**not** standard SASL.

## 3. TLS and trust

- Socket factory: `SSLCertificateSocketFactory.getDefault(sslHandshakeTimeout, cache)`
  - Its handshake uses an **all-trusting** `TRUST_MANAGER`, then validates the
    chain separately via `SSLParameters.getDefaultTrustManager()`.
- Whether validation is skipped is decided in
  `SSLCertificateSocketFactory.validateSocket()`:

```java
if ("0".equals(SystemProperties.get("ro.secure"))
        && "yes".equals(SystemProperties.get("socket.relaxsslcheck"))) {
    return;   // ignore invalid certificates
}
```

So on an engineering build:

```bash
adb shell setprop socket.relaxsslcheck yes
```

is sufficient and **no system trust store modification is needed**.
Without it the client logs
`CertPathValidatorException: TrustAnchor for CertPath not found` (or
`TrustAnchor found but certificate verification failed`) and aborts with
`IOException: Certificate untrusted`.

- Android 2.1's `core.jar` only references `cacerts.bks`; it does **not** read
  `/data/misc/keychain`. The post-4.0 mechanism of installing a user CA is
  therefore unavailable on Eclair.
- The trust store is loaded and cached by **zygote**, so replacing `cacerts.bks`
  requires `adb shell 'stop; start'`, not just an app restart.
- **Alternative (used by this project)**: replace the socket factory in
  `GTalkConnection.doConnect()` with a plain `SocketFactory` and speak **plain
  TCP**, avoiding certificates entirely (client patch in
  `scripts/merge_single_app.py`; server via
  `bash scripts/server.sh start --plain`).

## 4. MCS frame format (measured)

After the TLS handshake:

```
client -> server : 0x04                      (version byte)
server -> client : 0x04                      (version byte)
then both directions:
  [ tag : 1 byte ][ length : varint (max 5 bytes, 7-bit LE) ][ protobuf ]
```

If the server does not send its version byte first, the client sends nothing and
emits `CLOSE(4)` after `gtalk_ssl_handshake_timeout_ms` (default 60000 ms).

## 5. Frame tags (`MobileProtoBufStreamConfiguration`)

| tag | Meaning | Status |
| --- | --- | --- |
| 0 | HEARTBEAT_PING | TODO |
| 1 | HEARTBEAT_ACK | TODO |
| 2 | LOGIN_REQUEST | parsed |
| 3 | LOGIN_RESPONSE | implemented |
| 4 | CLOSE | observed |
| 5 | MESSAGE_STANZA | TODO |
| 6 | PRESENCE_STANZA | TODO |
| 7 | IQ_STANZA | observed (roster query) |
| 8 | DATA_MESSAGE_STANZA | TODO |
| 9 | BATCH_PRESENCE_STANZA | observed |
| 10 | STREAM_ERROR_STANZA | TODO |

## 6. Measured frames

### LOGIN_REQUEST (tag=2)

```
0a 09 "<packet id>"         field 1  packet id
12 09 "gmail.com"           field 2  domain
1a 06 "tester"              field 3  user
22 13 "androide601825..."   field 4  resource
2a 1d "PRIVATE_mail_..."    field 5  auth token
32 18 "android-1122..."     field 6  deviceId
00 60 00                    trailing fields 12/13 (false)
```

### LOGIN_RESPONSE (tag=3) - constructed by the server

| field | type | Purpose |
| --- | --- | --- |
| 1 | string | Packet id - **must echo field 1 of the request** or the collector will not match |
| 2 | string | JID, `user@domain/resource` |
| 3 | message | ERROR_INFO |
| 4 | repeated message | SETTING (name/value) |
| 5 | int | streamId |
| 6 | int | lastStreamId |
| 7 | message | HEARTBEAT_CONFIG |

Field mapping derived from `PacketReader.parseLoginResponse`
(field 1 -> `setPacketID`, field 2 -> `setJid`).

### IQ_STANZA (tag=7) - PostAuthBatchQuery, then the roster reply

The IQ_STANZA payload is the `IqStanza` message
(`proto/IqStanza.smali`, `GtalkCoreMessageTypes.IQ_STANZA`):

| field | name | type | notes |
| --- | --- | --- | --- |
| 1 | RMQ_ID | int64 | unused here |
| 2 | TYPE | int32 | 0=GET 1=SET 2=RESULT 3=ERROR |
| 3 | ID | string | packet id, must be echoed |
| 4 | FROM | string | |
| 5 | TO | string | |
| 6 | ERROR | message | |
| 7 | EXTENSION | message | `Extension{ id=1, data=2 }` |

**Measured (important)**: the first IQ after login carries extension id
**11**, i.e. `PostAuthBatchQuery`
(`PostAuthBatchQuery.getExtensionProtoBuf()` does `setInt(1, 0xb)`). It asks
for the roster and presence in one shot and also sets
`RosterManager.hasRequestedRoster = true`, so the client does **not** send a
separate roster request.

`PacketReader.parseIQ(ProtoBuf)` dispatches the **reply** on the extension id
with a hard-coded switch: `case 0` = generic XML IQ, `case 1` = roster
(`parseRoster`), anything else goes to `ProviderManager.getIQProvider(extId)`.
`RosterPacket.getExtensionProtoBuf()` also does `setInt(1, 1)`. So the server
must answer the PostAuthBatchQuery by pushing the roster as an extension id
**1** IQ, then a batch presence. Any other id makes the client reply
`feature-not-implemented` and the buddy list stays empty.

Extension ids (from `*Provider.getTag()` and the hard-coded branches):
0 XML (hard-coded), 1 roster (hard-coded), 2 RmqLastIdReceived, 3 RmqAck,
4 VCard, 5 SharedStatus, 6 ChatRead, 7 ChatClosed, 9 OtrQuery, 10 Idle,
11 PostAuthBatchQuery (client-initiated, no reply extension), 12 SelectiveAck,
13 StreamAck.

`PostAuthBatchQuery` fields: 1 online (bool), 2 device_idle (bool),
3 show_mobile (bool), 4 shared_status_version (int), 5 roster_etag (string),
6 otr_etag (string), 7 avatar_hash (string), 8 vcard_query_stanza_id (string).

### Roster reply (extension id = 1, IqStanza.TYPE = RESULT)

`RosterQuery` (`GtalkExtensionsMessageTypes.ROSTER_QUERY`):
field 1 ETAG (string), 2 NOT_MODIFIED (bool), 3 ITEM (repeated `RosterItem`),
4 AVATAR_WIDTH (int32), 5 AVATAR_HEIGHT (int32).

`RosterItem` (`GtalkExtensionsMessageTypes.ROSTER_ITEM`):
field 1 JID (string), 2 NAME (string), 3 SUBSCRIPTION (int32:
0 NONE, 1 TO, 2 FROM, 3 BOTH, 4 REMOVE), 4 ASK (int32), 5 GROUP (repeated
string), 6 QUICK_CONTACT (bool), 7 DISPLAY (int32: 0 BLOCKED, 1 HIDDEN,
2 PINNED), 8 REJECTED (bool).

Client read order: `PacketReader.parseRoster(ProtoBuf)`.

> **Buddy-list filter (measured)**: BuddyList defaults to the quick-contacts
> query
> `account=? AND type!=3 AND subscriptionType>=4 AND (qc=1 OR last_message_date!=0 OR subscriptionType=5)`.
> So every `RosterItem` must set **QUICK_CONTACT(6) = true** (the client then
> writes `contacts.qc=1`); otherwise the contacts are in TalkProvider but the
> buddy list stays empty. This was the biggest gotcha.

### PRESENCE_STANZA (tag=6) and BATCH_PRESENCE_STANZA (tag=9)

`PresenceStanza` (`proto/PresenceStanza.smali`): field 1 RMQ_ID (int64),
2 TYPE (int32, **absent = AVAILABLE**; 0 UNAVAILABLE, 1 SUBSCRIBE,
2 SUBSCRIBED, 3 UNSUBSCRIBE, 4 UNSUBSCRIBED, 5 PROBE, 6 ERROR),
3 ID (string), 4 FROM (string), 5 TO (string), 6 SHOW (int32, absent =
AVAILABLE; 0 AWAY, 1 CHAT, 2 DND, 3 XA), 7 STATUS (string),
8 PRIORITY (int32), 9 ERROR (message), 10 EXTENSION (repeated),
11 CLIENT (int32: 0 MOBILE, 1 ANDROID), 12 AVATAR_HASH (string).

To mark a contact **online**, omit field 2; to mark **offline**, set
`TYPE = 0`. See `PacketParserUtils.parsePresence(ProtoBuf)`.

`BatchPresenceStanza`: field 1 ID, 2 TO, 3 repeated `PresenceStanza`.
After the roster reply the server should push a batch presence so
`RosterManager$BatchPresencePacketListener` writes it into TalkProvider.

### MESSAGE_STANZA (tag=5)

`MessageStanza` (`proto/MessageStanza.smali`): field 1 RMQ_ID (int64),
2 TYPE (int32: 0 NORMAL, 1 CHAT, 2 GROUPCHAT, 3 HEADLINE, 4 ERROR),
3 ID, 4 FROM, 5 TO, 6 SUBJECT, 7 BODY, 8 THREAD (strings), 9 ERROR
(message), 10 EXTENSION (repeated), 11 NOSAVE (bool), 12 TIMESTAMP (int64,
ms), 13 PERSISTENT_ID (string), 14 STREAM_ID (int32),
15 LAST_STREAM_ID_RECEIVED (int32), 16 READ (bool).

Sending one chat message from the server makes the original UI receive a
chat, which is how the chat screen is captured.

### HEARTBEAT_PING (tag=0) / HEARTBEAT_ACK (tag=1)

`HeartbeatPing`/`HeartbeatAck` only carry fields 1 and 2 (int32); the payload
may be empty. The client auto-replies to a ping (`PacketReader.handleProtoBuf`).
The server may also send pings to keep the long connection alive.

### Server implementation

`server/mcs_proto.py` is the codec, `server/mtalk_server.py` is the server,
`server/test_mcs_proto.py` unit-tests the codec against a **simulated client
parser**, and `server/smoke_client.py` is an emulator-free TLS smoke test:

```bash
cd server && python3 -m unittest -v test_mcs_proto
python3 server/mtalk_server.py --cert certs/alt/server2.crt \
    --key certs/alt/server2.key --control logs/server_control.jsonl
python3 server/smoke_client.py
```

## 8. Pitfalls when merging into a single APK (important)

1. **javac inlines R constants.** The original dex holds resource IDs as **hard-coded
   literals** (e.g. `const v1, 0x7f030016`), not symbolic references. After merging the
   IDs are re-assigned, so the smali must be rewritten mapping old -> new **per source
   package**.
2. **The replacement must be single-pass.** Sequential `str.replace` chains:
   if `0x16->0x18` and `0x18->0x1a`, the value written first gets replaced again, pointing
   at the wrong resource (this once made `setContentView` load the wrong layout and NPE).
3. **aapt v1 emits `R.java` only for the last `--extra-packages` entry.** It contains all
   resource IDs, so it can be replicated (changing only the `package` line) for the others.
4. **`const/high16` cannot hold the re-assigned IDs** (low 16 bits must be zero); such
   instructions have to become a plain `const`.
5. **`aapt add` must run from inside the dex directory**, otherwise the zip entry carries a
   directory prefix and the device reports `INSTALL_FAILED_DEXOPT`.
6. **`smali assemble` needs `-a 7`**, otherwise the dex version is too new for Android 2.1.
7. **`d8` is used to merge dex files** (`-a 7` produces dex 035 while `d8` defaults to 037;
   measured: merging a 035 dex with `d8` yields 037, which 2.1 still loads fine).
8. **Component class names must be expanded**: `.Foo` and `Foo` are both relative to their
   own original package and would otherwise resolve against the wrong package.
9. **`@android:style/Widget.Holo.ProgressBar` does not exist on API 7** and makes aapt
   fail outright; it must be removed.
