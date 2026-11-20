#version 450
#extension GL_EXT_buffer_reference2 : require
#extension GL_EXT_spirv_intrinsics : require

layout(set = 0, binding = 0, std140) uniform cb0_buf
{
    uvec4 _m0;
    uvec4 _m1;
    vec3 _m2;
    uint _m3;
    uvec4 _m4;
    uvec4 _m5;
    vec3 _m6;
    uint _m7;
    vec3 _m8;
    uint _m9;
    vec3 _m10;
    uint _m11;
    uvec4 _m12;
    uvec4 _m13;
    vec4 _m14;
    vec4 _m15;
    uvec4 _m16;
    vec4 _m17;
} cb0;

layout(set = 0, binding = 1, std140) uniform cb1_buf
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
    uvec4 _m42;
    uvec4 _m43;
    uvec4 _m44;
    uvec4 _m45;
    vec4 _m46;
} cb1;

layout(set = 0, binding = 2, std140) uniform cb2_buf
{
    uvec4 _m0;
    uvec4 _m1;
    uvec4 _m2;
    vec4 _m3;
} cb2;

layout(set = 0, binding = 3, std140) uniform cb3_buf
{
    vec4 _m0;
    vec3 _m1;
    uint _m2;
    vec3 _m3;
    uint _m4;
    vec3 _m5;
    uint _m6;
    vec3 _m7;
    uint _m8;
    vec3 _m9;
    uint _m10;
    vec3 _m11;
    uint _m12;
} cb3;

layout(set = 0, binding = 4) uniform sampler s0;
layout(set = 0, binding = 5) uniform sampler s1;
layout(set = 0, binding = 6) uniform texture2D t0;
layout(set = 0, binding = 7) uniform texture3D t1;

layout(location = 2, component = 0) in vec3 TEXCOORD1;
layout(location = 0, component = 0) out vec4 SV_Target;

spirv_instruction(set = "GLSL.std.450", id = 80) float spvNMax(float, float);
spirv_instruction(set = "GLSL.std.450", id = 80) vec2 spvNMax(vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 80) vec3 spvNMax(vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 80) vec4 spvNMax(vec4, vec4);
spirv_instruction(set = "GLSL.std.450", id = 81) float spvNClamp(float, float, float);
spirv_instruction(set = "GLSL.std.450", id = 81) vec2 spvNClamp(vec2, vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 81) vec3 spvNClamp(vec3, vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 81) vec4 spvNClamp(vec4, vec4, vec4);

float dp3_f32(vec3 a, vec3 b)
{
    precise float _98 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _98));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _80 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _80)));
}

void main()
{
    precise float _114 = cb0._m14.y + cb0._m15.x;
    precise float _117 = fma(cb0._m14.y, 0.579999983310699462890625, cb0._m15.z);
    precise float _128 = TEXCOORD1.x - cb2._m3.x;
    precise float _129 = TEXCOORD1.z - cb2._m3.z;
    precise float _130 = _128 * 600.0;
    precise float _133 = sin(roundEven(_130)) * 43758.546875;
    precise float _135 = fract(_133) - 0.5;
    precise float _136 = fma(_135, 0.004999999888241291046142578125, _129);
    precise float _137 = _136 * 300.0;
    precise float _140 = sin(roundEven(_137)) * 43758.546875;
    precise float _142 = fract(_140) - 0.5;
    precise float _143 = fma(_142, 0.004999999888241291046142578125, _128);
    precise float _144 = _143 * 1.5;
    precise float _145 = _136 * 1.5;
    vec4 _152 = texture(sampler2D(t0, s1), vec2(_144, _145));
    precise float _163 = abs(_143);
    precise float _164 = abs(TEXCOORD1.y);
    precise float _165 = abs(_136);
    precise float _166 = _163 - _114;
    precise float _167 = _164 - cb0._m15.y;
    precise float _168 = _165 - _117;
    vec3 _172 = vec3(spvNMax(_166, 0.0), spvNMax(_167, 0.0), spvNMax(_168, 0.0));
    precise float _177 = sqrt(dp3_f32(_172, _172)) - cb0._m15.w;
    precise float _178 = _114 + 0.02999999932944774627685546875;
    precise float _179 = cb0._m15.y + 0.02999999932944774627685546875;
    precise float _180 = _117 + 0.02999999932944774627685546875;
    precise float _181 = cb0._m15.w + 0.02999999932944774627685546875;
    precise float _182 = _163 - _178;
    precise float _183 = _164 - _179;
    precise float _184 = _165 - _180;
    vec3 _188 = vec3(spvNMax(_182, 0.0), spvNMax(_183, 0.0), spvNMax(_184, 0.0));
    precise float _191 = sqrt(dp3_f32(_188, _188)) - _181;
    precise float _192 = 1.0 - _191;
    precise float _193 = 1.0 - _177;
    precise float _194 = 1.0 - _192;
    float _197 = float(_194 <= 0.5);
    precise float _204 = 1.0 - cb0._m6.x;
    precise float _205 = 1.0 - cb0._m6.y;
    precise float _206 = 1.0 - cb0._m6.z;
    precise float _207 = fma(_197, _204, cb0._m6.x);
    precise float _208 = fma(_197, _205, cb0._m6.y);
    precise float _209 = fma(_197, _206, cb0._m6.z);
    precise float _214 = abs(dFdx(_193)) + abs(dFdy(_193));
    precise float _215 = -_214;
    precise float _216 = fma(_215, 0.5, 0.5);
    precise float _218 = _193 - _216;
    precise float _220 = fma(_214, 0.5, -_216) + 0.5;
    precise float _221 = _218 / _220;
    precise float _222 = spvNClamp(_221, 0.0, 1.0);
    precise float _234 = fma(_222, fma(cb0._m8.x, spvNClamp(_152.x, 0.0, 1.0), -_207), _207);
    precise float _235 = fma(_222, fma(cb0._m8.y, spvNClamp(_152.y, 0.0, 1.0), -_208), _208);
    precise float _236 = fma(_222, fma(cb0._m8.z, spvNClamp(_152.z, 0.0, 1.0), -_209), _209);
    precise float _239 = 0.5 - cb0._m17.x;
    precise float _240 = fma(_215, 0.5, _239);
    precise float _241 = _193 - _240;
    precise float _243 = fma(_214, 0.5, _239) - _240;
    precise float _244 = _241 / _243;
    precise float _246 = 1.0 - _193;
    precise float _247 = _246 - _240;
    precise float _248 = _247 / _243;
    precise float _250 = spvNClamp(_248, 0.0, 1.0) * spvNClamp(_244, 0.0, 1.0);
    precise float _256 = cb0._m10.x - _234;
    precise float _257 = cb0._m10.y - _235;
    precise float _258 = cb0._m10.z - _236;
    float _337;
    float _338;
    float _339;
    float _340;
    if (cb3._m0.x == 1.0)
    {
        bool _270 = cb3._m0.y == 1.0;
        precise float _276 = TEXCOORD1.y * cb3._m3.x;
        precise float _277 = TEXCOORD1.y * cb3._m3.y;
        precise float _278 = TEXCOORD1.y * cb3._m3.z;
        precise float _300 = fma(cb3._m5.x, TEXCOORD1.z, fma(cb3._m1.x, TEXCOORD1.x, _276)) + cb3._m7.x;
        precise float _301 = fma(cb3._m5.y, TEXCOORD1.z, fma(cb3._m1.y, TEXCOORD1.x, _277)) + cb3._m7.y;
        precise float _302 = fma(cb3._m5.z, TEXCOORD1.z, fma(cb3._m1.z, TEXCOORD1.x, _278)) + cb3._m7.z;
        precise float _311 = (_270 ? _300 : TEXCOORD1.x) - cb3._m11.x;
        precise float _312 = (_270 ? _301 : TEXCOORD1.y) - cb3._m11.y;
        precise float _313 = (_270 ? _302 : TEXCOORD1.z) - cb3._m11.z;
        precise float _319 = _311 * cb3._m9.x;
        precise float _320 = _312 * cb3._m9.y;
        precise float _321 = _313 * cb3._m9.z;
        vec4 _332 = texture(sampler3D(t1, s0), vec3(spvNMax(fma(_319, 0.25, 0.75), fma(cb3._m0.z, 0.5, 0.75)), _320, _321));
        _337 = _332.w;
        _338 = _332.z;
        _339 = _332.y;
        _340 = _332.x;
    }
    else
    {
        _337 = 1.0;
        _338 = 1.0;
        _339 = 1.0;
        _340 = 1.0;
    }
    precise float _347 = spvNClamp(dp4_f32(vec4(_340, _339, _338, _337), cb1._m46), 0.0, 1.0);
    precise float _348 = _347 * fma(_250, _256, _234);
    precise float _349 = _347 * fma(_250, _257, _235);
    precise float _350 = _347 * fma(_250, _258, _236);
    precise float _356 = _348 * cb0._m2.x;
    precise float _357 = _349 * cb0._m2.y;
    precise float _358 = _350 * cb0._m2.z;
    SV_Target.x = _356;
    SV_Target.y = _357;
    SV_Target.z = _358;
    SV_Target.w = 1.0;
}

