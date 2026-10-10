#!/bin/bash
# 停止模拟器。
source "$(dirname "$0")/env.sh"
"$ADB" emu kill 2>/dev/null
sleep 2
pkill -x emulator64-arm 2>/dev/null
sleep 1
pkill -9 -x emulator64-arm 2>/dev/null
echo stopped
