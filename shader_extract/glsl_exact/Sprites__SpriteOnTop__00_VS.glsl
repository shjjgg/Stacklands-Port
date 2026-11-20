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
    vec4 _m0;
    vec4 _m1;
    vec4 _m2;
    vec4 _m3;
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

layout(location = 0, component = 0) in vec3 POSITION;
layout(location = 1, component = 0) in vec4 COLOR;
layout(location = 2, component = 0) in vec2 TEXCOORD;
layout(location = 1, component = 0) out vec4 COLOR_1;
layout(location = 2, component = 0) out vec2 TEXCOORD_1;

void main()
{
    precise float _51 = POSITION.y * cb1._m1.x;
    precise float _52 = POSITION.y * cb1._m1.y;
    precise float _53 = POSITION.y * cb1._m1.z;
    precise float _54 = POSITION.y * cb1._m1.w;
    precise float _63 = fma(cb1._m0.x, POSITION.x, _51);
    precise float _65 = fma(cb1._m0.y, POSITION.x, _52);
    precise float _66 = fma(cb1._m0.z, POSITION.x, _53);
    precise float _67 = fma(cb1._m0.w, POSITION.x, _54);
    precise float _76 = fma(cb1._m2.x, POSITION.z, _63);
    precise float _77 = fma(cb1._m2.y, POSITION.z, _65);
    precise float _78 = fma(cb1._m2.z, POSITION.z, _66);
    precise float _79 = fma(cb1._m2.w, POSITION.z, _67);
    precise float _86 = _76 + cb1._m3.x;
    precise float _87 = _77 + cb1._m3.y;
    precise float _88 = _78 + cb1._m3.z;
    precise float _89 = _79 + cb1._m3.w;
    precise float _97 = _87 * cb2._m18.x;
    precise float _98 = _87 * cb2._m18.y;
    precise float _99 = _87 * cb2._m18.z;
    precise float _100 = _87 * cb2._m18.w;
    precise float _107 = fma(cb2._m17.x, _86, _97);
    precise float _108 = fma(cb2._m17.y, _86, _98);
    precise float _109 = fma(cb2._m17.z, _86, _99);
    precise float _110 = fma(cb2._m17.w, _86, _100);
    precise float _117 = fma(cb2._m19.x, _88, _107);
    precise float _118 = fma(cb2._m19.y, _88, _108);
    precise float _119 = fma(cb2._m19.z, _88, _109);
    precise float _120 = fma(cb2._m19.w, _88, _110);
    precise float _127 = fma(cb2._m20.x, _89, _117);
    precise float _128 = fma(cb2._m20.y, _89, _118);
    precise float _129 = fma(cb2._m20.z, _89, _119);
    precise float _130 = fma(cb2._m20.w, _89, _120);
    gl_Position.x = _127;
    gl_Position.y = _128;
    gl_Position.z = _129;
    gl_Position.w = _130;
    precise float _151 = COLOR.x * cb0._m2.x;
    precise float _152 = COLOR.y * cb0._m2.y;
    precise float _153 = COLOR.z * cb0._m2.z;
    precise float _154 = COLOR.w * cb0._m2.w;
    COLOR_1.x = _151;
    COLOR_1.y = _152;
    COLOR_1.z = _153;
    COLOR_1.w = _154;
    TEXCOORD_1.x = TEXCOORD.x;
    TEXCOORD_1.y = TEXCOORD.y;
}

