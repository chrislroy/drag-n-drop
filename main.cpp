#include "treemodel.h"
#include "customtype.h"

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include <QFile>

int main(int argc, char *argv[])
{
    Q_INIT_RESOURCE(treeview);

    QGuiApplication app(argc, argv);

    QFile file(":/default.txt");
    file.open(QIODevice::ReadOnly);
    TreeModel model(file.readAll());
    file.close();

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("theModel",&model);
    qmlRegisterType<CustomType>("hvoigt.net", 1, 0, "CustomType");

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
