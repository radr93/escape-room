/// @description Check for condition met

// Once condition is met i.e. proper item used, change image to open
if (conditionMet or global.ChainFixed){
	global.ChainFixed = true;
	global.OverheadDoorOpen = true;
	type = objType.basic;
}