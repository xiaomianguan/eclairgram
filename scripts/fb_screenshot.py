#!/usr/bin/env python3
"""从模拟器 /dev/graphics/fb0 抓取帧缓冲并转换为 PNG。

Android 2.1 没有 screencap，因此直接读取 goldfish 帧缓冲（RGB565）。
用法: fb_screenshot.py <raw_dump> <out.png> [width] [height] [rotate_ccw]

rotate_ccw: 0/90/180/270，逆时针旋转角度（默认 0）。
注意：本工作区的 goldfish 模拟器客户机是横屏 480x320，而帧缓冲是竖屏
320x480，因此需要逆时针旋转 90° 才能得到正向图像；screenshot.sh 已带上该参数。
"""
import struct
import sys
import zlib


def write_png(path, width, height, rgb_rows):
    raw = b''.join(b'\x00' + row for row in rgb_rows)

    def chunk(tag, data):
        c = struct.pack('>I', len(data)) + tag + data
        return c + struct.pack('>I', zlib.crc32(tag + data) & 0xffffffff)

    png = b'\x89PNG\r\n\x1a\n'
    png += chunk(b'IHDR', struct.pack('>IIBBBBB', width, height, 8, 2, 0, 0, 0))
    png += chunk(b'IDAT', zlib.compress(raw, 6))
    png += chunk(b'IEND', b'')
    open(path, 'wb').write(png)


def rotate_ccw(w, h, rows, degrees):
    degrees %= 360
    if degrees == 0:
        return w, h, rows
    if degrees == 180:
        out = [bytes(rows[h - 1 - y][x * 3:x * 3 + 3]
                     for x in range(w - 1, -1, -1)) for y in range(h)]
        return w, h, out
    if degrees == 90:            # 逆时针 90°：输出 h x w
        out = []
        for x in range(w - 1, -1, -1):
            row = bytearray()
            for y in range(h):
                row += rows[y][x * 3:x * 3 + 3]
            out.append(bytes(row))
        return h, w, out
    if degrees == 270:           # 顺时针 90°
        out = []
        for x in range(w):
            row = bytearray()
            for y in range(h - 1, -1, -1):
                row += rows[y][x * 3:x * 3 + 3]
            out.append(bytes(row))
        return h, w, out
    raise ValueError('rotate 只能是 0/90/180/270')


def main():
    src, dst = sys.argv[1], sys.argv[2]
    w = int(sys.argv[3]) if len(sys.argv) > 3 else 320
    h = int(sys.argv[4]) if len(sys.argv) > 4 else 480
    rot = int(sys.argv[5]) if len(sys.argv) > 5 else 0
    data = open(src, 'rb').read()
    stride = len(data) // h
    rows = []
    for y in range(h):
        off = y * stride
        row = data[off:off + w * 2]
        out = bytearray()
        for x in range(w):
            px = row[x * 2] | (row[x * 2 + 1] << 8)
            r = ((px >> 11) & 0x1f) * 255 // 31
            g = ((px >> 5) & 0x3f) * 255 // 63
            b = (px & 0x1f) * 255 // 31
            out += bytes((r, g, b))
        rows.append(bytes(out))
    w, h, rows = rotate_ccw(w, h, rows, rot)
    write_png(dst, w, h, rows)
    print(f'wrote {dst} ({w}x{h}, stride={stride}, rotate={rot})')


if __name__ == '__main__':
    main()
