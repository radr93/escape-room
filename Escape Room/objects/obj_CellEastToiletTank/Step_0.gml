/// @description Check for condition met

// Once condition is met i.e. item has been found, convert object from hiddenItem to basic so item cannot be obtained again
if (conditionMet or global.WrenchTaken){
	global.WrenchTaken = true;
	type = objType.basic;
}