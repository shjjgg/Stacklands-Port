// PortCardIconUv.cs — 卡面插画/图标 UV 矩形注入 (v0.74)
//
// CardShaderTest 的 t1(_IconTex) 在运行时来自 IconRenderer.sprite.texture。PC 上每张卡的插画是独立贴图,
// 按 0..1 采样刚好；安卓包里同一张精灵被打进图集, 拿到的 texture 是整张图集, 于是整卡被图集内容糊住
// (石头卡整面变蓝灰、浆果卡整面变橙, 本质都是插画颜色盖住了纸色)。
// 这里按 sprite 的真实矩形算 UV 缩放/偏移, 注到 CardRenderer 的 2 号材质槽属性块里。
// 独立贴图时 rect==整图, uv 恒为 (1,1,0,0), 与原版行为一致, 不改变任何算式。
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace StacklandsPort
{
    public class PortCardIconUv : MonoBehaviour
    {
        const string Tag = "[PortCardIconUv] ";
        static PortCardIconUv _inst;
        readonly Dictionary<int, Vector4> _logged = new Dictionary<int, Vector4>();
        readonly MaterialPropertyBlock _pb = new MaterialPropertyBlock();
        int _applied;

        [RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.AfterSceneLoad)]
        static void Boot()
        {
            if (_inst != null) return;
            var go = new GameObject("PortCardIconUv");
            UnityEngine.Object.DontDestroyOnLoad(go);
            _inst = go.AddComponent<PortCardIconUv>();
        }

        IEnumerator Start()
        {
            while (true)
            {
                yield return new WaitForSecondsRealtime(0.4f);
                try { Apply(); } catch (System.Exception e) { PortLog.Write(Tag + "异常 " + e.GetType().Name); }
            }
        }

        void Apply()
        {
            var cards = Resources.FindObjectsOfTypeAll<GameCard>();
            int done = 0;
            for (int i = 0; i < cards.Length; i++)
            {
                var c = cards[i];
                if (c == null || c.gameObject == null || !c.gameObject.activeInHierarchy) continue;
                var sr = c.IconRenderer;
                if (sr == null || sr.sprite == null) continue;
                var tex = sr.sprite.texture;
                if (tex == null) continue;
                var mr = c.CardRenderer;
                if (mr == null) continue;

                // v0.84: 与卡包同一条口径 —— PC 原版按 0..1 采精灵自己的贴图, 不做 sprite 裁切;
                // 只有真的被打进图集(packed=true)才需要矩形换算, 否则图标会被放大/偏移。
                Vector4 uv;
                Rect r = sr.sprite.packed ? sr.sprite.textureRect : sr.sprite.rect;   // 仅用于日志
                if (sr.sprite.packed)
                {
                    if (r.width <= 0f || r.height <= 0f) continue;
                    uv = new Vector4(r.width / tex.width, r.height / tex.height,
                                     r.x / tex.width, r.y / tex.height);
                }
                else
                {
                    uv = new Vector4(1f, 1f, 0f, 0f);
                }

                mr.GetPropertyBlock(_pb, 2);
                _pb.SetVector("_IconUV", uv);
                mr.SetPropertyBlock(_pb, 2);
                done++;

                int key = tex.GetInstanceID();
                if (!_logged.ContainsKey(key))
                {
                    _logged[key] = uv;
                    PortLog.Write(Tag + "sprite=" + sr.sprite.name + " tex=" + tex.width + "x" + tex.height
                        + " packed=" + sr.sprite.packed + " rect=" + Mathf.RoundToInt(r.x) + ","
                        + Mathf.RoundToInt(r.y) + " " + Mathf.RoundToInt(r.width) + "x" + Mathf.RoundToInt(r.height)
                        + " uv=" + uv.x.ToString("F4") + "," + uv.y.ToString("F4") + ","
                        + uv.z.ToString("F4") + "," + uv.w.ToString("F4"));
                }
            }
            _applied = done;
        }
    }
}
