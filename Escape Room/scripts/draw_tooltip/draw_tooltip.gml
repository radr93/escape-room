/// @function draw_tooltip(_text);
/// @param {string} The text to draw for the tooltip.


// Draw a tooltip for an item
function draw_tooltip(_text){
	
	// Update position
	var xPos = device_mouse_x_to_gui(0)
	var yPos = device_mouse_y_to_gui(0)
	
	if (mouse_x > (room_width-(room_width/2.65))){
		
		// Set alpha to tint rectangle
		draw_set_alpha(0.75);
	
		// Set font and alignment
		draw_set_font(fnt_Tooltip);
		draw_set_halign(fa_right);
		draw_set_valign(fa_top);
	
		// Draw the tooltip rectangle
		var ww, hh; // The width and height of the rectangle (based on "_text" string size)
		var padding; // The padding between the edges of the rectangle and the text
		padding = 2;
		ww = string_width(_text);
		hh = string_height(_text);
		draw_set_color(c_black);
		draw_rectangle(xPos, yPos, xPos-(ww+(padding*2)), yPos+hh+padding, false);
		draw_set_color(c_white);
		draw_rectangle(xPos, yPos, xPos-(ww+(padding*2)), yPos+hh+padding, true);
	
		// Reset Alpha
		draw_set_alpha(1);
	
		// Draw the tooltip text
		draw_text(xPos-padding, yPos+padding, _text);
	}
	
	else{
		
		// Set alpha to tint rectangle
		draw_set_alpha(0.75);
	
		// Set font and alignment
		draw_set_font(fnt_Tooltip);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		
		// Draw the tooltip rectangle
		var ww, hh; // The width and height of the rectangle (based on "_text" string size)
		var xOffset; // Offset the tooltip to keep the mouse cursor showing
		var padding; // The padding between the edges of the rectangle and the text
	
		ww = string_width(_text);
		hh = string_height(_text);
		xOffset = sprite_get_width(spr_Cursor)*2;
		padding = 1;
		
		draw_set_color(c_black);
		draw_rectangle(xPos+xOffset, yPos, xPos+xOffset+ww+(padding*2), yPos+hh+padding, false);
		draw_set_color(c_white);
		draw_rectangle(xPos+xOffset, yPos, xPos+xOffset+ww+(padding*2), yPos+hh+padding, true);
	
		// Reset Alpha
		draw_set_alpha(1);
	
		// Draw the tooltip text
		draw_text(xPos+xOffset+padding, yPos+padding, _text);
	}

}