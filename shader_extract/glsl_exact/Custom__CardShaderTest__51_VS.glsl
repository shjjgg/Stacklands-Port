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

float dp3_f32(vec3 a, vec3 b)
{
    precise float _62 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _62));
}

void main()
{
    vec3 _80 = vec3(NORMAL.x, NORMAL.y, NORMAL.z);
    float _85 = dp3_f32(_80, cb3._m4);
    float _88 = dp3_f32(_80, cb3._m6);
    float _91 = dp3_f32(_80, cb3._m8);
    vec3 _92 = vec3(_85, _88, _91);
    float _93 = dp3_f32(_92, _92);
    precise float _94 = inversesqrt(_93);
    precise float _95 = _94 * _85;
    precise float _96 = _94 * _88;
    precise float _97 = _94 * _91;
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
    precise float _143 = fma(cb3._m3.x, POSITION.w, _131);
    precise float _144 = fma(cb3._m3.y, POSITION.w, _132);
    precise float _145 = fma(cb3._m3.z, POSITION.w, _133);
    precise float _146 = fma(cb3._m3.w, POSITION.w, _134);
    precise float _159 = fma(-_143, cb1._m1, cb1._m0.x);
    precise float _160 = fma(-_144, cb1._m1, cb1._m0.y);
    precise float _161 = fma(-_145, cb1._m1, cb1._m0.z);
    vec3 _162 = vec3(_159, _160, _161);
    precise float _164 = inversesqrt(dp3_f32(_162, _162));
    precise float _165 = _164 * _159;
    precise float _166 = _164 * _160;
    precise float _167 = _164 * _161;
    float _170 = dp3_f32(vec3(_95, _96, _97), vec3(_165, _166, _167));
    precise float _171 = -_170;
    precise float _172 = fma(_171, _170, 1.0);
    precise float _173 = sqrt(_172);
    precise float _177 = _173 * cb2._m5.z;
    precise float _178 = -_95;
    precise float _179 = -_96;
    precise float _180 = -_97;
    precise float _181 = fma(_178, _177, _143);
    precise float _182 = fma(_179, _177, _144);
    precise float _183 = fma(_180, _177, _145);
    bool _184 = cb2._m5.z == 0.0;
    float _186 = _184 ? _143 : _181;
    float _187 = _184 ? _144 : _182;
    float _188 = _184 ? _145 : _183;
    precise float _196 = _187 * cb4._m18.x;
    precise float _197 = _187 * cb4._m18.y;
    precise float _198 = _187 * cb4._m18.z;
    precise float _199 = _187 * cb4._m18.w;
    precise float _206 = fma(cb4._m17.x, _186, _196);
    precise float _207 = fma(cb4._m17.y, _186, _197);
    precise float _208 = fma(cb4._m17.z, _186, _198);
    precise float _209 = fma(cb4._m17.w, _186, _199);
    precise float _216 = fma(cb4._m19.x, _188, _206);
    precise float _217 = fma(cb4._m19.y, _188, _207);
    precise float _218 = fma(cb4._m19.z, _188, _208);
    precise float _219 = fma(cb4._m19.w, _188, _209);
    precise float _226 = fma(cb4._m20.x, _146, _216);
    precise float _227 = fma(cb4._m20.y, _146, _217);
    precise float _228 = fma(cb4._m20.z, _146, _218);
    precise float _229 = fma(cb4._m20.w, _146, _219);
    precise float _230 = spvNMin(_229, _228);
    precise float _231 = _230 - _228;
    precise float _234 = fma(cb2._m5.y, _231, _228);
    gl_Position.z = _234;
    gl_Position.x = _226;
    gl_Position.y = _227;
    gl_Position.w = _229;
    TEXCOORD1.x = fma(TEXCOORD.x, cb0._m13.x, cb0._m14.x);
    TEXCOORD1.y = fma(TEXCOORD.y, cb0._m13.y, cb0._m14.y);
    precise float _265 = POSITION.y * cb3._m1.x;
    precise float _266 = POSITION.y * cb3._m1.y;
    precise float _267 = POSITION.y * cb3._m1.z;
    TEXCOORD2.x = fma(cb3._m3.x, POSITION.w, fma(cb3._m2.x, POSITION.z, fma(cb3._m0.x, POSITION.x, _265)));
    TEXCOORD2.y = fma(cb3._m3.y, POSITION.w, fma(cb3._m2.y, POSITION.z, fma(cb3._m0.y, POSITION.x, _266)));
    TEXCOORD2.z = fma(cb3._m3.z, POSITION.w, fma(cb3._m2.z, POSITION.z, fma(cb3._m0.z, POSITION.x, _267)));
}

