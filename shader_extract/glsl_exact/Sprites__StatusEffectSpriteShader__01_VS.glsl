#version 450
#extension GL_EXT_buffer_reference2 : require

invariant gl_Position;

layout(set = 0, binding = 0, std140) uniform cb0_buf
{
    uvec4 _m0;
    uvec4 _m1;
    vec4 _m2;
} cb0;

layout(set = 0, binding = 1, std140) uniform cb1_buf
{
    uvec4 _m0;
    uvec4 _m1;
    uvec4 _m2;
    uvec4 _m3;
    uvec4 _m4;
    uvec4 _m5;
    vec2 _m6;
    uvec2 _m7;
} cb1;

layout(set = 0, binding = 2, std140) uniform cb2_buf
{
    vec4 _m0;
    vec4 _m1;
    vec4 _m2;
    vec4 _m3;
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

layout(location = 0, component = 0) in vec3 POSITION;
layout(location = 1, component = 0) in vec4 COLOR;
layout(location = 2, component = 0) in vec2 TEXCOORD;
layout(location = 1, component = 0) out vec4 COLOR_1;
layout(location = 2, component = 0) out vec2 TEXCOORD_1;

void main()
{
    precise float _57 = POSITION.y * cb2._m1.x;
    precise float _58 = POSITION.y * cb2._m1.y;
    precise float _59 = POSITION.y * cb2._m1.z;
    precise float _60 = POSITION.y * cb2._m1.w;
    precise float _69 = fma(cb2._m0.x, POSITION.x, _57);
    precise float _71 = fma(cb2._m0.y, POSITION.x, _58);
    precise float _72 = fma(cb2._m0.z, POSITION.x, _59);
    precise float _73 = fma(cb2._m0.w, POSITION.x, _60);
    precise float _82 = fma(cb2._m2.x, POSITION.z, _69);
    precise float _83 = fma(cb2._m2.y, POSITION.z, _71);
    precise float _84 = fma(cb2._m2.z, POSITION.z, _72);
    precise float _85 = fma(cb2._m2.w, POSITION.z, _73);
    precise float _92 = _82 + cb2._m3.x;
    precise float _93 = _83 + cb2._m3.y;
    precise float _94 = _84 + cb2._m3.z;
    precise float _95 = _85 + cb2._m3.w;
    precise float _103 = _93 * cb3._m18.x;
    precise float _104 = _93 * cb3._m18.y;
    precise float _105 = _93 * cb3._m18.z;
    precise float _106 = _93 * cb3._m18.w;
    precise float _113 = fma(cb3._m17.x, _92, _103);
    precise float _114 = fma(cb3._m17.y, _92, _104);
    precise float _115 = fma(cb3._m17.z, _92, _105);
    precise float _116 = fma(cb3._m17.w, _92, _106);
    precise float _123 = fma(cb3._m19.x, _94, _113);
    precise float _124 = fma(cb3._m19.y, _94, _114);
    precise float _125 = fma(cb3._m19.z, _94, _115);
    precise float _126 = fma(cb3._m19.w, _94, _116);
    precise float _133 = fma(cb3._m20.x, _95, _123);
    precise float _134 = fma(cb3._m20.y, _95, _124);
    precise float _135 = fma(cb3._m20.z, _95, _125);
    precise float _136 = fma(cb3._m20.w, _95, _126);
    precise float _137 = _133 / _136;
    precise float _138 = _134 / _136;
    precise float _145 = cb1._m6.x * 0.5;
    precise float _146 = cb1._m6.y * 0.5;
    precise float _147 = _137 * _145;
    precise float _148 = _138 * _146;
    precise float _149 = roundEven(_147);
    precise float _150 = roundEven(_148);
    precise float _151 = _149 / _145;
    precise float _152 = _150 / _146;
    precise float _153 = _136 * _151;
    precise float _154 = _136 * _152;
    gl_Position.x = _153;
    gl_Position.y = _154;
    gl_Position.z = _135;
    gl_Position.w = _136;
    precise float _175 = COLOR.x * cb0._m2.x;
    precise float _176 = COLOR.y * cb0._m2.y;
    precise float _177 = COLOR.z * cb0._m2.z;
    precise float _178 = COLOR.w * cb0._m2.w;
    COLOR_1.x = _175;
    COLOR_1.y = _176;
    COLOR_1.z = _177;
    COLOR_1.w = _178;
    TEXCOORD_1.x = TEXCOORD.x;
    TEXCOORD_1.y = TEXCOORD.y;
}

