/**
* JavaScript och Node.js med async och await
* part.2 - Läsa filen synkront
* -------------------------
* Kmom02 - Databasteknologier för webben
* @author Daniel Andersson
* -------------------------
*/

"use strict";

const fs = require("fs");
const path = "file.txt";
let data;

console.info("1) Program is starting!");

data = fs.readFileSync(path, "utf-8");
console.info(data);

console.info("3) End the program!");
