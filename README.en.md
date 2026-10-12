# Eclairgram — a Telegram client for Android 2.1–4.0 with a Google Talk–style UI

[简体中文](README.md) | **[English (US)](README.en.md)**

> Current version: **`1.0.0-alpha`** (first public preview; `versionCode 1`)

Eclairgram keeps the **Google Talk (Android 2.1 stock Talk) UI** exactly as it was and
swaps the network layer underneath for **Telegram's native MTProto protocol**, producing a
Telegram client that runs on **Android 2.1 (Eclair, API 7) through Android 4.0 (ICS, API 14)**.

The UI comes from [`liangmian`](https://github.com/xiaomianguan/liangmian), a reverse
engineering of the Android 2.1 Google Talk client against a private server. The buddy
list, chat screen, status bar and notifications all reuse the original Talk layouts and
resources with **no pixel-level changes** — only the party we talk to changed, from Google
Talk to Telegram. The one exception is the **app icon**: Eclairgram uses its own paper-plane
icon (below) instead of Talk's launcher icon.

<p align="center">
  <img src="docs/icon.png" alt="Eclairgram icon" width="96">
  <br>
  <sub>Eclairgram's own icon: a paper plane in a speech bubble (no more Talk icon)</sub>
</p>

## Why this exists

- **Old devices still work**: official Telegram stopped supporting these versions long ago
  (the official client requires API 21+). Eclairgram lets this "e-waste" send and receive
  Telegram messages again.
- **A familiar UI**: Google Talk's interface, one of the classic chat UIs of the 2.x era.
- **Single APK, no root**: everything is packed into one APK; a plain `adb install` is enough,
  with no dependency on any preinstalled component.

## Why the certificates are bundled in the app

Telegram data centers authenticate the handshake with **RSA public keys** (not TLS). Those
keys are literally the "certificates needed to get Telegram working" and must ship inside the
client. See [`certs/telegram/`](certs/telegram/): four current keys plus four old keys with
their fingerprints.

Separately, **Android versions before 4.0 cannot install user CAs** (Android 2.1's `core.jar`
only reads the system `cacerts.bks` and never looks at `/data/misc/keychain`), and the
built-in root list is ancient. So when a TLS connection is needed (some networks require it),
the app must carry its own modern root store:
[`certs/roots/ca-certificates.crt`](certs/roots/). Both sets of certificates are packaged into
the APK.

## Architecture

Eclairgram is a **standalone app**: it reuses Google Talk's **UI elements**
(layouts, drawables, colors, strings) but does **not** package Talk's code or
services. The Telegram protocol is handled directly by the native MTProto
implementation in `telegram/`.

```
┌──────────────────────────────────────────────────────────┐
│ Eclairgram (this app's own Activities, pure Java)         │
│  MainActivity     login (BYOK + phone + code); skipped    │
│                   when already signed in                  │
│  DialogsActivity  chat list (reuses Talk avatars/status)  │
│  ChatActivity     chat (reuses Talk im_bubble_* bubbles)  │
└───────────────┬──────────────────────────────────────────┘
                │ TelegramManager (background thread + session)
┌───────────────▼──────────────────────────────────────────┐
│ telegram/: native MTProto (transport/handshake/RPC/API)   │
└───────────────┬──────────────────────────────────────────┘
                │ MTProto (obfuscated2 + abridged, AES-IGE/CTR)
┌───────────────▼──────────────────────────────────────────┐
│ Telegram data centers (bundled DC RSA keys + root CAs)    │
└──────────────────────────────────────────────────────────┘
```

The UI resources come from `decompiled/Talk-USCCi500-2009__Talk/res` and are merged
with `app/single/res` into one resource table at build time (see
`scripts/merge_single_app.py`).

## Repository layout

| Path | Description |
| --- | --- |
| `telegram/` | **Native MTProto client** (pure Java; desktop-testable and compiled into the APK) |
| `telegram/schema/` | official TL schema (layer 229) |
| `telegram/generated/` | generated TL type table (`scripts/gen_tl_schema.py`) |
| `telegram/tools/TgCli.java` | desktop harness to validate the protocol/login first |
| `app/single/src/` | this app's own Activities and TelegramManager |
| `app/single/res/` | this app's own resources (en-US and zh-CN strings) |
| `scripts/merge_single_app.py` | **core**: merges Talk UI resources + this app's code into one APK |
| `scripts/gen_tl_schema.py` | generates the Java type table from the TL schema |
| `decompiled/`, `apks/` | Google Talk decompiled output and APKs (source of UI elements) |
| `certs/telegram/` | Telegram data-center RSA public keys |
| `certs/roots/` | modern roots (for TLS; pre-4.0 can't install user CAs) |
| `scripts/` | build, emulator and screenshot scripts |
| `docs/` | protocol notes and the app icon |
| `shots/` | screenshots (original Google Talk + Eclairgram) |

## Building

The toolchain (JDK8/JDK17, smali, Android build-tools, the Android 2.1 platform and the legacy
emulator) lives in git-ignored `tools/` and `sdk/` directories inside the repo; no global paths
are needed.

```bash
python3 scripts/merge_single_app.py          # build the single APK -> dist/eclairgram.apk
```

### Bring your own API key (BYOK; production ships without one)

The production build ships **without** any `api_id` / `api_hash`. The login screen
has fields for them, so each user supplies **their own** credentials (obtained from
<https://my.telegram.org>). This also avoids handing one person's API key to every
user, which would be a moderation/abuse problem.

The credentials are stored in the app's private SharedPreferences — never baked into
the APK and never committed.

Optional for local development: put credentials in the ignored
`local/secrets.properties` and the build injects them as defaults (handy for testing;
**never committed**):

```properties
# local/secrets.properties (ignored via /local/ in .gitignore)
tg.api_id=<your api_id>
tg.api_hash=<your api_hash>
```

Without that file `BuildSecrets` uses placeholders and the app asks the user to enter
them on the login screen.

### Building a release (production APK)

```bash
# production: no api_id/api_hash at all (BYOK), signed with the release keystore
PRODUCTION=1 \
SIGN_KS=/path/to/release.keystore SIGN_ALIAS=key0 \
SIGN_KS_PASS=... SIGN_KEY_PASS=... \
python3 scripts/merge_single_app.py
# output: dist/eclairgram-release.apk (non-debuggable, release-signed)
```

`PRODUCTION=1` **ignores** `local/secrets.properties` and forces placeholder credentials, so a
published APK never contains anyone's API key. The signing passwords are read from environment
variables via `apksigner`'s `env:` mechanism, so they **never** appear on a command line, in a
log, or in the repository (the keystore is git-ignored just like `local/` and `dist/*.apk`).

## Try the protocol on your desktop first

`telegram/` is pure Java with no Android dependency, so you can validate it with a desktop JVM:

```bash
JDK=~/liangmian/tools/jdk17     # or any JDK 8+
$JDK/bin/javac -d /tmp/tg $(find telegram/src -name '*.java') telegram/tools/TgCli.java
$JDK/bin/java -cp /tmp/tg TgCli handshake      # complete the DH handshake with Telegram
$JDK/bin/java -cp /tmp/tg TgCli getconfig      # encrypted RPC (help.getConfig)
$JDK/bin/java -cp /tmp/tg TgCli sendcode +86xxxxxxxxxxx   # request a code, then type the OTP
```

`handshake` and `getconfig` need no phone number and are the minimal self-check.

## Test devices

| Device | OS | Purpose |
| --- | --- | --- |
| emulator `gtalk21` | Android 2.1 (API 7) | primary target (UI baseline) |
| HTC Wildfire | Android 2.2.1 | real device (low RAM, armeabi) |
| LG-E610 | Android 4.0.3 | real device (ICS; needs the 4.0 compat widgets) |

## UI languages

- default `values/` = **English (US)**
- `values-zh-rCN/` = **Simplified Chinese**

Stock Talk already ships both (and more). Eclairgram's own screens (login/config, bridge
messages) provide en-US and zh-CN as well.

## Status

- [x] Vendored Google Talk's UI and the "merge into a single APK" build from liangmian
- [x] Pure-Java native MTProto: obfuscated2 transport, AES-IGE/AES-CTR, RSA, TL codec
- [x] **DH handshake verified** against production Telegram (auth key created)
- [x] **Encrypted RPC verified** (`help.getConfig` returns a full config, gzip handled)
- [x] **Login verified** (`auth.sendCode` / `auth.signIn`, including `PHONE_MIGRATE` DC switching)
- [x] **Dialogs / history / send verified** (TL schema generates the type table; generic parsing)
- [x] **Talk UI elements reused for the chat list and chat screen** (avatars/status/bubbles/colors)
- [x] **groups and channels** (peerUser / peerChat / peerChannel can all be opened and messaged;
      supergroups `megagroup`/`gigagroup` show as "Group", only broadcast channels show as "Channel")
- [x] **live updates** (`updates.getDifference`; the chat list refreshes automatically)
- [x] **new-message notifications**: the connection stays alive in the background (a resident
      `TelegramService`); new messages post a system notification (chat name + text, with
      sound/vibration) that opens the chat when tapped; the chat you're viewing is skipped
- [x] **UI closer to stock Talk** (bubble roster rows, chat contact header, presence icons)
- [x] **per-Android-version theming** (light on 2.1 / dark on 2.2+)
- [x] **native QuickContactBadge frames** for avatars (Talk's own frame, varies per OS version)
- [x] **avatar loading optimised**: only the small version (a few KB) is fetched; downloads go
      straight to the file DC via `dc_id` from `userProfilePhoto`/`chatPhoto` (skipping a
      `FILE_MIGRATE` round trip); memory + disk cache so relaunches don't re-download;
      the chat list loads avatars **one at a time, top to bottom** (so hundreds of avatars don't
      pile up at once on an old device), and stops when the screen is no longer visible
- [x] **own chat shown as "Saved Messages"** with no status badge; presence only on other users
- [x] **attachments (camera/photo/video)**: the paperclip button left of the input can also
      **take a photo and send it directly** — via an in-app camera (`Camera` API, *not* the
      system camera, so no SD card is needed, with zoom); the captured JPEG is rotated upright in
      memory and sent, writing nothing to user storage; received messages **show an inline thumbnail
      right in the bubble** (a smaller PhotoSize for photos, the document thumb + a play icon for
      videos); tap it to download and view the original (ImageView / VideoView)
- [x] **stickers**: incoming `documentAttributeSticker` messages are rendered; sending uses an
      in-app sticker picker. The picker shows **recently/frequently used stickers first**
      (`messages.getRecentStickers`) and then **loads installed sets one by one** (each appears as
      soon as it arrives), streaming thumbnails per cell; a **bundled libwebp decoder**
      (`native/build_libwebp.sh`, armeabi) decodes the WebP thumbnails, so stickers display even on
      pre-4.0 devices with no system WebP support; **animated stickers (TGS = gzipped Lottie JSON)
      are played by a small built-in Lottie renderer** (`Lottie.java` / `AnimatedStickerView.java`);
      the picker is fully D-pad operable (focus enters the grid, centre sends), and low-RAM devices
      can turn animation off in Settings to render static frames
- [x] **Blobmoji colour emoji**: old font engines can't render colour fonts, so bitmaps are
      extracted at build time (`scripts/gen_emoji_pack.py`) and drawn at runtime via ImageSpan;
      **applied app-wide** — message text, list names/status, chat title, details & My Profile
      (including the edit fields), folder tabs and the media title, so emoji in names no longer
      show as missing-glyph boxes
- [x] **chat UI follows the list theme** (light on 2.1 / dark on 2.2+); bubbles and text adapt too
- [x] **custom Blobmoji emoji picker**: sectioned by the official Unicode categories
      (smileys first, symbols/flags last) with within-section order matching modern keyboards
      (categories and order come from `emoji-test.txt`; old keyboards can't type these emoji);
      fully operable with the D-pad (left/right within a row, up/down between rows, centre to pick)
- [x] **full D-pad navigation**: chat cards, buttons, the input, media bubbles, the settings
      page, the menu and dialogs are all operable with the D-pad, and the focused item has a
      clear orange highlight; long-pressing a card opens its details; **opening a chat focuses
      the input** so you can start typing immediately (the soft keyboard is not auto-shown, so it
      never covers the messages on entry)
- [x] **tap the profile picture to open a details page** (user/group/channel, like Talk's contact page)
- [x] **My Profile**: tap the Saved Messages avatar (or pick it from the chat-list menu) to view and
      edit your photo, name and bio
      (`users.getFullUser` / `account.updateProfile` / `photos.uploadProfilePhoto`)
- [x] **pinned Saved Messages**: the chat list keeps Saved Messages/My Profile at the top with a
      distinct full-row background (mirrors Talk's self-status row
      `roster_list_self_status_background`: a solid color normally, transparent when
      pressed/selected so the system list highlight — which adapts to the Android version — shows)
- [x] **single app, single launcher icon**: already-signed-in users go straight to the chat list;
      the session persists
- [x] **app icon**: Eclairgram's own icon (a paper plane in a speech bubble) replaces Talk's
      launcher icon (`ic_launcher_eclairgram`, with ldpi/mdpi/hdpi/xhdpi sizes)
- [x] **chat folders**: when the account has folders, the top bar becomes a native tab bar
      (TabWidget) to switch between them; otherwise the title bar stays. Tabs use the stock 2.x
      look (large icon on top, label below, ROM-provided selected background);
      **when the tabs fit on one screen they stretch to fill it, and when there are more they
      scroll horizontally**. Folders come from `messages.getDialogFilters`; note that
      `messages.getDialogs`'s `folder_id` only supports the archive (0/1), so custom folders are
      **filtered client-side**
- [x] **complete chat list**: `messages.getDialogs` is paginated (`offset_date`/`offset_id`/
      `offset_peer`, 100 per page), so folders and search cover the **entire** chat list rather
      than only the most recent batch
- [x] **chat-list system menu** (Menu key): My Profile / Search / Settings / Log out, using the
      native Android 2.1–4.0 options menu (an icon + label grid, just like stock Talk)
- [x] **search chats**: filters by chat title (a search field appears at the top of the list); the
      system search key found on some older devices also opens it
- [x] **settings page**: language (system default / English / Simplified Chinese — a restart applies
      it), a notifications toggle (off stops background new-message notifications) and an
      **animated-stickers toggle** (off renders static frames on low-RAM devices)
- [x] **performance work for old devices**: the emoji bitmap pack is **mmap'd off-heap** (no longer
      ~2.5 MB of Java heap); avatar/emoji bitmaps use **bounded LRU caches** and are downsampled to
      display size; the message list **polls only while visible** and skips rebinding when nothing
      changed; the **DH private exponent is 256-bit** (login several times faster, no security loss);
      hot paths (AES-IGE / PBKDF2 / hex) allocate far less
- [x] login screen supports bring-your-own API key (BYOK)
- [x] **two-step verification (2FA)**: after the code is accepted, if the account has a password the
      login screen asks for it (SRP 6a)
- [x] **joint testing on all three devices**: Android 2.1 emulator, 2.2 phone (HTC Wildfire) and
      4.0 phone (LG-E610) — launch, full chat list, chat, sticker send/receive, search, settings and
      D-pad navigation all pass, with no crashes

## Screenshots

Original Google Talk UI (from liangmian, the source of the UI elements):
`shots/01_buddy_list.png`, `shots/02_chat.png`, `shots/29_android21_signingin.png`, etc.

Eclairgram on a real device (LG-E610 / Android 4.0.3, real account):

| Screenshot | Description |
| --- | --- |
| [`shots/ec_android40_dialogs_en.png`](shots/ec_android40_dialogs_en.png) | Android 4.0: dark chat list, native frames, user/group/channel photos |
| [`shots/ec_android40_chat_en.png`](shots/ec_android40_chat_en.png) | Android 4.0: chat (contact header only + bubbles; message area follows the theme) |
| [`shots/ec_android40_details_en.png`](shots/ec_android40_details_en.png) | Android 4.0: details page opened by tapping the avatar |
| [`shots/ec_android40_emoji.png`](shots/ec_android40_emoji.png) | Android 4.0: Blobmoji emoji picker, sectioned by category in modern-keyboard order |
| [`shots/ec_android40_photo_inline.png`](shots/ec_android40_photo_inline.png) | Android 4.0: a photo message with its inline thumbnail |
| [`shots/ec_android22_dialogs.png`](shots/ec_android22_dialogs.png) | Android 2.2 phone (HTC): dark list with native frames |

Install, launch and the UI were also verified on the Android 2.1 emulator (its framebuffer is
frozen and the system has no `screencap`, so screenshots were taken via the app's own `DebugShot`,
which draws the decor view).

## Known limitations

- Early Android root stores are outdated; when TLS is required the app uses its bundled modern
  roots.
- Telegram has no "presence/roster" concept: dialogs map to the buddy list and online status is
  degraded accordingly.
- 3.0 (Honeycomb, tablet-only) is out of scope.

## Credits and license

The UI and the merge build come from [`liangmian`](https://github.com/xiaomianguan/liangmian).
Google Talk and Telegram trademarks belong to their respective owners; this project is for
old-device enthusiasts only.
