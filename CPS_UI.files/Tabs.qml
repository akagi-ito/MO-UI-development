import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import Machinekit.Controls 1.0
import Machinekit.HalRemote.Controls 1.0
import Machinekit.HalRemote 1.0
import Machinekit.Application 1.0
import Machinekit.PathView 1.0
import QtQuick.Controls.Universal 2.0

HalApplicationWindow {
    id: main
    visible: true
    name: "CPS_UI"
    title: qsTr("CPS_UI")
    width: parent.width
    height: parent.height
    color: button_light.checked ? "white" : "black"

    TabBar {
        id: tabView
        x: 0
        y: 0
        width: parent.width
        height: parent.height
        currentIndex: 5

        background: Rectangle {
            color: button_light.checked ? "white" : "black"
        }

        TabButton {
            text: qsTr("Status")
        }
        TabButton {
            text: qsTr("Engineering")
        }
        TabButton {
            text: qsTr("Home")
        }
        TabButton {
            text: qsTr("Joystick")
        }
        TabButton {
            text: qsTr("Wheels")
        }
        TabButton {
            text: qsTr("Head Tuning")
        }
    }

    Item {                   // Holds variables that drive the tab layer
        id : variable_tab
        property real font_size_scaler : 0.01
        property real font_size: (variable_tab.font_size_scaler * parent.width * parent.height / 1500) + 5
    }

    HalButton {
        id: button_sys_enable
        name: "UI_System_Enable"
        anchors.left: parent.left
        y: 50
        anchors.leftMargin:  10
        width: parent.width*0.07+ 60 < 135 ? 135 : parent.width*0.07+ 60
        height: this.width*0.25
        text: qsTr("Enable Motors")
        style: radius
        checkable: false
        halPin.direction: HalPin.Out
        halPin.value : (pressed === true) ? true : false

        HalPin {
            id: pin_sys_enabled
            name: "SystemEnabled"
            type: HalPin.Bit
            direction: HalPin.In
        }

        Rectangle{
            id : home_enable_color_rect
            anchors.left: parent.left
            anchors.leftMargin:  0
            anchors.top: parent.top
            anchors.topMargin: 0
            scale:  mouseArea.containsMouse ? 0.8 : 1.0
            smooth: mouseArea.containsMouse
            width: button_sys_enable.width
            height: button_sys_enable.height
            color: (pin_sys_enabled.value === true) ? "light green" : "light grey"
            radius: 10

            Label {
              id: label_sys_enable
              anchors.horizontalCenter: parent.horizontalCenter
              anchors.verticalCenter: parent.verticalCenter
              font.family: "Gentium Basic, Bold"
              font.pointSize:  12 //variable_tab.font_size
              text: "Enable Motors "
            }

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    home_enable_color_rect.color = (pin_sys_enabled.value === true) ? "green" : "grey"
                }
                onReleased: {
                    home_enable_color_rect.color = (pin_sys_enabled.value === true) ? "light green" : "light grey"
                }
            }
        }
    }

    ColumnLayout {
        scale: 0.8
        y: parent.height - 30 * parent.height / 1200 - button_light.height
        x: -5

        Switch {
            id: button_light
            background: Rectangle {
                radius: 10
                color: "Light grey"
            }
            text: button_light.checked ? (main.width < 800 && main.height < 400 ? "D": "Dark Mode") : (main.width < 800 && main.height < 400 ? "L":"Light Mode")
            font.family: "Gentium Basic, Bold"
            font.pointSize:  12
        }
    }

    HalButton {
        id: button_clear_fault
        name: "UI_Clear_Fault"
        anchors.right: parent.right
        y: 50
        anchors.rightMargin:  10
        width: parent.width*0.07+ 60 < 135 ? 135 : parent.width*0.07+ 60
        height: this.width*0.25
        checkable: true
        style: radius
        halPin.direction: HalPin.Out
        halPin.value : (checked === true) ? true : false

        HalPin {
            id: pin_fault_present
            name: "Fault_Present"
            type: HalPin.Bit
            direction: HalPin.In
        }

        Rectangle {
            id: clear_fault_button_color_rectangle
            anchors.right: parent.right
            anchors.rightMargin:  0
            anchors.top: parent.top
            anchors.topMargin: 0
            width:   button_clear_fault.width
            height:  button_clear_fault.height
            color: (pin_fault_present.value === true) ? "red" : "light grey"
            radius: 10

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    clear_fault_button_color_rectangle.color = (pin_fault_present.value === true) ? "red" : "grey"
                }
                onReleased: {
                    clear_fault_button_color_rectangle.color = (pin_fault_present.value === true) ? "light red" : "light grey"
                }
            }

            Label {
                id: label_clear_fault
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.family: "Gentium Basic, Bold"
                font.pointSize:  12 //variable_tab.font_size
                text: "Clear Fault"
            }
        }
    }
    StackLayout {
        width:  parent.width
        height: parent.height
        currentIndex: tabView.currentIndex

        Item {
            id: statusTab
            STATUS { }
        }
        Item {
            id: engineeringTab
            ENGINEERING { }
        }
        Item {
            id: homeTab
            HOME { }
        }
        Item {

            id: joystickTab
            JOYSTICK { }
        }
        Item {

            id: wheelsTab
            WHEELS { }
        }

        Item {

            id: moterTab
            MOTER { }
        }
    }
}
