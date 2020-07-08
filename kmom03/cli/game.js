/**
 * Gör en kommandoradsklient i Node.js (v2)
 * -------------------------
 * DV1606 - Databasteknologier för webben
 * Kmom03 - ER-Modellering
 * @author Daniel Andersson, DAAP19
 * -------------------------
 * Module: game.js
 */

"use strict";

class Game {
    /**
     * @constructor
     */

    constructor() {
        this.thinking = -1;
    }

    /**
     * Init the game and guess the number.
     * @returns void
     */

    init() {
        this.thinking = Math.round(Math.random() * 100 + 1);
    }

    /**
     * Check if guess is correct or not.
     * @param {integer} guess, the number being guessed.
     * @returns {boolean} True if guess matches thinking, else false.
     */

    check(guess) {
        return guess === this.thinking;
    }

    /**
     * Compare if the nuumber is higher/lower then users guess.
     * @param {integer} guess, the number being guessed.
     * @returns {string} Higher or Lower.
     */

    compare(guess) {
        return guess > this.thinking
            ? "lower"
            : "higher";
    }

    /**
     * Cheat to see the nuumber to guess for.
     * @returns {integer} Higher or Lower.
     */

    cheat() {
        return this.thinking;
    }
}

module.exports = Game;
