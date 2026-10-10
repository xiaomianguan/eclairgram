package cc.wuersan008.eclairgram;

import android.app.Dialog;
import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AbsListView;
import android.widget.AdapterView;
import android.widget.BaseAdapter;
import android.widget.GridView;
import android.widget.ImageView;

/**
 * 自定义 emoji 选择器。
 *
 * 这些老系统的键盘无法输入较新的 emoji（也没有 Blobmoji），所以用 emoji.pack
 * 里的位图做一个网格，点一下就把对应字符插入输入框。
 */
public final class EmojiPicker extends Dialog {

    public interface Listener {
        void onEmoji(int codepoint);
    }

    public EmojiPicker(Context ctx, final Listener listener) {
        super(ctx);
        setTitle(R.string.ec_emoji);
        final int[] cps = EmojiFont.codepoints(ctx);
        final int px = (int) (ctx.getResources().getDisplayMetrics().density * 40);

        GridView gv = new GridView(ctx);
        gv.setNumColumns(6);
        gv.setVerticalSpacing(4);
        gv.setHorizontalSpacing(4);
        gv.setAdapter(new BaseAdapter() {
            public int getCount() { return cps.length; }
            public Object getItem(int i) { return Integer.valueOf(cps[i]); }
            public long getItemId(int i) { return i; }

            public View getView(int i, View convertView, ViewGroup parent) {
                ImageView iv = (convertView instanceof ImageView)
                        ? (ImageView) convertView : new ImageView(getContext());
                iv.setLayoutParams(new AbsListView.LayoutParams(px, px));
                iv.setScaleType(ImageView.ScaleType.FIT_CENTER);
                iv.setImageBitmap(EmojiFont.bitmap(getContext(), cps[i]));
                return iv;
            }
        });
        gv.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            public void onItemClick(AdapterView<?> a, View v, int pos, long id) {
                listener.onEmoji(cps[pos]);
            }
        });
        setContentView(gv);
    }
}
