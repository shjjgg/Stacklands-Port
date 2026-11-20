#version 450
#extension GL_EXT_buffer_reference2 : require
#extension GL_EXT_spirv_intrinsics : require
#extension GL_EXT_demote_to_helper_invocation : require

layout(set = 0, binding = 0, std140) uniform cb0_buf
{
    uvec4 _m0;
    uvec4 _m1;
    vec3 _m2;
    uint _m3;
    uvec4 _m4;
    uvec4 _m5;
    uvec4 _m6;
    vec3 _m7;
    uint _m8;
    vec3 _m9;
    uint _m10;
    vec3 _m11;
    uint _m12;
    uvec4 _m13;
    vec4 _m14;
    vec4 _m15;
    uvec4 _m16;
    vec4 _m17;
    uvec4 _m18;
    uvec4 _m19;
    vec3 _m20;
    uint _m21;
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
    uvec4 _m0;
    uvec4 _m1;
    uvec4 _m2;
    vec4 _m3;
} cb3;

layout(set = 0, binding = 4, std140) uniform cb4_buf
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
} cb4;

layout(set = 0, binding = 5) uniform sampler s0;
layout(set = 0, binding = 6) uniform sampler s1;
layout(set = 0, binding = 7) uniform texture2D t0;
layout(set = 0, binding = 8) uniform texture3D t1;

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
    precise float _110 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _110));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _92 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _92)));
}

void main()
{
    precise float _126 = cb0._m14.y + cb0._m15.x;
    precise float _129 = fma(cb0._m14.y, 0.579999983310699462890625, cb0._m15.z);
    precise float _140 = TEXCOORD1.x - cb3._m3.x;
    precise float _141 = TEXCOORD1.z - cb3._m3.z;
    precise float _142 = _140 * 600.0;
    precise float _145 = sin(roundEven(_142)) * 43758.546875;
    precise float _147 = fract(_145) - 0.5;
    precise float _148 = fma(_147, 0.004999999888241291046142578125, _141);
    precise float _149 = _148 * 300.0;
    precise float _152 = sin(roundEven(_149)) * 43758.546875;
    precise float _154 = fract(_152) - 0.5;
    precise float _155 = fma(_154, 0.004999999888241291046142578125, _140);
    precise float _160 = abs(_155);
    precise float _161 = abs(TEXCOORD1.y);
    precise float _162 = abs(_148);
    precise float _163 = _160 - _126;
    precise float _164 = _161 - cb0._m15.y;
    precise float _165 = _162 - _129;
    vec3 _169 = vec3(spvNMax(_163, 0.0), spvNMax(_164, 0.0), spvNMax(_165, 0.0));
    precise float _174 = sqrt(dp3_f32(_169, _169)) - cb0._m15.w;
    precise float _175 = _126 + 0.02999999932944774627685546875;
    precise float _176 = cb0._m15.y + 0.02999999932944774627685546875;
    precise float _177 = _129 + 0.02999999932944774627685546875;
    precise float _178 = cb0._m15.w + 0.02999999932944774627685546875;
    precise float _179 = _160 - _175;
    precise float _180 = _161 - _176;
    precise float _181 = _162 - _177;
    vec3 _185 = vec3(spvNMax(_179, 0.0), spvNMax(_180, 0.0), spvNMax(_181, 0.0));
    precise float _188 = sqrt(dp3_f32(_185, _185)) - _178;
    precise float _189 = 1.0 - _174;
    precise float _190 = 1.0 - _188;
    precise float _191 = _155 * 600.0;
    precise float _192 = _155 * 0.100000001490116119384765625;
    precise float _193 = _148 * 0.100000001490116119384765625;
    precise float _196 = sin(roundEven(_191)) * 43758.546875;
    precise float _198 = fract(_196) - 0.5;
    precise float _200 = fma(_198, 0.00200000009499490261077880859375, TEXCOORD1.z);
    precise float _201 = fma(_154, 0.00200000009499490261077880859375, TEXCOORD1.x);
    vec4 _213 = texture(sampler2D(t0, s1), vec2(fma(cb1.m.x, 0.20000000298023223876953125, _192), fma(cb1.m.x, 0.20000000298023223876953125, _193)));
    precise float _220 = _126 + 1.0;
    precise float _221 = cb0._m15.y + 0.0;
    precise float _222 = _129 + 1.0;
    precise float _223 = abs(fma(fma(_213.y, 2.0, -1.0), 0.100000001490116119384765625, _155));
    precise float _224 = abs(fma(fma(_213.x, 2.0, -1.0), 0.100000001490116119384765625, _148));
    precise float _225 = _223 - _220;
    precise float _226 = _161 - _221;
    precise float _227 = _224 - _222;
    precise float _229 = spvNMax(_226, 0.0);
    vec3 _231 = vec3(spvNMax(_225, 0.0), _229, spvNMax(_227, 0.0));
    precise float _234 = sqrt(dp3_f32(_231, _231)) - 0.5;
    float _237 = float(_234 <= 0.300000011920928955078125);
    precise float _244 = cb0._m20.x - 1.0;
    precise float _245 = fma(_237, _244, 1.0);
    precise float _246 = fma(_237, cb0._m20.y, 0.0);
    precise float _247 = fma(_237, cb0._m20.z, 0.0);
    precise float _248 = _126 + 0.699999988079071044921875;
    precise float _249 = _129 + 0.699999988079071044921875;
    precise float _250 = _223 - _248;
    precise float _251 = _224 - _249;
    vec3 _254 = vec3(spvNMax(_250, 0.0), _229, spvNMax(_251, 0.0));
    float _258 = float(sqrt(dp3_f32(_254, _254)) <= 0.5);
    precise float _259 = 1.0 - _245;
    precise float _260 = 1.0 - _246;
    precise float _261 = 1.0 - _247;
    precise float _262 = fma(_258, _259, _245);
    precise float _263 = fma(_258, _260, _246);
    precise float _264 = fma(_258, _261, _247);
    precise float _265 = _126 + 0.60000002384185791015625;
    precise float _266 = _129 + 0.60000002384185791015625;
    precise float _267 = _223 - _265;
    precise float _268 = _224 - _266;
    vec3 _271 = vec3(spvNMax(_267, 0.0), _229, spvNMax(_268, 0.0));
    float _275 = float(sqrt(dp3_f32(_271, _271)) <= 0.5);
    precise float _281 = cb0._m7.x - _262;
    precise float _282 = cb0._m7.y - _263;
    precise float _283 = cb0._m7.z - _264;
    precise float _284 = fma(_275, _281, _262);
    precise float _285 = fma(_275, _282, _263);
    precise float _286 = fma(_275, _283, _264);
    precise float _287 = 1.0 - _190;
    float _289 = float(_287 <= 0.5);
    precise float _290 = 1.0 - _284;
    precise float _291 = 1.0 - _285;
    precise float _292 = 1.0 - _286;
    precise float _293 = fma(_289, _290, _284);
    precise float _294 = fma(_289, _291, _285);
    precise float _295 = fma(_289, _292, _286);
    precise float _300 = abs(dFdy(_189)) + abs(dFdx(_189));
    precise float _301 = -_300;
    precise float _302 = fma(_301, 0.5, 0.5);
    precise float _304 = _189 - _302;
    precise float _306 = fma(_300, 0.5, -_302) + 0.5;
    precise float _307 = _304 / _306;
    precise float _308 = spvNClamp(_307, 0.0, 1.0);
    precise float _309 = cb0._m7.x - _293;
    precise float _310 = cb0._m7.y - _294;
    precise float _311 = cb0._m7.z - _295;
    precise float _312 = fma(_308, _309, _293);
    precise float _313 = fma(_308, _310, _294);
    precise float _314 = fma(_308, _311, _295);
    precise float _315 = _129 - 0.89999997615814208984375;
    precise float _316 = _129 - 0.90999996662139892578125;
    precise float _317 = _129 - 0.88999998569488525390625;
    float _321 = float(_189 >= 0.5);
    precise float _322 = _321 * float(fma(_198, 0.004999999888241291046142578125, TEXCOORD1.z) >= _315);
    precise float _328 = cb0._m11.x - _312;
    precise float _329 = cb0._m11.y - _313;
    precise float _330 = cb0._m11.z - _314;
    precise float _331 = fma(_322, _328, _312);
    precise float _332 = fma(_322, _329, _313);
    precise float _333 = fma(_322, _330, _314);
    precise float _338 = abs(dFdy(_201)) + abs(dFdx(_201));
    precise float _339 = _200 - _316;
    precise float _340 = _200 - _317;
    precise float _341 = _339 / _338;
    precise float _342 = _340 / _338;
    precise float _345 = 1.0 - spvNClamp(_342, 0.0, 1.0);
    precise float _346 = _345 * spvNClamp(_341, 0.0, 1.0);
    precise float _347 = _321 * _346;
    precise float _351 = fma(_347, -_331, _331);
    precise float _352 = fma(_347, -_332, _332);
    precise float _353 = fma(_347, -_333, _333);
    precise float _356 = 0.5 - cb0._m17.x;
    precise float _357 = fma(_301, 0.5, _356);
    precise float _358 = _189 - _357;
    precise float _360 = fma(_300, 0.5, _356) - _357;
    precise float _361 = _358 / _360;
    precise float _363 = 1.0 - _189;
    precise float _364 = _363 - _357;
    precise float _365 = _364 / _360;
    precise float _367 = spvNClamp(_365, 0.0, 1.0) * spvNClamp(_361, 0.0, 1.0);
    precise float _373 = cb0._m9.x - _351;
    precise float _374 = cb0._m9.y - _352;
    precise float _375 = cb0._m9.z - _353;
    precise float _376 = fma(_367, _373, _351);
    precise float _377 = fma(_367, _374, _352);
    precise float _378 = fma(_367, _375, _353);
    if ((_378 == 0.0) && ((_377 == 0.0) && (_376 == 1.0)))
    {
        demote;
    }
    float _461;
    float _462;
    float _463;
    float _464;
    if (cb4._m0.x == 1.0)
    {
        bool _394 = cb4._m0.y == 1.0;
        precise float _400 = TEXCOORD1.y * cb4._m3.x;
        precise float _401 = TEXCOORD1.y * cb4._m3.y;
        precise float _402 = TEXCOORD1.y * cb4._m3.z;
        precise float _424 = fma(cb4._m5.x, TEXCOORD1.z, fma(cb4._m1.x, TEXCOORD1.x, _400)) + cb4._m7.x;
        precise float _425 = fma(cb4._m5.y, TEXCOORD1.z, fma(cb4._m1.y, TEXCOORD1.x, _401)) + cb4._m7.y;
        precise float _426 = fma(cb4._m5.z, TEXCOORD1.z, fma(cb4._m1.z, TEXCOORD1.x, _402)) + cb4._m7.z;
        precise float _435 = (_394 ? _424 : TEXCOORD1.x) - cb4._m11.x;
        precise float _436 = (_394 ? _425 : TEXCOORD1.y) - cb4._m11.y;
        precise float _437 = (_394 ? _426 : TEXCOORD1.z) - cb4._m11.z;
        precise float _443 = _435 * cb4._m9.x;
        precise float _444 = _436 * cb4._m9.y;
        precise float _445 = _437 * cb4._m9.z;
        vec4 _456 = texture(sampler3D(t1, s0), vec3(spvNMax(fma(_443, 0.25, 0.75), fma(cb4._m0.z, 0.5, 0.75)), _444, _445));
        _461 = _456.w;
        _462 = _456.z;
        _463 = _456.y;
        _464 = _456.x;
    }
    else
    {
        _461 = 1.0;
        _462 = 1.0;
        _463 = 1.0;
        _464 = 1.0;
    }
    precise float _471 = spvNClamp(dp4_f32(vec4(_464, _463, _462, _461), cb2._m46), 0.0, 1.0);
    precise float _472 = _471 * _376;
    precise float _473 = _471 * _377;
    precise float _474 = _471 * _378;
    precise float _480 = _472 * cb0._m2.x;
    precise float _481 = _473 * cb0._m2.y;
    precise float _482 = _474 * cb0._m2.z;
    SV_Target.x = fma(_376, TEXCOORD2.x, _480);
    SV_Target.y = fma(_377, TEXCOORD2.y, _481);
    SV_Target.z = fma(_378, TEXCOORD2.z, _482);
    SV_Target.w = 1.0;
}

