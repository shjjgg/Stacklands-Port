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
layout(set = 0, binding = 7) uniform sampler s1;
layout(set = 0, binding = 8) uniform sampler s2;
layout(set = 0, binding = 9) uniform sampler s3;
layout(set = 0, binding = 10) uniform texture2D t0;
layout(set = 0, binding = 11) uniform texture2D t1;
layout(set = 0, binding = 12) uniform texture2D t2;
layout(set = 0, binding = 13) uniform texture3D t3;

layout(location = 1, component = 0) in vec2 TEXCOORD;
layout(location = 2, component = 0) in vec3 TEXCOORD1;
layout(location = 3, component = 0) in vec3 TEXCOORD2;
layout(location = 4, component = 0) in vec4 TEXCOORD4;
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
    precise float _132 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _132));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _115 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _115)));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _103 = a.x * b.x;
    return fma(a.y, b.y, _103);
}

void main()
{
    precise float _156 = cb1._m4.x - TEXCOORD2.x;
    precise float _157 = cb1._m4.y - TEXCOORD2.y;
    precise float _158 = cb1._m4.z - TEXCOORD2.z;
    vec3 _159 = vec3(_156, _157, _158);
    precise float _161 = inversesqrt(dp3_f32(_159, _159));
    precise float _162 = _161 * _156;
    precise float _163 = _161 * _157;
    precise float _164 = _161 * _158;
    vec4 _174 = texture(sampler2D(t0, s3), vec2(TEXCOORD.x, TEXCOORD.y));
    precise float _184 = _174.x * cb0._m14.x;
    precise float _185 = _174.y * cb0._m14.y;
    precise float _186 = _174.z * cb0._m14.z;
    precise float _187 = TEXCOORD.y + TEXCOORD.x;
    precise float _188 = _187 * 10.0;
    precise float _191 = roundEven(fract(_188)) + 0.800000011920928955078125;
    precise float _192 = spvNMin(_191, 1.0);
    precise float _193 = _192 * _184;
    precise float _194 = _192 * _185;
    precise float _195 = _192 * _186;
    bool _203 = (TEXCOORD.y > 0.949999988079071044921875) || (((TEXCOORD.x > 0.863223135471343994140625) || (TEXCOORD.x < 0.13677684962749481201171875)) || (TEXCOORD.y < 0.0500000007450580596923828125));
    float _204 = _203 ? 0.0 : _193;
    float _205 = _203 ? 0.0 : _194;
    float _206 = _203 ? 0.0 : _195;
    precise float _212 = TEXCOORD2.y * cb0._m7.x;
    precise float _213 = TEXCOORD2.y * cb0._m7.y;
    precise float _230 = fma(cb0._m9.x, TEXCOORD2.z, fma(cb0._m5.x, TEXCOORD2.x, _212)) + cb0._m11.x;
    precise float _231 = fma(cb0._m9.y, TEXCOORD2.z, fma(cb0._m5.y, TEXCOORD2.x, _213)) + cb0._m11.y;
    float _241 = dp3_f32(_159, vec3(cb4._m9.z, cb4._m10.z, cb4._m11.z));
    precise float _248 = TEXCOORD2.x - cb3._m25.x;
    precise float _249 = TEXCOORD2.y - cb3._m25.y;
    precise float _250 = TEXCOORD2.z - cb3._m25.z;
    vec3 _251 = vec3(_248, _249, _250);
    precise float _254 = sqrt(dp3_f32(_251, _251)) - _241;
    float _339;
    float _340;
    float _341;
    float _342;
    if (cb5._m0.x == 1.0)
    {
        bool _272 = cb5._m0.y == 1.0;
        precise float _278 = TEXCOORD2.y * cb5._m3.x;
        precise float _279 = TEXCOORD2.y * cb5._m3.y;
        precise float _280 = TEXCOORD2.y * cb5._m3.z;
        precise float _302 = fma(cb5._m5.x, TEXCOORD2.z, fma(cb5._m1.x, TEXCOORD2.x, _278)) + cb5._m7.x;
        precise float _303 = fma(cb5._m5.y, TEXCOORD2.z, fma(cb5._m1.y, TEXCOORD2.x, _279)) + cb5._m7.y;
        precise float _304 = fma(cb5._m5.z, TEXCOORD2.z, fma(cb5._m1.z, TEXCOORD2.x, _280)) + cb5._m7.z;
        precise float _313 = (_272 ? _302 : TEXCOORD2.x) - cb5._m11.x;
        precise float _314 = (_272 ? _303 : TEXCOORD2.y) - cb5._m11.y;
        precise float _315 = (_272 ? _304 : TEXCOORD2.z) - cb5._m11.z;
        precise float _321 = _313 * cb5._m9.x;
        precise float _322 = _314 * cb5._m9.y;
        precise float _323 = _315 * cb5._m9.z;
        vec4 _334 = texture(sampler3D(t3, s0), vec3(spvNMax(fma(_321, 0.25, 0.75), fma(cb5._m0.z, 0.5, 0.75)), _322, _323));
        _339 = _334.w;
        _340 = _334.z;
        _341 = _334.y;
        _342 = _334.x;
    }
    else
    {
        _339 = 1.0;
        _340 = 1.0;
        _341 = 1.0;
        _342 = 1.0;
    }
    precise float _356 = TEXCOORD4.x / TEXCOORD4.w;
    precise float _357 = TEXCOORD4.y / TEXCOORD4.w;
    vec4 _362 = texture(sampler2D(t1, s1), vec2(_356, _357));
    float _363 = _362.x;
    precise float _364 = spvNClamp(dp4_f32(vec4(_342, _341, _340, _339), cb2._m47), 0.0, 1.0) - _363;
    precise float _372 = fma(spvNClamp(fma(fma(cb3._m26, _254, _241), cb3._m24.z, cb3._m24.w), 0.0, 1.0), _364, _363) * texture(sampler2D(t2, s2), vec2(_230, _231)).w;
    precise float _378 = _372 * cb0._m2.x;
    precise float _379 = _372 * cb0._m2.y;
    precise float _380 = _372 * cb0._m2.z;
    vec3 _387 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    precise float _389 = inversesqrt(dp3_f32(_387, _387));
    precise float _390 = _389 * TEXCOORD1.x;
    precise float _391 = _389 * TEXCOORD1.y;
    precise float _392 = _389 * TEXCOORD1.z;
    precise float _393 = _204 - 0.039999999105930328369140625;
    precise float _394 = _205 - 0.039999999105930328369140625;
    precise float _395 = _206 - 0.039999999105930328369140625;
    precise float _398 = fma(cb0._m13.y, _393, 0.039999999105930328369140625);
    precise float _399 = fma(cb0._m13.y, _394, 0.039999999105930328369140625);
    precise float _400 = fma(cb0._m13.y, _395, 0.039999999105930328369140625);
    precise float _402 = fma(-cb0._m13.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _403 = _402 * _204;
    precise float _404 = _402 * _205;
    precise float _405 = _402 * _206;
    precise float _408 = 1.0 - cb0._m13.x;
    precise float _414 = fma(_156, _161, cb2._m0.x);
    precise float _415 = fma(_157, _161, cb2._m0.y);
    precise float _416 = fma(_158, _161, cb2._m0.z);
    vec3 _417 = vec3(_414, _415, _416);
    precise float _420 = inversesqrt(spvNMax(dp3_f32(_417, _417), 0.001000000047497451305389404296875));
    precise float _421 = _420 * _414;
    precise float _422 = _420 * _415;
    precise float _423 = _420 * _416;
    vec3 _424 = vec3(_390, _391, _392);
    precise float _428 = spvNClamp(dp3_f32(_424, cb2._m0), 0.0, 1.0);
    vec3 _429 = vec3(_421, _422, _423);
    precise float _431 = spvNClamp(dp3_f32(_424, _429), 0.0, 1.0);
    precise float _433 = spvNClamp(dp3_f32(cb2._m0, _429), 0.0, 1.0);
    precise float _434 = _433 * _433;
    precise float _438 = dp2_f32(vec2(_434), vec2(_408)) - 0.5;
    precise float _439 = 1.0 - _428;
    precise float _440 = _439 * _439;
    precise float _441 = _440 * _440;
    precise float _442 = _439 * _441;
    precise float _444 = abs(dp3_f32(_424, vec3(_162, _163, _164)));
    precise float _445 = 1.0 - _444;
    precise float _446 = _445 * _445;
    precise float _447 = _446 * _446;
    precise float _448 = _445 * _447;
    precise float _450 = fma(_438, _448, 1.0) * fma(_438, _442, 1.0);
    precise float _451 = _408 * _408;
    precise float _452 = spvNMax(_451, 0.00200000009499490261077880859375);
    precise float _453 = 1.0 - _452;
    precise float _456 = _444 * fma(_428, _453, _452);
    precise float _458 = fma(_428, fma(_444, _453, _452), _456) + 9.9999997473787516355514526367188e-06;
    precise float _459 = 0.5 / _458;
    precise float _460 = _452 * _452;
    precise float _463 = fma(fma(_431, _460, -_431), _431, 1.0);
    precise float _464 = _460 * 0.3183098733425140380859375;
    precise float _466 = _464 / fma(_463, _463, 1.0000000116860974230803549289703e-07);
    precise float _467 = _466 * _459;
    precise float _468 = _467 * 3.1415927410125732421875;
    precise float _469 = _428 * _450;
    precise float _470 = _428 * _468;
    vec3 _472 = vec3(_398, _399, _400);
    precise float _476 = ((dp3_f32(_472, _472) == 0.0) ? 0.0 : 1.0) * spvNMax(_470, 0.0);
    precise float _477 = _469 * _378;
    precise float _478 = _469 * _379;
    precise float _479 = _469 * _380;
    precise float _480 = _378 * _476;
    precise float _481 = _379 * _476;
    precise float _482 = _380 * _476;
    precise float _483 = 1.0 - _433;
    precise float _484 = _483 * _483;
    precise float _485 = _484 * _484;
    precise float _486 = _483 * _485;
    precise float _487 = 1.0 - _398;
    precise float _488 = 1.0 - _399;
    precise float _489 = 1.0 - _400;
    precise float _493 = _480 * fma(_487, _486, _398);
    precise float _494 = _481 * fma(_488, _486, _399);
    precise float _495 = _482 * fma(_489, _486, _400);
    SV_Target.x = fma(_403, _477, _493);
    SV_Target.y = fma(_404, _478, _494);
    SV_Target.z = fma(_405, _479, _495);
    SV_Target.w = 1.0;
}

