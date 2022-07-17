#ifndef JSONIO_H
#define JSONIO_H

#include <QObject>
#include <QJsonDocument>
#include <QFile>

class JSONIO : public QObject
{
    Q_OBJECT

public:
    JSONIO(QObject *parent = nullptr);

public slots:
    void updateJsonDocument(const QString& pinname, const QString& pinvalue);
    void writeJsontoFile();
    QString  updateGsheet();
    double updatePinValue(const QString& pinname);
    void setActiveToDefault();
    void setDefaultToActive();

private:
     QString homePath;
     QString filename;
     QFile jsonFile;
     QJsonDocument* jsdoc;
     QJsonObject* jsobject_orig;
     QJsonObject* jsobject;
     void readJsonFromFile();
};

#endif // JSONIO_H
