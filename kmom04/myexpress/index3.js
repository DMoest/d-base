/**
 * myExpress övning från övningsexemplen.
 * -------------------------
 * DV1606 - Databasteknologier för webben
 * Kmom04 - myExpress övningen
 * @author Daniel Andersson, DAAP19
 * -------------------------
 * Module: index3.js
 */

"use strict";

// Enable server to run on port selected by the user selected
// environment variable DBWEBB_PORT
const port = process.env.DBWEBB_PORT || 1337;

// Set upp Express server:
const express = require("express"); // Require EXPRESS
const app = express(); // Run through the constant "app".
const routeIndex = require("./routes/index.js"); // Import module "routes" from routes/index.js
const middleware = require("./middleware/index.js");
const path = require("path"); // Require "path" to be able to use static resources.

// This middleware is called for all routes.
// Middleware takes three parameters.
// Its callback ends with a call to next() to proceed to the next
// middleware, or the actual route.
app.use(middleware.logIncoming); 
app.use(express.static(path.join(__dirname, "public"))); // Use EXPRESS, use a static method with path and folder name.
app.use("/", routeIndex);
app.listen(port, logStartUpDetails);

// Add a route for the path /
app.get("/", (req, res) => {
    res.send("Hello World");
});

/**
 * Log startup app details.
 */
function logStartUpDetails() {
    let routes = [];

    // Find supported routes:
    app._router.stack.forEach((middleware) => {
        if (middleware.route) {
            routes.push(middleware.route); 
        } else if(middleware.name === "router") {
            // Router added as router middleware:
            middleware.handle.stack.forEach((handler) => {
                let route;

                route = handler.route;
                route && routes.push(route);
            });
        }
    });

    console.info(`Server is listening to port ${port}.`);
    console.info("Available routes are: ");
    console.info(routes);
}
