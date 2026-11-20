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
    precise float _139 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _139));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _122 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _122)));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _110 = a.x * b.x;
    return fma(a.y, b.y, _110);
}

void main()
{
    precise float _163 = cb2._m0.x - TEXCOORD2.x;
    precise float _164 = cb2._m0.y - TEXCOORD2.y;
    precise float _165 = cb2._m0.z - TEXCOORD2.z;
    vec3 _166 = vec3(_163, _164, _165);
    precise float _168 = inversesqrt(dp3_f32(_166, _166));
    precise float _169 = _168 * _163;
    precise float _170 = _168 * _164;
    precise float _171 = _168 * _165;
    precise float _178 = cb1._m4.x - TEXCOORD2.x;
    precise float _179 = cb1._m4.y - TEXCOORD2.y;
    precise float _180 = cb1._m4.z - TEXCOORD2.z;
    vec3 _181 = vec3(_178, _179, _180);
    precise float _183 = inversesqrt(dp3_f32(_181, _181));
    precise float _184 = _183 * _178;
    precise float _185 = _183 * _179;
    precise float _186 = _183 * _180;
    vec4 _196 = texture(sampler2D(t0, s4), vec2(TEXCOORD.x, TEXCOORD.y));
    precise float _206 = _196.x * cb0._m14.x;
    precise float _207 = _196.y * cb0._m14.y;
    precise float _208 = _196.z * cb0._m14.z;
    precise float _209 = TEXCOORD.y + TEXCOORD.x;
    precise float _210 = _209 * 10.0;
    precise float _213 = roundEven(fract(_210)) + 0.800000011920928955078125;
    precise float _214 = spvNMin(_213, 1.0);
    precise float _215 = _214 * _206;
    precise float _216 = _214 * _207;
    precise float _217 = _214 * _208;
    bool _225 = (TEXCOORD.y > 0.949999988079071044921875) || ((TEXCOORD.y < 0.0500000007450580596923828125) || ((TEXCOORD.x > 0.863223135471343994140625) || (TEXCOORD.x < 0.13677684962749481201171875)));
    float _226 = _225 ? 0.0 : _215;
    float _227 = _225 ? 0.0 : _216;
    float _228 = _225 ? 0.0 : _217;
    precise float _234 = TEXCOORD2.y * cb0._m7.x;
    precise float _235 = TEXCOORD2.y * cb0._m7.y;
    precise float _236 = TEXCOORD2.y * cb0._m7.z;
    precise float _258 = fma(cb0._m9.x, TEXCOORD2.z, fma(cb0._m5.x, TEXCOORD2.x, _234)) + cb0._m11.x;
    precise float _259 = fma(cb0._m9.y, TEXCOORD2.z, fma(cb0._m5.y, TEXCOORD2.x, _235)) + cb0._m11.y;
    precise float _260 = fma(cb0._m9.z, TEXCOORD2.z, fma(cb0._m5.z, TEXCOORD2.x, _236)) + cb0._m11.z;
    float _270 = dp3_f32(_181, vec3(cb4._m9.z, cb4._m10.z, cb4._m11.z));
    precise float _277 = TEXCOORD2.x - cb3._m25.x;
    precise float _278 = TEXCOORD2.y - cb3._m25.y;
    precise float _279 = TEXCOORD2.z - cb3._m25.z;
    vec3 _280 = vec3(_277, _278, _279);
    precise float _283 = sqrt(dp3_f32(_280, _280)) - _270;
    float _368;
    float _369;
    float _370;
    float _371;
    if (cb5._m0.x == 1.0)
    {
        bool _301 = cb5._m0.y == 1.0;
        precise float _307 = TEXCOORD2.y * cb5._m3.x;
        precise float _308 = TEXCOORD2.y * cb5._m3.y;
        precise float _309 = TEXCOORD2.y * cb5._m3.z;
        precise float _331 = fma(cb5._m5.x, TEXCOORD2.z, fma(cb5._m1.x, TEXCOORD2.x, _307)) + cb5._m7.x;
        precise float _332 = fma(cb5._m5.y, TEXCOORD2.z, fma(cb5._m1.y, TEXCOORD2.x, _308)) + cb5._m7.y;
        precise float _333 = fma(cb5._m5.z, TEXCOORD2.z, fma(cb5._m1.z, TEXCOORD2.x, _309)) + cb5._m7.z;
        precise float _342 = (_301 ? _331 : TEXCOORD2.x) - cb5._m11.x;
        precise float _343 = (_301 ? _332 : TEXCOORD2.y) - cb5._m11.y;
        precise float _344 = (_301 ? _333 : TEXCOORD2.z) - cb5._m11.z;
        precise float _350 = _342 * cb5._m9.x;
        precise float _351 = _343 * cb5._m9.y;
        precise float _352 = _344 * cb5._m9.z;
        vec4 _363 = texture(sampler3D(t3, s0), vec3(spvNMax(fma(_350, 0.25, 0.75), fma(cb5._m0.z, 0.5, 0.75)), _351, _352));
        _368 = _363.w;
        _369 = _363.z;
        _370 = _363.y;
        _371 = _363.x;
    }
    else
    {
        _368 = 1.0;
        _369 = 1.0;
        _370 = 1.0;
        _371 = 1.0;
    }
    precise float _383 = TEXCOORD2.x - cb2._m2.x;
    precise float _384 = TEXCOORD2.y - cb2._m2.y;
    precise float _385 = TEXCOORD2.z - cb2._m2.z;
    precise float _393 = spvNMax(abs(_385), spvNMax(abs(_384), abs(_383))) - cb2._m4.z;
    precise float _397 = spvNMax(_393, 9.9999997473787516355514526367188e-06) * cb2._m4.w;
    precise float _400 = cb2._m4.y / _397;
    precise float _403 = _400 - cb2._m4.x;
    precise float _404 = 1.0 - _403;
    precise float _413 = 1.0 - cb3._m24.x;
    precise float _414 = fma(textureLod(samplerCubeShadow(t4, s1), vec4(vec3(_383, _384, _385), _404), 0.0), _413, cb3._m24.x);
    precise float _415 = spvNClamp(dp4_f32(vec4(_371, _370, _369, _368), cb2._m48), 0.0, 1.0) - _414;
    vec3 _417 = vec3(_258, _259, _260);
    precise float _430 = texture(sampler2D(t1, s3), vec2(dp3_f32(_417, _417))).x * texture(samplerCube(t2, s2), _417).w;
    precise float _431 = fma(spvNClamp(fma(fma(cb3._m26, _283, _270), cb3._m24.z, cb3._m24.w), 0.0, 1.0), _415, _414) * _430;
    precise float _437 = _431 * cb0._m2.x;
    precise float _438 = _431 * cb0._m2.y;
    precise float _439 = _431 * cb0._m2.z;
    vec3 _446 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    precise float _448 = inversesqrt(dp3_f32(_446, _446));
    precise float _449 = _448 * TEXCOORD1.x;
    precise float _450 = _448 * TEXCOORD1.y;
    precise float _451 = _448 * TEXCOORD1.z;
    precise float _452 = _226 - 0.039999999105930328369140625;
    precise float _453 = _227 - 0.039999999105930328369140625;
    precise float _454 = _228 - 0.039999999105930328369140625;
    precise float _457 = fma(cb0._m13.y, _452, 0.039999999105930328369140625);
    precise float _458 = fma(cb0._m13.y, _453, 0.039999999105930328369140625);
    precise float _459 = fma(cb0._m13.y, _454, 0.039999999105930328369140625);
    precise float _461 = fma(-cb0._m13.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _462 = _461 * _226;
    precise float _463 = _461 * _227;
    precise float _464 = _461 * _228;
    precise float _467 = 1.0 - cb0._m13.x;
    precise float _468 = fma(_163, _168, _184);
    precise float _469 = fma(_164, _168, _185);
    precise float _470 = fma(_165, _168, _186);
    vec3 _471 = vec3(_468, _469, _470);
    precise float _474 = inversesqrt(spvNMax(dp3_f32(_471, _471), 0.001000000047497451305389404296875));
    precise float _475 = _474 * _468;
    precise float _476 = _474 * _469;
    precise float _477 = _474 * _470;
    vec3 _478 = vec3(_449, _450, _451);
    vec3 _481 = vec3(_169, _170, _171);
    precise float _483 = spvNClamp(dp3_f32(_478, _481), 0.0, 1.0);
    vec3 _484 = vec3(_475, _476, _477);
    precise float _486 = spvNClamp(dp3_f32(_478, _484), 0.0, 1.0);
    precise float _488 = spvNClamp(dp3_f32(_481, _484), 0.0, 1.0);
    precise float _489 = _488 * _488;
    precise float _493 = dp2_f32(vec2(_489), vec2(_467)) - 0.5;
    precise float _494 = 1.0 - _483;
    precise float _495 = _494 * _494;
    precise float _496 = _495 * _495;
    precise float _497 = _494 * _496;
    precise float _499 = abs(dp3_f32(_478, vec3(_184, _185, _186)));
    precise float _500 = 1.0 - _499;
    precise float _501 = _500 * _500;
    precise float _502 = _501 * _501;
    precise float _503 = _500 * _502;
    precise float _505 = fma(_493, _503, 1.0) * fma(_493, _497, 1.0);
    precise float _506 = _467 * _467;
    precise float _507 = spvNMax(_506, 0.00200000009499490261077880859375);
    precise float _508 = 1.0 - _507;
    precise float _511 = _499 * fma(_483, _508, _507);
    precise float _513 = fma(_483, fma(_499, _508, _507), _511) + 9.9999997473787516355514526367188e-06;
    precise float _514 = 0.5 / _513;
    precise float _515 = _507 * _507;
    precise float _518 = fma(fma(_486, _515, -_486), _486, 1.0);
    precise float _519 = _515 * 0.3183098733425140380859375;
    precise float _521 = _519 / fma(_518, _518, 1.0000000116860974230803549289703e-07);
    precise float _522 = _521 * _514;
    precise float _523 = _522 * 3.1415927410125732421875;
    precise float _524 = _483 * _505;
    precise float _525 = _483 * _523;
    vec3 _527 = vec3(_457, _458, _459);
    precise float _531 = ((dp3_f32(_527, _527) == 0.0) ? 0.0 : 1.0) * spvNMax(_525, 0.0);
    precise float _532 = _524 * _437;
    precise float _533 = _524 * _438;
    precise float _534 = _524 * _439;
    precise float _535 = _437 * _531;
    precise float _536 = _438 * _531;
    precise float _537 = _439 * _531;
    precise float _538 = 1.0 - _488;
    precise float _539 = _538 * _538;
    precise float _540 = _539 * _539;
    precise float _541 = _538 * _540;
    precise float _542 = 1.0 - _457;
    precise float _543 = 1.0 - _458;
    precise float _544 = 1.0 - _459;
    precise float _548 = _535 * fma(_542, _541, _457);
    precise float _549 = _536 * fma(_543, _541, _458);
    precise float _550 = _537 * fma(_544, _541, _459);
    SV_Target.x = fma(_462, _532, _548);
    SV_Target.y = fma(_463, _533, _549);
    SV_Target.z = fma(_464, _534, _550);
    SV_Target.w = 1.0;
}

