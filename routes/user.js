const authJwt = require("../middleware/authJwt");
const user_service = require("../services/user");

const express = require("express");
const router = express.Router();

router.use((req, res, next) => {
    res.header(
        "Access-Control-Allow-Headers",
        "Origin, Content-Type, Accept"
    );
    next();
});

router.get("/all", user_service.allAccess);

router.get("/user", [authJwt.verifyToken], user_service.userBoard);

module.exports = router;