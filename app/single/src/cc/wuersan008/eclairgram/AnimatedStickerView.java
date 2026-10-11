package cc.wuersan008.eclairgram;

import android.content.Context;
import android.graphics.Canvas;
import android.os.Handler;
import android.os.SystemClock;
import android.util.AttributeSet;
import android.view.View;

/**
 * 播放动图贴纸（Lottie）的 View。
 *
 * 用 Handler 定时 invalidate，按当前时间算出帧号再交给 {@link Lottie} 渲染。
 * 在 View 不可见 / 分离时停止，省电。
 */
public final class AnimatedStickerView extends View {

    private Lottie lottie;
    private long startMs;
    private boolean running;
    private final Handler handler = new Handler();
    private final Runnable tick = new Runnable() {
        public void run() {
            if (!running) return;
            invalidate();
            if (running) handler.postDelayed(this, 66);   // ~15fps，老设备够用且省内存
        }
    };

    public AnimatedStickerView(Context c) {
        super(c);
    }

    public AnimatedStickerView(Context c, AttributeSet a) {
        super(c, a);
    }

    public void setLottie(Lottie l) {
        lottie = l;
        startMs = SystemClock.uptimeMillis();
        invalidate();
    }

    public void start() {
        if (lottie == null || running) return;
        running = true;
        startMs = SystemClock.uptimeMillis();
        handler.post(tick);
    }

    public void stop() {
        running = false;
        handler.removeCallbacks(tick);
    }

    @Override
    protected void onDraw(Canvas canvas) {
        if (lottie == null) return;
        int w = getWidth(), h = getHeight();
        if (w <= 0 || h <= 0 || lottie.width <= 0 || lottie.height <= 0) return;
        try {
            float dur = lottie.durationMs();
            float frame = lottie.inFrame;
            if (dur > 0) {
                long el = SystemClock.uptimeMillis() - startMs;
                frame += (el % (long) dur) * lottie.frameRate / 1000f;
            }
            // 等比缩放并居中，绝不做非等比拉伸（否则贴纸会被压扁）
            float s = Math.min(w / (float) lottie.width, h / (float) lottie.height);
            float dx = (w - lottie.width * s) / 2f;
            float dy = (h - lottie.height * s) / 2f;
            canvas.save();
            canvas.translate(dx, dy);
            canvas.scale(s, s);
            lottie.render(canvas, frame);
            canvas.restore();
        } catch (Throwable t) {
            // 渲染出错（含 OOM）：停下来并清空，别把界面拖垮
            stop();
            lottie = null;
        }
    }

    @Override
    protected void onWindowVisibilityChanged(int visibility) {
        super.onWindowVisibilityChanged(visibility);
        if (visibility == VISIBLE) start();
        else stop();
    }

    @Override
    protected void onDetachedFromWindow() {
        stop();
        super.onDetachedFromWindow();
    }
}
