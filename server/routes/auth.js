const express = require('express');
const User = require('../models/user');
const bcryptjs = require('bcryptjs');

const authRouter = express.Router();

authRouter.post('/api/signup', async (req, res) => {
    try {
       //Get data from client
    const {name, email, password}=req.body;

    const existingUSer = await User.findOne({email});
    if(existingUSer) {
        return res.status(400).json({msg: 'User with same email already exists !'});
    }

    const hashedPassword = await bcryptjs.hash(password, 8);

    let user = new User({
        email,
        password : hashedPassword,
        name,
    })
    user = await user.save();
    res.json(user);
    //Post that data in database
    //Return that data to client

    } catch (e){
        res.status(500).json({error: e.message});
    }
   
} );

module.exports = authRouter;