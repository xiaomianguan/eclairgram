package cc.wuersan008.eclairgram;

import android.app.Activity;
import android.graphics.BitmapFactory;
import android.os.Bundle;
import android.view.View;
import android.view.Window;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.MediaController;
import android.widget.TextView;
import android.widget.VideoView;

import java.io.File;

/**
 * 查看下载好的图片/视频。
 *
 * 图片用 ImageView 显示；视频用 VideoView 播放（Android 2.1 起可用）。
 */
public class MediaActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);

        String path = getIntent().getStringExtra("path");
        int type = getIntent().getIntExtra("type", 1);
        String name = getIntent().getStringExtra("name");

        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(0xff000000);

        if (path == null || !new File(path).exists()) {
            TextView t = new TextView(this);
            t.setText(R.string.ec_media_failed);
            t.setTextColor(0xffffffff);
            root.addView(t);
            setContentView(root);
            setTitle(EmojiFont.emojify(this, name, dp(16)));
            return;
        }

        if (type == 2) {
            VideoView vv = new VideoView(this);
            vv.setVideoPath(path);
            MediaController mc = new MediaController(this);
            vv.setMediaController(mc);
            mc.setAnchorView(vv);
            root.addView(vv, new LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.FILL_PARENT,
                    LinearLayout.LayoutParams.FILL_PARENT));
            setContentView(root);
            vv.start();
        } else {
            ImageView iv = new ImageView(this);
            iv.setScaleType(ImageView.ScaleType.FIT_CENTER);
            iv.setImageBitmap(BitmapFactory.decodeFile(path));
            root.addView(iv, new LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.FILL_PARENT,
                    LinearLayout.LayoutParams.FILL_PARENT));
            setContentView(root);
        }
        if (name != null) setTitle(EmojiFont.emojify(this, name, dp(16)));
    }

    private int dp(int v) {
        return (int) (v * getResources().getDisplayMetrics().density + 0.5f);
    }
}
