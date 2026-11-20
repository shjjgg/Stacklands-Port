#version 450
#extension GL_EXT_buffer_reference2 : require

invariant gl_Position;

layout(set = 0, binding = 0, std140) uniform cb0_buf
{
    uvec4 _m0;
    uvec4 _m1;
    uvec4 _m2;
    uvec4 _m3;
    vec3 _m4;
    uint _m5;
    vec3 _m6;
    uint _m7;
    vec3 _m8;
    uint _m9;
    vec3 _m10;
    uint _m11;
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
layout(location = 3, component = 0) out vec3 TEXCOORD2;
layout(location = 4, component = 0) out vec4 TEXCOORD3;

float dp3_f32(vec3 a, vec3 b)
{
    precise float _48 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _48));
}

void main()
{
    precise float _70 = POSITION.y * cb1._m1.x;
    precise float _71 = POSITION.y * cb1._m1.y;
    precise float _72 = POSITION.y * cb1._m1.z;
    precise float _73 = POSITION.y * cb1._m1.w;
    precise float _82 = fma(cb1._m0.x, POSITION.x, _70);
    precise float _83 = fma(cb1._m0.y, POSITION.x, _71);
    precise float _84 = fma(cb1._m0.z, POSITION.x, _72);
    precise float _85 = fma(cb1._m0.w, POSITION.x, _73);
    precise float _94 = fma(cb1._m2.x, POSITION.z, _82);
    precise float _95 = fma(cb1._m2.y, POSITION.z, _83);
    precise float _96 = fma(cb1._m2.z, POSITION.z, _84);
    precise float _97 = fma(cb1._m2.w, POSITION.z, _85);
    precise float _104 = _94 + cb1._m3.x;
    precise float _105 = _95 + cb1._m3.y;
    precise float _106 = _96 + cb1._m3.z;
    precise float _107 = _97 + cb1._m3.w;
    precise float _115 = _105 * cb2._m18.x;
    precise float _116 = _105 * cb2._m18.y;
    precise float _117 = _105 * cb2._m18.z;
    precise float _118 = _105 * cb2._m18.w;
    precise float _125 = fma(cb2._m17.x, _104, _115);
    precise float _126 = fma(cb2._m17.y, _104, _116);
    precise float _127 = fma(cb2._m17.z, _104, _117);
    precise float _128 = fma(cb2._m17.w, _104, _118);
    precise float _135 = fma(cb2._m19.x, _106, _125);
    precise float _136 = fma(cb2._m19.y, _106, _126);
    precise float _137 = fma(cb2._m19.z, _106, _127);
    precise float _138 = fma(cb2._m19.w, _106, _128);
    precise float _145 = fma(cb2._m20.x, _107, _135);
    precise float _146 = fma(cb2._m20.y, _107, _136);
    precise float _147 = fma(cb2._m20.z, _107, _137);
    precise float _148 = fma(cb2._m20.w, _107, _138);
    gl_Position.x = _145;
    gl_Position.y = _146;
    gl_Position.z = _147;
    gl_Position.w = _148;
    vec3 _160 = vec3(NORMAL.x, NORMAL.y, NORMAL.z);
    float _164 = dp3_f32(_160, cb1._m4);
    float _167 = dp3_f32(_160, cb1._m6);
    float _170 = dp3_f32(_160, cb1._m8);
    vec3 _171 = vec3(_164, _167, _170);
    precise float _173 = inversesqrt(dp3_f32(_171, _171));
    precise float _174 = _173 * _164;
    precise float _175 = _173 * _167;
    precise float _176 = _173 * _170;
    TEXCOORD.x = _174;
    TEXCOORD.y = _175;
    TEXCOORD.z = _176;
    TEXCOORD1.x = fma(cb1._m3.x, POSITION.w, _94);
    TEXCOORD1.y = fma(cb1._m3.y, POSITION.w, _95);
    TEXCOORD1.z = fma(cb1._m3.z, POSITION.w, _96);
    precise float _199 = fma(cb1._m3.x, POSITION.w, _94);
    precise float _200 = fma(cb1._m3.y, POSITION.w, _95);
    precise float _201 = fma(cb1._m3.z, POSITION.w, _96);
    precise float _202 = fma(cb1._m3.w, POSITION.w, _97);
    precise float _209 = _200 * cb0._m6.x;
    precise float _210 = _200 * cb0._m6.y;
    precise float _211 = _200 * cb0._m6.z;
    TEXCOORD2.x = fma(cb0._m10.x, _202, fma(cb0._m8.x, _201, fma(cb0._m4.x, _199, _209)));
    TEXCOORD2.y = fma(cb0._m10.y, _202, fma(cb0._m8.y, _201, fma(cb0._m4.y, _199, _210)));
    TEXCOORD2.z = fma(cb0._m10.z, _202, fma(cb0._m8.z, _201, fma(cb0._m4.z, _199, _211)));
    TEXCOORD3.x = 0.0;
    TEXCOORD3.y = 0.0;
    TEXCOORD3.z = 0.0;
    TEXCOORD3.w = 0.0;
}

