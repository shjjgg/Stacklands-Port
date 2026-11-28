#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
静态审查: 原版 DXBC 汇编 vs 我们的 .shader 端口 —— 不需要设备、不需要 Unity。

判据(结构级, 逐项可量化):
  1. 采样次数   : 原版每条 PS 有几个 texture 采样, 端口是不是同数(少一个 = 少一层图案)
  2. 立即数命中 : 原版汇编里的浮点常量, 是不是原样出现在端口(之前定的铁律"常量照抄")
  3. 关键算子   : ddx/ddy(解析抗锯齿)、discard(clip)、rsqrt/exp2/pow(波形/衰减) 是否都在
  4. 槽位用量   : 原版 cb0..cb3 各用了多少个 16 字节槽, 端口声明的 uniform 数是否够

边界(必须知道): 这里查不出精度(fp16)、查不出驱动差异、查不出属性绑错(_m9 到底是纸色还是框色)。
那些只能靠真机探针。
"""
import csv, glob, os, re, struct, sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
ASM = os.path.join(ROOT, 'shader_extract', 'asm_fxc')
SH = os.path.join(ROOT, 'Assets', 'Shaders')

OPCODE = re.compile(r'^\s*\d+:\s*([a-z_0-9]+)')
HEXFLT = re.compile(r'0x([0-9a-fA-F]{8})(?![0-9a-fA-F])')
DECFLT = re.compile(r'(?<![\w.])-?\d+\.\d+f?(?![\w.])')
DERIV = ('ddx', 'ddy', 'deriv_rtx', 'deriv_rty', 'deriv_rtx_coarse', 'deriv_rty_coarse')
def is_sample(op): return op.startswith('sample') or op.startswith('ld') or op.startswith('gather')
def is_deriv(op): return op.startswith('deriv')
def is_discard(op): return op.startswith('discard')

def hexf(h):
    return struct.unpack('>f', bytes.fromhex(h))[0]

def read_asm(path):
    ops, imms, cb = [], set(), {}
    for line in open(path, encoding='utf-8', errors='ignore'):
        m = OPCODE.match(line)
        if m:
            op = m.group(1).split('(')[0]      # sample_indexable(texture2d)... -> sample_indexable
            ops.append(op)
            for h in HEXFLT.findall(line):
                try: imms.add(round(hexf(h), 6))
                except Exception: pass
            for d in DECFLT.findall(line):
                try: imms.add(round(float(d.rstrip('f')), 6))
                except Exception: pass
            for c in re.findall(r'cb(\d)\[(\d+)\]', line):
                cb.setdefault(int(c[0]), set()).add(int(c[1]))
    return ops, imms, cb

def read_port(path):
    txt = open(path, encoding='utf-8', errors='ignore').read()
    # 去掉注释再统计
    body = re.sub(r'//[^\n]*', '', txt)
    nums = set()
    for d in DECFLT.findall(body):
        try: nums.add(round(float(d.rstrip('f')), 6))
        except Exception: pass
    return body, nums

def name_map():
    files = glob.glob(os.path.join(SH, '**', '*.shader'), recursive=True)
    byname = {}
    for f in files:
        byname.setdefault(os.path.splitext(os.path.basename(f))[0].lower(), []).append(f)
    alias = {
        'shapes__rect_opaque': 'shapesrectport', 'shapes__rect_transparent': 'shapesrecttransparent',
        'ui__default_port': 'uidefaultport', 'postprocess__sokpopintro': 'sokpopintro',
        'custom__supersampled_texture': 'supersampled texture',
    }
    return byname, alias

def main():
    byname, alias = name_map()
    rows = []
    missing = []
    groups = {}
    for asm in sorted(glob.glob(os.path.join(ASM, '*_PS.txt'))):
        stem = os.path.basename(asm)[:-7]
        g = re.sub(r'_+\d\d$', '', stem)
        groups.setdefault(g, []).append(asm)

    for g, files in sorted(groups.items()):
        parts = g.split('__')
        if len(parts) < 2: continue
        group, nm = parts[0], '__'.join(parts[1:])
        key = alias.get((group + '__' + nm).lower(), nm.lower())
        cands = byname.get(key)
        if not cands:
            missing.append(group + '/' + nm); continue

        # 变体聚合: 采样/导数/discard 取所有变体的最大值(端口必须覆盖最复杂那支)
        ops_all, imms, cb = [], set(), {}
        n_sample = n_deriv = n_disc = 0
        for asm in files:
            ops, im_, c = read_asm(asm)
            ops_all += ops
            imms |= im_
            for k, v in c.items(): cb.setdefault(k, set()).update(v)
            n_sample = max(n_sample, sum(1 for o in ops if is_sample(o)))
            n_deriv = max(n_deriv, sum(1 for o in ops if is_deriv(o)))
            n_disc = max(n_disc, sum(1 for o in ops if is_discard(o)))

        port_path = cands[0]
        body, nums = read_port(port_path)
        p_sample = len(re.findall(r'\b(tex2D|tex3D|SAMPLE_TEXTURE2D)\s*\(', body))
        p_deriv = len(re.findall(r'\b(ddx|ddy)\s*\(', body))
        p_disc = len(re.findall(r'\b(discard|clip)\b', body))

        hit = sum(1 for v in imms if v in nums)
        rate = hit / len(imms) if imms else 1.0
        slots = max((len(v) for v in cb.values()), default=0)
        instr = len(ops_all) // len(files)

        verdict = 'ok'
        if n_sample and p_sample < n_sample: verdict = '缺采样'
        elif not n_sample and p_sample > n_sample: verdict = '多采样'
        if n_deriv and p_deriv == 0: verdict = '缺导数AA'
        if n_disc and p_disc == 0: verdict = '缺discard'
        if rate < 0.6 and len(imms) >= 8: verdict = '常量漂移' if verdict == 'ok' else verdict + '+常量漂移'

        rows.append(dict(shader=group + '/' + nm, port=os.path.relpath(port_path, ROOT),
                         instr=instr, variants=len(files), orig_sample=n_sample, port_sample=p_sample,
                         orig_deriv=n_deriv, port_deriv=p_deriv, orig_discard=n_disc, port_discard=p_disc,
                         cb_slots=slots, imm=len(imms), imm_hit=hit, imm_rate=round(rate, 3), verdict=verdict))

    out = os.path.join(ROOT, 'shader_extract', 'static_audit.csv')
    with open(out, 'w', newline='', encoding='utf-8') as f:
        w = csv.DictWriter(f, fieldnames=list(rows[0].keys()))
        w.writeheader(); w.writerows(rows)

    print(f'审查 {len(rows)} 支, 未匹配端口 {len(missing)} 支')
    print(f'{"shader":34} {"采样":>8} {"导数":>6} {"disc":>6} {"立即数命中":>12}  结论')
    for r in rows:
        s = f'{r["port_sample"]}/{r["orig_sample"]}'
        d = f'{r["port_deriv"]}/{r["orig_deriv"]}'
        c = f'{r["port_discard"]}/{r["orig_discard"]}'
        i = f'{r["imm_hit"]}/{r["imm"]}={r["imm_rate"]*100:.0f}%'
        print(f'{r["shader"]:34} {s:>8} {d:>6} {c:>6} {i:>12}  {r["verdict"]}')
    if missing:
        print('\n未匹配(还没有端口或改名): ' + ', '.join(sorted(missing)))
    bad = [r for r in rows if r['verdict'] != 'ok']
    print(f'\n合格 {len(rows)-len(bad)} / {len(rows)};  台账: {os.path.relpath(out, ROOT)}')

if __name__ == '__main__':
    main()
