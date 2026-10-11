package cc.wuersan008.eclairgram;

import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Path;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.GZIPInputStream;

/**
 * Telegram 动图贴纸（TGS = gzip 后的 Lottie JSON）的最小渲染器。
 *
 * 只实现 Telegram 贴纸实际用到的子集：null 层 / 形状层、组(gr)、路径(sh)、
 * 填充(fl)、描边(st)、组变换(tr)、父子层、层的可见区间(ip/op)，以及
 * 位置/缩放/旋转/不透明度和**路径形状**的关键帧（含三次贝塞尔缓动）。
 * 不使用遮罩、图片、预合成、渐变（贴纸里没有）。
 *
 * 内存：解析走自带的 {@link JsonReader}（拉取式、不建中间树），直接构建模型，
 * 避免 org.json 在 16MB 堆的老设备上解析时 OOM；渲染也尽量零分配。
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

    // 按递归深度复用的矩阵（渲染是单线程，逐帧复用即可）
    private static final int MAX_DEPTH = 24;
    private final Matrix[] poolA = newMatrixPool();
    private final Matrix[] poolB = newMatrixPool();
    private final Matrix tmpMatrix = new Matrix();
    private final float[] mvals = new float[9];

    private static Matrix[] newMatrixPool() {
        Matrix[] p = new Matrix[MAX_DEPTH];
        for (int i = 0; i < p.length; i++) p[i] = new Matrix();
        return p;
    }

    private Lottie(JsonReader j) {
        int w = 512, h = 512;
        float fr = 60, ip = 0, op = 0;
        List<Layer> ls = new ArrayList<Layer>();
        if (j.enterObject()) {
            String name;
            while ((name = j.nextName()) != null) {
                if (name.equals("w")) w = (int) j.number();
                else if (name.equals("h")) h = (int) j.number();
                else if (name.equals("fr")) fr = (float) j.number();
                else if (name.equals("ip")) ip = (float) j.number();
                else if (name.equals("op")) op = (float) j.number();
                else if (name.equals("layers")) parseLayers(j, ls, ip, op);
                else j.skipValue();
            }
        }
        width = w;
        height = h;
        frameRate = fr;
        inFrame = ip;
        outFrame = op;
        layers.addAll(ls);
    }

    public static Lottie parse(byte[] tgs) {
        if (tgs == null || tgs.length < 8) return null;
        try {
            byte[] json = tgs;
            if ((tgs[0] & 0xff) == 0x1f && (tgs[1] & 0xff) == 0x8b) json = gunzip(tgs);
            return new Lottie(new JsonReader(new String(json, "UTF-8")));
        } catch (Throwable t) {
            return null;
        }
    }

    public float durationMs() {
        if (frameRate <= 0 || outFrame <= inFrame) return 1000f;
        return (outFrame - inFrame) / frameRate * 1000f;
    }

    // ======================================================== 解析（拉取式，不建树）
    private static void parseLayers(JsonReader j, List<Layer> out, float defIp, float defOp) {
        if (!j.enterArray()) return;
        while (j.hasNext()) out.add(parseLayer(j, defIp, defOp));
    }

    private static Layer parseLayer(JsonReader j, float defIp, float defOp) {
        Layer l = new Layer();
        l.ip = defIp;
        l.op = defOp;
        if (j.enterObject()) {
            String name;
            while ((name = j.nextName()) != null) {
                if (name.equals("ty")) l.type = (int) j.number();
                else if (name.equals("ind")) l.ind = (int) j.number();
                else if (name.equals("parent")) l.parent = (int) j.number();
                else if (name.equals("ip")) l.ip = (float) j.number();
                else if (name.equals("op")) l.op = (float) j.number();
                else if (name.equals("st")) l.st = (float) j.number();
                else if (name.equals("ks")) l.ks = Transform.parse(j);
                else if (name.equals("shapes")) l.shapes = parseShapes(j);
                else j.skipValue();
            }
        }
        return l;
    }

    private static List<Shape> parseShapes(JsonReader j) {
        if (!j.enterArray()) return null;
        List<Shape> out = new ArrayList<Shape>();
        while (j.hasNext()) {
            Shape s = new Shape();
            boolean isTr = false;
            if (j.enterObject()) {
                String name;
                while ((name = j.nextName()) != null) {
                    if (name.equals("ty")) s.ty = j.string();
                    else if (name.equals("it")) s.children = parseShapes(j);
                    else if (name.equals("ks") && "sh".equals(s.ty)) s.path = PathProp.parse(j);
                    else if (name.equals("c") && ("fl".equals(s.ty) || "st".equals(s.ty))) s.color = Prop.parse(j);
                    else if (name.equals("o") && ("fl".equals(s.ty) || "st".equals(s.ty))) s.opacity = Prop.parse(j);
                    else if (name.equals("w") && "st".equals(s.ty)) s.strokeWidth = Prop.parse(j);
                    else if (name.equals("o") && "tr".equals(s.ty)) s.trO = Prop.parse(j);
                    else if (name.equals("r") && "tr".equals(s.ty)) s.trR = Prop.parse(j);
                    else if (name.equals("p") && "tr".equals(s.ty)) s.trP = Prop.parse(j);
                    else if (name.equals("a") && "tr".equals(s.ty)) s.trA = Prop.parse(j);
                    else if (name.equals("s") && "tr".equals(s.ty)) s.trS = Prop.parse(j);
                    else j.skipValue();
                }
            }
            if ("gr".equals(s.ty) && s.children != null) {
                // 组里通常带一个 tr 子形状，把它作为组的变换
                for (Shape c : s.children) {
                    if ("tr".equals(c.ty)) { s.tr = c.tr; break; }
                }
            }
            if ("tr".equals(s.ty)) {
                // 组内变换：单独挂在父组上
                s.tr = new Transform(s.trO, s.trR, s.trP, s.trA, s.trS);
                s.children = null;
                out.add(s);
            } else {
                out.add(s);
            }
        }
        return out;
    }

    static final class Transform {
        Prop o, r, p, a, s;

        Transform() {}

        Transform(Prop o, Prop r, Prop p, Prop a, Prop s) {
            this.o = o; this.r = r; this.p = p; this.a = a; this.s = s;
        }

        static Transform parse(JsonReader j) {
            Transform t = new Transform();
            if (j.enterObject()) {
                String name;
                while ((name = j.nextName()) != null) {
                    if (name.equals("o")) t.o = Prop.parse(j);
                    else if (name.equals("r")) t.r = Prop.parse(j);
                    else if (name.equals("p")) t.p = Prop.parse(j);
                    else if (name.equals("a")) t.a = Prop.parse(j);
                    else if (name.equals("s")) t.s = Prop.parse(j);
                    else j.skipValue();
                }
            }
            return t;
        }

        /** 把变换写进 m（不分配）。 */
        void apply(Matrix m, float frame) {
            float[] pv = p == null ? DEF_POS : p.at(frame);
            float[] av = a == null ? DEF_ZERO : a.at(frame);
            float[] sv = s == null ? DEF_SCALE : s.at(frame);
            float rv = r == null ? 0 : r.at(frame)[0];
            m.reset();
            m.postTranslate(-av[0], av.length > 1 ? -av[1] : 0);
            m.postScale(sv[0] / 100f, sv.length > 1 ? sv[1] / 100f : sv[0] / 100f);
            m.postRotate(rv);
            m.postTranslate(pv[0], pv.length > 1 ? pv[1] : 0);
        }
    }

    private static final float[] DEF_POS = {0, 0};
    private static final float[] DEF_ZERO = {0, 0};
    private static final float[] DEF_SCALE = {100, 100};

    /** 标量/向量属性（颜色、不透明度、线宽、变换分量）。值写进复用的暂存数组。 */
    static final class Prop {
        boolean animated;
        float[] k;
        Kf[] kfs;
        private float[] out = new float[4];

        static Prop parse(JsonReader j) {
            Prop p = new Prop();
            boolean anim = false;
            List<Kf> kfs = null;
            float[] kv = null;
            if (j.enterObject()) {
                String name;
                while ((name = j.nextName()) != null) {
                    if (name.equals("a")) anim = ((int) j.number()) == 1;
                    else if (name.equals("k")) {
                        if (anim) kfs = parseKfs(j);
                        else kv = parseNumbers(j);
                    } else j.skipValue();
                }
            }
            if (anim && kfs != null && !kfs.isEmpty()) {
                p.animated = true;
                p.kfs = kfs.toArray(new Kf[0]);
            } else {
                p.k = kv == null ? DEF_ZERO : kv;
            }
            return p;
        }

        float[] at(float frame) {
            if (!animated || kfs == null) return k == null ? DEF_ZERO : k;
            Kf a = null, b = null;
            if (frame <= kfs[0].t) return fill(kfs[0]);
            if (frame >= kfs[kfs.length - 1].t) return fill(kfs[kfs.length - 1]);
            for (int i = 0; i < kfs.length - 1; i++) {
                if (frame >= kfs[i].t && frame <= kfs[i + 1].t) { a = kfs[i]; b = kfs[i + 1]; break; }
            }
            if (a == null || b == null) return fill(kfs[kfs.length - 1]);
            float span = b.t - a.t;
            float f = span <= 0 ? 1f : (frame - a.t) / span;
            float eased = ease(f, a.ox, a.oy, b.ix, b.iy);
            float[] va = a.e != null ? a.e : a.s;
            float[] vb = b.s;
            if (va == null || vb == null) return va != null ? va : DEF_ZERO;
            int n = Math.min(va.length, vb.length);
            if (out.length < n) out = new float[n];
            for (int j = 0; j < n; j++) out[j] = va[j] + (vb[j] - va[j]) * eased;
            return out;
        }

        private float[] fill(Kf kf) {
            float[] v = kf.s;
            if (v == null) return DEF_ZERO;
            if (out.length < v.length) out = new float[v.length];
            System.arraycopy(v, 0, out, 0, v.length);
            return out;
        }
    }

    /** 路径形状属性（关键帧之间做顶点插值 = 变形动画）。顶点写进复用的 Sd。 */
    static final class PathProp {
        boolean animated;
        Sd[] kfs;
        float[] t;
        float[] ix, iy, ox, oy;
        private final Sd scratch = new Sd();

        static PathProp parse(JsonReader j) {
            PathProp p = new PathProp();
            boolean anim = false;
            Sd single = null;
            List<Sd> kfs = null;
            List<Float> times = null;
            List<Float> bix = null, biy = null, box = null, boy = null;
            if (j.enterObject()) {
                String name;
                while ((name = j.nextName()) != null) {
                    if (name.equals("a")) anim = ((int) j.number()) == 1;
                    else if (name.equals("k")) {
                        if (anim) {
                            kfs = new ArrayList<Sd>();
                            times = new ArrayList<Float>();
                            bix = new ArrayList<Float>(); biy = new ArrayList<Float>();
                            box = new ArrayList<Float>(); boy = new ArrayList<Float>();
                            if (j.enterArray()) {
                                while (j.hasNext()) {
                                    float t = 0, iX = 0, iY = 0, oX = 0, oY = 0;
                                    Sd sd = null;
                                    if (j.enterObject()) {
                                        String kn;
                                        while ((kn = j.nextName()) != null) {
                                            if (kn.equals("t")) t = (float) j.number();
                                            else if (kn.equals("s")) sd = readSd(j);
                                            else if (kn.equals("i")) { float[] v = readBezier(j); iX = v[0]; iY = v[1]; }
                                            else if (kn.equals("o")) { float[] v = readBezier(j); oX = v[0]; oY = v[1]; }
                                            else j.skipValue();
                                        }
                                    }
                                    kfs.add(sd == null ? new Sd() : sd);
                                    times.add(Float.valueOf(t));
                                    bix.add(Float.valueOf(iX)); biy.add(Float.valueOf(iY));
                                    box.add(Float.valueOf(oX)); boy.add(Float.valueOf(oY));
                                }
                            }
                        } else {
                            single = readSd(j);
                        }
                    } else j.skipValue();
                }
            }
            if (anim && kfs != null && !kfs.isEmpty()) {
                int m = kfs.size();
                p.animated = true;
                p.kfs = kfs.toArray(new Sd[0]);
                p.t = new float[m];
                p.ix = new float[m]; p.iy = new float[m];
                p.ox = new float[m]; p.oy = new float[m];
                for (int i = 0; i < m; i++) {
                    p.t[i] = times.get(i).floatValue();
                    p.ix[i] = bix.get(i).floatValue(); p.iy[i] = biy.get(i).floatValue();
                    p.ox[i] = box.get(i).floatValue(); p.oy[i] = boy.get(i).floatValue();
                }
            } else {
                p.kfs = new Sd[] { single == null ? new Sd() : single };
                p.t = new float[] {0};
            }
            return p;
        }

        /** 把第 frame 帧的路径写进 out 并返回（不分配）。 */
        Path path(float frame, Path out) {
            Sd sd = pick(frame);
            if (sd == null || sd.vx == null || sd.vx.length == 0) return null;
            if (!sd.finite()) return null;   // 顶点含 NaN/Inf 时别交给 Skia（会崩）
            out.rewind();
            int n = sd.vx.length;
            out.moveTo(sd.vx[0], sd.vy[0]);
            for (int s = 0; s < n; s++) {
                int s2 = (s + 1) % n;
                if (s2 == 0 && !sd.closed) break;
                out.cubicTo(sd.vx[s] + sd.ox[s], sd.vy[s] + sd.oy[s],
                        sd.vx[s2] + sd.ix[s2], sd.vy[s2] + sd.iy[s2], sd.vx[s2], sd.vy[s2]);
            }
            if (sd.closed) out.close();
            return out;
        }

        private Sd pick(float frame) {
            if (!animated || kfs.length == 1) return kfs[0];
            if (frame <= t[0]) return kfs[0];
            if (frame >= t[t.length - 1]) return kfs[kfs.length - 1];
            int i = 0;
            while (i < t.length - 1 && !(frame >= t[i] && frame <= t[i + 1])) i++;
            if (i >= t.length - 1) return kfs[kfs.length - 1];
            float span = t[i + 1] - t[i];
            float f = span <= 0 ? 1f : (frame - t[i]) / span;
            float e = ease(f, ox[i], oy[i], ix[i + 1], iy[i + 1]);
            return scratch.lerpInto(kfs[i], kfs[i + 1], e);
        }
    }

    /** 一条路径的顶点/切线数据（可复用）。 */
    static final class Sd {
        float[] vx, vy, ix, iy, ox, oy;
        boolean closed;

        void ensure(int n) {
            if (vx == null || vx.length < n) {
                vx = new float[n]; vy = new float[n];
                ix = new float[n]; iy = new float[n];
                ox = new float[n]; oy = new float[n];
            }
        }

        void setV(float[] p) { ensure(p.length / 2); for (int k = 0; k < p.length / 2; k++) { vx[k] = p[2 * k]; vy[k] = p[2 * k + 1]; } }
        void setI(float[] p) { ensure(p.length / 2); for (int k = 0; k < p.length / 2; k++) { ix[k] = p[2 * k]; iy[k] = p[2 * k + 1]; } }
        void setO(float[] p) { ensure(p.length / 2); for (int k = 0; k < p.length / 2; k++) { ox[k] = p[2 * k]; oy[k] = p[2 * k + 1]; } }

        Sd lerpInto(Sd a, Sd b, float f) {
            int n = Math.min(a.vx.length, b.vx.length);
            if (n == 0) { closed = a.closed; return this; }
            ensure(n);
            for (int k = 0; k < n; k++) {
                vx[k] = a.vx[k] + (b.vx[k] - a.vx[k]) * f;
                vy[k] = a.vy[k] + (b.vy[k] - a.vy[k]) * f;
                ix[k] = a.ix[k] + (b.ix[k] - a.ix[k]) * f;
                iy[k] = a.iy[k] + (b.iy[k] - a.iy[k]) * f;
                ox[k] = a.ox[k] + (b.ox[k] - a.ox[k]) * f;
                oy[k] = a.oy[k] + (b.oy[k] - a.oy[k]) * f;
            }
            closed = a.closed;
            return this;
        }

        boolean finite() {
            int n = vx == null ? 0 : vx.length;
            for (int i = 0; i < n; i++) {
                if (bad(vx[i]) || bad(vy[i]) || bad(ix[i]) || bad(iy[i])
                        || bad(ox[i]) || bad(oy[i])) return false;
            }
            return true;
        }

        private static boolean bad(float v) {
            return Float.isNaN(v) || Float.isInfinite(v);
        }
    }

    static final class Kf {
        float t;
        float[] s, e;
        float ix, iy, ox, oy;
    }

    /** 读一个形状对象 {i,o,v,c}；也接受外面再包一层数组的形式。 */
    private static Sd readSd(JsonReader j) {
        if (j.peek() == '[') {
            j.enterArray();
            Sd sd = null;
            while (j.hasNext()) {
                Sd x = parseSd(j);
                if (sd == null) sd = x;
            }
            return sd;
        }
        return parseSd(j);
    }

    private static Sd parseSd(JsonReader j) {
        Sd d = new Sd();
        if (j.enterObject()) {
            String name;
            while ((name = j.nextName()) != null) {
                if (name.equals("v")) d.setV(readPoints(j));
                else if (name.equals("i")) d.setI(readPoints(j));
                else if (name.equals("o")) d.setO(readPoints(j));
                else if (name.equals("c")) d.closed = j.bool();
                else j.skipValue();
            }
        }
        return d;
    }

    /** 读 [[x,y],...] 为交错数组 [x0,y0,x1,y1,...]。 */
    private static float[] readPoints(JsonReader j) {
        if (!j.enterArray()) return new float[0];
        float[] buf = new float[8];
        int n = 0;
        while (j.hasNext()) {
            j.enterArray();
            float x = (float) j.number();
            float y = 0;
            if (j.hasNext()) y = (float) j.number();   // hasNext 会吃掉 x、y 之间的逗号
            while (j.hasNext()) j.number();            // 忽略 z
            if (n + 2 > buf.length) {
                float[] nb = new float[buf.length * 2];
                System.arraycopy(buf, 0, nb, 0, n);
                buf = nb;
            }
            buf[n++] = x;
            buf[n++] = y;
        }
        float[] r = new float[n];
        System.arraycopy(buf, 0, r, 0, n);
        return r;
    }

    private static float[] readBezier(JsonReader j) {
        float x = 0, y = 0;
        if (j.enterObject()) {
            String name;
            while ((name = j.nextName()) != null) {
                if (name.equals("x")) x = (float) j.number();
                else if (name.equals("y")) y = (float) j.number();
                else j.skipValue();
            }
        }
        return new float[] { x, y };
    }

    private static List<Kf> parseKfs(JsonReader j) {
        List<Kf> out = new ArrayList<Kf>();
        if (!j.enterArray()) return out;
        while (j.hasNext()) {
            Kf kf = new Kf();
            if (j.enterObject()) {
                String name;
                while ((name = j.nextName()) != null) {
                    if (name.equals("t")) kf.t = (float) j.number();
                    else if (name.equals("s")) kf.s = parseNumbers(j);
                    else if (name.equals("e")) kf.e = parseNumbers(j);
                    else if (name.equals("i")) { float[] v = readBezier(j); kf.ix = v[0]; kf.iy = v[1]; }
                    else if (name.equals("o")) { float[] v = readBezier(j); kf.ox = v[0]; kf.oy = v[1]; }
                    else j.skipValue();
                }
            }
            out.add(kf);
        }
        return out;
    }

    /** 数字 或 [数字...]。 */
    private static float[] parseNumbers(JsonReader j) {
        if (j.peek() == '[') {
            j.enterArray();
            float[] buf = new float[4];
            int n = 0;
            while (j.hasNext()) {
                if (n == buf.length) {
                    float[] nb = new float[n * 2];
                    System.arraycopy(buf, 0, nb, 0, n);
                    buf = nb;
                }
                buf[n++] = (float) j.number();
            }
            float[] r = new float[n];
            System.arraycopy(buf, 0, r, 0, n);
            return r;
        }
        return new float[] { (float) j.number() };
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

    // ======================================================== 渲染
    /** 把第 frame 帧画到 canvas（canvas 坐标已按贴纸显示尺寸缩放好）。 */
    public void render(Canvas canvas, float frame) {
        if (canvas == null) return;
        if (frame < inFrame) frame = inFrame;
        if (frame >= outFrame) frame = outFrame - 1;
        for (int i = layers.size() - 1; i >= 0; i--) {
            Layer l = layers.get(i);
            if (l.type != 3 && l.type != 4) continue;
            if (frame < l.ip || frame >= l.op) continue;
            // 层的关键帧时间是「层内时间」：相对层的起始时间 st
            float lf = frame - l.st;
            Matrix m = worldMatrix(l, lf, 0);
            drawLayer(canvas, l, m, lf);
        }
    }

    private Matrix worldMatrix(Layer l, float frame, int depth) {
        if (depth >= MAX_DEPTH) return poolA[0];
        Matrix local = poolA[depth];
        if (l.ks != null) l.ks.apply(local, frame);
        else local.reset();
        if (l.parent == 0) return local;
        Layer p = findByInd(l.parent);
        if (p == null) return local;
        Matrix pm = worldMatrix(p, frame, depth + 1);
        Matrix out = poolB[depth];
        out.set(pm);
        out.preConcat(local);
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
        if (!finite(base)) return;      // 变换矩阵若含 NaN/Inf，交给 Skia 会直接崩
        canvas.save();
        canvas.concat(base);
        drawShapes(canvas, l.shapes, frame);
        canvas.restore();
    }

    private boolean finite(Matrix m) {
        m.getValues(mvals);
        for (int i = 0; i < 9; i++) {
            float v = mvals[i];
            if (Float.isNaN(v) || Float.isInfinite(v)) return false;
        }
        return true;
    }

    private void drawShapes(Canvas canvas, List<Shape> shapes, float frame) {
        int n = shapes.size();
        for (int i = 0; i < n; i++) {
            Shape p = shapes.get(i);
            if (!"sh".equals(p.ty) || p.path == null) continue;
            Path path = p.path.path(frame, p.scratchPath);
            if (path == null) continue;
            for (int j = 0; j < n; j++) {
                Shape f = shapes.get(j);
                if (!"fl".equals(f.ty)) continue;
                paint.setStyle(Paint.Style.FILL);
                paint.setColor(f.colorAt(frame));
                paint.setAlpha(applyOpacity(paint.getAlpha(), f.opacityAt(frame)));
                canvas.drawPath(path, paint);
            }
            for (int j = 0; j < n; j++) {
                Shape st = shapes.get(j);
                if (!"st".equals(st.ty)) continue;
                float sw = st.strokeWidthAt(frame);
                if (Float.isNaN(sw) || sw <= 0f) sw = 1f;
                if (sw > 200f) sw = 200f;
                paint.setStyle(Paint.Style.STROKE);
                paint.setStrokeWidth(sw);
                paint.setColor(st.colorAt(frame));
                paint.setAlpha(applyOpacity(paint.getAlpha(), st.opacityAt(frame)));
                paint.setStrokeCap(Paint.Cap.ROUND);
                paint.setStrokeJoin(Paint.Join.ROUND);
                canvas.drawPath(path, paint);
            }
        }
        for (int i = 0; i < n; i++) {
            Shape g = shapes.get(i);
            if (!"gr".equals(g.ty)) continue;
            canvas.save();
            if (g.tr != null) {
                g.tr.apply(tmpMatrix, frame);
                canvas.concat(tmpMatrix);
            }
            if (g.children != null) drawShapes(canvas, g.children, frame);
            canvas.restore();
        }
    }

    private static int applyOpacity(int color, float op) {   // op 0..100
        int a = Color.alpha(color);
        int na = (int) (a * Math.max(0f, Math.min(100f, op)) / 100f);
        return (color & 0x00ffffff) | (na << 24);
    }

    // ======================================================== 模型
    static final class Layer {
        int type, ind, parent;
        float ip, op, st;
        Transform ks;
        List<Shape> shapes;
    }

    static final class Shape {
        String ty;
        PathProp path;                      // sh
        Prop color, opacity, strokeWidth;   // fl / st
        Transform tr;                       // gr（由 tr 子形状合成）
        Prop trO, trR, trP, trA, trS;       // tr 的临时分量
        List<Shape> children;               // gr
        final Path scratchPath = new Path();   // 复用的路径（单线程渲染）

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

    /** 三次贝塞尔缓动：给定进度 x，求 y。 */
    private static float ease(float x, float x1, float y1, float x2, float y2) {
        if (x1 == y1 && x2 == y2) return x;   // 线性
        if (Float.isNaN(x1) || Float.isNaN(y1) || Float.isNaN(x2) || Float.isNaN(y2)) return x;
        float t = x;
        for (int i = 0; i < 6; i++) {
            float xt = bezier(t, x1, x2) - x;
            if (Math.abs(xt) < 1e-4) break;
            float d = bezierDeriv(t, x1, x2);
            if (Math.abs(d) < 1e-6) break;
            t -= xt / d;
            if (Float.isNaN(t) || Float.isInfinite(t)) return x;
            t = Math.max(0, Math.min(1, t));
        }
        float r = bezier(t, y1, y2);
        return (Float.isNaN(r) || Float.isInfinite(r)) ? x : r;
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
