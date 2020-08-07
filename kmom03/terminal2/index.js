/**
 * Bygg ett menydrivet terminalprogram med JavaScript i Node.js som jobbar mot en MySQL databas.
 * -------------------------
 * DV1606 - Databasteknologier för webben
 * Kmom03 - Node.js terminalprogram mot MySQL med komandoloop
 * @author Daniel Andersson, DAAP19
 * -------------------------
 * Module: index.js
 */

"use strict";

const readline = require('readline');
const teachers = require("./teachers.js");

/**
 * MAIN FUNCTION - CommandLineLoop to run all functions for database handling.
 */
(function main() {
    const rl = readline.createInterface({
        input: process.stdin,
        output: process.stdout
    });

    showWelcomeText();
    rl.setPrompt("Please choose something: ");
    rl.prompt();

    rl.on("close", process.exit);
    rl.on("line", async function(line) { // Med async specat vid declarationen...
        line = line.trim();
        let lineArray = line.split(" ");

        // console.info("Line: ", line);
        // console.info("linearray: ", lineArray);

        switch (lineArray[0]) {
            case "menu":
            case "help":
            case "m": // fast/short -key.
            case "h": // fast/short -key.
                showMenu();
                break;
            case "teachers":
            case "larare":
            case "t": // fast/short -key.
                await teachers.allTeachers(); // ...får vi bla. rätt exekveringsordning på saker.
                break;
            case "kompetens":
            case "competence":
            case "c": // fast/short -key.
                await teachers.competenceTeachers();
                break;
            case "lon":
            case "salary":
            case "s": // fast/short -key.
                await teachers.salariesTeachers();
                break;
            case "newsalary":
            case "nylon":
            case "ns": // fast/short -key.
                await teachers.newSalary(lineArray[1], lineArray[2]);
                break;
            case "search":
            case "sok":
                await teachers.makeSearch(lineArray[1]);
                break;
            case "minMaxSalary":
            case "minMaxLon":
            case "mms": // fast/short -key.
                await teachers.minMaxSearch(lineArray[1], lineArray[2]);
                break;
            case "exit":
            case "quit":
            case "q": // fast/short -key.
                process.exit();
                break; // Helt meningslöst med BREAK men vi lägger endå till det!
            default:
                showMenu();
                break;
        }

        rl.prompt();
    });
})();



/**
 * MENU for the CommandLineLoop
 */

function showWelcomeText() {
    console.info(`
    * ============================================================ *
    |  Welcome to the terminal commanline loop!                    |
    |  For options available simply use 'menu' or 'help' (m / h).  |
    * ============================================================ *
    `);
}



/**
 * MENU for the CommandLineLoop
 */
function showMenu() {
    console.info(`
        *** MENU ***

        Menu, Help (m / h):                             Show this menu.
        Exit, Quit (q):                                 Quit the program.
        Teachers, Larare (t):                           Show information about teachers.
        Competence, Kompetens (c):                      Show teachers competence pre/post revision.
        Salary, Lon (s):                                Show teachers salaries pre/post revision.
        Newsalary, Nylon (ns) <akronym> <new salary>:   New salary for teacher.
        Search, Sok + <searchString>:                   Search for teachers.
        minMaxSalary, minMaxLon (mms) <Min> <Max>:      Search for min/max salaries from teachers.
    `);
}
