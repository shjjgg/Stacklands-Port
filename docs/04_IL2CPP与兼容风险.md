# 04 · IL2CPP 裁剪与兼容风险

> 源端是 PC Mono（含 JIT/Emit），目标是 Android IL2CPP（AOT、无运行时代码生成）。本章把风险按“静态可提前检出 / 仅运行时暴露”分类，并给出保留与规避策略。

## 1. 已识别阻断项（静态可检出，P5 前置处理）

> 元数据级预扫描台账：`blocked_metadata/blocked_metadata.md/.json`（工具 `tools/scan_blocked_metadata.py`，dnfile 读程序集/类型/成员/PInvoke 表 + 字符串扫描；未解码 IL 方法体，调用链触达需反编译复核）。

| 风险 | 来源程序集（元数据实测） | IL2CPP 结论 | 处置 |
|---|---|---|---|
| HarmonyLib 运行时补丁 | **`GameScripts.dll` 直接引用 `0Harmony` / `HarmonyLib.Harmony`**；机器侧 `0Harmony.dll` 内部依赖 MonoMod/Cecil/Emit | IL2CPP 无 JIT，无法 patch 已编译原生代码 | 反编译定位 `new Harmony(...)` 调用点与补丁目标；运行时补丁不可用，需把补丁改动静态化进源码或摘除；摘掉初始化入口 |
| MonoMod RuntimeDetour | MonoMod.RuntimeDetour / Utils（0Harmony 的底层） | 原生 detour 在 IL2CPP 下不可用 | 随 Harmony 栈整体禁用，不进包 |
| Cecil IL 读写 | Mono.Cecil.dll（0Harmony/MonoMod 内部） | 供补丁/动态编译，运行时不需要 | 不进 Player |
| Reflection.Emit | System.Reflection.Emit*.dll（0Harmony/MonoMod/Utils 内部） | AOT 不支持动态方法生成 | 随禁用栈移除；GameScripts 本体未检出 Emit 类型/成员引用，反编译后再复核 |
| 动态编译 (Roslyn/CodeAnalysis) | 元数据核对：GameScripts 内仅有编译器嵌入的 `Microsoft.CodeAnalysis.EmbeddedAttribute`（Roslyn 编译期特性，非运行时引用），**无** CodeAnalysis 程序集/服务类型/成员引用 | 未检出动态编译调用；该嵌入特性随编译产物保留即可 | 反编译时复核确无 `CSharpCompilation`/脚本动态编译路径；当前不列为阻断项 |

### 1.1 处置原则

- **注意**：GameScripts 本体直接引用了 `HarmonyLib.Harmony`，不能默认 Harmony 只是外部 Mod 工具；必须先反编译确认这些补丁是核心启动链路的必需修复，还是可选/调试行为。
- 被禁用的是 **Mod/补丁/调试子系统**，不是核心玩法；先确认核心启动链路不依赖 Harmony/MonoMod 在 `Awake/Start/RuntimeInitializeOnLoad` 阶段做必需补丁。
- 禁用方式：在平台隔离层提供空实现，并摘掉对应 `RuntimeInitializeOnLoad` 注册；保留源码以备将来研究，不删除原版工程内的原始记录。
- 若发现核心逻辑强依赖上述子系统（静态分析无法 100% 排除），列入运行时风险，设备上验证启动堆栈。

## 2. 裁剪（Stripping）风险

### 2.1 高风险反射/序列化路径

| 模块 | 风险 | 规避 |
|---|---|---|
| Newtonsoft.Json | 泛型 `List<T>`/Dictionary/嵌套模型被裁剪导致序列化空对象/TypeMissing | `link.xml` 保留 GameScripts 模型程序集；运行时用 AOT 预热常见泛型实例 |
| Sirenix.Serialization | 反射序列化字段/属性，Odinserializer 元数据裁剪 | 保留 Sirenix 程序集与被序列化类型；关闭对这些程序集的过度裁剪 |
| SokSheet / 配置表 | 反射按名映射 Card/Booster 配置 | 保留配置 DTO 类型与无参构造、公共字段 |
| 泛型集合 / Tween | DOTween 泛型插件、集合扩展 | 保留对应泛型实例 |

### 2.2 裁剪级别建议

- **首次出包（保行为一致）**：`Strip Engine Code` 关闭或 `Low`；Managed Stripping Level = **Minimal/Low**，先跑通行为，再按需收紧。
- 验证通过后再逐步提高裁剪级别，每提一级重跑冒烟清单，记录被裁掉的类型。
- 生成 `il2cpp` 输出与 `metadata` 快照，用于对比 TypeMissing/LinkError。

### 2.3 link.xml 模板（放入 `Assets/Plugins/link.xml`，按实际命名空间补全）

```xml
<linker>
  <!-- 游戏主逻辑: 保留类型、方法、字段, 防止配置/序列化反射被裁 -->
  <assembly fullname="GameScripts" preserve="all" />
  <assembly fullname="Assembly-CSharp" preserve="all" />
  <assembly fullname="Assembly-CSharp-firstpass" preserve="all" />

  <!-- 序列化 / 配置 / 补间 -->
  <assembly fullname="Sirenix.Serialization" preserve="all" />
  <assembly fullname="Sirenix.Utilities" preserve="all" />
  <assembly fullname="Newtonsoft.Json" preserve="all" />
  <assembly fullname="SokLoc" preserve="all" />
  <assembly fullname="SokSheet" preserve="all" />
  <assembly fullname="DOTween" preserve="all" />
  <assembly fullname="DOTween.Modules" preserve="all" />
  <assembly fullname="ShapesRuntime" preserve="all" />

  <!-- 平台桩接程序集按需保留公开签名 -->
  <assembly fullname="com.rlabrecque.steamworks.net" preserve="all" />
</linker>
```

## 3. 反射与动态调用清单（需在反编译源码中逐点确认）

静态扫描需在 GameScripts 内定位以下 API，标注用途与是否可 AOT：

- `Type.GetType` / `Assembly.GetTypes` / 按名字查找类型 → 配置表/Mod 注册表。
- `MakeGenericType` / `MakeGenericMethod` → 泛型实例化，IL2CPP 需存在对应 AOT 实例。
- `Reflection.Emit` / `DynamicMethod` / `DynamicAssembly` → 阻断，桩接。
- `Delegate.CreateDelegate` / 事件反射绑定 → 保留目标方法。
- 序列化回调、`ISerializationCallbackReceiver`、属性/字段反射读写。

> 已完成第一层元数据扫描（`tools/scan_blocked_metadata.py`，dnfile 读引用表/PInvoke/字符串）；反编译 C# 落地后，再由 `tools/scan_il2cpp_risks.py` 做第二层源码/IL 正则扫描，输出上述 API 命中表。

## 4. 静态可提前检出 vs 仅运行时暴露

| 分类 | 问题 | 检出阶段 |
|---|---|---|
| 静态可检出 | 缺失程序集、空脚本、DllImport 绑定到不存在原生库、Emit/Roslyn 引用、缺失泛型实例、link.xml 未覆盖类型、shader 变体缺失 | 编译期 / CI 静态扫描 |
| 仅运行时暴露 | 序列化空对象、反射拿不到类型、AOT 泛型缺失抛 `ExecutionEngineException`、动态绑定丢失、音频/贴图解码失败、shader 个别变体在特定 GPU 报错、存档读写路径异常 | 设备冒烟 / 日志堆栈 |

## 5. 运行时崩溃定位约定

- 采集 logcat / Unity Player.log，按堆栈顶部定位程序集→类→方法；区分：
  - **链接/元数据错误**：`TypeLoadException`、`MissingMethodException`、`MissingFieldException`、`LinkError`、`ExecutionEngineException` → 回 04 裁剪/保留策略。
  - **空引用/逻辑错误**：`NullReferenceException` 等 → 回 02 引用链与脚本回填。
  - **渲染错误**：粉色材质/黑块/GL 错误 → 回 03 Shader 台账。
- 每修一类，补充对应静态扫描规则，使同类问题在下一轮 CI 前置检出。

## 6. 元数据与调试

- IL2CPP 出包保留 `il2cpp` 生成的 `global-metadata.dat` 符号映射，崩溃堆栈用 `il2cpp` 符号表还原方法名。
- 开发包开启 `Development Build` + `Script Debugging`，记录完整堆栈；Release 包关闭但保留符号归档到 CI 构件。
