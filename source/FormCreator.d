// TODO : FormRep
//FormRep getForm(string name,FormFields formFields) {
// TODO impl
//}
enum InputTypes {
	SelectList,
	TextField // TODO add much more types :D
	};
import std.traits,std.typecons;
import vibe.d;

auto PodToForm(Pod)() if (__traits(isPOD,Pod)) {
	static immutable members = [__traits(derivedMembers,Pod)];
//	auto result;
	foreach (member;members) {
		if (is(member==enum)) {
			auto em = EnumMembers!member;

		}
	}
}
//auto StructFieldToInput(Field)
auto EnumToSelect(Enum)(string Name = __traits(identifier,Enum)) if (is(Enum==enum)) {
	auto form_string = "select(name=\""~Name~"\")\n";
	foreach (i,Item;__traits(allMembers,Enum)) {
		if (Item == "--sep--")
			form_string ~= "\t(disabled='option(disabled='disabled') ------------";
		else
			form_string ~= "\toption(value='"~__traits(getMember,Enum,Item)~"') "~Item~"\n";
	}
	debug import std.stdio;
	debug writeln(form_string);
	return form_string;
}