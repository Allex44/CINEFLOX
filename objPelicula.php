<?php 
class objPelicula{
    private $id_pelicula;
    public $portada;
    public $titulo;
    public $duracion;
    public $director;
    public $calificacion;
    public $actores;
    public $anno;
    public $pais;
    public $genero;
    public $sinopsis;

    public function __construct($id_pelicula, $portada, $titulo, $duracion, $director, $calificacion, $actores, $anno, $pais, $genero, $sinopsis)
    {
        $this->id_pelicula = $id_pelicula;
        $this->portada = $portada;
        $this->titulo = $titulo;
        $this->duracion = $duracion;
        $this->director = $director;
        $this->calificacion = $calificacion;
        $this->actores = $actores;
        $this->anno = $anno;
        $this->pais = $pais;
        $this->genero = $genero;
        $this->sinopsis = $sinopsis;

    }

    // Getter para obtener el valor de id_pelicula
    public function getIdPelicula()
    {
        return $this->id_pelicula;
    }
}
?>