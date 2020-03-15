/**
* JavaScript och Node.js med async och await
* part.4 - Ett löfte om ett resultat, ett promise (asynkrona varianten av filläsning).
* -------------------------
* Kmom02 - Databasteknologier för webben
* @author Daniel Andersson
* -------------------------
*/

"use strict";

const fs = require("fs");
const util = require("util");
const readFile = util.promisify(fs.readFile);

/**
 * The main function, needed to wrap async await that can not be used
 * on module level.
 * @async
 * @returns void
 */
async function main() {
    const path = "file.txt";
    let data;

    console.info("1) Program is staring up!");

    data = await getFileContentPromise(path);
    console.info(data);

    console.info("3) End of the program!");
}
main();

/**
 * Return the content of the file, using a promosiified variant.
 * @param {string}   The path to the file to read.
 * @returns {string} The content of the file.
 */
async function getFileContentPromise(filename) {
    let data;

    data = await readFile(filename, "utf-8");
    return data;
}
