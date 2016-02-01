import QtQuick 2.4

import Qt3D.Renderer 2.0
import Qt3D 2.0
import QtQuick.Scene3D 2.0
import QtQuick.Controls 1.3

Item{
    id:i_mainRoot
    width: 600
    height: 400
    visible: true

    Scene3D{
        id:i_Scene3D
        anchors.fill: parent
        anchors.margins: 10
//        focus: true
        aspects: "input"

        MainEntitySpace{
        id:i_MainEntitySpace
        }
    }//Scene3D END


}

