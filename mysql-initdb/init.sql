-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: letsplay
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ParentCategoryID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_Categories_Name` (`Name`),
  KEY `IX_Categories_ParentCategoryID` (`ParentCategoryID`),
  CONSTRAINT `FK_Categories_Categories_ParentCategoryID` FOREIGN KEY (`ParentCategoryID`) REFERENCES `categories` (`ID`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Sports',NULL),(2,'Video Games',NULL),(3,'Music',NULL),(4,'Football',1),(5,'Volleyball',1),(6,'Basketball',1),(7,'Tenis',1),(8,'League of Legends',2),(9,'Dota 2',2),(10,'Fortnite',2),(11,'PUBG',2),(12,'World of Warcraft',2),(13,'Hip-Hop',3),(14,'Pop-Folk',3),(15,'Rock',3),(16,'House',3),(17,'R&B',3),(18,'Games',NULL),(19,'Poker',18);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (5,'Sofia'),(6,'Plovdiv'),(7,'Varna'),(8,'Burgas'),(9,'Ruse'),(10,'Stara Zagora'),(11,'Pleven'),(12,'Sliven'),(13,'Dobrich'),(14,'Shumen'),(15,'Pernik'),(16,'Haskovo'),(17,'Vratsa'),(18,'Kyustendil'),(19,'Montana'),(20,'Lovech'),(21,'Razgrad'),(22,'Borino'),(23,'Madan'),(24,'Zlatograd'),(25,'Pazardzhik'),(26,'Smolyan'),(27,'Blagoevgrad'),(28,'Nedelino'),(29,'Rudozem'),(30,'Devin'),(31,'Veliko Tarnovo'),(32,'Vidin'),(33,'Kirkovo'),(34,'Krumovgrad'),(35,'Dzhebel'),(36,'Silistra'),(37,'Sarnitsa'),(38,'Shiroka Laka'),(39,'Yambol'),(40,'Dospat'),(41,'Kardzhali'),(42,'Gabrovo'),(43,'Targovishte');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `EventID` int DEFAULT NULL,
  `UserId` int DEFAULT NULL,
  `PostedOn` datetime(6) NOT NULL,
  `UpdatedOn` datetime(6) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_Comments_EventID` (`EventID`),
  KEY `IX_Comments_UserId` (`UserId`),
  CONSTRAINT `FK_Comments_Events_EventID` FOREIGN KEY (`EventID`) REFERENCES `events` (`ID`) ON DELETE RESTRICT,
  CONSTRAINT `FK_Comments_Users_UserId` FOREIGN KEY (`UserId`) REFERENCES `users` (`Id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'Texas or Omaha?',1,2,'2020-03-06 11:27:15.000000','2020-03-06 11:27:15.000000'),(2,'Panikata hvana me',2,3,'2020-03-06 11:27:15.000000','2020-03-06 11:27:15.000000'),(3,'Pozvoleno li e da si vzimam kalevri?',3,1,'2020-03-06 11:27:15.000000','2020-03-06 11:27:15.000000'),(4,'Savata shte bude li tam?',4,5,'2020-03-06 11:27:15.000000','2020-03-06 11:27:15.000000'),(5,'Plat 3 supp sum. Nickname:JclownX',5,4,'2020-03-06 11:27:15.000000','2020-03-06 11:27:15.000000');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `EventStartDate` datetime(6) NOT NULL,
  `CreatedOn` datetime(6) NOT NULL,
  `UpdatedOn` datetime(6) NOT NULL,
  `EventStatus` int NOT NULL,
  `Recurring` int DEFAULT NULL,
  `Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `PeopleNeeded` int NOT NULL,
  `Title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `UserCreatedByID` int NOT NULL,
  `CategoryID` int NOT NULL,
  `CityID` int NOT NULL,
  `Address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_Events_CategoryID` (`CategoryID`),
  KEY `IX_Events_CityID` (`CityID`),
  KEY `IX_Events_UserCreatedByID` (`UserCreatedByID`),
  KEY `IX_Events_EventStartDate` (`EventStartDate`,`Recurring`),
  CONSTRAINT `FK_Events_Categories_CategoryID` FOREIGN KEY (`CategoryID`) REFERENCES `categories` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `FK_Events_Cities_CityID` FOREIGN KEY (`CityID`) REFERENCES `cities` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `FK_Events_Users_UserCreatedByID` FOREIGN KEY (`UserCreatedByID`) REFERENCES `users` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,'2020-07-06 11:17:21.000000','2020-03-06 11:27:15.000000','2020-03-06 11:27:15.000000',1,2,'of nqma',3,'Poker:Kichuka',1,19,2,'ul.\"Vasil Chekelarov\",2'),(2,'2020-07-06 11:17:21.000000','2020-03-06 11:27:15.000000','2020-03-06 11:27:15.000000',1,3,'Chalga-party-international',6,'Galena',2,14,2,'Club Bushido'),(3,'2020-07-06 11:17:21.000000','2020-03-06 11:27:15.000000','2020-03-06 11:27:15.000000',1,2,'Need 2 people today at Optium Plovdiv to play football.',1,'Football-Optium',3,4,2,'Optium Plovdiv'),(4,'2020-07-06 11:17:21.000000','2020-03-06 11:27:15.000000','2020-03-06 11:27:15.000000',1,3,'Dress code black.',14,'Dope-Zoo',4,13,2,'Club Void'),(5,'2020-07-06 11:17:21.000000','2020-03-06 11:27:15.000000','2020-03-06 11:27:15.000000',1,1,'Need 3 people for clash tournament.',2,'Clash:LOL',5,8,2,'');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'User'),(2,'Admin');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userevents`
--

DROP TABLE IF EXISTS `userevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userevents` (
  `UserID` int NOT NULL,
  `EventID` int NOT NULL,
  PRIMARY KEY (`UserID`,`EventID`),
  KEY `IX_UserEvents_EventID` (`EventID`),
  CONSTRAINT `FK_UserEvents_Events_EventID` FOREIGN KEY (`EventID`) REFERENCES `events` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `FK_UserEvents_Users_UserID` FOREIGN KEY (`UserID`) REFERENCES `users` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userevents`
--

LOCK TABLES `userevents` WRITE;
/*!40000 ALTER TABLE `userevents` DISABLE KEYS */;
INSERT INTO `userevents` VALUES (2,1),(3,2),(1,3),(5,4),(4,5);
/*!40000 ALTER TABLE `userevents` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `updatePeopleNeeded` AFTER INSERT ON `userevents` FOR EACH ROW begin

       DECLARE id_exists Boolean;

       -- Check BookingRequest table

       SELECT 1

       INTO @id_exists

       FROM events

       WHERE events.ID = NEW.EventID;


       IF @id_exists = 1

       THEN

           UPDATE events

           SET peopleneeded = peopleneeded - 1

           WHERE ID = NEW.EventID;

        END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `userroles`
--

DROP TABLE IF EXISTS `userroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userroles` (
  `UserId` int NOT NULL,
  `RoleId` int NOT NULL,
  PRIMARY KEY (`UserId`,`RoleId`),
  KEY `IX_UserRoles_RoleId` (`RoleId`),
  CONSTRAINT `FK_UserRoles_Roles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `roles` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_UserRoles_Users_UserId` FOREIGN KEY (`UserId`) REFERENCES `users` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userroles`
--

LOCK TABLES `userroles` WRITE;
/*!40000 ALTER TABLE `userroles` DISABLE KEYS */;
INSERT INTO `userroles` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1);
/*!40000 ALTER TABLE `userroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Username` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Password` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Email` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Yovcho','password','ivelinjilov16@gmail.com','2020-03-06 11:14:52.000000','2020-03-06 11:14:52.000000'),(2,'Leppop','password','leppop@abv.bg','2020-03-06 11:17:21.000000','2020-03-06 11:17:21.000000'),(3,'Angel','password','angel.k@yahoo.com','2020-03-06 11:17:21.000000','2020-03-06 11:17:21.000000'),(4,'lilVayne','vaynegod32','vayne.god@mail.bg','2020-03-06 11:17:21.000000','2020-03-06 11:17:21.000000'),(5,'PeteApple','kudeebirata55','pesho.ywna@gmail.com','2020-03-06 11:17:21.000000','2020-03-06 11:17:21.000000'),(6,'Allah','allah','allah@gmail.com','2020-03-06 11:17:21.000000','2020-03-06 11:17:21.000000');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `UPDATEPEOPLEROLE` AFTER INSERT ON `users` FOR EACH ROW BEGIN

	INSERT INTO USERROLES

    VALUES(NEW.ID,1);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-06 13:51:09