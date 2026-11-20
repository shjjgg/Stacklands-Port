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
layout(location = 4, component = 0) out vec3 TEXCOORD3;
layout(location = 5, component = 0) out vec4 TEXCOORD5;
layout(location = 6, component = 0) out vec4 TEXCOORD6;
layout(location = 7, component = 0) out uint SV_InstanceID;

float dp3_f32(vec3 a, vec3 b)
{
    precise float _89 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _89));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _71 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _71)));
}

void main()
{
    uint _101 = uint(gl_InstanceIndex - gl_BaseInstanceARB);
    uint _106 = _101 + cb2.m.x;
    uint _107 = _106 << 3u;
    uint _108 = _106 * 7u;
    uint _113 = _107 + 1u;
    precise float _121 = POSITION.y * cb3.m[_113].x;
    precise float _122 = POSITION.y * cb3.m[_113].y;
    precise float _123 = POSITION.y * cb3.m[_113].z;
    precise float _124 = POSITION.y * cb3.m[_113].w;
    precise float _133 = fma(cb3.m[_107].x, POSITION.x, _121);
    precise float _134 = fma(cb3.m[_107].y, POSITION.x, _122);
    precise float _135 = fma(cb3.m[_107].z, POSITION.x, _123);
    precise float _136 = fma(cb3.m[_107].w, POSITION.x, _124);
    uint _137 = _107 + 2u;
    precise float _146 = fma(cb3.m[_137].x, POSITION.z, _133);
    precise float _147 = fma(cb3.m[_137].y, POSITION.z, _134);
    precise float _148 = fma(cb3.m[_137].z, POSITION.z, _135);
    precise float _149 = fma(cb3.m[_137].w, POSITION.z, _136);
    uint _150 = _107 + 3u;
    precise float _157 = _146 + cb3.m[_150].x;
    precise float _158 = _147 + cb3.m[_150].y;
    precise float _159 = _148 + cb3.m[_150].z;
    precise float _160 = _149 + cb3.m[_150].w;
    TEXCOORD2.x = fma(cb3.m[_150].x, POSITION.w, _146);
    TEXCOORD2.y = fma(cb3.m[_150].y, POSITION.w, _147);
    TEXCOORD2.z = fma(cb3.m[_150].z, POSITION.w, _148);
    precise float _182 = _158 * cb1._m18.x;
    precise float _183 = _158 * cb1._m18.y;
    precise float _184 = _158 * cb1._m18.z;
    precise float _185 = _158 * cb1._m18.w;
    precise float _192 = fma(cb1._m17.x, _157, _182);
    precise float _193 = fma(cb1._m17.y, _157, _183);
    precise float _194 = fma(cb1._m17.z, _157, _184);
    precise float _195 = fma(cb1._m17.w, _157, _185);
    precise float _202 = fma(cb1._m19.x, _159, _192);
    precise float _203 = fma(cb1._m19.y, _159, _193);
    precise float _204 = fma(cb1._m19.z, _159, _194);
    precise float _205 = fma(cb1._m19.w, _159, _195);
    precise float _212 = fma(cb1._m20.x, _160, _202);
    precise float _213 = fma(cb1._m20.y, _160, _203);
    precise float _214 = fma(cb1._m20.z, _160, _204);
    precise float _215 = fma(cb1._m20.w, _160, _205);
    gl_Position.x = _212;
    gl_Position.y = _213;
    gl_Position.z = _214;
    gl_Position.w = _215;
    TEXCOORD_1.x = fma(TEXCOORD.x, cb0._m13.x, cb0._m14.x);
    TEXCOORD_1.y = fma(TEXCOORD.y, cb0._m13.y, cb0._m14.y);
    vec3 _244 = vec3(NORMAL.x, NORMAL.y, NORMAL.z);
    float _252 = dp3_f32(_244, vec3(cb3.m[_107 + 4u].xyz));
    float _260 = dp3_f32(_244, vec3(cb3.m[_107 + 5u].xyz));
    float _268 = dp3_f32(_244, vec3(cb3.m[_107 + 6u].xyz));
    vec3 _269 = vec3(_252, _260, _268);
    precise float _271 = inversesqrt(dp3_f32(_269, _269));
    precise float _272 = _271 * _252;
    precise float _273 = _271 * _260;
    precise float _274 = _271 * _268;
    TEXCOORD1.x = _272;
    TEXCOORD1.y = _273;
    TEXCOORD1.z = _274;
    precise float _278 = _273 * _273;
    precise float _280 = fma(_272, _272, -_278);
    precise float _281 = _273 * _272;
    precise float _282 = _274 * _273;
    precise float _283 = _274 * _274;
    precise float _284 = _272 * _274;
    vec4 _289 = vec4(_281, _282, _283, _284);
    uint _299 = _108 + 6u;
    TEXCOORD3.x = fma(cb4.m[_299].x, _280, dp4_f32(cb4.m[_108 + 3u], _289));
    TEXCOORD3.y = fma(cb4.m[_299].y, _280, dp4_f32(cb4.m[_108 + 4u], _289));
    TEXCOORD3.z = fma(cb4.m[_299].z, _280, dp4_f32(cb4.m[_108 + 5u], _289));
    TEXCOORD5.x = 0.0;
    TEXCOORD5.y = 0.0;
    TEXCOORD5.z = 0.0;
    TEXCOORD5.w = 0.0;
    TEXCOORD6.x = 0.0;
    TEXCOORD6.y = 0.0;
    TEXCOORD6.z = 0.0;
    TEXCOORD6.w = 0.0;
    SV_InstanceID = _101;
}

