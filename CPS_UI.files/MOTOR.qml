
import QtQuick 2.1
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Window 2.0
import QtQml.Models 2.1
import Machinekit.Application 1.0
import Machinekit.Application.Controls 1.0
import Machinekit.Service 1.0
import Machinekit.Controls 1.0
import Machinekit.HalRemote.Controls 1.0
import Machinekit.HalRemote 1.0

Item {
    id : motor_item
    x: 0
    y: 0
    width: parent.width
    height: parent.height
    visible: true
    anchors.fill: parent

    Item{                   // Holds variables that drive the whole Tab
        id : variable_motor
        property real font_size_scaler: 0.012
        property real tick_font_size_scaler: 0.008
        property real font_size: (variable_motor.font_size_scaler * parent.width * parent.height / 1500) + 7
        property real tick_font_size: variable_motor.tick_font_size_scaler * parent.width
        property real light_mode: button_light.checked ? 1 : 0
    }

    Image {
        id: js_console_image
        source: button_light.checked ? "file:///home/cps/cameracontrol/QT_UI/CPS_UI/CPS_UI.files/images/CPS_motor_L.jpg" : "file:///home/cps/cameracontrol/QT_UI/CPS_UI/CPS_UI.files/images/CPS_motor_D.jpg"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        fillMode: Image.PreserveAspectFit
        scale: 0.7
        anchors.fill: parent
        smooth: true
        visible: true

        //pan motor tuning 2 areas
        RoundMouseArea {
            id: roundMouseArea_left_js
            width: js_console_image.width / 10
            height: js_console_image.width / 12
            anchors.verticalCenter: js_console_image.verticalCenter
            anchors.verticalCenterOffset: (-1 * js_console_image.paintedHeight * 0.2640)
            anchors.horizontalCenter: js_console_image.horizontalCenter
            anchors.horizontalCenterOffset: (-1 * js_console_image.paintedWidth * 0.10335)

            onClicked: {
                lf_js_dialog.open()
            }

            Text {
                id: pan_title
                x:-120 * js_console_image.width / 1600
                y:-120 * js_console_image.height / 1000
                color: button_light.checked ? "black" : "white"
                font.pointSize: variable_motor.font_size
                text: qsTr("Pan Motor<br>Tuning")
            }

            Rectangle {
                color: "transparent"
                border.color: roundMouseArea_left_js.pressed ? "white" : "transparent"
                border.width: width/8
                anchors.fill: parent
                radius: height/2
            }

            Dialog {
                id: lf_js_dialog
                width: 300
                height: 300
                modal: true
                focus: true
                standardButtons: Dialog.close()
                
                Rectangle {
                    width: parent.width
                    height: parent.height
                    Text {
                        text: "hello world"
                    }
                }
            }
        }

        RoundMouseArea {
            id: roundMouseArea2_left_js
            width: js_console_image.width / 12
            height: js_console_image.width / 18
            anchors.verticalCenter: js_console_image.verticalCenter
            anchors.verticalCenterOffset: (-1 * js_console_image.paintedHeight * 0.4040)
            anchors.horizontalCenter: js_console_image.horizontalCenter
            anchors.horizontalCenterOffset: (-1 * js_console_image.paintedWidth * 0.07035)

            onClicked: {
                lf_js_dialog.open()
            }

            Rectangle {
                color: "transparent"
                border.color: roundMouseArea2_left_js.pressed ? "white" : "transparent"
                border.width: width/8
                anchors.fill: parent
                radius: height/2
            }
        }

        //roll motor area
        RoundMouseArea {
            id: roundMouseArea_left_js2
            width: js_console_image.width / 8
            height: js_console_image.width / 15
            anchors.verticalCenter: js_console_image.verticalCenter
            anchors.verticalCenterOffset: (1 * js_console_image.paintedHeight * 0.0140)
            anchors.horizontalCenter: js_console_image.horizontalCenter
            anchors.horizontalCenterOffset: (1 * js_console_image.paintedWidth * 0.2785)

            onClicked: {
                lf_js_dialog2.open()
            }

            Text {
                id: roll_title
                x:150 * js_console_image.width / 1600
                y:-100 * js_console_image.height / 1000
                color: button_light.checked ? "black" : "white"
                font.pointSize: variable_motor.font_size
                text: qsTr("Roll Motor<br>Tuning")
            }

            Rectangle {
                color: transparent"
                border.color: roundMouseArea_left_js2.pressed ? "white" : "transparent"
                border.width: width/8
                anchors.fill: parent
                radius: width/2
            }

            Dialog {
                id: lf_js_dialog2
                width: 300
                height: 300
                modal: true
                focus: true
                standardButtons: Dialog.close()
                
                Rectangle {
                    width: parent.width
                    height: parent.height
                    Text {
                        text: "hello world"
                    }
                }
            }
        }

        //tilt motor tuning 2 areas
        RoundMouseArea {
            id: roundMouseArea_bottom_js
            width: js_console_image.width / 8
            height: js_console_image.width / 9
            anchors.verticalCenter: js_console_image.verticalCenter
            anchors.verticalCenterOffset: (js_console_image.paintedHeight * 0.2940)
            anchors.horizontalCenter: js_console_image.horizontalCenter
            anchors.horizontalCenterOffset: (-1 * js_console_image.paintedWidth * 0.12335)

            Text {
                id: tilt_title
                x:-120 * js_console_image.width / 1600
                y:-120 * js_console_image.height / 1000
                color: button_light.checked ? "black" : "white"
                font.pointSize: variable_motor.font_size
                text: qsTr("Tilt Motor<br>Tuning")
            }

            onClicked: {
                lf_js_dialog3.open()
            }

            Rectangle {
                color: "transparent"
                border.color: roundMouseArea_bottom_js.pressed ? "white" : "transparent"
                border.width: width/8
                anchors.fill: parent
                radius: height/2
            }

            Dialog {
                id: lf_js_dialog3
                width: 300
                height: 300
                modal: true
                focus: true
                standardButtons: Dialog.close()
                anchors.centerIn: parent

                Rectangle {
                    width: parent.width
                    height: parent.height
                    Text {
                        text: "hello world"
                    }
                }
            }
        }

        RoundMouseArea {
            id: roundMouseArea2_bottom_js
            width: js_console_image.width / 6.5
            height: js_console_image.width / 15
            anchors.verticalCenter: js_console_image.verticalCenter
            anchors.verticalCenterOffset: (js_console_image.paintedHeight * 0.1240)
            anchors.horizontalCenter: js_console_image.horizontalCenter
            anchors.horizontalCenterOffset: (-1 * js_console_image.paintedWidth * 0.07535)

            onClicked: {
                lf_js_dialog3.open()
            }

            Rectangle {
                color: "transparent"
                border.color: roundMouseArea2_bottom_js.pressed ? "white" : "transparent"
                border.width: width/8
                anchors.fill: parent
                radius: height/2
            }
        }
    }
}
