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
    vec2 _m11;
    vec2 _m12;
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
    precise float _107 = POSITION.y * cb2._m1.x;
    precise float _108 = POSITION.y * cb2._m1.y;
    precise float _109 = POSITION.y * cb2._m1.z;
    precise float _110 = POSITION.y * cb2._m1.w;
    precise float _119 = fma(cb2._m0.x, POSITION.x, _107);
    precise float _120 = fma(cb2._m0.y, POSITION.x, _108);
    precise float _121 = fma(cb2._m0.z, POSITION.x, _109);
    precise float _122 = fma(cb2._m0.w, POSITION.x, _110);
    precise float _131 = fma(cb2._m2.x, POSITION.z, _119);
    precise float _132 = fma(cb2._m2.y, POSITION.z, _120);
    precise float _133 = fma(cb2._m2.z, POSITION.z, _121);
    precise float _134 = fma(cb2._m2.w, POSITION.z, _122);
    precise float _141 = _131 + cb2._m3.x;
    precise float _142 = _132 + cb2._m3.y;
    precise float _143 = _133 + cb2._m3.z;
    precise float _144 = _134 + cb2._m3.w;
    precise float _152 = fma(cb2._m3.x, POSITION.w, _131);
    precise float _153 = fma(cb2._m3.y, POSITION.w, _132);
    precise float _154 = fma(cb2._m3.z, POSITION.w, _133);
    precise float _162 = _142 * cb3._m18.x;
    precise float _163 = _142 * cb3._m18.y;
    precise float _164 = _142 * cb3._m18.z;
    precise float _165 = _142 * cb3._m18.w;
    precise float _172 = fma(cb3._m17.x, _141, _162);
    precise float _173 = fma(cb3._m17.y, _141, _163);
    precise float _174 = fma(cb3._m17.z, _141, _164);
    precise float _175 = fma(cb3._m17.w, _141, _165);
    precise float _182 = fma(cb3._m19.x, _143, _172);
    precise float _183 = fma(cb3._m19.y, _143, _173);
    precise float _184 = fma(cb3._m19.z, _143, _174);
    precise float _185 = fma(cb3._m19.w, _143, _175);
    precise float _192 = fma(cb3._m20.x, _144, _182);
    precise float _193 = fma(cb3._m20.y, _144, _183);
    precise float _194 = fma(cb3._m20.z, _144, _184);
    precise float _195 = fma(cb3._m20.w, _144, _185);
    gl_Position.x = _192;
    gl_Position.y = _193;
    gl_Position.z = _194;
    gl_Position.w = _195;
    TEXCOORD_1.x = fma(TEXCOORD.x, cb0._m11.x, cb0._m12.x);
    TEXCOORD_1.y = fma(TEXCOORD.y, cb0._m11.y, cb0._m12.y);
    vec3 _225 = vec3(NORMAL.x, NORMAL.y, NORMAL.z);
    float _229 = dp3_f32(_225, cb2._m4);
    float _232 = dp3_f32(_225, cb2._m6);
    float _235 = dp3_f32(_225, cb2._m8);
    vec3 _236 = vec3(_229, _232, _235);
    precise float _238 = inversesqrt(dp3_f32(_236, _236));
    precise float _239 = _238 * _229;
    precise float _240 = _238 * _232;
    precise float _241 = _238 * _235;
    TEXCOORD1.x = _239;
    TEXCOORD1.y = _240;
    TEXCOORD1.z = _241;
    TEXCOORD2.x = _152;
    TEXCOORD2.y = _153;
    TEXCOORD2.z = _154;
    precise float _255 = cb1._m3.x - _152;
    precise float _256 = cb1._m3.y - _152;
    precise float _257 = cb1._m3.z - _152;
    precise float _258 = cb1._m3.w - _152;
    precise float _265 = cb1._m4.x - _153;
    precise float _266 = cb1._m4.y - _153;
    precise float _267 = cb1._m4.z - _153;
    precise float _268 = cb1._m4.w - _153;
    precise float _275 = cb1._m5.x - _154;
    precise float _276 = cb1._m5.y - _154;
    precise float _277 = cb1._m5.z - _154;
    precise float _278 = cb1._m5.w - _154;
    precise float _279 = _240 * _265;
    precise float _280 = _240 * _266;
    precise float _281 = _240 * _267;
    precise float _282 = _240 * _268;
    precise float _283 = _265 * _265;
    precise float _284 = _266 * _266;
    precise float _285 = _267 * _267;
    precise float _286 = _268 * _268;
    precise float _303 = spvNMax(fma(_275, _275, fma(_255, _255, _283)), 9.9999999747524270787835121154785e-07);
    precise float _304 = spvNMax(fma(_276, _276, fma(_256, _256, _284)), 9.9999999747524270787835121154785e-07);
    precise float _305 = spvNMax(fma(_277, _277, fma(_257, _257, _285)), 9.9999999747524270787835121154785e-07);
    precise float _306 = spvNMax(fma(_278, _278, fma(_258, _258, _286)), 9.9999999747524270787835121154785e-07);
    precise float _321 = 1.0 / fma(_303, cb1._m6.x, 1.0);
    precise float _322 = 1.0 / fma(_304, cb1._m6.y, 1.0);
    precise float _323 = 1.0 / fma(_305, cb1._m6.z, 1.0);
    precise float _324 = 1.0 / fma(_306, cb1._m6.w, 1.0);
    precise float _325 = fma(_275, _241, fma(_255, _239, _279)) * inversesqrt(_303);
    precise float _326 = fma(_276, _241, fma(_256, _239, _280)) * inversesqrt(_304);
    precise float _327 = fma(_277, _241, fma(_257, _239, _281)) * inversesqrt(_305);
    precise float _328 = fma(_278, _241, fma(_258, _239, _282)) * inversesqrt(_306);
    precise float _333 = _321 * spvNMax(_325, 0.0);
    precise float _334 = _322 * spvNMax(_326, 0.0);
    precise float _335 = _323 * spvNMax(_327, 0.0);
    precise float _336 = _324 * spvNMax(_328, 0.0);
    precise float _342 = _334 * cb1._m9.x;
    precise float _343 = _334 * cb1._m9.y;
    precise float _344 = _334 * cb1._m9.z;
    precise float _369 = _240 * _240;
    precise float _371 = fma(_239, _239, -_369);
    precise float _372 = _240 * _239;
    precise float _373 = _241 * _240;
    precise float _374 = _241 * _241;
    precise float _375 = _239 * _241;
    vec4 _378 = vec4(_372, _373, _374, _375);
    precise float _394 = fma(cb1._m13.x, _336, fma(cb1._m11.x, _335, fma(cb1._m7.x, _333, _342))) + fma(cb1._m49.x, _371, dp4_f32(cb1._m46, _378));
    precise float _395 = fma(cb1._m13.y, _336, fma(cb1._m11.y, _335, fma(cb1._m7.y, _333, _343))) + fma(cb1._m49.y, _371, dp4_f32(cb1._m47, _378));
    precise float _396 = fma(cb1._m13.z, _336, fma(cb1._m11.z, _335, fma(cb1._m7.z, _333, _344))) + fma(cb1._m49.z, _371, dp4_f32(cb1._m48, _378));
    TEXCOORD3.x = _394;
    TEXCOORD3.y = _395;
    TEXCOORD3.z = _396;
    TEXCOORD5.x = 0.0;
    TEXCOORD5.y = 0.0;
    TEXCOORD5.z = 0.0;
    TEXCOORD5.w = 0.0;
    TEXCOORD6.x = 0.0;
    TEXCOORD6.y = 0.0;
    TEXCOORD6.z = 0.0;
    TEXCOORD6.w = 0.0;
}

