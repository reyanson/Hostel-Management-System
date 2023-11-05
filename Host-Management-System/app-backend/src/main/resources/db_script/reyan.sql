-- MariaDB dump 10.19  Distrib 10.11.4-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: user_manage
-- ------------------------------------------------------
-- Server version	10.11.4-MariaDB-1

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
-- Table structure for table `bathroom`
--

DROP TABLE IF EXISTS `bathroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bathroom` (
                            `bathroom_id` varchar(10) NOT NULL,
                            `floor` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bathroom`
--

LOCK TABLES `bathroom` WRITE;
/*!40000 ALTER TABLE `bathroom` DISABLE KEYS */;
INSERT INTO `bathroom` VALUES
                           ('l1_l_b1','L1'),
                           ('l1_l_b2','L1'),
                           ('l1_l_b3','L1'),
                           ('l1_l_b4','L1'),
                           ('l1_l_b5','L1'),
                           ('l1_l_b6','L1'),
                           ('l1_r_b1','L1'),
                           ('l1_r_b2','L1'),
                           ('l1_r_b3','L1'),
                           ('l1_r_b4','L1'),
                           ('l1_r_b5','L1'),
                           ('l1_r_b6','L1'),
                           ('l2_l_b1','L2'),
                           ('l2_l_b2','L2'),
                           ('l2_l_b3','L2'),
                           ('l2_l_b4','L2'),
                           ('l2_l_b5','L2'),
                           ('l2_l_b6','L2'),
                           ('l2_r_b1','L2'),
                           ('l2_r_b2','L2'),
                           ('l2_r_b3','L2'),
                           ('l2_r_b4','L2'),
                           ('l2_r_b5','L2'),
                           ('l2_r_b6','L2');
/*!40000 ALTER TABLE `bathroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complain`
--

DROP TABLE IF EXISTS `complain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complain` (
                            `c_id` int(11) NOT NULL AUTO_INCREMENT,
                            `reg_no` varchar(20) DEFAULT NULL,
                            `type` varchar(20) DEFAULT NULL,
                            `asset_code` varchar(50) DEFAULT NULL,
                            `subject` varchar(50) DEFAULT NULL,
                            `description` varchar(50) DEFAULT NULL,
                            `created_at` timestamp NULL DEFAULT current_timestamp(),
                            `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
                            `action` int(1) DEFAULT 0,
                            `remark` varchar(50) DEFAULT NULL,
                            PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complain`
--

LOCK TABLES `complain` WRITE;
/*!40000 ALTER TABLE `complain` DISABLE KEYS */;
INSERT INTO `complain` VALUES
                           (1,'TG491',NULL,'ass_b1/101','sub','hello','2023-10-01 09:39:10','2023-11-05 04:04:18',0,NULL),
                           (4,'TG490',NULL,'ass_bed1/101','sub','hello','2023-11-01 13:38:25','2023-11-05 03:00:59',0,NULL),
                           (5,'TG494',NULL,'ass_m1/101','door broken','left side broken','2023-12-01 09:39:10','2023-11-05 04:04:10',0,NULL),
                           (6,'TG494','Room','ass_b1/101','Door demage','Right side corner','2023-11-05 04:33:41','2023-11-05 04:33:41',0,NULL);
/*!40000 ALTER TABLE `complain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `damage`
--

DROP TABLE IF EXISTS `damage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `damage` (
                          `damage_id` varchar(255) NOT NULL,
                          `asset_id` varchar(255) DEFAULT NULL,
                          `description` varchar(255) DEFAULT NULL,
                          `room_no` int(11) DEFAULT NULL,
                          PRIMARY KEY (`damage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `damage`
--

LOCK TABLES `damage` WRITE;
/*!40000 ALTER TABLE `damage` DISABLE KEYS */;
/*!40000 ALTER TABLE `damage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dean`
--

DROP TABLE IF EXISTS `dean`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dean` (
                        `dean_id` int(11) NOT NULL AUTO_INCREMENT,
                        `first_Name` varchar(50) NOT NULL,
                        `last_Name` varchar(50) NOT NULL,
                        `email` varchar(50) DEFAULT NULL,
                        `nic` varchar(12) DEFAULT NULL,
                        `address` varchar(100) NOT NULL,
                        `personal_no` int(10) DEFAULT NULL,
                        `office_no` int(10) DEFAULT NULL,
                        PRIMARY KEY (`dean_id`),
                        UNIQUE KEY `Email` (`email`),
                        UNIQUE KEY `nic` (`nic`),
                        UNIQUE KEY `personal_no` (`personal_no`),
                        UNIQUE KEY `office_no` (`office_no`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dean`
--

LOCK TABLES `dean` WRITE;
/*!40000 ALTER TABLE `dean` DISABLE KEYS */;
INSERT INTO `dean` VALUES
                       (2,'Chandimal','Gunaweera','chandimal@ictec.com','195756789V','24 Main Street, Galle',764567892,234567890),
                       (4,'Reyanson','Sosai','reyanson4222@gmail.com','990910804V','Mannar',763787940,763787940);
/*!40000 ALTER TABLE `dean` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER after_dean_insert
    AFTER INSERT ON dean FOR EACH ROW
BEGIN
    IF NEW.dean_id IS NOT NULL THEN
    INSERT INTO user(username, password)
    VALUES (CONCAT(NEW.first_Name,"dean",NEW.dean_id),MD5(NEW.nic));

END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `level`
--

DROP TABLE IF EXISTS `level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `level` (
                         `year` int(4) DEFAULT NULL,
                         `level` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `level`
--

LOCK TABLES `level` WRITE;
/*!40000 ALTER TABLE `level` DISABLE KEYS */;
INSERT INTO `level` VALUES
                        (2019,3),
                        (2022,1);
/*!40000 ALTER TABLE `level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice` (
                          `notice_id` int(11) NOT NULL AUTO_INCREMENT,
                          `date` timestamp NULL DEFAULT current_timestamp(),
                          `content` mediumtext NOT NULL,
                          `subject` varchar(255) NOT NULL,
                          PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES
    (1,'2023-11-01 10:17:25','content','Hello');
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repair`
--

DROP TABLE IF EXISTS `repair`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repair` (
                          `repair_id` int(11) NOT NULL AUTO_INCREMENT,
                          `asset_id` varchar(11) NOT NULL,
                          `room_no` int(3) NOT NULL,
                          `created_at` timestamp NULL DEFAULT current_timestamp(),
                          `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
                          PRIMARY KEY (`repair_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repair`
--

LOCK TABLES `repair` WRITE;
/*!40000 ALTER TABLE `repair` DISABLE KEYS */;
INSERT INTO `repair` VALUES
                         (1,'ass_c1',101,'2023-11-03 05:38:04','2023-11-03 05:38:04'),
                         (2,'ass_b1',101,'2023-11-03 05:38:04','2023-11-03 05:38:04'),
                         (3,'ass_m1',301,'2023-11-03 05:38:04','2023-11-03 05:38:04'),
                         (4,'ass_c2',301,'2023-11-03 05:38:04','2023-11-03 05:38:04');
/*!40000 ALTER TABLE `repair` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room` (
                        `room_id` int(11) NOT NULL AUTO_INCREMENT,
                        `room_no` int(3) NOT NULL,
                        `floor` varchar(10) NOT NULL,
                        `reg_no` varchar(15) DEFAULT NULL,
                        `created_at` timestamp NULL DEFAULT current_timestamp(),
                        `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
                        `status` int(1) DEFAULT 0,
                        PRIMARY KEY (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES
                       (17,101,'L1','TG/2019/491','2023-11-02 10:56:16','2023-11-05 03:35:59',1),
                       (18,101,'L1','TG/2019/494','2023-11-02 10:56:16','2023-11-05 03:37:32',0),
                       (19,201,'L2','TG/2021/760','2023-11-02 10:56:16','2023-11-02 10:56:16',0),
                       (20,225,'L2','TG/2021/780','2023-11-02 10:56:16','2023-11-02 10:56:16',0),
                       (21,301,'L3','TG/2019/490','2023-11-02 10:56:16','2023-11-05 03:35:26',0),
                       (22,328,'L3','TG/2021/423','2023-11-02 10:56:16','2023-11-02 12:26:10',0),
                       (23,401,'L4','TG/2019/508','2023-11-02 10:56:16','2023-11-02 10:56:16',0),
                       (24,428,'L4','TG/2019/492','2023-11-02 10:56:16','2023-11-02 16:21:09',0);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_asset`
--

DROP TABLE IF EXISTS `room_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room_asset` (
                              `asset_id` varchar(11) NOT NULL,
                              `name` varchar(10) NOT NULL,
                              `room_no` int(3) NOT NULL,
                              PRIMARY KEY (`asset_id`,`room_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_asset`
--

LOCK TABLES `room_asset` WRITE;
/*!40000 ALTER TABLE `room_asset` DISABLE KEYS */;
INSERT INTO `room_asset` VALUES
                             ('ass_b1','Bulb1',101),
                             ('ass_b1','Bulb1',301),
                             ('ass_b2','Bulb2',101),
                             ('ass_b2','Bulb2',301),
                             ('ass_b3','Bulb3',101),
                             ('ass_b3','Bulb3',301),
                             ('ass_b4','Bulb4',101),
                             ('ass_b4','Bulb4',301),
                             ('ass_bed1','Bed1',101),
                             ('ass_bed1','Bed1',301),
                             ('ass_bed2','Bed2',101),
                             ('ass_bed2','Bed1',301),
                             ('ass_c1','Cupboard1',101),
                             ('ass_c1','Cupboard1',301),
                             ('ass_c2','Cupboard2',101),
                             ('ass_c2','Cupboard2',301),
                             ('ass_chair1','Chair1',101),
                             ('ass_chair1','Chair1',301),
                             ('ass_chair2','Chair2',101),
                             ('ass_chair2','Chair2',301),
                             ('ass_chair3','Chair3',101),
                             ('ass_chair3','Chair3',301),
                             ('ass_chair4','Chair4',101),
                             ('ass_chair4','Chair4',301),
                             ('ass_m1','Mattress1',101),
                             ('ass_m1','Mattress1',301),
                             ('ass_m2','Mattress2',101),
                             ('ass_m2','Mattress2',301),
                             ('ass_m3','Mattress3',101),
                             ('ass_m3','Mattress3',301),
                             ('ass_m4','Mattress4',101),
                             ('ass_m4','Mattress4',301),
                             ('ass_r1','Rack1',101),
                             ('ass_r1','Rack1',301),
                             ('ass_r2','Rack2',101),
                             ('ass_r2','Rack2',301),
                             ('ass_t1','Table1',101),
                             ('ass_t1','Table1',301),
                             ('ass_t2','Table2',101),
                             ('ass_t2','Table2',301),
                             ('ass_t3','Table3',101),
                             ('ass_t3','Table3',301),
                             ('ass_t4','Table4',101),
                             ('ass_t4','Table4',301);
/*!40000 ALTER TABLE `room_asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `security`
--

DROP TABLE IF EXISTS `security`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `security` (
                            `security_id` int(11) NOT NULL AUTO_INCREMENT,
                            `first_Name` varchar(50) NOT NULL,
                            `last_Name` varchar(50) NOT NULL,
                            `Email` varchar(50) DEFAULT NULL,
                            `nic` varchar(12) DEFAULT NULL,
                            `address` varchar(100) NOT NULL,
                            `personal_no` int(10) NOT NULL,
                            `office_no` int(10) DEFAULT NULL,
                            PRIMARY KEY (`security_id`),
                            UNIQUE KEY `Email` (`Email`),
                            UNIQUE KEY `nic` (`nic`),
                            UNIQUE KEY `unique_email` (`Email`),
                            UNIQUE KEY `unique_nic` (`nic`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `security`
--

LOCK TABLES `security` WRITE;
/*!40000 ALTER TABLE `security` DISABLE KEYS */;
INSERT INTO `security` VALUES
    (1,'Vimal','Gunaseela','vimal@example.com','886504257V','Patri Road Kamburupitiya, Matara',777421005,234567410);
/*!40000 ALTER TABLE `security` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER after_security_insert
AFTER INSERT ON security FOR EACH ROW
BEGIN
IF NEW.security_id IS NOT NULL THEN
    INSERT INTO user(username, password)
    VALUES (CONCAT(NEW.first_Name,"sec",NEW.security_id),MD5(NEW.nic));

END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
                           `reg_no` varchar(255) NOT NULL,
                           `address` varchar(255) DEFAULT NULL,
                           `email` varchar(255) DEFAULT NULL,
                           `first_name` varchar(255) DEFAULT NULL,
                           `last_name` varchar(255) DEFAULT NULL,
                           `nic` varchar(255) DEFAULT NULL,
                           `phone_no` int(11) DEFAULT NULL,
                           PRIMARY KEY (`reg_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES
                          ('TG/2019/490','39A Boundary Road, Kalmunai','sunil@example.com','Kumar','Murukeshan','997024986V',760725590),
                          ('TG/2019/491','39A Boundary Road, Kalmunai','sunil@example.com','Kamal','Hassan','997024986V',760725590),
                          ('TG/2019/492','39A Boundary Road, Kalmunai','sunil@example.com','Sunil','Vadivel','997024986V',760725590),
                          ('TG/2019/494','ward no:01,Vankalai,Mannar','reya@gmail.com','Reyanson','Sosai','990910804V',763787940);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER after_student_insert
    AFTER INSERT ON student FOR EACH ROW
BEGIN
    DECLARE tgNo VARCHAR(10);


    SET tgNo = CONCAT('TG',SUBSTRING(NEW.reg_no, 9));


    INSERT INTO user (username, password)
    VALUES (tgNo, MD5(NEW.nic));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `subwarden`
--

DROP TABLE IF EXISTS `subwarden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subwarden` (
                             `swarden_id` int(11) NOT NULL AUTO_INCREMENT,
                             `first_Name` varchar(50) NOT NULL,
                             `last_Name` varchar(50) NOT NULL,
                             `Email` varchar(50) DEFAULT NULL,
                             `nic` varchar(12) DEFAULT NULL,
                             `address` varchar(100) NOT NULL,
                             `personal_no` int(10) NOT NULL,
                             `office_no` int(10) NOT NULL,
                             PRIMARY KEY (`swarden_id`),
                             UNIQUE KEY `Email` (`Email`),
                             UNIQUE KEY `nic` (`nic`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subwarden`
--

LOCK TABLES `subwarden` WRITE;
/*!40000 ALTER TABLE `subwarden` DISABLE KEYS */;
/*!40000 ALTER TABLE `subwarden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblmsg`
--

DROP TABLE IF EXISTS `tblmsg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblmsg` (
                          `msgid` int(11) NOT NULL AUTO_INCREMENT,
                          `msginfo` varchar(200) DEFAULT NULL,
                          PRIMARY KEY (`msgid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblmsg`
--

LOCK TABLES `tblmsg` WRITE;
/*!40000 ALTER TABLE `tblmsg` DISABLE KEYS */;
INSERT INTO `tblmsg` VALUES
                         (1,'Hi.. 2023-11-05 11:56:52'),
                         (2,'Hi.. 2023-11-05 11:57:02'),
                         (3,'Hi.. 2023-11-05 11:57:12'),
                         (4,'Hi.. 2023-11-05 11:57:22'),
                         (5,'Hi.. 2023-11-05 11:57:32'),
                         (6,'Hi.. 2023-11-05 11:57:42'),
                         (7,'Hi.. 2023-11-05 11:57:52');
/*!40000 ALTER TABLE `tblmsg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `toilet`
--

DROP TABLE IF EXISTS `toilet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `toilet` (
                          `toilet_id` varchar(11) NOT NULL,
                          `floor` varchar(10) NOT NULL,
                          PRIMARY KEY (`toilet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `toilet`
--

LOCK TABLES `toilet` WRITE;
/*!40000 ALTER TABLE `toilet` DISABLE KEYS */;
INSERT INTO `toilet` VALUES
                         ('l1_l_t1','L1'),
                         ('l1_l_t2','L1'),
                         ('l1_l_t3','L1'),
                         ('l1_l_t4','L1'),
                         ('l1_l_t5','L1'),
                         ('l1_r_t1','L1'),
                         ('l1_r_t2','L1'),
                         ('l1_r_t3','L1'),
                         ('l1_r_t4','L1'),
                         ('l1_r_t5','L1'),
                         ('l2_l_t1','L3'),
                         ('l2_l_t2','L3'),
                         ('l2_l_t3','L3'),
                         ('l2_l_t4','L3'),
                         ('l2_l_t5','L3'),
                         ('l2_r_t1','L3'),
                         ('l2_r_t2','L3'),
                         ('l2_r_t3','L3'),
                         ('l2_r_t4','L3'),
                         ('l2_r_t5','L3');
/*!40000 ALTER TABLE `toilet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
                        `username` varchar(60) NOT NULL,
                        `password` varchar(255) NOT NULL,
                        PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES
                       ('Reyansondean4','38d74063619af9117f6ace325d91cc95'),
                       ('TG490','fafd0c144be224edc789c3549de78ef4'),
                       ('TG491','fafd0c144be224edc789c3549de78ef4'),
                       ('TG492','fafd0c144be224edc789c3549de78ef4'),
                       ('TG508','38d74063619af9117f6ace325d91cc95'),
                       ('Vimalsec1','dc9d6a0a4962ed1bee7c714304ba5bf3');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_seq`
--

DROP TABLE IF EXISTS `user_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_seq` (
    `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_seq`
--

LOCK TABLES `user_seq` WRITE;
/*!40000 ALTER TABLE `user_seq` DISABLE KEYS */;
INSERT INTO `user_seq` VALUES
    (1);
/*!40000 ALTER TABLE `user_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
                         `user_id` int(11) NOT NULL,
                         `created_at` datetime(6) DEFAULT NULL,
                         `email` varchar(255) DEFAULT NULL,
                         `first_name` varchar(255) DEFAULT NULL,
                         `last_name` varchar(255) DEFAULT NULL,
                         `password` varchar(255) DEFAULT NULL,
                         PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warden`
--

DROP TABLE IF EXISTS `warden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `warden` (
                          `warden_id` int(11) NOT NULL AUTO_INCREMENT,
                          `first_Name` varchar(50) NOT NULL,
                          `last_Name` varchar(50) NOT NULL,
                          `Email` varchar(50) DEFAULT NULL,
                          `nic` varchar(12) DEFAULT NULL,
                          `address` varchar(100) NOT NULL,
                          `personal_no` int(10) NOT NULL,
                          `office_no` int(10) NOT NULL,
                          PRIMARY KEY (`warden_id`),
                          UNIQUE KEY `Email` (`Email`),
                          UNIQUE KEY `nic` (`nic`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warden`
--

LOCK TABLES `warden` WRITE;
/*!40000 ALTER TABLE `warden` DISABLE KEYS */;
/*!40000 ALTER TABLE `warden` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-05 13:09:40

DELIMITER //
CREATE FUNCTION complainAccept(cId int,occation varchar(20))
RETURNS VARCHAR(20)
BEGIN
DECLARE result VARCHAR(20);
IF EXISTS (SELECT * FROM complain where c_id=cId) THEN
  UPDATE complain SET action=1 ,remark=occation WHERE c_id=cId;
  SET result = 'Accepted Success';
ELSE
    SET result = 'Accepted not success';
END IF;
RETURN result;

END//
DELIMITER ;

