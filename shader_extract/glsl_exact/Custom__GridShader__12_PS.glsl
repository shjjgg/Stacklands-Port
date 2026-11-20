#version 450
#extension GL_EXT_buffer_reference2 : require
#extension GL_EXT_scalar_block_layout : require
#extension GL_EXT_spirv_intrinsics : require

layout(set = 0, binding = 0, scalar) uniform cb0_buf
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
    float _m12;
    vec2 _m13;
    float _m14;
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

layout(location = 1, component = 0) in vec3 TEXCOORD;
layout(location = 2, component = 0) in vec3 TEXCOORD1;
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
    precise float _113 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _113));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _96 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _96)));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _84 = a.x * b.x;
    return fma(a.y, b.y, _84);
}

void main()
{
    precise float _137 = cb2._m0.x - TEXCOORD1.x;
    precise float _138 = cb2._m0.y - TEXCOORD1.y;
    precise float _139 = cb2._m0.z - TEXCOORD1.z;
    vec3 _140 = vec3(_137, _138, _139);
    precise float _142 = inversesqrt(dp3_f32(_140, _140));
    precise float _143 = _142 * _137;
    precise float _144 = _142 * _138;
    precise float _145 = _142 * _139;
    precise float _152 = cb1._m4.x - TEXCOORD1.x;
    precise float _153 = cb1._m4.y - TEXCOORD1.y;
    precise float _154 = cb1._m4.z - TEXCOORD1.z;
    vec3 _155 = vec3(_152, _153, _154);
    precise float _157 = inversesqrt(dp3_f32(_155, _155));
    precise float _158 = _157 * _152;
    precise float _159 = _157 * _153;
    precise float _160 = _157 * _154;
    precise float _167 = TEXCOORD1.x / cb0._m13.x;
    precise float _168 = TEXCOORD1.z / cb0._m13.y;
    precise float _171 = fract(_167) + 0.5;
    precise float _172 = fract(_168) + 0.5;
    precise float _176 = fract(_171);
    precise float _177 = fract(_172);
    float _180 = (_171 >= 0.0) ? _176 : (-_176);
    float _181 = (_172 >= 0.0) ? _177 : (-_177);
    precise float _185 = cb0._m12 - 0.00999999977648258209228515625;
    precise float _186 = _180 - _185;
    precise float _187 = _181 - _185;
    precise float _188 = _186 * 50.0;
    precise float _189 = _187 * 50.0;
    precise float _190 = spvNClamp(_188, 0.0, 1.0);
    precise float _191 = spvNClamp(_189, 0.0, 1.0);
    precise float _194 = _190 * _190;
    precise float _195 = _191 * _191;
    precise float _196 = _194 * fma(_190, -2.0, 3.0);
    precise float _197 = _195 * fma(_191, -2.0, 3.0);
    precise float _198 = _197 * _196;
    precise float _199 = _185 + _180;
    precise float _200 = _185 + _181;
    precise float _201 = 1.0 - _199;
    precise float _202 = 1.0 - _200;
    precise float _203 = _201 * 50.0;
    precise float _204 = _202 * 50.0;
    precise float _205 = spvNClamp(_203, 0.0, 1.0);
    precise float _206 = spvNClamp(_204, 0.0, 1.0);
    precise float _209 = _205 * _205;
    precise float _210 = _206 * _206;
    precise float _211 = _209 * fma(_205, -2.0, 3.0);
    precise float _212 = _210 * fma(_206, -2.0, 3.0);
    precise float _213 = _198 * _211;
    precise float _218 = fma(-_213, _212, 1.0) * cb0._m14;
    precise float _219 = _218 * 0.5;
    precise float _227 = TEXCOORD1.y * cb0._m6.x;
    precise float _228 = TEXCOORD1.y * cb0._m6.y;
    precise float _229 = TEXCOORD1.y * cb0._m6.z;
    precise float _230 = TEXCOORD1.y * cb0._m6.w;
    precise float _257 = fma(cb0._m7.x, TEXCOORD1.z, fma(cb0._m5.x, TEXCOORD1.x, _227)) + cb0._m8.x;
    precise float _258 = fma(cb0._m7.y, TEXCOORD1.z, fma(cb0._m5.y, TEXCOORD1.x, _228)) + cb0._m8.y;
    precise float _259 = fma(cb0._m7.z, TEXCOORD1.z, fma(cb0._m5.z, TEXCOORD1.x, _229)) + cb0._m8.z;
    precise float _260 = fma(cb0._m7.w, TEXCOORD1.z, fma(cb0._m5.w, TEXCOORD1.x, _230)) + cb0._m8.w;
    float _336;
    float _337;
    float _338;
    float _339;
    if (cb3._m0.x == 1.0)
    {
        bool _269 = cb3._m0.y == 1.0;
        precise float _275 = TEXCOORD1.y * cb3._m3.x;
        precise float _276 = TEXCOORD1.y * cb3._m3.y;
        precise float _277 = TEXCOORD1.y * cb3._m3.z;
        precise float _299 = fma(cb3._m5.x, TEXCOORD1.z, fma(cb3._m1.x, TEXCOORD1.x, _275)) + cb3._m7.x;
        precise float _300 = fma(cb3._m5.y, TEXCOORD1.z, fma(cb3._m1.y, TEXCOORD1.x, _276)) + cb3._m7.y;
        precise float _301 = fma(cb3._m5.z, TEXCOORD1.z, fma(cb3._m1.z, TEXCOORD1.x, _277)) + cb3._m7.z;
        precise float _310 = (_269 ? _299 : TEXCOORD1.x) - cb3._m11.x;
        precise float _311 = (_269 ? _300 : TEXCOORD1.y) - cb3._m11.y;
        precise float _312 = (_269 ? _301 : TEXCOORD1.z) - cb3._m11.z;
        precise float _318 = _310 * cb3._m9.x;
        precise float _319 = _311 * cb3._m9.y;
        precise float _320 = _312 * cb3._m9.z;
        vec4 _331 = texture(sampler3D(t2, s0), vec3(spvNMax(fma(_318, 0.25, 0.75), fma(cb3._m0.z, 0.5, 0.75)), _319, _320));
        _336 = _331.w;
        _337 = _331.z;
        _338 = _331.y;
        _339 = _331.x;
    }
    else
    {
        _336 = 1.0;
        _337 = 1.0;
        _338 = 1.0;
        _339 = 1.0;
    }
    precise float _347 = _257 / _260;
    precise float _348 = _258 / _260;
    precise float _349 = _347 + 0.5;
    precise float _350 = _348 + 0.5;
    precise float _358 = float(_259 > 0.0) * texture(sampler2D(t0, s1), vec2(_349, _350)).w;
    vec3 _359 = vec3(_257, _258, _259);
    precise float _367 = _358 * texture(sampler2D(t1, s2), vec2(dp3_f32(_359, _359))).x;
    precise float _368 = spvNClamp(dp4_f32(vec4(_339, _338, _337, _336), cb2._m47), 0.0, 1.0) * _367;
    precise float _374 = _368 * cb0._m2.x;
    precise float _375 = _368 * cb0._m2.y;
    precise float _376 = _368 * cb0._m2.z;
    vec3 _383 = vec3(TEXCOORD.x, TEXCOORD.y, TEXCOORD.z);
    precise float _385 = inversesqrt(dp3_f32(_383, _383));
    precise float _386 = _385 * TEXCOORD.x;
    precise float _387 = _385 * TEXCOORD.y;
    precise float _388 = _385 * TEXCOORD.z;
    precise float _394 = cb0._m10.x - 0.039999999105930328369140625;
    precise float _395 = cb0._m10.y - 0.039999999105930328369140625;
    precise float _396 = cb0._m10.z - 0.039999999105930328369140625;
    precise float _399 = fma(cb0._m9.y, _394, 0.039999999105930328369140625);
    precise float _400 = fma(cb0._m9.y, _395, 0.039999999105930328369140625);
    precise float _401 = fma(cb0._m9.y, _396, 0.039999999105930328369140625);
    precise float _403 = fma(-cb0._m9.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _404 = _403 * cb0._m10.x;
    precise float _405 = _403 * cb0._m10.y;
    precise float _406 = _403 * cb0._m10.z;
    precise float _407 = _219 * _404;
    precise float _408 = _219 * _405;
    precise float _409 = _219 * _406;
    precise float _410 = 1.0 - _403;
    SV_Target.w = fma(_219, _403, _410);
    precise float _416 = 1.0 - cb0._m9.x;
    precise float _417 = fma(_137, _142, _158);
    precise float _418 = fma(_138, _142, _159);
    precise float _419 = fma(_139, _142, _160);
    vec3 _420 = vec3(_417, _418, _419);
    precise float _423 = inversesqrt(spvNMax(dp3_f32(_420, _420), 0.001000000047497451305389404296875));
    precise float _424 = _423 * _417;
    precise float _425 = _423 * _418;
    precise float _426 = _423 * _419;
    vec3 _427 = vec3(_386, _387, _388);
    vec3 _430 = vec3(_143, _144, _145);
    precise float _432 = spvNClamp(dp3_f32(_427, _430), 0.0, 1.0);
    vec3 _433 = vec3(_424, _425, _426);
    precise float _435 = spvNClamp(dp3_f32(_427, _433), 0.0, 1.0);
    precise float _437 = spvNClamp(dp3_f32(_430, _433), 0.0, 1.0);
    precise float _438 = _437 * _437;
    precise float _442 = dp2_f32(vec2(_438), vec2(_416)) - 0.5;
    precise float _443 = 1.0 - _432;
    precise float _444 = _443 * _443;
    precise float _445 = _444 * _444;
    precise float _446 = _443 * _445;
    precise float _448 = abs(dp3_f32(_427, vec3(_158, _159, _160)));
    precise float _449 = 1.0 - _448;
    precise float _450 = _449 * _449;
    precise float _451 = _450 * _450;
    precise float _452 = _449 * _451;
    precise float _454 = fma(_442, _452, 1.0) * fma(_442, _446, 1.0);
    precise float _455 = _416 * _416;
    precise float _456 = spvNMax(_455, 0.00200000009499490261077880859375);
    precise float _457 = 1.0 - _456;
    precise float _460 = _448 * fma(_432, _457, _456);
    precise float _462 = fma(_432, fma(_448, _457, _456), _460) + 9.9999997473787516355514526367188e-06;
    precise float _463 = 0.5 / _462;
    precise float _464 = _456 * _456;
    precise float _467 = fma(fma(_435, _464, -_435), _435, 1.0);
    precise float _468 = _464 * 0.3183098733425140380859375;
    precise float _470 = _468 / fma(_467, _467, 1.0000000116860974230803549289703e-07);
    precise float _471 = _470 * _463;
    precise float _472 = _471 * 3.1415927410125732421875;
    precise float _473 = _432 * _454;
    precise float _474 = _432 * _472;
    vec3 _476 = vec3(_399, _400, _401);
    precise float _480 = ((dp3_f32(_476, _476) == 0.0) ? 0.0 : 1.0) * spvNMax(_474, 0.0);
    precise float _481 = _473 * _374;
    precise float _482 = _473 * _375;
    precise float _483 = _473 * _376;
    precise float _484 = _374 * _480;
    precise float _485 = _375 * _480;
    precise float _486 = _376 * _480;
    precise float _487 = 1.0 - _437;
    precise float _488 = _487 * _487;
    precise float _489 = _488 * _488;
    precise float _490 = _487 * _489;
    precise float _491 = 1.0 - _399;
    precise float _492 = 1.0 - _400;
    precise float _493 = 1.0 - _401;
    precise float _497 = _484 * fma(_491, _490, _399);
    precise float _498 = _485 * fma(_492, _490, _400);
    precise float _499 = _486 * fma(_493, _490, _401);
    SV_Target.x = fma(_407, _481, _497);
    SV_Target.y = fma(_408, _482, _498);
    SV_Target.z = fma(_409, _483, _499);
}

