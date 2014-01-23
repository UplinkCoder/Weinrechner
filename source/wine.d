
import utils.enumUtil:selfNameing_Enum;


mixin(selfNameing_Enum!(wine.enums._QualitätEnum)("QualitätEnum"));
mixin(selfNameing_Enum!(wine.enums._EinstufungEnum)("EinstufungEnum"));
immutable static string[] FieldNames = [__traits(allMembers,Wine)];

struct Wine {
;

	import utils.enumUtil:selfNameing_Enum;
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
enum _QualitätEnum {
	Qualitätswein,
		Spätlese, 
		Auslese,
		Beerenauslese,
		Kabinett,
		Eiswein,
		Trockenbeerenauslese,
		Riesling_Hochgewächs
}
enum _EinstufungEnum {
	Qualitätswein,
	Landwein,
	Deutscher_Wein,
	Grundwein,
	///////////////////
	Erntemenge, 
	Destilationsmenge
	}
}