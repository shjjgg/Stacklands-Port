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
    precise float _157 = cb0._m19.x - cb0._m17.x;
    precise float _158 = fma(_157, 0.5, cb0._m17.x);
    float _164;
    float _169;
    _164 = 0.0;
    _169 = 100000.0;
    float _165;
    precise float _168;
    float _170;
    uint _172;
    float _167 = 0.0;
    uint _171 = 0u;
    for (;;)
    {
        if (int(_171) >= 3)
        {
            break;
        }
        bool _186 = _171 == 0u;
        float _192 = _186 ? cb0._m17.x : (((_171 >= 1u) && (_171 < 3u)) ? _158 : cb0._m19.x);
        float _193 = _186 ? cb0._m17.y : ((_171 == 1u) ? cb0._m17.y : cb0._m19.y);
        _172 = _171 + 1u;
        precise float _200 = (((_172 < 3u) && (_172 >= 1u)) ? _158 : cb0._m19.x) - _192;
        precise float _201 = ((_172 == 1u) ? cb0._m17.y : cb0._m19.y) - _193;
        precise float _202 = _152 - _192;
        precise float _203 = _144 - _193;
        vec2 _204 = vec2(_202, _203);
        vec2 _205 = vec2(_200, _201);
        float _207 = dp2_f32(_205, _205);
        precise float _208 = dp2_f32(_204, _205) / _207;
        precise float _209 = spvNClamp(_208, 0.0, 1.0);
        precise float _215 = -_209;
        vec2 _218 = vec2(fma(_215, _200, _202), fma(_215, _201, _203));
        precise float _221 = sqrt(dp2_f32(_218, _218)) * ((dp2_f32(vec2(_201, -_200), _204) > 0.0) ? 1.0 : (-1.0));
        precise float _222 = sqrt(_207);
        bool _225 = abs(_221) < abs(_169);
        _165 = _225 ? fma(_209, _222, _167) : _164;
        _170 = _225 ? _221 : _169;
        _168 = _167 + _222;
        _164 = _165;
        _167 = _168;
        _169 = _170;
        _171 = _172;
        continue;
    }
    precise float _227 = abs(_169);
    precise float _232 = abs(dFdx(_227)) + abs(dFdy(_227));
    precise float _233 = _164 * 3.5;
    bool _235 = fract(_233) > 0.800000011920928955078125;
    precise float _236 = _227 * 0.800000011920928955078125;
    float _238 = _235 ? _236 : _227;
    precise float _243 = cb0._m21.y + cb0._m21.x;
    precise float _244 = -_232;
    precise float _245 = fma(_244, 0.5, _243);
    precise float _246 = _238 - _245;
    precise float _248 = fma(_232, 0.5, _243) - _245;
    precise float _249 = _246 / _248;
    precise float _250 = spvNClamp(_249, 0.0, 1.0);
    float _262 = _235 ? cb0._m15.x : cb0._m12.x;
    float _263 = _235 ? cb0._m15.y : cb0._m12.y;
    float _264 = _235 ? cb0._m15.z : cb0._m12.z;
    precise float _265 = _243 * 0.300000011920928955078125;
    precise float _266 = _243 * 0.800000011920928955078125;
    precise float _267 = _243 * 0.5;
    precise float _268 = _243 * 1.10000002384185791015625;
    precise float _269 = -_169;
    precise float _278 = _262 * cb0._m21.w;
    precise float _279 = _263 * cb0._m21.w;
    precise float _280 = _264 * cb0._m21.w;
    bool _283 = (((_269 < _268) && (_267 < _269)) && _235) || (((_265 < _269) && (_269 < _266)) && (!_235));
    float _284 = _283 ? _278 : _262;
    float _285 = _283 ? _279 : _263;
    float _286 = _283 ? _280 : _264;
    precise float _296 = cb0._m14.x - _284;
    precise float _297 = cb0._m14.y - _285;
    precise float _298 = cb0._m14.z - _286;
    precise float _299 = cb0._m14.w - cb0._m13;
    precise float _300 = fma(_250, _296, _284);
    precise float _301 = fma(_250, _297, _285);
    precise float _302 = fma(_250, _298, _286);
    precise float _303 = fma(_250, _299, cb0._m13);
    precise float _304 = fma(cb0._m21.y, 2.0, cb0._m21.x);
    precise float _305 = fma(_244, 0.5, _304);
    precise float _307 = _238 - _305;
    precise float _308 = fma(_232, 0.5, _304) - _305;
    precise float _309 = _307 / _308;
    precise float _310 = spvNClamp(_309, 0.0, 1.0);
    precise float _326 = TEXCOORD1.y * cb0._m6.x;
    precise float _327 = TEXCOORD1.y * cb0._m6.y;
    precise float _328 = TEXCOORD1.y * cb0._m6.z;
    precise float _350 = fma(cb0._m8.x, TEXCOORD1.z, fma(cb0._m4.x, TEXCOORD1.x, _326)) + cb0._m10.x;
    precise float _351 = fma(cb0._m8.y, TEXCOORD1.z, fma(cb0._m4.y, TEXCOORD1.x, _327)) + cb0._m10.y;
    precise float _352 = fma(cb0._m8.z, TEXCOORD1.z, fma(cb0._m4.z, TEXCOORD1.x, _328)) + cb0._m10.z;
    float _428;
    float _429;
    float _430;
    float _431;
    if (cb2._m0.x == 1.0)
    {
        bool _361 = cb2._m0.y == 1.0;
        precise float _367 = TEXCOORD1.y * cb2._m3.x;
        precise float _368 = TEXCOORD1.y * cb2._m3.y;
        precise float _369 = TEXCOORD1.y * cb2._m3.z;
        precise float _391 = fma(cb2._m5.x, TEXCOORD1.z, fma(cb2._m1.x, TEXCOORD1.x, _367)) + cb2._m7.x;
        precise float _392 = fma(cb2._m5.y, TEXCOORD1.z, fma(cb2._m1.y, TEXCOORD1.x, _368)) + cb2._m7.y;
        precise float _393 = fma(cb2._m5.z, TEXCOORD1.z, fma(cb2._m1.z, TEXCOORD1.x, _369)) + cb2._m7.z;
        precise float _402 = (_361 ? _391 : TEXCOORD1.x) - cb2._m11.x;
        precise float _403 = (_361 ? _392 : TEXCOORD1.y) - cb2._m11.y;
        precise float _404 = (_361 ? _393 : TEXCOORD1.z) - cb2._m11.z;
        precise float _410 = _402 * cb2._m9.x;
        precise float _411 = _403 * cb2._m9.y;
        precise float _412 = _404 * cb2._m9.z;
        vec4 _423 = texture(sampler3D(t1, s0), vec3(spvNMax(fma(_410, 0.25, 0.75), fma(cb2._m0.z, 0.5, 0.75)), _411, _412));
        _428 = _423.w;
        _429 = _423.z;
        _430 = _423.y;
        _431 = _423.x;
    }
    else
    {
        _428 = 1.0;
        _429 = 1.0;
        _430 = 1.0;
        _431 = 1.0;
    }
    vec3 _438 = vec3(_350, _351, _352);
    precise float _447 = spvNClamp(dp4_f32(vec4(_431, _430, _429, _428), cb1._m46), 0.0, 1.0) * texture(sampler2D(t0, s1), vec2(dp3_f32(_438, _438))).x;
    precise float _448 = fma(_310, -_300, _300) * _447;
    precise float _449 = fma(_310, -_301, _301) * _447;
    precise float _450 = fma(_310, -_302, _302) * _447;
    precise float _457 = _448 * cb0._m2.x;
    precise float _458 = _449 * cb0._m2.y;
    precise float _459 = _450 * cb0._m2.z;
    precise float _460 = fma(_310, -_303, _303) * cb0._m2.w;
    SV_Target.x = _457;
    SV_Target.y = _458;
    SV_Target.z = _459;
    SV_Target.w = _460;
}

