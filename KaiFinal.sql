-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: kaizen
-- ------------------------------------------------------
-- Server version	9.6.0

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'ba5d3104-fc7c-11f0-94f9-c4efbb91b416:1-221';

--
-- Table structure for table `bu`
--

DROP TABLE IF EXISTS `bu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bu` (
  `Id_BU` int NOT NULL AUTO_INCREMENT,
  `Unidad_Negocio` varchar(100) DEFAULT NULL,
  `Activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`Id_BU`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bu`
--

LOCK TABLES `bu` WRITE;
/*!40000 ALTER TABLE `bu` DISABLE KEYS */;
INSERT INTO `bu` VALUES (1,'ALTERNADO',1),(2,'MARCHAS',1),(3,'CAR MECHATRONICS',1),(4,'MULTIMEDIA',1),(5,'EPS',1);
/*!40000 ALTER TABLE `bu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendario`
--

DROP TABLE IF EXISTS `calendario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendario` (
  `Id_Calendario` int NOT NULL AUTO_INCREMENT,
  `Semana` int DEFAULT NULL,
  `Año` year DEFAULT NULL,
  `Id_Usuario` int DEFAULT NULL,
  `Id_Grupo_Usuario` int DEFAULT NULL,
  `Id_Grupo` int DEFAULT NULL,
  `Id_Evaluacion` int DEFAULT NULL,
  `Id_Estado` int DEFAULT NULL,
  `Fecha_Programada` date DEFAULT NULL,
  `Fecha_Realizada` date DEFAULT NULL,
  `Activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`Id_Calendario`),
  KEY `Id_Usuario` (`Id_Usuario`),
  KEY `Id_Evaluacion` (`Id_Evaluacion`),
  KEY `Id_Estado` (`Id_Estado`),
  KEY `calendario_ibfk_2_idx` (`Id_Grupo_Usuario`),
  KEY `calendario_ibfk_3_idx` (`Id_Grupo`),
  CONSTRAINT `calendario_ibfk_1` FOREIGN KEY (`Id_Usuario`) REFERENCES `usuarios` (`Id_Usuario`),
  CONSTRAINT `calendario_ibfk_2` FOREIGN KEY (`Id_Grupo_Usuario`) REFERENCES `grupo` (`id_Grupo`),
  CONSTRAINT `calendario_ibfk_3` FOREIGN KEY (`Id_Grupo`) REFERENCES `grupo` (`id_Grupo`),
  CONSTRAINT `calendario_ibfk_4` FOREIGN KEY (`Id_Evaluacion`) REFERENCES `tipo_evaluacion` (`Id_Evaluacion`),
  CONSTRAINT `calendario_ibfk_5` FOREIGN KEY (`Id_Estado`) REFERENCES `tipo_estados` (`Id_Estado`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendario`
--

LOCK TABLES `calendario` WRITE;
/*!40000 ALTER TABLE `calendario` DISABLE KEYS */;
INSERT INTO `calendario` VALUES (1,1,2026,3,1,1,1,3,'2026-01-06','2026-01-06',1),(2,1,2026,7,1,2,1,3,'2026-01-06','2026-01-07',1),(3,2,2026,11,2,3,1,3,'2026-01-13','2026-01-13',1),(4,2,2026,13,3,4,1,2,'2026-01-13','2026-01-14',1),(5,3,2026,14,4,5,1,1,'2026-01-20',NULL,1),(6,3,2026,16,5,6,1,1,'2026-01-20',NULL,1),(7,4,2026,20,6,7,2,3,'2026-01-27','2026-01-27',1),(8,4,2026,22,7,8,2,2,'2026-01-27','2026-01-28',1),(9,5,2026,25,9,10,2,1,'2026-02-03',NULL,1),(10,5,2026,26,10,11,2,1,'2026-02-03',NULL,1);
/*!40000 ALTER TABLE `calendario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamentos` (
  `Id_Departamento` int NOT NULL AUTO_INCREMENT,
  `Departamento` varchar(100) DEFAULT NULL,
  `Activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`Id_Departamento`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` VALUES (1,'QC',1),(2,'PRODUCCION',1),(3,'KAIZEN',1),(4,'COMPRAS',1),(5,'VENTAS',1),(6,'RH',1),(7,'LOGISTICA',1);
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo`
--

DROP TABLE IF EXISTS `grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupo` (
  `id_Grupo` int NOT NULL AUTO_INCREMENT,
  `Nombre_Grupo` varchar(45) DEFAULT NULL,
  `Nave` int DEFAULT NULL,
  PRIMARY KEY (`id_Grupo`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo`
--

LOCK TABLES `grupo` WRITE;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
INSERT INTO `grupo` VALUES (1,'ALT ASSY',1),(2,'REG/RECT',1),(3,'ALT GX',1),(4,'STARTER',1),(5,'ROTOR',2),(6,'BRACKET/STATOR',2),(7,'SWITCH/RELAY',2),(8,'BRUSH/YOKE',2),(9,'CAR MECH',2),(10,'CID',3),(11,'AMP',3),(12,'LCM',3),(13,'SMT',3),(14,'ECU',3),(15,'MCU',3);
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `linea`
--

DROP TABLE IF EXISTS `linea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `linea` (
  `Id_Linea` int NOT NULL AUTO_INCREMENT,
  `Nombre_Linea` varchar(100) DEFAULT NULL,
  `Id_BU` int DEFAULT NULL,
  `Nave` int DEFAULT NULL,
  `Activo` tinyint(1) DEFAULT '1',
  `id_Grupo` int DEFAULT NULL,
  PRIMARY KEY (`Id_Linea`),
  KEY `Id_BU` (`Id_BU`),
  KEY `id_Grupo` (`id_Grupo`) /*!80000 INVISIBLE */,
  CONSTRAINT `linea_ibfk_1` FOREIGN KEY (`Id_BU`) REFERENCES `bu` (`Id_BU`),
  CONSTRAINT `linea_ibfk_2` FOREIGN KEY (`id_Grupo`) REFERENCES `grupo` (`id_Grupo`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `linea`
--

LOCK TABLES `linea` WRITE;
/*!40000 ALTER TABLE `linea` DISABLE KEYS */;
INSERT INTO `linea` VALUES (0,'LINEA GENERICA',NULL,NULL,1,NULL),(1,'ALT 1',1,1,1,1),(2,'ALT GX',1,1,1,3),(3,'RECTIFICADOR',1,1,1,2),(4,'REGULADOR',1,1,1,2),(5,'ROTOR',1,2,1,5),(6,'BRACKET',1,2,1,6),(7,'ESTATOR',1,2,1,6),(8,'MARCHAS',2,1,1,4),(9,'SWITCH',2,2,1,7),(10,'RELAY',2,2,1,7),(11,'YOKE',2,2,1,8),(12,'BRUSH HOLDER',2,2,1,8),(13,'ARMADURA',2,2,1,7),(14,'VCT 2G',3,2,1,9),(15,'VCT 3G',3,2,1,9),(16,'VCT 4G',3,2,1,9),(17,'VVT',3,2,1,9),(18,'OCV',3,2,1,9),(19,'R1LOW',4,3,1,NULL),(20,'CID',4,3,1,10),(21,'AMP',4,3,1,11),(22,'LCM MAZDA',4,3,1,12),(23,'LCM HONDA',4,3,1,12),(24,'LCM TOYOTA',4,3,1,12),(25,'SMT L1',4,3,1,13),(26,'MCU',5,3,1,15),(27,'ECU',5,3,1,14),(28,'COIL FIELD',1,2,1,5),(29,'MOLDING MACHINE',1,2,1,5),(30,'SMT L2',4,3,1,13),(31,'SMT L3',4,3,1,13),(34,'HONDA 27MY',4,3,1,NULL);
/*!40000 ALTER TABLE `linea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participantes`
--

DROP TABLE IF EXISTS `participantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participantes` (
  `Id_Participante` int NOT NULL AUTO_INCREMENT,
  `Id_Usuario` int DEFAULT NULL,
  `Id_Estado` int DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`Id_Participante`),
  KEY `Id_Usuario` (`Id_Usuario`),
  KEY `Id_Estado` (`Id_Estado`),
  CONSTRAINT `participantes_ibfk_1` FOREIGN KEY (`Id_Usuario`) REFERENCES `usuarios` (`Id_Usuario`),
  CONSTRAINT `participantes_ibfk_2` FOREIGN KEY (`Id_Estado`) REFERENCES `tipo_estados` (`Id_Estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participantes`
--

LOCK TABLES `participantes` WRITE;
/*!40000 ALTER TABLE `participantes` DISABLE KEYS */;
/*!40000 ALTER TABLE `participantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permisos`
--

DROP TABLE IF EXISTS `permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permisos` (
  `Id_Permiso` int NOT NULL AUTO_INCREMENT,
  `Permiso` varchar(100) DEFAULT NULL,
  `Activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`Id_Permiso`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permisos`
--

LOCK TABLES `permisos` WRITE;
/*!40000 ALTER TABLE `permisos` DISABLE KEYS */;
INSERT INTO `permisos` VALUES (1,'Ver Auditorias',1),(2,'Crear Auditoria',1),(3,'Editar Auditoria',1),(4,'Eliminar Auditoria',1),(5,'Ver Reportes',1),(6,'Generar Reportes',1),(7,'Administrar Usuarios',1),(8,'Ver Dashboard',1);
/*!40000 ALTER TABLE `permisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preguntas`
--

DROP TABLE IF EXISTS `preguntas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preguntas` (
  `Id_Pregunta` int NOT NULL AUTO_INCREMENT,
  `Pregunta` varchar(255) DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Id_5S` int DEFAULT NULL,
  `Id_Evaluacion` int DEFAULT NULL,
  `Activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`Id_Pregunta`),
  KEY `Id_5S` (`Id_5S`),
  KEY `preguntas_ibfk_2_idx` (`Id_Evaluacion`),
  CONSTRAINT `preguntas_ibfk_1` FOREIGN KEY (`Id_5S`) REFERENCES `tipo_5s` (`Id_5S`),
  CONSTRAINT `preguntas_ibfk_2` FOREIGN KEY (`Id_Evaluacion`) REFERENCES `tipo_evaluacion` (`Id_Evaluacion`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preguntas`
--

LOCK TABLES `preguntas` WRITE;
/*!40000 ALTER TABLE `preguntas` DISABLE KEYS */;
INSERT INTO `preguntas` VALUES (1,'¿Se han eliminado objetos innecesarios del área de trabajo?','Verifica que solo permanezcan elementos indispensables.',1,1,1),(2,'¿Los materiales obsoletos o dañados han sido retirados?','Evalúa si se eliminan o separan objetos sin uso.',1,1,1),(3,'¿Existe un criterio claro para definir qué es necesario?','Confirma que el personal conoce las reglas de clasificación.',1,1,1),(4,'¿Se evita la acumulación innecesaria de materiales?','Revisa el control de exceso de insumos o herramientas.',1,1,0),(5,'¿Los documentos innecesarios han sido eliminados o archivados?','Evalúa el orden documental y depuración.',1,1,1),(6,'¿Cada objeto tiene un lugar definido?','Verifica la correcta asignación de espacios.',2,1,1),(7,'¿Las áreas están correctamente señalizadas?','Evalúa el uso de etiquetas y señalización visual.',2,1,1),(8,'¿Las herramientas son fáciles de localizar?','Revisa la accesibilidad y organización.',2,1,1),(9,'¿Los pasillos y accesos están despejados?','Confirma que no existan obstrucciones.',2,1,1),(10,'¿Se respeta el orden establecido?','Evalúa la disciplina en el orden diario.',2,1,1),(11,'¿El área de trabajo se encuentra limpia?','Evalúa el estado general de limpieza.',3,1,1),(12,'¿Se realizan limpiezas de forma periódica?','Verifica la frecuencia de limpieza.',3,1,1),(13,'¿Las herramientas están limpias y en buen estado?','Revisa el mantenimiento básico.',3,1,1),(14,'¿Se identifican fuentes de suciedad?','Evalúa la detección de causas de suciedad.',3,1,1),(15,'¿El personal participa en la limpieza?','Confirma el compromiso del equipo.',3,1,0),(16,'¿Existen estándares visuales definidos?','Evalúa el uso de colores, etiquetas y guías.',4,1,1),(17,'¿Los procedimientos 5S están documentados?','Confirma la existencia de documentación.',4,1,1),(18,'¿Los estándares son conocidos por el personal?','Revisa la difusión de los lineamientos.',4,1,0),(19,'¿Se mantiene el orden y limpieza de forma constante?','Evalúa la continuidad del sistema.',4,1,1),(20,'¿Los estándares se aplican correctamente?','Confirma el cumplimiento de normas.',4,1,0),(21,'¿El personal cumple con las normas 5S?','Evalúa la disciplina del equipo.',5,1,0),(22,'¿Se realizan auditorías 5S periódicas?','Verifica el seguimiento del sistema.',5,1,0),(23,'¿Existe compromiso con la mejora continua?','Evalúa la actitud del personal.',5,1,0),(24,'¿Se corrigen las desviaciones detectadas?','Revisa la acción correctiva.',5,1,0),(25,'¿El personal recibe retroalimentación sobre 5S?','Confirma la comunicación y mejora.',5,1,0);
/*!40000 ALTER TABLE `preguntas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preguntas_calendario`
--

DROP TABLE IF EXISTS `preguntas_calendario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preguntas_calendario` (
  `Id_Pregunta_Calendario` int NOT NULL AUTO_INCREMENT,
  `Id_Pregunta` int DEFAULT NULL,
  `Id_Revision` int DEFAULT NULL,
  `Id_Evaluacion` int DEFAULT NULL,
  PRIMARY KEY (`Id_Pregunta_Calendario`),
  KEY `Id_Pregunta` (`Id_Pregunta`),
  KEY `Id_Revision` (`Id_Revision`),
  KEY `Id_Evaluacion` (`Id_Evaluacion`),
  CONSTRAINT `preguntas_calendario_ibfk_1` FOREIGN KEY (`Id_Pregunta`) REFERENCES `preguntas` (`Id_Pregunta`),
  CONSTRAINT `preguntas_calendario_ibfk_2` FOREIGN KEY (`Id_Revision`) REFERENCES `revision` (`Id_Revision`),
  CONSTRAINT `preguntas_calendario_ibfk_3` FOREIGN KEY (`Id_Evaluacion`) REFERENCES `tipo_evaluacion` (`Id_Evaluacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preguntas_calendario`
--

LOCK TABLES `preguntas_calendario` WRITE;
/*!40000 ALTER TABLE `preguntas_calendario` DISABLE KEYS */;
/*!40000 ALTER TABLE `preguntas_calendario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puestos`
--

DROP TABLE IF EXISTS `puestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puestos` (
  `Id_Puesto` int NOT NULL AUTO_INCREMENT,
  `Puesto` varchar(100) DEFAULT NULL,
  `Activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`Id_Puesto`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puestos`
--

LOCK TABLES `puestos` WRITE;
/*!40000 ALTER TABLE `puestos` DISABLE KEYS */;
INSERT INTO `puestos` VALUES (1,'SUPERVISOR',1),(2,'TECNICO',1),(3,'MANAGER',1),(4,'COORDINADOR',1),(5,'ENG',1),(6,'SR ENG ',1),(7,'STAFF',1),(8,'SR STAFF',1);
/*!40000 ALTER TABLE `puestos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respuestas`
--

DROP TABLE IF EXISTS `respuestas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `respuestas` (
  `Id_Respuesta` int NOT NULL AUTO_INCREMENT,
  `Id_Pregunta` int DEFAULT NULL,
  `Cumple` tinyint(1) DEFAULT NULL,
  `Foto` varchar(500) DEFAULT NULL,
  `Observacion` varchar(1000) DEFAULT NULL,
  `Id_Estado` int DEFAULT NULL,
  `Id_Calendario` int DEFAULT NULL,
  `Id_Evaluacion` int DEFAULT NULL,
  `Activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`Id_Respuesta`),
  KEY `Id_Pregunta` (`Id_Pregunta`),
  KEY `Id_Estado` (`Id_Estado`),
  KEY `Id_Calendario` (`Id_Calendario`),
  KEY `Id_Evaluacion` (`Id_Evaluacion`),
  CONSTRAINT `respuestas_ibfk_1` FOREIGN KEY (`Id_Pregunta`) REFERENCES `preguntas` (`Id_Pregunta`),
  CONSTRAINT `respuestas_ibfk_2` FOREIGN KEY (`Id_Estado`) REFERENCES `tipo_estados` (`Id_Estado`),
  CONSTRAINT `respuestas_ibfk_3` FOREIGN KEY (`Id_Calendario`) REFERENCES `calendario` (`Id_Calendario`),
  CONSTRAINT `respuestas_ibfk_4` FOREIGN KEY (`Id_Evaluacion`) REFERENCES `tipo_evaluacion` (`Id_Evaluacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuestas`
--

LOCK TABLES `respuestas` WRITE;
/*!40000 ALTER TABLE `respuestas` DISABLE KEYS */;
/*!40000 ALTER TABLE `respuestas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `retroalimentacion`
--

DROP TABLE IF EXISTS `retroalimentacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `retroalimentacion` (
  `Id_Retroalimentacion` int NOT NULL AUTO_INCREMENT,
  `Id_Calendario` int DEFAULT NULL,
  `Id_Usuario` int DEFAULT NULL,
  `Retroalimentacion` text NOT NULL,
  `Fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  `Activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`Id_Retroalimentacion`),
  KEY `Id_Calendario` (`Id_Calendario`),
  KEY `Id_Usuario` (`Id_Usuario`),
  CONSTRAINT `retroalimentacion_ibfk_1` FOREIGN KEY (`Id_Calendario`) REFERENCES `calendario` (`Id_Calendario`),
  CONSTRAINT `retroalimentacion_ibfk_2` FOREIGN KEY (`Id_Usuario`) REFERENCES `usuarios` (`Id_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `retroalimentacion`
--

LOCK TABLES `retroalimentacion` WRITE;
/*!40000 ALTER TABLE `retroalimentacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `retroalimentacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revision`
--

DROP TABLE IF EXISTS `revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revision` (
  `Id_Revision` int NOT NULL AUTO_INCREMENT,
  `Letra` char(1) DEFAULT NULL,
  `Reviso` varchar(100) DEFAULT NULL,
  `Aprobo` varchar(100) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`Id_Revision`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revision`
--

LOCK TABLES `revision` WRITE;
/*!40000 ALTER TABLE `revision` DISABLE KEYS */;
INSERT INTO `revision` VALUES (1,'A','Frida','Rigel',NULL,0),(2,'B','Frida','Rigel','2026-01-15',1);
/*!40000 ALTER TABLE `revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sup_grup`
--

DROP TABLE IF EXISTS `sup_grup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sup_grup` (
  `id_SupGrup` int NOT NULL AUTO_INCREMENT,
  `id_Usuario` int DEFAULT NULL,
  `id_Grupo` int DEFAULT NULL,
  PRIMARY KEY (`id_SupGrup`),
  KEY `id_Usuario` (`id_Usuario`) /*!80000 INVISIBLE */,
  KEY `id_Grupo` (`id_Grupo`) /*!80000 INVISIBLE */,
  CONSTRAINT `id_Grupo` FOREIGN KEY (`id_Grupo`) REFERENCES `grupo` (`id_Grupo`),
  CONSTRAINT `id_Usuario` FOREIGN KEY (`id_Usuario`) REFERENCES `usuarios` (`Id_Usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sup_grup`
--

LOCK TABLES `sup_grup` WRITE;
/*!40000 ALTER TABLE `sup_grup` DISABLE KEYS */;
INSERT INTO `sup_grup` VALUES (1,3,1),(2,7,1),(3,11,2),(4,12,2),(5,13,3),(6,14,4),(7,16,5),(8,20,6),(9,22,7),(10,23,8),(11,25,9),(12,26,10),(13,27,11),(14,30,12),(15,31,13),(16,32,14),(17,33,15);
/*!40000 ALTER TABLE `sup_grup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_5s`
--

DROP TABLE IF EXISTS `tipo_5s`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_5s` (
  `Id_5S` int NOT NULL AUTO_INCREMENT,
  `Nombre_5S` varchar(50) NOT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`Id_5S`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_5s`
--

LOCK TABLES `tipo_5s` WRITE;
/*!40000 ALTER TABLE `tipo_5s` DISABLE KEYS */;
INSERT INTO `tipo_5s` VALUES (1,'Seleccionar','Aqui se selecciona',1),(2,'Ordenar','Aqui se ordena',1),(3,'Limpiar','Aqui se limpia',1),(4,'Estandarizar','Aqui se estandariza ',1),(5,'Sostener','Aqui se sostiene',1);
/*!40000 ALTER TABLE `tipo_5s` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_estados`
--

DROP TABLE IF EXISTS `tipo_estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_estados` (
  `Id_Estado` int NOT NULL AUTO_INCREMENT,
  `Estado` varchar(50) NOT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`Id_Estado`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_estados`
--

LOCK TABLES `tipo_estados` WRITE;
/*!40000 ALTER TABLE `tipo_estados` DISABLE KEYS */;
INSERT INTO `tipo_estados` VALUES (1,'Sin Evaluacion','El suspervisor no ha realizado la evaluacion',1),(2,'En Revision','Esta en espera de revision por parte de kaizen',1),(3,'Finalizado','Fue revisado por kaizen',1),(4,'Bien','No se presenta hallazgo',1),(5,'Hallazgo','Se presenta un hallazgo',1),(6,'Cerrado','Se cerro el hallazgo ',1),(7,'Activo','Se va a participar en el patrullaje',1),(8,'Innactivo','No se va a participar en el patrullaje',1);
/*!40000 ALTER TABLE `tipo_estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_evaluacion`
--

DROP TABLE IF EXISTS `tipo_evaluacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_evaluacion` (
  `Id_Evaluacion` int NOT NULL AUTO_INCREMENT,
  `Evaluacion` varchar(100) NOT NULL,
  `Activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`Id_Evaluacion`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_evaluacion`
--

LOCK TABLES `tipo_evaluacion` WRITE;
/*!40000 ALTER TABLE `tipo_evaluacion` DISABLE KEYS */;
INSERT INTO `tipo_evaluacion` VALUES (1,'Evaluacion',1),(2,'Patrullaje',1);
/*!40000 ALTER TABLE `tipo_evaluacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_permisos`
--

DROP TABLE IF EXISTS `usuario_permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_permisos` (
  `Id_Usuario_Permiso` int NOT NULL AUTO_INCREMENT,
  `Id_Usuario` int DEFAULT NULL,
  `Id_Permiso` int DEFAULT NULL,
  `Activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`Id_Usuario_Permiso`),
  KEY `Id_Usuario` (`Id_Usuario`),
  KEY `Id_Permiso` (`Id_Permiso`),
  CONSTRAINT `usuario_permisos_ibfk_1` FOREIGN KEY (`Id_Usuario`) REFERENCES `usuarios` (`Id_Usuario`),
  CONSTRAINT `usuario_permisos_ibfk_2` FOREIGN KEY (`Id_Permiso`) REFERENCES `permisos` (`Id_Permiso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_permisos`
--

LOCK TABLES `usuario_permisos` WRITE;
/*!40000 ALTER TABLE `usuario_permisos` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_permisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `Id_Usuario` int NOT NULL AUTO_INCREMENT,
  `Usuario` varchar(50) DEFAULT NULL,
  `Nomina` varchar(20) DEFAULT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `Id_Departamento` int DEFAULT NULL,
  `Id_Puesto` int DEFAULT NULL,
  `Activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`Id_Usuario`),
  KEY `Id_Departamento` (`Id_Departamento`),
  KEY `Id_Puesto` (`Id_Puesto`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`Id_Departamento`) REFERENCES `departamentos` (`Id_Departamento`),
  CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`Id_Puesto`) REFERENCES `puestos` (`Id_Puesto`)
) ENGINE=InnoDB AUTO_INCREMENT=294 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'0EBAU','0','Prueba',3,NULL,1),(2,'102OEON','102','Owen Leon',2,NULL,1),(3,'1039NACC','1039','juan francisco chavez martinez',2,1,1),(4,'1141ESOO','1141','Fernando Moya Morales',2,4,1),(5,'1248ETOO','1248','Jonathan Eleuterio',2,4,1),(6,'1291TOIM','1291','Mario Toribio',7,4,1),(7,'1303TTOE','1303','Enriqueta Mata Monroy',2,1,1),(8,'1352DNRO','1352','Juan Raul Duran Arredondo',NULL,NULL,1),(9,'137RGMS','137','Jorge Luis Olvera Moya',2,7,1),(10,'13AAOZ','13','Hiram Espinoza Olalde',1,3,1),(11,'140DUEE','140','Noel Ugalde Hernandez',2,1,1),(12,'1514IMLU','1514','MIGUEL FLORES',2,1,1),(13,'151ISRI','151','Martin Resendiz',2,1,1),(14,'1580TLMI','1580','Maria Elizabeth Martinez',2,1,1),(15,'1586GERJ','1586','Jose Luis Juarez Angel',NULL,NULL,1),(16,'1692OSBA','1692','Osbaldo Martínez Pacheco',2,1,1),(17,'1693OAAL','1693','Paulo Anielo Marroquin Guzman',NULL,NULL,1),(18,'1740UEEE','1740','Osvaldo Ugalde',NULL,7,1),(19,'1859IASG','1859','Moises Peralta Vega',NULL,NULL,1),(20,'1892ASET','1892','Maria de Jesus Terrazas Ramirez',2,1,1),(21,'1903IDEI','1903','David Resendiz Breña',2,3,1),(22,'1928AAMA','1928','jose manuel almaraz garcia',2,1,1),(23,'1947MUCS','1947','Manuel Urzua Cortes',2,1,1),(24,'1953MIMI','1953','Santiago Ramos Buendia',NULL,NULL,1),(25,'197UITE','197','Angelica Leticia Ramirez Juarez',2,1,1),(26,'1980OIND','1980','Bricelda Alonso',2,1,1),(27,'1993NBZI','1993','Gabina Gonzalez',2,1,1),(28,'1998NHEU','1998','Jorge Luis De Gaona Hernandez',NULL,NULL,1),(29,'1CNGC','1','QC_Gen',1,NULL,1),(30,'2003ILTN','2003','Isaac Lazaro Teran',2,1,1),(31,'2005GNNA','2005','Maria Fernanda Gabriel Calero',2,1,1),(32,'2062AUJC','2062','Claudia Guadalupe Aguilar Jimenez',2,1,1),(33,'2088EEEL','2088','Dariana Jaqueline Quevedo Olvera',2,1,1),(34,'2120GIIA','2120','SAORI GIBO',5,4,1),(35,'2134LNNS','2134','Alejandro Rangel Morales',1,5,1),(36,'2158EJJE','2158','Aline Juarez',2,7,1),(37,'2160ERRA','2160','Ernesto Amador',1,5,1),(38,'2175AEZD','2175','Fidencio Hernandez',2,1,1),(39,'2209RYVZ','2209','Rudy Vazquez',2,1,1),(40,'2239DNNM','2239','Mario Hernandez',2,7,1),(41,'2243IEAT','2243','angel gabriel navarrete anaya',2,1,1),(42,'2246GALN','2246','Jose Guadalupe Luna Ledezma',NULL,NULL,1),(43,'2263AIAA','2263','Amayrani Guadalupe Narvaez Albores',NULL,NULL,1),(44,'2282ALIC','2282','Corina Araceli',2,7,1),(45,'2318NCOI','2318','Oscar Hernan Dionicio Hernandez',2,1,1),(46,'2336AAAZ','2336','Adriana Cruz',2,NULL,1),(47,'2352IZRS','2352','Bertin Olivares Hernandez',NULL,NULL,1),(48,'2353LJEE','2353','Jennifer Gonzalez',NULL,7,1),(49,'2389EAAP','2389','Maria Guadalupe Bautista Resendiz',NULL,NULL,1),(50,'2396NLES','2396','Ana Lidia Resendiz Hernandez',NULL,NULL,1),(51,'247MGMD','247','Eduardo Martinez Gallegos',2,7,1),(52,'2535DERN','2535','Diego Rendon',2,1,1),(53,'2541NEFT','2541','Stefany Juarez Mendoza ',2,1,1),(54,'2561IMZI','2561','Diego Martinez',2,4,1),(55,'2563AILS','2563','Ruben Escamilla',2,4,1),(56,'2575IZZA','2575','Mariana Martinez Ferruzca',2,1,1),(57,'2578RPNL','2578','oswaldo bernal pintor',2,1,1),(58,'2603DYYL','2603','Guadalupe Montoya Montoya',2,1,1),(59,'2634PORZ','2634','Merari Lopez',2,1,1),(60,'2724OSAT','2724','Bernardo Santos',NULL,2,1),(61,'272MAGB','272','Miguel Angel Garcia Basilio',2,1,1),(62,'2759UNUN','2759','Jesus Medina',NULL,2,1),(63,'2769RNAL','2769','Jorge Rangel',2,2,1),(64,'2770HGAA','2770','Hugo Olvera',2,7,1),(65,'2771AKGK','2771','Keizo Nagata',NULL,NULL,1),(66,'2775ZARC','2775','Cruz Duran',2,4,1),(67,'2819JEZO','2819','Jorge Eduardo Zaleta Olvera',2,1,1),(68,'2825RFIO','2825','Rodolfo Florencio',NULL,7,1),(69,'284DIDI','284','Juan Manuel De Miguel González',2,NULL,1),(70,'2858URUE','2858','EDUARDO RODRIGUEZ',2,1,1),(71,'2869RNNI','2869','Ricardo Rios Hernandez',NULL,NULL,1),(72,'2876EZRZ','2876','BEATRIZ CRUZ RESENDIZ',2,1,1),(73,'2893CAOF','2893','Carlos Alfonso Ocampo Figueroa',2,1,1),(74,'2908EOAM','2908','Hector Margalli',2,4,1),(75,'2911MATA','2911','Mariana Mata ',2,1,1),(76,'2938LADA','2938','Linda Yareli Hurtado Barcenas',NULL,NULL,1),(77,'2957AOHG','2957','Carlos Armando Gonzalez Chimal',NULL,NULL,1),(78,'2958PRUI','2958','Enrique Perrusquia',1,6,1),(79,'2976IDTR','2976','Alfredo Martinez',2,7,1),(80,'2983LAOI','2983','Elvia Moreno',2,1,1),(81,'2990ETVI','2990','Victor Emilio Solis',2,7,1),(82,'3021AOOU','3021','Enrique Tovar',NULL,2,1),(83,'3024OTRE','3024','Roberto Trejo',3,4,1),(84,'3029EZSP','3029','Esperanza Abrego Mazadiego',2,1,1),(85,'3034DIVE','3034','Adrian Rivera',NULL,2,1),(86,'3039ONBO','3039','Ernesto Blanco Barranco',NULL,NULL,1),(87,'3079DIOR','3079','Vladimir Cerezo',2,1,1),(88,'3086VICA','3086','Lizeth Vite Carpio',2,1,1),(89,'3088EMNZ','3088','Elena Mendez',2,1,1),(90,'3089UENS','3089','Guadalupe Hernandez Morales',2,1,1),(91,'3092ERED','3092','Edgar Diaz Romero',2,1,1),(92,'3096AGAZ','3096','Ana Karen Fragoso Cruz',2,1,1),(93,'3117LCEO','3117','Marco Antonio de la Cruz Martinez',2,1,1),(94,'3167LAAH','3167','Maria Guadalupe Hernandez Botello',2,1,1),(95,'3188MMGO','3188','Alberto Guzman',NULL,2,1),(96,'3189NLDU','3189','Luis Daniel Nicolas Ferruzca',2,2,1),(97,'3205RFNJ','3205','JONATHAN FLORES HERNANDEZ',2,7,1),(98,'3249GECJ','3249','Geovani Ceja',NULL,NULL,1),(99,'3250RTAS','3250','Victor Cobarrubias',7,7,1),(100,'3274JULE','3274','Jose Paul Martinez Torres',NULL,NULL,1),(101,'3276ZRAU','3276','Jose Cruz Luna Alvarez',NULL,NULL,1),(102,'3336IIWE','3336','Erwin de Santiago',NULL,2,1),(103,'3344AMLD','3344','Paloma Merari Hernandez Pi a',NULL,NULL,1),(104,'3350EANE','3350','Joaquin Isael Hernandez Ramirez',NULL,NULL,1),(105,'3352EESC','3352','Vanessa Camacho',7,8,1),(106,'3354YSNS','3354','Oscar Daniel Reyes Rojas',2,2,1),(107,'3359ARIG','3359','Gabriela Lucia Garcia Juarez',NULL,NULL,1),(108,'3363JAJZ','3363','Jaime Antonio Juarez',2,1,1),(109,'3430HRDE','3430','Dolores Hernandez',2,2,1),(110,'3433AEZZ','3433','Alan Gonzalez Cervantes',NULL,NULL,1),(111,'3447RRZO','3447','Karla Gabriela Lopez Garcia',NULL,7,1),(112,'3500RBIN','3500','Rebeca Giron',NULL,NULL,1),(113,'3510IAOO','3510','Matsumoto Shuichi',NULL,NULL,1),(114,'3550SEIH','3550','Isael Hernandez',NULL,7,1),(115,'3551AUES','3551','Daniela Ledesma Paulin',2,1,1),(116,'3566ENAA','3566','Fernando Sanchez Pacheco',2,1,1),(117,'3567EURE','3567','Ricardo Martinez Perrusquia',NULL,NULL,1),(118,'3589CHAH','3589','Michelle Saturnino',NULL,2,1),(119,'3607AGRA','3607','Granados Arias Abraham',2,2,1),(120,'3608ESAA','3608','Jose Silverio Abasolo',NULL,NULL,1),(121,'3623CSNI','3623','Daniel Bárcenas',1,5,1),(122,'3637IPOL','3637','ISMAEL LOPEZ FLORES',2,1,1),(123,'3664OOGR','3664','Olga Olvera Grande',2,1,1),(124,'3762ROMM','3762','Roman Moreno Martinez',2,1,1),(125,'3784NNER','3784','German Hernandez García',2,1,1),(126,'386HENB','386','Abimelec Hernandez',2,4,1),(127,'3876MGIO','3876','Luis Adrian Aguilar Mota',NULL,NULL,1),(128,'3896SEDA','3896','Manuel Alejandro Fonseca Sanchez',2,2,1),(129,'3903IMCD','3903','Liliana Maceda',7,8,1),(130,'3945APER','3945','Paola Perez',2,2,1),(131,'3954JIAI','3954','JAIRO LEON JIMENEZ',2,2,1),(132,'3958NONO','3958','Inaoka Toyokiyo',2,NULL,1),(133,'3961EUEE','3961','Jorge Alberto Moreno Ruiz',NULL,NULL,1),(134,'3976MVHZ','3976','Manuel Vasquez Hernandez',2,1,1),(135,'3983HROS','3983','Heriberto Crispin Silva',2,1,1),(136,'3994EENE','3994','Estefania Vega',NULL,NULL,1),(137,'3997OGZA','3997','Antonio Gonzaga',NULL,2,1),(138,'3998REEA','3998','Uriel Arciniega Rodriguez',2,2,1),(139,'4002RAQR','4002','Gerardo Vazquez Xochihua',2,1,1),(140,'4008EMLC','4008','Edgar Manuel Lara Carrera',2,1,1),(141,'4047GHID','4047','Guillermo Hernandez Barrientos',2,2,1),(142,'4048ORUZ','4048','Francisco Ruiz',NULL,2,1),(143,'4068IAAI','4068','Mauricio Acuña ',6,2,1),(144,'4082LJZA','4082','Alejandro Isai Elias Juarez',NULL,NULL,1),(145,'4103LANE','4103','Juan Alejandro Mendez Juan',NULL,NULL,1),(146,'4127LLDM','4127','Rogelio Arista Ledezma',2,1,1),(147,'4128ZIMM','4128','Carlos Adrian Martinez',2,1,1),(148,'4152KORA','4152','Ana Karen Oropeza',2,2,1),(149,'4163CAAR','4163','Carlos Apolinar',2,7,1),(150,'4224OOAI','4224','Veronica Blanca Flores',NULL,NULL,1),(151,'4234EETA','4234','HECTOR MANUEL JIMENEZ MEZA',2,1,1),(152,'4237ANIA','4237','Andres Ibarra',2,1,1),(153,'4238RICG','4238','Rosas Coyotl Irving',2,2,1),(154,'4267ONDD','4267','Andrea Roldan',2,7,1),(155,'4299TKON','4299','Ko Mineta',2,NULL,1),(156,'4300ZOJS','4300','Jose Luis Castillo Cruz',2,2,1),(157,'4329OWCA','4329','Oswaldo Cuatecontzi',2,2,1),(158,'4330TEGM','4330','Guillermo Duarte',NULL,2,1),(159,'4337EEEC','4337','Eder Ivan Cobos Villegas',2,1,1),(160,'4368FNEF','4368','Alexis Fernando Nuñez Hernandez',NULL,NULL,1),(161,'4370YOAC','4370','Pedro Mayo Cobo',2,8,1),(162,'4422MLAO','4422','Alberto Montiel',2,2,1),(163,'4443XRID','4443','Alexis Hernandez',NULL,2,1),(164,'4455QANN','4455','Lizeth Mariana Guzman De Aquino',NULL,NULL,1),(165,'4479AOLR','4479','Andrea Arellano Gutierrez',NULL,NULL,1),(166,'4487NMAA','4487','Adan Martinez',NULL,2,1),(167,'4517FLAE','4517','Felipe Juarez',2,1,1),(168,'4532ISFR','4532','Francisco Solis',NULL,2,1),(169,'4533NNNN','4533','Joanna Lozano',NULL,2,1),(170,'4557ERNO','4557','Alondra Abigail Lopez Gallegos',2,1,1),(171,'4565NNSU','4565','Ana Suarez ',6,7,1),(172,'4587IDEE','4587','Diana Rodriguez Cordero',NULL,NULL,1),(173,'4594NOSR','4594','Brenda Monse Jeronimo De La Concha',NULL,NULL,1),(174,'4596TAMT','4596','Andrea Estrada Menchaca',NULL,NULL,1),(175,'4635NATO','4635','Jesus Antonio Tirado Flores',NULL,NULL,1),(176,'4639FRYS','4639','Farid Reyes',2,2,1),(177,'4640REIO','4640','Julia Cordero',2,NULL,1),(178,'4645NREO','4645','Juan Jose Ortiz Rodriguez',2,5,1),(179,'4647KEUI','4647','Yuki Tsunekuni',2,NULL,1),(180,'4648VSCA','4648','Karla Olga Vilchis Carrasco',2,1,1),(181,'4652EATN','4652','Sebastian Diaz',2,7,1),(182,'4681AMRR','4681','Carlos Alberto Perdomo Zarazua',NULL,NULL,1),(183,'4682AUUD','4682','Gabriel Duran',NULL,2,1),(184,'4688NNEE','4688','Erick Hernandez',2,1,1),(185,'4689KNGA','4689','Karen Galvan',2,1,1),(186,'4694ANRK','4694','Kensaku Kuroki',NULL,NULL,1),(187,'4695FOGZ','4695','FERNANDO GONZALEZ GUTIERREZ',2,2,1),(188,'4729ORRR','4729','Carolina Moreno Torres',NULL,NULL,1),(189,'4730ELEC','4730','Dulce Olvera',7,2,1),(190,'4731XAEE','4731','Axel Estrada Arguello',2,2,1),(191,'4740DTAE','4740','Shamed Sebastian Ramirez Lopez',NULL,NULL,1),(192,'4758EGSR','4758','Gloria Elia Sanchez Rodriguez',2,2,1),(193,'4788ABHZ','4788','Antonio Barcena Hernandez',2,1,1),(194,'4826AFCS','4826','Frida Campos Morales',NULL,NULL,1),(195,'4844OLMI','4844','Mario Castillo',NULL,NULL,1),(196,'4849BEPM','4849','BRENDA PEREZ MUÑOZ',2,2,1),(197,'4855RFRA','4855','Rafael Rangel',2,1,1),(198,'4856NXHA','4856','Ximena Chavez Salas',6,7,1),(199,'4865LEVA','4865','Eduardo Leon Vaca',2,1,1),(200,'4867ANCS','4867','Adrian Cruz Silva',2,NULL,1),(201,'4880LSUI','4880','Miriam Janeth Vargas Aguilar',NULL,NULL,1),(202,'4889LRES','4889','Daniela Flores Montalvo',NULL,NULL,1),(203,'4890ZRZI','4890','Mayra Lizeth Zapata Cruz',NULL,NULL,1),(204,'4902IESL','4902','Dennys Yadira Piñon Elizalde',NULL,NULL,1),(205,'4904DNGA','4904','Eugenia Landaverde Medina',NULL,NULL,1),(206,'4912ROGD','4912','Ricardo Guichard',2,1,1),(207,'4930AROE','4930','Jaqueline Gomez',NULL,2,1),(208,'4939EUUE','4939','Regina Manriquez Cruz',NULL,NULL,1),(209,'4978ECLA','4978','ALMA CECILIA GALVAN',2,2,1),(210,'502RROA','502','Rigoberto Jaimes',2,2,1),(211,'5041VIEP','5041','David Ponce',NULL,2,1),(212,'5042HPRL','5042','Raul Hernandez Perez',2,1,1),(213,'5044SEVE','5044','Lezlie Yevsalem Leon Lomeli',NULL,NULL,1),(214,'5066AAEN','5066','Angelica Ugalde Barrón',2,1,1),(215,'5079JGVE','5079','Jesus Edcel Garcia Vicente',2,2,1),(216,'507ETAI','507','Tomas jaime',2,1,1),(217,'5083CPCE','5083','Cecilia Perez Castillo',2,2,1),(218,'5084ROMM','5084','Rocio Martinez Martinez',2,2,1),(219,'5087JAME','5087','Jimena Ángel',1,5,1),(220,'5121TTME','5121','Lucia Nataly Ramirez Moreno',NULL,NULL,1),(221,'5124AZLA','5124','Angel Gonzalez',2,1,1),(222,'5136GPUR','5136','Guadalupe Uribe Resendiz',2,1,1),(223,'5137MVOL','5137','Luis Obed Marino Vazquez',2,2,1),(224,'5148HALE','5148','Acosta Echeveria Adriana Lizeth',2,2,1),(225,'5159NFFN','5159','Estefania Hernández',1,2,1),(226,'5163CNTH','5163','Martha Sanchez',2,1,1),(227,'5172NIAU','5172','Tanaka Tomoyuki',NULL,NULL,1),(228,'5173GIRU','5173','Ishizaki Suguru',NULL,NULL,1),(229,'5174OIKT','5174','Kimoto',2,NULL,1),(230,'5175LAMM','5175','Jocelyne Huerta',NULL,2,1),(231,'5176OONA','5176','Veronica Resendiz',NULL,2,1),(232,'5177SJNN','5177','Oscar Jimenez',2,2,1),(233,'5180ZHRE','5180','Roberto Hernandez',2,NULL,1),(234,'5219JJGO','5219','Jonathan Jesus Alvarez Garcia',2,2,1),(235,'5220SENR','5220','Juan Angel Hernandez Resendiz',2,2,1),(236,'5221ZEUC','5221','Jorge Cruz',NULL,2,1),(237,'5237OOJO','5237','José Mote',2,NULL,1),(238,'5254IGMA','5254','Mario Gibo',7,NULL,1),(239,'5264TIIE','5264','Sebastian Pineda',NULL,2,1),(240,'5265ALZQ','5265','Alfonso Carrizales Loque',2,2,1),(241,'5266EHJL','5266','Jose Luis Hernandez Escobedo',2,2,1),(242,'5292ESOL','5292','Gemma Morales',7,7,1),(243,'5299AAAO','5299','Carolina Flores',NULL,NULL,1),(244,'5323RZDR','5323','Eduardo Hernandez',NULL,2,1),(245,'5349MEGZ','5349','Miguel Guzman',2,2,1),(246,'5362SATA','5362','Sagae Atsushi',2,NULL,1),(247,'5363TAYA','5363','Tatsuya Kawabata',2,NULL,1),(248,'5365SGLA','5365','Salvador Garcia',2,1,1),(249,'5367ZIDG','5367','Diego Zuñiga',2,2,1),(250,'5370MAHE','5370','Maria Abigail Hernandez',2,2,1),(251,'5379REAN','5379','Selena Rangel Lopez',6,8,1),(252,'5383YOFR','5383','Yair Ordoñez Ferrusca',NULL,2,1),(253,'5386AEOO','5386','Rolando Canete',NULL,2,1),(254,'5405OLOL','5405','Fernando Villalobos ',6,NULL,1),(255,'5412TMFA','5412','Tomas Figueroa',2,1,1),(256,'5413JAPZ','5413','Jesus Arreola Perez',2,1,1),(257,'5415ÑBEA','5415','Heber Peña',2,2,1),(258,'5419OOOL','5419','Daniela Botello',2,2,1),(259,'5426UUSF','5426','Faustino Fierro',2,2,1),(260,'5428VAAU','5428','Miguel Quiroga Vargas',NULL,2,1),(261,'5445DSLD','5445','Antonio de Jesus Resendiz Esquivel',2,1,1),(262,'5451RGRU','5451','CARLOS RODRIGUEZ JUAREZ',2,1,1),(263,'5455RRZN','5455','Karen Chavez Hernandez',2,1,1),(264,'5459ERAS','5459','Emilia Resendiz',NULL,2,1),(265,'5480AALA','5480','William Garcia',NULL,2,1),(266,'5486PZER','5486','Edgar Perez',2,1,1),(267,'5487IOIC','5487','Uriel Ochoa',2,NULL,1),(268,'5488ANCO','5488','ana cruz granados',2,1,1),(269,'5495ASOP','5495','Maday Espinosa',2,NULL,1),(270,'561SSNO','561','Alfonso Hernandez',NULL,2,1),(271,'562JMZZ','562','Juan Almaraz Almaraz',2,1,1),(272,'596BFPE','596','Brandon Francisco Perez',2,7,1),(273,'628CRCA','628','Carlos Arcila',NULL,2,1),(274,'629MPMO','629','Maricruz Paulin Moreno',2,1,1),(275,'631REUO','631','Jose Luis Segura',NULL,NULL,1),(276,'657RONE','657','Leonardo Mendoza',2,1,1),(277,'66OJLC','66','Juan Carlos Olvera',2,3,1),(278,'674HEAJ','674','Jorge Antonio Hernandez Espinoza',1,4,1),(279,'685JOZN','685','J Cruz Gonzalez Barcenas',2,NULL,1),(280,'688LEHZ','688','Luis Enrique Hernandez',2,1,1),(281,'68MNZA','68','Nicacio Martinez',2,1,1),(282,'705ERA','705','Erik Ramirez',2,4,1),(283,'811BDSA','811','Barenca Salgado Daniel',2,7,1),(284,'81RGLH','81','Rigel Ham',1,3,1),(285,'900SRUL','900','Jose Saul Gutierrez',2,1,1),(286,'911PAZD','911','Adriana Perez Oropeza',2,1,1),(287,'933SGLO','933','Sergio Lopez',2,7,1),(288,'980OSLR','980','Luis Fragoso',2,7,1),(289,'981ATOA','981','Josue Castro',NULL,3,1),(290,'982AAIA','982','Isai Salazar',2,7,1),(291,'983TRUN','983','Faustino Fierro',NULL,4,1),(292,'9998AIIP','9998','Mauricio Villalpando',NULL,NULL,1),(293,'9999EZOZ','9999','Fabian Gonzalez',3,NULL,1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `version`
--

DROP TABLE IF EXISTS `version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `version` (
  `Id_Version` int NOT NULL AUTO_INCREMENT,
  `Id_Pregunta` int DEFAULT NULL,
  `Id_Revision` int DEFAULT NULL,
  `Activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`Id_Version`),
  KEY `Id_Pregunta` (`Id_Pregunta`),
  KEY `Id_Revision` (`Id_Revision`),
  CONSTRAINT `version_ibfk_1` FOREIGN KEY (`Id_Pregunta`) REFERENCES `preguntas` (`Id_Pregunta`),
  CONSTRAINT `version_ibfk_2` FOREIGN KEY (`Id_Revision`) REFERENCES `revision` (`Id_Revision`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `version`
--

LOCK TABLES `version` WRITE;
/*!40000 ALTER TABLE `version` DISABLE KEYS */;
INSERT INTO `version` VALUES (1,1,2,1),(2,2,2,1),(3,3,2,1),(4,4,2,1),(5,5,2,1),(6,6,2,1),(7,8,2,1),(8,10,2,1),(9,11,2,1),(10,12,2,1),(11,13,2,1),(12,14,2,1),(13,16,2,1),(14,17,2,1),(15,18,2,1),(16,19,2,1);
/*!40000 ALTER TABLE `version` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 16:28:55
