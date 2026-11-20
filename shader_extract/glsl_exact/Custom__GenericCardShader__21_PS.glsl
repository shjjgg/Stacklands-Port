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
layout(set = 0, binding = 9) uniform textureCube t0;
layout(set = 0, binding = 10) uniform textureCube t1;
layout(set = 0, binding = 11) uniform texture3D t2;

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
    precise float _139 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _139));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _128 = a.x * b.x;
    return fma(a.y, b.y, _128);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _110 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _110)));
}

void main()
{
    precise float _169 = cb1._m4.x - TEXCOORD2.x;
    precise float _170 = cb1._m4.y - TEXCOORD2.y;
    precise float _171 = cb1._m4.z - TEXCOORD2.z;
    vec3 _172 = vec3(_169, _170, _171);
    precise float _174 = inversesqrt(dp3_f32(_172, _172));
    precise float _175 = _169 * _174;
    precise float _176 = _170 * _174;
    precise float _177 = _171 * _174;
    precise float _180 = TEXCOORD.y - 0.5;
    precise float _181 = _180 * 0.3333333432674407958984375;
    precise float _182 = _180 * 150.0;
    precise float _187 = abs(dFdy(_181)) + abs(dFdx(_181));
    precise float _190 = sin(roundEven(_182)) * 43758.546875;
    precise float _192 = fract(_190) - 0.5;
    precise float _195 = fma(_192, 0.004999999888241291046142578125, TEXCOORD.x);
    precise float _196 = _195 * 150.0;
    precise float _199 = sin(roundEven(_196)) * 43758.546875;
    precise float _201 = fract(_199) - 0.5;
    precise float _212 = cb0._m8.x - cb0._m10.x;
    precise float _213 = cb0._m8.y - cb0._m10.x;
    precise float _216 = abs(_195) - _212;
    precise float _217 = abs(fma(_201, 0.00166666670702397823333740234375, _181)) - _213;
    vec2 _220 = vec2(spvNMax(_216, 0.0), spvNMax(_217, 0.0));
    precise float _223 = sqrt(dp2_f32(_220, _220)) / _187;
    precise float _224 = spvNMin(_223, 1.0);
    precise float _233 = fma(_224, -cb0._m6.x, cb0._m6.x);
    precise float _234 = fma(_224, -cb0._m6.y, cb0._m6.y);
    precise float _235 = fma(_224, -cb0._m6.z, cb0._m6.z);
    uint _236 = (SV_InstanceID + cb5.m.x) * 7u;
    bool _240 = cb4._m0.x == 1.0;
    float _319;
    float _320;
    float _321;
    float _322;
    if (_240)
    {
        bool _250 = cb4._m0.y == 1.0;
        precise float _256 = TEXCOORD2.y * cb4._m3.x;
        precise float _257 = TEXCOORD2.y * cb4._m3.y;
        precise float _258 = TEXCOORD2.y * cb4._m3.z;
        precise float _280 = fma(cb4._m5.x, TEXCOORD2.z, fma(cb4._m1.x, TEXCOORD2.x, _256)) + cb4._m7.x;
        precise float _281 = fma(cb4._m5.y, TEXCOORD2.z, fma(cb4._m1.y, TEXCOORD2.x, _257)) + cb4._m7.y;
        precise float _282 = fma(cb4._m5.z, TEXCOORD2.z, fma(cb4._m1.z, TEXCOORD2.x, _258)) + cb4._m7.z;
        precise float _291 = (_250 ? _280 : TEXCOORD2.x) - cb4._m11.x;
        precise float _292 = (_250 ? _281 : TEXCOORD2.y) - cb4._m11.y;
        precise float _293 = (_250 ? _282 : TEXCOORD2.z) - cb4._m11.z;
        precise float _299 = _291 * cb4._m9.x;
        precise float _300 = _292 * cb4._m9.y;
        precise float _301 = _293 * cb4._m9.z;
        vec4 _310 = texture(sampler3D(t2, s1), vec3(spvNMax(fma(_299, 0.25, 0.75), fma(cb4._m0.z, 0.5, 0.75)), _300, _301));
        _319 = _310.w;
        _320 = _310.z;
        _321 = _310.y;
        _322 = _310.x;
    }
    else
    {
        uint _315 = _236 + 6u;
        _319 = cb6.m[_315].w;
        _320 = cb6.m[_315].w;
        _321 = cb6.m[_315].w;
        _322 = cb6.m[_315].w;
    }
    precise float _329 = spvNClamp(dp4_f32(vec4(_322, _321, _320, _319), cb2._m47), 0.0, 1.0);
    precise float _332 = 1.0 - cb0._m5.x;
    precise float _333 = -_175;
    precise float _334 = -_176;
    precise float _335 = -_177;
    vec3 _343 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    float _344 = dp3_f32(vec3(_333, _334, _335), _343);
    precise float _345 = _344 + _344;
    precise float _346 = -_345;
    precise float _347 = fma(TEXCOORD1.x, _346, _333);
    precise float _348 = fma(TEXCOORD1.y, _346, _334);
    precise float _349 = fma(TEXCOORD1.z, _346, _335);
    precise float _355 = _329 * cb0._m2.x;
    precise float _356 = _329 * cb0._m2.y;
    precise float _357 = _329 * cb0._m2.z;
    vec4 _358 = vec4(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z, 1.0);
    float _451;
    float _452;
    float _453;
    if (_240)
    {
        bool _364 = cb4._m0.y == 1.0;
        precise float _370 = TEXCOORD2.y * cb4._m3.x;
        precise float _371 = TEXCOORD2.y * cb4._m3.y;
        precise float _372 = TEXCOORD2.y * cb4._m3.z;
        precise float _394 = fma(cb4._m5.x, TEXCOORD2.z, fma(cb4._m1.x, TEXCOORD2.x, _370)) + cb4._m7.x;
        precise float _395 = fma(cb4._m5.y, TEXCOORD2.z, fma(cb4._m1.y, TEXCOORD2.x, _371)) + cb4._m7.y;
        precise float _396 = fma(cb4._m5.z, TEXCOORD2.z, fma(cb4._m1.z, TEXCOORD2.x, _372)) + cb4._m7.z;
        precise float _405 = (_364 ? _394 : TEXCOORD2.x) - cb4._m11.x;
        precise float _406 = (_364 ? _395 : TEXCOORD2.y) - cb4._m11.y;
        precise float _407 = (_364 ? _396 : TEXCOORD2.z) - cb4._m11.z;
        precise float _413 = _405 * cb4._m9.x;
        precise float _414 = _406 * cb4._m9.y;
        precise float _415 = _407 * cb4._m9.z;
        precise float _416 = _413 * 0.25;
        precise float _419 = cb4._m0.z * 0.5;
        precise float _423 = spvNMin(fma(-cb4._m0.z, 0.5, 0.25), spvNMax(_416, _419));
        precise float _427 = _423 + 0.25;
        precise float _428 = _414 + 0.0;
        precise float _429 = _415 + 0.0;
        precise float _433 = _423 + 0.5;
        _451 = dp4_f32(texture(sampler3D(t2, s1), vec3(_433, _428, _429)), _358);
        _452 = dp4_f32(texture(sampler3D(t2, s1), vec3(_427, _428, _429)), _358);
        _453 = dp4_f32(texture(sampler3D(t2, s1), vec3(_423, _414, _415)), _358);
    }
    else
    {
        _451 = dp4_f32(cb6.m[_236 + 2u], _358);
        _452 = dp4_f32(cb6.m[_236 + 1u], _358);
        _453 = dp4_f32(cb6.m[_236], _358);
    }
    precise float _460 = _453 + TEXCOORD3.x;
    precise float _461 = _452 + TEXCOORD3.y;
    precise float _462 = _451 + TEXCOORD3.z;
    vec3 _470 = vec3(_347, _348, _349);
    float _519;
    float _520;
    float _521;
    if (cb3._m5 > 0.0)
    {
        precise float _474 = inversesqrt(dp3_f32(_470, _470));
        precise float _475 = _474 * _347;
        precise float _476 = _474 * _348;
        precise float _477 = _474 * _349;
        precise float _483 = cb3._m0.x - TEXCOORD2.x;
        precise float _484 = cb3._m0.y - TEXCOORD2.y;
        precise float _485 = cb3._m0.z - TEXCOORD2.z;
        precise float _486 = _483 / _475;
        precise float _487 = _484 / _476;
        precise float _488 = _485 / _477;
        precise float _494 = cb3._m2.x - TEXCOORD2.x;
        precise float _495 = cb3._m2.y - TEXCOORD2.y;
        precise float _496 = cb3._m2.z - TEXCOORD2.z;
        precise float _497 = _494 / _475;
        precise float _498 = _495 / _476;
        precise float _499 = _496 / _477;
        precise float _507 = spvNMin((_477 > 0.0) ? _488 : _499, spvNMin((_476 > 0.0) ? _487 : _498, (_475 > 0.0) ? _486 : _497));
        precise float _513 = TEXCOORD2.x - cb3._m4.x;
        precise float _514 = TEXCOORD2.y - cb3._m4.y;
        precise float _515 = TEXCOORD2.z - cb3._m4.z;
        _519 = fma(_477, _507, _515);
        _520 = fma(_476, _507, _514);
        _521 = fma(_475, _507, _513);
    }
    else
    {
        _519 = _349;
        _520 = _348;
        _521 = _347;
    }
    precise float _524 = fma(-_332, 0.699999988079071044921875, 1.7000000476837158203125) * _332;
    precise float _525 = _524 * 6.0;
    vec4 _531 = textureLod(samplerCube(t0, s0), vec3(_521, _520, _519), _525);
    float _532 = _531.x;
    float _533 = _531.y;
    float _534 = _531.z;
    precise float _536 = _531.w - 1.0;
    precise float _543 = log2(fma(cb3._m6.w, _536, 1.0)) * cb3._m6.y;
    precise float _547 = exp2(_543) * cb3._m6.x;
    precise float _548 = _532 * _547;
    precise float _549 = _533 * _547;
    precise float _550 = _534 * _547;
    float _642;
    float _643;
    float _644;
    if (cb3._m3 < 0.999989986419677734375)
    {
        float _607;
        float _608;
        float _609;
        if (cb3._m12 > 0.0)
        {
            precise float _562 = inversesqrt(dp3_f32(_470, _470));
            precise float _563 = _562 * _347;
            precise float _564 = _562 * _348;
            precise float _565 = _562 * _349;
            precise float _571 = cb3._m7.x - TEXCOORD2.x;
            precise float _572 = cb3._m7.y - TEXCOORD2.y;
            precise float _573 = cb3._m7.z - TEXCOORD2.z;
            precise float _574 = _571 / _563;
            precise float _575 = _572 / _564;
            precise float _576 = _573 / _565;
            precise float _582 = cb3._m9.x - TEXCOORD2.x;
            precise float _583 = cb3._m9.y - TEXCOORD2.y;
            precise float _584 = cb3._m9.z - TEXCOORD2.z;
            precise float _585 = _582 / _563;
            precise float _586 = _583 / _564;
            precise float _587 = _584 / _565;
            precise float _595 = spvNMin((_565 > 0.0) ? _576 : _587, spvNMin((_564 > 0.0) ? _575 : _586, (_563 > 0.0) ? _574 : _585));
            precise float _601 = TEXCOORD2.x - cb3._m11.x;
            precise float _602 = TEXCOORD2.y - cb3._m11.y;
            precise float _603 = TEXCOORD2.z - cb3._m11.z;
            _607 = fma(_565, _595, _603);
            _608 = fma(_564, _595, _602);
            _609 = fma(_563, _595, _601);
        }
        else
        {
            _607 = _349;
            _608 = _348;
            _609 = _347;
        }
        vec4 _613 = textureLod(samplerCube(t1, s0), vec3(_609, _608, _607), _525);
        precise float _618 = _613.w - 1.0;
        precise float _625 = log2(fma(cb3._m13.w, _618, 1.0)) * cb3._m13.y;
        precise float _629 = exp2(_625) * cb3._m13.x;
        precise float _630 = _613.x * _629;
        precise float _631 = _613.y * _629;
        precise float _632 = _613.z * _629;
        _642 = fma(cb3._m3, fma(_547, _534, -_632), _632);
        _643 = fma(cb3._m3, fma(_547, _533, -_631), _631);
        _644 = fma(cb3._m3, fma(_547, _532, -_630), _630);
    }
    else
    {
        _642 = _550;
        _643 = _549;
        _644 = _548;
    }
    precise float _646 = inversesqrt(dp3_f32(_343, _343));
    precise float _647 = _646 * TEXCOORD1.x;
    precise float _648 = _646 * TEXCOORD1.y;
    precise float _649 = _646 * TEXCOORD1.z;
    precise float _650 = _233 - 0.039999999105930328369140625;
    precise float _651 = _234 - 0.039999999105930328369140625;
    precise float _652 = _235 - 0.039999999105930328369140625;
    precise float _655 = fma(cb0._m5.y, _650, 0.039999999105930328369140625);
    precise float _656 = fma(cb0._m5.y, _651, 0.039999999105930328369140625);
    precise float _657 = fma(cb0._m5.y, _652, 0.039999999105930328369140625);
    precise float _659 = fma(-cb0._m5.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _660 = _659 * _233;
    precise float _661 = _659 * _234;
    precise float _662 = _659 * _235;
    precise float _668 = fma(_169, _174, cb2._m0.x);
    precise float _669 = fma(_170, _174, cb2._m0.y);
    precise float _670 = fma(_171, _174, cb2._m0.z);
    vec3 _671 = vec3(_668, _669, _670);
    precise float _674 = inversesqrt(spvNMax(dp3_f32(_671, _671), 0.001000000047497451305389404296875));
    precise float _675 = _668 * _674;
    precise float _676 = _669 * _674;
    precise float _677 = _670 * _674;
    vec3 _678 = vec3(_647, _648, _649);
    precise float _682 = spvNClamp(dp3_f32(_678, cb2._m0), 0.0, 1.0);
    vec3 _683 = vec3(_675, _676, _677);
    precise float _685 = spvNClamp(dp3_f32(_678, _683), 0.0, 1.0);
    precise float _687 = spvNClamp(dp3_f32(cb2._m0, _683), 0.0, 1.0);
    precise float _688 = _687 * _687;
    precise float _692 = dp2_f32(vec2(_688), vec2(_332)) - 0.5;
    precise float _693 = 1.0 - _682;
    precise float _694 = _693 * _693;
    precise float _695 = _694 * _694;
    precise float _696 = _693 * _695;
    precise float _698 = abs(dp3_f32(_678, vec3(_175, _176, _177)));
    precise float _699 = 1.0 - _698;
    precise float _700 = _699 * _699;
    precise float _701 = _700 * _700;
    precise float _702 = _699 * _701;
    precise float _704 = fma(_692, _702, 1.0) * fma(_692, _696, 1.0);
    precise float _705 = _682 * _704;
    precise float _706 = _332 * _332;
    precise float _707 = spvNMax(_706, 0.00200000009499490261077880859375);
    precise float _708 = 1.0 - _707;
    precise float _711 = _698 * fma(_682, _708, _707);
    precise float _713 = fma(_682, fma(_698, _708, _707), _711) + 9.9999997473787516355514526367188e-06;
    precise float _714 = 0.5 / _713;
    precise float _715 = _707 * _707;
    precise float _718 = fma(fma(_685, _715, -_685), _685, 1.0);
    precise float _719 = _715 * 0.3183098733425140380859375;
    precise float _721 = _719 / fma(_718, _718, 1.0000000116860974230803549289703e-07);
    precise float _722 = _721 * _714;
    precise float _723 = _722 * 3.1415927410125732421875;
    precise float _724 = _682 * _723;
    precise float _727 = 1.0 / fma(_707, _707, 1.0);
    vec3 _728 = vec3(_655, _656, _657);
    precise float _732 = ((dp3_f32(_728, _728) == 0.0) ? 0.0 : 1.0) * spvNMax(_724, 0.0);
    precise float _733 = cb0._m5.x - _659;
    precise float _734 = _733 + 1.0;
    precise float _735 = spvNClamp(_734, 0.0, 1.0);
    precise float _739 = _355 * _732;
    precise float _740 = _356 * _732;
    precise float _741 = _357 * _732;
    precise float _742 = 1.0 - _687;
    precise float _743 = _742 * _742;
    precise float _744 = _743 * _743;
    precise float _745 = _742 * _744;
    precise float _746 = 1.0 - _655;
    precise float _747 = 1.0 - _656;
    precise float _748 = 1.0 - _657;
    precise float _752 = _739 * fma(_746, _745, _655);
    precise float _753 = _740 * fma(_747, _745, _656);
    precise float _754 = _741 * fma(_748, _745, _657);
    precise float _758 = _644 * _727;
    precise float _759 = _643 * _727;
    precise float _760 = _642 * _727;
    precise float _761 = _735 - _655;
    precise float _762 = _735 - _656;
    precise float _763 = _735 - _657;
    SV_Target.x = fma(_758, fma(_702, _761, _655), fma(_660, fma(_355, _705, spvNMax(_460, 0.0)), _752));
    SV_Target.y = fma(_759, fma(_702, _762, _656), fma(_661, fma(_356, _705, spvNMax(_461, 0.0)), _753));
    SV_Target.z = fma(_760, fma(_702, _763, _657), fma(_662, fma(_357, _705, spvNMax(_462, 0.0)), _754));
    SV_Target.w = 1.0;
}

