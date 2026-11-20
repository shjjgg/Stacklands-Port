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
layout(location = 1, component = 0) in vec2 TEXCOORD;
layout(location = 0, component = 0) out vec2 TEXCOORD_1;

void main()
{
    TEXCOORD_1.x = TEXCOORD.x;
    TEXCOORD_1.y = TEXCOORD.y;
    precise float _52 = POSITION.y * cb0._m1.x;
    precise float _53 = POSITION.y * cb0._m1.y;
    precise float _54 = POSITION.y * cb0._m1.z;
    precise float _55 = POSITION.y * cb0._m1.w;
    precise float _64 = fma(cb0._m0.x, POSITION.x, _52);
    precise float _66 = fma(cb0._m0.y, POSITION.x, _53);
    precise float _67 = fma(cb0._m0.z, POSITION.x, _54);
    precise float _68 = fma(cb0._m0.w, POSITION.x, _55);
    precise float _77 = fma(cb0._m2.x, POSITION.z, _64);
    precise float _78 = fma(cb0._m2.y, POSITION.z, _66);
    precise float _79 = fma(cb0._m2.z, POSITION.z, _67);
    precise float _80 = fma(cb0._m2.w, POSITION.z, _68);
    precise float _87 = _77 + cb0._m3.x;
    precise float _88 = _78 + cb0._m3.y;
    precise float _89 = _79 + cb0._m3.z;
    precise float _90 = _80 + cb0._m3.w;
    precise float _98 = _88 * cb1._m18.x;
    precise float _99 = _88 * cb1._m18.y;
    precise float _100 = _88 * cb1._m18.z;
    precise float _101 = _88 * cb1._m18.w;
    precise float _108 = fma(cb1._m17.x, _87, _98);
    precise float _109 = fma(cb1._m17.y, _87, _99);
    precise float _110 = fma(cb1._m17.z, _87, _100);
    precise float _111 = fma(cb1._m17.w, _87, _101);
    precise float _118 = fma(cb1._m19.x, _89, _108);
    precise float _119 = fma(cb1._m19.y, _89, _109);
    precise float _120 = fma(cb1._m19.z, _89, _110);
    precise float _121 = fma(cb1._m19.w, _89, _111);
    precise float _128 = fma(cb1._m20.x, _90, _118);
    precise float _129 = fma(cb1._m20.y, _90, _119);
    precise float _130 = fma(cb1._m20.z, _90, _120);
    precise float _131 = fma(cb1._m20.w, _90, _121);
    gl_Position.x = _128;
    gl_Position.y = _129;
    gl_Position.z = _130;
    gl_Position.w = _131;
}

