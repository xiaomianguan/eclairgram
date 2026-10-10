import cc.wuersan008.eclairgram.mtproto.MtpClient;
import cc.wuersan008.eclairgram.mtproto.TlSchema;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.Properties;

/**
 * 桌面端验证工具：用 JDK 直接跑 MTProto 核心，先在电脑上把协议/登录跑通，
 * 再把同一套源码编进 APK。
 *
 * 会话（auth key、DC、phone_code_hash）持久化到文件，因此可以：
 *   java TgCli sendcode <phone>          # 请求验证码并记录 phone_code_hash
 *   java TgCli signin <phone> <code>     # 复用同一 auth key 完成登录
 *
 * 其它：
 *   java TgCli handshake                 # 只做 DH 握手
 *   java TgCli getconfig                 # 加密 RPC（help.getConfig）
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
        String sessionPath = System.getProperty("session", "local/tg-session.properties");

        Properties session = new Properties();
        if (new File(sessionPath).exists()) {
            session.load(new FileInputStream(sessionPath));
        }
        int dc = Integer.parseInt(System.getProperty("dc", session.getProperty("dc", "2")));

        String cmd = args.length > 0 ? args[0] : "handshake";
        MtpClient c = new MtpClient(apiId, apiHash);
        c.setDebug(Boolean.getBoolean("debug"));

        byte[] authKey = null;
        String keyHex = session.getProperty("authKey");
        if (keyHex != null && keyHex.length() > 0) {
            authKey = fromHex(keyHex);
            c.connectWithAuthKey(dc, authKey);
            System.out.println("restored session (auth key)");
        } else {
            c.connect(dc);
            System.out.println("connected to DC" + dc);
            authKey = c.doHandshake();
            session.setProperty("authKey", toHex(authKey));
            session.setProperty("dc", Integer.toString(dc));
            save(sessionPath, session);
            System.out.println("handshake OK");
        }

        if ("getconfig".equals(cmd) || "handshake".equals(cmd)) {
            cc.wuersan008.eclairgram.mtproto.Tl.Writer w =
                    new cc.wuersan008.eclairgram.mtproto.Tl.Writer();
            w.int32(cc.wuersan008.eclairgram.mtproto.TlSchema.HELP_GET_CONFIG);
            byte[] res = (byte[]) c.rpc(c.wrapped(w.toByteArray()));
            System.out.println("getConfig OK, " + res.length + " bytes");
            c.close();
            return;
        }

        if ("send".equals(cmd)) {
            long uid = Long.parseLong(args[1]);
            long ah = Long.parseLong(args[2]);
            String text = args[3];
            cc.wuersan008.eclairgram.mtproto.TlObject res =
                    c.sendMessage(MtpClient.inputPeerUser(uid, ah), text);
            System.out.println("SEND type=" + res.type());
            c.close();
            return;
        }

        if ("history".equals(cmd)) {
            long uid = Long.parseLong(args[1]);
            long ah = Long.parseLong(args[2]);
            cc.wuersan008.eclairgram.mtproto.TlObject res =
                    c.getHistory(MtpClient.inputPeerUser(uid, ah), 20);
            java.util.List<Object> msgs = res.list("messages");
            System.out.println("HISTORY type=" + res.type() + " count="
                    + (msgs == null ? 0 : msgs.size()));
            if (msgs != null) {
                for (Object o : msgs) {
                    cc.wuersan008.eclairgram.mtproto.TlObject m =
                            (cc.wuersan008.eclairgram.mtproto.TlObject) o;
                    System.out.println("  " + m.type() + " id=" + m.i32("id")
                            + " out=" + m.bool("out") + " date=" + m.i32("date")
                            + " text=" + m.str("message"));
                }
            }
            c.close();
            return;
        }

        if ("dialogs".equals(cmd)) {
            cc.wuersan008.eclairgram.mtproto.TlObject d = c.getDialogs(30);
            System.out.println("DIALOGS type=" + d.type());
            dumpDialogs(d);
            c.close();
            return;
        }

        if ("sendcode".equals(cmd)) {
            String phone = args[1];
            TlSchema.SentCode sent = c.sendCode(phone);
            System.out.println("SENT_CODE type=0x" + Integer.toHexString(sent.typeId)
                    + " len=" + sent.typeLength + " timeout=" + sent.timeout);
            System.out.println("PHONE_CODE_HASH=" + sent.phoneCodeHash);
            session.setProperty("phone", phone);
            session.setProperty("phoneCodeHash", sent.phoneCodeHash);
            save(sessionPath, session);
            if (args.length > 2) {
                boolean ok = c.signIn(phone, sent.phoneCodeHash, args[2]);
                System.out.println("SIGN_IN " + (ok ? "OK" : "FAILED"));
            }
            c.close();
            return;
        }

        if ("signin".equals(cmd)) {
            String phone = args[1];
            String code = args[2];
            String hash = session.getProperty("phoneCodeHash");
            if (hash == null) throw new IllegalStateException("no saved phone_code_hash; run sendcode first");
            boolean ok = c.signIn(phone, hash, code);
            System.out.println("SIGN_IN " + (ok ? "OK" : "FAILED"));
            c.close();
            return;
        }

        System.err.println("unknown command: " + cmd);
        c.close();
        System.exit(2);
    }

    private static void dumpDialogs(cc.wuersan008.eclairgram.mtproto.TlObject d) {
        java.util.List<Object> users = d.list("users");
        java.util.List<Object> dialogs = d.list("dialogs");
        java.util.List<Object> msgs = d.list("messages");
        java.util.HashMap<Long, String> names = new java.util.HashMap<Long, String>();
        if (users != null) {
            for (Object o : users) {
                cc.wuersan008.eclairgram.mtproto.TlObject u =
                        (cc.wuersan008.eclairgram.mtproto.TlObject) o;
                String n = u.str("first_name");
                if (n == null) n = "";
                String ln = u.str("last_name");
                if (ln != null) n = n + " " + ln;
                names.put(Long.valueOf(u.i64("id")), n);
                System.out.println("  user id=" + u.i64("id") + " name=" + n
                        + " access_hash=" + u.i64("access_hash") + " self=" + u.bool("self"));
            }
        }
        int i = 0;
        if (dialogs != null) {
            for (Object o : dialogs) {
                cc.wuersan008.eclairgram.mtproto.TlObject dg =
                        (cc.wuersan008.eclairgram.mtproto.TlObject) o;
                cc.wuersan008.eclairgram.mtproto.TlObject peer = dg.obj("peer");
                String who = peer == null ? "?" : peer.type();
                long pid = peer == null ? 0 : (peer.type().equals("peerUser")
                        ? peer.i64("user_id") : peer.i64("chat_id"));
                if (peer != null && peer.type().equals("peerChannel")) {
                    pid = peer.i64("channel_id");
                }
                String nm = names.get(Long.valueOf(pid));
                System.out.println("  #" + (++i) + " " + who + " id=" + pid
                        + " name=" + (nm == null ? "?" : nm)
                        + " top=" + dg.i32("top_message")
                        + " unread=" + dg.i32("unread_count"));
            }
        }
        System.out.println("  (dialogs=" + (dialogs == null ? 0 : dialogs.size())
                + " users=" + (users == null ? 0 : users.size())
                + " messages=" + (msgs == null ? 0 : msgs.size()) + ")");
    }

    private static void save(String path, Properties p) throws Exception {
        File f = new File(path);
        if (f.getParentFile() != null) f.getParentFile().mkdirs();
        FileOutputStream out = new FileOutputStream(f);
        p.store(out, "eclairgram local session (never commit)");
        out.close();
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
