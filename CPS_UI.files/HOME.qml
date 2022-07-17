import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import QtQuick.Window 2.0
import Machinekit.Application 1.0
import Machinekit.Application.Controls 1.0
import Machinekit.Service 1.0
import Machinekit.Controls 1.0
import Machinekit.HalRemote.Controls 1.0
import Machinekit.HalRemote 1.0

Item {
    id: home_item
    x: 0
    y: 0
    width: parent.width
    height: parent.height
    visible: true
    anchors.fill: parent

    Item{                   // Holds variables that drive the whole Tab
        id: variable_home
        property real font_size_scaler: 0.012
        property real tick_font_size_scaler: 0.008
        property real font_size: (variable_home.font_size_scaler * parent.width * parent.height / 1500) + 5
        property real tick_font_size: variable_home.tick_font_size_scaler * parent.width
        property real light_mode: button_light.checked ? 1 : 0
    }

    Label {
        id: label_sys_voltage
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: angle_display_rectangle.top
        anchors.topMargin: label_sys_voltage.height * -1.250
        text: "Head Volts: " + parseInt(pin_sys_voltage.value/10) + " Volts"
        color: button_light.checked ? "black" : "white"
        font.family: "Gentium Basic"
        font.pointSize: variable_home.font_size

        HalPin {
            id: pin_sys_voltage
            name: "System_Voltage"
            type: HalPin.S32
            direction: HalPin.In
        }
    }

    //roundGauge Ract
    Rectangle{
        id: angle_display_rectangle
        y: main.width/main.height > 1.6 ? 90 : main.height * 0.25
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.height/ parent.width > 1 ? 0.9*parent.width : 0.7*parent.width
        height: 0.5*parent.height *  parent.width/2000 + 90//circle akagi
        radius: 50
        border.color: button_light.checked ? "black" : "white"
        color: button_light.checked ? "white" : "black"
        //pan
        HalRoundGauge {
            id: roundGauge_pan_current
            name: "pan_current"
            x: parent.width/8
            y: parent.height/4 + 24 //last
            width: parent.width * parent.height/4.0/700 + 50
            height: parent.width * parent.height/4.0/700 + 50
            visualizerVisible: false
            decimals: 0
            tickmarkLabelsVisible: false
            tickMarksEnabled: false
            zeroValue: 0
            enabled: false
            rotation: 0
            z1BorderValue: 360
            valueVisible: false
            indicatorVisible: true
            z0BorderValue: 360
            backgroundColor: button_light.checked ? "white" : "black"
            innerCirclingColor: button_light.checked ? "black" : "white"
            needleColor: button_light.checked ? qsTr("#000000") : qsTr("#ffffff")
            value: 0
            needleVisible: false
            stepSize: 50
            startAngle: 0.14
            endAngle: 0.85
            maximumValue: 650
            minimumValue: -650
            clip: true
            halPin.type: HalPin.S32
        }
        //pan
        RoundGauge {
            id: roundGauge_pan
            x: roundGauge_pan_current.x +roundGauge_pan_current.width/2-roundGauge_pan.width/2
            y: roundGauge_pan_current.y +roundGauge_pan_current.height/2-roundGauge_pan.height/2
            width: parent.width * parent.height/5.0/700 + 50
            height: parent.width * parent.height/5.0/700 + 50
            fullCircle: true
            fancy: true
            z0Color: "#ff8888"
            z0BorderValue: 181
            z1BorderValue: 181
            zeroValue: 0
            needleColor: button_light.checked ? qsTr("#000000") : qsTr("#ffffff")
            backgroundColor: button_light.checked ? "white" : "black"
            textColor: button_light.checked ? "black" : "white"
            value: (variable_pan.angle_correction != 0) ? (-1*Math.sign(variable_pan.angle_offset)*(180 - Math.abs(variable_pan.angle_correction))): (variable_pan.gyro_plus_offset)
            valueVisible: false
            needleVisible: true
            visualizerVisible: false
            outerCirclingColor: button_light.checked ? "white" : "black"
            innerCirclingColor: button_light.checked ? "black" : "white"
            graduationColor: systemPalette.dark;
            tickMarksEnabled: true
            tickmarkLabelsVisible: true
            tickmarkLabelsFont: tickmark_font.objectName
            stepSize: parent.width > 600 && parent.height > 400 ? 45 : parent.width < 300 || parent.height < 200 ? 180 : 90
            startAngle: 0
            endAngle: 1.0
            decimals: 0
            maximumValue: 179.9
            minimumValue: -179.9
            clip: true

            RoundMouseArea {
                id: roundMouseArea_pan
                width: parent.width
                height: parent.height
                anchors.centerIn: parent
                onClicked: {
                    if (variable_pan.angle_offset == 0) variable_pan.angle_offset = -1 * pin_pan_gyro_angle.value
                    else variable_pan.angle_offset = 0.0
                    if (variable_pan.angle_offset == 0) variable_pan.angle_source = "Gyro"
                    else variable_pan.angle_source = "User"

                }
            }

            HalPin {
                id: pin_pan_gyro_angle
                name: "Pan_Gyro_Angle"
                type: HalPin.Float
                direction: HalPin.In
            }

            Item{
                id: variable_pan
                property real angle_offset: 0.0
                property string angle_source: "Gyro"
                property real gyro_plus_offset: (pin_pan_gyro_angle.value + variable_pan.angle_offset)
                property real angle_correction: (Math.abs(variable_pan.gyro_plus_offset) > 180) ? (Math.abs(variable_pan.gyro_plus_offset) - 180 ): 0
            }
        }
        //
        Label {
            id: label_pan_angle
            x: roundGauge_pan_current.x +(roundGauge_pan_current.width/2) -(label_pan_angle.width/2)
            y: roundGauge_pan_current.y -(0.9*roundGauge_pan_current.y)
            text: "Pan Angle"
            color : button_light.checked ? "black" : "white"
            font.family: "Gentium Basic"
            font.pointSize: variable_home.font_size

        }
        //
        Label {
            id: label_pan_angle_value
            x: roundGauge_pan_current.x +roundGauge_pan_current.width/2 -label_pan_angle_value.width/2
            y: roundGauge_pan_current.y -roundGauge_pan_current.y * 0.7 + 4
            text: parseFloat(roundGauge_pan.value.toFixed(2)) + " Deg"
            color : button_light.checked ? "black" : "white"
            font.family: "Gentium Basic"
            font.pointSize: variable_home.font_size
        }
        //
        Label {
            id: label_pan_angle_source
            x: roundGauge_pan_current.x +(roundGauge_pan_current.width/2) -(label_pan_angle_source.width/2)
            y: roundGauge_pan_current.y -roundGauge_pan_current.y*0.5 + 7
            text: variable_pan.angle_source
            font.family: "Gentium Basic"
            color : button_light.checked ? "black" : "white"
            font.pointSize: variable_home.font_size
        }
        //roll
        HalRoundGauge {
            id: roundGauge_roll_current
            name: "roll_current"

            x: 3*parent.width/8
            y: parent.height/4 + 24
            width: parent.width * parent.height/4.0/700 + 50
            height: parent.width * parent.height/4.0/700 + 50

            visualizerVisible: false
            decimals: 0
            tickmarkLabelsVisible: false
            tickMarksEnabled: false
            zeroValue: 0
            enabled: false
            rotation: 0
            endAngle: 0.88
            z1BorderValue: 318
            valueVisible: false
            indicatorVisible: true
            z0BorderValue: 200
            backgroundColor: button_light.checked ? "white" : "black"
            innerCirclingColor: button_light.checked ? "black" : "white"
            needleColor: button_light.checked ? qsTr("#000000") : qsTr("#ffffff")
            value: 0
            needleVisible: false
            stepSize: 50
            startAngle: 0.13
            maximumValue: 650
            minimumValue: -650
            clip: true
            halPin.type: HalPin.S32
        }
        //roll
        RoundGauge {
            id: roundGauge_roll
            x: roundGauge_roll_current.x +roundGauge_roll_current.width/2-roundGauge_roll.width/2
            y: roundGauge_roll_current.y +roundGauge_roll_current.height/2-roundGauge_roll.height/2
            width: parent.width * parent.height/5.0/700 + 50
            height: parent.width * parent.height/5.0/700 + 50
            fullCircle: true
            fancy: false
            z0Color: "#8888ff"
            z0BorderValue: 181
            z1BorderValue: 181
            zeroValue: 0
            needleColor: button_light.checked ? qsTr("#000000") : qsTr("#ffffff")
            backgroundColor: button_light.checked ? "white" : "black"
            textColor: button_light.checked ? "black" : "white"
            value: (variable_roll.angle_correction != 0) ? (-1*Math.sign(variable_roll.angle_offset)*(180 - Math.abs(variable_roll.angle_correction))): (variable_roll.gyro_plus_offset)
            valueVisible: false
            needleVisible: true
            visualizerVisible: false
            tickMarksEnabled: true
            tickmarkLabelsVisible: true
            outerCirclingColor: button_light.checked ? "white" : "black"
            innerCirclingColor: button_light.checked ? "black" : "white"
            stepSize: parent.width > 600 && parent.height > 400 ? 45 : parent.width < 300 || parent.height < 200 ? 180 :90
            startAngle: 0
            endAngle: 1.0
            decimals: 0
            maximumValue: 179.9
            minimumValue: -179.9
            clip: true

            RoundMouseArea {
                id: roundMouseArea_roll
                width: parent.width
                height: parent.width
                anchors.centerIn: parent
                onClicked: {
                    if (variable_roll.angle_offset == 0) variable_roll.angle_offset = -1 * pin_roll_gyro_angle.value
                    else variable_roll.angle_offset = 0.0
                    if (variable_roll.angle_offset == 0) variable_roll.angle_source = "Gyro"
                    else variable_roll.angle_source = "User"
                }
            }

            HalPin {
                id: pin_roll_gyro_angle
                name: "Roll_Gyro_Angle"
                type: HalPin.Float
                direction: HalPin.In
            }

            Item{
                id: variable_roll
                property real angle_offset: 0.0
                property string angle_source: "Gyro"
                property real gyro_plus_offset: (pin_roll_gyro_angle.value + variable_roll.angle_offset)
                property real angle_correction: (Math.abs(variable_roll.gyro_plus_offset) > 180) ? (Math.abs(variable_roll.gyro_plus_offset) - 180 ): 0
            }
        }
        //
        Label {
            id: label_roll_angle
            x: roundGauge_roll_current.x +roundGauge_roll_current.width/2 -label_roll_angle.width/2
            y: roundGauge_roll_current.y -(0.9*roundGauge_roll_current.y) + 0
            font.family: "Gentium Basic"
            font.pointSize: variable_home.font_size
            color : button_light.checked ? "black" : "white"
            text: "Roll Angle"
        }
        //
        Label {
            id: label_roll_angle_value
            x: roundGauge_roll_current.x +roundGauge_roll_current.width/2 -label_roll_angle_value.width/2
            y: roundGauge_pan_current.y -roundGauge_pan_current.y * 0.7 + 4
            font.family: "Gentium Basic"
            color : button_light.checked ? "black" : "white"
            font.pointSize: variable_home.font_size
            text: parseFloat(roundGauge_roll.value.toFixed(2)) + " Deg"
        }
        //
        Label {
            id: label_roll_angle_source
            x: roundGauge_roll_current.x +(roundGauge_roll_current.width/2) -(label_roll_angle_source.width/2)
            y: roundGauge_pan_current.y -roundGauge_pan_current.y*0.5 + 7
            text: variable_roll.angle_source
            font.family: "Gentium Basic"
            color : button_light.checked ? "black" : "white"
            font.pointSize: variable_home.font_size
        }
        //tilt
        HalRoundGauge {
            id: roundGauge_tilt_current
            name: "tilt_current"
            x: 5 * parent.width/8
            y: parent.height/4 + 24
            width: parent.width * parent.height/4.0/700 + 50
            height: parent.width * parent.height/4.0/700 + 50
            visualizerVisible: false
            decimals: 0
            tickmarkLabelsVisible: false
            tickMarksEnabled: false
            zeroValue: 0
            enabled: false
            rotation: 0
            endAngle: 0.88
            z1BorderValue: 318
            valueVisible: false
            indicatorVisible: true
            z0BorderValue: 200
            backgroundColor: button_light.checked ? "white" : "black"
            innerCirclingColor: button_light.checked ? "black" : "white"
            needleColor: button_light.checked ? qsTr("#000000") : qsTr("#ffffff")
            value: 0
            needleVisible: false
            stepSize: 50
            startAngle: 0.13
            maximumValue: 650
            minimumValue: -650
            clip: true
            halPin.type: HalPin.S32
        }
        //tilt
        RoundGauge {
            id: roundGauge_tilt
            x: roundGauge_tilt_current.x +roundGauge_tilt_current.width/2-roundGauge_tilt.width/2
            y: roundGauge_tilt_current.y +roundGauge_tilt_current.height/2-roundGauge_tilt.height/2
            width: parent.width * parent.height/5.0/700 + 50
            height: parent.width * parent.height/5.0/700 + 50
            fullCircle: true
            fancy: false
            z0Color: "#88ff88"
            z0BorderValue: 91
            z1BorderValue: 91
            zeroValue: 0
            needleColor: button_light.checked ? qsTr("#000000") : qsTr("#ffffff")
            backgroundColor: button_light.checked ? "white" : "black"
            textColor: button_light.checked ? "black" : "white"
            value: (variable_tilt.angle_correction != 0) ? (-1*Math.sign(variable_tilt.angle_offset)*(90 - Math.abs(variable_tilt.angle_correction))): (variable_tilt.gyro_plus_offset)
            valueVisible: false
            needleVisible: true
            visualizerVisible: false
            outerCirclingColor: button_light.checked ? "white" : "black"
            innerCirclingColor: button_light.checked ? "black" : "white"
            tickMarksEnabled: true
            tickmarkLabelsVisible: true
            stepSize: parent.width > 900 && parent.height > 400 ? 22.5 : parent.width > 600 && parent.height > 400 ? 45 : parent.width < 300 || parent.height < 200 ? 180 :90

            startAngle: 0
            endAngle: 0.5
            decimals: 0
            maximumValue: 91.0
            minimumValue: -89.9
            clip: true

            RoundMouseArea {
                id: roundMouseArea_tilt
                width: parent.width
                height: parent.height
                anchors.centerIn: parent

                onClicked: {
                    if (variable_tilt.angle_offset == 0) variable_tilt.angle_offset = -1 * pin_tilt_gyro_angle.value
                    else variable_tilt.angle_offset = 0.0
                    if (variable_tilt.angle_offset == 0) variable_tilt.angle_source = "Gyro"
                    else variable_tilt.angle_source = "User"
                }
            }

            HalPin {
                id: pin_tilt_gyro_angle
                name: "Tilt_Gyro_Angle"
                type: HalPin.Float
                direction: HalPin.In
            }

            Item{
                id: variable_tilt
                property real angle_offset: 0.0
                property string angle_source: "Gyro"
                property real gyro_plus_offset: (pin_tilt_gyro_angle.value + variable_tilt.angle_offset)
                property real angle_correction: (Math.abs(variable_tilt.gyro_plus_offset) > 90) ? (Math.abs(variable_tilt.gyro_plus_offset) - 90 ): 0
            }
        }

        Label {
            id: label_tilt_angle
            x: roundGauge_tilt_current.x +roundGauge_tilt_current.width/2 -label_tilt_angle.width/2
            y: roundGauge_tilt_current.y - (0.9*roundGauge_tilt_current.y) + 0
            text: "Tilt Angle"
            color : button_light.checked ? "black" : "white"
            font.family: "Gentium Basic"
            font.pointSize: variable_home.font_size
        }

        Label {
            id: label_tilt_angle_value
            x: roundGauge_tilt_current.x +roundGauge_tilt_current.width/2 -label_tilt_angle_value.width/2
            y: roundGauge_pan_current.y -roundGauge_pan_current.y * 0.7 + 4
            font.family: "Gentium Basic"
            color : button_light.checked ? "black" : "white"
            font.pointSize: variable_home.font_size
            text: parseFloat(roundGauge_tilt.value.toFixed(2)) + " Deg"
        }

        Label {
            id: label_tilt_angle_source
            x: roundGauge_tilt_current.x +roundGauge_tilt_current.width/2 -label_tilt_angle_source.width/2
            y: roundGauge_pan_current.y -roundGauge_pan_current.y*0.5 + 7
            text: variable_tilt.angle_source
            font.family: "Gentium Basic"
            color : button_light.checked ? "black" : "white"
            font.pointSize: variable_home.font_size
        }
    }

    //pan Stabilizer
    Rectangle{
        id: pan_stab_rectangle
        anchors.right: roll_stab_rectangle.left
        anchors.rightMargin: parent.width/80
        anchors.top: roll_stab_rectangle.top
        width: parent.width/5
        height: parent.width/7
        radius: 20
        border.color: button_light.checked ? "black" : "white"
        color: button_light.checked ? "white" : "black"

        Label {
            id: label_pan_button_panel
            anchors.horizontalCenter: parent.horizontalCenter
            y: 5
            color :button_light.checked ? "black" : "white"
            text: "PAN"
            font.family: "Gentium Basic"
            font.pointSize: variable_home.font_size
        }

        HalButton {
            id: button_pan_stab
            name: "UI_Pan_Stab"
            anchors.horizontalCenter: parent.horizontalCenter
            y: parent.height/8 + 13

            width: parent.width*0.8
            height: parent.height*0.3
            text: qsTr("Pan Stab")
            checkable: false
            halPin.direction: HalPin.Out
            halPin.value: (pressed === true) ? true: false   //Toggles button state on off
            style: radius
            onClicked: console.log("Pan_Stab_Clicked");

            HalPin {
                id: pin_pan_stab_active
                name: "Pan_Stab_Active"
                type: HalPin.Bit
                direction: HalPin.In
            }

            Rectangle{
                id: pan_stab_color_rectangle
                x: 0
                y: 0
                radius: 20
                width: parent.width
                height: parent.height

                color: (pin_pan_stab_active.value === true) ? "#ff8888": "light grey"

                Label {
                    id: pan_stab_label
                    x: pan_stab_color_rectangle.width/2 - pan_stab_label.width/2
                    y: pan_stab_color_rectangle.height/2 - pan_stab_label.height/2
                    font.family: "Gentium Basic"
                    font.pointSize: variable_home.font_size
                    text: parent.width > 150 ? "Pan Stabilizer<br>" + "On/Off" : "Pan On/Off"
                    horizontalAlignment: "AlignHCenter"
                }
            }
        }

        HalButton {
            id: button_pan_horizon
            name: "UI_Pan_Horizon"
            anchors.horizontalCenter: parent.horizontalCenter
            y: 4*parent.height/8 + 10

            width: parent.width*0.8
            height: parent.height*0.3
            text: qsTr("Pan Horizon")
            checkable: false
            style: radius

            halPin.direction: HalPin.Out
            halPin.value: (pressed === true) ? true: false

            HalPin {
                id: pin_pan_horizon_active
                name: "Pan_Horizon_Active"
                type: HalPin.Bit
                direction: HalPin.In
            }

            Rectangle{
                id: pan_horizon_color_rectangle
                x: 0
                y: 0
                radius: 20
                width: parent.width
                height: parent.height

                color: (pin_pan_horizon_active.value === true) ? "#ff8888": "light grey"

                Label {
                    id: pan_Horizon_label
                    x: pan_stab_color_rectangle.width/2 - pan_stab_label.width/2
                    y: pan_stab_color_rectangle.height/2 - pan_stab_label.height/2
                    font.family: "Gentium Basic"
                    font.pointSize: variable_home.font_size
                    text: parent.width > 150 ? "Pan Horizon<br>" + "Set/Forget" : "Pan S/Fget"
                    horizontalAlignment: "AlignHCenter"
                }
            }
        }
    }
    //roll Stabilizer
    Rectangle{
        id: roll_stab_rectangle
        anchors.horizontalCenter: angle_display_rectangle.horizontalCenter
        anchors.top: angle_display_rectangle.bottom
        anchors.topMargin: main.width/main.height > 1.6 ? parent.height/80 : main.height * 0.05
        width: parent.width/5
        height: parent.width/7

        radius: 20
        border.color: button_light.checked ? "black" : "white"
        color: button_light.checked ? "white" : "black"

        Label {
            id: label_roll_button_panel
            anchors.horizontalCenter: parent.horizontalCenter
            y: 5
            color :button_light.checked ? "black" : "white"
            text: "ROLL"
            font.family: "Gentium Basic"
            font.pointSize: variable_home.font_size
        }

        HalButton {
            id: button_roll_stab
            name: "UI_Roll_Stab"
            anchors.horizontalCenter: parent.horizontalCenter
            y: parent.height/8 + 13

            width: parent.width*0.8
            height: parent.height*0.3
            text: qsTr("Roll Stab")
            checkable: false
            style: radius

            halPin.direction: HalPin.Out
            halPin.value: (pressed === true) ? true: false

            HalPin {
                id: pin_roll_stab_active
                name: "Roll_Stab_Active"
                type: HalPin.Bit
                direction: HalPin.In

            }

            Rectangle{
                id: roll_stab_color_rectangle
                x: 0
                y: 0
                width: parent.width
                height: parent.height
                radius: 20
                color: (pin_roll_stab_active.value === true) ? "#8888ff": "light grey"

                Label {
                    id: roll_stab_label
                    x: roll_stab_color_rectangle.width/2 - roll_stab_label.width/2
                    y: roll_stab_color_rectangle.height/2 - roll_stab_label.height/2
                    font.family: "Gentium Basic"
                    font.pointSize: variable_home.font_size
                    text: parent.width > 150 ? "Roll Stabilizer<br>" + "On/Off" : "Roll On/Off"
                    horizontalAlignment: "AlignHCenter"
                }
            }
        }

        HalButton {
            id: button_roll_horizon
            name: "UI_Roll_Horizon"
            anchors.horizontalCenter: parent.horizontalCenter
            y: 4*parent.height/8 + 10

            width: parent.width*0.8
            height: parent.height*0.3
            text: qsTr("Roll Horizon")
            checkable: false
            style: radius

            halPin.direction: HalPin.Out
            halPin.value: (pressed === true) ? true: false

            HalPin {
                id: pin_roll_horizon_active
                name: "Roll_Horizon_Active"
                type: HalPin.Bit
                direction: HalPin.In

            }

            Rectangle{
                id: roll_horizon_color_rectangle
                x: 0
                y: 0
                radius: 20
                width: parent.width
                height: parent.height

                color: (pin_roll_horizon_active.value === true) ? "#8888ff": "light grey"

                Label {
                    id: roll_horizon_label
                    x: roll_stab_color_rectangle.width/2 - roll_stab_label.width/2
                    y: roll_stab_color_rectangle.height/2 - roll_stab_label.height/2
                    font.family: "Gentium Basic"
                    font.pointSize: variable_home.font_size
                    text: parent.width > 150 ? "Roll Horizon<br>" + "Set/Forget" : "Roll S/Fget"

                    horizontalAlignment: "AlignHCenter"
                }
            }

        }
    }
    //tilt Stabilizer
    Rectangle{

        id: tilt_stab_rectangle
        anchors.left: roll_stab_rectangle.right
        anchors.leftMargin: parent.width/80
        anchors.top: roll_stab_rectangle.top
        width: parent.width/5
        height: parent.width/7
        radius: 20
        border.color: button_light.checked ? "black" : "white"
        color: button_light.checked ? "white" : "black"

        Label {
            id: label_tilt_button_panel
            //x: parent.width/2 -label_tilt_button_panel.width/2
            anchors.horizontalCenter: parent.horizontalCenter
            y: 5

            text: "TILT"
            color: button_light.checked ? "black" : "white"
            font.family: "Gentium Basic"
            font.pointSize: variable_home.font_size
        }

        HalButton {
            id: button_tilt_stab
            name: "UI_Tilt_Stab"
            anchors.horizontalCenter: parent.horizontalCenter
            y: parent.height/8 + 13

            width: parent.width*0.8
            height: parent.height*0.3
            checkable: false
            style: radius

            halPin.direction: HalPin.Out
            halPin.value: (pressed === true) ? true: false


            HalPin {
                id: pin_tilt_stab_active
                name: "Tilt_Stab_Active"
                type: HalPin.Bit
                direction: HalPin.In

            }

            Rectangle{
                id: tilt_stab_color_rectangle
                x: 0
                y: 0
                width: parent.width
                height: parent.height
                radius: 20

                color: (pin_tilt_stab_active.value === true) ? "#88ff88": "light grey"

                Label {
                    id: tilt_stab_label
                    x: tilt_stab_color_rectangle.width/2 - tilt_stab_label.width/2
                    y: tilt_stab_color_rectangle.height/2 - tilt_stab_label.height/2
                    font.family: "Gentium Basic"
                    font.pointSize: variable_home.font_size
                    text: parent.width > 150 ? "Tilt Stabilizer<br>" + "On/Off" : "Tilt On/Off"
                    horizontalAlignment: "AlignHCenter"
                }
            }
        }

        HalButton {
            id: button_tilt_horizon
            name: "UI_Tilt_Horizon"
            anchors.horizontalCenter: parent.horizontalCenter
            y: 4*parent.height/8 + 10

            width: parent.width*0.8
            height: parent.height*0.3
            text: qsTr("Tilt Horizon")
            checkable: false
            style: radius

            halPin.direction: HalPin.Out
            halPin.value: (pressed === true) ? true: false

            HalPin {
                id: pin_tilt_horizon_active
                name: "Tilt_Horizon_Active"
                type: HalPin.Bit
                direction: HalPin.In

            }

            Rectangle{
                id: tilt_horizon_color_rectangle
                x: 0
                y: 0
                width: parent.width
                height: parent.height
                radius: 20

                color: (pin_tilt_horizon_active.value === true) ? "#88ff88": "light grey"

                Label {
                    id: tilt_horizon_label
                    x: tilt_stab_color_rectangle.width/2 - tilt_stab_label.width/2
                    y: tilt_stab_color_rectangle.height/2 - tilt_stab_label.height/2
                    font.family: "Gentium Basic"
                    font.pointSize: variable_home.font_size
                    text: parent.width > 150 ? "Tilt Horizon<br>" + "Set/Forget" : "Tilt S/Fget"
                    horizontalAlignment: "AlignHCenter"
                }
            }

        }
    }
}
