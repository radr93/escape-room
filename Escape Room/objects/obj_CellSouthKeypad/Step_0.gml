/// @description Handle player input

// Set up local variables
var keypadX, keypadY, keySize, hSpacing, vSpacing;
keypadX = 96;	// Left side keypad
keypadY = 64;	// Top side keypad
keySize = 16;	// Size of each key
hSpacing = 8*3;	// Horizontal spacing between keys cells
vSpacing = 3;	// Vertical spacing between keys cells

// Handle player input

// Loop through keys
for (var i = 0; i < numberOfKeys; i++){
	
	// Choose Cell Hover Color
	
	// If hovering over a key
	if (mouse_x >= keypadX and mouse_x < keypadX+keySize and mouse_y >= keypadY and mouse_y < keypadY+keySize){
		
		// If you click on that key
		var click = mouse_check_button_pressed(mb_left);
		if (click){
			
			// If the batteries have been added to the machine
			if (global.FourBatteriesAdded){
				entries +=1;
				switch(entries){
					case 1:
						key1 = string(i+1);
						break;
					case 2:
						key2 = string(i+1);
						break;
					case 3:
						key3 = string(i+1);
						break;
					case 4:
						key4 = string(i+1);
						break;
				}
			
				password = key1+key2+key3+key4;
			
				// If all 4 digits have been entered
				if (key4 != "-"){
				
					// If the password was correct
					if (password == correctCode){
					
						// Create a textbox to tell the player
						var textbox = instance_create_layer(mouse_x, mouse_y, "Controllers", obj_Textbox);
						textbox.text = "Yes, I got it! There was a key in the safe!";
						textbox.destination = rm_CellSouth;
						global.CellSouthSafeOpen = true;
					
						// Loop through inventory and add key
						var inv = obj_Inventory;
						for (var j = 0; j < inv.inventorySlots; j++){
							if (inv.inventory[j][itemprop.item] == -1){
								inv.inventory[j][itemprop.item] = itemid.safeKey;
								inv.inventory[j][itemprop.sprite] = spr_SafeKey;
								inv.inventory[j][itemprop.name] = "Heavy Key";
								break;
							}
						}
					
					}
				
					// If the password was incorrect
					else{
					
						// Create a textbox to tell the player
						var textbox = instance_create_layer(mouse_x, mouse_y, "Controllers", obj_Textbox);
						textbox.text = "Damn it! Wrong code...";
					
						// Reset passcode
						key1 = "-";
						key2 = "-";
						key3 = "-";
						key4 = "-";
						password = key1+key2+key3+key4;
						entries = 0;
					}
				}
			}
			else{
				if (!instance_exists(obj_Textbox)){
		
					var textbox = instance_create_layer(mouse_x, mouse_y, "Controllers", obj_Textbox);
					textbox.text = "The keys aren't working right now - I need to find some batteries.";
				}
			}
		}
	}		
	
	// Increment x-position to draw the next cell
	keypadX += hSpacing;
	if (i == 2){
		keypadX = 96;
		keypadY += keySize+vSpacing;
	}
	if (i == 5){
		keypadX = 96;
		keypadY += keySize+vSpacing;
	}
}

// If batteries have not been added yet
