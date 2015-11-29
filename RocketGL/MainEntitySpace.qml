import Qt3D 2.0
import Qt3D.Renderer 2.0
import QtQuick 2.0 as QQ2

Entity{

    Light{
        id: light
        ratio: width / height
    }

    Camera {
        id: camera
        projectionType: CameraLens.PerspectiveProjection
        fieldOfView: 45
        aspectRatio: width / height
        nearPlane: 0.01
        farPlane: 1000.0
        position: Qt.vector3d( 0.0, 0.0, 15.0 )
        upVector:  Qt.vector3d(0, 1, 0)
        viewCenter: Qt.vector3d( 0, 0, 0 )
    }

    Configuration  {
        controlledCamera: camera
    }

    components: [
        RocketFrameGraph {          //ФОН сцены
            id: framegraph
            viewCamera: camera
            lightCamera: light.lightCamera
        }
//                FrameGraph {
//                    activeFrameGraph: ForwardRenderer {
//                        id: renderer
//                        camera: camera
//                    }
//                }
    ]


//    //    //


    RocketShadowEffect{                                         //!!!!
        id: shadowMapEffectD
        shadowTexture: framegraph.shadowTexture
        light: light
    }

    Rocket{
        id: i_Rocket
    }

    Entity{
        id: i_Rocket_Entity

        property Material material_Rocket: RocketMaterial {
            effect: shadowMapEffectD                            //!!!!
            ambientLight: "green"
            specularColor: Qt.rgba(0.01, 0.01, 0.01, 1.0)
            diffuseMap: "qrc:/img/saturnmap.jpg"
            shininess: 1.0
            opacity: 0.4
        }

        property Transform transform_Rocket: Transform {
            Scale {
                scale:  1.75
            }
            Rotate {
                axis: Qt.vector3d(0, 1, 0)
                angle:  10
            }
            Rotate {
                axis: Qt.vector3d(0, 0, 1)
                angle: 10
            }
            Translate {
                translation: Qt.vector3d(0, 1, 0)
            }

        }

        components: [ i_Rocket, material_Rocket, transform_Rocket ]
    }

 }
