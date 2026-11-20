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
    precise float _134 = cb1._m4.x - TEXCOORD1.x;
    precise float _135 = cb1._m4.y - TEXCOORD1.y;
    precise float _136 = cb1._m4.z - TEXCOORD1.z;
    vec3 _137 = vec3(_134, _135, _136);
    precise float _139 = inversesqrt(dp3_f32(_137, _137));
    precise float _140 = _139 * _134;
    precise float _141 = _139 * _135;
    precise float _142 = _139 * _136;
    precise float _149 = TEXCOORD1.x / cb0._m17.x;
    precise float _150 = TEXCOORD1.z / cb0._m17.y;
    precise float _153 = fract(_149) + 0.5;
    precise float _154 = fract(_150) + 0.5;
    precise float _158 = fract(_153);
    precise float _159 = fract(_154);
    float _162 = (_153 >= 0.0) ? _158 : (-_158);
    float _163 = (_154 >= 0.0) ? _159 : (-_159);
    precise float _167 = cb0._m16 - 0.00999999977648258209228515625;
    precise float _168 = _162 - _167;
    precise float _169 = _163 - _167;
    precise float _170 = _168 * 50.0;
    precise float _171 = _169 * 50.0;
    precise float _172 = spvNClamp(_170, 0.0, 1.0);
    precise float _173 = spvNClamp(_171, 0.0, 1.0);
    precise float _176 = _172 * _172;
    precise float _177 = _173 * _173;
    precise float _178 = _176 * fma(_172, -2.0, 3.0);
    precise float _179 = _177 * fma(_173, -2.0, 3.0);
    precise float _180 = _179 * _178;
    precise float _181 = _167 + _162;
    precise float _182 = _167 + _163;
    precise float _183 = 1.0 - _181;
    precise float _184 = 1.0 - _182;
    precise float _185 = _183 * 50.0;
    precise float _186 = _184 * 50.0;
    precise float _187 = spvNClamp(_185, 0.0, 1.0);
    precise float _188 = spvNClamp(_186, 0.0, 1.0);
    precise float _191 = _187 * _187;
    precise float _192 = _188 * _188;
    precise float _193 = _191 * fma(_187, -2.0, 3.0);
    precise float _194 = _192 * fma(_188, -2.0, 3.0);
    precise float _195 = _193 * _180;
    precise float _200 = fma(-_195, _194, 1.0) * cb0._m18;
    precise float _201 = _200 * 0.5;
    precise float _206 = TEXCOORD1.y * cb0._m7.x;
    precise float _207 = TEXCOORD1.y * cb0._m7.y;
    precise float _224 = fma(cb0._m9.x, TEXCOORD1.z, fma(cb0._m5.x, TEXCOORD1.x, _206)) + cb0._m11.x;
    precise float _225 = fma(cb0._m9.y, TEXCOORD1.z, fma(cb0._m5.y, TEXCOORD1.x, _207)) + cb0._m11.y;
    float _301;
    float _302;
    float _303;
    float _304;
    if (cb3._m0.x == 1.0)
    {
        bool _234 = cb3._m0.y == 1.0;
        precise float _240 = TEXCOORD1.y * cb3._m3.x;
        precise float _241 = TEXCOORD1.y * cb3._m3.y;
        precise float _242 = TEXCOORD1.y * cb3._m3.z;
        precise float _264 = fma(cb3._m5.x, TEXCOORD1.z, fma(cb3._m1.x, TEXCOORD1.x, _240)) + cb3._m7.x;
        precise float _265 = fma(cb3._m5.y, TEXCOORD1.z, fma(cb3._m1.y, TEXCOORD1.x, _241)) + cb3._m7.y;
        precise float _266 = fma(cb3._m5.z, TEXCOORD1.z, fma(cb3._m1.z, TEXCOORD1.x, _242)) + cb3._m7.z;
        precise float _275 = (_234 ? _264 : TEXCOORD1.x) - cb3._m11.x;
        precise float _276 = (_234 ? _265 : TEXCOORD1.y) - cb3._m11.y;
        precise float _277 = (_234 ? _266 : TEXCOORD1.z) - cb3._m11.z;
        precise float _283 = _275 * cb3._m9.x;
        precise float _284 = _276 * cb3._m9.y;
        precise float _285 = _277 * cb3._m9.z;
        vec4 _296 = texture(sampler3D(t1, s0), vec3(spvNMax(fma(cb3._m0.z, 0.5, 0.75), fma(_283, 0.25, 0.75)), _284, _285));
        _301 = _296.w;
        _302 = _296.z;
        _303 = _296.y;
        _304 = _296.x;
    }
    else
    {
        _301 = 1.0;
        _302 = 1.0;
        _303 = 1.0;
        _304 = 1.0;
    }
    precise float _319 = spvNClamp(dp4_f32(vec4(_304, _303, _302, _301), cb2._m47), 0.0, 1.0) * texture(sampler2D(t0, s1), vec2(_224, _225)).w;
    precise float _325 = _319 * cb0._m2.x;
    precise float _326 = _319 * cb0._m2.y;
    precise float _327 = _319 * cb0._m2.z;
    vec3 _334 = vec3(TEXCOORD.x, TEXCOORD.y, TEXCOORD.z);
    precise float _336 = inversesqrt(dp3_f32(_334, _334));
    precise float _337 = _336 * TEXCOORD.x;
    precise float _338 = _336 * TEXCOORD.y;
    precise float _339 = _336 * TEXCOORD.z;
    precise float _345 = cb0._m14.x - 0.039999999105930328369140625;
    precise float _346 = cb0._m14.y - 0.039999999105930328369140625;
    precise float _347 = cb0._m14.z - 0.039999999105930328369140625;
    precise float _350 = fma(cb0._m13.y, _345, 0.039999999105930328369140625);
    precise float _351 = fma(cb0._m13.y, _346, 0.039999999105930328369140625);
    precise float _352 = fma(cb0._m13.y, _347, 0.039999999105930328369140625);
    precise float _354 = fma(-cb0._m13.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _355 = _354 * cb0._m14.x;
    precise float _356 = _354 * cb0._m14.y;
    precise float _357 = _354 * cb0._m14.z;
    precise float _358 = _201 * _355;
    precise float _359 = _201 * _356;
    precise float _360 = _201 * _357;
    precise float _361 = 1.0 - _354;
    SV_Target.w = fma(_201, _354, _361);
    precise float _367 = 1.0 - cb0._m13.x;
    precise float _373 = fma(_134, _139, cb2._m0.x);
    precise float _374 = fma(_135, _139, cb2._m0.y);
    precise float _375 = fma(_136, _139, cb2._m0.z);
    vec3 _376 = vec3(_373, _374, _375);
    precise float _379 = inversesqrt(spvNMax(dp3_f32(_376, _376), 0.001000000047497451305389404296875));
    precise float _380 = _379 * _373;
    precise float _381 = _379 * _374;
    precise float _382 = _379 * _375;
    vec3 _383 = vec3(_337, _338, _339);
    precise float _387 = spvNClamp(dp3_f32(_383, cb2._m0), 0.0, 1.0);
    vec3 _388 = vec3(_380, _381, _382);
    precise float _390 = spvNClamp(dp3_f32(_383, _388), 0.0, 1.0);
    precise float _392 = spvNClamp(dp3_f32(cb2._m0, _388), 0.0, 1.0);
    precise float _393 = _392 * _392;
    precise float _397 = dp2_f32(vec2(_393), vec2(_367)) - 0.5;
    precise float _398 = 1.0 - _387;
    precise float _399 = _398 * _398;
    precise float _400 = _399 * _399;
    precise float _401 = _398 * _400;
    precise float _403 = abs(dp3_f32(_383, vec3(_140, _141, _142)));
    precise float _404 = 1.0 - _403;
    precise float _405 = _404 * _404;
    precise float _406 = _405 * _405;
    precise float _407 = _404 * _406;
    precise float _409 = fma(_397, _407, 1.0) * fma(_397, _401, 1.0);
    precise float _410 = _367 * _367;
    precise float _411 = spvNMax(_410, 0.00200000009499490261077880859375);
    precise float _412 = 1.0 - _411;
    precise float _415 = _403 * fma(_387, _412, _411);
    precise float _417 = fma(_387, fma(_403, _412, _411), _415) + 9.9999997473787516355514526367188e-06;
    precise float _418 = 0.5 / _417;
    precise float _419 = _411 * _411;
    precise float _422 = fma(fma(_390, _419, -_390), _390, 1.0);
    precise float _423 = _419 * 0.3183098733425140380859375;
    precise float _425 = _423 / fma(_422, _422, 1.0000000116860974230803549289703e-07);
    precise float _426 = _425 * _418;
    precise float _427 = _426 * 3.1415927410125732421875;
    precise float _428 = _387 * _409;
    precise float _429 = _387 * _427;
    vec3 _431 = vec3(_350, _351, _352);
    precise float _435 = ((dp3_f32(_431, _431) == 0.0) ? 0.0 : 1.0) * spvNMax(_429, 0.0);
    precise float _436 = _428 * _325;
    precise float _437 = _428 * _326;
    precise float _438 = _428 * _327;
    precise float _439 = _325 * _435;
    precise float _440 = _326 * _435;
    precise float _441 = _327 * _435;
    precise float _442 = 1.0 - _392;
    precise float _443 = _442 * _442;
    precise float _444 = _443 * _443;
    precise float _445 = _442 * _444;
    precise float _446 = 1.0 - _350;
    precise float _447 = 1.0 - _351;
    precise float _448 = 1.0 - _352;
    precise float _452 = _439 * fma(_446, _445, _350);
    precise float _453 = _440 * fma(_447, _445, _351);
    precise float _454 = _441 * fma(_448, _445, _352);
    SV_Target.x = fma(_358, _436, _452);
    SV_Target.y = fma(_359, _437, _453);
    SV_Target.z = fma(_360, _438, _454);
}

