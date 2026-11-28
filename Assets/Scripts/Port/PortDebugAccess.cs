// PortDebugAccess.cs — 把原版自带的调试面板(DebugScreen)在安卓上打开
//
// 原版入口在 WorldManager.DebugUpdate():
//   Editor: F1
//   非 Editor(发行包): F1 + K + O 同时按下
// 手机上没有任何键盘, 所以这条通道永远打不开。这里补一个"触摸触发", 但**只调原版同一个开关**,
// 不新造任何面板内容:
//   GameScreen.instance.DebugScreen.SetActive(!active)
//   WorldManager.instance.DebugScreenOpened = true
// 触发方式: 左下角 12% 区域内 1.5 秒内连点 3 次(不会误触到卡牌与面板)。
#if UNITY_EDITOR || UNITY_ANDROID
using System.Collections;
using System.IO;
using UnityEngine;
using StacklandsPort;

public class PortDebugAccess : MonoBehaviour
{
    static PortDebugAccess _inst;
    int _taps;
    float _firstTap;
    bool _autoChecked;
    bool _inputBroken;

    [RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.AfterSceneLoad)]
    static void Boot()
    {
        if (_inst != null) return;
        var go = new GameObject("PortDebugAccess");
        DontDestroyOnLoad(go);
        _inst = go.AddComponent<PortDebugAccess>();
    }

    void Update()
    {
        if (!_autoChecked && Time.realtimeSinceStartup > 3f)
        {
            _autoChecked = true;
            try
            {
                var f = Path.Combine(Application.persistentDataPath, "files/debug_on");
                if (File.Exists(f)) { Toggle("files/debug_on"); }
            }
            catch { }
        }

        // v0.58: 工程切到了 Input System package, 旧版 UnityEngine.Input 一碰就抛
        // InvalidOperationException, 每帧一条把日志刷爆(实测一次会话 525 条)。
        // 这里只在第一次探测, 抛异常就永久关掉这条路, 改用 HUD 按钮 + files/debug_on。
        if (_inputBroken) return;
        bool began = false;
        Vector2 p = Vector2.zero;
        try
        {
        if (Input.touchCount > 0)
        {
            for (int i = 0; i < Input.touchCount; i++)
            {
                var t = Input.GetTouch(i);
                if (t.phase == TouchPhase.Began) { began = true; p = t.position; break; }
            }
        }
        else if (Input.GetMouseButtonDown(0))
        {
            began = true; p = Input.mousePosition;
        }
        }
        catch (System.Exception e)
        {
            _inputBroken = true;
            PortLog.Write("[DebugAccess] 旧版 Input 不可用(" + e.GetType().Name +
                          "), 已关闭角落三连击, 请用 HUD 的『原版调试(F1)』按钮");
            return;
        }
        if (!began) return;
        if (p.x > Screen.width * 0.12f || p.y > Screen.height * 0.12f) { _taps = 0; return; }

        float now = Time.realtimeSinceStartup;
        if (_taps == 0 || now - _firstTap > 1.5f) { _taps = 1; _firstTap = now; return; }
        _taps++;
        if (_taps >= 3) { _taps = 0; Toggle("三连击"); }
    }

    public static void Toggle(string why)
    {
        try
        {
            var gs = GameScreen.instance;
            if (gs == null || gs.DebugScreen == null)
            {
                PortLog.Write("[DebugAccess] " + why + " -> GameScreen/DebugScreen 为空, 无法打开");
                return;
            }
            bool nowOn = !gs.DebugScreen.gameObject.activeInHierarchy;
            gs.DebugScreen.gameObject.SetActive(nowOn);
            var wm = WorldManager.instance;
            if (wm != null) wm.DebugScreenOpened = true;
            PortLog.Write("[DebugAccess] " + why + " -> DebugScreen active=" + nowOn +
                          " path=" + gs.DebugScreen.name);
        }
        catch (System.Exception e)
        {
            PortLog.Write("[DebugAccess] 异常 " + e.GetType().Name + " " + e.Message);
        }
    }
}
#endif
