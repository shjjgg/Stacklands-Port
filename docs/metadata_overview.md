# 元数据扫描总览（跨台账一致性核对）

- 生成时间: 2026-11-20T20:34:01
- 数据来源: type/method/field/property-event/attribute/dependency/interface-member 七份台账 JSON；只读汇总，不重新扫描 DLL。

## 1. 自研程序集元数据主表

| 程序集 | TypeDef | MonoScript | MethodDef | FieldDef | PropertyDef | EventDef | CustomAttribute | AssemblyRef | MemberRef | InterfaceImpl |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| GameScripts.dll | 931 | 353 | 5453 | 7737 | 587 | 6 | 1596 | 26 | 2174 | 366 |
| Assembly-CSharp.dll | 7 | 1 | 15 | 41 | 0 | 0 | 8 | 5 | 41 | 0 |
| Assembly-CSharp-firstpass.dll | 74 | 35 | 268 | 358 | 37 | 0 | 128 | 9 | 312 | 59 |
| csS.dll | 7 | 3 | 34 | 22 | 15 | 0 | 38 | 1 | 13 | 0 |

## 2. 全量托管闭包

- Managed DLL 总数: **129**
- 磁盘未解析引用: **0**
- 含内嵌资源程序集: **6**

## 3. 一致性断言

| 编号 | 核对项 | 结果 | 明细 |
|---|---|:---:|---|
| C1-GameScripts.dll | 枚举类型数: 类型台账 = 字段台账 | PASS | 44 vs 44 |
| C2-GameScripts.dll | MethodDef 闭合: 总数 == 类型归属求和 | PASS | 5453 vs 5453 |
| C3-GameScripts.dll | FieldDef 闭合: 总数 == 类型+枚举归属求和 | PASS | 7737 vs 7737 |
| C4a-GameScripts.dll | PropertyDef 闭合: 总数 == 清单长度 | PASS | 587 vs 587 |
| C4b-GameScripts.dll | EventDef 闭合: 总数 == 清单长度 | PASS | 6 vs 6 |
| C5-GameScripts.dll | CustomAttribute 闭合: 分桶求和 == 总数 | PASS | 1596 vs 1596 |
| C6-GameScripts.dll | AssemblyRef 磁盘未解析 = 0 | PASS | 未解析 0 |
| C7-GameScripts.dll | MemberRef TypeSpec 计数 <= 总数 | PASS | 1197/2174 |
| C2-Assembly-CSharp.dll | MethodDef 闭合: 总数 == 类型归属求和 | PASS | 15 vs 15 |
| C3-Assembly-CSharp.dll | FieldDef 闭合: 总数 == 类型+枚举归属求和 | PASS | 41 vs 41 |
| C4a-Assembly-CSharp.dll | PropertyDef 闭合: 总数 == 清单长度 | PASS | 0 vs 0 |
| C4b-Assembly-CSharp.dll | EventDef 闭合: 总数 == 清单长度 | PASS | 0 vs 0 |
| C5-Assembly-CSharp.dll | CustomAttribute 闭合: 分桶求和 == 总数 | PASS | 8 vs 8 |
| C6-Assembly-CSharp.dll | AssemblyRef 磁盘未解析 = 0 | PASS | 未解析 0 |
| C7-Assembly-CSharp.dll | MemberRef TypeSpec 计数 <= 总数 | PASS | 5/41 |
| C1-Assembly-CSharp-firstpass.dll | 枚举类型数: 类型台账 = 字段台账 | PASS | 11 vs 11 |
| C2-Assembly-CSharp-firstpass.dll | MethodDef 闭合: 总数 == 类型归属求和 | PASS | 268 vs 268 |
| C3-Assembly-CSharp-firstpass.dll | FieldDef 闭合: 总数 == 类型+枚举归属求和 | PASS | 358 vs 358 |
| C4a-Assembly-CSharp-firstpass.dll | PropertyDef 闭合: 总数 == 清单长度 | PASS | 37 vs 37 |
| C4b-Assembly-CSharp-firstpass.dll | EventDef 闭合: 总数 == 清单长度 | PASS | 0 vs 0 |
| C5-Assembly-CSharp-firstpass.dll | CustomAttribute 闭合: 分桶求和 == 总数 | PASS | 128 vs 128 |
| C6-Assembly-CSharp-firstpass.dll | AssemblyRef 磁盘未解析 = 0 | PASS | 未解析 0 |
| C7-Assembly-CSharp-firstpass.dll | MemberRef TypeSpec 计数 <= 总数 | PASS | 32/312 |
| C2-csS.dll | MethodDef 闭合: 总数 == 类型归属求和 | PASS | 34 vs 34 |
| C3-csS.dll | FieldDef 闭合: 总数 == 类型+枚举归属求和 | PASS | 22 vs 22 |
| C4a-csS.dll | PropertyDef 闭合: 总数 == 清单长度 | PASS | 15 vs 15 |
| C4b-csS.dll | EventDef 闭合: 总数 == 清单长度 | PASS | 0 vs 0 |
| C5-csS.dll | CustomAttribute 闭合: 分桶求和 == 总数 | PASS | 38 vs 38 |
| C6-csS.dll | AssemblyRef 磁盘未解析 = 0 | PASS | 未解析 0 |
| C7-csS.dll | MemberRef TypeSpec 计数 <= 总数 | PASS | 0/13 |
| C8-closure | 全量托管闭包未解析 = 0 | PASS | 未解析 0, DLL 129 |

## 4. 台账索引

- [type_inventory/type_inventory.md](type_inventory/type_inventory.md) — 类型清单（TypeDef/MonoScript/种类）
- [method_inventory/method_inventory.md](method_inventory/method_inventory.md) — 方法清单与生命周期消息
- [field_inventory/field_inventory.md](field_inventory/field_inventory.md) — 字段清单与枚举取值
- [property_event_inventory/property_event_inventory.md](property_event_inventory/property_event_inventory.md) — 属性/事件清单
- [attribute_inventory/attribute_inventory.md](attribute_inventory/attribute_inventory.md) — CustomAttribute 特性分桶
- [dependency_inventory/dependency_inventory.md](dependency_inventory/dependency_inventory.md) — 引用闭包与内嵌资源
- [interface_member_inventory/interface_member_inventory.md](interface_member_inventory/interface_member_inventory.md) — 接口实现与外部成员引用
- [blocked_metadata/blocked_metadata.md](blocked_metadata/blocked_metadata.md) — 阻断子系统与原生 PInvoke
- [platform_refs/platform_refs.md](platform_refs/platform_refs.md) — Steamworks / Google.Apis 引用

> 口径说明: 方法台账的 `get_/set_` 前缀计数为命名前缀匹配；属性台账的 getter/setter 来自 MethodSemantics 关联（含显式接口实现），两者口径不同，不要求数值相等。

