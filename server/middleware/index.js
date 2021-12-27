const _ = require('lodash')
const jwt = require("jsonwebtoken")
const meta_data = require("./../config/server.config")
module.exports = {
    //parse admin data and validate
    validate_admin_login(req, res, next) {
        const { username, password } = req.body
        //username not provided 
        if (!username) {
            res.status(400).send({ message: _.capitalize("invalid username or password") })
        }

        if (!password) {
            res.status(400).send({ message: _.capitalize("invalid username or password") })

        }
        next()
    },

    validate_hardware_login() {
        const { card_id } = req.body;
        if (!card_id) {
            res.send({ message: _.capitalize("unauthorized! please provide a valid id") })

        }
        next()
    },

    validate_token(req, res, next) {
        try {
            //get token fom header
            const token = req.headers.authorization.split(" ")[1];
            const decoded = jwt.verify(token, meta_data.secret);
            const user_data = decoded;
            //TODO:: SEND token to next handler
            next()
        } catch (error) {
            throw error
            res.status(400).send({ message: _.capitalize("invalid session") })
        }
    }
}