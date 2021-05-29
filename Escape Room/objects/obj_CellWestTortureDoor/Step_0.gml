/// @description Check for condition met

// Once condition is met i.e. proper item used, change image to open
if (conditionMet or global.tortureDoorOpen){
	global.tortureDoorOpen = true;
	type = objType.roomChange;
	image_index = 1;
}