/// @description Initialize Variables

/// @description Initialize Variables

name = "Outlet";																				// Basic Name
description = "An electrical outlet. I plugged in the saw and escaped...";						// Basic Description when item found
description2 = "A electrical outlet. I can plug something in here.";							// Finding hidden item description
description3 = "I plug in the reciprocating saw and cut away at the bars that contained me...";	// When hidden item is found

type = objType.changeWithItem;																	// Item Type
conditionMet = global.gameOver;																// Condition = Item found or not?
destination = rm_Ending;

conditionItem[0][itemprop.item] = itemid.reciprocatingSawLoaded;								// Item required for condition
conditionItem[0][itemprop.sprite] = spr_ReciprocatingSawLoaded;									// Item required for condition 
conditionItem[0][itemprop.name] = "Reciprocating Saw (bladed)";														// Item required for condition
destroyConditionItem = true;																	// Boolean, destroy item required or not
