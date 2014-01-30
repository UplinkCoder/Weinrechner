// TODO : FormRep
//FormRep getForm(string name,FormFields formFields) {
// TODO impl
//}
enum InputTypes {
	SelectList,
	TextField // TODO add much more types :D
	};
import std.typecons;
import vibe.d;

auto PodToForm(Pod,string sep = "td ",string indent="\t")() if (__traits(isPOD,Pod)) {
	enum PodTuple = Pod.init.tupleof;

	string result;

	foreach (i,t_member;PodTuple)
	{	
		static if (is(typeof(t_member):double)||
			  (is(typeof(t_member)==string)) )
		{
			string Name = __traits(identifier,Pod.tupleof[i]);
			result ~= sep~"\n"~indent~"input#"~Name~"(name='"~Name~"', type='text')\n";
		}

		else

			static if (is(typeof(t_member)==enum)) 
		{
			result ~= EnumToSelect!(typeof(t_member),sep,indent);
		}
	}
	return result;
}

auto EnumToSelect(Enum,string sep ="td ",string indent="\t")(string Name = __traits(identifier,Enum)) if (is(Enum==enum)) {
	auto select_string = sep~"\n"~indent~"select#"~Name~"(name=\""~Name~"\")\n";
	foreach (i,Item;__traits(allMembers,Enum)) {
		if (Item == "__sep__")
			select_string ~= indent~indent~"(disabled='option(disabled='disabled') ------------"~"\n";
		else
			select_string ~= indent~indent~"option(value='"~__traits(getMember,Enum,Item)~"') "~Item~"\n";
	}
	return select_string;
}
auto FieldToInput(Field,string indent="\t")()
	if (is(Field==string)||is(Field==int)||is(Field==double))

{	string Name = __traits(identifier,Field.tupleof[1]);
	auto form_string = indent~"input #"~Name~"(name='"~Name~"', type='text')";
	return form_string;
}
