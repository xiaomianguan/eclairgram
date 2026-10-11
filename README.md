# Eclairgram —— Android 2.1–4.0 的 Telegram 客户端（Google Talk 风格界面）

**[简体中文](README.md)** | [English (US)](README.en.md)

Eclairgram 把 **Google Talk（Android 2.1 原版 Talk）的界面** 原样保留下来，
把后台的 **网络层换成 Telegram 的原生 MTProto 协议**，做成一款能跑在
**Android 2.1（Eclair，API 7）到 Android 4.0（ICS，API 14）** 老机器上的
Telegram 客户端。

界面来自 [`liangmian`](https://github.com/xiaomianguan/liangmian)（对 Android 2.1
Google Talk 的逆向工程与私有服务器复刻）：好友列表、聊天界面、状态栏、通知等
全部沿用原版 Talk 的布局与资源，**不做任何像素级改动**，只是把“说话的对象”
从 Google Talk 换成了 Telegram。唯一的例外是**应用图标**——Eclairgram 换成了
自己的纸飞机图标（见下），不再使用原版 Talk 图标。

<p align="center">
  <img src="docs/icon.png" alt="Eclairgram 图标" width="96">
  <br>
  <sub>Eclairgram 自己的图标：对话气泡里的纸飞机（不再使用 Talk 图标）</sub>
</p>

## 为什么是这个项目

- **老系统还能用**：Android 2.1–4.0 的官方 Telegram 早已不再支持，
  官方客户端要求 API 21+。Eclairgram 让这些“电子垃圾”重新能收发 Telegram 消息。
- **熟悉的界面**：直接复用 Google Talk 的 UI（2.1 时代最经典的聊天界面之一）。
- **单 APK、免 root**：所有东西打成一个 APK，`adb install` 即可，不依赖任何预装组件。

## 为什么把证书内置在 App 里

Telegram 的数据中心用 **RSA 公钥** 做握手鉴权（不是 TLS）。这些公钥就是
“让 Telegram 跑起来所必需的证书”，必须内置在客户端。见
[`certs/telegram/`](certs/telegram/)：四把现役公钥 + 四把旧公钥及指纹。

另外，**Android 4.0 之前的系统不支持安装用户 CA**
（Android 2.1 的 `core.jar` 只认系统自带的 `cacerts.bks`，根本不读
`/data/misc/keychain`），而内置的是一份过时的根证书列表。因此当连接需要走 TLS
时（某些网络环境下会用到），必须在 App 内自带一份现代根证书
[`certs/roots/ca-certificates.crt`](certs/roots/)。两份证书都随 APK 一起打包。

## 架构

Eclairgram 是一个**独立应用**：它把 Google Talk 的**界面元素**
（布局、drawable、配色、字符串）拿来用，但**不打包 Talk 的代码/服务**。
Telegram 协议由仓库内 `telegram/` 的原生 MTProto 实现直接负责。

```
┌──────────────────────────────────────────────────────────┐
│ Eclairgram（本应用自己的 Activity，纯 Java）               │
│  MainActivity   登录（BYOK + 手机号 + 验证码），已登录则跳过 │
│  DialogsActivity 会话列表（复用 Talk 的头像/状态图/配色）    │
│  ChatActivity    聊天（复用 Talk 的 im_bubble_* 气泡）      │
└───────────────┬──────────────────────────────────────────┘
                │ TelegramManager（后台线程 + 会话持久化）
┌───────────────▼──────────────────────────────────────────┐
│ telegram/：原生 MTProto（传输 / 握手 / 加密 RPC / 业务）   │
└───────────────┬──────────────────────────────────────────┘
                │ MTProto（obfuscated2 + abridged，AES-IGE/CTR）
┌───────────────▼──────────────────────────────────────────┐
│ Telegram 数据中心（内置 DC RSA 公钥 + 根证书）             │
└──────────────────────────────────────────────────────────┘
```

界面资源来自 `decompiled/Talk-USCCi500-2009__Talk/res`，
构建时与 `app/single/res` 合并进同一个资源表（见 `scripts/merge_single_app.py`）。

## 目录结构

| 路径 | 说明 |
| --- | --- |
| `telegram/` | **原生 MTProto 客户端**（纯 Java，桌面可测，也编进 APK） |
| `telegram/schema/` | 官方 TL schema（层级 229） |
| `telegram/generated/` | 由 schema 生成的 TL 类型表（`scripts/gen_tl_schema.py`） |
| `telegram/tools/TgCli.java` | 桌面验证工具（可在电脑上先跑通协议/登录） |
| `app/single/src/` | 本应用自己的 Activity 与 TelegramManager |
| `app/single/res/` | 本应用自己的资源（含 en-US 与 zh-CN 文案） |
| `scripts/merge_single_app.py` | **核心**：合并 Talk 界面资源 + 本应用代码为单一 APK |
| `scripts/gen_tl_schema.py` | 由 TL schema 生成 Java 类型表 |
| `decompiled/`、`apks/` | Google Talk 的反编译产物与 APK（界面元素来源） |
| `certs/telegram/` | Telegram 数据中心 RSA 公钥 |
| `certs/roots/` | 现代根证书（供 TLS 使用；4.0 之前无法安装用户 CA） |
| `scripts/` | 构建、模拟器、截图脚本 |
| `docs/` | 协议文档与应用图标 |
| `shots/` | 截图（Google Talk 原版 + Eclairgram 实测） |

## 构建

工具链（JDK8/JDK17、smali、Android build-tools、Android 2.1 平台与旧模拟器）
放在仓库内被忽略的目录 `tools/`、`sdk/` 下，构建时不需要额外的全局路径。

```bash
python3 scripts/merge_single_app.py          # 构建单一 APK -> dist/eclairgram.apk
```

### 自带 API 凭据（BYOK，生产版不带 key）

生产版 **不带** 任何 `api_id` / `api_hash`：应用启动后在登录页里有对应的输入框，
用户自行填入 **自己的** API 凭据（在 <https://my.telegram.org> 申请）。
这也避免了把某一个人的 API key 分发给所有用户带来的风控问题。

凭据保存在应用私有 SharedPreferences 中，不会写进 APK、也不会入库。

开发构建可选：把凭据放进被忽略的 `local/secrets.properties`，构建时自动注入
作为默认值（方便本机联调；**绝不入库**）：

```properties
# local/secrets.properties （见 .gitignore 的 /local/）
tg.api_id=<你的 api_id>
tg.api_hash=<你的 api_hash>
```

没有这个文件时 `BuildSecrets` 使用占位值，应用会要求用户在登录页手动填写。

## 在电脑上先跑通协议

`telegram/` 是纯 Java，不依赖 Android，可以先用桌面 JVM 验证：

```bash
JDK=~/liangmian/tools/jdk17     # 或任意 JDK 8+
$JDK/bin/javac -d /tmp/tg $(find telegram/src -name '*.java') telegram/tools/TgCli.java
$JDK/bin/java -cp /tmp/tg TgCli handshake     # 与 Telegram 完成 DH 握手
$JDK/bin/java -cp /tmp/tg TgCli getconfig     # 加密 RPC（help.getConfig）
$JDK/bin/java -cp /tmp/tg TgCli sendcode +86xxxxxxxxxxx   # 请求验证码，随后输入 OTP
```

`handshake` 与 `getconfig` **不需要**手机号即可验证，是最小可用的自检。

## 测试设备

| 设备 | 系统 | 用途 |
| --- | --- | --- |
| 模拟器 `gtalk21` | Android 2.1（API 7） | 主目标版本（界面基线） |
| HTC Wildfire | Android 2.2.1 | 真机（低内存、armeabi） |
| LG-E610 | Android 4.0.3 | 真机（ICS，界面需 4.0 替身控件） |

## 界面语言

- 默认资源 `values/` = **English (US)**
- `values-zh-rCN/` = **简体中文**

原版 Talk 已经自带这两套（以及更多语言）；本应用自己新增的界面
（登录/配置页、桥接提示等）同样提供 en-US 与 zh-CN 两份。

## 当前进展

- [x] 从 liangmian 引入 Google Talk 的界面与“合并为单一 APK”的构建流程
- [x] 纯 Java 原生 MTProto：obfuscated2 传输、AES-IGE/AES-CTR、RSA、TL 编解码
- [x] **DH 握手实测通过**（与 Telegram 生产 DC 建立 auth key）
- [x] **加密 RPC 实测通过**（`help.getConfig` 返回完整 config，含 gzip 解包）
- [x] **登录实测通过**（`auth.sendCode` / `auth.signIn`，含 `PHONE_MIGRATE` 换 DC）
- [x] **会话列表 / 历史消息 / 发送消息 实测通过**（由 TL schema 生成类型表，通用解析）
- [x] **复用 Talk 界面元素做出会话列表与聊天界面**（头像/状态图/气泡/配色）
- [x] **群组与频道**（peerUser / peerChat / peerChannel 均可打开与发送；
      超级群 `megagroup`/`gigagroup` 显示为「群组」，只有广播频道才显示为「频道」）
- [x] **实时更新**（`updates.getDifference`，会话列表自动刷新）
- [x] **新消息通知**：应用退到后台也保持连接（常驻 `TelegramService`），新消息弹系统通知
      （会话名 + 文本，带声音/震动），点按打开对应会话；正在查看的会话不弹
- [x] **更贴近原版 Talk 的界面**（气泡式好友条目、聊天联系人栏、presence 图标）
- [x] **主题随 Android 版本自适应**（2.1 浅色 / 2.2+ 深色）
- [x] **头像使用系统 QuickContactBadge 相框**（原版 Talk 用的就是这个，随系统版本变化）
- [x] **头像加载优化**：只下 small 版（几 KB）；按 `userProfilePhoto`/`chatPhoto` 的
      `dc_id` 直连文件 DC（省掉一次 `FILE_MIGRATE` 往返）；内存 + 磁盘两级缓存，
      重启不重下；会话列表用 3 路连接池并发预取
- [x] **自己的会话显示为「收藏夹」**且不显示状态；在线状态只用于其它用户
- [x] **附件（拍照/图片/视频）**：输入框左侧的回形针按钮；**可直接拍照发送**——
      用应用内相机（`Camera` API，不是系统相机，因此不需要 SD 卡，支持变焦），拍到的 JPEG
      只在内存里旋正后直接发送，不写任何用户存储；接收的消息**直接在气泡里
      内联显示缩略图**（图片取较小的 PhotoSize，视频取 document 缩略图并叠加播放图标），
      点按缩略图下载并查看原文件（图片 ImageView / 视频 VideoView）
- [x] **贴纸**：接收时识别 `documentAttributeSticker` 并渲染；发送走应用内贴纸选择器。
      选择器先显示**最近/常用贴纸**（`messages.getRecentStickers`，最常用的排在最前），
      再**逐个加载**已安装的贴纸包（拉到一个就显示一个，不必等全部拉完），缩略图逐张下载；
      **APK 内置了 libwebp 解码器**（`native/build_libwebp.sh`，armeabi），
      因此 Android 4.0 之前系统不支持 WebP 也能显示贴纸缩略图；
      **动图贴纸（TGS = gzip 后的 Lottie JSON）用自研的最小 Lottie 渲染器播放**
      （`Lottie.java` / `AnimatedStickerView.java`），在聊天里能真正动起来
- [x] **Blobmoji 彩色 emoji**：老系统字体引擎不支持彩色字体，
      改为构建期抽出位图、运行时用 ImageSpan 渲染（见 `scripts/gen_emoji_pack.py`）；
      **全应用范围生效**：消息内容、会话列表名字/状态、聊天标题、详情页与「我的资料」
      （含编辑框）、文件夹标签、媒体标题，名字里的 emoji 不再显示成方框
- [x] **聊天界面跟随列表主题**（2.1 浅色 / 2.2+ 深色），气泡与文字一并自适应
- [x] **自定义 Blobmoji emoji 选择器**：按 Unicode 官方分类分节（表情在前、符号/旗帜在后），
      组内顺序与现代键盘一致（分类与顺序取自 `emoji-test.txt`，老系统键盘无法输入这些 emoji）；
      可用方向键完整操作：左右在同一行内移动、上下换行、中键选中
- [x] **全面支持方向键（D-pad）导航**：会话卡片、按钮、输入框、媒体气泡、设置页、
      菜单与各种对话框都能用方向键操作，且聚焦项有醒目的橙色高亮（不再“看不见光标”）；
      长按卡片可打开详情
- [x] **点按头像打开详情页**（用户/群组/频道，类似 Talk 的联系人页）
- [x] **我的资料**：点按收藏夹头像（或从会话列表菜单）进入，可查看并修改头像、名字与简介
      （`users.getFullUser` / `account.updateProfile` / `photos.uploadProfilePhoto`）
- [x] **收藏夹置顶**：会话列表把“收藏夹/我的资料”放在最上方，整行铺不同底色
      （仿原版 Talk 的自我状态行 `roster_list_self_status_background`：常态纯色，
      按下/选中为透明，交给系统列表高亮，因此高亮随 Android 版本变化）
- [x] **单一应用、单一启动图标**：已登录直接进会话列表，会话持久化
- [x] **应用图标**：Eclairgram 自己的图标（对话气泡里的纸飞机），替换原版 Talk 的启动图标
      （`ic_launcher_eclairgram`，含 ldpi/mdpi/hdpi/xhdpi 四套尺寸）
- [x] **会话文件夹**：账号配置了文件夹时，顶部改用原生标签栏（TabWidget）在文件夹间切换；
      没有文件夹时仍是标题栏（`messages.getDialogFilters` + `messages.getDialogs(folder_id)`）
- [x] **会话列表的系统菜单**（菜单键）：我的资料 / 搜索 / 设置 / 退出登录，沿用
      Android 2.1–4.0 的原生选项菜单（图标 + 文字的网格，和原版 Talk 一样）
- [x] **搜索会话**：按会话标题过滤（列表顶部出现搜索框）；部分老机型自带的系统搜索键也能触发
- [x] **设置页**：语言（跟随系统 / English / 简体中文，改动后重启界面生效）与通知开关
      （关掉后后台不再弹新消息通知）
- [x] **面向老设备的性能优化**：emoji 位图包改用 **mmap（off-heap）**，不再占用 ~2.5 MB
      堆内存；头像/emoji 位图改为**有界 LRU 缓存**并按显示尺寸降采样；消息列表**只在界面
      可见时轮询**、内容未变不重绑；**DH 私钥指数降到 256 位**（登录快数倍，安全性不受影响）；
      AES-IGE / PBKDF2 / 十六进制等热路径减少临时对象分配
- [x] 登录页支持自带 API 凭据（BYOK）
- [x] **两步验证（2FA）**：验证码通过后若账号有密码，登录页再要求输入密码（SRP 6a）
- [ ] 三台设备（2.1 模拟器 / 2.2 真机 / 4.0 真机）联调与截图

## 截图

原始 Google Talk 界面（来自 liangmian，作为界面元素的来源）：
`shots/01_buddy_list.png`、`shots/02_chat.png`、`shots/29_android21_signingin.png` 等。

Eclairgram 实测（LG-E610 / Android 4.0.3，真实账号）：

| 截图 | 说明 |
| --- | --- |
| [`shots/ec_android40_dialogs_en.png`](shots/ec_android40_dialogs_en.png) | Android 4.0：深色会话列表、原生相框、用户/群/频道头像 |
| [`shots/ec_android40_chat_en.png`](shots/ec_android40_chat_en.png) | Android 4.0：聊天（仅联系人标题栏 + 气泡；消息区随主题深色） |
| [`shots/ec_android40_details_en.png`](shots/ec_android40_details_en.png) | Android 4.0：点按头像打开的详情页 |
| [`shots/ec_android40_emoji.png`](shots/ec_android40_emoji.png) | Android 4.0：Blobmoji 表情选择器，按分类分节、组内顺序与现代键盘一致 |
| [`shots/ec_android40_photo_inline.png`](shots/ec_android40_photo_inline.png) | Android 4.0：图片消息在气泡里内联显示缩略图 |
| [`shots/ec_android22_dialogs.png`](shots/ec_android22_dialogs.png) | Android 2.2 真机（HTC）：深色列表与原生相框 |

Android 2.1 模拟器上已完成安装与启动验证（该模拟器帧缓冲冻结，未取得截图）。

## 已知限制

- 早期 Android 的 TLS 根证书列表过时；若网络需要 TLS，使用 App 内置的现代根证书。
- Telegram 没有“在线状态/好友列表”的概念：对话列表会映射成好友列表，
  “在线状态”相应地降级展示。
- 3.0（Honeycomb，仅平板）不在支持范围内。

## 致谢与许可

界面与合并构建流程来自 [`liangmian`](https://github.com/xiaomianguan/liangmian)。
Google Talk、Telegram 的相关商标归各自所有者所有；本项目仅供老设备爱好者学习使用。
