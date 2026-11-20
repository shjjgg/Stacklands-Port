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
    vec4 _m6;
    vec4 _m7;
    vec4 _m8;
    vec4 _m9;
    vec2 _m10;
    uvec2 _m11;
    vec2 _m12;
    uvec2 _m13;
    vec4 _m14;
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
layout(set = 0, binding = 8) uniform texture2D t1;
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
    precise float _109 = a.x * b.x;
    return fma(a.y, b.y, _109);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _92 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _92)));
}

float dp3_f32(vec3 a, vec3 b)
{
    precise float _77 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _77));
}

void main()
{
    precise float _119 = TEXCOORD1.x * 1000.0;
    precise float _122 = sin(roundEven(_119)) * 43758.546875;
    precise float _124 = fract(_122) - 0.5;
    precise float _129 = _124 * cb0._m14.w;
    precise float _132 = fma(_129, 0.004999999888241291046142578125, TEXCOORD1.z);
    precise float _133 = _132 * 500.0;
    precise float _134 = _132 * 10.0;
    precise float _138 = sin(roundEven(_133)) * 43758.546875;
    precise float _140 = fract(_138) - 0.5;
    precise float _141 = _140 * cb0._m14.w;
    precise float _146 = roundEven(_134) + cb1.m.x;
    precise float _147 = _146 * 250.0;
    precise float _150 = sin(roundEven(_147)) * 43758.546875;
    precise float _152 = fract(_150) - 0.5;
    precise float _153 = fma(_152, 0.004999999888241291046142578125, fma(_141, 0.004999999888241291046142578125, TEXCOORD1.x));
    precise float _154 = _153 * 10.0;
    precise float _156 = roundEven(_154) + cb1.m.x;
    precise float _157 = _156 * 250.0;
    precise float _160 = sin(roundEven(_157)) * 43758.546875;
    precise float _162 = fract(_160) - 0.5;
    precise float _163 = fma(_162, 0.004999999888241291046142578125, _132);
    precise float _173 = cb0._m12.x - cb0._m10.x;
    precise float _174 = cb0._m12.y - cb0._m10.y;
    vec2 _175 = vec2(_173, _174);
    float _176 = dp2_f32(_175, _175);
    precise float _177 = inversesqrt(_176);
    precise float _178 = _177 * _173;
    precise float _179 = _177 * _174;
    precise float _180 = 0.0 - _179;
    precise float _185 = fma(_173, _177, _180) * cb0._m14.z;
    precise float _186 = fma(_174, _177, _178) * cb0._m14.z;
    precise float _191 = fma(_173, _177, -_180) * cb0._m14.z;
    precise float _192 = fma(_174, _177, -_178) * cb0._m14.z;
    precise float _193 = _153 - cb0._m10.x;
    precise float _194 = _163 - cb0._m10.y;
    precise float _197 = dp2_f32(vec2(_193, _194), _175) / _176;
    precise float _199 = -spvNClamp(_197, 0.0, 1.0);
    vec2 _202 = vec2(fma(_199, _173, _193), fma(_199, _174, _194));
    precise float _204 = _153 - cb0._m12.x;
    precise float _205 = _163 - cb0._m12.y;
    vec2 _206 = vec2(_204, _205);
    precise float _207 = -_185;
    precise float _208 = -_186;
    vec2 _209 = vec2(_207, _208);
    precise float _212 = dp2_f32(_206, _209) / dp2_f32(_209, _209);
    precise float _214 = -spvNClamp(_212, 0.0, 1.0);
    vec2 _217 = vec2(fma(_214, _207, _204), fma(_214, _208, _205));
    precise float _222 = -_191;
    precise float _223 = -_192;
    vec2 _224 = vec2(_222, _223);
    precise float _227 = dp2_f32(_206, _224) / dp2_f32(_224, _224);
    precise float _229 = -spvNClamp(_227, 0.0, 1.0);
    vec2 _232 = vec2(fma(_229, _222, _204), fma(_229, _223, _205));
    precise float _235 = spvNMin(sqrt(dp2_f32(_232, _232)), spvNMin(sqrt(dp2_f32(_217, _217)), sqrt(dp2_f32(_202, _202))));
    precise float _240 = abs(dFdy(_235)) + abs(dFdx(_235));
    precise float _244 = fma(-_240, 0.5, cb0._m14.x);
    precise float _246 = _235 - _244;
    precise float _247 = fma(_240, 0.5, cb0._m14.x) - _244;
    precise float _248 = _246 / _247;
    precise float _249 = spvNClamp(_248, 0.0, 1.0);
    precise float _263 = cb0._m9.x - cb0._m8.x;
    precise float _264 = cb0._m9.y - cb0._m8.y;
    precise float _265 = cb0._m9.z - cb0._m8.z;
    precise float _266 = cb0._m9.w - cb0._m8.w;
    precise float _267 = fma(_249, _263, cb0._m8.x);
    precise float _268 = fma(_249, _264, cb0._m8.y);
    precise float _269 = fma(_249, _265, cb0._m8.z);
    precise float _270 = fma(_249, _266, cb0._m8.w);
    precise float _287 = TEXCOORD1.y * cb0._m5.x;
    precise float _288 = TEXCOORD1.y * cb0._m5.y;
    precise float _289 = TEXCOORD1.y * cb0._m5.z;
    precise float _290 = TEXCOORD1.y * cb0._m5.w;
    precise float _317 = fma(cb0._m6.x, TEXCOORD1.z, fma(cb0._m4.x, TEXCOORD1.x, _287)) + cb0._m7.x;
    precise float _318 = fma(cb0._m6.y, TEXCOORD1.z, fma(cb0._m4.y, TEXCOORD1.x, _288)) + cb0._m7.y;
    precise float _319 = fma(cb0._m6.z, TEXCOORD1.z, fma(cb0._m4.z, TEXCOORD1.x, _289)) + cb0._m7.z;
    precise float _320 = fma(cb0._m6.w, TEXCOORD1.z, fma(cb0._m4.w, TEXCOORD1.x, _290)) + cb0._m7.w;
    float _398;
    float _399;
    float _400;
    float _401;
    if (cb3._m0.x == 1.0)
    {
        bool _330 = cb3._m0.y == 1.0;
        precise float _337 = TEXCOORD1.y * cb3._m3.x;
        precise float _338 = TEXCOORD1.y * cb3._m3.y;
        precise float _339 = TEXCOORD1.y * cb3._m3.z;
        precise float _361 = fma(cb3._m5.x, TEXCOORD1.z, fma(cb3._m1.x, TEXCOORD1.x, _337)) + cb3._m7.x;
        precise float _362 = fma(cb3._m5.y, TEXCOORD1.z, fma(cb3._m1.y, TEXCOORD1.x, _338)) + cb3._m7.y;
        precise float _363 = fma(cb3._m5.z, TEXCOORD1.z, fma(cb3._m1.z, TEXCOORD1.x, _339)) + cb3._m7.z;
        precise float _372 = (_330 ? _361 : TEXCOORD1.x) - cb3._m11.x;
        precise float _373 = (_330 ? _362 : TEXCOORD1.y) - cb3._m11.y;
        precise float _374 = (_330 ? _363 : TEXCOORD1.z) - cb3._m11.z;
        precise float _380 = _372 * cb3._m9.x;
        precise float _381 = _373 * cb3._m9.y;
        precise float _382 = _374 * cb3._m9.z;
        vec4 _393 = texture(sampler3D(t2, s0), vec3(spvNMax(fma(_380, 0.25, 0.75), fma(cb3._m0.z, 0.5, 0.75)), _381, _382));
        _398 = _393.w;
        _399 = _393.z;
        _400 = _393.y;
        _401 = _393.x;
    }
    else
    {
        _398 = 1.0;
        _399 = 1.0;
        _400 = 1.0;
        _401 = 1.0;
    }
    precise float _410 = _317 / _320;
    precise float _411 = _318 / _320;
    precise float _412 = _410 + 0.5;
    precise float _413 = _411 + 0.5;
    precise float _421 = float(_319 > 0.0) * texture(sampler2D(t0, s1), vec2(_412, _413)).w;
    vec3 _422 = vec3(_317, _318, _319);
    precise float _430 = _421 * texture(sampler2D(t1, s2), vec2(dp3_f32(_422, _422))).x;
    precise float _431 = spvNClamp(dp4_f32(vec4(_401, _400, _399, _398), cb2._m46), 0.0, 1.0) * _430;
    precise float _432 = fma(_249, -_267, _267) * _431;
    precise float _433 = fma(_249, -_268, _268) * _431;
    precise float _434 = fma(_249, -_269, _269) * _431;
    precise float _441 = _432 * cb0._m2.x;
    precise float _442 = _433 * cb0._m2.y;
    precise float _443 = _434 * cb0._m2.z;
    precise float _444 = fma(_249, -_270, _270) * cb0._m2.w;
    SV_Target.x = _441;
    SV_Target.y = _442;
    SV_Target.z = _443;
    SV_Target.w = _444;
}

