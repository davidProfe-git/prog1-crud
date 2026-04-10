const API_URL = 'http://localhost:3000banda'
/
fetch(API_URL).then(response => response.json()).then(data => {

    let div = document.getElementById("cuerpo")

    for(i=0;i<5;i++){
    div.innerHTML += `
    <div class="card">
    <div class="thumb">${data.queen}
            <h3>Queen</h3>
            <p><strong>País:</strong> Reino Unido</p>
            <p><strong>Año:</strong> 1970</p>
            <p><strong>Género:</strong> Rock</p>
            <button>Ver más</button>
        </div>
    </article>
`
}

})


