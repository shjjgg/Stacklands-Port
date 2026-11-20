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
    vec2 _m8;
    uvec2 _m9;
    vec4 _m10;
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
    vec3 _m0;
    uint _m1;
    vec3 _m2;
    float _m3;
    vec3 _m4;
    float _m5;
    vec4 _m6;
    vec3 _m7;
    uint _m8;
    vec3 _m9;
    uint _m10;
    vec3 _m11;
    float _m12;
    vec4 _m13;
} cb3;

layout(set = 0, binding = 4, std140) uniform cb4_buf
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
} cb4;

layout(set = 0, binding = 5) uniform sampler s0;
layout(set = 0, binding = 6) uniform sampler s1;
layout(set = 0, binding = 7) uniform textureCube t0;
layout(set = 0, binding = 8) uniform textureCube t1;
layout(set = 0, binding = 9) uniform texture3D t2;

layout(location = 1, component = 0) in vec2 TEXCOORD;
layout(location = 2, component = 0) in vec3 TEXCOORD1;
layout(location = 3, component = 0) in vec3 TEXCOORD2;
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

float dp3_f32(vec3 a, vec3 b)
{
    precise float _128 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _128));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _117 = a.x * b.x;
    return fma(a.y, b.y, _117);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _99 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _99)));
}

void main()
{
    precise float _152 = cb1._m4.x - TEXCOORD2.x;
    precise float _153 = cb1._m4.y - TEXCOORD2.y;
    precise float _154 = cb1._m4.z - TEXCOORD2.z;
    vec3 _155 = vec3(_152, _153, _154);
    precise float _157 = inversesqrt(dp3_f32(_155, _155));
    precise float _158 = _157 * _152;
    precise float _159 = _157 * _153;
    precise float _160 = _157 * _154;
    precise float _163 = TEXCOORD.y - 0.5;
    precise float _164 = _163 * 0.3333333432674407958984375;
    precise float _165 = _163 * 150.0;
    precise float _170 = abs(dFdx(_164)) + abs(dFdy(_164));
    precise float _173 = sin(roundEven(_165)) * 43758.546875;
    precise float _175 = fract(_173) - 0.5;
    precise float _178 = fma(_175, 0.004999999888241291046142578125, TEXCOORD.x);
    precise float _179 = _178 * 150.0;
    precise float _182 = sin(roundEven(_179)) * 43758.546875;
    precise float _184 = fract(_182) - 0.5;
    precise float _195 = cb0._m8.x - cb0._m10.x;
    precise float _196 = cb0._m8.y - cb0._m10.x;
    precise float _199 = abs(_178) - _195;
    precise float _200 = abs(fma(_184, 0.00166666670702397823333740234375, _164)) - _196;
    vec2 _203 = vec2(spvNMax(_199, 0.0), spvNMax(_200, 0.0));
    precise float _206 = sqrt(dp2_f32(_203, _203)) / _170;
    precise float _207 = spvNMin(_206, 1.0);
    precise float _216 = fma(_207, -cb0._m6.x, cb0._m6.x);
    precise float _217 = fma(_207, -cb0._m6.y, cb0._m6.y);
    precise float _218 = fma(_207, -cb0._m6.z, cb0._m6.z);
    float _295;
    float _296;
    float _297;
    float _298;
    if (cb4._m0.x == 1.0)
    {
        bool _228 = cb4._m0.y == 1.0;
        precise float _234 = TEXCOORD2.y * cb4._m3.x;
        precise float _235 = TEXCOORD2.y * cb4._m3.y;
        precise float _236 = TEXCOORD2.y * cb4._m3.z;
        precise float _258 = fma(cb4._m5.x, TEXCOORD2.z, fma(cb4._m1.x, TEXCOORD2.x, _234)) + cb4._m7.x;
        precise float _259 = fma(cb4._m5.y, TEXCOORD2.z, fma(cb4._m1.y, TEXCOORD2.x, _235)) + cb4._m7.y;
        precise float _260 = fma(cb4._m5.z, TEXCOORD2.z, fma(cb4._m1.z, TEXCOORD2.x, _236)) + cb4._m7.z;
        precise float _269 = (_228 ? _258 : TEXCOORD2.x) - cb4._m11.x;
        precise float _270 = (_228 ? _259 : TEXCOORD2.y) - cb4._m11.y;
        precise float _271 = (_228 ? _260 : TEXCOORD2.z) - cb4._m11.z;
        precise float _277 = _269 * cb4._m9.x;
        precise float _278 = _270 * cb4._m9.y;
        precise float _279 = _271 * cb4._m9.z;
        vec4 _290 = texture(sampler3D(t2, s1), vec3(spvNMax(fma(_277, 0.25, 0.75), fma(cb4._m0.z, 0.5, 0.75)), _278, _279));
        _295 = _290.w;
        _296 = _290.z;
        _297 = _290.y;
        _298 = _290.x;
    }
    else
    {
        _295 = 1.0;
        _296 = 1.0;
        _297 = 1.0;
        _298 = 1.0;
    }
    precise float _305 = spvNClamp(dp4_f32(vec4(_298, _297, _296, _295), cb2._m47), 0.0, 1.0);
    precise float _308 = 1.0 - cb0._m5.x;
    precise float _309 = -_158;
    precise float _310 = -_159;
    precise float _311 = -_160;
    vec3 _319 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    float _320 = dp3_f32(vec3(_309, _310, _311), _319);
    precise float _321 = _320 + _320;
    precise float _322 = -_321;
    precise float _323 = fma(TEXCOORD1.x, _322, _309);
    precise float _324 = fma(TEXCOORD1.y, _322, _310);
    precise float _325 = fma(TEXCOORD1.z, _322, _311);
    precise float _331 = _305 * cb0._m2.x;
    precise float _332 = _305 * cb0._m2.y;
    precise float _333 = _305 * cb0._m2.z;
    vec3 _338 = vec3(_323, _324, _325);
    float _387;
    float _388;
    float _389;
    if (cb3._m5 > 0.0)
    {
        precise float _342 = inversesqrt(dp3_f32(_338, _338));
        precise float _343 = _342 * _323;
        precise float _344 = _342 * _324;
        precise float _345 = _342 * _325;
        precise float _351 = cb3._m0.x - TEXCOORD2.x;
        precise float _352 = cb3._m0.y - TEXCOORD2.y;
        precise float _353 = cb3._m0.z - TEXCOORD2.z;
        precise float _354 = _351 / _343;
        precise float _355 = _352 / _344;
        precise float _356 = _353 / _345;
        precise float _362 = cb3._m2.x - TEXCOORD2.x;
        precise float _363 = cb3._m2.y - TEXCOORD2.y;
        precise float _364 = cb3._m2.z - TEXCOORD2.z;
        precise float _365 = _362 / _343;
        precise float _366 = _363 / _344;
        precise float _367 = _364 / _345;
        precise float _375 = spvNMin((_345 > 0.0) ? _356 : _367, spvNMin((_344 > 0.0) ? _355 : _366, (_343 > 0.0) ? _354 : _365));
        precise float _381 = TEXCOORD2.x - cb3._m4.x;
        precise float _382 = TEXCOORD2.y - cb3._m4.y;
        precise float _383 = TEXCOORD2.z - cb3._m4.z;
        _387 = fma(_345, _375, _383);
        _388 = fma(_344, _375, _382);
        _389 = fma(_343, _375, _381);
    }
    else
    {
        _387 = _325;
        _388 = _324;
        _389 = _323;
    }
    precise float _392 = fma(-_308, 0.699999988079071044921875, 1.7000000476837158203125) * _308;
    precise float _393 = _392 * 6.0;
    vec4 _399 = textureLod(samplerCube(t0, s0), vec3(_389, _388, _387), _393);
    float _400 = _399.x;
    float _401 = _399.y;
    float _402 = _399.z;
    precise float _404 = _399.w - 1.0;
    precise float _411 = log2(fma(cb3._m6.w, _404, 1.0)) * cb3._m6.y;
    precise float _415 = exp2(_411) * cb3._m6.x;
    precise float _416 = _400 * _415;
    precise float _417 = _401 * _415;
    precise float _418 = _402 * _415;
    float _510;
    float _511;
    float _512;
    if (cb3._m3 < 0.999989986419677734375)
    {
        float _475;
        float _476;
        float _477;
        if (cb3._m12 > 0.0)
        {
            precise float _430 = inversesqrt(dp3_f32(_338, _338));
            precise float _431 = _323 * _430;
            precise float _432 = _324 * _430;
            precise float _433 = _325 * _430;
            precise float _439 = cb3._m7.x - TEXCOORD2.x;
            precise float _440 = cb3._m7.y - TEXCOORD2.y;
            precise float _441 = cb3._m7.z - TEXCOORD2.z;
            precise float _442 = _439 / _431;
            precise float _443 = _440 / _432;
            precise float _444 = _441 / _433;
            precise float _450 = cb3._m9.x - TEXCOORD2.x;
            precise float _451 = cb3._m9.y - TEXCOORD2.y;
            precise float _452 = cb3._m9.z - TEXCOORD2.z;
            precise float _453 = _450 / _431;
            precise float _454 = _451 / _432;
            precise float _455 = _452 / _433;
            precise float _463 = spvNMin((_433 > 0.0) ? _444 : _455, spvNMin((_432 > 0.0) ? _443 : _454, (_431 > 0.0) ? _442 : _453));
            precise float _469 = TEXCOORD2.x - cb3._m11.x;
            precise float _470 = TEXCOORD2.y - cb3._m11.y;
            precise float _471 = TEXCOORD2.z - cb3._m11.z;
            _475 = fma(_433, _463, _471);
            _476 = fma(_432, _463, _470);
            _477 = fma(_431, _463, _469);
        }
        else
        {
            _475 = _325;
            _476 = _324;
            _477 = _323;
        }
        vec4 _481 = textureLod(samplerCube(t1, s0), vec3(_477, _476, _475), _393);
        precise float _486 = _481.w - 1.0;
        precise float _493 = log2(fma(cb3._m13.w, _486, 1.0)) * cb3._m13.y;
        precise float _497 = exp2(_493) * cb3._m13.x;
        precise float _498 = _481.x * _497;
        precise float _499 = _481.y * _497;
        precise float _500 = _481.z * _497;
        _510 = fma(cb3._m3, fma(_415, _402, -_500), _500);
        _511 = fma(cb3._m3, fma(_415, _401, -_499), _499);
        _512 = fma(cb3._m3, fma(_415, _400, -_498), _498);
    }
    else
    {
        _510 = _418;
        _511 = _417;
        _512 = _416;
    }
    precise float _514 = inversesqrt(dp3_f32(_319, _319));
    precise float _515 = _514 * TEXCOORD1.x;
    precise float _516 = _514 * TEXCOORD1.y;
    precise float _517 = _514 * TEXCOORD1.z;
    precise float _518 = _216 - 0.039999999105930328369140625;
    precise float _519 = _217 - 0.039999999105930328369140625;
    precise float _520 = _218 - 0.039999999105930328369140625;
    precise float _523 = fma(cb0._m5.y, _518, 0.039999999105930328369140625);
    precise float _524 = fma(cb0._m5.y, _519, 0.039999999105930328369140625);
    precise float _525 = fma(cb0._m5.y, _520, 0.039999999105930328369140625);
    precise float _527 = fma(-cb0._m5.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _528 = _527 * _216;
    precise float _529 = _527 * _217;
    precise float _530 = _527 * _218;
    precise float _536 = fma(_152, _157, cb2._m0.x);
    precise float _537 = fma(_153, _157, cb2._m0.y);
    precise float _538 = fma(_154, _157, cb2._m0.z);
    vec3 _539 = vec3(_536, _537, _538);
    precise float _542 = inversesqrt(spvNMax(dp3_f32(_539, _539), 0.001000000047497451305389404296875));
    precise float _543 = _542 * _536;
    precise float _544 = _542 * _537;
    precise float _545 = _542 * _538;
    vec3 _546 = vec3(_515, _516, _517);
    precise float _550 = spvNClamp(dp3_f32(_546, cb2._m0), 0.0, 1.0);
    vec3 _551 = vec3(_543, _544, _545);
    precise float _553 = spvNClamp(dp3_f32(_546, _551), 0.0, 1.0);
    precise float _555 = spvNClamp(dp3_f32(cb2._m0, _551), 0.0, 1.0);
    precise float _556 = _555 * _555;
    precise float _560 = dp2_f32(vec2(_556), vec2(_308)) - 0.5;
    precise float _561 = 1.0 - _550;
    precise float _562 = _561 * _561;
    precise float _563 = _562 * _562;
    precise float _564 = _561 * _563;
    precise float _566 = abs(dp3_f32(_546, vec3(_158, _159, _160)));
    precise float _567 = 1.0 - _566;
    precise float _568 = _567 * _567;
    precise float _569 = _568 * _568;
    precise float _570 = _567 * _569;
    precise float _572 = fma(_560, _570, 1.0) * fma(_560, _564, 1.0);
    precise float _573 = _308 * _308;
    precise float _574 = spvNMax(_573, 0.00200000009499490261077880859375);
    precise float _575 = 1.0 - _574;
    precise float _578 = _566 * fma(_550, _575, _574);
    precise float _580 = fma(_550, fma(_566, _575, _574), _578) + 9.9999997473787516355514526367188e-06;
    precise float _581 = 0.5 / _580;
    precise float _582 = _574 * _574;
    precise float _585 = fma(fma(_553, _582, -_553), _553, 1.0);
    precise float _586 = _582 * 0.3183098733425140380859375;
    precise float _588 = _586 / fma(_585, _585, 1.0000000116860974230803549289703e-07);
    precise float _589 = _581 * _588;
    precise float _590 = _589 * 3.1415927410125732421875;
    precise float _591 = _550 * _572;
    precise float _592 = _550 * _590;
    precise float _595 = 1.0 / fma(_574, _574, 1.0);
    vec3 _596 = vec3(_523, _524, _525);
    precise float _600 = spvNMax(_592, 0.0) * ((dp3_f32(_596, _596) == 0.0) ? 0.0 : 1.0);
    precise float _601 = cb0._m5.x - _527;
    precise float _602 = _601 + 1.0;
    precise float _603 = spvNClamp(_602, 0.0, 1.0);
    precise float _604 = _591 * _331;
    precise float _605 = _591 * _332;
    precise float _606 = _591 * _333;
    precise float _607 = _331 * _600;
    precise float _608 = _332 * _600;
    precise float _609 = _333 * _600;
    precise float _610 = 1.0 - _555;
    precise float _611 = _610 * _610;
    precise float _612 = _611 * _611;
    precise float _613 = _610 * _612;
    precise float _614 = 1.0 - _523;
    precise float _615 = 1.0 - _524;
    precise float _616 = 1.0 - _525;
    precise float _620 = fma(_614, _613, _523) * _607;
    precise float _621 = fma(_615, _613, _524) * _608;
    precise float _622 = fma(_616, _613, _525) * _609;
    precise float _626 = _512 * _595;
    precise float _627 = _511 * _595;
    precise float _628 = _510 * _595;
    precise float _629 = _603 - _523;
    precise float _630 = _603 - _524;
    precise float _631 = _603 - _525;
    SV_Target.x = fma(_626, fma(_570, _629, _523), fma(_528, _604, _620));
    SV_Target.y = fma(_627, fma(_570, _630, _524), fma(_529, _605, _621));
    SV_Target.z = fma(_628, fma(_570, _631, _525), fma(_530, _606, _622));
    SV_Target.w = 1.0;
}

