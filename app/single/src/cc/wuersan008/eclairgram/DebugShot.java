package cc.wuersan008.eclairgram;

import android.app.Activity;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.util.Log;
import android.view.View;

import java.io.File;
import java.io.FileOutputStream;

/**
 * 调试用：把当前界面绘制成 PNG 存到应用私有目录，供无法使用 screencap 的
 * 老设备（如 HTC Wildfire）经 run-as 取出查看。仅在带 "shot" extra 启动时触发。
 */
public final class DebugShot {

    private DebugShot() {}

    public static void capture(final Activity a, final String name) {
        save(a.getWindow().getDecorView(), a.getFilesDir(), name);
    }

    private static void save(View v, File dir, String name) {
        int w = v.getWidth();
        int h = v.getHeight();
        if (w <= 0 || h <= 0) {
            Log.w("Eclairgram", "shot: view not laid out");
            return;
        }
        try {
            Bitmap b = Bitmap.createBitmap(w, h, Bitmap.Config.ARGB_8888);
            v.draw(new Canvas(b));
            File f = new File(dir, name);
            FileOutputStream out = new FileOutputStream(f);
            b.compress(Bitmap.CompressFormat.PNG, 100, out);
            out.close();
            Log.i("Eclairgram", "shot saved: " + f.getAbsolutePath()
                    + " (" + w + "x" + h + ")");
        } catch (Throwable t) {
            Log.w("Eclairgram", "shot failed: " + t);
        }
    }
}
