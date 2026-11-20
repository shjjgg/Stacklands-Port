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
    vec2 _m6;
    vec2 _m7;
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
    precise float _101 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _101));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _83 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _83)));
}

void main()
{
    uint _113 = uint(gl_InstanceIndex - gl_BaseInstanceARB);
    uint _118 = _113 + cb4.m.x;
    uint _119 = _118 << 3u;
    uint _120 = _118 * 7u;
    uint _125 = _119 + 1u;
    precise float _133 = POSITION.y * cb5.m[_125].x;
    precise float _134 = POSITION.y * cb5.m[_125].y;
    precise float _135 = POSITION.y * cb5.m[_125].z;
    precise float _136 = POSITION.y * cb5.m[_125].w;
    precise float _145 = fma(cb5.m[_119].x, POSITION.x, _133);
    precise float _146 = fma(cb5.m[_119].y, POSITION.x, _134);
    precise float _147 = fma(cb5.m[_119].z, POSITION.x, _135);
    precise float _148 = fma(cb5.m[_119].w, POSITION.x, _136);
    uint _149 = _119 + 2u;
    precise float _158 = fma(cb5.m[_149].x, POSITION.z, _145);
    precise float _159 = fma(cb5.m[_149].y, POSITION.z, _146);
    precise float _160 = fma(cb5.m[_149].z, POSITION.z, _147);
    precise float _161 = fma(cb5.m[_149].w, POSITION.z, _148);
    uint _162 = _119 + 3u;
    precise float _169 = _158 + cb5.m[_162].x;
    precise float _170 = _159 + cb5.m[_162].y;
    precise float _171 = _160 + cb5.m[_162].z;
    precise float _172 = _161 + cb5.m[_162].w;
    precise float _180 = fma(cb5.m[_162].x, POSITION.w, _158);
    precise float _181 = fma(cb5.m[_162].y, POSITION.w, _159);
    precise float _182 = fma(cb5.m[_162].z, POSITION.w, _160);
    precise float _190 = _170 * cb3._m18.x;
    precise float _191 = _170 * cb3._m18.y;
    precise float _192 = _170 * cb3._m18.z;
    precise float _193 = _170 * cb3._m18.w;
    precise float _200 = fma(cb3._m17.x, _169, _190);
    precise float _201 = fma(cb3._m17.y, _169, _191);
    precise float _202 = fma(cb3._m17.z, _169, _192);
    precise float _203 = fma(cb3._m17.w, _169, _193);
    precise float _210 = fma(cb3._m19.x, _171, _200);
    precise float _211 = fma(cb3._m19.y, _171, _201);
    precise float _212 = fma(cb3._m19.z, _171, _202);
    precise float _213 = fma(cb3._m19.w, _171, _203);
    precise float _220 = fma(cb3._m20.x, _172, _210);
    precise float _221 = fma(cb3._m20.y, _172, _211);
    precise float _222 = fma(cb3._m20.z, _172, _212);
    precise float _223 = fma(cb3._m20.w, _172, _213);
    gl_Position.x = _220;
    gl_Position.y = _221;
    gl_Position.z = _222;
    gl_Position.w = _223;
    TEXCOORD_1.x = fma(TEXCOORD.x, cb0._m6.x, cb0._m7.x);
    TEXCOORD_1.y = fma(TEXCOORD.y, cb0._m6.y, cb0._m7.y);
    vec3 _253 = vec3(NORMAL.x, NORMAL.y, NORMAL.z);
    float _261 = dp3_f32(_253, vec3(cb5.m[_119 + 4u].xyz));
    float _269 = dp3_f32(_253, vec3(cb5.m[_119 + 5u].xyz));
    float _277 = dp3_f32(_253, vec3(cb5.m[_119 + 6u].xyz));
    vec3 _278 = vec3(_261, _269, _277);
    precise float _280 = inversesqrt(dp3_f32(_278, _278));
    precise float _281 = _280 * _261;
    precise float _282 = _280 * _269;
    precise float _283 = _280 * _277;
    TEXCOORD1.x = _281;
    TEXCOORD1.y = _282;
    TEXCOORD1.z = _283;
    TEXCOORD2.x = _180;
    TEXCOORD2.y = _181;
    TEXCOORD2.z = _182;
    precise float _290 = _282 * _282;
    precise float _292 = fma(_281, _281, -_290);
    precise float _293 = _282 * _281;
    precise float _294 = _283 * _282;
    precise float _295 = _283 * _283;
    precise float _296 = _281 * _283;
    vec4 _301 = vec4(_293, _294, _295, _296);
    uint _311 = _120 + 6u;
    precise float _327 = cb2._m4.x - _181;
    precise float _328 = cb2._m4.y - _181;
    precise float _329 = cb2._m4.z - _181;
    precise float _330 = cb2._m4.w - _181;
    precise float _331 = _282 * _327;
    precise float _332 = _282 * _328;
    precise float _333 = _282 * _329;
    precise float _334 = _282 * _330;
    precise float _335 = _327 * _327;
    precise float _336 = _328 * _328;
    precise float _337 = _329 * _329;
    precise float _338 = _330 * _330;
    precise float _345 = cb2._m3.x - _180;
    precise float _346 = cb2._m3.y - _180;
    precise float _347 = cb2._m3.z - _180;
    precise float _348 = cb2._m3.w - _180;
    precise float _355 = cb2._m5.x - _182;
    precise float _356 = cb2._m5.y - _182;
    precise float _357 = cb2._m5.z - _182;
    precise float _358 = cb2._m5.w - _182;
    precise float _375 = spvNMax(fma(_355, _355, fma(_345, _345, _335)), 9.9999999747524270787835121154785e-07);
    precise float _376 = spvNMax(fma(_356, _356, fma(_346, _346, _336)), 9.9999999747524270787835121154785e-07);
    precise float _377 = spvNMax(fma(_357, _357, fma(_347, _347, _337)), 9.9999999747524270787835121154785e-07);
    precise float _378 = spvNMax(fma(_358, _358, fma(_348, _348, _338)), 9.9999999747524270787835121154785e-07);
    precise float _393 = 1.0 / fma(_375, cb2._m6.x, 1.0);
    precise float _394 = 1.0 / fma(_376, cb2._m6.y, 1.0);
    precise float _395 = 1.0 / fma(_377, cb2._m6.z, 1.0);
    precise float _396 = 1.0 / fma(_378, cb2._m6.w, 1.0);
    precise float _397 = fma(_355, _283, fma(_345, _281, _331)) * inversesqrt(_375);
    precise float _398 = fma(_356, _283, fma(_346, _281, _332)) * inversesqrt(_376);
    precise float _399 = fma(_357, _283, fma(_347, _281, _333)) * inversesqrt(_377);
    precise float _400 = fma(_358, _283, fma(_348, _281, _334)) * inversesqrt(_378);
    precise float _405 = _393 * spvNMax(_397, 0.0);
    precise float _406 = _394 * spvNMax(_398, 0.0);
    precise float _407 = _395 * spvNMax(_399, 0.0);
    precise float _408 = _396 * spvNMax(_400, 0.0);
    precise float _415 = _406 * cb2._m9.x;
    precise float _416 = _406 * cb2._m9.y;
    precise float _417 = _406 * cb2._m9.z;
    precise float _442 = fma(cb6.m[_311].x, _292, dp4_f32(cb6.m[_120 + 3u], _301)) + fma(cb2._m13.x, _408, fma(cb2._m11.x, _407, fma(cb2._m7.x, _405, _415)));
    precise float _443 = fma(cb6.m[_311].y, _292, dp4_f32(cb6.m[_120 + 4u], _301)) + fma(cb2._m13.y, _408, fma(cb2._m11.y, _407, fma(cb2._m7.y, _405, _416)));
    precise float _444 = fma(cb6.m[_311].z, _292, dp4_f32(cb6.m[_120 + 5u], _301)) + fma(cb2._m13.z, _408, fma(cb2._m11.z, _407, fma(cb2._m7.z, _405, _417)));
    TEXCOORD3.x = _442;
    TEXCOORD3.y = _443;
    TEXCOORD3.z = _444;
    precise float _452 = _221 * cb1._m5.x;
    precise float _453 = _452 * 0.5;
    precise float _454 = _220 * 0.5;
    precise float _455 = _223 * 0.5;
    TEXCOORD5.z = _222;
    TEXCOORD5.w = _223;
    precise float _458 = _455 + _454;
    precise float _459 = _455 + _453;
    TEXCOORD5.x = _458;
    TEXCOORD5.y = _459;
    TEXCOORD6.x = 0.0;
    TEXCOORD6.y = 0.0;
    TEXCOORD6.z = 0.0;
    TEXCOORD6.w = 0.0;
    SV_InstanceID = _113;
}

