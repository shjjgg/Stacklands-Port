// PortBuild.cs — 移植工程构建胶水 (放入 Assets/Editor/)
// 仅负责出包配置, 不改玩法逻辑。
// CI: 容器内 Unity -batchmode -executeMethod PortBuild.PerformAndroidBuild
//
// 原版 PlayerSettings 实测(globalgamemanagers):
//   companyName = sokpop, productName = Stacklands, activeColorSpace = Linear(1),
//   MTRendering = true, 显示 Unity splash logo, 关闭独立 splash screen。
// 包名/方向在二进制中未以明文保存, 默认值由环境变量覆盖 (见 docs/15 T19), 未覆盖时保持占位并告警。
#if UNITY_EDITOR
using System;
using System.IO;
using System.Linq;
using UnityEditor;
using UnityEditor.Build.Reporting;
using UnityEngine;
using UnityEngine.Rendering;

public static class PortBuild
{
    // ---- 待编辑器核对后锁定的常量 ----
    private const string CompanyName = "sokpop";
    private const string ProductName = "Stacklands";
    // 移植包使用独立包名, 不冒充官方包; 可由 BUNDLE_IDENTIFIER 覆盖。
    private const string DefaultBundleIdentifier = "com.sokpop.stacklands.port";
    private const int DefaultMinSdkVersion = 26;

    // 原版场景: Assets/SokpopIntro/IntroScene.unity → Assets/Scenes/SampleScene.unity
    private static readonly string[] RequiredScenes =
    {
        "Assets/SokpopIntro/IntroScene.unity",
        "Assets/Scenes/SampleScene.unity",
    };

    public static void PerformAndroidBuild()
    {
        var isDevelopment = Env("BUILD_TYPE", "Release") == "Debug";
        var outputPath = GetOutputPath();

        // 1. 场景列表: 优先用工程 EditorBuildSettings; 缺失时回落到原版固定列表。
        //    无论哪种来源都必须两个场景齐全, 缺一个直接失败, 不允许出"能装但进不去游戏"的包。
        var scenes = ResolveScenes();
        ValidateScenesExist(scenes);

        // 2. 基础 PlayerSettings
        var bundleId = Env("BUNDLE_IDENTIFIER", DefaultBundleIdentifier);
        if (bundleId == DefaultBundleIdentifier)
        {
            Debug.LogWarning("[PortBuild] 使用占位包名 " + bundleId +
                             "; 原版包名未解出前不用于正式发布 (docs/15 T19)。");
        }
        PlayerSettings.companyName = CompanyName;
        PlayerSettings.productName = ProductName;
        PlayerSettings.applicationIdentifier = bundleId;
        PlayerSettings.bundleVersion = GetBuildVersion();
        PlayerSettings.Android.bundleVersionCode = GetBundleVersionCode();

        // 颜色空间 / 多线程渲染 (对齐原版: Linear, MT 开启)
        PlayerSettings.colorSpace = ColorSpace.Linear;
        PlayerSettings.SetMobileMTRendering(BuildTargetGroup.Android, true);

        // 启动画面: 原版显示 Unity logo
        PlayerSettings.SplashScreen.show = true;
        PlayerSettings.SplashScreen.showUnityLogo = true;

        // 屏幕方向: 原版方向未从二进制解出, 默认横屏左, 由 SCREEN_ORIENTATION 覆盖。
        PlayerSettings.defaultInterfaceOrientation = ParseOrientation(
            Env("SCREEN_ORIENTATION", "LandscapeLeft"));

        // 3. Android / IL2CPP 配置
        PlayerSettings.SetScriptingBackend(BuildTargetGroup.Android, ScriptingImplementation.IL2CPP);
        PlayerSettings.Android.targetArchitectures = AndroidArchitecture.ARM64;
        ApplyAndroidSdkLevel(Env("MIN_SDK", DefaultMinSdkVersion.ToString()),
            DefaultMinSdkVersion, v => PlayerSettings.Android.minSdkVersion = v, "MIN_SDK");
        // TARGET_SDK=auto 表示跟随 Unity 默认(2022.3 为 API 33); 否则按显式数值。
        var targetSdk = Env("TARGET_SDK", "auto");
        if (targetSdk != "auto")
        {
            ApplyAndroidSdkLevel(targetSdk, 33,
                v => PlayerSettings.Android.targetSdkVersion = v, "TARGET_SDK");
        }

        // 图形 API: Vulkan 优先, GLES3 兜底。必须先关掉"默认 API"开关, 否则上面的设置会被忽略。
        PlayerSettings.SetUseDefaultGraphicsAPIs(BuildTarget.Android, false);
        PlayerSettings.SetGraphicsAPIs(BuildTarget.Android, new[]
        {
            GraphicsDeviceType.Vulkan,
            GraphicsDeviceType.OpenGLES3,
        });

        // 裁剪: 首版保行为一致用 Low; 且关闭引擎代码裁剪 —— 本作有反射/Harmony 路径,
        // 引擎模块被裁会表现为运行期 MissingMethod, 见 docs/04。
        PlayerSettings.SetManagedStrippingLevel(BuildTargetGroup.Android, ManagedStrippingLevel.Low);
        PlayerSettings.stripEngineCode = false;

        // IL2CPP 编译器优化: Release 走 Release 编译, Debug 保留检查。
        PlayerSettings.SetIl2CppCompilerConfiguration(BuildTargetGroup.Android,
            isDevelopment ? Il2CppCompilerConfiguration.Debug : Il2CppCompilerConfiguration.Release);

        // SokLoc 在线同步走 UnityWebRequest, 需要 INTERNET 权限。
        PlayerSettings.Android.forceInternetPermission = true;

        // 4. 签名 (Release): 由 CI 环境变量注入; 未配置时走 Unity 调试签名, 只允许内部冒烟。
        var keystoreApplied = ApplyKeystoreIfConfigured();

        // 5. 构建选项
        Directory.CreateDirectory(Path.GetDirectoryName(outputPath) ?? "builds/android");
        var buildOptions = BuildOptions.None;
        if (isDevelopment)
        {
            buildOptions |= BuildOptions.Development;
        }

        Debug.Log($"[PortBuild] target=Android backend=IL2CPP arch=ARM64 " +
                  $"bundle={bundleId} ver={PlayerSettings.bundleVersion}" +
                  $"({PlayerSettings.Android.bundleVersionCode}) " +
                  $"minSdk={PlayerSettings.Android.minSdkVersion} " +
                  $"targetSdk={PlayerSettings.Android.targetSdkVersion} " +
                  $"orientation={PlayerSettings.defaultInterfaceOrientation} " +
                  $"keystore={(keystoreApplied ? "custom" : "debug")} " +
                  $"dev={isDevelopment} scenes={string.Join(",", scenes)}");

        var report = BuildPipeline.BuildPlayer(new BuildPlayerOptions
        {
            scenes = scenes,
            locationPathName = outputPath,
            target = BuildTarget.Android,
            options = buildOptions,
        });

        var summary = report.summary;
        Debug.Log($"[PortBuild] result={summary.result} scenes={scenes.Length} " +
                  $"output={summary.outputPath} size={summary.totalSize}B " +
                  $"errors={summary.totalErrors} warnings={summary.totalWarnings} " +
                  $"time={summary.totalTime}");

        if (summary.result != BuildResult.Succeeded)
        {
            Debug.LogError($"[PortBuild] 构建失败: {summary.result}, 详见上方日志与 build.log");
            EditorApplication.Exit(1);
            return;
        }

        EditorApplication.Exit(0);
    }

    // ---- 场景 ----

    private static string[] ResolveScenes()
    {
        var enabled = EditorBuildSettings.scenes
            .Where(s => s.enabled)
            .Select(s => s.path)
            .ToArray();
        if (enabled.Length >= RequiredScenes.Length)
        {
            return enabled;
        }
        return RequiredScenes;
    }

    private static void ValidateScenesExist(string[] scenes)
    {
        var missing = scenes.Where(p => !File.Exists(p)).ToList();
        if (missing.Count > 0)
        {
            foreach (var p in missing)
            {
                Debug.LogError("[PortBuild] 缺少场景文件: " + p);
            }
            Debug.LogError("[PortBuild] 场景未落地时不允许构建(AAB/APK 会装得上但进不去游戏)。" +
                           "先按 docs/15 T1 完成 AssetRipper 导出。");
            EditorApplication.Exit(2);
        }
    }

    // ---- 环境变量 ----

    private static string Env(string key, string fallback)
    {
        var v = Environment.GetEnvironmentVariable(key);
        return string.IsNullOrEmpty(v) ? fallback : v.Trim();
    }

    private static int ParseInt(string value, int fallback)
    {
        return int.TryParse(value, out var v) ? v : fallback;
    }

    // AndroidSdkVersions 是离散枚举, 直接强转未定义值会让构建在 PlayerSettings 校验阶段抛错;
    // 这里先 Enum.IsDefined 校验, 不合法就报警并回落到默认。
    private static void ApplyAndroidSdkLevel(string raw, int fallback,
        Action<AndroidSdkVersions> setter, string label)
    {
        var level = ParseInt(raw, fallback);
        var candidate = (AndroidSdkVersions)level;
        if (!Enum.IsDefined(typeof(AndroidSdkVersions), candidate))
        {
            Debug.LogWarning($"[PortBuild] {label}={level} 不是 Unity 2022.3 支持的 AndroidSdkVersions, " +
                             $"回落到 {fallback}。");
            level = fallback;
            candidate = (AndroidSdkVersions)level;
        }
        setter(candidate);
    }

    private static UIOrientation ParseOrientation(string value)
    {
        switch (value)
        {
            case "Portrait": return UIOrientation.Portrait;
            case "PortraitUpsideDown": return UIOrientation.PortraitUpsideDown;
            case "LandscapeRight": return UIOrientation.LandscapeRight;
            case "AutoRotation": return UIOrientation.AutoRotation;
            default: return UIOrientation.LandscapeLeft;
        }
    }

    private static string GetBuildVersion()
    {
        return Env("BUILD_VERSION", "0.1.0");
    }

    private static int GetBundleVersionCode()
    {
        return ParseInt(Env("BUNDLE_VERSION_CODE", "1"), 1);
    }

    private static string GetOutputPath()
    {
        // 出 AAB 还是 APK 由环境变量控制; 冒烟调试默认 APK。
        var aab = Env("BUILD_AAB", "0") == "1";
        return aab ? "builds/android/Stacklands-Port.aab" : "builds/android/Stacklands-Port.apk";
    }

    private static bool ApplyKeystoreIfConfigured()
    {
        var ksName = Environment.GetEnvironmentVariable("KEYSTORE_NAME");
        if (string.IsNullOrEmpty(ksName))
        {
            Debug.LogWarning("[PortBuild] 未配置 KEYSTORE_NAME, 走 Unity 调试签名(仅内部冒烟, 不可发布)。");
            return false;
        }

        PlayerSettings.Android.useCustomKeystore = true;
        PlayerSettings.Android.keystoreName = ksName;
        PlayerSettings.Android.keystorePassword = Environment.GetEnvironmentVariable("KEYSTORE_PASSWORD");
        PlayerSettings.Android.keyaliasName = Environment.GetEnvironmentVariable("KEYALIAS_NAME");
        PlayerSettings.Android.keyaliasPass = Environment.GetEnvironmentVariable("KEYALIAS_PASSWORD");
        return true;
    }
}
#endif
