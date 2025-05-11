<?php
include "usuario.php";
include "consultas.php";

session_start();

//destruir la sesion
if (isset($_POST['cerrarSesion'])) {

    //cerramos sesion de usuario   
    $_SESSION['usuario']->borrarSesion();
    //hacemos redireccion a la pagina del foro pero antes mostramos el alert
    echo "<script>alert('Sesion cerrada.'); window.location.href='./index.php';</script>";
    exit;
}

// Cambiar contraseña
if (isset($_POST['enviar'])) {

    //si los campos de contraseña y confirmaContraseña no coinciden
    if ($_POST['nueva'] != $_POST['confirmacion']) {

        $mensaje = "La contraseña no coincide.";
        echo "<script> alert('$mensaje')</script>";
    } else {

        // Si obtenemos correctamente la id_usuario de la sesión
        $id_usuario = $_SESSION['usuario']->getIdUsuario();
        //Guardamos la contraseña nueva
        $nuevaContraseña = $_POST['nueva'];
        //Sentencia para actualizar la contraseña del usuario segun su ID
        $sql = "UPDATE usuarios SET contraseña = '$nuevaContraseña' WHERE id_usuario = '$id_usuario' ";

        //ejecutamos la consulta y guardamos el resultado
        $resultado = sentenciar($sql);

        // Verificamos si hizo actualización 
        if ($resultado) {
            echo "<script>alert('Contraseña cambiada.');</script>";
        } else {
            echo "<script>alert('No se pudo cambiar la contraseña.');</script>";
        }
    }
}
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cambio Contraseña</title>
    <link rel="stylesheet" href="./css/style_form.css">
    <link rel="icon" href="./Logos/foto LOGO.png" type="image/png">
    <script src="./Js/script.js"></script>
</head>

<body>
    <!-- formulario de datos del usuario -->
    <form class="registro" id="datos" action="datosUsuario.php" method="post">
        <h3 class="registro">Datos de la Cuenta</h3>

        <label class="registro" for="nombre">Nombre:</label>
        <input class="registro" type="text" id="nombre" name="nombre" value="<?php echo (isset($_SESSION['usuario'])) ? $_SESSION['usuario']->nombre : ''; ?>" readonly>

        <label class="registro" for="nick">Nick</label>
        <input class="registro" type="text" id="nick" name="nick" value="<?php echo (isset($_SESSION['usuario'])) ? $_SESSION['usuario']->nick : ''; ?>"readonly>

        <label class="registro" for="contraseña">Contraseña:</label>
        <input class="registro" type="password" id="contraseña" name="contraseña" value="<?php echo (isset($_SESSION['usuario'])) ? $_SESSION['usuario']->contraseña : ''; ?>"readonly>

        <label class="registro" for="email">E-mail</label>
        <input class="registro" type="text" id="email" name="email" value="<?php echo (isset($_SESSION['usuario'])) ? $_SESSION['usuario']->email : ''; ?>"readonly>

        <label class="registro" for="telefono">telefono</label>
        <input class="registro" type="number" id="telefono" name="telefono" value="<?php echo (isset($_SESSION['usuario'])) ? $_SESSION['usuario']->telefono : ''; ?>"readonly>

        <input class="boton" type="button" name="cambioContraseña" value="Cambiar contraseña" onclick="mostrarFormulario();">
        <input class="boton" type="submit" name="cerrarSesion" value="Cerrar Sesión">
    </form>


    <!-- formulario para cambio de contraseña -->
    <form class='cambioContra' id="cambios" action='datosUsuario.php' method='post'>
        <h3 class="registro">Cambiar Contraseña</h3><br><br>

        <label class='registro' for='nueva'>Introduzca Contraseña Nueva</label>
        <input class='registro' type='password' name='nueva' required>

        <label class='registro' for='confirmacion'>Confirme la Contraseña</label>
        <input class='registro' type='password' name='confirmacion' required>

        <input class="boton" class='registro' type='submit' name='enviar' value='Enviar'>
    </form>

    <script>
        function mostrarFormulario() {
            // Ocultar el formulario de datos
            document.getElementById('datos').style.display = 'none';
            // Mostrar el formulario de cambios
            document.getElementById('cambios').style.display = 'block';
        }
    </script>
</body>

</html>