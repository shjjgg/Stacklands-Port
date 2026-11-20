#version 450
#extension GL_EXT_buffer_reference2 : require
#extension GL_EXT_spirv_intrinsics : require

invariant gl_Position;

layout(set = 0, binding = 0, std140) uniform cb0_buf
{
    vec3 _m0;
    float _m1;
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
} cb2;

layout(set = 0, binding = 3, std140) uniform cb3_buf
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
} cb3;

layout(location = 0, component = 0) in vec4 POSITION;
layout(location = 2, component = 0) in vec3 NORMAL;
layout(location = 1, component = 0) out vec3 TEXCOORD1;

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
    precise float _54 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _54));
}

void main()
{
    vec3 _72 = vec3(NORMAL.x, NORMAL.y, NORMAL.z);
    float _77 = dp3_f32(_72, cb2._m4);
    float _80 = dp3_f32(_72, cb2._m6);
    float _83 = dp3_f32(_72, cb2._m8);
    vec3 _84 = vec3(_77, _80, _83);
    float _85 = dp3_f32(_84, _84);
    precise float _86 = inversesqrt(_85);
    precise float _87 = _86 * _77;
    precise float _88 = _86 * _80;
    precise float _89 = _86 * _83;
    precise float _99 = POSITION.y * cb2._m1.x;
    precise float _100 = POSITION.y * cb2._m1.y;
    precise float _101 = POSITION.y * cb2._m1.z;
    precise float _102 = POSITION.y * cb2._m1.w;
    precise float _111 = fma(cb2._m0.x, POSITION.x, _99);
    precise float _112 = fma(cb2._m0.y, POSITION.x, _100);
    precise float _113 = fma(cb2._m0.z, POSITION.x, _101);
    precise float _114 = fma(cb2._m0.w, POSITION.x, _102);
    precise float _123 = fma(cb2._m2.x, POSITION.z, _111);
    precise float _124 = fma(cb2._m2.y, POSITION.z, _112);
    precise float _125 = fma(cb2._m2.z, POSITION.z, _113);
    precise float _126 = fma(cb2._m2.w, POSITION.z, _114);
    precise float _135 = fma(cb2._m3.x, POSITION.w, _123);
    precise float _136 = fma(cb2._m3.y, POSITION.w, _124);
    precise float _137 = fma(cb2._m3.z, POSITION.w, _125);
    precise float _138 = fma(cb2._m3.w, POSITION.w, _126);
    precise float _151 = fma(-_135, cb0._m1, cb0._m0.x);
    precise float _152 = fma(-_136, cb0._m1, cb0._m0.y);
    precise float _153 = fma(-_137, cb0._m1, cb0._m0.z);
    vec3 _154 = vec3(_151, _152, _153);
    precise float _156 = inversesqrt(dp3_f32(_154, _154));
    precise float _157 = _156 * _151;
    precise float _158 = _156 * _152;
    precise float _159 = _156 * _153;
    float _162 = dp3_f32(vec3(_87, _88, _89), vec3(_157, _158, _159));
    precise float _163 = -_162;
    precise float _164 = fma(_163, _162, 1.0);
    precise float _165 = sqrt(_164);
    precise float _169 = _165 * cb1._m5.z;
    precise float _170 = -_87;
    precise float _171 = -_88;
    precise float _172 = -_89;
    precise float _173 = fma(_170, _169, _135);
    precise float _174 = fma(_171, _169, _136);
    precise float _175 = fma(_172, _169, _137);
    bool _176 = cb1._m5.z == 0.0;
    float _178 = _176 ? _135 : _173;
    float _179 = _176 ? _136 : _174;
    float _180 = _176 ? _137 : _175;
    precise float _188 = _179 * cb3._m18.x;
    precise float _189 = _179 * cb3._m18.y;
    precise float _190 = _179 * cb3._m18.z;
    precise float _191 = _179 * cb3._m18.w;
    precise float _198 = fma(cb3._m17.x, _178, _188);
    precise float _199 = fma(cb3._m17.y, _178, _189);
    precise float _200 = fma(cb3._m17.z, _178, _190);
    precise float _201 = fma(cb3._m17.w, _178, _191);
    precise float _208 = fma(cb3._m19.x, _180, _198);
    precise float _209 = fma(cb3._m19.y, _180, _199);
    precise float _210 = fma(cb3._m19.z, _180, _200);
    precise float _211 = fma(cb3._m19.w, _180, _201);
    precise float _218 = fma(cb3._m20.x, _138, _208);
    precise float _219 = fma(cb3._m20.y, _138, _209);
    precise float _220 = fma(cb3._m20.z, _138, _210);
    precise float _221 = fma(cb3._m20.w, _138, _211);
    precise float _224 = cb1._m5.x / _221;
    precise float _225 = spvNMin(_224, 0.0);
    precise float _226 = spvNMax(_225, -1.0);
    precise float _227 = _220 + _226;
    precise float _228 = spvNMin(_221, _227);
    gl_Position.x = _218;
    gl_Position.y = _219;
    gl_Position.w = _221;
    precise float _233 = _228 - _227;
    precise float _236 = fma(cb1._m5.y, _233, _227);
    gl_Position.z = _236;
    precise float _245 = POSITION.y * cb2._m1.x;
    precise float _246 = POSITION.y * cb2._m1.y;
    precise float _247 = POSITION.y * cb2._m1.z;
    TEXCOORD1.x = fma(cb2._m3.x, POSITION.w, fma(cb2._m2.x, POSITION.z, fma(cb2._m0.x, POSITION.x, _245)));
    TEXCOORD1.y = fma(cb2._m3.y, POSITION.w, fma(cb2._m2.y, POSITION.z, fma(cb2._m0.y, POSITION.x, _246)));
    TEXCOORD1.z = fma(cb2._m3.z, POSITION.w, fma(cb2._m2.z, POSITION.z, fma(cb2._m0.z, POSITION.x, _247)));
}

