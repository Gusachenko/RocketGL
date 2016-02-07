import Qt3D 2.0
import Qt3D.Renderer 2.0

Effect {
    id: root

    property Texture2D shadowTexture
    property Light light

    parameters: [
        Parameter { name: "lightViewProjection"; value: root.light.lightViewProjection },
        Parameter { name: "lightPosition";  value: root.light.lightPosition },
        Parameter { name: "lightIntensity"; value: root.light.lightIntensity }
//        Parameter { name: "shadowMapTexture"; value: root.shadowTexture }
    ]

    techniques: [
        Technique {
            openGLFilter {
                api: OpenGLFilter.Desktop
                majorVersion: 2
            }

            annotations: [ Annotation { name: "name"; value: "ES2" } ]

            renderPasses: [
                RenderPass {
                    annotations: [ Annotation { name : "pass"; value : "forward" } ]

                    bindings: [
                        // Uniforms (those provided by the user)
                        ParameterMapping {parameterName: "ambient"; shaderVariableName: "ka"; bindingType: ParameterMapping.Uniform},
                        ParameterMapping { parameterName: "diffuse";  shaderVariableName: "kd"; bindingType: ParameterMapping.Uniform },
                        ParameterMapping { parameterName: "timeWise";  shaderVariableName: "t_time"; bindingType: ParameterMapping.Uniform }
                    ]

                    shaderProgram: ShaderProgram {
                        vertexShaderCode:   loadSource("qrc:/t_vert.vsh")
                        fragmentShaderCode: loadSource("qrc:/t_frag.fsh")
                    }

                    // no special render state set => use the default set of states
                }
            ]
        }
    ]
}
