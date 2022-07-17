import QtQuick 2.1
import QtQuick.Controls 1.0
import "Joystick_Button_Connect.js" as MyScript

Rectangle{
    x: parent.width /10
    y: parent.height /10
    width: parent.width * 0.45
    height: parent.height * 0.5
    border.color: "black"

    property var pot_number : 0
    property var pot_raw :  0.0
    property var js1_raw :  0
    property var js2_cmd :  0.0
    property var js2_raw :  0
    property var js1_dir : true
    property var js2_dir : true
    property var js2_param_visible : true   // This allows the module1 status window to not show the 2nd channel

    Text {
        id: text_01
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: parent.height*0.01
        anchors.leftMargin: parent.width*0.01
        width : 490
        color: "black"
        textFormat : Text.StyledText
        wrapMode: Text.Wrap
        text: "<font color=\"black\"> Module " + js_module_number ;
    }

    Column {

        id : column_js1
        anchors.left: parent.left
        anchors.leftMargin: parent.width* 0.01
        anchors.top :  parent.top
        anchors.topMargin: parent.height * 0.2
        width  : parent.width*0.5
        height : parent.height*0.8
        spacing: parent.height*0.01

        Item {

            id : js1_column_var
            property var rect_width_scale : 0.75
            property var rect_height_scale : 0.095
        }

        Text {
            id: textjs1_01
            width : 490
            color: "black"
            textFormat : Text.StyledText
            wrapMode: Text.Wrap
            text: "<font color=\"black\">Joystick 1 Command Output: </font> " + js1_cmd.toFixed(1);
        }

        Text {
            id: textjs1_02
            width : 490
            color: "black"
            textFormat : Text.StyledText
            wrapMode: Text.Wrap
            text: "<font color=\"black\">  Joystick 1 Raw Output: </font> " + js1_raw
        }

        Rectangle{
            id: js1_scale_spinbox_rect
            width: parent.width * js1_column_var.rect_width_scale
            height: parent.height* js1_column_var.rect_height_scale
            border.color: "black"
            border.width: 2

            Text{
                id: js1_scale_spinbox_label
                anchors.verticalCenter: js1_scale_spinbox_rect.verticalCenter
                anchors.left: js1_scale_spinbox_rect.left
                anchors.leftMargin: js1_scale_spinbox_rect.width*0.05
                text: "JS1_Scale:"
            }

            SpinBox {
                id: js1_scale_spinBox
                anchors.verticalCenter: js1_scale_spinbox_rect.verticalCenter
                anchors.right: js1_scale_spinbox_rect.right
                anchors.rightMargin: js1_scale_spinbox_rect.width*0.05
            }
        }

        Rectangle{
            id: js1_feather_spinbox_rect
            width: parent.width * js1_column_var.rect_width_scale
            height: parent.height* js1_column_var.rect_height_scale
            border.color: "black"
            border.width: 2

            Text {
                id: js1_feather_spinbox_label
                anchors.verticalCenter: js1_feather_spinbox_rect.verticalCenter
                anchors.left: js1_feather_spinbox_rect.left
                anchors.leftMargin: js1_feather_spinbox_rect.width*0.05
                text: "JS1_Feather:"
            }

            SpinBox {
                id: js1_fether_spinBox
                anchors.verticalCenter: js1_feather_spinbox_rect.verticalCenter
                anchors.right: js1_feather_spinbox_rect.right
                anchors.rightMargin: js1_feather_spinbox_rect.width*0.05
            }
        }

        Rectangle{
            id: js1_max_raw_value_spinbox_rect
            width: parent.width * js1_column_var.rect_width_scale
            height: parent.height* js1_column_var.rect_height_scale
            border.color: "black"
            border.width: 2

            Text {
                id: js1_max_raw_value_spinbox_label
                anchors.verticalCenter: js1_max_raw_value_spinbox_rect.verticalCenter
                anchors.left: js1_max_raw_value_spinbox_rect.left
                anchors.leftMargin: js1_max_raw_value_spinbox_rect.width*0.05
                text: "JS1_Max_Raw_Value:"
            }

            SpinBox {
                id: js1_max_raw_value_spinBox
                anchors.verticalCenter: js1_max_raw_value_spinbox_rect.verticalCenter
                anchors.right: js1_max_raw_value_spinbox_rect.right
                anchors.rightMargin: js1_max_raw_value_spinbox_rect.width*0.05
            }
        }

        Rectangle{
            id: js1_max_accel_spinbox_rect
            width: parent.width * js1_column_var.rect_width_scale
            height: parent.height* js1_column_var.rect_height_scale
            border.color: "black"
            border.width: 2

            Text{
                id: js1_max_accel_spinbox_label
                anchors.verticalCenter: js1_max_accel_spinbox_rect.verticalCenter
                anchors.left: js1_max_accel_spinbox_rect.left
                anchors.leftMargin: js1_max_accel_spinbox_rect.width*0.05
                text: "JS1_Max_Accel_Value:"
            }

            SpinBox {
                id: js1_max_accel_spinBox
                anchors.verticalCenter: js1_max_accel_spinbox_rect.verticalCenter
                anchors.right: js1_max_accel_spinbox_rect.right
                anchors.rightMargin: js1_max_accel_spinbox_rect.width*0.05
            }
        }

        Rectangle{
            id: js1_mid_raw_value_spinbox_rect
            width: parent.width * js1_column_var.rect_width_scale
            height: parent.height* js1_column_var.rect_height_scale
            border.color: "black"
            border.width: 2

            Text{
                id: js1_mid_raw_value_spinbox_label
                anchors.verticalCenter: js1_mid_raw_value_spinbox_rect.verticalCenter
                anchors.left: js1_mid_raw_value_spinbox_rect.left
                anchors.leftMargin: js1_mid_raw_value_spinbox_rect.width*0.05
                text: "JS1_Middle_Raw_Value:"
            }

            SpinBox {
                id: js1_mid_raw_value_spinbox
                anchors.verticalCenter: js1_mid_raw_value_spinbox_rect.verticalCenter
                anchors.right: js1_mid_raw_value_spinbox_rect.right
                anchors.rightMargin: js1_mid_raw_value_spinbox_rect.width*0.05
            }
        }


        Rectangle{
            id: js1_min_raw_value_spinbox_rect
            width: parent.width * js1_column_var.rect_width_scale
            height: parent.height* js1_column_var.rect_height_scale
            border.color: "black"
            border.width: 2

            Text{
                id: js1_min_raw_value_spinbox_label
                anchors.verticalCenter: js1_min_raw_value_spinbox_rect.verticalCenter
                anchors.left: js1_min_raw_value_spinbox_rect.left
                anchors.leftMargin: js1_min_raw_value_spinbox_rect.width*0.05
                text: "JS1_Min_Raw_Value:"
            }

            SpinBox {
                id: js1_min_raw_value_spinbox
                anchors.verticalCenter: js1_min_raw_value_spinbox_rect.verticalCenter
                anchors.right: js1_min_raw_value_spinbox_rect.right
                anchors.rightMargin: js1_min_raw_value_spinbox_rect.width*0.05
            }
        }

        Rectangle{
            id: js1_scaled_min_value_spinbox_rect
            width: parent.width * js1_column_var.rect_width_scale
            height: parent.height* js1_column_var.rect_height_scale
            border.color: "black"
            border.width: 2

            Text{
                id: js1_scaled_min_value_spinbox_label
                anchors.verticalCenter: js1_scaled_min_value_spinbox_rect.verticalCenter
                anchors.left: js1_scaled_min_value_spinbox_rect.left
                anchors.leftMargin: js1_scaled_min_value_spinbox_rect.width*0.05
                text: "JS1_Scaled_Min_Value:"
            }

            SpinBox {
                id: js1_scaled_min_value_spinbox
                anchors.verticalCenter: js1_scaled_min_value_spinbox_rect.verticalCenter
                anchors.right: js1_scaled_min_value_spinbox_rect.right
                anchors.rightMargin: js1_scaled_min_value_spinbox_rect.width*0.05
            }
        }

        Rectangle{
            id: js1_scaled_max_value_spinbox_rect
            width: parent.width * js1_column_var.rect_width_scale
            height: parent.height* js1_column_var.rect_height_scale
            border.color: "black"
            border.width: 2

            Text{
                id: js1_scaled_max_value_spinbox_label
                anchors.verticalCenter: js1_scaled_max_value_spinbox_rect.verticalCenter
                anchors.left: js1_scaled_max_value_spinbox_rect.left
                anchors.leftMargin: js1_scaled_max_value_spinbox_rect.width*0.05
                text: "JS1_Scaled_Max_Value:"
            }

            SpinBox {
                id: js1_scaled_max_value_spinbox
                anchors.verticalCenter: js1_scaled_max_value_spinbox_rect.verticalCenter
                anchors.right: js1_scaled_max_value_spinbox_rect.right
                anchors.rightMargin: js1_scaled_max_value_spinbox_rect.width*0.05
            }
        }
    }

    Column {
        id : column_js2
        visible: js2_param_visible
        anchors.right:  parent.right
        anchors.rightMargin:  parent.width * -1 * 0.12
        anchors.top :  parent.top
        anchors.topMargin: parent.height * 0.2
        width : parent.width*0.5
        height :  parent.height*0.8
        spacing: parent.height*0.008

        Item {
            id : js2_column_var
            property var rect_width_scale : 0.75
            property var rect_height_scale : 0.095
        }

         Text {
            id : textjs2_01
            color : "black"
            width : 490
            wrapMode: Text.Wrap
            text: "<font color=\"black\"> Joystick 2 Command Output: </font> " + js2_cmd.toFixed(1);
         }

         Text {
            id: textjs2_02
            width : 490
            color: "black"
            textFormat : Text.StyledText
            wrapMode: Text.Wrap
            text: "<font color=\"black\">Joystick 2 Raw Output:  </font> " + js2_raw
        }
        Rectangle{
            id: js2_scale_spinbox_rect
            width: parent.width * js2_column_var.rect_width_scale
            height: parent.height* js2_column_var.rect_height_scale
            border.color: "black"
            border.width: 2

            Text{
                id: js2_scale_spinbox_label
                anchors.verticalCenter: js2_scale_spinbox_rect.verticalCenter
                anchors.left: js2_scale_spinbox_rect.left
                anchors.leftMargin: js2_scale_spinbox_rect.width*0.05
                text: "JS2_Scale:"
            }

            SpinBox {
                id: js2_scale_spinBox
                anchors.verticalCenter: js2_scale_spinbox_rect.verticalCenter
                anchors.right: js2_scale_spinbox_rect.right
                anchors.rightMargin: js2_scale_spinbox_rect.width*0.05
            }
        }

        Rectangle{
            id: js2_feather_spinbox_rect
            width: parent.width * js2_column_var.rect_width_scale
            height: parent.height* js2_column_var.rect_height_scale
            border.color: "black"
            border.width: 2

            Text{
                id: js2_feather_spinbox_label
                anchors.verticalCenter: js2_feather_spinbox_rect.verticalCenter
                anchors.left: js2_feather_spinbox_rect.left
                anchors.leftMargin: js2_feather_spinbox_rect.width*0.05
                text: "JS2_Feather:"
            }
            SpinBox {
                id: js2_fether_spinBox
                anchors.verticalCenter: js2_feather_spinbox_rect.verticalCenter
                anchors.right: js2_feather_spinbox_rect.right
                anchors.rightMargin: js2_feather_spinbox_rect.width*0.05
            }
        }

        Rectangle{
            id: js2_max_raw_value_spinbox_rect
            width: parent.width * js2_column_var.rect_width_scale
            height: parent.height* js2_column_var.rect_height_scale
            border.color: "black"
            border.width: 2

            Text{
                id: js2_max_raw_value_spinbox_label
                anchors.verticalCenter: js2_max_raw_value_spinbox_rect.verticalCenter
                anchors.left: js2_max_raw_value_spinbox_rect.left
                anchors.leftMargin: js2_max_raw_value_spinbox_rect.width*0.05
                text: "JS2_Max_Raw_Value:"
            }

            SpinBox {
                id: js2_max_raw_value_spinBox
                anchors.verticalCenter: js2_max_raw_value_spinbox_rect.verticalCenter
                anchors.right: js2_max_raw_value_spinbox_rect.right
                anchors.rightMargin: js2_max_raw_value_spinbox_rect.width*0.05
            }
        }

        Rectangle{
            id: js2_max_accel_spinbox_rect
            width: parent.width * js2_column_var.rect_width_scale
            height: parent.height* js2_column_var.rect_height_scale
            border.color: "black"
            border.width: 2

            Text{
                id: js2_max_accel_spinbox_label
                anchors.verticalCenter: js2_max_accel_spinbox_rect.verticalCenter
                anchors.left: js2_max_accel_spinbox_rect.left
                anchors.leftMargin: js2_max_accel_spinbox_rect.width*0.05
                text: "JS2_Max_Accel_Value:"
            }

            SpinBox {
                id: js2_max_accel_spinBox
                anchors.verticalCenter: js2_max_accel_spinbox_rect.verticalCenter
                anchors.right: js2_max_accel_spinbox_rect.right
                anchors.rightMargin: js2_max_accel_spinbox_rect.width*0.05
            }
        }

        Rectangle{
            id: js2_mid_raw_value_spinbox_rect
            width: parent.width * js2_column_var.rect_width_scale
            height: parent.height* js2_column_var.rect_height_scale
            border.color: "black"
            border.width: 2

            Text{
                id: js2_mid_raw_value_spinbox_label
                anchors.verticalCenter: js2_mid_raw_value_spinbox_rect.verticalCenter
                anchors.left: js2_mid_raw_value_spinbox_rect.left
                anchors.leftMargin: js2_mid_raw_value_spinbox_rect.width*0.05
                text: "JS2_Middle_Raw_Value:"
            }

            SpinBox {
                id: js2_mid_raw_value_spinbox
                anchors.verticalCenter: js2_mid_raw_value_spinbox_rect.verticalCenter
                anchors.right: js2_mid_raw_value_spinbox_rect.right
                anchors.rightMargin: js2_mid_raw_value_spinbox_rect.width*0.05
            }
        }

        Rectangle{
            id: js2_min_raw_value_spinbox_rect
            width: parent.width * js2_column_var.rect_width_scale
            height: parent.height* js2_column_var.rect_height_scale
            border.color: "black"
            border.width: 2

            Text{
                id: js2_min_raw_value_spinbox_label
                anchors.verticalCenter: js2_min_raw_value_spinbox_rect.verticalCenter
                anchors.left: js2_min_raw_value_spinbox_rect.left
                anchors.leftMargin: js2_min_raw_value_spinbox_rect.width*0.05
                text: "JS2_Min_Raw_Value:"
            }

            SpinBox {
                id: js2_min_raw_value_spinbox
                anchors.verticalCenter: js2_min_raw_value_spinbox_rect.verticalCenter
                anchors.right: js2_min_raw_value_spinbox_rect.right
                anchors.rightMargin: js2_min_raw_value_spinbox_rect.width*0.05
            }
        }

        Rectangle{
            id: js2_scaled_min_value_spinbox_rect
            width: parent.width * js2_column_var.rect_width_scale
            height: parent.height* js2_column_var.rect_height_scale
            border.color: "black"
            border.width: 2

            Text{
                id: js2_scaled_min_value_spinbox_label
                anchors.verticalCenter: js2_scaled_min_value_spinbox_rect.verticalCenter
                anchors.left: js2_scaled_min_value_spinbox_rect.left
                anchors.leftMargin: js2_scaled_min_value_spinbox_rect.width*0.05
                text: "JS2_Scaled_Min_Value:"
            }

            SpinBox {
                id: js2_scaled_min_value_spinbox
                anchors.verticalCenter: js2_scaled_min_value_spinbox_rect.verticalCenter
                anchors.right: js2_scaled_min_value_spinbox_rect.right
                anchors.rightMargin: js2_scaled_min_value_spinbox_rect.width*0.05
            }
        }

        Rectangle{
            id: js2_scaled_max_value_spinbox_rect
            width: parent.width * js2_column_var.rect_width_scale
            height: parent.height* js2_column_var.rect_height_scale
            border.color: "black"
            border.width: 2

            Text{
                id: js2_scaled_max_value_spinbox_label
                anchors.verticalCenter: js2_scaled_max_value_spinbox_rect.verticalCenter
                anchors.left: js2_scaled_max_value_spinbox_rect.left
                anchors.leftMargin: js2_scaled_max_value_spinbox_rect.width*0.05
                text: "JS2_Scaled_Max_Value:"
            }

            SpinBox {
                id: js2_scaled_max_value_spinbox
                anchors.verticalCenter: js2_scaled_max_value_spinbox_rect.verticalCenter
                anchors.right: js2_scaled_max_value_spinbox_rect.right
                anchors.rightMargin: js2_scaled_max_value_spinbox_rect.width*0.05
            }
        }
    }
}

/*
    bodnar-USB-generic0.0.js2-Feather
    bodnar-USB-generic0.0.js2-Max
    bodnar-USB-generic0.0.js2-MaxAccel
    bodnar-USB-generic0.0.js2-Mid
    bodnar-USB-generic0.0.js2-Min
    bodnar-USB-generic0.0.js2-Scale
    bodnar-USB-generic0.0.js2-ScaledMax
    bodnar-USB-generic0.0.js2-ScaledMin
*/

