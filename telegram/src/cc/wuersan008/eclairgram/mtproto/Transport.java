package cc.wuersan008.eclairgram.mtproto;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.net.Socket;

/**
 * obfuscated2 + abridged 传输层。
 *
 * Telegram 的数据中心只接受“混淆”后的 TCP 流：先发 64 字节随机头，
 * 其中穿插协议标识（abridged = 0xefefefef），整条流用 AES-CTR 加密。
 * 帧格式（abridged）：1 字节长度（以 4 字节为单位），或 0x7f + 3 字节小端长度。
 */
public final class Transport {

    private final Socket socket;
    private final InputStream in;
    private final OutputStream out;
    private final AesCtr encryptor;
    private final AesCtr decryptor;

    public Transport(String host, int port, int timeoutMs) throws IOException {
        socket = new Socket();
        socket.connect(new InetSocketAddress(host, port), timeoutMs);
        socket.setTcpNoDelay(true);
        socket.setSoTimeout(timeoutMs);
        in = socket.getInputStream();
        out = socket.getOutputStream();

        byte[] header = buildHeader();
        // 头部按原样发送（其中最后 8 字节已由 CTR 流处理过，状态同步推进一步）
        out.write(header);
        out.flush();
        this.encryptor = enc;
        this.decryptor = dec;
    }

    private AesCtr enc;
    private AesCtr dec;

    private byte[] buildHeader() {
        byte[] r;
        while (true) {
            r = Crypto.random(64);
            if ((r[0] & 0xff) == 0xef) continue;
            if (equalsAscii(r, 0, "PVrG")) continue;
            if (equalsAscii(r, 0, "GET ")) continue;
            if (equalsAscii(r, 0, "POST")) continue;
            if ((r[4] & 0xff) == 0 && (r[5] & 0xff) == 0
                    && (r[6] & 0xff) == 0 && (r[7] & 0xff) == 0) continue;
            break;
        }
        byte[] rev = new byte[48];
        for (int i = 0; i < 48; i++) {
            rev[i] = r[55 - i];
        }
        byte[] encKey = Crypto.slice(r, 8, 32);
        byte[] encIv = Crypto.slice(r, 40, 16);
        byte[] decKey = Crypto.slice(rev, 0, 32);
        byte[] decIv = Crypto.slice(rev, 32, 16);
        enc = new AesCtr(encKey, encIv);
        dec = new AesCtr(decKey, decIv);

        r[56] = (byte) 0xef;
        r[57] = (byte) 0xef;
        r[58] = (byte) 0xef;
        r[59] = (byte) 0xef;
        byte[] processed = enc.process(r);
        System.arraycopy(processed, 56, r, 56, 8);
        return r;
    }

    private static boolean equalsAscii(byte[] b, int off, String s) {
        for (int i = 0; i < s.length(); i++) {
            if (b[off + i] != (byte) s.charAt(i)) return false;
        }
        return true;
    }

    /** 发送一个 MTProto 包（abridged 帧）。 */
    public synchronized void send(byte[] payload) throws IOException {
        int len = payload.length >> 2;
        java.io.ByteArrayOutputStream head = new java.io.ByteArrayOutputStream(4);
        if (len < 127) {
            head.write(len);
        } else {
            head.write(0x7f);
            head.write(len & 0xff);
            head.write((len >>> 8) & 0xff);
            head.write((len >>> 16) & 0xff);
        }
        byte[] h = head.toByteArray();
        out.write(encryptor.process(h));
        if (payload.length > 0) {
            out.write(encryptor.process(payload));
        }
        out.flush();
    }

    /** 接收一个 MTProto 包（abridged 帧）。 */
    public synchronized byte[] recv() throws IOException {
        int first = readByteDecrypted();
        int len;
        if (first < 127) {
            len = first;
        } else {
            int b0 = readByteDecrypted();
            int b1 = readByteDecrypted();
            int b2 = readByteDecrypted();
            len = b0 | (b1 << 8) | (b2 << 16);
        }
        int n = len << 2;
        byte[] buf = new byte[n];
        int got = 0;
        while (got < n) {
            int r = in.read(buf, got, n - got);
            if (r < 0) throw new IOException("connection closed");
            got += r;
        }
        // 整段读齐后再解密，保证 CTR 计数器与流严格对齐
        byte[] dec = decryptor.process(buf);
        if (System.getProperty("tg.debug") != null) {
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Math.min(dec.length, 32); i++) {
                sb.append(String.format("%02x", dec[i]));
            }
            System.err.println("[transport] recv len=" + dec.length + " hex=" + sb);
        }
        return dec;
    }

    private int readByteDecrypted() throws IOException {
        byte[] one = new byte[1];
        int r = in.read(one);
        if (r < 0) throw new IOException("connection closed");
        return decryptor.process(one)[0] & 0xff;
    }

    public void close() {
        try {
            socket.close();
        } catch (IOException ignored) {
        }
    }

    public boolean isConnected() {
        return socket != null && socket.isConnected() && !socket.isClosed();
    }
}
