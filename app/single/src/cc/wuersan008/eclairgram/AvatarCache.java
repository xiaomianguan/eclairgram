package cc.wuersan008.eclairgram;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;

import java.util.HashMap;
import java.util.Map;

/**
 * 头像内存缓存：以 Telegram 的 photo_id 为键。
 *
 * 头像通过 upload.getFile（inputPeerPhotoFileLocation）下载，解码后缓存；
 * 找不到时界面回退到 Talk 的默认头像 ic_contact_picture。
 */
public final class AvatarCache {

    private static final Map<Long, Bitmap> CACHE = new HashMap<Long, Bitmap>();

    private AvatarCache() {}

    public static synchronized Bitmap get(long photoId) {
        return photoId == 0 ? null : CACHE.get(Long.valueOf(photoId));
    }

    public static synchronized boolean has(long photoId) {
        return photoId != 0 && CACHE.containsKey(Long.valueOf(photoId));
    }

    public static synchronized void put(long photoId, Bitmap b) {
        if (photoId != 0 && b != null) CACHE.put(Long.valueOf(photoId), b);
    }

    /** 下载并解码（应在后台线程调用）；返回 null 表示没有头像。 */
    public static Bitmap load(TelegramManager tg, byte[] peer, long photoId) {
        if (photoId == 0) return null;
        Bitmap cached = get(photoId);
        if (cached != null) return cached;
        try {
            byte[] data = tg.syncDownloadPeerPhoto(peer, photoId);
            if (data == null || data.length == 0) return null;
            Bitmap b = BitmapFactory.decodeByteArray(data, 0, data.length);
            if (b != null) put(photoId, b);
            return b;
        } catch (Throwable e) {
            return null;
        }
    }
}
