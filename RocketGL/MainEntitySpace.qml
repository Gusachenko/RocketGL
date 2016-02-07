import Qt3D 2.0
import Qt3D.Renderer 2.0

Entity{
    id:i_MainEntitySpace


    Light{
        id: light
        ratio: width / height
    }

    Camera {
        id: camera
        projectionType: CameraLens.PerspectiveProjection
        fieldOfView: 60
        aspectRatio: width / height
        nearPlane: 0.01
        farPlane: 1000.0
        position: Qt.vector3d( 0.0, 0.0, 25.0 )
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
    ]


//    //    //


    RocketShadowEffect{                                         //!!!!
        id: shadowMapEffectD
        shadowTexture: framegraph.shadowTexture
        light: light
    }

    //OBJECTS
    Rocket{
        id: i_Rocket
    }

    //ROCKET ENTITY
    Entity{

        property Material material_Rocket: RocketMaterial {
            effect: shadowMapEffectD                            //!!!!
            ambientLight: "green"
        }

        property Transform transform_Rocket: Transform {
            Scale {
                scale:  1.75
            }
            Rotate {
                axis: Qt.vector3d(1, 0, 0)
                angle:  0
            }
            Rotate {
                axis: Qt.vector3d(0, 1, 0)
                angle: 0
            }
            Rotate {
                axis: Qt.vector3d(0, 0, -1)
                angle: 30
            }
            Translate {
                translation: Qt.vector3d(0.1, 0.1, 0)
            }

        }
        components: [ i_Rocket, material_Rocket, transform_Rocket ]
    }

 }
