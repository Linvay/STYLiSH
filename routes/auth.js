const express = require("express");
const verifySignUp = require("../middleware/verifySignUp");
const auth = require("../services/auth");
const router = express.Router();

router.use((req, res, next) => {
    res.header(
        "Access-Control-Allow-Headers",
        "Origin, Content-Type, Accept"
    );
    next();
});

router.post("/signup", [verifySignUp.checkDuplicateUsernameOrEmail], auth.singup);

router.post("/signin", auth.singin);

router.post("/signout", auth.signout);

module.exports = router;