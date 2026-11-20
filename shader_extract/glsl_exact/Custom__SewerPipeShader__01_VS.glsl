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
    uvec4 _m10;
    uvec4 _m11;
    uvec4 _m12;
    uvec4 _m13;
    uvec4 _m14;
    uvec4 _m15;
    uvec4 _m16;
    uvec4 _m17;
    uvec4 _m18;
    uvec4 _m19;
    uvec4 _m20;
    uvec4 _m21;
    uvec4 _m22;
    uvec4 _m23;
    uvec4 _m24;
    uvec4 _m25;
    uvec4 _m26;
    uvec4 _m27;
    uvec4 _m28;
    uvec4 _m29;
    uvec4 _m30;
    uvec4 _m31;
    uvec4 _m32;
    uvec4 _m33;
    uvec4 _m34;
    uvec4 _m35;
    uvec4 _m36;
    uvec4 _m37;
    uvec4 _m38;
    vec4 _m39;
    vec4 _m40;
    vec4 _m41;
    vec4 _m42;
    vec4 _m43;
    vec4 _m44;
    vec3 _m45;
    uint _m46;
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
layout(location = 4, component = 0) out vec4 TEXCOORD5;

float dp3_f32(vec3 a, vec3 b)
{
    precise float _73 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _73));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _55 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _55)));
}

void main()
{
    precise float _94 = POSITION.y * cb1._m1.x;
    precise float _95 = POSITION.y * cb1._m1.y;
    precise float _96 = POSITION.y * cb1._m1.z;
    precise float _97 = POSITION.y * cb1._m1.w;
    precise float _106 = fma(cb1._m0.x, POSITION.x, _94);
    precise float _107 = fma(cb1._m0.y, POSITION.x, _95);
    precise float _108 = fma(cb1._m0.z, POSITION.x, _96);
    precise float _109 = fma(cb1._m0.w, POSITION.x, _97);
    precise float _118 = fma(cb1._m2.x, POSITION.z, _106);
    precise float _119 = fma(cb1._m2.y, POSITION.z, _107);
    precise float _120 = fma(cb1._m2.z, POSITION.z, _108);
    precise float _121 = fma(cb1._m2.w, POSITION.z, _109);
    precise float _128 = _118 + cb1._m3.x;
    precise float _129 = _119 + cb1._m3.y;
    precise float _130 = _120 + cb1._m3.z;
    precise float _131 = _121 + cb1._m3.w;
    TEXCOORD1.x = fma(cb1._m3.x, POSITION.w, _118);
    TEXCOORD1.y = fma(cb1._m3.y, POSITION.w, _119);
    TEXCOORD1.z = fma(cb1._m3.z, POSITION.w, _120);
    precise float _153 = _129 * cb2._m18.x;
    precise float _154 = _129 * cb2._m18.y;
    precise float _155 = _129 * cb2._m18.z;
    precise float _156 = _129 * cb2._m18.w;
    precise float _163 = fma(cb2._m17.x, _128, _153);
    precise float _164 = fma(cb2._m17.y, _128, _154);
    precise float _165 = fma(cb2._m17.z, _128, _155);
    precise float _166 = fma(cb2._m17.w, _128, _156);
    precise float _173 = fma(cb2._m19.x, _130, _163);
    precise float _174 = fma(cb2._m19.y, _130, _164);
    precise float _175 = fma(cb2._m19.z, _130, _165);
    precise float _176 = fma(cb2._m19.w, _130, _166);
    precise float _183 = fma(cb2._m20.x, _131, _173);
    precise float _184 = fma(cb2._m20.y, _131, _174);
    precise float _185 = fma(cb2._m20.z, _131, _175);
    precise float _186 = fma(cb2._m20.w, _131, _176);
    gl_Position.x = _183;
    gl_Position.y = _184;
    gl_Position.z = _185;
    gl_Position.w = _186;
    vec3 _197 = vec3(NORMAL.x, NORMAL.y, NORMAL.z);
    float _201 = dp3_f32(_197, cb1._m4);
    float _204 = dp3_f32(_197, cb1._m6);
    float _207 = dp3_f32(_197, cb1._m8);
    vec3 _208 = vec3(_201, _204, _207);
    precise float _210 = inversesqrt(dp3_f32(_208, _208));
    precise float _211 = _210 * _201;
    precise float _212 = _210 * _204;
    precise float _213 = _210 * _207;
    TEXCOORD.x = _211;
    TEXCOORD.y = _212;
    TEXCOORD.z = _213;
    precise float _217 = _212 * _212;
    precise float _219 = fma(_211, _211, -_217);
    precise float _220 = _212 * _211;
    precise float _221 = _213 * _212;
    precise float _222 = _213 * _213;
    precise float _223 = _211 * _213;
    vec4 _227 = vec4(_220, _221, _222, _223);
    vec4 _245 = vec4(_211, _212, _213, 1.0);
    precise float _253 = fma(cb0._m45.x, _219, dp4_f32(cb0._m42, _227)) + dp4_f32(cb0._m39, _245);
    precise float _254 = fma(cb0._m45.y, _219, dp4_f32(cb0._m43, _227)) + dp4_f32(cb0._m40, _245);
    precise float _255 = fma(cb0._m45.z, _219, dp4_f32(cb0._m44, _227)) + dp4_f32(cb0._m41, _245);
    TEXCOORD2.x = _253;
    TEXCOORD2.y = _254;
    TEXCOORD2.z = _255;
    TEXCOORD5.x = 0.0;
    TEXCOORD5.y = 0.0;
    TEXCOORD5.z = 0.0;
    TEXCOORD5.w = 0.0;
}

