/// @description Check for condition met

// Once condition is met i.e. proper item used, change image to open
if (conditionMet or global.CellSouthSafeOpen){
	global.CellSouthSafeOpen = true;
	image_index = 1;
	type = objType.basic;
}