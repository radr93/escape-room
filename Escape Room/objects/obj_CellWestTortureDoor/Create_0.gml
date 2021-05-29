/// @description Initialize Variables

name = "Heavy Door";																			// Basic Name
description = "I already opened this door. What is going on!?.";						// Basic Description when item found
description2 = "This is a sturdy, locked door. I can't get through without a key.";				// Finding hidden item description
description3 = "The key fits the lock... I'm going through to the other side";					// When hidden item is found

type = objType.changeWithItem;																	// Item Type
conditionMet = global.tortureDoorOpen;															// Condition = Item found or not?
destination = rm_CellWestTorture;

conditionItem[0][itemprop.item] = itemid.safeKey;												// Item required for condition
conditionItem[0][itemprop.sprite] = spr_SafeKey;												// Item required for condition 
conditionItem[0][itemprop.name] = "Heavy Key";														// Item required for condition
destroyConditionItem = true;																	// Boolean, destroy item required or not

image_index = 0;
image_speed = 0;