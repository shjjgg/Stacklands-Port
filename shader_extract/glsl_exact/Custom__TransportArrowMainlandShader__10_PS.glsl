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
    vec4 _m14;
    vec2 _m15;
    uvec2 _m16;
    vec2 _m17;
    uvec2 _m18;
    vec2 _m19;
    uvec2 _m20;
    vec4 _m21;
    vec4 _m22;
    vec4 _m23;
    vec4 _m24;
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
    precise float _121 = a.x * b.x;
    return fma(a.y, b.y, _121);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _104 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _104)));
}

float dp3_f32(vec3 a, vec3 b)
{
    precise float _89 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _89));
}

void main()
{
    precise float _131 = TEXCOORD1.x * 1000.0;
    precise float _134 = sin(roundEven(_131)) * 43758.546875;
    precise float _136 = fract(_134) - 0.5;
    precise float _141 = _136 * cb0._m21.z;
    precise float _144 = fma(_141, 0.004999999888241291046142578125, TEXCOORD1.z);
    precise float _145 = _144 * 500.0;
    precise float _148 = sin(roundEven(_145)) * 43758.546875;
    precise float _150 = fract(_148) - 0.5;
    precise float _151 = _150 * cb0._m21.z;
    precise float _152 = fma(_151, 0.004999999888241291046142578125, TEXCOORD1.x);
    float _154;
    float _159;
    _154 = 0.0;
    _159 = 100000.0;
    float _155;
    precise float _158;
    float _160;
    precise float _162;
    float _157 = 0.0;
    float _161 = 0.0;
    for (;;)
    {
        if (_161 > 1.0)
        {
            break;
        }
        precise float _169 = spvNMin(_161, 1.0);
        precise float _170 = 1.0 - _169;
        precise float _171 = _170 * _170;
        float _174 = dp2_f32(vec2(_169), vec2(_170));
        precise float _180 = _174 * cb0._m19.x;
        precise float _181 = _174 * cb0._m19.y;
        precise float _188 = _169 * _169;
        precise float _193 = fma(_188, cb0._m17.x, fma(_171, cb0._m15.x, _180));
        precise float _194 = fma(_188, cb0._m17.y, fma(_171, cb0._m15.y, _181));
        _162 = _161 + 0.100000001490116119384765625;
        precise float _195 = spvNMin(_162, 1.0);
        precise float _196 = 1.0 - _195;
        precise float _197 = _196 * _196;
        float _200 = dp2_f32(vec2(_195), vec2(_196));
        precise float _201 = _200 * cb0._m19.x;
        precise float _202 = _200 * cb0._m19.y;
        precise float _205 = _195 * _195;
        precise float _208 = fma(_205, cb0._m17.x, fma(_197, cb0._m15.x, _201)) - _193;
        precise float _209 = fma(_205, cb0._m17.y, fma(_197, cb0._m15.y, _202)) - _194;
        precise float _210 = _152 - _193;
        precise float _211 = _144 - _194;
        vec2 _212 = vec2(_210, _211);
        vec2 _213 = vec2(_208, _209);
        float _215 = dp2_f32(_213, _213);
        precise float _216 = dp2_f32(_212, _213) / _215;
        precise float _217 = spvNClamp(_216, 0.0, 1.0);
        precise float _223 = -_217;
        vec2 _226 = vec2(fma(_223, _208, _210), fma(_223, _209, _211));
        precise float _229 = sqrt(dp2_f32(_226, _226)) * ((dp2_f32(vec2(_209, -_208), _212) > 0.0) ? 1.0 : (-1.0));
        precise float _230 = sqrt(_215);
        bool _233 = abs(_229) < abs(_159);
        _155 = _233 ? fma(_217, _230, _157) : _154;
        _160 = _233 ? _229 : _159;
        _158 = _230 + _157;
        _154 = _155;
        _157 = _158;
        _159 = _160;
        _161 = _162;
        continue;
    }
    precise float _235 = abs(_159);
    precise float _240 = abs(dFdy(_235)) + abs(dFdx(_235));
    bool _243 = cb0._m22.y > 0.5;
    precise float _261 = _159 * 125.0;
    precise float _262 = _154 * 125.0;
    precise float _263 = _159 * 31250.0;
    precise float _266 = sin(roundEven(_263)) * 43758.546875;
    precise float _268 = fract(_266) - 0.5;
    precise float _271 = _268 * cb0._m22.x;
    precise float _272 = fma(_271, 0.004999999888241291046142578125, _262);
    precise float _273 = _272 * 250.0;
    precise float _276 = sin(roundEven(_273)) * 43758.546875;
    precise float _278 = fract(_276) - 0.5;
    precise float _279 = _278 * cb0._m22.x;
    precise float _281 = fma(_279, 0.004999999888241291046142578125, _261) * 0.800000011920928955078125;
    precise float _284 = sin(_272) * sin(_281);
    bool _285 = _284 > 0.1500000059604644775390625;
    float _296 = _285 ? (_243 ? cb0._m23.x : cb0._m14.x) : (_243 ? cb0._m23.x : cb0._m12.x);
    float _297 = _285 ? (_243 ? cb0._m23.y : cb0._m14.y) : (_243 ? cb0._m23.y : cb0._m12.y);
    float _298 = _285 ? (_243 ? cb0._m23.z : cb0._m14.z) : (_243 ? cb0._m23.z : cb0._m12.z);
    float _299 = _285 ? (_243 ? cb0._m23.w : cb0._m14.w) : (_243 ? cb0._m23.w : cb0._m12.w);
    precise float _304 = cb0._m21.y + cb0._m21.x;
    precise float _305 = -_240;
    precise float _306 = fma(_305, 0.5, _304);
    precise float _308 = fma(_240, 0.5, _304) - _306;
    precise float _309 = _235 - _306;
    precise float _310 = _309 / _308;
    precise float _311 = spvNClamp(_310, 0.0, 1.0);
    precise float _328 = (_243 ? cb0._m24.x : cb0._m13.x) - _296;
    precise float _329 = (_243 ? cb0._m24.y : cb0._m13.y) - _297;
    precise float _330 = (_243 ? cb0._m24.z : cb0._m13.z) - _298;
    precise float _331 = (_243 ? cb0._m24.w : cb0._m13.w) - _299;
    precise float _332 = fma(_311, _328, _296);
    precise float _333 = fma(_311, _329, _297);
    precise float _334 = fma(_311, _330, _298);
    precise float _335 = fma(_311, _331, _299);
    precise float _336 = fma(cb0._m21.y, 2.0, cb0._m21.x);
    precise float _337 = fma(_305, 0.5, _336);
    precise float _339 = fma(_240, 0.5, _336) - _337;
    precise float _340 = _235 - _337;
    precise float _341 = _340 / _339;
    precise float _342 = spvNClamp(_341, 0.0, 1.0);
    precise float _359 = TEXCOORD1.y * cb0._m6.x;
    precise float _360 = TEXCOORD1.y * cb0._m6.y;
    precise float _361 = TEXCOORD1.y * cb0._m6.z;
    precise float _383 = fma(cb0._m8.x, TEXCOORD1.z, fma(cb0._m4.x, TEXCOORD1.x, _359)) + cb0._m10.x;
    precise float _384 = fma(cb0._m8.y, TEXCOORD1.z, fma(cb0._m4.y, TEXCOORD1.x, _360)) + cb0._m10.y;
    precise float _385 = fma(cb0._m8.z, TEXCOORD1.z, fma(cb0._m4.z, TEXCOORD1.x, _361)) + cb0._m10.z;
    float _461;
    float _462;
    float _463;
    float _464;
    if (cb2._m0.x == 1.0)
    {
        bool _394 = cb2._m0.y == 1.0;
        precise float _400 = TEXCOORD1.y * cb2._m3.x;
        precise float _401 = TEXCOORD1.y * cb2._m3.y;
        precise float _402 = TEXCOORD1.y * cb2._m3.z;
        precise float _424 = fma(cb2._m5.x, TEXCOORD1.z, fma(cb2._m1.x, TEXCOORD1.x, _400)) + cb2._m7.x;
        precise float _425 = fma(cb2._m5.y, TEXCOORD1.z, fma(cb2._m1.y, TEXCOORD1.x, _401)) + cb2._m7.y;
        precise float _426 = fma(cb2._m5.z, TEXCOORD1.z, fma(cb2._m1.z, TEXCOORD1.x, _402)) + cb2._m7.z;
        precise float _435 = (_394 ? _424 : TEXCOORD1.x) - cb2._m11.x;
        precise float _436 = (_394 ? _425 : TEXCOORD1.y) - cb2._m11.y;
        precise float _437 = (_394 ? _426 : TEXCOORD1.z) - cb2._m11.z;
        precise float _443 = _435 * cb2._m9.x;
        precise float _444 = _436 * cb2._m9.y;
        precise float _445 = _437 * cb2._m9.z;
        vec4 _456 = texture(sampler3D(t1, s0), vec3(spvNMax(fma(_443, 0.25, 0.75), fma(cb2._m0.z, 0.5, 0.75)), _444, _445));
        _461 = _456.w;
        _462 = _456.z;
        _463 = _456.y;
        _464 = _456.x;
    }
    else
    {
        _461 = 1.0;
        _462 = 1.0;
        _463 = 1.0;
        _464 = 1.0;
    }
    vec3 _471 = vec3(_383, _384, _385);
    precise float _480 = spvNClamp(dp4_f32(vec4(_464, _463, _462, _461), cb1._m46), 0.0, 1.0) * texture(sampler2D(t0, s1), vec2(dp3_f32(_471, _471))).x;
    precise float _481 = fma(_342, -_332, _332) * _480;
    precise float _482 = fma(_342, -_333, _333) * _480;
    precise float _483 = fma(_342, -_334, _334) * _480;
    precise float _490 = _481 * cb0._m2.x;
    precise float _491 = _482 * cb0._m2.y;
    precise float _492 = _483 * cb0._m2.z;
    precise float _493 = fma(_342, -_335, _335) * cb0._m2.w;
    SV_Target.x = _490;
    SV_Target.y = _491;
    SV_Target.z = _492;
    SV_Target.w = _493;
}

