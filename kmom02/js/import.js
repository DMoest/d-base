/**
 * Import modules in Node.js
 * -------------------------
 * Import.js
 *
 * -------------------------
 * Kmom02 - Databasteknologier för webben
 * @author Daniel Andersson
 * -------------------------
 */

"use strict";

let utils = require("./stringRange1.js");
let res;

res = utils.stringRange(1, 10);
console.info(res);

res = utils.stringRange(1, 10, " - ");
console.info(res);

console.log("\nWhat does the imported 'utils' consists of?");
console.log(utils);
