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
    uvec4 _m10;
    vec3 _m11;
    uint _m12;
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
    precise float _166 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _166));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _155 = a.x * b.x;
    return fma(a.y, b.y, _155);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _137 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _137)));
}

void main()
{
    precise float _190 = cb1._m4.x - TEXCOORD2.x;
    precise float _191 = cb1._m4.y - TEXCOORD2.y;
    precise float _192 = cb1._m4.z - TEXCOORD2.z;
    vec3 _193 = vec3(_190, _191, _192);
    precise float _195 = inversesqrt(dp3_f32(_193, _193));
    precise float _196 = _195 * _190;
    precise float _197 = _195 * _191;
    precise float _198 = _195 * _192;
    precise float _201 = TEXCOORD.y * 150.0;
    precise float _204 = sin(roundEven(_201)) * 43758.546875;
    precise float _208 = fma(fract(_204), 0.004999999888241291046142578125, TEXCOORD.x);
    precise float _209 = _208 * 150.0;
    precise float _212 = sin(roundEven(_209)) * 43758.546875;
    precise float _214 = fma(fract(_212), 0.004999999888241291046142578125, TEXCOORD.y);
    precise float _223 = abs(dFdx(_208)) + abs(dFdy(_208));
    precise float _224 = abs(dFdx(_214)) + abs(dFdy(_214));
    precise float _225 = TEXCOORD.x - 0.5;
    precise float _226 = TEXCOORD.y - 0.4000000059604644775390625;
    precise float _227 = fma(_225, 1.75, 0.5);
    precise float _228 = fma(_226, 1.75, 0.4000000059604644775390625);
    precise float _240 = float(_227 <= 1.0) * float(_227 >= 0.0);
    precise float _241 = float(_228 >= 0.0) * _240;
    vec4 _247 = texture(sampler2D(t0, s3), vec2(_227, _228));
    float _248 = _247.x;
    float _249 = _247.w;
    precise float _251 = fma(-_241, float(_228 <= 1.0), 1.0);
    precise float _255 = fma(_251, -_249, _249);
    precise float _256 = TEXCOORD2.x - cb1._m4.x;
    precise float _257 = TEXCOORD2.y - cb1._m4.y;
    precise float _258 = TEXCOORD2.z - cb1._m4.z;
    vec3 _259 = vec3(_256, _257, _258);
    precise float _261 = inversesqrt(dp3_f32(_259, _259));
    precise float _262 = _261 * _256;
    precise float _263 = _261 * _258;
    precise float _264 = TEXCOORD.y + TEXCOORD.x;
    precise float _265 = TEXCOORD.y + TEXCOORD.y;
    precise float _269 = fma(-_263, 5.0, _265);
    precise float _270 = _269 * 10.0;
    precise float _272 = fma(sin(_270), 0.0199999995529651641845703125, fma(-_262, 5.0, _264));
    precise float _273 = _272 * 30.0;
    vec4 _280 = texture(sampler2D(t1, s4), vec2(_272, fma(cos(_273), 0.0199999995529651641845703125, _269)));
    vec2 _284 = vec2(fma(_225, 1.75, 0.0), fma(_226, 1.75, -0.0999999940395355224609375));
    precise float _287 = sqrt(dp2_f32(_284, _284)) - 0.400390625;
    precise float _288 = _287 / _223;
    precise float _290 = 1.0 - spvNClamp(_288, 0.0, 1.0);
    precise float _302 = cb0._m8.x - cb0._m6.x;
    precise float _303 = cb0._m8.y - cb0._m6.y;
    precise float _304 = cb0._m8.z - cb0._m6.z;
    precise float _305 = fma(_290, _302, cb0._m6.x);
    precise float _306 = fma(_290, _303, cb0._m6.y);
    precise float _307 = fma(_290, _304, cb0._m6.z);
    precise float _308 = 1.0 - fma(_251, -_248, _248);
    precise float _314 = cb0._m11.x - cb0._m6.x;
    precise float _315 = cb0._m11.y - cb0._m6.y;
    precise float _316 = cb0._m11.z - cb0._m6.z;
    precise float _320 = fma(_308, _314, cb0._m6.x) - _305;
    precise float _321 = fma(_308, _315, cb0._m6.y) - _306;
    precise float _322 = fma(_308, _316, cb0._m6.z) - _307;
    precise float _326 = _208 - 0.1167768537998199462890625;
    precise float _327 = _326 / _223;
    precise float _329 = 0.88322317600250244140625 - _208;
    precise float _330 = _329 / _223;
    precise float _332 = spvNClamp(_330, 0.0, 1.0) * spvNClamp(_327, 0.0, 1.0);
    precise float _333 = _214 - 0.02999999932944774627685546875;
    precise float _334 = _333 / _224;
    precise float _336 = _332 * spvNClamp(_334, 0.0, 1.0);
    precise float _337 = 0.9700000286102294921875 - _214;
    precise float _338 = _337 / _224;
    precise float _340 = _336 * spvNClamp(_338, 0.0, 1.0);
    precise float _341 = fma(_280.x, 0.5, fma(_255, _320, _305));
    precise float _342 = fma(_280.y, 0.5, fma(_255, _321, _306));
    precise float _343 = fma(_280.z, 0.5, fma(_255, _322, _307));
    precise float _344 = _340 * _341;
    precise float _345 = _340 * _342;
    precise float _346 = _340 * _343;
    float _356 = dp3_f32(_193, vec3(cb4._m9.z, cb4._m10.z, cb4._m11.z));
    precise float _363 = TEXCOORD2.x - cb3._m25.x;
    precise float _364 = TEXCOORD2.y - cb3._m25.y;
    precise float _365 = TEXCOORD2.z - cb3._m25.z;
    vec3 _366 = vec3(_363, _364, _365);
    precise float _369 = sqrt(dp3_f32(_366, _366)) - _356;
    bool _382 = cb6._m0.x == 1.0;
    float _454;
    float _455;
    float _456;
    float _457;
    if (_382)
    {
        bool _389 = cb6._m0.y == 1.0;
        precise float _395 = TEXCOORD2.y * cb6._m3.x;
        precise float _396 = TEXCOORD2.y * cb6._m3.y;
        precise float _397 = TEXCOORD2.y * cb6._m3.z;
        precise float _419 = fma(cb6._m5.x, TEXCOORD2.z, fma(cb6._m1.x, TEXCOORD2.x, _395)) + cb6._m7.x;
        precise float _420 = fma(cb6._m5.y, TEXCOORD2.z, fma(cb6._m1.y, TEXCOORD2.x, _396)) + cb6._m7.y;
        precise float _421 = fma(cb6._m5.z, TEXCOORD2.z, fma(cb6._m1.z, TEXCOORD2.x, _397)) + cb6._m7.z;
        precise float _430 = (_389 ? _419 : TEXCOORD2.x) - cb6._m11.x;
        precise float _431 = (_389 ? _420 : TEXCOORD2.y) - cb6._m11.y;
        precise float _432 = (_389 ? _421 : TEXCOORD2.z) - cb6._m11.z;
        precise float _438 = _430 * cb6._m9.x;
        precise float _439 = _431 * cb6._m9.y;
        precise float _440 = _432 * cb6._m9.z;
        vec4 _449 = texture(sampler3D(t5, s1), vec3(spvNMax(fma(_438, 0.25, 0.75), fma(cb6._m0.z, 0.5, 0.75)), _439, _440));
        _454 = _449.w;
        _455 = _449.z;
        _456 = _449.y;
        _457 = _449.x;
    }
    else
    {
        _454 = 1.0;
        _455 = 1.0;
        _456 = 1.0;
        _457 = 1.0;
    }
    precise float _471 = TEXCOORD5.x / TEXCOORD5.w;
    precise float _472 = TEXCOORD5.y / TEXCOORD5.w;
    vec4 _477 = texture(sampler2D(t2, s2), vec2(_471, _472));
    float _478 = _477.x;
    precise float _479 = spvNClamp(dp4_f32(vec4(_457, _456, _455, _454), cb2._m47), 0.0, 1.0) - _478;
    precise float _480 = fma(spvNClamp(fma(fma(cb3._m26, _369, _356), cb3._m24.z, cb3._m24.w), 0.0, 1.0), _479, _478);
    precise float _483 = 1.0 - cb0._m5.x;
    precise float _484 = -_196;
    precise float _485 = -_197;
    precise float _486 = -_198;
    vec3 _494 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    float _495 = dp3_f32(vec3(_484, _485, _486), _494);
    precise float _496 = _495 + _495;
    precise float _497 = -_496;
    precise float _498 = fma(TEXCOORD1.x, _497, _484);
    precise float _499 = fma(TEXCOORD1.y, _497, _485);
    precise float _500 = fma(TEXCOORD1.z, _497, _486);
    precise float _506 = _480 * cb0._m2.x;
    precise float _507 = _480 * cb0._m2.y;
    precise float _508 = _480 * cb0._m2.z;
    vec4 _509 = vec4(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z, 1.0);
    float _600;
    float _601;
    float _602;
    if (_382)
    {
        bool _515 = cb6._m0.y == 1.0;
        precise float _521 = TEXCOORD2.y * cb6._m3.x;
        precise float _522 = TEXCOORD2.y * cb6._m3.y;
        precise float _523 = TEXCOORD2.y * cb6._m3.z;
        precise float _545 = fma(cb6._m5.x, TEXCOORD2.z, fma(cb6._m1.x, TEXCOORD2.x, _521)) + cb6._m7.x;
        precise float _546 = fma(cb6._m5.y, TEXCOORD2.z, fma(cb6._m1.y, TEXCOORD2.x, _522)) + cb6._m7.y;
        precise float _547 = fma(cb6._m5.z, TEXCOORD2.z, fma(cb6._m1.z, TEXCOORD2.x, _523)) + cb6._m7.z;
        precise float _556 = (_515 ? _545 : TEXCOORD2.x) - cb6._m11.x;
        precise float _557 = (_515 ? _546 : TEXCOORD2.y) - cb6._m11.y;
        precise float _558 = (_515 ? _547 : TEXCOORD2.z) - cb6._m11.z;
        precise float _564 = _556 * cb6._m9.x;
        precise float _565 = _557 * cb6._m9.y;
        precise float _566 = _558 * cb6._m9.z;
        precise float _567 = _564 * 0.25;
        precise float _570 = cb6._m0.z * 0.5;
        precise float _574 = spvNMin(fma(-cb6._m0.z, 0.5, 0.25), spvNMax(_567, _570));
        precise float _578 = _574 + 0.25;
        precise float _579 = _565 + 0.0;
        precise float _580 = _566 + 0.0;
        precise float _584 = _574 + 0.5;
        _600 = dp4_f32(texture(sampler3D(t5, s1), vec3(_584, _579, _580)), _509);
        _601 = dp4_f32(texture(sampler3D(t5, s1), vec3(_578, _579, _580)), _509);
        _602 = dp4_f32(texture(sampler3D(t5, s1), vec3(_574, _565, _566)), _509);
    }
    else
    {
        _600 = dp4_f32(cb2._m42, _509);
        _601 = dp4_f32(cb2._m41, _509);
        _602 = dp4_f32(cb2._m40, _509);
    }
    precise float _609 = _602 + TEXCOORD3.x;
    precise float _610 = _601 + TEXCOORD3.y;
    precise float _611 = _600 + TEXCOORD3.z;
    vec3 _619 = vec3(_498, _499, _500);
    float _668;
    float _669;
    float _670;
    if (cb5._m5 > 0.0)
    {
        precise float _623 = inversesqrt(dp3_f32(_619, _619));
        precise float _624 = _623 * _498;
        precise float _625 = _623 * _499;
        precise float _626 = _623 * _500;
        precise float _632 = cb5._m0.x - TEXCOORD2.x;
        precise float _633 = cb5._m0.y - TEXCOORD2.y;
        precise float _634 = cb5._m0.z - TEXCOORD2.z;
        precise float _635 = _632 / _624;
        precise float _636 = _633 / _625;
        precise float _637 = _634 / _626;
        precise float _643 = cb5._m2.x - TEXCOORD2.x;
        precise float _644 = cb5._m2.y - TEXCOORD2.y;
        precise float _645 = cb5._m2.z - TEXCOORD2.z;
        precise float _646 = _643 / _624;
        precise float _647 = _644 / _625;
        precise float _648 = _645 / _626;
        precise float _656 = spvNMin((_626 > 0.0) ? _637 : _648, spvNMin((_625 > 0.0) ? _636 : _647, (_624 > 0.0) ? _635 : _646));
        precise float _662 = TEXCOORD2.x - cb5._m4.x;
        precise float _663 = TEXCOORD2.y - cb5._m4.y;
        precise float _664 = TEXCOORD2.z - cb5._m4.z;
        _668 = fma(_626, _656, _664);
        _669 = fma(_625, _656, _663);
        _670 = fma(_624, _656, _662);
    }
    else
    {
        _668 = _500;
        _669 = _499;
        _670 = _498;
    }
    precise float _673 = fma(-_483, 0.699999988079071044921875, 1.7000000476837158203125) * _483;
    precise float _674 = _673 * 6.0;
    vec4 _680 = textureLod(samplerCube(t3, s0), vec3(_670, _669, _668), _674);
    float _681 = _680.x;
    float _682 = _680.y;
    float _683 = _680.z;
    precise float _685 = _680.w - 1.0;
    precise float _692 = log2(fma(cb5._m6.w, _685, 1.0)) * cb5._m6.y;
    precise float _696 = exp2(_692) * cb5._m6.x;
    precise float _697 = _681 * _696;
    precise float _698 = _682 * _696;
    precise float _699 = _683 * _696;
    float _791;
    float _792;
    float _793;
    if (cb5._m3 < 0.999989986419677734375)
    {
        float _756;
        float _757;
        float _758;
        if (cb5._m12 > 0.0)
        {
            precise float _711 = inversesqrt(dp3_f32(_619, _619));
            precise float _712 = _498 * _711;
            precise float _713 = _499 * _711;
            precise float _714 = _500 * _711;
            precise float _720 = cb5._m7.x - TEXCOORD2.x;
            precise float _721 = cb5._m7.y - TEXCOORD2.y;
            precise float _722 = cb5._m7.z - TEXCOORD2.z;
            precise float _723 = _720 / _712;
            precise float _724 = _721 / _713;
            precise float _725 = _722 / _714;
            precise float _731 = cb5._m9.x - TEXCOORD2.x;
            precise float _732 = cb5._m9.y - TEXCOORD2.y;
            precise float _733 = cb5._m9.z - TEXCOORD2.z;
            precise float _734 = _731 / _712;
            precise float _735 = _732 / _713;
            precise float _736 = _733 / _714;
            precise float _744 = spvNMin((_714 > 0.0) ? _725 : _736, spvNMin((_713 > 0.0) ? _724 : _735, (_712 > 0.0) ? _723 : _734));
            precise float _750 = TEXCOORD2.x - cb5._m11.x;
            precise float _751 = TEXCOORD2.y - cb5._m11.y;
            precise float _752 = TEXCOORD2.z - cb5._m11.z;
            _756 = fma(_714, _744, _752);
            _757 = fma(_713, _744, _751);
            _758 = fma(_712, _744, _750);
        }
        else
        {
            _756 = _500;
            _757 = _499;
            _758 = _498;
        }
        vec4 _762 = textureLod(samplerCube(t4, s0), vec3(_758, _757, _756), _674);
        precise float _767 = _762.w - 1.0;
        precise float _774 = log2(fma(cb5._m13.w, _767, 1.0)) * cb5._m13.y;
        precise float _778 = exp2(_774) * cb5._m13.x;
        precise float _779 = _762.x * _778;
        precise float _780 = _762.y * _778;
        precise float _781 = _762.z * _778;
        _791 = fma(cb5._m3, fma(_696, _683, -_781), _781);
        _792 = fma(cb5._m3, fma(_696, _682, -_780), _780);
        _793 = fma(cb5._m3, fma(_696, _681, -_779), _779);
    }
    else
    {
        _791 = _699;
        _792 = _698;
        _793 = _697;
    }
    precise float _795 = inversesqrt(dp3_f32(_494, _494));
    precise float _796 = _795 * TEXCOORD1.x;
    precise float _797 = _795 * TEXCOORD1.y;
    precise float _798 = _795 * TEXCOORD1.z;
    precise float _804 = fma(cb0._m5.y, fma(_340, _341, -0.039999999105930328369140625), 0.039999999105930328369140625);
    precise float _805 = fma(cb0._m5.y, fma(_340, _342, -0.039999999105930328369140625), 0.039999999105930328369140625);
    precise float _806 = fma(cb0._m5.y, fma(_340, _343, -0.039999999105930328369140625), 0.039999999105930328369140625);
    precise float _808 = fma(-cb0._m5.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _809 = _808 * _344;
    precise float _810 = _808 * _345;
    precise float _811 = _808 * _346;
    precise float _817 = fma(_190, _195, cb2._m0.x);
    precise float _818 = fma(_191, _195, cb2._m0.y);
    precise float _819 = fma(_192, _195, cb2._m0.z);
    vec3 _820 = vec3(_817, _818, _819);
    precise float _823 = inversesqrt(spvNMax(dp3_f32(_820, _820), 0.001000000047497451305389404296875));
    precise float _824 = _823 * _817;
    precise float _825 = _823 * _818;
    precise float _826 = _823 * _819;
    vec3 _827 = vec3(_796, _797, _798);
    precise float _831 = spvNClamp(dp3_f32(_827, cb2._m0), 0.0, 1.0);
    vec3 _832 = vec3(_824, _825, _826);
    precise float _834 = spvNClamp(dp3_f32(_827, _832), 0.0, 1.0);
    precise float _836 = spvNClamp(dp3_f32(cb2._m0, _832), 0.0, 1.0);
    precise float _837 = _836 * _836;
    precise float _841 = dp2_f32(vec2(_837), vec2(_483)) - 0.5;
    precise float _842 = 1.0 - _831;
    precise float _843 = _842 * _842;
    precise float _844 = _843 * _843;
    precise float _845 = _842 * _844;
    precise float _847 = abs(dp3_f32(_827, vec3(_196, _197, _198)));
    precise float _848 = 1.0 - _847;
    precise float _849 = _848 * _848;
    precise float _850 = _849 * _849;
    precise float _851 = _848 * _850;
    precise float _853 = fma(_841, _851, 1.0) * fma(_841, _845, 1.0);
    precise float _854 = _483 * _483;
    precise float _855 = spvNMax(_854, 0.00200000009499490261077880859375);
    precise float _856 = 1.0 - _855;
    precise float _859 = _847 * fma(_831, _856, _855);
    precise float _861 = fma(_831, fma(_847, _856, _855), _859) + 9.9999997473787516355514526367188e-06;
    precise float _862 = 0.5 / _861;
    precise float _863 = _855 * _855;
    precise float _866 = fma(fma(_834, _863, -_834), _834, 1.0);
    precise float _867 = _863 * 0.3183098733425140380859375;
    precise float _869 = _867 / fma(_866, _866, 1.0000000116860974230803549289703e-07);
    precise float _870 = _862 * _869;
    precise float _871 = _870 * 3.1415927410125732421875;
    precise float _872 = _831 * _853;
    precise float _873 = _831 * _871;
    precise float _876 = 1.0 / fma(_855, _855, 1.0);
    vec3 _877 = vec3(_804, _805, _806);
    precise float _881 = spvNMax(_873, 0.0) * ((dp3_f32(_877, _877) == 0.0) ? 0.0 : 1.0);
    precise float _882 = cb0._m5.x - _808;
    precise float _883 = _882 + 1.0;
    precise float _884 = spvNClamp(_883, 0.0, 1.0);
    precise float _888 = _506 * _881;
    precise float _889 = _507 * _881;
    precise float _890 = _508 * _881;
    precise float _891 = 1.0 - _836;
    precise float _892 = _891 * _891;
    precise float _893 = _892 * _892;
    precise float _894 = _891 * _893;
    precise float _895 = 1.0 - _804;
    precise float _896 = 1.0 - _805;
    precise float _897 = 1.0 - _806;
    precise float _901 = fma(_895, _894, _804) * _888;
    precise float _902 = fma(_896, _894, _805) * _889;
    precise float _903 = fma(_897, _894, _806) * _890;
    precise float _907 = _793 * _876;
    precise float _908 = _792 * _876;
    precise float _909 = _791 * _876;
    precise float _910 = _884 - _804;
    precise float _911 = _884 - _805;
    precise float _912 = _884 - _806;
    SV_Target.x = fma(_907, fma(_851, _910, _804), fma(_809, fma(_506, _872, spvNMax(_609, 0.0)), _901));
    SV_Target.y = fma(_908, fma(_851, _911, _805), fma(_810, fma(_507, _872, spvNMax(_610, 0.0)), _902));
    SV_Target.z = fma(_909, fma(_851, _912, _806), fma(_811, fma(_508, _872, spvNMax(_611, 0.0)), _903));
    SV_Target.w = 1.0;
}

