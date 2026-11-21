using System;
using System.Reflection;
using System.Text;
using UnityEngine;
using UnityEngine.SceneManagement;

namespace StacklandsPort
{
    /// <summary>
    /// 空引用审计: 进 SampleScene 后扫一遍根节点上的所有 MonoBehaviour,
    /// 把"字段类型是 UnityEngine.Object 但值为 null"的字段全部打进日志。
    /// 用来一次性定位 AssetRipper 导出后没接上的 prefab / sprite / material 引用。
    /// </summary>
    public static class PortNullAudit
    {
        static bool _done;

        [RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.AfterSceneLoad)]
        static void Hook()
        {
            SceneManager.sceneLoaded += (s, m) =>
            {
                if (_done || s.name.IndexOf("SampleScene", StringComparison.OrdinalIgnoreCase) < 0) return;
                // 默认关闭: 只有用户手动在 files 目录放一个空文件 "null_audit" 时才跑(约 3 万行日志)
                if (!System.IO.File.Exists(System.IO.Path.Combine(Application.persistentDataPath, "null_audit"))) return;
                _done = true;
                // 等管理器实例化完成
                var runner = new GameObject("[NullAudit]");
                UnityEngine.Object.DontDestroyOnLoad(runner);
                runner.AddComponent<Runner>();
            };
        }

        sealed class Runner : MonoBehaviour
        {
            int _f;
            void Update()
            {
                if (++_f < 30) return;
                Destroy(gameObject);
                Scan();
            }
        }

        static void Scan()
        {
            PortLog.Marker("---- null audit begin ----");
            var roots = SceneManager.GetActiveScene().GetRootGameObjects();
            int fields = 0, nulls = 0;
            foreach (var root in roots)
            {
                var all = root.GetComponentsInChildren<MonoBehaviour>(true);
                foreach (var mb in all)
                {
                    if (mb == null) { PortLog.Write("missing script on " + root.name); continue; }
                    var t = mb.GetType();
                    foreach (var f in t.GetFields(BindingFlags.Public | BindingFlags.NonPublic | BindingFlags.Instance))
                    {
                        var ft = f.FieldType;
                        bool isUnityObj = typeof(UnityEngine.Object).IsAssignableFrom(ft)
                                          || (ft.IsArray && typeof(UnityEngine.Object).IsAssignableFrom(ft.GetElementType()));
                        if (!isUnityObj) continue;
                        fields++;
                        object v;
                        try { v = f.GetValue(mb); } catch { continue; }
                        bool isNull;
                        if (ft.IsArray) isNull = v == null || ((Array)v).Length == 0;
                        else isNull = !(v is UnityEngine.Object) || (UnityEngine.Object)v == null;
                        if (!isNull) continue;
                        nulls++;
                        PortLog.Write($"NULL {t.Name}.{f.Name} : {ft.Name}");
                    }
                }
            }
            PortLog.Marker($"---- null audit end: checked={fields} null={nulls} ----");
        }
    }
}
