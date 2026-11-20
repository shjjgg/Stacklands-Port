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
layout(set = 0, binding = 11) uniform texture2D t0;
layout(set = 0, binding = 12) uniform texture2D t1;
layout(set = 0, binding = 13) uniform textureCube t2;
layout(set = 0, binding = 14) uniform textureCube t3;
layout(set = 0, binding = 15) uniform texture3D t4;

layout(location = 1, component = 0) in vec2 TEXCOORD;
layout(location = 2, component = 0) in vec3 TEXCOORD1;
layout(location = 3, component = 0) in vec3 TEXCOORD2;
layout(location = 4, component = 0) in vec3 TEXCOORD3;
layout(location = 5, component = 0) in vec4 TEXCOORD5;
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
    precise float _153 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _153));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _136 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _136)));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _124 = a.x * b.x;
    return fma(a.y, b.y, _124);
}

void main()
{
    precise float _177 = cb1._m4.x - TEXCOORD2.x;
    precise float _178 = cb1._m4.y - TEXCOORD2.y;
    precise float _179 = cb1._m4.z - TEXCOORD2.z;
    vec3 _180 = vec3(_177, _178, _179);
    precise float _182 = inversesqrt(dp3_f32(_180, _180));
    precise float _183 = _182 * _177;
    precise float _184 = _182 * _178;
    precise float _185 = _182 * _179;
    vec4 _195 = texture(sampler2D(t0, s3), vec2(TEXCOORD.x, TEXCOORD.y));
    precise float _205 = _195.x * cb0._m6.x;
    precise float _206 = _195.y * cb0._m6.y;
    precise float _207 = _195.z * cb0._m6.z;
    precise float _208 = TEXCOORD.y + TEXCOORD.x;
    precise float _209 = _208 * 10.0;
    precise float _212 = roundEven(fract(_209)) + 0.800000011920928955078125;
    precise float _213 = spvNMin(_212, 1.0);
    precise float _214 = _213 * _205;
    precise float _215 = _213 * _206;
    precise float _216 = _213 * _207;
    bool _224 = (((TEXCOORD.x < 0.13677684962749481201171875) || (TEXCOORD.x > 0.863223135471343994140625)) || (TEXCOORD.y < 0.0500000007450580596923828125)) || (TEXCOORD.y > 0.949999988079071044921875);
    float _225 = _224 ? 0.0 : _214;
    float _226 = _224 ? 0.0 : _215;
    float _227 = _224 ? 0.0 : _216;
    float _237 = dp3_f32(_180, vec3(cb4._m9.z, cb4._m10.z, cb4._m11.z));
    precise float _244 = TEXCOORD2.x - cb3._m25.x;
    precise float _245 = TEXCOORD2.y - cb3._m25.y;
    precise float _246 = TEXCOORD2.z - cb3._m25.z;
    vec3 _247 = vec3(_244, _245, _246);
    precise float _250 = sqrt(dp3_f32(_247, _247)) - _237;
    bool _263 = cb6._m0.x == 1.0;
    float _335;
    float _336;
    float _337;
    float _338;
    if (_263)
    {
        bool _270 = cb6._m0.y == 1.0;
        precise float _276 = TEXCOORD2.y * cb6._m3.x;
        precise float _277 = TEXCOORD2.y * cb6._m3.y;
        precise float _278 = TEXCOORD2.y * cb6._m3.z;
        precise float _300 = fma(cb6._m5.x, TEXCOORD2.z, fma(cb6._m1.x, TEXCOORD2.x, _276)) + cb6._m7.x;
        precise float _301 = fma(cb6._m5.y, TEXCOORD2.z, fma(cb6._m1.y, TEXCOORD2.x, _277)) + cb6._m7.y;
        precise float _302 = fma(cb6._m5.z, TEXCOORD2.z, fma(cb6._m1.z, TEXCOORD2.x, _278)) + cb6._m7.z;
        precise float _311 = (_270 ? _300 : TEXCOORD2.x) - cb6._m11.x;
        precise float _312 = (_270 ? _301 : TEXCOORD2.y) - cb6._m11.y;
        precise float _313 = (_270 ? _302 : TEXCOORD2.z) - cb6._m11.z;
        precise float _319 = _311 * cb6._m9.x;
        precise float _320 = _312 * cb6._m9.y;
        precise float _321 = _313 * cb6._m9.z;
        vec4 _330 = texture(sampler3D(t4, s1), vec3(spvNMax(fma(_319, 0.25, 0.75), fma(cb6._m0.z, 0.5, 0.75)), _320, _321));
        _335 = _330.w;
        _336 = _330.z;
        _337 = _330.y;
        _338 = _330.x;
    }
    else
    {
        _335 = 1.0;
        _336 = 1.0;
        _337 = 1.0;
        _338 = 1.0;
    }
    precise float _352 = TEXCOORD5.x / TEXCOORD5.w;
    precise float _353 = TEXCOORD5.y / TEXCOORD5.w;
    vec4 _358 = texture(sampler2D(t1, s2), vec2(_352, _353));
    float _359 = _358.x;
    precise float _360 = spvNClamp(dp4_f32(vec4(_338, _337, _336, _335), cb2._m47), 0.0, 1.0) - _359;
    precise float _361 = fma(spvNClamp(fma(fma(cb3._m26, _250, _237), cb3._m24.z, cb3._m24.w), 0.0, 1.0), _360, _359);
    precise float _364 = 1.0 - cb0._m5.x;
    precise float _365 = -_183;
    precise float _366 = -_184;
    precise float _367 = -_185;
    vec3 _375 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    float _376 = dp3_f32(vec3(_365, _366, _367), _375);
    precise float _377 = _376 + _376;
    precise float _378 = -_377;
    precise float _379 = fma(TEXCOORD1.x, _378, _365);
    precise float _380 = fma(TEXCOORD1.y, _378, _366);
    precise float _381 = fma(TEXCOORD1.z, _378, _367);
    precise float _387 = _361 * cb0._m2.x;
    precise float _388 = _361 * cb0._m2.y;
    precise float _389 = _361 * cb0._m2.z;
    vec4 _390 = vec4(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z, 1.0);
    float _481;
    float _482;
    float _483;
    if (_263)
    {
        bool _396 = cb6._m0.y == 1.0;
        precise float _402 = TEXCOORD2.y * cb6._m3.x;
        precise float _403 = TEXCOORD2.y * cb6._m3.y;
        precise float _404 = TEXCOORD2.y * cb6._m3.z;
        precise float _426 = fma(cb6._m5.x, TEXCOORD2.z, fma(cb6._m1.x, TEXCOORD2.x, _402)) + cb6._m7.x;
        precise float _427 = fma(cb6._m5.y, TEXCOORD2.z, fma(cb6._m1.y, TEXCOORD2.x, _403)) + cb6._m7.y;
        precise float _428 = fma(cb6._m5.z, TEXCOORD2.z, fma(cb6._m1.z, TEXCOORD2.x, _404)) + cb6._m7.z;
        precise float _437 = (_396 ? _426 : TEXCOORD2.x) - cb6._m11.x;
        precise float _438 = (_396 ? _427 : TEXCOORD2.y) - cb6._m11.y;
        precise float _439 = (_396 ? _428 : TEXCOORD2.z) - cb6._m11.z;
        precise float _445 = _437 * cb6._m9.x;
        precise float _446 = _438 * cb6._m9.y;
        precise float _447 = _439 * cb6._m9.z;
        precise float _448 = _445 * 0.25;
        precise float _451 = cb6._m0.z * 0.5;
        precise float _455 = spvNMin(fma(-cb6._m0.z, 0.5, 0.25), spvNMax(_448, _451));
        precise float _459 = _455 + 0.25;
        precise float _460 = _446 + 0.0;
        precise float _461 = _447 + 0.0;
        precise float _465 = _455 + 0.5;
        _481 = dp4_f32(texture(sampler3D(t4, s1), vec3(_465, _460, _461)), _390);
        _482 = dp4_f32(texture(sampler3D(t4, s1), vec3(_459, _460, _461)), _390);
        _483 = dp4_f32(texture(sampler3D(t4, s1), vec3(_455, _446, _447)), _390);
    }
    else
    {
        _481 = dp4_f32(cb2._m42, _390);
        _482 = dp4_f32(cb2._m41, _390);
        _483 = dp4_f32(cb2._m40, _390);
    }
    precise float _490 = _483 + TEXCOORD3.x;
    precise float _491 = _482 + TEXCOORD3.y;
    precise float _492 = _481 + TEXCOORD3.z;
    vec3 _500 = vec3(_379, _380, _381);
    float _549;
    float _550;
    float _551;
    if (cb5._m5 > 0.0)
    {
        precise float _504 = inversesqrt(dp3_f32(_500, _500));
        precise float _505 = _504 * _379;
        precise float _506 = _504 * _380;
        precise float _507 = _504 * _381;
        precise float _513 = cb5._m0.x - TEXCOORD2.x;
        precise float _514 = cb5._m0.y - TEXCOORD2.y;
        precise float _515 = cb5._m0.z - TEXCOORD2.z;
        precise float _516 = _513 / _505;
        precise float _517 = _514 / _506;
        precise float _518 = _515 / _507;
        precise float _524 = cb5._m2.x - TEXCOORD2.x;
        precise float _525 = cb5._m2.y - TEXCOORD2.y;
        precise float _526 = cb5._m2.z - TEXCOORD2.z;
        precise float _527 = _524 / _505;
        precise float _528 = _525 / _506;
        precise float _529 = _526 / _507;
        precise float _537 = spvNMin((_507 > 0.0) ? _518 : _529, spvNMin((_506 > 0.0) ? _517 : _528, (_505 > 0.0) ? _516 : _527));
        precise float _543 = TEXCOORD2.x - cb5._m4.x;
        precise float _544 = TEXCOORD2.y - cb5._m4.y;
        precise float _545 = TEXCOORD2.z - cb5._m4.z;
        _549 = fma(_507, _537, _545);
        _550 = fma(_506, _537, _544);
        _551 = fma(_505, _537, _543);
    }
    else
    {
        _549 = _381;
        _550 = _380;
        _551 = _379;
    }
    precise float _554 = fma(-_364, 0.699999988079071044921875, 1.7000000476837158203125) * _364;
    precise float _555 = _554 * 6.0;
    vec4 _561 = textureLod(samplerCube(t2, s0), vec3(_551, _550, _549), _555);
    float _562 = _561.x;
    float _563 = _561.y;
    float _564 = _561.z;
    precise float _566 = _561.w - 1.0;
    precise float _573 = log2(fma(cb5._m6.w, _566, 1.0)) * cb5._m6.y;
    precise float _577 = exp2(_573) * cb5._m6.x;
    precise float _578 = _562 * _577;
    precise float _579 = _563 * _577;
    precise float _580 = _564 * _577;
    float _672;
    float _673;
    float _674;
    if (cb5._m3 < 0.999989986419677734375)
    {
        float _637;
        float _638;
        float _639;
        if (cb5._m12 > 0.0)
        {
            precise float _592 = inversesqrt(dp3_f32(_500, _500));
            precise float _593 = _379 * _592;
            precise float _594 = _380 * _592;
            precise float _595 = _381 * _592;
            precise float _601 = cb5._m7.x - TEXCOORD2.x;
            precise float _602 = cb5._m7.y - TEXCOORD2.y;
            precise float _603 = cb5._m7.z - TEXCOORD2.z;
            precise float _604 = _601 / _593;
            precise float _605 = _602 / _594;
            precise float _606 = _603 / _595;
            precise float _612 = cb5._m9.x - TEXCOORD2.x;
            precise float _613 = cb5._m9.y - TEXCOORD2.y;
            precise float _614 = cb5._m9.z - TEXCOORD2.z;
            precise float _615 = _612 / _593;
            precise float _616 = _613 / _594;
            precise float _617 = _614 / _595;
            precise float _625 = spvNMin((_595 > 0.0) ? _606 : _617, spvNMin((_594 > 0.0) ? _605 : _616, (_593 > 0.0) ? _604 : _615));
            precise float _631 = TEXCOORD2.x - cb5._m11.x;
            precise float _632 = TEXCOORD2.y - cb5._m11.y;
            precise float _633 = TEXCOORD2.z - cb5._m11.z;
            _637 = fma(_595, _625, _633);
            _638 = fma(_594, _625, _632);
            _639 = fma(_593, _625, _631);
        }
        else
        {
            _637 = _381;
            _638 = _380;
            _639 = _379;
        }
        vec4 _643 = textureLod(samplerCube(t3, s0), vec3(_639, _638, _637), _555);
        precise float _648 = _643.w - 1.0;
        precise float _655 = log2(fma(cb5._m13.w, _648, 1.0)) * cb5._m13.y;
        precise float _659 = exp2(_655) * cb5._m13.x;
        precise float _660 = _643.x * _659;
        precise float _661 = _643.y * _659;
        precise float _662 = _643.z * _659;
        _672 = fma(cb5._m3, fma(_577, _564, -_662), _662);
        _673 = fma(cb5._m3, fma(_577, _563, -_661), _661);
        _674 = fma(cb5._m3, fma(_577, _562, -_660), _660);
    }
    else
    {
        _672 = _580;
        _673 = _579;
        _674 = _578;
    }
    precise float _676 = inversesqrt(dp3_f32(_375, _375));
    precise float _677 = _676 * TEXCOORD1.x;
    precise float _678 = _676 * TEXCOORD1.y;
    precise float _679 = _676 * TEXCOORD1.z;
    precise float _680 = _225 - 0.039999999105930328369140625;
    precise float _681 = _226 - 0.039999999105930328369140625;
    precise float _682 = _227 - 0.039999999105930328369140625;
    precise float _685 = fma(cb0._m5.y, _680, 0.039999999105930328369140625);
    precise float _686 = fma(cb0._m5.y, _681, 0.039999999105930328369140625);
    precise float _687 = fma(cb0._m5.y, _682, 0.039999999105930328369140625);
    precise float _689 = fma(-cb0._m5.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _690 = _689 * _225;
    precise float _691 = _689 * _226;
    precise float _692 = _689 * _227;
    precise float _698 = fma(_177, _182, cb2._m0.x);
    precise float _699 = fma(_178, _182, cb2._m0.y);
    precise float _700 = fma(_179, _182, cb2._m0.z);
    vec3 _701 = vec3(_698, _699, _700);
    precise float _704 = inversesqrt(spvNMax(dp3_f32(_701, _701), 0.001000000047497451305389404296875));
    precise float _705 = _704 * _698;
    precise float _706 = _704 * _699;
    precise float _707 = _704 * _700;
    vec3 _708 = vec3(_677, _678, _679);
    precise float _712 = spvNClamp(dp3_f32(_708, cb2._m0), 0.0, 1.0);
    vec3 _713 = vec3(_705, _706, _707);
    precise float _715 = spvNClamp(dp3_f32(_708, _713), 0.0, 1.0);
    precise float _717 = spvNClamp(dp3_f32(cb2._m0, _713), 0.0, 1.0);
    precise float _718 = _717 * _717;
    precise float _722 = dp2_f32(vec2(_718), vec2(_364)) - 0.5;
    precise float _723 = 1.0 - _712;
    precise float _724 = _723 * _723;
    precise float _725 = _724 * _724;
    precise float _726 = _723 * _725;
    precise float _728 = abs(dp3_f32(_708, vec3(_183, _184, _185)));
    precise float _729 = 1.0 - _728;
    precise float _730 = _729 * _729;
    precise float _731 = _730 * _730;
    precise float _732 = _729 * _731;
    precise float _734 = fma(_722, _732, 1.0) * fma(_722, _726, 1.0);
    precise float _735 = _364 * _364;
    precise float _736 = spvNMax(_735, 0.00200000009499490261077880859375);
    precise float _737 = 1.0 - _736;
    precise float _740 = _728 * fma(_712, _737, _736);
    precise float _742 = fma(_712, fma(_728, _737, _736), _740) + 9.9999997473787516355514526367188e-06;
    precise float _743 = 0.5 / _742;
    precise float _744 = _736 * _736;
    precise float _747 = fma(fma(_715, _744, -_715), _715, 1.0);
    precise float _748 = _744 * 0.3183098733425140380859375;
    precise float _750 = _748 / fma(_747, _747, 1.0000000116860974230803549289703e-07);
    precise float _751 = _743 * _750;
    precise float _752 = _751 * 3.1415927410125732421875;
    precise float _753 = _712 * _734;
    precise float _754 = _712 * _752;
    precise float _757 = 1.0 / fma(_736, _736, 1.0);
    vec3 _758 = vec3(_685, _686, _687);
    precise float _762 = spvNMax(_754, 0.0) * ((dp3_f32(_758, _758) == 0.0) ? 0.0 : 1.0);
    precise float _763 = cb0._m5.x - _689;
    precise float _764 = _763 + 1.0;
    precise float _765 = spvNClamp(_764, 0.0, 1.0);
    precise float _769 = _387 * _762;
    precise float _770 = _388 * _762;
    precise float _771 = _389 * _762;
    precise float _772 = 1.0 - _717;
    precise float _773 = _772 * _772;
    precise float _774 = _773 * _773;
    precise float _775 = _772 * _774;
    precise float _776 = 1.0 - _685;
    precise float _777 = 1.0 - _686;
    precise float _778 = 1.0 - _687;
    precise float _782 = fma(_776, _775, _685) * _769;
    precise float _783 = fma(_777, _775, _686) * _770;
    precise float _784 = fma(_778, _775, _687) * _771;
    precise float _788 = _674 * _757;
    precise float _789 = _673 * _757;
    precise float _790 = _672 * _757;
    precise float _791 = _765 - _685;
    precise float _792 = _765 - _686;
    precise float _793 = _765 - _687;
    SV_Target.x = fma(_788, fma(_732, _791, _685), fma(_690, fma(_387, _753, spvNMax(_490, 0.0)), _782));
    SV_Target.y = fma(_789, fma(_732, _792, _686), fma(_691, fma(_388, _753, spvNMax(_491, 0.0)), _783));
    SV_Target.z = fma(_790, fma(_732, _793, _687), fma(_692, fma(_389, _753, spvNMax(_492, 0.0)), _784));
    SV_Target.w = 1.0;
}

