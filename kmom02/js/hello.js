/**
 * Main function starting the famous Hello World.
 * A for-loop to count 0-8
 * A while loop to count and divide even/odd 0-8.
 * A date object and conversion for easier readability.
 * -------------------------
 * Kmom02 - Databas
 * @author Daniel Andersson
 * -------------------------
 */

"use strict";

function main() {
    let a = 1;
    let b;
    let range = "";

    b = a + 1;

    for (let i=0; i < 9; i++) {
        range += i + ", ";
    }

    console.info("Hello World");
    console.info(range.substring(0, range.length - 2));
    console.info(a, b);

    var i = 0;

    while (i < 9) {
        if (i % 2 == 0) {
            console.info(i);
            console.info("The variable \"i\" is EVEN.");
            i += 1;
        } else if (i % 2 == 1) {
            console.info(i);
            console.info("The variable \"i\" is ODD.");
            i += 1;
        }
    }

    // Log todays date, convert to date-string for easier readability.
    var todayIs = new Date();

    todayIs = String("Today is:\n" + todayIs.toDateString());
    console.info(todayIs);
}

main();
