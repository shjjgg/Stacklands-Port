#version 450
#extension GL_EXT_buffer_reference2 : require
#extension GL_EXT_spirv_intrinsics : require

layout(set = 0, binding = 0, std140) uniform cb0_buf
{
    uvec4 _m0;
    uvec4 _m1;
    vec3 _m2;
    uint _m3;
    uvec4 _m4;
    vec4 _m5;
    vec3 _m6;
    uint _m7;
    vec3 _m8;
    uint _m9;
} cb0;

layout(set = 0, binding = 1, std140) uniform cb1_buf
{
    uvec4 _m0;
    uvec4 _m1;
    uvec4 _m2;
    uvec4 _m3;
    vec3 _m4;
    uint _m5;
} cb1;

layout(set = 0, binding = 2, std140) uniform cb2_buf
{
    vec3 _m0;
    uint _m1;
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
    uvec4 _m46;
    vec4 _m47;
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

layout(location = 1, component = 0) in vec2 TEXCOORD;
layout(location = 2, component = 0) in vec3 TEXCOORD1;
layout(location = 3, component = 0) in vec3 TEXCOORD2;
layout(location = 0, component = 0) out vec4 SV_Target;

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
    precise float _124 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _124));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _113 = a.x * b.x;
    return fma(a.y, b.y, _113);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _95 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _95)));
}

void main()
{
    precise float _148 = cb1._m4.x - TEXCOORD2.x;
    precise float _149 = cb1._m4.y - TEXCOORD2.y;
    precise float _150 = cb1._m4.z - TEXCOORD2.z;
    vec3 _151 = vec3(_148, _149, _150);
    precise float _153 = inversesqrt(dp3_f32(_151, _151));
    precise float _154 = _153 * _148;
    precise float _155 = _153 * _149;
    precise float _156 = _153 * _150;
    precise float _161 = TEXCOORD.y * 150.0;
    precise float _162 = TEXCOORD.x * 20.0;
    precise float _163 = TEXCOORD.y * 1.0;
    precise float _166 = sin(roundEven(_161)) * 43758.546875;
    precise float _168 = fma(fract(_166), 0.004999999888241291046142578125, TEXCOORD.x);
    precise float _169 = _168 * 150.0;
    precise float _172 = sin(roundEven(_169)) * 43758.546875;
    precise float _174 = fma(fract(_172), 0.004999999888241291046142578125, TEXCOORD.y);
    precise float _183 = abs(dFdx(_168)) + abs(dFdy(_168));
    precise float _184 = abs(dFdx(_174)) + abs(dFdy(_174));
    precise float _185 = 0.5 - TEXCOORD.x;
    precise float _186 = 0.550000011920928955078125 - TEXCOORD.y;
    vec4 _192 = texture(sampler2D(t0, s1), vec2(_162, _163));
    float _193 = _192.x;
    float _194 = _192.y;
    float _195 = _192.z;
    precise float _202 = _193 * cb0._m6.x;
    precise float _203 = _194 * cb0._m6.y;
    precise float _204 = _195 * cb0._m6.z;
    precise float _205 = TEXCOORD2.x - cb1._m4.x;
    precise float _206 = TEXCOORD2.y - cb1._m4.y;
    precise float _207 = TEXCOORD2.z - cb1._m4.z;
    vec3 _208 = vec3(_205, _206, _207);
    precise float _210 = inversesqrt(dp3_f32(_208, _208));
    precise float _211 = _210 * _205;
    precise float _212 = _210 * _207;
    precise float _213 = TEXCOORD.y + TEXCOORD.x;
    precise float _214 = TEXCOORD.y + TEXCOORD.y;
    precise float _218 = fma(-_212, 5.0, _214);
    precise float _219 = _218 * 10.0;
    precise float _221 = fma(sin(_219), 0.0199999995529651641845703125, fma(-_211, 5.0, _213));
    precise float _222 = _221 * 30.0;
    vec4 _229 = texture(sampler2D(t1, s2), vec2(_221, fma(cos(_222), 0.0199999995529651641845703125, _218)));
    vec2 _235 = vec2(fma(_185, 1.75, 0.0), fma(_186, 1.75, -0.050000011920928955078125));
    precise float _238 = sqrt(dp2_f32(_235, _235)) - 0.400390625;
    precise float _239 = _238 / _183;
    precise float _241 = 1.0 - spvNClamp(_239, 0.0, 1.0);
    precise float _256 = _168 - 0.1167768537998199462890625;
    precise float _257 = _256 / _183;
    precise float _259 = 0.88322317600250244140625 - _168;
    precise float _260 = _259 / _183;
    precise float _262 = spvNClamp(_260, 0.0, 1.0) * spvNClamp(_257, 0.0, 1.0);
    precise float _263 = _174 - 0.02999999932944774627685546875;
    precise float _264 = _263 / _184;
    precise float _266 = _262 * spvNClamp(_264, 0.0, 1.0);
    precise float _267 = 0.9700000286102294921875 - _174;
    precise float _268 = _267 / _184;
    precise float _270 = _266 * spvNClamp(_268, 0.0, 1.0);
    precise float _271 = fma(_229.x, 0.5, fma(_241, fma(-cb0._m6.x, _193, cb0._m8.x), _202));
    precise float _272 = fma(_229.y, 0.5, fma(_241, fma(-cb0._m6.y, _194, cb0._m8.y), _203));
    precise float _273 = fma(_229.z, 0.5, fma(_241, fma(-cb0._m6.z, _195, cb0._m8.z), _204));
    precise float _274 = _270 * _271;
    precise float _275 = _270 * _272;
    precise float _276 = _270 * _273;
    float _354;
    float _355;
    float _356;
    float _357;
    if (cb3._m0.x == 1.0)
    {
        bool _287 = cb3._m0.y == 1.0;
        precise float _293 = TEXCOORD2.y * cb3._m3.x;
        precise float _294 = TEXCOORD2.y * cb3._m3.y;
        precise float _295 = TEXCOORD2.y * cb3._m3.z;
        precise float _317 = fma(cb3._m5.x, TEXCOORD2.z, fma(cb3._m1.x, TEXCOORD2.x, _293)) + cb3._m7.x;
        precise float _318 = fma(cb3._m5.y, TEXCOORD2.z, fma(cb3._m1.y, TEXCOORD2.x, _294)) + cb3._m7.y;
        precise float _319 = fma(cb3._m5.z, TEXCOORD2.z, fma(cb3._m1.z, TEXCOORD2.x, _295)) + cb3._m7.z;
        precise float _328 = (_287 ? _317 : TEXCOORD2.x) - cb3._m11.x;
        precise float _329 = (_287 ? _318 : TEXCOORD2.y) - cb3._m11.y;
        precise float _330 = (_287 ? _319 : TEXCOORD2.z) - cb3._m11.z;
        precise float _336 = _328 * cb3._m9.x;
        precise float _337 = _329 * cb3._m9.y;
        precise float _338 = _330 * cb3._m9.z;
        vec4 _349 = texture(sampler3D(t2, s0), vec3(spvNMax(fma(_336, 0.25, 0.75), fma(cb3._m0.z, 0.5, 0.75)), _337, _338));
        _354 = _349.w;
        _355 = _349.z;
        _356 = _349.y;
        _357 = _349.x;
    }
    else
    {
        _354 = 1.0;
        _355 = 1.0;
        _356 = 1.0;
        _357 = 1.0;
    }
    precise float _364 = spvNClamp(dp4_f32(vec4(_357, _356, _355, _354), cb2._m47), 0.0, 1.0);
    precise float _370 = _364 * cb0._m2.x;
    precise float _371 = _364 * cb0._m2.y;
    precise float _372 = _364 * cb0._m2.z;
    vec3 _379 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    precise float _381 = inversesqrt(dp3_f32(_379, _379));
    precise float _382 = _381 * TEXCOORD1.x;
    precise float _383 = _381 * TEXCOORD1.y;
    precise float _384 = _381 * TEXCOORD1.z;
    precise float _390 = fma(cb0._m5.y, fma(_270, _271, -0.039999999105930328369140625), 0.039999999105930328369140625);
    precise float _391 = fma(cb0._m5.y, fma(_270, _272, -0.039999999105930328369140625), 0.039999999105930328369140625);
    precise float _392 = fma(cb0._m5.y, fma(_270, _273, -0.039999999105930328369140625), 0.039999999105930328369140625);
    precise float _394 = fma(-cb0._m5.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _395 = _394 * _274;
    precise float _396 = _394 * _275;
    precise float _397 = _394 * _276;
    precise float _400 = 1.0 - cb0._m5.x;
    precise float _406 = fma(_148, _153, cb2._m0.x);
    precise float _407 = fma(_149, _153, cb2._m0.y);
    precise float _408 = fma(_150, _153, cb2._m0.z);
    vec3 _409 = vec3(_406, _407, _408);
    precise float _412 = inversesqrt(spvNMax(dp3_f32(_409, _409), 0.001000000047497451305389404296875));
    precise float _413 = _412 * _406;
    precise float _414 = _412 * _407;
    precise float _415 = _412 * _408;
    vec3 _416 = vec3(_382, _383, _384);
    precise float _420 = spvNClamp(dp3_f32(_416, cb2._m0), 0.0, 1.0);
    vec3 _421 = vec3(_413, _414, _415);
    precise float _423 = spvNClamp(dp3_f32(_416, _421), 0.0, 1.0);
    precise float _425 = spvNClamp(dp3_f32(cb2._m0, _421), 0.0, 1.0);
    precise float _426 = _425 * _425;
    precise float _430 = dp2_f32(vec2(_426), vec2(_400)) - 0.5;
    precise float _431 = 1.0 - _420;
    precise float _432 = _431 * _431;
    precise float _433 = _432 * _432;
    precise float _434 = _431 * _433;
    precise float _436 = abs(dp3_f32(_416, vec3(_154, _155, _156)));
    precise float _437 = 1.0 - _436;
    precise float _438 = _437 * _437;
    precise float _439 = _438 * _438;
    precise float _440 = _437 * _439;
    precise float _442 = fma(_430, _440, 1.0) * fma(_430, _434, 1.0);
    precise float _443 = _400 * _400;
    precise float _444 = spvNMax(_443, 0.00200000009499490261077880859375);
    precise float _445 = 1.0 - _444;
    precise float _448 = _436 * fma(_420, _445, _444);
    precise float _450 = fma(_420, fma(_436, _445, _444), _448) + 9.9999997473787516355514526367188e-06;
    precise float _451 = 0.5 / _450;
    precise float _452 = _444 * _444;
    precise float _455 = fma(fma(_423, _452, -_423), _423, 1.0);
    precise float _456 = _452 * 0.3183098733425140380859375;
    precise float _458 = _456 / fma(_455, _455, 1.0000000116860974230803549289703e-07);
    precise float _459 = _458 * _451;
    precise float _460 = _459 * 3.1415927410125732421875;
    precise float _461 = _420 * _442;
    precise float _462 = _420 * _460;
    vec3 _464 = vec3(_390, _391, _392);
    precise float _468 = ((dp3_f32(_464, _464) == 0.0) ? 0.0 : 1.0) * spvNMax(_462, 0.0);
    precise float _469 = _461 * _370;
    precise float _470 = _461 * _371;
    precise float _471 = _461 * _372;
    precise float _472 = _370 * _468;
    precise float _473 = _371 * _468;
    precise float _474 = _372 * _468;
    precise float _475 = 1.0 - _425;
    precise float _476 = _475 * _475;
    precise float _477 = _476 * _476;
    precise float _478 = _475 * _477;
    precise float _479 = 1.0 - _390;
    precise float _480 = 1.0 - _391;
    precise float _481 = 1.0 - _392;
    precise float _485 = _472 * fma(_479, _478, _390);
    precise float _486 = _473 * fma(_480, _478, _391);
    precise float _487 = _474 * fma(_481, _478, _392);
    SV_Target.x = fma(_395, _469, _485);
    SV_Target.y = fma(_396, _470, _486);
    SV_Target.z = fma(_397, _471, _487);
    SV_Target.w = 1.0;
}

