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
    vec2 _m8;
    vec2 _m9;
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
    uvec4 _m39;
    uvec4 _m40;
    uvec4 _m41;
    vec4 _m42;
    vec4 _m43;
    vec4 _m44;
    vec3 _m45;
    uint _m46;
} cb2;

layout(set = 0, binding = 3, std140) uniform cb3_buf
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
} cb3;

layout(set = 0, binding = 4, std140) uniform cb4_buf
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
} cb4;

layout(location = 0, component = 0) in vec4 POSITION;
layout(location = 2, component = 0) in vec3 NORMAL;
layout(location = 3, component = 0) in vec2 TEXCOORD;
layout(location = 1, component = 0) out vec2 TEXCOORD_1;
layout(location = 2, component = 0) out vec3 TEXCOORD1;
layout(location = 3, component = 0) out vec3 TEXCOORD2;
layout(location = 4, component = 0) out vec3 TEXCOORD3;
layout(location = 5, component = 0) out vec4 TEXCOORD5;
layout(location = 6, component = 0) out vec4 TEXCOORD6;

float dp3_f32(vec3 a, vec3 b)
{
    precise float _86 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _86));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _68 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _68)));
}

void main()
{
    precise float _107 = POSITION.y * cb3._m1.x;
    precise float _108 = POSITION.y * cb3._m1.y;
    precise float _109 = POSITION.y * cb3._m1.z;
    precise float _110 = POSITION.y * cb3._m1.w;
    precise float _119 = fma(cb3._m0.x, POSITION.x, _107);
    precise float _120 = fma(cb3._m0.y, POSITION.x, _108);
    precise float _121 = fma(cb3._m0.z, POSITION.x, _109);
    precise float _122 = fma(cb3._m0.w, POSITION.x, _110);
    precise float _131 = fma(cb3._m2.x, POSITION.z, _119);
    precise float _132 = fma(cb3._m2.y, POSITION.z, _120);
    precise float _133 = fma(cb3._m2.z, POSITION.z, _121);
    precise float _134 = fma(cb3._m2.w, POSITION.z, _122);
    precise float _141 = _131 + cb3._m3.x;
    precise float _142 = _132 + cb3._m3.y;
    precise float _143 = _133 + cb3._m3.z;
    precise float _144 = _134 + cb3._m3.w;
    TEXCOORD2.x = fma(cb3._m3.x, POSITION.w, _131);
    TEXCOORD2.y = fma(cb3._m3.y, POSITION.w, _132);
    TEXCOORD2.z = fma(cb3._m3.z, POSITION.w, _133);
    precise float _166 = _142 * cb4._m18.x;
    precise float _167 = _142 * cb4._m18.y;
    precise float _168 = _142 * cb4._m18.z;
    precise float _169 = _142 * cb4._m18.w;
    precise float _176 = fma(cb4._m17.x, _141, _166);
    precise float _177 = fma(cb4._m17.y, _141, _167);
    precise float _178 = fma(cb4._m17.z, _141, _168);
    precise float _179 = fma(cb4._m17.w, _141, _169);
    precise float _186 = fma(cb4._m19.x, _143, _176);
    precise float _187 = fma(cb4._m19.y, _143, _177);
    precise float _188 = fma(cb4._m19.z, _143, _178);
    precise float _189 = fma(cb4._m19.w, _143, _179);
    precise float _196 = fma(cb4._m20.x, _144, _186);
    precise float _197 = fma(cb4._m20.y, _144, _187);
    precise float _198 = fma(cb4._m20.z, _144, _188);
    precise float _199 = fma(cb4._m20.w, _144, _189);
    gl_Position.x = _196;
    gl_Position.y = _197;
    gl_Position.z = _198;
    gl_Position.w = _199;
    TEXCOORD_1.x = fma(TEXCOORD.x, cb0._m8.x, cb0._m9.x);
    TEXCOORD_1.y = fma(TEXCOORD.y, cb0._m8.y, cb0._m9.y);
    vec3 _228 = vec3(NORMAL.x, NORMAL.y, NORMAL.z);
    float _232 = dp3_f32(_228, cb3._m4);
    float _235 = dp3_f32(_228, cb3._m6);
    float _238 = dp3_f32(_228, cb3._m8);
    vec3 _239 = vec3(_232, _235, _238);
    precise float _241 = inversesqrt(dp3_f32(_239, _239));
    precise float _242 = _241 * _232;
    precise float _243 = _241 * _235;
    precise float _244 = _241 * _238;
    TEXCOORD1.x = _242;
    TEXCOORD1.y = _243;
    TEXCOORD1.z = _244;
    precise float _248 = _243 * _243;
    precise float _250 = fma(_242, _242, -_248);
    precise float _251 = _243 * _242;
    precise float _252 = _244 * _243;
    precise float _253 = _244 * _244;
    precise float _254 = _242 * _244;
    vec4 _258 = vec4(_251, _252, _253, _254);
    TEXCOORD3.x = fma(cb2._m45.x, _250, dp4_f32(cb2._m42, _258));
    TEXCOORD3.y = fma(cb2._m45.y, _250, dp4_f32(cb2._m43, _258));
    TEXCOORD3.z = fma(cb2._m45.z, _250, dp4_f32(cb2._m44, _258));
    precise float _281 = _197 * cb1._m5.x;
    precise float _282 = _196 * 0.5;
    precise float _283 = _199 * 0.5;
    precise float _284 = _281 * 0.5;
    TEXCOORD5.z = _198;
    TEXCOORD5.w = _199;
    precise float _287 = _283 + _282;
    precise float _288 = _283 + _284;
    TEXCOORD5.x = _287;
    TEXCOORD5.y = _288;
    TEXCOORD6.x = 0.0;
    TEXCOORD6.y = 0.0;
    TEXCOORD6.z = 0.0;
    TEXCOORD6.w = 0.0;
}

