/// @function draw_textbox(_text);
/// @param {string} The text to draw in the textbox


// Draw a tooltip for an item
function draw_textbox(_text){
		
	// Set alpha to tint rectangle
	draw_set_alpha(0.75);
	
	// Set font and alignment
	draw_set_font(fnt_Textbox);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	// Set tooltip rectangle size and padding
	var ww, hh, padding, textX, textY;
	padding = 6;							// The padding between the edges of the rectangle and the text
	ww = string_width(_text)+(padding*2);	// Width of the "_text" string
	hh = string_height(_text)+(padding*2);	// Height of the "_text" string
	textX = 128*4;
	textY = 128*4-16;
	
	// Draw rectangle backdrop
	draw_set_color(c_black);	// Color of the rectangle backdrop
	draw_rectangle(textX-(ww/2), textY-(hh/2), textX+(ww/2), textY+(hh/2), false);
	
	// Draw rectangle outline
	draw_set_color(c_white);
	draw_rectangle(textX-(ww/2), textY-(hh/2), textX+(ww/2), textY+(hh/2), true);
	
	// Reset alpha
	draw_set_alpha(1);
	
	// Draw the tooltip text
	draw_text(textX, textY, _text);
	
	// Reset alignment
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}