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
    property string parameter_text : "Lorem ipsum..."
    property string parameter_json_pin_name : "Json_Pin_Name_Goes_Here"
    property string parameter_hal_pin_name : "HAL_Pin_Name_Goes_Here"
    property var    parameter_hal_pin_id
    property int    parameter_initValue : 0
    property real   factor: Math.pow(10, decimals)
    property int    decimals: 2
    property real   realValue: parameter_spinBox.value / 100.0
    property string tooltip_txt
    property alias spinbox: parameter_spinBox

    Rectangle{
        id: parameter_spinbox_rect
        width: parent.width
        height: parent.height
        border.color: "black"
        border.width: 2

        Text{
            id: parameter_spinbox_label
            anchors.verticalCenter: parameter_spinbox_rect.verticalCenter
            anchors.left: parameter_spinbox_rect.left
            anchors.leftMargin: parameter_spinbox_rect.width*0.01
            text: parameter_text
        }

        SpinBox {
            id: parameter_spinBox
            from : 0
            to : 100*100
            stepSize: 1
            value: parameter_initValue
            anchors.verticalCenter: parameter_spinbox_rect.verticalCenter
            anchors.right: parameter_spinbox_rect.right
            anchors.rightMargin: parameter_spinbox_rect.width*0.01
            editable : true
            height : 0.80 * parameter_spinbox_rect.height
            width : 0.4 * parameter_spinbox_rect.width
            property real factor: Math.pow(10, decimals)
            property int decimals: 2
            property real realValue: parameter_spinBox.value / 100.0
            property string pinname: parameter_json_pin_name
            
            validator: DoubleValidator {
                bottom: Math.min(parameter_spinBox.from, parameter_spinBox.to)
                top:  Math.max(parameter_spinBox.from, parameter_spinBox.to)
            }
            textFromValue: function(value, locale) {
                    return parseFloat(value*1.0/factor).toFixed(decimals);
            }
            valueFromText: function(text, locale) {
                return Number.fromLocaleString(locale, text) * 100.0
            }

        }
    }
}
