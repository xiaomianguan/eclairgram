package cc.wuersan008.eclairgram;

import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.GZIPInputStream;

/**
 * Telegram 动图贴纸（TGS = gzip 后的 Lottie JSON）的最小渲染器。
 *
 * 只实现 Telegram 贴纸实际用到的子集：null 层 / 形状层、组(gr)、路径(sh)、
 * 填充(fl)、描边(st)、组变换(tr)、父子层、以及位置/缩放/旋转/不透明度的关键帧。
 * 不使用遮罩、图片、预合成、渐变（贴纸里没有）。
 *
 * 用法：{@code Lottie a = Lottie.parse(tgsBytes); a.render(canvas, frame);}
 */
public final class Lottie {

    public final int width;
    public final int height;
    public final float frameRate;
    public final float inFrame;
    public final float outFrame;

    private final List<Layer> layers = new ArrayList<Layer>();
    private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);

    private Lottie(JSONObject o) throws Exception {
        width = o.optInt("w", 512);
        height = o.optInt("h", 512);
        frameRate = (float) o.optDouble("fr", 60);
        inFrame = (float) o.optDouble("ip", 0);
        outFrame = (float) o.optDouble("op", 0);
        JSONArray ls = o.optJSONArray("layers");
        if (ls != null) {
            for (int i = 0; i < ls.length(); i++) {
                JSONObject lo = ls.optJSONObject(i);
                if (lo == null) continue;
                Layer l = new Layer();
                l.type = lo.optInt("ty", 0);
                l.ind = lo.optInt("ind", 0);
                l.parent = lo.optInt("parent", 0);
                l.ks = Transform.parse(lo.optJSONObject("ks"));
                l.shapes = parseShapes(lo.optJSONArray("shapes"));
                layers.add(l);
            }
        }
    }

    public static Lottie parse(byte[] tgs) {
        if (tgs == null || tgs.length < 8) return null;
        try {
            byte[] json = tgs;
            if ((tgs[0] & 0xff) == 0x1f && (tgs[1] & 0xff) == 0x8b) json = gunzip(tgs);
            return new Lottie(new JSONObject(new String(json, "UTF-8")));
        } catch (Throwable t) {
            return null;
        }
    }

    public float durationMs() {
        if (frameRate <= 0 || outFrame <= inFrame) return 1000f;
        return (outFrame - inFrame) / frameRate * 1000f;
    }

    /** 把第 frame 帧画到 canvas（canvas 坐标已按贴纸显示尺寸缩放好）。 */
    public void render(Canvas canvas, float frame) {
        // Lottie 里 layers[0] 在最上层：从后往前画
        for (int i = layers.size() - 1; i >= 0; i--) {
            Layer l = layers.get(i);
            if (l.type != 3 && l.type != 4) continue;   // 只支持 null / shape
            if (frame < 0) frame = inFrame;
            Matrix m = worldMatrix(l, frame, 0);
            drawLayer(canvas, l, m, frame);
        }
    }

    private Matrix worldMatrix(Layer l, float frame, int depth) {
        Matrix local = l.ks == null ? new Matrix() : l.ks.matrix(frame);
        if (l.parent == 0 || depth > 16) return local;
        Layer p = findByInd(l.parent);
        if (p == null) return local;
        Matrix pm = worldMatrix(p, frame, depth + 1);
        Matrix out = new Matrix(pm);
        out.preConcat(local);      // out = parent * local
        return out;
    }

    private Layer findByInd(int ind) {
        for (int i = 0; i < layers.size(); i++) {
            if (layers.get(i).ind == ind) return layers.get(i);
        }
        return null;
    }

    private void drawLayer(Canvas canvas, Layer l, Matrix base, float frame) {
        if (l.shapes == null) return;
        drawShapes(canvas, l.shapes, base, frame);
    }

    /** 递归画一组形状：组(gr) 先应用自己的 tr，再画里面的路径/填充/描边。 */
    private void drawShapes(Canvas canvas, List<Shape> shapes, Matrix parent, float frame) {
        // 收集本层的路径与样式（Lottie 里样式作用于同一组内的所有路径）
        List<Shape> paths = new ArrayList<Shape>();
        List<Shape> fills = new ArrayList<Shape>();
        List<Shape> strokes = new ArrayList<Shape>();
        for (Shape s : shapes) {
            if (s.ty.equals("sh")) paths.add(s);
            else if (s.ty.equals("fl")) fills.add(s);
            else if (s.ty.equals("st")) strokes.add(s);
            else if (s.ty.equals("gr")) {
                Matrix gm = new Matrix(parent);
                if (s.tr != null) {
                    Matrix t = s.tr.matrix(frame);
                    gm.preConcat(t);
                }
                drawShapes(canvas, s.children, gm, frame);
            }
        }
        if (paths.isEmpty()) return;
        for (Shape p : paths) {
            Path path = p.pathAt(frame);
            if (path == null) continue;
            Path t = new Path(path);
            t.transform(parent);
            for (Shape f : fills) {
                paint.setStyle(Paint.Style.FILL);
                paint.setColor(f.colorAt(frame));
                paint.setAlpha(applyOpacity(paint.getAlpha(), f.opacityAt(frame)));
                canvas.drawPath(t, paint);
            }
            for (Shape st : strokes) {
                paint.setStyle(Paint.Style.STROKE);
                paint.setStrokeWidth(Math.max(1f, st.strokeWidthAt(frame)));
                paint.setColor(st.colorAt(frame));
                paint.setAlpha(applyOpacity(paint.getAlpha(), st.opacityAt(frame)));
                paint.setStrokeCap(Paint.Cap.ROUND);
                paint.setStrokeJoin(Paint.Join.ROUND);
                canvas.drawPath(t, paint);
            }
        }
    }

    private static int applyOpacity(int color, float op) {   // op 0..100
        int a = Color.alpha(color);
        int na = (int) (a * Math.max(0f, Math.min(100f, op)) / 100f);
        return (color & 0x00ffffff) | (na << 24);
    }

    private static List<Shape> parseShapes(JSONArray arr) {
        if (arr == null) return null;
        List<Shape> out = new ArrayList<Shape>();
        for (int i = 0; i < arr.length(); i++) {
            JSONObject o = arr.optJSONObject(i);
            if (o == null) continue;
            Shape s = new Shape();
            s.ty = o.optString("ty", "");
            if (s.ty.equals("gr")) {
                s.children = parseShapes(o.optJSONArray("it"));
                JSONArray it = o.optJSONArray("it");
                if (it != null) {
                    for (int k = 0; k < it.length(); k++) {
                        JSONObject c = it.optJSONObject(k);
                        if (c != null && "tr".equals(c.optString("ty"))) {
                            s.tr = Transform.parse(c);
                        }
                    }
                }
            } else if (s.ty.equals("sh")) {
                JSONObject ks = o.optJSONObject("ks");
                s.path = Prop.parse(ks);
                if (s.path != null) s.path.raw = ks;
            } else if (s.ty.equals("fl")) {
                s.color = Prop.parse(o.optJSONObject("c"));
                s.opacity = Prop.parse(o.optJSONObject("o"));
            } else if (s.ty.equals("st")) {
                s.color = Prop.parse(o.optJSONObject("c"));
                s.opacity = Prop.parse(o.optJSONObject("o"));
                s.strokeWidth = Prop.parse(o.optJSONObject("w"));
            }
            out.add(s);
        }
        return out;
    }

    private static byte[] gunzip(byte[] data) throws Exception {
        GZIPInputStream gz = new GZIPInputStream(new ByteArrayInputStream(data));
        ByteArrayOutputStream bos = new ByteArrayOutputStream(65536);
        byte[] b = new byte[8192];
        int n;
        while ((n = gz.read(b)) > 0) bos.write(b, 0, n);
        gz.close();
        return bos.toByteArray();
    }

    // ======================================================== 模型
    static final class Layer {
        int type, ind, parent;
        Transform ks;
        List<Shape> shapes;
    }

    static final class Shape {
        String ty;
        Prop path;                 // sh
        Prop color, opacity, strokeWidth;   // fl / st
        Transform tr;              // gr
        List<Shape> children;      // gr

        Path pathAt(float frame) {
            if (path == null) return null;
            return path.path(frame);
        }

        int colorAt(float frame) {
            if (color == null) return 0xffffffff;
            float[] c = color.at(frame);
            float a = c.length > 3 ? c[3] : 1f;
            return Color.argb((int) (a * 255), (int) (c[0] * 255), (int) (c[1] * 255), (int) (c[2] * 255));
        }

        float opacityAt(float frame) {
            return opacity == null ? 100f : opacity.at(frame)[0];
        }

        float strokeWidthAt(float frame) {
            return strokeWidth == null ? 1f : strokeWidth.at(frame)[0];
        }
    }

    static final class Transform {
        Prop o, r, p, a, s;

        static Transform parse(JSONObject o) {
            if (o == null) return null;
            Transform t = new Transform();
            t.o = Prop.parse(o.optJSONObject("o"));
            t.r = Prop.parse(o.optJSONObject("r"));
            t.p = Prop.parse(o.optJSONObject("p"));
            t.a = Prop.parse(o.optJSONObject("a"));
            t.s = Prop.parse(o.optJSONObject("s"));
            return t;
        }

        Matrix matrix(float frame) {
            float[] pv = p == null ? new float[] {0, 0} : p.at(frame);
            float[] av = a == null ? new float[] {0, 0} : a.at(frame);
            float[] sv = s == null ? new float[] {100, 100} : s.at(frame);
            float rv = r == null ? 0 : r.at(frame)[0];
            Matrix m = new Matrix();
            m.postTranslate(-av[0], -av[1]);
            m.postScale(sv[0] / 100f, sv.length > 1 ? sv[1] / 100f : sv[0] / 100f);
            m.postRotate(rv);
            m.postTranslate(pv[0], pv.length > 1 ? pv[1] : 0);
            return m;
        }
    }

    /** 可静态也可关键帧的属性。标量返回长度 1，向量返回长度 2/3。 */
    static final class Prop {
        boolean animated;
        float[] k;
        Kf[] kfs;

        static Prop parse(JSONObject o) {
            if (o == null) return null;
            Prop p = new Prop();
            if (o.optInt("a", 0) == 1) {
                p.animated = true;
                JSONArray arr = o.optJSONArray("k");
                if (arr == null) { p.animated = false; p.k = new float[] {0}; return p; }
                List<Kf> list = new ArrayList<Kf>();
                for (int i = 0; i < arr.length(); i++) {
                    JSONObject ko = arr.optJSONObject(i);
                    if (ko == null) continue;
                    Kf kf = new Kf();
                    kf.t = (float) ko.optDouble("t", 0);
                    kf.s = numArray(ko.optJSONArray("s"));
                    kf.e = numArray(ko.optJSONArray("e"));
                    JSONObject i2 = ko.optJSONObject("i");
                    JSONObject o2 = ko.optJSONObject("o");
                    if (i2 != null) { kf.ix = (float) i2.optDouble("x", 0); kf.iy = (float) i2.optDouble("y", 0); }
                    if (o2 != null) { kf.ox = (float) o2.optDouble("x", 0); kf.oy = (float) o2.optDouble("y", 0); }
                    list.add(kf);
                }
                p.kfs = list.toArray(new Kf[0]);
                if (p.kfs.length == 0) { p.animated = false; p.k = new float[] {0}; }
            } else {
                Object v = o.opt("k");
                p.k = scalarOrArray(v);
            }
            return p;
        }

        float[] at(float frame) {
            if (!animated || kfs == null) return k == null ? new float[] {0} : k;
            if (frame <= kfs[0].t) return valueOf(kfs[0], 0);
            if (frame >= kfs[kfs.length - 1].t) {
                Kf last = kfs[kfs.length - 1];
                return last.e != null ? last.e : valueOf(last, 0);
            }
            for (int i = 0; i < kfs.length - 1; i++) {
                Kf a = kfs[i], b = kfs[i + 1];
                if (frame >= a.t && frame <= b.t) {
                    float span = b.t - a.t;
                    float f = span <= 0 ? 1f : (frame - a.t) / span;
                    float eased = ease(f, a.ox, a.oy, b.ix, b.iy);
                    float[] va = a.e != null ? a.e : a.s;
                    float[] vb = b.s;
                    if (va == null || vb == null) return va != null ? va : new float[] {0};
                    int n = Math.min(va.length, vb.length);
                    float[] r = new float[n];
                    for (int j = 0; j < n; j++) r[j] = va[j] + (vb[j] - va[j]) * eased;
                    return r;
                }
            }
            return valueOf(kfs[kfs.length - 1], 0);
        }

        Path path(float frame) {
            return pathFromJson();   // 首版只支持静态路径（关键帧变换已支持）
        }

        private JSONObject raw;   // 形状属性的原始 JSON（path 用）

        private Path pathFromJson() {
            if (raw == null) return null;
            JSONObject shape = null;
            if (raw.optInt("a", 0) == 1) {
                JSONArray arr = raw.optJSONArray("k");
                if (arr == null || arr.length() == 0) return null;
                JSONObject first = arr.optJSONObject(0);
                shape = first == null ? null : first.optJSONObject("s");
                if (shape == null && first != null) shape = first;   // 有的直接是形状
            } else {
                shape = raw.optJSONObject("k");
            }
            if (shape == null) return null;
            JSONArray i = shape.optJSONArray("i");
            JSONArray o = shape.optJSONArray("o");
            JSONArray v = shape.optJSONArray("v");
            boolean closed = shape.optBoolean("c", false);
            if (v == null || i == null || o == null) return null;
            int n = v.length();
            if (n == 0) return null;
            Path path = new Path();
            path.moveTo((float) v.optJSONArray(0).optDouble(0), (float) v.optJSONArray(0).optDouble(1));
            for (int s = 0; s < n; s++) {
                int s2 = (s + 1) % n;
                if (s2 == 0 && !closed) break;
                JSONArray oo = o.optJSONArray(s);
                JSONArray ii = i.optJSONArray(s2);
                JSONArray vv = v.optJSONArray(s2);
                float c1x = (float) v.optJSONArray(s).optDouble(0) + (float) oo.optDouble(0);
                float c1y = (float) v.optJSONArray(s).optDouble(1) + (float) oo.optDouble(1);
                float c2x = (float) vv.optDouble(0) + (float) ii.optDouble(0);
                float c2y = (float) vv.optDouble(1) + (float) ii.optDouble(1);
                path.cubicTo(c1x, c1y, c2x, c2y, (float) vv.optDouble(0), (float) vv.optDouble(1));
            }
            if (closed) path.close();
            return path;
        }
    }

    static final class Kf {
        float t;
        float[] s, e;
        float ix, iy, ox, oy;
    }

    private static float[] valueOf(Kf kf, int which) {
        float[] v = which == 1 ? kf.e : kf.s;
        return v == null ? new float[] {0} : v;
    }

    private static float[] scalarOrArray(Object v) {
        if (v instanceof Number) return new float[] {((Number) v).floatValue()};
        if (v instanceof JSONArray) return numArray((JSONArray) v);
        return new float[] {0};
    }

    private static float[] numArray(JSONArray a) {
        if (a == null) return null;
        float[] r = new float[a.length()];
        for (int i = 0; i < a.length(); i++) {
            Object o = a.opt(i);
            r[i] = (o instanceof Number) ? ((Number) o).floatValue() : 0f;
        }
        return r;
    }

    /** 三次贝塞尔缓动：给定进度 x，求 y。 */
    private static float ease(float x, float x1, float y1, float x2, float y2) {
        if (x1 == y1 && x2 == y2) return x;   // 线性
        float t = x;
        for (int i = 0; i < 6; i++) {
            float xt = bezier(t, x1, x2) - x;
            if (Math.abs(xt) < 1e-4) break;
            float d = bezierDeriv(t, x1, x2);
            if (Math.abs(d) < 1e-6) break;
            t -= xt / d;
            t = Math.max(0, Math.min(1, t));
        }
        return bezier(t, y1, y2);
    }

    private static float bezier(float t, float p1, float p2) {
        float mt = 1 - t;
        return 3 * mt * mt * t * p1 + 3 * mt * t * t * p2 + t * t * t;
    }

    private static float bezierDeriv(float t, float p1, float p2) {
        float mt = 1 - t;
        return 3 * mt * mt * p1 + 6 * mt * t * (p2 - p1) + 3 * t * t * (1 - p2);
    }
}
