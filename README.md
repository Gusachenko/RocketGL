# RocketGL
Qt3D Sample<br/>
Qt 5.5.1

#Add Shader Vertex GLSL to obj
1.CustomObjectGL: creating material.
-ambient(окружающий, окружающая среда). ambient: Qt.rgba( 0.2, 0.0, 0.0, 1.0 )
        
-diffuse(расплывчатый, рассеяный, смашанный). diffuse: Qt.rgba( 0.8, 0.0, 0.0, 1.0 )

    property color ambient: Qt.rgba( 0.05, 0.05, 0.05, 1.0 )
    property color diffuse: Qt.rgba( 0.7, 0.7, 0.7, 1.0 )
    property color specular: Qt.rgba( 0.95, 0.95, 0.95, 1.0 )		//Зеркальный 
    property real shininess: 150.0					//Блеска
    property real lineWidth: 0.8
    property color lineColor: Qt.rgba( 0.0, 0.0, 0.0, 1.0 )

