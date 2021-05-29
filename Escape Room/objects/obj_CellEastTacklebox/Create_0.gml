/// @description Initialize Variables

name = "Tackle Box";																			// Basic Name
description = "The tackle box is empty now.";													// Basic Description
description2 = "You open the tackle box and find some fishing line. That may come in handy."	// Finding hidden item description

item[0][itemprop.item] = itemid.fishingLine;													// Hidden Item Inventory ID
item[0][itemprop.sprite] = spr_FishingLine;														// Hidden Item Inventory Sprite
item[0][itemprop.name] = "Fishing Line";														// Hidden Item Inventory Name

type = objType.takeItemHidden;																	// Item Type
conditionMet = global.FishingLineTaken;																			// Condition = Item found or not?

image_index = 0;
image_speed = 0;