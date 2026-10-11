package cc.wuersan008.eclairgram;

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
public class MediaActivity extends BaseActivity {

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
            iv.setImageBitmap(decodeImage(path));
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

    /**
     * 解码图片并按屏幕尺寸降采样。原图可能几千像素宽，直接整张解码在
     * 老设备上会 OOM；这里用 inSampleSize 限制到屏幕大小、转 RGB_565。
     */
    private android.graphics.Bitmap decodeImage(String path) {
        try {
            android.graphics.BitmapFactory.Options o = new android.graphics.BitmapFactory.Options();
            o.inJustDecodeBounds = true;
            android.graphics.BitmapFactory.decodeFile(path, o);
            int maxW = getResources().getDisplayMetrics().widthPixels;
            int maxH = getResources().getDisplayMetrics().heightPixels;
            int sample = 1;
            while (o.outWidth / (sample * 2) >= maxW || o.outHeight / (sample * 2) >= maxH) {
                sample *= 2;
            }
            o.inJustDecodeBounds = false;
            o.inSampleSize = sample;
            o.inPreferredConfig = android.graphics.Bitmap.Config.RGB_565;
            return android.graphics.BitmapFactory.decodeFile(path, o);
        } catch (Throwable t) {
            return null;
        }
    }
}
