#version 450
#extension GL_EXT_buffer_reference2 : require
#extension GL_EXT_spirv_intrinsics : require

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
    vec2 _m13;
    vec2 _m14;
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
    uvec4 _m43;
    uvec4 _m44;
    uvec4 _m45;
    vec4 _m46;
    vec4 _m47;
    vec4 _m48;
    vec3 _m49;
    uint _m50;
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

spirv_instruction(set = "GLSL.std.450", id = 80) float spvNMax(float, float);
spirv_instruction(set = "GLSL.std.450", id = 80) vec2 spvNMax(vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 80) vec3 spvNMax(vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 80) vec4 spvNMax(vec4, vec4);

float dp3_f32(vec3 a, vec3 b)
{
    precise float _92 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _92));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _74 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _74)));
}

void main()
{
    precise float _113 = POSITION.y * cb3._m1.x;
    precise float _114 = POSITION.y * cb3._m1.y;
    precise float _115 = POSITION.y * cb3._m1.z;
    precise float _116 = POSITION.y * cb3._m1.w;
    precise float _125 = fma(cb3._m0.x, POSITION.x, _113);
    precise float _126 = fma(cb3._m0.y, POSITION.x, _114);
    precise float _127 = fma(cb3._m0.z, POSITION.x, _115);
    precise float _128 = fma(cb3._m0.w, POSITION.x, _116);
    precise float _137 = fma(cb3._m2.x, POSITION.z, _125);
    precise float _138 = fma(cb3._m2.y, POSITION.z, _126);
    precise float _139 = fma(cb3._m2.z, POSITION.z, _127);
    precise float _140 = fma(cb3._m2.w, POSITION.z, _128);
    precise float _147 = _137 + cb3._m3.x;
    precise float _148 = _138 + cb3._m3.y;
    precise float _149 = _139 + cb3._m3.z;
    precise float _150 = _140 + cb3._m3.w;
    precise float _158 = fma(cb3._m3.x, POSITION.w, _137);
    precise float _159 = fma(cb3._m3.y, POSITION.w, _138);
    precise float _160 = fma(cb3._m3.z, POSITION.w, _139);
    precise float _168 = _148 * cb4._m18.x;
    precise float _169 = _148 * cb4._m18.y;
    precise float _170 = _148 * cb4._m18.z;
    precise float _171 = _148 * cb4._m18.w;
    precise float _178 = fma(cb4._m17.x, _147, _168);
    precise float _179 = fma(cb4._m17.y, _147, _169);
    precise float _180 = fma(cb4._m17.z, _147, _170);
    precise float _181 = fma(cb4._m17.w, _147, _171);
    precise float _188 = fma(cb4._m19.x, _149, _178);
    precise float _189 = fma(cb4._m19.y, _149, _179);
    precise float _190 = fma(cb4._m19.z, _149, _180);
    precise float _191 = fma(cb4._m19.w, _149, _181);
    precise float _198 = fma(cb4._m20.x, _150, _188);
    precise float _199 = fma(cb4._m20.y, _150, _189);
    precise float _200 = fma(cb4._m20.z, _150, _190);
    precise float _201 = fma(cb4._m20.w, _150, _191);
    gl_Position.x = _198;
    gl_Position.y = _199;
    gl_Position.z = _200;
    gl_Position.w = _201;
    TEXCOORD_1.x = fma(TEXCOORD.x, cb0._m13.x, cb0._m14.x);
    TEXCOORD_1.y = fma(TEXCOORD.y, cb0._m13.y, cb0._m14.y);
    vec3 _231 = vec3(NORMAL.x, NORMAL.y, NORMAL.z);
    float _235 = dp3_f32(_231, cb3._m4);
    float _238 = dp3_f32(_231, cb3._m6);
    float _241 = dp3_f32(_231, cb3._m8);
    vec3 _242 = vec3(_235, _238, _241);
    precise float _244 = inversesqrt(dp3_f32(_242, _242));
    precise float _245 = _244 * _235;
    precise float _246 = _244 * _238;
    precise float _247 = _244 * _241;
    TEXCOORD1.x = _245;
    TEXCOORD1.y = _246;
    TEXCOORD1.z = _247;
    TEXCOORD2.x = _158;
    TEXCOORD2.y = _159;
    TEXCOORD2.z = _160;
    precise float _261 = cb2._m3.x - _158;
    precise float _262 = cb2._m3.y - _158;
    precise float _263 = cb2._m3.z - _158;
    precise float _264 = cb2._m3.w - _158;
    precise float _271 = cb2._m4.x - _159;
    precise float _272 = cb2._m4.y - _159;
    precise float _273 = cb2._m4.z - _159;
    precise float _274 = cb2._m4.w - _159;
    precise float _281 = cb2._m5.x - _160;
    precise float _282 = cb2._m5.y - _160;
    precise float _283 = cb2._m5.z - _160;
    precise float _284 = cb2._m5.w - _160;
    precise float _285 = _246 * _271;
    precise float _286 = _246 * _272;
    precise float _287 = _246 * _273;
    precise float _288 = _246 * _274;
    precise float _289 = _271 * _271;
    precise float _290 = _272 * _272;
    precise float _291 = _273 * _273;
    precise float _292 = _274 * _274;
    precise float _309 = spvNMax(fma(_281, _281, fma(_261, _261, _289)), 9.9999999747524270787835121154785e-07);
    precise float _310 = spvNMax(fma(_282, _282, fma(_262, _262, _290)), 9.9999999747524270787835121154785e-07);
    precise float _311 = spvNMax(fma(_283, _283, fma(_263, _263, _291)), 9.9999999747524270787835121154785e-07);
    precise float _312 = spvNMax(fma(_284, _284, fma(_264, _264, _292)), 9.9999999747524270787835121154785e-07);
    precise float _327 = 1.0 / fma(_309, cb2._m6.x, 1.0);
    precise float _328 = 1.0 / fma(_310, cb2._m6.y, 1.0);
    precise float _329 = 1.0 / fma(_311, cb2._m6.z, 1.0);
    precise float _330 = 1.0 / fma(_312, cb2._m6.w, 1.0);
    precise float _331 = fma(_281, _247, fma(_261, _245, _285)) * inversesqrt(_309);
    precise float _332 = fma(_282, _247, fma(_262, _245, _286)) * inversesqrt(_310);
    precise float _333 = fma(_283, _247, fma(_263, _245, _287)) * inversesqrt(_311);
    precise float _334 = fma(_284, _247, fma(_264, _245, _288)) * inversesqrt(_312);
    precise float _339 = _327 * spvNMax(_331, 0.0);
    precise float _340 = _328 * spvNMax(_332, 0.0);
    precise float _341 = _329 * spvNMax(_333, 0.0);
    precise float _342 = _330 * spvNMax(_334, 0.0);
    precise float _348 = _340 * cb2._m9.x;
    precise float _349 = _340 * cb2._m9.y;
    precise float _350 = _340 * cb2._m9.z;
    precise float _375 = _246 * _246;
    precise float _377 = fma(_245, _245, -_375);
    precise float _378 = _246 * _245;
    precise float _379 = _247 * _246;
    precise float _380 = _247 * _247;
    precise float _381 = _245 * _247;
    vec4 _384 = vec4(_378, _379, _380, _381);
    precise float _400 = fma(cb2._m13.x, _342, fma(cb2._m11.x, _341, fma(cb2._m7.x, _339, _348))) + fma(cb2._m49.x, _377, dp4_f32(cb2._m46, _384));
    precise float _401 = fma(cb2._m13.y, _342, fma(cb2._m11.y, _341, fma(cb2._m7.y, _339, _349))) + fma(cb2._m49.y, _377, dp4_f32(cb2._m47, _384));
    precise float _402 = fma(cb2._m13.z, _342, fma(cb2._m11.z, _341, fma(cb2._m7.z, _339, _350))) + fma(cb2._m49.z, _377, dp4_f32(cb2._m48, _384));
    TEXCOORD3.x = _400;
    TEXCOORD3.y = _401;
    TEXCOORD3.z = _402;
    precise float _410 = _199 * cb1._m5.x;
    precise float _411 = _410 * 0.5;
    precise float _412 = _198 * 0.5;
    precise float _413 = _201 * 0.5;
    TEXCOORD5.z = _200;
    TEXCOORD5.w = _201;
    precise float _416 = _413 + _412;
    precise float _417 = _413 + _411;
    TEXCOORD5.x = _416;
    TEXCOORD5.y = _417;
    TEXCOORD6.x = 0.0;
    TEXCOORD6.y = 0.0;
    TEXCOORD6.z = 0.0;
    TEXCOORD6.w = 0.0;
}

