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
    vec4 _m11;
    vec2 _m12;
    uvec2 _m13;
    vec2 _m14;
    uvec2 _m15;
    vec2 _m16;
    uvec2 _m17;
    vec4 _m18;
    vec4 _m19;
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
    precise float _139 = _134 * cb0._m18.z;
    precise float _142 = fma(_139, 0.004999999888241291046142578125, TEXCOORD1.z);
    precise float _143 = _142 * 500.0;
    precise float _146 = sin(roundEven(_143)) * 43758.546875;
    precise float _148 = fract(_146) - 0.5;
    precise float _149 = _148 * cb0._m18.z;
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
        precise float _178 = _172 * cb0._m16.x;
        precise float _179 = _172 * cb0._m16.y;
        precise float _186 = _167 * _167;
        precise float _191 = fma(_186, cb0._m14.x, fma(_169, cb0._m12.x, _178));
        precise float _192 = fma(_186, cb0._m14.y, fma(_169, cb0._m12.y, _179));
        _160 = _159 + 0.100000001490116119384765625;
        precise float _193 = spvNMin(_160, 1.0);
        precise float _194 = 1.0 - _193;
        precise float _195 = _194 * _194;
        float _198 = dp2_f32(vec2(_193), vec2(_194));
        precise float _199 = _198 * cb0._m16.x;
        precise float _200 = _198 * cb0._m16.y;
        precise float _203 = _193 * _193;
        precise float _206 = fma(_203, cb0._m14.x, fma(_195, cb0._m12.x, _199)) - _191;
        precise float _207 = fma(_203, cb0._m14.y, fma(_195, cb0._m12.y, _200)) - _192;
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
    precise float _238 = abs(dFdx(_233)) + abs(dFdy(_233));
    precise float _239 = _152 * 8.0;
    precise float _240 = _152 * 2.5;
    precise float _242 = fract(_240);
    precise float _246 = cb0._m18.x * 0.5;
    bool _248 = (fract(_239) > 0.800000011920928955078125) && (_233 < _246);
    float _268 = (_240 >= 0.0) ? _242 : (-_242);
    precise float _269 = _268 * 4.0;
    precise float _272 = cb0._m19.x * 0.5;
    precise float _279 = ((_157 < 0.0) ? fma(-_268, 4.0, 4.0) : _269) - fma(fract(_272), 4.0, 2.0);
    precise float _280 = _279 + 4.0;
    bool _288 = ((spvNMin(abs(_280), abs(_279)) < 0.300000011920928955078125) && (_233 > 0.00999999977648258209228515625)) && (_233 < 0.02999999932944774627685546875);
    float _295 = _288 ? cb0._m11.x : (_248 ? cb0._m10.x : cb0._m8.x);
    float _296 = _288 ? cb0._m11.y : (_248 ? cb0._m10.y : cb0._m8.y);
    float _297 = _288 ? cb0._m11.z : (_248 ? cb0._m10.z : cb0._m8.z);
    float _298 = _288 ? cb0._m11.w : (_248 ? cb0._m10.w : cb0._m8.w);
    precise float _301 = cb0._m18.y + cb0._m18.x;
    precise float _302 = -_238;
    precise float _303 = fma(_302, 0.5, _301);
    precise float _304 = _233 - _303;
    precise float _306 = fma(_238, 0.5, _301) - _303;
    precise float _307 = _304 / _306;
    precise float _308 = spvNClamp(_307, 0.0, 1.0);
    precise float _315 = cb0._m9.x - _295;
    precise float _316 = cb0._m9.y - _296;
    precise float _317 = cb0._m9.z - _297;
    precise float _318 = cb0._m9.w - _298;
    precise float _319 = fma(_308, _315, _295);
    precise float _320 = fma(_308, _316, _296);
    precise float _321 = fma(_308, _317, _297);
    precise float _322 = fma(_308, _318, _298);
    precise float _323 = fma(cb0._m18.y, 2.0, cb0._m18.x);
    precise float _324 = fma(_302, 0.5, _323);
    precise float _326 = _233 - _324;
    precise float _327 = fma(_238, 0.5, _323) - _324;
    precise float _328 = _326 / _327;
    precise float _329 = spvNClamp(_328, 0.0, 1.0);
    precise float _346 = TEXCOORD1.y * cb0._m5.x;
    precise float _347 = TEXCOORD1.y * cb0._m5.y;
    precise float _348 = TEXCOORD1.y * cb0._m5.z;
    precise float _349 = TEXCOORD1.y * cb0._m5.w;
    precise float _376 = fma(cb0._m6.x, TEXCOORD1.z, fma(cb0._m4.x, TEXCOORD1.x, _346)) + cb0._m7.x;
    precise float _377 = fma(cb0._m6.y, TEXCOORD1.z, fma(cb0._m4.y, TEXCOORD1.x, _347)) + cb0._m7.y;
    precise float _378 = fma(cb0._m6.z, TEXCOORD1.z, fma(cb0._m4.z, TEXCOORD1.x, _348)) + cb0._m7.z;
    precise float _379 = fma(cb0._m6.w, TEXCOORD1.z, fma(cb0._m4.w, TEXCOORD1.x, _349)) + cb0._m7.w;
    float _456;
    float _457;
    float _458;
    float _459;
    if (cb2._m0.x == 1.0)
    {
        bool _388 = cb2._m0.y == 1.0;
        precise float _395 = TEXCOORD1.y * cb2._m3.x;
        precise float _396 = TEXCOORD1.y * cb2._m3.y;
        precise float _397 = TEXCOORD1.y * cb2._m3.z;
        precise float _419 = fma(cb2._m5.x, TEXCOORD1.z, fma(cb2._m1.x, TEXCOORD1.x, _395)) + cb2._m7.x;
        precise float _420 = fma(cb2._m5.y, TEXCOORD1.z, fma(cb2._m1.y, TEXCOORD1.x, _396)) + cb2._m7.y;
        precise float _421 = fma(cb2._m5.z, TEXCOORD1.z, fma(cb2._m1.z, TEXCOORD1.x, _397)) + cb2._m7.z;
        precise float _430 = (_388 ? _419 : TEXCOORD1.x) - cb2._m11.x;
        precise float _431 = (_388 ? _420 : TEXCOORD1.y) - cb2._m11.y;
        precise float _432 = (_388 ? _421 : TEXCOORD1.z) - cb2._m11.z;
        precise float _438 = _430 * cb2._m9.x;
        precise float _439 = _431 * cb2._m9.y;
        precise float _440 = _432 * cb2._m9.z;
        vec4 _451 = texture(sampler3D(t2, s0), vec3(spvNMax(fma(_438, 0.25, 0.75), fma(cb2._m0.z, 0.5, 0.75)), _439, _440));
        _456 = _451.w;
        _457 = _451.z;
        _458 = _451.y;
        _459 = _451.x;
    }
    else
    {
        _456 = 1.0;
        _457 = 1.0;
        _458 = 1.0;
        _459 = 1.0;
    }
    precise float _468 = _376 / _379;
    precise float _469 = _377 / _379;
    precise float _470 = _468 + 0.5;
    precise float _471 = _469 + 0.5;
    precise float _479 = float(_378 > 0.0) * texture(sampler2D(t0, s1), vec2(_470, _471)).w;
    vec3 _480 = vec3(_376, _377, _378);
    precise float _488 = _479 * texture(sampler2D(t1, s2), vec2(dp3_f32(_480, _480))).x;
    precise float _489 = spvNClamp(dp4_f32(vec4(_459, _458, _457, _456), cb1._m46), 0.0, 1.0) * _488;
    precise float _490 = fma(_329, -_319, _319) * _489;
    precise float _491 = fma(_329, -_320, _320) * _489;
    precise float _492 = fma(_329, -_321, _321) * _489;
    precise float _499 = _490 * cb0._m2.x;
    precise float _500 = _491 * cb0._m2.y;
    precise float _501 = _492 * cb0._m2.z;
    precise float _502 = fma(_329, -_322, _322) * cb0._m2.w;
    SV_Target.x = _499;
    SV_Target.y = _500;
    SV_Target.z = _501;
    SV_Target.w = _502;
}

