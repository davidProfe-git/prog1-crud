const express = require("express")
const aplicacion = express()

aplicacion.get ('/', (request, response)=>{
    response.send("Hola amigos de tik tok")
})

aplicacion.listen(3000,()=>{
    console.log("El servidor levanto")
})

aplicacion.get('/saludo',(request, response)=>{
    response.json({mensaje: "Coman popis"})
})
aplicacion.listen(3000,()=>{
    console.log("el servidor levanto")
})