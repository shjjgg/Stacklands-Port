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
    vec4 _m6;
    vec4 _m7;
    vec4 _m8;
    vec4 _m9;
    vec3 _m10;
    uint _m11;
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
    vec4 _m8;
    vec4 _m9;
    vec4 _m10;
    vec4 _m11;
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
} cb5;

layout(set = 0, binding = 6) uniform sampler s0;
layout(set = 0, binding = 7) uniform samplerShadow s1;
layout(set = 0, binding = 8) uniform sampler s2;
layout(set = 0, binding = 9) uniform sampler s3;
layout(set = 0, binding = 10) uniform sampler s4;
layout(set = 0, binding = 11) uniform texture2D t0;
layout(set = 0, binding = 12) uniform texture2D t1;
layout(set = 0, binding = 13) uniform texture2D t2;
layout(set = 0, binding = 14) uniform texture3D t3;
layout(set = 0, binding = 15) uniform texture2D t4;

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
    precise float _133 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _133));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _116 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _116)));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _104 = a.x * b.x;
    return fma(a.y, b.y, _104);
}

void main()
{
    precise float _157 = cb2._m0.x - TEXCOORD2.x;
    precise float _158 = cb2._m0.y - TEXCOORD2.y;
    precise float _159 = cb2._m0.z - TEXCOORD2.z;
    vec3 _160 = vec3(_157, _158, _159);
    precise float _162 = inversesqrt(dp3_f32(_160, _160));
    precise float _163 = _162 * _157;
    precise float _164 = _162 * _158;
    precise float _165 = _162 * _159;
    precise float _172 = cb1._m4.x - TEXCOORD2.x;
    precise float _173 = cb1._m4.y - TEXCOORD2.y;
    precise float _174 = cb1._m4.z - TEXCOORD2.z;
    vec3 _175 = vec3(_172, _173, _174);
    precise float _177 = inversesqrt(dp3_f32(_175, _175));
    precise float _178 = _177 * _172;
    precise float _179 = _177 * _173;
    precise float _180 = _177 * _174;
    vec4 _190 = texture(sampler2D(t0, s4), vec2(TEXCOORD.x, TEXCOORD.y));
    precise float _200 = _190.x * cb0._m10.x;
    precise float _201 = _190.y * cb0._m10.y;
    precise float _202 = _190.z * cb0._m10.z;
    precise float _203 = TEXCOORD.y + TEXCOORD.x;
    precise float _204 = _203 * 10.0;
    precise float _207 = roundEven(fract(_204)) + 0.800000011920928955078125;
    precise float _208 = spvNMin(_207, 1.0);
    precise float _209 = _208 * _200;
    precise float _210 = _208 * _201;
    precise float _211 = _208 * _202;
    bool _219 = (TEXCOORD.y > 0.949999988079071044921875) || ((TEXCOORD.y < 0.0500000007450580596923828125) || ((TEXCOORD.x > 0.863223135471343994140625) || (TEXCOORD.x < 0.13677684962749481201171875)));
    float _220 = _219 ? 0.0 : _209;
    float _221 = _219 ? 0.0 : _210;
    float _222 = _219 ? 0.0 : _211;
    precise float _230 = TEXCOORD2.y * cb0._m6.x;
    precise float _231 = TEXCOORD2.y * cb0._m6.y;
    precise float _232 = TEXCOORD2.y * cb0._m6.z;
    precise float _233 = TEXCOORD2.y * cb0._m6.w;
    precise float _260 = fma(cb0._m7.x, TEXCOORD2.z, fma(cb0._m5.x, TEXCOORD2.x, _230)) + cb0._m8.x;
    precise float _261 = fma(cb0._m7.y, TEXCOORD2.z, fma(cb0._m5.y, TEXCOORD2.x, _231)) + cb0._m8.y;
    precise float _262 = fma(cb0._m7.z, TEXCOORD2.z, fma(cb0._m5.z, TEXCOORD2.x, _232)) + cb0._m8.z;
    precise float _263 = fma(cb0._m7.w, TEXCOORD2.z, fma(cb0._m5.w, TEXCOORD2.x, _233)) + cb0._m8.w;
    float _273 = dp3_f32(_175, vec3(cb4._m9.z, cb4._m10.z, cb4._m11.z));
    precise float _280 = TEXCOORD2.x - cb3._m25.x;
    precise float _281 = TEXCOORD2.y - cb3._m25.y;
    precise float _282 = TEXCOORD2.z - cb3._m25.z;
    vec3 _283 = vec3(_280, _281, _282);
    precise float _286 = sqrt(dp3_f32(_283, _283)) - _273;
    float _371;
    float _372;
    float _373;
    float _374;
    if (cb5._m0.x == 1.0)
    {
        bool _304 = cb5._m0.y == 1.0;
        precise float _310 = TEXCOORD2.y * cb5._m3.x;
        precise float _311 = TEXCOORD2.y * cb5._m3.y;
        precise float _312 = TEXCOORD2.y * cb5._m3.z;
        precise float _334 = fma(cb5._m5.x, TEXCOORD2.z, fma(cb5._m1.x, TEXCOORD2.x, _310)) + cb5._m7.x;
        precise float _335 = fma(cb5._m5.y, TEXCOORD2.z, fma(cb5._m1.y, TEXCOORD2.x, _311)) + cb5._m7.y;
        precise float _336 = fma(cb5._m5.z, TEXCOORD2.z, fma(cb5._m1.z, TEXCOORD2.x, _312)) + cb5._m7.z;
        precise float _345 = (_304 ? _334 : TEXCOORD2.x) - cb5._m11.x;
        precise float _346 = (_304 ? _335 : TEXCOORD2.y) - cb5._m11.y;
        precise float _347 = (_304 ? _336 : TEXCOORD2.z) - cb5._m11.z;
        precise float _353 = _345 * cb5._m9.x;
        precise float _354 = _346 * cb5._m9.y;
        precise float _355 = _347 * cb5._m9.z;
        vec4 _366 = texture(sampler3D(t3, s0), vec3(spvNMax(fma(_353, 0.25, 0.75), fma(cb5._m0.z, 0.5, 0.75)), _354, _355));
        _371 = _366.w;
        _372 = _366.z;
        _373 = _366.y;
        _374 = _366.x;
    }
    else
    {
        _371 = 1.0;
        _372 = 1.0;
        _373 = 1.0;
        _374 = 1.0;
    }
    precise float _386 = TEXCOORD2.y * cb3._m9.x;
    precise float _387 = TEXCOORD2.y * cb3._m9.y;
    precise float _388 = TEXCOORD2.y * cb3._m9.z;
    precise float _389 = TEXCOORD2.y * cb3._m9.w;
    precise float _416 = fma(cb3._m10.x, TEXCOORD2.z, fma(cb3._m8.x, TEXCOORD2.x, _386)) + cb3._m11.x;
    precise float _417 = fma(cb3._m10.y, TEXCOORD2.z, fma(cb3._m8.y, TEXCOORD2.x, _387)) + cb3._m11.y;
    precise float _418 = fma(cb3._m10.z, TEXCOORD2.z, fma(cb3._m8.z, TEXCOORD2.x, _388)) + cb3._m11.z;
    precise float _419 = fma(cb3._m10.w, TEXCOORD2.z, fma(cb3._m8.w, TEXCOORD2.x, _389)) + cb3._m11.w;
    precise float _420 = _416 / _419;
    precise float _421 = _417 / _419;
    precise float _422 = _418 / _419;
    precise float _430 = 1.0 - cb3._m24.x;
    precise float _431 = fma(textureLod(sampler2DShadow(t4, s1), vec3(vec2(_420, _421), _422), 0.0), _430, cb3._m24.x);
    precise float _432 = spvNClamp(dp4_f32(vec4(_374, _373, _372, _371), cb2._m47), 0.0, 1.0) - _431;
    precise float _436 = _260 / _263;
    precise float _437 = _261 / _263;
    precise float _438 = _436 + 0.5;
    precise float _439 = _437 + 0.5;
    precise float _446 = float(_262 > 0.0) * texture(sampler2D(t1, s2), vec2(_438, _439)).w;
    vec3 _447 = vec3(_260, _261, _262);
    precise float _455 = _446 * texture(sampler2D(t2, s3), vec2(dp3_f32(_447, _447))).x;
    precise float _456 = fma(spvNClamp(fma(fma(cb3._m26, _286, _273), cb3._m24.z, cb3._m24.w), 0.0, 1.0), _432, _431) * _455;
    precise float _462 = _456 * cb0._m2.x;
    precise float _463 = _456 * cb0._m2.y;
    precise float _464 = _456 * cb0._m2.z;
    vec3 _471 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    precise float _473 = inversesqrt(dp3_f32(_471, _471));
    precise float _474 = _473 * TEXCOORD1.x;
    precise float _475 = _473 * TEXCOORD1.y;
    precise float _476 = _473 * TEXCOORD1.z;
    precise float _477 = _220 - 0.039999999105930328369140625;
    precise float _478 = _221 - 0.039999999105930328369140625;
    precise float _479 = _222 - 0.039999999105930328369140625;
    precise float _482 = fma(cb0._m9.y, _477, 0.039999999105930328369140625);
    precise float _483 = fma(cb0._m9.y, _478, 0.039999999105930328369140625);
    precise float _484 = fma(cb0._m9.y, _479, 0.039999999105930328369140625);
    precise float _486 = fma(-cb0._m9.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _487 = _486 * _220;
    precise float _488 = _486 * _221;
    precise float _489 = _486 * _222;
    precise float _492 = 1.0 - cb0._m9.x;
    precise float _493 = fma(_157, _162, _178);
    precise float _494 = fma(_158, _162, _179);
    precise float _495 = fma(_159, _162, _180);
    vec3 _496 = vec3(_493, _494, _495);
    precise float _499 = inversesqrt(spvNMax(dp3_f32(_496, _496), 0.001000000047497451305389404296875));
    precise float _500 = _499 * _493;
    precise float _501 = _499 * _494;
    precise float _502 = _499 * _495;
    vec3 _503 = vec3(_474, _475, _476);
    vec3 _506 = vec3(_163, _164, _165);
    precise float _508 = spvNClamp(dp3_f32(_503, _506), 0.0, 1.0);
    vec3 _509 = vec3(_500, _501, _502);
    precise float _511 = spvNClamp(dp3_f32(_503, _509), 0.0, 1.0);
    precise float _513 = spvNClamp(dp3_f32(_506, _509), 0.0, 1.0);
    precise float _514 = _513 * _513;
    precise float _518 = dp2_f32(vec2(_514), vec2(_492)) - 0.5;
    precise float _519 = 1.0 - _508;
    precise float _520 = _519 * _519;
    precise float _521 = _520 * _520;
    precise float _522 = _519 * _521;
    precise float _524 = abs(dp3_f32(_503, vec3(_178, _179, _180)));
    precise float _525 = 1.0 - _524;
    precise float _526 = _525 * _525;
    precise float _527 = _526 * _526;
    precise float _528 = _525 * _527;
    precise float _530 = fma(_518, _528, 1.0) * fma(_518, _522, 1.0);
    precise float _531 = _492 * _492;
    precise float _532 = spvNMax(_531, 0.00200000009499490261077880859375);
    precise float _533 = 1.0 - _532;
    precise float _536 = _524 * fma(_508, _533, _532);
    precise float _538 = fma(_508, fma(_524, _533, _532), _536) + 9.9999997473787516355514526367188e-06;
    precise float _539 = 0.5 / _538;
    precise float _540 = _532 * _532;
    precise float _543 = fma(fma(_511, _540, -_511), _511, 1.0);
    precise float _544 = _540 * 0.3183098733425140380859375;
    precise float _546 = _544 / fma(_543, _543, 1.0000000116860974230803549289703e-07);
    precise float _547 = _546 * _539;
    precise float _548 = _547 * 3.1415927410125732421875;
    precise float _549 = _508 * _530;
    precise float _550 = _508 * _548;
    vec3 _552 = vec3(_482, _483, _484);
    precise float _556 = ((dp3_f32(_552, _552) == 0.0) ? 0.0 : 1.0) * spvNMax(_550, 0.0);
    precise float _557 = _549 * _462;
    precise float _558 = _549 * _463;
    precise float _559 = _549 * _464;
    precise float _560 = _462 * _556;
    precise float _561 = _463 * _556;
    precise float _562 = _464 * _556;
    precise float _563 = 1.0 - _513;
    precise float _564 = _563 * _563;
    precise float _565 = _564 * _564;
    precise float _566 = _563 * _565;
    precise float _567 = 1.0 - _482;
    precise float _568 = 1.0 - _483;
    precise float _569 = 1.0 - _484;
    precise float _573 = _560 * fma(_567, _566, _482);
    precise float _574 = _561 * fma(_568, _566, _483);
    precise float _575 = _562 * fma(_569, _566, _484);
    SV_Target.x = fma(_487, _557, _573);
    SV_Target.y = fma(_488, _558, _574);
    SV_Target.z = fma(_489, _559, _575);
    SV_Target.w = 1.0;
}

