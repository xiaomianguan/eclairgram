#!/usr/bin/env python3
"""把 Google Talk 的四个部分合并成**单一自包含 APK**。

合并来源：
  * Talk.apk          (com.google.android.talk)              —— 原始界面
  * gtalkservice.apk  (com.google.android.apps.gtalkservice) —— 连接服务
  * TalkProvider.apk  (com.google.android.providers.talk)    —— 数据提供者
  * gtalkservice.jar  (com.google.android.gtalkservice)      —— 共享库接口
  * 本仓库的登录服务实现（不依赖任何预装组件）

产物：单一 APK，包名 cc.wuersan008.eclairgram，
不需要 root、不需要任何预装的 Google 组件。

关键点：
  1) 三份 APK 的资源原本各用 0x7f 包号，合并后资源 ID 会全部重排。
     因此必须删除反编译出的 R*.smali（里面是写死的旧 ID），
     改为用 aapt --extra-packages 重新生成正确的 R 类。
     代码里是 sget Lcom/.../R$string;->foo:I 这种**符号引用**，
     所以只要 R 类的值正确，代码无需改动。
  2) 只有极少数资源重名且取值不同，才需要改名（见 RENAMES）。
  3) GTalkService 用 setClassName 写死了登录服务的包名，
     合并后必须改指向本应用自己的组件（非 UI 改动）。
"""
import os
import re
import shutil
import struct
import subprocess
import sys
import zlib

WS = os.environ.get('WORKSPACE') or os.path.dirname(
    os.path.dirname(os.path.abspath(__file__)))
BT = os.environ.get('BUILD_TOOLS', f'{WS}/sdk/build-tools/android-11')
AJAR = os.environ.get('ANDROID_JAR', f'{WS}/sdk/platforms/android-7/android.jar')
JDK8 = os.environ.get('JDK8_HOME', f'{WS}/tools/jdk8')


def _pick_jars(kind):
    """smali/baksmali 的 fat jar 版本可能不同，按存在性自动挑选。"""
    if os.environ.get('SMALI_JAR' if kind == 'smali' else 'BAKSMALI_JAR'):
        return os.environ['SMALI_JAR' if kind == 'smali' else 'BAKSMALI_JAR']
    for name in (f'{kind}-3.0.10-fat.jar', f'{kind}-2.5.2.jar',
                 f'{kind}.jar'):
        p = f'{WS}/tools/{name}'
        if os.path.exists(p):
            return p
    return f'{WS}/tools/{kind}-3.0.10-fat.jar'


BAKSMALI = _pick_jars('baksmali')
SMALI = _pick_jars('smali')
PKG = 'cc.wuersan008.eclairgram'
APPCLASS = 'cc.wuersan008.eclairgram'
WORK = f'{WS}/build/merged'

SRC = {
    'talk':  {'dir': f'{WS}/decompiled/Talk-USCCi500-2009__Talk', 'pkg': 'com.google.android.talk'},
    'gsvc':  {'dir': f'{WS}/decompiled/gtalkservice-USCCi500-2009__gtalkservice',
              'pkg': 'com.google.android.apps.gtalkservice'},
    'tprov': {'dir': f'{WS}/decompiled/TalkProvider', 'pkg': 'com.google.android.providers.talk'},
}

# 需要改名的资源：只针对重名且取值不同的项。
# (来源, 类型, 原名, 新名)
RENAMES = [
    ('gsvc', 'string', 'app_label', 'gsvc_app_label'),
    ('tprov', 'string', 'app_label', 'tprov_app_label'),
    ('gsvc', 'string', 'group_chat', 'gsvc_group_chat'),
    ('tprov', 'drawable', 'im_bubble_highlight', 'tprov_im_bubble_highlight'),
    ('tprov', 'drawable', 'im_bubble_normal', 'tprov_im_bubble_normal'),
    ('tprov', 'drawable', 'im_bubble_pressed', 'tprov_im_bubble_pressed'),
]

# 与设备上预装的 Google Talk 共存：原版已占用这些 provider authority / 权限名，
# 必须改成带本包名的唯一名字，否则会 INSTALL_FAILED_CONFLICTING_PROVIDER。
# 只改 authority/权限名，不动任何界面资源。
AUTH_RENAMES = {
    'com.google.android.providers.talk': f'{PKG}.providers.talk',
    'com.google.android.talk.SuggestionProvider': f'{PKG}.SuggestionProvider',
    # 自定义权限也要改名：真机上这些权限名已被预装的 Google 服务（GSF）占用，
    # 且多为 signature 级；不改名时本应用既声明不了、也申请不到，会抛
    # SecurityException（例如 "Need GTalk_SERVICE permission"）。
    'com.google.android.gtalkservice.permission.GTALK_SERVICE':
        f'{PKG}.permission.GTALK_SERVICE',
    'com.google.android.gtalkservice.permission.SEND_HEARTBEAT':
        f'{PKG}.permission.SEND_HEARTBEAT',
    'com.google.android.googleapps.permission.GOOGLE_AUTH':
        f'{PKG}.permission.GOOGLE_AUTH',
    'com.google.android.providers.gmail.permission.READ_GMAIL':
        f'{PKG}.permission.READ_GMAIL',
    'com.google.android.permission.BROADCAST_DATA_MESSAGE':
        f'{PKG}.permission.BROADCAST_DATA_MESSAGE',
    'com.google.android.permission.SEND_DATA_MESSAGE':
        f'{PKG}.permission.SEND_DATA_MESSAGE',
    'com.google.android.permission.RECEIVE_DATA_MESSAGE':
        f'{PKG}.permission.RECEIVE_DATA_MESSAGE',
}


def run(cmd, **kw):
    print('  $', ' '.join(cmd) if isinstance(cmd, list) else cmd, flush=True)
    r = subprocess.run(cmd, capture_output=True, text=True, **kw)
    if r.returncode != 0:
        print(r.stdout[-4000:])
        print(r.stderr[-4000:], file=sys.stderr)
        raise SystemExit(f'命令失败({r.returncode}): {cmd}')
    return r


def javac_env():
    env = dict(os.environ)
    env['JAVA_HOME'] = JDK8
    env['PATH'] = f'{JDK8}/bin:' + env['PATH']
    return env


# ------------------------------------------------------- 应用图标（上下翻转）
# 目的：让本应用与原版 Google Talk 区分开。启动器图标另存为新名 eclairgram_icon；
# 其余 Talk 图标（登录中界面的大 logo、以及另外两个未被引用的同名图标）就地翻转，
# 保证“处处都是倒的”。可用 FLIP_ICON=0 关闭。
APP_ICON_SRC = 'ic_launcher_google_talk'
APP_ICON_NEW = 'eclairgram_icon'
# 就地翻转（覆盖原文件）的图标资源名；都是同一个 Google Talk 图标。
FLIP_ICONS_INPLACE = (
    'ic_launcher_google_talk',   # Talk 启动器图标
    'ic_im_logo_gtalk_splash',   # 登录中界面的大 logo
    'ic_launcher_im',            # TalkProvider 的启动器图标（合并后未被引用）
    'app_instant_message',       # GTalkService 的启动器图标（合并后未被引用）
)


def _png_chunks(data):
    i = 8
    while i < len(data):
        ln = struct.unpack('>I', data[i:i + 4])[0]
        yield data[i + 4:i + 8], data[i + 8:i + 8 + ln]
        i += 12 + ln


def _paeth(a, b, c):
    p = a + b - c
    pa, pb, pc = abs(p - a), abs(p - b), abs(p - c)
    if pa <= pb and pa <= pc:
        return a
    return b if pb <= pc else c


def _png_rotate_180(src, dst):
    """把 8-bit RGBA、非隔行的 PNG 旋转 180°（纯标准库实现）。"""
    data = open(src, 'rb').read()
    ihdr, idat = None, b''
    for tag, payload in _png_chunks(data):
        if tag == b'IHDR':
            ihdr = payload
        elif tag == b'IDAT':
            idat += payload
    w, h, bd, ct, _comp, _filt, inter = struct.unpack('>IIBBBBB', ihdr)
    assert bd == 8 and ct == 6 and inter == 0, \
        f'仅支持 8-bit RGBA 非隔行 PNG：{src} ({bd},{ct},{inter})'
    bpp, stride = 4, w * 4
    # 反滤波
    raw = zlib.decompress(idat)
    px = bytearray()
    prev = bytearray(stride)
    i = 0
    for _y in range(h):
        ft = raw[i]; i += 1
        line = bytearray(raw[i:i + stride]); i += stride
        if ft == 1:
            for x in range(bpp, stride):
                line[x] = (line[x] + line[x - bpp]) & 0xff
        elif ft == 2:
            for x in range(stride):
                line[x] = (line[x] + prev[x]) & 0xff
        elif ft == 3:
            for x in range(stride):
                a = line[x - bpp] if x >= bpp else 0
                line[x] = (line[x] + ((a + prev[x]) >> 1)) & 0xff
        elif ft == 4:
            for x in range(stride):
                a = line[x - bpp] if x >= bpp else 0
                c = prev[x - bpp] if x >= bpp else 0
                line[x] = (line[x] + _paeth(a, prev[x], c)) & 0xff
        px += line
        prev = line
    # 像素与行都反向 = 180°
    rev = bytearray()
    for y in range(h - 1, -1, -1):
        row = px[y * stride:(y + 1) * stride]
        for x in range(w - 1, -1, -1):
            rev += row[x * bpp:(x + 1) * bpp]
    raw2 = b''.join(b'\x00' + rev[y * stride:(y + 1) * stride] for y in range(h))

    def chunk(tag, payload):
        return (struct.pack('>I', len(payload)) + tag + payload
                + struct.pack('>I', zlib.crc32(tag + payload) & 0xffffffff))

    out = (b'\x89PNG\r\n\x1a\n' + chunk(b'IHDR', ihdr)
           + chunk(b'IDAT', zlib.compress(raw2, 9)) + chunk(b'IEND', b''))
    open(dst, 'wb').write(out)


def make_flipped_app_icon(res_dir):
    """翻转应用图标：启动器图标另存为 eclairgram_icon，其余 Talk 图标就地翻转。"""
    if os.environ.get('FLIP_ICON', '1') == '0':
        print('   跳过图标翻转（FLIP_ICON=0）')
        return
    # 1) 启动器图标：从原图另存为 eclairgram_icon（必须先于就地翻转）
    n = 0
    for name in os.listdir(res_dir):
        if not name.startswith('drawable'):
            continue
        src = os.path.join(res_dir, name, APP_ICON_SRC + '.png')
        if os.path.exists(src):
            _png_rotate_180(src, os.path.join(res_dir, name, APP_ICON_NEW + '.png'))
            n += 1
    # 2) 其余 Talk 图标：就地翻转（覆盖原文件），保证“处处都是倒的”
    m = 0
    for name in os.listdir(res_dir):
        if not name.startswith('drawable'):
            continue
        for icon in FLIP_ICONS_INPLACE:
            p = os.path.join(res_dir, name, icon + '.png')
            if os.path.exists(p):
                _png_rotate_180(p, p)
                m += 1
    print(f'   图标已翻转：启动器 {n} 个密度 -> @drawable/{APP_ICON_NEW}；'
          f'就地翻转 {m} 个 -> {", ".join(FLIP_ICONS_INPLACE)}')

# ---------------------------------------------------------------- stage 1: smali
def stage_smali():
    """把所有 smali（三个 APK + 共享库）合并成一棵树，并删除写死 ID 的 R 类。"""
    print('[1/5] 合并 smali 树')
    root = f'{WORK}/smali'
    shutil.rmtree(root, ignore_errors=True)
    os.makedirs(root)

    jarsmali = f'{WORK}/jarsmali'
    shutil.rmtree(jarsmali, ignore_errors=True)
    run([f'{JDK8}/bin/java', '-jar', BAKSMALI, 'd',
         f'{WS}/decompiled/gtalkservice-lib.jar', '-o', jarsmali], env=javac_env())

    # gsvc 放最前：它的 googleapps/googlelogin 类与 talk 的完全相同（已校验）
    order = ['gsvc', 'talk', 'tprov']
    seen = {}
    dupes = 0
    for key in order + ['jar']:
        src = jarsmali if key == 'jar' else f'{SRC[key]["dir"]}/smali'
        for dirpath, _, files in os.walk(src):
            for fn in files:
                if not fn.endswith('.smali'):
                    continue
                # 删除 R 类：其 ID 是写死的旧值，必须由 aapt 重新生成
                if re.fullmatch(r'R(\$[A-Za-z0-9_]+)?\.smali', fn):
                    continue
                full = os.path.join(dirpath, fn)
                rel = os.path.relpath(full, src)
                if rel in seen:
                    dupes += 1
                    continue
                seen[rel] = key
                dst = os.path.join(root, rel)
                os.makedirs(os.path.dirname(dst), exist_ok=True)
                shutil.copy2(full, dst)
    print(f'  smali 类数={len(seen)}，跳过重复={dupes}')

    # Android 2.2/2.3 兼容：android.provider.Im、Gmail、Settings$Gservices 等
    # 框架类在 2.1 之后被移除，但原版 Talk 仍会引用它们（2.1 上由系统提供，
    # 2.2+ 上会 NoClassDefFoundError）。这里把 2.1 框架里的这些类打包进来：
    # 2.1 上系统类优先，本 APK 里的定义被忽略（无害）；2.2+ 上由本 APK 提供。
    compat = f'{WS}/compat/legacy/smali'
    compat_n = 0
    if os.path.isdir(compat):
        for dirpath, _, files in os.walk(compat):
            for fn in files:
                if not fn.endswith('.smali'):
                    continue
                rel = os.path.relpath(os.path.join(dirpath, fn), compat)
                if rel in seen:
                    continue
                seen[rel] = 'compat'
                dst = os.path.join(root, rel)
                os.makedirs(os.path.dirname(dst), exist_ok=True)
                shutil.copy2(os.path.join(dirpath, fn), dst)
                compat_n += 1
    print(f'  兼容框架类（2.2/2.3）: {compat_n}')

    import json
    with open(f'{WORK}/origins.json', 'w') as fh:
        json.dump(seen, fh)

    for src, typ, old, new in RENAMES:
        needle = 'L{}/R${};->{}'.format(SRC[src]['pkg'].replace('.', '/'), typ, old)
        repl = needle.replace('->' + old, '->' + new)
        n = 0
        for dirpath, _, files in os.walk(root):
            for fn in files:
                if not fn.endswith('.smali'):
                    continue
                p = os.path.join(dirpath, fn)
                with open(p, encoding='utf-8', errors='surrogateescape') as fh:
                    txt = fh.read()
                if needle in txt:
                    n += txt.count(needle)
                    with open(p, 'w', encoding='utf-8', errors='surrogateescape') as fh:
                        fh.write(txt.replace(needle, repl))
        if n:
            print(f'  smali 引用改名: {typ}/{old} -> {new} ({n} 处)')

    patch_login_bind(root)
    patch_server_host(root)
    patch_plain_socket(root)
    patch_gservices_map(root)
    patch_gservices_calls(root)
    patch_authorities_smali(root)
    patch_im_package(root)
    patch_gtalk_service_bind(root)
    patch_message_digest(root)
    patch_notification_icon(root)
    patch_send_presence_on_status(root)
    patch_provider_contact_on_demand(root)
    patch_trace_delete(root)



def patch_server_host(root):
    """把捆绑进来的原版代码里写死的 Google 域名换成用户配置的私有服务器。

    javac 把 R/常量都内联了，所以 Account.smali 里是**字面量**：
      const-string v4, "mtalk.google.com"   (默认主机，2 处)
      const/16  v5, 0x146c                  (默认端口 5228，2 处)
    因为整个应用在同一个进程里，直接调用我们自己的静态方法即可。
    这不涉及任何界面改动。
    """
    print('   替换写死的 Google 域名为用户配置的服务器')
    get_host = ('invoke-static {}, L' + APPCLASS.replace('.', '/')
                + '/ServerConfig;->getHost()Ljava/lang/String;' + chr(10)
                + '    move-result-object ')
    get_port = ('invoke-static {}, L' + APPCLASS.replace('.', '/')
                + '/ServerConfig;->getPort()I' + chr(10)
                + '    move-result ')

    acct = f'{root}/com/google/android/gtalkservice/Account.smali'
    t = open(acct, encoding='utf-8', errors='surrogateescape').read()
    n_host = t.count('const-string v4, "mtalk.google.com"')
    n_port = t.count('const/16 v5, 0x146c')
    t = t.replace('const-string v4, "mtalk.google.com"', get_host + 'v4')
    t = t.replace('const/16 v5, 0x146c', get_port + 'v5')
    # 该分支比较的也是 Google 域名：让它永远不成立
    t = t.replace('const-string v3, "talk.google.com"', 'const-string v3, ""')
    # 字段里残留的常量字符串也一并清掉（已确认无 sget 引用）
    t = t.replace('.field public static final DEFAULT_GTALK_HOST:Ljava/lang/String;'
                  ' = "mtalk.google.com"',
                  '.field public static final DEFAULT_GTALK_HOST:Ljava/lang/String;'
                  ' = "localhost"')
    open(acct, 'w', encoding='utf-8', errors='surrogateescape').write(t)
    print(f'     Account.smali: 主机 {n_host} 处, 端口 {n_port} 处')

    # 另一个类里的调试用默认值
    gtc = f'{root}/org/jivesoftware/smack/GoogleTalkConnection.smali'
    t = open(gtc, encoding='utf-8', errors='surrogateescape').read()
    assert 'const-string v0, "talk.google.com"' in t
    t = t.replace('const-string v0, "talk.google.com"', get_host + 'v0')
    t = t.replace('const/16 v1, 0x1466', get_port + 'v1')
    open(gtc, 'w', encoding='utf-8', errors='surrogateescape').write(t)
    print('     GoogleTalkConnection.smali: 已替换')


def patch_plain_socket(root):
    """把 TLS 套接字工厂换成普通 SocketFactory，使连接走明文 TCP。

    背景：原版 `GTalkConnection.doConnect()` 无条件用
    `SSLCertificateSocketFactory.getDefault(...)` 建立 TLS 连接。生产机
    `ro.secure=1` 时既不能用 `socket.relaxsslcheck` 旁路，Android 2.1 也不支持
    安装用户 CA，所以 TLS 路线在生产机上无解。本项目只在内网跑，改成明文
    TCP 后即可免 CA、免 root。

    这不涉及任何界面改动，只改网络层。可用 `PLAIN_SOCKET=0` 关闭本补丁。
    """
    if os.environ.get('PLAIN_SOCKET', '1') == '0':
        print('   跳过明文套接字补丁（PLAIN_SOCKET=0）')
        return
    path = f'{root}/com/google/android/gtalkservice/GTalkConnection.smali'
    old = ('invoke-static {v0, v1}, Landroid/net/SSLCertificateSocketFactory;->'
           'getDefault(ILorg/apache/harmony/xnet/provider/jsse/SSLClientSessionCache;)'
           'Ljavax/net/SocketFactory;')
    new = 'invoke-static {}, Ljavax/net/SocketFactory;->getDefault()Ljavax/net/SocketFactory;'
    with open(path, encoding='utf-8', errors='surrogateescape') as fh:
        txt = fh.read()
    assert old in txt, '未找到 GTalkConnection 的 TLS 套接字工厂调用'
    txt = txt.replace(old, new)
    # 上面那段还会先调用 GSF 的 SSLClientSessionCacheFactory.getCache()，
    # 该 GSF 类不存在，会 NoClassDefFoundError。明文模式下不需要会话缓存，
    # 直接置空。
    txt = re.sub(
        r'invoke-static \{v8\}, Lcom/google/android/net/SSLClientSessionCacheFactory;->'
        r'getCache\(Landroid/content/Context;\)'
        r'Lorg/apache/harmony/xnet/provider/jsse/SSLClientSessionCache;\s*\n\s*'
        r'move-result-object v27',
        'const/16 v27, 0x0', txt)
    with open(path, 'w', encoding='utf-8', errors='surrogateescape') as fh:
        fh.write(txt)
    print('   GTalkConnection：TLS 套接字工厂 -> 普通 SocketFactory（明文 TCP）')


def patch_gservices_map(root):
    """Android 2.2/2.3 没有 gservices 表，`GTalkService.initGservicesQueryMap`
    的查询会抛 SQLiteException 导致服务崩溃。这里把该方法替换成用空
    MatrixCursor 构造 QueryMap（本项目不用 Gservices，主机/端口已由
    ServerConfig 覆盖）。仅服务层，不涉及界面。可用 PATCH_GSERVICES=0 关闭。
    """
    if os.environ.get('PATCH_GSERVICES', '1') == '0':
        return
    path = f'{root}/com/google/android/gtalkservice/service/GTalkService.smali'
    with open(path, encoding='utf-8', errors='surrogateescape') as fh:
        txt = fh.read()
    m = re.search(r'\.method public initGservicesQueryMap\(\)V.*?\.end method',
                  txt, re.S)
    assert m, '未找到 initGservicesQueryMap'
    new_method = '''.method public initGservicesQueryMap()V
    .locals 5

    new-instance v0, Landroid/database/MatrixCursor;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "name"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "value"

    aput-object v3, v1, v2

    invoke-direct {v0, v1}, Landroid/database/MatrixCursor;-><init>([Ljava/lang/String;)V

    new-instance v1, Landroid/provider/Settings$Gservices$QueryMap;

    invoke-virtual {p0}, Lcom/google/android/gtalkservice/service/GTalkService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const/4 v3, 0x1

    iget-object v4, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mHandler:Landroid/os/Handler;

    invoke-direct {v1, v2, v0, v3, v4}, Landroid/provider/Settings$Gservices$QueryMap;-><init>(Landroid/content/ContentResolver;Landroid/database/Cursor;ZLandroid/os/Handler;)V

    iput-object v1, p0, Lcom/google/android/gtalkservice/service/GTalkService;->mGservices:Landroid/provider/Settings$Gservices$QueryMap;

    new-instance v0, Lcom/google/android/gtalkservice/service/GTalkService$4;

    invoke-direct {v0, p0}, Lcom/google/android/gtalkservice/service/GTalkService$4;-><init>(Lcom/google/android/gtalkservice/service/GTalkService;)V

    invoke-virtual {v1, v0}, Landroid/provider/Settings$Gservices$QueryMap;->addObserver(Ljava/util/Observer;)V

    return-void
.end method'''
    txt = txt[:m.start()] + new_method + txt[m.end():]
    with open(path, 'w', encoding='utf-8', errors='surrogateescape') as fh:
        fh.write(txt)
    print('   GTalkService：gservices 查询改为空 QueryMap（兼容 2.2/2.3）')


def patch_authorities_smali(root):
    """把 provider authority / 自定义权限名改成带本包名的唯一名字。

    设备上预装的 Google Talk 已占用 `com.google.android.providers.talk` 与
    `com.google.android.talk.SuggestionProvider`，不改名会
    INSTALL_FAILED_CONFLICTING_PROVIDER。只改 authority/权限名（dotted 字符串），
    smali 里的类引用是斜杠路径，不受影响。
    """
    n = 0
    for old, new in AUTH_RENAMES.items():
        for dirpath, _, files in os.walk(root):
            for fn in files:
                if not fn.endswith('.smali'):
                    continue
                p = os.path.join(dirpath, fn)
                with open(p, encoding='utf-8', errors='surrogateescape') as fh:
                    txt = fh.read()
                if old in txt:
                    n += txt.count(old)
                    with open(p, 'w', encoding='utf-8', errors='surrogateescape') as fh:
                        fh.write(txt.replace(old, new))
    print(f'   authority/权限改名: {n} 处 -> {PKG}.*')


def patch_im_package(root):
    """把内置的 android.provider.Im 整体改名到本应用的私有包。

    2.1 的系统框架里带有 android.provider.Im，且它的 CONTENT_URI 指向
    `content://com.google.android.providers.talk/...`。为了与真机预装的 Google
    Talk 共存，我们把 provider authority 改成了私有名；若继续用系统框架的 Im
    常量，2.1 上就会去访问不存在的旧 authority 而崩溃（2.2+ 本来就用我们打包的
    类，没问题）。改名后所有版本都只用我们自己的常量，指向私有 authority。
    """
    im_pkg = f'{PKG.replace(".", "/")}/im'
    pat = re.compile(r'Landroid/provider/Im([\$A-Za-z0-9_]*);')
    n = 0
    for dirpath, _, files in os.walk(root):
        for fn in files:
            if not fn.endswith('.smali'):
                continue
            p = os.path.join(dirpath, fn)
            with open(p, encoding='utf-8', errors='surrogateescape') as fh:
                txt = fh.read()
            if 'Landroid/provider/Im' not in txt:
                continue
            new_txt = pat.sub(lambda m: 'L%s/Im%s;' % (im_pkg, m.group(1)), txt)
            n += len(pat.findall(txt))
            with open(p, 'w', encoding='utf-8', errors='surrogateescape') as fh:
                fh.write(new_txt)
    print(f'   Im 类改名到私有包 {PKG}.im: {n} 处引用')


def patch_gtalk_service_bind(root):
    """让本应用显式绑定到**自己**的 GTalkService。

    原版 Talk 用 `new Intent(IGTalkService.class.getName())` 隐式绑定；在装有
    Google 服务的真机上，系统会解析到设备预装的
    `com.google.android.gsf/.gtalkservice.service.GTalkService`，于是变成依赖真实
    Google Talk。这里改成显式 setClassName 到本应用内的同名服务。仅服务绑定，
    不涉及界面。
    """
    path = f'{root}/com/google/android/talk/TalkApp.smali'
    with open(path, encoding='utf-8', errors='surrogateescape') as fh:
        txt = fh.read()
    old = '''    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/google/android/gtalkservice/IGTalkService;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V'''
    new = '''    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/google/android/gtalkservice/IGTalkService;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v4, "cc.wuersan008.eclairgram"

    const-string v5, "com.google.android.gtalkservice.service.GTalkService"

    invoke-virtual {v1, v4, v5}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V'''
    assert old in txt, '未找到 TalkApp 的 GTalkService 绑定'
    txt = txt.replace(old, new, 1)
    txt = txt.replace('.method private bindService()V\n    .locals 4',
                      '.method private bindService()V\n    .locals 6', 1)
    with open(path, 'w', encoding='utf-8', errors='surrogateescape') as fh:
        fh.write(txt)
    print('   TalkApp：显式绑定到本应用的 GTalkService')


def patch_message_digest(root):
    """把 `android.security.MessageDigest` 换成标准库 `java.security.MessageDigest`。

    Android 4.0 起框架移除了 `android.security.MessageDigest`（及其实现类
    `Sha1MessageDigest`/`Md5MessageDigest`）。这些类的实现是 native 方法，绑在旧框架
    的 JNI 里，即使把 Java 类打包进来，在 4.0 上调用也会 `UnsatisfiedLinkError`。

    而 Smack 的资源绑定（`StringUtils` 里算 SHA-1）等登录关键路径都要用到它。因此
    直接把类型引用改成标准库的 `java.security.MessageDigest`：两者的
    `getInstance(String)` / `update([B)` / `digest()` 签名完全一致，且标准库在所有
    Android 版本都存在，2.1–4.0 行为一致。仅改类型引用，不涉及界面。
    """
    n = 0
    for dirpath, _, files in os.walk(root):
        for fn in files:
            if not fn.endswith('.smali'):
                continue
            p = os.path.join(dirpath, fn)
            with open(p, encoding='utf-8', errors='surrogateescape') as fh:
                txt = fh.read()
            if 'Landroid/security/MessageDigest;' not in txt:
                continue
            n += txt.count('Landroid/security/MessageDigest;')
            txt = txt.replace('Landroid/security/MessageDigest;',
                              'Ljava/security/MessageDigest;')
            with open(p, 'w', encoding='utf-8', errors='surrogateescape') as fh:
                fh.write(txt)
    print(f'   MessageDigest 改用标准库 java.security.MessageDigest: {n} 处')


def patch_notification_icon(root):
    """把通知栏小图标换成**翻转后的**本应用 Talk 图标。

    原版把 `Notification.icon` 设成框架的 `android.R.drawable.stat_notify_chat`
    （系统聊天气泡）——既不是本应用的图标，也就无从“翻转”。这里改成已翻转的
    Talk 图标 `app_instant_message`，让通知栏里也显示翻转后的图标。仅服务层。
    """
    path = (f'{root}/com/google/android/gtalkservice/service/'
            'StatusBarNotifier.smali')
    if not os.path.exists(path):
        print('   ! 未找到 StatusBarNotifier，跳过通知图标补丁')
        return
    with open(path, encoding='utf-8', errors='surrogateescape') as fh:
        txt = fh.read()
    old = 'const v3, 0x1080077'
    # 注意：这里写的是**原始 gsvc APK 里**的资源 ID（0x7f020000 =
    # @drawable/app_instant_message）。构建后期的 rewrite_resource_ids() 会
    # 把它重写成合并后的新 ID。
    new = 'const v3, 0x7f020000'      # @drawable/app_instant_message（已翻转）
    if old in txt:
        txt = txt.replace(old, new, 1)
        with open(path, 'w', encoding='utf-8', errors='surrogateescape') as fh:
            fh.write(txt)
        print('   通知栏图标 -> 翻转后的 Talk 图标 @drawable/app_instant_message')
    else:
        print('   ! 未找到通知栏图标赋值，跳过')


def patch_send_presence_on_status(root):
    """让客户端在改状态时**真正把 presence 发到服务器**。

    原版 `ImSession.setPresence()` 只更新了本地 provider
    （`asyncUpdateAccountStatus()`），**没有**把 presence 发到网络上；而初次登录时的
    `sendInitialPresence()` 又被 PostAuthBatchQuery 分支跳过。结果服务器永远收不到
    客户端的自定义状态/在线状态，好友之间看不到彼此的签名。

    这里在 `setPresence()` 末尾补一次 `sendPresence(presence)`（虚调用，会走
    `GTalkImSession.translatePresence`，普通状态走 presence、DND/隐身走 SharedStatus）。
    仅服务/协议层，不涉及界面。
    """
    path = f'{root}/com/google/android/gtalkservice/ImSession.smali'
    if not os.path.exists(path):
        print('   ! 未找到 ImSession，跳过 presence 补丁')
        return
    with open(path, encoding='utf-8', errors='surrogateescape') as fh:
        txt = fh.read()
    old = ('    invoke-virtual {v2}, Lcom/google/android/gtalkservice/'
           'GTalkConnection;->asyncUpdateAccountStatus()V')
    add = ('\n\n    invoke-virtual {p0, p1}, Lcom/google/android/gtalkservice/'
           'ImSession;->sendPresence(Lcom/google/android/gtalkservice/Presence;)V')
    if old in txt:
        txt = txt.replace(old, old + add, 1)
        with open(path, 'w', encoding='utf-8', errors='surrogateescape') as fh:
            fh.write(txt)
        print('   setPresence：改状态时补发 presence 到服务器')
    else:
        print('   ! 未找到 setPresence 的 asyncUpdateAccountStatus，跳过')


def patch_trace_delete(root):
    """临时诊断：在 TalkProvider.deleteInternal 和 ChatView.clearChat 入口打日志。"""
    if os.environ.get('TRACE_DELETE', '0') != '1':
        return
    p = f'{root}/com/google/android/providers/talk/TalkProvider.smali'
    with open(p, encoding='utf-8', errors='surrogateescape') as fh:
        txt = fh.read()
    anchor = '''.method private deleteInternal(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 36
    .param p1, "url"    # Landroid/net/Uri;
    .param p2, "userWhere"    # Ljava/lang/String;
    .param p3, "whereArgs"    # [Ljava/lang/String;

    .prologue
'''
    inject = anchor + '''    const-string v0, "LMDEL"

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

'''
    assert anchor in txt, 'deleteInternal 锚点未找到'
    txt = txt.replace(anchor, inject, 1)
    with open(p, 'w', encoding='utf-8', errors='surrogateescape') as fh:
        fh.write(txt)

    p2 = f'{root}/com/google/android/talk/ChatView.smali'
    with open(p2, encoding='utf-8', errors='surrogateescape') as fh:
        txt = fh.read()
    a2 = '''.method public clearChat()V
    .locals 3

    .prologue
'''
    i2 = a2 + '''    const-string v0, "LMDEL"

    const-string v1, "ChatView.clearChat"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

'''
    assert a2 in txt, 'clearChat 锚点未找到'
    txt = txt.replace(a2, i2, 1)
    with open(p2, 'w', encoding='utf-8', errors='surrogateescape') as fh:
        fh.write(txt)
    print('   已注入删除追踪日志（TRACE_DELETE=1）')


def patch_provider_contact_on_demand(root):
    """消息插入时若联系人还不存在，就补建一条联系人，避免消息变成孤儿。

    现象：离开聊天再进来，历史消息不见了。
    根因：`TalkProvider` 插入消息时用 `getContactId(account, contact)` 找联系人
    的 `_id` 作为 `thread_id`；找不到就返回 0。若消息比“联系人（来自花名册）”
    先到，消息就以 `thread_id=0` 落库，而查询是
    `messages LEFT JOIN contacts ON contacts._id = messages.thread_id`，
    这些消息**永远查不到**——界面里看不到，于是“历史消失”。

    这里把 `getContactId` 改成：找不到联系人时**先插入一条联系人**再返回其 id。
    仅 provider 数据层，不涉及界面。
    """
    path = f'{root}/com/google/android/providers/talk/TalkProvider.smali'
    if not os.path.exists(path):
        print('   ! 未找到 TalkProvider，跳过')
        return
    with open(path, encoding='utf-8', errors='surrogateescape') as fh:
        txt = fh.read()
    old = '''    .line 2445
    return-wide v10
'''
    block = '''    .line 2445
    const-wide/16 v1, 0x0

    cmp-long v1, v10, v1

    if-nez v1, :cond_1

    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    const-string v2, "username"

    invoke-virtual {v1, v2, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "account"

    invoke-static {p2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v2, "type"

    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v2, "subscriptionType"

    const/4 v3, 0x4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v2, "qc"

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v2, "contacts"

    const/4 v3, 0x0

    invoke-virtual {p1, v2, v3, v1}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v10

    :cond_1
    return-wide v10
'''
    assert old in txt, '未找到 getContactId 的 return-wide v10'
    txt = txt.replace(old, block, 1)
    with open(path, 'w', encoding='utf-8', errors='surrogateescape') as fh:
        fh.write(txt)
    print('   TalkProvider：消息插入时按需补建联系人（修复历史消息孤儿）')


def patch_gservices_calls(root):
    """把对 `Settings$Gservices.get*` 的调用替换成调用方传入的默认值。

    某些 ROM（如 HTC Wildfire 2.2.1）框架里仍保留 `Settings$Gservices`，而它查询
    的 `gservices` 表不存在，会抛 SQLiteException 让 GTalkService 崩溃。本项目不使用
    Gservices（主机/端口由 ServerConfig 提供），直接返回调用方传入的默认值即可。

    关键：必须保留默认值，不能一律置 0。例如 `DatabaseUtils.pruneOldMessageHistory`
    用 `gtalk_chat_message_lifetime` 的默认值（10 天）决定删除多久以前的消息；若置 0，
    每次回到好友列表（`serviceStateChanged`）都会把历史消息全部删光——正是“退出会话
    后历史消息消失”的根因。
    """
    re_getint = re.compile(
        r'invoke-static \{([^}]*)\}, Landroid/provider/Settings\$Gservices;->'
        r'getInt\(Landroid/content/ContentResolver;Ljava/lang/String;I\)I'
        r'\s*\n(?:\s*\.[^\n]*\n)*\s*move-result (v\d+|p\d+)')
    re_getlong = re.compile(
        r'invoke-static \{([^}]*)\}, Landroid/provider/Settings\$Gservices;->'
        r'getLong\(Landroid/content/ContentResolver;Ljava/lang/String;J\)J'
        r'\s*\n(?:\s*\.[^\n]*\n)*\s*move-result-wide (v\d+|p\d+)')
    re_getstr = re.compile(
        r'invoke-static \{[^}]*\}, Landroid/provider/Settings\$Gservices;->'
        r'getString\(Landroid/content/ContentResolver;Ljava/lang/String;\)'
        r'Ljava/lang/String;'
        r'\s*\n(?:\s*\.[^\n]*\n)*\s*move-result-object (v\d+|p\d+)')

    def repl_getint(m):
        regs = [r.strip() for r in m.group(1).split(',')]
        return f'move/from16 {m.group(2)}, {regs[-1]}'

    def repl_getlong(m):
        regs = [r.strip() for r in m.group(1).split(',')]
        return f'move-wide/from16 {m.group(2)}, {regs[-2]}'

    n = 0
    for dirpath, _, files in os.walk(root):
        for fn in files:
            if not fn.endswith('.smali'):
                continue
            p = os.path.join(dirpath, fn)
            with open(p, encoding='utf-8', errors='surrogateescape') as fh:
                txt = fh.read()
            orig = txt
            txt = re_getlong.sub(repl_getlong, txt)
            txt = re_getint.sub(repl_getint, txt)
            txt = re_getstr.sub(r'const/16 \1, 0x0', txt)
            if txt != orig:
                n += 1
                with open(p, 'w', encoding='utf-8', errors='surrogateescape') as fh:
                    fh.write(txt)
    print(f'   Gservices 调用替换为默认值: {n} 个文件')


def patch_login_bind(root):
    """GoogleLoginServiceConstants 里 setClassName 写死了
    com.google.android.googleapps.GoogleLoginService。
    合并后该组件属于本应用，故改指向本应用自己的类。"""
    path = f'{root}/com/google/android/googlelogin/GoogleLoginServiceConstants.smali'
    if not os.path.exists(path):
        print('  ! 未找到 GoogleLoginServiceConstants，跳过绑定补丁')
        return
    with open(path, encoding='utf-8', errors='surrogateescape') as fh:
        txt = fh.read()
    old_pkg = 'com.google.android.googleapps'
    old_cls = 'com.google.android.googleapps.GoogleLoginService'
    new_cls = f'{APPCLASS}.LoginService'
    assert f'const-string v1, "{old_pkg}"' in txt, '未找到 setClassName 的包名常量'
    txt = txt.replace(f'const-string v1, "{old_pkg}"', f'const-string v1, "{PKG}"')
    txt = txt.replace(f'const-string v2, "{old_cls}"', f'const-string v2, "{new_cls}"')
    with open(path, 'w', encoding='utf-8', errors='surrogateescape') as fh:
        fh.write(txt)
    print(f'  登录服务绑定改为 {PKG}/{new_cls}')


# ------------------------------------------------------------ stage 2: resources
def stage_res():
    """合并资源：values 逐条目合并，其它按文件复制；仅对冲突项改名。"""
    print('[2/5] 合并资源')
    out = f'{WORK}/res'
    shutil.rmtree(out, ignore_errors=True)
    os.makedirs(out)

    rename_by_src = {}
    for src, typ, old, new in RENAMES:
        rename_by_src.setdefault(src, {})[(typ, old)] = new

    value_files = {}
    origin = {}      # 目标文件 -> 来源 key（改名只作用于该来源自己的引用）
    for key, info in SRC.items():
        resdir = f'{info["dir"]}/res'
        ren = rename_by_src.get(key, {})
        for dirpath, _, files in os.walk(resdir):
            rel_dir = os.path.relpath(dirpath, resdir)
            for fn in files:
                rel = fn if rel_dir == '.' else os.path.join(rel_dir, fn)
                full = os.path.join(dirpath, fn)
                if rel.replace('\\', '/').startswith('values') and fn.endswith('.xml'):
                    if fn == 'public.xml':
                        continue     # 会强制旧 ID，必须丢弃
                    merge_values(value_files, rel, full, ren)
                    continue
                newfn = fn
                top = rel_dir.split('/')[0] if rel_dir != '.' else ''
                if top.startswith('drawable') or top.startswith('mipmap'):
                    stem, ext = os.path.splitext(fn)
                    if (top, stem) in ren:
                        newfn = ren[(top, stem)] + ext
                dst = os.path.join(out, rel_dir, newfn) if rel_dir != '.' else os.path.join(out, newfn)
                os.makedirs(os.path.dirname(dst), exist_ok=True)
                if not os.path.exists(dst):
                    shutil.copy2(full, dst)
                    origin[dst] = key

    # 本应用自己的资源（登录/配置页文案，含 en-US 与 zh-CN）。
    # values 逐条合并（不覆盖 Talk 已有条目），其它资源直接复制。
    our_res = f'{WS}/app/single/res'
    if os.path.isdir(our_res):
        n = 0
        for dirpath, _, files in os.walk(our_res):
            rel_dir = os.path.relpath(dirpath, our_res)
            for fn in files:
                rel = fn if rel_dir == '.' else os.path.join(rel_dir, fn)
                full = os.path.join(dirpath, fn)
                if rel.replace('\\', '/').startswith('values') and fn.endswith('.xml'):
                    merge_values(value_files, rel, full, {})
                    continue
                dst = os.path.join(out, rel)
                os.makedirs(os.path.dirname(dst), exist_ok=True)
                shutil.copy2(full, dst)
                n += 1
        print(f'  应用自身资源（文案/本地化）: {n} 个文件')

    for rel, entries in value_files.items():
        dst = os.path.join(out, rel)
        os.makedirs(os.path.dirname(dst), exist_ok=True)
        with open(dst, 'w', encoding='utf-8') as fh:
            fh.write('<?xml version="1.0" encoding="utf-8"?>\n<resources>\n')
            for _tag, text in entries.values():
                fh.write(text + '\n')
            fh.write('</resources>\n')

    # 只对“来自被改名来源”的文件做引用替换，避免误伤其它包自己的同名引用
    fixed = 0
    for p, key in origin.items():
        if not p.endswith('.xml'):
            continue
        ren = rename_by_src.get(key, {})
        if not ren:
            continue
        with open(p, encoding='utf-8') as fh:
            txt = fh.read()
        orig = txt
        for (typ, old), new in ren.items():
            txt = txt.replace(f'@{typ}/{old}"', f'@{typ}/{new}"')
        if txt != orig:
            open(p, 'w', encoding='utf-8').write(txt)
            fixed += 1
    print(f'  资源已合并，引用改名 {fixed} 个文件')

    # 本应用自己的兼容资源（4.0 替身控件用）。直接复制，不参与改名。
    extra_res = f'{WS}/app/compat/res'
    if os.path.isdir(extra_res):
        n = 0
        for dirpath, _, files in os.walk(extra_res):
            rel_dir = os.path.relpath(dirpath, extra_res)
            for fn in files:
                dst = (os.path.join(out, rel_dir, fn) if rel_dir != '.'
                       else os.path.join(out, fn))
                os.makedirs(os.path.dirname(dst), exist_ok=True)
                shutil.copy2(os.path.join(dirpath, fn), dst)
                n += 1
        print(f'  应用兼容资源（4.0 替身）: {n} 个文件')

    make_flipped_app_icon(out)


def merge_values(store, rel, path, ren):
    """按 (tag,name) 去重合并 values 文件；冲突项按 ren 改名。

    用真正的 XML 解析，避免把外层 <resources> 当成条目。
    """
    import xml.etree.ElementTree as ET
    ET.register_namespace('android', NS)
    try:
        root = ET.parse(path).getroot()
    except Exception as exc:   # 个别文件可能不是标准 XML
        print(f'  ! 跳过 {path}: {exc}')
        return
    for child in root:
        tag = child.tag
        name = child.get('name')
        if tag == 'string' and name and ('string', name) in ren:
            name = ren[('string', name)]
            child.set('name', name)
        try:
            text = ET.tostring(child, encoding='unicode').strip()
        except Exception:
            continue
        key = (tag, name) if name else (tag, text[:90])
        store.setdefault(rel, {})
        store[rel].setdefault(key, (tag, text))


# --------------------------------------------------------------- stage 3: assets
def stage_assets():
    print('[3/5] 合并 assets')
    out = f'{WORK}/assets'
    shutil.rmtree(out, ignore_errors=True)
    os.makedirs(out)
    n = 0
    for _key, info in SRC.items():
        d = f'{info["dir"]}/assets'
        if not os.path.isdir(d):
            continue
        for dirpath, _, files in os.walk(d):
            for fn in files:
                full = os.path.join(dirpath, fn)
                rel = os.path.relpath(full, d)
                dst = os.path.join(out, rel)
                os.makedirs(os.path.dirname(dst), exist_ok=True)
                if not os.path.exists(dst):
                    shutil.copy2(full, dst)
                    n += 1
    print(f'  assets 文件数={n}')


# ------------------------------------------------------------- stage 4: manifest
NS = 'http://schemas.android.com/apk/res/android'


CLASS_VALUED_META = {
    'android.app.default_searchable',
    'android.app.searchable_activity',
}

# API 7（Eclair）里不存在、但原 APK 里被引用的框架资源
BAD_FRAMEWORK_REFS = {
    '@android:style/Widget.Holo.ProgressBar',   # Holo 是 API 11 才有的
}


def expand_class(pkg, name):
    """把 ".Foo" / "Foo" 展开成 pkg.Foo；已经是全限定名的保持不变。"""
    if name.startswith('.'):
        return pkg + name
    if '.' not in name:
        return pkg + '.' + name
    return name


def _rename_manifest_authorities(man):
    """改 provider authority 与自定义权限名，避免与预装 Google Talk 冲突。"""
    A = '{%s}' % NS
    for el in man.iter():
        if el.tag == 'provider':
            auth = el.get(A + 'authorities')
            if auth:
                for old, new in AUTH_RENAMES.items():
                    if auth == old or auth.startswith(old + '.'):
                        el.set(A + 'authorities', new + auth[len(old):])
        elif el.tag in ('permission', 'uses-permission'):
            nm = el.get(A + 'name')
            if nm:
                for old, new in AUTH_RENAMES.items():
                    if nm == old or nm.startswith(old + '.'):
                        el.set(A + 'name', new + nm[len(old):])


def stage_manifest():
    """把三份 AndroidManifest 合并成一份（包名改为本应用）。"""
    import xml.etree.ElementTree as ET
    print('[4/5] 合并 AndroidManifest')
    ET.register_namespace('android', NS)
    A = '{%s}' % NS

    perms, features, app_children = [], [], []
    seen_perm, seen_feat, seen_comp = set(), set(), set()
    app_attrs = {}

    for key in ['talk', 'gsvc', 'tprov']:
        pkg = SRC[key]['pkg']
        path = f'{SRC[key]["dir"]}/AndroidManifest.xml'
        root = ET.parse(path).getroot()
        for ch in root:
            tag = ch.tag
            if tag == 'uses-permission':
                nm = ch.get(A + 'name')
                if nm and nm not in seen_perm:
                    seen_perm.add(nm)
                    perms.append(nm)
            elif tag == 'uses-feature':
                nm = ch.get(A + 'name')
                if nm and nm not in seen_feat:
                    seen_feat.add(nm)
                    features.append(nm)
            elif tag == 'permission':
                perm = ET.tostring(ch, encoding='unicode')
                if perm not in seen_perm:
                    seen_perm.add(perm)
                    perms.append(('xml', perm))
            elif tag == 'application':
                for k, v in ch.attrib.items():
                    # 只保留 Talk（原始界面）的 application 级属性，如 label/icon/taskAffinity
                    if key == 'talk':
                        app_attrs[k] = v
                for sub in ch:
                    if sub.tag == 'uses-library':
                        continue          # 共享库已并入本 APK
                    if sub.get(A + 'process'):
                        del sub.attrib[A + 'process']   # 统一单进程
                    # 组件类名要展开成完全限定名：
                    #   ".Foo" 与 "Foo" 都是相对 manifest package 的写法。
                    #   合并后 package 变成我们自己的，若原样保留会解析失败。
                    if sub.tag in ('activity', 'service', 'receiver', 'provider'):
                        nm = sub.get(A + 'name')
                        if nm:
                            sub.set(A + 'name', expand_class(pkg, nm))
                    # goldfish 模拟器默认横屏，聊天类应用竖屏更合适。
                    # 只设置 Activity 的屏幕方向，不改动任何布局/资源。
                    if sub.tag == 'activity' and os.environ.get('FORCE_PORTRAIT', '1') != '0':
                        sub.set(A + 'screenOrientation', 'portrait')
                    # 有些 meta-data 的 value 也是类名
                    if sub.tag == 'meta-data' and sub.get(A + 'name') in CLASS_VALUED_META:
                        v = sub.get(A + 'value')
                        if v and (v.startswith('.') or '.' not in v):
                            sub.set(A + 'value', expand_class(pkg, v))
                    # API 7 不存在的框架资源要剔除
                    for k in list(sub.attrib):
                        if sub.attrib[k] in BAD_FRAMEWORK_REFS:
                            print(f'  去掉 API7 不存在的引用: {sub.tag} {k}={sub.attrib[k]}')
                            del sub.attrib[k]
                    # 重命名过的字符串引用要同步
                    for k in list(sub.attrib):
                        v = sub.attrib[k]
                        if v == '@string/app_label':
                            sub.attrib[k] = {'gsvc': '@string/gsvc_app_label',
                                             'tprov': '@string/tprov_app_label'}.get(key, v)
                    nm = sub.get(A + 'name')
                    sig = (sub.tag, nm)
                    if nm and sig in seen_comp:
                        continue
                    if nm:
                        seen_comp.add(sig)
                    app_children.append(sub)

    man = ET.Element('manifest')
    man.set('package', PKG)
    man.set(A + 'versionCode', '1')
    man.set(A + 'versionName', '1.0')
    us = ET.SubElement(man, 'uses-sdk')
    us.set(A + 'minSdkVersion', '7')
    us.set(A + 'targetSdkVersion', '7')
    for p in perms:
        if isinstance(p, tuple):
            man.append(ET.fromstring(p[1]))
        else:
            ET.SubElement(man, 'uses-permission').set(A + 'name', p)
    for f in features:
        ET.SubElement(man, 'uses-feature').set(A + 'name', f)
    app = ET.SubElement(man, 'application')
    # 我们的 Application：进程启动时恢复服务器地址
    app.set(A + 'name', f'{APPCLASS}.App')
    for k, v in app_attrs.items():
        app.set(k, v)
    # 启动器图标：换成翻转后的图标，便于与原版 Google Talk 区分。
    # 只影响启动器图标，不改动任何界面内资源。
    if os.environ.get('FLIP_ICON', '1') != '0':
        app.set(A + 'icon', f'@drawable/{APP_ICON_NEW}')
    # 应用名：用本应用自己的、可本地化的名字（Talk UI 内部各界面标题不受影响）。
    app.set(A + 'label', '@string/ec_app_name')
    # 仅用于调试：DEBUGGABLE=1 时让应用可被 run-as 访问（默认不开启）。
    if os.environ.get('DEBUGGABLE', '0') == '1':
        app.set(A + 'debuggable', 'true')
        print('  ! 已设置 android:debuggable=true（仅调试用）')
    for sub in app_children:
        app.append(sub)

    # 本应用自己的组件（原三份 manifest 里没有）
    act = ET.SubElement(app, 'activity')
    act.set(A + 'name', f'{APPCLASS}.MainActivity')
    act.set(A + 'label', 'Eclairgram')
    act.set(A + 'exported', 'true')
    if os.environ.get('FORCE_PORTRAIT', '1') != '0':
        act.set(A + 'screenOrientation', 'portrait')
    f1 = ET.SubElement(act, 'intent-filter')
    ET.SubElement(f1, 'action').set(A + 'name', 'android.intent.action.MAIN')
    ET.SubElement(f1, 'category').set(A + 'name', 'android.intent.category.LAUNCHER')

    svc = ET.SubElement(app, 'service')
    svc.set(A + 'name', f'{APPCLASS}.LoginService')
    svc.set(A + 'exported', 'true')
    f2 = ET.SubElement(svc, 'intent-filter')
    ET.SubElement(f2, 'action').set(A + 'name',
                                    'com.google.android.googleapps.IGoogleLoginService')
    ET.SubElement(f2, 'action').set(A + 'name',
                                    'com.google.android.googleapps.GoogleLoginService')

    # 与设备上预装的 Google Talk 共存：把 provider authority 与自定义权限名
    # 改成带本包名的唯一名字（组件类名保持不变）。
    _rename_manifest_authorities(man)

    out = f'{WORK}/AndroidManifest.xml'
    ET.ElementTree(man).write(out, encoding='utf-8', xml_declaration=True)
    print(f'  组件数={len(app_children)} 权限数={len(perms)} -> {out}')
    return out


# ---------------------------------------------------------------- stage 5: build
EXTRA = ':'.join(SRC[k]['pkg'] for k in ['talk', 'gsvc', 'tprov'])


def stage_build(manifest):
    print('[5/5] 构建单一 APK')
    base = f'{WORK}/base.apk'
    gen = f'{WORK}/gen'
    shutil.rmtree(gen, ignore_errors=True)
    os.makedirs(gen)

    # aapt 链接资源，并为三个原始包 + 本包生成 R 类（ID 由 aapt 重新分配）
    run([f'{BT}/aapt', 'package', '-f',
         '-M', manifest,
         '-S', f'{WORK}/res',
         '-A', f'{WORK}/assets',
         '-I', AJAR,
         '-J', gen,
         '--extra-packages', EXTRA,
         '-F', base,
         '--min-sdk-version', '7', '--target-sdk-version', '7'], env=javac_env())

    # aapt v1 只会为**最后一个** extra-package 生成 R.java（且其中已包含全部资源 ID）。
    # 而各原始包的代码都通过自己的 R 类读取资源，所以必须为每个包补齐 R.java，
    # 否则会抛 NoClassDefFoundError / 资源找不到。
    rgen = f'{gen}/R.java'
    body = open(rgen, encoding='utf-8').read()
    body = re.sub(r'^package [^;]+;', '', body, count=1, flags=re.M)
    os.remove(rgen)
    for pkgname in [PKG] + [SRC[k]['pkg'] for k in ['talk', 'gsvc', 'tprov']]:
        d = os.path.join(gen, *pkgname.split('.'))
        os.makedirs(d, exist_ok=True)
        with open(os.path.join(d, 'R.java'), 'w', encoding='utf-8') as fh:
            fh.write('package ' + pkgname + ';' + chr(10) + body)
    print('   R 类已为 4 个包补齐')

    # javac 内联了 R 常量 -> smali 里是写死的资源 ID，必须重写
    import json
    with open(f'{WORK}/origins.json') as fh:
        origins = json.load(fh)
    rewrite_resource_ids(gen, origins, body)

    # AIDL：只用于编译期，产物不会打进 dex（运行时用捆绑的原始类）
    aidlgen = f'{WORK}/aidlgen'
    shutil.rmtree(aidlgen, ignore_errors=True)
    os.makedirs(aidlgen)
    run([f'{BT}/aidl', '--lang=java', '-I', f'{WS}/app/privategsf/aidl', '-o', aidlgen,
         f'{WS}/app/privategsf/aidl/com/google/android/googleapps/IGoogleLoginService.aidl',
         f'{WS}/app/privategsf/aidl/com/google/android/googleapps/LoginData.aidl',
         f'{WS}/app/privategsf/aidl/com/google/android/googleapps/GoogleLoginCredentialsResult.aidl'])

    # 编译本应用自己的类 + 生成的 R 类 + 原生 MTProto 客户端
    classes = f'{WORK}/classes'
    shutil.rmtree(classes, ignore_errors=True)
    os.makedirs(classes)

    # 从被忽略的 local/secrets.properties 读取 Telegram api_id/api_hash，
    # 生成 BuildSecrets.java 注入 APK。机密绝不入库。
    secrets_dir = f'{WORK}/gensecrets/cc/wuersan008/eclairgram'
    shutil.rmtree(f'{WORK}/gensecrets', ignore_errors=True)
    os.makedirs(secrets_dir)
    api_id, api_hash = '0', 'PLACEHOLDER'
    sec_path = f'{WS}/local/secrets.properties'
    if os.path.exists(sec_path):
        for line in open(sec_path, encoding='utf-8'):
            line = line.strip()
            if line.startswith('tg.api_id'):
                api_id = line.split('=', 1)[1].strip()
            elif line.startswith('tg.api_hash'):
                api_hash = line.split('=', 1)[1].strip()
    with open(f'{secrets_dir}/BuildSecrets.java', 'w', encoding='utf-8') as fh:
        fh.write('package cc.wuersan008.eclairgram;\n')
        fh.write('/** 构建时从 local/secrets.properties 注入（不入库）。 */\n')
        fh.write('public final class BuildSecrets {\n')
        fh.write('    public static final int API_ID = ' + api_id + ';\n')
        fh.write('    public static final String API_HASH = "' + api_hash + '";\n')
        fh.write('    private BuildSecrets() {}\n}\n')
    print('   已注入 Telegram api_id/api_hash（来自 local/secrets.properties）'
          if os.path.exists(sec_path) else '   ! 未找到 local/secrets.properties，使用占位 api_id/api_hash')

    srcs = []
    # app/privategsf/src 只用于提供 AIDL 需要的 parcelable 实现，
    # 其编译产物随后会被排除（运行时用捆绑的原始类）。
    for d in [f'{WS}/app/single/src', f'{WS}/app/privategsf/src',
              f'{WS}/app/compat/src', f'{WS}/telegram/src',
              f'{WORK}/gensecrets', aidlgen, gen]:
        for dp, _, fs in os.walk(d):
            for f in fs:
                if f.endswith('.java'):
                    srcs.append(os.path.join(dp, f))
    run([f'{JDK8}/bin/javac', '-encoding', 'UTF-8', '-source', '1.7', '-target', '1.7',
         '-bootclasspath', AJAR, '-nowarn', '-d', classes] + srcs, env=javac_env())

    # 自己的 dex（排除与捆绑 smali 重复的 com.google.android.googleapps.*）
    our = f'{WORK}/ourclasses.txt'
    keep = []
    for dp, _, fs in os.walk(classes):
        for f in fs:
            if not f.endswith('.class'):
                continue
            p = os.path.join(dp, f)
            rel = os.path.relpath(p, classes).replace('\\', '/')
            if rel.startswith('com/google/android/googleapps/'):
                continue
            # 三个原始包里的 Manifest*/Manifest$* 由捆绑 smali 提供，
            # aapt 也会为 extra-packages 生成同名类 -> 会造成重复定义。
            skip = False
            for extra in SRC.values():
                pkgpath = extra['pkg'].replace('.', '/') + '/'
                if rel.startswith(pkgpath) and rel[len(pkgpath):].startswith('Manifest'):
                    skip = True
                    break
            if not skip:
                keep.append(p)
    open(our, 'w').write('\n'.join(keep))
    ourdir = f'{WORK}/ourdex'
    shutil.rmtree(ourdir, ignore_errors=True)
    os.makedirs(ourdir)
    run([f'{BT}/d8', '--lib', AJAR, '--min-api', '7', '--output', ourdir, '@' + our], env=javac_env())

    # 合并后的 smali -> dex（-a 7 保证 dex 版本 035，Android 2.1 可读）
    smalidex = f'{WORK}/smalidex'
    shutil.rmtree(smalidex, ignore_errors=True)
    os.makedirs(smalidex)
    run([f'{JDK8}/bin/java', '-jar', SMALI, 'assemble', '-a', '7',
         f'{WORK}/smali', '-o', f'{smalidex}/classes.dex'], env=javac_env())

    # 合并两个 dex
    finaldex = f'{WORK}/finaldex'
    shutil.rmtree(finaldex, ignore_errors=True)
    os.makedirs(finaldex)
    run([f'{BT}/d8', '--lib', AJAR, '--min-api', '7', '--output', finaldex,
         f'{ourdir}/classes.dex', f'{smalidex}/classes.dex'], env=javac_env())

    # 打包 dex，对齐并签名
    # 必须在 dex 所在目录内执行：aapt add 会把传入路径原样写进 zip，
    # 用绝对路径会存成带目录的名字，系统就找不到 classes.dex。
    run([f'{BT}/aapt', 'add', base, 'classes.dex'], cwd=finaldex)
    aligned = f'{WORK}/aligned.apk'
    run([f'{BT}/zipalign', '-f', '4', base, aligned])
    out = f'{WS}/dist/eclairgram.apk'
    run([f'{BT}/apksigner', 'sign',
         '--key', f'{WS}/keys/testkey.pk8', '--cert', f'{WS}/keys/testkey.x509.pem',
         '--min-sdk-version', '7', '--v1-signing-enabled', 'true', '--v2-signing-enabled', 'false',
         '--out', out, aligned], env=javac_env())
    print('  产物：', out, os.path.getsize(out), 'bytes')
    return out


def main():
    os.makedirs(f'{WORK}', exist_ok=True)
    os.makedirs(f'{WS}/dist', exist_ok=True)
    stage_smali()
    stage_res()
    stage_assets()
    manifest = stage_manifest()
    stage_build(manifest)



def old_id_map(apk):
    """从原始 APK 的资源表得到 旧ID -> (type, name)。"""
    out = subprocess.run([f'{BT}/aapt', 'dump', 'resources', apk],
                         capture_output=True, text=True).stdout
    m = {}
    for mm in re.finditer(r'spec resource (0x[0-9a-f]+) [^:]+:([A-Za-z0-9_]+)/([A-Za-z0-9_.]+):', out):
        m[int(mm.group(1), 16)] = (mm.group(2), mm.group(3))
    return m


def new_id_map(rbody):
    """从 aapt 生成的 R.java 得到 (type, name) -> 新ID。"""
    m = {}
    cur = None
    for mm in re.finditer(r'public static final class (\w+) \{|public static final int (\w+)=0x([0-9a-f]+);', rbody):
        if mm.group(1):
            cur = mm.group(1)
        else:
            m[(cur, mm.group(2))] = int(mm.group(3), 16)
    return m


def rewrite_resource_ids(gen, origins, rbody):
    """把 smali 里写死的资源 ID 字面量替换成合并后重新分配的新 ID。

    javac 会把 static final int 常量内联，所以原 dex 里全是硬编码的资源 ID，
    必须按“来源包”分别映射（同一个旧 ID 在不同包里含义不同）。
    """
    print('   重写 smali 里内联的资源 ID')
    newmap = new_id_map(rbody)
    per_pkg = {k: old_id_map(f'{WS}/apks/{f}') for k, f in {
        'talk': 'Talk-USCCi500-2009__Talk.apk',
        'gsvc': 'gtalkservice-USCCi500-2009__gtalkservice.apk',
        'tprov': 'TalkProvider-USCCi500-2009__TalkProvider.apk'}.items()}

    conv = {}
    for key, om in per_pkg.items():
        mp = {}
        for oid, (typ, name) in om.items():
            nid = newmap.get((typ, name))
            if nid is not None and nid != oid:
                mp[oid] = nid
        conv[key] = mp
        print(f'     {key}: {len(mp)} 个 ID 需要改写')

    root = f'{WORK}/smali'
    changed = 0
    for dp, _, fs in os.walk(root):
        for fn in fs:
            if not fn.endswith('.smali'):
                continue
            p = os.path.join(dp, fn)
            rel = os.path.relpath(p, root)
            key = origins.get(rel)
            mp = conv.get(key)
            if not mp:
                continue
            with open(p, encoding='utf-8', errors='surrogateescape') as fh:
                txt = fh.read()
            orig = txt
            # 必须“一次性”替换：逐个 str.replace 会把刚写入的新值再替换一次
            # （例如 0x16->0x18 与 0x18->0x1a 会连锁，导致指向错误资源）。
            pat = re.compile('|'.join('0x%08x' % o for o in mp))
            txt = pat.sub(lambda m: '0x%08x' % mp[int(m.group(0), 16)], txt)
            # const/high16 要求低 16 位为 0；重映射后若不满足，改成普通 const。
            # （原 dex 里 entry 0 的 ID 会被优化成 const/high16。）
            def _fix(m):
                reg, val = m.group(1), m.group(2)
                return ('const %s, %s' % (reg, val)
                        if (int(val, 16) & 0xffff) else m.group(0))
            txt = re.sub(r'const/high16 (v[0-9]+), (0x7f[0-9a-f]{6,8})', _fix, txt)
            if txt != orig:
                with open(p, 'w', encoding='utf-8', errors='surrogateescape') as fh:
                    fh.write(txt)
                changed += 1
    print(f'     改写了 {changed} 个 smali 文件')


if __name__ == '__main__':
    main()
