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
layout(location = 3, component = 0) in vec3 TEXCOORD2;
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
    precise float _90 = a.x * b.x;
    return fma(a.y, b.y, _90);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _72 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _72)));
}

void main()
{
    precise float _100 = TEXCOORD1.x * 1000.0;
    precise float _103 = sin(roundEven(_100)) * 43758.546875;
    precise float _105 = fract(_103) - 0.5;
    precise float _110 = _105 * cb0._m10.w;
    precise float _113 = fma(_110, 0.004999999888241291046142578125, TEXCOORD1.z);
    precise float _114 = _113 * 500.0;
    precise float _115 = _113 * 10.0;
    precise float _119 = sin(roundEven(_114)) * 43758.546875;
    precise float _121 = fract(_119) - 0.5;
    precise float _122 = _121 * cb0._m10.w;
    precise float _127 = roundEven(_115) + cb1.m.x;
    precise float _128 = _127 * 250.0;
    precise float _131 = sin(roundEven(_128)) * 43758.546875;
    precise float _133 = fract(_131) - 0.5;
    precise float _134 = fma(_133, 0.004999999888241291046142578125, fma(_122, 0.004999999888241291046142578125, TEXCOORD1.x));
    precise float _135 = _134 * 10.0;
    precise float _137 = roundEven(_135) + cb1.m.x;
    precise float _138 = _137 * 250.0;
    precise float _141 = sin(roundEven(_138)) * 43758.546875;
    precise float _143 = fract(_141) - 0.5;
    precise float _144 = fma(_143, 0.004999999888241291046142578125, _113);
    precise float _154 = cb0._m8.x - cb0._m6.x;
    precise float _155 = cb0._m8.y - cb0._m6.y;
    vec2 _156 = vec2(_154, _155);
    float _157 = dp2_f32(_156, _156);
    precise float _158 = inversesqrt(_157);
    precise float _159 = _158 * _154;
    precise float _160 = _158 * _155;
    precise float _161 = 0.0 - _160;
    precise float _166 = fma(_154, _158, _161) * cb0._m10.z;
    precise float _167 = fma(_155, _158, _159) * cb0._m10.z;
    precise float _172 = fma(_154, _158, -_161) * cb0._m10.z;
    precise float _173 = fma(_155, _158, -_159) * cb0._m10.z;
    precise float _174 = _134 - cb0._m6.x;
    precise float _175 = _144 - cb0._m6.y;
    precise float _178 = dp2_f32(vec2(_174, _175), _156) / _157;
    precise float _180 = -spvNClamp(_178, 0.0, 1.0);
    vec2 _183 = vec2(fma(_180, _154, _174), fma(_180, _155, _175));
    precise float _185 = _134 - cb0._m8.x;
    precise float _186 = _144 - cb0._m8.y;
    vec2 _187 = vec2(_185, _186);
    precise float _188 = -_166;
    precise float _189 = -_167;
    vec2 _190 = vec2(_188, _189);
    precise float _193 = dp2_f32(_187, _190) / dp2_f32(_190, _190);
    precise float _195 = -spvNClamp(_193, 0.0, 1.0);
    vec2 _198 = vec2(fma(_195, _188, _185), fma(_195, _189, _186));
    precise float _203 = -_172;
    precise float _204 = -_173;
    vec2 _205 = vec2(_203, _204);
    precise float _208 = dp2_f32(_187, _205) / dp2_f32(_205, _205);
    precise float _210 = -spvNClamp(_208, 0.0, 1.0);
    vec2 _213 = vec2(fma(_210, _203, _185), fma(_210, _204, _186));
    precise float _216 = spvNMin(sqrt(dp2_f32(_213, _213)), spvNMin(sqrt(dp2_f32(_198, _198)), sqrt(dp2_f32(_183, _183))));
    precise float _221 = abs(dFdy(_216)) + abs(dFdx(_216));
    precise float _226 = cb0._m10.y + cb0._m10.x;
    precise float _227 = -_221;
    precise float _228 = fma(_227, 0.5, _226);
    precise float _229 = _216 - _228;
    precise float _231 = fma(_221, 0.5, _226) - _228;
    precise float _232 = _229 / _231;
    precise float _233 = spvNClamp(_232, 0.0, 1.0);
    precise float _247 = cb0._m5.x - cb0._m4.x;
    precise float _248 = cb0._m5.y - cb0._m4.y;
    precise float _249 = cb0._m5.z - cb0._m4.z;
    precise float _250 = cb0._m5.w - cb0._m4.w;
    precise float _251 = fma(_233, _247, cb0._m4.x);
    precise float _252 = fma(_233, _248, cb0._m4.y);
    precise float _253 = fma(_233, _249, cb0._m4.z);
    precise float _254 = fma(_233, _250, cb0._m4.w);
    precise float _255 = fma(cb0._m10.y, 2.0, cb0._m10.x);
    precise float _256 = fma(_227, 0.5, _255);
    precise float _258 = _216 - _256;
    precise float _259 = fma(_221, 0.5, _255) - _256;
    precise float _260 = _258 / _259;
    precise float _261 = spvNClamp(_260, 0.0, 1.0);
    precise float _266 = fma(_261, -_251, _251);
    precise float _267 = fma(_261, -_252, _252);
    precise float _268 = fma(_261, -_253, _253);
    float _349;
    float _350;
    float _351;
    float _352;
    if (cb3._m0.x == 1.0)
    {
        bool _279 = cb3._m0.y == 1.0;
        precise float _288 = TEXCOORD1.y * cb3._m3.x;
        precise float _289 = TEXCOORD1.y * cb3._m3.y;
        precise float _290 = TEXCOORD1.y * cb3._m3.z;
        precise float _312 = fma(cb3._m5.x, TEXCOORD1.z, fma(cb3._m1.x, TEXCOORD1.x, _288)) + cb3._m7.x;
        precise float _313 = fma(cb3._m5.y, TEXCOORD1.z, fma(cb3._m1.y, TEXCOORD1.x, _289)) + cb3._m7.y;
        precise float _314 = fma(cb3._m5.z, TEXCOORD1.z, fma(cb3._m1.z, TEXCOORD1.x, _290)) + cb3._m7.z;
        precise float _323 = (_279 ? _312 : TEXCOORD1.x) - cb3._m11.x;
        precise float _324 = (_279 ? _313 : TEXCOORD1.y) - cb3._m11.y;
        precise float _325 = (_279 ? _314 : TEXCOORD1.z) - cb3._m11.z;
        precise float _331 = _323 * cb3._m9.x;
        precise float _332 = _324 * cb3._m9.y;
        precise float _333 = _325 * cb3._m9.z;
        vec4 _344 = texture(sampler3D(t0, s0), vec3(spvNMax(fma(_331, 0.25, 0.75), fma(cb3._m0.z, 0.5, 0.75)), _332, _333));
        _349 = _344.w;
        _350 = _344.z;
        _351 = _344.y;
        _352 = _344.x;
    }
    else
    {
        _349 = 1.0;
        _350 = 1.0;
        _351 = 1.0;
        _352 = 1.0;
    }
    precise float _358 = spvNClamp(dp4_f32(vec4(_352, _351, _350, _349), cb2._m46), 0.0, 1.0);
    precise float _365 = _266 * TEXCOORD2.x;
    precise float _366 = _267 * TEXCOORD2.y;
    precise float _367 = _268 * TEXCOORD2.z;
    precise float _368 = _266 * _358;
    precise float _369 = _267 * _358;
    precise float _370 = _268 * _358;
    SV_Target.x = fma(_368, cb0._m2.x, _365);
    SV_Target.y = fma(_369, cb0._m2.y, _366);
    SV_Target.z = fma(_370, cb0._m2.z, _367);
    SV_Target.w = fma(fma(_261, -_254, _254), cb0._m2.w, 0.0);
}

