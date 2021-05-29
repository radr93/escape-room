/// @description Initialize Variables

name = "Battery Slot";																			// Basic Name
description = "The batteries are full and the display has power again."							// Basic Description when item found
description2 = "I've put 2 batteries into the slot. I need 2 more.";							// Finding hidden item description
description3 = "I've put another 2 batteries into the slot. The batteries are full and the display has power again.";// When hidden item is found

type = objType.changeWithItem;																	// Item Type
conditionMet = global.FourBatteriesAdded;														// Condition = Item found or not?

conditionItem[0][itemprop.item] = itemid.batteries;												// Item required for condition
conditionItem[0][itemprop.sprite] = spr_Batteries;												// Item required for condition 
conditionItem[0][itemprop.name] = "Batteries";													// Item required for condition
destroyConditionItem = true;																	// Boolean, destroy item required or not

image_index = 1;
image_speed = 0;

if (conditionMet){
	image_index = 2;
}