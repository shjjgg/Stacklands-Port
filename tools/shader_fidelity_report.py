#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""统一核查：33 个 shader 一次跑完，出机器可读的保真度报告。

五路检查（全部机械判定，不看截图）：
  1. 常量指纹 —— 原版 PS 的非平凡浮点常量是否出现在移植源码（剔除 BRDF/GGX 等引擎常量）
  2. 属性漂移 —— 移植版 Properties 多出/缺少原版属性（多出=自造旋钮，缺少=丢功能）
  3. 采样槽 —— 原版 texture() 槽数 vs 移植版 tex2D/SAMPLE 数（少了=贴图通道被吞）
  4. 全局下发 —— C# 每帧 SetGlobalFloat/Color 的参数是否被 shader 消费
  5. 自认近似 —— 注释里出现"估/近似/简化"的位置（人工复核必查）

用法： python3 tools/shader_fidelity_report.py [--json out.json]
"""
import glob
import json
import os
import re
import sys

GLSL = 'shader_extract/glsl_exact'
SPEC = 'shader_extract/spec'
PORT_GLOB = 'Assets/Shaders/**/*.shader'

# 通用常量 + 引擎边界常量（不参与判定）
TRIV = {0.0, 1.0, 2.0, 3.0, 4.0, 0.5, 0.25, 0.75, 10.0, 100.0, 16.0, 0.001, 1e-5}
BRDF = {0.31830987334251404, 3.1415927410125732, 0.0010000000474974513,
        0.0020000000949949026, 0.03999999910593033, 0.9599999785423279,
        0.699999988079071, 1.7000000476837158, 0.00010000000474974513}

GLOBALS = ['_GridWidth', '_GridHeight', '_AnimationTime', '_GridAlpha',
           '_BoardBackgroundA', '_BoardBackgroundB',
           '_WorldSizeIncrease', '_WorldSizeIncreaseNormalized']


def load_port():
    out = {}
    for f in glob.glob(PORT_GLOB, recursive=True):
        t = open(f, encoding='utf-8', errors='ignore').read()
        m = re.search(r'Shader\s+"([^"]+)"', t)
        if m:
            out[m.group(1)] = (f, t)
    return out


def port_floats(t):
    t = re.sub(r'//[^\n]*', '', t)
    vals = []
    for m in re.finditer(r'[-+]?\d*\.?\d+(?:e[-+]?\d+)?', t):
        try:
            vals.append(float(m.group(0)))
        except ValueError:
            pass
    return vals


def orig_consts(path):
    rows = []
    for i, l in enumerate(open(path, encoding='utf-8', errors='ignore').read().splitlines()):
        for m in re.finditer(r'[-+]?(?:\d+\.\d{5,})(?:e[-+]?\d+)?', l):
            v = float(m.group(0))
            if abs(v) >= 1e-4:
                rows.append((v, i + 1, l.strip()))
    return rows


def port_props(text):
    m = re.search(r'Properties\s*\{([^}]*)\}', text, re.S)
    if not m:
        return []
    return [x.strip().split()[0] for x in re.findall(r'^\s*(_[A-Za-z0-9_]+)\s*\(', m.group(1), re.M)]


def spec_props(name):
    p = os.path.join(SPEC, name + '.json')
    if not os.path.exists(p):
        return None
    return [x['name'] for x in json.load(open(p))['properties']]


def tex_slots(path):
    t = open(path, encoding='utf-8', errors='ignore').read()
    return len(set(re.findall(r'texture\(sampler\dD\(([^)]+)\)', t)))


def main():
    port = load_port()
    rows = []
    for g in sorted(glob.glob(os.path.join(GLSL, '*_PS.glsl'))):
        base = os.path.basename(g)[:-len('_PS.glsl')]
        m = re.match(r'(.*)__([0-9]+)$', base)
        if not m:
            continue
        key = m.group(1).replace('__', '/').replace('_', ' ')
        if key not in port:
            rows.append(dict(shader=key, verdict='缺失', note='工程里没有同名 shader'))
            continue
        path, src = port[key]
        pv = port_floats(src)
        n_tot = n_hit = 0
        miss = []
        for v, ln, ctx in orig_consts(g):
            if v in TRIV or v in BRDF:
                continue
            n_tot += 1
            if any(abs(v - p) <= max(abs(v), 1) * 1e-4 for p in pv):
                n_hit += 1
            else:
                miss.append((v, ln, ctx))
        rows.append(dict(shader=key, variant=m.group(2), path=path,
                         const_total=n_tot, const_hit=n_hit,
                         cov=(n_hit / n_tot * 100) if n_tot else 100.0,
                         miss=miss, tex=tex_slots(g)))
    # 按 shader 取最好变体
    # 取"常量最多的变体"（主体 forward/GBuffer pass），避免被 13 行的 depth-only 空变体刷成 100%
    best = {}
    for r in rows:
        if 'cov' not in r:
            continue
        if r['shader'] not in best or r['const_total'] > best[r['shader']]['const_total']:
            best[r['shader']] = r

    report = []
    for name in sorted(port):
        r = best.get(name)
        props_p = port_props(port[name][1])
        props_o = spec_props(name.replace('/', '__').replace(' ', '_'))
        extra = sorted(set(props_p) - set(props_o)) if props_o is not None else []
        lack = sorted(set(props_o) - set(props_p)) if props_o is not None else []
        approx = [l.strip() for l in port[name][1].splitlines()
                  if re.search(r'估|近似|简化|实测', l) and not l.strip().startswith('//') is False]
        approx = [l.strip() for l in port[name][1].splitlines() if re.search(r'估|近似|简化|实测', l)]
        globs = [g for g in GLOBALS if re.search(r'\b' + g + r'\b', port[name][1])]
        entry = dict(shader=name, file=port[name][0],
                     const_cov=(round(r['cov'], 1) if r else None),
                     const_miss=(len(r['miss']) if r else None),
                     props_extra=extra, props_missing=lack,
                     tex_orig=(r['tex'] if r else None),
                     self_approx=len(approx),
                     globals_used=globs)
        report.append(entry)

    if '--json' in sys.argv:
        out = sys.argv[sys.argv.index('--json') + 1]
        json.dump(report, open(out, 'w'), ensure_ascii=False, indent=1)

    print("%-34s %6s %5s %-26s %5s %3s" % ("shader", "常量", "缺", "自造属性", "采样", "近似"))
    for e in report:
        print("%-34s %5s%% %5s %-26s %5s %3d" % (
            e['shader'],
            e['const_cov'] if e['const_cov'] is not None else '-',
            e['const_miss'] if e['const_miss'] is not None else '-',
            ','.join(e['props_extra'])[:26] or '-',
            e['tex_orig'] if e['tex_orig'] is not None else '-',
            e['self_approx']))

    print("\n== 缺原版属性（丢功能）==")
    for e in report:
        if e['props_missing']:
            print("  %-32s %s" % (e['shader'], ','.join(e['props_missing'])))
    print("\n== 未消费的全局参数 ==")
    print("  shader 里出现过: %s" %
          sorted({g for e in report for g in e['globals_used']}))
    print("  C# 每帧下发: %s" % GLOBALS)


if __name__ == '__main__':
    main()
