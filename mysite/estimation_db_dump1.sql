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
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add migration history',1,'add_migrationhistory'),(2,'Can change migration history',1,'change_migrationhistory'),(3,'Can delete migration history',1,'delete_migrationhistory'),(4,'Can add log entry',2,'add_logentry'),(5,'Can change log entry',2,'change_logentry'),(6,'Can delete log entry',2,'delete_logentry'),(7,'Can add permission',3,'add_permission'),(8,'Can change permission',3,'change_permission'),(9,'Can delete permission',3,'delete_permission'),(10,'Can add group',4,'add_group'),(11,'Can change group',4,'change_group'),(12,'Can delete group',4,'delete_group'),(13,'Can add user',5,'add_user'),(14,'Can change user',5,'change_user'),(15,'Can delete user',5,'delete_user'),(16,'Can add content type',6,'add_contenttype'),(17,'Can change content type',6,'change_contenttype'),(18,'Can delete content type',6,'delete_contenttype'),(19,'Can add session',7,'add_session'),(20,'Can change session',7,'change_session'),(21,'Can delete session',7,'delete_session'),(22,'Can add float model',8,'add_floatmodel'),(23,'Can change float model',8,'change_floatmodel'),(24,'Can delete float model',8,'delete_floatmodel'),(25,'Can add concept',9,'add_concept'),(26,'Can change concept',9,'change_concept'),(27,'Can delete concept',9,'delete_concept'),(28,'Can add params',10,'add_params'),(29,'Can change params',10,'change_params'),(30,'Can delete params',10,'delete_params'),(31,'Can add questions',11,'add_questions'),(32,'Can change questions',11,'change_questions'),(33,'Can delete questions',11,'delete_questions'),(34,'Can add type',12,'add_type'),(35,'Can change type',12,'change_type'),(36,'Can delete type',12,'delete_type'),(37,'Can add user skill',13,'add_userskill'),(38,'Can change user skill',13,'change_userskill'),(39,'Can delete user skill',13,'delete_userskill'),(40,'Can add lazy user',14,'add_lazyuser'),(41,'Can change lazy user',14,'change_lazyuser'),(42,'Can delete lazy user',14,'delete_lazyuser'),(43,'Can add user social auth',15,'add_usersocialauth'),(44,'Can change user social auth',15,'change_usersocialauth'),(45,'Can delete user social auth',15,'delete_usersocialauth'),(46,'Can add nonce',16,'add_nonce'),(47,'Can change nonce',16,'change_nonce'),(48,'Can delete nonce',16,'delete_nonce'),(49,'Can add association',17,'add_association'),(50,'Can change association',17,'change_association'),(51,'Can delete association',17,'delete_association');
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
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$12000$doFwarO6PiBs$PsDq1mjUaFQcn6yckm12YD1Ic8KP0Spy6lC3e1hAodY=','2015-02-27 15:41:04',1,'admin','','','stone99@azet.sk',1,1,'2015-02-27 15:41:04'),(2,'pbkdf2_sha256$12000$peTSyG1leHbY$pwG8zbtYMf7JeJOB6p7NrtkTz3WX+8mAd1rePtle+30=','2015-03-13 18:07:06',0,'tester','','','tester@azet.sk',0,1,'2015-03-07 17:39:23'),(52,'!81zrdrzwxOc1OSII3q5UDtvqp0QR9nILyW5tloDh','2015-03-15 23:47:56',0,'romanorlicek1c04f8ac7f5d41ab','Roman','Orlíček','romanorlicek@gmail.com',0,1,'2015-03-14 13:47:29'),(53,'!22qUzYeSjFBvLbxUffxQHweUKMl3i7HtjNBmfUm4','2015-03-15 11:47:58',0,'d3c9e49101794b78b0cab3d76b4b92','','','',0,1,'2015-03-15 11:47:57'),(54,'!VjzvcqnlRxy3MNvRZxEfM8NNNj4uHwo3q99cksVi','2015-03-15 11:48:27',0,'b96a1e87480245359d0fa51c608868','','','',0,1,'2015-03-15 11:48:27'),(55,'!qHLHFJS4CcL4WrlyHpVIfyu5aorgFAuBR8sfSMWn','2015-03-15 11:59:08',0,'eeb4fe5d13ae40299561ea507c74d1','','','',0,1,'2015-03-15 11:59:08'),(56,'!DbPLU3vRv2lq3VOY93rEIBfW4d4uwTaTZGK0xkFB','2015-03-15 23:40:35',0,'RomanOrlíček','Roman','Orlíček','',0,1,'2015-03-15 23:40:35'),(57,'!IGDJAuO5fqX43UXhMoKetJYE78AwneLAM47qx4u5','2015-03-15 23:43:57',0,'550e9cc766ac4042988e00950ad7e6','','','',0,1,'2015-03-15 23:43:57'),(58,'!VsXXnzIsA6rUmNpO6zfZZD7glKyA3IvoSixlr3Id','2015-03-15 23:46:55',0,'46f7264676fb4839a94768546bea6b','','','',0,1,'2015-03-15 23:46:55'),(59,'!4Da5FWN0pAXLTAlhKbItGYfxYja7DzpUOKqLJHZv','2015-03-17 12:57:18',0,'031844e1bfb845688d51e4ca2df691','','','',0,1,'2015-03-17 12:57:18');
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'migration history','south','migrationhistory'),(2,'log entry','admin','logentry'),(3,'permission','auth','permission'),(4,'group','auth','group'),(5,'user','auth','user'),(6,'content type','contenttypes','contenttype'),(7,'session','sessions','session'),(8,'float model','learning','floatmodel'),(9,'concept','learning','concept'),(10,'params','learning','params'),(11,'questions','learning','questions'),(12,'type','learning','type'),(13,'user skill','learning','userskill'),(14,'lazy user','lazysignup','lazyuser'),(15,'user social auth','social_auth','usersocialauth'),(16,'nonce','social_auth','nonce'),(17,'association','social_auth','association');
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
INSERT INTO `django_session` VALUES ('1vy346i6kmuo5qlu8f7h0ep9pvxy7s6a','MzM1ZDgyNmI1ZDY1MWRhOGE3MTVjNzAwNzRkYTA0NzJlOWJmMjA4MDp7fQ==','2015-03-28 13:38:29'),('6j21gvy9ijntta240nwgykix07o49ae7','Nzc3ZThlNTgxZGM2MTljNDM0ZGY2NjIwMGJiYTE4YTlkYjYxZGM0Zjp7Imdvb2dsZS1vYXV0aDJfc3RhdGUiOiJQTTlZZlBOMDdId2JCRmk3aTdRRGpVQVozTWFicmczSiJ9','2015-03-28 13:47:29'),('7yb47eumz6r0ad79z9ckq4y5hfyrwwyg','ZjlhNDZhYTg1YzNjMmQzYTIwZTk0MTE3MWFlMjBjZTY1MGJiMzI5YjqAAn1xAShVHnNvY2lhbF9hdXRoX2xhc3RfbG9naW5fYmFja2VuZFgNAAAAZ29vZ2xlLW9hdXRoMlUTZ29vZ2xlLW9hdXRoMl9zdGF0ZVggAAAANTVWM28wU05mYzFkS0dmRExXOUxNNGFsakRCYlBhNGFVDV9hdXRoX3VzZXJfaWSKATRVEl9hdXRoX3VzZXJfYmFja2VuZFUvc29jaWFsX2F1dGguYmFja2VuZHMuZ29vZ2xlLkdvb2dsZU9BdXRoMkJhY2tlbmRYDwAAAF9zZXNzaW9uX2V4cGlyeWNkYXRldGltZQpkYXRldGltZQpxAlUKB98DDg8gMAkOpWNkamFuZ28udXRpbHMudGltZXpvbmUKVVRDCnEDKVJxBIZScQV1Lg==','2015-03-14 15:32:48'),('85rg4jxrz7feaym6jd2pmeyp9b1hao8d','YjEzZjdmZmZjZGE0MzM5YzI3ZDYzYjVmNGNhZWQxNTgwZGM4ZDBlNDqAAn1xAShVAnAyWAMAAABVU0RVAnAxWAMAAABFVVJVDV9hdXRoX3VzZXJfaWSKATtVCHF1ZXN0aW9uR0BEAAAAAAAAVRJfYXV0aF91c2VyX2JhY2tlbmRVJWxhenlzaWdudXAuYmFja2VuZHMuTGF6eVNpZ251cEJhY2tlbmRVBXR5cGVzXXECWAEAAABlYVUEdGVzdFgDAAAAc2V0VQR0eXBlWAEAAABlVQl0ZXN0UGFyYW1LAXUu','2015-03-31 13:52:55'),('ew8mammnh9c5swi31qf4ul4nbjibutoz','NWRlZjM1OWZiYzdjNWY3MGY4M2RjMmMyN2Q3NWRlMDk2NjQ1MzU1YTqAAn1xAShVAnAyWAEAAABtVQJwMVgEAAAAeWFyZFUNX2F1dGhfdXNlcl9pZIoBN1UIcXVlc3Rpb25HQFSAAAAAAABVEl9hdXRoX3VzZXJfYmFja2VuZFUlbGF6eXNpZ251cC5iYWNrZW5kcy5MYXp5U2lnbnVwQmFja2VuZFUFdHlwZXNdcQJYAwAAAGxlbnEDYVUEdGVzdFgDAAAAc2V0VQR0eXBlWAMAAABsZW5VCXRlc3RQYXJhbUsBdS4=','2015-03-29 12:26:16'),('fovdrjpm66clf31ommk0vfrk0xisjs4q','MmEyOTlkYTI3MTQzYWI5MWI3NDMxZjU1Mjg2NDI1NzYxMDdhNjA1Yjp7Imdvb2dsZS1vYXV0aDJfc3RhdGUiOiJQUDhMSnpxQ1Y1YjQzeFo4SWRzcG1QZERkYlhGejIwMCJ9','2015-03-28 13:38:25'),('kqk7z3lur56z5ebhi85dyob3zjazu8h2','NGI3ZjhkOTUzZWFmOGYwYjM4MmQ0OTFlNDJhNDg2Y2RhN2VlNjM4ZTp7Imdvb2dsZS1vYXV0aDJfc3RhdGUiOiJrUmluSXJzN2lkSGM1bFJ0R2pMNXZ3UmdXWVhxemJnQyJ9','2015-03-28 13:43:06'),('ucl7eesrzusujkmgbzx6ioaumgv3iqpa','YTc4OWY1MDFmNjdlZmE2ZGMwMjhmYmQ3M2M4ODc2MWNhODA1MmVkZjp7Imdvb2dsZS1vYXV0aDJfc3RhdGUiOiJRQkhEd05rbjhXcnVWeEM4VkVjWWIyWEpGSEpxeldrRyJ9','2015-03-28 13:39:47'),('ur3hop6ut23pabwm1jc1doj9wwk7x42g','ZTU0NDVkYzk3MDMyMTIzZDM4ZjZlZGFmZDgxZmU4NTZkYTk3NDU3YjqAAn1xAShVHnNvY2lhbF9hdXRoX2xhc3RfbG9naW5fYmFja2VuZFgNAAAAZ29vZ2xlLW9hdXRoMlUNX2F1dGhfdXNlcl9pZIoBNFUSX2F1dGhfdXNlcl9iYWNrZW5kVS9zb2NpYWxfYXV0aC5iYWNrZW5kcy5nb29nbGUuR29vZ2xlT0F1dGgyQmFja2VuZFgPAAAAX3Nlc3Npb25fZXhwaXJ5Y2RhdGV0aW1lCmRhdGV0aW1lCnECVQoH3wMQAC83AW4LY2RqYW5nby51dGlscy50aW1lem9uZQpVVEMKcQMpUnEEhlJxBXUu','2015-03-16 00:47:55'),('vhiae2gz6o4c048bb4849l8a4wyozc9v','ZjcxYjNjZGFjYzcwMzdjM2Q1MDVlM2NhMzY2NDgwNzIwM2I1NDk3Nzp7Imdvb2dsZS1vYXV0aDJfc3RhdGUiOiJMRW14blhwZmdNckhmS1owV0dNWEFUV2M1TzVsakk1NiJ9','2015-03-28 00:34:18'),('z4fmlhj7tq7ypjdd9mzrsnekrdh2kul2','MzM1ZDgyNmI1ZDY1MWRhOGE3MTVjNzAwNzRkYTA0NzJlOWJmMjA4MDp7fQ==','2015-03-28 00:33:29'),('z7rxzua8z86nc76yhqf8lmb6ic933zxb','OWNhZDU3OTAxOTBhZDU2ZTlhYmYxYjVkMmZjYTkwMzE5NjkwNzkyODp7Imdvb2dsZS1vYXV0aDJfc3RhdGUiOiJBUHphRklCNU44RGxpa0RvaUlBazViUG5DcExJMHg3ciJ9','2015-03-28 13:38:37');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lazysignup_lazyuser`
--

LOCK TABLES `lazysignup_lazyuser` WRITE;
/*!40000 ALTER TABLE `lazysignup_lazyuser` DISABLE KEYS */;
INSERT INTO `lazysignup_lazyuser` VALUES (1,53,'2015-03-15 11:47:57'),(2,54,'2015-03-15 11:48:27'),(3,55,'2015-03-15 11:59:08'),(4,57,'2015-03-15 23:43:57'),(5,58,'2015-03-15 23:46:55'),(6,59,'2015-03-17 12:57:18');
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
  `question_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `params_id` int(11) NOT NULL,
  `label` double DEFAULT NULL,
  `updatedTimes` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `learning_concept_25110688` (`question_id`),
  KEY `learning_concept_403d8ff3` (`type_id`),
  KEY `learning_concept_45bd63ef` (`params_id`),
  CONSTRAINT `params_id_refs_id_71e9445f4ea724a8` FOREIGN KEY (`params_id`) REFERENCES `learning_params` (`id`),
  CONSTRAINT `question_id_refs_id_93dd819681f5d6a` FOREIGN KEY (`question_id`) REFERENCES `learning_questions` (`id`),
  CONSTRAINT `type_id_refs_id_79be5b42010a9228` FOREIGN KEY (`type_id`) REFERENCES `learning_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1231 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning_concept`
--

LOCK TABLES `learning_concept` WRITE;
/*!40000 ALTER TABLE `learning_concept` DISABLE KEYS */;
INSERT INTO `learning_concept` VALUES (1,1,2,98,0.5,0),(2,2,2,98,0.5,0),(3,3,2,98,0.5,0),(4,4,2,98,0.5,0),(5,5,2,98,0.5,0),(6,6,2,98,0.5,0),(7,7,2,98,0.5,0),(8,8,2,98,0.5,0),(9,9,2,98,0.5,0),(10,10,2,98,0.5,0),(11,11,2,98,0.5,0),(12,12,2,98,0.5,0),(13,13,2,98,0.5,0),(14,14,2,98,0.5,0),(15,15,2,98,0.5,0),(16,16,2,98,0.5,0),(17,17,2,98,0.5,0),(18,18,2,98,0.5,0),(19,19,2,98,0.5,0),(20,20,2,98,0.5,0),(21,21,2,98,0.5,0),(22,22,2,98,0.5,0),(23,23,2,98,0.5,0),(24,24,2,98,0.5,0),(25,25,2,98,0.5,0),(26,26,2,98,0.5,0),(27,27,2,98,0.5,0),(28,28,2,98,0.5,0),(29,29,2,98,0.5,0),(30,30,2,98,0.5,0),(31,31,2,98,0.5,0),(32,32,2,98,0.5,0),(33,33,2,98,0.5,0),(34,34,2,98,0.5,0),(35,35,2,98,0.5,0),(36,1,2,82,0.5,0),(37,2,2,82,0.5,0),(38,3,2,82,0.5,0),(39,4,2,82,0.5,0),(40,5,2,82,0.5,0),(41,6,2,82,0.5,0),(42,7,2,82,0.5,0),(43,8,2,82,0.5,0),(44,9,2,82,0.5,0),(45,10,2,82,0.5,0),(46,11,2,82,0.5,0),(47,12,2,82,0.5,0),(48,13,2,82,0.5,0),(49,14,2,82,0.5,0),(50,15,2,82,0.5,0),(51,16,2,82,0.5,0),(52,17,2,82,0.5,0),(53,18,2,82,0.5,0),(54,19,2,82,0.5,0),(55,20,2,82,0.5,0),(56,21,2,82,0.5,0),(57,22,2,82,0.5,0),(58,23,2,82,0.5,0),(59,24,2,82,0.5,0),(60,25,2,82,0.5,0),(61,26,2,82,0.5,0),(62,27,2,82,0.5,0),(63,28,2,82,0.5,0),(64,29,2,82,0.5,0),(65,30,2,82,0.5,0),(66,31,2,82,0.5,0),(67,32,2,82,0.5,0),(68,33,2,82,0.5,0),(69,34,2,82,0.5,0),(70,35,2,82,0.5,0),(71,1,2,118,0.5,0),(72,2,2,118,0.5,0),(73,3,2,118,0.5,0),(74,4,2,118,0.5,0),(75,5,2,118,0.5,0),(76,6,2,118,0.5,0),(77,7,2,118,0.5,0),(78,8,2,118,0.5,0),(79,9,2,118,0.5,0),(80,10,2,118,0.5,0),(81,11,2,118,0.5,0),(82,12,2,118,0.5,0),(83,13,2,118,0.5,0),(84,14,2,118,0.5,0),(85,15,2,118,0.5,0),(86,16,2,118,0.5,0),(87,17,2,118,0.5,0),(88,18,2,118,0.5,0),(89,19,2,118,0.5,0),(90,20,2,118,0.5,0),(91,21,2,118,0.5,0),(92,22,2,118,0.5,0),(93,23,2,118,0.5,0),(94,24,2,118,0.5,0),(95,25,2,118,0.5,0),(96,26,2,118,0.5,0),(97,27,2,118,0.5,0),(98,28,2,118,0.5,0),(99,29,2,118,0.5,0),(100,30,2,118,0.5,0),(101,31,2,118,0.5,0),(102,32,2,118,0.5,0),(103,33,2,118,0.5,0),(104,34,2,118,0.5,0),(105,35,2,118,0.5,0),(106,1,2,114,0.5,0),(107,2,2,114,0.5,0),(108,3,2,114,0.5,0),(109,4,2,114,0.5,0),(110,5,2,114,0.5,0),(111,6,2,114,0.5,0),(112,7,2,114,0.5,0),(113,8,2,114,0.5,0),(114,9,2,114,0.5,0),(115,10,2,114,0.5,0),(116,11,2,114,0.5,0),(117,12,2,114,0.5,0),(118,13,2,114,0.5,0),(119,14,2,114,0.5,0),(120,15,2,114,0.5,0),(121,16,2,114,0.5,0),(122,17,2,114,0.5,0),(123,18,2,114,0.5,0),(124,19,2,114,0.5,0),(125,20,2,114,0.5,0),(126,21,2,114,0.5,0),(127,22,2,114,0.5,0),(128,23,2,114,0.5,0),(129,24,2,114,0.5,0),(130,25,2,114,0.5,0),(131,26,2,114,0.5,0),(132,27,2,114,0.5,0),(133,28,2,114,0.5,0),(134,29,2,114,0.5,0),(135,30,2,114,0.5,0),(136,31,2,114,0.5,0),(137,32,2,114,0.5,0),(138,33,2,114,0.5,0),(139,34,2,114,0.5,0),(140,35,2,114,0.5,0),(141,1,2,88,0.5,0),(142,2,2,88,0.5,0),(143,3,2,88,0.5,0),(144,4,2,88,0.5,0),(145,5,2,88,0.5,0),(146,6,2,88,0.5,0),(147,7,2,88,0.5,0),(148,8,2,88,0.5,0),(149,9,2,88,0.5,0),(150,10,2,88,0.5,0),(151,11,2,88,0.5,0),(152,12,2,88,0.5,0),(153,13,2,88,0.5,0),(154,14,2,88,0.5,0),(155,15,2,88,0.5,0),(156,16,2,88,0.5,0),(157,17,2,88,0.5,0),(158,18,2,88,0.5,0),(159,19,2,88,0.5,0),(160,20,2,88,0.5,0),(161,21,2,88,0.5,0),(162,22,2,88,0.5,0),(163,23,2,88,0.5,0),(164,24,2,88,0.5,0),(165,25,2,88,0.5,0),(166,26,2,88,0.5,0),(167,27,2,88,0.5,0),(168,28,2,88,0.5,0),(169,29,2,88,0.5,0),(170,30,2,88,0.5,0),(171,31,2,88,0.5,0),(172,32,2,88,0.5,0),(173,33,2,88,0.5,0),(174,34,2,88,0.5,0),(175,35,2,88,0.5,0),(176,1,2,79,0.5,0),(177,2,2,79,0.5,0),(178,3,2,79,0.5,0),(179,4,2,79,0.5,0),(180,5,2,79,0.5,0),(181,6,2,79,0.5,0),(182,7,2,79,0.5,0),(183,8,2,79,0.5,0),(184,9,2,79,0.5,0),(185,10,2,79,0.5,0),(186,11,2,79,0.5,0),(187,12,2,79,0.5,0),(188,13,2,79,0.5,0),(189,14,2,79,0.5,0),(190,15,2,79,0.5,0),(191,16,2,79,0.5,0),(192,17,2,79,0.5,0),(193,18,2,79,0.5,0),(194,19,2,79,0.5,0),(195,20,2,79,0.5,0),(196,21,2,79,0.5,0),(197,22,2,79,0.5,0),(198,23,2,79,0.5,0),(199,24,2,79,0.5,0),(200,25,2,79,0.5,0),(201,26,2,79,0.5,0),(202,27,2,79,0.5,0),(203,28,2,79,0.5,0),(204,29,2,79,0.5,0),(205,30,2,79,0.5,0),(206,31,2,79,0.5,0),(207,32,2,79,0.5,0),(208,33,2,79,0.5,0),(209,34,2,79,0.5,0),(210,35,2,79,0.5,0),(211,1,2,58,0.5,0),(212,2,2,58,0.5,0),(213,3,2,58,0.5,0),(214,4,2,58,0.5,0),(215,5,2,58,0.5,0),(216,6,2,58,0.5,0),(217,7,2,58,0.5,0),(218,8,2,58,0.5,0),(219,9,2,58,0.5,0),(220,10,2,58,0.5,0),(221,11,2,58,0.5,0),(222,12,2,58,0.5,0),(223,13,2,58,0.5,0),(224,14,2,58,0.5,0),(225,15,2,58,0.5,0),(226,16,2,58,0.5,0),(227,17,2,58,0.5,0),(228,18,2,58,0.5,0),(229,19,2,58,0.5,0),(230,20,2,58,0.5,0),(231,21,2,58,0.5,0),(232,22,2,58,0.5,0),(233,23,2,58,0.5,0),(234,24,2,58,0.5,0),(235,25,2,58,0.5,0),(236,26,2,58,0.5,0),(237,27,2,58,0.5,0),(238,28,2,58,0.5,0),(239,29,2,58,0.5,0),(240,30,2,58,0.5,0),(241,31,2,58,0.5,0),(242,32,2,58,0.5,0),(243,33,2,58,0.5,0),(244,34,2,58,0.5,0),(245,35,2,58,0.5,0),(246,36,1,76,0.5,0),(247,37,1,76,0.5,0),(248,38,1,76,0.5,0),(249,39,1,76,0.5,0),(250,40,1,76,0.5,0),(251,41,1,76,0.5,0),(252,42,1,76,0.5,0),(253,43,1,76,0.5,0),(254,44,1,76,0.5,0),(255,45,1,76,0.5,0),(256,46,1,76,0.5,0),(257,47,1,76,0.5,0),(258,48,1,76,0.5,0),(259,49,1,76,0.5,0),(260,50,1,76,0.5,0),(261,51,1,76,0.5,0),(262,52,1,76,0.5,0),(263,53,1,76,0.5,0),(264,54,1,76,0.5,0),(265,55,1,76,0.5,0),(266,56,1,76,0.5,0),(267,57,1,76,0.5,0),(268,58,1,76,0.5,0),(269,59,1,76,0.5,0),(270,60,1,76,0.575508133759629,0),(271,36,1,57,0.5,0),(272,37,1,57,0.5,0),(273,38,1,57,0.5,0),(274,39,1,57,0.5,0),(275,40,1,57,0.5,0),(276,41,1,57,0.5,0),(277,42,1,57,0.5,0),(278,43,1,57,0.5,0),(279,44,1,57,0.5,0),(280,45,1,57,0.5,0),(281,46,1,57,0.5,0),(282,47,1,57,0.520670373635229,0),(283,48,1,57,0.5,0),(284,49,1,57,0.5,0),(285,50,1,57,0.5,0),(286,51,1,57,0.5,0),(287,52,1,57,0.5,0),(288,53,1,57,0.5,0),(289,54,1,57,0.5,0),(290,55,1,57,0.5,0),(291,56,1,57,0.5,0),(292,57,1,57,0.5,0),(293,58,1,57,0.5,0),(294,59,1,57,0.5,0),(295,60,1,57,0.5,0),(296,36,1,54,0.5,0),(297,37,1,54,0.5,0),(298,38,1,54,0.5,0),(299,39,1,54,0.5,0),(300,40,1,54,0.5,0),(301,41,1,54,0.5,0),(302,42,1,54,0.5,0),(303,43,1,54,0.5,0),(304,44,1,54,0.5,0),(305,45,1,54,0.5,0),(306,46,1,54,0.5,0),(307,47,1,54,0.5,0),(308,48,1,54,0.5,0),(309,49,1,54,0.5,0),(310,50,1,54,0.5,0),(311,51,1,54,0.5,0),(312,52,1,54,0.5,0),(313,53,1,54,0.5,0),(314,54,1,54,0.5,0),(315,55,1,54,0.5,0),(316,56,1,54,0.5,0),(317,57,1,54,0.5,0),(318,58,1,54,0.575508133759629,0),(319,59,1,54,0.580900571027111,0),(320,60,1,54,0.575508133759629,0),(321,36,1,56,0.5,0),(322,37,1,56,0.5,0),(323,38,1,56,0.5,0),(324,39,1,56,0.5,0),(325,40,1,56,0.5,0),(326,41,1,56,0.5,0),(327,42,1,56,0.5,0),(328,43,1,56,0.5,0),(329,44,1,56,0.5,0),(330,45,1,56,0.5,0),(331,46,1,56,0.5,0),(332,47,1,56,0.5,0),(333,48,1,56,0.5,0),(334,49,1,56,0.5,0),(335,50,1,56,0.5,0),(336,51,1,56,0.575508133759629,0),(337,52,1,56,0.5,0),(338,53,1,56,0.5,0),(339,54,1,56,0.5,0),(340,55,1,56,0.5,0),(341,56,1,56,0.5,0),(342,57,1,56,0.5,0),(343,58,1,56,0.5,0),(344,59,1,56,0.5,0),(345,60,1,56,0.5,0),(346,36,1,99,0.5,0),(347,37,1,99,0.5,0),(348,38,1,99,0.5,0),(349,39,1,99,0.5,0),(350,40,1,99,0.5,0),(351,41,1,99,0.5,0),(352,42,1,99,0.5,0),(353,43,1,99,0.5,0),(354,44,1,99,0.5,0),(355,45,1,99,0.5,0),(356,46,1,99,0.5,0),(357,47,1,99,0.5,0),(358,48,1,99,0.5,0),(359,49,1,99,0.5,0),(360,50,1,99,0.5,0),(361,51,1,99,0.5,0),(362,52,1,99,0.5,0),(363,53,1,99,0.5,0),(364,54,1,99,0.5,0),(365,55,1,99,0.5,0),(366,56,1,99,0.5,0),(367,57,1,99,0.5,0),(368,58,1,99,0.5,0),(369,59,1,99,0.5,0),(370,60,1,99,0.575508133759629,0),(371,36,1,75,0.5,0),(372,37,1,75,0.5,0),(373,38,1,75,0.5,0),(374,39,1,75,0.5,0),(375,40,1,75,0.5,0),(376,41,1,75,0.5,0),(377,42,1,75,0.5,0),(378,43,1,75,0.5,0),(379,44,1,75,0.5,0),(380,45,1,75,0.5,0),(381,46,1,75,0.5,0),(382,47,1,75,0.5,0),(383,48,1,75,0.5,0),(384,49,1,75,0.5,0),(385,50,1,75,0.5,0),(386,51,1,75,0.5,0),(387,52,1,75,0.5,0),(388,53,1,75,0.5,0),(389,54,1,75,0.5,0),(390,55,1,75,0.5,0),(391,56,1,75,0.5,0),(392,57,1,75,0.5,0),(393,58,1,75,0.575508133759629,0),(394,59,1,75,0.5,0),(395,60,1,75,0.5,0),(396,36,1,95,0.5,0),(397,37,1,95,0.5,0),(398,38,1,95,0.5,0),(399,39,1,95,0.5,0),(400,40,1,95,0.5,0),(401,41,1,95,0.5,0),(402,42,1,95,0.5,0),(403,43,1,95,0.5,0),(404,44,1,95,0.5,0),(405,45,1,95,0.5,0),(406,46,1,95,0.5,0),(407,47,1,95,0.5,0),(408,48,1,95,0.5,0),(409,49,1,95,0.5,0),(410,50,1,95,0.5,0),(411,51,1,95,0.5,0),(412,52,1,95,0.5,0),(413,53,1,95,0.5,0),(414,54,1,95,0.5,0),(415,55,1,95,0.5,0),(416,56,1,95,0.5,0),(417,57,1,95,0.5,0),(418,58,1,95,0.5,0),(419,59,1,95,0.5,0),(420,60,1,95,0.575508133759629,0),(422,61,6,97,0.5,0),(424,63,6,97,0.5,0),(426,64,6,97,0.5,0),(427,36,6,97,0.5,0),(428,41,6,97,0.5,0),(429,46,6,97,0.5,0),(430,51,6,97,0.5,0),(431,65,6,97,0.5,0),(432,66,6,97,0.5,0),(433,67,6,97,0.5,0),(434,68,6,97,0.5,0),(435,69,6,97,0.5,0),(436,70,6,97,0.5,0),(437,71,6,97,0.5,0),(438,72,6,97,0.5,0),(439,73,6,97,0.5,0),(440,74,6,97,0.5,0),(441,75,6,97,0.5,0),(442,76,6,97,0.5,0),(443,61,6,72,0.5,0),(444,63,6,72,0.5,0),(445,64,6,72,0.5,0),(446,65,6,72,0.5,0),(447,66,6,72,0.5,0),(448,67,6,72,0.5,0),(449,36,6,72,0.5,0),(450,68,6,72,0.5,0),(451,69,6,72,0.5,0),(452,70,6,72,0.5,0),(453,41,6,72,0.5,0),(454,71,6,72,0.5,0),(455,72,6,72,0.5,0),(456,73,6,72,0.5,0),(457,46,6,72,0.5,0),(458,74,6,72,0.5,0),(459,75,6,72,0.5,0),(460,76,6,72,0.5,0),(461,51,6,72,0.5,0),(462,78,6,80,0.5,0),(463,45,6,80,0.5,0),(464,79,6,80,0.5,0),(465,50,6,80,0.5,0),(466,80,6,80,0.5,0),(467,55,6,80,0.5,0),(468,81,6,80,0.5,0),(469,60,6,80,0.5,0),(470,82,6,80,0.5,0),(471,83,6,80,0.5,0),(472,84,6,80,0.5,0),(473,85,6,80,0.5,0),(474,86,6,80,0.5,0),(475,87,6,80,0.5,0),(476,88,6,80,0.5,0),(477,89,6,80,0.5,0),(478,90,6,80,0.5,0),(479,92,6,112,0.5,0),(480,93,6,112,0.5,0),(481,94,6,112,0.5,0),(482,95,6,112,0.5,0),(483,96,6,112,0.5,0),(484,97,6,112,0.5,0),(485,98,6,112,0.5,0),(486,99,6,112,0.5,0),(487,100,6,112,0.5,0),(488,101,6,112,0.5,0),(489,102,6,112,0.5,0),(490,103,6,112,0.5,0),(491,104,6,112,0.5,0),(492,105,6,112,0.5,0),(493,106,6,112,0.5,0),(494,107,6,112,0.5,0),(495,92,6,105,0.5,0),(496,93,6,105,0.5,0),(497,94,6,105,0.5,0),(498,95,6,105,0.5,0),(499,96,6,105,0.5,0),(500,97,6,105,0.5,0),(501,98,6,105,0.5,0),(502,99,6,105,0.5,0),(503,100,6,105,0.5,0),(504,101,6,105,0.5,0),(505,102,6,105,0.5,0),(506,103,6,105,0.5,0),(507,104,6,105,0.5,0),(508,105,6,105,0.5,0),(509,106,6,105,0.5,0),(510,107,6,105,0.5,0),(511,78,6,102,0.5,0),(512,45,6,102,0.5,0),(513,79,6,102,0.5,0),(514,50,6,102,0.5,0),(515,80,6,102,0.5,0),(516,55,6,102,0.5,0),(517,81,6,102,0.5,0),(518,60,6,102,0.5,0),(519,82,6,102,0.5,0),(520,83,6,102,0.5,0),(521,84,6,102,0.5,0),(522,85,6,102,0.5,0),(523,86,6,102,0.5,0),(524,87,6,102,0.5,0),(525,88,6,102,0.5,0),(526,89,6,102,0.5,0),(527,90,6,102,0.5,0),(528,91,6,102,0.5,0),(529,109,6,102,0.5,0),(530,110,6,102,0.5,0),(531,111,6,102,0.5,0),(532,112,6,102,0.5,0),(533,113,6,102,0.5,0),(534,114,6,102,0.5,0),(535,115,6,102,0.5,0),(536,116,6,102,0.5,0),(537,117,6,102,0.5,0),(538,118,6,102,0.5,0),(539,119,6,102,0.5,0),(540,120,6,102,0.5,0),(541,121,6,102,0.5,0),(542,122,6,102,0.5,0),(543,123,6,102,0.5,0),(544,124,6,102,0.5,0),(545,125,6,102,0.5,0),(546,126,6,102,0.5,0),(547,127,6,102,0.5,0),(548,128,6,102,0.5,0),(549,129,6,102,0.5,0),(550,130,6,102,0.5,0),(551,131,6,102,0.5,0),(552,132,6,102,0.5,0),(553,133,6,102,0.5,0),(554,134,6,102,0.5,0),(555,135,6,102,0.5,0),(556,136,6,102,0.5,0),(557,137,6,102,0.5,0),(558,138,6,102,0.5,0),(559,139,6,102,0.5,0),(560,92,6,102,0.5,0),(561,140,6,102,0.5,0),(562,141,6,102,0.5,0),(563,97,6,102,0.5,0),(564,142,6,102,0.5,0),(565,143,6,102,0.5,0),(566,102,6,102,0.5,0),(567,144,6,102,0.5,0),(568,145,6,102,0.5,0),(569,107,6,102,0.5,0),(570,146,6,102,0.5,0),(571,147,6,102,0.5,0),(572,148,6,102,0.5,0),(573,149,6,102,0.5,0),(574,2,6,102,0.5,0),(575,150,6,102,0.5,0),(576,151,6,102,0.5,0),(577,152,6,102,0.5,0),(578,153,6,102,0.5,0),(579,154,6,102,0.5,0),(580,155,6,102,0.5,0),(581,156,6,102,0.5,0),(582,157,6,102,0.5,0),(583,158,6,102,0.5,0),(584,159,6,102,0.5,0),(585,160,6,102,0.5,0),(586,161,6,102,0.5,0),(587,50,5,68,0.5,0),(588,53,5,68,0.5,0),(589,56,5,68,0.5,0),(590,59,5,68,0.5,0),(591,163,5,68,0.5,0),(592,83,5,68,0.5,0),(593,164,5,68,0.5,0),(594,165,5,68,0.5,0),(595,166,5,68,0.5,0),(596,167,5,68,0.5,0),(597,89,5,68,0.5,0),(598,168,5,68,0.5,0),(599,169,5,68,0.5,0),(600,170,5,68,0.5,0),(601,171,5,68,0.5,0),(602,112,5,68,0.5,0),(603,172,5,68,0.5,0),(604,173,5,68,0.5,0),(605,174,5,68,0.5,0),(606,175,5,68,0.5,0),(619,69,5,53,0.5,0),(620,176,5,53,0.5,0),(621,78,5,53,0.5,0),(622,177,5,53,0.5,0),(623,178,5,53,0.5,0),(624,75,5,53,0.5,0),(625,179,5,53,0.5,0),(626,80,5,53,0.5,0),(627,180,5,53,0.5,0),(628,181,5,53,0.5,0),(629,182,5,53,0.5,0),(630,183,5,53,0.5,0),(631,66,5,84,0.5,0),(632,184,5,84,0.5,0),(633,185,5,84,0.5,0),(634,186,5,84,0.5,0),(635,187,5,84,0.5,0),(636,69,5,84,0.5,0),(637,188,5,84,0.5,0),(638,176,5,84,0.5,0),(639,176,5,62,0.5,0),(640,78,5,62,0.5,0),(641,177,5,62,0.5,0),(642,178,5,62,0.5,0),(643,75,5,62,0.5,0),(644,179,5,62,0.5,0),(645,80,5,62,0.5,0),(646,180,5,62,0.5,0),(647,181,5,62,0.5,0),(648,182,5,62,0.5,0),(649,183,5,62,0.5,0),(650,82,5,62,0.5,0),(651,56,5,119,0.5,0),(652,60,5,119,0.5,0),(653,191,5,119,0.5,0),(654,164,5,119,0.5,0),(655,192,5,119,0.5,0),(656,193,5,119,0.5,0),(657,89,5,119,0.5,0),(658,39,5,74,0.5,0),(659,40,5,74,0.5,0),(660,41,5,74,0.5,0),(661,42,5,74,0.5,0),(662,43,5,74,0.5,0),(663,44,5,74,0.5,0),(664,45,5,74,0.5,0),(665,46,5,74,0.5,0),(666,47,5,74,0.5,0),(667,66,5,69,0.5,0),(668,37,5,69,0.5,0),(669,176,5,69,0.5,0),(670,44,5,69,0.5,0),(671,79,5,69,0.5,0),(672,51,5,69,0.5,0),(673,184,5,86,0.5,0),(674,69,5,86,0.5,0),(675,78,5,86,0.5,0),(676,178,5,86,0.5,0),(677,179,5,86,0.5,0),(678,180,5,86,0.5,0),(679,66,5,51,0.5,0),(680,40,5,51,0.5,0),(681,178,5,51,0.5,0),(682,53,5,51,0.5,0),(683,195,5,51,0.5,0),(684,196,5,51,0.5,0),(685,86,5,51,0.5,0),(686,184,5,104,0.5,0),(687,42,5,104,0.5,0),(688,198,5,104,0.5,0),(689,57,5,104,0.5,0),(690,190,5,104,0.5,0),(691,192,5,104,0.5,0),(692,66,5,115,0.5,0),(693,188,5,115,0.5,0),(694,200,5,115,0.5,0),(695,201,5,115,0.5,0),(696,81,5,115,0.5,0),(697,202,5,115,0.5,0),(698,203,5,115,0.5,0),(699,204,5,115,0.5,0),(700,205,5,115,0.5,0),(701,109,5,115,0.5,0),(702,184,5,60,0.5,0),(703,189,5,60,0.5,0),(704,75,5,60,0.5,0),(705,207,5,60,0.5,0),(706,82,5,60,0.5,0),(707,203,5,60,0.5,0),(708,208,5,60,0.5,0),(709,209,5,60,0.5,0),(710,210,5,60,0.5,0),(711,41,4,111,0.5,0),(712,75,4,111,0.5,0),(713,56,4,111,0.5,0),(714,202,4,111,0.5,0),(715,165,4,111,0.5,0),(716,38,4,117,0.5,0),(717,177,4,117,0.5,0),(718,51,4,117,0.5,0),(719,81,4,117,0.5,0),(720,191,4,117,0.5,0),(731,220,4,65,0.5,0),(732,221,4,65,0.5,0),(733,222,4,65,0.5,0),(734,223,4,65,0.5,0),(735,224,4,65,0.5,0),(736,225,4,65,0.5,0),(737,226,4,65,0.5,0),(738,227,4,65,0.5,0),(739,228,4,65,0.5,0),(740,229,4,65,0.5,0),(741,230,4,65,0.5,0),(742,69,4,106,0.5,0),(743,79,4,106,0.5,0),(744,181,4,106,0.5,0),(745,213,4,106,0.5,0),(746,214,4,106,0.5,0),(747,66,4,87,0.5,0),(748,232,4,87,0.5,0),(749,233,4,87,0.5,0),(750,234,4,87,0.5,0),(751,235,4,87,0.5,0),(752,41,4,94,0.5,0),(753,237,4,94,0.5,0),(754,238,4,94,0.5,0),(755,239,4,94,0.5,0),(756,240,4,94,0.5,0),(757,66,4,108,0.5,0),(758,242,4,108,0.5,0),(759,243,4,108,0.5,0),(760,244,4,108,0.5,0),(761,245,4,108,0.5,0),(762,246,4,108,0.5,0),(763,248,4,81,0.5,0),(764,249,4,81,0.5,0),(765,250,4,81,0.5,0),(766,251,4,81,0.5,0),(767,252,4,81,0.5,0),(768,253,4,81,0.5,0),(769,36,4,66,0.5,0),(770,255,4,66,0.5,0),(771,256,4,66,0.5,0),(772,257,4,66,0.5,0),(773,258,4,66,0.5,0),(774,259,4,66,0.5,0),(775,261,4,96,0.5,0),(776,262,4,96,0.5,0),(777,263,4,96,0.5,0),(778,264,4,96,0.5,0),(779,265,4,96,0.5,0),(780,266,4,96,0.5,0),(782,261,4,77,0.5,0),(783,268,4,77,0.5,0),(784,269,4,77,0.5,0),(785,270,4,77,0.5,0),(786,271,4,77,0.5,0),(787,272,4,77,0.5,0),(788,273,4,77,0.5,0),(789,274,4,77,0.5,0),(790,276,4,110,0.5,0),(791,277,4,110,0.5,0),(792,278,4,110,0.5,0),(793,279,4,110,0.5,0),(794,280,4,110,0.5,0),(795,281,4,110,0.5,0),(796,282,4,110,0.5,0),(797,283,4,110,0.5,0),(798,284,4,110,0.5,0),(799,286,4,109,0.5,0),(800,287,4,109,0.5,0),(801,288,4,109,0.5,0),(802,289,4,109,0.5,0),(803,290,4,109,0.5,0),(804,291,4,109,0.5,0),(805,292,4,109,0.575508133759629,0),(806,293,4,109,0.5,0),(807,294,4,109,0.5,0),(808,248,4,73,0.5,0),(809,296,4,73,0.5,0),(810,297,4,73,0.5,0),(811,298,4,73,0.5,0),(812,299,4,73,0.5,0),(813,300,4,73,0.5,0),(814,301,4,73,0.5,0),(815,56,4,78,0.5,0),(816,303,4,78,0.5,0),(817,304,4,78,0.5,0),(818,305,4,78,0.5,0),(819,306,4,78,0.5,0),(820,307,4,78,0.5,0),(821,308,4,78,0.5,0),(822,286,4,78,0.5,0),(823,310,4,78,0.5,0),(824,311,4,78,0.5,0),(825,312,4,78,0.5,0),(826,313,4,78,0.5,0),(827,314,4,78,0.5,0),(828,315,4,78,0.5,0),(829,316,4,78,0.5,0),(830,317,4,78,0.5,0),(831,318,4,78,0.5,0),(832,319,4,78,0.5,0),(869,261,3,100,0.5,0),(870,321,3,100,0.5,0),(871,322,3,100,0.5,0),(872,323,3,100,0.5,0),(873,324,3,100,0.5,0),(874,325,3,100,0.5,0),(875,326,3,100,0.5,0),(876,327,3,100,0.5,0),(877,328,3,100,0.5,0),(878,329,3,100,0.5,0),(879,330,3,100,0.5,0),(880,331,3,100,0.5,0),(881,66,3,103,0.5,0),(882,333,3,103,0.5,0),(883,334,3,103,0.5,0),(884,335,3,103,0.5,0),(885,336,3,103,0.5,0),(886,337,3,103,0.5,0),(887,248,3,64,0.5,0),(888,339,3,64,0.575508133759629,0),(889,340,3,64,0.5,0),(890,341,3,64,0.5,0),(891,342,3,64,0.5,0),(892,343,3,64,0.5,0),(893,220,3,90,0.5,0),(894,345,3,90,0.575508133759629,0),(895,346,3,90,0.5,0),(896,347,3,90,0.5,0),(897,348,3,90,0.5,0),(898,349,3,90,0.5,0),(899,350,3,90,0.5,0),(900,351,3,90,0.5,0),(901,372,3,90,0.5,0),(902,354,3,83,0.5,0),(903,355,3,83,0.5,0),(904,356,3,83,0.5,0),(905,357,3,83,0.5,0),(906,358,3,83,0.5,0),(907,39,3,55,0.5,0),(908,360,3,55,0.5,0),(909,361,3,55,0.5,0),(910,362,3,55,0.5,0),(911,363,3,55,0.5,0),(912,364,3,55,0.5,0),(919,185,3,107,0.5,0),(920,366,3,107,0.5,0),(921,367,3,107,0.5,0),(922,368,3,107,0.5,0),(923,369,3,107,0.575508133759629,0),(924,370,3,107,0.5,0),(925,261,3,101,0.5,0),(926,372,3,101,0.5,0),(927,373,3,101,0.5,0),(928,374,3,101,0.5,0),(929,375,3,101,0.5,0),(930,376,3,101,0.5,0),(931,377,3,101,0.5,0),(932,248,3,120,0.5,0),(933,379,3,120,0.5,0),(934,380,3,120,0.5,0),(935,381,3,120,0.5,0),(936,382,3,120,0.5,0),(937,383,3,120,0.5,0),(938,384,3,120,0.5,0),(939,385,3,120,0.5,0),(940,386,3,120,0.5,0),(941,387,3,120,0.5,0),(942,388,3,120,0.5,0),(943,389,3,120,0.5,0),(944,390,3,120,0.5,0),(945,391,3,120,0.5,0),(946,392,3,120,0.5,0),(947,393,3,120,0.575508133759629,0),(948,56,3,92,0.5,0),(949,395,3,92,0.5,0),(950,396,3,92,0.5,0),(951,397,3,92,0.5,0),(952,398,3,92,0.5,0),(953,399,3,92,0.5,0),(954,186,3,116,0.5,0),(955,401,3,116,0.5,0),(956,402,3,116,0.5,0),(957,403,3,116,0.5,0),(958,404,3,116,0.5,0),(959,405,3,116,0.5,0),(960,406,3,116,0.5,0),(961,407,3,116,0.5,0),(962,408,3,116,0.5,0),(963,409,3,116,0.5,0),(964,185,3,70,0.5,0),(965,411,3,70,0.5,0),(966,412,3,70,0.572096142523798,0),(967,413,3,70,0.575508133759629,0),(968,414,3,70,0.5,0),(969,415,3,70,0.5,0),(970,416,3,70,0.5,0),(971,417,3,70,0.5,0),(972,418,3,70,0.5,0),(973,220,3,93,0.5,0),(974,420,3,93,0.5,0),(975,421,3,93,0.5,0),(976,422,3,93,0.5,0),(977,423,3,93,0.5,0),(978,424,3,93,0.5,0),(979,425,3,93,0.5,0),(980,426,3,93,0.5,0),(981,41,3,89,0.5,0),(982,428,3,89,0.5,0),(983,429,3,89,0.5,0),(984,430,3,89,0.5,0),(985,431,3,89,0.5,0),(986,432,3,89,0.5,0),(987,433,3,89,0.5,0),(988,434,3,89,0.5,0),(989,435,3,89,0.5,0),(990,436,3,89,0.5,0),(991,186,3,85,0.5,0),(992,438,3,85,0.5,0),(993,439,3,85,0.5,0),(994,440,3,85,0.5,0),(995,441,3,85,0.5,0),(996,442,3,85,0.5,0),(997,443,3,85,0.5,0),(998,444,3,85,0.5,0),(999,445,3,85,0.5,0),(1000,446,3,85,0.5,0),(1001,447,3,85,0.5,0),(1002,185,3,71,0.5,0),(1003,449,3,71,0.5,0),(1004,450,3,71,0.5,0),(1005,451,3,71,0.575508133759629,0),(1006,452,3,71,0.5,0),(1007,453,3,71,0.5,0),(1008,454,3,71,0.5,0),(1009,455,3,71,0.5,0),(1010,456,3,71,0.5,0),(1011,185,3,67,0.5,0),(1012,449,3,67,0.5,0),(1013,450,3,67,0.5,0),(1014,451,3,67,0.5,0),(1015,452,3,67,0.5,0),(1016,453,3,67,0.5,0),(1017,454,3,67,0.5,0),(1018,455,3,67,0.5,0),(1019,456,3,67,0.5,0),(1020,42,3,61,0.5,0),(1021,458,3,61,0.5,0),(1022,459,3,61,0.5,0),(1023,460,3,61,0.575508133759629,0),(1024,461,3,61,0.5,0),(1025,462,3,61,0.5,0),(1026,463,3,61,0.5,0),(1027,464,3,61,0.5,0),(1028,465,3,61,0.5,0),(1029,466,3,61,0.5,0),(1030,467,3,61,0.5,0),(1033,36,9,59,0.5,0),(1034,469,9,59,0.5,0),(1035,176,9,59,0.5,0),(1036,470,9,59,0.5,0),(1037,45,9,59,0.5,0),(1038,74,9,59,0.5,0),(1039,198,9,59,0.5,0),(1040,471,9,59,0.493350370223898,0),(1041,54,9,59,0.5,0),(1042,472,9,59,0.5,0),(1043,182,9,59,0.5,0),(1044,473,9,59,0.5,0),(1045,474,9,59,0.5,0),(1046,475,9,59,0.5,0),(1047,84,9,59,0.5,0),(1048,476,9,59,0.5,0),(1049,192,9,59,0.5,0),(1050,477,9,59,0.5,0),(1051,208,9,59,0.5,0),(1052,478,9,59,0.5,0),(1053,286,9,59,0.5,0),(1054,479,9,59,0.5,0),(1055,480,9,59,0.5,0),(1056,481,9,59,0.5,0),(1057,110,9,59,0.5,0),(1058,482,9,59,0.5,0),(1059,483,9,59,0.5,0),(1060,484,9,59,0.5,0),(1061,485,9,59,0.5,0),(1062,486,9,59,0.5,0),(1063,487,9,59,0.5,0),(1064,488,9,59,0.5,0),(1065,489,9,59,0.5,0),(1066,490,9,59,0.5,0),(1067,119,9,59,0.5,0),(1068,491,9,59,0.5,0),(1069,492,9,59,0.5,0),(1070,493,9,59,0.575508133759629,0),(1071,36,9,91,0.5,0),(1072,469,9,91,0.5,0),(1073,176,9,91,0.5,0),(1074,470,9,91,0.5,0),(1075,45,9,91,0.5,0),(1076,74,9,91,0.5,0),(1077,198,9,91,0.5,0),(1078,471,9,91,0.5,0),(1079,54,9,91,0.5,0),(1080,472,9,91,0.5,0),(1081,182,9,91,0.5,0),(1082,473,9,91,0.5,0),(1083,474,9,91,0.5,0),(1084,475,9,91,0.5,0),(1085,84,9,91,0.5,0),(1086,476,9,91,0.5,0),(1087,192,9,91,0.5,0),(1088,477,9,91,0.5,0),(1089,208,9,91,0.5,0),(1090,478,9,91,0.5,0),(1091,286,9,91,0.5,0),(1092,479,9,91,0.5,0),(1093,480,9,91,0.5,0),(1094,481,9,91,0.5,0),(1095,110,9,91,0.5,0),(1096,482,9,91,0.5,0),(1097,483,9,91,0.5,0),(1098,484,9,91,0.5,0),(1099,485,9,91,0.5,0),(1100,486,9,91,0.5,0),(1101,487,9,91,0.5,0),(1102,488,9,91,0.5,0),(1103,489,9,91,0.5,0),(1104,490,9,91,0.5,0),(1105,119,9,91,0.5,0),(1106,491,9,91,0.5,0),(1107,492,9,91,0.580900571027111,0),(1108,493,9,91,0.575508133759629,0),(1109,185,8,113,0.5,0),(1110,188,8,113,0.5,0),(1111,72,8,113,0.5,0),(1112,79,8,113,0.5,0),(1113,201,8,113,0.5,0),(1115,195,8,113,0.5,0),(1116,202,8,113,0.5,0),(1117,84,8,113,0.5,0),(1118,495,8,113,0.5,0),(1119,204,8,113,0.5,0),(1120,199,8,113,0.5,0),(1121,209,8,113,0.5,0),(1122,109,8,113,0.5,0),(1123,496,8,113,0.5,0),(1124,497,8,113,0.5,0),(1125,498,8,113,0.5,0),(1126,487,8,113,0.5,0),(1127,117,8,113,0.5,0),(1128,499,8,113,0.5,0),(1130,501,8,113,0.5,0),(1131,502,8,113,0.5,0),(1132,125,8,113,0.5,0),(1133,39,8,113,0.5,0),(1135,49,8,113,0.5,0),(1136,207,8,113,0.5,0),(1137,474,8,113,0.5,0),(1139,286,8,113,0.5,0),(1141,504,8,113,0.5,0),(1142,500,8,113,0.385899669482626,0),(1143,505,8,113,0.575508133759629,0),(1144,36,10,63,0.5,0),(1145,69,10,63,0.5,0),(1146,41,10,63,0.5,0),(1147,72,10,63,0.5,0),(1148,46,10,63,0.5,0),(1149,75,10,63,0.5,0),(1150,51,10,63,0.5,0),(1151,506,10,63,0.503717208736423,0),(1152,56,10,63,0.451718661582268,0),(1153,182,10,63,0.464747549954935,0),(1154,507,10,63,0.483501020399432,0),(1155,202,10,63,0.476277619979375,0),(1156,196,10,63,0.224729973357454,0),(1157,508,10,63,0.468595435129854,0),(1158,165,10,63,0.466772124894525,0),(1159,509,10,63,0.430350719301062,0),(1160,193,10,63,0.482902243684295,0),(1180,41,11,122,0.575508133759629,0),(1181,286,11,122,0.5,0),(1182,507,11,122,0.5,0),(1183,72,11,121,0.575508133759629,0),(1184,51,11,123,0.5,0),(1185,79,11,124,0.575508133759629,0),(1186,191,11,124,0.5,0),(1187,69,11,125,0.575508133759629,0),(1188,82,11,126,0.5,0),(1189,48,11,126,0.575508133759629,0),(1190,286,11,127,0.5,0),(1191,511,11,128,0.5,0),(1192,220,11,128,0.575508133759629,0),(1193,48,11,128,0.5,0),(1194,41,11,129,0.5,0),(1195,191,11,129,0.441679095990204,0),(1196,213,11,130,0.575508133759629,0),(1197,72,11,130,0.575508133759629,0),(1198,37,11,131,0.575508133759629,0),(1199,186,11,132,0.575508133759629,0),(1200,66,12,133,0.5,0),(1201,248,12,134,0.5,0),(1202,261,12,135,0.5,0),(1203,354,12,135,0.575508133759629,0),(1204,354,12,136,0.5,0),(1205,37,12,136,0.5,0),(1206,37,12,137,0.5,0),(1207,261,12,137,0.5,0),(1208,261,12,138,0.543049719084505,0),(1209,261,12,139,0.575508133759629,0),(1210,248,12,140,0.518172649605824,0),(1211,261,12,141,0.5,0),(1212,512,12,142,0.375508133759629,0),(1214,64,12,144,0.5,0),(1215,220,13,145,0.5,0),(1216,220,13,146,0.5,0),(1217,37,13,145,0.5,0),(1218,187,13,145,0.5,0),(1219,38,13,145,0.5,0),(1220,186,13,145,0.5,0),(1221,39,13,145,0.5,0),(1222,69,13,145,0.5,0),(1223,261,13,146,0.5,0),(1224,261,13,147,0.5,0),(1225,261,13,148,0.303580343680715,0),(1226,261,13,149,0.5,0),(1227,261,13,150,0.5,0),(1228,261,13,151,0.5,0),(1229,261,13,152,0.5,0),(1230,261,13,153,0.375508133759629,0);
/*!40000 ALTER TABLE `learning_concept` ENABLE KEYS */;
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
  `date` datetime DEFAULT '2015-02-26 23:00:00',
  `concept_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `learning_floatmodel_403d8ff3` (`type_id`),
  KEY `learning_floatmodel_6340c63c` (`user_id`),
  KEY `learning_floatmodel_8a386586` (`concept_id`),
  CONSTRAINT `concept_id_refs_id_54beff2670a2a233` FOREIGN KEY (`concept_id`) REFERENCES `learning_concept` (`id`),
  CONSTRAINT `type_id_refs_id_444862b09187e290` FOREIGN KEY (`type_id`) REFERENCES `learning_type` (`id`),
  CONSTRAINT `user_id_refs_id_630270d3410ecf4b` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=425 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning_floatmodel`
--

LOCK TABLES `learning_floatmodel` WRITE;
/*!40000 ALTER TABLE `learning_floatmodel` DISABLE KEYS */;
INSERT INTO `learning_floatmodel` VALUES (1,12.18,10,2,1,NULL,1,0.178981937602627,'2015-02-27 21:17:01',1),(2,13.72,100,2,10,NULL,1,1,'2015-02-27 21:17:45',2),(3,15.3,16,2,4,NULL,1,0.0457516339869281,'2015-02-27 21:17:45',3),(4,16.81,19,2,4,NULL,1,0.130279595478882,'2015-02-27 21:17:45',4),(5,3,3,8,2,NULL,0,0,'2015-02-27 21:49:42',1109),(6,8.43673525607408,12,10,2,NULL,0,0.42235113889114,'2015-02-28 18:03:44',1144),(7,15,14,10,5,NULL,0,0.0666666666666667,'2015-02-28 18:05:50',1145),(8,18.4,15,2,3,NULL,1,0.184782608695652,'2015-02-28 20:49:32',5),(9,19.94,19,2,4,NULL,1,0.0471414242728185,'2015-02-28 20:49:32',6),(10,21.49,19,2,2,NULL,1,0.115867845509539,'2015-02-28 20:49:32',7),(11,23.04,19,2,1,NULL,1,0.175347222222222,'2015-02-28 20:49:32',8),(12,24.58,19,2,1,NULL,1,0.227013832384052,'2015-02-28 20:49:32',9),(13,26.13,19,2,1,NULL,1,0.272866437045541,'2015-02-28 20:49:32',10),(14,27.68,19,2,1,NULL,1,0.313583815028902,'2015-02-28 20:49:32',11),(15,27.68,19,2,1,NULL,1,0.313583815028902,'2015-02-28 20:49:32',11),(16,27.68,19,2,1,NULL,1,0.313583815028902,'2015-02-28 20:49:32',11),(17,27.68,19,2,1,NULL,1,0.313583815028902,'2015-02-28 20:49:32',11),(18,27.68,19,2,1,NULL,1,0.313583815028902,'2015-02-28 20:49:32',11),(19,27.68,19,2,1,NULL,1,0.313583815028902,'2015-02-28 20:49:32',11),(20,29.22,19,2,1,NULL,1,0.349760438056126,'2015-02-28 20:49:32',12),(21,29.22,19,2,1,NULL,1,0.349760438056126,'2015-02-28 20:49:32',12),(22,29.22,19,2,1,NULL,1,0.349760438056126,'2015-02-28 20:49:32',12),(23,30.77,19,2,1,NULL,1,0.382515437114072,'2015-02-28 20:49:32',13),(24,32.32,19,2,1,NULL,1,0.412128712871287,'2015-02-28 20:49:32',14),(25,32.32,19,2,1,NULL,1,0.412128712871287,'2015-02-28 20:49:32',14),(26,33.86,19,2,2,NULL,1,0.438865918487891,'2015-02-28 20:49:32',15),(27,35.41,20,2,3,NULL,1,0.435187800056481,'2015-02-28 20:49:32',16),(28,36.96,20,2,2,NULL,1,0.458874458874459,'2015-02-28 20:49:32',17),(29,38.5,20,2,3,NULL,1,0.480519480519481,'2015-02-28 20:49:32',18),(30,40.05,20,2,1,NULL,1,0.500624219725343,'2015-02-28 20:49:32',19),(31,41.6,40,2,3,NULL,1,0.0384615384615385,'2015-02-28 20:49:32',20),(32,43.14,0,2,4,NULL,1,1,'2015-02-28 20:49:32',21),(33,44.69,0,2,3,NULL,1,1,'2015-02-28 20:49:32',22),(34,46.24,0,2,3,NULL,1,1,'2015-02-28 20:49:32',23),(35,47.78,0,2,2,NULL,1,1,'2015-02-28 20:49:32',24),(36,49.33,0,2,2,NULL,1,1,'2015-02-28 20:49:32',25),(37,50.88,0,2,1,NULL,1,1,'2015-02-28 20:49:32',26),(38,52.42,0,2,2,NULL,1,1,'2015-02-28 20:49:32',27),(39,53.97,53,2,15,NULL,1,0.0179729479340374,'2015-02-28 21:40:24',28),(40,55.51,53,2,4,NULL,1,0.0452170780039632,'2015-02-28 21:40:24',29),(41,57.06,50,2,3,NULL,1,0.12372940764108,'2015-02-28 21:40:24',30),(42,58.61,50,2,2,NULL,1,0.146903258829551,'2015-02-28 21:40:24',31),(43,60.15,50,2,2,NULL,1,0.168744804655029,'2015-02-28 21:40:24',32),(44,61.7,50,2,4,NULL,1,0.189627228525122,'2015-02-28 21:40:24',33),(45,63.25,50,2,4,NULL,1,0.209486166007905,'2015-02-28 21:40:24',34),(46,64.79,50,2,5,NULL,1,0.22827596851366,'2015-02-28 21:40:24',35),(47,45.24,50,2,2,NULL,1,0.105216622458002,'2015-02-28 21:40:24',36),(48,45.24,50,2,2,NULL,1,0.105216622458002,'2015-02-28 21:40:24',36),(49,50.97,50,2,2,NULL,1,0.0190308024328036,'2015-02-28 21:40:24',37),(50,50.97,50,2,2,NULL,1,0.0190308024328036,'2015-02-28 21:40:24',37),(51,56.7,50,2,1,NULL,1,0.118165784832452,'2015-02-28 21:40:24',38),(52,62.43,42,2,3,NULL,1,0.32724651609803,'2015-02-28 21:40:24',39),(53,68.16,30,2,3,NULL,1,0.559859154929577,'2015-02-28 21:40:24',40),(54,73.89,0,2,3,NULL,1,1,'2015-02-28 21:40:24',41),(55,79.62,10,2,3,NULL,1,0.874403416227079,'2015-02-28 21:40:24',42),(56,85.35,20,2,4,NULL,1,0.765670767428237,'2015-02-28 21:40:24',43),(57,11.2,8,1,5,NULL,1,0.285714285714286,'2015-02-28 21:40:24',246),(58,13.44,10,1,7,NULL,1,0.255952380952381,'2015-03-01 10:42:39',247),(59,15.67,12,1,4,NULL,1,0.234205488194001,'2015-03-01 10:42:39',248),(60,17.91,18,1,5,NULL,1,0.0050251256281407,'2015-03-01 10:42:39',249),(61,17.91,18,1,5,NULL,1,0.0050251256281407,'2015-03-01 10:42:39',249),(62,20.15,20,1,9,NULL,1,0.00744416873449124,'2015-03-01 10:42:39',250),(63,22.39,21,1,135,NULL,1,0.0620812862885217,'2015-03-01 10:42:39',251),(64,24.63,24,1,5,NULL,1,0.02557856272838,'2015-03-01 10:42:39',252),(65,3.1,2,4,3,NULL,1,0.354838709677419,'2015-03-01 11:10:35',711),(66,5.43,5,4,22,NULL,1,0.0791896869244935,'2015-03-01 11:10:35',712),(67,7.75,8,4,4,NULL,1,0.032258064516129,'2015-03-01 11:10:35',713),(68,10.08,11,4,4,NULL,1,0.0912698412698413,'2015-03-01 11:10:35',714),(69,12.4,14,4,5,NULL,1,0.129032258064516,'2015-03-01 11:10:35',715),(70,90.32,84,4,47,NULL,1,0.0699734278122231,'2015-03-01 11:10:35',716),(71,174.19,134,4,10,NULL,1,0.230725070325507,'2015-03-01 11:10:35',717),(72,258.06,240,4,8,NULL,1,0.0699837247151825,'2015-03-01 11:10:35',718),(73,14.96,12,5,5,NULL,1,0.197860962566845,'2015-03-01 11:10:35',587),(74,17.32,19,5,14,NULL,1,0.0969976905311778,'2015-03-01 11:10:35',588),(75,19.69,65,5,6,NULL,1,1,'2015-03-01 11:10:35',589),(76,22.05,22,5,27,NULL,1,0.00226757369614516,'2015-03-01 11:10:35',590),(77,24.41,24,5,11,NULL,1,0.0167963949201147,'2015-03-01 11:10:35',591),(78,26.77,26,5,5,NULL,1,0.0287635412775495,'2015-03-01 11:10:35',592),(79,29.13,28,5,8,NULL,1,0.0387916237555784,'2015-03-01 11:10:35',593),(80,31.5,32,5,5,NULL,1,0.0158730158730159,'2015-03-01 11:27:31',594),(81,33.86,34,5,4,NULL,1,0.00413467217956292,'2015-03-01 11:27:31',595),(82,36.22,36,5,7,NULL,1,0.00607399226946435,'2015-03-01 11:27:31',596),(83,38.58,38,5,4,NULL,1,0.0150336962156557,'2015-03-01 11:27:31',597),(84,40.94,40,5,5,NULL,1,0.0229604298974108,'2015-03-01 11:27:31',598),(85,40.94,40,5,5,NULL,1,0.0229604298974108,'2015-03-01 11:27:31',598),(86,43.31,42,5,6,NULL,1,0.0302470561071347,'2015-03-01 11:27:31',599),(87,45.67,44,5,4,NULL,1,0.036566673965404,'2015-03-01 11:27:31',600),(88,48.03,48,5,21,NULL,1,0.000624609618988156,'2015-03-01 11:55:39',601),(89,50.39,51,5,4,NULL,1,0.0121055765032744,'2015-03-01 11:57:41',602),(90,52.76,51,5,2,NULL,1,0.0333586050037907,'2015-03-01 11:58:06',603),(91,55.12,53,5,3,NULL,1,0.0384615384615384,'2015-03-01 11:58:35',604),(92,57.48,56,5,5,NULL,1,0.0257480862908837,'2015-03-01 12:04:17',605),(93,59.84,59,5,4,NULL,1,0.0140374331550803,'2015-03-01 12:05:20',606),(94,38.1,42,5,10,NULL,1,0.102362204724409,'2015-03-01 12:05:47',619),(95,48.26,42,5,2,NULL,1,0.129714048901782,'2015-03-01 12:06:53',620),(96,58.42,60,5,6,NULL,1,0.0270455323519342,'2015-03-01 12:06:53',621),(97,68.58,81,5,8,NULL,1,0.181102362204724,'2015-03-01 12:08:34',622),(98,78.74,77,5,16,NULL,1,0.0220980441960883,'2015-03-01 12:08:34',623),(99,88.9,81,5,9,NULL,1,0.0888638920134984,'2015-03-01 12:16:22',624),(100,99.06,100,5,14,NULL,1,0.0094891984655764,'2015-03-01 12:16:22',625),(101,109.22,107,5,8,NULL,1,0.0203259476286394,'2015-03-01 12:16:22',626),(102,119.38,107,5,3,NULL,1,0.103702462724074,'2015-03-01 12:19:25',627),(103,129.54,127,5,9,NULL,1,0.0196078431372548,'2015-03-01 12:19:25',628),(104,139.7,140,5,7,NULL,1,0.00214745884037231,'2015-03-01 12:21:29',629),(105,149.86,151,5,5,NULL,1,0.00760709995996254,'2015-03-01 12:21:54',630),(106,19.69,4,5,49,NULL,1,0.796851193499238,'2015-03-01 12:22:49',631),(107,27.56,21,5,9,NULL,1,0.238026124818578,'2015-03-01 12:22:49',632),(108,35.43,36,5,10,NULL,1,0.0160880609652837,'2015-03-01 12:22:49',633),(109,43.31,44,5,5,NULL,1,0.0159316555068113,'2015-03-01 12:24:31',634),(110,51.18,52,5,7,NULL,1,0.016021883548261,'2015-03-01 12:25:29',635),(111,26.87,26,1,5,NULL,1,0.0323781168589505,'2015-03-01 16:20:44',253),(112,29.11,28,1,6,NULL,1,0.0381312263826863,'2015-03-01 16:20:44',254),(113,31.35,30,1,6,NULL,1,0.0430622009569378,'2015-03-01 16:20:44',255),(114,33.59,32,1,7,NULL,1,0.0473355165227747,'2015-03-01 16:20:44',256),(115,35.83,34,1,5,NULL,1,0.051074518559866,'2015-03-01 16:20:44',257),(116,38.07,36,1,118,NULL,1,0.0543735224586289,'2015-03-01 16:20:44',258),(117,40.31,123,1,4,NULL,1,1,'2015-03-01 16:20:44',259),(118,42.54,40,1,13,NULL,1,0.0597085096379878,'2015-03-01 16:20:44',260),(119,44.78,42,1,112,NULL,1,0.0620812862885217,'2015-03-01 16:20:44',261),(120,47.02,44,1,3,NULL,1,0.0642279880901745,'2015-03-01 16:20:44',262),(121,49.26,49,1,3,NULL,1,0.00527811611855457,'2015-03-01 16:20:44',263),(122,51.5,52,1,3,NULL,1,0.00970873786407767,'2015-03-01 16:20:44',264),(123,53.74,52,1,5,NULL,1,0.0323781168589505,'2015-03-01 16:20:44',265),(124,55.98,63,1,3,NULL,1,0.12540192926045,'2015-03-01 16:20:44',266),(125,58.22,62,1,4,NULL,1,0.0649261422191687,'2015-03-01 16:20:44',267),(126,60.46,60,1,3,NULL,1,0.00760833608997686,'2015-03-01 16:20:44',268),(127,62.7,123,1,5,NULL,1,0.961722488038277,'2015-03-01 16:20:44',269),(128,62.7,123,1,5,NULL,1,0.961722488038277,'2015-03-01 16:20:44',269),(129,62.7,123,1,5,NULL,1,0.961722488038277,'2015-03-01 16:20:44',269),(130,62.7,123,1,5,NULL,1,0.961722488038277,'2015-03-01 16:20:44',269),(131,62.7,123,1,5,NULL,1,0.961722488038277,'2015-03-01 16:20:44',269),(132,62.7,123,1,5,NULL,1,0.961722488038277,'2015-03-01 16:20:44',269),(133,62.7,123,1,5,NULL,1,0.961722488038277,'2015-03-01 16:20:44',269),(134,64.94,123,1,2,NULL,1,0.894056051740068,'2015-03-01 16:20:44',270),(135,41.48,123,1,2,NULL,1,1,'2015-03-01 16:20:44',271),(136,41.48,123,1,2,NULL,1,1,'2015-03-01 16:20:44',271),(137,49.78,48,1,17,NULL,1,0.0357573322619526,'2015-03-01 16:20:44',272),(138,58.08,56,1,15,NULL,1,0.0358126721763085,'2015-03-01 16:20:44',273),(139,66.37,60,1,7,NULL,1,0.0959770980864849,'2015-03-01 16:20:44',274),(140,74.67,70,1,17,NULL,1,0.0625418508102317,'2015-03-01 16:20:44',275),(141,-5.00000022222218,4.99999977777782,6,26,NULL,1,1,'2015-03-01 18:25:37',422),(142,-2.50000022222218,-2.22222244444441,6,70,NULL,1,0.111111101234568,'2015-03-01 18:27:25',424),(143,0.000001,718.333333111111,6,22,NULL,1,1,'2015-03-01 18:27:25',426),(144,59.06,123,5,4,NULL,1,1,'2015-03-01 18:27:25',636),(145,66.93,123,5,3,NULL,1,0.837740923352756,'2015-03-01 18:27:25',637),(146,74.8,123,5,3,NULL,1,0.644385026737968,'2015-03-01 18:27:25',638),(147,74.8,123,5,3,NULL,1,0.644385026737968,'2015-03-01 18:27:25',638),(148,4.83,12,5,6,NULL,1,1,'2015-03-01 18:27:25',639),(149,5.84,12,5,3,NULL,1,1,'2015-03-01 18:27:25',640),(150,6.86,123,5,55,NULL,1,1,'2015-03-01 18:27:25',641),(151,7.87,1325,5,5,NULL,1,1,'2015-03-01 18:27:25',642),(152,8.89,8,5,16,NULL,1,0.100112485939258,'2015-03-01 18:27:25',643),(153,9.91,9,5,13,NULL,1,0.0918264379414733,'2015-03-01 18:27:25',644),(154,9.91,9,5,13,NULL,1,0.0918264379414733,'2015-03-01 18:27:25',644),(155,10.92,20,5,8,NULL,1,0.831501831501832,'2015-03-01 18:27:25',645),(156,10.92,20,5,8,NULL,1,0.831501831501832,'2015-03-01 18:27:25',645),(157,11.94,15,5,5,NULL,1,0.256281407035176,'2015-03-01 18:27:25',646),(158,12.95,15,5,4,NULL,1,0.158301158301158,'2015-03-01 18:27:25',647),(159,12.95,15,5,4,NULL,1,0.158301158301158,'2015-03-01 18:27:25',647),(160,82.97,80,1,10,NULL,1,0.0357960708689888,'2015-03-01 18:27:25',276),(161,91.12,88,1,11,NULL,1,0.0342405618964004,'2015-03-01 18:27:25',277),(162,99.41,90,1,26,NULL,1,0.094658485061865,'2015-03-01 18:27:25',278),(163,99.41,90,1,26,NULL,1,0.094658485061865,'2015-03-01 18:27:25',278),(164,107.69,145,1,5,NULL,1,0.346457424087659,'2015-03-01 18:27:25',279),(165,107.69,145,1,5,NULL,1,0.346457424087659,'2015-03-01 18:27:25',279),(166,115.98,23,1,4,NULL,1,0.801689946542507,'2015-03-01 18:27:25',280),(167,115.98,23,1,4,NULL,1,0.801689946542507,'2015-03-01 18:27:25',280),(168,124.26,60,1,16,NULL,1,0.517141477547079,'2015-03-01 18:27:25',281),(169,132.54,32,1,4,NULL,1,0.758563452542629,'2015-03-01 18:27:25',282),(170,140.83,65,1,4,NULL,1,0.538450614215721,'2015-03-01 18:27:25',283),(171,149.11,59,1,3,NULL,1,0.604318959157669,'2015-03-01 18:27:25',284),(172,157.4,123,1,7,NULL,1,0.218551461245235,'2015-03-01 18:27:25',285),(173,165.68,1325,1,4,NULL,1,1,'2015-03-01 18:27:25',286),(174,173.96,15,1,3,NULL,1,0.913773281214072,'2015-03-01 18:27:25',287),(175,182.25,1235,1,4,NULL,1,1,'2015-03-01 18:27:25',288),(176,190.53,15,1,3,NULL,1,0.921272240592033,'2015-03-01 18:27:25',289),(177,198.82,14,1,4,NULL,1,0.929584548838145,'2015-03-01 18:27:25',290),(178,207.1,1,1,4,NULL,1,0.995171414775471,'2015-03-01 18:27:25',291),(179,207.1,1,1,4,NULL,1,0.995171414775471,'2015-03-01 18:27:25',291),(180,215.38,3,1,6,NULL,1,0.986071130095645,'2015-03-01 18:27:25',292),(181,215.38,3,1,6,NULL,1,0.986071130095645,'2015-03-01 18:27:25',292),(182,223.67,1,1,4,NULL,1,0.995529127732821,'2015-03-01 18:27:25',293),(183,223.67,1,1,4,NULL,1,0.995529127732821,'2015-03-01 18:27:25',293),(184,231.95,2,1,3,NULL,1,0.991377452037077,'2015-03-01 18:27:25',294),(185,231.95,2,1,3,NULL,1,0.991377452037077,'2015-03-01 18:27:25',294),(186,240.24,3,1,2,NULL,1,0.987512487512488,'2015-03-01 18:27:25',295),(187,240.24,3,1,2,NULL,1,0.987512487512488,'2015-03-01 18:27:25',295),(188,3022.49,4,1,3,NULL,1,0.998676587846445,'2015-03-01 18:27:25',296),(189,3022.49,4,1,3,NULL,1,0.998676587846445,'2015-03-01 18:27:25',296),(190,3626.99,5,1,4,NULL,1,0.998621446433544,'2015-03-01 18:27:25',297),(191,4231.48,6,1,3,NULL,1,0.998582056396344,'2015-03-01 18:27:25',298),(192,4231.48,6,1,3,NULL,1,0.998582056396344,'2015-03-01 18:27:25',298),(193,4835.98,7,1,3,NULL,1,0.998552516759788,'2015-03-01 18:27:25',299),(194,4835.98,7,1,3,NULL,1,0.998552516759788,'2015-03-01 18:27:25',299),(195,5440.48,8,1,3,NULL,1,0.998529541511043,'2015-03-01 18:27:25',300),(196,5440.48,8,1,3,NULL,1,0.998529541511043,'2015-03-01 18:27:25',300),(197,6044.98,12,1,154,NULL,1,0.998014881769667,'2015-03-01 18:27:25',301),(198,6044.98,12,1,154,NULL,1,0.998014881769667,'2015-03-01 18:27:25',301),(199,6649.48,1,1,3,NULL,1,0.999849612300511,'2015-03-01 18:27:25',302),(200,6649.48,1,1,3,NULL,1,0.999849612300511,'2015-03-01 18:27:25',302),(201,6649.48,1,1,3,NULL,1,0.999849612300511,'2015-03-01 18:27:25',302),(202,6649.48,1,1,3,NULL,1,0.999849612300511,'2015-03-01 18:27:25',302),(203,6649.48,1,1,3,NULL,1,0.999849612300511,'2015-03-01 18:27:25',302),(204,7253.97,1,1,2,NULL,1,0.999862144453313,'2015-03-01 18:27:25',303),(205,7253.97,1,1,2,NULL,1,0.999862144453313,'2015-03-01 18:27:25',303),(206,7858.47,2,1,2,NULL,1,0.999745497533235,'2015-03-01 18:27:25',304),(207,7858.47,2,1,2,NULL,1,0.999745497533235,'2015-03-01 18:27:25',304),(208,8462.97,3,1,2,NULL,1,0.999645514517953,'2015-03-01 18:27:25',305),(209,8462.97,3,1,2,NULL,1,0.999645514517953,'2015-03-01 18:27:25',305),(210,9067.47,4,1,2,NULL,1,0.999558862615482,'2015-03-01 18:27:25',306),(211,9067.47,4,1,2,NULL,1,0.999558862615482,'2015-03-01 18:27:25',306),(212,9671.96,5,1,2,NULL,1,0.999483041699924,'2015-03-01 18:27:25',307),(213,9671.96,5,1,2,NULL,1,0.999483041699924,'2015-03-01 18:27:25',307),(214,9671.96,5,1,2,NULL,1,0.999483041699924,'2015-03-01 18:27:25',307),(215,10276.46,6,1,2,NULL,1,0.99941614135607,'2015-03-01 18:27:25',308),(216,10276.46,6,1,2,NULL,1,0.99941614135607,'2015-03-01 18:27:25',308),(217,10880.96,7,1,1,NULL,1,0.999356674411081,'2015-03-01 18:27:25',309),(218,10880.96,7,1,1,NULL,1,0.999356674411081,'2015-03-01 18:27:25',309),(219,11485.46,8,1,1,NULL,1,0.999303467166313,'2015-03-01 18:27:25',310),(220,11485.46,8,1,1,NULL,1,0.999303467166313,'2015-03-01 18:27:25',310),(221,12089.96,5,1,269,NULL,1,0.999586433702014,'2015-03-01 18:27:25',311),(222,12089.96,5,1,269,NULL,1,0.999586433702014,'2015-03-01 18:27:25',311),(223,9.99999977777782,-11.1111113333333,6,14,NULL,1,1,'2015-03-01 19:34:06',427),(224,19.9999997777778,-11.1111113333333,6,2,NULL,1,1,'2015-03-01 19:34:06',428),(225,29.9999997777778,-11.1111113333333,6,1,NULL,1,1,'2015-03-01 19:34:06',429),(226,341.93,300,4,10,NULL,1,0.122627438364578,'2015-03-01 19:34:06',719),(227,425.81,380,4,9,NULL,1,0.107583194382471,'2015-03-01 19:34:06',720),(228,27.87,0.12,4,6,NULL,1,0.995694294940797,'2015-03-01 21:15:49',731),(229,39.3,36,4,7,NULL,1,0.0839694656488549,'2015-03-01 21:33:50',732),(230,86.97,55,4,5,NULL,1,0.367598022306542,'2015-03-01 21:33:50',777),(231,46.08,0.1,4,6,NULL,1,0.997829861111111,'2015-03-01 21:33:50',776),(232,0.03,5,4,2,NULL,1,1,'2015-03-01 21:33:50',830),(233,0.35,4,4,2,NULL,1,1,'2015-03-01 21:33:50',787),(234,1584036.73,6,4,2,NULL,1,0.999996212209044,'2015-03-01 21:33:50',812),(235,107.86,7,4,2,NULL,1,0.935101056925644,'2015-03-01 21:33:50',738),(236,168.76,45,4,3,NULL,1,0.733349134866082,'2015-03-01 21:33:50',779),(237,12504.79,32,4,2,NULL,1,0.997440980616228,'2015-03-01 21:33:50',801),(238,5.18,54,4,2,NULL,1,1,'2015-03-01 21:33:50',775),(239,127.87,25,4,2,NULL,1,0.804488934073669,'2015-03-01 21:33:50',778),(240,16733.75,32,4,3,NULL,1,0.998087697019497,'2015-03-01 21:33:50',802),(241,1954146.03,5,4,2,NULL,1,0.999997441337585,'2015-03-01 21:33:50',813),(242,8.33,25,4,2,NULL,1,1,'2015-03-01 21:33:50',756),(243,209.66,65,4,2,NULL,1,0.689974244014118,'2015-03-01 21:33:50',780),(244,130.71,4,4,2,NULL,1,0.969397903756407,'2015-03-01 21:33:50',740),(245,843818.13,575,4,2,NULL,1,0.999318573541434,'2015-03-01 21:33:50',810),(246,0.47,45,4,2,NULL,1,1,'2015-03-01 21:33:50',789),(247,17.27,654,4,2,NULL,1,1,'2015-03-01 21:33:50',771),(248,52.51,25,4,2,NULL,1,0.523900209483908,'2015-03-01 21:33:50',761),(249,4.78,12,4,2,NULL,1,1,'2015-03-01 21:33:50',763),(250,20962.72,54,4,2,NULL,1,0.99742399841242,'2015-03-01 21:33:50',803),(251,96.43,254,4,3,NULL,1,1,'2015-03-01 21:33:50',737),(252,6.01,54,4,2,NULL,1,1,'2015-03-01 21:33:50',798),(253,0.01,21,4,2,NULL,1,1,'2015-03-01 21:33:50',818),(254,29420.65,0.01,4,1,NULL,1,0.999999660102683,'2015-03-01 21:33:50',805),(255,646.05,14,4,2,NULL,1,0.978329850630756,'2015-03-01 21:33:50',750),(256,0.000001,57,4,2,NULL,1,1,'2015-03-01 21:33:50',817),(257,142.14,7,4,2,NULL,1,0.950752778950331,'2015-03-01 21:33:50',741),(258,0.04,21,4,2,NULL,1,1,'2015-03-01 21:33:50',832),(259,5.49,24,4,2,NULL,1,1,'2015-03-01 21:33:50',744),(260,2.52,74,4,2,NULL,1,1,'2015-03-01 21:33:50',791),(261,14.99,132,5,12,NULL,1,1,'2015-03-02 08:47:47',649),(262,10.56,15,4,11,NULL,1,0.420454545454545,'2015-03-02 08:47:47',770),(263,0.000001,13,4,4,NULL,1,1,'2015-03-02 08:47:47',816),(264,64.59,456,4,3,NULL,1,1,'2015-03-02 08:47:47',762),(265,8275.82,12,4,3,NULL,1,0.998549992629129,'2015-03-02 08:47:47',800),(266,83.05,16,4,3,NULL,1,0.807344972907887,'2015-03-02 08:47:47',767),(267,16.26,75,4,3,NULL,1,1,'2015-03-02 08:47:47',758),(268,0.03,132,4,4,NULL,1,1,'2015-03-02 08:47:47',829),(269,4.01,456,4,3,NULL,1,1,'2015-03-02 08:47:47',794),(270,37.37,12,4,3,NULL,1,0.678886807599679,'2015-03-02 08:47:47',774),(271,0.05,12,4,3,NULL,1,1,'2015-03-02 08:47:47',782),(272,119.29,2,4,3,NULL,1,0.983234135300528,'2015-03-02 08:47:47',739),(273,5.09,3,4,3,NULL,1,0.410609037328094,'2015-03-02 08:47:47',754),(274,448.64,12,4,3,NULL,1,0.973252496433666,'2015-03-02 09:06:29',749),(275,448.64,12,4,3,NULL,1,0.973252496433666,'2015-03-02 09:06:29',749),(276,0.17,12,4,3,NULL,1,1,'2015-03-02 09:06:29',784),(277,0.11,145,4,10,NULL,1,1,'2015-03-02 09:12:02',783),(278,4.18,123,4,3,NULL,1,1,'2015-03-02 09:12:02',757),(279,3.48,12,4,3,NULL,1,1,'2015-03-02 09:12:02',753),(280,37878.58,63,4,3,NULL,1,0.998336790872308,'2015-03-02 09:12:02',807),(281,7.43,12,4,4,NULL,1,0.61507402422611,'2015-03-02 09:12:02',745),(282,0.01,32,4,4,NULL,1,1,'2015-03-02 09:12:02',819),(283,63.48,14,4,3,NULL,1,0.779458097038437,'2015-03-02 09:12:02',766),(284,25191.68,145,4,3,NULL,1,0.994244131395762,'2015-03-02 09:12:02',804),(285,9.36,12,4,3,NULL,1,0.282051282051282,'2015-03-02 09:12:02',746),(286,3.86,2,4,3,NULL,1,0.481865284974093,'2015-03-02 09:12:02',769),(287,102.62,12,4,3,NULL,1,0.883063730267004,'2015-03-02 09:12:02',768),(288,2.02,132,4,60,NULL,1,1,'2015-03-02 09:12:02',790),(289,28.34,145,4,3,NULL,1,1,'2015-03-02 09:12:02',759),(290,30.67,145,4,3,NULL,1,1,'2015-03-02 09:12:02',773),(291,53.82,123,4,4,NULL,1,1,'2015-03-02 09:12:02',747),(292,1.61,45,4,2,NULL,1,1,'2015-03-02 09:12:02',742),(293,6.71,145,4,5,NULL,1,1,'2015-03-02 09:12:02',755),(294,3.55,14,4,3,NULL,1,1,'2015-03-02 09:12:02',743),(295,73.58,14,4,5,NULL,1,0.809730905137266,'2015-03-02 09:12:02',735),(296,50.73,14,4,3,NULL,1,0.724029174058742,'2015-03-02 09:12:02',733),(297,103599.52,145,4,3,NULL,1,0.998600379615658,'2015-03-02 09:12:02',808),(298,1213927.43,145,4,4,NULL,1,0.999880552991541,'2015-03-02 09:12:02',811),(299,85.01,14,4,3,NULL,1,0.835313492530291,'2015-03-02 09:12:02',736),(300,5.51,14,4,3,NULL,1,1,'2015-03-02 09:12:02',797),(301,0.41,145,4,3,NULL,1,1,'2015-03-02 09:12:02',788),(302,1.86,1325,4,4,NULL,1,1,'2015-03-02 09:12:02',752),(303,5.01,25,4,3,NULL,1,1,'2015-03-02 09:12:02',796),(304,0.01,15,4,11,NULL,1,1,'2015-03-02 09:12:02',824),(305,0.03,255,4,2,NULL,1,1,'2015-03-02 09:12:02',831),(306,0.01,255,4,3,NULL,1,1,'2015-03-02 09:12:02',825),(307,0.01,25,4,2,NULL,1,1,'2015-03-02 09:12:02',820),(308,43.92,145,4,3,NULL,1,1,'2015-03-02 09:12:02',765),(309,23.97,24,4,4,NULL,1,0.00125156445556951,'2015-03-02 09:12:02',772),(310,0.000001,145,4,3,NULL,1,1,'2015-03-02 09:12:02',822),(311,843.46,145,4,3,NULL,1,0.828089061721955,'2015-03-02 09:12:02',751),(312,36.39,-0.01,1,6,NULL,1,1,'2015-03-02 17:07:00',366),(313,305,85,9,184,NULL,0,0.721311475409836,'2015-03-02 19:21:41',1081),(314,350,350,9,7,NULL,0,0,'2015-03-02 19:21:41',1071),(315,163,160,9,8,NULL,0,0.0184049079754601,'2015-03-02 19:21:41',1067),(316,90.77,132,5,4,NULL,1,0.454224964195219,'2015-03-02 19:21:41',685),(317,154,150,9,12,NULL,0,0.025974025974026,'2015-03-02 19:21:41',1065),(318,341,150,9,8,NULL,0,0.560117302052786,'2015-03-03 08:47:14',1073),(319,30,20,10,9,NULL,0,0.333333333333333,'2015-03-03 08:56:08',1148),(320,75,87,10,12,NULL,0,0.16,'2015-03-03 08:56:08',1157),(321,20,20,10,5,NULL,0,0,'2015-03-03 08:56:08',1146),(322,50,50,10,7,NULL,0,0,'2015-03-03 08:56:08',1152),(323,1526.49,14,1,9,NULL,1,0.99082863300775,'2015-03-03 13:27:14',377),(324,29.99,145,1,4,NULL,1,1,'2015-03-04 09:16:27',330),(325,1371.57,1350,1,24,NULL,1,0.015726503204357,'2015-03-04 09:18:16',416),(326,17732.5,123,1,1,2,1,0.993063583815029,'2015-03-08 11:22:07',320),(327,17732.48,123,1,1,2,1,0.993063575991627,'2015-03-08 11:22:58',320),(328,17732.48,123,1,1,2,1,0.993063575991627,'2015-03-08 11:28:57',320),(329,17732.48,123,1,1,2,1,0.993063575991627,'2015-03-08 11:32:01',320),(330,17732.48,123,1,1,2,1,0.993063575991627,'2015-03-08 11:32:01',320),(331,17732.48,123,1,2,2,1,0.993063575991627,'2015-03-08 11:41:59',320),(332,81.8181818181818,90,10,6,2,1,0.0999999999999999,'2015-03-09 16:27:18',1160),(333,183.5,145,9,3,2,1,0.209809264305177,'2015-03-09 16:44:23',1108),(334,77.2727272727273,90,10,4,2,1,0.164705882352941,'2015-03-09 16:44:23',1159),(335,72.7272727272727,77,10,7,2,1,0.0587499999999999,'2015-03-09 16:44:23',1158),(336,72.7272727272727,72,10,5,2,1,0.0100000000000001,'2015-03-09 16:44:23',1158),(337,77.2727272727273,75,10,4,2,1,0.0294117647058823,'2015-03-09 16:44:23',1159),(338,81.8181818181818,80,10,5,2,1,0.0222222222222223,'2015-03-09 16:44:23',1160),(339,68.1818181818182,80,10,5,2,1,0.173333333333333,'2015-03-09 17:05:24',1157),(340,176.5,123,9,3,2,1,0.303116147308782,'2015-03-09 17:26:53',1070),(341,68.1818181818182,123,10,9,2,1,0.804,'2015-03-09 17:26:53',1157),(342,68.1818181818182,75,10,17,2,1,0.1,'2015-03-09 17:26:53',1157),(343,7500,72,10,2,2,1,0.9904,'2015-03-09 17:34:56',1157),(344,75,75,10,3,2,1,0,'2015-03-09 17:35:10',1157),(345,70,65,10,3,2,1,0.0714285714285714,'2015-03-09 17:35:10',1156),(346,70,70,10,4,2,1,0,'2015-03-09 17:35:10',1156),(347,65,65,10,3,2,1,0,'2015-03-09 17:35:10',1155),(348,60,60,10,6,2,1,0,'2015-03-09 17:35:10',1154),(349,55,50,10,3,2,1,0.0909090909090909,'2015-03-09 17:35:10',1153),(350,55,50,10,3,2,1,0.0909090909090909,'2015-03-09 17:35:10',1153),(351,70,60,10,3,2,1,0.142857142857143,'2015-03-09 17:35:10',1156),(352,55,50,10,5,2,1,0.0909090909090909,'2015-03-09 17:35:10',1153),(353,70,70,10,4,2,1,0,'2015-03-09 17:35:10',1156),(354,70,70,10,4,2,1,0,'2015-03-09 17:35:10',1156),(355,70,70,10,4,2,1,0,'2015-03-09 17:35:10',1156),(356,55,50,10,6,2,1,0.0909090909090909,'2015-03-09 17:35:10',1153),(357,55,70,10,3,2,1,0.272727272727273,'2015-03-09 17:35:10',1153),(358,55,60,10,3,2,1,0.0909090909090909,'2015-03-09 17:35:10',1153),(359,55,60,10,3,2,1,0.0909090909090909,'2015-03-09 17:35:10',1153),(360,55,60,10,3,2,1,0.0909090909090909,'2015-03-09 17:35:10',1153),(361,75,40,10,5,2,1,0.466666666666667,'2015-03-09 17:35:10',1157),(362,75,40,10,5,2,1,0.466666666666667,'2015-03-09 17:35:10',1157),(363,75,40,10,5,2,1,0.466666666666667,'2015-03-09 17:35:10',1157),(364,75,40,10,5,2,1,0.466666666666667,'2015-03-09 17:35:10',1157),(365,75,40,10,5,2,1,0.466666666666667,'2015-03-09 17:35:10',1157),(366,50,50,10,10,2,1,0,'2015-03-09 17:35:10',1152),(367,50,50,10,10,2,1,0,'2015-03-09 17:35:10',1152),(368,50,50,10,10,2,1,0,'2015-03-09 17:35:10',1152),(369,75,60,10,3,2,1,0.2,'2015-03-09 17:35:10',1157),(370,75,60,10,3,2,1,0.2,'2015-03-09 17:35:10',1157),(371,75,60,10,3,2,1,0.2,'2015-03-09 17:35:10',1157),(372,45,12,10,7,2,1,0.733333333333333,'2015-03-09 18:00:08',1151),(373,41.63,123,1,3,2,1,1,'2015-03-09 18:03:47',370),(374,1582,145,1,2,2,1,0.90834386852086,'2015-03-09 18:09:59',420),(375,62.95,155,1,3,2,1,1,'2015-03-09 18:09:59',270),(376,45,123,10,11,2,1,1,'2015-03-09 18:11:24',1151),(377,14,19,8,13,2,1,0.357142857142857,'2015-03-09 18:11:24',1143),(378,13,13,8,6,2,1,0,'2015-03-09 18:15:54',1142),(379,188,123,9,3,2,1,0.345744680851064,'2015-03-11 17:02:48',1107),(380,6.6,5,11,2,2,1,0.242424242424242,'2015-03-11 17:06:22',1180),(381,2,14,11,3,2,1,1,'2015-03-11 17:06:22',1183),(382,1.36,1,11,13,2,1,0.264705882352941,'2015-03-11 17:06:22',1199),(383,3.83,5,11,8,2,1,0.305483028720627,'2015-03-11 17:06:22',1198),(384,3.84,3,11,8,2,1,0.21875,'2015-03-11 17:06:22',1197),(385,1.09,1.1,11,12,2,1,0.00917431192660551,'2015-03-11 17:06:22',1195),(387,1024,1024,13,21,2,1,0,'2015-03-12 15:37:09',1230),(388,263.07,12,3,14,2,1,0.954384764511347,'2015-03-12 16:10:38',894),(389,5.44,16,3,8,2,1,1,'2015-03-12 16:10:38',1005),(390,20.58,63,3,72,2,1,1,'2015-03-12 22:18:25',966),(391,20.58,123,3,3,2,1,1,'2015-03-12 22:18:25',966),(392,20.58,15,3,4,2,1,0.271137026239067,'2015-03-12 22:18:25',966),(393,11,15,12,23,2,1,0.363636363636364,'2015-03-13 10:07:03',1210),(394,11,11,12,6,2,1,0,'2015-03-13 10:07:03',1210),(395,11,11,12,4,2,1,0,'2015-03-13 10:07:03',1210),(396,11,6,12,9,2,1,0.454545454545455,'2015-03-13 10:07:03',1210),(397,0.45,16,3,4,2,1,1,'2015-03-13 10:07:03',947),(398,32,256,13,3,2,1,1,'2015-03-13 10:07:03',1225),(399,32,32,13,3,2,1,0,'2015-03-13 17:13:33',1225),(400,29420.65,145,4,4,2,1,0.995071488903202,'2015-03-13 17:16:10',805),(401,42.18,123,1,4,2,1,1,'2015-03-13 17:20:13',336),(402,41.5,45,9,4,2,1,0.0843373493975904,'2015-03-13 17:20:13',1040),(403,6,6,12,4,2,1,0,'2015-03-13 17:32:10',1208),(404,8,123,12,5,2,1,1,'2015-03-13 17:33:57',1209),(405,17,20,12,11,2,1,0.176470588235294,'2015-03-13 17:33:57',1203),(406,6,6,12,3,2,1,0,'2015-03-13 17:33:57',1208),(407,4,4,12,3,2,1,0,'2015-03-13 17:33:57',1212),(408,132.81,123,1,3,2,1,0.0738649198102553,'2015-03-13 17:35:44',282),(409,3526.7,1235,1,4,2,1,0.649814273967165,'2015-03-13 17:36:28',393),(410,132.85,123,1,3,2,1,0.074143771170493,'2015-03-13 17:37:02',282),(411,17103.8,1656,1,5,2,1,0.903179410423415,'2015-03-13 17:44:36',319),(413,16505.26,123,1,25,52,1,0.992547830206855,'2015-03-14 13:49:17',318),(414,1.09,1.1,11,5,54,1,0.00917431192660551,'2015-03-15 11:48:27',1195),(415,1.09,1.1,11,5,54,1,0.00917431192660551,'2015-03-15 11:48:27',1195),(416,3,5,11,25,54,1,0.666666666666667,'2015-03-15 11:48:27',1185),(417,1.39,1.6,11,9,54,1,0.151079136690648,'2015-03-15 11:48:27',1196),(418,28.67,20,11,6,54,1,0.30240669689571,'2015-03-15 11:48:27',1192),(419,4.87,9,11,6,54,1,0.848049281314168,'2015-03-15 11:48:27',1187),(420,3.24,4,11,12,54,1,0.234567901234568,'2015-03-15 11:48:27',1189),(421,138.57,13,3,5,55,1,0.906184599841235,'2015-03-15 11:48:27',1023),(422,27.43,12,3,3,55,1,0.5625227852716,'2015-03-15 12:12:06',967),(423,8.01,15,3,3,55,1,0.872659176029963,'2015-03-15 12:12:06',923),(424,54.69,45,3,4,55,1,0.177180471749863,'2015-03-15 12:12:06',888);
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
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning_params`
--

LOCK TABLES `learning_params` WRITE;
/*!40000 ALTER TABLE `learning_params` DISABLE KEYS */;
INSERT INTO `learning_params` VALUES (51,5,'m','yard'),(53,5,'inch','cm'),(54,1,'EUR','HUF'),(55,3,'pint','dm**3'),(56,1,'EUR','CHF'),(57,1,'EUR','PLN'),(58,2,'CZK','EUR'),(59,9,'inn','-1'),(60,5,'m','km'),(61,3,'cup','dl'),(62,5,'inch','dm'),(63,10,'50','110'),(64,3,'dm**3','cup'),(65,4,'ft**2','dm**2'),(66,4,'km**2','mile**2'),(67,3,'dl','cup'),(68,5,'cm','inch'),(69,5,'m','ft'),(70,3,'yard**3','m**3'),(71,3,'dl','pint'),(72,6,'degC','kelvin'),(73,4,'mile**2','are'),(74,5,'ft','dm'),(75,1,'EUR','RUB'),(76,1,'EUR','USD'),(77,4,'are','acre'),(78,4,'are','mile**2'),(79,2,'CZK','RUB'),(80,6,'degF','degC'),(81,4,'m**2','yard**2'),(82,2,'CZK','PLN'),(83,3,'dm**3','pint'),(84,5,'dm','inch'),(85,3,'pint','dl'),(86,5,'ft','m'),(87,4,'m**2','ft**2'),(88,2,'CZK','GBP'),(89,3,'tbsp','dl'),(90,3,'dm**3','tbsp'),(91,9,'out','-1'),(92,3,'m**3','ft**3'),(93,3,'dl','tbsp'),(94,4,'ft**2','m**2'),(95,1,'EUR','CZK'),(96,4,'mile**2','km**2'),(97,6,'degC','degF'),(98,2,'CZK','USD'),(99,1,'EUR','GBP'),(100,3,'dm**3','inch**3'),(101,3,'quart','dm**3'),(102,6,'degF','kelvin'),(103,3,'dm**3','quart'),(104,5,'yard','m'),(105,6,'kelvin','degF'),(106,4,'dm**2','ft**2'),(107,3,'cup','dm**3'),(108,4,'yard**2','m**2'),(109,4,'acre','are'),(110,4,'acre','km**2'),(111,4,'cm**2','inch**2'),(112,6,'kelvin','degC'),(113,8,'-1','-1'),(114,2,'CZK','CHF'),(115,5,'km','mile'),(116,3,'m**3','yard**3'),(117,4,'inch**2','cm**2'),(118,2,'CZK','HUF'),(119,5,'dm','ft'),(120,3,'ft**3','m**3'),(121,11,'50','-1'),(122,11,'132','-1'),(123,11,'80','-1'),(124,11,'99','-1'),(125,11,'73','-1'),(126,11,'110','-1'),(127,11,'115','-1'),(128,11,'86','-1'),(129,11,'72','-1'),(130,11,'96','-1'),(131,11,'46','-1'),(132,11,'15','-1'),(133,12,'5','5'),(134,12,'7','5'),(135,12,'1','10'),(136,12,'11','3'),(137,12,'3','9'),(138,12,'3','1'),(139,12,'5','1'),(140,12,'5','2'),(141,12,'3','2'),(142,12,'3','0'),(144,12,'3','4'),(145,13,'2','-1'),(146,13,'3','-1'),(147,13,'4','-1'),(148,13,'5','-1'),(149,13,'6','-1'),(150,13,'7','-1'),(151,13,'8','-1'),(152,13,'9','-1'),(153,13,'10','-1');
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning_type`
--

LOCK TABLES `learning_type` WRITE;
/*!40000 ALTER TABLE `learning_type` DISABLE KEYS */;
INSERT INTO `learning_type` VALUES (9,'angle'),(2,'c'),(1,'e'),(7,'equa'),(5,'len'),(11,'line'),(12,'obj'),(13,'sqr'),(8,'sqrt'),(4,'surf'),(6,'temp'),(3,'vol'),(10,'water');
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
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `learning_userskill_6340c63c` (`user_id`),
  KEY `learning_userskill_8a386586` (`concept_id`),
  CONSTRAINT `concept_id_refs_id_29dadd40f906e7ce` FOREIGN KEY (`concept_id`) REFERENCES `learning_params` (`id`),
  CONSTRAINT `user_id_refs_id_36ffc26e7528aad` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=324 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning_userskill`
--

LOCK TABLES `learning_userskill` WRITE;
/*!40000 ALTER TABLE `learning_userskill` DISABLE KEYS */;
INSERT INTO `learning_userskill` VALUES (1,2,0,54,2,'2015-03-13 17:44:36'),(2,2,0,56,1,'2015-03-13 17:20:13'),(3,2,0.450092609674388,57,2,'2015-03-13 17:37:02'),(4,2,0,75,1,'2015-03-13 17:36:28'),(5,2,0.113262200639444,76,1,'2015-03-09 18:09:59'),(6,2,0.113262200639444,95,1,'2015-03-09 18:09:59'),(7,2,0.113262200639444,99,1,'2015-03-09 18:03:47'),(8,2,2.13795249317856,113,2,'2015-03-09 18:15:54'),(9,2,4.00225148686244,63,32,'2015-03-09 18:11:24'),(10,2,0.123236645303597,59,2,'2015-03-13 17:20:13'),(11,2,0.23461305718011,91,2,'2015-03-11 17:02:48'),(12,2,0,55,0,'2015-03-09 17:32:21'),(13,2,0,61,0,'2015-03-09 17:32:21'),(14,2,0,64,0,'2015-03-09 17:32:21'),(15,2,0,67,0,'2015-03-09 17:32:21'),(16,2,0,70,3,'2015-03-12 22:18:25'),(17,2,0.113262200639444,71,1,'2015-03-12 16:10:38'),(18,2,0,83,0,'2015-03-09 17:32:21'),(19,2,0,85,0,'2015-03-09 17:32:21'),(20,2,0,89,0,'2015-03-09 17:32:21'),(21,2,0.113262200639444,90,1,'2015-03-12 16:10:38'),(22,2,0,92,0,'2015-03-09 17:32:21'),(23,2,0,93,0,'2015-03-09 17:32:21'),(24,2,0,100,0,'2015-03-09 17:32:21'),(25,2,0,101,0,'2015-03-09 17:32:21'),(26,2,0,103,0,'2015-03-09 17:32:21'),(27,2,0,107,0,'2015-03-09 17:32:21'),(28,2,0,116,0,'2015-03-09 17:32:21'),(29,2,0,120,1,'2015-03-13 10:07:03'),(30,2,0.113262200639444,121,1,'2015-03-11 17:06:22'),(31,2,0.113262200639444,122,1,'2015-03-11 17:06:22'),(32,2,0,123,0,'2015-03-11 17:06:22'),(33,2,0,124,0,'2015-03-11 17:06:22'),(34,2,0,125,0,'2015-03-11 17:06:22'),(35,2,0,126,0,'2015-03-11 17:06:22'),(36,2,0,127,0,'2015-03-11 17:06:22'),(37,2,0,128,0,'2015-03-11 17:06:22'),(38,2,1.90841065574991,129,1,'2015-03-11 17:06:22'),(39,2,0.113262200639444,130,1,'2015-03-11 17:06:22'),(40,2,0.113262200639444,131,1,'2015-03-11 17:06:22'),(41,2,0.113262200639444,132,1,'2015-03-11 17:06:22'),(42,2,0,51,0,'2015-03-11 17:06:22'),(43,2,0,53,0,'2015-03-11 17:06:22'),(44,2,0,60,0,'2015-03-11 17:06:22'),(45,2,0,62,0,'2015-03-11 17:06:22'),(46,2,0,68,0,'2015-03-11 17:06:22'),(47,2,0,69,0,'2015-03-11 17:06:22'),(48,2,0,74,0,'2015-03-11 17:06:22'),(49,2,0,84,0,'2015-03-11 17:06:22'),(50,2,0,86,0,'2015-03-11 17:06:22'),(51,2,0,104,0,'2015-03-11 17:06:22'),(52,2,0,115,0,'2015-03-11 17:06:22'),(53,2,0,119,0,'2015-03-11 17:06:22'),(92,2,0,145,0,'2015-03-12 14:20:09'),(93,2,0,146,0,'2015-03-12 14:20:09'),(94,2,0,147,0,'2015-03-12 14:20:09'),(95,2,1,148,2,'2015-03-13 17:13:33'),(96,2,0,149,0,'2015-03-12 14:20:09'),(97,2,0,150,0,'2015-03-12 14:20:09'),(98,2,0,151,0,'2015-03-12 14:20:09'),(99,2,0,152,0,'2015-03-12 14:20:09'),(100,2,2.11636172608631,153,1,'2015-03-12 15:37:09'),(101,2,0,58,0,'2015-03-12 16:10:38'),(102,2,0,79,0,'2015-03-12 16:10:38'),(103,2,0,82,0,'2015-03-12 16:10:38'),(104,2,0,88,0,'2015-03-12 16:10:38'),(105,2,0,98,0,'2015-03-12 16:10:38'),(106,2,0,114,0,'2015-03-12 16:10:38'),(107,2,0,65,0,'2015-03-12 16:10:38'),(108,2,0,118,0,'2015-03-12 16:10:38'),(109,2,0,66,0,'2015-03-12 16:10:38'),(110,2,0,73,0,'2015-03-12 16:10:38'),(111,2,0,77,0,'2015-03-12 16:10:38'),(112,2,0,78,0,'2015-03-12 16:10:38'),(113,2,0,81,0,'2015-03-12 16:10:38'),(114,2,0,87,0,'2015-03-12 16:10:38'),(115,2,0,94,0,'2015-03-12 16:10:38'),(116,2,0,96,0,'2015-03-12 16:10:38'),(117,2,0,106,0,'2015-03-12 16:10:38'),(118,2,0,108,0,'2015-03-12 16:10:38'),(119,2,0,109,1,'2015-03-13 17:16:10'),(120,2,0,110,0,'2015-03-12 16:10:38'),(121,2,0,111,0,'2015-03-12 16:10:38'),(122,2,0,117,0,'2015-03-12 16:10:38'),(123,2,0,133,0,'2015-03-12 22:18:25'),(124,2,0,134,0,'2015-03-12 22:18:25'),(125,2,0,135,1,'2015-03-13 17:33:57'),(126,2,0,136,0,'2015-03-12 22:18:25'),(127,2,0,137,0,'2015-03-12 22:18:25'),(128,2,1,138,2,'2015-03-13 17:33:57'),(129,2,0,139,1,'2015-03-13 17:33:57'),(130,2,0.805516282882736,140,4,'2015-03-13 10:07:03'),(131,2,0,141,0,'2015-03-12 22:18:25'),(132,2,1,142,1,'2015-03-13 17:33:57'),(133,2,0,144,0,'2015-03-12 22:18:25'),(193,52,0,54,1,'2015-03-14 13:49:17'),(194,52,0,56,0,'2015-03-14 13:49:17'),(195,52,0,57,0,'2015-03-14 13:49:17'),(196,52,0,75,0,'2015-03-14 13:49:17'),(197,52,0,76,0,'2015-03-14 13:49:17'),(198,52,0,95,0,'2015-03-14 13:49:17'),(199,52,0,99,0,'2015-03-14 13:49:17'),(200,53,0,121,0,'2015-03-15 11:47:43'),(201,53,0,122,0,'2015-03-15 11:47:43'),(202,53,0,123,0,'2015-03-15 11:47:43'),(203,53,0,124,0,'2015-03-15 11:47:43'),(204,53,0,125,0,'2015-03-15 11:47:43'),(205,53,0,126,0,'2015-03-15 11:47:43'),(206,53,0,127,0,'2015-03-15 11:47:43'),(207,53,0,128,0,'2015-03-15 11:47:43'),(208,53,0,129,0,'2015-03-15 11:47:43'),(209,53,0,130,0,'2015-03-15 11:47:43'),(210,53,0,131,0,'2015-03-15 11:47:43'),(211,53,0,132,0,'2015-03-15 11:47:43'),(212,54,0,121,0,'2015-03-15 11:48:27'),(213,54,0,122,0,'2015-03-15 11:48:27'),(214,54,0,123,0,'2015-03-15 11:48:27'),(215,54,0,124,1,'2015-03-15 11:48:27'),(216,54,0,125,1,'2015-03-15 11:48:27'),(217,54,0,126,1,'2015-03-15 11:48:27'),(218,54,0,127,0,'2015-03-15 11:48:27'),(219,54,0,128,1,'2015-03-15 11:48:27'),(220,54,1,129,2,'2015-03-15 11:48:27'),(221,54,0,130,1,'2015-03-15 11:48:27'),(222,54,0,131,0,'2015-03-15 11:48:27'),(223,54,0,132,0,'2015-03-15 11:48:27'),(224,54,0,59,0,'2015-03-15 11:48:27'),(225,54,0,91,0,'2015-03-15 11:48:27'),(226,55,0,55,0,'2015-03-15 11:48:27'),(227,55,0,61,1,'2015-03-15 11:48:27'),(228,55,0,64,1,'2015-03-15 12:12:06'),(229,55,0,67,0,'2015-03-15 11:48:27'),(230,55,0,70,1,'2015-03-15 12:12:06'),(231,55,0,71,0,'2015-03-15 11:48:27'),(232,55,0,83,0,'2015-03-15 11:48:27'),(233,55,0,85,0,'2015-03-15 11:48:27'),(234,55,0,89,0,'2015-03-15 11:48:27'),(235,55,0,90,0,'2015-03-15 11:48:27'),(236,55,0,92,0,'2015-03-15 11:48:27'),(237,55,0,93,0,'2015-03-15 11:48:27'),(238,55,0,100,0,'2015-03-15 11:48:27'),(239,55,0,101,0,'2015-03-15 11:48:27'),(240,55,0,103,0,'2015-03-15 11:48:27'),(241,55,0,107,1,'2015-03-15 12:12:06'),(242,55,0,116,0,'2015-03-15 11:48:27'),(243,55,0,120,0,'2015-03-15 11:48:27'),(244,55,0,65,0,'2015-03-15 12:12:06'),(245,55,0,66,0,'2015-03-15 12:12:06'),(246,55,0,73,0,'2015-03-15 12:12:06'),(247,55,0,77,0,'2015-03-15 12:12:06'),(248,55,0,78,0,'2015-03-15 12:12:06'),(249,55,0,81,0,'2015-03-15 12:12:06'),(250,55,0,87,0,'2015-03-15 12:12:06'),(251,55,0,94,0,'2015-03-15 12:12:06'),(252,55,0,96,0,'2015-03-15 12:12:06'),(253,55,0,106,0,'2015-03-15 12:12:06'),(254,55,0,108,0,'2015-03-15 12:12:06'),(255,55,0,109,0,'2015-03-15 12:12:06'),(256,55,0,110,0,'2015-03-15 12:12:06'),(257,55,0,111,0,'2015-03-15 12:12:06'),(258,55,0,117,0,'2015-03-15 12:12:06'),(259,55,0,72,0,'2015-03-15 12:12:06'),(260,55,0,80,0,'2015-03-15 12:12:06'),(261,55,0,97,0,'2015-03-15 12:12:06'),(262,55,0,102,0,'2015-03-15 12:12:06'),(263,55,0,105,0,'2015-03-15 12:12:06'),(264,55,0,112,0,'2015-03-15 12:12:06'),(265,55,0,51,0,'2015-03-15 12:13:30'),(266,55,0,53,0,'2015-03-15 12:13:30'),(267,55,0,60,0,'2015-03-15 12:13:30'),(268,55,0,62,0,'2015-03-15 12:13:30'),(269,55,0,68,0,'2015-03-15 12:13:30'),(270,55,0,69,0,'2015-03-15 12:13:30'),(271,55,0,74,0,'2015-03-15 12:13:30'),(272,55,0,84,0,'2015-03-15 12:13:30'),(273,55,0,86,0,'2015-03-15 12:13:30'),(274,55,0,104,0,'2015-03-15 12:13:30'),(275,55,0,115,0,'2015-03-15 12:13:30'),(276,55,0,119,0,'2015-03-15 12:13:30'),(277,57,0,113,0,'2015-03-15 23:34:35'),(278,57,0,54,0,'2015-03-15 23:34:35'),(279,57,0,56,0,'2015-03-15 23:34:35'),(280,57,0,57,0,'2015-03-15 23:34:35'),(281,57,0,75,0,'2015-03-15 23:34:35'),(282,57,0,76,0,'2015-03-15 23:34:35'),(283,57,0,95,0,'2015-03-15 23:34:35'),(284,57,0,99,0,'2015-03-15 23:34:35'),(285,58,0,54,0,'2015-03-15 23:34:35'),(286,58,0,56,0,'2015-03-15 23:34:35'),(287,58,0,57,0,'2015-03-15 23:34:35'),(288,58,0,75,0,'2015-03-15 23:34:35'),(289,58,0,76,0,'2015-03-15 23:34:35'),(290,58,0,95,0,'2015-03-15 23:34:35'),(291,58,0,99,0,'2015-03-15 23:34:35'),(292,59,0,113,0,'2015-03-17 12:57:04'),(293,59,0,55,0,'2015-03-17 12:57:04'),(294,59,0,61,0,'2015-03-17 12:57:04'),(295,59,0,64,0,'2015-03-17 12:57:04'),(296,59,0,67,0,'2015-03-17 12:57:04'),(297,59,0,70,0,'2015-03-17 12:57:04'),(298,59,0,71,0,'2015-03-17 12:57:04'),(299,59,0,83,0,'2015-03-17 12:57:04'),(300,59,0,85,0,'2015-03-17 12:57:04'),(301,59,0,89,0,'2015-03-17 12:57:04'),(302,59,0,90,0,'2015-03-17 12:57:04'),(303,59,0,92,0,'2015-03-17 12:57:04'),(304,59,0,93,0,'2015-03-17 12:57:04'),(305,59,0,100,0,'2015-03-17 12:57:04'),(306,59,0,101,0,'2015-03-17 12:57:04'),(307,59,0,103,0,'2015-03-17 12:57:04'),(308,59,0,107,0,'2015-03-17 12:57:04'),(309,59,0,116,0,'2015-03-17 12:57:04'),(310,59,0,120,0,'2015-03-17 12:57:04'),(311,59,0,72,0,'2015-03-17 12:57:04'),(312,59,0,80,0,'2015-03-17 12:57:04'),(313,59,0,97,0,'2015-03-17 12:57:04'),(314,59,0,102,0,'2015-03-17 12:57:04'),(315,59,0,105,0,'2015-03-17 12:57:04'),(316,59,0,112,0,'2015-03-17 12:57:04'),(317,59,0,54,0,'2015-03-17 12:57:04'),(318,59,0,56,0,'2015-03-17 12:57:04'),(319,59,0,57,0,'2015-03-17 12:57:04'),(320,59,0,75,0,'2015-03-17 12:57:04'),(321,59,0,76,0,'2015-03-17 12:57:04'),(322,59,0,95,0,'2015-03-17 12:57:04'),(323,59,0,99,0,'2015-03-17 12:57:04');
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `south_migrationhistory`
--

LOCK TABLES `south_migrationhistory` WRITE;
/*!40000 ALTER TABLE `south_migrationhistory` DISABLE KEYS */;
INSERT INTO `south_migrationhistory` VALUES (1,'learning','0001_initial','2015-02-27 15:41:50'),(4,'learning','0003_auto__add_field_concept_params','2015-03-07 15:29:23'),(5,'learning','0004_auto__add_field_params_type','2015-03-07 15:30:15'),(6,'learning','0005_auto__add_field_params_p1','2015-03-07 15:30:58'),(7,'learning','0006_auto__add_field_params_p2','2015-03-07 15:31:17'),(8,'learning','0007_auto__del_field_params_param','2015-03-07 15:49:53'),(9,'learning','0008_auto__del_field_concept_param1','2015-03-07 15:51:00'),(10,'learning','0009_auto__del_field_concept_param2','2015-03-07 15:51:38'),(11,'learning','0010_auto__del_field_userskill_type__add_field_userskill_concept','2015-03-07 15:58:25'),(12,'learning','0011_auto__chg_field_userskill_concept','2015-03-07 15:59:33'),(13,'learning','0012_auto__add_field_concept_label','2015-03-07 16:22:30'),(14,'learning','0013_auto__add_field_userskill_number__add_field_userskill_date','2015-03-07 16:59:11'),(15,'learning','0014_auto__chg_field_params_p2','2015-03-09 18:41:04'),(16,'lazysignup','0001_initial','2015-03-11 20:25:48'),(17,'lazysignup','0002_auto__add_field_lazyuser_created','2015-03-11 20:25:49'),(18,'lazysignup','0003_auto','2015-03-11 22:38:20'),(19,'lazysignup','0004_initial','2015-03-11 22:48:26'),(20,'social_auth','0001_initial','2015-03-12 10:27:22'),(21,'social_auth','0002_auto__add_unique_nonce_timestamp_salt_server_url__add_unique_associati','2015-03-12 10:27:22'),(22,'social_auth','0003_initial','2015-03-12 10:29:21'),(23,'social_auth','0004_auto__chg_field_usersocialauth_uid__chg_field_nonce_server_url__chg_fi','2015-03-14 11:16:32'),(24,'social_auth','0005_auto__chg_field_usersocialauth_uid','2015-03-14 13:38:01'),(25,'social_auth','0006_auto__chg_field_nonce_server_url__chg_field_association_handle__chg_fi','2015-03-14 13:42:48'),(26,'social_auth','0007_initial','2015-03-14 13:47:04'),(27,'learning','0015_auto__add_field_concept_updatedTimes','2015-03-16 14:15:03');
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

-- Dump completed on 2015-03-17 14:59:23
