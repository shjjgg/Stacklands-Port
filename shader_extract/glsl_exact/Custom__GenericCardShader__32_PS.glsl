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
    vec2 _m16;
    uvec2 _m17;
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
layout(set = 0, binding = 8) uniform textureCube t1;
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
    precise float _117 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _117));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _106 = a.x * b.x;
    return fma(a.y, b.y, _106);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _88 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _88)));
}

void main()
{
    precise float _141 = cb2._m0.x - TEXCOORD2.x;
    precise float _142 = cb2._m0.y - TEXCOORD2.y;
    precise float _143 = cb2._m0.z - TEXCOORD2.z;
    vec3 _144 = vec3(_141, _142, _143);
    precise float _146 = inversesqrt(dp3_f32(_144, _144));
    precise float _147 = _146 * _141;
    precise float _148 = _146 * _142;
    precise float _149 = _146 * _143;
    precise float _156 = cb1._m4.x - TEXCOORD2.x;
    precise float _157 = cb1._m4.y - TEXCOORD2.y;
    precise float _158 = cb1._m4.z - TEXCOORD2.z;
    vec3 _159 = vec3(_156, _157, _158);
    precise float _161 = inversesqrt(dp3_f32(_159, _159));
    precise float _162 = _161 * _156;
    precise float _163 = _161 * _157;
    precise float _164 = _161 * _158;
    precise float _167 = TEXCOORD.y - 0.5;
    precise float _168 = _167 * 0.3333333432674407958984375;
    precise float _169 = _167 * 150.0;
    precise float _174 = abs(dFdx(_168)) + abs(dFdy(_168));
    precise float _177 = sin(roundEven(_169)) * 43758.546875;
    precise float _179 = fract(_177) - 0.5;
    precise float _182 = fma(_179, 0.004999999888241291046142578125, TEXCOORD.x);
    precise float _183 = _182 * 150.0;
    precise float _186 = sin(roundEven(_183)) * 43758.546875;
    precise float _188 = fract(_186) - 0.5;
    precise float _199 = cb0._m16.x - cb0._m18.x;
    precise float _200 = cb0._m16.y - cb0._m18.x;
    precise float _203 = abs(_182) - _199;
    precise float _204 = abs(fma(_188, 0.00166666670702397823333740234375, _168)) - _200;
    vec2 _207 = vec2(spvNMax(_203, 0.0), spvNMax(_204, 0.0));
    precise float _210 = sqrt(dp2_f32(_207, _207)) / _174;
    precise float _211 = spvNMin(_210, 1.0);
    precise float _220 = fma(_211, -cb0._m14.x, cb0._m14.x);
    precise float _221 = fma(_211, -cb0._m14.y, cb0._m14.y);
    precise float _222 = fma(_211, -cb0._m14.z, cb0._m14.z);
    precise float _228 = TEXCOORD2.y * cb0._m7.x;
    precise float _229 = TEXCOORD2.y * cb0._m7.y;
    precise float _230 = TEXCOORD2.y * cb0._m7.z;
    precise float _252 = fma(cb0._m9.x, TEXCOORD2.z, fma(cb0._m5.x, TEXCOORD2.x, _228)) + cb0._m11.x;
    precise float _253 = fma(cb0._m9.y, TEXCOORD2.z, fma(cb0._m5.y, TEXCOORD2.x, _229)) + cb0._m11.y;
    precise float _254 = fma(cb0._m9.z, TEXCOORD2.z, fma(cb0._m5.z, TEXCOORD2.x, _230)) + cb0._m11.z;
    float _331;
    float _332;
    float _333;
    float _334;
    if (cb3._m0.x == 1.0)
    {
        bool _264 = cb3._m0.y == 1.0;
        precise float _270 = TEXCOORD2.y * cb3._m3.x;
        precise float _271 = TEXCOORD2.y * cb3._m3.y;
        precise float _272 = TEXCOORD2.y * cb3._m3.z;
        precise float _294 = fma(cb3._m5.x, TEXCOORD2.z, fma(cb3._m1.x, TEXCOORD2.x, _270)) + cb3._m7.x;
        precise float _295 = fma(cb3._m5.y, TEXCOORD2.z, fma(cb3._m1.y, TEXCOORD2.x, _271)) + cb3._m7.y;
        precise float _296 = fma(cb3._m5.z, TEXCOORD2.z, fma(cb3._m1.z, TEXCOORD2.x, _272)) + cb3._m7.z;
        precise float _305 = (_264 ? _294 : TEXCOORD2.x) - cb3._m11.x;
        precise float _306 = (_264 ? _295 : TEXCOORD2.y) - cb3._m11.y;
        precise float _307 = (_264 ? _296 : TEXCOORD2.z) - cb3._m11.z;
        precise float _313 = _305 * cb3._m9.x;
        precise float _314 = _306 * cb3._m9.y;
        precise float _315 = _307 * cb3._m9.z;
        vec4 _326 = texture(sampler3D(t2, s0), vec3(spvNMax(fma(_313, 0.25, 0.75), fma(cb3._m0.z, 0.5, 0.75)), _314, _315));
        _331 = _326.w;
        _332 = _326.z;
        _333 = _326.y;
        _334 = _326.x;
    }
    else
    {
        _331 = 1.0;
        _332 = 1.0;
        _333 = 1.0;
        _334 = 1.0;
    }
    vec3 _341 = vec3(_252, _253, _254);
    precise float _356 = texture(samplerCube(t1, s1), _341).w * texture(sampler2D(t0, s2), vec2(dp3_f32(_341, _341))).x;
    precise float _357 = spvNClamp(dp4_f32(vec4(_334, _333, _332, _331), cb2._m47), 0.0, 1.0) * _356;
    precise float _363 = _357 * cb0._m2.x;
    precise float _364 = _357 * cb0._m2.y;
    precise float _365 = _357 * cb0._m2.z;
    vec3 _372 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    precise float _374 = inversesqrt(dp3_f32(_372, _372));
    precise float _375 = _374 * TEXCOORD1.x;
    precise float _376 = _374 * TEXCOORD1.y;
    precise float _377 = _374 * TEXCOORD1.z;
    precise float _378 = _220 - 0.039999999105930328369140625;
    precise float _379 = _221 - 0.039999999105930328369140625;
    precise float _380 = _222 - 0.039999999105930328369140625;
    precise float _383 = fma(cb0._m13.y, _378, 0.039999999105930328369140625);
    precise float _384 = fma(cb0._m13.y, _379, 0.039999999105930328369140625);
    precise float _385 = fma(cb0._m13.y, _380, 0.039999999105930328369140625);
    precise float _387 = fma(-cb0._m13.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _388 = _387 * _220;
    precise float _389 = _387 * _221;
    precise float _390 = _387 * _222;
    precise float _393 = 1.0 - cb0._m13.x;
    precise float _394 = fma(_141, _146, _162);
    precise float _395 = fma(_142, _146, _163);
    precise float _396 = fma(_143, _146, _164);
    vec3 _397 = vec3(_394, _395, _396);
    precise float _400 = inversesqrt(spvNMax(dp3_f32(_397, _397), 0.001000000047497451305389404296875));
    precise float _401 = _400 * _394;
    precise float _402 = _400 * _395;
    precise float _403 = _400 * _396;
    vec3 _404 = vec3(_375, _376, _377);
    vec3 _407 = vec3(_147, _148, _149);
    precise float _409 = spvNClamp(dp3_f32(_404, _407), 0.0, 1.0);
    vec3 _410 = vec3(_401, _402, _403);
    precise float _412 = spvNClamp(dp3_f32(_404, _410), 0.0, 1.0);
    precise float _414 = spvNClamp(dp3_f32(_407, _410), 0.0, 1.0);
    precise float _415 = _414 * _414;
    precise float _419 = dp2_f32(vec2(_415), vec2(_393)) - 0.5;
    precise float _420 = 1.0 - _409;
    precise float _421 = _420 * _420;
    precise float _422 = _421 * _421;
    precise float _423 = _420 * _422;
    precise float _425 = abs(dp3_f32(_404, vec3(_162, _163, _164)));
    precise float _426 = 1.0 - _425;
    precise float _427 = _426 * _426;
    precise float _428 = _427 * _427;
    precise float _429 = _426 * _428;
    precise float _431 = fma(_419, _429, 1.0) * fma(_419, _423, 1.0);
    precise float _432 = _393 * _393;
    precise float _433 = spvNMax(_432, 0.00200000009499490261077880859375);
    precise float _434 = 1.0 - _433;
    precise float _437 = _425 * fma(_409, _434, _433);
    precise float _439 = fma(_409, fma(_425, _434, _433), _437) + 9.9999997473787516355514526367188e-06;
    precise float _440 = 0.5 / _439;
    precise float _441 = _433 * _433;
    precise float _444 = fma(fma(_412, _441, -_412), _412, 1.0);
    precise float _445 = _441 * 0.3183098733425140380859375;
    precise float _447 = _445 / fma(_444, _444, 1.0000000116860974230803549289703e-07);
    precise float _448 = _447 * _440;
    precise float _449 = _448 * 3.1415927410125732421875;
    precise float _450 = _409 * _431;
    precise float _451 = _409 * _449;
    vec3 _453 = vec3(_383, _384, _385);
    precise float _457 = ((dp3_f32(_453, _453) == 0.0) ? 0.0 : 1.0) * spvNMax(_451, 0.0);
    precise float _458 = _450 * _363;
    precise float _459 = _450 * _364;
    precise float _460 = _450 * _365;
    precise float _461 = _363 * _457;
    precise float _462 = _364 * _457;
    precise float _463 = _365 * _457;
    precise float _464 = 1.0 - _414;
    precise float _465 = _464 * _464;
    precise float _466 = _465 * _465;
    precise float _467 = _464 * _466;
    precise float _468 = 1.0 - _383;
    precise float _469 = 1.0 - _384;
    precise float _470 = 1.0 - _385;
    precise float _474 = _461 * fma(_468, _467, _383);
    precise float _475 = _462 * fma(_469, _467, _384);
    precise float _476 = _463 * fma(_470, _467, _385);
    SV_Target.x = fma(_388, _458, _474);
    SV_Target.y = fma(_389, _459, _475);
    SV_Target.z = fma(_390, _460, _476);
    SV_Target.w = 1.0;
}

