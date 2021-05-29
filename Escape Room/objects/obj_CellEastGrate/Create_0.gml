/// @description Initialize Variables

name = "Grate";																					// Basic Name
description = "A regular old grate for the air conditioning and heat.";							// Basic Description when item found
description2 = "I see a key through the grate. I don't have a screwdriver but there must be another way to reach it.";	// Finding hidden item description
description3 = "I used the makeshift hook and line to pull up the key!";						// When hidden item is found

item[0][itemprop.item] = itemid.toolboxKey;														// Hidden Item Inventory ID
item[0][itemprop.sprite] = spr_ToolboxKey;														// Hidden Item Inventory Sprite
item[0][itemprop.name] = "Brass Key";															// Hidden Item Inventory Name

type = objType.usable;																			// Item Type
conditionMet = global.ToolboxKeyTaken;																			// Condition = Item found or not?

conditionItem[0][itemprop.item] = itemid.makeshiftHook;									// Item required for condition
conditionItem[0][itemprop.sprite] = spr_MakeshiftHook;											// Item required for condition 
conditionItem[0][itemprop.name] = "Makeshift Hook and Line";									// Item required for condition
destroyConditionItem = true;																	// Boolean, destroy item required or not

image_index = 0;
image_speed = 0;