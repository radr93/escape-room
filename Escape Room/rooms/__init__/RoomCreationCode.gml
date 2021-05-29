// Launch Game

// Remove default OS cursor
window_set_cursor(cr_none);

// Create controllers
instance_create_layer(0, 0, "Controllers", obj_Global);
instance_create_layer(0, 0, "Controllers", obj_Cursor);
instance_create_layer(0, 64, "Controllers", obj_MoveLeft);
instance_create_layer(240, 64, "Controllers", obj_MoveRight);
instance_create_layer(120, 128, "Controllers", obj_MoveBack);
instance_create_layer(0, 0, "Controllers", obj_Inventory);

// Start the game
room_goto_next();