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
    precise float _127 = _122 * cb0._m22.z;
    precise float _130 = fma(_127, 0.004999999888241291046142578125, TEXCOORD1.z);
    precise float _131 = _130 * 500.0;
    precise float _134 = sin(roundEven(_131)) * 43758.546875;
    precise float _136 = fract(_134) - 0.5;
    precise float _137 = _136 * cb0._m22.z;
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
        precise float _166 = _160 * cb0._m20.x;
        precise float _167 = _160 * cb0._m20.y;
        precise float _174 = _155 * _155;
        precise float _179 = fma(_174, cb0._m18.x, fma(_157, cb0._m16.x, _166));
        precise float _180 = fma(_174, cb0._m18.y, fma(_157, cb0._m16.y, _167));
        _148 = _147 + 0.100000001490116119384765625;
        precise float _181 = spvNMin(_148, 1.0);
        precise float _182 = 1.0 - _181;
        precise float _183 = _182 * _182;
        float _186 = dp2_f32(vec2(_181), vec2(_182));
        precise float _187 = _186 * cb0._m20.x;
        precise float _188 = _186 * cb0._m20.y;
        precise float _191 = _181 * _181;
        precise float _194 = fma(_191, cb0._m18.x, fma(_183, cb0._m16.x, _187)) - _179;
        precise float _195 = fma(_191, cb0._m18.y, fma(_183, cb0._m16.y, _188)) - _180;
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
    precise float _226 = abs(dFdx(_221)) + abs(dFdy(_221));
    precise float _227 = _140 * 8.0;
    precise float _228 = _140 * 2.5;
    precise float _230 = fract(_228);
    precise float _234 = cb0._m22.x * 0.5;
    bool _236 = (fract(_227) > 0.800000011920928955078125) && (_221 < _234);
    float _256 = (_228 >= 0.0) ? _230 : (-_230);
    precise float _257 = _256 * 4.0;
    precise float _260 = cb0._m23.x * 0.5;
    precise float _267 = ((_145 < 0.0) ? fma(-_256, 4.0, 4.0) : _257) - fma(fract(_260), 4.0, 2.0);
    precise float _268 = _267 + 4.0;
    bool _276 = ((spvNMin(abs(_268), abs(_267)) < 0.300000011920928955078125) && (_221 > 0.00999999977648258209228515625)) && (_221 < 0.02999999932944774627685546875);
    float _283 = _276 ? cb0._m15.x : (_236 ? cb0._m14.x : cb0._m12.x);
    float _284 = _276 ? cb0._m15.y : (_236 ? cb0._m14.y : cb0._m12.y);
    float _285 = _276 ? cb0._m15.z : (_236 ? cb0._m14.z : cb0._m12.z);
    float _286 = _276 ? cb0._m15.w : (_236 ? cb0._m14.w : cb0._m12.w);
    precise float _289 = cb0._m22.y + cb0._m22.x;
    precise float _290 = -_226;
    precise float _291 = fma(_290, 0.5, _289);
    precise float _292 = _221 - _291;
    precise float _294 = fma(_226, 0.5, _289) - _291;
    precise float _295 = _292 / _294;
    precise float _296 = spvNClamp(_295, 0.0, 1.0);
    precise float _303 = cb0._m13.x - _283;
    precise float _304 = cb0._m13.y - _284;
    precise float _305 = cb0._m13.z - _285;
    precise float _306 = cb0._m13.w - _286;
    precise float _307 = fma(_296, _303, _283);
    precise float _308 = fma(_296, _304, _284);
    precise float _309 = fma(_296, _305, _285);
    precise float _310 = fma(_296, _306, _286);
    precise float _311 = fma(cb0._m22.y, 2.0, cb0._m22.x);
    precise float _312 = fma(_290, 0.5, _311);
    precise float _314 = _221 - _312;
    precise float _315 = fma(_226, 0.5, _311) - _312;
    precise float _316 = _314 / _315;
    precise float _317 = spvNClamp(_316, 0.0, 1.0);
    precise float _332 = TEXCOORD1.y * cb0._m6.x;
    precise float _333 = TEXCOORD1.y * cb0._m6.y;
    precise float _350 = fma(cb0._m8.x, TEXCOORD1.z, fma(cb0._m4.x, TEXCOORD1.x, _332)) + cb0._m10.x;
    precise float _351 = fma(cb0._m8.y, TEXCOORD1.z, fma(cb0._m4.y, TEXCOORD1.x, _333)) + cb0._m10.y;
    float _428;
    float _429;
    float _430;
    float _431;
    if (cb2._m0.x == 1.0)
    {
        bool _360 = cb2._m0.y == 1.0;
        precise float _367 = TEXCOORD1.y * cb2._m3.x;
        precise float _368 = TEXCOORD1.y * cb2._m3.y;
        precise float _369 = TEXCOORD1.y * cb2._m3.z;
        precise float _391 = fma(cb2._m5.x, TEXCOORD1.z, fma(cb2._m1.x, TEXCOORD1.x, _367)) + cb2._m7.x;
        precise float _392 = fma(cb2._m5.y, TEXCOORD1.z, fma(cb2._m1.y, TEXCOORD1.x, _368)) + cb2._m7.y;
        precise float _393 = fma(cb2._m5.z, TEXCOORD1.z, fma(cb2._m1.z, TEXCOORD1.x, _369)) + cb2._m7.z;
        precise float _402 = (_360 ? _391 : TEXCOORD1.x) - cb2._m11.x;
        precise float _403 = (_360 ? _392 : TEXCOORD1.y) - cb2._m11.y;
        precise float _404 = (_360 ? _393 : TEXCOORD1.z) - cb2._m11.z;
        precise float _410 = _402 * cb2._m9.x;
        precise float _411 = _403 * cb2._m9.y;
        precise float _412 = _404 * cb2._m9.z;
        vec4 _423 = texture(sampler3D(t1, s0), vec3(spvNMax(fma(cb2._m0.z, 0.5, 0.75), fma(_410, 0.25, 0.75)), _411, _412));
        _428 = _423.w;
        _429 = _423.z;
        _430 = _423.y;
        _431 = _423.x;
    }
    else
    {
        _428 = 1.0;
        _429 = 1.0;
        _430 = 1.0;
        _431 = 1.0;
    }
    precise float _445 = spvNClamp(dp4_f32(vec4(_431, _430, _429, _428), cb1._m46), 0.0, 1.0) * texture(sampler2D(t0, s1), vec2(_350, _351)).w;
    precise float _446 = fma(_317, -_307, _307) * _445;
    precise float _447 = fma(_317, -_308, _308) * _445;
    precise float _448 = fma(_317, -_309, _309) * _445;
    precise float _455 = _446 * cb0._m2.x;
    precise float _456 = _447 * cb0._m2.y;
    precise float _457 = _448 * cb0._m2.z;
    precise float _458 = fma(_317, -_310, _310) * cb0._m2.w;
    SV_Target.x = _455;
    SV_Target.y = _456;
    SV_Target.z = _457;
    SV_Target.w = _458;
}

