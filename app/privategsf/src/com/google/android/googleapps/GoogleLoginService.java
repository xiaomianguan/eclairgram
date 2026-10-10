package com.google.android.googleapps;

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;
import android.util.Log;

/**
 * GTalkService 通过 setClassName("com.google.android.googleapps",
 * "com.google.android.googleapps.GoogleLoginService") 显式绑定本服务，
 * 因此类名必须完全一致。
 */
public class GoogleLoginService extends Service {

    private PrivateLoginService mBinder;

    @Override
    public void onCreate() {
        super.onCreate();
        Log.i(TokenStore.TAG, "GoogleLoginService created");
        mBinder = new PrivateLoginService(this);
    }

    @Override
    public IBinder onBind(Intent intent) {
        Log.i(TokenStore.TAG, "GoogleLoginService bound: " + intent);
        return mBinder;
    }
}
