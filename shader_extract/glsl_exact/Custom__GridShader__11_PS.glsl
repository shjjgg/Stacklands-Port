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
    vec3 _m6;
    uint _m7;
    float _m8;
    vec2 _m9;
    float _m10;
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
    precise float _104 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _104));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _87 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _87)));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _75 = a.x * b.x;
    return fma(a.y, b.y, _75);
}

void main()
{
    precise float _128 = cb1._m4.x - TEXCOORD1.x;
    precise float _129 = cb1._m4.y - TEXCOORD1.y;
    precise float _130 = cb1._m4.z - TEXCOORD1.z;
    vec3 _131 = vec3(_128, _129, _130);
    precise float _133 = inversesqrt(dp3_f32(_131, _131));
    precise float _134 = _133 * _128;
    precise float _135 = _133 * _129;
    precise float _136 = _133 * _130;
    precise float _143 = TEXCOORD1.x / cb0._m9.x;
    precise float _144 = TEXCOORD1.z / cb0._m9.y;
    precise float _147 = fract(_143) + 0.5;
    precise float _148 = fract(_144) + 0.5;
    precise float _152 = fract(_147);
    precise float _153 = fract(_148);
    float _156 = (_147 >= 0.0) ? _152 : (-_152);
    float _157 = (_148 >= 0.0) ? _153 : (-_153);
    precise float _161 = cb0._m8 - 0.00999999977648258209228515625;
    precise float _162 = _156 - _161;
    precise float _163 = _157 - _161;
    precise float _164 = _162 * 50.0;
    precise float _165 = _163 * 50.0;
    precise float _166 = spvNClamp(_164, 0.0, 1.0);
    precise float _167 = spvNClamp(_165, 0.0, 1.0);
    precise float _170 = _166 * _166;
    precise float _171 = _167 * _167;
    precise float _172 = _170 * fma(_166, -2.0, 3.0);
    precise float _173 = _171 * fma(_167, -2.0, 3.0);
    precise float _174 = _173 * _172;
    precise float _175 = _161 + _156;
    precise float _176 = _161 + _157;
    precise float _177 = 1.0 - _175;
    precise float _178 = 1.0 - _176;
    precise float _179 = _177 * 50.0;
    precise float _180 = _178 * 50.0;
    precise float _181 = spvNClamp(_179, 0.0, 1.0);
    precise float _182 = spvNClamp(_180, 0.0, 1.0);
    precise float _185 = _181 * _181;
    precise float _186 = _182 * _182;
    precise float _187 = _185 * fma(_181, -2.0, 3.0);
    precise float _188 = _186 * fma(_182, -2.0, 3.0);
    precise float _189 = _187 * _174;
    precise float _194 = fma(-_189, _188, 1.0) * cb0._m10;
    precise float _195 = _194 * 0.5;
    float _271;
    float _272;
    float _273;
    float _274;
    if (cb3._m0.x == 1.0)
    {
        bool _204 = cb3._m0.y == 1.0;
        precise float _210 = TEXCOORD1.y * cb3._m3.x;
        precise float _211 = TEXCOORD1.y * cb3._m3.y;
        precise float _212 = TEXCOORD1.y * cb3._m3.z;
        precise float _234 = fma(cb3._m5.x, TEXCOORD1.z, fma(cb3._m1.x, TEXCOORD1.x, _210)) + cb3._m7.x;
        precise float _235 = fma(cb3._m5.y, TEXCOORD1.z, fma(cb3._m1.y, TEXCOORD1.x, _211)) + cb3._m7.y;
        precise float _236 = fma(cb3._m5.z, TEXCOORD1.z, fma(cb3._m1.z, TEXCOORD1.x, _212)) + cb3._m7.z;
        precise float _245 = (_204 ? _234 : TEXCOORD1.x) - cb3._m11.x;
        precise float _246 = (_204 ? _235 : TEXCOORD1.y) - cb3._m11.y;
        precise float _247 = (_204 ? _236 : TEXCOORD1.z) - cb3._m11.z;
        precise float _253 = _245 * cb3._m9.x;
        precise float _254 = _246 * cb3._m9.y;
        precise float _255 = _247 * cb3._m9.z;
        vec4 _266 = texture(sampler3D(t0, s0), vec3(spvNMax(fma(_253, 0.25, 0.75), fma(cb3._m0.z, 0.5, 0.75)), _254, _255));
        _271 = _266.w;
        _272 = _266.z;
        _273 = _266.y;
        _274 = _266.x;
    }
    else
    {
        _271 = 1.0;
        _272 = 1.0;
        _273 = 1.0;
        _274 = 1.0;
    }
    precise float _281 = spvNClamp(dp4_f32(vec4(_274, _273, _272, _271), cb2._m47), 0.0, 1.0);
    precise float _287 = _281 * cb0._m2.x;
    precise float _288 = _281 * cb0._m2.y;
    precise float _289 = _281 * cb0._m2.z;
    vec3 _296 = vec3(TEXCOORD.x, TEXCOORD.y, TEXCOORD.z);
    precise float _298 = inversesqrt(dp3_f32(_296, _296));
    precise float _299 = _298 * TEXCOORD.x;
    precise float _300 = _298 * TEXCOORD.y;
    precise float _301 = _298 * TEXCOORD.z;
    precise float _307 = cb0._m6.x - 0.039999999105930328369140625;
    precise float _308 = cb0._m6.y - 0.039999999105930328369140625;
    precise float _309 = cb0._m6.z - 0.039999999105930328369140625;
    precise float _312 = fma(cb0._m5.y, _307, 0.039999999105930328369140625);
    precise float _313 = fma(cb0._m5.y, _308, 0.039999999105930328369140625);
    precise float _314 = fma(cb0._m5.y, _309, 0.039999999105930328369140625);
    precise float _316 = fma(-cb0._m5.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _317 = _316 * cb0._m6.x;
    precise float _318 = _316 * cb0._m6.y;
    precise float _319 = _316 * cb0._m6.z;
    precise float _320 = _195 * _317;
    precise float _321 = _195 * _318;
    precise float _322 = _195 * _319;
    precise float _323 = 1.0 - _316;
    SV_Target.w = fma(_195, _316, _323);
    precise float _329 = 1.0 - cb0._m5.x;
    precise float _335 = fma(_128, _133, cb2._m0.x);
    precise float _336 = fma(_129, _133, cb2._m0.y);
    precise float _337 = fma(_130, _133, cb2._m0.z);
    vec3 _338 = vec3(_335, _336, _337);
    precise float _341 = inversesqrt(spvNMax(dp3_f32(_338, _338), 0.001000000047497451305389404296875));
    precise float _342 = _341 * _335;
    precise float _343 = _341 * _336;
    precise float _344 = _341 * _337;
    vec3 _345 = vec3(_299, _300, _301);
    precise float _349 = spvNClamp(dp3_f32(_345, cb2._m0), 0.0, 1.0);
    vec3 _350 = vec3(_342, _343, _344);
    precise float _352 = spvNClamp(dp3_f32(_345, _350), 0.0, 1.0);
    precise float _354 = spvNClamp(dp3_f32(cb2._m0, _350), 0.0, 1.0);
    precise float _355 = _354 * _354;
    precise float _359 = dp2_f32(vec2(_355), vec2(_329)) - 0.5;
    precise float _360 = 1.0 - _349;
    precise float _361 = _360 * _360;
    precise float _362 = _361 * _361;
    precise float _363 = _360 * _362;
    precise float _365 = abs(dp3_f32(_345, vec3(_134, _135, _136)));
    precise float _366 = 1.0 - _365;
    precise float _367 = _366 * _366;
    precise float _368 = _367 * _367;
    precise float _369 = _366 * _368;
    precise float _371 = fma(_359, _369, 1.0) * fma(_359, _363, 1.0);
    precise float _372 = _329 * _329;
    precise float _373 = spvNMax(_372, 0.00200000009499490261077880859375);
    precise float _374 = 1.0 - _373;
    precise float _377 = _365 * fma(_349, _374, _373);
    precise float _379 = fma(_349, fma(_365, _374, _373), _377) + 9.9999997473787516355514526367188e-06;
    precise float _380 = 0.5 / _379;
    precise float _381 = _373 * _373;
    precise float _384 = fma(fma(_352, _381, -_352), _352, 1.0);
    precise float _385 = _381 * 0.3183098733425140380859375;
    precise float _387 = _385 / fma(_384, _384, 1.0000000116860974230803549289703e-07);
    precise float _388 = _387 * _380;
    precise float _389 = _388 * 3.1415927410125732421875;
    precise float _390 = _349 * _371;
    precise float _391 = _349 * _389;
    vec3 _393 = vec3(_312, _313, _314);
    precise float _397 = ((dp3_f32(_393, _393) == 0.0) ? 0.0 : 1.0) * spvNMax(_391, 0.0);
    precise float _398 = _390 * _287;
    precise float _399 = _390 * _288;
    precise float _400 = _390 * _289;
    precise float _401 = _287 * _397;
    precise float _402 = _288 * _397;
    precise float _403 = _289 * _397;
    precise float _404 = 1.0 - _354;
    precise float _405 = _404 * _404;
    precise float _406 = _405 * _405;
    precise float _407 = _404 * _406;
    precise float _408 = 1.0 - _312;
    precise float _409 = 1.0 - _313;
    precise float _410 = 1.0 - _314;
    precise float _414 = _401 * fma(_408, _407, _312);
    precise float _415 = _402 * fma(_409, _407, _313);
    precise float _416 = _403 * fma(_410, _407, _314);
    SV_Target.x = fma(_320, _398, _414);
    SV_Target.y = fma(_321, _399, _415);
    SV_Target.z = fma(_322, _400, _416);
}

