/**
 * Eshop (del1) - General middleware for incomming requests to console.
 * See who access the server on what route.
 * -------------------------
 * DV1606 - Databasteknologier för webben
 * @author Daniel Andersson, DAAP19
 * -------------------------
 * Module: middlewear/index.js
 */

"use strict";

/**
 * Log incoming requests to console to see who accesses the server
 * on what route.
 * @param {Request}  req  The incoming request.
 * @param {Response} res  The outgoing response.
 * @param {Function} next Next to call in chain of middleware.
 * @returns {void}
 */
function logIncoming(req, res, next) {
    console.info(`Got request on ${req.path} (${req.method}).`);
    next();
}

module.exports = {
    logIncoming: logIncoming
};
