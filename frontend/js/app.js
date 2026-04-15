const API_URL = 'http://localhost:3000/recetas'

fetch(API_URL).then(response => response.json()).then(data => {

    let div = document.getElementById("cuerpo")

    for(i=0;i<5;i++){
    div.innerHTML += `
    <article class="card">
        <img src="${data.receta[i].imagen_url}">
        <div class="thumb">${ data.receta[i].titulo}</div>
        <div class="meta">
            <div class="tags">🕰️${data.receta[i].tiempo_preparacion}</div>
            <h3 class="title">instrucciones</h3>
            <p class="excerpt">${data.receta[i].instrucciones}</p>
        </div>
    </article>
`
}

})