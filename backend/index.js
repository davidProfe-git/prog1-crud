const express = require("express")
const controlador = require("./controllers/maquillajecontroler")
const aplicacion = express()

aplicacion.get('/',(request, response)=>{
    // response.send(`<h1>Hola de ${clase} 1</h1>`)
})

aplicacion.get('/maquillaje',(request,response)=>{
    controlador.obtenermaquillaje(response)
})


aplicacion.listen(3000,()=>{
    console.log("el servidor levanto")
})

aplicacion.get('/categorias',(request,response)=>{
    controlador.obtenercategorias(response)
})

aplicacion.get('/publicaciones',(request,response)=>{
    controlador.obtenerpublicaciones(response)
})

aplicacion.get('/usuarios',(request,response)=>{
    controlador.obtenerusuarios(response)
})

aplicacion.get('/comentarios',(request,response)=>{
    controlador.obtenercomentarios(response)
})