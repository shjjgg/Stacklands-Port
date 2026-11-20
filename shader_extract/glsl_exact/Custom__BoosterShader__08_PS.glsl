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
layout(set = 0, binding = 7) uniform sampler s2;
layout(set = 0, binding = 8) uniform sampler s3;
layout(set = 0, binding = 9) uniform texture2D t0;
layout(set = 0, binding = 10) uniform texture2D t1;
layout(set = 0, binding = 11) uniform textureCube t2;
layout(set = 0, binding = 12) uniform textureCube t3;
layout(set = 0, binding = 13) uniform texture3D t4;

layout(location = 1, component = 0) in vec2 TEXCOORD;
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
    precise float _143 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _143));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _132 = a.x * b.x;
    return fma(a.y, b.y, _132);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _114 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _114)));
}

void main()
{
    precise float _167 = cb1._m4.x - TEXCOORD2.x;
    precise float _168 = cb1._m4.y - TEXCOORD2.y;
    precise float _169 = cb1._m4.z - TEXCOORD2.z;
    vec3 _170 = vec3(_167, _168, _169);
    precise float _172 = inversesqrt(dp3_f32(_170, _170));
    precise float _173 = _172 * _167;
    precise float _174 = _172 * _168;
    precise float _175 = _172 * _169;
    precise float _178 = TEXCOORD.y * 150.0;
    precise float _181 = sin(roundEven(_178)) * 43758.546875;
    precise float _185 = fma(fract(_181), 0.004999999888241291046142578125, TEXCOORD.x);
    precise float _186 = _185 * 150.0;
    precise float _189 = sin(roundEven(_186)) * 43758.546875;
    precise float _191 = fma(fract(_189), 0.004999999888241291046142578125, TEXCOORD.y);
    precise float _200 = abs(dFdx(_185)) + abs(dFdy(_185));
    precise float _201 = abs(dFdx(_191)) + abs(dFdy(_191));
    precise float _202 = TEXCOORD.x - 0.5;
    precise float _203 = TEXCOORD.y - 0.4000000059604644775390625;
    precise float _204 = fma(_202, 1.75, 0.5);
    precise float _205 = fma(_203, 1.75, 0.4000000059604644775390625);
    precise float _217 = float(_204 <= 1.0) * float(_204 >= 0.0);
    precise float _218 = float(_205 >= 0.0) * _217;
    vec4 _224 = texture(sampler2D(t0, s2), vec2(_204, _205));
    float _225 = _224.x;
    float _226 = _224.w;
    precise float _228 = fma(-_218, float(_205 <= 1.0), 1.0);
    precise float _232 = fma(_228, -_226, _226);
    precise float _233 = TEXCOORD2.x - cb1._m4.x;
    precise float _234 = TEXCOORD2.y - cb1._m4.y;
    precise float _235 = TEXCOORD2.z - cb1._m4.z;
    vec3 _236 = vec3(_233, _234, _235);
    precise float _238 = inversesqrt(dp3_f32(_236, _236));
    precise float _239 = _238 * _233;
    precise float _240 = _238 * _235;
    precise float _241 = TEXCOORD.y + TEXCOORD.x;
    precise float _242 = TEXCOORD.y + TEXCOORD.y;
    precise float _246 = fma(-_240, 5.0, _242);
    precise float _247 = _246 * 10.0;
    precise float _249 = fma(sin(_247), 0.0199999995529651641845703125, fma(-_239, 5.0, _241));
    precise float _250 = _249 * 30.0;
    vec4 _257 = texture(sampler2D(t1, s3), vec2(_249, fma(cos(_250), 0.0199999995529651641845703125, _246)));
    vec2 _261 = vec2(fma(_202, 1.75, 0.0), fma(_203, 1.75, -0.0999999940395355224609375));
    precise float _264 = sqrt(dp2_f32(_261, _261)) - 0.400390625;
    precise float _265 = _264 / _200;
    precise float _267 = 1.0 - spvNClamp(_265, 0.0, 1.0);
    precise float _279 = cb0._m8.x - cb0._m6.x;
    precise float _280 = cb0._m8.y - cb0._m6.y;
    precise float _281 = cb0._m8.z - cb0._m6.z;
    precise float _282 = fma(_267, _279, cb0._m6.x);
    precise float _283 = fma(_267, _280, cb0._m6.y);
    precise float _284 = fma(_267, _281, cb0._m6.z);
    precise float _285 = 1.0 - fma(_228, -_225, _225);
    precise float _291 = cb0._m11.x - cb0._m6.x;
    precise float _292 = cb0._m11.y - cb0._m6.y;
    precise float _293 = cb0._m11.z - cb0._m6.z;
    precise float _297 = fma(_285, _291, cb0._m6.x) - _282;
    precise float _298 = fma(_285, _292, cb0._m6.y) - _283;
    precise float _299 = fma(_285, _293, cb0._m6.z) - _284;
    precise float _303 = _185 - 0.1167768537998199462890625;
    precise float _304 = _303 / _200;
    precise float _306 = 0.88322317600250244140625 - _185;
    precise float _307 = _306 / _200;
    precise float _309 = spvNClamp(_307, 0.0, 1.0) * spvNClamp(_304, 0.0, 1.0);
    precise float _310 = _191 - 0.02999999932944774627685546875;
    precise float _311 = _310 / _201;
    precise float _313 = _309 * spvNClamp(_311, 0.0, 1.0);
    precise float _314 = 0.9700000286102294921875 - _191;
    precise float _315 = _314 / _201;
    precise float _317 = _313 * spvNClamp(_315, 0.0, 1.0);
    precise float _318 = fma(_257.x, 0.5, fma(_232, _297, _282));
    precise float _319 = fma(_257.y, 0.5, fma(_232, _298, _283));
    precise float _320 = fma(_257.z, 0.5, fma(_232, _299, _284));
    precise float _321 = _317 * _318;
    precise float _322 = _317 * _319;
    precise float _323 = _317 * _320;
    float _400;
    float _401;
    float _402;
    float _403;
    if (cb4._m0.x == 1.0)
    {
        bool _333 = cb4._m0.y == 1.0;
        precise float _339 = TEXCOORD2.y * cb4._m3.x;
        precise float _340 = TEXCOORD2.y * cb4._m3.y;
        precise float _341 = TEXCOORD2.y * cb4._m3.z;
        precise float _363 = fma(cb4._m5.x, TEXCOORD2.z, fma(cb4._m1.x, TEXCOORD2.x, _339)) + cb4._m7.x;
        precise float _364 = fma(cb4._m5.y, TEXCOORD2.z, fma(cb4._m1.y, TEXCOORD2.x, _340)) + cb4._m7.y;
        precise float _365 = fma(cb4._m5.z, TEXCOORD2.z, fma(cb4._m1.z, TEXCOORD2.x, _341)) + cb4._m7.z;
        precise float _374 = (_333 ? _363 : TEXCOORD2.x) - cb4._m11.x;
        precise float _375 = (_333 ? _364 : TEXCOORD2.y) - cb4._m11.y;
        precise float _376 = (_333 ? _365 : TEXCOORD2.z) - cb4._m11.z;
        precise float _382 = _374 * cb4._m9.x;
        precise float _383 = _375 * cb4._m9.y;
        precise float _384 = _376 * cb4._m9.z;
        vec4 _395 = texture(sampler3D(t4, s1), vec3(spvNMax(fma(_382, 0.25, 0.75), fma(cb4._m0.z, 0.5, 0.75)), _383, _384));
        _400 = _395.w;
        _401 = _395.z;
        _402 = _395.y;
        _403 = _395.x;
    }
    else
    {
        _400 = 1.0;
        _401 = 1.0;
        _402 = 1.0;
        _403 = 1.0;
    }
    precise float _410 = spvNClamp(dp4_f32(vec4(_403, _402, _401, _400), cb2._m47), 0.0, 1.0);
    precise float _413 = 1.0 - cb0._m5.x;
    precise float _414 = -_173;
    precise float _415 = -_174;
    precise float _416 = -_175;
    vec3 _424 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    float _425 = dp3_f32(vec3(_414, _415, _416), _424);
    precise float _426 = _425 + _425;
    precise float _427 = -_426;
    precise float _428 = fma(TEXCOORD1.x, _427, _414);
    precise float _429 = fma(TEXCOORD1.y, _427, _415);
    precise float _430 = fma(TEXCOORD1.z, _427, _416);
    precise float _436 = _410 * cb0._m2.x;
    precise float _437 = _410 * cb0._m2.y;
    precise float _438 = _410 * cb0._m2.z;
    vec3 _443 = vec3(_428, _429, _430);
    float _492;
    float _493;
    float _494;
    if (cb3._m5 > 0.0)
    {
        precise float _447 = inversesqrt(dp3_f32(_443, _443));
        precise float _448 = _447 * _428;
        precise float _449 = _447 * _429;
        precise float _450 = _447 * _430;
        precise float _456 = cb3._m0.x - TEXCOORD2.x;
        precise float _457 = cb3._m0.y - TEXCOORD2.y;
        precise float _458 = cb3._m0.z - TEXCOORD2.z;
        precise float _459 = _456 / _448;
        precise float _460 = _457 / _449;
        precise float _461 = _458 / _450;
        precise float _467 = cb3._m2.x - TEXCOORD2.x;
        precise float _468 = cb3._m2.y - TEXCOORD2.y;
        precise float _469 = cb3._m2.z - TEXCOORD2.z;
        precise float _470 = _467 / _448;
        precise float _471 = _468 / _449;
        precise float _472 = _469 / _450;
        precise float _480 = spvNMin((_450 > 0.0) ? _461 : _472, spvNMin((_449 > 0.0) ? _460 : _471, (_448 > 0.0) ? _459 : _470));
        precise float _486 = TEXCOORD2.x - cb3._m4.x;
        precise float _487 = TEXCOORD2.y - cb3._m4.y;
        precise float _488 = TEXCOORD2.z - cb3._m4.z;
        _492 = fma(_450, _480, _488);
        _493 = fma(_449, _480, _487);
        _494 = fma(_448, _480, _486);
    }
    else
    {
        _492 = _430;
        _493 = _429;
        _494 = _428;
    }
    precise float _497 = fma(-_413, 0.699999988079071044921875, 1.7000000476837158203125) * _413;
    precise float _498 = _497 * 6.0;
    vec4 _504 = textureLod(samplerCube(t2, s0), vec3(_494, _493, _492), _498);
    float _505 = _504.x;
    float _506 = _504.y;
    float _507 = _504.z;
    precise float _509 = _504.w - 1.0;
    precise float _516 = log2(fma(cb3._m6.w, _509, 1.0)) * cb3._m6.y;
    precise float _520 = exp2(_516) * cb3._m6.x;
    precise float _521 = _505 * _520;
    precise float _522 = _506 * _520;
    precise float _523 = _507 * _520;
    float _615;
    float _616;
    float _617;
    if (cb3._m3 < 0.999989986419677734375)
    {
        float _580;
        float _581;
        float _582;
        if (cb3._m12 > 0.0)
        {
            precise float _535 = inversesqrt(dp3_f32(_443, _443));
            precise float _536 = _428 * _535;
            precise float _537 = _429 * _535;
            precise float _538 = _430 * _535;
            precise float _544 = cb3._m7.x - TEXCOORD2.x;
            precise float _545 = cb3._m7.y - TEXCOORD2.y;
            precise float _546 = cb3._m7.z - TEXCOORD2.z;
            precise float _547 = _544 / _536;
            precise float _548 = _545 / _537;
            precise float _549 = _546 / _538;
            precise float _555 = cb3._m9.x - TEXCOORD2.x;
            precise float _556 = cb3._m9.y - TEXCOORD2.y;
            precise float _557 = cb3._m9.z - TEXCOORD2.z;
            precise float _558 = _555 / _536;
            precise float _559 = _556 / _537;
            precise float _560 = _557 / _538;
            precise float _568 = spvNMin((_538 > 0.0) ? _549 : _560, spvNMin((_537 > 0.0) ? _548 : _559, (_536 > 0.0) ? _547 : _558));
            precise float _574 = TEXCOORD2.x - cb3._m11.x;
            precise float _575 = TEXCOORD2.y - cb3._m11.y;
            precise float _576 = TEXCOORD2.z - cb3._m11.z;
            _580 = fma(_538, _568, _576);
            _581 = fma(_537, _568, _575);
            _582 = fma(_536, _568, _574);
        }
        else
        {
            _580 = _430;
            _581 = _429;
            _582 = _428;
        }
        vec4 _586 = textureLod(samplerCube(t3, s0), vec3(_582, _581, _580), _498);
        precise float _591 = _586.w - 1.0;
        precise float _598 = log2(fma(cb3._m13.w, _591, 1.0)) * cb3._m13.y;
        precise float _602 = exp2(_598) * cb3._m13.x;
        precise float _603 = _586.x * _602;
        precise float _604 = _586.y * _602;
        precise float _605 = _586.z * _602;
        _615 = fma(cb3._m3, fma(_520, _507, -_605), _605);
        _616 = fma(cb3._m3, fma(_520, _506, -_604), _604);
        _617 = fma(cb3._m3, fma(_520, _505, -_603), _603);
    }
    else
    {
        _615 = _523;
        _616 = _522;
        _617 = _521;
    }
    precise float _619 = inversesqrt(dp3_f32(_424, _424));
    precise float _620 = _619 * TEXCOORD1.x;
    precise float _621 = _619 * TEXCOORD1.y;
    precise float _622 = _619 * TEXCOORD1.z;
    precise float _628 = fma(cb0._m5.y, fma(_317, _318, -0.039999999105930328369140625), 0.039999999105930328369140625);
    precise float _629 = fma(cb0._m5.y, fma(_317, _319, -0.039999999105930328369140625), 0.039999999105930328369140625);
    precise float _630 = fma(cb0._m5.y, fma(_317, _320, -0.039999999105930328369140625), 0.039999999105930328369140625);
    precise float _632 = fma(-cb0._m5.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _633 = _632 * _321;
    precise float _634 = _632 * _322;
    precise float _635 = _632 * _323;
    precise float _641 = fma(_167, _172, cb2._m0.x);
    precise float _642 = fma(_168, _172, cb2._m0.y);
    precise float _643 = fma(_169, _172, cb2._m0.z);
    vec3 _644 = vec3(_641, _642, _643);
    precise float _647 = inversesqrt(spvNMax(dp3_f32(_644, _644), 0.001000000047497451305389404296875));
    precise float _648 = _647 * _641;
    precise float _649 = _647 * _642;
    precise float _650 = _647 * _643;
    vec3 _651 = vec3(_620, _621, _622);
    precise float _655 = spvNClamp(dp3_f32(_651, cb2._m0), 0.0, 1.0);
    vec3 _656 = vec3(_648, _649, _650);
    precise float _658 = spvNClamp(dp3_f32(_651, _656), 0.0, 1.0);
    precise float _660 = spvNClamp(dp3_f32(cb2._m0, _656), 0.0, 1.0);
    precise float _661 = _660 * _660;
    precise float _665 = dp2_f32(vec2(_661), vec2(_413)) - 0.5;
    precise float _666 = 1.0 - _655;
    precise float _667 = _666 * _666;
    precise float _668 = _667 * _667;
    precise float _669 = _666 * _668;
    precise float _671 = abs(dp3_f32(_651, vec3(_173, _174, _175)));
    precise float _672 = 1.0 - _671;
    precise float _673 = _672 * _672;
    precise float _674 = _673 * _673;
    precise float _675 = _672 * _674;
    precise float _677 = fma(_665, _675, 1.0) * fma(_665, _669, 1.0);
    precise float _678 = _413 * _413;
    precise float _679 = spvNMax(_678, 0.00200000009499490261077880859375);
    precise float _680 = 1.0 - _679;
    precise float _683 = _671 * fma(_655, _680, _679);
    precise float _685 = fma(_655, fma(_671, _680, _679), _683) + 9.9999997473787516355514526367188e-06;
    precise float _686 = 0.5 / _685;
    precise float _687 = _679 * _679;
    precise float _690 = fma(fma(_658, _687, -_658), _658, 1.0);
    precise float _691 = _687 * 0.3183098733425140380859375;
    precise float _693 = _691 / fma(_690, _690, 1.0000000116860974230803549289703e-07);
    precise float _694 = _686 * _693;
    precise float _695 = _694 * 3.1415927410125732421875;
    precise float _696 = _655 * _677;
    precise float _697 = _655 * _695;
    precise float _700 = 1.0 / fma(_679, _679, 1.0);
    vec3 _701 = vec3(_628, _629, _630);
    precise float _705 = spvNMax(_697, 0.0) * ((dp3_f32(_701, _701) == 0.0) ? 0.0 : 1.0);
    precise float _706 = cb0._m5.x - _632;
    precise float _707 = _706 + 1.0;
    precise float _708 = spvNClamp(_707, 0.0, 1.0);
    precise float _709 = _696 * _436;
    precise float _710 = _696 * _437;
    precise float _711 = _696 * _438;
    precise float _712 = _436 * _705;
    precise float _713 = _437 * _705;
    precise float _714 = _438 * _705;
    precise float _715 = 1.0 - _660;
    precise float _716 = _715 * _715;
    precise float _717 = _716 * _716;
    precise float _718 = _715 * _717;
    precise float _719 = 1.0 - _628;
    precise float _720 = 1.0 - _629;
    precise float _721 = 1.0 - _630;
    precise float _725 = fma(_719, _718, _628) * _712;
    precise float _726 = fma(_720, _718, _629) * _713;
    precise float _727 = fma(_721, _718, _630) * _714;
    precise float _731 = _617 * _700;
    precise float _732 = _616 * _700;
    precise float _733 = _615 * _700;
    precise float _734 = _708 - _628;
    precise float _735 = _708 - _629;
    precise float _736 = _708 - _630;
    SV_Target.x = fma(_731, fma(_675, _734, _628), fma(_633, _709, _725));
    SV_Target.y = fma(_732, fma(_675, _735, _629), fma(_634, _710, _726));
    SV_Target.z = fma(_733, fma(_675, _736, _630), fma(_635, _711, _727));
    SV_Target.w = 1.0;
}

