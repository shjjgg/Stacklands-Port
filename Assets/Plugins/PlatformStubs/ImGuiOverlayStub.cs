// ImGuiOverlayStub.cs
// UImGui / ImGui.NET 调试覆盖层桩: Android 不接入原生 cimgui/freetype。
// 处置原则:
//  - 保留托管 ImGui.NET.dll / UImGui.dll 作为编译引用(DllImport 仅在被调用时才解析);
//  - 覆盖层初始化入口在 Bootstrap 中禁用, 运行时不进入任何 ImGui 渲染/事件路径;
//  - GameScripts 内调试窗口(ModsScreen 等)在无覆盖层时不被打开。
// 后续若确需移动端调试 UI, 再单独评估 Dear ImGui Android 后端, 不在首版范围。
namespace PortPlatform
{
    public static class ImGuiOverlayStub
    {
        /// <summary>覆盖层是否启用。Android 恒为 false。</summary>
        public static bool Enabled => false;

        /// <summary>替代 UImGui 初始化入口; 不加载原生 cimgui。</summary>
        public static void Initialize() { /* disabled */ }

        /// <summary>替代每帧 ImGui 帧调度; 不渲染。</summary>
        public static void OnFrame() { /* disabled */ }

        public static void Shutdown() { /* disabled */ }
    }
}
