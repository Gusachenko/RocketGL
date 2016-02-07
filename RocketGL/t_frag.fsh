uniform highp vec3 ka;      //ambientLight
uniform highp vec3 kd;      // Diffuse reflectivity


uniform highp mat4 viewMatrix;

uniform highp vec3 lightPosition;

varying highp vec3 position;
varying vec3 normal;

void main(void)
{
//    {
//    // Calculate the vector from the light to the fragment
//    highp vec3 s = normalize(vec3(viewMatrix * vec4(lightPosition, 1.0)) - position);

//    float intensity;
//    vec4 color;

//    intensity = dot(s,normalize(normal));
//    intensity = dot(lightPosition,normalize(normal));

//    if (intensity > 0.95)
//    color = vec4(1.0,0.5,0.5,1.0);
//    else if (intensity > 0.5)
//    color = vec4(0.6,0.3,0.3,1.0);
//    else if (intensity > 0.25)
//    color = vec4(0.4,0.2,0.2,1.0);
//    else
//    color = vec4(0.2,0.1,0.1,1.0);

//    gl_FragColor = color;
//    }

//    gl_FragColor = vec4(ka, 1.0);



    float NdotL;

    NdotL = max(dot(normal, normalize(lightPosition)), 0.0);

    highp vec3 diffuseColor = NdotL * kd+ka;
    gl_FragColor = vec4(diffuseColor, 1.0);
}
