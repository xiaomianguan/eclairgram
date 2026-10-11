package cc.wuersan008.eclairgram;

import android.app.Dialog;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.drawable.ColorDrawable;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;

import java.util.ArrayList;
import java.util.List;

import cc.wuersan008.eclairgram.mtproto.MtpClient;
import cc.wuersan008.eclairgram.mtproto.TlObject;

/**
 * 贴纸选择器：网格显示最近/常用贴纸与已安装贴纸包，点按发送。
 *
 * 加载策略（解决老设备上“打开要等很久”）：
 *  1. 先取 {@code messages.getRecentStickers}（Telegram 记录的使用情况），
 *     按使用时间倒序放在最前面——即“最常用的在最上面”；
 *  2. 再逐个拉取已安装的贴纸包，**每拉完一个包就立刻显示**，不必等全部拉完；
 *  3. 缩略图逐张下载，下载到一张就显示一张。
 *
 * 老系统字体/图片库不支持 webp，贴纸用文档自带的缩略图（JPEG），走 {@link ThumbCache}。
 */
public final class StickerPicker extends Dialog {

    public interface Listener {
        void onSticker(long id, long accessHash, byte[] fileRef);
    }

    private static final int COLS = 4;
    private static final int MAX_SETS = 8;   // 上限，避免一次拉太多包

    private final Listener listener;
    private final List<Sticker> stickers = new ArrayList<Sticker>();
    private final List<int[]> rows = new ArrayList<int[]>();
    private final Handler main = new Handler(Looper.getMainLooper());
    private final int cellPx;
    private final ListView list;
    private final Adapter adapter;

    static final class Sticker {
        long id;
        long accessHash;
        byte[] fileRef;
        byte[] thumbLocation;
        String thumbKey;
        int dcId;      // 文档所在 DC（直连省一次 FILE_MIGRATE）
        int emojiCp;   // documentAttributeSticker.alt 的第一个码点（老系统无法显示 WebP 时兜底）
    }

    public StickerPicker(Context ctx, Listener l) {
        super(ctx);
        this.listener = l;
        this.cellPx = dp(56);
        setTitle(R.string.ec_stickers);

        list = new ListView(ctx);
        list.setDivider(null);
        list.setDividerHeight(0);
        list.setCacheColorHint(0);
        list.setSelector(new ColorDrawable(0x00000000));
        // 让 D-pad 焦点能进入网格里的单元格：每个贴纸格是 focusable 的 ImageView，
        // 不打开这个开关时 ListView 只让整行获得焦点，按确定键不会触发发送。
        list.setItemsCanFocus(true);
        adapter = new Adapter();
        list.setAdapter(adapter);
        setContentView(list);
        load();
    }

    private void load() {
        new Thread(new Runnable() {
            public void run() {
                TelegramManager tg = TelegramManager.get(getContext());
                String err = null;

                // 1) 最近/常用贴纸：放最前面
                try {
                    List<Sticker> recent = parseRecent(tg.syncGetRecentStickers());
                    if (!recent.isEmpty()) append(recent);
                } catch (Throwable t) {
                    err = String.valueOf(t.getMessage());
                }

                // 2) 已安装的贴纸包：一个一个拉，拉到一个显示一个
                try {
                    TlObject res = tg.syncGetAllStickers();
                    List<Object> sets = res.list("sets");
                    if (sets == null) sets = res.list("stickers");
                    if (sets != null) {
                        int n = 0;
                        for (Object o : sets) {
                            if (n >= MAX_SETS) break;
                            TlObject s = (TlObject) o;
                            long sid = s.i64("id");
                            long sah = s.i64("access_hash");
                            n++;
                            List<Sticker> pack;
                            try {
                                pack = parseSet(tg.syncGetStickerSet(sid, sah));
                            } catch (Throwable t) {
                                continue;
                            }
                            if (!pack.isEmpty()) append(pack);
                        }
                    }
                } catch (Throwable t) {
                    if (err == null) err = String.valueOf(t.getMessage());
                }

                final String ferr = err;
                main.post(new Runnable() {
                    public void run() {
                        if (stickers.isEmpty()) {
                            android.widget.Toast.makeText(getContext(),
                                    ferr == null
                                            ? getContext().getString(R.string.ec_stickers_none)
                                            : getContext().getString(R.string.ec_status_error, ferr),
                                    android.widget.Toast.LENGTH_SHORT).show();
                        }
                    }
                });
            }
        }).start();
    }

    /** 后台解析出一个包后，回主线程追加显示（加载一个包就显示一个包）。 */
    private void append(final List<Sticker> add) {
        main.post(new Runnable() {
            public void run() {
                stickers.addAll(add);
                buildRows();
                adapter.notifyDataSetChanged();
            }
        });
    }

    /** messages.recentStickers：按使用时间倒序（最常用/最新的在最前）。 */
    private static List<Sticker> parseRecent(TlObject res) {
        List<Sticker> out = new ArrayList<Sticker>();
        if (res == null || !res.type().equals("messages.recentStickers")) return out;
        final List<Object> docs = res.list("stickers");
        final List<Object> dates = res.list("dates");
        if (docs == null) return out;

        Integer[] idx = new Integer[docs.size()];
        for (int i = 0; i < idx.length; i++) idx[i] = Integer.valueOf(i);
        java.util.Arrays.sort(idx, new java.util.Comparator<Integer>() {
            public int compare(Integer a, Integer b) {
                return dateAt(dates, b.intValue()) - dateAt(dates, a.intValue());
            }
        });
        for (Integer i : idx) {
            Sticker st = stickerFrom((TlObject) docs.get(i.intValue()));
            if (st != null) out.add(st);
        }
        return out;
    }

    private static int dateAt(List<Object> dates, int i) {
        if (dates == null || i < 0 || i >= dates.size()) return 0;
        Object o = dates.get(i);
        return o instanceof Number ? ((Number) o).intValue() : 0;
    }

    /** messages.stickerSet：一个包里的文档列表。 */
    private static List<Sticker> parseSet(TlObject full) {
        List<Sticker> out = new ArrayList<Sticker>();
        if (full == null) return out;
        List<Object> docs = full.list("documents");
        if (docs == null) return out;
        for (Object od : docs) {
            TlObject doc = (TlObject) od;
            if (!doc.type().equals("document")) continue;
            Sticker st = stickerFrom(doc);
            if (st != null) out.add(st);
        }
        return out;
    }

    private static Sticker stickerFrom(TlObject doc) {
        Object[] th = thumbOf(doc);
        if (th == null) return null;
        Sticker st = new Sticker();
        st.id = doc.i64("id");
        st.accessHash = doc.i64("access_hash");
        Object ref = doc.get("file_reference");
        st.fileRef = (ref instanceof byte[]) ? (byte[]) ref : new byte[0];
        st.thumbLocation = MtpClient.documentFileLocation(
                st.id, st.accessHash, st.fileRef, (String) th[1]);
        st.thumbKey = "st" + st.id + ":" + th[1];
        st.dcId = doc.i32("dc_id");
        st.emojiCp = emojiOf(doc);
        return st;
    }

    /** 取 documentAttributeSticker.alt 里的第一个 emoji 码点。 */
    private static int emojiOf(TlObject doc) {
        List<Object> attrs = doc.list("attributes");
        if (attrs == null) return 0;
        for (Object o : attrs) {
            TlObject a = (TlObject) o;
            if (!a.type().equals("documentAttributeSticker")) continue;
            String alt = a.str("alt");
            if (alt != null && alt.length() > 0) return alt.codePointAt(0);
        }
        return 0;
    }

    private void buildRows() {
        rows.clear();
        int[] cur = new int[COLS];
        int c = 0;
        for (int i = 0; i < stickers.size(); i++) {
            cur[c++] = i;
            if (c == COLS) {
                rows.add(cur);
                cur = new int[COLS];
                c = 0;
            }
        }
        if (c > 0) {
            int[] last = new int[c];
            System.arraycopy(cur, 0, last, 0, c);
            rows.add(last);
        }
    }

    /** 贴纸缩略图：取最大的可下载尺寸 {内联|null, type, w, h}。 */
    private static Object[] thumbOf(TlObject doc) {
        List<Object> thumbs = doc.list("thumbs");
        if (thumbs == null) return null;
        byte[] inline = null;
        int iw = 0, ih = 0;
        String big = null;
        int bigArea = 0, bw = 0, bh = 0;
        for (Object o : thumbs) {
            TlObject s = (TlObject) o;
            String t = s.type();
            int w = s.i32("w"), h = s.i32("h");
            if (t.equals("photoCachedSize")) {
                Object b = s.get("bytes");
                if (inline == null && b instanceof byte[] && ((byte[]) b).length > 0) {
                    inline = (byte[]) b;
                    iw = w;
                    ih = h;
                }
            } else if (t.equals("photoSize") || t.equals("photoSizeProgressive")) {
                int area = w * h;
                if (area >= bigArea) {
                    bigArea = area;
                    big = s.str("type");
                    bw = w;
                    bh = h;
                }
            }
        }
        if (big != null) {
            return new Object[] { null, big, Integer.valueOf(bw), Integer.valueOf(bh) };
        }
        if (inline != null) {
            return new Object[] { inline, "cached", Integer.valueOf(iw), Integer.valueOf(ih) };
        }
        return null;
    }

    private int dp(int v) {
        return (int) (v * getContext().getResources().getDisplayMetrics().density + 0.5f);
    }

    /** 缩略图到货：只更新当前显示该 key 的可见单元格，避免整表重绑。 */
    private void updateThumb(String key, Bitmap bmp) {
        for (int i = 0; i < list.getChildCount(); i++) {
            View rowV = list.getChildAt(i);
            if (!(rowV instanceof LinearLayout)) continue;
            LinearLayout ll = (LinearLayout) rowV;
            for (int c = 0; c < ll.getChildCount(); c++) {
                View cell = ll.getChildAt(c);
                Object tag = cell.getTag();
                if (tag instanceof Sticker && key.equals(((Sticker) tag).thumbKey)) {
                    Sticker st = (Sticker) tag;
                    ((ImageView) cell).setImageBitmap(bmp != null ? bmp : fallback(st));
                }
            }
        }
    }

    /** 无法显示缩略图时的兜底：用贴纸对应的 emoji（老系统解不了 WebP）。 */
    private Bitmap fallback(Sticker st) {
        return st.emojiCp == 0 ? null : EmojiFont.bitmap(getContext(), st.emojiCp);
    }

    // 复用的点击监听：从 tag 取当前单元格对应的贴纸
    private final View.OnClickListener click = new View.OnClickListener() {
        public void onClick(View v) {
            Object o = v.getTag();
            if (o instanceof Sticker) {
                Sticker st = (Sticker) o;
                listener.onSticker(st.id, st.accessHash, st.fileRef);
                dismiss();
            }
        }
    };

    private final class Adapter extends BaseAdapter {
        public int getCount() {
            return rows.size();
        }

        public Object getItem(int i) {
            return rows.get(i);
        }

        public long getItemId(int i) {
            return i;
        }

        public View getView(int pos, View convertView, ViewGroup parent) {
            LinearLayout row;
            if (convertView instanceof LinearLayout) {
                row = (LinearLayout) convertView;      // 复用整行
            } else {
                row = new LinearLayout(getContext());
                row.setOrientation(LinearLayout.HORIZONTAL);
            }
            int[] idx = rows.get(pos);
            int need = idx.length;
            while (row.getChildCount() > need) {
                row.removeViewAt(row.getChildCount() - 1);
            }
            while (row.getChildCount() < need) {
                ImageView iv = new ImageView(getContext());
                iv.setLayoutParams(new LinearLayout.LayoutParams(cellPx, cellPx));
                iv.setScaleType(ImageView.ScaleType.FIT_CENTER);
                iv.setPadding(dp(6), dp(6), dp(6), dp(6));
                iv.setBackgroundResource(R.drawable.ec_row_bg);
                iv.setFocusable(true);
                iv.setOnClickListener(click);
                row.addView(iv);
            }
            for (int c = 0; c < need; c++) {
                final Sticker st = stickers.get(idx[c]);
                ImageView iv = (ImageView) row.getChildAt(c);
                iv.setTag(st);
                Bitmap b = ThumbCache.get(st.thumbKey);
                if (b != null) {
                    iv.setImageBitmap(b);
                } else if (ThumbCache.isFailed(st.thumbKey)) {
                    iv.setImageBitmap(fallback(st));
                } else {
                    iv.setImageBitmap(null);
                    ThumbCache.load(getContext(), st.thumbKey, st.thumbLocation, st.dcId, null, dp(96),
                            new ThumbCache.Listener() {
                                public void onThumb(String k, Bitmap bmp) {
                                    updateThumb(k, bmp);
                                }
                            });
                }
            }
            return row;
        }
    }
}
