package cc.wuersan008.eclairgram;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;

import java.io.File;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.Map;

/**
 * 头像缓存：内存 + 磁盘两级。
 *
 * 头像通过 upload.getFile（inputPeerPhotoFileLocation，small 版）下载，
 * 只有几 KB。为免每次启动都重下，下载到的原始字节会写到应用缓存目录，
 * 下次直接解码磁盘文件。
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

    private static File file(Context ctx, long photoId) {
        return new File(ctx.getCacheDir(), "avatar_" + photoId);
    }

    /**
     * 取头像（应在后台线程调用）：内存 -> 磁盘 -> 联网。
     * dcId 是照片所在的文件 DC（来自 userProfilePhoto/chatPhoto 的 dc_id），
     * 可让下载直接连到该 DC，省掉一次 FILE_MIGRATE 往返；0 表示未知。
     */
    public static Bitmap load(Context ctx, TelegramManager tg, byte[] peer,
                              long photoId, int dcId) {
        if (photoId == 0) return null;
        Bitmap cached = get(photoId);
        if (cached != null) return cached;

        File f = file(ctx, photoId);
        if (f.exists() && f.length() > 0) {
            Bitmap b = BitmapFactory.decodeFile(f.getAbsolutePath());
            if (b != null) {
                put(photoId, b);
                return b;
            }
            f.delete();
        }

        try {
            byte[] data = tg.syncDownloadPeerPhoto(peer, photoId, dcId);
            if (data == null || data.length == 0) return null;
            try {
                FileOutputStream out = new FileOutputStream(f);
                out.write(data);
                out.close();
            } catch (Throwable ignored) {
            }
            Bitmap b = BitmapFactory.decodeByteArray(data, 0, data.length);
            if (b != null) put(photoId, b);
            return b;
        } catch (Throwable e) {
            return null;
        }
    }
}
