#!/usr/bin/env python3
"""把 Blobmoji 的彩色 emoji 位图提取成一个紧凑的 emoji.pack（含分类与排序）。

Android 2.1–4.0 的字体引擎不支持 CBDT/CBLC 彩色字体，无法直接用 Typeface
渲染 Blobmoji。因此在构建期把每个 emoji 码点的位图抽出来、缩小并打包，
运行时按码点取图，用 ImageSpan 画出来。

分类与组内顺序取自 Unicode 官方 emoji-test.txt（与现代键盘一致：
表情在前、符号与旗帜在后）。

用法：
    python3 scripts/gen_emoji_pack.py <Blobmoji.ttf> [emoji-test.txt] [输出路径]

默认输出 app/single/assets/emoji.pack。格式（小端，magic "ECP2"）：
    count:u32
    count × { codepoint:u32, offset:u32, length:u32, category:u8 }
    PNG 数据区
"""
import io
import os
import struct
import sys

from fontTools.ttLib import TTFont
from PIL import Image

WS = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SIZE = int(os.environ.get('EMOJI_SIZE', '32'))

# 分类顺序（Component 是肤色/发型修饰符，不作为单独分类）
CATEGORIES = [
    'Smileys & Emotion', 'People & Body', 'Animals & Nature', 'Food & Drink',
    'Travel & Places', 'Activities', 'Objects', 'Symbols', 'Flags', 'Other',
]
CAT_INDEX = {name: i for i, name in enumerate(CATEGORIES)}


def parse_ordering(path):
    """从 emoji-test.txt 得到 码点 -> (分类序号, 组内顺序)，以及组件码点集合。

    Component 组（肤色、发型等修饰符）不作为独立分类；它们只在与人物组合时
    才有意义，单独显示在键盘里属于现代键盘没有的行为，因此单独返回以便过滤。
    """
    order = {}
    components = set()
    if not path or not os.path.exists(path):
        return order, components
    cat = None
    n = 0
    for line in open(path, encoding='utf-8'):
        line = line.strip()
        if line.startswith('# group:'):
            cat = line.split(':', 1)[1].strip()
            n = 0
            continue
        if not line or line.startswith('#'):
            continue
        if ';' not in line:
            continue
        cps = line.split(';', 1)[0].strip().split()
        try:
            vals = [int(c, 16) for c in cps]
        except ValueError:
            continue
        if cat is None:
            continue
        # 只处理单个码点（或 码点+FE0F）的 emoji；ZWJ 序列/旗帜组合跳过
        base = vals[0]
        if len(vals) == 1 or (len(vals) == 2 and vals[1] == 0xFE0F):
            if cat == 'Component':
                components.add(base)
                continue
            if base not in order:
                order[base] = (CAT_INDEX.get(cat, CAT_INDEX['Other']), n)
            n += 1
    return order, components


def main():
    ttf = sys.argv[1] if len(sys.argv) > 1 else 'Blobmoji.ttf'
    orderfile = sys.argv[2] if len(sys.argv) > 2 else 'emoji-test.txt'
    out = sys.argv[3] if len(sys.argv) > 3 else f'{WS}/app/single/assets/emoji.pack'

    order, components = parse_ordering(orderfile)
    font = TTFont(ttf)
    cmap = font.getBestCmap()
    strike = font['CBDT'].strikeData[0]

    entries = []
    seen = set()
    SKIP = {0x200D, 0xFE0E, 0xFE0F, 0x20E3}

    def is_component(cp):
        # 肤色、发型等修饰符，以及区域指示符（旗帜由两个字母组合而成）、
        # 平面 14/15/16 的私用/标签码点（Blobmoji 内部用于组合旗帜），
        # 现代键盘都不把它们作为可单独点选的条目。
        if cp in components:
            return True
        if 0x1F3FB <= cp <= 0x1F3FF:
            return True
        if 0x1F1E6 <= cp <= 0x1F1FF:
            return True
        if cp >= 0xE0000:
            return True
        return False

    for cp, gname in cmap.items():
        if cp in seen:
            continue
        if cp < 0xA9 or cp in SKIP or is_component(cp):
            continue
        g = strike.get(gname)
        if g is None or not getattr(g, 'data', None):
            continue
        raw = g.data
        i = raw.find(b'\x89PNG')
        if i < 0:
            continue
        try:
            im = Image.open(io.BytesIO(raw[i:])).convert('RGBA')
        except Exception:
            continue
        im = im.resize((SIZE, SIZE), Image.LANCZOS)
        buf = io.BytesIO()
        im.save(buf, format='PNG', optimize=True)

        if cp in order:
            cat, pos = order[cp]
        else:
            cat, pos = CAT_INDEX['Other'], cp   # 未收录的按码点排在 Other
        entries.append((cat, pos, cp, buf.getvalue()))
        seen.add(cp)

    entries.sort(key=lambda e: (e[0], e[1], e[2]))

    os.makedirs(os.path.dirname(out), exist_ok=True)
    with open(out, 'wb') as fh:
        fh.write(b'ECP2')
        fh.write(struct.pack('<I', len(entries)))
        data_start = 4 + 4 + len(entries) * 13
        off = data_start
        index = bytearray()
        blob = bytearray()
        for cat, pos, cp, png in entries:
            index += struct.pack('<IIIB', cp, off, len(png), cat)
            blob += png
            off += len(png)
        fh.write(index)
        fh.write(blob)

    counts = {}
    for cat, pos, cp, png in entries:
        counts[CATEGORIES[cat]] = counts.get(CATEGORIES[cat], 0) + 1
    print('wrote', out, 'codepoints', len(entries), 'size', os.path.getsize(out))
    for name in CATEGORIES:
        if counts.get(name):
            print('  ', name, counts[name])


main()
