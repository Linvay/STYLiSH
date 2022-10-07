const db = require("../models");
const config = require("../config");
const User = db.user;
const Op = db.Sequelize.Op;
const jwt = require("jsonwebtoken");
const bcrypt = require("bcryptjs");

async function singup(req, res) {
    /* Save user to database */
    try {
        const user = await User.create({
            name: req.body.name,
            email: req.body.email,
            password: bcrypt.hashSync(req.body.password, 8),
        });
        if (user) {
            res.send({
                message: "User registered successfully!"
            });
        }
    } catch (err) {
        res.status(500).send({
            message: err.message
        });
    }
}

async function singin(req, res) {
    try {
        const user = await User.findOne({
            where: {
                name: req.body.name,
            },
        });
        if (!user) {
            res.status(404).send({
                message: "User not found"
            });
        }

        /* Password validation */
        const passwordIsValid = bcrypt.compareSync(
            req.body.password,
            user.password
        );
        if (!passwordIsValid) {
            return res.status(401).send({
                message: "invalid Password",
            });
        }

        const token = jwt.sign({id: user.id}, config.jwt.secret, {
            expiresIn: 86400, // 24 hours
        });
        req.session.token = token;
        return res.status(200).send({
            id: user.id,
            name: user.name,
            email: user.email,
        })
    } catch (err) {
        res.status(500).send({
            message: err.message
        });
    }
}

async function signout(req, res) {
    try {
        req.session = null;
        return res.status(200).send({
            message: "You've been signed out!"
        });
    } catch (err) {
        this.next(err);
    }
}

module.exports = {
    singup,
    singin,
    signout
}