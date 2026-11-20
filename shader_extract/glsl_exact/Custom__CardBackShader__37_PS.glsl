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
    precise float _137 = cb2._m0.x - TEXCOORD2.x;
    precise float _138 = cb2._m0.y - TEXCOORD2.y;
    precise float _139 = cb2._m0.z - TEXCOORD2.z;
    vec3 _140 = vec3(_137, _138, _139);
    precise float _142 = inversesqrt(dp3_f32(_140, _140));
    precise float _143 = _142 * _137;
    precise float _144 = _142 * _138;
    precise float _145 = _142 * _139;
    precise float _152 = cb1._m4.x - TEXCOORD2.x;
    precise float _153 = cb1._m4.y - TEXCOORD2.y;
    precise float _154 = cb1._m4.z - TEXCOORD2.z;
    vec3 _155 = vec3(_152, _153, _154);
    precise float _157 = inversesqrt(dp3_f32(_155, _155));
    precise float _158 = _157 * _152;
    precise float _159 = _157 * _153;
    precise float _160 = _157 * _154;
    vec4 _170 = texture(sampler2D(t0, s2), vec2(TEXCOORD.x, TEXCOORD.y));
    precise float _180 = _170.x * cb0._m14.x;
    precise float _181 = _170.y * cb0._m14.y;
    precise float _182 = _170.z * cb0._m14.z;
    precise float _183 = TEXCOORD.y + TEXCOORD.x;
    precise float _184 = _183 * 10.0;
    precise float _187 = roundEven(fract(_184)) + 0.800000011920928955078125;
    precise float _188 = spvNMin(_187, 1.0);
    precise float _189 = _188 * _180;
    precise float _190 = _188 * _181;
    precise float _191 = _188 * _182;
    bool _199 = (TEXCOORD.y > 0.949999988079071044921875) || ((TEXCOORD.y < 0.0500000007450580596923828125) || ((TEXCOORD.x > 0.863223135471343994140625) || (TEXCOORD.x < 0.13677684962749481201171875)));
    float _200 = _199 ? 0.0 : _189;
    float _201 = _199 ? 0.0 : _190;
    float _202 = _199 ? 0.0 : _191;
    precise float _208 = TEXCOORD2.y * cb0._m7.x;
    precise float _209 = TEXCOORD2.y * cb0._m7.y;
    precise float _210 = TEXCOORD2.y * cb0._m7.z;
    precise float _232 = fma(cb0._m9.x, TEXCOORD2.z, fma(cb0._m5.x, TEXCOORD2.x, _208)) + cb0._m11.x;
    precise float _233 = fma(cb0._m9.y, TEXCOORD2.z, fma(cb0._m5.y, TEXCOORD2.x, _209)) + cb0._m11.y;
    precise float _234 = fma(cb0._m9.z, TEXCOORD2.z, fma(cb0._m5.z, TEXCOORD2.x, _210)) + cb0._m11.z;
    float _311;
    float _312;
    float _313;
    float _314;
    if (cb3._m0.x == 1.0)
    {
        bool _244 = cb3._m0.y == 1.0;
        precise float _250 = TEXCOORD2.y * cb3._m3.x;
        precise float _251 = TEXCOORD2.y * cb3._m3.y;
        precise float _252 = TEXCOORD2.y * cb3._m3.z;
        precise float _274 = fma(cb3._m5.x, TEXCOORD2.z, fma(cb3._m1.x, TEXCOORD2.x, _250)) + cb3._m7.x;
        precise float _275 = fma(cb3._m5.y, TEXCOORD2.z, fma(cb3._m1.y, TEXCOORD2.x, _251)) + cb3._m7.y;
        precise float _276 = fma(cb3._m5.z, TEXCOORD2.z, fma(cb3._m1.z, TEXCOORD2.x, _252)) + cb3._m7.z;
        precise float _285 = (_244 ? _274 : TEXCOORD2.x) - cb3._m11.x;
        precise float _286 = (_244 ? _275 : TEXCOORD2.y) - cb3._m11.y;
        precise float _287 = (_244 ? _276 : TEXCOORD2.z) - cb3._m11.z;
        precise float _293 = _285 * cb3._m9.x;
        precise float _294 = _286 * cb3._m9.y;
        precise float _295 = _287 * cb3._m9.z;
        vec4 _306 = texture(sampler3D(t2, s0), vec3(spvNMax(fma(_293, 0.25, 0.75), fma(cb3._m0.z, 0.5, 0.75)), _294, _295));
        _311 = _306.w;
        _312 = _306.z;
        _313 = _306.y;
        _314 = _306.x;
    }
    else
    {
        _311 = 1.0;
        _312 = 1.0;
        _313 = 1.0;
        _314 = 1.0;
    }
    vec3 _321 = vec3(_232, _233, _234);
    precise float _329 = spvNClamp(dp4_f32(vec4(_314, _313, _312, _311), cb2._m47), 0.0, 1.0) * texture(sampler2D(t1, s1), vec2(dp3_f32(_321, _321))).x;
    precise float _335 = _329 * cb0._m2.x;
    precise float _336 = _329 * cb0._m2.y;
    precise float _337 = _329 * cb0._m2.z;
    vec3 _344 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    precise float _346 = inversesqrt(dp3_f32(_344, _344));
    precise float _347 = _346 * TEXCOORD1.x;
    precise float _348 = _346 * TEXCOORD1.y;
    precise float _349 = _346 * TEXCOORD1.z;
    precise float _350 = _200 - 0.039999999105930328369140625;
    precise float _351 = _201 - 0.039999999105930328369140625;
    precise float _352 = _202 - 0.039999999105930328369140625;
    precise float _355 = fma(cb0._m13.y, _350, 0.039999999105930328369140625);
    precise float _356 = fma(cb0._m13.y, _351, 0.039999999105930328369140625);
    precise float _357 = fma(cb0._m13.y, _352, 0.039999999105930328369140625);
    precise float _359 = fma(-cb0._m13.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _360 = _359 * _200;
    precise float _361 = _359 * _201;
    precise float _362 = _359 * _202;
    precise float _365 = 1.0 - cb0._m13.x;
    precise float _366 = fma(_137, _142, _158);
    precise float _367 = fma(_138, _142, _159);
    precise float _368 = fma(_139, _142, _160);
    vec3 _369 = vec3(_366, _367, _368);
    precise float _372 = inversesqrt(spvNMax(dp3_f32(_369, _369), 0.001000000047497451305389404296875));
    precise float _373 = _372 * _366;
    precise float _374 = _372 * _367;
    precise float _375 = _372 * _368;
    vec3 _376 = vec3(_347, _348, _349);
    vec3 _379 = vec3(_143, _144, _145);
    precise float _381 = spvNClamp(dp3_f32(_376, _379), 0.0, 1.0);
    vec3 _382 = vec3(_373, _374, _375);
    precise float _384 = spvNClamp(dp3_f32(_376, _382), 0.0, 1.0);
    precise float _386 = spvNClamp(dp3_f32(_379, _382), 0.0, 1.0);
    precise float _387 = _386 * _386;
    precise float _391 = dp2_f32(vec2(_387), vec2(_365)) - 0.5;
    precise float _392 = 1.0 - _381;
    precise float _393 = _392 * _392;
    precise float _394 = _393 * _393;
    precise float _395 = _392 * _394;
    precise float _397 = abs(dp3_f32(_376, vec3(_158, _159, _160)));
    precise float _398 = 1.0 - _397;
    precise float _399 = _398 * _398;
    precise float _400 = _399 * _399;
    precise float _401 = _398 * _400;
    precise float _403 = fma(_391, _401, 1.0) * fma(_391, _395, 1.0);
    precise float _404 = _365 * _365;
    precise float _405 = spvNMax(_404, 0.00200000009499490261077880859375);
    precise float _406 = 1.0 - _405;
    precise float _409 = _397 * fma(_381, _406, _405);
    precise float _411 = fma(_381, fma(_397, _406, _405), _409) + 9.9999997473787516355514526367188e-06;
    precise float _412 = 0.5 / _411;
    precise float _413 = _405 * _405;
    precise float _416 = fma(fma(_384, _413, -_384), _384, 1.0);
    precise float _417 = _413 * 0.3183098733425140380859375;
    precise float _419 = _417 / fma(_416, _416, 1.0000000116860974230803549289703e-07);
    precise float _420 = _419 * _412;
    precise float _421 = _420 * 3.1415927410125732421875;
    precise float _422 = _381 * _403;
    precise float _423 = _381 * _421;
    vec3 _425 = vec3(_355, _356, _357);
    precise float _429 = ((dp3_f32(_425, _425) == 0.0) ? 0.0 : 1.0) * spvNMax(_423, 0.0);
    precise float _430 = _422 * _335;
    precise float _431 = _422 * _336;
    precise float _432 = _422 * _337;
    precise float _433 = _335 * _429;
    precise float _434 = _336 * _429;
    precise float _435 = _337 * _429;
    precise float _436 = 1.0 - _386;
    precise float _437 = _436 * _436;
    precise float _438 = _437 * _437;
    precise float _439 = _436 * _438;
    precise float _440 = 1.0 - _355;
    precise float _441 = 1.0 - _356;
    precise float _442 = 1.0 - _357;
    precise float _446 = _433 * fma(_440, _439, _355);
    precise float _447 = _434 * fma(_441, _439, _356);
    precise float _448 = _435 * fma(_442, _439, _357);
    SV_Target.x = fma(_360, _430, _446);
    SV_Target.y = fma(_361, _431, _447);
    SV_Target.z = fma(_362, _432, _448);
    SV_Target.w = 1.0;
}

