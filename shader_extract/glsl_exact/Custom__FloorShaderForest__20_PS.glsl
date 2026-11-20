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
layout(set = 0, binding = 7) uniform sampler s3;
layout(set = 0, binding = 8) uniform texture2D t0;
layout(set = 0, binding = 9) uniform texture2D t1;
layout(set = 0, binding = 10) uniform textureCube t2;
layout(set = 0, binding = 11) uniform texture3D t3;

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
    precise float _104 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _104));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _86 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _86)));
}

void main()
{
    precise float _120 = cb0._m22.y + cb0._m23.x;
    precise float _123 = fma(cb0._m22.y, 0.579999983310699462890625, cb0._m23.z);
    precise float _134 = TEXCOORD1.x - cb2._m3.x;
    precise float _135 = TEXCOORD1.z - cb2._m3.z;
    precise float _136 = _134 * 600.0;
    precise float _139 = sin(roundEven(_136)) * 43758.546875;
    precise float _141 = fract(_139) - 0.5;
    precise float _142 = fma(_141, 0.004999999888241291046142578125, _135);
    precise float _143 = _142 * 300.0;
    precise float _146 = sin(roundEven(_143)) * 43758.546875;
    precise float _148 = fract(_146) - 0.5;
    precise float _149 = fma(_148, 0.004999999888241291046142578125, _134);
    precise float _150 = _149 * 1.5;
    precise float _151 = _142 * 1.5;
    vec4 _158 = texture(sampler2D(t0, s3), vec2(_150, _151));
    precise float _169 = abs(_149);
    precise float _170 = abs(TEXCOORD1.y);
    precise float _171 = abs(_142);
    precise float _172 = _169 - _120;
    precise float _173 = _170 - cb0._m23.y;
    precise float _174 = _171 - _123;
    vec3 _178 = vec3(spvNMax(_172, 0.0), spvNMax(_173, 0.0), spvNMax(_174, 0.0));
    precise float _183 = sqrt(dp3_f32(_178, _178)) - cb0._m23.w;
    precise float _184 = _120 + 0.02999999932944774627685546875;
    precise float _185 = cb0._m23.y + 0.02999999932944774627685546875;
    precise float _186 = _123 + 0.02999999932944774627685546875;
    precise float _187 = cb0._m23.w + 0.02999999932944774627685546875;
    precise float _188 = _169 - _184;
    precise float _189 = _170 - _185;
    precise float _190 = _171 - _186;
    vec3 _194 = vec3(spvNMax(_188, 0.0), spvNMax(_189, 0.0), spvNMax(_190, 0.0));
    precise float _197 = sqrt(dp3_f32(_194, _194)) - _187;
    precise float _198 = 1.0 - _197;
    precise float _199 = 1.0 - _183;
    precise float _200 = 1.0 - _198;
    float _203 = float(_200 <= 0.5);
    precise float _210 = 1.0 - cb0._m14.x;
    precise float _211 = 1.0 - cb0._m14.y;
    precise float _212 = 1.0 - cb0._m14.z;
    precise float _213 = fma(_203, _210, cb0._m14.x);
    precise float _214 = fma(_203, _211, cb0._m14.y);
    precise float _215 = fma(_203, _212, cb0._m14.z);
    precise float _220 = abs(dFdx(_199)) + abs(dFdy(_199));
    precise float _221 = -_220;
    precise float _222 = fma(_221, 0.5, 0.5);
    precise float _224 = _199 - _222;
    precise float _226 = fma(_220, 0.5, -_222) + 0.5;
    precise float _227 = _224 / _226;
    precise float _228 = spvNClamp(_227, 0.0, 1.0);
    precise float _240 = fma(_228, fma(cb0._m16.x, spvNClamp(_158.x, 0.0, 1.0), -_213), _213);
    precise float _241 = fma(_228, fma(cb0._m16.y, spvNClamp(_158.y, 0.0, 1.0), -_214), _214);
    precise float _242 = fma(_228, fma(cb0._m16.z, spvNClamp(_158.z, 0.0, 1.0), -_215), _215);
    precise float _245 = 0.5 - cb0._m25.x;
    precise float _246 = fma(_221, 0.5, _245);
    precise float _247 = _199 - _246;
    precise float _249 = fma(_220, 0.5, _245) - _246;
    precise float _250 = _247 / _249;
    precise float _252 = 1.0 - _199;
    precise float _253 = _252 - _246;
    precise float _254 = _253 / _249;
    precise float _256 = spvNClamp(_254, 0.0, 1.0) * spvNClamp(_250, 0.0, 1.0);
    precise float _262 = cb0._m18.x - _240;
    precise float _263 = cb0._m18.y - _241;
    precise float _264 = cb0._m18.z - _242;
    precise float _273 = TEXCOORD1.y * cb0._m7.x;
    precise float _274 = TEXCOORD1.y * cb0._m7.y;
    precise float _275 = TEXCOORD1.y * cb0._m7.z;
    precise float _297 = fma(cb0._m9.x, TEXCOORD1.z, fma(cb0._m5.x, TEXCOORD1.x, _273)) + cb0._m11.x;
    precise float _298 = fma(cb0._m9.y, TEXCOORD1.z, fma(cb0._m5.y, TEXCOORD1.x, _274)) + cb0._m11.y;
    precise float _299 = fma(cb0._m9.z, TEXCOORD1.z, fma(cb0._m5.z, TEXCOORD1.x, _275)) + cb0._m11.z;
    float _375;
    float _376;
    float _377;
    float _378;
    if (cb3._m0.x == 1.0)
    {
        bool _308 = cb3._m0.y == 1.0;
        precise float _314 = TEXCOORD1.y * cb3._m3.x;
        precise float _315 = TEXCOORD1.y * cb3._m3.y;
        precise float _316 = TEXCOORD1.y * cb3._m3.z;
        precise float _338 = fma(cb3._m5.x, TEXCOORD1.z, fma(cb3._m1.x, TEXCOORD1.x, _314)) + cb3._m7.x;
        precise float _339 = fma(cb3._m5.y, TEXCOORD1.z, fma(cb3._m1.y, TEXCOORD1.x, _315)) + cb3._m7.y;
        precise float _340 = fma(cb3._m5.z, TEXCOORD1.z, fma(cb3._m1.z, TEXCOORD1.x, _316)) + cb3._m7.z;
        precise float _349 = (_308 ? _338 : TEXCOORD1.x) - cb3._m11.x;
        precise float _350 = (_308 ? _339 : TEXCOORD1.y) - cb3._m11.y;
        precise float _351 = (_308 ? _340 : TEXCOORD1.z) - cb3._m11.z;
        precise float _357 = _349 * cb3._m9.x;
        precise float _358 = _350 * cb3._m9.y;
        precise float _359 = _351 * cb3._m9.z;
        vec4 _370 = texture(sampler3D(t3, s0), vec3(spvNMax(fma(_357, 0.25, 0.75), fma(cb3._m0.z, 0.5, 0.75)), _358, _359));
        _375 = _370.w;
        _376 = _370.z;
        _377 = _370.y;
        _378 = _370.x;
    }
    else
    {
        _375 = 1.0;
        _376 = 1.0;
        _377 = 1.0;
        _378 = 1.0;
    }
    vec3 _386 = vec3(_297, _298, _299);
    precise float _400 = texture(samplerCube(t2, s1), _386).w * texture(sampler2D(t1, s2), vec2(dp3_f32(_386, _386))).x;
    precise float _401 = spvNClamp(dp4_f32(vec4(_378, _377, _376, _375), cb1._m46), 0.0, 1.0) * _400;
    precise float _402 = _401 * fma(_256, _262, _240);
    precise float _403 = _401 * fma(_256, _263, _241);
    precise float _404 = _401 * fma(_256, _264, _242);
    precise float _410 = _402 * cb0._m2.x;
    precise float _411 = _403 * cb0._m2.y;
    precise float _412 = _404 * cb0._m2.z;
    SV_Target.x = _410;
    SV_Target.y = _411;
    SV_Target.z = _412;
    SV_Target.w = 1.0;
}

