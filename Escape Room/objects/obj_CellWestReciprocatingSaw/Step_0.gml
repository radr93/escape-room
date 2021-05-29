/// @description Check for condition met

// Once condition is met i.e. item taken, destroy the item so it cannot be obtained again
if (conditionMet or global.SawTaken){
	global.SawTaken = true;
	instance_destroy();
}