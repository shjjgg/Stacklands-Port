#version 450
#extension GL_EXT_buffer_reference2 : require
#extension GL_EXT_spirv_intrinsics : require

layout(set = 0, binding = 0, std140) uniform cb0_buf
{
    uvec4 _m0;
    uvec4 _m1;
    vec4 _m2;
    uvec4 _m3;
    vec4 _m4;
    vec4 _m5;
    uvec4 _m6;
    vec2 _m7;
    uvec2 _m8;
    vec2 _m9;
    uvec2 _m10;
    vec2 _m11;
    uvec2 _m12;
    vec4 _m13;
    vec4 _m14;
} cb0;

layout(set = 0, binding = 1, std140) uniform cb1_buf
{
    vec4 m;
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
    uvec4 _m39;
    uvec4 _m40;
    uvec4 _m41;
    uvec4 _m42;
    uvec4 _m43;
    uvec4 _m44;
    uvec4 _m45;
    vec4 _m46;
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

layout(location = 2, component = 0) in vec3 TEXCOORD1;
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

float dp2_f32(vec2 a, vec2 b)
{
    precise float _96 = a.x * b.x;
    return fma(a.y, b.y, _96);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _78 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _78)));
}

void main()
{
    precise float _106 = TEXCOORD1.x * 1000.0;
    precise float _109 = sin(roundEven(_106)) * 43758.546875;
    precise float _111 = fract(_109) - 0.5;
    precise float _116 = _111 * cb0._m13.w;
    precise float _119 = fma(_116, 0.004999999888241291046142578125, TEXCOORD1.z);
    precise float _120 = _119 * 500.0;
    precise float _121 = _119 * 10.0;
    precise float _125 = sin(roundEven(_120)) * 43758.546875;
    precise float _127 = fract(_125) - 0.5;
    precise float _128 = _127 * cb0._m13.w;
    precise float _133 = roundEven(_121) + cb1.m.x;
    precise float _134 = _133 * 250.0;
    precise float _137 = sin(roundEven(_134)) * 43758.546875;
    precise float _139 = fract(_137) - 0.5;
    precise float _140 = fma(_139, 0.004999999888241291046142578125, fma(_128, 0.004999999888241291046142578125, TEXCOORD1.x));
    precise float _141 = _140 * 10.0;
    precise float _143 = roundEven(_141) + cb1.m.x;
    precise float _144 = _143 * 250.0;
    precise float _147 = sin(roundEven(_144)) * 43758.546875;
    precise float _149 = fract(_147) - 0.5;
    precise float _150 = fma(_149, 0.004999999888241291046142578125, _119);
    float _152;
    float _157;
    _152 = 0.0;
    _157 = 100000.0;
    float _153;
    precise float _156;
    float _158;
    precise float _160;
    float _155 = 0.0;
    float _159 = 0.0;
    for (;;)
    {
        if (_159 > 1.0)
        {
            break;
        }
        precise float _167 = spvNMin(_159, 1.0);
        precise float _168 = 1.0 - _167;
        precise float _169 = _168 * _168;
        float _172 = dp2_f32(vec2(_167), vec2(_168));
        precise float _178 = _172 * cb0._m11.x;
        precise float _179 = _172 * cb0._m11.y;
        precise float _186 = _167 * _167;
        precise float _191 = fma(_186, cb0._m9.x, fma(_169, cb0._m7.x, _178));
        precise float _192 = fma(_186, cb0._m9.y, fma(_169, cb0._m7.y, _179));
        _160 = _159 + 0.100000001490116119384765625;
        precise float _193 = spvNMin(_160, 1.0);
        precise float _194 = 1.0 - _193;
        precise float _195 = _194 * _194;
        float _198 = dp2_f32(vec2(_193), vec2(_194));
        precise float _199 = _198 * cb0._m11.x;
        precise float _200 = _198 * cb0._m11.y;
        precise float _203 = _193 * _193;
        precise float _206 = fma(_203, cb0._m9.x, fma(_195, cb0._m7.x, _199)) - _191;
        precise float _207 = fma(_203, cb0._m9.y, fma(_195, cb0._m7.y, _200)) - _192;
        precise float _208 = _140 - _191;
        precise float _209 = _150 - _192;
        vec2 _210 = vec2(_208, _209);
        vec2 _211 = vec2(_206, _207);
        float _213 = dp2_f32(_211, _211);
        precise float _214 = dp2_f32(_210, _211) / _213;
        precise float _215 = spvNClamp(_214, 0.0, 1.0);
        precise float _221 = -_215;
        vec2 _224 = vec2(fma(_221, _206, _208), fma(_221, _207, _209));
        precise float _227 = sqrt(dp2_f32(_224, _224)) * ((dp2_f32(vec2(_207, -_206), _210) > 0.0) ? 1.0 : (-1.0));
        precise float _228 = sqrt(_213);
        bool _231 = abs(_227) < abs(_157);
        _153 = _231 ? fma(_215, _228, _155) : _152;
        _158 = _231 ? _227 : _157;
        _156 = _155 + _228;
        _152 = _153;
        _155 = _156;
        _157 = _158;
        _159 = _160;
        continue;
    }
    precise float _233 = _152 * 40.0;
    precise float _234 = sin(_233);
    precise float _246 = _140 - cb0._m9.x;
    precise float _247 = _150 - cb0._m9.y;
    vec2 _248 = vec2(_246, _247);
    precise float _251 = sqrt(dp2_f32(_248, _248)) - 0.02999999932944774627685546875;
    precise float _252 = abs(fma(_234, 0.0199999995529651641845703125, _157));
    float _254 = (cb0._m14.x > 0.5) ? spvNMin(_251, _252) : _252;
    precise float _259 = abs(dFdy(_254)) + abs(dFdx(_254));
    bool _262 = cb0._m14.y < 0.5;
    precise float _267 = cb0._m13.y + cb0._m13.x;
    precise float _268 = -_259;
    precise float _269 = fma(_268, 0.5, _267);
    precise float _270 = _254 - _269;
    precise float _272 = fma(_259, 0.5, _267) - _269;
    precise float _273 = _270 / _272;
    precise float _274 = spvNClamp(_273, 0.0, 1.0);
    precise float _288 = cb0._m5.x - cb0._m4.x;
    precise float _289 = cb0._m5.y - cb0._m4.y;
    precise float _290 = cb0._m5.z - cb0._m4.z;
    precise float _291 = cb0._m5.w - cb0._m4.w;
    precise float _292 = fma(_274, _288, cb0._m4.x);
    precise float _293 = fma(_274, _289, cb0._m4.y);
    precise float _294 = fma(_274, _290, cb0._m4.z);
    precise float _295 = fma(_274, _291, cb0._m4.w);
    bool _298 = fma(-_254, 40.0, -0.5) < cos(_233);
    precise float _299 = fma(_268, 0.5, cb0._m13.x);
    precise float _300 = _254 - _299;
    precise float _302 = fma(_259, 0.5, cb0._m13.x) - _299;
    precise float _303 = _300 / _302;
    precise float _304 = spvNClamp(_303, 0.0, 1.0);
    precise float _305 = cb0._m4.x - _292;
    precise float _306 = cb0._m4.y - _293;
    precise float _307 = cb0._m4.z - _294;
    precise float _308 = cb0._m4.w - _295;
    float _313 = _298 ? fma(_304, _305, _292) : _292;
    float _314 = _298 ? fma(_304, _306, _293) : _293;
    float _315 = _298 ? fma(_304, _307, _294) : _294;
    float _316 = _298 ? fma(_304, _308, _295) : _295;
    precise float _317 = fma(cb0._m13.y, 2.0, cb0._m13.x);
    precise float _318 = fma(_268, 0.5, _317);
    precise float _320 = _254 - _318;
    precise float _321 = fma(_259, 0.5, _317) - _318;
    precise float _322 = _320 / _321;
    precise float _324 = abs(fma(-_234, 0.0199999995529651641845703125, _157));
    precise float _325 = _324 - _269;
    precise float _326 = _325 / _272;
    precise float _327 = spvNClamp(_326, 0.0, 1.0);
    precise float _328 = cb0._m5.x - _313;
    precise float _329 = cb0._m5.y - _314;
    precise float _330 = cb0._m5.z - _315;
    precise float _331 = cb0._m5.w - _316;
    precise float _332 = fma(_327, _328, _313);
    precise float _333 = fma(_327, _329, _314);
    precise float _334 = fma(_327, _330, _315);
    precise float _335 = fma(_327, _331, _316);
    precise float _336 = _324 - _318;
    precise float _337 = _336 / _321;
    precise float _339 = spvNClamp(_337, 0.0, 1.0) * spvNClamp(_322, 0.0, 1.0);
    precise float _348 = fma(_304, _288, cb0._m4.x);
    precise float _349 = fma(_304, _289, cb0._m4.y);
    precise float _350 = fma(_304, _290, cb0._m4.z);
    precise float _351 = fma(_304, _291, cb0._m4.w);
    float _442;
    float _443;
    float _444;
    float _445;
    if (cb3._m0.x == 1.0)
    {
        bool _372 = cb3._m0.y == 1.0;
        precise float _381 = TEXCOORD1.y * cb3._m3.x;
        precise float _382 = TEXCOORD1.y * cb3._m3.y;
        precise float _383 = TEXCOORD1.y * cb3._m3.z;
        precise float _405 = fma(cb3._m5.x, TEXCOORD1.z, fma(cb3._m1.x, TEXCOORD1.x, _381)) + cb3._m7.x;
        precise float _406 = fma(cb3._m5.y, TEXCOORD1.z, fma(cb3._m1.y, TEXCOORD1.x, _382)) + cb3._m7.y;
        precise float _407 = fma(cb3._m5.z, TEXCOORD1.z, fma(cb3._m1.z, TEXCOORD1.x, _383)) + cb3._m7.z;
        precise float _416 = (_372 ? _405 : TEXCOORD1.x) - cb3._m11.x;
        precise float _417 = (_372 ? _406 : TEXCOORD1.y) - cb3._m11.y;
        precise float _418 = (_372 ? _407 : TEXCOORD1.z) - cb3._m11.z;
        precise float _424 = _416 * cb3._m9.x;
        precise float _425 = _417 * cb3._m9.y;
        precise float _426 = _418 * cb3._m9.z;
        vec4 _437 = texture(sampler3D(t0, s0), vec3(spvNMax(fma(_424, 0.25, 0.75), fma(cb3._m0.z, 0.5, 0.75)), _425, _426));
        _442 = _437.w;
        _443 = _437.z;
        _444 = _437.y;
        _445 = _437.x;
    }
    else
    {
        _442 = 1.0;
        _443 = 1.0;
        _444 = 1.0;
        _445 = 1.0;
    }
    precise float _451 = spvNClamp(dp4_f32(vec4(_445, _444, _443, _442), cb2._m46), 0.0, 1.0);
    precise float _452 = (_262 ? fma(_339, -_332, _332) : fma(_274, -_348, _348)) * _451;
    precise float _453 = (_262 ? fma(_339, -_333, _333) : fma(_274, -_349, _349)) * _451;
    precise float _454 = (_262 ? fma(_339, -_334, _334) : fma(_274, -_350, _350)) * _451;
    precise float _461 = _452 * cb0._m2.x;
    precise float _462 = _453 * cb0._m2.y;
    precise float _463 = _454 * cb0._m2.z;
    precise float _464 = (_262 ? fma(_339, -_335, _335) : fma(_274, -_351, _351)) * cb0._m2.w;
    SV_Target.x = _461;
    SV_Target.y = _462;
    SV_Target.z = _463;
    SV_Target.w = _464;
}

