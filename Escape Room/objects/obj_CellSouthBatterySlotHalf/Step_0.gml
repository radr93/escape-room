/// @description Check for condition met

// Once condition is met i.e. proper item used, change image to open
if (conditionMet or global.FourBatteriesAdded){
	global.FourBatteriesAdded = true;
	type = objType.basic;
	image_index = 2;
}