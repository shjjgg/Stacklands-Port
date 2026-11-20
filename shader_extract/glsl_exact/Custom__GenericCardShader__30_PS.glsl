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
    vec2 _m8;
    uvec2 _m9;
    vec4 _m10;
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
layout(set = 0, binding = 5) uniform texture3D t0;

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
    precise float _108 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _108));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _97 = a.x * b.x;
    return fma(a.y, b.y, _97);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _79 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _79)));
}

void main()
{
    precise float _132 = cb1._m4.x - TEXCOORD2.x;
    precise float _133 = cb1._m4.y - TEXCOORD2.y;
    precise float _134 = cb1._m4.z - TEXCOORD2.z;
    vec3 _135 = vec3(_132, _133, _134);
    precise float _137 = inversesqrt(dp3_f32(_135, _135));
    precise float _138 = _137 * _132;
    precise float _139 = _137 * _133;
    precise float _140 = _137 * _134;
    precise float _143 = TEXCOORD.y - 0.5;
    precise float _144 = _143 * 0.3333333432674407958984375;
    precise float _145 = _143 * 150.0;
    precise float _150 = abs(dFdx(_144)) + abs(dFdy(_144));
    precise float _153 = sin(roundEven(_145)) * 43758.546875;
    precise float _155 = fract(_153) - 0.5;
    precise float _158 = fma(_155, 0.004999999888241291046142578125, TEXCOORD.x);
    precise float _159 = _158 * 150.0;
    precise float _162 = sin(roundEven(_159)) * 43758.546875;
    precise float _164 = fract(_162) - 0.5;
    precise float _175 = cb0._m8.x - cb0._m10.x;
    precise float _176 = cb0._m8.y - cb0._m10.x;
    precise float _179 = abs(_158) - _175;
    precise float _180 = abs(fma(_164, 0.00166666670702397823333740234375, _144)) - _176;
    vec2 _183 = vec2(spvNMax(_179, 0.0), spvNMax(_180, 0.0));
    precise float _186 = sqrt(dp2_f32(_183, _183)) / _150;
    precise float _187 = spvNMin(_186, 1.0);
    precise float _196 = fma(_187, -cb0._m6.x, cb0._m6.x);
    precise float _197 = fma(_187, -cb0._m6.y, cb0._m6.y);
    precise float _198 = fma(_187, -cb0._m6.z, cb0._m6.z);
    float _275;
    float _276;
    float _277;
    float _278;
    if (cb3._m0.x == 1.0)
    {
        bool _208 = cb3._m0.y == 1.0;
        precise float _214 = TEXCOORD2.y * cb3._m3.x;
        precise float _215 = TEXCOORD2.y * cb3._m3.y;
        precise float _216 = TEXCOORD2.y * cb3._m3.z;
        precise float _238 = fma(cb3._m5.x, TEXCOORD2.z, fma(cb3._m1.x, TEXCOORD2.x, _214)) + cb3._m7.x;
        precise float _239 = fma(cb3._m5.y, TEXCOORD2.z, fma(cb3._m1.y, TEXCOORD2.x, _215)) + cb3._m7.y;
        precise float _240 = fma(cb3._m5.z, TEXCOORD2.z, fma(cb3._m1.z, TEXCOORD2.x, _216)) + cb3._m7.z;
        precise float _249 = (_208 ? _238 : TEXCOORD2.x) - cb3._m11.x;
        precise float _250 = (_208 ? _239 : TEXCOORD2.y) - cb3._m11.y;
        precise float _251 = (_208 ? _240 : TEXCOORD2.z) - cb3._m11.z;
        precise float _257 = _249 * cb3._m9.x;
        precise float _258 = _250 * cb3._m9.y;
        precise float _259 = _251 * cb3._m9.z;
        vec4 _270 = texture(sampler3D(t0, s0), vec3(spvNMax(fma(_257, 0.25, 0.75), fma(cb3._m0.z, 0.5, 0.75)), _258, _259));
        _275 = _270.w;
        _276 = _270.z;
        _277 = _270.y;
        _278 = _270.x;
    }
    else
    {
        _275 = 1.0;
        _276 = 1.0;
        _277 = 1.0;
        _278 = 1.0;
    }
    precise float _285 = spvNClamp(dp4_f32(vec4(_278, _277, _276, _275), cb2._m47), 0.0, 1.0);
    precise float _291 = _285 * cb0._m2.x;
    precise float _292 = _285 * cb0._m2.y;
    precise float _293 = _285 * cb0._m2.z;
    vec3 _300 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    precise float _302 = inversesqrt(dp3_f32(_300, _300));
    precise float _303 = _302 * TEXCOORD1.x;
    precise float _304 = _302 * TEXCOORD1.y;
    precise float _305 = _302 * TEXCOORD1.z;
    precise float _306 = _196 - 0.039999999105930328369140625;
    precise float _307 = _197 - 0.039999999105930328369140625;
    precise float _308 = _198 - 0.039999999105930328369140625;
    precise float _311 = fma(cb0._m5.y, _306, 0.039999999105930328369140625);
    precise float _312 = fma(cb0._m5.y, _307, 0.039999999105930328369140625);
    precise float _313 = fma(cb0._m5.y, _308, 0.039999999105930328369140625);
    precise float _315 = fma(-cb0._m5.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _316 = _315 * _196;
    precise float _317 = _315 * _197;
    precise float _318 = _315 * _198;
    precise float _321 = 1.0 - cb0._m5.x;
    precise float _327 = fma(_132, _137, cb2._m0.x);
    precise float _328 = fma(_133, _137, cb2._m0.y);
    precise float _329 = fma(_134, _137, cb2._m0.z);
    vec3 _330 = vec3(_327, _328, _329);
    precise float _333 = inversesqrt(spvNMax(dp3_f32(_330, _330), 0.001000000047497451305389404296875));
    precise float _334 = _333 * _327;
    precise float _335 = _333 * _328;
    precise float _336 = _333 * _329;
    vec3 _337 = vec3(_303, _304, _305);
    precise float _341 = spvNClamp(dp3_f32(_337, cb2._m0), 0.0, 1.0);
    vec3 _342 = vec3(_334, _335, _336);
    precise float _344 = spvNClamp(dp3_f32(_337, _342), 0.0, 1.0);
    precise float _346 = spvNClamp(dp3_f32(cb2._m0, _342), 0.0, 1.0);
    precise float _347 = _346 * _346;
    precise float _351 = dp2_f32(vec2(_347), vec2(_321)) - 0.5;
    precise float _352 = 1.0 - _341;
    precise float _353 = _352 * _352;
    precise float _354 = _353 * _353;
    precise float _355 = _352 * _354;
    precise float _357 = abs(dp3_f32(_337, vec3(_138, _139, _140)));
    precise float _358 = 1.0 - _357;
    precise float _359 = _358 * _358;
    precise float _360 = _359 * _359;
    precise float _361 = _358 * _360;
    precise float _363 = fma(_351, _361, 1.0) * fma(_351, _355, 1.0);
    precise float _364 = _321 * _321;
    precise float _365 = spvNMax(_364, 0.00200000009499490261077880859375);
    precise float _366 = 1.0 - _365;
    precise float _369 = _357 * fma(_341, _366, _365);
    precise float _371 = fma(_341, fma(_357, _366, _365), _369) + 9.9999997473787516355514526367188e-06;
    precise float _372 = 0.5 / _371;
    precise float _373 = _365 * _365;
    precise float _376 = fma(fma(_344, _373, -_344), _344, 1.0);
    precise float _377 = _373 * 0.3183098733425140380859375;
    precise float _379 = _377 / fma(_376, _376, 1.0000000116860974230803549289703e-07);
    precise float _380 = _379 * _372;
    precise float _381 = _380 * 3.1415927410125732421875;
    precise float _382 = _341 * _363;
    precise float _383 = _341 * _381;
    vec3 _385 = vec3(_311, _312, _313);
    precise float _389 = ((dp3_f32(_385, _385) == 0.0) ? 0.0 : 1.0) * spvNMax(_383, 0.0);
    precise float _390 = _382 * _291;
    precise float _391 = _382 * _292;
    precise float _392 = _382 * _293;
    precise float _393 = _291 * _389;
    precise float _394 = _292 * _389;
    precise float _395 = _293 * _389;
    precise float _396 = 1.0 - _346;
    precise float _397 = _396 * _396;
    precise float _398 = _397 * _397;
    precise float _399 = _396 * _398;
    precise float _400 = 1.0 - _311;
    precise float _401 = 1.0 - _312;
    precise float _402 = 1.0 - _313;
    precise float _406 = _393 * fma(_400, _399, _311);
    precise float _407 = _394 * fma(_401, _399, _312);
    precise float _408 = _395 * fma(_402, _399, _313);
    SV_Target.x = fma(_316, _390, _406);
    SV_Target.y = fma(_317, _391, _407);
    SV_Target.z = fma(_318, _392, _408);
    SV_Target.w = 1.0;
}

