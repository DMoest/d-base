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



// * ----- INDEX ----- *
router.get("/index", async (req, res) => {
    // console.log("* INDEX ROUTE");

    let data = {
        title: "Welcome to E-shop!"
    };

    res.render("eshop/index", data);
});


// * ----- PRODUCTS ----- *

// All products
router.get("/product", async (req, res) => {
    // console.log("* ALL PRODUCTS ROUTE");

    let data = {
        title: "All Products | E-shop",
        res: await myFunctions.getProductInventories()
    };

    res.render("eshop/products/product-catalog", data);
});

// Single product view
router.get("/product/:id", async (req, res) => {
    // console.log("* A PRODUCT:ID ROUTE, show a specific product.");
    // console.log("req.params.id: ", req.params.id);

    let id = req.params.id;
    let data = {
        title: `Product ${id}`,
        product: id
    };

    data.res = await myFunctions.showProduct(id);

    res.render("eshop/products/product-view", data);
});

// Product categories
router.get("/productCategories", async (req, res) => {
    // console.log("* PRODUCT CATEGORIES ROUTE (GET)");

    let data = {
        title: "Product categories | E-shop",
        res: await myFunctions.getProductCategories()
    };

    // console.log("data.res ", data.res);

    res.render("eshop/products/product-categories", data);
});

// Search products
router.get("/searchProducts", async (req, res) => {
    // console.log("* SEARCH PRODUCTS ROUTE (POST)");

    let data = {
        title: "Search products | E-shop"
    };

    res.render("eshop/products/product-catalog", data);
});

router.post("/searchProducts", urlencodedParser, async (req, res) => {
    // console.log("* SEARCH PRODUCTS ROUTE (POST)");
    // console.log(JSON.stringify("REQ.BODY: ", req.body, null, 4));

    console.log("req.body.search: ", req.body.search);

    let data = {
        title: "Show search products | E-shop",
        res: await myFunctions.searchProduct(req.body.search)
    };

    res.render("eshop/products/product-catalog", data);
});

/* ----- PRODUCTS CRUD ----- */
router.get("/createProduct", async (req, res) => {
    // console.log("* CREATE PRODUCT ROUTE (GET)");

    let data = {
        title: "Create Product"
    };

    res.render("eshop/products/product-create", data);
});

router.post("/createProduct", urlencodedParser, async (req, res) => {
    // console.log("* CREATE PRODUCT ROUTE (POST)");
    // console.log(JSON.stringify("REQ.BODY: ", req.body, null, 4));

    await myFunctions.createProduct(req.body.id, req.body.name, req.body.info, req.body.price);

    res.redirect("./product");
});

// Update product
router.get("/updateProduct/:id", async (req, res) => {
    // console.log("* UPDATE PRODUCT ROUTE (GET)");
    // console.log("req.param.id: ", req.param.id);

    let id = req.params.id;

    // console.log("id: ", id);

    let data = {
        title: `Update Product ${id}`,
        product: id
    };

    // console.log("data: ", data);

    data.res = await myFunctions.showProduct(id);

    res.render("eshop/products/product-update", data);
});

router.post("/updateProduct", urlencodedParser, async (req, res) => {
    // console.log("* UPDATE PRODUCT ROUTE (POST)");
    // console.log("req.body: ", req.body);

    await myFunctions.updateProduct(req.body.id, req.body.name, req.body.info, req.body.price);

    res.redirect(`./product/${req.body.id}`);
});

// Delete products
router.get("/deleteProduct/:id", async (req, res) => {
    // console.log("* DELETE ROUTE (GET)");
    // console.log("req.param.id: ", req.param.id);

    let id = req.params.id;

    let data = {
        title: `delete Product ${id}`,
        product: id,
        res: await myFunctions.showProduct(id)
    };

    res.render("eshop/products/product-delete", data);
});

router.post("/deleteProduct", urlencodedParser, async (req, res) => {
    console.log("* DELETE ROUTE (POST)");
    // console.log("req.body: ", req.body);

    await myFunctions.deleteProduct(req.body.id);

    res.redirect("./product");
});



// * ----- CUSTOMERS ----- *
router.get("/customer", async (req, res) => {
    // console.log("* ALL PRODUCTS ROUTE");

    let data = {
        title: "All Customers | E-shop",
        res: await myFunctions.getAllCustomers()
    };

    res.render("eshop/customers/customers", data);
});



// * ----- ORDERS ----- *
router.get("/order", async (req, res) => {
    // console.log("* ALL ORDERS ROUTE");

    let data = {
        title: "All Orders | E-shop",
        res: await myFunctions.getAllOrders()
    };

    res.render("eshop/orders/orders", data);
});

// Create order
router.post("/createOrder/:id", urlencodedParser, async (req, res) => {
    console.log("* CREATE ORDER ROUTE (POST)");
    console.log("req.body.id: ", req.body.id);

    let id = req.body.id;

    let data = {
        title: "Create order | E-shop",
        order: id,
        res: await myFunctions.createOrder(id)
    };

    res.redirect("./../orders-selectProducts");
});

// Delete order
router.get("/deleteOrder/:id", async (req, res) => {
    console.log("* DELETE ORDER ROUTE (GET)");
    console.log("req.param.id: ", req.param.id);

    let id = req.params.id;
    let customer = req.params.customer;

    let data = {
        title: `delete Order ${id}`,
        product: id,
        customer: customer,
        res: await myFunctions.showOrder(id)
    };

    console.log("data.res", data.res);

    res.render("eshop/orders/order-delete", data);
});

router.post("/deleteOrder", urlencodedParser, async (req, res) => {
    console.log("* DELETE ORDER ROUTE (POST)");
    console.log(JSON.stringify("REQ.BODY: ", req.body, null, 4));

    console.log("req.body.id: ", req.body.id);

    await myFunctions.deleteOrder(req.body.id);

    res.redirect("./order");
});

// Select products to order
router.get("/orders-selectProducts/:id", async (req, res) => {
    // console.log("* ALL PRODUCTS ROUTE");

    let data = {
        title: "All Products | E-shop",
        res: await myFunctions.getProductInventories()
    };

    res.render("eshop/orders/orders-selectProducts", data);
});


// * ----- ABOUT ----- *
router.get("/about", async (req, res) => {
    // console.log("* ABOUT ROUTE");

    let data = {
        title: "About E-shop!"
    };

    res.render("eshop/about/about", data);
});

module.exports = router;
