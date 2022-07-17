import QtQuick 2.1
import QtQuick.Controls 2.12
import Machinekit.Application 1.0
import Machinekit.Application.Controls 1.0
import Machinekit.Service 1.0
import Machinekit.Controls 1.0
import Machinekit.HalRemote.Controls 1.0
import Machinekit.HalRemote 1.0
import "Joystick_Button_Connect.js" as MyScript

Rectangle {
	x: parent.width /10
	y: parent.height /10
	width: parent.width * 0.45
	height: parent.height * 0.5
	border.color: "black"

	property var js_module_number: 9
	property var js1_cmd:  0.0
	property var js1_raw:  0
	property var js2_cmd:  0.0
	property var js2_raw:  0
	property var js1_dir: true
	property var js2_dir: true
	property var js2_param_visible: true   // This allows the module1 status window to not show the 2nd channel

	Text {
		id: text_01
		anchors.top: parent.top
		anchors.left: parent.left
		anchors.topMargin: parent.height*0.01
		anchors.leftMargin: parent.width*0.01
		width: 490
		color: "black"
		textFormat: Text.StyledText
		wrapMode: Text.Wrap
		text: "<font color=\"black\"> Module " + js_module_number ;
	}

	Column {
		id: column_js1
		anchors.left: parent.left
		anchors.leftMargin: parent.width* 0.01
		anchors.top:  parent.top
		anchors.topMargin: parent.height * 0.2
		width: parent.width*0.5
		height: parent.height*0.8
		spacing: parent.height*0.01

		Item {
			id: js1_column_var
			property var rect_width_scale: 0.95
			property var rect_height_scale: 0.14
		}

		Text {
			id: textjs1_01
			width: 490
			color: "black"
			textFormat: Text.StyledText
			wrapMode: Text.Wrap
			text: "<font color=\"black\">Joystick 1 Command Output: </font> " + js1_cmd.toFixed(1);
		}

		Text {
			id: textjs1_02
			width: 490
			color: "black"
			textFormat: Text.StyledText
			wrapMode: Text.Wrap
			text: "<font color=\"black\">  Joystick 1 Raw Output: </font> " + js1_raw
		}

		Rectangle{
			id: js1_scale_spinbox_rect
			width: parent.width * js1_column_var.rect_width_scale
			height: parent.height* js1_column_var.rect_height_scale
			border.color: "black"
			border.width: 2

			Text {
				id: js1_scale_spinbox_label
				anchors.verticalCenter: js1_scale_spinbox_rect.verticalCenter
				anchors.left: js1_scale_spinbox_rect.left
				anchors.leftMargin: js1_scale_spinbox_rect.width*0.05
				text: "JS1_Scale:"
			}

			SpinBox {
				id: js1_scale_spinBox
				from: 0
				to: 100*100
				stepSize: 1
				value: 50
				property string pinname: "bodnar-USB-generic0.0.JS1-Scale"

				anchors.verticalCenter: js1_scale_spinbox_rect.verticalCenter
				anchors.right: js1_scale_spinbox_rect.right
				anchors.rightMargin: js1_scale_spinbox_rect.width*0.05
				editable: true
				height: 0.80 * js1_scale_spinbox_rect.height
				width: 0.6 * js1_scale_spinbox_rect.width

				property int decimals: 2
				property real realValue: js1_scale_spinBox.value / 100

				validator: DoubleValidator {
					bottom: Math.min(js1_scale_spinBox.from, js1_scale_spinBox.to)
					top:  Math.max(js1_scale_spinBox.from, js1_scale_spinBox.to)
				}

				textFromValue: function(value, locale) {
					return Number(value / 100).toLocaleString(locale, 'f', js1_scale_spinBox.decimals)
				}

				valueFromText: function(text, locale) {
					return Number.fromLocaleString(locale, text) * 100
				}

				HalPin {
					id: js1_scale
					name: "JS1_Scale"
					type: HalPin.Float
					direction: HalPin.Out
				}

				onValueModified:  {
					console.log ("Pin Value :" + js1_scale_spinBox.realValue.toString());

					jsonio.updateJsonDocument( js1_scale_spinBox.pinname, js1_scale_spinBox.realValue.toString());
					js1_scale.value = 666.66;
				}
			}
		}
	}
}
