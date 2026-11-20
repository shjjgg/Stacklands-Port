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

layout(set = 0, binding = 5, std140) uniform cb5_buf
{
    uvec4 m;
} cb5;

layout(set = 0, binding = 6, std140) uniform cb6_buf
{
    vec4 m[4096];
} cb6;

layout(set = 0, binding = 7) uniform sampler s0;
layout(set = 0, binding = 8) uniform sampler s1;
layout(set = 0, binding = 9) uniform sampler s2;
layout(set = 0, binding = 10) uniform texture2D t0;
layout(set = 0, binding = 11) uniform textureCube t1;
layout(set = 0, binding = 12) uniform textureCube t2;
layout(set = 0, binding = 13) uniform texture3D t3;

layout(location = 1, component = 0) in vec2 TEXCOORD;
layout(location = 2, component = 0) in vec3 TEXCOORD1;
layout(location = 3, component = 0) in vec3 TEXCOORD2;
layout(location = 4, component = 0) in vec3 TEXCOORD3;
layout(location = 7, component = 0) flat in uint SV_InstanceID;
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
    precise float _141 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _141));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _124 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _124)));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _112 = a.x * b.x;
    return fma(a.y, b.y, _112);
}

void main()
{
    precise float _171 = cb1._m4.x - TEXCOORD2.x;
    precise float _172 = cb1._m4.y - TEXCOORD2.y;
    precise float _173 = cb1._m4.z - TEXCOORD2.z;
    vec3 _174 = vec3(_171, _172, _173);
    precise float _176 = inversesqrt(dp3_f32(_174, _174));
    precise float _177 = _171 * _176;
    precise float _178 = _172 * _176;
    precise float _179 = _173 * _176;
    vec4 _189 = texture(sampler2D(t0, s2), vec2(TEXCOORD.x, TEXCOORD.y));
    precise float _199 = _189.x * cb0._m6.x;
    precise float _200 = _189.y * cb0._m6.y;
    precise float _201 = _189.z * cb0._m6.z;
    precise float _202 = TEXCOORD.y + TEXCOORD.x;
    precise float _203 = _202 * 10.0;
    precise float _206 = roundEven(fract(_203)) + 0.800000011920928955078125;
    precise float _207 = spvNMin(_206, 1.0);
    precise float _208 = _207 * _199;
    precise float _209 = _207 * _200;
    precise float _210 = _207 * _201;
    bool _218 = (((TEXCOORD.x < 0.13677684962749481201171875) || (TEXCOORD.x > 0.863223135471343994140625)) || (TEXCOORD.y < 0.0500000007450580596923828125)) || (TEXCOORD.y > 0.949999988079071044921875);
    float _219 = _218 ? 0.0 : _208;
    float _220 = _218 ? 0.0 : _209;
    float _221 = _218 ? 0.0 : _210;
    uint _222 = (SV_InstanceID + cb5.m.x) * 7u;
    bool _227 = cb4._m0.x == 1.0;
    float _305;
    float _306;
    float _307;
    float _308;
    if (_227)
    {
        bool _236 = cb4._m0.y == 1.0;
        precise float _242 = TEXCOORD2.y * cb4._m3.x;
        precise float _243 = TEXCOORD2.y * cb4._m3.y;
        precise float _244 = TEXCOORD2.y * cb4._m3.z;
        precise float _266 = fma(cb4._m5.x, TEXCOORD2.z, fma(cb4._m1.x, TEXCOORD2.x, _242)) + cb4._m7.x;
        precise float _267 = fma(cb4._m5.y, TEXCOORD2.z, fma(cb4._m1.y, TEXCOORD2.x, _243)) + cb4._m7.y;
        precise float _268 = fma(cb4._m5.z, TEXCOORD2.z, fma(cb4._m1.z, TEXCOORD2.x, _244)) + cb4._m7.z;
        precise float _277 = (_236 ? _266 : TEXCOORD2.x) - cb4._m11.x;
        precise float _278 = (_236 ? _267 : TEXCOORD2.y) - cb4._m11.y;
        precise float _279 = (_236 ? _268 : TEXCOORD2.z) - cb4._m11.z;
        precise float _285 = _277 * cb4._m9.x;
        precise float _286 = _278 * cb4._m9.y;
        precise float _287 = _279 * cb4._m9.z;
        vec4 _296 = texture(sampler3D(t3, s1), vec3(spvNMax(fma(_285, 0.25, 0.75), fma(cb4._m0.z, 0.5, 0.75)), _286, _287));
        _305 = _296.w;
        _306 = _296.z;
        _307 = _296.y;
        _308 = _296.x;
    }
    else
    {
        uint _301 = _222 + 6u;
        _305 = cb6.m[_301].w;
        _306 = cb6.m[_301].w;
        _307 = cb6.m[_301].w;
        _308 = cb6.m[_301].w;
    }
    precise float _315 = spvNClamp(dp4_f32(vec4(_308, _307, _306, _305), cb2._m47), 0.0, 1.0);
    precise float _318 = 1.0 - cb0._m5.x;
    precise float _319 = -_177;
    precise float _320 = -_178;
    precise float _321 = -_179;
    vec3 _329 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    float _330 = dp3_f32(vec3(_319, _320, _321), _329);
    precise float _331 = _330 + _330;
    precise float _332 = -_331;
    precise float _333 = fma(TEXCOORD1.x, _332, _319);
    precise float _334 = fma(TEXCOORD1.y, _332, _320);
    precise float _335 = fma(TEXCOORD1.z, _332, _321);
    precise float _341 = _315 * cb0._m2.x;
    precise float _342 = _315 * cb0._m2.y;
    precise float _343 = _315 * cb0._m2.z;
    vec4 _344 = vec4(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z, 1.0);
    float _437;
    float _438;
    float _439;
    if (_227)
    {
        bool _350 = cb4._m0.y == 1.0;
        precise float _356 = TEXCOORD2.y * cb4._m3.x;
        precise float _357 = TEXCOORD2.y * cb4._m3.y;
        precise float _358 = TEXCOORD2.y * cb4._m3.z;
        precise float _380 = fma(cb4._m5.x, TEXCOORD2.z, fma(cb4._m1.x, TEXCOORD2.x, _356)) + cb4._m7.x;
        precise float _381 = fma(cb4._m5.y, TEXCOORD2.z, fma(cb4._m1.y, TEXCOORD2.x, _357)) + cb4._m7.y;
        precise float _382 = fma(cb4._m5.z, TEXCOORD2.z, fma(cb4._m1.z, TEXCOORD2.x, _358)) + cb4._m7.z;
        precise float _391 = (_350 ? _380 : TEXCOORD2.x) - cb4._m11.x;
        precise float _392 = (_350 ? _381 : TEXCOORD2.y) - cb4._m11.y;
        precise float _393 = (_350 ? _382 : TEXCOORD2.z) - cb4._m11.z;
        precise float _399 = _391 * cb4._m9.x;
        precise float _400 = _392 * cb4._m9.y;
        precise float _401 = _393 * cb4._m9.z;
        precise float _402 = _399 * 0.25;
        precise float _405 = cb4._m0.z * 0.5;
        precise float _409 = spvNMin(fma(-cb4._m0.z, 0.5, 0.25), spvNMax(_402, _405));
        precise float _413 = _409 + 0.25;
        precise float _414 = _400 + 0.0;
        precise float _415 = _401 + 0.0;
        precise float _419 = _409 + 0.5;
        _437 = dp4_f32(texture(sampler3D(t3, s1), vec3(_419, _414, _415)), _344);
        _438 = dp4_f32(texture(sampler3D(t3, s1), vec3(_413, _414, _415)), _344);
        _439 = dp4_f32(texture(sampler3D(t3, s1), vec3(_409, _400, _401)), _344);
    }
    else
    {
        _437 = dp4_f32(cb6.m[_222 + 2u], _344);
        _438 = dp4_f32(cb6.m[_222 + 1u], _344);
        _439 = dp4_f32(cb6.m[_222], _344);
    }
    precise float _446 = _439 + TEXCOORD3.x;
    precise float _447 = _438 + TEXCOORD3.y;
    precise float _448 = _437 + TEXCOORD3.z;
    vec3 _456 = vec3(_333, _334, _335);
    float _505;
    float _506;
    float _507;
    if (cb3._m5 > 0.0)
    {
        precise float _460 = inversesqrt(dp3_f32(_456, _456));
        precise float _461 = _460 * _333;
        precise float _462 = _460 * _334;
        precise float _463 = _460 * _335;
        precise float _469 = cb3._m0.x - TEXCOORD2.x;
        precise float _470 = cb3._m0.y - TEXCOORD2.y;
        precise float _471 = cb3._m0.z - TEXCOORD2.z;
        precise float _472 = _469 / _461;
        precise float _473 = _470 / _462;
        precise float _474 = _471 / _463;
        precise float _480 = cb3._m2.x - TEXCOORD2.x;
        precise float _481 = cb3._m2.y - TEXCOORD2.y;
        precise float _482 = cb3._m2.z - TEXCOORD2.z;
        precise float _483 = _480 / _461;
        precise float _484 = _481 / _462;
        precise float _485 = _482 / _463;
        precise float _493 = spvNMin((_463 > 0.0) ? _474 : _485, spvNMin((_462 > 0.0) ? _473 : _484, (_461 > 0.0) ? _472 : _483));
        precise float _499 = TEXCOORD2.x - cb3._m4.x;
        precise float _500 = TEXCOORD2.y - cb3._m4.y;
        precise float _501 = TEXCOORD2.z - cb3._m4.z;
        _505 = fma(_463, _493, _501);
        _506 = fma(_462, _493, _500);
        _507 = fma(_461, _493, _499);
    }
    else
    {
        _505 = _335;
        _506 = _334;
        _507 = _333;
    }
    precise float _510 = fma(-_318, 0.699999988079071044921875, 1.7000000476837158203125) * _318;
    precise float _511 = _510 * 6.0;
    vec4 _517 = textureLod(samplerCube(t1, s0), vec3(_507, _506, _505), _511);
    float _518 = _517.x;
    float _519 = _517.y;
    float _520 = _517.z;
    precise float _522 = _517.w - 1.0;
    precise float _529 = log2(fma(cb3._m6.w, _522, 1.0)) * cb3._m6.y;
    precise float _533 = exp2(_529) * cb3._m6.x;
    precise float _534 = _518 * _533;
    precise float _535 = _519 * _533;
    precise float _536 = _520 * _533;
    float _628;
    float _629;
    float _630;
    if (cb3._m3 < 0.999989986419677734375)
    {
        float _593;
        float _594;
        float _595;
        if (cb3._m12 > 0.0)
        {
            precise float _548 = inversesqrt(dp3_f32(_456, _456));
            precise float _549 = _548 * _333;
            precise float _550 = _548 * _334;
            precise float _551 = _548 * _335;
            precise float _557 = cb3._m7.x - TEXCOORD2.x;
            precise float _558 = cb3._m7.y - TEXCOORD2.y;
            precise float _559 = cb3._m7.z - TEXCOORD2.z;
            precise float _560 = _557 / _549;
            precise float _561 = _558 / _550;
            precise float _562 = _559 / _551;
            precise float _568 = cb3._m9.x - TEXCOORD2.x;
            precise float _569 = cb3._m9.y - TEXCOORD2.y;
            precise float _570 = cb3._m9.z - TEXCOORD2.z;
            precise float _571 = _568 / _549;
            precise float _572 = _569 / _550;
            precise float _573 = _570 / _551;
            precise float _581 = spvNMin((_551 > 0.0) ? _562 : _573, spvNMin((_550 > 0.0) ? _561 : _572, (_549 > 0.0) ? _560 : _571));
            precise float _587 = TEXCOORD2.x - cb3._m11.x;
            precise float _588 = TEXCOORD2.y - cb3._m11.y;
            precise float _589 = TEXCOORD2.z - cb3._m11.z;
            _593 = fma(_551, _581, _589);
            _594 = fma(_550, _581, _588);
            _595 = fma(_549, _581, _587);
        }
        else
        {
            _593 = _335;
            _594 = _334;
            _595 = _333;
        }
        vec4 _599 = textureLod(samplerCube(t2, s0), vec3(_595, _594, _593), _511);
        precise float _604 = _599.w - 1.0;
        precise float _611 = log2(fma(cb3._m13.w, _604, 1.0)) * cb3._m13.y;
        precise float _615 = exp2(_611) * cb3._m13.x;
        precise float _616 = _599.x * _615;
        precise float _617 = _599.y * _615;
        precise float _618 = _599.z * _615;
        _628 = fma(cb3._m3, fma(_533, _520, -_618), _618);
        _629 = fma(cb3._m3, fma(_533, _519, -_617), _617);
        _630 = fma(cb3._m3, fma(_533, _518, -_616), _616);
    }
    else
    {
        _628 = _536;
        _629 = _535;
        _630 = _534;
    }
    precise float _632 = inversesqrt(dp3_f32(_329, _329));
    precise float _633 = _632 * TEXCOORD1.x;
    precise float _634 = _632 * TEXCOORD1.y;
    precise float _635 = _632 * TEXCOORD1.z;
    precise float _636 = _219 - 0.039999999105930328369140625;
    precise float _637 = _220 - 0.039999999105930328369140625;
    precise float _638 = _221 - 0.039999999105930328369140625;
    precise float _641 = fma(cb0._m5.y, _636, 0.039999999105930328369140625);
    precise float _642 = fma(cb0._m5.y, _637, 0.039999999105930328369140625);
    precise float _643 = fma(cb0._m5.y, _638, 0.039999999105930328369140625);
    precise float _645 = fma(-cb0._m5.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _646 = _645 * _219;
    precise float _647 = _645 * _220;
    precise float _648 = _645 * _221;
    precise float _654 = fma(_171, _176, cb2._m0.x);
    precise float _655 = fma(_172, _176, cb2._m0.y);
    precise float _656 = fma(_173, _176, cb2._m0.z);
    vec3 _657 = vec3(_654, _655, _656);
    precise float _660 = inversesqrt(spvNMax(dp3_f32(_657, _657), 0.001000000047497451305389404296875));
    precise float _661 = _654 * _660;
    precise float _662 = _655 * _660;
    precise float _663 = _656 * _660;
    vec3 _664 = vec3(_633, _634, _635);
    precise float _668 = spvNClamp(dp3_f32(_664, cb2._m0), 0.0, 1.0);
    vec3 _669 = vec3(_661, _662, _663);
    precise float _671 = spvNClamp(dp3_f32(_664, _669), 0.0, 1.0);
    precise float _673 = spvNClamp(dp3_f32(cb2._m0, _669), 0.0, 1.0);
    precise float _674 = _673 * _673;
    precise float _678 = dp2_f32(vec2(_674), vec2(_318)) - 0.5;
    precise float _679 = 1.0 - _668;
    precise float _680 = _679 * _679;
    precise float _681 = _680 * _680;
    precise float _682 = _679 * _681;
    precise float _684 = abs(dp3_f32(_664, vec3(_177, _178, _179)));
    precise float _685 = 1.0 - _684;
    precise float _686 = _685 * _685;
    precise float _687 = _686 * _686;
    precise float _688 = _685 * _687;
    precise float _690 = fma(_678, _688, 1.0) * fma(_678, _682, 1.0);
    precise float _691 = _668 * _690;
    precise float _692 = _318 * _318;
    precise float _693 = spvNMax(_692, 0.00200000009499490261077880859375);
    precise float _694 = 1.0 - _693;
    precise float _697 = _684 * fma(_668, _694, _693);
    precise float _699 = fma(_668, fma(_684, _694, _693), _697) + 9.9999997473787516355514526367188e-06;
    precise float _700 = 0.5 / _699;
    precise float _701 = _693 * _693;
    precise float _704 = fma(fma(_671, _701, -_671), _671, 1.0);
    precise float _705 = _701 * 0.3183098733425140380859375;
    precise float _707 = _705 / fma(_704, _704, 1.0000000116860974230803549289703e-07);
    precise float _708 = _707 * _700;
    precise float _709 = _708 * 3.1415927410125732421875;
    precise float _710 = _668 * _709;
    precise float _713 = 1.0 / fma(_693, _693, 1.0);
    vec3 _714 = vec3(_641, _642, _643);
    precise float _718 = ((dp3_f32(_714, _714) == 0.0) ? 0.0 : 1.0) * spvNMax(_710, 0.0);
    precise float _719 = cb0._m5.x - _645;
    precise float _720 = _719 + 1.0;
    precise float _721 = spvNClamp(_720, 0.0, 1.0);
    precise float _725 = _341 * _718;
    precise float _726 = _342 * _718;
    precise float _727 = _343 * _718;
    precise float _728 = 1.0 - _673;
    precise float _729 = _728 * _728;
    precise float _730 = _729 * _729;
    precise float _731 = _728 * _730;
    precise float _732 = 1.0 - _641;
    precise float _733 = 1.0 - _642;
    precise float _734 = 1.0 - _643;
    precise float _738 = _725 * fma(_732, _731, _641);
    precise float _739 = _726 * fma(_733, _731, _642);
    precise float _740 = _727 * fma(_734, _731, _643);
    precise float _744 = _630 * _713;
    precise float _745 = _629 * _713;
    precise float _746 = _628 * _713;
    precise float _747 = _721 - _641;
    precise float _748 = _721 - _642;
    precise float _749 = _721 - _643;
    SV_Target.x = fma(_744, fma(_688, _747, _641), fma(_646, fma(_341, _691, spvNMax(_446, 0.0)), _738));
    SV_Target.y = fma(_745, fma(_688, _748, _642), fma(_647, fma(_342, _691, spvNMax(_447, 0.0)), _739));
    SV_Target.z = fma(_746, fma(_688, _749, _643), fma(_648, fma(_343, _691, spvNMax(_448, 0.0)), _740));
    SV_Target.w = 1.0;
}

