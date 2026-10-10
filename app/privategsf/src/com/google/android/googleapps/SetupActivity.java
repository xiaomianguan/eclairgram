package com.google.android.googleapps;

import android.app.Activity;
import android.os.Bundle;
import android.util.Log;
import android.widget.TextView;
import android.widget.ScrollView;

/** 首次运行：选择账户名并把账户行写入 TalkProvider。 */
public class SetupActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        // 1) 若 TalkProvider 里已有账户行（真机由真实 GSF 建立），沿用它，绝不改动。
        long providerId = TalkProviderSeeder.findProviderId(this);
        TalkProviderSeeder.AccountRow existing = null;
        if (providerId >= 0) {
            existing = TalkProviderSeeder.findFirstAccount(this, providerId);
        }

        // 2) 否则优先用设备上已有的 com.google 账户（只读，不注册认证器）。
        String username;
        if (existing != null && existing.username != null && existing.username.length() > 0) {
            username = existing.username;
            TokenStore.setConfiguredUsername(this, username);
        } else {
            String discovered = TokenStore.discoverAccountName(this);
            if (discovered != null) {
                TokenStore.setConfiguredUsername(this, discovered);
            }
            username = TokenStore.configuredUsername(this);
        }

        // 3) 只有在完全没有账户行时才插入。
        String result = TalkProviderSeeder.seed(this, username);

        StringBuilder sb = new StringBuilder();
        sb.append("GTalk 桥接应用\n\n");
        sb.append("账户名：").append(username).append('\n');
        sb.append("令牌：").append(TokenStore.tokenFor(username, "mail")).append("\n\n");
        sb.append(result).append("\n\n");
        sb.append("服务器地址：mtalk.google.com:5228\n");
        sb.append("（用 DNS 或 hosts 指向你的私有服务器）\n\n");
        sb.append("免 root 的 TLS 方案：\n");
        sb.append("setprop socket.relaxsslcheck yes\n");

        Log.i(TokenStore.TAG, "SetupActivity: " + sb);

        TextView tv = new TextView(this);
        tv.setText(sb.toString());
        tv.setPadding(12, 12, 12, 12);
        ScrollView sv = new ScrollView(this);
        sv.addView(tv);
        setContentView(sv);
    }
}
