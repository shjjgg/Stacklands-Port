# IL2CPP 阻断子系统 / 原生互操作 元数据预扫描台账

- 扫描时间: 2026-11-20T20:00:54
- 托管 DLL 数: 129
- 局限: 仅元数据 + 字符串观测, 未解码 IL 方法体; 调用链是否触达需反编译后复核。

## 1. 阻断子系统命中（游戏/第三方程序集直接引用）

> 被禁子系统自身程序集（0Harmony / MonoMod.* / Mono.Cecil / Reflection.Emit）的内部自引用不计入本表；它们作为整体在 IL2CPP 下禁用，明细见 §3。

### Harmony 补丁

- `GameScripts.dll` 引用程序集: 0Harmony
  - 类型: HarmonyLib::Harmony

## 2. 原生互操作 (PInvoke) 依赖

### 2.1 游戏 / 第三方侧原生依赖（Android 需桩接或替换）

| 原生库 | 调用方托管程序集 | 入口数 | Android 处置 |
|---|---|---:|---|
| cimgui | ImGui.NET.dll, UImGui.dll | 638 | Windows 原生, 不搬运; 托管包装保留签名并在入口守卫走桩接 |
| sdkencryptedappticket64 | com.rlabrecque.steamworks.net.dll | 11 | Windows 原生, 不搬运; 托管包装保留签名并在入口守卫走桩接 |
| steam_api64 | com.rlabrecque.steamworks.net.dll | 944 | Windows 原生, 不搬运; 托管包装保留签名并在入口守卫走桩接 |

### 2.2 Mono 运行时 / 系统 BCL 原生调用（不随 IL2CPP 工程搬运）

> 来自 mscorlib / System.* / System.Drawing / System.Data / 被禁子系统内部，属 Mono 运行时与禁用栈自身；IL2CPP 使用对应 .NET 运行时与引擎模块，不复制这些 PInvoke。

| 原生库 | 调用方 | 入口数 |
|---|---|---:|
| /System/Library/Frameworks/Carbon.framework/Versions/Current/Carbon | System.Drawing.dll | 28 |
| /System/Library/Frameworks/CoreFoundation.framework/CoreFoundation | System.dll | 38 |
| /System/Library/Frameworks/CoreServices.framework/Frameworks/CFNetwork.framework/CFNetwork | System.dll | 4 |
| /System/Library/Frameworks/Security.framework/Security | System.dll | 5 |
| /System/Library/Frameworks/SystemConfiguration.framework/SystemConfiguration | System.dll | 5 |
| /usr/lib/libSystem.dylib | System.dll | 6 |
| BCrypt.dll | mscorlib.dll | 1 |
| Kernel32 | System.dll | 1 |
| Kernel32.dll | mscorlib.dll | 1 |
| MonoPosixHelper | MonoMod.RuntimeDetour.dll, System.dll | 24 |
| NVUnityPlugin | UnityEngine.NVIDIAModule.dll | 12 |
| Ws2_32.dll | System.dll | 1 |
| __Internal | System.IO.Compression.dll, mscorlib.dll | 13 |
| advapi32 | System.ServiceModel.Internals.dll | 1 |
| advapi32.dll | System.Core.dll, System.Security.dll, System.ServiceModel.Internals.dll, System.dll, mscorlib.dll | 53 |
| api-ms-win-core-heap-l1-1-0.dll | mscorlib.dll | 3 |
| api-ms-win-core-threadpool-l1-2-0.dll | mscorlib.dll | 4 |
| api-ms-win-core-timezone-l1-1-0.dll | mscorlib.dll | 4 |
| comdlg32.dll | System.Drawing.dll | 2 |
| crypt32.dll | System.Security.dll, System.dll | 7 |
| dl | MonoMod.Utils.dll | 4 |
| gdi32 | System.Drawing.dll | 27 |
| gdi32.dll | System.Drawing.dll | 12 |
| gdiplus | System.Drawing.dll | 556 |
| gdiplus.dll | System.Drawing.dll | 2 |
| iphlpapi.dll | System.dll | 15 |
| kernel32 | MonoMod.Utils.dll, System.Drawing.dll, System.dll | 29 |
| kernel32.dll | MonoMod.RuntimeDetour.dll, System.Core.dll, System.Data.dll, System.Security.dll, System.ServiceModel.Internals.dll, System.Xml.dll, System.dll, mscorlib.dll | 97 |
| libX11 | System.Drawing.dll | 12 |
| libasound | System.dll | 27 |
| libc | MonoMod.RuntimeDetour.dll, System.Drawing.dll, System.dll, mscorlib.dll | 15 |
| libcups | System.Drawing.dll | 11 |
| libdl.so.2 | MonoMod.Utils.dll | 4 |
| libfam.so.0 | System.dll | 5 |
| libgamin-1.so.0 | System.dll | 5 |
| libmono-btls-shared | System.dll | 188 |
| libobjc.dylib | System.Drawing.dll | 8 |
| ntdll.dll | mscorlib.dll | 3 |
| odbc32.dll | System.Data.dll | 45 |
| ole32.dll | mscorlib.dll | 1 |
| oleaut32.dll | System.Drawing.dll, mscorlib.dll | 3 |
| shell32.dll | System.Drawing.dll | 1 |
| sni.dll | System.Data.dll | 27 |
| sspicli.dll | System.dll | 19 |
| user32 | System.Drawing.dll | 11 |
| user32.dll | System.Drawing.dll, mscorlib.dll | 9 |
| winmm.dll | System.dll | 1 |
| winspool.drv | System.Drawing.dll | 11 |

## 3. 各程序集明细（仅列有命中/PInvoke 的游戏/第三方 DLL）

### 0Harmony.dll

> 被禁子系统自身程序集，IL2CPP 下整体禁用，以下为其内部自引用明细。

- **Harmony 补丁** 程序集引用: —
  - 成员: ::AddPatch
  - 字符串: (HarmonyLib.Transpilers+<DebugLogger>d__5, +HarmonyLib.Transpilers+<MethodReplacer>d__3, 0Harmony, 0Harmony.dll, 0HarmonyLib.CollectionExtensions+<Pairwise>d__7`1, GHarmonyLib.Internal.Patching.ILManipulator+<NormalizeInstructions>d__23, HarmonyLib, HarmonyLib.Internal.Patching
- **Mono.Cecil 元数据改写** 程序集引用: Mono.Cecil
  - 类型: Mono.Cecil.Cil::ExceptionHandler, Mono.Cecil.Cil::ExceptionHandlerType, Mono.Cecil.Cil::ILProcessor, Mono.Cecil.Cil::Instruction, Mono.Cecil.Cil::MethodBody, Mono.Cecil.Cil::OpCode, Mono.Cecil.Cil::OpCodes, Mono.Cecil.Cil::OperandType, Mono.Cecil.Cil::VariableDefinition, Mono.Cecil.Cil::VariableReference, Mono.Cecil::AssemblyDefinition, Mono.Cecil::AssemblyNameDefinition, Mono.Cecil::ByReferenceType, Mono.Cecil::CallSite, Mono.Cecil::CustomAttribute, Mono.Cecil::CustomAttributeArgument, Mono.Cecil::FieldReference, Mono.Cecil::FunctionPointerType, Mono.Cecil::IGenericParameterProvider, Mono.Cecil::IMetadataScope, Mono.Cecil::IMetadataTokenProvider, Mono.Cecil::IReflectionImporterProvider, Mono.Cecil::MemberReference, Mono.Cecil::MethodAttributes, Mono.Cecil::MethodCallingConvention, Mono.Cecil::MethodDefinition, Mono.Cecil::MethodImplAttributes, Mono.Cecil::MethodReference, Mono.Cecil::MethodReturnType, Mono.Cecil::ModuleDefinition, Mono.Cecil::ModuleKind, Mono.Cecil::ModuleParameters, Mono.Cecil::ModuleReference, Mono.Cecil::OptionalModifierType, Mono.Cecil::ParameterAttributes, Mono.Cecil::ParameterDefinition, Mono.Cecil::ParameterReference, Mono.Cecil::RequiredModifierType, Mono.Cecil::TypeAttributes, Mono.Cecil::TypeDefinition, Mono.Cecil::TypeReference, Mono.Cecil::TypeSystem, MonoMod.Utils.Cil::CecilILGenerator
  - 字符串: CecilEmitter, CecilILGenerator, CecilOpCodes, GetCecilLoadOpCode, GetCecilStoreOpCode, Mono.Cecil, Mono.Cecil.Cil
- **MonoMod 运行时 Detour** 程序集引用: MonoMod.RuntimeDetour, MonoMod.Utils
  - 类型: MonoMod.Cil::ILContext, MonoMod.Cil::ILCursor, MonoMod.Cil::ILLabel, MonoMod.Cil::ILPatternMatchingExt, MonoMod.RuntimeDetour::Detour, MonoMod.RuntimeDetour::DetourHelper, MonoMod.RuntimeDetour::IDetourRuntimePlatform, MonoMod.RuntimeDetour::ILHook, MonoMod.RuntimeDetour::ILHookConfig, MonoMod.RuntimeDetour::NativeDetour, MonoMod.RuntimeDetour::NativeDetourConfig, MonoMod.Utils.Cil::CecilILGenerator, MonoMod.Utils.Cil::ILGeneratorShim, MonoMod.Utils::DynamicMethodDefinition, MonoMod.Utils::Extensions, MonoMod.Utils::ICallSiteGenerator, MonoMod.Utils::MMReflectionImporter, MonoMod.Utils::Platform, MonoMod.Utils::PlatformHelper, MonoMod.Utils::ReflectionHelper, MonoMod.Utils::Relinker
  - 字符串: "MonoMod.Utils.Cil.ILGeneratorProxy, MonoMod.Cil, MonoMod.RuntimeDetour, MonoMod.Utils, MonoMod.Utils.Cil, MonoMod.Utils.ICallSiteGenerator.ToCallSite, iA library for patching, replacing and decorating .NET and Mono methods during runtime powered by MonoMod.
- **Reflection.Emit 动态生成** 程序集引用: System.Reflection.Emit, System.Reflection.Emit.ILGeneration, System.Reflection.Emit.Lightweight
  - 类型: MonoMod.Utils.Cil::CecilILGenerator, MonoMod.Utils.Cil::ILGeneratorShim, MonoMod.Utils::DynamicMethodDefinition, System.Reflection.Emit::AssemblyBuilder, System.Reflection.Emit::AssemblyBuilderAccess, System.Reflection.Emit::DynamicMethod, System.Reflection.Emit::ILGenerator, System.Reflection.Emit::Label, System.Reflection.Emit::LocalBuilder, System.Reflection.Emit::OpCode, System.Reflection.Emit::OpCodes, System.Reflection.Emit::OperandType
  - 字符串: "MonoMod.Utils.Cil.ILGeneratorProxy, <CreateILGenerator>b__27_0, CecilILGenerator, CreateGetDynamicMethod, CreateILGenerator, CreateSetDynamicMethod, DynamicMethodDefinition, GetILGenerator

### GameScripts.dll

- **Harmony 补丁** 程序集引用: 0Harmony
  - 类型: HarmonyLib::Harmony
  - 字符串: 0Harmony, HarmonyLib
- **Roslyn / 动态编译** 仅字符串出现（无程序集/类型/成员元数据引用，反编译阶段确认是否未使用残留）: Microsoft.CodeAnalysis

### Google.Apis.Auth.dll

- **Roslyn / 动态编译** 仅字符串出现（无程序集/类型/成员元数据引用，反编译阶段确认是否未使用残留）: Microsoft.CodeAnalysis

### ImGui.NET.dll

- PInvoke `cimgui`: 636 入口（示例: igAcceptDragDropPayload, igAlignTextToFramePadding, igArrowButton, igBegin, igBeginChild_Str）

### Mono.Cecil.dll

> 被禁子系统自身程序集，IL2CPP 下整体禁用，以下为其内部自引用明细。

- **Mono.Cecil 元数据改写** 仅字符串出现（无程序集/类型/成员元数据引用，反编译阶段确认是否未使用残留）: ,Mono.Cecil.ModuleDefinition+<GetTypes>d__134, 6Mono.Cecil.Cil.MethodDebugInformation+<GetScopes>d__22, C:\src\cecil\obj\Release\netstandard2.0\Mono.Cecil.pdb, Mono.Cecil, Mono.Cecil.Cil, Mono.Cecil.ICustomAttribute.ConstructorArguments, Mono.Cecil.ICustomAttribute.HasConstructorArguments, Mono.Cecil.ICustomAttribute.get_ConstructorArguments

### MonoMod.RuntimeDetour.dll

> 被禁子系统自身程序集，IL2CPP 下整体禁用，以下为其内部自引用明细。

- **Mono.Cecil 元数据改写** 程序集引用: Mono.Cecil
  - 类型: Mono.Cecil.Cil::ExceptionHandler, Mono.Cecil.Cil::ExceptionHandlerType, Mono.Cecil.Cil::ILProcessor, Mono.Cecil.Cil::Instruction, Mono.Cecil.Cil::MethodBody, Mono.Cecil.Cil::OpCode, Mono.Cecil.Cil::OpCodes, Mono.Cecil.Cil::VariableDefinition, Mono.Cecil.Cil::VariableReference, Mono.Cecil::FieldAttributes, Mono.Cecil::FieldDefinition, Mono.Cecil::FieldReference, Mono.Cecil::GenericParameterConstraint, Mono.Cecil::IReflectionImporterProvider, Mono.Cecil::MemberReference, Mono.Cecil::MethodAttributes, Mono.Cecil::MethodDefinition, Mono.Cecil::MethodReference, Mono.Cecil::ModuleDefinition, Mono.Cecil::ModuleKind, Mono.Cecil::ModuleParameters, Mono.Cecil::ParameterDefinition, Mono.Cecil::TypeAttributes, Mono.Cecil::TypeDefinition, Mono.Cecil::TypeReference, Mono.Cecil::TypeSystem, MonoMod.Utils.Cil::CecilILGenerator, MonoMod.Utils::DMDCecilGenerator
  - 字符串: CecilILGenerator, DMDCecilGenerator, Mono.Cecil, Mono.Cecil.Cil, wFlexible and easily extensible runtime detouring library. Wrap, replace and manipulate (Mono.Cecil) methods at runtime.
- **MonoMod 运行时 Detour** 程序集引用: MonoMod.Utils
  - 类型: MonoMod.Cil::IILReferenceBag, MonoMod.Cil::ILContext, MonoMod.Cil::ILCursor, MonoMod.Cil::ILPatternMatchingExt, MonoMod.Cil::RuntimeILReferenceBag, MonoMod.Utils.Cil::CecilILGenerator, MonoMod.Utils.Cil::ILGeneratorShim, MonoMod.Utils::DMDCecilGenerator, MonoMod.Utils::DMDEmitDynamicMethodGenerator, MonoMod.Utils::DMDGenerator`1, MonoMod.Utils::DynDll, MonoMod.Utils::DynDllImportAttribute, MonoMod.Utils::DynDllMapping, MonoMod.Utils::DynamicMethodDefinition, MonoMod.Utils::DynamicMethodHelper, MonoMod.Utils::Extensions, MonoMod.Utils::GenericMethodInstantiationComparer, MonoMod.Utils::LazyDisposable`1, MonoMod.Utils::MMReflectionImporter, MonoMod.Utils::Platform, MonoMod.Utils::PlatformHelper, MonoMod.Utils::ReflectionHelper
  - 字符串: D:\a\1\s\MonoMod.RuntimeDetour\obj\Release\netstandard2.0\MonoMod.RuntimeDetour.pdb, MonoMod, MonoMod.Cil, MonoMod.RuntimeDetour, MonoMod.RuntimeDetour.HookGen, MonoMod.RuntimeDetour.Platforms, MonoMod.RuntimeDetour.dll, MonoMod.Utils
- **Reflection.Emit 动态生成** 程序集引用: System.Reflection.Emit.ILGeneration, System.Reflection.Emit.Lightweight
  - 类型: MonoMod.Utils.Cil::CecilILGenerator, MonoMod.Utils.Cil::ILGeneratorShim, MonoMod.Utils::DMDEmitDynamicMethodGenerator, MonoMod.Utils::DynamicMethodDefinition, MonoMod.Utils::DynamicMethodHelper, System.Reflection.Emit::DynamicMethod, System.Reflection.Emit::ILGenerator, System.Reflection.Emit::OpCode, System.Reflection.Emit::OpCodes
  - 字符串: CecilILGenerator, DMDEmitDynamicMethodGenerator, DynamicMethodDefinition, DynamicMethodHelper, GetILGenerator, ILGeneratorShim, System.Reflection.Emit, System.Reflection.Emit.ILGeneration
- **Roslyn / 动态编译** 仅字符串出现（无程序集/类型/成员元数据引用，反编译阶段确认是否未使用残留）: Microsoft.CodeAnalysis
- PInvoke `libc`: 1 入口（示例: mprotect）
- PInvoke `MonoPosixHelper`: 4 入口（示例: Mono_Posix_Syscall_sysconf, Mono_Posix_Syscall_mprotect, Mono_Posix_Stdlib_GetLastError, Mono_Posix_ToErrno）
- PInvoke `kernel32.dll`: 4 入口（示例: VirtualProtect, GetCurrentProcess, FlushInstructionCache, VirtualQueryEx）

### MonoMod.Utils.dll

> 被禁子系统自身程序集，IL2CPP 下整体禁用，以下为其内部自引用明细。

- **Mono.Cecil 元数据改写** 程序集引用: Mono.Cecil
  - 类型: Mono.Cecil.Cil::Code, Mono.Cecil.Cil::CustomDebugInformation, Mono.Cecil.Cil::Document, Mono.Cecil.Cil::ExceptionHandler, Mono.Cecil.Cil::ExceptionHandlerType, Mono.Cecil.Cil::ILProcessor, Mono.Cecil.Cil::Instruction, Mono.Cecil.Cil::MethodBody, Mono.Cecil.Cil::MethodDebugInformation, Mono.Cecil.Cil::OpCode, Mono.Cecil.Cil::OpCodeType, Mono.Cecil.Cil::OpCodes, Mono.Cecil.Cil::OperandType, Mono.Cecil.Cil::SequencePoint, Mono.Cecil.Cil::VariableDefinition, Mono.Cecil.Cil::VariableReference, Mono.Cecil::ArrayDimension, Mono.Cecil::ArrayType, Mono.Cecil::AssemblyDefinition, Mono.Cecil::AssemblyHashAlgorithm, Mono.Cecil::AssemblyNameDefinition, Mono.Cecil::AssemblyNameReference, Mono.Cecil::ByReferenceType, Mono.Cecil::CallSite, Mono.Cecil::CustomAttribute, Mono.Cecil::CustomAttributeArgument, Mono.Cecil::CustomAttributeNamedArgument, Mono.Cecil::DefaultReflectionImporter, Mono.Cecil::EventDefinition, Mono.Cecil::EventReference, Mono.Cecil::FieldAttributes, Mono.Cecil::FieldDefinition, Mono.Cecil::FieldReference, Mono.Cecil::FunctionPointerType, Mono.Cecil::GenericInstanceMethod, Mono.Cecil::GenericInstanceType, Mono.Cecil::GenericParameter, Mono.Cecil::GenericParameterAttributes, Mono.Cecil::GenericParameterConstraint, Mono.Cecil::GenericParameterType, Mono.Cecil::ICustomAttributeProvider, Mono.Cecil::IGenericInstance, Mono.Cecil::IGenericParameterProvider, Mono.Cecil::IMetadataScope, Mono.Cecil::IMetadataTokenProvider, Mono.Cecil::IMethodSignature, Mono.Cecil::IReflectionImporter, Mono.Cecil::IReflectionImporterProvider, Mono.Cecil::MarshalInfo, Mono.Cecil::MemberReference, Mono.Cecil::MetadataToken, Mono.Cecil::MetadataType, Mono.Cecil::MethodAttributes, Mono.Cecil::MethodCallingConvention, Mono.Cecil::MethodDefinition, Mono.Cecil::MethodImplAttributes, Mono.Cecil::MethodReference, Mono.Cecil::MethodReturnType, Mono.Cecil::MethodSpecification, Mono.Cecil::ModuleDefinition, Mono.Cecil::ModuleKind, Mono.Cecil::ModuleParameters, Mono.Cecil::ModuleReference, Mono.Cecil::OptionalModifierType, Mono.Cecil::PInvokeInfo, Mono.Cecil::ParameterAttributes, Mono.Cecil::ParameterDefinition, Mono.Cecil::ParameterReference, Mono.Cecil::PinnedType, Mono.Cecil::PointerType, Mono.Cecil::PropertyDefinition, Mono.Cecil::PropertyReference, Mono.Cecil::ReaderParameters, Mono.Cecil::ReadingMode, Mono.Cecil::RequiredModifierType, Mono.Cecil::SentinelType, Mono.Cecil::TypeAttributes, Mono.Cecil::TypeDefinition, Mono.Cecil::TypeReference, Mono.Cecil::TypeSpecification, Mono.Cecil::TypeSystem
  - 字符串: CecilILGenerator, DMDCecilGenerator, Mono.Cecil, Mono.Cecil.Cil, _CecilOpCodes, _CecilOpCodes1X, _CecilOpCodes2X, _PreferCecil
- **MonoMod 运行时 Detour** 仅字符串出现（无程序集/类型/成员元数据引用，反编译阶段确认是否未使用残留）: "MonoMod.Utils.Cil.ILGeneratorProxy, .MonoMod.Utils.DynamicData+<GetEnumerator>d__66, D:\a\1\s\MonoMod.Utils\obj\Release\netstandard2.0\MonoMod.Utils.pdb, MonoMod, MonoMod.Cil, MonoMod.ModInterop, MonoMod.Utils, MonoMod.Utils.Cil
- **Reflection.Emit 动态生成** 程序集引用: System.Reflection.Emit.ILGeneration, System.Reflection.Emit.Lightweight
  - 类型: System.Reflection.Emit::DynamicMethod, System.Reflection.Emit::ILGenerator, System.Reflection.Emit::Label, System.Reflection.Emit::LocalBuilder, System.Reflection.Emit::OpCode, System.Reflection.Emit::OpCodes, System.Reflection.Emit::OperandType, System.Reflection.Emit::ParameterBuilder, System.Reflection.Emit::SignatureHelper, System.Reflection.Emit::StackBehaviour
  - 字符串: "MonoMod.Utils.Cil.ILGeneratorProxy, CecilILGenerator, DMDEmitDynamicMethodGenerator, DynamicMethodDefinition, DynamicMethodHelper, DynamicMethodReference, GetILGenerator, ILGeneratorBuilder
- PInvoke `kernel32`: 6 入口（示例: GetModuleHandle, LoadLibrary, FreeLibrary, GetProcAddress, GetModuleHandle）
- PInvoke `dl`: 4 入口（示例: dlopen, dlclose, dlsym, dlerror）
- PInvoke `libdl.so.2`: 4 入口（示例: dlopen, dlclose, dlsym, dlerror）

### Newtonsoft.Json.dll

- **Roslyn / 动态编译** 仅字符串出现（无程序集/类型/成员元数据引用，反编译阶段确认是否未使用残留）: Microsoft.CodeAnalysis

### UImGui.dll

- PInvoke `cimgui`: 2 入口（示例: GetBuilderForFreeType, SetAllocatorFunctions）

### com.rlabrecque.steamworks.net.dll

- PInvoke `steam_api64`: 944 入口（示例: SteamAPI_Init, SteamAPI_Shutdown, SteamAPI_RestartAppIfNecessary, SteamAPI_ReleaseCurrentThreadMemory, SteamAPI_WriteMiniDump）
- PInvoke `sdkencryptedappticket64`: 11 入口（示例: SteamEncryptedAppTicket_BDecryptTicket, SteamEncryptedAppTicket_BIsTicketForApp, SteamEncryptedAppTicket_GetTicketIssueTime, SteamEncryptedAppTicket_GetTicketSteamID, SteamEncryptedAppTicket_GetTicketAppID）

