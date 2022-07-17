
var component;
var sprite;

var slave_number = 0;
var status_word_a = 0;
var status_word_b = 0;
var latched_status_word_a = 0;
var latched_status_word_b = 0;
var buttonX = 0;
var buttonY = 0;

var gyro_1_error = 0;
var gyro_2_error = 0;
var com_1_error = 0;
var com_2_error = 0;
var chksum_1_error =0;
var chksum_2_error =0;

function createBinaryString(nMask) {
    // nMask must be between -2147483648 and 2147483647
    for (var nFlag = 31, nShifted = nMask, sMask = ""; nFlag >= 0;
        nFlag--, sMask += String(nShifted >>> 31), nShifted <<= 1);
    // console.log("Reverted Bit String: " + revertBinaryString(sMask));
    return revertBinaryString(sMask);
}

function revertBinaryString(binString){
    // Revert the bit order from LeastSignificantRight to LeastSignificantLeft
    return binString.split('').reverse().join('');
}



function decodeStatus(sMask){
    var Statusmsg = "";

    if(sMask.charAt(0) === '1') Statusmsg += "Bit 0: Ready to switch on <br> ";
    if(sMask.charAt(1) === '1') Statusmsg += "Bit 1: Switched on <br>";
    if(sMask.charAt(2) === '1') Statusmsg += "Bit 2: Operation Enabled. Set when the amplifier is enabled. <br>";
    if(sMask.charAt(3) === '1') Statusmsg += "Bit 3: Fault. If set, a latched fault condition is present in the amplifier. <br>";
    if(sMask.charAt(4) === '1') Statusmsg += "Bit 4: Voltage enabled. Set if the amplifier bus voltage is above the minimum necessary for normal operation.` <br>";
    if(sMask.charAt(5) === '0') Statusmsg += "Bit 5: Quick Stop. When clear, the amplifier is performing a quick stop. <br>";
    if(sMask.charAt(6) === '1') Statusmsg += "Bit 6: Switch on disabled. <br>";
    if(sMask.charAt(7) === '1') Statusmsg += "Bit 7: Warning. Set if a warning condition is present on the amplifier. Read the Manufacturer Status Register object (index 0x1002, p. 61) for details of what warning is bit indicates. <br>";
    if(sMask.charAt(8) === '1') Statusmsg += "Bit 8: Set if the last trajectory was aborted rather than finishing normally. <br>";
    if(sMask.charAt(9) === '1') Statusmsg += "Bit 9: Remote. Set when the amplifier is being controlled by the CANopen interface. When clear, the amplifier may be monitored through this interface, but some other input source is controlling it.  <br>";
    if(sMask.charAt(10) === '1') Statusmsg += "Bit 10: Target Reached. This bit is set when the amplifier is finished running a trajectory, and the Position Error (index 0x60F4, p. 134) has been within the Position Tracking Window (index 0x6067, p. 132) for the programmed time. The bit is not cleared until a new trajectory is started. <br>";
    if(sMask.charAt(11) === '1') Statusmsg += "Bit 11: Internal Limit Active. This bit is set when one of the amplifier limits (current, voltage, velocity or position) is active. The specific bits from the Manufacturer Status Register (index 0x1002, p. 61) that cause this bit to be set can be customized by using the mask defined in the Limit Status Mask object (index 0x2184, p. 62). <br>";
    if(sMask.charAt(12) === '1') Statusmsg += "Bit 12: Special Modal Bit <br>";
    if(sMask.charAt(13) === '1') Statusmsg += "Bit 13: Special Modal Bit <br>";
    if(sMask.charAt(14) === '1') Statusmsg += "Bit 14: Set when the amplifier is performing a move and cleared when the trajectory finishes. This bit is cleared immediately at the end of the move, not after the motor has settled into position. <br>";
    if(sMask.charAt(15) === '1') Statusmsg += "Bit 15: Set if the home position has been captured, cleared if it hasn't. <br>";
    //console.log("statusmsg: " + Statusmsg);
    return Statusmsg;
}

function decodeLatchedStatus(sMask){
    var LatchedStatusmsg = "";
    if(sMask.charAt(0) === '1') LatchedStatusmsg += "Bit 0: Data flash CRC failure. This fault is considered fatal and cannot be cleared. <br> ";
    if(sMask.charAt(1) === '1') LatchedStatusmsg += "Bit 1: Amplifier internal error. This fault is considered fatal and cannot be cleared. <br> ";
    if(sMask.charAt(2) === '1') LatchedStatusmsg += "Bit 2: Short Circuit <br> ";
    if(sMask.charAt(3) === '1') LatchedStatusmsg += "Bit 3: Amplifier over temperature <br> ";
    if(sMask.charAt(4) === '1') LatchedStatusmsg += "Bit 4: Motor over temperature. <br> ";
    if(sMask.charAt(5) === '1') LatchedStatusmsg += "Bit 5: Over voltage.  <br> ";
    if(sMask.charAt(6) === '1') LatchedStatusmsg += "Bit 6: Under voltage.  <br> ";
    if(sMask.charAt(7) === '1') LatchedStatusmsg += "Bit 7: Feedback fault.  <br> ";
    if(sMask.charAt(8) === '1') LatchedStatusmsg += "Bit 8: Phasing error. <br> ";
    if(sMask.charAt(9) === '1') LatchedStatusmsg += "Bit 9: Tracking error. <br> ";
    if(sMask.charAt(10) === '1') LatchedStatusmsg += "Bit 10: Over Current, <br> ";
    if(sMask.charAt(11) === '1') LatchedStatusmsg += "Bit 11: FPGA failure. <br> ";
    if(sMask.charAt(12) === '1') LatchedStatusmsg += "Bit 12: Command input lost <br> ";
    if(sMask.charAt(13) === '1') LatchedStatusmsg += "Bit 13: FPGA failure (yes, there are two bits for this, they mean slightly different things)  <br> ";
    if(sMask.charAt(14) === '1') LatchedStatusmsg += "Bit 14: Safety circuit fault. <br> ";
    if(sMask.charAt(15) === '1') LatchedStatusmsg += "Bit 15: Unable to control current. <br> ";
    //console.log("Latched Status Msg: " + LatchedStatusmsg);
    return LatchedStatusmsg;
}

function createAxisStatusObjects(slave_num, status_a, status_b, latched_status_a, latched_status_b,x,y) {
    component = Qt.createComponent("Status_window.qml");
    component.id = "status_window_slave" + slave_num;

    slave_number = slave_num;
    status_word_a = status_a;
    status_word_b = status_b;
    latched_status_word_a = latched_status_a;
    latched_status_word_b = latched_status_b;
    buttonX = x;
    buttonY = y;


    if (component.status === Component.Ready){
        finishCreation();
    }
    else
        component.statusChanged.connect(finishCreation);
}

function createGyroStatusObjects(slave_num, gyro1_err, gyro2_err, com1_err, com2_err, crc1_err, crc2_err, x,y) {
    component = Qt.createComponent("Gyro_Status_Window.qml");
    component.id = "Gyro_Status_Window_Slave" + slave_num;

    slave_number = slave_num;
    gyro_1_error = gyro1_err;
    gyro_2_error = gyro2_err;
    com_1_error = com1_err;
    com_2_error = com2_err;
    chksum_1_error = crc1_err;
    chksum_2_error = crc2_err;

    buttonX = x;
    buttonY = y;


    if (component.status === Component.Ready){
        finishGyroCreation();
    }
    else
        component.statusChanged.connect(finishGyroCreation);
}

function finishCreation() {

    // When Component is ready, read in passed parameters
    if (component.status === Component.Ready) {
        var status_slv_axis_a_binary = createBinaryString(status_word_a).substr(0,16);
        var status_slv_axis_b_binary = createBinaryString(status_word_b).substr(0,16);

        var latched_status_slv_axis_a_binary = createBinaryString(latched_status_word_a).substr(0,16);
        var latched_status_slv_axis_b_binary = createBinaryString(latched_status_word_b).substr(0,16);

        var status_slv_axis_a_decoded = decodeStatus(status_slv_axis_a_binary);
        var status_slv_axis_b_decoded = decodeStatus(status_slv_axis_b_binary);
        var latched_status_slv_axis_a_decoded = decodeLatchedStatus(latched_status_slv_axis_a_binary);
        var latched_status_slv_axis_b_decoded = decodeLatchedStatus(latched_status_slv_axis_b_binary);

        sprite = component.createObject(parent);

       // sprite.id = "status_window_slave" + slave_number;
        sprite.status_slave_a_decoded = status_slv_axis_a_decoded;
        sprite.latched_status_slave_a_decoded = latched_status_slv_axis_a_decoded;
        sprite.status_slave_b_decoded = status_slv_axis_b_decoded;
        sprite.latched_status_slave_b_decoded = latched_status_slv_axis_b_decoded;
        sprite.status_slave_number = slave_number

        if(slave_number === 0) {
                    sprite.x = buttonX ;
                    sprite.y = buttonY ;
                    return;
        }
        if(slave_number === 1) {
                    sprite.x = buttonX;
                    sprite.y = buttonY;
                    return;
        }
        if(slave_number === 2) {
                    sprite.x = buttonX;
                    sprite.y = buttonY;
                    return;
        }
        if(slave_number === 3) {
                    sprite.x = buttonX;
                    sprite.y = buttonY;
                    return;
        }

    } else if (component.status === Component.Error) {
        // Error Handling
        console.log("Error loading component:", component.errorString());
    }
}

function finishGyroCreation() {

    if (component.status === Component.Ready) {

        sprite = component.createObject(parent);
        
        // sprite.id = "status_window_slave" + slave_number;
        sprite.gyro_1_error = gyro_1_error;
        sprite.gyro_2_error = gyro_2_error;
        sprite.com_1_error =  com_1_error;
        sprite.com_2_error =  com_2_error;
        sprite.crc_1_error =  chksum_1_error;
        sprite.crc_2_error =  chksum_2_error;
        sprite.status_slave_number = slave_number

        if(slave_number === 3) {
            sprite.x = buttonX;
            sprite.y = buttonY;
            return;
        }
    } else if (component.status === Component.Error) {
        // Error Handling
        console.log("Error loading component:", component.errorString());
    }
}
