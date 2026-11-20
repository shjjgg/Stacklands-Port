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

spirv_instruction(set = "GLSL.std.450", id = 80) float spvNMax(float, float);
spirv_instruction(set = "GLSL.std.450", id = 80) vec2 spvNMax(vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 80) vec3 spvNMax(vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 80) vec4 spvNMax(vec4, vec4);

float dp3_f32(vec3 a, vec3 b)
{
    precise float _55 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _55));
}

void main()
{
    precise float _77 = POSITION.y * cb1._m1.x;
    precise float _78 = POSITION.y * cb1._m1.y;
    precise float _79 = POSITION.y * cb1._m1.z;
    precise float _80 = POSITION.y * cb1._m1.w;
    precise float _89 = fma(cb1._m0.x, POSITION.x, _77);
    precise float _90 = fma(cb1._m0.y, POSITION.x, _78);
    precise float _91 = fma(cb1._m0.z, POSITION.x, _79);
    precise float _92 = fma(cb1._m0.w, POSITION.x, _80);
    precise float _101 = fma(cb1._m2.x, POSITION.z, _89);
    precise float _102 = fma(cb1._m2.y, POSITION.z, _90);
    precise float _103 = fma(cb1._m2.z, POSITION.z, _91);
    precise float _104 = fma(cb1._m2.w, POSITION.z, _92);
    precise float _111 = _101 + cb1._m3.x;
    precise float _112 = _102 + cb1._m3.y;
    precise float _113 = _103 + cb1._m3.z;
    precise float _114 = _104 + cb1._m3.w;
    precise float _122 = fma(cb1._m3.x, POSITION.w, _101);
    precise float _123 = fma(cb1._m3.y, POSITION.w, _102);
    precise float _124 = fma(cb1._m3.z, POSITION.w, _103);
    precise float _132 = _112 * cb2._m18.x;
    precise float _133 = _112 * cb2._m18.y;
    precise float _134 = _112 * cb2._m18.z;
    precise float _135 = _112 * cb2._m18.w;
    precise float _142 = fma(cb2._m17.x, _111, _132);
    precise float _143 = fma(cb2._m17.y, _111, _133);
    precise float _144 = fma(cb2._m17.z, _111, _134);
    precise float _145 = fma(cb2._m17.w, _111, _135);
    precise float _152 = fma(cb2._m19.x, _113, _142);
    precise float _153 = fma(cb2._m19.y, _113, _143);
    precise float _154 = fma(cb2._m19.z, _113, _144);
    precise float _155 = fma(cb2._m19.w, _113, _145);
    precise float _162 = fma(cb2._m20.x, _114, _152);
    precise float _163 = fma(cb2._m20.y, _114, _153);
    precise float _164 = fma(cb2._m20.z, _114, _154);
    precise float _165 = fma(cb2._m20.w, _114, _155);
    gl_Position.x = _162;
    gl_Position.y = _163;
    gl_Position.z = _164;
    gl_Position.w = _165;
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
    TEXCOORD1.x = _122;
    TEXCOORD1.y = _123;
    TEXCOORD1.z = _124;
    precise float _207 = cb0._m4.x - _123;
    precise float _208 = cb0._m4.y - _123;
    precise float _209 = cb0._m4.z - _123;
    precise float _210 = cb0._m4.w - _123;
    precise float _211 = _192 * _207;
    precise float _212 = _192 * _208;
    precise float _213 = _192 * _209;
    precise float _214 = _192 * _210;
    precise float _215 = _207 * _207;
    precise float _216 = _208 * _208;
    precise float _217 = _209 * _209;
    precise float _218 = _210 * _210;
    precise float _225 = cb0._m3.x - _122;
    precise float _226 = cb0._m3.y - _122;
    precise float _227 = cb0._m3.z - _122;
    precise float _228 = cb0._m3.w - _122;
    precise float _235 = cb0._m5.x - _124;
    precise float _236 = cb0._m5.y - _124;
    precise float _237 = cb0._m5.z - _124;
    precise float _238 = cb0._m5.w - _124;
    precise float _255 = spvNMax(fma(_235, _235, fma(_225, _225, _215)), 9.9999999747524270787835121154785e-07);
    precise float _256 = spvNMax(fma(_236, _236, fma(_226, _226, _216)), 9.9999999747524270787835121154785e-07);
    precise float _257 = spvNMax(fma(_237, _237, fma(_227, _227, _217)), 9.9999999747524270787835121154785e-07);
    precise float _258 = spvNMax(fma(_238, _238, fma(_228, _228, _218)), 9.9999999747524270787835121154785e-07);
    precise float _273 = 1.0 / fma(_255, cb0._m6.x, 1.0);
    precise float _274 = 1.0 / fma(_256, cb0._m6.y, 1.0);
    precise float _275 = 1.0 / fma(_257, cb0._m6.z, 1.0);
    precise float _276 = 1.0 / fma(_258, cb0._m6.w, 1.0);
    precise float _277 = fma(_235, _193, fma(_225, _191, _211)) * inversesqrt(_255);
    precise float _278 = fma(_236, _193, fma(_226, _191, _212)) * inversesqrt(_256);
    precise float _279 = fma(_237, _193, fma(_227, _191, _213)) * inversesqrt(_257);
    precise float _280 = fma(_238, _193, fma(_228, _191, _214)) * inversesqrt(_258);
    precise float _285 = _273 * spvNMax(_277, 0.0);
    precise float _286 = _274 * spvNMax(_278, 0.0);
    precise float _287 = _275 * spvNMax(_279, 0.0);
    precise float _288 = _276 * spvNMax(_280, 0.0);
    precise float _294 = _286 * cb0._m9.x;
    precise float _295 = _286 * cb0._m9.y;
    precise float _296 = _286 * cb0._m9.z;
    TEXCOORD2.x = fma(cb0._m13.x, _288, fma(cb0._m11.x, _287, fma(cb0._m7.x, _285, _294)));
    TEXCOORD2.y = fma(cb0._m13.y, _288, fma(cb0._m11.y, _287, fma(cb0._m7.y, _285, _295)));
    TEXCOORD2.z = fma(cb0._m13.z, _288, fma(cb0._m11.z, _287, fma(cb0._m7.z, _285, _296)));
    TEXCOORD4.x = 0.0;
    TEXCOORD4.y = 0.0;
    TEXCOORD4.z = 0.0;
    TEXCOORD4.w = 0.0;
    TEXCOORD5.x = 0.0;
    TEXCOORD5.y = 0.0;
    TEXCOORD5.z = 0.0;
    TEXCOORD5.w = 0.0;
}

