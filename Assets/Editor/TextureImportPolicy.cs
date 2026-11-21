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
    // 准无损分级(用户确认口径):
    //   <=512  : RGBA32 完全不压, 小图省不出多少内存, 优先零损失
    //   <=1024 : ASTC 4x4 (8bpp, 视觉无损), 只保 1024 不缩尺寸
    //   >1024  : ASTC 6x6, 避免单张 2048 占 4MB 级显存
    private const TextureImporterFormat LosslessFmt = TextureImporterFormat.RGBA32;
    private const TextureImporterFormat Astc4 = TextureImporterFormat.ASTC_4x4;
    private const TextureImporterFormat Astc6 = TextureImporterFormat.ASTC_6x6;

    [MenuItem("Stacklands/纹理导入策略/应用")]
    public static void Apply()
    {
        var paths = new List<string>();
        foreach (var guid in AssetDatabase.FindAssets("t:Texture2D"))
        {
            var p = AssetDatabase.GUIDToAssetPath(guid);
            // 覆盖全工程纹理: 回填的 462 个依赖资源里也有 PNG, 漏掉会按默认导入(未压缩/可读)撑爆内存
            if (p.StartsWith("Assets/") && !p.StartsWith("Assets/Plugins/"))
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
                int m = Mathf.Max(w, h);
                bool lossless = m <= 512;
                var fmt = lossless ? LosslessFmt : (m <= 1024 ? Astc4 : Astc6);

                // 通用: 不读 CPU 内存, 关掉 mipmap(2D 正交相机用不到), 上限不低于原尺寸(不缩分辨率)
                ti.isReadable = false;
                ti.mipmapEnabled = false;
                ti.maxTextureSize = 2048;
                ti.textureCompression = lossless
                    ? TextureImporterCompression.Uncompressed
                    : TextureImporterCompression.CompressedHQ;
                ti.crunchedCompression = false;

                var ps = ti.GetPlatformTextureSettings("Android");
                ps.overridden = true;
                ps.maxTextureSize = 2048;
                ps.format = fmt;
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
