const express = require('express');
const User = require('../models/user');
const bcryptjs = require('bcryptjs');
const jwt = require('jsonwebtoken');

const authRouter = express.Router();

authRouter.post('/api/signup', async (req, res) => {
    try {
       //Get data from client
    const {name, email, password}=req.body;

    const existingUSer = await User.findOne({email});
    if(existingUSer) {
        return res.status(400).json({ msg: 'User with same email already exists !'});
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

//Check if Email exist if not show message
authRouter.post('/api/signin', async(req, res) => {
    try {
         const {email,password} = req.body;
         const user = await User.findOne({email});
            if(!user){
                return res
                .status(400)
                .json({msg: 'User with this email does not exist !'});
            }
     // Check if password is correct (Password is encrypted so we need to encrypt it)
         const isMatch = await bcryptjs.compare(password, user.password);
             if(!isMatch){
                 return res
                 .status(400)
                 .json({msg:'Password is not correct please try again !' });
      }
      const token = jwt.sign({id: user._id},'passwordKey');
      res.json({token, ...user._doc});


    } catch (e) {
        res.status(500).json({error: e.message});
    }
});
module.exports = authRouter;