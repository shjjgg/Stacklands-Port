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
layout(set = 0, binding = 5) uniform sampler s2;
layout(set = 0, binding = 6) uniform texture2D t0;
layout(set = 0, binding = 7) uniform textureCube t1;
layout(set = 0, binding = 8) uniform texture3D t2;

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
    precise float _125 = a.x * b.x;
    return fma(a.y, b.y, _125);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _108 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _108)));
}

float dp3_f32(vec3 a, vec3 b)
{
    precise float _93 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _93));
}

void main()
{
    precise float _135 = TEXCOORD1.x * 1000.0;
    precise float _138 = sin(roundEven(_135)) * 43758.546875;
    precise float _140 = fract(_138) - 0.5;
    precise float _145 = _140 * cb0._m21.z;
    precise float _148 = fma(_145, 0.004999999888241291046142578125, TEXCOORD1.z);
    precise float _149 = _148 * 500.0;
    precise float _152 = sin(roundEven(_149)) * 43758.546875;
    precise float _154 = fract(_152) - 0.5;
    precise float _155 = _154 * cb0._m21.z;
    precise float _156 = fma(_155, 0.004999999888241291046142578125, TEXCOORD1.x);
    precise float _161 = cb0._m19.x - cb0._m17.x;
    precise float _162 = fma(_161, 0.5, cb0._m17.x);
    float _168;
    float _173;
    _168 = 0.0;
    _173 = 100000.0;
    float _169;
    precise float _172;
    float _174;
    uint _176;
    float _171 = 0.0;
    uint _175 = 0u;
    for (;;)
    {
        if (int(_175) >= 3)
        {
            break;
        }
        bool _190 = _175 == 0u;
        float _196 = _190 ? cb0._m17.x : (((_175 >= 1u) && (_175 < 3u)) ? _162 : cb0._m19.x);
        float _197 = _190 ? cb0._m17.y : ((_175 == 1u) ? cb0._m17.y : cb0._m19.y);
        _176 = _175 + 1u;
        precise float _204 = (((_176 < 3u) && (_176 >= 1u)) ? _162 : cb0._m19.x) - _196;
        precise float _205 = ((_176 == 1u) ? cb0._m17.y : cb0._m19.y) - _197;
        precise float _206 = _156 - _196;
        precise float _207 = _148 - _197;
        vec2 _208 = vec2(_206, _207);
        vec2 _209 = vec2(_204, _205);
        float _211 = dp2_f32(_209, _209);
        precise float _212 = dp2_f32(_208, _209) / _211;
        precise float _213 = spvNClamp(_212, 0.0, 1.0);
        precise float _219 = -_213;
        vec2 _222 = vec2(fma(_219, _204, _206), fma(_219, _205, _207));
        precise float _225 = sqrt(dp2_f32(_222, _222)) * ((dp2_f32(vec2(_205, -_204), _208) > 0.0) ? 1.0 : (-1.0));
        precise float _226 = sqrt(_211);
        bool _229 = abs(_225) < abs(_173);
        _169 = _229 ? fma(_213, _226, _171) : _168;
        _174 = _229 ? _225 : _173;
        _172 = _171 + _226;
        _168 = _169;
        _171 = _172;
        _173 = _174;
        _175 = _176;
        continue;
    }
    precise float _231 = abs(_173);
    precise float _236 = abs(dFdx(_231)) + abs(dFdy(_231));
    precise float _237 = _168 * 3.5;
    bool _239 = fract(_237) > 0.800000011920928955078125;
    precise float _240 = _231 * 0.800000011920928955078125;
    float _242 = _239 ? _240 : _231;
    precise float _247 = cb0._m21.y + cb0._m21.x;
    precise float _248 = -_236;
    precise float _249 = fma(_248, 0.5, _247);
    precise float _250 = _242 - _249;
    precise float _252 = fma(_236, 0.5, _247) - _249;
    precise float _253 = _250 / _252;
    precise float _254 = spvNClamp(_253, 0.0, 1.0);
    float _266 = _239 ? cb0._m15.x : cb0._m12.x;
    float _267 = _239 ? cb0._m15.y : cb0._m12.y;
    float _268 = _239 ? cb0._m15.z : cb0._m12.z;
    precise float _269 = _247 * 0.300000011920928955078125;
    precise float _270 = _247 * 0.800000011920928955078125;
    precise float _271 = _247 * 0.5;
    precise float _272 = _247 * 1.10000002384185791015625;
    precise float _273 = -_173;
    precise float _282 = _266 * cb0._m21.w;
    precise float _283 = _267 * cb0._m21.w;
    precise float _284 = _268 * cb0._m21.w;
    bool _287 = (((_273 < _272) && (_271 < _273)) && _239) || (((_269 < _273) && (_273 < _270)) && (!_239));
    float _288 = _287 ? _282 : _266;
    float _289 = _287 ? _283 : _267;
    float _290 = _287 ? _284 : _268;
    precise float _300 = cb0._m14.x - _288;
    precise float _301 = cb0._m14.y - _289;
    precise float _302 = cb0._m14.z - _290;
    precise float _303 = cb0._m14.w - cb0._m13;
    precise float _304 = fma(_254, _300, _288);
    precise float _305 = fma(_254, _301, _289);
    precise float _306 = fma(_254, _302, _290);
    precise float _307 = fma(_254, _303, cb0._m13);
    precise float _308 = fma(cb0._m21.y, 2.0, cb0._m21.x);
    precise float _309 = fma(_248, 0.5, _308);
    precise float _311 = _242 - _309;
    precise float _312 = fma(_236, 0.5, _308) - _309;
    precise float _313 = _311 / _312;
    precise float _314 = spvNClamp(_313, 0.0, 1.0);
    precise float _330 = TEXCOORD1.y * cb0._m6.x;
    precise float _331 = TEXCOORD1.y * cb0._m6.y;
    precise float _332 = TEXCOORD1.y * cb0._m6.z;
    precise float _354 = fma(cb0._m8.x, TEXCOORD1.z, fma(cb0._m4.x, TEXCOORD1.x, _330)) + cb0._m10.x;
    precise float _355 = fma(cb0._m8.y, TEXCOORD1.z, fma(cb0._m4.y, TEXCOORD1.x, _331)) + cb0._m10.y;
    precise float _356 = fma(cb0._m8.z, TEXCOORD1.z, fma(cb0._m4.z, TEXCOORD1.x, _332)) + cb0._m10.z;
    float _432;
    float _433;
    float _434;
    float _435;
    if (cb2._m0.x == 1.0)
    {
        bool _365 = cb2._m0.y == 1.0;
        precise float _371 = TEXCOORD1.y * cb2._m3.x;
        precise float _372 = TEXCOORD1.y * cb2._m3.y;
        precise float _373 = TEXCOORD1.y * cb2._m3.z;
        precise float _395 = fma(cb2._m5.x, TEXCOORD1.z, fma(cb2._m1.x, TEXCOORD1.x, _371)) + cb2._m7.x;
        precise float _396 = fma(cb2._m5.y, TEXCOORD1.z, fma(cb2._m1.y, TEXCOORD1.x, _372)) + cb2._m7.y;
        precise float _397 = fma(cb2._m5.z, TEXCOORD1.z, fma(cb2._m1.z, TEXCOORD1.x, _373)) + cb2._m7.z;
        precise float _406 = (_365 ? _395 : TEXCOORD1.x) - cb2._m11.x;
        precise float _407 = (_365 ? _396 : TEXCOORD1.y) - cb2._m11.y;
        precise float _408 = (_365 ? _397 : TEXCOORD1.z) - cb2._m11.z;
        precise float _414 = _406 * cb2._m9.x;
        precise float _415 = _407 * cb2._m9.y;
        precise float _416 = _408 * cb2._m9.z;
        vec4 _427 = texture(sampler3D(t2, s0), vec3(spvNMax(fma(_414, 0.25, 0.75), fma(cb2._m0.z, 0.5, 0.75)), _415, _416));
        _432 = _427.w;
        _433 = _427.z;
        _434 = _427.y;
        _435 = _427.x;
    }
    else
    {
        _432 = 1.0;
        _433 = 1.0;
        _434 = 1.0;
        _435 = 1.0;
    }
    vec3 _442 = vec3(_354, _355, _356);
    precise float _457 = texture(sampler2D(t0, s2), vec2(dp3_f32(_442, _442))).x * texture(samplerCube(t1, s1), _442).w;
    precise float _458 = spvNClamp(dp4_f32(vec4(_435, _434, _433, _432), cb1._m46), 0.0, 1.0) * _457;
    precise float _459 = fma(_314, -_304, _304) * _458;
    precise float _460 = fma(_314, -_305, _305) * _458;
    precise float _461 = fma(_314, -_306, _306) * _458;
    precise float _468 = _459 * cb0._m2.x;
    precise float _469 = _460 * cb0._m2.y;
    precise float _470 = _461 * cb0._m2.z;
    precise float _471 = fma(_314, -_307, _307) * cb0._m2.w;
    SV_Target.x = _468;
    SV_Target.y = _469;
    SV_Target.z = _470;
    SV_Target.w = _471;
}

