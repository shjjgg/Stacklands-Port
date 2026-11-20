#version 450
#extension GL_EXT_buffer_reference2 : require
#extension GL_EXT_spirv_intrinsics : require

layout(set = 0, binding = 0, std140) uniform cb0_buf
{
    uvec4 _m0;
    uvec4 _m1;
    vec4 _m2;
    uvec4 _m3;
    vec4 _m4;
    vec4 _m5;
    vec2 _m6;
    uvec2 _m7;
    vec2 _m8;
    uvec2 _m9;
    vec4 _m10;
} cb0;

layout(set = 0, binding = 1, std140) uniform cb1_buf
{
    vec4 m;
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
layout(set = 0, binding = 5) uniform texture3D t0;

layout(location = 2, component = 0) in vec3 TEXCOORD1;
layout(location = 0, component = 0) out vec4 SV_Target;

spirv_instruction(set = "GLSL.std.450", id = 79) float spvNMin(float, float);
spirv_instruction(set = "GLSL.std.450", id = 79) vec2 spvNMin(vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 79) vec3 spvNMin(vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 79) vec4 spvNMin(vec4, vec4);
spirv_instruction(set = "GLSL.std.450", id = 80) float spvNMax(float, float);
spirv_instruction(set = "GLSL.std.450", id = 80) vec2 spvNMax(vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 80) vec3 spvNMax(vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 80) vec4 spvNMax(vec4, vec4);
spirv_instruction(set = "GLSL.std.450", id = 81) float spvNClamp(float, float, float);
spirv_instruction(set = "GLSL.std.450", id = 81) vec2 spvNClamp(vec2, vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 81) vec3 spvNClamp(vec3, vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 81) vec4 spvNClamp(vec4, vec4, vec4);

float dp2_f32(vec2 a, vec2 b)
{
    precise float _89 = a.x * b.x;
    return fma(a.y, b.y, _89);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _71 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _71)));
}

void main()
{
    precise float _99 = TEXCOORD1.x * 1000.0;
    precise float _102 = sin(roundEven(_99)) * 43758.546875;
    precise float _104 = fract(_102) - 0.5;
    precise float _109 = _104 * cb0._m10.w;
    precise float _112 = fma(_109, 0.004999999888241291046142578125, TEXCOORD1.z);
    precise float _113 = _112 * 500.0;
    precise float _114 = _112 * 10.0;
    precise float _118 = sin(roundEven(_113)) * 43758.546875;
    precise float _120 = fract(_118) - 0.5;
    precise float _121 = _120 * cb0._m10.w;
    precise float _126 = roundEven(_114) + cb1.m.x;
    precise float _127 = _126 * 250.0;
    precise float _130 = sin(roundEven(_127)) * 43758.546875;
    precise float _132 = fract(_130) - 0.5;
    precise float _133 = fma(_132, 0.004999999888241291046142578125, fma(_121, 0.004999999888241291046142578125, TEXCOORD1.x));
    precise float _134 = _133 * 10.0;
    precise float _136 = roundEven(_134) + cb1.m.x;
    precise float _137 = _136 * 250.0;
    precise float _140 = sin(roundEven(_137)) * 43758.546875;
    precise float _142 = fract(_140) - 0.5;
    precise float _143 = fma(_142, 0.004999999888241291046142578125, _112);
    precise float _153 = cb0._m8.x - cb0._m6.x;
    precise float _154 = cb0._m8.y - cb0._m6.y;
    vec2 _155 = vec2(_153, _154);
    float _156 = dp2_f32(_155, _155);
    precise float _157 = inversesqrt(_156);
    precise float _158 = _157 * _153;
    precise float _159 = _157 * _154;
    precise float _160 = 0.0 - _159;
    precise float _165 = fma(_153, _157, _160) * cb0._m10.z;
    precise float _166 = fma(_154, _157, _158) * cb0._m10.z;
    precise float _171 = fma(_153, _157, -_160) * cb0._m10.z;
    precise float _172 = fma(_154, _157, -_158) * cb0._m10.z;
    precise float _173 = _133 - cb0._m6.x;
    precise float _174 = _143 - cb0._m6.y;
    precise float _177 = dp2_f32(vec2(_173, _174), _155) / _156;
    precise float _179 = -spvNClamp(_177, 0.0, 1.0);
    vec2 _182 = vec2(fma(_179, _153, _173), fma(_179, _154, _174));
    precise float _184 = _133 - cb0._m8.x;
    precise float _185 = _143 - cb0._m8.y;
    vec2 _186 = vec2(_184, _185);
    precise float _187 = -_165;
    precise float _188 = -_166;
    vec2 _189 = vec2(_187, _188);
    precise float _192 = dp2_f32(_186, _189) / dp2_f32(_189, _189);
    precise float _194 = -spvNClamp(_192, 0.0, 1.0);
    vec2 _197 = vec2(fma(_194, _187, _184), fma(_194, _188, _185));
    precise float _202 = -_171;
    precise float _203 = -_172;
    vec2 _204 = vec2(_202, _203);
    precise float _207 = dp2_f32(_186, _204) / dp2_f32(_204, _204);
    precise float _209 = -spvNClamp(_207, 0.0, 1.0);
    vec2 _212 = vec2(fma(_209, _202, _184), fma(_209, _203, _185));
    precise float _215 = spvNMin(sqrt(dp2_f32(_212, _212)), spvNMin(sqrt(dp2_f32(_197, _197)), sqrt(dp2_f32(_182, _182))));
    precise float _220 = abs(dFdy(_215)) + abs(dFdx(_215));
    precise float _225 = cb0._m10.y + cb0._m10.x;
    precise float _226 = -_220;
    precise float _227 = fma(_226, 0.5, _225);
    precise float _228 = _215 - _227;
    precise float _230 = fma(_220, 0.5, _225) - _227;
    precise float _231 = _228 / _230;
    precise float _232 = spvNClamp(_231, 0.0, 1.0);
    precise float _246 = cb0._m5.x - cb0._m4.x;
    precise float _247 = cb0._m5.y - cb0._m4.y;
    precise float _248 = cb0._m5.z - cb0._m4.z;
    precise float _249 = cb0._m5.w - cb0._m4.w;
    precise float _250 = fma(_232, _246, cb0._m4.x);
    precise float _251 = fma(_232, _247, cb0._m4.y);
    precise float _252 = fma(_232, _248, cb0._m4.z);
    precise float _253 = fma(_232, _249, cb0._m4.w);
    precise float _254 = fma(cb0._m10.y, 2.0, cb0._m10.x);
    precise float _255 = fma(_226, 0.5, _254);
    precise float _257 = _215 - _255;
    precise float _258 = fma(_220, 0.5, _254) - _255;
    precise float _259 = _257 / _258;
    precise float _260 = spvNClamp(_259, 0.0, 1.0);
    float _348;
    float _349;
    float _350;
    float _351;
    if (cb3._m0.x == 1.0)
    {
        bool _278 = cb3._m0.y == 1.0;
        precise float _287 = TEXCOORD1.y * cb3._m3.x;
        precise float _288 = TEXCOORD1.y * cb3._m3.y;
        precise float _289 = TEXCOORD1.y * cb3._m3.z;
        precise float _311 = fma(cb3._m5.x, TEXCOORD1.z, fma(cb3._m1.x, TEXCOORD1.x, _287)) + cb3._m7.x;
        precise float _312 = fma(cb3._m5.y, TEXCOORD1.z, fma(cb3._m1.y, TEXCOORD1.x, _288)) + cb3._m7.y;
        precise float _313 = fma(cb3._m5.z, TEXCOORD1.z, fma(cb3._m1.z, TEXCOORD1.x, _289)) + cb3._m7.z;
        precise float _322 = (_278 ? _311 : TEXCOORD1.x) - cb3._m11.x;
        precise float _323 = (_278 ? _312 : TEXCOORD1.y) - cb3._m11.y;
        precise float _324 = (_278 ? _313 : TEXCOORD1.z) - cb3._m11.z;
        precise float _330 = _322 * cb3._m9.x;
        precise float _331 = _323 * cb3._m9.y;
        precise float _332 = _324 * cb3._m9.z;
        vec4 _343 = texture(sampler3D(t0, s0), vec3(spvNMax(fma(_330, 0.25, 0.75), fma(cb3._m0.z, 0.5, 0.75)), _331, _332));
        _348 = _343.w;
        _349 = _343.z;
        _350 = _343.y;
        _351 = _343.x;
    }
    else
    {
        _348 = 1.0;
        _349 = 1.0;
        _350 = 1.0;
        _351 = 1.0;
    }
    precise float _357 = spvNClamp(dp4_f32(vec4(_351, _350, _349, _348), cb2._m46), 0.0, 1.0);
    precise float _358 = fma(_260, -_250, _250) * _357;
    precise float _359 = fma(_260, -_251, _251) * _357;
    precise float _360 = fma(_260, -_252, _252) * _357;
    precise float _367 = _358 * cb0._m2.x;
    precise float _368 = _359 * cb0._m2.y;
    precise float _369 = _360 * cb0._m2.z;
    precise float _370 = fma(_260, -_253, _253) * cb0._m2.w;
    SV_Target.x = _367;
    SV_Target.y = _368;
    SV_Target.z = _369;
    SV_Target.w = _370;
}

