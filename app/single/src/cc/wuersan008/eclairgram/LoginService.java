package cc.wuersan008.eclairgram;

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;
import android.util.Log;

/**
 * GTalkService 通过 GoogleLoginServiceConstants.SERVICE_INTENT 显式绑定登录服务。
 * 合并成单一 APK 后，该组件属于本应用，类名必须与绑定补丁一致。
 */
public class LoginService extends Service {

    private BridgeBinder mBinder;

    @Override
    public void onCreate() {
        super.onCreate();
        Log.i(Config.TAG, "LoginService created");
        mBinder = new BridgeBinder(this);
    }

    @Override
    public IBinder onBind(Intent intent) {
        Log.i(Config.TAG, "LoginService bound: " + intent);
        return mBinder;
    }
}
