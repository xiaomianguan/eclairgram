package cc.wuersan008.eclairgram;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Handler;
import android.os.Looper;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * 消息内联缩略图缓存。
 *
 * 图片取 Telegram 的某个较小 PhotoSize，视频取 document 的 thumb；
 * 有些视频缩略图是 photoCachedSize，直接带内联字节，无需下载。
 * 下载/解码在后台（两条工作线程），结果按 key 缓存，回调回主线程。
 *
 * 老设备内存紧张：解码成 RGB_565 并限制缓存条数。
 */
public final class ThumbCache {

    public interface Listener {
        void onThumb(String key, Bitmap bitmap);
    }

    private static final int MAX_ENTRIES = 24;

    private static final Map<String, Bitmap> CACHE =
            new LinkedHashMap<String, Bitmap>(16, 0.75f, true) {
                @Override
                protected boolean removeEldestEntry(Map.Entry<String, Bitmap> eldest) {
                    return size() > MAX_ENTRIES;
                }
            };
    private static final int MAX_ATTEMPTS = 3;
    private static final Set<String> LOADING = new HashSet<String>();
    private static final Set<String> FAILED = new HashSet<String>();
    private static final Map<String, Integer> FAILS = new HashMap<String, Integer>();
    private static final ExecutorService POOL = Executors.newFixedThreadPool(2);
    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    private ThumbCache() {}

    public static Bitmap get(String key) {
        if (key == null) return null;
        synchronized (CACHE) {
            return CACHE.get(key);
        }
    }

    /**
     * 取缩略图：命中缓存立即回调；否则后台下载 + 解码。
     * inline 非空时直接用内联字节（photoCachedSize），不发起网络请求。
     */
    public static void load(final Context ctx, final String key, final byte[] location,
                            final byte[] inline, final int maxPx, final Listener l) {
        if (key == null || l == null) return;
        Bitmap cached = get(key);
        if (cached != null) {
            l.onThumb(key, cached);
            return;
        }
        synchronized (CACHE) {
            if (LOADING.contains(key) || FAILED.contains(key)) return;
            LOADING.add(key);
        }
        final Context app = ctx.getApplicationContext();
        POOL.execute(new Runnable() {
            public void run() {
                Bitmap out = null;
                try {
                    byte[] data = (inline != null && inline.length > 0)
                            ? inline
                            : TelegramManager.get(app).syncDownloadLocation(location);
                    if (data != null && data.length > 0) out = decode(data, maxPx);
                } catch (Throwable t) {
                    // 失败：下次不再重试，避免每 4 秒轮询都重下
                }
                synchronized (CACHE) {
                    LOADING.remove(key);
                    if (out != null) {
                        CACHE.put(key, out);
                        FAILS.remove(key);
                    } else {
                        // 允许重试几次（网络/迁移可能瞬时失败），仍失败才彻底放弃
                        Integer n = FAILS.get(key);
                        int c = (n == null ? 0 : n.intValue()) + 1;
                        FAILS.put(key, Integer.valueOf(c));
                        if (c >= MAX_ATTEMPTS) FAILED.add(key);
                    }
                }
                final Bitmap fb = out;
                MAIN.post(new Runnable() {
                    public void run() {
                        l.onThumb(key, fb);
                    }
                });
            }
        });
    }

    private static Bitmap decode(byte[] data, int maxPx) {
        BitmapFactory.Options o = new BitmapFactory.Options();
        o.inJustDecodeBounds = true;
        BitmapFactory.decodeByteArray(data, 0, data.length, o);
        int longest = Math.max(o.outWidth, o.outHeight);
        int sample = 1;
        while (maxPx > 0 && longest / (sample * 2) >= maxPx) sample *= 2;
        o.inJustDecodeBounds = false;
        o.inSampleSize = sample;
        o.inPreferredConfig = Bitmap.Config.RGB_565;
        return BitmapFactory.decodeByteArray(data, 0, data.length, o);
    }
}
