/// @description Check for condition met

// Once condition is met i.e. proper item used, change image to open
if (conditionMet or global.PulleyAdded){
	global.PulleyAdded = true;
	instance_create_layer(x, y, "Instances", obj_CellSouthChainFixed);
	instance_destroy();
}