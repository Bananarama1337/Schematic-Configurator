#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "diagramdocument.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    DiagramDocument document;
    engine.rootContext()->setContextProperty("diagramDocument", &document);

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("schematic_builder", "Main");

    return app.exec();
}
