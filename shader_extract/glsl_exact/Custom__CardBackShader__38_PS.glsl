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
layout(set = 0, binding = 6) uniform texture2D t0;
layout(set = 0, binding = 7) uniform texture3D t1;

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
    precise float _110 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _110));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _93 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _93)));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _81 = a.x * b.x;
    return fma(a.y, b.y, _81);
}

void main()
{
    precise float _134 = cb1._m4.x - TEXCOORD2.x;
    precise float _135 = cb1._m4.y - TEXCOORD2.y;
    precise float _136 = cb1._m4.z - TEXCOORD2.z;
    vec3 _137 = vec3(_134, _135, _136);
    precise float _139 = inversesqrt(dp3_f32(_137, _137));
    precise float _140 = _139 * _134;
    precise float _141 = _139 * _135;
    precise float _142 = _139 * _136;
    vec4 _152 = texture(sampler2D(t0, s1), vec2(TEXCOORD.x, TEXCOORD.y));
    precise float _162 = _152.x * cb0._m6.x;
    precise float _163 = _152.y * cb0._m6.y;
    precise float _164 = _152.z * cb0._m6.z;
    precise float _165 = TEXCOORD.y + TEXCOORD.x;
    precise float _166 = _165 * 10.0;
    precise float _169 = roundEven(fract(_166)) + 0.800000011920928955078125;
    precise float _170 = spvNMin(_169, 1.0);
    precise float _171 = _170 * _162;
    precise float _172 = _170 * _163;
    precise float _173 = _170 * _164;
    bool _181 = (TEXCOORD.y > 0.949999988079071044921875) || ((TEXCOORD.y < 0.0500000007450580596923828125) || ((TEXCOORD.x > 0.863223135471343994140625) || (TEXCOORD.x < 0.13677684962749481201171875)));
    float _182 = _181 ? 0.0 : _171;
    float _183 = _181 ? 0.0 : _172;
    float _184 = _181 ? 0.0 : _173;
    float _261;
    float _262;
    float _263;
    float _264;
    if (cb3._m0.x == 1.0)
    {
        bool _194 = cb3._m0.y == 1.0;
        precise float _200 = TEXCOORD2.y * cb3._m3.x;
        precise float _201 = TEXCOORD2.y * cb3._m3.y;
        precise float _202 = TEXCOORD2.y * cb3._m3.z;
        precise float _224 = fma(cb3._m5.x, TEXCOORD2.z, fma(cb3._m1.x, TEXCOORD2.x, _200)) + cb3._m7.x;
        precise float _225 = fma(cb3._m5.y, TEXCOORD2.z, fma(cb3._m1.y, TEXCOORD2.x, _201)) + cb3._m7.y;
        precise float _226 = fma(cb3._m5.z, TEXCOORD2.z, fma(cb3._m1.z, TEXCOORD2.x, _202)) + cb3._m7.z;
        precise float _235 = (_194 ? _224 : TEXCOORD2.x) - cb3._m11.x;
        precise float _236 = (_194 ? _225 : TEXCOORD2.y) - cb3._m11.y;
        precise float _237 = (_194 ? _226 : TEXCOORD2.z) - cb3._m11.z;
        precise float _243 = _235 * cb3._m9.x;
        precise float _244 = _236 * cb3._m9.y;
        precise float _245 = _237 * cb3._m9.z;
        vec4 _256 = texture(sampler3D(t1, s0), vec3(spvNMax(fma(_243, 0.25, 0.75), fma(cb3._m0.z, 0.5, 0.75)), _244, _245));
        _261 = _256.w;
        _262 = _256.z;
        _263 = _256.y;
        _264 = _256.x;
    }
    else
    {
        _261 = 1.0;
        _262 = 1.0;
        _263 = 1.0;
        _264 = 1.0;
    }
    precise float _271 = spvNClamp(dp4_f32(vec4(_264, _263, _262, _261), cb2._m47), 0.0, 1.0);
    precise float _277 = _271 * cb0._m2.x;
    precise float _278 = _271 * cb0._m2.y;
    precise float _279 = _271 * cb0._m2.z;
    vec3 _286 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    precise float _288 = inversesqrt(dp3_f32(_286, _286));
    precise float _289 = _288 * TEXCOORD1.x;
    precise float _290 = _288 * TEXCOORD1.y;
    precise float _291 = _288 * TEXCOORD1.z;
    precise float _292 = _182 - 0.039999999105930328369140625;
    precise float _293 = _183 - 0.039999999105930328369140625;
    precise float _294 = _184 - 0.039999999105930328369140625;
    precise float _297 = fma(cb0._m5.y, _292, 0.039999999105930328369140625);
    precise float _298 = fma(cb0._m5.y, _293, 0.039999999105930328369140625);
    precise float _299 = fma(cb0._m5.y, _294, 0.039999999105930328369140625);
    precise float _301 = fma(-cb0._m5.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _302 = _301 * _182;
    precise float _303 = _301 * _183;
    precise float _304 = _301 * _184;
    precise float _307 = 1.0 - cb0._m5.x;
    precise float _313 = fma(_134, _139, cb2._m0.x);
    precise float _314 = fma(_135, _139, cb2._m0.y);
    precise float _315 = fma(_136, _139, cb2._m0.z);
    vec3 _316 = vec3(_313, _314, _315);
    precise float _319 = inversesqrt(spvNMax(dp3_f32(_316, _316), 0.001000000047497451305389404296875));
    precise float _320 = _319 * _313;
    precise float _321 = _319 * _314;
    precise float _322 = _319 * _315;
    vec3 _323 = vec3(_289, _290, _291);
    precise float _327 = spvNClamp(dp3_f32(_323, cb2._m0), 0.0, 1.0);
    vec3 _328 = vec3(_320, _321, _322);
    precise float _330 = spvNClamp(dp3_f32(_323, _328), 0.0, 1.0);
    precise float _332 = spvNClamp(dp3_f32(cb2._m0, _328), 0.0, 1.0);
    precise float _333 = _332 * _332;
    precise float _337 = dp2_f32(vec2(_333), vec2(_307)) - 0.5;
    precise float _338 = 1.0 - _327;
    precise float _339 = _338 * _338;
    precise float _340 = _339 * _339;
    precise float _341 = _338 * _340;
    precise float _343 = abs(dp3_f32(_323, vec3(_140, _141, _142)));
    precise float _344 = 1.0 - _343;
    precise float _345 = _344 * _344;
    precise float _346 = _345 * _345;
    precise float _347 = _344 * _346;
    precise float _349 = fma(_337, _347, 1.0) * fma(_337, _341, 1.0);
    precise float _350 = _307 * _307;
    precise float _351 = spvNMax(_350, 0.00200000009499490261077880859375);
    precise float _352 = 1.0 - _351;
    precise float _355 = _343 * fma(_327, _352, _351);
    precise float _357 = fma(_327, fma(_343, _352, _351), _355) + 9.9999997473787516355514526367188e-06;
    precise float _358 = 0.5 / _357;
    precise float _359 = _351 * _351;
    precise float _362 = fma(fma(_330, _359, -_330), _330, 1.0);
    precise float _363 = _359 * 0.3183098733425140380859375;
    precise float _365 = _363 / fma(_362, _362, 1.0000000116860974230803549289703e-07);
    precise float _366 = _365 * _358;
    precise float _367 = _366 * 3.1415927410125732421875;
    precise float _368 = _327 * _349;
    precise float _369 = _327 * _367;
    vec3 _371 = vec3(_297, _298, _299);
    precise float _375 = ((dp3_f32(_371, _371) == 0.0) ? 0.0 : 1.0) * spvNMax(_369, 0.0);
    precise float _376 = _368 * _277;
    precise float _377 = _368 * _278;
    precise float _378 = _368 * _279;
    precise float _379 = _277 * _375;
    precise float _380 = _278 * _375;
    precise float _381 = _279 * _375;
    precise float _382 = 1.0 - _332;
    precise float _383 = _382 * _382;
    precise float _384 = _383 * _383;
    precise float _385 = _382 * _384;
    precise float _386 = 1.0 - _297;
    precise float _387 = 1.0 - _298;
    precise float _388 = 1.0 - _299;
    precise float _392 = _379 * fma(_386, _385, _297);
    precise float _393 = _380 * fma(_387, _385, _298);
    precise float _394 = _381 * fma(_388, _385, _299);
    SV_Target.x = fma(_302, _376, _392);
    SV_Target.y = fma(_303, _377, _393);
    SV_Target.z = fma(_304, _378, _394);
    SV_Target.w = 1.0;
}

