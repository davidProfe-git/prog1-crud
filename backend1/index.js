const express = require("express")
const controlador = require("./controllers/libroController")
const aplicacion = express()

aplicacion.get('/',(request, response)=>{
    response.send(`<h1>Bienvenido al CRUD de Libros - Programación 1</h1>`)
})

aplicacion.get('/libros',(request,response)=>{
    controlador.obtenerLibros(response)
})

aplicacion.listen(3000,()=>{
    console.log("el servidor levanto en http://localhost:3000")
})
