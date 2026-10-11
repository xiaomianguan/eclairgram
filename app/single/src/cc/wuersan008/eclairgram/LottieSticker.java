package cc.wuersan008.eclairgram;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;

import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * 动图贴纸（TGS）的下载与解析缓存。
 *
 * 贴纸文档本身就是 gzip 后的 Lottie JSON（几 KB），下载后交给 {@link Lottie} 解析，
 * 结果按 key 缓存（有界 LRU）。解析在后台线程，回调回主线程。
 */
public final class LottieSticker {

    public interface Listener {
        void onLottie(String key, Lottie lottie);
    }

    private static final int MAX = 12;
    private static final Map<String, Lottie> CACHE =
            new LinkedHashMap<String, Lottie>(16, 0.75f, true) {
                @Override
                protected boolean removeEldestEntry(Map.Entry<String, Lottie> e) {
                    return size() > MAX;
                }
            };
    private static final Set<String> LOADING = new HashSet<String>();
    private static final Set<String> FAILED = new HashSet<String>();
    private static final ExecutorService POOL = Executors.newFixedThreadPool(2);
    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    private LottieSticker() {}

    public static Lottie get(String key) {
        if (key == null) return null;
        synchronized (CACHE) {
            return CACHE.get(key);
        }
    }

    public static boolean isLoading(String key) {
        synchronized (CACHE) {
            return LOADING.contains(key);
        }
    }

    public static boolean isFailed(String key) {
        synchronized (CACHE) {
            return FAILED.contains(key);
        }
    }

    /** 下载并解析一个 TGS；location 是贴纸文档的 InputFileLocation（空 thumb 类型）。 */
    public static void load(final Context ctx, final String key, final byte[] location,
                            final Listener l) {
        if (key == null || location == null) return;
        synchronized (CACHE) {
            if (CACHE.containsKey(key) || LOADING.contains(key) || FAILED.contains(key)) return;
            LOADING.add(key);
        }
        final Context app = ctx.getApplicationContext();
        POOL.execute(new Runnable() {
            public void run() {
                Lottie out = null;
                try {
                    byte[] tgs = TelegramManager.get(app).syncDownloadLocation(location);
                    if (tgs != null && tgs.length > 0) out = Lottie.parse(tgs);
                } catch (Throwable t) {
                    // 失败：不再重试
                }
                synchronized (CACHE) {
                    LOADING.remove(key);
                    if (out != null) CACHE.put(key, out);
                    else if (FAILED.size() < 128) FAILED.add(key);
                }
                final Lottie fo = out;
                MAIN.post(new Runnable() {
                    public void run() {
                        l.onLottie(key, fo);
                    }
                });
            }
        });
    }
}
