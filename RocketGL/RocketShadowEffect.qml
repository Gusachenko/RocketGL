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
                        ParameterMapping {
                            parameterName: "ambient";
                            shaderVariableName: "ka";
                            bindingType: ParameterMapping.Uniform
                        },
                        ParameterMapping { parameterName: "diffuse";  shaderVariableName: "kd"; bindingType: ParameterMapping.Uniform },
                        ParameterMapping {
                            parameterName: "specular";
                            shaderVariableName: "ks";
                            bindingType: ParameterMapping.Uniform
                        }
                    ]

                    shaderProgram: ShaderProgram {
                        vertexShaderCode:   loadSource("qrc:/robustwireframed.vsh")
                        fragmentShaderCode: loadSource("qrc:/robustwireframed.frag")
                    }

                    // no special render state set => use the default set of states
                }
            ]
        }
//        ,
//        Technique {
//            openGLFilter {
//                api: OpenGLFilter.ES
//                majorVersion: 2
//                minorVersion: 0
//            }

//            annotations: [ Annotation { name: "name"; value: "ES2" } ]

//            renderPasses: [
//                RenderPass {
//                    annotations: [ Annotation { name : "pass"; value : "forward" } ]

//                    bindings: [
//                        // Uniforms (those provided by the user)
//                        ParameterMapping {
//                            parameterName: "ambient";
//                            shaderVariableName: "ka";
//                            bindingType: ParameterMapping.Uniform
//                        },
//                        ParameterMapping {
//                            parameterName: "specular";
//                            shaderVariableName: "ks";
//                            bindingType: ParameterMapping.Uniform
//                        }
//                    ]

//                    shaderProgram: ShaderProgram {
//                        vertexShaderCode:   loadSource("qrc:/robustwireframed.vsh")
//                        fragmentShaderCode: loadSource("qrc:/robustwireframed.frag")
//                    }

//                    // no special render state set => use the default set of states
//                }
//            ]
//        }
    ]
}
