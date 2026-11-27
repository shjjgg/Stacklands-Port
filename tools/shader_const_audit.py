#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""把原版 DXBC->GLSL 的"非平凡浮点常量"与移植 shader 源码做比对。
用于客观判定某个 shader 是逐指令直译、还是被意译/改写。
非平凡 = 小数位>=5 或 绝对值>2 的非整数。忽略 0/1/2/0.5 这类通用常量。"""
import glob, os, re, sys, json

PORT_GLOBS = 'Assets/Shaders/**/*.shader'

def load_port():
    src = {}
    for f in glob.glob(PORT_GLOBS, recursive=True):
        t = open(f, encoding='utf-8', errors='ignore').read()
        m = re.search(r'Shader\s+"([^"]+)"', t)
        if m: src[m.group(1)] = (f, t)
    return src

def port_floats(t):
    # 去掉注释
    t = re.sub(r'//[^\n]*', '', t)
    vals = []
    for m in re.finditer(r'[-+]?\d*\.?\d+(?:e[-+]?\d+)?', t):
        try: vals.append(float(m.group(0)))
        except: pass
    return vals

def orig_consts(path):
    t = open(path, encoding='utf-8', errors='ignore').read()
    lines = t.splitlines()
    out = []
    for i, l in enumerate(lines):
        for m in re.finditer(r'[-+]?(?:\d+\.\d{5,})(?:e[-+]?\d+)?', l):
            v = float(m.group(0))
            # 去掉 mach 量级噪声（如 1e-06 判定阈值）
            if abs(v) < 1e-4: continue
            out.append((v, i + 1, l.strip()))
    return out

TRIV = {0.0, 1.0, 2.0, 3.0, 4.0, 0.5, 0.25, 0.75, 10.0, 100.0, 16.0, 0.001, 1e-5}
# UnityStandardBRDF / GGX / 环境探针的常量：属于"引擎边界"，不参与直译判定
BRDF = {0.31830987334251404, 3.1415927410125732, 0.0010000000474974513,
        0.0020000000949949026, 0.03999999910593033, 0.9599999785423279,
        0.699999988079071, 1.7000000476837158, 0.00010000000474974513}

def main():
    port = load_port()
    rows = []
    for f in sorted(glob.glob('shader_extract/glsl_exact/*_PS.glsl')):
        name = os.path.basename(f).replace('_PS.glsl', '')
        # Custom__CardShaderTest__42 -> Custom/CardShaderTest
        mm = re.match(r'(.*)__([0-9]+)$', name)
        if not mm: continue
        key = mm.group(1).replace('__', '/').replace('_', ' ')
        # 找移植源码：按 shader 名匹配（忽略空格差异）
        hit = None
        for k, v in port.items():
            if k.replace(' ', '') == key.replace(' ', ''): hit = v; break
        if not hit: continue
        pv = port_floats(hit[1])
        miss = []
        for v, ln, ctx in orig_consts(f):
            if v in TRIV or v in BRDF: continue
            if not any(abs(v - p) <= max(abs(v), 1) * 1e-4 for p in pv):
                miss.append((v, ln, ctx))
        rows.append((key, mm.group(2), bool(hit), len(miss), miss))
    # 汇总：按 shader 名聚合
    agg = {}
    for key, var, _, nmiss, miss in rows:
        agg.setdefault(key, []).append((var, nmiss, miss))
    print("%-34s %5s %8s %8s" % ("shader", "变体", "最高覆盖", "最优变体"))
    best = {}
    for k in sorted(agg):
        cands = []
        for var, nmiss, miss in agg[k]:
            g = glob.glob('shader_extract/glsl_exact/%s__%s_PS.glsl' % (k.replace('/', '__').replace(' ', '_'), var))[0]
            n = len([1 for v, l, c in orig_consts(g) if v not in TRIV and v not in BRDF])
            cands.append(((n - nmiss) / n * 100 if n else 0, var, n, miss))
        cands.sort(reverse=True)
        best[k] = cands[0]
        print("%-34s %5d %7.1f%% %8s  (常量%d)" % (k, len(agg[k]), cands[0][0], cands[0][1], cands[0][2]))
    # 明细
    print("\n===== 各 shader 缺失常量明细（取最差变体）=====")
    for k in sorted(agg):
        c = best[k]
        if not c[3]: continue
        print("\n## %s (最优变体 %s, 覆盖率 %.1f%%, 缺 %d)" % (k, c[1], c[0], len(c[3])))
        seen = set()
        for v, ln, ctx in c[3]:
            if v in seen: continue
            seen.add(v)
            print("   %-22s L%-4d %s" % (v, ln, ctx[:110]))

if __name__ == '__main__':
    main()
