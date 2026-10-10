package cc.wuersan008.eclairgram;

import android.app.Application;
import android.util.Log;

/** 进程启动时恢复服务器地址（开机自启时没有 Activity）。 */
public class App extends Application {

    @Override
    public void onCreate() {
        super.onCreate();
        ServerConfig.load(this);
        Log.i(Config.TAG, "App start, server = "
                + ServerConfig.getHost() + ":" + ServerConfig.getPort());
    }
}
