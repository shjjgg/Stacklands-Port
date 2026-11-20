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
    vec3 _m12;
    float _m13;
    vec4 _m14;
    vec3 _m15;
    uint _m16;
    vec2 _m17;
    uvec2 _m18;
    vec4 _m19;
    uvec4 _m20;
    vec4 _m21;
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
} cb2;

layout(set = 0, binding = 3) uniform sampler s0;
layout(set = 0, binding = 4) uniform sampler s1;
layout(set = 0, binding = 5) uniform texture2D t0;
layout(set = 0, binding = 6) uniform texture3D t1;

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

float dp2_f32(vec2 a, vec2 b)
{
    precise float _107 = a.x * b.x;
    return fma(a.y, b.y, _107);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _89 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _89)));
}

void main()
{
    precise float _117 = TEXCOORD1.x * 1000.0;
    precise float _120 = sin(roundEven(_117)) * 43758.546875;
    precise float _122 = fract(_120) - 0.5;
    precise float _127 = _122 * cb0._m21.z;
    precise float _130 = fma(_127, 0.004999999888241291046142578125, TEXCOORD1.z);
    precise float _131 = _130 * 500.0;
    precise float _134 = sin(roundEven(_131)) * 43758.546875;
    precise float _136 = fract(_134) - 0.5;
    precise float _137 = _136 * cb0._m21.z;
    precise float _138 = fma(_137, 0.004999999888241291046142578125, TEXCOORD1.x);
    precise float _143 = cb0._m19.x - cb0._m17.x;
    precise float _144 = fma(_143, 0.5, cb0._m17.x);
    float _150;
    float _155;
    _150 = 0.0;
    _155 = 100000.0;
    float _151;
    precise float _154;
    float _156;
    uint _158;
    float _153 = 0.0;
    uint _157 = 0u;
    for (;;)
    {
        if (int(_157) >= 3)
        {
            break;
        }
        bool _172 = _157 == 0u;
        float _178 = _172 ? cb0._m17.x : (((_157 >= 1u) && (_157 < 3u)) ? _144 : cb0._m19.x);
        float _179 = _172 ? cb0._m17.y : ((_157 == 1u) ? cb0._m17.y : cb0._m19.y);
        _158 = _157 + 1u;
        precise float _186 = (((_158 < 3u) && (_158 >= 1u)) ? _144 : cb0._m19.x) - _178;
        precise float _187 = ((_158 == 1u) ? cb0._m17.y : cb0._m19.y) - _179;
        precise float _188 = _138 - _178;
        precise float _189 = _130 - _179;
        vec2 _190 = vec2(_188, _189);
        vec2 _191 = vec2(_186, _187);
        float _193 = dp2_f32(_191, _191);
        precise float _194 = dp2_f32(_190, _191) / _193;
        precise float _195 = spvNClamp(_194, 0.0, 1.0);
        precise float _201 = -_195;
        vec2 _204 = vec2(fma(_201, _186, _188), fma(_201, _187, _189));
        precise float _207 = sqrt(dp2_f32(_204, _204)) * ((dp2_f32(vec2(_187, -_186), _190) > 0.0) ? 1.0 : (-1.0));
        precise float _208 = sqrt(_193);
        bool _211 = abs(_207) < abs(_155);
        _151 = _211 ? fma(_195, _208, _153) : _150;
        _156 = _211 ? _207 : _155;
        _154 = _153 + _208;
        _150 = _151;
        _153 = _154;
        _155 = _156;
        _157 = _158;
        continue;
    }
    precise float _213 = abs(_155);
    precise float _218 = abs(dFdx(_213)) + abs(dFdy(_213));
    precise float _219 = _150 * 3.5;
    bool _221 = fract(_219) > 0.800000011920928955078125;
    precise float _222 = _213 * 0.800000011920928955078125;
    float _224 = _221 ? _222 : _213;
    precise float _229 = cb0._m21.y + cb0._m21.x;
    precise float _230 = -_218;
    precise float _231 = fma(_230, 0.5, _229);
    precise float _232 = _224 - _231;
    precise float _234 = fma(_218, 0.5, _229) - _231;
    precise float _235 = _232 / _234;
    precise float _236 = spvNClamp(_235, 0.0, 1.0);
    float _248 = _221 ? cb0._m15.x : cb0._m12.x;
    float _249 = _221 ? cb0._m15.y : cb0._m12.y;
    float _250 = _221 ? cb0._m15.z : cb0._m12.z;
    precise float _251 = _229 * 0.300000011920928955078125;
    precise float _252 = _229 * 0.800000011920928955078125;
    precise float _253 = _229 * 0.5;
    precise float _254 = _229 * 1.10000002384185791015625;
    precise float _255 = -_155;
    precise float _264 = _248 * cb0._m21.w;
    precise float _265 = _249 * cb0._m21.w;
    precise float _266 = _250 * cb0._m21.w;
    bool _269 = (((_255 < _254) && (_253 < _255)) && _221) || (((_251 < _255) && (_255 < _252)) && (!_221));
    float _270 = _269 ? _264 : _248;
    float _271 = _269 ? _265 : _249;
    float _272 = _269 ? _266 : _250;
    precise float _282 = cb0._m14.x - _270;
    precise float _283 = cb0._m14.y - _271;
    precise float _284 = cb0._m14.z - _272;
    precise float _285 = cb0._m14.w - cb0._m13;
    precise float _286 = fma(_236, _282, _270);
    precise float _287 = fma(_236, _283, _271);
    precise float _288 = fma(_236, _284, _272);
    precise float _289 = fma(_236, _285, cb0._m13);
    precise float _290 = fma(cb0._m21.y, 2.0, cb0._m21.x);
    precise float _291 = fma(_230, 0.5, _290);
    precise float _293 = _224 - _291;
    precise float _294 = fma(_218, 0.5, _290) - _291;
    precise float _295 = _293 / _294;
    precise float _296 = spvNClamp(_295, 0.0, 1.0);
    precise float _311 = TEXCOORD1.y * cb0._m6.x;
    precise float _312 = TEXCOORD1.y * cb0._m6.y;
    precise float _329 = fma(cb0._m8.x, TEXCOORD1.z, fma(cb0._m4.x, TEXCOORD1.x, _311)) + cb0._m10.x;
    precise float _330 = fma(cb0._m8.y, TEXCOORD1.z, fma(cb0._m4.y, TEXCOORD1.x, _312)) + cb0._m10.y;
    float _406;
    float _407;
    float _408;
    float _409;
    if (cb2._m0.x == 1.0)
    {
        bool _339 = cb2._m0.y == 1.0;
        precise float _345 = TEXCOORD1.y * cb2._m3.x;
        precise float _346 = TEXCOORD1.y * cb2._m3.y;
        precise float _347 = TEXCOORD1.y * cb2._m3.z;
        precise float _369 = fma(cb2._m5.x, TEXCOORD1.z, fma(cb2._m1.x, TEXCOORD1.x, _345)) + cb2._m7.x;
        precise float _370 = fma(cb2._m5.y, TEXCOORD1.z, fma(cb2._m1.y, TEXCOORD1.x, _346)) + cb2._m7.y;
        precise float _371 = fma(cb2._m5.z, TEXCOORD1.z, fma(cb2._m1.z, TEXCOORD1.x, _347)) + cb2._m7.z;
        precise float _380 = (_339 ? _369 : TEXCOORD1.x) - cb2._m11.x;
        precise float _381 = (_339 ? _370 : TEXCOORD1.y) - cb2._m11.y;
        precise float _382 = (_339 ? _371 : TEXCOORD1.z) - cb2._m11.z;
        precise float _388 = _380 * cb2._m9.x;
        precise float _389 = _381 * cb2._m9.y;
        precise float _390 = _382 * cb2._m9.z;
        vec4 _401 = texture(sampler3D(t1, s0), vec3(spvNMax(fma(cb2._m0.z, 0.5, 0.75), fma(_388, 0.25, 0.75)), _389, _390));
        _406 = _401.w;
        _407 = _401.z;
        _408 = _401.y;
        _409 = _401.x;
    }
    else
    {
        _406 = 1.0;
        _407 = 1.0;
        _408 = 1.0;
        _409 = 1.0;
    }
    precise float _423 = spvNClamp(dp4_f32(vec4(_409, _408, _407, _406), cb1._m46), 0.0, 1.0) * texture(sampler2D(t0, s1), vec2(_329, _330)).w;
    precise float _424 = fma(_296, -_286, _286) * _423;
    precise float _425 = fma(_296, -_287, _287) * _423;
    precise float _426 = fma(_296, -_288, _288) * _423;
    precise float _433 = _424 * cb0._m2.x;
    precise float _434 = _425 * cb0._m2.y;
    precise float _435 = _426 * cb0._m2.z;
    precise float _436 = fma(_296, -_289, _289) * cb0._m2.w;
    SV_Target.x = _433;
    SV_Target.y = _434;
    SV_Target.z = _435;
    SV_Target.w = _436;
}

