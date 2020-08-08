/**
 * Express.js övning från föreläsning med Kenneth.
 * -------------------------
 * DV1606 - Databasteknologier för webben
 * Kmom04 - Express.js
 * @author Daniel Andersson, DAAP19
 * -------------------------
 * Module: index.js
 */

"use strict";

const port = 1337; // Vi behöver en port, den sparas i en konstant.
const express = require("express"); // Vi behöver tillgång till Express.
const app = express(); // Vi kör Express genom konstanten app.
const indexRoutes = require("./routes/index.js"); // import av module för "routes" routes/index.js
const path = require("path"); // Sökvägen.

app.use(express.static(path.join(__dirname, "public"))); // Vi använder Express, vi använder en static metod där vi anger med en sökväg med mapnamnet och sökväg.

// Middle wear ?
app.use((req, res, next) => { // next är en pekare som har koll på nästa steg.
    console.info(`Got a request on: ${req.path} (${req.method})`);
    next();
});

app.get("/", (req, res) => {
    res.send("Hello! ...det här är root-routen.");
});

app.use("/", indexRoutes); 

// app.get("/about", (req, res) => {
//     res.send("About-route");
// });

app.listen(port, () => { // Lyssnar på port 1337.
    console.log("Server listening to port: " + port);
});
 