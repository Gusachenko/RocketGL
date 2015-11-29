import QtQuick 2.0

import Qt3D 2.0
import Qt3D.Renderer 2.0

FrameGraph {
    id: root

    property alias viewCamera: viewCameraSelector.camera
    property alias lightCamera: lightCameraSelector.camera
    readonly property Texture2D shadowTexture: depthTexture

    activeFrameGraph: Viewport {
        rect: Qt.rect(0.0, 0.0, 1.0, 1.0)
        clearColor: "grey"

        TechniqueFilter {
            requires: [ Annotation { name: "name"; value: "Desktop" } ]


            RenderPassFilter {
                includes: [ Annotation { name: "pass"; value: "shadowmap" } ]

                RenderTargetSelector {
                    target: RenderTarget {
                        attachments: [
                            RenderAttachment {
                                name: "depth"
                                type: RenderAttachment.DepthAttachment
                                texture: Texture2D {
                                    id: depthTexture
                                    width: i_mainRoot.width
                                    height: i_mainRoot.height
                                    format: Texture.D24
                                    generateMipMaps: false
                                    magnificationFilter: Texture.Linear
                                    minificationFilter: Texture.Linear
                                    wrapMode {
                                        x: WrapMode.ClampToEdge
                                        y: WrapMode.ClampToEdge
                                    }
                                    comparisonFunction: Texture.CompareLessEqual
                                    comparisonMode: Texture.CompareRefToTexture
                                }
                            }
                        ]
                    }

                    ClearBuffer {
                        buffers: ClearBuffer.DepthBuffer

                        CameraSelector {
                            id: lightCameraSelector
                        }
                    }
                }
            }
        }

        RenderPassFilter {
            includes: [ Annotation { name: "pass"; value: "forward" } ]

            ClearBuffer {
                buffers: ClearBuffer.ColorDepthBuffer

                CameraSelector {
                    id: viewCameraSelector
                }
            }
        }
    }
}
