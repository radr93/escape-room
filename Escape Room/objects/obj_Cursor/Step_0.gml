/// @description Update cursor position/sprite, draw tooltips and handle interaction

// Update cursor position
x = mouse_x;
y = mouse_y;

// If hovering over an object or arrow
if (position_meeting(mouse_x, mouse_y, obj_ObjectParent) or position_meeting(mouse_x, mouse_y, obj_ArrowParent)){
	
	// Figure out which item is directly under mouse
	var inv = obj_Inventory;														// Shorthand reference for the inventory object
	var list = ds_list_create();													// Create an empty list
	instance_position_list(mouse_x, mouse_y, obj_InteractableParent, list, true);	// Add instances to list and sort by depth
	var hoverObject = list[| 0];													// Store the top object in a variable
	ds_list_destroy(list);															// Destroy the list to free memory
	
	// If hovering over an object
	if (object_get_parent(hoverObject.object_index) == obj_ObjectParent){
		
		#region Update Cursor
		// Change cursor to inspect for most items, and grab for "takeable" items only
		cursor_index = cursor.inspect;		
		if (hoverObject.type == objType.takeItem){
			cursor_index = cursor.grab;
		}
		#endregion
		
		#region Draw Tooltip
		// Draw a tooltip for the object
		if (!instance_exists(obj_Tooltip)){
			var tooltip = instance_create_layer(mouse_x, mouse_y, "Controllers", obj_Tooltip);	// Create a tooltip instance
			
			// If not currently using an item 
			if (inv.itemHeld[0][0] == -1){
				
				// If item hovered is takeable
				if (hoverObject.type == objType.takeItem){
					
					// Draw a tooltip that shows "Take x" where x = object's name
					tooltip.text = "Take "+hoverObject.name;
				}
				
				// For all other items
				else{
					
					// Draw a tooltip that shows "Search x" where x = object's name
					tooltip.text = "Search "+hoverObject.name;
				}
			}
			
			// If currently using an item
			else{
				tooltip.text = "Use "+inv.itemHeld[0][itemprop.name]+" on "+hoverObject.name;
			}
		}
		#endregion
		
		#region Handle Click Interaction
		
		// If clicking on an object
		var click = mouse_check_button_pressed(mb_left);
		if (click){
			
			#region Create Textbox and decide what happens
			
			// Create a textbox for feedback
			if (!instance_exists(obj_Textbox)){
				var textbox = instance_create_layer(mouse_x, mouse_y, "Controllers", obj_Textbox);
				
				#region If using an item
				
				if (inv.itemHeld[0][0] != -1){
					
					#region Basic Items
					// If object is basic
					if (hoverObject.type == objType.basic){
					
						// Nothing happens, no longer using an item
						textbox.text = "Nothing happens.";
						inv.itemHeld[0][itemprop.item] = -1;
						inv.itemHeld[0][itemprop.sprite] = -1;
						inv.itemHeld[0][itemprop.name] = -1;
					}
					#endregion
					
					#region If object changes with condition
					
					// If object changes with condition
					if (hoverObject.type == objType.changeWithCondition){
						if (!hoverObject.conditionMet){
							textbox.text = hoverObject.description2;
						}
						else{
							textbox.text = hoverObject.description;
						}
					}
					
					#endregion
					
					#region If object changes with item
					
					// If object changes with item
					if (hoverObject.type == objType.changeWithItem){
						
						#region Kill self with paperclip
						
						// If using paperclip
						if (inv.itemHeld[0][itemprop.item] == itemid.paperclip){
							
							// On outlet
							if (hoverObject.name == "Outlet"){
								textbox.text = "I use the paperclip on the outlet like an idiot, shock myself and DIE...";
								textbox.doom = true;
								exit;
							}
							
						}
						
						#endregion
						
						if (inv.itemHeld[0][itemprop.item] == hoverObject.conditionItem[0][itemprop.item]){
							
							// Update text box with success
							textbox.text = hoverObject.description3;
							hoverObject.conditionMet = true;
							
							// If item is to be removed, clear it from inventory
							if (hoverObject.destroyConditionItem){
								for (var j = 0; j < inv.inventorySlots; j++){
									if (inv.inventory[j][itemprop.name] == inv.itemHeld[0][itemprop.name]){
										inv.inventory[j][itemprop.item] = -1;
										inv.inventory[j][itemprop.sprite] = -1;
										inv.inventory[j][itemprop.name] = -1;
									}
								}
							}
							
							// Clear held item
							inv.itemHeld[0][itemprop.item] = -1;
							inv.itemHeld[0][itemprop.sprite] = -1;
							inv.itemHeld[0][itemprop.name] = -1;
							
							// STUPID SPECIAL CONDITION I SHOULDNT HAVE DONE FOR THE LAST DOORS
							if (hoverObject.name == "Heavy Door" or hoverObject.name == "Outlet"){
								textbox.destination = hoverObject.destination;
							}
							
						}
						
						// Nothing happens, no longer using an item
						else{
							textbox.text = "Nothing happens.";
							inv.itemHeld[0][itemprop.item] = -1;
							inv.itemHeld[0][itemprop.sprite] = -1;
							inv.itemHeld[0][itemprop.name] = -1;
						}
					}
					#endregion
											
					#region Takeable Items
					// If object is takeItem
					if (hoverObject.type == objType.takeItem){
					
						// Nothing happens, no longer using an item
						textbox.text = "Nothing happens.";
						inv.itemHeld[0][itemprop.item] = -1;
						inv.itemHeld[0][itemprop.sprite] = -1;
						inv.itemHeld[0][itemprop.name] = -1;
					}
					#endregion
					
					#region Hidden Takeable Items
					// If object is takeItemHidden
					if (hoverObject.type == objType.takeItemHidden){
						// Nothing happens, no longer using an item
						textbox.text = "Nothing happens.";
						inv.itemHeld[0][itemprop.item] = -1;
						inv.itemHeld[0][itemprop.sprite] = -1;
						inv.itemHeld[0][itemprop.name] = -1;
					}
					#endregion
				
					#region Objects that Change Rooms
					
					// If object is roomChange
					if (hoverObject.type == objType.roomChange){
					
						// Nothing happens, no longer using an item
						textbox.text = "Nothing happens.";
						inv.itemHeld[0][itemprop.item] = -1;
						inv.itemHeld[0][itemprop.sprite] = -1;
						inv.itemHeld[0][itemprop.name] = -1;
					}
					#endregion
				
					#region Items that need something used on them
					
					// If object is usable
					if (hoverObject.type == objType.usable){
					
						// Check to see if the held item is the item required to use on the hover item
						if (inv.itemHeld[0][itemprop.item] == hoverObject.conditionItem[0][itemprop.item]){
							
							// If it was, give success message
							textbox.text = hoverObject.description3;
							
							// Loop through the to remove the condition item
							if (hoverObject.destroyConditionItem){
								for (var i = 0; i < inv.inventorySlots; i++){
									if (inv.inventory[i][itemprop.name] == inv.itemHeld[0][itemprop.name]){
						
										inv.inventory[i][itemprop.item] = -1;
										inv.inventory[i][itemprop.sprite] = -1;
										inv.inventory[i][itemprop.name] = -1;
									}
								}
							}
							
							// Loop through the inventory
							for (var i = 0; i < inv.inventorySlots; i++){
								if (inv.inventory[i][0] == -1){
						
									// Free up held item and add the resulting item to the first free space
									inv.itemHeld[0][itemprop.item] = -1;
									inv.itemHeld[0][itemprop.sprite] = -1;
									inv.itemHeld[0][itemprop.name] = -1;
									inv.inventory[i][itemprop.item] = hoverObject.item[0][itemprop.item];
									inv.inventory[i][itemprop.sprite] = hoverObject.item[0][itemprop.sprite];
									inv.inventory[i][itemprop.name] = hoverObject.item[0][itemprop.name];
						
									// Mark item as taken so it doesn't re-appear
									with (hoverObject){
										conditionMet = true;
									}
									break;
								}
							}
						}
						
						// If the held item was not required to use on the hover item
						else{
							
							// Nothing happens, no longer using an item
							textbox.text = "Nothing happens.";
							inv.itemHeld[0][itemprop.item] = -1;
							inv.itemHeld[0][itemprop.sprite] = -1;
							inv.itemHeld[0][itemprop.name] = -1;
							
						}
					}
					#endregion
				}
				
				#endregion
				
				#region If not using an item
				
				else{
					
					#region Basic Items
					// If object is basic
					if (hoverObject.type == objType.basic){
						textbox.text = hoverObject.description;
					}
					#endregion
					
					#region If object changes with condition
					
					// If object changes with condition
					if (hoverObject.type == objType.changeWithCondition){
						if (!hoverObject.conditionMet){
							textbox.text = hoverObject.description2;
						}
						else{
							textbox.text = hoverObject.description;
						}
					}
					#endregion
					
					#region If object changes with item
					
					// If object changes with item
					if (hoverObject.type == objType.changeWithItem){
						if (!hoverObject.conditionMet){
							textbox.text = hoverObject.description2;
						}
						else{
							textbox.text = hoverObject.description;
						}
					}
					#endregion
					
					#region Takeable Items
					// If object is takeItem
					if (hoverObject.type == objType.takeItem){
						textbox.text = hoverObject.description;
						
						// Loop through the inventory
						for (var i = 0; i < inv.inventorySlots; i++){
							if (inv.inventory[i][0] == -1){
						
								// Add the item to the first free space
								inv.inventory[i][itemprop.item] = hoverObject.item[0][itemprop.item];
								inv.inventory[i][itemprop.sprite] = hoverObject.item[0][itemprop.sprite];
								inv.inventory[i][itemprop.name] = hoverObject.item[0][itemprop.name];
						
								// Mark item as taken so it doesn't re-appear
								with (hoverObject){
									conditionMet = true;
								}
								break;
							}
						}
					}
					#endregion
					
					#region Hidden Takeable Items
					// If object is takeItemHidden
					if (hoverObject.type == objType.takeItemHidden){
							textbox.text = hoverObject.description2;
						
						// Loop through the inventory
						for (var i = 0; i < inv.inventorySlots; i++){
							if (inv.inventory[i][0] == -1){
						
								// Add the item to the first free space
								inv.inventory[i][itemprop.item] = hoverObject.item[0][itemprop.item];
								inv.inventory[i][itemprop.sprite] = hoverObject.item[0][itemprop.sprite];
								inv.inventory[i][itemprop.name] = hoverObject.item[0][itemprop.name];
						
								// Mark item as taken so it doesn't re-appear
								with (hoverObject){
									conditionMet = true;
								}
								break;
							}
						}
					}
					#endregion
					
					#region Objects that Change Rooms
					// If object is roomChange
					if (hoverObject.type == objType.roomChange){
					
						// Go to destination
						textbox.text = hoverObject.description;
						textbox.destination = hoverObject.destination					
					}
					#endregion
									
					#region Items that need something used on them
					// If object is usable
					if (hoverObject.type == objType.usable){
						textbox.text = hoverObject.description2;
					}
					#endregion
				}
				#endregion
			}
			#endregion
		}
		#endregion
	}
	
	// If hovering over an arrow
	else if (object_get_parent(hoverObject.object_index) == obj_ArrowParent){
		
		// Set the cursor to grab
		cursor_index = cursor.grab;
	}
}

// If not hovering over anything
else{
	
	// Set the cursor to point
	cursor_index = cursor.point;
}