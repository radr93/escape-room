/// @function craft_item(_input1, input2);
/// @param {itemID} The item ID to attempt to craft
/// @param2 {itemID} The second item ID to attempt to craft


// Attempt to craft an item
function craft_item(_input1, _input2){
	
	// Initialize local variables
	var result;
	result[0][itemprop.item]= -1;
	result[0][itemprop.sprite]= -1;
	result[0][itemprop.name]= -1;
	
	// Check what the first item was
	switch (_input1){
		
		// If item was fishing line
		case itemid.fishingLine:
			
			// Check was the second item was
			switch(_input2){
				
				// If the item was a paperclip
				case itemid.paperclip:
					
					// Produce result
					result[0][itemprop.item]= itemid.makeshiftHook;
					result[0][itemprop.sprite]= spr_MakeshiftHook;
					result[0][itemprop.name]= "Makeshift Hook and Line";
			}
			break;
		
		// If item was a paperclip
		case itemid.paperclip:
		
			// Check was the second item was
			switch(_input2){
				
				// If the item was fishing line
				case itemid.fishingLine:
				
					// Produce result
					result[0][itemprop.item]= itemid.makeshiftHook;
					result[0][itemprop.sprite]= spr_MakeshiftHook;
					result[0][itemprop.name]= "Makeshift Hook and Line";
					
			}
			break;
			
		// If item was reciprocatingSawEmpty
		case itemid.reciprocatingSawEmpty:
			
			// Check was the second item was
			switch(_input2){
				
				// If the item was a sawBlade
				case itemid.sawBlade:
					
					// Produce result
					result[0][itemprop.item]= itemid.reciprocatingSawLoaded;
					result[0][itemprop.sprite]= spr_ReciprocatingSawLoaded;
					result[0][itemprop.name]= "Reciprocating Saw (Bladed)";
			}
			break;
		
		// If item was a sawBlade
		case itemid.sawBlade:
		
			// Check was the second item was
			switch(_input2){
				
				// If the item was reciprocatingSawEmpty
				case itemid.reciprocatingSawEmpty:
				
					// Produce result
					result[0][itemprop.item]= itemid.reciprocatingSawLoaded;
					result[0][itemprop.sprite]= spr_ReciprocatingSawLoaded;
					result[0][itemprop.name]= "Reciprocating Saw (Bladed)";
					
			}
			break;
	}
	
	// Return result
	return(result);
}