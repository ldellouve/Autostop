model autostopper_normal

global {
	int nb_stopper <- 2;
	int nb_automobiliste <- 3;
	int nb_ville <- 5;
	int grid_width <- 10;
	int grid_height <- 10;
	
	init {
		create stopper number: nb_stopper ;
		create automobiliste number: nb_automobiliste ;
		create ville number: nb_ville;
		
		// Création de la carte
		//file shape_file_bounds <- file("../includes/bounds.shp");
		//file positions <- file("../includes/Vegetation.shp");
		}
}


species espece_generique {
	float taille <- 1.0;
	positions pos <- one_of (positions) ;
}

species ville {
	float taille <- 2.0;
	rgb couleur <- #black;
	int villeID <- 1;
	
	aspect base {
		draw circle(taille) color: couleur;
	}
}

species stopper parent: espece_generique {
	rgb couleur <- #blue;
	float taille <- 1.5;
	automobiliste monConducteur <- nil;
	list<automobiliste> possibiliteStopper update: automobiliste inside (pos);
	//automobiliste monConducteur <- automobiliste inside (pos);
	//TODO se deplacer avec l'automobiliste, pour l'instant si jamais il a la meme destination!
	
	reflex accepteTrajet when: (!empty(possibiliteStopper))  {
		monConducteur <- possibiliteStopper[0];
	}
	
	reflex deplace when: (monConducteur != nil) {
		pos <- monConducteur.pos;
		location <- pos.location;
	}
	
	positions choose_cell {
		positions myCell_tmp <- positions(shuffle(pos.neighbours)) ;
		if myCell_tmp != nil {
			return myCell_tmp;
		} else {
			return one_of (pos.neighbours);
		} 
	}
	
	aspect base {
		draw circle(taille) color: couleur;
	}	
}


species automobiliste parent: espece_generique {
	rgb couleur <- #red ;
	bool arrive <- false;
	ville maVilleDestination <- nil;
	list<ville> possibiliteVille update: ville inside (pos);
	
	// quand l'automobiliste arrive sur une ville
	reflex testArrive when: (!empty(possibiliteVille))  {
		// si c'est sa ville de destination il meurt
		if(maVilleDestination.villeID =  possibiliteVille[0].villeID){
			arrive <- true;
		}
	}
	
	//TODO se deplace sur une cellule voisine, en direction de la destination!
	reflex deplace when: (!arrive){
		pos <- choose_cell();
		location <- pos.location;
	}
	

	
	positions choose_cell {
		positions myCell_tmp <- positions(shuffle(pos.neighbours));
		if myCell_tmp != nil {
			return myCell_tmp;
		} else {
			return one_of (pos.neighbours);
		} 
	}
	
	init {
		maVilleDestination <- one_of(ville);
	}
	
	aspect base {
		draw circle(taille) color: couleur;
	}
}


grid positions width: grid_width height: grid_height neighbours: 4 {
	list<positions> neighbours  <- (self neighbours_at 1);
}

experiment stopper_simu1 type: gui {
	parameter "Nombre initial de stopper : " var: nb_stopper  min: 2 max: 1000 category: "Stopper" ;
	parameter "Nombre initial de automobiliste : " var: nb_automobiliste  min: 3 max: 1000 category: "Automobiliste" ;
	parameter "Nombre initial de ville : " var: nb_ville  min: 5 max: 1000 category: "Ville" ;
	parameter "Largeur de la grille : " var: grid_width  min: 10 max: 100 category: "Grille" ;
	parameter "Hauteur de la grille : " var: grid_height  min: 10 max: 100 category: "Grille" ;
	
	output {
		display city_display type:opengl {
			grid positions lines: #black;
			species ville aspect: base;
			species stopper aspect: base;
			species automobiliste aspect: base;
		}
	}
	
}