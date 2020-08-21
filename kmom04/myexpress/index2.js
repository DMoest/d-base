/**
 * myExpress övning från övningsexemplen.
 * -------------------------
 * DV1606 - Databasteknologier för webben
 * Kmom04 - myExpress övningen
 * @author Daniel Andersson, DAAP19
 * -------------------------
 * Module: index2.js
 */

"use strict";

// Enable server to run on port selected by the user selected
// environment variable DBWEBB_PORT
const port = process.env.DBWEBB_PORT || 1337;

// Set upp Express server
const express = require("express");
const app = express();
const routeIndex = require("./routes/index.js"); // import av module för "routes" routes/index.js
const middleware = require("./middleware/index.js");



// This middleware is called for all routes.
// Middleware takes three parameters.
// Its callback ends with a call to next() to proceed to the next
// middleware, or the actual route.
app.use(middleware.logIncoming);
app.use("/", routeIndex);
app.listen(port, logStartUpDetails);

// app.use((req, res, next) => {
//     console.info(`Got request on ${req.path} (${req.method}).`);

//     next();
// });

// Add a route for the path /
app.get("/", (req, res) => {
    res.send("Hello World");
});

// Add a route for the path /about
app.get("/about", (req, res) => {
    res.send("About something");
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
        } else if (middleware.name === "router") {
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
