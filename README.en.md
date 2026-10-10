# Eclairgram — a Telegram client for Android 2.1–4.0 with a Google Talk–style UI

[简体中文](README.md) | **[English (US)](README.en.md)**

Eclairgram keeps the **Google Talk (Android 2.1 stock Talk) UI** exactly as it was and
swaps the network layer underneath for **Telegram's native MTProto protocol**, producing a
Telegram client that runs on **Android 2.1 (Eclair, API 7) through Android 4.0 (ICS, API 14)**.

The UI comes from [`liangmian`](https://github.com/xiaomianguan/liangmian), a reverse
engineering of the Android 2.1 Google Talk client against a private server. The buddy
list, chat screen, status bar and notifications all reuse the original Talk layouts and
resources with **no pixel-level changes** — only the party we talk to changed, from Google
Talk to Telegram.

<p align="center">
  <img src="docs/icon_upside_down.png" alt="Talk icon flipped 180°" width="96">
  <br>
  <sub>Following liangmian: the icon is flipped 180° to tell it apart from stock Google Talk</sub>
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

```
┌──────────────────────────────────────────────────────────┐
│ Talk UI (original smali + resources, untouched)           │
│  BuddyList · ChatScreen · status/notifications            │
└───────────────┬──────────────────────────────────────────┘
                │ ContentResolver / AIDL
┌───────────────▼──────────────────────────────────────────┐
│ GTalkService + TalkProvider (original, untouched)         │
│  writes contacts/messages/presence into TalkProvider      │
└───────────────┬──────────────────────────────────────────┘
                │ MTalk/MCS (loopback, inside the app only)
┌───────────────▼──────────────────────────────────────────┐
│ Eclairgram bridge (new, pure Java)                        │
│  · in-app MTalk server (the object GTalkService talks to) │
│  · native Telegram MTProto client (handshake/crypto)      │
│  · maps Telegram dialogs↔buddies, messages↔messages       │
└───────────────┬──────────────────────────────────────────┘
                │ MTProto (obfuscated2 + abridged, AES-IGE/CTR)
┌───────────────▼──────────────────────────────────────────┐
│ Telegram data centers (bundled DC RSA keys + root CAs)    │
└──────────────────────────────────────────────────────────┘
```

## Repository layout

| Path | Description |
| --- | --- |
| `telegram/` | **Native MTProto client** (pure Java; desktop-testable and compiled into the APK) |
| `telegram/src/.../mtproto/` | transport, AES-IGE/CTR, RSA, TL codec, DH handshake, RPC |
| `telegram/tools/TgCli.java` | desktop harness to validate the protocol/login first |
| `app/` | this app's own classes (login/config, bridge) and 4.0 compat widgets |
| `scripts/merge_single_app.py` | **core**: merges the UI and bridge into a single APK |
| `decompiled/`, `apks/` | Google Talk decompiled output and APKs (the UI source) |
| `compat/` | Android 2.2–4.0 compatibility classes and replacement widgets |
| `certs/telegram/` | Telegram data-center RSA public keys |
| `certs/roots/` | modern roots (for TLS; pre-4.0 can't install user CAs) |
| `scripts/` | build, emulator and screenshot scripts |
| `server/` | private MTalk server used during development to drive the original UI |
| `docs/` | protocol notes and screenshots |
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
- [ ] bridge into the Talk UI (buddy list shows Telegram dialogs)
- [ ] joint testing + screenshots on all three devices (2.1 emulator / 2.2 / 4.0)

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
