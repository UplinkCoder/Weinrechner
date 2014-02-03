import vibe.d;
import std.file;
import std.json;
import wine;

void getJson(HTTPServerRequest req,
			HTTPServerResponse res)
{ 
	if (vibe.core.file.existsFile("wines.json")) {
		void[] buffer = std.file.read("wines.json");
		res.writeBody(cast(ubyte[])buffer,"application/json");
	} else vibe.core.file.openFile("wines.json",FileMode.append),res.writeJsonBody("");
	
}

void putJson(HTTPServerRequest req,
             HTTPServerResponse res)
{	
	if (vibe.core.file.existsFile("wines.json"))  {
		void[] buffer = std.file.read("wines.json");
		string str_wines_json = buffer.to!string;
		string  formdatajson_str = "[" ~ req.form.serializeToJson.to!string ~ "]";
		auto json = parseJson(str_wines_json) ~ parseJsonString(formdatajson_str);
		logDebug(parseJsonString(formdatajson_str).to!string);
		buffer = cast(ubyte[]) to!string(json);
		std.file.write("wines.json",buffer);

	}

	res.redirect("/tabelle.html");
}