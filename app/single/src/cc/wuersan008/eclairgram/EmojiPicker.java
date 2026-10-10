package cc.wuersan008.eclairgram;

import android.app.Dialog;
import android.content.Context;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.view.KeyEvent;
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
 *
 * 方向键（D-pad）可完整操作：左右在同一行内移动并高亮单元格，上下切换行
 * （列位置跨行保留），中键/回车选中并插入。焦点/选中状态由本类自己维护，
 * 在 Dialog 层拦截按键后刷新列表，因此不依赖 ListView 的焦点查找行为
 * （它在这些老系统上不会把焦点交给列表项）。
 */
public final class EmojiPicker extends Dialog {

    public interface Listener {
        void onEmoji(int codepoint);
    }

    private static final int COLS = 7;
    private static final int FOCUS_COLOR = 0xffff9800;   // 橙色高亮框
    private static final int FOCUS_PAD = 4;              // 高亮时四周留出的橙边
    private static final int[] CAT_STR = {
            R.string.ec_cat_0, R.string.ec_cat_1, R.string.ec_cat_2, R.string.ec_cat_3,
            R.string.ec_cat_4, R.string.ec_cat_5, R.string.ec_cat_6, R.string.ec_cat_7,
            R.string.ec_cat_8, R.string.ec_cat_9,
    };

    private final Listener listener;
    private final List<Object> rows = new ArrayList<Object>();   // String(标题) 或 int[](一行)
    private final int[] ordinalOfRow;   // rows 中每个位置对应的“emoji 行序号”，标题为 -1
    private final int[] rowPos;         // emoji 行序号 -> rows 中的位置

    private ListView list;
    private RowAdapter adapter;
    private int selRow;                 // 当前 emoji 行序号
    private int selCol;                 // 当前列

    public EmojiPicker(Context ctx, final Listener listener) {
        super(ctx);
        this.listener = listener;
        setTitle(R.string.ec_emoji);
        // 单元格大小：默认 36dp，但保证 7 列能塞进屏幕宽度（老机型如 QVGA 更窄）
        android.util.DisplayMetrics dm = ctx.getResources().getDisplayMetrics();
        int cell = (int) (dm.density * 36);
        int fit = dm.widthPixels / COLS;
        if (fit > 0 && fit < cell) cell = fit;
        final int px = cell;

        int[] cps = EmojiFont.codepoints(ctx);
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

        // 建立“emoji 行序号 <-> rows 位置”的映射（跳过分类标题）
        ordinalOfRow = new int[rows.size()];
        List<Integer> positions = new ArrayList<Integer>();
        int ord = 0;
        for (int i = 0; i < rows.size(); i++) {
            if (rows.get(i) instanceof String) {
                ordinalOfRow[i] = -1;
            } else {
                ordinalOfRow[i] = ord++;
                positions.add(Integer.valueOf(i));
            }
        }
        rowPos = new int[positions.size()];
        for (int i = 0; i < positions.size(); i++) rowPos[i] = positions.get(i).intValue();

        list = new ListView(ctx);
        list.setDivider(null);
        list.setDividerHeight(0);
        list.setCacheColorHint(0);
        list.setSelector(new ColorDrawable(0x00000000));   // 高亮由单元格自己画
        adapter = new RowAdapter(ctx, px);
        list.setAdapter(adapter);
        setContentView(list);
    }

    // ======================================================== 方向键
    @Override
    public boolean dispatchKeyEvent(KeyEvent event) {
        if (handleDpad(event)) return true;
        return super.dispatchKeyEvent(event);
    }

    private boolean handleDpad(KeyEvent event) {
        int key = event.getKeyCode();
        boolean handled = key == KeyEvent.KEYCODE_DPAD_LEFT
                || key == KeyEvent.KEYCODE_DPAD_RIGHT
                || key == KeyEvent.KEYCODE_DPAD_UP
                || key == KeyEvent.KEYCODE_DPAD_DOWN
                || key == KeyEvent.KEYCODE_DPAD_CENTER
                || key == KeyEvent.KEYCODE_ENTER;
        if (!handled) return false;
        if (event.getAction() != KeyEvent.ACTION_DOWN) return true;

        if (key == KeyEvent.KEYCODE_DPAD_LEFT) {
            if (selCol > 0) selCol--;
        } else if (key == KeyEvent.KEYCODE_DPAD_RIGHT) {
            int[] cps = currentCps();
            if (selCol < cps.length - 1) selCol++;
        } else if (key == KeyEvent.KEYCODE_DPAD_UP) {
            if (selRow > 0) selRow--;
        } else if (key == KeyEvent.KEYCODE_DPAD_DOWN) {
            if (selRow < rowPos.length - 1) selRow++;
        } else {                                     // 中键 / 回车：选中
            int[] cps = currentCps();
            if (selCol >= 0 && selCol < cps.length) listener.onEmoji(cps[selCol]);
            return true;
        }

        int[] cps = currentCps();                    // 换行后把列夹到合法范围
        if (selCol > cps.length - 1) selCol = cps.length - 1;
        if (selCol < 0) selCol = 0;

        adapter.notifyDataSetChanged();
        int pos = rowPos[selRow];
        if (pos < list.getFirstVisiblePosition() || pos > list.getLastVisiblePosition()) {
            list.setSelection(pos);
        }
        return true;
    }

    private int[] currentCps() {
        Object o = rows.get(rowPos[selRow]);
        return (int[]) o;
    }

    private static int[] copy(int[] a, int n) {
        int[] r = new int[n];
        System.arraycopy(a, 0, r, 0, n);
        return r;
    }

    private static void highlight(ImageView[] cells, int idx) {
        for (int k = 0; k < cells.length; k++) {
            if (k == idx) {
                cells[k].setBackgroundColor(FOCUS_COLOR);
                cells[k].setPadding(FOCUS_PAD, FOCUS_PAD, FOCUS_PAD, FOCUS_PAD);
            } else {
                cells[k].setBackgroundColor(Color.TRANSPARENT);
                cells[k].setPadding(0, 0, 0, 0);
            }
        }
    }

    private final class RowAdapter extends BaseAdapter {
        private final Context ctx;
        private final int px;

        RowAdapter(Context ctx, int px) {
            this.ctx = ctx;
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
                TextView tv;
                if (convertView instanceof TextView) {
                    tv = (TextView) convertView;
                } else {
                    tv = new TextView(ctx);
                    tv.setPadding(px / 2, px / 2, px / 2, px / 4);
                    tv.setGravity(android.view.Gravity.LEFT);
                    tv.setTextSize(android.util.TypedValue.COMPLEX_UNIT_SP, 13);
                    tv.setTextColor(0xff808080);
                    tv.setFocusable(false);
                }
                tv.setText((String) row);
                return tv;
            }

            final int[] cps = (int[]) row;
            LinearLayout ll;
            if (convertView instanceof LinearLayout) {
                ll = (LinearLayout) convertView;
                ll.removeAllViews();
            } else {
                ll = new LinearLayout(ctx);
                ll.setOrientation(LinearLayout.HORIZONTAL);
            }

            ImageView[] cells = new ImageView[cps.length];
            for (int k = 0; k < cps.length; k++) {
                final int cp = cps[k];
                ImageView iv = new ImageView(ctx);
                iv.setLayoutParams(new LinearLayout.LayoutParams(px, px));
                iv.setScaleType(ImageView.ScaleType.FIT_CENTER);
                iv.setImageBitmap(EmojiFont.bitmap(ctx, cp));
                iv.setClickable(true);
                iv.setOnClickListener(new View.OnClickListener() {
                    public void onClick(View v) {
                        listener.onEmoji(cp);
                    }
                });
                cells[k] = iv;
                ll.addView(iv);
            }

            int ord = ordinalOfRow[i];
            int col = (ord == selRow) ? Math.min(selCol, cps.length - 1) : -1;
            highlight(cells, col);
            return ll;
        }
    }
}
