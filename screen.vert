#version 450

layout(location = 0) out vec2 fragCoord;

vec2 positions[4] = vec2[](
    vec2(-1.0,-1.0),
    vec2(1.0,-1.0),
    vec2(1.0,1.0),
    vec2(-1.0,1.0)
);

// vec3 colors[3] = vec3[](
//     vec3(1.0, 0.0, 0.0),
//     vec3(0.0, 1.0, 0.0),
//     vec3(0.0, 0.0, 1.0)
// );

void main() {
    gl_Position = vec4(positions[gl_VertexIndex], 0.0, 1.0);
    fragCoord = vec2(positions[gl_VertexIndex].x,-positions[gl_VertexIndex].y);
}

