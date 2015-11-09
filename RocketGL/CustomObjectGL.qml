import QtQuick 2.0

import Qt3D 2.0
import Qt3D.Renderer 2.0

Entity {
    id:i_customObjectGL

    property alias x: translation.dx
    property alias y: translation.dy
    property alias z: translation.dz
    property alias scale: scaleTransform.scale
    property alias theta: thetaRotation.angle
    property alias phi: phiRotation.angle
    property Material material

    components: [ transform, mesh, i_customObjectGL.material ]

    Transform {
        id: transform
        Translate { id: translation }
        Scale { id: scaleTransform }
        Rotate{ id: thetaRotation; axis: Qt.vector3d( 1.0, 0.0, 0.0 ) }
        Rotate{ id: phiRotation;   axis: Qt.vector3d( 0.0, 1.0, 0.0 ) }
    }

    Mesh {
        id: mesh
        source: "/geometryObjects/rocketSample.obj"
    }

}
