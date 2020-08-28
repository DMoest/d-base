-- MariaDB dump 10.17  Distrib 10.4.11-MariaDB, for osx10.14 (x86_64)
--
-- Host: localhost    Database: exam
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `artist`
--

DROP TABLE IF EXISTS `artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artist` (
  `id` char(3) NOT NULL,
  `namn` varchar(25) NOT NULL,
  `ort` varchar(25) NOT NULL,
  `landskod` char(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `landskod` (`landskod`),
  CONSTRAINT `artist_ibfk_1` FOREIGN KEY (`landskod`) REFERENCES `land` (`kod`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist`
--

LOCK TABLES `artist` WRITE;
/*!40000 ALTER TABLE `artist` DISABLE KEYS */;
INSERT INTO `artist` VALUES ('bc','Browsing Collection','Skövde','SE'),('dbh','Death By Horse','Skåne','SE'),('el','Elden','Karlstad','SE'),('hb','Honeburst','Halmstad','SE'),('mw','Mass Worship','Stockholm','SE');
/*!40000 ALTER TABLE `artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `landskod`
--

DROP TABLE IF EXISTS `landskod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `landskod` (
  `kod` char(3) NOT NULL,
  `namn` varchar(10) NOT NULL,
  PRIMARY KEY (`kod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `landskod`
--

LOCK TABLES `landskod` WRITE;
/*!40000 ALTER TABLE `landskod` DISABLE KEYS */;
INSERT INTO `landskod` VALUES ('DEN','Danmark'),('SE','Sverige'),('US','USA');
/*!40000 ALTER TABLE `landskod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `speldag`
--

DROP TABLE IF EXISTS `speldag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `speldag` (
  `id` int NOT NULL,
  `namn` varchar(20) NOT NULL,
  `datum` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `speldag`
--

LOCK TABLES `speldag` WRITE;
/*!40000 ALTER TABLE `speldag` DISABLE KEYS */;
INSERT INTO `speldag` VALUES (1,'Onsdag Prepare','2020-06-03'),(2,'Torsdag Hardtime','2020-06-04'),(3,'Fredag Laidback','2020-06-05'),(4,'Lördag All-In','2020-06-06');
/*!40000 ALTER TABLE `speldag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spelning`
--

DROP TABLE IF EXISTS `spelning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spelning` (
  `artist` char(3) NOT NULL,
  `dag` int NOT NULL,
  `tid` time NOT NULL,
  PRIMARY KEY (`artist`,`dag`),
  KEY `dag` (`dag`),
  CONSTRAINT `spelning_ibfk_1` FOREIGN KEY (`artist`) REFERENCES `artist` (`id`),
  CONSTRAINT `spelning_ibfk_2` FOREIGN KEY (`dag`) REFERENCES `speldag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spelning`
--

LOCK TABLES `spelning` WRITE;
/*!40000 ALTER TABLE `spelning` DISABLE KEYS */;
INSERT INTO `spelning` VALUES ('bc',2,'19:00:00'),('bc',3,'19:00:00'),('dbh',1,'15:00:00'),('dbh',2,'15:00:00'),('dbh',3,'15:00:00'),('el',3,'21:00:00'),('mw',1,'21:00:00'),('mw',2,'21:00:00');
/*!40000 ALTER TABLE `spelning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `v_show_all_info`
--

DROP TABLE IF EXISTS `v_show_all_info`;
/*!50001 DROP VIEW IF EXISTS `v_show_all_info`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_show_all_info` (
  `id` tinyint NOT NULL,
  `artist` tinyint NOT NULL,
  `ort` tinyint NOT NULL,
  `land` tinyint NOT NULL,
  `uppträder` tinyint NOT NULL,
  `dag` tinyint NOT NULL,
  `tid` tinyint NOT NULL,
  `datum` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'exam'
--
/*!50003 DROP PROCEDURE IF EXISTS `show_all_artist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `show_all_artist`()
begin
select
    *
from v_show_all_info;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_all_artist_info` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `show_all_artist_info`()
begin
select
    *
from v_show_all_artist_info;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_artists` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `show_artists`()
begin
select
    *
from v_show_artists;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `v_show_all_info`
--

/*!50001 DROP TABLE IF EXISTS `v_show_all_info`*/;
/*!50001 DROP VIEW IF EXISTS `v_show_all_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`user`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_show_all_info` AS select `a`.`id` AS `id`,`a`.`namn` AS `artist`,`a`.`ort` AS `ort`,concat(`lk`.`namn`,' (',`lk`.`kod`,')') AS `land`,`s`.`artist` AS `uppträder`,`sd`.`namn` AS `dag`,time_format(`s`.`tid`,'%H:%m') AS `tid`,date_format(`sd`.`datum`,'%Y-%m-%d') AS `datum` from (((`artist` `a` join `landskod` `lk` on((`a`.`landskod` = `lk`.`kod`))) left join `spelning` `s` on((`a`.`id` = `s`.`artist`))) left join `speldag` `sd` on((`s`.`dag` = `sd`.`id`))) order by date_format(`sd`.`datum`,'%Y-%m-%d'),time_format(`s`.`tid`,'%H:%m') */;
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

-- Dump completed on 2020-08-27 23:27:52
