package cc.wuersan008.eclairgram;

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;

/**
 * 常驻服务：让 Telegram 连接与更新循环在应用退到后台后继续运行，
 * 这样新消息到达时能弹通知。由 MainActivity 在启动时拉起。
 */
public class TelegramService extends Service {

    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        TelegramManager.get(this).keepUpdating();
        return START_STICKY;
    }
}
