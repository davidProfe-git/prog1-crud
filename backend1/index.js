const express = require ("express")
const aplicacion = express()

aplicacion.get('/',(request,response)=>{
    response.send(`<h1> hola clase de ${clase} 1 </h1>`)
})

aplicacion.get('/saludo',(request,response)=>{
    response.json({mensaje:"como es señores"})

})

aplicacion.listen(3000,()=>{
    console.log("servidor on")
})

