using System;
using System.Collections;
using System.IO;
using System.Text;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.Profiling;

namespace StacklandsPort
{
    /// <summary>
    /// 真机取证用文件日志: 写到
    /// /storage/emulated/0/Android/data/&lt;包名&gt;/files/stacklands_port.log
    /// 目的: 闪退时没有 adb 也能拿到最后的托管日志与阶段面包屑。
    /// </summary>
    public static class PortLog
    {
        const string FileName = "stacklands_port.log";
        const int MaxBytes = 4 * 1024 * 1024;

        static StreamWriter _w;
        static string _path;
        static bool _ready;
        static Runner _runner;

        public static string PathOnDevice => _path;

        [RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.BeforeSceneLoad)]
        static void Boot()
        {
            try
            {
                _path = System.IO.Path.Combine(Application.persistentDataPath, FileName);
                var dir = System.IO.Path.GetDirectoryName(_path);
                if (!Directory.Exists(dir)) Directory.CreateDirectory(dir);
                // 超过上限就轮转, 避免无限增长
                if (File.Exists(_path) && new FileInfo(_path).Length > MaxBytes)
                    File.Move(_path, _path + ".1");

                _w = new StreamWriter(new FileStream(_path, FileMode.Append, FileAccess.Write, FileShare.ReadWrite), Encoding.UTF8);
                _w.AutoFlush = true;
                _ready = true;
                Application.logMessageReceivedThreaded += OnLog;
                AppDomain.CurrentDomain.UnhandledException += OnUnhandled;

                Write("========== session start ==========");
                Write($"unity={Application.unityVersion} version={Application.version} pkg={Application.identifier}");
                Write($"device={SystemInfo.deviceModel} os=Android{SystemInfo.operatingSystem}");
                Write($"gfx={SystemInfo.graphicsDeviceType} {SystemInfo.graphicsDeviceVersion} mem={SystemInfo.systemMemorySize}MB");
                Write($"screen={Screen.width}x{Screen.height} dpi={Screen.dpi}");
                Write($"persistent={Application.persistentDataPath}");

                EnsureRunner();
            }
            catch (Exception e)
            {
                Debug.LogError("[PortLog] 初始化失败: " + e);
            }
        }

        [RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.AfterSceneLoad)]
        static void EnsureRunnerAfterLoad()
        {
            EnsureRunner();
        }

        static void EnsureRunner()
        {
            if (_runner != null) return;
            var go = new GameObject("[PortLog]");
            UnityEngine.Object.DontDestroyOnLoad(go);
            _runner = go.AddComponent<Runner>();
            Marker("runner created scene=" + SceneManager.GetActiveScene().name);
        }

        static void OnLog(string message, string stack, LogType type)
        {
            if (type == LogType.Log) return;   // 只留 warning/error/exception, 控制体积
            Write($"[{type}] {message}" + (string.IsNullOrEmpty(stack) ? "" : "\n" + stack));
        }

        static void OnUnhandled(object sender, UnhandledExceptionEventArgs e)
        {
            Write("[UnhandledException] " + e.ExceptionObject);
        }

        public static void Write(string line)
        {
            if (!_ready) return;
            try
            {
                _w.WriteLine(DateTime.Now.ToString("HH:mm:ss.fff") + " " + line);
            }
            catch { }
        }

        public static void Marker(string tag)
        {
            Write("---- " + tag + " ----");
        }

        internal sealed class Runner : MonoBehaviour
        {
            float _t;
            int _frame;
            bool _probed;

            void OnEnable()
            {
                SceneManager.sceneLoaded += OnSceneLoaded;
                Marker("Runner.OnEnable scene=" + SceneManager.GetActiveScene().name);
            }

            void OnDisable()
            {
                SceneManager.sceneLoaded -= OnSceneLoaded;
            }

            void OnSceneLoaded(Scene s, LoadSceneMode mode)
            {
                Marker($"sceneLoaded {s.name} mode={mode} root={s.rootCount}");
                // intro 场景: 先把 SampleScene 以 allowSceneActivation=false 异步加载,
                // 用进度打点区分"资源加载阶段崩"还是"激活(Awake)阶段崩"
                if (s.name.IndexOf("Intro", StringComparison.OrdinalIgnoreCase) >= 0 && !_probed)
                {
                    _probed = true;
                    StartCoroutine(ProbeNextScene());
                }
            }

            IEnumerator ProbeNextScene()
            {
                yield return new WaitForSecondsRealtime(0.5f);
                Marker("probe: begin async load SampleScene (activation off)");
                AsyncOperation op = null;
                try { op = SceneManager.LoadSceneAsync("SampleScene", LoadSceneMode.Additive); }
                catch (Exception e) { Marker("probe: LoadSceneAsync threw " + e); yield break; }
                if (op == null) { Marker("probe: op==null (场景不在 BuildSettings)"); yield break; }
                op.allowSceneActivation = false;

                float last = -1f;
                while (op.progress < 0.89f)
                {
                    if (Mathf.Abs(op.progress - last) > 0.02f)
                    {
                        last = op.progress;
                        Marker($"probe: loading p={op.progress:F2} t={Time.realtimeSinceStartup:F1}s");
                    }
                    yield return null;
                }
                Marker($"probe: load done p={op.progress:F2}, 即将激活(会跑各管理器 Awake)");
                yield return new WaitForEndOfFrame();
                op.allowSceneActivation = true;
                while (!op.isDone) yield return null;
                Marker("probe: ACTIVATED SampleScene");

                var sc = SceneManager.GetSceneByName("SampleScene");
                if (sc.IsValid()) SceneManager.SetActiveScene(sc);
                Marker("probe: SetActiveScene done, roots=" + (sc.IsValid() ? sc.rootCount : -1));

                // 拆掉 intro 根对象, 免得它的 3.5s 定时器再单模式加载一次造成重入
                var intro = SceneManager.GetSceneByName("IntroScene");
                if (intro.IsValid())
                {
                    foreach (var go in intro.GetRootGameObjects()) UnityEngine.Object.Destroy(go);
                    Marker("probe: IntroScene roots destroyed");
                }
            }

            void Update()
            {
                _frame++;
                if (_frame == 1) Marker("first Update frame");
                // 启动前 2 秒逐帧记录场景根对象, 用于确认 Bootstrapper 把管理器实例化到哪一步
                if (_frame == 1 || _frame == 10 || _frame == 30 || _frame == 60 || _frame == 120)
                {
                    var sc = SceneManager.GetActiveScene();
                    var roots = sc.GetRootGameObjects();
                    var names = new System.Text.StringBuilder();
                    for (int i = 0; i < roots.Length && i < 12; i++) names.Append(roots[i].name).Append('|');
                    Marker($"roots f={_frame} scene={sc.name} n={roots.Length} {names}");
                }
                _t += Time.unscaledDeltaTime;
                // 启动前 20 秒每秒打一次内存面包屑, 用于判断是不是 OOM/长时间卡在加载
                if (_t >= 1f)
                {
                    _t = 0f;
                    if (Time.realtimeSinceStartup < 22f)
                        Marker($"hb t={Time.realtimeSinceStartup:F1}s gc={GC.GetTotalMemory(false) / 1048576}MB alloc={Profiler.GetTotalAllocatedMemoryLong() / 1048576}MB");
                }
            }

            void OnApplicationQuit()
            {
                Marker("OnApplicationQuit");
            }
        }
    }
}
