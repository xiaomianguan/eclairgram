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

        // 私钥指数 b：用 256 位而不是 2048 位。g^b 与 gA^b 两次模幂的开销随指数
        // 位数线性增长，在老 ARM 设备上这是登录慢的主因。安全性不受影响：2048 位
        // 素域上的离散对数本身只有 ~110 位强度，256 位指数（暴力 2^128）不是短板。
        byte[] bBytes = Crypto.random(32);
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
                Object res = handleMessage(msg.body, msgId, msg.msgId);
                if (res == NOSALT) { resend = true; break; }
                if (res != null) return res;
            }
            if (!resend) throw new IOException("rpc timeout");
            log("resending after bad_server_salt");
        }
        throw new IOException("rpc gave up after repeated bad_server_salt");
    }

    private static final Object NOSALT = new Object();

    /** 服务端要求把请求发到另一个数据中心（PHONE_MIGRATE_n / NETWORK_MIGRATE_n）。 */
    public static final class MigrateException extends IOException {
        public final int dc;

        public MigrateException(int dc) {
            super("MIGRATE_" + dc);
            this.dc = dc;
        }
    }

    /** 验证码正确，但账号开了两步验证：需要再提交密码（auth.checkPassword）。 */
    public static final class PasswordNeededException extends IOException {
        public PasswordNeededException() {
            super("SESSION_PASSWORD_NEEDED");
        }
    }

    /** 返回非 null 表示拿到了目标 RPC 的结果。 */
    private Object handleMessage(byte[] body, long wantReqMsgId, long envelopeMsgId)
            throws IOException {
        Tl.Reader r = new Tl.Reader(body);
        int ctor = r.int32();
        if (ctor == TlSchema.GZIP_PACKED) {
            byte[] packed = r.bytes();
            return handleMessage(gunzip(packed), wantReqMsgId, envelopeMsgId);
        }
        switch (ctor) {
            case TlSchema.MSG_CONTAINER: {
                int n = r.int32();
                for (int i = 0; i < n; i++) {
                    r.int64();      // msg id
                    r.int32();      // seq
                    int len = r.int32();
                    byte[] inner = r.read(len);
                    Object res = handleMessage(inner, wantReqMsgId, envelopeMsgId);
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
                        if (e.message != null && e.message.startsWith("PHONE_MIGRATE_")) {
                            int target = Integer.parseInt(
                                    e.message.substring("PHONE_MIGRATE_".length()));
                            throw new MigrateException(target);
                        }
                        if ("SESSION_PASSWORD_NEEDED".equals(e.message)) {
                            throw new PasswordNeededException();
                        }
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
            case TlSchema.BAD_MSG_NOTIFICATION: {
                long badId = r.int64();
                r.int32();   // bad_msg_seqno
                int code = r.int32();
                log("bad_msg_notification code=" + code);
                if (code == 16 || code == 17) {
                    // 设备时钟不准：用服务端消息的 msg_id 推算时间偏移
                    state.updateTimeOffset(envelopeMsgId);
                }
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

    // ============================================================ 业务 API
    public static byte[] inputPeerUser(long userId, long accessHash) {
        Tl.Writer w = new Tl.Writer();
        w.int32(TlSchema.INPUT_PEER_USER).int64(userId).int64(accessHash);
        return w.toByteArray();
    }

    public static byte[] inputPeerChat(long chatId) {
        Tl.Writer w = new Tl.Writer();
        w.int32(TlSchema.INPUT_PEER_CHAT).int64(chatId);
        return w.toByteArray();
    }

    public static byte[] inputPeerChannel(long channelId, long accessHash) {
        Tl.Writer w = new Tl.Writer();
        w.int32(TlSchema.INPUT_PEER_CHANNEL).int64(channelId).int64(accessHash);
        return w.toByteArray();
    }

    /** messages.getDialogs：拉取会话列表（返回原始 TlObject，由上层解读）。 */
    public TlObject getDialogs(int limit) throws IOException {
        return getDialogs(limit, 0);
    }

    /** messages.getDialogs：folderId=0 表示“全部”，其余为会话文件夹（folder_id 字段）。 */
    public TlObject getDialogs(int limit, int folderId) throws IOException {
        int flags = folderId != 0 ? (1 << 1) : 0;
        Tl.Writer w = new Tl.Writer();
        w.int32(TlSchema.MESSAGES_GET_DIALOGS)
         .int32(flags);                  // flags：bit1 = 有 folder_id
        if (folderId != 0) w.int32(folderId);
        w.int32(0)                       // offset_date
         .int32(0)                       // offset_id
         .int32(TlSchema.INPUT_PEER_EMPTY)
         .int32(limit)
         .int64(0);                      // hash
        byte[] res = (byte[]) rpc(wrapped(w.toByteArray()));
        return TlObject.read(new Tl.Reader(res));
    }

    /** messages.getDialogFilters：拉取账号配置的会话文件夹。 */
    public TlObject getDialogFilters() throws IOException {
        Tl.Writer w = new Tl.Writer();
        w.int32(TlSchema.MESSAGES_GET_DIALOG_FILTERS);
        byte[] res = (byte[]) rpc(wrapped(w.toByteArray()));
        return TlObject.read(new Tl.Reader(res));
    }

    /** messages.getHistory：某个 peer 的最近消息。 */
    public TlObject getHistory(byte[] inputPeer, int limit) throws IOException {
        Tl.Writer w = new Tl.Writer();
        w.int32(TlSchema.MESSAGES_GET_HISTORY);
        w.raw(inputPeer);
        w.int32(0)                       // offset_id
         .int32(0)                       // offset_date
         .int32(0)                       // add_offset
         .int32(limit)
         .int32(0)                       // max_id
         .int32(0)                       // min_id
         .int64(0);                      // hash
        byte[] res = (byte[]) rpc(wrapped(w.toByteArray()));
        return TlObject.read(new Tl.Reader(res));
    }

    /** messages.sendMessage：给某个 peer 发一条文本消息。 */
    public TlObject sendMessage(byte[] inputPeer, String text) throws IOException {
        Tl.Writer w = new Tl.Writer();
        w.int32(TlSchema.MESSAGES_SEND_MESSAGE)
         .int32(0);                      // flags
        w.raw(inputPeer);
        w.string(text)
         .int64(Crypto.longLE(Crypto.random(8), 0));   // random_id
        byte[] res = (byte[]) rpc(wrapped(w.toByteArray()));
        return TlObject.read(new Tl.Reader(res));
    }

    /** updates.getState：获取当前的 pts/qts/date/seq。 */
    public TlObject getState() throws IOException {
        Tl.Writer w = new Tl.Writer();
        w.int32(TlSchema.UPDATES_GET_STATE);
        byte[] res = (byte[]) rpc(wrapped(w.toByteArray()));
        return TlObject.read(new Tl.Reader(res));
    }

    /** updates.getDifference：拉取自 pts 以来的新消息与更新。 */
    public TlObject getDifference(int pts, int date, int qts) throws IOException {
        Tl.Writer w = new Tl.Writer();
        w.int32(TlSchema.UPDATES_GET_DIFFERENCE)
         .int32(0)          // flags
         .int32(pts)
         .int32(date)
         .int32(qts);
        byte[] res = (byte[]) rpc(wrapped(w.toByteArray()));
        return TlObject.read(new Tl.Reader(res));
    }

    /** 构建 inputPeerPhotoFileLocation（头像）。 */
    public static byte[] peerPhotoLocation(byte[] inputPeer, long photoId) {
        Tl.Writer lw = new Tl.Writer();
        lw.int32(0x37257e99).int32(0).raw(inputPeer).int64(photoId);
        return lw.toByteArray();
    }

    /** 构建 inputPhotoFileLocation（消息里的照片）。 */
    public static byte[] photoFileLocation(long id, long accessHash,
                                           byte[] fileReference, String thumbSize) {
        Tl.Writer w = new Tl.Writer();
        w.int32(TlSchema.INPUT_PHOTO_FILE_LOCATION).int64(id).int64(accessHash)
         .bytes(fileReference == null ? new byte[0] : fileReference)
         .string(thumbSize == null ? "" : thumbSize);
        return w.toByteArray();
    }

    /** 构建 inputDocumentFileLocation（消息里的文件/视频）。 */
    public static byte[] documentFileLocation(long id, long accessHash,
                                              byte[] fileReference, String thumbSize) {
        Tl.Writer w = new Tl.Writer();
        w.int32(TlSchema.INPUT_DOCUMENT_FILE_LOCATION).int64(id).int64(accessHash)
         .bytes(fileReference == null ? new byte[0] : fileReference)
         .string(thumbSize == null ? "" : thumbSize);
        return w.toByteArray();
    }

    /** upload.getFile：按 InputFileLocation 下载（失败时 FILE_MIGRATE 会抛出）。 */
    public byte[] downloadLocation(byte[] location) throws IOException {
        int limit = 256 * 1024;
        java.io.ByteArrayOutputStream out = new java.io.ByteArrayOutputStream(limit);
        long offset = 0;
        while (true) {
            Tl.Writer w = new Tl.Writer();
            w.int32(0xbe5335be)         // upload.getFile
             .int32(0)                  // flags
             .raw(location)
             .int64(offset)
             .int32(limit);
            byte[] res = (byte[]) rpc(wrapped(w.toByteArray()));
            TlObject f = TlObject.read(new Tl.Reader(res));
            if (!f.type().equals("upload.file")) break;
            Object b = f.get("bytes");
            if (!(b instanceof byte[])) break;
            byte[] chunk = (byte[]) b;
            if (chunk.length == 0) break;
            out.write(chunk, 0, chunk.length);
            if (chunk.length < limit) break;
            offset += chunk.length;
            if (offset > 16 * 1024 * 1024) break;
        }
        return out.toByteArray();
    }

    /** 下载某用户的头像（inputPeerPhotoFileLocation）。 */
    public byte[] downloadPeerPhoto(byte[] inputPeer, long photoId) throws IOException {
        try {
            return downloadLocation(peerPhotoLocation(inputPeer, photoId));
        } catch (IOException e) {
            if (String.valueOf(e.getMessage()).contains("FILE_MIGRATE")) throw e;
            return null;
        }
    }

    // ============================================================ 上传 / 发送媒体
    /** upload.saveFilePart：分片上传。 */
    public void saveFilePart(long fileId, int part, byte[] bytes) throws IOException {
        Tl.Writer w = new Tl.Writer();
        w.int32(TlSchema.UPLOAD_SAVE_FILE_PART).int64(fileId).int32(part).bytes(bytes);
        rpc(wrapped(w.toByteArray()));
    }

    /** 把一段字节作为图片上传并发送（返回 updates 对象）。 */
    public TlObject sendPhoto(byte[] inputPeer, byte[] data, String name,
                              String caption) throws IOException {
        byte[] inputFile = uploadInputFile(data, name);
        Tl.Writer mw = new Tl.Writer();
        mw.int32(TlSchema.INPUT_MEDIA_UPLOADED_PHOTO).int32(0).raw(inputFile);
        return sendMedia(inputPeer, mw.toByteArray(), caption);
    }

    /** 分片上传并返回 inputFile（sendPhoto / uploadProfilePhoto 复用）。 */
    private byte[] uploadInputFile(byte[] data, String name) throws IOException {
        long fileId = Crypto.longLE(Crypto.random(8), 0);
        int partSize = 256 * 1024;
        int parts = (data.length + partSize - 1) / partSize;
        if (parts == 0) parts = 1;
        for (int i = 0; i < parts; i++) {
            int off = i * partSize;
            int len = Math.min(partSize, data.length - off);
            byte[] chunk = new byte[len];
            System.arraycopy(data, off, chunk, 0, len);
            saveFilePart(fileId, i, chunk);
        }
        Tl.Writer fw = new Tl.Writer();
        fw.int32(TlSchema.INPUT_FILE).int64(fileId).int32(parts)
          .string(name == null ? "file.jpg" : name)
          .string(md5Hex(data));
        return fw.toByteArray();
    }

    public static byte[] inputPeerSelf() {
        Tl.Writer w = new Tl.Writer();
        w.int32(TlSchema.INPUT_PEER_SELF);
        return w.toByteArray();
    }

    public static byte[] inputUserSelf() {
        Tl.Writer w = new Tl.Writer();
        w.int32(TlSchema.INPUT_USER_SELF);
        return w.toByteArray();
    }

    /** users.getFullUser(self)：自己的完整资料（含 about / profile_photo）。 */
    public TlObject getFullUserSelf() throws IOException {
        Tl.Writer w = new Tl.Writer();
        w.int32(TlSchema.USERS_GET_FULL_USER).raw(inputUserSelf());
        byte[] res = (byte[]) rpc(wrapped(w.toByteArray()));
        return TlObject.read(new Tl.Reader(res));   // users.userFull
    }

    /** account.updateProfile：改名字/简介；传 null 的字段保持不变。 */
    public TlObject updateProfile(String firstName, String lastName, String about)
            throws IOException {
        int flags = 0;
        if (firstName != null) flags |= (1 << 0);
        if (lastName != null) flags |= (1 << 1);
        if (about != null) flags |= (1 << 2);
        Tl.Writer w = new Tl.Writer();
        w.int32(TlSchema.ACCOUNT_UPDATE_PROFILE).int32(flags);
        if (firstName != null) w.string(firstName);
        if (lastName != null) w.string(lastName);
        if (about != null) w.string(about);
        byte[] res = (byte[]) rpc(wrapped(w.toByteArray()));
        return TlObject.read(new Tl.Reader(res));   // User
    }

    /** photos.uploadProfilePhoto：上传并设置为头像。 */
    public TlObject uploadProfilePhoto(byte[] data, String name) throws IOException {
        byte[] inputFile = uploadInputFile(data, name == null ? "profile.jpg" : name);
        Tl.Writer w = new Tl.Writer();
        w.int32(TlSchema.PHOTOS_UPLOAD_PROFILE_PHOTO).int32(1 << 0).raw(inputFile);
        byte[] res = (byte[]) rpc(wrapped(w.toByteArray()));
        return TlObject.read(new Tl.Reader(res));   // photos.photo
    }

    /** messages.sendMedia。 */
    public TlObject sendMedia(byte[] inputPeer, byte[] media, String caption) throws IOException {
        Tl.Writer w = new Tl.Writer();
        w.int32(TlSchema.MESSAGES_SEND_MEDIA)
         .int32(0);                     // flags
        w.raw(inputPeer);
        w.raw(media);
        w.string(caption == null ? "" : caption)
         .int64(Crypto.longLE(Crypto.random(8), 0));
        byte[] res = (byte[]) rpc(wrapped(w.toByteArray()));
        return TlObject.read(new Tl.Reader(res));
    }

    // ============================================================ 贴纸
    /** messages.getAllStickers：账号已安装的贴纸包（只含元数据）。 */
    public TlObject getAllStickers() throws IOException {
        Tl.Writer w = new Tl.Writer();
        w.int32(TlSchema.MESSAGES_GET_ALL_STICKERS).int64(0);
        byte[] res = (byte[]) rpc(wrapped(w.toByteArray()));
        return TlObject.read(new Tl.Reader(res));
    }

    /** messages.getStickerSet：某个贴纸包的文档列表。 */
    public TlObject getStickerSet(long setId, long accessHash) throws IOException {
        Tl.Writer iw = new Tl.Writer();
        iw.int32(TlSchema.INPUT_STICKER_SET_ID).int64(setId).int64(accessHash);
        Tl.Writer w = new Tl.Writer();
        w.int32(TlSchema.MESSAGES_GET_STICKER_SET).raw(iw.toByteArray()).int32(0);
        byte[] res = (byte[]) rpc(wrapped(w.toByteArray()));
        return TlObject.read(new Tl.Reader(res));
    }

    /** 发送一张贴纸（messages.sendMedia + inputMediaDocument）。 */
    public TlObject sendSticker(byte[] inputPeer, long docId, long accessHash, byte[] fileRef)
            throws IOException {
        Tl.Writer iw = new Tl.Writer();
        iw.int32(TlSchema.INPUT_DOCUMENT).int64(docId).int64(accessHash)
          .bytes(fileRef == null ? new byte[0] : fileRef);
        Tl.Writer mw = new Tl.Writer();
        mw.int32(TlSchema.INPUT_MEDIA_DOCUMENT).int32(0).raw(iw.toByteArray());
        return sendMedia(inputPeer, mw.toByteArray(), "");
    }

    private static String md5Hex(byte[] data) {
        try {
            java.security.MessageDigest md = java.security.MessageDigest.getInstance("MD5");
            byte[] d = md.digest(data);
            StringBuilder sb = new StringBuilder();
            for (byte x : d) sb.append(String.format("%02x", x));
            return sb.toString();
        } catch (Exception e) {
            return "";
        }
    }

    /** auth.exportedAuthorization 的内容。 */
    public static final class AuthExport {
        public long id;
        public byte[] bytes;
    }

    /** auth.exportAuthorization：把登录态导出到另一个数据中心。 */
    public AuthExport exportAuthorization(int dcId) throws IOException {
        Tl.Writer w = new Tl.Writer();
        w.int32(TlSchema.AUTH_EXPORT_AUTHORIZATION).int32(dcId);
        byte[] res = (byte[]) rpc(wrapped(w.toByteArray()));
        TlObject o = TlObject.read(new Tl.Reader(res));
        AuthExport a = new AuthExport();
        a.id = o.i64("id");
        Object b = o.get("bytes");
        a.bytes = (b instanceof byte[]) ? (byte[]) b : new byte[0];
        return a;
    }

    /** auth.importAuthorization：在另一个数据中心导入登录态。 */
    public void importAuthorization(long id, byte[] bytes) throws IOException {
        Tl.Writer w = new Tl.Writer();
        w.int32(TlSchema.AUTH_IMPORT_AUTHORIZATION).int64(id).bytes(bytes);
        rpc(wrapped(w.toByteArray()));
    }

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

    /** account.getPassword：取两步验证的 SRP 参数与 KDF 算法。 */
    public TlObject getPassword() throws IOException {
        Tl.Writer w = new Tl.Writer();
        w.int32(TlSchema.ACCOUNT_GET_PASSWORD);
        byte[] res = (byte[]) rpc(wrapped(w.toByteArray()));
        return TlObject.read(new Tl.Reader(res));
    }

    /** auth.checkPassword：提交 SRP 结果；成功时返回 auth.authorization。 */
    public boolean checkPassword(long srpId, byte[] a, byte[] m1) throws IOException {
        Tl.Writer pw = new Tl.Writer();
        pw.int32(TlSchema.INPUT_CHECK_PASSWORD_SRP).int64(srpId).bytes(a).bytes(m1);
        Tl.Writer w = new Tl.Writer();
        w.int32(TlSchema.AUTH_CHECK_PASSWORD).raw(pw.toByteArray());
        byte[] res = (byte[]) rpc(wrapped(w.toByteArray()));
        Tl.Reader r = new Tl.Reader(res);
        return r.int32() == TlSchema.AUTH_AUTHORIZATION;
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
