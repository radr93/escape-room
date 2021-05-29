/// @description Initialize Variables

// Enumerate all different inventory items
enum itemid{
	wrench,
	pulley,
	batteries,
	sawBlade,
	paperclip,
	fishingLine,
	makeshiftHook,
	toolboxKey,
	screwdriver,
	safeKey,
	reciprocatingSawEmpty,
	reciprocatingSawLoaded,
	
	mcguffin,

	MAX
}

// Enumerate all different item properties
enum itemprop{
	item,
	sprite,
	name,
	
	MAX
}

// Decide how many inventory slots you get
inventorySlots = 6;

// Initialize 2D Inventory Array, slot [i] for inventory slot and slot [p] for properties
for (var i = 0; i < inventorySlots; i++){
	for (var p = 0; p < itemprop.MAX; p++){
		inventory[i][p] = -1;
	}
}
	
// Initialize other inventory related variables

itemHeld[0][itemprop.item] = -1;	// The item used's item in them enum
itemHeld[0][itemprop.sprite] = -1;	// The item used's sprite
itemHeld[0][itemprop.name] = -1;	// The item used's name