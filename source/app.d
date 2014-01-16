module source.app;

import vibe.d;
import source.wine:Wine;

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
	res.render!("tabelle.td",wines);
}
shared static this()
{
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
