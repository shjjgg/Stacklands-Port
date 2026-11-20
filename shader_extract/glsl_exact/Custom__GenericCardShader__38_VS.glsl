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

layout(location = 0, component = 0) in vec4 POSITION;
layout(location = 2, component = 0) in vec3 NORMAL;
layout(location = 3, component = 0) in vec2 TEXCOORD;
layout(location = 1, component = 0) out vec2 TEXCOORD_1;
layout(location = 2, component = 0) out vec3 TEXCOORD1;
layout(location = 3, component = 0) out vec3 TEXCOORD2;
layout(location = 4, component = 0) out vec4 TEXCOORD4;
layout(location = 5, component = 0) out uint SV_InstanceID;

float dp3_f32(vec3 a, vec3 b)
{
    precise float _64 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _64));
}

void main()
{
    uint _77 = uint(gl_InstanceIndex - gl_BaseInstanceARB);
    uint _82 = _77 + cb2.m.x;
    uint _83 = _82 << 3u;
    uint _88 = _83 + 1u;
    precise float _96 = POSITION.y * cb3.m[_88].x;
    precise float _97 = POSITION.y * cb3.m[_88].y;
    precise float _98 = POSITION.y * cb3.m[_88].z;
    precise float _99 = POSITION.y * cb3.m[_88].w;
    precise float _108 = fma(cb3.m[_83].x, POSITION.x, _96);
    precise float _109 = fma(cb3.m[_83].y, POSITION.x, _97);
    precise float _110 = fma(cb3.m[_83].z, POSITION.x, _98);
    precise float _111 = fma(cb3.m[_83].w, POSITION.x, _99);
    uint _112 = _83 + 2u;
    precise float _121 = fma(cb3.m[_112].x, POSITION.z, _108);
    precise float _122 = fma(cb3.m[_112].y, POSITION.z, _109);
    precise float _123 = fma(cb3.m[_112].z, POSITION.z, _110);
    precise float _124 = fma(cb3.m[_112].w, POSITION.z, _111);
    uint _125 = _83 + 3u;
    precise float _132 = _121 + cb3.m[_125].x;
    precise float _133 = _122 + cb3.m[_125].y;
    precise float _134 = _123 + cb3.m[_125].z;
    precise float _135 = _124 + cb3.m[_125].w;
    TEXCOORD2.x = fma(cb3.m[_125].x, POSITION.w, _121);
    TEXCOORD2.y = fma(cb3.m[_125].y, POSITION.w, _122);
    TEXCOORD2.z = fma(cb3.m[_125].z, POSITION.w, _123);
    precise float _157 = _133 * cb1._m18.x;
    precise float _158 = _133 * cb1._m18.y;
    precise float _159 = _133 * cb1._m18.z;
    precise float _160 = _133 * cb1._m18.w;
    precise float _167 = fma(cb1._m17.x, _132, _157);
    precise float _168 = fma(cb1._m17.y, _132, _158);
    precise float _169 = fma(cb1._m17.z, _132, _159);
    precise float _170 = fma(cb1._m17.w, _132, _160);
    precise float _177 = fma(cb1._m19.x, _134, _167);
    precise float _178 = fma(cb1._m19.y, _134, _168);
    precise float _179 = fma(cb1._m19.z, _134, _169);
    precise float _180 = fma(cb1._m19.w, _134, _170);
    precise float _187 = fma(cb1._m20.x, _135, _177);
    precise float _188 = fma(cb1._m20.y, _135, _178);
    precise float _189 = fma(cb1._m20.z, _135, _179);
    precise float _190 = fma(cb1._m20.w, _135, _180);
    gl_Position.x = _187;
    gl_Position.y = _188;
    gl_Position.z = _189;
    gl_Position.w = _190;
    TEXCOORD_1.x = fma(TEXCOORD.x, cb0._m8.x, cb0._m9.x);
    TEXCOORD_1.y = fma(TEXCOORD.y, cb0._m8.y, cb0._m9.y);
    vec3 _219 = vec3(NORMAL.x, NORMAL.y, NORMAL.z);
    float _227 = dp3_f32(_219, vec3(cb3.m[_83 + 4u].xyz));
    float _235 = dp3_f32(_219, vec3(cb3.m[_83 + 5u].xyz));
    float _243 = dp3_f32(_219, vec3(cb3.m[_83 + 6u].xyz));
    vec3 _244 = vec3(_227, _235, _243);
    precise float _246 = inversesqrt(dp3_f32(_244, _244));
    precise float _247 = _246 * _227;
    precise float _248 = _246 * _235;
    precise float _249 = _246 * _243;
    TEXCOORD1.x = _247;
    TEXCOORD1.y = _248;
    TEXCOORD1.z = _249;
    TEXCOORD4.x = 0.0;
    TEXCOORD4.y = 0.0;
    TEXCOORD4.z = 0.0;
    TEXCOORD4.w = 0.0;
    SV_InstanceID = _77;
}

