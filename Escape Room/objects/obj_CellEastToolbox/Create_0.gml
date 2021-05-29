/// @description Initialize Variables

name = "Toolbox";																				// Basic Name
description = "The toolbox is empty.";															// Basic Description when item found
description2 = "There is a lock on the toolbox. I need a key to open it.";						// Finding hidden item description
description3 = "I used the key on the lock and got a Screwdriver from the toolbox.";			// When hidden item is found

item[0][itemprop.item] = itemid.screwdriver;													// Hidden Item Inventory ID
item[0][itemprop.sprite] = spr_Screwdriver;														// Hidden Item Inventory Sprite
item[0][itemprop.name] = "Screwdriver";															// Hidden Item Inventory Name

type = objType.usable;																			// Item Type
conditionMet = global.ScrewdriverTaken;															// Condition = Item found or not?

conditionItem[0][itemprop.item] = itemid.toolboxKey;											// Item required for condition
conditionItem[0][itemprop.sprite] = spr_ToolboxKey;												// Item required for condition 
conditionItem[0][itemprop.name] = "Toolbox Key";												// Item required for condition
destroyConditionItem = true;																	// Boolean, destroy item required or not

image_index = 0;
image_speed = 0;