
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
    id : moter_item
    x: 0
    y: 0
    width: parent.width
    height: parent.height
    visible: true
    anchors.fill: parent

    Item{                   // Holds variables that drive the whole Tab
        id : variable_moter
        property real font_size_scaler : 0.012
        property real font_size : (variable_moter.font_size_scaler * moter_item.width)
    }

    Image {
        id: js_console_image
        source: button_light.checked ? "file:///home/cps/cameracontrol/QT_UI/CPS_UI/CPS_UI.files/images/CPS_moter_L.jpg" : "file:///home/cps/cameracontrol/QT_UI/CPS_UI/CPS_UI.files/images/CPS_moter_D.jpg"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        fillMode: Image.PreserveAspectFit
        scale: 0.7
        anchors.fill: parent
        smooth: true
        visible: true

        RoundMouseArea {
            id: roundMouseArea_left_js
            width: js_console_image.width / 16
            height: js_console_image.width / 16
            anchors.verticalCenter: js_console_image.verticalCenter
            anchors.verticalCenterOffset: (-1 * js_console_image.paintedHeight * 0.2740)
            anchors.horizontalCenter: js_console_image.horizontalCenter
            anchors.horizontalCenterOffset: (-1 * js_console_image.paintedWidth * 0.02335)

            onClicked: {
                lf_js_dialog.open()
            }

            Rectangle {
                color: "transparent"
                border.color: roundMouseArea_left_js.pressed ? "white" : "transparent"
                border.width: width/8
                anchors.fill: parent
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
            id: roundMouseArea_left_js2
            width: js_console_image.width / 14
            height: js_console_image.width / 30
            anchors.verticalCenter: js_console_image.verticalCenter
            anchors.verticalCenterOffset: (1 * js_console_image.paintedHeight * 0.0340)
            anchors.horizontalCenter: js_console_image.horizontalCenter
            anchors.horizontalCenterOffset: (1 * js_console_image.paintedWidth * 0.3135)

            onClicked: {
                lf_js_dialog2.open()
            }

            Rectangle {
                color: "transparent"
                border.color: roundMouseArea_left_js2.pressed ? "white" : "transparent"
                border.width: width/8
                anchors.fill: parent
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
    }
}
