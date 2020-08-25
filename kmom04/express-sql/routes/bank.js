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
const bank = require("./../src/bank.js");
const bankCli = require("./../src/bankCli.js");

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

router.get("/move-to-adam", async (req, res) => {
    let data = {
        title: "Transaction complete | The Bank"
    };

    data.res = await bankCli.makeTransaction("eva", "adam", 1.5);

    res.render("bank/move-to-adam", data);
});

router.get("/move-to-eva", async (req, res) => {
    let data = {
        title: "Transaction complete | The Bank"
    };

    data.res = await bankCli.makeTransaction("adam", "eva", 1.5);

    res.render("bank/move-to-eva", data);
});

module.exports = router;
