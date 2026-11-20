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
    vec4 _m13;
    vec3 _m14;
    uint _m15;
    vec3 _m16;
    uint _m17;
    uvec4 _m18;
    vec3 _m19;
    uint _m20;
} cb0;

layout(set = 0, binding = 1, std140) uniform cb1_buf
{
    uvec4 _m0;
    uvec4 _m1;
    uvec4 _m2;
    uvec4 _m3;
    vec3 _m4;
    uint _m5;
} cb1;

layout(set = 0, binding = 2, std140) uniform cb2_buf
{
    vec3 _m0;
    uint _m1;
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
    uvec4 _m46;
    vec4 _m47;
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
layout(set = 0, binding = 10) uniform texture2D t2;
layout(set = 0, binding = 11) uniform texture3D t3;

layout(location = 1, component = 0) in vec2 TEXCOORD;
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
    precise float _127 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _127));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _116 = a.x * b.x;
    return fma(a.y, b.y, _116);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _98 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _98)));
}

void main()
{
    precise float _151 = cb1._m4.x - TEXCOORD2.x;
    precise float _152 = cb1._m4.y - TEXCOORD2.y;
    precise float _153 = cb1._m4.z - TEXCOORD2.z;
    vec3 _154 = vec3(_151, _152, _153);
    precise float _156 = inversesqrt(dp3_f32(_154, _154));
    precise float _157 = _156 * _151;
    precise float _158 = _156 * _152;
    precise float _159 = _156 * _153;
    precise float _162 = TEXCOORD.y * 150.0;
    precise float _165 = sin(roundEven(_162)) * 43758.546875;
    precise float _169 = fma(fract(_165), 0.004999999888241291046142578125, TEXCOORD.x);
    precise float _170 = _169 * 150.0;
    precise float _173 = sin(roundEven(_170)) * 43758.546875;
    precise float _175 = fma(fract(_173), 0.004999999888241291046142578125, TEXCOORD.y);
    precise float _184 = abs(dFdx(_169)) + abs(dFdy(_169));
    precise float _185 = abs(dFdx(_175)) + abs(dFdy(_175));
    precise float _186 = TEXCOORD.x - 0.5;
    precise float _187 = TEXCOORD.y - 0.4000000059604644775390625;
    precise float _188 = fma(_186, 1.75, 0.5);
    precise float _189 = fma(_187, 1.75, 0.4000000059604644775390625);
    precise float _201 = float(_188 <= 1.0) * float(_188 >= 0.0);
    precise float _202 = float(_189 >= 0.0) * _201;
    vec4 _208 = texture(sampler2D(t0, s2), vec2(_188, _189));
    float _209 = _208.x;
    float _210 = _208.w;
    precise float _212 = fma(-_202, float(_189 <= 1.0), 1.0);
    precise float _216 = fma(_212, -_210, _210);
    precise float _217 = TEXCOORD2.x - cb1._m4.x;
    precise float _218 = TEXCOORD2.y - cb1._m4.y;
    precise float _219 = TEXCOORD2.z - cb1._m4.z;
    vec3 _220 = vec3(_217, _218, _219);
    precise float _222 = inversesqrt(dp3_f32(_220, _220));
    precise float _223 = _222 * _217;
    precise float _224 = _222 * _219;
    precise float _225 = TEXCOORD.y + TEXCOORD.x;
    precise float _226 = TEXCOORD.y + TEXCOORD.y;
    precise float _230 = fma(-_224, 5.0, _226);
    precise float _231 = _230 * 10.0;
    precise float _233 = fma(sin(_231), 0.0199999995529651641845703125, fma(-_223, 5.0, _225));
    precise float _234 = _233 * 30.0;
    vec4 _241 = texture(sampler2D(t1, s3), vec2(_233, fma(cos(_234), 0.0199999995529651641845703125, _230)));
    vec2 _245 = vec2(fma(_186, 1.75, 0.0), fma(_187, 1.75, -0.0999999940395355224609375));
    precise float _248 = sqrt(dp2_f32(_245, _245)) - 0.400390625;
    precise float _249 = _248 / _184;
    precise float _251 = 1.0 - spvNClamp(_249, 0.0, 1.0);
    precise float _263 = cb0._m16.x - cb0._m14.x;
    precise float _264 = cb0._m16.y - cb0._m14.y;
    precise float _265 = cb0._m16.z - cb0._m14.z;
    precise float _266 = fma(_251, _263, cb0._m14.x);
    precise float _267 = fma(_251, _264, cb0._m14.y);
    precise float _268 = fma(_251, _265, cb0._m14.z);
    precise float _269 = 1.0 - fma(_212, -_209, _209);
    precise float _275 = cb0._m19.x - cb0._m14.x;
    precise float _276 = cb0._m19.y - cb0._m14.y;
    precise float _277 = cb0._m19.z - cb0._m14.z;
    precise float _281 = fma(_269, _275, cb0._m14.x) - _266;
    precise float _282 = fma(_269, _276, cb0._m14.y) - _267;
    precise float _283 = fma(_269, _277, cb0._m14.z) - _268;
    precise float _287 = _169 - 0.1167768537998199462890625;
    precise float _288 = _287 / _184;
    precise float _290 = 0.88322317600250244140625 - _169;
    precise float _291 = _290 / _184;
    precise float _293 = spvNClamp(_291, 0.0, 1.0) * spvNClamp(_288, 0.0, 1.0);
    precise float _294 = _175 - 0.02999999932944774627685546875;
    precise float _295 = _294 / _185;
    precise float _297 = _293 * spvNClamp(_295, 0.0, 1.0);
    precise float _298 = 0.9700000286102294921875 - _175;
    precise float _299 = _298 / _185;
    precise float _301 = _297 * spvNClamp(_299, 0.0, 1.0);
    precise float _302 = fma(_241.x, 0.5, fma(_216, _281, _266));
    precise float _303 = fma(_241.y, 0.5, fma(_216, _282, _267));
    precise float _304 = fma(_241.z, 0.5, fma(_216, _283, _268));
    precise float _305 = _301 * _302;
    precise float _306 = _301 * _303;
    precise float _307 = _301 * _304;
    precise float _313 = TEXCOORD2.y * cb0._m7.x;
    precise float _314 = TEXCOORD2.y * cb0._m7.y;
    precise float _331 = fma(cb0._m9.x, TEXCOORD2.z, fma(cb0._m5.x, TEXCOORD2.x, _313)) + cb0._m11.x;
    precise float _332 = fma(cb0._m9.y, TEXCOORD2.z, fma(cb0._m5.y, TEXCOORD2.x, _314)) + cb0._m11.y;
    float _409;
    float _410;
    float _411;
    float _412;
    if (cb3._m0.x == 1.0)
    {
        bool _342 = cb3._m0.y == 1.0;
        precise float _348 = TEXCOORD2.y * cb3._m3.x;
        precise float _349 = TEXCOORD2.y * cb3._m3.y;
        precise float _350 = TEXCOORD2.y * cb3._m3.z;
        precise float _372 = fma(cb3._m5.x, TEXCOORD2.z, fma(cb3._m1.x, TEXCOORD2.x, _348)) + cb3._m7.x;
        precise float _373 = fma(cb3._m5.y, TEXCOORD2.z, fma(cb3._m1.y, TEXCOORD2.x, _349)) + cb3._m7.y;
        precise float _374 = fma(cb3._m5.z, TEXCOORD2.z, fma(cb3._m1.z, TEXCOORD2.x, _350)) + cb3._m7.z;
        precise float _383 = (_342 ? _372 : TEXCOORD2.x) - cb3._m11.x;
        precise float _384 = (_342 ? _373 : TEXCOORD2.y) - cb3._m11.y;
        precise float _385 = (_342 ? _374 : TEXCOORD2.z) - cb3._m11.z;
        precise float _391 = _383 * cb3._m9.x;
        precise float _392 = _384 * cb3._m9.y;
        precise float _393 = _385 * cb3._m9.z;
        vec4 _404 = texture(sampler3D(t3, s0), vec3(spvNMax(fma(_391, 0.25, 0.75), fma(cb3._m0.z, 0.5, 0.75)), _392, _393));
        _409 = _404.w;
        _410 = _404.z;
        _411 = _404.y;
        _412 = _404.x;
    }
    else
    {
        _409 = 1.0;
        _410 = 1.0;
        _411 = 1.0;
        _412 = 1.0;
    }
    precise float _426 = spvNClamp(dp4_f32(vec4(_412, _411, _410, _409), cb2._m47), 0.0, 1.0) * texture(sampler2D(t2, s1), vec2(_331, _332)).w;
    precise float _432 = _426 * cb0._m2.x;
    precise float _433 = _426 * cb0._m2.y;
    precise float _434 = _426 * cb0._m2.z;
    vec3 _441 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    precise float _443 = inversesqrt(dp3_f32(_441, _441));
    precise float _444 = _443 * TEXCOORD1.x;
    precise float _445 = _443 * TEXCOORD1.y;
    precise float _446 = _443 * TEXCOORD1.z;
    precise float _452 = fma(cb0._m13.y, fma(_301, _302, -0.039999999105930328369140625), 0.039999999105930328369140625);
    precise float _453 = fma(cb0._m13.y, fma(_301, _303, -0.039999999105930328369140625), 0.039999999105930328369140625);
    precise float _454 = fma(cb0._m13.y, fma(_301, _304, -0.039999999105930328369140625), 0.039999999105930328369140625);
    precise float _456 = fma(-cb0._m13.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _457 = _456 * _305;
    precise float _458 = _456 * _306;
    precise float _459 = _456 * _307;
    precise float _462 = 1.0 - cb0._m13.x;
    precise float _468 = fma(_151, _156, cb2._m0.x);
    precise float _469 = fma(_152, _156, cb2._m0.y);
    precise float _470 = fma(_153, _156, cb2._m0.z);
    vec3 _471 = vec3(_468, _469, _470);
    precise float _474 = inversesqrt(spvNMax(dp3_f32(_471, _471), 0.001000000047497451305389404296875));
    precise float _475 = _474 * _468;
    precise float _476 = _474 * _469;
    precise float _477 = _474 * _470;
    vec3 _478 = vec3(_444, _445, _446);
    precise float _482 = spvNClamp(dp3_f32(_478, cb2._m0), 0.0, 1.0);
    vec3 _483 = vec3(_475, _476, _477);
    precise float _485 = spvNClamp(dp3_f32(_478, _483), 0.0, 1.0);
    precise float _487 = spvNClamp(dp3_f32(cb2._m0, _483), 0.0, 1.0);
    precise float _488 = _487 * _487;
    precise float _492 = dp2_f32(vec2(_488), vec2(_462)) - 0.5;
    precise float _493 = 1.0 - _482;
    precise float _494 = _493 * _493;
    precise float _495 = _494 * _494;
    precise float _496 = _493 * _495;
    precise float _498 = abs(dp3_f32(_478, vec3(_157, _158, _159)));
    precise float _499 = 1.0 - _498;
    precise float _500 = _499 * _499;
    precise float _501 = _500 * _500;
    precise float _502 = _499 * _501;
    precise float _504 = fma(_492, _502, 1.0) * fma(_492, _496, 1.0);
    precise float _505 = _462 * _462;
    precise float _506 = spvNMax(_505, 0.00200000009499490261077880859375);
    precise float _507 = 1.0 - _506;
    precise float _510 = _498 * fma(_482, _507, _506);
    precise float _512 = fma(_482, fma(_498, _507, _506), _510) + 9.9999997473787516355514526367188e-06;
    precise float _513 = 0.5 / _512;
    precise float _514 = _506 * _506;
    precise float _517 = fma(fma(_485, _514, -_485), _485, 1.0);
    precise float _518 = _514 * 0.3183098733425140380859375;
    precise float _520 = _518 / fma(_517, _517, 1.0000000116860974230803549289703e-07);
    precise float _521 = _520 * _513;
    precise float _522 = _521 * 3.1415927410125732421875;
    precise float _523 = _482 * _504;
    precise float _524 = _482 * _522;
    vec3 _526 = vec3(_452, _453, _454);
    precise float _530 = ((dp3_f32(_526, _526) == 0.0) ? 0.0 : 1.0) * spvNMax(_524, 0.0);
    precise float _531 = _523 * _432;
    precise float _532 = _523 * _433;
    precise float _533 = _523 * _434;
    precise float _534 = _432 * _530;
    precise float _535 = _433 * _530;
    precise float _536 = _434 * _530;
    precise float _537 = 1.0 - _487;
    precise float _538 = _537 * _537;
    precise float _539 = _538 * _538;
    precise float _540 = _537 * _539;
    precise float _541 = 1.0 - _452;
    precise float _542 = 1.0 - _453;
    precise float _543 = 1.0 - _454;
    precise float _547 = _534 * fma(_541, _540, _452);
    precise float _548 = _535 * fma(_542, _540, _453);
    precise float _549 = _536 * fma(_543, _540, _454);
    SV_Target.x = fma(_457, _531, _547);
    SV_Target.y = fma(_458, _532, _548);
    SV_Target.z = fma(_459, _533, _549);
    SV_Target.w = 1.0;
}

