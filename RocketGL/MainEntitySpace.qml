import Qt3D 2.0
import Qt3D.Renderer 2.0
import QtQuick 2.0 as QQ2

import QtQuick 2.4 as BB

Entity{
    id:i_MainEntitySpace


    property real test_val: 0.1
    function testmove(){return test_val=test_val+0.1;}

    property real moveTo_X: 0.1
    property real moveTo_Y: 0.1
    property real motion_Angle_CircleValue: 30

    function toRocketCircleMotion(){
        motion_Angle_CircleValue=motion_Angle_CircleValue+1;

        if(motion_Angle_CircleValue<90){
            moveTo_X=moveTo_X+0.1;
            moveTo_Y=moveTo_Y+0.1;
        }else
        if(motion_Angle_CircleValue<180){
            moveTo_X=moveTo_X+0.1;
            moveTo_Y=moveTo_Y-0.1;
        }else
        if(motion_Angle_CircleValue<270){
            moveTo_X=moveTo_X-0.1;
            moveTo_Y=moveTo_Y-0.1;
        }
        else
        if(motion_Angle_CircleValue<360){
            moveTo_X=moveTo_X-0.1;
            moveTo_Y=moveTo_Y+0.1;
        }else
        if(motion_Angle_CircleValue==360){
            moveTo_X=moveTo_X+0.1;
            moveTo_Y=moveTo_Y+0.1;
            motion_Angle_CircleValue=0.1;
        }
    }


    ////////////////////////////////////////////////////////////////

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

    //ROCKET ENTITY
    Entity{

        BB.Timer{
                        running: true
                        repeat: true
                        interval: 100
                        onTriggered: testmove(),toRocketCircleMotion()
        }


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
                axis: Qt.vector3d(1, 0, 0)
                angle:  0
            }
            Rotate {
                axis: Qt.vector3d(0, 1, 0)
                angle: test_val*50
            }
            Rotate {
                axis: Qt.vector3d(0, 0, -1)
                angle: motion_Angle_CircleValue
            }
            Translate {
                translation: Qt.vector3d(moveTo_X, moveTo_Y, 0)
            }

        }
        components: [ i_Rocket, material_Rocket, transform_Rocket ]
    }

 }
