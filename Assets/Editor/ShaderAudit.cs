using System.IO;
using System.Text;
using UnityEditor;
using UnityEngine;

public static class ShaderAudit
{
    // 把每个 .shader 的编译消息(Severity/Platform/Line/Message)逐条写到 /tmp/shader_audit.txt
    public static void Dump()
    {
        var sb = new StringBuilder();
        foreach (var guid in AssetDatabase.FindAssets("t:Shader"))
        {
            var path = AssetDatabase.GUIDToAssetPath(guid);
            var shader = AssetDatabase.LoadAssetAtPath<Shader>(path);
            if (shader == null)
            {
                sb.AppendLine($"[LOAD-FAIL] {path}");
                continue;
            }
            int n = ShaderUtil.GetShaderMessageCount(shader);
            sb.AppendLine($"[{path}] messages={n}");
            if (n > 0)
            {
                foreach (var m in ShaderUtil.GetShaderMessages(shader))
                {
                    sb.AppendLine($"    sev={m.severity} plat={m.platform} line={m.line} msg={m.message}");
                }
            }
        }
        File.WriteAllText("/tmp/shader_audit.txt", sb.ToString());
        Debug.Log("[ShaderAudit] wrote /tmp/shader_audit.txt");
    }
}
