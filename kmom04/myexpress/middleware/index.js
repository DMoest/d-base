/**
 * myExpress övning från övningsexemplen.
 * -------------------------
 * DV1606 - Databasteknologier för webben
 * Kmom04 - myExpress (övning)
 * @author Daniel Andersson, DAAP19
 * -------------------------
 * Module: middlewear/index.js
 */

"use strict";

/**
 * Log incoming requestes to console.
 * See who accesses the server and on what route.
 *
 * @param {request} req - The incoming request.
 * @param {Response} res - The outgoing response.
 * @param {Function} next - The Next to call in chain of middlewear.
 *
 * @return {void}
 */

/**
 * Log incoming app details.
 */
function logIncoming(req, res, next) {
    console.info(`Got request on: ${req.path} (${req.method}).`);

    next();
}

module.exports = {
    logIncoming: logIncoming
};
