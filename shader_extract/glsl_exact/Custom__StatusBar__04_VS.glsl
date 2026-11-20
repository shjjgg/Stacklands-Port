#version 450
#extension GL_EXT_buffer_reference2 : require

invariant gl_Position;

layout(set = 0, binding = 0, std140) uniform cb0_buf
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
    vec2 _m10;
    vec2 _m11;
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
layout(location = 4, component = 0) out vec4 TEXCOORD5;
layout(location = 5, component = 0) out vec4 TEXCOORD6;

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
    TEXCOORD2.x = fma(cb1._m3.x, POSITION.w, _100);
    TEXCOORD2.y = fma(cb1._m3.y, POSITION.w, _101);
    TEXCOORD2.z = fma(cb1._m3.z, POSITION.w, _102);
    precise float _135 = _111 * cb2._m18.x;
    precise float _136 = _111 * cb2._m18.y;
    precise float _137 = _111 * cb2._m18.z;
    precise float _138 = _111 * cb2._m18.w;
    precise float _145 = fma(cb2._m17.x, _110, _135);
    precise float _146 = fma(cb2._m17.y, _110, _136);
    precise float _147 = fma(cb2._m17.z, _110, _137);
    precise float _148 = fma(cb2._m17.w, _110, _138);
    precise float _155 = fma(cb2._m19.x, _112, _145);
    precise float _156 = fma(cb2._m19.y, _112, _146);
    precise float _157 = fma(cb2._m19.z, _112, _147);
    precise float _158 = fma(cb2._m19.w, _112, _148);
    precise float _165 = fma(cb2._m20.x, _113, _155);
    precise float _166 = fma(cb2._m20.y, _113, _156);
    precise float _167 = fma(cb2._m20.z, _113, _157);
    precise float _168 = fma(cb2._m20.w, _113, _158);
    gl_Position.x = _165;
    gl_Position.y = _166;
    gl_Position.z = _167;
    gl_Position.w = _168;
    TEXCOORD_1.x = fma(TEXCOORD.x, cb0._m10.x, cb0._m11.x);
    TEXCOORD_1.y = fma(TEXCOORD.y, cb0._m10.y, cb0._m11.y);
    vec3 _197 = vec3(NORMAL.x, NORMAL.y, NORMAL.z);
    float _201 = dp3_f32(_197, cb1._m4);
    float _204 = dp3_f32(_197, cb1._m6);
    float _207 = dp3_f32(_197, cb1._m8);
    vec3 _208 = vec3(_201, _204, _207);
    precise float _210 = inversesqrt(dp3_f32(_208, _208));
    precise float _211 = _210 * _201;
    precise float _212 = _210 * _204;
    precise float _213 = _210 * _207;
    TEXCOORD1.x = _211;
    TEXCOORD1.y = _212;
    TEXCOORD1.z = _213;
    TEXCOORD5.x = 0.0;
    TEXCOORD5.y = 0.0;
    TEXCOORD5.z = 0.0;
    TEXCOORD5.w = 0.0;
    TEXCOORD6.x = 0.0;
    TEXCOORD6.y = 0.0;
    TEXCOORD6.z = 0.0;
    TEXCOORD6.w = 0.0;
}

