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
layout(set = 0, binding = 10) uniform texture2D t0;
layout(set = 0, binding = 11) uniform texture2D t1;
layout(set = 0, binding = 12) uniform texture3D t2;
layout(set = 0, binding = 13) uniform textureCube t3;

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
    precise float _137 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _137));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _120 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _120)));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _108 = a.x * b.x;
    return fma(a.y, b.y, _108);
}

void main()
{
    precise float _161 = cb2._m0.x - TEXCOORD2.x;
    precise float _162 = cb2._m0.y - TEXCOORD2.y;
    precise float _163 = cb2._m0.z - TEXCOORD2.z;
    vec3 _164 = vec3(_161, _162, _163);
    precise float _166 = inversesqrt(dp3_f32(_164, _164));
    precise float _167 = _166 * _161;
    precise float _168 = _166 * _162;
    precise float _169 = _166 * _163;
    precise float _176 = cb1._m4.x - TEXCOORD2.x;
    precise float _177 = cb1._m4.y - TEXCOORD2.y;
    precise float _178 = cb1._m4.z - TEXCOORD2.z;
    vec3 _179 = vec3(_176, _177, _178);
    precise float _181 = inversesqrt(dp3_f32(_179, _179));
    precise float _182 = _181 * _176;
    precise float _183 = _181 * _177;
    precise float _184 = _181 * _178;
    vec4 _194 = texture(sampler2D(t0, s3), vec2(TEXCOORD.x, TEXCOORD.y));
    precise float _204 = _194.x * cb0._m14.x;
    precise float _205 = _194.y * cb0._m14.y;
    precise float _206 = _194.z * cb0._m14.z;
    precise float _207 = TEXCOORD.y + TEXCOORD.x;
    precise float _208 = _207 * 10.0;
    precise float _211 = roundEven(fract(_208)) + 0.800000011920928955078125;
    precise float _212 = spvNMin(_211, 1.0);
    precise float _213 = _212 * _204;
    precise float _214 = _212 * _205;
    precise float _215 = _212 * _206;
    bool _223 = (TEXCOORD.y > 0.949999988079071044921875) || ((TEXCOORD.y < 0.0500000007450580596923828125) || ((TEXCOORD.x > 0.863223135471343994140625) || (TEXCOORD.x < 0.13677684962749481201171875)));
    float _224 = _223 ? 0.0 : _213;
    float _225 = _223 ? 0.0 : _214;
    float _226 = _223 ? 0.0 : _215;
    precise float _232 = TEXCOORD2.y * cb0._m7.x;
    precise float _233 = TEXCOORD2.y * cb0._m7.y;
    precise float _234 = TEXCOORD2.y * cb0._m7.z;
    precise float _256 = fma(cb0._m9.x, TEXCOORD2.z, fma(cb0._m5.x, TEXCOORD2.x, _232)) + cb0._m11.x;
    precise float _257 = fma(cb0._m9.y, TEXCOORD2.z, fma(cb0._m5.y, TEXCOORD2.x, _233)) + cb0._m11.y;
    precise float _258 = fma(cb0._m9.z, TEXCOORD2.z, fma(cb0._m5.z, TEXCOORD2.x, _234)) + cb0._m11.z;
    float _268 = dp3_f32(_179, vec3(cb4._m9.z, cb4._m10.z, cb4._m11.z));
    precise float _275 = TEXCOORD2.x - cb3._m25.x;
    precise float _276 = TEXCOORD2.y - cb3._m25.y;
    precise float _277 = TEXCOORD2.z - cb3._m25.z;
    vec3 _278 = vec3(_275, _276, _277);
    precise float _281 = sqrt(dp3_f32(_278, _278)) - _268;
    float _366;
    float _367;
    float _368;
    float _369;
    if (cb5._m0.x == 1.0)
    {
        bool _299 = cb5._m0.y == 1.0;
        precise float _305 = TEXCOORD2.y * cb5._m3.x;
        precise float _306 = TEXCOORD2.y * cb5._m3.y;
        precise float _307 = TEXCOORD2.y * cb5._m3.z;
        precise float _329 = fma(cb5._m5.x, TEXCOORD2.z, fma(cb5._m1.x, TEXCOORD2.x, _305)) + cb5._m7.x;
        precise float _330 = fma(cb5._m5.y, TEXCOORD2.z, fma(cb5._m1.y, TEXCOORD2.x, _306)) + cb5._m7.y;
        precise float _331 = fma(cb5._m5.z, TEXCOORD2.z, fma(cb5._m1.z, TEXCOORD2.x, _307)) + cb5._m7.z;
        precise float _340 = (_299 ? _329 : TEXCOORD2.x) - cb5._m11.x;
        precise float _341 = (_299 ? _330 : TEXCOORD2.y) - cb5._m11.y;
        precise float _342 = (_299 ? _331 : TEXCOORD2.z) - cb5._m11.z;
        precise float _348 = _340 * cb5._m9.x;
        precise float _349 = _341 * cb5._m9.y;
        precise float _350 = _342 * cb5._m9.z;
        vec4 _361 = texture(sampler3D(t2, s0), vec3(spvNMax(fma(_348, 0.25, 0.75), fma(cb5._m0.z, 0.5, 0.75)), _349, _350));
        _366 = _361.w;
        _367 = _361.z;
        _368 = _361.y;
        _369 = _361.x;
    }
    else
    {
        _366 = 1.0;
        _367 = 1.0;
        _368 = 1.0;
        _369 = 1.0;
    }
    precise float _381 = TEXCOORD2.x - cb2._m2.x;
    precise float _382 = TEXCOORD2.y - cb2._m2.y;
    precise float _383 = TEXCOORD2.z - cb2._m2.z;
    precise float _391 = spvNMax(abs(_383), spvNMax(abs(_382), abs(_381))) - cb2._m4.z;
    precise float _395 = spvNMax(_391, 9.9999997473787516355514526367188e-06) * cb2._m4.w;
    precise float _398 = cb2._m4.y / _395;
    precise float _401 = _398 - cb2._m4.x;
    precise float _402 = 1.0 - _401;
    precise float _411 = 1.0 - cb3._m24.x;
    precise float _412 = fma(textureLod(samplerCubeShadow(t3, s1), vec4(vec3(_381, _382, _383), _402), 0.0), _411, cb3._m24.x);
    precise float _413 = spvNClamp(dp4_f32(vec4(_369, _368, _367, _366), cb2._m48), 0.0, 1.0) - _412;
    vec3 _415 = vec3(_256, _257, _258);
    precise float _423 = fma(spvNClamp(fma(fma(cb3._m26, _281, _268), cb3._m24.z, cb3._m24.w), 0.0, 1.0), _413, _412) * texture(sampler2D(t1, s2), vec2(dp3_f32(_415, _415))).x;
    precise float _429 = _423 * cb0._m2.x;
    precise float _430 = _423 * cb0._m2.y;
    precise float _431 = _423 * cb0._m2.z;
    vec3 _438 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    precise float _440 = inversesqrt(dp3_f32(_438, _438));
    precise float _441 = _440 * TEXCOORD1.x;
    precise float _442 = _440 * TEXCOORD1.y;
    precise float _443 = _440 * TEXCOORD1.z;
    precise float _444 = _224 - 0.039999999105930328369140625;
    precise float _445 = _225 - 0.039999999105930328369140625;
    precise float _446 = _226 - 0.039999999105930328369140625;
    precise float _449 = fma(cb0._m13.y, _444, 0.039999999105930328369140625);
    precise float _450 = fma(cb0._m13.y, _445, 0.039999999105930328369140625);
    precise float _451 = fma(cb0._m13.y, _446, 0.039999999105930328369140625);
    precise float _453 = fma(-cb0._m13.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _454 = _453 * _224;
    precise float _455 = _453 * _225;
    precise float _456 = _453 * _226;
    precise float _459 = 1.0 - cb0._m13.x;
    precise float _460 = fma(_161, _166, _182);
    precise float _461 = fma(_162, _166, _183);
    precise float _462 = fma(_163, _166, _184);
    vec3 _463 = vec3(_460, _461, _462);
    precise float _466 = inversesqrt(spvNMax(dp3_f32(_463, _463), 0.001000000047497451305389404296875));
    precise float _467 = _466 * _460;
    precise float _468 = _466 * _461;
    precise float _469 = _466 * _462;
    vec3 _470 = vec3(_441, _442, _443);
    vec3 _473 = vec3(_167, _168, _169);
    precise float _475 = spvNClamp(dp3_f32(_470, _473), 0.0, 1.0);
    vec3 _476 = vec3(_467, _468, _469);
    precise float _478 = spvNClamp(dp3_f32(_470, _476), 0.0, 1.0);
    precise float _480 = spvNClamp(dp3_f32(_473, _476), 0.0, 1.0);
    precise float _481 = _480 * _480;
    precise float _485 = dp2_f32(vec2(_481), vec2(_459)) - 0.5;
    precise float _486 = 1.0 - _475;
    precise float _487 = _486 * _486;
    precise float _488 = _487 * _487;
    precise float _489 = _486 * _488;
    precise float _491 = abs(dp3_f32(_470, vec3(_182, _183, _184)));
    precise float _492 = 1.0 - _491;
    precise float _493 = _492 * _492;
    precise float _494 = _493 * _493;
    precise float _495 = _492 * _494;
    precise float _497 = fma(_485, _495, 1.0) * fma(_485, _489, 1.0);
    precise float _498 = _459 * _459;
    precise float _499 = spvNMax(_498, 0.00200000009499490261077880859375);
    precise float _500 = 1.0 - _499;
    precise float _503 = _491 * fma(_475, _500, _499);
    precise float _505 = fma(_475, fma(_491, _500, _499), _503) + 9.9999997473787516355514526367188e-06;
    precise float _506 = 0.5 / _505;
    precise float _507 = _499 * _499;
    precise float _510 = fma(fma(_478, _507, -_478), _478, 1.0);
    precise float _511 = _507 * 0.3183098733425140380859375;
    precise float _513 = _511 / fma(_510, _510, 1.0000000116860974230803549289703e-07);
    precise float _514 = _513 * _506;
    precise float _515 = _514 * 3.1415927410125732421875;
    precise float _516 = _475 * _497;
    precise float _517 = _475 * _515;
    vec3 _519 = vec3(_449, _450, _451);
    precise float _523 = ((dp3_f32(_519, _519) == 0.0) ? 0.0 : 1.0) * spvNMax(_517, 0.0);
    precise float _524 = _516 * _429;
    precise float _525 = _516 * _430;
    precise float _526 = _516 * _431;
    precise float _527 = _429 * _523;
    precise float _528 = _430 * _523;
    precise float _529 = _431 * _523;
    precise float _530 = 1.0 - _480;
    precise float _531 = _530 * _530;
    precise float _532 = _531 * _531;
    precise float _533 = _530 * _532;
    precise float _534 = 1.0 - _449;
    precise float _535 = 1.0 - _450;
    precise float _536 = 1.0 - _451;
    precise float _540 = _527 * fma(_534, _533, _449);
    precise float _541 = _528 * fma(_535, _533, _450);
    precise float _542 = _529 * fma(_536, _533, _451);
    SV_Target.x = fma(_454, _524, _540);
    SV_Target.y = fma(_455, _525, _541);
    SV_Target.z = fma(_456, _526, _542);
    SV_Target.w = 1.0;
}

