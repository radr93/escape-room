/// @description Initialize Variables

name = "Dresser";																	// Basic Name
description = "A nice wooden dresser. Nothing of interest in here.";				// Basic Description
description2 = "There's nothing much in here... might as well take this saw blade.";// Finding hidden item description

item[0][itemprop.item] = itemid.sawBlade;											// Hidden Item Inventory ID
item[0][itemprop.sprite] = spr_SawBlade;											// Hidden Item Inventory Sprite
item[0][itemprop.name] = "Saw Blade";												// Hidden Item Inventory Name

type = objType.takeItemHidden;														// Item Type
conditionMet = global.BladesTaken;													// Condition = Item found or not?