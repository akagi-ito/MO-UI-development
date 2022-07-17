
var component;
var sprite_0;
var sprite_1;

var js_module_number = 0;
var js1_Cmd = 0;
var js1_Raw = 0;
var js1_Dir = 0;
var js2_Cmd = 0;
var js2_Raw = 0;
var js2_Dir = 0;

var buttonX = 0;
var buttonY = 0;

function create_JS_Status_Objects(js_num, js1_cmd, js1_raw, js2_cmd, js2_raw, x,y) {
	component = Qt.createComponent("Joystick_Status_Window.qml");
	component.id = "JS_window_slave" + js_num;
	// Get the passed parameters into local variables
	console.log("Component Created: " + component.id)

	js_module_number = js_num;
	js1_Cmd = js1_cmd;
	js1_Raw = js1_raw;
	js2_Cmd = js2_cmd;
	js2_Raw = js2_raw;
	buttonX = x;
	buttonY = y;

	if(component.status === Component.Ready) {
		finish_JS_Status_Creation();
	} else {
		component.statusChanged.connect(finish_JS_Status_Creation);
	}
}

function finish_JS_Status_Creation() {
	// When Component is ready, read in passed parameters
	if (component.status === Component.Ready) {
		if(js_module_number === 0) {
			sprite_0 = component.createObject(parent);

			sprite_0.js1_cmd = js1_Cmd;
			sprite_0.js1_raw = js1_Raw;
			sprite_0.js2_cmd = js2_Cmd;
			sprite_0.js2_raw = js2_Raw;
			sprite_0.js_module_number = js_module_number;
			sprite_0.x = buttonX;
			sprite_0.y = buttonY;
			return;
		}

		if(js_module_number === 1) {
			sprite_1 = component.createObject(parent);

			sprite_1.js1_cmd = js1_Cmd;
			sprite_1.js1_raw = js1_Raw;
			sprite_1.js2_cmd = js2_Cmd;
			sprite_1.js2_raw = js2_Raw;
			sprite_1.js_module_number = js_module_number;

			sprite_1.x = buttonX;
			sprite_1.y = buttonY;
			return;
		}
	}  else if (component.status === Component.Error) {
		// Error Handling
		console.log("Error loading component:", component.errorString());
		return;
	}
}

function update_js_data(module_id, js1_command, js1_raw_value, js2_command, js2_raw_value) {
	if(module_id === 0) {
		if(sprite_0 !== undefined) {
			js1_Cmd = js1_command;
			js1_Raw = js1_raw_value;
			js2_Cmd = js2_command;
			js2_Raw = js2_raw_value;

			sprite_0.js1_cmd = js1_Cmd.toString();
			sprite_0.js1_raw = js1_Raw.toString();
			sprite_0.js2_cmd = js2_Cmd.toString();
			sprite_0.js2_raw = js2_Raw.toString();
		}
		return;
	}

	if(module_id === 1) {
		if(sprite_1 !== undefined) {
			js1_Cmd = js1_command;
			js1_Raw = js1_raw_value;
			js2_Cmd = js2_command;
			js2_Raw = js2_raw_value;

			sprite_1.js1_cmd = js1_Cmd.toString();
			sprite_1.js1_raw = js1_Raw.toString();
			sprite_1.js2_cmd = js2_Cmd.toString();
			sprite_1.js2_raw = js2_Raw.toString();
		}
		return;
	}

	function update_js_dir(module_id, js1_direction, js2_direction) {
		console.log("Direction_Changed_Function")
		return;
	}
}
