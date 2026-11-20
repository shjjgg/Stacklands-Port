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
    vec4 _m6;
    vec4 _m7;
    vec3 _m8;
    float _m9;
    vec4 _m10;
    vec3 _m11;
    uint _m12;
    vec2 _m13;
    uvec2 _m14;
    vec4 _m15;
    uvec4 _m16;
    vec4 _m17;
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
} cb2;

layout(set = 0, binding = 3) uniform sampler s0;
layout(set = 0, binding = 4) uniform sampler s1;
layout(set = 0, binding = 5) uniform sampler s2;
layout(set = 0, binding = 6) uniform texture2D t0;
layout(set = 0, binding = 7) uniform texture2D t1;
layout(set = 0, binding = 8) uniform texture3D t2;

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

float dp2_f32(vec2 a, vec2 b)
{
    precise float _119 = a.x * b.x;
    return fma(a.y, b.y, _119);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _102 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _102)));
}

float dp3_f32(vec3 a, vec3 b)
{
    precise float _87 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _87));
}

void main()
{
    precise float _129 = TEXCOORD1.x * 1000.0;
    precise float _132 = sin(roundEven(_129)) * 43758.546875;
    precise float _134 = fract(_132) - 0.5;
    precise float _139 = _134 * cb0._m17.z;
    precise float _142 = fma(_139, 0.004999999888241291046142578125, TEXCOORD1.z);
    precise float _143 = _142 * 500.0;
    precise float _146 = sin(roundEven(_143)) * 43758.546875;
    precise float _148 = fract(_146) - 0.5;
    precise float _149 = _148 * cb0._m17.z;
    precise float _150 = fma(_149, 0.004999999888241291046142578125, TEXCOORD1.x);
    precise float _155 = cb0._m15.x - cb0._m13.x;
    precise float _156 = fma(_155, 0.5, cb0._m13.x);
    float _162;
    float _167;
    _162 = 0.0;
    _167 = 100000.0;
    float _163;
    precise float _166;
    float _168;
    uint _170;
    float _165 = 0.0;
    uint _169 = 0u;
    for (;;)
    {
        if (int(_169) >= 3)
        {
            break;
        }
        bool _184 = _169 == 0u;
        float _190 = _184 ? cb0._m13.x : (((_169 >= 1u) && (_169 < 3u)) ? _156 : cb0._m15.x);
        float _191 = _184 ? cb0._m13.y : ((_169 == 1u) ? cb0._m13.y : cb0._m15.y);
        _170 = _169 + 1u;
        precise float _198 = (((_170 < 3u) && (_170 >= 1u)) ? _156 : cb0._m15.x) - _190;
        precise float _199 = ((_170 == 1u) ? cb0._m13.y : cb0._m15.y) - _191;
        precise float _200 = _150 - _190;
        precise float _201 = _142 - _191;
        vec2 _202 = vec2(_200, _201);
        vec2 _203 = vec2(_198, _199);
        float _205 = dp2_f32(_203, _203);
        precise float _206 = dp2_f32(_202, _203) / _205;
        precise float _207 = spvNClamp(_206, 0.0, 1.0);
        precise float _213 = -_207;
        vec2 _216 = vec2(fma(_213, _198, _200), fma(_213, _199, _201));
        precise float _219 = sqrt(dp2_f32(_216, _216)) * ((dp2_f32(vec2(_199, -_198), _202) > 0.0) ? 1.0 : (-1.0));
        precise float _220 = sqrt(_205);
        bool _223 = abs(_219) < abs(_167);
        _163 = _223 ? fma(_207, _220, _165) : _162;
        _168 = _223 ? _219 : _167;
        _166 = _165 + _220;
        _162 = _163;
        _165 = _166;
        _167 = _168;
        _169 = _170;
        continue;
    }
    precise float _225 = abs(_167);
    precise float _230 = abs(dFdx(_225)) + abs(dFdy(_225));
    precise float _231 = _162 * 3.5;
    bool _233 = fract(_231) > 0.800000011920928955078125;
    precise float _234 = _225 * 0.800000011920928955078125;
    float _236 = _233 ? _234 : _225;
    precise float _241 = cb0._m17.y + cb0._m17.x;
    precise float _242 = -_230;
    precise float _243 = fma(_242, 0.5, _241);
    precise float _244 = _236 - _243;
    precise float _246 = fma(_230, 0.5, _241) - _243;
    precise float _247 = _244 / _246;
    precise float _248 = spvNClamp(_247, 0.0, 1.0);
    float _260 = _233 ? cb0._m11.x : cb0._m8.x;
    float _261 = _233 ? cb0._m11.y : cb0._m8.y;
    float _262 = _233 ? cb0._m11.z : cb0._m8.z;
    precise float _263 = _241 * 0.300000011920928955078125;
    precise float _264 = _241 * 0.800000011920928955078125;
    precise float _265 = _241 * 0.5;
    precise float _266 = _241 * 1.10000002384185791015625;
    precise float _267 = -_167;
    precise float _276 = _260 * cb0._m17.w;
    precise float _277 = _261 * cb0._m17.w;
    precise float _278 = _262 * cb0._m17.w;
    bool _281 = (_233 && ((_267 < _266) && (_265 < _267))) || (((_263 < _267) && (_267 < _264)) && (!_233));
    float _282 = _281 ? _276 : _260;
    float _283 = _281 ? _277 : _261;
    float _284 = _281 ? _278 : _262;
    precise float _294 = cb0._m10.x - _282;
    precise float _295 = cb0._m10.y - _283;
    precise float _296 = cb0._m10.z - _284;
    precise float _297 = cb0._m10.w - cb0._m9;
    precise float _298 = fma(_248, _294, _282);
    precise float _299 = fma(_248, _295, _283);
    precise float _300 = fma(_248, _296, _284);
    precise float _301 = fma(_248, _297, cb0._m9);
    precise float _302 = fma(cb0._m17.y, 2.0, cb0._m17.x);
    precise float _303 = fma(_242, 0.5, _302);
    precise float _305 = _236 - _303;
    precise float _306 = fma(_230, 0.5, _302) - _303;
    precise float _307 = _305 / _306;
    precise float _308 = spvNClamp(_307, 0.0, 1.0);
    precise float _325 = TEXCOORD1.y * cb0._m5.x;
    precise float _326 = TEXCOORD1.y * cb0._m5.y;
    precise float _327 = TEXCOORD1.y * cb0._m5.z;
    precise float _328 = TEXCOORD1.y * cb0._m5.w;
    precise float _355 = fma(cb0._m6.x, TEXCOORD1.z, fma(cb0._m4.x, TEXCOORD1.x, _325)) + cb0._m7.x;
    precise float _356 = fma(cb0._m6.y, TEXCOORD1.z, fma(cb0._m4.y, TEXCOORD1.x, _326)) + cb0._m7.y;
    precise float _357 = fma(cb0._m6.z, TEXCOORD1.z, fma(cb0._m4.z, TEXCOORD1.x, _327)) + cb0._m7.z;
    precise float _358 = fma(cb0._m6.w, TEXCOORD1.z, fma(cb0._m4.w, TEXCOORD1.x, _328)) + cb0._m7.w;
    float _434;
    float _435;
    float _436;
    float _437;
    if (cb2._m0.x == 1.0)
    {
        bool _367 = cb2._m0.y == 1.0;
        precise float _373 = TEXCOORD1.y * cb2._m3.x;
        precise float _374 = TEXCOORD1.y * cb2._m3.y;
        precise float _375 = TEXCOORD1.y * cb2._m3.z;
        precise float _397 = fma(cb2._m5.x, TEXCOORD1.z, fma(cb2._m1.x, TEXCOORD1.x, _373)) + cb2._m7.x;
        precise float _398 = fma(cb2._m5.y, TEXCOORD1.z, fma(cb2._m1.y, TEXCOORD1.x, _374)) + cb2._m7.y;
        precise float _399 = fma(cb2._m5.z, TEXCOORD1.z, fma(cb2._m1.z, TEXCOORD1.x, _375)) + cb2._m7.z;
        precise float _408 = (_367 ? _397 : TEXCOORD1.x) - cb2._m11.x;
        precise float _409 = (_367 ? _398 : TEXCOORD1.y) - cb2._m11.y;
        precise float _410 = (_367 ? _399 : TEXCOORD1.z) - cb2._m11.z;
        precise float _416 = _408 * cb2._m9.x;
        precise float _417 = _409 * cb2._m9.y;
        precise float _418 = _410 * cb2._m9.z;
        vec4 _429 = texture(sampler3D(t2, s0), vec3(spvNMax(fma(_416, 0.25, 0.75), fma(cb2._m0.z, 0.5, 0.75)), _417, _418));
        _434 = _429.w;
        _435 = _429.z;
        _436 = _429.y;
        _437 = _429.x;
    }
    else
    {
        _434 = 1.0;
        _435 = 1.0;
        _436 = 1.0;
        _437 = 1.0;
    }
    precise float _446 = _355 / _358;
    precise float _447 = _356 / _358;
    precise float _448 = _446 + 0.5;
    precise float _449 = _447 + 0.5;
    precise float _457 = float(_357 > 0.0) * texture(sampler2D(t0, s1), vec2(_448, _449)).w;
    vec3 _458 = vec3(_355, _356, _357);
    precise float _466 = _457 * texture(sampler2D(t1, s2), vec2(dp3_f32(_458, _458))).x;
    precise float _467 = spvNClamp(dp4_f32(vec4(_437, _436, _435, _434), cb1._m46), 0.0, 1.0) * _466;
    precise float _468 = fma(_308, -_298, _298) * _467;
    precise float _469 = fma(_308, -_299, _299) * _467;
    precise float _470 = fma(_308, -_300, _300) * _467;
    precise float _477 = _468 * cb0._m2.x;
    precise float _478 = _469 * cb0._m2.y;
    precise float _479 = _470 * cb0._m2.z;
    precise float _480 = fma(_308, -_301, _301) * cb0._m2.w;
    SV_Target.x = _477;
    SV_Target.y = _478;
    SV_Target.z = _479;
    SV_Target.w = _480;
}

