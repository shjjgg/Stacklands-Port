#version 450
#extension GL_EXT_buffer_reference2 : require
#extension GL_EXT_spirv_intrinsics : require

layout(set = 0, binding = 0, std140) uniform cb0_buf
{
    uvec4 _m0;
    uvec4 _m1;
    vec4 _m2;
    uvec4 _m3;
    vec2 _m4;
    uvec2 _m5;
    vec2 _m6;
    uvec2 _m7;
    vec2 _m8;
    uvec2 _m9;
    vec2 _m10;
    uvec2 _m11;
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
    precise float _96 = a.x * b.x;
    return fma(a.y, b.y, _96);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _78 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _78)));
}

void main()
{
    precise float _106 = TEXCOORD1.x * 1000.0;
    precise float _109 = sin(roundEven(_106)) * 43758.546875;
    precise float _111 = fract(_109) - 0.5;
    precise float _116 = _111 * cb0._m18.w;
    precise float _119 = fma(_116, 0.004999999888241291046142578125, TEXCOORD1.z);
    precise float _120 = _119 * 500.0;
    precise float _121 = _119 * 10.0;
    precise float _125 = sin(roundEven(_120)) * 43758.546875;
    precise float _127 = fract(_125) - 0.5;
    precise float _128 = _127 * cb0._m18.w;
    precise float _133 = roundEven(_121) + cb1.m.x;
    precise float _134 = _133 * 250.0;
    precise float _137 = sin(roundEven(_134)) * 43758.546875;
    precise float _139 = fract(_137) - 0.5;
    precise float _140 = fma(_139, 0.004999999888241291046142578125, fma(_128, 0.004999999888241291046142578125, TEXCOORD1.x));
    precise float _141 = _140 * 10.0;
    precise float _143 = roundEven(_141) + cb1.m.x;
    precise float _144 = _143 * 250.0;
    precise float _147 = sin(roundEven(_144)) * 43758.546875;
    precise float _149 = fract(_147) - 0.5;
    precise float _150 = fma(_149, 0.004999999888241291046142578125, _119);
    precise float _160 = cb0._m16.x - cb0._m14.x;
    precise float _161 = cb0._m16.y - cb0._m14.y;
    vec2 _162 = vec2(_160, _161);
    float _163 = dp2_f32(_162, _162);
    precise float _164 = inversesqrt(_163);
    precise float _165 = _164 * _160;
    precise float _166 = _164 * _161;
    precise float _167 = 0.0 - _166;
    precise float _172 = fma(_160, _164, _167) * cb0._m18.z;
    precise float _173 = fma(_161, _164, _165) * cb0._m18.z;
    precise float _178 = fma(_160, _164, -_167) * cb0._m18.z;
    precise float _179 = fma(_161, _164, -_165) * cb0._m18.z;
    precise float _180 = _140 - cb0._m14.x;
    precise float _181 = _150 - cb0._m14.y;
    precise float _184 = dp2_f32(vec2(_180, _181), _162) / _163;
    precise float _186 = -spvNClamp(_184, 0.0, 1.0);
    vec2 _189 = vec2(fma(_186, _160, _180), fma(_186, _161, _181));
    precise float _191 = _140 - cb0._m16.x;
    precise float _192 = _150 - cb0._m16.y;
    vec2 _193 = vec2(_191, _192);
    precise float _194 = -_172;
    precise float _195 = -_173;
    vec2 _196 = vec2(_194, _195);
    precise float _199 = dp2_f32(_193, _196) / dp2_f32(_196, _196);
    precise float _201 = -spvNClamp(_199, 0.0, 1.0);
    vec2 _204 = vec2(fma(_201, _194, _191), fma(_201, _195, _192));
    precise float _209 = -_178;
    precise float _210 = -_179;
    vec2 _211 = vec2(_209, _210);
    precise float _214 = dp2_f32(_193, _211) / dp2_f32(_211, _211);
    precise float _216 = -spvNClamp(_214, 0.0, 1.0);
    vec2 _219 = vec2(fma(_216, _209, _191), fma(_216, _210, _192));
    precise float _222 = spvNMin(sqrt(dp2_f32(_219, _219)), spvNMin(sqrt(dp2_f32(_204, _204)), sqrt(dp2_f32(_189, _189))));
    precise float _227 = abs(dFdy(_222)) + abs(dFdx(_222));
    precise float _231 = fma(-_227, 0.5, cb0._m18.x);
    precise float _233 = _222 - _231;
    precise float _234 = fma(_227, 0.5, cb0._m18.x) - _231;
    precise float _235 = _233 / _234;
    precise float _236 = spvNClamp(_235, 0.0, 1.0);
    precise float _250 = cb0._m13.x - cb0._m12.x;
    precise float _251 = cb0._m13.y - cb0._m12.y;
    precise float _252 = cb0._m13.z - cb0._m12.z;
    precise float _253 = cb0._m13.w - cb0._m12.w;
    precise float _254 = fma(_236, _250, cb0._m12.x);
    precise float _255 = fma(_236, _251, cb0._m12.y);
    precise float _256 = fma(_236, _252, cb0._m12.z);
    precise float _257 = fma(_236, _253, cb0._m12.w);
    precise float _272 = TEXCOORD1.y * cb0._m6.x;
    precise float _273 = TEXCOORD1.y * cb0._m6.y;
    precise float _290 = fma(cb0._m8.x, TEXCOORD1.z, fma(cb0._m4.x, TEXCOORD1.x, _272)) + cb0._m10.x;
    precise float _291 = fma(cb0._m8.y, TEXCOORD1.z, fma(cb0._m4.y, TEXCOORD1.x, _273)) + cb0._m10.y;
    float _369;
    float _370;
    float _371;
    float _372;
    if (cb3._m0.x == 1.0)
    {
        bool _301 = cb3._m0.y == 1.0;
        precise float _308 = TEXCOORD1.y * cb3._m3.x;
        precise float _309 = TEXCOORD1.y * cb3._m3.y;
        precise float _310 = TEXCOORD1.y * cb3._m3.z;
        precise float _332 = fma(cb3._m5.x, TEXCOORD1.z, fma(cb3._m1.x, TEXCOORD1.x, _308)) + cb3._m7.x;
        precise float _333 = fma(cb3._m5.y, TEXCOORD1.z, fma(cb3._m1.y, TEXCOORD1.x, _309)) + cb3._m7.y;
        precise float _334 = fma(cb3._m5.z, TEXCOORD1.z, fma(cb3._m1.z, TEXCOORD1.x, _310)) + cb3._m7.z;
        precise float _343 = (_301 ? _332 : TEXCOORD1.x) - cb3._m11.x;
        precise float _344 = (_301 ? _333 : TEXCOORD1.y) - cb3._m11.y;
        precise float _345 = (_301 ? _334 : TEXCOORD1.z) - cb3._m11.z;
        precise float _351 = _343 * cb3._m9.x;
        precise float _352 = _344 * cb3._m9.y;
        precise float _353 = _345 * cb3._m9.z;
        vec4 _364 = texture(sampler3D(t1, s0), vec3(spvNMax(fma(cb3._m0.z, 0.5, 0.75), fma(_351, 0.25, 0.75)), _352, _353));
        _369 = _364.w;
        _370 = _364.z;
        _371 = _364.y;
        _372 = _364.x;
    }
    else
    {
        _369 = 1.0;
        _370 = 1.0;
        _371 = 1.0;
        _372 = 1.0;
    }
    precise float _386 = spvNClamp(dp4_f32(vec4(_372, _371, _370, _369), cb2._m46), 0.0, 1.0) * texture(sampler2D(t0, s1), vec2(_290, _291)).w;
    precise float _387 = fma(_236, -_254, _254) * _386;
    precise float _388 = fma(_236, -_255, _255) * _386;
    precise float _389 = fma(_236, -_256, _256) * _386;
    precise float _396 = _387 * cb0._m2.x;
    precise float _397 = _388 * cb0._m2.y;
    precise float _398 = _389 * cb0._m2.z;
    precise float _399 = fma(_236, -_257, _257) * cb0._m2.w;
    SV_Target.x = _396;
    SV_Target.y = _397;
    SV_Target.z = _398;
    SV_Target.w = _399;
}

