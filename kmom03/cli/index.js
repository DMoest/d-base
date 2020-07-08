/**
 * Gör en kommandoradsklient i Node.js (v2)
 * -------------------------
 * DV1606 - Databasteknologier för webben
 * Kmom03 - ER-Modellering
 * @author Daniel Andersson, DAAP19
 * -------------------------
 * Module: index.js
 */

"use strict";

/* Readline from commandline */
const readline = require("readline");
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

/* Import the game module. */
const Game = require("./game.js");
const game = new Game();

/* Promisify rl.question to question */
const util = require("util");

rl.question[util.promisify.custom] = (arg) => {
    return new Promise((resolve) => {
        rl.question(arg, resolve);
    });
};

// const question = util.promisify(rl.question);



/*
 * Main Function.
 *
 * @returns void
 */
(function() {
    rl.on("close", exitProgram);
    rl.on("line", handleInput);

    game.init();
    console.info(
        "Lets play the game of 'Guess my number'! \n"
        + "I am guessing of a number between 1 and 100. \n"
        + "Can you find out what number I'm guessing? \n"
    );

    rl.setPrompt("Guess my number: ");
    rl.prompt();
})();


/**
 * Show the menu on that can be done.
 * @returns {void}
 */
function showMenu() {
    console.info(
        `  < *** MENU *** >     \n`
        + `  These are your options: \n`
        + `  help, menu           - to show this menu. \n`
        + `  init                 - randomize a new number. \n`
        + `  cheat                - show the current number. \n`
        + `  compare              - compare the last guess to the number. \n`
        + `  exit, quit, ctrl-d   - to exit the program. \n`
        + `  anything else is treated as a guess.`
    );
}


/**
 * Handle input as a command then send it to a function that deals with it.
 *
 * @param {string} line The input from the user.
 * @returns {void}
 */

function handleInput(line) {
    let guess;

    line = line.trim();
    switch (line) {
        case "menu":
        case "help":
            showMenu();
            break;
        case "init":
            makeInit(game);
            break;
        // case "compare":
        //     compare(guess);
        case "cheat":
            makeCheat(game);
            break;
        case "quit":
        case "exit":
            exitProgram();
            break;
        default:
            guess = Number.parseInt(line);
            makeGuess(guess);
    }

    rl.prompt();
}

/**
 * makeGuess Function.
 * @param {integer} guess, the number being guessed.
 * @returns {boolean} true if correct guess, otherwise false.
 */
function makeGuess(guess) {
    let match;
    let message;
    let thinking = game.cheat();

    match = game.check(guess); /* kontrollerar om gissning stämmer. */
    message = `I'm thinking of number ${thinking}. \n` /* meddelande. */
        + `Your guess is ${guess}.\n`
        + `You guessed right? `
        + match;
    console.info(message);

    return match;
}


/**
 * Init a new game to guess another number.
 * @param {Game} game The current game being played.
 * @returns {void}
 */
function makeInit(game) {
    game.init();
    console.info(` I am know thinking of another number.`);
}


/**
 * makeCheat Function.
 * Cheat by checking the number.
 * @param {game} game, The game being played.
 * @returns {void}
 */
function makeCheat(game) {
    console.info(` I am thinking of number ${game.cheat()}`);
}


/*
* exitProgram Function.
* @param {integer} code Exit with the value, default = 0.
* @returns {void}
*/
function exitProgram(code) {
    code = code || 0;

    console.info("Exiting with status code " + code);
    process.exit(code);
}
