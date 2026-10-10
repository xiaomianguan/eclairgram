package cc.wuersan008.eclairgram;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import cc.wuersan008.eclairgram.mtproto.MtpClient;
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
    }

    private void save() {
        SharedPreferences.Editor e = mApp.getSharedPreferences(PREFS, Context.MODE_PRIVATE).edit();
        e.putInt(KEY_DC, mDc);
        if (mAuthKey != null) e.putString(KEY_AUTH, toHex(mAuthKey));
        e.commit();
    }

    public boolean isSignedIn() {
        return mAuthKey != null;
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
                    if (ok) save();
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
