import Qt3D 2.0
import Qt3D.Renderer 2.0
import QtQuick 2.1

Material {
    id: root
    property color ambientLight: Qt.rgba(0.1, 0.1, 0.1, 1.0)
    property color diffuseColor: Qt.rgba(0.7, 0.7, 0.7, 1.0)
    property color specularColor: Qt.rgba(0.7, 0.0, 0.0, 1.0)
    property real shininess: 1.0
    property real opacity: 1.0

    parameters: [
        Parameter {
            name: "ambient"
            value: Qt.vector3d(root.ambientLight.r, root.ambientLight.g, root.ambientLight.b)
        },
        Parameter {
            name: "diffuse"
            value: Qt.vector3d(root.diffuseColor.r, root.diffuseColor.g, root.diffuseColor.b)
        },
        Parameter {
            name: "specular"
            value: Qt.vector3d(root.specularColor.r, root.specularColor.g, root.specularColor.b)
        },
        Parameter {
            name: "shininess"
            value: root.shininess
        },
        Parameter {
            name: "opacity"
            value: opacity
        }
    ]
}
