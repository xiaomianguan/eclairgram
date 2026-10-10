# compat —— Android 2.2–4.0 兼容类

`legacy/smali/` 里是从 **Android 2.1 框架**（以及 GoogleServicesFramework 里的
protobuf 库）反编译出来的类，它们要么在 2.1 之后被移除、要么被改成包私有，
导致原版 Google Talk（为 2.1 编译）在 2.2+ 上启动即 `NoClassDefFoundError` /
`IllegalAccessError`。

把这些类一起打进 APK 后：

- **Android 2.1**：系统 boot classpath 里已有同名类，优先使用系统版本，
  这里的副本被忽略（无害）。
- **Android 2.2 / 2.3 / 4.0**：系统里没有这些类，由本 APK 提供，应用即可运行。

包含（共 83 个类）：

- `android.provider.Im*`（IM 数据提供者常量，2.2 起从 AOSP 移除）

  > 构建时会由 `patch_im_package()` 整体改名到私有包
  > `cc.wuersan008.eclairgram.im.Im*`。原因：2.1 的系统框架里**仍有**
  > `android.provider.Im`，且其 `CONTENT_URI` 指向旧 authority
  > `com.google.android.providers.talk`；为与真机预装的 Google Talk 共存，本应用
  > 的 provider 已改到私有 authority，若继续用系统框架的 `Im` 常量，2.1 上会崩。
  > 改名后所有版本都只用本 APK 内的常量。
- `android.provider.Gmail*`、`android.provider.Settings$Gservices*`
- `android.net.NetworkConnectivityListener*`、`android.os.Base64Utils`、
  `android.os.NetStat`、`android.text.util.Regex`、`android.text.util.Rfc822Validator`
- `com.google.common.io.protocol.ProtoBuf` / `ProtoBufType`（来自 GSF 的 protobuf 库）
- `com.google.android.net.NetworkStatsEntity*`（4.0 起从框架移除；仅被 HTTP 客户端引用）

`Settings$Gservices.getString` 做了一处小改动：2.2+ 的 `Settings$NameValueCache`
变成包私有，跨 classloader 访问会抛 `IllegalAccessError`，因此改为直接返回 null
（本项目不使用 Gservices，服务器地址由 `ServerConfig` 提供）。

## Android 4.0 的两处特殊处理

- **`android.security.MessageDigest` 不打包，改为在构建时把类型引用替换成标准库的
  `java.security.MessageDigest`**（`patch_message_digest()`）。原因：该类的实现是
  native 方法，绑在 2.1 框架的 JNI 里，4.0 已移除对应绑定；即使把 Java 类打包进来，
  在 4.0 上调用也会 `UnsatisfiedLinkError`。而 Smack 的资源绑定（登录关键路径）要用
  它。两者的 `getInstance` / `update` / `digest` 签名一致，换成标准库后 2.1–4.0 行为相同。
- **`com.android.internal.widget.ContactHeaderWidget` 用 4.0 替身实现**，见
  [`app/compat/README.md`](../app/compat/README.md)：4.0 起该框架控件被移除，而原版
  `chat_screen` 布局仍引用它。替身的外观/布局照抄 2.1 框架的 `contact_header`，仅在
  4.0+ 生效（2.1–2.3 由系统框架的原版类提供，界面不变）。

这些类来自 AOSP / Google，按 Apache License 2.0 分发。
