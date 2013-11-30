module source.Wine;

struct wine {
	string Rebsorte;
	int Menge;
	Qualität qulität;
	Einstufung einstufung;

	enum Qualität:string {
		Qualitätswein="QW",
		Spätlese="SL", 
		Auslese="AL",
		Beerenauslese="BA",
		Kabinett="KA",
		Eiswein="EW",
		Trockenbeerenauslese="TA",
		Riesling_Hochgewächs="RH"
	}
	enum Einstufung:string {
		 Qualitätswein="QW",
		Landwein="LW",
		Deutscher_Wein="DW",
		Grundwein="GW",
		///////////////////
		Erntemenge="EM", 
		Destilationsmenge="DM"
	}
}