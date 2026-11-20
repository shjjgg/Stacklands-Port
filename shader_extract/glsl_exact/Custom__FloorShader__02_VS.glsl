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
    vec4 _m5;
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
layout(location = 3, component = 0) out vec3 TEXCOORD2;
layout(location = 4, component = 0) out vec4 TEXCOORD4;
layout(location = 5, component = 0) out vec4 TEXCOORD5;

float dp3_f32(vec3 a, vec3 b)
{
    precise float _52 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _52));
}

void main()
{
    precise float _74 = POSITION.y * cb1._m1.x;
    precise float _75 = POSITION.y * cb1._m1.y;
    precise float _76 = POSITION.y * cb1._m1.z;
    precise float _77 = POSITION.y * cb1._m1.w;
    precise float _86 = fma(cb1._m0.x, POSITION.x, _74);
    precise float _87 = fma(cb1._m0.y, POSITION.x, _75);
    precise float _88 = fma(cb1._m0.z, POSITION.x, _76);
    precise float _89 = fma(cb1._m0.w, POSITION.x, _77);
    precise float _98 = fma(cb1._m2.x, POSITION.z, _86);
    precise float _99 = fma(cb1._m2.y, POSITION.z, _87);
    precise float _100 = fma(cb1._m2.z, POSITION.z, _88);
    precise float _101 = fma(cb1._m2.w, POSITION.z, _89);
    precise float _108 = _98 + cb1._m3.x;
    precise float _109 = _99 + cb1._m3.y;
    precise float _110 = _100 + cb1._m3.z;
    precise float _111 = _101 + cb1._m3.w;
    TEXCOORD1.x = fma(cb1._m3.x, POSITION.w, _98);
    TEXCOORD1.y = fma(cb1._m3.y, POSITION.w, _99);
    TEXCOORD1.z = fma(cb1._m3.z, POSITION.w, _100);
    precise float _133 = _109 * cb2._m18.x;
    precise float _134 = _109 * cb2._m18.y;
    precise float _135 = _109 * cb2._m18.z;
    precise float _136 = _109 * cb2._m18.w;
    precise float _143 = fma(cb2._m17.x, _108, _133);
    precise float _144 = fma(cb2._m17.y, _108, _134);
    precise float _145 = fma(cb2._m17.z, _108, _135);
    precise float _146 = fma(cb2._m17.w, _108, _136);
    precise float _153 = fma(cb2._m19.x, _110, _143);
    precise float _154 = fma(cb2._m19.y, _110, _144);
    precise float _155 = fma(cb2._m19.z, _110, _145);
    precise float _156 = fma(cb2._m19.w, _110, _146);
    precise float _163 = fma(cb2._m20.x, _111, _153);
    precise float _164 = fma(cb2._m20.y, _111, _154);
    precise float _165 = fma(cb2._m20.z, _111, _155);
    precise float _166 = fma(cb2._m20.w, _111, _156);
    gl_Position.x = _163;
    gl_Position.y = _164;
    gl_Position.z = _165;
    gl_Position.w = _166;
    vec3 _177 = vec3(NORMAL.x, NORMAL.y, NORMAL.z);
    float _181 = dp3_f32(_177, cb1._m4);
    float _184 = dp3_f32(_177, cb1._m6);
    float _187 = dp3_f32(_177, cb1._m8);
    vec3 _188 = vec3(_181, _184, _187);
    precise float _190 = inversesqrt(dp3_f32(_188, _188));
    precise float _191 = _190 * _181;
    precise float _192 = _190 * _184;
    precise float _193 = _190 * _187;
    TEXCOORD.x = _191;
    TEXCOORD.y = _192;
    TEXCOORD.z = _193;
    TEXCOORD2.x = 0.0;
    TEXCOORD2.y = 0.0;
    TEXCOORD2.z = 0.0;
    precise float _204 = _164 * cb0._m5.x;
    precise float _205 = _163 * 0.5;
    precise float _206 = _166 * 0.5;
    precise float _207 = _204 * 0.5;
    TEXCOORD4.z = _165;
    TEXCOORD4.w = _166;
    precise float _210 = _206 + _205;
    precise float _211 = _206 + _207;
    TEXCOORD4.x = _210;
    TEXCOORD4.y = _211;
    TEXCOORD5.x = 0.0;
    TEXCOORD5.y = 0.0;
    TEXCOORD5.z = 0.0;
    TEXCOORD5.w = 0.0;
}

