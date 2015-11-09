#include <QGuiApplication>
#include <QQuickView>
#include <QOpenGLContext>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QSurfaceFormat format;
    if (QOpenGLContext::openGLModuleType() == QOpenGLContext::LibGL) {
#ifdef Q_OS_OSX
        format.setVersion(3, 2);
#endif
        format.setProfile(QSurfaceFormat::CoreProfile);
    }

    format.setDepthBufferSize(24);
    format.setSamples(4);

    QQuickView view;
    view.setFormat(format);
    view.setResizeMode(QQuickView::SizeRootObjectToView);
    view.setSource(QUrl("qrc:/main.qml"));
    view.show();

    return app.exec();
}

