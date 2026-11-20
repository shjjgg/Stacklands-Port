#version 450
#extension GL_EXT_buffer_reference2 : require
#extension GL_ARB_shader_draw_parameters : require

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
    vec2 _m8;
    vec2 _m9;
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
} cb2;

layout(set = 0, binding = 3, std140) uniform cb3_buf
{
    uvec4 m;
} cb3;

layout(set = 0, binding = 4, std140) uniform cb4_buf
{
    vec4 m[4096];
} cb4;

layout(set = 0, binding = 5, std140) uniform cb5_buf
{
    vec4 m[4096];
} cb5;

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

float dp3_f32(vec3 a, vec3 b)
{
    precise float _95 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _95));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _77 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _77)));
}

void main()
{
    uint _107 = uint(gl_InstanceIndex - gl_BaseInstanceARB);
    uint _112 = _107 + cb3.m.x;
    uint _113 = _112 << 3u;
    uint _114 = _112 * 7u;
    uint _119 = _113 + 1u;
    precise float _127 = POSITION.y * cb4.m[_119].x;
    precise float _128 = POSITION.y * cb4.m[_119].y;
    precise float _129 = POSITION.y * cb4.m[_119].z;
    precise float _130 = POSITION.y * cb4.m[_119].w;
    precise float _139 = fma(cb4.m[_113].x, POSITION.x, _127);
    precise float _140 = fma(cb4.m[_113].y, POSITION.x, _128);
    precise float _141 = fma(cb4.m[_113].z, POSITION.x, _129);
    precise float _142 = fma(cb4.m[_113].w, POSITION.x, _130);
    uint _143 = _113 + 2u;
    precise float _152 = fma(cb4.m[_143].x, POSITION.z, _139);
    precise float _153 = fma(cb4.m[_143].y, POSITION.z, _140);
    precise float _154 = fma(cb4.m[_143].z, POSITION.z, _141);
    precise float _155 = fma(cb4.m[_143].w, POSITION.z, _142);
    uint _156 = _113 + 3u;
    precise float _163 = _152 + cb4.m[_156].x;
    precise float _164 = _153 + cb4.m[_156].y;
    precise float _165 = _154 + cb4.m[_156].z;
    precise float _166 = _155 + cb4.m[_156].w;
    TEXCOORD2.x = fma(cb4.m[_156].x, POSITION.w, _152);
    TEXCOORD2.y = fma(cb4.m[_156].y, POSITION.w, _153);
    TEXCOORD2.z = fma(cb4.m[_156].z, POSITION.w, _154);
    precise float _188 = _164 * cb2._m18.x;
    precise float _189 = _164 * cb2._m18.y;
    precise float _190 = _164 * cb2._m18.z;
    precise float _191 = _164 * cb2._m18.w;
    precise float _198 = fma(cb2._m17.x, _163, _188);
    precise float _199 = fma(cb2._m17.y, _163, _189);
    precise float _200 = fma(cb2._m17.z, _163, _190);
    precise float _201 = fma(cb2._m17.w, _163, _191);
    precise float _208 = fma(cb2._m19.x, _165, _198);
    precise float _209 = fma(cb2._m19.y, _165, _199);
    precise float _210 = fma(cb2._m19.z, _165, _200);
    precise float _211 = fma(cb2._m19.w, _165, _201);
    precise float _218 = fma(cb2._m20.x, _166, _208);
    precise float _219 = fma(cb2._m20.y, _166, _209);
    precise float _220 = fma(cb2._m20.z, _166, _210);
    precise float _221 = fma(cb2._m20.w, _166, _211);
    gl_Position.x = _218;
    gl_Position.y = _219;
    gl_Position.z = _220;
    gl_Position.w = _221;
    TEXCOORD_1.x = fma(TEXCOORD.x, cb0._m8.x, cb0._m9.x);
    TEXCOORD_1.y = fma(TEXCOORD.y, cb0._m8.y, cb0._m9.y);
    vec3 _250 = vec3(NORMAL.x, NORMAL.y, NORMAL.z);
    float _258 = dp3_f32(_250, vec3(cb4.m[_113 + 4u].xyz));
    float _266 = dp3_f32(_250, vec3(cb4.m[_113 + 5u].xyz));
    float _274 = dp3_f32(_250, vec3(cb4.m[_113 + 6u].xyz));
    vec3 _275 = vec3(_258, _266, _274);
    precise float _277 = inversesqrt(dp3_f32(_275, _275));
    precise float _278 = _277 * _258;
    precise float _279 = _277 * _266;
    precise float _280 = _277 * _274;
    TEXCOORD1.x = _278;
    TEXCOORD1.y = _279;
    TEXCOORD1.z = _280;
    precise float _284 = _279 * _279;
    precise float _286 = fma(_278, _278, -_284);
    precise float _287 = _279 * _278;
    precise float _288 = _280 * _279;
    precise float _289 = _280 * _280;
    precise float _290 = _278 * _280;
    vec4 _295 = vec4(_287, _288, _289, _290);
    uint _305 = _114 + 6u;
    TEXCOORD3.x = fma(cb5.m[_305].x, _286, dp4_f32(cb5.m[_114 + 3u], _295));
    TEXCOORD3.y = fma(cb5.m[_305].y, _286, dp4_f32(cb5.m[_114 + 4u], _295));
    TEXCOORD3.z = fma(cb5.m[_305].z, _286, dp4_f32(cb5.m[_114 + 5u], _295));
    precise float _321 = _219 * cb1._m5.x;
    precise float _322 = _321 * 0.5;
    precise float _323 = _218 * 0.5;
    precise float _324 = _221 * 0.5;
    TEXCOORD5.z = _220;
    TEXCOORD5.w = _221;
    precise float _327 = _324 + _323;
    precise float _328 = _324 + _322;
    TEXCOORD5.x = _327;
    TEXCOORD5.y = _328;
    TEXCOORD6.x = 0.0;
    TEXCOORD6.y = 0.0;
    TEXCOORD6.z = 0.0;
    TEXCOORD6.w = 0.0;
    SV_InstanceID = _107;
}

