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
    vec3 _m5;
    uint _m6;
    vec3 _m7;
    uint _m8;
    vec3 _m9;
    uint _m10;
    vec3 _m11;
    uint _m12;
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
    precise float _100 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _100));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _82 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _82)));
}

void main()
{
    precise float _116 = cb0._m22.y + cb0._m23.x;
    precise float _119 = fma(cb0._m22.y, 0.579999983310699462890625, cb0._m23.z);
    precise float _130 = TEXCOORD1.x - cb2._m3.x;
    precise float _131 = TEXCOORD1.z - cb2._m3.z;
    precise float _132 = _130 * 600.0;
    precise float _135 = sin(roundEven(_132)) * 43758.546875;
    precise float _137 = fract(_135) - 0.5;
    precise float _138 = fma(_137, 0.004999999888241291046142578125, _131);
    precise float _139 = _138 * 300.0;
    precise float _142 = sin(roundEven(_139)) * 43758.546875;
    precise float _144 = fract(_142) - 0.5;
    precise float _145 = fma(_144, 0.004999999888241291046142578125, _130);
    precise float _146 = _145 * 1.5;
    precise float _147 = _138 * 1.5;
    vec4 _154 = texture(sampler2D(t0, s2), vec2(_146, _147));
    precise float _165 = abs(_145);
    precise float _166 = abs(TEXCOORD1.y);
    precise float _167 = abs(_138);
    precise float _168 = _165 - _116;
    precise float _169 = _166 - cb0._m23.y;
    precise float _170 = _167 - _119;
    vec3 _174 = vec3(spvNMax(_168, 0.0), spvNMax(_169, 0.0), spvNMax(_170, 0.0));
    precise float _179 = sqrt(dp3_f32(_174, _174)) - cb0._m23.w;
    precise float _180 = _116 + 0.02999999932944774627685546875;
    precise float _181 = cb0._m23.y + 0.02999999932944774627685546875;
    precise float _182 = _119 + 0.02999999932944774627685546875;
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
    precise float _271 = TEXCOORD1.y * cb0._m7.z;
    precise float _293 = fma(cb0._m9.x, TEXCOORD1.z, fma(cb0._m5.x, TEXCOORD1.x, _269)) + cb0._m11.x;
    precise float _294 = fma(cb0._m9.y, TEXCOORD1.z, fma(cb0._m5.y, TEXCOORD1.x, _270)) + cb0._m11.y;
    precise float _295 = fma(cb0._m9.z, TEXCOORD1.z, fma(cb0._m5.z, TEXCOORD1.x, _271)) + cb0._m11.z;
    float _371;
    float _372;
    float _373;
    float _374;
    if (cb3._m0.x == 1.0)
    {
        bool _304 = cb3._m0.y == 1.0;
        precise float _310 = TEXCOORD1.y * cb3._m3.x;
        precise float _311 = TEXCOORD1.y * cb3._m3.y;
        precise float _312 = TEXCOORD1.y * cb3._m3.z;
        precise float _334 = fma(cb3._m5.x, TEXCOORD1.z, fma(cb3._m1.x, TEXCOORD1.x, _310)) + cb3._m7.x;
        precise float _335 = fma(cb3._m5.y, TEXCOORD1.z, fma(cb3._m1.y, TEXCOORD1.x, _311)) + cb3._m7.y;
        precise float _336 = fma(cb3._m5.z, TEXCOORD1.z, fma(cb3._m1.z, TEXCOORD1.x, _312)) + cb3._m7.z;
        precise float _345 = (_304 ? _334 : TEXCOORD1.x) - cb3._m11.x;
        precise float _346 = (_304 ? _335 : TEXCOORD1.y) - cb3._m11.y;
        precise float _347 = (_304 ? _336 : TEXCOORD1.z) - cb3._m11.z;
        precise float _353 = _345 * cb3._m9.x;
        precise float _354 = _346 * cb3._m9.y;
        precise float _355 = _347 * cb3._m9.z;
        vec4 _366 = texture(sampler3D(t2, s0), vec3(spvNMax(fma(_353, 0.25, 0.75), fma(cb3._m0.z, 0.5, 0.75)), _354, _355));
        _371 = _366.w;
        _372 = _366.z;
        _373 = _366.y;
        _374 = _366.x;
    }
    else
    {
        _371 = 1.0;
        _372 = 1.0;
        _373 = 1.0;
        _374 = 1.0;
    }
    vec3 _382 = vec3(_293, _294, _295);
    precise float _390 = spvNClamp(dp4_f32(vec4(_374, _373, _372, _371), cb1._m46), 0.0, 1.0) * texture(sampler2D(t1, s1), vec2(dp3_f32(_382, _382))).x;
    precise float _391 = _390 * fma(_252, _258, _236);
    precise float _392 = _390 * fma(_252, _259, _237);
    precise float _393 = _390 * fma(_252, _260, _238);
    precise float _399 = _391 * cb0._m2.x;
    precise float _400 = _392 * cb0._m2.y;
    precise float _401 = _393 * cb0._m2.z;
    SV_Target.x = _399;
    SV_Target.y = _400;
    SV_Target.z = _401;
    SV_Target.w = 1.0;
}

