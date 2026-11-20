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
    float _m5;
    vec4 _m6;
    vec3 _m7;
    uint _m8;
    vec2 _m9;
    uvec2 _m10;
    vec4 _m11;
    uvec4 _m12;
    vec4 _m13;
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
    precise float _131 = cb0._m11.x - cb0._m9.x;
    precise float _132 = fma(_131, 0.5, cb0._m9.x);
    float _138;
    float _143;
    _138 = 0.0;
    _143 = 100000.0;
    float _139;
    precise float _142;
    float _144;
    uint _146;
    float _141 = 0.0;
    uint _145 = 0u;
    for (;;)
    {
        if (int(_145) >= 3)
        {
            break;
        }
        bool _160 = _145 == 0u;
        float _166 = _160 ? cb0._m9.x : (((_145 >= 1u) && (_145 < 3u)) ? _132 : cb0._m11.x);
        float _167 = _160 ? cb0._m9.y : ((_145 == 1u) ? cb0._m9.y : cb0._m11.y);
        _146 = _145 + 1u;
        precise float _174 = (((_146 < 3u) && (_146 >= 1u)) ? _132 : cb0._m11.x) - _166;
        precise float _175 = ((_146 == 1u) ? cb0._m9.y : cb0._m11.y) - _167;
        precise float _176 = _126 - _166;
        precise float _177 = _118 - _167;
        vec2 _178 = vec2(_176, _177);
        vec2 _179 = vec2(_174, _175);
        float _181 = dp2_f32(_179, _179);
        precise float _182 = dp2_f32(_178, _179) / _181;
        precise float _183 = spvNClamp(_182, 0.0, 1.0);
        precise float _189 = -_183;
        vec2 _192 = vec2(fma(_189, _174, _176), fma(_189, _175, _177));
        precise float _195 = sqrt(dp2_f32(_192, _192)) * ((dp2_f32(vec2(_175, -_174), _178) > 0.0) ? 1.0 : (-1.0));
        precise float _196 = sqrt(_181);
        bool _199 = abs(_195) < abs(_143);
        _139 = _199 ? fma(_183, _196, _141) : _138;
        _144 = _199 ? _195 : _143;
        _142 = _141 + _196;
        _138 = _139;
        _141 = _142;
        _143 = _144;
        _145 = _146;
        continue;
    }
    precise float _201 = abs(_143);
    precise float _206 = abs(dFdx(_201)) + abs(dFdy(_201));
    precise float _207 = _138 * 3.5;
    bool _209 = fract(_207) > 0.800000011920928955078125;
    precise float _210 = _201 * 0.800000011920928955078125;
    float _212 = _209 ? _210 : _201;
    precise float _217 = cb0._m13.y + cb0._m13.x;
    precise float _218 = -_206;
    precise float _219 = fma(_218, 0.5, _217);
    precise float _220 = _212 - _219;
    precise float _222 = fma(_206, 0.5, _217) - _219;
    precise float _223 = _220 / _222;
    precise float _224 = spvNClamp(_223, 0.0, 1.0);
    float _236 = _209 ? cb0._m7.x : cb0._m4.x;
    float _237 = _209 ? cb0._m7.y : cb0._m4.y;
    float _238 = _209 ? cb0._m7.z : cb0._m4.z;
    precise float _239 = _217 * 0.300000011920928955078125;
    precise float _240 = _217 * 0.800000011920928955078125;
    precise float _241 = _217 * 0.5;
    precise float _242 = _217 * 1.10000002384185791015625;
    precise float _243 = -_143;
    precise float _252 = _236 * cb0._m13.w;
    precise float _253 = _237 * cb0._m13.w;
    precise float _254 = _238 * cb0._m13.w;
    bool _257 = (((_243 < _242) && (_241 < _243)) && _209) || (((_239 < _243) && (_243 < _240)) && (!_209));
    float _258 = _257 ? _252 : _236;
    float _259 = _257 ? _253 : _237;
    float _260 = _257 ? _254 : _238;
    precise float _270 = cb0._m6.x - _258;
    precise float _271 = cb0._m6.y - _259;
    precise float _272 = cb0._m6.z - _260;
    precise float _273 = cb0._m6.w - cb0._m5;
    precise float _274 = fma(_224, _270, _258);
    precise float _275 = fma(_224, _271, _259);
    precise float _276 = fma(_224, _272, _260);
    precise float _277 = fma(_224, _273, cb0._m5);
    precise float _278 = fma(cb0._m13.y, 2.0, cb0._m13.x);
    precise float _279 = fma(_218, 0.5, _278);
    precise float _281 = _212 - _279;
    precise float _282 = fma(_206, 0.5, _278) - _279;
    precise float _283 = _281 / _282;
    precise float _284 = spvNClamp(_283, 0.0, 1.0);
    float _370;
    float _371;
    float _372;
    float _373;
    if (cb2._m0.x == 1.0)
    {
        bool _301 = cb2._m0.y == 1.0;
        precise float _309 = TEXCOORD1.y * cb2._m3.x;
        precise float _310 = TEXCOORD1.y * cb2._m3.y;
        precise float _311 = TEXCOORD1.y * cb2._m3.z;
        precise float _333 = fma(cb2._m5.x, TEXCOORD1.z, fma(cb2._m1.x, TEXCOORD1.x, _309)) + cb2._m7.x;
        precise float _334 = fma(cb2._m5.y, TEXCOORD1.z, fma(cb2._m1.y, TEXCOORD1.x, _310)) + cb2._m7.y;
        precise float _335 = fma(cb2._m5.z, TEXCOORD1.z, fma(cb2._m1.z, TEXCOORD1.x, _311)) + cb2._m7.z;
        precise float _344 = (_301 ? _333 : TEXCOORD1.x) - cb2._m11.x;
        precise float _345 = (_301 ? _334 : TEXCOORD1.y) - cb2._m11.y;
        precise float _346 = (_301 ? _335 : TEXCOORD1.z) - cb2._m11.z;
        precise float _352 = _344 * cb2._m9.x;
        precise float _353 = _345 * cb2._m9.y;
        precise float _354 = _346 * cb2._m9.z;
        vec4 _365 = texture(sampler3D(t0, s0), vec3(spvNMax(fma(_352, 0.25, 0.75), fma(cb2._m0.z, 0.5, 0.75)), _353, _354));
        _370 = _365.w;
        _371 = _365.z;
        _372 = _365.y;
        _373 = _365.x;
    }
    else
    {
        _370 = 1.0;
        _371 = 1.0;
        _372 = 1.0;
        _373 = 1.0;
    }
    precise float _379 = spvNClamp(dp4_f32(vec4(_373, _372, _371, _370), cb1._m46), 0.0, 1.0);
    precise float _380 = fma(_284, -_274, _274) * _379;
    precise float _381 = fma(_284, -_275, _275) * _379;
    precise float _382 = fma(_284, -_276, _276) * _379;
    precise float _389 = _380 * cb0._m2.x;
    precise float _390 = _381 * cb0._m2.y;
    precise float _391 = _382 * cb0._m2.z;
    precise float _392 = fma(_284, -_277, _277) * cb0._m2.w;
    SV_Target.x = _389;
    SV_Target.y = _390;
    SV_Target.z = _391;
    SV_Target.w = _392;
}

