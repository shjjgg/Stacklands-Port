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
    uvec4 _m5;
    uvec4 _m6;
    uvec4 _m7;
    uvec4 _m8;
    vec2 _m9;
    vec2 _m10;
    vec4 _m11;
    vec4 _m12;
    vec4 _m13;
    vec4 _m14;
    vec4 _m15;
    vec3 _m16;
    uint _m17;
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
    vec4 _m8;
    vec4 _m9;
    vec4 _m10;
    vec4 _m11;
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
} cb5;

layout(set = 0, binding = 6) uniform sampler s0;
layout(set = 0, binding = 7) uniform samplerShadow s1;
layout(set = 0, binding = 8) uniform sampler s2;
layout(set = 0, binding = 9) uniform sampler s3;
layout(set = 0, binding = 10) uniform sampler s4;
layout(set = 0, binding = 11) uniform texture2D t0;
layout(set = 0, binding = 12) uniform texture2D t1;
layout(set = 0, binding = 13) uniform texture2D t2;
layout(set = 0, binding = 14) uniform texture3D t3;
layout(set = 0, binding = 15) uniform texture2D t4;

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

float dp4_f32(vec4 a, vec4 b)
{
    precise float _126 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _126)));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _114 = a.x * b.x;
    return fma(a.y, b.y, _114);
}

void main()
{
    precise float _167 = cb2._m0.x - TEXCOORD2.x;
    precise float _168 = cb2._m0.y - TEXCOORD2.y;
    precise float _169 = cb2._m0.z - TEXCOORD2.z;
    vec3 _170 = vec3(_167, _168, _169);
    precise float _172 = inversesqrt(dp3_f32(_170, _170));
    precise float _173 = _172 * _167;
    precise float _174 = _172 * _168;
    precise float _175 = _172 * _169;
    precise float _182 = cb1._m4.x - TEXCOORD2.x;
    precise float _183 = cb1._m4.y - TEXCOORD2.y;
    precise float _184 = cb1._m4.z - TEXCOORD2.z;
    vec3 _185 = vec3(_182, _183, _184);
    precise float _187 = inversesqrt(dp3_f32(_185, _185));
    precise float _188 = _187 * _182;
    precise float _189 = _187 * _183;
    precise float _190 = _187 * _184;
    vec4 _200 = texture(sampler2D(t0, s4), vec2(TEXCOORD.x, TEXCOORD.y));
    precise float _210 = _200.x * cb0._m16.x;
    precise float _211 = _200.y * cb0._m16.y;
    precise float _212 = _200.z * cb0._m16.z;
    precise float _213 = TEXCOORD.y + TEXCOORD.x;
    precise float _214 = _213 * 10.0;
    precise float _217 = roundEven(fract(_214)) + 0.800000011920928955078125;
    precise float _218 = spvNMin(_217, 1.0);
    precise float _219 = _218 * _210;
    precise float _220 = _218 * _211;
    precise float _221 = _218 * _212;
    bool _229 = (((TEXCOORD.x > 0.863223135471343994140625) || (TEXCOORD.x < 0.13677684962749481201171875)) || (TEXCOORD.y < 0.0500000007450580596923828125)) || (TEXCOORD.y > 0.949999988079071044921875);
    float _230 = _229 ? 0.0 : _219;
    float _231 = _229 ? 0.0 : _220;
    float _232 = _229 ? 0.0 : _221;
    precise float _240 = TEXCOORD2.y * cb0._m12.x;
    precise float _241 = TEXCOORD2.y * cb0._m12.y;
    precise float _242 = TEXCOORD2.y * cb0._m12.z;
    precise float _243 = TEXCOORD2.y * cb0._m12.w;
    precise float _270 = fma(cb0._m13.x, TEXCOORD2.z, fma(cb0._m11.x, TEXCOORD2.x, _240)) + cb0._m14.x;
    precise float _271 = fma(cb0._m13.y, TEXCOORD2.z, fma(cb0._m11.y, TEXCOORD2.x, _241)) + cb0._m14.y;
    precise float _272 = fma(cb0._m13.z, TEXCOORD2.z, fma(cb0._m11.z, TEXCOORD2.x, _242)) + cb0._m14.z;
    precise float _273 = fma(cb0._m13.w, TEXCOORD2.z, fma(cb0._m11.w, TEXCOORD2.x, _243)) + cb0._m14.w;
    float _283 = dp3_f32(_185, vec3(cb4._m9.z, cb4._m10.z, cb4._m11.z));
    precise float _290 = TEXCOORD2.x - cb3._m25.x;
    precise float _291 = TEXCOORD2.y - cb3._m25.y;
    precise float _292 = TEXCOORD2.z - cb3._m25.z;
    vec3 _293 = vec3(_290, _291, _292);
    precise float _296 = sqrt(dp3_f32(_293, _293)) - _283;
    precise float _305 = spvNClamp(fma(fma(cb3._m26, _296, _283), cb3._m24.z, cb3._m24.w), 0.0, 1.0);
    float _381;
    float _382;
    float _383;
    float _384;
    if (cb5._m0.x == 1.0)
    {
        bool _314 = cb5._m0.y == 1.0;
        precise float _320 = TEXCOORD2.y * cb5._m3.x;
        precise float _321 = TEXCOORD2.y * cb5._m3.y;
        precise float _322 = TEXCOORD2.y * cb5._m3.z;
        precise float _344 = fma(cb5._m5.x, TEXCOORD2.z, fma(cb5._m1.x, TEXCOORD2.x, _320)) + cb5._m7.x;
        precise float _345 = fma(cb5._m5.y, TEXCOORD2.z, fma(cb5._m1.y, TEXCOORD2.x, _321)) + cb5._m7.y;
        precise float _346 = fma(cb5._m5.z, TEXCOORD2.z, fma(cb5._m1.z, TEXCOORD2.x, _322)) + cb5._m7.z;
        precise float _355 = (_314 ? _344 : TEXCOORD2.x) - cb5._m11.x;
        precise float _356 = (_314 ? _345 : TEXCOORD2.y) - cb5._m11.y;
        precise float _357 = (_314 ? _346 : TEXCOORD2.z) - cb5._m11.z;
        precise float _363 = _355 * cb5._m9.x;
        precise float _364 = _356 * cb5._m9.y;
        precise float _365 = _357 * cb5._m9.z;
        vec4 _376 = texture(sampler3D(t3, s0), vec3(spvNMax(fma(_363, 0.25, 0.75), fma(cb5._m0.z, 0.5, 0.75)), _364, _365));
        _381 = _376.w;
        _382 = _376.z;
        _383 = _376.y;
        _384 = _376.x;
    }
    else
    {
        _381 = 1.0;
        _382 = 1.0;
        _383 = 1.0;
        _384 = 1.0;
    }
    float _535;
    if (_305 < 0.9900000095367431640625)
    {
        precise float _399 = TEXCOORD2.y * cb3._m9.x;
        precise float _400 = TEXCOORD2.y * cb3._m9.y;
        precise float _401 = TEXCOORD2.y * cb3._m9.z;
        precise float _402 = TEXCOORD2.y * cb3._m9.w;
        precise float _429 = fma(cb3._m10.x, TEXCOORD2.z, fma(cb3._m8.x, TEXCOORD2.x, _399)) + cb3._m11.x;
        precise float _430 = fma(cb3._m10.y, TEXCOORD2.z, fma(cb3._m8.y, TEXCOORD2.x, _400)) + cb3._m11.y;
        precise float _431 = fma(cb3._m10.z, TEXCOORD2.z, fma(cb3._m8.z, TEXCOORD2.x, _401)) + cb3._m11.z;
        precise float _432 = fma(cb3._m10.w, TEXCOORD2.z, fma(cb3._m8.w, TEXCOORD2.x, _402)) + cb3._m11.w;
        precise float _433 = _429 / _432;
        precise float _434 = _430 / _432;
        precise float _435 = _431 / _432;
        precise float _443 = floor(fma(_433, cb0._m10.x, 0.5));
        precise float _444 = floor(fma(_434, cb0._m10.y, 0.5));
        precise float _447 = fma(_433, cb0._m10.x, -_443);
        precise float _448 = fma(_434, cb0._m10.y, -_444);
        precise float _449 = _447 + 0.5;
        precise float _450 = _447 + 1.0;
        precise float _451 = _448 + 0.5;
        precise float _452 = _448 + 1.0;
        precise float _453 = _449 * _449;
        precise float _454 = _451 * _451;
        precise float _459 = 1.0 - _447;
        precise float _460 = 1.0 - _448;
        precise float _461 = spvNMin(_447, 0.0);
        precise float _462 = spvNMin(_448, 0.0);
        precise float _467 = spvNMax(_447, 0.0);
        precise float _468 = spvNMax(_448, 0.0);
        precise float _473 = fma(_453, 0.5, -_447) * 0.44444000720977783203125;
        precise float _474 = fma(-_461, _461, _459) * 0.44444000720977783203125;
        precise float _475 = fma(-_467, _467, _450) * 0.44444000720977783203125;
        precise float _476 = _453 * 0.222220003604888916015625;
        precise float _477 = fma(_454, 0.5, -_448) * 0.44444000720977783203125;
        precise float _478 = fma(-_462, _462, _460) * 0.44444000720977783203125;
        precise float _479 = fma(-_468, _468, _452) * 0.44444000720977783203125;
        precise float _480 = _454 * 0.222220003604888916015625;
        precise float _481 = _474 + _473;
        precise float _482 = _476 + _475;
        precise float _483 = _478 + _477;
        precise float _484 = _480 + _479;
        precise float _485 = _474 / _481;
        precise float _486 = _476 / _482;
        precise float _487 = _485 - 1.5;
        precise float _488 = _486 + 0.5;
        precise float _489 = _478 / _483;
        precise float _490 = _480 / _484;
        precise float _491 = _489 - 1.5;
        precise float _492 = _490 + 0.5;
        precise float _495 = _487 * cb0._m9.x;
        precise float _496 = _488 * cb0._m9.x;
        precise float _499 = _491 * cb0._m9.y;
        precise float _500 = _492 * cb0._m9.y;
        precise float _501 = _481 * _483;
        precise float _502 = _482 * _483;
        precise float _503 = _481 * _484;
        precise float _504 = _482 * _484;
        precise float _509 = fma(_443, cb0._m9.x, _495);
        precise float _510 = fma(_444, cb0._m9.y, _499);
        precise float _511 = fma(_443, cb0._m9.x, _496);
        precise float _520 = textureLod(sampler2DShadow(t4, s1), vec3(vec2(_511, _510), _435), 0.0) * _502;
        precise float _522 = fma(_444, cb0._m9.y, _500);
        precise float _533 = 1.0 - cb3._m24.x;
        _535 = fma(fma(_504, textureLod(sampler2DShadow(t4, s1), vec3(vec2(_511, _522), _435), 0.0), fma(_503, textureLod(sampler2DShadow(t4, s1), vec3(vec2(_509, _522), _435), 0.0), fma(_501, textureLod(sampler2DShadow(t4, s1), vec3(vec2(_509, _510), _435), 0.0), _520))), _533, cb3._m24.x);
    }
    else
    {
        _535 = 1.0;
    }
    precise float _536 = spvNClamp(dp4_f32(vec4(_384, _383, _382, _381), cb2._m47), 0.0, 1.0) - _535;
    precise float _540 = _270 / _273;
    precise float _541 = _271 / _273;
    precise float _542 = _540 + 0.5;
    precise float _543 = _541 + 0.5;
    precise float _550 = float(_272 > 0.0) * texture(sampler2D(t1, s2), vec2(_542, _543)).w;
    vec3 _551 = vec3(_270, _271, _272);
    precise float _559 = _550 * texture(sampler2D(t2, s3), vec2(dp3_f32(_551, _551))).x;
    precise float _560 = fma(_305, _536, _535) * _559;
    precise float _566 = _560 * cb0._m2.x;
    precise float _567 = _560 * cb0._m2.y;
    precise float _568 = _560 * cb0._m2.z;
    vec3 _575 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    precise float _577 = inversesqrt(dp3_f32(_575, _575));
    precise float _578 = _577 * TEXCOORD1.x;
    precise float _579 = _577 * TEXCOORD1.y;
    precise float _580 = _577 * TEXCOORD1.z;
    precise float _581 = _230 - 0.039999999105930328369140625;
    precise float _582 = _231 - 0.039999999105930328369140625;
    precise float _583 = _232 - 0.039999999105930328369140625;
    precise float _586 = fma(cb0._m15.y, _581, 0.039999999105930328369140625);
    precise float _587 = fma(cb0._m15.y, _582, 0.039999999105930328369140625);
    precise float _588 = fma(cb0._m15.y, _583, 0.039999999105930328369140625);
    precise float _590 = fma(-cb0._m15.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _591 = _590 * _230;
    precise float _592 = _590 * _231;
    precise float _593 = _590 * _232;
    precise float _596 = 1.0 - cb0._m15.x;
    precise float _597 = fma(_167, _172, _188);
    precise float _598 = fma(_168, _172, _189);
    precise float _599 = fma(_169, _172, _190);
    vec3 _600 = vec3(_597, _598, _599);
    precise float _603 = inversesqrt(spvNMax(dp3_f32(_600, _600), 0.001000000047497451305389404296875));
    precise float _604 = _603 * _597;
    precise float _605 = _603 * _598;
    precise float _606 = _603 * _599;
    vec3 _607 = vec3(_578, _579, _580);
    vec3 _610 = vec3(_173, _174, _175);
    precise float _612 = spvNClamp(dp3_f32(_607, _610), 0.0, 1.0);
    vec3 _613 = vec3(_604, _605, _606);
    precise float _615 = spvNClamp(dp3_f32(_607, _613), 0.0, 1.0);
    precise float _617 = spvNClamp(dp3_f32(_610, _613), 0.0, 1.0);
    precise float _618 = _617 * _617;
    precise float _622 = dp2_f32(vec2(_618), vec2(_596)) - 0.5;
    precise float _623 = 1.0 - _612;
    precise float _624 = _623 * _623;
    precise float _625 = _624 * _624;
    precise float _626 = _623 * _625;
    precise float _628 = abs(dp3_f32(_607, vec3(_188, _189, _190)));
    precise float _629 = 1.0 - _628;
    precise float _630 = _629 * _629;
    precise float _631 = _630 * _630;
    precise float _632 = _629 * _631;
    precise float _634 = fma(_622, _632, 1.0) * fma(_622, _626, 1.0);
    precise float _635 = _596 * _596;
    precise float _636 = spvNMax(_635, 0.00200000009499490261077880859375);
    precise float _637 = 1.0 - _636;
    precise float _640 = _628 * fma(_612, _637, _636);
    precise float _642 = fma(_612, fma(_628, _637, _636), _640) + 9.9999997473787516355514526367188e-06;
    precise float _643 = 0.5 / _642;
    precise float _644 = _636 * _636;
    precise float _647 = fma(fma(_615, _644, -_615), _615, 1.0);
    precise float _648 = _644 * 0.3183098733425140380859375;
    precise float _650 = _648 / fma(_647, _647, 1.0000000116860974230803549289703e-07);
    precise float _651 = _650 * _643;
    precise float _652 = _651 * 3.1415927410125732421875;
    precise float _653 = _612 * _634;
    precise float _654 = _612 * _652;
    vec3 _656 = vec3(_586, _587, _588);
    precise float _660 = ((dp3_f32(_656, _656) == 0.0) ? 0.0 : 1.0) * spvNMax(_654, 0.0);
    precise float _661 = _653 * _566;
    precise float _662 = _653 * _567;
    precise float _663 = _653 * _568;
    precise float _664 = _566 * _660;
    precise float _665 = _567 * _660;
    precise float _666 = _568 * _660;
    precise float _667 = 1.0 - _617;
    precise float _668 = _667 * _667;
    precise float _669 = _668 * _668;
    precise float _670 = _667 * _669;
    precise float _671 = 1.0 - _586;
    precise float _672 = 1.0 - _587;
    precise float _673 = 1.0 - _588;
    precise float _677 = _664 * fma(_671, _670, _586);
    precise float _678 = _665 * fma(_672, _670, _587);
    precise float _679 = _666 * fma(_673, _670, _588);
    SV_Target.x = fma(_591, _661, _677);
    SV_Target.y = fma(_592, _662, _678);
    SV_Target.z = fma(_593, _663, _679);
    SV_Target.w = 1.0;
}

