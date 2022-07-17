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
import "Status_Window_Creation.js" as MyScript

Tab {
    id: status
    width: 1280
    height: 800
    visible: true
    title: "STATUS"
    active: true

    Item {
        id: status_item
        width: 1280
        height: 800
        anchors.fill: parent

        Item {                   // Holds variables that drive the whole Tab
            id : variable_status
            property real font_size_scaler : 0.018
            property real font_size : (variable_status.font_size_scaler * status_item.width)
        }

        HalPin {
            id: pin3
            name: "Slv0_AxisA_Status"
            type: HalPin.U32
            direction: HalPin.In
        }
        HalPin {
            id: pin4
            name: "Slv0_AxisA_Latch_Status"
            type: HalPin.U32
            direction: HalPin.In
        }
        HalPin {
            id: pin5
            name: "Slv0_AxisB_Status"
            type: HalPin.U32
            direction: HalPin.In
        }
        HalPin {
            id: pin6
            name: "Slv0_AxisB_Latch_Status"
            type: HalPin.U32
            direction: HalPin.In
        }
        HalPin {
            id: pin7
            name: "Slv1_AxisA_Status"
            type: HalPin.U32
            direction: HalPin.In
        }
        HalPin {
            id: pin8
            name: "Slv1_AxisA_Latch_Status"
            type: HalPin.U32
            direction: HalPin.In
        }
        HalPin {
            id: pin9
            name: "Slv1_AxisB_Status"
            type: HalPin.U32
            direction: HalPin.In
        }
        HalPin {
            id: pin10
            name: "Slv1_AxisB_Latch_Status"
            type: HalPin.U32
            direction: HalPin.In
        }  
        HalPin {
            id: pin11
            name: "Slv2_AxisA_Status"
            type: HalPin.U32
            direction: HalPin.In
        }
        HalPin {
            id: pin12
            name: "Slv2_AxisA_Latch_Status"
            type: HalPin.U32
            direction: HalPin.In
        }
        HalPin {
            id: pin13
            name: "Slv2_AxisB_Status"
            type: HalPin.U32
            direction: HalPin.In
        }
        HalPin {
            id: pin14
            name: "Slv2_AxisB_Latch_Status"
            type: HalPin.U32
            direction: HalPin.In
        }
        HalPin {
            id: pin15
            name: "USB_Comms"
            type: HalPin.U32
            direction: HalPin.In
        }
        HalPin {
            id: pin16
            name: "Wheels_Comms"
            type: HalPin.U32
            direction: HalPin.In
        }
        HalPin {
            id: gyro1_time_error
            name: "Gyro1_Time_Error"
            type: HalPin.U32
            direction: HalPin.In

        }
        HalPin {
            id: gyro2_time_error
            name: "Gyro2_Time_Error"
            type: HalPin.U32
            direction: HalPin.In
        }
        HalPin {
            id: time_com1_error
            name: "Time_Com1_Error"
            type: HalPin.U32
            direction: HalPin.In
        }
        HalPin {
            id: time_com2_error
            name: "Time_Com2_Error"
            type: HalPin.U32
            direction: HalPin.In
        }
        HalPin {
            id: crc1_error
            name: "CRC1_Error"
            type: HalPin.U32
            direction: HalPin.In
        }
        HalPin {
            id: crc2_error
            name: "CRC2_Error"
            type: HalPin.U32
            direction: HalPin.In
        }


        function detect_fault_in_slave(status_word_a, status_word_b) {
            // This detects bit 4 of the status word for each axis and outputs a bit value
            var bin_status_a  =  MyScript.createBinaryString(status_word_a);
            var bin_status_b  =  MyScript.createBinaryString(status_word_b);

            if((bin_status_a.charAt(3) === '1') && (bin_status_b.charAt(3) === '1') )   // IF the fault pin or either is high then
                return (1);                                                                 // Return a one if there is a fault
            else
                return(0);
        }

        Rectangle {
            id : slave0_status_detail
            x: parent.width/4 - width/2
            y: parent.height/4
            width: parent.width/6
            height: parent.width/6/2.25
            radius: 20
            color: detect_fault_in_slave(pin3.value,pin5.value) ? "red" : "#ff8888"

            MouseArea {
                anchors.fill: parent
                onDoubleClicked: MyScript.createAxisStatusObjects(0,pin3.value, pin5.value, pin4.value, pin6.value,slave0_status_detail.x,slave0_status_detail.y);
            }

            Label{
                id: label_status_slave_0
                x: ((slave0_status_detail.width/2) -label_status_slave_0.width/2)
                y: ((slave0_status_detail.height/2) - label_status_slave_0.height/2)
                text: detect_fault_in_slave(pin3.value,pin5.value) ? "Slave 0<br>Status:Fault" : "Slave 0<br>Status:OK"
                horizontalAlignment: Text.AlignHCenter
                font.family: "Gentium Basic, Bold"
                font.pointSize : variable_status.font_size
            }

        }

        Rectangle {
            id : slave1_status_detail
            x: parent.width/2 - width/2
            y: parent.height/4
            width: parent.width/6
            height: parent.width/6/2.25
            radius: 20
            color: detect_fault_in_slave(pin7.value,pin9.value) ? "red" : "#8888ff"

            MouseArea {
                anchors.fill: parent                        // Slave_number, Status AxisA, Status AxisB, Latched_Status_A, Latched_Status_B
                onDoubleClicked: MyScript.createAxisStatusObjects(1,pin7.value, pin9.value, pin8.value, pin10.value,slave1_status_detail.x,slave1_status_detail.y);
            }

            Label {
                id: label_status_slave_1
                x: ((slave1_status_detail.width/2) -label_status_slave_1.width/2)
                y: ((slave1_status_detail.height/2) - label_status_slave_1.height/2)
                text: detect_fault_in_slave(pin7.value,pin9.value) ? "Slave 1<br>Status:Fault" : "Slave 1<br>Status:OK"
                horizontalAlignment: Text.AlignHCenter
                font.family: "Gentium Basic, Bold"
                font.pointSize : variable_status.font_size
            }
        }

        Rectangle{
            id : slave2_status_detail
            x: 3*parent.width/4 - width/2
            y: parent.height/4
            width: parent.width/6
            height: parent.width/6/2.25
            radius: 20
            color: detect_fault_in_slave(pin11.value,pin13.value) ? "red" : "#88ff88"

            MouseArea {
                anchors.fill: parent
                onDoubleClicked: MyScript.createAxisStatusObjects(2,pin11.value, pin13.value, pin12.value, pin14.value,slave2_status_detail.x,slave2_status_detail.y);
            }

            Label{
                id: label_status_slave_2
                x: ((slave2_status_detail.width/2) -label_status_slave_2.width/2)
                y: ((slave2_status_detail.height/2) - label_status_slave_2.height/2)
                text: detect_fault_in_slave(pin11.value,pin13.value) ? "Slave 2<br>Status:Fault" : "Slave 2<br>Status:OK"
                horizontalAlignment: Text.AlignHCenter
                font.family: "Gentium Basic, Bold"
                font.pointSize : variable_status.font_size
            }
        }

        Rectangle{
            id : slave3_status_detail
            x: 2*parent.width/4 - width/2
            y: 2*parent.height/4
            width: parent.width/6
            height: parent.width/6/2.25
            radius: 20
            color: detect_fault_in_slave(pin15.value,pin13.value) ? "red" : "#88ff88"

            MouseArea {
                anchors.fill: parent
                onDoubleClicked: MyScript.createGyroStatusObjects(3,gyro1_time_error.value, gyro2_time_error.value, time_com1_error.value, time_com2_error.value,crc1_error.value,crc2_error.value,slave3_status_detail.x,slave3_status_detail.y);
            }

            Label{
                id: label_status_slave_3
                x: ((slave3_status_detail.width/2) -label_status_slave_3.width/2)
                y: ((slave3_status_detail.height/2) - label_status_slave_3.height/2)
                text: detect_fault_in_slave(pin11.value,pin13.value) ? "Slave 3<br>Status:Fault" : "Slave 3<br>Status:OK"
                horizontalAlignment: Text.AlignHCenter
                font.family: "Gentium Basic, Bold"
                font.pointSize : variable_status.font_size
            }
        }
    }
}
