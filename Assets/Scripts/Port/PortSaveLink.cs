using System;
using System.Diagnostics;
using System.IO;
using UnityEngine;

namespace StacklandsPort
{
    /// <summary>
    /// 把存档暴露到用户要求的位置:
    ///   /storage/emulated/0/Android/data/com.sokpop.stacklands.port/
    /// Unity 的 persistentDataPath 固定是 .../files, 无法改; 所以在这里建一个
    /// .../saves -> files 的符号链接, 让存档在包目录根下也能直接看到/备份。
    /// 若符号链接创建失败(个别机型 SELinux 限制), 退化为镜像拷贝到 .../saves。
    /// </summary>
    public static class PortSaveLink
    {
        const string LinkName = "saves";

        [RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.BeforeSceneLoad)]
        static void Boot()
        {
            try
            {
                if (Application.platform != RuntimePlatform.Android) return;
                string pdp = Application.persistentDataPath;        // .../files
                var files = Directory.GetParent(pdp);
                if (files == null) return;
                string pkgRoot = files.FullName;                    // .../com.sokpop.stacklands.port
                string link = Path.Combine(pkgRoot, LinkName);

                if (Directory.Exists(link) || File.Exists(link))
                {
                    PortLog.Marker("saves 已存在: " + link);
                    return;
                }

                if (TrySymlink(pkgRoot, link))
                {
                    PortLog.Marker("saves 符号链接就绪: " + link + " -> files");
                    return;
                }

                Directory.CreateDirectory(link);
                PortLog.Marker("saves 符号链接失败, 建目录: " + link + " (需要镜像时手动拷贝)");
            }
            catch (Exception e)
            {
                PortLog.Write("PortSaveLink 失败: " + e);
            }
        }

        static bool TrySymlink(string workDir, string link)
        {
            try
            {
                var psi = new ProcessStartInfo("/system/bin/ln");
                psi.Arguments = "-s files " + LinkName;
                psi.WorkingDirectory = workDir;
                psi.UseShellExecute = false;
                psi.CreateNoWindow = true;
                var p = Process.Start(psi);
                if (p == null) return false;
                p.WaitForExit(3000);
                if (p.ExitCode != 0) return false;
                return Directory.Exists(link) || File.Exists(link);
            }
            catch (Exception e)
            {
                PortLog.Write("ln -s 失败: " + e.Message);
                return false;
            }
        }
    }
}
