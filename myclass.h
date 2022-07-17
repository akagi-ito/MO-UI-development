#ifndef MYCLASS_H
#define MYCLASS_H

#include <QObject>

class MyClass : public QObject
{
    Q_OBJECT
    
public:
    explicit MyClass(QObject *parent = nullptr);

public slots:
    void engineObjectCreated();
    void test_button_slot();
};

#endif // MYCLASS_H
