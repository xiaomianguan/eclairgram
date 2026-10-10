package cc.wuersan008.eclairgram.mtproto;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

/**
 * 原生 MTProto 客户端：传输、DH 握手、加密消息与 RPC。
 *
 * 这是一个纯 Java（不依赖 Android）实现，既可以在桌面上先用 JDK 验证，
 * 也能直接编进 APK 在 Android 2.1–4.0 上运行。
 */
public final class MtpClient {

    /** 使用的 TL 层（与服务端协商的 schema 版本）。 */
    public static final int LAYER = 229;

    private final int apiId;
    private final String apiHash;

    private Transport transport;
    private MtpState plainState;   // 握手阶段（未加密）
    private MtpState state;        // 加密阶段
    private int dcId;

    private final List<byte[]> updates = new ArrayList<byte[]>();
    private boolean debug;

    public MtpClient(int apiId, String apiHash) {
        this.apiId = apiId;
        this.apiHash = apiHash;
    }

    public void setDebug(boolean d) {
        this.debug = d;
    }

    private void log(String s) {
        if (debug) System.out.println("[mtproto] " + s);
    }

    // ============================================================ 连接 & 握手
    public void connect(int dcId) throws IOException {
        DcKeys.Dc dc = DcKeys.dc(dcId);
        log("connect " + dc.ip + ":" + dc.port);
        transport = new Transport(dc.ip, dc.port, 15000);
        this.dcId = dcId;
        plainState = new MtpState(null);
    }

    /** 复用已持久化的 auth key 直接建立连接（跳过 DH 握手）。 */
    public void connectWithAuthKey(int dcId, byte[] authKey) throws IOException {
        DcKeys.Dc dc = DcKeys.dc(dcId);
        log("connect(with key) " + dc.ip + ":" + dc.port);
        transport = new Transport(dc.ip, dc.port, 15000);
        this.dcId = dcId;
        this.state = new MtpState(authKey);
    }

    /** 执行完整 DH 握手，成功后所有 RPC 都走加密通道。 */
    public byte[] doHandshake() throws IOException {
        // ---- 第 1 步：req_pq_multi ----
        byte[] nonce = Crypto.random(16);
        Tl.Writer w = new Tl.Writer();
        w.int32(TlSchema.REQ_PQ_MULTI).raw(nonce);
        byte[] resPQbytes = sendPlain(w.toByteArray());
        Tl.Reader r = new Tl.Reader(resPQbytes);
        int ctor = r.int32();
        if (ctor != TlSchema.RES_PQ) throw new IOException("expected resPQ, got 0x" + Integer.toHexString(ctor));
        TlSchema.ResPQ resPQ = TlSchema.parseResPQ(r);
        if (!eq(resPQ.nonce, nonce)) throw new IOException("resPQ nonce mismatch");

        // ---- 第 2 步：req_DH_params ----
        BigInteger pq = new BigInteger(1, resPQ.pq);
        BigInteger[] factors = TlSchema.factorize(pq);
        byte[] p = Crypto.bigEndianMinimal(factors[0]);
        byte[] q = Crypto.bigEndianMinimal(factors[1]);
        byte[] newNonce = Crypto.random(32);

        byte[] pqInner = buildPqInnerData(resPQ.pq, p, q, resPQ.nonce, resPQ.serverNonce, newNonce);

        DcKeys.Key key = null;
        long fp = 0;
        byte[] cipher = null;
        for (long f : resPQ.fingerprints) {
            if (debug) log("resPQ fingerprint 0x" + Long.toHexString(f));
        }
        for (long f : resPQ.fingerprints) {
            DcKeys.Key k = DcKeys.findByFingerprint(f, false);
            if (k != null) {
                key = k; fp = f; cipher = Crypto.rsaEncrypt(pqInner, k.modulus, k.exponent); break;
            }
        }
        if (key == null) {
            for (long f : resPQ.fingerprints) {
                DcKeys.Key k = DcKeys.findByFingerprint(f, true);
                if (k != null) {
                    key = k; fp = f; cipher = Crypto.rsaEncrypt(pqInner, k.modulus, k.exponent); break;
                }
            }
        }
        if (key == null) throw new IOException("no matching server public key");

        if (debug) {
            log("pq=" + hex(resPQ.pq) + " p=" + hex(p) + " q=" + hex(q));
            log("chosen fingerprint 0x" + Long.toHexString(fp) + " cipherLen=" + cipher.length);
        }

        Tl.Writer dw = new Tl.Writer();
        dw.int32(TlSchema.REQ_DH_PARAMS)
          .raw(resPQ.nonce).raw(resPQ.serverNonce)
          .bytes(p).bytes(q).int64(fp).bytes(cipher);
        byte[] ansBytes = sendPlain(dw.toByteArray());
        Tl.Reader ar = new Tl.Reader(ansBytes);
        int act = ar.int32();
        if (act == TlSchema.SERVER_DH_PARAMS_FAIL) {
            TlSchema.ServerDhParamsFail fail = TlSchema.parseServerDhParamsFail(ar);
            throw new IOException("server_DH_params_fail");
        }
        if (act != TlSchema.SERVER_DH_PARAMS_OK) throw new IOException("unexpected 0x" + Integer.toHexString(act));
        TlSchema.ServerDhParamsOk ok = TlSchema.parseServerDhParamsOk(ar);

        byte[][] keyIv = generateKeyData(resPQ.serverNonce, newNonce);
        byte[] plainAnswer = Crypto.igeDecrypt(ok.encryptedAnswer, keyIv[0], keyIv[1]);
        Tl.Reader dr = new Tl.Reader(plainAnswer);
        dr.raw(20); // sha1 校验和
        int innerCtor = dr.int32();
        if (innerCtor != 0xb5890dba) throw new IOException("expected server_DH_inner_data, got 0x" + Integer.toHexString(innerCtor));
        byte[] innerNonce = dr.int128();
        byte[] innerServerNonce = dr.int128();
        int g = dr.int32();
        byte[] dhPrimeB = dr.bytes();
        byte[] gAB = dr.bytes();
        dr.int32(); // server_time

        BigInteger dhPrime = new BigInteger(1, dhPrimeB);
        BigInteger gA = new BigInteger(1, gAB);
        BigInteger bigG = BigInteger.valueOf(g);

        byte[] bBytes = Crypto.random(256);
        BigInteger b = new BigInteger(1, bBytes);
        BigInteger gB = bigG.modPow(b, dhPrime);
        BigInteger gab = gA.modPow(b, dhPrime);

        byte[] clientDhInner = buildClientDhInnerData(resPQ.nonce, resPQ.serverNonce,
                Crypto.bigEndianMinimal(gB));
        byte[] hashed = Crypto.concat(Crypto.sha1(clientDhInner), clientDhInner);
        byte[] encrypted = Crypto.igeEncrypt(hashed, keyIv[0], keyIv[1]);

        Tl.Writer sw = new Tl.Writer();
        sw.int32(TlSchema.SET_CLIENT_DH_PARAMS)
          .raw(resPQ.nonce).raw(resPQ.serverNonce).bytes(encrypted);
        byte[] genBytes = sendPlain(sw.toByteArray());
        Tl.Reader gr = new Tl.Reader(genBytes);
        int gct = gr.int32();
        TlSchema.DhGen gen = TlSchema.parseDhGen(gct, gr);

        byte[] authKey = Crypto.bigEndianMinimal(gab);

        // 校验服务端返回的 new_nonce_hash
        int number = gct == TlSchema.DH_GEN_OK ? 1 : (gct == TlSchema.DH_GEN_RETRY ? 2 : 3);
        byte[] auxHash = Crypto.slice(Crypto.sha1(authKey), 0, 8);
        ByteArrayOutputStream hb = new ByteArrayOutputStream();
        hb.write(newNonce, 0, 32);
        hb.write(number);
        hb.write(auxHash, 0, 8);
        byte[] expect = Crypto.sha1(hb.toByteArray());
        if (!eq(Crypto.slice(expect, 4, 16), gen.newNonceHash)) {
            throw new IOException("new_nonce_hash mismatch");
        }
        if (gct != TlSchema.DH_GEN_OK) throw new IOException("dh_gen not ok");

        this.state = new MtpState(authKey);
        log("handshake complete, auth key id = " + state.keyId());
        return authKey;
    }

    // ============================================================ 明文收发
    private byte[] sendPlain(byte[] body) throws IOException {
        long msgId = plainState.newMsgId();
        Tl.Writer w = new Tl.Writer();
        w.int64(0).int64(msgId).int32(body.length).raw(body);
        transport.send(w.toByteArray());
        byte[] resp = transport.recv();
        Tl.Reader r = new Tl.Reader(resp);
        r.int64(); // auth_key_id (0)
        r.int64(); // msg_id
        int len = r.int32();
        return r.read(len);
    }

    // ============================================================ 加密收发
    /** 发送一条加密 RPC，等待并返回其结果对象的原始字节。 */
    public Object rpc(byte[] request) throws IOException {
        for (int attempt = 0; attempt < 5; attempt++) {
            long msgId = state.newMsgId();
            int seq = state.nextSeq(true);
            byte[] enc = state.encrypt(request, msgId, seq);
            transport.send(enc);

            long deadline = System.currentTimeMillis() + 20000;
            boolean resend = false;
            while (System.currentTimeMillis() < deadline) {
                byte[] raw = transport.recv();
                MtpState.Message msg = state.decrypt(raw);
                Object res = handleMessage(msg.body, msgId);
                if (res == NOSALT) { resend = true; break; }
                if (res != null) return res;
            }
            if (!resend) throw new IOException("rpc timeout");
            log("resending after bad_server_salt");
        }
        throw new IOException("rpc gave up after repeated bad_server_salt");
    }

    private static final Object NOSALT = new Object();

    /** 返回非 null 表示拿到了目标 RPC 的结果。 */
    private Object handleMessage(byte[] body, long wantReqMsgId) throws IOException {
        Tl.Reader r = new Tl.Reader(body);
        int ctor = r.int32();
        if (ctor == TlSchema.GZIP_PACKED) {
            byte[] packed = r.bytes();
            return handleMessage(gunzip(packed), wantReqMsgId);
        }
        switch (ctor) {
            case TlSchema.MSG_CONTAINER: {
                int n = r.int32();
                for (int i = 0; i < n; i++) {
                    r.int64();      // msg id
                    r.int32();      // seq
                    int len = r.int32();
                    byte[] inner = r.read(len);
                    Object res = handleMessage(inner, wantReqMsgId);
                    if (res != null) return res;
                }
                return null;
            }
            case TlSchema.RPC_RESULT: {
                long reqId = r.int64();
                int innerCtor = r.int32();
                if (innerCtor == TlSchema.RPC_ERROR) {
                    TlSchema.RpcError e = TlSchema.parseRpcError(r);
                    if (reqId == wantReqMsgId) {
                        throw new IOException("rpc error " + e.code + ": " + e.message);
                    }
                    return null;
                }
                byte[] inner;
                if (innerCtor == TlSchema.GZIP_PACKED) {
                    inner = gunzip(r.bytes());
                } else {
                    r.seek(r.position() - 4);
                    inner = r.readRemaining();
                }
                if (reqId == wantReqMsgId) return inner;
                return null;
            }
            case TlSchema.NEW_SESSION_CREATED: {
                TlSchema.NewSession ns = TlSchema.parseNewSession(r);
                state.salt = ns.serverSalt;
                log("new_session_created salt=" + ns.serverSalt);
                return null;
            }
            case TlSchema.BAD_SERVER_SALT: {
                TlSchema.BadSalt bs = TlSchema.parseBadSalt(r);
                state.salt = bs.newSalt;
                log("bad_server_salt -> " + bs.newSalt);
                return NOSALT;
            }
            case TlSchema.PONG:
                return null;
            case TlSchema.MSGS_ACK:
                return null;
            default:
                log("ignore message 0x" + Integer.toHexString(ctor));
                updates.add(body);
                return null;
        }
    }

    // ============================================================ 构造 TL 请求
    public static byte[] buildPqInnerData(byte[] pq, byte[] p, byte[] q,
                                          byte[] nonce, byte[] serverNonce, byte[] newNonce) {
        Tl.Writer w = new Tl.Writer();
        w.int32(0x83c95aec).bytes(pq).bytes(p).bytes(q)
         .raw(nonce).raw(serverNonce).raw(newNonce);
        return w.toByteArray();
    }

    public static byte[] buildClientDhInnerData(byte[] nonce, byte[] serverNonce, byte[] gB) {
        Tl.Writer w = new Tl.Writer();
        w.int32(0x6643b654).raw(nonce).raw(serverNonce).int64(0).bytes(gB);
        return w.toByteArray();
    }

    public static byte[][] generateKeyData(byte[] serverNonce, byte[] newNonce) {
        byte[] newServer = Crypto.concat(newNonce, serverNonce);
        byte[] serverNew = Crypto.concat(serverNonce, newNonce);
        byte[] newNew = Crypto.concat(newNonce, newNonce);
        byte[] hash1 = Crypto.sha1(newServer);
        byte[] hash2 = Crypto.sha1(serverNew);
        byte[] hash3 = Crypto.sha1(newNew);
        byte[] key = Crypto.concat(hash1, Crypto.slice(hash2, 0, 12));
        byte[] iv = Crypto.concat(Crypto.slice(hash2, 12, 8), hash3, Crypto.slice(newNonce, 0, 4));
        return new byte[][] { key, iv };
    }

    // ============================================================ API 请求封装
    public byte[] invokeWithLayer(int layer, byte[] query) {
        Tl.Writer w = new Tl.Writer();
        w.int32(TlSchema.INVOKE_WITH_LAYER).int32(layer).raw(query);
        return w.toByteArray();
    }

    public byte[] initConnection(byte[] query) {
        Tl.Writer w = new Tl.Writer();
        w.int32(TlSchema.INIT_CONNECTION)
         .int32(0)                      // flags
         .int32(apiId)
         .string("Eclairgram")
         .string("Android")
         .string("0.1")
         .string("en")
         .string("")                    // lang_pack
         .string("en")                  // lang_code
         .raw(query);
        return w.toByteArray();
    }

    public byte[] wrapped(byte[] query) {
        return invokeWithLayer(LAYER, initConnection(query));
    }

    // ============================================================ 登录 API
    /** auth.sendCode：请求给手机号发送验证码。 */
    public TlSchema.SentCode sendCode(String phone) throws IOException {
        Tl.Writer w = new Tl.Writer();
        w.int32(TlSchema.AUTH_SEND_CODE)
         .string(phone)
         .int32(apiId)
         .string(apiHash)
         .int32(TlSchema.CODE_SETTINGS).int32(0);
        byte[] res = (byte[]) rpc(wrapped(w.toByteArray()));
        Tl.Reader r = new Tl.Reader(res);
        int ctor = r.int32();
        if (ctor != TlSchema.AUTH_SENT_CODE) {
            throw new IOException("sendCode unexpected 0x" + Integer.toHexString(ctor));
        }
        return TlSchema.parseSentCode(r);
    }

    /** auth.signIn：用短信/App 里的验证码完成登录。 */
    public boolean signIn(String phone, String phoneCodeHash, String code) throws IOException {
        Tl.Writer w = new Tl.Writer();
        w.int32(TlSchema.AUTH_SIGN_IN)
         .int32(1)                      // flags: phone_code 存在
         .string(phone)
         .string(phoneCodeHash)
         .string(code);
        byte[] res = (byte[]) rpc(wrapped(w.toByteArray()));
        Tl.Reader r = new Tl.Reader(res);
        int ctor = r.int32();
        if (ctor == TlSchema.AUTH_AUTHORIZATION) return true;
        if (ctor == TlSchema.AUTH_AUTHORIZATION_SIGN_UP_REQUIRED) {
            throw new IOException("sign up required");
        }
        throw new IOException("signIn unexpected 0x" + Integer.toHexString(ctor));
    }

    public int apiId() {
        return apiId;
    }

    public String apiHash() {
        return apiHash;
    }

    public MtpState state() {
        return state;
    }

    public List<byte[]> drainUpdates() {
        List<byte[]> u = new ArrayList<byte[]>(updates);
        updates.clear();
        return u;
    }

    public boolean isConnected() {
        return transport != null && transport.isConnected();
    }

    public void close() {
        if (transport != null) transport.close();
    }

    private static boolean eq(byte[] a, byte[] b) {
        if (a == null || b == null || a.length != b.length) return false;
        for (int i = 0; i < a.length; i++) if (a[i] != b[i]) return false;
        return true;
    }

    private static String hex(byte[] b) {
        StringBuilder sb = new StringBuilder(b.length * 2);
        for (byte x : b) sb.append(String.format("%02x", x));
        return sb.toString();
    }

    static byte[] gunzip(byte[] in) throws IOException {
        java.io.ByteArrayInputStream bin = new java.io.ByteArrayInputStream(in);
        java.util.zip.GZIPInputStream gz = new java.util.zip.GZIPInputStream(bin);
        java.io.ByteArrayOutputStream out = new java.io.ByteArrayOutputStream();
        byte[] buf = new byte[8192];
        int n;
        while ((n = gz.read(buf)) > 0) out.write(buf, 0, n);
        gz.close();
        return out.toByteArray();
    }
}
