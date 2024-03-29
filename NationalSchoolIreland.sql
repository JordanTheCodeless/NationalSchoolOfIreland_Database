CREATE DATABASE  IF NOT EXISTS `primaryschool` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `primaryschool`;
-- MySQL dump 10.13  Distrib 8.0.36, for macos14 (x86_64)
--
-- Host: localhost    Database: primaryschool
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Temporary view structure for view `all_parents`
--

DROP TABLE IF EXISTS `all_parents`;
/*!50001 DROP VIEW IF EXISTS `all_parents`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `all_parents` AS SELECT 
 1 AS `parentID`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `employeeID` int NOT NULL,
  `position` varchar(14) NOT NULL,
  `employeeFirstName` varchar(50) NOT NULL,
  `employeeLastName` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `faculty` varchar(14) DEFAULT NULL,
  `salary` int DEFAULT NULL,
  `facultyID` int NOT NULL,
  PRIMARY KEY (`employeeID`),
  KEY `fk_employees_Faculty1_idx` (`facultyID`),
  CONSTRAINT `fk_employees_Faculty1` FOREIGN KEY (`facultyID`) REFERENCES `Faculty` (`facultyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'vice principal','Ginnie','Karczinski','gkarczinski0@nydailynews.com','F','administration',34000,2),(2,'teacher','Carling','Lusk','clusk1@seesaa.net','M','teaching',32000,3),(3,'teacher','Derick','Rhydderch','drhydderch2@oaic.gov.au','M','teaching',32000,3),(4,'caretaker','Kalvin','Tomaskunas','ktomaskunas3@facebook.com','M','housekeeping',32000,1),(5,'janitor','Uriah','Keller','ukeller4@msu.edu','M','housekeeping',24000,1),(6,'janitor','Flori','Hambrook','fhambrook5@ebay.co.uk','F','housekeeping',24000,1),(7,'teacher','Emogene','Toon','etoon6@4shared.com','F','teaching',34000,3),(8,'teacher','Mackenzie','Denisyuk','mdenisyuk7@ycombinator.com','M','teaching',32000,3),(9,'teacher','Hanan','Gaskill','hgaskill8@oracle.com','M','teaching',32000,3),(10,'teacher','Ashla','Kleeman','akleeman9@bluehost.com','F','teaching',32000,3),(11,'secretary','Ethelin','Habershaw','ehabershawa@ucoz.ru','F','administration',32000,2),(12,'principal','Calida','Teodorski','cteodorskib@opera.com','F','administration',50000,2),(13,'administration','Michael','Nuccitelli','mnuccitellic@discuz.net','M','administration',32000,2),(14,'janitor','Vaclav','Keeble','vkeebled@independent.co.uk','M','housekeeping',24000,1),(15,'janitor','Hanny','Cantrill','hcantrille@webmd.com','F','housekeeping',24000,1),(16,'teacher','Collie','Kenny','ckennyf@shareasale.com','F','teaching',32000,3);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Faculty`
--

DROP TABLE IF EXISTS `Faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Faculty` (
  `facultyID` int NOT NULL,
  `faculty` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`facultyID`),
  UNIQUE KEY `facultyID` (`facultyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Faculty`
--

LOCK TABLES `Faculty` WRITE;
/*!40000 ALTER TABLE `Faculty` DISABLE KEYS */;
INSERT INTO `Faculty` VALUES (1,'housekeeping'),(2,'administration'),(3,'teaching');
/*!40000 ALTER TABLE `Faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fees`
--

DROP TABLE IF EXISTS `Fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Fees` (
  `invoiceNo` int NOT NULL,
  `studentID` int NOT NULL,
  `parentID` int NOT NULL,
  `fees` decimal(10,0) DEFAULT NULL,
  `paymentMethod` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`invoiceNo`),
  UNIQUE KEY `invoiceNo` (`invoiceNo`),
  KEY `studentID` (`studentID`),
  KEY `parentID` (`parentID`),
  CONSTRAINT `fees_ibfk_1` FOREIGN KEY (`studentID`) REFERENCES `Student` (`studentID`),
  CONSTRAINT `fees_ibfk_2` FOREIGN KEY (`parentID`) REFERENCES `Parent` (`parentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fees`
--

LOCK TABLES `Fees` WRITE;
/*!40000 ALTER TABLE `Fees` DISABLE KEYS */;
INSERT INTO `Fees` VALUES (69,66,39,500,'card'),(73,97,43,300,'physical'),(189,116,60,500,'card'),(238,14,59,500,'installments'),(267,42,29,300,'card'),(345,99,13,300,'physical'),(349,75,93,300,'installments'),(560,72,15,300,'installments'),(634,45,85,200,'installments'),(815,27,6,76,'physical'),(1017,86,54,300,'installments'),(1074,2,29,76,'card'),(1097,115,32,50,'installments'),(1133,37,94,0,'installments'),(1154,113,89,76,'card'),(1180,41,4,300,'installments'),(1201,7,36,50,'physical'),(1240,50,38,0,'card'),(1453,32,87,200,'physical'),(1587,89,31,0,'card'),(1634,67,28,300,'installments'),(1721,33,59,150,'card'),(1770,55,80,76,'installments'),(1864,8,72,50,'card'),(1956,90,27,150,'card'),(1971,93,74,500,'installments'),(2114,3,84,76,'physical'),(2232,43,74,500,'card'),(2320,98,56,100,'card'),(2328,48,23,200,'physical'),(2413,84,93,200,'card'),(2591,69,22,300,'physical'),(2646,10,75,300,'card'),(2656,1,40,0,'card'),(2729,59,63,150,'installments'),(2745,23,62,500,'physical'),(2819,105,33,300,'physical'),(3104,30,66,76,'physical'),(3469,70,29,0,'installments'),(3474,22,6,200,'physical'),(3488,106,69,300,'physical'),(3642,95,16,100,'installments'),(3774,77,46,0,'card'),(3796,63,5,300,'installments'),(3815,96,22,76,'card'),(3890,26,22,500,'physical'),(3916,74,40,200,'installments'),(3933,82,64,0,'physical'),(3985,71,50,76,'installments'),(4117,24,67,500,'physical'),(4215,25,58,50,'card'),(4351,56,23,300,'card'),(4382,103,62,300,'installments'),(4439,36,30,150,'card'),(4456,81,60,500,'installments'),(4508,52,24,500,'physical'),(4612,34,77,150,'installments'),(4643,35,64,100,'installments'),(4674,119,48,200,'card'),(4804,4,1,100,'card'),(5055,91,81,200,'installments'),(5201,53,38,500,'physical'),(5292,101,23,0,'physical'),(5345,46,88,100,'card'),(5379,64,6,100,'card'),(5485,54,83,76,'installments'),(5575,102,46,50,'card'),(5649,11,49,300,'physical'),(5663,109,75,200,'installments'),(5764,39,80,150,'installments'),(5781,20,3,100,'installments'),(5846,76,94,150,'installments'),(6031,40,59,76,'card'),(6067,6,38,76,'installments'),(6134,15,23,500,'installments'),(6159,31,90,100,'card'),(6187,83,57,150,'physical'),(6344,17,13,150,'installments'),(6533,88,68,150,'card'),(6549,73,52,300,'physical'),(6617,65,2,50,'physical'),(6647,57,5,500,'card'),(6747,111,40,500,'card'),(6962,61,10,50,'installments'),(6969,19,30,200,'installments'),(7072,85,88,76,'card'),(7112,12,55,300,'physical'),(7147,60,45,500,'installments'),(7228,5,59,500,'physical'),(7401,51,66,200,'installments'),(7439,9,12,100,'card'),(7450,18,83,150,'installments'),(7650,104,45,100,'installments'),(7882,21,86,0,'physical'),(7978,87,37,200,'installments'),(8093,62,87,300,'physical'),(8139,108,79,500,'installments'),(8144,28,79,76,'physical'),(8233,29,52,50,'installments'),(8529,13,63,150,'physical'),(8802,80,30,100,'installments'),(8831,49,64,100,'card'),(8869,94,26,500,'card'),(8876,68,25,0,'physical'),(8929,38,92,100,'card'),(9036,120,86,76,'physical'),(9048,44,12,0,'physical'),(9139,58,97,76,'physical'),(9183,110,55,200,'physical'),(9340,79,83,76,'card'),(9364,112,38,300,'card'),(9505,117,57,50,'card'),(9613,16,97,200,'card'),(9647,47,14,200,'installments'),(9648,78,93,200,'card'),(9676,100,10,50,'installments'),(9747,107,3,50,'installments'),(9829,92,68,76,'physical');
/*!40000 ALTER TABLE `Fees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grades`
--

DROP TABLE IF EXISTS `grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grades` (
  `studentID` int NOT NULL,
  `yearID` int NOT NULL,
  `Irish` decimal(4,1) DEFAULT NULL,
  `History` decimal(4,1) DEFAULT NULL,
  `Maths` decimal(4,1) DEFAULT NULL,
  `English` decimal(4,1) DEFAULT NULL,
  `Geography` decimal(4,1) DEFAULT NULL,
  `PE` varchar(4) DEFAULT NULL,
  UNIQUE KEY `studentID_UNIQUE` (`studentID`),
  KEY `yearID` (`yearID`),
  CONSTRAINT `grades_ibfk_1` FOREIGN KEY (`studentID`) REFERENCES `Student` (`studentID`),
  CONSTRAINT `grades_ibfk_2` FOREIGN KEY (`yearID`) REFERENCES `Year` (`yearID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grades`
--

LOCK TABLES `grades` WRITE;
/*!40000 ALTER TABLE `grades` DISABLE KEYS */;
INSERT INTO `grades` VALUES (1,1,54.4,64.4,70.2,63.4,50.8,'pass'),(2,2,54.8,81.2,73.2,80.7,73.7,'pass'),(3,3,69.2,67.4,70.8,77.9,89.4,'pass'),(4,1,75.6,86.0,74.2,98.2,71.5,'pass'),(5,1,50.2,71.6,34.4,33.7,63.3,'pass'),(6,6,32.8,43.3,39.7,98.3,74.5,'pass'),(7,4,80.1,77.1,72.7,54.9,76.7,'pass'),(8,3,87.6,95.9,98.0,69.6,64.1,'fail'),(9,5,92.0,75.4,63.1,83.7,72.7,'pass'),(10,4,99.9,89.4,61.5,55.3,83.1,'fail'),(11,3,62.4,33.3,55.4,58.0,58.0,'fail'),(12,5,84.8,84.4,99.3,43.7,92.5,'fail'),(13,2,82.0,61.9,45.5,51.3,69.5,'fail'),(14,4,61.8,72.7,50.4,73.4,53.7,'fail'),(15,5,94.7,30.0,64.4,30.1,50.1,'pass'),(16,1,45.0,34.6,35.3,82.4,50.1,'pass'),(17,5,81.4,73.8,48.9,37.1,93.7,'pass'),(18,4,57.9,79.0,91.5,40.5,69.8,'fail'),(19,5,92.3,82.5,83.5,41.8,59.9,'fail'),(20,2,54.0,48.1,67.5,60.4,47.4,'fail'),(21,4,83.8,58.2,58.1,43.2,46.8,'pass'),(22,5,34.6,74.4,58.0,58.7,32.3,'pass'),(23,1,72.6,66.4,88.4,98.2,76.2,'pass'),(24,2,87.3,56.7,44.0,42.4,32.0,'fail'),(25,2,92.5,86.5,63.5,48.7,68.5,'fail'),(26,1,57.5,49.2,59.1,34.8,51.2,'pass'),(27,4,55.2,77.1,90.9,80.0,34.4,'fail'),(28,6,39.0,90.0,91.2,79.0,46.5,'fail'),(29,4,31.5,97.6,99.4,98.1,45.0,'pass'),(30,6,61.3,96.8,81.3,69.0,77.5,'pass'),(31,3,86.4,84.8,42.1,75.7,54.2,'fail'),(32,5,61.9,89.0,52.3,30.0,72.7,'fail'),(33,4,86.1,30.5,71.2,81.7,32.1,'pass'),(34,4,82.5,73.0,43.4,88.5,83.4,'pass'),(35,1,84.9,64.2,52.3,63.8,45.2,'fail'),(36,2,61.2,64.5,30.1,79.1,50.1,'fail'),(37,4,67.5,70.4,63.7,96.6,41.8,'fail'),(38,1,80.5,35.3,74.6,69.6,76.3,'pass'),(39,3,92.1,63.0,56.9,94.3,93.6,'fail'),(40,3,85.0,67.7,64.9,70.1,61.1,'fail'),(41,1,98.6,77.5,93.2,84.1,66.6,'pass'),(42,4,84.1,59.8,52.3,83.7,40.0,'fail'),(43,5,62.1,46.3,39.7,72.0,97.5,'fail'),(44,6,83.1,95.0,37.4,91.5,64.7,'pass'),(45,6,61.2,69.9,44.1,60.3,66.4,'pass'),(46,4,63.2,34.6,31.8,93.9,72.2,'fail'),(47,4,41.6,48.8,70.6,44.5,56.9,'pass'),(48,3,68.5,54.0,89.8,93.8,56.0,'fail'),(49,6,62.3,97.2,55.2,60.2,35.4,'pass'),(50,5,31.9,78.4,38.7,51.8,48.2,'fail'),(51,2,88.4,64.2,94.5,75.4,66.9,'pass'),(52,4,54.6,52.5,37.3,69.2,63.2,'fail'),(53,1,34.8,95.7,54.7,42.0,67.7,'pass'),(54,5,93.5,73.5,64.7,76.8,69.0,'fail'),(55,1,76.6,62.5,75.1,41.5,78.4,'pass'),(56,2,80.0,63.6,42.6,47.2,95.3,'pass'),(57,4,76.8,66.4,91.1,68.4,82.9,'fail'),(58,6,37.1,48.5,53.8,87.3,52.1,'fail'),(59,2,54.5,52.0,79.9,80.5,35.4,'pass'),(60,4,44.0,66.1,36.2,77.7,63.2,'fail'),(61,1,92.8,81.3,95.6,86.6,30.6,'pass'),(62,2,40.7,86.9,73.7,49.4,78.8,'fail'),(63,3,72.8,64.4,59.8,52.3,61.3,'fail'),(64,2,53.8,76.0,47.0,32.2,35.9,'fail'),(65,5,58.0,80.4,72.2,66.7,65.9,'fail'),(66,6,98.9,93.2,78.0,65.8,70.3,'pass'),(67,4,76.1,80.7,74.7,58.7,94.6,'pass'),(68,4,91.1,81.7,55.6,72.3,52.8,'pass'),(69,3,76.2,60.6,63.7,33.8,67.8,'pass'),(70,5,86.4,64.4,47.7,99.4,59.5,'fail'),(71,1,58.7,93.3,54.2,88.4,75.4,'fail'),(72,3,82.6,99.9,65.9,50.4,86.9,'fail'),(73,6,96.7,51.5,88.4,88.8,89.8,'fail'),(74,5,45.9,66.5,92.3,67.9,65.5,'fail'),(75,6,69.1,85.4,87.3,76.8,52.2,'fail'),(76,5,69.9,41.8,30.7,41.7,76.9,'fail'),(77,6,79.3,88.9,99.4,71.9,36.3,'pass'),(78,4,87.1,38.8,81.0,92.6,95.2,'fail'),(79,6,97.6,86.7,44.6,91.1,78.2,'fail'),(80,1,45.9,72.7,66.4,63.0,58.1,'pass'),(81,5,64.4,49.0,50.4,80.8,69.5,'pass'),(82,1,76.7,89.1,32.9,32.0,68.9,'fail'),(83,5,92.9,93.9,48.4,73.8,91.8,'fail'),(84,5,81.4,64.7,43.1,90.4,70.1,'fail'),(85,5,32.7,78.9,79.4,87.3,30.8,'fail'),(86,1,66.7,88.2,30.3,83.0,78.6,'fail'),(87,2,70.4,97.3,89.0,41.7,99.3,'fail'),(88,1,41.1,43.1,93.0,69.8,68.4,'fail'),(89,4,58.6,47.6,31.3,77.9,91.9,'pass'),(90,5,97.2,30.5,41.0,49.5,91.4,'fail'),(91,6,54.0,54.8,47.3,83.3,35.3,'fail'),(92,6,30.0,71.5,73.7,81.2,84.1,'fail'),(93,2,52.4,81.3,86.9,32.3,34.8,'pass'),(94,4,83.9,59.3,75.7,93.0,89.5,'fail'),(95,5,39.6,61.8,73.3,77.9,76.8,'fail'),(96,2,62.9,97.2,53.5,53.0,72.7,'fail'),(97,2,61.8,60.3,42.8,35.8,43.2,'fail'),(98,5,52.2,48.5,48.0,67.5,71.7,'pass'),(99,3,68.7,89.4,55.9,77.3,87.8,'pass'),(100,1,39.6,70.5,36.8,61.2,78.3,'pass'),(101,5,31.5,90.5,62.3,68.3,86.9,'pass'),(102,1,82.2,93.8,57.1,77.7,34.5,'fail'),(103,3,58.5,33.9,60.5,78.1,44.6,'pass'),(104,4,54.2,47.9,99.4,89.0,62.9,'pass'),(105,6,77.6,42.3,83.0,99.0,88.7,'pass'),(106,4,88.1,62.3,84.0,70.0,68.2,'pass'),(107,2,60.0,78.7,36.2,93.8,71.5,'pass'),(108,2,76.3,46.5,40.3,96.5,82.2,'pass'),(109,4,75.8,73.6,58.7,76.1,89.8,'fail'),(110,3,84.3,55.6,86.0,84.1,46.1,'pass'),(111,5,96.4,89.4,77.3,93.4,52.0,'pass'),(112,6,48.6,58.4,49.0,94.2,73.9,'fail'),(113,6,51.5,84.6,94.0,90.6,97.0,'fail'),(114,2,39.8,40.6,48.7,35.7,50.3,'fail'),(115,3,60.3,47.5,72.5,31.5,99.6,'pass'),(116,1,66.7,86.6,87.0,45.4,93.1,'pass'),(117,1,32.9,97.7,77.1,51.1,85.7,'pass'),(118,4,85.5,80.1,57.6,36.9,50.4,'pass'),(119,2,66.8,69.9,89.0,38.4,75.6,'fail'),(120,5,37.9,59.6,34.2,31.7,92.5,'fail');
/*!40000 ALTER TABLE `grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Hours`
--

DROP TABLE IF EXISTS `Hours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Hours` (
  `rotaID` varchar(4) NOT NULL,
  `employeeID` int NOT NULL,
  `employeeFirstName` varchar(9) NOT NULL,
  `facultyID` int NOT NULL,
  `mondayHours` int DEFAULT NULL,
  `tuesdayHours` int DEFAULT NULL,
  `wednesdayHours` int DEFAULT NULL,
  `thursdayHours` int DEFAULT NULL,
  `fridayHours` int DEFAULT NULL,
  `saturdayHours` int DEFAULT NULL,
  `sundayHours` int DEFAULT NULL,
  PRIMARY KEY (`rotaID`),
  KEY `facultyID` (`facultyID`),
  KEY `employeeID` (`employeeID`),
  CONSTRAINT `hours_ibfk_1` FOREIGN KEY (`facultyID`) REFERENCES `Faculty` (`facultyID`),
  CONSTRAINT `hours_ibfk_2` FOREIGN KEY (`employeeID`) REFERENCES `employees` (`employeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hours`
--

LOCK TABLES `Hours` WRITE;
/*!40000 ALTER TABLE `Hours` DISABLE KEYS */;
INSERT INTO `Hours` VALUES ('R003',4,'Kalvin',1,6,NULL,8,6,6,8,NULL),('R013',11,'Ethelin',2,6,8,7,6,7,NULL,NULL),('R017',7,'Emogene',3,6,8,6,8,8,NULL,NULL),('R020',16,'Collie',3,8,8,7,8,7,NULL,NULL),('R024',6,'Flori',1,6,8,NULL,7,NULL,6,NULL),('R036',2,'Carling',3,6,6,8,8,6,NULL,NULL),('R037',15,'Hanny',1,NULL,8,7,8,7,NULL,7),('R045',14,'Vaclav',1,6,6,7,7,NULL,NULL,7),('R054',5,'Uriah',1,6,NULL,7,8,7,7,NULL),('R074',10,'Ashla',3,7,8,8,6,7,NULL,NULL),('R084',1,'Ginnie',2,6,6,7,8,6,NULL,NULL),('R086',3,'Derick',3,6,8,6,6,7,NULL,NULL),('R096',8,'Mackenzie',3,7,7,6,8,6,NULL,NULL);
/*!40000 ALTER TABLE `Hours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Parent`
--

DROP TABLE IF EXISTS `Parent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Parent` (
  `parentID` int NOT NULL,
  `parentFirstName` varchar(30) NOT NULL,
  `parentLastName` varchar(30) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `contact` varchar(50) NOT NULL,
  PRIMARY KEY (`parentID`),
  UNIQUE KEY `parentId_UNIQUE` (`parentID`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Parent`
--

LOCK TABLES `Parent` WRITE;
/*!40000 ALTER TABLE `Parent` DISABLE KEYS */;
INSERT INTO `Parent` VALUES (1,'Nessi','Elwill','nelwill0@yelp.com','F','334-497-5105'),(2,'Huberto','Bront','hbront1@is.gd','M','493-476-7856'),(3,'Jamesy','Russan','jrussan2@eventbrite.com','M','960-569-3399'),(4,'Gibb','MacLese','gmaclese3@ovh.net','M','115-449-9065'),(5,'Geri','Casaro','gcasaro4@stumbleupon.com','F','333-107-5931'),(6,'Karry','Wardle','kwardle5@addthis.com','F','121-125-8845'),(8,'Steffane','Kelle','skelle7@163.com','F','697-927-7784'),(10,'Phillipp','Atley','patley9@psu.edu','M','213-476-9951'),(12,'Haven','Matresse','hmatresseb@ibm.com','M','518-534-5972'),(13,'Alvan','Gouldstraw','agouldstrawc@engadget.com','M','464-582-0818'),(14,'Casandra','Agutter','cagutterd@de.vu','F','964-505-0714'),(15,'Gabie','Boniface','gbonifacee@ovh.net','F','484-770-0924'),(16,'Corly','Figgins','cfigginsf@smugmug.com','F','530-567-9324'),(22,'Gardy','Paunsford','gpaunsfordl@biglobe.ne.jp','M','703-626-1082'),(23,'Staford','Hulles','shullesm@businessweek.com','M','312-305-7851'),(24,'Mathias','De Leek','mdeleekn@163.com','M','151-765-8077'),(25,'Shannah','Cattroll','scattrollo@g.co','F','672-306-6719'),(26,'Haze','Mungin','hmunginp@blogtalkradio.com','M','211-697-0977'),(27,'Raeann','Dabinett','rdabinettq@livejournal.com','F','223-356-8594'),(28,'Shawna','Valasek','svalasekr@home.pl','F','618-595-3230'),(29,'Dorene','Houlison','dhoulisons@senate.gov','F','758-747-6264'),(30,'Chelsae','Quinet','cquinett@google.ca','F','129-879-4776'),(31,'Kliment','Brager','kbrageru@friendfeed.com','M','474-227-5124'),(32,'Tonia','Barehead','tbareheadv@bloomberg.com','F','935-148-6558'),(33,'Yule','Jent','yjentw@delicious.com','M','671-676-2464'),(36,'Jeannine','Joyce','jjoycez@weebly.com','F','825-488-2563'),(37,'Hodge','Steiner','hsteiner10@foxnews.com','M','647-104-1610'),(38,'Yvor','Severns','yseverns11@rediff.com','M','368-891-2592'),(39,'Carlyn','Bartosik','cbartosik12@alexa.com','F','492-166-9133'),(40,'Pierce','Attfield','pattfield13@gov.uk','M','737-459-8461'),(42,'Sallyanne','Bumfrey','sbumfrey15@youku.com','F','865-955-4169'),(43,'Alfie','Scaysbrook','ascaysbrook16@symantec.com','F','209-509-5309'),(45,'Sharity','Blything','sblything18@multiply.com','F','368-353-4939'),(46,'Flss','Valencia','fvalencia19@ning.com','F','357-630-3280'),(48,'Maximo','Winfrey','mwinfrey1b@guardian.co.uk','M','630-351-3569'),(49,'Garrek','Whatmough','gwhatmough1c@barnesandnoble.com','M','733-539-2781'),(50,'Farleigh','Larkkem','flarkkem1d@wired.com','M','965-204-1923'),(52,'Reena','Delacroix','rdelacroix1f@whitehouse.gov','F','876-387-4510'),(54,'Eydie','Salkeld','esalkeld1h@oakley.com','F','913-614-6492'),(55,'Isabelle','Legier','ilegier1i@prnewswire.com','F','747-584-6475'),(56,'Freida','Sterndale','fsterndale1j@accuweather.com','F','263-492-3910'),(57,'Claudian','Hardway','chardway1k@independent.co.uk','M','396-395-8216'),(58,'Hayward','Manie','hmanie1l@dell.com','M','765-280-2342'),(59,'Veronika','Larkby','vlarkby1m@uol.com.br','F','486-933-1223'),(60,'Golda','Gladyer','ggladyer1n@people.com.cn','F','690-497-9206'),(62,'Hank','Koomar','hkoomar1p@google.com.br','M','239-556-2339'),(63,'Pippo','Daine','pdaine1q@meetup.com','M','297-270-6662'),(64,'Marnia','Mockler','mmockler1r@trellian.com','F','904-952-1693'),(66,'Jewelle','Powelee','jpowelee1t@uiuc.edu','F','990-827-6699'),(67,'Loleta','Wickersley','lwickersley1u@pen.io','F','414-960-7914'),(68,'Teodora','Jocelyn','tjocelyn1v@cbc.ca','F','875-103-6601'),(69,'Nelie','Bourley','nbourley1w@deliciousdays.com','F','847-175-3754'),(72,'Natividad','Wooder','nwooder1z@mediafire.com','F','916-621-4744'),(74,'Bertrand','O\'Crevan','bocrevan21@dell.com','M','489-596-3417'),(75,'Maggie','Chaucer','mchaucer22@rakuten.co.jp','F','296-627-0141'),(77,'Cecilla','Mulligan','cmulligan24@com.com','F','259-411-6648'),(79,'Evy','Limeburn','elimeburn26@ucoz.com','F','433-969-6001'),(80,'Powell','Touzey','ptouzey27@istockphoto.com','M','203-102-8117'),(81,'Ford','Southgate','fsouthgate28@oakley.com','M','369-502-0762'),(83,'Izaak','Rock','irock2a@chronoengine.com','M','947-772-9739'),(84,'Lowell','Warrier','lwarrier2b@youku.com','M','335-908-4854'),(85,'Mile','Youings','myouings2c@w3.org','M','180-399-6050'),(86,'Garey','Cassells','gcassells2d@prlog.org','M','396-480-9411'),(87,'Frieda','Crickmore','fcrickmore2e@ca.gov','F','838-785-4425'),(88,'Trudey','Rosenberger','trosenberger2f@opera.com','F','318-676-1457'),(89,'Rodolph','Jillis','rjillis2g@jugem.jp','M','682-969-1641'),(90,'Shaylah','Hazzard','shazzard2h@ycombinator.com','F','553-670-4252'),(92,'Clotilda','Dowyer','cdowyer2j@acquirethisname.com','F','718-723-9218'),(93,'Bernita','Barling','bbarling2k@gov.uk','F','923-795-9351'),(94,'Isaak','Lynnitt','ilynnitt2l@bloglovin.com','M','341-749-2435'),(97,'Shirlene','Fulun','sfulun2o@desdev.cn','F','880-367-9693');
/*!40000 ALTER TABLE `Parent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `parents_with_multiple_children`
--

DROP TABLE IF EXISTS `parents_with_multiple_children`;
/*!50001 DROP VIEW IF EXISTS `parents_with_multiple_children`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `parents_with_multiple_children` AS SELECT 
 1 AS `parentID`,
 1 AS `numStudents`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Student`
--

DROP TABLE IF EXISTS `Student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Student` (
  `studentID` int NOT NULL,
  `firstName` varchar(30) NOT NULL,
  `lastName` varchar(30) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `dateOfBirth` date NOT NULL,
  `yearID` int NOT NULL,
  `parentID` int NOT NULL,
  PRIMARY KEY (`studentID`),
  UNIQUE KEY `studentID_UNIQUE` (`studentID`),
  KEY `student_ibfk_1` (`parentID`),
  KEY `fk_Student_Year1_idx` (`yearID`),
  CONSTRAINT `fk_Student_Year1` FOREIGN KEY (`yearID`) REFERENCES `Year` (`yearID`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`parentID`) REFERENCES `Parent` (`parentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student`
--

LOCK TABLES `Student` WRITE;
/*!40000 ALTER TABLE `Student` DISABLE KEYS */;
INSERT INTO `Student` VALUES (1,'Louis','Attfield','M','2018-01-27',1,40),(2,'Caron','Houlison','F','2017-01-29',2,29),(3,'Spencer','Warrier','M','2016-11-25',3,84),(4,'Hollyanne','Elwill','F','2018-03-29',1,1),(5,'Nathaniel','Larkby','M','2018-03-27',1,59),(6,'Debbi','Severns','F','2013-12-13',6,38),(7,'Walker','Joyce','M','2015-04-05',4,36),(8,'Etienne','Wooder','M','2016-05-14',3,72),(9,'Lita','Matresse','F','2014-12-12',5,12),(10,'Humbert','Chaucer','M','2015-08-28',4,75),(11,'Cassie','Whatmough','F','2016-03-24',3,49),(12,'Lilyan','Legier','F','2014-07-29',5,55),(13,'Curtice','Daine','M','2017-07-15',2,63),(14,'Brewer','Larkby','M','2015-03-06',4,59),(15,'Livvie','Hulles','F','2014-09-04',5,23),(16,'Avram','Fulun','M','2018-05-12',1,97),(17,'Benton','Gouldstraw','M','2014-12-23',5,13),(18,'Mike','Rock','M','2015-05-14',4,83),(19,'Gerri','Quinet','M','2014-06-07',5,30),(20,'Laural','Russan','F','2017-05-15',2,3),(21,'Evvie','Cassells','F','2015-10-25',4,86),(22,'Dannie','Wardle','M','2014-03-19',5,6),(23,'Mechelle','Koomar','F','2018-02-01',1,62),(24,'Ruperta','Wickersley','F','2017-09-09',2,67),(25,'Teresa','Manie','F','2017-12-25',2,58),(26,'Elonore','Paunsford','F','2018-07-28',1,22),(27,'Ami','Wardle','F','2015-05-17',4,6),(28,'Shadow','Limeburn','M','2013-10-27',6,79),(29,'Hartley','Delacroix','M','2015-10-12',4,52),(30,'Felix','Powelee','M','2013-12-26',6,66),(31,'Gare','Hazzard','M','2016-07-12',3,90),(32,'Andee','Crickmore','F','2014-12-03',5,87),(33,'Jan','Larkby','M','2015-07-18',4,59),(34,'Katine','Mulligan','F','2015-12-20',4,77),(35,'Garreth','Mockler','M','2018-04-29',1,64),(36,'Kalvin','Quinet','M','2017-12-05',2,30),(37,'Killie','Lynnitt','M','2015-11-05',4,94),(38,'Tawsha','Dowyer','F','2018-10-27',1,92),(39,'Palmer','Touzey','M','2016-07-16',3,80),(40,'Arty','Larkby','M','2016-01-16',3,59),(41,'Laurence','MacLese','M','2018-11-29',1,4),(42,'Mendie','Houlison','M','2015-01-25',4,29),(43,'Herminia','O\'Crevan','F','2014-03-28',5,74),(44,'Noble','Matresse','M','2013-07-16',6,12),(45,'Arny','Youings','M','2013-05-14',6,85),(46,'Cleavland','Rosenberger','M','2015-09-30',4,88),(47,'Torin','Agutter','M','2015-12-31',4,14),(48,'Allin','Hulles','M','2016-06-22',3,23),(49,'Mirilla','Mockler','F','2013-03-05',6,64),(50,'Susy','Severns','F','2014-05-26',5,38),(51,'Marieann','Powelee','F','2017-03-25',2,66),(52,'Zandra','De Leek','F','2015-01-30',4,24),(53,'Bax','Severns','M','2018-02-12',1,38),(54,'Samuel','Rock','M','2014-07-24',5,83),(55,'Berget','Touzey','F','2018-05-21',1,80),(56,'Nevin','Hulles','M','2017-04-01',2,23),(57,'Johannah','Casaro','F','2015-07-07',4,5),(58,'Ax','Fulun','M','2013-05-01',6,97),(59,'Joline','Daine','F','2017-05-05',2,63),(60,'Belvia','Blything','F','2015-02-27',4,45),(61,'Quill','Atley','M','2018-09-01',1,10),(62,'Alexandrina','Crickmore','F','2017-09-29',2,87),(63,'Marjie','Casaro','F','2016-11-18',3,5),(64,'Brunhilde','Wardle','F','2017-10-02',2,6),(65,'Sheffield','Bront','M','2014-04-21',5,2),(66,'Lemmie','Bartosik','M','2013-05-02',6,39),(67,'Gerry','Valasek','F','2015-03-29',4,28),(68,'Aldus','Cattroll','M','2015-09-08',4,25),(69,'Brien','Paunsford','M','2016-06-09',3,22),(70,'Karolina','Houlison','F','2014-03-04',5,29),(71,'Lisette','Larkkem','F','2018-04-16',1,50),(72,'Aigneis','Boniface','F','2016-01-03',3,15),(73,'Reagen','Delacroix','M','2013-02-03',6,52),(74,'Elvin','Attfield','M','2014-02-15',5,40),(75,'Ade','Barling','M','2013-02-03',6,93),(76,'Farrel','Lynnitt','M','2014-01-24',5,94),(77,'Gusta','Valencia','F','2013-06-07',6,46),(78,'Fremont','Barling','M','2015-05-12',4,93),(79,'Hobart','Rock','M','2013-10-11',6,83),(80,'Cody','Quinet','F','2018-07-19',1,30),(81,'Frederick','Gladyer','M','2014-04-08',5,60),(82,'Bron','Mockler','M','2018-04-11',1,64),(83,'Cecilio','Hardway','M','2014-01-26',5,57),(84,'Ambrosius','Barling','M','2014-06-29',5,93),(85,'Chrissie','Rosenberger','F','2014-11-07',5,88),(86,'Starlin','Salkeld','F','2018-05-15',1,54),(87,'Shaylah','Steiner','F','2017-09-24',2,37),(88,'Risa','Jocelyn','F','2018-01-12',1,68),(89,'Cacilie','Brager','F','2015-10-15',4,31),(90,'Dorolisa','Dabinett','F','2014-11-21',5,27),(91,'Cory','Southgate','M','2013-07-13',6,81),(92,'Junia','Jocelyn','F','2013-03-24',6,68),(93,'Shurwood','O\'Crevan','M','2017-09-01',2,74),(94,'Jaquith','Mungin','F','2015-12-21',4,26),(95,'Weidar','Figgins','M','2014-11-12',5,16),(96,'Viki','Paunsford','F','2017-04-14',2,22),(97,'Silva','Scaysbrook','F','2017-07-24',2,43),(98,'Fernanda','Sterndale','F','2014-12-26',5,56),(99,'Christyna','Gouldstraw','F','2016-10-05',3,13),(100,'Joe','Atley','M','2018-04-02',1,10),(101,'Farley','Hulles','M','2014-08-31',5,23),(102,'Bradford','Valencia','M','2018-04-18',1,46),(103,'Celie','Koomar','F','2016-11-14',3,62),(104,'Adriane','Blything','F','2015-08-18',4,45),(105,'Marten','Jent','M','2013-05-31',6,33),(106,'Yuma','Bourley','M','2015-12-12',4,69),(107,'Shaun','Russan','M','2017-06-14',2,3),(108,'Inge','Limeburn','F','2017-06-15',2,79),(109,'Holly','Chaucer','F','2015-01-30',4,75),(110,'Lucho','Legier','M','2016-02-02',3,55),(111,'Fiona','Attfield','F','2014-02-06',5,40),(112,'Miles','Severns','M','2013-12-11',6,38),(113,'Josepha','Jillis','F','2013-02-18',6,89),(114,'Lib','Kelle','F','2017-03-21',2,8),(115,'Gregoire','Barehead','M','2016-04-24',3,32),(116,'Valerie','Gladyer','F','2018-05-13',1,60),(117,'Tito','Hardway','M','2018-03-16',1,57),(118,'Perice','Bumfrey','M','2015-04-14',4,42),(119,'Tuck','Winfrey','M','2017-03-22',2,48),(120,'Staford','Cassells','M','2014-02-17',5,86);
/*!40000 ALTER TABLE `Student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Year`
--

DROP TABLE IF EXISTS `Year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Year` (
  `yearID` int NOT NULL,
  `employeeID` int NOT NULL,
  `teacherFirstName` varchar(50) DEFAULT NULL,
  `teacherEmail` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`yearID`),
  UNIQUE KEY `yearID_UNIQUE` (`yearID`),
  KEY `fk_Year_Employees1_idx` (`employeeID`),
  CONSTRAINT `fk_Year_Employees1` FOREIGN KEY (`employeeID`) REFERENCES `employees` (`employeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Year`
--

LOCK TABLES `Year` WRITE;
/*!40000 ALTER TABLE `Year` DISABLE KEYS */;
INSERT INTO `Year` VALUES (1,12,'Calida','cteodorskib@opera.com'),(2,3,'Derick','drhydderch2@oaic.gov.au'),(3,8,'Mackenzie','mdenisyuk7@ycombinator.com'),(4,2,'Carling','clusk1@seesaa.net'),(5,1,'Ginnie','gkarczinski0@nydailynews.com'),(6,16,'Collie','ckennyf@shareasale.com');
/*!40000 ALTER TABLE `Year` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `yearwithtotalstudents`
--

DROP TABLE IF EXISTS `yearwithtotalstudents`;
/*!50001 DROP VIEW IF EXISTS `yearwithtotalstudents`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `yearwithtotalstudents` AS SELECT 
 1 AS `yearID`,
 1 AS `TotalStudents`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'primaryschool'
--

--
-- Dumping routines for database 'primaryschool'
--

--
-- Final view structure for view `all_parents`
--

/*!50001 DROP VIEW IF EXISTS `all_parents`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `all_parents` AS select `parent`.`parentID` AS `parentID` from `parent` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `parents_with_multiple_children`
--

/*!50001 DROP VIEW IF EXISTS `parents_with_multiple_children`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `parents_with_multiple_children` AS select `student`.`parentID` AS `parentID`,count(0) AS `numStudents` from `student` group by `student`.`parentID` having (count(0) > 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `yearwithtotalstudents`
--

/*!50001 DROP VIEW IF EXISTS `yearwithtotalstudents`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `yearwithtotalstudents` AS select `y`.`yearID` AS `yearID`,count(`s`.`studentID`) AS `TotalStudents` from (`year` `y` left join `student` `s` on((`y`.`yearID` = `s`.`yearID`))) group by `y`.`yearID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-29 10:46:15
