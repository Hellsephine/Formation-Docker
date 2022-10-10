const express = require('express');

const app = express();

app.get('/',(req,res)=>{
    res.send("Bonjour depuis mon serveur node.js")
})

app.listen(80,()=>{
    console.log("App is running")
})
