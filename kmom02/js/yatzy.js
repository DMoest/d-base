/**
 * Importing module with class Dice in Node.js
 * -------------------------
 * Yatzy.js - A simple program that throw 5 dices and prints a string from the values.
 * It use the class Dice from the module dice, and its methods defined in that class.
 * -------------------------
 * Kmom02 - Databasteknologier för webben
 * @author Daniel Andersson
 * -------------------------
 */
"use strict";

let Dice = require("./dice.js");
let hand = []; // Prepare a dice hand to hold the dices.

for (let i=0; i<5; i++) {
    hand[i] = new Dice();
    hand[i].roll();
}

console.info("Here are the dices you have rolled.");
console.info(hand); // Prints the whole datastructure.
// Join the elements and print out as a string.
console.info(hand.join());
