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
    precise float _137 = cb1._m4.x - TEXCOORD2.x;
    precise float _138 = cb1._m4.y - TEXCOORD2.y;
    precise float _139 = cb1._m4.z - TEXCOORD2.z;
    vec3 _140 = vec3(_137, _138, _139);
    precise float _142 = inversesqrt(dp3_f32(_140, _140));
    precise float _143 = _142 * _137;
    precise float _144 = _142 * _138;
    precise float _145 = _142 * _139;
    vec4 _155 = texture(sampler2D(t0, s2), vec2(TEXCOORD.x, TEXCOORD.y));
    precise float _165 = _155.x * cb0._m14.x;
    precise float _166 = _155.y * cb0._m14.y;
    precise float _167 = _155.z * cb0._m14.z;
    precise float _168 = TEXCOORD.y + TEXCOORD.x;
    precise float _169 = _168 * 10.0;
    precise float _172 = roundEven(fract(_169)) + 0.800000011920928955078125;
    precise float _173 = spvNMin(_172, 1.0);
    precise float _174 = _173 * _165;
    precise float _175 = _173 * _166;
    precise float _176 = _173 * _167;
    bool _184 = (TEXCOORD.y > 0.949999988079071044921875) || (((TEXCOORD.x > 0.863223135471343994140625) || (TEXCOORD.x < 0.13677684962749481201171875)) || (TEXCOORD.y < 0.0500000007450580596923828125));
    float _185 = _184 ? 0.0 : _174;
    float _186 = _184 ? 0.0 : _175;
    float _187 = _184 ? 0.0 : _176;
    precise float _193 = TEXCOORD2.y * cb0._m7.x;
    precise float _194 = TEXCOORD2.y * cb0._m7.y;
    precise float _211 = fma(cb0._m9.x, TEXCOORD2.z, fma(cb0._m5.x, TEXCOORD2.x, _193)) + cb0._m11.x;
    precise float _212 = fma(cb0._m9.y, TEXCOORD2.z, fma(cb0._m5.y, TEXCOORD2.x, _194)) + cb0._m11.y;
    float _289;
    float _290;
    float _291;
    float _292;
    if (cb3._m0.x == 1.0)
    {
        bool _222 = cb3._m0.y == 1.0;
        precise float _228 = TEXCOORD2.y * cb3._m3.x;
        precise float _229 = TEXCOORD2.y * cb3._m3.y;
        precise float _230 = TEXCOORD2.y * cb3._m3.z;
        precise float _252 = fma(cb3._m5.x, TEXCOORD2.z, fma(cb3._m1.x, TEXCOORD2.x, _228)) + cb3._m7.x;
        precise float _253 = fma(cb3._m5.y, TEXCOORD2.z, fma(cb3._m1.y, TEXCOORD2.x, _229)) + cb3._m7.y;
        precise float _254 = fma(cb3._m5.z, TEXCOORD2.z, fma(cb3._m1.z, TEXCOORD2.x, _230)) + cb3._m7.z;
        precise float _263 = (_222 ? _252 : TEXCOORD2.x) - cb3._m11.x;
        precise float _264 = (_222 ? _253 : TEXCOORD2.y) - cb3._m11.y;
        precise float _265 = (_222 ? _254 : TEXCOORD2.z) - cb3._m11.z;
        precise float _271 = _263 * cb3._m9.x;
        precise float _272 = _264 * cb3._m9.y;
        precise float _273 = _265 * cb3._m9.z;
        vec4 _284 = texture(sampler3D(t2, s0), vec3(spvNMax(fma(_271, 0.25, 0.75), fma(cb3._m0.z, 0.5, 0.75)), _272, _273));
        _289 = _284.w;
        _290 = _284.z;
        _291 = _284.y;
        _292 = _284.x;
    }
    else
    {
        _289 = 1.0;
        _290 = 1.0;
        _291 = 1.0;
        _292 = 1.0;
    }
    precise float _306 = spvNClamp(dp4_f32(vec4(_292, _291, _290, _289), cb2._m47), 0.0, 1.0) * texture(sampler2D(t1, s1), vec2(_211, _212)).w;
    precise float _312 = _306 * cb0._m2.x;
    precise float _313 = _306 * cb0._m2.y;
    precise float _314 = _306 * cb0._m2.z;
    vec3 _321 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    precise float _323 = inversesqrt(dp3_f32(_321, _321));
    precise float _324 = _323 * TEXCOORD1.x;
    precise float _325 = _323 * TEXCOORD1.y;
    precise float _326 = _323 * TEXCOORD1.z;
    precise float _327 = _185 - 0.039999999105930328369140625;
    precise float _328 = _186 - 0.039999999105930328369140625;
    precise float _329 = _187 - 0.039999999105930328369140625;
    precise float _332 = fma(cb0._m13.y, _327, 0.039999999105930328369140625);
    precise float _333 = fma(cb0._m13.y, _328, 0.039999999105930328369140625);
    precise float _334 = fma(cb0._m13.y, _329, 0.039999999105930328369140625);
    precise float _336 = fma(-cb0._m13.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _337 = _336 * _185;
    precise float _338 = _336 * _186;
    precise float _339 = _336 * _187;
    precise float _342 = 1.0 - cb0._m13.x;
    precise float _348 = fma(_137, _142, cb2._m0.x);
    precise float _349 = fma(_138, _142, cb2._m0.y);
    precise float _350 = fma(_139, _142, cb2._m0.z);
    vec3 _351 = vec3(_348, _349, _350);
    precise float _354 = inversesqrt(spvNMax(dp3_f32(_351, _351), 0.001000000047497451305389404296875));
    precise float _355 = _354 * _348;
    precise float _356 = _354 * _349;
    precise float _357 = _354 * _350;
    vec3 _358 = vec3(_324, _325, _326);
    precise float _362 = spvNClamp(dp3_f32(_358, cb2._m0), 0.0, 1.0);
    vec3 _363 = vec3(_355, _356, _357);
    precise float _365 = spvNClamp(dp3_f32(_358, _363), 0.0, 1.0);
    precise float _367 = spvNClamp(dp3_f32(cb2._m0, _363), 0.0, 1.0);
    precise float _368 = _367 * _367;
    precise float _372 = dp2_f32(vec2(_368), vec2(_342)) - 0.5;
    precise float _373 = 1.0 - _362;
    precise float _374 = _373 * _373;
    precise float _375 = _374 * _374;
    precise float _376 = _373 * _375;
    precise float _378 = abs(dp3_f32(_358, vec3(_143, _144, _145)));
    precise float _379 = 1.0 - _378;
    precise float _380 = _379 * _379;
    precise float _381 = _380 * _380;
    precise float _382 = _379 * _381;
    precise float _384 = fma(_372, _382, 1.0) * fma(_372, _376, 1.0);
    precise float _385 = _342 * _342;
    precise float _386 = spvNMax(_385, 0.00200000009499490261077880859375);
    precise float _387 = 1.0 - _386;
    precise float _390 = _378 * fma(_362, _387, _386);
    precise float _392 = fma(_362, fma(_378, _387, _386), _390) + 9.9999997473787516355514526367188e-06;
    precise float _393 = 0.5 / _392;
    precise float _394 = _386 * _386;
    precise float _397 = fma(fma(_365, _394, -_365), _365, 1.0);
    precise float _398 = _394 * 0.3183098733425140380859375;
    precise float _400 = _398 / fma(_397, _397, 1.0000000116860974230803549289703e-07);
    precise float _401 = _400 * _393;
    precise float _402 = _401 * 3.1415927410125732421875;
    precise float _403 = _362 * _384;
    precise float _404 = _362 * _402;
    vec3 _406 = vec3(_332, _333, _334);
    precise float _410 = ((dp3_f32(_406, _406) == 0.0) ? 0.0 : 1.0) * spvNMax(_404, 0.0);
    precise float _411 = _403 * _312;
    precise float _412 = _403 * _313;
    precise float _413 = _403 * _314;
    precise float _414 = _312 * _410;
    precise float _415 = _313 * _410;
    precise float _416 = _314 * _410;
    precise float _417 = 1.0 - _367;
    precise float _418 = _417 * _417;
    precise float _419 = _418 * _418;
    precise float _420 = _417 * _419;
    precise float _421 = 1.0 - _332;
    precise float _422 = 1.0 - _333;
    precise float _423 = 1.0 - _334;
    precise float _427 = _414 * fma(_421, _420, _332);
    precise float _428 = _415 * fma(_422, _420, _333);
    precise float _429 = _416 * fma(_423, _420, _334);
    SV_Target.x = fma(_337, _411, _427);
    SV_Target.y = fma(_338, _412, _428);
    SV_Target.z = fma(_339, _413, _429);
    SV_Target.w = 1.0;
}

