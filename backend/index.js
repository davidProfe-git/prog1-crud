const express = require("express")
const cors = require("cors")
const controlador = require("./controllers/recetaController")
const aplicacion = express()

aplicacion.use(cors())
aplicacion.get('/',(request, response)=>{
    // response.send(`<h1>Hola de ${clase} 1</h1>`)
})

aplicacion.get('/recetas',(request,response)=>{
    controlador.obtenerRecetas(response)
})


aplicacion.listen(3000,()=>{
    console.log("el servidor levanto")
})