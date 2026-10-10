package cc.wuersan008.eclairgram;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.text.Spannable;
import android.text.SpannableString;
import android.text.style.ImageSpan;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.util.HashMap;

/**
 * Blobmoji 彩色 emoji 渲染。
 *
 * Android 2.1–4.0 的字体引擎不支持 CBDT/CBLC 彩色字体，无法直接用 Typeface
 * 渲染 Blobmoji。这里改为：构建期把 emoji 位图抽成 emoji.pack（见
 * scripts/gen_emoji_pack.py），运行时按码点取图，用 ImageSpan 画到文本里，
 * 于是这些老系统也能显示较新的 emoji。
 */
public final class EmojiFont {

    private static boolean sLoaded;
    private static byte[] sData;
    private static final HashMap<Integer, int[]> INDEX = new HashMap<Integer, int[]>();
    private static final HashMap<Integer, Bitmap> CACHE = new HashMap<Integer, Bitmap>();

    private EmojiFont() {}

    private static int le32(byte[] d, int o) {
        return (d[o] & 0xff) | ((d[o + 1] & 0xff) << 8)
                | ((d[o + 2] & 0xff) << 16) | ((d[o + 3] & 0xff) << 24);
    }

    private static synchronized void ensureLoaded(Context ctx) {
        if (sLoaded) return;
        sLoaded = true;
        try {
            InputStream in = ctx.getAssets().open("emoji.pack");
            ByteArrayOutputStream bos = new ByteArrayOutputStream();
            byte[] buf = new byte[65536];
            int n;
            while ((n = in.read(buf)) > 0) bos.write(buf, 0, n);
            in.close();
            byte[] d = bos.toByteArray();
            if (d.length < 8 || d[0] != 'E' || d[1] != 'C' || d[2] != 'P' || d[3] != '1') return;
            int count = le32(d, 4);
            int off = 8;
            for (int i = 0; i < count && off + 12 <= d.length; i++) {
                int cp = le32(d, off);
                int o = le32(d, off + 4);
                int l = le32(d, off + 8);
                INDEX.put(Integer.valueOf(cp), new int[] { o, l });
                off += 12;
            }
            sData = d;
        } catch (Throwable t) {
            sData = null;
        }
    }

    public static boolean has(int cp) {
        return INDEX.containsKey(Integer.valueOf(cp));
    }

    private static Bitmap get(Context ctx, int cp) {
        ensureLoaded(ctx);
        Bitmap b = CACHE.get(Integer.valueOf(cp));
        if (b != null) return b;
        int[] e = INDEX.get(Integer.valueOf(cp));
        if (e == null || sData == null) return null;
        try {
            b = BitmapFactory.decodeByteArray(sData, e[0], e[1]);
        } catch (Throwable t) {
            return null;
        }
        if (b != null) CACHE.put(Integer.valueOf(cp), b);
        return b;
    }

    /**
     * 把文本里的 emoji 码点替换成 Blobmoji 位图（ImageSpan）。
     * 其它字符保持原样；返回的 CharSequence 可直接 setText。
     */
    public static CharSequence emojify(Context ctx, CharSequence text, int sizePx) {
        if (text == null || text.length() == 0) return text;
        ensureLoaded(ctx);
        if (sData == null) return text;
        SpannableString ss = new SpannableString(text);
        int i = 0, n = text.length();
        while (i < n) {
            int cp = text.charAt(i);
            int cc = 1;
            if (Character.isHighSurrogate((char) cp) && i + 1 < n
                    && Character.isLowSurrogate(text.charAt(i + 1))) {
                cp = Character.toCodePoint((char) cp, text.charAt(i + 1));
                cc = 2;
            }
            if (INDEX.containsKey(Integer.valueOf(cp))) {
                Bitmap b = get(ctx, cp);
                if (b != null) {
                    Drawable d = new BitmapDrawable(ctx.getResources(), b);
                    d.setBounds(0, 0, sizePx, sizePx);
                    ss.setSpan(new ImageSpan(d), i, i + cc,
                            Spannable.SPAN_EXCLUSIVE_EXCLUSIVE);
                }
            }
            i += cc;
        }
        return ss;
    }
}
