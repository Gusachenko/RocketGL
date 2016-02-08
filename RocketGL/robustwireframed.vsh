//#version 2 core

attribute vec3 vertexPosition;
attribute vec3 vertexNormal;
attribute vec2 vertexTexCoord;

varying vec4 positionInLightSpace;
varying vec3 position;
varying vec3 normal;
varying vec2 texCoord;

uniform mat4 lightViewProjection;
uniform mat4 modelMatrix;
uniform mat4 modelView;
uniform mat3 modelViewNormal;
uniform mat4 mvp;       //gl_ModelViewProjectionMatrix

uniform float texCoordScale;

void main()
{
    positionInLightSpace = lightViewProjection * modelMatrix * vec4(vertexPosition, 1.0);

    texCoord = vertexTexCoord * texCoordScale;
    normal = normalize(modelViewNormal * vertexNormal);
    position = vec3(modelView * vec4(vertexPosition, 1.0));

    gl_Position = mvp * vec4(vertexPosition, 1.0);      //gl_ModelViewProjectionMatrix * gl_Vertex
}
