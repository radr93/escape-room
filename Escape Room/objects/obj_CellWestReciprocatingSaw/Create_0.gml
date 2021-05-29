/// @description Initialize Variables

name = "Reciprocating Saw";									// Basic name
description = "A reciprocating saw with no blade.";			// Basic description

item[0][itemprop.item] = itemid.reciprocatingSawEmpty;		// Inventory ID
item[0][itemprop.sprite] = spr_ReciprocatingSawEmpty;		// Inventory Sprite
item[0][itemprop.name] = "Reciprocating Saw (no blade)";	// Inventory Name

type = objType.takeItem;									// Item Type
conditionMet = global.SawTaken;								// Condition = taken or not taken