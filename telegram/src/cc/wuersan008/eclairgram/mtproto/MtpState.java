package cc.wuersan008.eclairgram.mtproto;

/**
 * MTProto 2.0 的会话状态：会话 id、salt、序号、消息 id，以及消息的加解密。
 *
 * 加密规则见 https://core.telegram.org/mtproto/description
 */
public final class MtpState {

    public static final class Message {
        public final long msgId;
        public final int seqNo;
        public final byte[] body;

        public Message(long msgId, int seqNo, byte[] body) {
            this.msgId = msgId;
            this.seqNo = seqNo;
            this.body = body;
        }
    }

    private final byte[] authKey;   // 256 字节；握手前可为 null
    private final long keyId;

    public long salt;
    public long sessionId;
    private int sequence;
    private long lastMsgId;
    public long timeOffset;         // 秒；服务端时间 - 本地时间

    public MtpState(byte[] authKey) {
        this.authKey = authKey;
        if (authKey != null) {
            byte[] h = Crypto.sha1(authKey);
            this.keyId = Crypto.longLE(h, 12);
        } else {
            this.keyId = 0;
        }
        reset();
    }

    public long keyId() {
        return keyId;
    }

    public byte[] authKey() {
        return authKey;
    }

    public void reset() {
        this.sessionId = Crypto.longLE(Crypto.random(8), 0);
        this.sequence = 0;
        this.lastMsgId = 0;
    }

    // ============================================================ 消息 id / 序号
    public long newMsgId() {
        long nowSec = System.currentTimeMillis() / 1000L + timeOffset;
        long nanos = (System.currentTimeMillis() % 1000L) * 1000000L;
        long id = (nowSec << 32) | ((nanos << 2) & 0xffffffffL);
        if (id <= lastMsgId) {
            id = lastMsgId + 4;
        }
        lastMsgId = id;
        return id;
    }

    public int nextSeq(boolean contentRelated) {
        if (contentRelated) {
            int r = sequence * 2 + 1;
            sequence += 1;
            return r;
        }
        return sequence * 2;
    }

    public void updateTimeOffset(long correctMsgId) {
        long correct = correctMsgId >>> 32;
        timeOffset = correct - (System.currentTimeMillis() / 1000L);
        lastMsgId = 0;
    }

    // ============================================================ 加解密
    private static void calcKey(byte[] authKey, byte[] msgKey, boolean client,
                                byte[] aesKey, byte[] aesIv) {
        int x = client ? 0 : 8;
        byte[] shaA = Crypto.sha256(msgKey, Crypto.slice(authKey, x, 36));
        byte[] shaB = Crypto.sha256(Crypto.slice(authKey, x + 40, 36), msgKey);
        System.arraycopy(shaA, 0, aesKey, 0, 8);
        System.arraycopy(shaB, 8, aesKey, 8, 16);
        System.arraycopy(shaA, 24, aesKey, 24, 8);
        System.arraycopy(shaB, 0, aesIv, 0, 8);
        System.arraycopy(shaA, 8, aesIv, 8, 16);
        System.arraycopy(shaB, 24, aesIv, 24, 8);
    }

    /** 用当前 auth_key 加密一条消息，返回可直接发给服务端的字节。 */
    public byte[] encrypt(byte[] body, long msgId, int seqNo) {
        Tl.Writer w = new Tl.Writer();
        w.int64(salt).int64(sessionId).int64(msgId).int32(seqNo).int32(body.length).raw(body);
        byte[] inner = w.toByteArray();

        int padLen = ((16 - ((inner.length + 12) % 16)) % 16) + 12;
        byte[] padding = Crypto.random(padLen);
        byte[] data = Crypto.concat(inner, padding);

        byte[] msgKey = Crypto.sha256(Crypto.slice(authKey, 88, 32), data);
        msgKey = Crypto.slice(msgKey, 8, 16);

        byte[] aesKey = new byte[32];
        byte[] aesIv = new byte[32];
        calcKey(authKey, msgKey, true, aesKey, aesIv);

        byte[] enc = Crypto.igeEncrypt(data, aesKey, aesIv);
        return Crypto.concat(longToBytes(keyId), msgKey, enc);
    }

    /** 解开服务端发来的加密消息。 */
    public Message decrypt(byte[] body) {
        byte[] keyIdB = Crypto.slice(body, 0, 8);
        if (Crypto.longLE(keyIdB, 0) != keyId) {
            throw new SecurityException("bad auth key id");
        }
        byte[] msgKey = Crypto.slice(body, 8, 16);
        byte[] aesKey = new byte[32];
        byte[] aesIv = new byte[32];
        calcKey(authKey, msgKey, false, aesKey, aesIv);
        byte[] plain = Crypto.igeDecrypt(Crypto.slice(body, 24, body.length - 24), aesKey, aesIv);

        byte[] expect = Crypto.sha256(Crypto.slice(authKey, 96, 32), plain);
        for (int i = 0; i < 16; i++) {
            if (expect[8 + i] != msgKey[i]) {
                throw new SecurityException("msg_key mismatch");
            }
        }

        Tl.Reader r = new Tl.Reader(plain);
        long remoteSalt = r.int64();
        long session = r.int64();
        long msgId = r.int64();
        int seq = r.int32();
        int len = r.int32();
        byte[] data = r.read(len);
        this.salt = remoteSalt;
        return new Message(msgId, seq, data);
    }

    private static byte[] longToBytes(long v) {
        byte[] b = new byte[8];
        for (int i = 0; i < 8; i++) {
            b[i] = (byte) (v >>> (8 * i));
        }
        return b;
    }
}
