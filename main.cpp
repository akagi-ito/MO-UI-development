#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "jsonio.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.addImportPath(QStringLiteral("imports"));
    engine.addImportPath(QStringLiteral("assets:/imports"));

    JSONIO jsonio;
    engine.rootContext()->setContextProperty("jsonio", &jsonio);

    engine.load(QUrl(QStringLiteral("qrc:///main.qml")));

    return app.exec();
}
