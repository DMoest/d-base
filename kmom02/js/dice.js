/**
 * Module containing class in Node.js
 * -------------------------
 * Dice.js
 *
 * -------------------------
 * Kmom02 - Databasteknologier för webben
 * @author Daniel Andersson
 * -------------------------
 */
"use strict";

class Dice {
    /**
     * @constructor
     */
    constructor() {
        this.dice = null;
    }

    /**
     * Roll the dice and remember the value outcome.
     * @param {integer}
     * @returns {integer}
     */
    roll(faces=6) {
        this.dice = Math.floor(Math.random() * faces + 1);
        return this.dice;
    }

    /**
     * Get the value of the last rolled dice.
     * @returns {integer}
     */
    lastRoll() {
        return this.dice;
    }

    /**
     * When someone is printing this object, what should it look like?
     * @returns {string}
     */
    toString() {
        return this.dice;
    }
}

module.exports = Dice;
