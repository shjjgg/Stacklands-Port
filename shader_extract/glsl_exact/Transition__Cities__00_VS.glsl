#version 450
#extension GL_EXT_buffer_reference2 : require

invariant gl_Position;

layout(set = 0, binding = 0, std140) uniform cb0_buf
{
    vec4 _m0;
    vec4 _m1;
    vec4 _m2;
    vec4 _m3;
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

layout(location = 0, component = 0) in vec3 POSITION;
layout(location = 3, component = 0) in vec2 TEXCOORD;
layout(location = 7, component = 0) in vec4 COLOR;
layout(location = 1, component = 0) out vec4 COLOR_1;
layout(location = 2, component = 0) out vec2 TEXCOORD_1;

void main()
{
    precise float _48 = POSITION.y * cb0._m1.x;
    precise float _49 = POSITION.y * cb0._m1.y;
    precise float _50 = POSITION.y * cb0._m1.z;
    precise float _51 = POSITION.y * cb0._m1.w;
    precise float _60 = fma(cb0._m0.x, POSITION.x, _48);
    precise float _62 = fma(cb0._m0.y, POSITION.x, _49);
    precise float _63 = fma(cb0._m0.z, POSITION.x, _50);
    precise float _64 = fma(cb0._m0.w, POSITION.x, _51);
    precise float _73 = fma(cb0._m2.x, POSITION.z, _60);
    precise float _74 = fma(cb0._m2.y, POSITION.z, _62);
    precise float _75 = fma(cb0._m2.z, POSITION.z, _63);
    precise float _76 = fma(cb0._m2.w, POSITION.z, _64);
    precise float _83 = _73 + cb0._m3.x;
    precise float _84 = _74 + cb0._m3.y;
    precise float _85 = _75 + cb0._m3.z;
    precise float _86 = _76 + cb0._m3.w;
    precise float _94 = _84 * cb1._m18.x;
    precise float _95 = _84 * cb1._m18.y;
    precise float _96 = _84 * cb1._m18.z;
    precise float _97 = _84 * cb1._m18.w;
    precise float _104 = fma(cb1._m17.x, _83, _94);
    precise float _105 = fma(cb1._m17.y, _83, _95);
    precise float _106 = fma(cb1._m17.z, _83, _96);
    precise float _107 = fma(cb1._m17.w, _83, _97);
    precise float _114 = fma(cb1._m19.x, _85, _104);
    precise float _115 = fma(cb1._m19.y, _85, _105);
    precise float _116 = fma(cb1._m19.z, _85, _106);
    precise float _117 = fma(cb1._m19.w, _85, _107);
    precise float _124 = fma(cb1._m20.x, _86, _114);
    precise float _125 = fma(cb1._m20.y, _86, _115);
    precise float _126 = fma(cb1._m20.z, _86, _116);
    precise float _127 = fma(cb1._m20.w, _86, _117);
    gl_Position.x = _124;
    gl_Position.y = _125;
    gl_Position.z = _126;
    gl_Position.w = _127;
    COLOR_1.x = COLOR.x;
    COLOR_1.y = COLOR.y;
    COLOR_1.z = COLOR.z;
    COLOR_1.w = COLOR.w;
    TEXCOORD_1.x = TEXCOORD.x;
    TEXCOORD_1.y = TEXCOORD.y;
}

