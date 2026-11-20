#version 450
#extension GL_EXT_buffer_reference2 : require
#extension GL_EXT_spirv_intrinsics : require

layout(set = 0, binding = 0, std140) uniform cb0_buf
{
    uvec4 _m0;
    uvec4 _m1;
    vec4 _m2;
    uvec4 _m3;
    vec3 _m4;
    uint _m5;
    vec3 _m6;
    uint _m7;
    vec3 _m8;
    uint _m9;
    vec3 _m10;
    uint _m11;
    vec4 _m12;
    vec4 _m13;
    vec4 _m14;
    vec4 _m15;
    vec2 _m16;
    uvec2 _m17;
    vec2 _m18;
    uvec2 _m19;
    vec2 _m20;
    uvec2 _m21;
    vec4 _m22;
    vec4 _m23;
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
layout(set = 0, binding = 7) uniform textureCube t1;
layout(set = 0, binding = 8) uniform texture3D t2;

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
    precise float _125 = a.x * b.x;
    return fma(a.y, b.y, _125);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _108 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _108)));
}

float dp3_f32(vec3 a, vec3 b)
{
    precise float _93 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _93));
}

void main()
{
    precise float _135 = TEXCOORD1.x * 1000.0;
    precise float _138 = sin(roundEven(_135)) * 43758.546875;
    precise float _140 = fract(_138) - 0.5;
    precise float _145 = _140 * cb0._m22.z;
    precise float _148 = fma(_145, 0.004999999888241291046142578125, TEXCOORD1.z);
    precise float _149 = _148 * 500.0;
    precise float _152 = sin(roundEven(_149)) * 43758.546875;
    precise float _154 = fract(_152) - 0.5;
    precise float _155 = _154 * cb0._m22.z;
    precise float _156 = fma(_155, 0.004999999888241291046142578125, TEXCOORD1.x);
    float _158;
    float _163;
    _158 = 0.0;
    _163 = 100000.0;
    float _159;
    precise float _162;
    float _164;
    precise float _166;
    float _161 = 0.0;
    float _165 = 0.0;
    for (;;)
    {
        if (_165 > 1.0)
        {
            break;
        }
        precise float _173 = spvNMin(_165, 1.0);
        precise float _174 = 1.0 - _173;
        precise float _175 = _174 * _174;
        float _178 = dp2_f32(vec2(_173), vec2(_174));
        precise float _184 = _178 * cb0._m20.x;
        precise float _185 = _178 * cb0._m20.y;
        precise float _192 = _173 * _173;
        precise float _197 = fma(_192, cb0._m18.x, fma(_175, cb0._m16.x, _184));
        precise float _198 = fma(_192, cb0._m18.y, fma(_175, cb0._m16.y, _185));
        _166 = _165 + 0.100000001490116119384765625;
        precise float _199 = spvNMin(_166, 1.0);
        precise float _200 = 1.0 - _199;
        precise float _201 = _200 * _200;
        float _204 = dp2_f32(vec2(_199), vec2(_200));
        precise float _205 = _204 * cb0._m20.x;
        precise float _206 = _204 * cb0._m20.y;
        precise float _209 = _199 * _199;
        precise float _212 = fma(_209, cb0._m18.x, fma(_201, cb0._m16.x, _205)) - _197;
        precise float _213 = fma(_209, cb0._m18.y, fma(_201, cb0._m16.y, _206)) - _198;
        precise float _214 = _156 - _197;
        precise float _215 = _148 - _198;
        vec2 _216 = vec2(_214, _215);
        vec2 _217 = vec2(_212, _213);
        float _219 = dp2_f32(_217, _217);
        precise float _220 = dp2_f32(_216, _217) / _219;
        precise float _221 = spvNClamp(_220, 0.0, 1.0);
        precise float _227 = -_221;
        vec2 _230 = vec2(fma(_227, _212, _214), fma(_227, _213, _215));
        precise float _233 = sqrt(dp2_f32(_230, _230)) * ((dp2_f32(vec2(_213, -_212), _216) > 0.0) ? 1.0 : (-1.0));
        precise float _234 = sqrt(_219);
        bool _237 = abs(_233) < abs(_163);
        _159 = _237 ? fma(_221, _234, _161) : _158;
        _164 = _237 ? _233 : _163;
        _162 = _234 + _161;
        _158 = _159;
        _161 = _162;
        _163 = _164;
        _165 = _166;
        continue;
    }
    precise float _239 = abs(_163);
    precise float _244 = abs(dFdx(_239)) + abs(dFdy(_239));
    precise float _245 = _158 * 8.0;
    precise float _246 = _158 * 2.5;
    precise float _248 = fract(_246);
    precise float _252 = cb0._m22.x * 0.5;
    bool _254 = (fract(_245) > 0.800000011920928955078125) && (_239 < _252);
    float _274 = (_246 >= 0.0) ? _248 : (-_248);
    precise float _275 = _274 * 4.0;
    precise float _278 = cb0._m23.x * 0.5;
    precise float _285 = ((_163 < 0.0) ? fma(-_274, 4.0, 4.0) : _275) - fma(fract(_278), 4.0, 2.0);
    precise float _286 = _285 + 4.0;
    bool _294 = ((spvNMin(abs(_286), abs(_285)) < 0.300000011920928955078125) && (_239 > 0.00999999977648258209228515625)) && (_239 < 0.02999999932944774627685546875);
    float _301 = _294 ? cb0._m15.x : (_254 ? cb0._m14.x : cb0._m12.x);
    float _302 = _294 ? cb0._m15.y : (_254 ? cb0._m14.y : cb0._m12.y);
    float _303 = _294 ? cb0._m15.z : (_254 ? cb0._m14.z : cb0._m12.z);
    float _304 = _294 ? cb0._m15.w : (_254 ? cb0._m14.w : cb0._m12.w);
    precise float _307 = cb0._m22.y + cb0._m22.x;
    precise float _308 = -_244;
    precise float _309 = fma(_308, 0.5, _307);
    precise float _310 = _239 - _309;
    precise float _312 = fma(_244, 0.5, _307) - _309;
    precise float _313 = _310 / _312;
    precise float _314 = spvNClamp(_313, 0.0, 1.0);
    precise float _321 = cb0._m13.x - _301;
    precise float _322 = cb0._m13.y - _302;
    precise float _323 = cb0._m13.z - _303;
    precise float _324 = cb0._m13.w - _304;
    precise float _325 = fma(_314, _321, _301);
    precise float _326 = fma(_314, _322, _302);
    precise float _327 = fma(_314, _323, _303);
    precise float _328 = fma(_314, _324, _304);
    precise float _329 = fma(cb0._m22.y, 2.0, cb0._m22.x);
    precise float _330 = fma(_308, 0.5, _329);
    precise float _332 = _239 - _330;
    precise float _333 = fma(_244, 0.5, _329) - _330;
    precise float _334 = _332 / _333;
    precise float _335 = spvNClamp(_334, 0.0, 1.0);
    precise float _352 = TEXCOORD1.y * cb0._m6.x;
    precise float _353 = TEXCOORD1.y * cb0._m6.y;
    precise float _354 = TEXCOORD1.y * cb0._m6.z;
    precise float _376 = fma(cb0._m8.x, TEXCOORD1.z, fma(cb0._m4.x, TEXCOORD1.x, _352)) + cb0._m10.x;
    precise float _377 = fma(cb0._m8.y, TEXCOORD1.z, fma(cb0._m4.y, TEXCOORD1.x, _353)) + cb0._m10.y;
    precise float _378 = fma(cb0._m8.z, TEXCOORD1.z, fma(cb0._m4.z, TEXCOORD1.x, _354)) + cb0._m10.z;
    float _454;
    float _455;
    float _456;
    float _457;
    if (cb2._m0.x == 1.0)
    {
        bool _387 = cb2._m0.y == 1.0;
        precise float _393 = TEXCOORD1.y * cb2._m3.x;
        precise float _394 = TEXCOORD1.y * cb2._m3.y;
        precise float _395 = TEXCOORD1.y * cb2._m3.z;
        precise float _417 = fma(cb2._m5.x, TEXCOORD1.z, fma(cb2._m1.x, TEXCOORD1.x, _393)) + cb2._m7.x;
        precise float _418 = fma(cb2._m5.y, TEXCOORD1.z, fma(cb2._m1.y, TEXCOORD1.x, _394)) + cb2._m7.y;
        precise float _419 = fma(cb2._m5.z, TEXCOORD1.z, fma(cb2._m1.z, TEXCOORD1.x, _395)) + cb2._m7.z;
        precise float _428 = (_387 ? _417 : TEXCOORD1.x) - cb2._m11.x;
        precise float _429 = (_387 ? _418 : TEXCOORD1.y) - cb2._m11.y;
        precise float _430 = (_387 ? _419 : TEXCOORD1.z) - cb2._m11.z;
        precise float _436 = _428 * cb2._m9.x;
        precise float _437 = _429 * cb2._m9.y;
        precise float _438 = _430 * cb2._m9.z;
        vec4 _449 = texture(sampler3D(t2, s0), vec3(spvNMax(fma(_436, 0.25, 0.75), fma(cb2._m0.z, 0.5, 0.75)), _437, _438));
        _454 = _449.w;
        _455 = _449.z;
        _456 = _449.y;
        _457 = _449.x;
    }
    else
    {
        _454 = 1.0;
        _455 = 1.0;
        _456 = 1.0;
        _457 = 1.0;
    }
    vec3 _464 = vec3(_376, _377, _378);
    precise float _479 = texture(sampler2D(t0, s2), vec2(dp3_f32(_464, _464))).x * texture(samplerCube(t1, s1), _464).w;
    precise float _480 = spvNClamp(dp4_f32(vec4(_457, _456, _455, _454), cb1._m46), 0.0, 1.0) * _479;
    precise float _481 = fma(_335, -_325, _325) * _480;
    precise float _482 = fma(_335, -_326, _326) * _480;
    precise float _483 = fma(_335, -_327, _327) * _480;
    precise float _490 = _481 * cb0._m2.x;
    precise float _491 = _482 * cb0._m2.y;
    precise float _492 = _483 * cb0._m2.z;
    precise float _493 = fma(_335, -_328, _328) * cb0._m2.w;
    SV_Target.x = _490;
    SV_Target.y = _491;
    SV_Target.z = _492;
    SV_Target.w = _493;
}

