/// @description Initialize Variables

name = "Paperclip";											// Basic name
description = "A paperclip. This could come in handy.";		// Basic description

item[0][itemprop.item] = itemid.paperclip;				// Inventory ID
item[0][itemprop.sprite] = spr_Paperclip;					// Inventory Sprite
item[0][itemprop.name] = "Paperclip";						// Inventory Name

type = objType.takeItem;									// Item Type
conditionMet = global.PaperclipTaken;						// Condition = taken or not taken