#!/usr/bin/env python3
"""从官方 TL schema（telegram/schema/*.tl）生成 Java 类型表 TlTypes.java。

这样解析 user / message / dialog 等庞大类型时不必手写字段顺序，
只要按构造器编号查表即可；遇到新字段时重新生成即可。

用法：python3 scripts/gen_tl_schema.py
"""
import os
import re
import sys

WS = os.environ.get('WORKSPACE') or os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SCHEMA = [f'{WS}/telegram/schema/mtproto.tl', f'{WS}/telegram/schema/api.tl']
OUT = f'{WS}/telegram/generated/cc/wuersan008/eclairgram/mtproto/TlTypes.java'

PRIM = {
    'int': 'INT', 'long': 'LONG', 'int128': 'INT128', 'int256': 'INT256',
    'double': 'DOUBLE', 'string': 'STRING', 'bytes': 'BYTES',
    'Bool': 'BOOL', 'true': 'TRUE', 'True': 'TRUE', 'date': 'INT', 'Object': 'OBJECT',
    'Int': 'INT', 'Long': 'LONG', 'String': 'STRING', 'Bytes': 'BYTES', 'Double': 'DOUBLE',
}


def parse_field(tok):
    """返回 (name, kind, ref, flag_source, flag_bit)。"""
    if ':' not in tok:
        return None
    name, typ = tok.split(':', 1)
    flag_source, bit = 0, -1
    m = re.match(r'^flags(\d*)\.(\d+)\?(.*)$', typ)
    if m:
        flag_source = 2 if m.group(1) == '2' else 1
        bit = int(m.group(2))
        typ = m.group(3)
    if typ == '#':
        # flags 字段本身：读一个 int32
        return (name, 'FLAGWORD', '', flag_source, bit)
    vec = re.match(r'^[Vv]ector<(.+)>$', typ)
    if vec:
        elem = vec.group(1)
        if elem in PRIM:
            return (name, 'VECTOR', PRIM[elem], flag_source, bit)
        return (name, 'VECTOR', elem, flag_source, bit)
    if typ in PRIM:
        return (name, PRIM[typ], '', flag_source, bit)
    # 其余按“盒装类型”处理：读一个构造器编号再递归
    return (name, 'OBJECT', typ, flag_source, bit)


def main():
    specs = {}
    for path in SCHEMA:
        if not os.path.exists(path):
            continue
        for line in open(path, encoding='utf-8'):
            line = line.strip()
            if not line or line.startswith('//'):
                continue
            m = re.match(r'^([\w.]+)#([0-9a-fA-F]+)\s*(.*?)\s*=\s*[\w.<>]+\s*;', line)
            if not m:
                continue
            name, cid, rhs = m.group(1), int(m.group(2), 16), m.group(3)
            fields = []
            for tok in rhs.split():
                f = parse_field(tok)
                if f:
                    fields.append(f)
            specs[cid] = (name, fields)

    os.makedirs(os.path.dirname(OUT), exist_ok=True)
    with open(OUT, 'w', encoding='utf-8') as fh:
        fh.write('package cc.wuersan008.eclairgram.mtproto;\n\n')
        fh.write('/**\n')
        fh.write(' * 由 scripts/gen_tl_schema.py 依据 telegram/schema/*.tl 自动生成，请勿手改。\n')
        fh.write(' *\n')
        fh.write(' * 每个构造器：编号 + 字段（名称、种类、引用类型、可选标志位）。\n')
        fh.write(' * 解析 user/message 这类字段极多的类型时，按字段顺序读取即可对齐。\n')
        fh.write(' */\n')
        fh.write('public final class TlTypes {\n')
        fh.write('    // kind\n')
        fh.write('    public static final int INT = 1, LONG = 2, INT128 = 3, INT256 = 4,\n')
        fh.write('        DOUBLE = 5, STRING = 6, BYTES = 7, BOOL = 8, TRUE = 9,\n')
        fh.write('        VECTOR = 10, OBJECT = 11, FLAGWORD = 12;\n\n')
        fh.write('    public static final class Field {\n')
        fh.write('        public final String name;\n        public final int kind;\n')
        fh.write('        public final String ref;\n        public final int flagSource;\n')
        fh.write('        public final int flagBit;\n')
        fh.write('        Field(String n, int k, String r, int fs, int fb) {\n')
        fh.write('            name = n; kind = k; ref = r; flagSource = fs; flagBit = fb;\n        }\n    }\n\n')
        fh.write('    public static final class Spec {\n')
        fh.write('        public final int id;\n        public final String name;\n')
        fh.write('        public final Field[] fields;\n')
        fh.write('        Spec(int i, String n, Field[] f) { id = i; name = n; fields = f; }\n    }\n\n')
        fh.write('    private static final java.util.HashMap<Integer, Spec> BY_ID =\n')
        fh.write('            new java.util.HashMap<Integer, Spec>();\n\n')
        fh.write('    public static Spec spec(int id) { return BY_ID.get(Integer.valueOf(id)); }\n\n')

        # 单个方法体不能超过 64KB：按估算大小分批放进多个 init 方法。
        batches = []
        cur, cur_size = [], 0
        for cid in sorted(specs):
            name, fields = specs[cid]
            size = 60 + 30 * len(fields)
            if cur and cur_size + size > 30000:
                batches.append(cur)
                cur, cur_size = [], 0
            cur.append(cid)
            cur_size += size
        if cur:
            batches.append(cur)

        fh.write('    static {\n')
        for i in range(len(batches)):
            fh.write('        init%d();\n' % i)
        fh.write('    }\n\n')

        for bi, batch in enumerate(batches):
            fh.write('    private static void init%d() {\n' % bi)
            for cid in batch:
                name, fields = specs[cid]
                jf = ', '.join(
                    'new Field("%s", %s, "%s", %d, %d)'
                    % (f[0], f[1], f[2].replace('"', ''), f[3], f[4]) for f in fields)
                fh.write('        BY_ID.put(Integer.valueOf(0x%08x),\n' % cid)
                fh.write('            new Spec(0x%08x, "%s", new Field[] { %s }));\n'
                         % (cid, name, jf))
            fh.write('    }\n\n')
        fh.write('    private TlTypes() {}\n}\n')
    print('生成', OUT, '构造器数', len(specs), '分批数', len(batches))


main()
