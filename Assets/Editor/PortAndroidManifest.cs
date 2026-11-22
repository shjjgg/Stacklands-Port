#if UNITY_ANDROID
using System.IO;
using UnityEditor.Android;

namespace StacklandsPort.Editor
{
    /// <summary>
    /// Unity 2022 生成的 AndroidManifest 只带 INTERNET, 没有 VIBRATE,
    /// 所以 PortHaptics 的震动在真机上会被系统静默忽略。
    /// 在 Gradle 工程生成之后、assemble 之前把权限插进 launcher 的清单文本里(纯文本编辑, 不改二进制)。
    /// </summary>
    public class PortAndroidManifest : IPostGenerateGradleAndroidProject
    {
        public int callbackOrder { get { return 10; } }

        const string Permission = "<uses-permission android:name=\"android.permission.VIBRATE\" />";

        public void OnPostGenerateGradleAndroidProject(string path)
        {
            string[] candidates =
            {
                Path.Combine(path, "src", "main", "AndroidManifest.xml"),
                Path.Combine(path, "launcher", "src", "main", "AndroidManifest.xml"),
            };
            foreach (var file in candidates)
            {
                if (!File.Exists(file)) continue;
                var text = File.ReadAllText(file);
                if (text.Contains("android.permission.VIBRATE")) return;
                int at = text.IndexOf("<application");
                if (at < 0) return;
                text = text.Substring(0, at) + "    " + Permission + "\n    " + text.Substring(at);
                File.WriteAllText(file, text);
                UnityEngine.Debug.Log("[PortAndroidManifest] VIBRATE 权限已注入 " + file);
                return;
            }
            UnityEngine.Debug.LogWarning("[PortAndroidManifest] 没找到 AndroidManifest.xml, 震动可能无效");
        }
    }
}
#endif
