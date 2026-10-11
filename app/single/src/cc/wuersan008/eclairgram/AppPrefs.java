package cc.wuersan008.eclairgram;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.Configuration;
import android.content.res.Resources;

import java.util.Locale;

/**
 * 应用自己的界面偏好（与 Telegram 会话数据分开存放）：语言、通知开关。
 *
 * Android 2.1–4.0 没有“单个应用的语言”概念（per-app locale 要到 API 17），
 * 只能改进程级的资源语言配置（{@link #applyLocale}），所以每个界面在创建时都要调用一次。
 */
public final class AppPrefs {

    private static final String PREFS = "eclairgram_ui";
    private static final String KEY_LANG = "language";        // "" = 跟随系统
    private static final String KEY_NOTIFS = "notifications"; // 默认开

    private AppPrefs() {}

    private static SharedPreferences sp(Context c) {
        return c.getApplicationContext().getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    // ============================================================ 语言
    /** 保存的语言代码：""=跟随系统，"en"=English，"zh_CN"=简体中文。 */
    public static String language(Context c) {
        String v = sp(c).getString(KEY_LANG, "");
        return v == null ? "" : v;
    }

    public static void setLanguage(Context c, String code) {
        sp(c).edit().putString(KEY_LANG, code == null ? "" : code).commit();
    }

    /** 把保存的语言应用到进程资源；语言变化后需要重建界面才能看到效果。 */
    public static void applyLocale(Context c) {
        Resources r = c.getResources();
        Configuration cfg = new Configuration(r.getConfiguration());
        cfg.locale = localeFor(language(c));
        Locale.setDefault(cfg.locale);
        try {
            r.updateConfiguration(cfg, r.getDisplayMetrics());
        } catch (Throwable ignored) {
        }
    }

    private static Locale localeFor(String code) {
        if (code == null || code.length() == 0) {
            // 跟随系统：取系统默认语言，而不是上一次被改过的进程语言
            Locale l = Resources.getSystem().getConfiguration().locale;
            return l == null ? Locale.US : l;
        }
        int u = code.indexOf('_');
        if (u < 0) return new Locale(code);
        return new Locale(code.substring(0, u), code.substring(u + 1));
    }

    // ============================================================ 通知
    public static boolean notificationsEnabled(Context c) {
        return sp(c).getBoolean(KEY_NOTIFS, true);
    }

    public static void setNotificationsEnabled(Context c, boolean on) {
        sp(c).edit().putBoolean(KEY_NOTIFS, on).commit();
    }
}
