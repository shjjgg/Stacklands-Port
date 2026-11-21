using UnityEngine;

namespace StacklandsPort
{
    /// <summary>管理器 Awake 面包屑(最前执行)。挂在每个管理器 prefab 根节点上。</summary>
    [DefaultExecutionOrder(-20000)]
    public class PortProbeEarly : MonoBehaviour
    {
        public string tagName = "";

        void Awake()
        {
            PortLog.Marker(">> enter " + tagName + " frame=" + Time.frameCount);
        }
    }
}
