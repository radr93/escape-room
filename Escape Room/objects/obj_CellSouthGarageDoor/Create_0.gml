/// @description Initialize Variables

name = "Overhead Door";																			// Basic Name
description = "The overhead door is now open.";													// Basic Description when item found
description2 = "There is an overhead door here. It should open with the chain.";				// Finding hidden item description

type = objType.changeWithCondition;																// Item Type
conditionMet = global.OverheadDoorOpen;															// Condition = Item found or not?

image_index = 0;
image_speed = 0;