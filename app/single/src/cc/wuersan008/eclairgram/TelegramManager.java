package cc.wuersan008.eclairgram;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import cc.wuersan008.eclairgram.mtproto.MtpClient;
import cc.wuersan008.eclairgram.mtproto.Srp;
import cc.wuersan008.eclairgram.mtproto.TlObject;
import cc.wuersan008.eclairgram.mtproto.TlSchema;

/**
 * 应用侧的 Telegram 会话管理：连接、登录、持久化 auth key。
 *
 * 纯网络工作在后台线程完成，结果通过 Handler 回到主线程。
 * MTProto 客户端本身（{@link cc.wuersan008.eclairgram.mtproto}）不依赖 Android。
 */
public final class TelegramManager {

    public interface Callback {
        void onDone(boolean ok, String message);
    }

    private static final String TAG = "EclairgramTg";
    private static final String PREFS = "eclairgram_tg";
    private static final String KEY_AUTH = "auth_key";
    private static final String KEY_AUTHORIZED = "authorized";
    private static final String KEY_DC = "dc";
    private static final String KEY_PHONE = "phone";
    private static final String KEY_API_ID = "api_id";
    private static final String KEY_API_HASH = "api_hash";
    private static final int DEFAULT_DC = 2;

    private static TelegramManager sInstance;

    private final Context mApp;
    private final Handler mMain = new Handler(Looper.getMainLooper());

    private MtpClient mClient;
    private int mDc = DEFAULT_DC;
    private String mPhoneCodeHash;
    private byte[] mAuthKey;
    // 两步验证（2FA）：验证码通过但账号有密码时置位，等待 checkPassword
    private boolean mPasswordNeeded;
    private String mPasswordHint;
    // 是否已完成 auth.signIn（授权登录）。注意：DH 握手也会生成 auth key，
    // 所以“有 key”不等于“已登录”，否则请求验证码后就会被当成已登录。
    private boolean mAuthorized;
    private final Object mNet = new Object();
    // 文件下载（头像/媒体）走独立的连接池（见 mDlLock/mDlMain/mDlFile）：老设备上跨 DC
    // 建连要跑一次 DH 握手（秒级），绝不能让它阻塞交互请求，也要能并发下载多个头像。

    private TelegramManager(Context ctx) {
        mApp = ctx.getApplicationContext();
        for (int i = 0; i < DL_SLOTS; i++) mDlLock[i] = new Object();
        load();
    }

    public static synchronized TelegramManager get(Context ctx) {
        if (sInstance == null) sInstance = new TelegramManager(ctx);
        return sInstance;
    }

    // ============================================================ 持久化
    private void load() {
        SharedPreferences sp = mApp.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        mDc = sp.getInt(KEY_DC, DEFAULT_DC);
        String hex = sp.getString(KEY_AUTH, null);
        if (hex != null && hex.length() > 0) {
            mAuthKey = fromHex(hex);
        }
        // 旧版本只存了 auth key；升级后没有该标记时，按“有 key 即已登录”迁移。
        mAuthorized = sp.getBoolean(KEY_AUTHORIZED, mAuthKey != null);
    }

    private void save() {
        SharedPreferences.Editor e = mApp.getSharedPreferences(PREFS, Context.MODE_PRIVATE).edit();
        e.putInt(KEY_DC, mDc);
        e.putBoolean(KEY_AUTHORIZED, mAuthorized);
        if (mAuthKey != null) e.putString(KEY_AUTH, toHex(mAuthKey));
        e.commit();
    }

    public boolean isSignedIn() {
        return mAuthorized && mAuthKey != null;
    }

    // ---- 自带 API 凭据（BYOK）：生产版不带 key，由用户填写 ----
    public int apiId() {
        return mApp.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                .getInt(KEY_API_ID, BuildSecrets.API_ID);
    }

    public String apiHash() {
        String h = mApp.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                .getString(KEY_API_HASH, null);
        if (h == null || h.length() == 0) return BuildSecrets.API_HASH;
        return h;
    }

    public void setApiCredentials(int id, String hash) {
        mApp.getSharedPreferences(PREFS, Context.MODE_PRIVATE).edit()
                .putInt(KEY_API_ID, id)
                .putString(KEY_API_HASH, hash == null ? "" : hash.trim())
                .commit();
    }

    public boolean hasApiCredentials() {
        return apiId() != 0 && apiHash() != null && apiHash().length() > 0
                && !"PLACEHOLDER".equals(apiHash());
    }

    public String phone() {
        return mApp.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                .getString(KEY_PHONE, "");
    }

    private void setPhone(String p) {
        mApp.getSharedPreferences(PREFS, Context.MODE_PRIVATE).edit()
                .putString(KEY_PHONE, p).commit();
    }

    // ============================================================ 连接
    private boolean ensureConnected() throws Exception {
        if (mClient != null && mClient.isConnected()) return true;
        mClient = new MtpClient(apiId(), apiHash());
        if (mAuthKey != null) {
            mClient.connectWithAuthKey(mDc, mAuthKey);
        } else {
            mClient.connect(mDc);
            mAuthKey = mClient.doHandshake();
            save();
        }
        return true;
    }

    // ============================================================ 登录
    public void sendCode(final String phone, final Callback cb) {
        setPhone(phone);
        new Thread(new Runnable() {
            public void run() {
                try {
                    TlSchema.SentCode sent = sendCodeWithMigrate(phone);
                    mPhoneCodeHash = sent.phoneCodeHash;
                    post(cb, true, "code-sent");
                } catch (final Throwable t) {
                    Log.e(TAG, "sendCode failed", t);
                    post(cb, false, String.valueOf(t.getMessage()));
                }
            }
        }).start();
    }

    /** 处理 PHONE_MIGRATE_n：把账号所在的 DC 记下来，换 DC 重试一次。 */
    private TlSchema.SentCode sendCodeWithMigrate(String phone) throws Exception {
        ensureConnected();
        try {
            return mClient.sendCode(phone);
        } catch (MtpClient.MigrateException me) {
            Log.i(TAG, "phone migrate -> DC" + me.dc);
            mDc = me.dc;
            mAuthKey = null;
            if (mClient != null) {
                mClient.close();
                mClient = null;
            }
            closeAuxClients();
            save();
            ensureConnected();
            return mClient.sendCode(phone);
        }
    }

    public void signIn(final String phone, final String code, final Callback cb) {
        new Thread(new Runnable() {
            public void run() {
                try {
                    ensureConnected();
                    if (mPhoneCodeHash == null) throw new IllegalStateException("no phone_code_hash");
                    boolean ok = mClient.signIn(phone, mPhoneCodeHash, code);
                    if (ok) {
                        mAuthorized = true;
                        mPasswordNeeded = false;
                        save();
                    }
                    post(cb, ok, ok ? "signed-in" : "failed");
                } catch (MtpClient.PasswordNeededException pn) {
                    // 验证码正确，但账号开了两步验证：接下来要提交密码
                    mPasswordNeeded = true;
                    fetchPasswordHint();
                    post(cb, false, "password-needed");
                } catch (final Throwable t) {
                    Log.e(TAG, "signIn failed", t);
                    post(cb, false, String.valueOf(t.getMessage()));
                }
            }
        }).start();
    }

    public boolean isPasswordNeeded() {
        return mPasswordNeeded;
    }

    public String passwordHint() {
        return mPasswordHint;
    }

    /** best-effort 取 2FA 的提示语（失败无所谓）。 */
    private void fetchPasswordHint() {
        try {
            String hint = mClient.getPassword().str("hint");
            if (hint != null && hint.length() > 0) mPasswordHint = hint;
        } catch (Throwable t) {
            Log.w(TAG, "getPassword hint failed: " + t);
        }
    }

    /** 提交两步验证密码；成功后即完成登录。 */
    public void checkPassword(final String password, final Callback cb) {
        new Thread(new Runnable() {
            public void run() {
                try {
                    synchronized (mNet) {
                        ensureConnected();
                        TlObject pw = mClient.getPassword();
                        TlObject algo = pw.obj("current_algo");
                        if (algo == null || !algo.type().equals(
                                "passwordKdfAlgoSHA256SHA256PBKDF2HMACSHA512iter100000SHA256ModPow")) {
                            throw new IllegalStateException("unsupported password algo");
                        }
                        String hint = pw.str("hint");
                        if (hint != null && hint.length() > 0) mPasswordHint = hint;

                        Srp.Check c = Srp.compute(
                                asBytes(algo.get("salt1")), asBytes(algo.get("salt2")),
                                algo.i32("g"), asBytes(algo.get("p")),
                                asBytes(pw.get("srp_B")), password);
                        boolean ok = mClient.checkPassword(pw.i64("srp_id"), c.A, c.M1);
                        if (ok) {
                            mAuthorized = true;
                            mPasswordNeeded = false;
                            save();
                        }
                        post(cb, ok, ok ? "signed-in" : "failed");
                    }
                } catch (final Throwable t) {
                    Log.e(TAG, "checkPassword failed", t);
                    post(cb, false, String.valueOf(t.getMessage()));
                }
            }
        }).start();
    }

    private static byte[] asBytes(Object o) {
        return (o instanceof byte[]) ? (byte[]) o : new byte[0];
    }

    public void logout() {
        mAuthKey = null;
        mAuthorized = false;
        mPhoneCodeHash = null;
        if (mClient != null) {
            mClient.close();
            mClient = null;
        }
        closeAuxClients();
        mApp.getSharedPreferences(PREFS, Context.MODE_PRIVATE).edit().clear().commit();
    }

    private void post(final Callback cb, final boolean ok, final String msg) {
        mMain.post(new Runnable() {
            public void run() {
                cb.onDone(ok, msg);
            }
        });
    }

    // ============================================================ 实时更新
    /** 有新消息/更新时回调（在后台线程调用）。 */
    public interface Listener {
        void onUpdate();
    }

    private final java.util.concurrent.CopyOnWriteArrayList<Listener> mListeners =
            new java.util.concurrent.CopyOnWriteArrayList<Listener>();
    private volatile boolean mUpdatesRunning = false;
    private int mPts, mQts, mDate;
    private boolean mUpdatesInit = false;

    public void addListener(Listener l) {
        if (!mListeners.contains(l)) mListeners.add(l);
        if (!mUpdatesRunning && isSignedIn()) startUpdates();
    }

    public void removeListener(Listener l) {
        mListeners.remove(l);
    }

    private void notifyListeners() {
        for (Listener l : mListeners) {
            try {
                l.onUpdate();
            } catch (Throwable ignored) {
            }
        }
    }

    private void startUpdates() {
        mUpdatesRunning = true;
        new Thread(new Runnable() {
            public void run() {
                updateLoop();
            }
        }).start();
    }

    /** 确保更新循环在跑（供常驻服务调用，让应用退到后台后仍能收新消息并弹通知）。 */
    public void keepUpdating() {
        if (isSignedIn() && !mUpdatesRunning) startUpdates();
    }

    private void updateLoop() {
        while (true) {
            try {
                boolean changed = false;
                TlObject diffForNotify = null;
                java.util.List<Object> msgsForNotify = null;
                synchronized (mNet) {
                    ensureConnected();
                    if (!mUpdatesInit) {
                        TlObject st = mClient.getState();
                        mPts = st.i32("pts");
                        mQts = st.i32("qts");
                        mDate = st.i32("date");
                        mUpdatesInit = true;
                    }
                    TlObject diff = mClient.getDifference(mPts, mDate, mQts);
                    String t = diff.type();
                    if (t.equals("updates.difference") || t.equals("updates.differenceSlice")) {
                        TlObject st = diff.obj(t.equals("updates.difference")
                                ? "state" : "intermediate_state");
                        if (st != null) {
                            mPts = st.i32("pts");
                            mQts = st.i32("qts");
                            mDate = st.i32("date");
                        }
                        java.util.List<Object> nm = diff.list("new_messages");
                        if (nm != null && !nm.isEmpty()) {
                            changed = true;
                            diffForNotify = diff;
                            msgsForNotify = nm;
                        }
                    } else if (t.equals("updates.differenceEmpty")) {
                        mDate = diff.i32("date");
                    } else if (t.equals("updates.differenceTooLong")) {
                        mUpdatesInit = false;
                    }
                }
                if (diffForNotify != null) {
                    try {
                        handleNewMessages(diffForNotify, msgsForNotify);
                    } catch (Throwable ignored) {
                    }
                }
                if (changed) notifyListeners();
            } catch (Throwable e) {
                Log.w(TAG, "update loop: " + e);
                mUpdatesInit = false;
                resetClient();
                sleepQuiet(3000);
            }
            maybeGc();
            sleepQuiet(4000);
        }
    }

    /** 老设备堆很小（16MB）：堆已提交得接近上限时主动回收一次，避免分配时直接 OOM 崩溃。 */
    private void maybeGc() {
        try {
            Runtime rt = Runtime.getRuntime();
            long max = rt.maxMemory();
            if (max > 0 && rt.totalMemory() > max * 2 / 3) System.gc();
        } catch (Throwable ignored) {
        }
    }

    // ============================================================ 新消息通知
    private volatile byte[] mActivePeer;

    /** 正在查看的会话（{@link ChatActivity} 设置），用来避免给当前会话弹通知。 */
    public void setActivePeer(byte[] peer) {
        mActivePeer = peer;
    }

    private static String nameOf(TlObject u) {
        String n = u.str("first_name");
        if (n == null) n = "";
        String ln = u.str("last_name");
        if (ln != null && ln.length() > 0) n = n.length() > 0 ? n + " " + ln : ln;
        if (n.length() == 0) {
            String un = u.str("username");
            n = un == null ? "" : ("@" + un);
        }
        return n;
    }

    /** 从 difference 自带的 users/chats 解析出新消息所属会话的信息，弹通知。 */
    private void handleNewMessages(TlObject diff, java.util.List<Object> msgs) {
        if (!AppPrefs.notificationsEnabled(mApp)) return;
        if (msgs == null || msgs.isEmpty()) return;

        java.util.Map<Long, String> unames = new java.util.HashMap<Long, String>();
        java.util.Map<Long, Long> uaccess = new java.util.HashMap<Long, Long>();
        java.util.Map<Long, Long> uphotos = new java.util.HashMap<Long, Long>();
        java.util.Map<Long, String> uuser = new java.util.HashMap<Long, String>();
        long selfId = 0;
        java.util.List<Object> users = diff.list("users");
        if (users != null) {
            for (Object o : users) {
                TlObject u = (TlObject) o;
                long uid = u.i64("id");
                if (u.bool("self")) selfId = uid;
                unames.put(Long.valueOf(uid), nameOf(u));
                uaccess.put(Long.valueOf(uid), Long.valueOf(u.i64("access_hash")));
                String un = u.str("username");
                if (un != null && un.length() > 0) uuser.put(Long.valueOf(uid), un);
                TlObject ph = u.obj("photo");
                if (ph != null && ph.type().equals("userProfilePhoto")) {
                    uphotos.put(Long.valueOf(uid), Long.valueOf(ph.i64("photo_id")));
                }
            }
        }

        java.util.Map<Long, String> cnames = new java.util.HashMap<Long, String>();
        java.util.Map<Long, Long> caccess = new java.util.HashMap<Long, Long>();
        java.util.Map<Long, Long> cphotos = new java.util.HashMap<Long, Long>();
        java.util.Map<Long, Integer> cparts = new java.util.HashMap<Long, Integer>();
        java.util.List<Object> chats = diff.list("chats");
        if (chats != null) {
            for (Object o : chats) {
                TlObject c = (TlObject) o;
                long cid = c.i64("id");
                cnames.put(Long.valueOf(cid), c.str("title"));
                TlObject cp = c.obj("photo");
                if (cp != null && cp.type().equals("chatPhoto")) {
                    cphotos.put(Long.valueOf(cid), Long.valueOf(cp.i64("photo_id")));
                }
                if (c.type().equals("channel")) {
                    caccess.put(Long.valueOf(cid), Long.valueOf(c.i64("access_hash")));
                    cparts.put(Long.valueOf(cid), Integer.valueOf(c.i32("participants_count")));
                }
            }
        }

        for (Object o : msgs) {
            TlObject m = (TlObject) o;
            if (!m.type().equals("message")) continue;
            if (m.bool("out")) continue;                 // 自己发的不用通知
            TlObject peer = m.obj("peer_id");
            if (peer == null) continue;

            byte[] peerBytes;
            String title;
            String username = null;
            long photoId = 0;
            long peerId;
            int type;
            int participants = 0;

            String t = peer.type();
            if (t.equals("peerUser")) {
                long uid = peer.i64("user_id");
                if (uid == selfId) continue;             // “收藏夹”不通知
                Long ah = uaccess.get(Long.valueOf(uid));
                peerBytes = MtpClient.inputPeerUser(uid, ah == null ? 0L : ah.longValue());
                title = unames.get(Long.valueOf(uid));
                username = uuser.get(Long.valueOf(uid));
                Long pid = uphotos.get(Long.valueOf(uid));
                photoId = pid == null ? 0L : pid.longValue();
                peerId = uid;
                type = 0;
            } else if (t.equals("peerChat")) {
                long cid = peer.i64("chat_id");
                peerBytes = MtpClient.inputPeerChat(cid);
                title = cnames.get(Long.valueOf(cid));
                Long pid = cphotos.get(Long.valueOf(cid));
                photoId = pid == null ? 0L : pid.longValue();
                peerId = cid;
                type = 1;
            } else if (t.equals("peerChannel")) {
                long cid = peer.i64("channel_id");
                Long ah = caccess.get(Long.valueOf(cid));
                peerBytes = MtpClient.inputPeerChannel(cid, ah == null ? 0L : ah.longValue());
                title = cnames.get(Long.valueOf(cid));
                Long pid = cphotos.get(Long.valueOf(cid));
                photoId = pid == null ? 0L : pid.longValue();
                Integer pc = cparts.get(Long.valueOf(cid));
                participants = pc == null ? 0 : pc.intValue();
                peerId = cid;
                type = 2;
            } else {
                continue;
            }

            if (title == null || title.length() == 0) title = mApp.getString(R.string.ec_app_name);

            String text = m.str("message");
            if (text == null || text.length() == 0) {
                TlObject media = m.obj("media");
                String mt = media == null ? "" : media.type();
                text = mt.equals("messageMediaPhoto")
                        ? mApp.getString(R.string.ec_media_photo)
                        : mt.equals("messageMediaDocument")
                            ? mApp.getString(R.string.ec_media_video)
                            : mApp.getString(R.string.ec_notif_new);
            } else if (type == 1 || type == 2) {
                // 群组/频道里带上发送者名字
                TlObject from = m.obj("from_id");
                if (from != null && from.type().equals("peerUser")) {
                    String sn = unames.get(Long.valueOf(from.i64("user_id")));
                    if (sn != null && sn.length() > 0) text = sn + ": " + text;
                }
            }

            if (mActivePeer != null && java.util.Arrays.equals(mActivePeer, peerBytes)) continue;
            Notifications.message(mApp, peerBytes, title, text, photoId, type, username,
                    peerId, participants);
        }
    }

    /** 连接被对端关闭时 isConnected() 仍可能为 true：出错后重建主连接。 */
    private void resetClient() {
        synchronized (mNet) {
            if (mClient != null) {
                mClient.close();
                mClient = null;
            }
        }
    }

    private static void sleepQuiet(long ms) {
        try {
            Thread.sleep(ms);
        } catch (InterruptedException ignored) {
        }
    }

    // ============================================================ 同步接口（供界面线程池调用）
    public TlObject syncGetDialogs(int limit) throws Exception {
        synchronized (mNet) {
            ensureConnected();
            return mClient.getDialogs(limit);
        }
    }

    public TlObject syncGetDialogs(int limit, int folderId) throws Exception {
        synchronized (mNet) {
            ensureConnected();
            return mClient.getDialogs(limit, folderId);
        }
    }

    public TlObject syncGetDialogFilters() throws Exception {
        synchronized (mNet) {
            ensureConnected();
            return mClient.getDialogFilters();
        }
    }

    public TlObject syncGetFullUserSelf() throws Exception {
        synchronized (mNet) {
            ensureConnected();
            return mClient.getFullUserSelf();
        }
    }

    public TlObject syncUpdateProfile(String firstName, String lastName, String about)
            throws Exception {
        synchronized (mNet) {
            ensureConnected();
            return mClient.updateProfile(firstName, lastName, about);
        }
    }

    public TlObject syncUploadProfilePhoto(byte[] data, String name) throws Exception {
        synchronized (mNet) {
            ensureConnected();
            return mClient.uploadProfilePhoto(data, name);
        }
    }

    public TlObject syncGetHistory(byte[] inputPeer, int limit) throws Exception {
        synchronized (mNet) {
            ensureConnected();
            return mClient.getHistory(inputPeer, limit);
        }
    }

    public void syncSendMessage(byte[] inputPeer, String text) throws Exception {
        synchronized (mNet) {
            ensureConnected();
            mClient.sendMessage(inputPeer, text);
        }
    }

    public byte[] syncDownloadPeerPhoto(byte[] inputPeer, long photoId, int dcId) throws Exception {
        int slot = dlSlot();
        synchronized (mDlLock[slot]) {
            return downloadLocation(slot, dcId, MtpClient.peerPhotoLocation(inputPeer, photoId));
        }
    }

    /** 按 InputFileLocation 下载消息里的媒体。 */
    public byte[] syncDownloadLocation(byte[] location) throws Exception {
        return syncDownloadLocation(location, 0);
    }

    /** 同上，但已知文件所在 DC（dcId>0）时直接连过去，省掉一次 FILE_MIGRATE 往返。 */
    public byte[] syncDownloadLocation(byte[] location, int dcId) throws Exception {
        int slot = dlSlot();
        synchronized (mDlLock[slot]) {
            return downloadLocation(slot, dcId, location);
        }
    }

    /** 取一个下载 slot（轮流使用，允许并发下载）。 */
    private int dlSlot() {
        int s = mDlNext.getAndIncrement() % DL_SLOTS;
        return s < 0 ? -s : s;
    }

    /** 下载一个 InputFileLocation。dcId>0 时直接连该文件 DC（省一次 FILE_MIGRATE 往返）；
     *  否则先在主 DC 的专属连接上试，再按 FILE_MIGRATE 迁移。 */
    private byte[] downloadLocation(int slot, int dcId, byte[] location) throws Exception {
        if (dcId > 0 && dcId != mDc) {
            return downloadFromFileDc(slot, dcId, location, 0);
        }
        MtpClient dc = fileDownloadClient(slot);
        if (dc == null) return null;
        try {
            return dc.downloadLocation(location);
        } catch (java.io.IOException e) {
            int target = parseMigrate(e.getMessage(), "FILE_MIGRATE_");
            if (target <= 0) return null;
            return downloadFromFileDc(slot, target, location, 0);
        }
    }

    /** 在文件 DC 上下载。只在确认是 auth 问题时才丢弃持久化的 key，
     *  避免网络抖动导致反复重新握手（那会在老设备上又慢又容易失败）。 */
    private byte[] downloadFromFileDc(int slot, int dc, byte[] location, int depth) throws Exception {
        if (depth > 2) return null;
        MtpClient fc = fileClient(slot, dc);
        if (fc == null) return null;
        boolean reused = mDlReused.containsKey(slot + ":" + dc);
        try {
            byte[] r = fc.downloadLocation(location);
            if (r != null) return r;
            if (reused) {
                dropFileClient(slot, dc);   // 连接可能已坏：重连（保留 key）
                return downloadFromFileDc(slot, dc, location, depth + 1);
            }
            return null;
        } catch (java.io.IOException e) {
            String msg = String.valueOf(e.getMessage());
            int target = parseMigrate(msg, "FILE_MIGRATE_");
            if (target > 0) {
                // 连接本身没问题，只是文件在别的 DC：直接去那边下
                return downloadFromFileDc(slot, target, location, depth + 1);
            }
            if (msg.contains("AUTH_KEY") || msg.contains("AUTH_BYTES")) {
                invalidateFileKey(dc);      // key 真的失效了才丢弃
            }
            dropFileClient(slot, dc);
            return null;
        } catch (Throwable t) {
            dropFileClient(slot, dc);
            return null;
        }
    }

    /** 丢掉某个 slot 的文件 DC 连接（保留持久化的 auth key，下次重连复用）。 */
    private void dropFileClient(int slot, int dc) {
        MtpClient c = mDlFile.remove(slot + ":" + dc);
        if (c != null) {
            try { c.close(); } catch (Throwable ignored) {}
        }
        mDlReused.remove(slot + ":" + dc);
    }

    /** 删除某个 DC 的持久化 auth key。 */
    private void invalidateFileKey(int dc) {
        mApp.getSharedPreferences(PREFS, Context.MODE_PRIVATE).edit()
                .remove(fileKeyPref(dc)).commit();
    }

    /** 上传并发送一张图片。 */
    public void syncSendPhoto(byte[] inputPeer, byte[] data, String name, String caption)
            throws Exception {
        synchronized (mNet) {
            ensureConnected();
            mClient.sendPhoto(inputPeer, data, name, caption);
        }
    }

    public TlObject syncGetAllStickers() throws Exception {
        synchronized (mNet) {
            ensureConnected();
            return mClient.getAllStickers();
        }
    }

    public TlObject syncGetStickerSet(long setId, long accessHash) throws Exception {
        synchronized (mNet) {
            ensureConnected();
            return mClient.getStickerSet(setId, accessHash);
        }
    }

    public TlObject syncGetRecentStickers() throws Exception {
        synchronized (mNet) {
            ensureConnected();
            return mClient.getRecentStickers();
        }
    }

    public void syncSendSticker(byte[] inputPeer, long docId, long accessHash, byte[] fileRef)
            throws Exception {
        synchronized (mNet) {
            ensureConnected();
            mClient.sendSticker(inputPeer, docId, accessHash, fileRef);
        }
    }

    private static final int DL_SLOTS = 3;
    private final Object[] mDlLock = new Object[DL_SLOTS];
    private final MtpClient[] mDlMain = new MtpClient[DL_SLOTS];
    private final java.util.concurrent.ConcurrentHashMap<String, MtpClient> mDlFile =
            new java.util.concurrent.ConcurrentHashMap<String, MtpClient>();
    private final java.util.concurrent.ConcurrentHashMap<String, Boolean> mDlReused =
            new java.util.concurrent.ConcurrentHashMap<String, Boolean>();
    private final java.util.concurrent.atomic.AtomicInteger mDlNext =
            new java.util.concurrent.atomic.AtomicInteger();

    /** 主 DC 上专供文件下载的连接（每个 slot 一条，可并发下载）。 */
    private MtpClient fileDownloadClient(int slot) {
        if (mDlMain[slot] != null && mDlMain[slot].isConnected()) return mDlMain[slot];
        if (mAuthKey == null) return null;
        try {
            MtpClient c = new MtpClient(apiId(), apiHash());
            c.connectWithAuthKey(mDc, mAuthKey);
            mDlMain[slot] = c;
            return c;
        } catch (Throwable t) {
            Log.w(TAG, "file download client failed: " + t);
            return null;
        }
    }

    private String fileKeyPref(int dc) {
        return "filekey_" + dc;
    }

    private byte[] loadFileKey(int dc) {
        String hex = mApp.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                .getString(fileKeyPref(dc), null);
        return (hex != null && hex.length() > 0) ? fromHex(hex) : null;
    }

    private void saveFileKey(int dc, byte[] key) {
        if (key == null) return;
        mApp.getSharedPreferences(PREFS, Context.MODE_PRIVATE).edit()
                .putString(fileKeyPref(dc), toHex(key)).commit();
    }

    private void closeAuxClients() {
        for (int i = 0; i < DL_SLOTS; i++) {
            if (mDlMain[i] != null) {
                mDlMain[i].close();
                mDlMain[i] = null;
            }
        }
        for (MtpClient c : mDlFile.values()) {
            try {
                c.close();
            } catch (Throwable ignored) {
            }
        }
        mDlFile.clear();
        mDlReused.clear();
    }

    private static final Object HANDSHAKE_LOCK = new Object();   // 老设备 OpenSSL 大数运算不能并发

    /** 文件在别的 DC 时：优先复用已持久化的 auth key（省掉一次昂贵的 DH 握手），
     *  否则导出登录态、连到该 DC、握手、导入，并把新 key 存下来。
     *  只有 exportAuthorization 需要主连接（短暂持 mNet）；昂贵的 DH 握手在 slot 锁下
     *  进行，不会阻塞界面请求。 */
    private MtpClient fileClient(int slot, int dc) {
        String key = slot + ":" + dc;
        MtpClient c = mDlFile.get(key);
        if (c != null && c.isConnected()) return c;

        byte[] saved = loadFileKey(dc);
        if (saved != null) {
            try {
                MtpClient rc = new MtpClient(apiId(), apiHash());
                rc.connectWithAuthKey(dc, saved);
                mDlFile.put(key, rc);
                mDlReused.put(key, Boolean.TRUE);   // 若下载失败会重建
                return rc;
            } catch (Throwable t) {
                Log.w(TAG, "saved file auth DC" + dc + " unusable: " + t);
            }
        }

        // 导出登录态 -> 连到该 DC -> 握手 -> 导入。多个下载 slot 同时导出/导入会让
        // 服务端判定 AUTH_BYTES_INVALID，所以整段串行化；偶尔失败就重试。
        synchronized (HANDSHAKE_LOCK) {
            MtpClient again = mDlFile.get(key);
            if (again != null && again.isConnected()) return again;
            for (int attempt = 0; attempt < 3; attempt++) {
                try {
                    MtpClient.AuthExport exp;
                    synchronized (mNet) {
                        ensureConnected();
                        exp = mClient.exportAuthorization(dc);
                    }
                    MtpClient nc = new MtpClient(apiId(), apiHash());
                    nc.connect(dc);
                    nc.doHandshake();
                    nc.importAuthorization(exp.id, exp.bytes);
                    saveFileKey(dc, nc.state() == null ? null : nc.state().authKey());
                    mDlFile.put(key, nc);
                    mDlReused.remove(key);
                    return nc;
                } catch (Throwable t) {
                    Log.w(TAG, "file client DC" + dc + " failed (try " + (attempt + 1) + "): " + t);
                    sleepQuiet(400);
                }
            }
        }
        return null;
    }

    private static int parseMigrate(String msg, String prefix) {
        if (msg == null) return -1;
        int i = msg.indexOf(prefix);
        if (i < 0) return -1;
        try {
            String rest = msg.substring(i + prefix.length());
            StringBuilder d = new StringBuilder();
            for (int k = 0; k < rest.length(); k++) {
                char ch = rest.charAt(k);
                if (ch >= '0' && ch <= '9') d.append(ch);
                else break;
            }
            return d.length() == 0 ? -1 : Integer.parseInt(d.toString());
        } catch (Exception e) {
            return -1;
        }
    }

    // ============================================================ 工具
    private static final char[] HEX = "0123456789abcdef".toCharArray();

    private static String toHex(byte[] b) {
        char[] c = new char[b.length * 2];
        for (int i = 0; i < b.length; i++) {
            int v = b[i] & 0xff;
            c[i * 2] = HEX[v >>> 4];
            c[i * 2 + 1] = HEX[v & 0x0f];
        }
        return new String(c);
    }

    private static byte[] fromHex(String s) {
        int n = s.length() / 2;
        byte[] b = new byte[n];
        for (int i = 0; i < n; i++) {
            b[i] = (byte) ((hexVal(s.charAt(i * 2)) << 4) | hexVal(s.charAt(i * 2 + 1)));
        }
        return b;
    }

    private static int hexVal(char c) {
        if (c >= '0' && c <= '9') return c - '0';
        if (c >= 'a' && c <= 'f') return c - 'a' + 10;
        if (c >= 'A' && c <= 'F') return c - 'A' + 10;
        return 0;
    }
}
