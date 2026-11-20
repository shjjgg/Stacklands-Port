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
layout(location = 4, component = 0) out vec4 TEXCOORD4;
layout(location = 5, component = 0) out vec4 TEXCOORD5;

float dp3_f32(vec3 a, vec3 b)
{
    precise float _74 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _74));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _56 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _56)));
}

void main()
{
    precise float _95 = POSITION.y * cb1._m1.x;
    precise float _96 = POSITION.y * cb1._m1.y;
    precise float _97 = POSITION.y * cb1._m1.z;
    precise float _98 = POSITION.y * cb1._m1.w;
    precise float _107 = fma(cb1._m0.x, POSITION.x, _95);
    precise float _108 = fma(cb1._m0.y, POSITION.x, _96);
    precise float _109 = fma(cb1._m0.z, POSITION.x, _97);
    precise float _110 = fma(cb1._m0.w, POSITION.x, _98);
    precise float _119 = fma(cb1._m2.x, POSITION.z, _107);
    precise float _120 = fma(cb1._m2.y, POSITION.z, _108);
    precise float _121 = fma(cb1._m2.z, POSITION.z, _109);
    precise float _122 = fma(cb1._m2.w, POSITION.z, _110);
    precise float _129 = _119 + cb1._m3.x;
    precise float _130 = _120 + cb1._m3.y;
    precise float _131 = _121 + cb1._m3.z;
    precise float _132 = _122 + cb1._m3.w;
    TEXCOORD1.x = fma(cb1._m3.x, POSITION.w, _119);
    TEXCOORD1.y = fma(cb1._m3.y, POSITION.w, _120);
    TEXCOORD1.z = fma(cb1._m3.z, POSITION.w, _121);
    precise float _154 = _130 * cb2._m18.x;
    precise float _155 = _130 * cb2._m18.y;
    precise float _156 = _130 * cb2._m18.z;
    precise float _157 = _130 * cb2._m18.w;
    precise float _164 = fma(cb2._m17.x, _129, _154);
    precise float _165 = fma(cb2._m17.y, _129, _155);
    precise float _166 = fma(cb2._m17.z, _129, _156);
    precise float _167 = fma(cb2._m17.w, _129, _157);
    precise float _174 = fma(cb2._m19.x, _131, _164);
    precise float _175 = fma(cb2._m19.y, _131, _165);
    precise float _176 = fma(cb2._m19.z, _131, _166);
    precise float _177 = fma(cb2._m19.w, _131, _167);
    precise float _184 = fma(cb2._m20.x, _132, _174);
    precise float _185 = fma(cb2._m20.y, _132, _175);
    precise float _186 = fma(cb2._m20.z, _132, _176);
    precise float _187 = fma(cb2._m20.w, _132, _177);
    gl_Position.x = _184;
    gl_Position.y = _185;
    gl_Position.z = _186;
    gl_Position.w = _187;
    vec3 _198 = vec3(NORMAL.x, NORMAL.y, NORMAL.z);
    float _202 = dp3_f32(_198, cb1._m4);
    float _205 = dp3_f32(_198, cb1._m6);
    float _208 = dp3_f32(_198, cb1._m8);
    vec3 _209 = vec3(_202, _205, _208);
    precise float _211 = inversesqrt(dp3_f32(_209, _209));
    precise float _212 = _211 * _202;
    precise float _213 = _211 * _205;
    precise float _214 = _211 * _208;
    TEXCOORD.x = _212;
    TEXCOORD.y = _213;
    TEXCOORD.z = _214;
    precise float _218 = _213 * _213;
    precise float _220 = fma(_212, _212, -_218);
    precise float _221 = _213 * _212;
    precise float _222 = _214 * _213;
    precise float _223 = _214 * _214;
    precise float _224 = _212 * _214;
    vec4 _228 = vec4(_221, _222, _223, _224);
    vec4 _246 = vec4(_212, _213, _214, 1.0);
    precise float _254 = fma(cb0._m45.x, _220, dp4_f32(cb0._m42, _228)) + dp4_f32(cb0._m39, _246);
    precise float _255 = fma(cb0._m45.y, _220, dp4_f32(cb0._m43, _228)) + dp4_f32(cb0._m40, _246);
    precise float _256 = fma(cb0._m45.z, _220, dp4_f32(cb0._m44, _228)) + dp4_f32(cb0._m41, _246);
    TEXCOORD2.x = _254;
    TEXCOORD2.y = _255;
    TEXCOORD2.z = _256;
    TEXCOORD4.x = 0.0;
    TEXCOORD4.y = 0.0;
    TEXCOORD4.z = 0.0;
    TEXCOORD4.w = 0.0;
    TEXCOORD5.x = 0.0;
    TEXCOORD5.y = 0.0;
    TEXCOORD5.z = 0.0;
    TEXCOORD5.w = 0.0;
}

