/// @description Draw Inventory

// Set up local variables
var xx, yy, gridSize, spacing;
xx = 168;			// Left side of where to draw the inventory
yy = 2;		// Top side of where to draw the inventory
gridSize = 12;	// Size of each inventory cell
spacing = 2;	// Spacing between inventory cells

// Draw Inventory
	
// Loop through inventory array
for (var i = 0; i < inventorySlots; i++){
	
	// Choose Cell Backdrop Color
	
	// If using the item that is currently being looped through (and actually using an item)
	if (inventory[i][itemprop.name] == itemHeld[0][itemprop.name] and itemHeld[0][0] != -1){
		draw_set_color(c_red)			// Make it a red cell backdrop
	};
	else{								// Otherwise if you're not using the item being looped through
		draw_set_alpha(0.4);			// Tint the cell to make it see-through
		draw_set_color(c_black);			// Make it a black cell backdrop
	}
		
	// Draw cell backdrops
	draw_rectangle(xx, yy, xx+gridSize, yy+gridSize, false);	// Draw the backdrop
	draw_set_alpha(1);											// Make sure drawing solid if was transparent
	draw_set_color(c_silver);									// Set the border color
	draw_rectangle(xx, yy, xx+gridSize, yy+gridSize, true);		// Draw the border
		
	// Draw glow effect upon mouse hover
	if (mouse_x >= xx and mouse_x < xx+gridSize+(spacing*(i-1)) and mouse_y >= yy and mouse_y < yy+gridSize+spacing){
		draw_set_alpha(0.35);									// Tint to make transparent
		draw_set_color(c_white);								// Set the glow color
		draw_rectangle(xx, yy, xx+gridSize, yy+gridSize, false);// Draw the glow
		draw_set_alpha(1);										// Reset transparency
	}
		
	// Draw the actual items in the inventory slots
	if (inventory[i][itemprop.sprite] != -1){
		draw_sprite_ext(inventory[i][itemprop.sprite], 0, xx, yy, 0.75, 0.75, 0, c_white, 1);
	}
		
	// Increment x-position to draw the next cell
	xx += gridSize+spacing;
}