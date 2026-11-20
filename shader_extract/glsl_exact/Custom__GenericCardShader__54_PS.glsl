#version 450
#extension GL_EXT_buffer_reference2 : require

layout(location = 0, component = 0) out vec4 SV_Target;

void main()
{
    SV_Target.x = 0.0;
    SV_Target.y = 0.0;
    SV_Target.z = 0.0;
    SV_Target.w = 0.0;
}

