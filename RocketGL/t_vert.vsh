//Default values
attribute vec3 vertexPosition;
attribute vec3 vertexNormal;

//built-in values?
uniform mat4 mvp;
uniform mat4 modelView;
uniform mat3 modelViewNormal;

varying vec3 position;
varying vec3 normal;

//Simple Values
uniform float t_time;


void main(void)
{
    vec4 rw_vertexPosition=vec4(vertexPosition, 1.0);
//    rw_vertexPosition.z=sin(5.0*rw_vertexPosition.y+t_time*0.1)*0.25;

    position = vec3(modelView * vec4(vertexPosition, 1.0));
    normal = normalize(modelViewNormal * vertexNormal);

    gl_Position = mvp * rw_vertexPosition;
}
