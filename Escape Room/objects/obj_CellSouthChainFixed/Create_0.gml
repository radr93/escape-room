/// @description Initialize Variables

name = "Door Chain";																			// Basic Name
description = "I opened the overhead door, I don't need to use this anymore.";					// Basic Description when item found
description2 = "I've put the pulley back in place, now I need to tighten it with a wrench.";	// Finding hidden item description
description3 = "I've tightened the pulley. I pull on the chain and the overhead door opens.";	// When hidden item is found

type = objType.changeWithItem;																	// Item Type
conditionMet = global.ChainFixed;																// Condition = Item found or not?

conditionItem[0][itemprop.item] = itemid.wrench;												// Item required for condition
conditionItem[0][itemprop.sprite] = spr_Wrench;													// Item required for condition 
conditionItem[0][itemprop.name] = "Wrench";														// Item required for condition
destroyConditionItem = false;																	// Boolean, destroy item required or not