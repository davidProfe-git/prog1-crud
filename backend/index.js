const express = require("express")
const aplicacion = express()

aplicacion.get('/',(request, response)=>{
    response.send(`<h1>Hola de ${clase} 1</h1>`)
})

aplicacion.get('/saludo',(request, response)=>{
    response.json({mensaje: "hola muchachx"})
})

aplicacion.listen(3000,()=>{
    console.log("el servidor levanto")
})