using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace StacklandsPort
{
    /// <summary>
    /// 卡包正面 (v0.71):
    /// 原版 PC 里 BoostepackData.Icon 是**独立小贴图**, 08_PS 拿 t1 直接按 0..1 采样没问题。
    /// 安卓包里同一张 Sprite 被打进了图集, `PackData.Icon.texture` 拿到的是**整张图集**,
    /// 于是 `_257 = texture(t1, uv)` 采到全图集 → `_318 += _257.x*0.5` 把整张卡面糊成 0.5 灰,
    /// 角落只露出图集里一小块小图(真机截图里那个小人剪影就是这么来的)。
    ///
    /// 这里按 Sprite 的 textureRect 算出 UV 缩放/偏移, 通过 `_IconUV` 传给 shader,
    /// 让采样只落在这张精灵自己的矩形里。只改采样范围, 不动任何算式与颜色。
    /// </summary>
    public static class PortBoosterIconUv
    {
        const string Tag = "[PortBoosterIconUv] ";

        [RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.AfterSceneLoad)]
        static void Boot()
        {
            var go = new GameObject("[PortBoosterIconUv]");
            Object.DontDestroyOnLoad(go);
            go.AddComponent<Runner>();
        }

        internal sealed class Runner : MonoBehaviour
        {
            readonly Dictionary<int, Vector4> _logged = new Dictionary<int, Vector4>();
            readonly MaterialPropertyBlock _pb = new MaterialPropertyBlock();
            int _applied;
            float _lastLog;

            IEnumerator Start()
            {
                while (true)
                {
                    yield return new WaitForSecondsRealtime(0.4f);
                    try { Apply(); } catch (System.Exception e) { PortLog.Write(Tag + "失败 " + e.GetType().Name + " " + e.Message); }
                }
            }

            void Apply()
            {
                Boosterpack[] packs;
                try { packs = Resources.FindObjectsOfTypeAll<Boosterpack>(); }
                catch { return; }
                if (packs == null || packs.Length == 0) return;

                int done = 0;
                foreach (var bp in packs)
                {
                    if (bp == null || bp.PackRenderer == null || bp.PackData == null) continue;
                    var sp = bp.PackData.Icon;
                    if (sp == null) continue;
                    var tex = sp.texture;
                    if (tex == null) continue;

                    Rect r = sp.packed ? sp.textureRect : sp.rect;
                    if (r.width <= 0f || r.height <= 0f) continue;
                    var uv = new Vector4(r.width / tex.width, r.height / tex.height,
                                         r.x / tex.width, r.y / tex.height);

                    var m = bp.PackRenderer;
                    int n = m.sharedMaterials != null ? m.sharedMaterials.Length : 1;
                    for (int i = 0; i < n; i++)
                    {
                        m.GetPropertyBlock(_pb, i);
                        _pb.SetTexture("_IconTex", tex);
                        _pb.SetVector("_IconUV", uv);
                        m.SetPropertyBlock(_pb, i);
                    }
                    done++;

                    int key = tex.GetInstanceID();
                    if (!_logged.ContainsKey(key))
                    {
                        _logged[key] = uv;
                        PortLog.Write(Tag + "pack=" + bp.PackData.BoosterId + " sprite=" + sp.name
                            + " tex=" + tex.width + "x" + tex.height + " packed=" + sp.packed
                            + (sp.packingRotation != SpritePackingRotation.None ? " 旋=" + sp.packingRotation : "")
                            + " rect=" + Mathf.RoundToInt(r.x) + "," + Mathf.RoundToInt(r.y) + " "
                            + Mathf.RoundToInt(r.width) + "x" + Mathf.RoundToInt(r.height)
                            + " uv=" + uv.x.ToString("F3") + "," + uv.y.ToString("F3") + ","
                            + uv.z.ToString("F3") + "," + uv.w.ToString("F3") + " mats=" + n);
                    }
                }
                _applied = done;
                if (Time.unscaledTime - _lastLog > 10f)
                {
                    _lastLog = Time.unscaledTime;
                    PortLog.Write(Tag + "在场上卡包=" + done + " 已记贴图=" + _logged.Count);
                }
            }
        }
    }
}
