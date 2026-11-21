using System.Collections;
using System.Text;
using UnityEngine;
using UnityEngine.SceneManagement;

namespace StacklandsPort
{
    /// <summary>
    /// 真机无 adb 时的自诊断: 把运行期异常绘制到屏幕上, 并对导入场景做超时兜底。
    /// 仅在检测到错误或超时时绘制, 正常游玩不产生任何 UI。
    /// </summary>
    public static class PortDiagnostics
    {
        const string GameScene = "SampleScene";
        const float WatchdogSeconds = 45f;
        const int MaxLines = 14;

        static readonly StringBuilder Buffer = new StringBuilder();
        static readonly string[] Lines = new string[MaxLines];
        static bool _visible;
        static int _count;

        [RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.BeforeSceneLoad)]
        static void Boot()
        {
            Application.logMessageReceived += OnLog;
            var go = new GameObject("[PortDiagnostics]");
            Object.DontDestroyOnLoad(go);
            go.AddComponent<Runner>();
            Debug.Log("[PortDiagnostics] 已启动, 场景=" + SceneManager.GetActiveScene().name);
        }

        static void OnLog(string message, string stack, LogType type)
        {
            if (type != LogType.Error && type != LogType.Exception && type != LogType.Assert) return;
            lock (Buffer)
            {
                Lines[_count % MaxLines] = "[" + type + "] " + message + (string.IsNullOrEmpty(stack) ? "" : "\n" + stack);
                _count++;
            }
            _visible = true;
        }

        internal static string Report()
        {
            lock (Buffer)
            {
                var sb = new StringBuilder();
                int n = Mathf.Min(_count, MaxLines);
                for (int i = 0; i < n; i++)
                {
                    int idx = (_count - n + i) % MaxLines;
                    if (Lines[idx] != null) sb.Append(Lines[idx]).Append("\n\n");
                }
                return sb.ToString();
            }
        }

        internal sealed class Runner : MonoBehaviour
        {
            void OnGUI()
            {
                if (!_visible) return;
                var style = new GUIStyle(GUI.skin.label) { fontSize = 18, wordWrap = true };
                style.normal.textColor = new Color(1f, 0.85f, 0.3f);
                GUI.Box(new Rect(0, 0, Screen.width, Screen.height), GUIContent.none);
                GUI.Label(new Rect(8, 8, Screen.width - 16, Screen.height - 16), Report(), style);
            }

            IEnumerator Start()
            {
                float t = 0f;
                while (t < WatchdogSeconds)
                {
                    yield return null;
                    t += Time.unscaledDeltaTime;
                    var scene = SceneManager.GetActiveScene();
                    if (scene.name == GameScene) yield break;
                }
                var cur = SceneManager.GetActiveScene();
                Debug.LogWarning("[PortDiagnostics] 场景 " + cur.name + " 停留超过 " + WatchdogSeconds + "s, 强制切到 " + GameScene);
                _visible = true;
                SceneManager.LoadScene(GameScene);
            }
        }
    }
}
