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
layout(set = 0, binding = 6) uniform sampler s2;
layout(set = 0, binding = 7) uniform texture2D t0;
layout(set = 0, binding = 8) uniform textureCube t1;
layout(set = 0, binding = 9) uniform texture3D t2;

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
    precise float _116 = a.x * b.x;
    return fma(a.y, b.y, _116);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _99 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _99)));
}

float dp3_f32(vec3 a, vec3 b)
{
    precise float _84 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _84));
}

void main()
{
    precise float _126 = TEXCOORD1.x * 1000.0;
    precise float _129 = sin(roundEven(_126)) * 43758.546875;
    precise float _131 = fract(_129) - 0.5;
    precise float _136 = _131 * cb0._m18.w;
    precise float _139 = fma(_136, 0.004999999888241291046142578125, TEXCOORD1.z);
    precise float _140 = _139 * 500.0;
    precise float _141 = _139 * 10.0;
    precise float _145 = sin(roundEven(_140)) * 43758.546875;
    precise float _147 = fract(_145) - 0.5;
    precise float _148 = _147 * cb0._m18.w;
    precise float _153 = roundEven(_141) + cb1.m.x;
    precise float _154 = _153 * 250.0;
    precise float _157 = sin(roundEven(_154)) * 43758.546875;
    precise float _159 = fract(_157) - 0.5;
    precise float _160 = fma(_159, 0.004999999888241291046142578125, fma(_148, 0.004999999888241291046142578125, TEXCOORD1.x));
    precise float _161 = _160 * 10.0;
    precise float _163 = roundEven(_161) + cb1.m.x;
    precise float _164 = _163 * 250.0;
    precise float _167 = sin(roundEven(_164)) * 43758.546875;
    precise float _169 = fract(_167) - 0.5;
    precise float _170 = fma(_169, 0.004999999888241291046142578125, _139);
    precise float _180 = cb0._m16.x - cb0._m14.x;
    precise float _181 = cb0._m16.y - cb0._m14.y;
    vec2 _182 = vec2(_180, _181);
    float _183 = dp2_f32(_182, _182);
    precise float _184 = inversesqrt(_183);
    precise float _185 = _184 * _180;
    precise float _186 = _184 * _181;
    precise float _187 = 0.0 - _186;
    precise float _192 = fma(_180, _184, _187) * cb0._m18.z;
    precise float _193 = fma(_181, _184, _185) * cb0._m18.z;
    precise float _198 = fma(_180, _184, -_187) * cb0._m18.z;
    precise float _199 = fma(_181, _184, -_185) * cb0._m18.z;
    precise float _200 = _160 - cb0._m14.x;
    precise float _201 = _170 - cb0._m14.y;
    precise float _204 = dp2_f32(vec2(_200, _201), _182) / _183;
    precise float _206 = -spvNClamp(_204, 0.0, 1.0);
    vec2 _209 = vec2(fma(_206, _180, _200), fma(_206, _181, _201));
    precise float _211 = _160 - cb0._m16.x;
    precise float _212 = _170 - cb0._m16.y;
    vec2 _213 = vec2(_211, _212);
    precise float _214 = -_192;
    precise float _215 = -_193;
    vec2 _216 = vec2(_214, _215);
    precise float _219 = dp2_f32(_213, _216) / dp2_f32(_216, _216);
    precise float _221 = -spvNClamp(_219, 0.0, 1.0);
    vec2 _224 = vec2(fma(_221, _214, _211), fma(_221, _215, _212));
    precise float _229 = -_198;
    precise float _230 = -_199;
    vec2 _231 = vec2(_229, _230);
    precise float _234 = dp2_f32(_213, _231) / dp2_f32(_231, _231);
    precise float _236 = -spvNClamp(_234, 0.0, 1.0);
    vec2 _239 = vec2(fma(_236, _229, _211), fma(_236, _230, _212));
    precise float _242 = spvNMin(sqrt(dp2_f32(_239, _239)), spvNMin(sqrt(dp2_f32(_224, _224)), sqrt(dp2_f32(_209, _209))));
    precise float _247 = abs(dFdy(_242)) + abs(dFdx(_242));
    precise float _252 = cb0._m18.y + cb0._m18.x;
    precise float _253 = -_247;
    precise float _254 = fma(_253, 0.5, _252);
    precise float _255 = _242 - _254;
    precise float _257 = fma(_247, 0.5, _252) - _254;
    precise float _258 = _255 / _257;
    precise float _259 = spvNClamp(_258, 0.0, 1.0);
    precise float _273 = cb0._m13.x - cb0._m12.x;
    precise float _274 = cb0._m13.y - cb0._m12.y;
    precise float _275 = cb0._m13.z - cb0._m12.z;
    precise float _276 = cb0._m13.w - cb0._m12.w;
    precise float _277 = fma(_259, _273, cb0._m12.x);
    precise float _278 = fma(_259, _274, cb0._m12.y);
    precise float _279 = fma(_259, _275, cb0._m12.z);
    precise float _280 = fma(_259, _276, cb0._m12.w);
    precise float _281 = fma(cb0._m18.y, 2.0, cb0._m18.x);
    precise float _282 = fma(_253, 0.5, _281);
    precise float _284 = _242 - _282;
    precise float _285 = fma(_247, 0.5, _281) - _282;
    precise float _286 = _284 / _285;
    precise float _287 = spvNClamp(_286, 0.0, 1.0);
    precise float _304 = TEXCOORD1.y * cb0._m6.x;
    precise float _305 = TEXCOORD1.y * cb0._m6.y;
    precise float _306 = TEXCOORD1.y * cb0._m6.z;
    precise float _328 = fma(cb0._m8.x, TEXCOORD1.z, fma(cb0._m4.x, TEXCOORD1.x, _304)) + cb0._m10.x;
    precise float _329 = fma(cb0._m8.y, TEXCOORD1.z, fma(cb0._m4.y, TEXCOORD1.x, _305)) + cb0._m10.y;
    precise float _330 = fma(cb0._m8.z, TEXCOORD1.z, fma(cb0._m4.z, TEXCOORD1.x, _306)) + cb0._m10.z;
    float _407;
    float _408;
    float _409;
    float _410;
    if (cb3._m0.x == 1.0)
    {
        bool _340 = cb3._m0.y == 1.0;
        precise float _346 = TEXCOORD1.y * cb3._m3.x;
        precise float _347 = TEXCOORD1.y * cb3._m3.y;
        precise float _348 = TEXCOORD1.y * cb3._m3.z;
        precise float _370 = fma(cb3._m5.x, TEXCOORD1.z, fma(cb3._m1.x, TEXCOORD1.x, _346)) + cb3._m7.x;
        precise float _371 = fma(cb3._m5.y, TEXCOORD1.z, fma(cb3._m1.y, TEXCOORD1.x, _347)) + cb3._m7.y;
        precise float _372 = fma(cb3._m5.z, TEXCOORD1.z, fma(cb3._m1.z, TEXCOORD1.x, _348)) + cb3._m7.z;
        precise float _381 = (_340 ? _370 : TEXCOORD1.x) - cb3._m11.x;
        precise float _382 = (_340 ? _371 : TEXCOORD1.y) - cb3._m11.y;
        precise float _383 = (_340 ? _372 : TEXCOORD1.z) - cb3._m11.z;
        precise float _389 = _381 * cb3._m9.x;
        precise float _390 = _382 * cb3._m9.y;
        precise float _391 = _383 * cb3._m9.z;
        vec4 _402 = texture(sampler3D(t2, s0), vec3(spvNMax(fma(_389, 0.25, 0.75), fma(cb3._m0.z, 0.5, 0.75)), _390, _391));
        _407 = _402.w;
        _408 = _402.z;
        _409 = _402.y;
        _410 = _402.x;
    }
    else
    {
        _407 = 1.0;
        _408 = 1.0;
        _409 = 1.0;
        _410 = 1.0;
    }
    vec3 _417 = vec3(_328, _329, _330);
    precise float _432 = texture(sampler2D(t0, s2), vec2(dp3_f32(_417, _417))).x * texture(samplerCube(t1, s1), _417).w;
    precise float _433 = spvNClamp(dp4_f32(vec4(_410, _409, _408, _407), cb2._m46), 0.0, 1.0) * _432;
    precise float _434 = fma(_287, -_277, _277) * _433;
    precise float _435 = fma(_287, -_278, _278) * _433;
    precise float _436 = fma(_287, -_279, _279) * _433;
    precise float _443 = _434 * cb0._m2.x;
    precise float _444 = _435 * cb0._m2.y;
    precise float _445 = _436 * cb0._m2.z;
    precise float _446 = fma(_287, -_280, _280) * cb0._m2.w;
    SV_Target.x = _443;
    SV_Target.y = _444;
    SV_Target.z = _445;
    SV_Target.w = _446;
}

