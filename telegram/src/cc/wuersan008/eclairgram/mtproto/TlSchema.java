package cc.wuersan008.eclairgram.mtproto;

import java.math.BigInteger;

/**
 * 用到的那部分 TL 构造器（constructor）常量与数据对象。
 *
 * 编号与字段顺序来自 Telegram 官方 schema（与 Telethon 生成的代码一致）。
 */
public final class TlSchema {

    // ---- mtproto 核心 ----
    public static final int RES_PQ = 0x05162463;
    public static final int SERVER_DH_PARAMS_OK = 0xd0e8075c;
    public static final int SERVER_DH_PARAMS_FAIL = 0x79cb045d;
    public static final int DH_GEN_OK = 0x3bcbf734;
    public static final int DH_GEN_RETRY = 0x46dc1fb9;
    public static final int DH_GEN_FAIL = 0xa69dae02;
    public static final int RPC_RESULT = 0xf35c6d01;
    public static final int RPC_ERROR = 0x2144ca19;
    public static final int MSG_CONTAINER = 0x73f1f8dc;
    public static final int NEW_SESSION_CREATED = 0x9ec20908;
    public static final int BAD_SERVER_SALT = 0xedab447b;
    public static final int BAD_MSG_NOTIFICATION = 0xa7eff811;
    public static final int MSGS_ACK = 0x62d6b459;
    public static final int PONG = 0x347773c5;
    public static final int GZIP_PACKED = 0x3072cfa1;
    public static final int VECTOR = 0x1cb5c415;
    public static final int MSG_COPY = 0x5f4f6f0f;

    // ---- 请求 ----
    public static final int REQ_PQ_MULTI = 0xbe7e8ef1;
    public static final int REQ_DH_PARAMS = 0xd712e4be;
    public static final int SET_CLIENT_DH_PARAMS = 0xf5045f1f;
    public static final int INVOKE_WITH_LAYER = 0xda9b0d0d;
    public static final int INIT_CONNECTION = 0xc1cd5ea9;
    public static final int AUTH_SEND_CODE = 0xa677244f;
    public static final int AUTH_SIGN_IN = 0x8d52a951;
    public static final int AUTH_EXPORT_AUTHORIZATION = 0xe5bfffcd;
    public static final int AUTH_IMPORT_AUTHORIZATION = 0xa57a7dad;
    public static final int AUTH_SIGN_UP = 0xaac7b717;
    public static final int AUTH_RESEND_CODE = 0xcae47523;
    public static final int AUTH_LOG_OUT = 0x3e72ba19;
    public static final int AUTH_SENT_CODE = 0x5e002502;
    public static final int AUTH_AUTHORIZATION = 0x2ea2c0d4;
    public static final int AUTH_AUTHORIZATION_SIGN_UP_REQUIRED = 0x44747e9a;
    public static final int CODE_SETTINGS = 0xad253d78;
    // ---- 两步验证（2FA / SRP）----
    public static final int ACCOUNT_GET_PASSWORD = 0x548a30f5;
    public static final int ACCOUNT_PASSWORD = 0x957b50fb;
    public static final int AUTH_CHECK_PASSWORD = 0xd18b4d16;
    public static final int INPUT_CHECK_PASSWORD_SRP = 0xd27ff082;
    public static final int PASSWORD_KDF_ALGO_MODPOW = 0x3a912d4a;

    // ---- 业务方法 ----
    public static final int HELP_GET_CONFIG = 0xc4f9186b;
    public static final int UPDATES_GET_STATE = 0xedd4882a;
    public static final int UPDATES_GET_DIFFERENCE = 0x19c2f763;
    public static final int MESSAGES_READ_HISTORY = 0x0e306d3a;
    public static final int MESSAGES_SEND_MEDIA = 0x0330e77f;
    public static final int UPLOAD_SAVE_FILE_PART = 0xb304a621;
    public static final int INPUT_FILE = 0xf52ff27f;
    public static final int INPUT_MEDIA_UPLOADED_PHOTO = 0x7d8375da;
    public static final int INPUT_PHOTO_FILE_LOCATION = 0x40181ffe;
    public static final int INPUT_DOCUMENT_FILE_LOCATION = 0xbad07584;
    public static final int CHANNELS_READ_HISTORY = 0xcc104937;
    public static final int INPUT_CHANNEL = 0xf35aec28;
    public static final int MESSAGES_GET_DIALOGS = 0xa0f4cb4f;
    public static final int MESSAGES_GET_HISTORY = 0x4423e6c5;
    public static final int MESSAGES_SEND_MESSAGE = 0xfef48f62;
    public static final int USERS_GET_USERS = 0x0d91a548;

    public static final int DIALOGS = 0x15ba6c40;
    public static final int DIALOGS_SLICE = 0x71e094f3;
    public static final int MESSAGES = 0x1d73e7ea;
    public static final int MESSAGES_SLICE = 0x5f206716;

    public static final int INPUT_PEER_EMPTY = 0x7f3b18ea;
    public static final int INPUT_PEER_SELF = 0x7da07ec9;
    public static final int INPUT_PEER_USER = 0xdde8a54c;
    public static final int INPUT_PEER_CHAT = 0x35a95cb9;
    public static final int INPUT_PEER_CHANNEL = 0x27bcbbfc;
    public static final int PEER_USER = 0x59511722;
    public static final int PEER_CHAT = 0x36c6019a;
    public static final int PEER_CHANNEL = 0xa2a5371e;

    // ---- sentCodeType ----
    public static final int SENT_CODE_TYPE_APP = 0x3dbb5986;
    public static final int SENT_CODE_TYPE_SMS = 0xc000bba2;
    public static final int SENT_CODE_TYPE_CALL = 0x5353e5a7;
    public static final int SENT_CODE_TYPE_FLASH_CALL = 0xab03c6d9;

    private TlSchema() {}

    // ============================================================ 数据对象
    public static final class ResPQ {
        public byte[] nonce;
        public byte[] serverNonce;
        public byte[] pq;
        public long[] fingerprints;
    }

    public static final class ServerDhParamsOk {
        public byte[] nonce;
        public byte[] serverNonce;
        public byte[] encryptedAnswer;
    }

    public static final class ServerDhParamsFail {
        public byte[] nonce;
        public byte[] serverNonce;
        public byte[] newNonceHash;
    }

    public static final class DhGen {
        public int type; // DH_GEN_OK / RETRY / FAIL
        public byte[] nonce;
        public byte[] serverNonce;
        public byte[] newNonceHash;
    }

    public static final class RpcResult {
        public long reqMsgId;
        public Object result;   // 解析后的对象，或 RpcError
    }

    public static final class RpcError {
        public int code;
        public String message;
    }

    public static final class NewSession {
        public long firstMsgId;
        public long uniqueId;
        public long serverSalt;
    }

    public static final class BadSalt {
        public long badMsgId;
        public int badSeqNo;
        public int errorCode;
        public long newSalt;
    }

    public static final class SentCode {
        public int typeId;
        public int typeLength;      // SentCodeType* 的长度字段
        public String phoneCodeHash;
        public int timeout;
    }

    public static final class Authorization {
        public byte[] userBytes;    // 原始 user 对象（后续按需解析）
    }

    // ============================================================ 解析
    /** 读 resPQ。 */
    public static ResPQ parseResPQ(Tl.Reader r) {
        ResPQ o = new ResPQ();
        o.nonce = r.int128();
        o.serverNonce = r.int128();
        o.pq = r.bytes();
        int n = r.vectorHeader();
        o.fingerprints = new long[n];
        for (int i = 0; i < n; i++) o.fingerprints[i] = r.int64();
        return o;
    }

    public static ServerDhParamsOk parseServerDhParamsOk(Tl.Reader r) {
        ServerDhParamsOk o = new ServerDhParamsOk();
        o.nonce = r.int128();
        o.serverNonce = r.int128();
        o.encryptedAnswer = r.bytes();
        return o;
    }

    public static ServerDhParamsFail parseServerDhParamsFail(Tl.Reader r) {
        ServerDhParamsFail o = new ServerDhParamsFail();
        o.nonce = r.int128();
        o.serverNonce = r.int128();
        o.newNonceHash = r.int128();
        return o;
    }

    public static DhGen parseDhGen(int ctor, Tl.Reader r) {
        DhGen o = new DhGen();
        o.type = ctor;
        o.nonce = r.int128();
        o.serverNonce = r.int128();
        o.newNonceHash = r.int128();
        return o;
    }

    public static RpcError parseRpcError(Tl.Reader r) {
        RpcError e = new RpcError();
        e.code = r.int32();
        e.message = r.string();
        return e;
    }

    public static NewSession parseNewSession(Tl.Reader r) {
        NewSession o = new NewSession();
        o.firstMsgId = r.int64();
        o.uniqueId = r.int64();
        o.serverSalt = r.int64();
        return o;
    }

    public static BadSalt parseBadSalt(Tl.Reader r) {
        BadSalt o = new BadSalt();
        o.badMsgId = r.int64();
        o.badSeqNo = r.int32();
        o.errorCode = r.int32();
        o.newSalt = r.int64();
        return o;
    }

    /** 读 auth.sentCode：type 对象、phone_code_hash、可选 next_type / timeout。 */
    public static SentCode parseSentCode(Tl.Reader r) {
        SentCode o = new SentCode();
        int flags = r.int32();
        int typeCtor = r.int32();
        o.typeId = typeCtor;
        if (typeCtor == SENT_CODE_TYPE_FLASH_CALL) {
            r.string();
        } else {
            o.typeLength = r.int32();
        }
        o.phoneCodeHash = r.string();
        if ((flags & 2) != 0) {
            skipObject(r);
        }
        if ((flags & 4) != 0) {
            o.timeout = r.int32();
        }
        return o;
    }

    /** 读取并跳过任意一个“小而已知”的对象（只用于可选字段）。 */
    static void skipObject(Tl.Reader r) {
        int ctor = r.int32();
        switch (ctor) {
            case CODE_SETTINGS:
                return;
            case 0x72a3158c: // codeTypeSms
            case 0x741cd3e3: // codeTypeCall
            case 0x226ccefb: // codeTypeFlashCall
            case 0xd61ad6ee: // codeTypeMissedCall
                return;
            case SENT_CODE_TYPE_APP:
            case SENT_CODE_TYPE_SMS:
            case SENT_CODE_TYPE_CALL:
                r.int32();
                return;
            default:
                throw new IllegalStateException(
                        "skipObject: unknown ctor 0x" + Integer.toHexString(ctor));
        }
    }

    // ============================================================ 因式分解
    /** Pollard-rho Brent，把一个约为两个 31 位素数之积的 pq 拆开。 */
    public static BigInteger[] factorize(BigInteger pq) {
        if (pq.testBit(0) == false) {
            return new BigInteger[] { BigInteger.valueOf(2), pq.divide(BigInteger.valueOf(2)) };
        }
        java.util.Random rnd = new java.util.Random();
        while (true) {
            BigInteger y = new BigInteger(pq.bitLength(), rnd).mod(pq);
            BigInteger c = new BigInteger(pq.bitLength(), rnd).mod(pq);
            BigInteger m = BigInteger.valueOf(128);
            BigInteger g = BigInteger.ONE;
            BigInteger r = BigInteger.ONE;
            BigInteger q = BigInteger.ONE;
            BigInteger x = BigInteger.ZERO;
            BigInteger ys = BigInteger.ZERO;
            while (g.equals(BigInteger.ONE)) {
                x = y;
                for (BigInteger i = BigInteger.ZERO; i.compareTo(r) < 0;
                     i = i.add(BigInteger.ONE)) {
                    y = y.multiply(y).add(c).mod(pq);
                }
                BigInteger k = BigInteger.ZERO;
                while (k.compareTo(r) < 0 && g.equals(BigInteger.ONE)) {
                    ys = y;
                    BigInteger lim = m.min(r.subtract(k));
                    for (BigInteger i = BigInteger.ZERO; i.compareTo(lim) < 0;
                         i = i.add(BigInteger.ONE)) {
                        y = y.multiply(y).add(c).mod(pq);
                        q = q.multiply(x.subtract(y).abs()).mod(pq);
                    }
                    g = q.gcd(pq);
                    k = k.add(m);
                }
                r = r.shiftLeft(1);
            }
            if (g.equals(pq)) {
                while (true) {
                    ys = ys.multiply(ys).add(c).mod(pq);
                    g = x.subtract(ys).abs().gcd(pq);
                    if (g.compareTo(BigInteger.ONE) > 0) break;
                }
            }
            if (g.compareTo(pq) < 0) {
                BigInteger p = g;
                BigInteger q2 = pq.divide(g);
                return p.compareTo(q2) < 0
                        ? new BigInteger[] { p, q2 }
                        : new BigInteger[] { q2, p };
            }
        }
    }
}
