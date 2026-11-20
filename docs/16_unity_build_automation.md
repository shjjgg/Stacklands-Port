# 用 Unity 官方 Build Automation（原 Cloud Build）出 APK

## 能用的原因
Unity 自己的构建机由 Unity 授权, 许可证挂在账号上, 不需要我们上传 `.ulf`,
这是唯一能绕开"Personal 版无法在容器里激活"的云路径。
GitHub Actions + game-ci 那条线 (`724862c` 起) 保持原样, 只等 `UNITY_LICENSE`/`UNITY_SERIAL`。

## 仓库侧已就绪
- `ProjectSettings/ProjectVersion.txt` = 2022.3.4f1 (与云构建可选版本一致)
- `Assets/Editor/PortBuild.cs` 暴露 `PortBuild.StrictBuild` 作为自定义构建入口
- `Packages/manifest.json` 已含 ugui/TMP/InputSystem/PostProcessing/2d.sprite
- IL2CPP + arm64-v8a 由 `PortBuild` 里的 `EditorUserBuildSettings` / `PlayerSettings` 设置

## 控制台步骤(需账号登录, 我无法代点)
1. cloud.unity.com → DevOps → Build Automation → 新建 project, 关联 GitHub 仓库
   `shjjgg/Stacklands-Unity`, 分支 `main`
2. Target: Android; Build Target 选 **Custom**? 若无该项, 用 "Advanced options →
   Build method" 填 `PortBuild.StrictBuild`
3. 版本/签名: Signing 上传 keystore(.keystore + alias + 两个口令), 勾 IL2CPP
4. 环境变量: `STRICT=1`、`BUNDLE_VERSION_CODE`、`BUNDLE_IDENTIFIER`、`SCREEN_ORIENTATION`
5. 触发一次构建, 从 Artifacts 下 APK; 再回传给我, 我跑 `verify_apk.py` 审计

## 已知限制(不要期待它替代严格门)
- 云构建的日志/产物不落到本地, `strict_log_audit.py` / `verify_apk.py` 只能对下载回来的
  APK 与日志跑, 属于**事后审计**, 不是构建内拦截
- Personal 账号的 Build Automation 并发与时长有额度上限, 首次 IL2CPP 构建可能排队
- 云机构建机同样是"另一台机器", 如果 Personal 许可证按机器绑定, 云构建会自己处理,
  我们不需要也无法介入
