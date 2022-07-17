import QtQuick 2.12
import QtQuick.Controls 2.5

Rectangle {
    id: status_msg
    visible: true
    x: parent.width /10
    y: parent.height /10
    width: parent.width * 0.35
    height: parent.height * 0.35
    border.color: "black"
    border.width: 2

    property string status_slave_number: ""
    property string status_slave_a_decoded: ""
    property string latched_status_slave_a_decoded: ""
    property string status_slave_b_decoded: ""
    property string latched_status_slave_b_decoded: ""

    ScrollView {
        id: frame
        clip: true
        anchors.fill: parent
        anchors.margins: 5
        ScrollBar.vertical.policy: ScrollBar.AlwaysOn

        Flickable {

            MouseArea {
                anchors.fill: parent
                onDoubleClicked: status_msg.destroy()
            }
            contentHeight: 1000
            width: parent.width

            Rectangle {
                id : rectangle
                anchors.margins: 10
                anchors.fill: parent

                Column {
                    spacing: 5
                    Text {
                        id: text_01
                        width : status_msg.width
                        color: "red"
                        textFormat : Text.StyledText
                        wrapMode: Text.Wrap
                        text: "<font color=\"black\"> SLAVE " + "status_slave_number" + " STATUS<br> Axis A:<br>  </font> " + "status_slave_a_decoded" + "<br>"
                    }

                    Text {
                        id: text_03
                        width : status_msg.width
                        color: "red"
                        textFormat : Text.StyledText
                        wrapMode: Text.Wrap
                        text: "<font color=\"black\"> SLAVE " + "status_slave_number" + "  Latched Status<br> Axis A:<br>  </font> " + "latched_status_slave_a_decoded" + "<br>"
                    }

                    Text {
                        id : text_02
                        color : "red"
                        width : status_msg.width
                        wrapMode: Text.Wrap
                        text: "<font color=\"black\"> SLAVE " + "status_slave_number" + " STATUS<br> Axis B:<br>  </font> " + "status_slave_b_decoded" + "<br>"
                    }

                    Text {
                        id : text_04
                        color : "red"
                        width : status_msg.width
                        wrapMode: Text.Wrap
                        text: "<font color=\"black\"> SLAVE " + "status_slave_number" + " Latched Status<br> Axis B:<br>  </font> " + "latched_status_slave_b_decoded"
                    }
                }
            }
        }
    }
}
