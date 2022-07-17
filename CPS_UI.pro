TEMPLATE = app

QT += qml quick widgets
CONFIG += c++11


SOURCES += \
    jsonio.cpp \
    main.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
#QML_IMPORT_PATH = $$relative_path($$OUT_PWD/../qmlhalplugin/imports, $$PWD)
QML_IMPORT_PATH =

# deployment of qml files to target for mklauncher use:
QML_DESIGNER_IMPORT_PATH =

#EXP_DIR = $$system("find * -maxdepth 0 -type d")
DEFINES += QT_DEPRECATED_WARNINGS

#target.path = /home/machinekit/projects/$$TARGET
#toupload.path = /home/machinekit/projects/$$TARGET

#toupload.files = $$EXP_DIR/*.*

!isEmpty(target.path): INSTALLS += target


#INSTALLS += target toupload
#INSTALLS +=
DISTFILES += \
    ../../head_config/Head_JW_H_P_STR_01.hal \
    ../../head_config/testUI_July_2019.hal \
    /home/cps/cameracontrol/QT_UI/CPS_UI/CPS_UI.files/images/logo_text.png \
    CPS_UI.files/images/CPS_three_wheel.JPG \
    CPS_UI.files/images/Console_UI_Image.jpg

HEADERS += \
    jsonio.h
