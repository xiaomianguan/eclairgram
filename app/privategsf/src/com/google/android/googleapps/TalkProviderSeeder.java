package com.google.android.googleapps;

import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.util.Log;

/**
 * 往 Google Talk 的 TalkProvider 预置账户行。
 *
 * 目的：让 Talk 的 SigningInActivity 直接进入登录流程，
 * 而不是跳到 AccountActivity 去走 AccountManager 取令牌，
 * 从而不依赖 com.google 账户认证器。
 *
 * 与预装组件的隔离策略：
 *  * 如果该 provider 下**已经存在任何账户行**（真机上由真实 GSF 建立），
 *    则**完全不改动**，仅沿用已有账户名。
 *  * 只有一行都没有时（例如干净模拟器）才插入我们自己的行。
 *
 * 仅使用普通 ContentResolver 调用（WRITE_ONLY 权限），不需要 root，
 * 也不修改任何 APK。
 */
public final class TalkProviderSeeder {

    private static final String TAG = TokenStore.TAG;
    private static final Uri PROVIDERS_URI = Uri.parse(
            "content://cc.wuersan008.eclairgram.providers.talk/providers");
    private static final Uri ACCOUNTS_URI = Uri.parse(
            "content://cc.wuersan008.eclairgram.providers.talk/accounts");

    private TalkProviderSeeder() {}

    /** 已有账户行信息。 */
    public static final class AccountRow {
        public final long id;
        public final String username;

        AccountRow(long id, String username) {
            this.id = id;
            this.username = username;
        }
    }

    /** @return 人类可读的结果描述 */
    public static String seed(Context ctx, String username) {
        ContentResolver cr = ctx.getContentResolver();
        long providerId = findProviderId(ctx);
        if (providerId < 0) {
            return "TalkProvider 中没有 GTalk provider 行";
        }

        AccountRow existing = findFirstAccount(ctx, providerId);
        if (existing != null) {
            // 已由真实 GSF / Talk 配置过：保持原样，绝不改动。
            return "检测到已有账户行 #" + existing.id + "（" + existing.username + "），保持原样不修改";
        }

        String token = TokenStore.tokenFor(username, "mail");
        ContentValues values = new ContentValues();
        values.put("name", username);
        values.put("provider", Long.valueOf(providerId));
        values.put("username", username);
        values.put("pw", token);
        values.put("locked", Integer.valueOf(0));
        values.put("keep_signed_in", Integer.valueOf(1));
        values.put("active", Integer.valueOf(1));

        try {
            Uri inserted = cr.insert(ACCOUNTS_URI, values);
            Log.i(TAG, "inserted account row " + inserted);
            return "已插入账户行 " + inserted + "（" + username + "）";
        } catch (Throwable t) {
            // 不同版本 TalkProvider 的列可能不同，去掉 active 再试一次。
            Log.w(TAG, "insert with active failed, retrying", t);
            values.remove("active");
            try {
                Uri inserted = cr.insert(ACCOUNTS_URI, values);
                return "已插入账户行 " + inserted + "（" + username + "）";
            } catch (Throwable t2) {
                Log.e(TAG, "seed failed", t2);
                return "写入失败：" + t2;
            }
        }
    }

    /** 查询该 provider 下的第一条账户行（不区分用户名）。 */
    public static AccountRow findFirstAccount(Context ctx, long providerId) {
        Cursor c = null;
        try {
            c = ctx.getContentResolver().query(ACCOUNTS_URI,
                    new String[] { "_id", "username" },
                    "provider=?", new String[] { Long.toString(providerId) }, null);
            if (c != null && c.moveToFirst()) {
                return new AccountRow(c.getLong(0), c.getString(1));
            }
        } catch (Throwable t) {
            Log.e(TAG, "findFirstAccount failed", t);
        } finally {
            if (c != null) c.close();
        }
        return null;
    }

    public static long findProviderId(Context ctx) {
        Cursor c = null;
        try {
            c = ctx.getContentResolver().query(PROVIDERS_URI,
                    new String[] { "_id" }, "name=?", new String[] { "GTalk" }, null);
            if (c != null && c.moveToFirst()) {
                return c.getLong(0);
            }
        } catch (Throwable t) {
            Log.e(TAG, "findProviderId failed", t);
        } finally {
            if (c != null) c.close();
        }
        return -1;
    }
}
