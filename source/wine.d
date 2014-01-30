
import utils.enumUtil:selfNameing_Enum;



immutable static string[] FieldNames = [__traits(allMembers,Wine)];

enum EinstufungEnum {
	Qualitätswein="QW",
	Landwein="LW",
	Deutscher_Wein="DW",
	Grundwein="GW",
	__sep__="",
	Erntemenge="EM",
	Destilationsmenge="DM"
	} 


enum QualitätEnum {
	Qualitätswein="QE",
	Spätlese="SL", 
	Auslese="AL",
	Beerenauslese="BA",
	Kabinett="KA",
	Eiswein="EW",
	Trockenbeerenauslese="TA",
	Riesling_Hochgewächs="RH"
}

struct Wine {

public:
	string Name;
	double Menge;
	string Sorte;
	QualitätEnum Qualität;
	EinstufungEnum Einstufung;
	int Tank;
}
private: 
struct enums {
	private:

}