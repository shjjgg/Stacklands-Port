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
layout(location = 1, component = 2) out vec2 TEXCOORD3;
layout(location = 2, component = 0) out vec3 TEXCOORD1;
layout(location = 3, component = 0) out vec3 TEXCOORD2;
layout(location = 4, component = 0) out vec4 TEXCOORD4;

float dp3_f32(vec3 a, vec3 b)
{
    precise float _54 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _54));
}

void main()
{
    precise float _76 = POSITION.y * cb1._m1.x;
    precise float _77 = POSITION.y * cb1._m1.y;
    precise float _78 = POSITION.y * cb1._m1.z;
    precise float _79 = POSITION.y * cb1._m1.w;
    precise float _88 = fma(cb1._m0.x, POSITION.x, _76);
    precise float _89 = fma(cb1._m0.y, POSITION.x, _77);
    precise float _90 = fma(cb1._m0.z, POSITION.x, _78);
    precise float _91 = fma(cb1._m0.w, POSITION.x, _79);
    precise float _100 = fma(cb1._m2.x, POSITION.z, _88);
    precise float _101 = fma(cb1._m2.y, POSITION.z, _89);
    precise float _102 = fma(cb1._m2.z, POSITION.z, _90);
    precise float _103 = fma(cb1._m2.w, POSITION.z, _91);
    precise float _110 = _100 + cb1._m3.x;
    precise float _111 = _101 + cb1._m3.y;
    precise float _112 = _102 + cb1._m3.z;
    precise float _113 = _103 + cb1._m3.w;
    precise float _121 = _111 * cb2._m18.x;
    precise float _122 = _111 * cb2._m18.y;
    precise float _123 = _111 * cb2._m18.z;
    precise float _124 = _111 * cb2._m18.w;
    precise float _131 = fma(cb2._m17.x, _110, _121);
    precise float _132 = fma(cb2._m17.y, _110, _122);
    precise float _133 = fma(cb2._m17.z, _110, _123);
    precise float _134 = fma(cb2._m17.w, _110, _124);
    precise float _141 = fma(cb2._m19.x, _112, _131);
    precise float _142 = fma(cb2._m19.y, _112, _132);
    precise float _143 = fma(cb2._m19.z, _112, _133);
    precise float _144 = fma(cb2._m19.w, _112, _134);
    precise float _151 = fma(cb2._m20.x, _113, _141);
    precise float _152 = fma(cb2._m20.y, _113, _142);
    precise float _153 = fma(cb2._m20.z, _113, _143);
    precise float _154 = fma(cb2._m20.w, _113, _144);
    gl_Position.x = _151;
    gl_Position.y = _152;
    gl_Position.z = _153;
    gl_Position.w = _154;
    precise float _168 = fma(cb1._m3.x, POSITION.w, _100);
    precise float _169 = fma(cb1._m3.y, POSITION.w, _101);
    precise float _170 = fma(cb1._m3.z, POSITION.w, _102);
    precise float _171 = fma(cb1._m3.w, POSITION.w, _103);
    TEXCOORD2.x = fma(cb1._m3.x, POSITION.w, _100);
    TEXCOORD2.y = fma(cb1._m3.y, POSITION.w, _101);
    TEXCOORD2.z = fma(cb1._m3.z, POSITION.w, _102);
    precise float _189 = _169 * cb0._m6.x;
    precise float _190 = _169 * cb0._m6.y;
    TEXCOORD3.x = fma(cb0._m10.x, _171, fma(cb0._m8.x, _170, fma(cb0._m4.x, _168, _189)));
    TEXCOORD3.y = fma(cb0._m10.y, _171, fma(cb0._m8.y, _170, fma(cb0._m4.y, _168, _190)));
    TEXCOORD_1.x = fma(TEXCOORD.x, cb0._m18.x, cb0._m19.x);
    TEXCOORD_1.y = fma(TEXCOORD.y, cb0._m18.y, cb0._m19.y);
    vec3 _233 = vec3(NORMAL.x, NORMAL.y, NORMAL.z);
    float _237 = dp3_f32(_233, cb1._m4);
    float _240 = dp3_f32(_233, cb1._m6);
    float _243 = dp3_f32(_233, cb1._m8);
    vec3 _244 = vec3(_237, _240, _243);
    precise float _246 = inversesqrt(dp3_f32(_244, _244));
    precise float _247 = _246 * _237;
    precise float _248 = _246 * _240;
    precise float _249 = _246 * _243;
    TEXCOORD1.x = _247;
    TEXCOORD1.y = _248;
    TEXCOORD1.z = _249;
    TEXCOORD4.x = 0.0;
    TEXCOORD4.y = 0.0;
    TEXCOORD4.z = 0.0;
    TEXCOORD4.w = 0.0;
}

