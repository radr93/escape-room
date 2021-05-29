/// @description Draw self, code and hover color

// Draw Self
draw_self();

// Set up local variables
var keypadX, keypadY, keySize, hSpacing, vSpacing, textX, textY;
keypadX = 96;	// Left side keypad
keypadY = 64;	// Top side keypad
keySize = 16;	// Size of each key
hSpacing = 8*3;	// Horizontal spacing between keys cells
vSpacing = 3;	// Vertical spacing between keys cells
textX = 128;	// Left side of text (centered)
textY = 36;		// Top side of text (centered)

// Draw key hover and text
	
// Loop through keys
for (var i = 0; i < numberOfKeys; i++){
	
	// Choose Cell Hover Color
	
	// Draw glow effect upon mouse hover
	if (mouse_x >= keypadX and mouse_x < keypadX+keySize and mouse_y >= keypadY and mouse_y < keypadY+keySize){
		draw_set_alpha(0.35);									// Tint to make transparent
		draw_set_color(c_green);								// Set the glow color
		draw_rectangle(keypadX, keypadY, keypadX+keySize, keypadY+keySize, false);// Draw the glow
		draw_set_alpha(1);										// Reset transparency
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
	
	if (global.FourBatteriesAdded){
		// Set font and alignment
		draw_set_font(fnt_Textbox);
		draw_set_color(c_black);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
	
		// Draw the passcode
		draw_text(textX, textY, password);
	
	
		// Reset Alignment
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
	}
}