/// @description Initialize Variables

name = "Door Chain";																			// Basic Name
description = "I opened the overhead door, I don't need to use this anymore.";					// Basic Description when item found
description2 = "The door chain is busted. I need to reattach the pulley to get it working again.";// Finding hidden item description
description3 = "I've put the pulley back in place, now I need to tighten it with a wrench.";											// When hidden item is found

type = objType.changeWithItem;																			// Item Type
conditionMet = global.PulleyAdded;																// Condition = Item found or not?

conditionItem[0][itemprop.item] = itemid.pulley;												// Item required for condition
conditionItem[0][itemprop.sprite] = spr_Pulley;													// Item required for condition 
conditionItem[0][itemprop.name] = "Pulley";														// Item required for condition
destroyConditionItem = true;																	// Boolean, destroy item required or not