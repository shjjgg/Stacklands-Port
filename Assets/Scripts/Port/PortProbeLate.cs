using UnityEngine;

namespace StacklandsPort
{
    /// <summary>管理器 Awake 面包屑(最后执行)。enter 有 exit 无 = 崩在该管理器 Awake。</summary>
    [DefaultExecutionOrder(20000)]
    public class PortProbeLate : MonoBehaviour
    {
        public string tagName = "";

        void Awake()
        {
            PortLog.Marker("<< exit " + tagName);
        }
    }
}
