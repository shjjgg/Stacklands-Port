#version 450
#extension GL_EXT_buffer_reference2 : require
#extension GL_EXT_spirv_intrinsics : require
#extension GL_EXT_texture_shadow_lod : require

layout(set = 0, binding = 0, std140) uniform cb0_buf
{
    uvec4 _m0;
    uvec4 _m1;
    vec3 _m2;
    uint _m3;
    uvec4 _m4;
    vec3 _m5;
    uint _m6;
    vec3 _m7;
    uint _m8;
    vec3 _m9;
    uint _m10;
    vec3 _m11;
    uint _m12;
    vec4 _m13;
    vec3 _m14;
    uint _m15;
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
    vec3 _m2;
    uint _m3;
    vec4 _m4;
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
    uvec4 _m47;
    vec4 _m48;
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
layout(set = 0, binding = 13) uniform textureCube t2;
layout(set = 0, binding = 14) uniform texture3D t3;
layout(set = 0, binding = 15) uniform textureCube t4;

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
    precise float _142 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _142));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _125 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _125)));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _113 = a.x * b.x;
    return fma(a.y, b.y, _113);
}

void main()
{
    precise float _166 = cb2._m0.x - TEXCOORD2.x;
    precise float _167 = cb2._m0.y - TEXCOORD2.y;
    precise float _168 = cb2._m0.z - TEXCOORD2.z;
    vec3 _169 = vec3(_166, _167, _168);
    precise float _171 = inversesqrt(dp3_f32(_169, _169));
    precise float _172 = _171 * _166;
    precise float _173 = _171 * _167;
    precise float _174 = _171 * _168;
    precise float _181 = cb1._m4.x - TEXCOORD2.x;
    precise float _182 = cb1._m4.y - TEXCOORD2.y;
    precise float _183 = cb1._m4.z - TEXCOORD2.z;
    vec3 _184 = vec3(_181, _182, _183);
    precise float _186 = inversesqrt(dp3_f32(_184, _184));
    precise float _187 = _186 * _181;
    precise float _188 = _186 * _182;
    precise float _189 = _186 * _183;
    vec4 _199 = texture(sampler2D(t0, s4), vec2(TEXCOORD.x, TEXCOORD.y));
    precise float _209 = _199.x * cb0._m14.x;
    precise float _210 = _199.y * cb0._m14.y;
    precise float _211 = _199.z * cb0._m14.z;
    precise float _212 = TEXCOORD.y + TEXCOORD.x;
    precise float _213 = _212 * 10.0;
    precise float _216 = roundEven(fract(_213)) + 0.800000011920928955078125;
    precise float _217 = spvNMin(_216, 1.0);
    precise float _218 = _217 * _209;
    precise float _219 = _217 * _210;
    precise float _220 = _217 * _211;
    bool _228 = (((TEXCOORD.x > 0.863223135471343994140625) || (TEXCOORD.x < 0.13677684962749481201171875)) || (TEXCOORD.y < 0.0500000007450580596923828125)) || (TEXCOORD.y > 0.949999988079071044921875);
    float _229 = _228 ? 0.0 : _218;
    float _230 = _228 ? 0.0 : _219;
    float _231 = _228 ? 0.0 : _220;
    precise float _237 = TEXCOORD2.y * cb0._m7.x;
    precise float _238 = TEXCOORD2.y * cb0._m7.y;
    precise float _239 = TEXCOORD2.y * cb0._m7.z;
    precise float _261 = fma(cb0._m9.x, TEXCOORD2.z, fma(cb0._m5.x, TEXCOORD2.x, _237)) + cb0._m11.x;
    precise float _262 = fma(cb0._m9.y, TEXCOORD2.z, fma(cb0._m5.y, TEXCOORD2.x, _238)) + cb0._m11.y;
    precise float _263 = fma(cb0._m9.z, TEXCOORD2.z, fma(cb0._m5.z, TEXCOORD2.x, _239)) + cb0._m11.z;
    float _273 = dp3_f32(_184, vec3(cb4._m9.z, cb4._m10.z, cb4._m11.z));
    precise float _280 = TEXCOORD2.x - cb3._m25.x;
    precise float _281 = TEXCOORD2.y - cb3._m25.y;
    precise float _282 = TEXCOORD2.z - cb3._m25.z;
    vec3 _283 = vec3(_280, _281, _282);
    precise float _286 = sqrt(dp3_f32(_283, _283)) - _273;
    precise float _295 = spvNClamp(fma(fma(cb3._m26, _286, _273), cb3._m24.z, cb3._m24.w), 0.0, 1.0);
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
    float _438;
    if (_295 < 0.9900000095367431640625)
    {
        precise float _389 = TEXCOORD2.x - cb2._m2.x;
        precise float _390 = TEXCOORD2.y - cb2._m2.y;
        precise float _391 = TEXCOORD2.z - cb2._m2.z;
        precise float _399 = spvNMax(abs(_391), spvNMax(abs(_390), abs(_389))) - cb2._m4.z;
        precise float _403 = spvNMax(_399, 9.9999997473787516355514526367188e-06) * cb2._m4.w;
        precise float _406 = cb2._m4.y / _403;
        precise float _409 = _406 - cb2._m4.x;
        precise float _410 = 1.0 - _409;
        precise float _411 = _389 + 0.0078125;
        precise float _412 = _390 + 0.0078125;
        precise float _413 = _391 + 0.0078125;
        precise float _420 = _389 - 0.0078125;
        precise float _421 = _390 - 0.0078125;
        precise float _425 = _391 - 0.0078125;
        precise float _436 = 1.0 - cb3._m24.x;
        _438 = fma(dp4_f32(vec4(textureLod(samplerCubeShadow(t4, s1), vec4(vec3(_411, _412, _413), _410), 0.0), textureLod(samplerCubeShadow(t4, s1), vec4(vec3(_420, _421, _413), _410), 0.0), textureLod(samplerCubeShadow(t4, s1), vec4(vec3(_420, _412, _425), _410), 0.0), textureLod(samplerCubeShadow(t4, s1), vec4(vec3(_411, _421, _425), _410), 0.0)), vec4(0.25)), _436, cb3._m24.x);
    }
    else
    {
        _438 = 1.0;
    }
    precise float _439 = spvNClamp(dp4_f32(vec4(_374, _373, _372, _371), cb2._m48), 0.0, 1.0) - _438;
    vec3 _441 = vec3(_261, _262, _263);
    precise float _454 = texture(sampler2D(t1, s3), vec2(dp3_f32(_441, _441))).x * texture(samplerCube(t2, s2), _441).w;
    precise float _455 = fma(_295, _439, _438) * _454;
    precise float _461 = _455 * cb0._m2.x;
    precise float _462 = _455 * cb0._m2.y;
    precise float _463 = _455 * cb0._m2.z;
    vec3 _470 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    precise float _472 = inversesqrt(dp3_f32(_470, _470));
    precise float _473 = _472 * TEXCOORD1.x;
    precise float _474 = _472 * TEXCOORD1.y;
    precise float _475 = _472 * TEXCOORD1.z;
    precise float _476 = _229 - 0.039999999105930328369140625;
    precise float _477 = _230 - 0.039999999105930328369140625;
    precise float _478 = _231 - 0.039999999105930328369140625;
    precise float _481 = fma(cb0._m13.y, _476, 0.039999999105930328369140625);
    precise float _482 = fma(cb0._m13.y, _477, 0.039999999105930328369140625);
    precise float _483 = fma(cb0._m13.y, _478, 0.039999999105930328369140625);
    precise float _485 = fma(-cb0._m13.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _486 = _485 * _229;
    precise float _487 = _485 * _230;
    precise float _488 = _485 * _231;
    precise float _491 = 1.0 - cb0._m13.x;
    precise float _492 = fma(_166, _171, _187);
    precise float _493 = fma(_167, _171, _188);
    precise float _494 = fma(_168, _171, _189);
    vec3 _495 = vec3(_492, _493, _494);
    precise float _498 = inversesqrt(spvNMax(dp3_f32(_495, _495), 0.001000000047497451305389404296875));
    precise float _499 = _498 * _492;
    precise float _500 = _498 * _493;
    precise float _501 = _498 * _494;
    vec3 _502 = vec3(_473, _474, _475);
    vec3 _505 = vec3(_172, _173, _174);
    precise float _507 = spvNClamp(dp3_f32(_502, _505), 0.0, 1.0);
    vec3 _508 = vec3(_499, _500, _501);
    precise float _510 = spvNClamp(dp3_f32(_502, _508), 0.0, 1.0);
    precise float _512 = spvNClamp(dp3_f32(_505, _508), 0.0, 1.0);
    precise float _513 = _512 * _512;
    precise float _517 = dp2_f32(vec2(_513), vec2(_491)) - 0.5;
    precise float _518 = 1.0 - _507;
    precise float _519 = _518 * _518;
    precise float _520 = _519 * _519;
    precise float _521 = _518 * _520;
    precise float _523 = abs(dp3_f32(_502, vec3(_187, _188, _189)));
    precise float _524 = 1.0 - _523;
    precise float _525 = _524 * _524;
    precise float _526 = _525 * _525;
    precise float _527 = _524 * _526;
    precise float _529 = fma(_517, _527, 1.0) * fma(_517, _521, 1.0);
    precise float _530 = _491 * _491;
    precise float _531 = spvNMax(_530, 0.00200000009499490261077880859375);
    precise float _532 = 1.0 - _531;
    precise float _535 = _523 * fma(_507, _532, _531);
    precise float _537 = fma(_507, fma(_523, _532, _531), _535) + 9.9999997473787516355514526367188e-06;
    precise float _538 = 0.5 / _537;
    precise float _539 = _531 * _531;
    precise float _542 = fma(fma(_510, _539, -_510), _510, 1.0);
    precise float _543 = _539 * 0.3183098733425140380859375;
    precise float _545 = _543 / fma(_542, _542, 1.0000000116860974230803549289703e-07);
    precise float _546 = _545 * _538;
    precise float _547 = _546 * 3.1415927410125732421875;
    precise float _548 = _507 * _529;
    precise float _549 = _507 * _547;
    vec3 _551 = vec3(_481, _482, _483);
    precise float _555 = ((dp3_f32(_551, _551) == 0.0) ? 0.0 : 1.0) * spvNMax(_549, 0.0);
    precise float _556 = _548 * _461;
    precise float _557 = _548 * _462;
    precise float _558 = _548 * _463;
    precise float _559 = _461 * _555;
    precise float _560 = _462 * _555;
    precise float _561 = _463 * _555;
    precise float _562 = 1.0 - _512;
    precise float _563 = _562 * _562;
    precise float _564 = _563 * _563;
    precise float _565 = _562 * _564;
    precise float _566 = 1.0 - _481;
    precise float _567 = 1.0 - _482;
    precise float _568 = 1.0 - _483;
    precise float _572 = _559 * fma(_566, _565, _481);
    precise float _573 = _560 * fma(_567, _565, _482);
    precise float _574 = _561 * fma(_568, _565, _483);
    SV_Target.x = fma(_486, _556, _572);
    SV_Target.y = fma(_487, _557, _573);
    SV_Target.z = fma(_488, _558, _574);
    SV_Target.w = 1.0;
}

