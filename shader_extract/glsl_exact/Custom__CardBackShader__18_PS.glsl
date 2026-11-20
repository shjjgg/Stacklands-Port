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
    precise float _149 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _149));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _132 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _132)));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _120 = a.x * b.x;
    return fma(a.y, b.y, _120);
}

void main()
{
    precise float _173 = cb1._m4.x - TEXCOORD2.x;
    precise float _174 = cb1._m4.y - TEXCOORD2.y;
    precise float _175 = cb1._m4.z - TEXCOORD2.z;
    vec3 _176 = vec3(_173, _174, _175);
    precise float _178 = inversesqrt(dp3_f32(_176, _176));
    precise float _179 = _178 * _173;
    precise float _180 = _178 * _174;
    precise float _181 = _178 * _175;
    vec4 _191 = texture(sampler2D(t0, s3), vec2(TEXCOORD.x, TEXCOORD.y));
    precise float _201 = _191.x * cb0._m6.x;
    precise float _202 = _191.y * cb0._m6.y;
    precise float _203 = _191.z * cb0._m6.z;
    precise float _204 = TEXCOORD.y + TEXCOORD.x;
    precise float _205 = _204 * 10.0;
    precise float _208 = roundEven(fract(_205)) + 0.800000011920928955078125;
    precise float _209 = spvNMin(_208, 1.0);
    precise float _210 = _209 * _201;
    precise float _211 = _209 * _202;
    precise float _212 = _209 * _203;
    bool _220 = (((TEXCOORD.x < 0.13677684962749481201171875) || (TEXCOORD.x > 0.863223135471343994140625)) || (TEXCOORD.y < 0.0500000007450580596923828125)) || (TEXCOORD.y > 0.949999988079071044921875);
    float _221 = _220 ? 0.0 : _210;
    float _222 = _220 ? 0.0 : _211;
    float _223 = _220 ? 0.0 : _212;
    float _233 = dp3_f32(_176, vec3(cb4._m9.z, cb4._m10.z, cb4._m11.z));
    precise float _240 = TEXCOORD2.x - cb3._m25.x;
    precise float _241 = TEXCOORD2.y - cb3._m25.y;
    precise float _242 = TEXCOORD2.z - cb3._m25.z;
    vec3 _243 = vec3(_240, _241, _242);
    precise float _246 = sqrt(dp3_f32(_243, _243)) - _233;
    float _331;
    float _332;
    float _333;
    float _334;
    if (cb6._m0.x == 1.0)
    {
        bool _264 = cb6._m0.y == 1.0;
        precise float _270 = TEXCOORD2.y * cb6._m3.x;
        precise float _271 = TEXCOORD2.y * cb6._m3.y;
        precise float _272 = TEXCOORD2.y * cb6._m3.z;
        precise float _294 = fma(cb6._m5.x, TEXCOORD2.z, fma(cb6._m1.x, TEXCOORD2.x, _270)) + cb6._m7.x;
        precise float _295 = fma(cb6._m5.y, TEXCOORD2.z, fma(cb6._m1.y, TEXCOORD2.x, _271)) + cb6._m7.y;
        precise float _296 = fma(cb6._m5.z, TEXCOORD2.z, fma(cb6._m1.z, TEXCOORD2.x, _272)) + cb6._m7.z;
        precise float _305 = (_264 ? _294 : TEXCOORD2.x) - cb6._m11.x;
        precise float _306 = (_264 ? _295 : TEXCOORD2.y) - cb6._m11.y;
        precise float _307 = (_264 ? _296 : TEXCOORD2.z) - cb6._m11.z;
        precise float _313 = _305 * cb6._m9.x;
        precise float _314 = _306 * cb6._m9.y;
        precise float _315 = _307 * cb6._m9.z;
        vec4 _326 = texture(sampler3D(t4, s1), vec3(spvNMax(fma(_313, 0.25, 0.75), fma(cb6._m0.z, 0.5, 0.75)), _314, _315));
        _331 = _326.w;
        _332 = _326.z;
        _333 = _326.y;
        _334 = _326.x;
    }
    else
    {
        _331 = 1.0;
        _332 = 1.0;
        _333 = 1.0;
        _334 = 1.0;
    }
    precise float _348 = TEXCOORD5.x / TEXCOORD5.w;
    precise float _349 = TEXCOORD5.y / TEXCOORD5.w;
    vec4 _354 = texture(sampler2D(t1, s2), vec2(_348, _349));
    float _355 = _354.x;
    precise float _356 = spvNClamp(dp4_f32(vec4(_334, _333, _332, _331), cb2._m47), 0.0, 1.0) - _355;
    precise float _357 = fma(spvNClamp(fma(fma(cb3._m26, _246, _233), cb3._m24.z, cb3._m24.w), 0.0, 1.0), _356, _355);
    precise float _360 = 1.0 - cb0._m5.x;
    precise float _361 = -_179;
    precise float _362 = -_180;
    precise float _363 = -_181;
    vec3 _371 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    float _372 = dp3_f32(vec3(_361, _362, _363), _371);
    precise float _373 = _372 + _372;
    precise float _374 = -_373;
    precise float _375 = fma(TEXCOORD1.x, _374, _361);
    precise float _376 = fma(TEXCOORD1.y, _374, _362);
    precise float _377 = fma(TEXCOORD1.z, _374, _363);
    precise float _383 = _357 * cb0._m2.x;
    precise float _384 = _357 * cb0._m2.y;
    precise float _385 = _357 * cb0._m2.z;
    vec3 _390 = vec3(_375, _376, _377);
    float _439;
    float _440;
    float _441;
    if (cb5._m5 > 0.0)
    {
        precise float _394 = inversesqrt(dp3_f32(_390, _390));
        precise float _395 = _394 * _375;
        precise float _396 = _394 * _376;
        precise float _397 = _394 * _377;
        precise float _403 = cb5._m0.x - TEXCOORD2.x;
        precise float _404 = cb5._m0.y - TEXCOORD2.y;
        precise float _405 = cb5._m0.z - TEXCOORD2.z;
        precise float _406 = _403 / _395;
        precise float _407 = _404 / _396;
        precise float _408 = _405 / _397;
        precise float _414 = cb5._m2.x - TEXCOORD2.x;
        precise float _415 = cb5._m2.y - TEXCOORD2.y;
        precise float _416 = cb5._m2.z - TEXCOORD2.z;
        precise float _417 = _414 / _395;
        precise float _418 = _415 / _396;
        precise float _419 = _416 / _397;
        precise float _427 = spvNMin((_397 > 0.0) ? _408 : _419, spvNMin((_396 > 0.0) ? _407 : _418, (_395 > 0.0) ? _406 : _417));
        precise float _433 = TEXCOORD2.x - cb5._m4.x;
        precise float _434 = TEXCOORD2.y - cb5._m4.y;
        precise float _435 = TEXCOORD2.z - cb5._m4.z;
        _439 = fma(_397, _427, _435);
        _440 = fma(_396, _427, _434);
        _441 = fma(_395, _427, _433);
    }
    else
    {
        _439 = _377;
        _440 = _376;
        _441 = _375;
    }
    precise float _444 = fma(-_360, 0.699999988079071044921875, 1.7000000476837158203125) * _360;
    precise float _445 = _444 * 6.0;
    vec4 _451 = textureLod(samplerCube(t2, s0), vec3(_441, _440, _439), _445);
    float _452 = _451.x;
    float _453 = _451.y;
    float _454 = _451.z;
    precise float _456 = _451.w - 1.0;
    precise float _463 = log2(fma(cb5._m6.w, _456, 1.0)) * cb5._m6.y;
    precise float _467 = exp2(_463) * cb5._m6.x;
    precise float _468 = _452 * _467;
    precise float _469 = _453 * _467;
    precise float _470 = _454 * _467;
    float _562;
    float _563;
    float _564;
    if (cb5._m3 < 0.999989986419677734375)
    {
        float _527;
        float _528;
        float _529;
        if (cb5._m12 > 0.0)
        {
            precise float _482 = inversesqrt(dp3_f32(_390, _390));
            precise float _483 = _375 * _482;
            precise float _484 = _376 * _482;
            precise float _485 = _377 * _482;
            precise float _491 = cb5._m7.x - TEXCOORD2.x;
            precise float _492 = cb5._m7.y - TEXCOORD2.y;
            precise float _493 = cb5._m7.z - TEXCOORD2.z;
            precise float _494 = _491 / _483;
            precise float _495 = _492 / _484;
            precise float _496 = _493 / _485;
            precise float _502 = cb5._m9.x - TEXCOORD2.x;
            precise float _503 = cb5._m9.y - TEXCOORD2.y;
            precise float _504 = cb5._m9.z - TEXCOORD2.z;
            precise float _505 = _502 / _483;
            precise float _506 = _503 / _484;
            precise float _507 = _504 / _485;
            precise float _515 = spvNMin((_485 > 0.0) ? _496 : _507, spvNMin((_484 > 0.0) ? _495 : _506, (_483 > 0.0) ? _494 : _505));
            precise float _521 = TEXCOORD2.x - cb5._m11.x;
            precise float _522 = TEXCOORD2.y - cb5._m11.y;
            precise float _523 = TEXCOORD2.z - cb5._m11.z;
            _527 = fma(_485, _515, _523);
            _528 = fma(_484, _515, _522);
            _529 = fma(_483, _515, _521);
        }
        else
        {
            _527 = _377;
            _528 = _376;
            _529 = _375;
        }
        vec4 _533 = textureLod(samplerCube(t3, s0), vec3(_529, _528, _527), _445);
        precise float _538 = _533.w - 1.0;
        precise float _545 = log2(fma(cb5._m13.w, _538, 1.0)) * cb5._m13.y;
        precise float _549 = exp2(_545) * cb5._m13.x;
        precise float _550 = _533.x * _549;
        precise float _551 = _533.y * _549;
        precise float _552 = _533.z * _549;
        _562 = fma(cb5._m3, fma(_467, _454, -_552), _552);
        _563 = fma(cb5._m3, fma(_467, _453, -_551), _551);
        _564 = fma(cb5._m3, fma(_467, _452, -_550), _550);
    }
    else
    {
        _562 = _470;
        _563 = _469;
        _564 = _468;
    }
    precise float _566 = inversesqrt(dp3_f32(_371, _371));
    precise float _567 = _566 * TEXCOORD1.x;
    precise float _568 = _566 * TEXCOORD1.y;
    precise float _569 = _566 * TEXCOORD1.z;
    precise float _570 = _221 - 0.039999999105930328369140625;
    precise float _571 = _222 - 0.039999999105930328369140625;
    precise float _572 = _223 - 0.039999999105930328369140625;
    precise float _575 = fma(cb0._m5.y, _570, 0.039999999105930328369140625);
    precise float _576 = fma(cb0._m5.y, _571, 0.039999999105930328369140625);
    precise float _577 = fma(cb0._m5.y, _572, 0.039999999105930328369140625);
    precise float _579 = fma(-cb0._m5.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _580 = _579 * _221;
    precise float _581 = _579 * _222;
    precise float _582 = _579 * _223;
    precise float _588 = fma(_173, _178, cb2._m0.x);
    precise float _589 = fma(_174, _178, cb2._m0.y);
    precise float _590 = fma(_175, _178, cb2._m0.z);
    vec3 _591 = vec3(_588, _589, _590);
    precise float _594 = inversesqrt(spvNMax(dp3_f32(_591, _591), 0.001000000047497451305389404296875));
    precise float _595 = _594 * _588;
    precise float _596 = _594 * _589;
    precise float _597 = _594 * _590;
    vec3 _598 = vec3(_567, _568, _569);
    precise float _602 = spvNClamp(dp3_f32(_598, cb2._m0), 0.0, 1.0);
    vec3 _603 = vec3(_595, _596, _597);
    precise float _605 = spvNClamp(dp3_f32(_598, _603), 0.0, 1.0);
    precise float _607 = spvNClamp(dp3_f32(cb2._m0, _603), 0.0, 1.0);
    precise float _608 = _607 * _607;
    precise float _612 = dp2_f32(vec2(_608), vec2(_360)) - 0.5;
    precise float _613 = 1.0 - _602;
    precise float _614 = _613 * _613;
    precise float _615 = _614 * _614;
    precise float _616 = _613 * _615;
    precise float _618 = abs(dp3_f32(_598, vec3(_179, _180, _181)));
    precise float _619 = 1.0 - _618;
    precise float _620 = _619 * _619;
    precise float _621 = _620 * _620;
    precise float _622 = _619 * _621;
    precise float _624 = fma(_612, _622, 1.0) * fma(_612, _616, 1.0);
    precise float _625 = _360 * _360;
    precise float _626 = spvNMax(_625, 0.00200000009499490261077880859375);
    precise float _627 = 1.0 - _626;
    precise float _630 = _618 * fma(_602, _627, _626);
    precise float _632 = fma(_602, fma(_618, _627, _626), _630) + 9.9999997473787516355514526367188e-06;
    precise float _633 = 0.5 / _632;
    precise float _634 = _626 * _626;
    precise float _637 = fma(fma(_605, _634, -_605), _605, 1.0);
    precise float _638 = _634 * 0.3183098733425140380859375;
    precise float _640 = _638 / fma(_637, _637, 1.0000000116860974230803549289703e-07);
    precise float _641 = _633 * _640;
    precise float _642 = _641 * 3.1415927410125732421875;
    precise float _643 = _602 * _624;
    precise float _644 = _602 * _642;
    precise float _647 = 1.0 / fma(_626, _626, 1.0);
    vec3 _648 = vec3(_575, _576, _577);
    precise float _652 = spvNMax(_644, 0.0) * ((dp3_f32(_648, _648) == 0.0) ? 0.0 : 1.0);
    precise float _653 = cb0._m5.x - _579;
    precise float _654 = _653 + 1.0;
    precise float _655 = spvNClamp(_654, 0.0, 1.0);
    precise float _656 = _643 * _383;
    precise float _657 = _643 * _384;
    precise float _658 = _643 * _385;
    precise float _659 = _383 * _652;
    precise float _660 = _384 * _652;
    precise float _661 = _385 * _652;
    precise float _662 = 1.0 - _607;
    precise float _663 = _662 * _662;
    precise float _664 = _663 * _663;
    precise float _665 = _662 * _664;
    precise float _666 = 1.0 - _575;
    precise float _667 = 1.0 - _576;
    precise float _668 = 1.0 - _577;
    precise float _672 = fma(_666, _665, _575) * _659;
    precise float _673 = fma(_667, _665, _576) * _660;
    precise float _674 = fma(_668, _665, _577) * _661;
    precise float _678 = _564 * _647;
    precise float _679 = _563 * _647;
    precise float _680 = _562 * _647;
    precise float _681 = _655 - _575;
    precise float _682 = _655 - _576;
    precise float _683 = _655 - _577;
    SV_Target.x = fma(_678, fma(_622, _681, _575), fma(_580, _656, _672));
    SV_Target.y = fma(_679, fma(_622, _682, _576), fma(_581, _657, _673));
    SV_Target.z = fma(_680, fma(_622, _683, _577), fma(_582, _658, _674));
    SV_Target.w = 1.0;
}

