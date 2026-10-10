# 协议分析笔记（GTalk for Android 2.1）

分析对象：`com.google.android.apps.gtalkservice` v1.3（APK：`apks/gtalkservice-USCCi500-2009__gtalkservice.apk`）

## 1. 连接方式

- 连接实现类：`org.jivesoftware.smack.SSLXMPPConnection`（继承 `XMPPConnection`），即 **TLS 之上的 XMPP 框架**。
- 默认服务器（来自 `com.google.android.gtalkservice.Account`）：
  - `DEFAULT_GTALK_HOST = "mtalk.google.com"`
  - `DEFAULT_SECURE_GTALK_PORT = 0x146c = 5228`
  - 备用端口：`5222`(0x1466，非加密)、`5223`(0x1467)
- 若 `gtalk_hostname == "talk.google.com"` 且端口为 5223，会被强制改写为 `mtalk.google.com:5228`。
- 主机/端口来自 Gservices（`Settings.Gservices.QueryMap`），取不到时使用上述默认值。

## 2. 认证流程

`AuthTokenFetcher.fetch()`：

```java
AccountManager.get(context)
    .blockingGetAuthToken(new Account(username, "com.google"), mAuthTokenType /* "talk" */, true);
```

结论：**认证令牌来自 AccountManager 中类型为 `com.google` 的账户认证器**，
并不需要 Google Services Framework 的 `GoogleLoginService`。
=> 我们可以自建一个 `com.google` 账户认证器，返回任意令牌。

连接时使用 `ProtoBufAuthentication`（`XMPPConnection` 中 `useProtoBuf = 1`），
即使用 Google 私有的 MCS/MTalk 二进制协议（见下），而不是标准 SASL。

## 3. TLS 信任

- 套接字工厂：`SSLCertificateSocketFactory.getDefault(sslHandshakeTimeout, cache)`
  → 使用**系统默认信任库**（Android 2.1 为 `/system/etc/security/cacerts.bks`）。
- 代码中还存在 `OpenTrustManager`（接受一切证书）与 `ServerTrustManager`
  （会“接受自签名证书”），但连接路径上实际使用的是默认套接字工厂。
- 方案：把自建 CA 导入 `cacerts.bks`，无需修改任何 APK。
- **替代方案（本项目采用）**：把 `GTalkConnection.doConnect()` 里的套接字工厂
  换成普通 `SocketFactory`，直接走**明文 TCP**，从而完全绕开证书问题
  （客户端补丁见 `scripts/merge_single_app.py`，服务器用
  `bash scripts/server.sh start --plain`）。

## 4. MCS / MTalk 帧格式

`ProtoBufStreamSerializerImpl` / `ProtoBufStreamParserImpl`：

```
[ tag : 1 byte ][ length : varint(最多 5 字节, 7bit 小端, 最高位为续位) ][ protobuf 载荷 ]
```

tag 取值（`MobileProtoBufStreamConfiguration`）：

| tag | 含义 |
| --- | --- |
| 0 | HEARTBEAT_PING |
| 1 | HEARTBEAT_ACK |
| 2 | LOGIN_REQUEST |
| 3 | LOGIN_RESPONSE |
| 4 | CLOSE |
| 5 | MESSAGE_STANZA |
| 6 | PRESENCE_STANZA |
| 7 | IQ_STANZA |
| 8 | DATA_MESSAGE_STANZA |
| 9 | BATCH_PRESENCE_STANZA |
| 10 | STREAM_ERROR_STANZA |
| 11 | HTTP_REQUEST |
| 12 | HTTP_RESPONSE |

protobuf 模式定义位于 `com/google/android/gtalkservice/proto/GtalkCoreMessageTypes`。

## 5. 实测确认的线格式（重要修正）

实际连接后 **双方都会先发送一个版本字节 `0x04`**，之后才是帧：

```
客户端 -> 服务器 : 0x04
服务器 -> 客户端 : 0x04
随后双向 : [tag:1][varint length][protobuf]
```

若服务器不先发版本字节，客户端不会发送任何数据，
并在 `gtalk_ssl_handshake_timeout_ms`（默认 60000ms）后发出 `CLOSE(4)` 断开。

> 注：早先认为“连接后使用 SASL PLAIN”是不准确的。
> `XMPPConnection` 中 `useProtoBuf = 1`，实际走 `ProtoBufAuthentication`，
> 即下面的 MCS/MTalk protobuf 协议。

## 6. 实测报文

### LOGIN_REQUEST (tag=2)

```
0a 09 "0zOsgMP-0"                       field 1  包 ID
12 09 "gmail.com"                        field 2  域名
1a 06 "tester"                           field 3  用户名
22 13 "androide60182505743"              field 4  resource
2a 1d "PRIVATE_mail_tester@gmail.com"    field 5  令牌
32 18 "android-1122334455667788"         field 6  deviceId
```

### LOGIN_RESPONSE (tag=3) —— 服务器构造

```
0a <len> <包 ID>       field 1  必须回显 LOGIN_REQUEST 的字段 1
12 <len> <JID>         field 2  user@domain/resource
```

字段来源：`PacketReader.parseLoginResponse`（字段 1 -> setPacketID，字段 2 -> setJid）。

### IQ_STANZA (tag=7) —— 登录后的 PostAuthBatchQuery 与花名册应答

IQ_STANZA 的载荷就是 `IqStanza` 消息，字段号见
`proto/IqStanza.smali` 与 `GtalkCoreMessageTypes.IQ_STANZA`：

| 字段 | 名称 | 类型 | 说明 |
| --- | --- | --- | --- |
| 1 | RMQ_ID | int64 | 缺省不用 |
| 2 | TYPE | int32 | 0=GET 1=SET 2=RESULT 3=ERROR |
| 3 | ID | string | 包 ID，应答必须回显 |
| 4 | FROM | string | |
| 5 | TO | string | |
| 6 | ERROR | message | |
| 7 | EXTENSION | message | `Extension{ id=1, data=2 }` |

**实测（务必记住）**：登录成功后客户端发的第一条 IQ 扩展 ID 是 **11**，
即 `PostAuthBatchQuery`（`PostAuthBatchQuery.getExtensionProtoBuf()` 里
`setInt(1, 0xb)`）。它一次性请求花名册 + 在线状态，并同时把
`RosterManager.hasRequestedRoster` 置为 true，所以客户端**不会**再单独发
花名册请求。

`PacketReader.parseIQ(ProtoBuf)` 对扩展 ID 的**应答**分发是硬编码的：

```java
packed-switch extId {
    case 0: parseXML(...)        // 通用 XML IQ
    case 1: parseRoster(...)     // 花名册
    default: ProviderManager.getIQProvider(extId)  // 其它扩展
}
```

所以服务器**回应** PostAuthBatchQuery 时，要把花名册作为扩展 ID = **1** 的
IQ 推下去（`RosterPacket.getExtensionProtoBuf()` 也是 `setInt(1, 1)`），
紧接着推一份批量在线状态。若花名册用别的扩展 ID，客户端会走
`handleUnsupportedIqPacket` 回 feature-not-implemented，好友列表不会更新。

各扩展 ID（来自各 `*Provider.getTag()` 与硬编码分支）：

| ID | 扩展 |
| --- | --- |
| 0 | 通用 XML IQ（硬编码） |
| 1 | 花名册（硬编码） |
| 2 | RmqLastIdReceived |
| 3 | RmqAck |
| 4 | VCard |
| 5 | SharedStatus |
| 6 | ChatRead |
| 7 | ChatClosed |
| 9 | OtrQuery |
| 10 | Idle |
| 11 | PostAuthBatchQuery（客户端发起，无对应应答扩展） |
| 12 | SelectiveAck |
| 13 | StreamAck |

> `PostAuthBatchQuery` 字段：1 online(bool) 2 device_idle(bool)
> 3 show_mobile(bool) 4 shared_status_version(int) 5 roster_etag(string)
> 6 otr_etag(string) 7 avatar_hash(string) 8 vcard_query_stanza_id(string)。

### 花名册应答（扩展 ID = 1，IqStanza.TYPE = RESULT）

`RosterQuery`（`GtalkExtensionsMessageTypes.ROSTER_QUERY`）：

| 字段 | 名称 | 类型 |
| --- | --- | --- |
| 1 | ETAG | string |
| 2 | NOT_MODIFIED | bool |
| 3 | ITEM | repeated `RosterItem` |
| 4 | AVATAR_WIDTH | int32 |
| 5 | AVATAR_HEIGHT | int32 |

`RosterItem`（`GtalkExtensionsMessageTypes.ROSTER_ITEM`）：

| 字段 | 名称 | 类型 | 说明 |
| --- | --- | --- | --- |
| 1 | JID | string | 好友地址（会被客户端转小写） |
| 2 | NAME | string | 显示名 |
| 3 | SUBSCRIPTION | int32 | 0=NONE 1=TO 2=FROM 3=BOTH 4=REMOVE |
| 4 | ASK | int32 | 0=SUBSCRIPTION_PENDING |
| 5 | GROUP | repeated string | 分组名 |
| 6 | QUICK_CONTACT | bool | |
| 7 | DISPLAY | int32 | 0=BLOCKED 1=HIDDEN 2=PINNED |
| 8 | REJECTED | bool | |

客户端读取顺序见 `PacketReader.parseRoster(ProtoBuf)`：先看字段 1/2，
再遍历字段 3 的每个 `RosterItem`。

> **好友列表的过滤条件（实测）**：BuddyList 默认用「常用联系人」查询：
>
> ```
> account=? AND type!=3 AND subscriptionType>=4
>   AND (qc=1 OR last_message_date!=0 OR subscriptionType=5)
> ```
>
> 所以每个 `RosterItem` 必须把 **QUICK_CONTACT(6) 设为 true**（客户端会写入
> `contacts.qc=1`），否则即使联系人已经写进 TalkProvider，好友列表里也**不显示**。
> 这是本服务器踩过的最大的坑。

### PRESENCE_STANZA (tag=6) 与 BATCH_PRESENCE_STANZA (tag=9)

`PresenceStanza`（`proto/PresenceStanza.smali`）：

| 字段 | 名称 | 类型 | 说明 |
| --- | --- | --- | --- |
| 1 | RMQ_ID | int64 | |
| 2 | TYPE | int32 | **缺省 = AVAILABLE**；0=UNAVAILABLE 1=SUBSCRIBE 2=SUBSCRIBED 3=UNSUBSCRIBE 4=UNSUBSCRIBED 5=PROBE 6=ERROR |
| 3 | ID | string | |
| 4 | FROM | string | 好友地址（可带 resource） |
| 5 | TO | string | |
| 6 | SHOW | int32 | 缺省 = AVAILABLE；0=AWAY 1=CHAT 2=DND 3=XA |
| 7 | STATUS | string | 状态文本 |
| 8 | PRIORITY | int32 | |
| 9 | ERROR | message | |
| 10 | EXTENSION | repeated message | |
| 11 | CLIENT | int32 | 0=MOBILE 1=ANDROID |
| 12 | AVATAR_HASH | string | |

要点：**要表示“在线”就省略字段 2**（解析默认 AVAILABLE）；
要表示“离线”必须显式写 `TYPE = 0`。见 `PacketParserUtils.parsePresence(ProtoBuf)`。

`BatchPresenceStanza`：字段 1=ID，2=TO，3=repeated `PresenceStanza`。
登录并下发花名册后，服务器应紧接着推一份批量在线状态，
`RosterManager$BatchPresencePacketListener` 会把它们写进 TalkProvider。

### MESSAGE_STANZA (tag=5)

`MessageStanza`（`proto/MessageStanza.smali`）：

| 字段 | 名称 | 类型 | 说明 |
| --- | --- | --- | --- |
| 1 | RMQ_ID | int64 | |
| 2 | TYPE | int32 | 0=NORMAL 1=CHAT 2=GROUPCHAT 3=HEADLINE 4=ERROR |
| 3 | ID | string | |
| 4 | FROM | string | |
| 5 | TO | string | |
| 6 | SUBJECT | string | |
| 7 | BODY | string | 正文 |
| 8 | THREAD | string | |
| 9 | ERROR | message | |
| 10 | EXTENSION | repeated message | |
| 11 | NOSAVE | bool | |
| 12 | TIMESTAMP | int64 | 毫秒 |
| 13 | PERSISTENT_ID | string | |
| 14 | STREAM_ID | int32 | |
| 15 | LAST_STREAM_ID_RECEIVED | int32 | |
| 16 | READ | bool | |

服务器下发一条聊天消息即可让原始界面弹出/收到聊天，用于截聊天界面。

### HEARTBEAT_PING (tag=0) / HEARTBEAT_ACK (tag=1)

`HeartbeatPing` / `HeartbeatAck` 都只有字段 1、2（int32），
载荷可为空。客户端收到 PING 会自动回 ACK（`PacketReader.handleProtoBuf`）。
服务器也可以主动发 PING 保活。

### 服务端实现

`server/mcs_proto.py` 是编解码库，`server/mtalk_server.py` 是服务器，
`server/test_mcs_proto.py` 用**模拟客户端解析器**做单元测试，
`server/smoke_client.py` 是不依赖模拟器的 TLS 冒烟测试。运行：

```bash
cd server && python3 -m unittest -v test_mcs_proto
python3 server/mtalk_server.py --cert certs/alt/server2.crt \
    --key certs/alt/server2.key --control logs/server_control.jsonl
python3 server/smoke_client.py
```

## 7. 免 root 相关的关键结论（补充）

### 7.1 令牌可以绕开 AccountManager

`GTalkService.getAccount()` 先调用
`gls.peekCredentials(username, "mail")`，**只有返回空**时才走
`AuthTokenFetcher.asyncFetch()`（即 AccountManager 取令牌）。
我们的 `IGoogleLoginService` 返回非空令牌，因此**无需注册 com.google 认证器**。

### 7.2 证书校验有系统自带的旁路

`SSLCertificateSocketFactory.validateSocket()`：

```java
if ("0".equals(SystemProperties.get("ro.secure"))
        && "yes".equals(SystemProperties.get("socket.relaxsslcheck"))) {
    return;   // 忽略证书
}
```

因此 `adb shell setprop socket.relaxsslcheck yes` 即可，**不必改系统信任库**。

补充：Android 2.1 的 `core.jar` 只引用 `cacerts.bks`，
**不读取** `/data/misc/keychain`，所以“安装用户 CA”那套机制在 Eclair 上本来就不存在。
另外信任库由 **zygote** 缓存，改 `cacerts.bks` 后必须 `stop; start`。

### 7.3 让 Talk 直接进入登录流程

Talk 的 `SigningInActivity` 查询 TalkProvider；查不到账户行就跳 `AccountActivity`
（需要认证器）。因此在 provider 为空时用普通 ContentResolver 插入一行账户，
即可让它直接走登录流程；这只需要 TalkProvider 自己声明的 `WRITE_ONLY` 权限，
**不需要 root**。若已有账户行则只读不改。


## 8. 合并成单一 APK 时踩到的坑（重要）

1. **javac 会内联 R 常量**。原 APK 的 dex 里资源 ID 是**硬编码字面量**
   （如 `const v1, 0x7f030016`），不是符号引用。
   合并后 ID 会重排，必须按**来源包**把旧 ID 映射到新 ID 并重写 smali。
2. **替换必须一次性完成**。逐条 `str.replace` 会连锁：
   若 `0x16->0x18` 且 `0x18->0x1a`，先写的 `0x18` 会被再次替换，
   结果指向错误资源（曾导致 `setContentView` 载入错布局、随后 NPE）。
3. **aapt v1 只为最后一个 `--extra-packages` 生成 `R.java`**。
   它包含全部资源 ID，可复制成多份（改 package 行）给其它包用。
4. **`const/high16` 放不下重排后的 ID**（要求低 16 位为 0），
   需要改成普通 `const`。
5. **`aapt add` 必须在 dex 所在目录内执行**，否则 zip 里会带上目录名，
   系统报 `INSTALL_FAILED_DEXOPT`。
6. **`smali assemble` 要加 `-a 7`**，否则 dex 版本过高，Android 2.1 读不了。
7. **`d8` 用于合并 dex**（`-a 7` 会生成 035，`d8` 默认 037；
   实测 035 的 dex 经 `d8` 合并后会升到 037，而 2.1 仍可正常装载）。
8. **组件类名要展开**：`.Foo` 与 `Foo` 都是相对于各自原包，
   合并后若原样保留会指向错误包。
9. **`@android:style/Widget.Holo.ProgressBar` 在 API 7 不存在**，
   会让 aapt 直接报错，必须移除。
