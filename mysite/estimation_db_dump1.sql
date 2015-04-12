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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add migration history',1,'add_migrationhistory'),(2,'Can change migration history',1,'change_migrationhistory'),(3,'Can delete migration history',1,'delete_migrationhistory'),(4,'Can add log entry',2,'add_logentry'),(5,'Can change log entry',2,'change_logentry'),(6,'Can delete log entry',2,'delete_logentry'),(7,'Can add permission',3,'add_permission'),(8,'Can change permission',3,'change_permission'),(9,'Can delete permission',3,'delete_permission'),(10,'Can add group',4,'add_group'),(11,'Can change group',4,'change_group'),(12,'Can delete group',4,'delete_group'),(13,'Can add user',5,'add_user'),(14,'Can change user',5,'change_user'),(15,'Can delete user',5,'delete_user'),(16,'Can add content type',6,'add_contenttype'),(17,'Can change content type',6,'change_contenttype'),(18,'Can delete content type',6,'delete_contenttype'),(19,'Can add session',7,'add_session'),(20,'Can change session',7,'change_session'),(21,'Can delete session',7,'delete_session'),(22,'Can add float model',8,'add_floatmodel'),(23,'Can change float model',8,'change_floatmodel'),(24,'Can delete float model',8,'delete_floatmodel'),(25,'Can add concept question',9,'add_conceptquestion'),(26,'Can change concept question',9,'change_conceptquestion'),(27,'Can delete concept question',9,'delete_conceptquestion'),(28,'Can add params',10,'add_params'),(29,'Can change params',10,'change_params'),(30,'Can delete params',10,'delete_params'),(31,'Can add number',11,'add_number'),(32,'Can change number',11,'change_number'),(33,'Can delete number',11,'delete_number'),(34,'Can add type',12,'add_type'),(35,'Can change type',12,'change_type'),(36,'Can delete type',12,'delete_type'),(37,'Can add user skill',13,'add_userskill'),(38,'Can change user skill',13,'change_userskill'),(39,'Can delete user skill',13,'delete_userskill'),(40,'Can add curr table',14,'add_currtable'),(41,'Can change curr table',14,'change_currtable'),(42,'Can delete curr table',14,'delete_currtable'),(43,'Can add concept',15,'add_concept'),(44,'Can change concept',15,'change_concept'),(45,'Can delete concept',15,'delete_concept'),(46,'Can add lazy user',16,'add_lazyuser'),(47,'Can change lazy user',16,'change_lazyuser'),(48,'Can delete lazy user',16,'delete_lazyuser'),(49,'Can add user social auth',17,'add_usersocialauth'),(50,'Can change user social auth',17,'change_usersocialauth'),(51,'Can delete user social auth',17,'delete_usersocialauth'),(52,'Can add nonce',18,'add_nonce'),(53,'Can change nonce',18,'change_nonce'),(54,'Can delete nonce',18,'delete_nonce'),(55,'Can add association',19,'add_association'),(56,'Can change association',19,'change_association'),(57,'Can delete association',19,'delete_association'),(58,'Can add hint',20,'add_hint'),(59,'Can change hint',20,'change_hint'),(60,'Can delete hint',20,'delete_hint');
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$12000$htOJcr0gZbVt$3zQYAGwXFT3nZ2JagqMimwJAwvwVbo6i64k8Ee6TNDQ=','2015-04-03 16:35:32',1,'roman','','','stone99@azet.sk',1,1,'2015-04-03 16:35:32'),(2,'!5mH5Usgh0uq1eK1A3BjT27OFfd2wjiindKQvtmff','2015-04-03 16:51:40',0,'24d4a40e4e6d4c37ac3d9df640cc27','','','',0,1,'2015-04-03 16:51:40'),(3,'!bqfyBGOFfJTjIsriuYiHJiM611N4gSPub6LclHPw','2015-04-04 17:25:29',0,'ca023992956d4007a3f09651864d3f','','','',0,1,'2015-04-04 17:25:29'),(4,'!wGPvOJYpr6EjWPUMEfAi9uSxYmeeRSnThvL9stmK','2015-04-04 17:56:22',0,'65a6289c7add4cb7b4ed0ce6af720f','','','',0,1,'2015-04-04 17:56:22'),(5,'!0odPgrpeLKtTElmdxw4UE0fXzYhL1G8EHx4pDduS','2015-04-04 18:58:44',0,'174bc4e4abbc46fb86965a547dc4e9','','','',0,1,'2015-04-04 18:58:44'),(6,'!vj4SwoApWivE72fr5lbtkXXQ4x8bPae6cZunBKZk','2015-04-04 19:07:47',0,'0db5ba5a7dd74339a3aa117d1296bb','','','',0,1,'2015-04-04 19:07:47'),(7,'!7kQ3G57dAUOWart2loM8lRBoH2cY47eC9RwrGz3j','2015-04-04 19:20:11',0,'e895e65c3caf4f699dcb5db53b37df','','','',0,1,'2015-04-04 19:20:11'),(8,'!h22jJ6bLXugIYUqI5d2TZZ05qHqxyUIYBRjRXd6H','2015-04-04 19:28:46',0,'a7aa7c6871b24d3c82d8ef600afc4f','','','',0,1,'2015-04-04 19:28:45'),(9,'!qaFEmTgBhxvtKTlUNKKzWr5GaXiUtNfWoLmJJn5E','2015-04-05 08:09:07',0,'1cda8f4ba33248c6bc1290c0fd51da','','','',0,1,'2015-04-05 08:09:07'),(10,'!Aev8PjsseWoXtNQbrtEAqYow0CKY8hXFhAf7Razh','2015-04-05 09:28:35',0,'romanorlicek','Roman','Orlíček','romanorlicek@gmail.com',0,1,'2015-04-05 09:24:02'),(11,'!37QkAgoTBqLnGb5HTXiobyEUZrTx6dNrdGDACiH2','2015-04-05 09:34:19',0,'02f3c3a1de5848ad86e66668c3f89e','','','',0,1,'2015-04-05 09:34:19'),(12,'!JTijlyqxk4o2Cg7idJ7PgReQZ7vh1AgJEJVgcd6N','2015-04-06 17:57:21',0,'fecc7997c543437487f45b2b75c7e1','','','',0,1,'2015-04-06 17:57:20'),(13,'!2ZFme4Z9iT13RvYxrOJ4PnZOi5ACLzIoHySMPzss','2015-04-07 10:16:49',0,'6ab886b5f26f4c42838a50b9e10371','','','',0,1,'2015-04-07 10:16:49'),(14,'!KxxblDBOzEafZAh6sEczMP6BStIGqm8WpGZTTocG','2015-04-08 08:06:49',0,'5077b6f66588435bb953783f86ecc3','','','',0,1,'2015-04-08 08:06:48'),(15,'!vReyqFr9x82b8ATvER1pyvHuQzp09Ui6yCdgF3wS','2015-04-09 11:07:53',0,'d545b4b7e65e4f0dbfe16850116ed5','','','',0,1,'2015-04-09 11:07:53'),(16,'!BhykvPigzR2D8AUqUhDkpGTF7Ja4dDrGcvcpo3GA','2015-04-11 09:18:36',0,'42be1fa82569417a8e50d1a18e19d1','','','',0,1,'2015-04-11 09:18:36'),(17,'!lgtG8tgJhMw1P16UMBuOBTIFQPQl0FLbGNqewVcW','2015-04-12 11:09:14',0,'8aed3eda7d4d455ea0dc6bf87a735b','','','',0,1,'2015-04-12 11:09:13'),(18,'!sFjmi1PT74DQoISg5Z2GKyBQ75a5IzUgOFKwlelb','2015-04-12 15:24:00',0,'c2c63b3325be46c8b782ab847254f1','','','',0,1,'2015-04-12 15:24:00');
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'migration history','south','migrationhistory'),(2,'log entry','admin','logentry'),(3,'permission','auth','permission'),(4,'group','auth','group'),(5,'user','auth','user'),(6,'content type','contenttypes','contenttype'),(7,'session','sessions','session'),(8,'float model','learning','floatmodel'),(9,'concept question','learning','conceptquestion'),(10,'params','learning','params'),(11,'number','learning','number'),(12,'type','learning','type'),(13,'user skill','learning','userskill'),(14,'curr table','learning','currtable'),(15,'concept','learning','concept'),(16,'lazy user','lazysignup','lazyuser'),(17,'user social auth','social_auth','usersocialauth'),(18,'nonce','social_auth','nonce'),(19,'association','social_auth','association'),(20,'hint','learning','hint');
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
INSERT INTO `django_session` VALUES ('4mxmsu5f6ah5208s8bow9pdhe7m6thcz','MGRjOWFiYWE2MGQ3ZTlkNzdkMGIzZGQ2ZGNkMTQxYjYwOWM2MzNkOTqAAn1xAShVAnAyTlUIc2V0UGFyYW1LAVUNX2F1dGhfdXNlcl9pZIoBDFUDcmV2iVUIcXVlc3Rpb25HQGIAAAAAAABVEl9hdXRoX3VzZXJfYmFja2VuZFUlbGF6eXNpZ251cC5iYWNrZW5kcy5MYXp5U2lnbnVwQmFja2VuZFUIcGllVGltZXJYDgAAADE0MjgzNDk0NDMuMTQ1VQdtZWRUaW1ligLBAFUCcDFYAgAAAC0xVQR0ZXN0WAQAAAB0aW1lVQl0aW1lUGFyYW1HQdVIuH9Ui0RVBHR5cGVYBAAAAHNxcnRVBXR5cGVzXXECWAQAAABzcXJ0cQNhdS4=','2015-04-20 19:44:04'),('67e3vnpwwoxb6lewcbs294kk7upl9hj5','ZTM5M2UwOTM3MzNkNjQxYWQyM2RlNzM4NTJhYmJjZjdhM2FjYWU0NDqAAn1xAS4=','2015-04-19 09:24:00'),('8n6xljvdc664lxxnsv0h77w08e6czaqe','ZWJiYjk4MzY4NzVmM2MwYjk2NTE5YTcwN2IwMjNjODk1OTQ5NWNlMjqAAn1xAShVHnNvY2lhbF9hdXRoX2xhc3RfbG9naW5fYmFja2VuZHECWA0AAABnb29nbGUtb2F1dGgycQNYDwAAAF9zZXNzaW9uX2V4cGlyeXEEY2RhdGV0aW1lCmRhdGV0aW1lCnEFVQoH3wQFChwdDiJ5Y2RqYW5nby51dGlscy50aW1lem9uZQpVVEMKcQYpUnEHhlJxCFUSX2F1dGhfdXNlcl9iYWNrZW5kcQlVL3NvY2lhbF9hdXRoLmJhY2tlbmRzLmdvb2dsZS5Hb29nbGVPQXV0aDJCYWNrZW5kcQpVDV9hdXRoX3VzZXJfaWRxC4oBCnUu','2015-04-05 10:28:29'),('bpf7obfonjd4j9zn7qv64xzqx5jg8v19','YjlmODZmY2E5Yjc2MDRiNTc0N2NhMDdmMjcxYTgxZTVkOWRlODA2MDqAAn1xAShVHnNvY2lhbF9hdXRoX2xhc3RfbG9naW5fYmFja2VuZHECWA0AAABnb29nbGUtb2F1dGgycQNYDwAAAF9zZXNzaW9uX2V4cGlyeXEEY2RhdGV0aW1lCmRhdGV0aW1lCnEFVQoH3wQFChwdC8iYY2RqYW5nby51dGlscy50aW1lem9uZQpVVEMKcQYpUnEHhlJxCFUSX2F1dGhfdXNlcl9iYWNrZW5kcQlVL3NvY2lhbF9hdXRoLmJhY2tlbmRzLmdvb2dsZS5Hb29nbGVPQXV0aDJCYWNrZW5kcQpVDV9hdXRoX3VzZXJfaWRxC4oBCnUu','2015-04-05 10:28:29'),('erbzfs6t1fbhsr9hm9hkzm55rjrni5py','M2Q3MDYxNzgyOGJlNDAyYjc5NDg0NzEwNWVlMWU4YjE2NjMwNmZlOTqAAn1xAShVAnAyTlUCcDFYAgAAAC0xVQ1fYXV0aF91c2VyX2lkigENVQNyZXaJVQRwcmVmTlUIcXVlc3Rpb25HQDkAAAAAAABVEl9hdXRoX3VzZXJfYmFja2VuZFUlbGF6eXNpZ251cC5iYWNrZW5kcy5MYXp5U2lnbnVwQmFja2VuZFUIcGllVGltZXJYDQAAADE0Mjg0MzcxNzEuMDhVB21lZFRpbWWKAQRVCHNldFBhcmFtSwBVBHRlc3RYBAAAAHRpbWVVCXRpbWVQYXJhbUdB1UkOLMUeuFUEdHlwZVgEAAAAc3FydFUPZGphbmdvX2xhbmd1YWdlWAIAAABza1UFdHlwZXNdcQJYBAAAAHNxcnRxA2FVBXByZWZwWAMAAABFVVJ1Lg==','2015-04-21 20:17:25'),('f5eem8h77ajy5ce274r9xe3e5rzp9pia','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Y05OTk6GhXFviU50gXFwdVUGdGFibGVzcXFdcXIoaGNoZGVVDHVzZWRfYWxpYXNlc3FzY19fYnVpbHRpbl9fCnNldApxdF2FUnF1VQhvcmRlcl9ieXF2XVUIZGlzdGluY3Rxd4lVCGdyb3VwX2J5cXhOVRFzZWxlY3RfZm9yX3VwZGF0ZXF5iVUOc2VsZWN0X3JlbGF0ZWRxeolVEGRlZmVycmVkX2xvYWRpbmdxe2h0XYVScXyIhlUJdGFibGVfbWFwcX19cX4oaGRdcX9oZGFoY11xgGhjYXVVE19leHRyYV9zZWxlY3RfY2FjaGVxgU5VCW1heF9kZXB0aHGCSwVVBnNlbGVjdHGDXVUOZXh0cmFfb3JkZXJfYnlxhClVD2Rpc3RpbmN0X2ZpZWxkc3GFXVUKYWdncmVnYXRlc3GGaF0pgXGHfXGIaGBdc2JVGV9sb2FkZWRfZmllbGRfbmFtZXNfY2FjaGVxiX1VEWV4dHJhX3NlbGVjdF9tYXNrcYpOVRhzZWxlY3RfZm9yX3VwZGF0ZV9ub3dhaXRxi4lVCGxvd19tYXJrcYxLAFUOYWxpYXNfcmVmY291bnRxjX1xjihoZEsAaGNLA3VVE3JlbGF0ZWRfc2VsZWN0X2NvbHNxj11VDGRlZmF1bHRfY29sc3GQiFUGaGF2aW5ncZFjZGphbmdvLmRiLm1vZGVscy5zcWwud2hlcmUKV2hlcmVOb2RlCnGSKYFxk31xlChVCWNvbm5lY3RvcnGVVQNBTkRxllUHbmVnYXRlZHGXiVUIY2hpbGRyZW5xmF11YlUZaW5jbHVkZWRfaW5oZXJpdGVkX21vZGVsc3GZfXGaTmhjc1UQZGVmYXVsdF9vcmRlcmluZ3GbiFULd2hlcmVfY2xhc3NxnGiSVQVtb2RlbHGdY2xlYXJuaW5nLm1vZGVscwpDb25jZXB0CnGeVRFzdGFuZGFyZF9vcmRlcmluZ3GfiFUFd2hlcmVxoGiSKYFxoX1xoiholVUCT1Jol4lomF1xoyhokimBcaR9caUoaJVolmiXiWiYXXGmKChjZGphbmdvLmRiLm1vZGVscy5zcWwud2hlcmUKQ29uc3RyYWludApxpymBcah9cakoVQVhbGlhc3GqaGNVA2NvbHGrVQJwMVUFZmllbGRxrGhsaA5oD2gUh1JxrXViVQVleGFjdHGuiFgDAAAARVVSca90cbAoaKcpgXGxfXGyKGiqaGNoq2hlaKxobGgeaB9YAgAAAGlkcbOHUnG0dWJorohLA3RxtWV1YmiSKYFxtn1xtyholWiWaJeJaJhdcbgoKGinKYFxuX1xuihoqmhjaKtVAnAyaKxobGgOaA9oE4dScbt1YmiuiGivdHG8KGinKYFxvX1xvihoqmhjaKtoZWisaLR1YmiuiEsDdHG/ZXViZXViVQloaWdoX21hcmtxwE5VEGZpbHRlcl9pc19zdGlja3lxwYl1YmidaJ5VGV9wcmVmZXRjaF9yZWxhdGVkX2xvb2t1cHNxwl1xw3ViVQNyZXaJVRJfYXV0aF91c2VyX2JhY2tlbmRVJWxhenlzaWdudXAuYmFja2VuZHMuTGF6eVNpZ251cEJhY2tlbmRVCHBpZVRpbWVyWA4AAAAxNDI4MTQ2Njc0LjEwNlUEdGVzdFgDAAAAc2V0VQR0eXBlWAQAAABjdXJyVQl0ZXN0UGFyYW1LAlUFcHJlZnBor3Uu','2015-04-18 11:34:42'),('g7kzlwdgnwo7kulr1qt428t7uxk38e87','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Tk5OToaFcXCJTnSBcXF1VQZ0YWJsZXNxcl1xcyhoZGhlZVUMdXNlZF9hbGlhc2VzcXRjX19idWlsdGluX18Kc2V0CnF1XYVScXZVCG9yZGVyX2J5cXddVQhkaXN0aW5jdHF4iVUIZ3JvdXBfYnlxeU5VEXNlbGVjdF9mb3JfdXBkYXRlcXqJVQ5zZWxlY3RfcmVsYXRlZHF7iVUQZGVmZXJyZWRfbG9hZGluZ3F8aHVdhVJxfYiGVQl0YWJsZV9tYXBxfn1xfyhoZV1xgGhlYWhkXXGBaGRhdVUTX2V4dHJhX3NlbGVjdF9jYWNoZXGCTlUJbWF4X2RlcHRocYNLBVUGc2VsZWN0cYRdVQ5leHRyYV9vcmRlcl9ieXGFKVUPZGlzdGluY3RfZmllbGRzcYZdVQphZ2dyZWdhdGVzcYdoXimBcYh9cYloYV1zYlUZX2xvYWRlZF9maWVsZF9uYW1lc19jYWNoZXGKfVURZXh0cmFfc2VsZWN0X21hc2txi05VGHNlbGVjdF9mb3JfdXBkYXRlX25vd2FpdHGMiVUIbG93X21hcmtxjUsAVQ5hbGlhc19yZWZjb3VudHGOfXGPKGhlSwBoZEsDdVUTcmVsYXRlZF9zZWxlY3RfY29sc3GQXVUMZGVmYXVsdF9jb2xzcZGIVQZoYXZpbmdxkmNkamFuZ28uZGIubW9kZWxzLnNxbC53aGVyZQpXaGVyZU5vZGUKcZMpgXGUfXGVKFUJY29ubmVjdG9ycZZVA0FORHGXVQduZWdhdGVkcZiJVQhjaGlsZHJlbnGZXXViVRlpbmNsdWRlZF9pbmhlcml0ZWRfbW9kZWxzcZp9cZtOaGRzVRBkZWZhdWx0X29yZGVyaW5ncZyIVQt3aGVyZV9jbGFzc3GdaJNVBW1vZGVscZ5jbGVhcm5pbmcubW9kZWxzCkNvbmNlcHQKcZ9VEXN0YW5kYXJkX29yZGVyaW5ncaCIVQV3aGVyZXGhaJMpgXGifXGjKGiWVQJPUmiYiWiZXXGkKGiTKYFxpX1xpiholmiXaJiJaJldcacoKGNkamFuZ28uZGIubW9kZWxzLnNxbC53aGVyZQpDb25zdHJhaW50CnGoKYFxqX1xqihVBWFsaWFzcatoZFUDY29scaxVAnAxVQVmaWVsZHGtaG1oD2gQaBWHUnGudWJVBWV4YWN0ca+IaAJ0cbAoaKgpgXGxfXGyKGiraGRorGhmaK1obWgfaCBYAgAAAGlkcbOHUnG0dWJor4hLA3RxtWV1YmiTKYFxtn1xtyholmiXaJiJaJldcbgoKGioKYFxuX1xuihoq2hkaKxVAnAyaK1obWgPaBBoFIdScbt1YmiviGgCdHG8KGioKYFxvX1xvihoq2hkaKxoZmitaLR1YmiviEsDdHG/ZXViZXViVQloaWdoX21hcmtxwE5VEGZpbHRlcl9pc19zdGlja3lxwYl1YmieaJ9VGV9wcmVmZXRjaF9yZWxhdGVkX2xvb2t1cHNxwl1xw3ViVRJfYXV0aF91c2VyX2JhY2tlbmRVJWxhenlzaWdudXAuYmFja2VuZHMuTGF6eVNpZ251cEJhY2tlbmRVDV9hdXRoX3VzZXJfaWSKAQh1Lg==','2015-04-18 21:35:37'),('hxnmx0e52xzrww39g29ury8a1ksk1xej','MjY5MjA5NzZiNDM0YzAyODhlZjYzYTVhNTlhNjQ5NTUzN2I4YzE3NjqAAn1xAShVDV9hdXRoX3VzZXJfaWSKAQVVBHByZWZOVQNyZXaJVRJfYXV0aF91c2VyX2JhY2tlbmRVJWxhenlzaWdudXAuYmFja2VuZHMuTGF6eVNpZ251cEJhY2tlbmRVCHBpZVRpbWVyWA4AAAAxNDI4MTc0MjY1LjY0MVUFdHlwZXNdcQJYBAAAAHNxcnRxA2FVBHRlc3RYAwAAAHNldFUEdHlwZVgEAAAAc3FydFUJdGVzdFBhcmFtSwJVBXByZWZwWAMAAABFVVJ1Lg==','2015-04-18 19:07:11'),('k516h3j0213gpg2gf0967rrorwe2w752','NjE4NjhiMjVmMzU1MTNmNTEwMzMwMjE0MDRkMDIxOTVkNmIzMTBjZTqAAn1xAShVAnAyTlUIc2V0UGFyYW1LB1UNX2F1dGhfdXNlcl9pZIoBEFUDcmV2iVUIcXVlc3Rpb25HQFhAAAAAAABVEl9hdXRoX3VzZXJfYmFja2VuZFUlbGF6eXNpZ251cC5iYWNrZW5kcy5MYXp5U2lnbnVwQmFja2VuZFUIcGllVGltZXJxAlgOAAAAMTQyODc1OTkxMS41NThxA1UHbWVkVGltZYoBA1UCcDFYAgAAAC0xVQR0ZXN0WAMAAABzZXRVBHR5cGVYBAAAAHNxcnRVD2RqYW5nb19sYW5ndWFnZVgCAAAAc2tVBXR5cGVzXXEEWAQAAABzcXJ0cQVhdS4=','2015-04-25 13:45:11'),('rwlgmlevkktdozjcsfxbi09rubfq24n1','ZTM5M2UwOTM3MzNkNjQxYWQyM2RlNzM4NTJhYmJjZjdhM2FjYWU0NDqAAn1xAS4=','2015-04-19 09:28:23'),('tp7hvhy2cfwzgvin14lhpaa0dpmxo6f7','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VQpJTk5FUiBKT0lOcW9oZ2hqiWNkamFuZ28uZGIubW9kZWxzLmZpZWxkcwpfbG9hZF9maWVsZApxcGgSaBNoJodScXF0gXFyaGdobihoZ2hnTk5OToaFcXOJTnSBcXR1VQZ0YWJsZXNxdV1xdihoZ2hoZVUMdXNlZF9hbGlhc2VzcXdjX19idWlsdGluX18Kc2V0CnF4XYVScXlVCG9yZGVyX2J5cXpdVQhkaXN0aW5jdHF7iVUIZ3JvdXBfYnlxfE5VEXNlbGVjdF9mb3JfdXBkYXRlcX2JVQ5zZWxlY3RfcmVsYXRlZHF+iVUQZGVmZXJyZWRfbG9hZGluZ3F/aHhdhVJxgIiGVQl0YWJsZV9tYXBxgX1xgihoaF1xg2hoYWhnXXGEaGdhdVUTX2V4dHJhX3NlbGVjdF9jYWNoZXGFTlUJbWF4X2RlcHRocYZLBVUGc2VsZWN0cYddVQ5leHRyYV9vcmRlcl9ieXGIKVUPZGlzdGluY3RfZmllbGRzcYldVQphZ2dyZWdhdGVzcYpoYSmBcYt9cYxoZF1zYlUZX2xvYWRlZF9maWVsZF9uYW1lc19jYWNoZXGNfVURZXh0cmFfc2VsZWN0X21hc2txjk5VGHNlbGVjdF9mb3JfdXBkYXRlX25vd2FpdHGPiVUIbG93X21hcmtxkEsAVQ5hbGlhc19yZWZjb3VudHGRfXGSKGhoSwBoZ0sDdVUTcmVsYXRlZF9zZWxlY3RfY29sc3GTXVUMZGVmYXVsdF9jb2xzcZSIVQZoYXZpbmdxlWNkamFuZ28uZGIubW9kZWxzLnNxbC53aGVyZQpXaGVyZU5vZGUKcZYpgXGXfXGYKFUJY29ubmVjdG9ycZlVA0FORHGaVQduZWdhdGVkcZuJVQhjaGlsZHJlbnGcXXViVRlpbmNsdWRlZF9pbmhlcml0ZWRfbW9kZWxzcZ19cZ5OaGdzVRBkZWZhdWx0X29yZGVyaW5ncZ+IVQt3aGVyZV9jbGFzc3GgaJZVBW1vZGVscaFjbGVhcm5pbmcubW9kZWxzCkNvbmNlcHQKcaJVEXN0YW5kYXJkX29yZGVyaW5ncaOIVQV3aGVyZXGkaJYpgXGlfXGmKGiZVQJPUmibiWicXXGnKGiWKYFxqH1xqShomWiaaJuJaJxdcaooKGNkamFuZ28uZGIubW9kZWxzLnNxbC53aGVyZQpDb25zdHJhaW50CnGrKYFxrH1xrShVBWFsaWFzca5oZ1UDY29sca9oA1UFZmllbGRxsGhwaBJoE2gYh1JxsXViVQVleGFjdHGyiFgDAAAARVVScbN0cbQoaKspgXG1fXG2KGiuaGdor2hpaLBocGgiaCNYAgAAAGlkcbeHUnG4dWJosohLA3RxuWV1YmiWKYFxun1xuyhomWiaaJuJaJxdcbwoKGirKYFxvX1xvihormhnaK9oAmiwaHBoEmgTaBeHUnG/dWJosohos3RxwChoqymBccF9ccIoaK5oZ2ivaGlosGi4dWJosohLA3Rxw2V1YmV1YlUJaGlnaF9tYXJrccROVRBmaWx0ZXJfaXNfc3RpY2t5ccWJdWJooWiiVRlfcHJlZmV0Y2hfcmVsYXRlZF9sb29rdXBzccZdccd1YlUDcmV2iVUSX2F1dGhfdXNlcl9iYWNrZW5kVSVsYXp5c2lnbnVwLmJhY2tlbmRzLkxhenlTaWdudXBCYWNrZW5kVQVwcmVmcGizVQdtZWRUaW1lSw9VCHNldFBhcmFtSwBVBHRlc3RYBAAAAHRpbWVVCXRpbWVQYXJhbXHIR0HVSGtfQtDlVQR0eXBlWAQAAABjdXJyVQl0ZXN0UGFyYW1HQdVIXTyJ64V1Lg==','2015-04-19 21:47:41'),('uebgo9wcq1h59gcbtxpxvlnnrxw4mbz4','YzFjZTEzMDQ4MTNkYmYyZjM5ZmMxZmYxYTE5MGJlYTZmOGRkMGQ3MDqAAn1xAShVAnAyWBAAAAB7InQiOiJjIiwiciI6MjV9VQJwMVgQAAAAeyJ0IjoiYyIsInIiOjUwfVUNX2F1dGhfdXNlcl9pZIoBEVUIcXVlc3Rpb25Hv/AAAAAAAABVBHByZWZOVQNyZXaJVRJfYXV0aF91c2VyX2JhY2tlbmRVJWxhenlzaWdudXAuYmFja2VuZHMuTGF6eVNpZ251cEJhY2tlbmRVCHBpZVRpbWVycQJYDgAAADE0Mjg4MzgwNDIuNjAycQNVB21lZFRpbWVLD1UIc2V0UGFyYW1LAVUEdGVzdFgDAAAAc2V0VQR0eXBlWAcAAABvYmpzVm9sVQV0eXBlc11xBFgHAAAAb2Jqc1ZvbHEFYXUu','2015-04-26 11:27:22'),('uwm5derrlgd4tunmpjl9meefu9fqlv1x','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Y05OTk6GhXFviU50gXFwdVUGdGFibGVzcXFdcXIoaGNoZGVVDHVzZWRfYWxpYXNlc3FzY19fYnVpbHRpbl9fCnNldApxdF2FUnF1VQhvcmRlcl9ieXF2XVUIZGlzdGluY3Rxd4lVCGdyb3VwX2J5cXhOVRFzZWxlY3RfZm9yX3VwZGF0ZXF5iVUOc2VsZWN0X3JlbGF0ZWRxeolVEGRlZmVycmVkX2xvYWRpbmdxe2h0XYVScXyIhlUJdGFibGVfbWFwcX19cX4oaGRdcX9oZGFoY11xgGhjYXVVE19leHRyYV9zZWxlY3RfY2FjaGVxgU5VCW1heF9kZXB0aHGCSwVVBnNlbGVjdHGDXVUOZXh0cmFfb3JkZXJfYnlxhClVD2Rpc3RpbmN0X2ZpZWxkc3GFXVUKYWdncmVnYXRlc3GGaF0pgXGHfXGIaGBdc2JVGV9sb2FkZWRfZmllbGRfbmFtZXNfY2FjaGVxiX1VEWV4dHJhX3NlbGVjdF9tYXNrcYpOVRhzZWxlY3RfZm9yX3VwZGF0ZV9ub3dhaXRxi4lVCGxvd19tYXJrcYxLAFUOYWxpYXNfcmVmY291bnRxjX1xjihoZEsAaGNLA3VVE3JlbGF0ZWRfc2VsZWN0X2NvbHNxj11VDGRlZmF1bHRfY29sc3GQiFUGaGF2aW5ncZFjZGphbmdvLmRiLm1vZGVscy5zcWwud2hlcmUKV2hlcmVOb2RlCnGSKYFxk31xlChVCWNvbm5lY3RvcnGVVQNBTkRxllUHbmVnYXRlZHGXiVUIY2hpbGRyZW5xmF11YlUZaW5jbHVkZWRfaW5oZXJpdGVkX21vZGVsc3GZfXGaTmhjc1UQZGVmYXVsdF9vcmRlcmluZ3GbiFULd2hlcmVfY2xhc3NxnGiSVQVtb2RlbHGdY2xlYXJuaW5nLm1vZGVscwpDb25jZXB0CnGeVRFzdGFuZGFyZF9vcmRlcmluZ3GfiFUFd2hlcmVxoGiSKYFxoX1xoiholVUCT1Jol4lomF1xoyhokimBcaR9caUoaJVolmiXiWiYXXGmKChjZGphbmdvLmRiLm1vZGVscy5zcWwud2hlcmUKQ29uc3RyYWludApxpymBcah9cakoVQVhbGlhc3GqaGNVA2NvbHGrVQJwMVUFZmllbGRxrGhsaA5oD2gUh1JxrXViVQVleGFjdHGuiFgDAAAARVVSca90cbAoaKcpgXGxfXGyKGiqaGNoq2hlaKxobGgeaB9YAgAAAGlkcbOHUnG0dWJorohLA3RxtWV1YmiSKYFxtn1xtyholWiWaJeJaJhdcbgoKGinKYFxuX1xuihoqmhjaKtVAnAyaKxobGgOaA9oE4dScbt1YmiuiGivdHG8KGinKYFxvX1xvihoqmhjaKtoZWisaLR1YmiuiEsDdHG/ZXViZXViVQloaWdoX21hcmtxwE5VEGZpbHRlcl9pc19zdGlja3lxwYl1YmidaJ5VGV9wcmVmZXRjaF9yZWxhdGVkX2xvb2t1cHNxwl1xw3ViVQNyZXaJVRJfYXV0aF91c2VyX2JhY2tlbmRVJWxhenlzaWdudXAuYmFja2VuZHMuTGF6eVNpZ251cEJhY2tlbmRVCHBpZVRpbWVyWA4AAAAxNDI4MTY4MzMxLjQ0M1UEdGVzdFgDAAAAc2V0VQR0eXBlWAQAAABjdXJyVQl0ZXN0UGFyYW1LAlUFcHJlZnBor3Uu','2015-04-18 17:55:34'),('vqvvspbxrsadnppuow7dy68c2y094ihe','MzJkZmRlZmRlNzIzNTA3MGIxMTY2YjQ4ODBhNGM4OTVhMmIwOGQ3OTqAAn1xAShVBXByZWZwWAMAAABFVVJVEl9hdXRoX3VzZXJfYmFja2VuZFUlbGF6eXNpZ251cC5iYWNrZW5kcy5MYXp5U2lnbnVwQmFja2VuZFUNX2F1dGhfdXNlcl9pZIoBElUPZGphbmdvX2xhbmd1YWdlWAIAAABza3Uu','2015-04-26 18:57:01'),('wpu4mpakny6a2jyohr4th8t7tkjlwhqx','MjhjZWM1ZWE0NjVkMWY0NTdlY2Y3NjE0YjY4NDgwM2NiYjU0MTNkMDqAAn1xAShVDV9hdXRoX3VzZXJfaWSKAQ5VEl9hdXRoX3VzZXJfYmFja2VuZFUlbGF6eXNpZ251cC5iYWNrZW5kcy5MYXp5U2lnbnVwQmFja2VuZFUFcHJlZnBYAwAAAEVVUlUPZGphbmdvX2xhbmd1YWdlWAIAAABza3Uu','2015-04-22 20:21:42'),('wx1u86khuorokzr27ezonu0f2jfd2a1b','NDNlM2Y4ZmM2YzJlNGZiYTgyNDk1OTExNDg1OGVkN2ViNTQxMjUxMTqAAn1xAShVDV9hdXRoX3VzZXJfaWSKAQZVEl9hdXRoX3VzZXJfYmFja2VuZFUlbGF6eXNpZ251cC5iYWNrZW5kcy5MYXp5U2lnbnVwQmFja2VuZFUFcHJlZnBYAwAAAEVVUnUu','2015-04-18 19:10:12'),('yne99k0bzszomiz5mfx5v1slr77mztyb','MGY2YTVmMjc0M2ZjZDI1N2Q5ZGQzNWVkMDM2ZTRiMzc4OTBjZjBmMDqAAn1xAShVBXByZWZwWAMAAABFVVJVEl9hdXRoX3VzZXJfYmFja2VuZFUlbGF6eXNpZ251cC5iYWNrZW5kcy5MYXp5U2lnbnVwQmFja2VuZFUNX2F1dGhfdXNlcl9pZIoBD1UPZGphbmdvX2xhbmd1YWdlWAIAAABjc3Uu','2015-04-23 16:36:58'),('yzd0zi2ceotmb05i0rb5q0wom0ytcb5e','NDBkYzdjOGI3NDAyYjVhZmNjMWIwYjEwYWQzMzBiOGI4ZGFjYzUxYjqAAn1xAShVBXByZWZwWAMAAABFVVJVDV9hdXRoX3VzZXJfaWSKAQdVEl9hdXRoX3VzZXJfYmFja2VuZFUlbGF6eXNpZ251cC5iYWNrZW5kcy5MYXp5U2lnbnVwQmFja2VuZFUPZGphbmdvX2xhbmd1YWdlWAIAAABza3Uu','2015-04-22 08:17:46'),('z2e5kfoj3bw8lwe2dwvkgraaurswk5ir','OGFiNDE5YjY5NGIxMjQxNDZkOTM4MmRjNGZkMTY5YWYzODM5ZjdiNTqAAn1xAShVDV9hdXRoX3VzZXJfaWSKAQRVBHByZWZdcQJjZGphbmdvLmRiLm1vZGVscy5iYXNlCm1vZGVsX3VucGlja2xlCnEDWAgAAABsZWFybmluZ3EEVQdDb25jZXB0cQWGXWNkamFuZ28uZGIubW9kZWxzLmJhc2UKc2ltcGxlX2NsYXNzX2ZhY3RvcnkKcQaHUnEHfXEIKFUCcDJxCVgDAAAAUExOVQJwMXEKWAMAAABDWktVB3R5cGVfaWRxC4oBA1UGX3N0YXRlcQxjZGphbmdvLmRiLm1vZGVscy5iYXNlCk1vZGVsU3RhdGUKcQ0pgXEOfXEPKFUGYWRkaW5ncRCJVQJkYnERVQdkZWZhdWx0cRJ1YlULX3R5cGVfY2FjaGVxE2gDWAgAAABsZWFybmluZ3EUVQRUeXBlcRWGXWgGh1JxFn1xFyhVBHR5cGVxGFgEAAAAY3VycmgMaA0pgXEZfXEaKGgQiWgRaBJ1YlUCaWRxG4oBA3ViaBuKAR91YmFVA3JldolVEl9hdXRoX3VzZXJfYmFja2VuZFUlbGF6eXNpZ251cC5iYWNrZW5kcy5MYXp5U2lnbnVwQmFja2VuZFUIcGllVGltZXJYDgAAADE0MjgxNzM4NTguOTM2VQR0ZXN0WAMAAABzZXRVBHR5cGVYBAAAAGN1cnJVCXRlc3RQYXJhbUsCVQVwcmVmcFgDAAAARVVSdS4=','2015-04-18 18:58:08');
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
  `created` datetime NOT NULL DEFAULT '2015-04-03 16:36:14',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `lazysignup_lazyuser_63b5ea41` (`created`),
  CONSTRAINT `user_id_refs_id_4f30feac7e9c929` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lazysignup_lazyuser`
--

LOCK TABLES `lazysignup_lazyuser` WRITE;
/*!40000 ALTER TABLE `lazysignup_lazyuser` DISABLE KEYS */;
INSERT INTO `lazysignup_lazyuser` VALUES (1,2,'2015-04-03 16:51:40'),(2,3,'2015-04-04 17:25:29'),(3,4,'2015-04-04 17:56:22'),(4,5,'2015-04-04 18:58:44'),(5,6,'2015-04-04 19:07:47'),(6,7,'2015-04-04 19:20:11'),(7,8,'2015-04-04 19:28:45'),(8,9,'2015-04-05 08:09:07'),(9,11,'2015-04-05 09:34:19'),(10,12,'2015-04-06 17:57:20'),(11,13,'2015-04-07 10:16:49'),(12,14,'2015-04-08 08:06:48'),(13,15,'2015-04-09 11:07:53'),(14,16,'2015-04-11 09:18:36'),(15,17,'2015-04-12 11:09:14'),(16,18,'2015-04-12 15:24:00');
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
  `p1` varchar(20) NOT NULL,
  `p2` varchar(20) DEFAULT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `learning_concept_403d8ff3` (`type_id`),
  CONSTRAINT `type_id_refs_id_79be5b42010a9228` FOREIGN KEY (`type_id`) REFERENCES `learning_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning_concept`
--

LOCK TABLES `learning_concept` WRITE;
/*!40000 ALTER TABLE `learning_concept` DISABLE KEYS */;
INSERT INTO `learning_concept` VALUES (1,'m','yard',6),(2,'inch','cm',6),(3,'EUR','HUF',3),(4,'pint','dm**3',13),(5,'EUR','CHF',3),(6,'EUR','PLN',3),(7,'CZK','EUR',3),(8,'inn',NULL,1),(9,'m','km',6),(10,'cup','dl',13),(11,'inch','dm',6),(12,'50','110',14),(13,'dm**3','cup',13),(14,'ft**2','dm**2',11),(15,'km**2','mile**2',11),(18,'m','ft',6),(19,'yard**3','m**3',13),(20,'dl','pint',13),(21,'degC','kelvin',12),(22,'mile**2','are',11),(23,'ft','dm',6),(24,'EUR','RUB',3),(25,'EUR','USD',3),(26,'are','acre',11),(28,'CZK','RUB',3),(29,'degF','degC',12),(30,'m**2','yard**2',11),(31,'CZK','PLN',3),(36,'m**2','ft**2',11),(37,'CZK','GBP',3),(38,'tbsp','dl',13),(39,'dm**3','tbsp',13),(40,'out',NULL,1),(41,'m**3','ft**3',13),(47,'CZK','USD',3),(48,'EUR','GBP',3),(49,'dm**3','inch**3',13),(50,'quart','dm**3',13),(51,'degF','kelvin',12),(59,'acre','km**2',11),(60,'cm**2','inch**2',11),(62,'-1',NULL,10),(63,'CZK','CHF',3),(64,'km','mile',6),(67,'CZK','HUF',3),(70,'50',NULL,7),(71,'132',NULL,7),(72,'80',NULL,7),(73,'99',NULL,7),(74,'73',NULL,7),(75,'110',NULL,7),(76,'115',NULL,7),(77,'86',NULL,7),(78,'72',NULL,7),(79,'96',NULL,7),(80,'46',NULL,7),(81,'15',NULL,7),(82,'5','5',8),(83,'7','5',8),(84,'1','10',8),(85,'11','3',8),(86,'3','9',8),(87,'3','1',8),(88,'5','1',8),(89,'5','2',8),(90,'3','2',8),(91,'3','0',8),(92,'3','4',8),(93,'2',NULL,9),(94,'3',NULL,9),(95,'4',NULL,9),(96,'5',NULL,9),(97,'6',NULL,9),(98,'7',NULL,9),(99,'8',NULL,9),(100,'9',NULL,9),(101,'10',NULL,9),(102,'45*5',NULL,5),(103,'5*3*4',NULL,5),(104,'(18-6)*2',NULL,5),(105,'789 + 75',NULL,5),(106,'2659-423',NULL,5),(107,'(236*2)-695',NULL,5),(108,'4*0.95',NULL,5),(109,'2*0.6+1.95',NULL,5),(110,'10*1.95*0.2',NULL,5),(111,'(1+6+2+8)*2-3-14',NULL,5),(112,'659-235+5*13',NULL,5),(113,'6*0.23',NULL,5),(114,'{\"t\":\"c\",\"r\":50}','{\"t\":\"c\",\"r\":25}',15),(115,'{\"t\":\"c\",\"r\":48}','{\"t\":\"c\",\"r\":35}',15),(116,'{\"t\":\"c\",\"r\":48}','{\"t\":\"c\",\"r\":30}',15),(117,'{\"t\":\"c\",\"r\":55}','{\"t\":\"c\",\"r\":30}',15),(118,'{\"t\":\"c\",\"r\":60}','{\"t\":\"c\",\"r\":40}',15),(119,'{\"t\":\"c\",\"r\":51}','{\"t\":\"c\",\"r\":40}',15),(120,'{\"t\":\"c\",\"r\":51}','{\"t\":\"c\",\"r\":25}',15),(121,'{\"t\":\"c\",\"r\":53}','{\"t\":\"c\",\"r\":25}',15),(122,'{\"t\":\"c\",\"r\":53}','{\"t\":\"c\",\"r\":38}',15),(123,'{\"t\":\"c\",\"r\":35}','{\"t\":\"c\",\"r\":12}',15),(124,'{\"t\":\"c\",\"r\":59}','{\"t\":\"c\",\"r\":16}',15),(125,'{\"t\":\"c\",\"r\":59}','{\"t\":\"c\",\"r\":19}',15),(126,'{\"t\":\"c\",\"r\":65}','{\"t\":\"c\",\"r\":63}',15),(127,'{\"t\":\"c\",\"r\":60}','{\"t\":\"c\",\"r\":26}',15),(128,'{\"t\":\"c\",\"r\":60}','{\"t\":\"c\",\"r\":48}',15);
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
  `params_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `label` double DEFAULT NULL,
  `updatedTimes` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `learning_conceptquestion_d4e7917a` (`number_id`),
  KEY `learning_conceptquestion_45bd63ef` (`params_id`),
  KEY `learning_conceptquestion_403d8ff3` (`type_id`),
  CONSTRAINT `number_id_refs_id_509a882a12243941` FOREIGN KEY (`number_id`) REFERENCES `learning_number` (`id`),
  CONSTRAINT `params_id_refs_id_5032227e7bd51318` FOREIGN KEY (`params_id`) REFERENCES `learning_params` (`id`),
  CONSTRAINT `type_id_refs_id_76989ce4f99989e8` FOREIGN KEY (`type_id`) REFERENCES `learning_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1163 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning_conceptquestion`
--

LOCK TABLES `learning_conceptquestion` WRITE;
/*!40000 ALTER TABLE `learning_conceptquestion` DISABLE KEYS */;
INSERT INTO `learning_conceptquestion` VALUES (1,423,56,3,0.5,0),(2,437,56,3,0.5,0),(3,447,56,3,0.5,0),(4,455,56,3,0.5,0),(5,458,56,3,0.5,0),(6,459,56,3,0.5,0),(7,464,56,3,0.5,0),(8,465,56,3,0.5,0),(9,466,56,3,0.5,0),(10,470,56,3,0.5,0),(11,471,56,3,0.5,0),(12,473,56,3,0.5,0),(13,476,56,3,0.5,0),(14,478,56,3,0.5,0),(15,480,56,3,0.5,0),(16,483,56,3,0.5,0),(17,484,56,3,0.5,0),(18,486,56,3,0.5,0),(19,488,56,3,0.5,0),(20,490,56,3,0.5,0),(21,493,56,3,0.5,0),(22,494,56,3,0.5,0),(23,496,56,3,0.5,0),(24,497,56,3,0.5,0),(25,498,56,3,0.5,0),(26,500,56,3,0.5,0),(27,501,56,3,0.5,0),(28,502,56,3,0.5,0),(29,504,56,3,0.5,0),(30,505,56,3,0.5,0),(31,506,56,3,0.5,0),(32,507,56,3,0.5,0),(33,509,56,3,0.5,0),(34,510,56,3,0.5,0),(35,511,56,3,0.5,0),(36,423,46,3,0.5,0),(37,437,46,3,0.5,0),(38,447,46,3,0.776699029126214,1),(39,455,46,3,0.5,0),(40,458,46,3,0.832177531206657,1),(41,459,46,3,0.5,0),(42,464,46,3,0.5,0),(43,465,46,3,0.5,0),(44,466,46,3,0.5,0),(45,470,46,3,0.5,0),(46,471,46,3,0.5,0),(47,473,46,3,0.5,0),(48,476,46,3,0.5,0),(49,478,46,3,0.5,0),(50,480,46,3,1.07848604043122,2),(51,483,46,3,0.5,0),(52,484,46,3,0.5,0),(53,486,46,3,0.5,0),(54,488,46,3,0.5,0),(55,490,46,3,0.5,0),(56,493,46,3,0.5,0),(57,494,46,3,0.5,0),(58,496,46,3,0.5,0),(59,497,46,3,0.5,0),(60,498,46,3,0.5,0),(61,500,46,3,0.5,0),(62,501,46,3,0.5,0),(63,502,46,3,0.5,0),(64,504,46,3,0.5,0),(65,505,46,3,0.969562376796063,1),(66,506,46,3,0.5,0),(67,507,46,3,0.776699029126214,1),(68,509,46,3,0.5,0),(69,510,46,3,0.5,0),(70,511,46,3,0.776699029126214,1),(71,423,69,3,0.5,0),(72,437,69,3,0.5,0),(73,447,69,3,0.5,0),(74,455,69,3,0.951456310679612,1),(75,458,69,3,0.5,0),(76,459,69,3,0.5,0),(77,464,69,3,0.5,0),(78,465,69,3,0.5,0),(79,466,69,3,0.5,0),(80,470,69,3,0.5,0),(81,471,69,3,0.5,0),(82,473,69,3,0.5,0),(83,476,69,3,0.5,0),(84,478,69,3,0.5,0),(85,480,69,3,0.5,0),(86,483,69,3,0.5,0),(87,484,69,3,0.5,0),(88,486,69,3,0.5,0),(89,488,69,3,0.5,0),(90,490,69,3,0.5,0),(91,493,69,3,0.5,0),(92,494,69,3,0.5,0),(93,496,69,3,0.5,0),(94,497,69,3,0.5,0),(95,498,69,3,0.5,0),(96,500,69,3,0.5,0),(97,501,69,3,0.5,0),(98,502,69,3,0.5,0),(99,504,69,3,0.5,0),(100,505,69,3,0.5,0),(101,506,69,3,0.5,0),(102,507,69,3,0.5,0),(103,509,69,3,0.5,0),(104,510,69,3,0.776699029126214,1),(105,511,69,3,0.776699029126214,1),(106,423,67,3,0.5,0),(107,437,67,3,0.5,0),(108,447,67,3,0.5,0),(109,455,67,3,0.5,0),(110,458,67,3,0.5,0),(111,459,67,3,0.5,0),(112,464,67,3,0.5,0),(113,465,67,3,0.5,0),(114,466,67,3,0.5,0),(115,470,67,3,0.5,0),(116,471,67,3,0.5,0),(117,473,67,3,0.5,0),(118,476,67,3,0.5,0),(119,478,67,3,0.5,0),(120,480,67,3,0.5,0),(121,483,67,3,0.5,0),(122,484,67,3,0.5,0),(123,486,67,3,0.728155339805825,1),(124,488,67,3,0.5,0),(125,490,67,3,0.5,0),(126,493,67,3,0.5,0),(127,494,67,3,0.5,0),(128,496,67,3,0.5,0),(129,497,67,3,0.5,0),(130,498,67,3,0.5,0),(131,500,67,3,0.5,0),(132,501,67,3,0.5,0),(133,502,67,3,0.5,0),(134,504,67,3,0.5,0),(135,505,67,3,0.5,0),(136,506,67,3,0.5,0),(137,507,67,3,0.5,0),(138,509,67,3,0.5,0),(139,510,67,3,0.5,0),(140,511,67,3,0.5,0),(141,423,49,3,0.5,0),(142,437,49,3,0.5,0),(143,447,49,3,0.551540673189932,2),(144,455,49,3,0.5,0),(145,458,49,3,0.5,0),(146,459,49,3,0.5,0),(147,464,49,3,0.5,0),(148,465,49,3,0.5,0),(149,466,49,3,0.5,0),(150,470,49,3,0.5,0),(151,471,49,3,0.5,0),(152,473,49,3,0.5,0),(153,476,49,3,0.904336430286791,1),(154,478,49,3,0.5,0),(155,480,49,3,0.5,0),(156,483,49,3,0.5,0),(157,484,49,3,0.5,0),(158,486,49,3,0.5,0),(159,488,49,3,0.5,0),(160,490,49,3,0.5,0),(161,493,49,3,0.5,0),(162,494,49,3,0.5,0),(163,496,49,3,0.5,0),(164,497,49,3,0.5,0),(165,498,49,3,0.5,0),(166,500,49,3,0.5,0),(167,501,49,3,0.5,0),(168,502,49,3,0.5,0),(169,504,49,3,0.5,0),(170,505,49,3,0.5,0),(171,506,49,3,0.5,0),(172,507,49,3,0.5,0),(173,509,49,3,0.5,0),(174,510,49,3,0.5,0),(175,511,49,3,0.5,0),(176,423,41,3,0.5,0),(177,437,41,3,0.5,0),(178,447,41,3,0.5,0),(179,455,41,3,0.5,0),(180,458,41,3,0.5,0),(181,459,41,3,0.5,0),(182,464,41,3,0.5,0),(183,465,41,3,0.5,0),(184,466,41,3,0.5,0),(185,470,41,3,0.5,0),(186,471,41,3,0.776699029126214,1),(187,473,41,3,0.5,0),(188,476,41,3,0.5,0),(189,478,41,3,0.5,0),(190,480,41,3,0.5,0),(191,483,41,3,0.5,0),(192,484,41,3,0.5,0),(193,486,41,3,0.5,0),(194,488,41,3,0.5,0),(195,490,41,3,0.5,0),(196,493,41,3,0.5,0),(197,494,41,3,0.5,0),(198,496,41,3,0.5,0),(199,497,41,3,0.5,0),(200,498,41,3,0.5,0),(201,500,41,3,0.5,0),(202,501,41,3,0.5,0),(203,502,41,3,0.5,0),(204,504,41,3,0.5,0),(205,505,41,3,0.5,0),(206,506,41,3,0.5,0),(207,507,41,3,0.5,0),(208,509,41,3,0.5,0),(209,510,41,3,0.5,0),(210,511,41,3,0.5,0),(211,423,11,3,0.5,0),(212,437,11,3,0.5,0),(213,447,11,3,0.5,0),(214,455,11,3,0.5,0),(215,458,11,3,0.5,0),(216,459,11,3,0.5,0),(217,464,11,3,0.5,0),(218,465,11,3,0.966691367680779,2),(219,466,11,3,0.5,0),(220,470,11,3,0.5,0),(221,471,11,3,0.5,0),(222,473,11,3,0.5,0),(223,476,11,3,0.5,0),(224,478,11,3,0.5,0),(225,480,11,3,0.5,0),(226,483,11,3,1.73465044930851,2),(227,484,11,3,0.5,0),(228,486,11,3,0.5,0),(229,488,11,3,0.5,0),(230,490,11,3,0.5,0),(231,493,11,3,0.832177531206657,1),(232,494,11,3,0.5,0),(233,496,11,3,0.5,0),(234,497,11,3,0.5,0),(235,498,11,3,0.5,0),(236,500,11,3,0.5,0),(237,501,11,3,0.5,0),(238,502,11,3,0.5,0),(239,504,11,3,0.5,0),(240,505,11,3,0.5,0),(241,506,11,3,0.5,0),(242,507,11,3,0.5,0),(243,509,11,3,0.5,0),(244,510,11,3,0.730046900905547,1),(245,511,11,3,0.5,0),(246,44,38,3,0.809061488673139,1),(247,55,38,3,0.5,0),(248,67,38,3,0.5,0),(249,80,38,3,0.5,0),(250,89,38,3,0.5,0),(251,97,38,3,0.5,0),(252,106,38,3,0.5,0),(253,113,38,3,0.5,0),(254,116,38,3,0.5,0),(255,124,38,3,0.5,0),(256,132,38,3,0.5,0),(257,137,38,3,0.5,0),(258,144,38,3,0.5,0),(259,151,38,3,0.5,0),(260,159,38,3,0.5,0),(261,165,38,3,0.728155339805825,1),(262,171,38,3,0.5,0),(263,179,38,3,0.5,0),(264,186,38,3,0.5,0),(265,191,38,3,0.5,0),(266,199,38,3,0.5,0),(267,204,38,3,0.5,0),(268,211,38,3,0.5,0),(269,214,38,3,0.5,0),(270,219,38,3,0.5,0),(271,44,9,3,0.5,0),(272,55,9,3,0.5,0),(273,67,9,3,0.5,0),(274,80,9,3,0.5,0),(275,89,9,3,0.728155339805825,1),(276,97,9,3,0.5,0),(277,106,9,3,0.5,0),(278,113,9,3,0.5,0),(279,116,9,3,0.5,0),(280,124,9,3,0.5,0),(281,132,9,3,0.5,0),(282,137,9,3,0.5,0),(283,144,9,3,0.5,0),(284,151,9,3,1.79490872422352,2),(285,159,9,3,0.5,0),(286,165,9,3,0.5,0),(287,171,9,3,0.5,0),(288,179,9,3,0.5,0),(289,186,9,3,0.5,0),(290,191,9,3,0.5,0),(291,199,9,3,0.5,0),(292,204,9,3,0.5,0),(293,211,9,3,0.5,0),(294,214,9,3,0.5,0),(295,219,9,3,0.5,0),(296,44,5,3,0.5,0),(297,55,5,3,0.5,0),(298,67,5,3,0.5,0),(299,80,5,3,0.5,0),(300,89,5,3,0.5,0),(301,97,5,3,0.5,0),(302,106,5,3,0.5,0),(303,113,5,3,0.5,0),(304,116,5,3,3.02638144139555,3),(305,124,5,3,0.5,0),(306,132,5,3,0.5,0),(307,137,5,3,0.728155339805825,1),(308,144,5,3,0.5,0),(309,151,5,3,0.5,0),(310,159,5,3,0.5,0),(311,165,5,3,0.5,0),(312,171,5,3,0.5,0),(313,179,5,3,0.5,0),(314,186,5,3,0.5,0),(315,191,5,3,0.5,0),(316,199,5,3,0.5,0),(317,204,5,3,0.5,0),(318,211,5,3,0.5,0),(319,214,5,3,0.5,0),(320,219,5,3,0.809061488673139,1),(321,44,8,3,0.5,0),(322,55,8,3,0.728155339805825,1),(323,67,8,3,0.5,0),(324,80,8,3,0.5,0),(325,89,8,3,0.5,0),(326,97,8,3,0.5,0),(327,106,8,3,0.5,0),(328,113,8,3,0.5,0),(329,116,8,3,0.5,0),(330,124,8,3,0.809061488673139,1),(331,132,8,3,0.5,0),(332,137,8,3,0.5,0),(333,144,8,3,0.5,0),(334,151,8,3,0.5,0),(335,159,8,3,1.94601867487171,2),(336,165,8,3,0.5,0),(337,171,8,3,0.5,0),(338,179,8,3,0.5,0),(339,186,8,3,0.5,0),(340,191,8,3,0.5,0),(341,199,8,3,0.728155339805825,1),(342,204,8,3,0.5,0),(343,211,8,3,0.5,0),(344,214,8,3,0.5,0),(345,219,8,3,0.5,0),(346,44,57,3,0.5,0),(347,55,57,3,0.5,0),(348,67,57,3,0.5,0),(349,80,57,3,0.776699029126214,1),(350,89,57,3,0.5,0),(351,97,57,3,0.896191187453323,1),(352,106,57,3,0.5,0),(353,113,57,3,0.5,0),(354,116,57,3,0.5,0),(355,124,57,3,0.728155339805825,1),(356,132,57,3,0.688437775816417,1),(357,137,57,3,0.5,0),(358,144,57,3,0.5,0),(359,151,57,3,0.5,0),(360,159,57,3,0.5,0),(361,165,57,3,0.5,0),(362,171,57,3,0.5,0),(363,179,57,3,0.5,0),(364,186,57,3,0.5,0),(365,191,57,3,0.5,0),(366,199,57,3,0.5,0),(367,204,57,3,0.5,0),(368,211,57,3,0.5,0),(369,214,57,3,0.87378640776699,1),(370,219,57,3,0.5,0),(371,44,37,3,0.5,0),(372,55,37,3,0.9565962307253,1),(373,67,37,3,0.5,0),(374,80,37,3,0.5,0),(375,89,37,3,0.5,0),(376,97,37,3,0.5,0),(377,106,37,3,0.5,0),(378,113,37,3,0.5,0),(379,116,37,3,0.5,0),(380,124,37,3,0.5,0),(381,132,37,3,0.5,0),(382,137,37,3,0.5,0),(383,144,37,3,0.5,0),(384,151,37,3,0.5,0),(385,159,37,3,0.5,0),(386,165,37,3,0.5,0),(387,171,37,3,0.5,0),(388,179,37,3,0.5,0),(389,186,37,3,0.5,0),(390,191,37,3,0.5,0),(391,199,37,3,0.5,0),(392,204,37,3,0.5,0),(393,211,37,3,0.5,0),(394,214,37,3,0.5,0),(395,219,37,3,0.5,0),(396,44,10,3,0.5,0),(397,55,10,3,0.5,0),(398,67,10,3,0.5,0),(399,80,10,3,0.5,0),(400,89,10,3,0.5,0),(401,97,10,3,0.5,0),(402,106,10,3,0.5,0),(403,113,10,3,0.5,0),(404,116,10,3,0.5,0),(405,124,10,3,0.5,0),(406,132,10,3,0.5,0),(407,137,10,3,0.5,0),(408,144,10,3,0.5,0),(409,151,10,3,0.5,0),(410,159,10,3,0.5,0),(411,165,10,3,0.5,0),(412,171,10,3,0.5,0),(413,179,10,3,0.5,0),(414,186,10,3,0.5,0),(415,191,10,3,0.5,0),(416,199,10,3,0.5,0),(417,204,10,3,0.5,0),(418,211,10,3,0.5,0),(419,214,10,3,0.5,0),(420,219,10,3,0.5,0),(421,1,42,12,0.5,0),(422,2,42,12,0.5,0),(423,4,42,12,0.5,0),(424,44,42,12,0.5,0),(425,97,42,12,0.5,0),(426,132,42,12,0.5,0),(427,165,42,12,0.5,0),(428,7,42,12,0.5,0),(429,17,42,12,0.5,0),(430,31,42,12,0.5,0),(431,57,42,12,0.5,0),(432,74,42,12,0.5,0),(433,86,42,12,0.5,0),(434,108,42,12,0.5,0),(435,114,42,12,0.5,0),(436,122,42,12,0.5,0),(437,138,42,12,0.5,0),(438,148,42,12,0.5,0),(439,158,42,12,0.5,0),(440,1,32,12,0.5,0),(441,2,32,12,0.5,0),(442,4,32,12,0.5,0),(443,7,32,12,0.5,0),(444,17,32,12,0.5,0),(445,31,32,12,0.5,0),(446,44,32,12,0.5,0),(447,57,32,12,0.5,0),(448,74,32,12,0.5,0),(449,86,32,12,0.5,0),(450,97,32,12,0.5,0),(451,108,32,12,0.5,0),(452,114,32,12,0.5,0),(453,122,32,12,0.5,0),(454,132,32,12,0.5,0),(455,138,32,12,0.5,0),(456,148,32,12,0.5,0),(457,158,32,12,0.5,0),(458,165,32,12,0.5,0),(459,109,43,12,0.5,0),(460,124,43,12,0.5,0),(461,140,43,12,0.5,0),(462,159,43,12,0.5,0),(463,176,43,12,0.5,0),(464,191,43,12,0.5,0),(465,206,43,12,0.5,0),(466,219,43,12,0.5,0),(467,235,43,12,0.5,0),(468,243,43,12,0.5,0),(469,255,43,12,0.5,0),(470,265,43,12,0.5,0),(471,277,43,12,0.5,0),(472,287,43,12,0.5,0),(473,298,43,12,0.5,0),(474,309,43,12,0.5,0),(475,315,43,12,0.5,0),(476,405,31,12,0.5,0),(477,407,31,12,0.5,0),(478,409,31,12,0.5,0),(479,411,31,12,0.5,0),(480,413,31,12,0.5,0),(481,414,31,12,0.5,0),(482,416,31,12,0.5,0),(483,418,31,12,0.5,0),(484,419,31,12,0.5,0),(485,421,31,12,0.5,0),(486,422,31,12,0.5,0),(487,424,31,12,0.5,0),(488,426,31,12,0.5,0),(489,427,31,12,0.5,0),(490,430,31,12,0.5,0),(491,431,31,12,0.5,0),(492,405,61,12,0.5,0),(493,407,61,12,0.5,0),(494,409,61,12,0.5,0),(495,411,61,12,0.5,0),(496,413,61,12,0.5,0),(497,414,61,12,0.5,0),(498,416,61,12,0.5,0),(499,418,61,12,0.5,0),(500,419,61,12,0.5,0),(501,421,61,12,0.5,0),(502,422,61,12,0.5,0),(503,424,61,12,0.5,0),(504,426,61,12,0.5,0),(505,427,61,12,0.5,0),(506,430,61,12,0.5,0),(507,431,61,12,0.5,0),(508,109,62,12,0.5,0),(509,124,62,12,0.5,0),(510,140,62,12,0.5,0),(511,159,62,12,0.5,0),(512,176,62,12,0.5,0),(513,191,62,12,0.5,0),(514,206,62,12,0.5,0),(515,219,62,12,0.5,0),(516,235,62,12,0.5,0),(517,243,62,12,0.5,0),(518,255,62,12,0.5,0),(519,265,62,12,0.5,0),(520,277,62,12,0.5,0),(521,287,62,12,0.5,0),(522,298,62,12,0.5,0),(523,309,62,12,0.5,0),(524,315,62,12,0.5,0),(525,324,62,12,0.5,0),(526,328,62,12,0.5,0),(527,333,62,12,0.5,0),(528,339,62,12,0.5,0),(529,342,62,12,0.5,0),(530,347,62,12,0.5,0),(531,351,62,12,0.5,0),(532,354,62,12,0.5,0),(533,360,62,12,0.5,0),(534,363,62,12,0.5,0),(535,366,62,12,0.5,0),(536,369,62,12,0.5,0),(537,371,62,12,0.5,0),(538,374,62,12,0.5,0),(539,377,62,12,0.5,0),(540,380,62,12,0.5,0),(541,383,62,12,0.5,0),(542,384,62,12,0.5,0),(543,386,62,12,0.5,0),(544,388,62,12,0.5,0),(545,391,62,12,0.5,0),(546,393,62,12,0.5,0),(547,394,62,12,0.5,0),(548,395,62,12,0.5,0),(549,396,62,12,0.5,0),(550,397,62,12,0.5,0),(551,398,62,12,0.5,0),(552,400,62,12,0.5,0),(553,401,62,12,0.5,0),(554,402,62,12,0.5,0),(555,403,62,12,0.5,0),(556,404,62,12,0.5,0),(557,405,62,12,0.5,0),(558,408,62,12,0.5,0),(559,412,62,12,0.5,0),(560,414,62,12,0.5,0),(561,417,62,12,0.5,0),(562,420,62,12,0.5,0),(563,422,62,12,0.5,0),(564,425,62,12,0.5,0),(565,428,62,12,0.5,0),(566,431,62,12,0.5,0),(567,433,62,12,0.5,0),(568,434,62,12,0.5,0),(569,435,62,12,0.5,0),(570,436,62,12,0.5,0),(571,437,62,12,0.5,0),(572,438,62,12,0.5,0),(573,439,62,12,0.5,0),(574,440,62,12,0.5,0),(575,442,62,12,0.5,0),(576,443,62,12,0.5,0),(577,445,62,12,0.5,0),(578,446,62,12,0.5,0),(579,448,62,12,0.5,0),(580,449,62,12,0.5,0),(581,450,62,12,0.5,0),(582,451,62,12,0.5,0),(583,452,62,12,0.5,0),(584,159,3,6,0.5,0),(585,179,3,6,0.5,0),(586,199,3,6,0.5,0),(587,214,3,6,0.5,0),(588,231,3,6,0.5,0),(589,243,3,6,0.776699029126214,1),(590,256,3,6,0.5,0),(591,270,3,6,0.5,0),(592,283,3,6,0.5,0),(593,296,3,6,0.5,0),(594,309,3,6,0.5,0),(595,316,3,6,0.5,0),(596,326,3,6,0.5,0),(597,332,3,6,0.5,0),(598,337,3,6,0.5,0),(599,342,3,6,0.5,0),(600,348,3,6,0.5,0),(601,352,3,6,0.5,0),(602,358,3,6,0.5,0),(603,362,3,6,0.5,0),(604,74,4,6,0.5,0),(605,93,4,6,0.5,0),(606,109,4,6,0.5,0),(607,119,4,6,0.5,0),(608,134,4,6,0.5,0),(609,148,4,6,0.5,0),(610,160,4,6,0.5,0),(611,176,4,6,0.5,0),(612,190,4,6,0.5,0),(613,202,4,6,0.5,0),(614,213,4,6,0.5,0),(615,223,4,6,0.5,0),(616,17,16,6,0.647249190938511,1),(617,27,16,6,0.5,0),(618,38,16,6,0.5,0),(619,49,16,6,0.5,0),(620,61,16,6,0.5,0),(621,74,16,6,0.728155339805825,1),(622,84,16,6,0.5,0),(623,93,16,6,0.5,0),(624,93,17,6,0.776699029126214,1),(625,109,17,6,0.5,0),(626,119,17,6,0.5,0),(627,134,17,6,0.5,0),(628,148,17,6,0.5,0),(629,160,17,6,0.5,0),(630,176,17,6,0.5,0),(631,190,17,6,0.5,0),(632,202,17,6,0.5,0),(633,213,17,6,0.5,0),(634,223,17,6,0.5,0),(635,235,17,6,0.5,0),(636,199,35,6,0.5,0),(637,219,35,6,0.5,0),(638,240,35,6,0.5,0),(639,256,35,6,0.5,0),(640,274,35,6,0.5,0),(641,292,35,6,0.5,0),(642,309,35,6,0.647249190938511,1),(643,80,36,6,0.5,0),(644,89,36,6,0.5,0),(645,97,36,6,0.5,0),(646,106,36,6,0.5,0),(647,113,36,6,0.5,0),(648,116,36,6,0.5,0),(649,124,36,6,0.5,0),(650,132,36,6,0.5,0),(651,137,36,6,0.5,0),(652,17,26,6,0.5,0),(653,55,26,6,0.5,0),(654,93,26,6,0.5,0),(655,116,26,6,0.910194174757282,1),(656,140,26,6,0.5,0),(657,165,26,6,0.5,0),(658,27,25,6,0.5,0),(659,74,25,6,0.776699029126214,1),(660,109,25,6,0.5,0),(661,134,25,6,0.5,0),(662,160,25,6,0.5,0),(663,190,25,6,0.5,0),(664,17,2,6,0.5,0),(665,89,2,6,0.5,0),(666,134,2,6,0.5,0),(667,179,2,6,0.5,0),(668,215,2,6,0.5,0),(669,249,2,6,0.5,0),(670,277,2,6,0.849514563106796,1),(671,27,1,6,0.5,0),(672,106,1,6,0.5,0),(673,156,1,6,0.5,0),(674,204,1,6,0.647249190938511,1),(675,241,1,6,0.5,0),(676,274,1,6,0.5,0),(677,17,68,6,0.5,0),(678,84,68,6,0.5,0),(679,129,68,6,0.5,0),(680,168,68,6,0.5,0),(681,206,68,6,0.5,0),(682,237,68,6,0.5,0),(683,261,68,6,0.5,0),(684,288,68,6,0.5,0),(685,311,68,6,0.862998921251348,1),(686,328,68,6,0.5,0),(687,27,13,6,0.5,0),(688,101,13,6,0.5,0),(689,148,13,6,0.5,0),(690,197,13,6,0.728155339805825,1),(691,235,13,6,0.5,0),(692,261,13,6,0.647249190938511,1),(693,294,13,6,0.5,0),(694,319,13,6,0.5,0),(695,334,13,6,0.5,0),(696,97,65,11,0.5,0),(697,148,65,11,0.5,0),(698,199,65,11,0.5,0),(699,237,65,11,0.5,0),(700,270,65,11,0.5,0),(701,67,64,11,0.5,0),(702,119,64,11,0.5,0),(703,165,64,11,0.5,0),(704,206,64,11,0.5,0),(705,240,64,11,0.5,0),(706,8,22,11,0.5,0),(707,12,22,11,0.5,0),(708,18,22,11,0.5,0),(709,25,22,11,0.5,0),(710,32,22,11,0.5,0),(711,39,22,11,0.5,0),(712,47,22,11,0.5,0),(713,52,22,11,0.5,0),(714,59,22,11,0.5,0),(715,68,22,11,0.5,0),(716,77,22,11,0.5,0),(717,74,21,11,0.5,0),(718,140,21,11,0.5,0),(719,202,21,11,0.5,0),(720,246,21,11,0.5,0),(721,286,21,11,0.5,0),(722,17,48,11,0.5,0),(723,110,48,11,0.5,0),(724,170,48,11,0.5,0),(725,227,48,11,0.5,0),(726,267,48,11,0.5,0),(727,97,47,11,0.5,0),(728,157,47,11,0.5,0),(729,212,47,11,0.5,0),(730,254,47,11,0.5,0),(731,290,47,11,0.5,0),(732,17,44,11,0.5,0),(733,96,44,11,0.5,0),(734,143,44,11,0.5,0),(735,193,44,11,0.5,0),(736,234,44,11,0.5,0),(737,262,44,11,0.5,0),(738,11,45,11,0.5,0),(739,99,45,11,0.5,0),(740,154,45,11,0.5,0),(741,207,45,11,0.5,0),(742,248,45,11,0.5,0),(743,282,45,11,0.5,0),(744,44,24,11,0.728155339805825,1),(745,120,24,11,0.5,0),(746,183,24,11,0.5,0),(747,232,24,11,0.5,0),(748,269,24,11,0.5,0),(749,307,24,11,0.5,0),(750,6,23,11,0.5,0),(751,87,23,11,0.5,0),(752,141,23,11,0.5,0),(753,198,23,11,0.5,0),(754,238,23,11,0.5,0),(755,272,23,11,0.5,0),(756,6,40,11,0.5,0),(757,13,40,11,0.5,0),(758,26,40,11,0.5,0),(759,41,40,11,0.5,0),(760,53,40,11,0.5,0),(761,70,40,11,0.5,0),(762,83,40,11,0.5,0),(763,95,40,11,0.5,0),(764,460,63,11,0.5,0),(765,469,63,11,0.5,0),(766,475,63,11,0.5,0),(767,482,63,11,0.5,0),(768,489,63,11,0.5,0),(769,495,63,11,0.728155339805825,1),(770,499,63,11,0.5,0),(771,503,63,11,0.5,0),(772,508,63,11,0.5,0),(773,310,39,11,0.5,0),(774,389,39,11,0.5,0),(775,429,39,11,0.5,0),(776,454,39,11,0.5,0),(777,461,39,11,0.5,0),(778,468,39,11,0.5,0),(779,474,39,11,0.5,0),(780,479,39,11,0.5,0),(781,485,39,11,0.728155339805825,1),(782,11,34,11,0.5,0),(783,91,34,11,0.5,0),(784,139,34,11,0.5,0),(785,189,34,11,0.5,0),(786,230,34,11,0.5,0),(787,258,34,11,0.5,0),(788,291,34,11,0.5,0),(789,199,33,11,0.5,0),(790,275,33,11,0.5,0),(791,331,33,11,0.5,0),(792,359,33,11,0.5,0),(793,378,33,11,0.5,0),(794,392,33,11,0.5,0),(795,399,33,11,0.5,0),(796,310,33,11,0.5,0),(797,382,33,11,0.5,0),(798,406,33,11,0.5,0),(799,441,33,11,0.5,0),(800,456,33,11,0.5,0),(801,463,33,11,0.5,0),(802,467,33,11,0.5,0),(803,472,33,11,0.5,0),(804,477,33,11,0.5,0),(805,481,33,11,0.5,0),(806,487,33,11,0.5,0),(807,6,58,13,0.5,0),(808,9,58,13,0.5,0),(809,14,58,13,0.5,0),(810,21,58,13,0.5,0),(811,28,58,13,0.5,0),(812,35,58,13,0.5,0),(813,43,58,13,0.5,0),(814,48,58,13,0.5,0),(815,56,58,13,0.5,0),(816,62,58,13,0.5,0),(817,73,58,13,0.776699029126214,1),(818,79,58,13,0.5,0),(819,17,59,13,0.951456310679612,1),(820,66,59,13,0.5,0),(821,107,59,13,0.5,0),(822,135,59,13,0.5,0),(823,164,59,13,0.5,0),(824,194,59,13,0.5,0),(825,11,20,13,0.647249190938511,1),(826,60,20,13,0.5,0),(827,105,20,13,0.849514563106796,1),(828,133,20,13,0.88261253309797,1),(829,163,20,13,0.5,0),(830,196,20,13,0.5,0),(831,8,52,13,0.5,0),(832,10,52,13,0.5,0),(833,15,52,13,0.928661882650908,1),(834,20,52,13,0.5,0),(835,24,52,13,0.5,0),(836,30,52,13,0.728155339805825,1),(837,36,52,13,0.952203136669156,1),(838,40,52,13,0.5,0),(839,45,52,13,0.5,0),(840,22,6,13,0.5,0),(841,65,6,13,0.5,0),(842,102,6,13,0.5,0),(843,128,6,13,0.5,0),(844,153,6,13,0.5,0),(845,80,7,13,0.5,0),(846,127,7,13,0.5,0),(847,167,7,13,0.5,0),(848,208,7,13,0.5,0),(849,239,7,13,0.5,0),(850,266,7,13,0.5,0),(851,38,19,13,0.5,0),(852,76,19,13,0.5,0),(853,103,19,13,0.5,0),(854,123,19,13,0.5,0),(855,142,19,13,0.5,0),(856,166,19,13,0.5,0),(857,6,60,13,0.647249190938511,1),(858,45,60,13,0.5,0),(859,90,60,13,0.5,0),(860,117,60,13,0.5,0),(861,147,60,13,0.5,0),(862,174,60,13,0.87378640776699,1),(863,201,60,13,0.728155339805825,1),(864,11,54,13,0.5,0),(865,16,54,13,0.5,0),(866,19,54,13,0.5,0),(867,23,54,13,0.5,0),(868,29,54,13,0.5,0),(869,33,54,13,0.5,0),(870,37,54,13,0.5,0),(871,42,54,13,0.5,0),(872,46,54,13,0.5,0),(873,51,54,13,0.5,0),(874,54,54,13,0.5,0),(875,58,54,13,0.5,0),(876,64,54,13,0.5,0),(877,69,54,13,0.5,0),(878,75,54,13,0.5,0),(879,78,54,13,0.5,0),(880,199,55,13,0.5,0),(881,343,55,13,0.5,0),(882,390,55,13,0.5,0),(883,415,55,13,0.5,0),(884,444,55,13,0.5,0),(885,457,55,13,0.5,0),(886,49,27,13,0.5,0),(887,100,27,13,0.5,0),(888,131,27,13,0.5,0),(889,161,27,13,0.809061488673139,1),(890,195,27,13,0.5,0),(891,220,27,13,0.776699029126214,1),(892,242,27,13,0.5,0),(893,260,27,13,0.5,0),(894,284,27,13,0.5,0),(895,303,27,13,0.5,0),(896,38,28,13,0.5,0),(897,88,28,13,0.953221535745807,1),(898,118,28,13,0.5,0),(899,150,28,13,0.776699029126214,1),(900,184,28,13,0.5,0),(901,210,28,13,0.5,0),(902,233,28,13,0.5,0),(903,253,28,13,0.5,0),(904,271,28,13,0.5,0),(905,8,50,13,0.5,0),(906,34,50,13,0.5,0),(907,63,50,13,0.5,0),(908,92,50,13,0.5,0),(909,112,50,13,0.5,0),(910,130,50,13,0.5,0),(911,146,50,13,0.5,0),(912,162,50,13,0.5,0),(913,97,51,13,0.5,0),(914,125,51,13,0.5,0),(915,152,51,13,0.5,0),(916,181,51,13,0.5,0),(917,205,51,13,0.922330097087379,1),(918,229,51,13,0.5,0),(919,247,51,13,0.5,0),(920,263,51,13,0.5,0),(921,280,51,13,0.728155339805825,1),(922,299,51,13,0.5,0),(923,49,29,13,0.5,0),(924,94,29,13,0.5,0),(925,121,29,13,0.5,0),(926,149,29,13,0.5,0),(927,178,29,13,0.5,0),(928,203,29,13,0.5,0),(929,228,29,13,0.5,0),(930,244,29,13,0.5,0),(931,259,29,13,0.5,0),(932,278,29,13,0.5,0),(933,297,29,13,0.5,0),(934,38,30,13,0.5,0),(935,72,30,13,0.5,0),(936,98,30,13,0.913763563677898,1),(937,115,30,13,0.5,0),(938,136,30,13,0.5,0),(939,155,30,13,0.5,0),(940,172,30,13,0.5,0),(941,192,30,13,0.5,0),(942,209,30,13,0.5,0),(943,38,14,13,0.5,0),(944,72,14,13,0.5,0),(945,98,14,13,0.5,0),(946,115,14,13,0.5,0),(947,136,14,13,0.5,0),(948,155,14,13,0.5,0),(949,172,14,13,0.5,0),(950,192,14,13,0.5,0),(951,209,14,13,0.5,0),(952,106,15,13,0.5,0),(953,145,15,13,0.5,0),(954,188,15,13,0.776699029126214,1),(955,221,15,13,0.5,0),(956,250,15,13,0.962715183160643,1),(957,276,15,13,0.5,0),(958,301,15,13,0.5,0),(959,323,15,13,0.5,0),(960,335,15,13,0.5,0),(961,346,15,13,0.728155339805825,1),(962,355,15,13,0.849514563106796,1),(963,44,12,1,0.5,0),(964,71,12,1,0.5,0),(965,93,12,1,0.5,0),(966,111,12,1,0.5,0),(967,124,12,1,0,1),(968,138,12,1,0.217824246950461,1),(969,156,12,1,0.5,0),(970,169,12,1,0.5,0),(971,186,12,1,0.820036501459259,1),(972,200,12,1,0.5,0),(973,213,12,1,0.5,0),(974,225,12,1,0.5,0),(975,236,12,1,0.862998921251348,1),(976,245,12,1,0.5,0),(977,255,12,1,0.809061488673139,1),(978,264,12,1,0.5,0),(979,274,12,1,0.5,0),(980,285,12,1,0.5,0),(981,294,12,1,0,1),(982,302,12,1,0.5,0),(983,310,12,1,0.5,0),(984,318,12,1,0.5,0),(985,325,12,1,0.5,0),(986,329,12,1,0.5,0),(987,333,12,1,0.5,0),(988,338,12,1,0.5,0),(989,341,12,1,0,1),(990,345,12,1,0.5,0),(991,349,12,1,0.5,0),(992,353,12,1,0.5,0),(993,357,12,1,0.933532486930545,1),(994,361,12,1,0.5,0),(995,364,12,1,0.5,0),(996,367,12,1,0.864823521773752,1),(997,369,12,1,0.5,0),(998,370,12,1,0.5,0),(999,373,12,1,0,1),(1000,375,12,1,0.5,0),(1001,44,53,1,0.5,0),(1002,71,53,1,0.728155339805825,1),(1003,93,53,1,0.5,0),(1004,111,53,1,0.5,0),(1005,124,53,1,0.5,0),(1006,138,53,1,0.5,0),(1007,156,53,1,0.5,0),(1008,169,53,1,0.5,0),(1009,186,53,1,0.5,0),(1010,200,53,1,0.5,0),(1011,213,53,1,0.5,0),(1012,225,53,1,0.5,0),(1013,236,53,1,0.5,0),(1014,245,53,1,0.5,0),(1015,255,53,1,0.5,0),(1016,264,53,1,0.5,0),(1017,274,53,1,0.5,0),(1018,285,53,1,0.5,0),(1019,294,53,1,0.5,0),(1020,302,53,1,0.5,0),(1021,310,53,1,0.728155339805825,1),(1022,318,53,1,0.5,0),(1023,325,53,1,0.5,0),(1024,329,53,1,0.5,0),(1025,333,53,1,0.5,0),(1026,338,53,1,0.5,0),(1027,341,53,1,0.5,0),(1028,345,53,1,0.5,0),(1029,349,53,1,0.5,0),(1030,353,53,1,0.5,0),(1031,357,53,1,0.5,0),(1032,361,53,1,0.5,0),(1033,364,53,1,0.5,0),(1034,367,53,1,0.5,0),(1035,369,53,1,1.68654645995095,2),(1036,370,53,1,0.5,0),(1037,373,53,1,0.5,0),(1038,375,53,1,0.5,0),(1039,38,66,10,2.16749814535499,4),(1040,84,66,10,2.52367288658887,3),(1041,114,66,10,1.89940021900414,3),(1042,140,66,10,1.815997897034,3),(1043,168,66,10,2.61693185241837,3),(1044,215,66,10,2.53687917452659,3),(1045,237,66,10,3.29494783469717,4),(1046,255,66,10,2.52829862087679,3),(1047,273,66,10,2.104859959812,4),(1048,288,66,10,1.78849416568732,3),(1049,308,66,10,1.6282282782405,3),(1050,319,66,10,2.08270526653681,3),(1051,328,66,10,1.83310780499405,3),(1052,336,66,10,2.3030001611275,3),(1053,344,66,10,1.73977599215322,3),(1054,350,66,10,1.90117169493697,3),(1055,357,66,10,2.70871812744663,4),(1056,363,66,10,1.70763203607176,2),(1057,368,66,10,1.66748961706023,3),(1058,376,66,10,1.67542081319809,3),(1059,381,66,10,1.88283351900955,3),(1060,384,66,10,1.93711417363607,3),(1061,80,66,10,2.16626354645926,4),(1062,151,66,10,2.29711932019834,4),(1063,197,66,10,2.21574126266266,4),(1064,236,66,10,2.54898154661959,3),(1065,310,66,10,2.14871214867494,4),(1066,356,66,10,2.17338433158247,4),(1067,372,66,10,2.13518929777813,4),(1068,385,66,10,1.9772837839052,3),(1069,44,18,14,0.5,0),(1070,74,18,14,0.5,0),(1071,97,18,14,0.5,0),(1072,114,18,14,0.5,0),(1073,132,18,14,0.5,0),(1074,148,18,14,0.5,0),(1075,165,18,14,0.5,0),(1076,185,18,14,0.5,0),(1077,199,18,14,0.5,0),(1078,213,18,14,0.5,0),(1079,226,18,14,0.5,0),(1080,237,18,14,0.5,0),(1081,249,18,14,0.5,0),(1082,257,18,14,0.5,0),(1083,270,18,14,0.5,0),(1084,279,18,14,0.5,0),(1085,292,18,14,0.5,0),(1086,97,71,7,0.5,0),(1087,310,71,7,0.5,0),(1088,226,71,7,0.5,0),(1089,114,70,7,0.5,0),(1090,165,72,7,0.5,0),(1091,140,73,7,0.5,0),(1092,240,73,7,0.5,0),(1093,74,74,7,0.5,0),(1094,235,75,7,0.5,0),(1095,144,75,7,0.5,0),(1096,310,76,7,0.5,0),(1097,251,77,7,0.5,0),(1098,8,77,7,0.5,0),(1099,144,77,7,0.5,0),(1100,97,78,7,0.5,0),(1101,240,78,7,0.5,0),(1102,246,79,7,0.5,0),(1103,114,79,7,0.5,0),(1104,55,80,7,0.5,0),(1105,49,81,7,0.5,0),(1106,17,82,8,0.620280474649406,1),(1107,11,83,8,0.728155339805825,1),(1108,6,84,8,0.955214531788287,1),(1109,22,84,8,0.776699029126214,1),(1110,22,85,8,1.56435328910672,2),(1111,55,85,8,1.52627998609506,2),(1112,55,86,8,0.0269687162891045,1),(1113,6,86,8,0.728155339805825,1),(1114,6,87,8,0.70318957862015,2),(1115,6,88,8,0.787658807166505,2),(1116,11,89,8,0.776699029126214,1),(1117,6,90,8,0.758388271005415,2),(1118,5,91,8,0.736637747592952,2),(1119,4,92,8,0.728155339805825,1),(1120,8,93,9,0.5,0),(1121,8,94,9,0.5,0),(1122,55,93,9,0,1),(1123,61,93,9,0,1),(1124,67,93,9,0.5,0),(1125,49,93,9,0.5,0),(1126,80,93,9,0.5,0),(1127,74,93,9,0.5,0),(1128,6,94,9,0.5,0),(1129,6,95,9,0.5,0),(1130,6,96,9,0.242718446601942,1),(1131,6,97,9,0.809061488673139,1),(1132,6,98,9,0.849514563106796,1),(1133,6,99,9,0,1),(1134,6,100,9,0.618292759253123,2),(1135,6,101,9,0,1),(1136,3,102,5,0.580469512508347,1),(1137,3,103,5,0.832177531206657,1),(1138,3,104,5,0.5,0),(1139,3,105,5,0.5,0),(1140,3,106,5,0.5,0),(1141,3,107,5,0.5,0),(1142,3,108,5,0.728155339805825,1),(1143,3,109,5,0.5,0),(1144,3,110,5,0.5,0),(1145,3,111,5,0.5,0),(1146,3,112,5,0.5,0),(1147,3,113,5,1.93014317616337,2),(1148,3,114,15,0.721041529765502,2),(1149,3,115,15,0.5,0),(1150,3,116,15,0.5,0),(1151,3,117,15,0.5,0),(1152,3,118,15,0.5,0),(1153,3,119,15,0.5,0),(1154,3,120,15,0.5,0),(1155,3,121,15,0.5,0),(1156,3,122,15,0.5,0),(1157,3,123,15,0.5,0),(1158,3,124,15,0.5,0),(1159,3,125,15,0.5,0),(1160,3,126,15,0.5,0),(1161,3,127,15,0.5,0),(1162,3,128,15,0.5,0);
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
  `params_id` int(11) NOT NULL,
  `rate` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `learning_currtable_45bd63ef` (`params_id`),
  CONSTRAINT `params_id_refs_id_726e357e1cc0dcda` FOREIGN KEY (`params_id`) REFERENCES `learning_params` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning_currtable`
--

LOCK TABLES `learning_currtable` WRITE;
/*!40000 ALTER TABLE `learning_currtable` DISABLE KEYS */;
INSERT INTO `learning_currtable` VALUES (1,5,299.215),(2,8,1.0444),(3,9,4.0644),(4,10,27.5458),(5,11,0.0363),(6,37,62.4414),(7,38,1.0973),(8,41,2.2669),(9,46,0.1475),(10,49,0.0267),(11,56,0.0398),(12,57,0.7363),(13,67,0.0379),(14,69,10.8633),(15,1,0.9144),(16,2,1.09361),(17,3,0.3937),(18,4,2.54),(19,6,2.11338),(20,7,0.47318),(21,13,0.001),(22,14,0.42268),(23,15,2.36588),(24,16,3.93701),(25,17,0.254),(26,19,0.23659),(27,20,4.22675),(28,21,0.10764),(29,22,9.2903),(30,23,2.58999),(31,24,0.3861),(32,25,0.3048),(33,26,3.28084),(34,27,1.30795),(35,28,0.76455),(36,29,4.73176),(37,30,0.21134),(38,31,-272.15),(39,32,274.15),(40,33,0.00004),(41,34,25899.8811),(42,35,0.32808),(43,36,3.048),(44,39,40.46856),(45,40,0.02471),(46,42,33.8),(47,43,-17.22222),(48,44,0.83613),(49,45,1.19599),(50,47,0.0929),(51,48,10.76391),(52,50,6.7628),(53,51,0.14787),(54,52,67.62805),(55,54,0.02832),(56,55,35.31467),(57,58,61.02374),(58,59,1.05669),(59,60,0.94635),(60,61,-457.87),(61,62,255.92778),(62,63,0.00405),(63,64,6.4516),(64,65,0.155),(65,68,0.62137);
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
  CONSTRAINT `conceptQuestion_id_refs_id_4115a243f0fcff23` FOREIGN KEY (`conceptQuestion_id`) REFERENCES `learning_conceptquestion` (`id`),
  CONSTRAINT `type_id_refs_id_444862b09187e290` FOREIGN KEY (`type_id`) REFERENCES `learning_type` (`id`),
  CONSTRAINT `user_id_refs_id_630270d3410ecf4b` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=228 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning_floatmodel`
--

LOCK TABLES `learning_floatmodel` WRITE;
/*!40000 ALTER TABLE `learning_floatmodel` DISABLE KEYS */;
INSERT INTO `learning_floatmodel` VALUES (1,9575,135,307,3,2,2,0.985900783289817,'2015-04-04 11:24:36'),(2,41,56,369,3,8,3,0.365853658536585,'2015-04-04 17:25:38'),(3,62.76,123,685,6,7,4,0.959847036328872,'2015-04-04 17:57:58'),(4,55,1325,38,3,3,4,1,'2015-04-04 18:57:41'),(5,67,135,40,3,5,5,1,'2015-04-04 18:58:51'),(6,8.54,6,1046,10,163,5,0.297423887587822,'2015-04-04 19:07:09'),(7,4.51,132,769,11,2,6,1,'2015-04-04 19:07:54'),(8,3,3,1039,10,2,6,0,'2015-04-04 19:09:56'),(9,12.04,12,1055,10,3,6,0.00332225913621255,'2015-04-04 19:10:10'),(10,12.04,12,1055,10,3,7,0.00332225913621255,'2015-04-04 19:20:14'),(11,17294,123,105,3,3,7,0.992887706719093,'2015-04-04 19:21:57'),(12,44,135,261,3,2,8,1,'2015-04-04 19:28:50'),(13,3,3,1039,10,10,8,0,'2015-04-04 19:30:14'),(14,36,123,123,3,2,8,1,'2015-04-04 19:30:36'),(15,123,123,50,3,2,8,0,'2015-04-04 19:30:56'),(16,52,123,341,3,2,8,1,'2015-04-04 19:36:57'),(17,29,123,330,3,4,8,1,'2015-04-04 19:38:11'),(18,207,123,65,3,315,8,0.405797101449275,'2015-04-04 20:11:56'),(19,4497,123,74,3,48,8,0.972648432288192,'2015-04-04 20:13:37'),(20,10,10,143,3,3,8,0,'2015-04-04 20:25:48'),(21,21,20,218,3,52,8,0.0476190476190476,'2015-04-04 20:36:28'),(22,890.95,12,817,13,3,9,0.986531230708794,'2015-04-05 08:10:31'),(23,85.3,153,655,6,14,9,0.793669402110199,'2015-04-05 08:13:02'),(24,21,20,218,3,4,11,0.0476190476190476,'2015-04-05 10:39:09'),(25,56,135,244,3,2,11,1,'2015-04-05 12:19:30'),(26,10,10,143,3,2,11,0,'2015-04-05 12:19:41'),(27,12.65,123,921,13,2,11,1,'2015-04-05 12:19:52'),(28,323.26,132,833,13,21,11,0.591659964115573,'2015-04-05 12:20:17'),(29,564.02,123,837,13,50,11,0.781922626857204,'2015-04-05 12:21:10'),(30,167.41,12,956,13,117,11,0.928319694164028,'2015-04-05 12:23:11'),(31,10.25,10,1050,10,2,11,0.024390243902439,'2015-04-05 12:24:46'),(32,12.69,12,1057,10,155,11,0.0543735224586288,'2015-04-05 12:27:25'),(33,4,4,1061,10,52,11,0,'2015-04-05 12:28:21'),(34,6,6,1062,10,19,11,0,'2015-04-05 12:28:42'),(35,13.89,13,1060,10,174,11,0.0640748740100792,'2015-04-05 12:31:40'),(36,6.4,10,1043,10,5,11,0.5625,'2015-04-05 13:12:09'),(37,11,10,1052,10,7,11,0.0909090909090909,'2015-04-05 13:12:18'),(38,8,8,1064,10,45,11,0,'2015-04-05 13:13:06'),(39,9.85,10,1049,10,5,11,0.0152284263959391,'2015-04-05 13:13:14'),(40,11.7,11,1054,10,5,11,0.0598290598290598,'2015-04-05 13:13:22'),(41,5.74,5,1042,10,31,11,0.128919860627178,'2015-04-05 13:13:57'),(42,5,5,1041,10,4,11,0,'2015-04-05 13:16:03'),(43,3.8,123,1142,5,2,11,1,'2015-04-05 13:17:52'),(44,512,512,1134,9,3,11,0,'2015-04-05 13:20:43'),(45,1.38,1.3,1147,5,4,11,0.0579710144927537,'2015-04-05 13:22:15'),(46,10,10,1065,10,2,11,0,'2015-04-05 13:23:48'),(47,13.6,13,1059,10,9,11,0.0441176470588235,'2015-04-05 13:24:26'),(48,14,13,1068,10,69,11,0.0714285714285714,'2015-04-05 13:26:33'),(49,12,12,1066,10,193,11,0,'2015-04-05 13:29:57'),(50,12.37,12,1056,10,3,11,0.0299110751818916,'2015-04-05 13:30:06'),(51,13.3,13,1058,10,14,11,0.0225563909774437,'2015-04-05 13:30:26'),(52,7.55,6,1044,10,24,11,0.205298013245033,'2015-04-05 13:30:56'),(53,9.43,9,1048,10,13,11,0.0455991516436903,'2015-04-05 13:31:14'),(54,7,7,1063,10,5,11,0,'2015-04-05 13:31:25'),(55,8.06,6,1045,10,4,11,0.255583126550869,'2015-04-05 13:31:35'),(56,21,156,355,3,2,11,1,'2015-04-05 13:31:49'),(57,73,23,275,3,2,11,0.684931506849315,'2015-04-05 13:32:16'),(58,10.63,10,1051,10,62,11,0.059266227657573,'2015-04-05 13:33:30'),(59,4.12,9,1040,10,3,11,1,'2015-04-05 13:33:38'),(60,32,30,226,3,4,11,0.0625,'2015-04-05 13:33:53'),(61,38,45,231,3,5,11,0.184210526315789,'2015-04-05 13:34:05'),(62,12,4,349,3,3,11,0.666666666666667,'2015-04-05 13:34:14'),(63,20,25,153,3,4,11,0.25,'2015-04-05 16:01:14'),(64,749,123,372,3,66,11,0.835781041388518,'2015-04-05 18:08:31'),(65,7780,135,304,3,4,11,0.982647814910026,'2015-04-05 18:08:41'),(66,7780,0.01,304,3,143,11,0.999998714652956,'2015-04-05 18:11:01'),(67,7780,123,304,3,213,11,0.984190231362468,'2015-04-05 18:12:12'),(68,11.36,10,1053,10,4,11,0.119718309859155,'2015-04-05 18:12:40'),(69,225,200,1136,5,5,11,0.111111111111111,'2015-04-05 18:13:01'),(70,11,25,246,3,4,11,1,'2015-04-05 18:13:45'),(71,13,13,1067,10,3,11,0,'2015-04-05 18:16:43'),(72,9,9,1047,10,14,11,0,'2015-04-05 18:16:59'),(73,64,85,975,1,7,11,0.328125,'2015-04-05 18:18:38'),(74,197,195,1035,1,10,11,0.0101522842639594,'2015-04-05 18:18:51'),(75,40,38,335,3,2,11,0.05,'2015-04-05 18:21:20'),(76,60,20,1137,5,5,11,0.666666666666667,'2015-04-05 18:23:27'),(77,146,135,284,3,4,11,0.0753424657534247,'2015-04-05 18:23:41'),(78,48,123,863,13,2,11,1,'2015-04-05 18:25:26'),(79,503.83,123,836,13,2,11,0.755870035527857,'2015-04-05 18:26:51'),(80,1.89,156,857,13,1,11,1,'2015-04-05 18:26:55'),(81,16.91,1236,825,13,1,11,1,'2015-04-05 18:26:59'),(82,3.86,1235,744,11,2,11,1,'2015-04-05 18:38:15'),(83,37878.58,123,781,11,2,11,0.996752782179269,'2015-04-05 18:38:19'),(84,0.05,156,690,6,2,11,1,'2015-04-05 18:38:26'),(85,47.55,26,674,6,1,11,0.453207150368034,'2015-04-05 18:38:30'),(86,26.77,42,589,6,3,11,0.568920433320882,'2015-04-05 18:38:35'),(87,4.83,16,624,6,3,11,1,'2015-04-05 18:38:41'),(88,59.06,1325,621,6,2,11,1,'2015-04-05 18:38:45'),(89,32.15,156,642,6,1,11,1,'2015-04-05 18:38:49'),(90,0.08,34,692,6,1,11,1,'2015-04-05 18:38:52'),(91,19.69,48,616,6,1,11,1,'2015-04-05 18:38:56'),(92,64,32,1131,9,4,11,0.5,'2015-04-05 20:05:15'),(93,51.35,123,889,13,4,11,1,'2015-04-05 20:05:29'),(94,17354,123,320,3,4,11,0.992912296876801,'2015-04-05 20:06:23'),(95,75.99,156,891,13,3,11,1,'2015-04-05 20:06:36'),(96,13,123,322,3,2,11,1,'2015-04-05 20:07:18'),(97,27.43,132,899,13,3,11,1,'2015-04-05 20:07:47'),(98,92.48,156,827,13,6,11,0.686851211072664,'2015-04-05 20:07:55'),(99,340.45,23,962,13,6,11,0.932442355705684,'2015-04-05 20:08:04'),(100,40.31,12,862,13,8,11,0.702307119821384,'2015-04-05 20:08:15'),(101,5.28,123,819,13,48,11,1,'2015-04-05 20:09:06'),(102,123,132,50,3,3,11,0.0731707317073171,'2015-04-05 20:10:39'),(103,16882,15,104,3,3,11,0.999111479682502,'2015-04-05 20:10:55'),(104,12.04,12,1055,10,5,11,0.00332225913621255,'2015-04-05 20:16:28'),(105,22,25,356,3,3,11,0.136363636363636,'2015-04-05 20:17:58'),(106,15,156,351,3,11,11,1,'2015-04-05 20:18:12'),(107,3,3,1039,10,3,11,0,'2015-04-05 20:51:15'),(108,10.25,10,1050,10,2,11,0.024390243902439,'2015-04-05 21:37:13'),(109,4,4,1061,10,2,11,0,'2015-04-05 21:42:23'),(110,6,6,1062,10,2,11,0,'2015-04-05 21:42:27'),(111,8,8,1064,10,3,11,0,'2015-04-05 21:42:32'),(112,90.77,123,670,6,6,12,0.355073262090999,'2015-04-06 17:57:27'),(113,4.57,156,659,6,3,12,1,'2015-04-06 17:57:33'),(114,109.73,156,954,13,3,12,0.421671375193657,'2015-04-06 18:01:22'),(115,130.27,15,828,13,9,12,0.884854532893222,'2015-04-06 18:01:34'),(116,4.26,123,936,13,15,12,1,'2015-04-06 18:01:51'),(117,311.61,15,961,13,2,12,0.951862905555021,'2015-04-06 18:01:57'),(118,13.73,1235,897,13,53,12,1,'2015-04-06 18:02:53'),(119,7.8,1235,917,13,18,12,1,'2015-04-06 18:03:16'),(120,218,123,67,3,3,12,0.435779816513761,'2015-04-06 18:03:58'),(121,235,156,70,3,3,12,0.336170212765957,'2015-04-06 18:04:03'),(122,1.38,12,1147,5,101,12,1,'2015-04-06 19:18:25'),(123,10,10,1065,10,4,12,0,'2015-04-06 19:44:00'),(124,197,220,1035,1,50,13,0.116751269035533,'2015-04-07 10:18:11'),(125,40,12,335,3,1496,13,0.7,'2015-04-07 19:49:15'),(126,9,9,1047,10,5,14,0,'2015-04-08 08:06:54'),(127,12,12,1066,10,7,14,0,'2015-04-08 08:09:22'),(128,13,13,1067,10,3,14,0,'2015-04-08 08:09:32'),(129,7,7,1063,10,3,14,0,'2015-04-08 08:09:37'),(130,5,5,1041,10,3,14,0,'2015-04-08 08:09:42'),(131,9.85,10,1049,10,3,14,0.0152284263959391,'2015-04-08 08:09:46'),(132,12.37,10,1056,10,2,14,0.191592562651576,'2015-04-08 08:09:51'),(133,13.3,13,1058,10,5,14,0.0225563909774437,'2015-04-08 08:09:58'),(134,9.43,9,1048,10,3,14,0.0455991516436903,'2015-04-08 08:10:03'),(135,13.6,13,1059,10,14,14,0.0441176470588235,'2015-04-08 08:10:19'),(136,11.7,11,1054,10,2,14,0.0598290598290598,'2015-04-08 08:10:23'),(137,12.69,14,1057,10,5,14,0.103230890464933,'2015-04-08 08:10:30'),(138,145,95,993,1,24,14,0.344827586206897,'2015-04-08 08:17:07'),(139,10.63,10,1051,10,5,14,0.059266227657573,'2015-04-08 11:15:12'),(140,13.89,13,1060,10,2,14,0.0640748740100792,'2015-04-08 11:15:17'),(141,14,13,1068,10,1,14,0.0714285714285714,'2015-04-08 11:15:20'),(142,11,10,1052,10,13,14,0.0909090909090909,'2015-04-08 11:15:36'),(143,11.36,11.5,1053,10,3,14,0.0123239436619719,'2015-04-08 11:15:41'),(144,10,10,1065,10,2,14,0,'2015-04-08 11:15:46'),(145,4,4,1061,10,5,14,0,'2015-04-08 11:15:54'),(146,6,6,1062,10,2,14,0,'2015-04-08 11:15:58'),(147,4.12,4,1040,10,3,14,0.029126213592233,'2015-04-08 11:16:03'),(148,5.74,6,1042,10,3,14,0.0452961672473867,'2015-04-08 11:16:09'),(149,8,4,1064,10,3,14,0.5,'2015-04-08 11:17:34'),(150,6.4,6,1043,10,3,14,0.0625000000000001,'2015-04-08 11:17:39'),(151,8.06,8,1045,10,5,14,0.00744416873449138,'2015-04-08 11:17:46'),(152,10.25,10,1050,10,43,14,0.024390243902439,'2015-04-08 11:18:32'),(153,7.55,8,1044,10,89,14,0.0596026490066225,'2015-04-08 11:20:04'),(154,8.54,9,1046,10,4,14,0.0538641686182671,'2015-04-08 11:20:12'),(155,3,3,1039,10,2,14,0,'2015-04-08 11:20:18'),(156,9,9,1047,10,2,14,0,'2015-04-08 11:20:24'),(157,12.04,12,1055,10,18,14,0.00332225913621255,'2015-04-08 11:20:45'),(158,13,13,1067,10,2,14,0,'2015-04-08 11:20:50'),(159,7,7,1063,10,2,14,0,'2015-04-08 11:23:02'),(160,5,5,1041,10,23,14,0,'2015-04-08 11:23:29'),(161,11.36,11,1053,10,2,14,0.0316901408450704,'2015-04-08 11:23:34'),(162,12,12,1066,10,2,14,0,'2015-04-08 11:23:38'),(163,9.85,10,1049,10,2,14,0.0152284263959391,'2015-04-08 11:23:43'),(164,8.06,8,1045,10,2,14,0.00744416873449138,'2015-04-08 11:23:47'),(165,13.3,13,1058,10,2,14,0.0225563909774437,'2015-04-08 11:23:51'),(166,4.12,6,1040,10,2,14,0.45631067961165,'2015-04-08 11:23:55'),(167,9.43,9,1048,10,2,14,0.0455991516436903,'2015-04-08 11:23:59'),(168,14,13,1068,10,2,14,0.0714285714285714,'2015-04-08 11:24:04'),(169,11.7,11,1054,10,2,14,0.0598290598290598,'2015-04-08 11:24:59'),(170,13.89,13,1060,10,2,14,0.0640748740100792,'2015-04-08 11:25:03'),(171,5.74,6,1042,10,2,14,0.0452961672473867,'2015-04-08 11:25:07'),(172,13.6,14,1059,10,5,14,0.0294117647058824,'2015-04-08 11:25:14'),(173,8.54,6,1046,10,2,14,0.297423887587822,'2015-04-08 11:25:18'),(174,6.4,9,1043,10,4,14,0.40625,'2015-04-08 11:25:24'),(175,10.63,10,1051,10,2,14,0.059266227657573,'2015-04-08 11:25:28'),(176,10,10,1065,10,1,14,0,'2015-04-08 11:25:32'),(177,12.69,13,1057,10,2,14,0.0244286840031521,'2015-04-08 11:25:36'),(178,7.55,6,1044,10,2,14,0.205298013245033,'2015-04-08 11:25:40'),(179,6,6,1062,10,3,14,0,'2015-04-08 11:25:52'),(180,11,10,1052,10,5,14,0.0909090909090909,'2015-04-08 12:00:24'),(181,32.5,34,968,1,10,14,0.0461538461538462,'2015-04-08 20:00:20'),(182,73,463,977,1,4,14,1,'2015-04-08 20:00:26'),(183,28,28,967,1,1,14,0,'2015-04-08 20:00:29'),(184,127,127,989,1,2,14,0,'2015-04-08 20:00:33'),(185,158.5,2698,996,1,2,14,1,'2015-04-08 20:00:38'),(186,260,123,1021,1,2,14,0.526923076923077,'2015-04-08 20:00:42'),(187,345.5,15,1002,1,2,14,0.956584659913169,'2015-04-08 20:00:46'),(188,91,91,981,1,2,14,0,'2015-04-08 20:00:51'),(189,172,172,999,1,3,14,0,'2015-04-08 20:00:56'),(190,46,156,971,1,1,14,1,'2015-04-08 20:00:59'),(191,32,25,226,3,8,14,0.21875,'2015-04-08 20:04:59'),(192,146,6,284,3,12,14,0.958904109589041,'2015-04-08 20:05:15'),(193,1541,156,186,3,3,14,0.898767034393251,'2015-04-08 20:21:38'),(194,6,6,1114,8,3,16,0,'2015-04-11 13:39:23'),(195,20,20,1110,8,3,16,0,'2015-04-11 13:39:27'),(196,26,25,1111,8,2,16,0.0384615384615385,'2015-04-11 13:39:32'),(197,16,20,1107,8,2,16,0.25,'2015-04-11 13:39:36'),(198,8,8,1115,8,2,16,0,'2015-04-11 13:39:40'),(199,4,4,1118,8,2,16,0,'2015-04-11 13:39:44'),(200,7,7,1117,8,3,16,0,'2015-04-11 13:39:49'),(201,11,9,1116,8,3,16,0.181818181818182,'2015-04-11 13:39:54'),(202,7,11,1119,8,2,16,0.571428571428571,'2015-04-11 13:39:58'),(203,17,23,1109,8,3,16,0.352941176470588,'2015-04-11 13:40:03'),(204,13,23,1108,8,60,16,0.769230769230769,'2015-04-11 13:41:29'),(205,8,8,1115,8,3,16,0,'2015-04-11 13:41:34'),(206,4,4,1118,8,2,16,0,'2015-04-11 13:41:38'),(207,6,6,1114,8,2,16,0,'2015-04-11 13:41:42'),(208,15,17,1106,8,2,16,0.133333333333333,'2015-04-11 13:41:46'),(209,24,23,1112,8,2,16,0.0416666666666667,'2015-04-11 13:41:51'),(210,14,33,1113,8,2,16,1,'2015-04-11 13:41:55'),(211,7,7,1117,8,3,16,0,'2015-04-11 13:42:01'),(212,20,23,1110,8,2,16,0.15,'2015-04-11 13:42:05'),(213,26,35,1111,8,2,16,0.346153846153846,'2015-04-11 13:42:09'),(214,1024,1024,1135,9,4,16,0,'2015-04-11 13:44:08'),(215,32,34,1130,9,4,16,0.0625,'2015-04-11 13:44:14'),(216,128,256,1132,9,6,16,1,'2015-04-11 13:44:23'),(217,256,256,1133,9,3,16,0,'2015-04-11 13:44:28'),(218,169,166,1123,9,3,16,0.0177514792899408,'2015-04-11 13:44:33'),(219,144,144,1122,9,2,16,0,'2015-04-11 13:44:37'),(220,9,9,1047,10,2,16,0,'2015-04-11 13:44:50'),(221,13,13,1067,10,2,16,0,'2015-04-11 13:44:54'),(222,12,12,1066,10,2,16,0,'2015-04-11 13:44:57'),(223,7,7,1063,10,2,16,0,'2015-04-11 13:45:01'),(224,8.06,6,1045,10,2,16,0.255583126550869,'2015-04-11 13:45:05'),(225,4,4,1061,10,1,16,0,'2015-04-11 13:45:09'),(226,4,2,1148,15,60,18,0.5,'2015-04-12 17:30:47'),(227,4,4,1148,15,6,18,0,'2015-04-12 17:30:55');
/*!40000 ALTER TABLE `learning_floatmodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learning_hint`
--

DROP TABLE IF EXISTS `learning_hint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `learning_hint` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conceptQuestion_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `learning_hint_e097c232` (`conceptQuestion_id`),
  CONSTRAINT `conceptQuestion_id_refs_id_2b93a18c2cd36fb1` FOREIGN KEY (`conceptQuestion_id`) REFERENCES `learning_conceptquestion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning_hint`
--

LOCK TABLES `learning_hint` WRITE;
/*!40000 ALTER TABLE `learning_hint` DISABLE KEYS */;
INSERT INTO `learning_hint` VALUES (38,1),(39,2),(40,3),(129,4),(130,5),(131,6),(132,7),(30,36),(31,37),(32,38),(115,39),(116,40),(117,41),(118,42),(56,71),(57,72),(58,73),(154,74),(155,75),(156,76),(157,77),(52,106),(53,107),(54,108),(149,109),(150,110),(151,111),(152,112),(33,141),(34,142),(35,143),(119,144),(120,145),(121,146),(122,147),(25,176),(26,177),(27,178),(107,179),(108,180),(109,181),(110,182),(12,211),(13,212),(14,213),(78,214),(79,215),(80,216),(81,217),(23,246),(24,247),(104,248),(105,249),(106,250),(8,271),(9,272),(72,273),(73,274),(74,275),(4,296),(5,297),(64,298),(65,299),(66,300),(6,321),(7,322),(69,323),(70,324),(71,325),(41,346),(42,347),(133,348),(134,349),(135,350),(21,371),(22,372),(101,373),(102,374),(103,375),(10,396),(11,397),(75,398),(76,399),(77,400),(28,421),(111,422),(112,423),(20,440),(97,441),(98,442),(29,459),(113,460),(114,461),(19,476),(95,477),(96,478),(44,492),(139,493),(140,494),(45,508),(46,509),(47,510),(48,511),(49,512),(50,513),(51,514),(141,515),(142,516),(143,517),(144,518),(145,519),(146,520),(147,521),(148,522),(1,584),(2,585),(61,586),(62,587),(3,604),(63,605),(85,616),(16,624),(86,625),(99,636),(100,643),(90,652),(89,658),(60,664),(59,671),(55,677),(153,678),(82,687),(43,807),(136,808),(137,819),(88,825),(125,831),(67,840),(68,845),(87,851),(138,857),(37,864),(126,865),(127,866),(128,880),(17,886),(91,887),(92,896),(123,905),(36,913),(124,914),(18,923),(93,924),(94,934),(83,943),(15,952),(84,953);
/*!40000 ALTER TABLE `learning_hint` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=513 DEFAULT CHARSET=utf8;
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
-- Table structure for table `learning_params`
--

DROP TABLE IF EXISTS `learning_params`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `learning_params` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `concept_id` int(11) NOT NULL,
  `reverse` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `learning_params_8a386586` (`concept_id`),
  CONSTRAINT `concept_id_refs_id_33549d80f8b218d6` FOREIGN KEY (`concept_id`) REFERENCES `learning_concept` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning_params`
--

LOCK TABLES `learning_params` WRITE;
/*!40000 ALTER TABLE `learning_params` DISABLE KEYS */;
INSERT INTO `learning_params` VALUES (1,1,1),(2,1,0),(3,2,1),(4,2,0),(5,3,0),(6,4,1),(7,4,0),(8,5,0),(9,6,0),(10,7,1),(11,7,0),(12,8,0),(13,9,0),(14,10,1),(15,10,0),(16,11,1),(17,11,0),(18,12,0),(19,13,1),(20,13,0),(21,14,1),(22,14,0),(23,15,1),(24,15,0),(25,18,1),(26,18,0),(27,19,1),(28,19,0),(29,20,1),(30,20,0),(31,21,1),(32,21,0),(33,22,1),(34,22,0),(35,23,1),(36,23,0),(37,24,0),(38,25,0),(39,26,1),(40,26,0),(41,28,0),(42,29,1),(43,29,0),(44,30,1),(45,30,0),(46,31,0),(47,36,1),(48,36,0),(49,37,0),(50,38,1),(51,38,0),(52,39,0),(53,40,0),(54,41,1),(55,41,0),(56,47,0),(57,48,0),(58,49,0),(59,50,1),(60,50,0),(61,51,1),(62,51,0),(63,59,0),(64,60,1),(65,60,0),(66,62,0),(67,63,0),(68,64,0),(69,67,0),(70,70,0),(71,71,0),(72,72,0),(73,73,0),(74,74,0),(75,75,0),(76,76,0),(77,77,0),(78,78,0),(79,79,0),(80,80,0),(81,81,0),(82,82,0),(83,83,0),(84,84,0),(85,85,0),(86,86,0),(87,87,0),(88,88,0),(89,89,0),(90,90,0),(91,91,0),(92,92,0),(93,93,0),(94,94,0),(95,95,0),(96,96,0),(97,97,0),(98,98,0),(99,99,0),(100,100,0),(101,101,0),(102,102,0),(103,103,0),(104,104,0),(105,105,0),(106,106,0),(107,107,0),(108,108,0),(109,109,0),(110,110,0),(111,111,0),(112,112,0),(113,113,0),(114,114,0),(115,115,0),(116,116,0),(117,117,0),(118,118,0),(119,119,0),(120,120,0),(121,121,0),(122,122,0),(123,123,0),(124,124,0),(125,125,0),(126,126,0),(127,127,0),(128,128,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning_type`
--

LOCK TABLES `learning_type` WRITE;
/*!40000 ALTER TABLE `learning_type` DISABLE KEYS */;
INSERT INTO `learning_type` VALUES (1,'angle'),(2,'c'),(3,'curr'),(4,'e'),(5,'equa'),(6,'len'),(7,'line'),(8,'obj'),(15,'objsVol'),(9,'sqr'),(10,'sqrt'),(11,'surf'),(12,'temp'),(13,'vol'),(14,'water');
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
  CONSTRAINT `concept_id_refs_id_1da79edbe78b9195` FOREIGN KEY (`concept_id`) REFERENCES `learning_concept` (`id`),
  CONSTRAINT `user_id_refs_id_36ffc26e7528aad` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=540 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning_userskill`
--

LOCK TABLES `learning_userskill` WRITE;
/*!40000 ALTER TABLE `learning_userskill` DISABLE KEYS */;
INSERT INTO `learning_userskill` VALUES (1,2,0,62,0),(2,2,0,7,0),(3,2,0,28,0),(4,2,0,31,0),(5,2,0,37,0),(6,2,0,47,0),(7,2,0,63,0),(8,2,0,67,0),(9,2,0,3,0),(10,2,0,5,0),(11,2,0,6,0),(12,2,0,24,0),(13,2,0,25,0),(14,2,0,48,0),(15,3,0,3,0),(16,3,0,5,0),(17,3,0,6,0),(18,3,0,7,0),(19,3,0,24,0),(20,3,0,25,0),(21,3,0,48,0),(22,4,0,3,0),(23,4,0,5,0),(24,4,0,6,0),(25,4,0,7,0),(26,4,0,24,0),(27,4,0,25,0),(28,4,0,48,0),(29,4,0,1,0),(30,4,0,2,0),(31,4,0,9,0),(32,4,0,11,0),(33,4,0,18,0),(34,4,0,23,0),(35,4,0,64,0),(36,4,0,31,0),(37,5,0,3,0),(38,5,0,5,0),(39,5,0,6,0),(40,5,0,7,0),(41,5,0,24,0),(42,5,0,25,0),(43,5,0,28,0),(44,5,0,31,0),(45,5,0,37,0),(46,5,0,47,0),(47,5,0,48,0),(48,5,0,63,0),(49,5,0,67,0),(50,5,0,62,0),(51,6,1,62,0),(52,6,0,14,0),(53,6,0,15,0),(54,6,0,22,0),(55,6,0,26,0),(56,6,0,30,0),(57,6,0,36,0),(58,6,0,59,0),(59,6,0,60,0),(60,6,0,3,0),(61,6,0,5,0),(62,6,0,6,0),(63,6,0,7,0),(64,6,0,24,0),(65,6,0,25,0),(66,6,0,28,0),(67,6,0,31,0),(68,6,0,37,0),(69,6,0,47,0),(70,6,0,48,0),(71,6,0,63,0),(72,6,0,67,0),(73,6,0,93,0),(74,6,0,94,0),(75,6,0,95,0),(76,6,0,96,0),(77,6,0,97,0),(78,6,0,98,0),(79,6,0,99,0),(80,6,0,100,0),(81,6,0,101,0),(82,7,0.114738384285082,62,0),(83,7,0,3,0),(84,7,0,5,0),(85,7,0,6,0),(86,7,0,7,0),(87,7,0,24,0),(88,7,0,25,0),(89,7,0,28,0),(90,7,0,31,0),(91,7,0,37,0),(92,7,0,47,0),(93,7,0,48,0),(94,7,0,63,0),(95,7,0,67,0),(96,8,0,3,0),(97,8,0,5,0),(98,8,0,6,0),(99,8,0,7,0),(100,8,0,24,0),(101,8,0,25,0),(102,8,0,28,0),(103,8,0,31,0),(104,8,0.68,37,0),(105,8,0,47,0),(106,8,0,48,0),(107,8,0,63,0),(108,8,0,67,0),(109,8,0.673711061802768,62,0),(110,8,0,102,0),(111,8,0,103,0),(112,8,0,104,0),(113,8,0,105,0),(114,8,0,106,0),(115,8,0,107,0),(116,8,0,108,0),(117,8,0,109,0),(118,8,0,110,0),(119,8,0,111,0),(120,8,0,112,0),(121,8,0,113,0),(122,9,0,4,0),(123,9,0,10,0),(124,9,0,13,0),(125,9,0,19,0),(126,9,0,20,0),(127,9,0,38,0),(128,9,0,39,0),(129,9,0,41,0),(130,9,0,49,0),(131,9,0,50,0),(132,9,0,1,0),(133,9,0,2,0),(134,9,0,9,0),(135,9,0,11,0),(136,9,0,18,0),(137,9,0,23,0),(138,9,0,64,0),(139,9,0,62,0),(140,9,0,8,0),(141,9,0,40,0),(142,9,0,7,0),(143,9,0,28,0),(144,9,0,31,0),(145,9,0,37,0),(146,9,0,47,0),(147,9,0,63,0),(148,9,0,67,0),(149,9,0,12,0),(150,9,0,82,0),(151,9,0,83,0),(152,9,0,84,0),(153,9,0,85,0),(154,9,0,86,0),(155,9,0,87,0),(156,9,0,88,0),(157,9,0,89,0),(158,9,0,90,0),(159,9,0,91,0),(160,9,0,92,0),(161,9,0,70,0),(162,9,0,71,0),(163,9,0,72,0),(164,9,0,73,0),(165,9,0,74,0),(166,9,0,75,0),(167,9,0,76,0),(168,9,0,77,0),(169,9,0,78,0),(170,9,0,79,0),(171,9,0,80,0),(172,9,0,81,0),(173,9,0,102,0),(174,9,0,103,0),(175,9,0,104,0),(176,9,0,105,0),(177,9,0,106,0),(178,9,0,107,0),(179,9,0,108,0),(180,9,0,109,0),(181,9,0,110,0),(182,9,0,111,0),(183,9,0,112,0),(184,9,0,113,0),(185,9,0,93,0),(186,9,0,94,0),(187,9,0,95,0),(188,9,0,96,0),(189,9,0,97,0),(190,9,0,98,0),(191,9,0,99,0),(192,9,0,100,0),(193,9,0,101,0),(194,11,0,3,0),(195,11,0,5,0),(196,11,0,6,0),(197,11,0,7,0),(198,11,0,24,0),(199,11,0,25,0),(200,11,0,48,0),(201,11,0,4,0),(202,11,0,10,0),(203,11,0,13,0),(204,11,0,19,0),(205,11,0,20,0),(206,11,0,38,0),(207,11,0,39,0),(208,11,0,41,0),(209,11,0,49,0),(210,11,0,50,0),(211,11,0,28,0),(212,11,0,31,0),(213,11,0,37,0),(214,11,0,47,0),(215,11,0,63,0),(216,11,0,67,0),(217,11,0,8,0),(218,11,0.05321489001692,40,0),(219,11,0,1,0),(220,11,0,2,0),(221,11,0,9,0),(222,11,0,11,0),(223,11,0,18,0),(224,11,0,23,0),(225,11,0,64,0),(226,11,0,21,0),(227,11,0,29,0),(228,11,0,51,0),(229,11,0,14,0),(230,11,0,15,0),(231,11,0,22,0),(232,11,0,26,0),(233,11,0,30,0),(234,11,0,36,0),(235,11,0,59,0),(236,11,0,60,0),(237,11,0,102,0),(238,11,0,103,0),(239,11,0,104,0),(240,11,0,105,0),(241,11,0,106,0),(242,11,0,107,0),(243,11,0,108,0),(244,11,0,109,0),(245,11,0,110,0),(246,11,0,111,0),(247,11,0,112,0),(248,11,0,113,0),(249,11,1,62,0),(250,11,0,93,0),(251,11,0,94,0),(252,11,0,95,0),(253,11,0,96,0),(254,11,0,97,0),(255,11,0,98,0),(256,11,0,99,0),(257,11,1,100,0),(258,11,0,101,0),(259,12,0,1,0),(260,12,0,2,0),(261,12,0,9,0),(262,12,0,11,0),(263,12,0,18,0),(264,12,0,23,0),(265,12,0,64,0),(266,12,0,4,0),(267,12,0,10,0),(268,12,0,13,0),(269,12,0,19,0),(270,12,0,20,0),(271,12,0,38,0),(272,12,0,39,0),(273,12,0,41,0),(274,12,0,49,0),(275,12,0,50,0),(276,12,0,70,0),(277,12,0,71,0),(278,12,0,72,0),(279,12,0,73,0),(280,12,0,74,0),(281,12,0,75,0),(282,12,0,76,0),(283,12,0,77,0),(284,12,0,78,0),(285,12,0,79,0),(286,12,0,80,0),(287,12,0,81,0),(288,12,0,31,0),(289,12,0,93,0),(290,12,0,94,0),(291,12,0,95,0),(292,12,0,96,0),(293,12,0,97,0),(294,12,0,98,0),(295,12,0,99,0),(296,12,0,100,0),(297,12,0,101,0),(298,12,0,8,0),(299,12,0,40,0),(300,12,1,62,0),(301,12,0,102,0),(302,12,0,103,0),(303,12,0,104,0),(304,12,0,105,0),(305,12,0,106,0),(306,12,0,107,0),(307,12,0,108,0),(308,12,0,109,0),(309,12,0,110,0),(310,12,0,111,0),(311,12,0,112,0),(312,12,0,113,0),(313,13,0,93,0),(314,13,0,94,0),(315,13,0,95,0),(316,13,0,96,0),(317,13,0,97,0),(318,13,0,98,0),(319,13,0,99,0),(320,13,0,100,0),(321,13,0,101,0),(322,13,0,3,0),(323,13,0,5,0),(324,13,0,6,0),(325,13,0,7,0),(326,13,0,24,0),(327,13,0,25,0),(328,13,0,48,0),(329,13,0,8,0),(330,13,0,40,0),(331,13,0,4,0),(332,13,0,10,0),(333,13,0,13,0),(334,13,0,19,0),(335,13,0,20,0),(336,13,0,38,0),(337,13,0,39,0),(338,13,0,41,0),(339,13,0,49,0),(340,13,0,50,0),(341,13,0,14,0),(342,13,0,15,0),(343,13,0,22,0),(344,13,0,26,0),(345,13,0,30,0),(346,13,0,36,0),(347,13,0,59,0),(348,13,0,60,0),(349,13,0,62,0),(350,14,0.911719118831555,62,0),(351,14,0,3,0),(352,14,0,5,0),(353,14,0,6,0),(354,14,0,7,0),(355,14,0,24,0),(356,14,0,25,0),(357,14,0,48,0),(358,14,0,8,0),(359,14,0,40,0),(360,14,0,12,0),(361,14,0,102,0),(362,14,0,103,0),(363,14,0,104,0),(364,14,0,105,0),(365,14,0,106,0),(366,14,0,107,0),(367,14,0,108,0),(368,14,0,109,0),(369,14,0,110,0),(370,14,0,111,0),(371,14,0,112,0),(372,14,0,113,0),(373,14,0,4,0),(374,14,0,10,0),(375,14,0,13,0),(376,14,0,19,0),(377,14,0,20,0),(378,14,0,38,0),(379,14,0,39,0),(380,14,0,41,0),(381,14,0,49,0),(382,14,0,50,0),(383,14,0,28,0),(384,14,0,31,0),(385,14,0,37,0),(386,14,0,47,0),(387,14,0,63,0),(388,14,0,67,0),(389,14,0,93,0),(390,14,0,94,0),(391,14,0,95,0),(392,14,0,96,0),(393,14,0,97,0),(394,14,0,98,0),(395,14,0,99,0),(396,14,0,100,0),(397,14,0,101,0),(398,14,0,70,0),(399,14,0,71,0),(400,14,0,72,0),(401,14,0,73,0),(402,14,0,74,0),(403,14,0,75,0),(404,14,0,76,0),(405,14,0,77,0),(406,14,0,78,0),(407,14,0,79,0),(408,14,0,80,0),(409,14,0,81,0),(410,14,0,82,0),(411,14,0,83,0),(412,14,0,84,0),(413,14,0,85,0),(414,14,0,86,0),(415,14,0,87,0),(416,14,0,88,0),(417,14,0,89,0),(418,14,0,90,0),(419,14,0,91,0),(420,14,0,92,0),(421,14,0,21,0),(422,14,0,29,0),(423,14,0,51,0),(424,14,0,14,0),(425,14,0,15,0),(426,14,0,22,0),(427,14,0,26,0),(428,14,0,30,0),(429,14,0,36,0),(430,14,0,59,0),(431,14,0,60,0),(432,15,0,3,0),(433,15,0,5,0),(434,15,0,6,0),(435,15,0,7,0),(436,15,0,24,0),(437,15,0,25,0),(438,15,0,48,0),(439,15,0,70,0),(440,15,0,71,0),(441,15,0,72,0),(442,15,0,73,0),(443,15,0,74,0),(444,15,0,75,0),(445,15,0,76,0),(446,15,0,77,0),(447,15,0,78,0),(448,15,0,79,0),(449,15,0,80,0),(450,15,0,81,0),(451,15,0,12,0),(452,15,0,4,0),(453,15,0,10,0),(454,15,0,13,0),(455,15,0,19,0),(456,15,0,20,0),(457,15,0,38,0),(458,15,0,39,0),(459,15,0,41,0),(460,15,0,49,0),(461,15,0,50,0),(462,15,0,8,0),(463,15,0,40,0),(464,15,0,62,0),(465,16,1,62,0),(466,16,0,8,0),(467,16,0,40,0),(468,16,0,82,0),(469,16,0,83,0),(470,16,0,84,0),(471,16,0,85,0),(472,16,0,86,0),(473,16,1,87,0),(474,16,1,88,0),(475,16,0,89,0),(476,16,1,90,0),(477,16,1,91,0),(478,16,0,92,0),(479,16,0,12,0),(480,16,0,70,0),(481,16,0,71,0),(482,16,0,72,0),(483,16,0,73,0),(484,16,0,74,0),(485,16,0,75,0),(486,16,0,76,0),(487,16,0,77,0),(488,16,0,78,0),(489,16,0,79,0),(490,16,0,80,0),(491,16,0,81,0),(492,16,0.963116241144282,93,0),(493,16,0,94,0),(494,16,0,95,0),(495,16,0,96,0),(496,16,0,97,0),(497,16,0,98,0),(498,16,0.68,99,0),(499,16,0,100,0),(500,16,0.566666666666667,101,0),(501,17,0,114,0),(502,18,0,3,0),(503,18,0,5,0),(504,18,0,6,0),(505,18,0,7,0),(506,18,0,24,0),(507,18,0,25,0),(508,18,0,28,0),(509,18,0,31,0),(510,18,0,37,0),(511,18,0,47,0),(512,18,0,48,0),(513,18,0,63,0),(514,18,0,67,0),(515,18,0,82,0),(516,18,0,83,0),(517,18,0,84,0),(518,18,0,85,0),(519,18,0,86,0),(520,18,0,87,0),(521,18,0,88,0),(522,18,0,89,0),(523,18,0,90,0),(524,18,0,91,0),(525,18,0,92,0),(526,18,0,62,0),(527,18,0,102,0),(528,18,0,103,0),(529,18,0,104,0),(530,18,0,105,0),(531,18,0,106,0),(532,18,0,107,0),(533,18,0,108,0),(534,18,0,109,0),(535,18,0,110,0),(536,18,0,111,0),(537,18,0,112,0),(538,18,0,113,0),(539,18,0.951007429080312,114,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_usersocialauth`
--

LOCK TABLES `social_auth_usersocialauth` WRITE;
/*!40000 ALTER TABLE `social_auth_usersocialauth` DISABLE KEYS */;
INSERT INTO `social_auth_usersocialauth` VALUES (1,10,'google-oauth2','romanorlicek@gmail.com','{\"token_type\": \"Bearer\", \"access_token\": \"ya29.TAGSQ9lUjGTZ9rPKkIEJSCcNLeI4IfG93QJ1gO7gEitfVHvOJHk9clEl9NPTe8DvF6TcC9fSs9uEjA\", \"expires\": 3598}');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `south_migrationhistory`
--

LOCK TABLES `south_migrationhistory` WRITE;
/*!40000 ALTER TABLE `south_migrationhistory` DISABLE KEYS */;
INSERT INTO `south_migrationhistory` VALUES (1,'learning','0001_initial','2015-04-03 16:35:53'),(2,'lazysignup','0001_initial','2015-04-03 16:36:14'),(3,'social_auth','0001_initial','2015-04-03 16:36:27'),(4,'learning','0002_auto__del_field_conceptquestion_hint','2015-04-04 10:30:41'),(5,'learning','0003_auto__add_hint','2015-04-04 10:34:31');
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

-- Dump completed on 2015-04-12 21:02:23
