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
 * 贴纸选择器：拉取账号已安装的贴纸包，网格显示缩略图，点按发送。
 *
 * 老系统字体/图片库不支持 webp，贴纸用文档自带的缩略图（JPEG）显示与下载缓存
 * 都走 {@link ThumbCache}。
 */
public final class StickerPicker extends Dialog {

    public interface Listener {
        void onSticker(long id, long accessHash, byte[] fileRef);
    }

    private static final int COLS = 4;
    private static final int MAX_SETS = 4;   // 别一次拉太多包，老设备/网络吃不消

    private final Listener listener;
    private final List<Sticker> stickers = new ArrayList<Sticker>();
    private final List<int[]> rows = new ArrayList<int[]>();
    private ListView list;
    private Adapter adapter;

    static final class Sticker {
        long id;
        long accessHash;
        byte[] fileRef;
        byte[] thumbLocation;
        String thumbKey;
    }

    public StickerPicker(Context ctx, Listener l) {
        super(ctx);
        this.listener = l;
        setTitle(R.string.ec_stickers);

        list = new ListView(ctx);
        list.setDivider(null);
        list.setDividerHeight(0);
        list.setCacheColorHint(0);
        list.setSelector(new ColorDrawable(0x00000000));
        adapter = new Adapter();
        list.setAdapter(adapter);
        setContentView(list);
        load();
    }

    private void load() {
        new Thread(new Runnable() {
            public void run() {
                final List<Sticker> found = new ArrayList<Sticker>();
                String err = null;
                try {
                    TelegramManager tg = TelegramManager.get(getContext());
                    TlObject res = tg.syncGetAllStickers();
                    List<Object> sets = res.list("stickers");
                    if (sets == null) sets = res.list("sets");
                    if (sets != null) {
                        int n = 0;
                        for (Object o : sets) {
                            if (n >= MAX_SETS) break;
                            TlObject s = (TlObject) o;
                            long sid = s.i64("id");
                            long sah = s.i64("access_hash");
                            n++;
                            TlObject full;
                            try {
                                full = tg.syncGetStickerSet(sid, sah);
                            } catch (Throwable t) {
                                continue;
                            }
                            List<Object> docs = full.list("documents");
                            if (docs == null) continue;
                            for (Object od : docs) {
                                TlObject doc = (TlObject) od;
                                if (!doc.type().equals("document")) continue;
                                Object[] th = thumbOf(doc);
                                if (th == null) continue;
                                Sticker st = new Sticker();
                                st.id = doc.i64("id");
                                st.accessHash = doc.i64("access_hash");
                                Object ref = doc.get("file_reference");
                                st.fileRef = (ref instanceof byte[]) ? (byte[]) ref : new byte[0];
                                st.thumbLocation = MtpClient.documentFileLocation(
                                        st.id, st.accessHash, st.fileRef, (String) th[1]);
                                st.thumbKey = "st" + st.id + ":" + th[1];
                                found.add(st);
                            }
                        }
                    }
                } catch (Throwable t) {
                    err = String.valueOf(t.getMessage());
                }
                final String ferr = err;
                new Handler(Looper.getMainLooper()).post(new Runnable() {
                    public void run() {
                        stickers.clear();
                        stickers.addAll(found);
                        buildRows();
                        adapter.notifyDataSetChanged();
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
            LinearLayout row = new LinearLayout(getContext());
            row.setOrientation(LinearLayout.HORIZONTAL);
            int cell = dp(56);
            int[] idx = rows.get(pos);
            for (int c = 0; c < idx.length; c++) {
                final Sticker st = stickers.get(idx[c]);
                ImageView iv = new ImageView(getContext());
                LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(cell, cell);
                iv.setLayoutParams(lp);
                iv.setScaleType(ImageView.ScaleType.FIT_CENTER);
                iv.setPadding(dp(6), dp(6), dp(6), dp(6));
                iv.setBackgroundResource(R.drawable.ec_row_bg);
                iv.setFocusable(true);
                Bitmap b = ThumbCache.get(st.thumbKey);
                if (b != null) {
                    iv.setImageBitmap(b);
                } else {
                    ThumbCache.load(getContext(), st.thumbKey, st.thumbLocation, null, dp(96),
                            new ThumbCache.Listener() {
                                public void onThumb(String k, Bitmap bmp) {
                                    if (bmp != null) adapter.notifyDataSetChanged();
                                }
                            });
                }
                iv.setOnClickListener(new View.OnClickListener() {
                    public void onClick(View v) {
                        listener.onSticker(st.id, st.accessHash, st.fileRef);
                        dismiss();
                    }
                });
                row.addView(iv);
            }
            return row;
        }
    }
}
