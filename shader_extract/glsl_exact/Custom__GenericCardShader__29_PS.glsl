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
    precise float _163 = TEXCOORD.y - 0.5;
    precise float _164 = _163 * 0.3333333432674407958984375;
    precise float _165 = _163 * 150.0;
    precise float _170 = abs(dFdx(_164)) + abs(dFdy(_164));
    precise float _173 = sin(roundEven(_165)) * 43758.546875;
    precise float _175 = fract(_173) - 0.5;
    precise float _178 = fma(_175, 0.004999999888241291046142578125, TEXCOORD.x);
    precise float _179 = _178 * 150.0;
    precise float _182 = sin(roundEven(_179)) * 43758.546875;
    precise float _184 = fract(_182) - 0.5;
    precise float _195 = cb0._m16.x - cb0._m18.x;
    precise float _196 = cb0._m16.y - cb0._m18.x;
    precise float _199 = abs(_178) - _195;
    precise float _200 = abs(fma(_184, 0.00166666670702397823333740234375, _164)) - _196;
    vec2 _203 = vec2(spvNMax(_199, 0.0), spvNMax(_200, 0.0));
    precise float _206 = sqrt(dp2_f32(_203, _203)) / _170;
    precise float _207 = spvNMin(_206, 1.0);
    precise float _216 = fma(_207, -cb0._m14.x, cb0._m14.x);
    precise float _217 = fma(_207, -cb0._m14.y, cb0._m14.y);
    precise float _218 = fma(_207, -cb0._m14.z, cb0._m14.z);
    precise float _224 = TEXCOORD2.y * cb0._m7.x;
    precise float _225 = TEXCOORD2.y * cb0._m7.y;
    precise float _226 = TEXCOORD2.y * cb0._m7.z;
    precise float _248 = fma(cb0._m9.x, TEXCOORD2.z, fma(cb0._m5.x, TEXCOORD2.x, _224)) + cb0._m11.x;
    precise float _249 = fma(cb0._m9.y, TEXCOORD2.z, fma(cb0._m5.y, TEXCOORD2.x, _225)) + cb0._m11.y;
    precise float _250 = fma(cb0._m9.z, TEXCOORD2.z, fma(cb0._m5.z, TEXCOORD2.x, _226)) + cb0._m11.z;
    float _327;
    float _328;
    float _329;
    float _330;
    if (cb3._m0.x == 1.0)
    {
        bool _260 = cb3._m0.y == 1.0;
        precise float _266 = TEXCOORD2.y * cb3._m3.x;
        precise float _267 = TEXCOORD2.y * cb3._m3.y;
        precise float _268 = TEXCOORD2.y * cb3._m3.z;
        precise float _290 = fma(cb3._m5.x, TEXCOORD2.z, fma(cb3._m1.x, TEXCOORD2.x, _266)) + cb3._m7.x;
        precise float _291 = fma(cb3._m5.y, TEXCOORD2.z, fma(cb3._m1.y, TEXCOORD2.x, _267)) + cb3._m7.y;
        precise float _292 = fma(cb3._m5.z, TEXCOORD2.z, fma(cb3._m1.z, TEXCOORD2.x, _268)) + cb3._m7.z;
        precise float _301 = (_260 ? _290 : TEXCOORD2.x) - cb3._m11.x;
        precise float _302 = (_260 ? _291 : TEXCOORD2.y) - cb3._m11.y;
        precise float _303 = (_260 ? _292 : TEXCOORD2.z) - cb3._m11.z;
        precise float _309 = _301 * cb3._m9.x;
        precise float _310 = _302 * cb3._m9.y;
        precise float _311 = _303 * cb3._m9.z;
        vec4 _322 = texture(sampler3D(t1, s0), vec3(spvNMax(fma(_309, 0.25, 0.75), fma(cb3._m0.z, 0.5, 0.75)), _310, _311));
        _327 = _322.w;
        _328 = _322.z;
        _329 = _322.y;
        _330 = _322.x;
    }
    else
    {
        _327 = 1.0;
        _328 = 1.0;
        _329 = 1.0;
        _330 = 1.0;
    }
    vec3 _337 = vec3(_248, _249, _250);
    precise float _346 = spvNClamp(dp4_f32(vec4(_330, _329, _328, _327), cb2._m47), 0.0, 1.0) * texture(sampler2D(t0, s1), vec2(dp3_f32(_337, _337))).x;
    precise float _352 = _346 * cb0._m2.x;
    precise float _353 = _346 * cb0._m2.y;
    precise float _354 = _346 * cb0._m2.z;
    vec3 _361 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    precise float _363 = inversesqrt(dp3_f32(_361, _361));
    precise float _364 = _363 * TEXCOORD1.x;
    precise float _365 = _363 * TEXCOORD1.y;
    precise float _366 = _363 * TEXCOORD1.z;
    precise float _367 = _216 - 0.039999999105930328369140625;
    precise float _368 = _217 - 0.039999999105930328369140625;
    precise float _369 = _218 - 0.039999999105930328369140625;
    precise float _372 = fma(cb0._m13.y, _367, 0.039999999105930328369140625);
    precise float _373 = fma(cb0._m13.y, _368, 0.039999999105930328369140625);
    precise float _374 = fma(cb0._m13.y, _369, 0.039999999105930328369140625);
    precise float _376 = fma(-cb0._m13.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _377 = _376 * _216;
    precise float _378 = _376 * _217;
    precise float _379 = _376 * _218;
    precise float _382 = 1.0 - cb0._m13.x;
    precise float _383 = fma(_137, _142, _158);
    precise float _384 = fma(_138, _142, _159);
    precise float _385 = fma(_139, _142, _160);
    vec3 _386 = vec3(_383, _384, _385);
    precise float _389 = inversesqrt(spvNMax(dp3_f32(_386, _386), 0.001000000047497451305389404296875));
    precise float _390 = _389 * _383;
    precise float _391 = _389 * _384;
    precise float _392 = _389 * _385;
    vec3 _393 = vec3(_364, _365, _366);
    vec3 _396 = vec3(_143, _144, _145);
    precise float _398 = spvNClamp(dp3_f32(_393, _396), 0.0, 1.0);
    vec3 _399 = vec3(_390, _391, _392);
    precise float _401 = spvNClamp(dp3_f32(_393, _399), 0.0, 1.0);
    precise float _403 = spvNClamp(dp3_f32(_396, _399), 0.0, 1.0);
    precise float _404 = _403 * _403;
    precise float _408 = dp2_f32(vec2(_404), vec2(_382)) - 0.5;
    precise float _409 = 1.0 - _398;
    precise float _410 = _409 * _409;
    precise float _411 = _410 * _410;
    precise float _412 = _409 * _411;
    precise float _414 = abs(dp3_f32(_393, vec3(_158, _159, _160)));
    precise float _415 = 1.0 - _414;
    precise float _416 = _415 * _415;
    precise float _417 = _416 * _416;
    precise float _418 = _415 * _417;
    precise float _420 = fma(_408, _418, 1.0) * fma(_408, _412, 1.0);
    precise float _421 = _382 * _382;
    precise float _422 = spvNMax(_421, 0.00200000009499490261077880859375);
    precise float _423 = 1.0 - _422;
    precise float _426 = _414 * fma(_398, _423, _422);
    precise float _428 = fma(_398, fma(_414, _423, _422), _426) + 9.9999997473787516355514526367188e-06;
    precise float _429 = 0.5 / _428;
    precise float _430 = _422 * _422;
    precise float _433 = fma(fma(_401, _430, -_401), _401, 1.0);
    precise float _434 = _430 * 0.3183098733425140380859375;
    precise float _436 = _434 / fma(_433, _433, 1.0000000116860974230803549289703e-07);
    precise float _437 = _436 * _429;
    precise float _438 = _437 * 3.1415927410125732421875;
    precise float _439 = _398 * _420;
    precise float _440 = _398 * _438;
    vec3 _442 = vec3(_372, _373, _374);
    precise float _446 = ((dp3_f32(_442, _442) == 0.0) ? 0.0 : 1.0) * spvNMax(_440, 0.0);
    precise float _447 = _439 * _352;
    precise float _448 = _439 * _353;
    precise float _449 = _439 * _354;
    precise float _450 = _352 * _446;
    precise float _451 = _353 * _446;
    precise float _452 = _354 * _446;
    precise float _453 = 1.0 - _403;
    precise float _454 = _453 * _453;
    precise float _455 = _454 * _454;
    precise float _456 = _453 * _455;
    precise float _457 = 1.0 - _372;
    precise float _458 = 1.0 - _373;
    precise float _459 = 1.0 - _374;
    precise float _463 = _450 * fma(_457, _456, _372);
    precise float _464 = _451 * fma(_458, _456, _373);
    precise float _465 = _452 * fma(_459, _456, _374);
    SV_Target.x = fma(_377, _447, _463);
    SV_Target.y = fma(_378, _448, _464);
    SV_Target.z = fma(_379, _449, _465);
    SV_Target.w = 1.0;
}

