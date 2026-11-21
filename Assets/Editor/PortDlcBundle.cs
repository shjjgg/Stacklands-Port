// PortDlcBundle.cs — DLC 资产重打成 Android 包 (仅编辑器)
//
// 为什么需要这一步:
//   PC 版 DLC bundle 里的 Texture2D 全是 DXT5(TextureFormat 12), Android 上不可用。
//   所以 DLC 的 1:1 做法是: AssetRipper 导出 DLC 资产 → 导入本工程 → 用 Android 目标重新 BuildAssetBundle。
//
// 脚本引用重映射:
//   导出的 prefab/.asset 里的 m_Script 指向导出工程里的 .cs 文件 guid(11500000),
//   本工程没有这些 .cs(逻辑在 Plugins/GameScripts.dll 里), 所以必须换成 DLL 里对应类型的
//   (dll guid, localFileID), 否则导入后所有组件都会变成 Missing Script。
//   guid→类名 的映射固化在 Assets/DlcSource/script_guids.json (导出时生成)。
#if UNITY_EDITOR
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using UnityEditor;
using UnityEngine;

public static class PortDlcBundle
{
    const string SrcRoot = "Assets/DlcSource/assetbundleresources";
    const string OutDir = "Assets/StreamingAssets/dlc";
    const string DllPath = "Assets/Plugins/GameScripts.dll";
    const string GuidMapPath = "Assets/DlcSource/script_guids.json";

    static readonly string[] BundleFolders = { "cities_dlc", "spirits_dlc" };

    [MenuItem("Stacklands/DLC/只做脚本重映射")]
    public static void RemapOnlyMenu()
    {
        var r = RemapAllScripts();
        var ids = LoadDllScriptIds();
        foreach (var k in new[] { "CardData", "SetCardBagData", "BoosterpackData" })
            if (ids.TryGetValue(k, out var v)) Debug.Log($"[PortDlc] {k} -> guid={v.Guid} localId={v.LocalId}");
        Debug.Log($"[PortDlc] remap count={r.count} missing={r.missing.Count}");
    }

    [MenuItem("Stacklands/DLC/重建 DLC 包")]
    public static void BuildAllMenu() { BuildAll(true); }

    /// <summary>CI 在 BuildPlayer 之前调用; 返回 false 表示 DLC 包不可用(不阻塞出包, 但会打错误日志)。</summary>
    public static bool BuildAll(bool verbose)
    {
        var ok = true;
        try
        {
            Directory.CreateDirectory(OutDir);
            var remap = RemapAllScripts();
            if (remap.missing.Count > 0)
            {
                Debug.LogError("[PortDlc] 未解析的脚本引用: " + string.Join(", ", remap.missing));
                ok = false;
            }
            else
            {
                Debug.Log($"[PortDlc] 脚本引用重映射完成: {remap.count} 处");
            }

            ConfigureTextures();

            var builds = new List<AssetBundleBuild>();
            foreach (var name in BundleFolders)
            {
                var dir = Path.Combine(SrcRoot, name);
                if (!Directory.Exists(dir)) { Debug.LogError("[PortDlc] 缺目录 " + dir); ok = false; continue; }
                var assets = Directory.GetFiles(dir, "*", SearchOption.AllDirectories)
                    .Where(p => p.EndsWith(".prefab") || p.EndsWith(".asset"))
                    .Select(p => p.Replace('\\', '/'))
                    .ToArray();
                if (assets.Length == 0) { Debug.LogError("[PortDlc] " + name + " 没有资产"); ok = false; continue; }
                builds.Add(new AssetBundleBuild { assetBundleName = name, assetNames = assets });
            }

            if (builds.Count > 0)
            {
                var options = BuildAssetBundleOptions.None;
                var manifest = BuildPipeline.BuildAssetBundles(OutDir, builds.ToArray(), options, BuildTarget.Android);
                if (manifest == null) { Debug.LogError("[PortDlc] BuildAssetBundles 返回 null"); return false; }

                foreach (var b in builds)
                {
                    var p = Path.Combine(OutDir, b.assetBundleName);
                    if (!File.Exists(p)) { Debug.LogError("[PortDlc] 打 " + b.assetBundleName + " 失败"); ok = false; continue; }
                    Debug.Log($"[PortDlc] built {b.assetBundleName} assets={b.assetNames.Length} size={new FileInfo(p).Length}B");
                }
                // 清掉 manifest 及其 bundle, 只留两个 DLC 包
                foreach (var extra in new[] { "Android", "Android.manifest" })
                {
                    var p = Path.Combine(OutDir, extra);
                    if (File.Exists(p)) File.Delete(p);
                }
                foreach (var b in builds)
                {
                    var m = Path.Combine(OutDir, b.assetBundleName + ".manifest");
                    if (File.Exists(m)) File.Delete(m);
                }
            }
        }
        catch (Exception e)
        {
            Debug.LogError("[PortDlc] 异常: " + e);
            ok = false;
        }
        return ok;
    }

    // ---- 脚本引用重映射 ----

    sealed class RemapResult { public int count; public readonly List<string> missing = new List<string>(); }

    static readonly Regex ScriptRef = new Regex(@"m_Script: {fileID: 11500000, guid: ([0-9a-f]{32}), type: 3}");

    static RemapResult RemapAllScripts()
    {
        var result = new RemapResult();
        var guidToClass = LoadGuidMap();
        var classToId = LoadDllScriptIds();

        var files = Directory.GetFiles(Path.Combine(SrcRoot, ".."), "*", SearchOption.AllDirectories)
            .Where(p => p.EndsWith(".prefab") || p.EndsWith(".asset"))
            .ToArray();

        foreach (var file in files)
        {
            var text = File.ReadAllText(file);
            if (!text.Contains("m_Script: {fileID: 11500000")) continue;

            var replaced = ScriptRef.Replace(text, m =>
            {
                var guid = m.Groups[1].Value;
                var cls = guidToClass.TryGetValue(guid, out var c) ? c : null;
                if (cls == null)
                {
                    result.missing.Add(Path.GetFileName(file) + ":" + guid);
                    return m.Value;
                }
                var id = classToId.TryGetValue(cls, out var i) ? i : null;
                if (id == null)
                {
                    result.missing.Add(Path.GetFileName(file) + ":" + cls);
                    return m.Value;
                }
                result.count++;
                return $"m_Script: {{fileID: {id.LocalId}, guid: {id.Guid}, type: 3}}";
            });

            if (replaced != text) File.WriteAllText(file, replaced);
        }
        return result;
    }

    static Dictionary<string, string> LoadGuidMap()
    {
        var map = new Dictionary<string, string>();
        var json = File.ReadAllText(GuidMapPath);
        // 极简 JSON 解析: {"guid":"Class", ...} 全是字符串对, 不引入依赖。
        foreach (Match m in Regex.Matches(json, "\"([0-9a-f]{32})\":\\s*\"([^\"]+)\""))
            map[m.Groups[1].Value] = m.Groups[2].Value;
        return map;
    }

    sealed class ScriptId { public string Guid; public long LocalId; }

    static Dictionary<string, ScriptId> LoadDllScriptIds()
    {
        var map = new Dictionary<string, ScriptId>();
        var assets = AssetDatabase.LoadAllAssetsAtPath(DllPath);
        foreach (var obj in assets)
        {
            if (!(obj is MonoScript)) continue;
            var type = ((MonoScript)obj).GetClass();
            if (type == null) continue;
            if (!AssetDatabase.TryGetGUIDAndLocalFileIdentifier(obj, out var guid, out long localId)) continue;
            map[type.Name] = new ScriptId { Guid = guid, LocalId = localId };
            map[type.FullName] = map[type.Name];
        }
        Debug.Log($"[PortDlc] DLL 里可映射类型 {map.Count}");
        return map;
    }

    // ---- 贴图平台设置: Android 用 ASTC 4x4 (DXT5 在 Android 不可用) ----

    static void ConfigureTextures()
    {
        var dir = "Assets/DlcSource/Texture2D";
        var changed = 0;
        foreach (var guid in AssetDatabase.FindAssets("t:Texture2D", new[] { dir }))
        {
            var path = AssetDatabase.GUIDToAssetPath(guid);
            var importer = AssetImporter.GetAtPath(path) as TextureImporter;
            if (importer == null) continue;
            var android = importer.GetPlatformTextureSettings("Android");
            var need = !android.overridden || android.format != TextureImporterFormat.ASTC_4x4;
            // 贴图本身保持 Default(不要自动切图), Sprite 一律来自 DlcSource/Sprite 单独导出的资产。
            if (importer.textureType != TextureImporterType.Default) need = true;
            if (!need) continue;

            importer.textureType = TextureImporterType.Default;
            importer.spriteImportMode = SpriteImportMode.None;
            var settings = new TextureImporterPlatformSettings
            {
                name = "Android",
                overridden = true,
                format = TextureImporterFormat.ASTC_4x4,
                maxTextureSize = 2048,
                compressionQuality = 50,
            };
            importer.SetPlatformTextureSettings(settings);
            importer.SaveAndReimport();
            changed++;
        }
        Debug.Log("[PortDlc] 贴图 Android 覆盖写入 " + changed + " 张");
    }
}
#endif
