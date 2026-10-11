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
 * 另外，Android 4.0 之前不能解码 WebP（贴纸缩略图就是 WebP），遇到这种数据
 * 直接标记为失败，不再反复重试下载。
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
    private static final ExecutorService POOL = Executors.newFixedThreadPool(4);
    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    private ThumbCache() {}

    public static Bitmap get(String key) {
        if (key == null) return null;
        synchronized (CACHE) {
            return CACHE.get(key);
        }
    }

    /** 该 key 是否已彻底失败（下载失败多次，或数据无法解码）。 */
    public static boolean isFailed(String key) {
        if (key == null) return false;
        synchronized (CACHE) {
            return FAILED.contains(key);
        }
    }

    /**
     * 取缩略图：命中缓存立即回调；否则后台下载 + 解码。
     * dcId 是文件所在 DC（来自 document/photo 的 dc_id，0 表示未知），
     * 已知时直接连过去，省掉一次 FILE_MIGRATE 往返。
     * inline 非空时直接用内联字节（photoCachedSize），不发起网络请求。
     */
    public static void load(final Context ctx, final String key, final byte[] location,
                            final int dcId, final byte[] inline, final int maxPx, final Listener l) {
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
                boolean undecodable = false;
                try {
                    byte[] data = (inline != null && inline.length > 0)
                            ? inline
                            : TelegramManager.get(app).syncDownloadLocation(location, dcId);
                    if (data != null && data.length > 0) {
                        out = decode(data, maxPx);
                        if (out == null) undecodable = isWebp(data);
                    }
                } catch (Throwable t) {
                    // 下载失败：下面按次数重试
                }
                synchronized (CACHE) {
                    LOADING.remove(key);
                    if (out != null) {
                        CACHE.put(key, out);
                        FAILS.remove(key);
                    } else if (undecodable) {
                        // 老系统解不了 WebP：重试也没有意义，直接放弃
                        FAILED.add(key);
                    } else {
                        // 网络/迁移可能瞬时失败，允许重试几次
                        Integer n = FAILS.get(key);
                        int c = (n == null ? 0 : n.intValue()) + 1;
                        FAILS.put(key, Integer.valueOf(c));
                        if (c >= MAX_ATTEMPTS) FAILED.add(key);
                        // 防止这两个集合在长会话里无限增长
                        if (FAILS.size() > 256) FAILS.clear();
                        if (FAILED.size() > 256) FAILED.clear();
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

    private static boolean isWebp(byte[] d) {
        return d != null && d.length >= 12
                && d[0] == 'R' && d[1] == 'I' && d[2] == 'F' && d[3] == 'F'
                && d[8] == 'W' && d[9] == 'E' && d[10] == 'B' && d[11] == 'P';
    }

    private static Bitmap decode(byte[] data, int maxPx) {
        // WebP（贴纸缩略图）在 Android 4.0 之前 BitmapFactory 解不了，
        // 用随 APK 打包的 libwebp 解（见 WebpNative / native/build_libwebp.sh）。
        if (isWebp(data)) {
            Bitmap b = WebpNative.decode(data);
            if (b != null) return scaleDown(b, maxPx);
            // libwebp 不可用（非 ARM 设备等）：继续走 BitmapFactory（4.0+ 支持 WebP）
        }
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

    private static Bitmap scaleDown(Bitmap b, int maxPx) {
        if (b == null || maxPx <= 0) return b;
        int longest = Math.max(b.getWidth(), b.getHeight());
        if (longest <= maxPx) return b;
        float s = (float) maxPx / longest;
        int w = Math.max(1, (int) (b.getWidth() * s));
        int h = Math.max(1, (int) (b.getHeight() * s));
        Bitmap scaled = Bitmap.createScaledBitmap(b, w, h, true);
        if (scaled != b) b.recycle();
        return scaled;
    }
}
