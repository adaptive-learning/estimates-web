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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add migration history',1,'add_migrationhistory'),(2,'Can change migration history',1,'change_migrationhistory'),(3,'Can delete migration history',1,'delete_migrationhistory'),(4,'Can add log entry',2,'add_logentry'),(5,'Can change log entry',2,'change_logentry'),(6,'Can delete log entry',2,'delete_logentry'),(7,'Can add permission',3,'add_permission'),(8,'Can change permission',3,'change_permission'),(9,'Can delete permission',3,'delete_permission'),(10,'Can add group',4,'add_group'),(11,'Can change group',4,'change_group'),(12,'Can delete group',4,'delete_group'),(13,'Can add user',5,'add_user'),(14,'Can change user',5,'change_user'),(15,'Can delete user',5,'delete_user'),(16,'Can add content type',6,'add_contenttype'),(17,'Can change content type',6,'change_contenttype'),(18,'Can delete content type',6,'delete_contenttype'),(19,'Can add session',7,'add_session'),(20,'Can change session',7,'change_session'),(21,'Can delete session',7,'delete_session'),(22,'Can add float model',8,'add_floatmodel'),(23,'Can change float model',8,'change_floatmodel'),(24,'Can delete float model',8,'delete_floatmodel'),(25,'Can add concept question',9,'add_conceptquestion'),(26,'Can change concept question',9,'change_conceptquestion'),(27,'Can delete concept question',9,'delete_conceptquestion'),(28,'Can add number',10,'add_number'),(29,'Can change number',10,'change_number'),(30,'Can delete number',10,'delete_number'),(31,'Can add type',11,'add_type'),(32,'Can change type',11,'change_type'),(33,'Can delete type',11,'delete_type'),(34,'Can add user skill',12,'add_userskill'),(35,'Can change user skill',12,'change_userskill'),(36,'Can delete user skill',12,'delete_userskill'),(37,'Can add curr table',13,'add_currtable'),(38,'Can change curr table',13,'change_currtable'),(39,'Can delete curr table',13,'delete_currtable'),(40,'Can add concept',14,'add_concept'),(41,'Can change concept',14,'change_concept'),(42,'Can delete concept',14,'delete_concept'),(43,'Can add lazy user',15,'add_lazyuser'),(44,'Can change lazy user',15,'change_lazyuser'),(45,'Can delete lazy user',15,'delete_lazyuser'),(46,'Can add user social auth',16,'add_usersocialauth'),(47,'Can change user social auth',16,'change_usersocialauth'),(48,'Can delete user social auth',16,'delete_usersocialauth'),(49,'Can add nonce',17,'add_nonce'),(50,'Can change nonce',17,'change_nonce'),(51,'Can delete nonce',17,'delete_nonce'),(52,'Can add association',18,'add_association'),(53,'Can change association',18,'change_association'),(54,'Can delete association',18,'delete_association');
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
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$12000$PDd8jDlCSwnc$O/+HrsuzJ2aHKFYZzxt+wjLRdCZOhPjHTl9CBya3CBg=','2015-04-17 13:10:57',1,'roman','','','stone99@azet.sk',1,1,'2015-04-17 13:10:57'),(2,'!xQt3UjbnxSYEU6wCsEvc3wkRSbdb1AnloEn7fPRa','2015-04-17 13:26:48',0,'80454bed5c224bf69f5c5936cfbbe7','','','',0,1,'2015-04-17 13:26:48'),(3,'!0zBkvp5R8i9tNb2imjW8gworhmkLF8hZlQgJ3EPC','2015-04-17 15:28:43',0,'75c63363a54741a289f50915cf9a90','','','',0,1,'2015-04-17 15:28:43'),(4,'!vZqwRw6iHroOWXtBrIqOEFLGJ0VJYF3uDgqXLSqY','2015-04-17 18:19:15',0,'ab5005519afc492b920f4761d5257c','','','',0,1,'2015-04-17 18:19:15'),(5,'!vzUmXeYoldgMtn2PfnTh0wSltx0AYC465nyJfza1','2015-04-17 18:20:16',0,'d0a098bffe274cfea2c7cbf115043d','','','',0,1,'2015-04-17 18:20:16'),(6,'!ymAymj5KxKeTtM5fBKTJoSLmhelbcuk1O1vNRYyX','2015-04-17 18:21:02',0,'5156d2b2ec9d48a7b95272917d3bfa','','','',0,1,'2015-04-17 18:21:02'),(7,'!BBLvWmy3RqGhXRdQVPWeiFZouKi9JQBaVIVGGYbm','2015-04-17 18:21:41',0,'b50928453ae74f77bc72428b3315da','','','',0,1,'2015-04-17 18:21:41');
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
  CONSTRAINT `user_id_refs_id_40c41112` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `group_id_refs_id_274b862c` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  CONSTRAINT `user_id_refs_id_4dc23c39` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `permission_id_refs_id_35d9ac25` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'migration history','south','migrationhistory'),(2,'log entry','admin','logentry'),(3,'permission','auth','permission'),(4,'group','auth','group'),(5,'user','auth','user'),(6,'content type','contenttypes','contenttype'),(7,'session','sessions','session'),(8,'float model','learning','floatmodel'),(9,'concept question','learning','conceptquestion'),(10,'number','learning','number'),(11,'type','learning','type'),(12,'user skill','learning','userskill'),(13,'curr table','learning','currtable'),(14,'concept','learning','concept'),(15,'lazy user','lazysignup','lazyuser'),(16,'user social auth','social_auth','usersocialauth'),(17,'nonce','social_auth','nonce'),(18,'association','social_auth','association');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('9sl92xqq3tu2s5gvvt18rcvidp1g74vj','ZTM5M2UwOTM3MzNkNjQxYWQyM2RlNzM4NTJhYmJjZjdhM2FjYWU0NDqAAn1xAS4=','2015-05-01 18:06:21'),('9zbjnrfjm02tup4srkanywghwtxzcd8p','NTBmOTkyZmJiN2JlOWE1NGQ3YTliZmUyZmVkNWI3MjBhYmViOWFmYTqAAn1xAShVA3BhclgDAAAANSA1VRJfYXV0aF91c2VyX2JhY2tlbmRVJWxhenlzaWdudXAuYmFja2VuZHMuTGF6eVNpZ251cEJhY2tlbmRVDV9hdXRoX3VzZXJfaWSKAQNVBGhpbnSJdS4=','2015-05-01 16:26:17'),('ass67iwm6qi9786tm66mumo3tbgosyo4','MGQ4ZjViZjRmZjJhYTg3ZDFjZTE4MDdlYmJkZTkwYzU1NDRjZjk5NjqAAn1xAShVA3BhclgBAAAAMFUNX2F1dGhfdXNlcl9pZIoBAlUEaGludIlVEl9hdXRoX3VzZXJfYmFja2VuZFUlbGF6eXNpZ251cC5iYWNrZW5kcy5MYXp5U2lnbnVwQmFja2VuZFUFcHJlZnBYAwAAAEVVUlUPZGphbmdvX2xhbmd1YWdlWAIAAABlbnUu','2015-05-01 13:53:50'),('hskd71h8g8gqd8008erasu8vlbzyxzrm','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AIdqDAEAAIV1VQxleHRyYV90YWJsZXNyEAEAAClVCWFsaWFzX21hcHIRAQAAfXISAQAAKGoMAQAAY2RqYW5nby5kYi5tb2RlbHMuc3FsLmNvbnN0YW50cwpKb2luSW5mbwpyEwEAAChqDAEAAGoMAQAAVQpJTk5FUiBKT0lOchQBAABqCwEAAGoPAQAAiWNkamFuZ28uZGIubW9kZWxzLmZpZWxkcwpfbG9hZF9maWVsZApyFQEAAGgOaA9oIodSchYBAAB0gXIXAQAAagsBAABqEwEAAChqCwEAAGoLAQAATk5OToaFchgBAACJTnSBchkBAAB1VQZ0YWJsZXNyGgEAAF1yGwEAAChqCwEAAGoMAQAAZVUMdXNlZF9hbGlhc2VzchwBAABjX19idWlsdGluX18Kc2V0CnIdAQAAXXIeAQAAKGoMAQAAagsBAABlhVJyHwEAAFUIb3JkZXJfYnlyIAEAAF1VCGRpc3RpbmN0ciEBAACJVQhncm91cF9ieXIiAQAATlURc2VsZWN0X2Zvcl91cGRhdGVyIwEAAIlVDnNlbGVjdF9yZWxhdGVkciQBAACJVRBkZWZlcnJlZF9sb2FkaW5nciUBAABqHQEAAF2FUnImAQAAiIZVCXRhYmxlX21hcHInAQAAfXIoAQAAKGoMAQAAXXIpAQAAagwBAABhagsBAABdcioBAABqCwEAAGF1VRNfZXh0cmFfc2VsZWN0X2NhY2hlcisBAABOVQltYXhfZGVwdGhyLAEAAEsFVQZzZWxlY3RyLQEAAF1VDmV4dHJhX29yZGVyX2J5ci4BAAApVQ9kaXN0aW5jdF9maWVsZHNyLwEAAF1VCmFnZ3JlZ2F0ZXNyMAEAAGoFAQAAKYFyMQEAAH1yMgEAAGoIAQAAXXNiVRlfbG9hZGVkX2ZpZWxkX25hbWVzX2NhY2hlcjMBAAB9VRFleHRyYV9zZWxlY3RfbWFza3I0AQAATlUYc2VsZWN0X2Zvcl91cGRhdGVfbm93YWl0cjUBAACJVQhsb3dfbWFya3I2AQAASwBVDmFsaWFzX3JlZmNvdW50cjcBAAB9cjgBAAAoagwBAABLAGoLAQAASwF1VRNyZWxhdGVkX3NlbGVjdF9jb2xzcjkBAABdVQxkZWZhdWx0X2NvbHNyOgEAAIhVBmhhdmluZ3I7AQAAY2RqYW5nby5k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','2015-05-01 21:20:39'),('zccsw9gfxnn8k9szhlz77hc1jkabpct5','ZTM5M2UwOTM3MzNkNjQxYWQyM2RlNzM4NTJhYmJjZjdhM2FjYWU0NDqAAn1xAS4=','2015-05-01 18:06:22');
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
  `created` datetime NOT NULL DEFAULT '2015-04-17 13:11:19',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `lazysignup_lazyuser_63b5ea41` (`created`),
  CONSTRAINT `user_id_refs_id_4f30feac7e9c929` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lazysignup_lazyuser`
--

LOCK TABLES `lazysignup_lazyuser` WRITE;
/*!40000 ALTER TABLE `lazysignup_lazyuser` DISABLE KEYS */;
INSERT INTO `lazysignup_lazyuser` VALUES (1,2,'2015-04-17 13:26:48'),(2,3,'2015-04-17 15:28:43'),(3,4,'2015-04-17 18:19:15'),(4,5,'2015-04-17 18:20:16'),(5,6,'2015-04-17 18:21:02'),(6,7,'2015-04-17 18:21:41');
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
  `p1` varchar(20) DEFAULT NULL,
  `p2` varchar(20) DEFAULT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `learning_concept_403d8ff3` (`type_id`),
  CONSTRAINT `type_id_refs_id_c42e7baa` FOREIGN KEY (`type_id`) REFERENCES `learning_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning_concept`
--

LOCK TABLES `learning_concept` WRITE;
/*!40000 ALTER TABLE `learning_concept` DISABLE KEYS */;
INSERT INTO `learning_concept` VALUES (1,'m','yard',6),(2,'inch','cm',6),(3,'EUR','HUF',3),(4,'pint','dm**3',14),(5,'EUR','CHF',3),(6,'EUR','PLN',3),(7,'CZK','EUR',3),(8,NULL,NULL,1),(9,'m','km',6),(10,'cup','dl',14),(11,'inch','dm',6),(12,NULL,NULL,15),(13,'dm**3','cup',14),(14,'ft**2','dm**2',12),(15,'km**2','mile**2',12),(16,'m','ft',6),(17,'yard**3','m**3',14),(18,'dl','pint',14),(19,'degC','kelvin',13),(20,'mile**2','are',12),(21,'ft','dm',6),(22,'EUR','RUB',3),(23,'EUR','USD',3),(24,'are','acre',12),(25,'CZK','RUB',3),(26,'degF','degC',13),(27,'m**2','yard**2',12),(28,'CZK','PLN',3),(29,'m**2','ft**2',12),(30,'CZK','GBP',3),(31,'tbsp','dl',14),(32,'dm**3','tbsp',14),(33,'m**3','ft**3',14),(34,'CZK','USD',3),(35,'EUR','GBP',3),(36,'dm**3','inch**3',14),(37,'quart','dm**3',14),(38,'degF','kelvin',13),(39,'acre','km**2',12),(40,'cm**2','inch**2',12),(41,NULL,NULL,11),(42,'CZK','CHF',3),(43,'km','mile',6),(44,'CZK','HUF',3),(45,NULL,NULL,7),(46,NULL,NULL,8),(47,NULL,NULL,10),(48,NULL,NULL,5),(50,NULL,NULL,9);
/*!40000 ALTER TABLE `learning_concept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learning_conceptquestion`
--

DROP TABLE IF EXISTS `learning_conceptquestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `learning_conceptquestion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number_id` int(11) DEFAULT NULL,
  `concept_id` int(11) NOT NULL,
  `params` varchar(40) DEFAULT NULL,
  `type_id` int(11) NOT NULL,
  `label` double DEFAULT NULL,
  `updatedTimes` int(11) NOT NULL,
  `hint` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `learning_conceptquestion_d4e7917a` (`number_id`),
  KEY `learning_conceptquestion_8a386586` (`concept_id`),
  KEY `learning_conceptquestion_403d8ff3` (`type_id`),
  CONSTRAINT `concept_id_refs_id_25b38f79` FOREIGN KEY (`concept_id`) REFERENCES `learning_concept` (`id`),
  CONSTRAINT `number_id_refs_id_b796c525` FOREIGN KEY (`number_id`) REFERENCES `learning_number` (`id`),
  CONSTRAINT `type_id_refs_id_cad3d689` FOREIGN KEY (`type_id`) REFERENCES `learning_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1273 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning_conceptquestion`
--

LOCK TABLES `learning_conceptquestion` WRITE;
/*!40000 ALTER TABLE `learning_conceptquestion` DISABLE KEYS */;
INSERT INTO `learning_conceptquestion` VALUES (1,423,34,'0',3,0.5,0,0),(2,437,34,'0',3,0.5,0,0),(3,447,34,'0',3,0.5,0,0),(4,455,34,'0',3,0.5,0,0),(5,458,34,'0',3,0.5,0,0),(6,459,34,'0',3,0.5,0,0),(7,464,34,'0',3,0.5,0,0),(8,465,34,'0',3,0.5,0,0),(9,466,34,'0',3,0.5,0,0),(10,470,34,'0',3,0.5,0,0),(11,471,34,'0',3,0.5,0,0),(12,473,34,'0',3,0.5,0,0),(13,476,34,'0',3,0.5,0,0),(14,478,34,'0',3,0.5,0,0),(15,480,34,'0',3,0.5,0,0),(16,483,34,'0',3,0.5,0,0),(17,484,34,'0',3,0.5,0,0),(18,486,34,'0',3,0.5,0,0),(19,488,34,'0',3,0.5,0,0),(20,490,34,'0',3,0.5,0,0),(21,493,34,'0',3,0.5,0,0),(22,494,34,'0',3,0.5,0,0),(23,496,34,'0',3,0.5,0,0),(24,497,34,'0',3,0.5,0,0),(25,498,34,'0',3,0.5,0,0),(26,500,34,'0',3,0.5,0,0),(27,501,34,'0',3,0.5,0,0),(28,502,34,'0',3,0.5,0,0),(29,504,34,'0',3,0.5,0,0),(30,505,34,'0',3,0.5,0,0),(31,506,34,'0',3,0.5,0,0),(32,507,34,'0',3,0.5,0,0),(33,509,34,'0',3,0.5,0,0),(34,510,34,'0',3,0.5,0,0),(35,511,34,'0',3,0.5,0,0),(36,423,28,'0',3,0.5,0,0),(37,437,28,'0',3,0.5,0,0),(38,447,28,'0',3,0.5,0,0),(39,455,28,'0',3,0.5,0,0),(40,458,28,'0',3,0.5,0,0),(41,459,28,'0',3,0.5,0,0),(42,464,28,'0',3,0.5,0,0),(43,465,28,'0',3,0.5,0,0),(44,466,28,'0',3,0.5,0,0),(45,470,28,'0',3,0.5,0,0),(46,471,28,'0',3,0.5,0,0),(47,473,28,'0',3,0.5,0,0),(48,476,28,'0',3,0.5,0,0),(49,478,28,'0',3,0.5,0,0),(50,480,28,'0',3,0.5,0,0),(51,483,28,'0',3,0.5,0,0),(52,484,28,'0',3,0.5,0,0),(53,486,28,'0',3,0.5,0,0),(54,488,28,'0',3,0.5,0,0),(55,490,28,'0',3,0.5,0,0),(56,493,28,'0',3,0.5,0,0),(57,494,28,'0',3,0.5,0,0),(58,496,28,'0',3,0.5,0,0),(59,497,28,'0',3,0.5,0,0),(60,498,28,'0',3,0.5,0,0),(61,500,28,'0',3,0.5,0,0),(62,501,28,'0',3,0.5,0,0),(63,502,28,'0',3,0.5,0,0),(64,504,28,'0',3,0.5,0,0),(65,505,28,'0',3,0.5,0,0),(66,506,28,'0',3,0.5,0,0),(67,507,28,'0',3,0.5,0,0),(68,509,28,'0',3,0.5,0,0),(69,510,28,'0',3,0.5,0,0),(70,511,28,'0',3,0.5,0,0),(71,423,44,'0',3,0.5,0,0),(72,437,44,'0',3,0.5,0,0),(73,447,44,'0',3,0.5,0,0),(74,455,44,'0',3,0.5,0,0),(75,458,44,'0',3,0.5,0,0),(76,459,44,'0',3,0.5,0,0),(77,464,44,'0',3,0.5,0,0),(78,465,44,'0',3,0.5,0,0),(79,466,44,'0',3,0.5,0,0),(80,470,44,'0',3,0.5,0,0),(81,471,44,'0',3,0.5,0,0),(82,473,44,'0',3,0.5,0,0),(83,476,44,'0',3,0.5,0,0),(84,478,44,'0',3,0.5,0,0),(85,480,44,'0',3,0.5,0,0),(86,483,44,'0',3,0.5,0,0),(87,484,44,'0',3,0.5,0,0),(88,486,44,'0',3,0.5,0,0),(89,488,44,'0',3,0.5,0,0),(90,490,44,'0',3,0.5,0,0),(91,493,44,'0',3,0.5,0,0),(92,494,44,'0',3,0.5,0,0),(93,496,44,'0',3,0.5,0,0),(94,497,44,'0',3,0.5,0,0),(95,498,44,'0',3,0.5,0,0),(96,500,44,'0',3,0.5,0,0),(97,501,44,'0',3,0.5,0,0),(98,502,44,'0',3,0.5,0,0),(99,504,44,'0',3,0.5,0,0),(100,505,44,'0',3,0.5,0,0),(101,506,44,'0',3,0.5,0,0),(102,507,44,'0',3,0.5,0,0),(103,509,44,'0',3,0.5,0,0),(104,510,44,'0',3,0.5,0,0),(105,511,44,'0',3,0.5,0,0),(106,423,42,'0',3,0.5,0,0),(107,437,42,'0',3,0.5,0,0),(108,447,42,'0',3,0.5,0,0),(109,455,42,'0',3,0.5,0,0),(110,458,42,'0',3,0.5,0,0),(111,459,42,'0',3,0.5,0,0),(112,464,42,'0',3,0.5,0,0),(113,465,42,'0',3,0.5,0,0),(114,466,42,'0',3,0.5,0,0),(115,470,42,'0',3,0.5,0,0),(116,471,42,'0',3,0.5,0,0),(117,473,42,'0',3,0.5,0,0),(118,476,42,'0',3,0.5,0,0),(119,478,42,'0',3,0.5,0,0),(120,480,42,'0',3,0.5,0,0),(121,483,42,'0',3,0.5,0,0),(122,484,42,'0',3,0.5,0,0),(123,486,42,'0',3,0.5,0,0),(124,488,42,'0',3,0.5,0,0),(125,490,42,'0',3,0.5,0,0),(126,493,42,'0',3,0.5,0,0),(127,494,42,'0',3,0.5,0,0),(128,496,42,'0',3,0.5,0,0),(129,497,42,'0',3,0.5,0,0),(130,498,42,'0',3,0.5,0,0),(131,500,42,'0',3,0.5,0,0),(132,501,42,'0',3,0.5,0,0),(133,502,42,'0',3,0.5,0,0),(134,504,42,'0',3,0.5,0,0),(135,505,42,'0',3,0.5,0,0),(136,506,42,'0',3,0.5,0,0),(137,507,42,'0',3,0.5,0,0),(138,509,42,'0',3,0.5,0,0),(139,510,42,'0',3,0.5,0,0),(140,511,42,'0',3,0.5,0,0),(141,423,30,'0',3,0.5,0,0),(142,437,30,'0',3,0.5,0,0),(143,447,30,'0',3,0.5,0,0),(144,455,30,'0',3,0.5,0,0),(145,458,30,'0',3,0.5,0,0),(146,459,30,'0',3,0.5,0,0),(147,464,30,'0',3,0.5,0,0),(148,465,30,'0',3,0.5,0,0),(149,466,30,'0',3,0.5,0,0),(150,470,30,'0',3,0.5,0,0),(151,471,30,'0',3,0.5,0,0),(152,473,30,'0',3,0.5,0,0),(153,476,30,'0',3,0.5,0,0),(154,478,30,'0',3,0.5,0,0),(155,480,30,'0',3,0.5,0,0),(156,483,30,'0',3,0.5,0,0),(157,484,30,'0',3,0.5,0,0),(158,486,30,'0',3,0.5,0,0),(159,488,30,'0',3,0.5,0,0),(160,490,30,'0',3,0.5,0,0),(161,493,30,'0',3,0.5,0,0),(162,494,30,'0',3,0.5,0,0),(163,496,30,'0',3,0.5,0,0),(164,497,30,'0',3,0.5,0,0),(165,498,30,'0',3,0.5,0,0),(166,500,30,'0',3,0.5,0,0),(167,501,30,'0',3,0.5,0,0),(168,502,30,'0',3,0.5,0,0),(169,504,30,'0',3,0.5,0,0),(170,505,30,'0',3,0.5,0,0),(171,506,30,'0',3,0.5,0,0),(172,507,30,'0',3,0.5,0,0),(173,509,30,'0',3,0.5,0,0),(174,510,30,'0',3,0.5,0,0),(175,511,30,'0',3,0.5,0,0),(176,423,25,'0',3,0.5,0,0),(177,437,25,'0',3,0.5,0,0),(178,447,25,'0',3,0.5,0,0),(179,455,25,'0',3,0.5,0,0),(180,458,25,'0',3,0.5,0,0),(181,459,25,'0',3,0.5,0,0),(182,464,25,'0',3,0.5,0,0),(183,465,25,'0',3,0.5,0,0),(184,466,25,'0',3,0.5,0,0),(185,470,25,'0',3,0.5,0,0),(186,471,25,'0',3,0.5,0,0),(187,473,25,'0',3,0.5,0,0),(188,476,25,'0',3,0.5,0,0),(189,478,25,'0',3,0.5,0,0),(190,480,25,'0',3,0.5,0,0),(191,483,25,'0',3,0.5,0,0),(192,484,25,'0',3,0.5,0,0),(193,486,25,'0',3,0.5,0,0),(194,488,25,'0',3,0.5,0,0),(195,490,25,'0',3,0.5,0,0),(196,493,25,'0',3,0.5,0,0),(197,494,25,'0',3,0.5,0,0),(198,496,25,'0',3,0.5,0,0),(199,497,25,'0',3,0.5,0,0),(200,498,25,'0',3,0.5,0,0),(201,500,25,'0',3,0.5,0,0),(202,501,25,'0',3,0.5,0,0),(203,502,25,'0',3,0.5,0,0),(204,504,25,'0',3,0.5,0,0),(205,505,25,'0',3,0.5,0,0),(206,506,25,'0',3,0.5,0,0),(207,507,25,'0',3,0.5,0,0),(208,509,25,'0',3,0.5,0,0),(209,510,25,'0',3,0.5,0,0),(210,511,25,'0',3,0.5,0,0),(211,423,7,'0',3,0.5,0,0),(212,437,7,'0',3,0.5,0,0),(213,447,7,'0',3,0.5,0,0),(214,455,7,'0',3,0.5,0,0),(215,458,7,'0',3,0.5,0,0),(216,459,7,'0',3,0.5,0,0),(217,464,7,'0',3,0.5,0,0),(218,465,7,'0',3,0.5,0,0),(219,466,7,'0',3,0.5,0,0),(220,470,7,'0',3,0.5,0,0),(221,471,7,'0',3,0.5,0,0),(222,473,7,'0',3,0.5,0,0),(223,476,7,'0',3,0.5,0,0),(224,478,7,'0',3,0.5,0,0),(225,480,7,'0',3,0.5,0,0),(226,483,7,'0',3,0.5,0,0),(227,484,7,'0',3,0.5,0,0),(228,486,7,'0',3,0.5,0,0),(229,488,7,'0',3,0.5,0,0),(230,490,7,'0',3,0.5,0,0),(231,493,7,'0',3,0.5,0,0),(232,494,7,'0',3,0.5,0,0),(233,496,7,'0',3,0.5,0,0),(234,497,7,'0',3,0.5,0,0),(235,498,7,'0',3,0.5,0,0),(236,500,7,'0',3,0.5,0,0),(237,501,7,'0',3,0.5,0,0),(238,502,7,'0',3,0.5,0,0),(239,504,7,'0',3,0.5,0,0),(240,505,7,'0',3,0.5,0,0),(241,506,7,'0',3,0.5,0,0),(242,507,7,'0',3,0.5,0,0),(243,509,7,'0',3,0.5,0,0),(244,510,7,'0',3,0.5,0,0),(245,511,7,'0',3,0.5,0,0),(246,44,23,'0',3,0.5,0,0),(247,55,23,'0',3,0.5,0,0),(248,67,23,'0',3,0.5,0,0),(249,80,23,'0',3,0.5,0,0),(250,89,23,'0',3,0.5,0,0),(251,97,23,'0',3,0.5,0,0),(252,106,23,'0',3,0.5,0,0),(253,113,23,'0',3,0.5,0,0),(254,116,23,'0',3,0.5,0,0),(255,124,23,'0',3,0.5,0,0),(256,132,23,'0',3,0.5,0,0),(257,137,23,'0',3,0.5,0,0),(258,144,23,'0',3,0.5,0,0),(259,151,23,'0',3,0.5,0,0),(260,159,23,'0',3,0.5,0,0),(261,165,23,'0',3,0.5,0,0),(262,171,23,'0',3,0.5,0,0),(263,179,23,'0',3,0.5,0,0),(264,186,23,'0',3,0.5,0,0),(265,191,23,'0',3,0.5,0,0),(266,199,23,'0',3,0.5,0,0),(267,204,23,'0',3,0.5,0,0),(268,211,23,'0',3,0.5,0,0),(269,214,23,'0',3,0.5,0,0),(270,219,23,'0',3,0.5,0,0),(271,44,6,'0',3,0.5,0,0),(272,55,6,'0',3,0.5,0,0),(273,67,6,'0',3,0.5,0,0),(274,80,6,'0',3,0.5,0,0),(275,89,6,'0',3,0.5,0,0),(276,97,6,'0',3,0.5,0,0),(277,106,6,'0',3,0.5,0,0),(278,113,6,'0',3,0.5,0,0),(279,116,6,'0',3,0.5,0,0),(280,124,6,'0',3,0.5,0,0),(281,132,6,'0',3,0.5,0,0),(282,137,6,'0',3,0.5,0,0),(283,144,6,'0',3,0.5,0,0),(284,151,6,'0',3,0.5,0,0),(285,159,6,'0',3,0.5,0,0),(286,165,6,'0',3,0.5,0,0),(287,171,6,'0',3,0.5,0,0),(288,179,6,'0',3,0.5,0,0),(289,186,6,'0',3,0.5,0,0),(290,191,6,'0',3,0.5,0,0),(291,199,6,'0',3,0.5,0,0),(292,204,6,'0',3,0.5,0,0),(293,211,6,'0',3,0.5,0,0),(294,214,6,'0',3,0.5,0,0),(295,219,6,'0',3,0.5,0,0),(296,44,3,'0',3,0.5,0,0),(297,55,3,'0',3,0.5,0,0),(298,67,3,'0',3,0.5,0,0),(299,80,3,'0',3,0.5,0,0),(300,89,3,'0',3,0.5,0,0),(301,97,3,'0',3,0.5,0,0),(302,106,3,'0',3,0.5,0,0),(303,113,3,'0',3,0.5,0,0),(304,116,3,'0',3,0.5,0,0),(305,124,3,'0',3,0.5,0,0),(306,132,3,'0',3,0.5,0,0),(307,137,3,'0',3,0.5,0,0),(308,144,3,'0',3,0.5,0,0),(309,151,3,'0',3,0.5,0,0),(310,159,3,'0',3,0.5,0,0),(311,165,3,'0',3,0.5,0,0),(312,171,3,'0',3,0.5,0,0),(313,179,3,'0',3,0.5,0,0),(314,186,3,'0',3,0.5,0,0),(315,191,3,'0',3,0.5,0,0),(316,199,3,'0',3,0.5,0,0),(317,204,3,'0',3,0.5,0,0),(318,211,3,'0',3,0.5,0,0),(319,214,3,'0',3,0.5,0,0),(320,219,3,'0',3,0.5,0,0),(321,44,5,'0',3,0.5,0,0),(322,55,5,'0',3,0.5,0,0),(323,67,5,'0',3,0.5,0,0),(324,80,5,'0',3,0.5,0,0),(325,89,5,'0',3,0.5,0,0),(326,97,5,'0',3,0.5,0,0),(327,106,5,'0',3,0.5,0,0),(328,113,5,'0',3,0.5,0,0),(329,116,5,'0',3,0.5,0,0),(330,124,5,'0',3,0.5,0,0),(331,132,5,'0',3,0.5,0,0),(332,137,5,'0',3,0.5,0,0),(333,144,5,'0',3,0.5,0,0),(334,151,5,'0',3,0.5,0,0),(335,159,5,'0',3,0.5,0,0),(336,165,5,'0',3,0.5,0,0),(337,171,5,'0',3,0.5,0,0),(338,179,5,'0',3,0.5,0,0),(339,186,5,'0',3,0.5,0,0),(340,191,5,'0',3,0.5,0,0),(341,199,5,'0',3,0.5,0,0),(342,204,5,'0',3,0.5,0,0),(343,211,5,'0',3,0.5,0,0),(344,214,5,'0',3,0.5,0,0),(345,219,5,'0',3,0.5,0,0),(346,44,35,'0',3,0.5,0,0),(347,55,35,'0',3,0.5,0,0),(348,67,35,'0',3,0.5,0,0),(349,80,35,'0',3,0.5,0,0),(350,89,35,'0',3,0.5,0,0),(351,97,35,'0',3,0.5,0,0),(352,106,35,'0',3,0.5,0,0),(353,113,35,'0',3,0.5,0,0),(354,116,35,'0',3,0.5,0,0),(355,124,35,'0',3,0.5,0,0),(356,132,35,'0',3,0.5,0,0),(357,137,35,'0',3,0.5,0,0),(358,144,35,'0',3,0.5,0,0),(359,151,35,'0',3,0.5,0,0),(360,159,35,'0',3,0.5,0,0),(361,165,35,'0',3,0.5,0,0),(362,171,35,'0',3,0.5,0,0),(363,179,35,'0',3,0.5,0,0),(364,186,35,'0',3,0.5,0,0),(365,191,35,'0',3,0.5,0,0),(366,199,35,'0',3,0.5,0,0),(367,204,35,'0',3,0.5,0,0),(368,211,35,'0',3,0.5,0,0),(369,214,35,'0',3,0.5,0,0),(370,219,35,'0',3,0.5,0,0),(371,44,22,'0',3,0.5,0,0),(372,55,22,'0',3,0.5,0,0),(373,67,22,'0',3,0.5,0,0),(374,80,22,'0',3,0.5,0,0),(375,89,22,'0',3,0.5,0,0),(376,97,22,'0',3,0.5,0,0),(377,106,22,'0',3,0.5,0,0),(378,113,22,'0',3,0.5,0,0),(379,116,22,'0',3,0.5,0,0),(380,124,22,'0',3,0.5,0,0),(381,132,22,'0',3,0.5,0,0),(382,137,22,'0',3,0.5,0,0),(383,144,22,'0',3,0.5,0,0),(384,151,22,'0',3,0.5,0,0),(385,159,22,'0',3,0.5,0,0),(386,165,22,'0',3,0.5,0,0),(387,171,22,'0',3,0.5,0,0),(388,179,22,'0',3,0.5,0,0),(389,186,22,'0',3,0.5,0,0),(390,191,22,'0',3,0.5,0,0),(391,199,22,'0',3,0.5,0,0),(392,204,22,'0',3,0.5,0,0),(393,211,22,'0',3,0.5,0,0),(394,214,22,'0',3,0.5,0,0),(395,219,22,'0',3,0.5,0,0),(396,44,7,'1',3,0.5,0,0),(397,55,7,'1',3,0.5,0,0),(398,67,7,'1',3,0.5,0,0),(399,80,7,'1',3,0.5,0,0),(400,89,7,'1',3,0.5,0,0),(401,97,7,'1',3,0.5,0,0),(402,106,7,'1',3,0.5,0,0),(403,113,7,'1',3,0.5,0,0),(404,116,7,'1',3,0.5,0,0),(405,124,7,'1',3,0.5,0,0),(406,132,7,'1',3,0.5,0,0),(407,137,7,'1',3,0.5,0,0),(408,144,7,'1',3,0.5,0,0),(409,151,7,'1',3,0.5,0,0),(410,159,7,'1',3,0.5,0,0),(411,165,7,'1',3,0.5,0,0),(412,171,7,'1',3,0.5,0,0),(413,179,7,'1',3,0.5,0,0),(414,186,7,'1',3,0.5,0,0),(415,191,7,'1',3,0.5,0,0),(416,199,7,'1',3,0.5,0,0),(417,204,7,'1',3,0.5,0,0),(418,211,7,'1',3,0.5,0,0),(419,214,7,'1',3,0.5,0,0),(420,219,7,'1',3,0.5,0,0),(421,1,26,'1',13,0.5,0,0),(422,2,26,'1',13,0.5,0,0),(423,4,26,'1',13,0.5,0,0),(424,44,26,'1',13,0.5,0,0),(425,97,26,'1',13,0.5,0,0),(426,132,26,'1',13,0.5,0,0),(427,165,26,'1',13,0.5,0,0),(428,7,26,'1',13,0.5,0,0),(429,17,26,'1',13,0.5,0,0),(430,31,26,'1',13,0.5,0,0),(431,57,26,'1',13,0.5,0,0),(432,74,26,'1',13,0.5,0,0),(433,86,26,'1',13,0.5,0,0),(434,108,26,'1',13,0.5,0,0),(435,114,26,'1',13,0.5,0,0),(436,122,26,'1',13,0.5,0,0),(437,138,26,'1',13,0.5,0,0),(438,148,26,'1',13,0.5,0,0),(439,158,26,'1',13,0.5,0,0),(440,1,19,'0',13,0.5,0,0),(441,2,19,'0',13,0.5,0,0),(442,4,19,'0',13,0.5,0,0),(443,7,19,'0',13,0.5,0,0),(444,17,19,'0',13,0.5,0,0),(445,31,19,'0',13,0.5,0,0),(446,44,19,'0',13,0.5,0,0),(447,57,19,'0',13,0.5,0,0),(448,74,19,'0',13,0.5,0,0),(449,86,19,'0',13,0.5,0,0),(450,97,19,'0',13,0.5,0,0),(451,108,19,'0',13,0.5,0,0),(452,114,19,'0',13,0.5,0,0),(453,122,19,'0',13,0.5,0,0),(454,132,19,'0',13,0.5,0,0),(455,138,19,'0',13,0.5,0,0),(456,148,19,'0',13,0.5,0,0),(457,158,19,'0',13,0.5,0,0),(458,165,19,'0',13,0.5,0,0),(459,109,26,'0',13,0.5,0,0),(460,124,26,'0',13,0.5,0,0),(461,140,26,'0',13,0.5,0,0),(462,159,26,'0',13,0.5,0,0),(463,176,26,'0',13,0.5,0,0),(464,191,26,'0',13,0.5,0,0),(465,206,26,'0',13,0.5,0,0),(466,219,26,'0',13,0.5,0,0),(467,235,26,'0',13,0.5,0,0),(468,243,26,'0',13,0.5,0,0),(469,255,26,'0',13,0.5,0,0),(470,265,26,'0',13,0.5,0,0),(471,277,26,'0',13,0.5,0,0),(472,287,26,'0',13,0.5,0,0),(473,298,26,'0',13,0.5,0,0),(474,309,26,'0',13,0.5,0,0),(475,315,26,'0',13,0.5,0,0),(476,405,19,'1',13,0.5,0,0),(477,407,19,'1',13,0.5,0,0),(478,409,19,'1',13,0.5,0,0),(479,411,19,'1',13,0.5,0,0),(480,413,19,'1',13,0.5,0,0),(481,414,19,'1',13,0.5,0,0),(482,416,19,'1',13,0.5,0,0),(483,418,19,'1',13,0.5,0,0),(484,419,19,'1',13,0.5,0,0),(485,421,19,'1',13,0.5,0,0),(486,422,19,'1',13,0.5,0,0),(487,424,19,'1',13,0.5,0,0),(488,426,19,'1',13,0.5,0,0),(489,427,19,'1',13,0.5,0,0),(490,430,19,'1',13,0.5,0,0),(491,431,19,'1',13,0.5,0,0),(492,405,38,'1',13,0.5,0,0),(493,407,38,'1',13,0.5,0,0),(494,409,38,'1',13,0.5,0,0),(495,411,38,'1',13,0.5,0,0),(496,413,38,'1',13,0.5,0,0),(497,414,38,'1',13,0.5,0,0),(498,416,38,'1',13,0.5,0,0),(499,418,38,'1',13,0.5,0,0),(500,419,38,'1',13,0.5,0,0),(501,421,38,'1',13,0.5,0,0),(502,422,38,'1',13,0.5,0,0),(503,424,38,'1',13,0.5,0,0),(504,426,38,'1',13,0.5,0,0),(505,427,38,'1',13,0.5,0,0),(506,430,38,'1',13,0.5,0,0),(507,431,38,'1',13,0.5,0,0),(508,109,38,'0',13,0.5,0,0),(509,124,38,'0',13,0.5,0,0),(510,140,38,'0',13,0.5,0,0),(511,159,38,'0',13,0.5,0,0),(512,176,38,'0',13,0.5,0,0),(513,191,38,'0',13,0.5,0,0),(514,206,38,'0',13,0.5,0,0),(515,219,38,'0',13,0.5,0,0),(516,235,38,'0',13,0.5,0,0),(517,243,38,'0',13,0.5,0,0),(518,255,38,'0',13,0.5,0,0),(519,265,38,'0',13,0.5,0,0),(520,277,38,'0',13,0.5,0,0),(521,287,38,'0',13,0.5,0,0),(522,298,38,'0',13,0.5,0,0),(523,309,38,'0',13,0.5,0,0),(524,315,38,'0',13,0.5,0,0),(525,324,38,'0',13,0.5,0,0),(526,328,38,'0',13,0.5,0,0),(527,333,38,'0',13,0.5,0,0),(528,339,38,'0',13,0.5,0,0),(529,342,38,'0',13,0.5,0,0),(530,347,38,'0',13,0.5,0,0),(531,351,38,'0',13,0.5,0,0),(532,354,38,'0',13,0.5,0,0),(533,360,38,'0',13,0.5,0,0),(534,363,38,'0',13,0.5,0,0),(535,366,38,'0',13,0.5,0,0),(536,369,38,'0',13,0.5,0,0),(537,371,38,'0',13,0.5,0,0),(538,374,38,'0',13,0.5,0,0),(539,377,38,'0',13,0.5,0,0),(540,380,38,'0',13,0.5,0,0),(541,383,38,'0',13,0.5,0,0),(542,384,38,'0',13,0.5,0,0),(543,386,38,'0',13,0.5,0,0),(544,388,38,'0',13,0.5,0,0),(545,391,38,'0',13,0.5,0,0),(546,393,38,'0',13,0.5,0,0),(547,394,38,'0',13,0.5,0,0),(548,395,38,'0',13,0.5,0,0),(549,396,38,'0',13,0.5,0,0),(550,397,38,'0',13,0.5,0,0),(551,398,38,'0',13,0.5,0,0),(552,400,38,'0',13,0.5,0,0),(553,401,38,'0',13,0.5,0,0),(554,402,38,'0',13,0.5,0,0),(555,403,38,'0',13,0.5,0,0),(556,404,38,'0',13,0.5,0,0),(557,405,38,'0',13,0.5,0,0),(558,408,38,'0',13,0.5,0,0),(559,412,38,'0',13,0.5,0,0),(560,414,38,'0',13,0.5,0,0),(561,417,38,'0',13,0.5,0,0),(562,420,38,'0',13,0.5,0,0),(563,422,38,'0',13,0.5,0,0),(564,425,38,'0',13,0.5,0,0),(565,428,38,'0',13,0.5,0,0),(566,431,38,'0',13,0.5,0,0),(567,433,38,'0',13,0.5,0,0),(568,434,38,'0',13,0.5,0,0),(569,435,38,'0',13,0.5,0,0),(570,436,38,'0',13,0.5,0,0),(571,437,38,'0',13,0.5,0,0),(572,438,38,'0',13,0.5,0,0),(573,439,38,'0',13,0.5,0,0),(574,440,38,'0',13,0.5,0,0),(575,442,38,'0',13,0.5,0,0),(576,443,38,'0',13,0.5,0,0),(577,445,38,'0',13,0.5,0,0),(578,446,38,'0',13,0.5,0,0),(579,448,38,'0',13,0.5,0,0),(580,449,38,'0',13,0.5,0,0),(581,450,38,'0',13,0.5,0,0),(582,451,38,'0',13,0.5,0,0),(583,452,38,'0',13,0.5,0,0),(584,159,2,'1',6,0.5,0,0),(585,179,2,'1',6,0.5,0,0),(586,199,2,'1',6,0.5,0,0),(587,214,2,'1',6,0.5,0,0),(588,231,2,'1',6,0.5,0,0),(589,243,2,'1',6,0.5,0,0),(590,256,2,'1',6,0.5,0,0),(591,270,2,'1',6,0.5,0,0),(592,283,2,'1',6,0.5,0,0),(593,296,2,'1',6,0.5,0,0),(594,309,2,'1',6,0.5,0,0),(595,316,2,'1',6,0.5,0,0),(596,326,2,'1',6,0.5,0,0),(597,332,2,'1',6,0.5,0,0),(598,337,2,'1',6,0.5,0,0),(599,342,2,'1',6,0.5,0,0),(600,348,2,'1',6,0.5,0,0),(601,352,2,'1',6,0.5,0,0),(602,358,2,'1',6,0.5,0,0),(603,362,2,'1',6,0.5,0,0),(604,74,2,'0',6,0.5,0,0),(605,93,2,'0',6,0.5,0,0),(606,109,2,'0',6,0.5,0,0),(607,119,2,'0',6,0.5,0,0),(608,134,2,'0',6,0.5,0,0),(609,148,2,'0',6,0.5,0,0),(610,160,2,'0',6,0.5,0,0),(611,176,2,'0',6,0.5,0,0),(612,190,2,'0',6,0.5,0,0),(613,202,2,'0',6,0.5,0,0),(614,213,2,'0',6,0.5,0,0),(615,223,2,'0',6,0.5,0,0),(616,17,11,'1',6,0.5,0,0),(617,27,11,'1',6,0.5,0,0),(618,38,11,'1',6,0.5,0,0),(619,49,11,'1',6,0.5,0,0),(620,61,11,'1',6,0.5,0,0),(621,74,11,'1',6,0.5,0,0),(622,84,11,'1',6,0.5,0,0),(623,93,11,'1',6,0.5,0,0),(624,93,11,'0',6,0.5,0,0),(625,109,11,'0',6,0.5,0,0),(626,119,11,'0',6,0.5,0,0),(627,134,11,'0',6,0.5,0,0),(628,148,11,'0',6,0.5,0,0),(629,160,11,'0',6,0.5,0,0),(630,176,11,'0',6,0.5,0,0),(631,190,11,'0',6,0.5,0,0),(632,202,11,'0',6,0.5,0,0),(633,213,11,'0',6,0.5,0,0),(634,223,11,'0',6,0.5,0,0),(635,235,11,'0',6,0.5,0,0),(636,199,21,'1',6,0.5,0,0),(637,219,21,'1',6,0.5,0,0),(638,240,21,'1',6,0.5,0,0),(639,256,21,'1',6,0.5,0,0),(640,274,21,'1',6,0.5,0,0),(641,292,21,'1',6,0.5,0,0),(642,309,21,'1',6,0.5,0,0),(643,80,21,'0',6,0.5,0,0),(644,89,21,'0',6,0.5,0,0),(645,97,21,'0',6,0.5,0,0),(646,106,21,'0',6,0.5,0,0),(647,113,21,'0',6,0.5,0,0),(648,116,21,'0',6,0.5,0,0),(649,124,21,'0',6,0.5,0,0),(650,132,21,'0',6,0.5,0,0),(651,137,21,'0',6,0.5,0,0),(652,17,16,'0',6,0.5,0,0),(653,55,16,'0',6,0.5,0,0),(654,93,16,'0',6,0.5,0,0),(655,116,16,'0',6,0.5,0,0),(656,140,16,'0',6,0.5,0,0),(657,165,16,'0',6,0.5,0,0),(658,27,16,'1',6,0.5,0,0),(659,74,16,'1',6,0.5,0,0),(660,109,16,'1',6,0.5,0,0),(661,134,16,'1',6,0.5,0,0),(662,160,16,'1',6,0.5,0,0),(663,190,16,'1',6,0.5,0,0),(664,17,1,'0',6,0.5,0,0),(665,89,1,'0',6,0.5,0,0),(666,134,1,'0',6,0.5,0,0),(667,179,1,'0',6,0.5,0,0),(668,215,1,'0',6,0.5,0,0),(669,249,1,'0',6,0.5,0,0),(670,277,1,'0',6,0.5,0,0),(671,27,1,'1',6,0.5,0,0),(672,106,1,'1',6,0.5,0,0),(673,156,1,'1',6,0.5,0,0),(674,204,1,'1',6,0.5,0,0),(675,241,1,'1',6,0.5,0,0),(676,274,1,'1',6,0.5,0,0),(677,17,43,'0',6,0.5,0,0),(678,84,43,'0',6,0.5,0,0),(679,129,43,'0',6,0.5,0,0),(680,168,43,'0',6,0.5,0,0),(681,206,43,'0',6,0.5,0,0),(682,237,43,'0',6,0.5,0,0),(683,261,43,'0',6,0.5,0,0),(684,288,43,'0',6,0.5,0,0),(685,311,43,'0',6,0.5,0,0),(686,328,43,'0',6,0.5,0,0),(687,27,9,'0',6,0.5,0,0),(688,101,9,'0',6,0.5,0,0),(689,148,9,'0',6,0.5,0,0),(690,197,9,'0',6,0.5,0,0),(691,235,9,'0',6,0.5,0,0),(692,261,9,'0',6,0.5,0,0),(693,294,9,'0',6,0.5,0,0),(694,319,9,'0',6,0.5,0,0),(695,334,9,'0',6,0.5,0,0),(696,97,40,'0',12,0.5,0,0),(697,148,40,'0',12,0.5,0,0),(698,199,40,'0',12,0.5,0,0),(699,237,40,'0',12,0.5,0,0),(700,270,40,'0',12,0.5,0,0),(701,67,40,'1',12,0.5,0,0),(702,119,40,'1',12,0.5,0,0),(703,165,40,'1',12,0.5,0,0),(704,206,40,'1',12,0.5,0,0),(705,240,40,'1',12,0.5,0,0),(706,8,14,'0',12,0.5,0,0),(707,12,14,'0',12,0.5,0,0),(708,18,14,'0',12,0.5,0,0),(709,25,14,'0',12,0.5,0,0),(710,32,14,'0',12,0.5,0,0),(711,39,14,'0',12,0.5,0,0),(712,47,14,'0',12,0.5,0,0),(713,52,14,'0',12,0.5,0,0),(714,59,14,'0',12,0.5,0,0),(715,68,14,'0',12,0.5,0,0),(716,77,14,'0',12,0.5,0,0),(717,74,14,'1',12,0.5,0,0),(718,140,14,'1',12,0.5,0,0),(719,202,14,'1',12,0.5,0,0),(720,246,14,'1',12,0.5,0,0),(721,286,14,'1',12,0.5,0,0),(722,17,29,'0',12,0.5,0,0),(723,110,29,'0',12,0.5,0,0),(724,170,29,'0',12,0.5,0,0),(725,227,29,'0',12,0.5,0,0),(726,267,29,'0',12,0.5,0,0),(727,97,29,'1',12,0.5,0,0),(728,157,29,'1',12,0.5,0,0),(729,212,29,'1',12,0.5,0,0),(730,254,29,'1',12,0.5,0,0),(731,290,29,'1',12,0.5,0,0),(732,17,27,'1',12,0.5,0,0),(733,96,27,'1',12,0.5,0,0),(734,143,27,'1',12,0.5,0,0),(735,193,27,'1',12,0.5,0,0),(736,234,27,'1',12,0.5,0,0),(737,262,27,'1',12,0.5,0,0),(738,11,27,'0',12,0.5,0,0),(739,99,27,'0',12,0.5,0,0),(740,154,27,'0',12,0.5,0,0),(741,207,27,'0',12,0.5,0,0),(742,248,27,'0',12,0.5,0,0),(743,282,27,'0',12,0.5,0,0),(744,44,15,'0',12,0.5,0,0),(745,120,15,'0',12,0.728155339805825,1,0),(746,183,15,'0',12,0.5,0,0),(747,232,15,'0',12,0.5,0,0),(748,269,15,'0',12,0.5,0,0),(749,307,15,'0',12,0.5,0,0),(750,6,15,'1',12,0.5,0,0),(751,87,15,'1',12,0.5,0,0),(752,141,15,'1',12,0.5,0,0),(753,198,15,'1',12,0.5,0,0),(754,238,15,'1',12,0.5,0,0),(755,272,15,'1',12,0.5,0,0),(756,6,24,'0',12,0.5,0,0),(757,13,24,'0',12,0.5,0,0),(758,26,24,'0',12,0.5,0,0),(759,41,24,'0',12,0.5,0,0),(760,53,24,'0',12,0.5,0,0),(761,70,24,'0',12,0.5,0,0),(762,83,24,'0',12,0.5,0,0),(763,95,24,'0',12,0.5,0,0),(764,460,39,'0',12,0.5,0,0),(765,469,39,'0',12,0.5,0,0),(766,475,39,'0',12,0.5,0,0),(767,482,39,'0',12,0.5,0,0),(768,489,39,'0',12,0.5,0,0),(769,495,39,'0',12,0.5,0,0),(770,499,39,'0',12,0.5,0,0),(771,503,39,'0',12,0.5,0,0),(772,508,39,'0',12,0.5,0,0),(773,310,24,'1',12,0.5,0,0),(774,389,24,'1',12,0.5,0,0),(775,429,24,'1',12,0.5,0,0),(776,454,24,'1',12,0.5,0,0),(777,461,24,'1',12,0.5,0,0),(778,468,24,'1',12,0.5,0,0),(779,474,24,'1',12,0.5,0,0),(780,479,24,'1',12,0.5,0,0),(781,485,24,'1',12,0.5,0,0),(782,11,20,'0',12,0.5,0,0),(783,91,20,'0',12,0.5,0,0),(784,139,20,'0',12,0.5,0,0),(785,189,20,'0',12,0.5,0,0),(786,230,20,'0',12,0.5,0,0),(787,258,20,'0',12,0.5,0,0),(788,291,20,'0',12,0.5,0,0),(789,199,20,'1',12,0.5,0,0),(790,275,20,'1',12,0.5,0,0),(791,331,20,'1',12,0.5,0,0),(792,359,20,'1',12,0.5,0,0),(793,378,20,'1',12,0.5,0,0),(794,392,20,'1',12,0.5,0,0),(795,399,20,'1',12,0.5,0,0),(796,310,20,'1',12,0.5,0,0),(797,382,20,'1',12,0.5,0,0),(798,406,20,'1',12,0.5,0,0),(799,441,20,'1',12,0.5,0,0),(800,456,20,'1',12,0.5,0,0),(801,463,20,'1',12,0.5,0,0),(802,467,20,'1',12,0.5,0,0),(803,472,20,'1',12,0.5,0,0),(804,477,20,'1',12,0.5,0,0),(805,481,20,'1',12,0.5,0,0),(806,487,20,'1',12,0.5,0,0),(807,6,36,'0',14,0.5,0,0),(808,9,36,'0',14,0.5,0,0),(809,14,36,'0',14,0.5,0,0),(810,21,36,'0',14,0.728155339805825,1,0),(811,28,36,'0',14,0.5,0,0),(812,35,36,'0',14,0.5,0,0),(813,43,36,'0',14,0.5,0,0),(814,48,36,'0',14,0.5,0,0),(815,56,36,'0',14,0.5,0,0),(816,62,36,'0',14,0.5,0,0),(817,73,36,'0',14,0.5,0,0),(818,79,36,'0',14,0.5,0,0),(819,17,37,'1',14,0.5,0,0),(820,66,37,'1',14,0.5,0,0),(821,107,37,'1',14,0.5,0,0),(822,135,37,'1',14,0.5,0,0),(823,164,37,'1',14,0.5,0,0),(824,194,37,'1',14,0.5,0,0),(825,11,13,'0',14,0.5,0,0),(826,60,13,'0',14,0.5,0,0),(827,105,13,'0',14,0.5,0,0),(828,133,13,'0',14,0.5,0,0),(829,163,13,'0',14,0.5,0,0),(830,196,13,'0',14,0.5,0,0),(831,8,32,'0',14,0.5,0,0),(832,10,32,'0',14,0.5,0,0),(833,15,32,'0',14,0.5,0,0),(834,20,32,'0',14,0.5,0,0),(835,24,32,'0',14,0.5,0,0),(836,30,32,'0',14,0.5,0,0),(837,36,32,'0',14,0.5,0,0),(838,40,32,'0',14,0.5,0,0),(839,45,32,'0',14,0.5,0,0),(840,22,4,'1',14,0.5,0,0),(841,65,4,'1',14,0.5,0,0),(842,102,4,'1',14,0.5,0,0),(843,128,4,'1',14,0.5,0,0),(844,153,4,'1',14,0.5,0,0),(845,80,4,'0',14,0.5,0,0),(846,127,4,'0',14,0.5,0,0),(847,167,4,'0',14,0.5,0,0),(848,208,4,'0',14,0.5,0,0),(849,239,4,'0',14,0.5,0,0),(850,266,4,'0',14,0.5,0,0),(851,38,13,'1',14,0.5,0,0),(852,76,13,'1',14,0.5,0,0),(853,103,13,'1',14,0.5,0,0),(854,123,13,'1',14,0.5,0,0),(855,142,13,'1',14,0.5,0,0),(856,166,13,'1',14,0.5,0,0),(857,6,37,'0',14,0.5,0,0),(858,45,37,'0',14,0.5,0,0),(859,90,37,'0',14,0.647249190938511,1,0),(860,117,37,'0',14,0.5,0,0),(861,147,37,'0',14,0.5,0,0),(862,174,37,'0',14,0.5,0,0),(863,201,37,'0',14,0.5,0,0),(864,11,33,'1',14,0.5,0,0),(865,16,33,'1',14,0.5,0,0),(866,19,33,'1',14,0.5,0,0),(867,23,33,'1',14,0.5,0,0),(868,29,33,'1',14,0.5,0,0),(869,33,33,'1',14,0.5,0,0),(870,37,33,'1',14,0.5,0,0),(871,42,33,'1',14,0.5,0,0),(872,46,33,'1',14,0.5,0,0),(873,51,33,'1',14,0.5,0,0),(874,54,33,'1',14,0.5,0,0),(875,58,33,'1',14,0.5,0,0),(876,64,33,'1',14,0.5,0,0),(877,69,33,'1',14,0.5,0,0),(878,75,33,'1',14,0.728155339805825,1,0),(879,78,33,'1',14,0.5,0,0),(880,199,33,'0',14,0.5,0,0),(881,343,33,'0',14,0.5,0,0),(882,390,33,'0',14,0.5,0,0),(883,415,33,'0',14,0.5,0,0),(884,444,33,'0',14,0.5,0,0),(885,457,33,'0',14,0.5,0,0),(886,49,17,'1',14,0.5,0,0),(887,100,17,'1',14,0.728155339805825,1,0),(888,131,17,'1',14,0.5,0,0),(889,161,17,'1',14,0.5,0,0),(890,195,17,'1',14,0.5,0,0),(891,220,17,'1',14,0.728155339805825,1,0),(892,242,17,'1',14,0.5,0,0),(893,260,17,'1',14,0.728155339805825,1,0),(894,284,17,'1',14,0.5,0,0),(895,303,17,'1',14,0.5,0,0),(896,38,17,'0',14,0.5,0,0),(897,88,17,'0',14,0.5,0,0),(898,118,17,'0',14,0.5,0,0),(899,150,17,'0',14,0.5,0,0),(900,184,17,'0',14,0.5,0,0),(901,210,17,'0',14,0.5,0,0),(902,233,17,'0',14,0.5,0,0),(903,253,17,'0',14,0.5,0,0),(904,271,17,'0',14,0.5,0,0),(905,8,31,'1',14,0.5,0,0),(906,34,31,'1',14,0.5,0,0),(907,63,31,'1',14,0.5,0,0),(908,92,31,'1',14,0.5,0,0),(909,112,31,'1',14,0.5,0,0),(910,130,31,'1',14,0.5,0,0),(911,146,31,'1',14,0.5,0,0),(912,162,31,'1',14,0.5,0,0),(913,97,31,'0',14,0.5,0,0),(914,125,31,'0',14,0.5,0,0),(915,152,31,'0',14,0.5,0,0),(916,181,31,'0',14,0.5,0,0),(917,205,31,'0',14,0.5,0,0),(918,229,31,'0',14,0.5,0,0),(919,247,31,'0',14,0.5,0,0),(920,263,31,'0',14,0.5,0,0),(921,280,31,'0',14,0.5,0,0),(922,299,31,'0',14,0.5,0,0),(923,49,18,'1',14,0.5,0,0),(924,94,18,'1',14,0.5,0,0),(925,121,18,'1',14,0.5,0,0),(926,149,18,'1',14,0.647249190938511,1,0),(927,178,18,'1',14,0.5,0,0),(928,203,18,'1',14,0.5,0,0),(929,228,18,'1',14,0.5,0,0),(930,244,18,'1',14,0.5,0,0),(931,259,18,'1',14,0.5,0,0),(932,278,18,'1',14,0.5,0,0),(933,297,18,'1',14,0.5,0,0),(934,38,18,'0',14,0.219298245614035,1,0),(935,72,18,'0',14,0.5,0,0),(936,98,18,'0',14,0.5,0,0),(937,115,18,'0',14,0.5,0,0),(938,136,18,'0',14,0.5,0,0),(939,155,18,'0',14,0.5,0,0),(940,172,18,'0',14,0.5,0,0),(941,192,18,'0',14,0.5,0,0),(942,209,18,'0',14,0.5,0,0),(943,38,10,'1',14,0.5,0,0),(944,72,10,'1',14,0.5,0,0),(945,98,10,'1',14,0.5,0,0),(946,115,10,'1',14,0.5,0,0),(947,136,10,'1',14,0.552148980866405,1,0),(948,155,10,'1',14,0.5,0,0),(949,172,10,'1',14,0.5,0,0),(950,192,10,'1',14,0.728155339805825,1,0),(951,209,10,'1',14,0.5,0,0),(952,106,10,'0',14,0.88261253309797,1,0),(953,145,10,'0',14,0.5,0,0),(954,188,10,'0',14,0.5,0,0),(955,221,10,'0',14,0.5,0,0),(956,250,10,'0',14,0.809061488673139,1,0),(957,276,10,'0',14,0.5,0,0),(958,301,10,'0',14,0.5,0,0),(959,323,10,'0',14,0.5,0,0),(960,335,10,'0',14,0.5,0,0),(961,346,10,'0',14,0.5,0,0),(962,355,10,'0',14,0.5,0,0),(963,44,8,'inn',1,0.5,0,0),(964,71,8,'inn',1,0.5,0,0),(965,93,8,'inn',1,0.5,0,0),(966,111,8,'inn',1,0.5,0,0),(967,124,8,'inn',1,0.5,0,0),(968,138,8,'inn',1,0.5,0,0),(969,156,8,'inn',1,0.961261174661155,1,0),(970,169,8,'inn',1,0.5,0,0),(971,186,8,'inn',1,0.5,0,0),(972,200,8,'inn',1,0.5,0,0),(973,213,8,'inn',1,0.5,0,0),(974,225,8,'inn',1,0.5,0,0),(975,236,8,'inn',1,0.5,0,0),(976,245,8,'inn',1,0.5,0,0),(977,255,8,'inn',1,0.5,0,0),(978,264,8,'inn',1,0.5,0,0),(979,274,8,'inn',1,0.776699029126214,1,0),(980,285,8,'inn',1,0.5,0,0),(981,294,8,'inn',1,0.5,0,0),(982,302,8,'inn',1,0.5,0,0),(983,310,8,'inn',1,0.5,0,0),(984,318,8,'inn',1,0.5,0,0),(985,325,8,'inn',1,0.5,0,0),(986,329,8,'inn',1,0.5,0,0),(987,333,8,'inn',1,0.5,0,0),(988,338,8,'inn',1,0.5,0,0),(989,341,8,'inn',1,0.5,0,0),(990,345,8,'inn',1,0.5,0,0),(991,349,8,'inn',1,0.5,0,0),(992,353,8,'inn',1,0.5,0,0),(993,357,8,'inn',1,0.5,0,0),(994,361,8,'inn',1,0.5,0,0),(995,364,8,'inn',1,0.5,0,0),(996,367,8,'inn',1,0.5,0,0),(997,369,8,'inn',1,0.5,0,0),(998,370,8,'inn',1,0.5,0,0),(999,373,8,'inn',1,0.5,0,0),(1000,375,8,'inn',1,0.5,0,0),(1001,44,8,'out',1,0.5,0,0),(1002,71,8,'out',1,0.5,0,0),(1003,93,8,'out',1,0.5,0,0),(1004,111,8,'out',1,0.5,0,0),(1005,124,8,'out',1,0.5,0,0),(1006,138,8,'out',1,0.728155339805825,1,0),(1007,156,8,'out',1,0.5,0,0),(1008,169,8,'out',1,0.5,0,0),(1009,186,8,'out',1,0.5,0,0),(1010,200,8,'out',1,0.5,0,0),(1011,213,8,'out',1,0.5,0,0),(1012,225,8,'out',1,0.5,0,0),(1013,236,8,'out',1,0.5,0,0),(1014,245,8,'out',1,0.5,0,0),(1015,255,8,'out',1,0.5,0,0),(1016,264,8,'out',1,0.5,0,0),(1017,274,8,'out',1,0.5,0,0),(1018,285,8,'out',1,0.5,0,0),(1019,294,8,'out',1,0.5,0,0),(1020,302,8,'out',1,0.5,0,0),(1021,310,8,'out',1,0.5,0,0),(1022,318,8,'out',1,0.5,0,0),(1023,325,8,'out',1,0.5,0,0),(1024,329,8,'out',1,0.5,0,0),(1025,333,8,'out',1,0.5,0,0),(1026,338,8,'out',1,0.5,0,0),(1027,341,8,'out',1,0.5,0,0),(1028,345,8,'out',1,0.5,0,0),(1029,349,8,'out',1,0.5,0,0),(1030,353,8,'out',1,0.5,0,0),(1031,357,8,'out',1,0.5,0,0),(1032,361,8,'out',1,0.5,0,0),(1033,364,8,'out',1,0.5,0,0),(1034,367,8,'out',1,0.5,0,0),(1035,369,8,'out',1,0.5,0,0),(1036,370,8,'out',1,0.5,0,0),(1037,373,8,'out',1,0.5,0,0),(1038,375,8,'out',1,0.5,0,0),(1039,38,41,'',11,0,1,0),(1040,84,41,'',11,0.5,0,0),(1041,114,41,'',11,0,1,0),(1042,140,41,'',11,0.0681633206402222,1,0),(1043,168,41,'',11,0.5,0,0),(1044,215,41,'',11,0.799924045641715,1,0),(1045,237,41,'',11,0.728155339805825,1,0),(1046,255,41,'',11,0.5,0,0),(1047,273,41,'',11,0,1,0),(1048,288,41,'',11,0,1,0),(1049,308,41,'',11,0.5,0,0),(1050,319,41,'',11,0,1,0),(1051,328,41,'',11,0.5,0,0),(1052,336,41,'',11,0.482358090764631,1,0),(1053,344,41,'',11,0,1,0),(1054,350,41,'',11,0,1,0),(1055,357,41,'',11,0,1,0),(1056,363,41,'',11,0.0427619071672949,1,0),(1057,368,41,'',11,0.864823521773752,1,0),(1058,376,41,'',11,0.309024989658613,1,0),(1059,381,41,'',11,0.655419371764233,1,0),(1060,384,41,'',11,0.0910995081558527,1,0),(1061,80,41,'',11,0,1,0),(1062,151,41,'',11,0,1,0),(1063,197,41,'',11,0.5,0,0),(1064,236,41,'',11,0,1,0),(1065,310,41,'',11,0,1,0),(1066,356,41,'',11,0.5,0,0),(1067,372,41,'',11,0.5,0,0),(1068,385,41,'',11,0.5,0,0),(1069,44,12,'50 110',15,0.5,0,0),(1070,74,12,'50 110',15,0.5,0,0),(1071,97,12,'50 110',15,0.5,0,0),(1072,114,12,'50 110',15,0.5,0,0),(1073,132,12,'50 110',15,0.5,0,0),(1074,148,12,'50 110',15,0.5,0,0),(1075,165,12,'50 110',15,0.5,0,0),(1076,185,12,'50 110',15,0.5,0,0),(1077,199,12,'50 110',15,0.5,0,0),(1078,213,12,'50 110',15,0.5,0,0),(1079,226,12,'50 110',15,0.5,0,0),(1080,237,12,'50 110',15,0.5,0,0),(1081,249,12,'50 110',15,0.5,0,0),(1082,257,12,'50 110',15,0.5,0,0),(1083,270,12,'50 110',15,0.5,0,0),(1084,279,12,'50 110',15,0.5,0,0),(1085,292,12,'50 110',15,0.5,0,0),(1086,97,45,'132',7,0.5,0,0),(1087,310,45,'132',7,0.5,0,0),(1088,226,45,'132',7,0.5,0,0),(1089,114,45,'50',7,0.5,0,0),(1090,165,45,'80',7,0.5,0,0),(1091,140,45,'99',7,0.5,0,0),(1092,240,45,'99',7,0.5,0,0),(1093,74,45,'73',7,0.5,0,0),(1094,235,45,'110',7,0.5,0,0),(1095,144,45,'110',7,0.5,0,0),(1096,310,45,'115',7,0.5,0,0),(1097,251,45,'86',7,0.5,0,0),(1098,8,45,'86',7,0.776699029126214,1,0),(1099,144,45,'86',7,0.728155339805825,1,0),(1100,97,45,'72',7,0.5,0,0),(1101,240,45,'72',7,0.5,0,0),(1102,246,45,'96',7,0.5,0,0),(1103,114,45,'96',7,0.5,0,0),(1104,55,45,'46',7,0.5,0,0),(1105,49,45,'15',7,0.5,0,0),(1106,17,46,'5 5',8,1.74793762905278,2,0),(1107,11,46,'7 5',8,1.84929474794398,2,0),(1108,6,46,'1 10',8,1.71641750081103,2,0),(1109,22,46,'1 10',8,0.728155339805825,1,0),(1110,22,46,'11 3',8,0.776699029126214,1,0),(1111,55,46,'11 3',8,0.960204843699989,1,0),(1112,55,46,'3 9',8,1.02631794117046,2,0),(1113,6,46,'3 9',8,0.728155339805825,1,0),(1114,6,46,'3 1',8,0.877147320800526,1,0),(1115,6,46,'5 1',8,0.728155339805825,1,0),(1116,11,46,'5 2',8,0.967223884955106,1,0),(1117,6,46,'3 2',8,0.910571066755111,1,0),(1118,5,46,'3 0',8,0.551540673189932,2,0),(1119,4,46,'3 4',8,1.65921626237634,2,0),(1120,8,47,'2',10,0.5,0,0),(1121,8,47,'3',10,0.5,0,0),(1122,55,47,'2',10,0.5,0,0),(1123,61,47,'2',10,0.5,0,0),(1124,67,47,'2',10,0.5,0,0),(1125,49,47,'2',10,0.5,0,0),(1126,80,47,'2',10,0.5,0,0),(1127,74,47,'2',10,0.5,0,0),(1128,6,47,'3',10,0.5,0,0),(1129,6,47,'4',10,0.5,0,0),(1130,6,47,'5',10,0.5,0,0),(1131,6,47,'6',10,0.5,0,0),(1132,6,47,'7',10,0.5,0,0),(1133,6,47,'8',10,0.5,0,0),(1134,6,47,'9',10,0.5,0,0),(1135,6,47,'10',10,0.5,0,0),(1136,3,48,'45*5',5,0.5,0,0),(1137,3,48,'5*3*4',5,0.5,0,0),(1138,3,48,'(18-6)*2',5,0.5,0,0),(1139,3,48,'789 + 75',5,0.5,0,0),(1140,3,48,'2659-423',5,0.5,0,0),(1141,3,48,'(236*2)-695',5,0.5,0,0),(1142,3,48,'4*0.95',5,0.5,0,0),(1143,3,48,'2*0.6+1.95',5,0.5,0,0),(1144,3,48,'10*1.95*0.2',5,0.5,0,0),(1145,3,48,'(1+6+2+8)*2-3-14',5,0.5,0,0),(1146,3,48,'659-235+5*13',5,0.5,0,0),(1147,3,48,'6*0.23',5,0.5,0,0),(1148,17,1,'0',6,0.5,0,1),(1149,159,2,'1',6,0.5,0,1),(1150,179,2,'1',6,0.5,0,1),(1151,199,2,'1',6,0.5,0,1),(1152,74,2,'0',6,0.5,0,1),(1153,44,3,'0',3,0.5,0,1),(1154,55,3,'0',3,0.5,0,1),(1155,67,3,'0',3,0.5,0,1),(1156,44,5,'0',3,0.5,0,1),(1157,55,5,'0',3,0.5,0,1),(1158,67,5,'0',3,0.5,0,1),(1159,44,6,'0',3,0.5,0,1),(1160,55,6,'0',3,0.5,0,1),(1161,67,6,'0',3,0.5,0,1),(1162,44,7,'1',3,0.5,0,1),(1163,55,7,'1',3,0.5,0,1),(1164,67,7,'1',3,0.5,0,1),(1165,423,7,'0',3,0.5,0,1),(1166,437,7,'0',3,0.5,0,1),(1167,447,7,'0',3,0.5,0,1),(1168,455,7,'0',3,0.5,0,1),(1169,458,7,'0',3,0.5,0,1),(1170,27,9,'0',6,0.5,0,1),(1171,38,10,'1',14,0.5,0,1),(1172,106,10,'0',14,0.5,0,1),(1173,17,11,'1',6,0.5,0,1),(1174,93,11,'0',6,0.5,0,1),(1175,49,17,'1',14,0.5,0,1),(1176,38,17,'0',14,0.5,0,1),(1177,49,18,'1',14,0.5,0,1),(1178,38,18,'0',14,0.5,0,1),(1179,405,19,'1',13,0.5,0,1),(1180,407,19,'1',13,0.5,0,1),(1181,1,19,'0',13,0.5,0,1),(1182,2,19,'0',13,0.5,0,1),(1183,199,21,'1',6,0.5,0,1),(1184,80,21,'0',6,0.5,0,1),(1185,44,22,'0',3,0.5,0,1),(1186,55,22,'0',3,0.5,0,1),(1187,67,22,'0',3,0.5,0,1),(1188,44,23,'0',3,0.5,0,1),(1189,55,23,'0',3,0.5,0,1),(1190,67,23,'0',3,0.5,0,1),(1191,423,25,'0',3,0.5,0,1),(1192,437,25,'0',3,0.5,0,1),(1193,447,25,'0',3,0.5,0,1),(1194,455,25,'0',3,0.5,0,1),(1195,458,25,'0',3,0.5,0,1),(1196,1,26,'1',13,0.5,0,1),(1197,2,26,'1',13,0.5,0,1),(1198,109,26,'0',13,0.5,0,1),(1199,124,26,'0',13,0.5,0,1),(1200,423,28,'0',3,0.5,0,1),(1201,437,28,'0',3,0.5,0,1),(1202,447,28,'0',3,0.5,0,1),(1203,455,28,'0',3,0.5,0,1),(1204,458,28,'0',3,0.5,0,1),(1205,423,30,'0',3,0.5,0,1),(1206,437,30,'0',3,0.5,0,1),(1207,447,30,'0',3,0.5,0,1),(1208,455,30,'0',3,0.5,0,1),(1209,458,30,'0',3,0.5,0,1),(1210,8,31,'1',14,0.965294052003125,1,1),(1211,97,31,'0',14,0.5,0,1),(1212,8,32,'0',14,0.5,0,1),(1213,11,33,'1',14,0.5,0,1),(1214,16,33,'1',14,0.5,0,1),(1215,423,34,'0',3,0.5,0,1),(1216,437,34,'0',3,0.5,0,1),(1217,447,34,'0',3,0.5,0,1),(1218,455,34,'0',3,0.5,0,1),(1219,458,34,'0',3,0.5,0,1),(1220,44,35,'0',3,0.5,0,1),(1221,55,35,'0',3,0.5,0,1),(1222,67,35,'0',3,0.5,0,1),(1223,6,36,'0',14,0.5,0,1),(1224,6,37,'0',14,0.5,0,1),(1225,405,38,'1',13,0.5,0,1),(1226,407,38,'1',13,0.5,0,1),(1227,109,38,'0',13,0.5,0,1),(1228,124,38,'0',13,0.5,0,1),(1229,140,38,'0',13,0.5,0,1),(1230,159,38,'0',13,0.5,0,1),(1231,176,38,'0',13,0.5,0,1),(1232,191,38,'0',13,0.5,0,1),(1233,206,38,'0',13,0.5,0,1),(1234,219,38,'0',13,0.5,0,1),(1235,235,38,'0',13,0.5,0,1),(1236,243,38,'0',13,0.5,0,1),(1237,255,38,'0',13,0.5,0,1),(1238,423,42,'0',3,0.5,0,1),(1239,437,42,'0',3,0.5,0,1),(1240,447,42,'0',3,0.5,0,1),(1241,455,42,'0',3,0.5,0,1),(1242,458,42,'0',3,0.5,0,1),(1243,17,43,'0',6,0.5,0,1),(1244,423,44,'0',3,0.5,0,1),(1245,437,44,'0',3,0.5,0,1),(1246,447,44,'0',3,0.5,0,1),(1247,455,44,'0',3,0.5,0,1),(1248,458,44,'0',3,0.5,0,1),(1250,3,50,'{\"t\":\"c\",\"r\":30} {\"t\":\"c\",\"r\":21.21}',9,0.995382790539912,2,0),(1251,3,50,'{\"t\":\"c\",\"r\":50} {\"t\":\"c\",\"r\":35.35}',9,0.926136413317582,2,0),(1252,3,50,'{\"t\":\"c\",\"r\":45} {\"t\":\"c\",\"r\":28.46}',9,0.805916608465927,1,0),(1253,3,50,'{\"t\":\"c\",\"r\":50} {\"t\":\"c\",\"r\":23.57}',9,0.928802703196386,1,0),(1254,3,50,'{\"t\":\"c\",\"r\":60} {\"t\":\"c\",\"r\":24.49}',9,0.809061488673139,1,0),(1255,3,50,'{\"t\":\"c\",\"r\":60} {\"t\":\"c\",\"r\":37.94}',9,0.832177531206657,1,0),(1256,3,50,'{\"t\":\"c\",\"r\":55} {\"t\":\"c\",\"r\":20.08}',9,0.88261253309797,1,0),(1257,3,50,'{\"t\":\"c\",\"r\":55} {\"t\":\"c\",\"r\":44.90}',9,0.809061488673139,1,0),(1258,3,50,'{\"t\":\"c\",\"r\":60} {\"t\":\"c\",\"r\":32.07}',9,0.920613179405429,1,0),(1259,3,50,'{\"t\":\"c\",\"r\":65} {\"t\":\"c\",\"r\":27.71}',9,0.5,0,0),(1260,3,50,'{\"t\":\"c\",\"r\":69} {\"t\":\"c\",\"r\":43.63}',9,0.5,0,0),(1261,3,50,'{\"t\":\"c\",\"r\":45} {\"t\":\"c\",\"r\":45}',9,0.5,0,0),(1262,3,50,'{\"t\":\"c\",\"r\":58} {\"t\":\"c\",\"r\":33.48}',9,0.5,0,0),(1263,3,50,'{\"t\":\"c\",\"r\":75} {\"t\":\"c\",\"r\":37.5}',9,0.5,0,0),(1264,3,50,'{\"t\":\"c\",\"r\":80} {\"t\":\"c\",\"r\":34.11}',9,0.5,0,0),(1265,3,50,'{\"t\":\"c\",\"r\":77} {\"t\":\"c\",\"r\":41.15}',9,0.5,0,0),(1266,3,50,'{\"t\":\"c\",\"r\":71} {\"t\":\"c\",\"r\":31.75}',9,0.5,0,0),(1267,3,50,'{\"t\":\"c\",\"r\":86} {\"t\":\"c\",\"r\":28.66}',9,0.5,0,0),(1268,3,50,'{\"t\":\"c\",\"r\":86} {\"t\":\"c\",\"r\":34.51}',9,0.5,0,0),(1269,3,50,'{\"t\":\"c\",\"r\":90} {\"t\":\"c\",\"r\":48.10}',9,0.5,0,0),(1270,3,50,'{\"t\":\"c\",\"r\":78} {\"t\":\"c\",\"r\":2.12}',9,0.920491193456082,1,0),(1271,3,50,'{\"t\":\"c\",\"r\":73} {\"t\":\"c\",\"r\":46.16}',9,0.5,0,0),(1272,3,50,'{\"t\":\"c\",\"r\":85} {\"t\":\"c\",\"r\":32.12}',9,0.5,0,0);
/*!40000 ALTER TABLE `learning_conceptquestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learning_currtable`
--

DROP TABLE IF EXISTS `learning_currtable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `learning_currtable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `concept_id` int(11) NOT NULL,
  `reversed` tinyint(1) NOT NULL,
  `rate` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `learning_currtable_8a386586` (`concept_id`),
  CONSTRAINT `concept_id_refs_id_b20d8891` FOREIGN KEY (`concept_id`) REFERENCES `learning_concept` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning_currtable`
--

LOCK TABLES `learning_currtable` WRITE;
/*!40000 ALTER TABLE `learning_currtable` DISABLE KEYS */;
INSERT INTO `learning_currtable` VALUES (81,35,0,0.7177),(82,28,0,0.1463),(83,25,0,2.0095),(84,42,0,0.0374),(85,23,0,1.075),(86,5,0,1.0276),(87,22,0,55.207),(88,30,0,0.0261),(89,44,0,10.9615),(90,7,0,0.0364),(91,7,1,27.4879),(92,6,0,4.0221),(93,3,0,301.375),(94,34,0,0.0391),(95,16,0,3.28084),(96,11,0,0.254),(97,19,1,274.15),(98,37,0,0.94635),(99,1,1,1.09361),(100,27,1,1.19599),(101,18,1,0.21134),(102,26,0,-17.22222),(103,21,0,3.048),(104,31,0,0.14787),(105,20,1,25899.8811),(106,11,1,0.254),(107,2,1,2.54),(108,37,1,0.94635),(109,36,0,61.02374),(110,18,0,0.21134),(111,4,1,0.47318),(112,13,0,4.22675),(113,21,1,3.048),(114,39,0,0.00405),(115,40,1,0.155),(116,20,0,25899.8811),(117,38,1,255.92778),(118,2,0,2.54),(119,15,0,0.3861),(120,10,1,2.36588),(121,14,1,9.2903),(122,29,0,10.76391),(123,31,1,0.14787),(124,24,1,0.02471),(125,4,0,0.47318),(126,33,0,35.31467),(127,13,1,4.22675),(128,43,0,0.62137),(129,9,0,0.001),(130,40,0,0.155),(131,38,0,255.92778),(132,15,1,0.3861),(133,17,0,0.76455),(134,14,0,9.2903),(135,16,1,3.28084),(136,10,0,2.36588),(137,24,0,0.02471),(138,33,1,35.31467),(139,19,0,274.15),(140,1,0,1.09361),(141,32,0,67.62805),(142,27,0,1.19599),(143,29,1,10.76391),(144,26,1,-17.22222),(145,17,1,0.76455);
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
  `conceptQuestion_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `label` double DEFAULT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `learning_floatmodel_e097c232` (`conceptQuestion_id`),
  KEY `learning_floatmodel_403d8ff3` (`type_id`),
  KEY `learning_floatmodel_6340c63c` (`user_id`),
  CONSTRAINT `type_id_refs_id_f0a33b7b` FOREIGN KEY (`type_id`) REFERENCES `learning_type` (`id`),
  CONSTRAINT `conceptQuestion_id_refs_id_6d49cd9f` FOREIGN KEY (`conceptQuestion_id`) REFERENCES `learning_conceptquestion` (`id`),
  CONSTRAINT `user_id_refs_id_0dfd1d5d` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning_floatmodel`
--

LOCK TABLES `learning_floatmodel` WRITE;
/*!40000 ALTER TABLE `learning_floatmodel` DISABLE KEYS */;
INSERT INTO `learning_floatmodel` VALUES (1,82,65,979,1,3,2,0.207317073170732,'2015-04-17 13:26:53'),(2,327.5,35,1006,1,2,2,0.893129770992366,'2015-04-17 13:26:57'),(3,44.42,2125,891,14,2,2,1,'2015-04-17 13:29:06'),(4,0.44,123,1210,14,172,2,1,'2015-04-17 13:32:01'),(5,352.72,1235,810,14,2,2,1,'2015-04-17 13:32:06'),(6,58.82,125,893,14,2,2,1,'2015-04-17 13:32:10'),(7,52.05,156,952,14,9,2,1,'2015-04-17 13:32:22'),(8,531.84,12,878,14,2,2,0.977436823104693,'2015-04-17 13:32:26'),(9,17.26,6,859,14,1,2,0.652375434530707,'2015-04-17 13:32:31'),(10,7.52,1235,926,14,1,2,1,'2015-04-17 13:32:35'),(11,15.61,1234,887,14,2,2,1,'2015-04-17 13:32:39'),(12,1.9,2,934,14,6,2,0.0526315789473685,'2015-04-17 13:32:48'),(13,34,25,1111,8,89,2,0.264705882352941,'2015-04-17 13:37:53'),(14,28,36,1110,8,3,2,0.285714285714286,'2015-04-17 13:37:58'),(15,15,28,1106,8,2,2,0.866666666666667,'2015-04-17 13:38:02'),(16,167.41,123,956,14,4,2,0.265276865181291,'2015-04-17 13:52:48'),(17,113.7,156,950,14,2,2,0.372031662269129,'2015-04-17 13:52:52'),(18,74.1,65,947,14,2,2,0.12280701754386,'2015-04-17 13:52:56'),(19,2,2,1250,9,15,3,0,'2015-04-17 15:31:00'),(20,2.5,2,1252,9,3,3,0.2,'2015-04-17 15:31:05'),(21,2,2,1251,9,3,3,0,'2015-04-17 15:31:10'),(22,2,2,1250,9,279,3,0,'2015-04-17 15:35:52'),(23,4.5,3,1253,9,10,3,0.333333333333333,'2015-04-17 15:36:04'),(24,7.5,6,1256,9,9,3,0.2,'2015-04-17 15:36:15'),(25,6,10,1254,9,4,3,0.666666666666667,'2015-04-17 15:36:21'),(26,2.5,3,1255,9,5,3,0.2,'2015-04-17 15:36:29'),(27,3.5,4,1258,9,239,3,0.142857142857143,'2015-04-17 15:40:30'),(28,1.5,3.5,1257,9,4,3,1,'2015-04-17 15:40:36'),(29,11.7,12,1054,11,2,3,0.0256410256410257,'2015-04-17 15:40:54'),(30,5,5,1041,11,1,3,0,'2015-04-17 15:40:57'),(31,6,6,1062,11,1,3,0,'2015-04-17 15:41:00'),(32,9,9,1047,11,1,3,0,'2015-04-17 15:41:03'),(33,11,12,1052,11,2,3,0.0909090909090909,'2015-04-17 15:41:07'),(34,11.36,11.5,1053,11,3,3,0.0123239436619719,'2015-04-17 15:41:12'),(35,10.25,10,1050,11,1,3,0.024390243902439,'2015-04-17 15:41:16'),(36,3,3,1039,11,2,3,0,'2015-04-17 15:41:20'),(37,13.6,12,1059,11,2,3,0.117647058823529,'2015-04-17 15:41:23'),(38,9.43,9,1048,11,1,3,0.0455991516436903,'2015-04-17 15:41:27'),(39,5.74,6,1042,11,2,3,0.0452961672473867,'2015-04-17 15:50:00'),(40,10,10,1065,11,2,3,0,'2015-04-17 15:51:36'),(41,7.55,6,1044,11,1,3,0.205298013245033,'2015-04-17 15:54:53'),(42,8,8,1064,11,1,3,0,'2015-04-17 15:55:20'),(43,12.04,12,1055,11,2,3,0.00332225913621255,'2015-04-17 15:55:38'),(44,12.37,12,1056,11,1,3,0.0299110751818916,'2015-04-17 15:55:47'),(45,4,4,1061,11,2,3,0,'2015-04-17 15:56:28'),(46,12.69,16,1057,11,2,3,0.260835303388495,'2015-04-17 16:02:24'),(47,13.3,12,1058,11,1,3,0.0977443609022557,'2015-04-17 16:02:40'),(48,8.06,6,1045,11,2,3,0.255583126550869,'2015-04-17 16:04:19'),(49,13.89,13,1060,11,1,3,0.0640748740100792,'2015-04-17 16:05:38'),(50,8,65,1109,8,2,3,1,'2015-04-17 16:06:47'),(51,6,6,1119,8,2,3,0,'2015-04-17 16:07:15'),(52,8,6,1114,8,3,3,0.25,'2015-04-17 16:07:26'),(53,11,9,1116,8,264,3,0.181818181818182,'2015-04-17 16:12:46'),(54,13,12,1108,8,2,3,0.0769230769230769,'2015-04-17 16:13:28'),(55,16,12,1107,8,2,3,0.25,'2015-04-17 16:13:49'),(56,24,25,1112,8,3,3,0.0416666666666667,'2015-04-17 16:14:04'),(57,14,45,1113,8,2,3,1,'2015-04-17 16:14:48'),(58,8,6,1115,8,2,3,0.25,'2015-04-17 16:15:38'),(59,7,8,1117,8,67,3,0.142857142857143,'2015-04-17 16:25:40'),(60,4,4,1118,8,2,3,0,'2015-04-17 16:26:11'),(61,10.56,123,745,12,2,7,1,'2015-04-17 18:21:44'),(62,28.67,12,1098,7,3,7,0.581444018137426,'2015-04-17 18:21:49'),(63,2.53,3,1099,7,2,7,0.185770750988142,'2015-04-17 18:21:53'),(64,37,45,969,1,99,7,0.216216216216216,'2015-04-17 18:24:13'),(65,7,6,1119,8,7,7,0.142857142857143,'2015-04-17 18:38:25'),(66,4,4,1118,8,2,7,0,'2015-04-17 18:38:30'),(67,24,25,1112,8,2,7,0.0416666666666667,'2015-04-17 18:38:34'),(68,13,24,1108,8,2,7,0.846153846153846,'2015-04-17 18:38:39'),(69,15,23,1106,8,3,7,0.533333333333333,'2015-04-17 18:38:44'),(70,2,2,1251,9,31,7,0,'2015-04-17 18:39:18'),(71,16,12,1107,8,9,7,0.25,'2015-04-17 18:39:30'),(72,1353.68,10,1270,9,13,7,0.992612729744105,'2015-04-17 18:39:45');
/*!40000 ALTER TABLE `learning_floatmodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learning_number`
--

DROP TABLE IF EXISTS `learning_number`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `learning_number` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `number` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=513 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning_number`
--

LOCK TABLES `learning_number` WRITE;
/*!40000 ALTER TABLE `learning_number` DISABLE KEYS */;
INSERT INTO `learning_number` VALUES (1,-5),(2,-2.5),(3,-1),(4,0),(5,1),(6,2),(7,2.5),(8,3),(9,3.26),(10,3.89),(11,4),(12,4.23),(13,4.46),(14,4.52),(15,4.78),(16,4.79),(17,5),(18,5.46),(19,5.58),(20,5.67),(21,5.78),(22,6),(23,6.37),(24,6.56),(25,6.69),(26,6.92),(27,7),(28,7.04),(29,7.16),(30,7.45),(31,7.5),(32,7.92),(33,7.95),(34,8.21),(35,8.3),(36,8.34),(37,8.74),(38,9),(39,9.15),(40,9.23),(41,9.38),(42,9.53),(43,9.56),(44,10),(45,10.12),(46,10.32),(47,10.38),(48,10.82),(49,11),(50,11.01),(51,11.11),(52,11.61),(53,11.84),(54,11.9),(55,12),(56,12.08),(57,12.5),(58,12.69),(59,12.84),(60,12.94),(61,13),(62,13.34),(63,13.42),(64,13.48),(65,13.61),(66,13.72),(67,14),(68,14.07),(69,14.27),(70,14.3),(71,14.5),(72,14.58),(73,14.6),(74,15),(75,15.06),(76,15.21),(77,15.3),(78,15.85),(79,15.86),(80,16),(81,16.53),(82,16.64),(83,16.76),(84,17),(85,17.12),(86,17.5),(87,17.79),(88,17.96),(89,18),(90,18.24),(91,18.29),(92,18.63),(93,19),(94,19.19),(95,19.22),(96,19.45),(97,20),(98,20.16),(99,20.36),(100,20.42),(101,21),(102,21.22),(103,21.42),(104,21.68),(105,21.88),(106,22),(107,22.44),(108,22.5),(109,23),(110,23.34),(111,23.5),(112,23.84),(113,24),(114,25),(115,25.74),(116,26),(117,26.36),(118,26.92),(119,27),(120,27.36),(121,27.38),(122,27.5),(123,27.63),(124,28),(125,28.19),(126,28.34),(127,28.41),(128,28.83),(129,29),(130,29.05),(131,29.84),(132,30),(133,30.82),(134,31),(135,31.16),(136,31.32),(137,32),(138,32.5),(139,32.58),(140,33),(141,33.58),(142,33.84),(143,33.9),(144,34),(145,34.19),(146,34.26),(147,34.48),(148,35),(149,35.57),(150,35.88),(151,36),(152,36.38),(153,36.44),(154,36.72),(155,36.9),(156,37),(157,37.42),(158,37.5),(159,38),(160,39),(161,39.26),(162,39.47),(163,39.76),(164,39.88),(165,40),(166,40.05),(167,40.82),(168,41),(169,41.5),(170,41.68),(171,42),(172,42.48),(173,42.5),(174,42.6),(175,42.68),(176,43),(177,43.5),(178,43.76),(179,44),(180,44.05),(181,44.57),(182,44.68),(183,44.72),(184,44.84),(185,45),(186,46),(187,46.26),(188,46.38),(189,46.87),(190,47),(191,48),(192,48.06),(193,48.35),(194,48.6),(195,48.68),(196,48.7),(197,49),(198,49.37),(199,50),(200,50.5),(201,50.72),(202,51),(203,51.95),(204,52),(205,52.76),(206,53),(207,53.08),(208,53.23),(209,53.64),(210,53.8),(211,54),(212,54.84),(213,55),(214,56),(215,57),(216,57.02),(217,57.32),(218,57.64),(219,58),(220,58.1),(221,58.57),(222,58.84),(223,59),(224,59.22),(225,59.5),(226,60),(227,60.02),(228,60.14),(229,60.95),(230,61.16),(231,62),(232,62.08),(233,62.76),(234,62.8),(235,63),(236,64),(237,65),(238,65.16),(239,65.64),(240,66),(241,67),(242,67.52),(243,68),(244,68.33),(245,68.5),(246,69),(247,69.14),(248,69.44),(249,70),(250,70.76),(251,71),(252,71.36),(253,71.72),(254,72.26),(255,73),(256,74),(257,75),(258,75.45),(259,76.52),(260,76.94),(261,77),(262,77.25),(263,77.33),(264,77.5),(265,78),(266,78.05),(267,78.36),(268,79),(269,79.44),(270,80),(271,80.68),(272,80.95),(273,81),(274,82),(275,82.14),(276,82.95),(277,83),(278,84.71),(279,85),(280,85.52),(281,85.7),(282,85.8),(283,86),(284,86.36),(285,86.5),(286,87),(287,88),(288,89),(289,89.64),(290,89.68),(291,89.74),(292,90),(293,90.46),(294,91),(295,91.7),(296,92),(297,92.9),(298,93),(299,93.71),(300,95),(301,95.14),(302,95.5),(303,95.78),(304,96),(305,96.7),(306,96.74),(307,96.8),(308,97),(309,98),(310,100),(311,101),(312,101.09),(313,101.9),(314,102.16),(315,103),(316,104),(317,104.03),(318,104.5),(319,105),(320,105.2),(321,106),(322,107.1),(323,107.33),(324,108),(325,109),(326,110),(327,111),(328,113),(329,113.5),(330,114.16),(331,114.28),(332,116),(333,118),(334,119),(335,119.52),(336,121),(337,122),(338,122.5),(339,123),(340,125),(341,127),(342,128),(343,128.53),(344,129),(345,131.5),(346,131.71),(347,133),(348,134),(349,136),(350,137),(351,138),(352,140),(353,140.5),(354,143),(355,143.9),(356,144),(357,145),(358,146),(359,146.42),(360,148),(361,149.5),(362,152),(363,153),(364,154),(365,156.09),(366,158),(367,158.5),(368,161),(369,163),(370,167.5),(371,168),(372,169),(373,172),(374,173),(375,176.5),(376,177),(377,178),(378,178.56),(379,181),(380,183),(381,185),(382,185.14),(383,188),(384,193),(385,196),(386,198),(387,201),(388,203),(389,204.5),(390,207.06),(391,208),(392,210.7),(393,213),(394,218),(395,223),(396,228),(397,233),(398,238),(399,242.84),(400,243),(401,248),(402,253),(403,258),(404,263),(405,268),(406,270.28),(407,271),(408,273),(409,274),(410,274.98),(411,277),(412,278),(413,280),(414,283),(415,285.59),(416,286),(417,288),(418,289),(419,292),(420,293),(421,295),(422,298),(423,300),(424,301),(425,303),(426,304),(427,307),(428,308),(429,309),(430,310),(431,313),(432,316),(433,318),(434,323),(435,328),(436,333),(437,338),(438,343),(439,348),(440,353),(441,355.42),(442,358),(443,363),(444,364.12),(445,368),(446,373),(447,376),(448,378),(449,383),(450,388),(451,393),(452,398),(453,403),(454,413.5),(455,414),(456,440.56),(457,442.65),(458,452),(459,490),(460,500),(461,518),(462,521.18),(463,525.7),(464,528),(465,566),(466,604),(467,610.84),(468,622.5),(469,623),(470,642),(471,680),(472,695.98),(473,718),(474,727),(475,746),(476,756),(477,781.12),(478,794),(479,831.5),(480,832),(481,866.26),(482,869),(483,870),(484,908),(485,936),(486,946),(487,951.4),(488,984),(489,992),(490,1022),(491,1036.54),(492,1040.5),(493,1060),(494,1098),(495,1115),(496,1136),(497,1174),(498,1212),(499,1238),(500,1250),(501,1288),(502,1326),(503,1361),(504,1364),(505,1402),(506,1440),(507,1478),(508,1484),(509,1516),(510,1554),(511,1592),(512,1607);
/*!40000 ALTER TABLE `learning_number` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning_type`
--

LOCK TABLES `learning_type` WRITE;
/*!40000 ALTER TABLE `learning_type` DISABLE KEYS */;
INSERT INTO `learning_type` VALUES (1,'angle'),(2,'c'),(3,'curr'),(4,'e'),(5,'equa'),(6,'len'),(7,'line'),(8,'obj'),(9,'objsVol'),(10,'sqr'),(11,'sqrt'),(12,'surf'),(13,'temp'),(14,'vol'),(15,'water');
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
  PRIMARY KEY (`id`),
  KEY `learning_userskill_6340c63c` (`user_id`),
  KEY `learning_userskill_8a386586` (`concept_id`),
  CONSTRAINT `concept_id_refs_id_58601f1e` FOREIGN KEY (`concept_id`) REFERENCES `learning_concept` (`id`),
  CONSTRAINT `user_id_refs_id_21a80d1f` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning_userskill`
--

LOCK TABLES `learning_userskill` WRITE;
/*!40000 ALTER TABLE `learning_userskill` DISABLE KEYS */;
INSERT INTO `learning_userskill` VALUES (1,2,0,8,0),(2,2,0,3,0),(3,2,0,5,0),(4,2,0,6,0),(5,2,0,7,0),(6,2,0,22,0),(7,2,0,23,0),(8,2,0,35,0),(9,2,0,4,0),(10,2,0,10,0),(11,2,0,13,0),(12,2,0,17,0),(13,2,0,18,0),(14,2,0,31,0),(15,2,0,32,0),(16,2,0,33,0),(17,2,0,36,0),(18,2,0,37,0),(19,2,0,45,0),(20,2,0,12,0),(21,2,0,46,0),(22,3,0,50,0),(23,3,0,41,0),(24,3,0.85,46,0),(25,7,0,45,0),(26,7,0,15,0),(27,7,0,8,0),(28,7,0,48,0),(29,7,0,12,0),(30,7,0.280151095774936,46,0),(31,7,0,50,0),(32,7,0,1,0),(33,7,0,2,0),(34,7,0,4,0),(35,7,0,9,0),(36,7,0,10,0),(37,7,0,11,0),(38,7,0,13,0),(39,7,0,14,0),(40,7,0,16,0),(41,7,0,17,0),(42,7,0,18,0),(43,7,0,19,0),(44,7,0,20,0),(45,7,0,21,0),(46,7,0,24,0),(47,7,0,26,0),(48,7,0,27,0),(49,7,0,29,0),(50,7,0,31,0),(51,7,0,32,0),(52,7,0,33,0),(53,7,0,36,0),(54,7,0,37,0),(55,7,0,38,0),(56,7,0,39,0),(57,7,0,40,0),(58,7,0,43,0),(59,7,0,3,0),(60,7,0,5,0),(61,7,0,6,0),(62,7,0,7,0),(63,7,0,22,0),(64,7,0,23,0),(65,7,0,25,0),(66,7,0,28,0),(67,7,0,30,0),(68,7,0,34,0),(69,7,0,35,0),(70,7,0,42,0),(71,7,0,44,0),(72,7,0,41,0),(73,7,0,47,0);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_usersocialauth`
--

LOCK TABLES `social_auth_usersocialauth` WRITE;
/*!40000 ALTER TABLE `social_auth_usersocialauth` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `south_migrationhistory`
--

LOCK TABLES `south_migrationhistory` WRITE;
/*!40000 ALTER TABLE `south_migrationhistory` DISABLE KEYS */;
INSERT INTO `south_migrationhistory` VALUES (1,'lazysignup','0001_initial','2015-04-17 13:11:20'),(2,'social_auth','0001_initial','2015-04-17 13:11:28');
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

-- Dump completed on 2015-04-17 23:33:09
