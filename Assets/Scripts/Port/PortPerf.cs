using System;
using System.Collections;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Text;
using UnityEngine;

namespace StacklandsPort
{
    /// <summary>
    /// 帧率/卡顿取证 + 拖卡逐帧轨迹录制。
    /// 目的: 把"动画卡"从主观感受变成数字 —— 帧耗时分布、jank 帧发生的时刻与当时事件、
    /// 以及一次拖拽从起到停的逐帧位置(用来判断"瞬移/抽搐"是 tween 残留还是掉帧)。
    /// 输出: persistentDataPath/bench/perf.csv、trace_N.csv，并复制到 /storage/emulated/0/Download/。
    /// </summary>
    public static class PortPerf
    {
        const string Tag = "[Perf]";
        public const string DownloadDir = "/storage/emulated/0/Download";

        struct S
        {
            public float t, dt, udt, alloc, gpu;
            public string ev;
        }

        static readonly List<S> _buf = new List<S>(4096);
        static bool _on;
        static float _winStart;
        static float _delay = 5f, _len = 25f;   // v0.66: 缩短窗口, 保证用户还没退游戏就能落盘
        static float _lastT;
        static string _ev; static float _evAt = -99f;

        static System.Type _cardType;
        static object[] _cards;
        static readonly Dictionary<int, Vector3> _pos = new Dictionary<int, Vector3>();
        static int _cardCount = -1;
        static float _scanAt;

        static StringBuilder _trace;
        static int _traceId = -1, _traceFrame;
        static Vector3 _tracePrev;
        static float _traceStart, _traceIdleAt;
        static int _traceNo;

        static FrameTiming[] _ft = new FrameTiming[1];
        static bool _ftOn = true;

        public static void Mark(string what) { _ev = what; _evAt = Time.unscaledTime; }

        [RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.AfterSceneLoad)]
        static void AutoBoot()
        {
            var go = new GameObject("[PerfAuto]");
            UnityEngine.Object.DontDestroyOnLoad(go);
            go.AddComponent<Auto>();
        }

        sealed class Auto : MonoBehaviour
        {
            float _t; bool _done;

            void Update()
            {
                PortPerf.Tick();
                if (_done) return;
                _t += Time.unscaledDeltaTime;
                if (_t < _delay) return;
                _done = true;
                PortLog.Write(Tag + "采样开始(" + (int)_delay + "s 起, 时长 " + (int)_len + "s)");
                StartRun();
            }

            // v0.66: 上一版就是这样丢的 —— 采样窗口 40s, 用户 34s 就退出, Finish 永远没被调用,
            // perf.csv 一个字节都没写。现在退到后台/退出都强制落盘(写已采到的部分)。
            void OnApplicationPause(bool paused) { if (paused) PortPerf.Finish("pause"); }
            void OnApplicationQuit() { PortPerf.Finish("quit"); }
            void OnApplicationFocus(bool f) { if (!f) PortPerf.Finish("focus"); }
        }

        public static void StartRun()
        {
            if (_on) return;
            _buf.Clear();
            _on = true;
            _winStart = Time.unscaledTime;
            _lastT = Time.unscaledTime;
            _traceNo = 0; _traceId = -1;
            _cardType = FindCardType();
            if (_cardType == null) PortLog.Write(Tag + "找不到 GameCard 类型, 轨迹录制关闭");
        }

        static System.Type FindCardType()
        {
            var asms = AppDomain.CurrentDomain.GetAssemblies();
            for (int i = 0; i < asms.Length; i++)
            {
                try
                {
                    var t = asms[i].GetType("GameCard");
                    if (t != null) return t;
                }
                catch { }
            }
            return null;
        }

        public static void Tick()
        {
            if (!_on) return;
            float now = Time.unscaledTime;
            float dt = now - _lastT;
            _lastT = now;

            S s;
            s.t = now - _winStart;
            s.dt = dt;
            s.udt = Time.unscaledDeltaTime;
            s.alloc = GC.GetTotalMemory(false) / 1048576f;
            s.gpu = 0f;
            if (_ftOn)
            {
                try
                {
                    FrameTimingManager.CaptureFrameTimings();
                    if (FrameTimingManager.GetLatestTimings(1, _ft) > 0) s.gpu = (float)_ft[0].gpuFrameTime;
                    else _ftOn = false;
                }
                catch { _ftOn = false; }
            }
            s.ev = (now - _evAt) < 0.25f ? _ev : "";
            if (_buf.Count < 5000) _buf.Add(s);

            ScanCards(now);
            TraceTick(now);

            if (s.t >= _len) Finish("window");
        }

        static void ScanCards(float now)
        {
            if (_cardType == null || now - _scanAt < 0.5f) return;
            _scanAt = now;
            _cards = UnityEngine.Object.FindObjectsOfType(_cardType);
            if (_cardCount >= 0 && _cards.Length != _cardCount) Mark("cards=" + _cards.Length);
            _cardCount = _cards.Length;

            // 找"动得最快"的一张卡, 作为拖拽轨迹的录制对象
            float best = 0f; int bestId = -1; Vector3 bestPos = Vector3.zero;
            for (int i = 0; i < _cards.Length; i++)
            {
                var c = _cards[i] as Component;
                if (c == null) continue;
                int id = c.GetInstanceID();
                Vector3 p = c.transform.position;
                if (_pos.TryGetValue(id, out var old))
                {
                    float d = (p - old).sqrMagnitude;
                    if (d > best) { best = d; bestId = id; bestPos = p; }
                }
                _pos[id] = p;
            }
            if (_traceId < 0 && bestId >= 0 && best > 0.0025f && _traceNo < 3)
            {
                _traceId = bestId; _trace = new StringBuilder();
                _trace.AppendLine("frame,t,id,x,y,z,dt");
                _traceFrame = 0; _traceStart = now; _traceIdleAt = now; _tracePrev = bestPos;
                Mark("trace_start");
            }
        }

        static void TraceTick(float now)
        {
            if (_traceId < 0) return;
            if (_cards == null) return;
            for (int i = 0; i < _cards.Length; i++)
            {
                var c = _cards[i] as Component;
                if (c == null || c.GetInstanceID() != _traceId) continue;
                Vector3 p = c.transform.position;
                if ((p - _tracePrev).sqrMagnitude > 0.0004f) _traceIdleAt = now;
                _tracePrev = p;
                var ci = CultureInfo.InvariantCulture;
                _trace.Append(_traceFrame.ToString(ci)).Append(',').Append((now - _traceStart).ToString("0.0000", ci))
                      .Append(',').Append(_traceId).Append(',')
                      .Append(p.x.ToString("0.0000", ci)).Append(',').Append(p.y.ToString("0.0000", ci)).Append(',')
                      .Append(p.z.ToString("0.0000", ci)).Append(',')
                      .Append(Time.unscaledDeltaTime.ToString("0.0000", ci)).AppendLine();
                _traceFrame++;
                if (now - _traceIdleAt > 0.4f || now - _traceStart > 3f) { FlushTrace(); return; }
                return;
            }
            FlushTrace();   // 卡被销毁
        }

        static void FlushTrace()
        {
            if (_trace == null) return;
            _traceNo++;
            string name = "trace_" + _traceNo + ".csv";
            WriteBoth(name, _trace.ToString());
            PortLog.Write(Tag + "轨迹 " + name + " 帧数=" + _traceFrame);
            _trace = null; _traceId = -1;
        }

        public static void Finish(string why)
        {
            if (!_on) return;
            _on = false;
            PortLog.Write(Tag + "采样结束(" + why + ") 已采 " + _buf.Count + " 帧");
            if (_traceId >= 0) FlushTrace();
            try { WriteReport(); }
            catch (Exception e) { PortLog.Write(Tag + "报表失败 " + e.GetType().Name + " " + e.Message); }
        }

        static void WriteReport()
        {
            int n = _buf.Count;
            if (n == 0) { PortLog.Write(Tag + "没有采样"); return; }

            var dts = new List<float>(n);
            for (int i = 0; i < n; i++) dts.Add(_buf[i].dt);
            dts.Sort();
            float p50 = dts[(int)(n * 0.50f)];
            float p95 = dts[(int)(n * 0.95f)];
            float p99 = dts[(int)(n * 0.99f)];
            float th = Mathf.Max(p50 * 2f, 0.033f);

            int jank = 0; var worst = new List<S>();
            var csv = new StringBuilder("frame,t,dt,udt,allocMb,gpuMs,event\n");
            var ci = CultureInfo.InvariantCulture;
            for (int i = 0; i < n; i++)
            {
                var s = _buf[i];
                if (s.dt > th) jank++;
                if (s.dt > th) { if (worst.Count < 5) worst.Add(s); else if (s.dt > worst[4].dt) { worst[4] = s; } }
                csv.Append(i).Append(',').Append(s.t.ToString("0.000", ci)).Append(',')
                   .Append(s.dt.ToString("0.0000", ci)).Append(',').Append(s.udt.ToString("0.0000", ci)).Append(',')
                   .Append(s.alloc.ToString("0.0", ci)).Append(',').Append(s.gpu.ToString("0.00", ci)).Append(',')
                   .Append(s.ev).Append('\n');
            }

            PortLog.Write(Tag + "帧数=" + n + " p50=" + (p50 * 1000f).ToString("0.0") + "ms p95=" + (p95 * 1000f).ToString("0.0")
                + "ms p99=" + (p99 * 1000f).ToString("0.0") + "ms 理论=" + (1000f / 60f).ToString("0.0") + "ms jank=" + jank + "/" + n);
            PortLog.Write(Tag + "GC 托管堆 " + _buf[0].alloc.ToString("0.0") + " -> " + _buf[n - 1].alloc.ToString("0.0") + " MB");

            worst.Sort((a, b) => b.dt.CompareTo(a.dt));
            for (int i = 0; i < worst.Count; i++)
            {
                var s = worst[i];
                PortLog.Write(Tag + "最差 #" + i + " t=" + s.t.ToString("0.00") + "s dt=" + (s.dt * 1000f).ToString("0.0")
                    + "ms gpu=" + s.gpu.ToString("0.0") + "ms ev=" + (string.IsNullOrEmpty(s.ev) ? "-" : s.ev));
            }
            WriteBoth("perf.csv", csv.ToString());
        }

        static void WriteBoth(string name, string text)
        {
            try
            {
                string a = Path.Combine(Application.persistentDataPath, "bench");
                if (!Directory.Exists(a)) Directory.CreateDirectory(a);
                File.WriteAllText(Path.Combine(a, name), text, Encoding.UTF8);
                File.WriteAllText(Path.Combine(DownloadDir, name), text, Encoding.UTF8);
            }
            catch (Exception e) { PortLog.Write(Tag + "写 " + name + " 失败 " + e.Message); }
        }
    }
}
