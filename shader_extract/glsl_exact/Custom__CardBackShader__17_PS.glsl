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
layout(set = 0, binding = 8) uniform texture2D t0;
layout(set = 0, binding = 9) uniform textureCube t1;
layout(set = 0, binding = 10) uniform textureCube t2;
layout(set = 0, binding = 11) uniform texture3D t3;

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
    precise float _134 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _134));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _117 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _117)));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _105 = a.x * b.x;
    return fma(a.y, b.y, _105);
}

void main()
{
    precise float _158 = cb1._m4.x - TEXCOORD2.x;
    precise float _159 = cb1._m4.y - TEXCOORD2.y;
    precise float _160 = cb1._m4.z - TEXCOORD2.z;
    vec3 _161 = vec3(_158, _159, _160);
    precise float _163 = inversesqrt(dp3_f32(_161, _161));
    precise float _164 = _163 * _158;
    precise float _165 = _163 * _159;
    precise float _166 = _163 * _160;
    vec4 _176 = texture(sampler2D(t0, s2), vec2(TEXCOORD.x, TEXCOORD.y));
    precise float _186 = _176.x * cb0._m6.x;
    precise float _187 = _176.y * cb0._m6.y;
    precise float _188 = _176.z * cb0._m6.z;
    precise float _189 = TEXCOORD.y + TEXCOORD.x;
    precise float _190 = _189 * 10.0;
    precise float _193 = roundEven(fract(_190)) + 0.800000011920928955078125;
    precise float _194 = spvNMin(_193, 1.0);
    precise float _195 = _194 * _186;
    precise float _196 = _194 * _187;
    precise float _197 = _194 * _188;
    bool _205 = (((TEXCOORD.x < 0.13677684962749481201171875) || (TEXCOORD.x > 0.863223135471343994140625)) || (TEXCOORD.y < 0.0500000007450580596923828125)) || (TEXCOORD.y > 0.949999988079071044921875);
    float _206 = _205 ? 0.0 : _195;
    float _207 = _205 ? 0.0 : _196;
    float _208 = _205 ? 0.0 : _197;
    bool _213 = cb4._m0.x == 1.0;
    float _285;
    float _286;
    float _287;
    float _288;
    if (_213)
    {
        bool _220 = cb4._m0.y == 1.0;
        precise float _226 = TEXCOORD2.y * cb4._m3.x;
        precise float _227 = TEXCOORD2.y * cb4._m3.y;
        precise float _228 = TEXCOORD2.y * cb4._m3.z;
        precise float _250 = fma(cb4._m5.x, TEXCOORD2.z, fma(cb4._m1.x, TEXCOORD2.x, _226)) + cb4._m7.x;
        precise float _251 = fma(cb4._m5.y, TEXCOORD2.z, fma(cb4._m1.y, TEXCOORD2.x, _227)) + cb4._m7.y;
        precise float _252 = fma(cb4._m5.z, TEXCOORD2.z, fma(cb4._m1.z, TEXCOORD2.x, _228)) + cb4._m7.z;
        precise float _261 = (_220 ? _250 : TEXCOORD2.x) - cb4._m11.x;
        precise float _262 = (_220 ? _251 : TEXCOORD2.y) - cb4._m11.y;
        precise float _263 = (_220 ? _252 : TEXCOORD2.z) - cb4._m11.z;
        precise float _269 = _261 * cb4._m9.x;
        precise float _270 = _262 * cb4._m9.y;
        precise float _271 = _263 * cb4._m9.z;
        vec4 _280 = texture(sampler3D(t3, s1), vec3(spvNMax(fma(_269, 0.25, 0.75), fma(cb4._m0.z, 0.5, 0.75)), _270, _271));
        _285 = _280.w;
        _286 = _280.z;
        _287 = _280.y;
        _288 = _280.x;
    }
    else
    {
        _285 = 1.0;
        _286 = 1.0;
        _287 = 1.0;
        _288 = 1.0;
    }
    precise float _295 = spvNClamp(dp4_f32(vec4(_288, _287, _286, _285), cb2._m47), 0.0, 1.0);
    precise float _298 = 1.0 - cb0._m5.x;
    precise float _299 = -_164;
    precise float _300 = -_165;
    precise float _301 = -_166;
    vec3 _309 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    float _310 = dp3_f32(vec3(_299, _300, _301), _309);
    precise float _311 = _310 + _310;
    precise float _312 = -_311;
    precise float _313 = fma(TEXCOORD1.x, _312, _299);
    precise float _314 = fma(TEXCOORD1.y, _312, _300);
    precise float _315 = fma(TEXCOORD1.z, _312, _301);
    precise float _321 = _295 * cb0._m2.x;
    precise float _322 = _295 * cb0._m2.y;
    precise float _323 = _295 * cb0._m2.z;
    vec4 _324 = vec4(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z, 1.0);
    float _415;
    float _416;
    float _417;
    if (_213)
    {
        bool _330 = cb4._m0.y == 1.0;
        precise float _336 = TEXCOORD2.y * cb4._m3.x;
        precise float _337 = TEXCOORD2.y * cb4._m3.y;
        precise float _338 = TEXCOORD2.y * cb4._m3.z;
        precise float _360 = fma(cb4._m5.x, TEXCOORD2.z, fma(cb4._m1.x, TEXCOORD2.x, _336)) + cb4._m7.x;
        precise float _361 = fma(cb4._m5.y, TEXCOORD2.z, fma(cb4._m1.y, TEXCOORD2.x, _337)) + cb4._m7.y;
        precise float _362 = fma(cb4._m5.z, TEXCOORD2.z, fma(cb4._m1.z, TEXCOORD2.x, _338)) + cb4._m7.z;
        precise float _371 = (_330 ? _360 : TEXCOORD2.x) - cb4._m11.x;
        precise float _372 = (_330 ? _361 : TEXCOORD2.y) - cb4._m11.y;
        precise float _373 = (_330 ? _362 : TEXCOORD2.z) - cb4._m11.z;
        precise float _379 = _371 * cb4._m9.x;
        precise float _380 = _372 * cb4._m9.y;
        precise float _381 = _373 * cb4._m9.z;
        precise float _382 = _379 * 0.25;
        precise float _385 = cb4._m0.z * 0.5;
        precise float _389 = spvNMin(fma(-cb4._m0.z, 0.5, 0.25), spvNMax(_382, _385));
        precise float _393 = _389 + 0.25;
        precise float _394 = _380 + 0.0;
        precise float _395 = _381 + 0.0;
        precise float _399 = _389 + 0.5;
        _415 = dp4_f32(texture(sampler3D(t3, s1), vec3(_399, _394, _395)), _324);
        _416 = dp4_f32(texture(sampler3D(t3, s1), vec3(_393, _394, _395)), _324);
        _417 = dp4_f32(texture(sampler3D(t3, s1), vec3(_389, _380, _381)), _324);
    }
    else
    {
        _415 = dp4_f32(cb2._m42, _324);
        _416 = dp4_f32(cb2._m41, _324);
        _417 = dp4_f32(cb2._m40, _324);
    }
    precise float _424 = _417 + TEXCOORD3.x;
    precise float _425 = _416 + TEXCOORD3.y;
    precise float _426 = _415 + TEXCOORD3.z;
    vec3 _434 = vec3(_313, _314, _315);
    float _483;
    float _484;
    float _485;
    if (cb3._m5 > 0.0)
    {
        precise float _438 = inversesqrt(dp3_f32(_434, _434));
        precise float _439 = _438 * _313;
        precise float _440 = _438 * _314;
        precise float _441 = _438 * _315;
        precise float _447 = cb3._m0.x - TEXCOORD2.x;
        precise float _448 = cb3._m0.y - TEXCOORD2.y;
        precise float _449 = cb3._m0.z - TEXCOORD2.z;
        precise float _450 = _447 / _439;
        precise float _451 = _448 / _440;
        precise float _452 = _449 / _441;
        precise float _458 = cb3._m2.x - TEXCOORD2.x;
        precise float _459 = cb3._m2.y - TEXCOORD2.y;
        precise float _460 = cb3._m2.z - TEXCOORD2.z;
        precise float _461 = _458 / _439;
        precise float _462 = _459 / _440;
        precise float _463 = _460 / _441;
        precise float _471 = spvNMin((_441 > 0.0) ? _452 : _463, spvNMin((_440 > 0.0) ? _451 : _462, (_439 > 0.0) ? _450 : _461));
        precise float _477 = TEXCOORD2.x - cb3._m4.x;
        precise float _478 = TEXCOORD2.y - cb3._m4.y;
        precise float _479 = TEXCOORD2.z - cb3._m4.z;
        _483 = fma(_441, _471, _479);
        _484 = fma(_440, _471, _478);
        _485 = fma(_439, _471, _477);
    }
    else
    {
        _483 = _315;
        _484 = _314;
        _485 = _313;
    }
    precise float _488 = fma(-_298, 0.699999988079071044921875, 1.7000000476837158203125) * _298;
    precise float _489 = _488 * 6.0;
    vec4 _495 = textureLod(samplerCube(t1, s0), vec3(_485, _484, _483), _489);
    float _496 = _495.x;
    float _497 = _495.y;
    float _498 = _495.z;
    precise float _500 = _495.w - 1.0;
    precise float _507 = log2(fma(cb3._m6.w, _500, 1.0)) * cb3._m6.y;
    precise float _511 = exp2(_507) * cb3._m6.x;
    precise float _512 = _496 * _511;
    precise float _513 = _497 * _511;
    precise float _514 = _498 * _511;
    float _606;
    float _607;
    float _608;
    if (cb3._m3 < 0.999989986419677734375)
    {
        float _571;
        float _572;
        float _573;
        if (cb3._m12 > 0.0)
        {
            precise float _526 = inversesqrt(dp3_f32(_434, _434));
            precise float _527 = _313 * _526;
            precise float _528 = _314 * _526;
            precise float _529 = _315 * _526;
            precise float _535 = cb3._m7.x - TEXCOORD2.x;
            precise float _536 = cb3._m7.y - TEXCOORD2.y;
            precise float _537 = cb3._m7.z - TEXCOORD2.z;
            precise float _538 = _535 / _527;
            precise float _539 = _536 / _528;
            precise float _540 = _537 / _529;
            precise float _546 = cb3._m9.x - TEXCOORD2.x;
            precise float _547 = cb3._m9.y - TEXCOORD2.y;
            precise float _548 = cb3._m9.z - TEXCOORD2.z;
            precise float _549 = _546 / _527;
            precise float _550 = _547 / _528;
            precise float _551 = _548 / _529;
            precise float _559 = spvNMin((_529 > 0.0) ? _540 : _551, spvNMin((_528 > 0.0) ? _539 : _550, (_527 > 0.0) ? _538 : _549));
            precise float _565 = TEXCOORD2.x - cb3._m11.x;
            precise float _566 = TEXCOORD2.y - cb3._m11.y;
            precise float _567 = TEXCOORD2.z - cb3._m11.z;
            _571 = fma(_529, _559, _567);
            _572 = fma(_528, _559, _566);
            _573 = fma(_527, _559, _565);
        }
        else
        {
            _571 = _315;
            _572 = _314;
            _573 = _313;
        }
        vec4 _577 = textureLod(samplerCube(t2, s0), vec3(_573, _572, _571), _489);
        precise float _582 = _577.w - 1.0;
        precise float _589 = log2(fma(cb3._m13.w, _582, 1.0)) * cb3._m13.y;
        precise float _593 = exp2(_589) * cb3._m13.x;
        precise float _594 = _577.x * _593;
        precise float _595 = _577.y * _593;
        precise float _596 = _577.z * _593;
        _606 = fma(cb3._m3, fma(_511, _498, -_596), _596);
        _607 = fma(cb3._m3, fma(_511, _497, -_595), _595);
        _608 = fma(cb3._m3, fma(_511, _496, -_594), _594);
    }
    else
    {
        _606 = _514;
        _607 = _513;
        _608 = _512;
    }
    precise float _610 = inversesqrt(dp3_f32(_309, _309));
    precise float _611 = _610 * TEXCOORD1.x;
    precise float _612 = _610 * TEXCOORD1.y;
    precise float _613 = _610 * TEXCOORD1.z;
    precise float _614 = _206 - 0.039999999105930328369140625;
    precise float _615 = _207 - 0.039999999105930328369140625;
    precise float _616 = _208 - 0.039999999105930328369140625;
    precise float _619 = fma(cb0._m5.y, _614, 0.039999999105930328369140625);
    precise float _620 = fma(cb0._m5.y, _615, 0.039999999105930328369140625);
    precise float _621 = fma(cb0._m5.y, _616, 0.039999999105930328369140625);
    precise float _623 = fma(-cb0._m5.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _624 = _623 * _206;
    precise float _625 = _623 * _207;
    precise float _626 = _623 * _208;
    precise float _632 = fma(_158, _163, cb2._m0.x);
    precise float _633 = fma(_159, _163, cb2._m0.y);
    precise float _634 = fma(_160, _163, cb2._m0.z);
    vec3 _635 = vec3(_632, _633, _634);
    precise float _638 = inversesqrt(spvNMax(dp3_f32(_635, _635), 0.001000000047497451305389404296875));
    precise float _639 = _638 * _632;
    precise float _640 = _638 * _633;
    precise float _641 = _638 * _634;
    vec3 _642 = vec3(_611, _612, _613);
    precise float _646 = spvNClamp(dp3_f32(_642, cb2._m0), 0.0, 1.0);
    vec3 _647 = vec3(_639, _640, _641);
    precise float _649 = spvNClamp(dp3_f32(_642, _647), 0.0, 1.0);
    precise float _651 = spvNClamp(dp3_f32(cb2._m0, _647), 0.0, 1.0);
    precise float _652 = _651 * _651;
    precise float _656 = dp2_f32(vec2(_652), vec2(_298)) - 0.5;
    precise float _657 = 1.0 - _646;
    precise float _658 = _657 * _657;
    precise float _659 = _658 * _658;
    precise float _660 = _657 * _659;
    precise float _662 = abs(dp3_f32(_642, vec3(_164, _165, _166)));
    precise float _663 = 1.0 - _662;
    precise float _664 = _663 * _663;
    precise float _665 = _664 * _664;
    precise float _666 = _663 * _665;
    precise float _668 = fma(_656, _666, 1.0) * fma(_656, _660, 1.0);
    precise float _669 = _298 * _298;
    precise float _670 = spvNMax(_669, 0.00200000009499490261077880859375);
    precise float _671 = 1.0 - _670;
    precise float _674 = _662 * fma(_646, _671, _670);
    precise float _676 = fma(_646, fma(_662, _671, _670), _674) + 9.9999997473787516355514526367188e-06;
    precise float _677 = 0.5 / _676;
    precise float _678 = _670 * _670;
    precise float _681 = fma(fma(_649, _678, -_649), _649, 1.0);
    precise float _682 = _678 * 0.3183098733425140380859375;
    precise float _684 = _682 / fma(_681, _681, 1.0000000116860974230803549289703e-07);
    precise float _685 = _677 * _684;
    precise float _686 = _685 * 3.1415927410125732421875;
    precise float _687 = _646 * _668;
    precise float _688 = _646 * _686;
    precise float _691 = 1.0 / fma(_670, _670, 1.0);
    vec3 _692 = vec3(_619, _620, _621);
    precise float _696 = spvNMax(_688, 0.0) * ((dp3_f32(_692, _692) == 0.0) ? 0.0 : 1.0);
    precise float _697 = cb0._m5.x - _623;
    precise float _698 = _697 + 1.0;
    precise float _699 = spvNClamp(_698, 0.0, 1.0);
    precise float _703 = _321 * _696;
    precise float _704 = _322 * _696;
    precise float _705 = _323 * _696;
    precise float _706 = 1.0 - _651;
    precise float _707 = _706 * _706;
    precise float _708 = _707 * _707;
    precise float _709 = _706 * _708;
    precise float _710 = 1.0 - _619;
    precise float _711 = 1.0 - _620;
    precise float _712 = 1.0 - _621;
    precise float _716 = fma(_710, _709, _619) * _703;
    precise float _717 = fma(_711, _709, _620) * _704;
    precise float _718 = fma(_712, _709, _621) * _705;
    precise float _722 = _608 * _691;
    precise float _723 = _607 * _691;
    precise float _724 = _606 * _691;
    precise float _725 = _699 - _619;
    precise float _726 = _699 - _620;
    precise float _727 = _699 - _621;
    SV_Target.x = fma(_722, fma(_666, _725, _619), fma(_624, fma(_321, _687, spvNMax(_424, 0.0)), _716));
    SV_Target.y = fma(_723, fma(_666, _726, _620), fma(_625, fma(_322, _687, spvNMax(_425, 0.0)), _717));
    SV_Target.z = fma(_724, fma(_666, _727, _621), fma(_626, fma(_323, _687, spvNMax(_426, 0.0)), _718));
    SV_Target.w = 1.0;
}

