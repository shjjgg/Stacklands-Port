#version 450
#extension GL_EXT_buffer_reference2 : require

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
    vec4 _m0;
    vec4 _m1;
    vec4 _m2;
    vec4 _m3;
    vec3 _m4;
    uint _m5;
    vec3 _m6;
    uint _m7;
    vec3 _m8;
    uint _m9;
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

layout(location = 0, component = 0) in vec4 POSITION;
layout(location = 2, component = 0) in vec3 NORMAL;
layout(location = 3, component = 0) in vec2 TEXCOORD;
layout(location = 1, component = 0) out vec2 TEXCOORD_1;
layout(location = 2, component = 0) out vec3 TEXCOORD1;
layout(location = 3, component = 0) out vec3 TEXCOORD2;
layout(location = 4, component = 0) out vec4 TEXCOORD4;

float dp3_f32(vec3 a, vec3 b)
{
    precise float _58 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _58));
}

void main()
{
    precise float _80 = POSITION.y * cb2._m1.x;
    precise float _81 = POSITION.y * cb2._m1.y;
    precise float _82 = POSITION.y * cb2._m1.z;
    precise float _83 = POSITION.y * cb2._m1.w;
    precise float _92 = fma(cb2._m0.x, POSITION.x, _80);
    precise float _93 = fma(cb2._m0.y, POSITION.x, _81);
    precise float _94 = fma(cb2._m0.z, POSITION.x, _82);
    precise float _95 = fma(cb2._m0.w, POSITION.x, _83);
    precise float _104 = fma(cb2._m2.x, POSITION.z, _92);
    precise float _105 = fma(cb2._m2.y, POSITION.z, _93);
    precise float _106 = fma(cb2._m2.z, POSITION.z, _94);
    precise float _107 = fma(cb2._m2.w, POSITION.z, _95);
    precise float _114 = _104 + cb2._m3.x;
    precise float _115 = _105 + cb2._m3.y;
    precise float _116 = _106 + cb2._m3.z;
    precise float _117 = _107 + cb2._m3.w;
    TEXCOORD2.x = fma(cb2._m3.x, POSITION.w, _104);
    TEXCOORD2.y = fma(cb2._m3.y, POSITION.w, _105);
    TEXCOORD2.z = fma(cb2._m3.z, POSITION.w, _106);
    precise float _139 = _115 * cb3._m18.x;
    precise float _140 = _115 * cb3._m18.y;
    precise float _141 = _115 * cb3._m18.z;
    precise float _142 = _115 * cb3._m18.w;
    precise float _149 = fma(cb3._m17.x, _114, _139);
    precise float _150 = fma(cb3._m17.y, _114, _140);
    precise float _151 = fma(cb3._m17.z, _114, _141);
    precise float _152 = fma(cb3._m17.w, _114, _142);
    precise float _159 = fma(cb3._m19.x, _116, _149);
    precise float _160 = fma(cb3._m19.y, _116, _150);
    precise float _161 = fma(cb3._m19.z, _116, _151);
    precise float _162 = fma(cb3._m19.w, _116, _152);
    precise float _169 = fma(cb3._m20.x, _117, _159);
    precise float _170 = fma(cb3._m20.y, _117, _160);
    precise float _171 = fma(cb3._m20.z, _117, _161);
    precise float _172 = fma(cb3._m20.w, _117, _162);
    gl_Position.x = _169;
    gl_Position.y = _170;
    gl_Position.z = _171;
    gl_Position.w = _172;
    TEXCOORD_1.x = fma(TEXCOORD.x, cb0._m6.x, cb0._m7.x);
    TEXCOORD_1.y = fma(TEXCOORD.y, cb0._m6.y, cb0._m7.y);
    vec3 _201 = vec3(NORMAL.x, NORMAL.y, NORMAL.z);
    float _205 = dp3_f32(_201, cb2._m4);
    float _208 = dp3_f32(_201, cb2._m6);
    float _211 = dp3_f32(_201, cb2._m8);
    vec3 _212 = vec3(_205, _208, _211);
    precise float _214 = inversesqrt(dp3_f32(_212, _212));
    precise float _215 = _214 * _205;
    precise float _216 = _214 * _208;
    precise float _217 = _214 * _211;
    TEXCOORD1.x = _215;
    TEXCOORD1.y = _216;
    TEXCOORD1.z = _217;
    precise float _225 = _170 * cb1._m5.x;
    precise float _226 = _169 * 0.5;
    precise float _227 = _172 * 0.5;
    precise float _228 = _225 * 0.5;
    TEXCOORD4.z = _171;
    TEXCOORD4.w = _172;
    precise float _231 = _227 + _226;
    precise float _232 = _227 + _228;
    TEXCOORD4.x = _231;
    TEXCOORD4.y = _232;
}

