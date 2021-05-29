/// @description Initialize Variables

// Enumerate cursor sub-images
enum cursor{
	point,		// Pointing finger (idle/nothing of interest under cursor)
	grab,		// Grabbing hand (able pick something up under cursor)
	inspect,	// Magnifying Glass (able to inspect something under cursor)
	MAX
}

// Set default cursor to pointing finger
cursor_index = cursor.point;