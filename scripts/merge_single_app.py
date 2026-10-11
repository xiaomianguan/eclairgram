#!/usr/bin/env python3
"""把 Google Talk 的**界面资源**（drawable / layout / style / string / color ...）
与 eclairgram 自己的代码合并成单一 APK。

设计要点：
  * 只复用 Talk 的**资源**，不打包 Talk 的代码/服务——eclairgram 是一个独立的、
    行为像正常 Telegram 客户端的应用，Telegram 协议由 telegram/ 里的原生实现负责。
  * 因此不再需要合并 smali、也不再需要重写内联资源 ID（那套流程只为把 Talk 的
    代码搬进来而存在）。
  * Telegram 的 api_id/api_hash 从被忽略的 local/secrets.properties 读取注入；
    生产版不带 key，由用户在登录页自带（BYOK）。

产物：dist/eclairgram.apk
"""
import os
import re
import shutil
import subprocess
import sys

WS = os.environ.get('WORKSPACE') or os.path.dirname(
    os.path.dirname(os.path.abspath(__file__)))
BT = os.environ.get('BUILD_TOOLS', f'{WS}/sdk/build-tools/android-11')
AJAR = os.environ.get('ANDROID_JAR', f'{WS}/sdk/platforms/android-7/android.jar')
JDK8 = os.environ.get('JDK8_HOME', f'{WS}/tools/jdk8')
PKG = 'cc.wuersan008.eclairgram'
WORK = f'{WS}/build/merged'

# 资源来源：Talk 的界面资源 + 本应用自己的资源
TALK_RES = f'{WS}/decompiled/Talk-USCCi500-2009__Talk/res'
APP_RES = f'{WS}/app/single/res'
RES_DIRS = [TALK_RES, APP_RES]

ORIGINS = {
    f'{WS}/app/single/src',
    f'{WS}/telegram/src',
    f'{WS}/telegram/generated',
}


def run(cmd, **kw):
    print('  $', ' '.join(cmd))
    subprocess.check_call(cmd, **kw)


def javac_env():
    env = dict(os.environ)
    env['JAVA_HOME'] = os.environ.get('JAVA17_HOME', f'{WS}/tools/jdk17')
    return env


def merge_values(store, rel, path):
    """按 (tag,name) 去重合并 values 文件（先到先得）。"""
    import xml.etree.ElementTree as ET
    ET.register_namespace('android', 'http://schemas.android.com/apk/res/android')
    try:
        root = ET.parse(path).getroot()
    except Exception as exc:
        print(f'  ! 跳过 {path}: {exc}')
        return
    for child in root:
        name = child.get('name')
        key = (child.tag, name) if name else (child.tag, ET.tostring(child)[:80])
        store.setdefault(rel, {})
        store.setdefault(rel, {}).setdefault(key, ET.tostring(child, encoding='unicode').strip())


def stage_res():
    print('[1/3] 合并界面资源')
    out = f'{WORK}/res'
    shutil.rmtree(out, ignore_errors=True)
    os.makedirs(out)
    value_files = {}
    for resdir in RES_DIRS:
        if not os.path.isdir(resdir):
            continue
        for dirpath, _, files in os.walk(resdir):
            rel_dir = os.path.relpath(dirpath, resdir)
            for fn in files:
                rel = fn if rel_dir == '.' else os.path.join(rel_dir, fn)
                full = os.path.join(dirpath, fn)
                norm = rel.replace('\\', '/')
                if norm.startswith('values') and fn.endswith('.xml'):
                    if fn == 'public.xml':
                        continue          # 强制旧 ID，丢弃
                    merge_values(value_files, rel, full)
                    continue
                dst = os.path.join(out, rel)
                os.makedirs(os.path.dirname(dst), exist_ok=True)
                if not os.path.exists(dst):
                    shutil.copy2(full, dst)
    for rel, entries in value_files.items():
        dst = os.path.join(out, rel)
        os.makedirs(os.path.dirname(dst), exist_ok=True)
        with open(dst, 'w', encoding='utf-8') as fh:
            fh.write('<?xml version="1.0" encoding="utf-8"?>\n<resources>\n')
            for text in entries.values():
                fh.write(text + '\n')
            fh.write('</resources>\n')
    print(f'   资源文件数={sum(len(f) for _, _, f in os.walk(out))}')


def write_build_secrets(outdir):
    os.makedirs(outdir, exist_ok=True)
    api_id, api_hash = '0', 'PLACEHOLDER'
    sec = f'{WS}/local/secrets.properties'
    if os.path.exists(sec):
        for line in open(sec, encoding='utf-8'):
            line = line.strip()
            if line.startswith('tg.api_id'):
                api_id = line.split('=', 1)[1].strip()
            elif line.startswith('tg.api_hash'):
                api_hash = line.split('=', 1)[1].strip()
    with open(f'{outdir}/BuildSecrets.java', 'w', encoding='utf-8') as fh:
        fh.write('package %s;\n' % PKG)
        fh.write('/** 构建时从 local/secrets.properties 注入（不入库）。 */\n')
        fh.write('public final class BuildSecrets {\n')
        fh.write('    public static final int API_ID = %s;\n' % api_id)
        fh.write('    public static final String API_HASH = "%s";\n' % api_hash)
        fh.write('    private BuildSecrets() {}\n}\n')
    print('   已注入 api_id/api_hash（来自 local/secrets.properties）'
          if os.path.exists(sec) else '   ! 未找到 local/secrets.properties，使用占位值（BYOK）')


def main():
    os.makedirs(WORK, exist_ok=True)
    os.makedirs(f'{WS}/dist', exist_ok=True)

    stage_res()

    print('[2/3] 编译应用代码')
    gen = f'{WORK}/gen'
    shutil.rmtree(gen, ignore_errors=True)
    os.makedirs(gen)
    manifest = f'{WS}/app/single/AndroidManifest.xml'
    if os.environ.get('DEBUGGABLE', '0') == '1':
        # 仅调试用：允许 run-as 访问应用私有数据（例如预置会话做离线联调）。
        txt = open(manifest, encoding='utf-8').read()
        txt = txt.replace('<application ', '<application android:debuggable="true" ', 1)
        os.makedirs(f'{WORK}/debug', exist_ok=True)
        manifest = f'{WORK}/debug/AndroidManifest.xml'
        open(manifest, 'w', encoding='utf-8').write(txt)
        print('   ! android:debuggable=true（仅调试）')
    base = f'{WORK}/base.apk'
    if os.path.exists(base):
        os.remove(base)
    run([f'{BT}/aapt', 'package', '-f', '-M', manifest, '-S', f'{WORK}/res',
         '-A', f'{WS}/app/single/assets',
         '-I', AJAR, '-J', gen, '-F', base,
         '--min-sdk-version', '7', '--target-sdk-version', '7'])

    secrets_dir = f'{WORK}/gensecrets'
    shutil.rmtree(secrets_dir, ignore_errors=True)
    write_build_secrets(f'{secrets_dir}/{PKG.replace(".", "/")}')

    classes = f'{WORK}/classes'
    shutil.rmtree(classes, ignore_errors=True)
    os.makedirs(classes)
    srcs = []
    for d in list(ORIGINS) + [secrets_dir, gen]:
        for dp, _, fs in os.walk(d):
            for f in fs:
                if f.endswith('.java'):
                    srcs.append(os.path.join(dp, f))
    run([f'{JDK8}/bin/javac', '-encoding', 'UTF-8', '-source', '1.7', '-target', '1.7',
         '-bootclasspath', AJAR, '-nowarn', '-d', classes] + srcs, env=javac_env())

    print('[3/3] 打包')
    dexdir = f'{WORK}/dex'
    shutil.rmtree(dexdir, ignore_errors=True)
    os.makedirs(dexdir)
    classlist = f'{WORK}/classes.txt'
    open(classlist, 'w').write('\n'.join(
        os.path.join(dp, f) for dp, _, fs in os.walk(classes)
        for f in fs if f.endswith('.class')))
    run([f'{BT}/d8', '--lib', AJAR, '--min-api', '7', '--output', dexdir,
         '@' + classlist], env=javac_env())
    run([f'{BT}/aapt', 'add', base, 'classes.dex'], cwd=dexdir)

    # 打包原生库（libwebp 解码器：老系统的贴纸缩略图是 WebP，见 native/build_libwebp.sh）
    libsrc = f'{WS}/app/single/libs'
    if os.path.isdir(libsrc):
        libstage = f'{WORK}/lib'
        shutil.rmtree(libstage, ignore_errors=True)
        for abi in sorted(os.listdir(libsrc)):
            srcdir = os.path.join(libsrc, abi)
            if not os.path.isdir(srcdir):
                continue
            os.makedirs(os.path.join(libstage, abi))
            for so in sorted(os.listdir(srcdir)):
                shutil.copy2(os.path.join(srcdir, so), os.path.join(libstage, abi, so))
                run([f'{BT}/aapt', 'add', base, f'lib/{abi}/{so}'], cwd=WORK)
        print('   已打包原生库 lib/')

    aligned = f'{WORK}/aligned.apk'
    run([f'{BT}/zipalign', '-f', '4', base, aligned])
    out = f'{WS}/dist/eclairgram.apk'
    run([f'{BT}/apksigner', 'sign',
         '--key', f'{WS}/keys/testkey.pk8', '--cert', f'{WS}/keys/testkey.x509.pem',
         '--min-sdk-version', '7', '--v1-signing-enabled', 'true',
         '--v2-signing-enabled', 'false', '--out', out, aligned], env=javac_env())
    print('  产物：', out, os.path.getsize(out), 'bytes')


if __name__ == '__main__':
    main()
