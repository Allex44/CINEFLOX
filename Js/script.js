//funcion para desplegar el menu de filtro por genero
function desplegarMenu() {
    const menu = document.getElementById('filtrar');
    const genero = document.getElementById('genero');

    menu.addEventListener('click', (Event) => {
        if (genero.style.visibility === "visible") {
            genero.style.visibility = "hidden";
        } else {
            genero.style.visibility = "visible";
        }
    });
}

//funcion para redireccionar al post de la pelicula clicada
function redirigir(idPelicula) {
    // Redireccionar a la página 'pelicula.php' con el ID de la película
    addEventListener('click', function () {
        // Redireccionar a la página 'pelicula.php'
        window.location.href = 'pelicula.php?id=' + idPelicula;
    });
}

//funcion que modifica segun las acciones que se hagan en el icono del menu desplegable
function cambiarImagen(){
var div = document.getElementById('filtrar');
var imagen = document.getElementById('imagenFiltrar');

// Añade un evento de escucha al div
div.addEventListener('mouseover', function() {
    // Cambia la imagen cuando el ratón pasa por encima del div
    imagen.src = 'img/filtrar.png';
});
div.addEventListener('mouseout', function() {
    // Si la imagen no está fija, vuelve a la imagen original
    if (!imagen.dataset.fija) {
        imagen.src = 'img/filtrar(1).png';
    }
});

// Añade un evento de escucha al div para cuando se hace clic
div.addEventListener('click', function() {
    // Si la imagen está fija, vuelve a la imagen original y quita la fijación
    if (imagen.dataset.fija) {
        imagen.src = 'img/filtrar.png';
        delete imagen.dataset.fija;
    } else {
        // Si la imagen no está fija, fíjala
        imagen.dataset.fija = true;
    }
});
}