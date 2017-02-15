CREATE DATABASE  IF NOT EXISTS `cmdbnode` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `cmdbnode`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: centd643512W5Q    Database: cmdbnode
-- ------------------------------------------------------
-- Server version	5.6.27-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cm_component`
--

DROP TABLE IF EXISTS `cm_component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cm_component` (
  `ComponentID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ComponentName` varchar(50) NOT NULL,
  `PackageID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ComponentID`),
  KEY `IXFK_Component_CM_Package` (`PackageID`),
  CONSTRAINT `cm_component_ibfk_1` FOREIGN KEY (`PackageID`) REFERENCES `cm_package` (`PackageID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cm_component`
--

LOCK TABLES `cm_component` WRITE;
/*!40000 ALTER TABLE `cm_component` DISABLE KEYS */;
INSERT INTO `cm_component` VALUES (1,'Comp 1 - Bridge - 7.3.4 Package',2),(2,'Comp 2 - Bridge - 7.3.4 Package',2),(3,'Comp 1 - EAS - 7.3.4 Package',3),(4,'Comp 2 - EAS - 7.3.4 Package',3),(5,'Comp 1 - UIS - 7.3.4 Package',4),(6,'Comp 2 - UIS - 7.3.4 Package',4),(7,'Comp 1 - Bridge - 7.4.0 Package',5),(8,'Comp 2 - Bridge - 7.4.0 Package',5),(9,'Comp 1 - EAS - 7.4.0 Package',6),(10,'Comp 2 - EAS - 7.4.0 Package',6),(11,'Comp 1 - UIS - 7.4.0 Package',7),(12,'Comp 2 - UIS - 7.4.0 Package',7),(13,'Windows 2012',8),(14,'IIS',9),(15,'Oracle (Win)',10),(16,'RESIP DB',11);
/*!40000 ALTER TABLE `cm_component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cm_componentconfig`
--

DROP TABLE IF EXISTS `cm_componentconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cm_componentconfig` (
  `CompConfigID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ComponentID` bigint(20) NOT NULL,
  `CompConfigParameter` varchar(255) DEFAULT NULL,
  `CompConfigValue` varchar(255) DEFAULT NULL,
  `CompConfigHieraAddress` varchar(255) DEFAULT NULL,
  `CompConfigNotes` varchar(255) DEFAULT NULL,
  `CompConfigIsSensitive` bit(1) DEFAULT b'0',
  PRIMARY KEY (`CompConfigID`),
  KEY `IXFK_ComponentConfig_Component` (`ComponentID`),
  CONSTRAINT `cm_componentconfig_ibfk_1` FOREIGN KEY (`ComponentID`) REFERENCES `cm_component` (`ComponentID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cm_componentconfig`
--

LOCK TABLES `cm_componentconfig` WRITE;
/*!40000 ALTER TABLE `cm_componentconfig` DISABLE KEYS */;
INSERT INTO `cm_componentconfig` VALUES (1,1,'Param 1 - Comp 1 - Bridge - 7.3.4 Package','C1Param1Value','ROOT:{Release}:{ServType}:{AppName}:SettingA:',NULL,'\0'),(2,1,'Param 2 - Comp 1 - Bridge - 7.3.4 Package','C1Param2Value','ROOT:{Release}:{ServType}:{AppName}:SettingB:',NULL,'\0'),(3,2,'Param 1 - Comp 2 - Bridge - 7.3.4 Package','C2Param1Value','ROOT:{Release}:{ServType}:SettingC:',NULL,'\0'),(4,2,'Param 2 - Comp 2 - Bridge - 7.3.4 Package','C2Param2Value','ROOT:{Release}:{ServType}:SettingD:',NULL,'\0'),(5,3,'Param 1 - Comp 1 - EAS - 7.3.4 Package','C3Param1Value','ROOT:{Release}:{ServType}:SettingA:',NULL,'\0'),(6,3,'Param 2 - Comp 1 - EAS - 7.3.4 Package','C3Param2Value','ROOT:{Release}:{ServType}:SettingB:',NULL,'\0'),(7,4,'Param 1 - Comp 2 - EAS - 7.3.4 Package','C4Param1Value','ROOT:{Release}:{ServType}:SettingC:',NULL,'\0'),(8,4,'Param 2 - Comp 2 - EAS - 7.3.4 Package','C4Param2Value','ROOT:{Release}:{ServType}:SettingD:',NULL,'\0'),(9,5,'Param 1 - Comp 1 - UIS - 7.3.4 Package','C5Param1Value','ROOT:{Release}:{ServType}:{AppName}:SettingA:',NULL,'\0'),(10,5,'Param 2 - Comp 1 - UIS - 7.3.4 Package','C5Param2Value','ROOT:{Release}:{ServType}:SettingB:',NULL,'\0'),(11,6,'Param 1  -  Comp 2 - UIS - 7.3.4 Package','C6Param1Value','ROOT:{Release}:{ServType}:{AppName}:SettingC:',NULL,'\0'),(12,6,'Param 2 - Comp 2 - UIS - 7.3.4 Package','C6Param2Value','ROOT:{Release}:{ServType}:SettingD:',NULL,'\0'),(13,7,'Param 1 - Comp 1 - Bridge - 7.4.0 Package','C7Param1Value','ROOT:{Release}:{ServType}:SettingA:',NULL,'\0'),(14,7,'Param 2 - Comp 1 - Bridge - 7.4.0 Package','C7Param2Value','ROOT:{Release}:{ServType}:SettingB:',NULL,'\0'),(15,8,'Param 1 - Comp 2 - Bridge - 7.4.0 Package','C8Param1Value','ROOT:{Release}:{ServType}:{AppName}:SettingC:',NULL,'\0'),(16,8,'Param 2 - Comp 2 - Bridge - 7.4.0 Package','C8Param2Value','ROOT:{Release}:{ServType}:SettingD:',NULL,'\0'),(17,9,'Param 1 - Comp 1 - EAS - 7.4.0 Package','C9Param1Value','ROOT:{Release}:{ServType}:SettingA:',NULL,'\0'),(18,9,'Param 2 - Comp 1 - EAS - 7.4.0 Package','C9Param2Value','ROOT:{Release}:{ServType}:SettingB:',NULL,'\0'),(19,10,'Param 1 - Comp 2 - EAS - 7.4.0 Package','C10Param1Value','ROOT:{Release}:{ServType}:SettingC:',NULL,'\0'),(20,10,'Param 2 - Comp 2 - EAS - 7.4.0 Package','C10Param2Value','ROOT:{Release}:{ServType}:SettingD:',NULL,'\0'),(21,11,'Param 1 - Comp 1 - UIS - 7.4.0 Package','C11Param1Value','ROOT:{Release}:{ServType}:SettingA:',NULL,'\0'),(22,11,'Param 2 - Comp 1 - UIS - 7.4.0 Package','C11Param2Value','ROOT:{Release}:{ServType}:SettingB:',NULL,'\0'),(23,12,'Param 1 - Comp 2 - UIS - 7.4.0 Package','C12Param1Value','ROOT:{Release}:{ServType}:SettingC:',NULL,'\0'),(24,12,'Param 2 - Comp 2 - UIS - 7.4.0 Package','C12Param2Value','ROOT:{Release}:{ServType}:SettingD:',NULL,'\0');
/*!40000 ALTER TABLE `cm_componentconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cm_environment`
--

DROP TABLE IF EXISTS `cm_environment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cm_environment` (
  `EnvironmentID` bigint(20) NOT NULL AUTO_INCREMENT,
  `EnvironmentName` varchar(50) NOT NULL,
  `EnvironmentTypeID` bigint(20) NOT NULL,
  PRIMARY KEY (`EnvironmentID`),
  UNIQUE KEY `UQ_CM_Environment_EnvironmentName` (`EnvironmentName`),
  KEY `EnvironmentTypeID` (`EnvironmentTypeID`),
  CONSTRAINT `cm_environment_ibfk_1` FOREIGN KEY (`EnvironmentTypeID`) REFERENCES `cm_environmenttype` (`EnvironmentTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cm_environment`
--

LOCK TABLES `cm_environment` WRITE;
/*!40000 ALTER TABLE `cm_environment` DISABLE KEYS */;
INSERT INTO `cm_environment` VALUES (11,'FT1',1),(12,'FT2',1),(13,'FT3',1),(14,'FT4',1),(15,'FT5',1),(16,'IT1',2),(17,'IT2',2),(18,'IT3',2),(19,'IT4',2),(20,'IT5',2),(21,'ST1',4),(22,'TR1',5),(23,'TR2',5),(24,'UT1',6),(25,'UT2',6),(26,'PT1',4),(27,'PT2',4),(28,'PS1',7),(30,'PROD',3),(31,'TEST',1);
/*!40000 ALTER TABLE `cm_environment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cm_environmenttype`
--

DROP TABLE IF EXISTS `cm_environmenttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cm_environmenttype` (
  `EnvironmentTypeID` bigint(20) NOT NULL AUTO_INCREMENT,
  `EnvironmentTypeName` varchar(50) NOT NULL,
  PRIMARY KEY (`EnvironmentTypeID`),
  UNIQUE KEY `UQ_CM_EnvironmentType_EnvironmentTypeName` (`EnvironmentTypeName`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cm_environmenttype`
--

LOCK TABLES `cm_environmenttype` WRITE;
/*!40000 ALTER TABLE `cm_environmenttype` DISABLE KEYS */;
INSERT INTO `cm_environmenttype` VALUES (1,'Functional Test'),(2,'Integration Test'),(4,'Performance Testing'),(7,'Prod Support'),(3,'Production'),(5,'Training'),(6,'User Acceptance');
/*!40000 ALTER TABLE `cm_environmenttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cm_globalconfig`
--

DROP TABLE IF EXISTS `cm_globalconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cm_globalconfig` (
  `GlobalConfigID` bigint(20) NOT NULL AUTO_INCREMENT,
  `GlobalConfigParameter` varchar(255) NOT NULL,
  `GlobalConfigValue` varchar(255) DEFAULT NULL,
  `GlobalConfigHieraAddress` varchar(255) DEFAULT NULL,
  `RecursiveByEnv` bit(1) NOT NULL DEFAULT b'0',
  `RecursiveByRel` bit(1) NOT NULL DEFAULT b'0',
  `RecursiveBySubEnv` bit(1) NOT NULL DEFAULT b'0',
  `GlobalConfigNotes` varchar(255) DEFAULT NULL,
  `GlobalConfigIsSensitive` bit(1) DEFAULT b'0',
  PRIMARY KEY (`GlobalConfigID`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cm_globalconfig`
--

LOCK TABLES `cm_globalconfig` WRITE;
/*!40000 ALTER TABLE `cm_globalconfig` DISABLE KEYS */;
INSERT INTO `cm_globalconfig` VALUES (4,'root_pass','removed','ROOT:{ParamName}:','\0','\0','\0',NULL,'\0'),(5,'specpath','/root/spec','ROOT:{ParamName}:','\0','\0','\0',NULL,'\0'),(6,'repo_name','rhel-6.4-x86_64-puppet','ROOT:{ParamName}:-','\0','\0','\0',NULL,'\0'),(7,'repo_name','columbus-uk-boots','ROOT:{ParamName}:-','\0','\0','\0',NULL,'\0'),(8,'oneleonardo_jdk_release','1.6.0_37','ROOT:{ParamName}:','\0','\0','\0',NULL,'\0'),(9,'oneleonardo_jboss_release','7.1.1.Final','ROOT:{ParamName}:','\0','\0','\0',NULL,'\0'),(10,'oneleonardo_jboss_build','5HS.redhat6.4','ROOT:{ParamName}:','\0','\0','\0',NULL,'\0'),(11,'oracle_client_version','11.2.0.3','ROOT:{ParamName}:','\0','\0','\0',NULL,'\0'),(12,'httpuser','deployer','ROOT:columbus_delivery:{ParamName}:','\0','\0','\0',NULL,'\0'),(13,'httppass','removed','ROOT:columbus_delivery:{ParamName}:','\0','\0','\0',NULL,'\0'),(14,'httpserver','delivery.na-dc.ah.ab:8081','ROOT:columbus_delivery:{ParamName}:','\0','\0','\0',NULL,'\0'),(19,'httpurl','artifactory/libs-releases-local/com/ab/oneleo/columbus','ROOT:columbus_delivery:{ParamName}:','\0','\0','\0',NULL,'\0'),(20,'gid','1000','ROOT:group_tagbt:{ParamName}:','\0','\0','\0',NULL,'\0'),(21,'gid','1000','ROOT:group_tagbs:{ParamName}:','\0','\0','\0',NULL,'\0'),(22,'uid','1001','ROOT:user_pmsgbrtt:{ParamName}:','\0','\0','\0',NULL,'\0'),(23,'gid','pmsgbrtt','ROOT:user_pmsgbrtt:{ParamName}:','\0','\0','\0',NULL,'\0'),(24,'groups','pmsgbrtt','ROOT:user_pmsgbrtt:{ParamName}:','\0','\0','\0',NULL,'\0'),(25,'home','/home/pmsgbrtt','ROOT:user_pmsgbrtt:{ParamName}:','\0','\0','\0',NULL,'\0'),(26,'password','removed','ROOT:user_pmsgbrtt:{ParamName}:','\0','\0','\0',NULL,'\0'),(27,'nofiles','10000','ROOT:user_pmsgbrtt:{ParamName}:','\0','\0','\0',NULL,'\0'),(28,'jdk_release','1.6.0_37','ROOT:user_pmsgbrtt:{ParamName}:','\0','\0','\0',NULL,'\0'),(29,'devel','true','ROOT:user_pmsgbrtt:authorized_keys:{ParamName}:','\0','\0','\0',NULL,'\0'),(30,'boots_support','true','ROOT:user_pmsgbrtt:authorized_keys:{ParamName}:','\0','\0','\0',NULL,'\0'),(31,'boots_performance_test','true','ROOT:user_pmsgbrtt:authorized_keys:{ParamName}:','\0','\0','\0',NULL,'\0'),(32,'gid','1001','ROOT:group_pmsgbrtt:{ParamName}:','\0','\0','\0',NULL,'\0'),(33,'uid','4001','ROOT:user_pmsgbmtt:{ParamName}:','\0','\0','\0',NULL,'\0'),(34,'gid','pmsgbrtt','ROOT:user_pmsgbmtt:{ParamName}:','\0','\0','\0',NULL,'\0'),(35,'groups','pmsgbrtt','ROOT:user_pmsgbmtt:{ParamName}:','\0','\0','\0',NULL,'\0'),(36,'home','/home/pmsgbmtt','ROOT:user_pmsgbmtt:{ParamName}:','\0','\0','\0',NULL,'\0'),(37,'password','removed','ROOT:user_pmsgbmtt:{ParamName}:','\0','\0','\0',NULL,'\0'),(38,'boots_support','true','ROOT:user_pmsgbmtt:authorized_keys:{ParamName}:','\0','\0','\0',NULL,'\0'),(39,'boots_performance_test','true','ROOT:user_pmsgbmtt:authorized_keys:{ParamName}:','\0','\0','\0',NULL,'\0'),(40,'user','tagbtadm','ROOT:batchclient_test_info:{ParamName}:','\0','\0','\0',NULL,'\0'),(41,'group','tagbt','ROOT:batchclient_test_info:{ParamName}:','\0','\0','\0',NULL,'\0'),(42,'vg','rootvg','ROOT:batchclient_test_info:{ParamName}:','\0','\0','\0',NULL,'\0'),(43,'size_envs','1G','ROOT:batchclient_test_info:{ParamName}:','\0','\0','\0',NULL,'\0'),(44,'size_envf','1G','ROOT:batchclient_test_info:{ParamName}:','\0','\0','\0',NULL,'\0'),(45,'size_envb','1G','ROOT:batchclient_test_info:{ParamName}:','\0','\0','\0',NULL,'\0'),(46,'user','tagbsadm','ROOT:batchclient_stag_info:{ParamName}:','\0','\0','\0',NULL,'\0'),(47,'group','tagbs','ROOT:batchclient_stag_info:{ParamName}:','\0','\0','\0',NULL,'\0'),(48,'vg','rootvg','ROOT:batchclient_stag_info:{ParamName}:','\0','\0','\0',NULL,'\0'),(49,'size_envs','1G','ROOT:batchclient_stag_info:{ParamName}:','\0','\0','\0',NULL,'\0'),(50,'size_envf','1G','ROOT:batchclient_stag_info:{ParamName}:','\0','\0','\0',NULL,'\0'),(51,'size_envb','1G','ROOT:batchclient_stag_info:{ParamName}:','\0','\0','\0',NULL,'\0'),(52,'build_version','7.4.3','ROOT:oneleo_release_map:columbus:uk-boots:{ParamName}:','\0','\0','\0',NULL,'\0'),(70,'columbus','jobs/scripts/columbus','ROOT:projects_path:{ParamName}:','\0','\0','\0',NULL,'\0'),(71,'optimus','jobs/scripts/optimus','ROOT:projects_path:{ParamName}:','\0','\0','\0',NULL,'\0');
/*!40000 ALTER TABLE `cm_globalconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cm_node`
--

DROP TABLE IF EXISTS `cm_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cm_node` (
  `NodeID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NodeType` enum('Server','Router','Switch','Load Balancer','VIP','TBC') NOT NULL,
  PRIMARY KEY (`NodeID`)
) ENGINE=InnoDB AUTO_INCREMENT=288 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cm_node`
--

LOCK TABLES `cm_node` WRITE;
/*!40000 ALTER TABLE `cm_node` DISABLE KEYS */;
INSERT INTO `cm_node` VALUES (1,'Server'),(2,'Server'),(3,'Server'),(4,'Server'),(5,'Server'),(6,'Server'),(7,'Server'),(8,'Server'),(9,'Server'),(10,'Server'),(11,'Server'),(12,'Server'),(13,'Server'),(14,'Server'),(19,'Server'),(20,'Server'),(21,'Server'),(22,'Server'),(23,'Server'),(24,'Server'),(25,'Server'),(28,'Server'),(29,'Server'),(30,'Server'),(31,'Server'),(32,'Server'),(33,'Server'),(34,'Server'),(35,'Server'),(36,'Server'),(37,'Server'),(38,'Server'),(39,'Server'),(40,'Server'),(41,'Server'),(42,'Server'),(43,'Server'),(44,'Server'),(45,'Server'),(46,'Server'),(47,'Server'),(48,'Server'),(49,'Server'),(50,'Server'),(51,'Server'),(52,'Server'),(53,'Server'),(54,'Server'),(55,'Server'),(56,'Server'),(57,'Server'),(58,'Server'),(59,'Server'),(60,'Server'),(61,'Server'),(62,'Server'),(63,'Server'),(64,'Server'),(65,'Server'),(66,'Server'),(67,'Server'),(68,'Server'),(69,'Server'),(70,'Server'),(71,'Server'),(72,'Server'),(73,'Server'),(74,'Server'),(75,'Server'),(76,'Server'),(77,'Server'),(78,'Server'),(79,'Server'),(80,'Server'),(81,'Server'),(82,'Server'),(83,'Server'),(84,'Server'),(85,'Server'),(86,'Server'),(87,'Server'),(88,'Server'),(89,'Server'),(90,'Server'),(91,'Server'),(92,'Server'),(93,'Server'),(94,'Server'),(95,'Server'),(96,'Server'),(97,'Server'),(98,'Server'),(99,'Server'),(100,'Server'),(101,'Server'),(102,'Server'),(103,'Server'),(104,'Server'),(105,'Server'),(106,'Server'),(107,'Server'),(108,'Server'),(109,'Server'),(110,'Server'),(111,'Server'),(112,'Server'),(113,'Server'),(114,'Server'),(115,'Server'),(116,'Server'),(117,'Server'),(118,'Server'),(119,'Server'),(120,'Server'),(121,'Server'),(122,'Server'),(123,'Server'),(124,'Server'),(125,'Server'),(126,'Server'),(127,'Server'),(128,'Server'),(129,'Server'),(130,'Server'),(131,'Server'),(132,'Server'),(133,'Server'),(134,'VIP'),(135,'VIP'),(136,'VIP'),(137,'Server'),(138,'Server'),(139,'Server'),(140,'Server'),(141,'Server'),(142,'Server'),(143,'Server'),(144,'Server'),(145,'Server'),(146,'Server'),(147,'Server'),(148,'Server'),(149,'Server'),(150,'Server'),(151,'Server'),(152,'Server'),(153,'Server'),(154,'Server'),(155,'Server'),(156,'Server'),(157,'Server'),(158,'Server'),(159,'Server'),(160,'Server'),(161,'Server'),(162,'Server'),(163,'Server'),(164,'Server'),(165,'Server'),(166,'Server'),(167,'Server'),(168,'Server'),(169,'Server'),(170,'Server'),(171,'Server'),(172,'Server'),(173,'Server'),(174,'Server'),(175,'Server'),(176,'Server'),(177,'Server'),(178,'Server'),(179,'VIP'),(180,'Server'),(181,'Server'),(182,'Server'),(183,'Server'),(184,'Server'),(185,'Server'),(186,'Server'),(187,'Server'),(188,'Server'),(189,'Server'),(190,'Server'),(191,'Server'),(192,'Server'),(193,'Server'),(194,'VIP'),(195,'VIP'),(196,'VIP'),(197,'VIP'),(198,'VIP'),(199,'Server'),(200,'Server'),(201,'Server'),(202,'Server'),(203,'Server'),(204,'Server'),(205,'Server'),(206,'Server'),(207,'Server'),(208,'Server'),(209,'Server'),(210,'Server'),(211,'Server'),(212,'Server'),(213,'Server'),(214,'Server'),(215,'Server'),(216,'Server'),(217,'Server'),(218,'Server'),(219,'Server'),(220,'Server'),(221,'Server'),(222,'Server'),(223,'Server'),(224,'Server'),(225,'Server'),(226,'Server'),(227,'VIP'),(228,'Server'),(229,'Server'),(230,'Server'),(231,'Server'),(232,'Server'),(233,'Server'),(234,'Server'),(235,'Server'),(236,'Server'),(237,'Server'),(238,'Server'),(239,'Server'),(240,'Server'),(241,'Server'),(242,'Server'),(243,'Server'),(244,'Server'),(245,'Server'),(246,'Server'),(247,'Server'),(248,'Server'),(249,'Server'),(250,'Server'),(251,'Server'),(252,'Server'),(253,'Server'),(254,'Server'),(255,'Server'),(256,'Server'),(257,'Server'),(258,'Server'),(259,'Server'),(260,'Server'),(261,'Server'),(262,'Server'),(263,'Server'),(264,'Server'),(265,'Server'),(266,'Server'),(267,'Server'),(268,'Server'),(269,'Server'),(270,'Server'),(271,'Server'),(272,'VIP'),(273,'VIP'),(274,'VIP'),(275,'VIP'),(276,'VIP'),(277,'VIP'),(278,'VIP'),(279,'VIP'),(280,'VIP'),(281,'VIP'),(282,'VIP'),(283,'VIP'),(284,'VIP'),(285,'VIP'),(286,'VIP'),(287,'VIP');
/*!40000 ALTER TABLE `cm_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cm_node_subenvironment`
--

DROP TABLE IF EXISTS `cm_node_subenvironment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cm_node_subenvironment` (
  `NodeSubID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NodeID` bigint(20) NOT NULL,
  `SubEnvironmentID` bigint(20) NOT NULL,
  PRIMARY KEY (`NodeSubID`),
  KEY `NodeID` (`NodeID`),
  KEY `SubEnvironmentID` (`SubEnvironmentID`),
  CONSTRAINT `node_subenvironment_ibfk_1` FOREIGN KEY (`NodeID`) REFERENCES `cm_node` (`NodeID`),
  CONSTRAINT `node_subenvironment_ibfk_2` FOREIGN KEY (`SubEnvironmentID`) REFERENCES `cm_subenvironment` (`SubEnvironmentID`)
) ENGINE=InnoDB AUTO_INCREMENT=449 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cm_node_subenvironment`
--

LOCK TABLES `cm_node_subenvironment` WRITE;
/*!40000 ALTER TABLE `cm_node_subenvironment` DISABLE KEYS */;
INSERT INTO `cm_node_subenvironment` VALUES (1,36,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,6,1),(7,7,1),(8,8,1),(9,9,1),(10,10,1),(11,11,1),(12,12,1),(13,13,1),(14,14,1),(15,19,2),(16,20,2),(17,21,2),(18,22,2),(19,23,2),(20,24,2),(21,25,2),(22,36,2),(23,12,2),(24,13,2),(25,14,2),(28,28,5),(29,29,6),(30,30,5),(31,31,6),(32,33,5),(33,34,6),(34,35,7),(35,36,7),(36,37,7),(37,38,7),(38,39,7),(39,40,7),(40,41,7),(41,42,7),(42,43,7),(43,44,7),(44,12,7),(45,13,7),(46,14,7),(47,45,8),(48,46,8),(49,36,8),(50,47,8),(51,48,8),(52,49,8),(53,50,8),(54,51,8),(55,52,8),(56,12,8),(57,13,8),(58,14,8),(59,53,9),(60,54,9),(61,36,9),(62,55,9),(63,56,9),(64,57,9),(65,58,9),(66,59,9),(67,12,9),(68,13,9),(69,14,9),(70,36,10),(71,60,10),(72,61,10),(73,62,10),(74,63,10),(75,64,10),(76,65,10),(77,66,10),(78,67,10),(79,68,10),(80,69,10),(81,12,10),(82,13,10),(83,14,10),(84,36,11),(86,74,11),(87,75,11),(88,76,11),(89,77,11),(90,78,11),(91,12,11),(92,13,11),(93,14,11),(94,79,20),(95,80,20),(96,36,12),(97,81,12),(98,82,12),(99,83,12),(100,84,12),(101,85,12),(102,12,12),(103,13,12),(104,14,12),(105,86,13),(106,87,13),(107,36,13),(108,88,13),(109,89,13),(110,90,13),(111,91,13),(112,92,13),(113,12,13),(114,13,13),(115,14,13),(116,93,14),(117,94,14),(118,36,14),(119,95,14),(120,96,14),(121,97,14),(122,98,14),(123,99,14),(124,12,14),(125,13,14),(126,14,14),(127,100,15),(128,101,15),(129,36,15),(131,102,16),(132,103,16),(133,36,16),(134,104,16),(135,105,16),(136,106,16),(137,107,16),(138,108,16),(139,12,16),(140,13,16),(141,14,16),(142,109,17),(143,110,17),(144,36,17),(145,111,17),(146,112,17),(147,113,17),(148,114,17),(149,115,17),(150,12,17),(151,13,17),(152,14,17),(153,1,1),(154,1,2),(155,1,8),(156,1,9),(157,1,10),(158,1,11),(159,1,12),(160,1,13),(161,1,14),(162,1,15),(163,1,16),(164,1,17),(165,1,7),(166,32,6),(167,32,5),(168,116,7),(169,116,8),(170,116,9),(171,116,10),(172,116,11),(173,116,12),(174,116,2),(175,116,13),(176,116,14),(177,116,15),(178,116,16),(179,116,17),(180,116,1),(181,117,7),(182,117,8),(183,117,9),(184,117,10),(185,117,11),(186,117,12),(187,117,2),(188,117,13),(189,117,14),(190,117,15),(191,117,16),(192,117,17),(193,117,1),(194,118,7),(195,119,7),(196,120,7),(197,120,8),(198,118,8),(199,119,8),(200,120,9),(201,118,9),(202,119,9),(203,120,10),(204,118,10),(205,119,10),(206,120,11),(207,118,11),(208,119,11),(209,120,12),(210,118,12),(211,119,12),(212,121,21),(213,122,21),(214,123,2),(215,120,2),(216,118,2),(217,119,2),(218,120,13),(219,118,13),(220,119,13),(221,120,14),(222,118,14),(223,119,14),(224,120,16),(225,118,16),(226,119,16),(227,120,17),(228,118,17),(229,119,17),(230,120,1),(231,118,1),(232,119,1),(233,124,7),(234,125,8),(235,126,9),(236,127,12),(237,128,2),(238,129,13),(239,130,14),(240,131,16),(241,132,17),(242,133,1),(243,72,18),(245,70,18),(246,71,19),(247,134,7),(248,135,7),(249,136,7),(250,134,8),(251,135,8),(252,136,8),(253,134,9),(254,135,9),(255,136,9),(256,134,10),(257,135,10),(258,136,10),(259,134,18),(260,135,18),(261,134,19),(262,135,19),(263,136,11),(264,134,20),(265,135,20),(266,134,21),(267,135,21),(268,136,12),(269,136,2),(270,135,2),(271,134,2),(272,134,13),(273,135,13),(274,136,13),(275,134,14),(276,135,14),(277,136,14),(278,134,15),(279,135,15),(280,136,15),(281,137,15),(282,134,16),(283,135,16),(284,136,16),(285,134,17),(286,135,17),(287,136,17),(288,134,1),(289,135,1),(290,136,1),(291,138,5),(293,139,6),(295,73,19),(296,140,25),(297,141,25),(298,142,25),(299,143,25),(300,144,26),(301,145,26),(302,146,26),(303,147,26),(304,148,27),(305,149,27),(306,150,27),(307,151,27),(308,152,25),(309,153,25),(310,154,25),(311,155,25),(312,156,26),(313,157,26),(314,158,26),(315,159,26),(316,160,27),(317,161,27),(318,162,27),(319,163,27),(320,164,27),(321,165,27),(322,166,22),(323,167,22),(324,168,22),(325,169,22),(326,170,22),(327,171,22),(328,172,22),(329,173,22),(330,174,22),(331,175,22),(332,176,22),(333,177,22),(334,178,22),(335,179,22),(336,180,22),(337,181,22),(338,182,22),(339,183,22),(340,184,23),(341,185,23),(342,186,23),(343,187,23),(344,188,23),(345,189,23),(346,190,23),(347,166,23),(348,167,23),(349,168,23),(350,169,23),(351,191,23),(352,192,23),(353,193,23),(356,196,23),(357,197,23),(358,198,23),(359,179,23),(360,199,28),(361,200,28),(362,201,29),(363,202,29),(364,203,30),(365,204,30),(366,205,28),(367,206,28),(368,207,29),(369,208,29),(370,209,30),(371,210,30),(372,211,28),(373,212,28),(374,213,29),(375,214,29),(376,215,30),(377,216,30),(378,217,24),(379,218,24),(380,219,24),(381,220,24),(382,221,24),(383,222,24),(384,223,24),(385,224,24),(386,225,24),(387,226,24),(388,227,24),(389,228,24),(390,229,33),(391,230,33),(392,231,33),(393,232,33),(394,233,34),(395,234,34),(396,235,34),(397,236,34),(398,237,35),(399,238,35),(400,239,35),(401,240,35),(402,241,33),(403,242,33),(404,243,33),(405,244,33),(406,245,34),(407,246,34),(408,247,34),(409,248,34),(410,249,35),(411,250,35),(412,251,35),(413,252,35),(414,253,35),(415,254,35),(416,255,32),(417,256,32),(418,257,32),(419,258,32),(420,259,32),(421,260,32),(422,261,32),(423,262,32),(424,263,32),(425,264,32),(426,265,32),(427,266,32),(428,267,32),(429,268,32),(430,269,32),(431,270,32),(432,271,32),(433,272,32),(434,273,22),(435,274,22),(436,275,32),(437,276,32),(438,277,25),(439,278,26),(440,279,27),(441,280,22),(442,281,32),(443,282,33),(444,283,34),(445,284,35),(446,285,28),(447,286,29),(448,287,30);
/*!40000 ALTER TABLE `cm_node_subenvironment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cm_nodeip`
--

DROP TABLE IF EXISTS `cm_nodeip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cm_nodeip` (
  `NodeIPID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NodeSubID` bigint(20) DEFAULT NULL,
  `NodeIPAddress` varchar(50) NOT NULL,
  `NodeIPType` enum('VIRTUAL','PHYSICAL','WIRED') NOT NULL,
  PRIMARY KEY (`NodeIPID`),
  UNIQUE KEY `UQ_NodeIP_NodeSubIPAddress` (`NodeIPAddress`,`NodeSubID`),
  KEY `NodeSubID` (`NodeSubID`),
  CONSTRAINT `cm_nodeip_ibfk_2` FOREIGN KEY (`NodeSubID`) REFERENCES `cm_node_subenvironment` (`NodeSubID`)
) ENGINE=InnoDB AUTO_INCREMENT=458 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cm_nodeip`
--

LOCK TABLES `cm_nodeip` WRITE;
/*!40000 ALTER TABLE `cm_nodeip` DISABLE KEYS */;
INSERT INTO `cm_nodeip` VALUES (9,247,'10.141.129.247','VIRTUAL'),(10,248,'10.141.129.248','VIRTUAL'),(11,249,'10.141.129.249','VIRTUAL'),(12,250,'10.141.129.247','VIRTUAL'),(13,251,'10.141.129.248','VIRTUAL'),(14,252,'10.141.129.249','VIRTUAL'),(15,253,'10.141.129.247','VIRTUAL'),(16,254,'10.141.129.248','VIRTUAL'),(17,255,'10.141.129.249','VIRTUAL'),(18,256,'10.141.129.247','VIRTUAL'),(19,257,'10.141.129.248','VIRTUAL'),(20,258,'10.141.129.249','VIRTUAL'),(21,259,'10.141.129.247','VIRTUAL'),(22,261,'10.141.129.247','VIRTUAL'),(23,260,'10.141.129.248','VIRTUAL'),(24,262,'10.141.129.248','VIRTUAL'),(25,263,'10.141.129.249','VIRTUAL'),(26,165,'10.141.129.1','PHYSICAL'),(27,34,'10.141.129.3','PHYSICAL'),(28,36,'10.141.129.95','PHYSICAL'),(29,37,'10.141.129.10','PHYSICAL'),(30,38,'10.141.129.12','PHYSICAL'),(31,39,'10.141.129.13','PHYSICAL'),(32,168,'10.141.129.75','PHYSICAL'),(33,181,'10.141.129.70','PHYSICAL'),(34,43,'10.141.129.80','PHYSICAL'),(35,44,'10.141.129.84','PHYSICAL'),(37,40,'10.141.129.85','PHYSICAL'),(38,41,'10.141.129.241','PHYSICAL'),(39,42,'10.141.129.94','PHYSICAL'),(40,194,'10.141.129.227','PHYSICAL'),(41,195,'10.141.129.228','PHYSICAL'),(42,233,'10.141.129.39','PHYSICAL'),(43,45,'10.141.129.14','PHYSICAL'),(44,196,'10.141.129.16','PHYSICAL'),(45,46,'10.141.129.15','PHYSICAL'),(46,35,'10.141.129.251','PHYSICAL'),(47,155,'10.141.129.1','PHYSICAL'),(48,47,'10.141.129.4','PHYSICAL'),(49,48,'10.141.129.96','PHYSICAL'),(50,50,'10.141.129.19','PHYSICAL'),(51,51,'10.141.129.38','PHYSICAL'),(52,169,'10.141.129.75','PHYSICAL'),(53,182,'10.141.129.70','PHYSICAL'),(54,55,'10.141.129.81','PHYSICAL'),(55,56,'10.141.129.84','PHYSICAL'),(56,52,'10.141.129.86','PHYSICAL'),(57,53,'10.141.129.91','PHYSICAL'),(58,54,'10.141.129.77','PHYSICAL'),(59,198,'10.141.129.227','PHYSICAL'),(60,199,'10.141.129.228','PHYSICAL'),(61,234,'10.141.129.40','PHYSICAL'),(62,57,'10.141.129.14','PHYSICAL'),(63,197,'10.141.129.16','PHYSICAL'),(64,58,'10.141.129.15','PHYSICAL'),(65,49,'10.141.129.251','PHYSICAL'),(66,156,'10.141.129.1','PHYSICAL'),(67,59,'10.141.129.7','PHYSICAL'),(68,60,'10.141.129.8','PHYSICAL'),(69,62,'10.141.129.9','PHYSICAL'),(70,170,'10.141.129.75','PHYSICAL'),(71,183,'10.141.129.70','PHYSICAL'),(72,66,'10.141.129.20','PHYSICAL'),(73,67,'10.141.129.84','PHYSICAL'),(74,63,'10.141.129.21','PHYSICAL'),(75,64,'10.141.129.22','PHYSICAL'),(76,65,'10.141.129.23','PHYSICAL'),(77,201,'10.141.129.227','PHYSICAL'),(78,202,'10.141.129.228','PHYSICAL'),(79,235,'10.141.129.41','PHYSICAL'),(80,68,'10.141.129.14','PHYSICAL'),(81,200,'10.141.129.16','PHYSICAL'),(82,69,'10.141.129.15','PHYSICAL'),(83,61,'10.141.129.251','PHYSICAL'),(84,157,'10.141.129.1','PHYSICAL'),(85,71,'10.141.129.63','PHYSICAL'),(86,72,'10.141.129.64','PHYSICAL'),(87,73,'10.141.129.65','PHYSICAL'),(88,74,'10.141.129.66','PHYSICAL'),(89,75,'10.141.129.67','PHYSICAL'),(90,76,'10.141.129.68','PHYSICAL'),(91,171,'10.141.129.75','PHYSICAL'),(92,184,'10.141.129.70','PHYSICAL'),(93,80,'10.141.129.69','PHYSICAL'),(94,81,'10.141.129.84','PHYSICAL'),(95,77,'10.141.129.101','PHYSICAL'),(96,78,'10.141.129.102','PHYSICAL'),(97,79,'10.141.129.103','PHYSICAL'),(98,204,'10.141.129.227','PHYSICAL'),(99,205,'10.141.129.228','PHYSICAL'),(100,82,'10.141.129.14','PHYSICAL'),(101,203,'10.141.129.16','PHYSICAL'),(102,83,'10.141.129.15','PHYSICAL'),(103,70,'10.141.129.251','PHYSICAL'),(104,245,'10.141.129.104','PHYSICAL'),(105,243,'10.141.129.107','PHYSICAL'),(106,246,'10.141.129.106','PHYSICAL'),(108,158,'10.141.129.1','PHYSICAL'),(109,86,'10.141.129.112','PHYSICAL'),(110,172,'10.141.129.75','PHYSICAL'),(111,185,'10.141.129.70','PHYSICAL'),(112,90,'10.141.129.121','PHYSICAL'),(113,91,'10.141.129.84','PHYSICAL'),(114,87,'10.141.129.122','PHYSICAL'),(115,88,'10.141.129.123','PHYSICAL'),(116,89,'10.141.129.124','PHYSICAL'),(117,207,'10.141.129.227','PHYSICAL'),(118,208,'10.141.129.228','PHYSICAL'),(119,92,'10.141.129.14','PHYSICAL'),(120,206,'10.141.129.16','PHYSICAL'),(121,93,'10.141.129.15','PHYSICAL'),(122,84,'10.141.129.251','PHYSICAL'),(124,264,'10.141.129.247','VIRTUAL'),(125,265,'10.141.129.248','VIRTUAL'),(126,266,'10.141.129.247','VIRTUAL'),(127,267,'10.141.129.248','VIRTUAL'),(128,268,'10.141.129.249','VIRTUAL'),(130,94,'10.141.129.5','PHYSICAL'),(131,95,'10.141.129.97','PHYSICAL'),(132,212,'10.141.129.48','PHYSICAL'),(133,213,'10.141.129.49','PHYSICAL'),(134,159,'10.141.129.1','PHYSICAL'),(135,97,'10.141.129.17','PHYSICAL'),(136,173,'10.141.129.75','PHYSICAL'),(137,186,'10.141.129.70','PHYSICAL'),(138,101,'10.141.129.82','PHYSICAL'),(139,102,'10.141.129.84','PHYSICAL'),(140,98,'10.141.129.87','PHYSICAL'),(141,99,'10.141.129.92','PHYSICAL'),(142,100,'10.141.129.78','PHYSICAL'),(143,210,'10.141.129.227','PHYSICAL'),(144,211,'10.141.129.228','PHYSICAL'),(145,236,'10.141.129.42','PHYSICAL'),(146,103,'10.141.129.14','PHYSICAL'),(147,209,'10.141.129.16','PHYSICAL'),(148,104,'10.141.129.15','PHYSICAL'),(149,96,'10.141.129.251','PHYSICAL'),(150,271,'10.141.129.247','VIRTUAL'),(151,270,'10.141.129.248','VIRTUAL'),(152,269,'10.141.129.249','VIRTUAL'),(153,154,'10.141.129.1','PHYSICAL'),(154,15,'10.141.129.6','PHYSICAL'),(155,16,'10.141.129.98','PHYSICAL'),(156,17,'10.141.129.18','PHYSICAL'),(157,214,'10.141.129.51','PHYSICAL'),(158,174,'10.141.129.75','PHYSICAL'),(159,187,'10.141.129.70','PHYSICAL'),(160,21,'10.141.129.83','PHYSICAL'),(161,23,'10.141.129.84','PHYSICAL'),(162,18,'10.141.129.88','PHYSICAL'),(163,19,'10.141.129.93','PHYSICAL'),(164,20,'10.141.129.79','PHYSICAL'),(165,216,'10.141.129.227','PHYSICAL'),(166,217,'10.141.129.228','PHYSICAL'),(167,237,'10.141.129.43','PHYSICAL'),(168,24,'10.141.129.14','PHYSICAL'),(169,215,'10.141.129.16','PHYSICAL'),(170,25,'10.141.129.15','PHYSICAL'),(171,22,'10.141.129.251','PHYSICAL'),(172,272,'10.141.129.247','VIRTUAL'),(173,273,'10.141.129.248','VIRTUAL'),(174,274,'10.141.129.249','VIRTUAL'),(175,160,'10.141.129.1','PHYSICAL'),(176,105,'10.141.129.110','PHYSICAL'),(177,106,'10.141.129.111','PHYSICAL'),(178,108,'10.141.129.50','PHYSICAL'),(179,175,'10.141.129.75','PHYSICAL'),(180,188,'10.141.129.70','PHYSICAL'),(181,112,'10.141.129.113','PHYSICAL'),(182,113,'10.141.129.84','PHYSICAL'),(183,109,'10.141.129.99','PHYSICAL'),(184,110,'10.141.129.100','PHYSICAL'),(185,111,'10.141.129.90','PHYSICAL'),(186,219,'10.141.129.227','PHYSICAL'),(187,220,'10.141.129.228','PHYSICAL'),(188,238,'10.141.129.44','PHYSICAL'),(189,114,'10.141.129.14','PHYSICAL'),(190,218,'10.141.129.16','PHYSICAL'),(191,115,'10.141.129.15','PHYSICAL'),(192,107,'10.141.129.251','PHYSICAL'),(193,275,'10.141.129.247','VIRTUAL'),(194,276,'10.141.129.248','VIRTUAL'),(195,277,'10.141.129.249','VIRTUAL'),(197,161,'10.141.129.1','PHYSICAL'),(198,116,'10.141.129.24','PHYSICAL'),(199,117,'10.141.129.25','PHYSICAL'),(200,119,'10.141.129.26','PHYSICAL'),(201,176,'10.141.129.75','PHYSICAL'),(202,189,'10.141.129.70','PHYSICAL'),(203,123,'10.141.129.27','PHYSICAL'),(204,124,'10.141.129.84','PHYSICAL'),(205,120,'10.141.129.28','PHYSICAL'),(206,121,'10.141.129.29','PHYSICAL'),(207,122,'10.141.129.30','PHYSICAL'),(208,222,'10.141.129.227','PHYSICAL'),(209,223,'10.141.129.228','PHYSICAL'),(210,239,'10.141.129.45','PHYSICAL'),(211,125,'10.141.129.14','PHYSICAL'),(212,221,'10.141.129.16','PHYSICAL'),(213,126,'10.141.129.15','PHYSICAL'),(214,118,'10.141.129.251','PHYSICAL'),(215,278,'10.141.129.247','VIRTUAL'),(216,279,'10.141.129.248','VIRTUAL'),(217,280,'10.141.129.249','VIRTUAL'),(218,162,'10.141.129.1','PHYSICAL'),(219,127,'10.141.129.125','PHYSICAL'),(220,128,'10.141.129.126','PHYSICAL'),(221,177,'10.141.129.75','PHYSICAL'),(222,190,'10.141.129.70','PHYSICAL'),(223,281,'10.141.129.127','PHYSICAL'),(224,129,'10.141.129.251','PHYSICAL'),(225,282,'10.141.129.247','VIRTUAL'),(226,283,'10.141.129.248','VIRTUAL'),(227,284,'10.141.129.249','VIRTUAL'),(228,163,'10.141.129.1','PHYSICAL'),(229,131,'10.141.129.114','PHYSICAL'),(230,132,'10.141.129.115','PHYSICAL'),(231,134,'10.141.129.116','PHYSICAL'),(232,178,'10.141.129.75','PHYSICAL'),(233,191,'10.141.129.70','PHYSICAL'),(234,138,'10.141.129.117','PHYSICAL'),(235,139,'10.141.129.84','PHYSICAL'),(236,135,'10.141.129.118','PHYSICAL'),(237,136,'10.141.129.119','PHYSICAL'),(238,137,'10.141.129.120','PHYSICAL'),(239,225,'10.141.129.227','PHYSICAL'),(240,226,'10.141.129.228','PHYSICAL'),(241,240,'10.141.129.46','PHYSICAL'),(242,140,'10.141.129.14','PHYSICAL'),(243,224,'10.141.129.16','PHYSICAL'),(244,141,'10.141.129.15','PHYSICAL'),(245,133,'10.141.129.251','PHYSICAL'),(246,285,'10.141.129.247','VIRTUAL'),(247,286,'10.141.129.248','VIRTUAL'),(248,287,'10.141.129.249','VIRTUAL'),(249,164,'10.141.129.1','PHYSICAL'),(250,142,'10.141.129.31','PHYSICAL'),(251,143,'10.141.129.32','PHYSICAL'),(252,145,'10.141.129.33','PHYSICAL'),(253,179,'10.141.129.75','PHYSICAL'),(254,192,'10.141.129.70','PHYSICAL'),(255,149,'10.141.129.34','PHYSICAL'),(256,150,'10.141.129.84','PHYSICAL'),(257,146,'10.141.129.35','PHYSICAL'),(258,147,'10.141.129.36','PHYSICAL'),(259,148,'10.141.129.37','PHYSICAL'),(260,228,'10.141.129.227','PHYSICAL'),(261,229,'10.141.129.228','PHYSICAL'),(262,241,'10.141.129.47','PHYSICAL'),(263,151,'10.141.129.14','PHYSICAL'),(264,227,'10.141.129.16','PHYSICAL'),(265,152,'10.141.129.15','PHYSICAL'),(266,144,'10.141.129.251','PHYSICAL'),(267,288,'10.141.129.247','VIRTUAL'),(268,289,'10.141.129.248','VIRTUAL'),(269,290,'10.141.129.249','VIRTUAL'),(270,153,'10.141.129.1','PHYSICAL'),(271,2,'10.141.129.52','PHYSICAL'),(272,3,'10.141.129.53','PHYSICAL'),(273,4,'10.141.129.54','PHYSICAL'),(274,5,'10.141.129.55','PHYSICAL'),(275,6,'10.141.129.56','PHYSICAL'),(276,7,'10.141.129.57','PHYSICAL'),(277,180,'10.141.129.75','PHYSICAL'),(278,193,'10.141.129.70','PHYSICAL'),(279,11,'10.141.129.58','PHYSICAL'),(280,12,'10.141.129.84','PHYSICAL'),(281,8,'10.141.129.59','PHYSICAL'),(282,9,'10.141.129.60','PHYSICAL'),(283,10,'10.141.129.61','PHYSICAL'),(284,231,'10.141.129.227','PHYSICAL'),(285,232,'10.141.129.228','PHYSICAL'),(286,242,'10.141.129.62','PHYSICAL'),(287,13,'10.141.129.14','PHYSICAL'),(288,230,'10.141.129.16','PHYSICAL'),(289,14,'10.141.129.15','PHYSICAL'),(290,1,'10.141.129.251','PHYSICAL'),(291,167,'10.142.193.193','PHYSICAL'),(293,291,'10.142.193.173','PHYSICAL'),(294,28,'10.142.193.161','PHYSICAL'),(295,30,'10.142.193.165','PHYSICAL'),(297,32,'10.142.193.191','PHYSICAL'),(298,166,'10.142.193.193','PHYSICAL'),(300,29,'10.142.193.177','PHYSICAL'),(301,31,'10.142.193.181','PHYSICAL'),(302,33,'10.142.193.192','PHYSICAL'),(304,293,'10.142.193.174','PHYSICAL'),(306,295,'10.141.129.109','PHYSICAL'),(307,296,'10.141.16.1','PHYSICAL'),(308,297,'10.141.16.2','PHYSICAL'),(309,298,'10.141.16.3','PHYSICAL'),(310,299,'10.141.16.4','PHYSICAL'),(311,300,'10.141.16.64','PHYSICAL'),(312,301,'10.141.16.65','PHYSICAL'),(313,302,'10.141.16.66','PHYSICAL'),(314,303,'10.141.16.67','PHYSICAL'),(315,304,'10.141.16.128','PHYSICAL'),(316,305,'10.141.16.129','PHYSICAL'),(317,306,'10.141.16.130','PHYSICAL'),(318,307,'10.141.16.131','PHYSICAL'),(319,308,'10.141.17.1','PHYSICAL'),(320,309,'10.141.17.2','PHYSICAL'),(321,310,'10.141.17.3','PHYSICAL'),(322,311,'10.141.17.4','PHYSICAL'),(323,312,'10.141.17.64','PHYSICAL'),(324,313,'10.141.17.65','PHYSICAL'),(325,314,'10.141.17.66','PHYSICAL'),(326,315,'10.141.17.67','PHYSICAL'),(327,316,'10.141.17.128','PHYSICAL'),(328,317,'10.141.17.129','PHYSICAL'),(329,318,'10.141.17.130','PHYSICAL'),(330,319,'10.141.17.131','PHYSICAL'),(331,320,'10.141.17.160','PHYSICAL'),(332,321,'10.141.17.161','PHYSICAL'),(333,322,'10.141.18.21','PHYSICAL'),(334,323,'10.141.18.22','PHYSICAL'),(335,324,'10.141.18.14','PHYSICAL'),(336,325,'10.141.18.15','PHYSICAL'),(337,326,'10.141.18.29','PHYSICAL'),(338,327,'10.141.18.30','PHYSICAL'),(339,328,'10.141.18.31','PHYSICAL'),(340,329,'10.141.18.5','PHYSICAL'),(341,330,'10.141.18.32','PHYSICAL'),(342,331,'10.141.18.33','PHYSICAL'),(343,332,'10.141.18.233','PHYSICAL'),(344,333,'10.141.18.234','PHYSICAL'),(345,334,'10.141.18.235','PHYSICAL'),(346,335,'10.141.17.238','VIRTUAL'),(347,336,'10.141.19.195','PHYSICAL'),(348,337,'10.141.19.196','PHYSICAL'),(349,338,'10.141.18.226','PHYSICAL'),(350,339,'10.141.18.227','PHYSICAL'),(351,340,'10.141.19.200','PHYSICAL'),(352,341,'10.141.16.164','PHYSICAL'),(353,342,'10.141.16.165','PHYSICAL'),(354,343,'10.141.17.164','PHYSICAL'),(355,344,'10.141.17.165','PHYSICAL'),(356,345,'10.141.17.166','PHYSICAL'),(357,346,'10.141.17.167','PHYSICAL'),(358,347,'10.141.18.21','PHYSICAL'),(359,348,'10.141.18.22','PHYSICAL'),(360,349,'10.141.18.14','PHYSICAL'),(361,350,'10.141.18.15','PHYSICAL'),(362,351,'10.141.18.24','PHYSICAL'),(363,352,'10.141.18.25','PHYSICAL'),(364,353,'10.141.18.26','PHYSICAL'),(365,356,'10.141.16.239','VIRTUAL'),(366,357,'10.141.16.236','VIRTUAL'),(367,358,'10.141.16.227','VIRTUAL'),(368,359,'10.141.17.238','VIRTUAL'),(369,360,'10.141.16.192','PHYSICAL'),(370,361,'10.141.16.193','PHYSICAL'),(371,362,'10.141.16.200','PHYSICAL'),(372,363,'10.141.16.201','PHYSICAL'),(373,364,'10.141.16.208','PHYSICAL'),(374,365,'10.141.16.209','PHYSICAL'),(375,366,'10.141.17.192','PHYSICAL'),(376,367,'10.141.17.193','PHYSICAL'),(377,368,'10.141.17.200','PHYSICAL'),(378,369,'10.141.17.201','PHYSICAL'),(379,370,'10.141.17.208','PHYSICAL'),(380,371,'10.141.17.209','PHYSICAL'),(381,372,'10.141.17.198','PHYSICAL'),(382,373,'10.141.17.199','PHYSICAL'),(383,374,'10.141.17.206','PHYSICAL'),(384,375,'10.141.17.207','PHYSICAL'),(385,376,'10.141.17.214','PHYSICAL'),(386,377,'10.141.17.215','PHYSICAL'),(387,378,'10.141.18.193','PHYSICAL'),(388,379,'10.141.18.200','PHYSICAL'),(389,380,'10.141.18.201','PHYSICAL'),(390,381,'10.141.18.208','PHYSICAL'),(391,382,'10.141.18.209','PHYSICAL'),(392,383,'10.141.18.216','PHYSICAL'),(393,384,'10.141.18.217','PHYSICAL'),(394,385,'10.141.18.218','PHYSICAL'),(395,386,'10.141.18.219','PHYSICAL'),(396,387,'10.141.18.220','PHYSICAL'),(397,388,'10.141.17.239','VIRTUAL'),(398,389,'10.141.19.209','PHYSICAL'),(399,390,'10.142.16.1','PHYSICAL'),(400,391,'10.142.16.2','PHYSICAL'),(401,392,'10.142.16.3','PHYSICAL'),(402,393,'10.142.16.4','PHYSICAL'),(403,394,'10.142.16.64','PHYSICAL'),(404,395,'10.142.16.65','PHYSICAL'),(405,396,'10.142.16.66','PHYSICAL'),(406,397,'10.142.16.67','PHYSICAL'),(407,398,'10.142.16.128','PHYSICAL'),(408,399,'10.142.16.129','PHYSICAL'),(409,400,'10.142.16.130','PHYSICAL'),(410,401,'10.142.16.131','PHYSICAL'),(411,402,'10.142.17.1','PHYSICAL'),(412,403,'10.142.17.2','PHYSICAL'),(413,404,'10.142.17.3','PHYSICAL'),(414,405,'10.142.17.4','PHYSICAL'),(415,406,'10.142.17.64','PHYSICAL'),(416,407,'10.142.17.65','PHYSICAL'),(417,408,'10.142.17.66','PHYSICAL'),(418,409,'10.142.17.67','PHYSICAL'),(419,410,'10.142.17.128','PHYSICAL'),(420,411,'10.142.17.129','PHYSICAL'),(421,412,'10.142.17.130','PHYSICAL'),(422,413,'10.142.17.131','PHYSICAL'),(423,414,'10.142.17.160','PHYSICAL'),(424,415,'10.142.17.161','PHYSICAL'),(425,416,'10.142.18.29','PHYSICAL'),(426,417,'10.142.18.30','PHYSICAL'),(427,418,'10.142.18.31','PHYSICAL'),(428,419,'10.142.18.5','PHYSICAL'),(429,420,'10.142.18.233','PHYSICAL'),(430,421,'10.142.18.234','PHYSICAL'),(431,422,'10.142.18.235','PHYSICAL'),(432,423,'10.142.18.32','PHYSICAL'),(433,424,'10.142.18.33','PHYSICAL'),(434,425,'10.142.18.15','PHYSICAL'),(435,426,'10.142.18.14','PHYSICAL'),(436,427,'10.142.18.21','PHYSICAL'),(437,428,'10.142.18.22','PHYSICAL'),(438,429,'10.142.19.195','PHYSICAL'),(439,430,'10.142.19.196','PHYSICAL'),(440,431,'10.142.18.226','PHYSICAL'),(441,432,'10.142.18.227','PHYSICAL'),(442,433,'10.142.17.238','VIRTUAL'),(443,434,'10.141.18.225','VIRTUAL'),(444,435,'10.141.19.194','VIRTUAL'),(445,436,'10.142.18.225','VIRTUAL'),(446,437,'10.142.19.194','VIRTUAL'),(447,438,'10.141.16.238','VIRTUAL'),(448,439,'10.141.16.238','VIRTUAL'),(449,440,'10.141.16.238','VIRTUAL'),(450,441,'10.141.16.244','VIRTUAL'),(451,442,'10.142.16.244','VIRTUAL'),(452,443,'10.142.16.238','VIRTUAL'),(453,444,'10.142.16.238','VIRTUAL'),(454,445,'10.142.16.238','VIRTUAL'),(455,446,'10.141.16.228','VIRTUAL'),(456,447,'10.141.16.228','VIRTUAL'),(457,448,'10.141.16.228','VIRTUAL');
/*!40000 ALTER TABLE `cm_nodeip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cm_nodeiprelationship`
--

DROP TABLE IF EXISTS `cm_nodeiprelationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cm_nodeiprelationship` (
  `RelationshipID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PublishingNodeIPID` bigint(20) NOT NULL,
  `ConsumingNodeIPID` bigint(20) NOT NULL,
  `StartPort` bigint(20) NOT NULL,
  `EndPort` bigint(20) NOT NULL,
  `Protocol` enum('HTTP','NTP','HTTPS','TBC') NOT NULL,
  PRIMARY KEY (`RelationshipID`),
  KEY `cm_noderelationship_ibfk_1` (`PublishingNodeIPID`),
  KEY `cm_noderelationship_ibfk_2` (`ConsumingNodeIPID`),
  CONSTRAINT `cm_nodeiprelationship_ibfk_1` FOREIGN KEY (`PublishingNodeIPID`) REFERENCES `cm_nodeip` (`NodeIPID`),
  CONSTRAINT `cm_nodeiprelationship_ibfk_2` FOREIGN KEY (`ConsumingNodeIPID`) REFERENCES `cm_nodeip` (`NodeIPID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cm_nodeiprelationship`
--

LOCK TABLES `cm_nodeiprelationship` WRITE;
/*!40000 ALTER TABLE `cm_nodeiprelationship` DISABLE KEYS */;
/*!40000 ALTER TABLE `cm_nodeiprelationship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cm_noderelationship`
--

DROP TABLE IF EXISTS `cm_noderelationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cm_noderelationship` (
  `RelationshipID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PublishingNodeID` bigint(20) NOT NULL,
  `ConsumingNodeID` bigint(20) NOT NULL,
  `StartPort` bigint(20) NOT NULL,
  `EndPort` bigint(20) NOT NULL,
  `Protocol` enum('HTTP','NTP','HTTPS','TBC') NOT NULL,
  PRIMARY KEY (`RelationshipID`),
  KEY `cm_noderelationship_ibfk_1` (`PublishingNodeID`),
  KEY `cm_noderelationship_ibfk_2` (`ConsumingNodeID`),
  CONSTRAINT `cm_noderelationship_ibfk_1` FOREIGN KEY (`PublishingNodeID`) REFERENCES `cm_node` (`NodeID`),
  CONSTRAINT `cm_noderelationship_ibfk_2` FOREIGN KEY (`ConsumingNodeID`) REFERENCES `cm_node` (`NodeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cm_noderelationship`
--

LOCK TABLES `cm_noderelationship` WRITE;
/*!40000 ALTER TABLE `cm_noderelationship` DISABLE KEYS */;
/*!40000 ALTER TABLE `cm_noderelationship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cm_package`
--

DROP TABLE IF EXISTS `cm_package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cm_package` (
  `PackageID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PackageName` varchar(50) NOT NULL,
  `PackageTypeID` bigint(20) DEFAULT NULL,
  `ServerTypeID` bigint(20) DEFAULT NULL,
  `ReleaseID` bigint(20) DEFAULT NULL,
  `PackageVersion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PackageID`),
  UNIQUE KEY `UQ_CM_Package_PackageName` (`PackageName`,`PackageVersion`),
  KEY `IXFK_CM_Package_CM_ServerType` (`ServerTypeID`),
  KEY `IXFK_CM_Package_Releases` (`ReleaseID`),
  KEY `IXFK_CM_Package_CM_PackageType` (`PackageTypeID`),
  CONSTRAINT `cm_package_ibfk_1` FOREIGN KEY (`ReleaseID`) REFERENCES `cm_release` (`ReleaseID`),
  CONSTRAINT `cm_package_ibfk_2` FOREIGN KEY (`PackageTypeID`) REFERENCES `cm_packagetype` (`PackageTypeID`),
  CONSTRAINT `cm_package_ibfk_3` FOREIGN KEY (`ServerTypeID`) REFERENCES `cm_servertype` (`ServerTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cm_package`
--

LOCK TABLES `cm_package` WRITE;
/*!40000 ALTER TABLE `cm_package` DISABLE KEYS */;
INSERT INTO `cm_package` VALUES (1,'TEST PACKAGE 1',1,1,1,NULL),(2,'Bridge - 7.3.4 Package',2,3,1,NULL),(3,'EAS - 7.3.4 Package',2,4,1,NULL),(4,'UIS - 7.3.4 Package',2,14,1,NULL),(5,'Bridge - 7.4.0 Package',2,3,2,NULL),(6,'EAS - 7.4.0 Package',2,4,2,NULL),(7,'UIS - 7.4.0 Package',2,14,2,NULL),(8,'RESIP-InfraRel-x.y.z',4,10,6,NULL),(9,'RESIP-InfraPlat-x.y.z',3,10,6,NULL),(10,'RESIP-AppPlat-x.y.z',1,10,6,NULL),(11,'RESIP-AppRel-x.y.z',2,10,6,NULL),(12,'SmartClient',2,16,8,'2.3.13'),(13,'mpc',2,17,8,'7.4.1'),(14,'training',2,NULL,8,'7.4.1'),(15,'dbms-script',2,NULL,8,'7.4.2'),(16,'chs-uis',2,NULL,8,'7.4.1'),(17,'chs-pms',2,NULL,8,'7.4.1'),(18,'chs-stockplus',2,NULL,8,'7.4.1'),(19,'chs-centralfilling',2,NULL,8,'7.4.1'),(20,'batch-client',4,NULL,8,'1.6.1'),(21,'encryptionutil',4,NULL,8,'1.2'),(22,'jmxquery',4,NULL,8,'1.4-TSF'),(23,'parameter-tool',4,NULL,8,'1.0'),(24,'roler-permission-tool',4,NULL,8,'1.1'),(25,'securitymanagement',4,NULL,8,'1.11.3'),(26,'external framework-application status monitor',4,NULL,8,'1.6.0'),(27,'external framework-symmetricds-ext',3,NULL,8,'1.7'),(28,'external framework-symmetricds',3,NULL,8,'3.7.34'),(29,'external framework-wmq-jmsra',3,NULL,8,'7.0'),(32,'createUpdateActualProductPack',5,12,8,'3.1'),(33,'createUpdateAdverseReaction',5,12,8,'3.2'),(34,'createUpdateExemption',5,12,8,'3.3'),(35,'createUpdateFormulary',5,12,8,'3.0'),(36,'createUpdateGeneralParameter',5,12,8,'3.4'),(37,'createUpdateLabelInstruction',5,12,8,'3.0'),(38,'createUpdateMedicalCondition',5,12,8,'3.0'),(39,'createUpdatePractice',5,12,8,'3.3'),(40,'createUpdatePreferredActualProductPack',5,12,8,'3.2'),(41,'createUpdatePreferredProductSKU',5,12,8,'3.4'),(42,'createUpdatePrescriber',5,12,8,'3.2'),(43,'createUpdatePrescriberType',5,12,8,'3.0'),(44,'createUpdatePrescription',5,12,8,'5.4'),(45,'createUpdatePrescription_FM',5,12,8,'6.1'),(46,'createUpdatePrescriptionFormType',5,12,8,'3.6'),(47,'createUpdatePrescriptionGroup',5,12,8,'3.3'),(48,'createUpdateProduct',5,12,8,'3.3'),(49,'createUpdateProductBarcode',5,12,8,'3.2'),(50,'createUpdateProductFlavour',5,12,8,'3.0'),(51,'createUpdateProductLogistics',5,12,8,'3.1'),(52,'createUpdateProductSKU',5,12,8,'3.4'),(53,'createUpdateSite',5,12,8,'3.5'),(54,'createUpdateStockAvailability',5,12,8,'3.0'),(55,'createUpdateStoreServiceCentreLink',5,12,8,'3.0'),(56,'createUpdateSupplier',5,12,8,'3.0'),(57,'createUpdateTwinningScheme',5,12,8,'0.1'),(58,'executeSQL',5,12,8,'2.3'),(59,'import_IG01',5,12,8,'1.2'),(60,'import_IG02',5,12,8,'1.1'),(61,'import_IG03',5,12,8,'3.3'),(62,'import_IG04',5,12,8,'1.1'),(63,'import_IG06',5,12,8,'1.1'),(64,'import_IG09',5,12,8,'1.1'),(65,'jobrunner',5,12,8,'2.6'),(66,'merge_IG01',5,12,8,'1.3'),(67,'merge_IG02',5,12,8,'1.0'),(68,'merge_IG03',5,12,8,'1.2'),(69,'merge_IG04',5,12,8,'1.2'),(70,'merge_IG06',5,12,8,'1.2'),(71,'merge_IG09',5,12,8,'1.2'),(72,'readprescriptionimsfeed',5,12,8,'1.0'),(73,'readprescriberimsfeed',5,12,8,'1.0');
/*!40000 ALTER TABLE `cm_package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cm_packagetype`
--

DROP TABLE IF EXISTS `cm_packagetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cm_packagetype` (
  `PackageTypeID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PackageTypeName` varchar(50) NOT NULL,
  PRIMARY KEY (`PackageTypeID`),
  UNIQUE KEY `UQ_CM_PackageType_PackageTypeName` (`PackageTypeName`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cm_packagetype`
--

LOCK TABLES `cm_packagetype` WRITE;
/*!40000 ALTER TABLE `cm_packagetype` DISABLE KEYS */;
INSERT INTO `cm_packagetype` VALUES (1,'App Platform Release'),(2,'App Release'),(3,'Infrastructure Platform Release'),(4,'Infrastructure Release'),(5,'Interface');
/*!40000 ALTER TABLE `cm_packagetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cm_release`
--

DROP TABLE IF EXISTS `cm_release`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cm_release` (
  `ReleaseID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ReleaseName` varchar(50) NOT NULL,
  PRIMARY KEY (`ReleaseID`),
  UNIQUE KEY `UQ_Releases_ReleaseName` (`ReleaseName`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cm_release`
--

LOCK TABLES `cm_release` WRITE;
/*!40000 ALTER TABLE `cm_release` DISABLE KEYS */;
INSERT INTO `cm_release` VALUES (3,'7.3.2'),(1,'7.3.4'),(10,'7.3.5.3 (CEMS)'),(11,'7.3.5.4 (CEMS)'),(2,'7.4.0'),(8,'7.4.2'),(9,'7.4.2 BT M (CEMS)'),(12,'7.4.2 M (CEMS)'),(13,'7.4.3'),(6,'Training-x.y.z'),(7,'UNKNOWN');
/*!40000 ALTER TABLE `cm_release` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cm_releaseconfig`
--

DROP TABLE IF EXISTS `cm_releaseconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cm_releaseconfig` (
  `RelConfigID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ReleaseID` bigint(20) NOT NULL,
  `RelConfigParameter` varchar(255) DEFAULT NULL,
  `RelConfigValue` varchar(255) DEFAULT NULL,
  `RelConfigHieraAddress` varchar(255) DEFAULT NULL,
  `RecursiveByEnv` bit(1) NOT NULL DEFAULT b'0',
  `RecursiveBySubEnv` bit(1) NOT NULL DEFAULT b'0',
  `ReleaseConfigNotes` varchar(255) DEFAULT NULL,
  `ReleaseConfigIsSensitive` bit(1) DEFAULT b'0',
  PRIMARY KEY (`RelConfigID`),
  KEY `IXFK_ReleaseConfig_Release` (`ReleaseID`),
  CONSTRAINT `cm_releaseconfig_ibfk_1` FOREIGN KEY (`ReleaseID`) REFERENCES `cm_release` (`ReleaseID`)
) ENGINE=InnoDB AUTO_INCREMENT=357 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cm_releaseconfig`
--

LOCK TABLES `cm_releaseconfig` WRITE;
/*!40000 ALTER TABLE `cm_releaseconfig` DISABLE KEYS */;
INSERT INTO `cm_releaseconfig` VALUES (25,3,'createUpdateActualProductPack','3.1-1','ROOT:talend_interfaces_{Release}:tsfn:{ParamName}:','\0','\0',NULL,'\0'),(27,3,'createUpdateAdverseReaction','3.2-1','ROOT:talend_interfaces_{Release}:tsfn:{ParamName}:','\0','\0',NULL,'\0'),(28,3,'createUpdateExemption','3.2-1','ROOT:talend_interfaces_{Release}:tsfn:{ParamName}:','\0','\0',NULL,'\0'),(29,3,'createUpdateFormulary','3.0-1','ROOT:talend_interfaces_{Release}:tsfn:{ParamName}:','\0','\0',NULL,'\0'),(30,3,'createUpdateGeneralParameter','3.4-1','ROOT:talend_interfaces_{Release}:tsfn:{ParamName}:','\0','\0',NULL,'\0'),(31,3,'createUpdateLabelInstruction','3.0-1','ROOT:talend_interfaces_{Release}:tsfn:{ParamName}:','\0','\0',NULL,'\0'),(32,3,'createUpdateMedicalCondition','3.0-1','ROOT:talend_interfaces_{Release}:tsfn:{ParamName}:','\0','\0',NULL,'\0'),(33,3,'createUpdatePractice','3.3-1','ROOT:talend_interfaces_{Release}:tsfn:{ParamName}:','\0','\0',NULL,'\0'),(34,3,'createUpdatePreferredActualProductPack','3.2-1','ROOT:talend_interfaces_{Release}:tsfn:{ParamName}:','\0','\0',NULL,'\0'),(35,3,'createUpdatePreferredProductSKU','3.4-1','ROOT:talend_interfaces_{Release}:tsfn:{ParamName}:','\0','\0',NULL,'\0'),(36,3,'createUpdatePrescriber','3.2-1','ROOT:talend_interfaces_{Release}:tsfn:{ParamName}:','\0','\0',NULL,'\0'),(37,3,'createUpdatePrescriberType','3.0-1','ROOT:talend_interfaces_{Release}:tsfn:{ParamName}:','\0','\0',NULL,'\0'),(38,3,'createUpdatePrescription','5.2-1','ROOT:talend_interfaces_{Release}:tsfn:{ParamName}:','\0','\0',NULL,'\0'),(39,3,'createUpdatePrescription_FM','5.7-1','ROOT:talend_interfaces_{Release}:tsfn:{ParamName}:','\0','\0',NULL,'\0'),(40,3,'createUpdatePrescriptionFormType','3.5-1','ROOT:talend_interfaces_{Release}:tsfn:{ParamName}:','\0','\0',NULL,'\0'),(41,3,'createUpdatePrescriptionGroup','3.3-1','ROOT:talend_interfaces_{Release}:tsfn:{ParamName}:','\0','\0',NULL,'\0'),(42,3,'createUpdateProduct','3.3-1','ROOT:talend_interfaces_{Release}:tsfn:{ParamName}:','\0','\0',NULL,'\0'),(43,3,'createUpdateProductBarcode','3.2-1','ROOT:talend_interfaces_{Release}:tsfn:{ParamName}:','\0','\0',NULL,'\0'),(44,3,'createUpdateProductFlavour','3.0-1','ROOT:talend_interfaces_{Release}:tsfn:{ParamName}:','\0','\0',NULL,'\0'),(45,3,'createUpdateProductLogistics','3.1-1','ROOT:talend_interfaces_{Release}:tsfn:{ParamName}:','\0','\0',NULL,'\0'),(46,3,'createUpdateProductSKU','3.4-1','ROOT:talend_interfaces_{Release}:tsfn:{ParamName}:','\0','\0',NULL,'\0'),(47,3,'createUpdateRole','2.3-1','ROOT:talend_interfaces_{Release}:tsfn:{ParamName}:','\0','\0',NULL,'\0'),(48,3,'createUpdateSite','3.5-1','ROOT:talend_interfaces_{Release}:tsfn:{ParamName}:','\0','\0',NULL,'\0'),(49,3,'createUpdateStockAvailability','3.0-1','ROOT:talend_interfaces_{Release}:tsfn:{ParamName}:','\0','\0',NULL,'\0'),(50,3,'createUpdateStoreServiceCentreLink','3.0-1','ROOT:talend_interfaces_{Release}:tsfn:{ParamName}:','\0','\0',NULL,'\0'),(51,3,'createUpdateSupplier','3.0-1','ROOT:talend_interfaces_{Release}:tsfn:{ParamName}:','\0','\0',NULL,'\0'),(52,3,'createUpdateTwinningScheme','0.1-1','ROOT:talend_interfaces_{Release}:tsfn:{ParamName}:','\0','\0',NULL,'\0'),(53,3,'executeSQL','2.3-1','ROOT:talend_interfaces_{Release}:tsfn:{ParamName}:','\0','\0',NULL,'\0'),(54,3,'import_IG01','1.2-1','ROOT:talend_interfaces_{Release}:tsfn:{ParamName}:','\0','\0',NULL,'\0'),(55,3,'import_IG02','1.1-1','ROOT:talend_interfaces_{Release}:tsfn:{ParamName}:','\0','\0',NULL,'\0'),(56,3,'import_IG03','3.3-1','ROOT:talend_interfaces_{Release}:tsfn:{ParamName}:','\0','\0',NULL,'\0'),(57,3,'import_IG04','1.1-1','ROOT:talend_interfaces_{Release}:tsfn:{ParamName}:','\0','\0',NULL,'\0'),(58,3,'import_IG06','1.1-1','ROOT:talend_interfaces_{Release}:tsfn:{ParamName}:','\0','\0',NULL,'\0'),(59,3,'import_IG09','1.1-1','ROOT:talend_interfaces_{Release}:tsfn:{ParamName}:','\0','\0',NULL,'\0'),(60,3,'jobrunner','2.6-1','ROOT:talend_interfaces_{Release}:tsfn:{ParamName}:','\0','\0',NULL,'\0'),(61,3,'merge_IG01','1.3-1','ROOT:talend_interfaces_{Release}:tsfn:{ParamName}:','\0','\0',NULL,'\0'),(62,3,'merge_IG02','1.0-1','ROOT:talend_interfaces_{Release}:tsfn:{ParamName}:','\0','\0',NULL,'\0'),(63,3,'merge_IG03','1.2-1','ROOT:talend_interfaces_{Release}:tsfn:{ParamName}:','\0','\0',NULL,'\0'),(64,3,'merge_IG04','1.2-1','ROOT:talend_interfaces_{Release}:tsfn:{ParamName}:','\0','\0',NULL,'\0'),(65,3,'merge_IG06','1.2-1','ROOT:talend_interfaces_{Release}:tsfn:{ParamName}:','\0','\0',NULL,'\0'),(66,3,'merge_IG09','1.2-1','ROOT:talend_interfaces_{Release}:tsfn:{ParamName}:','\0','\0',NULL,'\0'),(67,3,'tsfn-encryptionutil','1.2-1','ROOT:talend_interfaces_{Release}:tsfn:{ParamName}:','\0','\0',NULL,'\0'),(68,3,'OptimusMigration','1.88-1','ROOT:talend_interfaces_{Release}:tsfn:{ParamName}:','\0','\0',NULL,'\0'),(69,3,'StockPlus_Migration','4.25-1','ROOT:talend_interfaces_{Release}:tsfn:{ParamName}:','\0','\0',NULL,'\0'),(70,3,'StockPlusFM_Migration','6.0-1','ROOT:talend_interfaces_{Release}:tsfn:{ParamName}:','\0','\0',NULL,'\0'),(71,3,'StockPlusFM_Migration_Maps','6.0-1','ROOT:talend_interfaces_{Release}:tsfn:{ParamName}:','\0','\0',NULL,'\0'),(72,3,'IF033_01_general_practice:','0.1-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(73,3,'IF033_02_general_practice_relationship:','0.2-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(74,3,'IF033_03_general_dental_practitioners:','0.2-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(75,3,'IF033_04_general_dental_practices:','0.2-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(76,3,'IF033_05_general_dental_practitioners_relationships:','0.2-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(77,3,'IF033_x_01_01_Monitor:','0.1-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(78,3,'IF033_x_01_02_Download:','0.1-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(79,3,'IF033_x_01_03_Extract:','0.1-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(80,3,'IF033_x_01_04_Validate:','0.1-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(81,3,'IF061_00_01_Download:','0.1-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(82,3,'IF061_00_02_Extract:','0.1-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(83,3,'IF061_01_01_DMDPhysDrugs:','0.1-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(84,3,'IF061_02_01_DMDVirtDrugs:','0.1-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(85,3,'IF061_03_01_MAPDMDToPhysDrugs:','0.1-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(86,3,'IF061_04_01_MAPDMDToVirtDrugs:','0.1-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(87,3,'IF061_05_01_MASPhysDrugs:','0.1-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(88,3,'IF061_06_01_MASUnitOfMeasure:','0.1-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(89,3,'IF061_07_01_MASUnits:','0.1-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(90,3,'IF061_08_01_MASVirtDrugs:','0.1-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(91,3,'IF061_09_01_MASPresDispList:','0.1-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(92,3,'IF101_01_01_MR_adverse_reaction:','2.0-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(93,3,'IF101_01_02_MR_adverse_reaction:','2.0-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(94,3,'IF101_02_01_MR_exemption:','2.2-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(95,3,'IF101_02_02_MR_exemption:','2.3-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(96,3,'IF101_03_01_MR_flavour:','2.0-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(97,3,'IF101_03_02_MR_flavour:','2.0-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(98,3,'IF101_04_01_MR_formulary:','2.0-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(99,3,'IF101_04_02_MR_formulary:','2.0-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(100,3,'IF101_05_01_MR_medicalCondition:','2.0-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(101,3,'IF101_05_02_MR_medicalCondition:','2.0-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(102,3,'IF101_06_01_MR_prescriberType:','2.0-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(103,3,'IF101_06_02_MR_prescriberType:','2.0-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(104,3,'IF101_07_01_MR_prescriptionFormType:','2.1-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(105,3,'IF101_07_02_MR_prescriptionFormType:','2.1-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(106,3,'IF101_08_01_MR_prescriptionService:','2.0-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(107,3,'IF101_09_01_MR_productClass:','2.0-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(108,3,'IF101_10_01_MR_region:','2.0-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(109,3,'IF101_11_01_MR_supplier:','2.0-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(110,3,'IF101_11_02_MR_supplier:','2.0-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(111,3,'IF101_12_01_MR_unitOfMeasure:','2.1-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(112,3,'IF101_12_02_MR_unitOfMeasure:','2.1-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(113,3,'IF101_13_01_MR_role:','0.1-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(114,3,'IF101_13_02_MR_role:','0.1-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(115,3,'IF101_14_01_MR_general:','2.0-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(116,3,'IF101_14_02_MR_general:','2.0-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(117,3,'IF101_20_01_MR_prescriberTypeToFormType:','2.0-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(118,3,'IF101_21_01_MR_levyRegionFee:','2.0-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(119,3,'IF101_21_02_MR_levyRegionFee:','2.0-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(120,3,'IF101_22_01_MR_formulation:','2.0-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(121,3,'IF101_22_02_MR_formulation:','2.0-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(122,3,'IF101_23_01_MR_EpsResponseMessage:','0.1-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(123,3,'IF101_23_02_MR_EpsResponseMessage:','0.1-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(124,3,'IF102_01_01_MR_prescriber:','2.0-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(125,3,'IF102_01_02_MR_prescriber:','2.0-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(126,3,'IF102_02_01_MR_practice:','2.0-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(127,3,'IF102_02_02_MR_practice:','2.0-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(128,3,'IF102_03_01_MR_prescriber_practice:','2.0-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(129,3,'IF103_01_01_MR_PrescribableProduct:','2.0-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(130,3,'IF103_01_02_MR_PrescribableProduct:','2.0-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(131,3,'IF103_02_01_MR_FormularyToPP:','2.0-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(132,3,'IF103_03_01_MR_PptoLIText:','2.0-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(133,3,'IF103_04_01_MR_DispensingSKU:','2.0-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(134,3,'IF103_04_02_MR_DispensingSKU:','2.0-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(135,3,'IF103_05_01_MR_PptoDSKU:','2.0-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(136,3,'IF103_06_01_MR_RegionalDSKU:','2.0-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(137,3,'IF103_07_01_MR_DispensingProductPack:','2.0-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(138,3,'IF103_07_02_MR_DispensingProductPack:','2.0-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(139,3,'IF103_08_01_MR_RegionalDPP:','2.0-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(140,3,'IF103_09_01_MR_LabelInstructionText:','2.0-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(141,3,'IF103_09_02_MR_LabelInstructionText:','2.0-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(142,3,'IF103_10_01_MR_PPPrices:','2.0-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(143,3,'IF105_01_01_MR_PreferredDSKU:','2.0-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(144,3,'IF105_01_02_MR_PreferredDSKU:','2.0-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(145,3,'IF105_02_01_MR_PreferredActualProductPack:','2.0-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(146,3,'IF105_02_02_MR_PreferredActualProductPack:','2.0-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(147,3,'IF108_01_01_MR_store:','2.2-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(148,3,'IF108_01_02_MR_store:','2.3-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(149,3,'IF108_02_02_MR_storeServiceLink:','2.0-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(150,3,'IF110_01_01_product:','0.3-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(151,3,'IF110_01_02_product:','0.3-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(152,3,'IF172_01_01_stockEnquiry:','0.8-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(153,3,'IF172_01_02_stockAvailability:','0.2-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(154,3,'IF172_02_02_twinningScheme:','0.2-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(155,3,'IF175_01_01_stockTake:','0.1-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(156,3,'IF175_01_02_stockTake:','0.1-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(157,3,'IF176_01_01_stockFile:','0.2-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(158,3,'IF176_01_02_stockFile:','0.1-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(159,3,'IF179_01_01_barcode:','0.1-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(160,3,'IF179_01_02_barcode:','0.1-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(161,3,'IF33_01_02:','0.1-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(162,3,'tsfz-encryptionutil:','0.1-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(163,3,'tsfz-xsd:','0.8-1','ROOT:talend_interfaces_{Release}:tsfz:{ParamName}:','\0','\0',NULL,'\0'),(164,3,'PCE_AutomatReceiver_main:','0.6-1','ROOT:talend_interfaces_{Release}:pce:{ParamName}:','\0','\0',NULL,'\0'),(165,3,'PCE_AutomatTransmitter_main:','0.2-1','ROOT:talend_interfaces_{Release}:pce:{ParamName}:','\0','\0',NULL,'\0'),(166,3,'PCE_CPAS_SFTP_Sender:','0.4-1','ROOT:talend_interfaces_{Release}:pce:{ParamName}:','\0','\0',NULL,'\0'),(167,3,'PCE_DS_IF130_FinanceFeed:','0.4-1','ROOT:talend_interfaces_{Release}:pce:{ParamName}:','\0','\0',NULL,'\0'),(168,3,'PCE_DS_IF137_Audit:','0.2-1','ROOT:talend_interfaces_{Release}:pce:{ParamName}:','\0','\0',NULL,'\0'),(169,3,'PCE_DS_IF138_IMS_DTP:','0.6-1','ROOT:talend_interfaces_{Release}:pce:{ParamName}:','\0','\0',NULL,'\0'),(170,3,'PCE_DS_IF138_Mftr_Audit:','0.1-1','ROOT:talend_interfaces_{Release}:pce:{ParamName}:','\0','\0',NULL,'\0'),(171,3,'PCE_DS_IF90_DeliveryRequest:','0.5-1','ROOT:talend_interfaces_{Release}:pce:{ParamName}:','\0','\0',NULL,'\0'),(172,3,'PCE_IF108_Loader:','0.2-1','ROOT:talend_interfaces_{Release}:pce:{ParamName}:','\0','\0',NULL,'\0'),(173,3,'PCE_IF134_Loader:','0.1-1','ROOT:talend_interfaces_{Release}:pce:{ParamName}:','\0','\0',NULL,'\0'),(174,3,'PCE_IF59_MQ_Reader_from_PMS:','0.1-1','ROOT:talend_interfaces_{Release}:pce:{ParamName}:','\0','\0',NULL,'\0'),(175,3,'PCE_Merge:','0.4-1','ROOT:talend_interfaces_{Release}:pce:{ParamName}:','\0','\0',NULL,'\0'),(176,3,'PCE_MonitorAudit:','0.2-1','ROOT:talend_interfaces_{Release}:pce:{ParamName}:','\0','\0',NULL,'\0'),(177,3,'PCE_OutputSplit:','0.5-1','ROOT:talend_interfaces_{Release}:pce:{ParamName}:','\0','\0',NULL,'\0'),(178,3,'PCE_toAutomat_Masterdata_IF134:','0.2-1','ROOT:talend_interfaces_{Release}:pce:{ParamName}:','\0','\0',NULL,'\0'),(179,3,'PCE_toAutomat_Picking:','0.3-1','ROOT:talend_interfaces_{Release}:pce:{ParamName}:','\0','\0',NULL,'\0'),(180,3,'PCE_Util_STOP_All_Runtime_Jobs:','0.1-1','ROOT:talend_interfaces_{Release}:pce:{ParamName}:','\0','\0',NULL,'\0'),(181,3,'PCE_InputSplit:','0.7-1','ROOT:talend_interfaces_{Release}:pce:{ParamName}:','\0','\0',NULL,'\0'),(182,3,'tsfz-encryptionutil:','0.1-1','ROOT:talend_interfaces_{Release}:pce:{ParamName}:','\0','\0',NULL,'\0'),(183,3,'pce-parameters-files:','0.1-1','ROOT:talend_interfaces_{Release}:pce:{ParamName}:','\0','\0',NULL,'\0'),(184,3,'brg','7.3.2-1','ROOT:oneleo_release_map:columbus:uk-boots:rpm_{Release}:{ParamName}:','\0','\0',NULL,'\0'),(185,3,'eas','7.3.2-1','ROOT:oneleo_release_map:columbus:uk-boots:rpm_{Release}:{ParamName}:','\0','\0',NULL,'\0'),(186,3,'uis','7.3.2-1','ROOT:oneleo_release_map:columbus:uk-boots:rpm_{Release}:{ParamName}:','\0','\0',NULL,'\0'),(187,3,'trainingversion','7.3.2-1','ROOT:oneleo_release_map:columbus:uk-boots:rpm_{Release}:{ParamName}:','\0','\0',NULL,'\0'),(188,3,'wmqjmsraversion','7.0-1','ROOT:oneleo_release_map:columbus:uk-boots:rpm_{Release}:{ParamName}:','\0','\0',NULL,'\0'),(189,3,'ehcache','1.0','ROOT:oneleo_release_map:columbus:uk-boots:rpm_{Release}:{ParamName}:','\0','\0',NULL,'\0'),(190,3,'bouncycastle','1.5','ROOT:oneleo_release_map:columbus:uk-boots:rpm_{Release}:{ParamName}:','\0','\0',NULL,'\0'),(191,3,'symds_version','3.7.34-1','ROOT:oneleo_release_map:columbus:uk-boots:rpm_{Release}:{ParamName}:','\0','\0',NULL,'\0'),(192,3,'symds_ext_version','1.6-1','ROOT:oneleo_release_map:columbus:uk-boots:rpm_{Release}:{ParamName}:','\0','\0',NULL,'\0'),(193,3,'acl_api_version','3.20.0-1','ROOT:oneleo_release_map:columbus:uk-boots:rpm_{Release}:{ParamName}:','\0','\0',NULL,'\0'),(194,3,'asmversion','1.6.0-1','ROOT:oneleo_release_map:columbus:uk-boots:rpm_{Release}:{ParamName}:','\0','\0',NULL,'\0'),(195,3,'eclipsepersistenceversion','2.4.2-1','ROOT:oneleo_release_map:columbus:uk-boots:rpm_{Release}:{ParamName}:','\0','\0',NULL,'\0'),(196,3,'aclloggingversion','3.14-1','ROOT:oneleo_release_map:columbus:uk-boots:rpm_{Release}:{ParamName}:','\0','\0',NULL,'\0'),(197,3,'jmxqueryversion','1.4-1','ROOT:oneleo_release_map:columbus:uk-boots:rpm_{Release}:{ParamName}:','\0','\0',NULL,'\0'),(198,3,'batchclientversion','1.6.1-1','ROOT:oneleo_release_map:columbus:uk-boots:rpm_{Release}:{ParamName}:','\0','\0',NULL,'\0'),(199,3,'oracle','1.0','ROOT:oneleo_release_map:columbus:uk-boots:rpm_{Release}:{ParamName}:','\0','\0',NULL,'\0'),(200,3,'oracle_secure','1.0','ROOT:oneleo_release_map:columbus:uk-boots:rpm_{Release}:{ParamName}:','\0','\0',NULL,'\0'),(201,8,'brg','\'7.4.1\'','ROOT:oneleo_release_map:columbus:uk-boots:rpm_{Release}:{ParamName}:','\0','\0',NULL,'\0'),(202,8,'eas','\'7.4.1\'','ROOT:oneleo_release_map:columbus:uk-boots:rpm_{Release}:{ParamName}:','\0','\0',NULL,'\0'),(203,8,'uis','\'7.4.1\'','ROOT:oneleo_release_map:columbus:uk-boots:rpm_{Release}:{ParamName}:','\0','\0',NULL,'\0'),(204,8,'trainingversion','\'7.4.1\'','ROOT:oneleo_release_map:columbus:uk-boots:rpm_{Release}:{ParamName}:','\0','\0',NULL,'\0'),(205,8,'pms_version','\'7.4.1\'','ROOT:oneleo_release_map:columbus:uk-boots:rpm_{Release}:{ParamName}:','\0','\0',NULL,'\0'),(206,8,'stockplus_version','\'7.4.1\'','ROOT:oneleo_release_map:columbus:uk-boots:rpm_{Release}:{ParamName}:','\0','\0',NULL,'\0'),(207,8,'centralfilling_version','\'7.4.1\'','ROOT:oneleo_release_map:columbus:uk-boots:rpm_{Release}:{ParamName}:','\0','\0',NULL,'\0'),(208,8,'wmqjmsraversion','\'7.0\'','ROOT:oneleo_release_map:columbus:uk-boots:rpm_{Release}:{ParamName}:','\0','\0',NULL,'\0'),(209,8,'asmversion','\'1.6.0\'','ROOT:oneleo_release_map:columbus:uk-boots:rpm_{Release}:{ParamName}:','\0','\0',NULL,'\0'),(210,8,'eclipsepersistenceversion','\'2.4.2\'','ROOT:oneleo_release_map:columbus:uk-boots:rpm_{Release}:{ParamName}:','\0','\0',NULL,'\0'),(211,8,'aclloggingversion','\'3.14\'','ROOT:oneleo_release_map:columbus:uk-boots:rpm_{Release}:{ParamName}:','\0','\0',NULL,'\0'),(212,8,'jmxqueryversion','\'1.4\'','ROOT:oneleo_release_map:columbus:uk-boots:rpm_{Release}:{ParamName}:','\0','\0',NULL,'\0'),(213,8,'batchclientversion','\'1.6.1\'','ROOT:oneleo_release_map:columbus:uk-boots:rpm_{Release}:{ParamName}:','\0','\0',NULL,'\0'),(217,8,'deploy_version','{Release}','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0',NULL,'\0'),(218,8,'columbus_db_version','{Release}','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0',NULL,'\0'),(219,8,'uis_deployments','columbus-desktop-7.4.1.ear','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0',NULL,'\0'),(220,8,'eas_deployments','columbus-pms-7.4.1.ear,columbus-stockplus-7.4.1.ear,columbus-centralfilling-7.4.1.ear','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0',NULL,'\0'),(221,8,'brg_deployments','columbus-pms-7.4.1.ear,columbus-stockplus-7.4.1.ear,columbus-centralfilling-7.4.1.ear','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0',NULL,'\0'),(222,8,'brg_datasources','java:jboss/datasources/columbus-ds-pms,java:jboss/datasources/columbus-ds-stockplus,java:jboss/datasources/columbus-ds-centralfilling','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0',NULL,'\0'),(223,8,'eas_datasources','java:jboss/datasources/columbus-ds-pms,java:jboss/datasources/columbus-ds-stockplus,java:jboss/datasources/columbus-ds-centralfilling','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0',NULL,'\0'),(224,8,'pms_url','http://localhost:${jboss.http.port}','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0',NULL,'\0'),(225,8,'stockplus_url','http://localhost:${jboss.http.port}','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0',NULL,'\0'),(226,8,'centfill_url','http://localhost:${jboss.http.port}','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0',NULL,'\0'),(227,8,'uis_init_heap_mem','5G','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0',NULL,'\0'),(228,8,'eas_init_heap_mem','6G','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0',NULL,'\0'),(229,8,'brg_init_heap_mem: ','6G','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0',NULL,'\0'),(230,8,'uis_max_heap_mem','5G','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0',NULL,'\0'),(231,8,'eas_max_heap_mem','6G','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0',NULL,'\0'),(232,8,'brg_max_heap_mem','6G','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0',NULL,'\0'),(233,8,'uis_max_perm_size','512m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0',NULL,'\0'),(234,8,'eas_max_perm_size','512m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0',NULL,'\0'),(235,8,'brg_ max_perm_size','512m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0',NULL,'\0'),(236,8,'modularization','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0',NULL,'\0'),(237,8,'uis_user','uisUser','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0',NULL,'\0'),(238,8,'uis_system_name','uisUser','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0',NULL,'\0'),(239,8,'eas_system_name','batchUserEAS','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0',NULL,'\0'),(240,8,'brg_system_name','batchUserBRG','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0',NULL,'\0'),(241,8,'db_name','PMSSNR11','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'EAS_DB\':{ParamName}:','','\0',NULL,'\0'),(242,8,'db_port','1521','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'EAS_DB\':{ParamName}:','','\0',NULL,'\0'),(243,8,'db_server','sfnpmsdbsr11.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'EAS_DB\':{ParamName}:','','\0',NULL,'\0'),(244,8,'db_user','COLUMBUS','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'EAS_DB\':{ParamName}:','','\0',NULL,'\0'),(245,8,'db_pass','columbus','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'EAS_DB\':{ParamName}:','','\0',NULL,'\0'),(246,8,'db_name','PMSSNR11','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'EAS_DB_STG\':{ParamName}:','','\0',NULL,'\0'),(247,8,'db_port','1521','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'EAS_DB_STG\':{ParamName}:','','\0',NULL,'\0'),(248,8,'db_server','sfnpmsdbsr11.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'EAS_DB_STG\':{ParamName}:','','\0',NULL,'\0'),(249,8,'db_user','COLUMBUS_STAGING','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'EAS_DB_STG\':{ParamName}:','','\0',NULL,'\0'),(250,8,'db_pass','columbus_staging','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'EAS_DB_STG\':{ParamName}:','','\0',NULL,'\0'),(251,13,'brg','7.4.2','ROOT:oneleo_release_map:columbus:uk-boots:{Release}:{ParamName}:','\0','\0','','\0'),(252,13,'eas','7.4.2','ROOT:oneleo_release_map:columbus:uk-boots:{Release}:{ParamName}:','\0','\0','','\0'),(253,13,'uis','7.4.2','ROOT:oneleo_release_map:columbus:uk-boots:{Release}:{ParamName}:','\0','\0','','\0'),(254,13,'trainingversion','7.4.2','ROOT:oneleo_release_map:columbus:uk-boots:{Release}:{ParamName}:','\0','\0','','\0'),(255,13,'pms_version','7.4.2','ROOT:oneleo_release_map:columbus:uk-boots:{Release}:{ParamName}:','\0','\0','','\0'),(256,13,'stockplus_version','7.4.2','ROOT:oneleo_release_map:columbus:uk-boots:{Release}:{ParamName}:','\0','\0','','\0'),(257,13,'centralfilling_version','7.4.2','ROOT:oneleo_release_map:columbus:uk-boots:{Release}:{ParamName}:','\0','\0','','\0'),(258,13,'wmqjmsraversion','7.0','ROOT:oneleo_release_map:columbus:uk-boots:{Release}:{ParamName}:','\0','\0','','\0'),(259,13,'asmversion','1.6.0','ROOT:oneleo_release_map:columbus:uk-boots:{Release}:{ParamName}:','\0','\0','','\0'),(260,13,'eclipsepersistenceversion','2.4.2','ROOT:oneleo_release_map:columbus:uk-boots:{Release}:{ParamName}:','\0','\0','','\0'),(261,13,'aclloggingversion','3.14','ROOT:oneleo_release_map:columbus:uk-boots:{Release}:{ParamName}:','\0','\0','','\0'),(262,13,'jmxqueryversion','1.4','ROOT:oneleo_release_map:columbus:uk-boots:{Release}:{ParamName}:','\0','\0','','\0'),(263,13,'batchclientversion','1.6.1','ROOT:oneleo_release_map:columbus:uk-boots:{Release}:{ParamName}:','\0','\0','','\0'),(264,13,'deploy_version','7.4.3','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(265,13,'columbus_db_version','7.4.3','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(266,13,'uis_deployments','columbus-desktop-7.4.2.ear','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(267,13,'eas_deployments','columbus-pms-7.4.2.ear,columbus-stockplus-7.4.2.ear,columbus-centralfilling-7.4.2.ear','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(268,13,'brg_deployments','columbus-pms-7.4.2.ear,columbus-stockplus-7.4.2.ear,columbus-centralfilling-7.4.2.ear','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(269,13,'brg_datasources','java:jboss/datasources/columbus-ds-pms,java:jboss/datasources/columbus-ds-stockplus,java:jboss/datasources/columbus-ds-centralfilling','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(270,13,'eas_datasources','java:jboss/datasources/columbus-ds-pms,java:jboss/datasources/columbus-ds-stockplus,java:jboss/datasources/columbus-ds-centralfilling','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(271,13,'pms_url','http://localhost:${jboss.http.port}','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(272,13,'stockplus_url','http://localhost:${jboss.http.port}','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(273,13,'centfill_url','http://localhost:${jboss.http.port}','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(274,13,'uis_init_heap_mem','5G','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(275,13,'eas_init_heap_mem','6G','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(276,13,'brg_init_heap_mem','7G','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(277,13,'uis_max_heap_mem','5G','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(278,13,'eas_max_heap_mem','6G','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(279,13,'brg_max_heap_mem','7G','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(280,13,'uis_max_perm_size','512m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(281,13,'eas_max_perm_size','512m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(282,13,'brg_max_perm_size','512m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(283,13,'brg_newratio','3','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(284,13,'modularization','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(285,13,'uis_system_name','uisUser','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(286,13,'eas_system_name','batchUserEAS','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(287,13,'brg_system_name','batchUserBRG','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(288,13,'env_roles_internal_jobs_enable','brg','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(289,13,'boots_patient_key_hash','xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(290,13,'IG32_secret_key','xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(291,13,'ig32_ek4dk','xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(292,13,'training_enable','false','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(293,13,'asm_enable','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(294,13,'centralized_logging_enabled','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(295,13,'wmq_enable','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(296,13,'jmxquery_enable','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(297,13,'job_clustering_enable','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(298,13,'log_level','INFO','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(299,13,'eas_db_server','{ServerName|PMS Oracle Database}','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(300,13,'eas_db_port','1521','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(301,13,'eas_db_name','PMST1','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(302,13,'eas_db_user','PMS{ENVID}','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(303,13,'eas_db_pass','XXXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(304,13,'deployment_timeout','6000','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(305,13,'jboss_management_native_port','9999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(306,13,'eas_db_staging_user','PMS{ENVID}_STG','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(307,13,'eas_db_staging_pass','XXXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(311,13,'env','{OverrideMe}','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(312,13,'gclog_num_files','10','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(313,13,'gclog_file_size','100m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(314,13,'preview_due_now_orders_page_limit','120','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(315,13,'columbus_env_id','{OverrideMe}','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(316,13,'endorsement_licence','{OverrideMe}','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(317,13,'durcheck_licence','{OverrideMe}','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(318,13,'clinicalcheck_licence','{OverrideMe}','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(319,13,'emar_notifyPatientCommunity_url','{OverrideMe}','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(320,13,'emar_notifyPatient_url','{OverrideMe}','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(321,13,'reimbursement_getendorsement_url','{OverrideMe}','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(322,13,'marchart_notifyMarChart_url','{OverrideMe}','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(323,13,'osucontainer_concurrency','1-1','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(324,13,'asncontainer_concurrency','1-1','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(325,13,'batch_sys_credential_file','SysCredential_generatedByEAS.properties','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(326,13,'batch_security_file','{jboss.server.config.dir}/EK4DK','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(327,13,'batch_user','batchJobUser1','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(328,13,'jobclustering_num_partition','2','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(329,13,'jboss_enable_monitoring','false','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(330,13,'tote_order_line_ref_min_value','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(331,13,'tote_order_line_ref_max_value','999999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(332,13,'tote_ref_min_value','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(333,13,'tote_ref_max_value','999999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(334,13,'use_tote_prefix','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(335,13,'tote_prefix','TOTE','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(336,13,'clinicalcheck_getdur_url','{OverrideMe}','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(337,13,'clinicalcheck_getdrug_url','{OverrideMe}','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(338,13,'vip_eas_server','{OverrideMe}','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(339,13,'vip_eas_port','{OverrideMe}','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(340,13,'eas_server','{ServerName|EAS}','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(341,13,'eas_port','{OverrideMe}','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(342,13,'uis_sys_credential_file','${jboss.server.data.dir}/SysCredential.properties','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(343,13,'uis_security_file','${jboss.server.data.dir}/EK4DK','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(344,13,'uis_user','uisUser','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(345,13,'CPAS_modulus','{OverrideMe}','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(346,13,'CPAS_exponent','{OverrideMe}','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(347,13,'uis_asm_enabled_check_list','availabilityChecker,deployChecker','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(348,13,'eas_asm_enabled_check_list','availabilityChecker,deployChecker,datasourceChecker','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(349,13,'brg_asm_enabled_check_list','availabilityChecker,deployChecker,datasourceChecker','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(350,13,'jboss_host','localhost','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(351,13,'jboss_management_http_port','9990','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(352,13,'asm_jboss_management_user','admin','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(353,13,'asm_jboss_management_user_psw','{OverrideMe}','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(354,13,'brg_spring_profile','outbound_api_channel,outbound_api_adapter,inbound_api_channel,inbound_api_adapter,import_batch,export_batch,internal_job_batch,external_job_batch,sym_chs','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(355,13,'eas_spring_profile','outbound_api_channel,outbound_api_adapter,offline','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0'),(356,13,'uis_spring_profile','training','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','','\0','','\0');
/*!40000 ALTER TABLE `cm_releaseconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cm_releasedata`
--

DROP TABLE IF EXISTS `cm_releasedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cm_releasedata` (
  `ReleaseID` bigint(20) DEFAULT NULL,
  `DataTypeID` bigint(20) DEFAULT NULL,
  `ReleaseParam` varchar(50) DEFAULT NULL,
  `ReleaseValue` varchar(50) DEFAULT NULL,
  `ReleaseDataID` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ReleaseDataID`),
  KEY `IXFK_CM_ReleaseData_CM_ReleaseDataType` (`DataTypeID`),
  KEY `IXFK_CM_ReleaseData_CM_Releases` (`ReleaseID`),
  CONSTRAINT `cm_releasedata_ibfk_1` FOREIGN KEY (`ReleaseID`) REFERENCES `cm_release` (`ReleaseID`),
  CONSTRAINT `cm_releasedata_ibfk_2` FOREIGN KEY (`DataTypeID`) REFERENCES `cm_releasedatatype` (`DataTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cm_releasedata`
--

LOCK TABLES `cm_releasedata` WRITE;
/*!40000 ALTER TABLE `cm_releasedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `cm_releasedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cm_releasedatatype`
--

DROP TABLE IF EXISTS `cm_releasedatatype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cm_releasedatatype` (
  `DataTypeID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DataTypeName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`DataTypeID`),
  UNIQUE KEY `UQ_CM_ReleaseDataType_DataTypeName` (`DataTypeName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cm_releasedatatype`
--

LOCK TABLES `cm_releasedatatype` WRITE;
/*!40000 ALTER TABLE `cm_releasedatatype` DISABLE KEYS */;
/*!40000 ALTER TABLE `cm_releasedatatype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cm_server`
--

DROP TABLE IF EXISTS `cm_server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cm_server` (
  `ServerID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ServerName` varchar(50) NOT NULL,
  `ServerTypeID` bigint(20) DEFAULT NULL,
  `NodeID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ServerID`),
  UNIQUE KEY `UQ_CM_Server_ServerName` (`ServerName`),
  KEY `IXFK_CM_Server_CM_ServerType` (`ServerTypeID`),
  KEY `NodeID` (`NodeID`),
  CONSTRAINT `cm_server_ibfk_1` FOREIGN KEY (`ServerTypeID`) REFERENCES `cm_servertype` (`ServerTypeID`),
  CONSTRAINT `cm_server_ibfk_2` FOREIGN KEY (`NodeID`) REFERENCES `cm_node` (`NodeID`)
) ENGINE=InnoDB AUTO_INCREMENT=289 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cm_server`
--

LOCK TABLES `cm_server` WRITE;
/*!40000 ALTER TABLE `cm_server` DISABLE KEYS */;
INSERT INTO `cm_server` VALUES (7,'gbrpmsdbst01',8,1),(9,'gbrpmsuist01',14,2),(10,'gbrpmsuist02',14,3),(11,'gbrpmseast01',4,4),(12,'gbrpmseast02',4,5),(13,'gbrpmsbrgt01',3,6),(14,'gbrpmsbrgt02',3,7),(15,'gbrpmstalt01',12,8),(16,'gbrpmstalt02',13,9),(17,'gbrpmstalt03',11,10),(19,'gbrpmsappt01',6,11),(20,'gbrpmsdbst03',7,12),(21,'gbrcbiappt01',1,13),(22,'gbrcbidbst01',2,14),(42,'gbrpmsuisf11',14,19),(43,'gbrpmseasf11',4,20),(44,'gbrpmsbrgf11',3,21),(45,'gbrpmstalf11',12,22),(46,'gbrpmstalf12',13,23),(47,'gbrpmstalf13',11,24),(48,'gbrpmsappf11',6,25),(51,'gbrpmsuise01',14,28),(52,'gbrpmsuise11',14,29),(53,'gbrpmsease01',4,30),(54,'gbrpmsease11',4,31),(55,'gbrpmsdbse01',8,32),(56,'gbrpmstale01',13,33),(57,'gbrpmstale11',13,34),(61,'gbrpmsuisi01',14,35),(62,'gbrpmsrpxt01',5,36),(63,'gbrpmseasi01',4,37),(64,'gbrpmseasi02',4,38),(65,'gbrpmsbrgi01',3,39),(66,'gbrpmsbrgi02',3,40),(67,'gbrpmstali01',12,41),(68,'gbrpmstali02',13,42),(69,'gbrpmstali03',11,43),(70,'gbrpmsappi01',6,44),(71,'gbrpmsuisi11',14,45),(72,'gbrpmseasi11',4,46),(73,'gbrpmsbrgi11',3,47),(74,'gbrpmsbrgi12',3,48),(75,'gbrpmstali11',12,49),(76,'gbrpmstali12',13,50),(77,'gbrpmstali13',11,51),(78,'gbrpmsappi11',6,52),(79,'gbrpmsuisi21',14,53),(80,'gbrpmseasi21',4,54),(81,'gbrpmsbrgi21',3,55),(82,'gbrpmstali21',12,56),(83,'gbrpmstali22',13,57),(84,'gbrpmstali23',11,58),(85,'gbrpmsappi21',6,59),(86,'gbrpmsuisi31',14,60),(87,'gbrpmsuisi32',14,61),(88,'gbrpmseasi31',4,62),(89,'gbrpmseasi32',4,63),(90,'gbrpmsbrgi31',3,64),(91,'gbrpmsbrgi32',3,65),(92,'gbrpmstali31',12,66),(93,'gbrpmstali32',13,67),(94,'gbrpmstali33',11,68),(95,'gbrpmsappi31',6,69),(96,'gbrpmsuisi41',14,70),(97,'gbrpmsuisi42',14,71),(98,'gbrpmseasi41',4,72),(99,'gbrpmseasi42',4,73),(100,'gbrpmsbrgi41',3,74),(101,'gbrpmstali41',12,75),(102,'gbrpmstali42',13,76),(103,'gbrpmstali43',11,77),(104,'gbrpmsappi41',6,78),(105,'gbrpmsuisf01',14,79),(106,'gbrpmseasf01',4,80),(107,'gbrpmsbrgf01',3,81),(108,'gbrpmstalf01',12,82),(109,'gbrpmstalf02',13,83),(110,'gbrpmstalf03',11,84),(111,'gbrpmsappf01',6,85),(112,'gbrpmsuisf21',14,86),(113,'gbrpmseasf21',4,87),(114,'gbrpmsbrgf21',3,88),(115,'gbrpmstalf21',12,89),(116,'gbrpmstalf22',13,90),(117,'gbrpmstalf23',11,91),(118,'gbrpmsappf21',6,92),(119,'gbrpmsuisf31',14,93),(120,'gbrpmseasf31',4,94),(121,'gbrpmsbrgf31',3,95),(122,'gbrpmstalf31',12,96),(123,'gbrpmstalf32',13,97),(124,'gbrpmstalf33',11,98),(125,'gbrpmsappf31',6,99),(126,'gbrpmsuisf41',14,100),(127,'gbrpmseasf41',4,101),(128,'gbrpmsuisu01',14,102),(129,'gbrpmseasu01',4,103),(130,'gbrpmsbrgu01',3,104),(131,'gbrpmstalu01',12,105),(132,'gbrpmstalu02',13,106),(133,'gbrpmstalu03',11,107),(134,'gbrpmsappu01',6,108),(135,'gbrpmsuisu11',14,109),(136,'gbrpmseasu11',4,110),(137,'gbrpmsbrgu11',3,111),(138,'gbrpmstalu11',12,112),(139,'gbrpmstalu12',13,113),(140,'gbrpmstalu13',11,114),(141,'gbrpmsappu11',6,115),(142,'gbrpmsdbst05',10,116),(143,'gbrpmsdbst14',10,117),(145,'gbrpmsrept01',9,118),(146,'gbrpmsrept02',9,119),(147,'gbrcbiappt02',1,120),(148,'gbrpmsuisf02',14,121),(149,'gbrpmseasf02',4,122),(150,'gbrpmsbrgf12',3,123),(151,'gbrpmsmigi01',15,124),(152,'gbrpmsmigi11',15,125),(153,'gbrpmsmigi21',15,126),(154,'gbrpmsmigf01',15,127),(155,'gbrpmsmigf11',15,128),(156,'gbrpmsmigf21',15,129),(157,'gbrpmsmigf31',15,130),(158,'gbrpmsmigu01',15,131),(159,'gbrpmsmigu02',15,132),(160,'gbrpmsmigt01',15,133),(161,'gbrpmstalf41',12,137),(162,'gb1pmsdbse02',10,138),(163,'gb1pmsdbse03',10,139),(164,'gbrpmsuiss01',14,140),(165,'gbrpmsuiss02',14,141),(166,'gbrpmsuiss03',14,142),(167,'gbrpmsuiss04',14,143),(168,'gbrpmsuiss11',14,144),(169,'gbrpmsuiss12',14,145),(170,'gbrpmsuiss13',14,146),(171,'gbrpmsuiss14',14,147),(172,'gbrpmsuiss21',14,148),(173,'gbrpmsuiss22',14,149),(174,'gbrpmsuiss23',14,150),(175,'gbrpmsuiss24',14,151),(176,'gbrpmseass01',4,152),(177,'gbrpmseass02',4,153),(178,'gbrpmseass03',4,154),(179,'gbrpmseass04',4,155),(180,'gbrpmseass11',4,156),(181,'gbrpmseass12',4,157),(182,'gbrpmseass13',4,158),(183,'gbrpmseass14',4,159),(184,'gbrpmseass21',4,160),(185,'gbrpmseass22',4,161),(186,'gbrpmseass23',4,162),(187,'gbrpmseass24',4,163),(188,'gbrpmsbrgs21',3,164),(189,'gbrpmsbrgs22',3,165),(190,'gbrpmsdbss10',10,166),(191,'gbrpmsdbss11',10,167),(192,'gbrpmsdbss22',18,168),(193,'gbrpmsdbss23',19,169),(194,'gbrpmstals01',12,170),(195,'gbrpmstals02',13,171),(196,'gbrpmstals03',11,172),(197,'gbrpmsreps01',9,173),(198,'gbrpmsmigs01',15,174),(199,'gbrpmsmigs02',15,175),(200,'gbrcbiapps01',1,176),(201,'gbrcbiapps02',1,177),(202,'gbrcbiapps03',1,178),(203,'gbrpmsdbss1',8,180),(204,'gbrpmsdbss2',8,181),(205,'gbrcbidbss01',2,182),(206,'gbrcbidbss02',2,183),(207,'gbrpmsdbsr01',8,184),(208,'gbrpmsuisr01',14,185),(209,'gbrpmsuisr02',14,186),(210,'gbrpmseasr01',4,187),(211,'gbrpmseasr02',4,188),(212,'gbrpmsbrgr01',3,189),(213,'gbrpmsbrgr02',3,190),(214,'gbrpmstalr01',12,191),(215,'gbrpmstalr02',13,192),(216,'gbrpmstalr03',11,193),(217,'gbrpmsuism01',14,199),(218,'gbrpmsuism02',14,200),(219,'gbrpmsuism11',14,201),(220,'gbrpmsuism12',14,202),(221,'gbrpmsuism21',14,203),(222,'gbrpmsuism22',14,204),(223,'gbrpmseasm01',4,205),(224,'gbrpmseasm02',4,206),(225,'gbrpmseasm11',4,207),(226,'gbrpmseasm12',4,208),(227,'gbrpmseasm21',4,209),(228,'gbrpmseasm22',4,210),(229,'gbrpmsbrgm01',3,211),(230,'gbrpmsbrgm02',3,212),(231,'gbrpmsbrgm11',3,213),(232,'gbrpmsbrgm12',3,214),(233,'gbrpmsbrgm21',3,215),(234,'gbrpmsbrgm22',3,216),(235,'gbrpmsrepm01',9,217),(236,'gbrpmsdbsm02',18,218),(237,'gbrpmsdbsm03',19,219),(238,'gbrpmsdbsm04',10,220),(239,'gbrpmsdbsm05',10,221),(240,'gbrpmstalm01',12,222),(241,'gbrpmstalm02',13,223),(242,'gbrpmstalm03',11,224),(243,'gbrpmsmigm01',15,225),(244,'gbrpmsmigm02',15,226),(245,'gbrpmsdbsm01',8,228),(246,'gbrpmsuisp01',14,229),(247,'gbrpmsuisp02',14,230),(248,'gbrpmsuisp03',14,231),(249,'gbrpmsuisp04',14,232),(250,'gbrpmsuisp11',14,233),(251,'gbrpmsuisp12',14,234),(252,'gbrpmsuisp13',14,235),(253,'gbrpmsuisp14',14,236),(254,'gbrpmsuisp21',14,237),(255,'gbrpmsuisp22',14,238),(256,'gbrpmsuisp23',14,239),(257,'gbrpmsuisp24',14,240),(258,'gbrpmseasp01',4,241),(259,'gbrpmseasp02',4,242),(260,'gbrpmseasp03',4,243),(261,'gbrpmseasp04',4,244),(262,'gbrpmseasp11',4,245),(263,'gbrpmseasp12',4,246),(264,'gbrpmseasp13',4,247),(265,'gbrpmseasp14',4,248),(266,'gbrpmseasp21',4,249),(267,'gbrpmseasp22',4,250),(268,'gbrpmseasp23',4,251),(269,'gbrpmseasp24',4,252),(270,'gbrpmsbrgp21',3,253),(271,'gbrpmsbrgp22',3,254),(272,'gbrpmstalp01',12,255),(273,'gbrpmstalp02',13,256),(274,'gbrpmstalp03',11,257),(275,'gbrpmsrepp01',9,258),(276,'gbrcbiappp01',1,259),(277,'gbrcbiappp02',1,260),(278,'gbrcbiappp03',1,261),(279,'gbrpmsmigp01',15,262),(280,'gbrpmsmigp02',15,263),(281,'gbrpmsdbsp13',18,264),(282,'gbrpmsdbsp12',19,265),(283,'gbrpmsdbsp10',10,266),(284,'gbrpmsdbsp11',10,267),(285,'gbrpmsdbsp01',8,268),(286,'gbrpmsdbsp02',8,269),(287,'gbrcbidbsp01',2,270),(288,'gbrcbidbsp02',2,271);
/*!40000 ALTER TABLE `cm_server` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cm_serverconfig`
--

DROP TABLE IF EXISTS `cm_serverconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cm_serverconfig` (
  `ServerID` bigint(20) DEFAULT NULL,
  `ServConfigID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ServConfigParameter` varchar(255) DEFAULT NULL,
  `ServConfigValue` varchar(255) DEFAULT NULL,
  `ServConfigHieraAddress` varchar(255) DEFAULT NULL,
  `ServerConfigNotes` varchar(255) DEFAULT NULL,
  `ServerConfigIsSensitive` bit(1) DEFAULT b'0',
  PRIMARY KEY (`ServConfigID`),
  KEY `IXFK_CM_ServerConfig_CM_Server` (`ServerID`),
  CONSTRAINT `cm_serverconfig_ibfk_1` FOREIGN KEY (`ServerID`) REFERENCES `cm_server` (`ServerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cm_serverconfig`
--

LOCK TABLES `cm_serverconfig` WRITE;
/*!40000 ALTER TABLE `cm_serverconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `cm_serverconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cm_servertype`
--

DROP TABLE IF EXISTS `cm_servertype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cm_servertype` (
  `ServerTypeID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ServerTypeName` varchar(50) NOT NULL,
  PRIMARY KEY (`ServerTypeID`),
  UNIQUE KEY `UQ_CM_ServerType_ServerTypeName` (`ServerTypeName`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cm_servertype`
--

LOCK TABLES `cm_servertype` WRITE;
/*!40000 ALTER TABLE `cm_servertype` DISABLE KEYS */;
INSERT INTO `cm_servertype` VALUES (1,'BI - Application'),(2,'BI - Oracle Database'),(3,'BRG'),(16,'Client'),(4,'EAS'),(5,'HA Proxy'),(6,'Master Data - Application'),(18,'Master Data - Combined'),(7,'Master Data - Database'),(19,'Master Data - Standby'),(17,'MPC'),(15,'Nexphase SmartScript Migration Server'),(8,'PMS Oracle Database'),(9,'Reporting Server'),(10,'RESIP HDS'),(11,'TalenD - PCE'),(12,'TalenD - TSFN & Boots'),(13,'TalenD - TSFZ'),(14,'UIS');
/*!40000 ALTER TABLE `cm_servertype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cm_subenvironment`
--

DROP TABLE IF EXISTS `cm_subenvironment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cm_subenvironment` (
  `SubEnvironmentID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ReleaseID` bigint(20) DEFAULT NULL,
  `SubEnvironmentTypeID` bigint(20) DEFAULT NULL,
  `EnvironmentID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`SubEnvironmentID`),
  UNIQUE KEY `EnvironmentID_SubEnvironmentType_UNIQUE` (`EnvironmentID`,`SubEnvironmentTypeID`),
  KEY `IXFK_CM_Environment_CM_Releases` (`ReleaseID`),
  KEY `SubEnvironmentTypeID` (`SubEnvironmentTypeID`),
  CONSTRAINT `cm_subenvironment_ibfk_1` FOREIGN KEY (`ReleaseID`) REFERENCES `cm_release` (`ReleaseID`),
  CONSTRAINT `cm_subenvironment_ibfk_2` FOREIGN KEY (`EnvironmentID`) REFERENCES `cm_environment` (`EnvironmentID`),
  CONSTRAINT `cm_subenvironment_ibfk_3` FOREIGN KEY (`SubEnvironmentTypeID`) REFERENCES `cm_subenvironmenttype` (`SubEnvironmentTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cm_subenvironment`
--

LOCK TABLES `cm_subenvironment` WRITE;
/*!40000 ALTER TABLE `cm_subenvironment` DISABLE KEYS */;
INSERT INTO `cm_subenvironment` VALUES (1,9,1,21),(2,3,1,12),(5,NULL,1,22),(6,NULL,1,23),(7,12,1,16),(8,11,1,17),(9,9,1,18),(10,11,1,19),(11,NULL,1,20),(12,NULL,1,11),(13,8,1,13),(14,10,1,14),(15,9,1,15),(16,12,1,24),(17,12,1,25),(18,8,2,20),(19,11,3,20),(20,9,2,11),(21,11,3,11),(22,NULL,1,26),(23,NULL,1,27),(24,NULL,1,28),(25,NULL,2,26),(26,NULL,3,26),(27,NULL,4,26),(28,NULL,2,28),(29,NULL,3,28),(30,NULL,4,28),(32,NULL,1,30),(33,NULL,2,30),(34,NULL,3,30),(35,NULL,4,30);
/*!40000 ALTER TABLE `cm_subenvironment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cm_subenvironmentconfig`
--

DROP TABLE IF EXISTS `cm_subenvironmentconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cm_subenvironmentconfig` (
  `SubEnvironmentID` bigint(20) NOT NULL,
  `SubEnvConfigID` bigint(20) NOT NULL AUTO_INCREMENT,
  `SubEnvConfigParameter` varchar(255) DEFAULT NULL,
  `SubEnvConfigValue` varchar(255) DEFAULT NULL,
  `SubEnvConfigHieraAddress` varchar(255) DEFAULT NULL,
  `SubEnvConfigNotes` varchar(255) DEFAULT NULL,
  `SubEnvConfigIsSensitive` bit(1) DEFAULT b'0',
  PRIMARY KEY (`SubEnvConfigID`),
  KEY `IXFK_CM_EnvironmentConfig_CM_Environment` (`SubEnvironmentID`),
  CONSTRAINT `cm_subenvironmentconfig_ibfk_1` FOREIGN KEY (`SubEnvironmentID`) REFERENCES `cm_subenvironment` (`SubEnvironmentID`)
) ENGINE=InnoDB AUTO_INCREMENT=1249 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cm_subenvironmentconfig`
--

LOCK TABLES `cm_subenvironmentconfig` WRITE;
/*!40000 ALTER TABLE `cm_subenvironmentconfig` DISABLE KEYS */;
INSERT INTO `cm_subenvironmentconfig` VALUES (2,7,'ccode','gbr','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,8,'env','test','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,9,'sub_env','{ENVID}','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,10,'distrib','EnterpriseLinux','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,11,'log_level','INFO','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,12,'deployment_timeout','900','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,13,'ora_wallet','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,14,'ora_wallet_password','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,15,'db_name','PMST1','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'EAS_DB\':{ParamName}:',NULL,'\0'),(2,16,'db_port','1521','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'EAS_DB\':{ParamName}:',NULL,'\0'),(2,17,'db_server','gb2pmsdbst3.resources.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'EAS_DB\':{ParamName}:',NULL,'\0'),(2,18,'db_user','PMS{ENVID}','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'EAS_DB\':{ParamName}:',NULL,'\0'),(2,19,'db_pass','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'EAS_DB\':{ParamName}:',NULL,'\0'),(2,20,'db_name','PMST1','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'EAS_DB_STG\':{ParamName}:',NULL,'\0'),(2,21,'db_port','1521','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'EAS_DB_STG\':{ParamName}:',NULL,'\0'),(2,22,'db_server','gb2pmsdbst3.resources.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'EAS_DB_STG\':{ParamName}:',NULL,'\0'),(2,23,'db_user','PMS{ENVID}_STG','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'EAS_DB_STG\':{ParamName}:',NULL,'\0'),(2,24,'db_pass','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'EAS_DB_STG\':{ParamName}:',NULL,'\0'),(2,25,'db_name','PMST1','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'SYMDS_DB\':{ParamName}:',NULL,'\0'),(2,26,'db_port','1521','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'SYMDS_DB\':{ParamName}:',NULL,'\0'),(2,27,'db_server','gb2pmsdbst3.resources.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'SYMDS_DB\':{ParamName}:',NULL,'\0'),(2,28,'db_user','PMS{ENVID}','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'SYMDS_DB\':{ParamName}:',NULL,'\0'),(2,29,'db_pass','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'SYMDS_DB\':{ParamName}:',NULL,'\0'),(2,30,'db_name','PMST1','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'OPTIMUS\':{ParamName}:',NULL,'\0'),(2,31,'db_port','1521','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'OPTIMUS\':{ParamName}:',NULL,'\0'),(2,32,'db_server','gb2pmsdbst3.resources.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'OPTIMUS\':{ParamName}:',NULL,'\0'),(2,33,'db_user','OPTMIG{ENVID}','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'OPTIMUS\':{ParamName}:',NULL,'\0'),(2,34,'db_pass','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'OPTIMUS\':{ParamName}:',NULL,'\0'),(2,35,'application_user','pmsgbrtt','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,36,'application_group','pmsgbrtt','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,37,'maintenance_user','pmsgbmtt','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,38,'tsfn','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:mgmtusers:{ParamName}:',NULL,'\0'),(2,39,'gss','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:mgmtusers:{ParamName}:',NULL,'\0'),(2,40,'{ENVID}Admin','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:appusers:{ParamName}:',NULL,'\0'),(2,41,'{ENVID}Monitoring','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:appusers:{ParamName}:',NULL,'\0'),(2,42,'{ENVID}Operations','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:appusers:{ParamName}:',NULL,'\0'),(2,43,'{ENVID}Admin','jminix,ADMIN','ROOT:oneleonardo_envs:columbus-{ENVID}:approles:{ParamName}:',NULL,'\0'),(2,44,'{ENVID}Monitoring','jminix,MONITORING','ROOT:oneleonardo_envs:columbus-{ENVID}:approles:{ParamName}:',NULL,'\0'),(2,45,'{ENVID}Operations','jminix,OPERATIONS','ROOT:oneleonardo_envs:columbus-{ENVID}:approles:{ParamName}:',NULL,'\0'),(2,46,'product_name','columbus','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,47,'implementation_name','uk-boots','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,48,'application_desc','Columbus uk-boots implementation','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,49,'deploy_version','7.3.2','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,50,'release','1','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,51,'volumegroup','rootvg','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,52,'data_size','1G','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,53,'file_size','2G','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,54,'soft_size','1G','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,55,'jboss_enable_monitoring','false','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,56,'jboss_management_native_port','9999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,57,'jboss_host','localhost','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,58,'gclog_num_files','10','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,59,'gclog_file_size','100m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,60,'columbus_env_id','D','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,61,'asm_enable','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,62,'asm_enable_list','uis,eas,brg','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,63,'deployments','columbus-chs-7.3.2.ear','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,64,'datasources','java:jboss/datasources/columbus-ds-eas','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,65,'symds_enable','false','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,66,'training_enable','false','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,67,'symds_server','gbrpmseasf11.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,68,'symds_port','8180','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,69,'sym_sec_path','${jboss.server.config.dir}/syncronization/EK4DK','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,70,'sym_sec_file_release','20150115','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,71,'symds_db_server','gb2pmsdbst3.resources.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,72,'symds_db_port','1521','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,73,'symds_db_name','PMST1','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,74,'symds_db_user','PMS{ENVID}','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,75,'symds_db_pass','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,76,'sym_cluster_enabled','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,77,'sym_cluster_lock_timeout','300000','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,78,'osucontainer_concurrency','1-1','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,79,'asncontainer_concurrency','1-1','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,80,'wmq_enable','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,81,'jmxquery_enable','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,82,'centralized_logging_enabled','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,83,'BIQuery','${HOME}','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,84,'jboss_management_http_port','9990','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,85,'asm_jboss_management_user','admin','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,86,'asm_jboss_management_user_psw','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,87,'durcheck_licence','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,88,'clinicalcheck_licence','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,89,'endorsement_licence','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,90,'marchart_notifyMarChart_url','http://10.245.12.244:8090/DrugMessageService.svc','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,91,'housekeeping_enabled','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,92,'enable_new_transmit_due_date_orders_implementation','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,93,'preview_due_now_orders_page_limit','120','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,94,'clinicalcheck_getdur_url','http://gbrpmsdbst14.corp.internal:80/HDS/ClinicalInformation.svc/GetDUR','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,95,'clinicalcheck_getdrug_url','http://gbrpmsdbst14.corp.internal:80/HDS/ClinicalInformation.svc/GetDrugInformation','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,96,'reimbursement_getendorsement_url','http://gbrpmsdbst14.corp.internal:80/HDS/Reimbursement.svc/GetEndorsement','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,97,'emar_notifyPatientCommunity_url','http://10.245.12.244:8090/FacilityMessageService.svc','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,98,'emar_notifyPatient_url','http://10.245.12.244:8090/PatientMessageService.svc','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,99,'brg_server','gbrpmsbrgt00.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,100,'vip_brg_port','8884','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,101,'brg_port','8380','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,102,'brg_init_heap_mem','5120m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,103,'brg_max_heap_mem','5120m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,104,'brg_max_perm_size','512m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,105,'brg_new_size','1536m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,106,'brg_max_new_size','1536m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,107,'brg_spring_profile','outbound_api_channel,outbound_api_adapter,inbound_api_channel,inbound_api_adapter,import_batch,export_batch,internal_job_batch,external_job_batch,sym_chs','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,108,'brg_deployments','columbus-chs-7.3.2.ear,symmetricds-war-1.3.war','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,109,'brg_datasources','java:jboss/datasources/columbus-ds-eas,java:jboss/datasources/columbus-ds-symmetricds','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,110,'brg_asm_enabled_check_list','availabilityChecker,deployChecker,datasourceChecker','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,111,'sync_url','https://gbrpmsbrgt00.corp.internal:8884/symmetricds/sync/chs-master','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,112,'resadapter_arc','wmq.jmsra.rar','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,113,'dispensed_db_name','EAS_DB','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,114,'env_roles_internal_jobs_enable','brg','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,115,'ig32_ek4dk','xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,116,'boots_patient_key_hash','xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,117,'IG32_secret_key','xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,118,'inbound_dir','createUpdateStockTake','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,119,'inbound_dir','createUpdateUnitOfMeasureList','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,120,'inbound_dir','createUpdateFormulation','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,121,'inbound_dir','createUpdatePatient','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,122,'inbound_dir','createUpdatePatientCommunity','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,123,'inbound_dir','createUpdateLevyFeeList','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,124,'outbound_dir','createUpdateStockTake','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,125,'outbound_dir','createUpdateUnitOfMeasureList','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,126,'outbound_dir','createUpdateFormulation','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,127,'outbound_dir','createUpdatePatient','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,128,'outbound_dir','createUpdatePatientCommunity','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,129,'outbound_dir','createUpdateLevyFeeList','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,130,'history_dir','createUpdateStockTake','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,131,'history_dir','createUpdateUnitOfMeasureList','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,132,'history_dir','createUpdateFormulation','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,133,'history_dir','createUpdatePatient','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,134,'history_dir','createUpdatePatientCommunity','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,135,'history_dir','createUpdateLevyFeeList','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,136,'columbus_db_version','7.3.2','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,137,'eas_spring_profile','outbound_api_channel,outbound_api_adapter,offline','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,138,'eas_deployments','columbus-chs-7.3.2.ear','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,139,'eas_datasources','java:jboss/datasources/columbus-ds-eas','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,140,'eas_asm_enabled_check_list','availabilityChecker,deployChecker,datasourceChecker','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,141,'eas_db_server','gb2pmsdbst3.resources.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,142,'eas_db_port','1521','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,143,'eas_db_name','PMST1','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,144,'eas_db_user','PMS{ENVID}','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,145,'eas_db_pass','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,146,'eas_db_staging_server','gb2pmsdbst3.resources.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,147,'eas_db_staging_port','1521','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,148,'eas_db_staging_name','PMST1','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,149,'eas_db_staging_user','PMS{ENVID}_STG','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,150,'eas_db_staging_pass','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,151,'eas_port','8180','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,152,'vip_eas_server','gbrpmseast00.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,153,'vip_eas_port','8849','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,154,'eas_init_heap_mem','5120m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,155,'eas_max_heap_mem','5120m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,156,'eas_max_perm_size','512m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,157,'eas_new_size','1536m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,158,'eas_max_new_size','1536m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,159,'CPAS_modulus','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,160,'CPAS_exponent','AQAB','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,161,'ig29_secret_keys','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,162,'boots_stockplus_key_hash','B5B','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,163,'ig24_secret_key','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,164,'ek4dk','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,165,'leo_queuemgr_name','*UNIALPD','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,166,'tote_order_line_ref_min_value','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,167,'tote_order_line_ref_max_value','999999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,168,'tote_ref_min_value','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,169,'tote_ref_max_value','9999999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,170,'use_tote_prefix','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,171,'tote_prefix','TOTE','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,172,'uis_init_heap_mem','5120m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,173,'uis_max_heap_mem','5120m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,174,'uis_max_perm_size','512m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,175,'uis_new_size','1536m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,176,'uis_max_new_size','1536m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,177,'uis_server','gbrpmsuist00.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,178,'uis_port','8280','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,179,'uis_sys_credential_file','SysCredential.properties','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,180,'uis_user','uisUser','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,181,'uis_deployments','columbus-desktop-7.3.2.ear','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,182,'uis_asm_enabled_check_list','availabilityChecker,deployChecker','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,183,'proxy_name','gbrpmsuist00.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,184,'proxy_port','8849','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,185,'batchclient_enable','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,186,'batch_client_ws_user','john','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,187,'batch_client_ws_password','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,188,'batch_client_ws_sec_enabled','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,189,'batch_client_ws_enc_enabled','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,190,'batch_user','batchJobUser1','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,191,'batch_sys_credential_file','SysCredential_generatedByEAS.properties','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,192,'batch_max_retry_attempts','10','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,193,'exit_code_batch_enable','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,194,'batchclient_ek4dk','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,195,'syscred_password','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,196,'syscred_passwordIssueDate','1471539187637','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,197,'createUpdatePrescription_INSERT_THREADS','30','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,198,'createUpdatePrescription_VALIDATION_THREADS','30','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,199,'tsfn_server','gbrpmstali21.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,200,'tsfz_environment_id','28','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,201,'tsfz_NASHxCf','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,202,'tsfz_inbound_columbus_zipfile_name','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,203,'tsfz_inbound_columbus_zip_time','7','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,204,'tsfz_inbound_columbus_retain_time','30','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,205,'tsfz_inbound_columbus_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,206,'tsfz_inbound_columbus_csv_zipfile_name','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,207,'tsfz_inbound_columbus_csv_zip_time','7','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,208,'tsfz_inbound_columbus_csv_retain_time','30','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,209,'tsfz_inbound_columbus_csv_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,210,'tsfz_outbound_columbus_zipfile_name','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,211,'tsfz_outbound_columbus_zip_time','7','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,212,'tsfz_outbound_columbus_retain_time','30','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,213,'tsfz_outbound_columbus_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,214,'tsfz_internal_columbus_readmeFiles_zipfile_name','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,215,'tsfz_internal_columbus_readmeFiles_zip_time','7','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,216,'tsfz_internal_columbus_readmeFiles_retain_time','30','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,217,'tsfz_internal_columbus_readmeFiles_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,218,'tsfz_rootZipFiles_zipfile_name','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,219,'tsfz_rootZipFiles_zip_time','7','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,220,'tsfz_rootZipFiles_retain_time','30','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,221,'tsfz_rootZipFiles_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,222,'tsfz_insideCSVFiles_zipfile_name','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,223,'tsfz_insideCSVFiles_zip_time','7','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,224,'tsfz_insideCSVFiles_retain_time','30','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,225,'tsfz_insideCSVFiles_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,226,'tsfz_insideZipFiles_zipfile_name','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,227,'tsfz_insideZipFiles_zip_time','7','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,228,'tsfz_insideZipFiles_retain_time','30','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,229,'tsfz_insideZipFiles_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,230,'tsfz_archives_columbus_zipfile_name','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,231,'tsfz_archives_columbus_zip_time','7','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,232,'tsfz_archives_columbus_retain_time','30','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,233,'tsfz_archives_columbus_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,234,'tsfz_history_inbound_columbus_zipfile_name','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,235,'tsfz_history_inbound_columbus_zip_time','7','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,236,'tsfz_history_inbound_columbus_retain_time','30','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,237,'tsfz_history_inbound_columbus_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,238,'tsfz_history_outbound_columbus_zipfile_name','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,239,'tsfz_history_outbound_columbus_zip_time','7','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,240,'tsfz_history_outbound_columbus_retain_time','30','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,241,'tsfz_history_outbound_columbus_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,242,'tsfz_history_inbound_columbus_readmeFiles_zipfile_name','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,243,'tsfz_history_inbound_columbus_readmeFiles_zip_time','7','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,244,'tsfz_history_inbound_columbus_readmeFiles_retain_time','30','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,245,'tsfz_history_inbound_columbus_readmeFiles_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,246,'tsfz_history_outbound_columbus_readmeFiles_zipfile_name','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,247,'tsfz_history_outbound_columbus_readmeFiles_zip_time','7','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,248,'tsfz_history_outbound_columbus_readmeFiles_retain_time','30','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,249,'tsfz_history_outbound_columbus_readmeFiles_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,250,'pce_environment_id','60','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,251,'pce_if108_domain_code','coretest','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,252,'pce_NASHxCf','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,253,'pce_rsa_exp','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,254,'pce_rsa_mod','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,255,'pce_outbound_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,256,'pce_outbound_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,257,'pce_outbound_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,258,'pce_qAutomatInput_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,259,'pce_qAutomatInput_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,260,'pce_qAutomatInput_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,261,'pce_qAutomatInput_bad_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,262,'pce_qAutomatInput_bad_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,263,'pce_qAutomatInput_bad_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,264,'pce_qAutomatOutput_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,265,'pce_qAutomatOutput_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,266,'pce_qAutomatOutput_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,267,'pce_qAutomatOutput_bad_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,268,'pce_qAutomatOutput_bad_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,269,'pce_qAutomatOutput_bad_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,270,'pce_qCombined_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,271,'pce_qCombined_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,272,'pce_qCombined_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,273,'pce_qCombined_bad_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,274,'pce_qCombined_bad_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,275,'pce_qCombined_bad_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,276,'pce_qIF130_FinanceFeed_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,277,'pce_qIF130_FinanceFeed_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,278,'pce_qIF130_FinanceFeed_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,279,'pce_qIF130_FinanceFeed_bad_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,280,'pce_qIF130_FinanceFeed_bad_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,281,'pce_qIF130_FinanceFeed_bad_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,282,'pce_qIF134_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,283,'pce_qIF134_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,284,'pce_qIF134_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,285,'pce_qIF137_Audit_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,286,'pce_qIF137_Audit_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,287,'pce_qIF137_Audit_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,288,'pce_qIF137_Audit_bad_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,289,'pce_qIF137_Audit_bad_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,290,'pce_qIF137_Audit_bad_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,291,'pce_qIF138_IMS_DTP_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,292,'pce_qIF138_IMS_DTP_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,293,'pce_qIF138_IMS_DTP_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,294,'pce_qIF138_IMS_DTP_bad_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,295,'pce_qIF138_IMS_DTP_bad_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,296,'pce_qIF138_IMS_DTP_bad_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,297,'pce_qIF138_Mftr_Audit_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,298,'pce_qIF138_Mftr_Audit_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,299,'pce_qIF138_Mftr_Audit_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,300,'pce_qIF138_Mftr_Audit_bad_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,301,'pce_qIF138_Mftr_Audit_bad_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,302,'pce_qIF138_Mftr_Audit_bad_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,303,'pce_qIF59_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,304,'pce_qIF59_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,305,'pce_qIF59_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,306,'pce_qIF59_bad_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,307,'pce_qIF59_bad_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,308,'pce_qIF59_bad_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,309,'pce_qIF90_DeliveryRequest_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,310,'pce_qIF90_DeliveryRequest_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,311,'pce_qIF90_DeliveryRequest_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,312,'pce_qIF90_DeliveryRequest_bad_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,313,'pce_qIF90_DeliveryRequest_bad_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,314,'pce_qIF90_DeliveryRequest_bad_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,315,'pce_qLabelData_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,316,'pce_qLabelData_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,317,'pce_qLabelData_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,318,'pce_qLabels_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,319,'pce_qLabels_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,320,'pce_qLabels_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,321,'pce_qTote_Centric_Data_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,322,'pce_qTote_Centric_Data_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,323,'pce_qTote_Centric_Data_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,324,'pce_tmp_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,325,'pce_tmp_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,326,'pce_tmp_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,327,'pce_history_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,328,'pce_history_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,329,'pce_history_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,330,'pce_history_qAutomatInput_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,331,'pce_history_qAutomatInput_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,332,'pce_history_qAutomatInput_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,333,'pce_history_qAutomatOutput_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,334,'pce_history_qAutomatOutput_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,335,'pce_history_qAutomatOutput_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,336,'pce_history_qCombined_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,337,'pce_history_qCombined_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,338,'pce_history_qCombined_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,339,'pce_history_qIF130_FinanceFeed_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,340,'pce_history_qIF130_FinanceFeed_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,341,'pce_history_qIF130_FinanceFeed_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,342,'pce_history_qIF134_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,343,'pce_history_qIF134_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,344,'pce_history_qIF134_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,345,'pce_history_qIF137_Audit_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,346,'pce_history_qIF137_Audit_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,347,'pce_history_qIF137_Audit_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,348,'pce_history_qIF138_IMS_DTP_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,349,'pce_history_qIF138_IMS_DTP_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,350,'pce_history_qIF138_IMS_DTP_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,351,'pce_history_qIF138_Mftr_Audit_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,352,'pce_history_qIF138_Mftr_Audit_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,353,'pce_history_qIF138_Mftr_Audit_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,354,'pce_history_qIF90_DeliveryRequest_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,355,'pce_history_qIF90_DeliveryRequest_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,356,'pce_history_qIF90_DeliveryRequest_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,357,'pce_history_qLabelData_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,358,'pce_history_qLabelData_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,359,'pce_history_qLabelData_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,360,'pce_history_qTote_Centric_Data_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,361,'pce_history_qTote_Centric_Data_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,362,'pce_history_qTote_Centric_Data_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,363,'pce_history_outbound_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,364,'pce_history_outbound_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,365,'pce_history_outbound_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,366,'pce_logs_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,367,'pce_logs_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,368,'pce_logs_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,369,'pce_automat_server','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,370,'pce_automat_settrace','all','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,371,'pce_db_audit_name','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,372,'pce_db_audit_server','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,373,'pce_db_audit_port','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,374,'pce_db_audit_user','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,375,'pce_db_audit_pass','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,376,'pce_db_audit_schema','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,377,'pce_db_if138_mftr_audit_name','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,378,'pce_db_if138_mftr_audit_server','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,379,'pce_db_if138_mftr_audit_port','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,380,'pce_db_if138_mftr_audit_user','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,381,'pce_db_if138_mftr_audit_pass','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,382,'pce_db_if138_mftr_audit_schema','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,383,'pce_db_masterdata_name','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,384,'pce_db_masterdata_server','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,385,'pce_db_masterdata_port','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,386,'pce_db_masterdata_user','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,387,'pce_db_masterdata_pass','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,388,'pce_db_masterdata_schema_obd','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,389,'pce_db_masterdata_schema_pubsta','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,390,'pce_ftp_host','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,391,'pce_ftp_port','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,392,'pce_ftp_user','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,393,'pce_ftp_pass','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,394,'pce_queue_manager','*UNIALPD','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,395,'pce_queue_manager_if90_leo','*NAPUKTA','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,396,'optimus_db_server','gb2pmsdbst3.resources.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,397,'optimus_db_port','1521','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,398,'optimus_db_name','PMST1','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,399,'optimus_db_user','OPTMIG{ENVID}','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,400,'optimus_db_pass','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,401,'stockplus_db_server','gb2pmsdbst3.resources.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,402,'stockplus_db_port','1521','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,403,'stockplus_db_name','PMST1','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,404,'stockplus_db_user','STKMIG{ENVID}','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,405,'stockplus_db_pass','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,406,'fullmig_db_server','gb2pmsdbst3.resources.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,407,'fullmig_db_port','1521','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,408,'fullmig_db_name','PMST1','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,409,'fullmig_db_user','FULLMIG{ENVID}','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,410,'fullmig_db_pass','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,411,'masterdata_db_server','gb2pmsdbst11.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,412,'masterdata_db_name','MasterData','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,413,'masterdata_db_port','51649','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,414,'masterdata_db_user','talendT','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,415,'masterdata_db_pass','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,416,'boots_masterdata_db_schema','PublishedStaging','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,417,'boots_masterdata_db_instance','MASTERDATADB{ENVID}','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,418,'boots_interface_loglevel','INFO','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,419,'if056_rsa_pub_modulus','xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,420,'if056_rsa_pub_exp','xxxx','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,421,'ftp_nxp_host','ftp.cegedimrx.co.uk','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,422,'ftp_nxp_user','bootscolumbus','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,423,'ftp_nxp_pass','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,424,'ftp_nhs_host','ftp.isd.hscic.gov.uk','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,425,'ftp_nhs_user','TRUD3-11585@trud.nhs.uk','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,426,'ftp_nhs_pass','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,427,'one_leo_db_host','10.179.20.187','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,428,'one_leo_db_port','60000','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,429,'one_leo_db_name','unichemd','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,430,'one_leo_db_user','enquire','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,431,'one_leo_db_pass','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,432,'ah_talend_server','unknown','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,433,'ah_talend_user','tagbXadm','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,434,'columbus_release','2070000','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,435,'columbus_masterdata_4_status','1','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,436,'sec_file_release','20150121','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(2,437,'auditd_local_rules','true','ROOT:{ParamName}:',NULL,'\0'),(2,438,'srcurl','http://gb2inffilp1.resources.corp.internal/SOURCES/','ROOT:{ParamName}:',NULL,'\0'),(2,439,'os_version','centos-6.6-x86_64','ROOT:{ParamName}:',NULL,'\0'),(2,440,'interface','eth1','ROOT:keepalived_conf:\'gbrpmseast00\':{ParamName}:',NULL,'\0'),(2,441,'router_id','60','ROOT:keepalived_conf:\'gbrpmseast00\':{ParamName}:',NULL,'\0'),(2,442,'auth_type','PASS','ROOT:keepalived_conf:\'gbrpmseast00\':{ParamName}:',NULL,'\0'),(2,443,'auth_pass','removed','ROOT:keepalived_conf:\'gbrpmseast00\':{ParamName}:',NULL,'\0'),(2,444,'ipaddress','10.141.129.248/24','ROOT:keepalived_conf:\'gbrpmseast00\':{ParamName}:',NULL,'\0'),(2,445,'track_int','eth1','ROOT:keepalived_conf:\'gbrpmseast00\':{ParamName}:',NULL,'\0'),(2,446,'interface','eth1','ROOT:keepalived_conf:\'gbrpmsbrgt00\':{ParamName}:',NULL,'\0'),(2,447,'router_id','61','ROOT:keepalived_conf:\'gbrpmsbrgt00\':{ParamName}:',NULL,'\0'),(2,448,'auth_type','PASS','ROOT:keepalived_conf:\'gbrpmsbrgt00\':{ParamName}:',NULL,'\0'),(2,449,'auth_pass','removed','ROOT:keepalived_conf:\'gbrpmsbrgt00\':{ParamName}:',NULL,'\0'),(2,450,'ipaddress','10.141.129.249/24','ROOT:keepalived_conf:\'gbrpmsbrgt00\':{ParamName}:',NULL,'\0'),(2,451,'track_int','eth1','ROOT:keepalived_conf:\'gbrpmsbrgt00\':{ParamName}:',NULL,'\0'),(2,452,'interface','eth1','ROOT:keepalived_conf:\'gbrpmsuist00\':{ParamName}:',NULL,'\0'),(2,453,'router_id','62','ROOT:keepalived_conf:\'gbrpmsuist00\':{ParamName}:',NULL,'\0'),(2,454,'auth_type','PASS','ROOT:keepalived_conf:\'gbrpmsuist00\':{ParamName}:',NULL,'\0'),(2,455,'auth_pass','removed','ROOT:keepalived_conf:\'gbrpmsuist00\':{ParamName}:',NULL,'\0'),(2,456,'ipaddress','10.141.129.247/24','ROOT:keepalived_conf:\'gbrpmsuist00\':{ParamName}:',NULL,'\0'),(2,457,'track_int','eth1','ROOT:keepalived_conf:\'gbrpmsuist00\':{ParamName}:',NULL,'\0'),(2,458,'mode','http','ROOT:haproxy_conf:\'gbrpmsbrgft2\':{ParamName}:',NULL,'\0'),(2,459,'bind_address','10.141.129.249','ROOT:haproxy_conf:\'gbrpmsbrgft2\':{ParamName}:',NULL,'\0'),(2,460,'bind_port','8884','ROOT:haproxy_conf:\'gbrpmsbrgft2\':{ParamName}:',NULL,'\0'),(2,461,'balance','roundrobin','ROOT:haproxy_conf:\'gbrpmsbrgft2\':{ParamName}:',NULL,'\0'),(2,462,'options','stick on src','ROOT:haproxy_conf:\'gbrpmsbrgft2\':{ParamName}:',NULL,'\0'),(2,463,'options','stick-table type ip size 1m expire 3h','ROOT:haproxy_conf:\'gbrpmsbrgft2\':{ParamName}:',NULL,'\0'),(2,464,'backends','gbrpmsbrgf11 gbrpmsbrgf11.corp.internal:8380 check','ROOT:haproxy_conf:\'gbrpmsbrgft2\':{ParamName}:',NULL,'\0'),(2,465,'backends','gbrpmsbrgf12 gbrpmsbrgf12.corp.internal:8380 check','ROOT:haproxy_conf:\'gbrpmsbrgft2\':{ParamName}:',NULL,'\0'),(2,466,'mode','http','ROOT:haproxy_conf:\'gbrpmseasft2\':{ParamName}:',NULL,'\0'),(2,467,'bind_address','10.141.129.248','ROOT:haproxy_conf:\'gbrpmseasft2\':{ParamName}:',NULL,'\0'),(2,468,'bind_port','8849','ROOT:haproxy_conf:\'gbrpmseasft2\':{ParamName}:',NULL,'\0'),(2,469,'balance','roundrobin','ROOT:haproxy_conf:\'gbrpmseasft2\':{ParamName}:',NULL,'\0'),(2,470,'options','stick on src','ROOT:haproxy_conf:\'gbrpmseasft2\':{ParamName}:',NULL,'\0'),(2,471,'options','stick-table type ip size 1m expire 3h','ROOT:haproxy_conf:\'gbrpmseasft2\':{ParamName}:',NULL,'\0'),(2,472,'backends','gbrpmseasf11 gbrpmseasf11.corp.internal:8180 check','ROOT:haproxy_conf:\'gbrpmseasft2\':{ParamName}:',NULL,'\0'),(2,473,'mode','http','ROOT:haproxy_conf:\'gbrpmsuisft2\':{ParamName}:',NULL,'\0'),(2,474,'bind_address','10.141.129.247','ROOT:haproxy_conf:\'gbrpmsuisft2\':{ParamName}:',NULL,'\0'),(2,475,'bind_port','8849','ROOT:haproxy_conf:\'gbrpmsuisft2\':{ParamName}:',NULL,'\0'),(2,476,'balance','roundrobin','ROOT:haproxy_conf:\'gbrpmsuisft2\':{ParamName}:',NULL,'\0'),(2,477,'options','stick on src','ROOT:haproxy_conf:\'gbrpmsuisft2\':{ParamName}:',NULL,'\0'),(2,478,'options','stick-table type ip size 1m expire 3h','ROOT:haproxy_conf:\'gbrpmsuisft2\':{ParamName}:',NULL,'\0'),(2,479,'backends','gbrpmsuisf11 gbrpmsuisf11.corp.internal:8280 check','ROOT:haproxy_conf:\'gbrpmsuisft2\':{ParamName}:',NULL,'\0'),(2,480,'provide','base','ROOT:mysql_conf:{ParamName}:',NULL,'\0'),(2,481,'env','test','ROOT:mysql_conf:talend_test:{ParamName}:',NULL,'\0'),(2,482,'ccode','gbr','ROOT:mysql_conf:talend_test:{ParamName}:',NULL,'\0'),(2,483,'app','tal','ROOT:mysql_conf:talend_test:{ParamName}:',NULL,'\0'),(2,484,'user','tagbtdb','ROOT:mysql_conf:talend_test:{ParamName}:',NULL,'\0'),(2,485,'password','removed','ROOT:mysql_conf:talend_test:{ParamName}:',NULL,'\0'),(2,486,'group','tagbtdb','ROOT:mysql_conf:talend_test:{ParamName}:',NULL,'\0'),(2,487,'vg','rootvg','ROOT:mysql_conf:talend_test:{ParamName}:',NULL,'\0'),(2,488,'isbinding','true','ROOT:mysql_conf:talend_test:{ParamName}:',NULL,'\0'),(2,489,'isreplication','false','ROOT:mysql_conf:talend_test:{ParamName}:',NULL,'\0'),(2,490,'db','10G','ROOT:mysql_conf:talend_test:sizes:{ParamName}:',NULL,'\0'),(2,491,'files','1G','ROOT:mysql_conf:talend_test:sizes:{ParamName}:',NULL,'\0'),(2,492,'soft','1G','ROOT:mysql_conf:talend_test:sizes:{ParamName}:',NULL,'\0'),(2,493,'inno','1G','ROOT:mysql_conf:talend_test:sizes:{ParamName}:',NULL,'\0'),(2,494,'binlog','3G','ROOT:mysql_conf:talend_test:sizes:{ParamName}:',NULL,'\0'),(2,495,'save','1G','ROOT:mysql_conf:talend_test:sizes:{ParamName}:',NULL,'\0'),(2,496,'isbinlog','false','ROOT:mysql_conf:talend_test:{ParamName}:',NULL,'\0'),(2,497,'port','3306','ROOT:mysql_conf:talend_test:override_options:client{ParamName}:',NULL,'\0'),(2,498,'bind_address','0.0.0.0','ROOT:mysql_conf:talend_test:override_options:mysqlid{ParamName}:',NULL,'\0'),(2,499,'port','3306','ROOT:mysql_conf:talend_test:override_options:mysqlid{ParamName}:',NULL,'\0'),(2,500,'innodb_log_file_size','64M','ROOT:mysql_conf:talend_test:override_options:mysqlid{ParamName}:',NULL,'\0'),(2,501,'root_pass','removed','ROOT:mysql_conf:talend_test:{ParamName}:',NULL,'\0'),(2,502,'name','tsfz_portal','ROOT:mysql_db:tsfz_portal_test:{ParamName}:',NULL,'\0'),(2,503,'engine','talend_test','ROOT:mysql_db:tsfz_portal_test:{ParamName}:',NULL,'\0'),(2,504,'name','tagbtdb','ROOT:mysql_db:tsfz_portal_test:users:tsfz_portal_test_from_all_on_tsfz_portal_test:{ParamName}:',NULL,'\0'),(2,505,'host','%','ROOT:mysql_db:tsfz_portal_test:users:tsfz_portal_test_from_all_on_tsfz_portal_test:{ParamName}:',NULL,'\0'),(2,506,'grant','ALL','ROOT:mysql_db:tsfz_portal_test:users:tsfz_portal_test_from_all_on_tsfz_portal_test:{ParamName}:',NULL,'\0'),(2,507,'name','job_conf','ROOT:mysql_db:job_conf_test:{ParamName}:',NULL,'\0'),(2,508,'engine','talend_test','ROOT:mysql_db:job_conf_test:{ParamName}:',NULL,'\0'),(2,509,'name','tagbtdb','ROOT:mysql_db:job_conf_test:users:job_conf_test_from_all_on_job_conf_test:{ParamName}:',NULL,'\0'),(2,510,'host','%','ROOT:mysql_db:job_conf_test:users:job_conf_test_from_all_on_job_conf_test:{ParamName}:',NULL,'\0'),(2,511,'grant','ALL','ROOT:mysql_db:job_conf_test:users:job_conf_test_from_all_on_job_conf_test:{ParamName}:',NULL,'\0'),(2,512,'test','tsfz_portal_test','ROOT:talend_databases:{ParamName}:',NULL,'\0'),(2,513,'test','job_conf_test','ROOT:talend_databases:{ParamName}:',NULL,'\0'),(2,514,'env','test','ROOT:talend_test_info:{ParamName}:',NULL,'\0'),(2,515,'ccode','gbr','ROOT:talend_test_info:{ParamName}:',NULL,'\0'),(2,516,'app','tal','ROOT:talend_test_info:{ParamName}:',NULL,'\0'),(2,517,'user','tagbtadm','ROOT:talend_test_info:{ParamName}:',NULL,'\0'),(2,518,'group','tagbt','ROOT:talend_test_info:{ParamName}:',NULL,'\0'),(2,519,'nfsserver','127.0.0.1','ROOT:talend_test_info:{ParamName}:',NULL,'\0'),(2,520,'installinterfaces','true','ROOT:talend_test_info:{ParamName}:',NULL,'\0'),(2,521,'installoracli','false','ROOT:talend_test_info:{ParamName}:',NULL,'\0'),(2,522,'installdb2cli','false','ROOT:talend_test_info:{ParamName}:',NULL,'\0'),(2,523,'jdk_version','1.6.0_37','ROOT:talend_test_info:{ParamName}:',NULL,'\0'),(2,524,'jdk_release','0HS','ROOT:talend_test_info:{ParamName}:',NULL,'\0'),(2,525,'db2_vers','97','ROOT:talend_test_info:{ParamName}:',NULL,'\0'),(2,526,'envs_base','/tests/talend','ROOT:talend_test_info:{ParamName}:',NULL,'\0'),(2,527,'envf_base','/tests/talend','ROOT:talend_test_info:{ParamName}:',NULL,'\0'),(2,528,'envb_base','/tests/talend','ROOT:talend_test_info:{ParamName}:',NULL,'\0'),(2,529,'vg','rootvg','ROOT:talend_test_info:{ParamName}:',NULL,'\0'),(2,530,'size_envs_tal','3G','ROOT:talend_test_info:{ParamName}:',NULL,'\0'),(2,531,'size_envf_tal','1G','ROOT:talend_test_info:{ParamName}:',NULL,'\0'),(2,532,'size_envb_tal','2G','ROOT:talend_test_info:{ParamName}:',NULL,'\0'),(2,533,'size_exchange','2G','ROOT:talend_test_info:{ParamName}:',NULL,'\0'),(2,534,'size_history','5G','ROOT:talend_test_info:{ParamName}:',NULL,'\0'),(2,535,'size_internal','1G','ROOT:talend_test_info:{ParamName}:',NULL,'\0'),(2,536,'istsfn','true','ROOT:talend_test_info:{ParamName}:',NULL,'\0'),(2,537,'uid','1001','ROOT:user_tagbtdb:{ParamName}:',NULL,'\0'),(2,538,'gid','1000','ROOT:user_tagbtdb:{ParamName}:',NULL,'\0'),(2,539,'groups','tagbtdb','ROOT:user_tagbtdb:{ParamName}:',NULL,'\0'),(2,540,'home','/home/tagbtdb','ROOT:user_tagbtdb:{ParamName}:',NULL,'\0'),(2,541,'password','removed','ROOT:user_tagbtdb:{ParamName}:',NULL,'\0'),(2,542,'authorized_keys',NULL,'ROOT:user_tagbtdb:{ParamName}:',NULL,'\0'),(2,543,'uid','1000','ROOT:user_tagbtadm:{ParamName}:',NULL,'\0'),(2,544,'gid','1000','ROOT:user_tagbtadm:{ParamName}:',NULL,'\0'),(2,545,'groups','tagbt','ROOT:user_tagbtadm:{ParamName}:',NULL,'\0'),(2,546,'home','/home/tagbtadm','ROOT:user_tagbtadm:{ParamName}:',NULL,'\0'),(2,547,'password','removed','ROOT:user_tagbtadm:{ParamName}:',NULL,'\0'),(2,548,'authorized_keys_file','oneleonardo/ssh/authorized_keys.erb','ROOT:user_tagbtadm:{ParamName}:',NULL,'\0'),(2,549,'TSFN_columbus','true','ROOT:user_tagbtadm:authorized_keys:{ParamName}:',NULL,'\0'),(2,550,'integration','true','ROOT:user_tagbtadm:authorized_keys:{ParamName}:',NULL,'\0'),(2,551,'boots_support','true','ROOT:user_tagbtadm:authorized_keys:{ParamName}:',NULL,'\0'),(2,552,'boots_performance_test','true','ROOT:user_tagbtadm:authorized_keys:{ParamName}:',NULL,'\0'),(2,553,'devel','true','ROOT:user_tagbtadm:authorized_keys:{ParamName}:',NULL,'\0'),(2,554,'envb','/exchange/outbound','ROOT:talend_dirs:common:{ParamName}:',NULL,'\0'),(2,555,'envb','/exchange/inbound','ROOT:talend_dirs:common:{ParamName}:',NULL,'\0'),(2,556,'envb','/exchange/outbound/columbus','ROOT:talend_dirs:common:{ParamName}:',NULL,'\0'),(2,557,'envb','/exchange/outbound/optimus','ROOT:talend_dirs:common:{ParamName}:',NULL,'\0'),(2,558,'envb','/exchange/inbound/columbus','ROOT:talend_dirs:common:{ParamName}:',NULL,'\0'),(2,559,'envb','/exchange/inbound/optimus','ROOT:talend_dirs:common:{ParamName}:',NULL,'\0'),(2,560,'envb','/parameters/columbus','ROOT:talend_dirs:common:{ParamName}:',NULL,'\0'),(2,561,'envb','/parameters/optimus','ROOT:talend_dirs:common:{ParamName}:',NULL,'\0'),(2,562,'envb','/internal/columbus','ROOT:talend_dirs:common:{ParamName}:',NULL,'\0'),(2,563,'envb','/internal/optimus','ROOT:talend_dirs:common:{ParamName}:',NULL,'\0'),(2,564,'envf','/logs/optimus','ROOT:talend_dirs:common:{ParamName}:',NULL,'\0'),(2,565,'envf','/logs/columbus','ROOT:talend_dirs:common:{ParamName}:',NULL,'\0'),(2,566,'envf','/history/storage','ROOT:talend_dirs:common:{ParamName}:',NULL,'\0'),(2,567,'envf','/history/inbound','ROOT:talend_dirs:common:{ParamName}:',NULL,'\0'),(2,568,'envf','/history/outbound','ROOT:talend_dirs:common:{ParamName}:',NULL,'\0'),(2,569,'envf','/archives/columbus','ROOT:talend_dirs:common:{ParamName}:',NULL,'\0'),(2,570,'envf','/archives/optimus','ROOT:talend_dirs:common:{ParamName}:',NULL,'\0'),(2,571,'envf','/history/inbound/columbus','ROOT:talend_dirs:common:{ParamName}:',NULL,'\0'),(2,572,'envf','/history/inbound/optimus','ROOT:talend_dirs:common:{ParamName}:',NULL,'\0'),(2,573,'envf','/history/outbound/columbus','ROOT:talend_dirs:common:{ParamName}:',NULL,'\0'),(2,574,'envf','/history/outbound/optimus','ROOT:talend_dirs:common:{ParamName}:',NULL,'\0'),(2,575,'envs','/jobs/scripts/columbus','ROOT:talend_dirs:common:{ParamName}:',NULL,'\0'),(2,576,'envs','/jobs/scripts/optimus','ROOT:talend_dirs:common:{ParamName}:',NULL,'\0'),(2,577,'envb','/parameters/columbus/EK4DK','ROOT:talend_dirs:tsfn_only:{ParamName}:',NULL,'\0'),(2,578,'envb','/exchange/outbound/optimus/data/Drop','ROOT:talend_dirs:tsfn_only:{ParamName}:',NULL,'\0'),(2,579,'envb','/exchange/outbound/optimus/data/FailedOutput','ROOT:talend_dirs:tsfn_only:{ParamName}:',NULL,'\0'),(2,580,'envb','/exchange/outbound/optimus/data/IntermediateOutput','ROOT:talend_dirs:tsfn_only:{ParamName}:',NULL,'\0'),(2,581,'envb','/exchange/outbound/optimus/data/NotProcessed','ROOT:talend_dirs:tsfn_only:{ParamName}:',NULL,'\0'),(2,582,'envb','/exchange/outbound/optimus/data/ProcessedOutput','ROOT:talend_dirs:tsfn_only:{ParamName}:',NULL,'\0'),(2,583,'envb','/exchange/outbound/optimus/data/ProcessedSource','ROOT:talend_dirs:tsfn_only:{ParamName}:',NULL,'\0'),(2,584,'envb','/exchange/outbound/optimus/data/tmp','ROOT:talend_dirs:tsfn_only:{ParamName}:',NULL,'\0'),(2,585,'envb','/exchange/outbound/optimus/emailpickupfolder','ROOT:talend_dirs:tsfn_only:{ParamName}:',NULL,'\0'),(2,586,'envs','/jobs/scripts/columbus/move-scripts','ROOT:talend_dirs:tsfn_only:{ParamName}:',NULL,'\0'),(2,587,'envb','/exchange/inbound/columbus/bad','ROOT:talend_dirs:tsfz_only:{ParamName}:',NULL,'\0'),(2,588,'envb','/exchange/inbound/columbus/csv','ROOT:talend_dirs:tsfz_only:{ParamName}:',NULL,'\0'),(2,589,'envb','/exchange/inbound/columbus/release_2_1','ROOT:talend_dirs:tsfz_only:{ParamName}:',NULL,'\0'),(2,590,'envb','/exchange/inbound/columbus/release_2_2','ROOT:talend_dirs:tsfz_only:{ParamName}:',NULL,'\0'),(2,591,'envb','/exchange/inbound/columbus/release_2_3','ROOT:talend_dirs:tsfz_only:{ParamName}:',NULL,'\0'),(2,592,'envb','/exchange/inbound/columbus/release_2_4','ROOT:talend_dirs:tsfz_only:{ParamName}:',NULL,'\0'),(2,593,'envb','/exchange/inbound/columbus/release_7','ROOT:talend_dirs:tsfz_only:{ParamName}:',NULL,'\0'),(2,594,'envb','/exchange/outbound/columbus/release_2_1','ROOT:talend_dirs:tsfz_only:{ParamName}:',NULL,'\0'),(2,595,'envb','/exchange/outbound/columbus/release_2_2','ROOT:talend_dirs:tsfz_only:{ParamName}:',NULL,'\0'),(2,596,'envb','/exchange/outbound/columbus/release_2_3','ROOT:talend_dirs:tsfz_only:{ParamName}:',NULL,'\0'),(2,597,'envb','/exchange/outbound/columbus/release_2_4','ROOT:talend_dirs:tsfz_only:{ParamName}:',NULL,'\0'),(2,598,'envb','/exchange/outbound/columbus/release_7','ROOT:talend_dirs:tsfz_only:{ParamName}:',NULL,'\0'),(2,599,'envb','/exchange/NFM/columbus/IG33','ROOT:talend_dirs:tsfz_only:{ParamName}:',NULL,'\0'),(2,600,'envb','/internal/columbus/readmeFiles','ROOT:talend_dirs:tsfz_only:{ParamName}:',NULL,'\0'),(2,601,'envb','/internal/columbus/rootZipFiles','ROOT:talend_dirs:tsfz_only:{ParamName}:',NULL,'\0'),(2,602,'envb','/internal/columbus/insideCSVFiles','ROOT:talend_dirs:tsfz_only:{ParamName}:',NULL,'\0'),(2,603,'envb','/internal/columbus/insideZipFiles','ROOT:talend_dirs:tsfz_only:{ParamName}:',NULL,'\0'),(2,604,'envb','/internal/columbus/IG33','ROOT:talend_dirs:tsfz_only:{ParamName}:',NULL,'\0'),(2,605,'envf','/history/inbound/columbus/readmeFiles','ROOT:talend_dirs:tsfz_only:{ParamName}:',NULL,'\0'),(2,606,'envf','/history/inbound/columbus/release_2_1','ROOT:talend_dirs:tsfz_only:{ParamName}:',NULL,'\0'),(2,607,'envf','/history/inbound/columbus/release_2_2','ROOT:talend_dirs:tsfz_only:{ParamName}:',NULL,'\0'),(2,608,'envf','/history/inbound/columbus/release_2_3','ROOT:talend_dirs:tsfz_only:{ParamName}:',NULL,'\0'),(2,609,'envf','/history/inbound/columbus/release_2_4','ROOT:talend_dirs:tsfz_only:{ParamName}:',NULL,'\0'),(2,610,'envf','/history/inbound/columbus/release_7','ROOT:talend_dirs:tsfz_only:{ParamName}:',NULL,'\0'),(2,611,'envf','/history/inbound/columbus/IG33','ROOT:talend_dirs:tsfz_only:{ParamName}:',NULL,'\0'),(2,612,'envf','/history/outbound/columbus/readmeFiles','ROOT:talend_dirs:tsfz_only:{ParamName}:',NULL,'\0'),(2,613,'envf','/history/outbound/columbus/release_2_1','ROOT:talend_dirs:tsfz_only:{ParamName}:',NULL,'\0'),(2,614,'envf','/history/outbound/columbus/release_2_2','ROOT:talend_dirs:tsfz_only:{ParamName}:',NULL,'\0'),(2,615,'envf','/history/outbound/columbus/release_2_3','ROOT:talend_dirs:tsfz_only:{ParamName}:',NULL,'\0'),(2,616,'envf','/history/outbound/columbus/release_2_4','ROOT:talend_dirs:tsfz_only:{ParamName}:',NULL,'\0'),(2,617,'envf','/history/outbound/columbus/release_7','ROOT:talend_dirs:tsfz_only:{ParamName}:',NULL,'\0'),(2,618,'envf','/history/outbound/columbus/IG33','ROOT:talend_dirs:tsfz_only:{ParamName}:',NULL,'\0'),(2,619,'envs','/script/admin','ROOT:talend_dirs:tsfz_only:{ParamName}:',NULL,'\0'),(2,620,'envs','/jobs/scripts/columbus/move-scripts','ROOT:talend_dirs:tsfz_only:{ParamName}:',NULL,'\0'),(2,621,'envb','/exchange/outbound/optimus/pce','ROOT:talend_dirs:pce_only:{ParamName}:',NULL,'\0'),(2,622,'envb','/internal/optimus/pce/qAutomatInput','ROOT:talend_dirs:pce_only:{ParamName}:',NULL,'\0'),(2,623,'envb','/internal/optimus/pce/qAutomatInput/bad','ROOT:talend_dirs:pce_only:{ParamName}:',NULL,'\0'),(2,624,'envb','/internal/optimus/pce/qAutomatOutput','ROOT:talend_dirs:pce_only:{ParamName}:',NULL,'\0'),(2,625,'envb','/internal/optimus/pce/qAutomatOutput/bad','ROOT:talend_dirs:pce_only:{ParamName}:',NULL,'\0'),(2,626,'envb','/internal/optimus/pce/qCombined','ROOT:talend_dirs:pce_only:{ParamName}:',NULL,'\0'),(2,627,'envb','/internal/optimus/pce/qCombined/bad','ROOT:talend_dirs:pce_only:{ParamName}:',NULL,'\0'),(2,628,'envb','/internal/optimus/pce/qCombined/tmp','ROOT:talend_dirs:pce_only:{ParamName}:',NULL,'\0'),(2,629,'envb','/internal/optimus/pce/qIF130_FinanceFeed','ROOT:talend_dirs:pce_only:{ParamName}:',NULL,'\0'),(2,630,'envb','/internal/optimus/pce/qIF130_FinanceFeed/bad','ROOT:talend_dirs:pce_only:{ParamName}:',NULL,'\0'),(2,631,'envb','/internal/optimus/pce/qIF134','ROOT:talend_dirs:pce_only:{ParamName}:',NULL,'\0'),(2,632,'envb','/internal/optimus/pce/qIF137_Audit','ROOT:talend_dirs:pce_only:{ParamName}:',NULL,'\0'),(2,633,'envb','/internal/optimus/pce/qIF137_Audit/bad','ROOT:talend_dirs:pce_only:{ParamName}:',NULL,'\0'),(2,634,'envb','/internal/optimus/pce/qIF138_IMS_DTP','ROOT:talend_dirs:pce_only:{ParamName}:',NULL,'\0'),(2,635,'envb','/internal/optimus/pce/qIF138_IMS_DTP/bad','ROOT:talend_dirs:pce_only:{ParamName}:',NULL,'\0'),(2,636,'envb','/internal/optimus/pce/qIF138_Mftr_Audit','ROOT:talend_dirs:pce_only:{ParamName}:',NULL,'\0'),(2,637,'envb','/internal/optimus/pce/qIF138_Mftr_Audit/bad','ROOT:talend_dirs:pce_only:{ParamName}:',NULL,'\0'),(2,638,'envb','/internal/optimus/pce/qIF59','ROOT:talend_dirs:pce_only:{ParamName}:',NULL,'\0'),(2,639,'envb','/internal/optimus/pce/qIF59/bad','ROOT:talend_dirs:pce_only:{ParamName}:',NULL,'\0'),(2,640,'envb','/internal/optimus/pce/qIF90_DeliveryRequest','ROOT:talend_dirs:pce_only:{ParamName}:',NULL,'\0'),(2,641,'envb','/internal/optimus/pce/qIF90_DeliveryRequest/bad','ROOT:talend_dirs:pce_only:{ParamName}:',NULL,'\0'),(2,642,'envb','/internal/optimus/pce/qLabelData','ROOT:talend_dirs:pce_only:{ParamName}:',NULL,'\0'),(2,643,'envb','/internal/optimus/pce/qLabels','ROOT:talend_dirs:pce_only:{ParamName}:',NULL,'\0'),(2,644,'envb','/internal/optimus/pce/qTote_Centric_Data1','ROOT:talend_dirs:pce_only:{ParamName}:',NULL,'\0'),(2,645,'envb','/internal/optimus/pce/tmp','ROOT:talend_dirs:pce_only:{ParamName}:',NULL,'\0'),(2,646,'envb','/parameters/optimus/pce','ROOT:talend_dirs:pce_only:{ParamName}:',NULL,'\0'),(2,647,'envs','/script/admin','ROOT:talend_dirs:pce_only:{ParamName}:',NULL,'\0'),(2,648,'envs','/admin/scripts/filterOutDownStream','ROOT:talend_dirs:pce_only:{ParamName}:',NULL,'\0'),(2,649,'envf','/history/inbound/optimus/pce','ROOT:talend_dirs:pce_only:{ParamName}:',NULL,'\0'),(2,650,'envf','/history/internal/optimus/pce/qAutomatInput','ROOT:talend_dirs:pce_only:{ParamName}:',NULL,'\0'),(2,651,'envf','/history/internal/optimus/pce/qAutomatOutput','ROOT:talend_dirs:pce_only:{ParamName}:',NULL,'\0'),(2,652,'envf','/history/internal/optimus/pce/qCombined','ROOT:talend_dirs:pce_only:{ParamName}:',NULL,'\0'),(2,653,'envf','/history/internal/optimus/pce/qIF130_FinanceFeed','ROOT:talend_dirs:pce_only:{ParamName}:',NULL,'\0'),(2,654,'envf','/history/internal/optimus/pce/qIF134','ROOT:talend_dirs:pce_only:{ParamName}:',NULL,'\0'),(2,655,'envf','/history/internal/optimus/pce/qIF137_Audit','ROOT:talend_dirs:pce_only:{ParamName}:',NULL,'\0'),(2,656,'envf','/history/internal/optimus/pce/qIF138_IMS_DTP','ROOT:talend_dirs:pce_only:{ParamName}:',NULL,'\0'),(2,657,'envf','/history/internal/optimus/pce/qIF138_Mftr_Audit','ROOT:talend_dirs:pce_only:{ParamName}:',NULL,'\0'),(2,658,'envf','/history/internal/optimus/pce/qIF90_DeliveryRequest','ROOT:talend_dirs:pce_only:{ParamName}:',NULL,'\0'),(2,659,'envf','/history/internal/optimus/pce/qLabelData','ROOT:talend_dirs:pce_only:{ParamName}:',NULL,'\0'),(2,660,'envf','/history/internal/optimus/pce/qTote_Centric_Data1','ROOT:talend_dirs:pce_only:{ParamName}:',NULL,'\0'),(2,661,'envf','/history/outbound/optimus/pce','ROOT:talend_dirs:pce_only:{ParamName}:',NULL,'\0'),(2,662,'envf','/logs/optimus/pce','ROOT:talend_dirs:pce_only:{ParamName}:',NULL,'\0'),(2,663,'envf','/jobs/scripts/optimus/pce','ROOT:talend_dirs:pce_only:{ParamName}:',NULL,'\0'),(15,793,'ccode','gbr','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,794,'env','test','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,795,'sub_env','{ENVID}','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,796,'distrib','EnterpriseLinux','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,797,'log_level','INFO','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,798,'deployment_timeout','900','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,799,'ora_wallet','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,800,'ora_wallet_password','XXXXXXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,801,'db_name','PMST1','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'EAS_DB\':{ParamName}:',NULL,'\0'),(15,802,'db_port','1521','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'EAS_DB\':{ParamName}:',NULL,'\0'),(15,803,'db_server','gb2pmsdbst3.resources.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'EAS_DB\':{ParamName}:',NULL,'\0'),(15,804,'db_user','PMSFT5','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'EAS_DB\':{ParamName}:',NULL,'\0'),(15,805,'db_pass','XXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'EAS_DB\':{ParamName}:',NULL,'\0'),(15,806,'db_name','PMST1','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'EAS_DB_STG\':{ParamName}:',NULL,'\0'),(15,807,'db_port','1521','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'EAS_DB_STG\':{ParamName}:',NULL,'\0'),(15,808,'db_server','gb2pmsdbst3.resources.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'EAS_DB_STG\':{ParamName}:',NULL,'\0'),(15,809,'db_user','PMSFT5_STG','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'EAS_DB_STG\':{ParamName}:',NULL,'\0'),(15,810,'db_pass','XXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'EAS_DB_STG\':{ParamName}:',NULL,'\0'),(15,811,'db_name','PMST1','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'SYMDS_DB\':{ParamName}:',NULL,'\0'),(15,812,'db_port','1521','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'SYMDS_DB\':{ParamName}:',NULL,'\0'),(15,813,'db_server','gb2pmsdbst3.resources.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'SYMDS_DB\':{ParamName}:',NULL,'\0'),(15,814,'db_user','PMSFT5','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'SYMDS_DB\':{ParamName}:',NULL,'\0'),(15,815,'db_pass','XXXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'SYMDS_DB\':{ParamName}:',NULL,'\0'),(15,816,'db_name','PMST1','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'OPTIMUS\':{ParamName}:',NULL,'\0'),(15,817,'db_port','1521','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'OPTIMUS\':{ParamName}:',NULL,'\0'),(15,818,'db_server','gb2pmsdbst3.resources.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'OPTIMUS\':{ParamName}:',NULL,'\0'),(15,819,'db_user','OPTMIGFT5','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'OPTIMUS\':{ParamName}:',NULL,'\0'),(15,820,'db_pass','XXXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'OPTIMUS\':{ParamName}:',NULL,'\0'),(15,821,'application_user','pmsgbrtt','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,822,'application_group','pmsgbrtt','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,823,'maintenance_user','pmsgbmtt','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,824,'tsfn','XXXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:mgmtusers:{ParamName}:',NULL,'\0'),(15,825,'gss','XXXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:mgmtusers:{ParamName}:',NULL,'\0'),(15,826,'FT5Operations','XXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:appusers:{ParamName}:',NULL,'\0'),(15,827,'FT5Monitoring','XXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:appusers:{ParamName}:',NULL,'\0'),(15,828,'FT5Admin','XXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:appusers:{ParamName}:',NULL,'\0'),(15,829,'FT5Operations','jminix,OPERATIONS','ROOT:oneleonardo_envs:columbus-{ENVID}:approles:{ParamName}:',NULL,'\0'),(15,830,'FT5Admin','jminix,ADMIN','ROOT:oneleonardo_envs:columbus-{ENVID}:approles:{ParamName}:',NULL,'\0'),(15,831,'FT5Monitoring','jminix,MONITORING','ROOT:oneleonardo_envs:columbus-{ENVID}:approles:{ParamName}:',NULL,'\0'),(15,832,'product_name','columbus','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,833,'implementation_name','uk-boots','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,834,'application_desc','Columbus uk-boots implementation','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,835,'deploy_version','7.4.2','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','TSF-N application release number','\0'),(15,836,'release','1','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','Production Services package building release','\0'),(15,837,'volumegroup','rootvg','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','VG to create application filesystems','\0'),(15,838,'data_size','1G','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','Filesystem size for /{env}b/${appdir}','\0'),(15,839,'file_size','7G','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','Filesystem size for /{env}f/${appdir}','\0'),(15,840,'soft_size','1G','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','Filesystem size for /{env}s/${appdir}','\0'),(15,841,'jboss_enable_monitoring','false','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,842,'jboss_management_native_port','9999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,843,'jboss_host','localhost','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,844,'gclog_num_files','10','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,845,'gclog_file_size','100m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,846,'columbus_env_id','Z','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,847,'asm_enable','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,848,'asm_enable_list','uis,eas,brg','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,849,'deployments','columbus-chs-7.4.1.ear','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,850,'datasources','java:jboss/datasources/columbus-ds-eas','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,851,'symds_enable','false','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,852,'training_enable','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,853,'symds_server','gbrpmseasf41.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,854,'symds_port','8180','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,855,'sym_sec_path','${jboss.server.config.dir}/syncronization/EK4DK','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,856,'sym_sec_file_release','20150115','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,857,'symds_db_server','gb2pmsdbst3.resources.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,858,'symds_db_port','1521','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,859,'symds_db_name','PMST1','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,860,'symds_db_user','PMSFT5','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,861,'symds_db_pass','XXXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,862,'sym_cluster_enabled','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,863,'sym_cluster_lock_timeout','300000','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,864,'osucontainer_concurrency','1-1','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,865,'asncontainer_concurrency','1-1','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,866,'wmq_enable','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,867,'jmxquery_enable','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,868,'modularization','false','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,869,'centralized_logging_enabled','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,870,'BIQuery','${HOME}','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,871,'jboss_management_http_port','9990','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,872,'asm_jboss_management_user','admin','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,873,'asm_jboss_management_user_psw','XXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,874,'durcheck_licence','ep6rMijR9lolznvLHZgpxAkUEk1lEGcOeqf30cGue9Z6VQfxzGJaLVNLDgpN56bm','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,875,'clinicalcheck_licence','ep6rMijR9lolznvLHZgpxAkUEk1lEGcOeqf30cGue9Z6VQfxzGJaLVNLDgpN56bm','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,876,'endorsement_licence','ep6rMijR9lolznvLHZgpxAkUEk1lEGcOeqf30cGue9Z6VQfxzGJaLVNLDgpN56bm','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,877,'clinicalcheck_getdur_url','http://gbrpmsdbst14.corp.internal:80/HDS/ClinicalInformation.svc/GetDUR','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,878,'clinicalcheck_getdrug_url','http://gbrpmsdbst14.corp.internal:80/HDS/ClinicalInformation.svc/GetDrugInformation','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,879,'reimbursement_getendorsement_url','http://gbrpmsdbst14.corp.internal:80/HDS/Reimbursement.svc/GetEndorsement','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,880,'emar_notifyPatientCommunity_url','http://10.245.12.244:8090/FacilityMessageService.svc','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,881,'emar_notifyPatient_url','http://10.245.12.244:8090/PatientMessageService.svc','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,882,'marchart_notifyMarChart_url','http://10.245.12.244:8090/DrugMessageService.svc','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,883,'pms_url','http://10.245.12.244:8090','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,884,'stockplus_url','http://10.245.12.244:8090','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,885,'centfill_url','http://10.245.12.244:8090','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,886,'housekeeping_enabled','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,887,'enable_new_transmit_due_date_orders_implementation','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,888,'preview_due_now_orders_page_limit','120','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,889,'brg_server','gbrpmsbrgt00.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,890,'vip_brg_port','8892','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','Only used from batch-client','\0'),(15,891,'brg_port','8380','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,892,'brg_init_heap_mem','5120m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,893,'brg_max_heap_mem','6144m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,894,'brg_max_perm_size','512m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,895,'brg_new_size','1536m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,896,'brg_max_new_size','1536m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,897,'brg_spring_profile','outbound_api_channel,outbound_api_adapter,inbound_api_channel,inbound_api_adapter,import_batch,export_batch,internal_job_batch,external_job_batch,sym_chs','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,898,'brg_deployments','columbus-chs-7.4.1.ear','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,899,'brg_datasources','java:jboss/datasources/columbus-ds-eas','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,900,'brg_asm_enabled_check_list','availabilityChecker,deployChecker,datasourceChecker','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,901,'sync_url','https://gbrpmsbrgt00.corp.internal:8892/symmetricds/sync/chs-master','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,902,'resadapter_arc','wmq.jmsra.rar','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,903,'dispensed_db_name','EAS_DB','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:','Used for daily_dispensed and all_dispensed scripts','\0'),(15,904,'env_roles_internal_jobs_enable','eas','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,905,'brg_system_name','batchUserBRG','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,906,'ig32_ek4dk','xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,907,'boots_patient_key_hash','xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,908,'IG32_secret_key','xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,909,'inbound_dir','createUpdateStockTake','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:-',NULL,'\0'),(15,910,'inbound_dir','createUpdateUnitOfMeasureList','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:-',NULL,'\0'),(15,911,'inbound_dir','createUpdateFormulation','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:-',NULL,'\0'),(15,912,'inbound_dir','createUpdatePatient','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:-',NULL,'\0'),(15,913,'inbound_dir','createUpdatePatientCommunity','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:-',NULL,'\0'),(15,914,'inbound_dir','createUpdateLevyFeeList','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:-',NULL,'\0'),(15,915,'outbound_dir','createUpdateStockTake','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:-',NULL,'\0'),(15,916,'outbound_dir','createUpdateUnitOfMeasureList','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:-',NULL,'\0'),(15,917,'outbound_dir','createUpdateFormulation','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:-',NULL,'\0'),(15,918,'outbound_dir','createUpdatePatient','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:-',NULL,'\0'),(15,919,'outbound_dir','createUpdatePatientCommunity','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:-',NULL,'\0'),(15,920,'outbound_dir','createUpdateLevyFeeList','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:-',NULL,'\0'),(15,921,'history_dir','createUpdateStockTake','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:-',NULL,'\0'),(15,922,'history_dir','createUpdateUnitOfMeasureList','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:-',NULL,'\0'),(15,923,'history_dir','createUpdateFormulation','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:-',NULL,'\0'),(15,924,'history_dir','createUpdatePatient','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:-',NULL,'\0'),(15,925,'history_dir','createUpdatePatientCommunity','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:-',NULL,'\0'),(15,926,'history_dir','createUpdateLevyFeeList','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:-',NULL,'\0'),(15,927,'columbus_db_version','7.4.2','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,928,'eas_spring_profile','\"disableJob,training,outbound_api_channel,outbound_api_adapter,inbound_api_channel,inbound_api_adapter,import_batch,external_job_batch\"','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,929,'eas_deployments','columbus-chs-7.4.1.ear','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,930,'eas_datasources','java:jboss/datasources/columbus-ds-eas','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,931,'eas_asm_enabled_check_list','availabilityChecker,deployChecker,datasourceChecker','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,932,'eas_db_server','gb2pmsdbst3.resources.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,933,'eas_db_port','1521','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,934,'eas_db_name','PMST1','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,935,'eas_db_user','PMSFT5','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,936,'eas_db_pass','XXXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,937,'eas_db_staging_server','gb2pmsdbst3.resources.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,938,'eas_db_staging_port','1521','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,939,'eas_db_staging_name','PMST1','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,940,'eas_db_staging_user','PMSFT5_STG','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,941,'eas_db_staging_pass','XXXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,942,'eas_system_name','batchUserEAS','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,943,'eas_port','8180','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,944,'vip_eas_server','gbrpmseast00.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,945,'vip_eas_port','8895','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,946,'eas_init_heap_mem','5120m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,947,'eas_max_heap_mem','5120m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,948,'eas_max_perm_size','512m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,949,'eas_new_size','1536m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,950,'eas_max_new_size','1536m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,951,'CPAS_modulus','XXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,952,'CPAS_exponent','AQAB','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,953,'ig29_secret_keys','XXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:-',NULL,'\0'),(15,954,'ig29_secret_keys','XXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:-',NULL,'\0'),(15,955,'ig29_secret_keys','IG29=XXX','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:-',NULL,'\0'),(15,956,'ig29_secret_keys','XXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:-',NULL,'\0'),(15,957,'ig29_secret_keys','XXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:-',NULL,'\0'),(15,958,'boots_stockplus_key_hash','XXX','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,959,'ig24_secret_key','XXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,960,'ek4dk','XXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,961,'leo_queuemgr_name','*UNIALPZ','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,962,'tote_order_line_ref_min_value','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,963,'tote_order_line_ref_max_value','999999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,964,'tote_ref_min_value','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,965,'tote_ref_max_value','9999999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,966,'use_tote_prefix','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,967,'tote_prefix','TOTE','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,968,'uis_user','uisUser','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,969,'uis_spring_profile','training','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,970,'uis_init_heap_mem','5120m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,971,'uis_max_heap_mem','5120m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,972,'uis_max_perm_size','512m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,973,'uis_new_size','1536m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,974,'uis_max_new_size','1536m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,975,'uis_server','gbrpmsuist00.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,976,'uis_port','8280','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,977,'uis_sys_credential_file','SysCredential.properties','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,978,'uis_deployments','columbus-desktop-7.4.1.war','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,979,'uis_asm_enabled_check_list','availabilityChecker,deployChecker','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,980,'proxy_name','gbrpmsuist00.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,981,'proxy_port','8895','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,982,'uis_system_name','uisUser','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,983,'batchclient_enable','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,984,'batch_client_ws_user','john','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,985,'batch_client_ws_password','XXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,986,'batch_client_ws_sec_enabled','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,987,'batch_client_ws_enc_enabled','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,988,'batch_user','batchJobUser1','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,989,'batch_sys_credential_file','SysCredential_generatedByEAS.properties','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,990,'batch_max_retry_attempts','10','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,991,'exit_code_batch_enable','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,992,'createUpdatePrescription_INSERT_THREADS','30','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,993,'createUpdatePrescription_VALIDATION_THREADS','30','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,994,'tsfn_server','gbrpmstali21.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,995,'tsfz_environment_id','66','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,996,'tsfz_NASHxCf','XXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,997,'tsfz_inbound_columbus_zipfile_name','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,998,'tsfz_inbound_columbus_zip_time','7','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,999,'tsfz_inbound_columbus_retain_time','30','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1000,'tsfz_inbound_columbus_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1001,'tsfz_inbound_columbus_csv_zipfile_name','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1002,'tsfz_inbound_columbus_csv_zip_time','7','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1003,'tsfz_inbound_columbus_csv_retain_time','30','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1004,'tsfz_inbound_columbus_csv_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1005,'tsfz_outbound_columbus_zipfile_name','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1006,'tsfz_outbound_columbus_zip_time','7','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1007,'tsfz_outbound_columbus_retain_time','30','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1008,'tsfz_outbound_columbus_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1009,'tsfz_internal_columbus_readmeFiles_zipfile_name','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1010,'tsfz_internal_columbus_readmeFiles_zip_time','7','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1011,'tsfz_internal_columbus_readmeFiles_retain_time','30','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1012,'tsfz_internal_columbus_readmeFiles_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1013,'tsfz_rootZipFiles_zipfile_name','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1014,'tsfz_rootZipFiles_zip_time','7','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1015,'tsfz_rootZipFiles_retain_time','30','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1016,'tsfz_rootZipFiles_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1017,'tsfz_insideCSVFiles_zipfile_name','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1018,'tsfz_insideCSVFiles_zip_time','7','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1019,'tsfz_insideCSVFiles_retain_time','30','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1020,'tsfz_insideCSVFiles_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1021,'tsfz_insideZipFiles_zipfile_name','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1022,'tsfz_insideZipFiles_zip_time','7','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1023,'tsfz_insideZipFiles_retain_time','30','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1024,'tsfz_insideZipFiles_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1025,'tsfz_archives_columbus_zipfile_name','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1026,'tsfz_archives_columbus_zip_time','7','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1027,'tsfz_archives_columbus_retain_time','30','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1028,'tsfz_archives_columbus_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1029,'tsfz_history_inbound_columbus_zipfile_name','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1030,'tsfz_history_inbound_columbus_zip_time','7','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1031,'tsfz_history_inbound_columbus_retain_time','30','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1032,'tsfz_history_inbound_columbus_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1033,'tsfz_history_outbound_columbus_zipfile_name','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1034,'tsfz_history_outbound_columbus_zip_time','7','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1035,'tsfz_history_outbound_columbus_retain_time','30','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1036,'tsfz_history_outbound_columbus_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1037,'tsfz_history_inbound_columbus_readmeFiles_zipfile_name','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1038,'tsfz_history_inbound_columbus_readmeFiles_zip_time','7','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1039,'tsfz_history_inbound_columbus_readmeFiles_retain_time','30','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1040,'tsfz_history_inbound_columbus_readmeFiles_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1041,'tsfz_history_outbound_columbus_readmeFiles_zipfile_name','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1042,'tsfz_history_outbound_columbus_readmeFiles_zip_time','7','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1043,'tsfz_history_outbound_columbus_readmeFiles_retain_time','30','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1044,'tsfz_history_outbound_columbus_readmeFiles_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1045,'pce_environment_id','70','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1046,'pce_if108_domain_code','coretest','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1047,'pce_NASHxCf','XXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1048,'pce_rsa_exp','XXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1049,'pce_rsa_mod','XXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1050,'pce_outbound_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1051,'pce_outbound_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1052,'pce_outbound_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1053,'pce_qAutomatInput_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1054,'pce_qAutomatInput_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1055,'pce_qAutomatInput_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1056,'pce_qAutomatInput_bad_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1057,'pce_qAutomatInput_bad_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1058,'pce_qAutomatInput_bad_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1059,'pce_qAutomatOutput_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1060,'pce_qAutomatOutput_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1061,'pce_qAutomatOutput_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1062,'pce_qAutomatOutput_bad_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1063,'pce_qAutomatOutput_bad_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1064,'pce_qAutomatOutput_bad_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1065,'pce_qCombined_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1066,'pce_qCombined_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1067,'pce_qCombined_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1068,'pce_qCombined_bad_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1069,'pce_qCombined_bad_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1070,'pce_qCombined_bad_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1071,'pce_qIF130_FinanceFeed_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1072,'pce_qIF130_FinanceFeed_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1073,'pce_qIF130_FinanceFeed_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1074,'pce_qIF130_FinanceFeed_bad_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1075,'pce_qIF130_FinanceFeed_bad_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1076,'pce_qIF130_FinanceFeed_bad_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1077,'pce_qIF134_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1078,'pce_qIF134_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1079,'pce_qIF134_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1080,'pce_qIF137_Audit_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1081,'pce_qIF137_Audit_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1082,'pce_qIF137_Audit_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1083,'pce_qIF137_Audit_bad_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1084,'pce_qIF137_Audit_bad_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1085,'pce_qIF137_Audit_bad_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1086,'pce_qIF138_IMS_DTP_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1087,'pce_qIF138_IMS_DTP_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1088,'pce_qIF138_IMS_DTP_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1089,'pce_qIF138_IMS_DTP_bad_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1090,'pce_qIF138_IMS_DTP_bad_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1091,'pce_qIF138_IMS_DTP_bad_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1092,'pce_qIF138_Mftr_Audit_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1093,'pce_qIF138_Mftr_Audit_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1094,'pce_qIF138_Mftr_Audit_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1095,'pce_qIF138_Mftr_Audit_bad_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1096,'pce_qIF138_Mftr_Audit_bad_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1097,'pce_qIF138_Mftr_Audit_bad_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1098,'pce_qIF59_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1099,'pce_qIF59_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1100,'pce_qIF59_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1101,'pce_qIF59_bad_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1102,'pce_qIF59_bad_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1103,'pce_qIF59_bad_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1104,'pce_qIF90_DeliveryRequest_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1105,'pce_qIF90_DeliveryRequest_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1106,'pce_qIF90_DeliveryRequest_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1107,'pce_qIF90_DeliveryRequest_bad_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1108,'pce_qIF90_DeliveryRequest_bad_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1109,'pce_qIF90_DeliveryRequest_bad_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1110,'pce_qLabelData_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1111,'pce_qLabelData_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1112,'pce_qLabelData_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1113,'pce_qLabels_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1114,'pce_qLabels_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1115,'pce_qLabels_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1116,'pce_qTote_Centric_Data_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1117,'pce_qTote_Centric_Data_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1118,'pce_qTote_Centric_Data_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1119,'pce_tmp_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1120,'pce_tmp_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1121,'pce_tmp_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1122,'pce_history_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1123,'pce_history_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1124,'pce_history_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1125,'pce_history_qAutomatInput_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1126,'pce_history_qAutomatInput_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1127,'pce_history_qAutomatInput_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1128,'pce_history_qAutomatOutput_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1129,'pce_history_qAutomatOutput_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1130,'pce_history_qAutomatOutput_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1131,'pce_history_qCombined_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1132,'pce_history_qCombined_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1133,'pce_history_qCombined_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1134,'pce_history_qIF130_FinanceFeed_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1135,'pce_history_qIF130_FinanceFeed_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1136,'pce_history_qIF130_FinanceFeed_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1137,'pce_history_qIF134_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1138,'pce_history_qIF134_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1139,'pce_history_qIF134_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1140,'pce_history_qIF137_Audit_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1141,'pce_history_qIF137_Audit_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1142,'pce_history_qIF137_Audit_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1143,'pce_history_qIF138_IMS_DTP_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1144,'pce_history_qIF138_IMS_DTP_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1145,'pce_history_qIF138_IMS_DTP_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1146,'pce_history_qIF138_Mftr_Audit_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1147,'pce_history_qIF138_Mftr_Audit_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1148,'pce_history_qIF138_Mftr_Audit_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1149,'pce_history_qIF90_DeliveryRequest_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1150,'pce_history_qIF90_DeliveryRequest_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1151,'pce_history_qIF90_DeliveryRequest_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1152,'pce_history_qLabelData_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1153,'pce_history_qLabelData_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1154,'pce_history_qLabelData_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1155,'pce_history_qTote_Centric_Data_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1156,'pce_history_qTote_Centric_Data_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1157,'pce_history_qTote_Centric_Data_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1158,'pce_history_outbound_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1159,'pce_history_outbound_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1160,'pce_history_outbound_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1161,'pce_logs_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1162,'pce_logs_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1163,'pce_logs_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1164,'pce_automat_server','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1165,'pce_automat_settrace','all','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1166,'pce_db_audit_name','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1167,'pce_db_audit_server','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1168,'pce_db_audit_port','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1169,'pce_db_audit_user','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1170,'pce_db_audit_pass','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1171,'pce_db_audit_schema','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1172,'pce_db_if138_mftr_audit_name','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1173,'pce_db_if138_mftr_audit_server','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1174,'pce_db_if138_mftr_audit_port','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1175,'pce_db_if138_mftr_audit_user','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1176,'pce_db_if138_mftr_audit_pass','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1177,'pce_db_if138_mftr_audit_schema','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1178,'pce_db_masterdata_name','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1179,'pce_db_masterdata_server','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1180,'pce_db_masterdata_port','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1181,'pce_db_masterdata_user','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1182,'pce_db_masterdata_pass','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1183,'pce_db_masterdata_schema_obd','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1184,'pce_db_masterdata_schema_pubsta','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1185,'pce_ftp_host','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1186,'pce_ftp_port','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1187,'pce_ftp_user','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1188,'pce_ftp_pass','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1189,'pce_queue_manager','*UNIALPZ','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1190,'pce_queue_manager_if90_leo','*NAPUKTA','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1191,'optimus_db_server','gb2pmsdbst3.resources.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1192,'optimus_db_port','1521','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1193,'optimus_db_name','PMST1','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1194,'optimus_db_user','OPTMIGFT5','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1195,'optimus_db_pass','XXXXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1196,'stockplus_db_server','gb2pmsdbst3.resources.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1197,'stockplus_db_port','1521','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1198,'stockplus_db_name','PMST1','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1199,'stockplus_db_user','STKMIGFT5','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1200,'stockplus_db_pass','XXXXXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1201,'fullmig_db_server','gb2pmsdbst3.resources.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1202,'fullmig_db_port','1521','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1203,'fullmig_db_name','PMST1','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1204,'fullmig_db_user','FULLMIGFT5','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1205,'fullmig_db_pass','XXXXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1206,'masterdata_db_server','gb2pmsdbst11.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1207,'masterdata_db_name','MasterData','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1208,'masterdata_db_port','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1209,'masterdata_db_user','talendT','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1210,'masterdata_db_pass','XXXXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1211,'stockplusfm_masterdata_db_user','talendp','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1212,'stockplusfm_masterdata_pp_source','vw_NX_MapVDrugToColumbus_LastPublished','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1213,'stockplusfm_masterdata_dpp_source','vw_NX_MapPDrugToColumbus_LastPublished','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1214,'stockplusfm_log_file_name_mask','log','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1215,'stockplusfm_logmode','LOG4J','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1216,'stockplusfm_masterdata_db_pass','XXXXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1217,'stockplusfm_sourcefolder','/tests/talend/jobs/scripts/stockplusfm/maps/','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1218,'stockplusfm_184_adr_map_spreadsheet','NexPhase-MASActiveIngredient','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1219,'stockplusfm_184_adr_map_workbook','Adverse Drug Reactions Maps.xlsx','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1220,'stockplusfm_184_ex_map_spreadsheet','NexPhase-MASExemption','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1221,'stockplusfm_184_ex_map_workbook','Exemption Maps.xlsx','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1222,'stockplusfm_184_mc_map_spreadsheet','NexPhase-MASCondition','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1223,'stockplusfm_184_mc_map_workbook','Medical Condition Maps.xlsx','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1224,'stockplusfm_184_nda_map_spreadsheet','NexPhase-MASNonDrugAllergy','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1225,'stockplusfm_184_nda_map_workbook','Non Drug Allergy Maps.xlsx','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1226,'stockplusfm_184_servicetype_map_spreadsheet','Prescription Service Type','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1227,'stockplusfm_184_servicetype_map_workbook','Patient and Service Type Maps.xlsx','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1228,'boots_masterdata_db_schema','PublishedStaging','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1229,'boots_masterdata_db_instance','MASTERDATADBFT5','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1230,'boots_interface_loglevel','INFO','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1231,'if056_rsa_pub_modulus','xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1232,'if056_rsa_pub_exp','xxxx','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1233,'ftp_nxp_host','ftp.cegedimrx.co.uk','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1234,'ftp_nxp_user','bootscolumbus','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1235,'ftp_nxp_pass','XXXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1236,'ftp_nhs_host','ftp.isd.hscic.gov.uk','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1237,'ftp_nhs_user','TRUD3-11585@trud.nhs.uk','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1238,'ftp_nhs_pass','XXXXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1239,'one_leo_db_host','10.179.20.187','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1240,'one_leo_db_port','60000','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1241,'one_leo_db_name','unichemd','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1242,'one_leo_db_user','enquire','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1243,'one_leo_db_pass','XXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1244,'ah_talend_server','unknown','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1245,'ah_talend_user','tagbXadm','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1246,'columbus_release','2070000','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1247,'columbus_masterdata_4_status','1','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0'),(15,1248,'sec_file_release','20150121','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}:',NULL,'\0');
/*!40000 ALTER TABLE `cm_subenvironmentconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cm_subenvironmenttype`
--

DROP TABLE IF EXISTS `cm_subenvironmenttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cm_subenvironmenttype` (
  `SubEnvironmentTypeID` bigint(20) NOT NULL AUTO_INCREMENT,
  `SubEnvironmentTypeName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`SubEnvironmentTypeID`),
  UNIQUE KEY `UQ_CM_SubEnvironmentType_SubEnvironmentTypeName` (`SubEnvironmentTypeName`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cm_subenvironmenttype`
--

LOCK TABLES `cm_subenvironmenttype` WRITE;
/*!40000 ALTER TABLE `cm_subenvironmenttype` DISABLE KEYS */;
INSERT INTO `cm_subenvironmenttype` VALUES (1,'MAIN'),(2,'XLeg'),(3,'YLeg'),(4,'ZLeg');
/*!40000 ALTER TABLE `cm_subenvironmenttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cm_vip`
--

DROP TABLE IF EXISTS `cm_vip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cm_vip` (
  `VIPID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VIPName` varchar(50) NOT NULL,
  `NodeID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`VIPID`),
  UNIQUE KEY `UQ_CM_Server_ServerName` (`VIPName`),
  KEY `NodeID` (`NodeID`),
  CONSTRAINT `cm_vip_ibfk_1` FOREIGN KEY (`NodeID`) REFERENCES `cm_node` (`NodeID`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cm_vip`
--

LOCK TABLES `cm_vip` WRITE;
/*!40000 ALTER TABLE `cm_vip` DISABLE KEYS */;
INSERT INTO `cm_vip` VALUES (1,'gbrpmsuist00.corp.internal',134),(2,'gbrpmseast00.corp.internal',135),(3,'gbrpmsbrgt00.corp.internal',136),(4,'gbrpmsress00.corp.internal',179),(7,'gbrpmsuisr00.corp.internal',196),(8,'gbrpmsbrgr00.corp.internal',197),(9,'gbrpmseasr00-vin.corp.internal',198),(10,'gbrpmsresm00.corp.internal',227),(11,'gbrpmsresp00.corp.internal',272),(12,'gbrcbidbss00.corp.internal',273),(13,'gbrpmsdbss.corp.internal',274),(14,'gbrcbidbsp00.corp.internal',275),(15,'gbrpmsdbsp.corp.internal',276),(16,'gbrpmseass00-vin.corp.internal',277),(17,'gbrpmseass10-vin.corp.internal',278),(18,'gbrpmseass20-vin.corp.internal',279),(19,'gbrcbiapps00.corp.internal',280),(20,'gbrcbiappp00.corp.internal',281),(21,'gbrpmseasp00-vin.corp.internal',282),(22,'gbrpmseasp10-vin.corp.internal',283),(23,'gbrpmseasp20-vin.corp.internal',284),(24,'gbrpmseasm00-vin.corp.internal',285),(25,'gbrpmseasm10-vin.corp.internal',286),(26,'gbrpmseasm20-vin.corp.internal',287);
/*!40000 ALTER TABLE `cm_vip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `environment_release_packages_view`
--

DROP TABLE IF EXISTS `environment_release_packages_view`;
/*!50001 DROP VIEW IF EXISTS `environment_release_packages_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `environment_release_packages_view` AS SELECT 
 1 AS `EnvironmentName`,
 1 AS `SubEnvironmentTypeName`,
 1 AS `servertypename`,
 1 AS `Releasename`,
 1 AS `PackageTypeName`,
 1 AS `packagename`,
 1 AS `packageversion`,
 1 AS `ComponentName`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `environment_release_view`
--

DROP TABLE IF EXISTS `environment_release_view`;
/*!50001 DROP VIEW IF EXISTS `environment_release_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `environment_release_view` AS SELECT 
 1 AS `environmenttypename`,
 1 AS `EnvironmentName`,
 1 AS `SubEnvironmentTypeName`,
 1 AS `ReleaseName`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `environment_server_view`
--

DROP TABLE IF EXISTS `environment_server_view`;
/*!50001 DROP VIEW IF EXISTS `environment_server_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `environment_server_view` AS SELECT 
 1 AS `EnvironmentName`,
 1 AS `ServerName`,
 1 AS `ServerTypeName`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `ip_environment_view`
--

DROP TABLE IF EXISTS `ip_environment_view`;
/*!50001 DROP VIEW IF EXISTS `ip_environment_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `ip_environment_view` AS SELECT 
 1 AS `EnvironmentName`,
 1 AS `SubEnvironmentTypeName`,
 1 AS `Releasename`,
 1 AS `Name`,
 1 AS `Type`,
 1 AS `NodeIPAddress`,
 1 AS `NodeIPType`,
 1 AS `nodeipid`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `package_view`
--

DROP TABLE IF EXISTS `package_view`;
/*!50001 DROP VIEW IF EXISTS `package_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `package_view` AS SELECT 
 1 AS `packageID`,
 1 AS `PackageName`,
 1 AS `PackageTypeName`,
 1 AS `ServerTypeName`,
 1 AS `ReleaseName`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `privilege`
--

DROP TABLE IF EXISTS `privilege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `privilege` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privilege`
--

LOCK TABLES `privilege` WRITE;
/*!40000 ALTER TABLE `privilege` DISABLE KEYS */;
INSERT INTO `privilege` VALUES (1,'READ_SENSITIVE'),(2,'WRITE_SENSITIVE'),(3,'READ_PRODUCTION'),(4,'WRITE_PRODUCTION');
/*!40000 ALTER TABLE `privilege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `release_contents_view`
--

DROP TABLE IF EXISTS `release_contents_view`;
/*!50001 DROP VIEW IF EXISTS `release_contents_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `release_contents_view` AS SELECT 
 1 AS `ReleaseName`,
 1 AS `PackageTypeName`,
 1 AS `PackageName`,
 1 AS `ServerTypeName`,
 1 AS `ComponentName`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `releasedata_view`
--

DROP TABLE IF EXISTS `releasedata_view`;
/*!50001 DROP VIEW IF EXISTS `releasedata_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `releasedata_view` AS SELECT 
 1 AS `ReleaseName`,
 1 AS `DataTypeName`,
 1 AS `ReleaseParam`,
 1 AS `ReleaseValue`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ROLE_ADMIN'),(2,'ROLE_USER'),(3,'TEST_ROLE_1'),(4,'TEST_ROLE_2');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_privilege`
--

DROP TABLE IF EXISTS `role_privilege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_privilege` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `privilege_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_role_idx` (`role_id`),
  KEY `fk_privilege_idx` (`privilege_id`),
  CONSTRAINT `fk_privilege` FOREIGN KEY (`privilege_id`) REFERENCES `privilege` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_privilege`
--

LOCK TABLES `role_privilege` WRITE;
/*!40000 ALTER TABLE `role_privilege` DISABLE KEYS */;
INSERT INTO `role_privilege` VALUES (1,1,1),(2,1,2);
/*!40000 ALTER TABLE `role_privilege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `servertype_view`
--

DROP TABLE IF EXISTS `servertype_view`;
/*!50001 DROP VIEW IF EXISTS `servertype_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `servertype_view` AS SELECT 
 1 AS `ServerTypeName`,
 1 AS `ServerName`,
 1 AS `EnvironmentName`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'richard.davis@boots.co.uk',1,'$2a$06$YqQHNQgPEvAxYgeNtFCiZem6VPcCvUA90nkxtZsOwNEnWlgKPqDUK','rich'),(2,'duncan.eatch@boots.co.uk',1,'$2a$06$MBruHWlhdHs45qezRoF7qe.paM0eQDtxl6ueOc7KDrXqw9LMTmTu6','duncan');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  KEY `role_id` (`role_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,1),(1,2),(1,4),(2,2);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'cmdbnode'
--

--
-- Dumping routines for database 'cmdbnode'
--
/*!50003 DROP PROCEDURE IF EXISTS `AddIPReleation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddIPReleation`(inServerOrVipName1 varchar(50), inEnvironmentName1 varchar(50), inSubEnvTypeName1 varchar(50), inIP1 varchar(50), inServerOrVipName2 varchar(50), inEnvironmentName2 varchar(50), inSubEnvTypeName2 varchar(50), inIP2 varchar(50), inStartPort varchar(50), inEndPort varchar(50), inProtocol varchar(50))
BEGIN  

if (
select count(*) from cm_nodeiprelationship
where PublishingNodeIPID = (select NodeIPID from cm_nodeip nip
							left join cm_node_subenvironment nse on nip.nodesubid = nse.nodesubid
							where NodeID = 			(select NodeID from cm_server where servername = inServerOrVipName1 union all select NodeID from cm_vip where vipname = inServerOrVipName1)
							and SubenvironmentID = 	(select SubEnvironmentID 
													from cm_subenvironment SEnv
													left join cm_environment E on senv.environmentID = e.environmentID
													left join cm_subenvironmenttype Styp on styp.subenvironmenttypeID = senv.subenvironmenttypeID
													where e.EnvironmentName = inEnvironmentName1
													and styp.subenvironmenttypename = inSubEnvTypeName1)
							and NodeIPAddress = inIP1)
and ConsumingNodeIPID = (select NodeIPID from cm_nodeip nip
						left join cm_node_subenvironment nse on nip.nodesubid = nse.nodesubid
						where NodeID = 			(select NodeID from cm_server where servername = inServerOrVipName2 union all select NodeID from cm_vip where vipname = inServerOrVipName2)
						and SubenvironmentID = 	(select SubEnvironmentID 
												from cm_subenvironment SEnv
												left join cm_environment E on senv.environmentID = e.environmentID
												left join cm_subenvironmenttype Styp on styp.subenvironmenttypeID = senv.subenvironmenttypeID
												where e.EnvironmentName = inEnvironmentName2
												and styp.subenvironmenttypename = inSubEnvTypeName2)
						and NodeIPAddress = inIP2)
-- and protocol = inprotocol
and (startport between instartport and inendport or endport between instartport and inendport)
) = 0 then

insert into cm_nodeiprelationship (PublishingNodeIPID, ConsumingNodeIPID,StartPort,EndPort,Protocol) values (
(select NodeIPID from cm_nodeip nip
left join cm_node_subenvironment nse on nip.nodesubid = nse.nodesubid
where NodeID = 			(select NodeID from cm_server where servername = inServerOrVipName1 union all select NodeID from cm_vip where vipname = inServerOrVipName1)
and SubenvironmentID = 	(select SubEnvironmentID 
						from cm_subenvironment SEnv
						left join cm_environment E on senv.environmentID = e.environmentID
						left join cm_subenvironmenttype Styp on styp.subenvironmenttypeID = senv.subenvironmenttypeID
						where e.EnvironmentName = inEnvironmentName1
						and styp.subenvironmenttypename = inSubEnvTypeName1)
and NodeIPAddress = inIP1) 
,
(
select NodeIPID from cm_nodeip nip
left join cm_node_subenvironment nse on nip.nodesubid = nse.nodesubid
where NodeID = 			(select NodeID from cm_server where servername = inServerOrVipName2 union all select NodeID from cm_vip where vipname = inServerOrVipName2)
and SubenvironmentID = 	(select SubEnvironmentID 
						from cm_subenvironment SEnv
						left join cm_environment E on senv.environmentID = e.environmentID
						left join cm_subenvironmenttype Styp on styp.subenvironmenttypeID = senv.subenvironmenttypeID
						where e.EnvironmentName = inEnvironmentName2
						and styp.subenvironmenttypename = inSubEnvTypeName2)
and NodeIPAddress = inIP2) 
, instartport 
, inendport 
, inprotocol)
;
else
	select 'Relationship (or Clash) Exists';
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddLeg` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddLeg`(inEnvironmentName varchar(50), inSubEnvTypeName varchar(50))
BEGIN  

IF ((select count(*)  
	from cm_subenvironment 
    where SubEnvironmentTypeID = (select SubEnvironmentTypeID from cm_subenvironmenttype where SubEnvironmentTypeName = inSubEnvTypeName)
    and environmentID = (select environmentID from cm_environment where EnvironmentName = inEnvironmentName )
    ) 
    = 0) THEN
	insert into cm_subenvironment (SubEnvironmentTypeID, environmentID) values (
	(select SubEnvironmentTypeID from cm_subenvironmenttype where SubEnvironmentTypeName = inSubEnvTypeName)
	,
	(select environmentID from cm_environment where EnvironmentName = inEnvironmentName )
	);
else
	select 'Leg Exists';
End if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddServer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddServer`(inServerName varchar(50), inEnvironmentName varchar(50), inSubEnvTypeName varchar(50), inServerTypeID bigint)
BEGIN   

IF ((select count(*) from cm_server where servername = inServerName) = 0) THEN
	Insert into cm_node (NodeType) values ('Server');
	Insert into cm_server (servername, servertypeid, nodeid) values (inServerName, inServerTypeID, (select max(nodeid) from cm_node));
else
	Select 'Server existed';
END IF;

IF (
	(select count(*) 
    from cm_node_subenvironment 
    where NodeID = 		(select NodeID from cm_server where servername = inServerName)
	and SubenvironmentID = 	(select SubEnvironmentID 
							from cm_subenvironment SEnv
							left join cm_environment E on senv.environmentID = e.environmentID
							left join cm_subenvironmenttype Styp on styp.subenvironmenttypeID = senv.subenvironmenttypeID
							where e.EnvironmentName = inEnvironmentName
							and styp.subenvironmenttypename = inSubEnvTypeName)
	)
	=0) THEN
	insert into cm_node_subenvironment (NodeID, SubEnvironmentID) values
	(
		(
        select NodeID from cm_server where servername = inServerName
        )
        ,(
        select SubEnvironmentID 
		from cm_subenvironment SEnv
		left join cm_environment E on senv.environmentID = e.environmentID
		left join cm_subenvironmenttype Styp on styp.subenvironmenttypeID = senv.subenvironmenttypeID
		where e.EnvironmentName = inEnvironmentName
		and styp.subenvironmenttypename = inSubEnvTypeName
		)
	);
ELSE
	Select 'Server link existed';
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddServerAndIP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddServerAndIP`(inServerName varchar(50), inEnvironmentName varchar(50), inSubEnvTypeName varchar(50), inServerTypeID bigint, inIPAddr varchar(50), inIPTypeName varchar(50))
BEGIN


IF ((select count(*) from cm_server where servername = inServerName) = 0) THEN
	Insert into cm_node (NodeType) values ('Server');
	Insert into cm_server (servername, servertypeid, nodeid) values (inServerName, inServerTypeID, (select max(nodeid) from cm_node));
else
	Select 'Server existed';
END IF;

IF (
	(select count(*) 
    from cm_node_subenvironment 
    where NodeID = 		(select NodeID from cm_server where servername = inServerName)
	and SubenvironmentID = 	(select SubEnvironmentID 
							from cm_subenvironment SEnv
							left join cm_environment E on senv.environmentID = e.environmentID
							left join cm_subenvironmenttype Styp on styp.subenvironmenttypeID = senv.subenvironmenttypeID
							where e.EnvironmentName = inEnvironmentName
							and styp.subenvironmenttypename = inSubEnvTypeName)
	)
	=0) THEN
	insert into cm_node_subenvironment (NodeID, SubEnvironmentID) values
	(
		(
        select NodeID from cm_server where servername = inServerName
        )
        ,(
        select SubEnvironmentID 
		from cm_subenvironment SEnv
		left join cm_environment E on senv.environmentID = e.environmentID
		left join cm_subenvironmenttype Styp on styp.subenvironmenttypeID = senv.subenvironmenttypeID
		where e.EnvironmentName = inEnvironmentName
		and styp.subenvironmenttypename = inSubEnvTypeName
		)
	);
ELSE
	Select 'Server link existed';
END IF;

IF(		(
		select 	count(*) 
		from 	cm_nodeIP 
		where 	nodesubid = 	(select 	NodeSubID 
								from 	cm_node_subenvironment
								where 	NodeID = 			(select nodeid from cm_Server where servername = inServerName)
								and 	SubEnvironmentID = 	(select SubEnvironmentID 
															from cm_subenvironment SEnv
															left join cm_environment E on senv.environmentID = e.environmentID
															left join cm_subenvironmenttype Styp on styp.subenvironmenttypeID = senv.subenvironmenttypeID
															where e.EnvironmentName = inEnvironmentName
															and styp.subenvironmenttypename = inSubEnvTypeName
															)
								)
		and nodeipaddress = inIPAddr
		and nodeiptype = inIPTypeName
		) = 0) THEN
        
    insert into cm_nodeIP (nodesubid, nodeipaddress, nodeiptype) 
    values(
			(select 	NodeSubID 
			from 	cm_node_subenvironment
			where 	NodeID = 			(select nodeid from cm_Server where servername = inServerName)
			and 	SubEnvironmentID = 	(select SubEnvironmentID 
										from cm_subenvironment SEnv
										left join cm_environment E on senv.environmentID = e.environmentID
										left join cm_subenvironmenttype Styp on styp.subenvironmenttypeID = senv.subenvironmenttypeID
										where e.EnvironmentName = inEnvironmentName
										and styp.subenvironmenttypename = inSubEnvTypeName
										)
			)
		,    inIPAddr
		,    inIPTypeName
		);
else
	Select 'IP existed' ;	
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddVIP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddVIP`(inVIPName varchar(50), inEnvironmentName varchar(50), inSubEnvTypeName varchar(50))
BEGIN   

IF ((select count(*) from cm_vip where vipname = inVIPName) = 0) THEN
	Insert into cm_node (NodeType) values ('VIP');
	Insert into cm_vip (vipname, nodeid) values (inVIPName,  (select max(nodeid) from cm_node));
else
	Select 'VIP existed';
END IF;

IF (
	(select count(*) 
    from cm_node_subenvironment 
    where NodeID = 		(select NodeID from cm_vip where vipname = inVIPName)
	and SubenvironmentID = 	(select SubEnvironmentID 
							from cm_subenvironment SEnv
							left join cm_environment E on senv.environmentID = e.environmentID
							left join cm_subenvironmenttype Styp on styp.subenvironmenttypeID = senv.subenvironmenttypeID
							where e.EnvironmentName = inEnvironmentName
							and styp.subenvironmenttypename = inSubEnvTypeName)
	)
	=0) THEN
	insert into cm_node_subenvironment (nodeID, subenvironmentID) values
	(
		(
        select NodeID from cm_vip where vipname = inVIPName
        )
        ,(
        select SubEnvironmentID 
		from cm_subenvironment SEnv
		left join cm_environment E on senv.environmentID = e.environmentID
		left join cm_subenvironmenttype Styp on styp.subenvironmenttypeID = senv.subenvironmenttypeID
		where e.EnvironmentName = inEnvironmentName
		and styp.subenvironmenttypename = inSubEnvTypeName
		)
	);
ELSE
	Select 'VIP link existed';
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddVIPAndIP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddVIPAndIP`(inVIPName varchar(50), inEnvironmentName varchar(50), inSubEnvTypeName varchar(50), inIPAddr varchar(50), inIPTypeName varchar(50))
BEGIN

IF ((select count(*) from cm_vip where vipname = inVIPName) = 0) THEN
	Insert into cm_node (NodeType) values ('VIP');
	Insert into cm_vip (vipname, nodeid) values (inVIPName,  (select max(nodeid) from cm_node));
else
	Select 'VIP existed';
END IF;

IF (
	(select count(*) 
    from cm_node_subenvironment 
    where NodeID = 		(select NodeID from cm_vip where vipname = inVIPName)
	and SubenvironmentID = 	(select SubEnvironmentID 
							from cm_subenvironment SEnv
							left join cm_environment E on senv.environmentID = e.environmentID
							left join cm_subenvironmenttype Styp on styp.subenvironmenttypeID = senv.subenvironmenttypeID
							where e.EnvironmentName = inEnvironmentName
							and styp.subenvironmenttypename = inSubEnvTypeName)
	)
	=0) THEN
	insert into cm_node_subenvironment (nodeID, subenvironmentID) values
	(
		(
        select NodeID from cm_vip where vipname = inVIPName
        )
        ,(
        select SubEnvironmentID 
		from cm_subenvironment SEnv
		left join cm_environment E on senv.environmentID = e.environmentID
		left join cm_subenvironmenttype Styp on styp.subenvironmenttypeID = senv.subenvironmenttypeID
		where e.EnvironmentName = inEnvironmentName
		and styp.subenvironmenttypename = inSubEnvTypeName
		)
	);
ELSE
	Select 'VIP link existed';
END IF;


IF(		(
		select 	count(*) 
		from 	cm_nodeIP 
		where 	nodesubid = 	(select 	NodeSubID 
								from 	cm_node_subenvironment
								where 	NodeID = 			(select nodeid from cm_VIP where VIPname = inVIPName)
								and 	SubEnvironmentID = 	(select SubEnvironmentID 
															from cm_subenvironment SEnv
															left join cm_environment E on senv.environmentID = e.environmentID
															left join cm_subenvironmenttype Styp on styp.subenvironmenttypeID = senv.subenvironmenttypeID
															where e.EnvironmentName = inEnvironmentName
															and styp.subenvironmenttypename = inSubEnvTypeName
															)
								)
		and nodeipaddress = inIPAddr
		and nodeiptype = inIPTypeName
		) = 0) THEN
        
    insert into cm_nodeIP (nodesubid, nodeipaddress, nodeiptype) 
    values(
			(select 	NodeSubID 
			from 	cm_node_subenvironment
			where 	NodeID = 			(select nodeid from cm_vip where VIPname = inVIPName)
			and 	SubEnvironmentID = 	(select SubEnvironmentID 
										from cm_subenvironment SEnv
										left join cm_environment E on senv.environmentID = e.environmentID
										left join cm_subenvironmenttype Styp on styp.subenvironmenttypeID = senv.subenvironmenttypeID
										where e.EnvironmentName = inEnvironmentName
										and styp.subenvironmenttypename = inSubEnvTypeName
										)
			)
		,    inIPAddr
		,    inIPTypeName
		);
else
	Select 'IP existed' ;	
end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AssignIP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AssignIP`(inServerName varchar(50), inEnvironmentName varchar(50), inSubEnvTypeName varchar(50), inIPAddr varchar(50), inIPTypeName varchar(50))
BEGIN   

IF(		(
		select 	count(*) 
		from 	cm_nodeIP 
		where 	nodesubid = 	(select 	NodeSubID 
								from 	cm_node_subenvironment
								where 	NodeID = 			(select nodeid from cm_Server where servername = inServerName)
								and 	SubEnvironmentID = 	(select SubEnvironmentID 
															from cm_subenvironment SEnv
															left join cm_environment E on senv.environmentID = e.environmentID
															left join cm_subenvironmenttype Styp on styp.subenvironmenttypeID = senv.subenvironmenttypeID
															where e.EnvironmentName = inEnvironmentName
															and styp.subenvironmenttypename = inSubEnvTypeName
															)
								)
		and nodeipaddress = inIPAddr
		and nodeiptype = inIPTypeName
		) = 0) THEN
        
    insert into cm_nodeIP (nodesubid, nodeipaddress, nodeiptype) 
    values(
			(select 	NodeSubID 
			from 	cm_node_subenvironment
			where 	NodeID = 			(select nodeid from cm_Server where servername = inServerName)
			and 	SubEnvironmentID = 	(select SubEnvironmentID 
										from cm_subenvironment SEnv
										left join cm_environment E on senv.environmentID = e.environmentID
										left join cm_subenvironmenttype Styp on styp.subenvironmenttypeID = senv.subenvironmenttypeID
										where e.EnvironmentName = inEnvironmentName
										and styp.subenvironmenttypename = inSubEnvTypeName
										)
			)
		,    inIPAddr
		,    inIPTypeName
		);
else
	Select 'IP existed' ;	
end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AssignServerIP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AssignServerIP`(inServerName varchar(50), inEnvironmentName varchar(50), inSubEnvTypeName varchar(50), inIPAddr varchar(50), inIPTypeName varchar(50))
BEGIN   

IF(		(
		select 	count(*) 
		from 	cm_nodeIP 
		where 	nodesubid = 	(select 	NodeSubID 
								from 	cm_node_subenvironment
								where 	NodeID = 			(select nodeid from cm_Server where servername = inServerName)
								and 	SubEnvironmentID = 	(select SubEnvironmentID 
															from cm_subenvironment SEnv
															left join cm_environment E on senv.environmentID = e.environmentID
															left join cm_subenvironmenttype Styp on styp.subenvironmenttypeID = senv.subenvironmenttypeID
															where e.EnvironmentName = inEnvironmentName
															and styp.subenvironmenttypename = inSubEnvTypeName
															)
								)
		and nodeipaddress = inIPAddr
		and nodeiptype = inIPTypeName
		) = 0) THEN
        
    insert into cm_nodeIP (nodesubid, nodeipaddress, nodeiptype) 
    values(
			(select 	NodeSubID 
			from 	cm_node_subenvironment
			where 	NodeID = 			(select nodeid from cm_Server where servername = inServerName)
			and 	SubEnvironmentID = 	(select SubEnvironmentID 
										from cm_subenvironment SEnv
										left join cm_environment E on senv.environmentID = e.environmentID
										left join cm_subenvironmenttype Styp on styp.subenvironmenttypeID = senv.subenvironmenttypeID
										where e.EnvironmentName = inEnvironmentName
										and styp.subenvironmenttypename = inSubEnvTypeName
										)
			)
		,    inIPAddr
		,    inIPTypeName
		);
else
	Select 'IP existed' ;	
end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AssignVIPIP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AssignVIPIP`(inVIPName varchar(50), inEnvironmentName varchar(50), inSubEnvTypeName varchar(50), inIPAddr varchar(50), inIPTypeName varchar(50))
BEGIN   

IF(		(
		select 	count(*) 
		from 	cm_nodeIP 
		where 	nodesubid = 	(select 	NodeSubID 
								from 	cm_node_subenvironment
								where 	NodeID = 			(select nodeid from cm_VIP where VIPname = inVIPName)
								and 	SubEnvironmentID = 	(select SubEnvironmentID 
															from cm_subenvironment SEnv
															left join cm_environment E on senv.environmentID = e.environmentID
															left join cm_subenvironmenttype Styp on styp.subenvironmenttypeID = senv.subenvironmenttypeID
															where e.EnvironmentName = inEnvironmentName
															and styp.subenvironmenttypename = inSubEnvTypeName
															)
								)
		and nodeipaddress = inIPAddr
		and nodeiptype = inIPTypeName
		) = 0) THEN
        
    insert into cm_nodeIP (nodesubid, nodeipaddress, nodeiptype) 
    values(
			(select 	NodeSubID 
			from 	cm_node_subenvironment
			where 	NodeID = 			(select nodeid from cm_vip where VIPname = inVIPName)
			and 	SubEnvironmentID = 	(select SubEnvironmentID 
										from cm_subenvironment SEnv
										left join cm_environment E on senv.environmentID = e.environmentID
										left join cm_subenvironmenttype Styp on styp.subenvironmenttypeID = senv.subenvironmenttypeID
										where e.EnvironmentName = inEnvironmentName
										and styp.subenvironmenttypename = inSubEnvTypeName
										)
			)
		,    inIPAddr
		,    inIPTypeName
		);
else
	Select 'IP existed' ;	
end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetHiera` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetHiera`()
BEGIN   
	DECLARE EnvTag VARCHAR(50) DEFAULT '{ENVID}';
    DECLARE ServTypeTag VARCHAR(50) DEFAULT '{ServType}';
    DECLARE AppTag VARCHAR(50) DEFAULT '{AppName}';
    DECLARE ReleaseTag VARCHAR(50) DEFAULT '{Release}';
    Declare ParamNameTag VARCHAR(50) DEFAULT '{ParamName}';
    Declare LegTag VARCHAR(50) DEFAULT '{LegName}';
    -- DECLARE mystart  INT unsigned DEFAULT 1;  
    -- DECLARE myfinish INT unsigned DEFAULT 10;

    -- SELECT  mystart, myfinish;
	select 		replace(g.globalConfigHieraAddress,ParamNameTag,g.globalConfigParameter) 	as 'HieraAddress'
    , 			g.globalConfigValue 		as 'HieraValue'
    from 		cm_globalconfig	g
    where 		recursivebyenv <> 1
    and 		recursivebysubenv <> 1
    and 		recursivebyrel <> 1
	union all
	select 		replace(replace(g.globalConfigHieraAddress,ParamNameTag,g.globalConfigParameter),envtag,e.environmentname) 	as 'HieraAddress'
    , 			g.globalConfigValue 		as 'HieraValue'
    from 		cm_globalconfig	g
    left join 	cm_environment e on e.environmentname is not null
    where 		recursivebyenv = 1
	union all
	select 		replace(replace(replace(g.globalConfigHieraAddress,ParamNameTag,g.globalConfigParameter),LegTag,styp.subenvironmenttypename),envtag,e.environmentname) 	as 'HieraAddress'
    , 			g.globalConfigValue 		as 'HieraValue'
    from 		cm_globalconfig	g
    left join 	cm_subenvironment se on se.subenvironmentid is not null
    left join 	cm_environment e on se.environmentID = e.environmentID
    left join 	cm_subenvironmentType styp on styp.subenvironmenttypeid = se.subenvironmenttypeid
    where 		recursivebysubenv = 1
	union all
	select 		replace(replace(g.globalConfigHieraAddress,ParamNameTag,g.globalConfigParameter),ReleaseTag,r.releasename) 	as 'HieraAddress'
    , 			g.globalConfigValue 		as 'HieraValue'
    from 		cm_globalconfig	g
    left join 	cm_release r on r.releaseid is not null
    where 		recursivebyRel = 1
	union all
    select 		replace(replace(ec.subEnvConfigHieraAddress,ParamNameTag,ec.subEnvConfigParameter), envtag, e.environmentName) 	as 'HieraAddress'
    , 			replace(ec.subEnvConfigValue, EnvTag, e.environmentname)	as 'HieraValue' 
    from 		cm_environment 	e
    left join	cm_subenvironment se on se.environmentid = e.environmentid
	left join 	cm_subenvironmentconfig ec on se.subenvironmentid = ec.subenvironmentid
	union all
	select 		replace(replace(replace(sc.ServConfigHieraAddress, servtypetag, st.servertypename),EnvTag,e.environmentname),ParamNameTag,sc.ServConfigParameter)	as 'HieraAddress'
    , 			sc.ServConfigValue 																						as 'HieraValue'
    from 		cm_environment 	e
    left join	cm_subenvironment subE on subE.environmentid = e.environmentid
	-- left join 	cm_server_subenvironment sse on subE.subenvironmentid = sse.subenvironmentid
    left join 	cm_node_subenvironment nse on subE.subenvironmentid = nse.subenvironmentid
    left join	cm_node 		n	on n.nodeid = nse.nodeid
    left join 	cm_server 		s	on nse.nodeid = s.nodeid
	-- left join 	cm_server 		s	on sse.serverid = s.serverid
	left join 	cm_servertype 	st	on s.servertypeid = st.servertypeid
	left join 	cm_serverconfig sc 	on s.serverid = sc.serverid
	union all
	select replace(replace(replace(replace(replace(cc.CompConfigHieraAddress, AppTag, c.componentName), ReleaseTag, r.releasename), EnvTag, e.environmentname), servtypetag, st.servertypename),ParamNameTag,cc.CompConfigParameter) as 'HieraAddress'
    , cc.CompConfigValue as 'HieraValue'
    from 		cm_environment e
    left join	cm_subenvironment subE on e.environmentid = sube.environmentid
	left join 	cm_release r 		on sube.releaseid = r.releaseid
	left join 	cm_package p 		on r.releaseid = p.releaseid
    left join	cm_servertype st	on p.servertypeID = st.servertypeid
	left join 	cm_component c 		on p.packageid = c.packageid
	left join 	cm_componentconfig cc on c.componentid = cc.componentID
    union all
    select		replace(replace(rc.relconfigHieraAddress,ParamNameTag,rc.relconfigparameter), ReleaseTag,r.releasename) as 'HieraAddress'
    ,			rc.relconfigvalue  as 'HieraValue'
    from		cm_release r
    left join	cm_releaseconfig rc on rc.releaseid = r.releaseID
    where 		recursivebyenv <> 1
    and 		recursivebysubenv <> 1
	union all
    select		replace(replace(replace(rc.relconfigHieraAddress,ParamNameTag,rc.relconfigparameter), ReleaseTag,r.releasename),envtag,e.environmentname) as 'HieraAddress'
    ,			rc.relconfigvalue  as 'HieraValue'
    from		cm_release r
    left join	cm_releaseconfig rc on rc.releaseid = r.releaseID
    left join 	cm_subenvironment se on se.releaseid  = r.releaseID
    left join 	cm_environment e on se.environmentID = e.environmentID
    where 		recursivebyenv = 1
	union all
    select		replace(replace(replace(replace(rc.relconfigHieraAddress,ParamNameTag,rc.relconfigparameter), ReleaseTag,r.releasename),LegTag,styp.subenvironmenttypename),envtag,e.environmentname) as 'HieraAddress'
    ,			rc.relconfigvalue  as 'HieraValue'
    from		cm_release r
    left join	cm_releaseconfig rc on rc.releaseid = r.releaseID
	left join 	cm_subenvironment se on se.releaseid  = r.releaseID
    left join 	cm_environment e on se.environmentID = e.environmentID
    left join 	cm_subenvironmentType styp on styp.subenvironmenttypeid = se.subenvironmenttypeid
    where 		recursivebysubenv = 1
	;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetHieraByEnvironment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetHieraByEnvironment`(EnvironmentName varchar(50))
BEGIN   
	DECLARE EnvTag VARCHAR(50) DEFAULT '{ENVID}';
    DECLARE ServTypeTag VARCHAR(50) DEFAULT '{ServType}';
    DECLARE AppTag VARCHAR(50) DEFAULT '{AppName}';
    DECLARE ReleaseTag VARCHAR(50) DEFAULT '{Release}';
    Declare ParamNameTag VARCHAR(50) DEFAULT '{ParamName}';
    Declare LegTag VARCHAR(50) DEFAULT '{LegName}';


	select 	replace(g.globalConfigHieraAddress,ParamNameTag,g.globalConfigParameter) 	as 'HieraAddress'
    , 		g.globalConfigValue 		as 'HieraValue'
    from 	cm_globalconfig	g
    where 		recursivebyenv <> 1
    and 		recursivebysubenv <> 1
    and 		recursivebyrel <> 1
	union all
	select 		replace(replace(g.globalConfigHieraAddress,ParamNameTag,g.globalConfigParameter),envtag,e.environmentname) 	as 'HieraAddress'
    , 			g.globalConfigValue 		as 'HieraValue'
    from 		cm_globalconfig	g
    left join 	cm_environment e on e.environmentname is not null
    where 		recursivebyenv = 1
    and 		e.environmentname = EnvironmentName
	union all
	select 		replace(replace(replace(g.globalConfigHieraAddress,ParamNameTag,g.globalConfigParameter),LegTag,styp.subenvironmenttypename),envtag,e.environmentname) 	as 'HieraAddress'
    , 			g.globalConfigValue 		as 'HieraValue'
    from 		cm_globalconfig	g
    left join 	cm_subenvironment se on se.subenvironmentid is not null
    left join 	cm_environment e on se.environmentID = e.environmentID
    left join 	cm_subenvironmentType styp on styp.subenvironmenttypeid = se.subenvironmenttypeid
    where 		recursivebysubenv = 1
    and 		e.environmentname = EnvironmentName
	union all
	select 		replace(replace(g.globalConfigHieraAddress,ParamNameTag,g.globalConfigParameter),ReleaseTag,r.releasename) 	as 'HieraAddress'
    , 			g.globalConfigValue 		as 'HieraValue'
    from 		cm_globalconfig	g
    left join 	cm_release r on r.releaseid is not null
    where 		recursivebyRel = 1
    and 		e.environmentname = EnvironmentName
	union all
    select 		replace(replace(ec.subEnvConfigHieraAddress,ParamNameTag,ec.subEnvConfigParameter), envtag, e.environmentName) 	as 'HieraAddress'
    , 			replace(ec.subEnvConfigValue, EnvTag, e.environmentname)	as 'HieraValue' 
    from 		cm_environment 	e
    left join	cm_subenvironment se on se.environmentid = e.environmentid
	left join 	cm_subenvironmentconfig ec on se.subenvironmentid = ec.subenvironmentid
    where 		e.environmentname = EnvironmentName
	union all
	select 		replace(replace(replace(sc.ServConfigHieraAddress, servtypetag, st.servertypename),EnvTag,e.environmentname),ParamNameTag,sc.ServConfigParameter)	as 'HieraAddress'
    , 			sc.ServConfigValue 																						as 'HieraValue'
    from 		cm_environment 	e
    left join	cm_subenvironment subE on subE.environmentid = e.environmentid
    	-- left join 	cm_server_subenvironment sse on subE.subenvironmentid = sse.subenvironmentid
    left join 	cm_node_subenvironment nse on subE.subenvironmentid = nse.subenvironmentid
    left join	cm_node 		n	on n.nodeid = nse.nodeid
    left join 	cm_server 		s	on nse.nodeid = s.nodeid
	-- left join 	cm_server 		s	on sse.serverid = s.serverid
	left join 	cm_servertype 	st	on s.servertypeid = st.servertypeid
	left join 	cm_serverconfig sc 	on s.serverid = sc.serverid
    where 		e.environmentname = EnvironmentName
	union all
	select replace(replace(replace(replace(replace(cc.CompConfigHieraAddress, AppTag, c.componentName), ReleaseTag, r.releasename), EnvTag, e.environmentname), servtypetag, st.servertypename),ParamNameTag,cc.CompConfigParameter) as 'HieraAddress'
    , cc.CompConfigValue as 'HieraValue'
    from 		cm_environment e
    left join	cm_subenvironment subE on e.environmentid = sube.environmentid
	left join 	cm_release r 		on sube.releaseid = r.releaseid
	left join 	cm_package p 		on r.releaseid = p.releaseid
    left join	cm_servertype st	on p.servertypeID = st.servertypeid
	left join 	cm_component c 		on p.packageid = c.packageid
	left join 	cm_componentconfig cc on c.componentid = cc.componentID
    where 		e.environmentname = EnvironmentName
	union all
    select		replace(replace(rc.relconfigHieraAddress,ParamNameTag,rc.relconfigparameter), ReleaseTag,r.releasename) as 'HieraAddress'
    ,			rc.relconfigvalue  as 'HieraValue'
    from		cm_environment e 
	left join	cm_subenvironment subE on e.environmentid = sube.environmentid
    left join 	cm_release r on sube.releaseid = r.releaseid 
    left join	cm_releaseconfig rc on rc.releaseid = r.releaseID
    where 		e.environmentname = EnvironmentName
    and 		recursivebyenv <> 1
    and 		recursivebysubenv <> 1
	union all
    select		replace(replace(replace(rc.relconfigHieraAddress,ParamNameTag,rc.relconfigparameter), ReleaseTag,r.releasename),envtag,e.environmentname) as 'HieraAddress'
    ,			rc.relconfigvalue  as 'HieraValue'
    from		cm_release r
    left join		cm_releaseconfig rc on rc.releaseid = r.releaseID
    left join 		cm_subenvironment se on se.releaseid  = r.releaseID
    left join 		cm_environment e on se.environmentID = e.environmentID
    where 		recursivebyenv = 1
    and 		e.environmentname = EnvironmentName
	union all
    select		replace(replace(replace(replace(rc.relconfigHieraAddress,ParamNameTag,rc.relconfigparameter), ReleaseTag,r.releasename),LegTag,styp.subenvironmenttypename),envtag,e.environmentname) as 'HieraAddress'
    ,			rc.relconfigvalue  as 'HieraValue'
    from		cm_release r
    left join	cm_releaseconfig rc on rc.releaseid = r.releaseID
    left join 	cm_subenvironment se on se.releaseid  = r.releaseID
    left join 	cm_environment e on se.environmentID = e.environmentID
    left join 	cm_subenvironmentType styp on styp.subenvironmenttypeid = se.subenvironmenttypeid
    where 		recursivebysubenv = 1
    and 		e.environmentname = EnvironmentName
	;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetHieraByRelease` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetHieraByRelease`(ReleaseName varchar(50))
BEGIN   
	DECLARE EnvTag VARCHAR(50) DEFAULT '{ENVID}';
    DECLARE ServTypeTag VARCHAR(50) DEFAULT '{ServType}';
    DECLARE AppTag VARCHAR(50) DEFAULT '{AppName}';
    DECLARE ReleaseTag VARCHAR(50) DEFAULT '{Release}';
    Declare ParamNameTag VARCHAR(50) DEFAULT '{ParamName}';
	
    select 	replace(g.globalConfigHieraAddress,ParamNameTag,g.globalConfigParameter) 	as 'HieraAddress'
    , 		g.globalConfigValue 		as 'HieraValue'
    from 	cm_globalconfig	g
	union all
    select 		replace(replace(ec.subEnvConfigHieraAddress,ParamNameTag,ec.subEnvConfigParameter), envtag, e.environmentName) 	as 'HieraAddress'
    , 			replace(ec.subEnvConfigValue, EnvTag, e.environmentname)	as 'HieraValue'  
    from 		cm_environment 	e
    left join	cm_subenvironment se on se.environmentid = e.environmentid
	left join 	cm_subenvironmentconfig ec on se.subenvironmentid = ec.subenvironmentid
    left join	cm_release 	r			on se.releaseID = r.releaseID
    where 		r.releasename = ReleaseName
	union all
	select 		replace(replace(replace(sc.ServConfigHieraAddress, servtypetag, st.servertypename),EnvTag,e.environmentname),ParamNameTag,sc.ServConfigParameter)	as 'HieraAddress'
    , 			sc.ServConfigValue 																						as 'HieraValue'
    from 		cm_environment 	e
    left join	cm_subenvironment subE on subE.environmentid = e.environmentid
	-- left join 	cm_server_subenvironment sse on subE.subenvironmentid = sse.subenvironmentid
    left join 	cm_node_subenvironment nse on subE.subenvironmentid = nse.subenvironmentid
    left join	cm_node 		n	on n.nodeid = nse.nodeid
    left join 	cm_server 		s	on nse.nodeid = s.nodeid
	-- left join 	cm_server 		s	on sse.serverid = s.serverid
	left join 	cm_servertype 	st	on s.servertypeid = st.servertypeid
	left join 	cm_serverconfig sc 	on s.serverid = sc.serverid
    left join	cm_release 		r	on sube.releaseID = r.releaseID
    where 		r.releasename = ReleaseName
	union all
	select replace(replace(replace(replace(replace(cc.CompConfigHieraAddress, AppTag, c.componentName), ReleaseTag, r.releasename), EnvTag, e.environmentname), servtypetag, st.servertypename),ParamNameTag,cc.CompConfigParameter) as 'HieraAddress'
    , cc.CompConfigValue as 'HieraValue'
    from 		cm_environment e
    left join	cm_subenvironment subE on e.environmentid = sube.environmentid
	left join 	cm_release r 		on sube.releaseid = r.releaseid
	left join 	cm_package p 		on r.releaseid = p.releaseid
    left join	cm_servertype st	on p.servertypeID = st.servertypeid
	left join 	cm_component c 		on p.packageid = c.packageid
	left join 	cm_componentconfig cc on c.componentid = cc.componentID
    where 		r.releasename = ReleaseName
	union all
    select		replace(replace(rc.relconfigHieraAddress,ParamNameTag,rc.relconfigparameter), ReleaseTag,r.releasename) as 'HieraAddress'
    ,			rc.relconfigvalue  as 'HieraValue'
    from		cm_release r 
    left join	cm_releaseconfig rc on rc.releaseid = r.releaseID
    where 		r.releasename = ReleaseName
	;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchAllConfig` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchAllConfig`(SearchText varchar(50))
begin

	select 	'Global' 					as 'Area'
    ,		g.globalconfigid				as 'ID'
    ,		g.globalConfigHieraAddress 	as 'HieraAddress'
    , 		g.globalConfigValue 		as 'HieraValue'
    ,		g.globalConfigParameter		as 'Parameter'
    , 		cast(g.RecursiveByRel as unsigned)			as 'RByRel'
    , 		cast(g.RecursiveByEnv as unsigned)			as 'RByEnv'
    , 		cast(g.RecursiveBySubEnv as unsigned)			as 'RBySubEnv'
    from 	cm_globalconfig	g
    where g.globalconfighieraaddress like concat ( '%', SearchText, '%')
    or g.globalConfigValue like concat ( '%', SearchText, '%')
    or g.globalConfigParameter like concat ( '%', SearchText, '%')
	union all
    select 		'SubEnv' 				as 'Area'
    ,		ec.subenvconfigid				as 'ID'
    , 		ec.subEnvConfigHieraAddress	as 'HieraAddress'
    , 		ec.subEnvConfigValue		as 'HieraValue' 
    ,		ec.subEnvConfigParameter	as 'Parameter'
	, 		'0'						as 'RByRel'
    , 		'0'						as 'RByEnv'
    , 		'0'						as 'RBySubEnv'
    from 		cm_subenvironmentconfig ec
	where ec.subEnvConfigHieraAddress like concat ( '%', SearchText, '%')
    or ec.subEnvConfigValue like concat ( '%', SearchText, '%')
    or ec.subEnvConfigParameter like concat ( '%', SearchText, '%')
	union all
	select 		'Server' 				as 'Area'
    ,		sc.servconfigid				as 'ID'
    ,		sc.ServConfigHieraAddress	as 'HieraAddress'
    , 		sc.ServConfigValue			as 'HieraValue'
    ,		sc.ServConfigParameter		as 'Parameter'
    , 		'0'						as 'RByRel'
    , 		'0'						as 'RByEnv'
    , 		'0'						as 'RBySubEnv'
    from 		cm_serverconfig sc
	where sc.ServConfigHieraAddress like concat ( '%', SearchText, '%')
    or sc.ServConfigValue like concat ( '%', SearchText, '%')
    or sc.ServConfigParameter like concat ( '%', SearchText, '%')
    union all
	select 	'Component' 				as 'Area'
    ,		cc.compconfigid				as 'ID'
    ,		cc.CompConfigHieraAddress	as 'HieraAddress'
    , 		cc.CompConfigValue 			as 'HieraValue'
    ,		cc.CompConfigParameter		as 'Parameter'
    , 		'0'						as 'RByRel'
    , 		'0'						as 'RByEnv'
    , 		'0'						as 'RBySubEnv'
    from 		cm_componentconfig cc
	where cc.CompConfigHieraAddress like concat ( '%', SearchText, '%')
    or cc.CompConfigValue like concat ( '%', SearchText, '%')
    or cc.CompConfigParameter like concat ( '%', SearchText, '%')
    union all
    select	'Release' 					as 'Area'
    ,		rc.relconfigid				as 'ID'
    ,		rc.relconfigHieraAddress 	as 'HieraAddress'
    ,		rc.relconfigvalue  			as 'HieraValue'
    ,		rc.relconfigparameter		as 'Parameter'
    , 		'0'						as 'RByRel'
    , 		cast(rc.RecursiveByEnv as unsigned)			as 'RByEnv'
    , 		cast(rc.RecursiveBySubEnv as unsigned)		as 'RBySubEnv'
    from		cm_releaseconfig rc
	where rc.relconfigHieraAddress like concat ( '%', SearchText, '%')
    or rc.relconfigvalue like concat ( '%', SearchText, '%')
    or rc.relconfigparameter like concat ( '%', SearchText, '%')
	;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchHiera` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchHiera`(SearchText varchar(50))
BEGIN
	DECLARE EnvTag VARCHAR(50) DEFAULT '{ENVID}';
    DECLARE ServTypeTag VARCHAR(50) DEFAULT '{ServType}';
    DECLARE AppTag VARCHAR(50) DEFAULT '{AppName}';
    DECLARE ReleaseTag VARCHAR(50) DEFAULT '{Release}';
    Declare ParamNameTag VARCHAR(50) DEFAULT '{ParamName}';
    -- DECLARE mystart  INT unsigned DEFAULT 1;  
    -- DECLARE myfinish INT unsigned DEFAULT 10;

    -- SELECT  mystart, myfinish;
	select 	'Global' as 'Area'
	,		g.globalconfigid				as 'ID'
    ,replace(g.globalConfigHieraAddress,ParamNameTag,g.globalConfigParameter) 	as 'HieraAddress'
    , 		g.globalConfigValue 		as 'HieraValue'
    from 	cm_globalconfig	g
    where g.globalconfighieraaddress like concat ( '%', SearchText, '%')
    or g.globalConfigValue like concat ( '%', SearchText, '%')
    or g.globalConfigParameter like concat ( '%', SearchText, '%')
	union all
    select 		'SubEnv' as 'Area'
	,		ec.subenvconfigid				as 'ID'
    ,replace(replace(ec.subEnvConfigHieraAddress,ParamNameTag,ec.subEnvConfigParameter), envtag, e.environmentName) 	as 'HieraAddress'
    , 			replace(ec.subEnvConfigValue, EnvTag, e.environmentname)	as 'HieraValue' 
    from 		cm_environment 	e
    left join	cm_subenvironment se on se.environmentid = e.environmentid
	left join 	cm_subenvironmentconfig ec on se.subenvironmentid = ec.subenvironmentid
	where ec.subEnvConfigHieraAddress like concat ( '%', SearchText, '%')
    or ec.subEnvConfigValue like concat ( '%', SearchText, '%')
    or ec.subEnvConfigParameter like concat ( '%', SearchText, '%')
	union all
	select 		'Server' as 'Area'
	,		sc.servconfigid				as 'ID'
    ,replace(replace(replace(sc.ServConfigHieraAddress, servtypetag, st.servertypename),EnvTag,e.environmentname),ParamNameTag,sc.ServConfigParameter)	as 'HieraAddress'
    , 			sc.ServConfigValue 																						as 'HieraValue'
    from 		cm_environment 	e
    left join	cm_subenvironment subE on subE.environmentid = e.environmentid
	-- left join 	cm_server_subenvironment sse on subE.subenvironmentid = sse.subenvironmentid
    left join 	cm_node_subenvironment nse on subE.subenvironmentid = nse.subenvironmentid
    left join	cm_node 		n	on n.nodeid = nse.nodeid
    left join 	cm_server 		s	on nse.nodeid = s.nodeid
	-- left join 	cm_server 		s	on sse.serverid = s.serverid
	left join 	cm_servertype 	st	on s.servertypeid = st.servertypeid
	left join 	cm_serverconfig sc 	on s.serverid = sc.serverid
	where sc.ServConfigHieraAddress like concat ( '%', SearchText, '%')
    or sc.ServConfigValue like concat ( '%', SearchText, '%')
    or sc.ServConfigParameter like concat ( '%', SearchText, '%')
    union all
	select 'Component' as 'Area'
    ,		cc.compconfigid				as 'ID'
    ,replace(replace(replace(replace(replace(cc.CompConfigHieraAddress, AppTag, c.componentName), ReleaseTag, r.releasename), EnvTag, e.environmentname), servtypetag, st.servertypename),ParamNameTag,cc.CompConfigParameter) as 'HieraAddress'
    , cc.CompConfigValue as 'HieraValue'
    from 		cm_environment e
    left join	cm_subenvironment subE on e.environmentid = sube.environmentid
	left join 	cm_release r 		on sube.releaseid = r.releaseid
	left join 	cm_package p 		on r.releaseid = p.releaseid
    left join	cm_servertype st	on p.servertypeID = st.servertypeid
	left join 	cm_component c 		on p.packageid = c.packageid
	left join 	cm_componentconfig cc on c.componentid = cc.componentID
	where cc.CompConfigHieraAddress like concat ( '%', SearchText, '%')
    or cc.CompConfigValue like concat ( '%', SearchText, '%')
    or cc.CompConfigParameter like concat ( '%', SearchText, '%')
    union all
    select		'Release' as 'Area'
    ,		rc.relconfigid				as 'ID'
    ,replace(replace(rc.relconfigHieraAddress,ParamNameTag,rc.relconfigparameter), ReleaseTag,r.releasename) as 'HieraAddress'
    ,			rc.relconfigvalue  as 'HieraValue'
    from		cm_release r
    left join	cm_releaseconfig rc on rc.releaseid = r.releaseID
	where rc.relconfigHieraAddress like concat ( '%', SearchText, '%')
    or rc.relconfigvalue like concat ( '%', SearchText, '%')
    or rc.relconfigparameter like concat ( '%', SearchText, '%')
	;
End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchUsedConfig` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchUsedConfig`(SearchText varchar(50))
begin

	select 	'Global' 					as 'Area'
    ,		g.globalconfigid				as 'ID'
    ,		g.globalConfigHieraAddress 	as 'HieraAddress'
    , 		g.globalConfigValue 		as 'HieraValue'
    ,		g.globalConfigParameter		as 'Parameter'
    , 		cast(g.RecursiveByRel as unsigned)			as 'RByRel'
    , 		cast(g.RecursiveByEnv as unsigned)			as 'RByEnv'
    , 		cast(g.RecursiveBySubEnv as unsigned)			as 'RBySubEnv'
    from 	cm_globalconfig	g
    where g.globalconfighieraaddress like concat ( '%', SearchText, '%')
    or g.globalConfigValue like concat ( '%', SearchText, '%')
    or g.globalConfigParameter like concat ( '%', SearchText, '%')
	union all
    select 		'SubEnv' 				as 'Area'
    ,		ec.subenvconfigid				as 'ID'
    , 		ec.subEnvConfigHieraAddress	as 'HieraAddress'
    , 		ec.subEnvConfigValue		as 'HieraValue' 
    ,		ec.subEnvConfigParameter	as 'Parameter'
	, 		'0'						as 'RByRel'
    , 		'0'						as 'RByEnv'
    , 		'0'						as 'RBySubEnv'
    from 		cm_environment 	e
    left join	cm_subenvironment se on se.environmentid = e.environmentid
	left join 	cm_subenvironmentconfig ec on se.subenvironmentid = ec.subenvironmentid
	where ec.subEnvConfigHieraAddress like concat ( '%', SearchText, '%')
    or ec.subEnvConfigValue like concat ( '%', SearchText, '%')
    or ec.subEnvConfigParameter like concat ( '%', SearchText, '%')
	union all
	select 		'Server' 				as 'Area'
    ,		sc.servconfigid				as 'ID'
    ,		sc.ServConfigHieraAddress	as 'HieraAddress'
    , 		sc.ServConfigValue			as 'HieraValue'
    ,		sc.ServConfigParameter		as 'Parameter'
    , 		'0'						as 'RByRel'
    , 		'0'						as 'RByEnv'
    , 		'0'						as 'RBySubEnv'
    from 		cm_environment 	e
    left join	cm_subenvironment subE on subE.environmentid = e.environmentid
	-- left join 	cm_server_subenvironment sse on subE.subenvironmentid = sse.subenvironmentid
    left join 	cm_node_subenvironment nse on subE.subenvironmentid = nse.subenvironmentid
    left join	cm_node 		n	on n.nodeid = nse.nodeid
    left join 	cm_server 		s	on nse.nodeid = s.nodeid
	-- left join 	cm_server 		s	on sse.serverid = s.serverid
	left join 	cm_servertype 	st	on s.servertypeid = st.servertypeid
	left join 	cm_serverconfig sc 	on s.serverid = sc.serverid
	where sc.ServConfigHieraAddress like concat ( '%', SearchText, '%')
    or sc.ServConfigValue like concat ( '%', SearchText, '%')
    or sc.ServConfigParameter like concat ( '%', SearchText, '%')
    union all
	select 	'Component' 				as 'Area'
    ,		cc.compconfigid				as 'ID'
    ,		cc.CompConfigHieraAddress	as 'HieraAddress'
    , 		cc.CompConfigValue 			as 'HieraValue'
    ,		cc.CompConfigParameter		as 'Parameter'
    , 		'0'						as 'RByRel'
    , 		'0'						as 'RByEnv'
    , 		'0'						as 'RBySubEnv'
    from 		cm_environment e
    left join	cm_subenvironment subE on e.environmentid = sube.environmentid
	left join 	cm_release r 		on sube.releaseid = r.releaseid
	left join 	cm_package p 		on r.releaseid = p.releaseid
    left join	cm_servertype st	on p.servertypeID = st.servertypeid
	left join 	cm_component c 		on p.packageid = c.packageid
	left join 	cm_componentconfig cc on c.componentid = cc.componentID
	where cc.CompConfigHieraAddress like concat ( '%', SearchText, '%')
    or cc.CompConfigValue like concat ( '%', SearchText, '%')
    or cc.CompConfigParameter like concat ( '%', SearchText, '%')
    union all
    select	'Release' 					as 'Area'
    ,		rc.relconfigid				as 'ID'
    ,		rc.relconfigHieraAddress 	as 'HieraAddress'
    ,		rc.relconfigvalue  			as 'HieraValue'
    ,		rc.relconfigparameter		as 'Parameter'
    , 		'0'						as 'RByRel'
    , 		cast(rc.RecursiveByEnv as unsigned)			as 'RByEnv'
    , 		cast(rc.RecursiveBySubEnv as unsigned)		as 'RBySubEnv'
    from		cm_release r
    left join	cm_releaseconfig rc on rc.releaseid = r.releaseID
	where rc.relconfigHieraAddress like concat ( '%', SearchText, '%')
    or rc.relconfigvalue like concat ( '%', SearchText, '%')
    or rc.relconfigparameter like concat ( '%', SearchText, '%')
	;

end ;;
DELIMITER ;

/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `environment_release_packages_view`
--

/*!50001 DROP VIEW IF EXISTS `environment_release_packages_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`ea_db_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `environment_release_packages_view` AS select `e`.`EnvironmentName` AS `EnvironmentName`,`styp`.`SubEnvironmentTypeName` AS `SubEnvironmentTypeName`,`st`.`ServerTypeName` AS `servertypename`,`r`.`ReleaseName` AS `Releasename`,`pt`.`PackageTypeName` AS `PackageTypeName`,`p`.`PackageName` AS `packagename`,`p`.`PackageVersion` AS `packageversion`,`c`.`ComponentName` AS `ComponentName` from (((((((`cm_subenvironment` `se` left join `cm_subenvironmenttype` `styp` on((`styp`.`SubEnvironmentTypeID` = `se`.`SubEnvironmentTypeID`))) left join `cm_environment` `e` on((`e`.`EnvironmentID` = `se`.`EnvironmentID`))) left join `cm_release` `r` on((`r`.`ReleaseID` = `se`.`ReleaseID`))) left join `cm_package` `p` on((`p`.`ReleaseID` = `r`.`ReleaseID`))) left join `cm_packagetype` `pt` on((`pt`.`PackageTypeID` = `p`.`PackageTypeID`))) left join `cm_component` `c` on((`c`.`PackageID` = `p`.`PackageID`))) left join `cm_servertype` `st` on((`st`.`ServerTypeID` = `p`.`ServerTypeID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `environment_release_view`
--

/*!50001 DROP VIEW IF EXISTS `environment_release_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `environment_release_view` AS select `et`.`EnvironmentTypeName` AS `environmenttypename`,`e`.`EnvironmentName` AS `EnvironmentName`,`styp`.`SubEnvironmentTypeName` AS `SubEnvironmentTypeName`,`r`.`ReleaseName` AS `ReleaseName` from ((((`cm_environment` `e` left join `cm_subenvironment` `se` on((`e`.`EnvironmentID` = `se`.`EnvironmentID`))) left join `cm_subenvironmenttype` `styp` on((`styp`.`SubEnvironmentTypeID` = `se`.`SubEnvironmentTypeID`))) left join `cm_environmenttype` `et` on((`e`.`EnvironmentTypeID` = `et`.`EnvironmentTypeID`))) left join `cm_release` `r` on((`r`.`ReleaseID` = `se`.`ReleaseID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `environment_server_view`
--

/*!50001 DROP VIEW IF EXISTS `environment_server_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `environment_server_view` AS select `e`.`EnvironmentName` AS `EnvironmentName`,`s`.`ServerName` AS `ServerName`,`st`.`ServerTypeName` AS `ServerTypeName` from (((((`cm_environment` `e` left join `cm_subenvironment` `sube` on((`sube`.`EnvironmentID` = `e`.`EnvironmentID`))) left join `cm_node_subenvironment` `nse` on((`sube`.`SubEnvironmentID` = `nse`.`SubEnvironmentID`))) left join `cm_node` `n` on((`n`.`NodeID` = `nse`.`NodeID`))) left join `cm_server` `s` on((`n`.`NodeID` = `s`.`NodeID`))) left join `cm_servertype` `st` on((`s`.`ServerTypeID` = `st`.`ServerTypeID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ip_environment_view`
--

/*!50001 DROP VIEW IF EXISTS `ip_environment_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`ea_db_admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `ip_environment_view` AS select `e`.`EnvironmentName` AS `EnvironmentName`,`styp`.`SubEnvironmentTypeName` AS `SubEnvironmentTypeName`,`r`.`ReleaseName` AS `Releasename`,(case when (`vip`.`VIPName` is not null) then `vip`.`VIPName` else `s`.`ServerName` end) AS `Name`,(case when (`vip`.`VIPName` is not null) then 'VIP' else `st`.`ServerTypeName` end) AS `Type`,`nip`.`NodeIPAddress` AS `NodeIPAddress`,`nip`.`NodeIPType` AS `NodeIPType`,`nip`.`NodeIPID` AS `nodeipid` from ((((((((`cm_node_subenvironment` `nse` left join `cm_nodeip` `nip` on((`nse`.`NodeSubID` = `nip`.`NodeSubID`))) left join `cm_server` `s` on((`s`.`NodeID` = `nse`.`NodeID`))) left join `cm_vip` `vip` on((`vip`.`NodeID` = `nse`.`NodeID`))) left join `cm_servertype` `st` on((`st`.`ServerTypeID` = `s`.`ServerTypeID`))) left join `cm_subenvironment` `se` on((`se`.`SubEnvironmentID` = `nse`.`SubEnvironmentID`))) left join `cm_subenvironmenttype` `styp` on((`styp`.`SubEnvironmentTypeID` = `se`.`SubEnvironmentTypeID`))) left join `cm_environment` `e` on((`e`.`EnvironmentID` = `se`.`EnvironmentID`))) left join `cm_release` `r` on((`r`.`ReleaseID` = `se`.`ReleaseID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `package_view`
--

/*!50001 DROP VIEW IF EXISTS `package_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `package_view` AS select `p`.`PackageID` AS `packageID`,`p`.`PackageName` AS `PackageName`,`pt`.`PackageTypeName` AS `PackageTypeName`,`st`.`ServerTypeName` AS `ServerTypeName`,`r`.`ReleaseName` AS `ReleaseName` from (((`cm_package` `p` left join `cm_packagetype` `pt` on((`p`.`PackageTypeID` = `pt`.`PackageTypeID`))) left join `cm_servertype` `st` on((`p`.`ServerTypeID` = `st`.`ServerTypeID`))) left join `cm_release` `r` on((`p`.`ReleaseID` = `r`.`ReleaseID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `release_contents_view`
--

/*!50001 DROP VIEW IF EXISTS `release_contents_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `release_contents_view` AS select `r`.`ReleaseName` AS `ReleaseName`,`pt`.`PackageTypeName` AS `PackageTypeName`,`p`.`PackageName` AS `PackageName`,`s`.`ServerTypeName` AS `ServerTypeName`,`c`.`ComponentName` AS `ComponentName` from ((((`cm_release` `r` left join `cm_package` `p` on((`r`.`ReleaseID` = `p`.`ReleaseID`))) left join `cm_servertype` `s` on((`p`.`ServerTypeID` = `s`.`ServerTypeID`))) left join `cm_packagetype` `pt` on((`p`.`PackageTypeID` = `pt`.`PackageTypeID`))) left join `cm_component` `c` on((`p`.`PackageID` = `c`.`PackageID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `releasedata_view`
--

/*!50001 DROP VIEW IF EXISTS `releasedata_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `releasedata_view` AS select `r`.`ReleaseName` AS `ReleaseName`,`rdt`.`DataTypeName` AS `DataTypeName`,`rd`.`ReleaseParam` AS `ReleaseParam`,`rd`.`ReleaseValue` AS `ReleaseValue` from ((`cm_release` `r` left join `cm_releasedata` `rd` on((`r`.`ReleaseID` = `rd`.`ReleaseID`))) left join `cm_releasedatatype` `rdt` on((`rd`.`DataTypeID` = `rdt`.`DataTypeID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `servertype_view`
--

/*!50001 DROP VIEW IF EXISTS `servertype_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `servertype_view` AS select `st`.`ServerTypeName` AS `ServerTypeName`,`s`.`ServerName` AS `ServerName`,`e`.`EnvironmentName` AS `EnvironmentName` from (((((`cm_servertype` `st` left join `cm_server` `s` on((`st`.`ServerTypeID` = `s`.`ServerTypeID`))) left join `cm_node` `n` on((`s`.`NodeID` = `s`.`NodeID`))) left join `cm_node_subenvironment` `nse` on((`s`.`NodeID` = `nse`.`NodeID`))) left join `cm_subenvironment` `sube` on((`sube`.`SubEnvironmentID` = `nse`.`SubEnvironmentID`))) left join `cm_environment` `e` on((`sube`.`EnvironmentID` = `e`.`EnvironmentID`))) */;
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

CREATE USER 'cmdb_app_user'@'localhost' IDENTIFIED BY 'auto_crud_user';
GRANT ALL PRIVILEGES ON *.* TO 'cmdb_app_user'@'localhost' WITH GRANT OPTION;
CREATE USER 'cmdb_app_user'@'%' IDENTIFIED BY 'auto_crud_user';
GRANT ALL PRIVILEGES ON *.* TO 'cmdb_app_user'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
COMMIT;
-- Dump completed on 2017-01-23  9:56:33
