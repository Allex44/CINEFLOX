<?php
include "consultas.php";
include "objPelicula.php";
include "usuario.php";
session_start();
/* ====================================================================================================================================================
                                        HACER UN COMENTARIO SOBRE UNA PELICULA
======================================================================================================================================================= */
// Lógica para hacer comentarios solo si se ha iniciado sesión
$mensaje = '';
//Hacemos los comentarios
if (isset($_SESSION['usuario']) && isset($_POST['enviarComentario'])) {
    // Obtenemos el comentario del formulario
    $comentario = $_POST['comentarios'];

    // Obtenemos el ID de la película de los parámetros de la URL
    $idPelicula = $_GET['id'];

    // Obtenemos el ID del usuario actual
    $idUsuario = $_SESSION['usuario']->getIdUsuario();

    // Obtenemos la fecha actual Formato: YYYY-MM-DD HH:MM:SS
    $fechaComentario = date('Y-m-d H:i:s');

    // Realizamos la inserción del comentario en la base de datos
    $sql = "INSERT INTO foro (id_pelicula, id_usuario, comentario, fecha) VALUES ('$idPelicula', '$idUsuario', '$comentario', '$fechaComentario')";
    $resultado = sentenciar($sql);
} elseif (!isset($_SESSION['usuario']) && isset($_POST['enviarComentario'])) {
    // Configuramos el mensaje en caso de que no se halla iniciado sesion
    $mensaje = 'Debe iniciar sesión para publicar un comentario.';
    echo '<script>alert("' . $mensaje . '");</script>';
}
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cineflox</title>
    <link rel="stylesheet" href="./css/style_form.css">
    <link rel="icon" href="./Logos/LOGO.png" type="image/png">
    <script src="./Js/script.js"></script>
</head>

<body>
    <header class="pelicula">
        <div class="logoPeli">
            <img src="./Logos/foto LOGO.png" class="foto peli" height="50px" width="50px">
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
        </div>
    </header>

    <main>
        <?php
        /* ======================================================================================================================================================
                                                MOSTRAR LO DATOS Y LA FOTO DE LAS PELICULAS
        ========================================================================================================================================================= */
        // Verificamos si se proporcionó un ID de película en los parámetros de la URL
        if (isset($_GET['id'])) {
            // Obtenemos el ID de la película de los parámetros de la URL
            $idPelicula = $_GET['id'];

            // Sentencia SQL para obtener los detalles de la película por ID
            $sql = "SELECT * FROM peliculas WHERE id_pelicula = $idPelicula";

            // Ejecutamos la sentencia SQL y obtenemos el resultado
            $resultado = sentenciar($sql);

            // Verificamos si hay al menos una película con ese ID
            if ($fila = $resultado->fetch_assoc()) {
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

                // Mostramos la portada de la película
                echo '<div class="seccionPeli">';
                echo '<div class="fotoPeli">';
                echo '<img src="' . $pelicula->portada . '" >';
                /* echo '</div>'; */
                // Mostrar otros detalles de la película aquí
                echo '<div class="datosPeli">'; 
                echo '<h2>' . $pelicula->titulo . '</h2>';
                echo '<p>Duración: ' . $pelicula->duracion . ' minutos</p>';
                echo '<p>Director: ' . $pelicula->director . '</p>';
                echo '<p>Calificación: ' . $pelicula->calificacion . '</p>';
                echo '<p>Actores: ' . $pelicula->actores . '</p>';
                echo '<p>Año: ' . $pelicula->anno . '</p>';
                echo '<p>Pais: ' . $pelicula->pais . '</p>';
                echo '<p>Genero: ' . $pelicula->genero . '</p>';
                echo '</div>'; 
                echo '</div>';
                echo '<div class="sinapsis">';
                echo '<p>Sinopsis: ' . $pelicula->sinopsis . '</p>';
                echo '</div>';

        ?>
                <!-- Formulario para enviar comentarios -->
                <div class="comentarioArea">
                    <form class="comentarioArea" action="" method="post">
                        <label class="comentarios" for="comentarios">Inserta tu comentario:</label><br>
                        <textarea id="comentarios" class="comentario" name="comentarios" rows="4" cols="130" maxlength="1000" placeholder="Comente aqui ->" style="resize: none;"></textarea>
                        <button class="boton Comentarios" id="enviarComentario" name="enviarComentario">Enviar Comentario</button>
                    </form>
                </div>
        <?php
                
            }
        }
    /* ===========================================================================================================================================================
                                            PARA MOSTRAR COMENTARIOS EN PELICULA, DEL MAS ACTUAL AL MAS AUNTIGUO
    ================================================================================================================================================================ */
    // Número de comentarios por página
    $comentariosPorPagina = 10;

    // Página actual, por defecto 1
    $paginaActual = isset($_GET['pagina']) ? $_GET['pagina'] : 1;

    $limiteInferior = ($paginaActual - 1) * $comentariosPorPagina;

    //Consulta SQL para obtener los comentarios más recientes
    $sqlComentarios = "SELECT DISTINCT f.id_comentario, f.id_usuario, f.id_pelicula, f.comentario, f.fecha, u.nick
                        FROM foro f
                        JOIN usuarios u ON f.id_usuario = u.id_usuario
                        WHERE f.id_pelicula = $idPelicula 
                        ORDER BY f.fecha DESC 
                        LIMIT $limiteInferior, $comentariosPorPagina";

    $resultadoComentarios = sentenciar($sqlComentarios);

    // Función para obtener el número total de comentarios
    function obtenerTotalComentarios($idPelicula)
    {
        // Consulta SQL para obtener el número total de comentarios
        $sqlTotalComentarios = "SELECT COUNT(*) as total FROM foro WHERE id_pelicula = $idPelicula";

        // Ejecutamos la consulta y obtén el resultado
        $resultadoTotalComentarios = sentenciar($sqlTotalComentarios);

        // Obtenemos el valor total de la consulta
        $filaTotalComentarios = $resultadoTotalComentarios->fetch_assoc();
        $totalComentarios = $filaTotalComentarios['total'];

        // Devolvemos el número total de comentarios
        return $totalComentarios;
    }
    // Calculamos el número total de páginas
    $totalComentarios = obtenerTotalComentarios($idPelicula);
    $totalPaginas = ceil($totalComentarios / $comentariosPorPagina);


    ?>
    <!-- Contenedor para mostrar los comentarios y la paginación -->
    <div class="comentariosContenedor">
            <?php
            // Mostramos los comentarios
            while ($filaComentario = $resultadoComentarios->fetch_assoc()) {
                echo '<div class="comentario">';
                echo '<p class="nick">' . $filaComentario['nick'] . '</p>';
                echo '<p>' . $filaComentario['comentario'] . '</p>';
                echo '<p class="fecha">' . $filaComentario['fecha'] . '</p>';
                echo '</div>';
            }
            // Mostramos enlaces de paginación
            echo '<div class="paginacion">';
            for ($i = 1; $i <= $totalPaginas; $i++) {
                echo '<a class="paginacion" href="?id=' . $idPelicula . '&pagina=' . $i . '">' . $i . '</a>';
            }
            echo '</div>';
            ?>
    </div>
    <!-- Enlace para volver a la página principal -->
    <div class="volverIndex">
        <a href="index.php">
        <<< Página principal</a>
    </div>
    </main>
    <script>
        desplegarMenu();
    </script>
</body>

</html>