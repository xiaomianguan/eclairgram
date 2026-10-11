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

    private void updateLoop() {
        while (true) {
            try {
                boolean changed = false;
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
                        if (nm != null && !nm.isEmpty()) changed = true;
                    } else if (t.equals("updates.differenceEmpty")) {
                        mDate = diff.i32("date");
                    } else if (t.equals("updates.differenceTooLong")) {
                        mUpdatesInit = false;
                    }
                }
                if (changed) notifyListeners();
            } catch (Throwable e) {
                Log.w(TAG, "update loop: " + e);
                mUpdatesInit = false;
                resetClient();
                sleepQuiet(3000);
            }
            sleepQuiet(4000);
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
        int slot = dlSlot();
        synchronized (mDlLock[slot]) {
            return downloadLocation(slot, 0, location);
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

    /** 在文件 DC 上下载；若用的是持久化 key 且失败，则丢弃该 key 重建后再试一次。 */
    private byte[] downloadFromFileDc(int slot, int dc, byte[] location, int depth) throws Exception {
        if (depth > 2) return null;
        MtpClient fc = fileClient(slot, dc);
        if (fc == null) return null;
        boolean reused = mDlReused.containsKey(slot + ":" + dc);
        try {
            byte[] r = fc.downloadLocation(location);
            if (r != null) return r;
            if (reused) {
                invalidateFileClient(slot, dc);
                return downloadFromFileDc(slot, dc, location, depth + 1);
            }
            return null;
        } catch (java.io.IOException e) {
            int target = parseMigrate(e.getMessage(), "FILE_MIGRATE_");
            invalidateFileClient(slot, dc);
            if (target > 0) return downloadFromFileDc(slot, target, location, depth + 1);
            return null;
        } catch (Throwable t) {
            invalidateFileClient(slot, dc);
            return null;
        }
    }

    /** 上传并发送一张图片。 */
    public void syncSendPhoto(byte[] inputPeer, byte[] data, String name, String caption)
            throws Exception {
        synchronized (mNet) {
            ensureConnected();
            mClient.sendPhoto(inputPeer, data, name, caption);
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

    /** 丢弃某个 slot 的文件 DC 连接与持久化 key（用于 key 失效后重建）。 */
    private void invalidateFileClient(int slot, int dc) {
        MtpClient c = mDlFile.remove(slot + ":" + dc);
        if (c != null) {
            try {
                c.close();
            } catch (Throwable ignored) {
            }
        }
        mDlReused.remove(slot + ":" + dc);
        mApp.getSharedPreferences(PREFS, Context.MODE_PRIVATE).edit()
                .remove(fileKeyPref(dc)).commit();
    }

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
            Log.w(TAG, "file client DC" + dc + " failed: " + t);
            return null;
        }
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
    private static String toHex(byte[] b) {
        StringBuilder sb = new StringBuilder(b.length * 2);
        for (byte x : b) sb.append(String.format("%02x", x));
        return sb.toString();
    }

    private static byte[] fromHex(String s) {
        int n = s.length() / 2;
        byte[] b = new byte[n];
        for (int i = 0; i < n; i++) {
            b[i] = (byte) Integer.parseInt(s.substring(i * 2, i * 2 + 2), 16);
        }
        return b;
    }
}
