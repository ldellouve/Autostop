model autostopper_normal

global {
//	ajouter les fichier pour construire le graph depuis hitchwiki
	file shape_file_bounds <- file("../includes/bounds.shp");

//	regarder ce que sont les fichier .shp

	int nb_stopper <- 10;

	init {
		// creer la map a partir des données de hitchwiki
		
		
		create stopper number: nb_stopper {
			
		}
	}
}


species stopper {
	string nom;
	
	rgb color <- #yellow  ;
	aspect base {
		draw circle(10) color: color;
	}
	
	// les différents reflexes de l'espèce
}

experiment stopper_simu1 type: gui {
	parameter "Shapefile for the bounds:" var: shape_file_bounds category: "GIS" ;
	output {
		display city_display type:opengl {
			species stopper aspect: base ;
		}
	}
	
}