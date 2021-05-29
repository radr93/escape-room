// Define room destinations

destination = undefined; 

switch (room){
	
	case rm_CellNorth:
		destination = rm_CellWest;
		break;
	
	case rm_CellEast:
		destination = rm_CellNorth;
		break;
		
	case rm_CellSouth:
		destination = rm_CellEast;
		break;
		
	case rm_CellWest:
		destination = rm_CellSouth;
		break;
		
	case rm_CellPhotograph:
		
		break;
		
	case rm_CellNotebook:
		
		break;
		
	case rm_CellPosterTear:
		
		break;
}