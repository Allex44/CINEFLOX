<?php
class usuario
{
    private $id_usuario;
    public $nombre;
    public $nick;
    public $contraseña;
    public $email;
    public $telefono;

    public function __construct($nombre, $nick, $contraseña, $email, $telefono, $id_usuario)
    {
        $this->nombre = $nombre;
        $this->nick = $nick;
        $this->contraseña = $contraseña;
        $this->email = $email;
        $this->telefono = $telefono;
        $this->id_usuario = $id_usuario;
    }
    //funcion para destruir la sesion
    function borrarSesion()
    {
        $_SESSION = array(); //limpiamos la array de la sesion
        session_regenerate_id(true); //regenerar la id
        session_destroy(); //cerrar sesion
    }

    // Getter para obtener el valor de id_usuario
    public function getIdUsuario()
    {
        return $this->id_usuario;
    }
}
