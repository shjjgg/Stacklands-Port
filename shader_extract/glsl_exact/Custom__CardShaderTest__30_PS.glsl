#version 450
#extension GL_EXT_buffer_reference2 : require
#extension GL_EXT_spirv_intrinsics : require
#extension GL_EXT_demote_to_helper_invocation : require

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
    uvec4 _m12;
    vec3 _m13;
    uint _m14;
    vec2 _m15;
    uvec2 _m16;
    uvec4 _m17;
    vec2 _m18;
    vec2 _m19;
} cb0;

layout(set = 0, binding = 1, std140) uniform cb1_buf
{
    vec4 _m0;
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
} cb3;

layout(set = 0, binding = 4) uniform sampler s0;
layout(set = 0, binding = 5) uniform sampler s1;
layout(set = 0, binding = 6) uniform sampler s2;
layout(set = 0, binding = 7) uniform sampler s3;
layout(set = 0, binding = 8) uniform sampler s4;
layout(set = 0, binding = 9) uniform texture2D t0;
layout(set = 0, binding = 10) uniform texture2D t1;
layout(set = 0, binding = 11) uniform texture2D t2;
layout(set = 0, binding = 12) uniform texture2D t3;
layout(set = 0, binding = 13) uniform texture3D t4;

layout(location = 1, component = 0) in vec2 TEXCOORD;
layout(location = 2, component = 0) in vec3 TEXCOORD1;
layout(location = 3, component = 0) in vec3 TEXCOORD2;
layout(location = 0, component = 0) out vec4 SV_Target;

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
    precise float _147 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _147));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _136 = a.x * b.x;
    return fma(a.y, b.y, _136);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _118 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _118)));
}

void main()
{
    precise float _171 = cb1._m4.x - TEXCOORD2.x;
    precise float _172 = cb1._m4.y - TEXCOORD2.y;
    precise float _173 = cb1._m4.z - TEXCOORD2.z;
    vec3 _174 = vec3(_171, _172, _173);
    precise float _176 = inversesqrt(dp3_f32(_174, _174));
    precise float _177 = _176 * _171;
    precise float _178 = _176 * _172;
    precise float _179 = _176 * _173;
    precise float _182 = TEXCOORD.y * 150.0;
    precise float _185 = sin(roundEven(_182)) * 43758.546875;
    precise float _189 = fma(fract(_185), 0.004999999888241291046142578125, TEXCOORD.x);
    precise float _190 = _189 * 150.0;
    precise float _191 = _189 * 10.0;
    precise float _194 = sin(roundEven(_190)) * 43758.546875;
    precise float _196 = fma(fract(_194), 0.004999999888241291046142578125, TEXCOORD.y);
    precise float _205 = abs(dFdy(_189)) + abs(dFdx(_189));
    precise float _206 = abs(dFdy(_196)) + abs(dFdx(_196));
    precise float _207 = 1.0 - TEXCOORD.x;
    precise float _208 = 1.0 - TEXCOORD.y;
    bool _215 = cb0._m19.x > 0.5;
    bool _217 = cb0._m19.y > 0.5;
    float _220 = _217 ? (_215 ? 0.550000011920928955078125 : 0.5) : (_215 ? 0.5 : 0.449999988079071044921875);
    float _222 = (_215 || _217) ? 2.0 : 1.75;
    precise float _223 = _207 - 0.5;
    precise float _224 = _208 - _220;
    precise float _225 = _222 * _223;
    precise float _226 = fma(_223, _222, 0.5);
    precise float _227 = fma(_224, _222, _220);
    precise float _236 = float(_226 >= 0.0) * float(_226 <= 1.0);
    precise float _237 = float(_227 >= 0.0) * _236;
    vec2 _240 = vec2(_226, _227);
    vec4 _243 = texture(sampler2D(t0, s1), _240);
    float _244 = _243.x;
    float _245 = _243.w;
    vec4 _249 = texture(sampler2D(t1, s3), _240);
    float _250 = _249.x;
    float _251 = _249.w;
    precise float _253 = fma(-_237, float(_227 <= 1.0), 1.0);
    precise float _257 = fma(_253, -_245, _245);
    precise float _261 = fma(_253, -_251, _251);
    precise float _262 = TEXCOORD2.x - cb1._m4.x;
    precise float _263 = TEXCOORD2.y - cb1._m4.y;
    precise float _264 = TEXCOORD2.z - cb1._m4.z;
    vec3 _265 = vec3(_262, _263, _264);
    precise float _267 = inversesqrt(dp3_f32(_265, _265));
    precise float _268 = _267 * _262;
    precise float _269 = _267 * _264;
    precise float _270 = TEXCOORD.y + TEXCOORD.x;
    precise float _271 = TEXCOORD.y + TEXCOORD.y;
    precise float _275 = fma(-_269, 5.0, _271);
    precise float _276 = _275 * 10.0;
    precise float _278 = fma(sin(_276), 0.0199999995529651641845703125, fma(-_268, 5.0, _270));
    precise float _279 = _278 * 30.0;
    vec4 _286 = texture(sampler2D(t2, s2), vec2(_278, fma(cos(_279), 0.0199999995529651641845703125, _275)));
    precise float _294 = fma(cb1._m0.z, 2.0, _270) * 0.0199999995529651641845703125;
    float _297 = float(fract(_294) >= 0.9900000095367431640625);
    bool _302 = cb0._m15.x > 0.5;
    bool _303 = cb0._m15.y > 0.5;
    float _314 = _302 ? fma(_297, cb0._m18.y, cb0._m6.x) : cb0._m6.x;
    float _315 = _302 ? fma(_297, cb0._m18.y, cb0._m6.y) : cb0._m6.y;
    float _316 = _302 ? fma(_297, cb0._m18.y, cb0._m6.z) : cb0._m6.z;
    precise float _317 = _225 + 0.0;
    precise float _318 = _227 - 0.5;
    vec2 _319 = vec2(_317, _318);
    precise float _326 = (_215 ? spvNMax(abs(_318), abs(_317)) : sqrt(dp2_f32(_319, _319))) - 0.400390625;
    precise float _327 = _326 / _205;
    precise float _329 = 1.0 - spvNClamp(_327, 0.0, 1.0);
    precise float _335 = cb0._m8.x - _314;
    precise float _336 = cb0._m8.y - _315;
    precise float _337 = cb0._m8.z - _316;
    precise float _338 = fma(_329, _335, _314);
    precise float _339 = fma(_329, _336, _315);
    precise float _340 = fma(_329, _337, _316);
    float _342 = (_196 >= 0.20000000298023223876953125) ? 0.0 : 1.0;
    precise float _343 = cb0._m8.x - _338;
    precise float _344 = cb0._m8.y - _339;
    precise float _345 = cb0._m8.z - _340;
    precise float _346 = fma(_342, _343, _338);
    precise float _347 = fma(_342, _344, _339);
    precise float _348 = fma(_342, _345, _340);
    precise float _349 = 1.0 - fma(_253, -_244, _244);
    precise float _355 = cb0._m13.x - cb0._m6.x;
    precise float _356 = cb0._m13.y - cb0._m6.y;
    precise float _357 = cb0._m13.z - cb0._m6.z;
    precise float _361 = fma(_349, _355, cb0._m6.x) - _346;
    precise float _362 = fma(_349, _356, cb0._m6.y) - _347;
    precise float _363 = fma(_349, _357, cb0._m6.z) - _348;
    precise float _364 = fma(_257, _361, _346);
    precise float _365 = fma(_257, _362, _347);
    precise float _366 = fma(_257, _363, _348);
    bool _369 = (cb0._m19.y == 0.0) && (cb0._m19.x == 0.0);
    precise float _370 = 1.0 - fma(_253, -_250, _250);
    precise float _374 = fma(_370, _355, cb0._m6.x) - _364;
    precise float _375 = fma(_370, _356, cb0._m6.y) - _365;
    precise float _376 = fma(_370, _357, cb0._m6.z) - _366;
    float _380 = _369 ? _364 : fma(_261, _374, _364);
    float _381 = _369 ? _365 : fma(_261, _375, _365);
    float _382 = _369 ? _366 : fma(_261, _376, _366);
    precise float _383 = -_206;
    precise float _384 = fma(_383, 0.5, 0.189999997615814208984375);
    precise float _385 = fma(_383, 0.5, 0.2100000083446502685546875);
    precise float _388 = _196 - _384;
    precise float _389 = _196 - _385;
    precise float _392 = fma(_206, 0.5, -_384) + 0.189999997615814208984375;
    precise float _393 = fma(_206, 0.5, -_385) + 0.2100000083446502685546875;
    precise float _394 = _388 / _392;
    precise float _395 = _389 / _393;
    precise float _398 = 1.0 - spvNClamp(_395, 0.0, 1.0);
    precise float _401 = _189 - 0.1167768537998199462890625;
    precise float _402 = _196 - 0.02999999932944774627685546875;
    precise float _403 = _401 / _205;
    precise float _404 = _402 / _206;
    precise float _407 = 0.88322317600250244140625 - _189;
    precise float _408 = 0.9700000286102294921875 - _196;
    precise float _409 = _407 / _205;
    precise float _410 = _408 / _206;
    precise float _413 = spvNClamp(_403, 0.0, 1.0) * spvNClamp(_409, 0.0, 1.0);
    precise float _414 = spvNClamp(_404, 0.0, 1.0) * _413;
    precise float _415 = spvNClamp(_410, 0.0, 1.0) * _414;
    precise float _416 = fma(-spvNClamp(_394, 0.0, 1.0), _398, 1.0) * _415;
    precise float _417 = _196 * 10.0;
    precise float _421 = abs(fma(fract(_417), 2.0, -1.0)) - 0.5;
    precise float _423 = sin(_417) * _421;
    precise float _427 = abs(fma(fract(_191), 2.0, -1.0)) - 0.5;
    precise float _429 = sin(_191) * _427;
    precise float _430 = fma(_423, 0.0199999995529651641845703125, _189);
    precise float _431 = fma(_429, 0.0199999995529651641845703125, _196);
    precise float _432 = _430 - 0.089776851236820220947265625;
    precise float _433 = _431 - 0.0030000000260770320892333984375;
    precise float _434 = _432 / _205;
    precise float _435 = _433 / _206;
    precise float _438 = 0.91022312641143798828125 - _430;
    precise float _439 = 0.9969999790191650390625 - _431;
    precise float _440 = _438 / _205;
    precise float _441 = _439 / _206;
    precise float _444 = spvNClamp(_434, 0.0, 1.0) * spvNClamp(_440, 0.0, 1.0);
    precise float _445 = spvNClamp(_435, 0.0, 1.0) * _444;
    if ((fma(_445, spvNClamp(_441, 0.0, 1.0), -0.100000001490116119384765625) < 0.0) && _303)
    {
        demote;
    }
    precise float _464 = (_302 ? fma(_286.x, cb0._m18.x, _380) : _380) - cb0._m10.x;
    precise float _465 = (_302 ? fma(_286.y, cb0._m18.x, _381) : _381) - cb0._m10.y;
    precise float _466 = (_302 ? fma(_286.z, cb0._m18.x, _382) : _382) - cb0._m10.z;
    precise float _467 = fma(_416, _464, cb0._m10.x);
    precise float _468 = fma(_416, _465, cb0._m10.y);
    precise float _469 = fma(_416, _466, cb0._m10.z);
    float _491;
    float _492;
    float _493;
    if (cb0._m15.y != 0.0)
    {
        float _484 = float(texture(sampler2D(t3, s4), vec2(_303 ? _430 : _189, _303 ? _431 : _196)).w >= 0.5);
        precise float _485 = _467 * (-0.39999997615814208984375);
        precise float _486 = _468 * (-0.39999997615814208984375);
        precise float _487 = _469 * (-0.39999997615814208984375);
        _491 = fma(_484, _485, _467);
        _492 = fma(_484, _486, _468);
        _493 = fma(_484, _487, _469);
    }
    else
    {
        _491 = _467;
        _492 = _468;
        _493 = _469;
    }
    float _569;
    float _570;
    float _571;
    float _572;
    if (cb3._m0.x == 1.0)
    {
        bool _502 = cb3._m0.y == 1.0;
        precise float _508 = TEXCOORD2.y * cb3._m3.x;
        precise float _509 = TEXCOORD2.y * cb3._m3.y;
        precise float _510 = TEXCOORD2.y * cb3._m3.z;
        precise float _532 = fma(cb3._m5.x, TEXCOORD2.z, fma(cb3._m1.x, TEXCOORD2.x, _508)) + cb3._m7.x;
        precise float _533 = fma(cb3._m5.y, TEXCOORD2.z, fma(cb3._m1.y, TEXCOORD2.x, _509)) + cb3._m7.y;
        precise float _534 = fma(cb3._m5.z, TEXCOORD2.z, fma(cb3._m1.z, TEXCOORD2.x, _510)) + cb3._m7.z;
        precise float _543 = (_502 ? _532 : TEXCOORD2.x) - cb3._m11.x;
        precise float _544 = (_502 ? _533 : TEXCOORD2.y) - cb3._m11.y;
        precise float _545 = (_502 ? _534 : TEXCOORD2.z) - cb3._m11.z;
        precise float _551 = _543 * cb3._m9.x;
        precise float _552 = _544 * cb3._m9.y;
        precise float _553 = _545 * cb3._m9.z;
        vec4 _564 = texture(sampler3D(t4, s0), vec3(spvNMax(fma(_551, 0.25, 0.75), fma(cb3._m0.z, 0.5, 0.75)), _552, _553));
        _569 = _564.w;
        _570 = _564.z;
        _571 = _564.y;
        _572 = _564.x;
    }
    else
    {
        _569 = 1.0;
        _570 = 1.0;
        _571 = 1.0;
        _572 = 1.0;
    }
    precise float _579 = spvNClamp(dp4_f32(vec4(_572, _571, _570, _569), cb2._m47), 0.0, 1.0);
    precise float _585 = _579 * cb0._m2.x;
    precise float _586 = _579 * cb0._m2.y;
    precise float _587 = _579 * cb0._m2.z;
    vec3 _594 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    precise float _596 = inversesqrt(dp3_f32(_594, _594));
    precise float _597 = _596 * TEXCOORD1.x;
    precise float _598 = _596 * TEXCOORD1.y;
    precise float _599 = _596 * TEXCOORD1.z;
    precise float _600 = _491 - 0.039999999105930328369140625;
    precise float _601 = _492 - 0.039999999105930328369140625;
    precise float _602 = _493 - 0.039999999105930328369140625;
    precise float _605 = fma(cb0._m5.y, _600, 0.039999999105930328369140625);
    precise float _606 = fma(cb0._m5.y, _601, 0.039999999105930328369140625);
    precise float _607 = fma(cb0._m5.y, _602, 0.039999999105930328369140625);
    precise float _609 = fma(-cb0._m5.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _610 = _609 * _491;
    precise float _611 = _609 * _492;
    precise float _612 = _609 * _493;
    precise float _615 = 1.0 - cb0._m5.x;
    precise float _621 = fma(_171, _176, cb2._m0.x);
    precise float _622 = fma(_172, _176, cb2._m0.y);
    precise float _623 = fma(_173, _176, cb2._m0.z);
    vec3 _624 = vec3(_621, _622, _623);
    precise float _627 = inversesqrt(spvNMax(dp3_f32(_624, _624), 0.001000000047497451305389404296875));
    precise float _628 = _627 * _621;
    precise float _629 = _627 * _622;
    precise float _630 = _627 * _623;
    vec3 _631 = vec3(_597, _598, _599);
    precise float _635 = spvNClamp(dp3_f32(_631, cb2._m0), 0.0, 1.0);
    vec3 _636 = vec3(_628, _629, _630);
    precise float _638 = spvNClamp(dp3_f32(_631, _636), 0.0, 1.0);
    precise float _640 = spvNClamp(dp3_f32(cb2._m0, _636), 0.0, 1.0);
    precise float _641 = _640 + _640;
    precise float _642 = _640 * _641;
    precise float _643 = fma(_642, _615, -0.5);
    precise float _644 = 1.0 - _635;
    precise float _645 = _644 * _644;
    precise float _646 = _645 * _645;
    precise float _647 = _644 * _646;
    precise float _649 = abs(dp3_f32(_631, vec3(_177, _178, _179)));
    precise float _650 = 1.0 - _649;
    precise float _651 = _650 * _650;
    precise float _652 = _651 * _651;
    precise float _653 = _650 * _652;
    precise float _655 = fma(_643, _653, 1.0) * fma(_643, _647, 1.0);
    precise float _656 = _615 * _615;
    precise float _657 = spvNMax(_656, 0.00200000009499490261077880859375);
    precise float _658 = 1.0 - _657;
    precise float _661 = _649 * fma(_635, _658, _657);
    precise float _663 = fma(_635, fma(_649, _658, _657), _661) + 9.9999997473787516355514526367188e-06;
    precise float _664 = 0.5 / _663;
    precise float _665 = _657 * _657;
    precise float _668 = fma(fma(_638, _665, -_638), _638, 1.0);
    precise float _669 = _665 * 0.3183098733425140380859375;
    precise float _671 = _669 / fma(_668, _668, 1.0000000116860974230803549289703e-07);
    precise float _672 = _671 * _664;
    precise float _673 = _672 * 3.1415927410125732421875;
    precise float _674 = _635 * _655;
    precise float _675 = _635 * _673;
    vec3 _677 = vec3(_605, _606, _607);
    precise float _681 = ((dp3_f32(_677, _677) == 0.0) ? 0.0 : 1.0) * spvNMax(_675, 0.0);
    precise float _682 = _674 * _585;
    precise float _683 = _674 * _586;
    precise float _684 = _674 * _587;
    precise float _685 = _585 * _681;
    precise float _686 = _586 * _681;
    precise float _687 = _587 * _681;
    precise float _688 = 1.0 - _640;
    precise float _689 = _688 * _688;
    precise float _690 = _689 * _689;
    precise float _691 = _688 * _690;
    precise float _692 = 1.0 - _605;
    precise float _693 = 1.0 - _606;
    precise float _694 = 1.0 - _607;
    precise float _698 = _685 * fma(_692, _691, _605);
    precise float _699 = _686 * fma(_693, _691, _606);
    precise float _700 = _687 * fma(_694, _691, _607);
    SV_Target.x = fma(_610, _682, _698);
    SV_Target.y = fma(_611, _683, _699);
    SV_Target.z = fma(_612, _684, _700);
    SV_Target.w = 1.0;
}

