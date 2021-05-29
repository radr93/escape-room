/// @description Initialize Variables

name = "Clock";																					// Basic Name
description = "The clock is stuck at 4:20. It's completely dead";								// Basic Description when item found
description2 = "The clock is stuck at 4:20. The seconds hand is ticking but stuck in place.";	// Finding hidden item description
description3 = "I used the screwdriver on the clock and got some batteries.";					// When hidden item is found

item[0][itemprop.item] = itemid.batteries;													// Hidden Item Inventory ID
item[0][itemprop.sprite] = spr_Batteries;														// Hidden Item Inventory Sprite
item[0][itemprop.name] = "Clock Batteries";														// Hidden Item Inventory Name

type = objType.usable;																			// Item Type
conditionMet = global.ClockBatteriesTaken;																			// Condition = Item found or not?

conditionItem[0][itemprop.item] = itemid.screwdriver;											// Item required for condition
conditionItem[0][itemprop.sprite] = spr_Screwdriver;											// Item required for condition 
conditionItem[0][itemprop.name] = "Screwdriver";												// Item required for condition
destroyConditionItem = false;																	// Boolean, destroy item required or not