// PortStackProbe.cs — 叠卡"最下层卡牌变透明"取证 (v0.73)
//
// 现象: 卡牌反复叠放后, 最下面那张看起来半透明。端口里卡牌网格有 3 个材质槽:
//   0 CardEdge(Standard)  1 CardBack(Custom/CardBackShader)  2 CardFront(Custom/CardShaderTest, 带图标属性块)
// 只凭截图分不清是"面没画"(队列/深度)、"被别的半透明面盖住"、还是"颜色/贴图丢了",
// 所以这里在检测到卡叠卡时, 把最底层卡的材质槽逐项打印一次(着色器/队列/混合/颜色/贴图),
// 下一份日志就能直接定位, 不用靠猜。
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace StacklandsPort
{
    public class PortStackProbe : MonoBehaviour
    {
        const string Tag = "[PortStackProbe] ";
        static PortStackProbe _inst;
        readonly Dictionary<string, int> _seen = new Dictionary<string, int>();

        [RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.AfterSceneLoad)]
        static void Boot()
        {
            if (_inst != null) return;
            var go = new GameObject("PortStackProbe");
            UnityEngine.Object.DontDestroyOnLoad(go);
            _inst = go.AddComponent<PortStackProbe>();
        }

        IEnumerator Start()
        {
            while (true)
            {
                yield return new WaitForSecondsRealtime(1.5f);
                try { Scan(); } catch (System.Exception e) { PortLog.Write(Tag + "异常 " + e.GetType().Name); }
            }
        }

        void Scan()
        {
            var cards = FindObjectsOfType<GameCard>(true);
            for (int i = 0; i < cards.Length; i++)
            {
                var c = cards[i];
                if (c == null || c.gameObject == null || !c.gameObject.activeInHierarchy) continue;
                var parentCard = c.transform.parent != null ? c.transform.parent.GetComponent<GameCard>() : null;
                if (parentCard == null) continue;                 // 只看"叠在别人上面"的卡

                int depth = 0; Transform t = c.transform;
                while (t != null && t.GetComponent<GameCard>() != null) { depth++; t = t.parent; }
                // 顶层卡 = 一直往上直到父级不是卡
                Transform rt = c.transform;
                while (rt.parent != null && rt.parent.GetComponent<GameCard>() != null) rt = rt.parent;
                var rootCard = rt.GetComponent<GameCard>();

                string key = (rootCard != null ? rootCard.GetInstanceID().ToString() : "?") + "@" + depth;
                if (_seen.ContainsKey(key)) continue;
                _seen[key] = 1;

                var mr = c.GetComponentInChildren<MeshRenderer>();
                if (mr == null) { PortLog.Write(Tag + "无 MeshRenderer " + c.name); continue; }
                var mats = mr.sharedMaterials;
                var sb = new System.Text.StringBuilder();
                sb.Append(Tag).Append("叠 depth=").Append(depth)
                  .Append(" 本卡=").Append(c.CardData != null ? c.CardData.Name : c.name)
                  .Append(" 底层=").Append(rootCard != null && rootCard.CardData != null ? rootCard.CardData.Name : "-")
                  .Append(" pos=").Append(c.transform.position.ToString("F3"))
                  .Append(" 槽数=").Append(mats != null ? mats.Length : 0);
                if (mats != null)
                {
                    for (int m = 0; m < mats.Length; m++)
                    {
                        var mat = mats[m];
                        if (mat == null) { sb.Append(" | ").Append(m).Append("=null"); continue; }
                        sb.Append(" | ").Append(m).Append("=").Append(mat.shader != null ? mat.shader.name : "?")
                          .Append(" q=").Append(mat.renderQueue);
                        if (mat.HasProperty("_Color")) { var cc = mat.GetColor("_Color"); sb.Append(" col=").Append(cc.r.ToString("F2")).Append(",").Append(cc.g.ToString("F2")).Append(",").Append(cc.b.ToString("F2")).Append(",").Append(cc.a.ToString("F2")); }
                        if (mat.HasProperty("_MainTex")) { var tx = mat.GetTexture("_MainTex"); sb.Append(" tex=").Append(tx != null ? (tx.width + "x" + tx.height) : "null"); }
                    }
                }
                if (c.IconRenderer != null)
                {
                    sb.Append(" iconSpr=").Append(c.IconRenderer.sprite != null ? c.IconRenderer.sprite.name : "null")
                      .Append(" iconCol=").Append(c.IconRenderer.color.ToString("F2"))
                      .Append(" iconEnabled=").Append(c.IconRenderer.enabled);
                }
                PortLog.Write(sb.ToString());
            }
        }
    }
}
