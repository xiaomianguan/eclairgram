package cc.wuersan008.eclairgram;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;

import java.io.File;
import java.io.FileOutputStream;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * 头像缓存：内存 + 磁盘两级。
 *
 * 头像通过 upload.getFile（inputPeerPhotoFileLocation，small 版）下载，
 * 只有几 KB。为免每次启动都重下，下载到的原始字节会写到应用缓存目录，
 * 下次直接解码磁盘文件。
 *
 * 老设备内存紧张：内存缓存是有界 LRU，解码时按显示尺寸降采样并转 RGB_565。
 */
public final class AvatarCache {

    private static final int MAX_ENTRIES = 64;
    private static final int MAX_PX = 128;     // 头像最大显示 ~72px，128 足够清晰

    private static final Map<Long, Bitmap> CACHE =
            new LinkedHashMap<Long, Bitmap>(16, 0.75f, true) {
                @Override
                protected boolean removeEldestEntry(Map.Entry<Long, Bitmap> e) {
                    return size() > MAX_ENTRIES;
                }
            };

    private AvatarCache() {}

    public static Bitmap get(long photoId) {
        if (photoId == 0) return null;
        synchronized (CACHE) {
            return CACHE.get(Long.valueOf(photoId));
        }
    }

    public static boolean has(long photoId) {
        if (photoId == 0) return false;
        synchronized (CACHE) {
            return CACHE.containsKey(Long.valueOf(photoId));
        }
    }

    public static void put(long photoId, Bitmap b) {
        if (photoId == 0 || b == null) return;
        synchronized (CACHE) {
            CACHE.put(Long.valueOf(photoId), b);
        }
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
            Bitmap b = decodeFile(f.getAbsolutePath());
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
            Bitmap b = decode(data);
            if (b != null) put(photoId, b);
            return b;
        } catch (Throwable e) {
            return null;
        }
    }

    private static Bitmap decode(byte[] data) {
        try {
            BitmapFactory.Options o = new BitmapFactory.Options();
            o.inJustDecodeBounds = true;
            BitmapFactory.decodeByteArray(data, 0, data.length, o);
            o.inSampleSize = sampleSize(o.outWidth, o.outHeight);
            o.inJustDecodeBounds = false;
            o.inPreferredConfig = Bitmap.Config.RGB_565;
            return BitmapFactory.decodeByteArray(data, 0, data.length, o);
        } catch (Throwable t) {
            return null;
        }
    }

    private static Bitmap decodeFile(String path) {
        try {
            BitmapFactory.Options o = new BitmapFactory.Options();
            o.inJustDecodeBounds = true;
            BitmapFactory.decodeFile(path, o);
            o.inSampleSize = sampleSize(o.outWidth, o.outHeight);
            o.inJustDecodeBounds = false;
            o.inPreferredConfig = Bitmap.Config.RGB_565;
            return BitmapFactory.decodeFile(path, o);
        } catch (Throwable t) {
            return null;
        }
    }

    private static int sampleSize(int w, int h) {
        int longest = Math.max(w, h);
        int sample = 1;
        while (longest / (sample * 2) >= MAX_PX) sample *= 2;
        return sample;
    }
}
