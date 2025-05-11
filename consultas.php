<?php
//funcion para crear conexion
function conexion()
{
    $host = "localhost";
    $user = "root";
    $password = "";
    $dbname = "cineflox";
    $port = 3306;
    $socket = "";

    $conexion = mysqli_connect($host, $user, $password, $dbname, $port, $socket);

    if ($conexion->connect_error) {
        die("conexion fallida" . $conexion->connect_error);
    }
    return $conexion;
}

//funcion para consulatas de datos en BBDD
function sentenciar($consulta)
{
    $conexion = conexion();
    $resultado = $conexion->query($consulta);

    if ($resultado == true) {
        mysqli_close($conexion);
        return $resultado;
    //cuando hacemos un SELECT          
    }else if($resultado -> num_rows > 0){
        mysqli_close($conexion);
        return $resultado -> fetch_assoc();
    }
    else {
        mysqli_close($conexion);
        return $resultado;      
    }
}







