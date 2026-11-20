# 11 · 配置 / 本地化 / DLC / 音频链路盘点

> 数据来源：`tools/export_content_inventory.py` 实测，机器可读结果 `content_inventory/content_inventory.json`。

## 1. TextAsset 分类（15 个）

### 1.1 存档模板 / 预设（JSON，结构需原样保留）

| 名称 | 大小 | 用途 | 移植注意 |
|---|---:|---|---|
| `2000_BetaSave` | 44.7 KB | 2000 DLC 初始存档 | 随包携带，首启复制到可写目录；JSON schema 不可改 |
| `CursedWorlds_BetaSave` | 57.4 KB | Cursed Worlds 初始存档 | 同上 |
| `preset_death_06_02_1122_28` | 3.2 KB | 死亡预设关卡 | 同上 |

存档 JSON 字段（实测）：`SaveId`、`LastPlayedRound`、`SavedCards[]`（`UniqueId`、`ParentUniqueId`、`BoardId`、`CardPrefabId`…）。
→ 存档反序列化走 Newtonsoft.Json + Sirenix，IL2CPP 下相关模型类型必须在 `link.xml` 保留；字段名大小写/拼写保持原版。

### 1.2 本地化字符集与换行规则

| 名称 | 用途 |
|---|---|
| `CharSet` / `DefaultCharSet` | 默认字符集 / 语言映射 |
| `CharSet-JP / -KR / -SC / -TC` | 日/韩/简中/繁中字符集 |
| `LineBreaking Leading Characters` / `Following Characters` | 排版禁则（行首/行尾禁排字符） |
| `VillagerNames` | 村民名随机池（40.1 KB，空格分隔） |

→ 与 NotoSans CJK 字体、TMP 字体资产整条保留；语言切换与字符集回退不可删减。

### 1.3 代码引用卡牌 / 第三方元数据

| 名称 | 用途 | 注意 |
|---|---|---|
| `CodeReferencedCards` | 代码直接引用的卡牌 ID 列表（rare_portal、demon、small_slime…） | 这些卡牌 ID 不得被裁剪/重命名；配置表与代码字符串需一致 |
| `package` | Shapes 4.1.0 包清单（com.acegikmo.shapes） | 对应 ShapesRuntime 版本 |
| `_LICENSE` | 光标素材 GPL 许可（Lyra-Cursors） | 随包保留版权声明 |

## 2. 音频链路

- 混音器：`AudioMixer`，分组 **Master → Music / Sfx**，一个默认 `Snapshot`。
- 音频：主包 137 个 AudioClip；Cities DLC 18 个、Spirits DLC 20 个。
- 移植注意：Music/Sfx 两条总线路由保留；Android 解码格式与音量/静音设置链路沿用原版； DLC 音频随各自 bundle 加载。

## 3. DLC Bundle 内部结构（UnityFS, 2022.3.4f1）

### 3.1 Cities_DLC (`cities_dlc`)

| 类型 | 数量 | 样例 |
|---|---:|---|
| GameObject | 201 | Structure_WaterDeposit、Structure_IndustrialSmelter、Blueprint_Muesli、Blueprint_Zoo、Structure_RobotStation、Food_ReadyMeal |
| Sprite / Texture2D | 124 / 124 | robot_worker、apartment、solar_panel、oil_rig、IronDeposit… |
| AudioClip | 18 | Genius_Pickup_TK、Science_Pickup_TK、Currency_10/20_TK、PackSale_TK… |
| MonoBehaviour | 228 | Cities_Ideas_Smeltables、Cities_BasicDeposits、0_Cities_Intro、Cities_BasicEnemy… |
| MonoScript | 58 | 脚本类型引用 |

### 3.2 Spirits_DLC (`spirits_dlc`)

| 类型 | 数量 | 样例 |
|---|---:|---|
| GameObject | 147 | Misc_OldDog、Misc_SadEvent、Food_HerbalTea、Resource_Paper、Food_OlivePulp… |
| Sprite / Texture2D | 98 / 98 | barrel、olive-oil、wine、roasted_meat、fountain_of_youth、well… |
| AudioClip | 20 | Baby_Dragon_Appears_TK、Royal/Shaman/Teenager/Curse_Pickup_TK、Pooping_TK… |
| MonoBehaviour | 189 | 3_Happiness_Creatures、0_Death_Basic、Greed_AdvancedIdea、5_Death_Locations… |
| MonoScript | 47 | 脚本类型引用 |

### 3.3 DLC 移植风险（重点）

- DLC bundle 内 MonoBehaviour 的 **MonoScript 引用必须解析到回填后的 GameScripts 同类**；类名/命名空间不一致会导致 DLC 对象丢脚本。工程重建后需在编辑器内逐个核对 DLC 脚本绑定。
- Bundle 与主工程同版本（2022.3.4f1），可直接 `AssetBundle.LoadFromFile`；不要拆包进主工程，保持内部资产路径。
- DLC 内容入口/卡牌/地块由主包配置与 `CodeReferencedCards` 驱动；本地 bundle 存在性判定替代 Steam 所有权（见 05、09）。

## 4. 待反编译 / 编辑器阶段补全

- [ ] 存档 JSON 完整字段表与版本兼容规则（新旧存档迁移）
- [ ] 各语言字符集与 TMP 字体的映射关系
- [ ] DLC MonoBehaviour 脚本类 ↔ GameScripts 类型对照（58 + 47）
- [ ] 音频剪辑与 Mixer 分组的实际路由引用
