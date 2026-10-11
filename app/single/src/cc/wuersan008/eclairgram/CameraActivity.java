package cc.wuersan008.eclairgram;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Matrix;
import android.hardware.Camera;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import android.view.View;
import android.view.Window;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.SeekBar;
import android.widget.Toast;

import java.io.ByteArrayOutputStream;
import java.util.List;

/**
 * 应用内相机。
 *
 * 老设备的系统相机（ACTION_IMAGE_CAPTURE）常常要求先插入 SD 卡才能拍照，
 * 而没有 SD 的机器就完全用不了。这里直接用 {@link Camera} API 自己预览、拍照，
 * 拍到的 JPEG 只留在内存里（不写任何用户存储），交给聊天界面直接发送。
 */
public class CameraActivity extends BaseActivity
        implements SurfaceHolder.Callback, View.OnClickListener {

    /** 刚拍好的 JPEG（未落盘）；由 ChatActivity 在 onActivityResult 里取走后清空。 */
    static byte[] sLastJpeg;

    private Camera mCamera;
    private SurfaceView mPreview;
    private SeekBar mZoom;
    private boolean mReady;
    private boolean mTaken;
    private int mRotation = 90;

    @Override
    protected void onCreate(Bundle b) {
        super.onCreate(b);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        sLastJpeg = null;

        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(0xff000000);

        mPreview = new SurfaceView(this);
        mPreview.getHolder().setType(SurfaceHolder.SURFACE_TYPE_PUSH_BUFFERS);   // 2.x 必需
        root.addView(mPreview, new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.FILL_PARENT, 0, 1.0f));

        // 变焦：只在相机支持时显示；方向键左右可调
        mZoom = new SeekBar(this);
        mZoom.setVisibility(View.GONE);
        mZoom.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            public void onProgressChanged(SeekBar sb, int progress, boolean fromUser) {
                if (fromUser) applyZoom(progress);
            }

            public void onStartTrackingTouch(SeekBar sb) {
            }

            public void onStopTrackingTouch(SeekBar sb) {
            }
        });
        root.addView(mZoom, new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.FILL_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT));

        Button shutter = new Button(this);
        shutter.setText(R.string.ec_camera_shutter);
        shutter.setOnClickListener(this);
        root.addView(shutter, new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.FILL_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT));

        setContentView(root);
        mPreview.getHolder().addCallback(this);
    }

    // ======================================================== 预览
    public void surfaceCreated(SurfaceHolder h) {
        try {
            mCamera = Camera.open();
            Camera.Parameters p = mCamera.getParameters();
            Camera.Size size = chooseSize(p);
            p.setPictureSize(size.width, size.height);
            mRotation = sensorOrientation();
            p.setRotation(mRotation);          // 写进 EXIF（双保险）
            mCamera.setParameters(p);
            if (zoomSupported(p)) {
                mZoom.setMax(maxZoom(p));
                mZoom.setProgress(0);
                mZoom.setVisibility(View.VISIBLE);
            } else {
                mZoom.setVisibility(View.GONE);
            }
            setDisplayOrientation(mRotation);
            mCamera.setPreviewDisplay(h);
            mCamera.startPreview();
            mReady = true;
        } catch (Throwable t) {
            android.util.Log.e("Eclairgram", "camera open failed: " + t);
            toast(String.valueOf(t.getMessage()));
            finish();
        }
    }

    public void surfaceChanged(SurfaceHolder h, int format, int w, int hh) {
    }

    public void surfaceDestroyed(SurfaceHolder h) {
        release();
    }

    @Override
    protected void onDestroy() {
        release();
        super.onDestroy();
    }

    private void release() {
        mReady = false;
        if (mCamera != null) {
            try {
                mCamera.stopPreview();
            } catch (Throwable ignored) {
            }
            try {
                mCamera.release();
            } catch (Throwable ignored) {
            }
            mCamera = null;
        }
    }

    // ======================================================== 拍照
    public void onClick(View v) {
        take();
    }

    @Override
    public boolean dispatchKeyEvent(KeyEvent e) {
        if (e.getAction() == KeyEvent.ACTION_DOWN) {
            int code = e.getKeyCode();
            if (code == KeyEvent.KEYCODE_CAMERA || code == KeyEvent.KEYCODE_DPAD_CENTER) {
                take();
                return true;
            }
            if (code == KeyEvent.KEYCODE_DPAD_RIGHT) {
                nudgeZoom(+1);
                return true;
            }
            if (code == KeyEvent.KEYCODE_DPAD_LEFT) {
                nudgeZoom(-1);
                return true;
            }
        }
        return super.dispatchKeyEvent(e);
    }

    /** 方向键左右微调变焦（同时更新滑块）。 */
    private void nudgeZoom(int delta) {
        if (mZoom.getVisibility() != View.VISIBLE) return;
        int z = mZoom.getProgress() + delta;
        if (z < 0) z = 0;
        if (z > mZoom.getMax()) z = mZoom.getMax();
        mZoom.setProgress(z);
        applyZoom(z);
    }

    /** 应用变焦（0 = 不变焦）。变焦相关 API 是 API 8+，这里用反射调用。 */
    private void applyZoom(int zoom) {
        if (mCamera == null) return;
        try {
            Camera.Parameters p = mCamera.getParameters();
            if (!zoomSupported(p)) return;
            int max = maxZoom(p);
            if (zoom < 0) zoom = 0;
            if (zoom > max) zoom = max;
            setZoom(p, zoom);
            mCamera.setParameters(p);
        } catch (Throwable ignored) {
        }
    }

    private static boolean zoomSupported(Camera.Parameters p) {
        try {
            return ((Boolean) Camera.Parameters.class.getMethod("isZoomSupported")
                    .invoke(p)).booleanValue();
        } catch (Throwable t) {
            return false;
        }
    }

    private static int maxZoom(Camera.Parameters p) {
        try {
            return ((Integer) Camera.Parameters.class.getMethod("getMaxZoom")
                    .invoke(p)).intValue();
        } catch (Throwable t) {
            return 0;
        }
    }

    private static void setZoom(Camera.Parameters p, int zoom) throws Exception {
        Camera.Parameters.class.getMethod("setZoom", int.class)
                .invoke(p, Integer.valueOf(zoom));
    }

    private void take() {
        if (!mReady || mTaken || mCamera == null) return;
        mTaken = true;
        try {
            mCamera.takePicture(null, null, new Camera.PictureCallback() {
                public void onPictureTaken(byte[] data, Camera cam) {
                    sLastJpeg = upright(data, mRotation);
                    setResult(RESULT_OK);
                    finish();
                }
            });
        } catch (Throwable t) {
            mTaken = false;
            toast(String.valueOf(t.getMessage()));
        }
    }

    /** 把相机传感器的横向 JPEG 旋正（全程在内存里，不落盘）。 */
    private static byte[] upright(byte[] jpeg, int rotation) {
        if (rotation == 0 || jpeg == null) return jpeg;
        Bitmap src = null;
        try {
            src = BitmapFactory.decodeByteArray(jpeg, 0, jpeg.length);
            if (src == null) return jpeg;
            Matrix m = new Matrix();
            m.postRotate(rotation);
            Bitmap dst = Bitmap.createBitmap(src, 0, 0,
                    src.getWidth(), src.getHeight(), m, true);
            if (dst != src) src.recycle();
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            dst.compress(Bitmap.CompressFormat.JPEG, 90, out);
            dst.recycle();
            return out.toByteArray();
        } catch (Throwable t) {
            return jpeg;
        }
    }

    /** 选一个 ~1.3MP 以内的最大尺寸，省内存也够聊天用。 */
    private static Camera.Size chooseSize(Camera.Parameters p) {
        List<Camera.Size> sizes = p.getSupportedPictureSizes();
        if (sizes == null || sizes.isEmpty()) return p.getPictureSize();
        Camera.Size best = null;
        long bestArea = -1;
        for (Camera.Size s : sizes) {
            long area = (long) s.width * s.height;
            if (area <= 1300000 && area > bestArea) {
                bestArea = area;
                best = s;
            }
        }
        if (best == null) {   // 都比 1.3MP 大：取最小的
            for (Camera.Size s : sizes) {
                long area = (long) s.width * s.height;
                if (best == null || area < bestArea) {
                    best = s;
                    bestArea = area;
                }
            }
        }
        return best;
    }

    /** 后置摄像头传感器的旋转角；CameraInfo 是 API 9+，取不到就默认 90。 */
    private static int sensorOrientation() {
        try {
            Class<?> ciClass = Class.forName("android.hardware.Camera$CameraInfo");
            Object ci = ciClass.newInstance();
            java.lang.reflect.Method get = Camera.class.getMethod(
                    "getCameraInfo", int.class, ciClass);
            get.invoke(null, Integer.valueOf(0), ci);
            return ciClass.getField("orientation").getInt(ci);
        } catch (Throwable t) {
            return 90;
        }
    }

    /** setDisplayOrientation 是 API 8+；API 7 上没有，忽略即可（只影响预览方向）。 */
    private void setDisplayOrientation(int degrees) {
        try {
            Camera.class.getMethod("setDisplayOrientation", int.class)
                    .invoke(mCamera, Integer.valueOf(degrees));
        } catch (Throwable ignored) {
        }
    }

    private void toast(String s) {
        Toast.makeText(this, s, Toast.LENGTH_SHORT).show();
    }
}
