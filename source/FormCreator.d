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

auto PodToForm(Pod,string sep = "td ",string indent="\t")() 
	if (__traits(isPOD,Pod))
{
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
			string Name = __traits(identifier,Pod.tupleof[i]);
			result ~= sep~"\n"~indent~"select"~"(id=\""~Name~"\", name=\""~Name~"\")\n";
			foreach (Item;__traits(allMembers,typeof(t_member))) {
				if (Item == "__sep__")
					result ~= indent~indent~"(disabled='option(disabled='disabled') ------------"~"\n";
				else
					result ~= indent~indent~"option(value='"~__traits(getMember,t_member,Item)~"') "~Item~"\n";
			}
		}
	}
	return result;
}