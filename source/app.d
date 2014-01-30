module source.app;

import vibe.d;
import std.utf;
import json_db;
import wine;
import utils.enumUtil;
import FormCreator;

void handleRequest(HTTPServerRequest req,
                   HTTPServerResponse res)
{
	res.writeBody("Hello, World!", "text/plain");
}
void showTable (HTTPServerRequest req,
                 HTTPServerResponse res)
{
	// OpenDataBase
	// fetch all wines
	// put it into an array
	Wine[] wines;

	enum InputForm = PodToForm!(Wine);
	res.stringIncludeRender!("tabelle.td",FieldNames,wines,InputForm);
}
shared static this()
{
	setLogLevel(LogLevel.info);
	auto settings = new HTTPServerSettings;
	settings.port = 8080;
	auto router = new URLRouter;
	router.get("/", (req,res){return res.redirect("/index.html");});
	router.get("/tabelle.html",&showTable);
	router.get("/index.html",
		(req,res){return res.redirect("/tabelle.html");});
	router.get("/dyn/wine.json",&getJson);
	

	listenHTTP(settings, router);
}
