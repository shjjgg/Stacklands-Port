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
    uvec4 _m12;
    uvec4 _m13;
    uvec4 _m14;
    uvec4 _m15;
    uvec4 _m16;
    uvec4 _m17;
    vec2 _m18;
    vec2 _m19;
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
layout(location = 3, component = 0) in vec2 TEXCOORD;
layout(location = 1, component = 0) out vec2 TEXCOORD_1;
layout(location = 2, component = 0) out vec3 TEXCOORD1;
layout(location = 3, component = 0) out vec3 TEXCOORD2;
layout(location = 4, component = 0) out vec3 TEXCOORD3;
layout(location = 5, component = 0) out vec4 TEXCOORD4;

float dp3_f32(vec3 a, vec3 b)
{
    precise float _53 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _53));
}

void main()
{
    precise float _75 = POSITION.y * cb1._m1.x;
    precise float _76 = POSITION.y * cb1._m1.y;
    precise float _77 = POSITION.y * cb1._m1.z;
    precise float _78 = POSITION.y * cb1._m1.w;
    precise float _87 = fma(cb1._m0.x, POSITION.x, _75);
    precise float _88 = fma(cb1._m0.y, POSITION.x, _76);
    precise float _89 = fma(cb1._m0.z, POSITION.x, _77);
    precise float _90 = fma(cb1._m0.w, POSITION.x, _78);
    precise float _99 = fma(cb1._m2.x, POSITION.z, _87);
    precise float _100 = fma(cb1._m2.y, POSITION.z, _88);
    precise float _101 = fma(cb1._m2.z, POSITION.z, _89);
    precise float _102 = fma(cb1._m2.w, POSITION.z, _90);
    precise float _109 = _99 + cb1._m3.x;
    precise float _110 = _100 + cb1._m3.y;
    precise float _111 = _101 + cb1._m3.z;
    precise float _112 = _102 + cb1._m3.w;
    precise float _120 = _110 * cb2._m18.x;
    precise float _121 = _110 * cb2._m18.y;
    precise float _122 = _110 * cb2._m18.z;
    precise float _123 = _110 * cb2._m18.w;
    precise float _130 = fma(cb2._m17.x, _109, _120);
    precise float _131 = fma(cb2._m17.y, _109, _121);
    precise float _132 = fma(cb2._m17.z, _109, _122);
    precise float _133 = fma(cb2._m17.w, _109, _123);
    precise float _140 = fma(cb2._m19.x, _111, _130);
    precise float _141 = fma(cb2._m19.y, _111, _131);
    precise float _142 = fma(cb2._m19.z, _111, _132);
    precise float _143 = fma(cb2._m19.w, _111, _133);
    precise float _150 = fma(cb2._m20.x, _112, _140);
    precise float _151 = fma(cb2._m20.y, _112, _141);
    precise float _152 = fma(cb2._m20.z, _112, _142);
    precise float _153 = fma(cb2._m20.w, _112, _143);
    gl_Position.x = _150;
    gl_Position.y = _151;
    gl_Position.z = _152;
    gl_Position.w = _153;
    TEXCOORD_1.x = fma(TEXCOORD.x, cb0._m18.x, cb0._m19.x);
    TEXCOORD_1.y = fma(TEXCOORD.y, cb0._m18.y, cb0._m19.y);
    vec3 _183 = vec3(NORMAL.x, NORMAL.y, NORMAL.z);
    float _187 = dp3_f32(_183, cb1._m4);
    float _190 = dp3_f32(_183, cb1._m6);
    float _193 = dp3_f32(_183, cb1._m8);
    vec3 _194 = vec3(_187, _190, _193);
    precise float _196 = inversesqrt(dp3_f32(_194, _194));
    precise float _197 = _196 * _187;
    precise float _198 = _196 * _190;
    precise float _199 = _196 * _193;
    TEXCOORD1.x = _197;
    TEXCOORD1.y = _198;
    TEXCOORD1.z = _199;
    TEXCOORD2.x = fma(cb1._m3.x, POSITION.w, _99);
    TEXCOORD2.y = fma(cb1._m3.y, POSITION.w, _100);
    TEXCOORD2.z = fma(cb1._m3.z, POSITION.w, _101);
    precise float _222 = fma(cb1._m3.x, POSITION.w, _99);
    precise float _223 = fma(cb1._m3.y, POSITION.w, _100);
    precise float _224 = fma(cb1._m3.z, POSITION.w, _101);
    precise float _225 = fma(cb1._m3.w, POSITION.w, _102);
    precise float _231 = _223 * cb0._m6.x;
    precise float _232 = _223 * cb0._m6.y;
    precise float _233 = _223 * cb0._m6.z;
    TEXCOORD3.x = fma(cb0._m10.x, _225, fma(cb0._m8.x, _224, fma(cb0._m4.x, _222, _231)));
    TEXCOORD3.y = fma(cb0._m10.y, _225, fma(cb0._m8.y, _224, fma(cb0._m4.y, _222, _232)));
    TEXCOORD3.z = fma(cb0._m10.z, _225, fma(cb0._m8.z, _224, fma(cb0._m4.z, _222, _233)));
    TEXCOORD4.x = 0.0;
    TEXCOORD4.y = 0.0;
    TEXCOORD4.z = 0.0;
    TEXCOORD4.w = 0.0;
}

