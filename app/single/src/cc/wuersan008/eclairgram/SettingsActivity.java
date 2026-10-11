package cc.wuersan008.eclairgram;

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.TextView;

/**
 * 设置页（从会话列表的菜单进入）：语言选择 + 通知开关。
 *
 * 语言改变后重启到会话列表，让所有界面用新语言重建（老系统没有 recreate()）。
 */
public class SettingsActivity extends BaseActivity {

    // 语言代码：""=跟随系统，"en"=English，"zh_CN"=简体中文
    private static final String[] CODES = { "", "en", "zh_CN" };

    private TextView mLangValue;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setTitle(R.string.ec_settings);
        setContentView(R.layout.ec_settings);

        mLangValue = (TextView) findViewById(R.id.ec_set_language_value);
        findViewById(R.id.ec_set_language).setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                pickLanguage();
            }
        });

        final CheckBox notifs = (CheckBox) findViewById(R.id.ec_set_notifications);
        notifs.setChecked(AppPrefs.notificationsEnabled(this));
        notifs.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            public void onCheckedChanged(CompoundButton b, boolean on) {
                AppPrefs.setNotificationsEnabled(SettingsActivity.this, on);
            }
        });
        findViewById(R.id.ec_set_notifications_row).setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                notifs.setChecked(!notifs.isChecked());
            }
        });

        updateLanguageValue();
    }

    private void updateLanguageValue() {
        mLangValue.setText(languageLabel(AppPrefs.language(this)));
    }

    private int languageLabel(String code) {
        if ("en".equals(code)) return R.string.ec_language_english;
        if ("zh_CN".equals(code)) return R.string.ec_language_chinese;
        return R.string.ec_language_system;
    }

    private void pickLanguage() {
        final String current = AppPrefs.language(this);
        int checked = 0;
        final String[] labels = new String[CODES.length];
        for (int i = 0; i < CODES.length; i++) {
            labels[i] = getString(languageLabel(CODES[i]));
            if (CODES[i].equals(current)) checked = i;
        }
        new AlertDialog.Builder(this)
                .setTitle(R.string.ec_settings_language)
                .setSingleChoiceItems(labels, checked, new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface d, int which) {
                        d.dismiss();
                        applyLanguage(CODES[which]);
                    }
                })
                .setNegativeButton(android.R.string.cancel, null)
                .show();
    }

    private void applyLanguage(String code) {
        if (code.equals(AppPrefs.language(this))) return;
        AppPrefs.setLanguage(this, code);
        AppPrefs.applyLocale(this);
        // 重启到会话列表，让栈里的所有界面用新语言重建
        Intent i = new Intent(this, MainActivity.class);
        i.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP | Intent.FLAG_ACTIVITY_NEW_TASK);
        startActivity(i);
        finish();
    }
}
