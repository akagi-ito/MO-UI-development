import QtQuick 2.1
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Window 2.0
import Machinekit.Application 1.0
import Machinekit.Application.Controls 1.0
import Machinekit.Service 1.0
import Machinekit.Controls 1.0
import Machinekit.HalRemote.Controls 1.0
import Machinekit.HalRemote 1.0


Item {
    id : wheels_item
    x: 0
    y: 0
    width: parent.width
    height: parent.height
    visible: true
    anchors.fill: parent

    Item {                   // Holds variables that drive the whole Tab
        id : variable_wheels
        property real font_size_scaler : 0.012
        property real font_size : (variable_wheels.font_size_scaler * wheels_item.width)

    }

    Item {                   // Holds variables that drive the whole Tab
        id: variable_home
        property real font_size_scaler: 0.012
        property real tick_font_size_scaler: 0.008
        property real font_size: (variable_home.font_size_scaler * parent.width * parent.height / 1500) + 5
        property real tick_font_size: variable_home.tick_font_size_scaler * parent.width
        property real light_mode: button_light.checked ? 1 : 0
    }

    Image {
        id: js_console_image
        source: button_light.checked ? "file:///home/cps/cameracontrol/QT_UI/CPS_UI/CPS_UI.files/images/CPS_three_wheel_L.JPG" : "file:///home/cps/cameracontrol/QT_UI/CPS_UI/CPS_UI.files/images/CPS_three_wheel_D.JPG"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        fillMode: Image.PreserveAspectFit
        scale: 0.7                
        anchors.fill: parent
        smooth: true
        visible: true
    }
        
    //PAN
    HalPin {
        id: pin_pan_wheel_velocity
        name: "pan_wheel_velocity"
        type: HalPin.Float
        direction: HalPin.In
    }

    HalPin {
        id: pin_pan_wheel_pos
        name: "pan_wheel_pos"
        type: HalPin.Float
        direction: HalPin.In
    }

    HalPin {
        id: pin_pan_wheel_dir
        name: "pan_wheel_dir"
        type: HalPin.U32
        direction: HalPin.In
    }

    Rectangle {
        width :  parent.width * 0.18 + 80 - parent.width/parent.height * 30
        height: parent.height * 0.17
        x: parent.height / parent.width > 0.6 ? parent.width * 0.015 : parent.width * 0.1
        y: parent.height * 0.25
        border.color: button_light.checked ? "black" : "white"
        color: button_light.checked ? "white" : "black"
        radius: 10

        Label {
            id: label_pan_label
            text: "PAN"
            color: button_light.checked ? "black" : "white"
            x: parent.width * 0.4
            y: parent.height * 0.02
            font.family: "Gentium Basic"
            font.pointSize: variable_home.font_size
        }

        Label {
            id: label_pan_voltage
            text:  "Velocity: " + pin_pan_wheel_velocity.value.toFixed(2) + " Deg/sec"
            color: button_light.checked ? "black" : "white"
            x: parent.width * 0.05
            y: parent.height * 0.2
            font.family: "Gentium Basic"
            font.pointSize: variable_home.font_size
        }

        Label {
            id: label_pan_position
            text: "Position: "+ pin_pan_wheel_pos.value.toFixed(2) +" DEG Rel"
            color: button_light.checked ? "black" : "white"
            x: parent.width * 0.05
            y: parent.height * 0.38
            font.family: "Gentium Basic"
            font.pointSize: variable_home.font_size
        }

        Label {
            id: label_pan_direction
            text: pin_pan_wheel_dir.value === 0 ? "Direction: OFF" :  pin_pan_wheel_dir.value === 1 ? "Direction: FWD" : "Direction: REV"
            color: button_light.checked ? "black" : "white"
            x: parent.width * 0.05
            y: parent.height * 0.56
            font.family: "Gentium Basic"
            font.pointSize: variable_home.font_size
        }

        Label {
            id: label_pan_status
            text: pin_pan_wheel_dir.value === 0 ? "Status: INACTIVE" : "Status: Active"
            color: button_light.checked ? "black" : "white"
            x: parent.width * 0.05
            y: parent.height * 0.74
            font.family: "Gentium Basic"
            font.pointSize: variable_home.font_size
        }
    }

    //ROLL
    HalPin {
        id: pin_roll_wheel_velocity
        name: "roll_wheel_velocity"
        type: HalPin.Float
        direction: HalPin.In
    }

    HalPin {
        id: pin_roll_wheel_pos
        name: "roll_wheel_pos"
        type: HalPin.Float
        direction: HalPin.In
    }

    HalPin {
        id: pin_roll_wheel_dir
        name: "roll_wheel_dir"
        type: HalPin.U32
        direction: HalPin.In
    }

    Rectangle {
        width : parent.width * 0.18 + 80 - parent.width/parent.height * 30
        height: parent.height * 0.17
        x: parent.height / parent.width > 0.6 ? parent.width * 0.015 : parent.width * 0.1
        y: parent.height * 0.45
        color: button_light.checked ? "white" : "black"
        border.color: button_light.checked ? "black" : "white"
        radius: 10

        Label {
            id: label_roll_label
            text: "ROLL"
            color: button_light.checked ? "black" : "white"
            x: parent.width * 0.4
            y: parent.height * 0.02
            font.family: "Gentium Basic"
            font.pointSize: variable_home.font_size
        }

        Label {
            id: label_roll_voltage
            text: "Velocity: " + pin_roll_wheel_velocity.value.toFixed(2) + " Deg/Sec"
            color: button_light.checked ? "black" : "white"
            x: parent.width * 0.05
            y: parent.height * 0.2
            font.family: "Gentium Basic"
            font.pointSize: variable_home.font_size
        }

        Label {
            id: label_roll_position
            text: "Position: " + pin_roll_wheel_pos.value.toFixed(2) + " DEG Rel"
            color: button_light.checked ? "black" : "white"
            x: parent.width * 0.05
            y: parent.height * 0.38
            font.family: "Gentium Basic"
            font.pointSize: variable_home.font_size
        }

        Label {
            id: label_roll_direction
            text: pin_roll_wheel_dir.value === 0 ? "Direction: OFF" :  pin_roll_wheel_dir.value === 1 ? "Direction: FWD" : "Direction: REV"
            color: button_light.checked ? "black" : "white"
            x: parent.width * 0.05
            y: parent.height * 0.56
            font.family: "Gentium Basic"
            font.pointSize: variable_home.font_size
        }

        Label {
            id: label_roll_status
            text: pin_roll_wheel_dir.value === 0 ? "Status: INACTIVE" : "Status: Active"
            color: button_light.checked ? "black" : "white"
            x: parent.width * 0.05
            y: parent.height * 0.74
            font.family: "Gentium Basic"
            font.pointSize: variable_home.font_size
        }
    }

    //TILT
    HalPin {
        id: pin_tilt_wheel_velocity
        name: "tilt_wheel_velocity"
        type: HalPin.Float
        direction: HalPin.In
    }

    HalPin {
        id: pin_tilt_wheel_pos
        name: "tilt_wheel_pos"
        type: HalPin.Float
        direction: HalPin.In
    }

    HalPin {
        id: pin_tilt_wheel_dir
        name: "tilt_wheel_dir"
        type: HalPin.U32
        direction: HalPin.In
    }

    Rectangle {
        width : parent.width * 0.18 + 80 - parent.width/parent.height * 30
        height: parent.height * 0.17
        x: parent.height / parent.width > 0.6 ? parent.width * 0.015 : parent.width * 0.1
        y: parent.height * 0.65
        color: button_light.checked ? "white" : "black"
        border.color: button_light.checked ? "black" : "white"
        radius: 10

        Label {
            id: label_tilt_label
            text: "TILE"
            color: button_light.checked ? "black" : "white"
            x: parent.width * 0.4
            y: parent.height * 0.02

            font.family: "Gentium Basic"
            font.pointSize: variable_home.font_size
        }

        Label {
            id: label_tilt_voltage
            text: "Velocity: "+ pin_tilt_wheel_velocity.value.toFixed(2) +" Deg/Sec"
            color: button_light.checked ? "black" : "white"
            x: parent.width * 0.05
            y: parent.height * 0.2
            font.family: "Gentium Basic"
            font.pointSize: variable_home.font_size
        }

        Label {
            id: label_tilt_position
            text: "Position: " + pin_tilt_wheel_pos.value.toFixed(2) + " DEG Rel"
            color: button_light.checked ? "black" : "white"
            x: parent.width * 0.05
            y: parent.height * 0.38
            font.family: "Gentium Basic"
            font.pointSize: variable_home.font_size
        }

        Label {
            id: label_tilt_direction
            text: pin_tilt_wheel_dir.value === 0 ? "Direction: OFF" :  pin_tilt_wheel_dir.value === 1 ? "Direction: FWD" : "Direction: REV"
            color: button_light.checked ? "black" : "white"
            x: parent.width * 0.05
            y: parent.height * 0.56
            font.family: "Gentium Basic"
            font.pointSize: variable_home.font_size
        }

        Label {
            id: label_tilt_status
            text: pin_tilt_wheel_dir.value === 0 ? "Status: INACTIVE" : "Status: Active"
            color: button_light.checked ? "black" : "white"
            x: parent.width * 0.05
            y: parent.height * 0.74
            font.family: "Gentium Basic"
            font.pointSize: variable_home.font_size
        }
    }
}
