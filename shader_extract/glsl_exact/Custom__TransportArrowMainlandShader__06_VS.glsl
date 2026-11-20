#version 450
#extension GL_EXT_buffer_reference2 : require

invariant gl_Position;

layout(set = 0, binding = 0, std140) uniform cb0_buf
{
    vec4 _m0;
    vec4 _m1;
    vec4 _m2;
    vec4 _m3;
    vec3 _m4;
    uint _m5;
    vec3 _m6;
    uint _m7;
    vec3 _m8;
    uint _m9;
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
    vec4 _m17;
    vec4 _m18;
    vec4 _m19;
    vec4 _m20;
} cb1;

layout(location = 0, component = 0) in vec4 POSITION;
layout(location = 2, component = 0) in vec3 NORMAL;
layout(location = 1, component = 0) out vec3 TEXCOORD;
layout(location = 2, component = 0) out vec3 TEXCOORD1;

float dp3_f32(vec3 a, vec3 b)
{
    precise float _41 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _41));
}

void main()
{
    precise float _63 = POSITION.y * cb0._m1.x;
    precise float _64 = POSITION.y * cb0._m1.y;
    precise float _65 = POSITION.y * cb0._m1.z;
    precise float _66 = POSITION.y * cb0._m1.w;
    precise float _75 = fma(cb0._m0.x, POSITION.x, _63);
    precise float _76 = fma(cb0._m0.y, POSITION.x, _64);
    precise float _77 = fma(cb0._m0.z, POSITION.x, _65);
    precise float _78 = fma(cb0._m0.w, POSITION.x, _66);
    precise float _87 = fma(cb0._m2.x, POSITION.z, _75);
    precise float _88 = fma(cb0._m2.y, POSITION.z, _76);
    precise float _89 = fma(cb0._m2.z, POSITION.z, _77);
    precise float _90 = fma(cb0._m2.w, POSITION.z, _78);
    precise float _97 = _87 + cb0._m3.x;
    precise float _98 = _88 + cb0._m3.y;
    precise float _99 = _89 + cb0._m3.z;
    precise float _100 = _90 + cb0._m3.w;
    TEXCOORD1.x = fma(cb0._m3.x, POSITION.w, _87);
    TEXCOORD1.y = fma(cb0._m3.y, POSITION.w, _88);
    TEXCOORD1.z = fma(cb0._m3.z, POSITION.w, _89);
    precise float _122 = _98 * cb1._m18.x;
    precise float _123 = _98 * cb1._m18.y;
    precise float _124 = _98 * cb1._m18.z;
    precise float _125 = _98 * cb1._m18.w;
    precise float _132 = fma(cb1._m17.x, _97, _122);
    precise float _133 = fma(cb1._m17.y, _97, _123);
    precise float _134 = fma(cb1._m17.z, _97, _124);
    precise float _135 = fma(cb1._m17.w, _97, _125);
    precise float _142 = fma(cb1._m19.x, _99, _132);
    precise float _143 = fma(cb1._m19.y, _99, _133);
    precise float _144 = fma(cb1._m19.z, _99, _134);
    precise float _145 = fma(cb1._m19.w, _99, _135);
    precise float _152 = fma(cb1._m20.x, _100, _142);
    precise float _153 = fma(cb1._m20.y, _100, _143);
    precise float _154 = fma(cb1._m20.z, _100, _144);
    precise float _155 = fma(cb1._m20.w, _100, _145);
    gl_Position.x = _152;
    gl_Position.y = _153;
    gl_Position.z = _154;
    gl_Position.w = _155;
    vec3 _166 = vec3(NORMAL.x, NORMAL.y, NORMAL.z);
    float _170 = dp3_f32(_166, cb0._m4);
    float _173 = dp3_f32(_166, cb0._m6);
    float _176 = dp3_f32(_166, cb0._m8);
    vec3 _177 = vec3(_170, _173, _176);
    precise float _179 = inversesqrt(dp3_f32(_177, _177));
    precise float _180 = _179 * _170;
    precise float _181 = _179 * _173;
    precise float _182 = _179 * _176;
    TEXCOORD.x = _180;
    TEXCOORD.y = _181;
    TEXCOORD.z = _182;
}

