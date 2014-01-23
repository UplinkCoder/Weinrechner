module source.app;

import vibe.d;
import std.utf;
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
	wines ~= Wine("Wein1",12.06,"Rebe1",QualitätEnum.Auslese,EinstufungEnum.Qualitätswein);
	wines ~= Wine("Wein2",14.03,"Rebe2",QualitätEnum.Beerenauslese,EinstufungEnum.Landwein);

	auto ff = FormCreator.EnumToSelect!EinstufungEnum;
	res.render!("tabelle.td",wines,FieldNames);
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
	router.get("/frame/eintragen.html",staticTemplate!("eintragen.dt"));


	listenHTTP(settings, router);
}
