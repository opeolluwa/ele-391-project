// load in dependencies
const database = require("../config/db.config")
const jwt = require("./../utils/jwt")

function mobile_endpoint(re, res, next) {
    const { week } = req.body;
    //TODO: get data based on week from database and end()
    database.promise()
        .query(`SELECT * FROM attendance WHERE week_${week} = ?`, [week])
        .then(([rows, fields]) => {
            //send back the week and the data required 
            return res.send({ message: { rows, week } })
        })
}