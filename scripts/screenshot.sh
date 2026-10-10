#!/bin/bash
# 抓取一张模拟器截图到 $WORKSPACE/shots/<name>.png
#
# 应用已强制竖屏（manifest 的 screenOrientation=portrait），所以默认不再旋转。
# 若在没有该补丁的环境里抓到横屏内容，可用 ROTATE=90 逆时针旋转。
source "$(dirname "$0")/env.sh"
NAME="${1:-shot}"
ROTATE="${ROTATE:-0}"
mkdir -p "$WORKSPACE/shots"
"$ADB" shell dd if=/dev/graphics/fb0 of=/data/local/tmp/fb.raw bs=307200 count=1 >/dev/null 2>&1
"$ADB" pull /data/local/tmp/fb.raw /tmp/fb.raw >/dev/null 2>&1
python3 "$WORKSPACE/scripts/fb_screenshot.py" /tmp/fb.raw "$WORKSPACE/shots/$NAME.png" 320 480 "$ROTATE"
