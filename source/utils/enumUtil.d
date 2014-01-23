module utils.enumUtil;
import std.traits,std.typecons,std.array;
string selfNameing_Enum(Enum)(string name = "_"~__traits(identifier,Enum))
	if (is(Enum == enum))//TODO add more template contraints  
{ 
	static immutable members = __traits(derivedMembers,Enum);
	auto result = Appender!string(cast(char[])"enum " ~ name ~ " {\n");
		foreach (member;members[0 .. $-1]) {
			result~=member~"=\""~member~"\",\n";
		}
	result~=members[$-1]~"=\""~members[$-1]~"\"\n";
	result ~= "}";
	return cast(string)result.data;
}
string EnumToAA(Enum)(string Name = "AA_"~__traits(identifier,Enum)) 
	if (is(Enum == enum))
{	static immutable members = [__traits(derivedMembers,Enum)];
	auto result = Appender!string(cast(char[])"[");
	enum ident = mixin("\""~__traits(identifier,Enum)~"\"");
	foreach (member;members) {
		//result ~= __traits(getMember,Enum,member);



		result ~= member~":"~","~"\n";
	}
	result~=members[$-1]~":\""~"\"\n]";
	return cast(string)result.data;
}
