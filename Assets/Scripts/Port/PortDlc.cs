using System;
using System.IO;
using System.IO.Compression;
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
                PrepareFiles();
                ApplyPatch();
            }
            catch (Exception e)
            {
                PortLog.Write(Tag + "boot failed: " + e);
            }
        }

        /// <summary>
        /// Android 上 StreamingAssets 在 APK(zip) 里, File/UnityWebRequest 都不如直接读 zip 稳:
        /// Application.dataPath 就是 base.apk 路径, 用 ZipArchive 同步取出两个 DLC 包。
        /// </summary>
        static void PrepareFiles()
        {
            Directory.CreateDirectory(Dlcdir);
            string apk = Application.dataPath;
            try
            {
                using (var zip = ZipFile.OpenRead(apk))
                {
                    foreach (var name in new[] { "cities_dlc", "spirits_dlc" })
                    {
                        var entry = zip.GetEntry("assets/dlc/" + name);
                        if (entry == null)
                        {
                            PortLog.Write(Tag + "APK 内缺 assets/dlc/" + name);
                            continue;
                        }
                        string to = Path.Combine(Dlcdir, name);
                        long local = File.Exists(to) ? new FileInfo(to).Length : -1;
                        if (local == entry.Length)
                        {
                            PortLog.Write(Tag + "already ready " + name + " " + local);
                            continue;
                        }
                        using (var src = entry.Open())
                        using (var dst = File.Create(to))
                            src.CopyTo(dst);
                        PortLog.Write(Tag + "extracted " + name + " " + new FileInfo(to).Length + "B -> " + Dlcdir);
                    }
                }
            }
            catch (Exception e)
            {
                PortLog.Write(Tag + "APK 解包失败 " + apk + " : " + e);
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

            // 原版用 SteamApps.BIsDlcInstalled 判断是否装 DLC; Android 没有 Steam → 永远 false。
            // 这里改成「本地有包即视为已安装」, 与 A 方案一致。
            var wm = asm.GetType("WorldManager");
            if (wm != null)
            {
                var installed = new HarmonyMethod(typeof(PortDlc).GetMethod("InstalledPrefix", BindingFlags.Static | BindingFlags.NonPublic));
                foreach (var m in new[] { "SpiritDLCInstalled", "CitiesDLCInstalled" })
                {
                    var mi = wm.GetMethod(m, BindingFlags.Instance | BindingFlags.NonPublic);
                    if (mi == null) { PortLog.Write(Tag + "没找到 " + m); continue; }
                    harmony.Patch(mi, installed);
                    PortLog.Write(Tag + "Harmony patch 已挂到 WorldManager." + m);
                }
            }
            else PortLog.Write(Tag + "WorldManager 类型没找到");
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

        // ReSharper disable once UnusedMember.Local
        static bool InstalledPrefix(ref bool __result)
        {
            __result = true;
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
