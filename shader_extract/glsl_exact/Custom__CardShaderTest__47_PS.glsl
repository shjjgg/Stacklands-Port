#version 450
#extension GL_EXT_buffer_reference2 : require
#extension GL_EXT_spirv_intrinsics : require
#extension GL_EXT_demote_to_helper_invocation : require

layout(set = 0, binding = 0, std140) uniform cb0_buf
{
    uvec4 _m0;
    uvec4 _m1;
    uvec4 _m2;
    uvec4 _m3;
    vec4 _m4;
    vec3 _m5;
    uint _m6;
    vec3 _m7;
    uint _m8;
    vec3 _m9;
    uint _m10;
    uvec4 _m11;
    vec3 _m12;
    uint _m13;
    vec2 _m14;
    uvec2 _m15;
    uvec4 _m16;
    vec2 _m17;
    vec2 _m18;
} cb0;

layout(set = 0, binding = 1, std140) uniform cb1_buf
{
    vec4 _m0;
    uvec4 _m1;
    uvec4 _m2;
    uvec4 _m3;
    vec3 _m4;
    uint _m5;
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

layout(set = 0, binding = 3, std140) uniform cb3_buf
{
    uvec4 m;
} cb3;

layout(set = 0, binding = 4, std140) uniform cb4_buf
{
    vec4 m[4096];
} cb4;

layout(set = 0, binding = 5) uniform sampler s0;
layout(set = 0, binding = 6) uniform sampler s1;
layout(set = 0, binding = 7) uniform sampler s2;
layout(set = 0, binding = 8) uniform sampler s3;
layout(set = 0, binding = 9) uniform sampler s4;
layout(set = 0, binding = 10) uniform texture2D t0;
layout(set = 0, binding = 11) uniform texture2D t1;
layout(set = 0, binding = 12) uniform texture2D t2;
layout(set = 0, binding = 13) uniform texture2D t3;
layout(set = 0, binding = 14) uniform texture3D t4;

layout(location = 1, component = 0) in vec2 TEXCOORD;
layout(location = 2, component = 0) in vec3 TEXCOORD1;
layout(location = 3, component = 0) in vec3 TEXCOORD2;
layout(location = 5, component = 0) in vec3 TEXCOORD5;
layout(location = 6, component = 0) flat in uint SV_InstanceID;
layout(location = 0, component = 0) out vec4 SV_Target;
layout(location = 1, component = 0) out vec4 SV_Target1;
layout(location = 2, component = 0) out vec4 SV_Target2;
layout(location = 3, component = 0) out vec4 SV_Target3;

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

float dp3_f32(vec3 a, vec3 b)
{
    precise float _146 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _146));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _135 = a.x * b.x;
    return fma(a.y, b.y, _135);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _117 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _117)));
}

void main()
{
    precise float _159 = TEXCOORD.y * 150.0;
    precise float _162 = sin(roundEven(_159)) * 43758.546875;
    precise float _166 = fma(fract(_162), 0.004999999888241291046142578125, TEXCOORD.x);
    precise float _167 = _166 * 150.0;
    precise float _168 = _166 * 10.0;
    precise float _171 = sin(roundEven(_167)) * 43758.546875;
    precise float _173 = fma(fract(_171), 0.004999999888241291046142578125, TEXCOORD.y);
    precise float _182 = abs(dFdy(_166)) + abs(dFdx(_166));
    precise float _183 = abs(dFdy(_173)) + abs(dFdx(_173));
    precise float _184 = 1.0 - TEXCOORD.x;
    precise float _185 = 1.0 - TEXCOORD.y;
    bool _192 = cb0._m18.x > 0.5;
    bool _194 = cb0._m18.y > 0.5;
    float _197 = _194 ? (_192 ? 0.550000011920928955078125 : 0.5) : (_192 ? 0.5 : 0.449999988079071044921875);
    float _199 = (_192 || _194) ? 2.0 : 1.75;
    precise float _200 = _184 - 0.5;
    precise float _201 = _185 - _197;
    precise float _202 = _199 * _200;
    precise float _203 = fma(_200, _199, 0.5);
    precise float _204 = fma(_201, _199, _197);
    precise float _213 = float(_203 >= 0.0) * float(_203 <= 1.0);
    precise float _214 = float(_204 >= 0.0) * _213;
    vec2 _217 = vec2(_203, _204);
    vec4 _220 = texture(sampler2D(t0, s1), _217);
    float _221 = _220.x;
    float _222 = _220.w;
    vec4 _226 = texture(sampler2D(t1, s3), _217);
    float _227 = _226.x;
    float _228 = _226.w;
    precise float _230 = fma(-_214, float(_204 <= 1.0), 1.0);
    precise float _234 = fma(_230, -_222, _222);
    precise float _238 = fma(_230, -_228, _228);
    precise float _252 = TEXCOORD2.x - cb1._m4.x;
    precise float _253 = TEXCOORD2.y - cb1._m4.y;
    precise float _254 = TEXCOORD2.z - cb1._m4.z;
    vec3 _255 = vec3(_252, _253, _254);
    precise float _257 = inversesqrt(dp3_f32(_255, _255));
    precise float _258 = _257 * _252;
    precise float _259 = _257 * _254;
    precise float _260 = TEXCOORD.y + TEXCOORD.x;
    precise float _261 = TEXCOORD.y + TEXCOORD.y;
    precise float _265 = fma(-_259, 5.0, _261);
    precise float _266 = _265 * 10.0;
    precise float _268 = fma(sin(_266), 0.0199999995529651641845703125, fma(-_258, 5.0, _260));
    precise float _269 = _268 * 30.0;
    vec4 _276 = texture(sampler2D(t2, s2), vec2(_268, fma(cos(_269), 0.0199999995529651641845703125, _265)));
    precise float _284 = fma(cb1._m0.z, 2.0, _260) * 0.0199999995529651641845703125;
    float _287 = float(fract(_284) >= 0.9900000095367431640625);
    bool _292 = cb0._m14.x > 0.5;
    bool _293 = cb0._m14.y > 0.5;
    float _304 = _292 ? fma(_287, cb0._m17.y, cb0._m5.x) : cb0._m5.x;
    float _305 = _292 ? fma(_287, cb0._m17.y, cb0._m5.y) : cb0._m5.y;
    float _306 = _292 ? fma(_287, cb0._m17.y, cb0._m5.z) : cb0._m5.z;
    precise float _307 = _202 + 0.0;
    precise float _308 = _204 - 0.5;
    vec2 _309 = vec2(_307, _308);
    precise float _316 = (_192 ? spvNMax(abs(_308), abs(_307)) : sqrt(dp2_f32(_309, _309))) - 0.400390625;
    precise float _317 = _316 / _182;
    precise float _319 = 1.0 - spvNClamp(_317, 0.0, 1.0);
    precise float _325 = cb0._m7.x - _304;
    precise float _326 = cb0._m7.y - _305;
    precise float _327 = cb0._m7.z - _306;
    precise float _328 = fma(_319, _325, _304);
    precise float _329 = fma(_319, _326, _305);
    precise float _330 = fma(_319, _327, _306);
    float _332 = (_173 >= 0.20000000298023223876953125) ? 0.0 : 1.0;
    precise float _333 = cb0._m7.x - _328;
    precise float _334 = cb0._m7.y - _329;
    precise float _335 = cb0._m7.z - _330;
    precise float _336 = fma(_332, _333, _328);
    precise float _337 = fma(_332, _334, _329);
    precise float _338 = fma(_332, _335, _330);
    precise float _339 = 1.0 - fma(_230, -_221, _221);
    precise float _345 = cb0._m12.x - cb0._m5.x;
    precise float _346 = cb0._m12.y - cb0._m5.y;
    precise float _347 = cb0._m12.z - cb0._m5.z;
    precise float _351 = fma(_339, _345, cb0._m5.x) - _336;
    precise float _352 = fma(_339, _346, cb0._m5.y) - _337;
    precise float _353 = fma(_339, _347, cb0._m5.z) - _338;
    precise float _354 = fma(_234, _351, _336);
    precise float _355 = fma(_234, _352, _337);
    precise float _356 = fma(_234, _353, _338);
    bool _359 = (cb0._m18.y == 0.0) && (cb0._m18.x == 0.0);
    precise float _360 = 1.0 - fma(_230, -_227, _227);
    precise float _364 = fma(_360, _345, cb0._m5.x) - _354;
    precise float _365 = fma(_360, _346, cb0._m5.y) - _355;
    precise float _366 = fma(_360, _347, cb0._m5.z) - _356;
    float _370 = _359 ? _354 : fma(_238, _364, _354);
    float _371 = _359 ? _355 : fma(_238, _365, _355);
    float _372 = _359 ? _356 : fma(_238, _366, _356);
    precise float _373 = -_183;
    precise float _374 = fma(_373, 0.5, 0.189999997615814208984375);
    precise float _375 = fma(_373, 0.5, 0.2100000083446502685546875);
    precise float _378 = _173 - _374;
    precise float _379 = _173 - _375;
    precise float _382 = fma(_183, 0.5, -_374) + 0.189999997615814208984375;
    precise float _383 = fma(_183, 0.5, -_375) + 0.2100000083446502685546875;
    precise float _384 = _378 / _382;
    precise float _385 = _379 / _383;
    precise float _388 = 1.0 - spvNClamp(_385, 0.0, 1.0);
    precise float _391 = _166 - 0.1167768537998199462890625;
    precise float _392 = _173 - 0.02999999932944774627685546875;
    precise float _393 = _391 / _182;
    precise float _394 = _392 / _183;
    precise float _397 = 0.88322317600250244140625 - _166;
    precise float _398 = 0.9700000286102294921875 - _173;
    precise float _399 = _397 / _182;
    precise float _400 = _398 / _183;
    precise float _403 = spvNClamp(_393, 0.0, 1.0) * spvNClamp(_399, 0.0, 1.0);
    precise float _404 = spvNClamp(_394, 0.0, 1.0) * _403;
    precise float _405 = spvNClamp(_400, 0.0, 1.0) * _404;
    precise float _406 = fma(-spvNClamp(_384, 0.0, 1.0), _388, 1.0) * _405;
    precise float _407 = _173 * 10.0;
    precise float _411 = abs(fma(fract(_407), 2.0, -1.0)) - 0.5;
    precise float _413 = sin(_407) * _411;
    precise float _417 = abs(fma(fract(_168), 2.0, -1.0)) - 0.5;
    precise float _419 = sin(_168) * _417;
    precise float _420 = fma(_413, 0.0199999995529651641845703125, _166);
    precise float _421 = fma(_419, 0.0199999995529651641845703125, _173);
    precise float _422 = _420 - 0.089776851236820220947265625;
    precise float _423 = _421 - 0.0030000000260770320892333984375;
    precise float _424 = _422 / _182;
    precise float _425 = _423 / _183;
    precise float _428 = 0.91022312641143798828125 - _420;
    precise float _429 = 0.9969999790191650390625 - _421;
    precise float _430 = _428 / _182;
    precise float _431 = _429 / _183;
    precise float _434 = spvNClamp(_430, 0.0, 1.0) * spvNClamp(_424, 0.0, 1.0);
    precise float _435 = spvNClamp(_425, 0.0, 1.0) * _434;
    if ((fma(_435, spvNClamp(_431, 0.0, 1.0), -0.100000001490116119384765625) < 0.0) && _293)
    {
        demote;
    }
    precise float _454 = (_292 ? fma(_276.x, cb0._m17.x, _370) : _370) - cb0._m9.x;
    precise float _455 = (_292 ? fma(_276.y, cb0._m17.x, _371) : _371) - cb0._m9.y;
    precise float _456 = (_292 ? fma(_276.z, cb0._m17.x, _372) : _372) - cb0._m9.z;
    precise float _457 = fma(_406, _454, cb0._m9.x);
    precise float _458 = fma(_406, _455, cb0._m9.y);
    precise float _459 = fma(_406, _456, cb0._m9.z);
    float _481;
    float _482;
    float _483;
    if (cb0._m14.y != 0.0)
    {
        float _474 = float(texture(sampler2D(t3, s4), vec2(_293 ? _420 : _166, _293 ? _421 : _173)).w >= 0.5);
        precise float _475 = _457 * (-0.39999997615814208984375);
        precise float _476 = _458 * (-0.39999997615814208984375);
        precise float _477 = _459 * (-0.39999997615814208984375);
        _481 = fma(_474, _475, _457);
        _482 = fma(_474, _476, _458);
        _483 = fma(_474, _477, _459);
    }
    else
    {
        _481 = _457;
        _482 = _458;
        _483 = _459;
    }
    vec4 _494 = vec4(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z, 1.0);
    float _599;
    float _600;
    float _601;
    if (cb2._m0.x == 1.0)
    {
        bool _500 = cb2._m0.y == 1.0;
        precise float _506 = TEXCOORD2.y * cb2._m3.x;
        precise float _507 = TEXCOORD2.y * cb2._m3.y;
        precise float _508 = TEXCOORD2.y * cb2._m3.z;
        precise float _530 = fma(cb2._m5.x, TEXCOORD2.z, fma(cb2._m1.x, TEXCOORD2.x, _506)) + cb2._m7.x;
        precise float _531 = fma(cb2._m5.y, TEXCOORD2.z, fma(cb2._m1.y, TEXCOORD2.x, _507)) + cb2._m7.y;
        precise float _532 = fma(cb2._m5.z, TEXCOORD2.z, fma(cb2._m1.z, TEXCOORD2.x, _508)) + cb2._m7.z;
        precise float _541 = (_500 ? _530 : TEXCOORD2.x) - cb2._m11.x;
        precise float _542 = (_500 ? _531 : TEXCOORD2.y) - cb2._m11.y;
        precise float _543 = (_500 ? _532 : TEXCOORD2.z) - cb2._m11.z;
        precise float _549 = _541 * cb2._m9.x;
        precise float _550 = _542 * cb2._m9.y;
        precise float _551 = _543 * cb2._m9.z;
        precise float _552 = _549 * 0.25;
        precise float _555 = cb2._m0.z * 0.5;
        precise float _559 = spvNMin(fma(-cb2._m0.z, 0.5, 0.25), spvNMax(_552, _555));
        precise float _566 = _559 + 0.25;
        precise float _567 = _550 + 0.0;
        precise float _568 = _551 + 0.0;
        precise float _572 = _559 + 0.5;
        _599 = dp4_f32(texture(sampler3D(t4, s0), vec3(_572, _567, _568)), _494);
        _600 = dp4_f32(texture(sampler3D(t4, s0), vec3(_566, _567, _568)), _494);
        _601 = dp4_f32(texture(sampler3D(t4, s0), vec3(_559, _550, _551)), _494);
    }
    else
    {
        uint _585 = (cb3.m.x + SV_InstanceID) * 7u;
        _599 = dp4_f32(cb4.m[_585 + 2u], _494);
        _600 = dp4_f32(cb4.m[_585 + 1u], _494);
        _601 = dp4_f32(cb4.m[_585], _494);
    }
    precise float _608 = _601 + TEXCOORD5.x;
    precise float _609 = _600 + TEXCOORD5.y;
    precise float _610 = _599 + TEXCOORD5.z;
    precise float _614 = _481 - 0.039999999105930328369140625;
    precise float _615 = _482 - 0.039999999105930328369140625;
    precise float _616 = _483 - 0.039999999105930328369140625;
    SV_Target1.x = fma(cb0._m4.y, _614, 0.039999999105930328369140625);
    SV_Target1.y = fma(cb0._m4.y, _615, 0.039999999105930328369140625);
    SV_Target1.z = fma(cb0._m4.y, _616, 0.039999999105930328369140625);
    precise float _627 = fma(-cb0._m4.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _628 = _627 * _481;
    precise float _629 = _627 * _482;
    precise float _630 = _627 * _483;
    precise float _631 = spvNMax(_608, 0.0) * _628;
    precise float _632 = spvNMax(_609, 0.0) * _629;
    precise float _633 = spvNMax(_610, 0.0) * _630;
    SV_Target3.x = exp2(-_631);
    SV_Target3.y = exp2(-_632);
    SV_Target3.z = exp2(-_633);
    SV_Target.x = _628;
    SV_Target.y = _629;
    SV_Target.z = _630;
    SV_Target.w = 1.0;
    SV_Target1.w = cb0._m4.x;
    SV_Target2.x = fma(TEXCOORD1.x, 0.5, 0.5);
    SV_Target2.y = fma(TEXCOORD1.y, 0.5, 0.5);
    SV_Target2.z = fma(TEXCOORD1.z, 0.5, 0.5);
    SV_Target2.w = 1.0;
    SV_Target3.w = 1.0;
}

