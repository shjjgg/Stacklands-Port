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
    precise float _144 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _144));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _133 = a.x * b.x;
    return fma(a.y, b.y, _133);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _115 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _115)));
}

void main()
{
    precise float _168 = cb1._m4.x - TEXCOORD2.x;
    precise float _169 = cb1._m4.y - TEXCOORD2.y;
    precise float _170 = cb1._m4.z - TEXCOORD2.z;
    vec3 _171 = vec3(_168, _169, _170);
    precise float _173 = inversesqrt(dp3_f32(_171, _171));
    precise float _174 = _173 * _168;
    precise float _175 = _173 * _169;
    precise float _176 = _173 * _170;
    precise float _181 = TEXCOORD.y * 150.0;
    precise float _182 = TEXCOORD.x * 20.0;
    precise float _183 = TEXCOORD.y * 1.0;
    precise float _186 = sin(roundEven(_181)) * 43758.546875;
    precise float _188 = fma(fract(_186), 0.004999999888241291046142578125, TEXCOORD.x);
    precise float _189 = _188 * 150.0;
    precise float _192 = sin(roundEven(_189)) * 43758.546875;
    precise float _194 = fma(fract(_192), 0.004999999888241291046142578125, TEXCOORD.y);
    precise float _203 = abs(dFdx(_188)) + abs(dFdy(_188));
    precise float _204 = abs(dFdx(_194)) + abs(dFdy(_194));
    precise float _205 = 0.5 - TEXCOORD.x;
    precise float _206 = 0.550000011920928955078125 - TEXCOORD.y;
    vec4 _212 = texture(sampler2D(t0, s2), vec2(_182, _183));
    float _213 = _212.x;
    float _214 = _212.y;
    float _215 = _212.z;
    precise float _222 = _213 * cb0._m6.x;
    precise float _223 = _214 * cb0._m6.y;
    precise float _224 = _215 * cb0._m6.z;
    precise float _225 = TEXCOORD2.x - cb1._m4.x;
    precise float _226 = TEXCOORD2.y - cb1._m4.y;
    precise float _227 = TEXCOORD2.z - cb1._m4.z;
    vec3 _228 = vec3(_225, _226, _227);
    precise float _230 = inversesqrt(dp3_f32(_228, _228));
    precise float _231 = _230 * _225;
    precise float _232 = _230 * _227;
    precise float _233 = TEXCOORD.y + TEXCOORD.x;
    precise float _234 = TEXCOORD.y + TEXCOORD.y;
    precise float _238 = fma(-_232, 5.0, _234);
    precise float _239 = _238 * 10.0;
    precise float _241 = fma(sin(_239), 0.0199999995529651641845703125, fma(-_231, 5.0, _233));
    precise float _242 = _241 * 30.0;
    vec4 _249 = texture(sampler2D(t1, s3), vec2(_241, fma(cos(_242), 0.0199999995529651641845703125, _238)));
    vec2 _255 = vec2(fma(_205, 1.75, 0.0), fma(_206, 1.75, -0.050000011920928955078125));
    precise float _258 = sqrt(dp2_f32(_255, _255)) - 0.400390625;
    precise float _259 = _258 / _203;
    precise float _261 = 1.0 - spvNClamp(_259, 0.0, 1.0);
    precise float _276 = _188 - 0.1167768537998199462890625;
    precise float _277 = _276 / _203;
    precise float _279 = 0.88322317600250244140625 - _188;
    precise float _280 = _279 / _203;
    precise float _282 = spvNClamp(_280, 0.0, 1.0) * spvNClamp(_277, 0.0, 1.0);
    precise float _283 = _194 - 0.02999999932944774627685546875;
    precise float _284 = _283 / _204;
    precise float _286 = _282 * spvNClamp(_284, 0.0, 1.0);
    precise float _287 = 0.9700000286102294921875 - _194;
    precise float _288 = _287 / _204;
    precise float _290 = _286 * spvNClamp(_288, 0.0, 1.0);
    precise float _291 = fma(_249.x, 0.5, fma(_261, fma(-cb0._m6.x, _213, cb0._m8.x), _222));
    precise float _292 = fma(_249.y, 0.5, fma(_261, fma(-cb0._m6.y, _214, cb0._m8.y), _223));
    precise float _293 = fma(_249.z, 0.5, fma(_261, fma(-cb0._m6.z, _215, cb0._m8.z), _224));
    precise float _294 = _290 * _291;
    precise float _295 = _290 * _292;
    precise float _296 = _290 * _293;
    float _374;
    float _375;
    float _376;
    float _377;
    if (cb4._m0.x == 1.0)
    {
        bool _307 = cb4._m0.y == 1.0;
        precise float _313 = TEXCOORD2.y * cb4._m3.x;
        precise float _314 = TEXCOORD2.y * cb4._m3.y;
        precise float _315 = TEXCOORD2.y * cb4._m3.z;
        precise float _337 = fma(cb4._m5.x, TEXCOORD2.z, fma(cb4._m1.x, TEXCOORD2.x, _313)) + cb4._m7.x;
        precise float _338 = fma(cb4._m5.y, TEXCOORD2.z, fma(cb4._m1.y, TEXCOORD2.x, _314)) + cb4._m7.y;
        precise float _339 = fma(cb4._m5.z, TEXCOORD2.z, fma(cb4._m1.z, TEXCOORD2.x, _315)) + cb4._m7.z;
        precise float _348 = (_307 ? _337 : TEXCOORD2.x) - cb4._m11.x;
        precise float _349 = (_307 ? _338 : TEXCOORD2.y) - cb4._m11.y;
        precise float _350 = (_307 ? _339 : TEXCOORD2.z) - cb4._m11.z;
        precise float _356 = _348 * cb4._m9.x;
        precise float _357 = _349 * cb4._m9.y;
        precise float _358 = _350 * cb4._m9.z;
        vec4 _369 = texture(sampler3D(t4, s1), vec3(spvNMax(fma(_356, 0.25, 0.75), fma(cb4._m0.z, 0.5, 0.75)), _357, _358));
        _374 = _369.w;
        _375 = _369.z;
        _376 = _369.y;
        _377 = _369.x;
    }
    else
    {
        _374 = 1.0;
        _375 = 1.0;
        _376 = 1.0;
        _377 = 1.0;
    }
    precise float _384 = spvNClamp(dp4_f32(vec4(_377, _376, _375, _374), cb2._m47), 0.0, 1.0);
    precise float _387 = 1.0 - cb0._m5.x;
    precise float _388 = -_174;
    precise float _389 = -_175;
    precise float _390 = -_176;
    vec3 _398 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    float _399 = dp3_f32(vec3(_388, _389, _390), _398);
    precise float _400 = _399 + _399;
    precise float _401 = -_400;
    precise float _402 = fma(TEXCOORD1.x, _401, _388);
    precise float _403 = fma(TEXCOORD1.y, _401, _389);
    precise float _404 = fma(TEXCOORD1.z, _401, _390);
    precise float _410 = _384 * cb0._m2.x;
    precise float _411 = _384 * cb0._m2.y;
    precise float _412 = _384 * cb0._m2.z;
    vec3 _417 = vec3(_402, _403, _404);
    float _466;
    float _467;
    float _468;
    if (cb3._m5 > 0.0)
    {
        precise float _421 = inversesqrt(dp3_f32(_417, _417));
        precise float _422 = _421 * _402;
        precise float _423 = _421 * _403;
        precise float _424 = _421 * _404;
        precise float _430 = cb3._m0.x - TEXCOORD2.x;
        precise float _431 = cb3._m0.y - TEXCOORD2.y;
        precise float _432 = cb3._m0.z - TEXCOORD2.z;
        precise float _433 = _430 / _422;
        precise float _434 = _431 / _423;
        precise float _435 = _432 / _424;
        precise float _441 = cb3._m2.x - TEXCOORD2.x;
        precise float _442 = cb3._m2.y - TEXCOORD2.y;
        precise float _443 = cb3._m2.z - TEXCOORD2.z;
        precise float _444 = _441 / _422;
        precise float _445 = _442 / _423;
        precise float _446 = _443 / _424;
        precise float _454 = spvNMin((_424 > 0.0) ? _435 : _446, spvNMin((_423 > 0.0) ? _434 : _445, (_422 > 0.0) ? _433 : _444));
        precise float _460 = TEXCOORD2.x - cb3._m4.x;
        precise float _461 = TEXCOORD2.y - cb3._m4.y;
        precise float _462 = TEXCOORD2.z - cb3._m4.z;
        _466 = fma(_424, _454, _462);
        _467 = fma(_423, _454, _461);
        _468 = fma(_422, _454, _460);
    }
    else
    {
        _466 = _404;
        _467 = _403;
        _468 = _402;
    }
    precise float _471 = fma(-_387, 0.699999988079071044921875, 1.7000000476837158203125) * _387;
    precise float _472 = _471 * 6.0;
    vec4 _478 = textureLod(samplerCube(t2, s0), vec3(_468, _467, _466), _472);
    float _479 = _478.x;
    float _480 = _478.y;
    float _481 = _478.z;
    precise float _483 = _478.w - 1.0;
    precise float _490 = log2(fma(cb3._m6.w, _483, 1.0)) * cb3._m6.y;
    precise float _494 = exp2(_490) * cb3._m6.x;
    precise float _495 = _479 * _494;
    precise float _496 = _480 * _494;
    precise float _497 = _481 * _494;
    float _589;
    float _590;
    float _591;
    if (cb3._m3 < 0.999989986419677734375)
    {
        float _554;
        float _555;
        float _556;
        if (cb3._m12 > 0.0)
        {
            precise float _509 = inversesqrt(dp3_f32(_417, _417));
            precise float _510 = _402 * _509;
            precise float _511 = _403 * _509;
            precise float _512 = _404 * _509;
            precise float _518 = cb3._m7.x - TEXCOORD2.x;
            precise float _519 = cb3._m7.y - TEXCOORD2.y;
            precise float _520 = cb3._m7.z - TEXCOORD2.z;
            precise float _521 = _518 / _510;
            precise float _522 = _519 / _511;
            precise float _523 = _520 / _512;
            precise float _529 = cb3._m9.x - TEXCOORD2.x;
            precise float _530 = cb3._m9.y - TEXCOORD2.y;
            precise float _531 = cb3._m9.z - TEXCOORD2.z;
            precise float _532 = _529 / _510;
            precise float _533 = _530 / _511;
            precise float _534 = _531 / _512;
            precise float _542 = spvNMin((_512 > 0.0) ? _523 : _534, spvNMin((_511 > 0.0) ? _522 : _533, (_510 > 0.0) ? _521 : _532));
            precise float _548 = TEXCOORD2.x - cb3._m11.x;
            precise float _549 = TEXCOORD2.y - cb3._m11.y;
            precise float _550 = TEXCOORD2.z - cb3._m11.z;
            _554 = fma(_512, _542, _550);
            _555 = fma(_511, _542, _549);
            _556 = fma(_510, _542, _548);
        }
        else
        {
            _554 = _404;
            _555 = _403;
            _556 = _402;
        }
        vec4 _560 = textureLod(samplerCube(t3, s0), vec3(_556, _555, _554), _472);
        precise float _565 = _560.w - 1.0;
        precise float _572 = log2(fma(cb3._m13.w, _565, 1.0)) * cb3._m13.y;
        precise float _576 = exp2(_572) * cb3._m13.x;
        precise float _577 = _560.x * _576;
        precise float _578 = _560.y * _576;
        precise float _579 = _560.z * _576;
        _589 = fma(cb3._m3, fma(_494, _481, -_579), _579);
        _590 = fma(cb3._m3, fma(_494, _480, -_578), _578);
        _591 = fma(cb3._m3, fma(_494, _479, -_577), _577);
    }
    else
    {
        _589 = _497;
        _590 = _496;
        _591 = _495;
    }
    precise float _593 = inversesqrt(dp3_f32(_398, _398));
    precise float _594 = _593 * TEXCOORD1.x;
    precise float _595 = _593 * TEXCOORD1.y;
    precise float _596 = _593 * TEXCOORD1.z;
    precise float _602 = fma(cb0._m5.y, fma(_290, _291, -0.039999999105930328369140625), 0.039999999105930328369140625);
    precise float _603 = fma(cb0._m5.y, fma(_290, _292, -0.039999999105930328369140625), 0.039999999105930328369140625);
    precise float _604 = fma(cb0._m5.y, fma(_290, _293, -0.039999999105930328369140625), 0.039999999105930328369140625);
    precise float _606 = fma(-cb0._m5.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _607 = _606 * _294;
    precise float _608 = _606 * _295;
    precise float _609 = _606 * _296;
    precise float _615 = fma(_168, _173, cb2._m0.x);
    precise float _616 = fma(_169, _173, cb2._m0.y);
    precise float _617 = fma(_170, _173, cb2._m0.z);
    vec3 _618 = vec3(_615, _616, _617);
    precise float _621 = inversesqrt(spvNMax(dp3_f32(_618, _618), 0.001000000047497451305389404296875));
    precise float _622 = _621 * _615;
    precise float _623 = _621 * _616;
    precise float _624 = _621 * _617;
    vec3 _625 = vec3(_594, _595, _596);
    precise float _629 = spvNClamp(dp3_f32(_625, cb2._m0), 0.0, 1.0);
    vec3 _630 = vec3(_622, _623, _624);
    precise float _632 = spvNClamp(dp3_f32(_625, _630), 0.0, 1.0);
    precise float _634 = spvNClamp(dp3_f32(cb2._m0, _630), 0.0, 1.0);
    precise float _635 = _634 * _634;
    precise float _639 = dp2_f32(vec2(_635), vec2(_387)) - 0.5;
    precise float _640 = 1.0 - _629;
    precise float _641 = _640 * _640;
    precise float _642 = _641 * _641;
    precise float _643 = _640 * _642;
    precise float _645 = abs(dp3_f32(_625, vec3(_174, _175, _176)));
    precise float _646 = 1.0 - _645;
    precise float _647 = _646 * _646;
    precise float _648 = _647 * _647;
    precise float _649 = _646 * _648;
    precise float _651 = fma(_639, _649, 1.0) * fma(_639, _643, 1.0);
    precise float _652 = _387 * _387;
    precise float _653 = spvNMax(_652, 0.00200000009499490261077880859375);
    precise float _654 = 1.0 - _653;
    precise float _657 = _645 * fma(_629, _654, _653);
    precise float _659 = fma(_629, fma(_645, _654, _653), _657) + 9.9999997473787516355514526367188e-06;
    precise float _660 = 0.5 / _659;
    precise float _661 = _653 * _653;
    precise float _664 = fma(fma(_632, _661, -_632), _632, 1.0);
    precise float _665 = _661 * 0.3183098733425140380859375;
    precise float _667 = _665 / fma(_664, _664, 1.0000000116860974230803549289703e-07);
    precise float _668 = _660 * _667;
    precise float _669 = _668 * 3.1415927410125732421875;
    precise float _670 = _629 * _651;
    precise float _671 = _629 * _669;
    precise float _674 = 1.0 / fma(_653, _653, 1.0);
    vec3 _675 = vec3(_602, _603, _604);
    precise float _679 = spvNMax(_671, 0.0) * ((dp3_f32(_675, _675) == 0.0) ? 0.0 : 1.0);
    precise float _680 = cb0._m5.x - _606;
    precise float _681 = _680 + 1.0;
    precise float _682 = spvNClamp(_681, 0.0, 1.0);
    precise float _683 = _670 * _410;
    precise float _684 = _670 * _411;
    precise float _685 = _670 * _412;
    precise float _686 = _410 * _679;
    precise float _687 = _411 * _679;
    precise float _688 = _412 * _679;
    precise float _689 = 1.0 - _634;
    precise float _690 = _689 * _689;
    precise float _691 = _690 * _690;
    precise float _692 = _689 * _691;
    precise float _693 = 1.0 - _602;
    precise float _694 = 1.0 - _603;
    precise float _695 = 1.0 - _604;
    precise float _699 = fma(_693, _692, _602) * _686;
    precise float _700 = fma(_694, _692, _603) * _687;
    precise float _701 = fma(_695, _692, _604) * _688;
    precise float _705 = _591 * _674;
    precise float _706 = _590 * _674;
    precise float _707 = _589 * _674;
    precise float _708 = _682 - _602;
    precise float _709 = _682 - _603;
    precise float _710 = _682 - _604;
    SV_Target.x = fma(_705, fma(_649, _708, _602), fma(_607, _683, _699));
    SV_Target.y = fma(_706, fma(_649, _709, _603), fma(_608, _684, _700));
    SV_Target.z = fma(_707, fma(_649, _710, _604), fma(_609, _685, _701));
    SV_Target.w = 1.0;
}

