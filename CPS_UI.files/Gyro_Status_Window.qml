import QtQuick 2.12
import QtQuick.Controls 2.5

Rectangle{
    id: status_msg
    x: parent.width /10
    y: parent.height /10
    width: parent.width * 0.35
    height: parent.height * 0.35
    border.color: "black"
    border.width: 2

    property string status_slave_number : ""
    property string gyro_1_error :  ""
    property string gyro_2_error :  ""
    property string com_1_error :  ""
    property string com_2_error :  ""
    property string crc_1_error :  ""
    property string crc_2_error :  ""

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
                        color: "black"
                        textFormat : Text.StyledText
                        wrapMode: Text.Wrap
                        text: "<font color=\"black\"> SLAVE " + status_slave_number + " Gyro  1 STATUS<br><br> Gyro 1 DataTimeouts since boot: </font> " + gyro_1_error
                    }

                    Text {
                        id: text_02
                        width : status_msg.width
                        color: "black"
                        textFormat : Text.StyledText
                        wrapMode: Text.Wrap
                        text: "<font color=\"black\"> Gyro 1 Timestamp Errors since boot:  </font> " + com_1_error
                    }

                    Text {
                        id : text_03
                        color : "black"
                        width : status_msg.width
                        wrapMode: Text.Wrap
                        text: "<font color=\"black\">Gyro 1 Checksum Errors since boot:  </font> " + crc_1_error
                    }

                    Text {
                        id: text_04
                        width : status_msg.width
                        color: "black"
                        textFormat : Text.StyledText
                        wrapMode: Text.Wrap
                        text: "<font color=\"black\">Gyro 2 STATUS <br><br> Gyro 2 DataTimeouts since boot:  </font> " + gyro_2_error
                    }

                    Text {
                        id: text_05
                        width : status_msg.width
                        color: "black"
                        textFormat : Text.StyledText
                        wrapMode: Text.Wrap
                        text: "<font color=\"black\">Gyro 2 Timestamp Errors since boot:  </font> " + com_2_error
                    }

                    Text {
                        id : text_06
                        color : "black"
                        width : status_msg.width
                        wrapMode: Text.Wrap
                        text: "<font color=\"black\">Gyro 2 Checksum Errors since boot:  </font> " + crc_2_error
                    }
                }   
            }
        }
    }
}
