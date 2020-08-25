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
const bodyParser = require("body-parser");
const urlencodedParser = bodyParser.urlencoded({ extended: false});

router.get("/index", async (req, res) => {
    console.log("* INDEX ROUTE");
    let data = {
        title: "Welcome | The Bank"
    };

    res.render("bank/index", data);
});

router.get("/balance", async (req, res) => {
    console.log("* BALANCE ROUTE");
    let data = {
        title: "Accounts balance | The Bank",
        res: await bank.showBalance("account")
    };

    res.render("bank/balance", data);
});

router.get("/account/:id", async (req, res) => {
    console.log("* ACCOUNT ROUTE");
    console.log("req.params.id: ", req.params.id);
    let id = req.params.id;
    let data = {
        title: `Account ${id}`,
        account: id
    };

    data.res = await bank.showAccount(id);

    res.render("bank/account-view", data);
});

router.get("/move-to-adam", async (req, res) => {
    console.log("* MOVE-TO-ADAM ROUTE");
    let data = {
        title: "Transaction complete | The Bank"
    };

    data.res = await bankCli.makeTransaction("eva", "adam", 1.5);

    res.render("bank/move-to-adam", data);
});

router.get("/move-to-eva", async (req, res) => {
    console.log("* MOVE-TO-EVA ROUTE");
    let data = {
        title: "Transaction complete | The Bank"
    };

    data.res = await bankCli.makeTransaction("adam", "eva", 1.5);

    res.render("bank/move-to-eva", data);
});

router.get("/create", async (req, res) => {
    console.log("* CREATE ROUTE (GET)");

    let data = {
        title: "Create Account | The Bank"
    };

    res.render("bank/create", data);
});

router.post("/create", urlencodedParser, async (req, res) => {
    console.log("* CREATE ROUTE (POST)");
    console.log(JSON.stringify("REQ.BODY: ", req.body, null, 4));

    await bank.createAccount(req.body.id, req.body.name, req.body.balance);

    res.redirect("./balance");
});

router.get("/update/:id", async (req, res) => {
    console.log("* UPDATE ROUTE (GET)");
    console.log("req.param.id: ", req.param.id);

    let id = req.params.id;

    let data = {
        title: `Update Account ${id}`,
        account: id
    };

    data.res = await bank.showAccount(id);

    res.render("bank/update", data);
});

router.post("/update", urlencodedParser, async (req, res) => {
    console.log("* UPDATE ROUTE (POST)");
    console.log("req.body: ", req.body);

    await bank.updateAccount(req.body.id, req.body.name, req.body.balance);

    res.redirect(`./account/${req.body.id}`);
});

router.get("/delete/:id", async (req, res) => {
    console.log("* DELETE ROUTE (GET)");
    console.log("req.param.id: ", req.param.id);

    let id = req.params.id;

    let data = {
        title: `delete Account ${id}`,
        account: id
    };

    data.res = await bank.showAccount(id);

    res.render("bank/delete", data);
});

router.post("/delete", urlencodedParser, async (req, res) => {
    console.log("* DELETE ROUTE (POST)");
    console.log("req.body: ", req.body);

    await bank.deleteAccount(req.body.id);

    res.redirect("./balance/");
});

module.exports = router;
