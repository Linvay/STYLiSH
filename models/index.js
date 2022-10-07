const config = require("../config");
const Sequelize = require("sequelize");
const sequelize = new Sequelize(
    config.db.database,
    config.db.user,
    config.db.password,
    {
        host: config.db.host,
        dialect: "mysql"
    }
)

const db = {
    Sequelize: Sequelize,
    sequelize: sequelize,
    user: require("../models/user.model") (sequelize, Sequelize)
}

module.exports = db;