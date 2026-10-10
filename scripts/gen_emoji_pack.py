#!/usr/bin/env python3
"""把 Blobmoji 的彩色 emoji 位图提取成一个紧凑的 emoji.pack。

Android 2.1–4.0 的字体引擎不支持 CBDT/CBLC 彩色字体，无法直接用 Typeface
渲染 Blobmoji。因此在构建期把每个 emoji 码点的位图抽出来、缩小并打包，
运行时按码点取图，用 ImageSpan 画出来。

用法：
    python3 scripts/gen_emoji_pack.py <Blobmoji.ttf> [输出路径]

默认输出 app/single/assets/emoji.pack。格式（小端）：
    magic "ECP1" | count:u32
    count × { codepoint:u32, offset:u32, length:u32 }
    PNG 数据区
"""
import os
import struct
import sys

from fontTools.ttLib import TTFont
from PIL import Image
import io

WS = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SIZE = int(os.environ.get('EMOJI_SIZE', '32'))


def main():
    ttf = sys.argv[1] if len(sys.argv) > 1 else 'Blobmoji.ttf'
    out = sys.argv[2] if len(sys.argv) > 2 else f'{WS}/app/single/assets/emoji.pack'
    font = TTFont(ttf)
    cmap = font.getBestCmap()
    strike = font['CBDT'].strikeData[0]

    entries = []          # (codepoint, png_bytes)
    seen = set()
    SKIP = {0x200D, 0xFE0E, 0xFE0F, 0x20E3}   # ZWJ / 变体选择符 / 组合键帽
    for cp, gname in cmap.items():
        if cp in seen:
            continue
        # 跳过 ASCII 与键帽基字符（'#'、'*'、数字），否则会把普通数字/标点替换成 emoji
        if cp < 0xA9 or cp in SKIP:
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
        entries.append((cp, buf.getvalue()))
        seen.add(cp)

    entries.sort(key=lambda e: e[0])
    os.makedirs(os.path.dirname(out), exist_ok=True)
    with open(out, 'wb') as fh:
        fh.write(b'ECP1')
        fh.write(struct.pack('<I', len(entries)))
        data_start = 4 + 4 + len(entries) * 12
        off = data_start
        index = bytearray()
        blob = bytearray()
        for cp, png in entries:
            index += struct.pack('<III', cp, off, len(png))
            blob += png
            off += len(png)
        fh.write(index)
        fh.write(blob)
    print('wrote', out, 'codepoints', len(entries),
          'size', os.path.getsize(out))


main()
