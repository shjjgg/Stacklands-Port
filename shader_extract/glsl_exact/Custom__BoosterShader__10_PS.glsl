#version 450
#extension GL_EXT_buffer_reference2 : require
#extension GL_EXT_spirv_intrinsics : require

layout(set = 0, binding = 0, std140) uniform cb0_buf
{
    uvec4 _m0;
    uvec4 _m1;
    vec3 _m2;
    uint _m3;
    uvec4 _m4;
    vec4 _m5;
    vec3 _m6;
    uint _m7;
    vec3 _m8;
    uint _m9;
    uvec4 _m10;
    vec3 _m11;
    uint _m12;
} cb0;

layout(set = 0, binding = 1, std140) uniform cb1_buf
{
    uvec4 _m0;
    uvec4 _m1;
    uvec4 _m2;
    uvec4 _m3;
    vec3 _m4;
    uint _m5;
} cb1;

layout(set = 0, binding = 2, std140) uniform cb2_buf
{
    vec3 _m0;
    uint _m1;
    uvec4 _m2;
    uvec4 _m3;
    uvec4 _m4;
    uvec4 _m5;
    uvec4 _m6;
    uvec4 _m7;
    uvec4 _m8;
    uvec4 _m9;
    uvec4 _m10;
    uvec4 _m11;
    uvec4 _m12;
    uvec4 _m13;
    uvec4 _m14;
    uvec4 _m15;
    uvec4 _m16;
    uvec4 _m17;
    uvec4 _m18;
    uvec4 _m19;
    uvec4 _m20;
    uvec4 _m21;
    uvec4 _m22;
    uvec4 _m23;
    uvec4 _m24;
    uvec4 _m25;
    uvec4 _m26;
    uvec4 _m27;
    uvec4 _m28;
    uvec4 _m29;
    uvec4 _m30;
    uvec4 _m31;
    uvec4 _m32;
    uvec4 _m33;
    uvec4 _m34;
    uvec4 _m35;
    uvec4 _m36;
    uvec4 _m37;
    uvec4 _m38;
    uvec4 _m39;
    uvec4 _m40;
    uvec4 _m41;
    uvec4 _m42;
    uvec4 _m43;
    uvec4 _m44;
    uvec4 _m45;
    uvec4 _m46;
    vec4 _m47;
} cb2;

layout(set = 0, binding = 3, std140) uniform cb3_buf
{
    uvec4 _m0;
    uvec4 _m1;
    uvec4 _m2;
    uvec4 _m3;
    uvec4 _m4;
    uvec4 _m5;
    uvec4 _m6;
    uvec4 _m7;
    uvec4 _m8;
    uvec4 _m9;
    uvec4 _m10;
    uvec4 _m11;
    uvec4 _m12;
    uvec4 _m13;
    uvec4 _m14;
    uvec4 _m15;
    uvec4 _m16;
    uvec4 _m17;
    uvec4 _m18;
    uvec4 _m19;
    uvec4 _m20;
    uvec4 _m21;
    uvec4 _m22;
    uvec4 _m23;
    vec4 _m24;
    vec3 _m25;
    float _m26;
} cb3;

layout(set = 0, binding = 4, std140) uniform cb4_buf
{
    uvec4 _m0;
    uvec4 _m1;
    uvec4 _m2;
    uvec4 _m3;
    uvec4 _m4;
    uvec4 _m5;
    uvec4 _m6;
    uvec4 _m7;
    uvec4 _m8;
    vec4 _m9;
    vec4 _m10;
    vec4 _m11;
} cb4;

layout(set = 0, binding = 5, std140) uniform cb5_buf
{
    vec3 _m0;
    uint _m1;
    vec3 _m2;
    float _m3;
    vec3 _m4;
    float _m5;
    vec4 _m6;
    vec3 _m7;
    uint _m8;
    vec3 _m9;
    uint _m10;
    vec3 _m11;
    float _m12;
    vec4 _m13;
} cb5;

layout(set = 0, binding = 6, std140) uniform cb6_buf
{
    vec4 _m0;
    vec3 _m1;
    uint _m2;
    vec3 _m3;
    uint _m4;
    vec3 _m5;
    uint _m6;
    vec3 _m7;
    uint _m8;
    vec3 _m9;
    uint _m10;
    vec3 _m11;
    uint _m12;
} cb6;

layout(set = 0, binding = 7) uniform sampler s0;
layout(set = 0, binding = 8) uniform sampler s1;
layout(set = 0, binding = 9) uniform sampler s2;
layout(set = 0, binding = 10) uniform sampler s3;
layout(set = 0, binding = 11) uniform sampler s4;
layout(set = 0, binding = 12) uniform texture2D t0;
layout(set = 0, binding = 13) uniform texture2D t1;
layout(set = 0, binding = 14) uniform texture2D t2;
layout(set = 0, binding = 15) uniform textureCube t3;
layout(set = 0, binding = 16) uniform textureCube t4;
layout(set = 0, binding = 17) uniform texture3D t5;

layout(location = 1, component = 0) in vec2 TEXCOORD;
layout(location = 2, component = 0) in vec3 TEXCOORD1;
layout(location = 3, component = 0) in vec3 TEXCOORD2;
layout(location = 4, component = 0) in vec4 TEXCOORD5;
layout(location = 0, component = 0) out vec4 SV_Target;

spirv_instruction(set = "GLSL.std.450", id = 79) float spvNMin(float, float);
spirv_instruction(set = "GLSL.std.450", id = 79) vec2 spvNMin(vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 79) vec3 spvNMin(vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 79) vec4 spvNMin(vec4, vec4);
spirv_instruction(set = "GLSL.std.450", id = 80) float spvNMax(float, float);
spirv_instruction(set = "GLSL.std.450", id = 80) vec2 spvNMax(vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 80) vec3 spvNMax(vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 80) vec4 spvNMax(vec4, vec4);
spirv_instruction(set = "GLSL.std.450", id = 81) float spvNClamp(float, float, float);
spirv_instruction(set = "GLSL.std.450", id = 81) vec2 spvNClamp(vec2, vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 81) vec3 spvNClamp(vec3, vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 81) vec4 spvNClamp(vec4, vec4, vec4);

float dp3_f32(vec3 a, vec3 b)
{
    precise float _162 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _162));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _151 = a.x * b.x;
    return fma(a.y, b.y, _151);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _133 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _133)));
}

void main()
{
    precise float _186 = cb1._m4.x - TEXCOORD2.x;
    precise float _187 = cb1._m4.y - TEXCOORD2.y;
    precise float _188 = cb1._m4.z - TEXCOORD2.z;
    vec3 _189 = vec3(_186, _187, _188);
    precise float _191 = inversesqrt(dp3_f32(_189, _189));
    precise float _192 = _191 * _186;
    precise float _193 = _191 * _187;
    precise float _194 = _191 * _188;
    precise float _197 = TEXCOORD.y * 150.0;
    precise float _200 = sin(roundEven(_197)) * 43758.546875;
    precise float _204 = fma(fract(_200), 0.004999999888241291046142578125, TEXCOORD.x);
    precise float _205 = _204 * 150.0;
    precise float _208 = sin(roundEven(_205)) * 43758.546875;
    precise float _210 = fma(fract(_208), 0.004999999888241291046142578125, TEXCOORD.y);
    precise float _219 = abs(dFdx(_204)) + abs(dFdy(_204));
    precise float _220 = abs(dFdx(_210)) + abs(dFdy(_210));
    precise float _221 = TEXCOORD.x - 0.5;
    precise float _222 = TEXCOORD.y - 0.4000000059604644775390625;
    precise float _223 = fma(_221, 1.75, 0.5);
    precise float _224 = fma(_222, 1.75, 0.4000000059604644775390625);
    precise float _236 = float(_223 <= 1.0) * float(_223 >= 0.0);
    precise float _237 = float(_224 >= 0.0) * _236;
    vec4 _243 = texture(sampler2D(t0, s3), vec2(_223, _224));
    float _244 = _243.x;
    float _245 = _243.w;
    precise float _247 = fma(-_237, float(_224 <= 1.0), 1.0);
    precise float _251 = fma(_247, -_245, _245);
    precise float _252 = TEXCOORD2.x - cb1._m4.x;
    precise float _253 = TEXCOORD2.y - cb1._m4.y;
    precise float _254 = TEXCOORD2.z - cb1._m4.z;
    vec3 _255 = vec3(_252, _253, _254);
    precise float _257 = inversesqrt(dp3_f32(_255, _255));
    precise float _258 = _257 * _252;
    precise float _259 = _257 * _254;
    precise float _260 = TEXCOORD.y + TEXCOORD.x;
    precise float _261 = TEXCOORD.y + TEXCOORD.y;
    precise float _265 = fma(-_259, 5.0, _261);
    precise float _266 = _265 * 10.0;
    precise float _268 = fma(sin(_266), 0.0199999995529651641845703125, fma(-_258, 5.0, _260));
    precise float _269 = _268 * 30.0;
    vec4 _276 = texture(sampler2D(t1, s4), vec2(_268, fma(cos(_269), 0.0199999995529651641845703125, _265)));
    vec2 _280 = vec2(fma(_221, 1.75, 0.0), fma(_222, 1.75, -0.0999999940395355224609375));
    precise float _283 = sqrt(dp2_f32(_280, _280)) - 0.400390625;
    precise float _284 = _283 / _219;
    precise float _286 = 1.0 - spvNClamp(_284, 0.0, 1.0);
    precise float _298 = cb0._m8.x - cb0._m6.x;
    precise float _299 = cb0._m8.y - cb0._m6.y;
    precise float _300 = cb0._m8.z - cb0._m6.z;
    precise float _301 = fma(_286, _298, cb0._m6.x);
    precise float _302 = fma(_286, _299, cb0._m6.y);
    precise float _303 = fma(_286, _300, cb0._m6.z);
    precise float _304 = 1.0 - fma(_247, -_244, _244);
    precise float _310 = cb0._m11.x - cb0._m6.x;
    precise float _311 = cb0._m11.y - cb0._m6.y;
    precise float _312 = cb0._m11.z - cb0._m6.z;
    precise float _316 = fma(_304, _310, cb0._m6.x) - _301;
    precise float _317 = fma(_304, _311, cb0._m6.y) - _302;
    precise float _318 = fma(_304, _312, cb0._m6.z) - _303;
    precise float _322 = _204 - 0.1167768537998199462890625;
    precise float _323 = _322 / _219;
    precise float _325 = 0.88322317600250244140625 - _204;
    precise float _326 = _325 / _219;
    precise float _328 = spvNClamp(_326, 0.0, 1.0) * spvNClamp(_323, 0.0, 1.0);
    precise float _329 = _210 - 0.02999999932944774627685546875;
    precise float _330 = _329 / _220;
    precise float _332 = _328 * spvNClamp(_330, 0.0, 1.0);
    precise float _333 = 0.9700000286102294921875 - _210;
    precise float _334 = _333 / _220;
    precise float _336 = _332 * spvNClamp(_334, 0.0, 1.0);
    precise float _337 = fma(_276.x, 0.5, fma(_251, _316, _301));
    precise float _338 = fma(_276.y, 0.5, fma(_251, _317, _302));
    precise float _339 = fma(_276.z, 0.5, fma(_251, _318, _303));
    precise float _340 = _336 * _337;
    precise float _341 = _336 * _338;
    precise float _342 = _336 * _339;
    float _352 = dp3_f32(_189, vec3(cb4._m9.z, cb4._m10.z, cb4._m11.z));
    precise float _359 = TEXCOORD2.x - cb3._m25.x;
    precise float _360 = TEXCOORD2.y - cb3._m25.y;
    precise float _361 = TEXCOORD2.z - cb3._m25.z;
    vec3 _362 = vec3(_359, _360, _361);
    precise float _365 = sqrt(dp3_f32(_362, _362)) - _352;
    float _450;
    float _451;
    float _452;
    float _453;
    if (cb6._m0.x == 1.0)
    {
        bool _383 = cb6._m0.y == 1.0;
        precise float _389 = TEXCOORD2.y * cb6._m3.x;
        precise float _390 = TEXCOORD2.y * cb6._m3.y;
        precise float _391 = TEXCOORD2.y * cb6._m3.z;
        precise float _413 = fma(cb6._m5.x, TEXCOORD2.z, fma(cb6._m1.x, TEXCOORD2.x, _389)) + cb6._m7.x;
        precise float _414 = fma(cb6._m5.y, TEXCOORD2.z, fma(cb6._m1.y, TEXCOORD2.x, _390)) + cb6._m7.y;
        precise float _415 = fma(cb6._m5.z, TEXCOORD2.z, fma(cb6._m1.z, TEXCOORD2.x, _391)) + cb6._m7.z;
        precise float _424 = (_383 ? _413 : TEXCOORD2.x) - cb6._m11.x;
        precise float _425 = (_383 ? _414 : TEXCOORD2.y) - cb6._m11.y;
        precise float _426 = (_383 ? _415 : TEXCOORD2.z) - cb6._m11.z;
        precise float _432 = _424 * cb6._m9.x;
        precise float _433 = _425 * cb6._m9.y;
        precise float _434 = _426 * cb6._m9.z;
        vec4 _445 = texture(sampler3D(t5, s1), vec3(spvNMax(fma(_432, 0.25, 0.75), fma(cb6._m0.z, 0.5, 0.75)), _433, _434));
        _450 = _445.w;
        _451 = _445.z;
        _452 = _445.y;
        _453 = _445.x;
    }
    else
    {
        _450 = 1.0;
        _451 = 1.0;
        _452 = 1.0;
        _453 = 1.0;
    }
    precise float _467 = TEXCOORD5.x / TEXCOORD5.w;
    precise float _468 = TEXCOORD5.y / TEXCOORD5.w;
    vec4 _473 = texture(sampler2D(t2, s2), vec2(_467, _468));
    float _474 = _473.x;
    precise float _475 = spvNClamp(dp4_f32(vec4(_453, _452, _451, _450), cb2._m47), 0.0, 1.0) - _474;
    precise float _476 = fma(spvNClamp(fma(fma(cb3._m26, _365, _352), cb3._m24.z, cb3._m24.w), 0.0, 1.0), _475, _474);
    precise float _479 = 1.0 - cb0._m5.x;
    precise float _480 = -_192;
    precise float _481 = -_193;
    precise float _482 = -_194;
    vec3 _490 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    float _491 = dp3_f32(vec3(_480, _481, _482), _490);
    precise float _492 = _491 + _491;
    precise float _493 = -_492;
    precise float _494 = fma(TEXCOORD1.x, _493, _480);
    precise float _495 = fma(TEXCOORD1.y, _493, _481);
    precise float _496 = fma(TEXCOORD1.z, _493, _482);
    precise float _502 = _476 * cb0._m2.x;
    precise float _503 = _476 * cb0._m2.y;
    precise float _504 = _476 * cb0._m2.z;
    vec3 _509 = vec3(_494, _495, _496);
    float _558;
    float _559;
    float _560;
    if (cb5._m5 > 0.0)
    {
        precise float _513 = inversesqrt(dp3_f32(_509, _509));
        precise float _514 = _513 * _494;
        precise float _515 = _513 * _495;
        precise float _516 = _513 * _496;
        precise float _522 = cb5._m0.x - TEXCOORD2.x;
        precise float _523 = cb5._m0.y - TEXCOORD2.y;
        precise float _524 = cb5._m0.z - TEXCOORD2.z;
        precise float _525 = _522 / _514;
        precise float _526 = _523 / _515;
        precise float _527 = _524 / _516;
        precise float _533 = cb5._m2.x - TEXCOORD2.x;
        precise float _534 = cb5._m2.y - TEXCOORD2.y;
        precise float _535 = cb5._m2.z - TEXCOORD2.z;
        precise float _536 = _533 / _514;
        precise float _537 = _534 / _515;
        precise float _538 = _535 / _516;
        precise float _546 = spvNMin((_516 > 0.0) ? _527 : _538, spvNMin((_515 > 0.0) ? _526 : _537, (_514 > 0.0) ? _525 : _536));
        precise float _552 = TEXCOORD2.x - cb5._m4.x;
        precise float _553 = TEXCOORD2.y - cb5._m4.y;
        precise float _554 = TEXCOORD2.z - cb5._m4.z;
        _558 = fma(_516, _546, _554);
        _559 = fma(_515, _546, _553);
        _560 = fma(_514, _546, _552);
    }
    else
    {
        _558 = _496;
        _559 = _495;
        _560 = _494;
    }
    precise float _563 = fma(-_479, 0.699999988079071044921875, 1.7000000476837158203125) * _479;
    precise float _564 = _563 * 6.0;
    vec4 _570 = textureLod(samplerCube(t3, s0), vec3(_560, _559, _558), _564);
    float _571 = _570.x;
    float _572 = _570.y;
    float _573 = _570.z;
    precise float _575 = _570.w - 1.0;
    precise float _582 = log2(fma(cb5._m6.w, _575, 1.0)) * cb5._m6.y;
    precise float _586 = exp2(_582) * cb5._m6.x;
    precise float _587 = _571 * _586;
    precise float _588 = _572 * _586;
    precise float _589 = _573 * _586;
    float _681;
    float _682;
    float _683;
    if (cb5._m3 < 0.999989986419677734375)
    {
        float _646;
        float _647;
        float _648;
        if (cb5._m12 > 0.0)
        {
            precise float _601 = inversesqrt(dp3_f32(_509, _509));
            precise float _602 = _494 * _601;
            precise float _603 = _495 * _601;
            precise float _604 = _496 * _601;
            precise float _610 = cb5._m7.x - TEXCOORD2.x;
            precise float _611 = cb5._m7.y - TEXCOORD2.y;
            precise float _612 = cb5._m7.z - TEXCOORD2.z;
            precise float _613 = _610 / _602;
            precise float _614 = _611 / _603;
            precise float _615 = _612 / _604;
            precise float _621 = cb5._m9.x - TEXCOORD2.x;
            precise float _622 = cb5._m9.y - TEXCOORD2.y;
            precise float _623 = cb5._m9.z - TEXCOORD2.z;
            precise float _624 = _621 / _602;
            precise float _625 = _622 / _603;
            precise float _626 = _623 / _604;
            precise float _634 = spvNMin((_604 > 0.0) ? _615 : _626, spvNMin((_603 > 0.0) ? _614 : _625, (_602 > 0.0) ? _613 : _624));
            precise float _640 = TEXCOORD2.x - cb5._m11.x;
            precise float _641 = TEXCOORD2.y - cb5._m11.y;
            precise float _642 = TEXCOORD2.z - cb5._m11.z;
            _646 = fma(_604, _634, _642);
            _647 = fma(_603, _634, _641);
            _648 = fma(_602, _634, _640);
        }
        else
        {
            _646 = _496;
            _647 = _495;
            _648 = _494;
        }
        vec4 _652 = textureLod(samplerCube(t4, s0), vec3(_648, _647, _646), _564);
        precise float _657 = _652.w - 1.0;
        precise float _664 = log2(fma(cb5._m13.w, _657, 1.0)) * cb5._m13.y;
        precise float _668 = exp2(_664) * cb5._m13.x;
        precise float _669 = _652.x * _668;
        precise float _670 = _652.y * _668;
        precise float _671 = _652.z * _668;
        _681 = fma(cb5._m3, fma(_586, _573, -_671), _671);
        _682 = fma(cb5._m3, fma(_586, _572, -_670), _670);
        _683 = fma(cb5._m3, fma(_586, _571, -_669), _669);
    }
    else
    {
        _681 = _589;
        _682 = _588;
        _683 = _587;
    }
    precise float _685 = inversesqrt(dp3_f32(_490, _490));
    precise float _686 = _685 * TEXCOORD1.x;
    precise float _687 = _685 * TEXCOORD1.y;
    precise float _688 = _685 * TEXCOORD1.z;
    precise float _694 = fma(cb0._m5.y, fma(_336, _337, -0.039999999105930328369140625), 0.039999999105930328369140625);
    precise float _695 = fma(cb0._m5.y, fma(_336, _338, -0.039999999105930328369140625), 0.039999999105930328369140625);
    precise float _696 = fma(cb0._m5.y, fma(_336, _339, -0.039999999105930328369140625), 0.039999999105930328369140625);
    precise float _698 = fma(-cb0._m5.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _699 = _698 * _340;
    precise float _700 = _698 * _341;
    precise float _701 = _698 * _342;
    precise float _707 = fma(_186, _191, cb2._m0.x);
    precise float _708 = fma(_187, _191, cb2._m0.y);
    precise float _709 = fma(_188, _191, cb2._m0.z);
    vec3 _710 = vec3(_707, _708, _709);
    precise float _713 = inversesqrt(spvNMax(dp3_f32(_710, _710), 0.001000000047497451305389404296875));
    precise float _714 = _713 * _707;
    precise float _715 = _713 * _708;
    precise float _716 = _713 * _709;
    vec3 _717 = vec3(_686, _687, _688);
    precise float _721 = spvNClamp(dp3_f32(_717, cb2._m0), 0.0, 1.0);
    vec3 _722 = vec3(_714, _715, _716);
    precise float _724 = spvNClamp(dp3_f32(_717, _722), 0.0, 1.0);
    precise float _726 = spvNClamp(dp3_f32(cb2._m0, _722), 0.0, 1.0);
    precise float _727 = _726 * _726;
    precise float _731 = dp2_f32(vec2(_727), vec2(_479)) - 0.5;
    precise float _732 = 1.0 - _721;
    precise float _733 = _732 * _732;
    precise float _734 = _733 * _733;
    precise float _735 = _732 * _734;
    precise float _737 = abs(dp3_f32(_717, vec3(_192, _193, _194)));
    precise float _738 = 1.0 - _737;
    precise float _739 = _738 * _738;
    precise float _740 = _739 * _739;
    precise float _741 = _738 * _740;
    precise float _743 = fma(_731, _741, 1.0) * fma(_731, _735, 1.0);
    precise float _744 = _479 * _479;
    precise float _745 = spvNMax(_744, 0.00200000009499490261077880859375);
    precise float _746 = 1.0 - _745;
    precise float _749 = _737 * fma(_721, _746, _745);
    precise float _751 = fma(_721, fma(_737, _746, _745), _749) + 9.9999997473787516355514526367188e-06;
    precise float _752 = 0.5 / _751;
    precise float _753 = _745 * _745;
    precise float _756 = fma(fma(_724, _753, -_724), _724, 1.0);
    precise float _757 = _753 * 0.3183098733425140380859375;
    precise float _759 = _757 / fma(_756, _756, 1.0000000116860974230803549289703e-07);
    precise float _760 = _752 * _759;
    precise float _761 = _760 * 3.1415927410125732421875;
    precise float _762 = _721 * _743;
    precise float _763 = _721 * _761;
    precise float _766 = 1.0 / fma(_745, _745, 1.0);
    vec3 _767 = vec3(_694, _695, _696);
    precise float _771 = spvNMax(_763, 0.0) * ((dp3_f32(_767, _767) == 0.0) ? 0.0 : 1.0);
    precise float _772 = cb0._m5.x - _698;
    precise float _773 = _772 + 1.0;
    precise float _774 = spvNClamp(_773, 0.0, 1.0);
    precise float _775 = _762 * _502;
    precise float _776 = _762 * _503;
    precise float _777 = _762 * _504;
    precise float _778 = _502 * _771;
    precise float _779 = _503 * _771;
    precise float _780 = _504 * _771;
    precise float _781 = 1.0 - _726;
    precise float _782 = _781 * _781;
    precise float _783 = _782 * _782;
    precise float _784 = _781 * _783;
    precise float _785 = 1.0 - _694;
    precise float _786 = 1.0 - _695;
    precise float _787 = 1.0 - _696;
    precise float _791 = fma(_785, _784, _694) * _778;
    precise float _792 = fma(_786, _784, _695) * _779;
    precise float _793 = fma(_787, _784, _696) * _780;
    precise float _797 = _683 * _766;
    precise float _798 = _682 * _766;
    precise float _799 = _681 * _766;
    precise float _800 = _774 - _694;
    precise float _801 = _774 - _695;
    precise float _802 = _774 - _696;
    SV_Target.x = fma(_797, fma(_741, _800, _694), fma(_699, _775, _791));
    SV_Target.y = fma(_798, fma(_741, _801, _695), fma(_700, _776, _792));
    SV_Target.z = fma(_799, fma(_741, _802, _696), fma(_701, _777, _793));
    SV_Target.w = 1.0;
}

