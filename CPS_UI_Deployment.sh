#! /bin/bash

#QT Deployment 
#Use deployment app for each OS



#~/Downloads/linuxdeployqt-6-x86_64.AppImage \
#/home/cps/cameracontrol/QT_UI/build-TestHal-Desktop_Qt_5_12_4_GCC_64bit-Release/usr/share/applications/TestHal.desktop \
#-always-overwrite  -appimage  -qmake=/home/cps/Qt/5.12.4/gcc_64/bin/qmake -qmldir=/home/cps/Qt/5.12.4/gcc_64/qml \
#-qmlimport=/home/cps/Qt/5.12.4/gcc_64/qml -no-translations -verbose=3 2>&1 | tee LogQT_App_1.log



# Make sure directories are created as follows

#── usr
#    ├── bin
#    │   └── your_app
#    ├── lib
#    └── share
#        ├── applications
#        │   └── your_app.desktop
#        └── icons
#            └── <theme>
#                └── <resolution> 
#                    └── apps 
#                        └── your_app.png

# Then Create the CPS_UI.desktop file
#
#
#
#
# Make sure CPS_UI (shard lib) executable is in usr/bin
#

# Make sure this is run in the proper dir (Release)

cd /home/cps/cameracontrol/QT_UI/build-CPS_UI-Desktop_Qt_5_12_4_GCC_64bit-Release

/home/cps/Downloads/linuxdeployqt-6-x86_64.AppImage \
/home/cps/cameracontrol/QT_UI/build-CPS_UI-Desktop_Qt_5_12_4_GCC_64bit-Release/usr/share/applications/CPS_UI.desktop \
-always-overwrite  -qmake=/home/cps/Qt/5.12.4/gcc_64/bin/qmake -qmldir=/home/cps/Qt/5.12.4/gcc_64/qml \
-qmlimport=/home/cps/Qt/5.12.4/gcc_64/qml -no-translations -verbose=3 2>&1 | tee LogQT_App_1.log


scp -r /home/cps/cameracontrol/QT_UI/build-CPS_UI-Desktop_Qt_5_12_4_GCC_64bit-Release/usr/* cps@cps-control-1:/home/cps/CPS_UI.AppDir/usr

