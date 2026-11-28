#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
拖卡轨迹判据 —— 把"动画看着卡/抽搐"变成可判定的数字。

用法:
  python3 tools/trace_diff.py trace_1.csv                # 单条体检
  python3 tools/trace_diff.py a.csv b.csv                # 两条比对(PC 基线 vs 真机, 或两次真机)

单条体检输出:
  时长 / 帧数 / 平均与峰值速度 / 抖动(jerk) / 掉帧(dt>33ms) / 位置突跳次数
  —— "位置突跳"= 相邻帧位移超过中位步长 3 倍, 这是 tween 未 Kill 或状态机跳帧的直接指纹。
两条比对输出:
  按归一化时间重采样到 200 点, 给出 RMS / 最大偏差(世界单位 + 折合卡宽), 以及时长差百分比。
"""
import csv, sys, statistics

CARD_W = 0.7   # 世界单位, Stacklands 一张卡的宽度; 偏差超过半张卡即判不合格

def load(path):
    rows = []
    with open(path, newline='', encoding='utf-8') as f:
        for r in csv.DictReader(f):
            try:
                rows.append((float(r['t']), float(r['x']), float(r['y']), float(r['z']), float(r['dt'])))
            except (KeyError, ValueError):
                continue
    rows.sort()
    return rows

def steps(rows):
    out = []
    for i in range(1, len(rows)):
        dx = rows[i][1] - rows[i-1][1]; dy = rows[i][2] - rows[i-1][2]; dz = rows[i][3] - rows[i-1][3]
        d = (dx*dx + dy*dy + dz*dz) ** 0.5
        out.append((rows[i][0], d, rows[i][4]))
    return out

def report_one(path, rows):
    if len(rows) < 5:
        print(f'{path}: 样本不足({len(rows)} 帧), 不判定'); return
    dur = rows[-1][0] - rows[0][0]
    st = steps(rows)
    sp = [d / max(dt, 1e-4) for _, d, dt in st]
    med = statistics.median([d for _, d, _ in st])
    jumps = [(t, d) for t, d, _ in st if med > 0 and d > med * 3]
    stalls = [(t, dt) for t, _, dt in st if dt > 0.033]
    jerk = max(abs(sp[i] - sp[i-1]) for i in range(1, len(sp))) if len(sp) > 1 else 0
    print(f'== {path}')
    print(f'  时长 {dur*1000:.0f}ms  帧数 {len(rows)}  平均帧间隔 {dur/len(rows)*1000:.1f}ms')
    print(f'  速度 均值 {statistics.mean(sp):.2f} u/s  峰值 {max(sp):.2f} u/s')
    print(f'  抖动 jerk {jerk:.2f} u/s^2')
    print(f'  掉帧(dt>33ms) {len(stalls)} 处' + (f' 首次 t={stalls[0][0]*1000:.0f}ms dt={stalls[0][1]*1000:.1f}ms' if stalls else ''))
    print(f'  位置突跳 {len(jumps)} 处' + (f' 最大 {max(d for _,d in jumps):.3f}u' if jumps else ''))
    if jumps:
        print('  -> 突跳说明位移不连续: tween 未 Kill / 状态机跳帧 / 拖拽吸附瞬间。逐帧核对这几点时刻的动作。')
    if stalls:
        print('  -> 掉帧说明拖拽期间主线程被占: GC spike / 我们自己的 Runner 在跑。对照 perf.csv 的 event 列。')

def resample(rows, n=200):
    t0, t1 = rows[0][0], rows[-1][0]
    span = max(t1 - t0, 1e-6)
    pts = []
    j = 0
    for k in range(n):
        u = k / (n - 1)
        tt = t0 + u * span
        while j + 1 < len(rows) and rows[j+1][0] < tt:
            j += 1
        a, b = rows[j], rows[min(j+1, len(rows)-1)]
        span2 = b[0] - a[0]
        w = 0 if span2 <= 1e-9 else (tt - a[0]) / span2
        pts.append((a[1] + (b[1]-a[1])*w, a[2] + (b[2]-a[2])*w, a[3] + (b[3]-a[3])*w))
    return pts

def compare(a_path, a, b_path, b):
    report_one(a_path, a); report_one(b_path, b)
    pa, pb = resample(a), resample(b)
    d = [((pa[i][0]-pb[i][0])**2 + (pa[i][1]-pb[i][1])**2 + (pa[i][2]-pb[i][2])**2) ** 0.5 for i in range(len(pa))]
    rms = (sum(x*x for x in d) / len(d)) ** 0.5
    mx = max(d)
    da = a[-1][0] - a[0][0]; db = b[-1][0] - b[0][0]
    print('== 比对')
    print(f'  时长差 {(db-da)*1000:+.0f}ms ({(db/da-1)*100:+.1f}%)')
    print(f'  轨迹 RMS {rms:.3f}u ({rms/CARD_W*100:.0f}% 卡宽)  最大 {mx:.3f}u ({mx/CARD_W*100:.0f}% 卡宽)')
    ok = mx < CARD_W * 0.5 and abs(db/da - 1) < 0.1
    print('  结论: ' + ('通过(在 1:1 判据内)' if ok else '不通过 —— 时长或轨迹超出半张卡/10%'))
    return ok

if __name__ == '__main__':
    if len(sys.argv) != 2 and len(sys.argv) != 3:
        print(__doc__); sys.exit(2)
    a = load(sys.argv[1])
    if len(sys.argv) == 2:
        report_one(sys.argv[1], a)
    else:
        compare(sys.argv[1], a, sys.argv[2], load(sys.argv[2]))
