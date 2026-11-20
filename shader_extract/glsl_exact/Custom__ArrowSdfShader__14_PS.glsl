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
    precise float _98 = a.x * b.x;
    return fma(a.y, b.y, _98);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _80 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _80)));
}

void main()
{
    precise float _108 = TEXCOORD1.x * 1000.0;
    precise float _111 = sin(roundEven(_108)) * 43758.546875;
    precise float _113 = fract(_111) - 0.5;
    precise float _118 = _113 * cb0._m18.w;
    precise float _121 = fma(_118, 0.004999999888241291046142578125, TEXCOORD1.z);
    precise float _122 = _121 * 500.0;
    precise float _123 = _121 * 10.0;
    precise float _127 = sin(roundEven(_122)) * 43758.546875;
    precise float _129 = fract(_127) - 0.5;
    precise float _130 = _129 * cb0._m18.w;
    precise float _135 = roundEven(_123) + cb1.m.x;
    precise float _136 = _135 * 250.0;
    precise float _139 = sin(roundEven(_136)) * 43758.546875;
    precise float _141 = fract(_139) - 0.5;
    precise float _142 = fma(_141, 0.004999999888241291046142578125, fma(_130, 0.004999999888241291046142578125, TEXCOORD1.x));
    precise float _143 = _142 * 10.0;
    precise float _145 = roundEven(_143) + cb1.m.x;
    precise float _146 = _145 * 250.0;
    precise float _149 = sin(roundEven(_146)) * 43758.546875;
    precise float _151 = fract(_149) - 0.5;
    precise float _152 = fma(_151, 0.004999999888241291046142578125, _121);
    precise float _162 = cb0._m16.x - cb0._m14.x;
    precise float _163 = cb0._m16.y - cb0._m14.y;
    vec2 _164 = vec2(_162, _163);
    float _165 = dp2_f32(_164, _164);
    precise float _166 = inversesqrt(_165);
    precise float _167 = _166 * _162;
    precise float _168 = _166 * _163;
    precise float _169 = 0.0 - _168;
    precise float _174 = fma(_162, _166, _169) * cb0._m18.z;
    precise float _175 = fma(_163, _166, _167) * cb0._m18.z;
    precise float _180 = fma(_162, _166, -_169) * cb0._m18.z;
    precise float _181 = fma(_163, _166, -_167) * cb0._m18.z;
    precise float _182 = _142 - cb0._m14.x;
    precise float _183 = _152 - cb0._m14.y;
    precise float _186 = dp2_f32(vec2(_182, _183), _164) / _165;
    precise float _188 = -spvNClamp(_186, 0.0, 1.0);
    vec2 _191 = vec2(fma(_188, _162, _182), fma(_188, _163, _183));
    precise float _193 = _142 - cb0._m16.x;
    precise float _194 = _152 - cb0._m16.y;
    vec2 _195 = vec2(_193, _194);
    precise float _196 = -_174;
    precise float _197 = -_175;
    vec2 _198 = vec2(_196, _197);
    precise float _201 = dp2_f32(_195, _198) / dp2_f32(_198, _198);
    precise float _203 = -spvNClamp(_201, 0.0, 1.0);
    vec2 _206 = vec2(fma(_203, _196, _193), fma(_203, _197, _194));
    precise float _211 = -_180;
    precise float _212 = -_181;
    vec2 _213 = vec2(_211, _212);
    precise float _216 = dp2_f32(_195, _213) / dp2_f32(_213, _213);
    precise float _218 = -spvNClamp(_216, 0.0, 1.0);
    vec2 _221 = vec2(fma(_218, _211, _193), fma(_218, _212, _194));
    precise float _224 = spvNMin(sqrt(dp2_f32(_221, _221)), spvNMin(sqrt(dp2_f32(_206, _206)), sqrt(dp2_f32(_191, _191))));
    precise float _229 = abs(dFdy(_224)) + abs(dFdx(_224));
    precise float _234 = cb0._m18.y + cb0._m18.x;
    precise float _235 = -_229;
    precise float _236 = fma(_235, 0.5, _234);
    precise float _237 = _224 - _236;
    precise float _239 = fma(_229, 0.5, _234) - _236;
    precise float _240 = _237 / _239;
    precise float _241 = spvNClamp(_240, 0.0, 1.0);
    precise float _255 = cb0._m13.x - cb0._m12.x;
    precise float _256 = cb0._m13.y - cb0._m12.y;
    precise float _257 = cb0._m13.z - cb0._m12.z;
    precise float _258 = cb0._m13.w - cb0._m12.w;
    precise float _259 = fma(_241, _255, cb0._m12.x);
    precise float _260 = fma(_241, _256, cb0._m12.y);
    precise float _261 = fma(_241, _257, cb0._m12.z);
    precise float _262 = fma(_241, _258, cb0._m12.w);
    precise float _263 = fma(cb0._m18.y, 2.0, cb0._m18.x);
    precise float _264 = fma(_235, 0.5, _263);
    precise float _266 = _224 - _264;
    precise float _267 = fma(_229, 0.5, _263) - _264;
    precise float _268 = _266 / _267;
    precise float _269 = spvNClamp(_268, 0.0, 1.0);
    precise float _284 = TEXCOORD1.y * cb0._m6.x;
    precise float _285 = TEXCOORD1.y * cb0._m6.y;
    precise float _302 = fma(cb0._m8.x, TEXCOORD1.z, fma(cb0._m4.x, TEXCOORD1.x, _284)) + cb0._m10.x;
    precise float _303 = fma(cb0._m8.y, TEXCOORD1.z, fma(cb0._m4.y, TEXCOORD1.x, _285)) + cb0._m10.y;
    float _381;
    float _382;
    float _383;
    float _384;
    if (cb3._m0.x == 1.0)
    {
        bool _313 = cb3._m0.y == 1.0;
        precise float _320 = TEXCOORD1.y * cb3._m3.x;
        precise float _321 = TEXCOORD1.y * cb3._m3.y;
        precise float _322 = TEXCOORD1.y * cb3._m3.z;
        precise float _344 = fma(cb3._m5.x, TEXCOORD1.z, fma(cb3._m1.x, TEXCOORD1.x, _320)) + cb3._m7.x;
        precise float _345 = fma(cb3._m5.y, TEXCOORD1.z, fma(cb3._m1.y, TEXCOORD1.x, _321)) + cb3._m7.y;
        precise float _346 = fma(cb3._m5.z, TEXCOORD1.z, fma(cb3._m1.z, TEXCOORD1.x, _322)) + cb3._m7.z;
        precise float _355 = (_313 ? _344 : TEXCOORD1.x) - cb3._m11.x;
        precise float _356 = (_313 ? _345 : TEXCOORD1.y) - cb3._m11.y;
        precise float _357 = (_313 ? _346 : TEXCOORD1.z) - cb3._m11.z;
        precise float _363 = _355 * cb3._m9.x;
        precise float _364 = _356 * cb3._m9.y;
        precise float _365 = _357 * cb3._m9.z;
        vec4 _376 = texture(sampler3D(t1, s0), vec3(spvNMax(fma(cb3._m0.z, 0.5, 0.75), fma(_363, 0.25, 0.75)), _364, _365));
        _381 = _376.w;
        _382 = _376.z;
        _383 = _376.y;
        _384 = _376.x;
    }
    else
    {
        _381 = 1.0;
        _382 = 1.0;
        _383 = 1.0;
        _384 = 1.0;
    }
    precise float _398 = spvNClamp(dp4_f32(vec4(_384, _383, _382, _381), cb2._m46), 0.0, 1.0) * texture(sampler2D(t0, s1), vec2(_302, _303)).w;
    precise float _399 = fma(_269, -_259, _259) * _398;
    precise float _400 = fma(_269, -_260, _260) * _398;
    precise float _401 = fma(_269, -_261, _261) * _398;
    precise float _408 = _399 * cb0._m2.x;
    precise float _409 = _400 * cb0._m2.y;
    precise float _410 = _401 * cb0._m2.z;
    precise float _411 = fma(_269, -_262, _262) * cb0._m2.w;
    SV_Target.x = _408;
    SV_Target.y = _409;
    SV_Target.z = _410;
    SV_Target.w = _411;
}

