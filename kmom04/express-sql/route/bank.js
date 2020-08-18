/**
 * Express-SQL övning från Kmom04.
 * -------------------------
 * DV1606 - Databasteknologier för webben
 * Kmom04 - bank.js
 * @author Daniel Andersson, DAAP19
 * -------------------------
 * Module: route/bank.js
 */

"use strict";

const express = require("express");
const router = express.Router();
const bank = require("../src/bank.js");

router.get("/index", (req, res) => {
    let data = {
        title: "Welcome | The Bank"
    };

    res.render("bank/index", data);
});

router.get("/balance", async (req, res) => {
    let data = {
        title: "Account balance | The Bank"
    };

    data.res = await bank.showBalance();

    res.render("bank/balance", data);
});

module.exports = router;
