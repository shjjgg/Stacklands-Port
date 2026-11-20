#version 450
#extension GL_EXT_buffer_reference2 : require
#extension GL_EXT_spirv_intrinsics : require

invariant gl_Position;

layout(set = 0, binding = 0, std140) uniform cb0_buf
{
    uvec4 _m0;
    uvec4 _m1;
    uvec4 _m2;
    vec4 _m3;
    vec4 _m4;
    vec4 _m5;
    vec4 _m6;
    vec3 _m7;
    uint _m8;
    vec3 _m9;
    uint _m10;
    vec3 _m11;
    uint _m12;
    vec3 _m13;
    uint _m14;
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
    uvec4 _m42;
    vec4 _m43;
    vec4 _m44;
    vec4 _m45;
    vec4 _m46;
    vec4 _m47;
    vec4 _m48;
    vec3 _m49;
    uint _m50;
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

spirv_instruction(set = "GLSL.std.450", id = 80) float spvNMax(float, float);
spirv_instruction(set = "GLSL.std.450", id = 80) vec2 spvNMax(vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 80) vec3 spvNMax(vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 80) vec4 spvNMax(vec4, vec4);

float dp3_f32(vec3 a, vec3 b)
{
    precise float _79 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _79));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _61 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _61)));
}

void main()
{
    precise float _100 = POSITION.y * cb1._m1.x;
    precise float _101 = POSITION.y * cb1._m1.y;
    precise float _102 = POSITION.y * cb1._m1.z;
    precise float _103 = POSITION.y * cb1._m1.w;
    precise float _112 = fma(cb1._m0.x, POSITION.x, _100);
    precise float _113 = fma(cb1._m0.y, POSITION.x, _101);
    precise float _114 = fma(cb1._m0.z, POSITION.x, _102);
    precise float _115 = fma(cb1._m0.w, POSITION.x, _103);
    precise float _124 = fma(cb1._m2.x, POSITION.z, _112);
    precise float _125 = fma(cb1._m2.y, POSITION.z, _113);
    precise float _126 = fma(cb1._m2.z, POSITION.z, _114);
    precise float _127 = fma(cb1._m2.w, POSITION.z, _115);
    precise float _134 = _124 + cb1._m3.x;
    precise float _135 = _125 + cb1._m3.y;
    precise float _136 = _126 + cb1._m3.z;
    precise float _137 = _127 + cb1._m3.w;
    precise float _145 = fma(cb1._m3.x, POSITION.w, _124);
    precise float _146 = fma(cb1._m3.y, POSITION.w, _125);
    precise float _147 = fma(cb1._m3.z, POSITION.w, _126);
    precise float _155 = _135 * cb2._m18.x;
    precise float _156 = _135 * cb2._m18.y;
    precise float _157 = _135 * cb2._m18.z;
    precise float _158 = _135 * cb2._m18.w;
    precise float _165 = fma(cb2._m17.x, _134, _155);
    precise float _166 = fma(cb2._m17.y, _134, _156);
    precise float _167 = fma(cb2._m17.z, _134, _157);
    precise float _168 = fma(cb2._m17.w, _134, _158);
    precise float _175 = fma(cb2._m19.x, _136, _165);
    precise float _176 = fma(cb2._m19.y, _136, _166);
    precise float _177 = fma(cb2._m19.z, _136, _167);
    precise float _178 = fma(cb2._m19.w, _136, _168);
    precise float _185 = fma(cb2._m20.x, _137, _175);
    precise float _186 = fma(cb2._m20.y, _137, _176);
    precise float _187 = fma(cb2._m20.z, _137, _177);
    precise float _188 = fma(cb2._m20.w, _137, _178);
    gl_Position.x = _185;
    gl_Position.y = _186;
    gl_Position.z = _187;
    gl_Position.w = _188;
    vec3 _200 = vec3(NORMAL.x, NORMAL.y, NORMAL.z);
    float _204 = dp3_f32(_200, cb1._m4);
    float _207 = dp3_f32(_200, cb1._m6);
    float _210 = dp3_f32(_200, cb1._m8);
    vec3 _211 = vec3(_204, _207, _210);
    precise float _213 = inversesqrt(dp3_f32(_211, _211));
    precise float _214 = _213 * _204;
    precise float _215 = _213 * _207;
    precise float _216 = _213 * _210;
    TEXCOORD.x = _214;
    TEXCOORD.y = _215;
    TEXCOORD.z = _216;
    TEXCOORD1.x = _145;
    TEXCOORD1.y = _146;
    TEXCOORD1.z = _147;
    precise float _223 = _215 * _215;
    precise float _225 = fma(_214, _214, -_223);
    precise float _226 = _215 * _214;
    precise float _227 = _216 * _215;
    precise float _228 = _216 * _216;
    precise float _229 = _214 * _216;
    vec4 _233 = vec4(_226, _227, _228, _229);
    vec4 _251 = vec4(_214, _215, _216, 1.0);
    precise float _259 = fma(cb0._m49.x, _225, dp4_f32(cb0._m46, _233)) + dp4_f32(cb0._m43, _251);
    precise float _260 = fma(cb0._m49.y, _225, dp4_f32(cb0._m47, _233)) + dp4_f32(cb0._m44, _251);
    precise float _261 = fma(cb0._m49.z, _225, dp4_f32(cb0._m48, _233)) + dp4_f32(cb0._m45, _251);
    precise float _268 = cb0._m4.x - _146;
    precise float _269 = cb0._m4.y - _146;
    precise float _270 = cb0._m4.z - _146;
    precise float _271 = cb0._m4.w - _146;
    precise float _272 = _215 * _268;
    precise float _273 = _215 * _269;
    precise float _274 = _215 * _270;
    precise float _275 = _215 * _271;
    precise float _276 = _268 * _268;
    precise float _277 = _269 * _269;
    precise float _278 = _270 * _270;
    precise float _279 = _271 * _271;
    precise float _286 = cb0._m3.x - _145;
    precise float _287 = cb0._m3.y - _145;
    precise float _288 = cb0._m3.z - _145;
    precise float _289 = cb0._m3.w - _145;
    precise float _296 = cb0._m5.x - _147;
    precise float _297 = cb0._m5.y - _147;
    precise float _298 = cb0._m5.z - _147;
    precise float _299 = cb0._m5.w - _147;
    precise float _316 = spvNMax(fma(_296, _296, fma(_286, _286, _276)), 9.9999999747524270787835121154785e-07);
    precise float _317 = spvNMax(fma(_297, _297, fma(_287, _287, _277)), 9.9999999747524270787835121154785e-07);
    precise float _318 = spvNMax(fma(_298, _298, fma(_288, _288, _278)), 9.9999999747524270787835121154785e-07);
    precise float _319 = spvNMax(fma(_299, _299, fma(_289, _289, _279)), 9.9999999747524270787835121154785e-07);
    precise float _334 = 1.0 / fma(_316, cb0._m6.x, 1.0);
    precise float _335 = 1.0 / fma(_317, cb0._m6.y, 1.0);
    precise float _336 = 1.0 / fma(_318, cb0._m6.z, 1.0);
    precise float _337 = 1.0 / fma(_319, cb0._m6.w, 1.0);
    precise float _338 = fma(_296, _216, fma(_286, _214, _272)) * inversesqrt(_316);
    precise float _339 = fma(_297, _216, fma(_287, _214, _273)) * inversesqrt(_317);
    precise float _340 = fma(_298, _216, fma(_288, _214, _274)) * inversesqrt(_318);
    precise float _341 = fma(_299, _216, fma(_289, _214, _275)) * inversesqrt(_319);
    precise float _346 = _334 * spvNMax(_338, 0.0);
    precise float _347 = _335 * spvNMax(_339, 0.0);
    precise float _348 = _336 * spvNMax(_340, 0.0);
    precise float _349 = _337 * spvNMax(_341, 0.0);
    precise float _355 = _347 * cb0._m9.x;
    precise float _356 = _347 * cb0._m9.y;
    precise float _357 = _347 * cb0._m9.z;
    precise float _382 = fma(cb0._m13.x, _349, fma(cb0._m11.x, _348, fma(cb0._m7.x, _346, _355))) + _259;
    precise float _383 = fma(cb0._m13.y, _349, fma(cb0._m11.y, _348, fma(cb0._m7.y, _346, _356))) + _260;
    precise float _384 = fma(cb0._m13.z, _349, fma(cb0._m11.z, _348, fma(cb0._m7.z, _346, _357))) + _261;
    TEXCOORD2.x = _382;
    TEXCOORD2.y = _383;
    TEXCOORD2.z = _384;
    TEXCOORD5.x = 0.0;
    TEXCOORD5.y = 0.0;
    TEXCOORD5.z = 0.0;
    TEXCOORD5.w = 0.0;
}

