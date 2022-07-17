#include "myclass.h"
#include <QDebug>

MyClass::MyClass(QObject *parent) : QObject(parent)
{

}

void MyClass::engineObjectCreated() {
    qDebug() << "Hello from " << __FUNCTION__;
}

void MyClass::test_button_slot()
{
    qDebug() << "Hello from " << __FUNCTION__;
}
