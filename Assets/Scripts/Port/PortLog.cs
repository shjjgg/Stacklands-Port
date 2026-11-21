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

                var go = new GameObject("[PortLog]");
                UnityEngine.Object.DontDestroyOnLoad(go);
                go.AddComponent<Runner>();
            }
            catch (Exception e)
            {
                Debug.LogError("[PortLog] 初始化失败: " + e);
            }
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

            void OnEnable()
            {
                SceneManager.sceneLoaded += OnSceneLoaded;
                Marker("Runner.OnEnable scene=" + SceneManager.GetActiveScene().name);
            }

            void OnDisable()
            {
                SceneManager.sceneLoaded -= OnSceneLoaded;
            }

            static void OnSceneLoaded(Scene s, LoadSceneMode mode)
            {
                Marker($"sceneLoaded {s.name} mode={mode} root={s.rootCount}");
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
