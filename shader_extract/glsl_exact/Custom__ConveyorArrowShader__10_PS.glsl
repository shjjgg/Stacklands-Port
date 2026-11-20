#version 450
#extension GL_EXT_buffer_reference2 : require
#extension GL_EXT_spirv_intrinsics : require

layout(set = 0, binding = 0, std140) uniform cb0_buf
{
    uvec4 _m0;
    uvec4 _m1;
    vec4 _m2;
    uvec4 _m3;
    vec3 _m4;
    uint _m5;
    vec3 _m6;
    uint _m7;
    vec3 _m8;
    uint _m9;
    vec3 _m10;
    uint _m11;
    vec4 _m12;
    vec4 _m13;
    vec2 _m14;
    uvec2 _m15;
    vec2 _m16;
    uvec2 _m17;
    vec4 _m18;
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
layout(set = 0, binding = 5) uniform sampler s1;
layout(set = 0, binding = 6) uniform texture2D t0;
layout(set = 0, binding = 7) uniform texture3D t1;

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
    precise float _110 = a.x * b.x;
    return fma(a.y, b.y, _110);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _93 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _93)));
}

float dp3_f32(vec3 a, vec3 b)
{
    precise float _78 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _78));
}

void main()
{
    precise float _120 = TEXCOORD1.x * 1000.0;
    precise float _123 = sin(roundEven(_120)) * 43758.546875;
    precise float _125 = fract(_123) - 0.5;
    precise float _130 = _125 * cb0._m18.w;
    precise float _133 = fma(_130, 0.004999999888241291046142578125, TEXCOORD1.z);
    precise float _134 = _133 * 500.0;
    precise float _135 = _133 * 10.0;
    precise float _139 = sin(roundEven(_134)) * 43758.546875;
    precise float _141 = fract(_139) - 0.5;
    precise float _142 = _141 * cb0._m18.w;
    precise float _147 = roundEven(_135) + cb1.m.x;
    precise float _148 = _147 * 250.0;
    precise float _151 = sin(roundEven(_148)) * 43758.546875;
    precise float _153 = fract(_151) - 0.5;
    precise float _154 = fma(_153, 0.004999999888241291046142578125, fma(_142, 0.004999999888241291046142578125, TEXCOORD1.x));
    precise float _155 = _154 * 10.0;
    precise float _157 = roundEven(_155) + cb1.m.x;
    precise float _158 = _157 * 250.0;
    precise float _161 = sin(roundEven(_158)) * 43758.546875;
    precise float _163 = fract(_161) - 0.5;
    precise float _164 = fma(_163, 0.004999999888241291046142578125, _133);
    precise float _174 = cb0._m16.x - cb0._m14.x;
    precise float _175 = cb0._m16.y - cb0._m14.y;
    vec2 _176 = vec2(_174, _175);
    float _177 = dp2_f32(_176, _176);
    precise float _178 = inversesqrt(_177);
    precise float _179 = _178 * _174;
    precise float _180 = _178 * _175;
    precise float _181 = 0.0 - _180;
    precise float _186 = fma(_174, _178, _181) * cb0._m18.z;
    precise float _187 = fma(_175, _178, _179) * cb0._m18.z;
    precise float _192 = fma(_174, _178, -_181) * cb0._m18.z;
    precise float _193 = fma(_175, _178, -_179) * cb0._m18.z;
    precise float _194 = _154 - cb0._m14.x;
    precise float _195 = _164 - cb0._m14.y;
    precise float _198 = dp2_f32(vec2(_194, _195), _176) / _177;
    precise float _200 = -spvNClamp(_198, 0.0, 1.0);
    vec2 _203 = vec2(fma(_200, _174, _194), fma(_200, _175, _195));
    precise float _205 = _154 - cb0._m16.x;
    precise float _206 = _164 - cb0._m16.y;
    vec2 _207 = vec2(_205, _206);
    precise float _208 = -_186;
    precise float _209 = -_187;
    vec2 _210 = vec2(_208, _209);
    precise float _213 = dp2_f32(_207, _210) / dp2_f32(_210, _210);
    precise float _215 = -spvNClamp(_213, 0.0, 1.0);
    vec2 _218 = vec2(fma(_215, _208, _205), fma(_215, _209, _206));
    precise float _223 = -_192;
    precise float _224 = -_193;
    vec2 _225 = vec2(_223, _224);
    precise float _228 = dp2_f32(_207, _225) / dp2_f32(_225, _225);
    precise float _230 = -spvNClamp(_228, 0.0, 1.0);
    vec2 _233 = vec2(fma(_230, _223, _205), fma(_230, _224, _206));
    precise float _236 = spvNMin(sqrt(dp2_f32(_233, _233)), spvNMin(sqrt(dp2_f32(_218, _218)), sqrt(dp2_f32(_203, _203))));
    precise float _241 = abs(dFdy(_236)) + abs(dFdx(_236));
    precise float _245 = fma(-_241, 0.5, cb0._m18.x);
    precise float _247 = _236 - _245;
    precise float _248 = fma(_241, 0.5, cb0._m18.x) - _245;
    precise float _249 = _247 / _248;
    precise float _250 = spvNClamp(_249, 0.0, 1.0);
    precise float _264 = cb0._m13.x - cb0._m12.x;
    precise float _265 = cb0._m13.y - cb0._m12.y;
    precise float _266 = cb0._m13.z - cb0._m12.z;
    precise float _267 = cb0._m13.w - cb0._m12.w;
    precise float _268 = fma(_250, _264, cb0._m12.x);
    precise float _269 = fma(_250, _265, cb0._m12.y);
    precise float _270 = fma(_250, _266, cb0._m12.z);
    precise float _271 = fma(_250, _267, cb0._m12.w);
    precise float _288 = TEXCOORD1.y * cb0._m6.x;
    precise float _289 = TEXCOORD1.y * cb0._m6.y;
    precise float _290 = TEXCOORD1.y * cb0._m6.z;
    precise float _312 = fma(cb0._m8.x, TEXCOORD1.z, fma(cb0._m4.x, TEXCOORD1.x, _288)) + cb0._m10.x;
    precise float _313 = fma(cb0._m8.y, TEXCOORD1.z, fma(cb0._m4.y, TEXCOORD1.x, _289)) + cb0._m10.y;
    precise float _314 = fma(cb0._m8.z, TEXCOORD1.z, fma(cb0._m4.z, TEXCOORD1.x, _290)) + cb0._m10.z;
    float _391;
    float _392;
    float _393;
    float _394;
    if (cb3._m0.x == 1.0)
    {
        bool _324 = cb3._m0.y == 1.0;
        precise float _330 = TEXCOORD1.y * cb3._m3.x;
        precise float _331 = TEXCOORD1.y * cb3._m3.y;
        precise float _332 = TEXCOORD1.y * cb3._m3.z;
        precise float _354 = fma(cb3._m5.x, TEXCOORD1.z, fma(cb3._m1.x, TEXCOORD1.x, _330)) + cb3._m7.x;
        precise float _355 = fma(cb3._m5.y, TEXCOORD1.z, fma(cb3._m1.y, TEXCOORD1.x, _331)) + cb3._m7.y;
        precise float _356 = fma(cb3._m5.z, TEXCOORD1.z, fma(cb3._m1.z, TEXCOORD1.x, _332)) + cb3._m7.z;
        precise float _365 = (_324 ? _354 : TEXCOORD1.x) - cb3._m11.x;
        precise float _366 = (_324 ? _355 : TEXCOORD1.y) - cb3._m11.y;
        precise float _367 = (_324 ? _356 : TEXCOORD1.z) - cb3._m11.z;
        precise float _373 = _365 * cb3._m9.x;
        precise float _374 = _366 * cb3._m9.y;
        precise float _375 = _367 * cb3._m9.z;
        vec4 _386 = texture(sampler3D(t1, s0), vec3(spvNMax(fma(_373, 0.25, 0.75), fma(cb3._m0.z, 0.5, 0.75)), _374, _375));
        _391 = _386.w;
        _392 = _386.z;
        _393 = _386.y;
        _394 = _386.x;
    }
    else
    {
        _391 = 1.0;
        _392 = 1.0;
        _393 = 1.0;
        _394 = 1.0;
    }
    vec3 _401 = vec3(_312, _313, _314);
    precise float _410 = spvNClamp(dp4_f32(vec4(_394, _393, _392, _391), cb2._m46), 0.0, 1.0) * texture(sampler2D(t0, s1), vec2(dp3_f32(_401, _401))).x;
    precise float _411 = fma(_250, -_268, _268) * _410;
    precise float _412 = fma(_250, -_269, _269) * _410;
    precise float _413 = fma(_250, -_270, _270) * _410;
    precise float _420 = _411 * cb0._m2.x;
    precise float _421 = _412 * cb0._m2.y;
    precise float _422 = _413 * cb0._m2.z;
    precise float _423 = fma(_250, -_271, _271) * cb0._m2.w;
    SV_Target.x = _420;
    SV_Target.y = _421;
    SV_Target.z = _422;
    SV_Target.w = _423;
}

