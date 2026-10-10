import cc.wuersan008.eclairgram.mtproto.MtpClient;
import cc.wuersan008.eclairgram.mtproto.TlSchema;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.Properties;

/**
 * 桌面端验证工具：用 JDK 直接跑 MTProto 核心，先在电脑上把协议/登录跑通，
 * 再把同一套源码编进 APK。
 *
 * 用法：
 *   java TgCli handshake
 *   java TgCli sendcode <phone>            # 交互式：打印后从 stdin 读验证码
 *   java TgCli sendcode <phone> <code>     # 直接带验证码
 */
public class TgCli {

    public static void main(String[] args) throws Exception {
        Properties p = new Properties();
        String secrets = System.getProperty("secrets", "local/secrets.properties");
        try {
            p.load(new FileInputStream(secrets));
        } catch (Exception ignored) {
        }
        int apiId = Integer.parseInt(prop(p, "tg.api_id"));
        String apiHash = prop(p, "tg.api_hash");
        int dc = Integer.parseInt(System.getProperty("dc", "2"));

        String cmd = args.length > 0 ? args[0] : "handshake";
        MtpClient c = new MtpClient(apiId, apiHash);
        c.setDebug(Boolean.getBoolean("debug"));
        c.connect(dc);
        System.out.println("connected to DC" + dc);
        c.doHandshake();
        System.out.println("handshake OK");

        if ("handshake".equals(cmd)) {
            c.close();
            return;
        }

        if ("getconfig".equals(cmd)) {
            cc.wuersan008.eclairgram.mtproto.Tl.Writer w =
                    new cc.wuersan008.eclairgram.mtproto.Tl.Writer();
            w.int32(cc.wuersan008.eclairgram.mtproto.TlSchema.HELP_GET_CONFIG);
            byte[] res = (byte[]) c.rpc(c.wrapped(w.toByteArray()));
            System.out.println("getConfig OK, " + res.length + " bytes, ctor=0x"
                    + Integer.toHexString(new cc.wuersan008.eclairgram.mtproto.Tl.Reader(res).int32()));
            c.close();
            return;
        }

        if ("sendcode".equals(cmd)) {
            String phone = args[1];
            TlSchema.SentCode sent = c.sendCode(phone);
            System.out.println("SENT_CODE type=0x" + Integer.toHexString(sent.typeId)
                    + " len=" + sent.typeLength + " timeout=" + sent.timeout);
            System.out.println("PHONE_CODE_HASH=" + sent.phoneCodeHash);
            System.out.flush();

            String code = args.length > 2 ? args[2] : readLine();
            if (code == null || code.trim().isEmpty()) {
                System.out.println("no code given; keeping code hash: " + sent.phoneCodeHash);
                c.close();
                return;
            }
            boolean ok = c.signIn(phone, sent.phoneCodeHash, code.trim());
            System.out.println("SIGN_IN " + (ok ? "OK" : "FAILED"));
            c.close();
            return;
        }

        System.err.println("unknown command: " + cmd);
        c.close();
        System.exit(2);
    }

    private static String readLine() throws Exception {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        System.out.print("enter code> ");
        System.out.flush();
        return br.readLine();
    }

    private static String prop(Properties p, String key) {
        String v = System.getProperty(key);
        if (v != null && v.length() > 0) return v;
        v = System.getenv(key.toUpperCase().replace('.', '_'));
        if (v != null && v.length() > 0) return v;
        v = p.getProperty(key);
        if (v == null) throw new IllegalStateException("missing " + key);
        return v;
    }
}
