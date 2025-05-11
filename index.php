<?php
include "usuario.php";
include "consultas.php";
include "objPelicula.php";
session_start();

// Sentencia SQL para obtener todas las películas
$sql = "SELECT * FROM peliculas";

// Ejecutamos la sentencia SQL y obtener el resultado
$resultado = sentenciar($sql);

// Obtenemos el número de filas en el resultado
$num_filas = mysqli_num_rows($resultado);

echo '<div class="pagina">';
// Verificamos si hay al menos una película
if ($num_filas > 0) {
    // Iteramos sobre cada fila (película) en el resultado
    while ($fila = $resultado->fetch_assoc()) {
        // Creamos un objeto de la clase objPelicula con los datos de la película actual
        $pelicula = new objPelicula(
            $fila['id_pelicula'],
            $fila['portada'],
            $fila['titulo'],
            $fila['duracion'],
            $fila['director'],
            $fila['calificacion'],
            $fila['actores'],
            $fila['anno'],
            $fila['pais'],
            $fila['genero'],
            $fila['sinopsis']
        );
        // Imprimimos el contenedor de cada película con el género como clase y la función redirigir en el evento click
        echo '<div class="pelicula-item ' . $pelicula->genero . '" onclick="redirigir(\'' . $pelicula->getIdPelicula() . '\')">';
        // Imprimimos la imagen de la película con el ID correspondiente
        echo '<img src="' . $pelicula->portada . '" id="pelicula_' . $pelicula->getIdPelicula() . '">';
        echo '</div>';
    }
}

echo '</div>';
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cineflox</title>
    <link rel="stylesheet" href="./css/style_form.css">
    <link rel="icon" href="./Logos/foto LOGO.png" type="image/png">
    <script src="./Js/script.js"></script>

</head>

<body>
    <header class="index">
        <div id="filtrar" class="filtrar">
            <img class="imagenFiltrar" id="imagenFiltrar" src="./img/filtrar(1).png" alt="">

        </div>

        <div class="logo">
            <img src="./Logos/foto LOGO.png" class="foto" height="50px" width="50px">
            <img src="./Logos/letra LOGO.png" class="texto" width="140px">
        </div>
        <div>
            <?php if (!isset($_SESSION['usuario'])) { ?>
                <p class="centrar"><a href="inisesion.php">Iniciar sesión</a>
                    /
                    <a href="registro.php">Registrase</a>
                <?php } ?>
                <?php if (isset($_SESSION['usuario'])) { ?>
                    <a href="datosUsuario.php" class="nickUsu"><img class="imagenPerfil" src="./img/usuario-de-perfil.png" alt="imgUsu"><?php echo $_SESSION['usuario']->nick; ?></a>
                </p>
            <?php } ?>
            <script>
                cambiarImagen();
            </script>
        </div>
    </header>
    <main>

        <div class="genero" id="genero">
            <ul>
                <li><a class="filtro" href="#" generoPelicula="Terror">Terror</a></li>
                <li><a class="filtro" href="#" generoPelicula="Accion">Acción</a></li>
                <li><a class="filtro" href="#" generoPelicula="Animacion">Animación</a></li>
                <li><a class="filtro" href="#" generoPelicula="Aventura">Aventura</a></li>
                <li><a class="filtro" href="#" generoPelicula="Ciencia ficcion">Ciencia ficción</a></li>
                <li><a class="filtro" href="#" generoPelicula="Comedia">Comedia</a></li>
                <li><a class="filtro" href="#" generoPelicula="Novela negra">Novela negra</a></li>
                <li><a class="filtro" href="#" generoPelicula="Drama">Drama</a></li>
                <li><a class="filtro" href="#" generoPelicula="Infantil">Infantil</a></li>
                <li><a class="filtro" href="#" generoPelicula="Romance">Romance</a></li>
                <li><a class="filtro" href="#" generoPelicula="todos">Mostrar Todas</a></li>
            </ul>
        </div>

    </main>
    <script>
        desplegarMenu();
        // Obtenemos la lista de elementos 'a' dentro del elemento con id 'genero'
        var enlacesGenero = document.getElementById('genero').getElementsByTagName('a');

        // Iteramos sobre cada enlace y agregamos el evento 'click'
        for (var i = 0; i < enlacesGenero.length; i++) {
            enlacesGenero[i].addEventListener('click', function(event) {
                event.preventDefault();

                var selectedGenero = this.getAttribute('generoPelicula');

                // Ocultamos todas las películas
                var peliculas = document.getElementsByClassName('pelicula-item');
                for (var j = 0; j < peliculas.length; j++) {
                    peliculas[j].style.display = 'none';
                }

                // Muestramos todas las películas si se selecciona "todos"
                if (selectedGenero === 'todos') {
                    for (var l = 0; l < peliculas.length; l++) {
                        peliculas[l].style.display = 'block';
                    }
                } else {
                    // Muestramos solo las películas del género seleccionado
                    var peliculasFiltradas = document.getElementsByClassName('pelicula-item ' + selectedGenero);
                    for (var k = 0; k < peliculasFiltradas.length; k++) {
                        peliculasFiltradas[k].style.display = 'block';
                    }
                }
            });
        }
    </script>
</body>

</html>