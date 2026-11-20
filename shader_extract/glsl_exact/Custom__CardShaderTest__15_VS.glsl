#version 450
#extension GL_EXT_buffer_reference2 : require
#extension GL_ARB_shader_draw_parameters : require
#extension GL_EXT_spirv_intrinsics : require

invariant gl_Position;

layout(set = 0, binding = 0, std140) uniform cb0_buf
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
    vec2 _m13;
    vec2 _m14;
} cb0;

layout(set = 0, binding = 1, std140) uniform cb1_buf
{
    uvec4 _m0;
    uvec4 _m1;
    uvec4 _m2;
    uvec4 _m3;
    uvec4 _m4;
    vec4 _m5;
} cb1;

layout(set = 0, binding = 2, std140) uniform cb2_buf
{
    uvec4 _m0;
    uvec4 _m1;
    uvec4 _m2;
    vec4 _m3;
    vec4 _m4;
    vec4 _m5;
    vec4 _m6;
    vec3 _m7;
    uint _m8;
    vec3 _m9;
    uint _m10;
    vec3 _m11;
    uint _m12;
    vec3 _m13;
    uint _m14;
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
    vec4 _m17;
    vec4 _m18;
    vec4 _m19;
    vec4 _m20;
} cb3;

layout(set = 0, binding = 4, std140) uniform cb4_buf
{
    uvec4 m;
} cb4;

layout(set = 0, binding = 5, std140) uniform cb5_buf
{
    vec4 m[4096];
} cb5;

layout(set = 0, binding = 6, std140) uniform cb6_buf
{
    vec4 m[4096];
} cb6;

layout(location = 0, component = 0) in vec4 POSITION;
layout(location = 2, component = 0) in vec3 NORMAL;
layout(location = 3, component = 0) in vec2 TEXCOORD;
layout(location = 1, component = 0) out vec2 TEXCOORD_1;
layout(location = 2, component = 0) out vec3 TEXCOORD1;
layout(location = 3, component = 0) out vec3 TEXCOORD2;
layout(location = 4, component = 0) out vec3 TEXCOORD3;
layout(location = 5, component = 0) out vec4 TEXCOORD5;
layout(location = 6, component = 0) out vec4 TEXCOORD6;
layout(location = 7, component = 0) out uint SV_InstanceID;

spirv_instruction(set = "GLSL.std.450", id = 80) float spvNMax(float, float);
spirv_instruction(set = "GLSL.std.450", id = 80) vec2 spvNMax(vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 80) vec3 spvNMax(vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 80) vec4 spvNMax(vec4, vec4);

float dp3_f32(vec3 a, vec3 b)
{
    precise float _102 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _102));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _84 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _84)));
}

void main()
{
    uint _114 = uint(gl_InstanceIndex - gl_BaseInstanceARB);
    uint _119 = _114 + cb4.m.x;
    uint _120 = _119 << 3u;
    uint _121 = _119 * 7u;
    uint _126 = _120 + 1u;
    precise float _134 = POSITION.y * cb5.m[_126].x;
    precise float _135 = POSITION.y * cb5.m[_126].y;
    precise float _136 = POSITION.y * cb5.m[_126].z;
    precise float _137 = POSITION.y * cb5.m[_126].w;
    precise float _146 = fma(cb5.m[_120].x, POSITION.x, _134);
    precise float _147 = fma(cb5.m[_120].y, POSITION.x, _135);
    precise float _148 = fma(cb5.m[_120].z, POSITION.x, _136);
    precise float _149 = fma(cb5.m[_120].w, POSITION.x, _137);
    uint _150 = _120 + 2u;
    precise float _159 = fma(cb5.m[_150].x, POSITION.z, _146);
    precise float _160 = fma(cb5.m[_150].y, POSITION.z, _147);
    precise float _161 = fma(cb5.m[_150].z, POSITION.z, _148);
    precise float _162 = fma(cb5.m[_150].w, POSITION.z, _149);
    uint _163 = _120 + 3u;
    precise float _170 = _159 + cb5.m[_163].x;
    precise float _171 = _160 + cb5.m[_163].y;
    precise float _172 = _161 + cb5.m[_163].z;
    precise float _173 = _162 + cb5.m[_163].w;
    precise float _181 = fma(cb5.m[_163].x, POSITION.w, _159);
    precise float _182 = fma(cb5.m[_163].y, POSITION.w, _160);
    precise float _183 = fma(cb5.m[_163].z, POSITION.w, _161);
    precise float _191 = _171 * cb3._m18.x;
    precise float _192 = _171 * cb3._m18.y;
    precise float _193 = _171 * cb3._m18.z;
    precise float _194 = _171 * cb3._m18.w;
    precise float _201 = fma(cb3._m17.x, _170, _191);
    precise float _202 = fma(cb3._m17.y, _170, _192);
    precise float _203 = fma(cb3._m17.z, _170, _193);
    precise float _204 = fma(cb3._m17.w, _170, _194);
    precise float _211 = fma(cb3._m19.x, _172, _201);
    precise float _212 = fma(cb3._m19.y, _172, _202);
    precise float _213 = fma(cb3._m19.z, _172, _203);
    precise float _214 = fma(cb3._m19.w, _172, _204);
    precise float _221 = fma(cb3._m20.x, _173, _211);
    precise float _222 = fma(cb3._m20.y, _173, _212);
    precise float _223 = fma(cb3._m20.z, _173, _213);
    precise float _224 = fma(cb3._m20.w, _173, _214);
    gl_Position.x = _221;
    gl_Position.y = _222;
    gl_Position.z = _223;
    gl_Position.w = _224;
    TEXCOORD_1.x = fma(TEXCOORD.x, cb0._m13.x, cb0._m14.x);
    TEXCOORD_1.y = fma(TEXCOORD.y, cb0._m13.y, cb0._m14.y);
    vec3 _254 = vec3(NORMAL.x, NORMAL.y, NORMAL.z);
    float _262 = dp3_f32(_254, vec3(cb5.m[_120 + 4u].xyz));
    float _270 = dp3_f32(_254, vec3(cb5.m[_120 + 5u].xyz));
    float _278 = dp3_f32(_254, vec3(cb5.m[_120 + 6u].xyz));
    vec3 _279 = vec3(_262, _270, _278);
    precise float _281 = inversesqrt(dp3_f32(_279, _279));
    precise float _282 = _281 * _262;
    precise float _283 = _281 * _270;
    precise float _284 = _281 * _278;
    TEXCOORD1.x = _282;
    TEXCOORD1.y = _283;
    TEXCOORD1.z = _284;
    TEXCOORD2.x = _181;
    TEXCOORD2.y = _182;
    TEXCOORD2.z = _183;
    precise float _291 = _283 * _283;
    precise float _293 = fma(_282, _282, -_291);
    precise float _294 = _283 * _282;
    precise float _295 = _284 * _283;
    precise float _296 = _284 * _284;
    precise float _297 = _282 * _284;
    vec4 _302 = vec4(_294, _295, _296, _297);
    uint _312 = _121 + 6u;
    precise float _328 = cb2._m4.x - _182;
    precise float _329 = cb2._m4.y - _182;
    precise float _330 = cb2._m4.z - _182;
    precise float _331 = cb2._m4.w - _182;
    precise float _332 = _283 * _328;
    precise float _333 = _283 * _329;
    precise float _334 = _283 * _330;
    precise float _335 = _283 * _331;
    precise float _336 = _328 * _328;
    precise float _337 = _329 * _329;
    precise float _338 = _330 * _330;
    precise float _339 = _331 * _331;
    precise float _346 = cb2._m3.x - _181;
    precise float _347 = cb2._m3.y - _181;
    precise float _348 = cb2._m3.z - _181;
    precise float _349 = cb2._m3.w - _181;
    precise float _356 = cb2._m5.x - _183;
    precise float _357 = cb2._m5.y - _183;
    precise float _358 = cb2._m5.z - _183;
    precise float _359 = cb2._m5.w - _183;
    precise float _376 = spvNMax(fma(_356, _356, fma(_346, _346, _336)), 9.9999999747524270787835121154785e-07);
    precise float _377 = spvNMax(fma(_357, _357, fma(_347, _347, _337)), 9.9999999747524270787835121154785e-07);
    precise float _378 = spvNMax(fma(_358, _358, fma(_348, _348, _338)), 9.9999999747524270787835121154785e-07);
    precise float _379 = spvNMax(fma(_359, _359, fma(_349, _349, _339)), 9.9999999747524270787835121154785e-07);
    precise float _394 = 1.0 / fma(_376, cb2._m6.x, 1.0);
    precise float _395 = 1.0 / fma(_377, cb2._m6.y, 1.0);
    precise float _396 = 1.0 / fma(_378, cb2._m6.z, 1.0);
    precise float _397 = 1.0 / fma(_379, cb2._m6.w, 1.0);
    precise float _398 = fma(_356, _284, fma(_346, _282, _332)) * inversesqrt(_376);
    precise float _399 = fma(_357, _284, fma(_347, _282, _333)) * inversesqrt(_377);
    precise float _400 = fma(_358, _284, fma(_348, _282, _334)) * inversesqrt(_378);
    precise float _401 = fma(_359, _284, fma(_349, _282, _335)) * inversesqrt(_379);
    precise float _406 = _394 * spvNMax(_398, 0.0);
    precise float _407 = _395 * spvNMax(_399, 0.0);
    precise float _408 = _396 * spvNMax(_400, 0.0);
    precise float _409 = _397 * spvNMax(_401, 0.0);
    precise float _416 = _407 * cb2._m9.x;
    precise float _417 = _407 * cb2._m9.y;
    precise float _418 = _407 * cb2._m9.z;
    precise float _443 = fma(cb6.m[_312].x, _293, dp4_f32(cb6.m[_121 + 3u], _302)) + fma(cb2._m13.x, _409, fma(cb2._m11.x, _408, fma(cb2._m7.x, _406, _416)));
    precise float _444 = fma(cb6.m[_312].y, _293, dp4_f32(cb6.m[_121 + 4u], _302)) + fma(cb2._m13.y, _409, fma(cb2._m11.y, _408, fma(cb2._m7.y, _406, _417)));
    precise float _445 = fma(cb6.m[_312].z, _293, dp4_f32(cb6.m[_121 + 5u], _302)) + fma(cb2._m13.z, _409, fma(cb2._m11.z, _408, fma(cb2._m7.z, _406, _418)));
    TEXCOORD3.x = _443;
    TEXCOORD3.y = _444;
    TEXCOORD3.z = _445;
    precise float _453 = _222 * cb1._m5.x;
    precise float _454 = _453 * 0.5;
    precise float _455 = _221 * 0.5;
    precise float _456 = _224 * 0.5;
    TEXCOORD5.z = _223;
    TEXCOORD5.w = _224;
    precise float _459 = _456 + _455;
    precise float _460 = _456 + _454;
    TEXCOORD5.x = _459;
    TEXCOORD5.y = _460;
    TEXCOORD6.x = 0.0;
    TEXCOORD6.y = 0.0;
    TEXCOORD6.z = 0.0;
    TEXCOORD6.w = 0.0;
    SV_InstanceID = _114;
}

