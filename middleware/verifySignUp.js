const db = require("../models");
const User = db.user;

async function checkDuplicateUsernameOrEmail(req, res, next) {
    try {
        /* Username */
        let user = await User.findOne({
            where: {
                name: req.body.name
            }
        }).catch((err) => {
            console.log(err);
        });
        if (user) {
            return res.status(400).send({
                message: "Failed! Username is already in use!"
            });
        }

        console.log("bp 1");

        /* Email */
        user = await User.findOne({
            where: {
                email: req.body.email
            }
        });
        if (user) {
            return res.status(400).send({
                message: "Failed! Email is already in use!"
            });
        }

        console.log("bp 2");

        next();
    } catch (err) {
        return res.status(500).send({
            message: "Unable to validate Username!"
        });
    }
};

module.exports = {
    checkDuplicateUsernameOrEmail,
};