package cc.wuersan008.eclairgram.mtproto;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.SecureRandom;

import javax.crypto.Cipher;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

/**
 * MTProto 需要的密码学原语。
 *
 * 只依赖 java.security / javax.crypto（Android 2.1 与桌面 JVM 都有），
 * AES 用 ECB 自己拼出 IGE 与 CTR 两种模式，因此不需要任何第三方库。
 */
public final class Crypto {

    private static final SecureRandom RNG = new SecureRandom();

    private Crypto() {}

    public static byte[] random(int n) {
        byte[] b = new byte[n];
        RNG.nextBytes(b);
        return b;
    }

    // ============================================================ 哈希
    public static byte[] sha1(byte[] data) {
        return digest("SHA-1", data, 0, data.length);
    }

    public static byte[] sha1(byte[] a, byte[] b) {
        MessageDigest md = md("SHA-1");
        md.update(a);
        md.update(b);
        return md.digest();
    }

    public static byte[] sha256(byte[] data) {
        return digest("SHA-256", data, 0, data.length);
    }

    public static byte[] sha256(byte[] a, byte[] b) {
        MessageDigest md = md("SHA-256");
        md.update(a);
        md.update(b);
        return md.digest();
    }

    // ============================================================ HMAC / PBKDF2
    public static byte[] hmacSha512(byte[] key, byte[] data) {
        try {
            Mac mac = Mac.getInstance("HmacSHA512");
            mac.init(new SecretKeySpec(key, "HmacSHA512"));
            return mac.doFinal(data);
        } catch (Exception e) {
            throw new RuntimeException("HmacSHA512 not available", e);
        }
    }

    /**
     * PBKDF2-HMAC-SHA512（Telegram 的 2FA SRP 用 100000 次）。
     * dkLen &lt;= 64 时单块即可，无需处理多块拼接。
     */
    public static byte[] pbkdf2Sha512(byte[] password, byte[] salt, int iterations, int dkLen) {
        byte[] block = concat(salt, new byte[] { 0, 0, 0, 1 });
        byte[] u = hmacSha512(password, block);
        byte[] out = u.clone();
        for (int i = 1; i < iterations; i++) {
            u = hmacSha512(password, u);
            for (int j = 0; j < out.length; j++) out[j] ^= u[j];
        }
        return slice(out, 0, dkLen);
    }

    private static byte[] digest(String alg, byte[] data, int off, int len) {
        MessageDigest md = md(alg);
        md.update(data, off, len);
        return md.digest();
    }

    private static MessageDigest md(String alg) {
        try {
            return MessageDigest.getInstance(alg);
        } catch (Exception e) {
            throw new RuntimeException("missing digest " + alg, e);
        }
    }

    // ============================================================ AES 原子
    /** 取一个 AES/ECB Cipher（NoPadding）并完成 key schedule。Cipher 有状态，勿跨线程共享。 */
    private static Cipher aes(int mode, byte[] key) {
        try {
            Cipher c = Cipher.getInstance("AES/ECB/NoPadding");
            c.init(mode, new SecretKeySpec(key, "AES"));
            return c;
        } catch (Exception e) {
            throw new RuntimeException("AES/ECB not available", e);
        }
    }

    /** 初始化一个可复用的 AES-ECB 加密器（只做一次 key schedule）。 */
    static Cipher aesEncryptor(byte[] key) {
        return aes(Cipher.ENCRYPT_MODE, key);
    }

    /** 初始化一个可复用的 AES-ECB 解密器。 */
    static Cipher aesDecryptor(byte[] key) {
        return aes(Cipher.DECRYPT_MODE, key);
    }

    /** 用已初始化的 Cipher 处理若干整块（ECB 无链式状态，可反复调用）。 */
    static void aesBlocks(Cipher c, byte[] in, int inOff, int len, byte[] out, int outOff) {
        try {
            c.doFinal(in, inOff, len, out, outOff);
        } catch (Exception e) {
            throw new RuntimeException("aes blocks", e);
        }
    }

    // ============================================================ IGE
    /** AES-IGE 加密；plain 长度不足 16 的倍数时用随机字节补齐（与参考实现一致）。 */
    public static byte[] igeEncrypt(byte[] plain, byte[] key, byte[] iv) {
        int rem = plain.length % 16;
        byte[] data;
        if (rem != 0) {
            data = new byte[plain.length + (16 - rem)];
            System.arraycopy(plain, 0, data, 0, plain.length);
            byte[] pad = random(16 - rem);
            System.arraycopy(pad, 0, data, plain.length, pad.length);
        } else {
            data = plain;
        }
        byte[] iv1 = new byte[16];
        byte[] iv2 = new byte[16];
        System.arraycopy(iv, 0, iv1, 0, 16);
        System.arraycopy(iv, 16, iv2, 0, 16);

        byte[] out = new byte[data.length];
        byte[] tmp = new byte[16];
        byte[] enc = new byte[16];
        Cipher c = aesEncryptor(key);        // key schedule 只做一次
        for (int off = 0; off < data.length; off += 16) {
            for (int i = 0; i < 16; i++) tmp[i] = (byte) (data[off + i] ^ iv1[i]);
            aesBlocks(c, tmp, 0, 16, enc, 0);
            for (int i = 0; i < 16; i++) out[off + i] = (byte) (enc[i] ^ iv2[i]);
            iv1 = slice(out, off, 16);
            iv2 = slice(data, off, 16);
        }
        return out;
    }

    /** AES-IGE 解密。 */
    public static byte[] igeDecrypt(byte[] cipher, byte[] key, byte[] iv) {
        byte[] iv1 = new byte[16];
        byte[] iv2 = new byte[16];
        System.arraycopy(iv, 0, iv1, 0, 16);
        System.arraycopy(iv, 16, iv2, 0, 16);
        byte[] out = new byte[cipher.length];
        byte[] tmp = new byte[16];
        byte[] dec = new byte[16];
        Cipher c = aesDecryptor(key);        // key schedule 只做一次
        for (int off = 0; off < cipher.length; off += 16) {
            for (int i = 0; i < 16; i++) tmp[i] = (byte) (cipher[off + i] ^ iv2[i]);
            aesBlocks(c, tmp, 0, 16, dec, 0);
            for (int i = 0; i < 16; i++) out[off + i] = (byte) (dec[i] ^ iv1[i]);
            iv1 = slice(cipher, off, 16);
            iv2 = slice(out, off, 16);
        }
        return out;
    }

    // ============================================================ RSA
    /**
     * Telegram 的 RSA 加密：sha1(data) + data + 随机填充 = 255 字节，
     * 再按大端整数做 modPow，输出 256 字节。
     */
    public static byte[] rsaEncrypt(byte[] data, BigInteger n, BigInteger e) {
        byte[] hash = sha1(data);
        int padLen = 235 - data.length;
        if (padLen < 0) {
            throw new IllegalArgumentException("rsa payload too long");
        }
        byte[] block = new byte[255];
        System.arraycopy(hash, 0, block, 0, 20);
        System.arraycopy(data, 0, block, 20, data.length);
        byte[] pad = random(padLen);
        System.arraycopy(pad, 0, block, 20 + data.length, padLen);

        BigInteger m = new BigInteger(1, block);
        BigInteger c = m.modPow(e, n);
        return toFixed(c, 256);
    }

    // ============================================================ 工具
    public static byte[] slice(byte[] a, int off, int len) {
        byte[] r = new byte[len];
        System.arraycopy(a, off, r, 0, len);
        return r;
    }

    public static byte[] concat(byte[]... parts) {
        int n = 0;
        for (byte[] p : parts) n += p.length;
        byte[] r = new byte[n];
        int o = 0;
        for (byte[] p : parts) {
            System.arraycopy(p, 0, r, o, p.length);
            o += p.length;
        }
        return r;
    }

    public static byte[] toFixed(BigInteger v, int len) {
        byte[] b = v.toByteArray();
        // 去掉符号位造成的前导 0
        int start = 0;
        while (start < b.length - 1 && b[start] == 0) start++;
        int n = b.length - start;
        if (n > len) {
            start += (n - len);
            n = len;
        }
        byte[] r = new byte[len];
        System.arraycopy(b, start, r, len - n, n);
        return r;
    }

    /** 大端最小字节表示（去掉前导零），用于 DH 的 g_a/g_b/prime 等。 */
    public static byte[] bigEndianMinimal(BigInteger v) {
        byte[] b = v.toByteArray();
        int start = 0;
        while (start < b.length - 1 && b[start] == 0) start++;
        return slice(b, start, b.length - start);
    }

    public static long longLE(byte[] b, int off) {
        long r = 0;
        for (int i = 7; i >= 0; i--) {
            r = (r << 8) | (b[off + i] & 0xffL);
        }
        return r;
    }
}
