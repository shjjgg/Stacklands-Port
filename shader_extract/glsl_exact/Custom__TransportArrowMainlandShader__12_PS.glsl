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
    vec4 _m10;
    vec2 _m11;
    uvec2 _m12;
    vec2 _m13;
    uvec2 _m14;
    vec2 _m15;
    uvec2 _m16;
    vec4 _m17;
    vec4 _m18;
    vec4 _m19;
    vec4 _m20;
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
layout(set = 0, binding = 5) uniform sampler s2;
layout(set = 0, binding = 6) uniform texture2D t0;
layout(set = 0, binding = 7) uniform texture2D t1;
layout(set = 0, binding = 8) uniform texture3D t2;

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
    precise float _119 = a.x * b.x;
    return fma(a.y, b.y, _119);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _102 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _102)));
}

float dp3_f32(vec3 a, vec3 b)
{
    precise float _87 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _87));
}

void main()
{
    precise float _129 = TEXCOORD1.x * 1000.0;
    precise float _132 = sin(roundEven(_129)) * 43758.546875;
    precise float _134 = fract(_132) - 0.5;
    precise float _139 = _134 * cb0._m17.z;
    precise float _142 = fma(_139, 0.004999999888241291046142578125, TEXCOORD1.z);
    precise float _143 = _142 * 500.0;
    precise float _146 = sin(roundEven(_143)) * 43758.546875;
    precise float _148 = fract(_146) - 0.5;
    precise float _149 = _148 * cb0._m17.z;
    precise float _150 = fma(_149, 0.004999999888241291046142578125, TEXCOORD1.x);
    float _152;
    float _157;
    _152 = 0.0;
    _157 = 100000.0;
    float _153;
    precise float _156;
    float _158;
    precise float _160;
    float _155 = 0.0;
    float _159 = 0.0;
    for (;;)
    {
        if (_159 > 1.0)
        {
            break;
        }
        precise float _167 = spvNMin(_159, 1.0);
        precise float _168 = 1.0 - _167;
        precise float _169 = _168 * _168;
        float _172 = dp2_f32(vec2(_167), vec2(_168));
        precise float _178 = _172 * cb0._m15.x;
        precise float _179 = _172 * cb0._m15.y;
        precise float _186 = _167 * _167;
        precise float _191 = fma(_186, cb0._m13.x, fma(_169, cb0._m11.x, _178));
        precise float _192 = fma(_186, cb0._m13.y, fma(_169, cb0._m11.y, _179));
        _160 = _159 + 0.100000001490116119384765625;
        precise float _193 = spvNMin(_160, 1.0);
        precise float _194 = 1.0 - _193;
        precise float _195 = _194 * _194;
        float _198 = dp2_f32(vec2(_193), vec2(_194));
        precise float _199 = _198 * cb0._m15.x;
        precise float _200 = _198 * cb0._m15.y;
        precise float _203 = _193 * _193;
        precise float _206 = fma(_203, cb0._m13.x, fma(_195, cb0._m11.x, _199)) - _191;
        precise float _207 = fma(_203, cb0._m13.y, fma(_195, cb0._m11.y, _200)) - _192;
        precise float _208 = _150 - _191;
        precise float _209 = _142 - _192;
        vec2 _210 = vec2(_208, _209);
        vec2 _211 = vec2(_206, _207);
        float _213 = dp2_f32(_211, _211);
        precise float _214 = dp2_f32(_210, _211) / _213;
        precise float _215 = spvNClamp(_214, 0.0, 1.0);
        precise float _221 = -_215;
        vec2 _224 = vec2(fma(_221, _206, _208), fma(_221, _207, _209));
        precise float _227 = sqrt(dp2_f32(_224, _224)) * ((dp2_f32(vec2(_207, -_206), _210) > 0.0) ? 1.0 : (-1.0));
        precise float _228 = sqrt(_213);
        bool _231 = abs(_227) < abs(_157);
        _153 = _231 ? fma(_215, _228, _155) : _152;
        _158 = _231 ? _227 : _157;
        _156 = _228 + _155;
        _152 = _153;
        _155 = _156;
        _157 = _158;
        _159 = _160;
        continue;
    }
    precise float _233 = abs(_157);
    precise float _238 = abs(dFdy(_233)) + abs(dFdx(_233));
    bool _241 = cb0._m18.y > 0.5;
    precise float _259 = _157 * 125.0;
    precise float _260 = _152 * 125.0;
    precise float _261 = _157 * 31250.0;
    precise float _264 = sin(roundEven(_261)) * 43758.546875;
    precise float _266 = fract(_264) - 0.5;
    precise float _269 = _266 * cb0._m18.x;
    precise float _270 = fma(_269, 0.004999999888241291046142578125, _260);
    precise float _271 = _270 * 250.0;
    precise float _274 = sin(roundEven(_271)) * 43758.546875;
    precise float _276 = fract(_274) - 0.5;
    precise float _277 = _276 * cb0._m18.x;
    precise float _279 = fma(_277, 0.004999999888241291046142578125, _259) * 0.800000011920928955078125;
    precise float _282 = sin(_270) * sin(_279);
    bool _283 = _282 > 0.1500000059604644775390625;
    float _294 = _283 ? (_241 ? cb0._m19.x : cb0._m10.x) : (_241 ? cb0._m19.x : cb0._m8.x);
    float _295 = _283 ? (_241 ? cb0._m19.y : cb0._m10.y) : (_241 ? cb0._m19.y : cb0._m8.y);
    float _296 = _283 ? (_241 ? cb0._m19.z : cb0._m10.z) : (_241 ? cb0._m19.z : cb0._m8.z);
    float _297 = _283 ? (_241 ? cb0._m19.w : cb0._m10.w) : (_241 ? cb0._m19.w : cb0._m8.w);
    precise float _302 = cb0._m17.y + cb0._m17.x;
    precise float _303 = -_238;
    precise float _304 = fma(_303, 0.5, _302);
    precise float _306 = fma(_238, 0.5, _302) - _304;
    precise float _307 = _233 - _304;
    precise float _308 = _307 / _306;
    precise float _309 = spvNClamp(_308, 0.0, 1.0);
    precise float _326 = (_241 ? cb0._m20.x : cb0._m9.x) - _294;
    precise float _327 = (_241 ? cb0._m20.y : cb0._m9.y) - _295;
    precise float _328 = (_241 ? cb0._m20.z : cb0._m9.z) - _296;
    precise float _329 = (_241 ? cb0._m20.w : cb0._m9.w) - _297;
    precise float _330 = fma(_309, _326, _294);
    precise float _331 = fma(_309, _327, _295);
    precise float _332 = fma(_309, _328, _296);
    precise float _333 = fma(_309, _329, _297);
    precise float _334 = fma(cb0._m17.y, 2.0, cb0._m17.x);
    precise float _335 = fma(_303, 0.5, _334);
    precise float _337 = fma(_238, 0.5, _334) - _335;
    precise float _338 = _233 - _335;
    precise float _339 = _338 / _337;
    precise float _340 = spvNClamp(_339, 0.0, 1.0);
    precise float _357 = TEXCOORD1.y * cb0._m5.x;
    precise float _358 = TEXCOORD1.y * cb0._m5.y;
    precise float _359 = TEXCOORD1.y * cb0._m5.z;
    precise float _360 = TEXCOORD1.y * cb0._m5.w;
    precise float _387 = fma(cb0._m6.x, TEXCOORD1.z, fma(cb0._m4.x, TEXCOORD1.x, _357)) + cb0._m7.x;
    precise float _388 = fma(cb0._m6.y, TEXCOORD1.z, fma(cb0._m4.y, TEXCOORD1.x, _358)) + cb0._m7.y;
    precise float _389 = fma(cb0._m6.z, TEXCOORD1.z, fma(cb0._m4.z, TEXCOORD1.x, _359)) + cb0._m7.z;
    precise float _390 = fma(cb0._m6.w, TEXCOORD1.z, fma(cb0._m4.w, TEXCOORD1.x, _360)) + cb0._m7.w;
    float _467;
    float _468;
    float _469;
    float _470;
    if (cb2._m0.x == 1.0)
    {
        bool _399 = cb2._m0.y == 1.0;
        precise float _406 = TEXCOORD1.y * cb2._m3.x;
        precise float _407 = TEXCOORD1.y * cb2._m3.y;
        precise float _408 = TEXCOORD1.y * cb2._m3.z;
        precise float _430 = fma(cb2._m5.x, TEXCOORD1.z, fma(cb2._m1.x, TEXCOORD1.x, _406)) + cb2._m7.x;
        precise float _431 = fma(cb2._m5.y, TEXCOORD1.z, fma(cb2._m1.y, TEXCOORD1.x, _407)) + cb2._m7.y;
        precise float _432 = fma(cb2._m5.z, TEXCOORD1.z, fma(cb2._m1.z, TEXCOORD1.x, _408)) + cb2._m7.z;
        precise float _441 = (_399 ? _430 : TEXCOORD1.x) - cb2._m11.x;
        precise float _442 = (_399 ? _431 : TEXCOORD1.y) - cb2._m11.y;
        precise float _443 = (_399 ? _432 : TEXCOORD1.z) - cb2._m11.z;
        precise float _449 = _441 * cb2._m9.x;
        precise float _450 = _442 * cb2._m9.y;
        precise float _451 = _443 * cb2._m9.z;
        vec4 _462 = texture(sampler3D(t2, s0), vec3(spvNMax(fma(_449, 0.25, 0.75), fma(cb2._m0.z, 0.5, 0.75)), _450, _451));
        _467 = _462.w;
        _468 = _462.z;
        _469 = _462.y;
        _470 = _462.x;
    }
    else
    {
        _467 = 1.0;
        _468 = 1.0;
        _469 = 1.0;
        _470 = 1.0;
    }
    precise float _479 = _387 / _390;
    precise float _480 = _388 / _390;
    precise float _481 = _479 + 0.5;
    precise float _482 = _480 + 0.5;
    precise float _490 = float(_389 > 0.0) * texture(sampler2D(t0, s1), vec2(_481, _482)).w;
    vec3 _491 = vec3(_387, _388, _389);
    precise float _499 = _490 * texture(sampler2D(t1, s2), vec2(dp3_f32(_491, _491))).x;
    precise float _500 = spvNClamp(dp4_f32(vec4(_470, _469, _468, _467), cb1._m46), 0.0, 1.0) * _499;
    precise float _501 = fma(_340, -_330, _330) * _500;
    precise float _502 = fma(_340, -_331, _331) * _500;
    precise float _503 = fma(_340, -_332, _332) * _500;
    precise float _510 = _501 * cb0._m2.x;
    precise float _511 = _502 * cb0._m2.y;
    precise float _512 = _503 * cb0._m2.z;
    precise float _513 = fma(_340, -_333, _333) * cb0._m2.w;
    SV_Target.x = _510;
    SV_Target.y = _511;
    SV_Target.z = _512;
    SV_Target.w = _513;
}

