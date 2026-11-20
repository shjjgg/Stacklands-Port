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
    vec2 _m6;
    vec2 _m7;
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
    precise float _85 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _85));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _67 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _67)));
}

void main()
{
    precise float _106 = POSITION.y * cb2._m1.x;
    precise float _107 = POSITION.y * cb2._m1.y;
    precise float _108 = POSITION.y * cb2._m1.z;
    precise float _109 = POSITION.y * cb2._m1.w;
    precise float _118 = fma(cb2._m0.x, POSITION.x, _106);
    precise float _119 = fma(cb2._m0.y, POSITION.x, _107);
    precise float _120 = fma(cb2._m0.z, POSITION.x, _108);
    precise float _121 = fma(cb2._m0.w, POSITION.x, _109);
    precise float _130 = fma(cb2._m2.x, POSITION.z, _118);
    precise float _131 = fma(cb2._m2.y, POSITION.z, _119);
    precise float _132 = fma(cb2._m2.z, POSITION.z, _120);
    precise float _133 = fma(cb2._m2.w, POSITION.z, _121);
    precise float _140 = _130 + cb2._m3.x;
    precise float _141 = _131 + cb2._m3.y;
    precise float _142 = _132 + cb2._m3.z;
    precise float _143 = _133 + cb2._m3.w;
    precise float _151 = fma(cb2._m3.x, POSITION.w, _130);
    precise float _152 = fma(cb2._m3.y, POSITION.w, _131);
    precise float _153 = fma(cb2._m3.z, POSITION.w, _132);
    precise float _161 = _141 * cb3._m18.x;
    precise float _162 = _141 * cb3._m18.y;
    precise float _163 = _141 * cb3._m18.z;
    precise float _164 = _141 * cb3._m18.w;
    precise float _171 = fma(cb3._m17.x, _140, _161);
    precise float _172 = fma(cb3._m17.y, _140, _162);
    precise float _173 = fma(cb3._m17.z, _140, _163);
    precise float _174 = fma(cb3._m17.w, _140, _164);
    precise float _181 = fma(cb3._m19.x, _142, _171);
    precise float _182 = fma(cb3._m19.y, _142, _172);
    precise float _183 = fma(cb3._m19.z, _142, _173);
    precise float _184 = fma(cb3._m19.w, _142, _174);
    precise float _191 = fma(cb3._m20.x, _143, _181);
    precise float _192 = fma(cb3._m20.y, _143, _182);
    precise float _193 = fma(cb3._m20.z, _143, _183);
    precise float _194 = fma(cb3._m20.w, _143, _184);
    gl_Position.x = _191;
    gl_Position.y = _192;
    gl_Position.z = _193;
    gl_Position.w = _194;
    TEXCOORD_1.x = fma(TEXCOORD.x, cb0._m6.x, cb0._m7.x);
    TEXCOORD_1.y = fma(TEXCOORD.y, cb0._m6.y, cb0._m7.y);
    vec3 _224 = vec3(NORMAL.x, NORMAL.y, NORMAL.z);
    float _228 = dp3_f32(_224, cb2._m4);
    float _231 = dp3_f32(_224, cb2._m6);
    float _234 = dp3_f32(_224, cb2._m8);
    vec3 _235 = vec3(_228, _231, _234);
    precise float _237 = inversesqrt(dp3_f32(_235, _235));
    precise float _238 = _237 * _228;
    precise float _239 = _237 * _231;
    precise float _240 = _237 * _234;
    TEXCOORD1.x = _238;
    TEXCOORD1.y = _239;
    TEXCOORD1.z = _240;
    TEXCOORD2.x = _151;
    TEXCOORD2.y = _152;
    TEXCOORD2.z = _153;
    precise float _254 = cb1._m3.x - _151;
    precise float _255 = cb1._m3.y - _151;
    precise float _256 = cb1._m3.z - _151;
    precise float _257 = cb1._m3.w - _151;
    precise float _264 = cb1._m4.x - _152;
    precise float _265 = cb1._m4.y - _152;
    precise float _266 = cb1._m4.z - _152;
    precise float _267 = cb1._m4.w - _152;
    precise float _274 = cb1._m5.x - _153;
    precise float _275 = cb1._m5.y - _153;
    precise float _276 = cb1._m5.z - _153;
    precise float _277 = cb1._m5.w - _153;
    precise float _278 = _239 * _264;
    precise float _279 = _239 * _265;
    precise float _280 = _239 * _266;
    precise float _281 = _239 * _267;
    precise float _282 = _264 * _264;
    precise float _283 = _265 * _265;
    precise float _284 = _266 * _266;
    precise float _285 = _267 * _267;
    precise float _302 = spvNMax(fma(_274, _274, fma(_254, _254, _282)), 9.9999999747524270787835121154785e-07);
    precise float _303 = spvNMax(fma(_275, _275, fma(_255, _255, _283)), 9.9999999747524270787835121154785e-07);
    precise float _304 = spvNMax(fma(_276, _276, fma(_256, _256, _284)), 9.9999999747524270787835121154785e-07);
    precise float _305 = spvNMax(fma(_277, _277, fma(_257, _257, _285)), 9.9999999747524270787835121154785e-07);
    precise float _320 = 1.0 / fma(_302, cb1._m6.x, 1.0);
    precise float _321 = 1.0 / fma(_303, cb1._m6.y, 1.0);
    precise float _322 = 1.0 / fma(_304, cb1._m6.z, 1.0);
    precise float _323 = 1.0 / fma(_305, cb1._m6.w, 1.0);
    precise float _324 = fma(_274, _240, fma(_254, _238, _278)) * inversesqrt(_302);
    precise float _325 = fma(_275, _240, fma(_255, _238, _279)) * inversesqrt(_303);
    precise float _326 = fma(_276, _240, fma(_256, _238, _280)) * inversesqrt(_304);
    precise float _327 = fma(_277, _240, fma(_257, _238, _281)) * inversesqrt(_305);
    precise float _332 = _320 * spvNMax(_324, 0.0);
    precise float _333 = _321 * spvNMax(_325, 0.0);
    precise float _334 = _322 * spvNMax(_326, 0.0);
    precise float _335 = _323 * spvNMax(_327, 0.0);
    precise float _341 = _333 * cb1._m9.x;
    precise float _342 = _333 * cb1._m9.y;
    precise float _343 = _333 * cb1._m9.z;
    precise float _368 = _239 * _239;
    precise float _370 = fma(_238, _238, -_368);
    precise float _371 = _239 * _238;
    precise float _372 = _240 * _239;
    precise float _373 = _240 * _240;
    precise float _374 = _238 * _240;
    vec4 _377 = vec4(_371, _372, _373, _374);
    precise float _393 = fma(cb1._m13.x, _335, fma(cb1._m11.x, _334, fma(cb1._m7.x, _332, _341))) + fma(cb1._m49.x, _370, dp4_f32(cb1._m46, _377));
    precise float _394 = fma(cb1._m13.y, _335, fma(cb1._m11.y, _334, fma(cb1._m7.y, _332, _342))) + fma(cb1._m49.y, _370, dp4_f32(cb1._m47, _377));
    precise float _395 = fma(cb1._m13.z, _335, fma(cb1._m11.z, _334, fma(cb1._m7.z, _332, _343))) + fma(cb1._m49.z, _370, dp4_f32(cb1._m48, _377));
    TEXCOORD3.x = _393;
    TEXCOORD3.y = _394;
    TEXCOORD3.z = _395;
    TEXCOORD5.x = 0.0;
    TEXCOORD5.y = 0.0;
    TEXCOORD5.z = 0.0;
    TEXCOORD5.w = 0.0;
    TEXCOORD6.x = 0.0;
    TEXCOORD6.y = 0.0;
    TEXCOORD6.z = 0.0;
    TEXCOORD6.w = 0.0;
}

