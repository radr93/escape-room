/// @description Check for condition met

// Once condition is met i.e. proper item used, change image to open
if (conditionMet or global.gameOver){
	global.gameOver = true;
	type = objType.roomChange;
}