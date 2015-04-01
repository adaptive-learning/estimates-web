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
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add migration history',1,'add_migrationhistory'),(2,'Can change migration history',1,'change_migrationhistory'),(3,'Can delete migration history',1,'delete_migrationhistory'),(4,'Can add log entry',2,'add_logentry'),(5,'Can change log entry',2,'change_logentry'),(6,'Can delete log entry',2,'delete_logentry'),(7,'Can add permission',3,'add_permission'),(8,'Can change permission',3,'change_permission'),(9,'Can delete permission',3,'delete_permission'),(10,'Can add group',4,'add_group'),(11,'Can change group',4,'change_group'),(12,'Can delete group',4,'delete_group'),(13,'Can add user',5,'add_user'),(14,'Can change user',5,'change_user'),(15,'Can delete user',5,'delete_user'),(16,'Can add content type',6,'add_contenttype'),(17,'Can change content type',6,'change_contenttype'),(18,'Can delete content type',6,'delete_contenttype'),(19,'Can add session',7,'add_session'),(20,'Can change session',7,'change_session'),(21,'Can delete session',7,'delete_session'),(22,'Can add float model',8,'add_floatmodel'),(23,'Can change float model',8,'change_floatmodel'),(24,'Can delete float model',8,'delete_floatmodel'),(25,'Can add concept',9,'add_concept'),(26,'Can change concept',9,'change_concept'),(27,'Can delete concept',9,'delete_concept'),(28,'Can add params',10,'add_params'),(29,'Can change params',10,'change_params'),(30,'Can delete params',10,'delete_params'),(31,'Can add questions',11,'add_questions'),(32,'Can change questions',11,'change_questions'),(33,'Can delete questions',11,'delete_questions'),(34,'Can add type',12,'add_type'),(35,'Can change type',12,'change_type'),(36,'Can delete type',12,'delete_type'),(37,'Can add user skill',13,'add_userskill'),(38,'Can change user skill',13,'change_userskill'),(39,'Can delete user skill',13,'delete_userskill'),(40,'Can add lazy user',14,'add_lazyuser'),(41,'Can change lazy user',14,'change_lazyuser'),(42,'Can delete lazy user',14,'delete_lazyuser'),(43,'Can add user social auth',15,'add_usersocialauth'),(44,'Can change user social auth',15,'change_usersocialauth'),(45,'Can delete user social auth',15,'delete_usersocialauth'),(46,'Can add nonce',16,'add_nonce'),(47,'Can change nonce',16,'change_nonce'),(48,'Can delete nonce',16,'delete_nonce'),(49,'Can add association',17,'add_association'),(50,'Can change association',17,'change_association'),(51,'Can delete association',17,'delete_association'),(52,'Can add curr table',18,'add_currtable'),(53,'Can change curr table',18,'change_currtable'),(54,'Can delete curr table',18,'delete_currtable'),(55,'Can add number',19,'add_number'),(56,'Can change number',19,'change_number'),(57,'Can delete number',19,'delete_number');
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
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$12000$doFwarO6PiBs$PsDq1mjUaFQcn6yckm12YD1Ic8KP0Spy6lC3e1hAodY=','2015-02-27 15:41:04',1,'admin','','','stone99@azet.sk',1,1,'2015-02-27 15:41:04');
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'migration history','south','migrationhistory'),(2,'log entry','admin','logentry'),(3,'permission','auth','permission'),(4,'group','auth','group'),(5,'user','auth','user'),(6,'content type','contenttypes','contenttype'),(7,'session','sessions','session'),(8,'float model','learning','floatmodel'),(9,'concept','learning','concept'),(10,'params','learning','params'),(11,'questions','learning','questions'),(12,'type','learning','type'),(13,'user skill','learning','userskill'),(14,'lazy user','lazysignup','lazyuser'),(15,'user social auth','social_auth','usersocialauth'),(16,'nonce','social_auth','nonce'),(17,'association','social_auth','association'),(18,'curr table','learning','currtable'),(19,'number','learning','number');
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
INSERT INTO `django_session` VALUES ('01l75icdhadx2p77w89w2rdp8i6qeod9','ZTM5M2UwOTM3MzNkNjQxYWQyM2RlNzM4NTJhYmJjZjdhM2FjYWU0NDqAAn1xAS4=','2015-04-15 08:19:41'),('0eetxcxf3r0vx0u82ca99vyu9vpnv3ks','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','2015-04-14 19:05:04'),('0kzdgacs1rkaqrjqvz13tew90p2h24tj','ZjI2YTRjOTU2NjEzMTFhYmUyOTY3NDcwNTNjNjkzNmQwNGNmNDg0NzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZFUlbGF6eXNpZ251cC5iYWNrZW5kcy5MYXp5U2lnbnVwQmFja2VuZFUNX2F1dGhfdXNlcl9pZIoCggB1Lg==','2015-04-15 15:04:26'),('0n546wsbr536nksei7bgvrzpei336exn','ZTM5M2UwOTM3MzNkNjQxYWQyM2RlNzM4NTJhYmJjZjdhM2FjYWU0NDqAAn1xAS4=','2015-04-15 09:01:00'),('18nz8ioto1hwect7lri7w3jai5ejv07h','ZTM5M2UwOTM3MzNkNjQxYWQyM2RlNzM4NTJhYmJjZjdhM2FjYWU0NDqAAn1xAS4=','2015-04-15 08:17:47'),('25xz9agy2wx37628zyxm2k41iat12his','ZTM5M2UwOTM3MzNkNjQxYWQyM2RlNzM4NTJhYmJjZjdhM2FjYWU0NDqAAn1xAS4=','2015-04-15 08:18:04'),('2b59u2i06a8k64569ijqj3p775wkxjhz','ZTM5M2UwOTM3MzNkNjQxYWQyM2RlNzM4NTJhYmJjZjdhM2FjYWU0NDqAAn1xAS4=','2015-04-15 08:33:24'),('2s14q1pu4dry8pg4hv9kdc71bgustz29','ZTM5M2UwOTM3MzNkNjQxYWQyM2RlNzM4NTJhYmJjZjdhM2FjYWU0NDqAAn1xAS4=','2015-04-15 10:39:23'),('3wm26hopbkpe4sfl9nv961gk7x9gfzaf','ZTM5M2UwOTM3MzNkNjQxYWQyM2RlNzM4NTJhYmJjZjdhM2FjYWU0NDqAAn1xAS4=','2015-04-15 08:13:08'),('4ag33xym1zxqv1clyupjqksnzjhm1zor','ZTM5M2UwOTM3MzNkNjQxYWQyM2RlNzM4NTJhYmJjZjdhM2FjYWU0NDqAAn1xAS4=','2015-04-15 08:18:11'),('540t9hioyqa08yt4n6pjrnxqnnim9k4x','ZTM5M2UwOTM3MzNkNjQxYWQyM2RlNzM4NTJhYmJjZjdhM2FjYWU0NDqAAn1xAS4=','2015-04-15 08:17:19'),('7sugwnckvjcgn2o621crv6tpermenay4','MTViY2I1OWUwNjRkM2VlYTI3YTIwYWE2ZDliOTE4NzcwMzg4NWM0NDqAAn1xAShVAnAyWAIAAABkbFUCcDFYBAAAAHBpbnRVDV9hdXRoX3VzZXJfaWSKAoAAVQRwcmVmTlUIcXVlc3Rpb25HQFc5mZmZmZpVEl9hdXRoX3VzZXJfYmFja2VuZFUlbGF6eXNpZ251cC5iYWNrZW5kcy5MYXp5U2lnbnVwQmFja2VuZFUIcGllVGltZXJxAlgOAAAAMTQyNzg4MTM2NS41MThxA1UHbWVkVGltZUsPVQV0eXBlc11xBFgDAAAAdm9scQVhVQR0ZXN0WAMAAABzZXRVBHR5cGVYAwAAAHZvbFUJdGVzdFBhcmFtSwF1Lg==','2015-04-15 09:42:45'),('8c9uzk4pcny2mklgh0rqr9l5s7lphasd','ZTM5M2UwOTM3MzNkNjQxYWQyM2RlNzM4NTJhYmJjZjdhM2FjYWU0NDqAAn1xAS4=','2015-04-15 08:11:58'),('8vvlmrw1jxwazplqt2ekxu3ul0wzdirt','ZTM5M2UwOTM3MzNkNjQxYWQyM2RlNzM4NTJhYmJjZjdhM2FjYWU0NDqAAn1xAS4=','2015-04-15 08:09:27'),('91tqlntfrzzr7prkdl95akre84fblmfk','ZTM5M2UwOTM3MzNkNjQxYWQyM2RlNzM4NTJhYmJjZjdhM2FjYWU0NDqAAn1xAS4=','2015-04-15 08:11:13'),('aq3aw88udfpy21lcuion92ufz8am299f','ZTM5M2UwOTM3MzNkNjQxYWQyM2RlNzM4NTJhYmJjZjdhM2FjYWU0NDqAAn1xAS4=','2015-04-15 08:54:23'),('bi3n2zwac2ac43ufha5ip1uikxgrpcfb','ZTM5M2UwOTM3MzNkNjQxYWQyM2RlNzM4NTJhYmJjZjdhM2FjYWU0NDqAAn1xAS4=','2015-04-15 08:21:27'),('bnzaic4sdsgjk00pk9cekjzcgprfrfwd','ZTM5M2UwOTM3MzNkNjQxYWQyM2RlNzM4NTJhYmJjZjdhM2FjYWU0NDqAAn1xAS4=','2015-04-15 09:00:35'),('bpu9my1idl4kj8cwxsqjv59joe9fmkn0','ZTM5M2UwOTM3MzNkNjQxYWQyM2RlNzM4NTJhYmJjZjdhM2FjYWU0NDqAAn1xAS4=','2015-04-15 08:22:50'),('c1b867b5j1ve0u5ftw26fz95od8qq6wd','ZTM5M2UwOTM3MzNkNjQxYWQyM2RlNzM4NTJhYmJjZjdhM2FjYWU0NDqAAn1xAS4=','2015-04-15 08:34:53'),('cm5y4s1hwekhjbgfsamel7ezaes9rabj','ZTM5M2UwOTM3MzNkNjQxYWQyM2RlNzM4NTJhYmJjZjdhM2FjYWU0NDqAAn1xAS4=','2015-04-15 08:54:44'),('emgyu1xm3tmfq4pcqpfwz17xwuhfva3b','ZDcyM2JlN2UxNjcyZDg4ZmM4NTkzMzRiMGU3MjE1ODI4NDUxNDk0ODqAAn1xAShVAnAyWAQAAAB5YXJkVQJwMVgBAAAAbVUNX2F1dGhfdXNlcl9pZIoBaFUEcHJlZk5VCHF1ZXN0aW9uR0BGAAAAAAAAVRJfYXV0aF91c2VyX2JhY2tlbmRVJWxhenlzaWdudXAuYmFja2VuZHMuTGF6eVNpZ251cEJhY2tlbmRVCHBpZVRpbWVycQJYDQAAADE0Mjc3OTMyMDQuOTJxA1UHbWVkVGltZUsPVQV0eXBlc11xBFgDAAAAbGVucQVhVQR0ZXN0WAMAAABzZXRVBHR5cGVYAwAAAGxlblUJdGVzdFBhcmFtSwF1Lg==','2015-04-14 09:13:24'),('f41c8wfctp2q9h7ghq4r9zm88ujt0sn8','ZTM5M2UwOTM3MzNkNjQxYWQyM2RlNzM4NTJhYmJjZjdhM2FjYWU0NDqAAn1xAS4=','2015-04-15 09:07:10'),('h48802rnnvs7zwhp7kfcl1vsdl5i0zj0','NDVjNDM4OTQwZmI1NzQ1NjQ5N2ZiZWFhNzhlYjc1MTg4NjE1ZWVkYzqAAn1xAShVAnAyWAMAAABDSEZVAnAxWAMAAABFVVJVDV9hdXRoX3VzZXJfaWSKAoEAVQRwcmVmTlUIcXVlc3Rpb25HQEwAAAAAAABVEl9hdXRoX3VzZXJfYmFja2VuZFUlbGF6eXNpZ251cC5iYWNrZW5kcy5MYXp5U2lnbnVwQmFja2VuZFUIcGllVGltZXJYDgAAADE0Mjc4OTQyODYuMzM1VQdtZWRUaW1lSw9VCXRlc3RQYXJhbUsBVQR0ZXN0WAMAAABzZXRVBHR5cGVYBAAAAGN1cnJVBXR5cGVzXXECWAQAAABjdXJycQNhdS4=','2015-04-15 13:19:15'),('i8ieb9qmfljgxbfcjfnxpfppfhywewqq','ZTM5M2UwOTM3MzNkNjQxYWQyM2RlNzM4NTJhYmJjZjdhM2FjYWU0NDqAAn1xAS4=','2015-04-15 08:04:30'),('itii45iz6hg3tow8hr3rkhmb6agzu2w3','ZTM5M2UwOTM3MzNkNjQxYWQyM2RlNzM4NTJhYmJjZjdhM2FjYWU0NDqAAn1xAS4=','2015-04-15 08:23:20'),('k828r7dhsgxfxghx83hyvcs7odq6gk8q','ZTM5M2UwOTM3MzNkNjQxYWQyM2RlNzM4NTJhYmJjZjdhM2FjYWU0NDqAAn1xAS4=','2015-04-15 08:12:49'),('l6d3l0k58jdxbfxhjvbk3syvgd53li3h','OTdkY2E2OGZhY2ZkMjQ0YmFmNjdjOGI1MGFkN2IwMTAwZGRmYmZjMzqAAn1xAShVAnAyWAIAAAAtMVUCcDFYAwAAAG91dFUNX2F1dGhfdXNlcl9pZIoBalUEcHJlZk5VCHF1ZXN0aW9uR0AzAAAAAAAAVRJfYXV0aF91c2VyX2JhY2tlbmRVJWxhenlzaWdudXAuYmFja2VuZHMuTGF6eVNpZ251cEJhY2tlbmRVCHBpZVRpbWVycQJYDgAAADE0Mjc4MjQ0MTguNDk3cQNVB21lZFRpbWWKAQVVBXR5cGVzXXEEWAUAAABhbmdsZXEFYVUEdGVzdFgDAAAAc2V0VQR0eXBlWAUAAABhbmdsZVUJdGVzdFBhcmFtSwF1Lg==','2015-04-14 17:53:38'),('lmymq4sn6xd702cuabb30pyivm8t083s','ZTM5M2UwOTM3MzNkNjQxYWQyM2RlNzM4NTJhYmJjZjdhM2FjYWU0NDqAAn1xAS4=','2015-04-15 08:41:31'),('lpjds2y89fqon8lzd814vqq8gc12orft','ZTM5M2UwOTM3MzNkNjQxYWQyM2RlNzM4NTJhYmJjZjdhM2FjYWU0NDqAAn1xAS4=','2015-04-15 08:05:17'),('lwktxt14ufjnvf1el2kfbtgil6cbzec8','ZjUyYTk0NWQ3NGM1N2ZlNzY1YWFkZGVmZTY2Y2Y1MTViOTQzOWVjODqAAn1xAShVAnAyWAIAAABkbFUCcDFYBAAAAHRic3BVDV9hdXRoX3VzZXJfaWSKAWdVCHF1ZXN0aW9uR0BVYUeuFHrhVRJfYXV0aF91c2VyX2JhY2tlbmRVJWxhenlzaWdudXAuYmFja2VuZHMuTGF6eVNpZ251cEJhY2tlbmRVCHBpZVRpbWVyR0HVRnTYpnbKVQdtZWRUaW1lSw9VBXR5cGVzXXECWAMAAAB2b2xxA2FVBHRlc3RYAwAAAHNldFUEdHlwZVgDAAAAdm9sVQl0ZXN0UGFyYW1LAXUu','2015-04-13 22:51:44'),('ly2n59bwjco7maivu5f7nu4cfsehso0y','ZTM5M2UwOTM3MzNkNjQxYWQyM2RlNzM4NTJhYmJjZjdhM2FjYWU0NDqAAn1xAS4=','2015-04-15 08:05:51'),('m08zy81vtfhadeg1xigpdeyp7yyh3n7b','ZTM5M2UwOTM3MzNkNjQxYWQyM2RlNzM4NTJhYmJjZjdhM2FjYWU0NDqAAn1xAS4=','2015-04-15 09:04:14'),('m3i4dh41ckqu6p2nl6144qkx0set1qjd','ZTM5M2UwOTM3MzNkNjQxYWQyM2RlNzM4NTJhYmJjZjdhM2FjYWU0NDqAAn1xAS4=','2015-04-15 08:12:54'),('mglhhsvyilo0wniiddfny9qmmc6jhr3y','ZTM5M2UwOTM3MzNkNjQxYWQyM2RlNzM4NTJhYmJjZjdhM2FjYWU0NDqAAn1xAS4=','2015-04-15 09:03:27'),('n5oiecsha3drrcji09kmr8srtavytnoi','ZTM5M2UwOTM3MzNkNjQxYWQyM2RlNzM4NTJhYmJjZjdhM2FjYWU0NDqAAn1xAS4=','2015-04-15 09:42:40'),('nkhm8wzo3zqv636tcfsy6uwruzu0i817','ZTM5M2UwOTM3MzNkNjQxYWQyM2RlNzM4NTJhYmJjZjdhM2FjYWU0NDqAAn1xAS4=','2015-04-15 09:07:23'),('o4664n26ztonz06jlndscdm6vkoe4hom','ZTM5M2UwOTM3MzNkNjQxYWQyM2RlNzM4NTJhYmJjZjdhM2FjYWU0NDqAAn1xAS4=','2015-04-15 08:13:46'),('ouq1lxybmj707fiiui0vwzts4lkkyrh9','ZTM5M2UwOTM3MzNkNjQxYWQyM2RlNzM4NTJhYmJjZjdhM2FjYWU0NDqAAn1xAS4=','2015-04-15 08:22:31'),('pjg31a57479s2mffe82u2861lgxdpaza','ZTM5M2UwOTM3MzNkNjQxYWQyM2RlNzM4NTJhYmJjZjdhM2FjYWU0NDqAAn1xAS4=','2015-04-15 08:14:24'),('qg6voqg24gmnyly4zbtb2meghounygb2','NTQ5NDA0NDFhNmI0ZDg0ZGVmNzk2ODdiMWE5MGIyODBhZGVhOTY5YTqAAn1xAShVAnAyWAYAAABrZWx2aW5VAnAxWAQAAABkZWdDVQ1fYXV0aF91c2VyX2lkigFmVQhxdWVzdGlvbkdAO4AAAAAAAFUSX2F1dGhfdXNlcl9iYWNrZW5kVSVsYXp5c2lnbnVwLmJhY2tlbmRzLkxhenlTaWdudXBCYWNrZW5kVQhwaWVUaW1lckdB1UZqiPMzM1UHbWVkVGltZUsPVQV0eXBlc11xAlgEAAAAdGVtcHEDYVUEdGVzdFgDAAAAc2V0VQR0eXBlWAQAAAB0ZW1wVQl0ZXN0UGFyYW1LAXUu','2015-04-13 19:55:19'),('qktx8ldabrpgskw2f1p3ex3ermhmvl5s','ZTM5M2UwOTM3MzNkNjQxYWQyM2RlNzM4NTJhYmJjZjdhM2FjYWU0NDqAAn1xAS4=','2015-04-15 09:34:11'),('qrk7ea11pzwqphc9pvhbu7pugkj9yy93','ZTM5M2UwOTM3MzNkNjQxYWQyM2RlNzM4NTJhYmJjZjdhM2FjYWU0NDqAAn1xAS4=','2015-04-15 08:19:36'),('qswhipca41c1symv2482mvlz0khfj1t6','ZTM5M2UwOTM3MzNkNjQxYWQyM2RlNzM4NTJhYmJjZjdhM2FjYWU0NDqAAn1xAS4=','2015-04-15 08:16:37'),('r2jz4r5id1j7f29izu086fmpxl53uayx','MGQzNjNkNGRiYjcyM2E1YzBkMDBlZGIzNWNkMjIyOGJkYzJmNzEwMDqAAn1xAShVAnAyWAIAAAAtMVUCcDFYAgAAAC0xVQ1fYXV0aF91c2VyX2lkigFpVQhxdWVzdGlvbkdAMQAAAAAAAFUSX2F1dGhfdXNlcl9iYWNrZW5kVSVsYXp5c2lnbnVwLmJhY2tlbmRzLkxhenlTaWdudXBCYWNrZW5kVQhwaWVUaW1lclgOAAAAMTQyNzgwOTYyMy4zNjNVB21lZFRpbWVLD1UJdGVzdFBhcmFtSwJVBHRlc3RYAwAAAHNldFUEdHlwZVgEAAAAc3FydFUFdHlwZXNdcQJYBAAAAHNxcnRxA2F1Lg==','2015-04-14 13:47:18'),('rkafgufn3l8hgnlz3xbtwtfhasgl27v5','ZTM5M2UwOTM3MzNkNjQxYWQyM2RlNzM4NTJhYmJjZjdhM2FjYWU0NDqAAn1xAS4=','2015-04-15 09:33:57'),('slk0bsib0dc6jng0pufd6c6ihqh3r4wb','ZTM5M2UwOTM3MzNkNjQxYWQyM2RlNzM4NTJhYmJjZjdhM2FjYWU0NDqAAn1xAS4=','2015-04-15 08:15:08'),('u63kp00ddkp4torezqtuqxrd4hl1dm07','ZTM5M2UwOTM3MzNkNjQxYWQyM2RlNzM4NTJhYmJjZjdhM2FjYWU0NDqAAn1xAS4=','2015-04-15 08:14:53'),('vh6g6gzdetlqk7dxwlszoubo5i54llb7','ZTM5M2UwOTM3MzNkNjQxYWQyM2RlNzM4NTJhYmJjZjdhM2FjYWU0NDqAAn1xAS4=','2015-04-15 08:18:42'),('vlz3mkt8r2r9bhega68m2ayaixanmgdm','ZTM5M2UwOTM3MzNkNjQxYWQyM2RlNzM4NTJhYmJjZjdhM2FjYWU0NDqAAn1xAS4=','2015-04-15 08:14:13'),('vob38p3xfg0nzt2naakecoctt6e2u8xa','ZTM5M2UwOTM3MzNkNjQxYWQyM2RlNzM4NTJhYmJjZjdhM2FjYWU0NDqAAn1xAS4=','2015-04-15 08:22:46'),('wantmnplog6iv26krq9j5k7apsglypn5','ZTM5M2UwOTM3MzNkNjQxYWQyM2RlNzM4NTJhYmJjZjdhM2FjYWU0NDqAAn1xAS4=','2015-04-15 08:04:11'),('x5y0cjqrney0372458zu74jeziobobiy','ZTM5M2UwOTM3MzNkNjQxYWQyM2RlNzM4NTJhYmJjZjdhM2FjYWU0NDqAAn1xAS4=','2015-04-15 09:33:48'),('xmpqx8sqqt40v3iyur6whvor47ob6ely','ZTM5M2UwOTM3MzNkNjQxYWQyM2RlNzM4NTJhYmJjZjdhM2FjYWU0NDqAAn1xAS4=','2015-04-15 09:07:28'),('yogfgxad1h4uh9nx9o4u3walmzkbzvnc','ZTM5M2UwOTM3MzNkNjQxYWQyM2RlNzM4NTJhYmJjZjdhM2FjYWU0NDqAAn1xAS4=','2015-04-15 08:56:14'),('zwd7so3xw293rwcdbz5xrkadm5732aon','ZTM5M2UwOTM3MzNkNjQxYWQyM2RlNzM4NTJhYmJjZjdhM2FjYWU0NDqAAn1xAS4=','2015-04-15 08:18:37');
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
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lazysignup_lazyuser`
--

LOCK TABLES `lazysignup_lazyuser` WRITE;
/*!40000 ALTER TABLE `lazysignup_lazyuser` DISABLE KEYS */;
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
  `type_id` int(11) NOT NULL,
  `params_id` int(11) NOT NULL,
  `label` double DEFAULT NULL,
  `updatedTimes` int(11) NOT NULL,
  `hint` tinyint(1) NOT NULL,
  `question_id` int(11),
  PRIMARY KEY (`id`),
  KEY `learning_concept_403d8ff3` (`type_id`),
  KEY `learning_concept_45bd63ef` (`params_id`),
  KEY `learning_concept_25110688` (`question_id`),
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
INSERT INTO `learning_concept` VALUES (1,14,98,0.5,0,0,NULL),(2,14,98,0.5,0,0,NULL),(3,14,98,0.5,0,0,NULL),(4,14,98,0.5,0,0,NULL),(5,14,98,0.5,0,0,NULL),(6,14,98,0.5,0,0,NULL),(7,14,98,0.5,0,0,NULL),(8,14,98,0.5,0,0,NULL),(9,14,98,0.5,0,0,NULL),(10,14,98,0.5,0,0,NULL),(11,14,98,0.5,0,0,NULL),(12,14,98,0.5,0,0,NULL),(13,14,98,0.5,0,0,NULL),(14,14,98,0.5,0,0,NULL),(15,14,98,0.5,0,0,NULL),(16,14,98,0.5,0,0,NULL),(17,14,98,0.5,0,0,NULL),(18,14,98,0.5,0,0,NULL),(19,14,98,0.5,0,0,NULL),(20,14,98,0.5,0,0,NULL),(21,14,98,0.5,0,0,NULL),(22,14,98,0.5,0,0,NULL),(23,14,98,0.5,0,0,NULL),(24,14,98,0.5,0,0,NULL),(25,14,98,0.5,0,0,NULL),(26,14,98,0.5,0,0,NULL),(27,14,98,0.5,0,0,NULL),(28,14,98,0.5,0,0,NULL),(29,14,98,0.5,0,0,NULL),(30,14,98,0.5,0,0,NULL),(31,14,98,0.5,0,0,NULL),(32,14,98,0.5,0,0,NULL),(33,14,98,0.5,0,0,NULL),(34,14,98,0.5,0,0,NULL),(35,14,98,0.5,0,0,NULL),(36,14,82,0.5,0,0,NULL),(37,14,82,0.5,0,0,NULL),(38,14,82,0.5,0,0,NULL),(39,14,82,0.5,0,0,NULL),(40,14,82,0.5,0,0,NULL),(41,14,82,0.5,0,0,NULL),(42,14,82,0.5,0,0,NULL),(43,14,82,0.5,0,0,NULL),(44,14,82,0.5,0,0,NULL),(45,14,82,0.5,0,0,NULL),(46,14,82,0.5,0,0,NULL),(47,14,82,0.5,0,0,NULL),(48,14,82,0.5,0,0,NULL),(49,14,82,0.5,0,0,NULL),(50,14,82,0.5,0,0,NULL),(51,14,82,0.5,0,0,NULL),(52,14,82,0.5,0,0,NULL),(53,14,82,0.5,0,0,NULL),(54,14,82,0.5,0,0,NULL),(55,14,82,0.5,0,0,NULL),(56,14,82,0.5,0,0,NULL),(57,14,82,0.5,0,0,NULL),(58,14,82,0.5,0,0,NULL),(59,14,82,0.5,0,0,NULL),(60,14,82,0.5,0,0,NULL),(61,14,82,0.5,0,0,NULL),(62,14,82,0.5,0,0,NULL),(63,14,82,0.5,0,0,NULL),(64,14,82,0.5,0,0,NULL),(65,14,82,0.5,0,0,NULL),(66,14,82,0.5,0,0,NULL),(67,14,82,0.5,0,0,NULL),(68,14,82,0.5,0,0,NULL),(69,14,82,0.5,0,0,NULL),(70,14,82,0.5,0,0,NULL),(71,14,118,0.5,0,0,NULL),(72,14,118,0.5,0,0,NULL),(73,14,118,0.5,0,0,NULL),(74,14,118,0.5,0,0,NULL),(75,14,118,0.5,0,0,NULL),(76,14,118,0.5,0,0,NULL),(77,14,118,0.5,0,0,NULL),(78,14,118,0.5,0,0,NULL),(79,14,118,0.5,0,0,NULL),(80,14,118,0.5,0,0,NULL),(81,14,118,0.5,0,0,NULL),(82,14,118,0.5,0,0,NULL),(83,14,118,0.5,0,0,NULL),(84,14,118,0.5,0,0,NULL),(85,14,118,0.5,0,0,NULL),(86,14,118,0.5,0,0,NULL),(87,14,118,0.5,0,0,NULL),(88,14,118,0.5,0,0,NULL),(89,14,118,0.5,0,0,NULL),(90,14,118,0.5,0,0,NULL),(91,14,118,0.5,0,0,NULL),(92,14,118,0.5,0,0,NULL),(93,14,118,0.5,0,0,NULL),(94,14,118,0.5,0,0,NULL),(95,14,118,0.5,0,0,NULL),(96,14,118,0.5,0,0,NULL),(97,14,118,0.5,0,0,NULL),(98,14,118,0.5,0,0,NULL),(99,14,118,0.5,0,0,NULL),(100,14,118,0.5,0,0,NULL),(101,14,118,0.5,0,0,NULL),(102,14,118,0.5,0,0,NULL),(103,14,118,0.5,0,0,NULL),(104,14,118,0.5,0,0,NULL),(105,14,118,0.5,0,0,NULL),(106,14,114,0.5,0,0,NULL),(107,14,114,0.5,0,0,NULL),(108,14,114,0.5,0,0,NULL),(109,14,114,0.5,0,0,NULL),(110,14,114,0.5,0,0,NULL),(111,14,114,0.5,0,0,NULL),(112,14,114,0.5,0,0,NULL),(113,14,114,0.5,0,0,NULL),(114,14,114,0.5,0,0,NULL),(115,14,114,0.5,0,0,NULL),(116,14,114,0.5,0,0,NULL),(117,14,114,0.5,0,0,NULL),(118,14,114,0.5,0,0,NULL),(119,14,114,0.5,0,0,NULL),(120,14,114,0.5,0,0,NULL),(121,14,114,0.5,0,0,NULL),(122,14,114,0.5,0,0,NULL),(123,14,114,0.5,0,0,NULL),(124,14,114,0.5,0,0,NULL),(125,14,114,0.5,0,0,NULL),(126,14,114,0.5,0,0,NULL),(127,14,114,0.5,0,0,NULL),(128,14,114,0.5,0,0,NULL),(129,14,114,0.5,0,0,NULL),(130,14,114,0.5,0,0,NULL),(131,14,114,0.5,0,0,NULL),(132,14,114,0.5,0,0,NULL),(133,14,114,0.5,0,0,NULL),(134,14,114,0.5,0,0,NULL),(135,14,114,0.5,0,0,NULL),(136,14,114,0.5,0,0,NULL),(137,14,114,0.5,0,0,NULL),(138,14,114,0.5,0,0,NULL),(139,14,114,0.5,0,0,NULL),(140,14,114,0.5,0,0,NULL),(141,14,88,0.5,0,0,NULL),(142,14,88,0.5,0,0,NULL),(143,14,88,0.5,0,0,NULL),(144,14,88,0.5,0,0,NULL),(145,14,88,0.5,0,0,NULL),(146,14,88,0.5,0,0,NULL),(147,14,88,0.5,0,0,NULL),(148,14,88,0.5,0,0,NULL),(149,14,88,0.5,0,0,NULL),(150,14,88,0.5,0,0,NULL),(151,14,88,0.5,0,0,NULL),(152,14,88,0.5,0,0,NULL),(153,14,88,0.5,0,0,NULL),(154,14,88,0.5,0,0,NULL),(155,14,88,0.5,0,0,NULL),(156,14,88,0.5,0,0,NULL),(157,14,88,0.5,0,0,NULL),(158,14,88,0.5,0,0,NULL),(159,14,88,0.5,0,0,NULL),(160,14,88,0.5,0,0,NULL),(161,14,88,0.5,0,0,NULL),(162,14,88,0.5,0,0,NULL),(163,14,88,0.5,0,0,NULL),(164,14,88,0.5,0,0,NULL),(165,14,88,0.5,0,0,NULL),(166,14,88,0.5,0,0,NULL),(167,14,88,0.5,0,0,NULL),(168,14,88,0.5,0,0,NULL),(169,14,88,0.5,0,0,NULL),(170,14,88,0.5,0,0,NULL),(171,14,88,0.5,0,0,NULL),(172,14,88,0.5,0,0,NULL),(173,14,88,0.5,0,0,NULL),(174,14,88,0.5,0,0,NULL),(175,14,88,0.5,0,0,NULL),(176,14,79,0.5,0,0,NULL),(177,14,79,0.5,0,0,NULL),(178,14,79,0.5,0,0,NULL),(179,14,79,0.5,0,0,NULL),(180,14,79,0.5,0,0,NULL),(181,14,79,0.5,0,0,NULL),(182,14,79,0.5,0,0,NULL),(183,14,79,0.5,0,0,NULL),(184,14,79,0.5,0,0,NULL),(185,14,79,0.5,0,0,NULL),(186,14,79,0.5,0,0,NULL),(187,14,79,0.5,0,0,NULL),(188,14,79,0.5,0,0,NULL),(189,14,79,0.5,0,0,NULL),(190,14,79,0.5,0,0,NULL),(191,14,79,0.5,0,0,NULL),(192,14,79,0.5,0,0,NULL),(193,14,79,0.5,0,0,NULL),(194,14,79,0.5,0,0,NULL),(195,14,79,0.5,0,0,NULL),(196,14,79,0.5,0,0,NULL),(197,14,79,0.5,0,0,NULL),(198,14,79,0.5,0,0,NULL),(199,14,79,0.5,0,0,NULL),(200,14,79,0.5,0,0,NULL),(201,14,79,0.5,0,0,NULL),(202,14,79,0.5,0,0,NULL),(203,14,79,0.5,0,0,NULL),(204,14,79,0.5,0,0,NULL),(205,14,79,0.5,0,0,NULL),(206,14,79,0.5,0,0,NULL),(207,14,79,0.5,0,0,NULL),(208,14,79,0.5,0,0,NULL),(209,14,79,0.5,0,0,NULL),(210,14,79,0.5,0,0,NULL),(211,14,58,0.5,0,0,NULL),(212,14,58,0.5,0,0,NULL),(213,14,58,0.5,0,0,NULL),(214,14,58,0.5,0,0,NULL),(215,14,58,0.5,0,0,NULL),(216,14,58,0.5,0,0,NULL),(217,14,58,0.5,0,0,NULL),(218,14,58,0.5,0,0,NULL),(219,14,58,0.5,0,0,NULL),(220,14,58,0.5,0,0,NULL),(221,14,58,0.5,0,0,NULL),(222,14,58,0.5,0,0,NULL),(223,14,58,0.5,0,0,NULL),(224,14,58,0.5,0,0,NULL),(225,14,58,0.5,0,0,NULL),(226,14,58,0.5,0,0,NULL),(227,14,58,0.5,0,0,NULL),(228,14,58,0.5,0,0,NULL),(229,14,58,0.5,0,0,NULL),(230,14,58,0.5,0,0,NULL),(231,14,58,0.5,0,0,NULL),(232,14,58,0.5,0,0,NULL),(233,14,58,0.5,0,0,NULL),(234,14,58,0.5,0,0,NULL),(235,14,58,0.5,0,0,NULL),(236,14,58,0.5,0,0,NULL),(237,14,58,0.5,0,0,NULL),(238,14,58,0.5,0,0,NULL),(239,14,58,0.5,0,0,NULL),(240,14,58,0.5,0,0,NULL),(241,14,58,0.5,0,0,NULL),(242,14,58,0.5,0,0,NULL),(243,14,58,0.5,0,0,NULL),(244,14,58,0.5,0,0,NULL),(245,14,58,0.5,0,0,NULL),(246,14,76,0.5,0,0,NULL),(247,14,76,0.5,0,0,NULL),(248,14,76,0.5,0,0,NULL),(249,14,76,0.5,0,0,NULL),(250,14,76,0.5,0,0,NULL),(251,14,76,0.5,0,0,NULL),(252,14,76,0.5,0,0,NULL),(253,14,76,0.5,0,0,NULL),(254,14,76,0.5,0,0,NULL),(255,14,76,0.5,0,0,NULL),(256,14,76,0.5,0,0,NULL),(257,14,76,0.5,0,0,NULL),(258,14,76,0.5,0,0,NULL),(259,14,76,0.5,0,0,NULL),(260,14,76,0.5,0,0,NULL),(261,14,76,0.5,0,0,NULL),(262,14,76,0.5,0,0,NULL),(263,14,76,0.5,0,0,NULL),(264,14,76,0.5,0,0,NULL),(265,14,76,0.5,0,0,NULL),(266,14,76,0.5,0,0,NULL),(267,14,76,0.5,0,0,NULL),(268,14,76,0.5,0,0,NULL),(269,14,76,0.5,0,0,NULL),(270,14,76,0.5,0,0,NULL),(271,14,57,0.5,0,0,NULL),(272,14,57,0.5,0,0,NULL),(273,14,57,0.5,0,0,NULL),(274,14,57,0.5,0,0,NULL),(275,14,57,0.5,0,0,NULL),(276,14,57,0.5,0,0,NULL),(277,14,57,0.5,0,0,NULL),(278,14,57,0.5,0,0,NULL),(279,14,57,0.5,0,0,NULL),(280,14,57,0.5,0,0,NULL),(281,14,57,0.5,0,0,NULL),(282,14,57,0.5,0,0,NULL),(283,14,57,0.5,0,0,NULL),(284,14,57,0.5,0,0,NULL),(285,14,57,0.5,0,0,NULL),(286,14,57,0.5,0,0,NULL),(287,14,57,0.5,0,0,NULL),(288,14,57,0.5,0,0,NULL),(289,14,57,0.5,0,0,NULL),(290,14,57,0.5,0,0,NULL),(291,14,57,0.5,0,0,NULL),(292,14,57,0.5,0,0,NULL),(293,14,57,0.5,0,0,NULL),(294,14,57,0.5,0,0,NULL),(295,14,57,0.5,0,0,NULL),(296,14,54,0.5,0,0,NULL),(297,14,54,0.5,0,0,NULL),(298,14,54,0.5,0,0,NULL),(299,14,54,0.5,0,0,NULL),(300,14,54,0.5,0,0,NULL),(301,14,54,0.5,0,0,NULL),(302,14,54,0.5,0,0,NULL),(303,14,54,0.5,0,0,NULL),(304,14,54,0.5,0,0,NULL),(305,14,54,0.5,0,0,NULL),(306,14,54,0.5,0,0,NULL),(307,14,54,0.5,0,0,NULL),(308,14,54,0.5,0,0,NULL),(309,14,54,0.5,0,0,NULL),(310,14,54,0.5,0,0,NULL),(311,14,54,0.5,0,0,NULL),(312,14,54,0.5,0,0,NULL),(313,14,54,0.5,0,0,NULL),(314,14,54,0.5,0,0,NULL),(315,14,54,0.5,0,0,NULL),(316,14,54,0.5,0,0,NULL),(317,14,54,0.5,0,0,NULL),(318,14,54,0.5,0,0,NULL),(319,14,54,0.5,0,0,NULL),(320,14,54,0.5,0,0,NULL),(321,14,56,0.5,0,0,NULL),(322,14,56,0.5,0,0,NULL),(323,14,56,0.5,0,0,NULL),(324,14,56,0.5,0,0,NULL),(325,14,56,0.5,0,0,NULL),(326,14,56,0.5,0,0,NULL),(327,14,56,0.5,0,0,NULL),(328,14,56,0.5,0,0,NULL),(329,14,56,0.5,0,0,NULL),(330,14,56,0.5,0,0,NULL),(331,14,56,0.5,0,0,NULL),(332,14,56,0.5,0,0,NULL),(333,14,56,0.5,0,0,NULL),(334,14,56,0.5,0,0,NULL),(335,14,56,0.5,0,0,NULL),(336,14,56,0.5,0,0,NULL),(337,14,56,0.5,0,0,NULL),(338,14,56,0.5,0,0,NULL),(339,14,56,0.5,0,0,NULL),(340,14,56,0.5,0,0,NULL),(341,14,56,0.5,0,0,NULL),(342,14,56,0.5,0,0,NULL),(343,14,56,0.5,0,0,NULL),(344,14,56,0.5,0,0,NULL),(345,14,56,0.5,0,0,NULL),(346,14,99,0.5,0,0,NULL),(347,14,99,0.5,0,0,NULL),(348,14,99,0.5,0,0,NULL),(349,14,99,0.5,0,0,NULL),(350,14,99,0.5,0,0,NULL),(351,14,99,0.5,0,0,NULL),(352,14,99,0.5,0,0,NULL),(353,14,99,0.5,0,0,NULL),(354,14,99,0.5,0,0,NULL),(355,14,99,0.5,0,0,NULL),(356,14,99,0.5,0,0,NULL),(357,14,99,0.5,0,0,NULL),(358,14,99,0.5,0,0,NULL),(359,14,99,0.5,0,0,NULL),(360,14,99,0.5,0,0,NULL),(361,14,99,0.5,0,0,NULL),(362,14,99,0.5,0,0,NULL),(363,14,99,0.5,0,0,NULL),(364,14,99,0.5,0,0,NULL),(365,14,99,0.5,0,0,NULL),(366,14,99,0.5,0,0,NULL),(367,14,99,0.5,0,0,NULL),(368,14,99,0.5,0,0,NULL),(369,14,99,0.5,0,0,NULL),(370,14,99,0.5,0,0,NULL),(371,14,75,0.5,0,0,NULL),(372,14,75,0.5,0,0,NULL),(373,14,75,0.5,0,0,NULL),(374,14,75,0.5,0,0,NULL),(375,14,75,0.5,0,0,NULL),(376,14,75,0.5,0,0,NULL),(377,14,75,0.5,0,0,NULL),(378,14,75,0.5,0,0,NULL),(379,14,75,0.5,0,0,NULL),(380,14,75,0.5,0,0,NULL),(381,14,75,0.5,0,0,NULL),(382,14,75,0.5,0,0,NULL),(383,14,75,0.5,0,0,NULL),(384,14,75,0.5,0,0,NULL),(385,14,75,0.5,0,0,NULL),(386,14,75,0.5,0,0,NULL),(387,14,75,0.5,0,0,NULL),(388,14,75,0.5,0,0,NULL),(389,14,75,0.5,0,0,NULL),(390,14,75,0.5,0,0,NULL),(391,14,75,0.5,0,0,NULL),(392,14,75,0.5,0,0,NULL),(393,14,75,0.5,0,0,NULL),(394,14,75,0.5,0,0,NULL),(395,14,75,0.5,0,0,NULL),(396,14,95,0.5,0,0,NULL),(397,14,95,0.5,0,0,NULL),(398,14,95,0.5,0,0,NULL),(399,14,95,0.5,0,0,NULL),(400,14,95,0.5,0,0,NULL),(401,14,95,0.5,0,0,NULL),(402,14,95,0.5,0,0,NULL),(403,14,95,0.5,0,0,NULL),(404,14,95,0.5,0,0,NULL),(405,14,95,0.5,0,0,NULL),(406,14,95,0.5,0,0,NULL),(407,14,95,0.5,0,0,NULL),(408,14,95,0.5,0,0,NULL),(409,14,95,0.5,0,0,NULL),(410,14,95,0.5,0,0,NULL),(411,14,95,0.5,0,0,NULL),(412,14,95,0.5,0,0,NULL),(413,14,95,0.5,0,0,NULL),(414,14,95,0.5,0,0,NULL),(415,14,95,0.5,0,0,NULL),(416,14,95,0.5,0,0,NULL),(417,14,95,0.5,0,0,NULL),(418,14,95,0.5,0,0,NULL),(419,14,95,0.5,0,0,NULL),(420,14,95,0.5,0,0,NULL),(422,6,97,0.5,0,0,NULL),(424,6,97,0.5,0,0,NULL),(426,6,97,0.5,0,0,NULL),(427,6,97,0.5,0,0,NULL),(428,6,97,0.5,0,0,NULL),(429,6,97,0.5,0,0,NULL),(430,6,97,0.5,0,0,NULL),(431,6,97,0.5,0,0,NULL),(432,6,97,0.5,0,0,NULL),(433,6,97,0.5,0,0,NULL),(434,6,97,0.5,0,0,NULL),(435,6,97,0.5,0,0,NULL),(436,6,97,0.5,0,0,NULL),(437,6,97,0.5,0,0,NULL),(438,6,97,0.5,0,0,NULL),(439,6,97,0.5,0,0,NULL),(440,6,97,0.5,0,0,NULL),(441,6,97,0.5,0,0,NULL),(442,6,97,0.5,0,0,NULL),(443,6,72,0.5,0,0,NULL),(444,6,72,0.5,0,0,NULL),(445,6,72,0.5,0,0,NULL),(446,6,72,0.5,0,0,NULL),(447,6,72,0.5,0,0,NULL),(448,6,72,0.5,0,0,NULL),(449,6,72,0.5,0,0,NULL),(450,6,72,0.5,0,0,NULL),(451,6,72,0.5,0,0,NULL),(452,6,72,0.5,0,0,NULL),(453,6,72,0.5,0,0,NULL),(454,6,72,0.5,0,0,NULL),(455,6,72,0.5,0,0,NULL),(456,6,72,0.5,0,0,NULL),(457,6,72,0.5,0,0,NULL),(458,6,72,0.5,0,0,NULL),(459,6,72,0.5,0,0,NULL),(460,6,72,0.5,0,0,NULL),(461,6,72,0.5,0,0,NULL),(462,6,80,0.5,0,0,NULL),(463,6,80,0.5,0,0,NULL),(464,6,80,0.5,0,0,NULL),(465,6,80,0.5,0,0,NULL),(466,6,80,0.5,0,0,NULL),(467,6,80,0.5,0,0,NULL),(468,6,80,0.5,0,0,NULL),(469,6,80,0.5,0,0,NULL),(470,6,80,0.5,0,0,NULL),(471,6,80,0.5,0,0,NULL),(472,6,80,0.5,0,0,NULL),(473,6,80,0.5,0,0,NULL),(474,6,80,0.5,0,0,NULL),(475,6,80,0.5,0,0,NULL),(476,6,80,0.5,0,0,NULL),(477,6,80,0.5,0,0,NULL),(478,6,80,0.5,0,0,NULL),(479,6,112,0.5,0,0,NULL),(480,6,112,0.5,0,0,NULL),(481,6,112,0.5,0,0,NULL),(482,6,112,0.5,0,0,NULL),(483,6,112,0.5,0,0,NULL),(484,6,112,0.5,0,0,NULL),(485,6,112,0.5,0,0,NULL),(486,6,112,0.5,0,0,NULL),(487,6,112,0.5,0,0,NULL),(488,6,112,0.5,0,0,NULL),(489,6,112,0.5,0,0,NULL),(490,6,112,0.5,0,0,NULL),(491,6,112,0.5,0,0,NULL),(492,6,112,0.5,0,0,NULL),(493,6,112,0.5,0,0,NULL),(494,6,112,0.5,0,0,NULL),(495,6,105,0.5,0,0,NULL),(496,6,105,0.5,0,0,NULL),(497,6,105,0.5,0,0,NULL),(498,6,105,0.5,0,0,NULL),(499,6,105,0.5,0,0,NULL),(500,6,105,0.5,0,0,NULL),(501,6,105,0.5,0,0,NULL),(502,6,105,0.5,0,0,NULL),(503,6,105,0.5,0,0,NULL),(504,6,105,0.5,0,0,NULL),(505,6,105,0.5,0,0,NULL),(506,6,105,0.5,0,0,NULL),(507,6,105,0.5,0,0,NULL),(508,6,105,0.5,0,0,NULL),(509,6,105,0.5,0,0,NULL),(510,6,105,0.5,0,0,NULL),(511,6,102,0.5,0,0,NULL),(512,6,102,0.5,0,0,NULL),(513,6,102,0.5,0,0,NULL),(514,6,102,0.5,0,0,NULL),(515,6,102,0.5,0,0,NULL),(516,6,102,0.5,0,0,NULL),(517,6,102,0.5,0,0,NULL),(518,6,102,0.5,0,0,NULL),(519,6,102,0.5,0,0,NULL),(520,6,102,0.5,0,0,NULL),(521,6,102,0.5,0,0,NULL),(522,6,102,0.5,0,0,NULL),(523,6,102,0.5,0,0,NULL),(524,6,102,0.5,0,0,NULL),(525,6,102,0.5,0,0,NULL),(526,6,102,0.5,0,0,NULL),(527,6,102,0.5,0,0,NULL),(528,6,102,0.5,0,0,NULL),(529,6,102,0.5,0,0,NULL),(530,6,102,0.5,0,0,NULL),(531,6,102,0.5,0,0,NULL),(532,6,102,0.5,0,0,NULL),(533,6,102,0.5,0,0,NULL),(534,6,102,0.5,0,0,NULL),(535,6,102,0.5,0,0,NULL),(536,6,102,0.5,0,0,NULL),(537,6,102,0.5,0,0,NULL),(538,6,102,0.5,0,0,NULL),(539,6,102,0.5,0,0,NULL),(540,6,102,0.5,0,0,NULL),(541,6,102,0.5,0,0,NULL),(542,6,102,0.5,0,0,NULL),(543,6,102,0.5,0,0,NULL),(544,6,102,0.5,0,0,NULL),(545,6,102,0.5,0,0,NULL),(546,6,102,0.5,0,0,NULL),(547,6,102,0.5,0,0,NULL),(548,6,102,0.5,0,0,NULL),(549,6,102,0.5,0,0,NULL),(550,6,102,0.5,0,0,NULL),(551,6,102,0.5,0,0,NULL),(552,6,102,0.5,0,0,NULL),(553,6,102,0.5,0,0,NULL),(554,6,102,0.5,0,0,NULL),(555,6,102,0.5,0,0,NULL),(556,6,102,0.5,0,0,NULL),(557,6,102,0.5,0,0,NULL),(558,6,102,0.5,0,0,NULL),(559,6,102,0.5,0,0,NULL),(560,6,102,0.5,0,0,NULL),(561,6,102,0.5,0,0,NULL),(562,6,102,0.5,0,0,NULL),(563,6,102,0.5,0,0,NULL),(564,6,102,0.5,0,0,NULL),(565,6,102,0.5,0,0,NULL),(566,6,102,0.5,0,0,NULL),(567,6,102,0.5,0,0,NULL),(568,6,102,0.5,0,0,NULL),(569,6,102,0.5,0,0,NULL),(570,6,102,0.5,0,0,NULL),(571,6,102,0.5,0,0,NULL),(572,6,102,0.5,0,0,NULL),(573,6,102,0.5,0,0,NULL),(574,6,102,0.5,0,0,NULL),(575,6,102,0.5,0,0,NULL),(576,6,102,0.5,0,0,NULL),(577,6,102,0.5,0,0,NULL),(578,6,102,0.5,0,0,NULL),(579,6,102,0.5,0,0,NULL),(580,6,102,0.5,0,0,NULL),(581,6,102,0.5,0,0,NULL),(582,6,102,0.5,0,0,NULL),(583,6,102,0.5,0,0,NULL),(584,6,102,0.5,0,0,NULL),(585,6,102,0.5,0,0,NULL),(586,6,102,0.5,0,0,NULL),(587,5,68,0.5,0,0,NULL),(588,5,68,0.5,0,0,NULL),(589,5,68,0.5,0,0,NULL),(590,5,68,0.5,0,0,NULL),(591,5,68,0.5,0,0,NULL),(592,5,68,0.5,0,0,NULL),(593,5,68,0.5,0,0,NULL),(594,5,68,0.5,0,0,NULL),(595,5,68,0.5,0,0,NULL),(596,5,68,0.5,0,0,NULL),(597,5,68,0.5,0,0,NULL),(598,5,68,0.5,0,0,NULL),(599,5,68,0.5,0,0,NULL),(600,5,68,0.5,0,0,NULL),(601,5,68,0.5,0,0,NULL),(602,5,68,0.5,0,0,NULL),(603,5,68,0.5,0,0,NULL),(604,5,68,0.5,0,0,NULL),(605,5,68,0.5,0,0,NULL),(606,5,68,0.5,0,0,NULL),(619,5,53,0.5,0,0,NULL),(620,5,53,0.5,0,0,NULL),(621,5,53,0.5,0,0,NULL),(622,5,53,0.5,0,0,NULL),(623,5,53,0.5,0,0,NULL),(624,5,53,0.5,0,0,NULL),(625,5,53,0.5,0,0,NULL),(626,5,53,0.5,0,0,NULL),(627,5,53,0.5,0,0,NULL),(628,5,53,0.5,0,0,NULL),(629,5,53,0.5,0,0,NULL),(630,5,53,0.5,0,0,NULL),(631,5,84,0.5,0,0,NULL),(632,5,84,0.5,0,0,NULL),(633,5,84,0.5,0,0,NULL),(634,5,84,0.5,0,0,NULL),(635,5,84,0.5,0,0,NULL),(636,5,84,0.5,0,0,NULL),(637,5,84,0.5,0,0,NULL),(638,5,84,0.5,0,0,NULL),(639,5,62,0.5,0,0,NULL),(640,5,62,0.5,0,0,NULL),(641,5,62,0.5,0,0,NULL),(642,5,62,0.5,0,0,NULL),(643,5,62,0.5,0,0,NULL),(644,5,62,0.5,0,0,NULL),(645,5,62,0.5,0,0,NULL),(646,5,62,0.5,0,0,NULL),(647,5,62,0.5,0,0,NULL),(648,5,62,0.5,0,0,NULL),(649,5,62,0.5,0,0,NULL),(650,5,62,0.5,0,0,NULL),(651,5,119,0.5,0,0,NULL),(652,5,119,0.5,0,0,NULL),(653,5,119,0.5,0,0,NULL),(654,5,119,0.5,0,0,NULL),(655,5,119,0.5,0,0,NULL),(656,5,119,0.5,0,0,NULL),(657,5,119,0.5,0,0,NULL),(658,5,74,0.5,0,0,NULL),(659,5,74,0.5,0,0,NULL),(660,5,74,0.5,0,0,NULL),(661,5,74,0.5,0,0,NULL),(662,5,74,0.5,0,0,NULL),(663,5,74,0.5,0,0,NULL),(664,5,74,0.5,0,0,NULL),(665,5,74,0.5,0,0,NULL),(666,5,74,0.5,0,0,NULL),(667,5,69,0.5,0,0,NULL),(668,5,69,0.5,0,0,NULL),(669,5,69,0.5,0,0,NULL),(670,5,69,0.5,0,0,NULL),(671,5,69,0.5,0,0,NULL),(672,5,69,0.5,0,0,NULL),(673,5,86,0.5,0,0,NULL),(674,5,86,0.5,0,0,NULL),(675,5,86,0.5,0,0,NULL),(676,5,86,0.5,0,0,NULL),(677,5,86,0.5,0,0,NULL),(678,5,86,0.5,0,0,NULL),(679,5,51,0.5,0,0,NULL),(680,5,51,0.5,0,0,NULL),(681,5,51,0.5,0,0,NULL),(682,5,51,0.5,0,0,NULL),(683,5,51,0.5,0,0,NULL),(684,5,51,0.5,0,0,NULL),(685,5,51,0.5,0,0,NULL),(686,5,104,0.5,0,0,NULL),(687,5,104,0.5,0,0,NULL),(688,5,104,0.5,0,0,NULL),(689,5,104,0.5,0,0,NULL),(690,5,104,0.5,0,0,NULL),(691,5,104,0.5,0,0,NULL),(692,5,115,0.5,0,0,NULL),(693,5,115,0.5,0,0,NULL),(694,5,115,0.5,0,0,NULL),(695,5,115,0.5,0,0,NULL),(696,5,115,0.5,0,0,NULL),(697,5,115,0.5,0,0,NULL),(698,5,115,0.5,0,0,NULL),(699,5,115,0.5,0,0,NULL),(700,5,115,0.5,0,0,NULL),(701,5,115,0.5,0,0,NULL),(702,5,60,0.5,0,0,NULL),(703,5,60,0.5,0,0,NULL),(704,5,60,0.5,0,0,NULL),(705,5,60,0.5,0,0,NULL),(706,5,60,0.5,0,0,NULL),(707,5,60,0.5,0,0,NULL),(708,5,60,0.5,0,0,NULL),(709,5,60,0.5,0,0,NULL),(710,5,60,0.5,0,0,NULL),(711,4,111,0.5,0,0,NULL),(712,4,111,0.5,0,0,NULL),(713,4,111,0.5,0,0,NULL),(714,4,111,0.5,0,0,NULL),(715,4,111,0.5,0,0,NULL),(716,4,117,0.5,0,0,NULL),(717,4,117,0.5,0,0,NULL),(718,4,117,0.5,0,0,NULL),(719,4,117,0.5,0,0,NULL),(720,4,117,0.5,0,0,NULL),(731,4,65,0.5,0,0,NULL),(732,4,65,0.5,0,0,NULL),(733,4,65,0.5,0,0,NULL),(734,4,65,0.5,0,0,NULL),(735,4,65,0.5,0,0,NULL),(736,4,65,0.5,0,0,NULL),(737,4,65,0.5,0,0,NULL),(738,4,65,0.5,0,0,NULL),(739,4,65,0.5,0,0,NULL),(740,4,65,0.5,0,0,NULL),(741,4,65,0.5,0,0,NULL),(742,4,106,0.5,0,0,NULL),(743,4,106,0.5,0,0,NULL),(744,4,106,0.5,0,0,NULL),(745,4,106,0.5,0,0,NULL),(746,4,106,0.5,0,0,NULL),(747,4,87,0.5,0,0,NULL),(748,4,87,0.5,0,0,NULL),(749,4,87,0.5,0,0,NULL),(750,4,87,0.5,0,0,NULL),(751,4,87,0.5,0,0,NULL),(752,4,94,0.5,0,0,NULL),(753,4,94,0.5,0,0,NULL),(754,4,94,0.5,0,0,NULL),(755,4,94,0.5,0,0,NULL),(756,4,94,0.5,0,0,NULL),(757,4,108,0.5,0,0,NULL),(758,4,108,0.5,0,0,NULL),(759,4,108,0.5,0,0,NULL),(760,4,108,0.5,0,0,NULL),(761,4,108,0.5,0,0,NULL),(762,4,108,0.5,0,0,NULL),(763,4,81,0.5,0,0,NULL),(764,4,81,0.5,0,0,NULL),(765,4,81,0.5,0,0,NULL),(766,4,81,0.5,0,0,NULL),(767,4,81,0.5,0,0,NULL),(768,4,81,0.5,0,0,NULL),(769,4,66,0.5,0,0,NULL),(770,4,66,0.5,0,0,NULL),(771,4,66,0.5,0,0,NULL),(772,4,66,0.5,0,0,NULL),(773,4,66,0.5,0,0,NULL),(774,4,66,0.5,0,0,NULL),(775,4,96,0.5,0,0,NULL),(776,4,96,0.5,0,0,NULL),(777,4,96,0.5,0,0,NULL),(778,4,96,0.5,0,0,NULL),(779,4,96,0.5,0,0,NULL),(780,4,96,0.5,0,0,NULL),(782,4,77,0.5,0,0,NULL),(783,4,77,0.5,0,0,NULL),(784,4,77,0.5,0,0,NULL),(785,4,77,0.5,0,0,NULL),(786,4,77,0.5,0,0,NULL),(787,4,77,0.5,0,0,NULL),(788,4,77,0.5,0,0,NULL),(789,4,77,0.5,0,0,NULL),(790,4,110,0.5,0,0,NULL),(791,4,110,0.5,0,0,NULL),(792,4,110,0.5,0,0,NULL),(793,4,110,0.5,0,0,NULL),(794,4,110,0.5,0,0,NULL),(795,4,110,0.5,0,0,NULL),(796,4,110,0.5,0,0,NULL),(797,4,110,0.5,0,0,NULL),(798,4,110,0.5,0,0,NULL),(799,4,109,0.5,0,0,NULL),(800,4,109,0.5,0,0,NULL),(801,4,109,0.5,0,0,NULL),(802,4,109,0.5,0,0,NULL),(803,4,109,0.5,0,0,NULL),(804,4,109,0.5,0,0,NULL),(805,4,109,0.5,0,0,NULL),(806,4,109,0.5,0,0,NULL),(807,4,109,0.5,0,0,NULL),(808,4,73,0.5,0,0,NULL),(809,4,73,0.5,0,0,NULL),(810,4,73,0.5,0,0,NULL),(811,4,73,0.5,0,0,NULL),(812,4,73,0.5,0,0,NULL),(813,4,73,0.5,0,0,NULL),(814,4,73,0.5,0,0,NULL),(815,4,78,0.5,0,0,NULL),(816,4,78,0.5,0,0,NULL),(817,4,78,0.5,0,0,NULL),(818,4,78,0.5,0,0,NULL),(819,4,78,0.5,0,0,NULL),(820,4,78,0.5,0,0,NULL),(821,4,78,0.5,0,0,NULL),(822,4,78,0.5,0,0,NULL),(823,4,78,0.5,0,0,NULL),(824,4,78,0.5,0,0,NULL),(825,4,78,0.5,0,0,NULL),(826,4,78,0.5,0,0,NULL),(827,4,78,0.5,0,0,NULL),(828,4,78,0.5,0,0,NULL),(829,4,78,0.5,0,0,NULL),(830,4,78,0.5,0,0,NULL),(831,4,78,0.5,0,0,NULL),(832,4,78,0.5,0,0,NULL),(869,3,100,0.5,0,0,NULL),(870,3,100,0.5,0,0,NULL),(871,3,100,0.5,0,0,NULL),(872,3,100,0.5,0,0,NULL),(873,3,100,0.5,0,0,NULL),(874,3,100,0.5,0,0,NULL),(875,3,100,0.5,0,0,NULL),(876,3,100,0.5,0,0,NULL),(877,3,100,0.5,0,0,NULL),(878,3,100,0.5,0,0,NULL),(879,3,100,0.5,0,0,NULL),(880,3,100,0.5,0,0,NULL),(881,3,103,0.5,0,0,NULL),(882,3,103,0.5,0,0,NULL),(883,3,103,0.5,0,0,NULL),(884,3,103,0.5,0,0,NULL),(885,3,103,0.5,0,0,NULL),(886,3,103,0.5,0,0,NULL),(887,3,64,0.5,0,0,NULL),(888,3,64,0.5,0,0,NULL),(889,3,64,0.5,0,0,NULL),(890,3,64,0.5,0,0,NULL),(891,3,64,0.5,0,0,NULL),(892,3,64,0.5,0,0,NULL),(893,3,90,0.5,0,0,NULL),(894,3,90,0.5,0,0,NULL),(895,3,90,0.5,0,0,NULL),(896,3,90,0.5,0,0,NULL),(897,3,90,0.5,0,0,NULL),(898,3,90,0.5,0,0,NULL),(899,3,90,0.5,0,0,NULL),(900,3,90,0.5,0,0,NULL),(901,3,90,0.5,0,0,NULL),(902,3,83,0.5,0,0,NULL),(903,3,83,0.5,0,0,NULL),(904,3,83,0.5,0,0,NULL),(905,3,83,0.5,0,0,NULL),(906,3,83,0.5,0,0,NULL),(907,3,55,0.5,0,0,NULL),(908,3,55,0.5,0,0,NULL),(909,3,55,0.5,0,0,NULL),(910,3,55,0.5,0,0,NULL),(911,3,55,0.5,0,0,NULL),(912,3,55,0.5,0,0,NULL),(919,3,107,0.5,0,0,NULL),(920,3,107,0.5,0,0,NULL),(921,3,107,0.5,0,0,NULL),(922,3,107,0.5,0,0,NULL),(923,3,107,0.5,0,0,NULL),(924,3,107,0.5,0,0,NULL),(925,3,101,0.5,0,0,NULL),(926,3,101,0.5,0,0,NULL),(927,3,101,0.5,0,0,NULL),(928,3,101,0.5,0,0,NULL),(929,3,101,0.5,0,0,NULL),(930,3,101,0.5,0,0,NULL),(931,3,101,0.5,0,0,NULL),(932,3,120,0.5,0,0,NULL),(933,3,120,0.5,0,0,NULL),(934,3,120,0.5,0,0,NULL),(935,3,120,0.5,0,0,NULL),(936,3,120,0.5,0,0,NULL),(937,3,120,0.5,0,0,NULL),(938,3,120,0.5,0,0,NULL),(939,3,120,0.5,0,0,NULL),(940,3,120,0.5,0,0,NULL),(941,3,120,0.5,0,0,NULL),(942,3,120,0.5,0,0,NULL),(943,3,120,0.5,0,0,NULL),(944,3,120,0.5,0,0,NULL),(945,3,120,0.5,0,0,NULL),(946,3,120,0.5,0,0,NULL),(947,3,120,0.5,0,0,NULL),(948,3,92,0.5,0,0,NULL),(949,3,92,0.5,0,0,NULL),(950,3,92,0.5,0,0,NULL),(951,3,92,0.5,0,0,NULL),(952,3,92,0.5,0,0,NULL),(953,3,92,0.5,0,0,NULL),(954,3,116,0.5,0,0,NULL),(955,3,116,0.5,0,0,NULL),(956,3,116,0.5,0,0,NULL),(957,3,116,0.5,0,0,NULL),(958,3,116,0.5,0,0,NULL),(959,3,116,0.5,0,0,NULL),(960,3,116,0.5,0,0,NULL),(961,3,116,0.5,0,0,NULL),(962,3,116,0.5,0,0,NULL),(963,3,116,0.5,0,0,NULL),(964,3,70,0.5,0,0,NULL),(965,3,70,0.5,0,0,NULL),(966,3,70,0.5,0,0,NULL),(967,3,70,0.5,0,0,NULL),(968,3,70,0.5,0,0,NULL),(969,3,70,0.5,0,0,NULL),(970,3,70,0.5,0,0,NULL),(971,3,70,0.5,0,0,NULL),(972,3,70,0.5,0,0,NULL),(973,3,93,0.5,0,0,NULL),(974,3,93,0.5,0,0,NULL),(975,3,93,0.5,0,0,NULL),(976,3,93,0.5,0,0,NULL),(977,3,93,0.5,0,0,NULL),(978,3,93,0.5,0,0,NULL),(979,3,93,0.5,0,0,NULL),(980,3,93,0.5,0,0,NULL),(981,3,89,0.5,0,0,NULL),(982,3,89,0.5,0,0,NULL),(983,3,89,0.5,0,0,NULL),(984,3,89,0.5,0,0,NULL),(985,3,89,0.5,0,0,NULL),(986,3,89,0.5,0,0,NULL),(987,3,89,0.5,0,0,NULL),(988,3,89,0.5,0,0,NULL),(989,3,89,0.5,0,0,NULL),(990,3,89,0.5,0,0,NULL),(991,3,85,0.5,0,0,NULL),(992,3,85,0.5,0,0,NULL),(993,3,85,0.5,0,0,NULL),(994,3,85,0.5,0,0,NULL),(995,3,85,0.5,0,0,NULL),(996,3,85,0.5,0,0,NULL),(997,3,85,0.5,0,0,NULL),(998,3,85,0.5,0,0,NULL),(999,3,85,0.5,0,0,NULL),(1000,3,85,0.5,0,0,NULL),(1001,3,85,0.5,0,0,NULL),(1002,3,71,0.5,0,0,NULL),(1003,3,71,0.5,0,0,NULL),(1004,3,71,0.5,0,0,NULL),(1005,3,71,0.5,0,0,NULL),(1006,3,71,0.5,0,0,NULL),(1007,3,71,0.5,0,0,NULL),(1008,3,71,0.5,0,0,NULL),(1009,3,71,0.5,0,0,NULL),(1010,3,71,0.5,0,0,NULL),(1011,3,67,0.5,0,0,NULL),(1012,3,67,0.5,0,0,NULL),(1013,3,67,0.5,0,0,NULL),(1014,3,67,0.5,0,0,NULL),(1015,3,67,0.5,0,0,NULL),(1016,3,67,0.5,0,0,NULL),(1017,3,67,0.5,0,0,NULL),(1018,3,67,0.5,0,0,NULL),(1019,3,67,0.5,0,0,NULL),(1020,3,61,0.5,0,0,NULL),(1021,3,61,0.5,0,0,NULL),(1022,3,61,0.5,0,0,NULL),(1023,3,61,0.5,0,0,NULL),(1024,3,61,0.5,0,0,NULL),(1025,3,61,0.5,0,0,NULL),(1026,3,61,0.5,0,0,NULL),(1027,3,61,0.5,0,0,NULL),(1028,3,61,0.5,0,0,NULL),(1029,3,61,0.5,0,0,NULL),(1030,3,61,0.5,0,0,NULL),(1033,9,59,0.5,0,0,NULL),(1034,9,59,0.5,0,0,NULL),(1035,9,59,0.5,0,0,NULL),(1036,9,59,0.5,0,0,NULL),(1037,9,59,0.5,0,0,NULL),(1038,9,59,0.5,0,0,NULL),(1039,9,59,0.5,0,0,NULL),(1040,9,59,0.5,0,0,NULL),(1041,9,59,0.5,0,0,NULL),(1042,9,59,0.5,0,0,NULL),(1043,9,59,0.5,0,0,NULL),(1044,9,59,0.5,0,0,NULL),(1045,9,59,0.5,0,0,NULL),(1046,9,59,0.5,0,0,NULL),(1047,9,59,0.5,0,0,NULL),(1048,9,59,0.5,0,0,NULL),(1049,9,59,0.5,0,0,NULL),(1050,9,59,0.5,0,0,NULL),(1051,9,59,0.5,0,0,NULL),(1052,9,59,0.5,0,0,NULL),(1053,9,59,0.5,0,0,NULL),(1054,9,59,0.5,0,0,NULL),(1055,9,59,0.5,0,0,NULL),(1056,9,59,0.5,0,0,NULL),(1057,9,59,0.5,0,0,NULL),(1058,9,59,0.5,0,0,NULL),(1059,9,59,0.5,0,0,NULL),(1060,9,59,0.5,0,0,NULL),(1061,9,59,0.5,0,0,NULL),(1062,9,59,0.5,0,0,NULL),(1063,9,59,0.5,0,0,NULL),(1064,9,59,0.5,0,0,NULL),(1065,9,59,0.5,0,0,NULL),(1066,9,59,0.5,0,0,NULL),(1067,9,59,0.5,0,0,NULL),(1068,9,59,0.5,0,0,NULL),(1069,9,59,0.5,0,0,NULL),(1070,9,59,0.5,0,0,NULL),(1071,9,91,0.5,0,0,NULL),(1072,9,91,0.5,0,0,NULL),(1073,9,91,0.5,0,0,NULL),(1074,9,91,0.5,0,0,NULL),(1075,9,91,0.5,0,0,NULL),(1076,9,91,0.5,0,0,NULL),(1077,9,91,0.5,0,0,NULL),(1078,9,91,0.5,0,0,NULL),(1079,9,91,0.5,0,0,NULL),(1080,9,91,0.5,0,0,NULL),(1081,9,91,0.5,0,0,NULL),(1082,9,91,0.5,0,0,NULL),(1083,9,91,0.5,0,0,NULL),(1084,9,91,0.5,0,0,NULL),(1085,9,91,0.5,0,0,NULL),(1086,9,91,0.5,0,0,NULL),(1087,9,91,0.5,0,0,NULL),(1088,9,91,0.5,0,0,NULL),(1089,9,91,0.5,0,0,NULL),(1090,9,91,0.5,0,0,NULL),(1091,9,91,0.5,0,0,NULL),(1092,9,91,0.5,0,0,NULL),(1093,9,91,0.5,0,0,NULL),(1094,9,91,0.5,0,0,NULL),(1095,9,91,0.5,0,0,NULL),(1096,9,91,0.5,0,0,NULL),(1097,9,91,0.5,0,0,NULL),(1098,9,91,0.5,0,0,NULL),(1099,9,91,0.5,0,0,NULL),(1100,9,91,0.5,0,0,NULL),(1101,9,91,0.5,0,0,NULL),(1102,9,91,0.5,0,0,NULL),(1103,9,91,0.5,0,0,NULL),(1104,9,91,0.5,0,0,NULL),(1105,9,91,0.5,0,0,NULL),(1106,9,91,0.5,0,0,NULL),(1107,9,91,0.5,0,0,NULL),(1108,9,91,0.5,0,0,NULL),(1109,8,113,0.5,0,0,NULL),(1110,8,113,0.5,0,0,NULL),(1111,8,113,0.5,0,0,NULL),(1112,8,113,0.5,0,0,NULL),(1113,8,113,0.5,0,0,NULL),(1115,8,113,0.5,0,0,NULL),(1116,8,113,0.5,0,0,NULL),(1117,8,113,0.5,0,0,NULL),(1118,8,113,0.5,0,0,NULL),(1119,8,113,0.5,0,0,NULL),(1120,8,113,0.5,0,0,NULL),(1121,8,113,0.5,0,0,NULL),(1122,8,113,0.5,0,0,NULL),(1123,8,113,0.5,0,0,NULL),(1124,8,113,0.5,0,0,NULL),(1125,8,113,0.5,0,0,NULL),(1126,8,113,0.5,0,0,NULL),(1127,8,113,0.5,0,0,NULL),(1128,8,113,0.5,0,0,NULL),(1130,8,113,0.5,0,0,NULL),(1131,8,113,0.5,0,0,NULL),(1132,8,113,0.5,0,0,NULL),(1133,8,113,0.5,0,0,NULL),(1135,8,113,0.5,0,0,NULL),(1136,8,113,0.5,0,0,NULL),(1137,8,113,0.5,0,0,NULL),(1139,8,113,0.5,0,0,NULL),(1141,8,113,0.5,0,0,NULL),(1142,8,113,0.5,0,0,NULL),(1143,8,113,0.5,0,0,NULL),(1144,10,63,0.5,0,0,NULL),(1145,10,63,0.5,0,0,NULL),(1146,10,63,0.5,0,0,NULL),(1147,10,63,0.5,0,0,NULL),(1148,10,63,0.5,0,0,NULL),(1149,10,63,0.5,0,0,NULL),(1150,10,63,0.5,0,0,NULL),(1151,10,63,0.5,0,0,NULL),(1152,10,63,0.5,0,0,NULL),(1153,10,63,0.5,0,0,NULL),(1154,10,63,0.5,0,0,NULL),(1155,10,63,0.5,0,0,NULL),(1156,10,63,0.5,0,0,NULL),(1157,10,63,0.5,0,0,NULL),(1158,10,63,0.5,0,0,NULL),(1159,10,63,0.5,0,0,NULL),(1160,10,63,0.5,0,0,NULL),(1180,11,122,0.5,0,0,NULL),(1181,11,122,0.5,0,0,NULL),(1182,11,122,0.5,0,0,NULL),(1183,11,121,0.5,0,0,NULL),(1184,11,123,0.5,0,0,NULL),(1185,11,124,0.5,0,0,NULL),(1186,11,124,0.5,0,0,NULL),(1187,11,125,0.5,0,0,NULL),(1188,11,126,0.5,0,0,NULL),(1189,11,126,0.5,0,0,NULL),(1190,11,127,0.5,0,0,NULL),(1191,11,128,0.5,0,0,NULL),(1192,11,128,0.5,0,0,NULL),(1193,11,128,0.5,0,0,NULL),(1194,11,129,0.5,0,0,NULL),(1195,11,129,0.5,0,0,NULL),(1196,11,130,0.5,0,0,NULL),(1197,11,130,0.5,0,0,NULL),(1198,11,131,0.5,0,0,NULL),(1199,11,132,0.5,0,0,NULL),(1200,12,133,0.5,0,0,NULL),(1201,12,134,0.5,0,0,NULL),(1202,12,135,0.5,0,0,NULL),(1203,12,135,0.5,0,0,NULL),(1204,12,136,0.5,0,0,NULL),(1205,12,136,0.5,0,0,NULL),(1206,12,137,0.5,0,0,NULL),(1207,12,137,0.5,0,0,NULL),(1208,12,138,0.5,0,0,NULL),(1209,12,139,0.5,0,0,NULL),(1210,12,140,0.5,0,0,NULL),(1211,12,141,0.5,0,0,NULL),(1212,12,142,0.5,0,0,NULL),(1214,12,144,0.5,0,0,NULL),(1215,13,145,0.5,0,0,NULL),(1216,13,146,0.5,0,0,NULL),(1217,13,145,0.5,0,0,NULL),(1218,13,145,0.5,0,0,NULL),(1219,13,145,0.5,0,0,NULL),(1220,13,145,0.5,0,0,NULL),(1221,13,145,0.5,0,0,NULL),(1222,13,145,0.5,0,0,NULL),(1223,13,146,0.5,0,0,NULL),(1224,13,147,0.5,0,0,NULL),(1225,13,148,0.5,0,0,NULL),(1226,13,149,0.5,0,0,NULL),(1227,13,150,0.5,0,0,NULL),(1228,13,151,0.5,0,0,NULL),(1229,13,152,0.5,0,0,NULL),(1230,13,153,0.5,0,0,NULL),(1231,7,154,0.5,0,0,NULL),(1232,7,155,0.5,0,0,NULL),(1233,7,156,0.5,0,0,NULL),(1234,7,157,0.5,0,0,NULL),(1235,7,158,0.5,0,0,NULL),(1236,7,159,0.5,0,0,NULL),(1237,7,160,0.5,0,0,NULL),(1238,7,162,0.5,0,0,NULL),(1239,7,163,0.5,0,0,NULL),(1240,7,164,0.5,0,0,NULL),(1241,7,165,0.5,0,0,NULL),(1242,7,166,0.5,0,0,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=1109 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning_floatmodel`
--

LOCK TABLES `learning_floatmodel` WRITE;
/*!40000 ALTER TABLE `learning_floatmodel` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning_number`
--

LOCK TABLES `learning_number` WRITE;
/*!40000 ALTER TABLE `learning_number` DISABLE KEYS */;
/*!40000 ALTER TABLE `learning_number` ENABLE KEYS */;
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
INSERT INTO `learning_params` VALUES (51,5,'m','yard'),(53,5,'inch','cm'),(54,14,'EUR','HUF'),(55,3,'pint','dm**3'),(56,14,'EUR','CHF'),(57,14,'EUR','PLN'),(58,14,'CZK','EUR'),(59,9,'inn',NULL),(60,5,'m','km'),(61,3,'cup','dl'),(62,5,'inch','dm'),(63,10,'50','110'),(64,3,'dm**3','cup'),(65,4,'ft**2','dm**2'),(66,4,'km**2','mile**2'),(67,3,'dl','cup'),(68,5,'cm','inch'),(69,5,'m','ft'),(70,3,'yard**3','m**3'),(71,3,'dl','pint'),(72,6,'degC','kelvin'),(73,4,'mile**2','are'),(74,5,'ft','dm'),(75,14,'EUR','RUB'),(76,14,'EUR','USD'),(77,4,'are','acre'),(78,4,'are','mile**2'),(79,14,'CZK','RUB'),(80,6,'degF','degC'),(81,4,'m**2','yard**2'),(82,14,'CZK','PLN'),(83,3,'dm**3','pint'),(84,5,'dm','inch'),(85,3,'pint','dl'),(86,5,'ft','m'),(87,4,'m**2','ft**2'),(88,14,'CZK','GBP'),(89,3,'tbsp','dl'),(90,3,'dm**3','tbsp'),(91,9,'out',NULL),(92,3,'m**3','ft**3'),(93,3,'dl','tbsp'),(94,4,'ft**2','m**2'),(95,14,'EUR','CZK'),(96,4,'mile**2','km**2'),(97,6,'degC','degF'),(98,14,'CZK','USD'),(99,14,'EUR','GBP'),(100,3,'dm**3','inch**3'),(101,3,'quart','dm**3'),(102,6,'degF','kelvin'),(103,3,'dm**3','quart'),(104,5,'yard','m'),(105,6,'kelvin','degF'),(106,4,'dm**2','ft**2'),(107,3,'cup','dm**3'),(108,4,'yard**2','m**2'),(109,4,'acre','are'),(110,4,'acre','km**2'),(111,4,'cm**2','inch**2'),(112,6,'kelvin','degC'),(113,8,'-1',NULL),(114,14,'CZK','CHF'),(115,5,'km','mile'),(116,3,'m**3','yard**3'),(117,4,'inch**2','cm**2'),(118,14,'CZK','HUF'),(119,5,'dm','ft'),(120,3,'ft**3','m**3'),(121,11,'50',NULL),(122,11,'132',NULL),(123,11,'80',NULL),(124,11,'99',NULL),(125,11,'73',NULL),(126,11,'110',NULL),(127,11,'115',NULL),(128,11,'86',NULL),(129,11,'72',NULL),(130,11,'96',NULL),(131,11,'46',NULL),(132,11,'15',NULL),(133,12,'5','5'),(134,12,'7','5'),(135,12,'1','10'),(136,12,'11','3'),(137,12,'3','9'),(138,12,'3','1'),(139,12,'5','1'),(140,12,'5','2'),(141,12,'3','2'),(142,12,'3','0'),(144,12,'3','4'),(145,13,'2',NULL),(146,13,'3',NULL),(147,13,'4',NULL),(148,13,'5',NULL),(149,13,'6',NULL),(150,13,'7',NULL),(151,13,'8',NULL),(152,13,'9',NULL),(153,13,'10',NULL),(154,7,'45*5',NULL),(155,7,'5*3*4',NULL),(156,7,'(18-6)*2',NULL),(157,7,'789 + 75',NULL),(158,7,'2659-423',NULL),(159,7,'(236*2)-695',NULL),(160,7,'4*0.95',NULL),(162,7,'2*0.6+1.95',NULL),(163,7,'10*1.95*0.2',NULL),(164,7,'(1+6+2+8)*2-3-14',NULL),(165,7,'659-235+5*13',NULL),(166,7,'6*0.23',NULL);
/*!40000 ALTER TABLE `learning_params` ENABLE KEYS */;
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
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `learning_userskill_6340c63c` (`user_id`),
  KEY `learning_userskill_8a386586` (`concept_id`),
  CONSTRAINT `concept_id_refs_id_29dadd40f906e7ce` FOREIGN KEY (`concept_id`) REFERENCES `learning_params` (`id`),
  CONSTRAINT `user_id_refs_id_36ffc26e7528aad` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2464 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning_userskill`
--

LOCK TABLES `learning_userskill` WRITE;
/*!40000 ALTER TABLE `learning_userskill` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `south_migrationhistory`
--

LOCK TABLES `south_migrationhistory` WRITE;
/*!40000 ALTER TABLE `south_migrationhistory` DISABLE KEYS */;
INSERT INTO `south_migrationhistory` VALUES (1,'learning','0001_initial','2015-02-27 15:41:50'),(4,'learning','0003_auto__add_field_concept_params','2015-03-07 15:29:23'),(5,'learning','0004_auto__add_field_params_type','2015-03-07 15:30:15'),(6,'learning','0005_auto__add_field_params_p1','2015-03-07 15:30:58'),(7,'learning','0006_auto__add_field_params_p2','2015-03-07 15:31:17'),(8,'learning','0007_auto__del_field_params_param','2015-03-07 15:49:53'),(9,'learning','0008_auto__del_field_concept_param1','2015-03-07 15:51:00'),(10,'learning','0009_auto__del_field_concept_param2','2015-03-07 15:51:38'),(11,'learning','0010_auto__del_field_userskill_type__add_field_userskill_concept','2015-03-07 15:58:25'),(12,'learning','0011_auto__chg_field_userskill_concept','2015-03-07 15:59:33'),(13,'learning','0012_auto__add_field_concept_label','2015-03-07 16:22:30'),(14,'learning','0013_auto__add_field_userskill_number__add_field_userskill_date','2015-03-07 16:59:11'),(15,'learning','0014_auto__chg_field_params_p2','2015-03-09 18:41:04'),(16,'lazysignup','0001_initial','2015-03-11 20:25:48'),(17,'lazysignup','0002_auto__add_field_lazyuser_created','2015-03-11 20:25:49'),(18,'lazysignup','0003_auto','2015-03-11 22:38:20'),(19,'lazysignup','0004_initial','2015-03-11 22:48:26'),(20,'social_auth','0001_initial','2015-03-12 10:27:22'),(21,'social_auth','0002_auto__add_unique_nonce_timestamp_salt_server_url__add_unique_associati','2015-03-12 10:27:22'),(22,'social_auth','0003_initial','2015-03-12 10:29:21'),(23,'social_auth','0004_auto__chg_field_usersocialauth_uid__chg_field_nonce_server_url__chg_fi','2015-03-14 11:16:32'),(24,'social_auth','0005_auto__chg_field_usersocialauth_uid','2015-03-14 13:38:01'),(25,'social_auth','0006_auto__chg_field_nonce_server_url__chg_field_association_handle__chg_fi','2015-03-14 13:42:48'),(26,'social_auth','0007_initial','2015-03-14 13:47:04'),(27,'learning','0015_auto__add_field_concept_updatedTimes','2015-03-16 14:15:03'),(28,'learning','0016_auto__chg_field_floatmodel_date','2015-03-20 21:25:14'),(29,'learning','0017_auto__chg_field_floatmodel_date__chg_field_userskill_date','2015-03-20 22:34:11'),(30,'learning','0018_auto__add_currtable','2015-03-28 08:33:27'),(31,'learning','0019_auto__chg_field_concept_question','2015-03-29 12:37:42'),(32,'learning','0020_auto__chg_field_floatmodel_date__chg_field_userskill_date','2015-03-29 15:42:29'),(33,'learning','0021_auto__chg_field_floatmodel_date__chg_field_userskill_date','2015-03-29 16:02:04'),(34,'learning','0022_auto__add_field_concept_hint','2015-03-29 20:23:54'),(35,'learning','0023_auto__del_questions__add_number__chg_field_concept_question','2015-04-01 15:43:04'),(36,'learning','0023_auto__del_field_concept_question__add_field_concept_n','2015-04-01 15:45:36'),(37,'learning','0024_auto__del_field_concept_n__add_field_concept_question','2015-04-01 16:08:46');
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

-- Dump completed on 2015-04-01 18:14:28
