#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "passwordgeneratorobject.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType<PasswordGeneratorObject>("com.esteban.password", 1, 0, "Password");

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/PasswordGenerator/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
