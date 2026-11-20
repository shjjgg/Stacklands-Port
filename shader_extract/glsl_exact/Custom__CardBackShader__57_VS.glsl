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
} cb1;

layout(set = 0, binding = 2, std140) uniform cb2_buf
{
    uvec4 m;
} cb2;

layout(set = 0, binding = 3, std140) uniform cb3_buf
{
    vec4 m[4096];
} cb3;

layout(set = 0, binding = 4, std140) uniform cb4_buf
{
    vec4 m[4096];
} cb4;

layout(location = 0, component = 0) in vec4 POSITION;
layout(location = 2, component = 0) in vec3 NORMAL;
layout(location = 3, component = 0) in vec2 TEXCOORD;
layout(location = 1, component = 0) out vec2 TEXCOORD_1;
layout(location = 2, component = 0) out vec3 TEXCOORD1;
layout(location = 3, component = 0) out vec3 TEXCOORD2;
layout(location = 4, component = 0) out vec4 TEXCOORD4;
layout(location = 5, component = 0) out vec3 TEXCOORD5;
layout(location = 6, component = 0) out uint SV_InstanceID;

float dp3_f32(vec3 a, vec3 b)
{
    precise float _86 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _86));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _68 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _68)));
}

void main()
{
    uint _98 = uint(gl_InstanceIndex - gl_BaseInstanceARB);
    uint _103 = _98 + cb2.m.x;
    uint _104 = _103 << 3u;
    uint _105 = _103 * 7u;
    uint _110 = _104 + 1u;
    precise float _118 = POSITION.y * cb3.m[_110].x;
    precise float _119 = POSITION.y * cb3.m[_110].y;
    precise float _120 = POSITION.y * cb3.m[_110].z;
    precise float _121 = POSITION.y * cb3.m[_110].w;
    precise float _130 = fma(cb3.m[_104].x, POSITION.x, _118);
    precise float _131 = fma(cb3.m[_104].y, POSITION.x, _119);
    precise float _132 = fma(cb3.m[_104].z, POSITION.x, _120);
    precise float _133 = fma(cb3.m[_104].w, POSITION.x, _121);
    uint _134 = _104 + 2u;
    precise float _143 = fma(cb3.m[_134].x, POSITION.z, _130);
    precise float _144 = fma(cb3.m[_134].y, POSITION.z, _131);
    precise float _145 = fma(cb3.m[_134].z, POSITION.z, _132);
    precise float _146 = fma(cb3.m[_134].w, POSITION.z, _133);
    uint _147 = _104 + 3u;
    precise float _154 = _143 + cb3.m[_147].x;
    precise float _155 = _144 + cb3.m[_147].y;
    precise float _156 = _145 + cb3.m[_147].z;
    precise float _157 = _146 + cb3.m[_147].w;
    TEXCOORD2.x = fma(cb3.m[_147].x, POSITION.w, _143);
    TEXCOORD2.y = fma(cb3.m[_147].y, POSITION.w, _144);
    TEXCOORD2.z = fma(cb3.m[_147].z, POSITION.w, _145);
    precise float _179 = _155 * cb1._m18.x;
    precise float _180 = _155 * cb1._m18.y;
    precise float _181 = _155 * cb1._m18.z;
    precise float _182 = _155 * cb1._m18.w;
    precise float _189 = fma(cb1._m17.x, _154, _179);
    precise float _190 = fma(cb1._m17.y, _154, _180);
    precise float _191 = fma(cb1._m17.z, _154, _181);
    precise float _192 = fma(cb1._m17.w, _154, _182);
    precise float _199 = fma(cb1._m19.x, _156, _189);
    precise float _200 = fma(cb1._m19.y, _156, _190);
    precise float _201 = fma(cb1._m19.z, _156, _191);
    precise float _202 = fma(cb1._m19.w, _156, _192);
    precise float _209 = fma(cb1._m20.x, _157, _199);
    precise float _210 = fma(cb1._m20.y, _157, _200);
    precise float _211 = fma(cb1._m20.z, _157, _201);
    precise float _212 = fma(cb1._m20.w, _157, _202);
    gl_Position.x = _209;
    gl_Position.y = _210;
    gl_Position.z = _211;
    gl_Position.w = _212;
    TEXCOORD_1.x = fma(TEXCOORD.x, cb0._m6.x, cb0._m7.x);
    TEXCOORD_1.y = fma(TEXCOORD.y, cb0._m6.y, cb0._m7.y);
    vec3 _241 = vec3(NORMAL.x, NORMAL.y, NORMAL.z);
    float _249 = dp3_f32(_241, vec3(cb3.m[_104 + 4u].xyz));
    float _257 = dp3_f32(_241, vec3(cb3.m[_104 + 5u].xyz));
    float _265 = dp3_f32(_241, vec3(cb3.m[_104 + 6u].xyz));
    vec3 _266 = vec3(_249, _257, _265);
    precise float _268 = inversesqrt(dp3_f32(_266, _266));
    precise float _269 = _268 * _249;
    precise float _270 = _268 * _257;
    precise float _271 = _268 * _265;
    TEXCOORD1.x = _269;
    TEXCOORD1.y = _270;
    TEXCOORD1.z = _271;
    TEXCOORD4.x = 0.0;
    TEXCOORD4.y = 0.0;
    TEXCOORD4.z = 0.0;
    TEXCOORD4.w = 0.0;
    precise float _279 = _270 * _270;
    precise float _281 = fma(_269, _269, -_279);
    precise float _282 = _270 * _269;
    precise float _283 = _271 * _270;
    precise float _284 = _271 * _271;
    precise float _285 = _269 * _271;
    vec4 _290 = vec4(_282, _283, _284, _285);
    uint _300 = _105 + 6u;
    TEXCOORD5.x = fma(cb4.m[_300].x, _281, dp4_f32(cb4.m[_105 + 3u], _290));
    TEXCOORD5.y = fma(cb4.m[_300].y, _281, dp4_f32(cb4.m[_105 + 4u], _290));
    TEXCOORD5.z = fma(cb4.m[_300].z, _281, dp4_f32(cb4.m[_105 + 5u], _290));
    SV_InstanceID = _98;
}

