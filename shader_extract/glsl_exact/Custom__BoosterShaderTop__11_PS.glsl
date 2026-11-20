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
layout(set = 0, binding = 12) uniform texture2D t0;
layout(set = 0, binding = 13) uniform texture2D t1;
layout(set = 0, binding = 14) uniform texture2D t2;
layout(set = 0, binding = 15) uniform textureCube t3;
layout(set = 0, binding = 16) uniform textureCube t4;
layout(set = 0, binding = 17) uniform texture3D t5;

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
    precise float _167 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _167));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _156 = a.x * b.x;
    return fma(a.y, b.y, _156);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _138 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _138)));
}

void main()
{
    precise float _191 = cb1._m4.x - TEXCOORD2.x;
    precise float _192 = cb1._m4.y - TEXCOORD2.y;
    precise float _193 = cb1._m4.z - TEXCOORD2.z;
    vec3 _194 = vec3(_191, _192, _193);
    precise float _196 = inversesqrt(dp3_f32(_194, _194));
    precise float _197 = _196 * _191;
    precise float _198 = _196 * _192;
    precise float _199 = _196 * _193;
    precise float _204 = TEXCOORD.y * 150.0;
    precise float _205 = TEXCOORD.x * 20.0;
    precise float _206 = TEXCOORD.y * 1.0;
    precise float _209 = sin(roundEven(_204)) * 43758.546875;
    precise float _211 = fma(fract(_209), 0.004999999888241291046142578125, TEXCOORD.x);
    precise float _212 = _211 * 150.0;
    precise float _215 = sin(roundEven(_212)) * 43758.546875;
    precise float _217 = fma(fract(_215), 0.004999999888241291046142578125, TEXCOORD.y);
    precise float _226 = abs(dFdx(_211)) + abs(dFdy(_211));
    precise float _227 = abs(dFdx(_217)) + abs(dFdy(_217));
    precise float _228 = 0.5 - TEXCOORD.x;
    precise float _229 = 0.550000011920928955078125 - TEXCOORD.y;
    vec4 _235 = texture(sampler2D(t0, s3), vec2(_205, _206));
    float _236 = _235.x;
    float _237 = _235.y;
    float _238 = _235.z;
    precise float _245 = _236 * cb0._m6.x;
    precise float _246 = _237 * cb0._m6.y;
    precise float _247 = _238 * cb0._m6.z;
    precise float _248 = TEXCOORD2.x - cb1._m4.x;
    precise float _249 = TEXCOORD2.y - cb1._m4.y;
    precise float _250 = TEXCOORD2.z - cb1._m4.z;
    vec3 _251 = vec3(_248, _249, _250);
    precise float _253 = inversesqrt(dp3_f32(_251, _251));
    precise float _254 = _253 * _248;
    precise float _255 = _253 * _250;
    precise float _256 = TEXCOORD.y + TEXCOORD.x;
    precise float _257 = TEXCOORD.y + TEXCOORD.y;
    precise float _261 = fma(-_255, 5.0, _257);
    precise float _262 = _261 * 10.0;
    precise float _264 = fma(sin(_262), 0.0199999995529651641845703125, fma(-_254, 5.0, _256));
    precise float _265 = _264 * 30.0;
    vec4 _272 = texture(sampler2D(t1, s4), vec2(_264, fma(cos(_265), 0.0199999995529651641845703125, _261)));
    vec2 _278 = vec2(fma(_228, 1.75, 0.0), fma(_229, 1.75, -0.050000011920928955078125));
    precise float _281 = sqrt(dp2_f32(_278, _278)) - 0.400390625;
    precise float _282 = _281 / _226;
    precise float _284 = 1.0 - spvNClamp(_282, 0.0, 1.0);
    precise float _299 = _211 - 0.1167768537998199462890625;
    precise float _300 = _299 / _226;
    precise float _302 = 0.88322317600250244140625 - _211;
    precise float _303 = _302 / _226;
    precise float _305 = spvNClamp(_303, 0.0, 1.0) * spvNClamp(_300, 0.0, 1.0);
    precise float _306 = _217 - 0.02999999932944774627685546875;
    precise float _307 = _306 / _227;
    precise float _309 = _305 * spvNClamp(_307, 0.0, 1.0);
    precise float _310 = 0.9700000286102294921875 - _217;
    precise float _311 = _310 / _227;
    precise float _313 = _309 * spvNClamp(_311, 0.0, 1.0);
    precise float _314 = fma(_272.x, 0.5, fma(_284, fma(-cb0._m6.x, _236, cb0._m8.x), _245));
    precise float _315 = fma(_272.y, 0.5, fma(_284, fma(-cb0._m6.y, _237, cb0._m8.y), _246));
    precise float _316 = fma(_272.z, 0.5, fma(_284, fma(-cb0._m6.z, _238, cb0._m8.z), _247));
    precise float _317 = _313 * _314;
    precise float _318 = _313 * _315;
    precise float _319 = _313 * _316;
    float _329 = dp3_f32(_194, vec3(cb4._m9.z, cb4._m10.z, cb4._m11.z));
    precise float _336 = TEXCOORD2.x - cb3._m25.x;
    precise float _337 = TEXCOORD2.y - cb3._m25.y;
    precise float _338 = TEXCOORD2.z - cb3._m25.z;
    vec3 _339 = vec3(_336, _337, _338);
    precise float _342 = sqrt(dp3_f32(_339, _339)) - _329;
    bool _355 = cb6._m0.x == 1.0;
    float _428;
    float _429;
    float _430;
    float _431;
    if (_355)
    {
        bool _363 = cb6._m0.y == 1.0;
        precise float _369 = TEXCOORD2.y * cb6._m3.x;
        precise float _370 = TEXCOORD2.y * cb6._m3.y;
        precise float _371 = TEXCOORD2.y * cb6._m3.z;
        precise float _393 = fma(cb6._m5.x, TEXCOORD2.z, fma(cb6._m1.x, TEXCOORD2.x, _369)) + cb6._m7.x;
        precise float _394 = fma(cb6._m5.y, TEXCOORD2.z, fma(cb6._m1.y, TEXCOORD2.x, _370)) + cb6._m7.y;
        precise float _395 = fma(cb6._m5.z, TEXCOORD2.z, fma(cb6._m1.z, TEXCOORD2.x, _371)) + cb6._m7.z;
        precise float _404 = (_363 ? _393 : TEXCOORD2.x) - cb6._m11.x;
        precise float _405 = (_363 ? _394 : TEXCOORD2.y) - cb6._m11.y;
        precise float _406 = (_363 ? _395 : TEXCOORD2.z) - cb6._m11.z;
        precise float _412 = _404 * cb6._m9.x;
        precise float _413 = _405 * cb6._m9.y;
        precise float _414 = _406 * cb6._m9.z;
        vec4 _423 = texture(sampler3D(t5, s1), vec3(spvNMax(fma(_412, 0.25, 0.75), fma(cb6._m0.z, 0.5, 0.75)), _413, _414));
        _428 = _423.w;
        _429 = _423.z;
        _430 = _423.y;
        _431 = _423.x;
    }
    else
    {
        _428 = 1.0;
        _429 = 1.0;
        _430 = 1.0;
        _431 = 1.0;
    }
    precise float _445 = TEXCOORD5.x / TEXCOORD5.w;
    precise float _446 = TEXCOORD5.y / TEXCOORD5.w;
    vec4 _451 = texture(sampler2D(t2, s2), vec2(_445, _446));
    float _452 = _451.x;
    precise float _453 = spvNClamp(dp4_f32(vec4(_431, _430, _429, _428), cb2._m47), 0.0, 1.0) - _452;
    precise float _454 = fma(spvNClamp(fma(fma(cb3._m26, _342, _329), cb3._m24.z, cb3._m24.w), 0.0, 1.0), _453, _452);
    precise float _457 = 1.0 - cb0._m5.x;
    precise float _458 = -_197;
    precise float _459 = -_198;
    precise float _460 = -_199;
    vec3 _468 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    float _469 = dp3_f32(vec3(_458, _459, _460), _468);
    precise float _470 = _469 + _469;
    precise float _471 = -_470;
    precise float _472 = fma(TEXCOORD1.x, _471, _458);
    precise float _473 = fma(TEXCOORD1.y, _471, _459);
    precise float _474 = fma(TEXCOORD1.z, _471, _460);
    precise float _480 = _454 * cb0._m2.x;
    precise float _481 = _454 * cb0._m2.y;
    precise float _482 = _454 * cb0._m2.z;
    vec4 _483 = vec4(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z, 1.0);
    float _574;
    float _575;
    float _576;
    if (_355)
    {
        bool _489 = cb6._m0.y == 1.0;
        precise float _495 = TEXCOORD2.y * cb6._m3.x;
        precise float _496 = TEXCOORD2.y * cb6._m3.y;
        precise float _497 = TEXCOORD2.y * cb6._m3.z;
        precise float _519 = fma(cb6._m5.x, TEXCOORD2.z, fma(cb6._m1.x, TEXCOORD2.x, _495)) + cb6._m7.x;
        precise float _520 = fma(cb6._m5.y, TEXCOORD2.z, fma(cb6._m1.y, TEXCOORD2.x, _496)) + cb6._m7.y;
        precise float _521 = fma(cb6._m5.z, TEXCOORD2.z, fma(cb6._m1.z, TEXCOORD2.x, _497)) + cb6._m7.z;
        precise float _530 = (_489 ? _519 : TEXCOORD2.x) - cb6._m11.x;
        precise float _531 = (_489 ? _520 : TEXCOORD2.y) - cb6._m11.y;
        precise float _532 = (_489 ? _521 : TEXCOORD2.z) - cb6._m11.z;
        precise float _538 = _530 * cb6._m9.x;
        precise float _539 = _531 * cb6._m9.y;
        precise float _540 = _532 * cb6._m9.z;
        precise float _541 = _538 * 0.25;
        precise float _544 = cb6._m0.z * 0.5;
        precise float _548 = spvNMin(fma(-cb6._m0.z, 0.5, 0.25), spvNMax(_541, _544));
        precise float _552 = _548 + 0.25;
        precise float _553 = _539 + 0.0;
        precise float _554 = _540 + 0.0;
        precise float _558 = _548 + 0.5;
        _574 = dp4_f32(texture(sampler3D(t5, s1), vec3(_558, _553, _554)), _483);
        _575 = dp4_f32(texture(sampler3D(t5, s1), vec3(_552, _553, _554)), _483);
        _576 = dp4_f32(texture(sampler3D(t5, s1), vec3(_548, _539, _540)), _483);
    }
    else
    {
        _574 = dp4_f32(cb2._m42, _483);
        _575 = dp4_f32(cb2._m41, _483);
        _576 = dp4_f32(cb2._m40, _483);
    }
    precise float _583 = _576 + TEXCOORD3.x;
    precise float _584 = _575 + TEXCOORD3.y;
    precise float _585 = _574 + TEXCOORD3.z;
    vec3 _593 = vec3(_472, _473, _474);
    float _642;
    float _643;
    float _644;
    if (cb5._m5 > 0.0)
    {
        precise float _597 = inversesqrt(dp3_f32(_593, _593));
        precise float _598 = _597 * _472;
        precise float _599 = _597 * _473;
        precise float _600 = _597 * _474;
        precise float _606 = cb5._m0.x - TEXCOORD2.x;
        precise float _607 = cb5._m0.y - TEXCOORD2.y;
        precise float _608 = cb5._m0.z - TEXCOORD2.z;
        precise float _609 = _606 / _598;
        precise float _610 = _607 / _599;
        precise float _611 = _608 / _600;
        precise float _617 = cb5._m2.x - TEXCOORD2.x;
        precise float _618 = cb5._m2.y - TEXCOORD2.y;
        precise float _619 = cb5._m2.z - TEXCOORD2.z;
        precise float _620 = _617 / _598;
        precise float _621 = _618 / _599;
        precise float _622 = _619 / _600;
        precise float _630 = spvNMin((_600 > 0.0) ? _611 : _622, spvNMin((_599 > 0.0) ? _610 : _621, (_598 > 0.0) ? _609 : _620));
        precise float _636 = TEXCOORD2.x - cb5._m4.x;
        precise float _637 = TEXCOORD2.y - cb5._m4.y;
        precise float _638 = TEXCOORD2.z - cb5._m4.z;
        _642 = fma(_600, _630, _638);
        _643 = fma(_599, _630, _637);
        _644 = fma(_598, _630, _636);
    }
    else
    {
        _642 = _474;
        _643 = _473;
        _644 = _472;
    }
    precise float _647 = fma(-_457, 0.699999988079071044921875, 1.7000000476837158203125) * _457;
    precise float _648 = _647 * 6.0;
    vec4 _654 = textureLod(samplerCube(t3, s0), vec3(_644, _643, _642), _648);
    float _655 = _654.x;
    float _656 = _654.y;
    float _657 = _654.z;
    precise float _659 = _654.w - 1.0;
    precise float _666 = log2(fma(cb5._m6.w, _659, 1.0)) * cb5._m6.y;
    precise float _670 = exp2(_666) * cb5._m6.x;
    precise float _671 = _655 * _670;
    precise float _672 = _656 * _670;
    precise float _673 = _657 * _670;
    float _765;
    float _766;
    float _767;
    if (cb5._m3 < 0.999989986419677734375)
    {
        float _730;
        float _731;
        float _732;
        if (cb5._m12 > 0.0)
        {
            precise float _685 = inversesqrt(dp3_f32(_593, _593));
            precise float _686 = _472 * _685;
            precise float _687 = _473 * _685;
            precise float _688 = _474 * _685;
            precise float _694 = cb5._m7.x - TEXCOORD2.x;
            precise float _695 = cb5._m7.y - TEXCOORD2.y;
            precise float _696 = cb5._m7.z - TEXCOORD2.z;
            precise float _697 = _694 / _686;
            precise float _698 = _695 / _687;
            precise float _699 = _696 / _688;
            precise float _705 = cb5._m9.x - TEXCOORD2.x;
            precise float _706 = cb5._m9.y - TEXCOORD2.y;
            precise float _707 = cb5._m9.z - TEXCOORD2.z;
            precise float _708 = _705 / _686;
            precise float _709 = _706 / _687;
            precise float _710 = _707 / _688;
            precise float _718 = spvNMin((_688 > 0.0) ? _699 : _710, spvNMin((_687 > 0.0) ? _698 : _709, (_686 > 0.0) ? _697 : _708));
            precise float _724 = TEXCOORD2.x - cb5._m11.x;
            precise float _725 = TEXCOORD2.y - cb5._m11.y;
            precise float _726 = TEXCOORD2.z - cb5._m11.z;
            _730 = fma(_688, _718, _726);
            _731 = fma(_687, _718, _725);
            _732 = fma(_686, _718, _724);
        }
        else
        {
            _730 = _474;
            _731 = _473;
            _732 = _472;
        }
        vec4 _736 = textureLod(samplerCube(t4, s0), vec3(_732, _731, _730), _648);
        precise float _741 = _736.w - 1.0;
        precise float _748 = log2(fma(cb5._m13.w, _741, 1.0)) * cb5._m13.y;
        precise float _752 = exp2(_748) * cb5._m13.x;
        precise float _753 = _736.x * _752;
        precise float _754 = _736.y * _752;
        precise float _755 = _736.z * _752;
        _765 = fma(cb5._m3, fma(_670, _657, -_755), _755);
        _766 = fma(cb5._m3, fma(_670, _656, -_754), _754);
        _767 = fma(cb5._m3, fma(_670, _655, -_753), _753);
    }
    else
    {
        _765 = _673;
        _766 = _672;
        _767 = _671;
    }
    precise float _769 = inversesqrt(dp3_f32(_468, _468));
    precise float _770 = _769 * TEXCOORD1.x;
    precise float _771 = _769 * TEXCOORD1.y;
    precise float _772 = _769 * TEXCOORD1.z;
    precise float _778 = fma(cb0._m5.y, fma(_313, _314, -0.039999999105930328369140625), 0.039999999105930328369140625);
    precise float _779 = fma(cb0._m5.y, fma(_313, _315, -0.039999999105930328369140625), 0.039999999105930328369140625);
    precise float _780 = fma(cb0._m5.y, fma(_313, _316, -0.039999999105930328369140625), 0.039999999105930328369140625);
    precise float _782 = fma(-cb0._m5.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _783 = _782 * _317;
    precise float _784 = _782 * _318;
    precise float _785 = _782 * _319;
    precise float _791 = fma(_191, _196, cb2._m0.x);
    precise float _792 = fma(_192, _196, cb2._m0.y);
    precise float _793 = fma(_193, _196, cb2._m0.z);
    vec3 _794 = vec3(_791, _792, _793);
    precise float _797 = inversesqrt(spvNMax(dp3_f32(_794, _794), 0.001000000047497451305389404296875));
    precise float _798 = _797 * _791;
    precise float _799 = _797 * _792;
    precise float _800 = _797 * _793;
    vec3 _801 = vec3(_770, _771, _772);
    precise float _805 = spvNClamp(dp3_f32(_801, cb2._m0), 0.0, 1.0);
    vec3 _806 = vec3(_798, _799, _800);
    precise float _808 = spvNClamp(dp3_f32(_801, _806), 0.0, 1.0);
    precise float _810 = spvNClamp(dp3_f32(cb2._m0, _806), 0.0, 1.0);
    precise float _811 = _810 * _810;
    precise float _815 = dp2_f32(vec2(_811), vec2(_457)) - 0.5;
    precise float _816 = 1.0 - _805;
    precise float _817 = _816 * _816;
    precise float _818 = _817 * _817;
    precise float _819 = _816 * _818;
    precise float _821 = abs(dp3_f32(_801, vec3(_197, _198, _199)));
    precise float _822 = 1.0 - _821;
    precise float _823 = _822 * _822;
    precise float _824 = _823 * _823;
    precise float _825 = _822 * _824;
    precise float _827 = fma(_815, _825, 1.0) * fma(_815, _819, 1.0);
    precise float _828 = _457 * _457;
    precise float _829 = spvNMax(_828, 0.00200000009499490261077880859375);
    precise float _830 = 1.0 - _829;
    precise float _833 = _821 * fma(_805, _830, _829);
    precise float _835 = fma(_805, fma(_821, _830, _829), _833) + 9.9999997473787516355514526367188e-06;
    precise float _836 = 0.5 / _835;
    precise float _837 = _829 * _829;
    precise float _840 = fma(fma(_808, _837, -_808), _808, 1.0);
    precise float _841 = _837 * 0.3183098733425140380859375;
    precise float _843 = _841 / fma(_840, _840, 1.0000000116860974230803549289703e-07);
    precise float _844 = _836 * _843;
    precise float _845 = _844 * 3.1415927410125732421875;
    precise float _846 = _805 * _827;
    precise float _847 = _805 * _845;
    precise float _850 = 1.0 / fma(_829, _829, 1.0);
    vec3 _851 = vec3(_778, _779, _780);
    precise float _855 = spvNMax(_847, 0.0) * ((dp3_f32(_851, _851) == 0.0) ? 0.0 : 1.0);
    precise float _856 = cb0._m5.x - _782;
    precise float _857 = _856 + 1.0;
    precise float _858 = spvNClamp(_857, 0.0, 1.0);
    precise float _862 = _480 * _855;
    precise float _863 = _481 * _855;
    precise float _864 = _482 * _855;
    precise float _865 = 1.0 - _810;
    precise float _866 = _865 * _865;
    precise float _867 = _866 * _866;
    precise float _868 = _865 * _867;
    precise float _869 = 1.0 - _778;
    precise float _870 = 1.0 - _779;
    precise float _871 = 1.0 - _780;
    precise float _875 = fma(_869, _868, _778) * _862;
    precise float _876 = fma(_870, _868, _779) * _863;
    precise float _877 = fma(_871, _868, _780) * _864;
    precise float _881 = _767 * _850;
    precise float _882 = _766 * _850;
    precise float _883 = _765 * _850;
    precise float _884 = _858 - _778;
    precise float _885 = _858 - _779;
    precise float _886 = _858 - _780;
    SV_Target.x = fma(_881, fma(_825, _884, _778), fma(_783, fma(_480, _846, spvNMax(_583, 0.0)), _875));
    SV_Target.y = fma(_882, fma(_825, _885, _779), fma(_784, fma(_481, _846, spvNMax(_584, 0.0)), _876));
    SV_Target.z = fma(_883, fma(_825, _886, _780), fma(_785, fma(_482, _846, spvNMax(_585, 0.0)), _877));
    SV_Target.w = 1.0;
}

