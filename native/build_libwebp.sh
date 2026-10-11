#!/bin/bash
# 交叉编译 libwebp 的解码器 + JNI 封装，产出 app/single/libs/armeabi/libeclairwebp.so
#
# 为什么需要它：Telegram 的贴纸缩略图是 WebP（VP8X+ALPH+VP8），而 Android 4.0
# 之前系统自带的多媒体库不支持 WebP，BitmapFactory 解不了。这里用 libwebp 的
# 参考实现解出 RGBA，再交给 Java 转成 Bitmap。
#
# 目标：armeabi（ARMv5TE / 软浮点），因为 HTC Wildfire 之类的老机器是 ARMv6，
# 只能用 ARMv5 指令集；软浮点则保证不需要 VFP。
#
# 说明：NDK 从 r17 起不再提供 armeabi，但现代 clang 仍可用
# `--target=armv5te-none-linux-androideabi -march=armv5te -mfloat-abi=soft` 编译
# ARMv5 代码；用 -nostdlib 链接，`__aeabi_*` 等符号留给设备上的 libc 在加载时解析
# （实测 Android 2.2 的 libc 导出了全部所需符号）。
set -e

WS="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
NDK="${ANDROID_NDK_HOME:-$HOME/Android/Sdk/ndk/21.4.7075529}"
CLANG="$NDK/toolchains/llvm/prebuilt/linux-x86_64/bin/clang"
STRIP="$NDK/toolchains/llvm/prebuilt/linux-x86_64/bin/llvm-strip"
SR="$NDK/toolchains/llvm/prebuilt/linux-x86_64/sysroot"
# r21 的 armeabi sysroot 只提供 API 16+ 的 libc/libm 桩（用于链接，运行时不使用）
SR_LIB="$SR/usr/lib/arm-linux-androideabi/16"
WEBP_VER="${WEBP_VER:-1.3.2}"
WORK="${WORK:-$WS/build/libwebp}"
OUT="$WS/app/single/libs/armeabi"

mkdir -p "$WORK" "$OUT"
cd "$WORK"

if [ ! -d "libwebp-$WEBP_VER" ]; then
  echo "下载 libwebp-$WEBP_VER ..."
  curl -sL -o libwebp.tar.gz \
    "https://storage.googleapis.com/downloads.webmproject.org/releases/webp/libwebp-$WEBP_VER.tar.gz"
  tar xzf libwebp.tar.gz
fi
LW="$WORK/libwebp-$WEBP_VER"

echo "编译 libeclairwebp.so (armeabi / ARMv5TE) ..."
"$CLANG" --target=armv5te-none-linux-androideabi -march=armv5te -mfloat-abi=soft \
  -nostdlib -fPIC -shared -Wl,-soname,libeclairwebp.so \
  -L "$SR_LIB" -lc -lm \
  -I "$LW" -I "$LW/src" -O2 \
  -o "$OUT/libeclairwebp.so" \
  "$LW"/src/dec/*.c "$LW"/src/dsp/*.c "$LW"/src/utils/*.c \
  "$WS/native/eclair_webp.c"
"$STRIP" --strip-unneeded "$OUT/libeclairwebp.so"
echo "产物：$OUT/libeclairwebp.so"
