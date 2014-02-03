
import utils.enumUtil:selfNameing_Enum;



immutable static string[] FieldNames = [__traits(allMembers,Wine)];

enum EinstufungEnum {
	Qualitätswein="Qualitätswein",
	Landwein="Landwein",
	Deutscher_Wein="Deutscher Wein",
	Grundwein="Grundwein",
	/*
	Erntemenge="Erntemenge",
	Destilationsmenge="Destilationsmenge"
	*/
	}


enum QualitaetEnum {
	Qualitätswein="Qualitätswein",
	Spätlese="Spätlese", 
	Auslese="Auslese",
	Beerenauslese="Beerenauslese",
	Kabinett="Kabinett",
	Eiswein="Eiswein",
	Trockenbeerenauslese="Trockenbeerenauslese",
	Riesling_Hochgewächs="Riesling Hochgewächs"
}

struct Wine {

public:
	string Name;
	double Menge;
	string Sorte;
	QualitaetEnum Qualität;
	EinstufungEnum Einstufung;
	int Tank;
}