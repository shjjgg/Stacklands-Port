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
    vec2 _m5;
    uvec2 _m6;
    vec2 _m7;
    uvec2 _m8;
    vec2 _m9;
    uvec2 _m10;
    vec2 _m11;
    uvec2 _m12;
    uvec4 _m13;
    vec3 _m14;
    uint _m15;
    vec3 _m16;
    uint _m17;
    vec3 _m18;
    uint _m19;
    uvec4 _m20;
    uvec4 _m21;
    vec4 _m22;
    vec4 _m23;
    uvec4 _m24;
    vec4 _m25;
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
layout(set = 0, binding = 7) uniform texture2D t0;
layout(set = 0, binding = 8) uniform texture2D t1;
layout(set = 0, binding = 9) uniform texture3D t2;

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
    precise float _101 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _101));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _83 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _83)));
}

void main()
{
    precise float _117 = cb0._m22.y + cb0._m23.x;
    precise float _120 = fma(cb0._m22.y, 0.579999983310699462890625, cb0._m23.z);
    precise float _131 = TEXCOORD1.x - cb2._m3.x;
    precise float _132 = TEXCOORD1.z - cb2._m3.z;
    precise float _133 = _131 * 600.0;
    precise float _136 = sin(roundEven(_133)) * 43758.546875;
    precise float _138 = fract(_136) - 0.5;
    precise float _139 = fma(_138, 0.004999999888241291046142578125, _132);
    precise float _140 = _139 * 300.0;
    precise float _143 = sin(roundEven(_140)) * 43758.546875;
    precise float _145 = fract(_143) - 0.5;
    precise float _146 = fma(_145, 0.004999999888241291046142578125, _131);
    precise float _147 = _146 * 1.5;
    precise float _148 = _139 * 1.5;
    vec4 _154 = texture(sampler2D(t0, s2), vec2(_147, _148));
    precise float _165 = abs(_146);
    precise float _166 = abs(TEXCOORD1.y);
    precise float _167 = abs(_139);
    precise float _168 = _165 - _117;
    precise float _169 = _166 - cb0._m23.y;
    precise float _170 = _167 - _120;
    vec3 _174 = vec3(spvNMax(_168, 0.0), spvNMax(_169, 0.0), spvNMax(_170, 0.0));
    precise float _179 = sqrt(dp3_f32(_174, _174)) - cb0._m23.w;
    precise float _180 = _117 + 0.02999999932944774627685546875;
    precise float _181 = cb0._m23.y + 0.02999999932944774627685546875;
    precise float _182 = _120 + 0.02999999932944774627685546875;
    precise float _183 = cb0._m23.w + 0.02999999932944774627685546875;
    precise float _184 = _165 - _180;
    precise float _185 = _166 - _181;
    precise float _186 = _167 - _182;
    vec3 _190 = vec3(spvNMax(_184, 0.0), spvNMax(_185, 0.0), spvNMax(_186, 0.0));
    precise float _193 = sqrt(dp3_f32(_190, _190)) - _183;
    precise float _194 = 1.0 - _193;
    precise float _195 = 1.0 - _179;
    precise float _196 = 1.0 - _194;
    float _199 = float(_196 <= 0.5);
    precise float _206 = 1.0 - cb0._m14.x;
    precise float _207 = 1.0 - cb0._m14.y;
    precise float _208 = 1.0 - cb0._m14.z;
    precise float _209 = fma(_199, _206, cb0._m14.x);
    precise float _210 = fma(_199, _207, cb0._m14.y);
    precise float _211 = fma(_199, _208, cb0._m14.z);
    precise float _216 = abs(dFdx(_195)) + abs(dFdy(_195));
    precise float _217 = -_216;
    precise float _218 = fma(_217, 0.5, 0.5);
    precise float _220 = _195 - _218;
    precise float _222 = fma(_216, 0.5, -_218) + 0.5;
    precise float _223 = _220 / _222;
    precise float _224 = spvNClamp(_223, 0.0, 1.0);
    precise float _236 = fma(_224, fma(cb0._m16.x, spvNClamp(_154.x, 0.0, 1.0), -_209), _209);
    precise float _237 = fma(_224, fma(cb0._m16.y, spvNClamp(_154.y, 0.0, 1.0), -_210), _210);
    precise float _238 = fma(_224, fma(cb0._m16.z, spvNClamp(_154.z, 0.0, 1.0), -_211), _211);
    precise float _241 = 0.5 - cb0._m25.x;
    precise float _242 = fma(_217, 0.5, _241);
    precise float _243 = _195 - _242;
    precise float _245 = fma(_216, 0.5, _241) - _242;
    precise float _246 = _243 / _245;
    precise float _248 = 1.0 - _195;
    precise float _249 = _248 - _242;
    precise float _250 = _249 / _245;
    precise float _252 = spvNClamp(_250, 0.0, 1.0) * spvNClamp(_246, 0.0, 1.0);
    precise float _258 = cb0._m18.x - _236;
    precise float _259 = cb0._m18.y - _237;
    precise float _260 = cb0._m18.z - _238;
    precise float _269 = TEXCOORD1.y * cb0._m7.x;
    precise float _270 = TEXCOORD1.y * cb0._m7.y;
    precise float _287 = fma(cb0._m9.x, TEXCOORD1.z, fma(cb0._m5.x, TEXCOORD1.x, _269)) + cb0._m11.x;
    precise float _288 = fma(cb0._m9.y, TEXCOORD1.z, fma(cb0._m5.y, TEXCOORD1.x, _270)) + cb0._m11.y;
    float _364;
    float _365;
    float _366;
    float _367;
    if (cb3._m0.x == 1.0)
    {
        bool _297 = cb3._m0.y == 1.0;
        precise float _303 = TEXCOORD1.y * cb3._m3.x;
        precise float _304 = TEXCOORD1.y * cb3._m3.y;
        precise float _305 = TEXCOORD1.y * cb3._m3.z;
        precise float _327 = fma(cb3._m5.x, TEXCOORD1.z, fma(cb3._m1.x, TEXCOORD1.x, _303)) + cb3._m7.x;
        precise float _328 = fma(cb3._m5.y, TEXCOORD1.z, fma(cb3._m1.y, TEXCOORD1.x, _304)) + cb3._m7.y;
        precise float _329 = fma(cb3._m5.z, TEXCOORD1.z, fma(cb3._m1.z, TEXCOORD1.x, _305)) + cb3._m7.z;
        precise float _338 = (_297 ? _327 : TEXCOORD1.x) - cb3._m11.x;
        precise float _339 = (_297 ? _328 : TEXCOORD1.y) - cb3._m11.y;
        precise float _340 = (_297 ? _329 : TEXCOORD1.z) - cb3._m11.z;
        precise float _346 = _338 * cb3._m9.x;
        precise float _347 = _339 * cb3._m9.y;
        precise float _348 = _340 * cb3._m9.z;
        vec4 _359 = texture(sampler3D(t2, s0), vec3(spvNMax(fma(_346, 0.25, 0.75), fma(cb3._m0.z, 0.5, 0.75)), _347, _348));
        _364 = _359.w;
        _365 = _359.z;
        _366 = _359.y;
        _367 = _359.x;
    }
    else
    {
        _364 = 1.0;
        _365 = 1.0;
        _366 = 1.0;
        _367 = 1.0;
    }
    precise float _381 = spvNClamp(dp4_f32(vec4(_367, _366, _365, _364), cb1._m46), 0.0, 1.0) * texture(sampler2D(t1, s1), vec2(_287, _288)).w;
    precise float _382 = _381 * fma(_252, _258, _236);
    precise float _383 = _381 * fma(_252, _259, _237);
    precise float _384 = _381 * fma(_252, _260, _238);
    precise float _390 = _382 * cb0._m2.x;
    precise float _391 = _383 * cb0._m2.y;
    precise float _392 = _384 * cb0._m2.z;
    SV_Target.x = _390;
    SV_Target.y = _391;
    SV_Target.z = _392;
    SV_Target.w = 1.0;
}

