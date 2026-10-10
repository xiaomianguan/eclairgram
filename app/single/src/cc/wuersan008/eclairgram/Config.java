package cc.wuersan008.eclairgram;

import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.net.Uri;
import android.util.Log;

/** 账户名、令牌与 TalkProvider 预置。全部在应用内部完成，不依赖任何预装组件。 */
public final class Config {

    public static final String TAG = "Eclairgram";
    private static final String PREFS = "eclairgram";
    private static final String KEY_USER = "username";
    private static final String FALLBACK_USER = "tester@gmail.com";

    private static final Uri PROVIDERS = Uri.parse(
            "content://cc.wuersan008.eclairgram.providers.talk/providers");
    private static final Uri ACCOUNTS = Uri.parse(
            "content://cc.wuersan008.eclairgram.providers.talk/accounts");

    private Config() {}

    public static String username(Context ctx) {
        SharedPreferences sp = ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        String u = sp.getString(KEY_USER, null);
        return (u == null || u.length() == 0) ? FALLBACK_USER : u;
    }

    public static void setUsername(Context ctx, String user) {
        ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                .edit().putString(KEY_USER, user).commit();
    }

    /** 私有服务器不校验令牌内容，用可预测字符串即可。 */
    public static String token(String user, String service) {
        if (service == null) service = "mail";
        return "LIANGMIAN_" + service + "_" + user;
    }

    /** 若 TalkProvider 还没有账户行，就补一行，让 Talk 直接进入登录流程。
     *  已有账户行则完全不改动。 */
    public static String seed(Context ctx, String user) {
        ContentResolver cr = ctx.getContentResolver();
        long pid = findProviderId(cr);
        if (pid < 0) {
            // 首次运行：TalkProvider 的 providers 表是空的。
            // 原先由预装组件负责写入这一行，现在改为我们自举。
            ContentValues pv = new ContentValues();
            pv.put("name", "GTalk");
            pv.put("fullname", "Google Talk");
            pv.put("category", "com.android.im.category.GTALK");
            try {
                cr.insert(PROVIDERS, pv);
            } catch (Throwable t) {
                Log.e(TAG, "insert provider failed", t);
            }
            pid = findProviderId(cr);
            if (pid < 0) return "未能建立 GTalk provider 行";
        }
        ContentValues v = new ContentValues();
        v.put("name", user);
        v.put("provider", Long.valueOf(pid));
        v.put("username", user);
        v.put("pw", token(user, "mail"));
        v.put("locked", Integer.valueOf(0));
        v.put("keep_signed_in", Integer.valueOf(1));
        v.put("active", Integer.valueOf(1));
        long aid = findAccountId(cr, pid);
        if (aid >= 0) {
            // 已有账户行：邮箱没变就保持原样，变了就更新，方便同一台机器换账号。
            if (user.equals(findAccountUsername(cr, aid))) return "已存在账户行，保持原样";
            try {
                cr.update(ACCOUNTS, v, "_id=?", new String[]{Long.toString(aid)});
                return "已把账户行更新为 " + user;
            } catch (Throwable t) {
                Log.e(TAG, "update account failed", t);
                return "更新账户行失败：" + t;
            }
        }
        try {
            Uri u = cr.insert(ACCOUNTS, v);
            return "已插入账户行 " + u;
        } catch (Throwable t) {
            Log.w(TAG, "insert with active failed", t);
            v.remove("active");
            try {
                return "已插入账户行 " + cr.insert(ACCOUNTS, v);
            } catch (Throwable t2) {
                Log.e(TAG, "seed failed", t2);
                return "写入失败：" + t2;
            }
        }
    }

    private static long findProviderId(ContentResolver cr) {
        Cursor c = null;
        try {
            c = cr.query(PROVIDERS, new String[]{"_id"}, "name=?", new String[]{"GTalk"}, null);
            if (c != null && c.moveToFirst()) return c.getLong(0);
        } catch (Throwable t) {
            Log.e(TAG, "findProviderId", t);
        } finally {
            if (c != null) c.close();
        }
        return -1;
    }

    private static long findAccountId(ContentResolver cr, long pid) {
        Cursor c = null;
        try {
            c = cr.query(ACCOUNTS, new String[]{"_id"}, "provider=?",
                    new String[]{Long.toString(pid)}, null);
            if (c != null && c.moveToFirst()) return c.getLong(0);
        } catch (Throwable t) {
            Log.e(TAG, "findAccountId", t);
        } finally {
            if (c != null) c.close();
        }
        return -1;
    }

    private static String findAccountUsername(ContentResolver cr, long aid) {
        Cursor c = null;
        try {
            c = cr.query(ACCOUNTS, new String[]{"username"}, "_id=?",
                    new String[]{Long.toString(aid)}, null);
            if (c != null && c.moveToFirst()) return c.getString(0);
        } catch (Throwable t) {
            Log.e(TAG, "findAccountUsername", t);
        } finally {
            if (c != null) c.close();
        }
        return null;
    }
}
