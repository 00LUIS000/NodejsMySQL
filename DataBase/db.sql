CREATE DATABASE db

CREATE TABLE usuarios (
	ID_Usuario INT AUTO_INCREMENT PRIMARY KEY,
    Correo_Institucional_Usuario VARCHAR(50) UNIQUE NOT NULL,
    Correo_Alternativo_Usuario VARCHAR(50) UNIQUE,
	Contraseña_Usuario VARCHAR(50) NOT NULL
);

insert into usuarios(Correo_Institucional_Usuario,Correo_Alternativo_Usuario,Contraseña_Usuario) VALUES
('jsnachezv2001@alumno.ipn.mx','jairsanchez198@gmail','contraseña'),
('alfonrt2004@alumno.ipn.mx','alfon2004@gmail.com','reptic'),
('rubipe2000@alumno.ipn.mx','rubi2000@gmail.com','12345'),
('perezav1999@alumno.ipn.mx','perezav19@gmail.com','567889'),
('albert2001@alumno.ipn.mx','albert20@gmail.com','653278'),
('denimz2003@alumno.ipn.mx','denimz2003@gmail.com','678943'),
('rogelmz1997@alumno.ipn.mx','rogemz199@gmail.com','56432'),
('saul2002@alumno.ipn.mx','saul202@gmail.com','64875167'),
('jcarlosap2004@alumno.ipn.mx','jcarlos24@gmail.com','4687434'),
('britafp2004@alumno.ipn.mx','brifp40@gmail.com','843576467');

CREATE TABLE Comentario (
	ID_Comentario INT AUTO_INCREMENT PRIMARY KEY,
    Comentario VARCHAR(1000) NOT NULL
);

CREATE TABLE Comentarios(
ID_Comentarios INT AUTO_INCREMENT PRIMARY KEY,
Fecha_Comentario DATE NOT NULL,
FK_Usuario_Comentarios INT,
FOREIGN KEY (FK_Usuario_Comentarios) REFERENCES usuarios(ID_Usuario),
FK_Comentario INT,
FOREIGN KEY (FK_Comentario) REFERENCES Comentario(ID_Comentario)
);


CREATE TABLE Calificacion (
	ID_Calificacion INT PRIMARY KEY NOT NULL,
    Calificacion INT UNIQUE NOT NULL 
);

CREATE TABLE Calificaciones (
	ID_Calificaciones INT AUTO_INCREMENT PRIMARY KEY,
	FK_Usuario_Calificaciones INT,
    FOREIGN KEY (FK_Usuario_Calificaciones) REFERENCES usuarios(ID_Usuario),
	FK_Calificacion INT,
    FOREIGN KEY (FK_Calificacion) REFERENCES Calificacion(ID_Calificacion)
);


RENAME TABLE comentario to tvl_comentario;
RENAME TABLE calificacion to tvl_calificacion;



CREATE TABLE Materias (
	ID_Materia INT AUTO_INCREMENT PRIMARY KEY,
    Nombre_Materias VARCHAR(50) UNIQUE NOT NULL
);





CREATE TABLE docentes (
	ID_Docente INT AUTO_INCREMENT PRIMARY KEY,
    Nombre_Docentes VARCHAR(20) NOT NULL,
    Apellido_Paterno_Docentes VARCHAR(20) NOT NULL,
    Apellido_Materno_Docentes VARCHAR(20),
    FK_Materia_Docentes INT,
    FOREIGN KEY (FK_Materia_Docentes) REFERENCES Materias(ID_Materia)
);



insert into docentes(Nombre_Docentes,Apellido_Paterno_Docentes,Apellido_Materno_Docentes) values
('Vera','Gonzalez','Medina'),
('Salvador Felipe','Diaz','Albarran'),
('Jose Juan','Ley ','Mandujano'),
('Jose Luis ','Villarreal','Aguirre'),
('Juan Gabriel','Martínez','López'),
('Pedro ','Morales','Vergara'),
('Xochitl','Cabrera','Rivas'),
('Rodolfo','Lopez','Gonzalez'),
('Santiago','Gonzalez','Lopez'),
('Irene ','Cubillos','Islas'),
('Edna Carla','Vasco','Mendez'),
('Froylan','Angel','Huerta'),
('Marisol','Hernandez','Lopez'),
('Lorena','Azuara','Perez'),
('Veronica','Salas','Jimenez'),
('Oscar','Cruz','García'),
('Jesus','Mora ','Jain'),
('Clarissa','Gonzalez','Acatitla'),
('Elsa ','Gonzalez','Paredes'),
('Maria Araceli','Moreno','Guzman'),
('Graciela Irene','Cervantes','Cabello'),
('Celsa Piedad','Santos','Jacome'),
('Citlalli','Flores','Martinez'),
('Jesus','Olivares','Mercado'),
('Francisco Javier','Benitez','Diaz'),
('Martha Elvia','Salazar','Galván'),
('Maribel','Rojo','Hernandez'),
('Irma Alicia','Amador','Zaragoza'),
('Julian Hugo','Aponte','Olaya'),
('Fernando David','Aquino','Salinas'),
('Amparo','Bañuelos','Duran'),
('Roberto Pedro','Galvan','De Sampedro'),
('Juan Gabriel','Martínez','Lopez'),
('Patricia','Cortés','Pineda'),
('Beatriz Eugenia','Corona ','Ramirez'),
('Sabas ','Flores','Ascencio'),
('Claudia','Azorín','Vega'),
('Roberto   ','Osornio','Soto'),
('Arturo','De La Cruz','Tellez'),
('Sandra Luz','Enriquez','Arreola'),
('Jessica','Valverde','Jimenez'),
('Juan Angel','Rodriguez','Gomez'),
('Jazmin','Ramirez','Hernandez'),
('Mario Antonio ','Muñoz','Guerrero'),
('Jesus','Rodríguez','Buendía'),
('Eliel','Carbajal','Quiroz'),
('Juan Francisco','Márquez','Rubio'),
('Orlando ','Vargas','Reyes'),
('Aldo','Hernandez','Suarez'),
('Anselmo','Angoa','Torres'),
('Jose Eduardo','Guzman','Rodriguez'),
('Adolfo Sabino','Ugalde','Licea'),
('Juan Jose','Cabrera','Tejeda'),
('Margarita','Martínez','Martinez'),
('Alejandro','Arcos','Pichardo'),
('Luis','Valles','Montañez'),
('Patricia','Rodriguez','Peralta'),
('Javier Fernando','Diaz','Rosas'),
('Teresa De Jesus','Monroy','Ostria'),
('Maria Juana','Vigueras','Bonilla'),
('Jazmin','Rodriguez','Hernandez'),
('Rosa Maria','Ramirez','Quintanar'),
('Claudio Augusto','Valdés','Galicia'),
('Carlos','De La Cruz','Alejo'),
('Carlos Alberto','Estrada','Arriaga'),
('Gonzalo Isaac','Duchén','Sánchez'),
('Marbella','Calvino','Gallardo'),
('Ricardo Israel','Calzada','Salas'),
('Juan Arturo ','Perez','Cebreros'),
('Braulio','Sanchez','Zamora'),
('Rogelio','Reyes','Reyes'),
('Carlos','Perez','Torres'),
('Pilar','Resenderiz','Colin'),
('Ricardo Israel','Calzada','Islas'),
('Luis Efren','Veloz','Ortiz'),
('Jesus','Mora','Jain'),
('Jesus','García','Ruíz'),
('Jose','Galvan','Chavez'),
('Jose Luis ','Bautista','Arias'),
('Adolfo  ','Rodriguez','Acosta'),
('Eduardo','Martínez','Corona'),
('Maria Alejandra','Martínez','Camargo'),
('María Elena','Mendiola','Medellín'),
('Clara','Cruz','Ramos'),
('Jose','Velazquez','Lopez'),
('Hayari Lizet','Cruz','Gonzalez'),
('Rosa Maria','Rodriguez','Quintanar'),
('Enrique','Escamilla','Hernández'),
('Daniel','Tapia','Sanchez'),
('José Antonio ','Loaiza','Brito'),
('Lidia','Prudente','Tixteco'),
('Raúl','Nuñez','Galindo'),
('Raymundo','Santana','Alquicira'),
('Leonor','Herrera','Resendiz'),
('Miguel Angel','Miranda','Hernandez'),
('Luis Carlos','Castro ','Madrid'),
('Gabriel ','Sanchez','Perez'),
('Eduardo','Vazquez','Fernandez'),
('Juan Gerardo','Avalos','Ochoa'),
('Carlos','Cortes','Bazan'),
('Pedro ','Guevara','Lopez'),
('Linda Karina','Toscano','Medina'),
('José  ','Portillo ','Portillo'),
('Luis Carlos','Castro','Madrid');

insert into materias(Nombre_Materias) values
('Calculo Diferencial'),
('FISICA CLASICA'),
('FUNDAMENTOS DE PROGRAMACION'),
('HUMANIDADES I INGENERIA, CIENCIA Y SOCIEDAD'),
('FUNDAMENTOS DE ALGEBRA'),
('QUIMICA BASICA'),
('CALCULO VECTORIAL'),
('ELECTRICIDAD Y MAGNETISMO'),
('PROGRAMACION ORIENTADA A OBJETOS'),
('HUMANIDADES II: LA COMUNICACION Y LA ING'),
('MATEMATICAS DISCRETAS'),
('ALGEBRA LINEAL'),
('ECUACIONES DIFERENCIALES'),
('CIRCUITOS DE C.A. Y C.D.'),
('ESTRUCTURA DE DATOS'),
('LENGUAJES DE BAJO NIVEL'),
('CIRCUITOS LOGICOS I'),
('HUMANIDADES III DESARROLLO HUMANO'),
('ANALISIS NUMERICO'),
('VARIABLE COMPLEJA Y ANALISIS DE FOURIER'),
('CIRCUITOS LOGICOS II'),
('ELECTRONICA ANALOGICA'),
('TEORIA DE AUTOMATAS'),
('HUMANIDADES IV:DES.PER.Y PROF.'),
('ANALISIS DE SEÑALES ANALOGICAS'),
('PROBABILIDAD Y ESTADISTICA'),
('ANALISIS DE ALGORITMOS'),
('COMPILADORES'),
('ORGANIZACION DE COMPUTADORAS'),
('HUMANIDADES V:EL HUM.FRENTE A LA GLOB.'),
('SISTEMAS OPERATIVOS'),
('ARQUITECTURA DE COMPUTADORAS'),
('INGENIERIA DE SOFTWARE'),
('MET. DE LA INV. O TOP.SELEC.DE LA ING.I'),
('MODULACIÓN DIGITAL'),
('TEORIA DE CONTROL ANALÓGICO'),
('TEORIA DE LA INFORMACION Y CODIFICACION'),
('TEORIA DE CONTROL DIGITAL'),
('NVAS. TEC. EN LA TRANSFER. DE INFOR.'),
('ADMINISTRACIÓN DE LA INGENERIA'),
('COMPUTO APLICADO A SISTEMAS ECOLOGICOS I'),
('SISTEMAS DE INFORMACION I'),
('TRANSFERENCIA Y PROC.DE LA INFORMACION I'),
('ALGORITMOS DE COMPUTO I'),
('INTERFASES INTELIGENTES I'),
('BASE DE DATOS'),
('PROYECTO DE INGENIERIA'),
('FORMULACION Y EVALUACION DE PROYECTOS'),
('REDES NEURONALES'),
('INTELIGENCIA ARTIFICIAL'),
('PROGRAMACION LOGICA'),
('LENGUAJES PARA ARQUITECTURA EN PARALELO'),
('SISTEMAS EXPERTOS'),
('DISEÑO ASISTIDO POR COMPUTADORA'),
('REDES DE COMPUTADORAS'),
('SISTEMAS DISTRIBUIDOS'),
('COMPUTO APLICADO A SISTEMAS ECOLOGICOS II'),
('SISTEMAS DE INFORMACION II'),
('TRANSFERENCIA Y PROC.DE LA INFORMACION II'),
('ALGORITMOS DE COMPUTO II'),
('INTERFASES INTELIGENTES II');

CREATE TABLE Materia_Docente (
    ID_Materia INT,
    ID_Docente INT,
    PRIMARY KEY (ID_Materia, ID_Docente),
    FOREIGN KEY (ID_Materia) REFERENCES materias(ID_Materia),
    FOREIGN KEY (ID_Docente) REFERENCES docentes(ID_Docente)
);


#-----Primero y Segundo
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(1,1);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(1,2);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(1,3);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(1,4);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(1,5);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(1,6);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(1,7);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(1,8);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(2,9);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(2,10);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(2,11);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(2,12);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(3,13);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(3,14);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(3,15);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(3,16);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(3,17);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(3,18);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(4,19);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(4,20);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(4,21);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(4,22);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(4,23);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(5,7);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(5,9);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(5,3);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(5,24);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(5,25);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(6,26);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(6,27);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(6,28);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(6,29);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(6,30);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(7,1);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(7,7);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(7,3);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(7,31);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(7,32);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(7,6);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(8,11);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(8,10);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(8,9);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(8,8);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(8,5);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(8,34);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(9,35);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(9,36);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(9,37);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(9,38);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(9,18);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(9,39);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(10,19);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(10,20);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(10,23);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(10,40);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(10,22);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(11,41);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(11,42);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(11,43);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(11,44);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(11,45);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(12,46);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(12,43);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(12,7);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(12,8);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(12,47);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(12,42);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(12,48);
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(12,25);

#----- SÃ©ptimo y Octavo
INSERT INTO Materia_Docente(ID_Materia,ID_Docente) VALUES(37,87);
INSERT INTO Materia_Docente(ID_Materia, ID_Docente) VALUES(37,88);
INSERT INTO Materia_Docente(ID_Materia, ID_Docente) VALUES(37,89);
INSERT INTO Materia_Docente(ID_Materia, ID_Docente) VALUES(38,70);
INSERT INTO Materia_Docente(ID_Materia, ID_Docente) VALUES(38,90);
INSERT INTO Materia_Docente(ID_Materia, ID_Docente) VALUES(38,86);
INSERT INTO Materia_Docente(ID_Materia, ID_Docente) VALUES(39,91);
INSERT INTO Materia_Docente(ID_Materia, ID_Docente) VALUES(39,92);
INSERT INTO Materia_Docente(ID_Materia, ID_Docente) VALUES(39,93);
INSERT INTO Materia_Docente(ID_Materia, ID_Docente) VALUES(40,82);
INSERT INTO Materia_Docente(ID_Materia, ID_Docente) VALUES(40,94);
INSERT INTO Materia_Docente(ID_Materia, ID_Docente) VALUES(46,100);
INSERT INTO Materia_Docente(ID_Materia, ID_Docente) VALUES(46,76);
INSERT INTO Materia_Docente(ID_Materia, ID_Docente) VALUES(42,75);
INSERT INTO Materia_Docente(ID_Materia, ID_Docente) VALUES(42,95);
INSERT INTO Materia_Docente(ID_Materia, ID_Docente) VALUES(43,91);
INSERT INTO Materia_Docente(ID_Materia, ID_Docente) VALUES(43,104);
INSERT INTO Materia_Docente(ID_Materia, ID_Docente) VALUES(44,97);
INSERT INTO Materia_Docente(ID_Materia, ID_Docente) VALUES(44,98);
INSERT INTO Materia_Docente(ID_Materia, ID_Docente) VALUES(45,99);
INSERT INTO Materia_Docente(ID_Materia, ID_Docente) VALUES(45,53);
INSERT INTO Materia_Docente(ID_Materia, ID_Docente) VALUES(47,90);
INSERT INTO Materia_Docente(ID_Materia, ID_Docente) VALUES(47,7);
INSERT INTO Materia_Docente(ID_Materia, ID_Docente) VALUES(47,85);
INSERT INTO Materia_Docente(ID_Materia, ID_Docente) VALUES(47,101);
INSERT INTO Materia_Docente(ID_Materia, ID_Docente) VALUES(48,82);
INSERT INTO Materia_Docente(ID_Materia, ID_Docente) VALUES(48,20);
INSERT INTO Materia_Docente(ID_Materia, ID_Docente) VALUES(48,94);
INSERT INTO Materia_Docente(ID_Materia, ID_Docente) VALUES(49,102);
INSERT INTO Materia_Docente(ID_Materia, ID_Docente) VALUES(49,103);
INSERT INTO Materia_Docente(ID_Materia, ID_Docente) VALUES(50,75);
INSERT INTO Materia_Docente(ID_Materia, ID_Docente) VALUES(50,69);
INSERT INTO Materia_Docente(ID_Materia, ID_Docente) VALUES(53,15);
INSERT INTO Materia_Docente(ID_Materia, ID_Docente) VALUES(55,51);
INSERT INTO Materia_Docente(ID_Materia, ID_Docente) VALUES(55,92);
INSERT INTO Materia_Docente(ID_Materia, ID_Docente) VALUES(55,93);
INSERT INTO Materia_Docente(ID_Materia, ID_Docente) VALUES(56,15);
INSERT INTO Materia_Docente(ID_Materia, ID_Docente) VALUES(56,68);
INSERT INTO Materia_Docente(ID_Materia, ID_Docente) VALUES(56,95);
INSERT INTO Materia_Docente(ID_Materia, ID_Docente) VALUES(58,100);
INSERT INTO Materia_Docente(ID_Materia, ID_Docente) VALUES(58,95);
INSERT INTO Materia_Docente(ID_Materia, ID_Docente) VALUES(59,71);
INSERT INTO Materia_Docente(ID_Materia, ID_Docente) VALUES(59,96);
INSERT INTO Materia_Docente(ID_Materia, ID_Docente) VALUES(60,97);
INSERT INTO Materia_Docente(ID_Materia, ID_Docente) VALUES(60,98);
INSERT INTO Materia_Docente(ID_Materia, ID_Docente) VALUES(61,99);
INSERT INTO Materia_Docente(ID_Materia, ID_Docente) VALUES(61,53);

#----Quinto y Sexto
INSERT INTO Materia_Docente (ID_Materia, ID_Docente) VALUES (25, 70);
INSERT INTO Materia_Docente (ID_Materia, ID_Docente) VALUES (25, 71);
INSERT INTO Materia_Docente (ID_Materia, ID_Docente) VALUES (25, 48);
INSERT INTO Materia_Docente (ID_Materia, ID_Docente) VALUES (26, 48);
INSERT INTO Materia_Docente (ID_Materia, ID_Docente) VALUES (26, 72);
INSERT INTO Materia_Docente (ID_Materia, ID_Docente) VALUES (26, 43);
INSERT INTO Materia_Docente (ID_Materia, ID_Docente) VALUES (26, 5);
INSERT INTO Materia_Docente (ID_Materia, ID_Docente) VALUES (27, 37);
INSERT INTO Materia_Docente (ID_Materia, ID_Docente) VALUES (27, 73);
INSERT INTO Materia_Docente (ID_Materia, ID_Docente) VALUES (27, 74);
INSERT INTO Materia_Docente (ID_Materia, ID_Docente) VALUES (28, 15);
INSERT INTO Materia_Docente (ID_Materia, ID_Docente) VALUES (28, 75);
INSERT INTO Materia_Docente (ID_Materia, ID_Docente) VALUES (28, 76);
INSERT INTO Materia_Docente (ID_Materia, ID_Docente) VALUES (28, 73);
INSERT INTO Materia_Docente (ID_Materia, ID_Docente) VALUES (29, 77);
INSERT INTO Materia_Docente (ID_Materia, ID_Docente) VALUES (29, 55);
INSERT INTO Materia_Docente (ID_Materia, ID_Docente) VALUES (29, 78);
INSERT INTO Materia_Docente (ID_Materia, ID_Docente) VALUES (30, 60);
INSERT INTO Materia_Docente (ID_Materia, ID_Docente) VALUES (30, 20);
INSERT INTO Materia_Docente (ID_Materia, ID_Docente) VALUES (30, 40);
INSERT INTO Materia_Docente (ID_Materia, ID_Docente) VALUES (31, 36);
INSERT INTO Materia_Docente (ID_Materia, ID_Docente) VALUES (31, 13);
INSERT INTO Materia_Docente (ID_Materia, ID_Docente) VALUES (31, 74);
INSERT INTO Materia_Docente (ID_Materia, ID_Docente) VALUES (31, 39);
INSERT INTO Materia_Docente (ID_Materia, ID_Docente) VALUES (32, 77);
INSERT INTO Materia_Docente (ID_Materia, ID_Docente) VALUES (32, 55);
INSERT INTO Materia_Docente (ID_Materia, ID_Docente) VALUES (32, 79);
INSERT INTO Materia_Docente (ID_Materia, ID_Docente) VALUES (33, 80);
INSERT INTO Materia_Docente (ID_Materia, ID_Docente) VALUES (33, 81);
INSERT INTO Materia_Docente (ID_Materia, ID_Docente) VALUES (34, 82);
INSERT INTO Materia_Docente (ID_Materia, ID_Docente) VALUES (34, 21);
INSERT INTO Materia_Docente (ID_Materia, ID_Docente) VALUES (34, 83);
INSERT INTO Materia_Docente (ID_Materia, ID_Docente) VALUES (35, 84);
INSERT INTO Materia_Docente (ID_Materia, ID_Docente) VALUES (35, 48);
INSERT INTO Materia_Docente (ID_Materia, ID_Docente) VALUES (35, 53);
INSERT INTO Materia_Docente (ID_Materia, ID_Docente) VALUES (35, 85);
INSERT INTO Materia_Docente (ID_Materia, ID_Docente) VALUES (36, 72);
INSERT INTO Materia_Docente (ID_Materia, ID_Docente) VALUES (36, 86);

SELECT 
    md.ID_Materia, 
    m.Nombre_Materias, 
    md.ID_Docente, 
    d.Nombre_Docentes, 
    d.Apellido_Paterno_Docentes, 
    d.Apellido_Materno_Docentes
FROM 
    Materia_Docente md
JOIN 
    materias m ON md.ID_Materia = m.ID_Materia
JOIN 
    docentes d ON md.ID_Docente = d.ID_Docente;

 select * from docentes where Nombre_Docentes = 'luis' or Apellido_Paterno_Docentes = 'luis' or Apellido_Materno_Docentes = 'luis';


 CREATE TABLE comentarios (
    ID_Comentario INT AUTO_INCREMENT PRIMARY KEY,
    ID_Usuario INT,
    ID_Docente INT,
    ID_Materia INT,
    Nombre_Materia VARCHAR(50),
    Comentario TEXT NOT NULL,
    Fecha_Comentario TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Calificacion INT CHECK (Calificacion >= 1 AND Calificacion <= 10), -- Se agrega la calificación con restricción de rango
    FOREIGN KEY (ID_Usuario) REFERENCES usuarios(ID_Usuario),
    FOREIGN KEY (ID_Docente) REFERENCES docentes(ID_Docente),
    FOREIGN KEY (ID_Materia) REFERENCES materias(ID_Materia)
);

INSERT INTO comentarios (ID_Usuario, ID_Docente, ID_Materia, Nombre_Materia, Comentario, Calificacion) 
VALUES (1, 101, 1, 'Matemáticas', 'Excelente explicación sobre ecuaciones lineales.', 9);


SELECT Comentarios.ID_Comentario, 
       Comentarios.ID_Usuario, 
       Comentarios.ID_Docente, 
       docentes.Nombre_Docentes, -- Agregamos el nombre del docente
       Comentarios.Comentario, 
       Comentarios.Fecha_Comentario, 
       materias.ID_Materia, 
       materias.Nombre_Materias AS Nombre_Materia
FROM Comentarios
INNER JOIN materias ON Comentarios.ID_Materia = materias.ID_Materia
INNER JOIN docentes ON Comentarios.ID_Docente = docentes.ID_Docente;