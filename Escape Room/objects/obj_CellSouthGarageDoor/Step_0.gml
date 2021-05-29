/// @description Check for condition met

// Once condition is met i.e. proper item used, change image to open
if (conditionMet or global.OverheadDoorOpen){
	global.OverheadDoorOpen = true;
	image_index = 1;
	type = objType.basic;
	
	// If the safe is still locked
	if (!global.CellSouthSafeOpen){
		if (!instance_exists(obj_CellSouthWallSafeLocked)){
			instance_create_layer(112, 32, "Instances", obj_CellSouthWallSafeLocked);
		}
	}
	// If the safe is unlocked
	else{
		if (!instance_exists(obj_CellSouthWallSafeLocked)){
			instance_create_layer(112, 32, "Instances", obj_CellSouthWallSafeCracked);
		}
	}
}