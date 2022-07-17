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

Tab {
    id: eng
    title: "ENGINEERING"
    active: true
    width: parent.width
    height: parent.height
    asynchronous: false

    Item {
        id : eng_item
        x: 0
        y: 0
        width: parent.width
        height: parent.height
        visible: true
        anchors.fill: parent

        Item{                   // Holds variables that drive the whole Tab
            id : variable_eng
            property real font_size_scaler : 0.012
            property real tick_font_size_scaler : 0.008
            property real font_size : (variable_eng.font_size_scaler * eng.width)
            property real tick_font_size : variable_eng.tick_font_size_scaler * eng.width
        }

        Label {
            text: "asdfasdf"
        }
    }
}
