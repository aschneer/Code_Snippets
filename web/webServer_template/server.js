var express = require("express");
var app = express();

// Set the port for the server to
// listen on.
app.set("port", (process.env.PORT || 5000));
// Point node.js to a public folder
// containing additional scripts and
// files.
app.use(express.static(__dirname + "/public"));
// Set the view engine.
app.set("view engine", "ejs");

// Handle POST requests to "/sendLocation".
// Respond with...
app.post("/sendLocation",function(req,res){
	res.status(200);
	res.send();

});
// Handle GET requests to "/location.json".
// Respond with...
app.get("/location.json",function(req,res){
	res.status(200);
	res.send();

});
// Handle GET requests to "/".
// Display an HTML page with a
// running list of calls to this API.
app.get("/",function(req,res){
	res.status(200);
	res.render("log");
});

// Listen for HTTP requests.
app.listen(app.get("port"));