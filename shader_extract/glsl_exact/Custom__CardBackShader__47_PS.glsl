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
    precise float _140 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _140));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _123 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _123)));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _111 = a.x * b.x;
    return fma(a.y, b.y, _111);
}

void main()
{
    precise float _164 = cb2._m0.x - TEXCOORD2.x;
    precise float _165 = cb2._m0.y - TEXCOORD2.y;
    precise float _166 = cb2._m0.z - TEXCOORD2.z;
    vec3 _167 = vec3(_164, _165, _166);
    precise float _169 = inversesqrt(dp3_f32(_167, _167));
    precise float _170 = _169 * _164;
    precise float _171 = _169 * _165;
    precise float _172 = _169 * _166;
    precise float _179 = cb1._m4.x - TEXCOORD2.x;
    precise float _180 = cb1._m4.y - TEXCOORD2.y;
    precise float _181 = cb1._m4.z - TEXCOORD2.z;
    vec3 _182 = vec3(_179, _180, _181);
    precise float _184 = inversesqrt(dp3_f32(_182, _182));
    precise float _185 = _184 * _179;
    precise float _186 = _184 * _180;
    precise float _187 = _184 * _181;
    vec4 _197 = texture(sampler2D(t0, s3), vec2(TEXCOORD.x, TEXCOORD.y));
    precise float _207 = _197.x * cb0._m14.x;
    precise float _208 = _197.y * cb0._m14.y;
    precise float _209 = _197.z * cb0._m14.z;
    precise float _210 = TEXCOORD.y + TEXCOORD.x;
    precise float _211 = _210 * 10.0;
    precise float _214 = roundEven(fract(_211)) + 0.800000011920928955078125;
    precise float _215 = spvNMin(_214, 1.0);
    precise float _216 = _215 * _207;
    precise float _217 = _215 * _208;
    precise float _218 = _215 * _209;
    bool _226 = (((TEXCOORD.x > 0.863223135471343994140625) || (TEXCOORD.x < 0.13677684962749481201171875)) || (TEXCOORD.y < 0.0500000007450580596923828125)) || (TEXCOORD.y > 0.949999988079071044921875);
    float _227 = _226 ? 0.0 : _216;
    float _228 = _226 ? 0.0 : _217;
    float _229 = _226 ? 0.0 : _218;
    precise float _235 = TEXCOORD2.y * cb0._m7.x;
    precise float _236 = TEXCOORD2.y * cb0._m7.y;
    precise float _237 = TEXCOORD2.y * cb0._m7.z;
    precise float _259 = fma(cb0._m9.x, TEXCOORD2.z, fma(cb0._m5.x, TEXCOORD2.x, _235)) + cb0._m11.x;
    precise float _260 = fma(cb0._m9.y, TEXCOORD2.z, fma(cb0._m5.y, TEXCOORD2.x, _236)) + cb0._m11.y;
    precise float _261 = fma(cb0._m9.z, TEXCOORD2.z, fma(cb0._m5.z, TEXCOORD2.x, _237)) + cb0._m11.z;
    float _271 = dp3_f32(_182, vec3(cb4._m9.z, cb4._m10.z, cb4._m11.z));
    precise float _278 = TEXCOORD2.x - cb3._m25.x;
    precise float _279 = TEXCOORD2.y - cb3._m25.y;
    precise float _280 = TEXCOORD2.z - cb3._m25.z;
    vec3 _281 = vec3(_278, _279, _280);
    precise float _284 = sqrt(dp3_f32(_281, _281)) - _271;
    precise float _293 = spvNClamp(fma(fma(cb3._m26, _284, _271), cb3._m24.z, cb3._m24.w), 0.0, 1.0);
    float _369;
    float _370;
    float _371;
    float _372;
    if (cb5._m0.x == 1.0)
    {
        bool _302 = cb5._m0.y == 1.0;
        precise float _308 = TEXCOORD2.y * cb5._m3.x;
        precise float _309 = TEXCOORD2.y * cb5._m3.y;
        precise float _310 = TEXCOORD2.y * cb5._m3.z;
        precise float _332 = fma(cb5._m5.x, TEXCOORD2.z, fma(cb5._m1.x, TEXCOORD2.x, _308)) + cb5._m7.x;
        precise float _333 = fma(cb5._m5.y, TEXCOORD2.z, fma(cb5._m1.y, TEXCOORD2.x, _309)) + cb5._m7.y;
        precise float _334 = fma(cb5._m5.z, TEXCOORD2.z, fma(cb5._m1.z, TEXCOORD2.x, _310)) + cb5._m7.z;
        precise float _343 = (_302 ? _332 : TEXCOORD2.x) - cb5._m11.x;
        precise float _344 = (_302 ? _333 : TEXCOORD2.y) - cb5._m11.y;
        precise float _345 = (_302 ? _334 : TEXCOORD2.z) - cb5._m11.z;
        precise float _351 = _343 * cb5._m9.x;
        precise float _352 = _344 * cb5._m9.y;
        precise float _353 = _345 * cb5._m9.z;
        vec4 _364 = texture(sampler3D(t2, s0), vec3(spvNMax(fma(_351, 0.25, 0.75), fma(cb5._m0.z, 0.5, 0.75)), _352, _353));
        _369 = _364.w;
        _370 = _364.z;
        _371 = _364.y;
        _372 = _364.x;
    }
    else
    {
        _369 = 1.0;
        _370 = 1.0;
        _371 = 1.0;
        _372 = 1.0;
    }
    float _436;
    if (_293 < 0.9900000095367431640625)
    {
        precise float _387 = TEXCOORD2.x - cb2._m2.x;
        precise float _388 = TEXCOORD2.y - cb2._m2.y;
        precise float _389 = TEXCOORD2.z - cb2._m2.z;
        precise float _397 = spvNMax(abs(_389), spvNMax(abs(_388), abs(_387))) - cb2._m4.z;
        precise float _401 = spvNMax(_397, 9.9999997473787516355514526367188e-06) * cb2._m4.w;
        precise float _404 = cb2._m4.y / _401;
        precise float _407 = _404 - cb2._m4.x;
        precise float _408 = 1.0 - _407;
        precise float _409 = _387 + 0.0078125;
        precise float _410 = _388 + 0.0078125;
        precise float _411 = _389 + 0.0078125;
        precise float _418 = _387 - 0.0078125;
        precise float _419 = _388 - 0.0078125;
        precise float _423 = _389 - 0.0078125;
        precise float _434 = 1.0 - cb3._m24.x;
        _436 = fma(dp4_f32(vec4(textureLod(samplerCubeShadow(t3, s1), vec4(vec3(_409, _410, _411), _408), 0.0), textureLod(samplerCubeShadow(t3, s1), vec4(vec3(_418, _419, _411), _408), 0.0), textureLod(samplerCubeShadow(t3, s1), vec4(vec3(_418, _410, _423), _408), 0.0), textureLod(samplerCubeShadow(t3, s1), vec4(vec3(_409, _419, _423), _408), 0.0)), vec4(0.25)), _434, cb3._m24.x);
    }
    else
    {
        _436 = 1.0;
    }
    precise float _437 = spvNClamp(dp4_f32(vec4(_372, _371, _370, _369), cb2._m48), 0.0, 1.0) - _436;
    vec3 _439 = vec3(_259, _260, _261);
    precise float _447 = fma(_293, _437, _436) * texture(sampler2D(t1, s2), vec2(dp3_f32(_439, _439))).x;
    precise float _453 = _447 * cb0._m2.x;
    precise float _454 = _447 * cb0._m2.y;
    precise float _455 = _447 * cb0._m2.z;
    vec3 _462 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    precise float _464 = inversesqrt(dp3_f32(_462, _462));
    precise float _465 = _464 * TEXCOORD1.x;
    precise float _466 = _464 * TEXCOORD1.y;
    precise float _467 = _464 * TEXCOORD1.z;
    precise float _468 = _227 - 0.039999999105930328369140625;
    precise float _469 = _228 - 0.039999999105930328369140625;
    precise float _470 = _229 - 0.039999999105930328369140625;
    precise float _473 = fma(cb0._m13.y, _468, 0.039999999105930328369140625);
    precise float _474 = fma(cb0._m13.y, _469, 0.039999999105930328369140625);
    precise float _475 = fma(cb0._m13.y, _470, 0.039999999105930328369140625);
    precise float _477 = fma(-cb0._m13.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _478 = _477 * _227;
    precise float _479 = _477 * _228;
    precise float _480 = _477 * _229;
    precise float _483 = 1.0 - cb0._m13.x;
    precise float _484 = fma(_164, _169, _185);
    precise float _485 = fma(_165, _169, _186);
    precise float _486 = fma(_166, _169, _187);
    vec3 _487 = vec3(_484, _485, _486);
    precise float _490 = inversesqrt(spvNMax(dp3_f32(_487, _487), 0.001000000047497451305389404296875));
    precise float _491 = _490 * _484;
    precise float _492 = _490 * _485;
    precise float _493 = _490 * _486;
    vec3 _494 = vec3(_465, _466, _467);
    vec3 _497 = vec3(_170, _171, _172);
    precise float _499 = spvNClamp(dp3_f32(_494, _497), 0.0, 1.0);
    vec3 _500 = vec3(_491, _492, _493);
    precise float _502 = spvNClamp(dp3_f32(_494, _500), 0.0, 1.0);
    precise float _504 = spvNClamp(dp3_f32(_497, _500), 0.0, 1.0);
    precise float _505 = _504 * _504;
    precise float _509 = dp2_f32(vec2(_505), vec2(_483)) - 0.5;
    precise float _510 = 1.0 - _499;
    precise float _511 = _510 * _510;
    precise float _512 = _511 * _511;
    precise float _513 = _510 * _512;
    precise float _515 = abs(dp3_f32(_494, vec3(_185, _186, _187)));
    precise float _516 = 1.0 - _515;
    precise float _517 = _516 * _516;
    precise float _518 = _517 * _517;
    precise float _519 = _516 * _518;
    precise float _521 = fma(_509, _519, 1.0) * fma(_509, _513, 1.0);
    precise float _522 = _483 * _483;
    precise float _523 = spvNMax(_522, 0.00200000009499490261077880859375);
    precise float _524 = 1.0 - _523;
    precise float _527 = _515 * fma(_499, _524, _523);
    precise float _529 = fma(_499, fma(_515, _524, _523), _527) + 9.9999997473787516355514526367188e-06;
    precise float _530 = 0.5 / _529;
    precise float _531 = _523 * _523;
    precise float _534 = fma(fma(_502, _531, -_502), _502, 1.0);
    precise float _535 = _531 * 0.3183098733425140380859375;
    precise float _537 = _535 / fma(_534, _534, 1.0000000116860974230803549289703e-07);
    precise float _538 = _537 * _530;
    precise float _539 = _538 * 3.1415927410125732421875;
    precise float _540 = _499 * _521;
    precise float _541 = _499 * _539;
    vec3 _543 = vec3(_473, _474, _475);
    precise float _547 = ((dp3_f32(_543, _543) == 0.0) ? 0.0 : 1.0) * spvNMax(_541, 0.0);
    precise float _548 = _540 * _453;
    precise float _549 = _540 * _454;
    precise float _550 = _540 * _455;
    precise float _551 = _453 * _547;
    precise float _552 = _454 * _547;
    precise float _553 = _455 * _547;
    precise float _554 = 1.0 - _504;
    precise float _555 = _554 * _554;
    precise float _556 = _555 * _555;
    precise float _557 = _554 * _556;
    precise float _558 = 1.0 - _473;
    precise float _559 = 1.0 - _474;
    precise float _560 = 1.0 - _475;
    precise float _564 = _551 * fma(_558, _557, _473);
    precise float _565 = _552 * fma(_559, _557, _474);
    precise float _566 = _553 * fma(_560, _557, _475);
    SV_Target.x = fma(_478, _548, _564);
    SV_Target.y = fma(_479, _549, _565);
    SV_Target.z = fma(_480, _550, _566);
    SV_Target.w = 1.0;
}

