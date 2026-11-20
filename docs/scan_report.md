# 静态扫描报告 (Stacklands 移植前置扫描)

- 扫描时间: 2026-11-20T19:53:43
- 数据文件: sharedassets1.assets, globalgamemanagers.assets, resources.assets, sharedassets0.assets

## 1. 对象类型分布

| 类型 | 数量 | 具名对象数 |
|---|---:|---:|
| GameObject | 6576 | 1320 |
| Transform | 5838 | 0 |
| SpriteRenderer | 5096 | 0 |
| MonoBehaviour | 2407 | 0 |
| MonoScript | 1319 | 1308 |
| Texture2D | 753 | 723 |
| RectTransform | 738 | 0 |
| Sprite | 622 | 615 |
| CanvasRenderer | 556 | 0 |
| Shader | 222 | 0 |
| AudioClip | 137 | 137 |
| Material | 118 | 83 |
| MeshRenderer | 60 | 0 |
| Mesh | 37 | 36 |
| MeshFilter | 36 | 0 |
| BoxCollider | 26 | 0 |
| TextAsset | 15 | 15 |
| Font | 13 | 13 |
| ComputeShader | 12 | 12 |
| ParticleSystem | 4 | 0 |
| ParticleSystemRenderer | 4 | 0 |
| PreloadData | 3 | 0 |
| AudioMixerGroupController | 3 | 3 |
| MeshCollider | 2 | 0 |
| LightingSettings | 2 | 2 |
| Cubemap | 1 | 1 |
| AudioMixerController | 1 | 1 |
| AudioMixerSnapshotController | 1 | 1 |
| Camera | 1 | 0 |
| AudioListener | 1 | 0 |
| Canvas | 1 | 0 |

## 2. 脚本 (MonoScript) -> 程序集映射

| 程序集 | 脚本数 |
|---|---:|
| GameScripts | 353 |
| Unity.InputSystem | 318 |
| UnityEngine.TestRunner | 110 |
| com.rlabrecque.steamworks.net | 100 |
| UnityEngine.UI | 80 |
| ShapesRuntime | 69 |
| Unity.Timeline | 64 |
| Unity.Postprocessing.Runtime | 56 |
| Unity.TextMeshPro | 54 |
| Assembly-CSharp-firstpass | 35 |
| UImGui | 34 |
| SokLoc | 10 |
| Sirenix.Serialization.dll | 9 |
| DOTween.Modules | 7 |
| Sirenix.Utilities.dll | 6 |
| Unity.AI.Navigation | 5 |
| csS | 3 |
| DOTween.dll | 2 |
| Assembly-CSharp | 1 |
| SokSheet | 1 |
| Sirenix.Serialization.Config.dll | 1 |
| ShapesEditor | 1 |

## 3. MonoBehaviour 引用完整性

- MonoBehaviour 总数: 2407
- 可解析读取 (TypeTree 匹配): 35
- 无法读取 (TypeTree 缺失/不匹配, 需 AssetRipper 复核): 2372
- 空脚本引用 (path_id=0): 0
- PPtr 二次读取异常 (可读取对象中): 35
- 空类名 MonoScript: 0

> 注: 玩家构建剥离了 TypeTree, UnityPy 内置类库对自定义 GameScripts 类匹配不全,
> 大量 MonoBehaviour 体无法在此层反序列化; 其脚本绑定必须以 AssetRipper/编辑器结果为准。
> 上述 PPtr 二次读取异常经还原目录复扫定性为跨文件 PPtr 在 UnityPy 侧的 Typetree 读取假象,
> 可读对象内未发现真实断引用; 编辑器阶段仍逐条复核 m_Script。

PPtr 二次读取异常样例 (前 50):
  - sharedassets1.assets path_id=19212
  - sharedassets1.assets path_id=19274
  - sharedassets1.assets path_id=19331
  - sharedassets1.assets path_id=19348
  - sharedassets1.assets path_id=19358
  - sharedassets1.assets path_id=19384
  - sharedassets1.assets path_id=19555
  - sharedassets1.assets path_id=19606
  - sharedassets1.assets path_id=19615
  - sharedassets1.assets path_id=19628
  - sharedassets1.assets path_id=19639
  - sharedassets1.assets path_id=19646
  - sharedassets1.assets path_id=19650
  - sharedassets1.assets path_id=19654
  - sharedassets1.assets path_id=19747
  - sharedassets1.assets path_id=19766
  - sharedassets1.assets path_id=19816
  - sharedassets1.assets path_id=19834
  - sharedassets1.assets path_id=19870
  - sharedassets1.assets path_id=19885
  - sharedassets1.assets path_id=19922
  - sharedassets1.assets path_id=19978
  - sharedassets1.assets path_id=20002
  - sharedassets1.assets path_id=20038
  - sharedassets1.assets path_id=20043
  - sharedassets1.assets path_id=20102
  - sharedassets1.assets path_id=20149
  - sharedassets1.assets path_id=20231
  - sharedassets1.assets path_id=20480
  - sharedassets1.assets path_id=20508
  - sharedassets1.assets path_id=20532
  - sharedassets1.assets path_id=20634
  - sharedassets1.assets path_id=20716
  - sharedassets1.assets path_id=20955
  - sharedassets1.assets path_id=20992

## 4. 缺失托管程序集 (引用了但 Managed 目录未提供)

- UnityEngine.TestRunner (110 脚本)
- ShapesEditor (1 脚本)

## 5. Shader 名称清单

共 0 项

## 6. ComputeShader 清单

共 12 项
- AutoExposure
- ExposureHistogram
- GaussianDownsample
- Histogram
- Lut3DBaker
- MultiScaleVODownsample1
- MultiScaleVODownsample2
- MultiScaleVORender
- MultiScaleVOUpsample
- Texture3DLerp
- Vectorscope
- Waveform

## 7. Font 清单

共 13 项
- Anton
- Bangers
- Electronic Highway Sign
- LiberationSans
- MINI-WAKUWAKU
- NotoSansJP-Medium
- NotoSansKR-Medium
- NotoSansSC-Medium
- NotoSansTC-Medium
- Oswald-Bold
- Roboto-Bold
- Varela-Regular
- VarelaRound-Regular

## 8. TextAsset 清单

共 15 项
- 2000_BetaSave
- CharSet
- CharSet-JP
- CharSet-KR
- CharSet-SC
- CharSet-TC
- CodeReferencedCards
- CursedWorlds_BetaSave
- DefaultCharSet
- LineBreaking Following Characters
- LineBreaking Leading Characters
- VillagerNames
- _LICENSE
- package
- preset_death_06_02_1122_28

## 9. Material 清单

共 83 项
- Anton SDF - Drop Shadow
- Anton SDF - Outline
- Anton SDF - Sunny Days
- Anton SDF Material
- Bangers SDF - Drop Shadow
- Bangers SDF - Outline
- Bangers SDF Glow
- Bangers SDF Logo
- Bangers SDF Material
- Booster1
- Booster2
- CardBack
- CardEdge
- CardFront
- CardopediaBackground
- CitiesBoard
- CitiesTransition
- CombatCircle
- ConflictArrow
- ConflictOutline
- Consolas SDF Material
- ConveyorArrow
- DeathBoard
- Default-Skybox
- DefaultTransition
- DefaultUI
- ElectricityParticleMinus
- Electronic Highway Sign SDF Material
- EnergyCableBehind
- EnergyCableHighVoltage
- EnergyCableLowVoltage
- EnergyTransition
- FoilParticle
- Font Material
- ForestBoard
- GenericCard
- GreedBoard
- GridShader
- HappinessBoard
- Hit
- IslandBoard
- IslandWater
- LiberationSans SDF - Drop Shadow
- LiberationSans SDF - Metalic Green
- LiberationSans SDF - Outline
- LiberationSans SDF - Overlay
- LiberationSans SDF - Soft Mask
- LiberationSans SDF Material
- MainBoard
- NotoSansJP-Medium SDF Material
- NotoSansKR-Medium SDF Material
- NotoSansSC-Medium SDF Material
- NotoSansTC-Medium SDF Material
- Oswald Bold SDF Material
- Rect Opaque [CORNER_RADIUS]
- Rect Opaque [CORNER_RADIUS][BORDERED]
- Roboto-Bold SDF - Drop Shadow
- Roboto-Bold SDF - Surface
- Roboto-Bold SDF Material
- SewerPipeBehind
- SewerPipeFront
- SmokeParticle
- SmokePlane
- SokpopIntro
- SpiritImageEffect
- SpiritTransition
- SpiritTransitionEffect
- SpriteOnTop
- Sprites-Default
- StatusBar
- StatusEffectSprite
- SuperSampledSprite
- TMPro/Sprite
- TextMeshPro/Sprite
- TransportArrowBehind
- TransportArrowFront
- TransportArrowMainlandBehind
- TransportArrowMainlandFront
- Varela-Regular Atlas Material
- VarelaRound-Regular Atlas Material
- WellbeingParticlePlus
- WobbleSprite
- WorldFont

## 10. AudioClip 清单

共 137 项
- Ambience_City_Loop_TK
- Ambience_of_Death_TK
- Ambience_of_Greed_TK
- Ambience_of_Sadness_TK
- Baby_Pickup_TK
- Baby_to_Teenager_TK
- Card_Game_Achievement_Grand_01
- Card_Game_Ambience_Beach
- Card_Game_Ambience_Forest
- Card_Game_Ambience_Swamp
- Card_Game_Effect_Water_Shimmer_02
- Card_Game_Magic_Glitter_Break_01
- Card_Game_Magic_Seal_02
- Card_Game_Movement_Deal_Single_01
- Card_Game_Movement_Deal_Single_02
- Card_Game_Movement_Deal_Single_03
- Card_Game_Movement_Deal_Single_Small_01
- Card_Game_Movement_Deal_Single_Small_02
- Card_Game_Movement_Deal_Single_Whoosh_Light_01
- Card_Game_Movement_Deal_Single_Whoosh_Light_02
- Card_Game_Movement_Deal_Single_Whoosh_Light_03
- Card_Game_Movement_Tap_01
- Card_Game_Movement_Tap_02
- Card_Game_Movement_Tap_03
- Card_Game_Movement_Tap_04
- Card_Game_Movement_Tap_05
- Card_Game_UI_Button_Light_Click_01
- Card_Game_UI_Button_Light_Click_02
- Card_Game_UI_Button_Light_Click_03
- Card_Game_UI_Button_Light_Metallic_03
- Card_Game_UI_Notification_Ding_03
- CityAdvisor_Appear_TK
- CityAdvisor_Message_TK
- CityAdvisor_Warning_TK
- Drought_Effect_TK
- Drought_Solved_TK
- Earthquake_Effect_TK
- Earthquake_solved_TK
- EnergyLine_Stretch_Loop_TK
- Energy_Connect_TK
- Energy_Disconnect_TK
- Happiness_Used_Up_TK
- IndustrialRevolution_Appears_TK
- Industrial_Transition_Finish_TK
- Industrial_Transition_Start_TK
- Landfill_Emptying
- Landfill_Overflowing_TK
- LandmarkWellbeing_TK
- NegativeEvent_TK
- New_Royal_Demand_TK
- ParticleCollider_TK
- Pollution_Pickup_TK
- Pooping_TK
- Royal_Demand_Fail_TK
- Royal_Demand_Succes_TK
- Sadness_Cancelled_TK
- SewerLine_Stretch_Loop_TK
- Sewer_Connect_TK
- Sewer_Start_TK
- Shaman_Appears_TK
- Spirit_Loop_TK
- Spiritworld_Transition_Finish_TK
- Spiritworld_Transition_Start_TK
- Teenager_to_Villager_TK
- Transport_Connected_TK
- Transport_Start_TK
- Transport_Stretch_Loop_TK
- Villager_Getting_Sick_TK
- Villager_to_OldVillager_TK
- Wellbeing_Counter_TK
- Wellbeing_Gained_TK
- Wellbeing_Lost_TK
- Wildfire_Effect_TK
- Wildfire_Solved_TK
- WouterWitchDeath
- WouterWitchLaugh
- WouterWitchLaugh2
- ball_impact (1)
- ball_impact (2)
- ball_impact (3)
- ball_impact (4)
- battle_loop
- bell
- block
- bouw beat
- coin
- critsound
- dark
- dog
- eat
- echtviben
- eiland liedje
- eng
- enge gebied_15db
- floaty
- heavy_pickup
- hit
- human
- medium_pickup
- music_v11
- mystery11
- pfff
- rangedAttackRelease0
- rangedAttackRelease2
- royal1
- royal2
- sadness1
- shoppen op de wii shop
- simpel
- sndSwing
- sou_horn_0
- sou_sokpop_chinese
- sou_sokpop_czech
- sou_sokpop_dutch
- sou_sokpop_finland
- sou_sokpop_france
- sou_sokpop_german
- sou_sokpop_hungary
- sou_sokpop_iceland
- sou_sokpop_indonesia
- sou_sokpop_italy
- sou_sokpop_japan
- sou_sokpop_korea
- sou_sokpop_spain
- spooky
- stacklands2000_1
- stacklands2000_2
- stacklands2000_3
- stacklands2000_4
- stacklands2000_6
- stacklands2000_7
- stacklands2000_9
- stacklands_11
- stacklands_13
- stacklands_15
- sword_slash
- zOned

## 11. 扫描局限 (需编辑器侧二次校验)

- 贴图/材质/动画控制器/Animator 的运行时断链、着色器变体缺失, 元数据层无法判定,
  需在 AssetRipper 重建工程后于 Unity 编辑器内用校验工具 + RenderDoc 抓帧复核。
- 本脚本不解析 .resS / .resource 二进制内容, 仅按 .assets 元数据统计对象。
