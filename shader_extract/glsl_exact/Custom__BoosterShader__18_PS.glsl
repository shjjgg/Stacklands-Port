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
    uvec4 _m10;
    vec3 _m11;
    uint _m12;
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
    precise float _123 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _123));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _112 = a.x * b.x;
    return fma(a.y, b.y, _112);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _94 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _94)));
}

void main()
{
    precise float _147 = cb1._m4.x - TEXCOORD2.x;
    precise float _148 = cb1._m4.y - TEXCOORD2.y;
    precise float _149 = cb1._m4.z - TEXCOORD2.z;
    vec3 _150 = vec3(_147, _148, _149);
    precise float _152 = inversesqrt(dp3_f32(_150, _150));
    precise float _153 = _152 * _147;
    precise float _154 = _152 * _148;
    precise float _155 = _152 * _149;
    precise float _158 = TEXCOORD.y * 150.0;
    precise float _161 = sin(roundEven(_158)) * 43758.546875;
    precise float _165 = fma(fract(_161), 0.004999999888241291046142578125, TEXCOORD.x);
    precise float _166 = _165 * 150.0;
    precise float _169 = sin(roundEven(_166)) * 43758.546875;
    precise float _171 = fma(fract(_169), 0.004999999888241291046142578125, TEXCOORD.y);
    precise float _180 = abs(dFdx(_165)) + abs(dFdy(_165));
    precise float _181 = abs(dFdx(_171)) + abs(dFdy(_171));
    precise float _182 = TEXCOORD.x - 0.5;
    precise float _183 = TEXCOORD.y - 0.4000000059604644775390625;
    precise float _184 = fma(_182, 1.75, 0.5);
    precise float _185 = fma(_183, 1.75, 0.4000000059604644775390625);
    precise float _197 = float(_184 <= 1.0) * float(_184 >= 0.0);
    precise float _198 = float(_185 >= 0.0) * _197;
    vec4 _204 = texture(sampler2D(t0, s1), vec2(_184, _185));
    float _205 = _204.x;
    float _206 = _204.w;
    precise float _208 = fma(-_198, float(_185 <= 1.0), 1.0);
    precise float _212 = fma(_208, -_206, _206);
    precise float _213 = TEXCOORD2.x - cb1._m4.x;
    precise float _214 = TEXCOORD2.y - cb1._m4.y;
    precise float _215 = TEXCOORD2.z - cb1._m4.z;
    vec3 _216 = vec3(_213, _214, _215);
    precise float _218 = inversesqrt(dp3_f32(_216, _216));
    precise float _219 = _218 * _213;
    precise float _220 = _218 * _215;
    precise float _221 = TEXCOORD.y + TEXCOORD.x;
    precise float _222 = TEXCOORD.y + TEXCOORD.y;
    precise float _226 = fma(-_220, 5.0, _222);
    precise float _227 = _226 * 10.0;
    precise float _229 = fma(sin(_227), 0.0199999995529651641845703125, fma(-_219, 5.0, _221));
    precise float _230 = _229 * 30.0;
    vec4 _237 = texture(sampler2D(t1, s2), vec2(_229, fma(cos(_230), 0.0199999995529651641845703125, _226)));
    vec2 _241 = vec2(fma(_182, 1.75, 0.0), fma(_183, 1.75, -0.0999999940395355224609375));
    precise float _244 = sqrt(dp2_f32(_241, _241)) - 0.400390625;
    precise float _245 = _244 / _180;
    precise float _247 = 1.0 - spvNClamp(_245, 0.0, 1.0);
    precise float _259 = cb0._m8.x - cb0._m6.x;
    precise float _260 = cb0._m8.y - cb0._m6.y;
    precise float _261 = cb0._m8.z - cb0._m6.z;
    precise float _262 = fma(_247, _259, cb0._m6.x);
    precise float _263 = fma(_247, _260, cb0._m6.y);
    precise float _264 = fma(_247, _261, cb0._m6.z);
    precise float _265 = 1.0 - fma(_208, -_205, _205);
    precise float _271 = cb0._m11.x - cb0._m6.x;
    precise float _272 = cb0._m11.y - cb0._m6.y;
    precise float _273 = cb0._m11.z - cb0._m6.z;
    precise float _277 = fma(_265, _271, cb0._m6.x) - _262;
    precise float _278 = fma(_265, _272, cb0._m6.y) - _263;
    precise float _279 = fma(_265, _273, cb0._m6.z) - _264;
    precise float _283 = _165 - 0.1167768537998199462890625;
    precise float _284 = _283 / _180;
    precise float _286 = 0.88322317600250244140625 - _165;
    precise float _287 = _286 / _180;
    precise float _289 = spvNClamp(_287, 0.0, 1.0) * spvNClamp(_284, 0.0, 1.0);
    precise float _290 = _171 - 0.02999999932944774627685546875;
    precise float _291 = _290 / _181;
    precise float _293 = _289 * spvNClamp(_291, 0.0, 1.0);
    precise float _294 = 0.9700000286102294921875 - _171;
    precise float _295 = _294 / _181;
    precise float _297 = _293 * spvNClamp(_295, 0.0, 1.0);
    precise float _298 = fma(_237.x, 0.5, fma(_212, _277, _262));
    precise float _299 = fma(_237.y, 0.5, fma(_212, _278, _263));
    precise float _300 = fma(_237.z, 0.5, fma(_212, _279, _264));
    precise float _301 = _297 * _298;
    precise float _302 = _297 * _299;
    precise float _303 = _297 * _300;
    float _380;
    float _381;
    float _382;
    float _383;
    if (cb3._m0.x == 1.0)
    {
        bool _313 = cb3._m0.y == 1.0;
        precise float _319 = TEXCOORD2.y * cb3._m3.x;
        precise float _320 = TEXCOORD2.y * cb3._m3.y;
        precise float _321 = TEXCOORD2.y * cb3._m3.z;
        precise float _343 = fma(cb3._m5.x, TEXCOORD2.z, fma(cb3._m1.x, TEXCOORD2.x, _319)) + cb3._m7.x;
        precise float _344 = fma(cb3._m5.y, TEXCOORD2.z, fma(cb3._m1.y, TEXCOORD2.x, _320)) + cb3._m7.y;
        precise float _345 = fma(cb3._m5.z, TEXCOORD2.z, fma(cb3._m1.z, TEXCOORD2.x, _321)) + cb3._m7.z;
        precise float _354 = (_313 ? _343 : TEXCOORD2.x) - cb3._m11.x;
        precise float _355 = (_313 ? _344 : TEXCOORD2.y) - cb3._m11.y;
        precise float _356 = (_313 ? _345 : TEXCOORD2.z) - cb3._m11.z;
        precise float _362 = _354 * cb3._m9.x;
        precise float _363 = _355 * cb3._m9.y;
        precise float _364 = _356 * cb3._m9.z;
        vec4 _375 = texture(sampler3D(t2, s0), vec3(spvNMax(fma(_362, 0.25, 0.75), fma(cb3._m0.z, 0.5, 0.75)), _363, _364));
        _380 = _375.w;
        _381 = _375.z;
        _382 = _375.y;
        _383 = _375.x;
    }
    else
    {
        _380 = 1.0;
        _381 = 1.0;
        _382 = 1.0;
        _383 = 1.0;
    }
    precise float _390 = spvNClamp(dp4_f32(vec4(_383, _382, _381, _380), cb2._m47), 0.0, 1.0);
    precise float _396 = _390 * cb0._m2.x;
    precise float _397 = _390 * cb0._m2.y;
    precise float _398 = _390 * cb0._m2.z;
    vec3 _405 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    precise float _407 = inversesqrt(dp3_f32(_405, _405));
    precise float _408 = _407 * TEXCOORD1.x;
    precise float _409 = _407 * TEXCOORD1.y;
    precise float _410 = _407 * TEXCOORD1.z;
    precise float _416 = fma(cb0._m5.y, fma(_297, _298, -0.039999999105930328369140625), 0.039999999105930328369140625);
    precise float _417 = fma(cb0._m5.y, fma(_297, _299, -0.039999999105930328369140625), 0.039999999105930328369140625);
    precise float _418 = fma(cb0._m5.y, fma(_297, _300, -0.039999999105930328369140625), 0.039999999105930328369140625);
    precise float _420 = fma(-cb0._m5.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _421 = _420 * _301;
    precise float _422 = _420 * _302;
    precise float _423 = _420 * _303;
    precise float _426 = 1.0 - cb0._m5.x;
    precise float _432 = fma(_147, _152, cb2._m0.x);
    precise float _433 = fma(_148, _152, cb2._m0.y);
    precise float _434 = fma(_149, _152, cb2._m0.z);
    vec3 _435 = vec3(_432, _433, _434);
    precise float _438 = inversesqrt(spvNMax(dp3_f32(_435, _435), 0.001000000047497451305389404296875));
    precise float _439 = _438 * _432;
    precise float _440 = _438 * _433;
    precise float _441 = _438 * _434;
    vec3 _442 = vec3(_408, _409, _410);
    precise float _446 = spvNClamp(dp3_f32(_442, cb2._m0), 0.0, 1.0);
    vec3 _447 = vec3(_439, _440, _441);
    precise float _449 = spvNClamp(dp3_f32(_442, _447), 0.0, 1.0);
    precise float _451 = spvNClamp(dp3_f32(cb2._m0, _447), 0.0, 1.0);
    precise float _452 = _451 * _451;
    precise float _456 = dp2_f32(vec2(_452), vec2(_426)) - 0.5;
    precise float _457 = 1.0 - _446;
    precise float _458 = _457 * _457;
    precise float _459 = _458 * _458;
    precise float _460 = _457 * _459;
    precise float _462 = abs(dp3_f32(_442, vec3(_153, _154, _155)));
    precise float _463 = 1.0 - _462;
    precise float _464 = _463 * _463;
    precise float _465 = _464 * _464;
    precise float _466 = _463 * _465;
    precise float _468 = fma(_456, _466, 1.0) * fma(_456, _460, 1.0);
    precise float _469 = _426 * _426;
    precise float _470 = spvNMax(_469, 0.00200000009499490261077880859375);
    precise float _471 = 1.0 - _470;
    precise float _474 = _462 * fma(_446, _471, _470);
    precise float _476 = fma(_446, fma(_462, _471, _470), _474) + 9.9999997473787516355514526367188e-06;
    precise float _477 = 0.5 / _476;
    precise float _478 = _470 * _470;
    precise float _481 = fma(fma(_449, _478, -_449), _449, 1.0);
    precise float _482 = _478 * 0.3183098733425140380859375;
    precise float _484 = _482 / fma(_481, _481, 1.0000000116860974230803549289703e-07);
    precise float _485 = _484 * _477;
    precise float _486 = _485 * 3.1415927410125732421875;
    precise float _487 = _446 * _468;
    precise float _488 = _446 * _486;
    vec3 _490 = vec3(_416, _417, _418);
    precise float _494 = ((dp3_f32(_490, _490) == 0.0) ? 0.0 : 1.0) * spvNMax(_488, 0.0);
    precise float _495 = _487 * _396;
    precise float _496 = _487 * _397;
    precise float _497 = _487 * _398;
    precise float _498 = _396 * _494;
    precise float _499 = _397 * _494;
    precise float _500 = _398 * _494;
    precise float _501 = 1.0 - _451;
    precise float _502 = _501 * _501;
    precise float _503 = _502 * _502;
    precise float _504 = _501 * _503;
    precise float _505 = 1.0 - _416;
    precise float _506 = 1.0 - _417;
    precise float _507 = 1.0 - _418;
    precise float _511 = _498 * fma(_505, _504, _416);
    precise float _512 = _499 * fma(_506, _504, _417);
    precise float _513 = _500 * fma(_507, _504, _418);
    SV_Target.x = fma(_421, _495, _511);
    SV_Target.y = fma(_422, _496, _512);
    SV_Target.z = fma(_423, _497, _513);
    SV_Target.w = 1.0;
}

