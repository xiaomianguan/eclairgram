package cc.wuersan008.eclairgram.mtproto;

import java.math.BigInteger;

/**
 * Telegram 两步验证（2FA）的 SRP 6a 计算。
 *
 * 只实现目前唯一在用的算法
 * passwordKdfAlgoSHA256SHA256PBKDF2HMACSHA512iter100000SHA256ModPow。
 * 输入用户在 account.password 里拿到的参数与明文密码，输出
 * InputCheckPasswordSRP 需要的 A(=g_a) 与 M1。
 *
 * 见 https://core.telegram.org/api/srp
 */
public final class Srp {

    /** 计算结果：A 与 M1，均为大端定长（A 256 字节，M1 32 字节）。 */
    public static final class Check {
        public final byte[] A;
        public final byte[] M1;

        public Check(byte[] a, byte[] m1) {
            A = a;
            M1 = m1;
        }
    }

    private static final int PAD = 256;   // 2048 bits

    private Srp() {}

    public static Check compute(byte[] salt1, byte[] salt2, int g,
                                byte[] pBytes, byte[] bBytes, String password) {
        return compute(salt1, salt2, g, pBytes, bBytes, password, Crypto.random(PAD));
    }

    /** 同上，但允许指定随机数 a（便于用测试向量验证）。 */
    static Check compute(byte[] salt1, byte[] salt2, int g,
                         byte[] pBytes, byte[] bBytes, String password, byte[] aBytes) {
        try {
            BigInteger p = new BigInteger(1, pBytes);
            BigInteger gv = BigInteger.valueOf(g);
            BigInteger B = new BigInteger(1, bBytes);

            byte[] pw = password.getBytes("UTF-8");

            // x = PH2(password, salt1, salt2)
            byte[] ph1 = sh(sh(pw, salt1), salt2);
            byte[] ph2 = sh(Crypto.pbkdf2Sha512(ph1, salt1, 100000, 64), salt2);
            BigInteger x = new BigInteger(1, ph2);

            byte[] pPad = Crypto.toFixed(p, PAD);
            byte[] gPad = Crypto.toFixed(gv, PAD);
            byte[] bPad = Crypto.toFixed(B, PAD);

            BigInteger k = new BigInteger(1, Crypto.sha256(Crypto.concat(pPad, gPad)));
            BigInteger v = gv.modPow(x, p);
            BigInteger kv = k.multiply(v).mod(p);

            // 客户端随机 a，算出 g_a
            BigInteger a = new BigInteger(1, aBytes);
            BigInteger A = gv.modPow(a, p);
            byte[] aPad = Crypto.toFixed(A, PAD);

            BigInteger u = new BigInteger(1, Crypto.sha256(Crypto.concat(aPad, bPad)));
            BigInteger t = B.subtract(kv).mod(p);
            BigInteger s = t.modPow(a.add(u.multiply(x)), p);
            byte[] kA = Crypto.sha256(Crypto.toFixed(s, PAD));

            byte[] hP = Crypto.sha256(pPad);
            byte[] hG = Crypto.sha256(gPad);
            byte[] xor = new byte[hP.length];
            for (int i = 0; i < xor.length; i++) xor[i] = (byte) (hP[i] ^ hG[i]);

            byte[] m1 = Crypto.sha256(Crypto.concat(
                    xor, Crypto.sha256(salt1), Crypto.sha256(salt2), aPad, bPad, kA));
            return new Check(aPad, m1);
        } catch (Exception e) {
            throw new RuntimeException("srp compute failed", e);
        }
    }

    /** SH(data, salt) = H(salt | data | salt) */
    private static byte[] sh(byte[] data, byte[] salt) {
        return Crypto.sha256(Crypto.concat(salt, data, salt));
    }
}
