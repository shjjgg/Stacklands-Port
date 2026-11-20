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
    vec2 _m5;
    uvec2 _m6;
    vec2 _m7;
    uvec2 _m8;
    vec2 _m9;
    uvec2 _m10;
    vec2 _m11;
    uvec2 _m12;
    vec4 _m13;
    vec3 _m14;
    uint _m15;
    vec3 _m16;
    uint _m17;
    vec3 _m18;
    uint _m19;
    uvec4 _m20;
    vec3 _m21;
    uint _m22;
    vec2 _m23;
    uvec2 _m24;
    uvec4 _m25;
    vec2 _m26;
    vec2 _m27;
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
layout(set = 0, binding = 9) uniform sampler s5;
layout(set = 0, binding = 10) uniform texture2D t0;
layout(set = 0, binding = 11) uniform texture2D t1;
layout(set = 0, binding = 12) uniform texture2D t2;
layout(set = 0, binding = 13) uniform texture2D t3;
layout(set = 0, binding = 14) uniform texture2D t4;
layout(set = 0, binding = 15) uniform texture3D t5;

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
    precise float _150 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _150));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _139 = a.x * b.x;
    return fma(a.y, b.y, _139);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _121 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _121)));
}

void main()
{
    precise float _174 = cb1._m4.x - TEXCOORD2.x;
    precise float _175 = cb1._m4.y - TEXCOORD2.y;
    precise float _176 = cb1._m4.z - TEXCOORD2.z;
    vec3 _177 = vec3(_174, _175, _176);
    precise float _179 = inversesqrt(dp3_f32(_177, _177));
    precise float _180 = _179 * _174;
    precise float _181 = _179 * _175;
    precise float _182 = _179 * _176;
    precise float _185 = TEXCOORD.y * 150.0;
    precise float _188 = sin(roundEven(_185)) * 43758.546875;
    precise float _192 = fma(fract(_188), 0.004999999888241291046142578125, TEXCOORD.x);
    precise float _193 = _192 * 150.0;
    precise float _194 = _192 * 10.0;
    precise float _197 = sin(roundEven(_193)) * 43758.546875;
    precise float _199 = fma(fract(_197), 0.004999999888241291046142578125, TEXCOORD.y);
    precise float _208 = abs(dFdy(_192)) + abs(dFdx(_192));
    precise float _209 = abs(dFdy(_199)) + abs(dFdx(_199));
    precise float _210 = 1.0 - TEXCOORD.x;
    precise float _211 = 1.0 - TEXCOORD.y;
    bool _218 = cb0._m27.x > 0.5;
    bool _220 = cb0._m27.y > 0.5;
    float _223 = _220 ? (_218 ? 0.550000011920928955078125 : 0.5) : (_218 ? 0.5 : 0.449999988079071044921875);
    float _225 = (_218 || _220) ? 2.0 : 1.75;
    precise float _226 = _210 - 0.5;
    precise float _227 = _211 - _223;
    precise float _228 = _225 * _226;
    precise float _229 = fma(_226, _225, 0.5);
    precise float _230 = fma(_227, _225, _223);
    precise float _239 = float(_229 >= 0.0) * float(_229 <= 1.0);
    precise float _240 = float(_230 >= 0.0) * _239;
    vec2 _243 = vec2(_229, _230);
    vec4 _246 = texture(sampler2D(t0, s2), _243);
    float _247 = _246.x;
    float _248 = _246.w;
    vec4 _252 = texture(sampler2D(t1, s4), _243);
    float _253 = _252.x;
    float _254 = _252.w;
    precise float _256 = fma(-_240, float(_230 <= 1.0), 1.0);
    precise float _260 = fma(_256, -_248, _248);
    precise float _264 = fma(_256, -_254, _254);
    precise float _265 = TEXCOORD2.x - cb1._m4.x;
    precise float _266 = TEXCOORD2.y - cb1._m4.y;
    precise float _267 = TEXCOORD2.z - cb1._m4.z;
    vec3 _268 = vec3(_265, _266, _267);
    precise float _270 = inversesqrt(dp3_f32(_268, _268));
    precise float _271 = _270 * _265;
    precise float _272 = _270 * _267;
    precise float _273 = TEXCOORD.y + TEXCOORD.x;
    precise float _274 = TEXCOORD.y + TEXCOORD.y;
    precise float _278 = fma(-_272, 5.0, _274);
    precise float _279 = _278 * 10.0;
    precise float _281 = fma(sin(_279), 0.0199999995529651641845703125, fma(-_271, 5.0, _273));
    precise float _282 = _281 * 30.0;
    vec4 _289 = texture(sampler2D(t2, s3), vec2(_281, fma(cos(_282), 0.0199999995529651641845703125, _278)));
    precise float _297 = fma(cb1._m0.z, 2.0, _273) * 0.0199999995529651641845703125;
    float _300 = float(fract(_297) >= 0.9900000095367431640625);
    bool _305 = cb0._m23.x > 0.5;
    bool _306 = cb0._m23.y > 0.5;
    float _317 = _305 ? fma(_300, cb0._m26.y, cb0._m14.x) : cb0._m14.x;
    float _318 = _305 ? fma(_300, cb0._m26.y, cb0._m14.y) : cb0._m14.y;
    float _319 = _305 ? fma(_300, cb0._m26.y, cb0._m14.z) : cb0._m14.z;
    precise float _320 = _228 + 0.0;
    precise float _321 = _230 - 0.5;
    vec2 _322 = vec2(_320, _321);
    precise float _329 = (_218 ? spvNMax(abs(_321), abs(_320)) : sqrt(dp2_f32(_322, _322))) - 0.400390625;
    precise float _330 = _329 / _208;
    precise float _332 = 1.0 - spvNClamp(_330, 0.0, 1.0);
    precise float _338 = cb0._m16.x - _317;
    precise float _339 = cb0._m16.y - _318;
    precise float _340 = cb0._m16.z - _319;
    precise float _341 = fma(_332, _338, _317);
    precise float _342 = fma(_332, _339, _318);
    precise float _343 = fma(_332, _340, _319);
    float _345 = (_199 >= 0.20000000298023223876953125) ? 0.0 : 1.0;
    precise float _346 = cb0._m16.x - _341;
    precise float _347 = cb0._m16.y - _342;
    precise float _348 = cb0._m16.z - _343;
    precise float _349 = fma(_345, _346, _341);
    precise float _350 = fma(_345, _347, _342);
    precise float _351 = fma(_345, _348, _343);
    precise float _352 = 1.0 - fma(_256, -_247, _247);
    precise float _358 = cb0._m21.x - cb0._m14.x;
    precise float _359 = cb0._m21.y - cb0._m14.y;
    precise float _360 = cb0._m21.z - cb0._m14.z;
    precise float _364 = fma(_352, _358, cb0._m14.x) - _349;
    precise float _365 = fma(_352, _359, cb0._m14.y) - _350;
    precise float _366 = fma(_352, _360, cb0._m14.z) - _351;
    precise float _367 = fma(_260, _364, _349);
    precise float _368 = fma(_260, _365, _350);
    precise float _369 = fma(_260, _366, _351);
    bool _372 = (cb0._m27.y == 0.0) && (cb0._m27.x == 0.0);
    precise float _373 = 1.0 - fma(_256, -_253, _253);
    precise float _377 = fma(_373, _358, cb0._m14.x) - _367;
    precise float _378 = fma(_373, _359, cb0._m14.y) - _368;
    precise float _379 = fma(_373, _360, cb0._m14.z) - _369;
    float _383 = _372 ? _367 : fma(_264, _377, _367);
    float _384 = _372 ? _368 : fma(_264, _378, _368);
    float _385 = _372 ? _369 : fma(_264, _379, _369);
    precise float _386 = -_209;
    precise float _387 = fma(_386, 0.5, 0.189999997615814208984375);
    precise float _388 = fma(_386, 0.5, 0.2100000083446502685546875);
    precise float _391 = _199 - _387;
    precise float _392 = _199 - _388;
    precise float _395 = fma(_209, 0.5, -_387) + 0.189999997615814208984375;
    precise float _396 = fma(_209, 0.5, -_388) + 0.2100000083446502685546875;
    precise float _397 = _391 / _395;
    precise float _398 = _392 / _396;
    precise float _401 = 1.0 - spvNClamp(_398, 0.0, 1.0);
    precise float _404 = _192 - 0.1167768537998199462890625;
    precise float _405 = _199 - 0.02999999932944774627685546875;
    precise float _406 = _404 / _208;
    precise float _407 = _405 / _209;
    precise float _410 = 0.88322317600250244140625 - _192;
    precise float _411 = 0.9700000286102294921875 - _199;
    precise float _412 = _410 / _208;
    precise float _413 = _411 / _209;
    precise float _416 = spvNClamp(_406, 0.0, 1.0) * spvNClamp(_412, 0.0, 1.0);
    precise float _417 = spvNClamp(_407, 0.0, 1.0) * _416;
    precise float _418 = spvNClamp(_413, 0.0, 1.0) * _417;
    precise float _419 = fma(-spvNClamp(_397, 0.0, 1.0), _401, 1.0) * _418;
    precise float _420 = _199 * 10.0;
    precise float _424 = abs(fma(fract(_420), 2.0, -1.0)) - 0.5;
    precise float _426 = sin(_420) * _424;
    precise float _430 = abs(fma(fract(_194), 2.0, -1.0)) - 0.5;
    precise float _432 = sin(_194) * _430;
    precise float _433 = fma(_426, 0.0199999995529651641845703125, _192);
    precise float _434 = fma(_432, 0.0199999995529651641845703125, _199);
    precise float _435 = _433 - 0.089776851236820220947265625;
    precise float _436 = _434 - 0.0030000000260770320892333984375;
    precise float _437 = _435 / _208;
    precise float _438 = _436 / _209;
    precise float _441 = 0.91022312641143798828125 - _433;
    precise float _442 = 0.9969999790191650390625 - _434;
    precise float _443 = _441 / _208;
    precise float _444 = _442 / _209;
    precise float _447 = spvNClamp(_437, 0.0, 1.0) * spvNClamp(_443, 0.0, 1.0);
    precise float _448 = spvNClamp(_438, 0.0, 1.0) * _447;
    if ((fma(_448, spvNClamp(_444, 0.0, 1.0), -0.100000001490116119384765625) < 0.0) && _306)
    {
        demote;
    }
    precise float _467 = (_305 ? fma(_289.x, cb0._m26.x, _383) : _383) - cb0._m18.x;
    precise float _468 = (_305 ? fma(_289.y, cb0._m26.x, _384) : _384) - cb0._m18.y;
    precise float _469 = (_305 ? fma(_289.z, cb0._m26.x, _385) : _385) - cb0._m18.z;
    precise float _470 = fma(_419, _467, cb0._m18.x);
    precise float _471 = fma(_419, _468, cb0._m18.y);
    precise float _472 = fma(_419, _469, cb0._m18.z);
    float _494;
    float _495;
    float _496;
    if (cb0._m23.y != 0.0)
    {
        float _487 = float(texture(sampler2D(t3, s5), vec2(_306 ? _433 : _192, _306 ? _434 : _199)).w >= 0.5);
        precise float _488 = _470 * (-0.39999997615814208984375);
        precise float _489 = _471 * (-0.39999997615814208984375);
        precise float _490 = _472 * (-0.39999997615814208984375);
        _494 = fma(_487, _488, _470);
        _495 = fma(_487, _489, _471);
        _496 = fma(_487, _490, _472);
    }
    else
    {
        _494 = _470;
        _495 = _471;
        _496 = _472;
    }
    precise float _501 = TEXCOORD2.y * cb0._m7.x;
    precise float _502 = TEXCOORD2.y * cb0._m7.y;
    precise float _519 = fma(cb0._m9.x, TEXCOORD2.z, fma(cb0._m5.x, TEXCOORD2.x, _501)) + cb0._m11.x;
    precise float _520 = fma(cb0._m9.y, TEXCOORD2.z, fma(cb0._m5.y, TEXCOORD2.x, _502)) + cb0._m11.y;
    float _596;
    float _597;
    float _598;
    float _599;
    if (cb3._m0.x == 1.0)
    {
        bool _529 = cb3._m0.y == 1.0;
        precise float _535 = TEXCOORD2.y * cb3._m3.x;
        precise float _536 = TEXCOORD2.y * cb3._m3.y;
        precise float _537 = TEXCOORD2.y * cb3._m3.z;
        precise float _559 = fma(cb3._m5.x, TEXCOORD2.z, fma(cb3._m1.x, TEXCOORD2.x, _535)) + cb3._m7.x;
        precise float _560 = fma(cb3._m5.y, TEXCOORD2.z, fma(cb3._m1.y, TEXCOORD2.x, _536)) + cb3._m7.y;
        precise float _561 = fma(cb3._m5.z, TEXCOORD2.z, fma(cb3._m1.z, TEXCOORD2.x, _537)) + cb3._m7.z;
        precise float _570 = (_529 ? _559 : TEXCOORD2.x) - cb3._m11.x;
        precise float _571 = (_529 ? _560 : TEXCOORD2.y) - cb3._m11.y;
        precise float _572 = (_529 ? _561 : TEXCOORD2.z) - cb3._m11.z;
        precise float _578 = _570 * cb3._m9.x;
        precise float _579 = _571 * cb3._m9.y;
        precise float _580 = _572 * cb3._m9.z;
        vec4 _591 = texture(sampler3D(t5, s0), vec3(spvNMax(fma(_578, 0.25, 0.75), fma(cb3._m0.z, 0.5, 0.75)), _579, _580));
        _596 = _591.w;
        _597 = _591.z;
        _598 = _591.y;
        _599 = _591.x;
    }
    else
    {
        _596 = 1.0;
        _597 = 1.0;
        _598 = 1.0;
        _599 = 1.0;
    }
    precise float _613 = spvNClamp(dp4_f32(vec4(_599, _598, _597, _596), cb2._m47), 0.0, 1.0) * texture(sampler2D(t4, s1), vec2(_519, _520)).w;
    precise float _619 = _613 * cb0._m2.x;
    precise float _620 = _613 * cb0._m2.y;
    precise float _621 = _613 * cb0._m2.z;
    vec3 _628 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    precise float _630 = inversesqrt(dp3_f32(_628, _628));
    precise float _631 = _630 * TEXCOORD1.x;
    precise float _632 = _630 * TEXCOORD1.y;
    precise float _633 = _630 * TEXCOORD1.z;
    precise float _634 = _494 - 0.039999999105930328369140625;
    precise float _635 = _495 - 0.039999999105930328369140625;
    precise float _636 = _496 - 0.039999999105930328369140625;
    precise float _639 = fma(cb0._m13.y, _634, 0.039999999105930328369140625);
    precise float _640 = fma(cb0._m13.y, _635, 0.039999999105930328369140625);
    precise float _641 = fma(cb0._m13.y, _636, 0.039999999105930328369140625);
    precise float _643 = fma(-cb0._m13.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _644 = _643 * _494;
    precise float _645 = _643 * _495;
    precise float _646 = _643 * _496;
    precise float _649 = 1.0 - cb0._m13.x;
    precise float _655 = fma(_174, _179, cb2._m0.x);
    precise float _656 = fma(_175, _179, cb2._m0.y);
    precise float _657 = fma(_176, _179, cb2._m0.z);
    vec3 _658 = vec3(_655, _656, _657);
    precise float _661 = inversesqrt(spvNMax(dp3_f32(_658, _658), 0.001000000047497451305389404296875));
    precise float _662 = _661 * _655;
    precise float _663 = _661 * _656;
    precise float _664 = _661 * _657;
    vec3 _665 = vec3(_631, _632, _633);
    precise float _669 = spvNClamp(dp3_f32(_665, cb2._m0), 0.0, 1.0);
    vec3 _670 = vec3(_662, _663, _664);
    precise float _672 = spvNClamp(dp3_f32(_665, _670), 0.0, 1.0);
    precise float _674 = spvNClamp(dp3_f32(cb2._m0, _670), 0.0, 1.0);
    precise float _675 = _674 + _674;
    precise float _676 = _674 * _675;
    precise float _677 = fma(_676, _649, -0.5);
    precise float _678 = 1.0 - _669;
    precise float _679 = _678 * _678;
    precise float _680 = _679 * _679;
    precise float _681 = _678 * _680;
    precise float _683 = abs(dp3_f32(_665, vec3(_180, _181, _182)));
    precise float _684 = 1.0 - _683;
    precise float _685 = _684 * _684;
    precise float _686 = _685 * _685;
    precise float _687 = _684 * _686;
    precise float _689 = fma(_677, _687, 1.0) * fma(_677, _681, 1.0);
    precise float _690 = _649 * _649;
    precise float _691 = spvNMax(_690, 0.00200000009499490261077880859375);
    precise float _692 = 1.0 - _691;
    precise float _695 = _683 * fma(_669, _692, _691);
    precise float _697 = fma(_669, fma(_683, _692, _691), _695) + 9.9999997473787516355514526367188e-06;
    precise float _698 = 0.5 / _697;
    precise float _699 = _691 * _691;
    precise float _702 = fma(fma(_672, _699, -_672), _672, 1.0);
    precise float _703 = _699 * 0.3183098733425140380859375;
    precise float _705 = _703 / fma(_702, _702, 1.0000000116860974230803549289703e-07);
    precise float _706 = _705 * _698;
    precise float _707 = _706 * 3.1415927410125732421875;
    precise float _708 = _669 * _689;
    precise float _709 = _669 * _707;
    vec3 _711 = vec3(_639, _640, _641);
    precise float _715 = ((dp3_f32(_711, _711) == 0.0) ? 0.0 : 1.0) * spvNMax(_709, 0.0);
    precise float _716 = _708 * _619;
    precise float _717 = _708 * _620;
    precise float _718 = _708 * _621;
    precise float _719 = _619 * _715;
    precise float _720 = _620 * _715;
    precise float _721 = _621 * _715;
    precise float _722 = 1.0 - _674;
    precise float _723 = _722 * _722;
    precise float _724 = _723 * _723;
    precise float _725 = _722 * _724;
    precise float _726 = 1.0 - _639;
    precise float _727 = 1.0 - _640;
    precise float _728 = 1.0 - _641;
    precise float _732 = _719 * fma(_726, _725, _639);
    precise float _733 = _720 * fma(_727, _725, _640);
    precise float _734 = _721 * fma(_728, _725, _641);
    SV_Target.x = fma(_644, _716, _732);
    SV_Target.y = fma(_645, _717, _733);
    SV_Target.z = fma(_646, _718, _734);
    SV_Target.w = 1.0;
}

