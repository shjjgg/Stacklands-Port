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
} cb3;

layout(set = 0, binding = 4) uniform sampler s0;
layout(set = 0, binding = 5) uniform sampler s1;
layout(set = 0, binding = 6) uniform sampler s2;
layout(set = 0, binding = 7) uniform sampler s3;
layout(set = 0, binding = 8) uniform texture2D t0;
layout(set = 0, binding = 9) uniform texture2D t1;
layout(set = 0, binding = 10) uniform texture2D t2;
layout(set = 0, binding = 11) uniform texture3D t3;

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
    precise float _116 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _116));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _99 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _99)));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _87 = a.x * b.x;
    return fma(a.y, b.y, _87);
}

void main()
{
    precise float _140 = cb2._m0.x - TEXCOORD2.x;
    precise float _141 = cb2._m0.y - TEXCOORD2.y;
    precise float _142 = cb2._m0.z - TEXCOORD2.z;
    vec3 _143 = vec3(_140, _141, _142);
    precise float _145 = inversesqrt(dp3_f32(_143, _143));
    precise float _146 = _145 * _140;
    precise float _147 = _145 * _141;
    precise float _148 = _145 * _142;
    precise float _155 = cb1._m4.x - TEXCOORD2.x;
    precise float _156 = cb1._m4.y - TEXCOORD2.y;
    precise float _157 = cb1._m4.z - TEXCOORD2.z;
    vec3 _158 = vec3(_155, _156, _157);
    precise float _160 = inversesqrt(dp3_f32(_158, _158));
    precise float _161 = _160 * _155;
    precise float _162 = _160 * _156;
    precise float _163 = _160 * _157;
    vec4 _173 = texture(sampler2D(t0, s3), vec2(TEXCOORD.x, TEXCOORD.y));
    precise float _183 = _173.x * cb0._m10.x;
    precise float _184 = _173.y * cb0._m10.y;
    precise float _185 = _173.z * cb0._m10.z;
    precise float _186 = TEXCOORD.y + TEXCOORD.x;
    precise float _187 = _186 * 10.0;
    precise float _190 = roundEven(fract(_187)) + 0.800000011920928955078125;
    precise float _191 = spvNMin(_190, 1.0);
    precise float _192 = _191 * _183;
    precise float _193 = _191 * _184;
    precise float _194 = _191 * _185;
    bool _202 = (TEXCOORD.y > 0.949999988079071044921875) || ((TEXCOORD.y < 0.0500000007450580596923828125) || ((TEXCOORD.x > 0.863223135471343994140625) || (TEXCOORD.x < 0.13677684962749481201171875)));
    float _203 = _202 ? 0.0 : _192;
    float _204 = _202 ? 0.0 : _193;
    float _205 = _202 ? 0.0 : _194;
    precise float _213 = TEXCOORD2.y * cb0._m6.x;
    precise float _214 = TEXCOORD2.y * cb0._m6.y;
    precise float _215 = TEXCOORD2.y * cb0._m6.z;
    precise float _216 = TEXCOORD2.y * cb0._m6.w;
    precise float _243 = fma(cb0._m7.x, TEXCOORD2.z, fma(cb0._m5.x, TEXCOORD2.x, _213)) + cb0._m8.x;
    precise float _244 = fma(cb0._m7.y, TEXCOORD2.z, fma(cb0._m5.y, TEXCOORD2.x, _214)) + cb0._m8.y;
    precise float _245 = fma(cb0._m7.z, TEXCOORD2.z, fma(cb0._m5.z, TEXCOORD2.x, _215)) + cb0._m8.z;
    precise float _246 = fma(cb0._m7.w, TEXCOORD2.z, fma(cb0._m5.w, TEXCOORD2.x, _216)) + cb0._m8.w;
    float _323;
    float _324;
    float _325;
    float _326;
    if (cb3._m0.x == 1.0)
    {
        bool _256 = cb3._m0.y == 1.0;
        precise float _262 = TEXCOORD2.y * cb3._m3.x;
        precise float _263 = TEXCOORD2.y * cb3._m3.y;
        precise float _264 = TEXCOORD2.y * cb3._m3.z;
        precise float _286 = fma(cb3._m5.x, TEXCOORD2.z, fma(cb3._m1.x, TEXCOORD2.x, _262)) + cb3._m7.x;
        precise float _287 = fma(cb3._m5.y, TEXCOORD2.z, fma(cb3._m1.y, TEXCOORD2.x, _263)) + cb3._m7.y;
        precise float _288 = fma(cb3._m5.z, TEXCOORD2.z, fma(cb3._m1.z, TEXCOORD2.x, _264)) + cb3._m7.z;
        precise float _297 = (_256 ? _286 : TEXCOORD2.x) - cb3._m11.x;
        precise float _298 = (_256 ? _287 : TEXCOORD2.y) - cb3._m11.y;
        precise float _299 = (_256 ? _288 : TEXCOORD2.z) - cb3._m11.z;
        precise float _305 = _297 * cb3._m9.x;
        precise float _306 = _298 * cb3._m9.y;
        precise float _307 = _299 * cb3._m9.z;
        vec4 _318 = texture(sampler3D(t3, s0), vec3(spvNMax(fma(_305, 0.25, 0.75), fma(cb3._m0.z, 0.5, 0.75)), _306, _307));
        _323 = _318.w;
        _324 = _318.z;
        _325 = _318.y;
        _326 = _318.x;
    }
    else
    {
        _323 = 1.0;
        _324 = 1.0;
        _325 = 1.0;
        _326 = 1.0;
    }
    precise float _334 = _243 / _246;
    precise float _335 = _244 / _246;
    precise float _336 = _334 + 0.5;
    precise float _337 = _335 + 0.5;
    precise float _344 = float(_245 > 0.0) * texture(sampler2D(t1, s1), vec2(_336, _337)).w;
    vec3 _345 = vec3(_243, _244, _245);
    precise float _353 = _344 * texture(sampler2D(t2, s2), vec2(dp3_f32(_345, _345))).x;
    precise float _354 = spvNClamp(dp4_f32(vec4(_326, _325, _324, _323), cb2._m47), 0.0, 1.0) * _353;
    precise float _360 = _354 * cb0._m2.x;
    precise float _361 = _354 * cb0._m2.y;
    precise float _362 = _354 * cb0._m2.z;
    vec3 _369 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    precise float _371 = inversesqrt(dp3_f32(_369, _369));
    precise float _372 = _371 * TEXCOORD1.x;
    precise float _373 = _371 * TEXCOORD1.y;
    precise float _374 = _371 * TEXCOORD1.z;
    precise float _375 = _203 - 0.039999999105930328369140625;
    precise float _376 = _204 - 0.039999999105930328369140625;
    precise float _377 = _205 - 0.039999999105930328369140625;
    precise float _380 = fma(cb0._m9.y, _375, 0.039999999105930328369140625);
    precise float _381 = fma(cb0._m9.y, _376, 0.039999999105930328369140625);
    precise float _382 = fma(cb0._m9.y, _377, 0.039999999105930328369140625);
    precise float _384 = fma(-cb0._m9.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _385 = _384 * _203;
    precise float _386 = _384 * _204;
    precise float _387 = _384 * _205;
    precise float _390 = 1.0 - cb0._m9.x;
    precise float _391 = fma(_140, _145, _161);
    precise float _392 = fma(_141, _145, _162);
    precise float _393 = fma(_142, _145, _163);
    vec3 _394 = vec3(_391, _392, _393);
    precise float _397 = inversesqrt(spvNMax(dp3_f32(_394, _394), 0.001000000047497451305389404296875));
    precise float _398 = _397 * _391;
    precise float _399 = _397 * _392;
    precise float _400 = _397 * _393;
    vec3 _401 = vec3(_372, _373, _374);
    vec3 _404 = vec3(_146, _147, _148);
    precise float _406 = spvNClamp(dp3_f32(_401, _404), 0.0, 1.0);
    vec3 _407 = vec3(_398, _399, _400);
    precise float _409 = spvNClamp(dp3_f32(_401, _407), 0.0, 1.0);
    precise float _411 = spvNClamp(dp3_f32(_404, _407), 0.0, 1.0);
    precise float _412 = _411 * _411;
    precise float _416 = dp2_f32(vec2(_412), vec2(_390)) - 0.5;
    precise float _417 = 1.0 - _406;
    precise float _418 = _417 * _417;
    precise float _419 = _418 * _418;
    precise float _420 = _417 * _419;
    precise float _422 = abs(dp3_f32(_401, vec3(_161, _162, _163)));
    precise float _423 = 1.0 - _422;
    precise float _424 = _423 * _423;
    precise float _425 = _424 * _424;
    precise float _426 = _423 * _425;
    precise float _428 = fma(_416, _426, 1.0) * fma(_416, _420, 1.0);
    precise float _429 = _390 * _390;
    precise float _430 = spvNMax(_429, 0.00200000009499490261077880859375);
    precise float _431 = 1.0 - _430;
    precise float _434 = _422 * fma(_406, _431, _430);
    precise float _436 = fma(_406, fma(_422, _431, _430), _434) + 9.9999997473787516355514526367188e-06;
    precise float _437 = 0.5 / _436;
    precise float _438 = _430 * _430;
    precise float _441 = fma(fma(_409, _438, -_409), _409, 1.0);
    precise float _442 = _438 * 0.3183098733425140380859375;
    precise float _444 = _442 / fma(_441, _441, 1.0000000116860974230803549289703e-07);
    precise float _445 = _444 * _437;
    precise float _446 = _445 * 3.1415927410125732421875;
    precise float _447 = _406 * _428;
    precise float _448 = _406 * _446;
    vec3 _450 = vec3(_380, _381, _382);
    precise float _454 = ((dp3_f32(_450, _450) == 0.0) ? 0.0 : 1.0) * spvNMax(_448, 0.0);
    precise float _455 = _447 * _360;
    precise float _456 = _447 * _361;
    precise float _457 = _447 * _362;
    precise float _458 = _360 * _454;
    precise float _459 = _361 * _454;
    precise float _460 = _362 * _454;
    precise float _461 = 1.0 - _411;
    precise float _462 = _461 * _461;
    precise float _463 = _462 * _462;
    precise float _464 = _461 * _463;
    precise float _465 = 1.0 - _380;
    precise float _466 = 1.0 - _381;
    precise float _467 = 1.0 - _382;
    precise float _471 = _458 * fma(_465, _464, _380);
    precise float _472 = _459 * fma(_466, _464, _381);
    precise float _473 = _460 * fma(_467, _464, _382);
    SV_Target.x = fma(_385, _455, _471);
    SV_Target.y = fma(_386, _456, _472);
    SV_Target.z = fma(_387, _457, _473);
    SV_Target.w = 1.0;
}

