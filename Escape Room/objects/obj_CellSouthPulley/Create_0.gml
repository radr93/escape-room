/// @description Initialize Variables

name = "Pulley";													// Basic name
description = "This pulley needs to be reattached to the chain.";	// Basic description

item[0][itemprop.item] = itemid.pulley;								// Inventory ID
item[0][itemprop.sprite] = spr_Pulley;						// Inventory Sprite
item[0][itemprop.name] = "Pulley";									// Inventory Name

type = objType.takeItem;											// Item Type
conditionMet = global.PulleyTaken;									// Condition = taken or not taken