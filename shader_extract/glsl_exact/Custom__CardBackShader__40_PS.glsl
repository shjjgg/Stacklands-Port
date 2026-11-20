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
layout(set = 0, binding = 10) uniform textureCube t2;
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
    precise float _117 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _117));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _100 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _100)));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _88 = a.x * b.x;
    return fma(a.y, b.y, _88);
}

void main()
{
    precise float _141 = cb2._m0.x - TEXCOORD2.x;
    precise float _142 = cb2._m0.y - TEXCOORD2.y;
    precise float _143 = cb2._m0.z - TEXCOORD2.z;
    vec3 _144 = vec3(_141, _142, _143);
    precise float _146 = inversesqrt(dp3_f32(_144, _144));
    precise float _147 = _146 * _141;
    precise float _148 = _146 * _142;
    precise float _149 = _146 * _143;
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
    bool _203 = (TEXCOORD.y > 0.949999988079071044921875) || ((TEXCOORD.y < 0.0500000007450580596923828125) || ((TEXCOORD.x > 0.863223135471343994140625) || (TEXCOORD.x < 0.13677684962749481201171875)));
    float _204 = _203 ? 0.0 : _193;
    float _205 = _203 ? 0.0 : _194;
    float _206 = _203 ? 0.0 : _195;
    precise float _212 = TEXCOORD2.y * cb0._m7.x;
    precise float _213 = TEXCOORD2.y * cb0._m7.y;
    precise float _214 = TEXCOORD2.y * cb0._m7.z;
    precise float _236 = fma(cb0._m9.x, TEXCOORD2.z, fma(cb0._m5.x, TEXCOORD2.x, _212)) + cb0._m11.x;
    precise float _237 = fma(cb0._m9.y, TEXCOORD2.z, fma(cb0._m5.y, TEXCOORD2.x, _213)) + cb0._m11.y;
    precise float _238 = fma(cb0._m9.z, TEXCOORD2.z, fma(cb0._m5.z, TEXCOORD2.x, _214)) + cb0._m11.z;
    float _315;
    float _316;
    float _317;
    float _318;
    if (cb3._m0.x == 1.0)
    {
        bool _248 = cb3._m0.y == 1.0;
        precise float _254 = TEXCOORD2.y * cb3._m3.x;
        precise float _255 = TEXCOORD2.y * cb3._m3.y;
        precise float _256 = TEXCOORD2.y * cb3._m3.z;
        precise float _278 = fma(cb3._m5.x, TEXCOORD2.z, fma(cb3._m1.x, TEXCOORD2.x, _254)) + cb3._m7.x;
        precise float _279 = fma(cb3._m5.y, TEXCOORD2.z, fma(cb3._m1.y, TEXCOORD2.x, _255)) + cb3._m7.y;
        precise float _280 = fma(cb3._m5.z, TEXCOORD2.z, fma(cb3._m1.z, TEXCOORD2.x, _256)) + cb3._m7.z;
        precise float _289 = (_248 ? _278 : TEXCOORD2.x) - cb3._m11.x;
        precise float _290 = (_248 ? _279 : TEXCOORD2.y) - cb3._m11.y;
        precise float _291 = (_248 ? _280 : TEXCOORD2.z) - cb3._m11.z;
        precise float _297 = _289 * cb3._m9.x;
        precise float _298 = _290 * cb3._m9.y;
        precise float _299 = _291 * cb3._m9.z;
        vec4 _310 = texture(sampler3D(t3, s0), vec3(spvNMax(fma(_297, 0.25, 0.75), fma(cb3._m0.z, 0.5, 0.75)), _298, _299));
        _315 = _310.w;
        _316 = _310.z;
        _317 = _310.y;
        _318 = _310.x;
    }
    else
    {
        _315 = 1.0;
        _316 = 1.0;
        _317 = 1.0;
        _318 = 1.0;
    }
    vec3 _325 = vec3(_236, _237, _238);
    precise float _339 = texture(samplerCube(t2, s1), _325).w * texture(sampler2D(t1, s2), vec2(dp3_f32(_325, _325))).x;
    precise float _340 = spvNClamp(dp4_f32(vec4(_318, _317, _316, _315), cb2._m47), 0.0, 1.0) * _339;
    precise float _346 = _340 * cb0._m2.x;
    precise float _347 = _340 * cb0._m2.y;
    precise float _348 = _340 * cb0._m2.z;
    vec3 _355 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    precise float _357 = inversesqrt(dp3_f32(_355, _355));
    precise float _358 = _357 * TEXCOORD1.x;
    precise float _359 = _357 * TEXCOORD1.y;
    precise float _360 = _357 * TEXCOORD1.z;
    precise float _361 = _204 - 0.039999999105930328369140625;
    precise float _362 = _205 - 0.039999999105930328369140625;
    precise float _363 = _206 - 0.039999999105930328369140625;
    precise float _366 = fma(cb0._m13.y, _361, 0.039999999105930328369140625);
    precise float _367 = fma(cb0._m13.y, _362, 0.039999999105930328369140625);
    precise float _368 = fma(cb0._m13.y, _363, 0.039999999105930328369140625);
    precise float _370 = fma(-cb0._m13.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _371 = _370 * _204;
    precise float _372 = _370 * _205;
    precise float _373 = _370 * _206;
    precise float _376 = 1.0 - cb0._m13.x;
    precise float _377 = fma(_141, _146, _162);
    precise float _378 = fma(_142, _146, _163);
    precise float _379 = fma(_143, _146, _164);
    vec3 _380 = vec3(_377, _378, _379);
    precise float _383 = inversesqrt(spvNMax(dp3_f32(_380, _380), 0.001000000047497451305389404296875));
    precise float _384 = _383 * _377;
    precise float _385 = _383 * _378;
    precise float _386 = _383 * _379;
    vec3 _387 = vec3(_358, _359, _360);
    vec3 _390 = vec3(_147, _148, _149);
    precise float _392 = spvNClamp(dp3_f32(_387, _390), 0.0, 1.0);
    vec3 _393 = vec3(_384, _385, _386);
    precise float _395 = spvNClamp(dp3_f32(_387, _393), 0.0, 1.0);
    precise float _397 = spvNClamp(dp3_f32(_390, _393), 0.0, 1.0);
    precise float _398 = _397 * _397;
    precise float _402 = dp2_f32(vec2(_398), vec2(_376)) - 0.5;
    precise float _403 = 1.0 - _392;
    precise float _404 = _403 * _403;
    precise float _405 = _404 * _404;
    precise float _406 = _403 * _405;
    precise float _408 = abs(dp3_f32(_387, vec3(_162, _163, _164)));
    precise float _409 = 1.0 - _408;
    precise float _410 = _409 * _409;
    precise float _411 = _410 * _410;
    precise float _412 = _409 * _411;
    precise float _414 = fma(_402, _412, 1.0) * fma(_402, _406, 1.0);
    precise float _415 = _376 * _376;
    precise float _416 = spvNMax(_415, 0.00200000009499490261077880859375);
    precise float _417 = 1.0 - _416;
    precise float _420 = _408 * fma(_392, _417, _416);
    precise float _422 = fma(_392, fma(_408, _417, _416), _420) + 9.9999997473787516355514526367188e-06;
    precise float _423 = 0.5 / _422;
    precise float _424 = _416 * _416;
    precise float _427 = fma(fma(_395, _424, -_395), _395, 1.0);
    precise float _428 = _424 * 0.3183098733425140380859375;
    precise float _430 = _428 / fma(_427, _427, 1.0000000116860974230803549289703e-07);
    precise float _431 = _430 * _423;
    precise float _432 = _431 * 3.1415927410125732421875;
    precise float _433 = _392 * _414;
    precise float _434 = _392 * _432;
    vec3 _436 = vec3(_366, _367, _368);
    precise float _440 = ((dp3_f32(_436, _436) == 0.0) ? 0.0 : 1.0) * spvNMax(_434, 0.0);
    precise float _441 = _433 * _346;
    precise float _442 = _433 * _347;
    precise float _443 = _433 * _348;
    precise float _444 = _346 * _440;
    precise float _445 = _347 * _440;
    precise float _446 = _348 * _440;
    precise float _447 = 1.0 - _397;
    precise float _448 = _447 * _447;
    precise float _449 = _448 * _448;
    precise float _450 = _447 * _449;
    precise float _451 = 1.0 - _366;
    precise float _452 = 1.0 - _367;
    precise float _453 = 1.0 - _368;
    precise float _457 = _444 * fma(_451, _450, _366);
    precise float _458 = _445 * fma(_452, _450, _367);
    precise float _459 = _446 * fma(_453, _450, _368);
    SV_Target.x = fma(_371, _441, _457);
    SV_Target.y = fma(_372, _442, _458);
    SV_Target.z = fma(_373, _443, _459);
    SV_Target.w = 1.0;
}

