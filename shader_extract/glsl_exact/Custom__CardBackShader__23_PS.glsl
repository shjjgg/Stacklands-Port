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

layout(set = 0, binding = 7, std140) uniform cb7_buf
{
    uvec4 m;
} cb7;

layout(set = 0, binding = 8, std140) uniform cb8_buf
{
    vec4 m[4096];
} cb8;

layout(set = 0, binding = 9) uniform sampler s0;
layout(set = 0, binding = 10) uniform sampler s1;
layout(set = 0, binding = 11) uniform sampler s2;
layout(set = 0, binding = 12) uniform sampler s3;
layout(set = 0, binding = 13) uniform texture2D t0;
layout(set = 0, binding = 14) uniform texture2D t1;
layout(set = 0, binding = 15) uniform textureCube t2;
layout(set = 0, binding = 16) uniform textureCube t3;
layout(set = 0, binding = 17) uniform texture3D t4;

layout(location = 1, component = 0) in vec2 TEXCOORD;
layout(location = 2, component = 0) in vec3 TEXCOORD1;
layout(location = 3, component = 0) in vec3 TEXCOORD2;
layout(location = 4, component = 0) in vec3 TEXCOORD3;
layout(location = 5, component = 0) in vec4 TEXCOORD5;
layout(location = 7, component = 0) flat in uint SV_InstanceID;
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
    precise float _160 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _160));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _143 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _143)));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _131 = a.x * b.x;
    return fma(a.y, b.y, _131);
}

void main()
{
    precise float _190 = cb1._m4.x - TEXCOORD2.x;
    precise float _191 = cb1._m4.y - TEXCOORD2.y;
    precise float _192 = cb1._m4.z - TEXCOORD2.z;
    vec3 _193 = vec3(_190, _191, _192);
    precise float _195 = inversesqrt(dp3_f32(_193, _193));
    precise float _196 = _190 * _195;
    precise float _197 = _191 * _195;
    precise float _198 = _192 * _195;
    vec4 _208 = texture(sampler2D(t0, s3), vec2(TEXCOORD.x, TEXCOORD.y));
    precise float _218 = _208.x * cb0._m6.x;
    precise float _219 = _208.y * cb0._m6.y;
    precise float _220 = _208.z * cb0._m6.z;
    precise float _221 = TEXCOORD.y + TEXCOORD.x;
    precise float _222 = _221 * 10.0;
    precise float _225 = roundEven(fract(_222)) + 0.800000011920928955078125;
    precise float _226 = spvNMin(_225, 1.0);
    precise float _227 = _226 * _218;
    precise float _228 = _226 * _219;
    precise float _229 = _226 * _220;
    bool _237 = (((TEXCOORD.x < 0.13677684962749481201171875) || (TEXCOORD.x > 0.863223135471343994140625)) || (TEXCOORD.y < 0.0500000007450580596923828125)) || (TEXCOORD.y > 0.949999988079071044921875);
    float _238 = _237 ? 0.0 : _227;
    float _239 = _237 ? 0.0 : _228;
    float _240 = _237 ? 0.0 : _229;
    float _250 = dp3_f32(_193, vec3(cb4._m9.z, cb4._m10.z, cb4._m11.z));
    precise float _257 = TEXCOORD2.x - cb3._m25.x;
    precise float _258 = TEXCOORD2.y - cb3._m25.y;
    precise float _259 = TEXCOORD2.z - cb3._m25.z;
    vec3 _260 = vec3(_257, _258, _259);
    precise float _263 = sqrt(dp3_f32(_260, _260)) - _250;
    uint _273 = (SV_InstanceID + cb7.m.x) * 7u;
    bool _277 = cb6._m0.x == 1.0;
    float _355;
    float _356;
    float _357;
    float _358;
    if (_277)
    {
        bool _286 = cb6._m0.y == 1.0;
        precise float _292 = TEXCOORD2.y * cb6._m3.x;
        precise float _293 = TEXCOORD2.y * cb6._m3.y;
        precise float _294 = TEXCOORD2.y * cb6._m3.z;
        precise float _316 = fma(cb6._m5.x, TEXCOORD2.z, fma(cb6._m1.x, TEXCOORD2.x, _292)) + cb6._m7.x;
        precise float _317 = fma(cb6._m5.y, TEXCOORD2.z, fma(cb6._m1.y, TEXCOORD2.x, _293)) + cb6._m7.y;
        precise float _318 = fma(cb6._m5.z, TEXCOORD2.z, fma(cb6._m1.z, TEXCOORD2.x, _294)) + cb6._m7.z;
        precise float _327 = (_286 ? _316 : TEXCOORD2.x) - cb6._m11.x;
        precise float _328 = (_286 ? _317 : TEXCOORD2.y) - cb6._m11.y;
        precise float _329 = (_286 ? _318 : TEXCOORD2.z) - cb6._m11.z;
        precise float _335 = _327 * cb6._m9.x;
        precise float _336 = _328 * cb6._m9.y;
        precise float _337 = _329 * cb6._m9.z;
        vec4 _346 = texture(sampler3D(t4, s1), vec3(spvNMax(fma(cb6._m0.z, 0.5, 0.75), fma(_335, 0.25, 0.75)), _336, _337));
        _355 = _346.w;
        _356 = _346.z;
        _357 = _346.y;
        _358 = _346.x;
    }
    else
    {
        uint _351 = _273 + 6u;
        _355 = cb8.m[_351].w;
        _356 = cb8.m[_351].w;
        _357 = cb8.m[_351].w;
        _358 = cb8.m[_351].w;
    }
    precise float _372 = TEXCOORD5.x / TEXCOORD5.w;
    precise float _373 = TEXCOORD5.y / TEXCOORD5.w;
    vec4 _378 = texture(sampler2D(t1, s2), vec2(_372, _373));
    float _379 = _378.x;
    precise float _380 = spvNClamp(dp4_f32(vec4(_358, _357, _356, _355), cb2._m47), 0.0, 1.0) - _379;
    precise float _381 = fma(spvNClamp(fma(fma(cb3._m26, _263, _250), cb3._m24.z, cb3._m24.w), 0.0, 1.0), _380, _379);
    precise float _384 = 1.0 - cb0._m5.x;
    precise float _385 = -_196;
    precise float _386 = -_197;
    precise float _387 = -_198;
    vec3 _395 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    float _396 = dp3_f32(vec3(_385, _386, _387), _395);
    precise float _397 = _396 + _396;
    precise float _398 = -_397;
    precise float _399 = fma(TEXCOORD1.x, _398, _385);
    precise float _400 = fma(TEXCOORD1.y, _398, _386);
    precise float _401 = fma(TEXCOORD1.z, _398, _387);
    precise float _407 = _381 * cb0._m2.x;
    precise float _408 = _381 * cb0._m2.y;
    precise float _409 = _381 * cb0._m2.z;
    vec4 _410 = vec4(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z, 1.0);
    float _503;
    float _504;
    float _505;
    if (_277)
    {
        bool _416 = cb6._m0.y == 1.0;
        precise float _422 = TEXCOORD2.y * cb6._m3.x;
        precise float _423 = TEXCOORD2.y * cb6._m3.y;
        precise float _424 = TEXCOORD2.y * cb6._m3.z;
        precise float _446 = fma(cb6._m5.x, TEXCOORD2.z, fma(cb6._m1.x, TEXCOORD2.x, _422)) + cb6._m7.x;
        precise float _447 = fma(cb6._m5.y, TEXCOORD2.z, fma(cb6._m1.y, TEXCOORD2.x, _423)) + cb6._m7.y;
        precise float _448 = fma(cb6._m5.z, TEXCOORD2.z, fma(cb6._m1.z, TEXCOORD2.x, _424)) + cb6._m7.z;
        precise float _457 = (_416 ? _446 : TEXCOORD2.x) - cb6._m11.x;
        precise float _458 = (_416 ? _447 : TEXCOORD2.y) - cb6._m11.y;
        precise float _459 = (_416 ? _448 : TEXCOORD2.z) - cb6._m11.z;
        precise float _465 = _457 * cb6._m9.x;
        precise float _466 = _458 * cb6._m9.y;
        precise float _467 = _459 * cb6._m9.z;
        precise float _468 = _465 * 0.25;
        precise float _471 = cb6._m0.z * 0.5;
        precise float _475 = spvNMin(fma(-cb6._m0.z, 0.5, 0.25), spvNMax(_468, _471));
        precise float _479 = _475 + 0.25;
        precise float _480 = _466 + 0.0;
        precise float _481 = _467 + 0.0;
        precise float _485 = _475 + 0.5;
        _503 = dp4_f32(texture(sampler3D(t4, s1), vec3(_485, _480, _481)), _410);
        _504 = dp4_f32(texture(sampler3D(t4, s1), vec3(_479, _480, _481)), _410);
        _505 = dp4_f32(texture(sampler3D(t4, s1), vec3(_475, _466, _467)), _410);
    }
    else
    {
        _503 = dp4_f32(cb8.m[_273 + 2u], _410);
        _504 = dp4_f32(cb8.m[_273 + 1u], _410);
        _505 = dp4_f32(cb8.m[_273], _410);
    }
    precise float _512 = _505 + TEXCOORD3.x;
    precise float _513 = _504 + TEXCOORD3.y;
    precise float _514 = _503 + TEXCOORD3.z;
    vec3 _522 = vec3(_399, _400, _401);
    float _571;
    float _572;
    float _573;
    if (cb5._m5 > 0.0)
    {
        precise float _526 = inversesqrt(dp3_f32(_522, _522));
        precise float _527 = _526 * _399;
        precise float _528 = _526 * _400;
        precise float _529 = _526 * _401;
        precise float _535 = cb5._m0.x - TEXCOORD2.x;
        precise float _536 = cb5._m0.y - TEXCOORD2.y;
        precise float _537 = cb5._m0.z - TEXCOORD2.z;
        precise float _538 = _535 / _527;
        precise float _539 = _536 / _528;
        precise float _540 = _537 / _529;
        precise float _546 = cb5._m2.x - TEXCOORD2.x;
        precise float _547 = cb5._m2.y - TEXCOORD2.y;
        precise float _548 = cb5._m2.z - TEXCOORD2.z;
        precise float _549 = _546 / _527;
        precise float _550 = _547 / _528;
        precise float _551 = _548 / _529;
        precise float _559 = spvNMin((_529 > 0.0) ? _540 : _551, spvNMin((_528 > 0.0) ? _539 : _550, (_527 > 0.0) ? _538 : _549));
        precise float _565 = TEXCOORD2.x - cb5._m4.x;
        precise float _566 = TEXCOORD2.y - cb5._m4.y;
        precise float _567 = TEXCOORD2.z - cb5._m4.z;
        _571 = fma(_529, _559, _567);
        _572 = fma(_528, _559, _566);
        _573 = fma(_527, _559, _565);
    }
    else
    {
        _571 = _401;
        _572 = _400;
        _573 = _399;
    }
    precise float _576 = fma(-_384, 0.699999988079071044921875, 1.7000000476837158203125) * _384;
    precise float _577 = _576 * 6.0;
    vec4 _583 = textureLod(samplerCube(t2, s0), vec3(_573, _572, _571), _577);
    float _584 = _583.x;
    float _585 = _583.y;
    float _586 = _583.z;
    precise float _588 = _583.w - 1.0;
    precise float _595 = log2(fma(cb5._m6.w, _588, 1.0)) * cb5._m6.y;
    precise float _599 = exp2(_595) * cb5._m6.x;
    precise float _600 = _584 * _599;
    precise float _601 = _585 * _599;
    precise float _602 = _586 * _599;
    float _694;
    float _695;
    float _696;
    if (cb5._m3 < 0.999989986419677734375)
    {
        float _659;
        float _660;
        float _661;
        if (cb5._m12 > 0.0)
        {
            precise float _614 = inversesqrt(dp3_f32(_522, _522));
            precise float _615 = _614 * _399;
            precise float _616 = _614 * _400;
            precise float _617 = _614 * _401;
            precise float _623 = cb5._m7.x - TEXCOORD2.x;
            precise float _624 = cb5._m7.y - TEXCOORD2.y;
            precise float _625 = cb5._m7.z - TEXCOORD2.z;
            precise float _626 = _623 / _615;
            precise float _627 = _624 / _616;
            precise float _628 = _625 / _617;
            precise float _634 = cb5._m9.x - TEXCOORD2.x;
            precise float _635 = cb5._m9.y - TEXCOORD2.y;
            precise float _636 = cb5._m9.z - TEXCOORD2.z;
            precise float _637 = _634 / _615;
            precise float _638 = _635 / _616;
            precise float _639 = _636 / _617;
            precise float _647 = spvNMin((_617 > 0.0) ? _628 : _639, spvNMin((_616 > 0.0) ? _627 : _638, (_615 > 0.0) ? _626 : _637));
            precise float _653 = TEXCOORD2.x - cb5._m11.x;
            precise float _654 = TEXCOORD2.y - cb5._m11.y;
            precise float _655 = TEXCOORD2.z - cb5._m11.z;
            _659 = fma(_617, _647, _655);
            _660 = fma(_616, _647, _654);
            _661 = fma(_615, _647, _653);
        }
        else
        {
            _659 = _401;
            _660 = _400;
            _661 = _399;
        }
        vec4 _665 = textureLod(samplerCube(t3, s0), vec3(_661, _660, _659), _577);
        precise float _670 = _665.w - 1.0;
        precise float _677 = log2(fma(cb5._m13.w, _670, 1.0)) * cb5._m13.y;
        precise float _681 = exp2(_677) * cb5._m13.x;
        precise float _682 = _665.x * _681;
        precise float _683 = _665.y * _681;
        precise float _684 = _665.z * _681;
        _694 = fma(cb5._m3, fma(_599, _586, -_684), _684);
        _695 = fma(cb5._m3, fma(_599, _585, -_683), _683);
        _696 = fma(cb5._m3, fma(_599, _584, -_682), _682);
    }
    else
    {
        _694 = _602;
        _695 = _601;
        _696 = _600;
    }
    precise float _698 = inversesqrt(dp3_f32(_395, _395));
    precise float _699 = _698 * TEXCOORD1.x;
    precise float _700 = _698 * TEXCOORD1.y;
    precise float _701 = _698 * TEXCOORD1.z;
    precise float _702 = _238 - 0.039999999105930328369140625;
    precise float _703 = _239 - 0.039999999105930328369140625;
    precise float _704 = _240 - 0.039999999105930328369140625;
    precise float _707 = fma(cb0._m5.y, _702, 0.039999999105930328369140625);
    precise float _708 = fma(cb0._m5.y, _703, 0.039999999105930328369140625);
    precise float _709 = fma(cb0._m5.y, _704, 0.039999999105930328369140625);
    precise float _711 = fma(-cb0._m5.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _712 = _711 * _238;
    precise float _713 = _711 * _239;
    precise float _714 = _711 * _240;
    precise float _720 = fma(_190, _195, cb2._m0.x);
    precise float _721 = fma(_191, _195, cb2._m0.y);
    precise float _722 = fma(_192, _195, cb2._m0.z);
    vec3 _723 = vec3(_720, _721, _722);
    precise float _726 = inversesqrt(spvNMax(dp3_f32(_723, _723), 0.001000000047497451305389404296875));
    precise float _727 = _720 * _726;
    precise float _728 = _721 * _726;
    precise float _729 = _722 * _726;
    vec3 _730 = vec3(_699, _700, _701);
    precise float _734 = spvNClamp(dp3_f32(_730, cb2._m0), 0.0, 1.0);
    vec3 _735 = vec3(_727, _728, _729);
    precise float _737 = spvNClamp(dp3_f32(_730, _735), 0.0, 1.0);
    precise float _739 = spvNClamp(dp3_f32(cb2._m0, _735), 0.0, 1.0);
    precise float _740 = _739 * _739;
    precise float _744 = dp2_f32(vec2(_740), vec2(_384)) - 0.5;
    precise float _745 = 1.0 - _734;
    precise float _746 = _745 * _745;
    precise float _747 = _746 * _746;
    precise float _748 = _745 * _747;
    precise float _750 = abs(dp3_f32(_730, vec3(_196, _197, _198)));
    precise float _751 = 1.0 - _750;
    precise float _752 = _751 * _751;
    precise float _753 = _752 * _752;
    precise float _754 = _751 * _753;
    precise float _756 = fma(_744, _754, 1.0) * fma(_744, _748, 1.0);
    precise float _757 = _734 * _756;
    precise float _758 = _384 * _384;
    precise float _759 = spvNMax(_758, 0.00200000009499490261077880859375);
    precise float _760 = 1.0 - _759;
    precise float _763 = _750 * fma(_734, _760, _759);
    precise float _765 = fma(_734, fma(_750, _760, _759), _763) + 9.9999997473787516355514526367188e-06;
    precise float _766 = 0.5 / _765;
    precise float _767 = _759 * _759;
    precise float _770 = fma(fma(_737, _767, -_737), _737, 1.0);
    precise float _771 = _767 * 0.3183098733425140380859375;
    precise float _773 = _771 / fma(_770, _770, 1.0000000116860974230803549289703e-07);
    precise float _774 = _773 * _766;
    precise float _775 = _774 * 3.1415927410125732421875;
    precise float _776 = _734 * _775;
    precise float _779 = 1.0 / fma(_759, _759, 1.0);
    vec3 _780 = vec3(_707, _708, _709);
    precise float _784 = ((dp3_f32(_780, _780) == 0.0) ? 0.0 : 1.0) * spvNMax(_776, 0.0);
    precise float _785 = cb0._m5.x - _711;
    precise float _786 = _785 + 1.0;
    precise float _787 = spvNClamp(_786, 0.0, 1.0);
    precise float _791 = _407 * _784;
    precise float _792 = _408 * _784;
    precise float _793 = _409 * _784;
    precise float _794 = 1.0 - _739;
    precise float _795 = _794 * _794;
    precise float _796 = _795 * _795;
    precise float _797 = _794 * _796;
    precise float _798 = 1.0 - _707;
    precise float _799 = 1.0 - _708;
    precise float _800 = 1.0 - _709;
    precise float _804 = _791 * fma(_798, _797, _707);
    precise float _805 = _792 * fma(_799, _797, _708);
    precise float _806 = _793 * fma(_800, _797, _709);
    precise float _810 = _696 * _779;
    precise float _811 = _695 * _779;
    precise float _812 = _694 * _779;
    precise float _813 = _787 - _707;
    precise float _814 = _787 - _708;
    precise float _815 = _787 - _709;
    SV_Target.x = fma(_810, fma(_754, _813, _707), fma(_712, fma(_407, _757, spvNMax(_512, 0.0)), _804));
    SV_Target.y = fma(_811, fma(_754, _814, _708), fma(_713, fma(_408, _757, spvNMax(_513, 0.0)), _805));
    SV_Target.z = fma(_812, fma(_754, _815, _709), fma(_714, fma(_409, _757, spvNMax(_514, 0.0)), _806));
    SV_Target.w = 1.0;
}

