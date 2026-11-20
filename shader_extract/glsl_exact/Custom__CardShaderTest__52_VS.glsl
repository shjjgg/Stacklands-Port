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
    vec3 _m0;
    float _m1;
} cb1;

layout(set = 0, binding = 2, std140) uniform cb2_buf
{
    uvec4 _m0;
    uvec4 _m1;
    uvec4 _m2;
    uvec4 _m3;
    uvec4 _m4;
    vec4 _m5;
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

layout(location = 0, component = 0) in vec4 POSITION;
layout(location = 2, component = 0) in vec3 NORMAL;
layout(location = 3, component = 0) in vec2 TEXCOORD;
layout(location = 1, component = 0) out vec2 TEXCOORD1;
layout(location = 2, component = 0) out vec3 TEXCOORD2;
layout(location = 3, component = 0) out uint SV_InstanceID;

spirv_instruction(set = "GLSL.std.450", id = 79) float spvNMin(float, float);
spirv_instruction(set = "GLSL.std.450", id = 79) vec2 spvNMin(vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 79) vec3 spvNMin(vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 79) vec4 spvNMin(vec4, vec4);
spirv_instruction(set = "GLSL.std.450", id = 80) float spvNMax(float, float);
spirv_instruction(set = "GLSL.std.450", id = 80) vec2 spvNMax(vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 80) vec3 spvNMax(vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 80) vec4 spvNMax(vec4, vec4);

float dp3_f32(vec3 a, vec3 b)
{
    precise float _74 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _74));
}

void main()
{
    uint _87 = uint(gl_InstanceIndex - gl_BaseInstanceARB);
    uint _92 = _87 + cb4.m.x;
    TEXCOORD1.x = fma(TEXCOORD.x, cb0._m13.x, cb0._m14.x);
    TEXCOORD1.y = fma(TEXCOORD.y, cb0._m13.y, cb0._m14.y);
    uint _113 = _92 << 3u;
    uint _117 = _113 + 1u;
    precise float _124 = POSITION.y * cb5.m[_117].x;
    precise float _125 = POSITION.y * cb5.m[_117].y;
    precise float _126 = POSITION.y * cb5.m[_117].z;
    uint _137 = _113 + 2u;
    uint _148 = _113 + 3u;
    TEXCOORD2.x = fma(cb5.m[_148].x, POSITION.w, fma(cb5.m[_137].x, POSITION.z, fma(cb5.m[_113].x, POSITION.x, _124)));
    TEXCOORD2.y = fma(cb5.m[_148].y, POSITION.w, fma(cb5.m[_137].y, POSITION.z, fma(cb5.m[_113].y, POSITION.x, _125)));
    TEXCOORD2.z = fma(cb5.m[_148].z, POSITION.w, fma(cb5.m[_137].z, POSITION.z, fma(cb5.m[_113].z, POSITION.x, _126)));
    precise float _170 = POSITION.y * cb5.m[_117].x;
    precise float _171 = POSITION.y * cb5.m[_117].y;
    precise float _172 = POSITION.y * cb5.m[_117].z;
    precise float _173 = POSITION.y * cb5.m[_117].w;
    precise float _185 = fma(cb5.m[_113].w, POSITION.x, _173);
    precise float _197 = fma(cb5.m[_137].w, POSITION.z, _185);
    precise float _206 = fma(cb5.m[_148].x, POSITION.w, fma(cb5.m[_137].x, POSITION.z, fma(cb5.m[_113].x, POSITION.x, _170)));
    precise float _207 = fma(cb5.m[_148].y, POSITION.w, fma(cb5.m[_137].y, POSITION.z, fma(cb5.m[_113].y, POSITION.x, _171)));
    precise float _208 = fma(cb5.m[_148].z, POSITION.w, fma(cb5.m[_137].z, POSITION.z, fma(cb5.m[_113].z, POSITION.x, _172)));
    precise float _209 = fma(cb5.m[_148].w, POSITION.w, _197);
    float _289;
    float _290;
    float _291;
    if (cb2._m5.z != 0.0)
    {
        vec3 _224 = vec3(NORMAL.x, NORMAL.y, NORMAL.z);
        float _232 = dp3_f32(_224, vec3(cb5.m[_113 + 4u].xyz));
        float _240 = dp3_f32(_224, vec3(cb5.m[_113 + 5u].xyz));
        float _248 = dp3_f32(_224, vec3(cb5.m[_113 + 6u].xyz));
        vec3 _249 = vec3(_232, _240, _248);
        precise float _251 = inversesqrt(dp3_f32(_249, _249));
        precise float _252 = _251 * _232;
        precise float _253 = _251 * _240;
        precise float _254 = _251 * _248;
        precise float _267 = fma(-_206, cb1._m1, cb1._m0.x);
        precise float _268 = fma(-_207, cb1._m1, cb1._m0.y);
        precise float _269 = fma(-_208, cb1._m1, cb1._m0.z);
        vec3 _270 = vec3(_267, _268, _269);
        precise float _272 = inversesqrt(dp3_f32(_270, _270));
        precise float _273 = _272 * _267;
        precise float _274 = _272 * _268;
        precise float _275 = _272 * _269;
        float _278 = dp3_f32(vec3(_252, _253, _254), vec3(_273, _274, _275));
        precise float _282 = sqrt(fma(-_278, _278, 1.0)) * cb2._m5.z;
        _289 = fma(-_254, _282, _208);
        _290 = fma(-_252, _282, _206);
        _291 = fma(-_253, _282, _207);
    }
    else
    {
        _289 = _208;
        _290 = _206;
        _291 = _207;
    }
    precise float _299 = _291 * cb3._m18.x;
    precise float _300 = _291 * cb3._m18.y;
    precise float _301 = _291 * cb3._m18.z;
    precise float _302 = _291 * cb3._m18.w;
    precise float _309 = fma(cb3._m17.x, _290, _299);
    precise float _310 = fma(cb3._m17.y, _290, _300);
    precise float _311 = fma(cb3._m17.z, _290, _301);
    precise float _312 = fma(cb3._m17.w, _290, _302);
    precise float _319 = fma(cb3._m19.x, _289, _309);
    precise float _320 = fma(cb3._m19.y, _289, _310);
    precise float _321 = fma(cb3._m19.z, _289, _311);
    precise float _322 = fma(cb3._m19.w, _289, _312);
    precise float _329 = fma(cb3._m20.x, _209, _319);
    precise float _330 = fma(cb3._m20.y, _209, _320);
    precise float _331 = fma(cb3._m20.z, _209, _321);
    precise float _332 = fma(cb3._m20.w, _209, _322);
    precise float _335 = cb2._m5.x / _332;
    precise float _336 = spvNMin(_335, 0.0);
    precise float _337 = spvNMax(_336, -1.0);
    precise float _338 = _331 + _337;
    precise float _339 = spvNMin(_332, _338);
    precise float _340 = _339 - _338;
    precise float _343 = fma(cb2._m5.y, _340, _338);
    gl_Position.z = _343;
    gl_Position.x = _329;
    gl_Position.y = _330;
    gl_Position.w = _332;
    SV_InstanceID = _87;
}

