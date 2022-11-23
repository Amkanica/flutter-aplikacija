//IMPORTS
const express = require('express');
const mongoose = require('mongoose');

//IMPORTS FROM OTHER FILES
const authRouter = require('./routes/auth');

// INIT
const PORT = 3000;
const app = express();
const DB = "mongodb+srv://Amer:Laganica2702Amer@cluster0.2wngpvo.mongodb.net/?retryWrites=true&w=majority"

//middleware
app.use(express.json());
app.use(authRouter);
//CLIENT -> middleware -> SERVER -> CLIENT


//Conections
mongoose
.connect(DB)
.then(() => {
    console.log('Connection Successful');
})
.catch((e) => {
    console.log(e);
});

//Creating an API

app.listen(PORT, "0.0.0.0", () => {
  console.log('connected to port ' + PORT);
})