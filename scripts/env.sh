#!/bin/bash
# 统一的环境变量脚本 / Shared environment for the GTalk reverse-engineering workbench.
#
# 工作区根目录就是本仓库根目录，**不需要** /workspace 之类的全局路径。
# 所有工具链（JDK、build-tools、模拟器、smali）都放在仓库内被 .gitignore 忽略的
# 目录里，因此不会污染系统环境。
export WORKSPACE="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

export ANDROID_SDK_ROOT=$WORKSPACE/sdk
export ANDROID_HOME=$WORKSPACE/sdk
# AVD 与模拟器运行数据都放在仓库内，避免写到 ~/.android
export ANDROID_AVD_HOME=$WORKSPACE/home/.android/avd
export ANDROID_SDK_HOME=$WORKSPACE/home
export ANDROID_EMULATOR_HOME=$WORKSPACE/home/.android
export JAVA_HOME=$WORKSPACE/tools/jdk17
export PATH="$JAVA_HOME/bin:$WORKSPACE/sdk/platform-tools:$WORKSPACE/sdk/build-tools/android-11:$PATH"
export ADB=$WORKSPACE/sdk/platform-tools/adb
export AVD_NAME=gtalk21

# Android 2.1 只能用 2015 年的旧模拟器（新模拟器拒绝 2.1 内核）。
export EMULATOR=$WORKSPACE/tools/legacy-emulator/tools/emulator64-arm

# 构建工具（merge_single_app.py 会读取这些变量）
export JDK8_HOME=$WORKSPACE/tools/jdk8
export SMALI_JAR=$WORKSPACE/tools/smali-2.5.2.jar
export BAKSMALI_JAR=$WORKSPACE/tools/baksmali-2.5.2.jar
