import Qt3D 2.0
import Qt3D.Renderer 2.0
import QtQuick 2.1

Material {
    id: root
    property color ambientLight: Qt.rgba(0.1, 0.1, 0.1, 1.0)
    property color diffuseColor: Qt.rgba(0.7, 0.7, 0.7, 1.0)
    property color specularColor: Qt.rgba(0.5, 0.5, 0.5, 1.0)
    property real shininess: 150.0
    property alias diffuseMap: diffuseTextureImage.source
    property alias specularMap: specularTextureImage.source
    property alias normalMap: normalTextureImage.source
    property real textureScale: 1.0
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
            name: "diffuseTexture"
            value: Texture2D {
                id: diffuseTexture
                minificationFilter: Texture.LinearMipMapLinear
                magnificationFilter: Texture.Linear
                wrapMode {
                    x: WrapMode.Repeat
                    y: WrapMode.Repeat
                }
                generateMipMaps: true
                maximumAnisotropy: 16.0
                TextureImage { id: diffuseTextureImage }
            }
        },
        Parameter {
            name: "specularTexture"
            value: Texture2D {
                id: specularTexture
                minificationFilter: Texture.LinearMipMapLinear
                magnificationFilter: Texture.Linear
                wrapMode {
                    x: WrapMode.Repeat
                    y: WrapMode.Repeat
                }
                generateMipMaps: true
                maximumAnisotropy: 16.0
                TextureImage { id: specularTextureImage }
            }
        },
        Parameter {
            name: "normalTexture"
            value: Texture2D {
                id: normalTexture
                minificationFilter: Texture.Linear
                magnificationFilter: Texture.Linear
                wrapMode {
                    x: WrapMode.Repeat
                    y: WrapMode.Repeat
                }
                maximumAnisotropy: 16.0
                TextureImage { id: normalTextureImage }
            }
        },
        Parameter {
            name: "texCoordScale"
            value: textureScale
        },
        Parameter {
            name: "opacity"
            value: opacity
        }
    ]
}
