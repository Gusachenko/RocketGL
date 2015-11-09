import Qt3D.Renderer 2.0
import Qt3D 2.0

Entity{

    // Render from the mainCamera
    components: [
        FrameGraph {
            activeFrameGraph: ForwardRenderer {
                id: renderer
                camera: mainCamera
            }
        }
    ]

    BasicCamera{
        id: mainCamera
        position: Qt.vector3d( 0.0, 0.0, 15.0 )
    }

    Configuration  {
        controlledCamera: mainCamera
    }

    CustomObjectGL{
        id:i_customObjectGL
        material: wireframeMaterial
    }

 }
