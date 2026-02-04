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

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'ba5d3104-fc7c-11f0-94f9-c4efbb91b416:1-35';

--
-- Table structure for table `calendario`
--

DROP TABLE IF EXISTS `calendario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendario` (
  `Id_Calendario` int NOT NULL AUTO_INCREMENT,
  `Id_Supervisor` int DEFAULT NULL,
  `Id_Linea_Supervisor` int DEFAULT NULL,
  `Id_Linea_Evaluada` int DEFAULT NULL,
  `Fecha_Creacion` date DEFAULT NULL,
  `Fecha_Inicio` date DEFAULT NULL,
  `Fecha_Fin` date DEFAULT NULL,
  `Id_Auditoria` int DEFAULT NULL,
  `Id_Estado` int DEFAULT NULL,
  `Activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`Id_Calendario`),
  KEY `Id_Supervisor` (`Id_Supervisor`),
  KEY `Id_Linea_Supervisor` (`Id_Linea_Supervisor`),
  KEY `Id_Linea_Evaluada` (`Id_Linea_Evaluada`),
  KEY `Id_Auditoria` (`Id_Auditoria`),
  KEY `Id_Estado` (`Id_Estado`),
  CONSTRAINT `calendario_ibfk_1` FOREIGN KEY (`Id_Supervisor`) REFERENCES `usuarios` (`Id_Usuario`),
  CONSTRAINT `calendario_ibfk_2` FOREIGN KEY (`Id_Linea_Supervisor`) REFERENCES `linea` (`Id_Linea`),
  CONSTRAINT `calendario_ibfk_3` FOREIGN KEY (`Id_Linea_Evaluada`) REFERENCES `linea` (`Id_Linea`),
  CONSTRAINT `calendario_ibfk_4` FOREIGN KEY (`Id_Auditoria`) REFERENCES `tipo_auditoria` (`Id_Auditoria`),
  CONSTRAINT `calendario_ibfk_5` FOREIGN KEY (`Id_Estado`) REFERENCES `tipo_estados` (`Id_Estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendario`
--

LOCK TABLES `calendario` WRITE;
/*!40000 ALTER TABLE `calendario` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendario` ENABLE KEYS */;
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

-- Dump completed on 2026-02-04 16:35:18
