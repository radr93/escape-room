// Define room destinations

destination = undefined;

switch (room){
	
	// Cell
	case rm_CellNorth:
		destination = rm_CellSouth;
		break;
	
	case rm_CellEast:
		destination = rm_CellWest;
		break;
		
	case rm_CellSouth:
		destination = rm_CellNorth;
		break;
		
	case rm_CellWest:
		destination = rm_CellEast;
		break;
		
	case rm_CellPhotograph:
		destination = rm_CellNorth;
		break;
		
	case rm_CellNotebook:
		destination = rm_CellWest;
		break;
		
	case rm_CellPosterTear:
		destination = rm_CellNorth;
		break;
		
	case rm_CellComputerScreen:
		destination = rm_CellWest;
		break;
		
	case rm_CellBathroom:
		destination = rm_CellEast;
		break;
		
	case rm_CellCloset:
		destination = rm_CellEast;
		break;
		
	case rm_CellSouthSafe:
		destination = rm_CellSouth;
		break;
		
	case rm_CellWestTorture:
		destination = rm_CellWest;
		break;
}