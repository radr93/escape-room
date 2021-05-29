/// @description Change rooms if necessary
if (destination != undefined){
	room_goto(destination);
}

// If the player does something stupid (i.e. paperclip in electrical socket)
if (doom){
	game_restart();
}