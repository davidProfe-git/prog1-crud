const express = require("express")
const controlador = require("./controllers/libroController")
const aplicacion = express()

aplicacion.get('/',(request, response)=>{
    response.send(`<h1>Bienvenidos a la API de Libros</h1>`)
})

aplicacion.get('/libros',(request,response)=>{
    controlador.obtenerLibros(response)
})


aplicacion.get('/autores',(request,response)=>{
    controlador.obtenerautores(response)
})

aplicacion.get('/generos',(request,response)=>{
    controlador.obtenerGeneros(response)
})  

aplicacion.get('/reseñas',(request,response)=>{
    controlador.obtenerReseñas(response)
})

aplicacion.get('/fechas',(request,response)=>{
    controlador.obtenerFechas(response)
})
aplicacion.listen(3000,()=>{
    console.log("el servidor levanto en http://localhost:3000")
})
