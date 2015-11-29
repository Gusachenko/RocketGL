import Qt3D 2.0
import Qt3D.Renderer 2.0

Effect {
    id: root

    property Texture2D shadowTexture
    property Light light

    parameters: [
        Parameter { name: "lightViewProjection"; value: root.light.lightViewProjection },
        Parameter { name: "lightPosition";  value: root.light.lightPosition },
        Parameter { name: "lightIntensity"; value: root.light.lightIntensity },
        Parameter { name: "shadowMapTexture"; value: root.shadowTexture }
    ]

    techniques: [
        Technique {
            openGLFilter {
                api: OpenGLFilter.Desktop
                profile: OpenGLFilter.Core
                majorVersion: 3
                minorVersion: 2
            }

            annotations: [ Annotation { name: "name"; value: "Desktop" } ]

            renderPasses: [
                RenderPass {
                    annotations: [ Annotation { name: "pass"; value: "shadowmap" } ]

                    shaderProgram: ShaderProgram {
                        vertexShaderCode:   loadSource("qrc:/robustwireframed.vsh")
                        fragmentShaderCode: loadSource("qrc:/robustwireframed.frag")
                    }

                    renderStates: [
                        PolygonOffset { factor: 4; units: 4 },
                        DepthTest { func: DepthTest.Less }
                    ]
                },
                RenderPass {
                    annotations: [ Annotation { name : "pass"; value : "forward" } ]

                    bindings: [
                        // Uniforms (those provided by the user)
                        ParameterMapping {
                            parameterName: "ambient";
                            shaderVariableName: "ka";
                            bindingType: ParameterMapping.Uniform
                        },
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
        },
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
        },
        Technique {
            openGLFilter {
                api: OpenGLFilter.ES
                majorVersion: 2
                minorVersion: 0
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
    ]
}
