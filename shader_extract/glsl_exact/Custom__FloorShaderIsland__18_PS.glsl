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
    precise float _109 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _109));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _91 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _91)));
}

void main()
{
    precise float _125 = cb0._m14.y + cb0._m15.x;
    precise float _128 = fma(cb0._m14.y, 0.579999983310699462890625, cb0._m15.z);
    precise float _139 = TEXCOORD1.x - cb3._m3.x;
    precise float _140 = TEXCOORD1.z - cb3._m3.z;
    precise float _141 = _139 * 600.0;
    precise float _144 = sin(roundEven(_141)) * 43758.546875;
    precise float _146 = fract(_144) - 0.5;
    precise float _147 = fma(_146, 0.004999999888241291046142578125, _140);
    precise float _148 = _147 * 300.0;
    precise float _151 = sin(roundEven(_148)) * 43758.546875;
    precise float _153 = fract(_151) - 0.5;
    precise float _154 = fma(_153, 0.004999999888241291046142578125, _139);
    precise float _159 = abs(_154);
    precise float _160 = abs(TEXCOORD1.y);
    precise float _161 = abs(_147);
    precise float _162 = _159 - _125;
    precise float _163 = _160 - cb0._m15.y;
    precise float _164 = _161 - _128;
    vec3 _168 = vec3(spvNMax(_162, 0.0), spvNMax(_163, 0.0), spvNMax(_164, 0.0));
    precise float _173 = sqrt(dp3_f32(_168, _168)) - cb0._m15.w;
    precise float _174 = _125 + 0.02999999932944774627685546875;
    precise float _175 = cb0._m15.y + 0.02999999932944774627685546875;
    precise float _176 = _128 + 0.02999999932944774627685546875;
    precise float _177 = cb0._m15.w + 0.02999999932944774627685546875;
    precise float _178 = _159 - _174;
    precise float _179 = _160 - _175;
    precise float _180 = _161 - _176;
    vec3 _184 = vec3(spvNMax(_178, 0.0), spvNMax(_179, 0.0), spvNMax(_180, 0.0));
    precise float _187 = sqrt(dp3_f32(_184, _184)) - _177;
    precise float _188 = 1.0 - _173;
    precise float _189 = 1.0 - _187;
    precise float _190 = _154 * 600.0;
    precise float _191 = _154 * 0.100000001490116119384765625;
    precise float _192 = _147 * 0.100000001490116119384765625;
    precise float _195 = sin(roundEven(_190)) * 43758.546875;
    precise float _197 = fract(_195) - 0.5;
    precise float _199 = fma(_197, 0.00200000009499490261077880859375, TEXCOORD1.z);
    precise float _200 = fma(_153, 0.00200000009499490261077880859375, TEXCOORD1.x);
    vec4 _212 = texture(sampler2D(t0, s1), vec2(fma(cb1.m.x, 0.20000000298023223876953125, _191), fma(cb1.m.x, 0.20000000298023223876953125, _192)));
    precise float _219 = _125 + 1.0;
    precise float _220 = cb0._m15.y + 0.0;
    precise float _221 = _128 + 1.0;
    precise float _222 = abs(fma(fma(_212.y, 2.0, -1.0), 0.100000001490116119384765625, _154));
    precise float _223 = abs(fma(fma(_212.x, 2.0, -1.0), 0.100000001490116119384765625, _147));
    precise float _224 = _222 - _219;
    precise float _225 = _160 - _220;
    precise float _226 = _223 - _221;
    precise float _228 = spvNMax(_225, 0.0);
    vec3 _230 = vec3(spvNMax(_224, 0.0), _228, spvNMax(_226, 0.0));
    precise float _233 = sqrt(dp3_f32(_230, _230)) - 0.5;
    float _236 = float(_233 <= 0.300000011920928955078125);
    precise float _243 = cb0._m20.x - 1.0;
    precise float _244 = fma(_236, _243, 1.0);
    precise float _245 = fma(_236, cb0._m20.y, 0.0);
    precise float _246 = fma(_236, cb0._m20.z, 0.0);
    precise float _247 = _125 + 0.699999988079071044921875;
    precise float _248 = _128 + 0.699999988079071044921875;
    precise float _249 = _222 - _247;
    precise float _250 = _223 - _248;
    vec3 _253 = vec3(spvNMax(_249, 0.0), _228, spvNMax(_250, 0.0));
    float _257 = float(sqrt(dp3_f32(_253, _253)) <= 0.5);
    precise float _258 = 1.0 - _244;
    precise float _259 = 1.0 - _245;
    precise float _260 = 1.0 - _246;
    precise float _261 = fma(_257, _258, _244);
    precise float _262 = fma(_257, _259, _245);
    precise float _263 = fma(_257, _260, _246);
    precise float _264 = _125 + 0.60000002384185791015625;
    precise float _265 = _128 + 0.60000002384185791015625;
    precise float _266 = _222 - _264;
    precise float _267 = _223 - _265;
    vec3 _270 = vec3(spvNMax(_266, 0.0), _228, spvNMax(_267, 0.0));
    float _274 = float(sqrt(dp3_f32(_270, _270)) <= 0.5);
    precise float _280 = cb0._m7.x - _261;
    precise float _281 = cb0._m7.y - _262;
    precise float _282 = cb0._m7.z - _263;
    precise float _283 = fma(_274, _280, _261);
    precise float _284 = fma(_274, _281, _262);
    precise float _285 = fma(_274, _282, _263);
    precise float _286 = 1.0 - _189;
    float _288 = float(_286 <= 0.5);
    precise float _289 = 1.0 - _283;
    precise float _290 = 1.0 - _284;
    precise float _291 = 1.0 - _285;
    precise float _292 = fma(_288, _289, _283);
    precise float _293 = fma(_288, _290, _284);
    precise float _294 = fma(_288, _291, _285);
    precise float _299 = abs(dFdy(_188)) + abs(dFdx(_188));
    precise float _300 = -_299;
    precise float _301 = fma(_300, 0.5, 0.5);
    precise float _303 = _188 - _301;
    precise float _305 = fma(_299, 0.5, -_301) + 0.5;
    precise float _306 = _303 / _305;
    precise float _307 = spvNClamp(_306, 0.0, 1.0);
    precise float _308 = cb0._m7.x - _292;
    precise float _309 = cb0._m7.y - _293;
    precise float _310 = cb0._m7.z - _294;
    precise float _311 = fma(_307, _308, _292);
    precise float _312 = fma(_307, _309, _293);
    precise float _313 = fma(_307, _310, _294);
    precise float _314 = _128 - 0.89999997615814208984375;
    precise float _315 = _128 - 0.90999996662139892578125;
    precise float _316 = _128 - 0.88999998569488525390625;
    float _320 = float(_188 >= 0.5);
    precise float _321 = _320 * float(fma(_197, 0.004999999888241291046142578125, TEXCOORD1.z) >= _314);
    precise float _327 = cb0._m11.x - _311;
    precise float _328 = cb0._m11.y - _312;
    precise float _329 = cb0._m11.z - _313;
    precise float _330 = fma(_321, _327, _311);
    precise float _331 = fma(_321, _328, _312);
    precise float _332 = fma(_321, _329, _313);
    precise float _337 = abs(dFdy(_200)) + abs(dFdx(_200));
    precise float _338 = _199 - _315;
    precise float _339 = _199 - _316;
    precise float _340 = _338 / _337;
    precise float _341 = _339 / _337;
    precise float _344 = 1.0 - spvNClamp(_341, 0.0, 1.0);
    precise float _345 = _344 * spvNClamp(_340, 0.0, 1.0);
    precise float _346 = _320 * _345;
    precise float _350 = fma(_346, -_330, _330);
    precise float _351 = fma(_346, -_331, _331);
    precise float _352 = fma(_346, -_332, _332);
    precise float _355 = 0.5 - cb0._m17.x;
    precise float _356 = fma(_300, 0.5, _355);
    precise float _357 = _188 - _356;
    precise float _359 = fma(_299, 0.5, _355) - _356;
    precise float _360 = _357 / _359;
    precise float _362 = 1.0 - _188;
    precise float _363 = _362 - _356;
    precise float _364 = _363 / _359;
    precise float _366 = spvNClamp(_364, 0.0, 1.0) * spvNClamp(_360, 0.0, 1.0);
    precise float _372 = cb0._m9.x - _350;
    precise float _373 = cb0._m9.y - _351;
    precise float _374 = cb0._m9.z - _352;
    precise float _375 = fma(_366, _372, _350);
    precise float _376 = fma(_366, _373, _351);
    precise float _377 = fma(_366, _374, _352);
    if ((_377 == 0.0) && ((_376 == 0.0) && (_375 == 1.0)))
    {
        demote;
    }
    float _460;
    float _461;
    float _462;
    float _463;
    if (cb4._m0.x == 1.0)
    {
        bool _393 = cb4._m0.y == 1.0;
        precise float _399 = TEXCOORD1.y * cb4._m3.x;
        precise float _400 = TEXCOORD1.y * cb4._m3.y;
        precise float _401 = TEXCOORD1.y * cb4._m3.z;
        precise float _423 = fma(cb4._m5.x, TEXCOORD1.z, fma(cb4._m1.x, TEXCOORD1.x, _399)) + cb4._m7.x;
        precise float _424 = fma(cb4._m5.y, TEXCOORD1.z, fma(cb4._m1.y, TEXCOORD1.x, _400)) + cb4._m7.y;
        precise float _425 = fma(cb4._m5.z, TEXCOORD1.z, fma(cb4._m1.z, TEXCOORD1.x, _401)) + cb4._m7.z;
        precise float _434 = (_393 ? _423 : TEXCOORD1.x) - cb4._m11.x;
        precise float _435 = (_393 ? _424 : TEXCOORD1.y) - cb4._m11.y;
        precise float _436 = (_393 ? _425 : TEXCOORD1.z) - cb4._m11.z;
        precise float _442 = _434 * cb4._m9.x;
        precise float _443 = _435 * cb4._m9.y;
        precise float _444 = _436 * cb4._m9.z;
        vec4 _455 = texture(sampler3D(t1, s0), vec3(spvNMax(fma(_442, 0.25, 0.75), fma(cb4._m0.z, 0.5, 0.75)), _443, _444));
        _460 = _455.w;
        _461 = _455.z;
        _462 = _455.y;
        _463 = _455.x;
    }
    else
    {
        _460 = 1.0;
        _461 = 1.0;
        _462 = 1.0;
        _463 = 1.0;
    }
    precise float _470 = spvNClamp(dp4_f32(vec4(_463, _462, _461, _460), cb2._m46), 0.0, 1.0);
    precise float _471 = _470 * _375;
    precise float _472 = _470 * _376;
    precise float _473 = _470 * _377;
    precise float _479 = _471 * cb0._m2.x;
    precise float _480 = _472 * cb0._m2.y;
    precise float _481 = _473 * cb0._m2.z;
    SV_Target.x = _479;
    SV_Target.y = _480;
    SV_Target.z = _481;
    SV_Target.w = 1.0;
}

