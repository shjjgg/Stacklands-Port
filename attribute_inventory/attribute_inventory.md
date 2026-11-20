# 自研程序集 CustomAttribute 特性台账

- 扫描时间: 2026-11-20T20:23:10
- 元数据 CustomAttribute 枚举；特性构造参数 blob 未解码，具体参数值需反编译后补全。

## 1. 汇总

| 程序集 | 特性总数 | Unity 序列化 | Unity 编辑器 | 编译器/系统 | 其他 |
|---|---:|---:|---:|---:|---:|
| GameScripts.dll | 1596 | 7 | 184 | 1239 | 166 |
| Assembly-CSharp.dll | 8 | 0 | 0 | 8 | 0 |
| Assembly-CSharp-firstpass.dll | 128 | 8 | 0 | 120 | 0 |
| csS.dll | 38 | 0 | 0 | 38 | 0 |

## 2. Unity 序列化 / 编辑器特性分布

| 程序集 | 特性 | 归属 | 成员 |
|---|---|---|---|
| GameScripts.dll | `CreateAssetMenu` | `BoosterpackData` | — |
| GameScripts.dll | `CreateAssetMenu` | `DebugOptions` | — |
| GameScripts.dll | `CreateAssetMenu` | `Demand` | — |
| GameScripts.dll | `CreateAssetMenu` | `ScriptableCutscene` | — |
| GameScripts.dll | `CreateAssetMenu` | `SetCardBagData` | — |
| GameScripts.dll | `DisallowMultipleComponent` | `SteamManager` | — |
| GameScripts.dll | `ExecuteAlways` | `ColorManager` | — |
| GameScripts.dll | `ExecuteAlways` | `Colorizer` | — |
| GameScripts.dll | `ExecuteAlways` | `FontSetter` | — |
| GameScripts.dll | `ExecuteInEditMode` | `FontManager` | — |
| GameScripts.dll | `Header` | `Animal` | CreateTime |
| GameScripts.dll | `Header` | `AnimalPen` | MaxAnimalCount |
| GameScripts.dll | `Header` | `AudioManager` | EnergyConnected |
| GameScripts.dll | `Header` | `Blueprint` | Subprints |
| GameScripts.dll | `Header` | `BlueprintRecipe` | Ingredients |
| GameScripts.dll | `Header` | `BoardOptions` | Ambience |
| GameScripts.dll | `Header` | `BoardOptions` | BaseBoardSize |
| GameScripts.dll | `Header` | `BoardOptions` | CanSpawnPortals |
| GameScripts.dll | `Header` | `BoardOptions` | CanTravelToForest |
| GameScripts.dll | `Header` | `BoardOptions` | NewVillagerSpawnsFromPack |
| GameScripts.dll | `Header` | `CardData` | CitiesValue |
| GameScripts.dll | `Header` | `CardData` | EnergyConnectors |
| GameScripts.dll | `Header` | `CardData` | Id |
| GameScripts.dll | `Header` | `ColorManager` | ButtonColor |
| GameScripts.dll | `Header` | `ColorManager` | Default |
| GameScripts.dll | `Header` | `ColorManager` | EnergyCards |
| GameScripts.dll | `Header` | `ColorManager` | StatusEffect_Poison_A |
| GameScripts.dll | `Header` | `Combatable` | CanHaveInventory |
| GameScripts.dll | `Header` | `CombatableHarvestable` | StatusTerm |
| GameScripts.dll | `Header` | `CutsceneStep_CreateCard` | FindOrCreate |
| GameScripts.dll | `Header` | `DebugOptions` | EndlessMoonEnabled |
| GameScripts.dll | `Header` | `DebugOptions` | SpiritDlcEnabled |
| GameScripts.dll | `Header` | `EnergyHarvestable` | PollutionPerHarvest |
| GameScripts.dll | `Header` | `Equipable` | EquipableType |
| GameScripts.dll | `Header` | `Food` | FoodValue |
| GameScripts.dll | `Header` | `Food` | ResultAction |
| GameScripts.dll | `Header` | `GameCard` | DistanceBetweenStatusses |
| GameScripts.dll | `Header` | `Harvestable` | RequiredVillagerCount |
| GameScripts.dll | `Header` | `Harvestable` | StatusTerm |
| GameScripts.dll | `Header` | `Mob` | MoveTime |
| GameScripts.dll | `Header` | `PrefabManager` | ButtonPrefab |
| GameScripts.dll | `Header` | `PrefabManager` | NormalHitText |
| GameScripts.dll | `Header` | `SpriteManager` | HighVoltageSprite |
| GameScripts.dll | `HideInInspector` | `.CitiesCombatable` | Housing |
| GameScripts.dll | `HideInInspector` | `.Combatable` | InConflict |
| GameScripts.dll | `HideInInspector` | `.CustomButton` | Clicked |
| GameScripts.dll | `HideInInspector` | `.CustomButton` | StartDragging |
| GameScripts.dll | `HideInInspector` | `.Worker` | Housing |
| GameScripts.dll | `HideInInspector` | `Animal` | CreateTimer |
| GameScripts.dll | `HideInInspector` | `Animal` | ItemsCreated |
| GameScripts.dll | `HideInInspector` | `Apartment` | FreeSpace |
| GameScripts.dll | `HideInInspector` | `Apartment` | UsedSpace |
| GameScripts.dll | `HideInInspector` | `BaseVillager` | AteUncookedFood |
| GameScripts.dll | `HideInInspector` | `BoardBackground` | RectanglePackers |
| GameScripts.dll | `HideInInspector` | `Boosterpack` | TimesOpened |
| GameScripts.dll | `HideInInspector` | `Boosterpack` | WasClicked |
| GameScripts.dll | `HideInInspector` | `BoosterpackData` | nameOverride |
| GameScripts.dll | `HideInInspector` | `CardConnector` | ConnectedNode |
| GameScripts.dll | `HideInInspector` | `CardConnector` | ConnectedNodeUniqueId |
| GameScripts.dll | `HideInInspector` | `CardConnector` | Middle |
| GameScripts.dll | `HideInInspector` | `CardConnector` | MiddleVelo |
| GameScripts.dll | `HideInInspector` | `CardConnector` | Parent |
| GameScripts.dll | `HideInInspector` | `CardConnector` | UniqueId |
| GameScripts.dll | `HideInInspector` | `CardData` | CardUpdateType |
| GameScripts.dll | `HideInInspector` | `CardData` | CreationMonth |
| GameScripts.dll | `HideInInspector` | `CardData` | CustomName |
| GameScripts.dll | `HideInInspector` | `CardData` | DamageType |
| GameScripts.dll | `HideInInspector` | `CardData` | EquipmentHolderUniqueId |
| GameScripts.dll | `HideInInspector` | `CardData` | ExpectedValue |
| GameScripts.dll | `HideInInspector` | `CardData` | IsDamaged |
| GameScripts.dll | `HideInInspector` | `CardData` | IsFoil |
| GameScripts.dll | `HideInInspector` | `CardData` | IsOn |
| GameScripts.dll | `HideInInspector` | `CardData` | MyGameCard |
| GameScripts.dll | `HideInInspector` | `CardData` | OutputDir |
| GameScripts.dll | `HideInInspector` | `CardData` | ParentUniqueId |
| GameScripts.dll | `HideInInspector` | `CardData` | StatusEffects |
| GameScripts.dll | `HideInInspector` | `CardData` | UniqueId |
| GameScripts.dll | `HideInInspector` | `CardData` | WorkerHolderUniqueId |
| GameScripts.dll | `HideInInspector` | `CardData` | WorkerIndex |
| GameScripts.dll | `HideInInspector` | `CardData` | descriptionOverride |
| GameScripts.dll | `HideInInspector` | `CardData` | nameOverride |
| GameScripts.dll | `HideInInspector` | `CardopediaEntryElement` | MyCardData |
| GameScripts.dll | `HideInInspector` | `Chest` | CoinCount |
| GameScripts.dll | `HideInInspector` | `CitiesCombatable` | HousingUniqueId |
| GameScripts.dll | `HideInInspector` | `CitiesManager` | CityState |
| GameScripts.dll | `HideInInspector` | `CitiesManager` | DrawingConnector |
| GameScripts.dll | `HideInInspector` | `CitiesManager` | HomelessHousingConsumers |
| GameScripts.dll | `HideInInspector` | `CitiesManager` | HousingConsumers |
| GameScripts.dll | `HideInInspector` | `CitiesManager` | NextConflictMonth |
| GameScripts.dll | `HideInInspector` | `CitiesManager` | PreviousWellbeing |
| GameScripts.dll | `HideInInspector` | `CitiesManager` | WorkersOnBoard |
| GameScripts.dll | `HideInInspector` | `CitiesManager` | _wellbeing |
| GameScripts.dll | `HideInInspector` | `CityHall` | DollarAmount |
| GameScripts.dll | `HideInInspector` | `Combatable` | AttackIsHit |
| GameScripts.dll | `HideInInspector` | `Combatable` | AttackTargets |
| GameScripts.dll | `HideInInspector` | `Combatable` | AttackTimer |
| GameScripts.dll | `HideInInspector` | `Combatable` | Attacked |
| GameScripts.dll | `HideInInspector` | `Combatable` | BeingAttacked |
| GameScripts.dll | `HideInInspector` | `Combatable` | CurrentAttackType |
| GameScripts.dll | `HideInInspector` | `Combatable` | CurrentHitText |
| GameScripts.dll | `HideInInspector` | `Combatable` | InAttack |
| GameScripts.dll | `HideInInspector` | `Combatable` | InAttackTimer |
| GameScripts.dll | `HideInInspector` | `Combatable` | StunTimer |
| GameScripts.dll | `HideInInspector` | `Combatable` | isDead |
| GameScripts.dll | `HideInInspector` | `Conveyor` | Direction |
| GameScripts.dll | `HideInInspector` | `Creditcard` | DollarCount |
| GameScripts.dll | `HideInInspector` | `Demand` | FailedCards |
| GameScripts.dll | `HideInInspector` | `Demand` | SuccessCards |
| GameScripts.dll | `HideInInspector` | `DemandManager` | AllDemands |
| GameScripts.dll | `HideInInspector` | `Draggable` | ClickedObject |
| GameScripts.dll | `HideInInspector` | `Draggable` | DragStartPosition |
| GameScripts.dll | `HideInInspector` | `Draggable` | DragTag |
| GameScripts.dll | `HideInInspector` | `Draggable` | MinY |
| GameScripts.dll | `HideInInspector` | `Draggable` | MyBoard |
| GameScripts.dll | `HideInInspector` | `Draggable` | TargetPosition |
| GameScripts.dll | `HideInInspector` | `EnergyLogic` | HasEnergy |
| GameScripts.dll | `HideInInspector` | `EventCard` | ShouldStartEvent |
| GameScripts.dll | `HideInInspector` | `Farmland` | AmountHarvested |
| GameScripts.dll | `HideInInspector` | `FilteredJunction` | FilteredCard |
| GameScripts.dll | `HideInInspector` | `FontSetter` | LanguageOverride |
| GameScripts.dll | `HideInInspector` | `Food` | IsConsumed |
| GameScripts.dll | `HideInInspector` | `Food` | IsReserved |
| GameScripts.dll | `HideInInspector` | `Food` | SpoilTime |
| GameScripts.dll | `HideInInspector` | `FoodWarehouse` | HeldCardId |
| GameScripts.dll | `HideInInspector` | `GameBoard` | BoardPreset |
| GameScripts.dll | `HideInInspector` | `GameBoard` | MyMaterial |
| GameScripts.dll | `HideInInspector` | `GameBoard` | PackLineWidth |
| GameScripts.dll | `HideInInspector` | `GameBoard` | WorldSizeIncrease |
| GameScripts.dll | `HideInInspector` | `GameCamera` | TempSpiritBackgroundMaterial |
| GameScripts.dll | `HideInInspector` | `GameCard` | CardConnectorChildren |
| GameScripts.dll | `HideInInspector` | `GameCard` | Destroyed |
| GameScripts.dll | `HideInInspector` | `GameCard` | IsDemoCard |
| GameScripts.dll | `HideInInspector` | `GameCard` | IsHit |
| GameScripts.dll | `HideInInspector` | `GameCard` | PushEnabled |
| GameScripts.dll | `HideInInspector` | `GameCard` | SetY |
| GameScripts.dll | `HideInInspector` | `GameCard` | ShowSpecialIcon |
| GameScripts.dll | `HideInInspector` | `GameCard` | StackUpdate |
| GameScripts.dll | `HideInInspector` | `GameCard` | StatusEffectElements |
| GameScripts.dll | `HideInInspector` | `GameCard` | WasDestroyed |
| GameScripts.dll | `HideInInspector` | `GameCard` | closeToTargetPositionCallback |
| GameScripts.dll | `HideInInspector` | `GameCard` | removedChild |
| GameScripts.dll | `HideInInspector` | `HitText` | TargetCombatable |
| GameScripts.dll | `HideInInspector` | `IdeaElement` | MyKnowledge |
| GameScripts.dll | `HideInInspector` | `Landfill` | PollutionOverflow |
| GameScripts.dll | `HideInInspector` | `Landfill` | StoredPollution |
| GameScripts.dll | `HideInInspector` | `Mob` | CurrentTarget |
| GameScripts.dll | `HideInInspector` | `Mob` | MoveTimer |
| GameScripts.dll | `HideInInspector` | `Museum` | SavedGivenCardIds |
| GameScripts.dll | `HideInInspector` | `Projectile` | ShotBy |
| GameScripts.dll | `HideInInspector` | `Projectile` | StartPosition |
| GameScripts.dll | `HideInInspector` | `Projectile` | Target |
| GameScripts.dll | `HideInInspector` | `Projectile` | TargetPosition |
| GameScripts.dll | `HideInInspector` | `RectanglePacker` | PlacedSprites |
| GameScripts.dll | `HideInInspector` | `RecyclingCenter` | PollutionOverflow |
| GameScripts.dll | `HideInInspector` | `RecyclingCenter` | StoredPollution |
| GameScripts.dll | `HideInInspector` | `ResourceChest` | HeldCardId |
| GameScripts.dll | `HideInInspector` | `ResourceChest` | ResourceCount |
| GameScripts.dll | `HideInInspector` | `ResourceMagnet` | PullCardId |
| GameScripts.dll | `HideInInspector` | `Royal` | MoveTimer |
| GameScripts.dll | `HideInInspector` | `Screenshotter` | Descriptions |
| GameScripts.dll | `HideInInspector` | `SewerCard` | PoopTimer |
| GameScripts.dll | `HideInInspector` | `StatusEffectElement` | MyStatusEffect |
| GameScripts.dll | `HideInInspector` | `Subprint` | ParentBlueprint |
| GameScripts.dll | `HideInInspector` | `Subprint` | SubprintIndex |
| GameScripts.dll | `HideInInspector` | `Subprint` | statusOverride |
| GameScripts.dll | `HideInInspector` | `Tavern` | SavedGivenCardIds |
| GameScripts.dll | `HideInInspector` | `University` | CoinCount |
| GameScripts.dll | `HideInInspector` | `WishingWell` | CoinCount |
| GameScripts.dll | `HideInInspector` | `WishingWell` | WishCount |
| GameScripts.dll | `HideInInspector` | `Worker` | HousingUniqueId |
| GameScripts.dll | `HideInInspector` | `WorldManager` | AllCards |
| GameScripts.dll | `HideInInspector` | `WorldManager` | CardTargets |
| GameScripts.dll | `HideInInspector` | `WorldManager` | ContinueButtonIndex |
| GameScripts.dll | `HideInInspector` | `WorldManager` | ContinueClicked |
| GameScripts.dll | `HideInInspector` | `WorldManager` | CutsceneBoardView |
| GameScripts.dll | `HideInInspector` | `WorldManager` | DebugDontNeedVillagers |
| GameScripts.dll | `HideInInspector` | `WorldManager` | DebugEndlessMoonEnabled |
| GameScripts.dll | `HideInInspector` | `WorldManager` | DebugNoEnergyEnabled |
| GameScripts.dll | `HideInInspector` | `WorldManager` | DebugNoFoodEnabled |
| GameScripts.dll | `HideInInspector` | `WorldManager` | ForestMoonEnabled |
| GameScripts.dll | `HideInInspector` | `WorldManager` | UniqueIdToCard |
| GameScripts.dll | `HideInInspector` | `WorldManager` | grabOffset |
| GameScripts.dll | `HideInInspector` | `WorldManager` | mouseWorldPosition |
| GameScripts.dll | `RuntimeInitializeOnLoadMethod` | `SteamManager` | InitOnPlayMode |
| GameScripts.dll | `SerializeReference` | `BoosterAddition` | Filter |
| GameScripts.dll | `SerializeReference` | `CardData` | RequirementHolders |
| GameScripts.dll | `SerializeReference` | `RequirementHolder` | CardRequirements |
| GameScripts.dll | `SerializeReference` | `RequirementHolder` | NegativeResults |
| GameScripts.dll | `SerializeReference` | `RequirementHolder` | PositiveResults |
| GameScripts.dll | `SerializeReference` | `ScriptableCutscene` | CutsceneSteps |
| GameScripts.dll | `SerializeReference` | `SetCardBagData` | Filter |
| Assembly-CSharp-firstpass.dll | `SerializeField` | `DropdownSample` | dropdownWithPlaceholder |
| Assembly-CSharp-firstpass.dll | `SerializeField` | `DropdownSample` | dropdownWithoutPlaceholder |
| Assembly-CSharp-firstpass.dll | `SerializeField` | `DropdownSample` | text |
| Assembly-CSharp-firstpass.dll | `SerializeField` | `TMPro.TMP_TextEventHandler` | m_OnCharacterSelection |
| Assembly-CSharp-firstpass.dll | `SerializeField` | `TMPro.TMP_TextEventHandler` | m_OnLineSelection |
| Assembly-CSharp-firstpass.dll | `SerializeField` | `TMPro.TMP_TextEventHandler` | m_OnLinkSelection |
| Assembly-CSharp-firstpass.dll | `SerializeField` | `TMPro.TMP_TextEventHandler` | m_OnSpriteSelection |
| Assembly-CSharp-firstpass.dll | `SerializeField` | `TMPro.TMP_TextEventHandler` | m_OnWordSelection |

## 3. 全部特性频率（含编译器/自研/第三方）

| 程序集 | 特性 | 次数 |
|---|---|---:|
| GameScripts.dll | `DebuggerHidden` | 547 |
| GameScripts.dll | `CompilerGenerated` | 530 |
| GameScripts.dll | `HideInInspector` | 140 |
| GameScripts.dll | `IteratorStateMachine` | 109 |
| GameScripts.dll | `ExtraData` | 63 |
| GameScripts.dll | `TimedAction` | 53 |
| GameScripts.dll | `Header` | 33 |
| GameScripts.dll | `Extension` | 28 |
| GameScripts.dll | `Card` | 28 |
| GameScripts.dll | `Term` | 20 |
| GameScripts.dll | `SerializeReference` | 7 |
| GameScripts.dll | `ParamArray` | 7 |
| GameScripts.dll | `AttributeUsage` | 5 |
| GameScripts.dll | `CreateAssetMenu` | 5 |
| GameScripts.dll | `Embedded` | 3 |
| GameScripts.dll | `ExecuteAlways` | 3 |
| GameScripts.dll | `TupleElementNames` | 2 |
| GameScripts.dll | `CompilationRelaxations` | 1 |
| GameScripts.dll | `RuntimeCompatibility` | 1 |
| GameScripts.dll | `Debuggable` | 1 |
| GameScripts.dll | `ExecuteInEditMode` | 1 |
| GameScripts.dll | `Flags` | 1 |
| GameScripts.dll | `DisallowMultipleComponent` | 1 |
| GameScripts.dll | `EditorBrowsable` | 1 |
| GameScripts.dll | `GeneratedCode` | 1 |
| GameScripts.dll | `JsonExtensionData` | 1 |
| GameScripts.dll | `MonoPInvokeCallback` | 1 |
| GameScripts.dll | `RuntimeInitializeOnLoadMethod` | 1 |
| GameScripts.dll | `NullableContext` | 1 |
| GameScripts.dll | `Nullable` | 1 |

| Assembly-CSharp.dll | `CompilerGenerated` | 3 |
| Assembly-CSharp.dll | `CompilationRelaxations` | 1 |
| Assembly-CSharp.dll | `RuntimeCompatibility` | 1 |
| Assembly-CSharp.dll | `Debuggable` | 1 |
| Assembly-CSharp.dll | `EditorBrowsable` | 1 |
| Assembly-CSharp.dll | `GeneratedCode` | 1 |

| Assembly-CSharp-firstpass.dll | `DebuggerHidden` | 80 |
| Assembly-CSharp-firstpass.dll | `CompilerGenerated` | 19 |
| Assembly-CSharp-firstpass.dll | `IteratorStateMachine` | 16 |
| Assembly-CSharp-firstpass.dll | `SerializeField` | 8 |
| Assembly-CSharp-firstpass.dll | `CompilationRelaxations` | 1 |
| Assembly-CSharp-firstpass.dll | `RuntimeCompatibility` | 1 |
| Assembly-CSharp-firstpass.dll | `Debuggable` | 1 |
| Assembly-CSharp-firstpass.dll | `EditorBrowsable` | 1 |
| Assembly-CSharp-firstpass.dll | `GeneratedCode` | 1 |

| csS.dll | `CompilerGenerated` | 29 |
| csS.dll | `Conditional` | 2 |
| csS.dll | `AttributeUsage` | 2 |
| csS.dll | `CompilationRelaxations` | 1 |
| csS.dll | `RuntimeCompatibility` | 1 |
| csS.dll | `Debuggable` | 1 |
| csS.dll | `EditorBrowsable` | 1 |
| csS.dll | `GeneratedCode` | 1 |

