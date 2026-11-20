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
    uvec4 _m18;
    vec3 _m19;
    uint _m20;
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
    precise float _177 = TEXCOORD.y * 150.0;
    precise float _180 = sin(roundEven(_177)) * 43758.546875;
    precise float _184 = fma(fract(_180), 0.004999999888241291046142578125, TEXCOORD.x);
    precise float _185 = _184 * 150.0;
    precise float _188 = sin(roundEven(_185)) * 43758.546875;
    precise float _190 = fma(fract(_188), 0.004999999888241291046142578125, TEXCOORD.y);
    precise float _199 = abs(dFdx(_184)) + abs(dFdy(_184));
    precise float _200 = abs(dFdx(_190)) + abs(dFdy(_190));
    precise float _201 = TEXCOORD.x - 0.5;
    precise float _202 = TEXCOORD.y - 0.4000000059604644775390625;
    precise float _203 = fma(_201, 1.75, 0.5);
    precise float _204 = fma(_202, 1.75, 0.4000000059604644775390625);
    precise float _216 = float(_203 >= 0.0) * float(_203 <= 1.0);
    precise float _217 = float(_204 >= 0.0) * _216;
    vec4 _223 = texture(sampler2D(t0, s2), vec2(_203, _204));
    float _224 = _223.x;
    float _225 = _223.w;
    precise float _227 = fma(-_217, float(_204 <= 1.0), 1.0);
    precise float _231 = fma(_227, -_225, _225);
    precise float _232 = TEXCOORD2.x - cb1._m4.x;
    precise float _233 = TEXCOORD2.y - cb1._m4.y;
    precise float _234 = TEXCOORD2.z - cb1._m4.z;
    vec3 _235 = vec3(_232, _233, _234);
    precise float _237 = inversesqrt(dp3_f32(_235, _235));
    precise float _238 = _237 * _232;
    precise float _239 = _237 * _234;
    precise float _240 = TEXCOORD.y + TEXCOORD.x;
    precise float _241 = TEXCOORD.y + TEXCOORD.y;
    precise float _245 = fma(-_239, 5.0, _241);
    precise float _246 = _245 * 10.0;
    precise float _248 = fma(sin(_246), 0.0199999995529651641845703125, fma(-_238, 5.0, _240));
    precise float _249 = _248 * 30.0;
    vec4 _256 = texture(sampler2D(t1, s3), vec2(_248, fma(cos(_249), 0.0199999995529651641845703125, _245)));
    vec2 _260 = vec2(fma(_201, 1.75, 0.0), fma(_202, 1.75, -0.0999999940395355224609375));
    precise float _263 = sqrt(dp2_f32(_260, _260)) - 0.400390625;
    precise float _264 = _263 / _199;
    precise float _266 = 1.0 - spvNClamp(_264, 0.0, 1.0);
    precise float _278 = cb0._m16.x - cb0._m14.x;
    precise float _279 = cb0._m16.y - cb0._m14.y;
    precise float _280 = cb0._m16.z - cb0._m14.z;
    precise float _281 = fma(_266, _278, cb0._m14.x);
    precise float _282 = fma(_266, _279, cb0._m14.y);
    precise float _283 = fma(_266, _280, cb0._m14.z);
    precise float _284 = 1.0 - fma(_227, -_224, _224);
    precise float _290 = cb0._m19.x - cb0._m14.x;
    precise float _291 = cb0._m19.y - cb0._m14.y;
    precise float _292 = cb0._m19.z - cb0._m14.z;
    precise float _296 = fma(_284, _290, cb0._m14.x) - _281;
    precise float _297 = fma(_284, _291, cb0._m14.y) - _282;
    precise float _298 = fma(_284, _292, cb0._m14.z) - _283;
    precise float _302 = _184 - 0.1167768537998199462890625;
    precise float _303 = _302 / _199;
    precise float _305 = 0.88322317600250244140625 - _184;
    precise float _306 = _305 / _199;
    precise float _308 = spvNClamp(_306, 0.0, 1.0) * spvNClamp(_303, 0.0, 1.0);
    precise float _309 = _190 - 0.02999999932944774627685546875;
    precise float _310 = _309 / _200;
    precise float _312 = _308 * spvNClamp(_310, 0.0, 1.0);
    precise float _313 = 0.9700000286102294921875 - _190;
    precise float _314 = _313 / _200;
    precise float _316 = _312 * spvNClamp(_314, 0.0, 1.0);
    precise float _317 = fma(_256.x, 0.5, fma(_231, _296, _281));
    precise float _318 = fma(_256.y, 0.5, fma(_231, _297, _282));
    precise float _319 = fma(_256.z, 0.5, fma(_231, _298, _283));
    precise float _320 = _316 * _317;
    precise float _321 = _316 * _318;
    precise float _322 = _316 * _319;
    precise float _328 = TEXCOORD2.y * cb0._m7.x;
    precise float _329 = TEXCOORD2.y * cb0._m7.y;
    precise float _330 = TEXCOORD2.y * cb0._m7.z;
    precise float _352 = fma(cb0._m9.x, TEXCOORD2.z, fma(cb0._m5.x, TEXCOORD2.x, _328)) + cb0._m11.x;
    precise float _353 = fma(cb0._m9.y, TEXCOORD2.z, fma(cb0._m5.y, TEXCOORD2.x, _329)) + cb0._m11.y;
    precise float _354 = fma(cb0._m9.z, TEXCOORD2.z, fma(cb0._m5.z, TEXCOORD2.x, _330)) + cb0._m11.z;
    float _431;
    float _432;
    float _433;
    float _434;
    if (cb3._m0.x == 1.0)
    {
        bool _364 = cb3._m0.y == 1.0;
        precise float _370 = TEXCOORD2.y * cb3._m3.x;
        precise float _371 = TEXCOORD2.y * cb3._m3.y;
        precise float _372 = TEXCOORD2.y * cb3._m3.z;
        precise float _394 = fma(cb3._m5.x, TEXCOORD2.z, fma(cb3._m1.x, TEXCOORD2.x, _370)) + cb3._m7.x;
        precise float _395 = fma(cb3._m5.y, TEXCOORD2.z, fma(cb3._m1.y, TEXCOORD2.x, _371)) + cb3._m7.y;
        precise float _396 = fma(cb3._m5.z, TEXCOORD2.z, fma(cb3._m1.z, TEXCOORD2.x, _372)) + cb3._m7.z;
        precise float _405 = (_364 ? _394 : TEXCOORD2.x) - cb3._m11.x;
        precise float _406 = (_364 ? _395 : TEXCOORD2.y) - cb3._m11.y;
        precise float _407 = (_364 ? _396 : TEXCOORD2.z) - cb3._m11.z;
        precise float _413 = _405 * cb3._m9.x;
        precise float _414 = _406 * cb3._m9.y;
        precise float _415 = _407 * cb3._m9.z;
        vec4 _426 = texture(sampler3D(t3, s0), vec3(spvNMax(fma(_413, 0.25, 0.75), fma(cb3._m0.z, 0.5, 0.75)), _414, _415));
        _431 = _426.w;
        _432 = _426.z;
        _433 = _426.y;
        _434 = _426.x;
    }
    else
    {
        _431 = 1.0;
        _432 = 1.0;
        _433 = 1.0;
        _434 = 1.0;
    }
    vec3 _441 = vec3(_352, _353, _354);
    precise float _449 = spvNClamp(dp4_f32(vec4(_434, _433, _432, _431), cb2._m47), 0.0, 1.0) * texture(sampler2D(t2, s1), vec2(dp3_f32(_441, _441))).x;
    precise float _455 = _449 * cb0._m2.x;
    precise float _456 = _449 * cb0._m2.y;
    precise float _457 = _449 * cb0._m2.z;
    vec3 _464 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    precise float _466 = inversesqrt(dp3_f32(_464, _464));
    precise float _467 = _466 * TEXCOORD1.x;
    precise float _468 = _466 * TEXCOORD1.y;
    precise float _469 = _466 * TEXCOORD1.z;
    precise float _475 = fma(cb0._m13.y, fma(_316, _317, -0.039999999105930328369140625), 0.039999999105930328369140625);
    precise float _476 = fma(cb0._m13.y, fma(_316, _318, -0.039999999105930328369140625), 0.039999999105930328369140625);
    precise float _477 = fma(cb0._m13.y, fma(_316, _319, -0.039999999105930328369140625), 0.039999999105930328369140625);
    precise float _479 = fma(-cb0._m13.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _480 = _479 * _320;
    precise float _481 = _479 * _321;
    precise float _482 = _479 * _322;
    precise float _485 = 1.0 - cb0._m13.x;
    precise float _486 = fma(_151, _156, _172);
    precise float _487 = fma(_152, _156, _173);
    precise float _488 = fma(_153, _156, _174);
    vec3 _489 = vec3(_486, _487, _488);
    precise float _492 = inversesqrt(spvNMax(dp3_f32(_489, _489), 0.001000000047497451305389404296875));
    precise float _493 = _492 * _486;
    precise float _494 = _492 * _487;
    precise float _495 = _492 * _488;
    vec3 _496 = vec3(_467, _468, _469);
    vec3 _499 = vec3(_157, _158, _159);
    precise float _501 = spvNClamp(dp3_f32(_496, _499), 0.0, 1.0);
    vec3 _502 = vec3(_493, _494, _495);
    precise float _504 = spvNClamp(dp3_f32(_496, _502), 0.0, 1.0);
    precise float _506 = spvNClamp(dp3_f32(_499, _502), 0.0, 1.0);
    precise float _507 = _506 * _506;
    precise float _511 = dp2_f32(vec2(_507), vec2(_485)) - 0.5;
    precise float _512 = 1.0 - _501;
    precise float _513 = _512 * _512;
    precise float _514 = _513 * _513;
    precise float _515 = _512 * _514;
    precise float _517 = abs(dp3_f32(_496, vec3(_172, _173, _174)));
    precise float _518 = 1.0 - _517;
    precise float _519 = _518 * _518;
    precise float _520 = _519 * _519;
    precise float _521 = _518 * _520;
    precise float _523 = fma(_511, _521, 1.0) * fma(_511, _515, 1.0);
    precise float _524 = _485 * _485;
    precise float _525 = spvNMax(_524, 0.00200000009499490261077880859375);
    precise float _526 = 1.0 - _525;
    precise float _529 = _517 * fma(_501, _526, _525);
    precise float _531 = fma(_501, fma(_517, _526, _525), _529) + 9.9999997473787516355514526367188e-06;
    precise float _532 = 0.5 / _531;
    precise float _533 = _525 * _525;
    precise float _536 = fma(fma(_504, _533, -_504), _504, 1.0);
    precise float _537 = _533 * 0.3183098733425140380859375;
    precise float _539 = _537 / fma(_536, _536, 1.0000000116860974230803549289703e-07);
    precise float _540 = _539 * _532;
    precise float _541 = _540 * 3.1415927410125732421875;
    precise float _542 = _501 * _523;
    precise float _543 = _501 * _541;
    vec3 _545 = vec3(_475, _476, _477);
    precise float _549 = ((dp3_f32(_545, _545) == 0.0) ? 0.0 : 1.0) * spvNMax(_543, 0.0);
    precise float _550 = _542 * _455;
    precise float _551 = _542 * _456;
    precise float _552 = _542 * _457;
    precise float _553 = _455 * _549;
    precise float _554 = _456 * _549;
    precise float _555 = _457 * _549;
    precise float _556 = 1.0 - _506;
    precise float _557 = _556 * _556;
    precise float _558 = _557 * _557;
    precise float _559 = _556 * _558;
    precise float _560 = 1.0 - _475;
    precise float _561 = 1.0 - _476;
    precise float _562 = 1.0 - _477;
    precise float _566 = _553 * fma(_560, _559, _475);
    precise float _567 = _554 * fma(_561, _559, _476);
    precise float _568 = _555 * fma(_562, _559, _477);
    SV_Target.x = fma(_480, _550, _566);
    SV_Target.y = fma(_481, _551, _567);
    SV_Target.z = fma(_482, _552, _568);
    SV_Target.w = 1.0;
}

