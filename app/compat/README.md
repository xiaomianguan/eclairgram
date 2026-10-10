# app/compat —— Android 4.0 专用替身控件

这里放**只在 Android 4.0+ 生效**的兼容实现，用来补上 4.0 从框架里移除、
但原版 Google Talk（为 2.1 编译）仍在引用的控件。

## 为什么需要

原版 Talk 的 `chat_screen` 布局里有：

```xml
<view class="com.android.internal.widget.ContactHeaderWidget" ... />
```

`com.android.internal.widget.ContactHeaderWidget` 在 Android 4.0 中被从框架移除
（改到 Contacts 应用里去了）。4.0 上 inflate 聊天界面时会直接
`ClassNotFoundException` 崩溃。此外，该控件的实现依赖框架内部资源 ID
（`contact_header` 布局、`android:id/name` 等），这些非公开资源 ID 在 4.0 上
已经移位，因此**不能**直接把 2.1 的控件类打包进来。

## 做法

- `src/com/android/internal/widget/ContactHeaderWidget.java`
  与框架原版**同名同签名**的替身（`setDisplayName` / `setPhoto` /
  `setSocialSnippet` / `setPresence` / `setContactUri` / `bindFromEmail`），
  内部 inflate 下面的布局。
- `res/layout/eclairgram_contact_header.xml`
  布局结构照抄 2.1 框架的 `res/layout/contact_header.xml`（背景条、头像、名称、
  在线状态图标）。
- `res/drawable-*/eclairgram_title_bar_medium.png`、`eclairgram_ic_contact_picture.png`
  取自 2.1 框架 `framework-res.apk` 的 `title_bar_medium` / `ic_contact_picture`。

构建脚本 `scripts/merge_single_app.py` 会把本目录的 `src/` 一起编译、
把 `res/` 一起打进 APK。

## 不影响老版本

- **Android 2.1 / 2.2 / 2.3**：系统框架里仍有同名类，boot classpath 优先，
  本类被忽略；布局也仍用系统框架的原版，界面与行为完全不变。
- **Android 4.0**：框架没有该类，使用本替身，渲染出的联系人标题与 2.1 一致。

这些资源来自 AOSP，按 Apache License 2.0 分发。
