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
    vec2 _m5;
    uvec2 _m6;
    vec2 _m7;
    uvec2 _m8;
    vec2 _m9;
    uvec2 _m10;
    vec2 _m11;
    uvec2 _m12;
    vec4 _m13;
    vec3 _m14;
    uint _m15;
    vec3 _m16;
    uint _m17;
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
layout(set = 0, binding = 7) uniform sampler s3;
layout(set = 0, binding = 8) uniform texture2D t0;
layout(set = 0, binding = 9) uniform texture2D t1;
layout(set = 0, binding = 10) uniform texture2D t2;
layout(set = 0, binding = 11) uniform texture3D t3;

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
    precise float _127 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _127));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _116 = a.x * b.x;
    return fma(a.y, b.y, _116);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _98 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _98)));
}

void main()
{
    precise float _151 = cb1._m4.x - TEXCOORD2.x;
    precise float _152 = cb1._m4.y - TEXCOORD2.y;
    precise float _153 = cb1._m4.z - TEXCOORD2.z;
    vec3 _154 = vec3(_151, _152, _153);
    precise float _156 = inversesqrt(dp3_f32(_154, _154));
    precise float _157 = _156 * _151;
    precise float _158 = _156 * _152;
    precise float _159 = _156 * _153;
    precise float _164 = TEXCOORD.y * 150.0;
    precise float _165 = TEXCOORD.x * 20.0;
    precise float _166 = TEXCOORD.y * 1.0;
    precise float _169 = sin(roundEven(_164)) * 43758.546875;
    precise float _171 = fma(fract(_169), 0.004999999888241291046142578125, TEXCOORD.x);
    precise float _172 = _171 * 150.0;
    precise float _175 = sin(roundEven(_172)) * 43758.546875;
    precise float _177 = fma(fract(_175), 0.004999999888241291046142578125, TEXCOORD.y);
    precise float _186 = abs(dFdx(_171)) + abs(dFdy(_171));
    precise float _187 = abs(dFdx(_177)) + abs(dFdy(_177));
    precise float _188 = 0.5 - TEXCOORD.x;
    precise float _189 = 0.550000011920928955078125 - TEXCOORD.y;
    vec4 _195 = texture(sampler2D(t0, s2), vec2(_165, _166));
    float _196 = _195.x;
    float _197 = _195.y;
    float _198 = _195.z;
    precise float _205 = _196 * cb0._m14.x;
    precise float _206 = _197 * cb0._m14.y;
    precise float _207 = _198 * cb0._m14.z;
    precise float _208 = TEXCOORD2.x - cb1._m4.x;
    precise float _209 = TEXCOORD2.y - cb1._m4.y;
    precise float _210 = TEXCOORD2.z - cb1._m4.z;
    vec3 _211 = vec3(_208, _209, _210);
    precise float _213 = inversesqrt(dp3_f32(_211, _211));
    precise float _214 = _213 * _208;
    precise float _215 = _213 * _210;
    precise float _216 = TEXCOORD.y + TEXCOORD.x;
    precise float _217 = TEXCOORD.y + TEXCOORD.y;
    precise float _221 = fma(-_215, 5.0, _217);
    precise float _222 = _221 * 10.0;
    precise float _224 = fma(sin(_222), 0.0199999995529651641845703125, fma(-_214, 5.0, _216));
    precise float _225 = _224 * 30.0;
    vec4 _232 = texture(sampler2D(t1, s3), vec2(_224, fma(cos(_225), 0.0199999995529651641845703125, _221)));
    vec2 _238 = vec2(fma(_188, 1.75, 0.0), fma(_189, 1.75, -0.050000011920928955078125));
    precise float _241 = sqrt(dp2_f32(_238, _238)) - 0.400390625;
    precise float _242 = _241 / _186;
    precise float _244 = 1.0 - spvNClamp(_242, 0.0, 1.0);
    precise float _259 = _171 - 0.1167768537998199462890625;
    precise float _260 = _259 / _186;
    precise float _262 = 0.88322317600250244140625 - _171;
    precise float _263 = _262 / _186;
    precise float _265 = spvNClamp(_263, 0.0, 1.0) * spvNClamp(_260, 0.0, 1.0);
    precise float _266 = _177 - 0.02999999932944774627685546875;
    precise float _267 = _266 / _187;
    precise float _269 = _265 * spvNClamp(_267, 0.0, 1.0);
    precise float _270 = 0.9700000286102294921875 - _177;
    precise float _271 = _270 / _187;
    precise float _273 = _269 * spvNClamp(_271, 0.0, 1.0);
    precise float _274 = fma(_232.x, 0.5, fma(_244, fma(-cb0._m14.x, _196, cb0._m16.x), _205));
    precise float _275 = fma(_232.y, 0.5, fma(_244, fma(-cb0._m14.y, _197, cb0._m16.y), _206));
    precise float _276 = fma(_232.z, 0.5, fma(_244, fma(-cb0._m14.z, _198, cb0._m16.z), _207));
    precise float _277 = _273 * _274;
    precise float _278 = _273 * _275;
    precise float _279 = _273 * _276;
    precise float _285 = TEXCOORD2.y * cb0._m7.x;
    precise float _286 = TEXCOORD2.y * cb0._m7.y;
    precise float _303 = fma(cb0._m9.x, TEXCOORD2.z, fma(cb0._m5.x, TEXCOORD2.x, _285)) + cb0._m11.x;
    precise float _304 = fma(cb0._m9.y, TEXCOORD2.z, fma(cb0._m5.y, TEXCOORD2.x, _286)) + cb0._m11.y;
    float _382;
    float _383;
    float _384;
    float _385;
    if (cb3._m0.x == 1.0)
    {
        bool _315 = cb3._m0.y == 1.0;
        precise float _321 = TEXCOORD2.y * cb3._m3.x;
        precise float _322 = TEXCOORD2.y * cb3._m3.y;
        precise float _323 = TEXCOORD2.y * cb3._m3.z;
        precise float _345 = fma(cb3._m5.x, TEXCOORD2.z, fma(cb3._m1.x, TEXCOORD2.x, _321)) + cb3._m7.x;
        precise float _346 = fma(cb3._m5.y, TEXCOORD2.z, fma(cb3._m1.y, TEXCOORD2.x, _322)) + cb3._m7.y;
        precise float _347 = fma(cb3._m5.z, TEXCOORD2.z, fma(cb3._m1.z, TEXCOORD2.x, _323)) + cb3._m7.z;
        precise float _356 = (_315 ? _345 : TEXCOORD2.x) - cb3._m11.x;
        precise float _357 = (_315 ? _346 : TEXCOORD2.y) - cb3._m11.y;
        precise float _358 = (_315 ? _347 : TEXCOORD2.z) - cb3._m11.z;
        precise float _364 = _356 * cb3._m9.x;
        precise float _365 = _357 * cb3._m9.y;
        precise float _366 = _358 * cb3._m9.z;
        vec4 _377 = texture(sampler3D(t3, s0), vec3(spvNMax(fma(_364, 0.25, 0.75), fma(cb3._m0.z, 0.5, 0.75)), _365, _366));
        _382 = _377.w;
        _383 = _377.z;
        _384 = _377.y;
        _385 = _377.x;
    }
    else
    {
        _382 = 1.0;
        _383 = 1.0;
        _384 = 1.0;
        _385 = 1.0;
    }
    precise float _399 = spvNClamp(dp4_f32(vec4(_385, _384, _383, _382), cb2._m47), 0.0, 1.0) * texture(sampler2D(t2, s1), vec2(_303, _304)).w;
    precise float _405 = _399 * cb0._m2.x;
    precise float _406 = _399 * cb0._m2.y;
    precise float _407 = _399 * cb0._m2.z;
    vec3 _414 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    precise float _416 = inversesqrt(dp3_f32(_414, _414));
    precise float _417 = _416 * TEXCOORD1.x;
    precise float _418 = _416 * TEXCOORD1.y;
    precise float _419 = _416 * TEXCOORD1.z;
    precise float _425 = fma(cb0._m13.y, fma(_273, _274, -0.039999999105930328369140625), 0.039999999105930328369140625);
    precise float _426 = fma(cb0._m13.y, fma(_273, _275, -0.039999999105930328369140625), 0.039999999105930328369140625);
    precise float _427 = fma(cb0._m13.y, fma(_273, _276, -0.039999999105930328369140625), 0.039999999105930328369140625);
    precise float _429 = fma(-cb0._m13.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _430 = _429 * _277;
    precise float _431 = _429 * _278;
    precise float _432 = _429 * _279;
    precise float _435 = 1.0 - cb0._m13.x;
    precise float _441 = fma(_151, _156, cb2._m0.x);
    precise float _442 = fma(_152, _156, cb2._m0.y);
    precise float _443 = fma(_153, _156, cb2._m0.z);
    vec3 _444 = vec3(_441, _442, _443);
    precise float _447 = inversesqrt(spvNMax(dp3_f32(_444, _444), 0.001000000047497451305389404296875));
    precise float _448 = _447 * _441;
    precise float _449 = _447 * _442;
    precise float _450 = _447 * _443;
    vec3 _451 = vec3(_417, _418, _419);
    precise float _455 = spvNClamp(dp3_f32(_451, cb2._m0), 0.0, 1.0);
    vec3 _456 = vec3(_448, _449, _450);
    precise float _458 = spvNClamp(dp3_f32(_451, _456), 0.0, 1.0);
    precise float _460 = spvNClamp(dp3_f32(cb2._m0, _456), 0.0, 1.0);
    precise float _461 = _460 * _460;
    precise float _465 = dp2_f32(vec2(_461), vec2(_435)) - 0.5;
    precise float _466 = 1.0 - _455;
    precise float _467 = _466 * _466;
    precise float _468 = _467 * _467;
    precise float _469 = _466 * _468;
    precise float _471 = abs(dp3_f32(_451, vec3(_157, _158, _159)));
    precise float _472 = 1.0 - _471;
    precise float _473 = _472 * _472;
    precise float _474 = _473 * _473;
    precise float _475 = _472 * _474;
    precise float _477 = fma(_465, _475, 1.0) * fma(_465, _469, 1.0);
    precise float _478 = _435 * _435;
    precise float _479 = spvNMax(_478, 0.00200000009499490261077880859375);
    precise float _480 = 1.0 - _479;
    precise float _483 = _471 * fma(_455, _480, _479);
    precise float _485 = fma(_455, fma(_471, _480, _479), _483) + 9.9999997473787516355514526367188e-06;
    precise float _486 = 0.5 / _485;
    precise float _487 = _479 * _479;
    precise float _490 = fma(fma(_458, _487, -_458), _458, 1.0);
    precise float _491 = _487 * 0.3183098733425140380859375;
    precise float _493 = _491 / fma(_490, _490, 1.0000000116860974230803549289703e-07);
    precise float _494 = _493 * _486;
    precise float _495 = _494 * 3.1415927410125732421875;
    precise float _496 = _455 * _477;
    precise float _497 = _455 * _495;
    vec3 _499 = vec3(_425, _426, _427);
    precise float _503 = ((dp3_f32(_499, _499) == 0.0) ? 0.0 : 1.0) * spvNMax(_497, 0.0);
    precise float _504 = _496 * _405;
    precise float _505 = _496 * _406;
    precise float _506 = _496 * _407;
    precise float _507 = _405 * _503;
    precise float _508 = _406 * _503;
    precise float _509 = _407 * _503;
    precise float _510 = 1.0 - _460;
    precise float _511 = _510 * _510;
    precise float _512 = _511 * _511;
    precise float _513 = _510 * _512;
    precise float _514 = 1.0 - _425;
    precise float _515 = 1.0 - _426;
    precise float _516 = 1.0 - _427;
    precise float _520 = _507 * fma(_514, _513, _425);
    precise float _521 = _508 * fma(_515, _513, _426);
    precise float _522 = _509 * fma(_516, _513, _427);
    SV_Target.x = fma(_430, _504, _520);
    SV_Target.y = fma(_431, _505, _521);
    SV_Target.z = fma(_432, _506, _522);
    SV_Target.w = 1.0;
}

