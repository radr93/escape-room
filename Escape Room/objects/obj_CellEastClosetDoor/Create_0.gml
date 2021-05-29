/// @description Initialize Variables

name = "Closet";
description = "There is a closet here. Let's take a closer look.";
type = objType.roomChange;
destination = rm_CellCloset;

image_index = 0;
image_speed = 0;

if (global.FishingLineTaken){
	image_index = 1;
}