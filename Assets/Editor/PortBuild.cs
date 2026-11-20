// PortBuild.cs — 移植工程构建胶水 (放入 Assets/Editor/)
// 仅负责出包配置, 不改玩法逻辑。
// CI: game-ci/unity-builder buildMethod = PortBuild.PerformAndroidBuild
//
// 原版 PlayerSettings 实测(globalgamemanagers):
//   companyName = sokpop, productName = Stacklands, activeColorSpace = Linear(1),
//   MTRendering = true, 显示 Unity splash logo, 关闭独立 splash screen。
// 包名/方向/图形 API 在二进制中未以明文保存, 下方占位值需在编辑器内对照原版确认后锁定。
#if UNITY_EDITOR
using System;
using System.Linq;
using UnityEditor;
using UnityEditor.Build.Reporting;
using UnityEngine;

public static class PortBuild
{
    // ---- 待编辑器核对后锁定的常量 ----
    private const string CompanyName = "sokpop";
    private const string ProductName = "Stacklands";
    // TODO: 确认原版 Android/PC bundle identifier; 移植包使用独立包名, 不冒充官方包。
    private const string BundleIdentifier = "com.sokpop.stacklands.port";
    private const int MinSdkVersion = 26;

    public static void PerformAndroidBuild()
    {
        // 1. 场景列表: 与原版 EditorBuildSettings 对齐 (IntroScene -> SampleScene)
        var scenes = EditorBuildSettings.scenes
            .Where(s => s.enabled)
            .Select(s => s.path)
            .ToArray();
        if (scenes.Length == 0)
        {
            scenes = new[]
            {
                "Assets/SokpopIntro/IntroScene.unity",
                "Assets/Scenes/SampleScene.unity",
            };
        }

        // 2. 基础 PlayerSettings
        PlayerSettings.companyName = CompanyName;
        PlayerSettings.productName = ProductName;
        PlayerSettings.applicationIdentifier = BundleIdentifier;
        PlayerSettings.version = GetBuildVersion();
        PlayerSettings.bundleVersionCode = GetBundleVersionCode();

        // 颜色空间 / 多线程渲染 (对齐原版: Linear, MT 开启)
        PlayerSettings.colorSpace = ColorSpace.Linear;
        PlayerSettings.MTRendering = true;

        // 屏幕方向: TODO 对照原版场景确认横/竖屏; 暂按横屏左。
        PlayerSettings.defaultInterfaceOrientation = UIOrientation.LandscapeLeft;

        // 3. Android / IL2CPP 配置
        PlayerSettings.SetScriptingBackend(BuildTargetGroup.Android, ScriptingImplementation.IL2CPP);
        PlayerSettings.Android.targetArchitectures = AndroidArchitecture.ARM64;
        PlayerSettings.Android.minSdkVersion = (AndroidSdkVersions)MinSdkVersion;

        // 图形 API: Vulkan 优先, GLES3 兼容; 先自动检测, 必要时显式指定。
        PlayerSettings.SetGraphicsAPIs(BuildTarget.Android, new[]
        {
            GraphicsDeviceType.Vulkan,
            GraphicsDeviceType.OpenGLES3,
        });

        // 裁剪级别: 首版保行为一致用 Low; 验证通过后再逐步收紧 (见 docs/04)。
        PlayerSettings.SetManagedStrippingLevel(BuildTargetGroup.Android, ManagedStrippingLevel.Low);

        // 4. 签名 (Release): 由 CI 环境变量注入; 本地 Debug 走调试签名。
        ApplyKeystoreIfConfigured();

        // 5. 构建选项
        var options = new BuildPlayerOptions
        {
            scenes = scenes,
            locationPathName = GetOutputPath(),
            target = BuildTarget.Android,
            options = BuildOptions.None,
        };

        var report = BuildPipeline.BuildPlayer(options);
        var summary = report.summary;

        Debug.Log($"[PortBuild] result={summary.result} scenes={scenes.Length} " +
                  $"output={summary.outputPath} size={summary.totalSizeBytes}B " +
                  $"time={summary.totalTime}");

        if (summary.result != BuildResult.Succeeded)
        {
            Debug.LogError($"[PortBuild] 构建失败: {summary.result}");
            EditorApplication.Exit(1);
        }
    }

    private static string GetBuildVersion() =>
        Environment.GetEnvironmentVariable("BUILD_VERSION") ?? "0.1.0";

    private static int GetBundleVersionCode()
    {
        var s = Environment.GetEnvironmentVariable("BUNDLE_VERSION_CODE");
        return int.TryParse(s, out var v) ? v : 1;
    }

    private static string GetOutputPath()
    {
        // 出 AAB 还是 APK 由环境变量控制; 冒烟调试默认 APK。
        var aab = Environment.GetEnvironmentVariable("BUILD_AAB");
        var dir = "builds/android";
        return aab == "1" ? $"{dir}/Stacklands-Port.aab" : $"{dir}/Stacklands-Port.apk";
    }

    private static void ApplyKeystoreIfConfigured()
    {
        var ksName = Environment.GetEnvironmentVariable("KEYSTORE_NAME");
        if (string.IsNullOrEmpty(ksName)) return;

        PlayerSettings.Android.keystoreName = ksName;
        PlayerSettings.Android.keystorePassword = Environment.GetEnvironmentVariable("KEYSTORE_PASSWORD");
        PlayerSettings.Android.keyaliasName = Environment.GetEnvironmentVariable("KEYALIAS_NAME");
        PlayerSettings.Android.keyaliasPass = Environment.GetEnvironmentVariable("KEYALIAS_PASSWORD");
    }
}
#endif
