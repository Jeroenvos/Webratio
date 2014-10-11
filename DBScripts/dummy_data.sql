-- MySQL dump 10.13  Distrib 5.6.14, for osx10.7 (x86_64)
--
-- Host: localhost    Database: annotation
-- ------------------------------------------------------
-- Server version	5.6.14

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
-- Table structure for table `annotation`
--

DROP TABLE IF EXISTS `annotation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `annotation` (
  `oid` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `confidence` int(11) DEFAULT NULL,
  `item_oid` int(11) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `fk_annotation_item` (`item_oid`),
  CONSTRAINT `fk_annotation_item` FOREIGN KEY (`item_oid`) REFERENCES `item` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `annotation`
--

LOCK TABLES `annotation` WRITE;
/*!40000 ALTER TABLE `annotation` DISABLE KEYS */;
INSERT INTO `annotation` VALUES (1,'asdf',1,1),(2,'adasdf',2,1);
/*!40000 ALTER TABLE `annotation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `annotation_campaign`
--

DROP TABLE IF EXISTS `annotation_campaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `annotation_campaign` (
  `oid` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `budget` double DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `requester_oid` int(11) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `fk_annotation_campaign_request` (`requester_oid`),
  CONSTRAINT `fk_annotation_campaign_request` FOREIGN KEY (`requester_oid`) REFERENCES `requester` (`user_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `annotation_campaign`
--

LOCK TABLES `annotation_campaign` WRITE;
/*!40000 ALTER TABLE `annotation_campaign` DISABLE KEYS */;
INSERT INTO `annotation_campaign` VALUES (1,'test campaign',100,'\0',1),(2,'test',111,NULL,1);
/*!40000 ALTER TABLE `annotation_campaign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group` (
  `oid` int(11) NOT NULL,
  `groupname` varchar(255) DEFAULT NULL,
  `module_oid` int(11) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `fk_group_module` (`module_oid`),
  CONSTRAINT `fk_group_module` FOREIGN KEY (`module_oid`) REFERENCES `module` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
INSERT INTO `group` VALUES (1,'requester',1),(2,'worker',2);
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_module`
--

DROP TABLE IF EXISTS `group_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_module` (
  `group_oid` int(11) NOT NULL,
  `module_oid` int(11) NOT NULL,
  PRIMARY KEY (`group_oid`,`module_oid`),
  KEY `fk_group_module_group` (`group_oid`),
  KEY `fk_group_module_module` (`module_oid`),
  CONSTRAINT `fk_group_module_module` FOREIGN KEY (`module_oid`) REFERENCES `module` (`oid`),
  CONSTRAINT `fk_group_module_group` FOREIGN KEY (`group_oid`) REFERENCES `group` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_module`
--

LOCK TABLES `group_module` WRITE;
/*!40000 ALTER TABLE `group_module` DISABLE KEYS */;
INSERT INTO `group_module` VALUES (2,2);
/*!40000 ALTER TABLE `group_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `oid` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `imageurl` varchar(255) DEFAULT NULL,
  `requester_oid` int(11) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `fk_item_requester` (`requester_oid`),
  CONSTRAINT `fk_item_requester` FOREIGN KEY (`requester_oid`) REFERENCES `requester` (`user_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'Plaatje','asdsdf','http://placehold.it/100x100',1);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_task`
--

DROP TABLE IF EXISTS `item_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_task` (
  `item_oid` int(11) NOT NULL,
  `task_oid` int(11) NOT NULL,
  PRIMARY KEY (`item_oid`,`task_oid`),
  KEY `fk_item_task_item` (`item_oid`),
  KEY `fk_item_task_task` (`task_oid`),
  CONSTRAINT `fk_item_task_task` FOREIGN KEY (`task_oid`) REFERENCES `task` (`oid`),
  CONSTRAINT `fk_item_task_item` FOREIGN KEY (`item_oid`) REFERENCES `item` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_task`
--

LOCK TABLES `item_task` WRITE;
/*!40000 ALTER TABLE `item_task` DISABLE KEYS */;
INSERT INTO `item_task` VALUES (1,1);
/*!40000 ALTER TABLE `item_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module`
--

DROP TABLE IF EXISTS `module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `module` (
  `oid` int(11) NOT NULL,
  `moduleid` varchar(255) DEFAULT NULL,
  `modulename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module`
--

LOCK TABLES `module` WRITE;
/*!40000 ALTER TABLE `module` DISABLE KEYS */;
INSERT INTO `module` VALUES (1,'sv2','Requester Area'),(2,'sv3','Worker Area');
/*!40000 ALTER TABLE `module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requester`
--

DROP TABLE IF EXISTS `requester`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requester` (
  `user_oid` int(11) NOT NULL,
  `budget` double DEFAULT NULL,
  PRIMARY KEY (`user_oid`),
  KEY `fk_requester_user` (`user_oid`),
  CONSTRAINT `fk_requester_user` FOREIGN KEY (`user_oid`) REFERENCES `user` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requester`
--

LOCK TABLES `requester` WRITE;
/*!40000 ALTER TABLE `requester` DISABLE KEYS */;
INSERT INTO `requester` VALUES (1,500),(3,500);
/*!40000 ALTER TABLE `requester` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill`
--

DROP TABLE IF EXISTS `skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skill` (
  `oid` int(11) NOT NULL,
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill`
--

LOCK TABLES `skill` WRITE;
/*!40000 ALTER TABLE `skill` DISABLE KEYS */;
/*!40000 ALTER TABLE `skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill_task`
--

DROP TABLE IF EXISTS `skill_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skill_task` (
  `skill_oid` int(11) NOT NULL,
  `task_oid` int(11) NOT NULL,
  PRIMARY KEY (`skill_oid`,`task_oid`),
  KEY `fk_skill_task_skill` (`skill_oid`),
  KEY `fk_skill_task_task` (`task_oid`),
  CONSTRAINT `fk_skill_task_task` FOREIGN KEY (`task_oid`) REFERENCES `task` (`oid`),
  CONSTRAINT `fk_skill_task_skill` FOREIGN KEY (`skill_oid`) REFERENCES `skill` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill_task`
--

LOCK TABLES `skill_task` WRITE;
/*!40000 ALTER TABLE `skill_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `skill_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill_worker`
--

DROP TABLE IF EXISTS `skill_worker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skill_worker` (
  `skill_oid` int(11) NOT NULL,
  `worker_oid` int(11) NOT NULL,
  PRIMARY KEY (`skill_oid`,`worker_oid`),
  KEY `fk_skill_worker_skill` (`skill_oid`),
  KEY `fk_skill_worker_worker` (`worker_oid`),
  CONSTRAINT `fk_skill_worker_worker` FOREIGN KEY (`worker_oid`) REFERENCES `worker` (`user_oid`),
  CONSTRAINT `fk_skill_worker_skill` FOREIGN KEY (`skill_oid`) REFERENCES `skill` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill_worker`
--

LOCK TABLES `skill_worker` WRITE;
/*!40000 ALTER TABLE `skill_worker` DISABLE KEYS */;
/*!40000 ALTER TABLE `skill_worker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task` (
  `oid` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `reward` double DEFAULT NULL,
  `maxexecutiontime` time DEFAULT NULL,
  `expiration` datetime DEFAULT NULL,
  `annotation_campaign_oid` int(11) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `fk_task_annotation_campaign` (`annotation_campaign_oid`),
  CONSTRAINT `fk_task_annotation_campaign` FOREIGN KEY (`annotation_campaign_oid`) REFERENCES `annotation_campaign` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (1,'test','asdfasdf',10,'03:13:00','2014-10-15 00:00:00',2),(2,'sdsdasd','sadfasdf',10,'03:13:00','2014-10-15 00:00:00',2);
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_worker`
--

DROP TABLE IF EXISTS `task_worker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_worker` (
  `task_oid` int(11) NOT NULL,
  `worker_oid` int(11) NOT NULL,
  PRIMARY KEY (`task_oid`,`worker_oid`),
  KEY `fk_task_worker_task` (`task_oid`),
  KEY `fk_task_worker_worker` (`worker_oid`),
  CONSTRAINT `fk_task_worker_worker` FOREIGN KEY (`worker_oid`) REFERENCES `worker` (`user_oid`),
  CONSTRAINT `fk_task_worker_task` FOREIGN KEY (`task_oid`) REFERENCES `task` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_worker`
--

LOCK TABLES `task_worker` WRITE;
/*!40000 ALTER TABLE `task_worker` DISABLE KEYS */;
INSERT INTO `task_worker` VALUES (1,2);
/*!40000 ALTER TABLE `task_worker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taskexecution`
--

DROP TABLE IF EXISTS `taskexecution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taskexecution` (
  `oid` int(11) NOT NULL,
  `duration` time DEFAULT NULL,
  `executiontime` datetime DEFAULT NULL,
  `accuracy` double DEFAULT NULL,
  `worker_oid` int(11) DEFAULT NULL,
  `task_oid` int(11) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `fk_taskexecution_worker` (`worker_oid`),
  KEY `fk_taskexecution_task` (`task_oid`),
  CONSTRAINT `fk_taskexecution_task` FOREIGN KEY (`task_oid`) REFERENCES `task` (`oid`),
  CONSTRAINT `fk_taskexecution_worker` FOREIGN KEY (`worker_oid`) REFERENCES `worker` (`user_oid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taskexecution`
--

LOCK TABLES `taskexecution` WRITE;
/*!40000 ALTER TABLE `taskexecution` DISABLE KEYS */;
/*!40000 ALTER TABLE `taskexecution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `oid` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `registrationdate` date DEFAULT NULL,
  `group_oid` int(11) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `fk_user_group` (`group_oid`),
  CONSTRAINT `fk_user_group` FOREIGN KEY (`group_oid`) REFERENCES `group` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'test','123','asdf@nl.nl','Test','2014-10-14','2014-10-11',1),(2,'worker','123','asdf@nl.nl','Worker test','2014-10-14','2014-10-11',2),(3,'test2','123','asdf@nl.nl','Test2','2014-10-14','2014-10-11',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group`
--

DROP TABLE IF EXISTS `user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group` (
  `user_oid` int(11) NOT NULL,
  `group_oid` int(11) NOT NULL,
  PRIMARY KEY (`user_oid`,`group_oid`),
  KEY `fk_user_group_user` (`user_oid`),
  KEY `fk_user_group_group` (`group_oid`),
  CONSTRAINT `fk_user_group_group` FOREIGN KEY (`group_oid`) REFERENCES `group` (`oid`),
  CONSTRAINT `fk_user_group_user` FOREIGN KEY (`user_oid`) REFERENCES `user` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group`
--

LOCK TABLES `user_group` WRITE;
/*!40000 ALTER TABLE `user_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worker`
--

DROP TABLE IF EXISTS `worker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `worker` (
  `user_oid` int(11) NOT NULL,
  `accuracyscore` double DEFAULT NULL,
  PRIMARY KEY (`user_oid`),
  KEY `fk_worker_user` (`user_oid`),
  CONSTRAINT `fk_worker_user` FOREIGN KEY (`user_oid`) REFERENCES `user` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker`
--

LOCK TABLES `worker` WRITE;
/*!40000 ALTER TABLE `worker` DISABLE KEYS */;
INSERT INTO `worker` VALUES (2,0);
/*!40000 ALTER TABLE `worker` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-10-11 22:27:35
