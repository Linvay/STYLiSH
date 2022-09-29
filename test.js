const db = require("./services/db");

async function test_query() {
    const data = await db.query(`
        select * 
        from product
        natural join variant
        where category = 'a'
        limit 0, 6`);
    console.log(data);
    const last_id = data[data.length - 1].id
    console.log("last id:", last_id);

    const next_data = await db.query(`
        select count(*) as cnt
        from product
        natural join variant
        where category = 'a' and id > ${last_id}
    `)

    console.log("remaining:", next_data[0].cnt)
}

test_query();