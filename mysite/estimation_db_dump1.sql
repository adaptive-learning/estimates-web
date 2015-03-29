-- MySQL dump 10.13  Distrib 5.5.41, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: estimation_db
-- ------------------------------------------------------
-- Server version	5.5.41-0ubuntu0.14.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_5f412f9a` (`group_id`),
  KEY `auth_group_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `group_id_refs_id_f4b32aac` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_6ba0f519` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_d043b34a` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add migration history',1,'add_migrationhistory'),(2,'Can change migration history',1,'change_migrationhistory'),(3,'Can delete migration history',1,'delete_migrationhistory'),(4,'Can add log entry',2,'add_logentry'),(5,'Can change log entry',2,'change_logentry'),(6,'Can delete log entry',2,'delete_logentry'),(7,'Can add permission',3,'add_permission'),(8,'Can change permission',3,'change_permission'),(9,'Can delete permission',3,'delete_permission'),(10,'Can add group',4,'add_group'),(11,'Can change group',4,'change_group'),(12,'Can delete group',4,'delete_group'),(13,'Can add user',5,'add_user'),(14,'Can change user',5,'change_user'),(15,'Can delete user',5,'delete_user'),(16,'Can add content type',6,'add_contenttype'),(17,'Can change content type',6,'change_contenttype'),(18,'Can delete content type',6,'delete_contenttype'),(19,'Can add session',7,'add_session'),(20,'Can change session',7,'change_session'),(21,'Can delete session',7,'delete_session'),(22,'Can add float model',8,'add_floatmodel'),(23,'Can change float model',8,'change_floatmodel'),(24,'Can delete float model',8,'delete_floatmodel'),(25,'Can add concept',9,'add_concept'),(26,'Can change concept',9,'change_concept'),(27,'Can delete concept',9,'delete_concept'),(28,'Can add params',10,'add_params'),(29,'Can change params',10,'change_params'),(30,'Can delete params',10,'delete_params'),(31,'Can add questions',11,'add_questions'),(32,'Can change questions',11,'change_questions'),(33,'Can delete questions',11,'delete_questions'),(34,'Can add type',12,'add_type'),(35,'Can change type',12,'change_type'),(36,'Can delete type',12,'delete_type'),(37,'Can add user skill',13,'add_userskill'),(38,'Can change user skill',13,'change_userskill'),(39,'Can delete user skill',13,'delete_userskill'),(40,'Can add lazy user',14,'add_lazyuser'),(41,'Can change lazy user',14,'change_lazyuser'),(42,'Can delete lazy user',14,'delete_lazyuser'),(43,'Can add user social auth',15,'add_usersocialauth'),(44,'Can change user social auth',15,'change_usersocialauth'),(45,'Can delete user social auth',15,'delete_usersocialauth'),(46,'Can add nonce',16,'add_nonce'),(47,'Can change nonce',16,'change_nonce'),(48,'Can delete nonce',16,'delete_nonce'),(49,'Can add association',17,'add_association'),(50,'Can change association',17,'change_association'),(51,'Can delete association',17,'delete_association'),(52,'Can add curr table',18,'add_currtable'),(53,'Can change curr table',18,'change_currtable'),(54,'Can delete curr table',18,'delete_currtable');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$12000$doFwarO6PiBs$PsDq1mjUaFQcn6yckm12YD1Ic8KP0Spy6lC3e1hAodY=','2015-02-27 15:41:04',1,'admin','','','stone99@azet.sk',1,1,'2015-02-27 15:41:04'),(2,'pbkdf2_sha256$12000$peTSyG1leHbY$pwG8zbtYMf7JeJOB6p7NrtkTz3WX+8mAd1rePtle+30=','2015-03-13 18:07:06',0,'tester','','','tester@azet.sk',0,1,'2015-03-07 17:39:23'),(52,'!81zrdrzwxOc1OSII3q5UDtvqp0QR9nILyW5tloDh','2015-03-15 23:47:56',0,'romanorlicek1c04f8ac7f5d41ab','Roman','Orlíček','romanorlicek@gmail.com',0,1,'2015-03-14 13:47:29'),(53,'!22qUzYeSjFBvLbxUffxQHweUKMl3i7HtjNBmfUm4','2015-03-15 11:47:58',0,'d3c9e49101794b78b0cab3d76b4b92','','','',0,1,'2015-03-15 11:47:57'),(54,'!VjzvcqnlRxy3MNvRZxEfM8NNNj4uHwo3q99cksVi','2015-03-15 11:48:27',0,'b96a1e87480245359d0fa51c608868','','','',0,1,'2015-03-15 11:48:27'),(55,'!qHLHFJS4CcL4WrlyHpVIfyu5aorgFAuBR8sfSMWn','2015-03-15 11:59:08',0,'eeb4fe5d13ae40299561ea507c74d1','','','',0,1,'2015-03-15 11:59:08'),(56,'!DbPLU3vRv2lq3VOY93rEIBfW4d4uwTaTZGK0xkFB','2015-03-15 23:40:35',0,'RomanOrlíček','Roman','Orlíček','',0,1,'2015-03-15 23:40:35'),(57,'!IGDJAuO5fqX43UXhMoKetJYE78AwneLAM47qx4u5','2015-03-15 23:43:57',0,'550e9cc766ac4042988e00950ad7e6','','','',0,1,'2015-03-15 23:43:57'),(58,'!VsXXnzIsA6rUmNpO6zfZZD7glKyA3IvoSixlr3Id','2015-03-15 23:46:55',0,'46f7264676fb4839a94768546bea6b','','','',0,1,'2015-03-15 23:46:55'),(59,'!4Da5FWN0pAXLTAlhKbItGYfxYja7DzpUOKqLJHZv','2015-03-17 12:57:18',0,'031844e1bfb845688d51e4ca2df691','','','',0,1,'2015-03-17 12:57:18'),(60,'!PaIFT56dQGH9Bny2KIHkdM2kXNZZ1EIlyYXw1OlI','2015-03-17 19:18:21',0,'7d3a2c20ce06484bbae566405e994b','','','',0,1,'2015-03-17 19:18:21'),(61,'!cR4EMHCjFWAsM5VXgXVVvN8u65xXp0siNQT1VS64','2015-03-19 00:24:20',0,'a2fa7345011d4d70bfeda93687f812','','','',0,1,'2015-03-19 00:24:20'),(62,'!YNXtzpkzMXlxtOmQ90Tz0513VNsO3sdkBbLcVEf3','2015-03-19 08:11:52',0,'1f2d4bbc7ce84ef082de856c607809','','','',0,1,'2015-03-19 08:11:52'),(63,'!eVXFOiF9Uy8IuA8JFHj34xH3qbNzDKOqwMtmbvH1','2015-03-19 09:20:32',0,'0062b584f32c41538c4d4004774722','','','',0,1,'2015-03-19 09:20:31'),(64,'!STpVWELeUlberVBrTp81fO7OBcuEnKBYKeIRnYDv','2015-03-20 13:48:58',0,'5e9e73bd983f4ae388fc75f6f27dd5','','','',0,1,'2015-03-20 13:48:58'),(65,'!sxnRpbdRWyvg6pZsvSjfifbZcf6vU8IeKNrrAiU8','2015-03-20 20:52:29',0,'76672d5abfcb4a46b977c0fffee122','','','',0,1,'2015-03-20 20:52:29'),(66,'!T7gMezVGTr7O7BWRUHfxX5pC77looIklp6WoFWdd','2015-03-22 23:37:31',0,'3b4b694b379f4855abf8f6fa951caf','','','',0,1,'2015-03-22 23:37:31'),(67,'!913xtXLjgufpbOfb5pTcu9YdxGMz6zX88PHIz4MK','2015-03-22 23:40:07',0,'026cab8ee67d43a68b9febcd0f6185','','','',0,1,'2015-03-22 23:40:05'),(68,'!2cYcVhnpIotiUbRYLpiPW3bUDwjdAhyFjnZ34VCo','2015-03-22 23:41:57',0,'d61e45dd847c4a1caa7a0a4e8db8f8','','','',0,1,'2015-03-22 23:41:57'),(69,'!0eezrJ6oNj0Cmdyyr75bFK3JaxEZc0MpPo9T5VEj','2015-03-22 23:42:25',0,'26b7c2ca172b40f79d8e7bf8b8e3c3','','','',0,1,'2015-03-22 23:42:25'),(70,'!VnOoidE5OiuuXbQqHRcsiDt096xazwyyNxxNBRtQ','2015-03-22 23:42:44',0,'efeadc0ab31345ee8046b5d31e1715','','','',0,1,'2015-03-22 23:42:44'),(71,'!JpZ7dJwadaULldpOOCrXcRKrhO3N6Eb8GfCsQmci','2015-03-22 23:44:39',0,'3a8070573db14fc3833ba37b301650','','','',0,1,'2015-03-22 23:44:38'),(72,'!96rPSxdkvgFevBOfeU2icJTDagaFApNyc2awuLKQ','2015-03-22 23:45:11',0,'158e8dda7f2c4da59976c37ab64eeb','','','',0,1,'2015-03-22 23:45:08'),(73,'!I9j7hZKnyFVN5Qvuj7ilhoRlxVa5xulkPFuQC99c','2015-03-22 23:45:36',0,'98318fa73fc44d32926fed52c45e8d','','','',0,1,'2015-03-22 23:45:36'),(74,'!xPrIt5vdE8eQuRaaQpiItzVEm6oRtyd3bAZqrkoa','2015-03-23 12:06:11',0,'00fb2533d4b54fdaba8ec6461b5b90','','','',0,1,'2015-03-23 12:06:11'),(75,'!kTs3VWuamFWCLDgD7i1dU4We19WfyjWPh8yfboC5','2015-03-23 12:06:26',0,'3bd72d77c94742cdb9d735920ba5cc','','','',0,1,'2015-03-23 12:06:26'),(76,'!yZJUvJ503F0Ju03JJX7e9rY85UsllpOOgeLwYk2r','2015-03-25 09:47:38',0,'3d20c134c78e4980bc460bb3c8941d','','','',0,1,'2015-03-25 09:47:38'),(77,'!1QFBZR5Vt1XcjVDZCFug1HecOBFc6qHqI7Hki3oG','2015-03-26 18:37:43',0,'86e978594ed34de89c1b6fdff59c1c','','','',0,1,'2015-03-26 18:37:43'),(78,'!Wv5P5w5UbFS6Qg9zZa7x2Oo2HJqjU14Q6HV2STrG','2015-03-26 18:40:55',0,'0570dc65946c429891082d40404f66','','','',0,1,'2015-03-26 18:40:55'),(79,'!es6qNParuioW0fof5CkmepFXv95gdkFPaPBWx0n2','2015-03-26 18:43:40',0,'2b844046bbb24a72821af89a420b05','','','',0,1,'2015-03-26 18:43:40'),(80,'!n0T80ZVwlYZAJkK8rntdUzlL5pIGZDqEwoprdYoE','2015-03-26 18:44:09',0,'e0c7ea21db14409d924797e3178016','','','',0,1,'2015-03-26 18:44:09'),(81,'!YQoREbYjN0wPJYHrc60aTAewMa1oW7xXyW7KOU41','2015-03-26 18:47:38',0,'813b6dff1d794eff9aa180ccb42b2f','','','',0,1,'2015-03-26 18:47:38'),(82,'!AMzjA5UgRCWwpZpFzNfZu4aFdxS9Sz8xzuACw4Wp','2015-03-26 19:55:53',0,'2b17f7bde17a48248168dd30bf2cb1','','','',0,1,'2015-03-26 19:55:53'),(83,'!IKGWU3HDsJm9In2s9eQB1LS1ApYYD39zdNiNmJxq','2015-03-26 19:56:01',0,'3aba05dec84e400cbc765afee39429','','','',0,1,'2015-03-26 19:56:01'),(84,'!odYhBpO09808bbcyznuQqmtIdb2dQV5TxHfFyS6H','2015-03-26 21:15:44',0,'865e621998f640e79f057ccb5b7632','','','',0,1,'2015-03-26 21:15:44'),(85,'!h9dD4Q8t4NgZH0QlTrDSOn3aomG8kXNubN4BMDzN','2015-03-26 21:32:19',0,'6d1eb04dc05249b69a75367bbee1ab','','','',0,1,'2015-03-26 21:32:19'),(86,'!DTJgAogui5EBLNftMhxZnC91Bcab5glogxnkvbEl','2015-03-26 21:57:48',0,'6f7daf377722462d805674bc4c1315','','','',0,1,'2015-03-26 21:57:48'),(87,'!M0BBX4hNWMDuR6lwNjWwmzAQM7tQrCX7uhxTJql4','2015-03-26 21:58:38',0,'84cc4b572439405d962ba7e3ab006f','','','',0,1,'2015-03-26 21:58:38'),(88,'!VeruZ5EkwxizW3LIhG14R8UkADrqBSasR3QaZfXv','2015-03-28 16:45:42',0,'150127631b154726b1dd13857fa290','','','',0,1,'2015-03-28 16:45:42'),(89,'!YQZYt86BcKhbNPNyhtW1dTTjMglHsT1y088phGUe','2015-03-28 20:59:17',0,'1fe22d08168944fd98aa24befae002','','','',0,1,'2015-03-28 20:59:17'),(90,'!r5ktXfGd6M79rjsDSAMseNrpgJVyoJEBqr2AQ5Ns','2015-03-28 21:05:49',0,'52965adb04e04cef9f18b60102d177','','','',0,1,'2015-03-28 21:05:49'),(91,'!D5R6WMkmZ7Bu6ZWbpyu1QVDVFK7U6p3nAGSyq7n2','2015-03-28 21:06:16',0,'ea31b6a764a34f70aef7db41dbca6b','','','',0,1,'2015-03-28 21:06:16'),(92,'!tVXyr3ovCyyckwNy1bxUSYCDYt1MBPFkwXZoQtEg','2015-03-28 21:06:49',0,'625eeea1a04e445bb2c9450e585a2f','','','',0,1,'2015-03-28 21:06:49'),(93,'!niyVW5SLOzL6m0yb1OIKGkXVUKI3El4Jk0yzfsIA','2015-03-29 08:18:25',0,'e4c2febf168a4c3baa93bbd2c5a32e','','','',0,1,'2015-03-29 08:18:25');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_6340c63c` (`user_id`),
  KEY `auth_user_groups_5f412f9a` (`group_id`),
  CONSTRAINT `group_id_refs_id_274b862c` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_id_refs_id_40c41112` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_6340c63c` (`user_id`),
  KEY `auth_user_user_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `permission_id_refs_id_35d9ac25` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_id_refs_id_4dc23c39` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_6340c63c` (`user_id`),
  KEY `django_admin_log_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_93d2d1f8` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c0d12874` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'migration history','south','migrationhistory'),(2,'log entry','admin','logentry'),(3,'permission','auth','permission'),(4,'group','auth','group'),(5,'user','auth','user'),(6,'content type','contenttypes','contenttype'),(7,'session','sessions','session'),(8,'float model','learning','floatmodel'),(9,'concept','learning','concept'),(10,'params','learning','params'),(11,'questions','learning','questions'),(12,'type','learning','type'),(13,'user skill','learning','userskill'),(14,'lazy user','lazysignup','lazyuser'),(15,'user social auth','social_auth','usersocialauth'),(16,'nonce','social_auth','nonce'),(17,'association','social_auth','association'),(18,'curr table','learning','currtable');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_b7b81f0c` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('3rqqup2lutkmtv13987izmgdrrf19ws7','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','2015-04-11 21:42:54'),('jvqniyfo4b9gbg9910spe51ywpcqcb65','YWQ3NzBkYTBhY2RkYjJhMWQxMGY4ZDU0OGE3ZThlZTU4Y2E3MzIwMTqAAn1xAShVAnAyTlUCcDFYCgAAADIqMC42KzEuOTVVDV9hdXRoX3VzZXJfaWSKAV1VCHF1ZXN0aW9uTlUSX2F1dGhfdXNlcl9iYWNrZW5kVSVsYXp5c2lnbnVwLmJhY2tlbmRzLkxhenlTaWdudXBCYWNrZW5kVQdtZWRUaW1lcQJLD1UJdGVzdFBhcmFtSwFVBHRlc3RYAwAAAHNldHEDVQR0eXBlWAQAAABlcXVhcQRVBXR5cGVzXXEFWAQAAABlcXVhcQZhdS4=','2015-04-12 12:47:06');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lazysignup_lazyuser`
--

DROP TABLE IF EXISTS `lazysignup_lazyuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lazysignup_lazyuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT '2015-03-11 22:48:25',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `lazysignup_lazyuser_63b5ea41` (`created`),
  CONSTRAINT `user_id_refs_id_4f30feac7e9c929` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lazysignup_lazyuser`
--

LOCK TABLES `lazysignup_lazyuser` WRITE;
/*!40000 ALTER TABLE `lazysignup_lazyuser` DISABLE KEYS */;
INSERT INTO `lazysignup_lazyuser` VALUES (1,53,'2015-03-15 11:47:57'),(2,54,'2015-03-15 11:48:27'),(3,55,'2015-03-15 11:59:08'),(4,57,'2015-03-15 23:43:57'),(5,58,'2015-03-15 23:46:55'),(6,59,'2015-03-17 12:57:18'),(7,60,'2015-03-17 19:18:21'),(8,61,'2015-03-19 00:24:20'),(9,62,'2015-03-19 08:11:52'),(10,63,'2015-03-19 09:20:31'),(11,64,'2015-03-20 13:48:58'),(12,65,'2015-03-20 20:52:29'),(13,66,'2015-03-22 23:37:31'),(14,67,'2015-03-22 23:40:07'),(15,68,'2015-03-22 23:41:57'),(16,69,'2015-03-22 23:42:25'),(17,70,'2015-03-22 23:42:44'),(18,71,'2015-03-22 23:44:38'),(19,72,'2015-03-22 23:45:11'),(20,73,'2015-03-22 23:45:36'),(21,74,'2015-03-23 12:06:11'),(22,75,'2015-03-23 12:06:26'),(23,76,'2015-03-25 09:47:38'),(24,77,'2015-03-26 18:37:43'),(25,78,'2015-03-26 18:40:55'),(26,79,'2015-03-26 18:43:40'),(27,80,'2015-03-26 18:44:09'),(28,81,'2015-03-26 18:47:38'),(29,82,'2015-03-26 19:55:53'),(30,83,'2015-03-26 19:56:01'),(31,84,'2015-03-26 21:15:44'),(32,85,'2015-03-26 21:32:19'),(33,86,'2015-03-26 21:57:48'),(34,87,'2015-03-26 21:58:38'),(35,88,'2015-03-28 16:45:42'),(36,89,'2015-03-28 20:59:17'),(37,90,'2015-03-28 21:05:49'),(38,91,'2015-03-28 21:06:16'),(39,92,'2015-03-28 21:06:49'),(40,93,'2015-03-29 08:18:25');
/*!40000 ALTER TABLE `lazysignup_lazyuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learning_concept`
--

DROP TABLE IF EXISTS `learning_concept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `learning_concept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11),
  `type_id` int(11) NOT NULL,
  `params_id` int(11) NOT NULL,
  `label` double DEFAULT NULL,
  `updatedTimes` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `learning_concept_25110688` (`question_id`),
  KEY `learning_concept_403d8ff3` (`type_id`),
  KEY `learning_concept_45bd63ef` (`params_id`),
  CONSTRAINT `question_id_refs_id_93dd819681f5d6a` FOREIGN KEY (`question_id`) REFERENCES `learning_questions` (`id`),
  CONSTRAINT `params_id_refs_id_71e9445f4ea724a8` FOREIGN KEY (`params_id`) REFERENCES `learning_params` (`id`),
  CONSTRAINT `type_id_refs_id_79be5b42010a9228` FOREIGN KEY (`type_id`) REFERENCES `learning_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1243 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning_concept`
--

LOCK TABLES `learning_concept` WRITE;
/*!40000 ALTER TABLE `learning_concept` DISABLE KEYS */;
INSERT INTO `learning_concept` VALUES (1,1,14,98,0.5,0),(2,2,14,98,0.5,0),(3,3,14,98,0.5,0),(4,4,14,98,0.5,0),(5,5,14,98,0.5,0),(6,6,14,98,0.5,0),(7,7,14,98,0.5,0),(8,8,14,98,0.5,0),(9,9,14,98,0.5,0),(10,10,14,98,0.5,0),(11,11,14,98,0.5,0),(12,12,14,98,0.5,0),(13,13,14,98,0.5,0),(14,14,14,98,0.5,0),(15,15,14,98,0.5,0),(16,16,14,98,0.5,0),(17,17,14,98,0.5,0),(18,18,14,98,0.5,0),(19,19,14,98,0.5,0),(20,20,14,98,0.5,0),(21,21,14,98,0.166580876303952,1),(22,22,14,98,0.5,0),(23,23,14,98,0.5,0),(24,24,14,98,0.5,0),(25,25,14,98,0.5,0),(26,26,14,98,0.5,0),(27,27,14,98,0.5,0),(28,28,14,98,0.5,0),(29,29,14,98,0.5,0),(30,30,14,98,0.5,0),(31,31,14,98,0.5,0),(32,32,14,98,0.5,0),(33,33,14,98,0.5,0),(34,34,14,98,0.5,0),(35,35,14,98,0.5,0),(36,1,14,82,0.5,0),(37,2,14,82,0.5,0),(38,3,14,82,0.5,0),(39,4,14,82,0.5,0),(40,5,14,82,0.5,0),(41,6,14,82,0.5,0),(42,7,14,82,0.5,0),(43,8,14,82,0.5,0),(44,9,14,82,0.5,0),(45,10,14,82,0.5,0),(46,11,14,82,0.5,0),(47,12,14,82,0.5,0),(48,13,14,82,0.5,0),(49,14,14,82,0.5,0),(50,15,14,82,0.5,0),(51,16,14,82,1.1964979626618,2),(52,17,14,82,0.5,0),(53,18,14,82,0.5,0),(54,19,14,82,0.266468247538821,1),(55,20,14,82,0.5,0),(56,21,14,82,0.5,0),(57,22,14,82,0.5,0),(58,23,14,82,0.776699029126214,1),(59,24,14,82,0.953411446638746,1),(60,25,14,82,0.5,0),(61,26,14,82,0.5,0),(62,27,14,82,0.5,0),(63,28,14,82,0.5,0),(64,29,14,82,0.5,0),(65,30,14,82,0.5,0),(66,31,14,82,0.5,0),(67,32,14,82,0.5,0),(68,33,14,82,0.5,0),(69,34,14,82,0.5,0),(70,35,14,82,0.5,0),(71,1,14,118,0.5,0),(72,2,14,118,0.5,0),(73,3,14,118,0.728155339805825,1),(74,4,14,118,0.5,0),(75,5,14,118,0.5,0),(76,6,14,118,0.5,0),(77,7,14,118,0.5,0),(78,8,14,118,0.5,0),(79,9,14,118,0.5,0),(80,10,14,118,0.5,0),(81,11,14,118,0.5,0),(82,12,14,118,0.5,0),(83,13,14,118,0.5,0),(84,14,14,118,0.5,0),(85,15,14,118,0.5,0),(86,16,14,118,0.5,0),(87,17,14,118,0.5,0),(88,18,14,118,0.5,0),(89,19,14,118,0.5,0),(90,20,14,118,0.5,0),(91,21,14,118,0.5,0),(92,22,14,118,0.5,0),(93,23,14,118,0.5,0),(94,24,14,118,0.5,0),(95,25,14,118,0.5,0),(96,26,14,118,0.5,0),(97,27,14,118,0.5,0),(98,28,14,118,0.5,0),(99,29,14,118,0.5,0),(100,30,14,118,0.5,0),(101,31,14,118,0.5,0),(102,32,14,118,0.5,0),(103,33,14,118,0.5,0),(104,34,14,118,0.5,0),(105,35,14,118,0.5,0),(106,1,14,114,0.5,0),(107,2,14,114,0.5,0),(108,3,14,114,0.5,0),(109,4,14,114,0.5,0),(110,5,14,114,0.5,0),(111,6,14,114,0.5,0),(112,7,14,114,0.5,0),(113,8,14,114,0.5,0),(114,9,14,114,0.5,0),(115,10,14,114,0.5,0),(116,11,14,114,0.5,0),(117,12,14,114,0.5,0),(118,13,14,114,0.5,0),(119,14,14,114,0.5,0),(120,15,14,114,0.5,0),(121,16,14,114,0.5,0),(122,17,14,114,0.5,0),(123,18,14,114,0.5,0),(124,19,14,114,0.5,0),(125,20,14,114,0.5,0),(126,21,14,114,0.5,0),(127,22,14,114,0.5,0),(128,23,14,114,0.5,0),(129,24,14,114,0.5,0),(130,25,14,114,0.5,0),(131,26,14,114,0.5,0),(132,27,14,114,0.5,0),(133,28,14,114,0.5,0),(134,29,14,114,0.5,0),(135,30,14,114,0.5,0),(136,31,14,114,0.5,0),(137,32,14,114,0.5,0),(138,33,14,114,0.5,0),(139,34,14,114,0.776699029126214,1),(140,35,14,114,0.5,0),(141,1,14,88,0.5,0),(142,2,14,88,0.5,0),(143,3,14,88,0.5,0),(144,4,14,88,0.5,0),(145,5,14,88,0.5,0),(146,6,14,88,0.5,0),(147,7,14,88,0.5,0),(148,8,14,88,0.5,0),(149,9,14,88,0.5,0),(150,10,14,88,0.5,0),(151,11,14,88,0.5,0),(152,12,14,88,0.5,0),(153,13,14,88,0.5,0),(154,14,14,88,0.5,0),(155,15,14,88,0.953411446638746,1),(156,16,14,88,0.5,0),(157,17,14,88,0.5,0),(158,18,14,88,0.728155339805825,1),(159,19,14,88,0.5,0),(160,20,14,88,0.5,0),(161,21,14,88,0.5,0),(162,22,14,88,0.5,0),(163,23,14,88,0.5,0),(164,24,14,88,0.953411446638746,1),(165,25,14,88,0.5,0),(166,26,14,88,0.5,0),(167,27,14,88,0.5,0),(168,28,14,88,0.5,0),(169,29,14,88,0.5,0),(170,30,14,88,0.5,0),(171,31,14,88,0.5,0),(172,32,14,88,0.5,0),(173,33,14,88,0.5,0),(174,34,14,88,0.5,0),(175,35,14,88,0.5,0),(176,1,14,79,0.924829249342168,1),(177,2,14,79,0.5,0),(178,3,14,79,0.5,0),(179,4,14,79,0.5,0),(180,5,14,79,0.5,0),(181,6,14,79,0.5,0),(182,7,14,79,0.5,0),(183,8,14,79,0.5,0),(184,9,14,79,0.964375872889044,1),(185,10,14,79,0.5,0),(186,11,14,79,0.5,0),(187,12,14,79,0.5,0),(188,13,14,79,0.5,0),(189,14,14,79,0.5,0),(190,15,14,79,0.5,0),(191,16,14,79,0.728155339805825,1),(192,17,14,79,0.5,0),(193,18,14,79,0.5,0),(194,19,14,79,0.5,0),(195,20,14,79,0.5,0),(196,21,14,79,0.5,0),(197,22,14,79,0.5,0),(198,23,14,79,0.5,0),(199,24,14,79,0.5,0),(200,25,14,79,0.5,0),(201,26,14,79,0.5,0),(202,27,14,79,0.5,0),(203,28,14,79,0.5,0),(204,29,14,79,0.5,0),(205,30,14,79,0.5,0),(206,31,14,79,0.5,0),(207,32,14,79,0.5,0),(208,33,14,79,0.5,0),(209,34,14,79,0.5,0),(210,35,14,79,0.5,0),(211,1,14,58,0.838778802904174,2),(212,2,14,58,0.969989270685048,1),(213,3,14,58,0.924829249342168,1),(214,4,14,58,0.5,0),(215,5,14,58,0.5,0),(216,6,14,58,0.5,0),(217,7,14,58,0.5,0),(218,8,14,58,0.5,0),(219,9,14,58,0.5,0),(220,10,14,58,0.5,0),(221,11,14,58,0.5,0),(222,12,14,58,0.5,0),(223,13,14,58,0.5,0),(224,14,14,58,0.5,0),(225,15,14,58,0.5,0),(226,16,14,58,0.5,0),(227,17,14,58,0.5,0),(228,18,14,58,0.5,0),(229,19,14,58,0.5,0),(230,20,14,58,0.5,0),(231,21,14,58,0.5,0),(232,22,14,58,0.5,0),(233,23,14,58,0.5,0),(234,24,14,58,0.5,0),(235,25,14,58,0.5,0),(236,26,14,58,0.5,0),(237,27,14,58,0.5,0),(238,28,14,58,0.5,0),(239,29,14,58,0.5,0),(240,30,14,58,0.5,0),(241,31,14,58,0.5,0),(242,32,14,58,0.832177531206657,1),(243,33,14,58,0.5,0),(244,34,14,58,0.5,0),(245,35,14,58,0.5,0),(246,36,14,76,0.5,0),(247,37,14,76,0.5,0),(248,38,14,76,0.5,0),(249,39,14,76,0.5,0),(250,40,14,76,0.5,0),(251,41,14,76,0.5,0),(252,42,14,76,0.728155339805825,1),(253,43,14,76,0.809061488673139,1),(254,44,14,76,1.56604266912954,2),(255,45,14,76,0.5,0),(256,46,14,76,0.5,0),(257,47,14,76,0.5,0),(258,48,14,76,0.5,0),(259,49,14,76,0.5,0),(260,50,14,76,0.716073224467115,1),(261,51,14,76,0.5,0),(262,52,14,76,0.5,0),(263,53,14,76,0.5,0),(264,54,14,76,0.855142794153284,1),(265,55,14,76,0.776699029126214,1),(266,56,14,76,0.728155339805825,1),(267,57,14,76,1.18127702374934,2),(268,58,14,76,0.5,0),(269,59,14,76,0.5,0),(270,60,14,76,0.5,0),(271,36,14,57,0.5,0),(272,37,14,57,0.728155339805825,1),(273,38,14,57,0.5,0),(274,39,14,57,0.5,0),(275,40,14,57,0.5,0),(276,41,14,57,0.5,0),(277,42,14,57,0.5,0),(278,43,14,57,0.5,0),(279,44,14,57,0.5,0),(280,45,14,57,0.5,0),(281,46,14,57,0.832177531206657,1),(282,47,14,57,0.776699029126214,1),(283,48,14,57,0.5,0),(284,49,14,57,0.5,0),(285,50,14,57,0.776699029126214,1),(286,51,14,57,1.72227672286534,2),(287,52,14,57,0.855142794153284,1),(288,53,14,57,0.5,0),(289,54,14,57,1.26088685629223,2),(290,55,14,57,0.5,0),(291,56,14,57,0.855142794153284,1),(292,57,14,57,0.5,0),(293,58,14,57,0.5,0),(294,59,14,57,0.5,0),(295,60,14,57,0.5,0),(296,36,14,54,0.5,0),(297,37,14,54,0.862998921251348,1),(298,38,14,54,0.5,0),(299,39,14,54,0.5,0),(300,40,14,54,0.776699029126214,1),(301,41,14,54,0.809061488673139,1),(302,42,14,54,0.953411446638746,1),(303,43,14,54,0.970872979099002,1),(304,44,14,54,0.5,0),(305,45,14,54,0.5,0),(306,46,14,54,0.924829249342168,1),(307,47,14,54,0.728155339805825,1),(308,48,14,54,0.5,0),(309,49,14,54,0.809061488673139,1),(310,50,14,54,0.5,0),(311,51,14,54,0.5,0),(312,52,14,54,1.26088685629223,2),(313,53,14,54,0.5,0),(314,54,14,54,0.5,0),(315,55,14,54,0.855142794153284,1),(316,56,14,54,0.776699029126214,1),(317,57,14,54,0.5,0),(318,58,14,54,0.5,0),(319,59,14,54,0.5,0),(320,60,14,54,0.5,0),(321,36,14,56,0.776699029126214,1),(322,37,14,56,1.36024224434339,2),(323,38,14,56,0.776699029126214,1),(324,39,14,56,0.5,0),(325,40,14,56,0.728155339805825,1),(326,41,14,56,0.849514563106796,1),(327,42,14,56,0.5,0),(328,43,14,56,0.5,0),(329,44,14,56,0.5,0),(330,45,14,56,0.5,0),(331,46,14,56,0.855142794153284,1),(332,47,14,56,0.5,0),(333,48,14,56,0.5,0),(334,49,14,56,0.5,0),(335,50,14,56,0.5,0),(336,51,14,56,0.5,0),(337,52,14,56,0.924829249342168,1),(338,53,14,56,0.647249190938511,1),(339,54,14,56,0.5,0),(340,55,14,56,0.487817431977713,1),(341,56,14,56,0.5,0),(342,57,14,56,0.5,0),(343,58,14,56,0.5,0),(344,59,14,56,0.5,0),(345,60,14,56,0.5,0),(346,36,14,99,0.5,0),(347,37,14,99,0.924829249342168,1),(348,38,14,99,0.5,0),(349,39,14,99,0.5,0),(350,40,14,99,0.5,0),(351,41,14,99,0.5,0),(352,42,14,99,0.919775166070516,1),(353,43,14,99,0.5,0),(354,44,14,99,0.728155339805825,1),(355,45,14,99,0.5,0),(356,46,14,99,0.5,0),(357,47,14,99,0.647249190938511,1),(358,48,14,99,0.5,0),(359,49,14,99,0.5,0),(360,50,14,99,0.5,0),(361,51,14,99,0.5,0),(362,52,14,99,0.5,0),(363,53,14,99,0.5,0),(364,54,14,99,0.5,0),(365,55,14,99,0.5,0),(366,56,14,99,0.849514563106796,1),(367,57,14,99,0.776699029126214,1),(368,58,14,99,0.832177531206657,1),(369,59,14,99,0.5,0),(370,60,14,99,1.85441796036656,2),(371,36,14,75,0.5,0),(372,37,14,75,0.5,0),(373,38,14,75,0.5,0),(374,39,14,75,0.5,0),(375,40,14,75,0.5,0),(376,41,14,75,0.5,0),(377,42,14,75,0.809061488673139,1),(378,43,14,75,0.5,0),(379,44,14,75,0.5,0),(380,45,14,75,1.92404534811368,2),(381,46,14,75,0.5,0),(382,47,14,75,0.776699029126214,1),(383,48,14,75,0.5,0),(384,49,14,75,0.5,0),(385,50,14,75,0.647249190938511,1),(386,51,14,75,0.5,0),(387,52,14,75,0.5,0),(388,53,14,75,1.57677666091539,2),(389,54,14,75,0.5,0),(390,55,14,75,0.776699029126214,1),(391,56,14,75,0.776699029126214,1),(392,57,14,75,0.5,0),(393,58,14,75,0.5,0),(394,59,14,75,0.809061488673139,1),(395,60,14,75,0.855142794153284,1),(396,36,14,95,0.5,0),(397,37,14,95,0.5,0),(398,38,14,95,0.809061488673139,1),(399,39,14,95,0.5,0),(400,40,14,95,0.5,0),(401,41,14,95,1.19798406701309,2),(402,42,14,95,0.5,0),(403,43,14,95,0.5,0),(404,44,14,95,0.5,0),(405,45,14,95,0.5,0),(406,46,14,95,0.5,0),(407,47,14,95,0.647249190938511,1),(408,48,14,95,0.5,0),(409,49,14,95,0.832177531206657,1),(410,50,14,95,0.5,0),(411,51,14,95,0.924829249342168,1),(412,52,14,95,0.5,0),(413,53,14,95,0.5,0),(414,54,14,95,0.87378640776699,1),(415,55,14,95,0.5,0),(416,56,14,95,0.5,0),(417,57,14,95,0.728155339805825,1),(418,58,14,95,0.5,0),(419,59,14,95,0.5,0),(420,60,14,95,0.5,0),(422,61,6,97,0.5,0),(424,63,6,97,0.5,0),(426,64,6,97,0.5,0),(427,36,6,97,0.5,0),(428,41,6,97,0.5,0),(429,46,6,97,0.5,0),(430,51,6,97,0.5,0),(431,65,6,97,0.5,0),(432,66,6,97,0.5,0),(433,67,6,97,0.5,0),(434,68,6,97,0.5,0),(435,69,6,97,0.5,0),(436,70,6,97,0.5,0),(437,71,6,97,0.5,0),(438,72,6,97,0.5,0),(439,73,6,97,0.5,0),(440,74,6,97,0.5,0),(441,75,6,97,0.5,0),(442,76,6,97,0.5,0),(443,61,6,72,0.5,0),(444,63,6,72,0.5,0),(445,64,6,72,0.5,0),(446,65,6,72,0.5,0),(447,66,6,72,0.5,0),(448,67,6,72,0.5,0),(449,36,6,72,0.5,0),(450,68,6,72,0.5,0),(451,69,6,72,0.924829249342168,1),(452,70,6,72,0.5,0),(453,41,6,72,0.5,0),(454,71,6,72,0.5,0),(455,72,6,72,0.5,0),(456,73,6,72,0.5,0),(457,46,6,72,0.5,0),(458,74,6,72,0.5,0),(459,75,6,72,0.5,0),(460,76,6,72,0.5,0),(461,51,6,72,0.5,0),(462,78,6,80,0.5,0),(463,45,6,80,0.5,0),(464,79,6,80,0.5,0),(465,50,6,80,0.5,0),(466,80,6,80,0.5,0),(467,55,6,80,0.5,0),(468,81,6,80,0.5,0),(469,60,6,80,0.5,0),(470,82,6,80,0.5,0),(471,83,6,80,0.5,0),(472,84,6,80,0.5,0),(473,85,6,80,0.5,0),(474,86,6,80,0.5,0),(475,87,6,80,0.5,0),(476,88,6,80,0.5,0),(477,89,6,80,0.5,0),(478,90,6,80,0.5,0),(479,92,6,112,0.5,0),(480,93,6,112,0.5,0),(481,94,6,112,0.5,0),(482,95,6,112,0.5,0),(483,96,6,112,0.5,0),(484,97,6,112,0.5,0),(485,98,6,112,0.5,0),(486,99,6,112,0.5,0),(487,100,6,112,0.5,0),(488,101,6,112,0.5,0),(489,102,6,112,0.5,0),(490,103,6,112,0.5,0),(491,104,6,112,0.5,0),(492,105,6,112,0.5,0),(493,106,6,112,0.5,0),(494,107,6,112,0.5,0),(495,92,6,105,0.5,0),(496,93,6,105,0.5,0),(497,94,6,105,0.5,0),(498,95,6,105,0.5,0),(499,96,6,105,0.5,0),(500,97,6,105,0.5,0),(501,98,6,105,0.5,0),(502,99,6,105,0.5,0),(503,100,6,105,0.5,0),(504,101,6,105,0.5,0),(505,102,6,105,0.5,0),(506,103,6,105,0.5,0),(507,104,6,105,0.5,0),(508,105,6,105,0.5,0),(509,106,6,105,0.5,0),(510,107,6,105,0.5,0),(511,78,6,102,0.5,0),(512,45,6,102,0.5,0),(513,79,6,102,0.5,0),(514,50,6,102,0.5,0),(515,80,6,102,0.5,0),(516,55,6,102,0.5,0),(517,81,6,102,0.5,0),(518,60,6,102,0.5,0),(519,82,6,102,0.5,0),(520,83,6,102,0.5,0),(521,84,6,102,0.5,0),(522,85,6,102,0.5,0),(523,86,6,102,0.5,0),(524,87,6,102,0.5,0),(525,88,6,102,0.5,0),(526,89,6,102,0.5,0),(527,90,6,102,0.5,0),(528,91,6,102,0.5,0),(529,109,6,102,0.5,0),(530,110,6,102,0.5,0),(531,111,6,102,0.5,0),(532,112,6,102,0.5,0),(533,113,6,102,0.5,0),(534,114,6,102,0.5,0),(535,115,6,102,0.5,0),(536,116,6,102,0.5,0),(537,117,6,102,0.5,0),(538,118,6,102,0.5,0),(539,119,6,102,0.5,0),(540,120,6,102,0.5,0),(541,121,6,102,0.5,0),(542,122,6,102,0.5,0),(543,123,6,102,0.5,0),(544,124,6,102,0.5,0),(545,125,6,102,0.5,0),(546,126,6,102,0.5,0),(547,127,6,102,0.5,0),(548,128,6,102,0.5,0),(549,129,6,102,0.5,0),(550,130,6,102,0.5,0),(551,131,6,102,0.5,0),(552,132,6,102,0.5,0),(553,133,6,102,0.5,0),(554,134,6,102,0.5,0),(555,135,6,102,0.5,0),(556,136,6,102,0.5,0),(557,137,6,102,0.5,0),(558,138,6,102,0.5,0),(559,139,6,102,0.5,0),(560,92,6,102,0.5,0),(561,140,6,102,0.5,0),(562,141,6,102,0.5,0),(563,97,6,102,0.5,0),(564,142,6,102,0.5,0),(565,143,6,102,0.5,0),(566,102,6,102,0.5,0),(567,144,6,102,0.5,0),(568,145,6,102,0.5,0),(569,107,6,102,0.5,0),(570,146,6,102,0.5,0),(571,147,6,102,0.5,0),(572,148,6,102,0.5,0),(573,149,6,102,0.5,0),(574,2,6,102,0.5,0),(575,150,6,102,0.5,0),(576,151,6,102,0.5,0),(577,152,6,102,0.5,0),(578,153,6,102,0.5,0),(579,154,6,102,0.5,0),(580,155,6,102,0.5,0),(581,156,6,102,0.5,0),(582,157,6,102,0.5,0),(583,158,6,102,0.5,0),(584,159,6,102,0.5,0),(585,160,6,102,0.5,0),(586,161,6,102,0.5,0),(587,50,5,68,0.5,0),(588,53,5,68,0.5,0),(589,56,5,68,0.5,0),(590,59,5,68,0.5,0),(591,163,5,68,0.5,0),(592,83,5,68,0.5,0),(593,164,5,68,0.5,0),(594,165,5,68,0.5,0),(595,166,5,68,0.5,0),(596,167,5,68,0.5,0),(597,89,5,68,0.5,0),(598,168,5,68,0.5,0),(599,169,5,68,0.5,0),(600,170,5,68,0.5,0),(601,171,5,68,0.5,0),(602,112,5,68,0.849514563106796,1),(603,172,5,68,0.5,0),(604,173,5,68,0.5,0),(605,174,5,68,0.5,0),(606,175,5,68,0.5,0),(619,69,5,53,0.5,0),(620,176,5,53,0.5,0),(621,78,5,53,0.5,0),(622,177,5,53,0.5,0),(623,178,5,53,0.5,0),(624,75,5,53,0.5,0),(625,179,5,53,0.5,0),(626,80,5,53,1.42343313150691,2),(627,180,5,53,0.5,0),(628,181,5,53,0.5,0),(629,182,5,53,0.5,0),(630,183,5,53,0.5,0),(631,66,5,84,0.5,0),(632,184,5,84,0.5,0),(633,185,5,84,0.5,0),(634,186,5,84,0.776699029126214,1),(635,187,5,84,0.5,0),(636,69,5,84,0.5,0),(637,188,5,84,0.5,0),(638,176,5,84,0.5,0),(639,176,5,62,0.5,0),(640,78,5,62,0.728155339805825,1),(641,177,5,62,0.5,0),(642,178,5,62,0.5,0),(643,75,5,62,0.5,0),(644,179,5,62,0.5,0),(645,80,5,62,0.5,0),(646,180,5,62,0.5,0),(647,181,5,62,0.5,0),(648,182,5,62,0.5,0),(649,183,5,62,0.5,0),(650,82,5,62,0.5,0),(651,56,5,119,0.5,0),(652,60,5,119,0.5,0),(653,191,5,119,0.5,0),(654,164,5,119,0.5,0),(655,192,5,119,0.5,0),(656,193,5,119,0.5,0),(657,89,5,119,0.5,0),(658,39,5,74,0.5,0),(659,40,5,74,0.5,0),(660,41,5,74,0.941453368637835,1),(661,42,5,74,0.5,0),(662,43,5,74,0.5,0),(663,44,5,74,0.5,0),(664,45,5,74,0.5,0),(665,46,5,74,0.5,0),(666,47,5,74,0.5,0),(667,66,5,69,0.5,0),(668,37,5,69,0.5,0),(669,176,5,69,0.5,0),(670,44,5,69,0.5,0),(671,79,5,69,0.776699029126214,1),(672,51,5,69,0.5,0),(673,184,5,86,0.5,0),(674,69,5,86,0.5,0),(675,78,5,86,0.5,0),(676,178,5,86,0.5,0),(677,179,5,86,0.5,0),(678,180,5,86,0.5,0),(679,66,5,51,1.66759772816843,2),(680,40,5,51,0.5,0),(681,178,5,51,0.5,0),(682,53,5,51,0.5,0),(683,195,5,51,0.5,0),(684,196,5,51,0.5,0),(685,86,5,51,0.5,0),(686,184,5,104,0.5,0),(687,42,5,104,0.5,0),(688,198,5,104,0.5,0),(689,57,5,104,0.5,0),(690,190,5,104,0.5,0),(691,192,5,104,0.5,0),(692,66,5,115,0.5,0),(693,188,5,115,0.5,0),(694,200,5,115,0.5,0),(695,201,5,115,0.5,0),(696,81,5,115,0.5,0),(697,202,5,115,0.5,0),(698,203,5,115,0.5,0),(699,204,5,115,0.5,0),(700,205,5,115,0.5,0),(701,109,5,115,0.5,0),(702,184,5,60,0.5,0),(703,189,5,60,0.5,0),(704,75,5,60,0.5,0),(705,207,5,60,0.5,0),(706,82,5,60,0.5,0),(707,203,5,60,0.776699029126214,1),(708,208,5,60,0.5,0),(709,209,5,60,0.5,0),(710,210,5,60,0.5,0),(711,41,4,111,0.5,0),(712,75,4,111,0.5,0),(713,56,4,111,0.5,0),(714,202,4,111,0.5,0),(715,165,4,111,0.5,0),(716,38,4,117,0.5,0),(717,177,4,117,0.5,0),(718,51,4,117,0.5,0),(719,81,4,117,0.5,0),(720,191,4,117,0.5,0),(731,220,4,65,0.5,0),(732,221,4,65,0.5,0),(733,222,4,65,0.5,0),(734,223,4,65,0.5,0),(735,224,4,65,0.5,0),(736,225,4,65,0.5,0),(737,226,4,65,0.5,0),(738,227,4,65,0.5,0),(739,228,4,65,0.5,0),(740,229,4,65,0.5,0),(741,230,4,65,0.5,0),(742,69,4,106,0.5,0),(743,79,4,106,0.5,0),(744,181,4,106,0.5,0),(745,213,4,106,0.5,0),(746,214,4,106,0.5,0),(747,66,4,87,0.5,0),(748,232,4,87,0.5,0),(749,233,4,87,0.5,0),(750,234,4,87,0.5,0),(751,235,4,87,0.5,0),(752,41,4,94,0.5,0),(753,237,4,94,0.5,0),(754,238,4,94,0.5,0),(755,239,4,94,0.5,0),(756,240,4,94,0.5,0),(757,66,4,108,0.5,0),(758,242,4,108,0.5,0),(759,243,4,108,0.5,0),(760,244,4,108,0.5,0),(761,245,4,108,0.5,0),(762,246,4,108,0.5,0),(763,248,4,81,0.5,0),(764,249,4,81,0.5,0),(765,250,4,81,0.5,0),(766,251,4,81,0.5,0),(767,252,4,81,0.5,0),(768,253,4,81,0.5,0),(769,36,4,66,0.5,0),(770,255,4,66,0.5,0),(771,256,4,66,0.5,0),(772,257,4,66,0.5,0),(773,258,4,66,0.5,0),(774,259,4,66,0.5,0),(775,261,4,96,0.5,0),(776,262,4,96,0.5,0),(777,263,4,96,0.5,0),(778,264,4,96,0.5,0),(779,265,4,96,0.5,0),(780,266,4,96,0.5,0),(782,261,4,77,0.5,0),(783,268,4,77,0.5,0),(784,269,4,77,0.5,0),(785,270,4,77,0.5,0),(786,271,4,77,0.5,0),(787,272,4,77,0.5,0),(788,273,4,77,0.5,0),(789,274,4,77,0.5,0),(790,276,4,110,0.5,0),(791,277,4,110,0.5,0),(792,278,4,110,0.5,0),(793,279,4,110,0.5,0),(794,280,4,110,0.5,0),(795,281,4,110,0.5,0),(796,282,4,110,0.5,0),(797,283,4,110,0.5,0),(798,284,4,110,0.5,0),(799,286,4,109,0.5,0),(800,287,4,109,0.5,0),(801,288,4,109,0.5,0),(802,289,4,109,0.5,0),(803,290,4,109,0.5,0),(804,291,4,109,0.5,0),(805,292,4,109,0.5,0),(806,293,4,109,0.5,0),(807,294,4,109,0.5,0),(808,248,4,73,0.5,0),(809,296,4,73,0.5,0),(810,297,4,73,0.5,0),(811,298,4,73,0.5,0),(812,299,4,73,0.5,0),(813,300,4,73,0.5,0),(814,301,4,73,0.5,0),(815,56,4,78,0.5,0),(816,303,4,78,0.5,0),(817,304,4,78,0.5,0),(818,305,4,78,0.5,0),(819,306,4,78,0.5,0),(820,307,4,78,0.5,0),(821,308,4,78,0.5,0),(822,286,4,78,0.5,0),(823,310,4,78,0.5,0),(824,311,4,78,0.5,0),(825,312,4,78,0.5,0),(826,313,4,78,0.5,0),(827,314,4,78,0.5,0),(828,315,4,78,0.5,0),(829,316,4,78,0.5,0),(830,317,4,78,0.5,0),(831,318,4,78,0.5,0),(832,319,4,78,0.5,0),(869,261,3,100,0.5,0),(870,321,3,100,0.5,0),(871,322,3,100,0.5,0),(872,323,3,100,0.5,0),(873,324,3,100,0.5,0),(874,325,3,100,0.5,0),(875,326,3,100,0.5,0),(876,327,3,100,0.5,0),(877,328,3,100,0.5,0),(878,329,3,100,0.5,0),(879,330,3,100,0.5,0),(880,331,3,100,0.5,0),(881,66,3,103,0.5,0),(882,333,3,103,0.5,0),(883,334,3,103,0.5,0),(884,335,3,103,0.5,0),(885,336,3,103,0.5,0),(886,337,3,103,0.5,0),(887,248,3,64,0.5,0),(888,339,3,64,0.5,0),(889,340,3,64,0.5,0),(890,341,3,64,0.5,0),(891,342,3,64,0.5,0),(892,343,3,64,0.5,0),(893,220,3,90,0.5,0),(894,345,3,90,0.5,0),(895,346,3,90,0.5,0),(896,347,3,90,0.5,0),(897,348,3,90,0.5,0),(898,349,3,90,0.5,0),(899,350,3,90,0.5,0),(900,351,3,90,0.5,0),(901,372,3,90,0.5,0),(902,354,3,83,0.5,0),(903,355,3,83,0.5,0),(904,356,3,83,0.5,0),(905,357,3,83,0.5,0),(906,358,3,83,0.5,0),(907,39,3,55,0.5,0),(908,360,3,55,0.5,0),(909,361,3,55,0.5,0),(910,362,3,55,0.5,0),(911,363,3,55,0.5,0),(912,364,3,55,0.5,0),(919,185,3,107,0.5,0),(920,366,3,107,0.5,0),(921,367,3,107,0.5,0),(922,368,3,107,0.5,0),(923,369,3,107,0.5,0),(924,370,3,107,0.5,0),(925,261,3,101,0.5,0),(926,372,3,101,0.5,0),(927,373,3,101,0.5,0),(928,374,3,101,0.5,0),(929,375,3,101,0.5,0),(930,376,3,101,0.5,0),(931,377,3,101,0.5,0),(932,248,3,120,0.5,0),(933,379,3,120,0.5,0),(934,380,3,120,0.5,0),(935,381,3,120,0.5,0),(936,382,3,120,0.5,0),(937,383,3,120,0.5,0),(938,384,3,120,0.5,0),(939,385,3,120,0.5,0),(940,386,3,120,0.5,0),(941,387,3,120,0.5,0),(942,388,3,120,0.5,0),(943,389,3,120,0.5,0),(944,390,3,120,0.5,0),(945,391,3,120,0.5,0),(946,392,3,120,0.5,0),(947,393,3,120,0.5,0),(948,56,3,92,0.5,0),(949,395,3,92,0.5,0),(950,396,3,92,0.5,0),(951,397,3,92,0.5,0),(952,398,3,92,0.5,0),(953,399,3,92,0.5,0),(954,186,3,116,0.5,0),(955,401,3,116,0.5,0),(956,402,3,116,0.5,0),(957,403,3,116,0.5,0),(958,404,3,116,0.5,0),(959,405,3,116,0.5,0),(960,406,3,116,0.5,0),(961,407,3,116,0.5,0),(962,408,3,116,0.5,0),(963,409,3,116,0.5,0),(964,185,3,70,0.5,0),(965,411,3,70,0.5,0),(966,412,3,70,0.5,0),(967,413,3,70,0.5,0),(968,414,3,70,0.5,0),(969,415,3,70,0.5,0),(970,416,3,70,0.5,0),(971,417,3,70,0.5,0),(972,418,3,70,0.5,0),(973,220,3,93,0.5,0),(974,420,3,93,0.5,0),(975,421,3,93,0.5,0),(976,422,3,93,0.5,0),(977,423,3,93,0.5,0),(978,424,3,93,0.5,0),(979,425,3,93,0.5,0),(980,426,3,93,0.5,0),(981,41,3,89,0.5,0),(982,428,3,89,0.5,0),(983,429,3,89,0.5,0),(984,430,3,89,1.26088685629223,2),(985,431,3,89,0.5,0),(986,432,3,89,0.5,0),(987,433,3,89,0.5,0),(988,434,3,89,0.5,0),(989,435,3,89,0.5,0),(990,436,3,89,0.5,0),(991,186,3,85,0.5,0),(992,438,3,85,0.5,0),(993,439,3,85,0.5,0),(994,440,3,85,0.5,0),(995,441,3,85,1.50892080145863,2),(996,442,3,85,0.5,0),(997,443,3,85,0.5,0),(998,444,3,85,0.5,0),(999,445,3,85,0.5,0),(1000,446,3,85,0.5,0),(1001,447,3,85,0.5,0),(1002,185,3,71,0.5,0),(1003,449,3,71,0.5,0),(1004,450,3,71,0.5,0),(1005,451,3,71,0.5,0),(1006,452,3,71,0.5,0),(1007,453,3,71,0.5,0),(1008,454,3,71,0.5,0),(1009,455,3,71,0.5,0),(1010,456,3,71,0.5,0),(1011,185,3,67,0.5,0),(1012,449,3,67,0.5,0),(1013,450,3,67,0.5,0),(1014,451,3,67,0.5,0),(1015,452,3,67,0.5,0),(1016,453,3,67,0.5,0),(1017,454,3,67,0.5,0),(1018,455,3,67,0.5,0),(1019,456,3,67,0.5,0),(1020,42,3,61,0.5,0),(1021,458,3,61,0.5,0),(1022,459,3,61,0.5,0),(1023,460,3,61,0.5,0),(1024,461,3,61,0.5,0),(1025,462,3,61,0.5,0),(1026,463,3,61,0.5,0),(1027,464,3,61,0.5,0),(1028,465,3,61,0.5,0),(1029,466,3,61,0.5,0),(1030,467,3,61,0.5,0),(1033,36,9,59,0.5,0),(1034,469,9,59,0.953411446638746,1),(1035,176,9,59,0.5,0),(1036,470,9,59,0.5,0),(1037,45,9,59,1.44269941805216,2),(1038,74,9,59,0.5,0),(1039,198,9,59,0.855142794153284,1),(1040,471,9,59,0.5,0),(1041,54,9,59,0.955017584730986,2),(1042,472,9,59,0.5,0),(1043,182,9,59,0.5,0),(1044,473,9,59,0.5,0),(1045,474,9,59,0.5,0),(1046,475,9,59,0.5,0),(1047,84,9,59,0.5,0),(1048,476,9,59,0.5,0),(1049,192,9,59,0.5,0),(1050,477,9,59,0.5,0),(1051,208,9,59,0.5,0),(1052,478,9,59,0.5,0),(1053,286,9,59,0.931407419910142,1),(1054,479,9,59,1.05340431060756,2),(1055,480,9,59,1.52093504014354,2),(1056,481,9,59,0.938534342172892,1),(1057,110,9,59,1.2617936777532,2),(1058,482,9,59,0.5,0),(1059,483,9,59,0.5,0),(1060,484,9,59,0.5,0),(1061,485,9,59,0.5,0),(1062,486,9,59,0.5,0),(1063,487,9,59,0.5,0),(1064,488,9,59,0.5,0),(1065,489,9,59,1.5293480642042,3),(1066,490,9,59,0.5,0),(1067,119,9,59,0.5,0),(1068,491,9,59,0.5,0),(1069,492,9,59,2.12109850247892,3),(1070,493,9,59,0.5,0),(1071,36,9,91,0.5,0),(1072,469,9,91,0.5,0),(1073,176,9,91,0.5,0),(1074,470,9,91,0.922330097087379,1),(1075,45,9,91,0.5,0),(1076,74,9,91,0.964375872889044,1),(1077,198,9,91,1.04154074070583,2),(1078,471,9,91,0.5,0),(1079,54,9,91,0.5,0),(1080,472,9,91,0.5,0),(1081,182,9,91,0.5,0),(1082,473,9,91,0.5,0),(1083,474,9,91,0.5,0),(1084,475,9,91,0.914971775124441,1),(1085,84,9,91,1.37396954217859,2),(1086,476,9,91,0.5,0),(1087,192,9,91,0.5,0),(1088,477,9,91,0.5,0),(1089,208,9,91,0.5,0),(1090,478,9,91,1.26088685629223,2),(1091,286,9,91,1.57794784084621,2),(1092,479,9,91,0.5,0),(1093,480,9,91,0.970753985848557,1),(1094,481,9,91,0.5,0),(1095,110,9,91,0.5,0),(1096,482,9,91,0.5,0),(1097,483,9,91,0.5,0),(1098,484,9,91,1.85404761671721,2),(1099,485,9,91,0.5,0),(1100,486,9,91,5.00817428071169,6),(1101,487,9,91,0.5,0),(1102,488,9,91,0.5,0),(1103,489,9,91,0.5,0),(1104,490,9,91,0.5,0),(1105,119,9,91,0.5,0),(1106,491,9,91,5.00817428071169,6),(1107,492,9,91,0.5,0),(1108,493,9,91,0.5,0),(1109,185,8,113,5.71424416889027,8),(1110,188,8,113,5.13093272546954,6),(1111,72,8,113,10.0294617176383,13),(1112,79,8,113,6.00917392120555,7),(1113,201,8,113,5.02136320647389,6),(1115,195,8,113,5.30100361741192,6),(1116,202,8,113,6.02576568081647,7),(1117,84,8,113,5.02103986289014,6),(1118,495,8,113,5.71332079506081,8),(1119,204,8,113,5.02074427241101,6),(1120,199,8,113,6.01245879713344,7),(1121,209,8,113,6.12687774671896,7),(1122,109,8,113,6.01225485447228,7),(1123,496,8,113,6.01247872057548,7),(1124,497,8,113,5.28291239566761,7),(1125,498,8,113,6.01010274017734,7),(1126,487,8,113,6.00811105607047,7),(1127,117,8,113,5.02070041714616,6),(1128,499,8,113,5.02134527411715,6),(1130,501,8,113,5.02066138399635,6),(1131,502,8,113,4.86316781709287,6),(1132,125,8,113,5.42700016542152,7),(1133,39,8,113,4.87079419538866,7),(1135,49,8,113,5.70799638910209,8),(1136,207,8,113,5.71271012290102,8),(1137,474,8,113,5.71326164794765,8),(1139,286,8,113,5.70799664598661,8),(1141,504,8,113,5.70837389683158,8),(1142,500,8,113,6.00806966408219,7),(1143,505,8,113,4.96508795003526,6),(1144,36,10,63,0.929433804884553,2),(1145,69,10,63,0.5,0),(1146,41,10,63,0.5,0),(1147,72,10,63,0.5,0),(1148,46,10,63,0.964375872889044,1),(1149,75,10,63,0.5,0),(1150,51,10,63,0.5,0),(1151,506,10,63,0.719045967150247,1),(1152,56,10,63,0.884547953622842,2),(1153,182,10,63,0.542363818333048,1),(1154,507,10,63,0.5,0),(1155,202,10,63,1.57739035329695,2),(1156,196,10,63,0.887657300653964,2),(1157,508,10,63,0.5,0),(1158,165,10,63,0.5,0),(1159,509,10,63,0.5,0),(1160,193,10,63,0.5,0),(1180,41,11,122,0.5,0),(1181,286,11,122,0.5,0),(1182,507,11,122,0.345689908796705,1),(1183,72,11,121,1.7874600471591,2),(1184,51,11,123,0.832177531206657,1),(1185,79,11,124,1.70178449742051,2),(1186,191,11,124,0.5,0),(1187,69,11,125,2.27735686988131,4),(1188,82,11,126,0.5,0),(1189,48,11,126,0.862998921251348,1),(1190,286,11,127,0.200506542845081,1),(1191,511,11,128,0.5,0),(1192,220,11,128,0.666720848670792,1),(1193,48,11,128,1.50188276766881,2),(1194,41,11,129,0.832177531206657,1),(1195,191,11,129,0.5,0),(1196,213,11,130,0.5,0),(1197,72,11,130,0.0755124056094933,1),(1198,37,11,131,0.776699029126214,1),(1199,186,11,132,0.776699029126214,1),(1200,66,12,133,2.28212157865359,3),(1201,248,12,134,1.58511078747184,3),(1202,261,12,135,1.26088685629223,2),(1203,354,12,135,0.776699029126214,1),(1204,354,12,136,1.87110483852874,2),(1205,37,12,136,2.12109850247892,3),(1206,37,12,137,0.929500882972472,2),(1207,261,12,137,1.06925067428834,2),(1208,261,12,138,1.57755889485078,2),(1209,261,12,139,2.34415963960932,3),(1210,248,12,140,1.50892080145863,2),(1211,261,12,141,0.681923254738789,1),(1212,512,12,142,1.6828626724192,3),(1214,64,12,144,2.10365698360479,4),(1215,220,13,145,0.5,0),(1216,220,13,146,2.56747435211904,3),(1217,37,13,145,0.5,0),(1218,187,13,145,0.5,0),(1219,38,13,145,1.26088685629223,2),(1220,186,13,145,0.528301886792453,2),(1221,39,13,145,0.5,0),(1222,69,13,145,1.26088685629223,2),(1223,261,13,146,0.731200495057045,2),(1224,261,13,147,0.528301886792453,2),(1225,261,13,148,1.66759772816843,2),(1226,261,13,149,1.61114393551722,2),(1227,261,13,150,2.12109850247892,3),(1228,261,13,151,1.25371832204717,2),(1229,261,13,152,0.528301886792453,2),(1230,261,13,153,2.10365698360479,4),(1231,NULL,7,154,0.5,0),(1232,NULL,7,155,0.5,0),(1233,NULL,7,156,0.5,0),(1234,NULL,7,157,0.5,0),(1235,NULL,7,158,0.5,0),(1236,NULL,7,159,0.5,0),(1237,NULL,7,160,0.5,0),(1238,NULL,7,162,0.5,0),(1239,NULL,7,163,0.5,0),(1240,NULL,7,164,0.5,0),(1241,NULL,7,165,0.5,0),(1242,NULL,7,166,0.5,0);
/*!40000 ALTER TABLE `learning_concept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learning_currtable`
--

DROP TABLE IF EXISTS `learning_currtable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `learning_currtable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `params_id` int(11) NOT NULL,
  `rate` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `learning_currtable_45bd63ef` (`params_id`),
  CONSTRAINT `params_id_refs_id_726e357e1cc0dcda` FOREIGN KEY (`params_id`) REFERENCES `learning_params` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=261 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning_currtable`
--

LOCK TABLES `learning_currtable` WRITE;
/*!40000 ALTER TABLE `learning_currtable` DISABLE KEYS */;
INSERT INTO `learning_currtable` VALUES (196,54,300.2185),(197,56,1.0479),(198,57,4.099),(199,58,0.0364),(200,75,63.056),(201,76,1.0891),(202,79,2.2948),(203,82,0.1492),(204,88,0.0266),(205,95,27.4784),(206,98,0.0396),(207,99,0.7322),(208,114,0.0381),(209,118,10.9257),(210,51,1.09361),(211,53,2.54),(212,55,0.47318),(213,60,0.001),(214,61,2.36588),(215,62,0.254),(216,64,4.22675),(217,65,9.2903),(218,66,0.3861),(219,67,0.42268),(220,68,0.3937),(221,69,3.28084),(222,70,0.76455),(223,71,0.21134),(224,72,274.15),(225,73,25899.8811),(226,74,3.048),(227,77,0.02471),(228,78,0.00004),(229,80,-17.22222),(230,81,1.19599),(231,83,2.11338),(232,84,3.93701),(233,85,4.73176),(234,86,0.3048),(235,87,10.76391),(236,89,0.14787),(237,90,67.62805),(238,92,35.31467),(239,93,6.7628),(240,94,0.0929),(241,96,2.58999),(242,97,33.8),(243,100,61.02374),(244,101,0.94635),(245,102,255.92778),(246,103,1.05669),(247,104,0.9144),(248,105,-457.87),(249,106,0.10764),(250,107,0.23659),(251,108,0.83613),(252,109,40.46856),(253,110,0.00405),(254,111,0.155),(255,112,-272.15),(256,115,0.62137),(257,116,1.30795),(258,117,6.4516),(259,119,0.32808),(260,120,0.02832);
/*!40000 ALTER TABLE `learning_currtable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learning_floatmodel`
--

DROP TABLE IF EXISTS `learning_floatmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `learning_floatmodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `result` double NOT NULL,
  `answer` double NOT NULL,
  `type_id` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `usedHint` tinyint(1) NOT NULL,
  `label` double DEFAULT NULL,
  `date` datetime NOT NULL,
  `concept_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `learning_floatmodel_403d8ff3` (`type_id`),
  KEY `learning_floatmodel_6340c63c` (`user_id`),
  KEY `learning_floatmodel_8a386586` (`concept_id`),
  CONSTRAINT `concept_id_refs_id_54beff2670a2a233` FOREIGN KEY (`concept_id`) REFERENCES `learning_concept` (`id`),
  CONSTRAINT `type_id_refs_id_444862b09187e290` FOREIGN KEY (`type_id`) REFERENCES `learning_type` (`id`),
  CONSTRAINT `user_id_refs_id_630270d3410ecf4b` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=997 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning_floatmodel`
--

LOCK TABLES `learning_floatmodel` WRITE;
/*!40000 ALTER TABLE `learning_floatmodel` DISABLE KEYS */;
INSERT INTO `learning_floatmodel` VALUES (865,288.15,-150.15,6,3,87,1,1,'2015-03-26 22:09:04',451),(866,31.23,12,14,4,87,1,0.615754082612872,'2015-03-26 22:09:28',164),(867,1369.93,123,14,5,87,1,0.910214390516304,'2015-03-26 22:10:13',184),(868,129.19,123,14,7,87,1,0.0479139252264107,'2015-03-26 22:12:08',51),(869,22.13,123,14,4,87,1,1,'2015-03-26 22:17:50',155),(870,13.69,123,14,3,87,1,1,'2015-03-26 22:23:53',213),(871,7197.48,123,14,14,87,1,0.982910685406559,'2015-03-26 22:30:25',303),(872,6597.53,156,14,4,87,1,0.976354787321922,'2015-03-26 22:30:31',302),(873,129.28,123,14,3,87,1,0.0485767326732673,'2015-03-26 22:38:54',51),(874,174.46,123,14,4,87,1,0.294967327754213,'2015-03-26 22:39:00',59),(875,42.47,123,14,3,87,1,1,'2015-03-26 22:47:23',370),(876,204.15,15,14,2,87,1,0.926524614254225,'2015-03-26 22:47:27',291),(877,31.43,112,14,2,87,1,1,'2015-03-26 22:47:32',331),(878,3614.99,153,14,2,87,1,0.95767623146952,'2015-03-26 22:47:37',395),(879,50.01,1325,14,2,87,1,1,'2015-03-26 22:47:41',264),(880,1099.59,125,14,3,87,1,0.886321265198847,'2015-03-26 22:47:46',411),(881,14398.67,15,14,2,87,1,0.998958237114956,'2015-03-26 22:47:51',315),(882,8.79,2153,14,3,87,1,1,'2015-03-26 22:47:56',347),(883,171.52,1235,14,2,87,1,1,'2015-03-26 22:48:01',287),(884,44.01,15,14,3,87,1,0.659168370824812,'2015-03-26 22:48:06',337),(885,3120.07,15,14,3,87,1,0.995192415554779,'2015-03-26 23:58:58',391),(886,23.95,45,14,2,87,1,0.878914405010438,'2015-03-26 23:59:02',252),(887,550.32,500,14,4,87,1,0.091437708969327,'2015-03-26 23:59:07',401),(888,16.12,24,14,17,87,1,0.488833746898263,'2015-03-26 23:59:26',352),(889,155.4,20,14,3,87,1,0.871299871299871,'2015-03-26 23:59:32',285),(890,18.87,65,14,2,87,1,1,'2015-03-26 23:59:36',325),(891,9605.75,52,14,2,87,1,0.9945865757489,'2015-03-26 23:59:41',307),(892,1372.77,4000,14,4,87,1,1,'2015-03-26 23:59:47',377),(893,56.6,52,14,3,87,1,0.0812720848056537,'2015-03-26 23:59:53',267),(894,550.3,500,14,3,87,1,0.091404688351808,'2015-03-26 23:59:59',401),(895,56.59,52,14,4,87,1,0.0811097367025977,'2015-03-27 00:03:31',267),(896,19.05,65,14,2,87,1,1,'2015-03-27 00:03:35',354),(897,130.68,52,14,3,87,1,0.602081420263239,'2015-03-27 00:03:39',282),(898,46.14,5,14,1,87,1,0.891634156913741,'2015-03-27 00:03:41',338),(899,2370.97,54,14,1,87,1,0.97722451148686,'2015-03-27 00:03:45',385),(900,878.78,21,14,1,87,1,0.976103234028995,'2015-03-27 00:03:49',407),(901,5397.48,885,14,3,87,1,0.836034593921608,'2015-03-27 00:03:54',300),(902,54.41,565,14,2,87,1,1,'2015-03-27 00:03:58',266),(903,23.45,213,14,1,87,1,1,'2015-03-27 00:04:01',357),(904,122.52,200,14,5,87,1,0.632386549134835,'2015-03-27 00:04:09',281),(905,14.67,120,14,3,87,1,1,'2015-03-27 00:27:04',323),(906,1996.01,12,14,3,87,1,0.993988006072114,'2015-03-27 00:27:36',382),(907,384.51,250,14,4,87,1,0.349821851187225,'2015-03-27 00:28:07',398),(908,5998.3,24,14,4,87,1,0.995998866345465,'2015-03-27 00:29:09',301),(909,26.12,250,14,4,87,1,1,'2015-03-27 00:32:36',253),(910,39.57,52,14,5,87,1,0.314126863785696,'2015-03-27 00:33:09',368),(911,163.43,150,14,9,87,1,0.0821758551061617,'2015-03-27 00:33:40',286),(912,10.49,125,14,3,87,1,1,'2015-03-27 00:34:12',321),(913,3493.38,2000,14,4,87,1,0.427488564084068,'2015-03-27 00:34:25',394),(914,1263.45,1700,14,8,87,1,0.345522181328901,'2015-03-27 00:34:39',414),(915,3598.44,24,14,7,87,1,0.99333044319205,'2015-03-27 00:35:10',297),(916,41.35,36,14,6,87,1,0.129383313180169,'2015-03-27 00:35:21',260),(917,36.63,55,14,6,87,1,0.501501501501501,'2015-03-27 00:35:34',366),(918,163.43,1500,14,7,87,1,1,'2015-03-27 00:35:51',286),(919,20.97,1200,14,6,87,1,1,'2015-03-27 00:36:05',326),(920,2745.17,3000,14,5,87,1,0.0928284951387345,'2015-03-27 00:36:18',388),(921,988.93,0,14,5,87,1,1,'2015-03-27 00:36:29',409),(922,10796.22,152,14,4,87,1,0.985920998275322,'2015-03-27 00:39:02',309),(923,2743.62,456,14,3,87,1,0.833796225424804,'2015-03-27 10:30:33',388),(924,5.74,12,8,2,87,1,1,'2015-03-27 12:34:38',1112),(925,10.63,15,8,3,87,1,0.411100658513641,'2015-03-27 12:34:45',1122),(926,13.89,15,8,3,87,1,0.079913606911447,'2015-03-27 12:35:06',1132),(927,169.38,123,14,3,87,1,0.273822174991144,'2015-03-27 18:56:21',58),(928,9.85,13,8,3,88,1,0.319796954314721,'2015-03-28 17:07:51',1120),(929,104.5,95,9,6,92,1,0.0909090909090909,'2015-03-28 21:07:00',1054),(930,260,180,9,3,92,1,0.307692307692308,'2015-03-28 21:07:06',1091),(931,64,135,13,4,92,1,1,'2015-03-28 21:07:13',1226),(932,2,1.1,11,12,92,1,0.45,'2015-03-28 21:07:27',1183),(933,8,8,13,6,92,1,0,'2015-03-28 21:07:36',1223),(934,14,15,12,3,92,1,0.0714285714285714,'2015-03-28 21:07:41',1207),(935,5.47,15,5,5,92,1,1,'2015-03-28 21:08:42',679),(936,65,45,10,3,92,1,0.307692307692308,'2015-03-28 21:10:23',1155),(937,109.22,123,5,3,92,1,0.126167368613807,'2015-03-28 21:12:17',626),(938,8,8,12,4,92,1,0,'2015-03-28 21:12:24',1209),(939,15,15,12,3,92,1,0,'2015-03-28 21:12:30',1200),(940,6,10,12,3,92,1,0.666666666666667,'2015-03-28 21:12:35',1208),(941,11,15,12,2,92,1,0.363636363636364,'2015-03-28 21:12:40',1210),(942,2.53,2.2,11,4,92,1,0.130434782608696,'2015-03-28 21:12:47',1193),(943,32,64,13,5,92,1,1,'2015-03-28 21:12:55',1225),(944,27,9,13,3,92,1,0.666666666666667,'2015-03-28 21:13:21',1216),(945,207.06,45,3,2,92,1,0.782671689365401,'2015-03-28 21:13:52',995),(946,50.3,45,14,3,92,1,0.105367793240557,'2015-03-28 21:14:44',340),(947,15010.93,48,14,3,92,1,0.996802330035514,'2015-03-28 21:14:50',316),(948,3026.69,42,14,3,92,1,0.986123454995391,'2015-03-28 21:14:56',390),(949,53.8,25,14,5,92,1,0.535315985130111,'2015-03-28 21:15:04',242),(950,41.98,40,14,5,92,1,0.0471653168175321,'2015-03-28 21:15:12',21),(951,25.16,45,14,2,92,1,0.788553259141494,'2015-03-28 21:17:01',158),(952,4108.06,123,14,2,92,1,0.970058859899807,'2015-03-28 21:17:06',73),(953,1996.48,45,14,2,92,1,0.977460330181119,'2015-03-28 21:17:12',191),(954,49.19,123,14,2,92,1,1,'2015-03-28 21:19:05',272),(955,146.81,156,14,5,92,1,0.0625979156733192,'2015-03-28 21:19:14',54),(956,1428.88,123,14,2,92,1,0.913918593583786,'2015-03-28 21:34:51',417),(957,59.21,156,14,3,92,1,1,'2015-03-28 21:34:57',139),(958,52.28,156,14,3,92,1,1,'2015-03-28 21:35:04',265),(959,43.31,156,5,3,92,1,1,'2015-03-28 21:35:09',634),(960,50.39,123,5,6,92,1,1,'2015-03-28 21:35:18',602),(961,60.96,20,5,31,92,1,0.671916010498688,'2015-03-28 21:35:59',660),(962,108.27,65,5,3,92,1,0.399649025584188,'2015-03-28 21:36:04',671),(963,0.08,48,5,3,92,1,1,'2015-03-28 21:36:10',707),(964,38.07,52,14,3,92,1,0.365904912004203,'2015-03-28 21:36:16',367),(965,5.84,23,5,2,92,1,1,'2015-03-28 21:36:21',640),(966,4,15,12,4,92,1,1,'2015-03-28 21:42:32',1212),(967,104.5,100,9,8,93,1,0.0430622009569378,'2015-03-29 08:32:15',1054),(968,336.5,220,9,18,93,1,0.346210995542348,'2015-03-29 08:34:50',1074),(969,3,3,11,3,93,1,0,'2015-03-29 08:34:55',1185),(970,28.67,25,11,4,93,1,0.128008371119637,'2015-03-29 08:35:01',1192),(971,2.2,2,11,2,93,1,0.090909090909091,'2015-03-29 08:35:05',1182),(972,3,5,11,3,93,1,0.666666666666667,'2015-03-29 08:43:49',1185),(973,1.15,1.1,11,10,93,1,0.0434782608695651,'2015-03-29 08:44:01',1190),(974,3.24,5,11,7,93,1,0.54320987654321,'2015-03-29 08:44:10',1189),(975,2,2.3,11,5,93,1,0.15,'2015-03-29 08:44:16',1184),(976,17,20,12,3,93,1,0.176470588235294,'2015-03-29 08:44:22',1203),(977,24,25,12,3,93,1,0.0416666666666667,'2015-03-29 08:46:46',1206),(978,3.84,4,11,3,93,1,0.0416666666666667,'2015-03-29 08:46:51',1197),(979,3.6,4.5,11,5,93,1,0.25,'2015-03-29 08:46:58',1194),(980,1.36,1.1,11,3,93,1,0.191176470588235,'2015-03-29 08:47:03',1199),(981,3.83,3,11,3,93,1,0.216710182767624,'2015-03-29 08:47:08',1198),(982,7,6,12,2,93,1,0.142857142857143,'2015-03-29 09:14:29',1211),(983,20,20,12,2,93,1,0,'2015-03-29 09:14:33',1204),(984,15,18,12,2,93,1,0.2,'2015-03-29 09:14:38',1200),(985,8,6,12,3,93,1,0.25,'2015-03-29 09:14:42',1209),(986,11,123,8,3,93,1,1,'2015-03-29 10:09:46',1123),(987,12,12,8,2,93,1,0,'2015-03-29 10:10:18',1141),(988,7,7,8,4,93,1,0,'2015-03-29 10:21:36',1136),(989,8,8,8,3,93,1,0,'2015-03-29 10:22:23',1137),(990,9,9,8,2,93,1,0,'2015-03-29 10:26:56',1118),(991,3,3,8,2,93,1,0,'2015-03-29 10:28:05',1109),(992,8.06,6,8,2,93,1,0.255583126550869,'2015-03-29 10:28:29',1116),(993,20,123,12,13,93,1,1,'2015-03-29 10:51:56',1204),(994,4,4,12,6,93,1,0,'2015-03-29 10:52:04',1212),(995,24,25,12,4,93,1,0.0416666666666667,'2015-03-29 11:44:47',1206),(996,4,4,12,5,93,1,0,'2015-03-29 11:45:11',1212);
/*!40000 ALTER TABLE `learning_floatmodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learning_params`
--

DROP TABLE IF EXISTS `learning_params`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `learning_params` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL,
  `p1` varchar(20) NOT NULL,
  `p2` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `learning_params_403d8ff3` (`type_id`),
  CONSTRAINT `type_id_refs_id_2d615ddb5c7613ed` FOREIGN KEY (`type_id`) REFERENCES `learning_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning_params`
--

LOCK TABLES `learning_params` WRITE;
/*!40000 ALTER TABLE `learning_params` DISABLE KEYS */;
INSERT INTO `learning_params` VALUES (51,5,'m','yard'),(53,5,'inch','cm'),(54,14,'EUR','HUF'),(55,3,'pint','dm**3'),(56,14,'EUR','CHF'),(57,14,'EUR','PLN'),(58,14,'CZK','EUR'),(59,9,'inn','-1'),(60,5,'m','km'),(61,3,'cup','dl'),(62,5,'inch','dm'),(63,10,'50','110'),(64,3,'dm**3','cup'),(65,4,'ft**2','dm**2'),(66,4,'km**2','mile**2'),(67,3,'dl','cup'),(68,5,'cm','inch'),(69,5,'m','ft'),(70,3,'yard**3','m**3'),(71,3,'dl','pint'),(72,6,'degC','kelvin'),(73,4,'mile**2','are'),(74,5,'ft','dm'),(75,14,'EUR','RUB'),(76,14,'EUR','USD'),(77,4,'are','acre'),(78,4,'are','mile**2'),(79,14,'CZK','RUB'),(80,6,'degF','degC'),(81,4,'m**2','yard**2'),(82,14,'CZK','PLN'),(83,3,'dm**3','pint'),(84,5,'dm','inch'),(85,3,'pint','dl'),(86,5,'ft','m'),(87,4,'m**2','ft**2'),(88,14,'CZK','GBP'),(89,3,'tbsp','dl'),(90,3,'dm**3','tbsp'),(91,9,'out','-1'),(92,3,'m**3','ft**3'),(93,3,'dl','tbsp'),(94,4,'ft**2','m**2'),(95,14,'EUR','CZK'),(96,4,'mile**2','km**2'),(97,6,'degC','degF'),(98,14,'CZK','USD'),(99,14,'EUR','GBP'),(100,3,'dm**3','inch**3'),(101,3,'quart','dm**3'),(102,6,'degF','kelvin'),(103,3,'dm**3','quart'),(104,5,'yard','m'),(105,6,'kelvin','degF'),(106,4,'dm**2','ft**2'),(107,3,'cup','dm**3'),(108,4,'yard**2','m**2'),(109,4,'acre','are'),(110,4,'acre','km**2'),(111,4,'cm**2','inch**2'),(112,6,'kelvin','degC'),(113,8,'-1','-1'),(114,14,'CZK','CHF'),(115,5,'km','mile'),(116,3,'m**3','yard**3'),(117,4,'inch**2','cm**2'),(118,14,'CZK','HUF'),(119,5,'dm','ft'),(120,3,'ft**3','m**3'),(121,11,'50','-1'),(122,11,'132','-1'),(123,11,'80','-1'),(124,11,'99','-1'),(125,11,'73','-1'),(126,11,'110','-1'),(127,11,'115','-1'),(128,11,'86','-1'),(129,11,'72','-1'),(130,11,'96','-1'),(131,11,'46','-1'),(132,11,'15','-1'),(133,12,'5','5'),(134,12,'7','5'),(135,12,'1','10'),(136,12,'11','3'),(137,12,'3','9'),(138,12,'3','1'),(139,12,'5','1'),(140,12,'5','2'),(141,12,'3','2'),(142,12,'3','0'),(144,12,'3','4'),(145,13,'2','-1'),(146,13,'3','-1'),(147,13,'4','-1'),(148,13,'5','-1'),(149,13,'6','-1'),(150,13,'7','-1'),(151,13,'8','-1'),(152,13,'9','-1'),(153,13,'10','-1'),(154,7,'45*5',NULL),(155,7,'5*3*4',NULL),(156,7,'(18-6)*2',NULL),(157,7,'789 + 75',NULL),(158,7,'2659-423',NULL),(159,7,'(236*2)-695',NULL),(160,7,'4*0.95',NULL),(162,7,'2*0.6+1.95',NULL),(163,7,'10*1.95*0.2',NULL),(164,7,'(1+6+2+8)*2-3-14',NULL),(165,7,'659-235+5*13',NULL),(166,7,'6*0.23',NULL);
/*!40000 ALTER TABLE `learning_params` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learning_questions`
--

DROP TABLE IF EXISTS `learning_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `learning_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `question` (`question`)
) ENGINE=InnoDB AUTO_INCREMENT=513 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning_questions`
--

LOCK TABLES `learning_questions` WRITE;
/*!40000 ALTER TABLE `learning_questions` DISABLE KEYS */;
INSERT INTO `learning_questions` VALUES (61,-5),(63,-2.5),(64,0),(512,1),(261,2),(65,2.5),(220,3),(321,3.26),(345,3.89),(248,4),(221,4.23),(268,4.46),(322,4.52),(346,4.78),(379,4.79),(66,5),(222,5.46),(380,5.58),(347,5.67),(323,5.78),(354,6),(381,6.37),(348,6.56),(223,6.69),(269,6.92),(184,7),(324,7.04),(382,7.16),(349,7.45),(67,7.5),(224,7.92),(383,7.95),(420,8.21),(325,8.3),(350,8.34),(384,8.74),(185,9),(225,9.15),(351,9.23),(270,9.38),(385,9.53),(326,9.56),(36,10),(372,10.12),(386,10.32),(226,10.38),(327,10.82),(186,11),(353,11.01),(387,11.11),(227,11.61),(271,11.84),(388,11.9),(37,12),(328,12.08),(68,12.5),(389,12.69),(228,12.84),(339,12.94),(187,13),(329,13.34),(421,13.42),(390,13.48),(355,13.61),(333,13.72),(38,14),(229,14.07),(391,14.27),(272,14.3),(469,14.5),(449,14.58),(330,14.6),(69,15),(392,15.06),(366,15.21),(230,15.3),(393,15.85),(331,15.86),(39,16),(231,16.53),(394,16.64),(273,16.76),(188,17),(332,17.12),(70,17.5),(262,17.79),(411,17.96),(40,18),(373,18.24),(296,18.29),(422,18.63),(176,19),(438,19.19),(274,19.22),(242,19.45),(41,20),(450,20.16),(249,20.36),(401,20.42),(189,21),(356,21.22),(367,21.42),(275,21.68),(340,21.88),(42,22),(334,22.44),(71,22.5),(78,23),(232,23.34),(470,23.5),(423,23.84),(43,24),(72,25),(451,25.74),(44,26),(374,26.36),(412,26.92),(177,27),(255,27.36),(439,27.38),(73,27.5),(368,27.63),(45,28),(428,28.19),(215,28.34),(360,28.41),(357,28.83),(200,29),(424,29.05),(402,29.84),(46,30),(341,30.82),(178,31),(335,31.16),(452,31.32),(47,32),(74,32.5),(297,32.58),(79,33),(263,33.58),(369,33.84),(243,33.9),(48,34),(458,34.19),(425,34.26),(375,34.48),(75,35),(440,35.57),(413,35.88),(49,36),(429,36.38),(358,36.44),(250,36.72),(453,36.9),(198,37),(237,37.42),(76,37.5),(50,38),(179,39),(403,39.26),(426,39.47),(342,39.76),(336,39.88),(51,40),(370,40.05),(361,40.82),(201,41),(471,41.5),(233,41.68),(52,42),(454,42.48),(77,42.5),(376,42.6),(216,42.68),(80,43),(62,43.5),(441,43.76),(53,44),(359,44.05),(430,44.57),(427,44.68),(256,44.72),(414,44.84),(506,45),(54,46),(371,46.26),(459,46.38),(298,46.87),(180,47),(55,48),(455,48.06),(244,48.35),(337,48.6),(404,48.68),(343,48.7),(207,49),(264,49.37),(56,50),(472,50.5),(377,50.72),(181,51),(442,51.95),(57,52),(431,52.76),(81,53),(251,53.08),(362,53.23),(456,53.64),(415,53.8),(58,54),(238,54.84),(182,55),(59,56),(195,57),(217,57.02),(338,57.32),(344,57.64),(60,58),(405,58.1),(460,58.57),(378,58.84),(183,59),(457,59.22),(473,59.5),(507,60),(234,60.02),(443,60.14),(432,60.95),(299,61.16),(163,62),(257,62.08),(416,62.76),(245,62.8),(82,63),(474,64),(202,65),(265,65.16),(363,65.64),(191,66),(190,67),(406,67.52),(83,68),(444,68.33),(475,68.5),(213,69),(433,69.14),(252,69.44),(196,70),(461,70.76),(511,71),(218,71.36),(417,71.72),(239,72.26),(84,73),(164,74),(508,75),(300,75.45),(445,76.52),(407,76.94),(203,77),(246,77.25),(434,77.33),(476,77.5),(85,78),(364,78.05),(235,78.36),(212,79),(258,79.44),(165,80),(418,80.68),(266,80.95),(495,81),(192,82),(303,82.14),(462,82.95),(86,83),(446,84.71),(509,85),(435,85.52),(219,85.7),(253,85.8),(166,86),(408,86.36),(477,86.5),(214,87),(87,88),(204,89),(419,89.64),(240,89.68),(301,89.74),(193,90),(365,90.46),(208,91),(247,91.7),(167,92),(447,92.9),(88,93),(436,93.71),(211,95),(463,95.14),(478,95.5),(409,95.78),(197,96),(236,96.7),(267,96.74),(259,96.8),(199,97),(89,98),(286,100),(205,101),(448,101.09),(437,101.9),(254,102.16),(90,103),(168,104),(302,104.03),(479,104.5),(209,105),(410,105.2),(194,106),(241,107.1),(464,107.33),(91,108),(480,109),(169,110),(510,111),(109,113),(481,113.5),(260,114.16),(304,114.28),(170,116),(110,118),(210,119),(465,119.52),(496,121),(171,122),(482,122.5),(111,123),(206,125),(483,127),(112,128),(395,128.53),(497,129),(484,131.5),(466,131.71),(113,133),(172,134),(485,136),(498,137),(114,138),(173,140),(486,140.5),(115,143),(467,143.9),(504,144),(487,145),(174,146),(305,146.42),(116,148),(488,149.5),(175,152),(117,153),(489,154),(468,156.09),(118,158),(490,158.5),(499,161),(119,163),(491,167.5),(120,168),(500,169),(492,172),(121,173),(493,176.5),(501,177),(122,178),(306,178.56),(494,181),(123,183),(502,185),(310,185.14),(124,188),(125,193),(505,196),(126,198),(503,201),(127,203),(287,204.5),(396,207.06),(128,208),(307,210.7),(129,213),(130,218),(131,223),(132,228),(133,233),(134,238),(308,242.84),(135,243),(136,248),(137,253),(138,258),(139,263),(92,268),(311,270.28),(93,271),(140,273),(94,274),(309,274.98),(95,277),(141,278),(96,280),(97,283),(397,285.59),(98,286),(142,288),(99,289),(100,292),(143,293),(101,295),(102,298),(1,300),(103,301),(144,303),(104,304),(105,307),(145,308),(288,309),(106,310),(107,313),(108,316),(146,318),(147,323),(148,328),(149,333),(2,338),(150,343),(151,348),(152,353),(312,355.42),(153,358),(154,363),(398,364.12),(155,368),(156,373),(3,376),(157,378),(158,383),(159,388),(160,393),(161,398),(162,403),(289,413.5),(4,414),(313,440.56),(399,442.65),(5,452),(6,490),(276,500),(290,518),(400,521.18),(314,525.7),(7,528),(8,566),(9,604),(315,610.84),(291,622.5),(277,623),(10,642),(11,680),(316,695.98),(12,718),(292,727),(278,746),(13,756),(317,781.12),(14,794),(293,831.5),(15,832),(318,866.26),(279,869),(16,870),(17,908),(294,936),(18,946),(319,951.4),(19,984),(280,992),(20,1022),(320,1036.54),(295,1040.5),(21,1060),(22,1098),(281,1115),(23,1136),(24,1174),(25,1212),(282,1238),(26,1250),(27,1288),(28,1326),(283,1361),(29,1364),(30,1402),(31,1440),(32,1478),(284,1484),(33,1516),(34,1554),(35,1592),(285,1607);
/*!40000 ALTER TABLE `learning_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learning_type`
--

DROP TABLE IF EXISTS `learning_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `learning_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(8) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning_type`
--

LOCK TABLES `learning_type` WRITE;
/*!40000 ALTER TABLE `learning_type` DISABLE KEYS */;
INSERT INTO `learning_type` VALUES (9,'angle'),(2,'c'),(14,'curr'),(1,'e'),(7,'equa'),(5,'len'),(11,'line'),(12,'obj'),(13,'sqr'),(8,'sqrt'),(4,'surf'),(6,'temp'),(3,'vol'),(10,'water');
/*!40000 ALTER TABLE `learning_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learning_userskill`
--

DROP TABLE IF EXISTS `learning_userskill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `learning_userskill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `skill` double NOT NULL,
  `concept_id` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT '2015-03-20 22:57:25',
  PRIMARY KEY (`id`),
  KEY `learning_userskill_6340c63c` (`user_id`),
  KEY `learning_userskill_8a386586` (`concept_id`),
  CONSTRAINT `concept_id_refs_id_29dadd40f906e7ce` FOREIGN KEY (`concept_id`) REFERENCES `learning_params` (`id`),
  CONSTRAINT `user_id_refs_id_36ffc26e7528aad` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1636 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning_userskill`
--

LOCK TABLES `learning_userskill` WRITE;
/*!40000 ALTER TABLE `learning_userskill` DISABLE KEYS */;
INSERT INTO `learning_userskill` VALUES (1321,87,0,79,1,'2015-03-26 22:10:13'),(1322,87,0,82,4,'2015-03-27 18:56:21'),(1323,87,0,58,1,'2015-03-26 22:23:53'),(1324,87,0,72,1,'2015-03-26 22:09:05'),(1325,87,0,80,0,'2015-03-26 22:09:00'),(1326,87,0,97,0,'2015-03-26 22:09:00'),(1327,87,0,102,0,'2015-03-26 22:09:00'),(1328,87,0,105,0,'2015-03-26 22:09:00'),(1329,87,0,112,0,'2015-03-26 22:09:00'),(1330,87,0,54,8,'2015-03-27 00:39:02'),(1331,87,0,56,7,'2015-03-27 00:36:05'),(1332,87,0,57,7,'2015-03-27 00:35:51'),(1333,87,0,75,8,'2015-03-27 10:30:33'),(1334,87,0,76,7,'2015-03-27 00:35:22'),(1335,87,0,95,7,'2015-03-27 00:36:29'),(1336,87,0,99,7,'2015-03-27 00:35:34'),(1337,87,0,88,2,'2015-03-26 22:17:50'),(1338,87,0,98,0,'2015-03-26 22:09:24'),(1339,87,0,114,0,'2015-03-26 22:09:24'),(1340,87,0,118,0,'2015-03-26 22:09:24'),(1341,87,0.13722748623963,113,3,'2015-03-27 12:35:06'),(1342,87,0,55,0,'2015-03-27 12:34:04'),(1343,87,0,61,0,'2015-03-27 12:34:05'),(1344,87,0,64,0,'2015-03-27 12:34:05'),(1345,87,0,67,0,'2015-03-27 12:34:05'),(1346,87,0,70,0,'2015-03-27 12:34:05'),(1347,87,0,71,0,'2015-03-27 12:34:05'),(1348,87,0,83,0,'2015-03-27 12:34:05'),(1349,87,0,85,0,'2015-03-27 12:34:05'),(1350,87,0,89,0,'2015-03-27 12:34:05'),(1351,87,0,90,0,'2015-03-27 12:34:05'),(1352,87,0,92,0,'2015-03-27 12:34:05'),(1353,87,0,93,0,'2015-03-27 12:34:05'),(1354,87,0,100,0,'2015-03-27 12:34:05'),(1355,87,0,101,0,'2015-03-27 12:34:05'),(1356,87,0,103,0,'2015-03-27 12:34:05'),(1357,87,0,107,0,'2015-03-27 12:34:05'),(1358,87,0,116,0,'2015-03-27 12:34:05'),(1359,87,0,120,0,'2015-03-27 12:34:05'),(1360,88,0,113,1,'2015-03-28 17:07:51'),(1361,88,0,54,0,'2015-03-28 17:31:20'),(1362,88,0,56,0,'2015-03-28 17:31:20'),(1363,88,0,57,0,'2015-03-28 17:31:20'),(1364,88,0,58,0,'2015-03-28 17:31:20'),(1365,88,0,75,0,'2015-03-28 17:31:20'),(1366,88,0,76,0,'2015-03-28 17:31:20'),(1367,88,0,79,0,'2015-03-28 17:31:20'),(1368,88,0,82,0,'2015-03-28 17:31:20'),(1369,88,0,88,0,'2015-03-28 17:31:21'),(1370,88,0,95,0,'2015-03-28 17:31:21'),(1371,88,0,98,0,'2015-03-28 17:31:21'),(1372,88,0,99,0,'2015-03-28 17:31:21'),(1373,88,0,114,0,'2015-03-28 17:31:21'),(1374,88,0,118,0,'2015-03-28 17:31:21'),(1375,88,0,133,0,'2015-03-28 17:32:40'),(1376,88,0,134,0,'2015-03-28 17:32:41'),(1377,88,0,135,0,'2015-03-28 17:32:41'),(1378,88,0,136,0,'2015-03-28 17:32:41'),(1379,88,0,137,0,'2015-03-28 17:32:41'),(1380,88,0,138,0,'2015-03-28 17:32:41'),(1381,88,0,139,0,'2015-03-28 17:32:41'),(1382,88,0,140,0,'2015-03-28 17:32:41'),(1383,88,0,141,0,'2015-03-28 17:32:41'),(1384,88,0,142,0,'2015-03-28 17:32:41'),(1385,88,0,144,0,'2015-03-28 17:32:41'),(1386,88,0,51,0,'2015-03-28 20:57:17'),(1387,88,0,53,0,'2015-03-28 20:57:17'),(1388,88,0,60,0,'2015-03-28 20:57:17'),(1389,88,0,62,0,'2015-03-28 20:57:17'),(1390,88,0,68,0,'2015-03-28 20:57:17'),(1391,88,0,69,0,'2015-03-28 20:57:17'),(1392,88,0,74,0,'2015-03-28 20:57:17'),(1393,88,0,84,0,'2015-03-28 20:57:17'),(1394,88,0,86,0,'2015-03-28 20:57:17'),(1395,88,0,104,0,'2015-03-28 20:57:18'),(1396,88,0,115,0,'2015-03-28 20:57:18'),(1397,88,0,119,0,'2015-03-28 20:57:18'),(1398,88,0,65,0,'2015-03-28 20:57:18'),(1399,88,0,66,0,'2015-03-28 20:57:18'),(1400,88,0,73,0,'2015-03-28 20:57:18'),(1401,88,0,77,0,'2015-03-28 20:57:18'),(1402,88,0,78,0,'2015-03-28 20:57:18'),(1403,88,0,81,0,'2015-03-28 20:57:18'),(1404,88,0,87,0,'2015-03-28 20:57:18'),(1405,88,0,94,0,'2015-03-28 20:57:18'),(1406,88,0,96,0,'2015-03-28 20:57:18'),(1407,88,0,106,0,'2015-03-28 20:57:18'),(1408,88,0,108,0,'2015-03-28 20:57:18'),(1409,88,0,109,0,'2015-03-28 20:57:18'),(1410,88,0,110,0,'2015-03-28 20:57:18'),(1411,88,0,111,0,'2015-03-28 20:57:18'),(1412,88,0,117,0,'2015-03-28 20:57:18'),(1413,88,0,72,0,'2015-03-28 20:57:18'),(1414,88,0,80,0,'2015-03-28 20:57:18'),(1415,88,0,97,0,'2015-03-28 20:57:19'),(1416,88,0,102,0,'2015-03-28 20:57:19'),(1417,88,0,105,0,'2015-03-28 20:57:19'),(1418,88,0,112,0,'2015-03-28 20:57:19'),(1419,88,0,55,0,'2015-03-28 20:57:19'),(1420,88,0,61,0,'2015-03-28 20:57:19'),(1421,88,0,64,0,'2015-03-28 20:57:19'),(1422,88,0,67,0,'2015-03-28 20:57:19'),(1423,88,0,70,0,'2015-03-28 20:57:19'),(1424,88,0,71,0,'2015-03-28 20:57:19'),(1425,88,0,83,0,'2015-03-28 20:57:19'),(1426,88,0,85,0,'2015-03-28 20:57:19'),(1427,88,0,89,0,'2015-03-28 20:57:19'),(1428,88,0,90,0,'2015-03-28 20:57:19'),(1429,88,0,92,0,'2015-03-28 20:57:19'),(1430,88,0,93,0,'2015-03-28 20:57:19'),(1431,88,0,100,0,'2015-03-28 20:57:19'),(1432,88,0,101,0,'2015-03-28 20:57:19'),(1433,88,0,103,0,'2015-03-28 20:57:19'),(1434,88,0,107,0,'2015-03-28 20:57:19'),(1435,88,0,116,0,'2015-03-28 20:57:20'),(1436,88,0,120,0,'2015-03-28 20:57:20'),(1437,92,0,59,1,'2015-03-28 21:07:00'),(1438,92,0,91,1,'2015-03-28 21:07:06'),(1439,92,0,54,1,'2015-03-28 21:14:50'),(1440,92,0,56,1,'2015-03-28 21:14:44'),(1441,92,0,57,1,'2015-03-28 21:19:06'),(1442,92,0,58,1,'2015-03-28 21:15:04'),(1443,92,0,75,1,'2015-03-28 21:14:56'),(1444,92,0,76,1,'2015-03-28 21:35:04'),(1445,92,0,79,1,'2015-03-28 21:17:12'),(1446,92,0,82,1,'2015-03-28 21:19:14'),(1447,92,0,88,1,'2015-03-28 21:17:01'),(1448,92,0,95,1,'2015-03-28 21:34:51'),(1449,92,0,98,1,'2015-03-28 21:15:12'),(1450,92,0,99,1,'2015-03-28 21:36:16'),(1451,92,0,114,1,'2015-03-28 21:34:58'),(1452,92,0,118,1,'2015-03-28 21:17:06'),(1453,92,0,51,1,'2015-03-28 21:08:42'),(1454,92,0,53,1,'2015-03-28 21:12:17'),(1455,92,0,60,1,'2015-03-28 21:36:10'),(1456,92,0,62,1,'2015-03-28 21:36:21'),(1457,92,0,68,1,'2015-03-28 21:35:18'),(1458,92,0,69,1,'2015-03-28 21:36:04'),(1459,92,0,74,1,'2015-03-28 21:35:59'),(1460,92,0,84,1,'2015-03-28 21:35:09'),(1461,92,0,86,0,'2015-03-28 21:06:51'),(1462,92,0,104,0,'2015-03-28 21:06:51'),(1463,92,0,115,0,'2015-03-28 21:06:51'),(1464,92,0,119,0,'2015-03-28 21:06:51'),(1465,92,0,121,1,'2015-03-28 21:07:28'),(1466,92,0,122,0,'2015-03-28 21:06:51'),(1467,92,0,123,0,'2015-03-28 21:06:51'),(1468,92,0,124,0,'2015-03-28 21:06:51'),(1469,92,0,125,0,'2015-03-28 21:06:51'),(1470,92,0,126,0,'2015-03-28 21:06:51'),(1471,92,0,127,0,'2015-03-28 21:06:51'),(1472,92,0,128,1,'2015-03-28 21:12:48'),(1473,92,0,129,0,'2015-03-28 21:06:51'),(1474,92,0,130,0,'2015-03-28 21:06:51'),(1475,92,0,131,0,'2015-03-28 21:06:51'),(1476,92,0,132,0,'2015-03-28 21:06:51'),(1477,92,1,133,1,'2015-03-28 21:12:30'),(1478,92,0,134,0,'2015-03-28 21:06:51'),(1479,92,0,135,0,'2015-03-28 21:06:51'),(1480,92,0,136,0,'2015-03-28 21:06:51'),(1481,92,0,137,1,'2015-03-28 21:07:42'),(1482,92,0,138,1,'2015-03-28 21:12:36'),(1483,92,1,139,1,'2015-03-28 21:12:24'),(1484,92,0,140,1,'2015-03-28 21:12:40'),(1485,92,0,141,0,'2015-03-28 21:06:51'),(1486,92,0,142,1,'2015-03-28 21:42:33'),(1487,92,0,144,0,'2015-03-28 21:06:51'),(1488,92,0,145,0,'2015-03-28 21:06:51'),(1489,92,0.775946944983213,146,2,'2015-03-28 21:13:21'),(1490,92,0,147,0,'2015-03-28 21:06:52'),(1491,92,0,148,1,'2015-03-28 21:12:55'),(1492,92,0,149,1,'2015-03-28 21:07:13'),(1493,92,0,150,0,'2015-03-28 21:06:52'),(1494,92,0,151,0,'2015-03-28 21:06:52'),(1495,92,0,152,0,'2015-03-28 21:06:52'),(1496,92,0,153,0,'2015-03-28 21:06:52'),(1497,92,0,113,0,'2015-03-28 21:06:52'),(1498,92,0,65,0,'2015-03-28 21:06:52'),(1499,92,0,66,0,'2015-03-28 21:06:52'),(1500,92,0,73,0,'2015-03-28 21:06:52'),(1501,92,0,77,0,'2015-03-28 21:06:52'),(1502,92,0,78,0,'2015-03-28 21:06:52'),(1503,92,0,81,0,'2015-03-28 21:06:52'),(1504,92,0,87,0,'2015-03-28 21:06:52'),(1505,92,0,94,0,'2015-03-28 21:06:52'),(1506,92,0,96,0,'2015-03-28 21:06:52'),(1507,92,0,106,0,'2015-03-28 21:06:52'),(1508,92,0,108,0,'2015-03-28 21:06:52'),(1509,92,0,109,0,'2015-03-28 21:06:52'),(1510,92,0,110,0,'2015-03-28 21:06:52'),(1511,92,0,111,0,'2015-03-28 21:06:53'),(1512,92,0,117,0,'2015-03-28 21:06:53'),(1513,92,0,72,0,'2015-03-28 21:06:53'),(1514,92,0,80,0,'2015-03-28 21:06:53'),(1515,92,0,97,0,'2015-03-28 21:06:53'),(1516,92,0,102,0,'2015-03-28 21:06:53'),(1517,92,0,105,0,'2015-03-28 21:06:53'),(1518,92,0,112,0,'2015-03-28 21:06:53'),(1519,92,0,55,0,'2015-03-28 21:06:53'),(1520,92,0,61,0,'2015-03-28 21:06:53'),(1521,92,0,64,0,'2015-03-28 21:06:53'),(1522,92,0,67,0,'2015-03-28 21:06:53'),(1523,92,0,70,0,'2015-03-28 21:06:53'),(1524,92,0,71,0,'2015-03-28 21:06:53'),(1525,92,0,83,0,'2015-03-28 21:06:53'),(1526,92,0,85,1,'2015-03-28 21:13:52'),(1527,92,0,89,0,'2015-03-28 21:06:53'),(1528,92,0,90,0,'2015-03-28 21:06:53'),(1529,92,0,92,0,'2015-03-28 21:06:53'),(1530,92,0,93,0,'2015-03-28 21:06:53'),(1531,92,0,100,0,'2015-03-28 21:06:53'),(1532,92,0,101,0,'2015-03-28 21:06:53'),(1533,92,0,103,0,'2015-03-28 21:06:54'),(1534,92,0,107,0,'2015-03-28 21:06:54'),(1535,92,0,116,0,'2015-03-28 21:06:54'),(1536,92,0,120,0,'2015-03-28 21:06:54'),(1537,92,0,63,1,'2015-03-28 21:10:23'),(1538,93,0,59,1,'2015-03-29 08:32:15'),(1539,93,0,91,1,'2015-03-29 08:34:51'),(1540,93,0,54,0,'2015-03-29 08:18:26'),(1541,93,0,56,0,'2015-03-29 08:18:26'),(1542,93,0,57,0,'2015-03-29 08:18:26'),(1543,93,0,58,0,'2015-03-29 08:18:26'),(1544,93,0,75,0,'2015-03-29 08:18:26'),(1545,93,0,76,0,'2015-03-29 08:18:26'),(1546,93,0,79,0,'2015-03-29 08:18:26'),(1547,93,0,82,0,'2015-03-29 08:18:26'),(1548,93,0,88,0,'2015-03-29 08:18:26'),(1549,93,0,95,0,'2015-03-29 08:18:26'),(1550,93,0,98,0,'2015-03-29 08:18:26'),(1551,93,0,99,0,'2015-03-29 08:18:26'),(1552,93,0,114,0,'2015-03-29 08:18:26'),(1553,93,0,118,0,'2015-03-29 08:18:26'),(1554,93,0,51,0,'2015-03-29 08:18:26'),(1555,93,0,53,0,'2015-03-29 08:18:27'),(1556,93,0,60,0,'2015-03-29 08:18:27'),(1557,93,0,62,0,'2015-03-29 08:18:27'),(1558,93,0,68,0,'2015-03-29 08:18:27'),(1559,93,0,69,0,'2015-03-29 08:18:27'),(1560,93,0,74,0,'2015-03-29 08:18:27'),(1561,93,0,84,0,'2015-03-29 08:18:27'),(1562,93,0,86,0,'2015-03-29 08:18:27'),(1563,93,0,104,0,'2015-03-29 08:18:27'),(1564,93,0,115,0,'2015-03-29 08:18:27'),(1565,93,0,119,0,'2015-03-29 08:18:27'),(1566,93,0,121,0,'2015-03-29 08:18:27'),(1567,93,0,122,1,'2015-03-29 08:35:05'),(1568,93,0,123,1,'2015-03-29 08:44:16'),(1569,93,0.456832529820278,124,2,'2015-03-29 08:43:49'),(1570,93,0,125,0,'2015-03-29 08:18:27'),(1571,93,0,126,1,'2015-03-29 08:44:10'),(1572,93,0,127,1,'2015-03-29 08:44:01'),(1573,93,0,128,1,'2015-03-29 08:35:01'),(1574,93,0,129,1,'2015-03-29 08:46:58'),(1575,93,0,130,1,'2015-03-29 08:46:51'),(1576,93,0,131,1,'2015-03-29 08:47:08'),(1577,93,0,132,1,'2015-03-29 08:47:03'),(1578,93,0,133,1,'2015-03-29 09:14:38'),(1579,93,0,134,0,'2015-03-29 08:18:28'),(1580,93,0,135,1,'2015-03-29 08:44:22'),(1581,93,0.572988661347861,136,2,'2015-03-29 10:51:56'),(1582,93,0.0223228951721921,137,2,'2015-03-29 11:44:47'),(1583,93,0,138,0,'2015-03-29 08:18:28'),(1584,93,0,139,1,'2015-03-29 09:14:42'),(1585,93,0,140,0,'2015-03-29 08:18:28'),(1586,93,0,141,1,'2015-03-29 09:14:30'),(1587,93,1,142,2,'2015-03-29 11:45:11'),(1588,93,0,144,0,'2015-03-29 08:18:28'),(1589,93,0,145,0,'2015-03-29 08:18:28'),(1590,93,0,146,0,'2015-03-29 08:18:28'),(1591,93,0,147,0,'2015-03-29 08:18:28'),(1592,93,0,148,0,'2015-03-29 08:18:28'),(1593,93,0,149,0,'2015-03-29 08:18:28'),(1594,93,0,150,0,'2015-03-29 08:18:28'),(1595,93,0,151,0,'2015-03-29 08:18:28'),(1596,93,0,152,0,'2015-03-29 08:18:29'),(1597,93,0,153,0,'2015-03-29 08:18:29'),(1598,93,0.994055998796047,113,7,'2015-03-29 10:28:29'),(1599,93,0,72,0,'2015-03-29 08:18:29'),(1600,93,0,80,0,'2015-03-29 08:18:29'),(1601,93,0,97,0,'2015-03-29 08:18:29'),(1602,93,0,102,0,'2015-03-29 08:18:29'),(1603,93,0,105,0,'2015-03-29 08:18:29'),(1604,93,0,112,0,'2015-03-29 08:18:29'),(1605,93,0,55,0,'2015-03-29 08:18:29'),(1606,93,0,61,0,'2015-03-29 08:18:29'),(1607,93,0,64,0,'2015-03-29 08:18:29'),(1608,93,0,67,0,'2015-03-29 08:18:29'),(1609,93,0,70,0,'2015-03-29 08:18:29'),(1610,93,0,71,0,'2015-03-29 08:18:29'),(1611,93,0,83,0,'2015-03-29 08:18:29'),(1612,93,0,85,0,'2015-03-29 08:18:29'),(1613,93,0,89,0,'2015-03-29 08:18:30'),(1614,93,0,90,0,'2015-03-29 08:18:30'),(1615,93,0,92,0,'2015-03-29 08:18:30'),(1616,93,0,93,0,'2015-03-29 08:18:30'),(1617,93,0,100,0,'2015-03-29 08:18:30'),(1618,93,0,101,0,'2015-03-29 08:18:30'),(1619,93,0,103,0,'2015-03-29 08:18:30'),(1620,93,0,107,0,'2015-03-29 08:18:30'),(1621,93,0,116,0,'2015-03-29 08:18:30'),(1622,93,0,120,0,'2015-03-29 08:18:30'),(1623,93,0,63,0,'2015-03-29 08:18:30'),(1624,93,0,154,0,'2015-03-29 12:41:12'),(1625,93,0,155,0,'2015-03-29 12:41:12'),(1626,93,0,156,0,'2015-03-29 12:41:12'),(1627,93,0,157,0,'2015-03-29 12:41:12'),(1628,93,0,158,0,'2015-03-29 12:41:12'),(1629,93,0,159,0,'2015-03-29 12:41:12'),(1630,93,0,160,0,'2015-03-29 12:41:12'),(1631,93,0,162,0,'2015-03-29 12:41:12'),(1632,93,0,163,0,'2015-03-29 12:41:12'),(1633,93,0,164,0,'2015-03-29 12:41:12'),(1634,93,0,165,0,'2015-03-29 12:41:12'),(1635,93,0,166,0,'2015-03-29 12:41:12');
/*!40000 ALTER TABLE `learning_userskill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_association`
--

DROP TABLE IF EXISTS `social_auth_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_association` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `secret` varchar(255) NOT NULL,
  `issued` int(11) NOT NULL,
  `lifetime` int(11) NOT NULL,
  `assoc_type` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_association_server_url_17bf7e87f2968244_uniq` (`server_url`,`handle`),
  KEY `social_auth_association_93d95bdf` (`issued`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_association`
--

LOCK TABLES `social_auth_association` WRITE;
/*!40000 ALTER TABLE `social_auth_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_nonce`
--

DROP TABLE IF EXISTS `social_auth_nonce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_nonce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `salt` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_nonce_server_url_36601f978463b4_uniq` (`server_url`,`timestamp`,`salt`),
  KEY `social_auth_nonce_d80b9c9a` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_nonce`
--

LOCK TABLES `social_auth_nonce` WRITE;
/*!40000 ALTER TABLE `social_auth_nonce` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_nonce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_usersocialauth`
--

DROP TABLE IF EXISTS `social_auth_usersocialauth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_usersocialauth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `provider` varchar(32) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `extra_data` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_usersocialauth_provider_2f763109e2c4a1fb_uniq` (`provider`,`uid`),
  KEY `social_auth_usersocialauth_6340c63c` (`user_id`),
  CONSTRAINT `user_id_refs_id_529c317860fa311b` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_usersocialauth`
--

LOCK TABLES `social_auth_usersocialauth` WRITE;
/*!40000 ALTER TABLE `social_auth_usersocialauth` DISABLE KEYS */;
INSERT INTO `social_auth_usersocialauth` VALUES (1,52,'google-oauth2','romanorlicek@gmail.com','{\"token_type\": \"Bearer\", \"access_token\": \"ya29.NwG_piGYwLPe95qImAS_F4M-cig51ZD0ryKTxSIccWmH254aQumTOUvv1_gWFqGR8fOOIcIkKlzfdQ\", \"expires\": 3599}'),(2,56,'facebook','10203563218471343','{\"access_token\": \"CAAUTA1LvWzIBAOLUhnubd3Mdy7swZAeUcT4WWzCyw4ZAM2MPNAWKZBY7UOYzHRwxr2POngZCEYXKn5TbO6WLeCIKZAGsBQZBo1ZAipaBDk6NXalSlaAF60iMm74MQcNkG8Uyx37PNJAcH0WOQu6oRS9Hr82SwmBWOwdo2Iv4WnxQE6eVOZBzNxd4ttYrF8PxlLxnDSja8IxnNNbSGFhYz8On\", \"expires\": \"5183122\", \"id\": \"10203563218471343\"}');
/*!40000 ALTER TABLE `social_auth_usersocialauth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `south_migrationhistory`
--

DROP TABLE IF EXISTS `south_migrationhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `south_migrationhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(255) NOT NULL,
  `migration` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `south_migrationhistory`
--

LOCK TABLES `south_migrationhistory` WRITE;
/*!40000 ALTER TABLE `south_migrationhistory` DISABLE KEYS */;
INSERT INTO `south_migrationhistory` VALUES (1,'learning','0001_initial','2015-02-27 15:41:50'),(4,'learning','0003_auto__add_field_concept_params','2015-03-07 15:29:23'),(5,'learning','0004_auto__add_field_params_type','2015-03-07 15:30:15'),(6,'learning','0005_auto__add_field_params_p1','2015-03-07 15:30:58'),(7,'learning','0006_auto__add_field_params_p2','2015-03-07 15:31:17'),(8,'learning','0007_auto__del_field_params_param','2015-03-07 15:49:53'),(9,'learning','0008_auto__del_field_concept_param1','2015-03-07 15:51:00'),(10,'learning','0009_auto__del_field_concept_param2','2015-03-07 15:51:38'),(11,'learning','0010_auto__del_field_userskill_type__add_field_userskill_concept','2015-03-07 15:58:25'),(12,'learning','0011_auto__chg_field_userskill_concept','2015-03-07 15:59:33'),(13,'learning','0012_auto__add_field_concept_label','2015-03-07 16:22:30'),(14,'learning','0013_auto__add_field_userskill_number__add_field_userskill_date','2015-03-07 16:59:11'),(15,'learning','0014_auto__chg_field_params_p2','2015-03-09 18:41:04'),(16,'lazysignup','0001_initial','2015-03-11 20:25:48'),(17,'lazysignup','0002_auto__add_field_lazyuser_created','2015-03-11 20:25:49'),(18,'lazysignup','0003_auto','2015-03-11 22:38:20'),(19,'lazysignup','0004_initial','2015-03-11 22:48:26'),(20,'social_auth','0001_initial','2015-03-12 10:27:22'),(21,'social_auth','0002_auto__add_unique_nonce_timestamp_salt_server_url__add_unique_associati','2015-03-12 10:27:22'),(22,'social_auth','0003_initial','2015-03-12 10:29:21'),(23,'social_auth','0004_auto__chg_field_usersocialauth_uid__chg_field_nonce_server_url__chg_fi','2015-03-14 11:16:32'),(24,'social_auth','0005_auto__chg_field_usersocialauth_uid','2015-03-14 13:38:01'),(25,'social_auth','0006_auto__chg_field_nonce_server_url__chg_field_association_handle__chg_fi','2015-03-14 13:42:48'),(26,'social_auth','0007_initial','2015-03-14 13:47:04'),(27,'learning','0015_auto__add_field_concept_updatedTimes','2015-03-16 14:15:03'),(28,'learning','0016_auto__chg_field_floatmodel_date','2015-03-20 21:25:14'),(29,'learning','0017_auto__chg_field_floatmodel_date__chg_field_userskill_date','2015-03-20 22:34:11'),(30,'learning','0018_auto__add_currtable','2015-03-28 08:33:27'),(31,'learning','0019_auto__chg_field_concept_question','2015-03-29 12:37:42');
/*!40000 ALTER TABLE `south_migrationhistory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-29 14:48:40
