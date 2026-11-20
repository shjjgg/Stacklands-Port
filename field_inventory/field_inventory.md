# 自研程序集字段清单 / 枚举值台账

- 扫描时间: 2026-11-20T20:17:36
- 元数据 FieldDef 枚举（TypeDef.FieldList 归属）；字段类型签名 blob 未完全解码，精确类型名/泛型实参/序列化特性需反编译后补全。

## 1. 汇总

| 程序集 | 字段总数 | 静态 | 实例 | 字面量 | 只读 | 非序列化 | 枚举类型 | 枚举成员 |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| GameScripts.dll | 7737 | 4682 | 3055 | 3761 | 115 | 6 | 44 | 374 |
| Assembly-CSharp.dll | 41 | 4 | 37 | 0 | 3 | 0 | 0 | 0 |
| Assembly-CSharp-firstpass.dll | 358 | 58 | 300 | 53 | 3 | 0 | 11 | 35 |
| csS.dll | 22 | 2 | 20 | 0 | 2 | 0 | 0 | 0 |

## 2. 枚举成员取值


### GameScripts.dll

- `AttackDamage` (`int`): VeryWeak=0, Weak=1, Normal=2, Strong=3, VeryStrong=4, ExtremelyStrong=5
- `AttackSpeed` (`int`): VerySlow=0, Slow=1, Normal=2, Fast=3, VeryFast=4, ExtremelyFast=5
- `AttackType` (`int`): None=0, Melee=1, Ranged=2, Magic=3, Foot=4, Armour=5, Air=6
- `BackgroundRegion` (`int`): BottomLeft=0, BottomCenter=1, BottomRight=2, MiddleLeft=3, MiddleCenter=4, MiddleRight=5, TopLeft=6, TopCenter=7, TopRight=8
- `BlueprintGroup` (`int`): Basic=0, Building=1, Military=2, Cooking=3, Resources=4, Sailing=5, Island=6, Fishing=7, Important=8, Happiness=9, Death=10, Greed=11, Power=12, Automation=13, Landmark=14
- `BoardCurrency` (`int`): Gold=0, Shell=1, Dollar=2
- `CardBagType` (`int`): Chances=0, SetPack=1, SetCardBag=2, Enemies=3
- `CardDamageType` (`int`): None=0, Fire=1, Damaged=2, Drought=3
- `CardDirection` (`int`): input=0, output=1
- `CardEventType` (`int`): Tornado=0, FinancialCrisis=1, WildFire=2, EarthQuake=3, PackSale=4, Festival=5, Drought=6
- `CardType` (`int`): Structures=0, Humans=1, Resources=2, Ideas=3, Food=4, Mobs=5, Locations=6, Fish=7, Rumors=8, Equipable=9, Spirits=10, Weather=11, Disaster=12, Event=13, Landmarks=14
- `CardUpdateType` (`int`): Main=0, Island=1, Spirit=2, Forest=3, Order=4, Mod=5, Cities=6
- `CityState` (`int`): Euphoric=50, Happy=40, Normal=30, Unhappy=20, Miserable=10, Gameover=0
- `ConnectionType` (`int`): LV=1, HV=3, Sewer=4, Transport=5
- `ControlScheme` (`int`): None=0, KeyboardMouse=1, Controller=2, Touch=4
- `CurseType` (`int`): Happiness=0, Death=1, Greed=2
- `DebugTab` (`int`): General=0, Cards=1, Shortcuts=2, Effects=3, Saves=4, Presets=5, Cutscenes=6
- `Defence` (`int`): VeryWeak=0, Weak=1, Normal=2, Strong=3, VeryStrong=4, ExtremelyStrong=5
- `DemandDifficulty` (`int`): easy=0, medium=1, hard=2
- `Ease` (`int`): EaseInQuad=0, EaseOutQuad=1, EaseInOutQuad=2, EaseInCubic=3, EaseOutCubic=4, EaseInOutCubic=5, EaseInQuart=6, EaseOutQuart=7, EaseInOutQuart=8, EaseInQuint=9, EaseOutQuint=10, EaseInOutQuint=11, EaseInSine=12, EaseOutSine=13, EaseInOutSine=14, EaseInExpo=15, EaseOutExpo=16, EaseInOutExpo=17, EaseInCirc=18, EaseOutCirc=19, EaseInOutCirc=20, Linear=21, Spring=22, EaseInBounce=23, EaseOutBounce=24, EaseInOutBounce=25, EaseInBack=26, EaseOutBack=27, EaseInOutBack=28, EaseInElastic=29, EaseOutElastic=30, EaseInOutElastic=31
- `EnemySetCardBag` (`int`): BasicEnemy=0, AdvancedEnemy=1, Island_BasicEnemy=2, Island_AdvancedEnemy=3, Forest_BasicEnemy=4, Forest_AdvancedEnemy=5, Happiness_Enemy=6, Cities_BasicEnemy=7, Cities_AdvancedEnemy=8
- `EquipableType` (`int`): Head=0, Torso=1, Weapon=2
- `FontType` (`int`): Regular=0, Rounded=1, World=2
- `ForestCombatState` (`int`): Cutscene=0, Finished=1, InWave=2, Idle=3, Lost=4
- `GameState` (`int`): Playing=0, Paused=1, GameOver=2, InMenu=3
- `HitChance` (`int`): VerySmall=0, Small=1, Normal=2, High=3, VeryHigh=4, ExtremelyHigh=5
- `LifeStage` (`int`): Teenager=0, Adult=1, Elderly=2, Dead=3
- `Location` (`int`): Mainland=0, Island=1, Forest=2, Happiness=3, Greed=4, Death=5, Cities=6
- `MoonLength` (`int`): Short=0, Normal=1, Long=2
- `PickupSoundGroup` (`int`): Default=0, Medium=1, Heavy=2, Custom=3
- `PositionType` (`int`): InConflict=0, InAttack=1, InStack=2, IsRoot=3, IsEquipped=4, InAnimation=5, None=6, IsWorking=7
- `QuestGroup` (`int`): Starter=0, MainQuest=1, Fighting=2, Cooking=3, Exploration=4, Resources=5, Building=6, Survival=7, Other=8, Island_Beginnings=9, Island_Combat=10, Island_Cooking=11, Island_Misc=12, Island_MainQuest=13, Forest_MainQuest=14, Equipment=15, Happiness_Starter=16, Happiness_MainQuest=17, Happiness_Cooking=18, Happiness_Collecting=19, Happiness_Unhappy=20, Greed_MainQuest=21, Greed_Starter=22, Greed_Misc=23, Greed_Thriving=24, Death_MainQuest=25, Death_Starter=26, Death_Misc=27, Discover_Spirits=28, Cities_Starter=29, Cities_MainQuest=30, Cities_Automation=31, Cities_Freedom=32, Cities_Power=33, Cities_Wellbeing=34, Cities_Landmark=35, Cities_Misc=36, Cities_Worker=37
- `RequirementType` (`int`): Food=1, Energy=2, WellBeing=3, Dollar=4, Card=5, Pollution=6, Health=7
- `ScreenPosition` (`int`): Left=0, Right=1, Bottom=2, Top=3, None=4
- `SetCardBagType` (`int`): BasicResources=0, AdvancedResources=1, SpecialResources=2, BasicHarvestable=3, BasicFood=4, AdvancedFood=5, Animal=6, BasicEnemy=7, AdvancedEnemy=8, BasicIdea=9, BasicBuildingIdea=10, AdvancedBuildingIdea=11, CookingIdea=12, AdvancedHarvestable=13, Island_BasicResources=14, Island_BasicFood=15, Island_BasicHarvestable=16, Island_AdvancedHarvestable=17, Island_Animal=18, Island_BasicEnemy=19, Island_BasicIdea=20, Island_CookingIdea=21, Island_AdvancedIdea=22, Island_AdvancedFood=23, Island_AdvancedResources=24, Island_AdvancedEnemy=25, Island_AdvancedBuildingIdea=26, Forest_BasicEnemy=27, Forest_AdvancedEnemy=28, EquipmentBlueprints=29, Happiness_BasicIdea=30, Happiness_CookingIdea=31, Happiness_BasicBuildingIdea=32, Happiness_AdvancedBuildingIdea=33, Happiness_Harvestable=34, Happiness_Animal=35, Happiness_Enemy=136, Greed_AdvancedIdea=36, Greed_Animal=37, Greed_BasicIdea=38, Greed_Cooking=39, Greed_Luxuries=40, Greed_Harvestables=41, Greed_Buildings=42, Greed_Equipables=43, Death_Harvestable=44, Death_Animal=45, Death_BasicIdea=46, Death_AdvancedIdea=47, Death_AdvancedResources=48, Greed_RequiredBuildings=49, Greed_BasicResources=50, Greed_AdvancedResources=51, Cities_BasicResources=60, Cities_BasicIdeas=61, Cities_ResourceDeposits=62, Cities_Ideas=63, Cities_Basic_Smeltables=64, Cities_Basic_Deposits=65, Cities_Ideas_2=66, Cities_Disasters=67, Cities_RecyclingCenter=68, Cities_Ideas_3=69, Cities_BasicEnemy=70, Cities_AdvancedEnemy=71, Cities_Valuables=72, Cities_SmeltableIdea=73, Cities_AdvancedDeposits=74, Cities_Ideas_Army=75, Cities_Ideas_Industry=76, Cities_Events=77
- `SpawnLocation` (`int`): Random=0, MiddleOfBoard=1, AtCard=2, AtFocussed=3
- `SpecialHitTarget` (`int`): Self=0, Target=1, RandomFriendly=2, RandomEnemy=3, AllFriendly=4, AllEnemy=5
- `SpecialHitType` (`int`): None=0, Poison=1, Stun=2, Heal=3, HealLowest=4, LifeSteal=5, Bleeding=6, Frenzy=7, Damage=8, Invulnerable=9, Crit=10, Sick=11, Anxious=12
- `Team` (`int`): Player=0, Enemy=1
- `TransitionState` (`int`): None=0, Entering=1, Holding=2, Leaving=3
- `UIColor` (`int`): Button=0, Background=1, Text=2, DisabledText=3, Background2=4, InactiveBackground=5
- `ViewType` (`int`): Default=1, Energy=2, Sewer=3, Transport=4, Calamity=5
- `VisualsState` (`int`): None=0, ActiveUnconnected=1, Inactive=2, ActiveConnected=3
- `WorkerType` (`int`): Normal=1, Educated=2, Robot=3


### Assembly-CSharp-firstpass.dll

- `Architecture` (`int`): None=0, Windows_x64=1, macOS=2
- `BenchmarkType` (`int`): TMP_SDF_MOBILE=0, TMP_SDF__MOBILE_SSD=1, TMP_SDF=2, TMP_BITMAP_MOBILE=3, TEXTMESH_BITMAP=4
- `CameraModes` (`int`): Follow=0, Isometric=1, Free=2
- `Distribution` (`int`): None=0
- `FpsCounterAnchorPositions` (`int`): TopLeft=0, BottomLeft=1, TopRight=2, BottomRight=3
- `FpsCounterAnchorPositions` (`int`): TopLeft=0, BottomLeft=1, TopRight=2, BottomRight=3
- `FpsCounterAnchorPositions` (`int`): TopLeft=0, BottomLeft=1, TopRight=2, BottomRight=3
- `MotionType` (`int`): Rotation=0, BackAndForth=1, Translation=2
- `Platform` (`int`): None=0, PC=1, macOS=2
- `ReleaseType` (`int`): None=0, itch_io=1, Steam=2
- `objectType` (`int`): TextMeshPro=0, TextMeshProUGUI=1

