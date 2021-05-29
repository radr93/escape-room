/// @description Initialize Variables

name = "Battery Slot";																			// Basic Name
description = "The batteries are full and the display has power again.";						// Basic Description when item found
description2 = "I need a total of 4 batteries to get the safe lock working again.";				// Finding hidden item description
description3 = "I put 2 batteries into the slot.";	// When hidden item is found

type = objType.changeWithItem;																	// Item Type
conditionMet = global.TwoBatteriesAdded;																// Condition = Item found or not?

conditionItem[0][itemprop.item] = itemid.batteries;												// Item required for condition
conditionItem[0][itemprop.sprite] = spr_Batteries;												// Item required for condition 
conditionItem[0][itemprop.name] = "Batteries";														// Item required for condition
destroyConditionItem = true;																	// Boolean, destroy item required or not

image_index = 0;
image_speed = 0;