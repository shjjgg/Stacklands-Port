#if UNITY_EDITOR
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;

/// <summary>
/// 纹理导入策略: 把 AssetRipper 导出的"全默认 PNG 导入"改成移动端可用配置。
/// 原版是 Unity 打包时的 ASTC/ETC2 压缩 + 按用途分级的 maxTextureSize;
/// 这里按"像素尺寸自动分级"统一施加, 保证手机内存不被 2284 张未压缩贴图撑爆。
/// </summary>
public static class TextureImportPolicy
{
    // Android 压缩格式: 有 alpha 用 ASTC 6x6, 无 alpha 用 ASTC 8x8
    private const TextureImporterFormat AstcAlpha = TextureImporterFormat.ASTC_6x6;
    private const TextureImporterFormat AstcOpaque = TextureImporterFormat.ASTC_8x8;

    [MenuItem("Stacklands/纹理导入策略/应用")]
    public static void Apply()
    {
        var paths = new List<string>();
        foreach (var guid in AssetDatabase.FindAssets("t:Texture2D"))
        {
            var p = AssetDatabase.GUIDToAssetPath(guid);
            if (p.StartsWith("Assets/Texture2D/") || p.StartsWith("Assets/SokpopIntro/"))
                paths.Add(p);
        }

        int changed = 0, skipped = 0;
        AssetDatabase.StartAssetEditing();
        try
        {
            foreach (var path in paths)
            {
                var ti = AssetImporter.GetAtPath(path) as TextureImporter;
                if (ti == null) { skipped++; continue; }

                int w, h;
                ti.GetSourceTextureWidthAndHeight(out w, out h);
                bool big = Mathf.Max(w, h) > 512;

                // 通用: 不读 CPU 内存, 关掉 mipmap(2D 正交相机用不到)
                ti.isReadable = false;
                ti.mipmapEnabled = false;
                ti.maxTextureSize = big ? 2048 : 1024;   // 卡面最大 1024 足够 1080p 屏
                ti.textureCompression = TextureImporterCompression.CompressedHQ;
                ti.crunchedCompression = false;

                var ps = ti.GetPlatformTextureSettings("Android");
                ps.overridden = true;
                ps.maxTextureSize = big ? 2048 : 1024;
                ps.format = ti.DoesSourceTextureHaveAlpha() ? AstcAlpha : AstcOpaque;
                ps.compressionQuality = 100;
                ti.SetPlatformTextureSettings(ps);

                ti.SaveAndReimport();
                changed++;
            }
        }
        finally
        {
            AssetDatabase.StopAssetEditing();
            AssetDatabase.Refresh();
        }
        Debug.Log($"[TextureImportPolicy] 已处理 {changed} 张, 跳过 {skipped} 张");
    }
}
#endif
