# 自研程序集方法清单 / Unity 生命周期消息台账

- 扫描时间: 2026-11-20T20:14:16
- 元数据 MethodDef 枚举（TypeDef.MethodList 归属）；方法体、参数签名、重写关系需反编译后补全。

## 1. 汇总

| 程序集 | 方法总数 | 构造函数 | 属性访问器 | 含生命周期方法的类型 | 生命周期消息数 |
|---|---:|---:|---:|---:|---:|
| GameScripts.dll | 5453 | 972 | 403 | 122 | 256 |
| Assembly-CSharp.dll | 15 | 4 | 0 | 1 | 4 |
| Assembly-CSharp-firstpass.dll | 268 | 59 | 10 | 30 | 70 |
| csS.dll | 34 | 5 | 28 | 0 | 0 |

## 2. Unity 生命周期消息分布

| 生命周期消息 | 出现次数 |
|---|---:|
| `Update` | 97 |
| `Awake` | 85 |
| `Start` | 68 |
| `OnEnable` | 22 |
| `LateUpdate` | 20 |
| `OnDestroy` | 14 |
| `OnDisable` | 11 |
| `OnDrawGizmos` | 4 |
| `OnApplicationQuit` | 4 |
| `OnValidate` | 3 |
| `OnApplicationFocus` | 1 |
| `FixedUpdate` | 1 |

## 3. GameScripts.dll 含生命周期方法的类型

| 类型 | 生命周期消息 |
|---|---|
| `AccessibilityScreen` | Awake, OnApplicationQuit, Update |
| `AchievementElement` | Update |
| `AdvancedSettingsScreen` | Awake, Update, OnApplicationQuit |
| `AttackAnimation` | Start, Update |
| `AttackAnimationBullet` | Start, Update |
| `AttackAnimationMagic` | Start, Update |
| `AttackAnimationMelee` | Update |
| `AttackAnimationRanged` | Start, Update |
| `AudioManager` | Awake, Start, LateUpdate |
| `BoardBackground` | Awake |
| `Boosterpack` | Awake, Start, OnDestroy, Update |
| `BuyBoosterBox` | Update |
| `CardAnimation` | Start, Update |
| `CardAnimation_FakeMeleeAttack` | Update |
| `CardConnector` | Update |
| `CardData` | OnValidate, Awake |
| `CardTarget` | Start, OnDestroy, Update, LateUpdate |
| `CardopediaEntryElement` | Update |
| `CardopediaScreen` | Awake, OnDestroy, OnEnable, OnDisable, Update |
| `CitiesManager` | Start, Update |
| `CityAdvisor` | Awake |
| `ColorManager` | Awake, OnValidate |
| `Colorizer` | OnValidate, Start, Update |
| `Combatable` | OnDrawGizmos |
| `ConflictArrowDrawer` | Awake |
| `ConflictRectangleDrawer` | Awake |
| `ControlsScreen` | Awake, OnEnable, Update |
| `ConveyorArrowDrawer` | Awake |
| `CreditsScreen` | OnEnable, Update |
| `CustomButton` | Awake, Start, OnDisable, OnEnable, Update, LateUpdate |
| `CutsceneScreen` | Awake, OnEnable, Update, LateUpdate |
| `DebugScreen` | Start, Update, Awake |
| `DemandManager` | Awake |
| `DirectionCircleElement` | Start, Update |
| `Draggable` | Awake, OnDestroy, Start, Update, LateUpdate |
| `DrawManager` | Awake, Update, LateUpdate |
| `EnergyCableDrawer` | Awake |
| `EquipmentPosition` | Awake, Update |
| `ExpandableLabel` | Start, Update |
| `ExpandableLabelCardopedia` | Start, Update |
| `FloatingStatus` | Start, Update |
| `FontManager` | Awake, Start, OnDestroy, Update |
| `FontSetter` | Start, OnEnable, OnDestroy, Update |
| `ForestCombatManager` | Awake, Update, OnDrawGizmos |
| `GameBoard` | Awake, Start, Update |
| `GameCamera` | Awake, Start, Update |
| `GameCanvas` | Awake, Update |
| `GameCard` | Awake, Start, OnDestroy, OnDrawGizmos, Update, LateUpdate |
| `GameOverScreen` | Awake, OnEnable, Update |
| `GameScreen` | Awake, OnDestroy, OnEnable, Update, LateUpdate |
| `GridQuad` | Update |
| `Harvestable` | Awake, OnDestroy |
| `HitText` | Awake, Start, OnDestroy, Update |
| `IdeaElement` | Update |
| `ImageEffect` | Awake |
| `InputController` | Awake, OnApplicationFocus, OnDestroy, Update, LateUpdate |
| `InventoryInteractable` | Start, Update |
| `LoggingManager` | Awake, Update |
| `MagicProjectile` | Start, Update |
| `MainMenu` | Awake, Update |
| `MaterialChanger` | Awake |
| `ModDisablingScreen` | Awake |
| `ModManager` | Awake |
| `ModOptionsScreen` | Awake, Update, OnEnable |
| `ModUploadScreen` | Awake, OnEnable, Update |
| `ModalScreen` | Awake |
| `ModsScreen` | Awake, Update |
| `MultilineScrollbarHider` | Update |
| `NotificationElement` | Start, Update |
| `OnOffInteractable` | Start, Update |
| `OptionsScreen` | Awake, OnDestroy, Start, Update, OnDisable |
| `PackUI` | Start, Update |
| `PauseScreen` | Awake, Update |
| `PirateBoat` | Awake, Start |
| `PrefabManager` | Awake |
| `Projectile` | Start, Update |
| `QuestManager` | Awake, Start |
| `RangedProjectile` | Update |
| `RebindElement` | Start, Update |
| `RectanglePacker` | OnDrawGizmos |
| `RunOptionsScreen` | Start, Update |
| `SaveManager` | Awake |
| `SceneBootstrapper` | Awake |
| `SchemaUI` | Start, Update |
| `Screenshotter` | Awake, Start, LateUpdate |
| `ScrollText` | Start, Update, LateUpdate |
| `ScrollTextHorizontal` | Start, Update, LateUpdate |
| `ScrollbarFixer` | Start, Update |
| `SelectLanguageScreen` | Start |
| `SelectResolutionScreen` | Start, Update, OnEnable |
| `SelectSaveScreen` | Start, OnEnable |
| `SellBox` | Update, LateUpdate |
| `SewerPipeDrawer` | Awake |
| `ShowInfoBox` | Start, Update |
| `ShowTooltip` | Update |
| `ShowTooltipInteractable` | Update, LateUpdate |
| `Spirit` | Awake |
| `SpriteManager` | Awake, Update |
| `StatusEffect` | Update |
| `StatusEffectElement` | Awake, Update |
| `StatusEffect_Anxious` | Update |
| `StatusEffect_Bleeding` | Update |
| `StatusEffect_Dissolving` | Update |
| `StatusEffect_Drunk` | Update |
| `StatusEffect_Frenzy` | Update |
| `StatusEffect_Invulnerable` | Update |
| `StatusEffect_NoWorkers` | Update |
| `StatusEffect_Poison` | Update |
| `StatusEffect_Radar` | Update |
| `StatusEffect_Sick` | Update |
| `StatusEffect_Spoiling` | Update |
| `StatusEffect_Stunned` | Update |
| `StatusEffect_WellFed` | Update |
| `Statusbar` | Start, Update |
| `SteamManager` | Awake, OnEnable, OnDestroy, Update |
| `Tooltip` | Awake, LateUpdate |
| `TransitionScreen` | Awake, Update, OnApplicationQuit |
| `TransportArrowDrawer` | Awake |
| `TransportArrowMainlandDrawer` | Awake |
| `UpdatePopup` | Awake, OnEnable, Update |
| `WorkerTransformHolder` | Update |
| `WorldManager` | Awake, Start, OnApplicationQuit, OnDestroy, Update, LateUpdate |


## 3. Assembly-CSharp.dll 含生命周期方法的类型

| 类型 | 生命周期消息 |
|---|---|
| `Sokpop.SokIntro` | Awake, Start, Update, FixedUpdate |


## 3. Assembly-CSharp-firstpass.dll 含生命周期方法的类型

| 类型 | 生命周期消息 |
|---|---|
| `TMPro.Examples.Benchmark01` | Start |
| `TMPro.Examples.Benchmark01_UGUI` | Start |
| `TMPro.Examples.Benchmark02` | Start |
| `TMPro.Examples.Benchmark03` | Awake, Start |
| `TMPro.Examples.Benchmark04` | Start |
| `TMPro.Examples.CameraController` | Awake, Start, LateUpdate |
| `ChatController` | OnEnable, OnDisable |
| `EnvMapAnimator` | Awake, Start |
| `TMPro.Examples.ObjectSpin` | Awake, Update |
| `TMPro.Examples.ShaderPropAnimator` | Awake, Start |
| `TMPro.Examples.SimpleScript` | Start, Update |
| `TMPro.Examples.SkewTextExample` | Awake, Start |
| `TMPro.Examples.TMP_ExampleScript_01` | Awake, Update |
| `TMPro.Examples.TMP_FrameRateCounter` | Awake, Start, Update |
| `TMPro.Examples.TMP_TextEventCheck` | OnEnable, OnDisable |
| `TMPro.TMP_TextEventHandler` | Awake, LateUpdate |
| `TMPro.Examples.TMP_TextSelector_A` | Awake, LateUpdate |
| `TMPro.Examples.TMP_TextSelector_B` | Awake, OnEnable, OnDisable, LateUpdate |
| `TMPro.Examples.TMP_UiFrameRateCounter` | Awake, Start, Update |
| `TMPro.Examples.TMPro_InstructionOverlay` | Awake |
| `TMPro.Examples.TeleType` | Awake, Start |
| `TMPro.Examples.TextConsoleSimulator` | Awake, Start, OnEnable, OnDisable |
| `TMPro.Examples.TextMeshProFloatingText` | Awake, Start |
| `TMPro.Examples.TextMeshSpawner` | Awake, Start |
| `TMPro.Examples.VertexColorCycler` | Awake, Start |
| `TMPro.Examples.VertexJitter` | Awake, OnEnable, OnDisable, Start |
| `TMPro.Examples.VertexShakeA` | Awake, OnEnable, OnDisable, Start |
| `TMPro.Examples.VertexShakeB` | Awake, OnEnable, OnDisable, Start |
| `TMPro.Examples.VertexZoom` | Awake, OnEnable, OnDisable, Start |
| `TMPro.Examples.WarpTextExample` | Awake, Start |

