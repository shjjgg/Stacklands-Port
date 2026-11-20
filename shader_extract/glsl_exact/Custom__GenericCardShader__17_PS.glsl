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
    vec2 _m8;
    uvec2 _m9;
    vec4 _m10;
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
    vec4 _m40;
    vec4 _m41;
    vec4 _m42;
    uvec4 _m43;
    uvec4 _m44;
    uvec4 _m45;
    uvec4 _m46;
    vec4 _m47;
} cb2;

layout(set = 0, binding = 3, std140) uniform cb3_buf
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
} cb3;

layout(set = 0, binding = 4, std140) uniform cb4_buf
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
} cb4;

layout(set = 0, binding = 5) uniform sampler s0;
layout(set = 0, binding = 6) uniform sampler s1;
layout(set = 0, binding = 7) uniform textureCube t0;
layout(set = 0, binding = 8) uniform textureCube t1;
layout(set = 0, binding = 9) uniform texture3D t2;

layout(location = 1, component = 0) in vec2 TEXCOORD;
layout(location = 2, component = 0) in vec3 TEXCOORD1;
layout(location = 3, component = 0) in vec3 TEXCOORD2;
layout(location = 4, component = 0) in vec3 TEXCOORD3;
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
    precise float _132 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _132));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _121 = a.x * b.x;
    return fma(a.y, b.y, _121);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _103 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _103)));
}

void main()
{
    precise float _156 = cb1._m4.x - TEXCOORD2.x;
    precise float _157 = cb1._m4.y - TEXCOORD2.y;
    precise float _158 = cb1._m4.z - TEXCOORD2.z;
    vec3 _159 = vec3(_156, _157, _158);
    precise float _161 = inversesqrt(dp3_f32(_159, _159));
    precise float _162 = _161 * _156;
    precise float _163 = _161 * _157;
    precise float _164 = _161 * _158;
    precise float _167 = TEXCOORD.y - 0.5;
    precise float _168 = _167 * 0.3333333432674407958984375;
    precise float _169 = _167 * 150.0;
    precise float _174 = abs(dFdx(_168)) + abs(dFdy(_168));
    precise float _177 = sin(roundEven(_169)) * 43758.546875;
    precise float _179 = fract(_177) - 0.5;
    precise float _182 = fma(_179, 0.004999999888241291046142578125, TEXCOORD.x);
    precise float _183 = _182 * 150.0;
    precise float _186 = sin(roundEven(_183)) * 43758.546875;
    precise float _188 = fract(_186) - 0.5;
    precise float _199 = cb0._m8.x - cb0._m10.x;
    precise float _200 = cb0._m8.y - cb0._m10.x;
    precise float _203 = abs(_182) - _199;
    precise float _204 = abs(fma(_188, 0.00166666670702397823333740234375, _168)) - _200;
    vec2 _207 = vec2(spvNMax(_203, 0.0), spvNMax(_204, 0.0));
    precise float _210 = sqrt(dp2_f32(_207, _207)) / _174;
    precise float _211 = spvNMin(_210, 1.0);
    precise float _220 = fma(_211, -cb0._m6.x, cb0._m6.x);
    precise float _221 = fma(_211, -cb0._m6.y, cb0._m6.y);
    precise float _222 = fma(_211, -cb0._m6.z, cb0._m6.z);
    bool _226 = cb4._m0.x == 1.0;
    float _299;
    float _300;
    float _301;
    float _302;
    if (_226)
    {
        bool _234 = cb4._m0.y == 1.0;
        precise float _240 = TEXCOORD2.y * cb4._m3.x;
        precise float _241 = TEXCOORD2.y * cb4._m3.y;
        precise float _242 = TEXCOORD2.y * cb4._m3.z;
        precise float _264 = fma(cb4._m5.x, TEXCOORD2.z, fma(cb4._m1.x, TEXCOORD2.x, _240)) + cb4._m7.x;
        precise float _265 = fma(cb4._m5.y, TEXCOORD2.z, fma(cb4._m1.y, TEXCOORD2.x, _241)) + cb4._m7.y;
        precise float _266 = fma(cb4._m5.z, TEXCOORD2.z, fma(cb4._m1.z, TEXCOORD2.x, _242)) + cb4._m7.z;
        precise float _275 = (_234 ? _264 : TEXCOORD2.x) - cb4._m11.x;
        precise float _276 = (_234 ? _265 : TEXCOORD2.y) - cb4._m11.y;
        precise float _277 = (_234 ? _266 : TEXCOORD2.z) - cb4._m11.z;
        precise float _283 = _275 * cb4._m9.x;
        precise float _284 = _276 * cb4._m9.y;
        precise float _285 = _277 * cb4._m9.z;
        vec4 _294 = texture(sampler3D(t2, s1), vec3(spvNMax(fma(_283, 0.25, 0.75), fma(cb4._m0.z, 0.5, 0.75)), _284, _285));
        _299 = _294.w;
        _300 = _294.z;
        _301 = _294.y;
        _302 = _294.x;
    }
    else
    {
        _299 = 1.0;
        _300 = 1.0;
        _301 = 1.0;
        _302 = 1.0;
    }
    precise float _309 = spvNClamp(dp4_f32(vec4(_302, _301, _300, _299), cb2._m47), 0.0, 1.0);
    precise float _312 = 1.0 - cb0._m5.x;
    precise float _313 = -_162;
    precise float _314 = -_163;
    precise float _315 = -_164;
    vec3 _323 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    float _324 = dp3_f32(vec3(_313, _314, _315), _323);
    precise float _325 = _324 + _324;
    precise float _326 = -_325;
    precise float _327 = fma(TEXCOORD1.x, _326, _313);
    precise float _328 = fma(TEXCOORD1.y, _326, _314);
    precise float _329 = fma(TEXCOORD1.z, _326, _315);
    precise float _335 = _309 * cb0._m2.x;
    precise float _336 = _309 * cb0._m2.y;
    precise float _337 = _309 * cb0._m2.z;
    vec4 _338 = vec4(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z, 1.0);
    float _429;
    float _430;
    float _431;
    if (_226)
    {
        bool _344 = cb4._m0.y == 1.0;
        precise float _350 = TEXCOORD2.y * cb4._m3.x;
        precise float _351 = TEXCOORD2.y * cb4._m3.y;
        precise float _352 = TEXCOORD2.y * cb4._m3.z;
        precise float _374 = fma(cb4._m5.x, TEXCOORD2.z, fma(cb4._m1.x, TEXCOORD2.x, _350)) + cb4._m7.x;
        precise float _375 = fma(cb4._m5.y, TEXCOORD2.z, fma(cb4._m1.y, TEXCOORD2.x, _351)) + cb4._m7.y;
        precise float _376 = fma(cb4._m5.z, TEXCOORD2.z, fma(cb4._m1.z, TEXCOORD2.x, _352)) + cb4._m7.z;
        precise float _385 = (_344 ? _374 : TEXCOORD2.x) - cb4._m11.x;
        precise float _386 = (_344 ? _375 : TEXCOORD2.y) - cb4._m11.y;
        precise float _387 = (_344 ? _376 : TEXCOORD2.z) - cb4._m11.z;
        precise float _393 = _385 * cb4._m9.x;
        precise float _394 = _386 * cb4._m9.y;
        precise float _395 = _387 * cb4._m9.z;
        precise float _396 = _393 * 0.25;
        precise float _399 = cb4._m0.z * 0.5;
        precise float _403 = spvNMin(fma(-cb4._m0.z, 0.5, 0.25), spvNMax(_396, _399));
        precise float _407 = _403 + 0.25;
        precise float _408 = _394 + 0.0;
        precise float _409 = _395 + 0.0;
        precise float _413 = _403 + 0.5;
        _429 = dp4_f32(texture(sampler3D(t2, s1), vec3(_413, _408, _409)), _338);
        _430 = dp4_f32(texture(sampler3D(t2, s1), vec3(_407, _408, _409)), _338);
        _431 = dp4_f32(texture(sampler3D(t2, s1), vec3(_403, _394, _395)), _338);
    }
    else
    {
        _429 = dp4_f32(cb2._m42, _338);
        _430 = dp4_f32(cb2._m41, _338);
        _431 = dp4_f32(cb2._m40, _338);
    }
    precise float _438 = _431 + TEXCOORD3.x;
    precise float _439 = _430 + TEXCOORD3.y;
    precise float _440 = _429 + TEXCOORD3.z;
    vec3 _448 = vec3(_327, _328, _329);
    float _497;
    float _498;
    float _499;
    if (cb3._m5 > 0.0)
    {
        precise float _452 = inversesqrt(dp3_f32(_448, _448));
        precise float _453 = _452 * _327;
        precise float _454 = _452 * _328;
        precise float _455 = _452 * _329;
        precise float _461 = cb3._m0.x - TEXCOORD2.x;
        precise float _462 = cb3._m0.y - TEXCOORD2.y;
        precise float _463 = cb3._m0.z - TEXCOORD2.z;
        precise float _464 = _461 / _453;
        precise float _465 = _462 / _454;
        precise float _466 = _463 / _455;
        precise float _472 = cb3._m2.x - TEXCOORD2.x;
        precise float _473 = cb3._m2.y - TEXCOORD2.y;
        precise float _474 = cb3._m2.z - TEXCOORD2.z;
        precise float _475 = _472 / _453;
        precise float _476 = _473 / _454;
        precise float _477 = _474 / _455;
        precise float _485 = spvNMin((_455 > 0.0) ? _466 : _477, spvNMin((_454 > 0.0) ? _465 : _476, (_453 > 0.0) ? _464 : _475));
        precise float _491 = TEXCOORD2.x - cb3._m4.x;
        precise float _492 = TEXCOORD2.y - cb3._m4.y;
        precise float _493 = TEXCOORD2.z - cb3._m4.z;
        _497 = fma(_455, _485, _493);
        _498 = fma(_454, _485, _492);
        _499 = fma(_453, _485, _491);
    }
    else
    {
        _497 = _329;
        _498 = _328;
        _499 = _327;
    }
    precise float _502 = fma(-_312, 0.699999988079071044921875, 1.7000000476837158203125) * _312;
    precise float _503 = _502 * 6.0;
    vec4 _509 = textureLod(samplerCube(t0, s0), vec3(_499, _498, _497), _503);
    float _510 = _509.x;
    float _511 = _509.y;
    float _512 = _509.z;
    precise float _514 = _509.w - 1.0;
    precise float _521 = log2(fma(cb3._m6.w, _514, 1.0)) * cb3._m6.y;
    precise float _525 = exp2(_521) * cb3._m6.x;
    precise float _526 = _510 * _525;
    precise float _527 = _511 * _525;
    precise float _528 = _512 * _525;
    float _620;
    float _621;
    float _622;
    if (cb3._m3 < 0.999989986419677734375)
    {
        float _585;
        float _586;
        float _587;
        if (cb3._m12 > 0.0)
        {
            precise float _540 = inversesqrt(dp3_f32(_448, _448));
            precise float _541 = _327 * _540;
            precise float _542 = _328 * _540;
            precise float _543 = _329 * _540;
            precise float _549 = cb3._m7.x - TEXCOORD2.x;
            precise float _550 = cb3._m7.y - TEXCOORD2.y;
            precise float _551 = cb3._m7.z - TEXCOORD2.z;
            precise float _552 = _549 / _541;
            precise float _553 = _550 / _542;
            precise float _554 = _551 / _543;
            precise float _560 = cb3._m9.x - TEXCOORD2.x;
            precise float _561 = cb3._m9.y - TEXCOORD2.y;
            precise float _562 = cb3._m9.z - TEXCOORD2.z;
            precise float _563 = _560 / _541;
            precise float _564 = _561 / _542;
            precise float _565 = _562 / _543;
            precise float _573 = spvNMin((_543 > 0.0) ? _554 : _565, spvNMin((_542 > 0.0) ? _553 : _564, (_541 > 0.0) ? _552 : _563));
            precise float _579 = TEXCOORD2.x - cb3._m11.x;
            precise float _580 = TEXCOORD2.y - cb3._m11.y;
            precise float _581 = TEXCOORD2.z - cb3._m11.z;
            _585 = fma(_543, _573, _581);
            _586 = fma(_542, _573, _580);
            _587 = fma(_541, _573, _579);
        }
        else
        {
            _585 = _329;
            _586 = _328;
            _587 = _327;
        }
        vec4 _591 = textureLod(samplerCube(t1, s0), vec3(_587, _586, _585), _503);
        precise float _596 = _591.w - 1.0;
        precise float _603 = log2(fma(cb3._m13.w, _596, 1.0)) * cb3._m13.y;
        precise float _607 = exp2(_603) * cb3._m13.x;
        precise float _608 = _591.x * _607;
        precise float _609 = _591.y * _607;
        precise float _610 = _591.z * _607;
        _620 = fma(cb3._m3, fma(_525, _512, -_610), _610);
        _621 = fma(cb3._m3, fma(_525, _511, -_609), _609);
        _622 = fma(cb3._m3, fma(_525, _510, -_608), _608);
    }
    else
    {
        _620 = _528;
        _621 = _527;
        _622 = _526;
    }
    precise float _624 = inversesqrt(dp3_f32(_323, _323));
    precise float _625 = _624 * TEXCOORD1.x;
    precise float _626 = _624 * TEXCOORD1.y;
    precise float _627 = _624 * TEXCOORD1.z;
    precise float _628 = _220 - 0.039999999105930328369140625;
    precise float _629 = _221 - 0.039999999105930328369140625;
    precise float _630 = _222 - 0.039999999105930328369140625;
    precise float _633 = fma(cb0._m5.y, _628, 0.039999999105930328369140625);
    precise float _634 = fma(cb0._m5.y, _629, 0.039999999105930328369140625);
    precise float _635 = fma(cb0._m5.y, _630, 0.039999999105930328369140625);
    precise float _637 = fma(-cb0._m5.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _638 = _637 * _220;
    precise float _639 = _637 * _221;
    precise float _640 = _637 * _222;
    precise float _646 = fma(_156, _161, cb2._m0.x);
    precise float _647 = fma(_157, _161, cb2._m0.y);
    precise float _648 = fma(_158, _161, cb2._m0.z);
    vec3 _649 = vec3(_646, _647, _648);
    precise float _652 = inversesqrt(spvNMax(dp3_f32(_649, _649), 0.001000000047497451305389404296875));
    precise float _653 = _652 * _646;
    precise float _654 = _652 * _647;
    precise float _655 = _652 * _648;
    vec3 _656 = vec3(_625, _626, _627);
    precise float _660 = spvNClamp(dp3_f32(_656, cb2._m0), 0.0, 1.0);
    vec3 _661 = vec3(_653, _654, _655);
    precise float _663 = spvNClamp(dp3_f32(_656, _661), 0.0, 1.0);
    precise float _665 = spvNClamp(dp3_f32(cb2._m0, _661), 0.0, 1.0);
    precise float _666 = _665 * _665;
    precise float _670 = dp2_f32(vec2(_666), vec2(_312)) - 0.5;
    precise float _671 = 1.0 - _660;
    precise float _672 = _671 * _671;
    precise float _673 = _672 * _672;
    precise float _674 = _671 * _673;
    precise float _676 = abs(dp3_f32(_656, vec3(_162, _163, _164)));
    precise float _677 = 1.0 - _676;
    precise float _678 = _677 * _677;
    precise float _679 = _678 * _678;
    precise float _680 = _677 * _679;
    precise float _682 = fma(_670, _680, 1.0) * fma(_670, _674, 1.0);
    precise float _683 = _312 * _312;
    precise float _684 = spvNMax(_683, 0.00200000009499490261077880859375);
    precise float _685 = 1.0 - _684;
    precise float _688 = _676 * fma(_660, _685, _684);
    precise float _690 = fma(_660, fma(_676, _685, _684), _688) + 9.9999997473787516355514526367188e-06;
    precise float _691 = 0.5 / _690;
    precise float _692 = _684 * _684;
    precise float _695 = fma(fma(_663, _692, -_663), _663, 1.0);
    precise float _696 = _692 * 0.3183098733425140380859375;
    precise float _698 = _696 / fma(_695, _695, 1.0000000116860974230803549289703e-07);
    precise float _699 = _691 * _698;
    precise float _700 = _699 * 3.1415927410125732421875;
    precise float _701 = _660 * _682;
    precise float _702 = _660 * _700;
    precise float _705 = 1.0 / fma(_684, _684, 1.0);
    vec3 _706 = vec3(_633, _634, _635);
    precise float _710 = spvNMax(_702, 0.0) * ((dp3_f32(_706, _706) == 0.0) ? 0.0 : 1.0);
    precise float _711 = cb0._m5.x - _637;
    precise float _712 = _711 + 1.0;
    precise float _713 = spvNClamp(_712, 0.0, 1.0);
    precise float _717 = _335 * _710;
    precise float _718 = _336 * _710;
    precise float _719 = _337 * _710;
    precise float _720 = 1.0 - _665;
    precise float _721 = _720 * _720;
    precise float _722 = _721 * _721;
    precise float _723 = _720 * _722;
    precise float _724 = 1.0 - _633;
    precise float _725 = 1.0 - _634;
    precise float _726 = 1.0 - _635;
    precise float _730 = fma(_724, _723, _633) * _717;
    precise float _731 = fma(_725, _723, _634) * _718;
    precise float _732 = fma(_726, _723, _635) * _719;
    precise float _736 = _622 * _705;
    precise float _737 = _621 * _705;
    precise float _738 = _620 * _705;
    precise float _739 = _713 - _633;
    precise float _740 = _713 - _634;
    precise float _741 = _713 - _635;
    SV_Target.x = fma(_736, fma(_680, _739, _633), fma(_638, fma(_335, _701, spvNMax(_438, 0.0)), _730));
    SV_Target.y = fma(_737, fma(_680, _740, _634), fma(_639, fma(_336, _701, spvNMax(_439, 0.0)), _731));
    SV_Target.z = fma(_738, fma(_680, _741, _635), fma(_640, fma(_337, _701, spvNMax(_440, 0.0)), _732));
    SV_Target.w = 1.0;
}

