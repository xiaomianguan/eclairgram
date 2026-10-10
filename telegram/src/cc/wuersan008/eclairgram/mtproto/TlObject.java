package cc.wuersan008.eclairgram.mtproto;

import java.util.ArrayList;
import java.util.List;

/**
 * 通用的 TL 对象：按构造器编号查 {@link TlTypes} 表，按字段顺序读取。
 *
 * 用它解析 user / message / dialog 等字段很多的类型，就不必手写每个字段。
 * 未知的可选字段也能自动跳过（只要 schema 表覆盖了该构造器）。
 */
public final class TlObject {

    public final int id;
    public final TlTypes.Spec spec;
    private final Object[] values;

    TlObject(int id, TlTypes.Spec spec, Object[] values) {
        this.id = id;
        this.spec = spec;
        this.values = values;
    }

    public String type() {
        return spec.name;
    }

    public Object get(String name) {
        for (int i = 0; i < spec.fields.length; i++) {
            if (spec.fields[i].name.equals(name)) return values[i];
        }
        return null;
    }

    public String str(String name) {
        Object o = get(name);
        return o == null ? null : (String) o;
    }

    public int i32(String name) {
        Object o = get(name);
        return o == null ? 0 : ((Number) o).intValue();
    }

    public long i64(String name) {
        Object o = get(name);
        return o == null ? 0L : ((Number) o).longValue();
    }

    public boolean bool(String name) {
        Object o = get(name);
        return o instanceof Boolean && ((Boolean) o).booleanValue();
    }

    public TlObject obj(String name) {
        Object o = get(name);
        return o instanceof TlObject ? (TlObject) o : null;
    }

    @SuppressWarnings("unchecked")
    public List<Object> list(String name) {
        Object o = get(name);
        return o instanceof List ? (List<Object>) o : null;
    }

    @Override
    public String toString() {
        return spec.name + "#" + Integer.toHexString(id);
    }

    // ============================================================ 读取
    public static TlObject read(Tl.Reader r) {
        int id = r.int32();
        TlTypes.Spec spec = TlTypes.spec(id);
        if (spec == null) {
            throw new IllegalStateException("unknown constructor 0x" + Integer.toHexString(id));
        }
        Object[] vals = new Object[spec.fields.length];
        int flags = 0, flags2 = 0;
        for (int i = 0; i < spec.fields.length; i++) {
            TlTypes.Field f = spec.fields[i];
            if (f.kind == TlTypes.FLAGWORD) {
                int v = r.int32();
                vals[i] = Integer.valueOf(v);
                if ("flags2".equals(f.name)) flags2 = v;
                else flags = v;
            } else if (f.kind == TlTypes.TRUE) {
                vals[i] = Boolean.valueOf(bitSet(f, flags, flags2));
            } else if (f.flagSource != 0 && !bitSet(f, flags, flags2)) {
                vals[i] = null;
            } else {
                vals[i] = readValue(r, f.kind, f.ref);
            }
        }
        return new TlObject(id, spec, vals);
    }

    private static boolean bitSet(TlTypes.Field f, int flags, int flags2) {
        int w = f.flagSource == 2 ? flags2 : flags;
        return (w & (1 << f.flagBit)) != 0;
    }

    private static Object readValue(Tl.Reader r, int kind, String ref) {
        switch (kind) {
            case TlTypes.INT: return Integer.valueOf(r.int32());
            case TlTypes.LONG: return Long.valueOf(r.int64());
            case TlTypes.INT128: return r.read(16);
            case TlTypes.INT256: return r.read(32);
            case TlTypes.DOUBLE: return Double.valueOf(Double.longBitsToDouble(r.int64()));
            case TlTypes.STRING: return r.string();
            case TlTypes.BYTES: return r.bytes();
            case TlTypes.BOOL: {
                int v = r.int32();
                return Boolean.valueOf(v == 0x997275b5);
            }
            case TlTypes.OBJECT: return read(r);
            case TlTypes.VECTOR: {
                r.int32(); // 0x1cb5c415
                int n = r.int32();
                List<Object> out = new ArrayList<Object>(n);
                int elemKind = elementKind(ref);
                for (int i = 0; i < n; i++) {
                    out.add(readValue(r, elemKind, ref));
                }
                return out;
            }
            default:
                throw new IllegalStateException("bad field kind " + kind);
        }
    }

    private static int elementKind(String ref) {
        if (ref == null) return TlTypes.OBJECT;
        if (ref.equals("INT")) return TlTypes.INT;
        if (ref.equals("LONG")) return TlTypes.LONG;
        if (ref.equals("DOUBLE")) return TlTypes.DOUBLE;
        if (ref.equals("STRING")) return TlTypes.STRING;
        if (ref.equals("BYTES")) return TlTypes.BYTES;
        if (ref.equals("BOOL")) return TlTypes.BOOL;
        return TlTypes.OBJECT;
    }
}
