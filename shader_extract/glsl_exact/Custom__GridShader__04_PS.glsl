#version 450
#extension GL_EXT_buffer_reference2 : require
#extension GL_EXT_scalar_block_layout : require
#extension GL_EXT_spirv_intrinsics : require

layout(set = 0, binding = 0, scalar) uniform cb0_buf
{
    uvec4 _m0;
    uvec4 _m1;
    vec3 _m2;
    uint _m3;
    uvec4 _m4;
    vec4 _m5;
    vec3 _m6;
    uint _m7;
    float _m8;
    vec2 _m9;
    float _m10;
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

layout(location = 1, component = 0) in vec3 TEXCOORD;
layout(location = 2, component = 0) in vec3 TEXCOORD1;
layout(location = 3, component = 0) in vec3 TEXCOORD2;
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
    precise float _128 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _128));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _111 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _111)));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _99 = a.x * b.x;
    return fma(a.y, b.y, _99);
}

void main()
{
    precise float _152 = cb1._m4.x - TEXCOORD1.x;
    precise float _153 = cb1._m4.y - TEXCOORD1.y;
    precise float _154 = cb1._m4.z - TEXCOORD1.z;
    vec3 _155 = vec3(_152, _153, _154);
    precise float _157 = inversesqrt(dp3_f32(_155, _155));
    precise float _158 = _157 * _152;
    precise float _159 = _157 * _153;
    precise float _160 = _157 * _154;
    precise float _167 = TEXCOORD1.x / cb0._m9.x;
    precise float _168 = TEXCOORD1.z / cb0._m9.y;
    precise float _171 = fract(_167) + 0.5;
    precise float _172 = fract(_168) + 0.5;
    precise float _176 = fract(_171);
    precise float _177 = fract(_172);
    float _180 = (_171 >= 0.0) ? _176 : (-_176);
    float _181 = (_172 >= 0.0) ? _177 : (-_177);
    precise float _185 = cb0._m8 - 0.00999999977648258209228515625;
    precise float _186 = _180 - _185;
    precise float _187 = _181 - _185;
    precise float _188 = _186 * 50.0;
    precise float _189 = _187 * 50.0;
    precise float _190 = spvNClamp(_188, 0.0, 1.0);
    precise float _191 = spvNClamp(_189, 0.0, 1.0);
    precise float _194 = _190 * _190;
    precise float _195 = _191 * _191;
    precise float _196 = _194 * fma(_190, -2.0, 3.0);
    precise float _197 = _195 * fma(_191, -2.0, 3.0);
    precise float _198 = _197 * _196;
    precise float _199 = 1.0 - _180;
    precise float _200 = 1.0 - _181;
    precise float _201 = _199 - _185;
    precise float _202 = _200 - _185;
    precise float _203 = _201 * 50.0;
    precise float _204 = _202 * 50.0;
    precise float _205 = spvNClamp(_203, 0.0, 1.0);
    precise float _206 = spvNClamp(_204, 0.0, 1.0);
    precise float _209 = _205 * _205;
    precise float _210 = _206 * _206;
    precise float _211 = _209 * fma(_205, -2.0, 3.0);
    precise float _212 = _210 * fma(_206, -2.0, 3.0);
    precise float _213 = _211 * _198;
    precise float _218 = fma(-_213, _212, 1.0) * cb0._m10;
    precise float _219 = _218 * 0.5;
    bool _223 = cb4._m0.x == 1.0;
    float _295;
    float _296;
    float _297;
    float _298;
    if (_223)
    {
        bool _230 = cb4._m0.y == 1.0;
        precise float _236 = TEXCOORD1.y * cb4._m3.x;
        precise float _237 = TEXCOORD1.y * cb4._m3.y;
        precise float _238 = TEXCOORD1.y * cb4._m3.z;
        precise float _260 = fma(cb4._m5.x, TEXCOORD1.z, fma(cb4._m1.x, TEXCOORD1.x, _236)) + cb4._m7.x;
        precise float _261 = fma(cb4._m5.y, TEXCOORD1.z, fma(cb4._m1.y, TEXCOORD1.x, _237)) + cb4._m7.y;
        precise float _262 = fma(cb4._m5.z, TEXCOORD1.z, fma(cb4._m1.z, TEXCOORD1.x, _238)) + cb4._m7.z;
        precise float _271 = (_230 ? _260 : TEXCOORD1.x) - cb4._m11.x;
        precise float _272 = (_230 ? _261 : TEXCOORD1.y) - cb4._m11.y;
        precise float _273 = (_230 ? _262 : TEXCOORD1.z) - cb4._m11.z;
        precise float _279 = _271 * cb4._m9.x;
        precise float _280 = _272 * cb4._m9.y;
        precise float _281 = _273 * cb4._m9.z;
        vec4 _290 = texture(sampler3D(t2, s1), vec3(spvNMax(fma(cb4._m0.z, 0.5, 0.75), fma(_279, 0.25, 0.75)), _280, _281));
        _295 = _290.w;
        _296 = _290.z;
        _297 = _290.y;
        _298 = _290.x;
    }
    else
    {
        _295 = 1.0;
        _296 = 1.0;
        _297 = 1.0;
        _298 = 1.0;
    }
    precise float _305 = spvNClamp(dp4_f32(vec4(_298, _297, _296, _295), cb2._m47), 0.0, 1.0);
    precise float _308 = 1.0 - cb0._m5.x;
    precise float _309 = -_158;
    precise float _310 = -_159;
    precise float _311 = -_160;
    vec3 _319 = vec3(TEXCOORD.x, TEXCOORD.y, TEXCOORD.z);
    float _320 = dp3_f32(vec3(_309, _310, _311), _319);
    precise float _321 = _320 + _320;
    precise float _322 = -_321;
    precise float _323 = fma(TEXCOORD.x, _322, _309);
    precise float _324 = fma(TEXCOORD.y, _322, _310);
    precise float _325 = fma(TEXCOORD.z, _322, _311);
    precise float _331 = _305 * cb0._m2.x;
    precise float _332 = _305 * cb0._m2.y;
    precise float _333 = _305 * cb0._m2.z;
    vec4 _334 = vec4(TEXCOORD.x, TEXCOORD.y, TEXCOORD.z, 1.0);
    float _425;
    float _426;
    float _427;
    if (_223)
    {
        bool _340 = cb4._m0.y == 1.0;
        precise float _346 = TEXCOORD1.y * cb4._m3.x;
        precise float _347 = TEXCOORD1.y * cb4._m3.y;
        precise float _348 = TEXCOORD1.y * cb4._m3.z;
        precise float _370 = fma(cb4._m5.x, TEXCOORD1.z, fma(cb4._m1.x, TEXCOORD1.x, _346)) + cb4._m7.x;
        precise float _371 = fma(cb4._m5.y, TEXCOORD1.z, fma(cb4._m1.y, TEXCOORD1.x, _347)) + cb4._m7.y;
        precise float _372 = fma(cb4._m5.z, TEXCOORD1.z, fma(cb4._m1.z, TEXCOORD1.x, _348)) + cb4._m7.z;
        precise float _381 = (_340 ? _370 : TEXCOORD1.x) - cb4._m11.x;
        precise float _382 = (_340 ? _371 : TEXCOORD1.y) - cb4._m11.y;
        precise float _383 = (_340 ? _372 : TEXCOORD1.z) - cb4._m11.z;
        precise float _389 = _381 * cb4._m9.x;
        precise float _390 = _382 * cb4._m9.y;
        precise float _391 = _383 * cb4._m9.z;
        precise float _392 = _389 * 0.25;
        precise float _395 = cb4._m0.z * 0.5;
        precise float _399 = spvNMin(fma(-cb4._m0.z, 0.5, 0.25), spvNMax(_395, _392));
        precise float _403 = _399 + 0.25;
        precise float _404 = _390 + 0.0;
        precise float _405 = _391 + 0.0;
        precise float _409 = _399 + 0.5;
        _425 = dp4_f32(texture(sampler3D(t2, s1), vec3(_409, _404, _405)), _334);
        _426 = dp4_f32(texture(sampler3D(t2, s1), vec3(_403, _404, _405)), _334);
        _427 = dp4_f32(texture(sampler3D(t2, s1), vec3(_399, _390, _391)), _334);
    }
    else
    {
        _425 = dp4_f32(cb2._m42, _334);
        _426 = dp4_f32(cb2._m41, _334);
        _427 = dp4_f32(cb2._m40, _334);
    }
    precise float _434 = _427 + TEXCOORD2.x;
    precise float _435 = _426 + TEXCOORD2.y;
    precise float _436 = _425 + TEXCOORD2.z;
    vec3 _444 = vec3(_323, _324, _325);
    float _493;
    float _494;
    float _495;
    if (cb3._m5 > 0.0)
    {
        precise float _448 = inversesqrt(dp3_f32(_444, _444));
        precise float _449 = _448 * _323;
        precise float _450 = _448 * _324;
        precise float _451 = _448 * _325;
        precise float _457 = cb3._m0.x - TEXCOORD1.x;
        precise float _458 = cb3._m0.y - TEXCOORD1.y;
        precise float _459 = cb3._m0.z - TEXCOORD1.z;
        precise float _460 = _457 / _449;
        precise float _461 = _458 / _450;
        precise float _462 = _459 / _451;
        precise float _468 = cb3._m2.x - TEXCOORD1.x;
        precise float _469 = cb3._m2.y - TEXCOORD1.y;
        precise float _470 = cb3._m2.z - TEXCOORD1.z;
        precise float _471 = _468 / _449;
        precise float _472 = _469 / _450;
        precise float _473 = _470 / _451;
        precise float _481 = spvNMin((_451 > 0.0) ? _462 : _473, spvNMin((_450 > 0.0) ? _461 : _472, (_449 > 0.0) ? _460 : _471));
        precise float _487 = TEXCOORD1.x - cb3._m4.x;
        precise float _488 = TEXCOORD1.y - cb3._m4.y;
        precise float _489 = TEXCOORD1.z - cb3._m4.z;
        _493 = fma(_451, _481, _489);
        _494 = fma(_450, _481, _488);
        _495 = fma(_449, _481, _487);
    }
    else
    {
        _493 = _325;
        _494 = _324;
        _495 = _323;
    }
    precise float _498 = _308 * fma(-_308, 0.699999988079071044921875, 1.7000000476837158203125);
    precise float _499 = _498 * 6.0;
    vec4 _505 = textureLod(samplerCube(t0, s0), vec3(_495, _494, _493), _499);
    float _506 = _505.x;
    float _507 = _505.y;
    float _508 = _505.z;
    precise float _510 = _505.w - 1.0;
    precise float _517 = log2(fma(cb3._m6.w, _510, 1.0)) * cb3._m6.y;
    precise float _521 = exp2(_517) * cb3._m6.x;
    precise float _522 = _506 * _521;
    precise float _523 = _507 * _521;
    precise float _524 = _508 * _521;
    float _616;
    float _617;
    float _618;
    if (cb3._m3 < 0.999989986419677734375)
    {
        float _581;
        float _582;
        float _583;
        if (cb3._m12 > 0.0)
        {
            precise float _536 = inversesqrt(dp3_f32(_444, _444));
            precise float _537 = _323 * _536;
            precise float _538 = _324 * _536;
            precise float _539 = _325 * _536;
            precise float _545 = cb3._m7.x - TEXCOORD1.x;
            precise float _546 = cb3._m7.y - TEXCOORD1.y;
            precise float _547 = cb3._m7.z - TEXCOORD1.z;
            precise float _548 = _545 / _537;
            precise float _549 = _546 / _538;
            precise float _550 = _547 / _539;
            precise float _556 = cb3._m9.x - TEXCOORD1.x;
            precise float _557 = cb3._m9.y - TEXCOORD1.y;
            precise float _558 = cb3._m9.z - TEXCOORD1.z;
            precise float _559 = _556 / _537;
            precise float _560 = _557 / _538;
            precise float _561 = _558 / _539;
            precise float _569 = spvNMin((_539 > 0.0) ? _550 : _561, spvNMin((_538 > 0.0) ? _549 : _560, (_537 > 0.0) ? _548 : _559));
            precise float _575 = TEXCOORD1.x - cb3._m11.x;
            precise float _576 = TEXCOORD1.y - cb3._m11.y;
            precise float _577 = TEXCOORD1.z - cb3._m11.z;
            _581 = fma(_539, _569, _577);
            _582 = fma(_538, _569, _576);
            _583 = fma(_537, _569, _575);
        }
        else
        {
            _581 = _325;
            _582 = _324;
            _583 = _323;
        }
        vec4 _587 = textureLod(samplerCube(t1, s0), vec3(_583, _582, _581), _499);
        precise float _592 = _587.w - 1.0;
        precise float _599 = log2(fma(cb3._m13.w, _592, 1.0)) * cb3._m13.y;
        precise float _603 = exp2(_599) * cb3._m13.x;
        precise float _604 = _587.x * _603;
        precise float _605 = _587.y * _603;
        precise float _606 = _587.z * _603;
        _616 = fma(cb3._m3, fma(_521, _508, -_606), _606);
        _617 = fma(cb3._m3, fma(_521, _507, -_605), _605);
        _618 = fma(cb3._m3, fma(_521, _506, -_604), _604);
    }
    else
    {
        _616 = _524;
        _617 = _523;
        _618 = _522;
    }
    precise float _620 = inversesqrt(dp3_f32(_319, _319));
    precise float _621 = _620 * TEXCOORD.x;
    precise float _622 = _620 * TEXCOORD.y;
    precise float _623 = _620 * TEXCOORD.z;
    precise float _629 = cb0._m6.x - 0.039999999105930328369140625;
    precise float _630 = cb0._m6.y - 0.039999999105930328369140625;
    precise float _631 = cb0._m6.z - 0.039999999105930328369140625;
    precise float _634 = fma(cb0._m5.y, _629, 0.039999999105930328369140625);
    precise float _635 = fma(cb0._m5.y, _630, 0.039999999105930328369140625);
    precise float _636 = fma(cb0._m5.y, _631, 0.039999999105930328369140625);
    precise float _638 = fma(-cb0._m5.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _639 = _638 * cb0._m6.x;
    precise float _640 = _638 * cb0._m6.y;
    precise float _641 = _638 * cb0._m6.z;
    precise float _642 = _219 * _639;
    precise float _643 = _219 * _640;
    precise float _644 = _219 * _641;
    precise float _645 = 1.0 - _638;
    SV_Target.w = fma(_219, _638, _645);
    precise float _654 = fma(_152, _157, cb2._m0.x);
    precise float _655 = fma(_153, _157, cb2._m0.y);
    precise float _656 = fma(_154, _157, cb2._m0.z);
    vec3 _657 = vec3(_654, _655, _656);
    precise float _660 = inversesqrt(spvNMax(dp3_f32(_657, _657), 0.001000000047497451305389404296875));
    precise float _661 = _660 * _654;
    precise float _662 = _660 * _655;
    precise float _663 = _660 * _656;
    vec3 _664 = vec3(_621, _622, _623);
    precise float _668 = spvNClamp(dp3_f32(_664, cb2._m0), 0.0, 1.0);
    vec3 _669 = vec3(_661, _662, _663);
    precise float _671 = spvNClamp(dp3_f32(_664, _669), 0.0, 1.0);
    precise float _673 = spvNClamp(dp3_f32(cb2._m0, _669), 0.0, 1.0);
    precise float _674 = _673 * _673;
    precise float _678 = dp2_f32(vec2(_674), vec2(_308)) - 0.5;
    precise float _679 = 1.0 - _668;
    precise float _680 = _679 * _679;
    precise float _681 = _680 * _680;
    precise float _682 = _679 * _681;
    precise float _684 = abs(dp3_f32(_664, vec3(_158, _159, _160)));
    precise float _685 = 1.0 - _684;
    precise float _686 = _685 * _685;
    precise float _687 = _686 * _686;
    precise float _688 = _685 * _687;
    precise float _690 = fma(_678, _688, 1.0) * fma(_678, _682, 1.0);
    precise float _691 = _308 * _308;
    precise float _692 = spvNMax(_691, 0.00200000009499490261077880859375);
    precise float _693 = 1.0 - _692;
    precise float _696 = _684 * fma(_668, _693, _692);
    precise float _698 = fma(_668, fma(_684, _693, _692), _696) + 9.9999997473787516355514526367188e-06;
    precise float _699 = 0.5 / _698;
    precise float _700 = _692 * _692;
    precise float _703 = fma(fma(_671, _700, -_671), _671, 1.0);
    precise float _704 = _700 * 0.3183098733425140380859375;
    precise float _706 = _704 / fma(_703, _703, 1.0000000116860974230803549289703e-07);
    precise float _707 = _699 * _706;
    precise float _708 = _707 * 3.1415927410125732421875;
    precise float _709 = _668 * _690;
    precise float _710 = _668 * _708;
    precise float _713 = 1.0 / fma(_692, _692, 1.0);
    vec3 _714 = vec3(_634, _635, _636);
    precise float _718 = spvNMax(_710, 0.0) * ((dp3_f32(_714, _714) == 0.0) ? 0.0 : 1.0);
    precise float _719 = _645 + cb0._m5.x;
    precise float _720 = spvNClamp(_719, 0.0, 1.0);
    precise float _724 = _331 * _718;
    precise float _725 = _332 * _718;
    precise float _726 = _333 * _718;
    precise float _727 = 1.0 - _673;
    precise float _728 = _727 * _727;
    precise float _729 = _728 * _728;
    precise float _730 = _727 * _729;
    precise float _731 = 1.0 - _634;
    precise float _732 = 1.0 - _635;
    precise float _733 = 1.0 - _636;
    precise float _737 = fma(_731, _730, _634) * _724;
    precise float _738 = fma(_732, _730, _635) * _725;
    precise float _739 = fma(_733, _730, _636) * _726;
    precise float _743 = _618 * _713;
    precise float _744 = _617 * _713;
    precise float _745 = _616 * _713;
    precise float _746 = _720 - _634;
    precise float _747 = _720 - _635;
    precise float _748 = _720 - _636;
    SV_Target.x = fma(_743, fma(_688, _746, _634), fma(_642, fma(_331, _709, spvNMax(_434, 0.0)), _737));
    SV_Target.y = fma(_744, fma(_688, _747, _635), fma(_643, fma(_332, _709, spvNMax(_435, 0.0)), _738));
    SV_Target.z = fma(_745, fma(_688, _748, _636), fma(_644, fma(_333, _709, spvNMax(_436, 0.0)), _739));
}

