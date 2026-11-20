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

float dp2_f32(vec2 a, vec2 b)
{
    precise float _97 = a.x * b.x;
    return fma(a.y, b.y, _97);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _79 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _79)));
}

void main()
{
    precise float _107 = TEXCOORD1.x * 1000.0;
    precise float _110 = sin(roundEven(_107)) * 43758.546875;
    precise float _112 = fract(_110) - 0.5;
    precise float _117 = _112 * cb0._m13.w;
    precise float _120 = fma(_117, 0.004999999888241291046142578125, TEXCOORD1.z);
    precise float _121 = _120 * 500.0;
    precise float _122 = _120 * 10.0;
    precise float _126 = sin(roundEven(_121)) * 43758.546875;
    precise float _128 = fract(_126) - 0.5;
    precise float _129 = _128 * cb0._m13.w;
    precise float _134 = roundEven(_122) + cb1.m.x;
    precise float _135 = _134 * 250.0;
    precise float _138 = sin(roundEven(_135)) * 43758.546875;
    precise float _140 = fract(_138) - 0.5;
    precise float _141 = fma(_140, 0.004999999888241291046142578125, fma(_129, 0.004999999888241291046142578125, TEXCOORD1.x));
    precise float _142 = _141 * 10.0;
    precise float _144 = roundEven(_142) + cb1.m.x;
    precise float _145 = _144 * 250.0;
    precise float _148 = sin(roundEven(_145)) * 43758.546875;
    precise float _150 = fract(_148) - 0.5;
    precise float _151 = fma(_150, 0.004999999888241291046142578125, _120);
    float _153;
    float _158;
    _153 = 0.0;
    _158 = 100000.0;
    float _154;
    precise float _157;
    float _159;
    precise float _161;
    float _156 = 0.0;
    float _160 = 0.0;
    for (;;)
    {
        if (_160 > 1.0)
        {
            break;
        }
        precise float _168 = spvNMin(_160, 1.0);
        precise float _169 = 1.0 - _168;
        precise float _170 = _169 * _169;
        float _173 = dp2_f32(vec2(_168), vec2(_169));
        precise float _179 = _173 * cb0._m11.x;
        precise float _180 = _173 * cb0._m11.y;
        precise float _187 = _168 * _168;
        precise float _192 = fma(_187, cb0._m9.x, fma(_170, cb0._m7.x, _179));
        precise float _193 = fma(_187, cb0._m9.y, fma(_170, cb0._m7.y, _180));
        _161 = _160 + 0.100000001490116119384765625;
        precise float _194 = spvNMin(_161, 1.0);
        precise float _195 = 1.0 - _194;
        precise float _196 = _195 * _195;
        float _199 = dp2_f32(vec2(_194), vec2(_195));
        precise float _200 = _199 * cb0._m11.x;
        precise float _201 = _199 * cb0._m11.y;
        precise float _204 = _194 * _194;
        precise float _207 = fma(_204, cb0._m9.x, fma(_196, cb0._m7.x, _200)) - _192;
        precise float _208 = fma(_204, cb0._m9.y, fma(_196, cb0._m7.y, _201)) - _193;
        precise float _209 = _141 - _192;
        precise float _210 = _151 - _193;
        vec2 _211 = vec2(_209, _210);
        vec2 _212 = vec2(_207, _208);
        float _214 = dp2_f32(_212, _212);
        precise float _215 = dp2_f32(_211, _212) / _214;
        precise float _216 = spvNClamp(_215, 0.0, 1.0);
        precise float _222 = -_216;
        vec2 _225 = vec2(fma(_222, _207, _209), fma(_222, _208, _210));
        precise float _228 = sqrt(dp2_f32(_225, _225)) * ((dp2_f32(vec2(_208, -_207), _211) > 0.0) ? 1.0 : (-1.0));
        precise float _229 = sqrt(_214);
        bool _232 = abs(_228) < abs(_158);
        _154 = _232 ? fma(_216, _229, _156) : _153;
        _159 = _232 ? _228 : _158;
        _157 = _156 + _229;
        _153 = _154;
        _156 = _157;
        _158 = _159;
        _160 = _161;
        continue;
    }
    precise float _234 = _153 * 40.0;
    precise float _235 = sin(_234);
    precise float _247 = _141 - cb0._m9.x;
    precise float _248 = _151 - cb0._m9.y;
    vec2 _249 = vec2(_247, _248);
    precise float _252 = sqrt(dp2_f32(_249, _249)) - 0.02999999932944774627685546875;
    precise float _253 = abs(fma(_235, 0.0199999995529651641845703125, _158));
    float _255 = (cb0._m14.x > 0.5) ? spvNMin(_252, _253) : _253;
    precise float _260 = abs(dFdy(_255)) + abs(dFdx(_255));
    bool _263 = cb0._m14.y < 0.5;
    precise float _268 = cb0._m13.y + cb0._m13.x;
    precise float _269 = -_260;
    precise float _270 = fma(_269, 0.5, _268);
    precise float _271 = _255 - _270;
    precise float _273 = fma(_260, 0.5, _268) - _270;
    precise float _274 = _271 / _273;
    precise float _275 = spvNClamp(_274, 0.0, 1.0);
    precise float _289 = cb0._m5.x - cb0._m4.x;
    precise float _290 = cb0._m5.y - cb0._m4.y;
    precise float _291 = cb0._m5.z - cb0._m4.z;
    precise float _292 = cb0._m5.w - cb0._m4.w;
    precise float _293 = fma(_275, _289, cb0._m4.x);
    precise float _294 = fma(_275, _290, cb0._m4.y);
    precise float _295 = fma(_275, _291, cb0._m4.z);
    precise float _296 = fma(_275, _292, cb0._m4.w);
    bool _299 = fma(-_255, 40.0, -0.5) < cos(_234);
    precise float _300 = fma(_269, 0.5, cb0._m13.x);
    precise float _301 = _255 - _300;
    precise float _303 = fma(_260, 0.5, cb0._m13.x) - _300;
    precise float _304 = _301 / _303;
    precise float _305 = spvNClamp(_304, 0.0, 1.0);
    precise float _306 = cb0._m4.x - _293;
    precise float _307 = cb0._m4.y - _294;
    precise float _308 = cb0._m4.z - _295;
    precise float _309 = cb0._m4.w - _296;
    float _314 = _299 ? fma(_305, _306, _293) : _293;
    float _315 = _299 ? fma(_305, _307, _294) : _294;
    float _316 = _299 ? fma(_305, _308, _295) : _295;
    float _317 = _299 ? fma(_305, _309, _296) : _296;
    precise float _318 = fma(cb0._m13.y, 2.0, cb0._m13.x);
    precise float _319 = fma(_269, 0.5, _318);
    precise float _321 = _255 - _319;
    precise float _322 = fma(_260, 0.5, _318) - _319;
    precise float _323 = _321 / _322;
    precise float _325 = abs(fma(-_235, 0.0199999995529651641845703125, _158));
    precise float _326 = _325 - _270;
    precise float _327 = _326 / _273;
    precise float _328 = spvNClamp(_327, 0.0, 1.0);
    precise float _329 = cb0._m5.x - _314;
    precise float _330 = cb0._m5.y - _315;
    precise float _331 = cb0._m5.z - _316;
    precise float _332 = cb0._m5.w - _317;
    precise float _333 = fma(_328, _329, _314);
    precise float _334 = fma(_328, _330, _315);
    precise float _335 = fma(_328, _331, _316);
    precise float _336 = fma(_328, _332, _317);
    precise float _337 = _325 - _319;
    precise float _338 = _337 / _322;
    precise float _340 = spvNClamp(_338, 0.0, 1.0) * spvNClamp(_323, 0.0, 1.0);
    precise float _349 = fma(_305, _289, cb0._m4.x);
    precise float _350 = fma(_305, _290, cb0._m4.y);
    precise float _351 = fma(_305, _291, cb0._m4.z);
    precise float _352 = fma(_305, _292, cb0._m4.w);
    float _361 = _263 ? fma(_340, -_333, _333) : fma(_275, -_349, _349);
    float _362 = _263 ? fma(_340, -_334, _334) : fma(_275, -_350, _350);
    float _363 = _263 ? fma(_340, -_335, _335) : fma(_275, -_351, _351);
    float _443;
    float _444;
    float _445;
    float _446;
    if (cb3._m0.x == 1.0)
    {
        bool _373 = cb3._m0.y == 1.0;
        precise float _382 = TEXCOORD1.y * cb3._m3.x;
        precise float _383 = TEXCOORD1.y * cb3._m3.y;
        precise float _384 = TEXCOORD1.y * cb3._m3.z;
        precise float _406 = fma(cb3._m5.x, TEXCOORD1.z, fma(cb3._m1.x, TEXCOORD1.x, _382)) + cb3._m7.x;
        precise float _407 = fma(cb3._m5.y, TEXCOORD1.z, fma(cb3._m1.y, TEXCOORD1.x, _383)) + cb3._m7.y;
        precise float _408 = fma(cb3._m5.z, TEXCOORD1.z, fma(cb3._m1.z, TEXCOORD1.x, _384)) + cb3._m7.z;
        precise float _417 = (_373 ? _406 : TEXCOORD1.x) - cb3._m11.x;
        precise float _418 = (_373 ? _407 : TEXCOORD1.y) - cb3._m11.y;
        precise float _419 = (_373 ? _408 : TEXCOORD1.z) - cb3._m11.z;
        precise float _425 = _417 * cb3._m9.x;
        precise float _426 = _418 * cb3._m9.y;
        precise float _427 = _419 * cb3._m9.z;
        vec4 _438 = texture(sampler3D(t0, s0), vec3(spvNMax(fma(_425, 0.25, 0.75), fma(cb3._m0.z, 0.5, 0.75)), _426, _427));
        _443 = _438.w;
        _444 = _438.z;
        _445 = _438.y;
        _446 = _438.x;
    }
    else
    {
        _443 = 1.0;
        _444 = 1.0;
        _445 = 1.0;
        _446 = 1.0;
    }
    precise float _452 = spvNClamp(dp4_f32(vec4(_446, _445, _444, _443), cb2._m46), 0.0, 1.0);
    precise float _459 = _361 * TEXCOORD2.x;
    precise float _460 = _362 * TEXCOORD2.y;
    precise float _461 = _363 * TEXCOORD2.z;
    precise float _462 = _361 * _452;
    precise float _463 = _362 * _452;
    precise float _464 = _363 * _452;
    SV_Target.x = fma(_462, cb0._m2.x, _459);
    SV_Target.y = fma(_463, cb0._m2.y, _460);
    SV_Target.z = fma(_464, cb0._m2.z, _461);
    SV_Target.w = fma(_263 ? fma(_340, -_336, _336) : fma(_275, -_352, _352), cb0._m2.w, 0.0);
}

