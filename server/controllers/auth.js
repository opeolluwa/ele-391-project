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
    const { firstname, lastname, email, password } = req.body

    //check if user exists
    database.promise()
        .query("SELECT * FROM user_information WHERE LOWER(email) = ?", [email])
        .then(([rows, fields]) => {

            //add user if not exist
            if (!rows[0]) {
                database.promise().query("INSERT INTO user_information (user_id, firstname, lastname, email, password)  VALUES (?,?,?,?,?)", [uuid, firstname, lastname, email, hash_password(password)])
                    .then(([rows, fields]) => {
                        return res.send({ message: email + " successfully added" })
                    })
                    .catch(error => console.log(error))
                // .then(() => database.end());
            }

            //inform user of existence if found
            else {
                return res.status(409).send({ message: email + " already exists" })
            }
        })
        .catch(error => console.log(error))
    //REFACTOR :: fix datase throwing error when connection is closed
    // .then(() => database.end());
}





//login user return jwt
function login(req, res) {
    const { email, user_password } = req.body

    //check if user exists
    database.promise()
        .query("SELECT * FROM user_information WHERE LOWER(email) =?", [email])
        .then(([rows, fields]) => {

            //if user is found,  validate data then return data and access token
            if (rows[0]) {
                //data retrieved from database
                const { user_id, password, email, firstname } = rows[0];

                //compare req.body.user_password with stored hash
                if (compare_hash(user_password, password)) {
                    const jwt_token = jwt({ user_id, email, firstname })
                    return res.send({ user_id, email, firstname, jwt_token })
                }
                //if data does not match
                if (!compare_hash(user_password, password)) {
                    return res.send({ error: "Invalid email or password" })
                }
            }
            //user if not found,
            else {
                return res.send({ message: email + " not found" })
            }
        })
        .catch(error => console.log(error))
    //REFACTOR :: fix datase throwing error when connection is closed
    // .then(() => database.end())
}


//export class 
module.exports = {register, login}