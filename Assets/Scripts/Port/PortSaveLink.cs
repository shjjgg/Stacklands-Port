using System;
using System.Collections;
using System.IO;
using UnityEngine;

namespace StacklandsPort
{
    /// <summary>
    /// 存档可见性:
    ///   Unity 的 persistentDataPath 固定是 .../Android/data/&lt;包名&gt;/files, 改不了;
    ///   而 /storage/emulated/0 是 FUSE 模拟存储, 不支持符号链接(实测 ln -s 直接失败),
    ///   所以改成双目录镜像: 游戏写 files/*.json, 我们把它同步到 .../saves,
    ///   启动时若 saves 里的副本更新(用户手工放进去的存档), 再同步回 files。
    /// </summary>
    public static class PortSaveLink
    {
        const string MirrorDirName = "saves";

        [RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.BeforeSceneLoad)]
        static void Boot()
        {
            try
            {
                if (Application.platform != RuntimePlatform.Android) return;
                var pdp = new DirectoryInfo(Application.persistentDataPath);
                var pkgRoot = pdp.Parent;
                if (pkgRoot == null) return;
                var runnerGo = new GameObject("[PortSaveMirror]");
                UnityEngine.Object.DontDestroyOnLoad(runnerGo);
                var r = runnerGo.AddComponent<Runner>();
                r.Setup(pdp.FullName, Path.Combine(pkgRoot.FullName, MirrorDirName));
            }
            catch (Exception e)
            {
                PortLog.Write("PortSaveMirror 初始化失败: " + e);
            }
        }

        internal sealed class Runner : MonoBehaviour
        {
            string _files;
            string _mirror;
            float _t;

            public void Setup(string files, string mirror)
            {
                _files = files;
                _mirror = mirror;
                try
                {
                    if (!Directory.Exists(_mirror)) Directory.CreateDirectory(_mirror);
                    int back = Sync(_mirror, _files, true);
                    int fwd = Sync(_files, _mirror, false);
                    PortLog.Marker($"save mirror ready: files={_files} saves={_mirror} 回灌={back} 外送={fwd}");
                }
                catch (Exception e)
                {
                    PortLog.Write("save mirror 首次同步失败: " + e);
                }
            }

            void Update()
            {
                _t += Time.unscaledDeltaTime;
                if (_t < 5f) return;
                _t = 0f;
                try
                {
                    int fwd = Sync(_files, _mirror, false);
                    if (fwd > 0) PortLog.Marker("save mirror 外送 " + fwd + " 个文件");
                }
                catch { }
            }

            /// <summary>把 src 里比 dst 新的存档文件拷过去, 返回复制数量。</summary>
            static int Sync(string src, string dst, bool allowBack)
            {
                int n = 0;
                if (!Directory.Exists(src)) return 0;
                foreach (var f in Directory.GetFiles(src))
                {
                    var name = Path.GetFileName(f);
                    if (name.EndsWith(".log", StringComparison.OrdinalIgnoreCase)) continue;
                    if (name.StartsWith("stacklands_port", StringComparison.OrdinalIgnoreCase)) continue;
                    var ext = Path.GetExtension(name).ToLowerInvariant();
                    if (ext != ".json" && ext != ".sav" && ext != ".dat") continue;

                    var target = Path.Combine(dst, name);
                    var si = new FileInfo(f);
                    var ti = new FileInfo(target);
                    bool need = !ti.Exists || si.LastWriteTimeUtc > ti.LastWriteTimeUtc.AddSeconds(1);
                    if (!need) continue;
                    // 只有 saves 里更新的文件才回灌, 避免把旧存档盖回去
                    if (allowBack && ti.Exists && si.LastWriteTimeUtc <= ti.LastWriteTimeUtc) continue;
                    File.Copy(f, target, true);
                    n++;
                }
                return n;
            }
        }
    }
}
