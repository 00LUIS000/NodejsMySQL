CREATE DATABASE  IF NOT EXISTS `db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: db
-- ------------------------------------------------------
-- Server version	8.0.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `calificacion`
--

DROP TABLE IF EXISTS `calificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calificacion` (
  `ID_Calificacion` int NOT NULL,
  `Calificacion` int NOT NULL,
  PRIMARY KEY (`ID_Calificacion`),
  UNIQUE KEY `Calificacion` (`Calificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calificacion`
--

LOCK TABLES `calificacion` WRITE;
/*!40000 ALTER TABLE `calificacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `calificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calificaciones`
--

DROP TABLE IF EXISTS `calificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calificaciones` (
  `ID_Calificaciones` int NOT NULL AUTO_INCREMENT,
  `FK_Usuario_Calificaciones` int DEFAULT NULL,
  `FK_Calificacion` int DEFAULT NULL,
  PRIMARY KEY (`ID_Calificaciones`),
  KEY `FK_Usuario_Calificaciones` (`FK_Usuario_Calificaciones`),
  KEY `FK_Calificacion` (`FK_Calificacion`),
  CONSTRAINT `calificaciones_ibfk_1` FOREIGN KEY (`FK_Usuario_Calificaciones`) REFERENCES `usuarios` (`ID_Usuario`),
  CONSTRAINT `calificaciones_ibfk_2` FOREIGN KEY (`FK_Calificacion`) REFERENCES `calificacion` (`ID_Calificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calificaciones`
--

LOCK TABLES `calificaciones` WRITE;
/*!40000 ALTER TABLE `calificaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `calificaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentario`
--

DROP TABLE IF EXISTS `comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentario` (
  `ID_Comentario` int NOT NULL AUTO_INCREMENT,
  `Comentario` varchar(1000) NOT NULL,
  PRIMARY KEY (`ID_Comentario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentario`
--

LOCK TABLES `comentario` WRITE;
/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentarios` (
  `ID_Comentario` int NOT NULL AUTO_INCREMENT,
  `ID_Usuario` int DEFAULT NULL,
  `ID_Docente` int DEFAULT NULL,
  `ID_Materia` int DEFAULT NULL,
  `Nombre_Materia` varchar(50) DEFAULT NULL,
  `Comentario` text NOT NULL,
  `Fecha_Comentario` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Calificacion` int DEFAULT NULL,
  PRIMARY KEY (`ID_Comentario`),
  KEY `ID_Usuario` (`ID_Usuario`),
  KEY `ID_Docente` (`ID_Docente`),
  KEY `ID_Materia` (`ID_Materia`),
  CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuarios` (`ID_Usuario`),
  CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`ID_Docente`) REFERENCES `docentes` (`ID_Docente`),
  CONSTRAINT `comentarios_ibfk_3` FOREIGN KEY (`ID_Materia`) REFERENCES `materias` (`ID_Materia`),
  CONSTRAINT `comentarios_chk_1` CHECK (((`Calificacion` >= 1) and (`Calificacion` <= 10)))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios`
--

LOCK TABLES `comentarios` WRITE;
/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
INSERT INTO `comentarios` VALUES (1,NULL,80,NULL,'INGENIERIA DE SOFTWARE','Buen maestro, la clase es amena ','2024-06-04 19:56:07',9);
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docentes`
--

DROP TABLE IF EXISTS `docentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docentes` (
  `ID_Docente` int NOT NULL AUTO_INCREMENT,
  `Nombre_Docentes` varchar(20) NOT NULL,
  `Apellido_Paterno_Docentes` varchar(20) NOT NULL,
  `Apellido_Materno_Docentes` varchar(20) DEFAULT NULL,
  `FK_Materia_Docentes` int DEFAULT NULL,
  PRIMARY KEY (`ID_Docente`),
  KEY `FK_Materia_Docentes` (`FK_Materia_Docentes`),
  CONSTRAINT `docentes_ibfk_1` FOREIGN KEY (`FK_Materia_Docentes`) REFERENCES `materias` (`ID_Materia`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docentes`
--

LOCK TABLES `docentes` WRITE;
/*!40000 ALTER TABLE `docentes` DISABLE KEYS */;
INSERT INTO `docentes` VALUES (1,'Vera','Gonzalez','Medina',NULL),(2,'Salvador Felipe','Diaz','Albarran',NULL),(3,'Jose Juan','Ley ','Mandujano',NULL),(4,'Jose Luis ','Villarreal','Aguirre',NULL),(5,'Juan Gabriel','Martínez','López',NULL),(6,'Pedro ','Morales','Vergara',NULL),(7,'Xochitl','Cabrera','Rivas',NULL),(8,'Rodolfo','Lopez','Gonzalez',NULL),(9,'Santiago','Gonzalez','Lopez',NULL),(10,'Irene ','Cubillos','Islas',NULL),(11,'Edna Carla','Vasco','Mendez',NULL),(12,'Froylan','Angel','Huerta',NULL),(13,'Marisol','Hernandez','Lopez',NULL),(14,'Lorena','Azuara','Perez',NULL),(15,'Veronica','Salas','Jimenez',NULL),(16,'Oscar','Cruz','García',NULL),(17,'Jesus','Mora ','Jain',NULL),(18,'Clarissa','Gonzalez','Acatitla',NULL),(19,'Elsa ','Gonzalez','Paredes',NULL),(20,'Maria Araceli','Moreno','Guzman',NULL),(21,'Graciela Irene','Cervantes','Cabello',NULL),(22,'Celsa Piedad','Santos','Jacome',NULL),(23,'Citlalli','Flores','Martinez',NULL),(24,'Jesus','Olivares','Mercado',NULL),(25,'Francisco Javier','Benitez','Diaz',NULL),(26,'Martha Elvia','Salazar','Galván',NULL),(27,'Maribel','Rojo','Hernandez',NULL),(28,'Irma Alicia','Amador','Zaragoza',NULL),(29,'Julian Hugo','Aponte','Olaya',NULL),(30,'Fernando David','Aquino','Salinas',NULL),(31,'Amparo','Bañuelos','Duran',NULL),(32,'Roberto Pedro','Galvan','De Sampedro',NULL),(33,'Juan Gabriel','Martínez','Lopez',NULL),(34,'Patricia','Cortés','Pineda',NULL),(35,'Beatriz Eugenia','Corona ','Ramirez',NULL),(36,'Sabas ','Flores','Ascencio',NULL),(37,'Claudia','Azorín','Vega',NULL),(38,'Roberto   ','Osornio','Soto',NULL),(39,'Arturo','De La Cruz','Tellez',NULL),(40,'Sandra Luz','Enriquez','Arreola',NULL),(41,'Jessica','Valverde','Jimenez',NULL),(42,'Juan Angel','Rodriguez','Gomez',NULL),(43,'Jazmin','Ramirez','Hernandez',NULL),(44,'Mario Antonio ','Muñoz','Guerrero',NULL),(45,'Jesus','Rodríguez','Buendía',NULL),(46,'Eliel','Carbajal','Quiroz',NULL),(47,'Juan Francisco','Márquez','Rubio',NULL),(48,'Orlando ','Vargas','Reyes',NULL),(49,'Aldo','Hernandez','Suarez',NULL),(50,'Anselmo','Angoa','Torres',NULL),(51,'Jose Eduardo','Guzman','Rodriguez',NULL),(52,'Adolfo Sabino','Ugalde','Licea',NULL),(53,'Juan Jose','Cabrera','Tejeda',NULL),(54,'Margarita','Martínez','Martinez',NULL),(55,'Alejandro','Arcos','Pichardo',NULL),(56,'Luis','Valles','Montañez',NULL),(57,'Patricia','Rodriguez','Peralta',NULL),(58,'Javier Fernando','Diaz','Rosas',NULL),(59,'Teresa De Jesus','Monroy','Ostria',NULL),(60,'Maria Juana','Vigueras','Bonilla',NULL),(61,'Jazmin','Rodriguez','Hernandez',NULL),(62,'Rosa Maria','Ramirez','Quintanar',NULL),(63,'Claudio Augusto','Valdés','Galicia',NULL),(64,'Carlos','De La Cruz','Alejo',NULL),(65,'Carlos Alberto','Estrada','Arriaga',NULL),(66,'Gonzalo Isaac','Duchén','Sánchez',NULL),(67,'Marbella','Calvino','Gallardo',NULL),(68,'Ricardo Israel','Calzada','Salas',NULL),(69,'Juan Arturo ','Perez','Cebreros',NULL),(70,'Braulio','Sanchez','Zamora',NULL),(71,'Rogelio','Reyes','Reyes',NULL),(72,'Carlos','Perez','Torres',NULL),(73,'Pilar','Resenderiz','Colin',NULL),(74,'Ricardo Israel','Calzada','Islas',NULL),(75,'Luis Efren','Veloz','Ortiz',NULL),(76,'Jesus','Mora','Jain',NULL),(77,'Jesus','García','Ruíz',NULL),(78,'Jose','Galvan','Chavez',NULL),(79,'Jose Luis ','Bautista','Arias',NULL),(80,'Adolfo  ','Rodriguez','Acosta',NULL),(81,'Eduardo','Martínez','Corona',NULL),(82,'Maria Alejandra','Martínez','Camargo',NULL),(83,'María Elena','Mendiola','Medellín',NULL),(84,'Clara','Cruz','Ramos',NULL),(85,'Jose','Velazquez','Lopez',NULL),(86,'Hayari Lizet','Cruz','Gonzalez',NULL),(87,'Rosa Maria','Rodriguez','Quintanar',NULL),(88,'Enrique','Escamilla','Hernández',NULL),(89,'Daniel','Tapia','Sanchez',NULL),(90,'José Antonio ','Loaiza','Brito',NULL),(91,'Lidia','Prudente','Tixteco',NULL),(92,'Raúl','Nuñez','Galindo',NULL),(93,'Raymundo','Santana','Alquicira',NULL),(94,'Leonor','Herrera','Resendiz',NULL),(95,'Miguel Angel','Miranda','Hernandez',NULL),(96,'Luis Carlos','Castro ','Madrid',NULL),(97,'Gabriel ','Sanchez','Perez',NULL),(98,'Eduardo','Vazquez','Fernandez',NULL),(99,'Juan Gerardo','Avalos','Ochoa',NULL),(100,'Carlos','Cortes','Bazan',NULL),(101,'Pedro ','Guevara','Lopez',NULL),(102,'Linda Karina','Toscano','Medina',NULL),(103,'José  ','Portillo ','Portillo',NULL),(104,'Luis Carlos','Castro','Madrid',NULL);
/*!40000 ALTER TABLE `docentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materia_docente`
--

DROP TABLE IF EXISTS `materia_docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materia_docente` (
  `ID_Materia` int NOT NULL,
  `ID_Docente` int NOT NULL,
  PRIMARY KEY (`ID_Materia`,`ID_Docente`),
  KEY `ID_Docente` (`ID_Docente`),
  CONSTRAINT `materia_docente_ibfk_1` FOREIGN KEY (`ID_Materia`) REFERENCES `materias` (`ID_Materia`),
  CONSTRAINT `materia_docente_ibfk_2` FOREIGN KEY (`ID_Docente`) REFERENCES `docentes` (`ID_Docente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia_docente`
--

LOCK TABLES `materia_docente` WRITE;
/*!40000 ALTER TABLE `materia_docente` DISABLE KEYS */;
INSERT INTO `materia_docente` VALUES (1,1),(7,1),(1,2),(1,3),(5,3),(7,3),(1,4),(1,5),(8,5),(26,5),(1,6),(7,6),(1,7),(5,7),(7,7),(12,7),(47,7),(1,8),(8,8),(12,8),(2,9),(5,9),(8,9),(2,10),(8,10),(2,11),(8,11),(2,12),(3,13),(31,13),(3,14),(3,15),(28,15),(53,15),(56,15),(3,16),(3,17),(3,18),(9,18),(4,19),(10,19),(4,20),(10,20),(30,20),(48,20),(4,21),(34,21),(4,22),(10,22),(4,23),(10,23),(5,24),(5,25),(12,25),(6,26),(6,27),(6,28),(6,29),(6,30),(7,31),(7,32),(8,34),(9,35),(9,36),(31,36),(9,37),(27,37),(9,38),(9,39),(31,39),(10,40),(30,40),(11,41),(11,42),(12,42),(11,43),(12,43),(26,43),(11,44),(11,45),(12,46),(12,47),(12,48),(25,48),(26,48),(35,48),(55,51),(35,53),(45,53),(61,53),(29,55),(32,55),(30,60),(56,68),(50,69),(25,70),(38,70),(25,71),(59,71),(26,72),(36,72),(27,73),(28,73),(27,74),(31,74),(28,75),(42,75),(50,75),(28,76),(46,76),(29,77),(32,77),(29,78),(32,79),(33,80),(33,81),(34,82),(40,82),(48,82),(34,83),(35,84),(35,85),(47,85),(36,86),(38,86),(37,87),(37,88),(37,89),(38,90),(47,90),(39,91),(43,91),(39,92),(55,92),(39,93),(55,93),(40,94),(48,94),(42,95),(56,95),(58,95),(59,96),(44,97),(60,97),(44,98),(60,98),(45,99),(61,99),(46,100),(58,100),(47,101),(49,102),(49,103),(43,104);
/*!40000 ALTER TABLE `materia_docente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materias`
--

DROP TABLE IF EXISTS `materias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materias` (
  `ID_Materia` int NOT NULL AUTO_INCREMENT,
  `Nombre_Materias` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_Materia`),
  UNIQUE KEY `Nombre_Materias` (`Nombre_Materias`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materias`
--

LOCK TABLES `materias` WRITE;
/*!40000 ALTER TABLE `materias` DISABLE KEYS */;
INSERT INTO `materias` VALUES (40,'ADMINISTRACIÓN DE LA INGENERIA'),(12,'ALGEBRA LINEAL'),(44,'ALGORITMOS DE COMPUTO I'),(60,'ALGORITMOS DE COMPUTO II'),(27,'ANALISIS DE ALGORITMOS'),(25,'ANALISIS DE SEÑALES ANALOGICAS'),(19,'ANALISIS NUMERICO'),(32,'ARQUITECTURA DE COMPUTADORAS'),(46,'BASE DE DATOS'),(1,'Calculo Diferencial'),(7,'CALCULO VECTORIAL'),(14,'CIRCUITOS DE C.A. Y C.D.'),(17,'CIRCUITOS LOGICOS I'),(21,'CIRCUITOS LOGICOS II'),(28,'COMPILADORES'),(41,'COMPUTO APLICADO A SISTEMAS ECOLOGICOS I'),(57,'COMPUTO APLICADO A SISTEMAS ECOLOGICOS II'),(54,'DISEÑO ASISTIDO POR COMPUTADORA'),(13,'ECUACIONES DIFERENCIALES'),(8,'ELECTRICIDAD Y MAGNETISMO'),(22,'ELECTRONICA ANALOGICA'),(15,'ESTRUCTURA DE DATOS'),(2,'FISICA CLASICA'),(48,'FORMULACION Y EVALUACION DE PROYECTOS'),(5,'FUNDAMENTOS DE ALGEBRA'),(3,'FUNDAMENTOS DE PROGRAMACION'),(4,'HUMANIDADES I INGENERIA, CIENCIA Y SOCIEDAD'),(10,'HUMANIDADES II: LA COMUNICACION Y LA ING'),(18,'HUMANIDADES III DESARROLLO HUMANO'),(24,'HUMANIDADES IV:DES.PER.Y PROF.'),(30,'HUMANIDADES V:EL HUM.FRENTE A LA GLOB.'),(33,'INGENIERIA DE SOFTWARE'),(50,'INTELIGENCIA ARTIFICIAL'),(45,'INTERFASES INTELIGENTES I'),(61,'INTERFASES INTELIGENTES II'),(16,'LENGUAJES DE BAJO NIVEL'),(52,'LENGUAJES PARA ARQUITECTURA EN PARALELO'),(11,'MATEMATICAS DISCRETAS'),(34,'MET. DE LA INV. O TOP.SELEC.DE LA ING.I'),(35,'MODULACIÓN DIGITAL'),(39,'NVAS. TEC. EN LA TRANSFER. DE INFOR.'),(29,'ORGANIZACION DE COMPUTADORAS'),(26,'PROBABILIDAD Y ESTADISTICA'),(51,'PROGRAMACION LOGICA'),(9,'PROGRAMACION ORIENTADA A OBJETOS'),(47,'PROYECTO DE INGENIERIA'),(6,'QUIMICA BASICA'),(55,'REDES DE COMPUTADORAS'),(49,'REDES NEURONALES'),(42,'SISTEMAS DE INFORMACION I'),(58,'SISTEMAS DE INFORMACION II'),(56,'SISTEMAS DISTRIBUIDOS'),(53,'SISTEMAS EXPERTOS'),(31,'SISTEMAS OPERATIVOS'),(23,'TEORIA DE AUTOMATAS'),(36,'TEORIA DE CONTROL ANALÓGICO'),(38,'TEORIA DE CONTROL DIGITAL'),(37,'TEORIA DE LA INFORMACION Y CODIFICACION'),(43,'TRANSFERENCIA Y PROC.DE LA INFORMACION I'),(59,'TRANSFERENCIA Y PROC.DE LA INFORMACION II'),(20,'VARIABLE COMPLEJA Y ANALISIS DE FOURIER');
/*!40000 ALTER TABLE `materias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `ID_Usuario` int NOT NULL AUTO_INCREMENT,
  `Correo_Institucional_Usuario` varchar(50) NOT NULL,
  `Correo_Alternativo_Usuario` varchar(50) DEFAULT NULL,
  `Contraseña_Usuario` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_Usuario`),
  UNIQUE KEY `Correo_Institucional_Usuario` (`Correo_Institucional_Usuario`),
  UNIQUE KEY `Correo_Alternativo_Usuario` (`Correo_Alternativo_Usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'jsnachezv2001@alumno.ipn.mx','jairsanchez198@gmail','contraseña'),(2,'alfonrt2004@alumno.ipn.mx','alfon2004@gmail.com','reptic'),(3,'rubipe2000@alumno.ipn.mx','rubi2000@gmail.com','12345'),(4,'perezav1999@alumno.ipn.mx','perezav19@gmail.com','567889'),(5,'albert2001@alumno.ipn.mx','albert20@gmail.com','653278'),(6,'denimz2003@alumno.ipn.mx','denimz2003@gmail.com','678943'),(7,'rogelmz1997@alumno.ipn.mx','rogemz199@gmail.com','56432'),(8,'saul2002@alumno.ipn.mx','saul202@gmail.com','64875167'),(9,'jcarlosap2004@alumno.ipn.mx','jcarlos24@gmail.com','4687434'),(10,'britafp2004@alumno.ipn.mx','brifp40@gmail.com','843576467'),(11,'luis@gmail.com','alternativo@gmail.com','contraseña'),(12,'enrique@gmail.com','dksajdkasjkd@gmail.com','123');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-04 14:04:37
