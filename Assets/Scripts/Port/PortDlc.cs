using System;
using System.IO;
using System.Collections;
using System.Reflection;
using HarmonyLib;
using UnityEngine;

namespace StacklandsPort
{
    /// <summary>
    /// DLC 修复(A 方案): RuntimeSokBundle.Load 在 Android 上会拼出一个空路径(按 platform 分支),
    /// 必然失败。这里用 Harmony 前缀把「加载」改成从可写目录读取, 其余状态写回原对象的
    /// myAssetBundle 字段, 让 LoadAssets() 继续按原逻辑走。
    /// 同时把 StreamingAssets/dlc 下的包复制到 persistentDataPath/dlc(只复制一次/大小变化时再复制)。
    /// </summary>
    public static class PortDlc
    {
        const string Tag = "[PortDlc] ";
        internal static string Dlcdir => Path.Combine(Application.persistentDataPath, "dlc");
        static string _lastError = "";

        [RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.BeforeSceneLoad)]
        static void Boot()
        {
            try
            {
                PortLog.Marker("Run");
                var runner = new GameObject("[PortDlc]");
                UnityEngine.Object.DontDestroyOnLoad(runner);
                runner.AddComponent<Runner>().StartCoroutine(PrepareFiles());
                ApplyPatch();
            }
            catch (Exception e)
            {
                PortLog.Write(Tag + "boot failed: " + e);
            }
        }

        internal sealed class Runner : MonoBehaviour { }

        /// <summary>
        /// Android 的 StreamingAssets 在 APK 里(jar), File 读不到, 必须用 UnityWebRequest 取字节再落地。
        /// </summary>
        static IEnumerator PrepareFiles()
        {
            Directory.CreateDirectory(Dlcdir);
            foreach (var name in new[] { "cities_dlc", "spirits_dlc" })
            {
                string url = Application.streamingAssetsPath + "/dlc/" + name;
                string to = Path.Combine(Dlcdir, name);
                long localLen = File.Exists(to) ? new FileInfo(to).Length : -1;

                var req = UnityEngine.Networking.UnityWebRequest.Get(url);
                yield return req.SendWebRequest();
                if (req.result != UnityEngine.Networking.UnityWebRequest.Result.Success)
                {
                    PortLog.Write(Tag + "read " + name + " failed: " + req.error + " url=" + url);
                    continue;
                }

                var bytes = req.downloadHandler.data;
                if (bytes == null || bytes.Length == 0)
                {
                    PortLog.Write(Tag + "read " + name + " empty");
                    continue;
                }
                if (bytes.Length == localLen)
                {
                    PortLog.Write(Tag + "already ready " + name + " " + bytes.Length);
                    continue;
                }
                try
                {
                    File.WriteAllBytes(to, bytes);
                    PortLog.Write(Tag + "wrote " + name + " " + bytes.Length + " -> " + Dlcdir);
                }
                catch (Exception e)
                {
                    PortLog.Write(Tag + "write " + name + " failed: " + e.Message);
                }
            }
        }

        static void ApplyPatch()
        {
            var asm = FindGameScripts();
            if (asm == null) { PortLog.Write(Tag + "GameScripts 程序集没找到, DLC 不处理"); return; }

            var type = asm.GetType("RuntimeSokBundle");
            if (type == null) { PortLog.Write(Tag + "RuntimeSokBundle 类型没找到"); return; }

            var target = type.GetMethod("Load", BindingFlags.Public | BindingFlags.NonPublic | BindingFlags.Instance,
                null, new[] { typeof(string) }, null);
            if (target == null) { PortLog.Write(Tag + "Load(string) 方法没找到"); return; }

            var prefix = new HarmonyMethod(typeof(PortDlc).GetMethod("Prefix", BindingFlags.Static | BindingFlags.NonPublic));
            var harmony = new Harmony("stacklands.port.dlc");
            harmony.Patch(target, prefix);
            PortLog.Write(Tag + "Harmony patch 已挂到 RuntimeSokBundle.Load");
        }

        static Assembly FindGameScripts()
        {
            foreach (var a in AppDomain.CurrentDomain.GetAssemblies())
            {
                if (a.GetName().Name == "GameScripts") return a;
            }
            return null;
        }

        // ReSharper disable once UnusedMember.Local
        static bool Prefix(object __instance, string __0, ref bool __result)
        {
            string id = __0;
            string path = Resolve(id);
            AssetBundle bundle = null;
            try
            {
                if (path != null) bundle = AssetBundle.LoadFromFile(path);
            }
            catch (Exception e)
            {
                _lastError = e.Message;
                PortLog.Write(Tag + "LoadFromFile 抛错 id=" + id + " path=" + path + " err=" + e.Message);
            }

            if (bundle == null)
            {
                __result = false;
                PortLog.Write(Tag + "FAILED id=" + id + " path=" + path + " err=" + (_lastError.Length > 0 ? _lastError : "null"));
                return false;
            }

            var field = __instance.GetType().GetField("myAssetBundle", BindingFlags.Instance | BindingFlags.NonPublic | BindingFlags.Public);
            if (field != null) field.SetValue(__instance, bundle);
            __result = true;
            PortLog.Write(Tag + "OK id=" + id + " path=" + path + " assets=" + bundle.GetAllAssetNames().Length);
            return false;
        }

        static string Resolve(string id)
        {
            if (string.IsNullOrEmpty(id)) return null;
            var key = Path.GetFileNameWithoutExtension(id).ToLowerInvariant();
            if (!Directory.Exists(Dlcdir)) return null;

            foreach (var f in Directory.GetFiles(Dlcdir))
            {
                var n = Path.GetFileName(f).ToLowerInvariant();
                if (n == key || n.Contains(key) || key.Contains(n))
                    return f;
            }
            PortLog.Write(Tag + "没有匹配的 bundle 文件, id=" + id + " dir=" + Dlcdir);
            return null;
        }
    }
}
