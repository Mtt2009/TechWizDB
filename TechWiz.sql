-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: techwizard
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice` (
  `InvoiceId` int(11) NOT NULL AUTO_INCREMENT,
  `HoursWorked` float DEFAULT NULL,
  `AmountDue` float DEFAULT NULL,
  `user_UserID` int(11) NOT NULL,
  `user_WizardID` int(11) NOT NULL,
  PRIMARY KEY (`InvoiceId`,`user_UserID`,`user_WizardID`),
  KEY `fk_Invoice_user1_idx` (`user_UserID`),
  KEY `fk_Invoice_user2_idx` (`user_WizardID`),
  CONSTRAINT `fk_Invoice_user1` FOREIGN KEY (`user_UserID`) REFERENCES `user` (`UserID`),
  CONSTRAINT `fk_Invoice_user2` FOREIGN KEY (`user_WizardID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skills` (
  `SkillsId` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`SkillsId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills`
--

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
INSERT INTO `skills` VALUES (1,'Cybersecurity'),(2,'Networking'),(3,'Programming');
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(45) DEFAULT NULL,
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `State` varchar(45) DEFAULT NULL,
  `Zip` int(11) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Email` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `isWizard` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `UserName_UNIQUE` (`UserName`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'JohnyTest','Jon','Testerman','132 Debugger Dr','Cincinnati','OH',45200,'513-555-7895','Tester@testing.com','test123',0),(3,'MikeUserson','Mike','Userson','123 Drive','Cincinnati','OH',45200,'555-555-5555','test@testing.com','using',0),(4,'JefferyB','Jeff','BB','','','',0,'','test@testing.com','using',0),(5,'Someone','Guy','bleh','','','',0,'','test@testing.com','using',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wizardskills`
--

DROP TABLE IF EXISTS `wizardskills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wizardskills` (
  `user_UserID` int(11) NOT NULL,
  `Skills_SkillsId` int(11) NOT NULL,
  PRIMARY KEY (`user_UserID`,`Skills_SkillsId`),
  KEY `fk_WizardSkills_Skills1_idx` (`Skills_SkillsId`),
  CONSTRAINT `fk_WizardSkills_Skills1` FOREIGN KEY (`Skills_SkillsId`) REFERENCES `skills` (`SkillsId`),
  CONSTRAINT `fk_WizardSkills_user1` FOREIGN KEY (`user_UserID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wizardskills`
--

LOCK TABLES `wizardskills` WRITE;
/*!40000 ALTER TABLE `wizardskills` DISABLE KEYS */;
/*!40000 ALTER TABLE `wizardskills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workrequests`
--

DROP TABLE IF EXISTS `workrequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workrequests` (
  `RequestID` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(1000) DEFAULT NULL,
  `UserID` int(11) NOT NULL,
  `WizardID` int(11) DEFAULT NULL,
  `OpenDate` datetime DEFAULT NULL,
  `AcceptDate` datetime DEFAULT NULL,
  `CompleteDate` datetime DEFAULT NULL,
  `SupportType` varchar(45) DEFAULT NULL,
  `Status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`RequestID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workrequests`
--

LOCK TABLES `workrequests` WRITE;
/*!40000 ALTER TABLE `workrequests` DISABLE KEYS */;
INSERT INTO `workrequests` VALUES (3,'I need some for real stuff done',1,3,'2020-02-09 14:47:32','2020-02-09 14:47:32','2020-02-09 14:47:32','With the power of awesome',0),(4,'I need some serios Help',1,3,'2020-02-09 14:47:32','2020-02-09 14:47:32','2020-02-09 14:47:32','With the power of awesome',1),(5,'I am beyond help',1,3,'2020-02-09 14:47:32','2020-02-09 14:47:32','2020-02-09 14:47:32','Rum',1),(6,'Your Mom',1,3,'2020-02-09 14:47:32','2020-02-09 14:47:32','2020-02-09 14:47:32','Whiskey',1);
/*!40000 ALTER TABLE `workrequests` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-10  1:27:45
