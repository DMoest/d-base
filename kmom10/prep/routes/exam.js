/**
 * Eshop (del1) - Web client.
 * -------------------------
 * DV1606 - Databasteknologier för webben
 * @author Daniel Andersson, DAAP19
 * -------------------------
 * Module: routes/index.js
 */

"use strict";

const express = require("express");
const router = express.Router();
const myFunctions = require("./../src/functions.js");
const bodyParser = require("body-parser");
const urlencodedParser = bodyParser.urlencoded({ extended: false});

router.get("/index", async (req, res) => {
    // console.log("* INDEX ROUTE");

    let data = {
        title: "Welcome to Exam!"
    };

    res.render("exam/index", data);
});

router.get("/visa", async (req, res) => {
    // console.log("* ALL PRODUCTS ROUTE");

    let data = {
        title: "All Artists | Exam",
        res: await myFunctions.visaArtistInfo()
    };

    res.render("exam/visa", data);
});

// router.get("/product/:id", async (req, res) => {
//     // console.log("* A PRODUCT:ID ROUTE, show a specific product.");
//     // console.log("req.params.id: ", req.params.id);

//     let id = req.params.id;
//     let data = {
//         title: `Product ${id}`,
//         product: id
//     };

//     data.res = await myFunctions.showProduct(id);

//     res.render("exam/products/product-view", data);
// });

// router.get("/productCategories", async (req, res) => {
//     // console.log("* PRODUCT CATEGORIES ROUTE (GET)");

//     let data = {
//         title: "Product categories | E-shop",
//         res: await myFunctions.getProductCategories()
//     };

//     // console.log("data.res ", data.res);

//     res.render("exam/products/product-categories", data);
// });

// router.get("/createProduct", async (req, res) => {
//     // console.log("* CREATE PRODUCT ROUTE (GET)");

//     let data = {
//         title: "Create Product"
//     };

//     res.render("exam/products/product-create", data);
// });

// router.post("/createProduct", urlencodedParser, async (req, res) => {
//     // console.log("* CREATE PRODUCT ROUTE (POST)");
//     // console.log(JSON.stringify("REQ.BODY: ", req.body, null, 4));

//     await myFunctions.createProduct(req.body.id, req.body.name, req.body.info, req.body.price);

//     res.redirect("./product");
// });

// router.get("/updateProduct/:id", async (req, res) => {
//     // console.log("* UPDATE PRODUCT ROUTE (GET)");
//     // console.log("req.param.id: ", req.param.id);

//     let id = req.params.id;

//     // console.log("id: ", id);

//     let data = {
//         title: `Update Product ${id}`,
//         product: id
//     };

//     // console.log("data: ", data);

//     data.res = await myFunctions.showProduct(id);

//     res.render("exam/products/product-update", data);
// });

// router.post("/updateProduct", urlencodedParser, async (req, res) => {
//     // console.log("* UPDATE PRODUCT ROUTE (POST)");
//     // console.log("req.body: ", req.body);

//     await myFunctions.updateProduct(req.body.id, req.body.name, req.body.info, req.body.price);

//     res.redirect(`./product/${req.body.id}`);
// });

// router.get("/deleteProduct/:id", async (req, res) => {
//     // console.log("* DELETE ROUTE (GET)");
//     // console.log("req.param.id: ", req.param.id);

//     let id = req.params.id;

//     let data = {
//         title: `delete Product ${id}`,
//         product: id
//     };

//     data.res = await myFunctions.showProduct(id);

//     res.render("exam/products/product-delete", data);
// });

// router.post("/deleteProduct", urlencodedParser, async (req, res) => {
//     // console.log("* DELETE ROUTE (POST)");
//     // console.log("req.body: ", req.body);

//     await myFunctions.deleteProduct(req.body.id);

//     res.redirect("./product");
// });



module.exports = router;
