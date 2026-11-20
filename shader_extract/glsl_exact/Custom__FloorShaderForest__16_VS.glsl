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
layout(location = 1, component = 0) out vec3 TEXCOORD;
layout(location = 2, component = 0) out vec3 TEXCOORD1;
layout(location = 3, component = 0) out vec2 TEXCOORD2;
layout(location = 4, component = 0) out vec4 TEXCOORD3;

float dp3_f32(vec3 a, vec3 b)
{
    precise float _51 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _51));
}

void main()
{
    precise float _73 = POSITION.y * cb1._m1.x;
    precise float _74 = POSITION.y * cb1._m1.y;
    precise float _75 = POSITION.y * cb1._m1.z;
    precise float _76 = POSITION.y * cb1._m1.w;
    precise float _85 = fma(cb1._m0.x, POSITION.x, _73);
    precise float _86 = fma(cb1._m0.y, POSITION.x, _74);
    precise float _87 = fma(cb1._m0.z, POSITION.x, _75);
    precise float _88 = fma(cb1._m0.w, POSITION.x, _76);
    precise float _97 = fma(cb1._m2.x, POSITION.z, _85);
    precise float _98 = fma(cb1._m2.y, POSITION.z, _86);
    precise float _99 = fma(cb1._m2.z, POSITION.z, _87);
    precise float _100 = fma(cb1._m2.w, POSITION.z, _88);
    precise float _107 = _97 + cb1._m3.x;
    precise float _108 = _98 + cb1._m3.y;
    precise float _109 = _99 + cb1._m3.z;
    precise float _110 = _100 + cb1._m3.w;
    precise float _118 = _108 * cb2._m18.x;
    precise float _119 = _108 * cb2._m18.y;
    precise float _120 = _108 * cb2._m18.z;
    precise float _121 = _108 * cb2._m18.w;
    precise float _128 = fma(cb2._m17.x, _107, _118);
    precise float _129 = fma(cb2._m17.y, _107, _119);
    precise float _130 = fma(cb2._m17.z, _107, _120);
    precise float _131 = fma(cb2._m17.w, _107, _121);
    precise float _138 = fma(cb2._m19.x, _109, _128);
    precise float _139 = fma(cb2._m19.y, _109, _129);
    precise float _140 = fma(cb2._m19.z, _109, _130);
    precise float _141 = fma(cb2._m19.w, _109, _131);
    precise float _148 = fma(cb2._m20.x, _110, _138);
    precise float _149 = fma(cb2._m20.y, _110, _139);
    precise float _150 = fma(cb2._m20.z, _110, _140);
    precise float _151 = fma(cb2._m20.w, _110, _141);
    gl_Position.x = _148;
    gl_Position.y = _149;
    gl_Position.z = _150;
    gl_Position.w = _151;
    vec3 _163 = vec3(NORMAL.x, NORMAL.y, NORMAL.z);
    float _167 = dp3_f32(_163, cb1._m4);
    float _170 = dp3_f32(_163, cb1._m6);
    float _173 = dp3_f32(_163, cb1._m8);
    vec3 _174 = vec3(_167, _170, _173);
    precise float _176 = inversesqrt(dp3_f32(_174, _174));
    precise float _177 = _176 * _167;
    precise float _178 = _176 * _170;
    precise float _179 = _176 * _173;
    TEXCOORD.x = _177;
    TEXCOORD.y = _178;
    TEXCOORD.z = _179;
    TEXCOORD1.x = fma(cb1._m3.x, POSITION.w, _97);
    TEXCOORD1.y = fma(cb1._m3.y, POSITION.w, _98);
    TEXCOORD1.z = fma(cb1._m3.z, POSITION.w, _99);
    precise float _202 = fma(cb1._m3.x, POSITION.w, _97);
    precise float _203 = fma(cb1._m3.y, POSITION.w, _98);
    precise float _204 = fma(cb1._m3.z, POSITION.w, _99);
    precise float _205 = fma(cb1._m3.w, POSITION.w, _100);
    precise float _212 = _203 * cb0._m6.x;
    precise float _213 = _203 * cb0._m6.y;
    TEXCOORD2.x = fma(cb0._m10.x, _205, fma(cb0._m8.x, _204, fma(cb0._m4.x, _202, _212)));
    TEXCOORD2.y = fma(cb0._m10.y, _205, fma(cb0._m8.y, _204, fma(cb0._m4.y, _202, _213)));
    TEXCOORD3.x = 0.0;
    TEXCOORD3.y = 0.0;
    TEXCOORD3.z = 0.0;
    TEXCOORD3.w = 0.0;
}

