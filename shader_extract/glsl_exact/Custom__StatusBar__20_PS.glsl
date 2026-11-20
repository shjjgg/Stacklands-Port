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
    vec3 _m18;
    uint _m19;
    vec3 _m20;
    uint _m21;
    vec4 _m22;
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
layout(set = 0, binding = 8) uniform textureCube t1;
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
    precise float _125 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _125));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _108 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _108)));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _96 = a.x * b.x;
    return fma(a.y, b.y, _96);
}

void main()
{
    precise float _149 = cb2._m0.x - TEXCOORD2.x;
    precise float _150 = cb2._m0.y - TEXCOORD2.y;
    precise float _151 = cb2._m0.z - TEXCOORD2.z;
    vec3 _152 = vec3(_149, _150, _151);
    precise float _154 = inversesqrt(dp3_f32(_152, _152));
    precise float _155 = _154 * _149;
    precise float _156 = _154 * _150;
    precise float _157 = _154 * _151;
    precise float _164 = cb1._m4.x - TEXCOORD2.x;
    precise float _165 = cb1._m4.y - TEXCOORD2.y;
    precise float _166 = cb1._m4.z - TEXCOORD2.z;
    vec3 _167 = vec3(_164, _165, _166);
    precise float _169 = inversesqrt(dp3_f32(_167, _167));
    precise float _170 = _169 * _164;
    precise float _171 = _169 * _165;
    precise float _172 = _169 * _166;
    precise float _175 = TEXCOORD.y * 150.0;
    precise float _178 = sin(roundEven(_175)) * 43758.546875;
    precise float _180 = fract(_178) - 0.5;
    precise float _183 = fma(_180, 0.00999999977648258209228515625, TEXCOORD.x);
    precise float _184 = _183 * 150.0;
    precise float _187 = sin(roundEven(_184)) * 43758.546875;
    precise float _189 = fract(_187) - 0.5;
    precise float _190 = fma(_189, 0.0500000007450580596923828125, TEXCOORD.y);
    precise float _199 = abs(dFdx(_183)) + abs(dFdy(_183));
    precise float _200 = abs(dFdx(_190)) + abs(dFdy(_190));
    precise float _201 = _200 * 0.2666666805744171142578125;
    precise float _202 = _190 - 0.5;
    precise float _203 = _183 - 0.02999999932944774627685546875;
    precise float _205 = fma(-_203, 1.06382977962493896484375, 1.0);
    precise float _206 = _203 / _199;
    precise float _208 = 0.9700000286102294921875 - _183;
    precise float _209 = _208 / _199;
    precise float _211 = spvNClamp(_209, 0.0, 1.0) * spvNClamp(_206, 0.0, 1.0);
    precise float _214 = fma(_202, 0.2666666805744171142578125, 0.069999992847442626953125) / _201;
    precise float _216 = _211 * spvNClamp(_214, 0.0, 1.0);
    precise float _217 = 0.569999992847442626953125 - fma(_202, 0.2666666805744171142578125, 0.5);
    precise float _218 = _217 / _201;
    precise float _220 = _216 * spvNClamp(_218, 0.0, 1.0);
    precise float _232 = cb0._m16.x - cb0._m14.x;
    precise float _233 = cb0._m16.y - cb0._m14.y;
    precise float _234 = cb0._m16.z - cb0._m14.z;
    precise float _235 = fma(_220, _232, cb0._m14.x);
    precise float _236 = fma(_220, _233, cb0._m14.y);
    precise float _237 = fma(_220, _234, cb0._m14.z);
    float _243 = float(cb0._m22.x >= 0.5);
    precise float _254 = cb0._m20.x - cb0._m18.x;
    precise float _255 = cb0._m20.y - cb0._m18.y;
    precise float _256 = cb0._m20.z - cb0._m18.z;
    precise float _262 = _205 - cb0._m22.y;
    precise float _267 = abs(dFdy(_205)) + abs(dFdx(_205));
    precise float _268 = _262 / _267;
    float _271 = (_220 <= 0.0) ? 0.0 : spvNClamp(_268, 0.0, 1.0);
    precise float _272 = fma(_243, _254, cb0._m18.x) - _235;
    precise float _273 = fma(_243, _255, cb0._m18.y) - _236;
    precise float _274 = fma(_243, _256, cb0._m18.z) - _237;
    precise float _275 = fma(_271, _272, _235);
    precise float _276 = fma(_271, _273, _236);
    precise float _277 = fma(_271, _274, _237);
    precise float _283 = TEXCOORD2.y * cb0._m7.x;
    precise float _284 = TEXCOORD2.y * cb0._m7.y;
    precise float _285 = TEXCOORD2.y * cb0._m7.z;
    precise float _307 = fma(cb0._m9.x, TEXCOORD2.z, fma(cb0._m5.x, TEXCOORD2.x, _283)) + cb0._m11.x;
    precise float _308 = fma(cb0._m9.y, TEXCOORD2.z, fma(cb0._m5.y, TEXCOORD2.x, _284)) + cb0._m11.y;
    precise float _309 = fma(cb0._m9.z, TEXCOORD2.z, fma(cb0._m5.z, TEXCOORD2.x, _285)) + cb0._m11.z;
    float _385;
    float _386;
    float _387;
    float _388;
    if (cb3._m0.x == 1.0)
    {
        bool _318 = cb3._m0.y == 1.0;
        precise float _324 = TEXCOORD2.y * cb3._m3.x;
        precise float _325 = TEXCOORD2.y * cb3._m3.y;
        precise float _326 = TEXCOORD2.y * cb3._m3.z;
        precise float _348 = fma(cb3._m5.x, TEXCOORD2.z, fma(cb3._m1.x, TEXCOORD2.x, _324)) + cb3._m7.x;
        precise float _349 = fma(cb3._m5.y, TEXCOORD2.z, fma(cb3._m1.y, TEXCOORD2.x, _325)) + cb3._m7.y;
        precise float _350 = fma(cb3._m5.z, TEXCOORD2.z, fma(cb3._m1.z, TEXCOORD2.x, _326)) + cb3._m7.z;
        precise float _359 = (_318 ? _348 : TEXCOORD2.x) - cb3._m11.x;
        precise float _360 = (_318 ? _349 : TEXCOORD2.y) - cb3._m11.y;
        precise float _361 = (_318 ? _350 : TEXCOORD2.z) - cb3._m11.z;
        precise float _367 = _359 * cb3._m9.x;
        precise float _368 = _360 * cb3._m9.y;
        precise float _369 = _361 * cb3._m9.z;
        vec4 _380 = texture(sampler3D(t2, s0), vec3(spvNMax(fma(_367, 0.25, 0.75), fma(cb3._m0.z, 0.5, 0.75)), _368, _369));
        _385 = _380.w;
        _386 = _380.z;
        _387 = _380.y;
        _388 = _380.x;
    }
    else
    {
        _385 = 1.0;
        _386 = 1.0;
        _387 = 1.0;
        _388 = 1.0;
    }
    vec3 _395 = vec3(_307, _308, _309);
    precise float _410 = texture(samplerCube(t1, s1), _395).w * texture(sampler2D(t0, s2), vec2(dp3_f32(_395, _395))).x;
    precise float _411 = spvNClamp(dp4_f32(vec4(_388, _387, _386, _385), cb2._m47), 0.0, 1.0) * _410;
    precise float _417 = _411 * cb0._m2.x;
    precise float _418 = _411 * cb0._m2.y;
    precise float _419 = _411 * cb0._m2.z;
    vec3 _426 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    precise float _428 = inversesqrt(dp3_f32(_426, _426));
    precise float _429 = _428 * TEXCOORD1.x;
    precise float _430 = _428 * TEXCOORD1.y;
    precise float _431 = _428 * TEXCOORD1.z;
    precise float _432 = _275 - 0.039999999105930328369140625;
    precise float _433 = _276 - 0.039999999105930328369140625;
    precise float _434 = _277 - 0.039999999105930328369140625;
    precise float _437 = fma(cb0._m13.y, _432, 0.039999999105930328369140625);
    precise float _438 = fma(cb0._m13.y, _433, 0.039999999105930328369140625);
    precise float _439 = fma(cb0._m13.y, _434, 0.039999999105930328369140625);
    precise float _441 = fma(-cb0._m13.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _442 = _441 * _275;
    precise float _443 = _441 * _276;
    precise float _444 = _441 * _277;
    precise float _447 = 1.0 - cb0._m13.x;
    precise float _448 = fma(_149, _154, _170);
    precise float _449 = fma(_150, _154, _171);
    precise float _450 = fma(_151, _154, _172);
    vec3 _451 = vec3(_448, _449, _450);
    precise float _454 = inversesqrt(spvNMax(dp3_f32(_451, _451), 0.001000000047497451305389404296875));
    precise float _455 = _454 * _448;
    precise float _456 = _454 * _449;
    precise float _457 = _454 * _450;
    vec3 _458 = vec3(_429, _430, _431);
    vec3 _461 = vec3(_155, _156, _157);
    precise float _463 = spvNClamp(dp3_f32(_458, _461), 0.0, 1.0);
    vec3 _464 = vec3(_455, _456, _457);
    precise float _466 = spvNClamp(dp3_f32(_458, _464), 0.0, 1.0);
    precise float _468 = spvNClamp(dp3_f32(_461, _464), 0.0, 1.0);
    precise float _469 = _468 * _468;
    precise float _473 = dp2_f32(vec2(_469), vec2(_447)) - 0.5;
    precise float _474 = 1.0 - _463;
    precise float _475 = _474 * _474;
    precise float _476 = _475 * _475;
    precise float _477 = _474 * _476;
    precise float _479 = abs(dp3_f32(_458, vec3(_170, _171, _172)));
    precise float _480 = 1.0 - _479;
    precise float _481 = _480 * _480;
    precise float _482 = _481 * _481;
    precise float _483 = _480 * _482;
    precise float _485 = fma(_473, _483, 1.0) * fma(_473, _477, 1.0);
    precise float _486 = _447 * _447;
    precise float _487 = spvNMax(_486, 0.00200000009499490261077880859375);
    precise float _488 = 1.0 - _487;
    precise float _491 = _479 * fma(_463, _488, _487);
    precise float _493 = fma(_463, fma(_479, _488, _487), _491) + 9.9999997473787516355514526367188e-06;
    precise float _494 = 0.5 / _493;
    precise float _495 = _487 * _487;
    precise float _498 = fma(fma(_466, _495, -_466), _466, 1.0);
    precise float _499 = _495 * 0.3183098733425140380859375;
    precise float _501 = _499 / fma(_498, _498, 1.0000000116860974230803549289703e-07);
    precise float _502 = _501 * _494;
    precise float _503 = _502 * 3.1415927410125732421875;
    precise float _504 = _463 * _485;
    precise float _505 = _463 * _503;
    vec3 _507 = vec3(_437, _438, _439);
    precise float _511 = ((dp3_f32(_507, _507) == 0.0) ? 0.0 : 1.0) * spvNMax(_505, 0.0);
    precise float _512 = _504 * _417;
    precise float _513 = _504 * _418;
    precise float _514 = _504 * _419;
    precise float _515 = _417 * _511;
    precise float _516 = _418 * _511;
    precise float _517 = _419 * _511;
    precise float _518 = 1.0 - _468;
    precise float _519 = _518 * _518;
    precise float _520 = _519 * _519;
    precise float _521 = _518 * _520;
    precise float _522 = 1.0 - _437;
    precise float _523 = 1.0 - _438;
    precise float _524 = 1.0 - _439;
    precise float _528 = _515 * fma(_522, _521, _437);
    precise float _529 = _516 * fma(_523, _521, _438);
    precise float _530 = _517 * fma(_524, _521, _439);
    SV_Target.x = fma(_442, _512, _528);
    SV_Target.y = fma(_443, _513, _529);
    SV_Target.z = fma(_444, _514, _530);
    SV_Target.w = 1.0;
}

