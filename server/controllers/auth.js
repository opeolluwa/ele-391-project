// load in dependencies
const database = require("../config/db.config")
const { v4: uuidv4 } = require('uuid');
const jwt = require("./../utils/jwt")
const { hash_password, compare_hash } = require("../utils/bcrypt")

//instatiate module
const uuid = uuidv4();

//ADD user
function register(req, res) {
    //fetch data from pay load
    const { firstname, lastname, username, password } = req.body

    //check if user exists
    database.promise()
        .query("SELECT * FROM auth WHERE LOWER(username) = ?", [username])
        .then(([rows, fields]) => {

            //add user if not exist
            if (!rows[0]) {
                database.promise().query("INSERT INTO auth (id, firstname, lastname, username, password)  VALUES (?,?,?,?,?)", [uuid, firstname, lastname, username, hash_password(password)])
                    .then(([rows, fields]) => {
                        return res.send({ message: username + " successfully added" })
                    })
                    .catch(error => console.log(error))
                // .then(() => database.end());
            }

            //inform user of existence if found
            else {
                return res.status(409).send({ message: username + " already exists" })
            }
        })
        .catch(error => console.log(error))
    //REFACTOR :: fix datase throwing error when connection is closed
    // .then(() => database.end());
}





//login user return jwt
function login(req, res) {
    const { username, password } = req.body

    //check if user exists
    database.promise()
        .query("SELECT * FROM auth WHERE LOWER(username) =?", [username])
        .then(([rows, fields]) => {

            //if user is found,  validate data then return data and access token
            if (rows[0]) {
                //data retrieved from database
                const { id, password : hash, username, firstname } = rows[0];

                //compare req.body.user_password with stored hash
                if (compare_hash(password, hash)) {
                    const jwt_token = jwt({ id, username, firstname })
                    return res.send({ id, username, firstname, jwt_token })
                }
                //if data does not match
                if (!compare_hash(user_password, password)) {
                    return res.send({ error: "Invalid email or password" })
                }
            }
            //user if not found,
            else {
                return res.send({ message: username + " not found" })
            }
        })
        .catch(error => console.log(error))
    //REFACTOR :: fix datase throwing error when connection is closed
    // .then(() => database.end())
}


//export class 
module.exports = {register, login}