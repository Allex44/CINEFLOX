CREATE DATABASE cineflox; 
USE cineflox;


CREATE TABLE IF NOT EXISTS peliculas(
    id_pelicula INT UNSIGNED AUTO_INCREMENT NOT NULL,
    portada VARCHAR(100) NOT NULL,
    titulo VARCHAR (50) UNIQUE NOT NULL,
    duracion INT(3) NOT NULL,
    director VARCHAR(30) NOT NULL,
    calificacion VARCHAR(3) NOT NULL,
    actores VARCHAR(90) NOT NULL,
    anno INT (4) NOT NULL,
    pais VARCHAR(40) NOT NULL,
    genero VARCHAR(20) NOT NULL,
    sinopsis VARCHAR(1000) NOT NULL,
    PRIMARY KEY (id_pelicula)
);


CREATE TABLE IF NOT EXISTS genero(
    id_genero INT UNSIGNED AUTO_INCREMENT NOT NULL,
    genero VARCHAR (50) NOT NULL,
    PRIMARY KEY (id_genero)
);


CREATE TABLE IF NOT EXISTS genero_pelicula(
    id_genero_pelicula INT UNSIGNED AUTO_INCREMENT NOT NULL,
    id_pelicula INT UNSIGNED NOT NULL,
    id_genero INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_pelicula) REFERENCES peliculas(id_pelicula) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_genero) REFERENCES genero(id_genero) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (id_genero_pelicula)
);


CREATE TABLE IF NOT EXISTS usuarios(
    id_usuario INT UNSIGNED AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(60) NOT NULL,
    nick VARCHAR(20) UNIQUE NOT NULL,
    contraseña VARCHAR(16) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    telefono INT(9) UNIQUE NOT NULL,
    roll BOOLEAN DEFAULT(0) NOT NULL,
    PRIMARY KEY (id_usuario)
);

CREATE TABLE IF NOT EXISTS foro(
    id_comentario INT UNSIGNED AUTO_INCREMENT NOT NULL,
    id_pelicula INT UNSIGNED NOT NULL,
    id_usuario INT UNSIGNED NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    comentario VARCHAR(10000) NOT NULL,
    FOREIGN KEY (id_pelicula) REFERENCES peliculas(id_pelicula) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    PRIMARY KEY(id_comentario)
);

USE cineflox;

INSERT INTO genero (genero) VALUES ("Terror");
INSERT INTO genero (genero) VALUES ("Accion");
INSERT INTO genero (genero) VALUES ("Animacion");
INSERT INTO genero (genero) VALUES ("Aventura");
INSERT INTO genero (genero) VALUES ("Ciencia ficcion");
INSERT INTO genero (genero) VALUES ("Comedia");
INSERT INTO genero (genero) VALUES ("Novela negra");
INSERT INTO genero (genero) VALUES ("Drama");
INSERT INTO genero (genero) VALUES ("Infantil");
INSERT INTO genero (genero) VALUES ("Romance");

USE cineflox;

INSERT INTO peliculas (portada,titulo,duracion,
director,calificacion,actores,anno,pais,genero,sinopsis) 
VALUES ("img/Saw_X.jpg","Saw X", "118", "Kevin Greutert", "+18", "Tobin Bell, Shawnee Smith, Steven Brand",
"2023", "EEUU", "Terror", "Situada entre los acontecimientos sucedidos en SAW y SAW II, John, desesperado y enfermo, 
viaja a México para someterse a un tratamiento experimental y muy arriesgado con la esperanza de curar su cáncer mortal.
 Sin embargo, toda la operación resulta ser un fraude para engañar a aquellos más vulnerables. Lleno de rabia y con un nuevo y escabroso propósito,
 John retomará su trabajo como asesino en serie y dará a probar su propia medicina a los embaucadores. Bajo la atenta mirada de Jigsaw, los jóvenes 
 se enfrentaran a las trampas más ingeniosas,
 mortales y tortuosas en un visceral y despiadado juego.");


INSERT INTO peliculas (portada,titulo,duracion,
director,calificacion,actores,anno,pais,genero,sinopsis) 
VALUES ("img/BlackFriday.jpg", "Black Friday", "87", "Eli Roth", "+16", "------", "2023", "EEUU", "Terror", 
"Tras un Black Friday en el que se producen disturbios que acaban en tragedia,
 un misterioso asesino aterroriza Plymouth, en Massachusetts.");


INSERT INTO peliculas (portada,titulo,duracion,
director,calificacion,actores,anno,pais,genero,sinopsis) 
VALUES ("img/Exorcista.jpg", "El Exorcista -Creyente-", "110", "David Gordon Green", "+16",
"Ellen Burstyn, Jennifer Nettles, Ann Dowd", "2023", "EEUU", "Terror",
"Desde que falleció su esposa embarazada en el terremoto de Haití hace doce años, Victor Fielding (interpretado por Leslie Odom, Jr.,
ganador de un Tony y nominado a un Oscar; UNA NOCHE EN MIAMI, HAMILTON) se ha encargado de cuidar de Angela (Lidya Jewett, la serie CHICAS BUENAS),
la hija de ambos. Pero cuando Angela y su amiga Katherine (la recién llegada Olivia Marcum) desaparecen en un bosque durante tres días y a su regreso 
no recuerdan nada de lo que les pasó, se desata una serie de acontecimientos que obligarán a Victor a enfrentarse a la cúspide del mal. Desesperado y aterrado,
decide pedir ayuda a Chris MacNeil, la única persona que ha sido testigo de algo parecido.");


INSERT INTO peliculas (portada,titulo,duracion,
director,calificacion,actores,anno,pais,genero,sinopsis) 
VALUES ("img/FNAF.jpg", "Five nights at freddy's", "109", "Emma Tammi", "+12", "Josh Hutcherson, Elizabeth Lail, Mary Stuart Masterson", "2023", "EEUU", "Terror", 
"El aterrador y exitoso juego de miedo se convierte en un evento cinematográfico cuando Blumhouse, 
la productora de M3GAN, BLACK PHONE y EL HOMBRE INVISIBLE, lleva FIVE NIGHTS AT FREDDYS a la gran pantalla.
 La película gira en torno a un atormentado guardia de seguridad que empieza a trabajar en Freddy Fazbears Pizza.
 En su primera noche de trabajo, se da cuenta de que no será nada fácil superar el turno de noche en la pizzería.");

INSERT INTO peliculas (portada,titulo,duracion,
director,calificacion,actores,anno,pais,genero,sinopsis) 
VALUES ("img/Hablame.jpg", "Hablame", "95", "Danny y Michael Philippou", "+18", "Sophie Wilde, Alexandra Jensen, Joe Bird, Miranda Otto", "2023", "EEUU", "Terror",
"Mia ha pasado años evitando el trauma de la muerte de su madre. 
Esto cambiará cuando sus amigos descubran cómo conjurar espíritus usando una mano embalsamada, lo que la llevará a enfrentar a un alma que dice ser su madre muerta.");


INSERT INTO peliculas (portada,titulo,duracion,
director,calificacion,actores,anno,pais,genero,sinopsis) 
VALUES ("img/Hypnotic.jpg", "Hypnotic", "93", "Robert Rodriguez", "+16","Ben Affleck, Alice Braga, William Fichtner, Hala Finley", "2023", "EEUU", "Accion",
"Un detective investiga la desaparición de su hija y descubre que todo lo que cree saber sobre su realidad y su pasado es una mentira.
 Thriller de acción con tintes de ciencia-ficción que hará que el espectador se cuestione hasta su propia realidad.");


INSERT INTO peliculas (portada,titulo,duracion,
director,calificacion,actores,anno,pais,genero,sinopsis) 
VALUES ("img/juegos.jpg","Los juegos del Hambre - Balada de pajaros cantores y serpientes", "157", "Francis Lawrence", "+12", "Viola Davis, Rachel Zegler, Tom Blyth, Hunter Schafer", "2023", "EEUU", "Accion",
"Es la mañana de la cosecha que dará comienzo a los décimos Juegos del Hambre. En el Capitolio, Coriolanus Snow, de dieciocho años,
 se prepara para una oportunidad única: alcanzar la gloria como mentor de los Juegos. La casa de los Snow, antes tan influyente, atraviesa tiempos difíciles,
 y su destino depende de que Coriolanus consiga superar a sus compañeros en ingenio, estrategia y encanto como mentor del tributo que le sea adjudicado. Todo está en su contra.
 Lo han humillado al asignarle a la tributo del empobrecido Distrito 12. Ahora, sus destinos están irremediablemente unidos...");


INSERT INTO peliculas (portada,titulo,duracion,
director,calificacion,actores,anno,pais,genero,sinopsis) 
VALUES ("img/Napoleon.jpg", "Napoleón", "158", "Ridley Scott", "+16", "Joaquin Phoenix, Vanessa Kirby, Tahar Rahim, Ben Miles", "2023", "EEUU", "Accion",
"Napoleón es un espectáculo lleno de épica y acción que detalla el enrevesado ascenso y caída del icónico Emperador francés Napoleón Bonaparte, 
interpretado por el ganador del Oscar® Joaquim Phoenix. Tras un rodaje orquestado por el legendario director Ridley Scott sobre un deslumbrante telón de fondo a gran escala,
 la película muestra la incesante carrera de Bonaparte hasta el poder, a través del prisma de la adictiva y volátil relación con Josefina, la que fue su único amor verdadero,
 presentando sus visionarias tácticas políticas y militares a través de algunas de las secuencias prácticas de batallas más dinámicas jamás filmadas.");


INSERT INTO peliculas (portada,titulo,duracion,
director,calificacion,actores,anno,pais,genero,sinopsis) 
VALUES ("img/Freedom.jpg", "Sound of Freedom", "131", "Jorge Monteverde", "+16", "Mira Sorvino, Jim Cavaziel", "2023", "EEUU", "Accion", 
"Basada en hechos reales, SOUND OF FREEDOM narra la historia de Tim Ballard, ex agente de Seguridad Nacional de Estados Unidos que, tan solo hace 10 años,
lo dejó todo para luchar contra el tráfico de niños. Tras una década combatiendo peligrosas tramas mafiosas que raptan niños con los que comercian en redes sexuales, 
Ballard ha rescatado y salvado ya cientos de vidas inocentes, logrando sensibilizar a muchos de esta gran lacra de nuestro mundo.");


INSERT INTO peliculas (portada,titulo,duracion,
director,calificacion,actores,anno,pais,genero,sinopsis) 
VALUES ("img/Garza.jpg", "El chico y la garza", "123", "Hayao Miyazaki", "Todos los publicos", "--------", "2023", "EEUU", "Animacion", 
"Un joven llamado Mahito, que añora a su madre, se aventura en un mundo compartido por los vivos y los muertos.
 Allí, la muerte llega a su fin y la vida encuentra un nuevo comienzo. Una fantasía semiautobiográfica sobre la vida,
 la muerte y la creación, en homenaje a la amistad, de la mente de Hayao Miyazaki.");


INSERT INTO peliculas (portada,titulo,duracion,
director,calificacion,actores,anno,pais,genero,sinopsis) 
VALUES ("img/Wish.jpg", "Wish - El poder de los deseos", "94", "Chris Buck", "Todos los publicos", "----------", "2023", "EEUU", "Animacion",
"El poder de los deseos, Asha, una optimista con mucho ingenio, pide un deseo tan potente que le responde una fuerza cósmica,
 una pequeña bola de energía ilimitada llamada Estrella. Juntas, Asha y Estrella se enfrentan a un imponente enemigo, el Rey Magnífico, gobernante de Rosas,
 para salvar a su comunidad y demostrar que cuando la voluntad de una persona conecta con la magia de las estrellas, pueden ocurrir cosas maravillosas.");


INSERT INTO peliculas (portada,titulo,duracion,
director,calificacion,actores,anno,pais,genero,sinopsis) 
VALUES ("img/Jones.jpg","Indiana Jones y el dial del destino", "154", "James Mangold", "+12", "Harrison Ford, Phoebe Waller-Bridge, Mads Mikkelsen,Antonio Banderas", "2023", "EEUU", "Aventura",
"El arqueólogo Indiana Jones deberá emprender otra aventura contra el tiempo para intentar recuperar un dial legendario que puede cambiar el curso de la historia.
 Acompañado por su ahijada, Jones pronto se encuentra enfrentándose a Jürgen Voller, un ex nazi que trabaja para la NASA.");


INSERT INTO peliculas (portada,titulo,duracion,
director,calificacion,actores,anno,pais,genero,sinopsis) 
VALUES ("img/Anillos.jpg", "El señor de los anillos -El retorno del rey", "253", "Peter Jackson", "+12", "Elijah Wood, Viggo Mortensen, Ian McKellen, Liv Tyler", "2003", "EEUU",
"Aventura", "Revive en cines la trilogia restaurada en 4K en su 20 Aniversario. Un anillo para gobernarlos a todos. 
Un anillo para encontrarlos, un anillo para atraerlos a todos y atarlos en las tinieblas. En la película final de EL SEÑOR DE LOS ANILLOS,
 la épica obra maestra de J. R. R. Tolkien, mientras los ejércitos se dirigen en masa a la batalla final que decidirá el destino del mundo,
 y las poderosas y antiguas fuerzas de la luz y la oscuridad se enfrentan entre sí tratando de imponerse, 
un miembro de la Comunidad del Anillo resulta ser el noble heredero al trono de los Reyes de los Hombres. 
Sin embargo, la única esperanza de triunfar sobre el mal reside en un valiente hobbit, Frodo, quien acompañado tan solo por su fiel amigo Sam y por el horrible y desdichado Gollum,
 se adentra en el sombrío corazón de Mordor con una misión aparentemente imposible: destruir el Anillo de Poder.");


INSERT INTO peliculas (portada,titulo,duracion,
director,calificacion,actores,anno,pais,genero,sinopsis) 
VALUES ("img/Spiderman.jpg", "Spiderman No way home", "148", "Jon Watts", "+7", "Tom Holland, Zendaya, Benedict Cumberbatch, Willem Dafoe", "2021", "EEUU", "Ciencia ficcion",
"Por primera vez en la historia cinematográfica de Spider-Man, nuestro héroe, vecino y amigo es desenmascarado, 
y por tanto, ya no es capaz de separar su vida normal de los enormes riesgos que conlleva ser un superhéroe. 
Cuando pide ayuda al Doctor Strange, los riesgos pasan a ser aún más peligrosos, obligándole a descubrir lo que realmente significa ser él. Secuela de 'Spider-Man: Far From Home'.");


INSERT INTO peliculas (portada,titulo,duracion,
director,calificacion,actores,anno,pais,genero,sinopsis) 
VALUES ("img/Marvels.jpg", "The Marvels", "104", "Nia Dacosta", "+7", "Samuel L. Jackson, Brie Larson, Teyonah Parris, Iman Vellani", "2023", "EEUU", "Ciencia ficcion", 
"Carol Danvers, alias Capitana Marvel, ha recuperado su identidad de los tiránicos Kree y se ha vengado de la Inteligencia Suprema. 
Pero unas consecuencias imprevistas hacen que Carol cargue con el peso de un universo desestabilizado. 
Cuando sus obligaciones la envían a un agujero de gusano anómalo vinculado a un revolucionario Kree, sus poderes se enredan con los de su superfan de Jersey, Kamala Khan,
 también conocida como Ms. Marvel y los de su sobrina, a la que llevaba tiempo sin ver, la Capitana Monica Rambeau. Juntas,
 este insólito trío deberá formar un equipo y aprender a trabajar unidas para salvar el universo como 'The Marvels'.");


INSERT INTO peliculas (portada,titulo,duracion,
director,calificacion,actores,anno,pais,genero,sinopsis) 
VALUES ("img/Alimanas.jpg", "Alimañas", "84", "Pep Anton Gómez", "Todos los publicos", "Jordi Sánchez, Carlos Areces", "2023", "ESPAÑA", "Comedia",
"ALIMAÑAS es una comedia negra para todos los públicos protagonizada por dos hermanos muy diferentes, Carlos y Paco, interpretados por Carlos Areces y el propio Jordi Sánchez,
a los que les une la ambición por heredar un edificio propiedad de su anciana madre,
edificio en el que ambos tienen puestas todas sus esperanzas para mejorar su precaria situación económica.");


INSERT INTO peliculas (portada,titulo,duracion,
director,calificacion,actores,anno,pais,genero,sinopsis) 
VALUES ("img/Favor.jpg", "El Favor", "97", "Juana Macías", "+12", "Inma Cuesta, Diego Martín, Sara Sálamo, Alfonso Bassave", "2023", "ESPAÑA", "Comedia",
"Los Gallardo son una familia rica y respetada que veranea en una preciosa masía cuidada hasta el más mínimo detalle por Amparito, 
la queridísima Tata, que, para los tres hijos de la familia, Teresa, Benja y Aura, ha sido como una segunda madre. 
Cuando reciben la triste noticia de su muerte, los tres hermanos viajan al pueblo para darle el último adiós y reencontrarse con Tomás, 
único hijo de la difunta. Lo que no esperaban es que la última voluntad de Amparito fuese ser enterrada en el panteón familiar. 
Los Gallardo lo tienen claro: ¡ni de broma! Tras negarse a cumplir este favor, reciben el legado de Amparito: unas cartas en las que la familia no encontrará una amable despedida, 
sino una venganza en forma de trapos sucios y verdades hirientes que harán que todo salte por los aires. ¡La madre que parió a la Tata!");

INSERT INTO peliculas (portada,titulo,duracion,
director,calificacion,actores,anno,pais,genero,sinopsis) 
VALUES ("img/MisterioVenecia.jpg", "Misterio en venecia", "103", "Kenneth Branagh", "+12", "Kenneth Branagh, Kyle Allen, Camille Cottin", "2023", "EEUU", "Novela negra",
"En la Venecia posterior a la Segunda Guerra Mundial, Poirot, ahora retirado y viviendo en su propio exilio, asiste a regañadientes a una sesión de espiritismo,
 cuando uno de los invitados es asesinado, por lo que depende del ex detective descubrir una vez más al asesino.");


INSERT INTO peliculas (portada,titulo,duracion,
director,calificacion,actores,anno,pais,genero,sinopsis) 
VALUES ("img/MuerteNilo.jpg", "Muerte en el nilo", "127", "Kenneth Branagh", "+12", "Gal Gadot, Armie Hammer, Letitia Wright", "2022", "EEUU", "Novela negra",
"Basada en la novela de Agatha Christie, publicada en 1937. 'Muerte en el Nilo' 
es un thriller de misterio dirigido por Kenneth Branagh sobre el caos emocional y las consecuencias letales que provocan los amores obsesivos. 
Las vacaciones egipcias del detective belga Hércules Poirot, a bordo de un glamuroso barco de vapor,
 se ven alteradas por la búsqueda de un asesino cuando la idílica luna de miel de una pareja perfecta se ve truncada de la forma más trágica.");


INSERT INTO peliculas (portada,titulo,duracion,
director,calificacion,actores,anno,pais,genero,sinopsis) 
VALUES ("img/AsesinosLuna.jpg", "Los asesinos de la Luna", "206", "Martin Scorsese", "+16", "Robert De Niro, Leonardo Dicaprio, Jesse Plemons, Lily Gladstone", "2023", "EEUU", "Drama",
"Dirigida por Martin Scorsese con un guion de Scorsese y Eric Roth basado en el aclamado bestseller de David Grann, 
'Los asesinos de la luna' está ambientada en la década de 1920 en Oklahoma y narra los asesinatos en serie de varios miembros de la nación indígena Osage,
 rica en petróleo: una serie de crímenes brutales que llegaron a ser conocidos como 'el reinado del terror'. La película está protagonizada por Leonardo DiCaprio,
 Robert DeNiro, Lily Gladstone, Jesse Plemons, Cara Jade Myers, JaNae Collins, Jillian Dion y Tantoo Cardinal.");


INSERT INTO peliculas (portada,titulo,duracion,
director,calificacion,actores,anno,pais,genero,sinopsis) 
VALUES ("img/ZoeTempestad.jpg", "Zoe y tempestad", "110", "Christian Duguay", "+7", "Mélanie Laurent, Pio Marmaï, Kacey Mottet Klein", "2023", "FRANCIA", "Drama",
"Nacida y criada entre caballos, Zoe lleva una vida feliz impulsada por el sueño de convertirse algún día en jinete, al igual que su padre. 
El caballo preferido de Zoe da a luz a un potro al que llaman Tempestad. Ella será la primera en ver en él al campeón que su familia ha estado esperando siempre.
 Sin embargo, un grave accidente amenazará con poner todo eso en peligro.");

 

INSERT INTO peliculas (portada,titulo,duracion,
director,calificacion,actores,anno,pais,genero,sinopsis) 
VALUES ("img/PatrullaCanina.jpg", "La patrulla canina", "88", "Cal Brunker", "Todos los publicos", "------", "2023", "EEUU", "Infantil",
"Cuando un meteorito mágico se estrella en Ciudad Aventura, los cachorros de la Patrulla Canina consiguen unos superpoderes que los transforman en ¡Los Poderosos Cachorros! 
Para Skye, la más pequeña del equipo, sus nuevos poderes son un sueño hecho realidad. Pero las cosas se complican cuando Humdinger, 
el archienemigo de los cachorros que acaba de fugarse de la cárcel, se une a Victoria Vance, una desquiciada científica obsesionada con los meteoritos,
 y forman una alianza para robar los superpoderes y convertirse en supervillanos. Con el destino de Ciudad Aventura al filo del abismo,
 los Poderosos Cachorros tendrán que detener a los supervillanos antes de que sea demasiado tarde,
 y Skye descubrirá que hasta la más pequeña del equipo puede ser la que determine el resultado.");
 

INSERT INTO peliculas (portada,titulo,duracion,
director,calificacion,actores,anno,pais,genero,sinopsis) 
VALUES ("img/Trolls3.jpg", "Trolls 3 - Todos Juntos", "91", " Walt Dohrn , Tim Heitz", "Todos los publicos", "--------", "2022", "EEUU", "Infantil", 
"En TROLLS 3, Poppy y Branch se convierten en pareja (#broppy) y mientras se acercan, Poppy descubre el pasado secreto de Branch.
 Él solía formar parte de la boyband BroZone con sus hermanos: Floyd, John Dory, Spruce y Clay.
 La banda y la familia se separaron cuando Branch era bebé y no ha visto a sus hermanos desde entonces.
 Cuando Floyd es secuestrado por las maléficas estrellas del pop Velvet y Veneer, Branch y Poppy se embarcan en un emocionante viaje para reunir a la familia y rescatar a Floyd.
 Esta película es la tercera entrega de la saga 'Trolls'.");


INSERT INTO peliculas (portada,titulo,duracion,
director,calificacion,actores,anno,pais,genero,sinopsis) 
VALUES ("img/Sombras2.jpg", "50 sombras de grey 2", "115", "James Foley", "+16", "Dakota Johnson, Jamie Dornan, Bella Heathcote", "2017", "EEUU", "Romance",
"Cuando Christian Grey, que se siente herido, intenta convencer a Anastasia Steele de que vuelva a formar parte de su vida, ella le exige un nuevo acuerdo antes de aceptar.
 Pero cuando la pareja empieza a ser más confiada y a tener una cierta estabilidad, aparecen mujeres del pasado de Christian decididas a frenar en seco sus esperanzas de un futuro juntos... 
Secuela de '50 sombras de Grey', en la que Grey sigue explorando sus demonios interiores y la joven Anastasia 
confronta sus sentimientos y confusión sobre su relación con el atractivo millonario, un tipo misterioso lleno de secretos.");


INSERT INTO peliculas (portada,titulo,duracion,
director,calificacion,actores,anno,pais,genero,sinopsis) 
VALUES ("img/SombrasLiberadas.jpg", "50 sombras liberadas", "105", "James Foley","+16", "Dakota Johnson, Jamie Dornan, Bella Heathcote", "2018", "EEUU", "Romance",
"Creyendo que han dejado atrás las sombras del pasado, los recién casados Christian y Anastasia disfrutan de su relación y de su vida llena de lujos. 
Pero justo cuando Ana empieza a relajarse, aparecen nuevas amenazas que ponen en riesgo su felicidad. Adaptación del final de '50 sombras de Grey'.");

USE cineflox;

INSERT INTO genero_pelicula (id_pelicula, id_genero) 
SELECT p.id_pelicula, g.id_genero 
FROM peliculas p , genero g
WHERE p.titulo = "Saw X" AND g.genero  = "Terror";


INSERT INTO genero_pelicula (id_pelicula, id_genero) 
SELECT id_pelicula, g.id_genero 
FROM peliculas p, genero g
WHERE p.titulo = "Black Friday" AND g.genero  = "Terror";

INSERT INTO genero_pelicula (id_pelicula, id_genero) 
SELECT p.id_pelicula, g.id_genero 
FROM peliculas p, genero g
WHERE p.titulo = "El Exorcista -Creyente-" AND g.genero  = "Terror";

INSERT INTO genero_pelicula (id_pelicula, id_genero) 
SELECT p.id_pelicula, g.id_genero 
FROM peliculas p, genero g
WHERE p.titulo = "Five nights at freddy's" AND g.genero  = "Terror";

INSERT INTO genero_pelicula (id_pelicula, id_genero) 
SELECT p.id_pelicula, g.id_genero 
FROM peliculas p, genero g
WHERE p.titulo = "Hablame" AND g.genero  = "Terror";

INSERT INTO genero_pelicula (id_pelicula, id_genero) 
SELECT p.id_pelicula, g.id_genero 
FROM peliculas p, genero g
WHERE p.titulo = "Hypnotic" AND g.genero  = "Accion";

INSERT INTO genero_pelicula (id_pelicula, id_genero) 
SELECT p.id_pelicula, g.id_genero 
FROM peliculas p, genero g
WHERE p.titulo = "Los juegos del Hambre - Balada de pajaros cantores y serpientes" AND g.genero  = "Accion";

INSERT INTO genero_pelicula (id_pelicula, id_genero) 
SELECT p.id_pelicula, g.id_genero 
FROM peliculas p, genero g
WHERE p.titulo = "Napoleón" AND g.genero  = "Accion";

INSERT INTO genero_pelicula (id_pelicula, id_genero) 
SELECT p.id_pelicula, g.id_genero 
FROM peliculas p, genero g
WHERE p.titulo = "Sound of Freedom" AND g.genero  = "Accion";

INSERT INTO genero_pelicula (id_pelicula, id_genero) 
SELECT p.id_pelicula, g.id_genero 
FROM peliculas p, genero g
WHERE p.titulo = "El chico y la garza" AND g.genero  = "Animacion";

INSERT INTO genero_pelicula (id_pelicula, id_genero) 
SELECT p.id_pelicula, g.id_genero 
FROM peliculas p, genero g
WHERE p.titulo = "Wish - El poder de los deseos" AND g.genero  = "Animacion";

INSERT INTO genero_pelicula (id_pelicula, id_genero) 
SELECT p.id_pelicula, g.id_genero 
FROM peliculas p, genero g
WHERE p.titulo = "Indiana Jones y el dial del destino" AND g.genero  = "Aventura";

INSERT INTO genero_pelicula (id_pelicula, id_genero) 
SELECT p.id_pelicula, g.id_genero 
FROM peliculas p, genero g
WHERE p.titulo = "El señor de los anillos -El retorno del rey" AND g.genero  = "Aventura";

INSERT INTO genero_pelicula (id_pelicula, id_genero) 
SELECT p.id_pelicula, g.id_genero 
FROM peliculas p, genero g
WHERE p.titulo = "Spiderman No way home" AND g.genero  = "Ciencia ficcion";

INSERT INTO genero_pelicula (id_pelicula, id_genero) 
SELECT p.id_pelicula, g.id_genero 
FROM peliculas p, genero g
WHERE p.titulo = "The Marvels" AND g.genero  = "Ciencia ficcion";

INSERT INTO genero_pelicula (id_pelicula, id_genero) 
SELECT p.id_pelicula, g.id_genero 
FROM peliculas p, genero g
WHERE p.titulo = "Alimañas" AND g.genero  = "Comedia";

INSERT INTO genero_pelicula (id_pelicula, id_genero) 
SELECT p.id_pelicula, g.id_genero 
FROM peliculas p, genero g
WHERE p.titulo = "El Favor" AND g.genero  = "Comedia";

INSERT INTO genero_pelicula (id_pelicula, id_genero) 
SELECT p.id_pelicula, g.id_genero 
FROM peliculas p, genero g
WHERE p.titulo = "Misterio en venecia" AND g.genero  = "Novela negra";

INSERT INTO genero_pelicula (id_pelicula, id_genero) 
SELECT p.id_pelicula, g.id_genero 
FROM peliculas p, genero g
WHERE p.titulo = "Muerte en el nilo" AND g.genero  = "Novela negra";

INSERT INTO genero_pelicula (id_pelicula, id_genero) 
SELECT p.id_pelicula, g.id_genero 
FROM peliculas p, genero g
WHERE p.titulo = "Los asesinos de la Luna" AND g.genero  = "Drama";

INSERT INTO genero_pelicula (id_pelicula, id_genero) 
SELECT p.id_pelicula, g.id_genero 
FROM peliculas p, genero g
WHERE p.titulo = "Zoe y tempestad" AND g.genero  = "Drama";

INSERT INTO genero_pelicula (id_pelicula, id_genero) 
SELECT p.id_pelicula, g.id_genero 
FROM peliculas p, genero g
WHERE p.titulo = "La patrulla canina" AND g.genero  = "Infantil";

INSERT INTO genero_pelicula (id_pelicula, id_genero) 
SELECT p.id_pelicula, g.id_genero 
FROM peliculas p, genero g
WHERE p.titulo = "Trolls 3 - Todos Juntos" AND g.genero  = "Infantil";

INSERT INTO genero_pelicula (id_pelicula, id_genero) 
SELECT p.id_pelicula, g.id_genero 
FROM peliculas p, genero g
WHERE p.titulo = "50 sombras de grey 2" AND g.genero  = "Romance";

INSERT INTO genero_pelicula (id_pelicula, id_genero) 
SELECT p.id_pelicula, g.id_genero 
FROM peliculas p, genero g
WHERE p.titulo = "50 sombras liberadas" AND g.genero  = "Romance";