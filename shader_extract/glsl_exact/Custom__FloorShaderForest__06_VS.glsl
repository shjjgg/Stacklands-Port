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
    vec4 _m5;
} cb0;

layout(set = 0, binding = 1, std140) uniform cb1_buf
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
layout(location = 1, component = 0) out vec3 TEXCOORD;
layout(location = 2, component = 0) out vec3 TEXCOORD1;
layout(location = 3, component = 0) out vec3 TEXCOORD2;
layout(location = 4, component = 0) out vec4 TEXCOORD4;
layout(location = 5, component = 0) out vec4 TEXCOORD5;

spirv_instruction(set = "GLSL.std.450", id = 80) float spvNMax(float, float);
spirv_instruction(set = "GLSL.std.450", id = 80) vec2 spvNMax(vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 80) vec3 spvNMax(vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 80) vec4 spvNMax(vec4, vec4);

float dp3_f32(vec3 a, vec3 b)
{
    precise float _61 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _61));
}

void main()
{
    precise float _83 = POSITION.y * cb2._m1.x;
    precise float _84 = POSITION.y * cb2._m1.y;
    precise float _85 = POSITION.y * cb2._m1.z;
    precise float _86 = POSITION.y * cb2._m1.w;
    precise float _95 = fma(cb2._m0.x, POSITION.x, _83);
    precise float _96 = fma(cb2._m0.y, POSITION.x, _84);
    precise float _97 = fma(cb2._m0.z, POSITION.x, _85);
    precise float _98 = fma(cb2._m0.w, POSITION.x, _86);
    precise float _107 = fma(cb2._m2.x, POSITION.z, _95);
    precise float _108 = fma(cb2._m2.y, POSITION.z, _96);
    precise float _109 = fma(cb2._m2.z, POSITION.z, _97);
    precise float _110 = fma(cb2._m2.w, POSITION.z, _98);
    precise float _117 = _107 + cb2._m3.x;
    precise float _118 = _108 + cb2._m3.y;
    precise float _119 = _109 + cb2._m3.z;
    precise float _120 = _110 + cb2._m3.w;
    precise float _128 = fma(cb2._m3.x, POSITION.w, _107);
    precise float _129 = fma(cb2._m3.y, POSITION.w, _108);
    precise float _130 = fma(cb2._m3.z, POSITION.w, _109);
    precise float _138 = _118 * cb3._m18.x;
    precise float _139 = _118 * cb3._m18.y;
    precise float _140 = _118 * cb3._m18.z;
    precise float _141 = _118 * cb3._m18.w;
    precise float _148 = fma(cb3._m17.x, _117, _138);
    precise float _149 = fma(cb3._m17.y, _117, _139);
    precise float _150 = fma(cb3._m17.z, _117, _140);
    precise float _151 = fma(cb3._m17.w, _117, _141);
    precise float _158 = fma(cb3._m19.x, _119, _148);
    precise float _159 = fma(cb3._m19.y, _119, _149);
    precise float _160 = fma(cb3._m19.z, _119, _150);
    precise float _161 = fma(cb3._m19.w, _119, _151);
    precise float _168 = fma(cb3._m20.x, _120, _158);
    precise float _169 = fma(cb3._m20.y, _120, _159);
    precise float _170 = fma(cb3._m20.z, _120, _160);
    precise float _171 = fma(cb3._m20.w, _120, _161);
    gl_Position.x = _168;
    gl_Position.y = _169;
    gl_Position.z = _170;
    gl_Position.w = _171;
    vec3 _183 = vec3(NORMAL.x, NORMAL.y, NORMAL.z);
    float _187 = dp3_f32(_183, cb2._m4);
    float _190 = dp3_f32(_183, cb2._m6);
    float _193 = dp3_f32(_183, cb2._m8);
    vec3 _194 = vec3(_187, _190, _193);
    precise float _196 = inversesqrt(dp3_f32(_194, _194));
    precise float _197 = _196 * _187;
    precise float _198 = _196 * _190;
    precise float _199 = _196 * _193;
    TEXCOORD.x = _197;
    TEXCOORD.y = _198;
    TEXCOORD.z = _199;
    TEXCOORD1.x = _128;
    TEXCOORD1.y = _129;
    TEXCOORD1.z = _130;
    precise float _213 = cb1._m4.x - _129;
    precise float _214 = cb1._m4.y - _129;
    precise float _215 = cb1._m4.z - _129;
    precise float _216 = cb1._m4.w - _129;
    precise float _217 = _198 * _213;
    precise float _218 = _198 * _214;
    precise float _219 = _198 * _215;
    precise float _220 = _198 * _216;
    precise float _221 = _213 * _213;
    precise float _222 = _214 * _214;
    precise float _223 = _215 * _215;
    precise float _224 = _216 * _216;
    precise float _231 = cb1._m3.x - _128;
    precise float _232 = cb1._m3.y - _128;
    precise float _233 = cb1._m3.z - _128;
    precise float _234 = cb1._m3.w - _128;
    precise float _241 = cb1._m5.x - _130;
    precise float _242 = cb1._m5.y - _130;
    precise float _243 = cb1._m5.z - _130;
    precise float _244 = cb1._m5.w - _130;
    precise float _261 = spvNMax(fma(_241, _241, fma(_231, _231, _221)), 9.9999999747524270787835121154785e-07);
    precise float _262 = spvNMax(fma(_242, _242, fma(_232, _232, _222)), 9.9999999747524270787835121154785e-07);
    precise float _263 = spvNMax(fma(_243, _243, fma(_233, _233, _223)), 9.9999999747524270787835121154785e-07);
    precise float _264 = spvNMax(fma(_244, _244, fma(_234, _234, _224)), 9.9999999747524270787835121154785e-07);
    precise float _279 = 1.0 / fma(_261, cb1._m6.x, 1.0);
    precise float _280 = 1.0 / fma(_262, cb1._m6.y, 1.0);
    precise float _281 = 1.0 / fma(_263, cb1._m6.z, 1.0);
    precise float _282 = 1.0 / fma(_264, cb1._m6.w, 1.0);
    precise float _283 = fma(_241, _199, fma(_231, _197, _217)) * inversesqrt(_261);
    precise float _284 = fma(_242, _199, fma(_232, _197, _218)) * inversesqrt(_262);
    precise float _285 = fma(_243, _199, fma(_233, _197, _219)) * inversesqrt(_263);
    precise float _286 = fma(_244, _199, fma(_234, _197, _220)) * inversesqrt(_264);
    precise float _291 = _279 * spvNMax(_283, 0.0);
    precise float _292 = _280 * spvNMax(_284, 0.0);
    precise float _293 = _281 * spvNMax(_285, 0.0);
    precise float _294 = _282 * spvNMax(_286, 0.0);
    precise float _300 = _292 * cb1._m9.x;
    precise float _301 = _292 * cb1._m9.y;
    precise float _302 = _292 * cb1._m9.z;
    TEXCOORD2.x = fma(cb1._m13.x, _294, fma(cb1._m11.x, _293, fma(cb1._m7.x, _291, _300)));
    TEXCOORD2.y = fma(cb1._m13.y, _294, fma(cb1._m11.y, _293, fma(cb1._m7.y, _291, _301)));
    TEXCOORD2.z = fma(cb1._m13.z, _294, fma(cb1._m11.z, _293, fma(cb1._m7.z, _291, _302)));
    precise float _334 = _169 * cb0._m5.x;
    precise float _335 = _334 * 0.5;
    precise float _336 = _168 * 0.5;
    precise float _337 = _171 * 0.5;
    TEXCOORD4.z = _170;
    TEXCOORD4.w = _171;
    precise float _340 = _337 + _336;
    precise float _341 = _337 + _335;
    TEXCOORD4.x = _340;
    TEXCOORD4.y = _341;
    TEXCOORD5.x = 0.0;
    TEXCOORD5.y = 0.0;
    TEXCOORD5.z = 0.0;
    TEXCOORD5.w = 0.0;
}

