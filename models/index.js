require("dotenv").config();
const Sequelize = require("sequelize");
const sequelize = new Sequelize(
    process.env.DB_DB,
    process.env.DB_USER,
    process.env.DB_PASSWORD,
    {
        host: process.env.DB_HOST,
        dialect: process.env.DB_DIALECT
    }
)

const db = {
    Sequelize: Sequelize,
    sequelize: sequelize,
    user: require("../models/user.model") (sequelize, Sequelize)
}

module.exports = db;