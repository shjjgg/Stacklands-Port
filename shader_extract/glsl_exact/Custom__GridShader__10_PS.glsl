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
layout(set = 0, binding = 6) uniform texture2D t0;
layout(set = 0, binding = 7) uniform texture3D t1;

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
    precise float _110 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _110));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _93 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _93)));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _81 = a.x * b.x;
    return fma(a.y, b.y, _81);
}

void main()
{
    precise float _134 = cb2._m0.x - TEXCOORD1.x;
    precise float _135 = cb2._m0.y - TEXCOORD1.y;
    precise float _136 = cb2._m0.z - TEXCOORD1.z;
    vec3 _137 = vec3(_134, _135, _136);
    precise float _139 = inversesqrt(dp3_f32(_137, _137));
    precise float _140 = _139 * _134;
    precise float _141 = _139 * _135;
    precise float _142 = _139 * _136;
    precise float _149 = cb1._m4.x - TEXCOORD1.x;
    precise float _150 = cb1._m4.y - TEXCOORD1.y;
    precise float _151 = cb1._m4.z - TEXCOORD1.z;
    vec3 _152 = vec3(_149, _150, _151);
    precise float _154 = inversesqrt(dp3_f32(_152, _152));
    precise float _155 = _154 * _149;
    precise float _156 = _154 * _150;
    precise float _157 = _154 * _151;
    precise float _164 = TEXCOORD1.x / cb0._m17.x;
    precise float _165 = TEXCOORD1.z / cb0._m17.y;
    precise float _168 = fract(_164) + 0.5;
    precise float _169 = fract(_165) + 0.5;
    precise float _173 = fract(_168);
    precise float _174 = fract(_169);
    float _177 = (_168 >= 0.0) ? _173 : (-_173);
    float _178 = (_169 >= 0.0) ? _174 : (-_174);
    precise float _182 = cb0._m16 - 0.00999999977648258209228515625;
    precise float _183 = _177 - _182;
    precise float _184 = _178 - _182;
    precise float _185 = _183 * 50.0;
    precise float _186 = _184 * 50.0;
    precise float _187 = spvNClamp(_185, 0.0, 1.0);
    precise float _188 = spvNClamp(_186, 0.0, 1.0);
    precise float _191 = _187 * _187;
    precise float _192 = _188 * _188;
    precise float _193 = _191 * fma(_187, -2.0, 3.0);
    precise float _194 = _192 * fma(_188, -2.0, 3.0);
    precise float _195 = _194 * _193;
    precise float _196 = _182 + _177;
    precise float _197 = _182 + _178;
    precise float _198 = 1.0 - _196;
    precise float _199 = 1.0 - _197;
    precise float _200 = _198 * 50.0;
    precise float _201 = _199 * 50.0;
    precise float _202 = spvNClamp(_200, 0.0, 1.0);
    precise float _203 = spvNClamp(_201, 0.0, 1.0);
    precise float _206 = _202 * _202;
    precise float _207 = _203 * _203;
    precise float _208 = _206 * fma(_202, -2.0, 3.0);
    precise float _209 = _207 * fma(_203, -2.0, 3.0);
    precise float _210 = _195 * _208;
    precise float _215 = fma(-_210, _209, 1.0) * cb0._m18;
    precise float _216 = _215 * 0.5;
    precise float _222 = TEXCOORD1.y * cb0._m7.x;
    precise float _223 = TEXCOORD1.y * cb0._m7.y;
    precise float _224 = TEXCOORD1.y * cb0._m7.z;
    precise float _246 = fma(cb0._m9.x, TEXCOORD1.z, fma(cb0._m5.x, TEXCOORD1.x, _222)) + cb0._m11.x;
    precise float _247 = fma(cb0._m9.y, TEXCOORD1.z, fma(cb0._m5.y, TEXCOORD1.x, _223)) + cb0._m11.y;
    precise float _248 = fma(cb0._m9.z, TEXCOORD1.z, fma(cb0._m5.z, TEXCOORD1.x, _224)) + cb0._m11.z;
    float _324;
    float _325;
    float _326;
    float _327;
    if (cb3._m0.x == 1.0)
    {
        bool _257 = cb3._m0.y == 1.0;
        precise float _263 = TEXCOORD1.y * cb3._m3.x;
        precise float _264 = TEXCOORD1.y * cb3._m3.y;
        precise float _265 = TEXCOORD1.y * cb3._m3.z;
        precise float _287 = fma(cb3._m5.x, TEXCOORD1.z, fma(cb3._m1.x, TEXCOORD1.x, _263)) + cb3._m7.x;
        precise float _288 = fma(cb3._m5.y, TEXCOORD1.z, fma(cb3._m1.y, TEXCOORD1.x, _264)) + cb3._m7.y;
        precise float _289 = fma(cb3._m5.z, TEXCOORD1.z, fma(cb3._m1.z, TEXCOORD1.x, _265)) + cb3._m7.z;
        precise float _298 = (_257 ? _287 : TEXCOORD1.x) - cb3._m11.x;
        precise float _299 = (_257 ? _288 : TEXCOORD1.y) - cb3._m11.y;
        precise float _300 = (_257 ? _289 : TEXCOORD1.z) - cb3._m11.z;
        precise float _306 = _298 * cb3._m9.x;
        precise float _307 = _299 * cb3._m9.y;
        precise float _308 = _300 * cb3._m9.z;
        vec4 _319 = texture(sampler3D(t1, s0), vec3(spvNMax(fma(_306, 0.25, 0.75), fma(cb3._m0.z, 0.5, 0.75)), _307, _308));
        _324 = _319.w;
        _325 = _319.z;
        _326 = _319.y;
        _327 = _319.x;
    }
    else
    {
        _324 = 1.0;
        _325 = 1.0;
        _326 = 1.0;
        _327 = 1.0;
    }
    vec3 _334 = vec3(_246, _247, _248);
    precise float _343 = spvNClamp(dp4_f32(vec4(_327, _326, _325, _324), cb2._m47), 0.0, 1.0) * texture(sampler2D(t0, s1), vec2(dp3_f32(_334, _334))).x;
    precise float _349 = _343 * cb0._m2.x;
    precise float _350 = _343 * cb0._m2.y;
    precise float _351 = _343 * cb0._m2.z;
    vec3 _358 = vec3(TEXCOORD.x, TEXCOORD.y, TEXCOORD.z);
    precise float _360 = inversesqrt(dp3_f32(_358, _358));
    precise float _361 = _360 * TEXCOORD.x;
    precise float _362 = _360 * TEXCOORD.y;
    precise float _363 = _360 * TEXCOORD.z;
    precise float _369 = cb0._m14.x - 0.039999999105930328369140625;
    precise float _370 = cb0._m14.y - 0.039999999105930328369140625;
    precise float _371 = cb0._m14.z - 0.039999999105930328369140625;
    precise float _374 = fma(cb0._m13.y, _369, 0.039999999105930328369140625);
    precise float _375 = fma(cb0._m13.y, _370, 0.039999999105930328369140625);
    precise float _376 = fma(cb0._m13.y, _371, 0.039999999105930328369140625);
    precise float _378 = fma(-cb0._m13.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _379 = _378 * cb0._m14.x;
    precise float _380 = _378 * cb0._m14.y;
    precise float _381 = _378 * cb0._m14.z;
    precise float _382 = _216 * _379;
    precise float _383 = _216 * _380;
    precise float _384 = _216 * _381;
    precise float _385 = 1.0 - _378;
    SV_Target.w = fma(_216, _378, _385);
    precise float _391 = 1.0 - cb0._m13.x;
    precise float _392 = fma(_134, _139, _155);
    precise float _393 = fma(_135, _139, _156);
    precise float _394 = fma(_136, _139, _157);
    vec3 _395 = vec3(_392, _393, _394);
    precise float _398 = inversesqrt(spvNMax(dp3_f32(_395, _395), 0.001000000047497451305389404296875));
    precise float _399 = _398 * _392;
    precise float _400 = _398 * _393;
    precise float _401 = _398 * _394;
    vec3 _402 = vec3(_361, _362, _363);
    vec3 _405 = vec3(_140, _141, _142);
    precise float _407 = spvNClamp(dp3_f32(_402, _405), 0.0, 1.0);
    vec3 _408 = vec3(_399, _400, _401);
    precise float _410 = spvNClamp(dp3_f32(_402, _408), 0.0, 1.0);
    precise float _412 = spvNClamp(dp3_f32(_405, _408), 0.0, 1.0);
    precise float _413 = _412 * _412;
    precise float _417 = dp2_f32(vec2(_413), vec2(_391)) - 0.5;
    precise float _418 = 1.0 - _407;
    precise float _419 = _418 * _418;
    precise float _420 = _419 * _419;
    precise float _421 = _418 * _420;
    precise float _423 = abs(dp3_f32(_402, vec3(_155, _156, _157)));
    precise float _424 = 1.0 - _423;
    precise float _425 = _424 * _424;
    precise float _426 = _425 * _425;
    precise float _427 = _424 * _426;
    precise float _429 = fma(_417, _427, 1.0) * fma(_417, _421, 1.0);
    precise float _430 = _391 * _391;
    precise float _431 = spvNMax(_430, 0.00200000009499490261077880859375);
    precise float _432 = 1.0 - _431;
    precise float _435 = _423 * fma(_407, _432, _431);
    precise float _437 = fma(_407, fma(_423, _432, _431), _435) + 9.9999997473787516355514526367188e-06;
    precise float _438 = 0.5 / _437;
    precise float _439 = _431 * _431;
    precise float _442 = fma(fma(_410, _439, -_410), _410, 1.0);
    precise float _443 = _439 * 0.3183098733425140380859375;
    precise float _445 = _443 / fma(_442, _442, 1.0000000116860974230803549289703e-07);
    precise float _446 = _445 * _438;
    precise float _447 = _446 * 3.1415927410125732421875;
    precise float _448 = _407 * _429;
    precise float _449 = _407 * _447;
    vec3 _451 = vec3(_374, _375, _376);
    precise float _455 = ((dp3_f32(_451, _451) == 0.0) ? 0.0 : 1.0) * spvNMax(_449, 0.0);
    precise float _456 = _448 * _349;
    precise float _457 = _448 * _350;
    precise float _458 = _448 * _351;
    precise float _459 = _349 * _455;
    precise float _460 = _350 * _455;
    precise float _461 = _351 * _455;
    precise float _462 = 1.0 - _412;
    precise float _463 = _462 * _462;
    precise float _464 = _463 * _463;
    precise float _465 = _462 * _464;
    precise float _466 = 1.0 - _374;
    precise float _467 = 1.0 - _375;
    precise float _468 = 1.0 - _376;
    precise float _472 = _459 * fma(_466, _465, _374);
    precise float _473 = _460 * fma(_467, _465, _375);
    precise float _474 = _461 * fma(_468, _465, _376);
    SV_Target.x = fma(_382, _456, _472);
    SV_Target.y = fma(_383, _457, _473);
    SV_Target.z = fma(_384, _458, _474);
}

