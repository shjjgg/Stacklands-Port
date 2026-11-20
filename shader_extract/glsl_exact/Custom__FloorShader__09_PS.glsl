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
layout(location = 3, component = 0) in vec3 TEXCOORD2;
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
    precise float _120 = cb0._m15.y + cb0._m16.x;
    precise float _123 = fma(cb0._m15.y, 0.579999983310699462890625, cb0._m16.z);
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
    precise float _152 = _149 * 600.0;
    vec4 _159 = texture(sampler2D(t0, s1), vec2(_150, _151));
    precise float _170 = abs(_149);
    precise float _171 = abs(TEXCOORD1.y);
    precise float _172 = abs(_142);
    precise float _173 = _170 - _120;
    precise float _174 = _171 - cb0._m16.y;
    precise float _175 = _172 - _123;
    vec3 _179 = vec3(spvNMax(_173, 0.0), spvNMax(_174, 0.0), spvNMax(_175, 0.0));
    precise float _184 = sqrt(dp3_f32(_179, _179)) - cb0._m16.w;
    precise float _185 = 1.0 - _184;
    precise float _186 = _120 + 0.02999999932944774627685546875;
    precise float _187 = cb0._m16.y + 0.02999999932944774627685546875;
    precise float _188 = _123 + 0.02999999932944774627685546875;
    precise float _189 = cb0._m16.w + 0.02999999932944774627685546875;
    precise float _190 = _170 - _186;
    precise float _191 = _171 - _187;
    precise float _192 = _172 - _188;
    vec3 _196 = vec3(spvNMax(_190, 0.0), spvNMax(_191, 0.0), spvNMax(_192, 0.0));
    precise float _199 = sqrt(dp3_f32(_196, _196)) - _189;
    precise float _200 = 1.0 - _199;
    precise float _203 = sin(roundEven(_152)) * 43758.546875;
    precise float _205 = fract(_203) - 0.5;
    precise float _207 = fma(_205, 0.00200000009499490261077880859375, TEXCOORD1.z);
    precise float _208 = fma(_148, 0.00200000009499490261077880859375, TEXCOORD1.x);
    precise float _209 = 1.0 - _200;
    float _212 = float(_209 <= 0.5);
    precise float _219 = 1.0 - cb0._m6.x;
    precise float _220 = 1.0 - cb0._m6.y;
    precise float _221 = 1.0 - cb0._m6.z;
    precise float _222 = fma(_212, _219, cb0._m6.x);
    precise float _223 = fma(_212, _220, cb0._m6.y);
    precise float _224 = fma(_212, _221, cb0._m6.z);
    precise float _229 = abs(dFdy(_185)) + abs(dFdx(_185));
    precise float _230 = -_229;
    precise float _231 = fma(_230, 0.5, 0.5);
    precise float _233 = _185 - _231;
    precise float _235 = fma(_229, 0.5, -_231) + 0.5;
    precise float _236 = _233 / _235;
    precise float _237 = spvNClamp(_236, 0.0, 1.0);
    precise float _249 = fma(_237, fma(cb0._m8.x, spvNClamp(_159.x, 0.0, 1.0), -_222), _222);
    precise float _250 = fma(_237, fma(cb0._m8.y, spvNClamp(_159.y, 0.0, 1.0), -_223), _223);
    precise float _251 = fma(_237, fma(cb0._m8.z, spvNClamp(_159.z, 0.0, 1.0), -_224), _224);
    precise float _252 = _123 - 0.89999997615814208984375;
    precise float _253 = _123 - 0.90999996662139892578125;
    precise float _254 = _123 - 0.88999998569488525390625;
    float _258 = float(_185 >= 0.5);
    precise float _259 = _258 * float(fma(_205, 0.004999999888241291046142578125, TEXCOORD1.z) >= _252);
    precise float _265 = cb0._m12.x - _249;
    precise float _266 = cb0._m12.y - _250;
    precise float _267 = cb0._m12.z - _251;
    precise float _268 = fma(_259, _265, _249);
    precise float _269 = fma(_259, _266, _250);
    precise float _270 = fma(_259, _267, _251);
    precise float _275 = abs(dFdy(_208)) + abs(dFdx(_208));
    precise float _276 = _207 - _253;
    precise float _277 = _207 - _254;
    precise float _278 = _276 / _275;
    precise float _279 = _277 / _275;
    precise float _282 = 1.0 - spvNClamp(_279, 0.0, 1.0);
    precise float _283 = _282 * spvNClamp(_278, 0.0, 1.0);
    precise float _284 = _258 * _283;
    precise float _288 = fma(_284, -_268, _268);
    precise float _289 = fma(_284, -_269, _269);
    precise float _290 = fma(_284, -_270, _270);
    precise float _293 = 0.5 - cb0._m18.x;
    precise float _294 = fma(_230, 0.5, _293);
    precise float _295 = _185 - _294;
    precise float _297 = fma(_229, 0.5, _293) - _294;
    precise float _298 = _295 / _297;
    precise float _300 = 1.0 - _185;
    precise float _301 = _300 - _294;
    precise float _302 = _301 / _297;
    precise float _304 = spvNClamp(_302, 0.0, 1.0) * spvNClamp(_298, 0.0, 1.0);
    precise float _310 = cb0._m10.x - _288;
    precise float _311 = cb0._m10.y - _289;
    precise float _312 = cb0._m10.z - _290;
    precise float _313 = fma(_304, _310, _288);
    precise float _314 = fma(_304, _311, _289);
    precise float _315 = fma(_304, _312, _290);
    float _391;
    float _392;
    float _393;
    float _394;
    if (cb3._m0.x == 1.0)
    {
        bool _324 = cb3._m0.y == 1.0;
        precise float _330 = TEXCOORD1.y * cb3._m3.x;
        precise float _331 = TEXCOORD1.y * cb3._m3.y;
        precise float _332 = TEXCOORD1.y * cb3._m3.z;
        precise float _354 = fma(cb3._m5.x, TEXCOORD1.z, fma(cb3._m1.x, TEXCOORD1.x, _330)) + cb3._m7.x;
        precise float _355 = fma(cb3._m5.y, TEXCOORD1.z, fma(cb3._m1.y, TEXCOORD1.x, _331)) + cb3._m7.y;
        precise float _356 = fma(cb3._m5.z, TEXCOORD1.z, fma(cb3._m1.z, TEXCOORD1.x, _332)) + cb3._m7.z;
        precise float _365 = (_324 ? _354 : TEXCOORD1.x) - cb3._m11.x;
        precise float _366 = (_324 ? _355 : TEXCOORD1.y) - cb3._m11.y;
        precise float _367 = (_324 ? _356 : TEXCOORD1.z) - cb3._m11.z;
        precise float _373 = _365 * cb3._m9.x;
        precise float _374 = _366 * cb3._m9.y;
        precise float _375 = _367 * cb3._m9.z;
        vec4 _386 = texture(sampler3D(t1, s0), vec3(spvNMax(fma(_373, 0.25, 0.75), fma(cb3._m0.z, 0.5, 0.75)), _374, _375));
        _391 = _386.w;
        _392 = _386.z;
        _393 = _386.y;
        _394 = _386.x;
    }
    else
    {
        _391 = 1.0;
        _392 = 1.0;
        _393 = 1.0;
        _394 = 1.0;
    }
    precise float _401 = spvNClamp(dp4_f32(vec4(_394, _393, _392, _391), cb1._m46), 0.0, 1.0);
    precise float _402 = _401 * _313;
    precise float _403 = _401 * _314;
    precise float _404 = _401 * _315;
    precise float _410 = _402 * cb0._m2.x;
    precise float _411 = _403 * cb0._m2.y;
    precise float _412 = _404 * cb0._m2.z;
    SV_Target.x = fma(_313, TEXCOORD2.x, _410);
    SV_Target.y = fma(_314, TEXCOORD2.y, _411);
    SV_Target.z = fma(_315, TEXCOORD2.z, _412);
    SV_Target.w = 1.0;
}

