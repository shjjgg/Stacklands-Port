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
    vec3 _m10;
    uint _m11;
    vec3 _m12;
    uint _m13;
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
layout(set = 0, binding = 5) uniform texture3D t0;

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
    precise float _116 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _116));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _99 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _99)));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _87 = a.x * b.x;
    return fma(a.y, b.y, _87);
}

void main()
{
    precise float _140 = cb1._m4.x - TEXCOORD2.x;
    precise float _141 = cb1._m4.y - TEXCOORD2.y;
    precise float _142 = cb1._m4.z - TEXCOORD2.z;
    vec3 _143 = vec3(_140, _141, _142);
    precise float _145 = inversesqrt(dp3_f32(_143, _143));
    precise float _146 = _145 * _140;
    precise float _147 = _145 * _141;
    precise float _148 = _145 * _142;
    precise float _151 = TEXCOORD.y * 150.0;
    precise float _154 = sin(roundEven(_151)) * 43758.546875;
    precise float _156 = fract(_154) - 0.5;
    precise float _159 = fma(_156, 0.00999999977648258209228515625, TEXCOORD.x);
    precise float _160 = _159 * 150.0;
    precise float _163 = sin(roundEven(_160)) * 43758.546875;
    precise float _165 = fract(_163) - 0.5;
    precise float _166 = fma(_165, 0.0500000007450580596923828125, TEXCOORD.y);
    precise float _175 = abs(dFdx(_159)) + abs(dFdy(_159));
    precise float _176 = abs(dFdx(_166)) + abs(dFdy(_166));
    precise float _177 = _176 * 0.2666666805744171142578125;
    precise float _178 = _166 - 0.5;
    precise float _179 = _159 - 0.02999999932944774627685546875;
    precise float _181 = fma(-_179, 1.06382977962493896484375, 1.0);
    precise float _182 = _179 / _175;
    precise float _184 = 0.9700000286102294921875 - _159;
    precise float _185 = _184 / _175;
    precise float _187 = spvNClamp(_185, 0.0, 1.0) * spvNClamp(_182, 0.0, 1.0);
    precise float _190 = fma(_178, 0.2666666805744171142578125, 0.069999992847442626953125) / _177;
    precise float _192 = _187 * spvNClamp(_190, 0.0, 1.0);
    precise float _193 = 0.569999992847442626953125 - fma(_178, 0.2666666805744171142578125, 0.5);
    precise float _194 = _193 / _177;
    precise float _196 = _192 * spvNClamp(_194, 0.0, 1.0);
    precise float _208 = cb0._m8.x - cb0._m6.x;
    precise float _209 = cb0._m8.y - cb0._m6.y;
    precise float _210 = cb0._m8.z - cb0._m6.z;
    precise float _211 = fma(_196, _208, cb0._m6.x);
    precise float _212 = fma(_196, _209, cb0._m6.y);
    precise float _213 = fma(_196, _210, cb0._m6.z);
    float _219 = float(cb0._m14.x >= 0.5);
    precise float _230 = cb0._m12.x - cb0._m10.x;
    precise float _231 = cb0._m12.y - cb0._m10.y;
    precise float _232 = cb0._m12.z - cb0._m10.z;
    precise float _238 = _181 - cb0._m14.y;
    precise float _243 = abs(dFdy(_181)) + abs(dFdx(_181));
    precise float _244 = _238 / _243;
    float _247 = (_196 <= 0.0) ? 0.0 : spvNClamp(_244, 0.0, 1.0);
    precise float _248 = fma(_219, _230, cb0._m10.x) - _211;
    precise float _249 = fma(_219, _231, cb0._m10.y) - _212;
    precise float _250 = fma(_219, _232, cb0._m10.z) - _213;
    precise float _251 = fma(_247, _248, _211);
    precise float _252 = fma(_247, _249, _212);
    precise float _253 = fma(_247, _250, _213);
    float _329;
    float _330;
    float _331;
    float _332;
    if (cb3._m0.x == 1.0)
    {
        bool _262 = cb3._m0.y == 1.0;
        precise float _268 = TEXCOORD2.y * cb3._m3.x;
        precise float _269 = TEXCOORD2.y * cb3._m3.y;
        precise float _270 = TEXCOORD2.y * cb3._m3.z;
        precise float _292 = fma(cb3._m5.x, TEXCOORD2.z, fma(cb3._m1.x, TEXCOORD2.x, _268)) + cb3._m7.x;
        precise float _293 = fma(cb3._m5.y, TEXCOORD2.z, fma(cb3._m1.y, TEXCOORD2.x, _269)) + cb3._m7.y;
        precise float _294 = fma(cb3._m5.z, TEXCOORD2.z, fma(cb3._m1.z, TEXCOORD2.x, _270)) + cb3._m7.z;
        precise float _303 = (_262 ? _292 : TEXCOORD2.x) - cb3._m11.x;
        precise float _304 = (_262 ? _293 : TEXCOORD2.y) - cb3._m11.y;
        precise float _305 = (_262 ? _294 : TEXCOORD2.z) - cb3._m11.z;
        precise float _311 = _303 * cb3._m9.x;
        precise float _312 = _304 * cb3._m9.y;
        precise float _313 = _305 * cb3._m9.z;
        vec4 _324 = texture(sampler3D(t0, s0), vec3(spvNMax(fma(_311, 0.25, 0.75), fma(cb3._m0.z, 0.5, 0.75)), _312, _313));
        _329 = _324.w;
        _330 = _324.z;
        _331 = _324.y;
        _332 = _324.x;
    }
    else
    {
        _329 = 1.0;
        _330 = 1.0;
        _331 = 1.0;
        _332 = 1.0;
    }
    precise float _339 = spvNClamp(dp4_f32(vec4(_332, _331, _330, _329), cb2._m47), 0.0, 1.0);
    precise float _345 = _339 * cb0._m2.x;
    precise float _346 = _339 * cb0._m2.y;
    precise float _347 = _339 * cb0._m2.z;
    vec3 _354 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    precise float _356 = inversesqrt(dp3_f32(_354, _354));
    precise float _357 = _356 * TEXCOORD1.x;
    precise float _358 = _356 * TEXCOORD1.y;
    precise float _359 = _356 * TEXCOORD1.z;
    precise float _360 = _251 - 0.039999999105930328369140625;
    precise float _361 = _252 - 0.039999999105930328369140625;
    precise float _362 = _253 - 0.039999999105930328369140625;
    precise float _365 = fma(cb0._m5.y, _360, 0.039999999105930328369140625);
    precise float _366 = fma(cb0._m5.y, _361, 0.039999999105930328369140625);
    precise float _367 = fma(cb0._m5.y, _362, 0.039999999105930328369140625);
    precise float _369 = fma(-cb0._m5.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _370 = _369 * _251;
    precise float _371 = _369 * _252;
    precise float _372 = _369 * _253;
    precise float _375 = 1.0 - cb0._m5.x;
    precise float _381 = fma(_140, _145, cb2._m0.x);
    precise float _382 = fma(_141, _145, cb2._m0.y);
    precise float _383 = fma(_142, _145, cb2._m0.z);
    vec3 _384 = vec3(_381, _382, _383);
    precise float _387 = inversesqrt(spvNMax(dp3_f32(_384, _384), 0.001000000047497451305389404296875));
    precise float _388 = _387 * _381;
    precise float _389 = _387 * _382;
    precise float _390 = _387 * _383;
    vec3 _391 = vec3(_357, _358, _359);
    precise float _395 = spvNClamp(dp3_f32(_391, cb2._m0), 0.0, 1.0);
    vec3 _396 = vec3(_388, _389, _390);
    precise float _398 = spvNClamp(dp3_f32(_391, _396), 0.0, 1.0);
    precise float _400 = spvNClamp(dp3_f32(cb2._m0, _396), 0.0, 1.0);
    precise float _401 = _400 * _400;
    precise float _405 = dp2_f32(vec2(_401), vec2(_375)) - 0.5;
    precise float _406 = 1.0 - _395;
    precise float _407 = _406 * _406;
    precise float _408 = _407 * _407;
    precise float _409 = _406 * _408;
    precise float _411 = abs(dp3_f32(_391, vec3(_146, _147, _148)));
    precise float _412 = 1.0 - _411;
    precise float _413 = _412 * _412;
    precise float _414 = _413 * _413;
    precise float _415 = _412 * _414;
    precise float _417 = fma(_405, _415, 1.0) * fma(_405, _409, 1.0);
    precise float _418 = _375 * _375;
    precise float _419 = spvNMax(_418, 0.00200000009499490261077880859375);
    precise float _420 = 1.0 - _419;
    precise float _423 = _411 * fma(_395, _420, _419);
    precise float _425 = fma(_395, fma(_411, _420, _419), _423) + 9.9999997473787516355514526367188e-06;
    precise float _426 = 0.5 / _425;
    precise float _427 = _419 * _419;
    precise float _430 = fma(fma(_398, _427, -_398), _398, 1.0);
    precise float _431 = _427 * 0.3183098733425140380859375;
    precise float _433 = _431 / fma(_430, _430, 1.0000000116860974230803549289703e-07);
    precise float _434 = _433 * _426;
    precise float _435 = _434 * 3.1415927410125732421875;
    precise float _436 = _395 * _417;
    precise float _437 = _395 * _435;
    vec3 _439 = vec3(_365, _366, _367);
    precise float _443 = ((dp3_f32(_439, _439) == 0.0) ? 0.0 : 1.0) * spvNMax(_437, 0.0);
    precise float _444 = _436 * _345;
    precise float _445 = _436 * _346;
    precise float _446 = _436 * _347;
    precise float _447 = _345 * _443;
    precise float _448 = _346 * _443;
    precise float _449 = _347 * _443;
    precise float _450 = 1.0 - _400;
    precise float _451 = _450 * _450;
    precise float _452 = _451 * _451;
    precise float _453 = _450 * _452;
    precise float _454 = 1.0 - _365;
    precise float _455 = 1.0 - _366;
    precise float _456 = 1.0 - _367;
    precise float _460 = _447 * fma(_454, _453, _365);
    precise float _461 = _448 * fma(_455, _453, _366);
    precise float _462 = _449 * fma(_456, _453, _367);
    SV_Target.x = fma(_370, _444, _460);
    SV_Target.y = fma(_371, _445, _461);
    SV_Target.z = fma(_372, _446, _462);
    SV_Target.w = 1.0;
}

