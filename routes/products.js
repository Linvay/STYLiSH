const express = require("express");
const router = express.Router();
const multer = require("multer");
const storage = multer.diskStorage({
    destination: (req, file, callback) => callback(null, "./upload/images"),
    filename: (req, file, callback) => 
        callback(null, Buffer.from(file.originalname, "latin1").toString("utf8"))
})
const upload = multer({storage: storage});
const products = require("../services/products");

router.get('/search', async function(req, res, next) {
    try {
        res.json(await products.getAllByKeyword(req.query.page, req.query.keyword));
    } catch (err) {
        console.error(`Error while getting products by keyword`, err);
        next(err);
    }
});

router.get('/detail', async function(req, res, next) {
    try {
        res.json(await products.getDetailByID(req.query.id));
    } catch (err) {
        console.error(`Error while getting product detail`, err);
        next(err);
    }
});

const cpUpload = upload.fields([{name: "var_img"}, {name: "des_img"}]);
router.post('/create', cpUpload, async function(req, res, next) {
    try {
        res.json(await products.insert(req.body, req.files));
    } catch (err) {
        console.error(`Error while inserting products`, err);
        next(err);
    }
});

router.get('/:category', async function(req, res, next) {
    if (req.params.category == "all") {
        try {
            res.json(await products.getAll(req.query.page));
        } catch (err) {
            console.error(`Error while getting products`, err);
            next(err);
        }
    }
    else if (req.params.category == "women") {
        try {
            res.json(await products.getAllByCategory(req.query.page, "women"));
        } catch (err) {
            console.error(`Error while getting women products`, err);
            next(err);
        }
    }
    else if (req.params.category == "men") {
        try {
            res.json(await products.getAllByCategory(req.query.page, "men"));
        } catch (err) {
            console.error(`Error while getting men products`, err);
            next(err);
        }
    }
    else if (req.params.category == "accessories") {
        try {
            res.json(await products.getAllByCategory(req.query.page, "accessories"));
        } catch (err) {
            console.error(`Error while getting accessories products`, err);
            next(err);
        }
    }
    else {
        res.send("Error: no such category");
    }
});

module.exports = router;