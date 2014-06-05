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
	enum InputForm = PodToForm!(Wine);
	logDebug(InputForm);
	res.render!("tabelle.td",FieldNames,InputForm);
}
shared static this()
{
	setLogLevel(LogLevel.verbose4);
	auto settings = new HTTPServerSettings;

	auto fsettings = new HTTPFileServerSettings;
	fsettings.serverPathPrefix = "/static";

	settings.port = 8080;
	auto router = new URLRouter;
	router.get("/", (req,res){return res.redirect("/index.html");});
	router.get("/tabelle.html",&showTable);
	router.get("/index.html",
		(req,res){return res.redirect("/tabelle.html");});
	router.get("/wines.json",&getJson);
	router.get("/static/TableHandler.js",&getTableHandler_js);
	router.post("/tabelle.html",&putJson);

	listenHTTP(settings, router);
}
