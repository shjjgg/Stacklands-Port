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
    vec3 _m5;
    uint _m6;
    vec3 _m7;
    uint _m8;
    vec3 _m9;
    uint _m10;
    vec3 _m11;
    uint _m12;
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
    precise float _151 = cb2._m0.x - TEXCOORD2.x;
    precise float _152 = cb2._m0.y - TEXCOORD2.y;
    precise float _153 = cb2._m0.z - TEXCOORD2.z;
    vec3 _154 = vec3(_151, _152, _153);
    precise float _156 = inversesqrt(dp3_f32(_154, _154));
    precise float _157 = _156 * _151;
    precise float _158 = _156 * _152;
    precise float _159 = _156 * _153;
    precise float _166 = cb1._m4.x - TEXCOORD2.x;
    precise float _167 = cb1._m4.y - TEXCOORD2.y;
    precise float _168 = cb1._m4.z - TEXCOORD2.z;
    vec3 _169 = vec3(_166, _167, _168);
    precise float _171 = inversesqrt(dp3_f32(_169, _169));
    precise float _172 = _171 * _166;
    precise float _173 = _171 * _167;
    precise float _174 = _171 * _168;
    precise float _179 = TEXCOORD.y * 150.0;
    precise float _180 = TEXCOORD.x * 20.0;
    precise float _181 = TEXCOORD.y * 1.0;
    precise float _184 = sin(roundEven(_179)) * 43758.546875;
    precise float _186 = fma(fract(_184), 0.004999999888241291046142578125, TEXCOORD.x);
    precise float _187 = _186 * 150.0;
    precise float _190 = sin(roundEven(_187)) * 43758.546875;
    precise float _192 = fma(fract(_190), 0.004999999888241291046142578125, TEXCOORD.y);
    precise float _201 = abs(dFdx(_186)) + abs(dFdy(_186));
    precise float _202 = abs(dFdx(_192)) + abs(dFdy(_192));
    precise float _203 = 0.5 - TEXCOORD.x;
    precise float _204 = 0.550000011920928955078125 - TEXCOORD.y;
    vec4 _210 = texture(sampler2D(t0, s2), vec2(_180, _181));
    float _211 = _210.x;
    float _212 = _210.y;
    float _213 = _210.z;
    precise float _220 = _211 * cb0._m14.x;
    precise float _221 = _212 * cb0._m14.y;
    precise float _222 = _213 * cb0._m14.z;
    precise float _223 = TEXCOORD2.x - cb1._m4.x;
    precise float _224 = TEXCOORD2.y - cb1._m4.y;
    precise float _225 = TEXCOORD2.z - cb1._m4.z;
    vec3 _226 = vec3(_223, _224, _225);
    precise float _228 = inversesqrt(dp3_f32(_226, _226));
    precise float _229 = _228 * _223;
    precise float _230 = _228 * _225;
    precise float _231 = TEXCOORD.y + TEXCOORD.x;
    precise float _232 = TEXCOORD.y + TEXCOORD.y;
    precise float _236 = fma(-_230, 5.0, _232);
    precise float _237 = _236 * 10.0;
    precise float _239 = fma(sin(_237), 0.0199999995529651641845703125, fma(-_229, 5.0, _231));
    precise float _240 = _239 * 30.0;
    vec4 _247 = texture(sampler2D(t1, s3), vec2(_239, fma(cos(_240), 0.0199999995529651641845703125, _236)));
    vec2 _253 = vec2(fma(_203, 1.75, 0.0), fma(_204, 1.75, -0.050000011920928955078125));
    precise float _256 = sqrt(dp2_f32(_253, _253)) - 0.400390625;
    precise float _257 = _256 / _201;
    precise float _259 = 1.0 - spvNClamp(_257, 0.0, 1.0);
    precise float _274 = _186 - 0.1167768537998199462890625;
    precise float _275 = _274 / _201;
    precise float _277 = 0.88322317600250244140625 - _186;
    precise float _278 = _277 / _201;
    precise float _280 = spvNClamp(_278, 0.0, 1.0) * spvNClamp(_275, 0.0, 1.0);
    precise float _281 = _192 - 0.02999999932944774627685546875;
    precise float _282 = _281 / _202;
    precise float _284 = _280 * spvNClamp(_282, 0.0, 1.0);
    precise float _285 = 0.9700000286102294921875 - _192;
    precise float _286 = _285 / _202;
    precise float _288 = _284 * spvNClamp(_286, 0.0, 1.0);
    precise float _289 = fma(_247.x, 0.5, fma(_259, fma(-cb0._m14.x, _211, cb0._m16.x), _220));
    precise float _290 = fma(_247.y, 0.5, fma(_259, fma(-cb0._m14.y, _212, cb0._m16.y), _221));
    precise float _291 = fma(_247.z, 0.5, fma(_259, fma(-cb0._m14.z, _213, cb0._m16.z), _222));
    precise float _292 = _288 * _289;
    precise float _293 = _288 * _290;
    precise float _294 = _288 * _291;
    precise float _300 = TEXCOORD2.y * cb0._m7.x;
    precise float _301 = TEXCOORD2.y * cb0._m7.y;
    precise float _302 = TEXCOORD2.y * cb0._m7.z;
    precise float _324 = fma(cb0._m9.x, TEXCOORD2.z, fma(cb0._m5.x, TEXCOORD2.x, _300)) + cb0._m11.x;
    precise float _325 = fma(cb0._m9.y, TEXCOORD2.z, fma(cb0._m5.y, TEXCOORD2.x, _301)) + cb0._m11.y;
    precise float _326 = fma(cb0._m9.z, TEXCOORD2.z, fma(cb0._m5.z, TEXCOORD2.x, _302)) + cb0._m11.z;
    float _404;
    float _405;
    float _406;
    float _407;
    if (cb3._m0.x == 1.0)
    {
        bool _337 = cb3._m0.y == 1.0;
        precise float _343 = TEXCOORD2.y * cb3._m3.x;
        precise float _344 = TEXCOORD2.y * cb3._m3.y;
        precise float _345 = TEXCOORD2.y * cb3._m3.z;
        precise float _367 = fma(cb3._m5.x, TEXCOORD2.z, fma(cb3._m1.x, TEXCOORD2.x, _343)) + cb3._m7.x;
        precise float _368 = fma(cb3._m5.y, TEXCOORD2.z, fma(cb3._m1.y, TEXCOORD2.x, _344)) + cb3._m7.y;
        precise float _369 = fma(cb3._m5.z, TEXCOORD2.z, fma(cb3._m1.z, TEXCOORD2.x, _345)) + cb3._m7.z;
        precise float _378 = (_337 ? _367 : TEXCOORD2.x) - cb3._m11.x;
        precise float _379 = (_337 ? _368 : TEXCOORD2.y) - cb3._m11.y;
        precise float _380 = (_337 ? _369 : TEXCOORD2.z) - cb3._m11.z;
        precise float _386 = _378 * cb3._m9.x;
        precise float _387 = _379 * cb3._m9.y;
        precise float _388 = _380 * cb3._m9.z;
        vec4 _399 = texture(sampler3D(t3, s0), vec3(spvNMax(fma(_386, 0.25, 0.75), fma(cb3._m0.z, 0.5, 0.75)), _387, _388));
        _404 = _399.w;
        _405 = _399.z;
        _406 = _399.y;
        _407 = _399.x;
    }
    else
    {
        _404 = 1.0;
        _405 = 1.0;
        _406 = 1.0;
        _407 = 1.0;
    }
    vec3 _414 = vec3(_324, _325, _326);
    precise float _422 = spvNClamp(dp4_f32(vec4(_407, _406, _405, _404), cb2._m47), 0.0, 1.0) * texture(sampler2D(t2, s1), vec2(dp3_f32(_414, _414))).x;
    precise float _428 = _422 * cb0._m2.x;
    precise float _429 = _422 * cb0._m2.y;
    precise float _430 = _422 * cb0._m2.z;
    vec3 _437 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    precise float _439 = inversesqrt(dp3_f32(_437, _437));
    precise float _440 = _439 * TEXCOORD1.x;
    precise float _441 = _439 * TEXCOORD1.y;
    precise float _442 = _439 * TEXCOORD1.z;
    precise float _448 = fma(cb0._m13.y, fma(_288, _289, -0.039999999105930328369140625), 0.039999999105930328369140625);
    precise float _449 = fma(cb0._m13.y, fma(_288, _290, -0.039999999105930328369140625), 0.039999999105930328369140625);
    precise float _450 = fma(cb0._m13.y, fma(_288, _291, -0.039999999105930328369140625), 0.039999999105930328369140625);
    precise float _452 = fma(-cb0._m13.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _453 = _452 * _292;
    precise float _454 = _452 * _293;
    precise float _455 = _452 * _294;
    precise float _458 = 1.0 - cb0._m13.x;
    precise float _459 = fma(_151, _156, _172);
    precise float _460 = fma(_152, _156, _173);
    precise float _461 = fma(_153, _156, _174);
    vec3 _462 = vec3(_459, _460, _461);
    precise float _465 = inversesqrt(spvNMax(dp3_f32(_462, _462), 0.001000000047497451305389404296875));
    precise float _466 = _465 * _459;
    precise float _467 = _465 * _460;
    precise float _468 = _465 * _461;
    vec3 _469 = vec3(_440, _441, _442);
    vec3 _472 = vec3(_157, _158, _159);
    precise float _474 = spvNClamp(dp3_f32(_469, _472), 0.0, 1.0);
    vec3 _475 = vec3(_466, _467, _468);
    precise float _477 = spvNClamp(dp3_f32(_469, _475), 0.0, 1.0);
    precise float _479 = spvNClamp(dp3_f32(_472, _475), 0.0, 1.0);
    precise float _480 = _479 * _479;
    precise float _484 = dp2_f32(vec2(_480), vec2(_458)) - 0.5;
    precise float _485 = 1.0 - _474;
    precise float _486 = _485 * _485;
    precise float _487 = _486 * _486;
    precise float _488 = _485 * _487;
    precise float _490 = abs(dp3_f32(_469, vec3(_172, _173, _174)));
    precise float _491 = 1.0 - _490;
    precise float _492 = _491 * _491;
    precise float _493 = _492 * _492;
    precise float _494 = _491 * _493;
    precise float _496 = fma(_484, _494, 1.0) * fma(_484, _488, 1.0);
    precise float _497 = _458 * _458;
    precise float _498 = spvNMax(_497, 0.00200000009499490261077880859375);
    precise float _499 = 1.0 - _498;
    precise float _502 = _490 * fma(_474, _499, _498);
    precise float _504 = fma(_474, fma(_490, _499, _498), _502) + 9.9999997473787516355514526367188e-06;
    precise float _505 = 0.5 / _504;
    precise float _506 = _498 * _498;
    precise float _509 = fma(fma(_477, _506, -_477), _477, 1.0);
    precise float _510 = _506 * 0.3183098733425140380859375;
    precise float _512 = _510 / fma(_509, _509, 1.0000000116860974230803549289703e-07);
    precise float _513 = _512 * _505;
    precise float _514 = _513 * 3.1415927410125732421875;
    precise float _515 = _474 * _496;
    precise float _516 = _474 * _514;
    vec3 _518 = vec3(_448, _449, _450);
    precise float _522 = ((dp3_f32(_518, _518) == 0.0) ? 0.0 : 1.0) * spvNMax(_516, 0.0);
    precise float _523 = _515 * _428;
    precise float _524 = _515 * _429;
    precise float _525 = _515 * _430;
    precise float _526 = _428 * _522;
    precise float _527 = _429 * _522;
    precise float _528 = _430 * _522;
    precise float _529 = 1.0 - _479;
    precise float _530 = _529 * _529;
    precise float _531 = _530 * _530;
    precise float _532 = _529 * _531;
    precise float _533 = 1.0 - _448;
    precise float _534 = 1.0 - _449;
    precise float _535 = 1.0 - _450;
    precise float _539 = _526 * fma(_533, _532, _448);
    precise float _540 = _527 * fma(_534, _532, _449);
    precise float _541 = _528 * fma(_535, _532, _450);
    SV_Target.x = fma(_453, _523, _539);
    SV_Target.y = fma(_454, _524, _540);
    SV_Target.z = fma(_455, _525, _541);
    SV_Target.w = 1.0;
}

