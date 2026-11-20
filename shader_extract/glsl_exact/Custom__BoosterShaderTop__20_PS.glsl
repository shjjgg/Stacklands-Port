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
layout(set = 0, binding = 8) uniform sampler s4;
layout(set = 0, binding = 9) uniform texture2D t0;
layout(set = 0, binding = 10) uniform texture2D t1;
layout(set = 0, binding = 11) uniform texture2D t2;
layout(set = 0, binding = 12) uniform textureCube t3;
layout(set = 0, binding = 13) uniform texture3D t4;

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
    precise float _131 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _131));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _120 = a.x * b.x;
    return fma(a.y, b.y, _120);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _102 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _102)));
}

void main()
{
    precise float _155 = cb2._m0.x - TEXCOORD2.x;
    precise float _156 = cb2._m0.y - TEXCOORD2.y;
    precise float _157 = cb2._m0.z - TEXCOORD2.z;
    vec3 _158 = vec3(_155, _156, _157);
    precise float _160 = inversesqrt(dp3_f32(_158, _158));
    precise float _161 = _160 * _155;
    precise float _162 = _160 * _156;
    precise float _163 = _160 * _157;
    precise float _170 = cb1._m4.x - TEXCOORD2.x;
    precise float _171 = cb1._m4.y - TEXCOORD2.y;
    precise float _172 = cb1._m4.z - TEXCOORD2.z;
    vec3 _173 = vec3(_170, _171, _172);
    precise float _175 = inversesqrt(dp3_f32(_173, _173));
    precise float _176 = _175 * _170;
    precise float _177 = _175 * _171;
    precise float _178 = _175 * _172;
    precise float _183 = TEXCOORD.y * 150.0;
    precise float _184 = TEXCOORD.x * 20.0;
    precise float _185 = TEXCOORD.y * 1.0;
    precise float _188 = sin(roundEven(_183)) * 43758.546875;
    precise float _190 = fma(fract(_188), 0.004999999888241291046142578125, TEXCOORD.x);
    precise float _191 = _190 * 150.0;
    precise float _194 = sin(roundEven(_191)) * 43758.546875;
    precise float _196 = fma(fract(_194), 0.004999999888241291046142578125, TEXCOORD.y);
    precise float _205 = abs(dFdx(_190)) + abs(dFdy(_190));
    precise float _206 = abs(dFdx(_196)) + abs(dFdy(_196));
    precise float _207 = 0.5 - TEXCOORD.x;
    precise float _208 = 0.550000011920928955078125 - TEXCOORD.y;
    vec4 _214 = texture(sampler2D(t0, s3), vec2(_184, _185));
    float _215 = _214.x;
    float _216 = _214.y;
    float _217 = _214.z;
    precise float _224 = _215 * cb0._m14.x;
    precise float _225 = _216 * cb0._m14.y;
    precise float _226 = _217 * cb0._m14.z;
    precise float _227 = TEXCOORD2.x - cb1._m4.x;
    precise float _228 = TEXCOORD2.y - cb1._m4.y;
    precise float _229 = TEXCOORD2.z - cb1._m4.z;
    vec3 _230 = vec3(_227, _228, _229);
    precise float _232 = inversesqrt(dp3_f32(_230, _230));
    precise float _233 = _232 * _227;
    precise float _234 = _232 * _229;
    precise float _235 = TEXCOORD.y + TEXCOORD.x;
    precise float _236 = TEXCOORD.y + TEXCOORD.y;
    precise float _240 = fma(-_234, 5.0, _236);
    precise float _241 = _240 * 10.0;
    precise float _243 = fma(sin(_241), 0.0199999995529651641845703125, fma(-_233, 5.0, _235));
    precise float _244 = _243 * 30.0;
    vec4 _251 = texture(sampler2D(t1, s4), vec2(_243, fma(cos(_244), 0.0199999995529651641845703125, _240)));
    vec2 _257 = vec2(fma(_207, 1.75, 0.0), fma(_208, 1.75, -0.050000011920928955078125));
    precise float _260 = sqrt(dp2_f32(_257, _257)) - 0.400390625;
    precise float _261 = _260 / _205;
    precise float _263 = 1.0 - spvNClamp(_261, 0.0, 1.0);
    precise float _278 = _190 - 0.1167768537998199462890625;
    precise float _279 = _278 / _205;
    precise float _281 = 0.88322317600250244140625 - _190;
    precise float _282 = _281 / _205;
    precise float _284 = spvNClamp(_282, 0.0, 1.0) * spvNClamp(_279, 0.0, 1.0);
    precise float _285 = _196 - 0.02999999932944774627685546875;
    precise float _286 = _285 / _206;
    precise float _288 = _284 * spvNClamp(_286, 0.0, 1.0);
    precise float _289 = 0.9700000286102294921875 - _196;
    precise float _290 = _289 / _206;
    precise float _292 = _288 * spvNClamp(_290, 0.0, 1.0);
    precise float _293 = fma(_251.x, 0.5, fma(_263, fma(-cb0._m14.x, _215, cb0._m16.x), _224));
    precise float _294 = fma(_251.y, 0.5, fma(_263, fma(-cb0._m14.y, _216, cb0._m16.y), _225));
    precise float _295 = fma(_251.z, 0.5, fma(_263, fma(-cb0._m14.z, _217, cb0._m16.z), _226));
    precise float _296 = _292 * _293;
    precise float _297 = _292 * _294;
    precise float _298 = _292 * _295;
    precise float _304 = TEXCOORD2.y * cb0._m7.x;
    precise float _305 = TEXCOORD2.y * cb0._m7.y;
    precise float _306 = TEXCOORD2.y * cb0._m7.z;
    precise float _328 = fma(cb0._m9.x, TEXCOORD2.z, fma(cb0._m5.x, TEXCOORD2.x, _304)) + cb0._m11.x;
    precise float _329 = fma(cb0._m9.y, TEXCOORD2.z, fma(cb0._m5.y, TEXCOORD2.x, _305)) + cb0._m11.y;
    precise float _330 = fma(cb0._m9.z, TEXCOORD2.z, fma(cb0._m5.z, TEXCOORD2.x, _306)) + cb0._m11.z;
    float _408;
    float _409;
    float _410;
    float _411;
    if (cb3._m0.x == 1.0)
    {
        bool _341 = cb3._m0.y == 1.0;
        precise float _347 = TEXCOORD2.y * cb3._m3.x;
        precise float _348 = TEXCOORD2.y * cb3._m3.y;
        precise float _349 = TEXCOORD2.y * cb3._m3.z;
        precise float _371 = fma(cb3._m5.x, TEXCOORD2.z, fma(cb3._m1.x, TEXCOORD2.x, _347)) + cb3._m7.x;
        precise float _372 = fma(cb3._m5.y, TEXCOORD2.z, fma(cb3._m1.y, TEXCOORD2.x, _348)) + cb3._m7.y;
        precise float _373 = fma(cb3._m5.z, TEXCOORD2.z, fma(cb3._m1.z, TEXCOORD2.x, _349)) + cb3._m7.z;
        precise float _382 = (_341 ? _371 : TEXCOORD2.x) - cb3._m11.x;
        precise float _383 = (_341 ? _372 : TEXCOORD2.y) - cb3._m11.y;
        precise float _384 = (_341 ? _373 : TEXCOORD2.z) - cb3._m11.z;
        precise float _390 = _382 * cb3._m9.x;
        precise float _391 = _383 * cb3._m9.y;
        precise float _392 = _384 * cb3._m9.z;
        vec4 _403 = texture(sampler3D(t4, s0), vec3(spvNMax(fma(_390, 0.25, 0.75), fma(cb3._m0.z, 0.5, 0.75)), _391, _392));
        _408 = _403.w;
        _409 = _403.z;
        _410 = _403.y;
        _411 = _403.x;
    }
    else
    {
        _408 = 1.0;
        _409 = 1.0;
        _410 = 1.0;
        _411 = 1.0;
    }
    vec3 _418 = vec3(_328, _329, _330);
    precise float _432 = texture(samplerCube(t3, s1), _418).w * texture(sampler2D(t2, s2), vec2(dp3_f32(_418, _418))).x;
    precise float _433 = spvNClamp(dp4_f32(vec4(_411, _410, _409, _408), cb2._m47), 0.0, 1.0) * _432;
    precise float _439 = _433 * cb0._m2.x;
    precise float _440 = _433 * cb0._m2.y;
    precise float _441 = _433 * cb0._m2.z;
    vec3 _448 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    precise float _450 = inversesqrt(dp3_f32(_448, _448));
    precise float _451 = _450 * TEXCOORD1.x;
    precise float _452 = _450 * TEXCOORD1.y;
    precise float _453 = _450 * TEXCOORD1.z;
    precise float _459 = fma(cb0._m13.y, fma(_292, _293, -0.039999999105930328369140625), 0.039999999105930328369140625);
    precise float _460 = fma(cb0._m13.y, fma(_292, _294, -0.039999999105930328369140625), 0.039999999105930328369140625);
    precise float _461 = fma(cb0._m13.y, fma(_292, _295, -0.039999999105930328369140625), 0.039999999105930328369140625);
    precise float _463 = fma(-cb0._m13.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _464 = _463 * _296;
    precise float _465 = _463 * _297;
    precise float _466 = _463 * _298;
    precise float _469 = 1.0 - cb0._m13.x;
    precise float _470 = fma(_155, _160, _176);
    precise float _471 = fma(_156, _160, _177);
    precise float _472 = fma(_157, _160, _178);
    vec3 _473 = vec3(_470, _471, _472);
    precise float _476 = inversesqrt(spvNMax(dp3_f32(_473, _473), 0.001000000047497451305389404296875));
    precise float _477 = _476 * _470;
    precise float _478 = _476 * _471;
    precise float _479 = _476 * _472;
    vec3 _480 = vec3(_451, _452, _453);
    vec3 _483 = vec3(_161, _162, _163);
    precise float _485 = spvNClamp(dp3_f32(_480, _483), 0.0, 1.0);
    vec3 _486 = vec3(_477, _478, _479);
    precise float _488 = spvNClamp(dp3_f32(_480, _486), 0.0, 1.0);
    precise float _490 = spvNClamp(dp3_f32(_483, _486), 0.0, 1.0);
    precise float _491 = _490 * _490;
    precise float _495 = dp2_f32(vec2(_491), vec2(_469)) - 0.5;
    precise float _496 = 1.0 - _485;
    precise float _497 = _496 * _496;
    precise float _498 = _497 * _497;
    precise float _499 = _496 * _498;
    precise float _501 = abs(dp3_f32(_480, vec3(_176, _177, _178)));
    precise float _502 = 1.0 - _501;
    precise float _503 = _502 * _502;
    precise float _504 = _503 * _503;
    precise float _505 = _502 * _504;
    precise float _507 = fma(_495, _505, 1.0) * fma(_495, _499, 1.0);
    precise float _508 = _469 * _469;
    precise float _509 = spvNMax(_508, 0.00200000009499490261077880859375);
    precise float _510 = 1.0 - _509;
    precise float _513 = _501 * fma(_485, _510, _509);
    precise float _515 = fma(_485, fma(_501, _510, _509), _513) + 9.9999997473787516355514526367188e-06;
    precise float _516 = 0.5 / _515;
    precise float _517 = _509 * _509;
    precise float _520 = fma(fma(_488, _517, -_488), _488, 1.0);
    precise float _521 = _517 * 0.3183098733425140380859375;
    precise float _523 = _521 / fma(_520, _520, 1.0000000116860974230803549289703e-07);
    precise float _524 = _523 * _516;
    precise float _525 = _524 * 3.1415927410125732421875;
    precise float _526 = _485 * _507;
    precise float _527 = _485 * _525;
    vec3 _529 = vec3(_459, _460, _461);
    precise float _533 = ((dp3_f32(_529, _529) == 0.0) ? 0.0 : 1.0) * spvNMax(_527, 0.0);
    precise float _534 = _526 * _439;
    precise float _535 = _526 * _440;
    precise float _536 = _526 * _441;
    precise float _537 = _439 * _533;
    precise float _538 = _440 * _533;
    precise float _539 = _441 * _533;
    precise float _540 = 1.0 - _490;
    precise float _541 = _540 * _540;
    precise float _542 = _541 * _541;
    precise float _543 = _540 * _542;
    precise float _544 = 1.0 - _459;
    precise float _545 = 1.0 - _460;
    precise float _546 = 1.0 - _461;
    precise float _550 = _537 * fma(_544, _543, _459);
    precise float _551 = _538 * fma(_545, _543, _460);
    precise float _552 = _539 * fma(_546, _543, _461);
    SV_Target.x = fma(_464, _534, _550);
    SV_Target.y = fma(_465, _535, _551);
    SV_Target.z = fma(_466, _536, _552);
    SV_Target.w = 1.0;
}

