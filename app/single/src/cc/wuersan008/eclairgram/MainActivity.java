package cc.wuersan008.eclairgram;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.text.InputType;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

/**
 * Eclairgram 自己的登录页（不属于原版 Talk 界面）。
 *
 * 输入手机号 -> 请求验证码 -> 输入验证码 -> 登录 Telegram。
 * 文案全部走资源（values/ 英文，values-zh-rCN/ 简体中文），随系统语言切换。
 */
public class MainActivity extends Activity {

    private static final String TAG = "Eclairgram";

    private EditText mPhone;
    private EditText mCode;
    private EditText mApiId;
    private EditText mApiHash;
    private Button mSendCode;
    private Button mSignIn;
    private Button mSignOut;
    private TextView mStatus;
    private LinearLayout mCodeRow;
    // 两步验证（2FA）
    private EditText mPassword;
    private TextView mPasswordLabel;
    private LinearLayout mPasswordRow;
    private Button mCheckPassword;

    private TelegramManager mTg;
    private boolean mCodeSent;
    private String mProvisionPassword;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        mTg = TelegramManager.get(this);
        // 会话持久化：已登录就直接进入会话列表，不再显示任何设置页。
        if (mTg.isSignedIn()) {
            Intent i = new Intent(this, DialogsActivity.class);
            if (getIntent() != null && getIntent().getBooleanExtra("shot", false)) {
                i.putExtra("shot", true);
            }
            startActivity(i);
            finish();
            return;
        }
        setContentView(buildUi());
        refresh();
        applyProvisioning(getIntent());
    }

    private View buildUi() {
        ScrollView scroll = new ScrollView(this);
        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        int pad = dp(16);
        root.setPadding(pad, pad, pad, pad);
        scroll.addView(root, new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.FILL_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        TextView title = new TextView(this);
        title.setText(R.string.ec_login_title);
        title.setTextSize(24);
        root.addView(title);

        TextView subtitle = new TextView(this);
        subtitle.setText(R.string.ec_login_subtitle);
        subtitle.setPadding(0, dp(4), 0, dp(8));
        root.addView(subtitle);

        // 自带 API 凭据（BYOK）：生产版不带 key
        root.addView(label(R.string.ec_api_id_label));
        mApiId = new EditText(this);
        mApiId.setInputType(InputType.TYPE_CLASS_NUMBER);
        mApiId.setSingleLine(true);
        if (mTg.apiId() != 0) mApiId.setText(Integer.toString(mTg.apiId()));
        root.addView(mApiId);

        root.addView(label(R.string.ec_api_hash_label));
        mApiHash = new EditText(this);
        mApiHash.setSingleLine(true);
        if (mTg.hasApiCredentials()) mApiHash.setText(mTg.apiHash());
        root.addView(mApiHash);

        root.addView(label(R.string.ec_phone_label));
        mPhone = new EditText(this);
        mPhone.setHint(R.string.ec_phone_hint);
        mPhone.setSingleLine(true);
        mPhone.setText(mTg.phone());
        root.addView(mPhone);

        mSendCode = new Button(this);
        mSendCode.setText(R.string.ec_send_code);
        mSendCode.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                onSendCode();
            }
        });
        root.addView(mSendCode);

        mCodeRow = new LinearLayout(this);
        mCodeRow.setOrientation(LinearLayout.VERTICAL);
        mCodeRow.addView(label(R.string.ec_code_label));
        mCode = new EditText(this);
        mCode.setHint(R.string.ec_code_hint);
        mCode.setSingleLine(true);
        mCodeRow.addView(mCode);
        mSignIn = new Button(this);
        mSignIn.setText(R.string.ec_sign_in);
        mSignIn.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                onSignIn();
            }
        });
        mCodeRow.addView(mSignIn);
        root.addView(mCodeRow);

        // 两步验证：验证码通过后再显示
        mPasswordRow = new LinearLayout(this);
        mPasswordRow.setOrientation(LinearLayout.VERTICAL);
        mPasswordLabel = label(R.string.ec_password_label);
        mPasswordRow.addView(mPasswordLabel);
        mPassword = new EditText(this);
        mPassword.setHint(R.string.ec_password_hint);
        mPassword.setSingleLine(true);
        mPassword.setInputType(InputType.TYPE_CLASS_TEXT
                | InputType.TYPE_TEXT_VARIATION_PASSWORD);
        mPasswordRow.addView(mPassword);
        mCheckPassword = new Button(this);
        mCheckPassword.setText(R.string.ec_password_sign_in);
        mCheckPassword.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                onCheckPassword();
            }
        });
        mPasswordRow.addView(mCheckPassword);
        root.addView(mPasswordRow);

        mSignOut = new Button(this);
        mSignOut.setText(R.string.ec_sign_out);
        mSignOut.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                mTg.logout();
                mCodeSent = false;
                refresh();
            }
        });
        root.addView(mSignOut);

        mStatus = new TextView(this);
        mStatus.setPadding(0, dp(12), 0, 0);
        mStatus.setGravity(Gravity.LEFT);
        root.addView(mStatus);
        return scroll;
    }

    private void refresh() {
        boolean signedIn = mTg.isSignedIn();
        boolean pwNeeded = mTg.isPasswordNeeded() && !signedIn;
        mCodeRow.setVisibility((mCodeSent || signedIn) && !pwNeeded ? View.VISIBLE : View.GONE);
        mPasswordRow.setVisibility(pwNeeded ? View.VISIBLE : View.GONE);
        mSignIn.setVisibility(signedIn ? View.GONE : View.VISIBLE);
        mSendCode.setVisibility(signedIn ? View.GONE : View.VISIBLE);
        mSignOut.setVisibility(signedIn ? View.VISIBLE : View.GONE);
        mPhone.setEnabled(!signedIn);
        mApiId.setEnabled(!signedIn);
        mApiHash.setEnabled(!signedIn);
        mPassword.setEnabled(!signedIn);
        if (pwNeeded) {
            String hint = mTg.passwordHint();
            mPasswordLabel.setText(hint != null && hint.length() > 0
                    ? getString(R.string.ec_password_label_hint, hint)
                    : getString(R.string.ec_password_label));
            setStatus(getString(R.string.ec_status_need_password));
        } else {
            setStatus(getString(signedIn ? R.string.ec_status_signed_in : R.string.ec_status_idle));
        }
    }

    /** 从界面读取并保存 api_id/api_hash；不合法则提示。
     *  两个输入框都留空时，只要应用已带凭据（构建时注入或之前保存过）就直接沿用，
     *  这样普通用户在一台手机上就能登录，不必先去电脑上申请 key。 */
    private boolean saveApiFromUi() {
        String idStr = mApiId.getText().toString().trim();
        String hash = mApiHash.getText().toString().trim();
        if (idStr.length() == 0 && hash.length() == 0) {
            if (mTg.hasApiCredentials()) return true;
            setStatus(getString(R.string.ec_status_need_api));
            return false;
        }
        if (idStr.length() == 0 || hash.length() == 0) {
            setStatus(getString(R.string.ec_status_need_api));
            return false;
        }
        try {
            int id = Integer.parseInt(idStr);
            mTg.setApiCredentials(id, hash);
            return true;
        } catch (NumberFormatException e) {
            setStatus(getString(R.string.ec_status_need_api));
            return false;
        }
    }

    private void onSendCode() {
        if (!saveApiFromUi()) return;
        String phone = mPhone.getText().toString().trim();
        if (phone.length() == 0) {
            setStatus(getString(R.string.ec_status_need_phone));
            return;
        }
        setStatus(getString(R.string.ec_status_sending_code));
        mTg.sendCode(phone, new TelegramManager.Callback() {
            public void onDone(boolean ok, String msg) {
                if (ok) {
                    mCodeSent = true;
                    refresh();
                    setStatus(getString(R.string.ec_status_code_sent));
                } else {
                    setStatus(getString(R.string.ec_status_error, msg));
                }
            }
        });
    }

    private void onSignIn() {
        String phone = mPhone.getText().toString().trim();
        String code = mCode.getText().toString().trim();
        setStatus(getString(R.string.ec_status_signing_in));
        mTg.signIn(phone, code, new TelegramManager.Callback() {
            public void onDone(boolean ok, String msg) {
                if (ok) {
                    refresh();
                    openDialogs();
                    return;
                }
                refresh();   // 若账号有 2FA，会切到密码输入
                if (mTg.isPasswordNeeded()) {
                    if (mProvisionPassword != null) {   // 脚本化登录时自动提交密码
                        mPassword.setText(mProvisionPassword);
                        onCheckPassword();
                    }
                } else {
                    setStatus(getString(R.string.ec_status_error, msg));
                }
            }
        });
    }

    /** 提交两步验证密码。 */
    private void onCheckPassword() {
        final String pw = mPassword.getText().toString();
        if (pw.length() == 0) {
            setStatus(getString(R.string.ec_status_need_password));
            return;
        }
        setStatus(getString(R.string.ec_status_checking_password));
        mTg.checkPassword(pw, new TelegramManager.Callback() {
            public void onDone(boolean ok, String msg) {
                if (ok) {
                    mPassword.setText("");
                    refresh();
                    openDialogs();
                } else {
                    refresh();
                    setStatus(getString(R.string.ec_status_error, msg));
                }
            }
        });
    }

    /** 登录成功后进入会话列表（eclairgram 自己的界面）。 */
    private void openDialogs() {
        try {
            startActivity(new Intent(this, DialogsActivity.class));
        } catch (Throwable t) {
            Log.e(TAG, "open dialogs failed", t);
        }
    }

    private void setStatus(String s) {
        if (mStatus != null) mStatus.setText(s);
    }

    private TextView label(int res) {
        TextView tv = new TextView(this);
        tv.setText(res);
        tv.setPadding(0, dp(12), 0, 0);
        return tv;
    }

    private int dp(int v) {
        float d = getResources().getDisplayMetrics().density;
        return (int) (v * d + 0.5f);
    }

    /** 便于脚本化登录（部分老机型输入法在脚本输入时会崩）。 */
    private void applyProvisioning(Intent it) {
        if (it == null) return;
        mProvisionPassword = it.getStringExtra("password");
        String phone = it.getStringExtra("phone");
        if (phone != null) {
            mPhone.setText(phone);
            mTg.sendCode(phone, new TelegramManager.Callback() {
                public void onDone(boolean ok, String msg) {
                    if (ok) {
                        mCodeSent = true;
                        refresh();
                        setStatus(getString(R.string.ec_status_code_sent));
                    } else {
                        setStatus(getString(R.string.ec_status_error, msg));
                    }
                }
            });
        }
        String code = it.getStringExtra("code");
        if (code != null) {
            mCode.setText(code);
            onSignIn();
        }
    }
}
