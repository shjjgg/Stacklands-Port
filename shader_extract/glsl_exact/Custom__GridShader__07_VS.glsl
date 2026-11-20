#version 450
#extension GL_EXT_buffer_reference2 : require

invariant gl_Position;

layout(set = 0, binding = 0, std140) uniform cb0_buf
{
    uvec4 _m0;
    uvec4 _m1;
    uvec4 _m2;
    uvec4 _m3;
    vec4 _m4;
    vec4 _m5;
    vec4 _m6;
    vec4 _m7;
} cb0;

layout(set = 0, binding = 1, std140) uniform cb1_buf
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

layout(location = 0, component = 0) in vec4 POSITION;
layout(location = 2, component = 0) in vec3 NORMAL;
layout(location = 1, component = 0) out vec3 TEXCOORD;
layout(location = 2, component = 0) out vec3 TEXCOORD1;
layout(location = 3, component = 0) out vec4 TEXCOORD2;

float dp3_f32(vec3 a, vec3 b)
{
    precise float _47 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _47));
}

void main()
{
    precise float _69 = POSITION.y * cb1._m1.x;
    precise float _70 = POSITION.y * cb1._m1.y;
    precise float _71 = POSITION.y * cb1._m1.z;
    precise float _72 = POSITION.y * cb1._m1.w;
    precise float _81 = fma(cb1._m0.x, POSITION.x, _69);
    precise float _82 = fma(cb1._m0.y, POSITION.x, _70);
    precise float _83 = fma(cb1._m0.z, POSITION.x, _71);
    precise float _84 = fma(cb1._m0.w, POSITION.x, _72);
    precise float _93 = fma(cb1._m2.x, POSITION.z, _81);
    precise float _94 = fma(cb1._m2.y, POSITION.z, _82);
    precise float _95 = fma(cb1._m2.z, POSITION.z, _83);
    precise float _96 = fma(cb1._m2.w, POSITION.z, _84);
    precise float _103 = _93 + cb1._m3.x;
    precise float _104 = _94 + cb1._m3.y;
    precise float _105 = _95 + cb1._m3.z;
    precise float _106 = _96 + cb1._m3.w;
    precise float _114 = _104 * cb2._m18.x;
    precise float _115 = _104 * cb2._m18.y;
    precise float _116 = _104 * cb2._m18.z;
    precise float _117 = _104 * cb2._m18.w;
    precise float _124 = fma(cb2._m17.x, _103, _114);
    precise float _125 = fma(cb2._m17.y, _103, _115);
    precise float _126 = fma(cb2._m17.z, _103, _116);
    precise float _127 = fma(cb2._m17.w, _103, _117);
    precise float _134 = fma(cb2._m19.x, _105, _124);
    precise float _135 = fma(cb2._m19.y, _105, _125);
    precise float _136 = fma(cb2._m19.z, _105, _126);
    precise float _137 = fma(cb2._m19.w, _105, _127);
    precise float _144 = fma(cb2._m20.x, _106, _134);
    precise float _145 = fma(cb2._m20.y, _106, _135);
    precise float _146 = fma(cb2._m20.z, _106, _136);
    precise float _147 = fma(cb2._m20.w, _106, _137);
    gl_Position.x = _144;
    gl_Position.y = _145;
    gl_Position.z = _146;
    gl_Position.w = _147;
    vec3 _159 = vec3(NORMAL.x, NORMAL.y, NORMAL.z);
    float _163 = dp3_f32(_159, cb1._m4);
    float _166 = dp3_f32(_159, cb1._m6);
    float _169 = dp3_f32(_159, cb1._m8);
    vec3 _170 = vec3(_163, _166, _169);
    precise float _172 = inversesqrt(dp3_f32(_170, _170));
    precise float _173 = _172 * _163;
    precise float _174 = _172 * _166;
    precise float _175 = _172 * _169;
    TEXCOORD.x = _173;
    TEXCOORD.y = _174;
    TEXCOORD.z = _175;
    TEXCOORD1.x = fma(cb1._m3.x, POSITION.w, _93);
    TEXCOORD1.y = fma(cb1._m3.y, POSITION.w, _94);
    TEXCOORD1.z = fma(cb1._m3.z, POSITION.w, _95);
    precise float _198 = fma(cb1._m3.x, POSITION.w, _93);
    precise float _199 = fma(cb1._m3.y, POSITION.w, _94);
    precise float _200 = fma(cb1._m3.z, POSITION.w, _95);
    precise float _201 = fma(cb1._m3.w, POSITION.w, _96);
    precise float _209 = _199 * cb0._m5.x;
    precise float _210 = _199 * cb0._m5.y;
    precise float _211 = _199 * cb0._m5.z;
    precise float _212 = _199 * cb0._m5.w;
    TEXCOORD2.x = fma(cb0._m7.x, _201, fma(cb0._m6.x, _200, fma(cb0._m4.x, _198, _209)));
    TEXCOORD2.y = fma(cb0._m7.y, _201, fma(cb0._m6.y, _200, fma(cb0._m4.y, _198, _210)));
    TEXCOORD2.z = fma(cb0._m7.z, _201, fma(cb0._m6.z, _200, fma(cb0._m4.z, _198, _211)));
    TEXCOORD2.w = fma(cb0._m7.w, _201, fma(cb0._m6.w, _200, fma(cb0._m4.w, _198, _212)));
}

