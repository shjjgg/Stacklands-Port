using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.IO.Compression;
using System.Reflection;
using UnityEngine;

namespace StacklandsPort
{
    /// <summary>
    /// DLC 修复(A 方案, v0.30 起不再使用 Harmony):
    /// 原版 RuntimeSokBundle.Load 在 Android 上按 platform 分支拼出空路径, 必然失败;
    /// 原版 DLC 是否安装又只看 Steam。Harmony detour 在 IL2CPP 上会触发栈溢出(v0.23/v0.28 崩溃),
    /// 所以改成「零 patch」的数据注入: 自己把两个 DLC bundle 加载进来, 直接写进
    /// WorldManager.GameDataLoader 的公开列表, 再重跑一次它的 InitializeLoadedData。
    /// 运行时不需要改动任何原版方法的机器码。
    /// </summary>
    public static class PortDlc
    {
        const string Tag = "[PortDlc] ";
        internal static string Dlcdir => Path.Combine(Application.persistentDataPath, "dlc");

        static readonly List<AssetBundle> _keepAlive = new List<AssetBundle>();
        static bool _prepared;
        static bool _injected;
        static bool _prepareTried;
        static bool _loggedMissingLoader;

        [RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.BeforeSceneLoad)]
        static void Boot()
        {
            try
            {
                PortLog.Marker("Run");
                PortLog.Write(Tag + "v0.30 DLC 走数据注入(无 Harmony)");
                var go = new GameObject("[PortDlc]");
                UnityEngine.Object.DontDestroyOnLoad(go);
                go.AddComponent<Runner>();
            }
            catch (Exception e)
            {
                PortLog.Write(Tag + "boot failed: " + e);
            }
        }

        internal sealed class Runner : MonoBehaviour
        {
            IEnumerator Start()
            {
                // 等 WorldManager 起来(它会在 Awake 里 new GameDataLoader)
                for (int i = 0; i < 600; i++)
                {
                    if (!_prepareTried)
                    {
                        _prepareTried = true;
                        try { PrepareFiles(); _prepared = true; }
                        catch (Exception e) { PortLog.Write(Tag + "PrepareFiles 失败: " + e); }
                    }

                    if (_injected) yield break;

                    WorldManager wm = null;
                    try { wm = WorldManager.instance; } catch { }
                    if (wm != null && wm.GameDataLoader != null)
                    {
                        bool ok = false;
                        try { ok = Inject(wm); }
                        catch (Exception e) { PortLog.Write(Tag + "注入失败: " + e); }
                        if (ok) { _injected = true; yield break; }
                    }
                    else if (!_loggedMissingLoader)
                    {
                        _loggedMissingLoader = true;
                        PortLog.Write(Tag + "还没拿到 WorldManager/GameDataLoader, 继续等");
                    }
                    yield return null;
                }
                PortLog.Write(Tag + "超时未注入 DLC");
            }
        }

        /// <summary>
        /// Android 上 StreamingAssets 在 APK(zip) 里, 用 ZipArchive 直接取出两个 DLC 包。
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

        static bool Inject(WorldManager wm)
        {
            var loader = wm.GameDataLoader;
            if (loader == null) return false;
            if (loader.SpiritDlcLoaded && loader.CitiesDlcLoaded)
            {
                PortLog.Write(Tag + "原版已自行加载 DLC, 不需要注入");
                return true;
            }
            if (!_prepared)
            {
                PortLog.Write(Tag + "bundle 还没准备好");
                return false;
            }

            int spiritsCards = LoadInto(loader, "spirits_dlc", CardUpdateType.Spirit);
            int citiesCards = LoadInto(loader, "cities_dlc", CardUpdateType.Cities);
            if (spiritsCards < 0 && citiesCards < 0)
            {
                PortLog.Write(Tag + "两个 DLC 包都没加载成功, 本次不注入");
                return false;
            }

            if (spiritsCards >= 0)
            {
                loader.SpiritDlcLoaded = true;
                PortLog.Write(Tag + "SpiritDlcLoaded=true cards=" + spiritsCards);
            }
            if (citiesCards >= 0)
            {
                loader.CitiesDlcLoaded = true;
                PortLog.Write(Tag + "CitiesDlcLoaded=true cards=" + citiesCards);
            }

            try
            {
                var mi = typeof(GameDataLoader).GetMethod("InitializeLoadedData",
                    BindingFlags.Instance | BindingFlags.NonPublic | BindingFlags.Public);
                if (mi == null) PortLog.Write(Tag + "InitializeLoadedData 没找到, 只做列表追加");
                else { mi.Invoke(loader, null); PortLog.Write(Tag + "InitializeLoadedData 重跑完成"); }
            }
            catch (Exception e)
            {
                PortLog.Write(Tag + "InitializeLoadedData 重跑失败: " + e);
            }
            return true;
        }


        static readonly string[] IdCandidates = { "CardId", "cardId", "Id", "id" };

        /// <summary>
        /// v0.35: 反编译出的 CardData 桩没有 CardId 属性(运行时才有), 用反射取 id;
        /// 取不到就退回 prefab 名, 至少不会重复插入同名卡。
        /// </summary>
        static string CardIdOf(CardData cd)
        {
            try
            {
                var t = cd.GetType();
                for (int i = 0; i < IdCandidates.Length; i++)
                {
                    var pi = t.GetProperty(IdCandidates[i],
                        BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic);
                    if (pi != null && pi.GetValue(cd, null) is string sp && !string.IsNullOrEmpty(sp)) return sp;
                    var fi = t.GetField(IdCandidates[i],
                        BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic);
                    if (fi != null && fi.GetValue(cd) is string sf && !string.IsNullOrEmpty(sf)) return sf;
                }
            }
            catch { }
            return cd.gameObject.name;
        }

        static int LoadInto(GameDataLoader loader, string name, CardUpdateType type)
        {
            string path = Path.Combine(Dlcdir, name);
            if (!File.Exists(path))
            {
                PortLog.Write(Tag + "缺 bundle " + path);
                return -1;
            }
            AssetBundle bundle = null;
            try { bundle = AssetBundle.LoadFromFile(path); }
            catch (Exception e) { PortLog.Write(Tag + "LoadFromFile 抛错 " + name + " : " + e); }
            if (bundle == null)
            {
                PortLog.Write(Tag + "bundle 打不开 " + path);
                return -1;
            }
            _keepAlive.Add(bundle);

            var gos = bundle.LoadAllAssets<GameObject>();
            int cards = 0, skipped = 0;
            var existing = new HashSet<string>();
            for (int i = 0; i < loader.CardDataPrefabs.Count; i++)
            {
                var c = loader.CardDataPrefabs[i];
                if (c != null) existing.Add(CardIdOf(c));
            }
            for (int i = 0; i < gos.Length; i++)
            {
                var cd = gos[i] != null ? gos[i].GetComponent<CardData>() : null;
                if (cd == null) continue;
                // v0.34: 原版 GameDataLoader 里已有同名卡(存档/基础包/重复注入)时不再插第二份,
                // 否则会刷 "Duplicate card id" 并让同一 id 出现两个 prefab。
                // 同一个 CardId 会有 Blueprint_X / Structure_X 两个不同 prefab 名, 必须按 id 去重
                if (!existing.Add(CardIdOf(cd))) { skipped++; continue; }
                cd.CardUpdateType = type;
                loader.CardDataPrefabs.Add(cd);
                cards++;
            }
            loader.SetCardBags.AddRange(bundle.LoadAllAssets<SetCardBagData>());
            loader.BoosterpackDatas.AddRange(bundle.LoadAllAssets<BoosterpackData>());
            PortLog.Write(Tag + "loaded " + name + " go=" + gos.Length + " cards=" + cards + " skipped_dup=" + skipped);
            return cards;
        }
    }
}
