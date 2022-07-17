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
    id : js_item
    x: 0
    y: 0
    width: parent.width
    height: parent.height
    visible: true
    anchors.fill: parent

    Item{                   // Holds variables that drive the whole Tab
        id : variable_js
        property real font_size_scaler : 0.01
        property real font_size: (variable_js.font_size_scaler * parent.width * parent.height / 1500) + 10

    }

    HalPin {
        id: js1_cmd
        name: "JS1_Cmd"
        type: HalPin.Float
        direction: HalPin.In
        onValueChanged: {
            //module1_status_window.js1_cmd = value
        }
    }

    HalPin {
        id: js1_raw
        name: "JS1_Raw"
        type: HalPin.Float
        direction: HalPin.In
        onValueChanged: {
            // module1_status_window.js1_raw = value
        }
    }

    HalPin {
        id: js1_dir
        name: "JS1_Dir"
        type: HalPin.Bit
        direction: HalPin.Out
    }

    HalPin {
        id: js2_cmd
        name: "JS2_Cmd"
        type: HalPin.Float
        direction: HalPin.In
        onValueChanged: {
        // module1_status_window.js2_cmd = value
        }
    }

    HalPin {
        id: js2_raw
        name: "JS2_Raw"
        type: HalPin.Float
        direction: HalPin.In
        onValueChanged: {
        //module1_status_window.js2_raw = value
        }
    }

    HalPin {
        id: js2_dir
        name: "JS2_Dir"
        type: HalPin.Bit
        direction: HalPin.Out
    }

    HalPin {
        id: js3_cmd
        name: "JS3_Cmd"
        type: HalPin.Float
        direction: HalPin.In
        onValueChanged: {
        // module1_status_window.js1_cmd = value
        }
    }

    HalPin {
        id: js3_raw
        name: "JS3_Raw"
        type: HalPin.Float
        direction: HalPin.In
        onValueChanged: {
        //module1_status_window.js1_raw = value
        }
    }

    HalPin {
        id: js3_dir
        name: "JS3_Dir"
        type: HalPin.Bit
        direction: HalPin.Out
    }
    
    // JS tuning parameter pins


    HalPin {
        id: js1_scale
        name: "JS1_Scale"
        type: HalPin.Float
        enabled: true
        direction: HalPin.IO
        Component.onCompleted: {
            value = jsonio.updatePinValue("bodnar-USB-generic0.0.JS1-Scale");
            console.log( "JS1_Scale  onCompleted Pin Value: " + value )
        }
    }

    HalPin {
        id: js1_feather
        name: "JS1_Feather"
        type: HalPin.Float
        enabled: true
        direction: HalPin.IO
        Component.onCompleted: {
            value = jsonio.updatePinValue("bodnar-USB-generic0.0.JS1-Feather");
            console.log( "JS1_Feather  onCompleted Pin Value: " + value )
        }
    }

    HalPin {
        id: js1_max
        name: "JS1_Max"
        type: HalPin.Float
        enabled: true
        direction: HalPin.IO
        Component.onCompleted: {
            value = jsonio.updatePinValue("bodnar-USB-generic0.0.JS1-Max");
            console.log( "JS1_Max  onCompleted Pin Value: " + value )
        }
    }

    HalPin {
        id: js1_min
        name: "JS1_Min"
        type: HalPin.Float
        enabled: true
        direction: HalPin.IO
        Component.onCompleted: {
            value = jsonio.updatePinValue("bodnar-USB-generic0.0.JS1-Min");
            console.log( "JS1_Min  onCompleted Pin Value: " + value )
        }
    }

    HalPin {
        id: js1_mid
        name: "JS1_Mid"
        type: HalPin.Float
        enabled: true
        direction: HalPin.IO
        Component.onCompleted: {
            value = jsonio.updatePinValue("bodnar-USB-generic0.0.JS1-Mid");
            console.log( "JS1_Mid  onCompleted Pin Value: " + value )
        }
    }

    HalPin {
        id: js1_max_accel
        name: "JS1_Max_Accel"
        type: HalPin.Float
        enabled: true
        direction: HalPin.IO
        Component.onCompleted: {
            value = jsonio.updatePinValue("bodnar-USB-generic0.0.JS1-MaxAccel");
            console.log( "JS1_MaxAccel  onCompleted Pin Value: " + value )
        }
    }

    HalPin {
        id: js1_scaled_max
        name: "JS1_Scaled_Max"
        type: HalPin.Float
        enabled: true
        direction: HalPin.IO
        Component.onCompleted: {
            value = jsonio.updatePinValue("bodnar-USB-generic0.0.JS1-ScaledMax");
            console.log( "JS1_ScaledMax  onCompleted Pin Value: " + value )
        }
    }

    HalPin {
        id: js1_scaled_min
        name: "JS1_Scaled_Min"
        type: HalPin.Float
        enabled: true
        direction: HalPin.IO
        Component.onCompleted: {
            value = jsonio.updatePinValue("bodnar-USB-generic0.0.JS1-ScaledMin");
            console.log( "JS1_ScaledMin  onCompleted Pin Value: " + value )
        }
    }

    HalPin {
        id: js2_scale
        name: "JS2_Scale"
        type: HalPin.Float
        enabled: true
        direction: HalPin.IO
        Component.onCompleted: {
            value = jsonio.updatePinValue("bodnar-USB-generic0.0.JS2-Scale");
            console.log( "JS2_Scale  onCompleted Pin Value: " + value )
        }
    }

    HalPin {
        id: js2_feather
        name: "JS2_Feather"
        type: HalPin.Float
        enabled: true
        direction: HalPin.IO
        Component.onCompleted: {
            value = jsonio.updatePinValue("bodnar-USB-generic0.0.JS2-Feather");
            console.log( "JS2_Feather  onCompleted Pin Value: " + value )
        }
    }

    HalPin {
        id: js2_max
        name: "JS2_Max"
        type: HalPin.Float
        enabled: true
        direction: HalPin.IO
        Component.onCompleted: {
            value = jsonio.updatePinValue("bodnar-USB-generic0.0.JS2-Max");
            console.log( "JS2_Max  onCompleted Pin Value: " + value )
        }
    }

    HalPin {
        id: js2_min
        name: "JS2_Min"
        type: HalPin.Float
        enabled: true
        direction: HalPin.IO
        Component.onCompleted: {
            value = jsonio.updatePinValue("bodnar-USB-generic0.0.JS2-Min");
            console.log( "JS2_Min  onCompleted Pin Value: " + value )
        }
    }

    HalPin {
        id: js2_mid
        name: "JS2_Mid"
        type: HalPin.Float
        enabled: true
        direction: HalPin.IO
        Component.onCompleted: {
            value = jsonio.updatePinValue("bodnar-USB-generic0.0.JS2-Mid");
            console.log( "JS2_Mid  onCompleted Pin Value: " + value )
        }
    }

    HalPin {
        id: js2_max_accel
        name: "JS2_Max_Accel"
        type: HalPin.Float
        enabled: true
        direction: HalPin.IO
        Component.onCompleted: {
            value = jsonio.updatePinValue("bodnar-USB-generic0.0.JS2-MaxAccel");
            console.log( "JS2_MaxAccel onCompleted Pin Value: " + value )
        }
    }

    HalPin {
        id: js2_scaled_max
        name: "JS2_Scaled_Max"
        type: HalPin.Float
        enabled: true
        direction: HalPin.IO
        Component.onCompleted: {
            value = jsonio.updatePinValue("bodnar-USB-generic0.0.JS2-ScaledMax");
            console.log( "JS2_ScaledMax  onCompleted Pin Value: " + value )
        }
    }

    HalPin {
        id: js2_scaled_min
        name: "JS2_Scaled_Min"
        type: HalPin.Float
        enabled: true
        direction: HalPin.IO
        Component.onCompleted: {
            value = jsonio.updatePinValue("bodnar-USB-generic0.0.JS2-ScaledMin");
            console.log( "JS2_Scaled_Min  onCompleted Pin Value: " + value )
        }
    }

    HalPin {
        id: js3_scale
        name: "JS3_Scale"
        type: HalPin.Float
        enabled: true
        direction: HalPin.Out

        Component.onCompleted: {
            value = jsonio.updatePinValue("bodnar-USB-generic1.0.JS1-Scale");
            console.log( "JS3_Scale  onCompleted Pin Value: " + value )
        }
    }

    HalPin {
        id: js3_feather
        name: "JS3_Feather"
        type: HalPin.Float
        enabled: true
        direction: HalPin.IO
        Component.onCompleted: {
            value = jsonio.updatePinValue("bodnar-USB-generic1.0.JS1-Feather");
            console.log( "JS3_Feather  onCompleted Pin Value: " + value )
        }
    }

    HalPin {
        id: js3_max
        name: "JS3_Max"
        type: HalPin.Float
        enabled: true
        direction: HalPin.IO
        Component.onCompleted: {
            value = jsonio.updatePinValue("bodnar-USB-generic1.0.JS1-Max");
            console.log( "JS3_Max  onCompleted Pin Value: " + value )
        }
    }

    HalPin {
        id: js3_min
        name: "JS3_Min"
        type: HalPin.Float
        enabled: true
        direction: HalPin.IO
        Component.onCompleted: {
            value = jsonio.updatePinValue("bodnar-USB-generic1.0.JS1-Min");
            console.log( "JS3_Min  onCompleted Pin Value: " + value )
        }
    }

    HalPin {
        id: js3_mid
        name: "JS3_Mid"
        type: HalPin.Float
        enabled: true
        direction: HalPin.IO
        Component.onCompleted: {
            value = jsonio.updatePinValue("bodnar-USB-generic1.0.JS1-Mid");
            console.log( "JS3_Mid  onCompleted Pin Value: " + value )
        }
    }

    HalPin {
        id: js3_max_accel
        name: "JS3_Max_Accel"
        type: HalPin.Float
        enabled: true
        direction: HalPin.IO
        Component.onCompleted: {
            value = jsonio.updatePinValue("bodnar-USB-generic1.0.JS1-MaxAccel");
            console.log( "JS3_MaxAccel  onCompleted Pin Value: " + value )
        }
    }

    HalPin {
        id: js3_scaled_max
        name: "JS3_Scaled_Max"
        type: HalPin.Float
        enabled: true
        direction: HalPin.IO
        Component.onCompleted: {
            value = jsonio.updatePinValue("bodnar-USB-generic1.0.JS1-ScaledMax");
            console.log( "JS3_ScaledMax  onCompleted Pin Value: " + value )
        }
    }

    HalPin {
        id: js3_scaled_min
        name: "JS3_Scaled_Min"
        type: HalPin.Float
        enabled: true
        direction: HalPin.IO
        Component.onCompleted: {
            value = jsonio.updatePinValue("bodnar-USB-generic1.0.JS1-ScaledMin");
            console.log( "JS3_ScaledMin  onCompleted Pin Value: " + value )
        }
    }


    // Potentiometer Pins here
    HalPin {
        id: pot1_cmd
        name: "Pot1_Cmd"
        type: HalPin.Float
        direction: HalPin.In
    }

    HalPin {
        id: pot1_scale
        name: "Pot1_Scale"
        type: HalPin.Float
        enabled: true
        direction: HalPin.IO
        Component.onCompleted: {
            value = jsonio.updatePinValue("bodnar-USB-generic0.0.Pot1-Scale");
            console.log( "Pot1_Scale  onCompleted Pin Value: " + value )
        }
    }

    HalPin {
        id: pot1_offset
        name: "Pot1_Offset"
        type: HalPin.Float
        enabled: true
        direction: HalPin.IO
        Component.onCompleted: {
            value = jsonio.updatePinValue("bodnar-USB-generic0.0.Pot1-Offset");
            console.log( "Pot1_Offset  onCompleted Pin Value: " + value )
        }
    }

    HalPin {
        id: pot2_cmd
        name: "Pot2_Cmd"
        type: HalPin.Float
        direction: HalPin.In
    }

    HalPin {
        id: pot2_scale
        name: "Pot2_Scale"
        type: HalPin.Float
        enabled: true
        direction: HalPin.IO
        Component.onCompleted: {
            value = jsonio.updatePinValue("bodnar-USB-generic0.0.Pot2-Scale");
            console.log( "Pot2_Scale  onCompleted Pin Value: " + value )
        }
    }

    HalPin {
        id: pot2_offset
        name: "Pot2_Offset"
        type: HalPin.Float
        enabled: true
        direction: HalPin.IO
        Component.onCompleted: {
            value = jsonio.updatePinValue("bodnar-USB-generic0.0.Pot2-Offset");
            console.log( "Pot2_Offset  onCompleted Pin Value: " + value )
        }
    }

    HalPin {
        id: pot3_cmd
        name: "Pot3_Cmd"
        type: HalPin.Float
        direction: HalPin.In
    }

    HalPin {
        id: pot3_scale
        name: "Pot3_Scale"
        type: HalPin.Float
        enabled: true
        direction: HalPin.IO
        Component.onCompleted: {
            value = jsonio.updatePinValue("bodnar-USB-generic0.0.Pot3-Scale");
            console.log( "Pot3_Scale  onCompleted Pin Value: " + value )
        }
    }

    HalPin {
        id: pot3_offset
        name: "Pot3_Offset"
        type: HalPin.Float
        enabled: true
        direction: HalPin.IO
        Component.onCompleted: {
            value = jsonio.updatePinValue("bodnar-USB-generic0.0.Pot3-Offset");
            console.log( "Pot3_Offset  onCompleted Pin Value: " + value )
        }
    }

    HalPin {
        id: pot4_cmd
        name: "Pot4_Cmd"
        type: HalPin.Float
        direction: HalPin.In
    }

    HalPin {
        id: pot4_scale
        name: "Pot4_Scale"
        type: HalPin.Float
        enabled: true
        direction: HalPin.IO
        Component.onCompleted: {
            value = jsonio.updatePinValue("bodnar-USB-generic0.0.Pot4-Scale");
            console.log( "Pot4_Scale  onCompleted Pin Value: " + value )
        }
    }

    HalPin {
        id: pot4_offset
        name: "Pot4_Offset"
        type: HalPin.Float
        enabled: true
        direction: HalPin.IO
        Component.onCompleted: {
            value = jsonio.updatePinValue("bodnar-USB-generic0.0.Pot4-Offset");
            console.log( "Pot4_Offset  onCompleted Pin Value: " + value )
        }
    }

    HalPin {
        id: pot5_cmd
        name: "Pot5_Cmd"
        type: HalPin.Float
        direction: HalPin.In
    }

    HalPin {
        id: pot5_scale
        name: "Pot5_Scale"
        type: HalPin.Float
        enabled: true
        direction: HalPin.IO
        Component.onCompleted: {
            value = jsonio.updatePinValue("bodnar-USB-generic0.0.Pot5-Scale");
            console.log( "Pot5_Scale  onCompleted Pin Value: " + value )
        }
    }

    HalPin {
        id: pot5_offset
        name: "Pot5_Offset"
        type: HalPin.Float
        enabled: true
        direction: HalPin.IO
        Component.onCompleted: {
            value = jsonio.updatePinValue("bodnar-USB-generic0.0.Pot5-Offset");
            console.log( "Pot5_Offset  onCompleted Pin Value: " + value )
        }
    }

    HalPin {
        id: pot6_cmd
        name: "Pot6_Cmd"
        type: HalPin.Float
        direction: HalPin.In
    }

    HalPin {
        id: pot6_scale
        name: "Pot6_Scale"
        type: HalPin.Float
        enabled: true
        direction: HalPin.IO
        Component.onCompleted: {
            value = jsonio.updatePinValue("bodnar-USB-generic0.0.Pot6-Scale");
            console.log( "Pot6_Scale  onCompleted Pin Value: " + value )
        }
    }

    HalPin {
        id: pot6_offset
        name: "Pot6_Offset"
        type: HalPin.Float
        enabled: true
        direction: HalPin.IO
        Component.onCompleted: {
            value = jsonio.updatePinValue("bodnar-USB-generic0.0.Pot6-Offset");
            console.log( "Pot6_Offset  onCompleted Pin Value: " + value )
        }
    }

    HalPin {
        id: pot11_cmd
        name: "Pot11_Cmd"
        type: HalPin.Float
        direction: HalPin.In
    }

    HalPin {
        id: pot11_scale
        name: "Pot11_Scale"
        type: HalPin.Float
        enabled: true
        direction: HalPin.IO
        Component.onCompleted: {
            value = jsonio.updatePinValue("bodnar-USB-generic1.0.Pot1-Scale");
            console.log( "Pot11_Scale  onCompleted Pin Value: " + value )
        }
    }

    HalPin {
        id: pot11_offset
        name: "Pot11_Offset"
        type: HalPin.Float
        enabled: true
        direction: HalPin.IO
        Component.onCompleted: {
            value = jsonio.updatePinValue("bodnar-USB-generic1.0.Pot1-Offset");
            console.log( "Pot11_Offset  onCompleted Pin Value: " + value )
        }
    }

    HalPin {
        id: pot12_cmd
        name: "Pot12_Cmd"
        type: HalPin.Float
        direction: HalPin.In
    }

    HalPin {
        id: pot12_scale
        name: "Pot12_Scale"
        type: HalPin.Float
        enabled: true
        direction: HalPin.IO
        Component.onCompleted: {
            value = jsonio.updatePinValue("bodnar-USB-generic1.0.Pot2-Scale");
            console.log( "Pot12_Scale  onCompleted Pin Value: " + value )
        }
    }

    HalPin {
        id: pot12_offset
        name: "Pot12_Offset"
        type: HalPin.Float
        enabled: true
        direction: HalPin.IO
        Component.onCompleted: {
            value = jsonio.updatePinValue("bodnar-USB-generic1.0.Pot2-Offset");
            console.log( "Pot12_Offset  onCompleted Pin Value: " + value )
        }
    }

    HalPin {
        id: pot13_cmd
        name: "Pot13_Cmd"
        type: HalPin.Float
        direction: HalPin.In
    }

    HalPin {
        id: pot13_scale
        name: "Pot13_Scale"
        type: HalPin.Float
        enabled: true
        direction: HalPin.IO
        Component.onCompleted: {
            value = jsonio.updatePinValue("bodnar-USB-generic1.0.Pot3-Scale");
            console.log( "Pot13_Scale  onCompleted Pin Value: " + value )
        }
    }

    HalPin {
        id: pot13_offset
        name: "Pot13_Offset"
        type: HalPin.Float
        enabled: true
        direction: HalPin.IO
        Component.onCompleted: {
            value = jsonio.updatePinValue("bodnar-USB-generic1.0.Pot3-Offset");
            console.log( "Pot13_Offset  onCompleted Pin Value: " + value )
        }
    }

    HalPin {
        id: pot14_cmd
        name: "Pot14_Cmd"
        type: HalPin.Float
        direction: HalPin.In
    }

    HalPin {
        id: pot14_scale
        name: "Pot14_Scale"
        type: HalPin.Float
        enabled: true
        direction: HalPin.IO
        Component.onCompleted: {
            value = jsonio.updatePinValue("bodnar-USB-generic1.0.Pot4-Scale");
            console.log( "Pot14_Scale  onCompleted Pin Value: " + value )
        }
    }

    HalPin {
        id: pot14_offset
        name: "Pot14_Offset"
        type: HalPin.Float
        enabled: true
        direction: HalPin.IO
        Component.onCompleted: {
            value = jsonio.updatePinValue("bodnar-USB-generic1.0.Pot4-Offset");
            console.log( "Pot14_Offset  onCompleted Pin Value: " + value )
        }
    }

    HalPin {
        id: pot16_cmd
        name: "Pot16_Cmd"
        type: HalPin.Float
        direction: HalPin.In
    }

    HalPin {
        id: pot16_scale
        name: "Pot16_Scale"
        type: HalPin.Float
        enabled: true
        direction: HalPin.IO
        Component.onCompleted: {
            value = jsonio.updatePinValue("bodnar-USB-generic1.0.Pot6-Scale");
            console.log( "Pot16_Scale  onCompleted Pin Value: " + value )
        }
    }

    HalPin {
        id: pot16_offset
        name: "Pot16_Offset"
        type: HalPin.Float
        enabled: true
        direction: HalPin.IO
        Component.onCompleted: {
            value = jsonio.updatePinValue("bodnar-USB-generic1.0.Pot6-Offset");
            console.log( "Pot16_Offset  onCompleted Pin Value: " + value )
        }
    }

    //  Switch States
    HalPin {
        id: sw_0
        name: "SW0"
        type: HalPin.Bit
        direction: HalPin.In
    }

    HalPin {
        id: sw_1
        name: "SW1"
        type: HalPin.Bit
        direction: HalPin.In
    }

    HalPin {
        id: sw_2
        name: "SW2"
        type: HalPin.Bit
        direction: HalPin.In
    }

    HalPin {
        id: sw_3
        name: "SW3"
        type: HalPin.Bit
        direction: HalPin.In
    }

    HalPin {
        id: sw_4
        name: "SW4"
        type: HalPin.Bit
        direction: HalPin.In
    }

    HalPin {
        id: sw_5
        name: "SW5"
        type: HalPin.Bit
        direction: HalPin.In
    }

    HalPin {
        id: sw_6
        name: "SW6"
        type: HalPin.Bit
        direction: HalPin.In
    }

    HalPin {
        id: sw_7
        name: "SW7"
        type: HalPin.Bit
        direction: HalPin.In
    }

    HalPin {
        id: sw_8
        name: "SW8"
        type: HalPin.Bit
        direction: HalPin.In
    }

    HalPin {
        id: sw_9
        name: "SW9"
        type: HalPin.Bit
        direction: HalPin.In
    }

    Image {
        id: js_console_image
        source: "file:///home/cps/cameracontrol/QT_UI/CPS_UI/CPS_UI.files/images/Console_UI_Image.jpg"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        fillMode: Image.PreserveAspectFit
        scale: 0.7
        anchors.fill: parent
        smooth: true
        visible: true

        RoundMouseArea {
            id: roundMouseArea_left_js
            width: js_console_image.width / 8
            height: js_console_image.width / 8
            anchors.verticalCenter: js_console_image.verticalCenter
            anchors.verticalCenterOffset: (-1 * js_console_image.paintedHeight * 0.0240)
            anchors.horizontalCenter: js_console_image.horizontalCenter
            anchors.horizontalCenterOffset: (-1 * js_console_image.paintedWidth * 0.2335)

            onClicked: {
                lf_js_dialog.open()
            }

            Rectangle {
                color: "transparent"
                border.color: roundMouseArea_left_js.pressed ? "white" : "transparent"
                border.width: width/8
                radius: width / 2
                anchors.fill: parent
            }

            Dialog {
                id: lf_js_dialog
                title: "Left JoyStick Parameters"
                anchors.centerIn: parent
                width: 400//js_console_image.width * 0.3
                height: 450//js_console_image.height * 0.8
                padding: 10
                modal: true
                focus: true
                standardButtons: Dialog.Save | Dialog.Cancel | Dialog.Apply

                onAccepted: {

                    jsonio.writeJsontoFile();     // write changes to active json parameter object
                    jsonio.setDefaultToActive();  //write active parameters to backup set to update restore
                    console.log("Dialog On Accepted");
                }

                onApplied: {
                    jsonio.setDefaultToActive();  //write active parameters to backup set to update restore
                    console.log("Dialog On Applied");
                }

                onRejected:   {

                    jsonio.setActiveToDefault();  // revert parameter set to backup set

                    js3_scale.value =  jsonio.updatePinValue("bodnar-USB-generic1.0.JS1-Scale").toFixed(2);
                    js3_scale_spinbox.parameter_initValue = js3_scale.value * 100;

                    js3_feather.value =  jsonio.updatePinValue("bodnar-USB-generic1.0.JS1-Feather").toFixed(2);
                    js3_feather_spinbox.parameter_initValue = js3_feather.value * 100;

                    js3_max.value =  jsonio.updatePinValue("bodnar-USB-generic1.0.JS1-Max").toFixed(2);
                    js3_max_spinbox.parameter_initValue = js3_max.value * 100;

                    js3_min.value =  jsonio.updatePinValue("bodnar-USB-generic1.0.JS1-Min").toFixed(2);
                    js3_min_spinbox.parameter_initValue = js3_min.value * 100;

                    js3_mid.value =  jsonio.updatePinValue("bodnar-USB-generic1.0.JS1-Mid").toFixed(2);
                    js3_mid_spinbox.parameter_initValue = js3_mid.value * 100;

                    js3_max_accel.value =  jsonio.updatePinValue("bodnar-USB-generic1.0.JS1-MaxAccel").toFixed(2);
                    js3_max_accel_spinbox.parameter_initValue = js3_max_accel.value * 100;

                    js3_scaled_max.value =  jsonio.updatePinValue("bodnar-USB-generic1.0.JS1-ScaledMax").toFixed(2);
                    js3_scaled_max_spinbox.parameter_initValue = js3_scaled_max.value * 100;

                    js3_scaled_min.value =  jsonio.updatePinValue("bodnar-USB-generic1.0.JS1-ScaledMin").toFixed(2);
                    js3_scaled_min_spinbox.parameter_initValue = js3_scaled_min.value * 100;

                    console.log ("On Rejected new Init Value: "+ js3_scale_spinbox.parameter_initValue)
                    console.log("Dialog On Rejected");
                }

                Rectangle {

                    id : rect_js3
                    anchors.left: parent.left
                    anchors.leftMargin: parent.width* 0.01
                    //anchors.top :  parent.top
                    anchors.topMargin: parent.height * 0.05
                    width  : parent.width*0.5
                    height : parent.height*0.8

                    Item {

                        id : js3_rect_var
                        property var rect_width_scale : 1.0
                        property var rect_height_scale : 0.08
                    }

                    Text {

                        id: textjs3_01
                        //anchors.top: rect_js3.top
                        width : parent.width
                        color: "black"
                        textFormat : Text.StyledText
                        wrapMode: Text.Wrap
                        text: "<font color=\"black\">Joystick 3 Command Output: </font> " +  js3_cmd.value.toFixed(1);
                        font.family: "Gentium Basic, Bold"
                        font.pointSize : 10
                    }

                    Text {
                        id: textjs3_02
                        anchors.top: textjs3_01.bottom
                        width : parent.width
                        color: "black"
                        textFormat : Text.StyledText
                        wrapMode: Text.Wrap
                        text: "<font color=\"black\">  Joystick 3 Raw Output: </font> " + js3_raw.value
                        font.family: "Gentium Basic, Bold"
                        font.pointSize : 10
                    }

                    ListView {
                        id : param_list_view_js3
                        anchors.top: textjs3_02.bottom
                        anchors.bottom: parent.bottom
                        anchors.left: parent.left
                        model: js3_param_obj
                    }

                    ObjectModel {
                        id: js3_param_obj
                        Parameter_Spin_Box {
                            id : js3_scale_spinbox
                            parameter_text : "JS3 Scale";
                            parameter_json_pin_name : "bodnar-USB-generic1.0.JS1-Scale";
                            parameter_hal_pin_name : "JS3_Scale";
                            parameter_hal_pin_id : js3_scale;
                            width: 350;
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
                            parameter_text : "JS3 feather";
                            parameter_json_pin_name : "bodnar-USB-generic1.0.JS1-Feather";
                            parameter_hal_pin_name : "JS3_Feather";
                            parameter_hal_pin_id: js3_feather;
                            width: 350;
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
                            parameter_text : "JS3 max raw";
                            parameter_json_pin_name : "bodnar-USB-generic1.0.JS1-Max";
                            parameter_hal_pin_name : "JS3_Max";
                            parameter_hal_pin_id: js3_max;
                            width: 350;
                            height: 25

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
                            parameter_text : "JS3 min raw";
                            parameter_json_pin_name : "bodnar-USB-generic1.0.JS1-Min";
                            parameter_hal_pin_name : "JS3_Min";
                            parameter_hal_pin_id: js3_min;
                            width: 350
                            height: 25

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
                            parameter_text : "JS3 mid raw";
                            parameter_json_pin_name : "bodnar-USB-generic1.0.JS1-Mid";
                            parameter_hal_pin_name : "JS3_Mid";
                            parameter_hal_pin_id: "js3_mid";
                            width: 350
                            height: 25

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
                            parameter_text : "JS3 Max Accel";
                            parameter_json_pin_name : "bodnar-USB-generic1.0.JS1-MaxAccel";
                            parameter_hal_pin_name : "JS3_Max_Accel";
                            parameter_hal_pin_id: "js3_max_accel";
                            width: 350
                            height: 25

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
                            parameter_text : "JS3 Scaled Max";
                            parameter_json_pin_name : "bodnar-USB-generic1.0.JS1-ScaledMax";
                            parameter_hal_pin_name : "JS3_Scaled_Max";
                            parameter_hal_pin_id: "js3_scaled_max";
                            width: 350
                            height: 25

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
                            parameter_text : "JS3 Scaled Min";
                            parameter_json_pin_name : "bodnar-USB-generic1.0.JS1-ScaledMin";
                            parameter_hal_pin_name : "JS3_Scaled_Min";
                            parameter_hal_pin_id: "js3_scaled_min";
                            width: 350
                            height: 25

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
                    }

                    Button {
                        id: direction_change_js3_btn
                        anchors.top: param_list_view_js3.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        height: rect_js3.height*0.2
                        width: rect_js3.width*1.0

                        onClicked:   {

                            if(js3_dir.value === true) {
                                js3_dir.value = false;
                            }
                            else {
                                js3_dir.value = true;
                            }
                        }

                        Rectangle{
                            id : dir_btn_rect_js3
                            height: parent.height
                            width: parent.width
                            anchors.horizontalCenter: direction_change_js3_btn.horizontalCenter
                            anchors.verticalCenter: direction_change_js3_btn.verticalCenter
                            color: (js3_dir.value === true) ? "black" : "light grey"

                            Label {
                                id: js3_dir_label
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.verticalCenter: parent.verticalCenter
                                font.family: "Gentium Basic, Bold"
                                font.pointSize:  10
                                text: (js3_dir.value === true) ? "JS 3 Direction Change\nJS LEFT -> CAM LEFT "  : "JS 3 Direction Change\nJS LEFT -> CAM RIGHT "
                                color: (js3_dir.value === true) ? "light grey" : "black"
                            } // Close label
                        }      // Close Rect

                    }             // Close Button
                }             // Close Rectangle
            }                  // Close Dialog
        }                      // Close Round Mouse area

        RoundMouseArea {
            id: roundMouseArea_left_upper_outer_pot
            width: parent.width / 22
            height: parent.width /22
            anchors.verticalCenter: js_console_image.verticalCenter
            anchors.verticalCenterOffset: (-1 *  js_console_image.paintedHeight * 0.357)
            anchors.horizontalCenter: js_console_image.horizontalCenter
            anchors.horizontalCenterOffset: (-1 * js_console_image.paintedWidth * 0.234)

            onClicked: {
                left_top_outer_pot_dialog.open()
            }

            Rectangle {
                color: "transparent"
                border.color: roundMouseArea_left_upper_outer_pot.pressed ? "white" : "transparent"
                border.width: width/8
                radius: width / 2
                anchors.fill: parent
            }

            Dialog {
                id: left_top_outer_pot_dialog
                title: "Top Left Outside Pot Parameters"
                anchors.centerIn: parent
                width:  300 //js_console_image.width * 0.2
                height: 300 //jjs_console_image.height * 0.3
                padding: 10
                modal: true
                focus: true
                standardButtons: Dialog.Save | Dialog.Cancel | Dialog.Apply

                onAccepted: {
                    jsonio.writeJsontoFile();     // write changes to active json parameter object
                    jsonio.setDefaultToActive();  //write active parameters to backup set to update restore
                    console.log("Dialog On Accepted");
                }

                onApplied: {
                    jsonio.setDefaultToActive();  //write active parameters to backup set to update restore
                    console.log("Dialog On Applied");
                }

                onRejected:   {

                    jsonio.setActiveToDefault();  // revert parameter set to backup set

                    pot14_scale.value =  jsonio.updatePinValue("bodnar-USB-generic1.0.Pot4-Scale").toFixed(2);
                    pot14_scale_spinbox.parameter_initValue = pot14_scale.value * 100;

                    pot14_offset.value =  jsonio.updatePinValue("bodnar-USB-generic1.0.Pot4-Offset").toFixed(2);
                    pot14_offset_spinbox.parameter_initValue = pot14_offset.value * 100;

                    console.log ("On Rejected new Init Value: "+ pot14_scale_spinbox.parameter_initValue)
                    console.log("Dialog On Rejected");
                }

                Rectangle {

                    id : rect_pot14
                    anchors.left: parent.left
                    anchors.leftMargin: parent.width* 0.01
                    anchors.top :  parent.top
                    anchors.topMargin: parent.height * 0.05
                    width  : parent.width*0.5
                    height : parent.height*0.8

                    Item {

                        id : pot14_rect_var
                        property var rect_width_scale : 2.0
                        property var rect_height_scale : 0.3
                    }

                    Text {
                        id: text_pot14_01
                        width : parent.width
                        color: "black"
                        textFormat : Text.StyledText
                        wrapMode: Text.Wrap
                        text: "<font color=\"black\">Pot14 Command Output: </font> " +  pot14_cmd.value.toFixed(1);
                        font.family: "Gentium Basic, Bold"
                        font.pointSize : 10
                    }

                    ListView {
                        id : param_list_view_pot14
                        anchors.top: text_pot14_01.bottom
                        anchors.bottom: parent.bottom
                        anchors.left: parent.left
                        model: pot14_param_obj
                    }

                    ObjectModel {
                        id: pot14_param_obj

                        Parameter_Spin_Box {
                            id : pot14_scale_spinbox
                            parameter_text : "Pot 14 Scale";
                            parameter_json_pin_name : "bodnar-USB-generic1.0.Pot4-Scale";
                            parameter_hal_pin_name : "Pot14_Scale";
                            parameter_hal_pin_id : pot14_scale;
                            width: (rect_pot14.width * pot14_rect_var.rect_width_scale);
                            height: (rect_pot14.height * pot14_rect_var.rect_height_scale);

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
                            id : pot14_offset_spinbox
                            parameter_text : "Pot 14 Offset";
                            parameter_json_pin_name : "bodnar-USB-generic1.0.Pot4-Offset";
                            parameter_hal_pin_name : "Pot14_Offset";
                            parameter_hal_pin_id : pot14_offset;
                            width: (rect_pot14.width * pot14_rect_var.rect_width_scale);
                            height: (rect_pot14.height * pot14_rect_var.rect_height_scale);

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
                        } // Close SpinBox
                    } // Close Model
                } // Close Rectangle
            } // Close Dialog
        } //  Close Mouse area

        RoundMouseArea {
            id: roundMouseArea_left_upper_middle_pot
            width: parent.width / 22
            height: parent.width /22

            anchors.verticalCenter: js_console_image.verticalCenter
            anchors.verticalCenterOffset: (-1 *  js_console_image.paintedHeight * 0.357)
            anchors.horizontalCenter: js_console_image.horizontalCenter
            anchors.horizontalCenterOffset: (-1 * js_console_image.paintedWidth * 0.175)

            onClicked: {
                left_top_middle_pot_dialog.open()
            }

            Rectangle {
                color: "transparent"
                border.color: roundMouseArea_left_upper_middle_pot.pressed ? "white" : "transparent"
                border.width: width/8
                radius: width / 2
                anchors.fill: parent
            }

            Dialog {
                id: left_top_middle_pot_dialog
                title: "Top Middle Outside Pot Parameters"
                anchors.centerIn: parent
                width:  300 //js_console_image.width * 0.2
                height: 300 //jjs_console_image.height * 0.3
                padding: 10
                modal: true
                focus: true
                standardButtons: Dialog.Save | Dialog.Cancel | Dialog.Apply

                onAccepted: {
                    jsonio.writeJsontoFile();     // write changes to active json parameter object
                    jsonio.setDefaultToActive();  //write active parameters to backup set to update restore
                    console.log("Dialog On Accepted");
                }

                onApplied: {
                    jsonio.setDefaultToActive();  //write active parameters to backup set to update restore
                    console.log("Dialog On Applied");
                }

                onRejected:   {

                    jsonio.setActiveToDefault();  // revert parameter set to backup set

                    pot13_scale.value =  jsonio.updatePinValue("bodnar-USB-generic1.0.Pot3-Scale").toFixed(2);
                    pot13_scale_spinbox.parameter_initValue = pot14_scale.value * 100;

                    pot13_offset.value =  jsonio.updatePinValue("bodnar-USB-generic1.0.Pot3-Offset").toFixed(2);
                    pot13_offset_spinbox.parameter_initValue = pot13_offset.value * 100;

                    console.log ("On Rejected new Init Value: "+ pot13_scale_spinbox.parameter_initValue)
                    console.log("Dialog On Rejected");
                }

                Rectangle {
                    id : rect_pot13
                    anchors.left: parent.left
                    anchors.leftMargin: parent.width* 0.01
                    anchors.top :  parent.top
                    anchors.topMargin: parent.height * 0.05
                    width  : parent.width*0.5
                    height : parent.height*0.8

                    Item {

                        id : pot13_rect_var
                        property var rect_width_scale : 2.0
                        property var rect_height_scale : 0.3
                    }

                    Text {
                        id: text_pot13_01
                        width : parent.width
                        color: "black"
                        textFormat : Text.StyledText
                        wrapMode: Text.Wrap
                        text: "<font color=\"black\">Pot13 Command Output: </font> " +  pot13_cmd.value.toFixed(1);
                        font.family: "Gentium Basic, Bold"
                        font.pointSize : 10
                    }

                    ListView {
                        id : param_list_view_pot13
                        anchors.top: text_pot13_01.bottom
                        anchors.bottom: parent.bottom
                        anchors.left: parent.left
                        model: pot13_param_obj
                    }

                    ObjectModel {
                        id: pot13_param_obj

                        Parameter_Spin_Box {
                            id : pot13_scale_spinbox
                            parameter_text : "Pot 13 Scale";
                            parameter_json_pin_name : "bodnar-USB-generic1.0.Pot3-Scale";
                            parameter_hal_pin_name : "Pot13_Scale";
                            parameter_hal_pin_id : pot13_scale;
                            width: (rect_pot13.width * pot13_rect_var.rect_width_scale);
                            height: (rect_pot13.height * pot13_rect_var.rect_height_scale);

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
                            id : pot13_offset_spinbox
                            parameter_text : "Pot 13 Offset";
                            parameter_json_pin_name : "bodnar-USB-generic1.0.Pot3-Offset";
                            parameter_hal_pin_name : "Pot13_Offset";
                            parameter_hal_pin_id : pot13_offset;
                            width: (rect_pot13.width * pot13_rect_var.rect_width_scale);
                            height: (rect_pot13.height * pot13_rect_var.rect_height_scale);

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
                        } // Close SpinBox
                    } // Close Model
                } // Close Rectangle
            } // Close Dialog
        } // Close Mouse Area

        RoundMouseArea {
            id: roundMouseArea_left_upper_inside_pot
            width: parent.width / 22
            height: parent.width /22

            anchors.verticalCenter: js_console_image.verticalCenter
            anchors.verticalCenterOffset: (-1 *  js_console_image.paintedHeight * 0.357)
            anchors.horizontalCenter: js_console_image.horizontalCenter
            anchors.horizontalCenterOffset: (-1 * js_console_image.paintedWidth * 0.117)

            onClicked: {
                left_top_inside_pot_dialog.open()
            }

            Rectangle {
                color: "transparent"
                border.color: roundMouseArea_left_upper_inside_pot.pressed ? "white" : "transparent"
                border.width: width/8
                radius: width / 2
                anchors.fill: parent
            }

            Dialog {
                id: left_top_inside_pot_dialog
                title: "Zoom Speed to Lens Control No Params"
                anchors.centerIn: parent
                width:  350 //js_console_image.width * 0.2
                height: 300 //jjs_console_image.height * 0.3
                padding: 10
                modal: true
                focus: true
                standardButtons: Dialog.Ok | Dialog.Cancel
                //closePolicy: Dialog.CloseOnEscape | Dialog.CloseOnPressOutsideParent
            }  // Close Dialog
        }// Close RoundMouseArea

        RoundMouseArea {
            id: roundMouseArea_left_lower_outer_pot
            width: js_console_image.width / 22
            height: js_console_image.width /22

            anchors.verticalCenter: js_console_image.verticalCenter
            anchors.verticalCenterOffset: (-1 *  js_console_image.paintedHeight * 0.255)
            anchors.horizontalCenter: js_console_image.horizontalCenter
            anchors.horizontalCenterOffset: (-1 * js_console_image.paintedWidth * 0.234)

            onClicked: {
                    left_btm_outside_pot_dialog.open()
            }

            Rectangle {
                color: "transparent"
                border.color: roundMouseArea_left_lower_outer_pot.pressed ? "white" : "transparent"
                border.width: width/8
                radius: width / 2
                anchors.fill: parent
            }

            Dialog {
                id: left_btm_outside_pot_dialog
                title: "Bottom Left Outside Pot Parameters"
                anchors.centerIn: parent
                width:  300 //js_console_image.width * 0.2
                height: 300 //jjs_console_image.height * 0.3
                padding: 10
                modal: true
                focus: true

                standardButtons: Dialog.Save | Dialog.Cancel | Dialog.Apply

                onAccepted: {

                    jsonio.writeJsontoFile();     // write changes to active json parameter object
                    jsonio.setDefaultToActive();  //write active parameters to backup set to update restore
                    console.log("Dialog On Accepted");

                }

                onApplied: {

                    jsonio.setDefaultToActive();  //write active parameters to backup set to update restore
                    console.log("Dialog On Applied");

                }

                onRejected:   {

                    jsonio.setActiveToDefault();  // revert parameter set to backup set

                    pot12_scale.value =  jsonio.updatePinValue("bodnar-USB-generic1.0.Pot2-Scale").toFixed(2);
                    pot12_scale_spinbox.parameter_initValue = pot14_scale.value * 100;

                    pot12_offset.value =  jsonio.updatePinValue("bodnar-USB-generic1.0.Pot2-Offset").toFixed(2);
                    pot12_offset_spinbox.parameter_initValue = pot12_offset.value * 100;

                    console.log ("On Rejected new Init Value: "+ pot12_scale_spinbox.parameter_initValue)
                    console.log("Dialog On Rejected");

                }

                Rectangle {
                    id : rect_pot12
                    anchors.left: parent.left
                    anchors.leftMargin: parent.width* 0.01
                    anchors.top :  parent.top
                    anchors.topMargin: parent.height * 0.05
                    width  : parent.width*0.5
                    height : parent.height*0.8

                    Item {
                        id : pot12_rect_var
                        property var rect_width_scale : 2.0
                        property var rect_height_scale : 0.3
                    }

                    Text {

                        id: text_pot12_01
                        width : parent.width
                        color: "black"
                        textFormat : Text.StyledText
                        wrapMode: Text.Wrap
                        text: "<font color=\"black\">Pot12 Command Output: </font> " +  pot12_cmd.value.toFixed(1);
                        font.family: "Gentium Basic, Bold"
                        font.pointSize : 10
                    }

                    ListView {
                        id : param_list_view_pot12
                        anchors.top: text_pot12_01.bottom
                        anchors.bottom: parent.bottom
                        anchors.left: parent.left
                        model: pot12_param_obj
                    }

                    ObjectModel {
                        id: pot12_param_obj
                        Parameter_Spin_Box {
                            id : pot12_scale_spinbox
                            parameter_text : "Pot 12 Scale";
                            parameter_json_pin_name : "bodnar-USB-generic1.0.Pot2-Scale";
                            parameter_hal_pin_name : "Pot12_Scale";
                            parameter_hal_pin_id : pot12_scale;
                            width: (rect_pot12.width * pot12_rect_var.rect_width_scale);
                            height: (rect_pot12.height * pot12_rect_var.rect_height_scale);

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
                            id : pot12_offset_spinbox
                            parameter_text : "Pot 12 Offset";
                            parameter_json_pin_name : "bodnar-USB-generic1.0.Pot2-Offset";
                            parameter_hal_pin_name : "Pot12_Offset";
                            parameter_hal_pin_id : pot12_offset;
                            width: (rect_pot12.width * pot12_rect_var.rect_width_scale);
                            height: (rect_pot12.height * pot12_rect_var.rect_height_scale);

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
                        } // Close SpinBox
                    } // Close Model
                } // Close Rectangle
            } // Close Dialog
        } // Close MouseArea

        RoundMouseArea {
            id: roundMouseArea_left_lower_middle_pot
            width: parent.width / 22
            height: parent.width /22

            anchors.verticalCenter: js_console_image.verticalCenter
            anchors.verticalCenterOffset: (-1 *  js_console_image.paintedHeight * 0.255)
            anchors.horizontalCenter: js_console_image.horizontalCenter
            anchors.horizontalCenterOffset: (-1 * js_console_image.paintedWidth * 0.175)

            onClicked: {
                left_btm_middle_pot_dialog.open()
            }

            Rectangle {
                color: "transparent"
                border.color: roundMouseArea_left_lower_middle_pot.pressed ? "white" : "transparent"
                border.width: width/8
                radius: width / 2
                anchors.fill: parent
            }

            Dialog {
                id: left_btm_middle_pot_dialog
                title: "Bottom Left Middle Pot Parameters"
                anchors.centerIn: parent
                width:  300 //js_console_image.width * 0.2
                height: 300 //jjs_console_image.height * 0.3
                padding: 10
                modal: true
                focus: true
                standardButtons: Dialog.Save | Dialog.Cancel | Dialog.Apply

                onAccepted: {

                    jsonio.writeJsontoFile();     // write changes to active json parameter object
                    jsonio.setDefaultToActive();  //write active parameters to backup set to update restore
                    console.log("Dialog On Accepted");
                }

                onApplied: {

                    jsonio.setDefaultToActive();  //write active parameters to backup set to update restore
                    console.log("Dialog On Applied");
                }

                onRejected:   {

                    jsonio.setActiveToDefault();  // revert parameter set to backup set

                    pot11_scale.value =  jsonio.updatePinValue("bodnar-USB-generic1.0.Pot1-Scale").toFixed(2);
                    pot11_scale_spinbox.parameter_initValue = pot14_scale.value * 100;

                    pot11_offset.value =  jsonio.updatePinValue("bodnar-USB-generic1.0.Pot1-Offset").toFixed(2);
                    pot11_offset_spinbox.parameter_initValue = pot11_offset.value * 100;

                    console.log ("On Rejected new Init Value: "+ pot11_scale_spinbox.parameter_initValue)
                    console.log("Dialog On Rejected");
                }

                Rectangle {
                    id : rect_pot11
                    anchors.left: parent.left
                    anchors.leftMargin: parent.width* 0.01
                    anchors.top :  parent.top
                    anchors.topMargin: parent.height * 0.05
                    width  : parent.width*0.5
                    height : parent.height*0.8

                    Item {
                        id : pot11_rect_var
                        property var rect_width_scale : 2.0
                        property var rect_height_scale : 0.3
                    }

                    Text {
                        id: text_pot11_01
                        width : parent.width
                        color: "black"
                        textFormat : Text.StyledText
                        wrapMode: Text.Wrap
                        text: "<font color=\"black\">Pot11 Command Output: </font> " +  pot11_cmd.value.toFixed(1);
                        font.family: "Gentium Basic, Bold"
                        font.pointSize : 10
                    }

                    ListView {
                        id : param_list_view_pot11
                        anchors.top: text_pot11_01.bottom
                        anchors.bottom: parent.bottom
                        anchors.left: parent.left
                        model: pot11_param_obj
                    }

                    ObjectModel {
                        id: pot11_param_obj

                        Parameter_Spin_Box {
                            id : pot11_scale_spinbox
                            parameter_text : "Pot 11 Scale";
                            parameter_json_pin_name : "bodnar-USB-generic1.0.Pot1-Scale";
                            parameter_hal_pin_name : "Pot11_Scale";
                            parameter_hal_pin_id : pot11_scale;
                            width: (rect_pot11.width * pot11_rect_var.rect_width_scale);
                            height: (rect_pot11.height * pot11_rect_var.rect_height_scale);

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
                            id : pot11_offset_spinbox
                            parameter_text : "Pot 11 Offset";
                            parameter_json_pin_name : "bodnar-USB-generic1.0.Pot1-Offset";
                            parameter_hal_pin_name : "Pot11_Offset";
                            parameter_hal_pin_id : pot11_offset;
                            width: (rect_pot11.width * pot11_rect_var.rect_width_scale);
                            height: (rect_pot11.height * pot11_rect_var.rect_height_scale);

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
                        } // Close SpinBox
                    } // Close Model
                } // Close Rectangle
            } // Close Dialog
        }  // Close Mouse Area

        RoundMouseArea {
            id: roundMouseArea_left_lower_inside_pot
            width: parent.width / 22
            height: parent.width /22

            anchors.verticalCenter: js_console_image.verticalCenter
            anchors.verticalCenterOffset: (-1 *  js_console_image.paintedHeight * 0.255)
            anchors.horizontalCenter: js_console_image.horizontalCenter
            anchors.horizontalCenterOffset: (-1 * js_console_image.paintedWidth * 0.117)

            onClicked: {
                left_btm_inner_pot_dialog.open()
            }

            Rectangle {
                color: "transparent"
                border.color: roundMouseArea_left_lower_inside_pot.pressed ? "white" : "transparent"
                border.width: width/8
                radius: width / 2
                anchors.fill: parent
            }
            Dialog {
                id: left_btm_inner_pot_dialog
                title: "Bottom Left Inside Pot Parameters"
                anchors.centerIn: parent
                width:  300 //js_console_image.width * 0.2
                height: 300 //jjs_console_image.height * 0.3
                padding: 10
                modal: true
                focus: true
                standardButtons: Dialog.Save | Dialog.Cancel | Dialog.Apply

                onAccepted: {

                    jsonio.writeJsontoFile();     // write changes to active json parameter object
                    jsonio.setDefaultToActive();  //write active parameters to backup set to update restore
                    console.log("Dialog On Accepted");
                }

                onApplied: {
                    jsonio.setDefaultToActive();  //write active parameters to backup set to update restore
                    console.log("Dialog On Applied");
                }

                onRejected:   {
                    jsonio.setActiveToDefault();  // revert parameter set to backup set

                    pot16_scale.value =  jsonio.updatePinValue("bodnar-USB-generic1.0.Pot6-Scale").toFixed(2);
                    pot16_scale_spinbox.parameter_initValue = pot14_scale.value * 100;

                    pot16_offset.value =  jsonio.updatePinValue("bodnar-USB-generic1.0.Pot6-Offset").toFixed(2);
                    pot16_offset_spinbox.parameter_initValue = pot16_offset.value * 100;

                    console.log ("On Rejected new Init Value: "+ pot16_scale_spinbox.parameter_initValue)
                    console.log("Dialog On Rejected");
                }

                Rectangle {

                    id : rect_pot16
                    anchors.left: parent.left
                    anchors.leftMargin: parent.width* 0.01
                    anchors.top :  parent.top
                    anchors.topMargin: parent.height * 0.05
                    width  : parent.width*0.5
                    height : parent.height*0.8

                    Item {
                        id : pot16_rect_var
                        property var rect_width_scale : 2.0
                        property var rect_height_scale : 0.3
                    }


                    Text {
                        id: text_pot16_01
                        width : parent.width
                        color: "black"
                        textFormat : Text.StyledText
                        wrapMode: Text.Wrap
                        text: "<font color=\"black\">Pot16 Command Output: </font> " +  pot16_cmd.value.toFixed(1);
                        font.family: "Gentium Basic, Bold"
                        font.pointSize : 10
                    }

                    ListView {
                        id : param_list_view_pot16
                        anchors.top: text_pot16_01.bottom
                        anchors.bottom: parent.bottom
                        anchors.left: parent.left
                        model: pot16_param_obj
                    }

                    ObjectModel {
                        id: pot16_param_obj

                        Parameter_Spin_Box {
                            id : pot16_scale_spinbox
                            parameter_text : "Pot 16 Scale";
                            parameter_json_pin_name : "bodnar-USB-generic1.0.Pot6-Scale";
                            parameter_hal_pin_name : "Pot16_Scale";
                            parameter_hal_pin_id : pot16_scale;
                            width: (rect_pot16.width * pot16_rect_var.rect_width_scale);
                            height: (rect_pot16.height * pot16_rect_var.rect_height_scale);

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
                            id : pot16_offset_spinbox
                            parameter_text : "Pot 16 Offset";
                            parameter_json_pin_name : "bodnar-USB-generic1.0.Pot6-Offset";
                            parameter_hal_pin_name : "Pot16_Offset";
                            parameter_hal_pin_id : pot16_offset;
                            width: (rect_pot16.width * pot16_rect_var.rect_width_scale);
                            height: (rect_pot16.height * pot16_rect_var.rect_height_scale);

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
                        } // Close SpinBox
                    } // Close Model
                } // Close Rectangle
            } // Close Dialog
        }  // Close Mouse Area

        RoundMouseArea {
            id: roundMouseArea_right_js
            width: parent.width / 8
            height: parent.width /8

            anchors.verticalCenter: js_console_image.verticalCenter
            anchors.verticalCenterOffset: ( -1 * js_console_image.paintedHeight * 0.0240)
            anchors.horizontalCenter: js_console_image.horizontalCenter
            anchors.horizontalCenterOffset: ( js_console_image.paintedWidth * 0.234)

            onClicked: {
                rt_js_dialog.open()
            }

            Rectangle {
                color: "transparent"
                border.color: roundMouseArea_right_js.pressed ? "white" : "transparent"
                border.width: width/8
                radius: width / 2
                anchors.fill: parent
            }

            Dialog {
                id: rt_js_dialog
                title: "PAN Motor Tuning"
                anchors.centerIn: parent
                width:  750
                height: 600
                padding: 10
                modal: true
                focus: true
                standardButtons: Dialog.Ok | Dialog.Cancel

                onAccepted: {
                    jsonio.writeJsontoFile();     // write changes to active json parameter object
                    jsonio.setDefaultToActive();  //write active parameters to backup set to update restore
                    console.log("Dialog On Accepted");
                }

                onApplied: {
                    jsonio.setDefaultToActive();  //write active parameters to backup set to update restore
                    console.log("Dialog On Applied");
                }
                onRejected:   {

                    jsonio.setActiveToDefault();  // revert parameter set to backup set
                    js2_scale.value =  jsonio.updatePinValue("bodnar-USB-generic0.0.js2-Scale").toFixed(2);
                    js2_scale_spinbox.parameter_initValue = js2_scale.value * 100;

                    js2_feather.value =  jsonio.updatePinValue("bodnar-USB-generic0.0.js2-Feather").toFixed(2);
                    js2_feather_spinbox.parameter_initValue = js2_feather.value * 100;

                    js2_max.value =  jsonio.updatePinValue("bodnar-USB-generic0.0.js2-Max").toFixed(2);
                    js2_max_spinbox.parameter_initValue = js2_max.value * 100;

                    js2_min.value =  jsonio.updatePinValue("bodnar-USB-generic0.0.js2-Min").toFixed(2);
                    js2_min_spinbox.parameter_initValue = js2_min.value * 100;

                    js2_mid.value =  jsonio.updatePinValue("bodnar-USB-generic0.0.js2-Mid").toFixed(2);
                    js2_mid_spinbox.parameter_initValue = js2_mid.value * 100;

                    js2_max_accel.value =  jsonio.updatePinValue("bodnar-USB-generic0.0.js2-MaxAccel").toFixed(2);
                    js2_max_accel_spinbox.parameter_initValue = js2_max_accel.value * 100;

                    js2_scaled_max.value =  jsonio.updatePinValue("bodnar-USB-generic0.0.js2-ScaledMax").toFixed(2);
                    js2_scaled_max_spinbox.parameter_initValue = js2_scaled_max.value * 100;

                    js2_scaled_min.value =  jsonio.updatePinValue("bodnar-USB-generic0.0.js2-ScaledMin").toFixed(2);
                    js2_scaled_min_spinbox.parameter_initValue = js2_scaled_min.value * 100;


                    js1_scale.value =  jsonio.updatePinValue("bodnar-USB-generic0.0.JS1-Scale").toFixed(2);
                    js1_scale_spinbox.parameter_initValue = js1_scale.value * 100;

                    js1_feather.value =  jsonio.updatePinValue("bodnar-USB-generic0.0.JS1-Feather").toFixed(2);
                    js1_feather_spinbox.parameter_initValue = js1_feather.value * 100;

                    js1_max.value =  jsonio.updatePinValue("bodnar-USB-generic0.0.JS1-Max").toFixed(2);
                    js1_max_spinbox.parameter_initValue = js1_max.value * 100;

                    js1_min.value =  jsonio.updatePinValue("bodnar-USB-generic0.0.JS1-Min").toFixed(2);
                    js1_min_spinbox.parameter_initValue = js1_min.value * 100;

                    js1_mid.value =  jsonio.updatePinValue("bodnar-USB-generic0.0.JS1-Mid").toFixed(2);
                    js1_mid_spinbox.parameter_initValue = js1_mid.value * 100;

                    js1_max_accel.value =  jsonio.updatePinValue("bodnar-USB-generic0.0.JS1-MaxAccel").toFixed(2);
                    js1_max_accel_spinbox.parameter_initValue = js1_max_accel.value * 100;

                    js1_scaled_max.value =  jsonio.updatePinValue("bodnar-USB-generic0.0.JS1-ScaledMax").toFixed(2);
                    js1_scaled_max_spinbox.parameter_initValue = js1_scaled_max.value * 100;

                    js1_scaled_min.value =  jsonio.updatePinValue("bodnar-USB-generic0.0.JS1-ScaledMin").toFixed(2);
                    js1_scaled_min_spinbox.parameter_initValue = js1_scaled_min.value * 100;

                    console.log ("On Rejected new Init Value: "+ js1_scale_parameter_sb.parameter_initValue)
                    console.log("Dialog On Rejected");
                }

                Rectangle {
                    id : rect_js1
                    anchors.left: parent.left
                    anchors.leftMargin: parent.width* 0.01
                    anchors.top :  parent.top
                    width  : parent.width*0.48
                    height : parent.height*1.0

                    Item {

                        id : js1_rect_var
                        property var rect_width_scale : 1.0
                        property var rect_height_scale : 0.08
                    }

                    Text {
                        id: textjs1_01
                        anchors.top: rect_js1.top
                        width : parent.width
                        color: "black"
                        textFormat : Text.StyledText
                        wrapMode: Text.Wrap
                        text: "<font color=\"black\">Motor A</font> " // +  js1_cmd.value.toFixed(1);
                        font.family: "Gentium Basic, Bold"
                        font.pointSize : 10
                    }

                    ListView {
                        id : param_list_view_js1
                        anchors.top: textjs1_01.bottom
                        anchors.bottom: parent.bottom
                        anchors.left: parent.left
                        model: js1_param_obj
                    }

                    ObjectModel {
                        id: js1_param_obj
                        Parameter_Spin_Box {
                            parameter_text : "Position Proportional Gain" //"JS1 Scale";
                            parameter_json_pin_name : "bodnar-USB-generic0.0.JS1-Scale";
                            parameter_hal_pin_name : "JS1_Scale";
                            parameter_hal_pin_id : "js1_scale";
                            width: 350
                            height: 25
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
                            parameter_text :"Position Integral Gain" //  "JS1 feather";
                            parameter_json_pin_name : "bodnar-USB-generic0.0.JS1-Feather";
                            parameter_hal_pin_name : "JS1_Feather";
                            parameter_hal_pin_id: "js1_feather";
                            width: 350
                            height: 25

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
                            parameter_text : "Position Derivative Gain"// "JS1 max raw";
                            parameter_json_pin_name : "bodnar-USB-generic0.0.JS1-Max";
                            parameter_hal_pin_name : "JS1_Max";
                            parameter_hal_pin_id: "js1_max";
                            width: 350
                            height: 25

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
                            parameter_text : "Position Vel Feed Fwd"// "JS1 min raw";
                            parameter_json_pin_name : "bodnar-USB-generic0.0.JS1-Min";
                            parameter_hal_pin_name : "JS1_Min";
                            parameter_hal_pin_id: "js1_min";
                            width: 350
                            height: 25

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
                            parameter_text : "Position Accel Feed Fwd" // "JS1 mid raw";
                            parameter_json_pin_name : "bodnar-USB-generic0.0.JS1-Mid";
                            parameter_hal_pin_name : "JS1_Mid";
                            parameter_hal_pin_id: "js1_mid";
                            width: 350
                            height: 25

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
                            parameter_text : "Position Gain Scale"// "JS1 Max Accel";
                            parameter_json_pin_name : "bodnar-USB-generic0.0.JS1-MaxAccel";
                            parameter_hal_pin_name : "JS1_Max_Accel";
                            parameter_hal_pin_id: "js1_max_accel";
                            width: 350
                            height: 25

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
                            parameter_text : "Position Intergral Drain" // "JS1 Scaled Max";
                            parameter_json_pin_name : "bodnar-USB-generic0.0.JS1-ScaledMax";
                            parameter_hal_pin_name : "JS1_Scaled_Max";
                            parameter_hal_pin_id: "js1_scaled_max";
                            width: 350
                            height: 25

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
                            parameter_text : "Velocity Proportional Gain" // "JS1 Scaled Min";
                            parameter_json_pin_name : "bodnar-USB-generic0.0.JS1-ScaledMin";
                            parameter_hal_pin_name : "JS1_Scaled_Min";
                            parameter_hal_pin_id: "js1_scaled_min";
                            width: 350
                            height: 25

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
                            parameter_text : "Velocity Integral Gain"
                            width: 350
                            height: 25
                        }
                        Parameter_Spin_Box {
                            parameter_text : "Velocity Feed Fwd Gain"
                            width: 350
                            height: 25
                        }
                        Parameter_Spin_Box {
                            parameter_text : "Velocity Gain Scale"
                            width: 350
                            height: 25
                        }
                        Parameter_Spin_Box {
                            parameter_text : "Velocity Integral Drain"
                            width: 350
                            height: 25
                        }
                        Parameter_Spin_Box {
                            parameter_text : "Current Tq Slope"
                            width: 350
                            height: 25
                        }
                        Parameter_Spin_Box {
                            parameter_text : "Current Proportional Gain"
                            width: 350
                            height: 25
                        }
                        Parameter_Spin_Box {
                            parameter_text : "Current Integral Gain"
                            width: 350
                            height: 25
                        }
                        Parameter_Spin_Box {
                            parameter_text : "Current Derivative Gain"
                            width: 350
                            height: 25
                        }

                        Button{
                            id: direction_change_js1_btn
                            anchors.top: param_list_view_js1.bottom
                            anchors.horizontalCenter: param_list_view_js1.horizontalCenter
                            height: rect_js1.height*0.15
                            width: rect_js1.width*1.0

                            onClicked:   {

                                if(js1_dir.value === true) {
                                    js1_dir.value = false;
                                }
                                else {
                                    js1_dir.value = true;
                                }
                            }

                            Rectangle{
                                id : dir_btn_rect_js1
                                height: parent.height
                                width: parent.width
                                anchors.horizontalCenter: direction_change_js1_btn.horizontalCenter
                                anchors.verticalCenter: direction_change_js1_btn.verticalCenter
                                color: (js1_dir.value === true) ? "black" : "light grey"

                                Label {

                                id: js1_dir_label
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.verticalCenter: parent.verticalCenter
                                font.family: "Gentium Basic, Bold"
                                font.pointSize:  10
                                text: (js1_dir.value === true) ? "JS 1 Direction Change\nJS UP -> CAM UP "  : "JS 1 Direction Change\nJS UP -> CAM DOWN "
                                color: (js1_dir.value === true) ? "light grey" : "black"

                                }  // Close Label
                            }     // Close Rect
                        }          // Close Button
                    }            // Close Model
                }             // Close Rectangle

                Rectangle {
                    id : rect_js2

                    anchors.right: parent.right
                    anchors.rightMargin: parent.width * 0.01
                    anchors.top :  parent.top
                    width  : parent.width*0.48
                    height : parent.height*1.0

                    Item {

                        id : js2_rect_var
                        property var rect_width_scale : 1.0
                        property var rect_height_scale : 0.08
                    }

                    Text {

                        id: textjs2_01
                        anchors.top: rect_js2.top
                        width : parent.width
                        color: "black"
                        textFormat : Text.StyledText
                        wrapMode: Text.Wrap
                        text: "<font color=\"black\">Motor B </font> " //+  js1_cmd.value.toFixed(1);
                        font.family: "Gentium Basic, Bold"
                        font.pointSize : 10
                    }

                    ListView {
                        id : param_list_view_js2
                        anchors.top: textjs2_01.bottom
                        anchors.bottom: parent.bottom
                        anchors.left: parent.left
                        model: js2_param_obj

                    }

                    ObjectModel {
                        id: js2_param_obj
                        Parameter_Spin_Box {
                            parameter_text : "JS2 Scale";
                            parameter_json_pin_name : "bodnar-USB-generic0.0.JS2-Scale";
                            parameter_hal_pin_name : "JS2_Scale";
                            parameter_hal_pin_id : "js2_scale";
                            width: 350
                            height: 25

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
                            parameter_text : "JS2 feather";
                            parameter_json_pin_name : "bodnar-USB-generic0.0.JS2-Feather";
                            parameter_hal_pin_name : "JS2_Feather";
                            parameter_hal_pin_id: "js2_feather";
                            width: 350
                            height: 25

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
                            parameter_text : "JS2 max raw";
                            parameter_json_pin_name : "bodnar-USB-generic0.0.JS2-Max";
                            parameter_hal_pin_name : "JS2_Max";
                            parameter_hal_pin_id: "js2_max";
                            width: 350
                            height: 25

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
                            parameter_text : "JS2 min raw";
                            parameter_json_pin_name : "bodnar-USB-generic0.0.JS2-Min";
                            parameter_hal_pin_name : "JS2_Min";
                            parameter_hal_pin_id: "js2_min";
                            width: 350
                            height: 25

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
                            parameter_text : "JS2 mid raw";
                            parameter_json_pin_name : "bodnar-USB-generic0.0.JS2-Mid";
                            parameter_hal_pin_name : "JS2_Mid";
                            parameter_hal_pin_id: "js2_mid";
                            width: 350
                            height: 25

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
                            parameter_text : "JS2 Max Accel";
                            parameter_json_pin_name : "bodnar-USB-generic0.0.JS2-MaxAccel";
                            parameter_hal_pin_name : "JS2_Max_Accel";
                            parameter_hal_pin_id: "js2_max_accel";
                            width: 350
                            height: 25

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
                            parameter_text : "JS2 Scaled Max";
                            parameter_json_pin_name : "bodnar-USB-generic0.0.JS2-ScaledMax";
                            parameter_hal_pin_name : "JS2_Scaled_Max";
                            parameter_hal_pin_id: "js2_scaled_max";
                            width: 350
                            height: 25

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
                            parameter_text : "JS2 Scaled Min";
                            parameter_json_pin_name : "bodnar-USB-generic0.0.JS2-ScaledMin";
                            parameter_hal_pin_name : "JS2_Scaled_Min";
                            parameter_hal_pin_id: "js2_scaled_min";
                            width: 350
                            height: 25

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

                        Button{
                            id: direction_change_js2_btn
                            anchors.top: param_list_view_js2.bottom
                            anchors.horizontalCenter: param_list_view_js2.horizontalCenter
                            height: rect_js2.height*0.15
                            width: rect_js2.width*1.0

                            onClicked:   {

                                if(js2_dir.value === true) {
                                    js2_dir.value = false;
                                }
                                else {
                                    js2_dir.value = true;
                                }
                            }

                            Rectangle{
                                id : dir_btn_rect_js2
                                height: parent.height
                                width: parent.width
                                anchors.horizontalCenter: direction_change_js2_btn.horizontalCenter
                                anchors.verticalCenter: direction_change_js2_btn.verticalCenter
                                color: (js2_dir.value === true) ? "black" : "light grey"

                                Label {

                                    id: js2_dir_label
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    font.family: "Gentium Basic, Bold"
                                    font.pointSize:  10
                                    text: (js2_dir.value === true) ? "JS 2 Direction Change\nJS LEFT -> CAM LEFT "  : "JS 2 Direction Change\nJS LEFT -> CAM RIGHT "
                                    color: (js2_dir.value === true) ? "light grey" : "black"

                                }  // Close Label
                            }     // Close Rect
                        }          // Close Button
                    }   //Close Model
                }      // Close Rectangle
            }               // Close Dialog
        }                   // Close RoundMouseArea

        RoundMouseArea {
            id: roundMouseArea_right_upper_outer_pot
            width: parent.width / 22
            height: parent.width /22

            anchors.verticalCenter: js_console_image.verticalCenter
            anchors.verticalCenterOffset: (-1 *  js_console_image.paintedHeight * 0.357)
            anchors.horizontalCenter: js_console_image.horizontalCenter
            anchors.horizontalCenterOffset: ( js_console_image.paintedWidth * 0.234)

            onClicked: {
                right_top_outer_pot_dialog.open()
            }

            Rectangle {
                color: "transparent"
                border.color: roundMouseArea_right_upper_outer_pot.pressed ? "white" : "transparent"
                border.width: width/8
                radius: width / 2
                anchors.fill: parent
            }
            Dialog {
                id: right_top_outer_pot_dialog
                title: "Top Right Outside Pot Parameters"
                anchors.centerIn: parent
                width:  300 //js_console_image.width * 0.2
                height: 300 //jjs_console_image.height * 0.3
                padding: 10
                modal: true
                focus: true
                standardButtons: Dialog.Ok | Dialog.Cancel
                //closePolicy: Dialog.CloseOnEscape | Dialog.CloseOnPressOutsideParent
                // Column One
                Column {
                    id : column_pot5
                    anchors.left: parent.left
                    anchors.leftMargin: parent.width* 0.01
                    anchors.top :  parent.top
                    anchors.topMargin: parent.height * 0.05
                    width  : 300 //parent.width*0.75
                    height : 300 //parent.height*0.8
                    spacing: parent.height*0.01
                    Item {

                        id : pot5_column_var
                        property var rect_width_scale : 1.0
                        property var rect_height_scale : 0.5
                    }

                    Text {

                        id: text_pot5_01
                        width : parent.width
                        color: "black"
                        textFormat : Text.StyledText
                        wrapMode: Text.Wrap
                        text: "<font color=\"black\">Pot5 Command Output: </font> " +  pot5_cmd.value.toFixed(1);
                    }
                    // Begin Spinboxes
                    Parameter_Spin_Box {
                        id: pot5_scale_parameter_sb
                        width: 250 //parent.width * pot5_column_var.rect_width_scale
                        height: 50 //parent.height* pot5_column_var.rect_height_scale

                        parameter_text : "Pot 5 Scale"
                        parameter_json_pin_name : "bodnar-USB-generic0.0.Pot5-Scale"
                        parameter_hal_pin_name : "Pot5_Scale"
                        parameter_hal_pin_id: "pot5_scale"

                        Component.onCompleted: {
                            parameter_initValue = (jsonio.updatePinValue(parameter_json_pin_name) * 100);

                        }
                        spinbox.onValueModified:  {

                            parameter_hal_pin_id.value = ( spinbox.value / 100.0) ;
                            jsonio.updateJsonDocument(parameter_spinBox.pinname, parameter_spinBox.realValue.toString());
                        }
                    }

                    Parameter_Spin_Box {
                        id: pot5_offset_parameter_sb
                        width: 250 // parent.width * pot5_column_var.rect_width_scale
                        height: 50 //parent.height* pot5_column_var.rect_height_scale

                        parameter_text : "Pot5 Offset"
                        parameter_json_pin_name : "bodnar-USB-generic0.0.Pot5-Offset"
                        parameter_hal_pin_name : "Pot5_Offset"
                        parameter_hal_pin_id: "pot5_offset"

                        Component.onCompleted: {
                            parameter_initValue = (jsonio.updatePinValue(parameter_json_pin_name) * 100);

                        }
                        spinbox.onValueModified:  {

                            parameter_hal_pin_id.value = ( spinbox.value / 100.0) ;
                            jsonio.updateJsonDocument(parameter_spinBox.pinname, parameter_spinBox.realValue.toString());
                        }
                    } // Close Spinbox
                }  // Close Column
            }  //Close Dialog
        } //Close RoundMouseArea

        RoundMouseArea {
            id: roundMouseArea_right_upper_middle_pot
            width: parent.width / 22
            height: parent.width /22

            anchors.verticalCenter: js_console_image.verticalCenter
            anchors.verticalCenterOffset: (-1 *  js_console_image.paintedHeight * 0.357)
            anchors.horizontalCenter: js_console_image.horizontalCenter
            anchors.horizontalCenterOffset: ( js_console_image.paintedWidth * 0.175)

            onClicked: {
                    right_top_middle_pot_dialog.open()
            }

            Rectangle {
                        color: "transparent"
                        border.color: roundMouseArea_right_upper_middle_pot.pressed ? "white" : "transparent"
                        border.width: width/8
                        radius: width / 2
                        anchors.fill: parent
            }
            Dialog {
                id: right_top_middle_pot_dialog
                title: "Top Right Outside Pot Parameters"
                anchors.centerIn: parent
                width:  300 //js_console_image.width * 0.2
                height: 300 //jjs_console_image.height * 0.3
                padding: 10
                modal: true
                focus: true
                standardButtons: Dialog.Ok | Dialog.Cancel
                //closePolicy: Dialog.CloseOnEscape | Dialog.CloseOnPressOutsideParent
                // Column One
                Column {

                    id : column_pot3
                    anchors.left: parent.left
                    anchors.leftMargin: parent.width* 0.01
                    anchors.top :  parent.top
                    anchors.topMargin: parent.height * 0.05
                    width  : 300 //parent.width*0.75
                    height : 300 //parent.height*0.8

                    spacing: parent.height*0.01

                    Item {
                        id : pot3_column_var
                        property var rect_width_scale : 1.0
                        property var rect_height_scale : 0.5
                    }

                    Text {

                        id: text_pot3_01
                        width : parent.width
                        color: "black"
                        textFormat : Text.StyledText
                        wrapMode: Text.Wrap
                        text: "<font color=\"black\">Pot3 Command Output: </font> " +  pot3_cmd.value.toFixed(1);
                    }

                    // Begin Spinboxes
                    Parameter_Spin_Box {
                        id: pot3_scale_parameter_sb
                        width: 250 //parent.width * pot3_column_var.rect_width_scale
                        height: 50 //parent.height* pot3_column_var.rect_height_scale

                        parameter_text : "Pot 3 Scale"
                        parameter_json_pin_name : "bodnar-USB-generic0.0.Pot3-Scale"
                        parameter_hal_pin_name : "Pot3_Scale"
                        parameter_hal_pin_id: "pot3_scale"

                        Component.onCompleted: {
                            parameter_initValue = (jsonio.updatePinValue(parameter_json_pin_name) * 100);

                        }
                        spinbox.onValueModified:  {

                            parameter_hal_pin_id.value = ( spinbox.value / 100.0) ;
                            jsonio.updateJsonDocument(parameter_spinBox.pinname, parameter_spinBox.realValue.toString());
                        }
                    }

                    Parameter_Spin_Box {
                        id: pot3_offset_parameter_sb
                        width: 250 //parent.width * pot3_column_var.rect_width_scale
                        height: 50 //parent.height* pot3_column_var.rect_height_scale

                        parameter_text : "Pot3 Offset"
                        parameter_json_pin_name : "bodnar-USB-generic0.0.Pot3-Offset"
                        parameter_hal_pin_name : "Pot3_Offset"
                        parameter_hal_pin_id: "pot3_offset"

                        Component.onCompleted: {
                            parameter_initValue = (jsonio.updatePinValue(parameter_json_pin_name) * 100);

                        }
                        spinbox.onValueModified:  {

                            parameter_hal_pin_id.value = ( spinbox.value / 100.0) ;
                            jsonio.updateJsonDocument(parameter_spinBox.pinname, parameter_spinBox.realValue.toString());
                        }
                    }
                }   // Close Column
            }      // Close Dialog
        }         // Close Roundmouse Area

        RoundMouseArea {
            id: roundMouseArea_right_upper_inside_pot
            width: parent.width / 22
            height: parent.width /22

            anchors.verticalCenter: js_console_image.verticalCenter
            anchors.verticalCenterOffset: (-1 *  js_console_image.paintedHeight * 0.357)
            anchors.horizontalCenter: js_console_image.horizontalCenter
            anchors.horizontalCenterOffset: ( js_console_image.paintedWidth * 0.117)

            onClicked: {
                right_top_inner_pot_dialog.open()
            }

            Rectangle {
                color: "transparent"
                border.color: roundMouseArea_right_upper_inside_pot.pressed ? "white" : "transparent"
                border.width: width/8
                radius: width / 2
                anchors.fill: parent
            }
            Dialog {
                id: right_top_inner_pot_dialog
                title: "Top Right Inside Pot Parameters"
                anchors.centerIn: parent
                width:  300 //300 //js_console_image.width * 0.2
                height: 300 //300 //jjs_console_image.height * 0.3
                padding: 10
                modal: true
                focus: true
                standardButtons: Dialog.Ok | Dialog.Cancel
                //closePolicy: Dialog.CloseOnEscape | Dialog.CloseOnPressOutsideParent
            // Column One
                Column {
                    id : column_pot1
                    anchors.left: parent.left
                    anchors.leftMargin: parent.width* 0.01
                    anchors.top :  parent.top
                    anchors.topMargin: parent.height * 0.05
                    width  : parent.width*0.75
                    height : parent.height*0.8
                    spacing: parent.height*0.01

                    Item {

                        id : pot1_column_var
                        property var rect_width_scale : 1.0
                        property var rect_height_scale : 0.5
                    }

                    Text {

                        id: text_pot1_01
                        width : parent.width
                        color: "black"
                        textFormat : Text.StyledText
                        wrapMode: Text.Wrap
                        text: "<font color=\"black\">Pot1 Command Output: </font> " +  pot1_cmd.value.toFixed(1);
                    }
            // Begin Spinboxes
                    Parameter_Spin_Box {
                        id: pot1_scale_parameter_sb
                        y: 10
                        width: 250 //parent.width * pot1_column_var.rect_width_scale
                        height: 50 //parent.height * pot1_column_var.rect_height_scale

                        parameter_text : "Pot 1 Scale"
                        parameter_json_pin_name : "bodnar-USB-generic0.0.Pot1-Scale"
                        parameter_hal_pin_name : "Pot1_Scale"
                        parameter_hal_pin_id: "pot1_scale"

                        Component.onCompleted: {
                            parameter_initValue = (jsonio.updatePinValue(parameter_json_pin_name) * 100);

                        }
                        spinbox.onValueModified:  {

                            parameter_hal_pin_id.value = ( spinbox.value / 100.0) ;
                            jsonio.updateJsonDocument(parameter_spinBox.pinname, parameter_spinBox.realValue.toString());
                        }
                    }

                    Parameter_Spin_Box {
                        id: pot1_offset_parameter_sb
                        y: 5
                        width: 250 //parent.width * pot1_column_var.rect_width_scale
                        height: 50 //parent.height* pot1_column_var.rect_height_scale

                        parameter_text : "Pot1 Offset"
                        parameter_json_pin_name : "bodnar-USB-generic0.0.Pot1-Offset"
                        parameter_hal_pin_name : "Pot1_Offset"
                        parameter_hal_pin_id: "pot1_offset"

                        Component.onCompleted: {
                            parameter_initValue = (jsonio.updatePinValue(parameter_json_pin_name) * 100);

                        }
                        spinbox.onValueModified:  {

                            parameter_hal_pin_id.value = ( spinbox.value / 100.0) ;
                            jsonio.updateJsonDocument(parameter_spinBox.pinname, parameter_spinBox.realValue.toString());
                        }
                    }  // Close Spinbox
                }   // Close Column
            }  // Close Dialog
        }       // Close Round Mouse area

        RoundMouseArea {
            id: roundMouseArea_right_lower_outer_pot
            width: parent.width / 22
            height: parent.width /22

            anchors.verticalCenter: js_console_image.verticalCenter
            anchors.verticalCenterOffset: (-1 *  js_console_image.paintedHeight * 0.255)
            anchors.horizontalCenter: js_console_image.horizontalCenter
            anchors.horizontalCenterOffset: ( js_console_image.paintedWidth * 0.234)

            onClicked: {
                right_btm_outer_pot_dialog.open()
            }

            Rectangle {
                color: "transparent"
                border.color: roundMouseArea_right_lower_outer_pot.pressed ? "white" : "transparent"
                border.width: width/8
                radius: width / 2
                anchors.fill: parent
            }

            Dialog {
                id: right_btm_outer_pot_dialog
                title: "Bottom Right Outside Pot Parameters"
                anchors.centerIn: parent
                width:  300 //js_console_image.width * 0.2
                height: 300 //jjs_console_image.height * 0.3
                padding: 10
                modal: true
                focus: true
                standardButtons: Dialog.Ok | Dialog.Cancel
                //closePolicy: Dialog.CloseOnEscape | Dialog.CloseOnPressOutsideParent
            // Column One
                Column {

                    id : column_pot6
                    anchors.left: parent.left
                    anchors.leftMargin: parent.width* 0.01
                    anchors.top :  parent.top
                    anchors.topMargin: parent.height * 0.05
                    width  : 300 //parent.width*0.75
                    height : 300 //parent.height*0.8

                    spacing: parent.height*0.01

                    Item {

                        id : pot6_column_var
                        property var rect_width_scale : 1.0
                        property var rect_height_scale : 0.5
                    }

                    Text {

                        id: text_pot6_01
                        width : parent.width
                        color: "black"
                        textFormat : Text.StyledText
                        wrapMode: Text.Wrap
                        text: "<font color=\"black\">Pot6 Command Output: </font> " +  pot6_cmd.value.toFixed(1);
                    }
            // Begin Spinboxes

                    Parameter_Spin_Box {
                        id: pot6_scale_parameter_sb
                        width: 250
                        height: 50

                        parameter_text : "Pot 6 Scale"
                        parameter_json_pin_name : "bodnar-USB-generic0.0.Pot6-Scale"
                        parameter_hal_pin_name : "Pot6_Scale"
                        parameter_hal_pin_id: "pot6_scale"

                        Component.onCompleted: {
                            parameter_initValue = (jsonio.updatePinValue(parameter_json_pin_name) * 100);

                        }
                        spinbox.onValueModified:  {

                            parameter_hal_pin_id.value = ( spinbox.value / 100.0) ;
                            jsonio.updateJsonDocument(parameter_spinBox.pinname, parameter_spinBox.realValue.toString());
                        }
                    }


                    Parameter_Spin_Box {
                        id: pot6_offset_parameter_sb
                        width: 250 //parent.width * pot6_column_var.rect_width_scale
                        height: 50 //parent.height* pot6_column_var.rect_height_scale

                        parameter_text : "Pot6 Offset"
                        parameter_json_pin_name : "bodnar-USB-generic0.0.Pot6-Offset"
                        parameter_hal_pin_name : "Pot6_Offset"
                        parameter_hal_pin_id: "pot6_offset"
                        Component.onCompleted: {
                            parameter_initValue = (jsonio.updatePinValue(parameter_json_pin_name) * 100);

                        }
                        spinbox.onValueModified:  {

                            parameter_hal_pin_id.value = ( spinbox.value / 100.0) ;
                            jsonio.updateJsonDocument(parameter_spinBox.pinname, parameter_spinBox.realValue.toString());
                        }
                    } // Close Spinbox
                } //Close Column
            } //Close Dialog

        }   //Close RoundMouseArea

        RoundMouseArea {
            id: roundMouseArea_right_lower_middle_pot
            width: parent.width / 22
            height: parent.width /22

            anchors.verticalCenter: js_console_image.verticalCenter
            anchors.verticalCenterOffset: (-1 *  js_console_image.paintedHeight * 0.255)
            anchors.horizontalCenter: js_console_image.horizontalCenter
            anchors.horizontalCenterOffset: ( js_console_image.paintedWidth * 0.175)

            onClicked: {
                        right_btm_middle_pot_dialog.open()
            }

            Rectangle {
                        color: "transparent"
                        border.color: roundMouseArea_right_lower_middle_pot.pressed ? "white" : "transparent"
                        border.width: width/8
                        radius: width / 2
                        anchors.fill: parent
            }

            Dialog {
                id: right_btm_middle_pot_dialog
                title: "Bottom Right Outside Pot Parameters"
                anchors.centerIn: parent
                width:  300 //js_console_image.width * 0.2
                height: 300 //jjs_console_image.height * 0.3
                padding: 10
                modal: true
                focus: true
                standardButtons: Dialog.Ok | Dialog.Cancel
                //closePolicy: Dialog.CloseOnEscape | Dialog.CloseOnPressOutsideParent
            // Column One
                Column {

                    id : column_pot4
                    anchors.left: parent.left
                    anchors.leftMargin: parent.width* 0.01
                    anchors.top :  parent.top
                    anchors.topMargin: parent.height * 0.05
                    width  : 300 //parent.width*0.75
                    height : 300 //parent.height*0.8

                    spacing: parent.height*0.01

                    Item {

                        id : pot4_column_var
                        property var rect_width_scale : 1.0
                        property var rect_height_scale : 0.5
                    }

                    Text {

                        id: text_pot4_01
                        width : parent.width
                        color: "black"
                        textFormat : Text.StyledText
                        wrapMode: Text.Wrap
                        text: "<font color=\"black\">Pot4 Command Output: </font> " +  pot4_cmd.value.toFixed(1);
                    }

            // Begin Spinboxes
                    Parameter_Spin_Box {
                        id: pot4_scale_parameter_sb
                        width: 250 //parent.width * pot4_column_var.rect_width_scale
                        height: 50 //parent.height* pot4_column_var.rect_height_scale

                        parameter_text : "Pot 4 Scale"
                        parameter_json_pin_name : "bodnar-USB-generic0.0.Pot4-Scale"
                        parameter_hal_pin_name : "Pot4_Scale"
                        parameter_hal_pin_id: "pot4_scale"

                        Component.onCompleted: {
                            parameter_initValue = (jsonio.updatePinValue(parameter_json_pin_name) * 100);

                        }
                        spinbox.onValueModified:  {

                            parameter_hal_pin_id.value = ( spinbox.value / 100.0) ;
                            jsonio.updateJsonDocument(parameter_spinBox.pinname, parameter_spinBox.realValue.toString());
                        }

                    }

                    Parameter_Spin_Box {
                        id: pot4_offset_parameter_sb
                        width: 250 //parent.width * pot4_column_var.rect_width_scale
                        height: 50 //parent.height* pot4_column_var.rect_height_scale

                        parameter_text : "Pot4 Offset"
                        parameter_json_pin_name : "bodnar-USB-generic0.0.Pot4-Offset"
                        parameter_hal_pin_name : "Pot4_Offset"
                        parameter_hal_pin_id: "pot4_offset"

                        Component.onCompleted: {
                            parameter_initValue = (jsonio.updatePinValue(parameter_json_pin_name) * 100);

                        }
                        spinbox.onValueModified:  {

                            parameter_hal_pin_id.value = ( spinbox.value / 100.0) ;
                            jsonio.updateJsonDocument(parameter_spinBox.pinname, parameter_spinBox.realValue.toString());
                        }
                    } //Close Spinbox
                } //Close Column
            } //Close Dialog
        }  //Close RoundMouseArea

        RoundMouseArea {
            id: roundMouseArea_right_lower_inside_pot
            width: parent.width / 22
            height: parent.width /22

            anchors.verticalCenter: js_console_image.verticalCenter
            anchors.verticalCenterOffset: (-1 *  js_console_image.paintedHeight * 0.255)
            anchors.horizontalCenter: js_console_image.horizontalCenter
            anchors.horizontalCenterOffset: ( js_console_image.paintedWidth * 0.117)

            onClicked: {
                    right_btm_Inner_pot_dialog.open()
            }

            Rectangle {
                        color: "transparent"
                        border.color: roundMouseArea_right_lower_inside_pot.pressed ? "white" : "transparent"
                        border.width: width/8
                        radius: width / 2
                        anchors.fill: parent
            }

            Dialog {
                id: right_btm_Inner_pot_dialog
                title: "Bottom Right Inside Pot Parameters"
                anchors.centerIn: parent
                width:  300 //js_console_image.width * 0.2
                height: 300 //jjs_console_image.height * 0.3
                padding: 10
                modal: true
                focus: true
                standardButtons: Dialog.Ok | Dialog.Cancel
                //closePolicy: Dialog.CloseOnEscape | Dialog.CloseOnPressOutsideParent
                // Column One
                Column {

                    id : column_pot2
                    anchors.left: parent.left
                    anchors.leftMargin: parent.width* 0.01
                    anchors.top :  parent.top
                    anchors.topMargin: parent.height * 0.05
                    width  : 300 //parent.width*0.75
                    height : 300 //parent.height*0.8

                    spacing: parent.height*0.01

                    Item {

                        id : pot2_column_var
                        property var rect_width_scale : 1.0
                        property var rect_height_scale : 0.5
                    }

                    Text {

                        id: text_pot2_01
                        width : parent.width
                        color: "black"
                        textFormat : Text.StyledText
                        wrapMode: Text.Wrap
                        text: "<font color=\"black\">Pot2 Command Output: </font> " +  pot2_cmd.value.toFixed(1);
                    }
            // Begin Spinboxes

                    Parameter_Spin_Box {
                        id: pot2_scale_parameter_sb
                        width: 250 //parent.width * pot2_column_var.rect_width_scale
                        height: 50 //parent.height* pot2_column_var.rect_height_scale

                        parameter_text : "Pot 2 Scale"
                        parameter_json_pin_name : "bodnar-USB-generic0.0.Pot2-Scale"
                        parameter_hal_pin_name : "Pot2_Scale"
                        parameter_hal_pin_id: "pot2_scale"

                        Component.onCompleted: {
                            parameter_initValue = (jsonio.updatePinValue(parameter_json_pin_name) * 100);

                        }
                        spinbox.onValueModified:  {

                            parameter_hal_pin_id.value = ( spinbox.value / 100.0) ;
                            jsonio.updateJsonDocument(parameter_spinBox.pinname, parameter_spinBox.realValue.toString());
                        }
                    }


                    Parameter_Spin_Box {
                        id: pot2_offset_parameter_sb
                        width: 250 //parent.width * pot2_column_var.rect_width_scale
                        height: 50 //parent.height* pot2_column_var.rect_height_scale

                        parameter_text : "Pot2 Offset"
                        parameter_json_pin_name : "bodnar-USB-generic0.0.Pot2-Offset"
                        parameter_hal_pin_name : "Pot2_Offset"
                        parameter_hal_pin_id: "pot2_offset"
                        Component.onCompleted: {
                            parameter_initValue = (jsonio.updatePinValue(parameter_json_pin_name) * 100);
                        }
                        spinbox.onValueModified:  {

                            parameter_hal_pin_id.value = ( spinbox.value / 100.0) ;
                            jsonio.updateJsonDocument(parameter_spinBox.pinname, parameter_spinBox.realValue.toString());
                        }
                    } // Close Spinbox
                } // Close Column
            } // Close Dialog
        }  // Close RoundMouseArea

        RoundMouseArea {
            id: roundMouseArea_top_center_switch
            width: parent.width / 24
            height: parent.width /24

            anchors.verticalCenter: js_console_image.verticalCenter
            anchors.verticalCenterOffset: (-1 *  js_console_image.paintedHeight * 0.357)
            anchors.horizontalCenter: js_console_image.horizontalCenter

            onClicked: {
                    top_center_switch_dialog.open()
            }

            Rectangle {
                        color: "transparent"
                        border.color: roundMouseArea_top_center_switch.pressed ? "white" : "transparent"
                        border.width: width/8
                        radius: width / 2
                        anchors.fill: parent
            }

            Dialog {
                id: top_center_switch_dialog
                title: "Top Center Switch State"
                anchors.centerIn: parent
                width:  300 //js_console_image.width * 0.2
                height: js_console_image.height * 0.2
                padding: 10
                modal: true
                focus: true
                standardButtons: Dialog.Ok | Dialog.Cancel
                //closePolicy: Dialog.CloseOnEscape | Dialog.CloseOnPressOutsideParent
            // Column One
                Column {
                    id : column_top_switch
                    anchors.left: parent.left
                    anchors.leftMargin: parent.width* 0.01
                    anchors.top :  parent.top
                    anchors.topMargin: parent.height * 0.05
                    width  : parent.width*0.75
                    height : parent.height*0.8
                    spacing: parent.height*0.01

                    Item {

                        id : top_switch_column_var
                        property var rect_width_scale : 1.0
                        property var rect_height_scale : 0.5
                    }

                    Text {

                        id: text_top_switch_01
                        width : parent.width
                        color: "black"
                        textFormat : Text.StyledText
                        wrapMode: Text.Wrap
                        text: "<font color=\"black\">Switch to the  Left state: </font> " +  sw_0.value;
                    }

                    Text {
                        id: text_top_switch_02
                        width : parent.width
                        color: "black"
                        textFormat : Text.StyledText
                        wrapMode: Text.Wrap
                        text: "<font color=\"black\">Switch to the Right state: </font> " +  sw_1.value;
                    }
                } // Close Column

            } // Close Dialog

        }  // Close RoundMouseArea

        RoundMouseArea {
            id: roundMouseArea_2nd_from_top_center_switch
            width: parent.width / 24
            height: parent.width /24
            anchors.verticalCenter: js_console_image.verticalCenter
            anchors.verticalCenterOffset: (-1 *  js_console_image.paintedHeight * 0.2735)
            anchors.horizontalCenter: js_console_image.horizontalCenter
            onClicked: {
                    second_center_switch_dialog.open();
            }

            Rectangle {
                color: "transparent"
                border.color: roundMouseArea_2nd_from_top_center_switch.pressed ? "white" : "transparent"
                border.width: width/8
                radius: width / 2
                anchors.fill: parent
            }

            Dialog {
                id: second_center_switch_dialog
                title: "2nd Center Switch State"
                anchors.centerIn: parent
                width:  300 //js_console_image.width * 0.2
                height: js_console_image.height * 0.2
                padding: 10
                modal: true
                focus: true
                standardButtons: Dialog.Ok | Dialog.Cancel
                //closePolicy: Dialog.CloseOnEscape | Dialog.CloseOnPressOutsideParent
                // Column One
                Column {
                    id : column_second_switch
                    anchors.left: parent.left
                    anchors.leftMargin: parent.width* 0.01
                    anchors.top :  parent.top
                    anchors.topMargin: parent.height * 0.05
                    width  : parent.width*0.75
                    height : parent.height*0.8
                    spacing: parent.height*0.01

                    Item {

                        id : second_switch_column_var
                        property var rect_width_scale : 1.0
                        property var rect_height_scale : 0.5
                    }

                    Text {

                        id: text_second_switch_01
                        width : parent.width
                        color: "black"
                        textFormat : Text.StyledText
                        wrapMode: Text.Wrap
                        text: "<font color=\"black\">Switch to the  Left state: </font> " +  sw_2.value;
                    }

                    Text {
                        id: text_second_switch_02
                        width : parent.width
                        color: "black"
                        textFormat : Text.StyledText
                        wrapMode: Text.Wrap
                        text: "<font color=\"black\">Switch to the Right state: </font> " +  sw_3.value;
                    }
                } // Close Column
            } // Close Dialog
        } // Close RoundMouseArea

        RoundMouseArea {
            id: roundMouseArea_3rd_from_top_center_switch
            width: parent.width / 24
            height: parent.width /24
            anchors.verticalCenter: js_console_image.verticalCenter
            anchors.verticalCenterOffset: (-1 *  js_console_image.paintedHeight * 0.193)
            anchors.horizontalCenter: js_console_image.horizontalCenter
            onClicked: {
                    third_center_switch_dialog.open()
            }

            Rectangle {
                        color: "transparent"
                        border.color: roundMouseArea_3rd_from_top_center_switch.pressed ? "white" : "transparent"
                        border.width: width/8
                        radius: width / 2
                        anchors.fill: parent
            }

            Dialog {
                id: third_center_switch_dialog
                title: "Third Center Switch State"
                anchors.centerIn: parent
                width:  300 //js_console_image.width * 0.2
                height: js_console_image.height * 0.2
                padding: 10
                modal: true
                focus: true
                standardButtons: Dialog.Ok | Dialog.Cancel
                //closePolicy: Dialog.CloseOnEscape | Dialog.CloseOnPressOutsideParent
                // Column One
                Column {
                    id : column_third_switch
                    anchors.left: parent.left
                    anchors.leftMargin: parent.width* 0.01
                    anchors.top :  parent.top
                    anchors.topMargin: parent.height * 0.05
                    width  : parent.width*0.75
                    height : parent.height*0.8
                    spacing: parent.height*0.01

                    Item {
                        id : third_switch_column_var
                        property var rect_width_scale : 1.0
                        property var rect_height_scale : 0.5
                    }

                    Text {

                        id: text_third_switch_01
                        width : parent.width
                        color: "black"
                        textFormat : Text.StyledText
                        wrapMode: Text.Wrap
                        text: "<font color=\"black\">Switch to the  Left state: </font> " +  sw_4.value;
                    }

                    Text {
                        id: text_third_switch_02
                        width : parent.width
                        color: "black"
                        textFormat : Text.StyledText
                        wrapMode: Text.Wrap
                        text: "<font color=\"black\">Switch to the Right state: </font> " +  sw_5.value;
                    }
                } // Close Column
            } //CloseDialog
        } // Close RoundMouseArea

        RoundMouseArea {
            id: roundMouseArea_4th_from_top_center_switch
            width: parent.width / 24
            height: parent.width /24
            anchors.verticalCenter: js_console_image.verticalCenter
            anchors.verticalCenterOffset: (-1 *  js_console_image.paintedHeight * 0.113)
            anchors.horizontalCenter: js_console_image.horizontalCenter
            onClicked: {
                    fourth_center_switch_dialog.open()
            }

            Rectangle {
                        color: "transparent"
                        border.color: roundMouseArea_4th_from_top_center_switch.pressed ? "white" : "transparent"
                        border.width: width/8
                        radius: width / 2
                        anchors.fill: parent
            }

            Dialog {
                id: fourth_center_switch_dialog
                title: "Fourth Center Switch State"
                anchors.centerIn: parent
                width:  300 //js_console_image.width * 0.2
                height: js_console_image.height * 0.2
                padding: 10
                modal: true
                focus: true
                standardButtons: Dialog.Ok | Dialog.Cancel
                //closePolicy: Dialog.CloseOnEscape | Dialog.CloseOnPressOutsideParent
            // Column One
                Column {
                    id : column_fourth_switch
                    anchors.left: parent.left
                    anchors.leftMargin: parent.width* 0.01
                    anchors.top :  parent.top
                    anchors.topMargin: parent.height * 0.05
                    width  : parent.width*0.75
                    height : parent.height*0.8
                    spacing: parent.height*0.01

                    Item {

                        id : fourth_switch_column_var
                        property var rect_width_scale : 1.0
                        property var rect_height_scale : 0.5
                    }

                    Text {

                        id: text_fourth_switch_01
                        width : parent.width
                        color: "black"
                        textFormat : Text.StyledText
                        wrapMode: Text.Wrap
                        text: "<font color=\"black\">Switch to the  Left state: </font> " +  sw_6.value;
                    }

                    Text {

                        id: text_fourth_switch_02
                        width : parent.width
                        color: "black"
                        textFormat : Text.StyledText
                        wrapMode: Text.Wrap
                        text: "<font color=\"black\">Switch to the Right state: </font> " +  sw_7.value;
                    }
                } // Close Column
            } // Close Dialog
        } // Close RoundMouseArea

        RoundMouseArea {
            id: roundMouseArea_5th_from_top_center_switch
            width: parent.width / 24
            height: parent.width /24
            anchors.verticalCenter: js_console_image.verticalCenter
            anchors.verticalCenterOffset: (-1* js_console_image.paintedHeight * 0.03)
            anchors.horizontalCenter: js_console_image.horizontalCenter

            onClicked: {
                    fifth_center_switch_dialog.open()
            }

            Rectangle {
                        color: "transparent"
                        border.color: roundMouseArea_5th_from_top_center_switch.pressed ? "white" : "transparent"
                        border.width: width/8
                        radius: width / 2
                        anchors.fill: parent
            }
            Dialog {
                id: fifth_center_switch_dialog
                title: "Fourth Center Switch State"
                anchors.centerIn: parent
                width:  300 //js_console_image.width * 0.2
                height: js_console_image.height * 0.2
                padding: 10
                modal: true
                focus: true
                standardButtons: Dialog.Ok | Dialog.Cancel
                //closePolicy: Dialog.CloseOnEscape | Dialog.CloseOnPressOutsideParent
                // Column One
                Column {
                    id : column_fifth_switch
                    anchors.left: parent.left
                    anchors.leftMargin: parent.width* 0.01
                    anchors.top :  parent.top
                    anchors.topMargin: parent.height * 0.05
                    width  : parent.width*0.75
                    height : parent.height*0.8
                    spacing: parent.height*0.01

                    Item {

                        id : fifth_switch_column_var
                        property var rect_width_scale : 1.0
                        property var rect_height_scale : 0.5
                    }

                    Text {
                        id: text_fifth_switch_01
                        width : parent.width
                        color: "black"
                        textFormat : Text.StyledText
                        wrapMode: Text.Wrap
                        text: "<font color=\"black\">Switch to the  Left state: </font> " +  sw_8.value;
                    }

                    Text {
                        id: text_fifth_switch_02
                        width : parent.width
                        color: "black"
                        textFormat : Text.StyledText
                        wrapMode: Text.Wrap
                        text: "<font color=\"black\">Switch to the Right state: </font> " +  sw_9.value;
                    }
                } // Close Column
            }  // Close Dialog
        }  // Close RoundMouseArea

        Label {
            id: label_js_mouseover_hint
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 10 //parent.height*0.05 * -1
            text: "Tap Control to see Function, Status and Parameters"
            color: button_light.checked ? "black" : "white"
            font.family: "Gentium Basic, Bold"
            font.pointSize : variable_js.font_size
        }
    }
}
