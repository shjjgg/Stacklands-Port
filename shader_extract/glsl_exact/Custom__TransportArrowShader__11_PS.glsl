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
    vec2 _m8;
    uvec2 _m9;
    vec2 _m10;
    uvec2 _m11;
    vec2 _m12;
    uvec2 _m13;
    vec4 _m14;
    vec4 _m15;
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
layout(set = 0, binding = 4) uniform texture3D t0;

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
    precise float _117 = _112 * cb0._m14.z;
    precise float _120 = fma(_117, 0.004999999888241291046142578125, TEXCOORD1.z);
    precise float _121 = _120 * 500.0;
    precise float _124 = sin(roundEven(_121)) * 43758.546875;
    precise float _126 = fract(_124) - 0.5;
    precise float _127 = _126 * cb0._m14.z;
    precise float _128 = fma(_127, 0.004999999888241291046142578125, TEXCOORD1.x);
    float _130;
    float _135;
    _130 = 0.0;
    _135 = 100000.0;
    float _131;
    precise float _134;
    float _136;
    precise float _138;
    float _133 = 0.0;
    float _137 = 0.0;
    for (;;)
    {
        if (_137 > 1.0)
        {
            break;
        }
        precise float _145 = spvNMin(_137, 1.0);
        precise float _146 = 1.0 - _145;
        precise float _147 = _146 * _146;
        float _150 = dp2_f32(vec2(_145), vec2(_146));
        precise float _156 = _150 * cb0._m12.x;
        precise float _157 = _150 * cb0._m12.y;
        precise float _164 = _145 * _145;
        precise float _169 = fma(_164, cb0._m10.x, fma(_147, cb0._m8.x, _156));
        precise float _170 = fma(_164, cb0._m10.y, fma(_147, cb0._m8.y, _157));
        _138 = _137 + 0.100000001490116119384765625;
        precise float _171 = spvNMin(_138, 1.0);
        precise float _172 = 1.0 - _171;
        precise float _173 = _172 * _172;
        float _176 = dp2_f32(vec2(_171), vec2(_172));
        precise float _177 = _176 * cb0._m12.x;
        precise float _178 = _176 * cb0._m12.y;
        precise float _181 = _171 * _171;
        precise float _184 = fma(_181, cb0._m10.x, fma(_173, cb0._m8.x, _177)) - _169;
        precise float _185 = fma(_181, cb0._m10.y, fma(_173, cb0._m8.y, _178)) - _170;
        precise float _186 = _128 - _169;
        precise float _187 = _120 - _170;
        vec2 _188 = vec2(_186, _187);
        vec2 _189 = vec2(_184, _185);
        float _191 = dp2_f32(_189, _189);
        precise float _192 = dp2_f32(_188, _189) / _191;
        precise float _193 = spvNClamp(_192, 0.0, 1.0);
        precise float _199 = -_193;
        vec2 _202 = vec2(fma(_199, _184, _186), fma(_199, _185, _187));
        precise float _205 = sqrt(dp2_f32(_202, _202)) * ((dp2_f32(vec2(_185, -_184), _188) > 0.0) ? 1.0 : (-1.0));
        precise float _206 = sqrt(_191);
        bool _209 = abs(_205) < abs(_135);
        _131 = _209 ? fma(_193, _206, _133) : _130;
        _136 = _209 ? _205 : _135;
        _134 = _206 + _133;
        _130 = _131;
        _133 = _134;
        _135 = _136;
        _137 = _138;
        continue;
    }
    precise float _211 = abs(_135);
    precise float _216 = abs(dFdx(_211)) + abs(dFdy(_211));
    precise float _217 = _130 * 8.0;
    precise float _218 = _130 * 2.5;
    precise float _220 = fract(_218);
    precise float _224 = cb0._m14.x * 0.5;
    bool _226 = (fract(_217) > 0.800000011920928955078125) && (_211 < _224);
    float _246 = (_218 >= 0.0) ? _220 : (-_220);
    precise float _247 = _246 * 4.0;
    precise float _250 = cb0._m15.x * 0.5;
    precise float _257 = ((_135 < 0.0) ? fma(-_246, 4.0, 4.0) : _247) - fma(fract(_250), 4.0, 2.0);
    precise float _258 = _257 + 4.0;
    bool _266 = ((spvNMin(abs(_258), abs(_257)) < 0.300000011920928955078125) && (_211 > 0.00999999977648258209228515625)) && (_211 < 0.02999999932944774627685546875);
    float _273 = _266 ? cb0._m7.x : (_226 ? cb0._m6.x : cb0._m4.x);
    float _274 = _266 ? cb0._m7.y : (_226 ? cb0._m6.y : cb0._m4.y);
    float _275 = _266 ? cb0._m7.z : (_226 ? cb0._m6.z : cb0._m4.z);
    float _276 = _266 ? cb0._m7.w : (_226 ? cb0._m6.w : cb0._m4.w);
    precise float _279 = cb0._m14.y + cb0._m14.x;
    precise float _280 = -_216;
    precise float _281 = fma(_280, 0.5, _279);
    precise float _282 = _211 - _281;
    precise float _284 = fma(_216, 0.5, _279) - _281;
    precise float _285 = _282 / _284;
    precise float _286 = spvNClamp(_285, 0.0, 1.0);
    precise float _293 = cb0._m5.x - _273;
    precise float _294 = cb0._m5.y - _274;
    precise float _295 = cb0._m5.z - _275;
    precise float _296 = cb0._m5.w - _276;
    precise float _297 = fma(_286, _293, _273);
    precise float _298 = fma(_286, _294, _274);
    precise float _299 = fma(_286, _295, _275);
    precise float _300 = fma(_286, _296, _276);
    precise float _301 = fma(cb0._m14.y, 2.0, cb0._m14.x);
    precise float _302 = fma(_280, 0.5, _301);
    precise float _304 = _211 - _302;
    precise float _305 = fma(_216, 0.5, _301) - _302;
    precise float _306 = _304 / _305;
    precise float _307 = spvNClamp(_306, 0.0, 1.0);
    float _394;
    float _395;
    float _396;
    float _397;
    if (cb2._m0.x == 1.0)
    {
        bool _324 = cb2._m0.y == 1.0;
        precise float _333 = TEXCOORD1.y * cb2._m3.x;
        precise float _334 = TEXCOORD1.y * cb2._m3.y;
        precise float _335 = TEXCOORD1.y * cb2._m3.z;
        precise float _357 = fma(cb2._m5.x, TEXCOORD1.z, fma(cb2._m1.x, TEXCOORD1.x, _333)) + cb2._m7.x;
        precise float _358 = fma(cb2._m5.y, TEXCOORD1.z, fma(cb2._m1.y, TEXCOORD1.x, _334)) + cb2._m7.y;
        precise float _359 = fma(cb2._m5.z, TEXCOORD1.z, fma(cb2._m1.z, TEXCOORD1.x, _335)) + cb2._m7.z;
        precise float _368 = (_324 ? _357 : TEXCOORD1.x) - cb2._m11.x;
        precise float _369 = (_324 ? _358 : TEXCOORD1.y) - cb2._m11.y;
        precise float _370 = (_324 ? _359 : TEXCOORD1.z) - cb2._m11.z;
        precise float _376 = _368 * cb2._m9.x;
        precise float _377 = _369 * cb2._m9.y;
        precise float _378 = _370 * cb2._m9.z;
        vec4 _389 = texture(sampler3D(t0, s0), vec3(spvNMax(fma(_376, 0.25, 0.75), fma(cb2._m0.z, 0.5, 0.75)), _377, _378));
        _394 = _389.w;
        _395 = _389.z;
        _396 = _389.y;
        _397 = _389.x;
    }
    else
    {
        _394 = 1.0;
        _395 = 1.0;
        _396 = 1.0;
        _397 = 1.0;
    }
    precise float _403 = spvNClamp(dp4_f32(vec4(_397, _396, _395, _394), cb1._m46), 0.0, 1.0);
    precise float _404 = fma(_307, -_297, _297) * _403;
    precise float _405 = fma(_307, -_298, _298) * _403;
    precise float _406 = fma(_307, -_299, _299) * _403;
    precise float _413 = _404 * cb0._m2.x;
    precise float _414 = _405 * cb0._m2.y;
    precise float _415 = _406 * cb0._m2.z;
    precise float _416 = fma(_307, -_300, _300) * cb0._m2.w;
    SV_Target.x = _413;
    SV_Target.y = _414;
    SV_Target.z = _415;
    SV_Target.w = _416;
}

