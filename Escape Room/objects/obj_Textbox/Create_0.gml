/// @description Initialize Variables

// Initialize variables
text = "";					// The text to draw in the textbox
destination = undefined;	// If there's a destination assigned, will go to that room when the textbox is destroyed
doom = false;				// If the player does something stupid (i.e. paperclip in electrical socket)

// Countdown to destruction
var seconds = 3;
alarm[0] = room_speed*seconds;