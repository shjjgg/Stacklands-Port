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
    precise float _155 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _155));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _138 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _138)));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _126 = a.x * b.x;
    return fma(a.y, b.y, _126);
}

void main()
{
    precise float _179 = cb1._m4.x - TEXCOORD2.x;
    precise float _180 = cb1._m4.y - TEXCOORD2.y;
    precise float _181 = cb1._m4.z - TEXCOORD2.z;
    vec3 _182 = vec3(_179, _180, _181);
    precise float _184 = inversesqrt(dp3_f32(_182, _182));
    precise float _185 = _184 * _179;
    precise float _186 = _184 * _180;
    precise float _187 = _184 * _181;
    precise float _190 = TEXCOORD.y * 150.0;
    precise float _193 = sin(roundEven(_190)) * 43758.546875;
    precise float _195 = fract(_193) - 0.5;
    precise float _198 = fma(_195, 0.00999999977648258209228515625, TEXCOORD.x);
    precise float _199 = _198 * 150.0;
    precise float _202 = sin(roundEven(_199)) * 43758.546875;
    precise float _204 = fract(_202) - 0.5;
    precise float _205 = fma(_204, 0.0500000007450580596923828125, TEXCOORD.y);
    precise float _214 = abs(dFdx(_198)) + abs(dFdy(_198));
    precise float _215 = abs(dFdx(_205)) + abs(dFdy(_205));
    precise float _216 = _215 * 0.2666666805744171142578125;
    precise float _217 = _205 - 0.5;
    precise float _218 = _198 - 0.02999999932944774627685546875;
    precise float _220 = fma(-_218, 1.06382977962493896484375, 1.0);
    precise float _221 = _218 / _214;
    precise float _223 = 0.9700000286102294921875 - _198;
    precise float _224 = _223 / _214;
    precise float _226 = spvNClamp(_224, 0.0, 1.0) * spvNClamp(_221, 0.0, 1.0);
    precise float _229 = fma(_217, 0.2666666805744171142578125, 0.069999992847442626953125) / _216;
    precise float _231 = _226 * spvNClamp(_229, 0.0, 1.0);
    precise float _232 = 0.569999992847442626953125 - fma(_217, 0.2666666805744171142578125, 0.5);
    precise float _233 = _232 / _216;
    precise float _235 = _231 * spvNClamp(_233, 0.0, 1.0);
    precise float _247 = cb0._m8.x - cb0._m6.x;
    precise float _248 = cb0._m8.y - cb0._m6.y;
    precise float _249 = cb0._m8.z - cb0._m6.z;
    precise float _250 = fma(_235, _247, cb0._m6.x);
    precise float _251 = fma(_235, _248, cb0._m6.y);
    precise float _252 = fma(_235, _249, cb0._m6.z);
    float _258 = float(cb0._m14.x >= 0.5);
    precise float _269 = cb0._m12.x - cb0._m10.x;
    precise float _270 = cb0._m12.y - cb0._m10.y;
    precise float _271 = cb0._m12.z - cb0._m10.z;
    precise float _277 = _220 - cb0._m14.y;
    precise float _282 = abs(dFdy(_220)) + abs(dFdx(_220));
    precise float _283 = _277 / _282;
    float _286 = (_235 <= 0.0) ? 0.0 : spvNClamp(_283, 0.0, 1.0);
    precise float _287 = fma(_258, _269, cb0._m10.x) - _250;
    precise float _288 = fma(_258, _270, cb0._m10.y) - _251;
    precise float _289 = fma(_258, _271, cb0._m10.z) - _252;
    precise float _290 = fma(_286, _287, _250);
    precise float _291 = fma(_286, _288, _251);
    precise float _292 = fma(_286, _289, _252);
    float _301 = dp3_f32(_182, vec3(cb4._m9.z, cb4._m10.z, cb4._m11.z));
    precise float _308 = TEXCOORD2.x - cb3._m25.x;
    precise float _309 = TEXCOORD2.y - cb3._m25.y;
    precise float _310 = TEXCOORD2.z - cb3._m25.z;
    vec3 _311 = vec3(_308, _309, _310);
    precise float _314 = sqrt(dp3_f32(_311, _311)) - _301;
    float _399;
    float _400;
    float _401;
    float _402;
    if (cb6._m0.x == 1.0)
    {
        bool _332 = cb6._m0.y == 1.0;
        precise float _338 = TEXCOORD2.y * cb6._m3.x;
        precise float _339 = TEXCOORD2.y * cb6._m3.y;
        precise float _340 = TEXCOORD2.y * cb6._m3.z;
        precise float _362 = fma(cb6._m5.x, TEXCOORD2.z, fma(cb6._m1.x, TEXCOORD2.x, _338)) + cb6._m7.x;
        precise float _363 = fma(cb6._m5.y, TEXCOORD2.z, fma(cb6._m1.y, TEXCOORD2.x, _339)) + cb6._m7.y;
        precise float _364 = fma(cb6._m5.z, TEXCOORD2.z, fma(cb6._m1.z, TEXCOORD2.x, _340)) + cb6._m7.z;
        precise float _373 = (_332 ? _362 : TEXCOORD2.x) - cb6._m11.x;
        precise float _374 = (_332 ? _363 : TEXCOORD2.y) - cb6._m11.y;
        precise float _375 = (_332 ? _364 : TEXCOORD2.z) - cb6._m11.z;
        precise float _381 = _373 * cb6._m9.x;
        precise float _382 = _374 * cb6._m9.y;
        precise float _383 = _375 * cb6._m9.z;
        vec4 _394 = texture(sampler3D(t3, s1), vec3(spvNMax(fma(_381, 0.25, 0.75), fma(cb6._m0.z, 0.5, 0.75)), _382, _383));
        _399 = _394.w;
        _400 = _394.z;
        _401 = _394.y;
        _402 = _394.x;
    }
    else
    {
        _399 = 1.0;
        _400 = 1.0;
        _401 = 1.0;
        _402 = 1.0;
    }
    precise float _416 = TEXCOORD5.x / TEXCOORD5.w;
    precise float _417 = TEXCOORD5.y / TEXCOORD5.w;
    vec4 _423 = texture(sampler2D(t0, s2), vec2(_416, _417));
    float _424 = _423.x;
    precise float _425 = spvNClamp(dp4_f32(vec4(_402, _401, _400, _399), cb2._m47), 0.0, 1.0) - _424;
    precise float _426 = fma(spvNClamp(fma(fma(cb3._m26, _314, _301), cb3._m24.z, cb3._m24.w), 0.0, 1.0), _425, _424);
    precise float _429 = 1.0 - cb0._m5.x;
    precise float _430 = -_185;
    precise float _431 = -_186;
    precise float _432 = -_187;
    vec3 _440 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    float _441 = dp3_f32(vec3(_430, _431, _432), _440);
    precise float _442 = _441 + _441;
    precise float _443 = -_442;
    precise float _444 = fma(TEXCOORD1.x, _443, _430);
    precise float _445 = fma(TEXCOORD1.y, _443, _431);
    precise float _446 = fma(TEXCOORD1.z, _443, _432);
    precise float _452 = _426 * cb0._m2.x;
    precise float _453 = _426 * cb0._m2.y;
    precise float _454 = _426 * cb0._m2.z;
    vec3 _459 = vec3(_444, _445, _446);
    float _508;
    float _509;
    float _510;
    if (cb5._m5 > 0.0)
    {
        precise float _463 = inversesqrt(dp3_f32(_459, _459));
        precise float _464 = _463 * _444;
        precise float _465 = _463 * _445;
        precise float _466 = _463 * _446;
        precise float _472 = cb5._m0.x - TEXCOORD2.x;
        precise float _473 = cb5._m0.y - TEXCOORD2.y;
        precise float _474 = cb5._m0.z - TEXCOORD2.z;
        precise float _475 = _472 / _464;
        precise float _476 = _473 / _465;
        precise float _477 = _474 / _466;
        precise float _483 = cb5._m2.x - TEXCOORD2.x;
        precise float _484 = cb5._m2.y - TEXCOORD2.y;
        precise float _485 = cb5._m2.z - TEXCOORD2.z;
        precise float _486 = _483 / _464;
        precise float _487 = _484 / _465;
        precise float _488 = _485 / _466;
        precise float _496 = spvNMin((_466 > 0.0) ? _477 : _488, spvNMin((_465 > 0.0) ? _476 : _487, (_464 > 0.0) ? _475 : _486));
        precise float _502 = TEXCOORD2.x - cb5._m4.x;
        precise float _503 = TEXCOORD2.y - cb5._m4.y;
        precise float _504 = TEXCOORD2.z - cb5._m4.z;
        _508 = fma(_466, _496, _504);
        _509 = fma(_465, _496, _503);
        _510 = fma(_464, _496, _502);
    }
    else
    {
        _508 = _446;
        _509 = _445;
        _510 = _444;
    }
    precise float _513 = fma(-_429, 0.699999988079071044921875, 1.7000000476837158203125) * _429;
    precise float _514 = _513 * 6.0;
    vec4 _520 = textureLod(samplerCube(t1, s0), vec3(_510, _509, _508), _514);
    float _521 = _520.x;
    float _522 = _520.y;
    float _523 = _520.z;
    precise float _525 = _520.w - 1.0;
    precise float _532 = log2(fma(cb5._m6.w, _525, 1.0)) * cb5._m6.y;
    precise float _536 = exp2(_532) * cb5._m6.x;
    precise float _537 = _521 * _536;
    precise float _538 = _522 * _536;
    precise float _539 = _523 * _536;
    float _631;
    float _632;
    float _633;
    if (cb5._m3 < 0.999989986419677734375)
    {
        float _596;
        float _597;
        float _598;
        if (cb5._m12 > 0.0)
        {
            precise float _551 = inversesqrt(dp3_f32(_459, _459));
            precise float _552 = _444 * _551;
            precise float _553 = _445 * _551;
            precise float _554 = _446 * _551;
            precise float _560 = cb5._m7.x - TEXCOORD2.x;
            precise float _561 = cb5._m7.y - TEXCOORD2.y;
            precise float _562 = cb5._m7.z - TEXCOORD2.z;
            precise float _563 = _560 / _552;
            precise float _564 = _561 / _553;
            precise float _565 = _562 / _554;
            precise float _571 = cb5._m9.x - TEXCOORD2.x;
            precise float _572 = cb5._m9.y - TEXCOORD2.y;
            precise float _573 = cb5._m9.z - TEXCOORD2.z;
            precise float _574 = _571 / _552;
            precise float _575 = _572 / _553;
            precise float _576 = _573 / _554;
            precise float _584 = spvNMin((_554 > 0.0) ? _565 : _576, spvNMin((_553 > 0.0) ? _564 : _575, (_552 > 0.0) ? _563 : _574));
            precise float _590 = TEXCOORD2.x - cb5._m11.x;
            precise float _591 = TEXCOORD2.y - cb5._m11.y;
            precise float _592 = TEXCOORD2.z - cb5._m11.z;
            _596 = fma(_554, _584, _592);
            _597 = fma(_553, _584, _591);
            _598 = fma(_552, _584, _590);
        }
        else
        {
            _596 = _446;
            _597 = _445;
            _598 = _444;
        }
        vec4 _602 = textureLod(samplerCube(t2, s0), vec3(_598, _597, _596), _514);
        precise float _607 = _602.w - 1.0;
        precise float _614 = log2(fma(cb5._m13.w, _607, 1.0)) * cb5._m13.y;
        precise float _618 = exp2(_614) * cb5._m13.x;
        precise float _619 = _602.x * _618;
        precise float _620 = _602.y * _618;
        precise float _621 = _602.z * _618;
        _631 = fma(cb5._m3, fma(_536, _523, -_621), _621);
        _632 = fma(cb5._m3, fma(_536, _522, -_620), _620);
        _633 = fma(cb5._m3, fma(_536, _521, -_619), _619);
    }
    else
    {
        _631 = _539;
        _632 = _538;
        _633 = _537;
    }
    precise float _635 = inversesqrt(dp3_f32(_440, _440));
    precise float _636 = _635 * TEXCOORD1.x;
    precise float _637 = _635 * TEXCOORD1.y;
    precise float _638 = _635 * TEXCOORD1.z;
    precise float _639 = _290 - 0.039999999105930328369140625;
    precise float _640 = _291 - 0.039999999105930328369140625;
    precise float _641 = _292 - 0.039999999105930328369140625;
    precise float _644 = fma(cb0._m5.y, _639, 0.039999999105930328369140625);
    precise float _645 = fma(cb0._m5.y, _640, 0.039999999105930328369140625);
    precise float _646 = fma(cb0._m5.y, _641, 0.039999999105930328369140625);
    precise float _648 = fma(-cb0._m5.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _649 = _648 * _290;
    precise float _650 = _648 * _291;
    precise float _651 = _648 * _292;
    precise float _657 = fma(_179, _184, cb2._m0.x);
    precise float _658 = fma(_180, _184, cb2._m0.y);
    precise float _659 = fma(_181, _184, cb2._m0.z);
    vec3 _660 = vec3(_657, _658, _659);
    precise float _663 = inversesqrt(spvNMax(dp3_f32(_660, _660), 0.001000000047497451305389404296875));
    precise float _664 = _663 * _657;
    precise float _665 = _663 * _658;
    precise float _666 = _663 * _659;
    vec3 _667 = vec3(_636, _637, _638);
    precise float _671 = spvNClamp(dp3_f32(_667, cb2._m0), 0.0, 1.0);
    vec3 _672 = vec3(_664, _665, _666);
    precise float _674 = spvNClamp(dp3_f32(_667, _672), 0.0, 1.0);
    precise float _676 = spvNClamp(dp3_f32(cb2._m0, _672), 0.0, 1.0);
    precise float _677 = _676 * _676;
    precise float _681 = dp2_f32(vec2(_677), vec2(_429)) - 0.5;
    precise float _682 = 1.0 - _671;
    precise float _683 = _682 * _682;
    precise float _684 = _683 * _683;
    precise float _685 = _682 * _684;
    precise float _687 = abs(dp3_f32(_667, vec3(_185, _186, _187)));
    precise float _688 = 1.0 - _687;
    precise float _689 = _688 * _688;
    precise float _690 = _689 * _689;
    precise float _691 = _688 * _690;
    precise float _693 = fma(_681, _691, 1.0) * fma(_681, _685, 1.0);
    precise float _694 = _429 * _429;
    precise float _695 = spvNMax(_694, 0.00200000009499490261077880859375);
    precise float _696 = 1.0 - _695;
    precise float _699 = _687 * fma(_671, _696, _695);
    precise float _701 = fma(_671, fma(_687, _696, _695), _699) + 9.9999997473787516355514526367188e-06;
    precise float _702 = 0.5 / _701;
    precise float _703 = _695 * _695;
    precise float _706 = fma(fma(_674, _703, -_674), _674, 1.0);
    precise float _707 = _703 * 0.3183098733425140380859375;
    precise float _709 = _707 / fma(_706, _706, 1.0000000116860974230803549289703e-07);
    precise float _710 = _702 * _709;
    precise float _711 = _710 * 3.1415927410125732421875;
    precise float _712 = _671 * _693;
    precise float _713 = _671 * _711;
    precise float _716 = 1.0 / fma(_695, _695, 1.0);
    vec3 _717 = vec3(_644, _645, _646);
    precise float _721 = spvNMax(_713, 0.0) * ((dp3_f32(_717, _717) == 0.0) ? 0.0 : 1.0);
    precise float _722 = cb0._m5.x - _648;
    precise float _723 = _722 + 1.0;
    precise float _724 = spvNClamp(_723, 0.0, 1.0);
    precise float _725 = _712 * _452;
    precise float _726 = _712 * _453;
    precise float _727 = _712 * _454;
    precise float _728 = _452 * _721;
    precise float _729 = _453 * _721;
    precise float _730 = _454 * _721;
    precise float _731 = 1.0 - _676;
    precise float _732 = _731 * _731;
    precise float _733 = _732 * _732;
    precise float _734 = _731 * _733;
    precise float _735 = 1.0 - _644;
    precise float _736 = 1.0 - _645;
    precise float _737 = 1.0 - _646;
    precise float _741 = fma(_735, _734, _644) * _728;
    precise float _742 = fma(_736, _734, _645) * _729;
    precise float _743 = fma(_737, _734, _646) * _730;
    precise float _747 = _633 * _716;
    precise float _748 = _632 * _716;
    precise float _749 = _631 * _716;
    precise float _750 = _724 - _644;
    precise float _751 = _724 - _645;
    precise float _752 = _724 - _646;
    SV_Target.x = fma(_747, fma(_691, _750, _644), fma(_649, _725, _741));
    SV_Target.y = fma(_748, fma(_691, _751, _645), fma(_650, _726, _742));
    SV_Target.z = fma(_749, fma(_691, _752, _646), fma(_651, _727, _743));
    SV_Target.w = 1.0;
}

