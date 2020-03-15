/**
 * Fuctions in files with Node.js
 * -------------------------
 * The function stringRange() takes three arguments (a, b, sep).
 * The first two arguments represent a range that the function will count.
 * From first argument to second argument is iterated.
 * The last argument "sep" represents the seperation between characters,
 * it has a default value of ", ".
 * -------------------------
 * Kmom02 - Databasteknologier för webben
 * @author Daniel Andersson
 * -------------------------
 */

"use strict";

function stringRange(a, b, sep=", ") {
    let res = "";
    let i = a;

    // Iterate from a to b.
    while (i < b) {
        res += i + sep;
        i++;
    }

    res = res.substring(0, res.length - sep.length);
    return res;
}

console.info(stringRange(1, 10));
console.info(stringRange(1, 10, "-"));
