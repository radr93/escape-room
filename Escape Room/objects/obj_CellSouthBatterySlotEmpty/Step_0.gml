/// @description Check for condition met

// Once condition is met i.e. proper item used, change image to open
if (conditionMet or global.TwoBatteriesAdded){
	
	global.TwoBatteriesAdded = true;
	instance_create_layer(x, y, "Instances", obj_CellSouthBatterySlotHalf);
	instance_destroy();
}