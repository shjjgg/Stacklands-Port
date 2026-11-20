# 阶段语义自证（DXBC 输出签名 ↔ 阶段标注）

- 程序 504，通过 504，失败 0
- 阶段分布: PS 224 / VS 280

> 判据（与 SHDR token 无关，独立证伪）：
> VS 必须写 `SV_Position` 且不写像素输出；PS 必须写 `SV_Target*`/`SV_Depth` 且不写 `SV_Position`；VS 必须有 ISGN。

| 文件 | 阶段 | 输出语义 | ok |
|---|---|---|---|
| Custom__ArrowSdfShader__00_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__ArrowSdfShader__01_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__ArrowSdfShader__02_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__ArrowSdfShader__03_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__ArrowSdfShader__04_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__ArrowSdfShader__05_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__ArrowSdfShader__06_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | ✓ |
| Custom__ArrowSdfShader__07_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__ArrowSdfShader__08_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__ArrowSdfShader__09_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__ArrowSdfShader__10_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__ArrowSdfShader__11_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__ArrowSdfShader__12_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__ArrowSdfShader__13_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__ArrowSdfShader__14_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__BoosterShaderTop__00_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__BoosterShaderTop__01_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__BoosterShaderTop__02_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__BoosterShaderTop__03_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__BoosterShaderTop__04_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__BoosterShaderTop__05_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__BoosterShaderTop__06_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__BoosterShaderTop__07_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__BoosterShaderTop__08_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__BoosterShaderTop__09_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__BoosterShaderTop__10_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__BoosterShaderTop__11_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__BoosterShaderTop__12_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__BoosterShaderTop__13_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__BoosterShaderTop__14_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__BoosterShaderTop__15_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__BoosterShaderTop__16_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__BoosterShaderTop__17_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__BoosterShaderTop__18_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__BoosterShaderTop__19_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__BoosterShaderTop__20_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__BoosterShaderTop__21_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__BoosterShaderTop__22_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__BoosterShaderTop__23_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__BoosterShaderTop__24_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__BoosterShaderTop__25_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__BoosterShaderTop__26_PS.dxbc | PS | SV_TARGET | SV_TARGET | SV_TARGET | SV_TARGET | ✓ |
| Custom__BoosterShaderTop__27_PS.dxbc | PS | SV_TARGET | SV_TARGET | SV_TARGET | SV_TARGET | ✓ |
| Custom__BoosterShaderTop__28_PS.dxbc | PS | SV_TARGET | SV_TARGET | SV_TARGET | SV_TARGET | ✓ |
| Custom__BoosterShaderTop__29_PS.dxbc | PS | SV_TARGET | SV_TARGET | SV_TARGET | SV_TARGET | ✓ |
| Custom__BoosterShaderTop__30_VS.dxbc | VS | SV_POSITION | TEXCOORD | ✓ |
| Custom__BoosterShaderTop__31_VS.dxbc | VS | SV_POSITION | TEXCOORD | ✓ |
| Custom__BoosterShaderTop__32_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__BoosterShaderTop__33_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__BoosterShader__00_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__BoosterShader__01_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__BoosterShader__02_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__BoosterShader__03_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__BoosterShader__04_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__BoosterShader__05_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__BoosterShader__06_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__BoosterShader__07_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__BoosterShader__08_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__BoosterShader__09_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__BoosterShader__10_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__BoosterShader__11_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__BoosterShader__12_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__BoosterShader__13_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__BoosterShader__14_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__BoosterShader__15_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__BoosterShader__16_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__BoosterShader__17_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__BoosterShader__18_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__BoosterShader__19_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__BoosterShader__20_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__BoosterShader__21_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__BoosterShader__22_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__BoosterShader__23_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__BoosterShader__24_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__BoosterShader__25_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__BoosterShader__26_PS.dxbc | PS | SV_TARGET | SV_TARGET | SV_TARGET | SV_TARGET | ✓ |
| Custom__BoosterShader__27_PS.dxbc | PS | SV_TARGET | SV_TARGET | SV_TARGET | SV_TARGET | ✓ |
| Custom__BoosterShader__28_PS.dxbc | PS | SV_TARGET | SV_TARGET | SV_TARGET | SV_TARGET | ✓ |
| Custom__BoosterShader__29_PS.dxbc | PS | SV_TARGET | SV_TARGET | SV_TARGET | SV_TARGET | ✓ |
| Custom__BoosterShader__30_VS.dxbc | VS | SV_POSITION | TEXCOORD | ✓ |
| Custom__BoosterShader__31_VS.dxbc | VS | SV_POSITION | TEXCOORD | ✓ |
| Custom__BoosterShader__32_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__BoosterShader__33_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__CardBackShader__00_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__CardBackShader__01_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__CardBackShader__02_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__CardBackShader__03_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__CardBackShader__04_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__CardBackShader__05_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__CardBackShader__06_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__CardBackShader__07_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__CardBackShader__08_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | SV_INSTANCEID | ✓ |
| Custom__CardBackShader__09_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | SV_INSTANCEID | ✓ |
| Custom__CardBackShader__10_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | SV_INSTANCEID | ✓ |
| Custom__CardBackShader__11_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | SV_INSTANCEID | ✓ |
| Custom__CardBackShader__12_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | SV_INSTANCEID | ✓ |
| Custom__CardBackShader__13_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | SV_INSTANCEID | ✓ |
| Custom__CardBackShader__14_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | SV_INSTANCEID | ✓ |
| Custom__CardBackShader__15_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | SV_INSTANCEID | ✓ |
| Custom__CardBackShader__16_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__CardBackShader__17_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__CardBackShader__18_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__CardBackShader__19_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__CardBackShader__20_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__CardBackShader__21_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__CardBackShader__22_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__CardBackShader__23_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__CardBackShader__24_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__CardBackShader__25_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__CardBackShader__26_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__CardBackShader__27_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__CardBackShader__28_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__CardBackShader__29_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__CardBackShader__30_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__CardBackShader__31_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__CardBackShader__32_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__CardBackShader__33_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__CardBackShader__34_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__CardBackShader__35_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__CardBackShader__36_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__CardBackShader__37_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__CardBackShader__38_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__CardBackShader__39_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__CardBackShader__40_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__CardBackShader__41_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__CardBackShader__42_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__CardBackShader__43_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__CardBackShader__44_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__CardBackShader__45_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__CardBackShader__46_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__CardBackShader__47_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__CardBackShader__48_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__CardBackShader__49_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__CardBackShader__50_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__CardBackShader__51_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__CardBackShader__52_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__CardBackShader__53_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__CardBackShader__54_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | SV_INSTANCEID | ✓ |
| Custom__CardBackShader__55_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | SV_INSTANCEID | ✓ |
| Custom__CardBackShader__56_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | SV_INSTANCEID | ✓ |
| Custom__CardBackShader__57_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | SV_INSTANCEID | ✓ |
| Custom__CardBackShader__58_PS.dxbc | PS | SV_TARGET | SV_TARGET | SV_TARGET | SV_TARGET | ✓ |
| Custom__CardBackShader__59_PS.dxbc | PS | SV_TARGET | SV_TARGET | SV_TARGET | SV_TARGET | ✓ |
| Custom__CardBackShader__60_PS.dxbc | PS | SV_TARGET | SV_TARGET | SV_TARGET | SV_TARGET | ✓ |
| Custom__CardBackShader__61_PS.dxbc | PS | SV_TARGET | SV_TARGET | SV_TARGET | SV_TARGET | ✓ |
| Custom__CardBackShader__62_PS.dxbc | PS | SV_TARGET | SV_TARGET | SV_TARGET | SV_TARGET | ✓ |
| Custom__CardBackShader__63_PS.dxbc | PS | SV_TARGET | SV_TARGET | SV_TARGET | SV_TARGET | ✓ |
| Custom__CardBackShader__64_PS.dxbc | PS | SV_TARGET | SV_TARGET | SV_TARGET | SV_TARGET | ✓ |
| Custom__CardBackShader__65_PS.dxbc | PS | SV_TARGET | SV_TARGET | SV_TARGET | SV_TARGET | ✓ |
| Custom__CardShaderTest__00_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__CardShaderTest__01_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__CardShaderTest__02_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__CardShaderTest__03_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__CardShaderTest__04_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__CardShaderTest__05_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__CardShaderTest__06_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__CardShaderTest__07_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__CardShaderTest__08_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | SV_INSTANCEID | ✓ |
| Custom__CardShaderTest__09_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | SV_INSTANCEID | ✓ |
| Custom__CardShaderTest__10_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | SV_INSTANCEID | ✓ |
| Custom__CardShaderTest__11_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | SV_INSTANCEID | ✓ |
| Custom__CardShaderTest__12_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | SV_INSTANCEID | ✓ |
| Custom__CardShaderTest__13_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | SV_INSTANCEID | ✓ |
| Custom__CardShaderTest__14_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | SV_INSTANCEID | ✓ |
| Custom__CardShaderTest__15_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | SV_INSTANCEID | ✓ |
| Custom__CardShaderTest__16_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__CardShaderTest__17_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__CardShaderTest__18_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__CardShaderTest__19_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__CardShaderTest__20_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__CardShaderTest__21_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__CardShaderTest__22_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__CardShaderTest__23_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__CardShaderTest__24_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__CardShaderTest__25_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__CardShaderTest__26_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__CardShaderTest__27_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__CardShaderTest__28_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__CardShaderTest__29_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__CardShaderTest__30_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__CardShaderTest__31_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__CardShaderTest__32_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__CardShaderTest__33_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__CardShaderTest__34_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__CardShaderTest__35_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__CardShaderTest__36_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__CardShaderTest__37_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__CardShaderTest__38_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | SV_INSTANCEID | ✓ |
| Custom__CardShaderTest__39_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | SV_INSTANCEID | ✓ |
| Custom__CardShaderTest__40_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | SV_INSTANCEID | ✓ |
| Custom__CardShaderTest__41_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | SV_INSTANCEID | ✓ |
| Custom__CardShaderTest__42_PS.dxbc | PS | SV_TARGET | SV_TARGET | SV_TARGET | SV_TARGET | ✓ |
| Custom__CardShaderTest__43_PS.dxbc | PS | SV_TARGET | SV_TARGET | SV_TARGET | SV_TARGET | ✓ |
| Custom__CardShaderTest__44_PS.dxbc | PS | SV_TARGET | SV_TARGET | SV_TARGET | SV_TARGET | ✓ |
| Custom__CardShaderTest__45_PS.dxbc | PS | SV_TARGET | SV_TARGET | SV_TARGET | SV_TARGET | ✓ |
| Custom__CardShaderTest__46_PS.dxbc | PS | SV_TARGET | SV_TARGET | SV_TARGET | SV_TARGET | ✓ |
| Custom__CardShaderTest__47_PS.dxbc | PS | SV_TARGET | SV_TARGET | SV_TARGET | SV_TARGET | ✓ |
| Custom__CardShaderTest__48_PS.dxbc | PS | SV_TARGET | SV_TARGET | SV_TARGET | SV_TARGET | ✓ |
| Custom__CardShaderTest__49_PS.dxbc | PS | SV_TARGET | SV_TARGET | SV_TARGET | SV_TARGET | ✓ |
| Custom__CardShaderTest__50_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | ✓ |
| Custom__CardShaderTest__51_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | ✓ |
| Custom__CardShaderTest__52_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | SV_INSTANCEID | ✓ |
| Custom__CardShaderTest__53_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | SV_INSTANCEID | ✓ |
| Custom__CardShaderTest__54_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__CardShaderTest__55_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__CardShaderTest__56_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__CardShaderTest__57_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__ConflictOutlineSdfShader__00_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__ConflictOutlineSdfShader__01_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__ConflictOutlineSdfShader__02_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__ConflictOutlineSdfShader__03_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__ConflictOutlineSdfShader__04_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__ConflictOutlineSdfShader__05_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__ConflictOutlineSdfShader__06_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | ✓ |
| Custom__ConflictOutlineSdfShader__07_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__ConflictOutlineSdfShader__08_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__ConflictOutlineSdfShader__09_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__ConflictOutlineSdfShader__10_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__ConflictOutlineSdfShader__11_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__ConflictOutlineSdfShader__12_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__ConflictOutlineSdfShader__13_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__ConflictOutlineSdfShader__14_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__ConveyorArrowShader__00_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__ConveyorArrowShader__01_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__ConveyorArrowShader__02_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__ConveyorArrowShader__03_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__ConveyorArrowShader__04_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__ConveyorArrowShader__05_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__ConveyorArrowShader__06_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | ✓ |
| Custom__ConveyorArrowShader__07_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__ConveyorArrowShader__08_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__ConveyorArrowShader__09_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__ConveyorArrowShader__10_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__ConveyorArrowShader__11_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__ConveyorArrowShader__12_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__ConveyorArrowShader__13_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__ConveyorArrowShader__14_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__EnergyCableShader__00_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__EnergyCableShader__01_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__EnergyCableShader__02_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__EnergyCableShader__03_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__EnergyCableShader__04_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__EnergyCableShader__05_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__EnergyCableShader__06_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | ✓ |
| Custom__EnergyCableShader__07_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__EnergyCableShader__08_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__EnergyCableShader__09_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__EnergyCableShader__10_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__EnergyCableShader__11_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__EnergyCableShader__12_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__EnergyCableShader__13_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__EnergyCableShader__14_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__FloorShaderForest__00_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__FloorShaderForest__01_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__FloorShaderForest__02_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__FloorShaderForest__03_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__FloorShaderForest__04_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__FloorShaderForest__05_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__FloorShaderForest__06_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__FloorShaderForest__07_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__FloorShaderForest__08_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__FloorShaderForest__09_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__FloorShaderForest__10_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__FloorShaderForest__11_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__FloorShaderForest__12_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__FloorShaderForest__13_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__FloorShaderForest__14_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__FloorShaderForest__15_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__FloorShaderForest__16_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__FloorShaderForest__17_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__FloorShaderForest__18_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__FloorShaderForest__19_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__FloorShaderForest__20_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__FloorShaderForest__21_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__FloorShaderIsland__00_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__FloorShaderIsland__01_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__FloorShaderIsland__02_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__FloorShaderIsland__03_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__FloorShaderIsland__04_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__FloorShaderIsland__05_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__FloorShaderIsland__06_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__FloorShaderIsland__07_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__FloorShaderIsland__08_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__FloorShaderIsland__09_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__FloorShaderIsland__10_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__FloorShaderIsland__11_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__FloorShaderIsland__12_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__FloorShaderIsland__13_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__FloorShaderIsland__14_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__FloorShaderIsland__15_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__FloorShaderIsland__16_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__FloorShaderIsland__17_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__FloorShaderIsland__18_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__FloorShaderIsland__19_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__FloorShaderIsland__20_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__FloorShaderIsland__21_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__FloorShader__00_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__FloorShader__01_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__FloorShader__02_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__FloorShader__03_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__FloorShader__04_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__FloorShader__05_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__FloorShader__06_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__FloorShader__07_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__FloorShader__08_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__FloorShader__09_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__FloorShader__10_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__FloorShader__11_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__FloorShader__12_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__FloorShader__13_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__FloorShader__14_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__FloorShader__15_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__FloorShader__16_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__FloorShader__17_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__FloorShader__18_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__FloorShader__19_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__FloorShader__20_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__FloorShader__21_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__GenericCardShader__00_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__GenericCardShader__01_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__GenericCardShader__02_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__GenericCardShader__03_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__GenericCardShader__04_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__GenericCardShader__05_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__GenericCardShader__06_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__GenericCardShader__07_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__GenericCardShader__08_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | SV_INSTANCEID | ✓ |
| Custom__GenericCardShader__09_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | SV_INSTANCEID | ✓ |
| Custom__GenericCardShader__10_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | SV_INSTANCEID | ✓ |
| Custom__GenericCardShader__11_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | SV_INSTANCEID | ✓ |
| Custom__GenericCardShader__12_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | SV_INSTANCEID | ✓ |
| Custom__GenericCardShader__13_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | SV_INSTANCEID | ✓ |
| Custom__GenericCardShader__14_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | SV_INSTANCEID | ✓ |
| Custom__GenericCardShader__15_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | SV_INSTANCEID | ✓ |
| Custom__GenericCardShader__16_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__GenericCardShader__17_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__GenericCardShader__18_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__GenericCardShader__19_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__GenericCardShader__20_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__GenericCardShader__21_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__GenericCardShader__22_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__GenericCardShader__23_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__GenericCardShader__24_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__GenericCardShader__25_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__GenericCardShader__26_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__GenericCardShader__27_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__GenericCardShader__28_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__GenericCardShader__29_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__GenericCardShader__30_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__GenericCardShader__31_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__GenericCardShader__32_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__GenericCardShader__33_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__GenericCardShader__34_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__GenericCardShader__35_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__GenericCardShader__36_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__GenericCardShader__37_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__GenericCardShader__38_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | SV_INSTANCEID | ✓ |
| Custom__GenericCardShader__39_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | SV_INSTANCEID | ✓ |
| Custom__GenericCardShader__40_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | SV_INSTANCEID | ✓ |
| Custom__GenericCardShader__41_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | SV_INSTANCEID | ✓ |
| Custom__GenericCardShader__42_PS.dxbc | PS | SV_TARGET | SV_TARGET | SV_TARGET | SV_TARGET | ✓ |
| Custom__GenericCardShader__43_PS.dxbc | PS | SV_TARGET | SV_TARGET | SV_TARGET | SV_TARGET | ✓ |
| Custom__GenericCardShader__44_PS.dxbc | PS | SV_TARGET | SV_TARGET | SV_TARGET | SV_TARGET | ✓ |
| Custom__GenericCardShader__45_PS.dxbc | PS | SV_TARGET | SV_TARGET | SV_TARGET | SV_TARGET | ✓ |
| Custom__GenericCardShader__46_PS.dxbc | PS | SV_TARGET | SV_TARGET | SV_TARGET | SV_TARGET | ✓ |
| Custom__GenericCardShader__47_PS.dxbc | PS | SV_TARGET | SV_TARGET | SV_TARGET | SV_TARGET | ✓ |
| Custom__GenericCardShader__48_PS.dxbc | PS | SV_TARGET | SV_TARGET | SV_TARGET | SV_TARGET | ✓ |
| Custom__GenericCardShader__49_PS.dxbc | PS | SV_TARGET | SV_TARGET | SV_TARGET | SV_TARGET | ✓ |
| Custom__GenericCardShader__50_VS.dxbc | VS | SV_POSITION | TEXCOORD | ✓ |
| Custom__GenericCardShader__51_VS.dxbc | VS | SV_POSITION | TEXCOORD | ✓ |
| Custom__GenericCardShader__52_VS.dxbc | VS | SV_POSITION | TEXCOORD | SV_INSTANCEID | ✓ |
| Custom__GenericCardShader__53_VS.dxbc | VS | SV_POSITION | TEXCOORD | SV_INSTANCEID | ✓ |
| Custom__GenericCardShader__54_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__GenericCardShader__55_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__GenericCardShader__56_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__GenericCardShader__57_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__GridShader__00_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__GridShader__01_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__GridShader__02_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__GridShader__03_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__GridShader__04_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__GridShader__05_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__GridShader__06_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | ✓ |
| Custom__GridShader__07_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__GridShader__08_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__GridShader__09_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__GridShader__10_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__GridShader__11_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__GridShader__12_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__GridShader__13_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__GridShader__14_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__SewerPipeShader__00_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__SewerPipeShader__01_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__SewerPipeShader__02_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__SewerPipeShader__03_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__SewerPipeShader__04_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__SewerPipeShader__05_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__SewerPipeShader__06_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | ✓ |
| Custom__SewerPipeShader__07_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__SewerPipeShader__08_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__SewerPipeShader__09_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__SewerPipeShader__10_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__SewerPipeShader__11_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__SewerPipeShader__12_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__SewerPipeShader__13_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__SewerPipeShader__14_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__SpiritImageEffect__00_VS.dxbc | VS | TEXCOORD | SV_POSITION | ✓ |
| Custom__SpiritImageEffect__01_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__SpiritTransitionEffect__00_VS.dxbc | VS | TEXCOORD | SV_POSITION | ✓ |
| Custom__SpiritTransitionEffect__01_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__StatusBar__00_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__StatusBar__01_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__StatusBar__02_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__StatusBar__03_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__StatusBar__04_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__StatusBar__05_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__StatusBar__06_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__StatusBar__07_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__StatusBar__08_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__StatusBar__09_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__StatusBar__10_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__StatusBar__11_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__StatusBar__12_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__StatusBar__13_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__StatusBar__14_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__StatusBar__15_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__StatusBar__16_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__StatusBar__17_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__StatusBar__18_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__StatusBar__19_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__StatusBar__20_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__StatusBar__21_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__StatusBar__22_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__StatusBar__23_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__StatusBar__24_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__StatusBar__25_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__StatusBar__26_PS.dxbc | PS | SV_TARGET | SV_TARGET | SV_TARGET | SV_TARGET | ✓ |
| Custom__StatusBar__27_PS.dxbc | PS | SV_TARGET | SV_TARGET | SV_TARGET | SV_TARGET | ✓ |
| Custom__StatusBar__28_PS.dxbc | PS | SV_TARGET | SV_TARGET | SV_TARGET | SV_TARGET | ✓ |
| Custom__StatusBar__29_PS.dxbc | PS | SV_TARGET | SV_TARGET | SV_TARGET | SV_TARGET | ✓ |
| Custom__StatusBar__30_VS.dxbc | VS | SV_POSITION | TEXCOORD | ✓ |
| Custom__StatusBar__31_VS.dxbc | VS | SV_POSITION | TEXCOORD | ✓ |
| Custom__StatusBar__32_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__StatusBar__33_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__SuperSampled_Texture__00_VS.dxbc | VS | SV_POSITION | TEXCOORD | COLOR | ✓ |
| Custom__SuperSampled_Texture__01_VS.dxbc | VS | SV_POSITION | TEXCOORD | COLOR | ✓ |
| Custom__SuperSampled_Texture__02_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__SuperSampled_Texture__03_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__TransportArrowMainlandShader__00_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__TransportArrowMainlandShader__01_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__TransportArrowMainlandShader__02_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__TransportArrowMainlandShader__03_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__TransportArrowMainlandShader__04_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__TransportArrowMainlandShader__05_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__TransportArrowMainlandShader__06_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | ✓ |
| Custom__TransportArrowMainlandShader__07_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__TransportArrowMainlandShader__08_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__TransportArrowMainlandShader__09_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__TransportArrowMainlandShader__10_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__TransportArrowMainlandShader__11_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__TransportArrowMainlandShader__12_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__TransportArrowMainlandShader__13_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__TransportArrowMainlandShader__14_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__TransportArrowShader__00_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__TransportArrowShader__01_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__TransportArrowShader__02_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__TransportArrowShader__03_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__TransportArrowShader__04_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__TransportArrowShader__05_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__TransportArrowShader__06_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | ✓ |
| Custom__TransportArrowShader__07_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__TransportArrowShader__08_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__TransportArrowShader__09_VS.dxbc | VS | SV_POSITION | TEXCOORD | TEXCOORD | TEXCOORD | ✓ |
| Custom__TransportArrowShader__10_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__TransportArrowShader__11_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__TransportArrowShader__12_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__TransportArrowShader__13_PS.dxbc | PS | SV_TARGET | ✓ |
| Custom__TransportArrowShader__14_PS.dxbc | PS | SV_TARGET | ✓ |
| Postprocess__SokpopIntro__00_VS.dxbc | VS | TEXCOORD | SV_POSITION | ✓ |
| Postprocess__SokpopIntro__01_PS.dxbc | PS | SV_TARGET | ✓ |
| Sprites__BackgroundShader__00_VS.dxbc | VS | SV_POSITION | COLOR | TEXCOORD | ✓ |
| Sprites__BackgroundShader__01_PS.dxbc | PS | SV_TARGET | ✓ |
| Sprites__CombatCircleSpriteShader2__00_VS.dxbc | VS | SV_POSITION | COLOR | TEXCOORD | ✓ |
| Sprites__CombatCircleSpriteShader2__01_VS.dxbc | VS | SV_POSITION | COLOR | TEXCOORD | ✓ |
| Sprites__CombatCircleSpriteShader2__02_PS.dxbc | PS | SV_TARGET | ✓ |
| Sprites__CombatCircleSpriteShader2__03_PS.dxbc | PS | SV_TARGET | ✓ |
| Sprites__SpriteOnTop__00_VS.dxbc | VS | SV_POSITION | COLOR | TEXCOORD | ✓ |
| Sprites__SpriteOnTop__01_VS.dxbc | VS | SV_POSITION | COLOR | TEXCOORD | ✓ |
| Sprites__SpriteOnTop__02_PS.dxbc | PS | SV_TARGET | ✓ |
| Sprites__SpriteOnTop__03_PS.dxbc | PS | SV_TARGET | ✓ |
| Sprites__StatusEffectSpriteShader__00_VS.dxbc | VS | SV_POSITION | COLOR | TEXCOORD | ✓ |
| Sprites__StatusEffectSpriteShader__01_VS.dxbc | VS | SV_POSITION | COLOR | TEXCOORD | ✓ |
| Sprites__StatusEffectSpriteShader__02_PS.dxbc | PS | SV_TARGET | ✓ |
| Sprites__StatusEffectSpriteShader__03_PS.dxbc | PS | SV_TARGET | ✓ |
| Transition__Cities__00_VS.dxbc | VS | SV_POSITION | COLOR | TEXCOORD | TEXCOORD | ✓ |
| Transition__Cities__01_PS.dxbc | PS | SV_TARGET | ✓ |
| Transition__Default__00_VS.dxbc | VS | SV_POSITION | COLOR | TEXCOORD | TEXCOORD | ✓ |
| Transition__Default__01_PS.dxbc | PS | SV_TARGET | ✓ |
| Transition__Energy__00_VS.dxbc | VS | SV_POSITION | COLOR | TEXCOORD | TEXCOORD | ✓ |
| Transition__Energy__01_PS.dxbc | PS | SV_TARGET | ✓ |
| Transition__Spirit__00_VS.dxbc | VS | SV_POSITION | COLOR | TEXCOORD | TEXCOORD | ✓ |
| Transition__Spirit__01_PS.dxbc | PS | SV_TARGET | ✓ |
| Unlit__CardopediaBackgroundShader__00_VS.dxbc | VS | TEXCOORD | SV_POSITION | TEXCOORD | ✓ |
| Unlit__CardopediaBackgroundShader__01_PS.dxbc | PS | SV_TARGET | ✓ |
