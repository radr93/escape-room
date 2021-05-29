/// @description Initialize Variables

name = "Spare Batteries";									// Basic name
description = "Spare batteries. Might as well take them.";	// Basic description

item[0][itemprop.item] = itemid.batteries;					// Inventory ID
item[0][itemprop.sprite] = spr_Batteries;					// Inventory Sprite
item[0][itemprop.name] = "Spare Batteries";					// Inventory Name

type = objType.takeItem;									// Item Type
conditionMet = global.SpareBatteriesTaken;					// Condition = taken or not taken