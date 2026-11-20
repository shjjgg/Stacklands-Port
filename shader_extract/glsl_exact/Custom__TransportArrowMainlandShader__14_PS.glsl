#version 450
#extension GL_EXT_buffer_reference2 : require
#extension GL_EXT_spirv_intrinsics : require

layout(set = 0, binding = 0, std140) uniform cb0_buf
{
    uvec4 _m0;
    uvec4 _m1;
    vec4 _m2;
    uvec4 _m3;
    vec2 _m4;
    uvec2 _m5;
    vec2 _m6;
    uvec2 _m7;
    vec2 _m8;
    uvec2 _m9;
    vec2 _m10;
    uvec2 _m11;
    vec4 _m12;
    vec4 _m13;
    vec4 _m14;
    vec2 _m15;
    uvec2 _m16;
    vec2 _m17;
    uvec2 _m18;
    vec2 _m19;
    uvec2 _m20;
    vec4 _m21;
    vec4 _m22;
    vec4 _m23;
    vec4 _m24;
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
layout(set = 0, binding = 5) uniform texture2D t0;
layout(set = 0, binding = 6) uniform texture3D t1;

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
    precise float _107 = a.x * b.x;
    return fma(a.y, b.y, _107);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _89 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _89)));
}

void main()
{
    precise float _117 = TEXCOORD1.x * 1000.0;
    precise float _120 = sin(roundEven(_117)) * 43758.546875;
    precise float _122 = fract(_120) - 0.5;
    precise float _127 = _122 * cb0._m21.z;
    precise float _130 = fma(_127, 0.004999999888241291046142578125, TEXCOORD1.z);
    precise float _131 = _130 * 500.0;
    precise float _134 = sin(roundEven(_131)) * 43758.546875;
    precise float _136 = fract(_134) - 0.5;
    precise float _137 = _136 * cb0._m21.z;
    precise float _138 = fma(_137, 0.004999999888241291046142578125, TEXCOORD1.x);
    float _140;
    float _145;
    _140 = 0.0;
    _145 = 100000.0;
    float _141;
    precise float _144;
    float _146;
    precise float _148;
    float _143 = 0.0;
    float _147 = 0.0;
    for (;;)
    {
        if (_147 > 1.0)
        {
            break;
        }
        precise float _155 = spvNMin(_147, 1.0);
        precise float _156 = 1.0 - _155;
        precise float _157 = _156 * _156;
        float _160 = dp2_f32(vec2(_155), vec2(_156));
        precise float _166 = _160 * cb0._m19.x;
        precise float _167 = _160 * cb0._m19.y;
        precise float _174 = _155 * _155;
        precise float _179 = fma(_174, cb0._m17.x, fma(_157, cb0._m15.x, _166));
        precise float _180 = fma(_174, cb0._m17.y, fma(_157, cb0._m15.y, _167));
        _148 = _147 + 0.100000001490116119384765625;
        precise float _181 = spvNMin(_148, 1.0);
        precise float _182 = 1.0 - _181;
        precise float _183 = _182 * _182;
        float _186 = dp2_f32(vec2(_181), vec2(_182));
        precise float _187 = _186 * cb0._m19.x;
        precise float _188 = _186 * cb0._m19.y;
        precise float _191 = _181 * _181;
        precise float _194 = fma(_191, cb0._m17.x, fma(_183, cb0._m15.x, _187)) - _179;
        precise float _195 = fma(_191, cb0._m17.y, fma(_183, cb0._m15.y, _188)) - _180;
        precise float _196 = _138 - _179;
        precise float _197 = _130 - _180;
        vec2 _198 = vec2(_196, _197);
        vec2 _199 = vec2(_194, _195);
        float _201 = dp2_f32(_199, _199);
        precise float _202 = dp2_f32(_198, _199) / _201;
        precise float _203 = spvNClamp(_202, 0.0, 1.0);
        precise float _209 = -_203;
        vec2 _212 = vec2(fma(_209, _194, _196), fma(_209, _195, _197));
        precise float _215 = sqrt(dp2_f32(_212, _212)) * ((dp2_f32(vec2(_195, -_194), _198) > 0.0) ? 1.0 : (-1.0));
        precise float _216 = sqrt(_201);
        bool _219 = abs(_215) < abs(_145);
        _141 = _219 ? fma(_203, _216, _143) : _140;
        _146 = _219 ? _215 : _145;
        _144 = _216 + _143;
        _140 = _141;
        _143 = _144;
        _145 = _146;
        _147 = _148;
        continue;
    }
    precise float _221 = abs(_145);
    precise float _226 = abs(dFdy(_221)) + abs(dFdx(_221));
    bool _229 = cb0._m22.y > 0.5;
    precise float _247 = _145 * 125.0;
    precise float _248 = _140 * 125.0;
    precise float _249 = _145 * 31250.0;
    precise float _252 = sin(roundEven(_249)) * 43758.546875;
    precise float _254 = fract(_252) - 0.5;
    precise float _257 = _254 * cb0._m22.x;
    precise float _258 = fma(_257, 0.004999999888241291046142578125, _248);
    precise float _259 = _258 * 250.0;
    precise float _262 = sin(roundEven(_259)) * 43758.546875;
    precise float _264 = fract(_262) - 0.5;
    precise float _265 = _264 * cb0._m22.x;
    precise float _267 = fma(_265, 0.004999999888241291046142578125, _247) * 0.800000011920928955078125;
    precise float _270 = sin(_258) * sin(_267);
    bool _271 = _270 > 0.1500000059604644775390625;
    float _282 = _271 ? (_229 ? cb0._m23.x : cb0._m14.x) : (_229 ? cb0._m23.x : cb0._m12.x);
    float _283 = _271 ? (_229 ? cb0._m23.y : cb0._m14.y) : (_229 ? cb0._m23.y : cb0._m12.y);
    float _284 = _271 ? (_229 ? cb0._m23.z : cb0._m14.z) : (_229 ? cb0._m23.z : cb0._m12.z);
    float _285 = _271 ? (_229 ? cb0._m23.w : cb0._m14.w) : (_229 ? cb0._m23.w : cb0._m12.w);
    precise float _290 = cb0._m21.y + cb0._m21.x;
    precise float _291 = -_226;
    precise float _292 = fma(_291, 0.5, _290);
    precise float _294 = fma(_226, 0.5, _290) - _292;
    precise float _295 = _221 - _292;
    precise float _296 = _295 / _294;
    precise float _297 = spvNClamp(_296, 0.0, 1.0);
    precise float _314 = (_229 ? cb0._m24.x : cb0._m13.x) - _282;
    precise float _315 = (_229 ? cb0._m24.y : cb0._m13.y) - _283;
    precise float _316 = (_229 ? cb0._m24.z : cb0._m13.z) - _284;
    precise float _317 = (_229 ? cb0._m24.w : cb0._m13.w) - _285;
    precise float _318 = fma(_297, _314, _282);
    precise float _319 = fma(_297, _315, _283);
    precise float _320 = fma(_297, _316, _284);
    precise float _321 = fma(_297, _317, _285);
    precise float _322 = fma(cb0._m21.y, 2.0, cb0._m21.x);
    precise float _323 = fma(_291, 0.5, _322);
    precise float _325 = fma(_226, 0.5, _322) - _323;
    precise float _326 = _221 - _323;
    precise float _327 = _326 / _325;
    precise float _328 = spvNClamp(_327, 0.0, 1.0);
    precise float _343 = TEXCOORD1.y * cb0._m6.x;
    precise float _344 = TEXCOORD1.y * cb0._m6.y;
    precise float _361 = fma(cb0._m8.x, TEXCOORD1.z, fma(cb0._m4.x, TEXCOORD1.x, _343)) + cb0._m10.x;
    precise float _362 = fma(cb0._m8.y, TEXCOORD1.z, fma(cb0._m4.y, TEXCOORD1.x, _344)) + cb0._m10.y;
    float _439;
    float _440;
    float _441;
    float _442;
    if (cb2._m0.x == 1.0)
    {
        bool _371 = cb2._m0.y == 1.0;
        precise float _378 = TEXCOORD1.y * cb2._m3.x;
        precise float _379 = TEXCOORD1.y * cb2._m3.y;
        precise float _380 = TEXCOORD1.y * cb2._m3.z;
        precise float _402 = fma(cb2._m5.x, TEXCOORD1.z, fma(cb2._m1.x, TEXCOORD1.x, _378)) + cb2._m7.x;
        precise float _403 = fma(cb2._m5.y, TEXCOORD1.z, fma(cb2._m1.y, TEXCOORD1.x, _379)) + cb2._m7.y;
        precise float _404 = fma(cb2._m5.z, TEXCOORD1.z, fma(cb2._m1.z, TEXCOORD1.x, _380)) + cb2._m7.z;
        precise float _413 = (_371 ? _402 : TEXCOORD1.x) - cb2._m11.x;
        precise float _414 = (_371 ? _403 : TEXCOORD1.y) - cb2._m11.y;
        precise float _415 = (_371 ? _404 : TEXCOORD1.z) - cb2._m11.z;
        precise float _421 = _413 * cb2._m9.x;
        precise float _422 = _414 * cb2._m9.y;
        precise float _423 = _415 * cb2._m9.z;
        vec4 _434 = texture(sampler3D(t1, s0), vec3(spvNMax(fma(cb2._m0.z, 0.5, 0.75), fma(_421, 0.25, 0.75)), _422, _423));
        _439 = _434.w;
        _440 = _434.z;
        _441 = _434.y;
        _442 = _434.x;
    }
    else
    {
        _439 = 1.0;
        _440 = 1.0;
        _441 = 1.0;
        _442 = 1.0;
    }
    precise float _456 = spvNClamp(dp4_f32(vec4(_442, _441, _440, _439), cb1._m46), 0.0, 1.0) * texture(sampler2D(t0, s1), vec2(_361, _362)).w;
    precise float _457 = fma(_328, -_318, _318) * _456;
    precise float _458 = fma(_328, -_319, _319) * _456;
    precise float _459 = fma(_328, -_320, _320) * _456;
    precise float _466 = _457 * cb0._m2.x;
    precise float _467 = _458 * cb0._m2.y;
    precise float _468 = _459 * cb0._m2.z;
    precise float _469 = fma(_328, -_321, _321) * cb0._m2.w;
    SV_Target.x = _466;
    SV_Target.y = _467;
    SV_Target.z = _468;
    SV_Target.w = _469;
}

