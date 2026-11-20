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
    vec2 _m7;
    uvec2 _m8;
    vec2 _m9;
    uvec2 _m10;
    vec2 _m11;
    uvec2 _m12;
    vec4 _m13;
    vec4 _m14;
    vec4 _m15;
    vec4 _m16;
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
layout(set = 0, binding = 4) uniform texture3D t0;

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
    precise float _95 = a.x * b.x;
    return fma(a.y, b.y, _95);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _77 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _77)));
}

void main()
{
    precise float _105 = TEXCOORD1.x * 1000.0;
    precise float _108 = sin(roundEven(_105)) * 43758.546875;
    precise float _110 = fract(_108) - 0.5;
    precise float _115 = _110 * cb0._m13.z;
    precise float _118 = fma(_115, 0.004999999888241291046142578125, TEXCOORD1.z);
    precise float _119 = _118 * 500.0;
    precise float _122 = sin(roundEven(_119)) * 43758.546875;
    precise float _124 = fract(_122) - 0.5;
    precise float _125 = _124 * cb0._m13.z;
    precise float _126 = fma(_125, 0.004999999888241291046142578125, TEXCOORD1.x);
    float _128;
    float _133;
    _128 = 0.0;
    _133 = 100000.0;
    float _129;
    precise float _132;
    float _134;
    precise float _136;
    float _131 = 0.0;
    float _135 = 0.0;
    for (;;)
    {
        if (_135 > 1.0)
        {
            break;
        }
        precise float _143 = spvNMin(_135, 1.0);
        precise float _144 = 1.0 - _143;
        precise float _145 = _144 * _144;
        float _148 = dp2_f32(vec2(_143), vec2(_144));
        precise float _154 = _148 * cb0._m11.x;
        precise float _155 = _148 * cb0._m11.y;
        precise float _162 = _143 * _143;
        precise float _167 = fma(_162, cb0._m9.x, fma(_145, cb0._m7.x, _154));
        precise float _168 = fma(_162, cb0._m9.y, fma(_145, cb0._m7.y, _155));
        _136 = _135 + 0.100000001490116119384765625;
        precise float _169 = spvNMin(_136, 1.0);
        precise float _170 = 1.0 - _169;
        precise float _171 = _170 * _170;
        float _174 = dp2_f32(vec2(_169), vec2(_170));
        precise float _175 = _174 * cb0._m11.x;
        precise float _176 = _174 * cb0._m11.y;
        precise float _179 = _169 * _169;
        precise float _182 = fma(_179, cb0._m9.x, fma(_171, cb0._m7.x, _175)) - _167;
        precise float _183 = fma(_179, cb0._m9.y, fma(_171, cb0._m7.y, _176)) - _168;
        precise float _184 = _126 - _167;
        precise float _185 = _118 - _168;
        vec2 _186 = vec2(_184, _185);
        vec2 _187 = vec2(_182, _183);
        float _189 = dp2_f32(_187, _187);
        precise float _190 = dp2_f32(_186, _187) / _189;
        precise float _191 = spvNClamp(_190, 0.0, 1.0);
        precise float _197 = -_191;
        vec2 _200 = vec2(fma(_197, _182, _184), fma(_197, _183, _185));
        precise float _203 = sqrt(dp2_f32(_200, _200)) * ((dp2_f32(vec2(_183, -_182), _186) > 0.0) ? 1.0 : (-1.0));
        precise float _204 = sqrt(_189);
        bool _207 = abs(_203) < abs(_133);
        _129 = _207 ? fma(_191, _204, _131) : _128;
        _134 = _207 ? _203 : _133;
        _132 = _204 + _131;
        _128 = _129;
        _131 = _132;
        _133 = _134;
        _135 = _136;
        continue;
    }
    precise float _209 = abs(_133);
    precise float _214 = abs(dFdy(_209)) + abs(dFdx(_209));
    bool _217 = cb0._m14.y > 0.5;
    precise float _235 = _133 * 125.0;
    precise float _236 = _128 * 125.0;
    precise float _237 = _133 * 31250.0;
    precise float _240 = sin(roundEven(_237)) * 43758.546875;
    precise float _242 = fract(_240) - 0.5;
    precise float _245 = _242 * cb0._m14.x;
    precise float _246 = fma(_245, 0.004999999888241291046142578125, _236);
    precise float _247 = _246 * 250.0;
    precise float _250 = sin(roundEven(_247)) * 43758.546875;
    precise float _252 = fract(_250) - 0.5;
    precise float _253 = _252 * cb0._m14.x;
    precise float _255 = fma(_253, 0.004999999888241291046142578125, _235) * 0.800000011920928955078125;
    precise float _258 = sin(_246) * sin(_255);
    bool _259 = _258 > 0.1500000059604644775390625;
    float _270 = _259 ? (_217 ? cb0._m15.x : cb0._m6.x) : (_217 ? cb0._m15.x : cb0._m4.x);
    float _271 = _259 ? (_217 ? cb0._m15.y : cb0._m6.y) : (_217 ? cb0._m15.y : cb0._m4.y);
    float _272 = _259 ? (_217 ? cb0._m15.z : cb0._m6.z) : (_217 ? cb0._m15.z : cb0._m4.z);
    float _273 = _259 ? (_217 ? cb0._m15.w : cb0._m6.w) : (_217 ? cb0._m15.w : cb0._m4.w);
    precise float _278 = cb0._m13.y + cb0._m13.x;
    precise float _279 = -_214;
    precise float _280 = fma(_279, 0.5, _278);
    precise float _282 = fma(_214, 0.5, _278) - _280;
    precise float _283 = _209 - _280;
    precise float _284 = _283 / _282;
    precise float _285 = spvNClamp(_284, 0.0, 1.0);
    precise float _302 = (_217 ? cb0._m16.x : cb0._m5.x) - _270;
    precise float _303 = (_217 ? cb0._m16.y : cb0._m5.y) - _271;
    precise float _304 = (_217 ? cb0._m16.z : cb0._m5.z) - _272;
    precise float _305 = (_217 ? cb0._m16.w : cb0._m5.w) - _273;
    precise float _306 = fma(_285, _302, _270);
    precise float _307 = fma(_285, _303, _271);
    precise float _308 = fma(_285, _304, _272);
    precise float _309 = fma(_285, _305, _273);
    precise float _310 = fma(cb0._m13.y, 2.0, cb0._m13.x);
    precise float _311 = fma(_279, 0.5, _310);
    precise float _313 = fma(_214, 0.5, _310) - _311;
    precise float _314 = _209 - _311;
    precise float _315 = _314 / _313;
    precise float _316 = spvNClamp(_315, 0.0, 1.0);
    float _403;
    float _404;
    float _405;
    float _406;
    if (cb2._m0.x == 1.0)
    {
        bool _333 = cb2._m0.y == 1.0;
        precise float _342 = TEXCOORD1.y * cb2._m3.x;
        precise float _343 = TEXCOORD1.y * cb2._m3.y;
        precise float _344 = TEXCOORD1.y * cb2._m3.z;
        precise float _366 = fma(cb2._m5.x, TEXCOORD1.z, fma(cb2._m1.x, TEXCOORD1.x, _342)) + cb2._m7.x;
        precise float _367 = fma(cb2._m5.y, TEXCOORD1.z, fma(cb2._m1.y, TEXCOORD1.x, _343)) + cb2._m7.y;
        precise float _368 = fma(cb2._m5.z, TEXCOORD1.z, fma(cb2._m1.z, TEXCOORD1.x, _344)) + cb2._m7.z;
        precise float _377 = (_333 ? _366 : TEXCOORD1.x) - cb2._m11.x;
        precise float _378 = (_333 ? _367 : TEXCOORD1.y) - cb2._m11.y;
        precise float _379 = (_333 ? _368 : TEXCOORD1.z) - cb2._m11.z;
        precise float _385 = _377 * cb2._m9.x;
        precise float _386 = _378 * cb2._m9.y;
        precise float _387 = _379 * cb2._m9.z;
        vec4 _398 = texture(sampler3D(t0, s0), vec3(spvNMax(fma(_385, 0.25, 0.75), fma(cb2._m0.z, 0.5, 0.75)), _386, _387));
        _403 = _398.w;
        _404 = _398.z;
        _405 = _398.y;
        _406 = _398.x;
    }
    else
    {
        _403 = 1.0;
        _404 = 1.0;
        _405 = 1.0;
        _406 = 1.0;
    }
    precise float _412 = spvNClamp(dp4_f32(vec4(_406, _405, _404, _403), cb1._m46), 0.0, 1.0);
    precise float _413 = fma(_316, -_306, _306) * _412;
    precise float _414 = fma(_316, -_307, _307) * _412;
    precise float _415 = fma(_316, -_308, _308) * _412;
    precise float _422 = _413 * cb0._m2.x;
    precise float _423 = _414 * cb0._m2.y;
    precise float _424 = _415 * cb0._m2.z;
    precise float _425 = fma(_316, -_309, _309) * cb0._m2.w;
    SV_Target.x = _422;
    SV_Target.y = _423;
    SV_Target.z = _424;
    SV_Target.w = _425;
}

