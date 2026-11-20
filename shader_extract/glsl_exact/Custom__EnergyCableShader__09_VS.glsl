#version 450
#extension GL_EXT_buffer_reference2 : require

invariant gl_Position;

layout(set = 0, binding = 0, std140) uniform cb0_buf
{
    uvec4 _m0;
    uvec4 _m1;
    uvec4 _m2;
    uvec4 _m3;
    vec2 _m4;
    uvec2 _m5;
    vec2 _m6;
    uvec2 _m7;
    vec2 _m8;
    uvec2 _m9;
    vec2 _m10;
    uvec2 _m11;
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
layout(location = 3, component = 0) out vec2 TEXCOORD2;

float dp3_f32(vec3 a, vec3 b)
{
    precise float _49 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _49));
}

void main()
{
    precise float _71 = POSITION.y * cb1._m1.x;
    precise float _72 = POSITION.y * cb1._m1.y;
    precise float _73 = POSITION.y * cb1._m1.z;
    precise float _74 = POSITION.y * cb1._m1.w;
    precise float _83 = fma(cb1._m0.x, POSITION.x, _71);
    precise float _84 = fma(cb1._m0.y, POSITION.x, _72);
    precise float _85 = fma(cb1._m0.z, POSITION.x, _73);
    precise float _86 = fma(cb1._m0.w, POSITION.x, _74);
    precise float _95 = fma(cb1._m2.x, POSITION.z, _83);
    precise float _96 = fma(cb1._m2.y, POSITION.z, _84);
    precise float _97 = fma(cb1._m2.z, POSITION.z, _85);
    precise float _98 = fma(cb1._m2.w, POSITION.z, _86);
    precise float _105 = _95 + cb1._m3.x;
    precise float _106 = _96 + cb1._m3.y;
    precise float _107 = _97 + cb1._m3.z;
    precise float _108 = _98 + cb1._m3.w;
    precise float _116 = _106 * cb2._m18.x;
    precise float _117 = _106 * cb2._m18.y;
    precise float _118 = _106 * cb2._m18.z;
    precise float _119 = _106 * cb2._m18.w;
    precise float _126 = fma(cb2._m17.x, _105, _116);
    precise float _127 = fma(cb2._m17.y, _105, _117);
    precise float _128 = fma(cb2._m17.z, _105, _118);
    precise float _129 = fma(cb2._m17.w, _105, _119);
    precise float _136 = fma(cb2._m19.x, _107, _126);
    precise float _137 = fma(cb2._m19.y, _107, _127);
    precise float _138 = fma(cb2._m19.z, _107, _128);
    precise float _139 = fma(cb2._m19.w, _107, _129);
    precise float _146 = fma(cb2._m20.x, _108, _136);
    precise float _147 = fma(cb2._m20.y, _108, _137);
    precise float _148 = fma(cb2._m20.z, _108, _138);
    precise float _149 = fma(cb2._m20.w, _108, _139);
    gl_Position.x = _146;
    gl_Position.y = _147;
    gl_Position.z = _148;
    gl_Position.w = _149;
    vec3 _161 = vec3(NORMAL.x, NORMAL.y, NORMAL.z);
    float _165 = dp3_f32(_161, cb1._m4);
    float _168 = dp3_f32(_161, cb1._m6);
    float _171 = dp3_f32(_161, cb1._m8);
    vec3 _172 = vec3(_165, _168, _171);
    precise float _174 = inversesqrt(dp3_f32(_172, _172));
    precise float _175 = _174 * _165;
    precise float _176 = _174 * _168;
    precise float _177 = _174 * _171;
    TEXCOORD.x = _175;
    TEXCOORD.y = _176;
    TEXCOORD.z = _177;
    TEXCOORD1.x = fma(cb1._m3.x, POSITION.w, _95);
    TEXCOORD1.y = fma(cb1._m3.y, POSITION.w, _96);
    TEXCOORD1.z = fma(cb1._m3.z, POSITION.w, _97);
    precise float _200 = fma(cb1._m3.x, POSITION.w, _95);
    precise float _201 = fma(cb1._m3.y, POSITION.w, _96);
    precise float _202 = fma(cb1._m3.z, POSITION.w, _97);
    precise float _203 = fma(cb1._m3.w, POSITION.w, _98);
    precise float _210 = _201 * cb0._m6.x;
    precise float _211 = _201 * cb0._m6.y;
    TEXCOORD2.x = fma(cb0._m10.x, _203, fma(cb0._m8.x, _202, fma(cb0._m4.x, _200, _210)));
    TEXCOORD2.y = fma(cb0._m10.y, _203, fma(cb0._m8.y, _202, fma(cb0._m4.y, _200, _211)));
}

