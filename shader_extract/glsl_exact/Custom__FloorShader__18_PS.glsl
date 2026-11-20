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
    uvec4 _m5;
    vec3 _m6;
    uint _m7;
    vec3 _m8;
    uint _m9;
    vec3 _m10;
    uint _m11;
    vec3 _m12;
    uint _m13;
    uvec4 _m14;
    vec4 _m15;
    vec4 _m16;
    uvec4 _m17;
    vec4 _m18;
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
layout(set = 0, binding = 6) uniform texture2D t0;
layout(set = 0, binding = 7) uniform texture3D t1;

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
    precise float _103 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _103));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _85 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _85)));
}

void main()
{
    precise float _119 = cb0._m15.y + cb0._m16.x;
    precise float _122 = fma(cb0._m15.y, 0.579999983310699462890625, cb0._m16.z);
    precise float _133 = TEXCOORD1.x - cb2._m3.x;
    precise float _134 = TEXCOORD1.z - cb2._m3.z;
    precise float _135 = _133 * 600.0;
    precise float _138 = sin(roundEven(_135)) * 43758.546875;
    precise float _140 = fract(_138) - 0.5;
    precise float _141 = fma(_140, 0.004999999888241291046142578125, _134);
    precise float _142 = _141 * 300.0;
    precise float _145 = sin(roundEven(_142)) * 43758.546875;
    precise float _147 = fract(_145) - 0.5;
    precise float _148 = fma(_147, 0.004999999888241291046142578125, _133);
    precise float _149 = _148 * 1.5;
    precise float _150 = _141 * 1.5;
    precise float _151 = _148 * 600.0;
    vec4 _158 = texture(sampler2D(t0, s1), vec2(_149, _150));
    precise float _169 = abs(_148);
    precise float _170 = abs(TEXCOORD1.y);
    precise float _171 = abs(_141);
    precise float _172 = _169 - _119;
    precise float _173 = _170 - cb0._m16.y;
    precise float _174 = _171 - _122;
    vec3 _178 = vec3(spvNMax(_172, 0.0), spvNMax(_173, 0.0), spvNMax(_174, 0.0));
    precise float _183 = sqrt(dp3_f32(_178, _178)) - cb0._m16.w;
    precise float _184 = 1.0 - _183;
    precise float _185 = _119 + 0.02999999932944774627685546875;
    precise float _186 = cb0._m16.y + 0.02999999932944774627685546875;
    precise float _187 = _122 + 0.02999999932944774627685546875;
    precise float _188 = cb0._m16.w + 0.02999999932944774627685546875;
    precise float _189 = _169 - _185;
    precise float _190 = _170 - _186;
    precise float _191 = _171 - _187;
    vec3 _195 = vec3(spvNMax(_189, 0.0), spvNMax(_190, 0.0), spvNMax(_191, 0.0));
    precise float _198 = sqrt(dp3_f32(_195, _195)) - _188;
    precise float _199 = 1.0 - _198;
    precise float _202 = sin(roundEven(_151)) * 43758.546875;
    precise float _204 = fract(_202) - 0.5;
    precise float _206 = fma(_204, 0.00200000009499490261077880859375, TEXCOORD1.z);
    precise float _207 = fma(_147, 0.00200000009499490261077880859375, TEXCOORD1.x);
    precise float _208 = 1.0 - _199;
    float _211 = float(_208 <= 0.5);
    precise float _218 = 1.0 - cb0._m6.x;
    precise float _219 = 1.0 - cb0._m6.y;
    precise float _220 = 1.0 - cb0._m6.z;
    precise float _221 = fma(_211, _218, cb0._m6.x);
    precise float _222 = fma(_211, _219, cb0._m6.y);
    precise float _223 = fma(_211, _220, cb0._m6.z);
    precise float _228 = abs(dFdy(_184)) + abs(dFdx(_184));
    precise float _229 = -_228;
    precise float _230 = fma(_229, 0.5, 0.5);
    precise float _232 = _184 - _230;
    precise float _234 = fma(_228, 0.5, -_230) + 0.5;
    precise float _235 = _232 / _234;
    precise float _236 = spvNClamp(_235, 0.0, 1.0);
    precise float _248 = fma(_236, fma(cb0._m8.x, spvNClamp(_158.x, 0.0, 1.0), -_221), _221);
    precise float _249 = fma(_236, fma(cb0._m8.y, spvNClamp(_158.y, 0.0, 1.0), -_222), _222);
    precise float _250 = fma(_236, fma(cb0._m8.z, spvNClamp(_158.z, 0.0, 1.0), -_223), _223);
    precise float _251 = _122 - 0.89999997615814208984375;
    precise float _252 = _122 - 0.90999996662139892578125;
    precise float _253 = _122 - 0.88999998569488525390625;
    float _257 = float(_184 >= 0.5);
    precise float _258 = _257 * float(fma(_204, 0.004999999888241291046142578125, TEXCOORD1.z) >= _251);
    precise float _264 = cb0._m12.x - _248;
    precise float _265 = cb0._m12.y - _249;
    precise float _266 = cb0._m12.z - _250;
    precise float _267 = fma(_258, _264, _248);
    precise float _268 = fma(_258, _265, _249);
    precise float _269 = fma(_258, _266, _250);
    precise float _274 = abs(dFdy(_207)) + abs(dFdx(_207));
    precise float _275 = _206 - _252;
    precise float _276 = _206 - _253;
    precise float _277 = _275 / _274;
    precise float _278 = _276 / _274;
    precise float _281 = 1.0 - spvNClamp(_278, 0.0, 1.0);
    precise float _282 = _281 * spvNClamp(_277, 0.0, 1.0);
    precise float _283 = _257 * _282;
    precise float _287 = fma(_283, -_267, _267);
    precise float _288 = fma(_283, -_268, _268);
    precise float _289 = fma(_283, -_269, _269);
    precise float _292 = 0.5 - cb0._m18.x;
    precise float _293 = fma(_229, 0.5, _292);
    precise float _294 = _184 - _293;
    precise float _296 = fma(_228, 0.5, _292) - _293;
    precise float _297 = _294 / _296;
    precise float _299 = 1.0 - _184;
    precise float _300 = _299 - _293;
    precise float _301 = _300 / _296;
    precise float _303 = spvNClamp(_301, 0.0, 1.0) * spvNClamp(_297, 0.0, 1.0);
    precise float _309 = cb0._m10.x - _287;
    precise float _310 = cb0._m10.y - _288;
    precise float _311 = cb0._m10.z - _289;
    float _390;
    float _391;
    float _392;
    float _393;
    if (cb3._m0.x == 1.0)
    {
        bool _323 = cb3._m0.y == 1.0;
        precise float _329 = TEXCOORD1.y * cb3._m3.x;
        precise float _330 = TEXCOORD1.y * cb3._m3.y;
        precise float _331 = TEXCOORD1.y * cb3._m3.z;
        precise float _353 = fma(cb3._m5.x, TEXCOORD1.z, fma(cb3._m1.x, TEXCOORD1.x, _329)) + cb3._m7.x;
        precise float _354 = fma(cb3._m5.y, TEXCOORD1.z, fma(cb3._m1.y, TEXCOORD1.x, _330)) + cb3._m7.y;
        precise float _355 = fma(cb3._m5.z, TEXCOORD1.z, fma(cb3._m1.z, TEXCOORD1.x, _331)) + cb3._m7.z;
        precise float _364 = (_323 ? _353 : TEXCOORD1.x) - cb3._m11.x;
        precise float _365 = (_323 ? _354 : TEXCOORD1.y) - cb3._m11.y;
        precise float _366 = (_323 ? _355 : TEXCOORD1.z) - cb3._m11.z;
        precise float _372 = _364 * cb3._m9.x;
        precise float _373 = _365 * cb3._m9.y;
        precise float _374 = _366 * cb3._m9.z;
        vec4 _385 = texture(sampler3D(t1, s0), vec3(spvNMax(fma(_372, 0.25, 0.75), fma(cb3._m0.z, 0.5, 0.75)), _373, _374));
        _390 = _385.w;
        _391 = _385.z;
        _392 = _385.y;
        _393 = _385.x;
    }
    else
    {
        _390 = 1.0;
        _391 = 1.0;
        _392 = 1.0;
        _393 = 1.0;
    }
    precise float _400 = spvNClamp(dp4_f32(vec4(_393, _392, _391, _390), cb1._m46), 0.0, 1.0);
    precise float _401 = _400 * fma(_303, _309, _287);
    precise float _402 = _400 * fma(_303, _310, _288);
    precise float _403 = _400 * fma(_303, _311, _289);
    precise float _409 = _401 * cb0._m2.x;
    precise float _410 = _402 * cb0._m2.y;
    precise float _411 = _403 * cb0._m2.z;
    SV_Target.x = _409;
    SV_Target.y = _410;
    SV_Target.z = _411;
    SV_Target.w = 1.0;
}

