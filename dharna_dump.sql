-- MySQL dump 10.13  Distrib 5.5.58, for Linux (x86_64)
--
-- Host: localhost    Database: dharna_app
-- ------------------------------------------------------
-- Server version	5.5.58

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
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
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
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add auth user user permissions',7,'add_authuseruserpermissions'),(20,'Can change auth user user permissions',7,'change_authuseruserpermissions'),(21,'Can delete auth user user permissions',7,'delete_authuseruserpermissions'),(22,'Can add school details',8,'add_schooldetails'),(23,'Can change school details',8,'change_schooldetails'),(24,'Can delete school details',8,'delete_schooldetails'),(25,'Can add entity table',9,'add_entitytable'),(26,'Can change entity table',9,'change_entitytable'),(27,'Can delete entity table',9,'delete_entitytable'),(28,'Can add teacher detail',10,'add_teacherdetail'),(29,'Can change teacher detail',10,'change_teacherdetail'),(30,'Can delete teacher detail',10,'delete_teacherdetail'),(31,'Can add auth group',11,'add_authgroup'),(32,'Can change auth group',11,'change_authgroup'),(33,'Can delete auth group',11,'delete_authgroup'),(34,'Can add django session',12,'add_djangosession'),(35,'Can change django session',12,'change_djangosession'),(36,'Can delete django session',12,'delete_djangosession'),(37,'Can add auth group permissions',13,'add_authgrouppermissions'),(38,'Can change auth group permissions',13,'change_authgrouppermissions'),(39,'Can delete auth group permissions',13,'delete_authgrouppermissions'),(40,'Can add django admin log',14,'add_djangoadminlog'),(41,'Can change django admin log',14,'change_djangoadminlog'),(42,'Can delete django admin log',14,'delete_djangoadminlog'),(43,'Can add teacher login',15,'add_teacherlogin'),(44,'Can change teacher login',15,'change_teacherlogin'),(45,'Can delete teacher login',15,'delete_teacherlogin'),(46,'Can add auth user groups',16,'add_authusergroups'),(47,'Can change auth user groups',16,'change_authusergroups'),(48,'Can delete auth user groups',16,'delete_authusergroups'),(49,'Can add django content type',17,'add_djangocontenttype'),(50,'Can change django content type',17,'change_djangocontenttype'),(51,'Can delete django content type',17,'delete_djangocontenttype'),(52,'Can add student detail',18,'add_studentdetail'),(53,'Can change student detail',18,'change_studentdetail'),(54,'Can delete student detail',18,'delete_studentdetail'),(55,'Can add django migrations',19,'add_djangomigrations'),(56,'Can change django migrations',19,'change_djangomigrations'),(57,'Can delete django migrations',19,'delete_djangomigrations'),(58,'Can add auth user',20,'add_authuser'),(59,'Can change auth user',20,'change_authuser'),(60,'Can delete auth user',20,'delete_authuser'),(61,'Can add student login',21,'add_studentlogin'),(62,'Can change student login',21,'change_studentlogin'),(63,'Can delete student login',21,'delete_studentlogin'),(64,'Can add auth permission',22,'add_authpermission'),(65,'Can change auth permission',22,'change_authpermission'),(66,'Can delete auth permission',22,'delete_authpermission'),(67,'Can add lecture student',23,'add_lecturestudent'),(68,'Can change lecture student',23,'change_lecturestudent'),(69,'Can delete lecture student',23,'delete_lecturestudent'),(70,'Can add lecture teacher',24,'add_lectureteacher'),(71,'Can change lecture teacher',24,'change_lectureteacher'),(72,'Can delete lecture teacher',24,'delete_lectureteacher');
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
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
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
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
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
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(11,'test_app','authgroup'),(13,'test_app','authgrouppermissions'),(22,'test_app','authpermission'),(20,'test_app','authuser'),(16,'test_app','authusergroups'),(7,'test_app','authuseruserpermissions'),(14,'test_app','djangoadminlog'),(17,'test_app','djangocontenttype'),(19,'test_app','djangomigrations'),(12,'test_app','djangosession'),(9,'test_app','entitytable'),(23,'test_app','lecturestudent'),(24,'test_app','lectureteacher'),(8,'test_app','schooldetails'),(18,'test_app','studentdetail'),(21,'test_app','studentlogin'),(10,'test_app','teacherdetail'),(15,'test_app','teacherlogin');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-07-05 18:24:27'),(2,'auth','0001_initial','2017-07-05 18:24:28'),(3,'admin','0001_initial','2017-07-05 18:24:28'),(4,'admin','0002_logentry_remove_auto_add','2017-07-05 18:24:28'),(5,'contenttypes','0002_remove_content_type_name','2017-07-05 18:24:28'),(6,'auth','0002_alter_permission_name_max_length','2017-07-05 18:24:28'),(7,'auth','0003_alter_user_email_max_length','2017-07-05 18:24:28'),(8,'auth','0004_alter_user_username_opts','2017-07-05 18:24:28'),(9,'auth','0005_alter_user_last_login_null','2017-07-05 18:24:28'),(10,'auth','0006_require_contenttypes_0002','2017-07-05 18:24:28'),(11,'auth','0007_alter_validators_add_error_messages','2017-07-05 18:24:28'),(12,'auth','0008_alter_user_username_max_length','2017-07-05 18:24:28'),(13,'sessions','0001_initial','2017-07-05 18:24:28'),(14,'test_app','0001_initial','2017-07-05 18:24:28'),(15,'test_app','0002_lecturestudent_lectureteacher','2017-07-30 22:50:22');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
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
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('5pm72f3u6vgy9hmuorusshoj8fz45vbh','YTc3NWM0OTEyZWE2NmNlYjIzNjg0NzFhMDZlZTljM2I5N2IzNGZkYzp7InVzZXJuYW1lIjoidW4xIiwibG9nZ2VkX2luIjp0cnVlLCJ0eXBlIjoic3R1ZGVudCIsImlkIjozfQ==','2017-09-30 15:25:32'),('5zkkcqjykt2ha83bo2cd4954auop5mi7','OWM1MjM2ZTQ4MGFjODBiOTA3YjY2ZTNhMjZlNGQzMDI3YzE3NWRkZjp7InVzZXJuYW1lIjoic2hhdGFiZGkiLCJsb2dnZWRfaW4iOnRydWUsImlkIjoxLCJ0eXBlIjoidGVhY2hlciJ9','2017-11-06 16:52:51'),('chn0725d080637cf06b4cf2f4efa18d4','ZDM4N2U0NzRiMjVmZTFhNWY4ZGViNjBhNWI5ZjViZDAzYmIwMmU3OTp7InJvb20iOiJjaGF0IiwidXNlciI6InNoYXRhYmRpIn0=','2017-07-23 05:45:45'),('chn0f3736896477d5c90f523339f44e2','ZWViZjgwMzg3YTZmNmNmYjE0M2IwZjE2OGZiNDI1MGNkNjJhYmQ3MTp7InJvb20iOiJjaGF0IiwidXNlciI6Im1vaGl0In0=','2017-07-20 18:22:04'),('chn198c133b19932030edf426813d31c','ZWViZjgwMzg3YTZmNmNmYjE0M2IwZjE2OGZiNDI1MGNkNjJhYmQ3MTp7InJvb20iOiJjaGF0IiwidXNlciI6Im1vaGl0In0=','2017-07-23 05:21:43'),('chn21b4d92f27090d69c6a13550506f7','ZDM4N2U0NzRiMjVmZTFhNWY4ZGViNjBhNWI5ZjViZDAzYmIwMmU3OTp7InJvb20iOiJjaGF0IiwidXNlciI6InNoYXRhYmRpIn0=','2017-07-23 05:37:24'),('chn3a0514c8d8ec8e5cc1cbeb7e8dd79','ZDM4N2U0NzRiMjVmZTFhNWY4ZGViNjBhNWI5ZjViZDAzYmIwMmU3OTp7InJvb20iOiJjaGF0IiwidXNlciI6InNoYXRhYmRpIn0=','2017-07-20 18:20:00'),('chn4858249b1ccba8d60ef92523b63e7','ZWViZjgwMzg3YTZmNmNmYjE0M2IwZjE2OGZiNDI1MGNkNjJhYmQ3MTp7InJvb20iOiJjaGF0IiwidXNlciI6Im1vaGl0In0=','2017-07-20 18:20:36'),('chn4a437fef0828912cc28c0915789cc','NGNiZjk3ZTJkYzdmNWNkNjRmOTI1ZjA2ODE1Zjk0ZGY4NzkyMDA3NTp7InJvb20iOiJjaGF0Tm9uZSIsInVzZXIiOiJ1bjEifQ==','2017-09-30 15:29:52'),('chn626e61cdc9101854cc391af68925d','ZDM4N2U0NzRiMjVmZTFhNWY4ZGViNjBhNWI5ZjViZDAzYmIwMmU3OTp7InJvb20iOiJjaGF0IiwidXNlciI6InNoYXRhYmRpIn0=','2017-07-23 05:42:22'),('chn780c1e924db5149e4810a44d77db9','ZDM4N2U0NzRiMjVmZTFhNWY4ZGViNjBhNWI5ZjViZDAzYmIwMmU3OTp7InJvb20iOiJjaGF0IiwidXNlciI6InNoYXRhYmRpIn0=','2017-08-07 19:11:06'),('chn7d2b1e87f3b5d5f59a2cfd4a80a0b','ZWViZjgwMzg3YTZmNmNmYjE0M2IwZjE2OGZiNDI1MGNkNjJhYmQ3MTp7InJvb20iOiJjaGF0IiwidXNlciI6Im1vaGl0In0=','2017-07-23 05:23:39'),('chn9de64a407d71543a21958b4ecbbc2','NGNiZjk3ZTJkYzdmNWNkNjRmOTI1ZjA2ODE1Zjk0ZGY4NzkyMDA3NTp7InJvb20iOiJjaGF0Tm9uZSIsInVzZXIiOiJ1bjEifQ==','2017-09-30 15:27:04'),('chncbe20b818ec3e984db929c528c2c1','ZDM4N2U0NzRiMjVmZTFhNWY4ZGViNjBhNWI5ZjViZDAzYmIwMmU3OTp7InJvb20iOiJjaGF0IiwidXNlciI6InNoYXRhYmRpIn0=','2017-07-20 18:22:56'),('chnd2723db10ab31f91e0dc790dd40fa','OTM1NjZlMDcyMWE5ZTkyNWU1YjI1NGUxZDdhOGRiNTM3OTViN2JhNzp7InJvb20iOiJjaGF0MTAiLCJ1c2VyIjoidW4xIn0=','2017-11-06 16:51:47'),('chne08316ded3efef520de542fa161d2','ZDM4N2U0NzRiMjVmZTFhNWY4ZGViNjBhNWI5ZjViZDAzYmIwMmU3OTp7InJvb20iOiJjaGF0IiwidXNlciI6InNoYXRhYmRpIn0=','2017-07-23 05:46:05'),('chne9bc1a47f321a398452433f3c24ea','ZWViZjgwMzg3YTZmNmNmYjE0M2IwZjE2OGZiNDI1MGNkNjJhYmQ3MTp7InJvb20iOiJjaGF0IiwidXNlciI6Im1vaGl0In0=','2017-07-23 05:22:25'),('chnf7d8c5a1246ee019081c2de805c01','ZDM4N2U0NzRiMjVmZTFhNWY4ZGViNjBhNWI5ZjViZDAzYmIwMmU3OTp7InJvb20iOiJjaGF0IiwidXNlciI6InNoYXRhYmRpIn0=','2017-07-23 05:44:08'),('chnf9452285f4201a6dfa88d44b46453','YWVlOGZkMzk5NjhmZDAyNGM3YzIzNzAxZTdiZTUxZDZlMTljMWE1ZTp7InJvb20iOiJjaGF0MTAiLCJ1c2VyIjoic2hhdGFiZGkifQ==','2017-11-06 16:51:22'),('cm9q50b1m6v8o9qc7z6evjc3r7t25ffr','YTc3NWM0OTEyZWE2NmNlYjIzNjg0NzFhMDZlZTljM2I5N2IzNGZkYzp7InVzZXJuYW1lIjoidW4xIiwibG9nZ2VkX2luIjp0cnVlLCJ0eXBlIjoic3R1ZGVudCIsImlkIjozfQ==','2017-09-30 15:26:58'),('miugpx4fw4cxi9p62r98fu080ggwjxs7','YTE2MWQ4YzM1MzE0MDczOTc1OTNjZThiZTQ3NzgyNzE2NzNhOTg3MDp7InVzZXJuYW1lIjoic2hhdGFiZGkiLCJsb2dnZWRfaW4iOnRydWUsInR5cGUiOiJ0ZWFjaGVyIiwiaWQiOjF9','2017-08-13 23:03:28'),('rgg8u81xt0h5pccwng9d13cibjduplyo','YTc3NWM0OTEyZWE2NmNlYjIzNjg0NzFhMDZlZTljM2I5N2IzNGZkYzp7InVzZXJuYW1lIjoidW4xIiwibG9nZ2VkX2luIjp0cnVlLCJ0eXBlIjoic3R1ZGVudCIsImlkIjozfQ==','2017-11-06 16:52:45'),('udqszasppo8sgs70up6s81r535avmeef','YTc3NWM0OTEyZWE2NmNlYjIzNjg0NzFhMDZlZTljM2I5N2IzNGZkYzp7InVzZXJuYW1lIjoidW4xIiwibG9nZ2VkX2luIjp0cnVlLCJ0eXBlIjoic3R1ZGVudCIsImlkIjozfQ==','2017-09-30 15:28:46');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_table`
--

DROP TABLE IF EXISTS `entity_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_table` (
  `entity_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `class` int(11) NOT NULL,
  `section` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `entity_param` (`class`,`section`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_table`
--

LOCK TABLES `entity_table` WRITE;
/*!40000 ALTER TABLE `entity_table` DISABLE KEYS */;
INSERT INTO `entity_table` VALUES (2,5,NULL),(1,5,'A'),(3,6,NULL),(4,7,NULL),(5,8,NULL),(6,9,NULL),(7,10,NULL),(8,11,NULL),(9,12,NULL);
/*!40000 ALTER TABLE `entity_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecture_student`
--

DROP TABLE IF EXISTS `lecture_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lecture_student` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `student_id` mediumint(9) NOT NULL,
  `lecture_id` bigint(20) NOT NULL,
  `present` varchar(1) NOT NULL,
  `attention_percent` float(3,2) DEFAULT NULL,
  `emotion_data` varchar(500) DEFAULT NULL,
  `attention_graph_link` varchar(1000) DEFAULT NULL,
  `emotion_graph_link` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id2` (`student_id`),
  KEY `lecture_id1` (`lecture_id`),
  CONSTRAINT `fkls_lecture_id` FOREIGN KEY (`lecture_id`) REFERENCES `lecture_teacher` (`lecture_id`),
  CONSTRAINT `fkls_student_id` FOREIGN KEY (`student_id`) REFERENCES `student_login` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecture_student`
--

LOCK TABLES `lecture_student` WRITE;
/*!40000 ALTER TABLE `lecture_student` DISABLE KEYS */;
INSERT INTO `lecture_student` VALUES (1,3,10,'Y',0.00,'no data','https://www.dropbox.com/s/iap0ezjevsd76f2/un1attention_data_2017_10_23_16_52_26.png?dl=0','https://www.dropbox.com/s/0wlaz7pxgakx7x0/un1emotion_data_2017_10_23_16_52_25.png?dl=0');
/*!40000 ALTER TABLE `lecture_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecture_teacher`
--

DROP TABLE IF EXISTS `lecture_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lecture_teacher` (
  `lecture_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `teacher_id` mediumint(9) NOT NULL,
  `entity_id` mediumint(9) NOT NULL,
  `school_id` mediumint(9) NOT NULL,
  `lecture_start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lecture_end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `subject` varchar(50) DEFAULT NULL,
  `topic` varchar(50) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  `status` varchar(1) DEFAULT 'N',
  PRIMARY KEY (`lecture_id`),
  KEY `fklt_entity_id` (`entity_id`),
  KEY `lecture_id` (`lecture_id`),
  KEY `teacher_id2` (`teacher_id`),
  KEY `school_id1` (`school_id`),
  CONSTRAINT `fklt_entity_id` FOREIGN KEY (`entity_id`) REFERENCES `entity_table` (`entity_id`),
  CONSTRAINT `fklt_school_id` FOREIGN KEY (`school_id`) REFERENCES `school_details` (`school_id`),
  CONSTRAINT `fklt_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teacher_login` (`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecture_teacher`
--

LOCK TABLES `lecture_teacher` WRITE;
/*!40000 ALTER TABLE `lecture_teacher` DISABLE KEYS */;
INSERT INTO `lecture_teacher` VALUES (1,1,2,1,'2017-07-31 11:45:00','2017-07-31 12:30:00','english','grammar','pronoun','N'),(2,1,2,1,'2017-10-23 16:30:00','2017-10-23 17:30:00','english','grammar','Pronouns','N'),(3,1,2,1,'2017-10-23 16:30:00','2017-10-23 17:30:00','English','grammar','pronoun','N'),(4,1,2,1,'2017-10-23 16:45:00','2017-10-23 17:30:00','English','grammar','pro','N'),(5,1,2,1,'2017-10-23 16:45:00','2017-10-23 17:30:00','English','grammar','Pro','N'),(6,1,2,1,'2017-10-23 16:45:00','2017-10-23 17:30:00','English','grammar','Pro','N'),(7,1,2,1,'2017-10-23 16:45:00','2017-10-23 17:30:00','English','grammar','Pro','N'),(8,1,2,1,'2017-10-23 16:45:00','2017-10-23 17:30:00','English','grammar','pro','N'),(9,1,2,1,'2017-10-23 17:00:00','2017-10-23 17:30:00','English','grammar','Pronoun','N'),(10,1,3,1,'2017-10-23 17:00:00','2017-10-23 17:30:00','English','grammar','nkm','E');
/*!40000 ALTER TABLE `lecture_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school_details`
--

DROP TABLE IF EXISTS `school_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `school_details` (
  `school_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `school_name` varchar(200) NOT NULL,
  `city` varchar(100) DEFAULT NULL,
  `district` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `pin` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`school_id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_details`
--

LOCK TABLES `school_details` WRITE;
/*!40000 ALTER TABLE `school_details` DISABLE KEYS */;
INSERT INTO `school_details` VALUES (1,'s1',NULL,NULL,NULL,NULL),(2,'s2',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `school_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_detail`
--

DROP TABLE IF EXISTS `student_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_detail` (
  `student_id` mediumint(9) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) NOT NULL,
  `school_id` mediumint(9) NOT NULL,
  `entity_id` mediumint(9) NOT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_id` (`student_id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `email` (`email`),
  KEY `student_id1` (`student_id`),
  KEY `sch_id` (`school_id`),
  KEY `ent_id` (`entity_id`),
  KEY `sch_ent_id` (`school_id`,`entity_id`),
  CONSTRAINT `fk_entity_id` FOREIGN KEY (`entity_id`) REFERENCES `entity_table` (`entity_id`),
  CONSTRAINT `fk_school_id` FOREIGN KEY (`school_id`) REFERENCES `school_details` (`school_id`),
  CONSTRAINT `fk_student_id` FOREIGN KEY (`student_id`) REFERENCES `student_login` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_detail`
--

LOCK TABLES `student_detail` WRITE;
/*!40000 ALTER TABLE `student_detail` DISABLE KEYS */;
INSERT INTO `student_detail` VALUES (1,'shatabdi',NULL,'singha',1,1,'1','a@b.c',1),(2,'mohit',NULL,'senapaty',1,1,'2','a1@b.c',2),(3,'fn1','mn1','ln1',1,3,'112','em1@id.com',3);
/*!40000 ALTER TABLE `student_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_login`
--

DROP TABLE IF EXISTS `student_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_login` (
  `student_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `username` (`username`),
  KEY `student_id` (`student_id`),
  KEY `std_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_login`
--

LOCK TABLES `student_login` WRITE;
/*!40000 ALTER TABLE `student_login` DISABLE KEYS */;
INSERT INTO `student_login` VALUES (1,'shatabdi','shatex'),(2,'mohit','ms'),(3,'un1','pwd1');
/*!40000 ALTER TABLE `student_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_detail`
--

DROP TABLE IF EXISTS `teacher_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher_detail` (
  `teacher_id` mediumint(9) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) NOT NULL,
  `school_id` mediumint(9) DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `teacher_id` (`teacher_id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `email` (`email`),
  KEY `fkt_school_id` (`school_id`),
  KEY `teacher_id1` (`teacher_id`),
  CONSTRAINT `fkt_school_id` FOREIGN KEY (`school_id`) REFERENCES `school_details` (`school_id`),
  CONSTRAINT `fkt_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teacher_login` (`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_detail`
--

LOCK TABLES `teacher_detail` WRITE;
/*!40000 ALTER TABLE `teacher_detail` DISABLE KEYS */;
INSERT INTO `teacher_detail` VALUES (1,'shatabdi',NULL,'singha',1,'1','a@b.c',1),(2,'mohit',NULL,'senapaty',1,'2','a1@b.c',2);
/*!40000 ALTER TABLE `teacher_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_login`
--

DROP TABLE IF EXISTS `teacher_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher_login` (
  `teacher_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`teacher_id`),
  UNIQUE KEY `username` (`username`),
  KEY `teacher_id` (`teacher_id`),
  KEY `tcr_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_login`
--

LOCK TABLES `teacher_login` WRITE;
/*!40000 ALTER TABLE `teacher_login` DISABLE KEYS */;
INSERT INTO `teacher_login` VALUES (1,'shatabdi','shatex'),(2,'mohit','ms');
/*!40000 ALTER TABLE `teacher_login` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-04 10:51:02
