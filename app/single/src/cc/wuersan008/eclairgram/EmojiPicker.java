package cc.wuersan008.eclairgram;

import android.app.Dialog;
import android.content.Context;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;

/**
 * 自定义 emoji 选择器：按 Unicode 官方分类分节（表情在前、符号/旗帜在后），
 * 组内顺序与主流键盘一致。点一下把对应字符插入输入框。
 *
 * 这些老系统键盘无法输入较新的 emoji，只能靠这个选择器。
 */
public final class EmojiPicker extends Dialog {

    public interface Listener {
        void onEmoji(int codepoint);
    }

    private static final int COLS = 7;
    private static final int[] CAT_STR = {
            R.string.ec_cat_0, R.string.ec_cat_1, R.string.ec_cat_2, R.string.ec_cat_3,
            R.string.ec_cat_4, R.string.ec_cat_5, R.string.ec_cat_6, R.string.ec_cat_7,
            R.string.ec_cat_8, R.string.ec_cat_9,
    };

    public EmojiPicker(Context ctx, final Listener listener) {
        super(ctx);
        setTitle(R.string.ec_emoji);
        final int px = (int) (ctx.getResources().getDisplayMetrics().density * 36);

        int[] cps = EmojiFont.codepoints(ctx);
        List<Object> rows = new ArrayList<Object>();   // String(分类标题) 或 int[](一行 emoji)
        int[] buf = new int[COLS];
        int bn = 0;
        int lastCat = -1;
        for (int i = 0; i < cps.length; i++) {
            int cp = cps[i];
            int cat = EmojiFont.category(ctx, cp);
            if (cat != lastCat) {
                if (bn > 0) { rows.add(copy(buf, bn)); bn = 0; }
                int res = CAT_STR[cat >= 0 && cat < CAT_STR.length ? cat : CAT_STR.length - 1];
                rows.add(ctx.getString(res));
                lastCat = cat;
            }
            buf[bn++] = cp;
            if (bn == COLS) { rows.add(copy(buf, COLS)); bn = 0; }
        }
        if (bn > 0) rows.add(copy(buf, bn));

        ListView lv = new ListView(ctx);
        lv.setDivider(null);
        lv.setDividerHeight(0);
        lv.setCacheColorHint(0);
        lv.setAdapter(new RowAdapter(ctx, rows, listener, px));
        setContentView(lv);
    }

    private static int[] copy(int[] a, int n) {
        int[] r = new int[n];
        System.arraycopy(a, 0, r, 0, n);
        return r;
    }

    private static final class RowAdapter extends BaseAdapter {
        private final Context ctx;
        private final List<Object> rows;
        private final Listener listener;
        private final int px;

        RowAdapter(Context ctx, List<Object> rows, Listener l, int px) {
            this.ctx = ctx;
            this.rows = rows;
            this.listener = l;
            this.px = px;
        }

        public int getCount() { return rows.size(); }
        public Object getItem(int i) { return rows.get(i); }
        public long getItemId(int i) { return i; }

        @Override
        public int getViewTypeCount() { return 2; }

        @Override
        public int getItemViewType(int i) {
            return (rows.get(i) instanceof String) ? 0 : 1;
        }

        @Override
        public boolean isEnabled(int i) { return getItemViewType(i) == 1; }

        public View getView(int i, View convertView, ViewGroup parent) {
            Object row = rows.get(i);
            if (row instanceof String) {
                TextView tv = new TextView(ctx);
                tv.setText((String) row);
                tv.setPadding(px / 2, px / 2, px / 2, px / 4);
                tv.setGravity(Gravity.LEFT);
                tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
                tv.setTextColor(0xff808080);
                return tv;
            }
            LinearLayout ll = new LinearLayout(ctx);
            ll.setOrientation(LinearLayout.HORIZONTAL);
            int[] cps = (int[]) row;
            for (int k = 0; k < cps.length; k++) {
                final int cp = cps[k];
                ImageView iv = new ImageView(ctx);
                iv.setLayoutParams(new LinearLayout.LayoutParams(px, px));
                iv.setScaleType(ImageView.ScaleType.FIT_CENTER);
                iv.setImageBitmap(EmojiFont.bitmap(ctx, cp));
                iv.setFocusable(true);
                iv.setClickable(true);
                iv.setOnClickListener(new View.OnClickListener() {
                    public void onClick(View v) {
                        listener.onEmoji(cp);
                    }
                });
                ll.addView(iv);
            }
            return ll;
        }
    }
}
