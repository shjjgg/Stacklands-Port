#version 450
#extension GL_EXT_buffer_reference2 : require
#extension GL_EXT_spirv_intrinsics : require
#extension GL_EXT_demote_to_helper_invocation : require

layout(set = 0, binding = 0, std140) uniform cb0_buf
{
    uvec4 _m0;
    uvec4 _m1;
    uvec4 _m2;
    uvec4 _m3;
    vec4 _m4;
    vec3 _m5;
    uint _m6;
    vec3 _m7;
    uint _m8;
    vec3 _m9;
    uint _m10;
    uvec4 _m11;
    vec3 _m12;
    uint _m13;
    vec2 _m14;
    uvec2 _m15;
    uvec4 _m16;
    vec2 _m17;
    vec2 _m18;
} cb0;

layout(set = 0, binding = 1, std140) uniform cb1_buf
{
    vec4 _m0;
    uvec4 _m1;
    uvec4 _m2;
    uvec4 _m3;
    vec3 _m4;
    uint _m5;
} cb1;

layout(set = 0, binding = 2, std140) uniform cb2_buf
{
    uvec4 _m0;
    uvec4 _m1;
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
    vec4 _m39;
    vec4 _m40;
    vec4 _m41;
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
layout(set = 0, binding = 7) uniform sampler s3;
layout(set = 0, binding = 8) uniform sampler s4;
layout(set = 0, binding = 9) uniform texture2D t0;
layout(set = 0, binding = 10) uniform texture2D t1;
layout(set = 0, binding = 11) uniform texture2D t2;
layout(set = 0, binding = 12) uniform texture2D t3;
layout(set = 0, binding = 13) uniform texture3D t4;

layout(location = 1, component = 0) in vec2 TEXCOORD;
layout(location = 2, component = 0) in vec3 TEXCOORD1;
layout(location = 3, component = 0) in vec3 TEXCOORD2;
layout(location = 5, component = 0) in vec3 TEXCOORD5;
layout(location = 0, component = 0) out vec4 SV_Target;
layout(location = 1, component = 0) out vec4 SV_Target1;
layout(location = 2, component = 0) out vec4 SV_Target2;
layout(location = 3, component = 0) out vec4 SV_Target3;

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
    precise float _142 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _142));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _131 = a.x * b.x;
    return fma(a.y, b.y, _131);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _113 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _113)));
}

void main()
{
    precise float _155 = TEXCOORD.y * 150.0;
    precise float _158 = sin(roundEven(_155)) * 43758.546875;
    precise float _162 = fma(fract(_158), 0.004999999888241291046142578125, TEXCOORD.x);
    precise float _163 = _162 * 150.0;
    precise float _164 = _162 * 10.0;
    precise float _167 = sin(roundEven(_163)) * 43758.546875;
    precise float _169 = fma(fract(_167), 0.004999999888241291046142578125, TEXCOORD.y);
    precise float _178 = abs(dFdy(_162)) + abs(dFdx(_162));
    precise float _179 = abs(dFdy(_169)) + abs(dFdx(_169));
    precise float _180 = 1.0 - TEXCOORD.x;
    precise float _181 = 1.0 - TEXCOORD.y;
    bool _188 = cb0._m18.x > 0.5;
    bool _190 = cb0._m18.y > 0.5;
    float _193 = _190 ? (_188 ? 0.550000011920928955078125 : 0.5) : (_188 ? 0.5 : 0.449999988079071044921875);
    float _195 = (_188 || _190) ? 2.0 : 1.75;
    precise float _196 = _180 - 0.5;
    precise float _197 = _181 - _193;
    precise float _198 = _195 * _196;
    precise float _199 = fma(_196, _195, 0.5);
    precise float _200 = fma(_197, _195, _193);
    precise float _209 = float(_199 >= 0.0) * float(_199 <= 1.0);
    precise float _210 = float(_200 >= 0.0) * _209;
    vec2 _213 = vec2(_199, _200);
    vec4 _216 = texture(sampler2D(t0, s1), _213);
    float _217 = _216.x;
    float _218 = _216.w;
    vec4 _222 = texture(sampler2D(t1, s3), _213);
    float _223 = _222.x;
    float _224 = _222.w;
    precise float _226 = fma(-_210, float(_200 <= 1.0), 1.0);
    precise float _230 = fma(_226, -_218, _218);
    precise float _234 = fma(_226, -_224, _224);
    precise float _248 = TEXCOORD2.x - cb1._m4.x;
    precise float _249 = TEXCOORD2.y - cb1._m4.y;
    precise float _250 = TEXCOORD2.z - cb1._m4.z;
    vec3 _251 = vec3(_248, _249, _250);
    precise float _253 = inversesqrt(dp3_f32(_251, _251));
    precise float _254 = _253 * _248;
    precise float _255 = _253 * _250;
    precise float _256 = TEXCOORD.y + TEXCOORD.x;
    precise float _257 = TEXCOORD.y + TEXCOORD.y;
    precise float _261 = fma(-_255, 5.0, _257);
    precise float _262 = _261 * 10.0;
    precise float _264 = fma(sin(_262), 0.0199999995529651641845703125, fma(-_254, 5.0, _256));
    precise float _265 = _264 * 30.0;
    vec4 _272 = texture(sampler2D(t2, s2), vec2(_264, fma(cos(_265), 0.0199999995529651641845703125, _261)));
    precise float _280 = fma(cb1._m0.z, 2.0, _256) * 0.0199999995529651641845703125;
    float _283 = float(fract(_280) >= 0.9900000095367431640625);
    bool _288 = cb0._m14.x > 0.5;
    bool _289 = cb0._m14.y > 0.5;
    float _300 = _288 ? fma(_283, cb0._m17.y, cb0._m5.x) : cb0._m5.x;
    float _301 = _288 ? fma(_283, cb0._m17.y, cb0._m5.y) : cb0._m5.y;
    float _302 = _288 ? fma(_283, cb0._m17.y, cb0._m5.z) : cb0._m5.z;
    precise float _303 = _198 + 0.0;
    precise float _304 = _200 - 0.5;
    vec2 _305 = vec2(_303, _304);
    precise float _312 = (_188 ? spvNMax(abs(_304), abs(_303)) : sqrt(dp2_f32(_305, _305))) - 0.400390625;
    precise float _313 = _312 / _178;
    precise float _315 = 1.0 - spvNClamp(_313, 0.0, 1.0);
    precise float _321 = cb0._m7.x - _300;
    precise float _322 = cb0._m7.y - _301;
    precise float _323 = cb0._m7.z - _302;
    precise float _324 = fma(_315, _321, _300);
    precise float _325 = fma(_315, _322, _301);
    precise float _326 = fma(_315, _323, _302);
    float _328 = (_169 >= 0.20000000298023223876953125) ? 0.0 : 1.0;
    precise float _329 = cb0._m7.x - _324;
    precise float _330 = cb0._m7.y - _325;
    precise float _331 = cb0._m7.z - _326;
    precise float _332 = fma(_328, _329, _324);
    precise float _333 = fma(_328, _330, _325);
    precise float _334 = fma(_328, _331, _326);
    precise float _335 = 1.0 - fma(_226, -_217, _217);
    precise float _341 = cb0._m12.x - cb0._m5.x;
    precise float _342 = cb0._m12.y - cb0._m5.y;
    precise float _343 = cb0._m12.z - cb0._m5.z;
    precise float _347 = fma(_335, _341, cb0._m5.x) - _332;
    precise float _348 = fma(_335, _342, cb0._m5.y) - _333;
    precise float _349 = fma(_335, _343, cb0._m5.z) - _334;
    precise float _350 = fma(_230, _347, _332);
    precise float _351 = fma(_230, _348, _333);
    precise float _352 = fma(_230, _349, _334);
    bool _355 = (cb0._m18.y == 0.0) && (cb0._m18.x == 0.0);
    precise float _356 = 1.0 - fma(_226, -_223, _223);
    precise float _360 = fma(_356, _341, cb0._m5.x) - _350;
    precise float _361 = fma(_356, _342, cb0._m5.y) - _351;
    precise float _362 = fma(_356, _343, cb0._m5.z) - _352;
    float _366 = _355 ? _350 : fma(_234, _360, _350);
    float _367 = _355 ? _351 : fma(_234, _361, _351);
    float _368 = _355 ? _352 : fma(_234, _362, _352);
    precise float _369 = -_179;
    precise float _370 = fma(_369, 0.5, 0.189999997615814208984375);
    precise float _371 = fma(_369, 0.5, 0.2100000083446502685546875);
    precise float _374 = _169 - _370;
    precise float _375 = _169 - _371;
    precise float _378 = fma(_179, 0.5, -_370) + 0.189999997615814208984375;
    precise float _379 = fma(_179, 0.5, -_371) + 0.2100000083446502685546875;
    precise float _380 = _374 / _378;
    precise float _381 = _375 / _379;
    precise float _384 = 1.0 - spvNClamp(_381, 0.0, 1.0);
    precise float _387 = _162 - 0.1167768537998199462890625;
    precise float _388 = _169 - 0.02999999932944774627685546875;
    precise float _389 = _387 / _178;
    precise float _390 = _388 / _179;
    precise float _393 = 0.88322317600250244140625 - _162;
    precise float _394 = 0.9700000286102294921875 - _169;
    precise float _395 = _393 / _178;
    precise float _396 = _394 / _179;
    precise float _399 = spvNClamp(_389, 0.0, 1.0) * spvNClamp(_395, 0.0, 1.0);
    precise float _400 = spvNClamp(_390, 0.0, 1.0) * _399;
    precise float _401 = spvNClamp(_396, 0.0, 1.0) * _400;
    precise float _402 = fma(-spvNClamp(_380, 0.0, 1.0), _384, 1.0) * _401;
    precise float _403 = _169 * 10.0;
    precise float _407 = abs(fma(fract(_403), 2.0, -1.0)) - 0.5;
    precise float _409 = sin(_403) * _407;
    precise float _413 = abs(fma(fract(_164), 2.0, -1.0)) - 0.5;
    precise float _415 = sin(_164) * _413;
    precise float _416 = fma(_409, 0.0199999995529651641845703125, _162);
    precise float _417 = fma(_415, 0.0199999995529651641845703125, _169);
    precise float _418 = _416 - 0.089776851236820220947265625;
    precise float _419 = _417 - 0.0030000000260770320892333984375;
    precise float _420 = _418 / _178;
    precise float _421 = _419 / _179;
    precise float _424 = 0.91022312641143798828125 - _416;
    precise float _425 = 0.9969999790191650390625 - _417;
    precise float _426 = _424 / _178;
    precise float _427 = _425 / _179;
    precise float _430 = spvNClamp(_426, 0.0, 1.0) * spvNClamp(_420, 0.0, 1.0);
    precise float _431 = spvNClamp(_421, 0.0, 1.0) * _430;
    if ((fma(_431, spvNClamp(_427, 0.0, 1.0), -0.100000001490116119384765625) < 0.0) && _289)
    {
        demote;
    }
    precise float _450 = (_288 ? fma(_272.x, cb0._m17.x, _366) : _366) - cb0._m9.x;
    precise float _451 = (_288 ? fma(_272.y, cb0._m17.x, _367) : _367) - cb0._m9.y;
    precise float _452 = (_288 ? fma(_272.z, cb0._m17.x, _368) : _368) - cb0._m9.z;
    precise float _453 = fma(_402, _450, cb0._m9.x);
    precise float _454 = fma(_402, _451, cb0._m9.y);
    precise float _455 = fma(_402, _452, cb0._m9.z);
    float _477;
    float _478;
    float _479;
    if (cb0._m14.y != 0.0)
    {
        float _470 = float(texture(sampler2D(t3, s4), vec2(_289 ? _416 : _162, _289 ? _417 : _169)).w >= 0.5);
        precise float _471 = _453 * (-0.39999997615814208984375);
        precise float _472 = _454 * (-0.39999997615814208984375);
        precise float _473 = _455 * (-0.39999997615814208984375);
        _477 = fma(_470, _471, _453);
        _478 = fma(_470, _472, _454);
        _479 = fma(_470, _473, _455);
    }
    else
    {
        _477 = _453;
        _478 = _454;
        _479 = _455;
    }
    vec4 _490 = vec4(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z, 1.0);
    float _586;
    float _587;
    float _588;
    if (cb3._m0.x == 1.0)
    {
        bool _496 = cb3._m0.y == 1.0;
        precise float _502 = TEXCOORD2.y * cb3._m3.x;
        precise float _503 = TEXCOORD2.y * cb3._m3.y;
        precise float _504 = TEXCOORD2.y * cb3._m3.z;
        precise float _526 = fma(cb3._m5.x, TEXCOORD2.z, fma(cb3._m1.x, TEXCOORD2.x, _502)) + cb3._m7.x;
        precise float _527 = fma(cb3._m5.y, TEXCOORD2.z, fma(cb3._m1.y, TEXCOORD2.x, _503)) + cb3._m7.y;
        precise float _528 = fma(cb3._m5.z, TEXCOORD2.z, fma(cb3._m1.z, TEXCOORD2.x, _504)) + cb3._m7.z;
        precise float _537 = (_496 ? _526 : TEXCOORD2.x) - cb3._m11.x;
        precise float _538 = (_496 ? _527 : TEXCOORD2.y) - cb3._m11.y;
        precise float _539 = (_496 ? _528 : TEXCOORD2.z) - cb3._m11.z;
        precise float _545 = _537 * cb3._m9.x;
        precise float _546 = _538 * cb3._m9.y;
        precise float _547 = _539 * cb3._m9.z;
        precise float _548 = _545 * 0.25;
        precise float _551 = cb3._m0.z * 0.5;
        precise float _555 = spvNMin(fma(-cb3._m0.z, 0.5, 0.25), spvNMax(_548, _551));
        precise float _562 = _555 + 0.25;
        precise float _563 = _546 + 0.0;
        precise float _564 = _547 + 0.0;
        precise float _568 = _555 + 0.5;
        _586 = dp4_f32(texture(sampler3D(t4, s0), vec3(_568, _563, _564)), _490);
        _587 = dp4_f32(texture(sampler3D(t4, s0), vec3(_562, _563, _564)), _490);
        _588 = dp4_f32(texture(sampler3D(t4, s0), vec3(_555, _546, _547)), _490);
    }
    else
    {
        _586 = dp4_f32(cb2._m41, _490);
        _587 = dp4_f32(cb2._m40, _490);
        _588 = dp4_f32(cb2._m39, _490);
    }
    precise float _595 = _588 + TEXCOORD5.x;
    precise float _596 = _587 + TEXCOORD5.y;
    precise float _597 = _586 + TEXCOORD5.z;
    precise float _601 = _477 - 0.039999999105930328369140625;
    precise float _602 = _478 - 0.039999999105930328369140625;
    precise float _603 = _479 - 0.039999999105930328369140625;
    SV_Target1.x = fma(cb0._m4.y, _601, 0.039999999105930328369140625);
    SV_Target1.y = fma(cb0._m4.y, _602, 0.039999999105930328369140625);
    SV_Target1.z = fma(cb0._m4.y, _603, 0.039999999105930328369140625);
    precise float _614 = fma(-cb0._m4.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _615 = _614 * _477;
    precise float _616 = _614 * _478;
    precise float _617 = _614 * _479;
    precise float _618 = spvNMax(_595, 0.0) * _615;
    precise float _619 = spvNMax(_596, 0.0) * _616;
    precise float _620 = spvNMax(_597, 0.0) * _617;
    SV_Target3.x = exp2(-_618);
    SV_Target3.y = exp2(-_619);
    SV_Target3.z = exp2(-_620);
    SV_Target.x = _615;
    SV_Target.y = _616;
    SV_Target.z = _617;
    SV_Target.w = 1.0;
    SV_Target1.w = cb0._m4.x;
    SV_Target2.x = fma(TEXCOORD1.x, 0.5, 0.5);
    SV_Target2.y = fma(TEXCOORD1.y, 0.5, 0.5);
    SV_Target2.z = fma(TEXCOORD1.z, 0.5, 0.5);
    SV_Target2.w = 1.0;
    SV_Target3.w = 1.0;
}

