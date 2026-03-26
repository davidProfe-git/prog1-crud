const express = require("express")
const controlador = require("./controllers/peliculacontroller")
const aplicacion = express()

aplicacion.get('/',(request, response)=>{
    // response.send(`<h1>Hola de ${clase} 1</h1>`)
})

aplicacion.get('/pelicula',(request,response)=>{
    controlador.obtenerpeliculas(response)
})


aplicacion.listen(3000,()=>{
    console.log("el servidor levanto")
})