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
  `ComponentName` varchar(255) NOT NULL,
  `PackageID` bigint(20) DEFAULT NULL,
  `Version` bigint(20) NOT NULL DEFAULT '0',
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
INSERT INTO `cm_component` VALUES (1,'Comp 1 - Bridge - 7.3.4 Package',2,4),(2,'Comp 2 - Bridge - 7.3.4 Package',2,0),(3,'Comp 1 - EAS - 7.3.4 Package',3,0),(4,'Comp 2 - EAS - 7.3.4 Package',3,0),(5,'Comp 1 - UIS - 7.3.4 Package',4,0),(6,'Comp 2 - UIS - 7.3.4 Package',4,0),(7,'Comp 1 - Bridge - 7.4.0 Package',5,0),(8,'Comp 2 - Bridge - 7.4.0 Package',5,0),(9,'Comp 1 - EAS - 7.4.0 Package',6,0),(10,'Comp 2 - EAS - 7.4.0 Package',6,0),(11,'Comp 1 - UIS - 7.4.0 Package',7,0),(12,'Comp 2 - UIS - 7.4.0 Package',7,0),(13,'Windows 2012',8,0),(14,'IIS',9,0),(15,'Oracle (Win)',10,0),(16,'RESIP DB',11,0);
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
  `CompConfigParameter` varchar(4096) DEFAULT NULL,
  `CompConfigValue` varchar(4096) DEFAULT NULL,
  `CompConfigHieraAddress` varchar(4096) DEFAULT NULL,
  `CompConfigNotes` varchar(4096) DEFAULT NULL,
  `CompConfigIsSensitive` bit(1) DEFAULT b'0',
  `Version` bigint(20) NOT NULL DEFAULT '0',
  `isArrayItem` bit(1) NOT NULL DEFAULT b'0',
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
INSERT INTO `cm_componentconfig` VALUES (1,1,'Param 1 - Comp 1 - Bridge - 7.3.4 Package','C1Param1Value','ROOT:{Release}:{ServType}:{AppName}:SettingC',NULL,'\0',15,'\0'),(2,1,'Param 2 - Comp 1 - Bridge - 7.3.4 Package','C1Param2Value','ROOT:{Release}:{ServType}:{AppName}:SettingB',NULL,'\0',0,'\0'),(3,2,'Param 1 - Comp 2 - Bridge - 7.3.4 Package','C2Param1Value','ROOT:{Release}:{ServType}:SettingC',NULL,'\0',0,'\0'),(4,2,'Param 2 - Comp 2 - Bridge - 7.3.4 Package','C2Param2Value','ROOT:{Release}:{ServType}:SettingD',NULL,'\0',0,'\0'),(5,3,'Param 1 - Comp 1 - EAS - 7.3.4 Package','C3Param1Value','ROOT:{Release}:{ServType}:SettingA',NULL,'\0',0,'\0'),(6,3,'Param 2 - Comp 1 - EAS - 7.3.4 Package','C3Param2Value','ROOT:{Release}:{ServType}:SettingB',NULL,'\0',0,'\0'),(7,4,'Param 1 - Comp 2 - EAS - 7.3.4 Package','C4Param1Value','ROOT:{Release}:{ServType}:SettingC',NULL,'\0',0,'\0'),(8,4,'Param 2 - Comp 2 - EAS - 7.3.4 Package','C4Param2Value','ROOT:{Release}:{ServType}:SettingD',NULL,'\0',0,'\0'),(9,5,'Param 1 - Comp 1 - UIS - 7.3.4 Package','C5Param1Value','ROOT:{Release}:{ServType}:{AppName}:SettingA',NULL,'\0',0,'\0'),(10,5,'Param 2 - Comp 1 - UIS - 7.3.4 Package','C5Param2Value','ROOT:{Release}:{ServType}:SettingB',NULL,'\0',0,'\0'),(11,6,'Param 1  -  Comp 2 - UIS - 7.3.4 Package','C6Param1Value','ROOT:{Release}:{ServType}:{AppName}:SettingC',NULL,'\0',0,'\0'),(12,6,'Param 2 - Comp 2 - UIS - 7.3.4 Package','C6Param2Value','ROOT:{Release}:{ServType}:SettingD',NULL,'\0',0,'\0'),(13,7,'Param 1 - Comp 1 - Bridge - 7.4.0 Package','C7Param1Value','ROOT:{Release}:{ServType}:SettingA',NULL,'\0',0,'\0'),(14,7,'Param 2 - Comp 1 - Bridge - 7.4.0 Package','C7Param2Value','ROOT:{Release}:{ServType}:SettingB',NULL,'\0',0,'\0'),(15,8,'Param 1 - Comp 2 - Bridge - 7.4.0 Package','C8Param1Value','ROOT:{Release}:{ServType}:{AppName}:SettingC',NULL,'\0',0,'\0'),(16,8,'Param 2 - Comp 2 - Bridge - 7.4.0 Package','C8Param2Value','ROOT:{Release}:{ServType}:SettingD',NULL,'\0',0,'\0'),(17,9,'Param 1 - Comp 1 - EAS - 7.4.0 Package','C9Param1Value','ROOT:{Release}:{ServType}:SettingA',NULL,'\0',0,'\0'),(18,9,'Param 2 - Comp 1 - EAS - 7.4.0 Package','C9Param2Value','ROOT:{Release}:{ServType}:SettingB',NULL,'\0',0,'\0'),(19,10,'Param 1 - Comp 2 - EAS - 7.4.0 Package','C10Param1Value','ROOT:{Release}:{ServType}:SettingC',NULL,'\0',0,'\0'),(20,10,'Param 2 - Comp 2 - EAS - 7.4.0 Package','C10Param2Value','ROOT:{Release}:{ServType}:SettingD',NULL,'\0',0,'\0'),(21,11,'Param 1 - Comp 1 - UIS - 7.4.0 Package','C11Param1Value','ROOT:{Release}:{ServType}:SettingA',NULL,'\0',0,'\0'),(22,11,'Param 2 - Comp 1 - UIS - 7.4.0 Package','C11Param2Value','ROOT:{Release}:{ServType}:SettingB',NULL,'\0',0,'\0'),(23,12,'Param 1 - Comp 2 - UIS - 7.4.0 Package','C12Param1Value','ROOT:{Release}:{ServType}:SettingC',NULL,'\0',0,'\0'),(24,12,'Param 2 - Comp 2 - UIS - 7.4.0 Package','C12Param2Value','ROOT:{Release}:{ServType}:SettingD',NULL,'\0',0,'\0');
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
  `EnvironmentName` varchar(255) NOT NULL,
  `EnvironmentTypeID` bigint(20) NOT NULL,
  `Version` bigint(20) NOT NULL DEFAULT '0',
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
INSERT INTO `cm_environment` VALUES (11,'FT1',1,0),(12,'FT2',1,0),(13,'FT3',1,0),(14,'FT4',1,0),(15,'FT5',1,0),(16,'IT1',2,0),(17,'IT2',2,0),(18,'IT3',2,0),(19,'IT4',2,0),(20,'IT5',2,0),(21,'ST1',4,0),(22,'TR1',5,0),(23,'TR2',5,0),(24,'UT1',6,0),(25,'UT2',6,0),(26,'PT1',4,0),(27,'PT2',4,0),(28,'PS1',7,0),(30,'PROD',3,0),(31,'TEST',1,0);
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
  `EnvironmentTypeName` varchar(255) NOT NULL,
  `Version` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`EnvironmentTypeID`),
  UNIQUE KEY `UQ_CM_EnvironmentType_EnvironmentTypeName` (`EnvironmentTypeName`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cm_environmenttype`
--

LOCK TABLES `cm_environmenttype` WRITE;
/*!40000 ALTER TABLE `cm_environmenttype` DISABLE KEYS */;
INSERT INTO `cm_environmenttype` VALUES (1,'Functional Test',0),(2,'Integration Test',0),(3,'Production',0),(4,'Performance Testing',0),(5,'Training',0),(6,'User Acceptance',0),(7,'Prod Support',0);
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
  `GlobalConfigParameter` varchar(4096) NOT NULL,
  `GlobalConfigValue` varchar(4096) DEFAULT NULL,
  `GlobalConfigHieraAddress` varchar(4096) DEFAULT NULL,
  `RecursiveByEnv` bit(1) NOT NULL DEFAULT b'0',
  `RecursiveByRel` bit(1) NOT NULL DEFAULT b'0',
  `RecursiveBySubEnv` bit(1) NOT NULL DEFAULT b'0',
  `GlobalConfigNotes` varchar(4096) DEFAULT NULL,
  `GlobalConfigIsSensitive` bit(1) DEFAULT b'0',
  `Version` bigint(20) NOT NULL DEFAULT '0',
  `isArrayItem` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`GlobalConfigID`)
) ENGINE=InnoDB AUTO_INCREMENT=1187 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cm_globalconfig`
--

LOCK TABLES `cm_globalconfig` WRITE;
/*!40000 ALTER TABLE `cm_globalconfig` DISABLE KEYS */;
INSERT INTO `cm_globalconfig` VALUES (72,'specpath','/root/spec','ROOT:{ParamName}','\0','\0','\0','','\0',0,'\0'),(73,'root_pass','{SENSITIVE}','ROOT:{ParamName}','\0','\0','\0','','',0,'\0'),(74,'repo_name','rhel-6.4-x86_64-puppet','ROOT:{ParamName}','\0','\0','\0','','\0',0,'\0'),(75,'repo_name','columbus-uk-boots','ROOT:{ParamName}','\0','\0','\0','','\0',0,'\0'),(76,'oneleonardo_jdk_release','1.6.0_37','ROOT:{ParamName}','\0','\0','\0','','\0',0,'\0'),(77,'oneleonardo_jboss_release','7.1.1.Final','ROOT:{ParamName}','\0','\0','\0','','\0',0,'\0'),(78,'oneleonardo_jboss_build','5HS.redhat6.4','ROOT:{ParamName}','\0','\0','\0','','\0',0,'\0'),(79,'oracle_client_version','11.2.0.3','ROOT:{ParamName}','\0','\0','\0','','\0',0,'\0'),(80,'httpuser','deployer','ROOT:columbus_delivery:{ParamName}','\0','\0','\0','','\0',0,'\0'),(81,'httppass','{SENSITIVE}','ROOT:columbus_delivery:{ParamName}','\0','\0','\0','','',0,'\0'),(82,'httpserver','delivery.na-dc.ah.ab:8081','ROOT:columbus_delivery:{ParamName}','\0','\0','\0','','\0',0,'\0'),(83,'httpurl','artifactory/libs-releases-local/com/ab/oneleo/columbus','ROOT:columbus_delivery:{ParamName}','\0','\0','\0','','\0',0,'\0'),(84,'gid','1001','ROOT:group_pmsukmjbo:{ParamName}','\0','\0','\0','','\0',0,'\0'),(85,'gid','1001','ROOT:group_pmsukejbo:{ParamName}','\0','\0','\0','','\0',0,'\0'),(86,'gid','1001','ROOT:group_pmsukst:{ParamName}','\0','\0','\0','','\0',0,'\0'),(87,'gid','1001','ROOT:group_pmsukpd:{ParamName}','\0','\0','\0','','\0',0,'\0'),(88,'gid','1001','ROOT:group_pmsgbrpm:{ParamName}','\0','\0','\0','','\0',0,'\0'),(89,'gid','1001','ROOT:group_pmsgbrpd:{ParamName}','\0','\0','\0','','\0',0,'\0'),(90,'gid','1001','ROOT:group_pmsgbrst:{ParamName}','\0','\0','\0','','\0',0,'\0'),(91,'gid','1001','ROOT:group_pmsgbrit:{ParamName}','\0','\0','\0','','\0',0,'\0'),(92,'gid','1000','ROOT:group_tagbt:{ParamName}','\0','\0','\0','','\0',0,'\0'),(93,'gid','1000','ROOT:group_tagbs:{ParamName}','\0','\0','\0','','\0',0,'\0'),(94,'gid','1000','ROOT:group_tagbm:{ParamName}','\0','\0','\0','','\0',0,'\0'),(95,'gid','1000','ROOT:group_tagbp:{ParamName}','\0','\0','\0','','\0',0,'\0'),(96,'uid','4001','ROOT:user_pmsukmsup:{ParamName}','\0','\0','\0','','\0',0,'\0'),(97,'gid','users','ROOT:user_pmsukmsup:{ParamName}','\0','\0','\0','','\0',0,'\0'),(98,'groups','users','ROOT:user_pmsukmsup:{ParamName}','\0','\0','\0','','\0',0,'\0'),(99,'home','/home/pmsukmsup','ROOT:user_pmsukmsup:{ParamName}','\0','\0','\0','','\0',0,'\0'),(100,'password','{SENSITIVE}','ROOT:user_pmsukmsup:{ParamName}','\0','\0','\0','','',0,'\0'),(101,'boots_support','true','ROOT:user_pmsukmsup:authorized_keys:{ParamName}','\0','\0','\0','','\0',0,'\0'),(102,'uid','1001','ROOT:user_pmsukmjbo:{ParamName}','\0','\0','\0','','\0',0,'\0'),(103,'gid','pmsukmjbo','ROOT:user_pmsukmjbo:{ParamName}','\0','\0','\0','','\0',0,'\0'),(104,'groups','pmsukmjbo','ROOT:user_pmsukmjbo:{ParamName}','\0','\0','\0','','\0',0,'\0'),(105,'home','/home/pmsukmjbo','ROOT:user_pmsukmjbo:{ParamName}','\0','\0','\0','','\0',0,'\0'),(106,'password','{SENSITIVE}','ROOT:user_pmsukmjbo:{ParamName}','\0','\0','\0','','',0,'\0'),(107,'uid','4001','ROOT:user_pmsukpdsup:{ParamName}','\0','\0','\0','','\0',0,'\0'),(108,'gid','users','ROOT:user_pmsukpdsup:{ParamName}','\0','\0','\0','','\0',0,'\0'),(109,'groups','users','ROOT:user_pmsukpdsup:{ParamName}','\0','\0','\0','','\0',0,'\0'),(110,'home','/home/pmsukpdsup','ROOT:user_pmsukpdsup:{ParamName}','\0','\0','\0','','\0',0,'\0'),(111,'password','{SENSITIVE}','ROOT:user_pmsukpdsup:{ParamName}','\0','\0','\0','','',0,'\0'),(112,'boots_support','true','ROOT:user_pmsukpdsup:authorized_keys:{ParamName}','\0','\0','\0','','\0',0,'\0'),(113,'uid','1001','ROOT:user_pmsukpdjbo:{ParamName}','\0','\0','\0','','\0',0,'\0'),(114,'gid','pmsukpdjbo','ROOT:user_pmsukpdjbo:{ParamName}','\0','\0','\0','','\0',0,'\0'),(115,'home','/home/pmsukpdjbo','ROOT:user_pmsukpdjbo:{ParamName}','\0','\0','\0','','\0',0,'\0'),(116,'groups','pmsukpdjbo','ROOT:user_pmsukpdjbo:{ParamName}','\0','\0','\0','','\0',0,'\0'),(117,'password','{SENSITIVE}','ROOT:user_pmsukpdjbo:{ParamName}','\0','\0','\0','','',0,'\0'),(118,'uid','1001','ROOT:user_pmsukpd:{ParamName}','\0','\0','\0','','\0',0,'\0'),(119,'gid','pmsukpd','ROOT:user_pmsukpd:{ParamName}','\0','\0','\0','','\0',0,'\0'),(120,'groups','pmsukpd','ROOT:user_pmsukpd:{ParamName}','\0','\0','\0','','\0',0,'\0'),(121,'home','/home/pmsukpd','ROOT:user_pmsukpd:{ParamName}','\0','\0','\0','','\0',0,'\0'),(122,'password','{SENSITIVE}','ROOT:user_pmsukpd:{ParamName}','\0','\0','\0','','',0,'\0'),(123,'uid','4001','ROOT:user_pmsukesup:{ParamName}','\0','\0','\0','','\0',0,'\0'),(124,'gid','users','ROOT:user_pmsukesup:{ParamName}','\0','\0','\0','','\0',0,'\0'),(125,'groups','users','ROOT:user_pmsukesup:{ParamName}','\0','\0','\0','','\0',0,'\0'),(126,'home','/home/pmsukesup','ROOT:user_pmsukesup:{ParamName}','\0','\0','\0','','\0',0,'\0'),(127,'password','{SENSITIVE}','ROOT:user_pmsukesup:{ParamName}','\0','\0','\0','','',0,'\0'),(128,'boots_support','true','ROOT:user_pmsukesup:authorized_keys:{ParamName}','\0','\0','\0','','\0',0,'\0'),(129,'training_support','true','ROOT:user_pmsukesup:authorized_keys:{ParamName}','\0','\0','\0','','\0',0,'\0'),(130,'uid','1001','ROOT:user_pmsukejbo:{ParamName}','\0','\0','\0','','\0',0,'\0'),(131,'gid','pmsukejbo','ROOT:user_pmsukejbo:{ParamName}','\0','\0','\0','','\0',0,'\0'),(132,'groups','pmsukejbo','ROOT:user_pmsukejbo:{ParamName}','\0','\0','\0','','\0',0,'\0'),(133,'home','/home/pmsukejbo','ROOT:user_pmsukejbo:{ParamName}','\0','\0','\0','','\0',0,'\0'),(134,'password','{SENSITIVE}','ROOT:user_pmsukejbo:{ParamName}','\0','\0','\0','','',0,'\0'),(135,'nofiles','10000','ROOT:user_pmsukejbo:{ParamName}','\0','\0','\0','','\0',0,'\0'),(136,'boots_support','true','ROOT:user_pmsukejbo:authorized_keys:{ParamName}','\0','\0','\0','','\0',0,'\0'),(137,'integration','true','ROOT:user_pmsukejbo:authorized_keys:{ParamName}','\0','\0','\0','','\0',0,'\0'),(138,'TSFN_columbus','true','ROOT:user_pmsukejbo:authorized_keys:{ParamName}','\0','\0','\0','','\0',0,'\0'),(139,'jobdesign','true','ROOT:user_pmsukejbo:authorized_keys:{ParamName}','\0','\0','\0','','\0',0,'\0'),(140,'uid','4001','ROOT:user_pmsukssup:{ParamName}','\0','\0','\0','','\0',0,'\0'),(141,'gid','users','ROOT:user_pmsukssup:{ParamName}','\0','\0','\0','','\0',0,'\0'),(142,'groups','users','ROOT:user_pmsukssup:{ParamName}','\0','\0','\0','','\0',0,'\0'),(143,'home','/home/pmsukssup','ROOT:user_pmsukssup:{ParamName}','\0','\0','\0','','\0',0,'\0'),(144,'password','{SENSITIVE}','ROOT:user_pmsukssup:{ParamName}','\0','\0','\0','','',0,'\0'),(145,'boots_support','true','ROOT:user_pmsukssup:authorized_keys:{ParamName}','\0','\0','\0','','\0',0,'\0'),(146,'uid','2001','ROOT:user_pmsukrjbo:{ParamName}','\0','\0','\0','','\0',0,'\0'),(147,'gid','pmsukrjbo','ROOT:user_pmsukrjbo:{ParamName}','\0','\0','\0','','\0',0,'\0'),(148,'groups','pmsukrjbo','ROOT:user_pmsukrjbo:{ParamName}','\0','\0','\0','','\0',0,'\0'),(149,'home','/home/pmsukrjbo','ROOT:user_pmsukrjbo:{ParamName}','\0','\0','\0','','\0',0,'\0'),(150,'password','{SENSITIVE}','ROOT:user_pmsukrjbo:{ParamName}','\0','\0','\0','','',0,'\0'),(151,'authorized_keys_file','oneleonardo/ssh/authorized_keys.erb','ROOT:user_pmsukrjbo:{ParamName}','\0','\0','\0','','\0',0,'\0'),(152,'TSFN_columbus','true','ROOT:user_pmsukrjbo:authorized_keys:{ParamName}','\0','\0','\0','','\0',0,'\0'),(153,'devel','true','ROOT:user_pmsukrjbo:authorized_keys:{ParamName}','\0','\0','\0','','\0',0,'\0'),(154,'uid','1001','ROOT:user_pmsukst:{ParamName}','\0','\0','\0','','\0',0,'\0'),(155,'gid','pmsukst','ROOT:user_pmsukst:{ParamName}','\0','\0','\0','','\0',0,'\0'),(156,'groups','pmsukst','ROOT:user_pmsukst:{ParamName}','\0','\0','\0','','\0',0,'\0'),(157,'home','/home/pmsukst','ROOT:user_pmsukst:{ParamName}','\0','\0','\0','','\0',0,'\0'),(158,'password','{SENSITIVE}','ROOT:user_pmsukst:{ParamName}','\0','\0','\0','','',0,'\0'),(159,'devel','true','ROOT:user_pmsukst:authorized_keys:{ParamName}','\0','\0','\0','','\0',0,'\0'),(160,'uid','4001','ROOT:user_pmsuktsup:{ParamName}','\0','\0','\0','','\0',0,'\0'),(161,'gid','users','ROOT:user_pmsuktsup:{ParamName}','\0','\0','\0','','\0',0,'\0'),(162,'groups','users','ROOT:user_pmsuktsup:{ParamName}','\0','\0','\0','','\0',0,'\0'),(163,'home','/home/pmsukstsup','ROOT:user_pmsuktsup:{ParamName}','\0','\0','\0','','\0',0,'\0'),(164,'password','{SENSITIVE}','ROOT:user_pmsuktsup:{ParamName}','\0','\0','\0','','',0,'\0'),(165,'boots_support','true','ROOT:user_pmsuktsup:authorized_keys:{ParamName}','\0','\0','\0','','\0',0,'\0'),(166,'uid','1001','ROOT:user_pmsgbrtt:{ParamName}','\0','\0','\0','','\0',0,'\0'),(167,'gid','pmsgbrtt','ROOT:user_pmsgbrtt:{ParamName}','\0','\0','\0','','\0',0,'\0'),(168,'groups','pmsgbrtt','ROOT:user_pmsgbrtt:{ParamName}','\0','\0','\0','','\0',0,'\0'),(169,'password','{SENSITIVE}','ROOT:user_pmsgbrtt:{ParamName}','\0','\0','\0','','',0,'\0'),(170,'nofiles','10000','ROOT:user_pmsgbrtt:{ParamName}','\0','\0','\0','','\0',0,'\0'),(171,'home','/home/pmsgbrtt','ROOT:user_pmsgbrtt:{ParamName}','\0','\0','\0','','\0',0,'\0'),(172,'jdk_release','1.6.0_37','ROOT:user_pmsgbrtt:{ParamName}','\0','\0','\0','','\0',0,'\0'),(173,'devel','true','ROOT:user_pmsgbrtt:authorized_keys:{ParamName}','\0','\0','\0','','\0',0,'\0'),(174,'boots_support','true','ROOT:user_pmsgbrtt:authorized_keys:{ParamName}','\0','\0','\0','','\0',0,'\0'),(175,'boots_performance_test','true','ROOT:user_pmsgbrtt:authorized_keys:{ParamName}','\0','\0','\0','','\0',0,'\0'),(176,'gid','1001','ROOT:group_pmsgbrtt:{ParamName}','\0','\0','\0','','\0',0,'\0'),(177,'uid','4001','ROOT:user_pmsgbmtt:{ParamName}','\0','\0','\0','','\0',0,'\0'),(178,'gid','pmsgbrtt','ROOT:user_pmsgbmtt:{ParamName}','\0','\0','\0','','\0',0,'\0'),(179,'groups','pmsgbrtt','ROOT:user_pmsgbmtt:{ParamName}','\0','\0','\0','','\0',0,'\0'),(180,'password','{SENSITIVE}','ROOT:user_pmsgbmtt:{ParamName}','\0','\0','\0','','',0,'\0'),(181,'home','/home/pmsgbmtt','ROOT:user_pmsgbmtt:{ParamName}','\0','\0','\0','','\0',0,'\0'),(182,'boots_support','true','ROOT:user_pmsgbmtt:authorized_keys:{ParamName}','\0','\0','\0','','\0',0,'\0'),(183,'boots_performance_test','true','ROOT:user_pmsgbmtt:authorized_keys:{ParamName}','\0','\0','\0','','\0',0,'\0'),(184,'uid','1001','ROOT:user_pmsgbrpm:{ParamName}','\0','\0','\0','','\0',0,'\0'),(185,'gid','pmsgbrpm','ROOT:user_pmsgbrpm:{ParamName}','\0','\0','\0','','\0',0,'\0'),(186,'groups','pmsgbrpm','ROOT:user_pmsgbrpm:{ParamName}','\0','\0','\0','','\0',0,'\0'),(187,'home','/home/pmsgbrpm','ROOT:user_pmsgbrpm:{ParamName}','\0','\0','\0','','\0',0,'\0'),(188,'password','{SENSITIVE}','ROOT:user_pmsgbrpm:{ParamName}','\0','\0','\0','','',0,'\0'),(189,'nofiles','10000','ROOT:user_pmsgbrpm:{ParamName}','\0','\0','\0','','\0',0,'\0'),(190,'uid','4001','ROOT:user_pmsgbmpm:{ParamName}','\0','\0','\0','','\0',0,'\0'),(191,'gid','users','ROOT:user_pmsgbmpm:{ParamName}','\0','\0','\0','','\0',0,'\0'),(192,'groups','users','ROOT:user_pmsgbmpm:{ParamName}','\0','\0','\0','','\0',0,'\0'),(193,'home','/home/pmsgbmpm','ROOT:user_pmsgbmpm:{ParamName}','\0','\0','\0','','\0',0,'\0'),(194,'password','{SENSITIVE}','ROOT:user_pmsgbmpm:{ParamName}','\0','\0','\0','','',0,'\0'),(195,'boots_support','true','ROOT:user_pmsgbmpm:authorized_keys:{ParamName}','\0','\0','\0','','\0',0,'\0'),(196,'devel','true','ROOT:user_pmsgbmpm:authorized_keys:{ParamName}','\0','\0','\0','','\0',0,'\0'),(197,'uid','1001','ROOT:user_pmsgbrpd:{ParamName}','\0','\0','\0','','\0',0,'\0'),(198,'gid','pmsgbrpd','ROOT:user_pmsgbrpd:{ParamName}','\0','\0','\0','','\0',0,'\0'),(199,'groups','pmsgbrpd','ROOT:user_pmsgbrpd:{ParamName}','\0','\0','\0','','\0',0,'\0'),(200,'home','/home/pmsgbrpd','ROOT:user_pmsgbrpd:{ParamName}','\0','\0','\0','','\0',0,'\0'),(201,'nofiles','10000','ROOT:user_pmsgbrpd:{ParamName}','\0','\0','\0','','\0',0,'\0'),(202,'password','{SENSITIVE}','ROOT:user_pmsgbrpd:{ParamName}','\0','\0','\0','','',0,'\0'),(203,'jdk_release','1.6.0_37','ROOT:user_pmsgbrpd:{ParamName}','\0','\0','\0','','\0',0,'\0'),(204,'uid','4001','ROOT:user_pmsgbmpd:{ParamName}','\0','\0','\0','','\0',0,'\0'),(205,'gid','users','ROOT:user_pmsgbmpd:{ParamName}','\0','\0','\0','','\0',0,'\0'),(206,'groups','users','ROOT:user_pmsgbmpd:{ParamName}','\0','\0','\0','','\0',0,'\0'),(207,'home','/home/pmsgbmpd','ROOT:user_pmsgbmpd:{ParamName}','\0','\0','\0','','\0',0,'\0'),(208,'password','{SENSITIVE}','ROOT:user_pmsgbmpd:{ParamName}','\0','\0','\0','','',0,'\0'),(209,'boots_support','true','ROOT:user_pmsgbmpd:authorized_keys:{ParamName}','\0','\0','\0','','\0',0,'\0'),(210,'devel','true','ROOT:user_pmsgbmpd:authorized_keys:{ParamName}','\0','\0','\0','','\0',0,'\0'),(211,'uid','1001','ROOT:user_pmsgbrst:{ParamName}','\0','\0','\0','','\0',0,'\0'),(212,'gid','pmsgbrst','ROOT:user_pmsgbrst:{ParamName}','\0','\0','\0','','\0',0,'\0'),(213,'groups','pmsgbrst','ROOT:user_pmsgbrst:{ParamName}','\0','\0','\0','','\0',0,'\0'),(214,'home','/home/pmsgbrst','ROOT:user_pmsgbrst:{ParamName}','\0','\0','\0','','\0',0,'\0'),(215,'password','{SENSITIVE}','ROOT:user_pmsgbrst:{ParamName}','\0','\0','\0','','',0,'\0'),(216,'nofiles','10000','ROOT:user_pmsgbrst:{ParamName}','\0','\0','\0','','\0',0,'\0'),(217,'jdk_release','1.6.0_37','ROOT:user_pmsgbrst:{ParamName}','\0','\0','\0','','\0',0,'\0'),(218,'boots_support','true','ROOT:user_pmsgbrst:authorized_keys:{ParamName}','\0','\0','\0','','\0',0,'\0'),(219,'boots_performance_test','true','ROOT:user_pmsgbrst:authorized_keys:{ParamName}','\0','\0','\0','','\0',0,'\0'),(220,'uid','4001','ROOT:user_pmsgbmst:{ParamName}','\0','\0','\0','','\0',0,'\0'),(221,'gid','users','ROOT:user_pmsgbmst:{ParamName}','\0','\0','\0','','\0',0,'\0'),(222,'groups','users','ROOT:user_pmsgbmst:{ParamName}','\0','\0','\0','','\0',0,'\0'),(223,'home','/home/pmsgbmst','ROOT:user_pmsgbmst:{ParamName}','\0','\0','\0','','\0',0,'\0'),(224,'password','{SENSITIVE}','ROOT:user_pmsgbmst:{ParamName}','\0','\0','\0','','',0,'\0'),(225,'boots_performance_test','true','ROOT:user_pmsgbmst:authorized_keys:{ParamName}','\0','\0','\0','','\0',0,'\0'),(226,'boots_support','true','ROOT:user_pmsgbmst:authorized_keys:{ParamName}','\0','\0','\0','','\0',0,'\0'),(227,'jdk_release','1.6.0_37','ROOT:user_pmsgbmst:{ParamName}','\0','\0','\0','','\0',0,'\0'),(228,'devel','true','ROOT:user_pmsgbmst:authorized_keys:{ParamName}','\0','\0','\0','','\0',0,'\0'),(229,'uid','1001','ROOT:user_pmsgbrit:{ParamName}','\0','\0','\0','','\0',0,'\0'),(230,'gid','pmsgbrit','ROOT:user_pmsgbrit:{ParamName}','\0','\0','\0','','\0',0,'\0'),(231,'groups','pmsgbrit','ROOT:user_pmsgbrit:{ParamName}','\0','\0','\0','','\0',0,'\0'),(232,'home','/home/pmsgbrit','ROOT:user_pmsgbrit:{ParamName}','\0','\0','\0','','\0',0,'\0'),(233,'password','{SENSITIVE}','ROOT:user_pmsgbrit:{ParamName}','\0','\0','\0','','',0,'\0'),(234,'nofiles','10000','ROOT:user_pmsgbrit:{ParamName}','\0','\0','\0','','\0',0,'\0'),(235,'boots_support','true','ROOT:user_pmsgbrit:authorized_keys:{ParamName}','\0','\0','\0','','\0',0,'\0'),(236,'boots_performance_test','true','ROOT:user_pmsgbrit:authorized_keys:{ParamName}','\0','\0','\0','','\0',0,'\0'),(237,'uid','4001','ROOT:user_pmsgbmit:{ParamName}','\0','\0','\0','','\0',0,'\0'),(238,'gid','users','ROOT:user_pmsgbmit:{ParamName}','\0','\0','\0','','\0',0,'\0'),(239,'groups','users','ROOT:user_pmsgbmit:{ParamName}','\0','\0','\0','','\0',0,'\0'),(240,'password','{SENSITIVE}','ROOT:user_pmsgbmit:{ParamName}','\0','\0','\0','','',0,'\0'),(241,'home','/home/pmsgbmit','ROOT:user_pmsgbmit:{ParamName}','\0','\0','\0','','\0',0,'\0'),(242,'boots_support','true','ROOT:user_pmsgbmit:authorized_keys:{ParamName}','\0','\0','\0','','\0',0,'\0'),(243,'boots_performance_test','true','ROOT:user_pmsgbmit:authorized_keys:{ParamName}','\0','\0','\0','','\0',0,'\0'),(244,'devel','true','ROOT:user_pmsgbmit:authorized_keys:{ParamName}','\0','\0','\0','','\0',0,'\0'),(245,'user','tagbtadm','ROOT:batchclient_test_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(246,'group','tagbt','ROOT:batchclient_test_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(247,'vg','rootvg','ROOT:batchclient_test_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(248,'size_envs','1G','ROOT:batchclient_test_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(249,'size_envf','1G','ROOT:batchclient_test_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(250,'size_envb','1G','ROOT:batchclient_test_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(251,'user','tagbsadm','ROOT:batchclient_stag_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(252,'size_envs','1G','ROOT:batchclient_stag_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(253,'vg','rootvg','ROOT:batchclient_stag_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(254,'group','tagbs','ROOT:batchclient_stag_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(255,'size_envb','1G','ROOT:batchclient_stag_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(256,'size_envf','1G','ROOT:batchclient_stag_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(257,'user','tagbmadm','ROOT:batchclient_supp_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(258,'group','tagbm','ROOT:batchclient_supp_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(259,'size_envs','1G','ROOT:batchclient_supp_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(260,'size_envb','1G','ROOT:batchclient_supp_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(261,'vg','rootvg','ROOT:batchclient_supp_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(262,'size_envf','1G','ROOT:batchclient_supp_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(263,'user','tagbpadm','ROOT:batchclient_prod_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(264,'group','tagbp','ROOT:batchclient_prod_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(265,'vg','rootvg','ROOT:batchclient_prod_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(266,'size_envs','1G','ROOT:batchclient_prod_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(267,'size_envf','1G','ROOT:batchclient_prod_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(268,'size_envb','1G','ROOT:batchclient_prod_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(269,'auditd_local_rules','true','ROOT:{ParamName}','\0','\0','\0','','\0',0,'\0'),(270,'srcurl','http://gb2inffilp1.resources.corp.internal/SOURCES/','ROOT:{ParamName}','\0','\0','\0','','\0',0,'\0'),(271,'os_version','centos-6.6-x86_64','ROOT:{ParamName}','\0','\0','\0','','\0',0,'\0'),(272,'interface','eth1','ROOT:keepalived_conf:\'gbrpmseast00\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(273,'router_id','60','ROOT:keepalived_conf:\'gbrpmseast00\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(274,'auth_type','PASS','ROOT:keepalived_conf:\'gbrpmseast00\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(275,'auth_pass','{SENSITIVE}','ROOT:keepalived_conf:\'gbrpmseast00\':{ParamName}','\0','\0','\0','','',0,'\0'),(276,'ipaddress','10.141.129.248/24','ROOT:keepalived_conf:\'gbrpmseast00\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(277,'track_int','eth1','ROOT:keepalived_conf:\'gbrpmseast00\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(278,'interface','eth1','ROOT:keepalived_conf:\'gbrpmsbrgt00\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(279,'router_id','61','ROOT:keepalived_conf:\'gbrpmsbrgt00\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(280,'auth_type','PASS','ROOT:keepalived_conf:\'gbrpmsbrgt00\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(281,'auth_pass','{SENSITIVE}','ROOT:keepalived_conf:\'gbrpmsbrgt00\':{ParamName}','\0','\0','\0','','',0,'\0'),(282,'ipaddress','10.141.129.249/24','ROOT:keepalived_conf:\'gbrpmsbrgt00\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(283,'track_int','eth1','ROOT:keepalived_conf:\'gbrpmsbrgt00\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(284,'auth_type','PASS','ROOT:keepalived_conf:\'gbrpmsuist00\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(285,'router_id','62','ROOT:keepalived_conf:\'gbrpmsuist00\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(286,'interface','eth1','ROOT:keepalived_conf:\'gbrpmsuist00\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(287,'auth_pass','{SENSITIVE}','ROOT:keepalived_conf:\'gbrpmsuist00\':{ParamName}','\0','\0','\0','','',0,'\0'),(288,'ipaddress','10.141.129.247/24','ROOT:keepalived_conf:\'gbrpmsuist00\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(289,'track_int','eth1','ROOT:keepalived_conf:\'gbrpmsuist00\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(290,'bind_address','10.141.129.249','ROOT:haproxy_conf:\'gbrpmsbrgit1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(291,'mode','http','ROOT:haproxy_conf:\'gbrpmsbrgit1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(292,'bind_port','8880','ROOT:haproxy_conf:\'gbrpmsbrgit1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(293,'balance','roundrobin','ROOT:haproxy_conf:\'gbrpmsbrgit1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(294,'options','stick on src','ROOT:haproxy_conf:\'gbrpmsbrgit1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(295,'options','stick-table type ip size 1m expire 3h','ROOT:haproxy_conf:\'gbrpmsbrgit1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(296,'backends','gbrpmsbrgi01 gbrpmsbrgi01.corp.internal:8380 check','ROOT:haproxy_conf:\'gbrpmsbrgit1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(297,'backends','gbrpmsbrgi02 gbrpmsbrgi02.corp.internal:8380 check','ROOT:haproxy_conf:\'gbrpmsbrgit1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(298,'mode','http','ROOT:haproxy_conf:\'gbrpmseasit1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(299,'bind_address','10.141.129.248','ROOT:haproxy_conf:\'gbrpmseasit1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(300,'bind_port','8845','ROOT:haproxy_conf:\'gbrpmseasit1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(301,'balance','roundrobin','ROOT:haproxy_conf:\'gbrpmseasit1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(302,'options','stick on src','ROOT:haproxy_conf:\'gbrpmseasit1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(303,'options','stick-table type ip size 1m expire 3h','ROOT:haproxy_conf:\'gbrpmseasit1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(304,'backends','gbrpmseasi01 gbrpmseasi01.corp.internal:8180 check','ROOT:haproxy_conf:\'gbrpmseasit1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(305,'backends','gbrpmseasi02 gbrpmseasi02.corp.internal:8180 check','ROOT:haproxy_conf:\'gbrpmseasit1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(306,'mode','http','ROOT:haproxy_conf:\'gbrpmsuisit1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(307,'bind_address','10.141.129.247','ROOT:haproxy_conf:\'gbrpmsuisit1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(308,'bind_port','8845','ROOT:haproxy_conf:\'gbrpmsuisit1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(309,'balance','roundrobin','ROOT:haproxy_conf:\'gbrpmsuisit1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(310,'options','stick on src','ROOT:haproxy_conf:\'gbrpmsuisit1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(311,'options','stick-table type ip size 1m expire 3h','ROOT:haproxy_conf:\'gbrpmsuisit1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(312,'backends','gbrpmsuisi01 gbrpmsuisi01.corp.internal:8280 check','ROOT:haproxy_conf:\'gbrpmsuisit1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(313,'mode','http','ROOT:haproxy_conf:\'gbrpmsbrgit2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(314,'bind_address','10.141.129.249','ROOT:haproxy_conf:\'gbrpmsbrgit2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(315,'bind_port','8881','ROOT:haproxy_conf:\'gbrpmsbrgit2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(316,'balance','roundrobin','ROOT:haproxy_conf:\'gbrpmsbrgit2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(317,'options','stick on src','ROOT:haproxy_conf:\'gbrpmsbrgit2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(318,'options','stick-table type ip size 1m expire 3h','ROOT:haproxy_conf:\'gbrpmsbrgit2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(319,'backends','gbrpmsbrgi11 gbrpmsbrgi11.corp.internal:8380 check','ROOT:haproxy_conf:\'gbrpmsbrgit2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(320,'backends','gbrpmsbrgi12 gbrpmsbrgi12.corp.internal:8380 check','ROOT:haproxy_conf:\'gbrpmsbrgit2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(321,'mode','http','ROOT:haproxy_conf:\'gbrpmseasit2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(322,'bind_address','10.141.129.248','ROOT:haproxy_conf:\'gbrpmseasit2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(323,'bind_port','8846','ROOT:haproxy_conf:\'gbrpmseasit2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(324,'balance','roundrobin','ROOT:haproxy_conf:\'gbrpmseasit2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(325,'options','stick on src','ROOT:haproxy_conf:\'gbrpmseasit2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(326,'options','stick-table type ip size 1m expire 3h','ROOT:haproxy_conf:\'gbrpmseasit2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(327,'backends','gbrpmseasi11 gbrpmseasi11.corp.internal:8180 check','ROOT:haproxy_conf:\'gbrpmseasit2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(328,'mode','http','ROOT:haproxy_conf:\'gbrpmsuisit2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(329,'bind_address','10.141.129.247','ROOT:haproxy_conf:\'gbrpmsuisit2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(330,'bind_port','8846','ROOT:haproxy_conf:\'gbrpmsuisit2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(331,'balance','roundrobin','ROOT:haproxy_conf:\'gbrpmsuisit2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(332,'options','stick on src','ROOT:haproxy_conf:\'gbrpmsuisit2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(333,'options','stick-table type ip size 1m expire 3h','ROOT:haproxy_conf:\'gbrpmsuisit2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(334,'backends','gbrpmsuisi11 gbrpmsuisi11.corp.internal:8280 check','ROOT:haproxy_conf:\'gbrpmsuisit2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(335,'mode','http','ROOT:haproxy_conf:\'gbrpmsbrgit3\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(336,'bind_address','10.141.129.249','ROOT:haproxy_conf:\'gbrpmsbrgit3\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(337,'bind_port','8882','ROOT:haproxy_conf:\'gbrpmsbrgit3\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(338,'balance','roundrobin','ROOT:haproxy_conf:\'gbrpmsbrgit3\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(339,'options','stick on src','ROOT:haproxy_conf:\'gbrpmsbrgit3\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(340,'options','stick-table type ip size 1m expire 3h','ROOT:haproxy_conf:\'gbrpmsbrgit3\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(341,'backends','gbrpmsbrgi21 gbrpmsbrgi21.corp.internal:8380 check','ROOT:haproxy_conf:\'gbrpmsbrgit3\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(342,'bind_port','8847','ROOT:haproxy_conf:\'gbrpmseasit3\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(343,'bind_address','10.141.129.248','ROOT:haproxy_conf:\'gbrpmseasit3\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(344,'mode','http','ROOT:haproxy_conf:\'gbrpmseasit3\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(345,'balance','roundrobin','ROOT:haproxy_conf:\'gbrpmseasit3\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(346,'options','stick on src','ROOT:haproxy_conf:\'gbrpmseasit3\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(347,'options','stick-table type ip size 1m expire 3h','ROOT:haproxy_conf:\'gbrpmseasit3\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(348,'backends','gbrpmseasi21 gbrpmseasi21.corp.internal:8180 check','ROOT:haproxy_conf:\'gbrpmseasit3\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(349,'balance','roundrobin','ROOT:haproxy_conf:\'gbrpmsuisit3\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(350,'bind_address','10.141.129.247','ROOT:haproxy_conf:\'gbrpmsuisit3\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(351,'mode','http','ROOT:haproxy_conf:\'gbrpmsuisit3\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(352,'bind_port','8847','ROOT:haproxy_conf:\'gbrpmsuisit3\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(353,'options','stick on src','ROOT:haproxy_conf:\'gbrpmsuisit3\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(354,'backends','gbrpmsuisi21 gbrpmsuisi21.corp.internal:8280 check','ROOT:haproxy_conf:\'gbrpmsuisit3\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(355,'options','stick-table type ip size 1m expire 3h','ROOT:haproxy_conf:\'gbrpmsuisit3\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(356,'mode','http','ROOT:haproxy_conf:\'gbrpmsbrgit4\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(357,'bind_address','10.141.129.249','ROOT:haproxy_conf:\'gbrpmsbrgit4\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(358,'bind_port','8890','ROOT:haproxy_conf:\'gbrpmsbrgit4\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(359,'balance','roundrobin','ROOT:haproxy_conf:\'gbrpmsbrgit4\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(360,'options','stick on src','ROOT:haproxy_conf:\'gbrpmsbrgit4\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(361,'options','stick-table type ip size 1m expire 3h','ROOT:haproxy_conf:\'gbrpmsbrgit4\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(362,'backends','gbrpmsbrgi31 gbrpmsbrgi31.corp.internal:8380 check','ROOT:haproxy_conf:\'gbrpmsbrgit4\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(363,'backends','gbrpmsbrgi32 gbrpmsbrgi32.corp.internal:8380 check','ROOT:haproxy_conf:\'gbrpmsbrgit4\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(364,'mode','http','ROOT:haproxy_conf:\'gbrpmseasit4sg1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(365,'bind_address','10.141.129.248','ROOT:haproxy_conf:\'gbrpmseasit4sg1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(366,'bind_port','8893','ROOT:haproxy_conf:\'gbrpmseasit4sg1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(367,'balance','roundrobin','ROOT:haproxy_conf:\'gbrpmseasit4sg1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(368,'options','stick on src','ROOT:haproxy_conf:\'gbrpmseasit4sg1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(369,'options','stick-table type ip size 1m expire 3h','ROOT:haproxy_conf:\'gbrpmseasit4sg1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(370,'backends','gbrpmseasi31 gbrpmseasi31.corp.internal:8180 check','ROOT:haproxy_conf:\'gbrpmseasit4sg1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(371,'mode','http','ROOT:haproxy_conf:\'gbrpmsuisit4sg1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(372,'bind_port','8893','ROOT:haproxy_conf:\'gbrpmsuisit4sg1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(373,'bind_address','10.141.129.247','ROOT:haproxy_conf:\'gbrpmsuisit4sg1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(374,'balance','roundrobin','ROOT:haproxy_conf:\'gbrpmsuisit4sg1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(375,'options','stick on src','ROOT:haproxy_conf:\'gbrpmsuisit4sg1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(376,'options','stick-table type ip size 1m expire 3h','ROOT:haproxy_conf:\'gbrpmsuisit4sg1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(377,'backends','gbrpmsuisi31 gbrpmsuisi31.corp.internal:8280 check','ROOT:haproxy_conf:\'gbrpmsuisit4sg1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(378,'mode','http','ROOT:haproxy_conf:\'gbrpmseasit4sg2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(379,'bind_address','10.141.129.248','ROOT:haproxy_conf:\'gbrpmseasit4sg2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(380,'bind_port','8897','ROOT:haproxy_conf:\'gbrpmseasit4sg2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(381,'balance','roundrobin','ROOT:haproxy_conf:\'gbrpmseasit4sg2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(382,'options','stick on src','ROOT:haproxy_conf:\'gbrpmseasit4sg2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(383,'options','stick-table type ip size 1m expire 3h','ROOT:haproxy_conf:\'gbrpmseasit4sg2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(384,'backends','gbrpmseasi32 gbrpmseasi32.corp.internal:8180 check','ROOT:haproxy_conf:\'gbrpmseasit4sg2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(385,'mode','http','ROOT:haproxy_conf:\'gbrpmsuisit4sg2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(386,'bind_address','10.141.129.247','ROOT:haproxy_conf:\'gbrpmsuisit4sg2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(387,'bind_port','8897','ROOT:haproxy_conf:\'gbrpmsuisit4sg2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(388,'balance','roundrobin','ROOT:haproxy_conf:\'gbrpmsuisit4sg2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(389,'options','stick on src','ROOT:haproxy_conf:\'gbrpmsuisit4sg2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(390,'options','stick-table type ip size 1m expire 3h','ROOT:haproxy_conf:\'gbrpmsuisit4sg2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(391,'backends','gbrpmsuisi32 gbrpmsuisi32.corp.internal:8280 check','ROOT:haproxy_conf:\'gbrpmsuisit4sg2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(392,'mode','http','ROOT:haproxy_conf:\'gbrpmsbrgit5\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(393,'bind_address','10.141.129.249','ROOT:haproxy_conf:\'gbrpmsbrgit5\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(394,'balance','roundrobin','ROOT:haproxy_conf:\'gbrpmsbrgit5\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(395,'bind_port','8891','ROOT:haproxy_conf:\'gbrpmsbrgit5\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(396,'options','stick-table type ip size 1m expire 3h','ROOT:haproxy_conf:\'gbrpmsbrgit5\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(397,'options','stick on src','ROOT:haproxy_conf:\'gbrpmsbrgit5\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(398,'backends','gbrpmsbrgi41 gbrpmsbrgi41.corp.internal:8380 check','ROOT:haproxy_conf:\'gbrpmsbrgit5\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(399,'mode','http','ROOT:haproxy_conf:\'gbrpmseasit5sg1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(400,'bind_address','10.141.129.248','ROOT:haproxy_conf:\'gbrpmseasit5sg1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(401,'bind_port','8894','ROOT:haproxy_conf:\'gbrpmseasit5sg1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(402,'balance','roundrobin','ROOT:haproxy_conf:\'gbrpmseasit5sg1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(403,'options','stick-table type ip size 1m expire 3h','ROOT:haproxy_conf:\'gbrpmseasit5sg1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(404,'backends','gbrpmseasi41 gbrpmseasi41.corp.internal:8180 check','ROOT:haproxy_conf:\'gbrpmseasit5sg1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(405,'options','stick on src','ROOT:haproxy_conf:\'gbrpmseasit5sg1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(406,'mode','http','ROOT:haproxy_conf:\'gbrpmseasit5sg2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(407,'bind_address','10.141.129.248','ROOT:haproxy_conf:\'gbrpmseasit5sg2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(408,'balance','roundrobin','ROOT:haproxy_conf:\'gbrpmseasit5sg2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(409,'bind_port','8898','ROOT:haproxy_conf:\'gbrpmseasit5sg2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(410,'options','stick on src','ROOT:haproxy_conf:\'gbrpmseasit5sg2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(411,'options','stick-table type ip size 1m expire 3h','ROOT:haproxy_conf:\'gbrpmseasit5sg2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(412,'backends','gbrpmseasi42 gbrpmseasi42.corp.internal:8180 check','ROOT:haproxy_conf:\'gbrpmseasit5sg2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(413,'mode','http','ROOT:haproxy_conf:\'gbrpmsuisit5sg1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(414,'bind_address','10.141.129.247','ROOT:haproxy_conf:\'gbrpmsuisit5sg1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(415,'bind_port','8894','ROOT:haproxy_conf:\'gbrpmsuisit5sg1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(416,'balance','roundrobin','ROOT:haproxy_conf:\'gbrpmsuisit5sg1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(417,'options','stick on src','ROOT:haproxy_conf:\'gbrpmsuisit5sg1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(418,'options','stick-table type ip size 1m expire 3h','ROOT:haproxy_conf:\'gbrpmsuisit5sg1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(419,'backends','gbrpmsuisi41 gbrpmsuisi41.corp.internal:8280 check','ROOT:haproxy_conf:\'gbrpmsuisit5sg1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(420,'mode','http','ROOT:haproxy_conf:\'gbrpmsuisit5sg2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(421,'balance','roundrobin','ROOT:haproxy_conf:\'gbrpmsuisit5sg2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(422,'bind_address','10.141.129.247','ROOT:haproxy_conf:\'gbrpmsuisit5sg2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(423,'bind_port','8898','ROOT:haproxy_conf:\'gbrpmsuisit5sg2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(424,'options','stick-table type ip size 1m expire 3h','ROOT:haproxy_conf:\'gbrpmsuisit5sg2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(425,'options','stick on src','ROOT:haproxy_conf:\'gbrpmsuisit5sg2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(426,'backends','gbrpmsuisi42 gbrpmsuisi42.corp.internal:8280 check','ROOT:haproxy_conf:\'gbrpmsuisit5sg2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(427,'mode','http','ROOT:haproxy_conf:\'gbrpmsbrgft1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(428,'balance','roundrobin','ROOT:haproxy_conf:\'gbrpmsbrgft1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(429,'bind_address','10.141.129.249','ROOT:haproxy_conf:\'gbrpmsbrgft1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(430,'bind_port','8883','ROOT:haproxy_conf:\'gbrpmsbrgft1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(431,'options','stick on src','ROOT:haproxy_conf:\'gbrpmsbrgft1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(432,'options','stick-table type ip size 1m expire 3h','ROOT:haproxy_conf:\'gbrpmsbrgft1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(433,'backends','gbrpmsbrgf01 gbrpmsbrgf01.corp.internal:8380 check','ROOT:haproxy_conf:\'gbrpmsbrgft1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(434,'mode','http','ROOT:haproxy_conf:\'gbrpmseasft1sg1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(435,'bind_address','10.141.129.248','ROOT:haproxy_conf:\'gbrpmseasft1sg1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(436,'bind_port','8848','ROOT:haproxy_conf:\'gbrpmseasft1sg1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(437,'balance','roundrobin','ROOT:haproxy_conf:\'gbrpmseasft1sg1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(438,'options','stick on src','ROOT:haproxy_conf:\'gbrpmseasft1sg1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(439,'options','stick-table type ip size 1m expire 3h','ROOT:haproxy_conf:\'gbrpmseasft1sg1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(440,'backends','gbrpmseasf01 gbrpmseasf01.corp.internal:8180 check','ROOT:haproxy_conf:\'gbrpmseasft1sg1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(441,'mode','http','ROOT:haproxy_conf:\'gbrpmseasft1sg2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(442,'bind_address','10.141.129.248','ROOT:haproxy_conf:\'gbrpmseasft1sg2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(443,'bind_port','8858','ROOT:haproxy_conf:\'gbrpmseasft1sg2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(444,'balance','roundrobin','ROOT:haproxy_conf:\'gbrpmseasft1sg2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(445,'options','stick on src','ROOT:haproxy_conf:\'gbrpmseasft1sg2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(446,'options','stick-table type ip size 1m expire 3h','ROOT:haproxy_conf:\'gbrpmseasft1sg2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(447,'backends','gbrpmseasf02 gbrpmseasf02.corp.internal:8180 check','ROOT:haproxy_conf:\'gbrpmseasft1sg2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(448,'mode','http','ROOT:haproxy_conf:\'gbrpmsuisft1sg1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(449,'bind_address','10.141.129.247','ROOT:haproxy_conf:\'gbrpmsuisft1sg1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(450,'bind_port','8848','ROOT:haproxy_conf:\'gbrpmsuisft1sg1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(451,'balance','roundrobin','ROOT:haproxy_conf:\'gbrpmsuisft1sg1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(452,'options','stick on src','ROOT:haproxy_conf:\'gbrpmsuisft1sg1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(453,'options','stick-table type ip size 1m expire 3h','ROOT:haproxy_conf:\'gbrpmsuisft1sg1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(454,'backends','gbrpmsuisf01 gbrpmsuisf01.corp.internal:8280 check','ROOT:haproxy_conf:\'gbrpmsuisft1sg1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(455,'mode','http','ROOT:haproxy_conf:\'gbrpmsuisft1sg2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(456,'bind_port','8858','ROOT:haproxy_conf:\'gbrpmsuisft1sg2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(457,'options','stick-table type ip size 1m expire 3h','ROOT:haproxy_conf:\'gbrpmsuisft1sg2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(458,'bind_address','10.141.129.247','ROOT:haproxy_conf:\'gbrpmsuisft1sg2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(459,'balance','roundrobin','ROOT:haproxy_conf:\'gbrpmsuisft1sg2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(460,'options','stick on src','ROOT:haproxy_conf:\'gbrpmsuisft1sg2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(461,'backends','gbrpmsuisf02 gbrpmsuisf02.corp.internal:8280 check','ROOT:haproxy_conf:\'gbrpmsuisft1sg2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(462,'mode','http','ROOT:haproxy_conf:\'gbrpmsbrgft2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(463,'bind_port','8884','ROOT:haproxy_conf:\'gbrpmsbrgft2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(464,'options','stick on src','ROOT:haproxy_conf:\'gbrpmsbrgft2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(465,'balance','roundrobin','ROOT:haproxy_conf:\'gbrpmsbrgft2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(466,'bind_address','10.141.129.249','ROOT:haproxy_conf:\'gbrpmsbrgft2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(467,'options','stick-table type ip size 1m expire 3h','ROOT:haproxy_conf:\'gbrpmsbrgft2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(468,'backends','gbrpmsbrgf12 gbrpmsbrgf12.corp.internal:8380 check','ROOT:haproxy_conf:\'gbrpmsbrgft2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(469,'mode','http','ROOT:haproxy_conf:\'gbrpmseasft2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(470,'backends','gbrpmsbrgf11 gbrpmsbrgf11.corp.internal:8380 check','ROOT:haproxy_conf:\'gbrpmsbrgft2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(471,'bind_address','10.141.129.248','ROOT:haproxy_conf:\'gbrpmseasft2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(472,'bind_port','8849','ROOT:haproxy_conf:\'gbrpmseasft2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(473,'balance','roundrobin','ROOT:haproxy_conf:\'gbrpmseasft2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(474,'options','stick on src','ROOT:haproxy_conf:\'gbrpmseasft2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(475,'options','stick-table type ip size 1m expire 3h','ROOT:haproxy_conf:\'gbrpmseasft2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(476,'mode','http','ROOT:haproxy_conf:\'gbrpmsuisft2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(477,'backends','gbrpmseasf11 gbrpmseasf11.corp.internal:8180 check','ROOT:haproxy_conf:\'gbrpmseasft2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(478,'bind_address','10.141.129.247','ROOT:haproxy_conf:\'gbrpmsuisft2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(479,'bind_port','8849','ROOT:haproxy_conf:\'gbrpmsuisft2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(480,'balance','roundrobin','ROOT:haproxy_conf:\'gbrpmsuisft2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(481,'options','stick on src','ROOT:haproxy_conf:\'gbrpmsuisft2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(482,'options','stick-table type ip size 1m expire 3h','ROOT:haproxy_conf:\'gbrpmsuisft2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(483,'backends','gbrpmsuisf11 gbrpmsuisf11.corp.internal:8280 check','ROOT:haproxy_conf:\'gbrpmsuisft2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(484,'mode','http','ROOT:haproxy_conf:\'gbrpmsbrgft3\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(485,'bind_address','10.141.129.249','ROOT:haproxy_conf:\'gbrpmsbrgft3\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(486,'balance','roundrobin','ROOT:haproxy_conf:\'gbrpmsbrgft3\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(487,'bind_port','8885','ROOT:haproxy_conf:\'gbrpmsbrgft3\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(488,'options','stick on src','ROOT:haproxy_conf:\'gbrpmsbrgft3\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(489,'options','stick-table type ip size 1m expire 3h','ROOT:haproxy_conf:\'gbrpmsbrgft3\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(490,'backends','gbrpmsbrgf21 gbrpmsbrgf21.corp.internal:8380 check','ROOT:haproxy_conf:\'gbrpmsbrgft3\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(491,'mode','http','ROOT:haproxy_conf:\'gbrpmseasft3\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(492,'bind_address','10.141.129.248','ROOT:haproxy_conf:\'gbrpmseasft3\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(493,'bind_port','8850','ROOT:haproxy_conf:\'gbrpmseasft3\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(494,'balance','roundrobin','ROOT:haproxy_conf:\'gbrpmseasft3\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(495,'options','stick on src','ROOT:haproxy_conf:\'gbrpmseasft3\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(496,'options','stick-table type ip size 1m expire 3h','ROOT:haproxy_conf:\'gbrpmseasft3\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(497,'backends','gbrpmseasf21 gbrpmseasf21.corp.internal:8180 check','ROOT:haproxy_conf:\'gbrpmseasft3\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(498,'mode','http','ROOT:haproxy_conf:\'gbrpmsuisft3\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(499,'bind_address','10.141.129.247','ROOT:haproxy_conf:\'gbrpmsuisft3\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(500,'bind_port','8850','ROOT:haproxy_conf:\'gbrpmsuisft3\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(501,'balance','roundrobin','ROOT:haproxy_conf:\'gbrpmsuisft3\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(502,'options','stick on src','ROOT:haproxy_conf:\'gbrpmsuisft3\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(503,'options','stick-table type ip size 1m expire 3h','ROOT:haproxy_conf:\'gbrpmsuisft3\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(504,'backends','gbrpmsuisf21 gbrpmsuisf21.corp.internal:8280 check','ROOT:haproxy_conf:\'gbrpmsuisft3\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(505,'bind_address','10.141.129.249','ROOT:haproxy_conf:\'gbrpmsbrgft4\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(506,'mode','http','ROOT:haproxy_conf:\'gbrpmsbrgft4\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(507,'balance','roundrobin','ROOT:haproxy_conf:\'gbrpmsbrgft4\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(508,'bind_port','8886','ROOT:haproxy_conf:\'gbrpmsbrgft4\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(509,'options','stick on src','ROOT:haproxy_conf:\'gbrpmsbrgft4\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(510,'options','stick-table type ip size 1m expire 3h','ROOT:haproxy_conf:\'gbrpmsbrgft4\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(511,'backends','gbrpmsbrgf31 gbrpmsbrgf31.corp.internal:8380 check','ROOT:haproxy_conf:\'gbrpmsbrgft4\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(512,'mode','http','ROOT:haproxy_conf:\'gbrpmseasft4\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(513,'bind_address','10.141.129.248','ROOT:haproxy_conf:\'gbrpmseasft4\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(514,'bind_port','8851','ROOT:haproxy_conf:\'gbrpmseasft4\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(515,'balance','roundrobin','ROOT:haproxy_conf:\'gbrpmseasft4\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(516,'options','stick on src','ROOT:haproxy_conf:\'gbrpmseasft4\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(517,'options','stick-table type ip size 1m expire 3h','ROOT:haproxy_conf:\'gbrpmseasft4\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(518,'backends','gbrpmseasf31 gbrpmseasf31.corp.internal:8180 check','ROOT:haproxy_conf:\'gbrpmseasft4\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(519,'mode','http','ROOT:haproxy_conf:\'gbrpmsuisft4\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(520,'bind_address','10.141.129.247','ROOT:haproxy_conf:\'gbrpmsuisft4\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(521,'bind_port','8851','ROOT:haproxy_conf:\'gbrpmsuisft4\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(522,'balance','roundrobin','ROOT:haproxy_conf:\'gbrpmsuisft4\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(523,'options','stick on src','ROOT:haproxy_conf:\'gbrpmsuisft4\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(524,'options','stick-table type ip size 1m expire 3h','ROOT:haproxy_conf:\'gbrpmsuisft4\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(525,'backends','gbrpmsuisf31 gbrpmsuisf31.corp.internal:8280 check','ROOT:haproxy_conf:\'gbrpmsuisft4\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(526,'mode','http','ROOT:haproxy_conf:\'gbrpmseasft5\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(527,'bind_address','10.141.129.248','ROOT:haproxy_conf:\'gbrpmseasft5\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(528,'bind_port','8895','ROOT:haproxy_conf:\'gbrpmseasft5\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(529,'balance','roundrobin','ROOT:haproxy_conf:\'gbrpmseasft5\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(530,'options','stick on src','ROOT:haproxy_conf:\'gbrpmseasft5\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(531,'options','stick-table type ip size 1m expire 3h','ROOT:haproxy_conf:\'gbrpmseasft5\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(532,'backends','gbrpmseasf41 gbrpmseasf41.corp.internal:8180 check','ROOT:haproxy_conf:\'gbrpmseasft5\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(533,'mode','http','ROOT:haproxy_conf:\'gbrpmsuisft5\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(534,'bind_address','10.141.129.247','ROOT:haproxy_conf:\'gbrpmsuisft5\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(535,'bind_port','8895','ROOT:haproxy_conf:\'gbrpmsuisft5\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(536,'balance','roundrobin','ROOT:haproxy_conf:\'gbrpmsuisft5\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(537,'options','stick on src','ROOT:haproxy_conf:\'gbrpmsuisft5\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(538,'options','stick-table type ip size 1m expire 3h','ROOT:haproxy_conf:\'gbrpmsuisft5\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(539,'backends','gbrpmsuisf41 gbrpmsuisf41.corp.internal:8280 check','ROOT:haproxy_conf:\'gbrpmsuisft5\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(540,'bind_address','10.141.129.249','ROOT:haproxy_conf:\'gbrpmsbrgut1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(541,'mode','http','ROOT:haproxy_conf:\'gbrpmsbrgut1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(542,'bind_port','8887','ROOT:haproxy_conf:\'gbrpmsbrgut1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(543,'balance','roundrobin','ROOT:haproxy_conf:\'gbrpmsbrgut1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(544,'options','stick on src','ROOT:haproxy_conf:\'gbrpmsbrgut1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(545,'options','stick-table type ip size 1m expire 3h','ROOT:haproxy_conf:\'gbrpmsbrgut1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(546,'backends','gbrpmsbrgu01 gbrpmsbrgu01.corp.internal:8380 check','ROOT:haproxy_conf:\'gbrpmsbrgut1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(547,'mode','http','ROOT:haproxy_conf:\'gbrpmseasut1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(548,'bind_address','10.141.129.248','ROOT:haproxy_conf:\'gbrpmseasut1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(549,'bind_port','8852','ROOT:haproxy_conf:\'gbrpmseasut1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(550,'balance','roundrobin','ROOT:haproxy_conf:\'gbrpmseasut1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(551,'options','stick on src','ROOT:haproxy_conf:\'gbrpmseasut1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(552,'options','stick-table type ip size 1m expire 3h','ROOT:haproxy_conf:\'gbrpmseasut1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(553,'mode','http','ROOT:haproxy_conf:\'gbrpmsuisut1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(554,'bind_address','10.141.129.247','ROOT:haproxy_conf:\'gbrpmsuisut1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(555,'bind_port','8852','ROOT:haproxy_conf:\'gbrpmsuisut1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(556,'backends','gbrpmseasu01 gbrpmseasu01.corp.internal:8180 check','ROOT:haproxy_conf:\'gbrpmseasut1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(557,'balance','roundrobin','ROOT:haproxy_conf:\'gbrpmsuisut1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(558,'options','stick on src','ROOT:haproxy_conf:\'gbrpmsuisut1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(559,'options','stick-table type ip size 1m expire 3h','ROOT:haproxy_conf:\'gbrpmsuisut1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(560,'backends','gbrpmsuisu01 gbrpmsuisu01.corp.internal:8280 check','ROOT:haproxy_conf:\'gbrpmsuisut1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(561,'mode','http','ROOT:haproxy_conf:\'gbrpmsbrgut2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(562,'bind_address','10.141.129.249','ROOT:haproxy_conf:\'gbrpmsbrgut2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(563,'bind_port','8888','ROOT:haproxy_conf:\'gbrpmsbrgut2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(564,'options','stick on src','ROOT:haproxy_conf:\'gbrpmsbrgut2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(565,'balance','roundrobin','ROOT:haproxy_conf:\'gbrpmsbrgut2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(566,'options','stick-table type ip size 1m expire 3h','ROOT:haproxy_conf:\'gbrpmsbrgut2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(567,'backends','gbrpmsbrgu11 gbrpmsbrgu11.corp.internal:8380 check','ROOT:haproxy_conf:\'gbrpmsbrgut2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(568,'mode','http','ROOT:haproxy_conf:\'gbrpmseasut2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(569,'bind_address','10.141.129.248','ROOT:haproxy_conf:\'gbrpmseasut2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(570,'bind_port','8853','ROOT:haproxy_conf:\'gbrpmseasut2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(571,'balance','roundrobin','ROOT:haproxy_conf:\'gbrpmseasut2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(572,'options','stick on src','ROOT:haproxy_conf:\'gbrpmseasut2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(573,'backends','gbrpmseasu11 gbrpmseasu11.corp.internal:8180 check','ROOT:haproxy_conf:\'gbrpmseasut2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(574,'options','stick-table type ip size 1m expire 3h','ROOT:haproxy_conf:\'gbrpmseasut2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(575,'mode','http','ROOT:haproxy_conf:\'gbrpmsuisut2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(576,'bind_address','10.141.129.247','ROOT:haproxy_conf:\'gbrpmsuisut2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(577,'bind_port','8853','ROOT:haproxy_conf:\'gbrpmsuisut2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(578,'balance','roundrobin','ROOT:haproxy_conf:\'gbrpmsuisut2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(579,'options','stick-table type ip size 1m expire 3h','ROOT:haproxy_conf:\'gbrpmsuisut2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(580,'options','stick on src','ROOT:haproxy_conf:\'gbrpmsuisut2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(581,'backends','gbrpmsuisu11 gbrpmsuisu11.corp.internal:8280 check','ROOT:haproxy_conf:\'gbrpmsuisut2\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(582,'bind_address','10.141.129.249','ROOT:haproxy_conf:\'gbrpmsbrgst1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(583,'mode','http','ROOT:haproxy_conf:\'gbrpmsbrgst1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(584,'bind_port','8889','ROOT:haproxy_conf:\'gbrpmsbrgst1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(585,'balance','roundrobin','ROOT:haproxy_conf:\'gbrpmsbrgst1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(586,'options','stick on src','ROOT:haproxy_conf:\'gbrpmsbrgst1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(587,'options','stick-table type ip size 1m expire 3h','ROOT:haproxy_conf:\'gbrpmsbrgst1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(588,'backends','gbrpmsbrgt01 gbrpmsbrgt01.corp.internal:8380 check','ROOT:haproxy_conf:\'gbrpmsbrgst1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(589,'backends','gbrpmsbrgt02 gbrpmsbrgt02.corp.internal:8380 check','ROOT:haproxy_conf:\'gbrpmsbrgst1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(590,'bind_port','8854','ROOT:haproxy_conf:\'gbrpmseasst1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(591,'mode','http','ROOT:haproxy_conf:\'gbrpmseasst1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(592,'bind_address','10.141.129.248','ROOT:haproxy_conf:\'gbrpmseasst1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(593,'balance','roundrobin','ROOT:haproxy_conf:\'gbrpmseasst1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(594,'options','stick on src','ROOT:haproxy_conf:\'gbrpmseasst1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(595,'backends','gbrpmseast01 gbrpmseast01.corp.internal:8180 check','ROOT:haproxy_conf:\'gbrpmseasst1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(596,'backends','gbrpmseast02 gbrpmseast02.corp.internal:8180 check','ROOT:haproxy_conf:\'gbrpmseasst1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(597,'options','stick-table type ip size 1m expire 3h','ROOT:haproxy_conf:\'gbrpmseasst1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(598,'mode','http','ROOT:haproxy_conf:\'gbrpmsuisst1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(599,'bind_address','10.141.129.247','ROOT:haproxy_conf:\'gbrpmsuisst1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(600,'bind_port','8854','ROOT:haproxy_conf:\'gbrpmsuisst1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(601,'options','stick-table type ip size 1m expire 3h','ROOT:haproxy_conf:\'gbrpmsuisst1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(602,'balance','roundrobin','ROOT:haproxy_conf:\'gbrpmsuisst1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(603,'options','stick on src','ROOT:haproxy_conf:\'gbrpmsuisst1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(604,'backends','gbrpmsuist01 gbrpmsuist01.corp.internal:8280 check','ROOT:haproxy_conf:\'gbrpmsuisst1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(605,'backends','gbrpmsuist02 gbrpmsuist02.corp.internal:8280 check','ROOT:haproxy_conf:\'gbrpmsuisst1\':{ParamName}','\0','\0','\0','','\0',0,'\0'),(606,'env','supp','ROOT:mysql_conf:talend_supp:{ParamName}','\0','\0','\0','','\0',0,'\0'),(607,'provide','base','ROOT:mysql_conf:{ParamName}','\0','\0','\0','','\0',0,'\0'),(608,'ccode','gbr','ROOT:mysql_conf:talend_supp:{ParamName}','\0','\0','\0','','\0',0,'\0'),(609,'user','tagbmdb','ROOT:mysql_conf:talend_supp:{ParamName}','\0','\0','\0','','\0',0,'\0'),(610,'app','tal','ROOT:mysql_conf:talend_supp:{ParamName}','\0','\0','\0','','\0',0,'\0'),(611,'group','tagbmdb','ROOT:mysql_conf:talend_supp:{ParamName}','\0','\0','\0','','\0',0,'\0'),(612,'vg','rootvg','ROOT:mysql_conf:talend_supp:{ParamName}','\0','\0','\0','','\0',0,'\0'),(613,'isbinding','true','ROOT:mysql_conf:talend_supp:{ParamName}','\0','\0','\0','','\0',0,'\0'),(614,'isreplication','false','ROOT:mysql_conf:talend_supp:{ParamName}','\0','\0','\0','','\0',0,'\0'),(615,'db','10G','ROOT:mysql_conf:talend_supp:sizes:{ParamName}','\0','\0','\0','# {env}b size: data files','\0',0,'\0'),(616,'files','1G','ROOT:mysql_conf:talend_supp:sizes:{ParamName}','\0','\0','\0','# {env}f size: \'files\', logs, pid, run, ...','\0',0,'\0'),(617,'inno','1G','ROOT:mysql_conf:talend_supp:sizes:{ParamName}','\0','\0','\0','# innolog directory size','\0',0,'\0'),(618,'soft','1G','ROOT:mysql_conf:talend_supp:sizes:{ParamName}','\0','\0','\0','# {env}s size: scripts, configuration, ...','\0',0,'\0'),(619,'binlog','3G','ROOT:mysql_conf:talend_supp:sizes:{ParamName}','\0','\0','\0','# binlog directory (if enabled, see below)','\0',0,'\0'),(620,'save','1G','ROOT:mysql_conf:talend_supp:sizes:{ParamName}','\0','\0','\0','','\0',0,'\0'),(621,'isbinlog','false','ROOT:mysql_conf:talend_supp:{ParamName}','\0','\0','\0','','\0',0,'\0'),(622,'port','3306','ROOT:mysql_conf:talend_supp:override_options:client:{ParamName}','\0','\0','\0','','\0',0,'\0'),(623,'bind_address','0.0.0.0','ROOT:mysql_conf:talend_supp:override_options:mysqld:{ParamName}','\0','\0','\0','','\0',0,'\0'),(624,'port ','3306','ROOT:mysql_conf:talend_supp:override_options:mysqld:{ParamName}','\0','\0','\0','','\0',0,'\0'),(625,'innodb_log_file_size','64M','ROOT:mysql_conf:talend_supp:override_options:mysqld:{ParamName}','\0','\0','\0','','\0',0,'\0'),(626,'root_pass','{SENSITIVE}','ROOT:mysql_conf:talend_supp:{ParamName}','\0','\0','\0','','',0,'\0'),(627,'ccode','gbr','ROOT:mysql_conf:talend_prod:{ParamName}','\0','\0','\0','','\0',0,'\0'),(628,'env','prod','ROOT:mysql_conf:talend_prod:{ParamName}','\0','\0','\0','','\0',0,'\0'),(629,'app','tal','ROOT:mysql_conf:talend_prod:{ParamName}','\0','\0','\0','','\0',0,'\0'),(630,'user','tagbpdb','ROOT:mysql_conf:talend_prod:{ParamName}','\0','\0','\0','','\0',0,'\0'),(631,'password','{SENSITIVE}','ROOT:mysql_conf:talend_prod:{ParamName}','\0','\0','\0','','',0,'\0'),(632,'group','tagbpdb','ROOT:mysql_conf:talend_prod:{ParamName}','\0','\0','\0','','\0',0,'\0'),(633,'vg','rootvg','ROOT:mysql_conf:talend_prod:{ParamName}','\0','\0','\0','','\0',0,'\0'),(634,'isbinding','true','ROOT:mysql_conf:talend_prod:{ParamName}','\0','\0','\0','','\0',0,'\0'),(635,'isreplication','false','ROOT:mysql_conf:talend_prod:{ParamName}','\0','\0','\0','','\0',0,'\0'),(636,'db','10G','ROOT:mysql_conf:talend_prod:sizes:{ParamName}','\0','\0','\0','# {env}b size: data files','\0',0,'\0'),(637,'files','1G','ROOT:mysql_conf:talend_prod:sizes:{ParamName}','\0','\0','\0','# {env}f size: \'files\', logs, pid, run, ...','\0',0,'\0'),(638,'soft','1G','ROOT:mysql_conf:talend_prod:sizes:{ParamName}','\0','\0','\0','# {env}s size: scripts, configuration, ...','\0',0,'\0'),(639,'inno','1G','ROOT:mysql_conf:talend_prod:sizes:{ParamName}','\0','\0','\0','# innolog directory size','\0',0,'\0'),(640,'save','1G','ROOT:mysql_conf:talend_prod:sizes:{ParamName}','\0','\0','\0','','\0',0,'\0'),(641,'binlog','3G','ROOT:mysql_conf:talend_prod:sizes:{ParamName}','\0','\0','\0','# binlog directory (if enabled, see below)','\0',0,'\0'),(642,'isbinlog','false','ROOT:mysql_conf:talend_prod:{ParamName}','\0','\0','\0','','\0',0,'\0'),(643,'port','3306','ROOT:mysql_conf:talend_prod:override_options:client:{ParamName}','\0','\0','\0','','\0',0,'\0'),(644,'bind_address','0.0.0.0','ROOT:mysql_conf:talend_prod:override_options:mysqld:{ParamName}','\0','\0','\0','','\0',0,'\0'),(645,'port ','3306','ROOT:mysql_conf:talend_prod:override_options:mysqld:{ParamName}','\0','\0','\0','','\0',0,'\0'),(646,'innodb_log_file_size','64M','ROOT:mysql_conf:talend_prod:override_options:mysqld:{ParamName}','\0','\0','\0','','\0',0,'\0'),(647,'env','supp','ROOT:mysql_conf:talend_supp:{ParamName}','\0','\0','\0','','\0',0,'\0'),(648,'root_pass','{SENSITIVE}','ROOT:mysql_conf:talend_prod:{ParamName}','\0','\0','\0','','',0,'\0'),(649,'ccode','gbr','ROOT:mysql_conf:talend_supp:{ParamName}','\0','\0','\0','','\0',0,'\0'),(650,'app','tal','ROOT:mysql_conf:talend_supp:{ParamName}','\0','\0','\0','','\0',0,'\0'),(651,'user','tagbmdb','ROOT:mysql_conf:talend_supp:{ParamName}','\0','\0','\0','','\0',0,'\0'),(652,'password','{SENSITIVE}','ROOT:mysql_conf:talend_supp:{ParamName}','\0','\0','\0','','',0,'\0'),(653,'group','tagbmdb','ROOT:mysql_conf:talend_supp:{ParamName}','\0','\0','\0','','\0',0,'\0'),(654,'isbinding','true','ROOT:mysql_conf:talend_supp:{ParamName}','\0','\0','\0','','\0',0,'\0'),(655,'vg','rootvg','ROOT:mysql_conf:talend_supp:{ParamName}','\0','\0','\0','','\0',0,'\0'),(656,'isreplication','false','ROOT:mysql_conf:talend_supp:{ParamName}','\0','\0','\0','','\0',0,'\0'),(657,'db','10G','ROOT:mysql_conf:talend_supp:sizes:{ParamName}','\0','\0','\0','# {env}b size: data files','\0',0,'\0'),(658,'files','1G','ROOT:mysql_conf:talend_supp:sizes:{ParamName}','\0','\0','\0','# {env}f size: \'files\', logs, pid, run, ...','\0',0,'\0'),(659,'soft','1G','ROOT:mysql_conf:talend_supp:sizes:{ParamName}','\0','\0','\0','# {env}s size: scripts, configuration, ...','\0',0,'\0'),(660,'inno','1G','ROOT:mysql_conf:talend_supp:sizes:{ParamName}','\0','\0','\0','# innolog directory size','\0',0,'\0'),(661,'binlog','3G','ROOT:mysql_conf:talend_supp:sizes:{ParamName}','\0','\0','\0','# binlog directory (if enabled, see below)','\0',0,'\0'),(662,'isbinlog','false','ROOT:mysql_conf:talend_supp:{ParamName}','\0','\0','\0','','\0',0,'\0'),(663,'save','1G','ROOT:mysql_conf:talend_supp:sizes:{ParamName}','\0','\0','\0','','\0',0,'\0'),(664,'port','3306','ROOT:mysql_conf:talend_supp:override_options:client:{ParamName}','\0','\0','\0','','\0',0,'\0'),(665,'bind_address','0.0.0.0','ROOT:mysql_conf:talend_supp:override_options:mysqld:{ParamName}','\0','\0','\0','','\0',0,'\0'),(666,'port ','3306','ROOT:mysql_conf:talend_supp:override_options:mysqld:{ParamName}','\0','\0','\0','','\0',0,'\0'),(667,'innodb_log_file_size','64M','ROOT:mysql_conf:talend_supp:override_options:mysqld:{ParamName}','\0','\0','\0','','\0',0,'\0'),(668,'root_pass','{SENSITIVE}','ROOT:mysql_conf:talend_supp:{ParamName}','\0','\0','\0','','',0,'\0'),(669,'env','stag','ROOT:mysql_conf:talend_stag:{ParamName}','\0','\0','\0','','\0',0,'\0'),(670,'app','tal','ROOT:mysql_conf:talend_stag:{ParamName}','\0','\0','\0','','\0',0,'\0'),(671,'ccode','gbr','ROOT:mysql_conf:talend_stag:{ParamName}','\0','\0','\0','','\0',0,'\0'),(672,'password','{SENSITIVE}','ROOT:mysql_conf:talend_stag:{ParamName}','\0','\0','\0','','',0,'\0'),(673,'user','tagbsdb','ROOT:mysql_conf:talend_stag:{ParamName}','\0','\0','\0','','\0',0,'\0'),(674,'group','tagbsdb','ROOT:mysql_conf:talend_stag:{ParamName}','\0','\0','\0','','\0',0,'\0'),(675,'vg','rootvg','ROOT:mysql_conf:talend_stag:{ParamName}','\0','\0','\0','','\0',0,'\0'),(676,'isbinding','true','ROOT:mysql_conf:talend_stag:{ParamName}','\0','\0','\0','','\0',0,'\0'),(677,'isreplication','false','ROOT:mysql_conf:talend_stag:{ParamName}','\0','\0','\0','','\0',0,'\0'),(678,'db','10G','ROOT:mysql_conf:talend_stag:sizes:{ParamName}','\0','\0','\0','# {env}b size: data files','\0',0,'\0'),(679,'soft','1G','ROOT:mysql_conf:talend_stag:sizes:{ParamName}','\0','\0','\0','# {env}s size: scripts, configuration, ...','\0',0,'\0'),(680,'files','1G','ROOT:mysql_conf:talend_stag:sizes:{ParamName}','\0','\0','\0','# {env}f size: \'files\', logs, pid, run, ...','\0',0,'\0'),(681,'binlog','3G','ROOT:mysql_conf:talend_stag:sizes:{ParamName}','\0','\0','\0','# binlog directory (if enabled, see below)','\0',0,'\0'),(682,'inno','1G','ROOT:mysql_conf:talend_stag:sizes:{ParamName}','\0','\0','\0','# innolog directory size','\0',0,'\0'),(683,'save','1G','ROOT:mysql_conf:talend_stag:sizes:{ParamName}','\0','\0','\0','','\0',0,'\0'),(684,'isbinlog','false','ROOT:mysql_conf:talend_stag:{ParamName}','\0','\0','\0','','\0',0,'\0'),(685,'port','3306','ROOT:mysql_conf:talend_stag:override_options:client:{ParamName}','\0','\0','\0','','\0',0,'\0'),(686,'bind_address','0.0.0.0','ROOT:mysql_conf:talend_stag:override_options:mysqld:{ParamName}','\0','\0','\0','','\0',0,'\0'),(687,'port ','3306','ROOT:mysql_conf:talend_stag:override_options:mysqld:{ParamName}','\0','\0','\0','','\0',0,'\0'),(688,'innodb_log_file_size','64M','ROOT:mysql_conf:talend_stag:override_options:mysqld:{ParamName}','\0','\0','\0','','\0',0,'\0'),(689,'root_pass','{SENSITIVE}','ROOT:mysql_conf:talend_stag:{ParamName}','\0','\0','\0','','',0,'\0'),(690,'env','test','ROOT:mysql_conf:talend_test:{ParamName}','\0','\0','\0','','\0',0,'\0'),(691,'app','tal','ROOT:mysql_conf:talend_test:{ParamName}','\0','\0','\0','','\0',0,'\0'),(692,'ccode','gbr','ROOT:mysql_conf:talend_test:{ParamName}','\0','\0','\0','','\0',0,'\0'),(693,'user','tagbtdb','ROOT:mysql_conf:talend_test:{ParamName}','\0','\0','\0','','\0',0,'\0'),(694,'group','tagbtdb','ROOT:mysql_conf:talend_test:{ParamName}','\0','\0','\0','','\0',0,'\0'),(695,'password','{SENSITIVE}','ROOT:mysql_conf:talend_test:{ParamName}','\0','\0','\0','','',0,'\0'),(696,'isbinding','true','ROOT:mysql_conf:talend_test:{ParamName}','\0','\0','\0','','\0',0,'\0'),(697,'db','10G','ROOT:mysql_conf:talend_test:sizes:{ParamName}','\0','\0','\0','# {env}b size: data files','\0',0,'\0'),(698,'vg','rootvg','ROOT:mysql_conf:talend_test:{ParamName}','\0','\0','\0','','\0',0,'\0'),(699,'isreplication','false','ROOT:mysql_conf:talend_test:{ParamName}','\0','\0','\0','','\0',0,'\0'),(700,'files','1G','ROOT:mysql_conf:talend_test:sizes:{ParamName}','\0','\0','\0','# {env}f size: \'files\', logs, pid, run, ...','\0',0,'\0'),(701,'soft','1G','ROOT:mysql_conf:talend_test:sizes:{ParamName}','\0','\0','\0','# {env}s size: scripts, configuration, ...','\0',0,'\0'),(702,'inno','1G','ROOT:mysql_conf:talend_test:sizes:{ParamName}','\0','\0','\0','# innolog directory size','\0',0,'\0'),(703,'binlog','3G','ROOT:mysql_conf:talend_test:sizes:{ParamName}','\0','\0','\0','# binlog directory (if enabled, see below)','\0',0,'\0'),(704,'save','1G','ROOT:mysql_conf:talend_test:sizes:{ParamName}','\0','\0','\0','','\0',0,'\0'),(705,'isbinlog','false','ROOT:mysql_conf:talend_test:{ParamName}','\0','\0','\0','','\0',0,'\0'),(706,'port','3306','ROOT:mysql_conf:talend_test:override_options:client:{ParamName}','\0','\0','\0','','\0',0,'\0'),(707,'bind_address','0.0.0.0','ROOT:mysql_conf:talend_test:override_options:mysqld:{ParamName}','\0','\0','\0','','\0',0,'\0'),(708,'port ','3306','ROOT:mysql_conf:talend_test:override_options:mysqld:{ParamName}','\0','\0','\0','','\0',0,'\0'),(709,'innodb_log_file_size','64M','ROOT:mysql_conf:talend_test:override_options:mysqld:{ParamName}','\0','\0','\0','','\0',0,'\0'),(710,'root_pass','{SENSITIVE}','ROOT:mysql_conf:talend_test:{ParamName}','\0','\0','\0','','',0,'\0'),(711,'ccode','gbr','ROOT:mysql_conf:talend_educ:{ParamName}','\0','\0','\0','','\0',0,'\0'),(712,'env','educ','ROOT:mysql_conf:talend_educ:{ParamName}','\0','\0','\0','','\0',0,'\0'),(713,'app','tal','ROOT:mysql_conf:talend_educ:{ParamName}','\0','\0','\0','','\0',0,'\0'),(714,'user','tagbedb','ROOT:mysql_conf:talend_educ:{ParamName}','\0','\0','\0','','\0',0,'\0'),(715,'password','{SENSITIVE}','ROOT:mysql_conf:talend_educ:{ParamName}','\0','\0','\0','','',0,'\0'),(716,'isbinding','true','ROOT:mysql_conf:talend_educ:{ParamName}','\0','\0','\0','','\0',0,'\0'),(717,'group','tagbedb','ROOT:mysql_conf:talend_educ:{ParamName}','\0','\0','\0','','\0',0,'\0'),(718,'vg','rootvg','ROOT:mysql_conf:talend_educ:{ParamName}','\0','\0','\0','','\0',0,'\0'),(719,'isreplication','false','ROOT:mysql_conf:talend_educ:{ParamName}','\0','\0','\0','','\0',0,'\0'),(720,'db','10G','ROOT:mysql_conf:talend_educ:sizes:{ParamName}','\0','\0','\0','# {env}b size: data files','\0',0,'\0'),(721,'files','1G','ROOT:mysql_conf:talend_educ:sizes:{ParamName}','\0','\0','\0','# {env}f size: \'files\', logs, pid, run, ...','\0',0,'\0'),(722,'soft','1G','ROOT:mysql_conf:talend_educ:sizes:{ParamName}','\0','\0','\0','# {env}s size: scripts, configuration, ...','\0',0,'\0'),(723,'binlog','3G','ROOT:mysql_conf:talend_educ:sizes:{ParamName}','\0','\0','\0','# binlog directory (if enabled, see below)','\0',0,'\0'),(724,'inno','1G','ROOT:mysql_conf:talend_educ:sizes:{ParamName}','\0','\0','\0','# innolog directory size','\0',0,'\0'),(725,'save','1G','ROOT:mysql_conf:talend_educ:sizes:{ParamName}','\0','\0','\0','','\0',0,'\0'),(726,'isbinlog','false','ROOT:mysql_conf:talend_educ:{ParamName}','\0','\0','\0','','\0',0,'\0'),(727,'port','3306','ROOT:mysql_conf:talend_educ:override_options:client:{ParamName}','\0','\0','\0','','\0',0,'\0'),(728,'bind_address','0.0.0.0','ROOT:mysql_conf:talend_educ:override_options:mysqld:{ParamName}','\0','\0','\0','','\0',0,'\0'),(729,'port ','3306','ROOT:mysql_conf:talend_educ:override_options:mysqld:{ParamName}','\0','\0','\0','','\0',0,'\0'),(730,'innodb_log_file_size','64M','ROOT:mysql_conf:talend_educ:override_options:mysqld:{ParamName}','\0','\0','\0','','\0',0,'\0'),(731,'root_pass','{SENSITIVE}','ROOT:mysql_conf:talend_educ:{ParamName}','\0','\0','\0','','',0,'\0'),(732,'env','test','ROOT:mysql_conf:talend_sdbx:{ParamName}','\0','\0','\0','','\0',0,'\0'),(733,'ccode','gbr','ROOT:mysql_conf:talend_sdbx:{ParamName}','\0','\0','\0','','\0',0,'\0'),(734,'app','tal','ROOT:mysql_conf:talend_sdbx:{ParamName}','\0','\0','\0','','\0',0,'\0'),(735,'user','tagbtdb','ROOT:mysql_conf:talend_sdbx:{ParamName}','\0','\0','\0','','\0',0,'\0'),(736,'group','tagbtdb','ROOT:mysql_conf:talend_sdbx:{ParamName}','\0','\0','\0','','\0',0,'\0'),(737,'vg','rootvg','ROOT:mysql_conf:talend_sdbx:{ParamName}','\0','\0','\0','','\0',0,'\0'),(738,'isbinding','true','ROOT:mysql_conf:talend_sdbx:{ParamName}','\0','\0','\0','','\0',0,'\0'),(739,'isreplication','false','ROOT:mysql_conf:talend_sdbx:{ParamName}','\0','\0','\0','','\0',0,'\0'),(740,'db','10G','ROOT:mysql_conf:talend_sdbx:sizes:{ParamName}','\0','\0','\0','# {env}b size: data files','\0',0,'\0'),(741,'files','1G','ROOT:mysql_conf:talend_sdbx:sizes:{ParamName}','\0','\0','\0','# {env}f size: \'files\', logs, pid, run, ...','\0',0,'\0'),(742,'soft','1G','ROOT:mysql_conf:talend_sdbx:sizes:{ParamName}','\0','\0','\0','# {env}s size: scripts, configuration, ...','\0',0,'\0'),(743,'inno','1G','ROOT:mysql_conf:talend_sdbx:sizes:{ParamName}','\0','\0','\0','# innolog directory size','\0',0,'\0'),(744,'binlog','3G','ROOT:mysql_conf:talend_sdbx:sizes:{ParamName}','\0','\0','\0','# binlog directory (if enabled, see below)','\0',0,'\0'),(745,'port','3306','ROOT:mysql_conf:talend_sdbx:override_options:client:{ParamName}','\0','\0','\0','','\0',0,'\0'),(746,'isbinlog','false','ROOT:mysql_conf:talend_sdbx:{ParamName}','\0','\0','\0','','\0',0,'\0'),(747,'save','1G','ROOT:mysql_conf:talend_sdbx:sizes:{ParamName}','\0','\0','\0','','\0',0,'\0'),(748,'bind_address','0.0.0.0','ROOT:mysql_conf:talend_sdbx:override_options:mysqld:{ParamName}','\0','\0','\0','','\0',0,'\0'),(749,'innodb_log_file_size','64M','ROOT:mysql_conf:talend_sdbx:override_options:mysqld:{ParamName}','\0','\0','\0','','\0',0,'\0'),(750,'port ','3306','ROOT:mysql_conf:talend_sdbx:override_options:mysqld:{ParamName}','\0','\0','\0','','\0',0,'\0'),(751,'root_pass','{SENSITIVE}','ROOT:mysql_conf:talend_sdbx:{ParamName}','\0','\0','\0','','',0,'\0'),(752,'name','tsfz_portal','ROOT:mysql_db:tsfz_portal_prod:{ParamName}','\0','\0','\0','','\0',0,'\0'),(753,'engine','talend_prod','ROOT:mysql_db:tsfz_portal_prod:{ParamName}','\0','\0','\0','','\0',0,'\0'),(754,'host','%','ROOT:mysql_db:tsfz_portal_prod:users:tsfz_portal_prod_from_all_on_tsfz_portal_prod:{ParamName}','\0','\0','\0','','\0',0,'\0'),(755,'name','tagbpdb','ROOT:mysql_db:tsfz_portal_prod:users:tsfz_portal_prod_from_all_on_tsfz_portal_prod:{ParamName}','\0','\0','\0','','\0',0,'\0'),(756,'grant','ALL','ROOT:mysql_db:tsfz_portal_prod:users:tsfz_portal_prod_from_all_on_tsfz_portal_prod:{ParamName}','\0','\0','\0','','\0',0,'\0'),(757,'name','job_conf','ROOT:mysql_db:job_conf_prod:{ParamName}','\0','\0','\0','','\0',0,'\0'),(758,'engine','talend_prod','ROOT:mysql_db:job_conf_prod:{ParamName}','\0','\0','\0','','\0',0,'\0'),(759,'name','tagbpdb','ROOT:mysql_db:job_conf_prod:users:job_conf_prod_from_all_on_job_conf_prod:{ParamName}','\0','\0','\0','','\0',0,'\0'),(760,'host','%','ROOT:mysql_db:job_conf_prod:users:job_conf_prod_from_all_on_job_conf_prod:{ParamName}','\0','\0','\0','','\0',0,'\0'),(761,'grant','ALL','ROOT:mysql_db:job_conf_prod:users:job_conf_prod_from_all_on_job_conf_prod:{ParamName}','\0','\0','\0','','\0',0,'\0'),(762,'name','tsfz_portal','ROOT:mysql_db:tsfz_portal_supp:{ParamName}','\0','\0','\0','','\0',0,'\0'),(763,'engine','talend_supp','ROOT:mysql_db:tsfz_portal_supp:{ParamName}','\0','\0','\0','','\0',0,'\0'),(764,'name','tagbmdb','ROOT:mysql_db:tsfz_portal_supp:users:tsfz_portal_supp_from_all_on_tsfz_portal_supp:{ParamName}','\0','\0','\0','','\0',0,'\0'),(765,'host','%','ROOT:mysql_db:tsfz_portal_supp:users:tsfz_portal_supp_from_all_on_tsfz_portal_supp:{ParamName}','\0','\0','\0','','\0',0,'\0'),(766,'grant','ALL','ROOT:mysql_db:tsfz_portal_supp:users:tsfz_portal_supp_from_all_on_tsfz_portal_supp:{ParamName}','\0','\0','\0','','\0',0,'\0'),(767,'name','job_conf','ROOT:mysql_db:job_conf_supp:{ParamName}','\0','\0','\0','','\0',0,'\0'),(768,'engine','talend_supp','ROOT:mysql_db:job_conf_supp:{ParamName}','\0','\0','\0','','\0',0,'\0'),(769,'name','tagbmdb','ROOT:mysql_db:job_conf_supp:users:job_conf_supp_from_all_on_job_conf_supp:{ParamName}','\0','\0','\0','','\0',0,'\0'),(770,'host','%','ROOT:mysql_db:job_conf_supp:users:job_conf_supp_from_all_on_job_conf_supp:{ParamName}','\0','\0','\0','','\0',0,'\0'),(771,'grant','ALL','ROOT:mysql_db:job_conf_supp:users:job_conf_supp_from_all_on_job_conf_supp:{ParamName}','\0','\0','\0','','\0',0,'\0'),(772,'name','tsfz_portal','ROOT:mysql_db:tsfz_portal_stag:{ParamName}','\0','\0','\0','','\0',0,'\0'),(773,'engine','talend_stag','ROOT:mysql_db:tsfz_portal_stag:{ParamName}','\0','\0','\0','','\0',0,'\0'),(774,'name','tagbsdb','ROOT:mysql_db:tsfz_portal_stag:users:tsfz_portal_stag_from_all_on_tsfz_portal_stag:{ParamName}','\0','\0','\0','','\0',0,'\0'),(775,'host','%','ROOT:mysql_db:tsfz_portal_stag:users:tsfz_portal_stag_from_all_on_tsfz_portal_stag:{ParamName}','\0','\0','\0','','\0',0,'\0'),(776,'grant','ALL','ROOT:mysql_db:tsfz_portal_stag:users:tsfz_portal_stag_from_all_on_tsfz_portal_stag:{ParamName}','\0','\0','\0','','\0',0,'\0'),(777,'name','job_conf','ROOT:mysql_db:job_conf_stag:{ParamName}','\0','\0','\0','','\0',0,'\0'),(778,'engine','talend_stag','ROOT:mysql_db:job_conf_stag:{ParamName}','\0','\0','\0','','\0',0,'\0'),(779,'name','tagbsdb','ROOT:mysql_db:job_conf_stag:users:job_conf_stag_from_all_on_job_conf_stag:{ParamName}','\0','\0','\0','','\0',0,'\0'),(780,'host','%','ROOT:mysql_db:job_conf_stag:users:job_conf_stag_from_all_on_job_conf_stag:{ParamName}','\0','\0','\0','','\0',0,'\0'),(781,'grant','ALL','ROOT:mysql_db:job_conf_stag:users:job_conf_stag_from_all_on_job_conf_stag:{ParamName}','\0','\0','\0','','\0',0,'\0'),(782,'name','tsfz_portal','ROOT:mysql_db:tsfz_portal_test:{ParamName}','\0','\0','\0','','\0',0,'\0'),(783,'engine','talend_test','ROOT:mysql_db:tsfz_portal_test:{ParamName}','\0','\0','\0','','\0',0,'\0'),(784,'name','tagbtdb','ROOT:mysql_db:tsfz_portal_test:users:tsfz_portal_test_from_all_on_tsfz_portal_test:{ParamName}','\0','\0','\0','','\0',0,'\0'),(785,'host','%','ROOT:mysql_db:tsfz_portal_test:users:tsfz_portal_test_from_all_on_tsfz_portal_test:{ParamName}','\0','\0','\0','','\0',0,'\0'),(786,'engine','talend_test','ROOT:mysql_db:job_conf_test:{ParamName}','\0','\0','\0','','\0',0,'\0'),(787,'name','job_conf','ROOT:mysql_db:job_conf_test:{ParamName}','\0','\0','\0','','\0',0,'\0'),(788,'grant','ALL','ROOT:mysql_db:tsfz_portal_test:users:tsfz_portal_test_from_all_on_tsfz_portal_test:{ParamName}','\0','\0','\0','','\0',0,'\0'),(789,'name','tagbtdb','ROOT:mysql_db:job_conf_test:users:job_conf_test_from_all_on_job_conf_test:{ParamName}','\0','\0','\0','','\0',0,'\0'),(790,'host','%','ROOT:mysql_db:job_conf_test:users:job_conf_test_from_all_on_job_conf_test:{ParamName}','\0','\0','\0','','\0',0,'\0'),(791,'grant','ALL','ROOT:mysql_db:job_conf_test:users:job_conf_test_from_all_on_job_conf_test:{ParamName}','\0','\0','\0','','\0',0,'\0'),(792,'engine','talend_educ','ROOT:mysql_db:tsfz_portal_educ:{ParamName}','\0','\0','\0','','\0',0,'\0'),(793,'name','tsfz_portal','ROOT:mysql_db:tsfz_portal_educ:{ParamName}','\0','\0','\0','','\0',0,'\0'),(794,'name','tagbedb','ROOT:mysql_db:tsfz_portal_educ:users:tsfz_portal_educ_from_all_on_tsfz_portal_test:{ParamName}','\0','\0','\0','','\0',0,'\0'),(795,'host','%','ROOT:mysql_db:tsfz_portal_educ:users:tsfz_portal_educ_from_all_on_tsfz_portal_test:{ParamName}','\0','\0','\0','','\0',0,'\0'),(796,'grant','ALL','ROOT:mysql_db:tsfz_portal_educ:users:tsfz_portal_educ_from_all_on_tsfz_portal_test:{ParamName}','\0','\0','\0','','\0',0,'\0'),(797,'name','job_conf','ROOT:mysql_db:job_conf_educ:{ParamName}','\0','\0','\0','','\0',0,'\0'),(798,'engine','talend_educ','ROOT:mysql_db:job_conf_educ:{ParamName}','\0','\0','\0','','\0',0,'\0'),(799,'name','tagbedb','ROOT:mysql_db:job_conf_educ:users:job_conf_educ_from_all_on_job_conf_test:{ParamName}','\0','\0','\0','','\0',0,'\0'),(800,'host','%','ROOT:mysql_db:job_conf_educ:users:job_conf_educ_from_all_on_job_conf_test:{ParamName}','\0','\0','\0','','\0',0,'\0'),(801,'grant','ALL','ROOT:mysql_db:job_conf_educ:users:job_conf_educ_from_all_on_job_conf_test:{ParamName}','\0','\0','\0','','\0',0,'\0'),(802,'name','tsfz_portal','ROOT:mysql_db:tsfz_portal_supp:{ParamName}','\0','\0','\0','','\0',0,'\0'),(803,'host','%','ROOT:mysql_db:tsfz_portal_supp:users:tsfz_portal_supp_from_all_on_tsfz_portal_supp:{ParamName}','\0','\0','\0','','\0',0,'\0'),(804,'name','tagbmdb','ROOT:mysql_db:tsfz_portal_supp:users:tsfz_portal_supp_from_all_on_tsfz_portal_supp:{ParamName}','\0','\0','\0','','\0',0,'\0'),(805,'engine','talend_supp','ROOT:mysql_db:tsfz_portal_supp:{ParamName}','\0','\0','\0','','\0',0,'\0'),(806,'name','job_conf','ROOT:mysql_db:job_conf_supp:{ParamName}','\0','\0','\0','','\0',0,'\0'),(807,'engine','talend_supp','ROOT:mysql_db:job_conf_supp:{ParamName}','\0','\0','\0','','\0',0,'\0'),(808,'grant','ALL','ROOT:mysql_db:tsfz_portal_supp:users:tsfz_portal_supp_from_all_on_tsfz_portal_supp:{ParamName}','\0','\0','\0','','\0',0,'\0'),(809,'name','tagbmdb','ROOT:mysql_db:job_conf_supp:users:job_conf_supp_from_all_on_job_conf_supp:{ParamName}','\0','\0','\0','','\0',0,'\0'),(810,'grant','ALL','ROOT:mysql_db:job_conf_supp:users:job_conf_supp_from_all_on_job_conf_supp:{ParamName}','\0','\0','\0','','\0',0,'\0'),(811,'host','%','ROOT:mysql_db:job_conf_supp:users:job_conf_supp_from_all_on_job_conf_supp:{ParamName}','\0','\0','\0','','\0',0,'\0'),(812,'name','tsfz_portal','ROOT:mysql_db:tsfz_portal_sdbx:{ParamName}','\0','\0','\0','','\0',0,'\0'),(813,'engine','talend_sdbx','ROOT:mysql_db:tsfz_portal_sdbx:{ParamName}','\0','\0','\0','','\0',0,'\0'),(814,'name','tagbtdb','ROOT:mysql_db:tsfz_portal_sdbx:users:tsfz_portal_supp_from_all_on_tsfz_portal_sdbx:{ParamName}','\0','\0','\0','','\0',0,'\0'),(815,'grant','ALL','ROOT:mysql_db:tsfz_portal_sdbx:users:tsfz_portal_supp_from_all_on_tsfz_portal_sdbx:{ParamName}','\0','\0','\0','','\0',0,'\0'),(816,'host','%','ROOT:mysql_db:tsfz_portal_sdbx:users:tsfz_portal_supp_from_all_on_tsfz_portal_sdbx:{ParamName}','\0','\0','\0','','\0',0,'\0'),(817,'name','job_conf','ROOT:mysql_db:job_conf_sdbx:{ParamName}','\0','\0','\0','','\0',0,'\0'),(818,'engine','talend_sdbx','ROOT:mysql_db:job_conf_sdbx:{ParamName}','\0','\0','\0','','\0',0,'\0'),(819,'name','tagbtdb','ROOT:mysql_db:job_conf_sdbx:users:job_conf_supp_from_all_on_job_conf_sdbx:{ParamName}','\0','\0','\0','','\0',0,'\0'),(820,'host','%','ROOT:mysql_db:job_conf_sdbx:users:job_conf_supp_from_all_on_job_conf_sdbx:{ParamName}','\0','\0','\0','','\0',0,'\0'),(821,'grant','ALL','ROOT:mysql_db:job_conf_sdbx:users:job_conf_supp_from_all_on_job_conf_sdbx:{ParamName}','\0','\0','\0','','\0',0,'\0'),(822,'prod','tsfz_portal_prod','ROOT:talend_databases:{ParamName}','\0','\0','\0','','\0',0,'\0'),(823,'prod','job_conf_prod','ROOT:talend_databases:{ParamName}','\0','\0','\0','','\0',0,'\0'),(824,'supp','tsfz_portal_supp','ROOT:talend_databases:{ParamName}','\0','\0','\0','','\0',0,'\0'),(825,'supp','job_conf_supp','ROOT:talend_databases:{ParamName}','\0','\0','\0','','\0',0,'\0'),(826,'stag','tsfz_portal_stag','ROOT:talend_databases:{ParamName}','\0','\0','\0','','\0',0,'\0'),(827,'stag','job_conf_stag','ROOT:talend_databases:{ParamName}','\0','\0','\0','','\0',0,'\0'),(828,'test','tsfz_portal_test','ROOT:talend_databases:{ParamName}','\0','\0','\0','','\0',0,'\0'),(829,'test','job_conf_test','ROOT:talend_databases:{ParamName}','\0','\0','\0','','\0',0,'\0'),(830,'educ','job_conf_educ','ROOT:talend_databases:{ParamName}','\0','\0','\0','','\0',0,'\0'),(831,'educ','tsfz_portal_educ','ROOT:talend_databases:{ParamName}','\0','\0','\0','','\0',0,'\0'),(832,'supp','tsfz_portal_supp','ROOT:talend_databases:{ParamName}','\0','\0','\0','','\0',0,'\0'),(833,'supp','job_conf_supp','ROOT:talend_databases:{ParamName}','\0','\0','\0','','\0',0,'\0'),(834,'sdbx','tsfz_portal_sdbx','ROOT:talend_databases:{ParamName}','\0','\0','\0','','\0',0,'\0'),(835,'sdbx','job_conf_sdbx','ROOT:talend_databases:{ParamName}','\0','\0','\0','','\0',0,'\0'),(836,'env','supp','ROOT:talend_supp_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(837,'ccode','gbr','ROOT:talend_supp_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(838,'app','tal','ROOT:talend_supp_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(839,'user','tagbmadm','ROOT:talend_supp_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(840,'group','tagbm','ROOT:talend_supp_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(841,'nfsserver','10.136.60.104','ROOT:talend_supp_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(842,'installinterfaces','true','ROOT:talend_supp_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(843,'installoracli','false','ROOT:talend_supp_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(844,'installdb2cli','false','ROOT:talend_supp_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(845,'jdk_version','1.6.0_37','ROOT:talend_supp_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(846,'jdk_release','0HS','ROOT:talend_supp_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(847,'db2_vers','97','ROOT:talend_supp_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(848,'envs_base','/supps/talend','ROOT:talend_supp_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(849,'envf_base','/suppf/talend','ROOT:talend_supp_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(850,'envb_base','/suppb/talend','ROOT:talend_supp_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(851,'vg','rootvg','ROOT:talend_supp_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(852,'size_envs_tal','2G','ROOT:talend_supp_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(853,'size_envf_tal','1G','ROOT:talend_supp_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(854,'size_envb_tal','2G','ROOT:talend_supp_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(855,'size_exchange','2G','ROOT:talend_supp_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(856,'size_history','5G','ROOT:talend_supp_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(857,'size_internal','1G','ROOT:talend_supp_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(858,'env','prod','ROOT:talend_prod_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(859,'app','tal','ROOT:talend_prod_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(860,'ccode','gbr','ROOT:talend_prod_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(861,'group','tagbp','ROOT:talend_prod_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(862,'user','tagbpadm','ROOT:talend_prod_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(863,'nfsserver','127.0.0.1','ROOT:talend_prod_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(864,'installinterfaces','true','ROOT:talend_prod_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(865,'installoracli','false','ROOT:talend_prod_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(866,'installdb2cli','false','ROOT:talend_prod_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(867,'jdk_release','0HS','ROOT:talend_prod_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(868,'jdk_version','1.6.0_37','ROOT:talend_prod_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(869,'envs_base','/prods/talend','ROOT:talend_prod_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(870,'db2_vers','97','ROOT:talend_prod_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(871,'envf_base','/prodf/talend','ROOT:talend_prod_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(872,'envb_base','/prodb/talend','ROOT:talend_prod_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(873,'vg','rootvg','ROOT:talend_prod_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(874,'size_envs_tal','3G','ROOT:talend_prod_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(875,'size_envb_tal','2G','ROOT:talend_prod_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(876,'size_envf_tal','1G','ROOT:talend_prod_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(877,'size_exchange','2G','ROOT:talend_prod_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(878,'size_history','5G','ROOT:talend_prod_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(879,'size_internal','1G','ROOT:talend_prod_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(880,'istsfn','true','ROOT:talend_prod_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(881,'env','supp','ROOT:talend_supp_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(882,'app','tal','ROOT:talend_supp_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(883,'ccode','gbr','ROOT:talend_supp_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(884,'user','tagbmadm','ROOT:talend_supp_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(885,'group','tagbm','ROOT:talend_supp_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(886,'nfsserver','127.0.0.1','ROOT:talend_supp_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(887,'installinterfaces','true','ROOT:talend_supp_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(888,'installoracli','false','ROOT:talend_supp_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(889,'installdb2cli','false','ROOT:talend_supp_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(890,'jdk_version','1.6.0_37','ROOT:talend_supp_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(891,'db2_vers','97','ROOT:talend_supp_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(892,'jdk_release','0HS','ROOT:talend_supp_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(893,'envs_base','/supps/talend','ROOT:talend_supp_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(894,'envf_base','/suppf/talend','ROOT:talend_supp_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(895,'envb_base','/suppb/talend','ROOT:talend_supp_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(896,'vg','rootvg','ROOT:talend_supp_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(897,'size_envs_tal','3G','ROOT:talend_supp_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(898,'size_envf_tal','1G','ROOT:talend_supp_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(899,'size_envb_tal','2G','ROOT:talend_supp_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(900,'size_exchange','2G','ROOT:talend_supp_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(901,'size_history','5G','ROOT:talend_supp_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(902,'size_internal','1G','ROOT:talend_supp_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(903,'istsfn','true','ROOT:talend_supp_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(904,'ccode','gbr','ROOT:talend_stag_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(905,'env','stag','ROOT:talend_stag_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(906,'app','tal','ROOT:talend_stag_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(907,'user','tagbsadm','ROOT:talend_stag_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(908,'group','tagbs','ROOT:talend_stag_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(909,'nfsserver','127.0.0.1','ROOT:talend_stag_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(910,'installinterfaces','true','ROOT:talend_stag_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(911,'installoracli','false','ROOT:talend_stag_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(912,'installdb2cli','false','ROOT:talend_stag_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(913,'jdk_version','1.6.0_37','ROOT:talend_stag_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(914,'jdk_release','0HS','ROOT:talend_stag_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(915,'db2_vers','97','ROOT:talend_stag_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(916,'envs_base','/stags/talend','ROOT:talend_stag_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(917,'envf_base','/stagf/talend','ROOT:talend_stag_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(918,'envb_base','/stagb/talend','ROOT:talend_stag_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(919,'vg','rootvg','ROOT:talend_stag_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(920,'size_envs_tal','3G','ROOT:talend_stag_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(921,'size_envf_tal','1G','ROOT:talend_stag_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(922,'size_envb_tal','2G','ROOT:talend_stag_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(923,'size_exchange','2G','ROOT:talend_stag_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(924,'size_history','5G','ROOT:talend_stag_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(925,'size_internal','1G','ROOT:talend_stag_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(926,'env','test','ROOT:talend_test_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(927,'istsfn','true','ROOT:talend_stag_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(928,'ccode','gbr','ROOT:talend_test_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(929,'app','tal','ROOT:talend_test_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(930,'user','tagbtadm','ROOT:talend_test_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(931,'group','tagbt','ROOT:talend_test_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(932,'nfsserver','127.0.0.1','ROOT:talend_test_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(933,'installinterfaces','true','ROOT:talend_test_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(934,'installoracli','false','ROOT:talend_test_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(935,'installdb2cli','false','ROOT:talend_test_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(936,'jdk_version','1.6.0_37','ROOT:talend_test_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(937,'db2_vers','97','ROOT:talend_test_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(938,'envs_base','/tests/talend','ROOT:talend_test_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(939,'jdk_release','0HS','ROOT:talend_test_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(940,'envf_base','/testf/talend','ROOT:talend_test_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(941,'envb_base','/testb/talend','ROOT:talend_test_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(942,'vg','rootvg','ROOT:talend_test_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(943,'size_envs_tal','3G','ROOT:talend_test_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(944,'size_envf_tal','1G','ROOT:talend_test_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(945,'size_envb_tal','2G','ROOT:talend_test_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(946,'size_exchange','2G','ROOT:talend_test_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(947,'size_history','5G','ROOT:talend_test_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(948,'size_internal','1G','ROOT:talend_test_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(949,'env','educ','ROOT:talend_educ_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(950,'ccode','gbr','ROOT:talend_educ_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(951,'istsfn','true','ROOT:talend_test_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(952,'app','tal','ROOT:talend_educ_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(953,'user','tagbeadm','ROOT:talend_educ_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(954,'nfsserver','127.0.0.1','ROOT:talend_educ_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(955,'group','tagbe','ROOT:talend_educ_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(956,'installinterfaces','true','ROOT:talend_educ_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(957,'installoracli','false','ROOT:talend_educ_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(958,'installdb2cli','false','ROOT:talend_educ_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(959,'jdk_version','1.6.0_37','ROOT:talend_educ_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(960,'jdk_release','0HS','ROOT:talend_educ_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(961,'db2_vers','97','ROOT:talend_educ_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(962,'envs_base','/educs/talend','ROOT:talend_educ_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(963,'envf_base','/educf/talend','ROOT:talend_educ_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(964,'envb_base','/educb/talend','ROOT:talend_educ_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(965,'vg','rootvg','ROOT:talend_educ_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(966,'size_envs_tal','3G','ROOT:talend_educ_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(967,'size_envf_tal','1G','ROOT:talend_educ_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(968,'size_envb_tal','2G','ROOT:talend_educ_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(969,'size_exchange','2G','ROOT:talend_educ_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(970,'size_history','5G','ROOT:talend_educ_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(971,'size_internal','1G','ROOT:talend_educ_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(972,'env','test','ROOT:talend_sdbx_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(973,'istsfn','true','ROOT:talend_educ_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(974,'app','tal','ROOT:talend_sdbx_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(975,'ccode','gbr','ROOT:talend_sdbx_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(976,'user','tagbtadm','ROOT:talend_sdbx_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(977,'group','tagbt','ROOT:talend_sdbx_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(978,'nfsserver','10.136.60.104','ROOT:talend_sdbx_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(979,'installinterfaces','true','ROOT:talend_sdbx_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(980,'installdb2cli','false','ROOT:talend_sdbx_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(981,'installoracli','false','ROOT:talend_sdbx_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(982,'jdk_version','1.6.0_37','ROOT:talend_sdbx_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(983,'jdk_release','0HS','ROOT:talend_sdbx_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(984,'db2_vers','97','ROOT:talend_sdbx_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(985,'envs_base','/tests/talend','ROOT:talend_sdbx_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(986,'envf_base','/testf/talend','ROOT:talend_sdbx_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(987,'envb_base','/testb/talend','ROOT:talend_sdbx_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(988,'vg','rootvg','ROOT:talend_sdbx_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(989,'size_envs_tal','2G','ROOT:talend_sdbx_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(990,'size_envf_tal','1G','ROOT:talend_sdbx_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(991,'size_envb_tal','2G','ROOT:talend_sdbx_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(992,'size_exchange','2G','ROOT:talend_sdbx_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(993,'uid','1001','ROOT:user_tagbmdb:{ParamName}','\0','\0','\0','','\0',0,'\0'),(994,'size_internal','1G','ROOT:talend_sdbx_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(995,'size_history','5G','ROOT:talend_sdbx_info:{ParamName}','\0','\0','\0','','\0',0,'\0'),(996,'gid','1000','ROOT:user_tagbmdb:{ParamName}','\0','\0','\0','','\0',0,'\0'),(997,'groups','tagbmdb','ROOT:user_tagbmdb:{ParamName}','\0','\0','\0','','\0',0,'\0'),(998,'home','/home/tagbmdb','ROOT:user_tagbmdb:{ParamName}','\0','\0','\0','','\0',0,'\0'),(999,'password','{SENSITIVE}','ROOT:user_tagbmdb:{ParamName}','\0','\0','\0','','',0,'\0'),(1000,'uid','1000','ROOT:user_tagbmadm:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1001,'gid','1000','ROOT:user_tagbmadm:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1002,'groups','tagbm','ROOT:user_tagbmadm:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1003,'home','/home/tagbmadm','ROOT:user_tagbmadm:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1004,'password','{SENSITIVE}','ROOT:user_tagbmadm:{ParamName}','\0','\0','\0','','',0,'\0'),(1005,'authorized_keys_file','oneleonardo/ssh/authorized_keys.erb','ROOT:user_tagbmadm:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1006,'TSFN_columbus','true','ROOT:user_tagbmadm:authorized_keys:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1007,'jobdesign','true','ROOT:user_tagbmadm:authorized_keys:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1008,'integration','true','ROOT:user_tagbmadm:authorized_keys:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1009,'tagbmadm_gbrpmstalm02','true','ROOT:user_tagbmadm:authorized_keys:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1010,'boots_support','true','ROOT:user_tagbmadm:authorized_keys:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1011,'ukops','true','ROOT:user_tagbmadm:authorized_keys:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1012,'uid','1001','ROOT:user_tagbpdb:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1013,'gid','1000','ROOT:user_tagbpdb:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1014,'groups','tagbpdb','ROOT:user_tagbpdb:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1015,'home','/home/tagbpdb','ROOT:user_tagbpdb:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1016,'password','{SENSITIVE}','ROOT:user_tagbpdb:{ParamName}','\0','\0','\0','','',0,'\0'),(1017,'uid','1000','ROOT:user_tagbpadm:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1018,'gid','1000','ROOT:user_tagbpadm:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1019,'groups','tagbp','ROOT:user_tagbpadm:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1020,'home','/home/tagbpadm','ROOT:user_tagbpadm:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1021,'password','{SENSITIVE}','ROOT:user_tagbpadm:{ParamName}','\0','\0','\0','','',0,'\0'),(1022,'authorized_keys_file','oneleonardo/ssh/authorized_keys.erb','ROOT:user_tagbpadm:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1023,'boots_support','true','ROOT:user_tagbpadm:authorized_keys:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1024,'integration','true','ROOT:user_tagbpadm:authorized_keys:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1025,'TSFN_columbus','true','ROOT:user_tagbpadm:authorized_keys:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1026,'jobdesign','true','ROOT:user_tagbpadm:authorized_keys:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1027,'uid','1001','ROOT:user_tagbsdb:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1028,'gid','1000','ROOT:user_tagbsdb:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1029,'groups','tagbsdb','ROOT:user_tagbsdb:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1030,'home','/home/tagbsdb','ROOT:user_tagbsdb:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1031,'password','{SENSITIVE}','ROOT:user_tagbsdb:{ParamName}','\0','\0','\0','','',0,'\0'),(1032,'uid','1000','ROOT:user_tagbsadm:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1033,'gid','1000','ROOT:user_tagbsadm:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1034,'groups','tagbs','ROOT:user_tagbsadm:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1035,'home','/home/tagbsadm','ROOT:user_tagbsadm:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1036,'password','{SENSITIVE}','ROOT:user_tagbsadm:{ParamName}','\0','\0','\0','','',0,'\0'),(1037,'TSFN_columbus','true','ROOT:user_tagbsadm:authorized_keys:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1038,'authorized_keys_file','oneleonardo/ssh/authorized_keys.erb','ROOT:user_tagbsadm:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1039,'integration','true','ROOT:user_tagbsadm:authorized_keys:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1040,'boots_support','true','ROOT:user_tagbsadm:authorized_keys:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1041,'boots_performance_test','true','ROOT:user_tagbsadm:authorized_keys:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1042,'devel','true','ROOT:user_tagbsadm:authorized_keys:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1043,'gid','1000','ROOT:user_tagbtdb:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1044,'uid','1001','ROOT:user_tagbtdb:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1045,'groups','tagbtdb','ROOT:user_tagbtdb:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1046,'home','/home/tagbtdb','ROOT:user_tagbtdb:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1047,'password','{SENSITIVE}','ROOT:user_tagbtdb:{ParamName}','\0','\0','\0','','',0,'\0'),(1048,'uid','1000','ROOT:user_tagbtadm:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1049,'gid','1000','ROOT:user_tagbtadm:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1050,'groups','tagbt','ROOT:user_tagbtadm:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1051,'home','\'/home/tagbtadm','ROOT:user_tagbtadm:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1052,'password','{SENSITIVE}','ROOT:user_tagbtadm:{ParamName}','\0','\0','\0','','',0,'\0'),(1053,'authorized_keys_file','oneleonardo/ssh/authorized_keys.erb','ROOT:user_tagbtadm:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1054,'TSFN_columbus','true','ROOT:user_tagbtadm:authorized_keys:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1055,'integration','true','ROOT:user_tagbtadm:authorized_keys:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1056,'boots_support','true','ROOT:user_tagbtadm:authorized_keys:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1057,'boots_performance_test','true','ROOT:user_tagbtadm:authorized_keys:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1058,'devel','true','ROOT:user_tagbtadm:authorized_keys:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1059,'uid','1001','ROOT:user_tagbedb:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1060,'gid','1000','ROOT:user_tagbedb:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1061,'groups','tagbedb','ROOT:user_tagbedb:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1062,'home','/home/tagbedb','ROOT:user_tagbedb:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1063,'password','{SENSITIVE}','ROOT:user_tagbedb:{ParamName}','\0','\0','\0','','',0,'\0'),(1064,'uid','1000','ROOT:user_tagbeadm:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1065,'gid','1000','ROOT:user_tagbeadm:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1066,'groups','tagbe','ROOT:user_tagbeadm:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1067,'home','/home/tagbeadm','ROOT:user_tagbeadm:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1068,'password','{SENSITIVE}','ROOT:user_tagbeadm:{ParamName}','\0','\0','\0','','',0,'\0'),(1069,'TSFN_columbus','true','ROOT:user_tagbeadm:authorized_keys:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1070,'authorized_keys_file','oneleonardo/ssh/authorized_keys.erb','ROOT:user_tagbeadm:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1071,'integration','true','ROOT:user_tagbeadm:authorized_keys:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1072,'boots_support','true','ROOT:user_tagbeadm:authorized_keys:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1073,'boots_performance_test','true','ROOT:user_tagbeadm:authorized_keys:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1074,'devel','true','ROOT:user_tagbeadm:authorized_keys:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1075,'envb','/exchange/inbound','ROOT:talend_dirs:common:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1076,'envb','/exchange/outbound','ROOT:talend_dirs:common:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1077,'envb','/exchange/outbound/columbus','ROOT:talend_dirs:common:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1078,'envb','/exchange/inbound/columbus','ROOT:talend_dirs:common:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1079,'envb','/exchange/outbound/optimus','ROOT:talend_dirs:common:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1080,'envb','/exchange/inbound/optimus','ROOT:talend_dirs:common:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1081,'envb','/parameters/columbus','ROOT:talend_dirs:common:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1082,'envb','/parameters/optimus','ROOT:talend_dirs:common:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1083,'envb','/internal/columbus','ROOT:talend_dirs:common:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1084,'envb','/internal/optimus','ROOT:talend_dirs:common:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1085,'envf','/logs/optimus','ROOT:talend_dirs:common:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1086,'envf','/logs/columbus','ROOT:talend_dirs:common:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1087,'envf','/history/storage','ROOT:talend_dirs:common:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1088,'envf','/history/inbound','ROOT:talend_dirs:common:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1089,'envf','/history/outbound','ROOT:talend_dirs:common:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1090,'envf','/archives/columbus','ROOT:talend_dirs:common:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1091,'envf','/archives/optimus','ROOT:talend_dirs:common:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1092,'envf','/history/inbound/columbus','ROOT:talend_dirs:common:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1093,'envf','/history/inbound/optimus','ROOT:talend_dirs:common:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1094,'envf','/history/outbound/columbus','ROOT:talend_dirs:common:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1095,'envf','/history/outbound/optimus','ROOT:talend_dirs:common:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1096,'envs','/jobs/scripts/columbus','ROOT:talend_dirs:common:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1097,'envs','/jobs/scripts/optimus','ROOT:talend_dirs:common:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1098,'envb','/parameters/columbus/EK4DK','ROOT:talend_dirs:tsfn_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1099,'envb','/exchange/outbound/optimus/data/Drop','ROOT:talend_dirs:tsfn_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1100,'envb','/exchange/outbound/optimus/data/FailedOutput','ROOT:talend_dirs:tsfn_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1101,'envb','/exchange/outbound/optimus/data/IntermediateOutput','ROOT:talend_dirs:tsfn_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1102,'envb','/exchange/outbound/optimus/data/NotProcessed','ROOT:talend_dirs:tsfn_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1103,'envb','/exchange/outbound/optimus/data/ProcessedOutput','ROOT:talend_dirs:tsfn_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1104,'envb','/exchange/outbound/optimus/data/ProcessedSource','ROOT:talend_dirs:tsfn_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1105,'envb','/exchange/outbound/optimus/data/tmp','ROOT:talend_dirs:tsfn_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1106,'envb','/exchange/outbound/optimus/emailpickupfolder','ROOT:talend_dirs:tsfn_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1107,'envs','/jobs/scripts/columbus/move-scripts','ROOT:talend_dirs:tsfn_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1108,'envb','/exchange/inbound/columbus/bad','ROOT:talend_dirs:tsfz_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1109,'envb','/exchange/inbound/columbus/csv','ROOT:talend_dirs:tsfz_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1110,'envb','/exchange/inbound/columbus/release_2_1','ROOT:talend_dirs:tsfz_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1111,'envb','/exchange/inbound/columbus/release_2_2','ROOT:talend_dirs:tsfz_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1112,'envb','/exchange/inbound/columbus/release_2_3','ROOT:talend_dirs:tsfz_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1113,'envb','/exchange/inbound/columbus/release_2_4','ROOT:talend_dirs:tsfz_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1114,'envb','/exchange/inbound/columbus/release_7','ROOT:talend_dirs:tsfz_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1115,'envb','/exchange/outbound/columbus/release_2_1','ROOT:talend_dirs:tsfz_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1116,'envb','/exchange/outbound/columbus/release_2_2','ROOT:talend_dirs:tsfz_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1117,'envb','/exchange/outbound/columbus/release_2_3','ROOT:talend_dirs:tsfz_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1118,'envb','/exchange/outbound/columbus/release_2_4','ROOT:talend_dirs:tsfz_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1119,'envb','/exchange/outbound/columbus/release_7','ROOT:talend_dirs:tsfz_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1120,'envb','/exchange/NFM/columbus/IG33','ROOT:talend_dirs:tsfz_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1121,'envb','/internal/columbus/readmeFiles','ROOT:talend_dirs:tsfz_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1122,'envb','/internal/columbus/rootZipFiles','ROOT:talend_dirs:tsfz_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1123,'envb','/internal/columbus/insideCSVFiles','ROOT:talend_dirs:tsfz_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1124,'envb','/internal/columbus/insideZipFiles','ROOT:talend_dirs:tsfz_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1125,'envb','/internal/columbus/IG33','ROOT:talend_dirs:tsfz_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1126,'envf','/history/inbound/columbus/readmeFiles','ROOT:talend_dirs:tsfz_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1127,'envf','/history/inbound/columbus/release_2_1','ROOT:talend_dirs:tsfz_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1128,'envf','/history/inbound/columbus/release_2_2','ROOT:talend_dirs:tsfz_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1129,'envf','/history/inbound/columbus/release_2_3','ROOT:talend_dirs:tsfz_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1130,'envf','/history/inbound/columbus/release_2_4','ROOT:talend_dirs:tsfz_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1131,'envf','/history/inbound/columbus/release_7','ROOT:talend_dirs:tsfz_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1132,'envf','/history/inbound/columbus/IG33','ROOT:talend_dirs:tsfz_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1133,'envf','/history/outbound/columbus/readmeFiles','ROOT:talend_dirs:tsfz_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1134,'envf','/history/outbound/columbus/release_2_1','ROOT:talend_dirs:tsfz_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1135,'envf','/history/outbound/columbus/release_2_2','ROOT:talend_dirs:tsfz_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1136,'envf','/history/outbound/columbus/release_2_3','ROOT:talend_dirs:tsfz_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1137,'envf','/history/outbound/columbus/release_7','ROOT:talend_dirs:tsfz_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1138,'envf','/history/outbound/columbus/release_2_4','ROOT:talend_dirs:tsfz_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1139,'envf','/history/outbound/columbus/IG33','ROOT:talend_dirs:tsfz_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1140,'envs','/script/admin','ROOT:talend_dirs:tsfz_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1141,'envs','/jobs/scripts/columbus/move-scripts','ROOT:talend_dirs:tsfz_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1142,'envb','/exchange/outbound/optimus/pce','ROOT:talend_dirs:pce_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1143,'envb','/internal/optimus/pce/qAutomatInput/bad','ROOT:talend_dirs:pce_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1144,'envb','/internal/optimus/pce/qAutomatInput','ROOT:talend_dirs:pce_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1145,'envb','/internal/optimus/pce/qAutomatOutput','ROOT:talend_dirs:pce_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1146,'envb','/internal/optimus/pce/qAutomatOutput/bad','ROOT:talend_dirs:pce_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1147,'envb','/internal/optimus/pce/qCombined','ROOT:talend_dirs:pce_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1148,'envb','/internal/optimus/pce/qCombined/bad','ROOT:talend_dirs:pce_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1149,'envb','/internal/optimus/pce/qCombined/tmp','ROOT:talend_dirs:pce_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1150,'envb','/internal/optimus/pce/qIF130_FinanceFeed','ROOT:talend_dirs:pce_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1151,'envb','/internal/optimus/pce/qIF130_FinanceFeed/bad','ROOT:talend_dirs:pce_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1152,'envb','/internal/optimus/pce/qIF134','ROOT:talend_dirs:pce_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1153,'envb','/internal/optimus/pce/qIF137_Audit','ROOT:talend_dirs:pce_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1154,'envb','/internal/optimus/pce/qIF137_Audit/bad','ROOT:talend_dirs:pce_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1155,'envb','/internal/optimus/pce/qIF138_IMS_DTP','ROOT:talend_dirs:pce_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1156,'envb','/internal/optimus/pce/qIF138_Mftr_Audit','ROOT:talend_dirs:pce_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1157,'envb','/internal/optimus/pce/qIF138_IMS_DTP/bad','ROOT:talend_dirs:pce_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1158,'envb','/internal/optimus/pce/qIF138_Mftr_Audit/bad','ROOT:talend_dirs:pce_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1159,'envb','/internal/optimus/pce/qIF59','ROOT:talend_dirs:pce_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1160,'envb','/internal/optimus/pce/qIF59/bad','ROOT:talend_dirs:pce_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1161,'envb','/internal/optimus/pce/qIF90_DeliveryRequest','ROOT:talend_dirs:pce_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1162,'envb','/internal/optimus/pce/qLabelData','ROOT:talend_dirs:pce_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1163,'envb','/internal/optimus/pce/qIF90_DeliveryRequest/bad','ROOT:talend_dirs:pce_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1164,'envb','/internal/optimus/pce/qLabels','ROOT:talend_dirs:pce_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1165,'envb','/internal/optimus/pce/qTote_Centric_Data1','ROOT:talend_dirs:pce_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1166,'envb','/parameters/optimus/pce','ROOT:talend_dirs:pce_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1167,'envb','/internal/optimus/pce/tmp','ROOT:talend_dirs:pce_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1168,'envf','/history/inbound/optimus/pce','ROOT:talend_dirs:pce_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1169,'envf','/history/internal/optimus/pce/qAutomatInput','ROOT:talend_dirs:pce_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1170,'envf','/history/internal/optimus/pce/qAutomatOutput','ROOT:talend_dirs:pce_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1171,'envf','/history/internal/optimus/pce/qCombined','ROOT:talend_dirs:pce_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1172,'envf','/history/internal/optimus/pce/qIF130_FinanceFeed','ROOT:talend_dirs:pce_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1173,'envf','/history/internal/optimus/pce/qIF138_IMS_DTP','ROOT:talend_dirs:pce_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1174,'envf','/history/internal/optimus/pce/qIF134','ROOT:talend_dirs:pce_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1175,'envf','/history/internal/optimus/pce/qIF137_Audit','ROOT:talend_dirs:pce_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1176,'envf','/history/internal/optimus/pce/qIF138_Mftr_Audit','ROOT:talend_dirs:pce_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1177,'envf','/history/internal/optimus/pce/qIF90_DeliveryRequest','ROOT:talend_dirs:pce_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1178,'envf','/history/internal/optimus/pce/qLabelData','ROOT:talend_dirs:pce_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1179,'envf','/history/internal/optimus/pce/qTote_Centric_Data1','ROOT:talend_dirs:pce_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1180,'envf','/history/outbound/optimus/pce','ROOT:talend_dirs:pce_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1181,'envf','/logs/optimus/pce','ROOT:talend_dirs:pce_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1182,'envf','/jobs/scripts/optimus/pce','ROOT:talend_dirs:pce_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1183,'envs','/script/admin','ROOT:talend_dirs:pce_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1184,'envs','/admin/scripts/filterOutDownStream','ROOT:talend_dirs:pce_only:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1185,'columbus','jobs/scripts/columbus','ROOT:projects_path:{ParamName}','\0','\0','\0','','\0',0,'\0'),(1186,'optimus','jobs/scripts/optimus','ROOT:projects_path:{ParamName}','\0','\0','\0','','\0',0,'\0');
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
  `Version` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`NodeID`)
) ENGINE=InnoDB AUTO_INCREMENT=288 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cm_node`
--

LOCK TABLES `cm_node` WRITE;
/*!40000 ALTER TABLE `cm_node` DISABLE KEYS */;
INSERT INTO `cm_node` VALUES (1,'Server',0),(2,'Server',0),(3,'Server',0),(4,'Server',0),(5,'Server',0),(6,'Server',0),(7,'Server',0),(8,'Server',0),(9,'Server',0),(10,'Server',0),(11,'Server',0),(12,'Server',0),(13,'Server',0),(14,'Server',0),(19,'Server',0),(20,'Server',0),(21,'Server',0),(22,'Server',0),(23,'Server',0),(24,'Server',0),(25,'Server',0),(28,'Server',0),(29,'Server',0),(30,'Server',0),(31,'Server',0),(32,'Server',0),(33,'Server',0),(34,'Server',0),(35,'Server',0),(36,'Server',0),(37,'Server',0),(38,'Server',0),(39,'Server',0),(40,'Server',0),(41,'Server',0),(42,'Server',0),(43,'Server',0),(44,'Server',0),(45,'Server',0),(46,'Server',0),(47,'Server',0),(48,'Server',0),(49,'Server',0),(50,'Server',0),(51,'Server',0),(52,'Server',0),(53,'Server',0),(54,'Server',0),(55,'Server',0),(56,'Server',0),(57,'Server',0),(58,'Server',0),(59,'Server',0),(60,'Server',0),(61,'Server',0),(62,'Server',0),(63,'Server',0),(64,'Server',0),(65,'Server',0),(66,'Server',0),(67,'Server',0),(68,'Server',0),(69,'Server',0),(70,'Server',0),(71,'Server',0),(72,'Server',0),(73,'Server',0),(74,'Server',0),(75,'Server',0),(76,'Server',0),(77,'Server',0),(78,'Server',0),(79,'Server',0),(80,'Server',0),(81,'Server',0),(82,'Server',0),(83,'Server',0),(84,'Server',0),(85,'Server',0),(86,'Server',0),(87,'Server',0),(88,'Server',0),(89,'Server',0),(90,'Server',0),(91,'Server',0),(92,'Server',0),(93,'Server',0),(94,'Server',0),(95,'Server',0),(96,'Server',0),(97,'Server',0),(98,'Server',0),(99,'Server',0),(100,'Server',0),(101,'Server',0),(102,'Server',0),(103,'Server',0),(104,'Server',0),(105,'Server',0),(106,'Server',0),(107,'Server',0),(108,'Server',0),(109,'Server',0),(110,'Server',0),(111,'Server',0),(112,'Server',0),(113,'Server',0),(114,'Server',0),(115,'Server',0),(116,'Server',0),(117,'Server',0),(118,'Server',0),(119,'Server',0),(120,'Server',0),(121,'Server',0),(122,'Server',0),(123,'Server',0),(124,'Server',0),(125,'Server',0),(126,'Server',0),(127,'Server',0),(128,'Server',0),(129,'Server',0),(130,'Server',0),(131,'Server',0),(132,'Server',0),(133,'Server',0),(134,'VIP',0),(135,'VIP',0),(136,'VIP',0),(137,'Server',0),(138,'Server',0),(139,'Server',0),(140,'Server',0),(141,'Server',0),(142,'Server',0),(143,'Server',0),(144,'Server',0),(145,'Server',0),(146,'Server',0),(147,'Server',0),(148,'Server',0),(149,'Server',0),(150,'Server',0),(151,'Server',0),(152,'Server',0),(153,'Server',0),(154,'Server',0),(155,'Server',0),(156,'Server',0),(157,'Server',0),(158,'Server',0),(159,'Server',0),(160,'Server',0),(161,'Server',0),(162,'Server',0),(163,'Server',0),(164,'Server',0),(165,'Server',0),(166,'Server',0),(167,'Server',0),(168,'Server',0),(169,'Server',0),(170,'Server',0),(171,'Server',0),(172,'Server',0),(173,'Server',0),(174,'Server',0),(175,'Server',0),(176,'Server',0),(177,'Server',0),(178,'Server',0),(179,'VIP',0),(180,'Server',0),(181,'Server',0),(182,'Server',0),(183,'Server',0),(184,'Server',0),(185,'Server',0),(186,'Server',0),(187,'Server',0),(188,'Server',0),(189,'Server',0),(190,'Server',0),(191,'Server',0),(192,'Server',0),(193,'Server',0),(194,'VIP',0),(195,'VIP',0),(196,'VIP',0),(197,'VIP',0),(198,'VIP',0),(199,'Server',0),(200,'Server',0),(201,'Server',0),(202,'Server',0),(203,'Server',0),(204,'Server',0),(205,'Server',0),(206,'Server',0),(207,'Server',0),(208,'Server',0),(209,'Server',0),(210,'Server',0),(211,'Server',0),(212,'Server',0),(213,'Server',0),(214,'Server',0),(215,'Server',0),(216,'Server',0),(217,'Server',0),(218,'Server',0),(219,'Server',0),(220,'Server',0),(221,'Server',0),(222,'Server',0),(223,'Server',0),(224,'Server',0),(225,'Server',0),(226,'Server',0),(227,'VIP',0),(228,'Server',0),(229,'Server',0),(230,'Server',0),(231,'Server',0),(232,'Server',0),(233,'Server',0),(234,'Server',0),(235,'Server',0),(236,'Server',0),(237,'Server',0),(238,'Server',0),(239,'Server',0),(240,'Server',0),(241,'Server',0),(242,'Server',0),(243,'Server',0),(244,'Server',0),(245,'Server',0),(246,'Server',0),(247,'Server',0),(248,'Server',0),(249,'Server',0),(250,'Server',0),(251,'Server',0),(252,'Server',0),(253,'Server',0),(254,'Server',0),(255,'Server',0),(256,'Server',0),(257,'Server',0),(258,'Server',0),(259,'Server',0),(260,'Server',0),(261,'Server',0),(262,'Server',0),(263,'Server',0),(264,'Server',0),(265,'Server',0),(266,'Server',0),(267,'Server',0),(268,'Server',0),(269,'Server',0),(270,'Server',0),(271,'Server',0),(272,'VIP',0),(273,'VIP',0),(274,'VIP',0),(275,'VIP',0),(276,'VIP',0),(277,'VIP',0),(278,'VIP',0),(279,'VIP',0),(280,'VIP',0),(281,'VIP',0),(282,'VIP',0),(283,'VIP',0),(284,'VIP',0),(285,'VIP',0),(286,'VIP',0),(287,'VIP',0);
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
  `Version` bigint(20) NOT NULL DEFAULT '0',
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
INSERT INTO `cm_node_subenvironment` VALUES (1,36,1,0),(2,2,1,0),(3,3,1,0),(4,4,1,0),(5,5,1,0),(6,6,1,0),(7,7,1,0),(8,8,1,0),(9,9,1,0),(10,10,1,0),(11,11,1,0),(12,12,1,0),(13,13,1,0),(14,14,1,0),(15,19,2,0),(16,20,2,0),(17,21,2,0),(18,22,2,0),(19,23,2,0),(20,24,2,0),(21,25,2,0),(22,36,2,0),(23,12,2,0),(24,13,2,0),(25,14,2,0),(28,28,5,0),(29,29,6,0),(30,30,5,0),(31,31,6,0),(32,33,5,0),(33,34,6,0),(34,35,7,0),(35,36,7,0),(36,37,7,0),(37,38,7,0),(38,39,7,0),(39,40,7,0),(40,41,7,0),(41,42,7,0),(42,43,7,0),(43,44,7,0),(44,12,7,0),(45,13,7,0),(46,14,7,0),(47,45,8,0),(48,46,8,0),(49,36,8,0),(50,47,8,0),(51,48,8,0),(52,49,8,0),(53,50,8,0),(54,51,8,0),(55,52,8,0),(56,12,8,0),(57,13,8,0),(58,14,8,0),(59,53,9,0),(60,54,9,0),(61,36,9,0),(62,55,9,0),(63,56,9,0),(64,57,9,0),(65,58,9,0),(66,59,9,0),(67,12,9,0),(68,13,9,0),(69,14,9,0),(70,36,10,0),(71,60,10,0),(72,61,10,0),(73,62,10,0),(74,63,10,0),(75,64,10,0),(76,65,10,0),(77,66,10,0),(78,67,10,0),(79,68,10,0),(80,69,10,0),(81,12,10,0),(82,13,10,0),(83,14,10,0),(84,36,11,0),(86,74,11,0),(87,75,11,0),(88,76,11,0),(89,77,11,0),(90,78,11,0),(91,12,11,0),(92,13,11,0),(93,14,11,0),(94,79,20,0),(95,80,20,0),(96,36,12,0),(97,81,12,0),(98,82,12,0),(99,83,12,0),(100,84,12,0),(101,85,12,0),(102,12,12,0),(103,13,12,0),(104,14,12,0),(105,86,13,0),(106,87,13,0),(107,36,13,0),(108,88,13,0),(109,89,13,0),(110,90,13,0),(111,91,13,0),(112,92,13,0),(113,12,13,0),(114,13,13,0),(115,14,13,0),(116,93,14,0),(117,94,14,0),(118,36,14,0),(119,95,14,0),(120,96,14,0),(121,97,14,0),(122,98,14,0),(123,99,14,0),(124,12,14,0),(125,13,14,0),(126,14,14,0),(127,100,15,0),(128,101,15,0),(129,36,15,0),(131,102,16,0),(132,103,16,0),(133,36,16,0),(134,104,16,0),(135,105,16,0),(136,106,16,0),(137,107,16,0),(138,108,16,0),(139,12,16,0),(140,13,16,0),(141,14,16,0),(142,109,17,0),(143,110,17,0),(144,36,17,0),(145,111,17,0),(146,112,17,0),(147,113,17,0),(148,114,17,0),(149,115,17,0),(150,12,17,0),(151,13,17,0),(152,14,17,0),(153,1,1,0),(154,1,2,0),(155,1,8,0),(156,1,9,0),(157,1,10,0),(158,1,11,0),(159,1,12,0),(160,1,13,0),(161,1,14,0),(162,1,15,0),(163,1,16,0),(164,1,17,0),(165,1,7,0),(166,32,6,0),(167,32,5,0),(168,116,7,0),(169,116,8,0),(170,116,9,0),(171,116,10,0),(172,116,11,0),(173,116,12,0),(174,116,2,0),(175,116,13,0),(176,116,14,0),(177,116,15,0),(178,116,16,0),(179,116,17,0),(180,116,1,0),(181,117,7,0),(182,117,8,0),(183,117,9,0),(184,117,10,0),(185,117,11,0),(186,117,12,0),(187,117,2,0),(188,117,13,0),(189,117,14,0),(190,117,15,0),(191,117,16,0),(192,117,17,0),(193,117,1,0),(194,118,7,0),(195,119,7,0),(196,120,7,0),(197,120,8,0),(198,118,8,0),(199,119,8,0),(200,120,9,0),(201,118,9,0),(202,119,9,0),(203,120,10,0),(204,118,10,0),(205,119,10,0),(206,120,11,0),(207,118,11,0),(208,119,11,0),(209,120,12,0),(210,118,12,0),(211,119,12,0),(212,121,21,0),(213,122,21,0),(214,123,2,0),(215,120,2,0),(216,118,2,0),(217,119,2,0),(218,120,13,0),(219,118,13,0),(220,119,13,0),(221,120,14,0),(222,118,14,0),(223,119,14,0),(224,120,16,0),(225,118,16,0),(226,119,16,0),(227,120,17,0),(228,118,17,0),(229,119,17,0),(230,120,1,0),(231,118,1,0),(232,119,1,0),(233,124,7,0),(234,125,8,0),(235,126,9,0),(236,127,12,0),(237,128,2,0),(238,129,13,0),(239,130,14,0),(240,131,16,0),(241,132,17,0),(242,133,1,0),(243,72,18,0),(245,70,18,0),(246,71,19,0),(247,134,7,0),(248,135,7,0),(249,136,7,0),(250,134,8,0),(251,135,8,0),(252,136,8,0),(253,134,9,0),(254,135,9,0),(255,136,9,0),(256,134,10,0),(257,135,10,0),(258,136,10,0),(259,134,18,0),(260,135,18,0),(261,134,19,0),(262,135,19,0),(263,136,11,0),(264,134,20,0),(265,135,20,0),(266,134,21,0),(267,135,21,0),(269,136,2,0),(270,135,2,0),(271,134,2,0),(275,134,14,0),(276,135,14,0),(277,136,14,0),(278,134,15,0),(279,135,15,0),(280,136,15,0),(281,137,15,0),(282,134,16,0),(283,135,16,0),(284,136,16,0),(285,134,17,0),(286,135,17,0),(287,136,17,0),(288,134,1,0),(289,135,1,0),(290,136,1,0),(291,138,5,0),(293,139,6,0),(295,73,19,0),(296,140,25,0),(297,141,25,0),(298,142,25,0),(299,143,25,0),(300,144,26,0),(301,145,26,0),(302,146,26,0),(303,147,26,0),(304,148,27,0),(305,149,27,0),(306,150,27,0),(307,151,27,0),(308,152,25,0),(309,153,25,0),(310,154,25,0),(311,155,25,0),(312,156,26,0),(313,157,26,0),(314,158,26,0),(315,159,26,0),(316,160,27,0),(317,161,27,0),(318,162,27,0),(319,163,27,0),(320,164,27,0),(321,165,27,0),(322,166,22,0),(323,167,22,0),(324,168,22,0),(325,169,22,0),(326,170,22,0),(327,171,22,0),(328,172,22,0),(329,173,22,0),(330,174,22,0),(331,175,22,0),(332,176,22,0),(333,177,22,0),(334,178,22,0),(335,179,22,0),(336,180,22,0),(337,181,22,0),(338,182,22,0),(339,183,22,0),(340,184,23,0),(341,185,23,0),(342,186,23,0),(343,187,23,0),(344,188,23,0),(345,189,23,0),(346,190,23,0),(347,166,23,0),(348,167,23,0),(349,168,23,0),(350,169,23,0),(351,191,23,0),(352,192,23,0),(353,193,23,0),(356,196,23,0),(357,197,23,0),(358,198,23,0),(359,179,23,0),(360,199,28,0),(361,200,28,0),(362,201,29,0),(363,202,29,0),(364,203,30,0),(365,204,30,0),(366,205,28,0),(367,206,28,0),(368,207,29,0),(369,208,29,0),(370,209,30,0),(371,210,30,0),(372,211,28,0),(373,212,28,0),(374,213,29,0),(375,214,29,0),(376,215,30,0),(377,216,30,0),(378,217,24,0),(379,218,24,0),(380,219,24,0),(381,220,24,0),(382,221,24,0),(383,222,24,0),(384,223,24,0),(385,224,24,0),(386,225,24,0),(387,226,24,0),(388,227,24,0),(389,228,24,0),(390,229,33,0),(391,230,33,0),(392,231,33,0),(393,232,33,0),(394,233,34,0),(395,234,34,0),(396,235,34,0),(397,236,34,0),(398,237,35,0),(399,238,35,0),(400,239,35,0),(401,240,35,0),(402,241,33,0),(403,242,33,0),(404,243,33,0),(405,244,33,0),(406,245,34,0),(407,246,34,0),(408,247,34,0),(409,248,34,0),(410,249,35,0),(411,250,35,0),(412,251,35,0),(413,252,35,0),(414,253,35,0),(415,254,35,0),(416,255,32,0),(417,256,32,0),(418,257,32,0),(419,258,32,0),(420,259,32,0),(421,260,32,0),(422,261,32,0),(423,262,32,0),(424,263,32,0),(425,264,32,0),(426,265,32,0),(427,266,32,0),(428,267,32,0),(429,268,32,0),(430,269,32,0),(431,270,32,0),(432,271,32,0),(433,272,32,0),(434,273,22,0),(435,274,22,0),(436,275,32,0),(437,276,32,0),(438,277,25,0),(439,278,26,0),(440,279,27,0),(441,280,22,0),(442,281,32,0),(443,282,33,0),(444,283,34,0),(445,284,35,0),(446,285,28,0),(447,286,29,0),(448,287,30,0);
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
  `NodeIPAddress` varchar(255) NOT NULL,
  `NodeIPType` enum('VIRTUAL','PHYSICAL','WIRED') NOT NULL,
  `Version` bigint(20) NOT NULL DEFAULT '0',
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
INSERT INTO `cm_nodeip` VALUES (9,247,'10.141.129.247','VIRTUAL',0),(10,248,'10.141.129.248','VIRTUAL',0),(11,249,'10.141.129.249','VIRTUAL',0),(12,250,'10.141.129.247','VIRTUAL',0),(13,251,'10.141.129.248','VIRTUAL',0),(14,252,'10.141.129.249','VIRTUAL',0),(15,253,'10.141.129.247','VIRTUAL',0),(16,254,'10.141.129.248','VIRTUAL',0),(17,255,'10.141.129.249','VIRTUAL',0),(18,256,'10.141.129.247','VIRTUAL',0),(19,257,'10.141.129.248','VIRTUAL',0),(20,258,'10.141.129.249','VIRTUAL',0),(21,259,'10.141.129.247','VIRTUAL',0),(22,261,'10.141.129.247','VIRTUAL',0),(23,260,'10.141.129.248','VIRTUAL',0),(24,262,'10.141.129.248','VIRTUAL',0),(25,263,'10.141.129.249','VIRTUAL',0),(26,165,'10.141.129.1','PHYSICAL',0),(27,34,'10.141.129.3','PHYSICAL',0),(28,36,'10.141.129.95','PHYSICAL',0),(29,37,'10.141.129.10','PHYSICAL',0),(30,38,'10.141.129.12','PHYSICAL',0),(31,39,'10.141.129.13','PHYSICAL',0),(32,168,'10.141.129.75','PHYSICAL',0),(33,181,'10.141.129.70','PHYSICAL',0),(34,43,'10.141.129.80','PHYSICAL',0),(35,44,'10.141.129.84','PHYSICAL',0),(37,40,'10.141.129.85','PHYSICAL',0),(38,41,'10.141.129.241','PHYSICAL',0),(39,42,'10.141.129.94','PHYSICAL',0),(40,194,'10.141.129.227','PHYSICAL',0),(41,195,'10.141.129.228','PHYSICAL',0),(42,233,'10.141.129.39','PHYSICAL',0),(43,45,'10.141.129.14','PHYSICAL',0),(44,196,'10.141.129.16','PHYSICAL',0),(45,46,'10.141.129.15','PHYSICAL',0),(46,35,'10.141.129.251','PHYSICAL',0),(47,155,'10.141.129.1','PHYSICAL',0),(48,47,'10.141.129.4','PHYSICAL',0),(49,48,'10.141.129.96','PHYSICAL',0),(50,50,'10.141.129.19','PHYSICAL',0),(51,51,'10.141.129.38','PHYSICAL',0),(52,169,'10.141.129.75','PHYSICAL',0),(53,182,'10.141.129.70','PHYSICAL',0),(54,55,'10.141.129.81','PHYSICAL',0),(55,56,'10.141.129.84','PHYSICAL',0),(56,52,'10.141.129.86','PHYSICAL',0),(57,53,'10.141.129.91','PHYSICAL',0),(58,54,'10.141.129.77','PHYSICAL',0),(59,198,'10.141.129.227','PHYSICAL',0),(60,199,'10.141.129.228','PHYSICAL',0),(61,234,'10.141.129.40','PHYSICAL',0),(62,57,'10.141.129.14','PHYSICAL',0),(63,197,'10.141.129.16','PHYSICAL',0),(64,58,'10.141.129.15','PHYSICAL',0),(65,49,'10.141.129.251','PHYSICAL',0),(66,156,'10.141.129.1','PHYSICAL',0),(67,59,'10.141.129.7','PHYSICAL',0),(68,60,'10.141.129.8','PHYSICAL',0),(69,62,'10.141.129.9','PHYSICAL',0),(70,170,'10.141.129.75','PHYSICAL',0),(71,183,'10.141.129.70','PHYSICAL',0),(72,66,'10.141.129.20','PHYSICAL',0),(73,67,'10.141.129.84','PHYSICAL',0),(74,63,'10.141.129.21','PHYSICAL',0),(75,64,'10.141.129.22','PHYSICAL',0),(76,65,'10.141.129.23','PHYSICAL',0),(77,201,'10.141.129.227','PHYSICAL',0),(78,202,'10.141.129.228','PHYSICAL',0),(79,235,'10.141.129.41','PHYSICAL',0),(80,68,'10.141.129.14','PHYSICAL',0),(81,200,'10.141.129.16','PHYSICAL',0),(82,69,'10.141.129.15','PHYSICAL',0),(83,61,'10.141.129.251','PHYSICAL',0),(84,157,'10.141.129.1','PHYSICAL',0),(85,71,'10.141.129.63','PHYSICAL',0),(86,72,'10.141.129.64','PHYSICAL',0),(87,73,'10.141.129.65','PHYSICAL',0),(88,74,'10.141.129.66','PHYSICAL',0),(89,75,'10.141.129.67','PHYSICAL',0),(90,76,'10.141.129.68','PHYSICAL',0),(91,171,'10.141.129.75','PHYSICAL',0),(92,184,'10.141.129.70','PHYSICAL',0),(93,80,'10.141.129.69','PHYSICAL',0),(94,81,'10.141.129.84','PHYSICAL',0),(95,77,'10.141.129.101','PHYSICAL',0),(96,78,'10.141.129.102','PHYSICAL',0),(97,79,'10.141.129.103','PHYSICAL',0),(98,204,'10.141.129.227','PHYSICAL',0),(99,205,'10.141.129.228','PHYSICAL',0),(100,82,'10.141.129.14','PHYSICAL',0),(101,203,'10.141.129.16','PHYSICAL',0),(102,83,'10.141.129.15','PHYSICAL',0),(103,70,'10.141.129.251','PHYSICAL',0),(104,245,'10.141.129.104','PHYSICAL',0),(105,243,'10.141.129.107','PHYSICAL',0),(106,246,'10.141.129.106','PHYSICAL',0),(108,158,'10.141.129.1','PHYSICAL',0),(109,86,'10.141.129.112','PHYSICAL',0),(110,172,'10.141.129.75','PHYSICAL',0),(111,185,'10.141.129.70','PHYSICAL',0),(112,90,'10.141.129.121','PHYSICAL',0),(113,91,'10.141.129.84','PHYSICAL',0),(114,87,'10.141.129.122','PHYSICAL',0),(115,88,'10.141.129.123','PHYSICAL',0),(116,89,'10.141.129.124','PHYSICAL',0),(117,207,'10.141.129.227','PHYSICAL',0),(118,208,'10.141.129.228','PHYSICAL',0),(119,92,'10.141.129.14','PHYSICAL',0),(120,206,'10.141.129.16','PHYSICAL',0),(121,93,'10.141.129.15','PHYSICAL',0),(122,84,'10.141.129.251','PHYSICAL',0),(124,264,'10.141.129.247','VIRTUAL',0),(125,265,'10.141.129.248','VIRTUAL',0),(126,266,'10.141.129.247','VIRTUAL',0),(127,267,'10.141.129.248','VIRTUAL',0),(130,94,'10.141.129.5','PHYSICAL',0),(131,95,'10.141.129.97','PHYSICAL',0),(132,212,'10.141.129.48','PHYSICAL',0),(133,213,'10.141.129.49','PHYSICAL',0),(134,159,'10.141.129.1','PHYSICAL',0),(135,97,'10.141.129.17','PHYSICAL',0),(136,173,'10.141.129.75','PHYSICAL',0),(137,186,'10.141.129.70','PHYSICAL',0),(138,101,'10.141.129.82','PHYSICAL',0),(139,102,'10.141.129.84','PHYSICAL',0),(140,98,'10.141.129.87','PHYSICAL',0),(141,99,'10.141.129.92','PHYSICAL',0),(142,100,'10.141.129.78','PHYSICAL',0),(143,210,'10.141.129.227','PHYSICAL',0),(144,211,'10.141.129.228','PHYSICAL',0),(145,236,'10.141.129.42','PHYSICAL',0),(146,103,'10.141.129.14','PHYSICAL',0),(147,209,'10.141.129.16','PHYSICAL',0),(148,104,'10.141.129.15','PHYSICAL',0),(149,96,'10.141.129.251','PHYSICAL',0),(150,271,'10.141.129.247','VIRTUAL',0),(151,270,'10.141.129.248','VIRTUAL',0),(152,269,'10.141.129.249','VIRTUAL',0),(153,154,'10.141.129.1','PHYSICAL',0),(154,15,'10.141.129.6','PHYSICAL',0),(155,16,'10.141.129.98','PHYSICAL',0),(156,17,'10.141.129.18','PHYSICAL',0),(157,214,'10.141.129.51','PHYSICAL',0),(158,174,'10.141.129.75','PHYSICAL',0),(159,187,'10.141.129.70','PHYSICAL',0),(160,21,'10.141.129.83','PHYSICAL',0),(161,23,'10.141.129.84','PHYSICAL',0),(162,18,'10.141.129.88','PHYSICAL',0),(163,19,'10.141.129.93','PHYSICAL',0),(164,20,'10.141.129.79','PHYSICAL',0),(165,216,'10.141.129.227','PHYSICAL',0),(166,217,'10.141.129.228','PHYSICAL',0),(167,237,'10.141.129.43','PHYSICAL',0),(168,24,'10.141.129.14','PHYSICAL',0),(169,215,'10.141.129.16','PHYSICAL',0),(170,25,'10.141.129.15','PHYSICAL',0),(171,22,'10.141.129.251','PHYSICAL',0),(175,160,'10.141.129.1','PHYSICAL',0),(176,105,'10.141.129.110','PHYSICAL',0),(177,106,'10.141.129.111','PHYSICAL',0),(178,108,'10.141.129.50','PHYSICAL',0),(179,175,'10.141.129.75','PHYSICAL',0),(180,188,'10.141.129.70','PHYSICAL',0),(181,112,'10.141.129.113','PHYSICAL',0),(182,113,'10.141.129.84','PHYSICAL',0),(183,109,'10.141.129.99','PHYSICAL',0),(184,110,'10.141.129.100','PHYSICAL',0),(185,111,'10.141.129.90','PHYSICAL',0),(186,219,'10.141.129.227','PHYSICAL',0),(187,220,'10.141.129.228','PHYSICAL',0),(188,238,'10.141.129.44','PHYSICAL',0),(189,114,'10.141.129.14','PHYSICAL',0),(190,218,'10.141.129.16','PHYSICAL',0),(191,115,'10.141.129.15','PHYSICAL',0),(192,107,'10.141.129.251','PHYSICAL',0),(193,275,'10.141.129.247','VIRTUAL',0),(194,276,'10.141.129.248','VIRTUAL',0),(195,277,'10.141.129.249','VIRTUAL',0),(197,161,'10.141.129.1','PHYSICAL',0),(198,116,'10.141.129.24','PHYSICAL',0),(199,117,'10.141.129.25','PHYSICAL',0),(200,119,'10.141.129.26','PHYSICAL',0),(201,176,'10.141.129.75','PHYSICAL',0),(202,189,'10.141.129.70','PHYSICAL',0),(203,123,'10.141.129.27','PHYSICAL',0),(204,124,'10.141.129.84','PHYSICAL',0),(205,120,'10.141.129.28','PHYSICAL',0),(206,121,'10.141.129.29','PHYSICAL',0),(207,122,'10.141.129.30','PHYSICAL',0),(208,222,'10.141.129.227','PHYSICAL',0),(209,223,'10.141.129.228','PHYSICAL',0),(210,239,'10.141.129.45','PHYSICAL',0),(211,125,'10.141.129.14','PHYSICAL',0),(212,221,'10.141.129.16','PHYSICAL',0),(213,126,'10.141.129.15','PHYSICAL',0),(214,118,'10.141.129.251','PHYSICAL',0),(215,278,'10.141.129.247','VIRTUAL',0),(216,279,'10.141.129.248','VIRTUAL',0),(217,280,'10.141.129.249','VIRTUAL',0),(218,162,'10.141.129.1','PHYSICAL',0),(219,127,'10.141.129.125','PHYSICAL',0),(220,128,'10.141.129.126','PHYSICAL',0),(221,177,'10.141.129.75','PHYSICAL',0),(222,190,'10.141.129.70','PHYSICAL',0),(223,281,'10.141.129.127','PHYSICAL',0),(224,129,'10.141.129.251','PHYSICAL',0),(225,282,'10.141.129.247','VIRTUAL',0),(226,283,'10.141.129.248','VIRTUAL',0),(227,284,'10.141.129.249','VIRTUAL',0),(228,163,'10.141.129.1','PHYSICAL',0),(229,131,'10.141.129.114','PHYSICAL',0),(230,132,'10.141.129.115','PHYSICAL',0),(231,134,'10.141.129.116','PHYSICAL',0),(232,178,'10.141.129.75','PHYSICAL',0),(233,191,'10.141.129.70','PHYSICAL',0),(234,138,'10.141.129.117','PHYSICAL',0),(235,139,'10.141.129.84','PHYSICAL',0),(236,135,'10.141.129.118','PHYSICAL',0),(237,136,'10.141.129.119','PHYSICAL',0),(238,137,'10.141.129.120','PHYSICAL',0),(239,225,'10.141.129.227','PHYSICAL',0),(240,226,'10.141.129.228','PHYSICAL',0),(241,240,'10.141.129.46','PHYSICAL',0),(242,140,'10.141.129.14','PHYSICAL',0),(243,224,'10.141.129.16','PHYSICAL',0),(244,141,'10.141.129.15','PHYSICAL',0),(245,133,'10.141.129.251','PHYSICAL',0),(246,285,'10.141.129.247','VIRTUAL',0),(247,286,'10.141.129.248','VIRTUAL',0),(248,287,'10.141.129.249','VIRTUAL',0),(249,164,'10.141.129.1','PHYSICAL',0),(250,142,'10.141.129.31','PHYSICAL',0),(251,143,'10.141.129.32','PHYSICAL',0),(252,145,'10.141.129.33','PHYSICAL',0),(253,179,'10.141.129.75','PHYSICAL',0),(254,192,'10.141.129.70','PHYSICAL',0),(255,149,'10.141.129.34','PHYSICAL',0),(256,150,'10.141.129.84','PHYSICAL',0),(257,146,'10.141.129.35','PHYSICAL',0),(258,147,'10.141.129.36','PHYSICAL',0),(259,148,'10.141.129.37','PHYSICAL',0),(260,228,'10.141.129.227','PHYSICAL',0),(261,229,'10.141.129.228','PHYSICAL',0),(262,241,'10.141.129.47','PHYSICAL',0),(263,151,'10.141.129.14','PHYSICAL',0),(264,227,'10.141.129.16','PHYSICAL',0),(265,152,'10.141.129.15','PHYSICAL',0),(266,144,'10.141.129.251','PHYSICAL',0),(267,288,'10.141.129.247','VIRTUAL',0),(268,289,'10.141.129.248','VIRTUAL',0),(269,290,'10.141.129.249','VIRTUAL',0),(270,153,'10.141.129.1','PHYSICAL',0),(271,2,'10.141.129.52','PHYSICAL',0),(272,3,'10.141.129.53','PHYSICAL',0),(273,4,'10.141.129.54','PHYSICAL',0),(274,5,'10.141.129.55','PHYSICAL',0),(275,6,'10.141.129.56','PHYSICAL',0),(276,7,'10.141.129.57','PHYSICAL',0),(277,180,'10.141.129.75','PHYSICAL',0),(278,193,'10.141.129.70','PHYSICAL',0),(279,11,'10.141.129.58','PHYSICAL',0),(280,12,'10.141.129.84','PHYSICAL',0),(281,8,'10.141.129.59','PHYSICAL',0),(282,9,'10.141.129.60','PHYSICAL',0),(283,10,'10.141.129.61','PHYSICAL',0),(284,231,'10.141.129.227','PHYSICAL',0),(285,232,'10.141.129.228','PHYSICAL',0),(286,242,'10.141.129.62','PHYSICAL',0),(287,13,'10.141.129.14','PHYSICAL',0),(288,230,'10.141.129.16','PHYSICAL',0),(289,14,'10.141.129.15','PHYSICAL',0),(290,1,'10.141.129.251','PHYSICAL',0),(291,167,'10.142.193.193','PHYSICAL',0),(293,291,'10.142.193.173','PHYSICAL',0),(294,28,'10.142.193.161','PHYSICAL',0),(295,30,'10.142.193.165','PHYSICAL',0),(297,32,'10.142.193.191','PHYSICAL',0),(298,166,'10.142.193.193','PHYSICAL',0),(300,29,'10.142.193.177','PHYSICAL',0),(301,31,'10.142.193.181','PHYSICAL',0),(302,33,'10.142.193.192','PHYSICAL',0),(304,293,'10.142.193.174','PHYSICAL',0),(306,295,'10.141.129.109','PHYSICAL',0),(307,296,'10.141.16.1','PHYSICAL',0),(308,297,'10.141.16.2','PHYSICAL',0),(309,298,'10.141.16.3','PHYSICAL',0),(310,299,'10.141.16.4','PHYSICAL',0),(311,300,'10.141.16.64','PHYSICAL',0),(312,301,'10.141.16.65','PHYSICAL',0),(313,302,'10.141.16.66','PHYSICAL',0),(314,303,'10.141.16.67','PHYSICAL',0),(315,304,'10.141.16.128','PHYSICAL',0),(316,305,'10.141.16.129','PHYSICAL',0),(317,306,'10.141.16.130','PHYSICAL',0),(318,307,'10.141.16.131','PHYSICAL',0),(319,308,'10.141.17.1','PHYSICAL',0),(320,309,'10.141.17.2','PHYSICAL',0),(321,310,'10.141.17.3','PHYSICAL',0),(322,311,'10.141.17.4','PHYSICAL',0),(323,312,'10.141.17.64','PHYSICAL',0),(324,313,'10.141.17.65','PHYSICAL',0),(325,314,'10.141.17.66','PHYSICAL',0),(326,315,'10.141.17.67','PHYSICAL',0),(327,316,'10.141.17.128','PHYSICAL',0),(328,317,'10.141.17.129','PHYSICAL',0),(329,318,'10.141.17.130','PHYSICAL',0),(330,319,'10.141.17.131','PHYSICAL',0),(331,320,'10.141.17.160','PHYSICAL',0),(332,321,'10.141.17.161','PHYSICAL',0),(333,322,'10.141.18.21','PHYSICAL',0),(334,323,'10.141.18.22','PHYSICAL',0),(335,324,'10.141.18.14','PHYSICAL',0),(336,325,'10.141.18.15','PHYSICAL',0),(337,326,'10.141.18.29','PHYSICAL',0),(338,327,'10.141.18.30','PHYSICAL',0),(339,328,'10.141.18.31','PHYSICAL',0),(340,329,'10.141.18.5','PHYSICAL',0),(341,330,'10.141.18.32','PHYSICAL',0),(342,331,'10.141.18.33','PHYSICAL',0),(343,332,'10.141.18.233','PHYSICAL',0),(344,333,'10.141.18.234','PHYSICAL',0),(345,334,'10.141.18.235','PHYSICAL',0),(346,335,'10.141.17.238','VIRTUAL',0),(347,336,'10.141.19.195','PHYSICAL',0),(348,337,'10.141.19.196','PHYSICAL',0),(349,338,'10.141.18.226','PHYSICAL',0),(350,339,'10.141.18.227','PHYSICAL',0),(351,340,'10.141.19.200','PHYSICAL',0),(352,341,'10.141.16.164','PHYSICAL',0),(353,342,'10.141.16.165','PHYSICAL',0),(354,343,'10.141.17.164','PHYSICAL',0),(355,344,'10.141.17.165','PHYSICAL',0),(356,345,'10.141.17.166','PHYSICAL',0),(357,346,'10.141.17.167','PHYSICAL',0),(358,347,'10.141.18.21','PHYSICAL',0),(359,348,'10.141.18.22','PHYSICAL',0),(360,349,'10.141.18.14','PHYSICAL',0),(361,350,'10.141.18.15','PHYSICAL',0),(362,351,'10.141.18.24','PHYSICAL',0),(363,352,'10.141.18.25','PHYSICAL',0),(364,353,'10.141.18.26','PHYSICAL',0),(365,356,'10.141.16.239','VIRTUAL',0),(366,357,'10.141.16.236','VIRTUAL',0),(367,358,'10.141.16.227','VIRTUAL',0),(368,359,'10.141.17.238','VIRTUAL',0),(369,360,'10.141.16.192','PHYSICAL',0),(370,361,'10.141.16.193','PHYSICAL',0),(371,362,'10.141.16.200','PHYSICAL',0),(372,363,'10.141.16.201','PHYSICAL',0),(373,364,'10.141.16.208','PHYSICAL',0),(374,365,'10.141.16.209','PHYSICAL',0),(375,366,'10.141.17.192','PHYSICAL',0),(376,367,'10.141.17.193','PHYSICAL',0),(377,368,'10.141.17.200','PHYSICAL',0),(378,369,'10.141.17.201','PHYSICAL',0),(379,370,'10.141.17.208','PHYSICAL',0),(380,371,'10.141.17.209','PHYSICAL',0),(381,372,'10.141.17.198','PHYSICAL',0),(382,373,'10.141.17.199','PHYSICAL',0),(383,374,'10.141.17.206','PHYSICAL',0),(384,375,'10.141.17.207','PHYSICAL',0),(385,376,'10.141.17.214','PHYSICAL',0),(386,377,'10.141.17.215','PHYSICAL',0),(387,378,'10.141.18.193','PHYSICAL',0),(388,379,'10.141.18.200','PHYSICAL',0),(389,380,'10.141.18.201','PHYSICAL',0),(390,381,'10.141.18.208','PHYSICAL',0),(391,382,'10.141.18.209','PHYSICAL',0),(392,383,'10.141.18.216','PHYSICAL',0),(393,384,'10.141.18.217','PHYSICAL',0),(394,385,'10.141.18.218','PHYSICAL',0),(395,386,'10.141.18.219','PHYSICAL',0),(396,387,'10.141.18.220','PHYSICAL',0),(397,388,'10.141.17.239','VIRTUAL',0),(398,389,'10.141.19.209','PHYSICAL',0),(399,390,'10.142.16.1','PHYSICAL',0),(400,391,'10.142.16.2','PHYSICAL',0),(401,392,'10.142.16.3','PHYSICAL',0),(402,393,'10.142.16.4','PHYSICAL',0),(403,394,'10.142.16.64','PHYSICAL',0),(404,395,'10.142.16.65','PHYSICAL',0),(405,396,'10.142.16.66','PHYSICAL',0),(406,397,'10.142.16.67','PHYSICAL',0),(407,398,'10.142.16.128','PHYSICAL',0),(408,399,'10.142.16.129','PHYSICAL',0),(409,400,'10.142.16.130','PHYSICAL',0),(410,401,'10.142.16.131','PHYSICAL',0),(411,402,'10.142.17.1','PHYSICAL',0),(412,403,'10.142.17.2','PHYSICAL',0),(413,404,'10.142.17.3','PHYSICAL',0),(414,405,'10.142.17.4','PHYSICAL',0),(415,406,'10.142.17.64','PHYSICAL',0),(416,407,'10.142.17.65','PHYSICAL',0),(417,408,'10.142.17.66','PHYSICAL',0),(418,409,'10.142.17.67','PHYSICAL',0),(419,410,'10.142.17.128','PHYSICAL',0),(420,411,'10.142.17.129','PHYSICAL',0),(421,412,'10.142.17.130','PHYSICAL',0),(422,413,'10.142.17.131','PHYSICAL',0),(423,414,'10.142.17.160','PHYSICAL',0),(424,415,'10.142.17.161','PHYSICAL',0),(425,416,'10.142.18.29','PHYSICAL',0),(426,417,'10.142.18.30','PHYSICAL',0),(427,418,'10.142.18.31','PHYSICAL',0),(428,419,'10.142.18.5','PHYSICAL',0),(429,420,'10.142.18.233','PHYSICAL',0),(430,421,'10.142.18.234','PHYSICAL',0),(431,422,'10.142.18.235','PHYSICAL',0),(432,423,'10.142.18.32','PHYSICAL',0),(433,424,'10.142.18.33','PHYSICAL',0),(434,425,'10.142.18.15','PHYSICAL',0),(435,426,'10.142.18.14','PHYSICAL',0),(436,427,'10.142.18.21','PHYSICAL',0),(437,428,'10.142.18.22','PHYSICAL',0),(438,429,'10.142.19.195','PHYSICAL',0),(439,430,'10.142.19.196','PHYSICAL',0),(440,431,'10.142.18.226','PHYSICAL',0),(441,432,'10.142.18.227','PHYSICAL',0),(442,433,'10.142.17.238','VIRTUAL',0),(443,434,'10.141.18.225','VIRTUAL',0),(444,435,'10.141.19.194','VIRTUAL',0),(445,436,'10.142.18.225','VIRTUAL',0),(446,437,'10.142.19.194','VIRTUAL',0),(447,438,'10.141.16.238','VIRTUAL',0),(448,439,'10.141.16.238','VIRTUAL',0),(449,440,'10.141.16.238','VIRTUAL',0),(450,441,'10.141.16.244','VIRTUAL',0),(451,442,'10.142.16.244','VIRTUAL',0),(452,443,'10.142.16.238','VIRTUAL',0),(453,444,'10.142.16.238','VIRTUAL',0),(454,445,'10.142.16.238','VIRTUAL',0),(455,446,'10.141.16.228','VIRTUAL',0),(456,447,'10.141.16.228','VIRTUAL',0),(457,448,'10.141.16.228','VIRTUAL',0);
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
  `Version` bigint(20) NOT NULL DEFAULT '0',
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
  `Version` bigint(20) NOT NULL DEFAULT '0',
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
  `PackageName` varchar(255) NOT NULL,
  `PackageTypeID` bigint(20) DEFAULT NULL,
  `ServerTypeID` bigint(20) DEFAULT NULL,
  `ReleaseID` bigint(20) DEFAULT NULL,
  `PackageVersion` varchar(255) DEFAULT NULL,
  `Version` bigint(20) NOT NULL DEFAULT '0',
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
INSERT INTO `cm_package` VALUES (1,'TEST PACKAGE 1',1,1,1,NULL,0),(2,'Bridge - 7.3.4 Package',2,3,1,NULL,0),(3,'EAS - 7.3.4 Package',2,4,1,NULL,0),(4,'UIS - 7.3.4 Package',2,14,1,NULL,0),(5,'Bridge - 7.4.0 Package',2,3,2,NULL,0),(6,'EAS - 7.4.0 Package',2,4,2,NULL,0),(7,'UIS - 7.4.0 Package',2,14,2,NULL,0),(8,'RESIP-InfraRel-x.y.z',4,10,6,NULL,0),(9,'RESIP-InfraPlat-x.y.z',3,10,6,NULL,0),(10,'RESIP-AppPlat-x.y.z',1,10,6,NULL,0),(11,'RESIP-AppRel-x.y.z',2,10,6,NULL,0),(12,'SmartClient',2,16,8,'2.3.13',0),(13,'mpc',2,17,8,'7.4.1',0),(14,'training',2,NULL,8,'7.4.1',0),(15,'dbms-script',2,NULL,8,'7.4.2',0),(16,'chs-uis',2,NULL,8,'7.4.1',0),(17,'chs-pms',2,NULL,8,'7.4.1',0),(18,'chs-stockplus',2,NULL,8,'7.4.1',0),(19,'chs-centralfilling',2,NULL,8,'7.4.1',0),(20,'batch-client',4,NULL,8,'1.6.1',0),(21,'encryptionutil',4,NULL,8,'1.2',0),(22,'jmxquery',4,NULL,8,'1.4-TSF',0),(23,'parameter-tool',4,NULL,8,'1.0',0),(24,'roler-permission-tool',4,NULL,8,'1.1',0),(25,'securitymanagement',4,NULL,8,'1.11.3',0),(26,'external framework-application status monitor',4,NULL,8,'1.6.0',0),(27,'external framework-symmetricds-ext',3,NULL,8,'1.7',0),(28,'external framework-symmetricds',3,NULL,8,'3.7.34',0),(29,'external framework-wmq-jmsra',3,NULL,8,'7.0',0),(32,'createUpdateActualProductPack',5,12,8,'3.1',0),(33,'createUpdateAdverseReaction',5,12,8,'3.2',0),(34,'createUpdateExemption',5,12,8,'3.3',0),(35,'createUpdateFormulary',5,12,8,'3.0',0),(36,'createUpdateGeneralParameter',5,12,8,'3.4',0),(37,'createUpdateLabelInstruction',5,12,8,'3.0',0),(38,'createUpdateMedicalCondition',5,12,8,'3.0',0),(39,'createUpdatePractice',5,12,8,'3.3',0),(40,'createUpdatePreferredActualProductPack',5,12,8,'3.2',0),(41,'createUpdatePreferredProductSKU',5,12,8,'3.4',0),(42,'createUpdatePrescriber',5,12,8,'3.2',0),(43,'createUpdatePrescriberType',5,12,8,'3.0',0),(44,'createUpdatePrescription',5,12,8,'5.4',0),(45,'createUpdatePrescription_FM',5,12,8,'6.1',0),(46,'createUpdatePrescriptionFormType',5,12,8,'3.6',0),(47,'createUpdatePrescriptionGroup',5,12,8,'3.3',0),(48,'createUpdateProduct',5,12,8,'3.3',0),(49,'createUpdateProductBarcode',5,12,8,'3.2',0),(50,'createUpdateProductFlavour',5,12,8,'3.0',0),(51,'createUpdateProductLogistics',5,12,8,'3.1',0),(52,'createUpdateProductSKU',5,12,8,'3.4',0),(53,'createUpdateSite',5,12,8,'3.5',0),(54,'createUpdateStockAvailability',5,12,8,'3.0',0),(55,'createUpdateStoreServiceCentreLink',5,12,8,'3.0',0),(56,'createUpdateSupplier',5,12,8,'3.0',0),(57,'createUpdateTwinningScheme',5,12,8,'0.1',0),(58,'executeSQL',5,12,8,'2.3',0),(59,'import_IG01',5,12,8,'1.2',0),(60,'import_IG02',5,12,8,'1.1',0),(61,'import_IG03',5,12,8,'3.3',0),(62,'import_IG04',5,12,8,'1.1',0),(63,'import_IG06',5,12,8,'1.1',0),(64,'import_IG09',5,12,8,'1.1',0),(65,'jobrunner',5,12,8,'2.6',0),(66,'merge_IG01',5,12,8,'1.3',0),(67,'merge_IG02',5,12,8,'1.0',0),(68,'merge_IG03',5,12,8,'1.2',0),(69,'merge_IG04',5,12,8,'1.2',0),(70,'merge_IG06',5,12,8,'1.2',0),(71,'merge_IG09',5,12,8,'1.2',0),(72,'readprescriptionimsfeed',5,12,8,'1.0',0),(73,'readprescriberimsfeed',5,12,8,'1.0',0);
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
  `PackageTypeName` varchar(255) NOT NULL,
  `Version` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`PackageTypeID`),
  UNIQUE KEY `UQ_CM_PackageType_PackageTypeName` (`PackageTypeName`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cm_packagetype`
--

LOCK TABLES `cm_packagetype` WRITE;
/*!40000 ALTER TABLE `cm_packagetype` DISABLE KEYS */;
INSERT INTO `cm_packagetype` VALUES (1,'App Platform Release',0),(2,'App Release',0),(3,'Infrastructure Platform Release',0),(4,'Infrastructure Release',0),(5,'Interface',0);
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
  `ReleaseName` varchar(255) NOT NULL,
  `Version` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ReleaseID`),
  UNIQUE KEY `UQ_Releases_ReleaseName` (`ReleaseName`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cm_release`
--

LOCK TABLES `cm_release` WRITE;
/*!40000 ALTER TABLE `cm_release` DISABLE KEYS */;
INSERT INTO `cm_release` VALUES (1,'7.3.4',0),(2,'7.4.0',0),(3,'7.3.2',0),(6,'Training-x.y.z',0),(7,'UNKNOWN',0),(8,'7.4.2',0),(9,'7.4.2 BT M (CEMS)',0),(10,'7.3.5.3 (CEMS)',0),(11,'7.3.5.4 (CEMS)',0),(12,'7.4.2 M (CEMS)',0),(13,'7.4.3',0),(14,'7.10.0',0);
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
  `RelConfigParameter` varchar(4096) DEFAULT NULL,
  `RelConfigValue` varchar(4096) DEFAULT NULL,
  `RelConfigHieraAddress` varchar(4096) DEFAULT NULL,
  `RecursiveByEnv` bit(1) NOT NULL DEFAULT b'0',
  `RecursiveBySubEnv` bit(1) NOT NULL DEFAULT b'0',
  `ReleaseConfigNotes` varchar(4096) DEFAULT NULL,
  `ReleaseConfigIsSensitive` bit(1) DEFAULT b'0',
  `Version` bigint(20) NOT NULL DEFAULT '0',
  `isArrayItem` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`RelConfigID`),
  KEY `IXFK_ReleaseConfig_Release` (`ReleaseID`),
  CONSTRAINT `cm_releaseconfig_ibfk_1` FOREIGN KEY (`ReleaseID`) REFERENCES `cm_release` (`ReleaseID`)
) ENGINE=InnoDB AUTO_INCREMENT=1021 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cm_releaseconfig`
--

LOCK TABLES `cm_releaseconfig` WRITE;
/*!40000 ALTER TABLE `cm_releaseconfig` DISABLE KEYS */;
INSERT INTO `cm_releaseconfig` VALUES (359,14,'brg','7.9.0-1','ROOT:oneleo_release_map:columbus:uk-boots:rpm_7.10.0:{ParamName}','\0','\0','','\0',0,'\0'),(360,14,'uis','7.10.0-2017051001','ROOT:oneleo_release_map:columbus:uk-boots:rpm_7.10.0:{ParamName}','\0','\0','','\0',0,'\0'),(361,14,'eas','7.9.0-1','ROOT:oneleo_release_map:columbus:uk-boots:rpm_7.10.0:{ParamName}','\0','\0','','\0',0,'\0'),(362,14,'pms_version','7.10.0-2017051001','ROOT:oneleo_release_map:columbus:uk-boots:rpm_7.10.0:{ParamName}','\0','\0','','\0',0,'\0'),(363,14,'trainingversion','7.6.0-1','ROOT:oneleo_release_map:columbus:uk-boots:rpm_7.10.0:{ParamName}','\0','\0','','\0',0,'\0'),(364,14,'stockplus_version','7.10.0-2017051001','ROOT:oneleo_release_map:columbus:uk-boots:rpm_7.10.0:{ParamName}','\0','\0','','\0',0,'\0'),(365,14,'centralfilling_version','7.4.1.1-1','ROOT:oneleo_release_map:columbus:uk-boots:rpm_7.10.0:{ParamName}','\0','\0','','\0',0,'\0'),(366,14,'ehcache','1.0','ROOT:oneleo_release_map:columbus:uk-boots:rpm_7.10.0:{ParamName}','\0','\0','','\0',0,'\0'),(367,14,'wmqjmsraversion','7.0-1','ROOT:oneleo_release_map:columbus:uk-boots:rpm_7.10.0:{ParamName}','\0','\0','','\0',0,'\0'),(368,14,'bouncycastle','1.5','ROOT:oneleo_release_map:columbus:uk-boots:rpm_7.10.0:{ParamName}','\0','\0','','\0',0,'\0'),(369,14,'symds_version','3.7.34-1','ROOT:oneleo_release_map:columbus:uk-boots:rpm_7.10.0:{ParamName}','\0','\0','','\0',0,'\0'),(370,14,'jmxqueryversion','1.4-1','ROOT:oneleo_release_map:columbus:uk-boots:rpm_7.10.0:{ParamName}','\0','\0','','\0',0,'\0'),(371,14,'symds_ext_version','1.6-1','ROOT:oneleo_release_map:columbus:uk-boots:rpm_7.10.0:{ParamName}','\0','\0','','\0',0,'\0'),(372,14,'aclloggingversion','3.14-1','ROOT:oneleo_release_map:columbus:uk-boots:rpm_7.10.0:{ParamName}','\0','\0','','\0',0,'\0'),(373,14,'acl_api_version','3.20.0-1','ROOT:oneleo_release_map:columbus:uk-boots:rpm_7.10.0:{ParamName}','\0','\0','','\0',0,'\0'),(374,14,'asmversion','1.8.0-1','ROOT:oneleo_release_map:columbus:uk-boots:rpm_7.10.0:{ParamName}','\0','\0','','\0',0,'\0'),(375,14,'eclipsepersistenceversion','2.4.2-1','ROOT:oneleo_release_map:columbus:uk-boots:rpm_7.10.0:{ParamName}','\0','\0','','\0',0,'\0'),(376,14,'ccode','gbr','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(377,14,'batchclientversion','1.6.1-1','ROOT:oneleo_release_map:columbus:uk-boots:rpm_7.10.0:{ParamName}','\0','\0','','\0',0,'\0'),(378,14,'env','test','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(379,14,'sub_env','ft3','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(380,14,'distrib','EnterpriseLinux','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(381,14,'log_level','INFO','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(382,14,'deployment_timeout','900','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','# Jboss parameter (standalone.xml)','\0',0,'\0'),(383,14,'ora_wallet','true','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(384,14,'ora_wallet_password','{SENSITIVE}','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','',0,'\0'),(385,14,'db_name','PMST1','ROOT:oneleonardo_envs:columbus-ft3:ora_wallet_aliases:\'EAS_DB\':{ParamName}','\0','\0','','\0',0,'\0'),(386,14,'db_port','1521','ROOT:oneleonardo_envs:columbus-ft3:ora_wallet_aliases:\'EAS_DB\':{ParamName}','\0','\0','','\0',0,'\0'),(387,14,'db_server','gb2pmsdbst3.resources.corp.internal','ROOT:oneleonardo_envs:columbus-ft3:ora_wallet_aliases:\'EAS_DB\':{ParamName}','\0','\0','','\0',0,'\0'),(388,14,'db_user','PMSFT3','ROOT:oneleonardo_envs:columbus-ft3:ora_wallet_aliases:\'EAS_DB\':{ParamName}','\0','\0','','\0',0,'\0'),(389,14,'db_pass','{SENSITIVE}','ROOT:oneleonardo_envs:columbus-ft3:ora_wallet_aliases:\'EAS_DB\':{ParamName}','\0','\0','','',0,'\0'),(390,14,'db_name','PMST1','ROOT:oneleonardo_envs:columbus-ft3:ora_wallet_aliases:\'EAS_DB_STG\':{ParamName}','\0','\0','','\0',0,'\0'),(391,14,'db_server','gb2pmsdbst3.resources.corp.internal','ROOT:oneleonardo_envs:columbus-ft3:ora_wallet_aliases:\'EAS_DB_STG\':{ParamName}','\0','\0','','\0',0,'\0'),(392,14,'db_port','1521','ROOT:oneleonardo_envs:columbus-ft3:ora_wallet_aliases:\'EAS_DB_STG\':{ParamName}','\0','\0','','\0',0,'\0'),(393,14,'db_user','PMSFT3_STG','ROOT:oneleonardo_envs:columbus-ft3:ora_wallet_aliases:\'EAS_DB_STG\':{ParamName}','\0','\0','','\0',0,'\0'),(394,14,'db_name','PMST1','ROOT:oneleonardo_envs:columbus-ft3:ora_wallet_aliases:\'SYMDS_DB\':{ParamName}','\0','\0','','\0',0,'\0'),(395,14,'db_port','1521','ROOT:oneleonardo_envs:columbus-ft3:ora_wallet_aliases:\'SYMDS_DB\':{ParamName}','\0','\0','','\0',0,'\0'),(396,14,'db_pass','{SENSITIVE}','ROOT:oneleonardo_envs:columbus-ft3:ora_wallet_aliases:\'EAS_DB_STG\':{ParamName}','\0','\0','','',0,'\0'),(397,14,'db_server','gb2pmsdbst3.resources.corp.internal','ROOT:oneleonardo_envs:columbus-ft3:ora_wallet_aliases:\'SYMDS_DB\':{ParamName}','\0','\0','','\0',0,'\0'),(398,14,'db_user','PMSFT3','ROOT:oneleonardo_envs:columbus-ft3:ora_wallet_aliases:\'SYMDS_DB\':{ParamName}','\0','\0','','\0',0,'\0'),(399,14,'db_pass','{SENSITIVE}','ROOT:oneleonardo_envs:columbus-ft3:ora_wallet_aliases:\'SYMDS_DB\':{ParamName}','\0','\0','','',0,'\0'),(400,14,'db_port','1521','ROOT:oneleonardo_envs:columbus-ft3:ora_wallet_aliases:\'OPTIMUS\':{ParamName}','\0','\0','','\0',0,'\0'),(401,14,'db_name','PMST1','ROOT:oneleonardo_envs:columbus-ft3:ora_wallet_aliases:\'OPTIMUS\':{ParamName}','\0','\0','','\0',0,'\0'),(402,14,'db_server','gb2pmsdbst3.resources.corp.internal','ROOT:oneleonardo_envs:columbus-ft3:ora_wallet_aliases:\'OPTIMUS\':{ParamName}','\0','\0','','\0',0,'\0'),(403,14,'db_user','OPTMIGFT3','ROOT:oneleonardo_envs:columbus-ft3:ora_wallet_aliases:\'OPTIMUS\':{ParamName}','\0','\0','','\0',0,'\0'),(404,14,'db_pass','{SENSITIVE}','ROOT:oneleonardo_envs:columbus-ft3:ora_wallet_aliases:\'OPTIMUS\':{ParamName}','\0','\0','','',0,'\0'),(405,14,'application_user','pmsgbrtt','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(406,14,'application_group','pmsgbrtt','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(407,14,'maintenance_user','pmsgbmtt','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(408,14,'tsfn','{SENSITIVE}','ROOT:oneleonardo_envs:columbus-ft3:mgmtusers:{ParamName}','\0','\0','','',0,'\0'),(409,14,'gss','{SENSITIVE}','ROOT:oneleonardo_envs:columbus-ft3:mgmtusers:{ParamName}','\0','\0','','',0,'\0'),(410,14,'FT3Admin','{SENSITIVE}','ROOT:oneleonardo_envs:columbus-ft3:appusers:{ParamName}','\0','\0','','',0,'\0'),(411,14,'FT3Monitoring','{SENSITIVE}','ROOT:oneleonardo_envs:columbus-ft3:appusers:{ParamName}','\0','\0','','',0,'\0'),(412,14,'FT3Operations','{SENSITIVE}','ROOT:oneleonardo_envs:columbus-ft3:appusers:{ParamName}','\0','\0','','',0,'\0'),(413,14,'FT3Monitoring','jminix,MONITORING','ROOT:oneleonardo_envs:columbus-ft3:approles:{ParamName}','\0','\0','','\0',0,'\0'),(414,14,'FT3Admin','jminix,ADMIN','ROOT:oneleonardo_envs:columbus-ft3:approles:{ParamName}','\0','\0','','\0',0,'\0'),(415,14,'FT3Operations','jminix,OPERATIONS','ROOT:oneleonardo_envs:columbus-ft3:approles:{ParamName}','\0','\0','','\0',0,'\0'),(416,14,'product_name','columbus','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(417,14,'implementation_name','uk-boots','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(418,14,'release','1','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','# Production Services package building release','\0',0,'\0'),(419,14,'application_desc','Columbus uk-boots implementation','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(420,14,'deploy_version','7.10.0','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','# TSF-N application release number','\0',0,'\0'),(421,14,'data_size','1G','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','# Filesystem size for /{env}b/${appdir}','\0',0,'\0'),(422,14,'volumegroup','rootvg','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','# VG to create application filesystems','\0',0,'\0'),(423,14,'file_size','7G','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','# Filesystem size for /{env}f/${appdir}','\0',0,'\0'),(424,14,'soft_size','1G','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','# Filesystem size for /{env}s/${appdir}','\0',0,'\0'),(425,14,'jboss_enable_monitoring','false','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(426,14,'jboss_host','localhost','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(427,14,'gclog_num_files','10','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(428,14,'jboss_management_native_port','9999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(429,14,'columbus_env_id','E','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(430,14,'asm_enable_list','uis,eas,brg','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(431,14,'gclog_file_size','100m','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(432,14,'asm_enable','true','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(433,14,'datasources','java:jboss/datasources/columbus-ds-eas','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(434,14,'symds_enable','false','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(435,14,'training_enable','false','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(436,14,'symds_server','gbrpmseasf21.corp.internal','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(437,14,'symds_port','8180','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(438,14,'sym_sec_file_release','20150115','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(439,14,'symds_db_name','PMST1','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(440,14,'sym_sec_path','${jboss.server.config.dir}/syncronization/EK4DK','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(441,14,'symds_db_server','gb2pmsdbst3.resources.corp.internal','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(442,14,'symds_db_user','SDSFT3','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(443,14,'symds_db_port','1521','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(444,14,'symds_db_pass','{SENSITIVE}','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','',0,'\0'),(445,14,'sym_cluster_lock_timeout','300000','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(446,14,'sym_cluster_enabled','true','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(447,14,'osucontainer_concurrency','1-1','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(448,14,'asncontainer_concurrency','1-1','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(449,14,'wmq_enable','true','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(450,14,'jmxquery_enable','true','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(451,14,'centralized_logging_enabled','true','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(452,14,'pms_enable_list','eas','ROOT:oneleonardo_envs:columbus-ft3:deployment_enable_map:{ParamName}','\0','\0','','\0',0,'\0'),(453,14,'stockplusbridge_enable','false','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(454,14,'stockplus_enable_list','eas,brg','ROOT:oneleonardo_envs:columbus-ft3:deployment_enable_map:{ParamName}','\0','\0','','\0',0,'\0'),(455,14,'centralfilling_enable_list','brg','ROOT:oneleonardo_envs:columbus-ft3:deployment_enable_map:{ParamName}','\0','\0','','\0',0,'\0'),(456,14,'BIQuery','${HOME}','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(457,14,'asm_jboss_management_user','admin','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(458,14,'durcheck_licence','{SENSITIVE}','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','',0,'\0'),(459,14,'jboss_management_http_port','9990','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(460,14,'asm_jboss_management_user_psw','{SENSITIVE}','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','',0,'\0'),(461,14,'clinicalcheck_licence','{SENSITIVE}','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','',0,'\0'),(462,14,'endorsement_licence','{SENSITIVE}','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','',0,'\0'),(463,14,'clinicalcheck_getdrug_url','http://gbrpmsdbst14.corp.internal:80/HDS/ClinicalInformation.svc/GetDrugInformation','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(464,14,'clinicalcheck_getdur_url','http://gbrpmsdbst14.corp.internal:80/HDS/ClinicalInformation.svc/GetDUR','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(465,14,'emar_notifyPatientCommunity_url','https://10.245.12.244:8092/FacilityMessageService.svc','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(466,14,'reimbursement_getendorsement_url','http://gbrpmsdbst14.corp.internal:80/HDS/Reimbursement.svc/GetEndorsement','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(467,14,'emar_notifyPatient_url','https://10.245.12.244:8092/PatientMessageService.svc','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(468,14,'marchart_notifyMarChart_url','https://10.245.12.244:8092/DrugMessageService.svc','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(469,14,'stockplus_url','http://10.245.12.244:8090','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(470,14,'pms_url','http://10.245.12.244:8090','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(471,14,'centfill_url','http://10.245.12.244:8090','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(472,14,'enable_new_transmit_due_date_orders_implementation','true','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(473,14,'housekeeping_enabled','true','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(474,14,'preview_due_now_orders_page_limit','120','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(475,14,'multiversion','true','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(476,14,'deploy_version','7.10.0','ROOT:oneleonardo_envs:columbus-ft3:multiversion_server_groups:server_group_x:{ParamName}','\0','\0','','\0',0,'\0'),(477,14,'eas_spring_profile','outbound_api_channel,outbound_api_adapter,offline','ROOT:oneleonardo_envs:columbus-ft3:multiversion_server_groups:server_group_x:{ParamName}','\0','\0','','\0',0,'\0'),(478,14,'eas_deployments','columbus-pms-7.10.0-branch7100-clb-build-20170510-01.ear,columbus-stockplus-7.10.0-branch7100-clb-build-20170510-01.ear,columbus-centralfilling-7.4.1.1.ear','ROOT:oneleonardo_envs:columbus-ft3:multiversion_server_groups:server_group_x:{ParamName}','\0','\0','','\0',0,'\0'),(479,14,'vip_eas_server','gbrpmseast00.corp.internal','ROOT:oneleonardo_envs:columbus-ft3:multiversion_server_groups:server_group_x:{ParamName}','\0','\0','','\0',0,'\0'),(480,14,'vip_eas_port','8850','ROOT:oneleonardo_envs:columbus-ft3:multiversion_server_groups:server_group_x:{ParamName}','\0','\0','','\0',0,'\0'),(481,14,'eas_datasources','java:jboss/datasources/columbus-ds-pms,java:jboss/datasources/columbus-ds-stockplus,java:jboss/datasources/columbus-ds-centralfilling','ROOT:oneleonardo_envs:columbus-ft3:multiversion_server_groups:server_group_x:{ParamName}','\0','\0','','\0',0,'\0'),(482,14,'modularization','true','ROOT:oneleonardo_envs:columbus-ft3:multiversion_server_groups:server_group_x:{ParamName}','\0','\0','','\0',0,'\0'),(483,14,'uis_deployments','columbus-desktop-7.10.0-branch7100-clb-build-20170510-01.war','ROOT:oneleonardo_envs:columbus-ft3:multiversion_server_groups:server_group_x:{ParamName}','\0','\0','','\0',0,'\0'),(484,14,'proxy_name','gbrpmsuist00.corp.internal','ROOT:oneleonardo_envs:columbus-ft3:multiversion_server_groups:server_group_x:{ParamName}','\0','\0','','\0',0,'\0'),(485,14,'proxy_port','8850','ROOT:oneleonardo_envs:columbus-ft3:multiversion_server_groups:server_group_x:{ParamName}','\0','\0','','\0',0,'\0'),(486,14,'brg_server','gbrpmsbrgt00.corp.internal','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(487,14,'vip_brg_port','8885','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','#Only used from batch-client','\0',0,'\0'),(488,14,'brg_port','8380','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(489,14,'brg_init_heap_mem','7168m','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(490,14,'brg_max_perm_size','512m','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(491,14,'brg_max_heap_mem','7168m','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(492,14,'brg_new_size','1536m','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(493,14,'brg_perm_size','512m','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(494,14,'brg_newratio','3','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(495,14,'brg_system_name','batchUserBRG','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(496,14,'brg_max_new_size','1536m','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(497,14,'brg_spring_profile','outbound_api_channel,outbound_api_adapter,inbound_api_channel,inbound_api_adapter,import_batch,export_batch,internal_job_batch,external_job_batch,sym_chs','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(498,14,'brg_deployments','columbus-pms-7.10.0-branch7100-clb-build-20170510-01.ear,columbus-stockplus-7.10.0-branch7100-clb-build-20170510-01.ear,columbus-centralfilling-7.4.1.1.ear','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(499,14,'brg_datasources','java:jboss/datasources/columbus-ds-pms,java:jboss/datasources/columbus-ds-stockplus,java:jboss/datasources/columbus-ds-centralfilling','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(500,14,'brg_asm_enabled_check_list','availabilityChecker,deployChecker,datasourceChecker','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(501,14,'sync_url','https://gbrpmsbrgt00.corp.internal:8885/symmetricds/sync/chs-master','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(502,14,'dispensed_db_name','EAS_DB','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','# Used for daily_dispensed and all_dispensed scripts','\0',0,'\0'),(503,14,'resadapter_arc','wmq.jmsra.rar','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(504,14,'ig32_ek4dk','xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(505,14,'env_roles_internal_jobs_enable','brg','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(506,14,'boots_patient_key_hash','xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(507,14,'IG32_secret_key','xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(508,14,'inbound_dir','createUpdateStockTake','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(509,14,'inbound_dir','createUpdateFormulation','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(510,14,'inbound_dir','createUpdateUnitOfMeasureList','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(511,14,'inbound_dir','createUpdatePatient','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(512,14,'inbound_dir','createUpdateLevyFeeList','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(513,14,'inbound_dir','createUpdatePatientCommunity','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(514,14,'outbound_dir','createUpdateStockTake','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(515,14,'outbound_dir','createUpdateUnitOfMeasureList','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(516,14,'outbound_dir','createUpdateFormulation','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(517,14,'outbound_dir','createUpdatePatient','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(518,14,'history_dir','createUpdateStockTake','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(519,14,'outbound_dir','createUpdatePatientCommunity','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(520,14,'outbound_dir','createUpdateLevyFeeList','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(521,14,'history_dir','createUpdateUnitOfMeasureList','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(522,14,'history_dir','createUpdatePatient','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(523,14,'history_dir','createUpdateFormulation','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(524,14,'history_dir','createUpdateLevyFeeList','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(525,14,'history_dir','createUpdatePatientCommunity','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(526,14,'columbus_db_version','7.10.0','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(527,14,'eas_db_port','1521','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(528,14,'eas_db_server','gb2pmsdbst3.resources.corp.internal','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(529,14,'eas_asm_enabled_check_list','availabilityChecker,deployChecker,datasourceChecker','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(530,14,'eas_db_user','PMSFT3','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(531,14,'eas_db_pass','{SENSITIVE}','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','',0,'\0'),(532,14,'eas_db_name','PMST1','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(533,14,'eas_db_staging_port','1521','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(534,14,'eas_db_staging_server','gb2pmsdbst3.resources.corp.internal','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(535,14,'eas_db_staging_name','PMST1','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(536,14,'eas_db_staging_pass_tsfz','PMSFT3_STG','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','# same as below but encrypted and used on tsfz portal','\0',0,'\0'),(537,14,'eas_db_staging_user','PMSFT3_STG','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(538,14,'eas_db_staging_pass','{SENSITIVE}','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','',0,'\0'),(539,14,'eas_port','8180','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(540,14,'eas_init_heap_mem','7168m','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(541,14,'eas_max_heap_mem','7168m','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(542,14,'eas_max_perm_size','512m','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(543,14,'eas_max_new_size','1536m','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(544,14,'eas_new_size','1536m','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(545,14,'eas_perm_size','512m','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(546,14,'eas_newratio','3','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(547,14,'CPAS_modulus','{SENSITIVE}','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','',0,'\0'),(548,14,'eas_system_name','batchUserEAS','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(549,14,'ig29_secret_keys','{SENSITIVE}','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','',0,'\0'),(550,14,'ig29_secret_keys','{SENSITIVE}','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','',0,'\0'),(551,14,'CPAS_exponent','AQAB','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(552,14,'ig29_secret_keys','{SENSITIVE}','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','',0,'\0'),(553,14,'ig29_secret_keys','{SENSITIVE}','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','',0,'\0'),(554,14,'ig24_secret_key','{SENSITIVE}','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','',0,'\0'),(555,14,'ek4dk','{SENSITIVE}','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','',0,'\0'),(556,14,'ig29_secret_keys','{SENSITIVE}','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','',0,'\0'),(557,14,'boots_stockplus_key_hash','{SENSITIVE}','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','',0,'\0'),(558,14,'leo_queuemgr_name','*UNIALPE','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(559,14,'tote_order_line_ref_min_value','0','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(560,14,'tote_order_line_ref_max_value','999999999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(561,14,'tote_ref_min_value','0','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(562,14,'use_tote_prefix','true','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(563,14,'tote_ref_max_value','9999999999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(564,14,'tote_prefix','TOTE','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(565,14,'uis_init_heap_mem','5120m','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(566,14,'uis_max_heap_mem','5120m','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(567,14,'uis_perm_size','512m','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(568,14,'uis_max_perm_size','512m','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(569,14,'uis_new_size','1536m','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(570,14,'uis_max_new_size','1536m','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(571,14,'uis_system_name','uisUser','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(572,14,'uis_port','8280','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(573,14,'uis_server','gbrpmsuist00.corp.internal','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(574,14,'batchclient_enable','true','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(575,14,'uis_sys_credential_file','SysCredential.properties','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(576,14,'uis_asm_enabled_check_list','availabilityChecker,deployChecker','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(577,14,'batch_client_ws_password','{SENSITIVE}','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','',0,'\0'),(578,14,'batch_client_ws_enc_enabled','true','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(579,14,'batch_client_ws_sec_enabled','true','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(580,14,'batch_client_ws_user','john','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(581,14,'dispensed_db_name','EAS_DB','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','# Used for daily_dispensed and all_dispensed scripts','\0',0,'\0'),(582,14,'batch_user','batchJobUser1','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(583,14,'batch_sys_credential_file','SysCredential_generatedByEAS.properties','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(584,14,'batch_max_retry_attempts','10','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(585,14,'batchclient_ek4dk','{SENSITIVE}','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','',0,'\0'),(586,14,'syscred_password','{SENSITIVE}','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','',0,'\0'),(587,14,'createUpdatePrescription_INSERT_THREADS','30','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(588,14,'exit_code_batch_enable','true','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(589,14,'tsfn_server','gbrpmstali21.corp.internal','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(590,14,'createUpdatePrescription_VALIDATION_THREADS','30','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(591,14,'syscred_passwordIssueDate','1488787987754','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(592,14,'tsfz_environment_id','43','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(593,14,'tsfz_NASHxCf','{SENSITIVE}','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','',0,'\0'),(594,14,'tsfz_inbound_columbus_zipfile_name','','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(595,14,'tsfz_inbound_columbus_retain_number','0','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(596,14,'tsfz_inbound_columbus_zip_time','7','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(597,14,'tsfz_inbound_columbus_retain_time','30','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(598,14,'tsfz_inbound_columbus_csv_zipfile_name','','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(599,14,'tsfz_inbound_columbus_csv_zip_time','7','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(600,14,'tsfz_inbound_columbus_csv_retain_time','30','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(601,14,'tsfz_outbound_columbus_zip_time','7','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(602,14,'tsfz_outbound_columbus_zipfile_name','','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(603,14,'tsfz_inbound_columbus_csv_retain_number','0','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(604,14,'tsfz_internal_columbus_readmeFiles_zipfile_name','','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(605,14,'tsfz_outbound_columbus_retain_time','30','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(606,14,'tsfz_outbound_columbus_retain_number','0','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(607,14,'tsfz_internal_columbus_readmeFiles_zip_time','7','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(608,14,'tsfz_internal_columbus_readmeFiles_retain_number','0','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(609,14,'tsfz_internal_columbus_readmeFiles_retain_time','30','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(610,14,'tsfz_rootZipFiles_zip_time','7','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(611,14,'tsfz_rootZipFiles_zipfile_name','','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(612,14,'tsfz_rootZipFiles_retain_number','0','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(613,14,'tsfz_rootZipFiles_retain_time','30','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(614,14,'tsfz_insideCSVFiles_zipfile_name','','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(615,14,'tsfz_insideCSVFiles_zip_time','7','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(616,14,'tsfz_insideCSVFiles_retain_time','30','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(617,14,'tsfz_insideCSVFiles_retain_number','0','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(618,14,'tsfz_insideZipFiles_zipfile_name','','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(619,14,'tsfz_insideZipFiles_zip_time','7','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(620,14,'tsfz_insideZipFiles_retain_time','30','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(621,14,'tsfz_archives_columbus_zipfile_name','','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(622,14,'tsfz_insideZipFiles_retain_number','0','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(623,14,'tsfz_archives_columbus_zip_time','7','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(624,14,'tsfz_archives_columbus_retain_time','30','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(625,14,'tsfz_archives_columbus_retain_number','0','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(626,14,'tsfz_history_inbound_columbus_zipfile_name','','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(627,14,'tsfz_history_inbound_columbus_zip_time','7','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(628,14,'tsfz_history_inbound_columbus_retain_number','0','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(629,14,'tsfz_history_outbound_columbus_zipfile_name','','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(630,14,'tsfz_history_inbound_columbus_retain_time','30','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(631,14,'tsfz_history_outbound_columbus_zip_time','7','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(632,14,'tsfz_history_outbound_columbus_retain_time','30','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(633,14,'tsfz_history_inbound_columbus_readmeFiles_zipfile_name','','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(634,14,'tsfz_history_outbound_columbus_retain_number','0','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(635,14,'tsfz_history_inbound_columbus_readmeFiles_zip_time','7','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(636,14,'tsfz_history_inbound_columbus_readmeFiles_retain_time','30','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(637,14,'tsfz_history_outbound_columbus_readmeFiles_zip_time','7','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(638,14,'tsfz_history_outbound_columbus_readmeFiles_zipfile_name','','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(639,14,'tsfz_history_inbound_columbus_readmeFiles_retain_number','0','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(640,14,'tsfz_history_outbound_columbus_readmeFiles_retain_number','0','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(641,14,'tsfz_history_outbound_columbus_readmeFiles_retain_time','30','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(642,14,'pce_if108_domain_code','coretest','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(643,14,'pce_environment_id','41','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(644,14,'pce_rsa_exp','{SENSITIVE}','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','',0,'\0'),(645,14,'pce_NASHxCf','{SENSITIVE}','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','',0,'\0'),(646,14,'pce_rsa_mod','{SENSITIVE}','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','',0,'\0'),(647,14,'pce_outbound_zip_time','999999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(648,14,'pce_outbound_retain_time','99999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(649,14,'pce_outbound_retain_number','0','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(650,14,'pce_qAutomatInput_zip_time','999999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(651,14,'pce_qAutomatInput_retain_time','99999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(652,14,'pce_qAutomatInput_bad_zip_time','999999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(653,14,'pce_qAutomatInput_retain_number','0','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(654,14,'pce_qAutomatInput_bad_retain_time','99999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(655,14,'pce_qAutomatInput_bad_retain_number','0','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(656,14,'pce_qAutomatOutput_retain_time','99999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(657,14,'pce_qAutomatOutput_zip_time','999999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(658,14,'pce_qAutomatOutput_retain_number','0','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(659,14,'pce_qAutomatOutput_bad_retain_time','99999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(660,14,'pce_qAutomatOutput_bad_zip_time','999999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(661,14,'pce_qAutomatOutput_bad_retain_number','0','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(662,14,'pce_qCombined_zip_time','999999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(663,14,'pce_qCombined_retain_time','99999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(664,14,'pce_qCombined_retain_number','0','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(665,14,'pce_qCombined_bad_retain_number','0','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(666,14,'pce_qCombined_bad_zip_time','999999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(667,14,'pce_qCombined_bad_retain_time','99999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(668,14,'pce_qIF130_FinanceFeed_zip_time','999999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(669,14,'pce_qIF130_FinanceFeed_retain_time','99999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(670,14,'pce_qIF130_FinanceFeed_retain_number','0','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(671,14,'pce_qIF130_FinanceFeed_bad_zip_time','999999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(672,14,'pce_qIF130_FinanceFeed_bad_retain_time','99999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(673,14,'pce_qIF130_FinanceFeed_bad_retain_number','0','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(674,14,'pce_qIF134_zip_time','999999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(675,14,'pce_qIF134_retain_number','0','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(676,14,'pce_qIF134_retain_time','99999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(677,14,'pce_qIF137_Audit_retain_number','0','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(678,14,'pce_qIF137_Audit_zip_time','999999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(679,14,'pce_qIF137_Audit_retain_time','99999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(680,14,'pce_qIF137_Audit_bad_zip_time','999999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(681,14,'pce_qIF137_Audit_bad_retain_time','99999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(682,14,'pce_qIF137_Audit_bad_retain_number','0','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(683,14,'pce_qIF138_IMS_DTP_zip_time','999999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(684,14,'pce_qIF138_IMS_DTP_retain_time','99999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(685,14,'pce_qIF138_IMS_DTP_bad_zip_time','999999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(686,14,'pce_qIF138_IMS_DTP_retain_number','0','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(687,14,'pce_qIF138_IMS_DTP_bad_retain_time','99999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(688,14,'pce_qIF138_IMS_DTP_bad_retain_number','0','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(689,14,'pce_qIF138_Mftr_Audit_retain_time','99999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(690,14,'pce_qIF138_Mftr_Audit_zip_time','999999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(691,14,'pce_qIF138_Mftr_Audit_retain_number','0','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(692,14,'pce_qIF138_Mftr_Audit_bad_zip_time','999999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(693,14,'pce_qIF138_Mftr_Audit_bad_retain_time','99999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(694,14,'pce_qIF59_zip_time','999999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(695,14,'pce_qIF138_Mftr_Audit_bad_retain_number','0','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(696,14,'pce_qIF59_retain_time','99999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(697,14,'pce_qIF59_retain_number','0','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(698,14,'pce_qIF59_bad_zip_time','999999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(699,14,'pce_qIF59_bad_retain_number','0','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(700,14,'pce_qIF90_DeliveryRequest_retain_time','99999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(701,14,'pce_qIF90_DeliveryRequest_zip_time','999999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(702,14,'pce_qIF59_bad_retain_time','99999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(703,14,'pce_qIF90_DeliveryRequest_retain_number','0','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(704,14,'pce_qIF90_DeliveryRequest_bad_zip_time','999999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(705,14,'pce_qIF90_DeliveryRequest_bad_retain_time','99999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(706,14,'pce_qIF90_DeliveryRequest_bad_retain_number','0','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(707,14,'pce_qLabelData_retain_time','99999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(708,14,'pce_qLabelData_zip_time','999999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(709,14,'pce_qLabelData_retain_number','0','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(710,14,'pce_qLabels_zip_time','999999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(711,14,'pce_qLabels_retain_time','99999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(712,14,'pce_qLabels_retain_number','0','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(713,14,'pce_qTote_Centric_Data_zip_time','999999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(714,14,'pce_qTote_Centric_Data_retain_time','99999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(715,14,'pce_qTote_Centric_Data_retain_number','0','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(716,14,'pce_tmp_zip_time','999999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(717,14,'pce_tmp_retain_time','99999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(718,14,'pce_tmp_retain_number','0','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(719,14,'pce_history_zip_time','999999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(720,14,'pce_history_retain_time','99999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(721,14,'pce_history_retain_number','0','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(722,14,'pce_history_qAutomatOutput_retain_time','99999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(723,14,'pce_history_qAutomatInput_retain_time','99999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(724,14,'pce_history_qAutomatInput_retain_number','0','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(725,14,'pce_history_qAutomatInput_zip_time','999999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(726,14,'pce_history_qAutomatOutput_zip_time','999999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(727,14,'pce_history_qAutomatOutput_retain_number','0','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(728,14,'pce_history_qCombined_retain_time','99999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(729,14,'pce_history_qCombined_zip_time','999999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(730,14,'pce_history_qCombined_retain_number','0','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(731,14,'pce_history_qIF130_FinanceFeed_retain_number','0','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(732,14,'pce_history_qIF130_FinanceFeed_retain_time','99999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(733,14,'pce_history_qIF130_FinanceFeed_zip_time','999999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(734,14,'pce_history_qIF134_zip_time','999999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(735,14,'pce_history_qIF134_retain_time','99999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(736,14,'pce_history_qIF134_retain_number','0','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(737,14,'pce_history_qIF137_Audit_zip_time','999999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(738,14,'pce_history_qIF137_Audit_retain_time','99999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(739,14,'pce_history_qIF138_IMS_DTP_retain_time','99999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(740,14,'pce_history_qIF137_Audit_retain_number','0','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(741,14,'pce_history_qIF138_IMS_DTP_zip_time','999999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(742,14,'pce_history_qIF138_IMS_DTP_retain_number','0','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(743,14,'pce_history_qIF138_Mftr_Audit_zip_time','999999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(744,14,'pce_history_qIF138_Mftr_Audit_retain_time','99999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(745,14,'pce_history_qIF138_Mftr_Audit_retain_number','0','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(746,14,'pce_history_qIF90_DeliveryRequest_retain_time','99999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(747,14,'pce_history_qIF90_DeliveryRequest_zip_time','999999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(748,14,'pce_history_qIF90_DeliveryRequest_retain_number','0','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(749,14,'pce_history_qLabelData_retain_time','99999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(750,14,'pce_history_qLabelData_zip_time','999999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(751,14,'pce_history_qLabelData_retain_number','0','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(752,14,'pce_history_qTote_Centric_Data_zip_time','999999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(753,14,'pce_history_qTote_Centric_Data_retain_time','99999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(754,14,'pce_history_qTote_Centric_Data_retain_number','0','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(755,14,'pce_history_outbound_zip_time','999999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(756,14,'pce_history_outbound_retain_time','99999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(757,14,'pce_history_outbound_retain_number','0','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(758,14,'pce_logs_zip_time','999999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(759,14,'pce_logs_retain_time','99999','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(760,14,'pce_logs_retain_number','0','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(761,14,'pce_automat_server','','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(762,14,'pce_db_audit_name','','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(763,14,'pce_automat_settrace','all','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(764,14,'pce_db_audit_server','','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(765,14,'pce_db_audit_user','','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(766,14,'pce_db_audit_port','','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(767,14,'pce_db_audit_pass','','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(768,14,'pce_db_audit_schema','','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(769,14,'pce_db_if138_mftr_audit_name','','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(770,14,'pce_db_if138_mftr_audit_server','','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(771,14,'pce_db_if138_mftr_audit_port','','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(772,14,'pce_db_if138_mftr_audit_pass','','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(773,14,'pce_db_if138_mftr_audit_user','','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(774,14,'pce_db_if138_mftr_audit_schema','','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(775,14,'pce_db_masterdata_server','','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(776,14,'pce_db_masterdata_user','','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(777,14,'pce_db_masterdata_port','','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(778,14,'pce_db_masterdata_name','','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(779,14,'pce_db_masterdata_pass','','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(780,14,'pce_db_masterdata_schema_obd','','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(781,14,'pce_db_masterdata_schema_pubsta','','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(782,14,'pce_ftp_host','','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(783,14,'pce_ftp_port','','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(784,14,'pce_ftp_pass','','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(785,14,'pce_queue_manager','*UNIALPE','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(786,14,'pce_queue_manager_if90_leo','*NAPUKTA','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(787,14,'pce_ftp_user','','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(788,14,'optimus_db_server','gb2pmsdbst3.resources.corp.internal','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(789,14,'optimus_db_port','1521','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(790,14,'optimus_db_user','OPTMIGFT3','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(791,14,'optimus_db_pass','{SENSITIVE}','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','',0,'\0'),(792,14,'optimus_db_name','PMST1','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(793,14,'stockplus_db_server','gb2pmsdbst3.resources.corp.internal','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(794,14,'stockplus_db_port','1521','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(795,14,'stockplus_db_user','STKMIGFT3','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(796,14,'stockplus_db_name','PMST1','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(797,14,'stockplus_db_pass_java','{SENSITIVE}','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','#this is the same as below \'stockplus_db_pass\' but is using different encryption tech ..this one is used in default.properties','',0,'\0'),(798,14,'fullmig_db_server','gb2pmsdbst3.resources.corp.internal','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(799,14,'stockplus_db_pass','{SENSITIVE}','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','',0,'\0'),(800,14,'fullmig_db_port','1521','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(801,14,'fullmig_db_name','PMST1','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(802,14,'fullmig_db_pass_java','{SENSITIVE}','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','##this is the same as below \'fullmig_db_pass\' but is using different encryption tech .. this one is used in default.properties','',0,'\0'),(803,14,'fullmig_db_pass','{SENSITIVE}','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','',0,'\0'),(804,14,'masterdata_db_name','MasterData','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(805,14,'fullmig_db_user','FULLMIGFT3','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(806,14,'masterdata_db_server','gb2pmsdbst11.corp.internal','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(807,14,'masterdata_db_port','52847','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(808,14,'masterdata_db_user','TSFZ','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(809,14,'masterdata_db_pass','{SENSITIVE}','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','',0,'\0'),(810,14,'masterdata_db_pass_tsfz','{SENSITIVE}','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','#same as below masterdata_db_pass. but this is used in TSFZ portal and encrypted in TSFZ server','',0,'\0'),(811,14,'stockplusfm_masterdata_db_user','talendp','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(812,14,'stockplusfm_masterdata_pp_source','vw_NX_MapVDrugToColumbus_LastPublished','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(813,14,'stockplusfm_log_file_name_mask','log','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(814,14,'stockplusfm_logmode','LOG4J','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(815,14,'stockplusfm_masterdata_dpp_source','vw_NX_MapPDrugToColumbus_LastPublished','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(816,14,'stockplusfm_sourcefolder','/tests/talend/jobs/scripts/stockplusfm/maps/','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(817,14,'stockplusfm_masterdata_db_pass','{SENSITIVE}','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','',0,'\0'),(818,14,'stockplusfm_184_adr_map_workbook','Adverse Drug Reactions Maps.xlsx','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(819,14,'stockplusfm_184_adr_map_spreadsheet','NexPhase-MASActiveIngredient','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(820,14,'stockplusfm_184_ex_map_workbook','Exemption Maps.xlsx','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(821,14,'stockplusfm_184_mc_map_spreadsheet','NexPhase-MASCondition','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(822,14,'stockplusfm_184_ex_map_spreadsheet','NexPhase-MASExemption','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(823,14,'stockplusfm_184_nda_map_spreadsheet','NexPhase-MASNonDrugAllergy','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(824,14,'stockplusfm_184_mc_map_workbook','Medical Condition Maps.xlsx','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(825,14,'stockplusfm_184_nda_map_workbook','Non Drug Allergy Maps.xlsx','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(826,14,'stockplusfm_184_servicetype_map_workbook','Patient and Service Type Maps.xlsx','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(827,14,'stockplusfm_184_servicetype_map_spreadsheet','Prescription Service Type','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(828,14,'boots_interface_loglevel','INFO','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(829,14,'boots_masterdata_db_schema','PublishedStaging','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(830,14,'boots_masterdata_db_instance','MASTERDATADBIT1','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(831,14,'if056_rsa_pub_modulus','xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(832,14,'if056_rsa_pub_exp','xxxx','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(833,14,'ftp_nxp_host','ftp.cegedimrx.co.uk','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(834,14,'ftp_nxp_user','bootscolumbus','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(835,14,'ftp_nxp_pass','{SENSITIVE}','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','',0,'\0'),(836,14,'ftp_nhs_user','TRUD3-11585@trud.nhs.uk','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(837,14,'ftp_nhs_host','ftp.isd.hscic.gov.uk','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(838,14,'ftp_nhs_pass','{SENSITIVE}','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','',0,'\0'),(839,14,'one_leo_db_host','10.179.20.187','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(840,14,'one_leo_db_port','60000','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(841,14,'one_leo_db_name','unichemd','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(842,14,'one_leo_db_pass','{SENSITIVE}','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','',0,'\0'),(843,14,'one_leo_db_user','enquire','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(844,14,'ah_talend_server','unknown','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(845,14,'ah_talend_user','tagbXadm','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(846,14,'columbus_release','2070000','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(847,14,'columbus_masterdata_4_status','1','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(848,14,'sec_file_release','20150121','ROOT:oneleonardo_envs:columbus-ft3:{ParamName}','\0','\0','','\0',0,'\0'),(849,14,'createUpdateActualProductPack','3.1-1','ROOT:talend_interfaces_7.10.0:tsfn:{ParamName}','\0','\0','','\0',0,'\0'),(850,14,'createUpdateExemption','3.3-1','ROOT:talend_interfaces_7.10.0:tsfn:{ParamName}','\0','\0','','\0',0,'\0'),(851,14,'createUpdateLabelInstruction','3.0-1','ROOT:talend_interfaces_7.10.0:tsfn:{ParamName}','\0','\0','','\0',0,'\0'),(852,14,'createUpdateAdverseReaction','3.2-1','ROOT:talend_interfaces_7.10.0:tsfn:{ParamName}','\0','\0','','\0',0,'\0'),(853,14,'createUpdateGeneralParameter','3.4-1','ROOT:talend_interfaces_7.10.0:tsfn:{ParamName}','\0','\0','','\0',0,'\0'),(854,14,'createUpdateFormulary','3.0-1','ROOT:talend_interfaces_7.10.0:tsfn:{ParamName}','\0','\0','','\0',0,'\0'),(855,14,'createUpdateMedicalCondition','3.0-1','ROOT:talend_interfaces_7.10.0:tsfn:{ParamName}','\0','\0','','\0',0,'\0'),(856,14,'createUpdatePractice','3.3-1','ROOT:talend_interfaces_7.10.0:tsfn:{ParamName}','\0','\0','','\0',0,'\0'),(857,14,'createUpdatePreferredActualProductPack','3.2-1','ROOT:talend_interfaces_7.10.0:tsfn:{ParamName}','\0','\0','','\0',0,'\0'),(858,14,'createUpdatePrescriberType','3.0-1','ROOT:talend_interfaces_7.10.0:tsfn:{ParamName}','\0','\0','','\0',0,'\0'),(859,14,'createUpdatePreferredProductSKU','3.4-1','ROOT:talend_interfaces_7.10.0:tsfn:{ParamName}','\0','\0','','\0',0,'\0'),(860,14,'createUpdatePrescriber','3.2-1','ROOT:talend_interfaces_7.10.0:tsfn:{ParamName}','\0','\0','','\0',0,'\0'),(861,14,'createUpdatePrescription','5.5-1','ROOT:talend_interfaces_7.10.0:tsfn:{ParamName}','\0','\0','','\0',0,'\0'),(862,14,'createUpdatePrescription_FM','6.3-1','ROOT:talend_interfaces_7.10.0:tsfn:{ParamName}','\0','\0','','\0',0,'\0'),(863,14,'createUpdatePrescriptionFormType','3.6-1','ROOT:talend_interfaces_7.10.0:tsfn:{ParamName}','\0','\0','','\0',0,'\0'),(864,14,'createUpdateProduct','3.3-1','ROOT:talend_interfaces_7.10.0:tsfn:{ParamName}','\0','\0','','\0',0,'\0'),(865,14,'createUpdateProductBarcode','3.2-1','ROOT:talend_interfaces_7.10.0:tsfn:{ParamName}','\0','\0','','\0',0,'\0'),(866,14,'createUpdatePrescriptionGroup','3.3-1','ROOT:talend_interfaces_7.10.0:tsfn:{ParamName}','\0','\0','','\0',0,'\0'),(867,14,'createUpdateProductFlavour','3.0-1','ROOT:talend_interfaces_7.10.0:tsfn:{ParamName}','\0','\0','','\0',0,'\0'),(868,14,'createUpdateProductLogistics','3.1-1','ROOT:talend_interfaces_7.10.0:tsfn:{ParamName}','\0','\0','','\0',0,'\0'),(869,14,'createUpdateProductSKU','3.4-1','ROOT:talend_interfaces_7.10.0:tsfn:{ParamName}','\0','\0','','\0',0,'\0'),(870,14,'createUpdateSite','3.5-1','ROOT:talend_interfaces_7.10.0:tsfn:{ParamName}','\0','\0','','\0',0,'\0'),(871,14,'createUpdateStockAvailability','3.0-1','ROOT:talend_interfaces_7.10.0:tsfn:{ParamName}','\0','\0','','\0',0,'\0'),(872,14,'createUpdateSupplier','3.0-1','ROOT:talend_interfaces_7.10.0:tsfn:{ParamName}','\0','\0','','\0',0,'\0'),(873,14,'createUpdateStoreServiceCentreLink','3.0-1','ROOT:talend_interfaces_7.10.0:tsfn:{ParamName}','\0','\0','','\0',0,'\0'),(874,14,'createUpdateMasterDataVersion','1.1-1','ROOT:talend_interfaces_7.10.0:tsfn:{ParamName}','\0','\0','','\0',0,'\0'),(875,14,'executeSQL','2.3-1','ROOT:talend_interfaces_7.10.0:tsfn:{ParamName}','\0','\0','','\0',0,'\0'),(876,14,'createUpdateTwinningScheme','0.1-1','ROOT:talend_interfaces_7.10.0:tsfn:{ParamName}','\0','\0','','\0',0,'\0'),(877,14,'import_IG02','1.2-1','ROOT:talend_interfaces_7.10.0:tsfn:{ParamName}','\0','\0','','\0',0,'\0'),(878,14,'import_IG01','1.3-1','ROOT:talend_interfaces_7.10.0:tsfn:{ParamName}','\0','\0','','\0',0,'\0'),(879,14,'import_IG04','1.2-1','ROOT:talend_interfaces_7.10.0:tsfn:{ParamName}','\0','\0','','\0',0,'\0'),(880,14,'import_IG03','3.4-1','ROOT:talend_interfaces_7.10.0:tsfn:{ParamName}','\0','\0','','\0',0,'\0'),(881,14,'import_IG06','1.2-1','ROOT:talend_interfaces_7.10.0:tsfn:{ParamName}','\0','\0','','\0',0,'\0'),(882,14,'import_IG09','1.2-1','ROOT:talend_interfaces_7.10.0:tsfn:{ParamName}','\0','\0','','\0',0,'\0'),(883,14,'jobrunner','2.8-1','ROOT:talend_interfaces_7.10.0:tsfn:{ParamName}','\0','\0','','\0',0,'\0'),(884,14,'merge_IG01','1.4-1','ROOT:talend_interfaces_7.10.0:tsfn:{ParamName}','\0','\0','','\0',0,'\0'),(885,14,'merge_IG02','1.1-1','ROOT:talend_interfaces_7.10.0:tsfn:{ParamName}','\0','\0','','\0',0,'\0'),(886,14,'merge_IG04','1.3-1','ROOT:talend_interfaces_7.10.0:tsfn:{ParamName}','\0','\0','','\0',0,'\0'),(887,14,'merge_IG03','1.3-1','ROOT:talend_interfaces_7.10.0:tsfn:{ParamName}','\0','\0','','\0',0,'\0'),(888,14,'merge_IG06','1.3-1','ROOT:talend_interfaces_7.10.0:tsfn:{ParamName}','\0','\0','','\0',0,'\0'),(889,14,'merge_IG09','1.3-1','ROOT:talend_interfaces_7.10.0:tsfn:{ParamName}','\0','\0','','\0',0,'\0'),(890,14,'tsfn-encryptionutil','1.2-1','ROOT:talend_interfaces_7.10.0:tsfn:{ParamName}','\0','\0','','\0',0,'\0'),(891,14,'readPrescriptionImsFeed','1.1-1','ROOT:talend_interfaces_7.10.0:tsfn:{ParamName}','\0','\0','','\0',0,'\0'),(892,14,'readPrescriberImsFeed','1.1-1','ROOT:talend_interfaces_7.10.0:tsfn:{ParamName}','\0','\0','','\0',0,'\0'),(893,14,'OptimusMigration','1.90-1','ROOT:talend_interfaces_7.10.0:tsfn:{ParamName}','\0','\0','# Boots interface','\0',0,'\0'),(894,14,'StockPlusFM_Migration','6.12-1','ROOT:talend_interfaces_7.10.0:tsfn:{ParamName}','\0','\0','# Boots interface','\0',0,'\0'),(895,14,'StockPlus_Migration','4.25-1','ROOT:talend_interfaces_7.10.0:tsfn:{ParamName}','\0','\0','# Boots interface','\0',0,'\0'),(896,14,'StockPlusFM_Migration_Maps','6.15-1','ROOT:talend_interfaces_7.10.0:tsfn:{ParamName}','\0','\0','# Boots interface','\0',0,'\0'),(897,14,'IF033_01_general_practice','0.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(898,14,'IF033_02_general_practice_relationship','0.2-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(899,14,'IF033_03_general_dental_practitioners','0.2-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(900,14,'IF033_05_general_dental_practitioners_relationships','0.2-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(901,14,'IF033_x_01_01_Monitor','0.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(902,14,'IF033_04_general_dental_practices','0.2-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(903,14,'IF033_x_01_03_Extract','0.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(904,14,'IF033_x_01_02_Download','0.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(905,14,'IF033_x_01_04_Validate','0.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(906,14,'IF061_00_01_Download','0.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(907,14,'IF061_00_02_Extract','0.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(908,14,'IF061_02_01_DMDVirtDrugs','0.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(909,14,'IF061_01_01_DMDPhysDrugs','0.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(910,14,'IF061_04_01_MAPDMDToVirtDrugs','0.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(911,14,'IF061_03_01_MAPDMDToPhysDrugs','0.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(912,14,'IF061_05_01_MASPhysDrugs','0.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(913,14,'IF061_06_01_MASUnitOfMeasure','0.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(914,14,'IF101_01_01_MR_adverse_reaction','2.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(915,14,'IF061_08_01_MASVirtDrugs','0.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(916,14,'IF061_07_01_MASUnits','0.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(917,14,'IF101_01_02_MR_adverse_reaction','2.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(918,14,'IF061_09_01_MASPresDispList','0.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(919,14,'IF101_02_01_MR_exemption','2.4-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(920,14,'IF101_04_02_MR_formulary','2.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(921,14,'IF101_02_02_MR_exemption','2.5-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(922,14,'IF101_03_02_MR_flavour','2.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(923,14,'IF101_03_01_MR_flavour','2.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(924,14,'IF101_04_01_MR_formulary','2.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(925,14,'IF101_05_01_MR_medicalCondition','2.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(926,14,'IF101_05_02_MR_medicalCondition','2.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(927,14,'IF101_06_01_MR_prescriberType','2.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(928,14,'IF101_06_02_MR_prescriberType','2.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(929,14,'IF101_07_02_MR_prescriptionFormType','2.3-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(930,14,'IF101_07_01_MR_prescriptionFormType','2.2-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(931,14,'IF101_08_01_MR_prescriptionService','2.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(932,14,'IF101_09_01_MR_productClass','2.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(933,14,'IF101_10_01_MR_region','2.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(934,14,'IF101_11_01_MR_supplier','2.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(935,14,'IF101_11_02_MR_supplier','2.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(936,14,'IF101_12_01_MR_unitOfMeasure','2.2-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(937,14,'IF101_13_01_MR_role','0.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(938,14,'IF101_12_02_MR_unitOfMeasure','2.2-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(939,14,'IF101_13_02_MR_role','0.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(940,14,'IF101_14_01_MR_general','2.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(941,14,'IF101_14_02_MR_general','2.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(942,14,'IF101_20_01_MR_prescriberTypeToFormType','2.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(943,14,'IF101_21_01_MR_levyRegionFee','2.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(944,14,'IF101_21_02_MR_levyRegionFee','2.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(945,14,'IF101_22_01_MR_formulation','2.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(946,14,'IF101_22_02_MR_formulation','2.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(947,14,'IF101_23_01_MR_EpsResponseMessage','1.0-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(948,14,'IF101_24_01_SR_MasterDataVersion_IG01','1.0-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(949,14,'IF101_23_02_MR_EpsResponseMessage','1.0-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(950,14,'IF101_24_02_SR_MasterDataVersion_IG01','1.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(951,14,'IF102_24_01_SR_MasterDataVersion_IG02','1.0-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(952,14,'IF102_24_02_SR_MasterDataVersion_IG02','1.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(953,14,'IF102_01_01_MR_prescriber','2.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(954,14,'IF102_01_02_MR_prescriber','2.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(955,14,'IF102_02_02_MR_practice','2.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(956,14,'IF102_03_01_MR_prescriber_practice','2.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(957,14,'IF103_01_01_MR_PrescribableProduct','2.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(958,14,'IF102_02_01_MR_practice','2.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(959,14,'IF103_02_01_MR_FormularyToPP','2.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(960,14,'IF103_01_02_MR_PrescribableProduct','2.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(961,14,'IF103_03_01_MR_PptoLIText','2.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(962,14,'IF103_04_02_MR_DispensingSKU','2.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(963,14,'IF103_04_01_MR_DispensingSKU','2.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(964,14,'IF103_05_01_MR_PptoDSKU','2.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(965,14,'IF103_06_01_MR_RegionalDSKU','2.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(966,14,'IF103_07_01_MR_DispensingProductPack','2.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(967,14,'IF103_07_02_MR_DispensingProductPack','2.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(968,14,'IF103_09_01_MR_LabelInstructionText','2.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(969,14,'IF103_08_01_MR_RegionalDPP','2.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(970,14,'IF103_09_02_MR_LabelInstructionText','2.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(971,14,'IF103_10_01_MR_PPPrices','2.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(972,14,'IF103_24_02_SR_MasterDataVersion_IG03','1.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(973,14,'IF103_24_01_SR_MasterDataVersion_IG03','1.0-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(974,14,'IF105_24_01_SR_MasterDataVersion_IG04','1.0-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(975,14,'IF105_24_02_SR_MasterDataVersion_IG04','1.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(976,14,'IF105_01_01_MR_PreferredDSKU','2.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(977,14,'IF105_01_02_MR_PreferredDSKU','2.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(978,14,'IF105_02_01_MR_PreferredActualProductPack','2.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(979,14,'IF105_02_02_MR_PreferredActualProductPack','2.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(980,14,'IF108_01_02_MR_store','2.4-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(981,14,'IF108_01_01_MR_store','2.4-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(982,14,'IF108_02_02_MR_storeServiceLink','2.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(983,14,'IF108_24_01_SR_MasterDataVersion_IG06','1.0-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(984,14,'IF108_24_02_SR_MasterDataVersion_IG06','1.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(985,14,'IF110_24_01_SR_MasterDataVersion_IG09','1.0-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(986,14,'IF110_24_02_SR_MasterDataVersion_IG09','1.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(987,14,'IF110_01_01_product','0.3-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(988,14,'IF110_01_02_product','0.3-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(989,14,'IF172_01_01_stockEnquiry','0.8-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(990,14,'IF172_01_02_stockAvailability','0.2-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(991,14,'IF175_01_01_stockTake','0.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(992,14,'IF172_02_02_twinningScheme','0.2-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(993,14,'IF176_01_01_stockFile','0.2-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(994,14,'IF176_01_02_stockFile','0.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(995,14,'IF175_01_02_stockTake','0.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(996,14,'IF33_01_02','0.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(997,14,'IF179_01_01_barcode','0.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(998,14,'IF179_01_02_barcode','0.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(999,14,'PCE_AutomatReceiver_main','0.6-1','ROOT:talend_interfaces_7.10.0:pce:{ParamName}','\0','\0','','\0',0,'\0'),(1000,14,'tsfz-encryptionutil','0.1-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(1001,14,'tsfz-xsd','0.9-1','ROOT:talend_interfaces_7.10.0:tsfz:{ParamName}','\0','\0','','\0',0,'\0'),(1002,14,'PCE_CPAS_SFTP_Sender','0.4-1','ROOT:talend_interfaces_7.10.0:pce:{ParamName}','\0','\0','','\0',0,'\0'),(1003,14,'PCE_AutomatTransmitter_main','0.2-1','ROOT:talend_interfaces_7.10.0:pce:{ParamName}','\0','\0','','\0',0,'\0'),(1004,14,'PCE_DS_IF130_FinanceFeed','0.4-1','ROOT:talend_interfaces_7.10.0:pce:{ParamName}','\0','\0','','\0',0,'\0'),(1005,14,'PCE_DS_IF137_Audit','0.2-1','ROOT:talend_interfaces_7.10.0:pce:{ParamName}','\0','\0','','\0',0,'\0'),(1006,14,'PCE_DS_IF138_IMS_DTP','0.6-1','ROOT:talend_interfaces_7.10.0:pce:{ParamName}','\0','\0','','\0',0,'\0'),(1007,14,'PCE_DS_IF138_Mftr_Audit','0.1-1','ROOT:talend_interfaces_7.10.0:pce:{ParamName}','\0','\0','','\0',0,'\0'),(1008,14,'PCE_IF134_Loader','0.1-1','ROOT:talend_interfaces_7.10.0:pce:{ParamName}','\0','\0','','\0',0,'\0'),(1009,14,'PCE_DS_IF90_DeliveryRequest','0.5-1','ROOT:talend_interfaces_7.10.0:pce:{ParamName}','\0','\0','','\0',0,'\0'),(1010,14,'PCE_IF108_Loader','0.2-1','ROOT:talend_interfaces_7.10.0:pce:{ParamName}','\0','\0','','\0',0,'\0'),(1011,14,'PCE_IF59_MQ_Reader_from_PMS','0.1-1','ROOT:talend_interfaces_7.10.0:pce:{ParamName}','\0','\0','','\0',0,'\0'),(1012,14,'PCE_MonitorAudit','0.2-1','ROOT:talend_interfaces_7.10.0:pce:{ParamName}','\0','\0','','\0',0,'\0'),(1013,14,'PCE_Merge','0.4-1','ROOT:talend_interfaces_7.10.0:pce:{ParamName}','\0','\0','','\0',0,'\0'),(1014,14,'PCE_OutputSplit','0.5-1','ROOT:talend_interfaces_7.10.0:pce:{ParamName}','\0','\0','','\0',0,'\0'),(1015,14,'PCE_toAutomat_Masterdata_IF134','0.2-1','ROOT:talend_interfaces_7.10.0:pce:{ParamName}','\0','\0','','\0',0,'\0'),(1016,14,'PCE_Util_STOP_All_Runtime_Jobs','0.1-1','ROOT:talend_interfaces_7.10.0:pce:{ParamName}','\0','\0','','\0',0,'\0'),(1017,14,'PCE_toAutomat_Picking','0.3-1','ROOT:talend_interfaces_7.10.0:pce:{ParamName}','\0','\0','','\0',0,'\0'),(1018,14,'PCE_InputSplit','0.7-1','ROOT:talend_interfaces_7.10.0:pce:{ParamName}','\0','\0','','\0',0,'\0'),(1019,14,'pce-parameters-files','0.1-1','ROOT:talend_interfaces_7.10.0:pce:{ParamName}','\0','\0','','\0',0,'\0'),(1020,14,'tsfz-encryptionutil','0.1-1','ROOT:talend_interfaces_7.10.0:pce:{ParamName}','\0','\0','','\0',0,'\0');
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
  `ReleaseParam` varchar(4096) DEFAULT NULL,
  `ReleaseValue` varchar(4096) DEFAULT NULL,
  `ReleaseDataID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Version` bigint(20) NOT NULL DEFAULT '0',
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
  `DataTypeName` varchar(255) DEFAULT NULL,
  `Version` bigint(20) NOT NULL DEFAULT '0',
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
  `ServerName` varchar(255) NOT NULL,
  `ServerTypeID` bigint(20) DEFAULT NULL,
  `NodeID` bigint(20) DEFAULT NULL,
  `Version` bigint(20) NOT NULL DEFAULT '0',
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
INSERT INTO `cm_server` VALUES (7,'gbrpmsdbst01',8,1,0),(9,'gbrpmsuist01',14,2,0),(10,'gbrpmsuist02',14,3,0),(11,'gbrpmseast01',4,4,0),(12,'gbrpmseast02',4,5,0),(13,'gbrpmsbrgt01',3,6,0),(14,'gbrpmsbrgt02',3,7,0),(15,'gbrpmstalt01',12,8,0),(16,'gbrpmstalt02',13,9,0),(17,'gbrpmstalt03',11,10,0),(19,'gbrpmsappt01',6,11,0),(20,'gbrpmsdbst03',7,12,0),(21,'gbrcbiappt01',1,13,0),(22,'gbrcbidbst01',2,14,0),(42,'gbrpmsuisf11',14,19,0),(43,'gbrpmseasf11',4,20,0),(44,'gbrpmsbrgf11',3,21,0),(45,'gbrpmstalf11',12,22,0),(46,'gbrpmstalf12',13,23,0),(47,'gbrpmstalf13',11,24,0),(48,'gbrpmsappf11',6,25,0),(51,'gbrpmsuise01',14,28,0),(52,'gbrpmsuise11',14,29,0),(53,'gbrpmsease01',4,30,0),(54,'gbrpmsease11',4,31,0),(55,'gbrpmsdbse01',8,32,0),(56,'gbrpmstale01',13,33,0),(57,'gbrpmstale11',13,34,0),(61,'gbrpmsuisi01',14,35,0),(62,'gbrpmsrpxt01',5,36,0),(63,'gbrpmseasi01',4,37,0),(64,'gbrpmseasi02',4,38,0),(65,'gbrpmsbrgi01',3,39,0),(66,'gbrpmsbrgi02',3,40,0),(67,'gbrpmstali01',12,41,0),(68,'gbrpmstali02',13,42,0),(69,'gbrpmstali03',11,43,0),(70,'gbrpmsappi01',6,44,0),(71,'gbrpmsuisi11',14,45,0),(72,'gbrpmseasi11',4,46,0),(73,'gbrpmsbrgi11',3,47,0),(74,'gbrpmsbrgi12',3,48,0),(75,'gbrpmstali11',12,49,0),(76,'gbrpmstali12',13,50,0),(77,'gbrpmstali13',11,51,0),(78,'gbrpmsappi11',6,52,0),(79,'gbrpmsuisi21',14,53,0),(80,'gbrpmseasi21',4,54,0),(81,'gbrpmsbrgi21',3,55,0),(82,'gbrpmstali21',12,56,0),(83,'gbrpmstali22',13,57,0),(84,'gbrpmstali23',11,58,0),(85,'gbrpmsappi21',6,59,0),(86,'gbrpmsuisi31',14,60,0),(87,'gbrpmsuisi32',14,61,0),(88,'gbrpmseasi31',4,62,0),(89,'gbrpmseasi32',4,63,0),(90,'gbrpmsbrgi31',3,64,0),(91,'gbrpmsbrgi32',3,65,0),(92,'gbrpmstali31',12,66,0),(93,'gbrpmstali32',13,67,0),(94,'gbrpmstali33',11,68,0),(95,'gbrpmsappi31',6,69,0),(96,'gbrpmsuisi41',14,70,0),(97,'gbrpmsuisi42',14,71,0),(98,'gbrpmseasi41',4,72,0),(99,'gbrpmseasi42',4,73,0),(100,'gbrpmsbrgi41',3,74,0),(101,'gbrpmstali41',12,75,0),(102,'gbrpmstali42',13,76,0),(103,'gbrpmstali43',11,77,0),(104,'gbrpmsappi41',6,78,0),(105,'gbrpmsuisf01',14,79,0),(106,'gbrpmseasf01',4,80,0),(107,'gbrpmsbrgf01',3,81,0),(108,'gbrpmstalf01',12,82,0),(109,'gbrpmstalf02',13,83,0),(110,'gbrpmstalf03',11,84,0),(111,'gbrpmsappf01',6,85,0),(112,'gbrpmsuisf21',14,86,0),(113,'gbrpmseasf21',4,87,0),(114,'gbrpmsbrgf21',3,88,0),(115,'gbrpmstalf21',12,89,0),(116,'gbrpmstalf22',13,90,0),(117,'gbrpmstalf23',11,91,0),(118,'gbrpmsappf21',6,92,0),(119,'gbrpmsuisf31',14,93,0),(120,'gbrpmseasf31',4,94,0),(121,'gbrpmsbrgf31',3,95,0),(122,'gbrpmstalf31',12,96,0),(123,'gbrpmstalf32',13,97,0),(124,'gbrpmstalf33',11,98,0),(125,'gbrpmsappf31',6,99,0),(126,'gbrpmsuisf41',14,100,0),(127,'gbrpmseasf41',4,101,0),(128,'gbrpmsuisu01',14,102,0),(129,'gbrpmseasu01',4,103,0),(130,'gbrpmsbrgu01',3,104,0),(131,'gbrpmstalu01',12,105,0),(132,'gbrpmstalu02',13,106,0),(133,'gbrpmstalu03',11,107,0),(134,'gbrpmsappu01',6,108,0),(135,'gbrpmsuisu11',14,109,0),(136,'gbrpmseasu11',4,110,0),(137,'gbrpmsbrgu11',3,111,0),(138,'gbrpmstalu11',12,112,0),(139,'gbrpmstalu12',13,113,0),(140,'gbrpmstalu13',11,114,0),(141,'gbrpmsappu11',6,115,0),(142,'gbrpmsdbst05',10,116,0),(143,'gbrpmsdbst14',10,117,0),(145,'gbrpmsrept01',9,118,0),(146,'gbrpmsrept02',9,119,0),(147,'gbrcbiappt02',1,120,0),(148,'gbrpmsuisf02',14,121,0),(149,'gbrpmseasf02',4,122,0),(150,'gbrpmsbrgf12',3,123,0),(151,'gbrpmsmigi01',15,124,0),(152,'gbrpmsmigi11',15,125,0),(153,'gbrpmsmigi21',15,126,0),(154,'gbrpmsmigf01',15,127,0),(155,'gbrpmsmigf11',15,128,0),(156,'gbrpmsmigf21',15,129,0),(157,'gbrpmsmigf31',15,130,0),(158,'gbrpmsmigu01',15,131,0),(159,'gbrpmsmigu02',15,132,0),(160,'gbrpmsmigt01',15,133,0),(161,'gbrpmstalf41',12,137,0),(162,'gb1pmsdbse02',10,138,0),(163,'gb1pmsdbse03',10,139,0),(164,'gbrpmsuiss01',14,140,0),(165,'gbrpmsuiss02',14,141,0),(166,'gbrpmsuiss03',14,142,0),(167,'gbrpmsuiss04',14,143,0),(168,'gbrpmsuiss11',14,144,0),(169,'gbrpmsuiss12',14,145,0),(170,'gbrpmsuiss13',14,146,0),(171,'gbrpmsuiss14',14,147,0),(172,'gbrpmsuiss21',14,148,0),(173,'gbrpmsuiss22',14,149,0),(174,'gbrpmsuiss23',14,150,0),(175,'gbrpmsuiss24',14,151,0),(176,'gbrpmseass01',4,152,0),(177,'gbrpmseass02',4,153,0),(178,'gbrpmseass03',4,154,0),(179,'gbrpmseass04',4,155,0),(180,'gbrpmseass11',4,156,0),(181,'gbrpmseass12',4,157,0),(182,'gbrpmseass13',4,158,0),(183,'gbrpmseass14',4,159,0),(184,'gbrpmseass21',4,160,0),(185,'gbrpmseass22',4,161,0),(186,'gbrpmseass23',4,162,0),(187,'gbrpmseass24',4,163,0),(188,'gbrpmsbrgs21',3,164,0),(189,'gbrpmsbrgs22',3,165,0),(190,'gbrpmsdbss10',10,166,0),(191,'gbrpmsdbss11',10,167,0),(192,'gbrpmsdbss22',18,168,0),(193,'gbrpmsdbss23',19,169,0),(194,'gbrpmstals01',12,170,0),(195,'gbrpmstals02',13,171,0),(196,'gbrpmstals03',11,172,0),(197,'gbrpmsreps01',9,173,0),(198,'gbrpmsmigs01',15,174,0),(199,'gbrpmsmigs02',15,175,0),(200,'gbrcbiapps01',1,176,0),(201,'gbrcbiapps02',1,177,0),(202,'gbrcbiapps03',1,178,0),(203,'gbrpmsdbss1',8,180,0),(204,'gbrpmsdbss2',8,181,0),(205,'gbrcbidbss01',2,182,0),(206,'gbrcbidbss02',2,183,0),(207,'gbrpmsdbsr01',8,184,0),(208,'gbrpmsuisr01',14,185,0),(209,'gbrpmsuisr02',14,186,0),(210,'gbrpmseasr01',4,187,0),(211,'gbrpmseasr02',4,188,0),(212,'gbrpmsbrgr01',3,189,0),(213,'gbrpmsbrgr02',3,190,0),(214,'gbrpmstalr01',12,191,0),(215,'gbrpmstalr02',13,192,0),(216,'gbrpmstalr03',11,193,0),(217,'gbrpmsuism01',14,199,0),(218,'gbrpmsuism02',14,200,0),(219,'gbrpmsuism11',14,201,0),(220,'gbrpmsuism12',14,202,0),(221,'gbrpmsuism21',14,203,0),(222,'gbrpmsuism22',14,204,0),(223,'gbrpmseasm01',4,205,0),(224,'gbrpmseasm02',4,206,0),(225,'gbrpmseasm11',4,207,0),(226,'gbrpmseasm12',4,208,0),(227,'gbrpmseasm21',4,209,0),(228,'gbrpmseasm22',4,210,0),(229,'gbrpmsbrgm01',3,211,0),(230,'gbrpmsbrgm02',3,212,0),(231,'gbrpmsbrgm11',3,213,0),(232,'gbrpmsbrgm12',3,214,0),(233,'gbrpmsbrgm21',3,215,0),(234,'gbrpmsbrgm22',3,216,0),(235,'gbrpmsrepm01',9,217,0),(236,'gbrpmsdbsm02',18,218,0),(237,'gbrpmsdbsm03',19,219,0),(238,'gbrpmsdbsm04',10,220,0),(239,'gbrpmsdbsm05',10,221,0),(240,'gbrpmstalm01',12,222,0),(241,'gbrpmstalm02',13,223,0),(242,'gbrpmstalm03',11,224,0),(243,'gbrpmsmigm01',15,225,0),(244,'gbrpmsmigm02',15,226,0),(245,'gbrpmsdbsm01',8,228,0),(246,'gbrpmsuisp01',14,229,0),(247,'gbrpmsuisp02',14,230,0),(248,'gbrpmsuisp03',14,231,0),(249,'gbrpmsuisp04',14,232,0),(250,'gbrpmsuisp11',14,233,0),(251,'gbrpmsuisp12',14,234,0),(252,'gbrpmsuisp13',14,235,0),(253,'gbrpmsuisp14',14,236,0),(254,'gbrpmsuisp21',14,237,0),(255,'gbrpmsuisp22',14,238,0),(256,'gbrpmsuisp23',14,239,0),(257,'gbrpmsuisp24',14,240,0),(258,'gbrpmseasp01',4,241,0),(259,'gbrpmseasp02',4,242,0),(260,'gbrpmseasp03',4,243,0),(261,'gbrpmseasp04',4,244,0),(262,'gbrpmseasp11',4,245,0),(263,'gbrpmseasp12',4,246,0),(264,'gbrpmseasp13',4,247,0),(265,'gbrpmseasp14',4,248,0),(266,'gbrpmseasp21',4,249,0),(267,'gbrpmseasp22',4,250,0),(268,'gbrpmseasp23',4,251,0),(269,'gbrpmseasp24',4,252,0),(270,'gbrpmsbrgp21',3,253,0),(271,'gbrpmsbrgp22',3,254,0),(272,'gbrpmstalp01',12,255,0),(273,'gbrpmstalp02',13,256,0),(274,'gbrpmstalp03',11,257,0),(275,'gbrpmsrepp01',9,258,0),(276,'gbrcbiappp01',1,259,0),(277,'gbrcbiappp02',1,260,0),(278,'gbrcbiappp03',1,261,0),(279,'gbrpmsmigp01',15,262,0),(280,'gbrpmsmigp02',15,263,0),(281,'gbrpmsdbsp13',18,264,0),(282,'gbrpmsdbsp12',19,265,0),(283,'gbrpmsdbsp10',10,266,0),(284,'gbrpmsdbsp11',10,267,0),(285,'gbrpmsdbsp01',8,268,0),(286,'gbrpmsdbsp02',8,269,0),(287,'gbrcbidbsp01',2,270,0),(288,'gbrcbidbsp02',2,271,0);
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
  `ServConfigParameter` varchar(4096) DEFAULT NULL,
  `ServConfigValue` varchar(4096) DEFAULT NULL,
  `ServConfigHieraAddress` varchar(4096) DEFAULT NULL,
  `ServerConfigNotes` varchar(4096) DEFAULT NULL,
  `ServerConfigIsSensitive` bit(1) DEFAULT b'0',
  `Version` bigint(20) NOT NULL DEFAULT '0',
  `isArrayItem` bit(1) NOT NULL DEFAULT b'0',
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
  `ServerTypeName` varchar(255) NOT NULL,
  `Version` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ServerTypeID`),
  UNIQUE KEY `UQ_CM_ServerType_ServerTypeName` (`ServerTypeName`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cm_servertype`
--

LOCK TABLES `cm_servertype` WRITE;
/*!40000 ALTER TABLE `cm_servertype` DISABLE KEYS */;
INSERT INTO `cm_servertype` VALUES (1,'BI - Application',0),(2,'BI - Oracle Database',0),(3,'BRG',0),(4,'EAS',0),(5,'HA Proxy',0),(6,'Master Data - Application',0),(7,'Master Data - Database',0),(8,'PMS Oracle Database',0),(9,'Reporting Server',0),(10,'RESIP HDS',0),(11,'TalenD - PCE',0),(12,'TalenD - TSFN & Boots',0),(13,'TalenD - TSFZ',0),(14,'UIS',0),(15,'Nexphase SmartScript Migration Server',0),(16,'Client',0),(17,'MPC',0),(18,'Master Data - Combined',0),(19,'Master Data - Standby',0);
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
  `Version` bigint(20) NOT NULL DEFAULT '0',
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
INSERT INTO `cm_subenvironment` VALUES (1,9,1,21,0),(2,3,1,12,0),(5,NULL,1,22,0),(6,NULL,1,23,0),(7,12,1,16,0),(8,11,1,17,0),(9,9,1,18,0),(10,11,1,19,0),(11,NULL,1,20,0),(12,3,1,11,0),(13,14,1,13,1),(14,10,1,14,0),(15,9,1,15,0),(16,12,1,24,0),(17,12,1,25,0),(18,8,2,20,0),(19,11,3,20,0),(20,9,2,11,0),(21,11,3,11,0),(22,NULL,1,26,0),(23,NULL,1,27,0),(24,NULL,1,28,0),(25,NULL,2,26,0),(26,NULL,3,26,0),(27,NULL,4,26,0),(28,NULL,2,28,0),(29,NULL,3,28,0),(30,NULL,4,28,0),(32,NULL,1,30,0),(33,NULL,2,30,0),(34,NULL,3,30,0),(35,NULL,4,30,0);
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
  `SubEnvConfigParameter` varchar(4096) DEFAULT NULL,
  `SubEnvConfigValue` varchar(4096) DEFAULT NULL,
  `SubEnvConfigHieraAddress` varchar(4096) DEFAULT NULL,
  `SubEnvConfigNotes` varchar(4096) DEFAULT NULL,
  `SubEnvConfigIsSensitive` bit(1) DEFAULT b'0',
  `Version` bigint(20) NOT NULL DEFAULT '0',
  `isArrayItem` bit(1) NOT NULL DEFAULT b'0',
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
INSERT INTO `cm_subenvironmentconfig` VALUES (2,7,'ccode','gbr','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,8,'env','test','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,9,'sub_env','{ENVID}','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,10,'distrib','EnterpriseLinux','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,11,'log_level','INFO','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,12,'deployment_timeout','900','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,13,'ora_wallet','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,14,'ora_wallet_password','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,15,'db_name','PMST1','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'EAS_DB\':{ParamName}',NULL,'\0',0,'\0'),(2,16,'db_port','1521','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'EAS_DB\':{ParamName}',NULL,'\0',0,'\0'),(2,17,'db_server','gb2pmsdbst3.resources.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'EAS_DB\':{ParamName}',NULL,'\0',0,'\0'),(2,18,'db_user','PMS{ENVID}','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'EAS_DB\':{ParamName}',NULL,'\0',0,'\0'),(2,19,'db_pass','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'EAS_DB\':{ParamName}',NULL,'\0',0,'\0'),(2,20,'db_name','PMST1','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'EAS_DB_STG\':{ParamName}',NULL,'\0',0,'\0'),(2,21,'db_port','1521','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'EAS_DB_STG\':{ParamName}',NULL,'\0',0,'\0'),(2,22,'db_server','gb2pmsdbst3.resources.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'EAS_DB_STG\':{ParamName}',NULL,'\0',0,'\0'),(2,23,'db_user','PMS{ENVID}_STG','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'EAS_DB_STG\':{ParamName}',NULL,'\0',0,'\0'),(2,24,'db_pass','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'EAS_DB_STG\':{ParamName}',NULL,'\0',0,'\0'),(2,25,'db_name','PMST1','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'SYMDS_DB\':{ParamName}',NULL,'\0',0,'\0'),(2,26,'db_port','1521','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'SYMDS_DB\':{ParamName}',NULL,'\0',0,'\0'),(2,27,'db_server','gb2pmsdbst3.resources.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'SYMDS_DB\':{ParamName}',NULL,'\0',0,'\0'),(2,28,'db_user','PMS{ENVID}','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'SYMDS_DB\':{ParamName}',NULL,'\0',0,'\0'),(2,29,'db_pass','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'SYMDS_DB\':{ParamName}',NULL,'\0',0,'\0'),(2,30,'db_name','PMST1','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'OPTIMUS\':{ParamName}',NULL,'\0',0,'\0'),(2,31,'db_port','1521','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'OPTIMUS\':{ParamName}',NULL,'\0',0,'\0'),(2,32,'db_server','gb2pmsdbst3.resources.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'OPTIMUS\':{ParamName}',NULL,'\0',0,'\0'),(2,33,'db_user','OPTMIG{ENVID}','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'OPTIMUS\':{ParamName}',NULL,'\0',0,'\0'),(2,34,'db_pass','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'OPTIMUS\':{ParamName}',NULL,'\0',0,'\0'),(2,35,'application_user','pmsgbrtt','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,36,'application_group','pmsgbrtt','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,37,'maintenance_user','pmsgbmtt','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,38,'tsfn','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:mgmtusers:{ParamName}',NULL,'\0',0,'\0'),(2,39,'gss','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:mgmtusers:{ParamName}',NULL,'\0',0,'\0'),(2,40,'{ENVID}Admin','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:appusers:{ParamName}',NULL,'\0',0,'\0'),(2,41,'{ENVID}Monitoring','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:appusers:{ParamName}',NULL,'\0',0,'\0'),(2,42,'{ENVID}Operations','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:appusers:{ParamName}',NULL,'\0',0,'\0'),(2,43,'{ENVID}Admin','jminix,ADMIN','ROOT:oneleonardo_envs:columbus-{ENVID}:approles:{ParamName}',NULL,'\0',0,'\0'),(2,44,'{ENVID}Monitoring','jminix,MONITORING','ROOT:oneleonardo_envs:columbus-{ENVID}:approles:{ParamName}',NULL,'\0',0,'\0'),(2,45,'{ENVID}Operations','jminix,OPERATIONS','ROOT:oneleonardo_envs:columbus-{ENVID}:approles:{ParamName}',NULL,'\0',0,'\0'),(2,46,'product_name','columbus','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,47,'implementation_name','uk-boots','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,48,'application_desc','Columbus uk-boots implementation','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,49,'deploy_version','7.3.2','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,50,'release','1','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,51,'volumegroup','rootvg','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,52,'data_size','1G','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,53,'file_size','2G','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,54,'soft_size','1G','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,55,'jboss_enable_monitoring','false','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,56,'jboss_management_native_port','9999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,57,'jboss_host','localhost','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,58,'gclog_num_files','10','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,59,'gclog_file_size','100m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,60,'columbus_env_id','D','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,61,'asm_enable','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,62,'asm_enable_list','uis,eas,brg','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,63,'deployments','columbus-chs-7.3.2.ear','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,64,'datasources','java:jboss/datasources/columbus-ds-eas','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,65,'symds_enable','false','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,66,'training_enable','false','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,67,'symds_server','gbrpmseasf11.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,68,'symds_port','8180','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,69,'sym_sec_path','${jboss.server.config.dir}/syncronization/EK4DK','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,70,'sym_sec_file_release','20150115','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,71,'symds_db_server','gb2pmsdbst3.resources.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,72,'symds_db_port','1521','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,73,'symds_db_name','PMST1','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,74,'symds_db_user','PMS{ENVID}','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,75,'symds_db_pass','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,76,'sym_cluster_enabled','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,77,'sym_cluster_lock_timeout','300000','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,78,'osucontainer_concurrency','1-1','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,79,'asncontainer_concurrency','1-1','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,80,'wmq_enable','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,81,'jmxquery_enable','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,82,'centralized_logging_enabled','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,83,'BIQuery','${HOME}','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,84,'jboss_management_http_port','9990','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,85,'asm_jboss_management_user','admin','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,86,'asm_jboss_management_user_psw','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,87,'durcheck_licence','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,88,'clinicalcheck_licence','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,89,'endorsement_licence','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,90,'marchart_notifyMarChart_url','http://10.245.12.244:8090/DrugMessageService.svc','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,91,'housekeeping_enabled','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,92,'enable_new_transmit_due_date_orders_implementation','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,93,'preview_due_now_orders_page_limit','120','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,94,'clinicalcheck_getdur_url','http://gbrpmsdbst14.corp.internal:80/HDS/ClinicalInformation.svc/GetDUR','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,95,'clinicalcheck_getdrug_url','http://gbrpmsdbst14.corp.internal:80/HDS/ClinicalInformation.svc/GetDrugInformation','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,96,'reimbursement_getendorsement_url','http://gbrpmsdbst14.corp.internal:80/HDS/Reimbursement.svc/GetEndorsement','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,97,'emar_notifyPatientCommunity_url','http://10.245.12.244:8090/FacilityMessageService.svc','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,98,'emar_notifyPatient_url','http://10.245.12.244:8090/PatientMessageService.svc','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,99,'brg_server','gbrpmsbrgt00.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,100,'vip_brg_port','8884','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,101,'brg_port','8380','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,102,'brg_init_heap_mem','5120m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,103,'brg_max_heap_mem','5120m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,104,'brg_max_perm_size','512m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,105,'brg_new_size','1536m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,106,'brg_max_new_size','1536m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,107,'brg_spring_profile','outbound_api_channel,outbound_api_adapter,inbound_api_channel,inbound_api_adapter,import_batch,export_batch,internal_job_batch,external_job_batch,sym_chs','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,108,'brg_deployments','columbus-chs-7.3.2.ear,symmetricds-war-1.3.war','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,109,'brg_datasources','java:jboss/datasources/columbus-ds-eas,java:jboss/datasources/columbus-ds-symmetricds','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,110,'brg_asm_enabled_check_list','availabilityChecker,deployChecker,datasourceChecker','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,111,'sync_url','https://gbrpmsbrgt00.corp.internal:8884/symmetricds/sync/chs-master','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,112,'resadapter_arc','wmq.jmsra.rar','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,113,'dispensed_db_name','EAS_DB','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,114,'env_roles_internal_jobs_enable','brg','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,115,'ig32_ek4dk','xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,116,'boots_patient_key_hash','xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,117,'IG32_secret_key','xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,118,'inbound_dir','createUpdateStockTake','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,119,'inbound_dir','createUpdateUnitOfMeasureList','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,120,'inbound_dir','createUpdateFormulation','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,121,'inbound_dir','createUpdatePatient','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,122,'inbound_dir','createUpdatePatientCommunity','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,123,'inbound_dir','createUpdateLevyFeeList','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,124,'outbound_dir','createUpdateStockTake','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,125,'outbound_dir','createUpdateUnitOfMeasureList','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,126,'outbound_dir','createUpdateFormulation','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,127,'outbound_dir','createUpdatePatient','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,128,'outbound_dir','createUpdatePatientCommunity','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,129,'outbound_dir','createUpdateLevyFeeList','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,130,'history_dir','createUpdateStockTake','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,131,'history_dir','createUpdateUnitOfMeasureList','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,132,'history_dir','createUpdateFormulation','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,133,'history_dir','createUpdatePatient','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,134,'history_dir','createUpdatePatientCommunity','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,135,'history_dir','createUpdateLevyFeeList','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,136,'columbus_db_version','7.3.2','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,137,'eas_spring_profile','outbound_api_channel,outbound_api_adapter,offline','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,138,'eas_deployments','columbus-chs-7.3.2.ear','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,139,'eas_datasources','java:jboss/datasources/columbus-ds-eas','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,140,'eas_asm_enabled_check_list','availabilityChecker,deployChecker,datasourceChecker','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,141,'eas_db_server','gb2pmsdbst3.resources.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,142,'eas_db_port','1521','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,143,'eas_db_name','PMST1','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,144,'eas_db_user','PMS{ENVID}','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,145,'eas_db_pass','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,146,'eas_db_staging_server','gb2pmsdbst3.resources.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,147,'eas_db_staging_port','1521','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,148,'eas_db_staging_name','PMST1','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,149,'eas_db_staging_user','PMS{ENVID}_STG','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,150,'eas_db_staging_pass','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,151,'eas_port','8180','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,152,'vip_eas_server','gbrpmseast00.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,153,'vip_eas_port','8849','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,154,'eas_init_heap_mem','5120m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,155,'eas_max_heap_mem','5120m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,156,'eas_max_perm_size','512m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,157,'eas_new_size','1536m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,158,'eas_max_new_size','1536m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,159,'CPAS_modulus','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,160,'CPAS_exponent','AQAB','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,161,'ig29_secret_keys','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,162,'boots_stockplus_key_hash','B5B','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,163,'ig24_secret_key','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,164,'ek4dk','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,165,'leo_queuemgr_name','*UNIALPD','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,166,'tote_order_line_ref_min_value','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,167,'tote_order_line_ref_max_value','999999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,168,'tote_ref_min_value','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,169,'tote_ref_max_value','9999999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,170,'use_tote_prefix','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,171,'tote_prefix','TOTE','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,172,'uis_init_heap_mem','5120m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,173,'uis_max_heap_mem','5120m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,174,'uis_max_perm_size','512m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,175,'uis_new_size','1536m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,176,'uis_max_new_size','1536m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,177,'uis_server','gbrpmsuist00.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,178,'uis_port','8280','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,179,'uis_sys_credential_file','SysCredential.properties','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,180,'uis_user','uisUser','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,181,'uis_deployments','columbus-desktop-7.3.2.ear','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,182,'uis_asm_enabled_check_list','availabilityChecker,deployChecker','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,183,'proxy_name','gbrpmsuist00.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,184,'proxy_port','8849','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,185,'batchclient_enable','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,186,'batch_client_ws_user','john','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,187,'batch_client_ws_password','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,188,'batch_client_ws_sec_enabled','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,189,'batch_client_ws_enc_enabled','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,190,'batch_user','batchJobUser1','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,191,'batch_sys_credential_file','SysCredential_generatedByEAS.properties','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,192,'batch_max_retry_attempts','10','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,193,'exit_code_batch_enable','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,194,'batchclient_ek4dk','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,195,'syscred_password','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,196,'syscred_passwordIssueDate','1471539187637','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,197,'createUpdatePrescription_INSERT_THREADS','30','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,198,'createUpdatePrescription_VALIDATION_THREADS','30','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,199,'tsfn_server','gbrpmstali21.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,200,'tsfz_environment_id','28','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,201,'tsfz_NASHxCf','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,202,'tsfz_inbound_columbus_zipfile_name','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,203,'tsfz_inbound_columbus_zip_time','7','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,204,'tsfz_inbound_columbus_retain_time','30','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,205,'tsfz_inbound_columbus_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,206,'tsfz_inbound_columbus_csv_zipfile_name','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,207,'tsfz_inbound_columbus_csv_zip_time','7','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,208,'tsfz_inbound_columbus_csv_retain_time','30','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,209,'tsfz_inbound_columbus_csv_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,210,'tsfz_outbound_columbus_zipfile_name','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,211,'tsfz_outbound_columbus_zip_time','7','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,212,'tsfz_outbound_columbus_retain_time','30','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,213,'tsfz_outbound_columbus_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,214,'tsfz_internal_columbus_readmeFiles_zipfile_name','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,215,'tsfz_internal_columbus_readmeFiles_zip_time','7','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,216,'tsfz_internal_columbus_readmeFiles_retain_time','30','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,217,'tsfz_internal_columbus_readmeFiles_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,218,'tsfz_rootZipFiles_zipfile_name','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,219,'tsfz_rootZipFiles_zip_time','7','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,220,'tsfz_rootZipFiles_retain_time','30','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,221,'tsfz_rootZipFiles_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,222,'tsfz_insideCSVFiles_zipfile_name','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,223,'tsfz_insideCSVFiles_zip_time','7','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,224,'tsfz_insideCSVFiles_retain_time','30','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,225,'tsfz_insideCSVFiles_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,226,'tsfz_insideZipFiles_zipfile_name','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,227,'tsfz_insideZipFiles_zip_time','7','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,228,'tsfz_insideZipFiles_retain_time','30','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,229,'tsfz_insideZipFiles_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,230,'tsfz_archives_columbus_zipfile_name','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,231,'tsfz_archives_columbus_zip_time','7','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,232,'tsfz_archives_columbus_retain_time','30','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,233,'tsfz_archives_columbus_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,234,'tsfz_history_inbound_columbus_zipfile_name','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,235,'tsfz_history_inbound_columbus_zip_time','7','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,236,'tsfz_history_inbound_columbus_retain_time','30','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,237,'tsfz_history_inbound_columbus_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,238,'tsfz_history_outbound_columbus_zipfile_name','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,239,'tsfz_history_outbound_columbus_zip_time','7','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,240,'tsfz_history_outbound_columbus_retain_time','30','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,241,'tsfz_history_outbound_columbus_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,242,'tsfz_history_inbound_columbus_readmeFiles_zipfile_name','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,243,'tsfz_history_inbound_columbus_readmeFiles_zip_time','7','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,244,'tsfz_history_inbound_columbus_readmeFiles_retain_time','30','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,245,'tsfz_history_inbound_columbus_readmeFiles_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,246,'tsfz_history_outbound_columbus_readmeFiles_zipfile_name','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,247,'tsfz_history_outbound_columbus_readmeFiles_zip_time','7','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,248,'tsfz_history_outbound_columbus_readmeFiles_retain_time','30','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,249,'tsfz_history_outbound_columbus_readmeFiles_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,250,'pce_environment_id','60','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,251,'pce_if108_domain_code','coretest','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,252,'pce_NASHxCf','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,253,'pce_rsa_exp','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,254,'pce_rsa_mod','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,255,'pce_outbound_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,256,'pce_outbound_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,257,'pce_outbound_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,258,'pce_qAutomatInput_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,259,'pce_qAutomatInput_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,260,'pce_qAutomatInput_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,261,'pce_qAutomatInput_bad_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,262,'pce_qAutomatInput_bad_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,263,'pce_qAutomatInput_bad_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,264,'pce_qAutomatOutput_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,265,'pce_qAutomatOutput_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,266,'pce_qAutomatOutput_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,267,'pce_qAutomatOutput_bad_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,268,'pce_qAutomatOutput_bad_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,269,'pce_qAutomatOutput_bad_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,270,'pce_qCombined_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,271,'pce_qCombined_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,272,'pce_qCombined_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,273,'pce_qCombined_bad_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,274,'pce_qCombined_bad_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,275,'pce_qCombined_bad_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,276,'pce_qIF130_FinanceFeed_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,277,'pce_qIF130_FinanceFeed_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,278,'pce_qIF130_FinanceFeed_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,279,'pce_qIF130_FinanceFeed_bad_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,280,'pce_qIF130_FinanceFeed_bad_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,281,'pce_qIF130_FinanceFeed_bad_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,282,'pce_qIF134_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,283,'pce_qIF134_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,284,'pce_qIF134_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,285,'pce_qIF137_Audit_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,286,'pce_qIF137_Audit_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,287,'pce_qIF137_Audit_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,288,'pce_qIF137_Audit_bad_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,289,'pce_qIF137_Audit_bad_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,290,'pce_qIF137_Audit_bad_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,291,'pce_qIF138_IMS_DTP_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,292,'pce_qIF138_IMS_DTP_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,293,'pce_qIF138_IMS_DTP_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,294,'pce_qIF138_IMS_DTP_bad_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,295,'pce_qIF138_IMS_DTP_bad_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,296,'pce_qIF138_IMS_DTP_bad_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,297,'pce_qIF138_Mftr_Audit_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,298,'pce_qIF138_Mftr_Audit_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,299,'pce_qIF138_Mftr_Audit_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,300,'pce_qIF138_Mftr_Audit_bad_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,301,'pce_qIF138_Mftr_Audit_bad_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,302,'pce_qIF138_Mftr_Audit_bad_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,303,'pce_qIF59_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,304,'pce_qIF59_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,305,'pce_qIF59_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,306,'pce_qIF59_bad_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,307,'pce_qIF59_bad_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,308,'pce_qIF59_bad_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,309,'pce_qIF90_DeliveryRequest_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,310,'pce_qIF90_DeliveryRequest_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,311,'pce_qIF90_DeliveryRequest_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,312,'pce_qIF90_DeliveryRequest_bad_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,313,'pce_qIF90_DeliveryRequest_bad_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,314,'pce_qIF90_DeliveryRequest_bad_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,315,'pce_qLabelData_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,316,'pce_qLabelData_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,317,'pce_qLabelData_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,318,'pce_qLabels_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,319,'pce_qLabels_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,320,'pce_qLabels_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,321,'pce_qTote_Centric_Data_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,322,'pce_qTote_Centric_Data_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,323,'pce_qTote_Centric_Data_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,324,'pce_tmp_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,325,'pce_tmp_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,326,'pce_tmp_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,327,'pce_history_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,328,'pce_history_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,329,'pce_history_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,330,'pce_history_qAutomatInput_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,331,'pce_history_qAutomatInput_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,332,'pce_history_qAutomatInput_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,333,'pce_history_qAutomatOutput_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,334,'pce_history_qAutomatOutput_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,335,'pce_history_qAutomatOutput_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,336,'pce_history_qCombined_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,337,'pce_history_qCombined_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,338,'pce_history_qCombined_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,339,'pce_history_qIF130_FinanceFeed_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,340,'pce_history_qIF130_FinanceFeed_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,341,'pce_history_qIF130_FinanceFeed_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,342,'pce_history_qIF134_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,343,'pce_history_qIF134_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,344,'pce_history_qIF134_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,345,'pce_history_qIF137_Audit_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,346,'pce_history_qIF137_Audit_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,347,'pce_history_qIF137_Audit_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,348,'pce_history_qIF138_IMS_DTP_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,349,'pce_history_qIF138_IMS_DTP_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,350,'pce_history_qIF138_IMS_DTP_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,351,'pce_history_qIF138_Mftr_Audit_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,352,'pce_history_qIF138_Mftr_Audit_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,353,'pce_history_qIF138_Mftr_Audit_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,354,'pce_history_qIF90_DeliveryRequest_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,355,'pce_history_qIF90_DeliveryRequest_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,356,'pce_history_qIF90_DeliveryRequest_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,357,'pce_history_qLabelData_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,358,'pce_history_qLabelData_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,359,'pce_history_qLabelData_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,360,'pce_history_qTote_Centric_Data_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,361,'pce_history_qTote_Centric_Data_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,362,'pce_history_qTote_Centric_Data_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,363,'pce_history_outbound_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,364,'pce_history_outbound_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,365,'pce_history_outbound_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,366,'pce_logs_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,367,'pce_logs_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,368,'pce_logs_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,369,'pce_automat_server','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,370,'pce_automat_settrace','all','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,371,'pce_db_audit_name','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,372,'pce_db_audit_server','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,373,'pce_db_audit_port','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,374,'pce_db_audit_user','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,375,'pce_db_audit_pass','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,376,'pce_db_audit_schema','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,377,'pce_db_if138_mftr_audit_name','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,378,'pce_db_if138_mftr_audit_server','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,379,'pce_db_if138_mftr_audit_port','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,380,'pce_db_if138_mftr_audit_user','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,381,'pce_db_if138_mftr_audit_pass','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,382,'pce_db_if138_mftr_audit_schema','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,383,'pce_db_masterdata_name','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,384,'pce_db_masterdata_server','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,385,'pce_db_masterdata_port','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,386,'pce_db_masterdata_user','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,387,'pce_db_masterdata_pass','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,388,'pce_db_masterdata_schema_obd','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,389,'pce_db_masterdata_schema_pubsta','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,390,'pce_ftp_host','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,391,'pce_ftp_port','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,392,'pce_ftp_user','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,393,'pce_ftp_pass','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,394,'pce_queue_manager','*UNIALPD','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,395,'pce_queue_manager_if90_leo','*NAPUKTA','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,396,'optimus_db_server','gb2pmsdbst3.resources.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,397,'optimus_db_port','1521','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,398,'optimus_db_name','PMST1','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,399,'optimus_db_user','OPTMIG{ENVID}','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,400,'optimus_db_pass','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,401,'stockplus_db_server','gb2pmsdbst3.resources.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,402,'stockplus_db_port','1521','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,403,'stockplus_db_name','PMST1','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,404,'stockplus_db_user','STKMIG{ENVID}','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,405,'stockplus_db_pass','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,406,'fullmig_db_server','gb2pmsdbst3.resources.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,407,'fullmig_db_port','1521','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,408,'fullmig_db_name','PMST1','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,409,'fullmig_db_user','FULLMIG{ENVID}','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,410,'fullmig_db_pass','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,411,'masterdata_db_server','gb2pmsdbst11.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,412,'masterdata_db_name','MasterData','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,413,'masterdata_db_port','51649','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,414,'masterdata_db_user','talendT','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,415,'masterdata_db_pass','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,416,'boots_masterdata_db_schema','PublishedStaging','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,417,'boots_masterdata_db_instance','MASTERDATADB{ENVID}','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,418,'boots_interface_loglevel','INFO','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,419,'if056_rsa_pub_modulus','xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,420,'if056_rsa_pub_exp','xxxx','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,421,'ftp_nxp_host','ftp.cegedimrx.co.uk','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,422,'ftp_nxp_user','bootscolumbus','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,423,'ftp_nxp_pass','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,424,'ftp_nhs_host','ftp.isd.hscic.gov.uk','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,425,'ftp_nhs_user','TRUD3-11585@trud.nhs.uk','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,426,'ftp_nhs_pass','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,427,'one_leo_db_host','10.179.20.187','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,428,'one_leo_db_port','60000','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,429,'one_leo_db_name','unichemd','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,430,'one_leo_db_user','enquire','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,431,'one_leo_db_pass','removed','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,432,'ah_talend_server','unknown','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,433,'ah_talend_user','tagbXadm','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,434,'columbus_release','2070000','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,435,'columbus_masterdata_4_status','1','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(2,436,'sec_file_release','20150121','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,793,'ccode','gbr','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,794,'env','test','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,795,'sub_env','{ENVID}','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,796,'distrib','EnterpriseLinux','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,797,'log_level','INFO','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,798,'deployment_timeout','900','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,799,'ora_wallet','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,800,'ora_wallet_password','XXXXXXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,801,'db_name','PMST1','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'EAS_DB\':{ParamName}',NULL,'\0',0,'\0'),(15,802,'db_port','1521','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'EAS_DB\':{ParamName}',NULL,'\0',0,'\0'),(15,803,'db_server','gb2pmsdbst3.resources.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'EAS_DB\':{ParamName}',NULL,'\0',0,'\0'),(15,804,'db_user','PMSFT5','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'EAS_DB\':{ParamName}',NULL,'\0',0,'\0'),(15,805,'db_pass','XXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'EAS_DB\':{ParamName}',NULL,'\0',0,'\0'),(15,806,'db_name','PMST1','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'EAS_DB_STG\':{ParamName}',NULL,'\0',0,'\0'),(15,807,'db_port','1521','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'EAS_DB_STG\':{ParamName}',NULL,'\0',0,'\0'),(15,808,'db_server','gb2pmsdbst3.resources.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'EAS_DB_STG\':{ParamName}',NULL,'\0',0,'\0'),(15,809,'db_user','PMSFT5_STG','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'EAS_DB_STG\':{ParamName}',NULL,'\0',0,'\0'),(15,810,'db_pass','XXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'EAS_DB_STG\':{ParamName}',NULL,'\0',0,'\0'),(15,811,'db_name','PMST1','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'SYMDS_DB\':{ParamName}',NULL,'\0',0,'\0'),(15,812,'db_port','1521','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'SYMDS_DB\':{ParamName}',NULL,'\0',0,'\0'),(15,813,'db_server','gb2pmsdbst3.resources.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'SYMDS_DB\':{ParamName}',NULL,'\0',0,'\0'),(15,814,'db_user','PMSFT5','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'SYMDS_DB\':{ParamName}',NULL,'\0',0,'\0'),(15,815,'db_pass','XXXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'SYMDS_DB\':{ParamName}',NULL,'\0',0,'\0'),(15,816,'db_name','PMST1','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'OPTIMUS\':{ParamName}',NULL,'\0',0,'\0'),(15,817,'db_port','1521','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'OPTIMUS\':{ParamName}',NULL,'\0',0,'\0'),(15,818,'db_server','gb2pmsdbst3.resources.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'OPTIMUS\':{ParamName}',NULL,'\0',0,'\0'),(15,819,'db_user','OPTMIGFT5','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'OPTIMUS\':{ParamName}',NULL,'\0',0,'\0'),(15,820,'db_pass','XXXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:ora_wallet_aliases:\'OPTIMUS\':{ParamName}',NULL,'\0',0,'\0'),(15,821,'application_user','pmsgbrtt','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,822,'application_group','pmsgbrtt','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,823,'maintenance_user','pmsgbmtt','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,824,'tsfn','XXXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:mgmtusers:{ParamName}',NULL,'\0',0,'\0'),(15,825,'gss','XXXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:mgmtusers:{ParamName}',NULL,'\0',0,'\0'),(15,826,'FT5Operations','XXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:appusers:{ParamName}',NULL,'\0',0,'\0'),(15,827,'FT5Monitoring','XXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:appusers:{ParamName}',NULL,'\0',0,'\0'),(15,828,'FT5Admin','XXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:appusers:{ParamName}',NULL,'\0',0,'\0'),(15,829,'FT5Operations','jminix,OPERATIONS','ROOT:oneleonardo_envs:columbus-{ENVID}:approles:{ParamName}',NULL,'\0',0,'\0'),(15,830,'FT5Admin','jminix,ADMIN','ROOT:oneleonardo_envs:columbus-{ENVID}:approles:{ParamName}',NULL,'\0',0,'\0'),(15,831,'FT5Monitoring','jminix,MONITORING','ROOT:oneleonardo_envs:columbus-{ENVID}:approles:{ParamName}',NULL,'\0',0,'\0'),(15,832,'product_name','columbus','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,833,'implementation_name','uk-boots','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,834,'application_desc','Columbus uk-boots implementation','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,835,'deploy_version','7.4.2','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}','TSF-N application release number','\0',0,'\0'),(15,836,'release','1','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}','Production Services package building release','\0',0,'\0'),(15,837,'volumegroup','rootvg','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}','VG to create application filesystems','\0',0,'\0'),(15,838,'data_size','1G','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}','Filesystem size for /{env}b/${appdir}','\0',0,'\0'),(15,839,'file_size','7G','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}','Filesystem size for /{env}f/${appdir}','\0',0,'\0'),(15,840,'soft_size','1G','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}','Filesystem size for /{env}s/${appdir}','\0',0,'\0'),(15,841,'jboss_enable_monitoring','false','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,842,'jboss_management_native_port','9999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,843,'jboss_host','localhost','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,844,'gclog_num_files','10','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,845,'gclog_file_size','100m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,846,'columbus_env_id','Z','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,847,'asm_enable','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,848,'asm_enable_list','uis,eas,brg','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,849,'deployments','columbus-chs-7.4.1.ear','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,850,'datasources','java:jboss/datasources/columbus-ds-eas','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,851,'symds_enable','false','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,852,'training_enable','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,853,'symds_server','gbrpmseasf41.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,854,'symds_port','8180','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,855,'sym_sec_path','${jboss.server.config.dir}/syncronization/EK4DK','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,856,'sym_sec_file_release','20150115','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,857,'symds_db_server','gb2pmsdbst3.resources.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,858,'symds_db_port','1521','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,859,'symds_db_name','PMST1','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,860,'symds_db_user','PMSFT5','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,861,'symds_db_pass','XXXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,862,'sym_cluster_enabled','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,863,'sym_cluster_lock_timeout','300000','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,864,'osucontainer_concurrency','1-1','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,865,'asncontainer_concurrency','1-1','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,866,'wmq_enable','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,867,'jmxquery_enable','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,868,'modularization','false','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,869,'centralized_logging_enabled','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,870,'BIQuery','${HOME}','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,871,'jboss_management_http_port','9990','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,872,'asm_jboss_management_user','admin','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,873,'asm_jboss_management_user_psw','XXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,874,'durcheck_licence','ep6rMijR9lolznvLHZgpxAkUEk1lEGcOeqf30cGue9Z6VQfxzGJaLVNLDgpN56bm','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,875,'clinicalcheck_licence','ep6rMijR9lolznvLHZgpxAkUEk1lEGcOeqf30cGue9Z6VQfxzGJaLVNLDgpN56bm','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,876,'endorsement_licence','ep6rMijR9lolznvLHZgpxAkUEk1lEGcOeqf30cGue9Z6VQfxzGJaLVNLDgpN56bm','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,877,'clinicalcheck_getdur_url','http://gbrpmsdbst14.corp.internal:80/HDS/ClinicalInformation.svc/GetDUR','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,878,'clinicalcheck_getdrug_url','http://gbrpmsdbst14.corp.internal:80/HDS/ClinicalInformation.svc/GetDrugInformation','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,879,'reimbursement_getendorsement_url','http://gbrpmsdbst14.corp.internal:80/HDS/Reimbursement.svc/GetEndorsement','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,880,'emar_notifyPatientCommunity_url','http://10.245.12.244:8090/FacilityMessageService.svc','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,881,'emar_notifyPatient_url','http://10.245.12.244:8090/PatientMessageService.svc','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,882,'marchart_notifyMarChart_url','http://10.245.12.244:8090/DrugMessageService.svc','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,883,'pms_url','http://10.245.12.244:8090','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,884,'stockplus_url','http://10.245.12.244:8090','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,885,'centfill_url','http://10.245.12.244:8090','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,886,'housekeeping_enabled','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,887,'enable_new_transmit_due_date_orders_implementation','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,888,'preview_due_now_orders_page_limit','120','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,889,'brg_server','gbrpmsbrgt00.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,890,'vip_brg_port','8892','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}','Only used from batch-client','\0',0,'\0'),(15,891,'brg_port','8380','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,892,'brg_init_heap_mem','5120m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,893,'brg_max_heap_mem','6144m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,894,'brg_max_perm_size','512m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,895,'brg_new_size','1536m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,896,'brg_max_new_size','1536m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,897,'brg_spring_profile','outbound_api_channel,outbound_api_adapter,inbound_api_channel,inbound_api_adapter,import_batch,export_batch,internal_job_batch,external_job_batch,sym_chs','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,898,'brg_deployments','columbus-chs-7.4.1.ear','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,899,'brg_datasources','java:jboss/datasources/columbus-ds-eas','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,900,'brg_asm_enabled_check_list','availabilityChecker,deployChecker,datasourceChecker','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,901,'sync_url','https://gbrpmsbrgt00.corp.internal:8892/symmetricds/sync/chs-master','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,902,'resadapter_arc','wmq.jmsra.rar','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,903,'dispensed_db_name','EAS_DB','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}','Used for daily_dispensed and all_dispensed scripts','\0',0,'\0'),(15,904,'env_roles_internal_jobs_enable','eas','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,905,'brg_system_name','batchUserBRG','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,906,'ig32_ek4dk','xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,907,'boots_patient_key_hash','xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,908,'IG32_secret_key','xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,909,'inbound_dir','createUpdateStockTake','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,910,'inbound_dir','createUpdateUnitOfMeasureList','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,911,'inbound_dir','createUpdateFormulation','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,912,'inbound_dir','createUpdatePatient','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,913,'inbound_dir','createUpdatePatientCommunity','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,914,'inbound_dir','createUpdateLevyFeeList','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,915,'outbound_dir','createUpdateStockTake','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,916,'outbound_dir','createUpdateUnitOfMeasureList','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,917,'outbound_dir','createUpdateFormulation','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,918,'outbound_dir','createUpdatePatient','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,919,'outbound_dir','createUpdatePatientCommunity','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,920,'outbound_dir','createUpdateLevyFeeList','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,921,'history_dir','createUpdateStockTake','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,922,'history_dir','createUpdateUnitOfMeasureList','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,923,'history_dir','createUpdateFormulation','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,924,'history_dir','createUpdatePatient','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,925,'history_dir','createUpdatePatientCommunity','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,926,'history_dir','createUpdateLevyFeeList','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,927,'columbus_db_version','7.4.2','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,928,'eas_spring_profile','\"disableJob,training,outbound_api_channel,outbound_api_adapter,inbound_api_channel,inbound_api_adapter,import_batch,external_job_batch\"','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,929,'eas_deployments','columbus-chs-7.4.1.ear','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,930,'eas_datasources','java:jboss/datasources/columbus-ds-eas','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,931,'eas_asm_enabled_check_list','availabilityChecker,deployChecker,datasourceChecker','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,932,'eas_db_server','gb2pmsdbst3.resources.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,933,'eas_db_port','1521','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,934,'eas_db_name','PMST1','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,935,'eas_db_user','PMSFT5','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,936,'eas_db_pass','XXXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,937,'eas_db_staging_server','gb2pmsdbst3.resources.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,938,'eas_db_staging_port','1521','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,939,'eas_db_staging_name','PMST1','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,940,'eas_db_staging_user','PMSFT5_STG','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,941,'eas_db_staging_pass','XXXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,942,'eas_system_name','batchUserEAS','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,943,'eas_port','8180','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,944,'vip_eas_server','gbrpmseast00.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,945,'vip_eas_port','8895','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,946,'eas_init_heap_mem','5120m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,947,'eas_max_heap_mem','5120m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,948,'eas_max_perm_size','512m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,949,'eas_new_size','1536m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,950,'eas_max_new_size','1536m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,951,'CPAS_modulus','XXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,952,'CPAS_exponent','AQAB','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,953,'ig29_secret_keys','XXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,954,'ig29_secret_keys','XXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,955,'ig29_secret_keys','IG29=XXX','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,956,'ig29_secret_keys','XXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,957,'ig29_secret_keys','XXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,958,'boots_stockplus_key_hash','XXX','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,959,'ig24_secret_key','XXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,960,'ek4dk','XXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,961,'leo_queuemgr_name','*UNIALPZ','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,962,'tote_order_line_ref_min_value','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,963,'tote_order_line_ref_max_value','999999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,964,'tote_ref_min_value','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,965,'tote_ref_max_value','9999999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,966,'use_tote_prefix','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,967,'tote_prefix','TOTE','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,968,'uis_user','uisUser','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,969,'uis_spring_profile','training','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,970,'uis_init_heap_mem','5120m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,971,'uis_max_heap_mem','5120m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,972,'uis_max_perm_size','512m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,973,'uis_new_size','1536m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,974,'uis_max_new_size','1536m','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,975,'uis_server','gbrpmsuist00.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,976,'uis_port','8280','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,977,'uis_sys_credential_file','SysCredential.properties','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,978,'uis_deployments','columbus-desktop-7.4.1.war','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,979,'uis_asm_enabled_check_list','availabilityChecker,deployChecker','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,980,'proxy_name','gbrpmsuist00.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,981,'proxy_port','8895','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,982,'uis_system_name','uisUser','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,983,'batchclient_enable','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,984,'batch_client_ws_user','john','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,985,'batch_client_ws_password','XXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,986,'batch_client_ws_sec_enabled','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,987,'batch_client_ws_enc_enabled','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,988,'batch_user','batchJobUser1','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,989,'batch_sys_credential_file','SysCredential_generatedByEAS.properties','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,990,'batch_max_retry_attempts','10','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,991,'exit_code_batch_enable','true','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,992,'createUpdatePrescription_INSERT_THREADS','30','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,993,'createUpdatePrescription_VALIDATION_THREADS','30','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,994,'tsfn_server','gbrpmstali21.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,995,'tsfz_environment_id','66','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,996,'tsfz_NASHxCf','XXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,997,'tsfz_inbound_columbus_zipfile_name','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,998,'tsfz_inbound_columbus_zip_time','7','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,999,'tsfz_inbound_columbus_retain_time','30','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1000,'tsfz_inbound_columbus_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1001,'tsfz_inbound_columbus_csv_zipfile_name','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1002,'tsfz_inbound_columbus_csv_zip_time','7','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1003,'tsfz_inbound_columbus_csv_retain_time','30','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1004,'tsfz_inbound_columbus_csv_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1005,'tsfz_outbound_columbus_zipfile_name','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1006,'tsfz_outbound_columbus_zip_time','7','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1007,'tsfz_outbound_columbus_retain_time','30','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1008,'tsfz_outbound_columbus_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1009,'tsfz_internal_columbus_readmeFiles_zipfile_name','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1010,'tsfz_internal_columbus_readmeFiles_zip_time','7','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1011,'tsfz_internal_columbus_readmeFiles_retain_time','30','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1012,'tsfz_internal_columbus_readmeFiles_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1013,'tsfz_rootZipFiles_zipfile_name','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1014,'tsfz_rootZipFiles_zip_time','7','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1015,'tsfz_rootZipFiles_retain_time','30','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1016,'tsfz_rootZipFiles_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1017,'tsfz_insideCSVFiles_zipfile_name','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1018,'tsfz_insideCSVFiles_zip_time','7','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1019,'tsfz_insideCSVFiles_retain_time','30','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1020,'tsfz_insideCSVFiles_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1021,'tsfz_insideZipFiles_zipfile_name','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1022,'tsfz_insideZipFiles_zip_time','7','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1023,'tsfz_insideZipFiles_retain_time','30','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1024,'tsfz_insideZipFiles_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1025,'tsfz_archives_columbus_zipfile_name','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1026,'tsfz_archives_columbus_zip_time','7','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1027,'tsfz_archives_columbus_retain_time','30','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1028,'tsfz_archives_columbus_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1029,'tsfz_history_inbound_columbus_zipfile_name','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1030,'tsfz_history_inbound_columbus_zip_time','7','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1031,'tsfz_history_inbound_columbus_retain_time','30','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1032,'tsfz_history_inbound_columbus_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1033,'tsfz_history_outbound_columbus_zipfile_name','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1034,'tsfz_history_outbound_columbus_zip_time','7','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1035,'tsfz_history_outbound_columbus_retain_time','30','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1036,'tsfz_history_outbound_columbus_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1037,'tsfz_history_inbound_columbus_readmeFiles_zipfile_name','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1038,'tsfz_history_inbound_columbus_readmeFiles_zip_time','7','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1039,'tsfz_history_inbound_columbus_readmeFiles_retain_time','30','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1040,'tsfz_history_inbound_columbus_readmeFiles_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1041,'tsfz_history_outbound_columbus_readmeFiles_zipfile_name','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1042,'tsfz_history_outbound_columbus_readmeFiles_zip_time','7','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1043,'tsfz_history_outbound_columbus_readmeFiles_retain_time','30','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1044,'tsfz_history_outbound_columbus_readmeFiles_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1045,'pce_environment_id','70','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1046,'pce_if108_domain_code','coretest','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1047,'pce_NASHxCf','XXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1048,'pce_rsa_exp','XXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1049,'pce_rsa_mod','XXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1050,'pce_outbound_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1051,'pce_outbound_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1052,'pce_outbound_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1053,'pce_qAutomatInput_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1054,'pce_qAutomatInput_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1055,'pce_qAutomatInput_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1056,'pce_qAutomatInput_bad_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1057,'pce_qAutomatInput_bad_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1058,'pce_qAutomatInput_bad_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1059,'pce_qAutomatOutput_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1060,'pce_qAutomatOutput_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1061,'pce_qAutomatOutput_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1062,'pce_qAutomatOutput_bad_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1063,'pce_qAutomatOutput_bad_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1064,'pce_qAutomatOutput_bad_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1065,'pce_qCombined_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1066,'pce_qCombined_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1067,'pce_qCombined_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1068,'pce_qCombined_bad_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1069,'pce_qCombined_bad_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1070,'pce_qCombined_bad_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1071,'pce_qIF130_FinanceFeed_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1072,'pce_qIF130_FinanceFeed_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1073,'pce_qIF130_FinanceFeed_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1074,'pce_qIF130_FinanceFeed_bad_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1075,'pce_qIF130_FinanceFeed_bad_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1076,'pce_qIF130_FinanceFeed_bad_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1077,'pce_qIF134_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1078,'pce_qIF134_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1079,'pce_qIF134_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1080,'pce_qIF137_Audit_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1081,'pce_qIF137_Audit_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1082,'pce_qIF137_Audit_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1083,'pce_qIF137_Audit_bad_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1084,'pce_qIF137_Audit_bad_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1085,'pce_qIF137_Audit_bad_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1086,'pce_qIF138_IMS_DTP_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1087,'pce_qIF138_IMS_DTP_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1088,'pce_qIF138_IMS_DTP_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1089,'pce_qIF138_IMS_DTP_bad_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1090,'pce_qIF138_IMS_DTP_bad_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1091,'pce_qIF138_IMS_DTP_bad_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1092,'pce_qIF138_Mftr_Audit_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1093,'pce_qIF138_Mftr_Audit_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1094,'pce_qIF138_Mftr_Audit_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1095,'pce_qIF138_Mftr_Audit_bad_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1096,'pce_qIF138_Mftr_Audit_bad_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1097,'pce_qIF138_Mftr_Audit_bad_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1098,'pce_qIF59_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1099,'pce_qIF59_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1100,'pce_qIF59_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1101,'pce_qIF59_bad_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1102,'pce_qIF59_bad_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1103,'pce_qIF59_bad_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1104,'pce_qIF90_DeliveryRequest_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1105,'pce_qIF90_DeliveryRequest_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1106,'pce_qIF90_DeliveryRequest_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1107,'pce_qIF90_DeliveryRequest_bad_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1108,'pce_qIF90_DeliveryRequest_bad_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1109,'pce_qIF90_DeliveryRequest_bad_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1110,'pce_qLabelData_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1111,'pce_qLabelData_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1112,'pce_qLabelData_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1113,'pce_qLabels_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1114,'pce_qLabels_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1115,'pce_qLabels_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1116,'pce_qTote_Centric_Data_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1117,'pce_qTote_Centric_Data_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1118,'pce_qTote_Centric_Data_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1119,'pce_tmp_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1120,'pce_tmp_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1121,'pce_tmp_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1122,'pce_history_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1123,'pce_history_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1124,'pce_history_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1125,'pce_history_qAutomatInput_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1126,'pce_history_qAutomatInput_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1127,'pce_history_qAutomatInput_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1128,'pce_history_qAutomatOutput_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1129,'pce_history_qAutomatOutput_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1130,'pce_history_qAutomatOutput_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1131,'pce_history_qCombined_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1132,'pce_history_qCombined_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1133,'pce_history_qCombined_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1134,'pce_history_qIF130_FinanceFeed_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1135,'pce_history_qIF130_FinanceFeed_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1136,'pce_history_qIF130_FinanceFeed_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1137,'pce_history_qIF134_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1138,'pce_history_qIF134_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1139,'pce_history_qIF134_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1140,'pce_history_qIF137_Audit_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1141,'pce_history_qIF137_Audit_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1142,'pce_history_qIF137_Audit_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1143,'pce_history_qIF138_IMS_DTP_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1144,'pce_history_qIF138_IMS_DTP_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1145,'pce_history_qIF138_IMS_DTP_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1146,'pce_history_qIF138_Mftr_Audit_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1147,'pce_history_qIF138_Mftr_Audit_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1148,'pce_history_qIF138_Mftr_Audit_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1149,'pce_history_qIF90_DeliveryRequest_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1150,'pce_history_qIF90_DeliveryRequest_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1151,'pce_history_qIF90_DeliveryRequest_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1152,'pce_history_qLabelData_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1153,'pce_history_qLabelData_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1154,'pce_history_qLabelData_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1155,'pce_history_qTote_Centric_Data_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1156,'pce_history_qTote_Centric_Data_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1157,'pce_history_qTote_Centric_Data_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1158,'pce_history_outbound_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1159,'pce_history_outbound_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1160,'pce_history_outbound_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1161,'pce_logs_zip_time','999999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1162,'pce_logs_retain_time','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1163,'pce_logs_retain_number','0','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1164,'pce_automat_server','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1165,'pce_automat_settrace','all','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1166,'pce_db_audit_name','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1167,'pce_db_audit_server','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1168,'pce_db_audit_port','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1169,'pce_db_audit_user','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1170,'pce_db_audit_pass','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1171,'pce_db_audit_schema','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1172,'pce_db_if138_mftr_audit_name','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1173,'pce_db_if138_mftr_audit_server','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1174,'pce_db_if138_mftr_audit_port','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1175,'pce_db_if138_mftr_audit_user','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1176,'pce_db_if138_mftr_audit_pass','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1177,'pce_db_if138_mftr_audit_schema','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1178,'pce_db_masterdata_name','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1179,'pce_db_masterdata_server','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1180,'pce_db_masterdata_port','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1181,'pce_db_masterdata_user','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1182,'pce_db_masterdata_pass','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1183,'pce_db_masterdata_schema_obd','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1184,'pce_db_masterdata_schema_pubsta','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1185,'pce_ftp_host','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1186,'pce_ftp_port','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1187,'pce_ftp_user','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1188,'pce_ftp_pass','','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1189,'pce_queue_manager','*UNIALPZ','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1190,'pce_queue_manager_if90_leo','*NAPUKTA','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1191,'optimus_db_server','gb2pmsdbst3.resources.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1192,'optimus_db_port','1521','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1193,'optimus_db_name','PMST1','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1194,'optimus_db_user','OPTMIGFT5','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1195,'optimus_db_pass','XXXXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1196,'stockplus_db_server','gb2pmsdbst3.resources.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1197,'stockplus_db_port','1521','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1198,'stockplus_db_name','PMST1','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1199,'stockplus_db_user','STKMIGFT5','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1200,'stockplus_db_pass','XXXXXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1201,'fullmig_db_server','gb2pmsdbst3.resources.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1202,'fullmig_db_port','1521','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1203,'fullmig_db_name','PMST1','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1204,'fullmig_db_user','FULLMIGFT5','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1205,'fullmig_db_pass','XXXXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1206,'masterdata_db_server','gb2pmsdbst11.corp.internal','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1207,'masterdata_db_name','MasterData','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1208,'masterdata_db_port','99999','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1209,'masterdata_db_user','talendT','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1210,'masterdata_db_pass','XXXXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1211,'stockplusfm_masterdata_db_user','talendp','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1212,'stockplusfm_masterdata_pp_source','vw_NX_MapVDrugToColumbus_LastPublished','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1213,'stockplusfm_masterdata_dpp_source','vw_NX_MapPDrugToColumbus_LastPublished','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1214,'stockplusfm_log_file_name_mask','log','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1215,'stockplusfm_logmode','LOG4J','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1216,'stockplusfm_masterdata_db_pass','XXXXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1217,'stockplusfm_sourcefolder','/tests/talend/jobs/scripts/stockplusfm/maps/','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1218,'stockplusfm_184_adr_map_spreadsheet','NexPhase-MASActiveIngredient','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1219,'stockplusfm_184_adr_map_workbook','Adverse Drug Reactions Maps.xlsx','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1220,'stockplusfm_184_ex_map_spreadsheet','NexPhase-MASExemption','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1221,'stockplusfm_184_ex_map_workbook','Exemption Maps.xlsx','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1222,'stockplusfm_184_mc_map_spreadsheet','NexPhase-MASCondition','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1223,'stockplusfm_184_mc_map_workbook','Medical Condition Maps.xlsx','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1224,'stockplusfm_184_nda_map_spreadsheet','NexPhase-MASNonDrugAllergy','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1225,'stockplusfm_184_nda_map_workbook','Non Drug Allergy Maps.xlsx','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1226,'stockplusfm_184_servicetype_map_spreadsheet','Prescription Service Type','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1227,'stockplusfm_184_servicetype_map_workbook','Patient and Service Type Maps.xlsx','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1228,'boots_masterdata_db_schema','PublishedStaging','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1229,'boots_masterdata_db_instance','MASTERDATADBFT5','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1230,'boots_interface_loglevel','INFO','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1231,'if056_rsa_pub_modulus','xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1232,'if056_rsa_pub_exp','xxxx','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1233,'ftp_nxp_host','ftp.cegedimrx.co.uk','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1234,'ftp_nxp_user','bootscolumbus','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1235,'ftp_nxp_pass','XXXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1236,'ftp_nhs_host','ftp.isd.hscic.gov.uk','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1237,'ftp_nhs_user','TRUD3-11585@trud.nhs.uk','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1238,'ftp_nhs_pass','XXXXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1239,'one_leo_db_host','10.179.20.187','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1240,'one_leo_db_port','60000','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1241,'one_leo_db_name','unichemd','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1242,'one_leo_db_user','enquire','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1243,'one_leo_db_pass','XXXX','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1244,'ah_talend_server','unknown','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1245,'ah_talend_user','tagbXadm','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1246,'columbus_release','2070000','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1247,'columbus_masterdata_4_status','1','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0'),(15,1248,'sec_file_release','20150121','ROOT:oneleonardo_envs:columbus-{ENVID}:{ParamName}',NULL,'\0',0,'\0');
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
  `SubEnvironmentTypeName` varchar(255) DEFAULT NULL,
  `Version` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`SubEnvironmentTypeID`),
  UNIQUE KEY `UQ_CM_SubEnvironmentType_SubEnvironmentTypeName` (`SubEnvironmentTypeName`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cm_subenvironmenttype`
--

LOCK TABLES `cm_subenvironmenttype` WRITE;
/*!40000 ALTER TABLE `cm_subenvironmenttype` DISABLE KEYS */;
INSERT INTO `cm_subenvironmenttype` VALUES (1,'MAIN',0),(2,'XLeg',0),(3,'YLeg',0),(4,'ZLeg',0);
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
  `VIPName` varchar(255) NOT NULL,
  `NodeID` bigint(20) DEFAULT NULL,
  `Version` bigint(20) NOT NULL DEFAULT '0',
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
INSERT INTO `cm_vip` VALUES (1,'gbrpmsuist00.corp.internal',134,0),(2,'gbrpmseast00.corp.internal',135,0),(3,'gbrpmsbrgt00.corp.internal',136,0),(4,'gbrpmsress00.corp.internal',179,0),(7,'gbrpmsuisr00.corp.internal',196,0),(8,'gbrpmsbrgr00.corp.internal',197,0),(9,'gbrpmseasr00-vin.corp.internal',198,0),(10,'gbrpmsresm00.corp.internal',227,0),(11,'gbrpmsresp00.corp.internal',272,0),(12,'gbrcbidbss00.corp.internal',273,0),(13,'gbrpmsdbss.corp.internal',274,0),(14,'gbrcbidbsp00.corp.internal',275,0),(15,'gbrpmsdbsp.corp.internal',276,0),(16,'gbrpmseass00-vin.corp.internal',277,0),(17,'gbrpmseass10-vin.corp.internal',278,0),(18,'gbrpmseass20-vin.corp.internal',279,0),(19,'gbrcbiapps00.corp.internal',280,0),(20,'gbrcbiappp00.corp.internal',281,0),(21,'gbrpmseasp00-vin.corp.internal',282,0),(22,'gbrpmseasp10-vin.corp.internal',283,0),(23,'gbrpmseasp20-vin.corp.internal',284,0),(24,'gbrpmseasm00-vin.corp.internal',285,0),(25,'gbrpmseasm10-vin.corp.internal',286,0),(26,'gbrpmseasm20-vin.corp.internal',287,0);
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
  `Version` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privilege`
--

LOCK TABLES `privilege` WRITE;
/*!40000 ALTER TABLE `privilege` DISABLE KEYS */;
INSERT INTO `privilege` VALUES (1,'READ_SENSITIVE',0),(2,'WRITE_SENSITIVE',0),(3,'READ_PRODUCTION',0),(4,'WRITE_PRODUCTION',0);
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
  `Version` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ROLE_ADMIN',0),(2,'ROLE_USER',0),(3,'TEST_ROLE_1',0),(4,'TEST_ROLE_2',0);
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
  `Version` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_role_idx` (`role_id`),
  KEY `fk_privilege_idx` (`privilege_id`),
  CONSTRAINT `fk_privilege` FOREIGN KEY (`privilege_id`) REFERENCES `privilege` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_privilege`
--

LOCK TABLES `role_privilege` WRITE;
/*!40000 ALTER TABLE `role_privilege` DISABLE KEYS */;
INSERT INTO `role_privilege` VALUES (1,1,1,0),(2,1,2,0),(3,2,1,0);
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
  `Version` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'richard.davis@boots.co.uk',1,'$2a$06$YqQHNQgPEvAxYgeNtFCiZem6VPcCvUA90nkxtZsOwNEnWlgKPqDUK','rich',0),(2,'duncan.eatch@boots.co.uk',1,'$2a$06$MBruHWlhdHs45qezRoF7qe.paM0eQDtxl6ueOc7KDrXqw9LMTmTu6','duncan',0),(3,'ancel.mitchell@boots.co.uk',1,'$2a$10$SQBU7zFhuyptk0Y/eUAtp.6IZtSkRpQOTtQqovKSr0axczjfxLA7i','ancel',0),(4,NULL,1,'$2a$10$3BVg/SpO9atBfyV/wSzRtu.VG/UuOLiO6tr/5s5y3N6x/OI2N8RXG','gary',0);
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
  `Version` bigint(20) NOT NULL DEFAULT '0',
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
INSERT INTO `user_role` VALUES (1,1,0),(1,2,0),(1,4,0),(3,2,0),(2,1,0),(2,2,0),(4,2,0);
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
    left join 	cm_environment e on e.environmentname is not null -- New line
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
/*!50003 DROP PROCEDURE IF EXISTS `SearchAllConfigExAddress` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchAllConfigExAddress`(SearchText varchar(50))
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
    where g.globalConfigValue like concat ( '%', SearchText, '%')
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
	where ec.subEnvConfigValue like concat ( '%', SearchText, '%')
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
	where sc.ServConfigValue like concat ( '%', SearchText, '%')
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
	where cc.CompConfigValue like concat ( '%', SearchText, '%')
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
	where rc.relconfigvalue like concat ( '%', SearchText, '%')
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

-- Dump completed on 2017-06-15 10:32:58

CREATE USER 'cmdb_app_user'@'localhost' IDENTIFIED BY 'auto_crud_user';
GRANT ALL PRIVILEGES ON *.* TO 'cmdb_app_user'@'localhost' WITH GRANT OPTION;
CREATE USER 'cmdb_app_user'@'%' IDENTIFIED BY 'auto_crud_user';
GRANT ALL PRIVILEGES ON *.* TO 'cmdb_app_user'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
COMMIT;