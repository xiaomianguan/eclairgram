package cc.wuersan008.eclairgram;

import android.content.Context;
import android.content.SharedPreferences;

/**
 * 私有服务器地址（主机 + 端口）。
 *
 * 因为整个应用（含 GTalkService）都在同一个进程里，
 * 所以这些静态字段对捆绑进来的原版代码是直接可见的。
 * 合并后的 Account.createAccountFromSettings 会调用 getHost()/getPort()，
 * 因此不再需要任何 Google 域名。
 */
public final class ServerConfig {

    /** 本应用自己的包名（合并后原版组件都归到这个包下）。 */
    public static final String PKG = "cc.wuersan008.eclairgram";

    public static final String PREFS = "eclairgram";
    private static final String KEY_HOST = "host";
    private static final String KEY_PORT = "port";

    public static final String DEFAULT_HOST = "127.0.0.1";
    public static final int DEFAULT_PORT = 5228;

    private static volatile String sHost = DEFAULT_HOST;
    private static volatile int sPort = DEFAULT_PORT;

    private ServerConfig() {}

    /** GTalkService（bundled）在连接时调用。 */
    public static String getHost() {
        return sHost;
    }

    /** GTalkService（bundled）在连接时调用。 */
    public static int getPort() {
        return sPort;
    }

    /**
     * 规整主机名：中文输入法很容易输入全角字符，
     * 例如 “10。0。2。2”，这里统一转成半角。
     */
    public static String normalizeHost(String host) {
        if (host == null) {
            return null;
        }
        StringBuilder sb = new StringBuilder(host.length());
        for (int i = 0; i < host.length(); i++) {
            char c = host.charAt(i);
            if (c == '。' || c == '．' || c == '｡') {
                c = '.';                       // 。／．／｡ -> .
            } else if (c >= '０' && c <= '９') {
                c = (char) (c - '０' + '0');  // 全角数字 -> 半角
            }
            if (c > ' ' && c != '　') {    // 丢弃空白（含全角空格）
                sb.append(c);
            }
        }
        return sb.toString();
    }

    public static void set(String host, int port) {
        host = normalizeHost(host);
        sHost = (host == null || host.length() == 0) ? DEFAULT_HOST : host;
        sPort = (port <= 0 || port > 65535) ? DEFAULT_PORT : port;
    }

    /** 进程启动时调用：应用可能由 GTalkService 在开机后自行拉起，
     *  此时没有任何 Activity，所以必须从 SharedPreferences 恢复。 */
    public static void load(Context ctx) {
        SharedPreferences sp = ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        set(sp.getString(KEY_HOST, null), sp.getInt(KEY_PORT, DEFAULT_PORT));
    }

    public static void save(Context ctx, String host, int port) {
        set(host, port);
        ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE).edit()
                .putString(KEY_HOST, sHost).putInt(KEY_PORT, sPort).commit();
    }
}
