#version 450
#extension GL_EXT_buffer_reference2 : require

invariant gl_Position;

layout(set = 0, binding = 0, std140) uniform cb0_buf
{
    uvec4 _m0;
    uvec4 _m1;
    vec2 _m2;
    vec2 _m3;
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
layout(location = 1, component = 0) in vec2 TEXCOORD;
layout(location = 0, component = 0) out vec2 TEXCOORD_1;
layout(location = 2, component = 0) out vec4 TEXCOORD1;

void main()
{
    TEXCOORD_1.x = fma(TEXCOORD.x, cb0._m2.x, cb0._m3.x);
    TEXCOORD_1.y = fma(TEXCOORD.y, cb0._m2.y, cb0._m3.y);
    precise float _76 = POSITION.y * cb2._m1.x;
    precise float _77 = POSITION.y * cb2._m1.y;
    precise float _78 = POSITION.y * cb2._m1.z;
    precise float _79 = POSITION.y * cb2._m1.w;
    precise float _88 = fma(cb2._m0.x, POSITION.x, _76);
    precise float _89 = fma(cb2._m0.y, POSITION.x, _77);
    precise float _90 = fma(cb2._m0.z, POSITION.x, _78);
    precise float _91 = fma(cb2._m0.w, POSITION.x, _79);
    precise float _100 = fma(cb2._m2.x, POSITION.z, _88);
    precise float _101 = fma(cb2._m2.y, POSITION.z, _89);
    precise float _102 = fma(cb2._m2.z, POSITION.z, _90);
    precise float _103 = fma(cb2._m2.w, POSITION.z, _91);
    precise float _110 = _100 + cb2._m3.x;
    precise float _111 = _101 + cb2._m3.y;
    precise float _112 = _102 + cb2._m3.z;
    precise float _113 = _103 + cb2._m3.w;
    precise float _121 = _111 * cb3._m18.x;
    precise float _122 = _111 * cb3._m18.y;
    precise float _123 = _111 * cb3._m18.z;
    precise float _124 = _111 * cb3._m18.w;
    precise float _131 = fma(cb3._m17.x, _110, _121);
    precise float _132 = fma(cb3._m17.y, _110, _122);
    precise float _133 = fma(cb3._m17.z, _110, _123);
    precise float _134 = fma(cb3._m17.w, _110, _124);
    precise float _141 = fma(cb3._m19.x, _112, _131);
    precise float _142 = fma(cb3._m19.y, _112, _132);
    precise float _143 = fma(cb3._m19.z, _112, _133);
    precise float _144 = fma(cb3._m19.w, _112, _134);
    precise float _151 = fma(cb3._m20.x, _113, _141);
    precise float _152 = fma(cb3._m20.y, _113, _142);
    precise float _153 = fma(cb3._m20.z, _113, _143);
    precise float _154 = fma(cb3._m20.w, _113, _144);
    gl_Position.x = _151;
    gl_Position.y = _152;
    gl_Position.z = _153;
    gl_Position.w = _154;
    precise float _163 = _152 * cb1._m5.x;
    precise float _164 = _151 * 0.5;
    precise float _165 = _154 * 0.5;
    precise float _166 = _163 * 0.5;
    TEXCOORD1.z = _153;
    TEXCOORD1.w = _154;
    precise float _169 = _165 + _164;
    precise float _170 = _165 + _166;
    TEXCOORD1.x = _169;
    TEXCOORD1.y = _170;
}

