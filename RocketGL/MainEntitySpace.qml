import Qt3D 2.0
import Qt3D.Renderer 2.0
import QtQuick 2.0 as QQ2

import QtQuick 2.4 as BB

Entity{

    property real test_val: 0.1

    function testmove(){return test_val=test_val+0.1;}

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

    //OBJECTS
    Rocket{
        id: i_Rocket
    }
    StandBasic{
        id:i_StandBasic
    }
    StandRotateMain1{
        id:i_RotateMain1
    }
    StandRotateMain2{
        id:i_RotateMain2
    }
    StandRotateMain3{
        id:i_RotateMain3
    }


    //StandBasic:ENTITY
    Entity{
        property Material material_Rocket: RocketMaterial {
            effect: shadowMapEffectD                            //!!!!
            ambientLight: "red"
            specularColor: Qt.rgba(0.2, 0.2, 0.2, 1.0)
            diffuseMap: "qrc:/img/saturnmap.jpg"
            shininess: 1.0
            opacity: 1.0
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
                angle: 0
            }
            Translate {
                translation: Qt.vector3d(0, 1, 0)
            }

        }

        components: [ i_StandBasic, material_Rocket, transform_Rocket ]
    }

    //StandRotateMain1:ENTITY
    Entity{
        property Material material_Rocket: RocketMaterial {
            effect: shadowMapEffectD                            //!!!!
            ambientLight: "#F03939"
            specularColor: Qt.rgba(0.2, 0.2, 0.2, 1.0)
            diffuseMap: "qrc:/img/saturnmap.jpg"
            shininess: 1.0
            opacity: 1.0
        }

        property Transform transform_Rocket: Transform {
            Scale {
                scale:  1.75
            }
            Rotate {
                axis: Qt.vector3d(0, 1, 0)
                angle: 10/*sliderVertical1.value*/
            }
            Rotate {
                axis: Qt.vector3d(0, 0, 1)
                angle: 0
            }
            Translate {
                translation: Qt.vector3d(0, 1, 0)
            }

        }
        components: [ i_RotateMain1, material_Rocket, transform_Rocket ]
    }

    //StandRotateMain2:ENTITY
    Entity{
        property Material material_Rocket: RocketMaterial {
            effect: shadowMapEffectD                            //!!!!
            ambientLight: "white"
            specularColor: Qt.rgba(0.2, 0.2, 0.2, 1.0)
            diffuseMap: "qrc:/img/saturnmap.jpg"
            shininess: 1.0
            opacity: 1.0
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
                angle: 0
            }
            Translate {
                translation: Qt.vector3d(0, 1, 0)
            }

        }
        components: [ i_RotateMain2, material_Rocket, transform_Rocket ]
    }

    //StandRotateMain3:ENTITY
    Entity{
        property Material material_Rocket: RocketMaterial {
            effect: shadowMapEffectD                            //!!!!
            ambientLight: "#259C7E"
            specularColor: Qt.rgba(0.2, 0.2, 0.2, 1.0)
            diffuseMap: "qrc:/img/saturnmap.jpg"
            shininess: 1.0
            opacity: 1.0
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
                angle: 0
            }
            Translate {
                translation: Qt.vector3d(0, 1, 0)
            }

        }
        components: [ i_RotateMain3, material_Rocket, transform_Rocket ]
    }


//    //ROCKET ENTITY
//    Entity{

//        BB.Timer{
//                        running: true
//                        repeat: true
//                        interval: 100
//                        onTriggered: testmove()
//        }


//        property Material material_Rocket: RocketMaterial {
//            effect: shadowMapEffectD                            //!!!!
//            ambientLight: "green"
//            specularColor: Qt.rgba(0.01, 0.01, 0.01, 1.0)
//            diffuseMap: "qrc:/img/saturnmap.jpg"
//            shininess: 1.0
//            opacity: 0.4
//        }

//        property Transform transform_Rocket: Transform {
//            Scale {
//                scale:  1.75
//            }
//            Rotate {
//                axis: Qt.vector3d(0, 1, 0)
//                angle:  test_val*50
//            }
//            Rotate {
//                axis: Qt.vector3d(0, 0, 1)
//                angle: 0
//            }
//            Translate {
//                translation: Qt.vector3d(0, test_val, 0)
//            }

//        }
//        components: [ i_Rocket, material_Rocket, transform_Rocket ]
//    }

 }
