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
    vec4 _m6;
    vec4 _m7;
    vec4 _m8;
    uvec4 _m9;
    vec3 _m10;
    uint _m11;
    vec3 _m12;
    uint _m13;
    vec3 _m14;
    uint _m15;
    vec3 _m16;
    uint _m17;
    uvec4 _m18;
    vec4 _m19;
    vec4 _m20;
    uvec4 _m21;
    vec4 _m22;
} cb0;

layout(set = 0, binding = 1, std140) uniform cb1_buf
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
    uvec4 _m39;
    uvec4 _m40;
    uvec4 _m41;
    uvec4 _m42;
    uvec4 _m43;
    uvec4 _m44;
    uvec4 _m45;
    vec4 _m46;
} cb1;

layout(set = 0, binding = 2, std140) uniform cb2_buf
{
    uvec4 _m0;
    uvec4 _m1;
    uvec4 _m2;
    vec4 _m3;
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
layout(set = 0, binding = 8) uniform texture2D t0;
layout(set = 0, binding = 9) uniform texture2D t1;
layout(set = 0, binding = 10) uniform texture2D t2;
layout(set = 0, binding = 11) uniform texture3D t3;

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
    precise float _109 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _109));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _91 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _91)));
}

void main()
{
    precise float _125 = cb0._m19.y + cb0._m20.x;
    precise float _128 = fma(cb0._m19.y, 0.579999983310699462890625, cb0._m20.z);
    precise float _139 = TEXCOORD1.x - cb2._m3.x;
    precise float _140 = TEXCOORD1.z - cb2._m3.z;
    precise float _141 = _139 * 600.0;
    precise float _144 = sin(roundEven(_141)) * 43758.546875;
    precise float _146 = fract(_144) - 0.5;
    precise float _147 = fma(_146, 0.004999999888241291046142578125, _140);
    precise float _148 = _147 * 300.0;
    precise float _151 = sin(roundEven(_148)) * 43758.546875;
    precise float _153 = fract(_151) - 0.5;
    precise float _154 = fma(_153, 0.004999999888241291046142578125, _139);
    precise float _155 = _154 * 1.5;
    precise float _156 = _147 * 1.5;
    precise float _157 = _154 * 600.0;
    vec4 _164 = texture(sampler2D(t0, s3), vec2(_155, _156));
    precise float _175 = abs(_154);
    precise float _176 = abs(TEXCOORD1.y);
    precise float _177 = abs(_147);
    precise float _178 = _175 - _125;
    precise float _179 = _176 - cb0._m20.y;
    precise float _180 = _177 - _128;
    vec3 _184 = vec3(spvNMax(_178, 0.0), spvNMax(_179, 0.0), spvNMax(_180, 0.0));
    precise float _189 = sqrt(dp3_f32(_184, _184)) - cb0._m20.w;
    precise float _190 = 1.0 - _189;
    precise float _191 = _125 + 0.02999999932944774627685546875;
    precise float _192 = cb0._m20.y + 0.02999999932944774627685546875;
    precise float _193 = _128 + 0.02999999932944774627685546875;
    precise float _194 = cb0._m20.w + 0.02999999932944774627685546875;
    precise float _195 = _175 - _191;
    precise float _196 = _176 - _192;
    precise float _197 = _177 - _193;
    vec3 _201 = vec3(spvNMax(_195, 0.0), spvNMax(_196, 0.0), spvNMax(_197, 0.0));
    precise float _204 = sqrt(dp3_f32(_201, _201)) - _194;
    precise float _205 = 1.0 - _204;
    precise float _208 = sin(roundEven(_157)) * 43758.546875;
    precise float _210 = fract(_208) - 0.5;
    precise float _212 = fma(_210, 0.00200000009499490261077880859375, TEXCOORD1.z);
    precise float _213 = fma(_153, 0.00200000009499490261077880859375, TEXCOORD1.x);
    precise float _214 = 1.0 - _205;
    float _217 = float(_214 <= 0.5);
    precise float _224 = 1.0 - cb0._m10.x;
    precise float _225 = 1.0 - cb0._m10.y;
    precise float _226 = 1.0 - cb0._m10.z;
    precise float _227 = fma(_217, _224, cb0._m10.x);
    precise float _228 = fma(_217, _225, cb0._m10.y);
    precise float _229 = fma(_217, _226, cb0._m10.z);
    precise float _234 = abs(dFdy(_190)) + abs(dFdx(_190));
    precise float _235 = -_234;
    precise float _236 = fma(_235, 0.5, 0.5);
    precise float _238 = _190 - _236;
    precise float _240 = fma(_234, 0.5, -_236) + 0.5;
    precise float _241 = _238 / _240;
    precise float _242 = spvNClamp(_241, 0.0, 1.0);
    precise float _254 = fma(_242, fma(cb0._m12.x, spvNClamp(_164.x, 0.0, 1.0), -_227), _227);
    precise float _255 = fma(_242, fma(cb0._m12.y, spvNClamp(_164.y, 0.0, 1.0), -_228), _228);
    precise float _256 = fma(_242, fma(cb0._m12.z, spvNClamp(_164.z, 0.0, 1.0), -_229), _229);
    precise float _257 = _128 - 0.89999997615814208984375;
    precise float _258 = _128 - 0.90999996662139892578125;
    precise float _259 = _128 - 0.88999998569488525390625;
    float _263 = float(_190 >= 0.5);
    precise float _264 = _263 * float(fma(_210, 0.004999999888241291046142578125, TEXCOORD1.z) >= _257);
    precise float _270 = cb0._m16.x - _254;
    precise float _271 = cb0._m16.y - _255;
    precise float _272 = cb0._m16.z - _256;
    precise float _273 = fma(_264, _270, _254);
    precise float _274 = fma(_264, _271, _255);
    precise float _275 = fma(_264, _272, _256);
    precise float _280 = abs(dFdy(_213)) + abs(dFdx(_213));
    precise float _281 = _212 - _258;
    precise float _282 = _212 - _259;
    precise float _283 = _281 / _280;
    precise float _284 = _282 / _280;
    precise float _287 = 1.0 - spvNClamp(_284, 0.0, 1.0);
    precise float _288 = _287 * spvNClamp(_283, 0.0, 1.0);
    precise float _289 = _263 * _288;
    precise float _293 = fma(_289, -_273, _273);
    precise float _294 = fma(_289, -_274, _274);
    precise float _295 = fma(_289, -_275, _275);
    precise float _298 = 0.5 - cb0._m22.x;
    precise float _299 = fma(_235, 0.5, _298);
    precise float _300 = _190 - _299;
    precise float _302 = fma(_234, 0.5, _298) - _299;
    precise float _303 = _300 / _302;
    precise float _305 = 1.0 - _190;
    precise float _306 = _305 - _299;
    precise float _307 = _306 / _302;
    precise float _309 = spvNClamp(_307, 0.0, 1.0) * spvNClamp(_303, 0.0, 1.0);
    precise float _315 = cb0._m14.x - _293;
    precise float _316 = cb0._m14.y - _294;
    precise float _317 = cb0._m14.z - _295;
    precise float _328 = TEXCOORD1.y * cb0._m6.x;
    precise float _329 = TEXCOORD1.y * cb0._m6.y;
    precise float _330 = TEXCOORD1.y * cb0._m6.z;
    precise float _331 = TEXCOORD1.y * cb0._m6.w;
    precise float _358 = fma(cb0._m7.x, TEXCOORD1.z, fma(cb0._m5.x, TEXCOORD1.x, _328)) + cb0._m8.x;
    precise float _359 = fma(cb0._m7.y, TEXCOORD1.z, fma(cb0._m5.y, TEXCOORD1.x, _329)) + cb0._m8.y;
    precise float _360 = fma(cb0._m7.z, TEXCOORD1.z, fma(cb0._m5.z, TEXCOORD1.x, _330)) + cb0._m8.z;
    precise float _361 = fma(cb0._m7.w, TEXCOORD1.z, fma(cb0._m5.w, TEXCOORD1.x, _331)) + cb0._m8.w;
    float _437;
    float _438;
    float _439;
    float _440;
    if (cb3._m0.x == 1.0)
    {
        bool _370 = cb3._m0.y == 1.0;
        precise float _376 = TEXCOORD1.y * cb3._m3.x;
        precise float _377 = TEXCOORD1.y * cb3._m3.y;
        precise float _378 = TEXCOORD1.y * cb3._m3.z;
        precise float _400 = fma(cb3._m5.x, TEXCOORD1.z, fma(cb3._m1.x, TEXCOORD1.x, _376)) + cb3._m7.x;
        precise float _401 = fma(cb3._m5.y, TEXCOORD1.z, fma(cb3._m1.y, TEXCOORD1.x, _377)) + cb3._m7.y;
        precise float _402 = fma(cb3._m5.z, TEXCOORD1.z, fma(cb3._m1.z, TEXCOORD1.x, _378)) + cb3._m7.z;
        precise float _411 = (_370 ? _400 : TEXCOORD1.x) - cb3._m11.x;
        precise float _412 = (_370 ? _401 : TEXCOORD1.y) - cb3._m11.y;
        precise float _413 = (_370 ? _402 : TEXCOORD1.z) - cb3._m11.z;
        precise float _419 = _411 * cb3._m9.x;
        precise float _420 = _412 * cb3._m9.y;
        precise float _421 = _413 * cb3._m9.z;
        vec4 _432 = texture(sampler3D(t3, s0), vec3(spvNMax(fma(_419, 0.25, 0.75), fma(cb3._m0.z, 0.5, 0.75)), _420, _421));
        _437 = _432.w;
        _438 = _432.z;
        _439 = _432.y;
        _440 = _432.x;
    }
    else
    {
        _437 = 1.0;
        _438 = 1.0;
        _439 = 1.0;
        _440 = 1.0;
    }
    precise float _449 = _358 / _361;
    precise float _450 = _359 / _361;
    precise float _451 = _449 + 0.5;
    precise float _452 = _450 + 0.5;
    precise float _459 = float(_360 > 0.0) * texture(sampler2D(t1, s1), vec2(_451, _452)).w;
    vec3 _460 = vec3(_358, _359, _360);
    precise float _468 = _459 * texture(sampler2D(t2, s2), vec2(dp3_f32(_460, _460))).x;
    precise float _469 = spvNClamp(dp4_f32(vec4(_440, _439, _438, _437), cb1._m46), 0.0, 1.0) * _468;
    precise float _470 = _469 * fma(_309, _315, _293);
    precise float _471 = _469 * fma(_309, _316, _294);
    precise float _472 = _469 * fma(_309, _317, _295);
    precise float _478 = _470 * cb0._m2.x;
    precise float _479 = _471 * cb0._m2.y;
    precise float _480 = _472 * cb0._m2.z;
    SV_Target.x = _478;
    SV_Target.y = _479;
    SV_Target.z = _480;
    SV_Target.w = 1.0;
}

