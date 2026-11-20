# 场景可恢复性判据（level0 / level1 → .unity）

- 结论：**不可恢复(字段值不可读)**
- 对象合计 58；MonoBehaviour 14 个，其中 typetree 可读 0 个

## level0（40 个对象）

| 类型 | 数量 | 类 ID | typetree |
|---|---:|---:|---|
| AudioListener | 1 | 81 | 可读 |
| AudioSource | 1 | 82 | 可读 |
| Camera | 1 | 20 | 可读 |
| Canvas | 1 | 223 | 可读 |
| CanvasRenderer | 5 | 222 | 可读 |
| Cubemap | 1 | 90 | 可读 |
| GameObject | 8 | 1 | 可读 |
| LightProbes | 1 | 258 | 可读 |
| LightmapSettings | 1 | 157 | 可读 |
| MonoBehaviour | 10 | 114 | 0/10 可读 |
| NavMeshSettings | 1 | 196 | 可读 |
| RectTransform | 6 | 224 | 可读 |
| RenderSettings | 1 | 104 | 可读 |
| Transform | 2 | 4 | 可读 |

不可读对象（字段值无法取得）：

- `MonoBehaviour` pathID=31 raw=52B head=`00 00 00 00 05 00 00 00 00 00 00 00 01 00 00 00` 原因: Expected to read 52 bytes, but only read 32 bytes
- `MonoBehaviour` pathID=32 raw=372B head=`00 00 00 00 03 00 00 00 00 00 00 00 01 00 00 00` 原因: Expected to read 372 bytes, but only read 32 bytes
- `MonoBehaviour` pathID=33 raw=152B head=`00 00 00 00 04 00 00 00 00 00 00 00 01 00 00 00` 原因: Expected to read 152 bytes, but only read 32 bytes
- `MonoBehaviour` pathID=34 raw=200B head=`00 00 00 00 05 00 00 00 00 00 00 00 01 00 00 00` 原因: Expected to read 200 bytes, but only read 32 bytes
- `MonoBehaviour` pathID=35 raw=136B head=`00 00 00 00 06 00 00 00 00 00 00 00 01 00 00 00` 原因: Expected to read 136 bytes, but only read 32 bytes
- `MonoBehaviour` pathID=36 raw=136B head=`00 00 00 00 07 00 00 00 00 00 00 00 01 00 00 00` 原因: Expected to read 136 bytes, but only read 32 bytes
- `MonoBehaviour` pathID=37 raw=44B head=`00 00 00 00 08 00 00 00 00 00 00 00 01 00 00 00` 原因: Expected to read 44 bytes, but only read 32 bytes
- `MonoBehaviour` pathID=38 raw=80B head=`00 00 00 00 08 00 00 00 00 00 00 00 01 00 00 00` 原因: Expected to read 80 bytes, but only read 32 bytes
- `MonoBehaviour` pathID=39 raw=136B head=`00 00 00 00 09 00 00 00 00 00 00 00 01 00 00 00` 原因: Expected to read 136 bytes, but only read 32 bytes
- `MonoBehaviour` pathID=40 raw=152B head=`00 00 00 00 0a 00 00 00 00 00 00 00 01 00 00 00` 原因: Expected to read 152 bytes, but only read 32 bytes

## level1（18 个对象）

| 类型 | 数量 | 类 ID | typetree |
|---|---:|---:|---|
| GameObject | 4 | 1 | 可读 |
| Light | 1 | 108 | 可读 |
| LightmapSettings | 1 | 157 | 可读 |
| MeshFilter | 1 | 33 | 可读 |
| MeshRenderer | 1 | 23 | 可读 |
| MonoBehaviour | 4 | 114 | 0/4 可读 |
| NavMeshSettings | 1 | 196 | 可读 |
| RenderSettings | 1 | 104 | 可读 |
| Transform | 4 | 4 | 可读 |

不可读对象（字段值无法取得）：

- `MonoBehaviour` pathID=15 raw=52B head=`00 00 00 00 04 00 00 00 00 00 00 00 01 00 00 00` 原因: Expected to read 52 bytes, but only read 32 bytes
- `MonoBehaviour` pathID=16 raw=44B head=`00 00 00 00 02 00 00 00 00 00 00 00 01 00 00 00` 原因: Expected to read 44 bytes, but only read 32 bytes
- `MonoBehaviour` pathID=17 raw=364B head=`00 00 00 00 03 00 00 00 00 00 00 00 01 00 00 00` 原因: Expected to read 364 bytes, but only read 32 bytes
- `MonoBehaviour` pathID=18 raw=200B head=`00 00 00 00 04 00 00 00 00 00 00 00 01 00 00 00` 原因: Expected to read 200 bytes, but only read 32 bytes

## 判据说明

场景 YAML 里的每个组件都要写出全部序列化字段。`GameObject`/`Transform`/`Camera` 等内置组件
在玩家构建里仍带类型树，可以完整还原；但 **MonoBehaviour 的字段布局被剥掉**（只有 `m_Script` 的
PPtr + 一段未知二进制），所以位置、引用、面板参数都无法读出。此时任何 .unity 都只能靠猜，
不是复刻，故判为不可恢复。
