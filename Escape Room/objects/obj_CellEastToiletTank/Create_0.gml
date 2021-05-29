/// @description Initialize Variables

name = "Toilet";																			// Basic Name
description = "A normal looking toilet.";													// Basic Description
description2 = "Hey, there's a wrench wedged between the tank and the wall!"				// Finding hidden item description

item[0][itemprop.item] = itemid.wrench;														// Hidden Item Inventory ID
item[0][itemprop.sprite] = spr_Wrench;														// Hidden Item Inventory Sprite
item[0][itemprop.name] = "Wrench";															// Hidden Item Inventory Name

type = objType.takeItemHidden;																// Item Type
conditionMet = global.WrenchTaken;															// Condition = Item found or not?