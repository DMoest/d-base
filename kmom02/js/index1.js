/**
* JavaScript och Node.js med async och await
* part.1 - Läs en fil och skriv ut
* -------------------------
* Kmom02 - Databasteknologier för webben
* @author Daniel Andersson
* -------------------------
*/

"use strict";

const fs = require("fs");
const path = "file.txt";

console.info("1) Program is starting up!");

fs.readFile(path, "utf-8", (err, data) => {
    console.info(data);
});

console.info("3) End of the Program!");
