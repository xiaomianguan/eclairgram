package cc.wuersan008.eclairgram;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;

/**
 * 新消息通知。
 *
 * 更新循环（{@link TelegramManager}）发现新消息时调用这里，弹出一条系统通知；
 * 点按通知打开对应会话（{@link ChatActivity}）。每个会话一个通知 id，互不覆盖。
 */
public final class Notifications {

    private Notifications() {}

    private static int idFor(long peerId) {
        return (int) (peerId ^ (peerId >>> 32)) & 0x7fffffff;
    }

    /** 弹出一条新消息通知；peerId 用于区分会话，其余字段用来打开对应会话。 */
    public static void message(Context ctx, byte[] peer, String title, String text,
                               long photoId, int type, String username, long peerId,
                               int participants) {
        NotificationManager nm = (NotificationManager)
                ctx.getSystemService(Context.NOTIFICATION_SERVICE);
        if (nm == null || peer == null) return;

        Intent i = new Intent(ctx, ChatActivity.class);
        i.putExtra("peer", peer);
        i.putExtra("name", title);
        i.putExtra("photoId", photoId);
        i.putExtra("type", type);
        i.putExtra("username", username);
        i.putExtra("id", peerId);
        i.putExtra("participants", participants);
        i.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TOP);

        PendingIntent pi = PendingIntent.getActivity(ctx, idFor(peerId), i,
                PendingIntent.FLAG_UPDATE_CURRENT);

        Notification n = new Notification(R.drawable.ic_launcher_eclairgram, title,
                System.currentTimeMillis());
        n.setLatestEventInfo(ctx, title, text, pi);
        n.defaults = Notification.DEFAULT_ALL;
        n.flags |= Notification.FLAG_AUTO_CANCEL;
        nm.notify(idFor(peerId), n);
    }

    /** 清掉本应用的所有通知（进入应用时调用）。 */
    public static void clearAll(Context ctx) {
        NotificationManager nm = (NotificationManager)
                ctx.getSystemService(Context.NOTIFICATION_SERVICE);
        if (nm != null) nm.cancelAll();
    }
}
