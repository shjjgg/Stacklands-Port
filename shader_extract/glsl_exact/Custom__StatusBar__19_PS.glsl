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
    vec3 _m12;
    uint _m13;
    vec3 _m14;
    uint _m15;
    vec3 _m16;
    uint _m17;
    vec4 _m18;
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

float dp4_f32(vec4 a, vec4 b)
{
    precise float _107 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _107)));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _95 = a.x * b.x;
    return fma(a.y, b.y, _95);
}

void main()
{
    precise float _148 = cb2._m0.x - TEXCOORD2.x;
    precise float _149 = cb2._m0.y - TEXCOORD2.y;
    precise float _150 = cb2._m0.z - TEXCOORD2.z;
    vec3 _151 = vec3(_148, _149, _150);
    precise float _153 = inversesqrt(dp3_f32(_151, _151));
    precise float _154 = _153 * _148;
    precise float _155 = _153 * _149;
    precise float _156 = _153 * _150;
    precise float _163 = cb1._m4.x - TEXCOORD2.x;
    precise float _164 = cb1._m4.y - TEXCOORD2.y;
    precise float _165 = cb1._m4.z - TEXCOORD2.z;
    vec3 _166 = vec3(_163, _164, _165);
    precise float _168 = inversesqrt(dp3_f32(_166, _166));
    precise float _169 = _168 * _163;
    precise float _170 = _168 * _164;
    precise float _171 = _168 * _165;
    precise float _174 = TEXCOORD.y * 150.0;
    precise float _177 = sin(roundEven(_174)) * 43758.546875;
    precise float _179 = fract(_177) - 0.5;
    precise float _182 = fma(_179, 0.00999999977648258209228515625, TEXCOORD.x);
    precise float _183 = _182 * 150.0;
    precise float _186 = sin(roundEven(_183)) * 43758.546875;
    precise float _188 = fract(_186) - 0.5;
    precise float _189 = fma(_188, 0.0500000007450580596923828125, TEXCOORD.y);
    precise float _198 = abs(dFdx(_182)) + abs(dFdy(_182));
    precise float _199 = abs(dFdx(_189)) + abs(dFdy(_189));
    precise float _200 = _199 * 0.2666666805744171142578125;
    precise float _201 = _189 - 0.5;
    precise float _202 = _182 - 0.02999999932944774627685546875;
    precise float _204 = fma(-_202, 1.06382977962493896484375, 1.0);
    precise float _205 = _202 / _198;
    precise float _207 = 0.9700000286102294921875 - _182;
    precise float _208 = _207 / _198;
    precise float _210 = spvNClamp(_208, 0.0, 1.0) * spvNClamp(_205, 0.0, 1.0);
    precise float _213 = fma(_201, 0.2666666805744171142578125, 0.069999992847442626953125) / _200;
    precise float _215 = _210 * spvNClamp(_213, 0.0, 1.0);
    precise float _216 = 0.569999992847442626953125 - fma(_201, 0.2666666805744171142578125, 0.5);
    precise float _217 = _216 / _200;
    precise float _219 = _215 * spvNClamp(_217, 0.0, 1.0);
    precise float _231 = cb0._m12.x - cb0._m10.x;
    precise float _232 = cb0._m12.y - cb0._m10.y;
    precise float _233 = cb0._m12.z - cb0._m10.z;
    precise float _234 = fma(_219, _231, cb0._m10.x);
    precise float _235 = fma(_219, _232, cb0._m10.y);
    precise float _236 = fma(_219, _233, cb0._m10.z);
    float _242 = float(cb0._m18.x >= 0.5);
    precise float _253 = cb0._m16.x - cb0._m14.x;
    precise float _254 = cb0._m16.y - cb0._m14.y;
    precise float _255 = cb0._m16.z - cb0._m14.z;
    precise float _261 = _204 - cb0._m18.y;
    precise float _266 = abs(dFdy(_204)) + abs(dFdx(_204));
    precise float _267 = _261 / _266;
    float _270 = (_219 <= 0.0) ? 0.0 : spvNClamp(_267, 0.0, 1.0);
    precise float _271 = fma(_242, _253, cb0._m14.x) - _234;
    precise float _272 = fma(_242, _254, cb0._m14.y) - _235;
    precise float _273 = fma(_242, _255, cb0._m14.z) - _236;
    precise float _274 = fma(_270, _271, _234);
    precise float _275 = fma(_270, _272, _235);
    precise float _276 = fma(_270, _273, _236);
    precise float _284 = TEXCOORD2.y * cb0._m6.x;
    precise float _285 = TEXCOORD2.y * cb0._m6.y;
    precise float _286 = TEXCOORD2.y * cb0._m6.z;
    precise float _287 = TEXCOORD2.y * cb0._m6.w;
    precise float _314 = fma(cb0._m7.x, TEXCOORD2.z, fma(cb0._m5.x, TEXCOORD2.x, _284)) + cb0._m8.x;
    precise float _315 = fma(cb0._m7.y, TEXCOORD2.z, fma(cb0._m5.y, TEXCOORD2.x, _285)) + cb0._m8.y;
    precise float _316 = fma(cb0._m7.z, TEXCOORD2.z, fma(cb0._m5.z, TEXCOORD2.x, _286)) + cb0._m8.z;
    precise float _317 = fma(cb0._m7.w, TEXCOORD2.z, fma(cb0._m5.w, TEXCOORD2.x, _287)) + cb0._m8.w;
    float _393;
    float _394;
    float _395;
    float _396;
    if (cb3._m0.x == 1.0)
    {
        bool _326 = cb3._m0.y == 1.0;
        precise float _332 = TEXCOORD2.y * cb3._m3.x;
        precise float _333 = TEXCOORD2.y * cb3._m3.y;
        precise float _334 = TEXCOORD2.y * cb3._m3.z;
        precise float _356 = fma(cb3._m5.x, TEXCOORD2.z, fma(cb3._m1.x, TEXCOORD2.x, _332)) + cb3._m7.x;
        precise float _357 = fma(cb3._m5.y, TEXCOORD2.z, fma(cb3._m1.y, TEXCOORD2.x, _333)) + cb3._m7.y;
        precise float _358 = fma(cb3._m5.z, TEXCOORD2.z, fma(cb3._m1.z, TEXCOORD2.x, _334)) + cb3._m7.z;
        precise float _367 = (_326 ? _356 : TEXCOORD2.x) - cb3._m11.x;
        precise float _368 = (_326 ? _357 : TEXCOORD2.y) - cb3._m11.y;
        precise float _369 = (_326 ? _358 : TEXCOORD2.z) - cb3._m11.z;
        precise float _375 = _367 * cb3._m9.x;
        precise float _376 = _368 * cb3._m9.y;
        precise float _377 = _369 * cb3._m9.z;
        vec4 _388 = texture(sampler3D(t2, s0), vec3(spvNMax(fma(_375, 0.25, 0.75), fma(cb3._m0.z, 0.5, 0.75)), _376, _377));
        _393 = _388.w;
        _394 = _388.z;
        _395 = _388.y;
        _396 = _388.x;
    }
    else
    {
        _393 = 1.0;
        _394 = 1.0;
        _395 = 1.0;
        _396 = 1.0;
    }
    precise float _404 = _314 / _317;
    precise float _405 = _315 / _317;
    precise float _406 = _404 + 0.5;
    precise float _407 = _405 + 0.5;
    precise float _415 = float(_316 > 0.0) * texture(sampler2D(t0, s1), vec2(_406, _407)).w;
    vec3 _416 = vec3(_314, _315, _316);
    precise float _424 = _415 * texture(sampler2D(t1, s2), vec2(dp3_f32(_416, _416))).x;
    precise float _425 = spvNClamp(dp4_f32(vec4(_396, _395, _394, _393), cb2._m47), 0.0, 1.0) * _424;
    precise float _431 = _425 * cb0._m2.x;
    precise float _432 = _425 * cb0._m2.y;
    precise float _433 = _425 * cb0._m2.z;
    vec3 _440 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    precise float _442 = inversesqrt(dp3_f32(_440, _440));
    precise float _443 = _442 * TEXCOORD1.x;
    precise float _444 = _442 * TEXCOORD1.y;
    precise float _445 = _442 * TEXCOORD1.z;
    precise float _446 = _274 - 0.039999999105930328369140625;
    precise float _447 = _275 - 0.039999999105930328369140625;
    precise float _448 = _276 - 0.039999999105930328369140625;
    precise float _451 = fma(cb0._m9.y, _446, 0.039999999105930328369140625);
    precise float _452 = fma(cb0._m9.y, _447, 0.039999999105930328369140625);
    precise float _453 = fma(cb0._m9.y, _448, 0.039999999105930328369140625);
    precise float _455 = fma(-cb0._m9.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _456 = _455 * _274;
    precise float _457 = _455 * _275;
    precise float _458 = _455 * _276;
    precise float _461 = 1.0 - cb0._m9.x;
    precise float _462 = fma(_148, _153, _169);
    precise float _463 = fma(_149, _153, _170);
    precise float _464 = fma(_150, _153, _171);
    vec3 _465 = vec3(_462, _463, _464);
    precise float _468 = inversesqrt(spvNMax(dp3_f32(_465, _465), 0.001000000047497451305389404296875));
    precise float _469 = _468 * _462;
    precise float _470 = _468 * _463;
    precise float _471 = _468 * _464;
    vec3 _472 = vec3(_443, _444, _445);
    vec3 _475 = vec3(_154, _155, _156);
    precise float _477 = spvNClamp(dp3_f32(_472, _475), 0.0, 1.0);
    vec3 _478 = vec3(_469, _470, _471);
    precise float _480 = spvNClamp(dp3_f32(_472, _478), 0.0, 1.0);
    precise float _482 = spvNClamp(dp3_f32(_475, _478), 0.0, 1.0);
    precise float _483 = _482 * _482;
    precise float _487 = dp2_f32(vec2(_483), vec2(_461)) - 0.5;
    precise float _488 = 1.0 - _477;
    precise float _489 = _488 * _488;
    precise float _490 = _489 * _489;
    precise float _491 = _488 * _490;
    precise float _493 = abs(dp3_f32(_472, vec3(_169, _170, _171)));
    precise float _494 = 1.0 - _493;
    precise float _495 = _494 * _494;
    precise float _496 = _495 * _495;
    precise float _497 = _494 * _496;
    precise float _499 = fma(_487, _497, 1.0) * fma(_487, _491, 1.0);
    precise float _500 = _461 * _461;
    precise float _501 = spvNMax(_500, 0.00200000009499490261077880859375);
    precise float _502 = 1.0 - _501;
    precise float _505 = _493 * fma(_477, _502, _501);
    precise float _507 = fma(_477, fma(_493, _502, _501), _505) + 9.9999997473787516355514526367188e-06;
    precise float _508 = 0.5 / _507;
    precise float _509 = _501 * _501;
    precise float _512 = fma(fma(_480, _509, -_480), _480, 1.0);
    precise float _513 = _509 * 0.3183098733425140380859375;
    precise float _515 = _513 / fma(_512, _512, 1.0000000116860974230803549289703e-07);
    precise float _516 = _515 * _508;
    precise float _517 = _516 * 3.1415927410125732421875;
    precise float _518 = _477 * _499;
    precise float _519 = _477 * _517;
    vec3 _521 = vec3(_451, _452, _453);
    precise float _525 = ((dp3_f32(_521, _521) == 0.0) ? 0.0 : 1.0) * spvNMax(_519, 0.0);
    precise float _526 = _518 * _431;
    precise float _527 = _518 * _432;
    precise float _528 = _518 * _433;
    precise float _529 = _431 * _525;
    precise float _530 = _432 * _525;
    precise float _531 = _433 * _525;
    precise float _532 = 1.0 - _482;
    precise float _533 = _532 * _532;
    precise float _534 = _533 * _533;
    precise float _535 = _532 * _534;
    precise float _536 = 1.0 - _451;
    precise float _537 = 1.0 - _452;
    precise float _538 = 1.0 - _453;
    precise float _542 = _529 * fma(_536, _535, _451);
    precise float _543 = _530 * fma(_537, _535, _452);
    precise float _544 = _531 * fma(_538, _535, _453);
    SV_Target.x = fma(_456, _526, _542);
    SV_Target.y = fma(_457, _527, _543);
    SV_Target.z = fma(_458, _528, _544);
    SV_Target.w = 1.0;
}

