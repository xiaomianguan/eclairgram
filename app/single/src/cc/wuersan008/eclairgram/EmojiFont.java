package cc.wuersan008.eclairgram;

import android.content.Context;
import android.content.res.AssetFileDescriptor;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.text.Spannable;
import android.text.SpannableString;
import android.text.style.ImageSpan;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.InputStream;
import java.nio.MappedByteBuffer;
import java.nio.channels.FileChannel;
import java.util.Arrays;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Blobmoji 彩色 emoji 渲染。
 *
 * Android 2.1–4.0 的字体引擎不支持 CBDT/CBLC 彩色字体，无法直接用 Typeface
 * 渲染 Blobmoji。这里改为：构建期把 emoji 位图抽成 emoji.pack（见
 * scripts/gen_emoji_pack.py），运行时按码点取图，用 ImageSpan 画到文本里，
 * 于是这些老系统也能显示较新的 emoji。
 *
 * 内存：emoji.pack 有 ~2.5 MB，绝不能整体读进 Java 堆（老设备堆只有 16–24 MB）。
 * 资源在 APK 里是**未压缩**存储的，因此用 {@link AssetFileDescriptor} 直接 mmap
 * 成 off-heap 的 {@link MappedByteBuffer}；只有索引（~17 KB）在堆里。解码出的
 * 位图与 Drawable 都用有界 LRU 缓存，避免在 emoji 密集的界面里无限增长。
 */
public final class EmojiFont {

    private static final int HEADER = 8;
    private static final int ENTRY = 13;

    private static boolean sLoaded;
    private static AssetFileDescriptor sAfd;
    private static FileInputStream sStream;  // 持有映射的流，避免 FD 被提前回收
    private static MappedByteBuffer sMap;    // off-heap 的 pack（优先）
    private static byte[] sHeap;             // mmap 不可用时的回退

    // 按码点排序的索引（二分查找，避免 Integer 装箱）
    private static int[] sCodes;
    private static int[] sOff;
    private static int[] sLen;
    private static byte[] sCat;
    private static int[] sOrder;             // pack 顺序（供表情选择器）

    private static final int BMP_MAX = 32;
    private static final Map<Integer, Bitmap> CACHE =
            new LinkedHashMap<Integer, Bitmap>(16, 0.75f, true) {
                @Override
                protected boolean removeEldestEntry(Map.Entry<Integer, Bitmap> e) {
                    return size() > BMP_MAX;
                }
            };

    private static final int DRAW_MAX = 64;
    private static final Map<Long, Drawable> DRAWABLES =
            new LinkedHashMap<Long, Drawable>(16, 0.75f, true) {
                @Override
                protected boolean removeEldestEntry(Map.Entry<Long, Drawable> e) {
                    return size() > DRAW_MAX;
                }
            };

    private EmojiFont() {}

    private static int byteAt(int i) {
        return sMap != null ? (sMap.get(i) & 0xff) : (sHeap[i] & 0xff);
    }

    private static int le32At(int o) {
        return byteAt(o) | (byteAt(o + 1) << 8) | (byteAt(o + 2) << 16) | (byteAt(o + 3) << 24);
    }

    private static synchronized void ensureLoaded(Context ctx) {
        if (sLoaded) return;
        sLoaded = true;
        try {
            sAfd = ctx.getAssets().openFd("emoji.pack");
            long start = sAfd.getStartOffset();
            long len = sAfd.getLength();
            if (len > 0) {
                FileInputStream fis = new FileInputStream(sAfd.getFileDescriptor());
                sMap = fis.getChannel().map(FileChannel.MapMode.READ_ONLY, start, len);
                sStream = fis;
            }
        } catch (Throwable t) {
            sMap = null;
        }
        if (sMap == null) {
            try {
                InputStream in = ctx.getAssets().open("emoji.pack");
                ByteArrayOutputStream bos = new ByteArrayOutputStream(262144);
                byte[] buf = new byte[65536];
                int n;
                while ((n = in.read(buf)) > 0) bos.write(buf, 0, n);
                in.close();
                sHeap = bos.toByteArray();
            } catch (Throwable t) {
                sHeap = null;
            }
        }
        if (sMap == null && sHeap == null) return;
        parseIndex();
    }

    private static void parseIndex() {
        try {
            int len = sMap != null ? sMap.capacity() : sHeap.length;
            if (len < HEADER) return;
            if (byteAt(0) != 'E' || byteAt(1) != 'C' || byteAt(2) != 'P' || byteAt(3) != '2') return;
            int count = le32At(4);
            if (count <= 0 || HEADER + (long) count * ENTRY > len) return;

            final int[] rawCodes = new int[count];
            final int[] rawOff = new int[count];
            final int[] rawLen = new int[count];
            final byte[] rawCat = new byte[count];
            int[] order = new int[count];
            int p = HEADER;
            for (int i = 0; i < count; i++) {
                order[i] = le32At(p);
                rawCodes[i] = order[i];
                rawOff[i] = le32At(p + 4);
                rawLen[i] = le32At(p + 8);
                rawCat[i] = (byte) byteAt(p + 12);
                p += ENTRY;
            }
            Integer[] idx = new Integer[count];
            for (int i = 0; i < count; i++) idx[i] = Integer.valueOf(i);
            Arrays.sort(idx, new Comparator<Integer>() {
                public int compare(Integer a, Integer b) {
                    return rawCodes[a.intValue()] - rawCodes[b.intValue()];
                }
            });
            int[] codes = new int[count];
            int[] off = new int[count];
            int[] ln = new int[count];
            byte[] cat = new byte[count];
            for (int i = 0; i < count; i++) {
                int j = idx[i].intValue();
                codes[i] = rawCodes[j];
                off[i] = rawOff[j];
                ln[i] = rawLen[j];
                cat[i] = rawCat[j];
            }
            sCodes = codes;
            sOff = off;
            sLen = ln;
            sCat = cat;
            sOrder = order;
        } catch (Throwable t) {
            sCodes = null;
        }
    }

    public static boolean has(int cp) {
        int[] codes = sCodes;
        return codes != null && Arrays.binarySearch(codes, cp) >= 0;
    }

    /** 所有可用 emoji 码点（已按分类与组内顺序排好，用于表情选择器）。 */
    public static int[] codepoints(Context ctx) {
        ensureLoaded(ctx);
        return sOrder == null ? new int[0] : sOrder;
    }

    /** 码点所属分类序号（0 表情 ... 8 旗帜, 9 其它）。 */
    public static int category(Context ctx, int cp) {
        ensureLoaded(ctx);
        int i = sCodes == null ? -1 : Arrays.binarySearch(sCodes, cp);
        return i < 0 ? 9 : sCat[i];
    }

    public static Bitmap bitmap(Context ctx, int cp) {
        return get(ctx, cp);
    }

    private static Bitmap get(Context ctx, int cp) {
        ensureLoaded(ctx);
        Integer key = Integer.valueOf(cp);
        synchronized (CACHE) {
            Bitmap b = CACHE.get(key);
            if (b != null) return b;
        }
        int i = sCodes == null ? -1 : Arrays.binarySearch(sCodes, cp);
        if (i < 0) return null;
        byte[] data = readData(sOff[i], sLen[i]);
        if (data == null) return null;
        Bitmap b;
        try {
            b = BitmapFactory.decodeByteArray(data, 0, data.length);
        } catch (Throwable t) {
            return null;
        }
        if (b != null) {
            synchronized (CACHE) {
                CACHE.put(key, b);
            }
        }
        return b;
    }

    private static byte[] readData(int off, int len) {
        if (len <= 0) return null;
        try {
            byte[] b = new byte[len];
            if (sMap != null) {
                for (int i = 0; i < len; i++) b[i] = sMap.get(off + i);
            } else {
                System.arraycopy(sHeap, off, b, 0, len);
            }
            return b;
        } catch (Throwable t) {
            return null;
        }
    }

    /** 取一个可复用的 emoji Drawable（按码点 + 尺寸缓存，避免每次绑定都新建）。 */
    private static Drawable drawable(Context ctx, int cp, int sizePx) {
        long key = ((long) cp << 20) | (sizePx & 0xfffff);
        Long k = Long.valueOf(key);
        synchronized (DRAWABLES) {
            Drawable d = DRAWABLES.get(k);
            if (d != null) return d;
        }
        Bitmap b = get(ctx, cp);
        if (b == null) return null;
        BitmapDrawable d = new BitmapDrawable(ctx.getResources(), b);
        d.setBounds(0, 0, sizePx, sizePx);
        synchronized (DRAWABLES) {
            DRAWABLES.put(k, d);
        }
        return d;
    }

    /**
     * 把文本里的 emoji 码点替换成 Blobmoji 位图（ImageSpan）。
     * 其它字符保持原样；返回的 CharSequence 可直接 setText。
     */
    public static CharSequence emojify(Context ctx, CharSequence text, int sizePx) {
        if (text == null || text.length() == 0) return text;
        ensureLoaded(ctx);
        if (sCodes == null) return text;
        if (!hasEmoji(text)) return text;      // 纯文本：不分配 SpannableString
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
            if (has(cp)) {
                Drawable d = drawable(ctx, cp, sizePx);
                if (d != null) {
                    ss.setSpan(new ImageSpan(d), i, i + cc, Spannable.SPAN_EXCLUSIVE_EXCLUSIVE);
                }
            }
            i += cc;
        }
        return ss;
    }

    /** 直接在可编辑文本上刷新 emoji 位图（用于输入框，不改变文本本身）。 */
    public static void applyToEditable(Context ctx, Spannable s, int sizePx) {
        if (s == null) return;
        ensureLoaded(ctx);
        if (sCodes == null) return;
        ImageSpan[] old = s.getSpans(0, s.length(), ImageSpan.class);
        for (ImageSpan o : old) s.removeSpan(o);
        int i = 0, n = s.length();
        while (i < n) {
            int cp = s.charAt(i);
            int cc = 1;
            if (Character.isHighSurrogate((char) cp) && i + 1 < n
                    && Character.isLowSurrogate(s.charAt(i + 1))) {
                cp = Character.toCodePoint((char) cp, s.charAt(i + 1));
                cc = 2;
            }
            if (has(cp)) {
                Drawable d = drawable(ctx, cp, sizePx);
                if (d != null) {
                    s.setSpan(new ImageSpan(d), i, i + cc, Spannable.SPAN_EXCLUSIVE_EXCLUSIVE);
                }
            }
            i += cc;
        }
    }

    /** 文本里是否含有 pack 覆盖的 emoji（先粗筛，避免为纯文本建 SpannableString）。 */
    private static boolean hasEmoji(CharSequence text) {
        int[] codes = sCodes;
        int n = text.length();
        for (int i = 0; i < n; i++) {
            char c = text.charAt(i);
            if (c < 0x00a9) continue;                 // 常见 ASCII 快速跳过
            if (Character.isHighSurrogate(c)) {
                if (i + 1 < n && Character.isLowSurrogate(text.charAt(i + 1))) {
                    if (Arrays.binarySearch(codes,
                            Character.toCodePoint(c, text.charAt(i + 1))) >= 0) return true;
                    i++;
                }
                continue;
            }
            if (Character.isLowSurrogate(c)) continue;
            if (Arrays.binarySearch(codes, c) >= 0) return true;
        }
        return false;
    }
}
