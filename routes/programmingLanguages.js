const express = require("express");
const router = express.Router();
const programmingLanguages = require("../services/programmingLanguages");

/* GET programming languages. */
router.get('/all', async function(req, res, next) {
    try {
        res.json(await programmingLanguages.getMultiple(req.query.page));
    } catch (err) {
        console.error(`Error while getting programming languages`, err);
        next(err);
    }
});

router.get('/women', async function(req, res, next) {
    try {
        res.json(await programmingLanguages.getMultipleWhere(req.query.page, "w"));
    } catch (err) {
        console.error(`Error while getting programming languages`, err);
        next(err);
    }
});

router.get('/man', async function(req, res, next) {
    try {
        res.json(await programmingLanguages.getMultipleWhere(req.query.page, "m"));
    } catch (err) {
        console.error(`Error while getting programming languages`, err);
        next(err);
    }
});

router.get('/accessories', async function(req, res, next) {
    try {
        res.json(await programmingLanguages.getMultipleWhere(req.query.page, "a"));
    } catch (err) {
        console.error(`Error while getting programming languages`, err);
        next(err);
    }
});

module.exports = router;