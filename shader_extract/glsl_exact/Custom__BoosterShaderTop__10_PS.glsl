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
    precise float _163 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _163));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _152 = a.x * b.x;
    return fma(a.y, b.y, _152);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _134 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _134)));
}

void main()
{
    precise float _187 = cb1._m4.x - TEXCOORD2.x;
    precise float _188 = cb1._m4.y - TEXCOORD2.y;
    precise float _189 = cb1._m4.z - TEXCOORD2.z;
    vec3 _190 = vec3(_187, _188, _189);
    precise float _192 = inversesqrt(dp3_f32(_190, _190));
    precise float _193 = _192 * _187;
    precise float _194 = _192 * _188;
    precise float _195 = _192 * _189;
    precise float _200 = TEXCOORD.y * 150.0;
    precise float _201 = TEXCOORD.x * 20.0;
    precise float _202 = TEXCOORD.y * 1.0;
    precise float _205 = sin(roundEven(_200)) * 43758.546875;
    precise float _207 = fma(fract(_205), 0.004999999888241291046142578125, TEXCOORD.x);
    precise float _208 = _207 * 150.0;
    precise float _211 = sin(roundEven(_208)) * 43758.546875;
    precise float _213 = fma(fract(_211), 0.004999999888241291046142578125, TEXCOORD.y);
    precise float _222 = abs(dFdx(_207)) + abs(dFdy(_207));
    precise float _223 = abs(dFdx(_213)) + abs(dFdy(_213));
    precise float _224 = 0.5 - TEXCOORD.x;
    precise float _225 = 0.550000011920928955078125 - TEXCOORD.y;
    vec4 _231 = texture(sampler2D(t0, s3), vec2(_201, _202));
    float _232 = _231.x;
    float _233 = _231.y;
    float _234 = _231.z;
    precise float _241 = _232 * cb0._m6.x;
    precise float _242 = _233 * cb0._m6.y;
    precise float _243 = _234 * cb0._m6.z;
    precise float _244 = TEXCOORD2.x - cb1._m4.x;
    precise float _245 = TEXCOORD2.y - cb1._m4.y;
    precise float _246 = TEXCOORD2.z - cb1._m4.z;
    vec3 _247 = vec3(_244, _245, _246);
    precise float _249 = inversesqrt(dp3_f32(_247, _247));
    precise float _250 = _249 * _244;
    precise float _251 = _249 * _246;
    precise float _252 = TEXCOORD.y + TEXCOORD.x;
    precise float _253 = TEXCOORD.y + TEXCOORD.y;
    precise float _257 = fma(-_251, 5.0, _253);
    precise float _258 = _257 * 10.0;
    precise float _260 = fma(sin(_258), 0.0199999995529651641845703125, fma(-_250, 5.0, _252));
    precise float _261 = _260 * 30.0;
    vec4 _268 = texture(sampler2D(t1, s4), vec2(_260, fma(cos(_261), 0.0199999995529651641845703125, _257)));
    vec2 _274 = vec2(fma(_224, 1.75, 0.0), fma(_225, 1.75, -0.050000011920928955078125));
    precise float _277 = sqrt(dp2_f32(_274, _274)) - 0.400390625;
    precise float _278 = _277 / _222;
    precise float _280 = 1.0 - spvNClamp(_278, 0.0, 1.0);
    precise float _295 = _207 - 0.1167768537998199462890625;
    precise float _296 = _295 / _222;
    precise float _298 = 0.88322317600250244140625 - _207;
    precise float _299 = _298 / _222;
    precise float _301 = spvNClamp(_299, 0.0, 1.0) * spvNClamp(_296, 0.0, 1.0);
    precise float _302 = _213 - 0.02999999932944774627685546875;
    precise float _303 = _302 / _223;
    precise float _305 = _301 * spvNClamp(_303, 0.0, 1.0);
    precise float _306 = 0.9700000286102294921875 - _213;
    precise float _307 = _306 / _223;
    precise float _309 = _305 * spvNClamp(_307, 0.0, 1.0);
    precise float _310 = fma(_268.x, 0.5, fma(_280, fma(-cb0._m6.x, _232, cb0._m8.x), _241));
    precise float _311 = fma(_268.y, 0.5, fma(_280, fma(-cb0._m6.y, _233, cb0._m8.y), _242));
    precise float _312 = fma(_268.z, 0.5, fma(_280, fma(-cb0._m6.z, _234, cb0._m8.z), _243));
    precise float _313 = _309 * _310;
    precise float _314 = _309 * _311;
    precise float _315 = _309 * _312;
    float _325 = dp3_f32(_190, vec3(cb4._m9.z, cb4._m10.z, cb4._m11.z));
    precise float _332 = TEXCOORD2.x - cb3._m25.x;
    precise float _333 = TEXCOORD2.y - cb3._m25.y;
    precise float _334 = TEXCOORD2.z - cb3._m25.z;
    vec3 _335 = vec3(_332, _333, _334);
    precise float _338 = sqrt(dp3_f32(_335, _335)) - _325;
    float _424;
    float _425;
    float _426;
    float _427;
    if (cb6._m0.x == 1.0)
    {
        bool _357 = cb6._m0.y == 1.0;
        precise float _363 = TEXCOORD2.y * cb6._m3.x;
        precise float _364 = TEXCOORD2.y * cb6._m3.y;
        precise float _365 = TEXCOORD2.y * cb6._m3.z;
        precise float _387 = fma(cb6._m5.x, TEXCOORD2.z, fma(cb6._m1.x, TEXCOORD2.x, _363)) + cb6._m7.x;
        precise float _388 = fma(cb6._m5.y, TEXCOORD2.z, fma(cb6._m1.y, TEXCOORD2.x, _364)) + cb6._m7.y;
        precise float _389 = fma(cb6._m5.z, TEXCOORD2.z, fma(cb6._m1.z, TEXCOORD2.x, _365)) + cb6._m7.z;
        precise float _398 = (_357 ? _387 : TEXCOORD2.x) - cb6._m11.x;
        precise float _399 = (_357 ? _388 : TEXCOORD2.y) - cb6._m11.y;
        precise float _400 = (_357 ? _389 : TEXCOORD2.z) - cb6._m11.z;
        precise float _406 = _398 * cb6._m9.x;
        precise float _407 = _399 * cb6._m9.y;
        precise float _408 = _400 * cb6._m9.z;
        vec4 _419 = texture(sampler3D(t5, s1), vec3(spvNMax(fma(_406, 0.25, 0.75), fma(cb6._m0.z, 0.5, 0.75)), _407, _408));
        _424 = _419.w;
        _425 = _419.z;
        _426 = _419.y;
        _427 = _419.x;
    }
    else
    {
        _424 = 1.0;
        _425 = 1.0;
        _426 = 1.0;
        _427 = 1.0;
    }
    precise float _441 = TEXCOORD5.x / TEXCOORD5.w;
    precise float _442 = TEXCOORD5.y / TEXCOORD5.w;
    vec4 _447 = texture(sampler2D(t2, s2), vec2(_441, _442));
    float _448 = _447.x;
    precise float _449 = spvNClamp(dp4_f32(vec4(_427, _426, _425, _424), cb2._m47), 0.0, 1.0) - _448;
    precise float _450 = fma(spvNClamp(fma(fma(cb3._m26, _338, _325), cb3._m24.z, cb3._m24.w), 0.0, 1.0), _449, _448);
    precise float _453 = 1.0 - cb0._m5.x;
    precise float _454 = -_193;
    precise float _455 = -_194;
    precise float _456 = -_195;
    vec3 _464 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    float _465 = dp3_f32(vec3(_454, _455, _456), _464);
    precise float _466 = _465 + _465;
    precise float _467 = -_466;
    precise float _468 = fma(TEXCOORD1.x, _467, _454);
    precise float _469 = fma(TEXCOORD1.y, _467, _455);
    precise float _470 = fma(TEXCOORD1.z, _467, _456);
    precise float _476 = _450 * cb0._m2.x;
    precise float _477 = _450 * cb0._m2.y;
    precise float _478 = _450 * cb0._m2.z;
    vec3 _483 = vec3(_468, _469, _470);
    float _532;
    float _533;
    float _534;
    if (cb5._m5 > 0.0)
    {
        precise float _487 = inversesqrt(dp3_f32(_483, _483));
        precise float _488 = _487 * _468;
        precise float _489 = _487 * _469;
        precise float _490 = _487 * _470;
        precise float _496 = cb5._m0.x - TEXCOORD2.x;
        precise float _497 = cb5._m0.y - TEXCOORD2.y;
        precise float _498 = cb5._m0.z - TEXCOORD2.z;
        precise float _499 = _496 / _488;
        precise float _500 = _497 / _489;
        precise float _501 = _498 / _490;
        precise float _507 = cb5._m2.x - TEXCOORD2.x;
        precise float _508 = cb5._m2.y - TEXCOORD2.y;
        precise float _509 = cb5._m2.z - TEXCOORD2.z;
        precise float _510 = _507 / _488;
        precise float _511 = _508 / _489;
        precise float _512 = _509 / _490;
        precise float _520 = spvNMin((_490 > 0.0) ? _501 : _512, spvNMin((_489 > 0.0) ? _500 : _511, (_488 > 0.0) ? _499 : _510));
        precise float _526 = TEXCOORD2.x - cb5._m4.x;
        precise float _527 = TEXCOORD2.y - cb5._m4.y;
        precise float _528 = TEXCOORD2.z - cb5._m4.z;
        _532 = fma(_490, _520, _528);
        _533 = fma(_489, _520, _527);
        _534 = fma(_488, _520, _526);
    }
    else
    {
        _532 = _470;
        _533 = _469;
        _534 = _468;
    }
    precise float _537 = fma(-_453, 0.699999988079071044921875, 1.7000000476837158203125) * _453;
    precise float _538 = _537 * 6.0;
    vec4 _544 = textureLod(samplerCube(t3, s0), vec3(_534, _533, _532), _538);
    float _545 = _544.x;
    float _546 = _544.y;
    float _547 = _544.z;
    precise float _549 = _544.w - 1.0;
    precise float _556 = log2(fma(cb5._m6.w, _549, 1.0)) * cb5._m6.y;
    precise float _560 = exp2(_556) * cb5._m6.x;
    precise float _561 = _545 * _560;
    precise float _562 = _546 * _560;
    precise float _563 = _547 * _560;
    float _655;
    float _656;
    float _657;
    if (cb5._m3 < 0.999989986419677734375)
    {
        float _620;
        float _621;
        float _622;
        if (cb5._m12 > 0.0)
        {
            precise float _575 = inversesqrt(dp3_f32(_483, _483));
            precise float _576 = _468 * _575;
            precise float _577 = _469 * _575;
            precise float _578 = _470 * _575;
            precise float _584 = cb5._m7.x - TEXCOORD2.x;
            precise float _585 = cb5._m7.y - TEXCOORD2.y;
            precise float _586 = cb5._m7.z - TEXCOORD2.z;
            precise float _587 = _584 / _576;
            precise float _588 = _585 / _577;
            precise float _589 = _586 / _578;
            precise float _595 = cb5._m9.x - TEXCOORD2.x;
            precise float _596 = cb5._m9.y - TEXCOORD2.y;
            precise float _597 = cb5._m9.z - TEXCOORD2.z;
            precise float _598 = _595 / _576;
            precise float _599 = _596 / _577;
            precise float _600 = _597 / _578;
            precise float _608 = spvNMin((_578 > 0.0) ? _589 : _600, spvNMin((_577 > 0.0) ? _588 : _599, (_576 > 0.0) ? _587 : _598));
            precise float _614 = TEXCOORD2.x - cb5._m11.x;
            precise float _615 = TEXCOORD2.y - cb5._m11.y;
            precise float _616 = TEXCOORD2.z - cb5._m11.z;
            _620 = fma(_578, _608, _616);
            _621 = fma(_577, _608, _615);
            _622 = fma(_576, _608, _614);
        }
        else
        {
            _620 = _470;
            _621 = _469;
            _622 = _468;
        }
        vec4 _626 = textureLod(samplerCube(t4, s0), vec3(_622, _621, _620), _538);
        precise float _631 = _626.w - 1.0;
        precise float _638 = log2(fma(cb5._m13.w, _631, 1.0)) * cb5._m13.y;
        precise float _642 = exp2(_638) * cb5._m13.x;
        precise float _643 = _626.x * _642;
        precise float _644 = _626.y * _642;
        precise float _645 = _626.z * _642;
        _655 = fma(cb5._m3, fma(_560, _547, -_645), _645);
        _656 = fma(cb5._m3, fma(_560, _546, -_644), _644);
        _657 = fma(cb5._m3, fma(_560, _545, -_643), _643);
    }
    else
    {
        _655 = _563;
        _656 = _562;
        _657 = _561;
    }
    precise float _659 = inversesqrt(dp3_f32(_464, _464));
    precise float _660 = _659 * TEXCOORD1.x;
    precise float _661 = _659 * TEXCOORD1.y;
    precise float _662 = _659 * TEXCOORD1.z;
    precise float _668 = fma(cb0._m5.y, fma(_309, _310, -0.039999999105930328369140625), 0.039999999105930328369140625);
    precise float _669 = fma(cb0._m5.y, fma(_309, _311, -0.039999999105930328369140625), 0.039999999105930328369140625);
    precise float _670 = fma(cb0._m5.y, fma(_309, _312, -0.039999999105930328369140625), 0.039999999105930328369140625);
    precise float _672 = fma(-cb0._m5.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _673 = _672 * _313;
    precise float _674 = _672 * _314;
    precise float _675 = _672 * _315;
    precise float _681 = fma(_187, _192, cb2._m0.x);
    precise float _682 = fma(_188, _192, cb2._m0.y);
    precise float _683 = fma(_189, _192, cb2._m0.z);
    vec3 _684 = vec3(_681, _682, _683);
    precise float _687 = inversesqrt(spvNMax(dp3_f32(_684, _684), 0.001000000047497451305389404296875));
    precise float _688 = _687 * _681;
    precise float _689 = _687 * _682;
    precise float _690 = _687 * _683;
    vec3 _691 = vec3(_660, _661, _662);
    precise float _695 = spvNClamp(dp3_f32(_691, cb2._m0), 0.0, 1.0);
    vec3 _696 = vec3(_688, _689, _690);
    precise float _698 = spvNClamp(dp3_f32(_691, _696), 0.0, 1.0);
    precise float _700 = spvNClamp(dp3_f32(cb2._m0, _696), 0.0, 1.0);
    precise float _701 = _700 * _700;
    precise float _705 = dp2_f32(vec2(_701), vec2(_453)) - 0.5;
    precise float _706 = 1.0 - _695;
    precise float _707 = _706 * _706;
    precise float _708 = _707 * _707;
    precise float _709 = _706 * _708;
    precise float _711 = abs(dp3_f32(_691, vec3(_193, _194, _195)));
    precise float _712 = 1.0 - _711;
    precise float _713 = _712 * _712;
    precise float _714 = _713 * _713;
    precise float _715 = _712 * _714;
    precise float _717 = fma(_705, _715, 1.0) * fma(_705, _709, 1.0);
    precise float _718 = _453 * _453;
    precise float _719 = spvNMax(_718, 0.00200000009499490261077880859375);
    precise float _720 = 1.0 - _719;
    precise float _723 = _711 * fma(_695, _720, _719);
    precise float _725 = fma(_695, fma(_711, _720, _719), _723) + 9.9999997473787516355514526367188e-06;
    precise float _726 = 0.5 / _725;
    precise float _727 = _719 * _719;
    precise float _730 = fma(fma(_698, _727, -_698), _698, 1.0);
    precise float _731 = _727 * 0.3183098733425140380859375;
    precise float _733 = _731 / fma(_730, _730, 1.0000000116860974230803549289703e-07);
    precise float _734 = _726 * _733;
    precise float _735 = _734 * 3.1415927410125732421875;
    precise float _736 = _695 * _717;
    precise float _737 = _695 * _735;
    precise float _740 = 1.0 / fma(_719, _719, 1.0);
    vec3 _741 = vec3(_668, _669, _670);
    precise float _745 = spvNMax(_737, 0.0) * ((dp3_f32(_741, _741) == 0.0) ? 0.0 : 1.0);
    precise float _746 = cb0._m5.x - _672;
    precise float _747 = _746 + 1.0;
    precise float _748 = spvNClamp(_747, 0.0, 1.0);
    precise float _749 = _736 * _476;
    precise float _750 = _736 * _477;
    precise float _751 = _736 * _478;
    precise float _752 = _476 * _745;
    precise float _753 = _477 * _745;
    precise float _754 = _478 * _745;
    precise float _755 = 1.0 - _700;
    precise float _756 = _755 * _755;
    precise float _757 = _756 * _756;
    precise float _758 = _755 * _757;
    precise float _759 = 1.0 - _668;
    precise float _760 = 1.0 - _669;
    precise float _761 = 1.0 - _670;
    precise float _765 = fma(_759, _758, _668) * _752;
    precise float _766 = fma(_760, _758, _669) * _753;
    precise float _767 = fma(_761, _758, _670) * _754;
    precise float _771 = _657 * _740;
    precise float _772 = _656 * _740;
    precise float _773 = _655 * _740;
    precise float _774 = _748 - _668;
    precise float _775 = _748 - _669;
    precise float _776 = _748 - _670;
    SV_Target.x = fma(_771, fma(_715, _774, _668), fma(_673, _749, _765));
    SV_Target.y = fma(_772, fma(_715, _775, _669), fma(_674, _750, _766));
    SV_Target.z = fma(_773, fma(_715, _776, _670), fma(_675, _751, _767));
    SV_Target.w = 1.0;
}

