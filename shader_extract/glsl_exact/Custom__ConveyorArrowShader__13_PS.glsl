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
    vec2 _m14;
    uvec2 _m15;
    vec2 _m16;
    uvec2 _m17;
    vec4 _m18;
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
layout(set = 0, binding = 5) uniform sampler s1;
layout(set = 0, binding = 6) uniform sampler s2;
layout(set = 0, binding = 7) uniform texture2D t0;
layout(set = 0, binding = 8) uniform textureCube t1;
layout(set = 0, binding = 9) uniform texture3D t2;

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
    precise float _114 = a.x * b.x;
    return fma(a.y, b.y, _114);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _97 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _97)));
}

float dp3_f32(vec3 a, vec3 b)
{
    precise float _82 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _82));
}

void main()
{
    precise float _124 = TEXCOORD1.x * 1000.0;
    precise float _127 = sin(roundEven(_124)) * 43758.546875;
    precise float _129 = fract(_127) - 0.5;
    precise float _134 = _129 * cb0._m18.w;
    precise float _137 = fma(_134, 0.004999999888241291046142578125, TEXCOORD1.z);
    precise float _138 = _137 * 500.0;
    precise float _139 = _137 * 10.0;
    precise float _143 = sin(roundEven(_138)) * 43758.546875;
    precise float _145 = fract(_143) - 0.5;
    precise float _146 = _145 * cb0._m18.w;
    precise float _151 = roundEven(_139) + cb1.m.x;
    precise float _152 = _151 * 250.0;
    precise float _155 = sin(roundEven(_152)) * 43758.546875;
    precise float _157 = fract(_155) - 0.5;
    precise float _158 = fma(_157, 0.004999999888241291046142578125, fma(_146, 0.004999999888241291046142578125, TEXCOORD1.x));
    precise float _159 = _158 * 10.0;
    precise float _161 = roundEven(_159) + cb1.m.x;
    precise float _162 = _161 * 250.0;
    precise float _165 = sin(roundEven(_162)) * 43758.546875;
    precise float _167 = fract(_165) - 0.5;
    precise float _168 = fma(_167, 0.004999999888241291046142578125, _137);
    precise float _178 = cb0._m16.x - cb0._m14.x;
    precise float _179 = cb0._m16.y - cb0._m14.y;
    vec2 _180 = vec2(_178, _179);
    float _181 = dp2_f32(_180, _180);
    precise float _182 = inversesqrt(_181);
    precise float _183 = _182 * _178;
    precise float _184 = _182 * _179;
    precise float _185 = 0.0 - _184;
    precise float _190 = fma(_178, _182, _185) * cb0._m18.z;
    precise float _191 = fma(_179, _182, _183) * cb0._m18.z;
    precise float _196 = fma(_178, _182, -_185) * cb0._m18.z;
    precise float _197 = fma(_179, _182, -_183) * cb0._m18.z;
    precise float _198 = _158 - cb0._m14.x;
    precise float _199 = _168 - cb0._m14.y;
    precise float _202 = dp2_f32(vec2(_198, _199), _180) / _181;
    precise float _204 = -spvNClamp(_202, 0.0, 1.0);
    vec2 _207 = vec2(fma(_204, _178, _198), fma(_204, _179, _199));
    precise float _209 = _158 - cb0._m16.x;
    precise float _210 = _168 - cb0._m16.y;
    vec2 _211 = vec2(_209, _210);
    precise float _212 = -_190;
    precise float _213 = -_191;
    vec2 _214 = vec2(_212, _213);
    precise float _217 = dp2_f32(_211, _214) / dp2_f32(_214, _214);
    precise float _219 = -spvNClamp(_217, 0.0, 1.0);
    vec2 _222 = vec2(fma(_219, _212, _209), fma(_219, _213, _210));
    precise float _227 = -_196;
    precise float _228 = -_197;
    vec2 _229 = vec2(_227, _228);
    precise float _232 = dp2_f32(_211, _229) / dp2_f32(_229, _229);
    precise float _234 = -spvNClamp(_232, 0.0, 1.0);
    vec2 _237 = vec2(fma(_234, _227, _209), fma(_234, _228, _210));
    precise float _240 = spvNMin(sqrt(dp2_f32(_237, _237)), spvNMin(sqrt(dp2_f32(_222, _222)), sqrt(dp2_f32(_207, _207))));
    precise float _245 = abs(dFdy(_240)) + abs(dFdx(_240));
    precise float _249 = fma(-_245, 0.5, cb0._m18.x);
    precise float _251 = _240 - _249;
    precise float _252 = fma(_245, 0.5, cb0._m18.x) - _249;
    precise float _253 = _251 / _252;
    precise float _254 = spvNClamp(_253, 0.0, 1.0);
    precise float _268 = cb0._m13.x - cb0._m12.x;
    precise float _269 = cb0._m13.y - cb0._m12.y;
    precise float _270 = cb0._m13.z - cb0._m12.z;
    precise float _271 = cb0._m13.w - cb0._m12.w;
    precise float _272 = fma(_254, _268, cb0._m12.x);
    precise float _273 = fma(_254, _269, cb0._m12.y);
    precise float _274 = fma(_254, _270, cb0._m12.z);
    precise float _275 = fma(_254, _271, cb0._m12.w);
    precise float _292 = TEXCOORD1.y * cb0._m6.x;
    precise float _293 = TEXCOORD1.y * cb0._m6.y;
    precise float _294 = TEXCOORD1.y * cb0._m6.z;
    precise float _316 = fma(cb0._m8.x, TEXCOORD1.z, fma(cb0._m4.x, TEXCOORD1.x, _292)) + cb0._m10.x;
    precise float _317 = fma(cb0._m8.y, TEXCOORD1.z, fma(cb0._m4.y, TEXCOORD1.x, _293)) + cb0._m10.y;
    precise float _318 = fma(cb0._m8.z, TEXCOORD1.z, fma(cb0._m4.z, TEXCOORD1.x, _294)) + cb0._m10.z;
    float _395;
    float _396;
    float _397;
    float _398;
    if (cb3._m0.x == 1.0)
    {
        bool _328 = cb3._m0.y == 1.0;
        precise float _334 = TEXCOORD1.y * cb3._m3.x;
        precise float _335 = TEXCOORD1.y * cb3._m3.y;
        precise float _336 = TEXCOORD1.y * cb3._m3.z;
        precise float _358 = fma(cb3._m5.x, TEXCOORD1.z, fma(cb3._m1.x, TEXCOORD1.x, _334)) + cb3._m7.x;
        precise float _359 = fma(cb3._m5.y, TEXCOORD1.z, fma(cb3._m1.y, TEXCOORD1.x, _335)) + cb3._m7.y;
        precise float _360 = fma(cb3._m5.z, TEXCOORD1.z, fma(cb3._m1.z, TEXCOORD1.x, _336)) + cb3._m7.z;
        precise float _369 = (_328 ? _358 : TEXCOORD1.x) - cb3._m11.x;
        precise float _370 = (_328 ? _359 : TEXCOORD1.y) - cb3._m11.y;
        precise float _371 = (_328 ? _360 : TEXCOORD1.z) - cb3._m11.z;
        precise float _377 = _369 * cb3._m9.x;
        precise float _378 = _370 * cb3._m9.y;
        precise float _379 = _371 * cb3._m9.z;
        vec4 _390 = texture(sampler3D(t2, s0), vec3(spvNMax(fma(_377, 0.25, 0.75), fma(cb3._m0.z, 0.5, 0.75)), _378, _379));
        _395 = _390.w;
        _396 = _390.z;
        _397 = _390.y;
        _398 = _390.x;
    }
    else
    {
        _395 = 1.0;
        _396 = 1.0;
        _397 = 1.0;
        _398 = 1.0;
    }
    vec3 _405 = vec3(_316, _317, _318);
    precise float _420 = texture(sampler2D(t0, s2), vec2(dp3_f32(_405, _405))).x * texture(samplerCube(t1, s1), _405).w;
    precise float _421 = spvNClamp(dp4_f32(vec4(_398, _397, _396, _395), cb2._m46), 0.0, 1.0) * _420;
    precise float _422 = fma(_254, -_272, _272) * _421;
    precise float _423 = fma(_254, -_273, _273) * _421;
    precise float _424 = fma(_254, -_274, _274) * _421;
    precise float _431 = _422 * cb0._m2.x;
    precise float _432 = _423 * cb0._m2.y;
    precise float _433 = _424 * cb0._m2.z;
    precise float _434 = fma(_254, -_275, _275) * cb0._m2.w;
    SV_Target.x = _431;
    SV_Target.y = _432;
    SV_Target.z = _433;
    SV_Target.w = _434;
}

