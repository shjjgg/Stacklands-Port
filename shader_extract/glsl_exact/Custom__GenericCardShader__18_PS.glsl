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
layout(set = 0, binding = 10) uniform texture2D t0;
layout(set = 0, binding = 11) uniform textureCube t1;
layout(set = 0, binding = 12) uniform textureCube t2;
layout(set = 0, binding = 13) uniform texture3D t3;

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
    precise float _148 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _148));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _137 = a.x * b.x;
    return fma(a.y, b.y, _137);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _119 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _119)));
}

void main()
{
    precise float _172 = cb1._m4.x - TEXCOORD2.x;
    precise float _173 = cb1._m4.y - TEXCOORD2.y;
    precise float _174 = cb1._m4.z - TEXCOORD2.z;
    vec3 _175 = vec3(_172, _173, _174);
    precise float _177 = inversesqrt(dp3_f32(_175, _175));
    precise float _178 = _177 * _172;
    precise float _179 = _177 * _173;
    precise float _180 = _177 * _174;
    precise float _183 = TEXCOORD.y - 0.5;
    precise float _184 = _183 * 0.3333333432674407958984375;
    precise float _185 = _183 * 150.0;
    precise float _190 = abs(dFdx(_184)) + abs(dFdy(_184));
    precise float _193 = sin(roundEven(_185)) * 43758.546875;
    precise float _195 = fract(_193) - 0.5;
    precise float _198 = fma(_195, 0.004999999888241291046142578125, TEXCOORD.x);
    precise float _199 = _198 * 150.0;
    precise float _202 = sin(roundEven(_199)) * 43758.546875;
    precise float _204 = fract(_202) - 0.5;
    precise float _215 = cb0._m8.x - cb0._m10.x;
    precise float _216 = cb0._m8.y - cb0._m10.x;
    precise float _219 = abs(_198) - _215;
    precise float _220 = abs(fma(_204, 0.00166666670702397823333740234375, _184)) - _216;
    vec2 _223 = vec2(spvNMax(_219, 0.0), spvNMax(_220, 0.0));
    precise float _226 = sqrt(dp2_f32(_223, _223)) / _190;
    precise float _227 = spvNMin(_226, 1.0);
    precise float _236 = fma(_227, -cb0._m6.x, cb0._m6.x);
    precise float _237 = fma(_227, -cb0._m6.y, cb0._m6.y);
    precise float _238 = fma(_227, -cb0._m6.z, cb0._m6.z);
    float _247 = dp3_f32(_175, vec3(cb4._m9.z, cb4._m10.z, cb4._m11.z));
    precise float _254 = TEXCOORD2.x - cb3._m25.x;
    precise float _255 = TEXCOORD2.y - cb3._m25.y;
    precise float _256 = TEXCOORD2.z - cb3._m25.z;
    vec3 _257 = vec3(_254, _255, _256);
    precise float _260 = sqrt(dp3_f32(_257, _257)) - _247;
    float _346;
    float _347;
    float _348;
    float _349;
    if (cb6._m0.x == 1.0)
    {
        bool _279 = cb6._m0.y == 1.0;
        precise float _285 = TEXCOORD2.y * cb6._m3.x;
        precise float _286 = TEXCOORD2.y * cb6._m3.y;
        precise float _287 = TEXCOORD2.y * cb6._m3.z;
        precise float _309 = fma(cb6._m5.x, TEXCOORD2.z, fma(cb6._m1.x, TEXCOORD2.x, _285)) + cb6._m7.x;
        precise float _310 = fma(cb6._m5.y, TEXCOORD2.z, fma(cb6._m1.y, TEXCOORD2.x, _286)) + cb6._m7.y;
        precise float _311 = fma(cb6._m5.z, TEXCOORD2.z, fma(cb6._m1.z, TEXCOORD2.x, _287)) + cb6._m7.z;
        precise float _320 = (_279 ? _309 : TEXCOORD2.x) - cb6._m11.x;
        precise float _321 = (_279 ? _310 : TEXCOORD2.y) - cb6._m11.y;
        precise float _322 = (_279 ? _311 : TEXCOORD2.z) - cb6._m11.z;
        precise float _328 = _320 * cb6._m9.x;
        precise float _329 = _321 * cb6._m9.y;
        precise float _330 = _322 * cb6._m9.z;
        vec4 _341 = texture(sampler3D(t3, s1), vec3(spvNMax(fma(_328, 0.25, 0.75), fma(cb6._m0.z, 0.5, 0.75)), _329, _330));
        _346 = _341.w;
        _347 = _341.z;
        _348 = _341.y;
        _349 = _341.x;
    }
    else
    {
        _346 = 1.0;
        _347 = 1.0;
        _348 = 1.0;
        _349 = 1.0;
    }
    precise float _363 = TEXCOORD5.x / TEXCOORD5.w;
    precise float _364 = TEXCOORD5.y / TEXCOORD5.w;
    vec4 _370 = texture(sampler2D(t0, s2), vec2(_363, _364));
    float _371 = _370.x;
    precise float _372 = spvNClamp(dp4_f32(vec4(_349, _348, _347, _346), cb2._m47), 0.0, 1.0) - _371;
    precise float _373 = fma(spvNClamp(fma(fma(cb3._m26, _260, _247), cb3._m24.z, cb3._m24.w), 0.0, 1.0), _372, _371);
    precise float _376 = 1.0 - cb0._m5.x;
    precise float _377 = -_178;
    precise float _378 = -_179;
    precise float _379 = -_180;
    vec3 _387 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    float _388 = dp3_f32(vec3(_377, _378, _379), _387);
    precise float _389 = _388 + _388;
    precise float _390 = -_389;
    precise float _391 = fma(TEXCOORD1.x, _390, _377);
    precise float _392 = fma(TEXCOORD1.y, _390, _378);
    precise float _393 = fma(TEXCOORD1.z, _390, _379);
    precise float _399 = _373 * cb0._m2.x;
    precise float _400 = _373 * cb0._m2.y;
    precise float _401 = _373 * cb0._m2.z;
    vec3 _406 = vec3(_391, _392, _393);
    float _455;
    float _456;
    float _457;
    if (cb5._m5 > 0.0)
    {
        precise float _410 = inversesqrt(dp3_f32(_406, _406));
        precise float _411 = _410 * _391;
        precise float _412 = _410 * _392;
        precise float _413 = _410 * _393;
        precise float _419 = cb5._m0.x - TEXCOORD2.x;
        precise float _420 = cb5._m0.y - TEXCOORD2.y;
        precise float _421 = cb5._m0.z - TEXCOORD2.z;
        precise float _422 = _419 / _411;
        precise float _423 = _420 / _412;
        precise float _424 = _421 / _413;
        precise float _430 = cb5._m2.x - TEXCOORD2.x;
        precise float _431 = cb5._m2.y - TEXCOORD2.y;
        precise float _432 = cb5._m2.z - TEXCOORD2.z;
        precise float _433 = _430 / _411;
        precise float _434 = _431 / _412;
        precise float _435 = _432 / _413;
        precise float _443 = spvNMin((_413 > 0.0) ? _424 : _435, spvNMin((_412 > 0.0) ? _423 : _434, (_411 > 0.0) ? _422 : _433));
        precise float _449 = TEXCOORD2.x - cb5._m4.x;
        precise float _450 = TEXCOORD2.y - cb5._m4.y;
        precise float _451 = TEXCOORD2.z - cb5._m4.z;
        _455 = fma(_413, _443, _451);
        _456 = fma(_412, _443, _450);
        _457 = fma(_411, _443, _449);
    }
    else
    {
        _455 = _393;
        _456 = _392;
        _457 = _391;
    }
    precise float _460 = fma(-_376, 0.699999988079071044921875, 1.7000000476837158203125) * _376;
    precise float _461 = _460 * 6.0;
    vec4 _467 = textureLod(samplerCube(t1, s0), vec3(_457, _456, _455), _461);
    float _468 = _467.x;
    float _469 = _467.y;
    float _470 = _467.z;
    precise float _472 = _467.w - 1.0;
    precise float _479 = log2(fma(cb5._m6.w, _472, 1.0)) * cb5._m6.y;
    precise float _483 = exp2(_479) * cb5._m6.x;
    precise float _484 = _468 * _483;
    precise float _485 = _469 * _483;
    precise float _486 = _470 * _483;
    float _578;
    float _579;
    float _580;
    if (cb5._m3 < 0.999989986419677734375)
    {
        float _543;
        float _544;
        float _545;
        if (cb5._m12 > 0.0)
        {
            precise float _498 = inversesqrt(dp3_f32(_406, _406));
            precise float _499 = _391 * _498;
            precise float _500 = _392 * _498;
            precise float _501 = _393 * _498;
            precise float _507 = cb5._m7.x - TEXCOORD2.x;
            precise float _508 = cb5._m7.y - TEXCOORD2.y;
            precise float _509 = cb5._m7.z - TEXCOORD2.z;
            precise float _510 = _507 / _499;
            precise float _511 = _508 / _500;
            precise float _512 = _509 / _501;
            precise float _518 = cb5._m9.x - TEXCOORD2.x;
            precise float _519 = cb5._m9.y - TEXCOORD2.y;
            precise float _520 = cb5._m9.z - TEXCOORD2.z;
            precise float _521 = _518 / _499;
            precise float _522 = _519 / _500;
            precise float _523 = _520 / _501;
            precise float _531 = spvNMin((_501 > 0.0) ? _512 : _523, spvNMin((_500 > 0.0) ? _511 : _522, (_499 > 0.0) ? _510 : _521));
            precise float _537 = TEXCOORD2.x - cb5._m11.x;
            precise float _538 = TEXCOORD2.y - cb5._m11.y;
            precise float _539 = TEXCOORD2.z - cb5._m11.z;
            _543 = fma(_501, _531, _539);
            _544 = fma(_500, _531, _538);
            _545 = fma(_499, _531, _537);
        }
        else
        {
            _543 = _393;
            _544 = _392;
            _545 = _391;
        }
        vec4 _549 = textureLod(samplerCube(t2, s0), vec3(_545, _544, _543), _461);
        precise float _554 = _549.w - 1.0;
        precise float _561 = log2(fma(cb5._m13.w, _554, 1.0)) * cb5._m13.y;
        precise float _565 = exp2(_561) * cb5._m13.x;
        precise float _566 = _549.x * _565;
        precise float _567 = _549.y * _565;
        precise float _568 = _549.z * _565;
        _578 = fma(cb5._m3, fma(_483, _470, -_568), _568);
        _579 = fma(cb5._m3, fma(_483, _469, -_567), _567);
        _580 = fma(cb5._m3, fma(_483, _468, -_566), _566);
    }
    else
    {
        _578 = _486;
        _579 = _485;
        _580 = _484;
    }
    precise float _582 = inversesqrt(dp3_f32(_387, _387));
    precise float _583 = _582 * TEXCOORD1.x;
    precise float _584 = _582 * TEXCOORD1.y;
    precise float _585 = _582 * TEXCOORD1.z;
    precise float _586 = _236 - 0.039999999105930328369140625;
    precise float _587 = _237 - 0.039999999105930328369140625;
    precise float _588 = _238 - 0.039999999105930328369140625;
    precise float _591 = fma(cb0._m5.y, _586, 0.039999999105930328369140625);
    precise float _592 = fma(cb0._m5.y, _587, 0.039999999105930328369140625);
    precise float _593 = fma(cb0._m5.y, _588, 0.039999999105930328369140625);
    precise float _595 = fma(-cb0._m5.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _596 = _595 * _236;
    precise float _597 = _595 * _237;
    precise float _598 = _595 * _238;
    precise float _604 = fma(_172, _177, cb2._m0.x);
    precise float _605 = fma(_173, _177, cb2._m0.y);
    precise float _606 = fma(_174, _177, cb2._m0.z);
    vec3 _607 = vec3(_604, _605, _606);
    precise float _610 = inversesqrt(spvNMax(dp3_f32(_607, _607), 0.001000000047497451305389404296875));
    precise float _611 = _610 * _604;
    precise float _612 = _610 * _605;
    precise float _613 = _610 * _606;
    vec3 _614 = vec3(_583, _584, _585);
    precise float _618 = spvNClamp(dp3_f32(_614, cb2._m0), 0.0, 1.0);
    vec3 _619 = vec3(_611, _612, _613);
    precise float _621 = spvNClamp(dp3_f32(_614, _619), 0.0, 1.0);
    precise float _623 = spvNClamp(dp3_f32(cb2._m0, _619), 0.0, 1.0);
    precise float _624 = _623 * _623;
    precise float _628 = dp2_f32(vec2(_624), vec2(_376)) - 0.5;
    precise float _629 = 1.0 - _618;
    precise float _630 = _629 * _629;
    precise float _631 = _630 * _630;
    precise float _632 = _629 * _631;
    precise float _634 = abs(dp3_f32(_614, vec3(_178, _179, _180)));
    precise float _635 = 1.0 - _634;
    precise float _636 = _635 * _635;
    precise float _637 = _636 * _636;
    precise float _638 = _635 * _637;
    precise float _640 = fma(_628, _638, 1.0) * fma(_628, _632, 1.0);
    precise float _641 = _376 * _376;
    precise float _642 = spvNMax(_641, 0.00200000009499490261077880859375);
    precise float _643 = 1.0 - _642;
    precise float _646 = _634 * fma(_618, _643, _642);
    precise float _648 = fma(_618, fma(_634, _643, _642), _646) + 9.9999997473787516355514526367188e-06;
    precise float _649 = 0.5 / _648;
    precise float _650 = _642 * _642;
    precise float _653 = fma(fma(_621, _650, -_621), _621, 1.0);
    precise float _654 = _650 * 0.3183098733425140380859375;
    precise float _656 = _654 / fma(_653, _653, 1.0000000116860974230803549289703e-07);
    precise float _657 = _649 * _656;
    precise float _658 = _657 * 3.1415927410125732421875;
    precise float _659 = _618 * _640;
    precise float _660 = _618 * _658;
    precise float _663 = 1.0 / fma(_642, _642, 1.0);
    vec3 _664 = vec3(_591, _592, _593);
    precise float _668 = spvNMax(_660, 0.0) * ((dp3_f32(_664, _664) == 0.0) ? 0.0 : 1.0);
    precise float _669 = cb0._m5.x - _595;
    precise float _670 = _669 + 1.0;
    precise float _671 = spvNClamp(_670, 0.0, 1.0);
    precise float _672 = _659 * _399;
    precise float _673 = _659 * _400;
    precise float _674 = _659 * _401;
    precise float _675 = _399 * _668;
    precise float _676 = _400 * _668;
    precise float _677 = _401 * _668;
    precise float _678 = 1.0 - _623;
    precise float _679 = _678 * _678;
    precise float _680 = _679 * _679;
    precise float _681 = _678 * _680;
    precise float _682 = 1.0 - _591;
    precise float _683 = 1.0 - _592;
    precise float _684 = 1.0 - _593;
    precise float _688 = fma(_682, _681, _591) * _675;
    precise float _689 = fma(_683, _681, _592) * _676;
    precise float _690 = fma(_684, _681, _593) * _677;
    precise float _694 = _580 * _663;
    precise float _695 = _579 * _663;
    precise float _696 = _578 * _663;
    precise float _697 = _671 - _591;
    precise float _698 = _671 - _592;
    precise float _699 = _671 - _593;
    SV_Target.x = fma(_694, fma(_638, _697, _591), fma(_596, _672, _688));
    SV_Target.y = fma(_695, fma(_638, _698, _592), fma(_597, _673, _689));
    SV_Target.z = fma(_696, fma(_638, _699, _593), fma(_598, _674, _690));
    SV_Target.w = 1.0;
}

