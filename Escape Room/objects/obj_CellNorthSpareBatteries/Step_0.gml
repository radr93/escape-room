/// @description Check for condition met

// Once condition is met i.e. item taken, destroy the item so it cannot be obtained again
if (conditionMet or global.SpareBatteriesTaken){
	global.SpareBatteriesTaken = true;
	instance_destroy();
}