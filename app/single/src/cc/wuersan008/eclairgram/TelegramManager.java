package cc.wuersan008.eclairgram;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import cc.wuersan008.eclairgram.mtproto.MtpClient;
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
    // 是否已完成 auth.signIn（授权登录）。注意：DH 握手也会生成 auth key，
    // 所以“有 key”不等于“已登录”，否则请求验证码后就会被当成已登录。
    private boolean mAuthorized;
    private final Object mNet = new Object();

    private TelegramManager(Context ctx) {
        mApp = ctx.getApplicationContext();
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
                        save();
                    }
                    post(cb, ok, ok ? "signed-in" : "failed");
                } catch (final Throwable t) {
                    Log.e(TAG, "signIn failed", t);
                    post(cb, false, String.valueOf(t.getMessage()));
                }
            }
        }).start();
    }

    public void logout() {
        mAuthKey = null;
        mAuthorized = false;
        mPhoneCodeHash = null;
        if (mClient != null) {
            mClient.close();
            mClient = null;
        }
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
                sleepQuiet(3000);
            }
            sleepQuiet(2500);
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

    public byte[] syncDownloadPeerPhoto(byte[] inputPeer, long photoId) throws Exception {
        synchronized (mNet) {
            ensureConnected();
            try {
                return mClient.downloadPeerPhoto(inputPeer, photoId);
            } catch (java.io.IOException e) {
                int dc = parseMigrate(e.getMessage(), "FILE_MIGRATE_");
                if (dc <= 0) return null;
                MtpClient fc = fileClient(dc);
                if (fc == null) return null;
                try {
                    return fc.downloadPeerPhoto(inputPeer, photoId);
                } catch (Throwable t) {
                    return null;
                }
            }
        }
    }

    /** 按 InputFileLocation 下载消息里的媒体（同样处理 FILE_MIGRATE）。 */
    public byte[] syncDownloadLocation(byte[] location) throws Exception {
        synchronized (mNet) {
            ensureConnected();
            try {
                return mClient.downloadLocation(location);
            } catch (java.io.IOException e) {
                int dc = parseMigrate(e.getMessage(), "FILE_MIGRATE_");
                if (dc <= 0) return null;
                MtpClient fc = fileClient(dc);
                if (fc == null) return null;
                try {
                    return fc.downloadLocation(location);
                } catch (Throwable t) {
                    return null;
                }
            }
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

    private final java.util.Map<Integer, MtpClient> mFileClients =
            new java.util.HashMap<Integer, MtpClient>();

    /** 头像在别的 DC 时：导出登录态、连到该 DC、导入后下载。 */
    private MtpClient fileClient(int dc) {
        MtpClient c = mFileClients.get(Integer.valueOf(dc));
        if (c != null) return c;
        try {
            MtpClient.AuthExport exp = mClient.exportAuthorization(dc);
            Log.i(TAG, "exported auth DC" + dc + " id=" + exp.id + " len=" + exp.bytes.length);
            MtpClient nc = new MtpClient(apiId(), apiHash());
            nc.connect(dc);
            nc.doHandshake();
            Log.i(TAG, "handshake DC" + dc + " ok");
            nc.importAuthorization(exp.id, exp.bytes);
            Log.i(TAG, "imported auth DC" + dc + " ok");
            mFileClients.put(Integer.valueOf(dc), nc);
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
