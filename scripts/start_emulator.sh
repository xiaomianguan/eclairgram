#!/bin/bash
# 启动 Android 2.x (ARM) 模拟器，无窗口模式。
#
# 用法: start_emulator.sh [api]
#   api = 7 (默认, 2.1) / 8 (2.2) / 9 (2.3.1) / 10 (2.3.3) / 14 (4.0)
#
# 说明：新版 Android 模拟器拒绝这些老内核（要求 3.10+），所以用 2015 年的
# 旧模拟器 emulator64-arm（tools/legacy-emulator/）。它是纯软件模拟（TCG），
# 启动较慢（几分钟），属正常现象。
source "$(dirname "$0")/env.sh"

API="${1:-7}"
RAM=256
case "$API" in
  7)  AVD_NAME=gtalk21; PLATFORM=android-7;  DISP="GTalk 2.1" ;;
  8)  AVD_NAME=gtalk22; PLATFORM=android-8;  DISP="GTalk 2.2" ;;
  9)  AVD_NAME=gtalk23; PLATFORM=android-9;  DISP="GTalk 2.3.1" ;;
  10) AVD_NAME=gtalk233; PLATFORM=android-10; DISP="GTalk 2.3.3" ;;
  # Android 4.0 起内核/系统体积明显变大，256M 会频繁 OOM，给到 512M。
  14) AVD_NAME=gtalk14; PLATFORM=android-14; DISP="GTalk 4.0"; RAM=512 ;;
  *) echo "用法: $0 [api: 7|8|9|10|14]"; exit 1 ;;
esac

AVD_DIR="$ANDROID_AVD_HOME/$AVD_NAME.avd"
AVD_INI="$ANDROID_AVD_HOME/$AVD_NAME.ini"
mkdir -p "$AVD_DIR" "$WORKSPACE/logs"

# 每次启动都按当前仓库路径重写 AVD 配置，避免依赖任何全局绝对路径。
cat > "$AVD_INI" <<EOF
avd.ini.encoding=UTF-8
path=$AVD_DIR
path.rel=avd/$AVD_NAME.avd
target=$PLATFORM
EOF

cat > "$AVD_DIR/config.ini" <<EOF
AvdId=$AVD_NAME
avd.ini.displayname=$DISP
avd.ini.encoding=UTF-8
abi.type=armeabi
hw.cpu.arch=arm
hw.cpu.ncore=1
hw.ramSize=$RAM
vm.heapSize=24
disk.dataPartition.size=128M
hw.lcd.density=160
hw.lcd.width=320
hw.lcd.height=480
hw.lcd.depth=16
hw.initialOrientation=portrait
hw.keyboard=yes
hw.mainKeys=no
hw.dPad=no
hw.trackBall=no
hw.gps=yes
hw.battery=yes
hw.accelerometer=yes
hw.sensors.orientation=yes
hw.sensors.proximity=no
hw.audioInput=no
hw.audioOutput=no
hw.camera.back=none
hw.camera.front=none
hw.sdCard=no
hw.gpu.enabled=no
hw.gpu.mode=off
image.sysdir.1=platforms/$PLATFORM/images/
skin.dynamic=no
skin.name=HVGA
skin.path=platforms/$PLATFORM/skins/HVGA
showDeviceFrame=no
runtime.network.latency=none
runtime.network.speed=full
EOF

LOG="$WORKSPACE/logs/emulator-$AVD_NAME.log"
cd "$(dirname "$EMULATOR")"
setsid nohup stdbuf -oL -eL "$EMULATOR" \
  -avd "$AVD_NAME" \
  -no-window -no-audio -no-boot-anim -no-snapshot-save \
  -show-kernel \
  -verbose > "$LOG" 2>&1 < /dev/null &
echo "emulator launching ($DISP, api=$API), log: $LOG"
echo "等待开机完成： $ADB wait-for-device; $ADB shell getprop dev.bootcomplete"
