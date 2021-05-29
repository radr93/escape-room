/// @description Check for condition met

// Once condition is met i.e. item has been found, convert object from hiddenItem to basic so item cannot be obtained again
if (conditionMet or global.BladesTaken){
	global.BladesTaken = true;
	type = objType.basic;
}