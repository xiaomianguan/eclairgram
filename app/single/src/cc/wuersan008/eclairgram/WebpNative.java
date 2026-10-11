package cc.wuersan008.eclairgram;

import android.graphics.Bitmap;

/**
 * libwebp 的 JNI 封装：把 WebP 图片解成 {@link Bitmap}。
 *
 * 为什么需要：Android 4.0 之前系统不支持 WebP，而 Telegram 的贴纸缩略图正好是
 * WebP（VP8X+ALPH+VP8），BitmapFactory 解不了。这里用随 APK 打包的 libwebp
 * （见 native/build_libwebp.sh）解出 RGBA，再转成位图。
 *
 * 4.0+ 也能用（armeabi 库在 ARMv7 设备上照常加载）；加载失败时调用方会退回
 * BitmapFactory。
 */
public final class WebpNative {

    private static boolean sTried;
    private static boolean sOk;

    private WebpNative() {}

    private static synchronized boolean load() {
        if (sTried) return sOk;
        sTried = true;
        try {
            System.loadLibrary("eclairwebp");
            sOk = true;
        } catch (Throwable t) {
            sOk = false;   // 非 ARM、库缺失等：退回 BitmapFactory
        }
        return sOk;
    }

    /** 原生解码是否可用。 */
    public static boolean available() {
        return load();
    }

    /**
     * 解码一张 WebP。返回 ARGB_8888 位图；不支持或失败时返回 null。
     * 数据较短时直接返回（省一次 JNI 调用）。
     */
    public static Bitmap decode(byte[] data) {
        if (data == null || data.length < 12 || !load()) return null;
        try {
            int[] r = decodeRgba(data);
            if (r == null || r.length < 2) return null;
            int w = r[0], h = r[1];
            if (w <= 0 || h <= 0 || r.length < 2 + w * h) return null;
            return Bitmap.createBitmap(r, 2, w, w, h, Bitmap.Config.ARGB_8888);
        } catch (Throwable t) {
            return null;
        }
    }

    // 返回 [width, height, ARGB...]
    private static native int[] decodeRgba(byte[] data);

    /** libwebp 解码器版本（调试用）。 */
    public static native int version();
}
