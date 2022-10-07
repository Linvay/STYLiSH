const jwt = require("jsonwebtoken");
const db = require("../models");
const config = require("../config")
const User = db.user;

function verifyToken(req, res, next) {
    let token = req.session.token;
    if (!token) {
        return res.status(403).send({
            message: "No token provided",
        });
    }
    jwt.verify(token, config.jwt.secret, (err, decoded) => {
        if (err) {
            return res.status(401).send({
                message: "Unauthorized",
            });
        }
        req.userId = decoded.id;
        next();
    });
};

module.exports = {
    verifyToken
};
