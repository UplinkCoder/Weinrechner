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
		string formdatajson_str;
		formdatajson_str ~= "[{"; 
		foreach (string key,string value;req.form) {
			formdatajson_str ~= '"'~key~'"'~':'~'"'~value~'"'~','; // FIXME , at the end
		}
		formdatajson_str ~= "}]";
		//string  formdatajson_str = "[" ~ req.form.serializeToJson.to!string ~ "]";
		if (str_wines_json != "") {  
			str_wines_json = (parseJson(str_wines_json) ~ parseJsonString(formdatajson_str)).to!string;
		} else {
			str_wines_json = parseJson(formdatajson_str).to!string;
		}

		buffer = cast(ubyte[]) str_wines_json;
		std.file.write("wines.json",buffer);

	}

	res.redirect("/tabelle.html");
}

void getTableHandler_js(HTTPServerRequest req,
                        HTTPServerResponse res)
{	static immutable ubyte[] tableHandler = cast(immutable ubyte[]) import("TableHandler.js");
	res.writeBody(tableHandler,"text/javascript");
}
