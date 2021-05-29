/// @description Go to destination and create tooltip

// Go to destination

// If clicking the arrow
var click = mouse_check_button_pressed(mb_left)
if (click and position_meeting(mouse_x, mouse_y, self)){
	
	// As long as there's a destination, go to that destination
	if (destination != undefined)	{ room_goto(destination); }
}

// Create tooltip

// If hovering over the arrow and there is a destination
if (position_meeting(mouse_x, mouse_y, self) and !is_undefined(destination)){
	
	// Create a tooltip with the arrow's name/direction
	if (!instance_exists(obj_Tooltip)){
		var tooltip = instance_create_layer(mouse_x, mouse_y, "Controllers", obj_Tooltip);
		tooltip.text = name;
	}
}