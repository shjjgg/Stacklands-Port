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
    vec4 _m6;
    vec4 _m7;
    vec4 _m8;
    vec4 _m9;
    vec3 _m10;
    uint _m11;
    vec2 _m12;
    uvec2 _m13;
    vec4 _m14;
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
    precise float _116 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _116));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _105 = a.x * b.x;
    return fma(a.y, b.y, _105);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _87 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _87)));
}

void main()
{
    precise float _140 = cb2._m0.x - TEXCOORD2.x;
    precise float _141 = cb2._m0.y - TEXCOORD2.y;
    precise float _142 = cb2._m0.z - TEXCOORD2.z;
    vec3 _143 = vec3(_140, _141, _142);
    precise float _145 = inversesqrt(dp3_f32(_143, _143));
    precise float _146 = _145 * _140;
    precise float _147 = _145 * _141;
    precise float _148 = _145 * _142;
    precise float _155 = cb1._m4.x - TEXCOORD2.x;
    precise float _156 = cb1._m4.y - TEXCOORD2.y;
    precise float _157 = cb1._m4.z - TEXCOORD2.z;
    vec3 _158 = vec3(_155, _156, _157);
    precise float _160 = inversesqrt(dp3_f32(_158, _158));
    precise float _161 = _160 * _155;
    precise float _162 = _160 * _156;
    precise float _163 = _160 * _157;
    precise float _166 = TEXCOORD.y - 0.5;
    precise float _167 = _166 * 0.3333333432674407958984375;
    precise float _168 = _166 * 150.0;
    precise float _173 = abs(dFdx(_167)) + abs(dFdy(_167));
    precise float _176 = sin(roundEven(_168)) * 43758.546875;
    precise float _178 = fract(_176) - 0.5;
    precise float _181 = fma(_178, 0.004999999888241291046142578125, TEXCOORD.x);
    precise float _182 = _181 * 150.0;
    precise float _185 = sin(roundEven(_182)) * 43758.546875;
    precise float _187 = fract(_185) - 0.5;
    precise float _198 = cb0._m12.x - cb0._m14.x;
    precise float _199 = cb0._m12.y - cb0._m14.x;
    precise float _202 = abs(_181) - _198;
    precise float _203 = abs(fma(_187, 0.00166666670702397823333740234375, _167)) - _199;
    vec2 _206 = vec2(spvNMax(_202, 0.0), spvNMax(_203, 0.0));
    precise float _209 = sqrt(dp2_f32(_206, _206)) / _173;
    precise float _210 = spvNMin(_209, 1.0);
    precise float _219 = fma(_210, -cb0._m10.x, cb0._m10.x);
    precise float _220 = fma(_210, -cb0._m10.y, cb0._m10.y);
    precise float _221 = fma(_210, -cb0._m10.z, cb0._m10.z);
    precise float _229 = TEXCOORD2.y * cb0._m6.x;
    precise float _230 = TEXCOORD2.y * cb0._m6.y;
    precise float _231 = TEXCOORD2.y * cb0._m6.z;
    precise float _232 = TEXCOORD2.y * cb0._m6.w;
    precise float _259 = fma(cb0._m7.x, TEXCOORD2.z, fma(cb0._m5.x, TEXCOORD2.x, _229)) + cb0._m8.x;
    precise float _260 = fma(cb0._m7.y, TEXCOORD2.z, fma(cb0._m5.y, TEXCOORD2.x, _230)) + cb0._m8.y;
    precise float _261 = fma(cb0._m7.z, TEXCOORD2.z, fma(cb0._m5.z, TEXCOORD2.x, _231)) + cb0._m8.z;
    precise float _262 = fma(cb0._m7.w, TEXCOORD2.z, fma(cb0._m5.w, TEXCOORD2.x, _232)) + cb0._m8.w;
    float _339;
    float _340;
    float _341;
    float _342;
    if (cb3._m0.x == 1.0)
    {
        bool _272 = cb3._m0.y == 1.0;
        precise float _278 = TEXCOORD2.y * cb3._m3.x;
        precise float _279 = TEXCOORD2.y * cb3._m3.y;
        precise float _280 = TEXCOORD2.y * cb3._m3.z;
        precise float _302 = fma(cb3._m5.x, TEXCOORD2.z, fma(cb3._m1.x, TEXCOORD2.x, _278)) + cb3._m7.x;
        precise float _303 = fma(cb3._m5.y, TEXCOORD2.z, fma(cb3._m1.y, TEXCOORD2.x, _279)) + cb3._m7.y;
        precise float _304 = fma(cb3._m5.z, TEXCOORD2.z, fma(cb3._m1.z, TEXCOORD2.x, _280)) + cb3._m7.z;
        precise float _313 = (_272 ? _302 : TEXCOORD2.x) - cb3._m11.x;
        precise float _314 = (_272 ? _303 : TEXCOORD2.y) - cb3._m11.y;
        precise float _315 = (_272 ? _304 : TEXCOORD2.z) - cb3._m11.z;
        precise float _321 = _313 * cb3._m9.x;
        precise float _322 = _314 * cb3._m9.y;
        precise float _323 = _315 * cb3._m9.z;
        vec4 _334 = texture(sampler3D(t2, s0), vec3(spvNMax(fma(_321, 0.25, 0.75), fma(cb3._m0.z, 0.5, 0.75)), _322, _323));
        _339 = _334.w;
        _340 = _334.z;
        _341 = _334.y;
        _342 = _334.x;
    }
    else
    {
        _339 = 1.0;
        _340 = 1.0;
        _341 = 1.0;
        _342 = 1.0;
    }
    precise float _350 = _259 / _262;
    precise float _351 = _260 / _262;
    precise float _352 = _350 + 0.5;
    precise float _353 = _351 + 0.5;
    precise float _361 = float(_261 > 0.0) * texture(sampler2D(t0, s1), vec2(_352, _353)).w;
    vec3 _362 = vec3(_259, _260, _261);
    precise float _370 = _361 * texture(sampler2D(t1, s2), vec2(dp3_f32(_362, _362))).x;
    precise float _371 = spvNClamp(dp4_f32(vec4(_342, _341, _340, _339), cb2._m47), 0.0, 1.0) * _370;
    precise float _377 = _371 * cb0._m2.x;
    precise float _378 = _371 * cb0._m2.y;
    precise float _379 = _371 * cb0._m2.z;
    vec3 _386 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    precise float _388 = inversesqrt(dp3_f32(_386, _386));
    precise float _389 = _388 * TEXCOORD1.x;
    precise float _390 = _388 * TEXCOORD1.y;
    precise float _391 = _388 * TEXCOORD1.z;
    precise float _392 = _219 - 0.039999999105930328369140625;
    precise float _393 = _220 - 0.039999999105930328369140625;
    precise float _394 = _221 - 0.039999999105930328369140625;
    precise float _397 = fma(cb0._m9.y, _392, 0.039999999105930328369140625);
    precise float _398 = fma(cb0._m9.y, _393, 0.039999999105930328369140625);
    precise float _399 = fma(cb0._m9.y, _394, 0.039999999105930328369140625);
    precise float _401 = fma(-cb0._m9.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _402 = _401 * _219;
    precise float _403 = _401 * _220;
    precise float _404 = _401 * _221;
    precise float _407 = 1.0 - cb0._m9.x;
    precise float _408 = fma(_140, _145, _161);
    precise float _409 = fma(_141, _145, _162);
    precise float _410 = fma(_142, _145, _163);
    vec3 _411 = vec3(_408, _409, _410);
    precise float _414 = inversesqrt(spvNMax(dp3_f32(_411, _411), 0.001000000047497451305389404296875));
    precise float _415 = _414 * _408;
    precise float _416 = _414 * _409;
    precise float _417 = _414 * _410;
    vec3 _418 = vec3(_389, _390, _391);
    vec3 _421 = vec3(_146, _147, _148);
    precise float _423 = spvNClamp(dp3_f32(_418, _421), 0.0, 1.0);
    vec3 _424 = vec3(_415, _416, _417);
    precise float _426 = spvNClamp(dp3_f32(_418, _424), 0.0, 1.0);
    precise float _428 = spvNClamp(dp3_f32(_421, _424), 0.0, 1.0);
    precise float _429 = _428 * _428;
    precise float _433 = dp2_f32(vec2(_429), vec2(_407)) - 0.5;
    precise float _434 = 1.0 - _423;
    precise float _435 = _434 * _434;
    precise float _436 = _435 * _435;
    precise float _437 = _434 * _436;
    precise float _439 = abs(dp3_f32(_418, vec3(_161, _162, _163)));
    precise float _440 = 1.0 - _439;
    precise float _441 = _440 * _440;
    precise float _442 = _441 * _441;
    precise float _443 = _440 * _442;
    precise float _445 = fma(_433, _443, 1.0) * fma(_433, _437, 1.0);
    precise float _446 = _407 * _407;
    precise float _447 = spvNMax(_446, 0.00200000009499490261077880859375);
    precise float _448 = 1.0 - _447;
    precise float _451 = _439 * fma(_423, _448, _447);
    precise float _453 = fma(_423, fma(_439, _448, _447), _451) + 9.9999997473787516355514526367188e-06;
    precise float _454 = 0.5 / _453;
    precise float _455 = _447 * _447;
    precise float _458 = fma(fma(_426, _455, -_426), _426, 1.0);
    precise float _459 = _455 * 0.3183098733425140380859375;
    precise float _461 = _459 / fma(_458, _458, 1.0000000116860974230803549289703e-07);
    precise float _462 = _461 * _454;
    precise float _463 = _462 * 3.1415927410125732421875;
    precise float _464 = _423 * _445;
    precise float _465 = _423 * _463;
    vec3 _467 = vec3(_397, _398, _399);
    precise float _471 = ((dp3_f32(_467, _467) == 0.0) ? 0.0 : 1.0) * spvNMax(_465, 0.0);
    precise float _472 = _464 * _377;
    precise float _473 = _464 * _378;
    precise float _474 = _464 * _379;
    precise float _475 = _377 * _471;
    precise float _476 = _378 * _471;
    precise float _477 = _379 * _471;
    precise float _478 = 1.0 - _428;
    precise float _479 = _478 * _478;
    precise float _480 = _479 * _479;
    precise float _481 = _478 * _480;
    precise float _482 = 1.0 - _397;
    precise float _483 = 1.0 - _398;
    precise float _484 = 1.0 - _399;
    precise float _488 = _475 * fma(_482, _481, _397);
    precise float _489 = _476 * fma(_483, _481, _398);
    precise float _490 = _477 * fma(_484, _481, _399);
    SV_Target.x = fma(_402, _472, _488);
    SV_Target.y = fma(_403, _473, _489);
    SV_Target.z = fma(_404, _474, _490);
    SV_Target.w = 1.0;
}

