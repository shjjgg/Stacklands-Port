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
layout(set = 0, binding = 11) uniform sampler s4;
layout(set = 0, binding = 12) uniform sampler s5;
layout(set = 0, binding = 13) uniform sampler s6;
layout(set = 0, binding = 14) uniform texture2D t0;
layout(set = 0, binding = 15) uniform texture2D t1;
layout(set = 0, binding = 16) uniform texture2D t2;
layout(set = 0, binding = 17) uniform texture2D t3;
layout(set = 0, binding = 18) uniform texture2D t4;
layout(set = 0, binding = 19) uniform textureCube t5;
layout(set = 0, binding = 20) uniform textureCube t6;
layout(set = 0, binding = 21) uniform texture3D t7;

layout(location = 1, component = 0) in vec2 TEXCOORD;
layout(location = 2, component = 0) in vec3 TEXCOORD1;
layout(location = 3, component = 0) in vec3 TEXCOORD2;
layout(location = 4, component = 0) in vec3 TEXCOORD3;
layout(location = 5, component = 0) in vec4 TEXCOORD5;
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
    precise float _188 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _188));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _177 = a.x * b.x;
    return fma(a.y, b.y, _177);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _159 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _159)));
}

void main()
{
    precise float _212 = cb1._m4.x - TEXCOORD2.x;
    precise float _213 = cb1._m4.y - TEXCOORD2.y;
    precise float _214 = cb1._m4.z - TEXCOORD2.z;
    vec3 _215 = vec3(_212, _213, _214);
    precise float _217 = inversesqrt(dp3_f32(_215, _215));
    precise float _218 = _217 * _212;
    precise float _219 = _217 * _213;
    precise float _220 = _217 * _214;
    precise float _223 = TEXCOORD.y * 150.0;
    precise float _226 = sin(roundEven(_223)) * 43758.546875;
    precise float _230 = fma(fract(_226), 0.004999999888241291046142578125, TEXCOORD.x);
    precise float _231 = _230 * 150.0;
    precise float _232 = _230 * 10.0;
    precise float _235 = sin(roundEven(_231)) * 43758.546875;
    precise float _237 = fma(fract(_235), 0.004999999888241291046142578125, TEXCOORD.y);
    precise float _246 = abs(dFdy(_230)) + abs(dFdx(_230));
    precise float _247 = abs(dFdy(_237)) + abs(dFdx(_237));
    precise float _248 = 1.0 - TEXCOORD.x;
    precise float _249 = 1.0 - TEXCOORD.y;
    bool _256 = cb0._m19.x > 0.5;
    bool _258 = cb0._m19.y > 0.5;
    float _261 = _258 ? (_256 ? 0.550000011920928955078125 : 0.5) : (_256 ? 0.5 : 0.449999988079071044921875);
    float _263 = (_256 || _258) ? 2.0 : 1.75;
    precise float _264 = _248 - 0.5;
    precise float _265 = _249 - _261;
    precise float _266 = _263 * _264;
    precise float _267 = fma(_264, _263, 0.5);
    precise float _268 = fma(_265, _263, _261);
    precise float _277 = float(_267 >= 0.0) * float(_267 <= 1.0);
    precise float _278 = float(_268 >= 0.0) * _277;
    vec2 _281 = vec2(_267, _268);
    vec4 _284 = texture(sampler2D(t0, s3), _281);
    float _285 = _284.x;
    float _286 = _284.w;
    vec4 _290 = texture(sampler2D(t1, s5), _281);
    float _291 = _290.x;
    float _292 = _290.w;
    precise float _294 = fma(-_278, float(_268 <= 1.0), 1.0);
    precise float _298 = fma(_294, -_286, _286);
    precise float _302 = fma(_294, -_292, _292);
    precise float _303 = TEXCOORD2.x - cb1._m4.x;
    precise float _304 = TEXCOORD2.y - cb1._m4.y;
    precise float _305 = TEXCOORD2.z - cb1._m4.z;
    vec3 _306 = vec3(_303, _304, _305);
    precise float _308 = inversesqrt(dp3_f32(_306, _306));
    precise float _309 = _308 * _303;
    precise float _310 = _308 * _305;
    precise float _311 = TEXCOORD.y + TEXCOORD.x;
    precise float _312 = TEXCOORD.y + TEXCOORD.y;
    precise float _316 = fma(-_310, 5.0, _312);
    precise float _317 = _316 * 10.0;
    precise float _319 = fma(sin(_317), 0.0199999995529651641845703125, fma(-_309, 5.0, _311));
    precise float _320 = _319 * 30.0;
    vec4 _327 = texture(sampler2D(t2, s4), vec2(_319, fma(cos(_320), 0.0199999995529651641845703125, _316)));
    precise float _335 = fma(cb1._m0.z, 2.0, _311) * 0.0199999995529651641845703125;
    float _338 = float(fract(_335) >= 0.9900000095367431640625);
    bool _343 = cb0._m15.x > 0.5;
    bool _344 = cb0._m15.y > 0.5;
    float _355 = _343 ? fma(_338, cb0._m18.y, cb0._m6.x) : cb0._m6.x;
    float _356 = _343 ? fma(_338, cb0._m18.y, cb0._m6.y) : cb0._m6.y;
    float _357 = _343 ? fma(_338, cb0._m18.y, cb0._m6.z) : cb0._m6.z;
    precise float _358 = _266 + 0.0;
    precise float _359 = _268 - 0.5;
    vec2 _360 = vec2(_358, _359);
    precise float _367 = (_256 ? spvNMax(abs(_359), abs(_358)) : sqrt(dp2_f32(_360, _360))) - 0.400390625;
    precise float _368 = _367 / _246;
    precise float _370 = 1.0 - spvNClamp(_368, 0.0, 1.0);
    precise float _376 = cb0._m8.x - _355;
    precise float _377 = cb0._m8.y - _356;
    precise float _378 = cb0._m8.z - _357;
    precise float _379 = fma(_370, _376, _355);
    precise float _380 = fma(_370, _377, _356);
    precise float _381 = fma(_370, _378, _357);
    float _383 = (_237 >= 0.20000000298023223876953125) ? 0.0 : 1.0;
    precise float _384 = cb0._m8.x - _379;
    precise float _385 = cb0._m8.y - _380;
    precise float _386 = cb0._m8.z - _381;
    precise float _387 = fma(_383, _384, _379);
    precise float _388 = fma(_383, _385, _380);
    precise float _389 = fma(_383, _386, _381);
    precise float _390 = 1.0 - fma(_294, -_285, _285);
    precise float _396 = cb0._m13.x - cb0._m6.x;
    precise float _397 = cb0._m13.y - cb0._m6.y;
    precise float _398 = cb0._m13.z - cb0._m6.z;
    precise float _402 = fma(_390, _396, cb0._m6.x) - _387;
    precise float _403 = fma(_390, _397, cb0._m6.y) - _388;
    precise float _404 = fma(_390, _398, cb0._m6.z) - _389;
    precise float _405 = fma(_298, _402, _387);
    precise float _406 = fma(_298, _403, _388);
    precise float _407 = fma(_298, _404, _389);
    bool _410 = (cb0._m19.y == 0.0) && (cb0._m19.x == 0.0);
    precise float _411 = 1.0 - fma(_294, -_291, _291);
    precise float _415 = fma(_411, _396, cb0._m6.x) - _405;
    precise float _416 = fma(_411, _397, cb0._m6.y) - _406;
    precise float _417 = fma(_411, _398, cb0._m6.z) - _407;
    float _421 = _410 ? _405 : fma(_302, _415, _405);
    float _422 = _410 ? _406 : fma(_302, _416, _406);
    float _423 = _410 ? _407 : fma(_302, _417, _407);
    precise float _424 = -_247;
    precise float _425 = fma(_424, 0.5, 0.189999997615814208984375);
    precise float _426 = fma(_424, 0.5, 0.2100000083446502685546875);
    precise float _429 = _237 - _425;
    precise float _430 = _237 - _426;
    precise float _433 = fma(_247, 0.5, -_425) + 0.189999997615814208984375;
    precise float _434 = fma(_247, 0.5, -_426) + 0.2100000083446502685546875;
    precise float _435 = _429 / _433;
    precise float _436 = _430 / _434;
    precise float _439 = 1.0 - spvNClamp(_436, 0.0, 1.0);
    precise float _442 = _230 - 0.1167768537998199462890625;
    precise float _443 = _237 - 0.02999999932944774627685546875;
    precise float _444 = _442 / _246;
    precise float _445 = _443 / _247;
    precise float _448 = 0.88322317600250244140625 - _230;
    precise float _449 = 0.9700000286102294921875 - _237;
    precise float _450 = _448 / _246;
    precise float _451 = _449 / _247;
    precise float _454 = spvNClamp(_444, 0.0, 1.0) * spvNClamp(_450, 0.0, 1.0);
    precise float _455 = spvNClamp(_445, 0.0, 1.0) * _454;
    precise float _456 = spvNClamp(_451, 0.0, 1.0) * _455;
    precise float _457 = fma(-spvNClamp(_435, 0.0, 1.0), _439, 1.0) * _456;
    precise float _458 = _237 * 10.0;
    precise float _462 = abs(fma(fract(_458), 2.0, -1.0)) - 0.5;
    precise float _464 = sin(_458) * _462;
    precise float _468 = abs(fma(fract(_232), 2.0, -1.0)) - 0.5;
    precise float _470 = sin(_232) * _468;
    precise float _471 = fma(_464, 0.0199999995529651641845703125, _230);
    precise float _472 = fma(_470, 0.0199999995529651641845703125, _237);
    precise float _473 = _471 - 0.089776851236820220947265625;
    precise float _474 = _472 - 0.0030000000260770320892333984375;
    precise float _475 = _473 / _246;
    precise float _476 = _474 / _247;
    precise float _479 = 0.91022312641143798828125 - _471;
    precise float _480 = 0.9969999790191650390625 - _472;
    precise float _481 = _479 / _246;
    precise float _482 = _480 / _247;
    precise float _485 = spvNClamp(_475, 0.0, 1.0) * spvNClamp(_481, 0.0, 1.0);
    precise float _486 = spvNClamp(_476, 0.0, 1.0) * _485;
    if ((fma(_486, spvNClamp(_482, 0.0, 1.0), -0.100000001490116119384765625) < 0.0) && _344)
    {
        demote;
    }
    precise float _505 = (_343 ? fma(_327.x, cb0._m18.x, _421) : _421) - cb0._m10.x;
    precise float _506 = (_343 ? fma(_327.y, cb0._m18.x, _422) : _422) - cb0._m10.y;
    precise float _507 = (_343 ? fma(_327.z, cb0._m18.x, _423) : _423) - cb0._m10.z;
    precise float _508 = fma(_457, _505, cb0._m10.x);
    precise float _509 = fma(_457, _506, cb0._m10.y);
    precise float _510 = fma(_457, _507, cb0._m10.z);
    float _532;
    float _533;
    float _534;
    if (cb0._m15.y != 0.0)
    {
        float _525 = float(texture(sampler2D(t3, s6), vec2(_344 ? _471 : _230, _344 ? _472 : _237)).w >= 0.5);
        precise float _526 = _508 * (-0.39999997615814208984375);
        precise float _527 = _509 * (-0.39999997615814208984375);
        precise float _528 = _510 * (-0.39999997615814208984375);
        _532 = fma(_525, _526, _508);
        _533 = fma(_525, _527, _509);
        _534 = fma(_525, _528, _510);
    }
    else
    {
        _532 = _508;
        _533 = _509;
        _534 = _510;
    }
    float _543 = dp3_f32(_215, vec3(cb4._m9.z, cb4._m10.z, cb4._m11.z));
    precise float _550 = TEXCOORD2.x - cb3._m25.x;
    precise float _551 = TEXCOORD2.y - cb3._m25.y;
    precise float _552 = TEXCOORD2.z - cb3._m25.z;
    vec3 _553 = vec3(_550, _551, _552);
    precise float _556 = sqrt(dp3_f32(_553, _553)) - _543;
    bool _569 = cb6._m0.x == 1.0;
    float _641;
    float _642;
    float _643;
    float _644;
    if (_569)
    {
        bool _576 = cb6._m0.y == 1.0;
        precise float _582 = TEXCOORD2.y * cb6._m3.x;
        precise float _583 = TEXCOORD2.y * cb6._m3.y;
        precise float _584 = TEXCOORD2.y * cb6._m3.z;
        precise float _606 = fma(cb6._m5.x, TEXCOORD2.z, fma(cb6._m1.x, TEXCOORD2.x, _582)) + cb6._m7.x;
        precise float _607 = fma(cb6._m5.y, TEXCOORD2.z, fma(cb6._m1.y, TEXCOORD2.x, _583)) + cb6._m7.y;
        precise float _608 = fma(cb6._m5.z, TEXCOORD2.z, fma(cb6._m1.z, TEXCOORD2.x, _584)) + cb6._m7.z;
        precise float _617 = (_576 ? _606 : TEXCOORD2.x) - cb6._m11.x;
        precise float _618 = (_576 ? _607 : TEXCOORD2.y) - cb6._m11.y;
        precise float _619 = (_576 ? _608 : TEXCOORD2.z) - cb6._m11.z;
        precise float _625 = _617 * cb6._m9.x;
        precise float _626 = _618 * cb6._m9.y;
        precise float _627 = _619 * cb6._m9.z;
        vec4 _636 = texture(sampler3D(t7, s1), vec3(spvNMax(fma(cb6._m0.z, 0.5, 0.75), fma(_625, 0.25, 0.75)), _626, _627));
        _641 = _636.w;
        _642 = _636.z;
        _643 = _636.y;
        _644 = _636.x;
    }
    else
    {
        _641 = 1.0;
        _642 = 1.0;
        _643 = 1.0;
        _644 = 1.0;
    }
    precise float _658 = TEXCOORD5.x / TEXCOORD5.w;
    precise float _659 = TEXCOORD5.y / TEXCOORD5.w;
    vec4 _664 = texture(sampler2D(t4, s2), vec2(_658, _659));
    float _665 = _664.x;
    precise float _666 = spvNClamp(dp4_f32(vec4(_644, _643, _642, _641), cb2._m47), 0.0, 1.0) - _665;
    precise float _667 = fma(spvNClamp(fma(fma(cb3._m26, _556, _543), cb3._m24.z, cb3._m24.w), 0.0, 1.0), _666, _665);
    precise float _670 = 1.0 - cb0._m5.x;
    precise float _671 = -_218;
    precise float _672 = -_219;
    precise float _673 = -_220;
    vec3 _681 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    float _682 = dp3_f32(vec3(_671, _672, _673), _681);
    precise float _683 = _682 + _682;
    precise float _684 = -_683;
    precise float _685 = fma(TEXCOORD1.x, _684, _671);
    precise float _686 = fma(TEXCOORD1.y, _684, _672);
    precise float _687 = fma(TEXCOORD1.z, _684, _673);
    precise float _693 = _667 * cb0._m2.x;
    precise float _694 = _667 * cb0._m2.y;
    precise float _695 = _667 * cb0._m2.z;
    vec4 _696 = vec4(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z, 1.0);
    float _787;
    float _788;
    float _789;
    if (_569)
    {
        bool _702 = cb6._m0.y == 1.0;
        precise float _708 = TEXCOORD2.y * cb6._m3.x;
        precise float _709 = TEXCOORD2.y * cb6._m3.y;
        precise float _710 = TEXCOORD2.y * cb6._m3.z;
        precise float _732 = fma(cb6._m5.x, TEXCOORD2.z, fma(cb6._m1.x, TEXCOORD2.x, _708)) + cb6._m7.x;
        precise float _733 = fma(cb6._m5.y, TEXCOORD2.z, fma(cb6._m1.y, TEXCOORD2.x, _709)) + cb6._m7.y;
        precise float _734 = fma(cb6._m5.z, TEXCOORD2.z, fma(cb6._m1.z, TEXCOORD2.x, _710)) + cb6._m7.z;
        precise float _743 = (_702 ? _732 : TEXCOORD2.x) - cb6._m11.x;
        precise float _744 = (_702 ? _733 : TEXCOORD2.y) - cb6._m11.y;
        precise float _745 = (_702 ? _734 : TEXCOORD2.z) - cb6._m11.z;
        precise float _751 = _743 * cb6._m9.x;
        precise float _752 = _744 * cb6._m9.y;
        precise float _753 = _745 * cb6._m9.z;
        precise float _754 = _751 * 0.25;
        precise float _757 = cb6._m0.z * 0.5;
        precise float _761 = spvNMin(fma(-cb6._m0.z, 0.5, 0.25), spvNMax(_754, _757));
        precise float _765 = _761 + 0.25;
        precise float _766 = _752 + 0.0;
        precise float _767 = _753 + 0.0;
        precise float _771 = _761 + 0.5;
        _787 = dp4_f32(texture(sampler3D(t7, s1), vec3(_771, _766, _767)), _696);
        _788 = dp4_f32(texture(sampler3D(t7, s1), vec3(_765, _766, _767)), _696);
        _789 = dp4_f32(texture(sampler3D(t7, s1), vec3(_761, _752, _753)), _696);
    }
    else
    {
        _787 = dp4_f32(cb2._m42, _696);
        _788 = dp4_f32(cb2._m41, _696);
        _789 = dp4_f32(cb2._m40, _696);
    }
    precise float _796 = _789 + TEXCOORD3.x;
    precise float _797 = _788 + TEXCOORD3.y;
    precise float _798 = _787 + TEXCOORD3.z;
    vec3 _806 = vec3(_685, _686, _687);
    float _855;
    float _856;
    float _857;
    if (cb5._m5 > 0.0)
    {
        precise float _810 = inversesqrt(dp3_f32(_806, _806));
        precise float _811 = _810 * _685;
        precise float _812 = _810 * _686;
        precise float _813 = _810 * _687;
        precise float _819 = cb5._m0.x - TEXCOORD2.x;
        precise float _820 = cb5._m0.y - TEXCOORD2.y;
        precise float _821 = cb5._m0.z - TEXCOORD2.z;
        precise float _822 = _819 / _811;
        precise float _823 = _820 / _812;
        precise float _824 = _821 / _813;
        precise float _830 = cb5._m2.x - TEXCOORD2.x;
        precise float _831 = cb5._m2.y - TEXCOORD2.y;
        precise float _832 = cb5._m2.z - TEXCOORD2.z;
        precise float _833 = _830 / _811;
        precise float _834 = _831 / _812;
        precise float _835 = _832 / _813;
        precise float _843 = spvNMin((_813 > 0.0) ? _824 : _835, spvNMin((_812 > 0.0) ? _823 : _834, (_811 > 0.0) ? _822 : _833));
        precise float _849 = TEXCOORD2.x - cb5._m4.x;
        precise float _850 = TEXCOORD2.y - cb5._m4.y;
        precise float _851 = TEXCOORD2.z - cb5._m4.z;
        _855 = fma(_813, _843, _851);
        _856 = fma(_812, _843, _850);
        _857 = fma(_811, _843, _849);
    }
    else
    {
        _855 = _687;
        _856 = _686;
        _857 = _685;
    }
    precise float _860 = fma(-_670, 0.699999988079071044921875, 1.7000000476837158203125) * _670;
    precise float _861 = _860 * 6.0;
    vec4 _867 = textureLod(samplerCube(t5, s0), vec3(_857, _856, _855), _861);
    float _868 = _867.x;
    float _869 = _867.y;
    float _870 = _867.z;
    precise float _872 = _867.w - 1.0;
    precise float _879 = log2(fma(cb5._m6.w, _872, 1.0)) * cb5._m6.y;
    precise float _883 = exp2(_879) * cb5._m6.x;
    precise float _884 = _868 * _883;
    precise float _885 = _869 * _883;
    precise float _886 = _870 * _883;
    float _978;
    float _979;
    float _980;
    if (cb5._m3 < 0.999989986419677734375)
    {
        float _943;
        float _944;
        float _945;
        if (cb5._m12 > 0.0)
        {
            precise float _898 = inversesqrt(dp3_f32(_806, _806));
            precise float _899 = _898 * _685;
            precise float _900 = _898 * _686;
            precise float _901 = _898 * _687;
            precise float _907 = cb5._m7.x - TEXCOORD2.x;
            precise float _908 = cb5._m7.y - TEXCOORD2.y;
            precise float _909 = cb5._m7.z - TEXCOORD2.z;
            precise float _910 = _907 / _899;
            precise float _911 = _908 / _900;
            precise float _912 = _909 / _901;
            precise float _918 = cb5._m9.x - TEXCOORD2.x;
            precise float _919 = cb5._m9.y - TEXCOORD2.y;
            precise float _920 = cb5._m9.z - TEXCOORD2.z;
            precise float _921 = _918 / _899;
            precise float _922 = _919 / _900;
            precise float _923 = _920 / _901;
            precise float _931 = spvNMin((_901 > 0.0) ? _912 : _923, spvNMin((_900 > 0.0) ? _911 : _922, (_899 > 0.0) ? _910 : _921));
            precise float _937 = TEXCOORD2.x - cb5._m11.x;
            precise float _938 = TEXCOORD2.y - cb5._m11.y;
            precise float _939 = TEXCOORD2.z - cb5._m11.z;
            _943 = fma(_901, _931, _939);
            _944 = fma(_900, _931, _938);
            _945 = fma(_899, _931, _937);
        }
        else
        {
            _943 = _687;
            _944 = _686;
            _945 = _685;
        }
        vec4 _949 = textureLod(samplerCube(t6, s0), vec3(_945, _944, _943), _861);
        precise float _954 = _949.w - 1.0;
        precise float _961 = log2(fma(cb5._m13.w, _954, 1.0)) * cb5._m13.y;
        precise float _965 = exp2(_961) * cb5._m13.x;
        precise float _966 = _949.x * _965;
        precise float _967 = _949.y * _965;
        precise float _968 = _949.z * _965;
        _978 = fma(cb5._m3, fma(_883, _870, -_968), _968);
        _979 = fma(cb5._m3, fma(_883, _869, -_967), _967);
        _980 = fma(cb5._m3, fma(_883, _868, -_966), _966);
    }
    else
    {
        _978 = _886;
        _979 = _885;
        _980 = _884;
    }
    precise float _982 = inversesqrt(dp3_f32(_681, _681));
    precise float _983 = _982 * TEXCOORD1.x;
    precise float _984 = _982 * TEXCOORD1.y;
    precise float _985 = _982 * TEXCOORD1.z;
    precise float _986 = _532 - 0.039999999105930328369140625;
    precise float _987 = _533 - 0.039999999105930328369140625;
    precise float _988 = _534 - 0.039999999105930328369140625;
    precise float _991 = fma(cb0._m5.y, _986, 0.039999999105930328369140625);
    precise float _992 = fma(cb0._m5.y, _987, 0.039999999105930328369140625);
    precise float _993 = fma(cb0._m5.y, _988, 0.039999999105930328369140625);
    precise float _995 = fma(-cb0._m5.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _996 = _995 * _532;
    precise float _997 = _995 * _533;
    precise float _998 = _995 * _534;
    precise float _1004 = fma(_212, _217, cb2._m0.x);
    precise float _1005 = fma(_213, _217, cb2._m0.y);
    precise float _1006 = fma(_214, _217, cb2._m0.z);
    vec3 _1007 = vec3(_1004, _1005, _1006);
    precise float _1010 = inversesqrt(spvNMax(dp3_f32(_1007, _1007), 0.001000000047497451305389404296875));
    precise float _1011 = _1010 * _1004;
    precise float _1012 = _1010 * _1005;
    precise float _1013 = _1010 * _1006;
    vec3 _1014 = vec3(_983, _984, _985);
    precise float _1018 = spvNClamp(dp3_f32(_1014, cb2._m0), 0.0, 1.0);
    vec3 _1019 = vec3(_1011, _1012, _1013);
    precise float _1021 = spvNClamp(dp3_f32(_1014, _1019), 0.0, 1.0);
    precise float _1023 = spvNClamp(dp3_f32(cb2._m0, _1019), 0.0, 1.0);
    precise float _1024 = _1023 + _1023;
    precise float _1025 = _1023 * _1024;
    precise float _1026 = fma(_1025, _670, -0.5);
    precise float _1027 = 1.0 - _1018;
    precise float _1028 = _1027 * _1027;
    precise float _1029 = _1028 * _1028;
    precise float _1030 = _1027 * _1029;
    precise float _1032 = abs(dp3_f32(_1014, vec3(_218, _219, _220)));
    precise float _1033 = 1.0 - _1032;
    precise float _1034 = _1033 * _1033;
    precise float _1035 = _1034 * _1034;
    precise float _1036 = _1033 * _1035;
    precise float _1038 = fma(_1026, _1036, 1.0) * fma(_1026, _1030, 1.0);
    precise float _1039 = _670 * _670;
    precise float _1040 = spvNMax(_1039, 0.00200000009499490261077880859375);
    precise float _1041 = 1.0 - _1040;
    precise float _1044 = _1032 * fma(_1018, _1041, _1040);
    precise float _1046 = fma(_1018, fma(_1032, _1041, _1040), _1044) + 9.9999997473787516355514526367188e-06;
    precise float _1047 = 0.5 / _1046;
    precise float _1048 = _1040 * _1040;
    precise float _1051 = fma(fma(_1021, _1048, -_1021), _1021, 1.0);
    precise float _1052 = _1048 * 0.3183098733425140380859375;
    precise float _1054 = _1052 / fma(_1051, _1051, 1.0000000116860974230803549289703e-07);
    precise float _1055 = _1047 * _1054;
    precise float _1056 = _1055 * 3.1415927410125732421875;
    precise float _1057 = _1018 * _1038;
    precise float _1058 = _1018 * _1056;
    precise float _1061 = 1.0 / fma(_1040, _1040, 1.0);
    vec3 _1062 = vec3(_991, _992, _993);
    precise float _1066 = spvNMax(_1058, 0.0) * ((dp3_f32(_1062, _1062) == 0.0) ? 0.0 : 1.0);
    precise float _1067 = 1.0 - _995;
    precise float _1068 = _1067 + cb0._m5.x;
    precise float _1069 = spvNClamp(_1068, 0.0, 1.0);
    precise float _1073 = _693 * _1066;
    precise float _1074 = _694 * _1066;
    precise float _1075 = _695 * _1066;
    precise float _1076 = 1.0 - _1023;
    precise float _1077 = _1076 * _1076;
    precise float _1078 = _1077 * _1077;
    precise float _1079 = _1076 * _1078;
    precise float _1080 = 1.0 - _991;
    precise float _1081 = 1.0 - _992;
    precise float _1082 = 1.0 - _993;
    precise float _1086 = fma(_1080, _1079, _991) * _1073;
    precise float _1087 = fma(_1081, _1079, _992) * _1074;
    precise float _1088 = fma(_1082, _1079, _993) * _1075;
    precise float _1092 = _980 * _1061;
    precise float _1093 = _979 * _1061;
    precise float _1094 = _978 * _1061;
    precise float _1095 = _1069 - _991;
    precise float _1096 = _1069 - _992;
    precise float _1097 = _1069 - _993;
    SV_Target.x = fma(_1092, fma(_1036, _1095, _991), fma(_996, fma(_693, _1057, spvNMax(_796, 0.0)), _1086));
    SV_Target.y = fma(_1093, fma(_1036, _1096, _992), fma(_997, fma(_694, _1057, spvNMax(_797, 0.0)), _1087));
    SV_Target.z = fma(_1094, fma(_1036, _1097, _993), fma(_998, fma(_695, _1057, spvNMax(_798, 0.0)), _1088));
    SV_Target.w = 1.0;
}

