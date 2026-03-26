const express = require("express")
const controlador = require("./controllers/bandascontroller")
const aplicacion = express()

aplicacion.get ('/',( request, response)=>{
    response.send(`<h1>cree mi servidor desde 0</h1>`)
})

aplicacion.get('/saludo',(request, response)=>{
    response.json({mensaje: "hola muchachxs"})
})

aplicacion.get('/banda', (request, response) => {
    controlador.obtenerbanda(response);
});

aplicacion.get('/albumes', (request, response) => {
    controlador.obteneralbumes(response);
});

aplicacion.get('/canciones', (request, response) => {
    controlador.obtenercanciones(response);
});

aplicacion.get('/miembros', (request, response) => {
    controlador.obtenermiembros(response);
});


aplicacion.listen(3000,()=>{
    console.log("el servidor levanto")
})