using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.InputSystem.LowLevel;
using UnityEngine.InputSystem.Utilities;

/// <summary>
/// Stacklands 原本是键鼠驱动(ImGui 只认 Mouse.current)。Android 上没有鼠标设备,
/// 这里把触摸屏状态"翻译"成鼠标事件灌进 InputSystem, 让 ImGui / 游戏逻辑照旧跑:
///   单指按下-拖动   -> 鼠标左键按下 + 位置移动(= 拖拽卡牌)
///   单指短按        -> 左键点击
///   单指长按 0.45s   -> 右键按下(= 原右键菜单/旋转)
///   双指捏合        -> 滚轮(_ScrollWheel), 缩放视角
///   双指平移        -> 中键拖动(平移画布)
/// 挂在 DontDestroyOnLoad 的常驻对象上, 不依赖场景里的任何引用。
/// </summary>
public class TouchMouseBridge : MonoBehaviour
{
    private const float LongPressSeconds = 0.45f;
    private const float TapMaxMove = 12f;

    private static TouchMouseBridge _instance;

    [RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.BeforeSceneLoad)]
    private static void Bootstrap()
    {
        if (_instance != null) return;
        var go = new GameObject("[TouchMouseBridge]");
        DontDestroyOnLoad(go);
        _instance = go.AddComponent<TouchMouseBridge>();
    }

    private Vector2 _lastPos;
    private Vector2 _pressPos;
    private float _pressTime;
    private bool _leftDown;
    private bool _rightDown;
    private bool _dragging;
    private bool _longFired;
    private float _pinchPrev;

    private void Update()
    {
        var ts = Touchscreen.current;
        var mouse = Mouse.current;
        if (ts == null || mouse == null) return;

        var touches = ts.touches;
        int active = 0;
        Vector2 sum = Vector2.zero;
        for (int i = 0; i < touches.Length; i++)
        {
            if (touches[i].isInProgress)
            {
                active++;
                sum += touches[i].position.ReadValue();
            }
        }

        if (active >= 2)
        {
            // 双指: 捏合 -> 滚轮; 平均点移动 -> 中键拖拽
            var p0 = touches[0].position.ReadValue();
            var p1 = touches[1].position.ReadValue();
            float dist = Vector2.Distance(p0, p1);
            float delta = _pinchPrev > 0f ? (dist - _pinchPrev) : 0f;
            _pinchPrev = dist;

            var avg = (p0 + p1) * 0.5f;
            var st = new MouseState
            {
                position = avg,
                delta = avg - _lastPos,
                scroll = new Vector2(0f, delta * 0.02f),
                buttons = 4, // 中键
            };
            InputSystem.QueueStateEvent(mouse, st);
            _lastPos = avg;
            ReleaseLeft();
            return;
        }

        _pinchPrev = 0f;

        if (active == 1)
        {
            Vector2 pos = Vector2.zero;
            bool began = false, ended = false;
            for (int i = 0; i < touches.Length; i++)
            {
                var t = touches[i];
                if (t.isInProgress)
                {
                    pos = t.position.ReadValue();
                    began = t.press.wasPressedThisFrame;
                    ended = t.press.wasReleasedThisFrame;
                }
            }

            if (began)
            {
                _pressPos = pos;
                _pressTime = Time.unscaledTime;
                _longFired = false;
                _dragging = false;
                _lastPos = pos;
            }

            if (!_longFired && !_dragging && Time.unscaledTime - _pressTime >= LongPressSeconds &&
                Vector2.Distance(pos, _pressPos) < TapMaxMove)
            {
                _longFired = true;
                _rightDown = true;
                var st = new MouseState { position = pos, delta = Vector2.zero, buttons = 2 };
                InputSystem.QueueStateEvent(mouse, st);
            }

            if (!_rightDown && !(_longFired && ended))
            {
                if (!_leftDown || Vector2.Distance(pos, _pressPos) > TapMaxMove) _dragging = true;
                _leftDown = true;
                var st = new MouseState
                {
                    position = pos,
                    delta = pos - _lastPos,
                    buttons = 1,
                };
                InputSystem.QueueStateEvent(mouse, st);
                _lastPos = pos;
            }

            if (ended)
            {
                ReleaseLeft();
                if (_rightDown)
                {
                    _rightDown = false;
                    InputSystem.QueueStateEvent(mouse, new MouseState { position = pos, delta = Vector2.zero, buttons = 0 });
                }
                _dragging = false;
                _longFired = false;
            }
        }
        else
        {
            ReleaseLeft();
            if (_rightDown)
            {
                _rightDown = false;
                InputSystem.QueueStateEvent(mouse, new MouseState { position = _lastPos, delta = Vector2.zero, buttons = 0 });
            }
        }
    }

    private void ReleaseLeft()
    {
        if (!_leftDown) return;
        _leftDown = false;
        var mouse = Mouse.current;
        if (mouse != null)
            InputSystem.QueueStateEvent(mouse, new MouseState { position = _lastPos, delta = Vector2.zero, buttons = _rightDown ? (ushort)2 : (ushort)0 });
    }
}
