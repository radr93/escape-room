/// @description Draw Game Cursor

// Draw the cursor
var inv = obj_Inventory;

// If not currently using an item
if (inv.itemHeld[0][0] == -1){
	
	// Draw cursor as normal
	draw_sprite_ext(spr_Cursor, cursor_index, mouse_x, mouse_y, 0.5, 0.5, 0, c_white, 1);
}

// If you are currently using an item
else{
	
	// Draw the item you're using instead of cursor
	draw_sprite_ext(inv.itemHeld[0][itemprop.sprite], 0, mouse_x-4, mouse_y-4, 1, 1, 0, c_white, 1);
}
