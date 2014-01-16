module source.wine;

struct Wine {
	string name;
	int amount;
	string quality;
	string grouping;
	int tank;
	@disable this();
	this(string nme,int mng,string quali,string einstf) {
	name=nme;
	amount=mng;
	quality=quali;
	grouping = einstf;
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