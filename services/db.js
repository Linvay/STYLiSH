const mysql = require("mysql");
const config = require("../config");

async function query(sql, params) {
    const connection = await mysql.createConnection(config.db);
    const [results, ] = await connection.query(sql, params);

    return results;
}

con = mysql.createConnection(config);
con.connect(function(err) {
    if (err) throw err;
    console.log("Connected!");
    con.query("select * from product", function (err, result) {
        if (err) throw err;
        console.log("Result: " + result);
    });
});

module.exports = {
    query
}