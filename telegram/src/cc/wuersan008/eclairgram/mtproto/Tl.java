package cc.wuersan008.eclairgram.mtproto;

import java.io.ByteArrayOutputStream;
import java.io.UnsupportedEncodingException;

/**
 * TL（Type Language）序列化：MTProto 的线格式。
 *
 * 所有整数都是小端；bytes/string 带长度前缀并按 4 字节对齐。
 * 这个类不依赖 Android，也能在桌面 JVM 上跑（便于先用 JDK 验证协议）。
 */
public final class Tl {

    private Tl() {}

    // ============================================================ 写
    public static final class Writer {
        private final ByteArrayOutputStream out = new ByteArrayOutputStream(256);

        public Writer u8(int v) {
            out.write(v & 0xff);
            return this;
        }

        public Writer int32(int v) {
            out.write(v & 0xff);
            out.write((v >>> 8) & 0xff);
            out.write((v >>> 16) & 0xff);
            out.write((v >>> 24) & 0xff);
            return this;
        }

        public Writer int64(long v) {
            int32((int) (v & 0xffffffffL));
            int32((int) ((v >>> 32) & 0xffffffffL));
            return this;
        }

        public Writer raw(byte[] b) {
            out.write(b, 0, b.length);
            return this;
        }

        public Writer raw(byte[] b, int off, int len) {
            out.write(b, off, len);
            return this;
        }

        /** 按 MTProto 规则写 bytes：长度前缀 + 数据 + 对齐填充。 */
        public Writer bytes(byte[] data) {
            int len = data == null ? 0 : data.length;
            if (len < 254) {
                u8(len);
                if (len > 0) raw(data, 0, len);
                int pad = (len + 1) % 4;
                if (pad != 0) {
                    for (int i = pad; i < 4; i++) u8(0);
                }
            } else {
                u8(254);
                u8(len & 0xff);
                u8((len >>> 8) & 0xff);
                u8((len >>> 16) & 0xff);
                if (len > 0) raw(data, 0, len);
                int pad = len % 4;
                if (pad != 0) {
                    for (int i = pad; i < 4; i++) u8(0);
                }
            }
            return this;
        }

        public Writer string(String s) {
            return bytes(utf8(s == null ? "" : s));
        }

        /** 写一个 [vector#1cb5c415][count][元素] 的头部。 */
        public Writer vectorHeader(int count) {
            return int32(0x1cb5c415).int32(count);
        }

        public int size() {
            return out.size();
        }

        public byte[] toByteArray() {
            return out.toByteArray();
        }
    }

    // ============================================================ 读
    public static final class Reader {
        private final byte[] buf;
        private int pos;

        public Reader(byte[] data) {
            this(data, 0);
        }

        public Reader(byte[] data, int offset) {
            this.buf = data;
            this.pos = offset;
        }

        public int position() {
            return pos;
        }

        public void seek(int p) {
            pos = p;
        }

        public boolean eof() {
            return pos >= buf.length;
        }

        public int remaining() {
            return buf.length - pos;
        }

        public int u8() {
            return buf[pos++] & 0xff;
        }

        public int int32() {
            int v = (buf[pos] & 0xff)
                    | ((buf[pos + 1] & 0xff) << 8)
                    | ((buf[pos + 2] & 0xff) << 16)
                    | ((buf[pos + 3] & 0xff) << 24);
            pos += 4;
            return v;
        }

        public long uint32() {
            return int32() & 0xffffffffL;
        }

        public long int64() {
            long lo = int32() & 0xffffffffL;
            long hi = int32() & 0xffffffffL;
            return (hi << 32) | lo;
        }

        public byte[] raw(int len) {
            byte[] r = new byte[len];
            System.arraycopy(buf, pos, r, 0, len);
            pos += len;
            return r;
        }

        public byte[] read(int len) {
            return raw(len);
        }

        public byte[] readRemaining() {
            return raw(buf.length - pos);
        }

        public byte[] bytes() {
            int first = u8();
            int len;
            if (first == 254) {
                len = u8() | (u8() << 8) | (u8() << 16);
            } else {
                len = first;
            }
            byte[] r = raw(len);
            int consumed = (first == 254 ? 4 : 1) + len;
            int pad = consumed % 4;
            if (pad != 0) pos += 4 - pad;
            return r;
        }

        public String string() {
            return utf8(bytes());
        }

        public byte[] int128() {
            return raw(16);
        }

        public byte[] int256() {
            return raw(32);
        }

        /** 读一个 vector 头，返回元素个数。 */
        public int vectorHeader() {
            int32(); // 0x1cb5c415
            return int32();
        }

        private final byte[] buf0() {
            return buf;
        }
    }

    // ============================================================ 工具
    public static byte[] utf8(String s) {
        try {
            return s.getBytes("UTF-8");
        } catch (UnsupportedEncodingException e) {
            return s.getBytes();
        }
    }

    public static String utf8(byte[] b) {
        try {
            return new String(b, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            return new String(b);
        }
    }
}
