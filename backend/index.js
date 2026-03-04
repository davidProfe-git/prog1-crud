const express = require('express')
const aplicacion = express ()

aplicacion.get ('/',(request,response)=>{

    response.send("poner un mensaje")
})

aplicacion.get('/saludo',(request,response)=>{
    response.json({mensaje:"responder el mensaje"})
})

aplicacion.listen(3000,()=>{
    console.log("el servidor levanto")
})