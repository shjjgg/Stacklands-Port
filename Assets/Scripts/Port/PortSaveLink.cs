using UnityEngine;

namespace StacklandsPort
{
    /// <summary>
    /// 存档目录: 按用户最新要求, 不再在包目录根下建 saves 镜像(Android 的 /storage/emulated/0
    /// 是 FUSE 模拟存储, 不支持符号链接, 镜像又会让两份文件不同步)。
    /// 存档仍然在标准位置 .../Android/data/com.sokpop.stacklands.port/files。
    /// </summary>
    public static class PortSaveLink
    {
        [RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.BeforeSceneLoad)]
        static void Boot()
        {
            PortLog.Marker("saves 镜像已关闭, 存档位置=" + Application.persistentDataPath);
        }
    }
}
