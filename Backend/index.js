const express = require("express")
const aplicacion = express()

aplicacion.get ('/',( request, response)=>{
    response.send(`<h1>cree mi servidor desde 0</h1>`)
})

aplicacion.get('/saludo',(request, response)=>{
    response.json({mensaje: "hola muchachxs"})
})

aplicacion.listen(3000,()=>{
    console.log("el servidor levanto")
})