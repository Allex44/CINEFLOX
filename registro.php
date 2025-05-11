<?php

include "consultas.php";

if (isset($_POST['registrar'])) {

  $nombre = $_POST['nombreUsuario'];
  $nick = $_POST['nick'];
  $contraseña = $_POST['contraseña'];
  $confirmarContraseña = $_POST['confirmarContraseña'];
  $email = $_POST['email'];
  $telefono = $_POST['telefono'];

  //si los campos de contraseña y confirmaContraseña no coinciden
  if ($_POST['contraseña'] != $_POST['confirmarContraseña']) {
    $mensaje = "La contraseña no coincide.";
    echo "<script> alert('$mensaje')</script>";
  } else {
    //preparamos la consulta SQL para comprobar si hay coincidencia de los campos nick, email, telefono 
    $sql = "SELECT * FROM usuarios WHERE EXISTS (SELECT * FROM usuarios WHERE nick = '$nick' OR email = '$email' OR telefono = '$telefono') ";

    //ejecutamos la consulta y guardamos el resultado
    $resultado = sentenciar($sql);

    //contamos el número de filas que devuelve la consulta
    $num_filas = mysqli_num_rows($resultado);


    //si el número de filas es mayor que cero, significa que hay coincidencia
    if ($num_filas > 0) {

      //creamos una variable para almacenar el mensaje de alerta
      $mensaje = "";

      //recorremos el resultado de la consulta y comparamos los valores, con los que hemos introducido
      while ($fila = mysqli_fetch_assoc($resultado)) {

        if ($fila['nick'] == $nick) {
          //si el nick coincide, lo añadimos al mensaje
          $mensaje .= "nick no valido, ";
        }

        if ($fila['email'] == $email) {
          //si el email coincide, lo añadimos al mensaje
          $mensaje .= "email no valido, ";
        }
        if ($fila['telefono'] == $telefono) {
          //si el telefono coincide, lo añadimos al mensaje
          $mensaje .= "telefonono no valido, ";
        }
      }

      //eliminamos la última coma del mensaje
      $mensaje = rtrim($mensaje, ", ");

      //mostramos el mensaje de alerta con el echo y el script de JavaScript
      echo "<script> alert('$mensaje')</script>";

      //si el número de filas es cero, significa que no hay coincidencia y podemos insertar los datos en la tabla
    } else {      
      //preparamos la consulta SQL para insertar los datos en la tabla
      $consulta = "INSERT INTO usuarios (nombre,nick,contraseña,email,telefono) VALUES ('$nombre','$nick','$contraseña','$email',$telefono)";

      //ejecutamos la consulta
      sentenciar($consulta);

      //hacemos redireccion al inicio de sesion
      header('Location: inisesion.php');
      exit;
    }
  }
}

?>

<!DOCTYPE html>
<html lang="es">

<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrarse</title>
    <link rel="stylesheet" href="./css/style_form.css">
    <link rel="icon" href="./Logos/foto LOGO.png" type="image/png">
</head>

<body>
  <form class="registro" action="registro.php" method="post">
    <h3 class="registro">Registrarse</h3>

    <label class="registro" for="nombreUsuario">Nombre de usuario</label>
    <input class="registro" type="text" id="nombreUsuario" name="nombreUsuario" required>

    <label class="registro" for="nick">Nick</label>
    <input class="registro" type="text" id="nick" name="nick" required>

        <label class="registro" for="contraseña">Contraseña</label>
        <input class="registro" type="password" id="contraseña" name="contraseña">

    <label class="registro" for="confirmarContraseña">Confirmar Contraseña</label>
    <input class="registro" type="password" id="confirmarContraseña" name="confirmarContraseña" required>

    <label class="registro" for="email">Correo electrónico</label>
    <input class="registro" type="email" id="email" name="email" required>

    <label class="registro" for="telefono">Teléfono</label>
    <input class="registro" type="number" id="telefono" name="telefono" required>

        <input class="boton" type="submit" name="registrar" value="Registrarse">
    </form>

    </div>
</body>

</html>