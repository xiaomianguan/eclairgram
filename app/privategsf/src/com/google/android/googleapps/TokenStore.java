package com.google.android.googleapps;

import android.accounts.Account;
import android.accounts.AccountManager;
import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

/**
 * 账户名与令牌的来源。
 *
 * 关键设计：本应用**不注册** com.google 账户认证器，
 * 因此不会与预装的 Google Services Framework 抢注账户类型。
 * 令牌走 IGoogleLoginService.peekCredentials 直接返回，
 * 从而绕开 AccountManager（见 GTalkService.getAccount 的实现）。
 */
public final class TokenStore {

    public static final String TAG = "GTalkBridge";
    public static final String ACCOUNT_TYPE = "com.google";

    private static final String PREFS = "gtalk_bridge";
    private static final String KEY_USERNAME = "username";
    private static final String FALLBACK_USERNAME = "tester@gmail.com";

    private TokenStore() {}

    /** 已配置（或默认）的用户名。 */
    public static String configuredUsername(Context ctx) {
        SharedPreferences sp = ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        String name = sp.getString(KEY_USERNAME, null);
        if (name == null || name.length() == 0) {
            name = discoverAccountName(ctx);
        }
        if (name == null || name.length() == 0) {
            name = FALLBACK_USERNAME;
        }
        return name;
    }

    public static void setConfiguredUsername(Context ctx, String name) {
        ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                .edit().putString(KEY_USERNAME, name).commit();
    }

    /** 读取设备上已有的 com.google 账户（只读，不注册）。 */
    public static String discoverAccountName(Context ctx) {
        try {
            AccountManager am = AccountManager.get(ctx);
            Account[] accounts = am.getAccountsByType(ACCOUNT_TYPE);
            if (accounts != null && accounts.length > 0) {
                Log.i(TAG, "found existing " + ACCOUNT_TYPE + " account: " + accounts[0].name);
                return accounts[0].name;
            }
            Log.i(TAG, "no existing " + ACCOUNT_TYPE + " account");
        } catch (Throwable t) {
            Log.w(TAG, "discoverAccountName failed", t);
        }
        return null;
    }

    /**
     * 生成令牌。
     * 私有服务器不校验令牌内容，因此用一个可预测的字符串即可。
     */
    public static String tokenFor(String username, String service) {
        if (service == null) {
            service = "mail";
        }
        return "PRIVATE_" + service + "_" + username;
    }
}
