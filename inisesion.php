<?php
include "./usuario.php";
include "./consultas.php";
session_start();

if (isset($_POST['iniciarSesion'])) {

  $email = $_POST['email'];
  $contraseña = $_POST['contraseña'];

  //preparamos la consulta SQL para comprobar si hay coincidencia de los campos nombre y contraseña 
  $sql = "SELECT * FROM usuarios WHERE email = '$email' AND contraseña = '$contraseña'";

  //ejecutamos la sentencia y la guardamos en la variable
  $resultado = sentenciar($sql);

  //contamos el número de filas que devuelve la consulta
  $num_filas = mysqli_num_rows($resultado);

  //si el número de filas es mayor que cero, significa que hay coincidencia
  if ($num_filas > 0) {

    //recorremos el resultado de la consulta
    $fila = $resultado->fetch_assoc();

    //creamos un objeto usuario
    $usuario = new usuario($fila['nombre'], $fila['nick'], $fila['contraseña'], $fila['email'], $fila['telefono'], $fila['id_usuario']);
  
    //guardamos la objeto $usuario en una variable de sesion
    $_SESSION['usuario'] = $usuario;

     // Redirige a index.php
    header("Location: index.php");
    exit;

  } else {
    //Echo para mostrar un alert en caso de que no se pueda iniciar sesion por que los datos no coincidan
    echo "<script>alert('No se ha podido iniciar sesion, revise sus datos')</script>";

  }
}
?>

<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Inicio Sesión</title>
  <link rel="stylesheet" href="./css/style_form.css">
  <link rel="icon" href="./Logos/foto LOGO.png" type="image/png">
</head>

<body>
  <form action="inisesion.php" method="post">
    <h3>Inicia Sesión</h3>

    <label for="email">Cuenta de correo</label>
    <input type="text" id="email" name="email">

    <label for="contraseña">Contraseña</label>
    <input type="password" id="contraseña" name="contraseña">    

    <input type="submit" class="boton" name="iniciarSesion" value="Iniciar Sesión">
    <p>¿No tienes cuenta? <a href="registro.php">Registrate</a></p>
    <p><a href="index.php">Regresar a CineFloX</a></p>
  </form>

</body>

</html>