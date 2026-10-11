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
 * 贴纸文档本身就是 gzip 后的 Lottie JSON（几 KB）。解析出的模型比较大，
 * 因此分开缓存：**原始字节**缓存得多一些（便宜），**解析后的模型**只留很少几个
 * （老设备堆只有 16MB）。解析在后台线程，回调回主线程。
 */
public final class LottieSticker {

    public interface Listener {
        void onLottie(String key, Lottie lottie);
    }

    private static final int MAX_MODELS = 4;     // 解析后的模型（每个都不小）
    private static final int MAX_BYTES = 16;     // 原始 TGS 字节（几 KB 一个）

    private static final Map<String, Lottie> CACHE =
            new LinkedHashMap<String, Lottie>(4, 0.75f, true) {
                @Override
                protected boolean removeEldestEntry(Map.Entry<String, Lottie> e) {
                    return size() > MAX_MODELS;
                }
            };
    private static final Map<String, byte[]> BYTES =
            new LinkedHashMap<String, byte[]>(8, 0.75f, true) {
                @Override
                protected boolean removeEldestEntry(Map.Entry<String, byte[]> e) {
                    return size() > MAX_BYTES;
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

    /**
     * 取一个动图贴纸（可能来自模型缓存 / 字节缓存 / 网络）。
     * location 是贴纸文档的 InputFileLocation（空 thumb 类型），dcId 是文件所在 DC。
     */
    public static void load(final Context ctx, final String key, final byte[] location,
                            final int dcId, final Listener l) {
        if (key == null || l == null) return;
        synchronized (CACHE) {
            Lottie cached = CACHE.get(key);
            if (cached != null) {
                l.onLottie(key, cached);
                return;
            }
            if (FAILED.contains(key) || LOADING.contains(key)) return;
            if (location == null && !BYTES.containsKey(key)) return;
            LOADING.add(key);
        }
        final Context app = ctx.getApplicationContext();
        POOL.execute(new Runnable() {
            public void run() {
                Lottie out = null;
                try {
                    byte[] tgs = null;
                    synchronized (CACHE) {
                        tgs = BYTES.get(key);
                    }
                    if (tgs == null) {
                        tgs = TelegramManager.get(app).syncDownloadLocation(location, dcId);
                        if (tgs != null && tgs.length > 0) {
                            synchronized (CACHE) {
                                BYTES.put(key, tgs);
                            }
                        }
                    }
                    if (tgs != null && tgs.length > 0) {
                        // org.json 会为整份 JSON 建一棵临时对象树（几百 KB~上 MB）。
                        // 老设备堆很小，解析前先看堆：太满就先回收，避免建树时 OOM。
                        Runtime rt = Runtime.getRuntime();
                        long max = rt.maxMemory();
                        if (max > 0 && rt.totalMemory() > max / 2) System.gc();
                        out = Lottie.parse(tgs);
                        System.gc();   // 解析完立刻回收那棵树
                    }
                } catch (Throwable t) {
                    // 含 OutOfMemoryError：当作失败，别再重试
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
