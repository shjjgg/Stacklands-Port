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
layout(set = 0, binding = 6) uniform texture2D t0;
layout(set = 0, binding = 7) uniform texture3D t1;

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
    precise float _113 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _113));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _102 = a.x * b.x;
    return fma(a.y, b.y, _102);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _84 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _84)));
}

void main()
{
    precise float _137 = cb1._m4.x - TEXCOORD2.x;
    precise float _138 = cb1._m4.y - TEXCOORD2.y;
    precise float _139 = cb1._m4.z - TEXCOORD2.z;
    vec3 _140 = vec3(_137, _138, _139);
    precise float _142 = inversesqrt(dp3_f32(_140, _140));
    precise float _143 = _142 * _137;
    precise float _144 = _142 * _138;
    precise float _145 = _142 * _139;
    precise float _148 = TEXCOORD.y - 0.5;
    precise float _149 = _148 * 0.3333333432674407958984375;
    precise float _150 = _148 * 150.0;
    precise float _155 = abs(dFdx(_149)) + abs(dFdy(_149));
    precise float _158 = sin(roundEven(_150)) * 43758.546875;
    precise float _160 = fract(_158) - 0.5;
    precise float _163 = fma(_160, 0.004999999888241291046142578125, TEXCOORD.x);
    precise float _164 = _163 * 150.0;
    precise float _167 = sin(roundEven(_164)) * 43758.546875;
    precise float _169 = fract(_167) - 0.5;
    precise float _180 = cb0._m16.x - cb0._m18.x;
    precise float _181 = cb0._m16.y - cb0._m18.x;
    precise float _184 = abs(_163) - _180;
    precise float _185 = abs(fma(_169, 0.00166666670702397823333740234375, _149)) - _181;
    vec2 _188 = vec2(spvNMax(_184, 0.0), spvNMax(_185, 0.0));
    precise float _191 = sqrt(dp2_f32(_188, _188)) / _155;
    precise float _192 = spvNMin(_191, 1.0);
    precise float _201 = fma(_192, -cb0._m14.x, cb0._m14.x);
    precise float _202 = fma(_192, -cb0._m14.y, cb0._m14.y);
    precise float _203 = fma(_192, -cb0._m14.z, cb0._m14.z);
    precise float _208 = TEXCOORD2.y * cb0._m7.x;
    precise float _209 = TEXCOORD2.y * cb0._m7.y;
    precise float _226 = fma(cb0._m9.x, TEXCOORD2.z, fma(cb0._m5.x, TEXCOORD2.x, _208)) + cb0._m11.x;
    precise float _227 = fma(cb0._m9.y, TEXCOORD2.z, fma(cb0._m5.y, TEXCOORD2.x, _209)) + cb0._m11.y;
    float _304;
    float _305;
    float _306;
    float _307;
    if (cb3._m0.x == 1.0)
    {
        bool _237 = cb3._m0.y == 1.0;
        precise float _243 = TEXCOORD2.y * cb3._m3.x;
        precise float _244 = TEXCOORD2.y * cb3._m3.y;
        precise float _245 = TEXCOORD2.y * cb3._m3.z;
        precise float _267 = fma(cb3._m5.x, TEXCOORD2.z, fma(cb3._m1.x, TEXCOORD2.x, _243)) + cb3._m7.x;
        precise float _268 = fma(cb3._m5.y, TEXCOORD2.z, fma(cb3._m1.y, TEXCOORD2.x, _244)) + cb3._m7.y;
        precise float _269 = fma(cb3._m5.z, TEXCOORD2.z, fma(cb3._m1.z, TEXCOORD2.x, _245)) + cb3._m7.z;
        precise float _278 = (_237 ? _267 : TEXCOORD2.x) - cb3._m11.x;
        precise float _279 = (_237 ? _268 : TEXCOORD2.y) - cb3._m11.y;
        precise float _280 = (_237 ? _269 : TEXCOORD2.z) - cb3._m11.z;
        precise float _286 = _278 * cb3._m9.x;
        precise float _287 = _279 * cb3._m9.y;
        precise float _288 = _280 * cb3._m9.z;
        vec4 _299 = texture(sampler3D(t1, s0), vec3(spvNMax(fma(_286, 0.25, 0.75), fma(cb3._m0.z, 0.5, 0.75)), _287, _288));
        _304 = _299.w;
        _305 = _299.z;
        _306 = _299.y;
        _307 = _299.x;
    }
    else
    {
        _304 = 1.0;
        _305 = 1.0;
        _306 = 1.0;
        _307 = 1.0;
    }
    precise float _322 = spvNClamp(dp4_f32(vec4(_307, _306, _305, _304), cb2._m47), 0.0, 1.0) * texture(sampler2D(t0, s1), vec2(_226, _227)).w;
    precise float _328 = _322 * cb0._m2.x;
    precise float _329 = _322 * cb0._m2.y;
    precise float _330 = _322 * cb0._m2.z;
    vec3 _337 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    precise float _339 = inversesqrt(dp3_f32(_337, _337));
    precise float _340 = _339 * TEXCOORD1.x;
    precise float _341 = _339 * TEXCOORD1.y;
    precise float _342 = _339 * TEXCOORD1.z;
    precise float _343 = _201 - 0.039999999105930328369140625;
    precise float _344 = _202 - 0.039999999105930328369140625;
    precise float _345 = _203 - 0.039999999105930328369140625;
    precise float _348 = fma(cb0._m13.y, _343, 0.039999999105930328369140625);
    precise float _349 = fma(cb0._m13.y, _344, 0.039999999105930328369140625);
    precise float _350 = fma(cb0._m13.y, _345, 0.039999999105930328369140625);
    precise float _352 = fma(-cb0._m13.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _353 = _352 * _201;
    precise float _354 = _352 * _202;
    precise float _355 = _352 * _203;
    precise float _358 = 1.0 - cb0._m13.x;
    precise float _364 = fma(_137, _142, cb2._m0.x);
    precise float _365 = fma(_138, _142, cb2._m0.y);
    precise float _366 = fma(_139, _142, cb2._m0.z);
    vec3 _367 = vec3(_364, _365, _366);
    precise float _370 = inversesqrt(spvNMax(dp3_f32(_367, _367), 0.001000000047497451305389404296875));
    precise float _371 = _370 * _364;
    precise float _372 = _370 * _365;
    precise float _373 = _370 * _366;
    vec3 _374 = vec3(_340, _341, _342);
    precise float _378 = spvNClamp(dp3_f32(_374, cb2._m0), 0.0, 1.0);
    vec3 _379 = vec3(_371, _372, _373);
    precise float _381 = spvNClamp(dp3_f32(_374, _379), 0.0, 1.0);
    precise float _383 = spvNClamp(dp3_f32(cb2._m0, _379), 0.0, 1.0);
    precise float _384 = _383 * _383;
    precise float _388 = dp2_f32(vec2(_384), vec2(_358)) - 0.5;
    precise float _389 = 1.0 - _378;
    precise float _390 = _389 * _389;
    precise float _391 = _390 * _390;
    precise float _392 = _389 * _391;
    precise float _394 = abs(dp3_f32(_374, vec3(_143, _144, _145)));
    precise float _395 = 1.0 - _394;
    precise float _396 = _395 * _395;
    precise float _397 = _396 * _396;
    precise float _398 = _395 * _397;
    precise float _400 = fma(_388, _398, 1.0) * fma(_388, _392, 1.0);
    precise float _401 = _358 * _358;
    precise float _402 = spvNMax(_401, 0.00200000009499490261077880859375);
    precise float _403 = 1.0 - _402;
    precise float _406 = _394 * fma(_378, _403, _402);
    precise float _408 = fma(_378, fma(_394, _403, _402), _406) + 9.9999997473787516355514526367188e-06;
    precise float _409 = 0.5 / _408;
    precise float _410 = _402 * _402;
    precise float _413 = fma(fma(_381, _410, -_381), _381, 1.0);
    precise float _414 = _410 * 0.3183098733425140380859375;
    precise float _416 = _414 / fma(_413, _413, 1.0000000116860974230803549289703e-07);
    precise float _417 = _416 * _409;
    precise float _418 = _417 * 3.1415927410125732421875;
    precise float _419 = _378 * _400;
    precise float _420 = _378 * _418;
    vec3 _422 = vec3(_348, _349, _350);
    precise float _426 = ((dp3_f32(_422, _422) == 0.0) ? 0.0 : 1.0) * spvNMax(_420, 0.0);
    precise float _427 = _419 * _328;
    precise float _428 = _419 * _329;
    precise float _429 = _419 * _330;
    precise float _430 = _328 * _426;
    precise float _431 = _329 * _426;
    precise float _432 = _330 * _426;
    precise float _433 = 1.0 - _383;
    precise float _434 = _433 * _433;
    precise float _435 = _434 * _434;
    precise float _436 = _433 * _435;
    precise float _437 = 1.0 - _348;
    precise float _438 = 1.0 - _349;
    precise float _439 = 1.0 - _350;
    precise float _443 = _430 * fma(_437, _436, _348);
    precise float _444 = _431 * fma(_438, _436, _349);
    precise float _445 = _432 * fma(_439, _436, _350);
    SV_Target.x = fma(_353, _427, _443);
    SV_Target.y = fma(_354, _428, _444);
    SV_Target.z = fma(_355, _429, _445);
    SV_Target.w = 1.0;
}

