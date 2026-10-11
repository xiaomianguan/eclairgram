package cc.wuersan008.eclairgram;

import android.app.Activity;
import android.os.Bundle;

/**
 * 所有界面的基类：在子类 {@code setContentView} 之前应用用户选择的语言，
 * 这样每个界面的文案都会用正确的语言。
 */
public abstract class BaseActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        AppPrefs.applyLocale(this);
    }
}
