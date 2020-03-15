/**
* JavaScript och Node.js med async och await
* part.3 - Ett löfte om ett resultat, ett promise (synkrona varianten av filläsning).
* -------------------------
* Kmom02 - Databasteknologier för webben
* @author Daniel Andersson
* -------------------------
*/

"use strict";

const fs = require("fs");
const path = "file.txt";
let data;

console.info("1) Program is starting up!");

data = getFileContentSync(path);
console.info(data);

console.info("2) End of the program!");

/**
 * Return the content of the file, synced version which works.
 * @param {string} The path to the file read.
 * @returns {string} The content of the file.
 */
function getFileContentSync(filename) {
    let data;

    data = fs.readFileSync(filename, "utf-8");
    return data;
}
