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
layout(set = 0, binding = 6) uniform texture2D t0;
layout(set = 0, binding = 7) uniform texture3D t1;

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
    precise float _121 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _121));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _104 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _104)));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _92 = a.x * b.x;
    return fma(a.y, b.y, _92);
}

void main()
{
    precise float _145 = cb1._m4.x - TEXCOORD2.x;
    precise float _146 = cb1._m4.y - TEXCOORD2.y;
    precise float _147 = cb1._m4.z - TEXCOORD2.z;
    vec3 _148 = vec3(_145, _146, _147);
    precise float _150 = inversesqrt(dp3_f32(_148, _148));
    precise float _151 = _150 * _145;
    precise float _152 = _150 * _146;
    precise float _153 = _150 * _147;
    precise float _156 = TEXCOORD.y * 150.0;
    precise float _159 = sin(roundEven(_156)) * 43758.546875;
    precise float _161 = fract(_159) - 0.5;
    precise float _164 = fma(_161, 0.00999999977648258209228515625, TEXCOORD.x);
    precise float _165 = _164 * 150.0;
    precise float _168 = sin(roundEven(_165)) * 43758.546875;
    precise float _170 = fract(_168) - 0.5;
    precise float _171 = fma(_170, 0.0500000007450580596923828125, TEXCOORD.y);
    precise float _180 = abs(dFdx(_164)) + abs(dFdy(_164));
    precise float _181 = abs(dFdx(_171)) + abs(dFdy(_171));
    precise float _182 = _181 * 0.2666666805744171142578125;
    precise float _183 = _171 - 0.5;
    precise float _184 = _164 - 0.02999999932944774627685546875;
    precise float _186 = fma(-_184, 1.06382977962493896484375, 1.0);
    precise float _187 = _184 / _180;
    precise float _189 = 0.9700000286102294921875 - _164;
    precise float _190 = _189 / _180;
    precise float _192 = spvNClamp(_190, 0.0, 1.0) * spvNClamp(_187, 0.0, 1.0);
    precise float _195 = fma(_183, 0.2666666805744171142578125, 0.069999992847442626953125) / _182;
    precise float _197 = _192 * spvNClamp(_195, 0.0, 1.0);
    precise float _198 = 0.569999992847442626953125 - fma(_183, 0.2666666805744171142578125, 0.5);
    precise float _199 = _198 / _182;
    precise float _201 = _197 * spvNClamp(_199, 0.0, 1.0);
    precise float _213 = cb0._m16.x - cb0._m14.x;
    precise float _214 = cb0._m16.y - cb0._m14.y;
    precise float _215 = cb0._m16.z - cb0._m14.z;
    precise float _216 = fma(_201, _213, cb0._m14.x);
    precise float _217 = fma(_201, _214, cb0._m14.y);
    precise float _218 = fma(_201, _215, cb0._m14.z);
    float _224 = float(cb0._m22.x >= 0.5);
    precise float _235 = cb0._m20.x - cb0._m18.x;
    precise float _236 = cb0._m20.y - cb0._m18.y;
    precise float _237 = cb0._m20.z - cb0._m18.z;
    precise float _243 = _186 - cb0._m22.y;
    precise float _248 = abs(dFdy(_186)) + abs(dFdx(_186));
    precise float _249 = _243 / _248;
    float _252 = (_201 <= 0.0) ? 0.0 : spvNClamp(_249, 0.0, 1.0);
    precise float _253 = fma(_224, _235, cb0._m18.x) - _216;
    precise float _254 = fma(_224, _236, cb0._m18.y) - _217;
    precise float _255 = fma(_224, _237, cb0._m18.z) - _218;
    precise float _256 = fma(_252, _253, _216);
    precise float _257 = fma(_252, _254, _217);
    precise float _258 = fma(_252, _255, _218);
    precise float _264 = TEXCOORD2.y * cb0._m7.x;
    precise float _265 = TEXCOORD2.y * cb0._m7.y;
    precise float _282 = fma(cb0._m9.x, TEXCOORD2.z, fma(cb0._m5.x, TEXCOORD2.x, _264)) + cb0._m11.x;
    precise float _283 = fma(cb0._m9.y, TEXCOORD2.z, fma(cb0._m5.y, TEXCOORD2.x, _265)) + cb0._m11.y;
    float _359;
    float _360;
    float _361;
    float _362;
    if (cb3._m0.x == 1.0)
    {
        bool _292 = cb3._m0.y == 1.0;
        precise float _298 = TEXCOORD2.y * cb3._m3.x;
        precise float _299 = TEXCOORD2.y * cb3._m3.y;
        precise float _300 = TEXCOORD2.y * cb3._m3.z;
        precise float _322 = fma(cb3._m5.x, TEXCOORD2.z, fma(cb3._m1.x, TEXCOORD2.x, _298)) + cb3._m7.x;
        precise float _323 = fma(cb3._m5.y, TEXCOORD2.z, fma(cb3._m1.y, TEXCOORD2.x, _299)) + cb3._m7.y;
        precise float _324 = fma(cb3._m5.z, TEXCOORD2.z, fma(cb3._m1.z, TEXCOORD2.x, _300)) + cb3._m7.z;
        precise float _333 = (_292 ? _322 : TEXCOORD2.x) - cb3._m11.x;
        precise float _334 = (_292 ? _323 : TEXCOORD2.y) - cb3._m11.y;
        precise float _335 = (_292 ? _324 : TEXCOORD2.z) - cb3._m11.z;
        precise float _341 = _333 * cb3._m9.x;
        precise float _342 = _334 * cb3._m9.y;
        precise float _343 = _335 * cb3._m9.z;
        vec4 _354 = texture(sampler3D(t1, s0), vec3(spvNMax(fma(_341, 0.25, 0.75), fma(cb3._m0.z, 0.5, 0.75)), _342, _343));
        _359 = _354.w;
        _360 = _354.z;
        _361 = _354.y;
        _362 = _354.x;
    }
    else
    {
        _359 = 1.0;
        _360 = 1.0;
        _361 = 1.0;
        _362 = 1.0;
    }
    precise float _377 = spvNClamp(dp4_f32(vec4(_362, _361, _360, _359), cb2._m47), 0.0, 1.0) * texture(sampler2D(t0, s1), vec2(_282, _283)).w;
    precise float _383 = _377 * cb0._m2.x;
    precise float _384 = _377 * cb0._m2.y;
    precise float _385 = _377 * cb0._m2.z;
    vec3 _392 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    precise float _394 = inversesqrt(dp3_f32(_392, _392));
    precise float _395 = _394 * TEXCOORD1.x;
    precise float _396 = _394 * TEXCOORD1.y;
    precise float _397 = _394 * TEXCOORD1.z;
    precise float _398 = _256 - 0.039999999105930328369140625;
    precise float _399 = _257 - 0.039999999105930328369140625;
    precise float _400 = _258 - 0.039999999105930328369140625;
    precise float _403 = fma(cb0._m13.y, _398, 0.039999999105930328369140625);
    precise float _404 = fma(cb0._m13.y, _399, 0.039999999105930328369140625);
    precise float _405 = fma(cb0._m13.y, _400, 0.039999999105930328369140625);
    precise float _407 = fma(-cb0._m13.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _408 = _407 * _256;
    precise float _409 = _407 * _257;
    precise float _410 = _407 * _258;
    precise float _413 = 1.0 - cb0._m13.x;
    precise float _419 = fma(_145, _150, cb2._m0.x);
    precise float _420 = fma(_146, _150, cb2._m0.y);
    precise float _421 = fma(_147, _150, cb2._m0.z);
    vec3 _422 = vec3(_419, _420, _421);
    precise float _425 = inversesqrt(spvNMax(dp3_f32(_422, _422), 0.001000000047497451305389404296875));
    precise float _426 = _425 * _419;
    precise float _427 = _425 * _420;
    precise float _428 = _425 * _421;
    vec3 _429 = vec3(_395, _396, _397);
    precise float _433 = spvNClamp(dp3_f32(_429, cb2._m0), 0.0, 1.0);
    vec3 _434 = vec3(_426, _427, _428);
    precise float _436 = spvNClamp(dp3_f32(_429, _434), 0.0, 1.0);
    precise float _438 = spvNClamp(dp3_f32(cb2._m0, _434), 0.0, 1.0);
    precise float _439 = _438 * _438;
    precise float _443 = dp2_f32(vec2(_439), vec2(_413)) - 0.5;
    precise float _444 = 1.0 - _433;
    precise float _445 = _444 * _444;
    precise float _446 = _445 * _445;
    precise float _447 = _444 * _446;
    precise float _449 = abs(dp3_f32(_429, vec3(_151, _152, _153)));
    precise float _450 = 1.0 - _449;
    precise float _451 = _450 * _450;
    precise float _452 = _451 * _451;
    precise float _453 = _450 * _452;
    precise float _455 = fma(_443, _453, 1.0) * fma(_443, _447, 1.0);
    precise float _456 = _413 * _413;
    precise float _457 = spvNMax(_456, 0.00200000009499490261077880859375);
    precise float _458 = 1.0 - _457;
    precise float _461 = _449 * fma(_433, _458, _457);
    precise float _463 = fma(_433, fma(_449, _458, _457), _461) + 9.9999997473787516355514526367188e-06;
    precise float _464 = 0.5 / _463;
    precise float _465 = _457 * _457;
    precise float _468 = fma(fma(_436, _465, -_436), _436, 1.0);
    precise float _469 = _465 * 0.3183098733425140380859375;
    precise float _471 = _469 / fma(_468, _468, 1.0000000116860974230803549289703e-07);
    precise float _472 = _471 * _464;
    precise float _473 = _472 * 3.1415927410125732421875;
    precise float _474 = _433 * _455;
    precise float _475 = _433 * _473;
    vec3 _477 = vec3(_403, _404, _405);
    precise float _481 = ((dp3_f32(_477, _477) == 0.0) ? 0.0 : 1.0) * spvNMax(_475, 0.0);
    precise float _482 = _474 * _383;
    precise float _483 = _474 * _384;
    precise float _484 = _474 * _385;
    precise float _485 = _383 * _481;
    precise float _486 = _384 * _481;
    precise float _487 = _385 * _481;
    precise float _488 = 1.0 - _438;
    precise float _489 = _488 * _488;
    precise float _490 = _489 * _489;
    precise float _491 = _488 * _490;
    precise float _492 = 1.0 - _403;
    precise float _493 = 1.0 - _404;
    precise float _494 = 1.0 - _405;
    precise float _498 = _485 * fma(_492, _491, _403);
    precise float _499 = _486 * fma(_493, _491, _404);
    precise float _500 = _487 * fma(_494, _491, _405);
    SV_Target.x = fma(_408, _482, _498);
    SV_Target.y = fma(_409, _483, _499);
    SV_Target.z = fma(_410, _484, _500);
    SV_Target.w = 1.0;
}

