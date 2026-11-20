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
    vec3 _m0;
    float _m1;
} cb1;

layout(set = 0, binding = 2, std140) uniform cb2_buf
{
    uvec4 _m0;
    uvec4 _m1;
    uvec4 _m2;
    uvec4 _m3;
    uvec4 _m4;
    vec4 _m5;
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
layout(location = 1, component = 0) out vec2 TEXCOORD1;
layout(location = 2, component = 0) out vec3 TEXCOORD2;

spirv_instruction(set = "GLSL.std.450", id = 79) float spvNMin(float, float);
spirv_instruction(set = "GLSL.std.450", id = 79) vec2 spvNMin(vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 79) vec3 spvNMin(vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 79) vec4 spvNMin(vec4, vec4);
spirv_instruction(set = "GLSL.std.450", id = 80) float spvNMax(float, float);
spirv_instruction(set = "GLSL.std.450", id = 80) vec2 spvNMax(vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 80) vec3 spvNMax(vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 80) vec4 spvNMax(vec4, vec4);

float dp3_f32(vec3 a, vec3 b)
{
    precise float _64 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _64));
}

void main()
{
    vec3 _82 = vec3(NORMAL.x, NORMAL.y, NORMAL.z);
    float _87 = dp3_f32(_82, cb3._m4);
    float _90 = dp3_f32(_82, cb3._m6);
    float _93 = dp3_f32(_82, cb3._m8);
    vec3 _94 = vec3(_87, _90, _93);
    float _95 = dp3_f32(_94, _94);
    precise float _96 = inversesqrt(_95);
    precise float _97 = _96 * _87;
    precise float _98 = _96 * _90;
    precise float _99 = _96 * _93;
    precise float _109 = POSITION.y * cb3._m1.x;
    precise float _110 = POSITION.y * cb3._m1.y;
    precise float _111 = POSITION.y * cb3._m1.z;
    precise float _112 = POSITION.y * cb3._m1.w;
    precise float _121 = fma(cb3._m0.x, POSITION.x, _109);
    precise float _122 = fma(cb3._m0.y, POSITION.x, _110);
    precise float _123 = fma(cb3._m0.z, POSITION.x, _111);
    precise float _124 = fma(cb3._m0.w, POSITION.x, _112);
    precise float _133 = fma(cb3._m2.x, POSITION.z, _121);
    precise float _134 = fma(cb3._m2.y, POSITION.z, _122);
    precise float _135 = fma(cb3._m2.z, POSITION.z, _123);
    precise float _136 = fma(cb3._m2.w, POSITION.z, _124);
    precise float _145 = fma(cb3._m3.x, POSITION.w, _133);
    precise float _146 = fma(cb3._m3.y, POSITION.w, _134);
    precise float _147 = fma(cb3._m3.z, POSITION.w, _135);
    precise float _148 = fma(cb3._m3.w, POSITION.w, _136);
    precise float _161 = fma(-_145, cb1._m1, cb1._m0.x);
    precise float _162 = fma(-_146, cb1._m1, cb1._m0.y);
    precise float _163 = fma(-_147, cb1._m1, cb1._m0.z);
    vec3 _164 = vec3(_161, _162, _163);
    precise float _166 = inversesqrt(dp3_f32(_164, _164));
    precise float _167 = _166 * _161;
    precise float _168 = _166 * _162;
    precise float _169 = _166 * _163;
    float _172 = dp3_f32(vec3(_97, _98, _99), vec3(_167, _168, _169));
    precise float _173 = -_172;
    precise float _174 = fma(_173, _172, 1.0);
    precise float _175 = sqrt(_174);
    precise float _179 = _175 * cb2._m5.z;
    precise float _180 = -_97;
    precise float _181 = -_98;
    precise float _182 = -_99;
    precise float _183 = fma(_180, _179, _145);
    precise float _184 = fma(_181, _179, _146);
    precise float _185 = fma(_182, _179, _147);
    bool _186 = cb2._m5.z == 0.0;
    float _188 = _186 ? _145 : _183;
    float _189 = _186 ? _146 : _184;
    float _190 = _186 ? _147 : _185;
    precise float _198 = _189 * cb4._m18.x;
    precise float _199 = _189 * cb4._m18.y;
    precise float _200 = _189 * cb4._m18.z;
    precise float _201 = _189 * cb4._m18.w;
    precise float _208 = fma(cb4._m17.x, _188, _198);
    precise float _209 = fma(cb4._m17.y, _188, _199);
    precise float _210 = fma(cb4._m17.z, _188, _200);
    precise float _211 = fma(cb4._m17.w, _188, _201);
    precise float _218 = fma(cb4._m19.x, _190, _208);
    precise float _219 = fma(cb4._m19.y, _190, _209);
    precise float _220 = fma(cb4._m19.z, _190, _210);
    precise float _221 = fma(cb4._m19.w, _190, _211);
    precise float _228 = fma(cb4._m20.x, _148, _218);
    precise float _229 = fma(cb4._m20.y, _148, _219);
    precise float _230 = fma(cb4._m20.z, _148, _220);
    precise float _231 = fma(cb4._m20.w, _148, _221);
    precise float _234 = cb2._m5.x / _231;
    precise float _235 = spvNMin(_234, 0.0);
    precise float _236 = spvNMax(_235, -1.0);
    precise float _237 = _230 + _236;
    precise float _238 = spvNMin(_231, _237);
    gl_Position.x = _228;
    gl_Position.y = _229;
    gl_Position.w = _231;
    precise float _243 = _238 - _237;
    precise float _246 = fma(cb2._m5.y, _243, _237);
    gl_Position.z = _246;
    TEXCOORD1.x = fma(TEXCOORD.x, cb0._m13.x, cb0._m14.x);
    TEXCOORD1.y = fma(TEXCOORD.y, cb0._m13.y, cb0._m14.y);
    precise float _273 = POSITION.y * cb3._m1.x;
    precise float _274 = POSITION.y * cb3._m1.y;
    precise float _275 = POSITION.y * cb3._m1.z;
    TEXCOORD2.x = fma(cb3._m3.x, POSITION.w, fma(cb3._m2.x, POSITION.z, fma(cb3._m0.x, POSITION.x, _273)));
    TEXCOORD2.y = fma(cb3._m3.y, POSITION.w, fma(cb3._m2.y, POSITION.z, fma(cb3._m0.y, POSITION.x, _274)));
    TEXCOORD2.z = fma(cb3._m3.z, POSITION.w, fma(cb3._m2.z, POSITION.z, fma(cb3._m0.z, POSITION.x, _275)));
}

