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
    uvec4 _m12;
    uvec4 _m13;
    vec2 _m14;
    vec2 _m15;
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
layout(location = 1, component = 2) out vec2 TEXCOORD3;
layout(location = 2, component = 0) out vec3 TEXCOORD1;
layout(location = 3, component = 0) out vec3 TEXCOORD2;
layout(location = 4, component = 0) out vec4 TEXCOORD4;

float dp3_f32(vec3 a, vec3 b)
{
    precise float _61 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _61));
}

void main()
{
    precise float _83 = POSITION.y * cb2._m1.x;
    precise float _84 = POSITION.y * cb2._m1.y;
    precise float _85 = POSITION.y * cb2._m1.z;
    precise float _86 = POSITION.y * cb2._m1.w;
    precise float _95 = fma(cb2._m0.x, POSITION.x, _83);
    precise float _96 = fma(cb2._m0.y, POSITION.x, _84);
    precise float _97 = fma(cb2._m0.z, POSITION.x, _85);
    precise float _98 = fma(cb2._m0.w, POSITION.x, _86);
    precise float _107 = fma(cb2._m2.x, POSITION.z, _95);
    precise float _108 = fma(cb2._m2.y, POSITION.z, _96);
    precise float _109 = fma(cb2._m2.z, POSITION.z, _97);
    precise float _110 = fma(cb2._m2.w, POSITION.z, _98);
    precise float _117 = _107 + cb2._m3.x;
    precise float _118 = _108 + cb2._m3.y;
    precise float _119 = _109 + cb2._m3.z;
    precise float _120 = _110 + cb2._m3.w;
    precise float _128 = _118 * cb3._m18.x;
    precise float _129 = _118 * cb3._m18.y;
    precise float _130 = _118 * cb3._m18.z;
    precise float _131 = _118 * cb3._m18.w;
    precise float _138 = fma(cb3._m17.x, _117, _128);
    precise float _139 = fma(cb3._m17.y, _117, _129);
    precise float _140 = fma(cb3._m17.z, _117, _130);
    precise float _141 = fma(cb3._m17.w, _117, _131);
    precise float _148 = fma(cb3._m19.x, _119, _138);
    precise float _149 = fma(cb3._m19.y, _119, _139);
    precise float _150 = fma(cb3._m19.z, _119, _140);
    precise float _151 = fma(cb3._m19.w, _119, _141);
    precise float _158 = fma(cb3._m20.x, _120, _148);
    precise float _159 = fma(cb3._m20.y, _120, _149);
    precise float _160 = fma(cb3._m20.z, _120, _150);
    precise float _161 = fma(cb3._m20.w, _120, _151);
    gl_Position.x = _158;
    gl_Position.y = _159;
    gl_Position.z = _160;
    gl_Position.w = _161;
    precise float _175 = fma(cb2._m3.x, POSITION.w, _107);
    precise float _176 = fma(cb2._m3.y, POSITION.w, _108);
    precise float _177 = fma(cb2._m3.z, POSITION.w, _109);
    precise float _178 = fma(cb2._m3.w, POSITION.w, _110);
    TEXCOORD2.x = fma(cb2._m3.x, POSITION.w, _107);
    TEXCOORD2.y = fma(cb2._m3.y, POSITION.w, _108);
    TEXCOORD2.z = fma(cb2._m3.z, POSITION.w, _109);
    precise float _196 = _176 * cb0._m6.x;
    precise float _197 = _176 * cb0._m6.y;
    TEXCOORD3.x = fma(cb0._m10.x, _178, fma(cb0._m8.x, _177, fma(cb0._m4.x, _175, _196)));
    TEXCOORD3.y = fma(cb0._m10.y, _178, fma(cb0._m8.y, _177, fma(cb0._m4.y, _175, _197)));
    TEXCOORD_1.x = fma(TEXCOORD.x, cb0._m14.x, cb0._m15.x);
    TEXCOORD_1.y = fma(TEXCOORD.y, cb0._m14.y, cb0._m15.y);
    vec3 _240 = vec3(NORMAL.x, NORMAL.y, NORMAL.z);
    float _244 = dp3_f32(_240, cb2._m4);
    float _247 = dp3_f32(_240, cb2._m6);
    float _250 = dp3_f32(_240, cb2._m8);
    vec3 _251 = vec3(_244, _247, _250);
    precise float _253 = inversesqrt(dp3_f32(_251, _251));
    precise float _254 = _253 * _244;
    precise float _255 = _253 * _247;
    precise float _256 = _253 * _250;
    TEXCOORD1.x = _254;
    TEXCOORD1.y = _255;
    TEXCOORD1.z = _256;
    precise float _264 = _159 * cb1._m5.x;
    precise float _265 = _264 * 0.5;
    precise float _266 = _158 * 0.5;
    precise float _267 = _161 * 0.5;
    TEXCOORD4.z = _160;
    TEXCOORD4.w = _161;
    precise float _270 = _267 + _266;
    precise float _271 = _267 + _265;
    TEXCOORD4.x = _270;
    TEXCOORD4.y = _271;
}

