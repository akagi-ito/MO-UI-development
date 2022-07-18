
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

    HalPin {
        id: js3_dir
        name: "JS3_Dir"
        type: HalPin.Bit
        direction: HalPin.Out
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
            id: roundMouseArea_pan_js
            width: js_console_image.width / 10
            height: js_console_image.width / 12
            anchors.verticalCenter: js_console_image.verticalCenter
            anchors.verticalCenterOffset: (-1 * js_console_image.paintedHeight * 0.2640)
            anchors.horizontalCenter: js_console_image.horizontalCenter
            anchors.horizontalCenterOffset: (-1 * js_console_image.paintedWidth * 0.10335)

            onClicked: {
                pan_js_dialog.open()
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
                color: roundMouseArea_pan_js.pressed ? "light grey" : "transparent"
                border.color: roundMouseArea_pan_js.pressed ? "white" : "transparent"
                //border.width: width/8
                anchors.fill: parent
                radius: height/2
            }
        }
        Dialog {
            id: pan_js_dialog
            title: "Pan Motor Tuning"
            width: 370
            height:620
            x: parent.width / 2 - 200
            modal: true
            focus: true
            padding: 10
            standardButtons: Dialog.Ok | Dialog.Cancel

            onAccepted: {
                //coding
            }
            onApplied: {
                //coding
            }
            onRejected: {
                //coding
            }
            Rectangle {

                id : rect_pan_js
                anchors.left: parent.left
                anchors.leftMargin: parent.width* 0.01
                anchors.topMargin: parent.height * 0.05
                width  : parent.width*0.5
                height : parent.height*0.8

                Item {
                    id : js3_rect_var
                    property var rect_width_scale : 1.0
                    property var rect_height_scale : 0.08
                }

                Text {
                    id: textjs_pan_01
                    anchors.top: rect_pan_js.top
                    width : parent.width
                    color: "black"
                    textFormat : Text.StyledText
                    wrapMode: Text.Wrap
                    text: "<font color=\"black\">Moter Tuning </font>"
                    font.family: "Gentium Basic, Bold"
                    font.pointSize : 10
                }

                ListView {
                    id : param_list_view_js_pan
                    anchors.top: textjs_pan_01.bottom
                    anchors.bottom: parent.bottom
                    anchors.left: parent.left
                    model: js_pan_param_obj
                }

                ObjectModel {
                    id: js_pan_param_obj
                    Parameter_Spin_Box {
                        id : js_pan_pos_pro_gain
                        parameter_text : "Position Proportional Gain";
                        parameter_json_pin_name : "bodnar-USB-generic1.0.JS1-Scale";
                        parameter_hal_pin_name : "JS3_Scale";
                        parameter_hal_pin_id : js3_scale;
                        width: 340;
                        height: 25;

                        spinbox.onValueModified:  {
                            parameter_hal_pin_id.value = (spinbox.value / 100.0) ;
                            console.log("Hal pin "+ parameter_hal_pin_name + " set to : " + parameter_hal_pin_id.value);
                            jsonio.updateJsonDocument(parameter_json_pin_name, spinbox.realValue.toString());
                        }

                        spinbox.onVisibleChanged : {

                            if(visible == true){
                                parameter_initValue = (jsonio.updatePinValue(parameter_json_pin_name) * 100);
                                console.log ("On Visable new Init Value: "+ parameter_initValue);
                                parameter_hal_pin_id.value =  jsonio.updatePinValue(parameter_json_pin_name).toFixed(2);
                                console.log("SpinBox Visable True run here");
                                spinbox.value = parameter_initValue;
                            }
                        }
                    }

                    Parameter_Spin_Box {
                        parameter_text : "Position Integral Gain";
                        width: 340;
                        height: 25;
                    }

                    Parameter_Spin_Box {
                        parameter_text : "Position Derivative Gain";
                        width: 340;
                        height: 25
                    }

                    Parameter_Spin_Box {
                        parameter_text : "Position Vel Feed Fwd";
                        width: 340
                        height: 25
                    }

                    Parameter_Spin_Box {
                        parameter_text : "Position Accel Fee Fwd";
                        width: 340
                        height: 25
                    }

                    Parameter_Spin_Box {
                        parameter_text : "Position Gain Scale";
                        width: 340
                        height: 25
                    }

                    Parameter_Spin_Box {
                        parameter_text : "Position Intergral Drain";
                        width: 340
                        height: 25
                    }

                    Parameter_Spin_Box {
                        parameter_text : "Velocity Proportional Gain";
                        width: 340
                        height: 25
                    }

                    Parameter_Spin_Box {
                        parameter_text : "Velocity Integral Gain";
                        width: 340
                        height: 25
                    }
                    Parameter_Spin_Box {
                        parameter_text : "Velocity Feed Fwd Gain";
                        width: 340
                        height: 25
                    }
                    Parameter_Spin_Box {
                        parameter_text : "Velocity Gain Scale";
                        width: 340
                        height: 25
                    }
                    Parameter_Spin_Box {
                        parameter_text : "Velocity Integral Gain";
                        width: 340
                        height: 25
                    }
                    Parameter_Spin_Box {
                        parameter_text : "Current Tq Slope";
                        width: 340
                        height: 25
                    }
                    Parameter_Spin_Box {
                        parameter_text : "Current Proportional Gain";
                        width: 340
                        height: 25
                    }
                    Parameter_Spin_Box {
                        parameter_text : "Current Integral Gain";
                        width: 340
                        height: 25
                    }
                    Parameter_Spin_Box {
                        parameter_text : "Current derivative Gain";
                        width: 340
                        height: 25
                    }
                }

                Button {
                    id: direction_change_pan_btn
                    anchors.top: param_list_view_js_pan.bottom
                    anchors.topMargin: 30
                    anchors.leftMargin: 10
                    height: rect_pan_js.height*0.1
                    width: parent.width * 1.9

                    onClicked:   {

                        if(js3_dir.value === true) {
                            js3_dir.value = false;
                        }
                        else {
                            js3_dir.value = true;
                        }
                    }

                    Rectangle{
                        id : dir_btn_rect_pan
                        height: parent.height
                        width: parent.width
                        anchors.horizontalCenter: direction_change_pan_btn.horizontalCenter
                        anchors.verticalCenter: direction_change_pan_btn.verticalCenter
                        color: (js3_dir.value === true) ? "black" : "light grey"

                        Label {
                            id: pan_dir_label
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            font.family: "Gentium Basic, Bold"
                            font.pointSize:  10
                            text: (js3_dir.value === true) ? "Pan Tuning Direction \nJS LEFT -> CAM LEFT "  : "Pan Tuning Change\nJS LEFT -> CAM RIGHT "
                            color: (js3_dir.value === true) ? "light grey" : "black"
                        } // Close label
                    }      // Close Rect
                }             // Close Button
            }              // Close Rectangle
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
                pan_js_dialog.open()
            }

            Rectangle {
                color: roundMouseArea2_left_js.pressed ? "light grey" : "transparent"
                border.color: roundMouseArea2_left_js.pressed ? "white" : "transparent"
                //border.width: width/8
                anchors.fill: parent
                radius: height/2
            }
        }

        //roll motor area
        RoundMouseArea {
            id: roundMouseArea_roll_js
            width: js_console_image.width / 8
            height: js_console_image.width / 15
            anchors.verticalCenter: js_console_image.verticalCenter
            anchors.verticalCenterOffset: (1 * js_console_image.paintedHeight * 0.0140)
            anchors.horizontalCenter: js_console_image.horizontalCenter
            anchors.horizontalCenterOffset: (1 * js_console_image.paintedWidth * 0.2785)

            onClicked: {
                roll_js_dialog.open()
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
                color: roundMouseArea_roll_js.pressed ? "light grey" : "transparent"
                border.color: roundMouseArea_roll_js.pressed ? "white" : "transparent"
                //border.width: width/8
                anchors.fill: parent
                radius: width/2
            }


        }

        //tilt motor tuning 2 areas
        RoundMouseArea {
            id: roundMouseArea_tilt_js
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
                tilt_js_dialog.open()
            }

            Rectangle {
                color: roundMouseArea_tilt_js.pressed ? "light grey" : "transparent"
                border.color: roundMouseArea_tilt_js.pressed ? "white" : "transparent"
                //border.width: width/8
                anchors.fill: parent
                radius: height/2
            }
        }

        Dialog {
            id: roll_js_dialog
            title: "Roll Motor Tuning"
            width: 370
            x: parent.width/2 - 400
            height:620
            modal: true
            focus: true
            padding: 10
            standardButtons: Dialog.Ok | Dialog.Cancel

            onAccepted: {
                //coding
            }
            onApplied: {
                //coding
            }
            onRejected: {
                //coding
            }
            Rectangle {

                id : rect_roll_js
                anchors.left: parent.left
                anchors.leftMargin: parent.width* 0.01
                anchors.topMargin: parent.height * 0.05
                width  : parent.width*0.5
                height : parent.height*0.8

                Text {
                    id: textjs_roll_01
                    anchors.top: rect_roll_js.top
                    width : parent.width
                    color: "black"
                    textFormat : Text.StyledText
                    wrapMode: Text.Wrap
                    text: "<font color=\"black\">Moter Tuning </font>"
                    font.family: "Gentium Basic, Bold"
                    font.pointSize : 10
                }

                ListView {
                    id : param_list_view_js_roll
                    anchors.top: textjs_roll_01.bottom
                    anchors.bottom: parent.bottom
                    anchors.left: parent.left
                    model: js_roll_param_obj
                }

                ObjectModel {
                    id: js_roll_param_obj
                    Parameter_Spin_Box {
                        id : js_roll_pos_pro_gain
                        parameter_text : "Position Proportional Gain";
                        parameter_json_pin_name : "bodnar-USB-generic1.0.JS1-Scale";
                        parameter_hal_pin_name : "JS3_Scale";
                        parameter_hal_pin_id : js3_scale;
                        width: 340;
                        height: 25;

                        spinbox.onValueModified:  {
                            parameter_hal_pin_id.value = (spinbox.value / 100.0) ;
                            console.log("Hal pin "+ parameter_hal_pin_name + " set to : " + parameter_hal_pin_id.value);
                            jsonio.updateJsonDocument(parameter_json_pin_name, spinbox.realValue.toString());
                        }

                        spinbox.onVisibleChanged : {

                            if(visible == true){
                                parameter_initValue = (jsonio.updatePinValue(parameter_json_pin_name) * 100);
                                console.log ("On Visable new Init Value: "+ parameter_initValue);
                                parameter_hal_pin_id.value =  jsonio.updatePinValue(parameter_json_pin_name).toFixed(2);
                                console.log("SpinBox Visable True run here");
                                spinbox.value = parameter_initValue;
                            }
                        }
                    }

                    Parameter_Spin_Box {
                        parameter_text : "Position Integral Gain";
                        width: 340;
                        height: 25;
                    }

                    Parameter_Spin_Box {
                        parameter_text : "Position Derivative Gain";
                        width: 340;
                        height: 25
                    }

                    Parameter_Spin_Box {
                        parameter_text : "Position Vel Feed Fwd";
                        width: 340
                        height: 25
                    }

                    Parameter_Spin_Box {
                        parameter_text : "Position Accel Fee Fwd";
                        width: 340
                        height: 25
                    }

                    Parameter_Spin_Box {
                        parameter_text : "Position Gain Scale";
                        width: 340
                        height: 25
                    }

                    Parameter_Spin_Box {
                        parameter_text : "Position Intergral Drain";
                        width: 340
                        height: 25
                    }

                    Parameter_Spin_Box {
                        parameter_text : "Velocity Proportional Gain";
                        width: 340
                        height: 25
                    }

                    Parameter_Spin_Box {
                        parameter_text : "Velocity Integral Gain";
                        width: 340
                        height: 25
                    }
                    Parameter_Spin_Box {
                        parameter_text : "Velocity Feed Fwd Gain";
                        width: 340
                        height: 25
                    }
                    Parameter_Spin_Box {
                        parameter_text : "Velocity Gain Scale";
                        width: 340
                        height: 25
                    }
                    Parameter_Spin_Box {
                        parameter_text : "Velocity Integral Gain";
                        width: 340
                        height: 25
                    }
                    Parameter_Spin_Box {
                        parameter_text : "Current Tq Slope";
                        width: 340
                        height: 25
                    }
                    Parameter_Spin_Box {
                        parameter_text : "Current Proportional Gain";
                        width: 340
                        height: 25
                    }
                    Parameter_Spin_Box {
                        parameter_text : "Current Integral Gain";
                        width: 340
                        height: 25
                    }
                    Parameter_Spin_Box {
                        parameter_text : "Current derivative Gain";
                        width: 340
                        height: 25
                    }
                }

                Button {
                    id: direction_change_roll_btn
                    anchors.top: param_list_view_js_roll.bottom
                    anchors.topMargin: 30
                    anchors.leftMargin: 10
                    height: rect_roll_js.height*0.1
                    width: parent.width * 1.9

                    onClicked:   {

                        if(js3_dir.value === true) {
                            js3_dir.value = false;
                        }
                        else {
                            js3_dir.value = true;
                        }
                    }

                    Rectangle{
                        id : dir_btn_rect_roll
                        height: parent.height
                        width: parent.width
                        anchors.horizontalCenter: direction_change_roll_btn.horizontalCenter
                        anchors.verticalCenter: direction_change_roll_btn.verticalCenter
                        color: (js3_dir.value === true) ? "black" : "light grey"

                        Label {
                            id: roll_dir_label
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            font.family: "Gentium Basic, Bold"
                            font.pointSize:  10
                            text: (js3_dir.value === true) ? "roll Tuning Direction \nJS LEFT -> CAM LEFT "  : "roll Tuning Change\nJS LEFT -> CAM RIGHT "
                            color: (js3_dir.value === true) ? "light grey" : "black"
                        } // Close label
                    }      // Close Rect
                }             // Close Button
            }              // Close Rectangle
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
                tilt_js_dialog.open()
            }

            Rectangle {
                color: roundMouseArea2_bottom_js.pressed ? "light grey" : "transparent"
                border.color: roundMouseArea2_bottom_js.pressed ? "white" : "transparent"
                //border.width: width/8
                anchors.fill: parent
                radius: height/2
            }
        }

        Dialog {
            id: tilt_js_dialog
            title: "Tilt Motor Tuning"
            width: 370
            height:620
            x: parent.width/2
            modal: true
            focus: true
            padding: 10
            standardButtons: Dialog.Ok | Dialog.Cancel

            onAccepted: {
                //coding
            }
            onApplied: {
                //coding
            }
            onRejected: {
                //coding
            }
            Rectangle {

                id : rect_tilt_js
                anchors.left: parent.left
                anchors.leftMargin: parent.width* 0.01
                anchors.topMargin: parent.height * 0.05
                width  : parent.width*0.5
                height : parent.height*0.8

                Text {
                    id: textjs_tilt_01
                    anchors.top: rect_tilt_js.top
                    width : parent.width
                    color: "black"
                    textFormat : Text.StyledText
                    wrapMode: Text.Wrap
                    text: "<font color=\"black\">Moter Tuning </font>"
                    font.family: "Gentium Basic, Bold"
                    font.pointSize : 10
                }

                ListView {
                    id : param_list_view_js_tilt
                    anchors.top: textjs_tilt_01.bottom
                    anchors.bottom: parent.bottom
                    anchors.left: parent.left
                    model: js_tilt_param_obj
                }

                ObjectModel {
                    id: js_tilt_param_obj
                    Parameter_Spin_Box {
                        id : js_tilt_pos_pro_gain
                        parameter_text : "Position Proportional Gain";
                        parameter_json_pin_name : "bodnar-USB-generic1.0.JS1-Scale";
                        parameter_hal_pin_name : "JS3_Scale";
                        parameter_hal_pin_id : js3_scale;
                        width: 340;
                        height: 25;

                        spinbox.onValueModified:  {
                            parameter_hal_pin_id.value = (spinbox.value / 100.0) ;
                            console.log("Hal pin "+ parameter_hal_pin_name + " set to : " + parameter_hal_pin_id.value);
                            jsonio.updateJsonDocument(parameter_json_pin_name, spinbox.realValue.toString());
                        }

                        spinbox.onVisibleChanged : {

                            if(visible == true){
                                parameter_initValue = (jsonio.updatePinValue(parameter_json_pin_name) * 100);
                                console.log ("On Visable new Init Value: "+ parameter_initValue);
                                parameter_hal_pin_id.value =  jsonio.updatePinValue(parameter_json_pin_name).toFixed(2);
                                console.log("SpinBox Visable True run here");
                                spinbox.value = parameter_initValue;
                            }
                        }
                    }

                    Parameter_Spin_Box {
                        parameter_text : "Position Integral Gain";
                        width: 340;
                        height: 25;
                    }

                    Parameter_Spin_Box {
                        parameter_text : "Position Derivative Gain";
                        width: 340;
                        height: 25
                    }

                    Parameter_Spin_Box {
                        parameter_text : "Position Vel Feed Fwd";
                        width: 340
                        height: 25
                    }

                    Parameter_Spin_Box {
                        parameter_text : "Position Accel Fee Fwd";
                        width: 340
                        height: 25
                    }

                    Parameter_Spin_Box {
                        parameter_text : "Position Gain Scale";
                        width: 340
                        height: 25
                    }

                    Parameter_Spin_Box {
                        parameter_text : "Position Intergral Drain";
                        width: 340
                        height: 25
                    }

                    Parameter_Spin_Box {
                        parameter_text : "Velocity Proportional Gain";
                        width: 340
                        height: 25
                    }

                    Parameter_Spin_Box {
                        parameter_text : "Velocity Integral Gain";
                        width: 340
                        height: 25
                    }
                    Parameter_Spin_Box {
                        parameter_text : "Velocity Feed Fwd Gain";
                        width: 340
                        height: 25
                    }
                    Parameter_Spin_Box {
                        parameter_text : "Velocity Gain Scale";
                        width: 340
                        height: 25
                    }
                    Parameter_Spin_Box {
                        parameter_text : "Velocity Integral Gain";
                        width: 340
                        height: 25
                    }
                    Parameter_Spin_Box {
                        parameter_text : "Current Tq Slope";
                        width: 340
                        height: 25
                    }
                    Parameter_Spin_Box {
                        parameter_text : "Current Proportional Gain";
                        width: 340
                        height: 25
                    }
                    Parameter_Spin_Box {
                        parameter_text : "Current Integral Gain";
                        width: 340
                        height: 25
                    }
                    Parameter_Spin_Box {
                        parameter_text : "Current derivative Gain";
                        width: 340
                        height: 25
                    }
                }

                Button {
                    id: direction_change_tilt_btn
                    anchors.top: param_list_view_js_tilt.bottom
                    anchors.topMargin: 30
                    anchors.leftMargin: 10
                    height: rect_tilt_js.height*0.1
                    width: parent.width * 1.9

                    onClicked:   {

                        if(js3_dir.value === true) {
                            js3_dir.value = false;
                        }
                        else {
                            js3_dir.value = true;
                        }
                    }

                    Rectangle{
                        id : dir_btn_rect_tilt
                        height: parent.height
                        width: parent.width
                        anchors.horizontalCenter: direction_change_tilt_btn.horizontalCenter
                        anchors.verticalCenter: direction_change_tilt_btn.verticalCenter
                        color: (js3_dir.value === true) ? "black" : "light grey"

                        Label {
                            id: tilt_dir_label
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            font.family: "Gentium Basic, Bold"
                            font.pointSize:  10
                            text: (js3_dir.value === true) ? "tilt Tuning Direction \nJS LEFT -> CAM LEFT "  : "tilt Tuning Change\nJS LEFT -> CAM RIGHT "
                            color: (js3_dir.value === true) ? "light grey" : "black"
                        } // Close label
                    }      // Close Rect
                }             // Close Button
            }              // Close Rectangle
        }
    }
}
