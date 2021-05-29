/// @description Handle Inventory Interaction

// Initialize local variables
var xx, yy, gridSize, spacing, click;
xx = 168;											// Left side of where the inventory is drawn
yy = 6;										// Top side of where the inventory is drawn
gridSize = 12;									// Size of each inventory cell
spacing = 2;									// Spacing between inventory cells
click = mouse_check_button_pressed(mb_left);	// Easy shorthand for left-click interaction


// Interact with the inventory
	
// Loop through the inventory
for (var i = 0; i < inventorySlots; i++){
	
	// If hovering over a certain cell
	if (mouse_x >= xx and mouse_x < xx+gridSize and mouse_y >= yy and mouse_y < yy+gridSize){
		
		// If the current cell is not empty		
		if (inventory[i][0] != -1){
			
			// Draw the "name" of the object in the cell as a tooltip
			if (!instance_exists(obj_Tooltip)){
				var tooltip = instance_create_layer(mouse_x, mouse_y, "Controllers", obj_Tooltip);
				
				if (itemHeld[0][0] == -1){
					tooltip.text = "Use "+string(inventory[i][itemprop.name]);
				}
				
				else{
					if (itemHeld[0][itemprop.name] != inventory[i][itemprop.name]){
						tooltip.text = "Use "+itemHeld[0][itemprop.name]+" on "+inventory[i][itemprop.name];
					}
					else{
						tooltip.text = "Use "+string(inventory[i][itemprop.name]);
					}
				}
			}
		}
			
		// If clicking on a certain cell
		if (click){
				
			// Using an item
				
			// If you are not already trying to use an item
			if (itemHeld[0][0] == -1){
					
				// Start using the item in the cell you clicked on
				itemHeld[0][itemprop.item] = inventory[i][itemprop.item]; // Start using itemid from inventory
				itemHeld[0][itemprop.sprite] = inventory[i][itemprop.sprite]; // Start using sprite from inventory
				itemHeld[0][itemprop.name] = inventory[i][itemprop.name]; // Start using name from inventory
			}
				
			// If you are already trying to use an item
			else{
					
				// If the space you're clicking on is empty
				if (inventory[i][itemprop.item] == -1){
					
					// Loop through to find original copy and destroy it
					for (var j = 0; j < inventorySlots; j++){
						if (inventory[j][itemprop.name] == itemHeld[0][itemprop.name]){
							inventory[j][itemprop.item] = -1;
							inventory[j][itemprop.sprite] = -1;
							inventory[j][itemprop.name] = -1;
						}
					}
					
					// Fill it with the Item Held
					inventory[i][itemprop.item] = itemHeld[0][itemprop.item];
					inventory[i][itemprop.sprite] = itemHeld[0][itemprop.sprite];
					inventory[i][itemprop.name] = itemHeld[0][itemprop.name];
					
					// Clear the Item Held
					itemHeld[0][itemprop.item] = -1;
					itemHeld[0][itemprop.sprite] = -1;
					itemHeld[0][itemprop.name] = -1;
				}
					
				// Try to use it on the item you're hovering over in the inventory
				else if (itemHeld[0][itemprop.name] != inventory[i][itemprop.name]){
					
					// Create a textbox to display the result of the attempted combination
					var textbox = instance_create_layer(mouse_x, mouse_y, "Controllers", obj_Textbox);
					
					// Attempt to combine the two items
					var input1, input2, result;
					input1 = itemHeld[0][itemprop.item];
					input2 = inventory[i][itemprop.item];
					result = craft_item(input1, input2);
					input1 = itemHeld[0][itemprop.name];
					input2 = inventory[i][itemprop.name];
					
					// If result was a new item
					if (result[0][0] != -1){
						
						// Remove the two old items
						for (var j = 0; j < inventorySlots; j++){
							
							// Remove whatever was held from inventory
							if (inventory[j][itemprop.item] == itemHeld[0][itemprop.item]){
								inventory[j][itemprop.item] = -1;
								inventory[j][itemprop.sprite] = -1;
								inventory[j][itemprop.name] = -1;
							}
							
							// Remove the second component
							if (inventory[j][itemprop.item] == inventory[i][itemprop.item]){
								inventory[j][itemprop.item] = -1;
								inventory[j][itemprop.sprite] = -1;
								inventory[j][itemprop.name] = -1;
							}
						}
						
						// Add the new item
						for (var j = 0; j < inventorySlots; j++){
							if (inventory[j][itemprop.item] == -1){
								inventory[j][itemprop.item] = result[0][itemprop.item];
								inventory[j][itemprop.sprite] = result[0][itemprop.sprite];
								inventory[j][itemprop.name] = result[0][itemprop.name];
								break;
							}
						}
						
						// No longer holding an item
						itemHeld[0][itemprop.item] = -1;
						itemHeld[0][itemprop.sprite] = -1;
						itemHeld[0][itemprop.name] = -1;
						textbox.text = "I used the "+input1+" on the "+input2+ " and made a "+result[0][itemprop.name]+".";
						
					}
					
					// If result was not a valid recipe.
					else{
						textbox.text = "Nothing happens.";
					}
				}
					
				// You're no longer trying to use the item after clicking
				itemHeld[0][itemprop.item] = -1;
				itemHeld[0][itemprop.sprite] = -1;
				itemHeld[0][itemprop.name] = -1;
			}
				
		}
	}
		
	// Increment x-position to loop through to the next cell
	xx += gridSize+spacing;
}