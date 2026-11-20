#version 450
#extension GL_EXT_buffer_reference2 : require

invariant gl_Position;

layout(set = 0, binding = 0, std140) uniform cb0_buf
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

layout(location = 0, component = 0) in vec4 POSITION;
layout(location = 2, component = 0) in vec3 NORMAL;
layout(location = 1, component = 0) out vec3 TEXCOORD;
layout(location = 2, component = 0) out vec3 TEXCOORD1;
layout(location = 3, component = 0) out vec3 TEXCOORD2;
layout(location = 4, component = 0) out vec4 TEXCOORD4;
layout(location = 5, component = 0) out vec4 TEXCOORD5;

float dp3_f32(vec3 a, vec3 b)
{
    precise float _45 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _45));
}

void main()
{
    precise float _67 = POSITION.y * cb0._m1.x;
    precise float _68 = POSITION.y * cb0._m1.y;
    precise float _69 = POSITION.y * cb0._m1.z;
    precise float _70 = POSITION.y * cb0._m1.w;
    precise float _79 = fma(cb0._m0.x, POSITION.x, _67);
    precise float _80 = fma(cb0._m0.y, POSITION.x, _68);
    precise float _81 = fma(cb0._m0.z, POSITION.x, _69);
    precise float _82 = fma(cb0._m0.w, POSITION.x, _70);
    precise float _91 = fma(cb0._m2.x, POSITION.z, _79);
    precise float _92 = fma(cb0._m2.y, POSITION.z, _80);
    precise float _93 = fma(cb0._m2.z, POSITION.z, _81);
    precise float _94 = fma(cb0._m2.w, POSITION.z, _82);
    precise float _101 = _91 + cb0._m3.x;
    precise float _102 = _92 + cb0._m3.y;
    precise float _103 = _93 + cb0._m3.z;
    precise float _104 = _94 + cb0._m3.w;
    TEXCOORD1.x = fma(cb0._m3.x, POSITION.w, _91);
    TEXCOORD1.y = fma(cb0._m3.y, POSITION.w, _92);
    TEXCOORD1.z = fma(cb0._m3.z, POSITION.w, _93);
    precise float _126 = _102 * cb1._m18.x;
    precise float _127 = _102 * cb1._m18.y;
    precise float _128 = _102 * cb1._m18.z;
    precise float _129 = _102 * cb1._m18.w;
    precise float _136 = fma(cb1._m17.x, _101, _126);
    precise float _137 = fma(cb1._m17.y, _101, _127);
    precise float _138 = fma(cb1._m17.z, _101, _128);
    precise float _139 = fma(cb1._m17.w, _101, _129);
    precise float _146 = fma(cb1._m19.x, _103, _136);
    precise float _147 = fma(cb1._m19.y, _103, _137);
    precise float _148 = fma(cb1._m19.z, _103, _138);
    precise float _149 = fma(cb1._m19.w, _103, _139);
    precise float _156 = fma(cb1._m20.x, _104, _146);
    precise float _157 = fma(cb1._m20.y, _104, _147);
    precise float _158 = fma(cb1._m20.z, _104, _148);
    precise float _159 = fma(cb1._m20.w, _104, _149);
    gl_Position.x = _156;
    gl_Position.y = _157;
    gl_Position.z = _158;
    gl_Position.w = _159;
    vec3 _170 = vec3(NORMAL.x, NORMAL.y, NORMAL.z);
    float _174 = dp3_f32(_170, cb0._m4);
    float _177 = dp3_f32(_170, cb0._m6);
    float _180 = dp3_f32(_170, cb0._m8);
    vec3 _181 = vec3(_174, _177, _180);
    precise float _183 = inversesqrt(dp3_f32(_181, _181));
    precise float _184 = _183 * _174;
    precise float _185 = _183 * _177;
    precise float _186 = _183 * _180;
    TEXCOORD.x = _184;
    TEXCOORD.y = _185;
    TEXCOORD.z = _186;
    TEXCOORD2.x = 0.0;
    TEXCOORD2.y = 0.0;
    TEXCOORD2.z = 0.0;
    TEXCOORD4.x = 0.0;
    TEXCOORD4.y = 0.0;
    TEXCOORD4.z = 0.0;
    TEXCOORD4.w = 0.0;
    TEXCOORD5.x = 0.0;
    TEXCOORD5.y = 0.0;
    TEXCOORD5.z = 0.0;
    TEXCOORD5.w = 0.0;
}

