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
    vec3 _m10;
    uint _m11;
    vec3 _m12;
    uint _m13;
    vec4 _m14;
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
    precise float _139 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _139));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _122 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _122)));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _110 = a.x * b.x;
    return fma(a.y, b.y, _110);
}

void main()
{
    precise float _163 = cb1._m4.x - TEXCOORD2.x;
    precise float _164 = cb1._m4.y - TEXCOORD2.y;
    precise float _165 = cb1._m4.z - TEXCOORD2.z;
    vec3 _166 = vec3(_163, _164, _165);
    precise float _168 = inversesqrt(dp3_f32(_166, _166));
    precise float _169 = _168 * _163;
    precise float _170 = _168 * _164;
    precise float _171 = _168 * _165;
    precise float _174 = TEXCOORD.y * 150.0;
    precise float _177 = sin(roundEven(_174)) * 43758.546875;
    precise float _179 = fract(_177) - 0.5;
    precise float _182 = fma(_179, 0.00999999977648258209228515625, TEXCOORD.x);
    precise float _183 = _182 * 150.0;
    precise float _186 = sin(roundEven(_183)) * 43758.546875;
    precise float _188 = fract(_186) - 0.5;
    precise float _189 = fma(_188, 0.0500000007450580596923828125, TEXCOORD.y);
    precise float _198 = abs(dFdx(_182)) + abs(dFdy(_182));
    precise float _199 = abs(dFdx(_189)) + abs(dFdy(_189));
    precise float _200 = _199 * 0.2666666805744171142578125;
    precise float _201 = _189 - 0.5;
    precise float _202 = _182 - 0.02999999932944774627685546875;
    precise float _204 = fma(-_202, 1.06382977962493896484375, 1.0);
    precise float _205 = _202 / _198;
    precise float _207 = 0.9700000286102294921875 - _182;
    precise float _208 = _207 / _198;
    precise float _210 = spvNClamp(_208, 0.0, 1.0) * spvNClamp(_205, 0.0, 1.0);
    precise float _213 = fma(_201, 0.2666666805744171142578125, 0.069999992847442626953125) / _200;
    precise float _215 = _210 * spvNClamp(_213, 0.0, 1.0);
    precise float _216 = 0.569999992847442626953125 - fma(_201, 0.2666666805744171142578125, 0.5);
    precise float _217 = _216 / _200;
    precise float _219 = _215 * spvNClamp(_217, 0.0, 1.0);
    precise float _231 = cb0._m8.x - cb0._m6.x;
    precise float _232 = cb0._m8.y - cb0._m6.y;
    precise float _233 = cb0._m8.z - cb0._m6.z;
    precise float _234 = fma(_219, _231, cb0._m6.x);
    precise float _235 = fma(_219, _232, cb0._m6.y);
    precise float _236 = fma(_219, _233, cb0._m6.z);
    float _242 = float(cb0._m14.x >= 0.5);
    precise float _253 = cb0._m12.x - cb0._m10.x;
    precise float _254 = cb0._m12.y - cb0._m10.y;
    precise float _255 = cb0._m12.z - cb0._m10.z;
    precise float _261 = _204 - cb0._m14.y;
    precise float _266 = abs(dFdy(_204)) + abs(dFdx(_204));
    precise float _267 = _261 / _266;
    float _270 = (_219 <= 0.0) ? 0.0 : spvNClamp(_267, 0.0, 1.0);
    precise float _271 = fma(_242, _253, cb0._m10.x) - _234;
    precise float _272 = fma(_242, _254, cb0._m10.y) - _235;
    precise float _273 = fma(_242, _255, cb0._m10.z) - _236;
    precise float _274 = fma(_270, _271, _234);
    precise float _275 = fma(_270, _272, _235);
    precise float _276 = fma(_270, _273, _236);
    bool _280 = cb4._m0.x == 1.0;
    float _352;
    float _353;
    float _354;
    float _355;
    if (_280)
    {
        bool _287 = cb4._m0.y == 1.0;
        precise float _293 = TEXCOORD2.y * cb4._m3.x;
        precise float _294 = TEXCOORD2.y * cb4._m3.y;
        precise float _295 = TEXCOORD2.y * cb4._m3.z;
        precise float _317 = fma(cb4._m5.x, TEXCOORD2.z, fma(cb4._m1.x, TEXCOORD2.x, _293)) + cb4._m7.x;
        precise float _318 = fma(cb4._m5.y, TEXCOORD2.z, fma(cb4._m1.y, TEXCOORD2.x, _294)) + cb4._m7.y;
        precise float _319 = fma(cb4._m5.z, TEXCOORD2.z, fma(cb4._m1.z, TEXCOORD2.x, _295)) + cb4._m7.z;
        precise float _328 = (_287 ? _317 : TEXCOORD2.x) - cb4._m11.x;
        precise float _329 = (_287 ? _318 : TEXCOORD2.y) - cb4._m11.y;
        precise float _330 = (_287 ? _319 : TEXCOORD2.z) - cb4._m11.z;
        precise float _336 = _328 * cb4._m9.x;
        precise float _337 = _329 * cb4._m9.y;
        precise float _338 = _330 * cb4._m9.z;
        vec4 _347 = texture(sampler3D(t2, s1), vec3(spvNMax(fma(_336, 0.25, 0.75), fma(cb4._m0.z, 0.5, 0.75)), _337, _338));
        _352 = _347.w;
        _353 = _347.z;
        _354 = _347.y;
        _355 = _347.x;
    }
    else
    {
        _352 = 1.0;
        _353 = 1.0;
        _354 = 1.0;
        _355 = 1.0;
    }
    precise float _362 = spvNClamp(dp4_f32(vec4(_355, _354, _353, _352), cb2._m47), 0.0, 1.0);
    precise float _365 = 1.0 - cb0._m5.x;
    precise float _366 = -_169;
    precise float _367 = -_170;
    precise float _368 = -_171;
    vec3 _376 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    float _377 = dp3_f32(vec3(_366, _367, _368), _376);
    precise float _378 = _377 + _377;
    precise float _379 = -_378;
    precise float _380 = fma(TEXCOORD1.x, _379, _366);
    precise float _381 = fma(TEXCOORD1.y, _379, _367);
    precise float _382 = fma(TEXCOORD1.z, _379, _368);
    precise float _388 = _362 * cb0._m2.x;
    precise float _389 = _362 * cb0._m2.y;
    precise float _390 = _362 * cb0._m2.z;
    vec4 _391 = vec4(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z, 1.0);
    float _482;
    float _483;
    float _484;
    if (_280)
    {
        bool _397 = cb4._m0.y == 1.0;
        precise float _403 = TEXCOORD2.y * cb4._m3.x;
        precise float _404 = TEXCOORD2.y * cb4._m3.y;
        precise float _405 = TEXCOORD2.y * cb4._m3.z;
        precise float _427 = fma(cb4._m5.x, TEXCOORD2.z, fma(cb4._m1.x, TEXCOORD2.x, _403)) + cb4._m7.x;
        precise float _428 = fma(cb4._m5.y, TEXCOORD2.z, fma(cb4._m1.y, TEXCOORD2.x, _404)) + cb4._m7.y;
        precise float _429 = fma(cb4._m5.z, TEXCOORD2.z, fma(cb4._m1.z, TEXCOORD2.x, _405)) + cb4._m7.z;
        precise float _438 = (_397 ? _427 : TEXCOORD2.x) - cb4._m11.x;
        precise float _439 = (_397 ? _428 : TEXCOORD2.y) - cb4._m11.y;
        precise float _440 = (_397 ? _429 : TEXCOORD2.z) - cb4._m11.z;
        precise float _446 = _438 * cb4._m9.x;
        precise float _447 = _439 * cb4._m9.y;
        precise float _448 = _440 * cb4._m9.z;
        precise float _449 = _446 * 0.25;
        precise float _452 = cb4._m0.z * 0.5;
        precise float _456 = spvNMin(fma(-cb4._m0.z, 0.5, 0.25), spvNMax(_449, _452));
        precise float _460 = _456 + 0.25;
        precise float _461 = _447 + 0.0;
        precise float _462 = _448 + 0.0;
        precise float _466 = _456 + 0.5;
        _482 = dp4_f32(texture(sampler3D(t2, s1), vec3(_466, _461, _462)), _391);
        _483 = dp4_f32(texture(sampler3D(t2, s1), vec3(_460, _461, _462)), _391);
        _484 = dp4_f32(texture(sampler3D(t2, s1), vec3(_456, _447, _448)), _391);
    }
    else
    {
        _482 = dp4_f32(cb2._m42, _391);
        _483 = dp4_f32(cb2._m41, _391);
        _484 = dp4_f32(cb2._m40, _391);
    }
    precise float _491 = _484 + TEXCOORD3.x;
    precise float _492 = _483 + TEXCOORD3.y;
    precise float _493 = _482 + TEXCOORD3.z;
    vec3 _501 = vec3(_380, _381, _382);
    float _550;
    float _551;
    float _552;
    if (cb3._m5 > 0.0)
    {
        precise float _505 = inversesqrt(dp3_f32(_501, _501));
        precise float _506 = _505 * _380;
        precise float _507 = _505 * _381;
        precise float _508 = _505 * _382;
        precise float _514 = cb3._m0.x - TEXCOORD2.x;
        precise float _515 = cb3._m0.y - TEXCOORD2.y;
        precise float _516 = cb3._m0.z - TEXCOORD2.z;
        precise float _517 = _514 / _506;
        precise float _518 = _515 / _507;
        precise float _519 = _516 / _508;
        precise float _525 = cb3._m2.x - TEXCOORD2.x;
        precise float _526 = cb3._m2.y - TEXCOORD2.y;
        precise float _527 = cb3._m2.z - TEXCOORD2.z;
        precise float _528 = _525 / _506;
        precise float _529 = _526 / _507;
        precise float _530 = _527 / _508;
        precise float _538 = spvNMin((_508 > 0.0) ? _519 : _530, spvNMin((_507 > 0.0) ? _518 : _529, (_506 > 0.0) ? _517 : _528));
        precise float _544 = TEXCOORD2.x - cb3._m4.x;
        precise float _545 = TEXCOORD2.y - cb3._m4.y;
        precise float _546 = TEXCOORD2.z - cb3._m4.z;
        _550 = fma(_508, _538, _546);
        _551 = fma(_507, _538, _545);
        _552 = fma(_506, _538, _544);
    }
    else
    {
        _550 = _382;
        _551 = _381;
        _552 = _380;
    }
    precise float _555 = fma(-_365, 0.699999988079071044921875, 1.7000000476837158203125) * _365;
    precise float _556 = _555 * 6.0;
    vec4 _562 = textureLod(samplerCube(t0, s0), vec3(_552, _551, _550), _556);
    float _563 = _562.x;
    float _564 = _562.y;
    float _565 = _562.z;
    precise float _567 = _562.w - 1.0;
    precise float _574 = log2(fma(cb3._m6.w, _567, 1.0)) * cb3._m6.y;
    precise float _578 = exp2(_574) * cb3._m6.x;
    precise float _579 = _563 * _578;
    precise float _580 = _564 * _578;
    precise float _581 = _565 * _578;
    float _673;
    float _674;
    float _675;
    if (cb3._m3 < 0.999989986419677734375)
    {
        float _638;
        float _639;
        float _640;
        if (cb3._m12 > 0.0)
        {
            precise float _593 = inversesqrt(dp3_f32(_501, _501));
            precise float _594 = _380 * _593;
            precise float _595 = _381 * _593;
            precise float _596 = _382 * _593;
            precise float _602 = cb3._m7.x - TEXCOORD2.x;
            precise float _603 = cb3._m7.y - TEXCOORD2.y;
            precise float _604 = cb3._m7.z - TEXCOORD2.z;
            precise float _605 = _602 / _594;
            precise float _606 = _603 / _595;
            precise float _607 = _604 / _596;
            precise float _613 = cb3._m9.x - TEXCOORD2.x;
            precise float _614 = cb3._m9.y - TEXCOORD2.y;
            precise float _615 = cb3._m9.z - TEXCOORD2.z;
            precise float _616 = _613 / _594;
            precise float _617 = _614 / _595;
            precise float _618 = _615 / _596;
            precise float _626 = spvNMin((_596 > 0.0) ? _607 : _618, spvNMin((_595 > 0.0) ? _606 : _617, (_594 > 0.0) ? _605 : _616));
            precise float _632 = TEXCOORD2.x - cb3._m11.x;
            precise float _633 = TEXCOORD2.y - cb3._m11.y;
            precise float _634 = TEXCOORD2.z - cb3._m11.z;
            _638 = fma(_596, _626, _634);
            _639 = fma(_595, _626, _633);
            _640 = fma(_594, _626, _632);
        }
        else
        {
            _638 = _382;
            _639 = _381;
            _640 = _380;
        }
        vec4 _644 = textureLod(samplerCube(t1, s0), vec3(_640, _639, _638), _556);
        precise float _649 = _644.w - 1.0;
        precise float _656 = log2(fma(cb3._m13.w, _649, 1.0)) * cb3._m13.y;
        precise float _660 = exp2(_656) * cb3._m13.x;
        precise float _661 = _644.x * _660;
        precise float _662 = _644.y * _660;
        precise float _663 = _644.z * _660;
        _673 = fma(cb3._m3, fma(_578, _565, -_663), _663);
        _674 = fma(cb3._m3, fma(_578, _564, -_662), _662);
        _675 = fma(cb3._m3, fma(_578, _563, -_661), _661);
    }
    else
    {
        _673 = _581;
        _674 = _580;
        _675 = _579;
    }
    precise float _677 = inversesqrt(dp3_f32(_376, _376));
    precise float _678 = _677 * TEXCOORD1.x;
    precise float _679 = _677 * TEXCOORD1.y;
    precise float _680 = _677 * TEXCOORD1.z;
    precise float _681 = _274 - 0.039999999105930328369140625;
    precise float _682 = _275 - 0.039999999105930328369140625;
    precise float _683 = _276 - 0.039999999105930328369140625;
    precise float _686 = fma(cb0._m5.y, _681, 0.039999999105930328369140625);
    precise float _687 = fma(cb0._m5.y, _682, 0.039999999105930328369140625);
    precise float _688 = fma(cb0._m5.y, _683, 0.039999999105930328369140625);
    precise float _690 = fma(-cb0._m5.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _691 = _690 * _274;
    precise float _692 = _690 * _275;
    precise float _693 = _690 * _276;
    precise float _699 = fma(_163, _168, cb2._m0.x);
    precise float _700 = fma(_164, _168, cb2._m0.y);
    precise float _701 = fma(_165, _168, cb2._m0.z);
    vec3 _702 = vec3(_699, _700, _701);
    precise float _705 = inversesqrt(spvNMax(dp3_f32(_702, _702), 0.001000000047497451305389404296875));
    precise float _706 = _705 * _699;
    precise float _707 = _705 * _700;
    precise float _708 = _705 * _701;
    vec3 _709 = vec3(_678, _679, _680);
    precise float _713 = spvNClamp(dp3_f32(_709, cb2._m0), 0.0, 1.0);
    vec3 _714 = vec3(_706, _707, _708);
    precise float _716 = spvNClamp(dp3_f32(_709, _714), 0.0, 1.0);
    precise float _718 = spvNClamp(dp3_f32(cb2._m0, _714), 0.0, 1.0);
    precise float _719 = _718 * _718;
    precise float _723 = dp2_f32(vec2(_719), vec2(_365)) - 0.5;
    precise float _724 = 1.0 - _713;
    precise float _725 = _724 * _724;
    precise float _726 = _725 * _725;
    precise float _727 = _724 * _726;
    precise float _729 = abs(dp3_f32(_709, vec3(_169, _170, _171)));
    precise float _730 = 1.0 - _729;
    precise float _731 = _730 * _730;
    precise float _732 = _731 * _731;
    precise float _733 = _730 * _732;
    precise float _735 = fma(_723, _733, 1.0) * fma(_723, _727, 1.0);
    precise float _736 = _365 * _365;
    precise float _737 = spvNMax(_736, 0.00200000009499490261077880859375);
    precise float _738 = 1.0 - _737;
    precise float _741 = _729 * fma(_713, _738, _737);
    precise float _743 = fma(_713, fma(_729, _738, _737), _741) + 9.9999997473787516355514526367188e-06;
    precise float _744 = 0.5 / _743;
    precise float _745 = _737 * _737;
    precise float _748 = fma(fma(_716, _745, -_716), _716, 1.0);
    precise float _749 = _745 * 0.3183098733425140380859375;
    precise float _751 = _749 / fma(_748, _748, 1.0000000116860974230803549289703e-07);
    precise float _752 = _744 * _751;
    precise float _753 = _752 * 3.1415927410125732421875;
    precise float _754 = _713 * _735;
    precise float _755 = _713 * _753;
    precise float _758 = 1.0 / fma(_737, _737, 1.0);
    vec3 _759 = vec3(_686, _687, _688);
    precise float _763 = spvNMax(_755, 0.0) * ((dp3_f32(_759, _759) == 0.0) ? 0.0 : 1.0);
    precise float _764 = cb0._m5.x - _690;
    precise float _765 = _764 + 1.0;
    precise float _766 = spvNClamp(_765, 0.0, 1.0);
    precise float _770 = _388 * _763;
    precise float _771 = _389 * _763;
    precise float _772 = _390 * _763;
    precise float _773 = 1.0 - _718;
    precise float _774 = _773 * _773;
    precise float _775 = _774 * _774;
    precise float _776 = _773 * _775;
    precise float _777 = 1.0 - _686;
    precise float _778 = 1.0 - _687;
    precise float _779 = 1.0 - _688;
    precise float _783 = fma(_777, _776, _686) * _770;
    precise float _784 = fma(_778, _776, _687) * _771;
    precise float _785 = fma(_779, _776, _688) * _772;
    precise float _789 = _675 * _758;
    precise float _790 = _674 * _758;
    precise float _791 = _673 * _758;
    precise float _792 = _766 - _686;
    precise float _793 = _766 - _687;
    precise float _794 = _766 - _688;
    SV_Target.x = fma(_789, fma(_733, _792, _686), fma(_691, fma(_388, _754, spvNMax(_491, 0.0)), _783));
    SV_Target.y = fma(_790, fma(_733, _793, _687), fma(_692, fma(_389, _754, spvNMax(_492, 0.0)), _784));
    SV_Target.z = fma(_791, fma(_733, _794, _688), fma(_693, fma(_390, _754, spvNMax(_493, 0.0)), _785));
    SV_Target.w = 1.0;
}

