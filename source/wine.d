module source.wine;

struct wine {
	string name;
	int menge;
	string qualitaet;
	string einstufung;
	@disable this();
	this(string nme,int mng,string quali,string einstf) {
	name=nme;
	menge=mng;
	qualitaet=quali;
	einstufung = einstf;
	}
}
enum QualitätEnum:string {
		Qualitätswein="QW",
		Spätlese="SL", 
		Auslese="AL",
		Beerenauslese="BA",
		Kabinett="KA",
		Eiswein="EW",
		Trockenbeerenauslese="TA",
		Riesling_Hochgewächs="RH"
	}
enum EinstufungEnum:string {
		Qualitätswein="QW",
		Landwein="LW",
		Deutscher_Wein="DW",
		Grundwein="GW",
		///////////////////
		Erntemenge="EM", 
		Destilationsmenge="DM"
	}