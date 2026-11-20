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
    float _m16;
    vec2 _m17;
    float _m18;
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
    precise float _114 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _114));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _97 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _97)));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _85 = a.x * b.x;
    return fma(a.y, b.y, _85);
}

void main()
{
    precise float _138 = cb2._m0.x - TEXCOORD1.x;
    precise float _139 = cb2._m0.y - TEXCOORD1.y;
    precise float _140 = cb2._m0.z - TEXCOORD1.z;
    vec3 _141 = vec3(_138, _139, _140);
    precise float _143 = inversesqrt(dp3_f32(_141, _141));
    precise float _144 = _143 * _138;
    precise float _145 = _143 * _139;
    precise float _146 = _143 * _140;
    precise float _153 = cb1._m4.x - TEXCOORD1.x;
    precise float _154 = cb1._m4.y - TEXCOORD1.y;
    precise float _155 = cb1._m4.z - TEXCOORD1.z;
    vec3 _156 = vec3(_153, _154, _155);
    precise float _158 = inversesqrt(dp3_f32(_156, _156));
    precise float _159 = _158 * _153;
    precise float _160 = _158 * _154;
    precise float _161 = _158 * _155;
    precise float _168 = TEXCOORD1.x / cb0._m17.x;
    precise float _169 = TEXCOORD1.z / cb0._m17.y;
    precise float _172 = fract(_168) + 0.5;
    precise float _173 = fract(_169) + 0.5;
    precise float _177 = fract(_172);
    precise float _178 = fract(_173);
    float _181 = (_172 >= 0.0) ? _177 : (-_177);
    float _182 = (_173 >= 0.0) ? _178 : (-_178);
    precise float _186 = cb0._m16 - 0.00999999977648258209228515625;
    precise float _187 = _181 - _186;
    precise float _188 = _182 - _186;
    precise float _189 = _187 * 50.0;
    precise float _190 = _188 * 50.0;
    precise float _191 = spvNClamp(_189, 0.0, 1.0);
    precise float _192 = spvNClamp(_190, 0.0, 1.0);
    precise float _195 = _191 * _191;
    precise float _196 = _192 * _192;
    precise float _197 = _195 * fma(_191, -2.0, 3.0);
    precise float _198 = _196 * fma(_192, -2.0, 3.0);
    precise float _199 = _198 * _197;
    precise float _200 = _186 + _181;
    precise float _201 = _186 + _182;
    precise float _202 = 1.0 - _200;
    precise float _203 = 1.0 - _201;
    precise float _204 = _202 * 50.0;
    precise float _205 = _203 * 50.0;
    precise float _206 = spvNClamp(_204, 0.0, 1.0);
    precise float _207 = spvNClamp(_205, 0.0, 1.0);
    precise float _210 = _206 * _206;
    precise float _211 = _207 * _207;
    precise float _212 = _210 * fma(_206, -2.0, 3.0);
    precise float _213 = _211 * fma(_207, -2.0, 3.0);
    precise float _214 = _199 * _212;
    precise float _219 = fma(-_214, _213, 1.0) * cb0._m18;
    precise float _220 = _219 * 0.5;
    precise float _226 = TEXCOORD1.y * cb0._m7.x;
    precise float _227 = TEXCOORD1.y * cb0._m7.y;
    precise float _228 = TEXCOORD1.y * cb0._m7.z;
    precise float _250 = fma(cb0._m9.x, TEXCOORD1.z, fma(cb0._m5.x, TEXCOORD1.x, _226)) + cb0._m11.x;
    precise float _251 = fma(cb0._m9.y, TEXCOORD1.z, fma(cb0._m5.y, TEXCOORD1.x, _227)) + cb0._m11.y;
    precise float _252 = fma(cb0._m9.z, TEXCOORD1.z, fma(cb0._m5.z, TEXCOORD1.x, _228)) + cb0._m11.z;
    float _328;
    float _329;
    float _330;
    float _331;
    if (cb3._m0.x == 1.0)
    {
        bool _261 = cb3._m0.y == 1.0;
        precise float _267 = TEXCOORD1.y * cb3._m3.x;
        precise float _268 = TEXCOORD1.y * cb3._m3.y;
        precise float _269 = TEXCOORD1.y * cb3._m3.z;
        precise float _291 = fma(cb3._m5.x, TEXCOORD1.z, fma(cb3._m1.x, TEXCOORD1.x, _267)) + cb3._m7.x;
        precise float _292 = fma(cb3._m5.y, TEXCOORD1.z, fma(cb3._m1.y, TEXCOORD1.x, _268)) + cb3._m7.y;
        precise float _293 = fma(cb3._m5.z, TEXCOORD1.z, fma(cb3._m1.z, TEXCOORD1.x, _269)) + cb3._m7.z;
        precise float _302 = (_261 ? _291 : TEXCOORD1.x) - cb3._m11.x;
        precise float _303 = (_261 ? _292 : TEXCOORD1.y) - cb3._m11.y;
        precise float _304 = (_261 ? _293 : TEXCOORD1.z) - cb3._m11.z;
        precise float _310 = _302 * cb3._m9.x;
        precise float _311 = _303 * cb3._m9.y;
        precise float _312 = _304 * cb3._m9.z;
        vec4 _323 = texture(sampler3D(t2, s0), vec3(spvNMax(fma(_310, 0.25, 0.75), fma(cb3._m0.z, 0.5, 0.75)), _311, _312));
        _328 = _323.w;
        _329 = _323.z;
        _330 = _323.y;
        _331 = _323.x;
    }
    else
    {
        _328 = 1.0;
        _329 = 1.0;
        _330 = 1.0;
        _331 = 1.0;
    }
    vec3 _338 = vec3(_250, _251, _252);
    precise float _353 = texture(samplerCube(t1, s1), _338).w * texture(sampler2D(t0, s2), vec2(dp3_f32(_338, _338))).x;
    precise float _354 = spvNClamp(dp4_f32(vec4(_331, _330, _329, _328), cb2._m47), 0.0, 1.0) * _353;
    precise float _360 = _354 * cb0._m2.x;
    precise float _361 = _354 * cb0._m2.y;
    precise float _362 = _354 * cb0._m2.z;
    vec3 _369 = vec3(TEXCOORD.x, TEXCOORD.y, TEXCOORD.z);
    precise float _371 = inversesqrt(dp3_f32(_369, _369));
    precise float _372 = _371 * TEXCOORD.x;
    precise float _373 = _371 * TEXCOORD.y;
    precise float _374 = _371 * TEXCOORD.z;
    precise float _380 = cb0._m14.x - 0.039999999105930328369140625;
    precise float _381 = cb0._m14.y - 0.039999999105930328369140625;
    precise float _382 = cb0._m14.z - 0.039999999105930328369140625;
    precise float _385 = fma(cb0._m13.y, _380, 0.039999999105930328369140625);
    precise float _386 = fma(cb0._m13.y, _381, 0.039999999105930328369140625);
    precise float _387 = fma(cb0._m13.y, _382, 0.039999999105930328369140625);
    precise float _389 = fma(-cb0._m13.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _390 = _389 * cb0._m14.x;
    precise float _391 = _389 * cb0._m14.y;
    precise float _392 = _389 * cb0._m14.z;
    precise float _393 = _220 * _390;
    precise float _394 = _220 * _391;
    precise float _395 = _220 * _392;
    precise float _396 = 1.0 - _389;
    SV_Target.w = fma(_220, _389, _396);
    precise float _402 = 1.0 - cb0._m13.x;
    precise float _403 = fma(_138, _143, _159);
    precise float _404 = fma(_139, _143, _160);
    precise float _405 = fma(_140, _143, _161);
    vec3 _406 = vec3(_403, _404, _405);
    precise float _409 = inversesqrt(spvNMax(dp3_f32(_406, _406), 0.001000000047497451305389404296875));
    precise float _410 = _409 * _403;
    precise float _411 = _409 * _404;
    precise float _412 = _409 * _405;
    vec3 _413 = vec3(_372, _373, _374);
    vec3 _416 = vec3(_144, _145, _146);
    precise float _418 = spvNClamp(dp3_f32(_413, _416), 0.0, 1.0);
    vec3 _419 = vec3(_410, _411, _412);
    precise float _421 = spvNClamp(dp3_f32(_413, _419), 0.0, 1.0);
    precise float _423 = spvNClamp(dp3_f32(_416, _419), 0.0, 1.0);
    precise float _424 = _423 * _423;
    precise float _428 = dp2_f32(vec2(_424), vec2(_402)) - 0.5;
    precise float _429 = 1.0 - _418;
    precise float _430 = _429 * _429;
    precise float _431 = _430 * _430;
    precise float _432 = _429 * _431;
    precise float _434 = abs(dp3_f32(_413, vec3(_159, _160, _161)));
    precise float _435 = 1.0 - _434;
    precise float _436 = _435 * _435;
    precise float _437 = _436 * _436;
    precise float _438 = _435 * _437;
    precise float _440 = fma(_428, _438, 1.0) * fma(_428, _432, 1.0);
    precise float _441 = _402 * _402;
    precise float _442 = spvNMax(_441, 0.00200000009499490261077880859375);
    precise float _443 = 1.0 - _442;
    precise float _446 = _434 * fma(_418, _443, _442);
    precise float _448 = fma(_418, fma(_434, _443, _442), _446) + 9.9999997473787516355514526367188e-06;
    precise float _449 = 0.5 / _448;
    precise float _450 = _442 * _442;
    precise float _453 = fma(fma(_421, _450, -_421), _421, 1.0);
    precise float _454 = _450 * 0.3183098733425140380859375;
    precise float _456 = _454 / fma(_453, _453, 1.0000000116860974230803549289703e-07);
    precise float _457 = _456 * _449;
    precise float _458 = _457 * 3.1415927410125732421875;
    precise float _459 = _418 * _440;
    precise float _460 = _418 * _458;
    vec3 _462 = vec3(_385, _386, _387);
    precise float _466 = ((dp3_f32(_462, _462) == 0.0) ? 0.0 : 1.0) * spvNMax(_460, 0.0);
    precise float _467 = _459 * _360;
    precise float _468 = _459 * _361;
    precise float _469 = _459 * _362;
    precise float _470 = _360 * _466;
    precise float _471 = _361 * _466;
    precise float _472 = _362 * _466;
    precise float _473 = 1.0 - _423;
    precise float _474 = _473 * _473;
    precise float _475 = _474 * _474;
    precise float _476 = _473 * _475;
    precise float _477 = 1.0 - _385;
    precise float _478 = 1.0 - _386;
    precise float _479 = 1.0 - _387;
    precise float _483 = _470 * fma(_477, _476, _385);
    precise float _484 = _471 * fma(_478, _476, _386);
    precise float _485 = _472 * fma(_479, _476, _387);
    SV_Target.x = fma(_393, _467, _483);
    SV_Target.y = fma(_394, _468, _484);
    SV_Target.z = fma(_395, _469, _485);
}

