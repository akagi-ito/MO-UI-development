#include <QFile>
#include <QJsonObject>
#include <QJsonArray>
#include <QJsonValue>
#include <QDir>
#include <QProcess>
#include <QDebug>
#include "jsonio.h"

JSONIO::JSONIO(QObject *parent) : QObject(parent)
{
    homePath = QDir::homePath();
    filename= homePath + "/cameracontrol/SDO_coeff/joystick_parameter_data.txt";
    jsonFile.setFileName(filename);
    readJsonFromFile();
}


void JSONIO::updateJsonDocument(const QString& pinname, const QString& pinvalue)
{
   QJsonArray valuesArray = (*jsobject)["values"].toArray();
   for (int i=0; i < valuesArray.size(); i++)
   {
       QJsonArray jsArray2 = valuesArray[i].toArray();
       if (!jsArray2.isEmpty())
       {
           if (jsArray2[0].toString()==pinname)
           {
               jsArray2[1] = QJsonValue(pinvalue);
               valuesArray[i] = jsArray2;
               (*jsobject)["values"] =   valuesArray;
               qDebug()<< jsArray2;
               break;
           }
       }
   }
}

void JSONIO::writeJsontoFile()
{
    if (!jsonFile.open(QIODevice::WriteOnly))
    {
        return;
    }

    // Write the current Json object to a file.
    qDebug() << "Write Function reached" ;
    jsdoc->setObject(*jsobject);
    jsonFile.write(jsdoc->toJson(QJsonDocument::Indented));
    jsonFile.close();
    qDebug() << "Write Function Closed" ;
}

void JSONIO::setActiveToDefault()
{
   delete jsobject;
   jsobject = new QJsonObject(*jsobject_orig);
}

void JSONIO::setDefaultToActive()
{
    delete jsobject_orig;
    jsobject_orig = new QJsonObject(*jsobject);
}

double JSONIO::updatePinValue(const QString& pinname)
{
    QJsonArray valuesArray = (*jsobject)["values"].toArray();
    for (int i=0; i < valuesArray.size(); i++)
    {
        QJsonArray jsArray2 = valuesArray[i].toArray();
        if (!jsArray2.isEmpty())
        {
            if (jsArray2[0].toString()==pinname)
            {
                qDebug() << "updatePinValuefunction output : " <<  jsArray2[1].toString().toDouble();
                return jsArray2[1].toString().toDouble();
            }
        }
    }
    return 9.9;
}

void JSONIO::readJsonFromFile()
{
    if (!jsonFile.open(QIODevice::ReadOnly))
    {
        return;
    }
    // Read the entire file
    QByteArray saveData = jsonFile.readAll();
    jsonFile.close();
    // Create QJsonDocument
    jsdoc = new QJsonDocument (QJsonDocument::fromJson(saveData));
    jsobject = new QJsonObject(jsdoc->object());
    jsobject_orig = new QJsonObject(jsdoc->object());
    qDebug()<< jsdoc->toJson();
}

QString JSONIO::updateGsheet()
{
    QProcess process_sdcompare;
    writeJsontoFile();
    process_sdcompare.setProgram(homePath + "/cameracontrol/SDO_coeff/JS_update.py");
    process_sdcompare.start();

    if (process_sdcompare.waitForStarted() && process_sdcompare.waitForFinished()) 
    {
      QString StdOut_sdcompare = process_sdcompare.readAllStandardOutput();
      //QString StdError_sdcompare = process_sdcompare.readAllStandardError();

      if(!StdOut_sdcompare.isEmpty() && StdOut_sdcompare.simplified().contains("Successfully"))
          return "OK";
      else
          return "ERROR";
    }

    return "ERROR";
}
