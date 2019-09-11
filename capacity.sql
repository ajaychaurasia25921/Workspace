CREATE DATABASE  IF NOT EXISTS `fbecapacityplanningapp` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `fbecapacityplanningapp`;
-- MySQL dump 10.13  Distrib 5.7.25, for Win64 (x86_64)
--
-- Host: BLRCSWFBEIP0002    Database: fbecapacityplanningapp
-- ------------------------------------------------------
-- Server version	5.7.25-log

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
-- Table structure for table `app_property`
--

DROP TABLE IF EXISTS `app_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_property` (
  `property_id` char(36) NOT NULL COMMENT 'Unique identifier',
  `property_name` varchar(80) NOT NULL COMMENT 'Name of the application property',
  `property_desc` varchar(240) DEFAULT NULL COMMENT 'Brief description about the application property',
  `property_value_data_type` char(1) NOT NULL COMMENT 'Data type of the application property value',
  `property_value_text` varchar(240) DEFAULT NULL COMMENT 'Text value of the application property',
  `property_value_integer` int(10) unsigned DEFAULT NULL COMMENT 'Integer value of the application property',
  `property_value_decimal` decimal(18,3) unsigned DEFAULT NULL COMMENT 'Decimal value of the application property',
  `property_value_flag` char(1) DEFAULT NULL COMMENT 'Flag value of the application property',
  `property_value_date` date DEFAULT NULL COMMENT 'Date value of the application property',
  `property_value_datetime` datetime DEFAULT NULL COMMENT 'Date-time value of the application property',
  `active_flag` char(1) NOT NULL DEFAULT 'N' COMMENT 'Flag to denote whether the entity is marked as active or inactive',
  `created_by` char(36) NOT NULL COMMENT 'Audit: WHO created',
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Audit: WHEN created',
  `last_updated_by` varchar(36) NOT NULL,
  `last_updated_on` datetime DEFAULT NULL,
  `last_modified_by` varchar(50) DEFAULT NULL,
  `last_modified_on` datetime DEFAULT NULL,
  PRIMARY KEY (`property_id`),
  UNIQUE KEY `app_property_uk1` (`property_name`),
  KEY `app_property_ix1` (`active_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Application configurable properties';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_property`
--

LOCK TABLES `app_property` WRITE;
/*!40000 ALTER TABLE `app_property` DISABLE KEYS */;
INSERT INTO `app_property` VALUES ('0035810e-8d0f-11e9-a552-005056bf7e34','MAX_FETCH_ROWS','Maximum rows to be fetched','I',NULL,400,NULL,NULL,NULL,NULL,'Y','SEED','2019-06-12 18:08:48','',NULL,NULL,NULL),('0045810e-8d0f-11e9-a552-005056bf7e34','JIRA_API_BASE_URL','Base URL for JIRA REST APIs','T','https://almtools/jira/rest/api/2/search',NULL,NULL,NULL,NULL,NULL,'Y','SEED','2019-06-12 18:08:48','',NULL,NULL,NULL),('0055810e-8d0f-11e9-a552-005056bf7e34','JOB_SCHEDULE_CRON_FORMAT','CRON format for Job Scheduler','T','30 20 * * * ?',NULL,NULL,NULL,NULL,NULL,'Y','SEED','2019-06-12 18:08:48','',NULL,NULL,NULL),('0065810e-8d0f-11e9-a552-005056bf7e34','JIRA_API_REQUEST','Jira request','T','issuetype in (Story, defect, \'Technical task\', Improvement) AND project in (\'FB Platform\', \'FBE Core\', \'Fusion SSO\', \'FB UX Modernization\') and status not in (Closed, Verified,Built, Resolved, Done) and assignee!=null',NULL,NULL,NULL,NULL,NULL,'Y','SEED','2019-07-02 23:26:45','SEED','2019-07-02 23:26:45',NULL,NULL),('bcafea59-9cf2-11e9-bb66-005056bf7e34','WORK_DAY_DURATION_IN_HOURS','Work day duration in hours','I',NULL,8,NULL,NULL,NULL,NULL,'Y','SEED','2019-07-02 23:26:45','SEED','2019-07-02 23:26:45',NULL,NULL);
/*!40000 ALTER TABLE `app_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_role`
--

DROP TABLE IF EXISTS `app_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_role` (
  `role_id` char(36) NOT NULL COMMENT 'Unique identifier',
  `role_name` varchar(80) NOT NULL COMMENT 'Name of the application role',
  `role_desc` varchar(240) DEFAULT NULL COMMENT 'Brief description about the application role',
  `active_flag` char(1) NOT NULL DEFAULT 'N' COMMENT 'Flag to denote whether the entity is marked as active or inactive',
  `created_by` char(36) NOT NULL COMMENT 'Audit: WHO created',
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Audit: WHEN created',
  `last_updated_by` varchar(36) NOT NULL,
  `last_updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `app_role_uk1` (`role_name`),
  KEY `app_role_ix1` (`active_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Application roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_role`
--

LOCK TABLES `app_role` WRITE;
/*!40000 ALTER TABLE `app_role` DISABLE KEYS */;
INSERT INTO `app_role` VALUES ('002a2ed3-8d0f-11e9-a552-005056bf7e34','ADMINISTRATOR','Application Administrator','N','SEED','2019-06-12 18:08:48','admin','2019-06-24 12:44:41'),('002e496f-8d0f-11e9-a552-005056bf7e34','MANAGER','Manager','Y','SEED','2019-06-12 18:08:48','',NULL),('0031997c-8d0f-11e9-a552-005056bf7e34','APPUSER','Application User','Y','SEED','2019-06-12 18:08:48','',NULL),('003354cf-8d0f-11e9-a552-005056bf7e34','GUEST','Guest User','Y','SEED','2019-06-12 18:08:48','',NULL);
/*!40000 ALTER TABLE `app_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_user`
--

DROP TABLE IF EXISTS `app_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_user` (
  `user_id` char(36) NOT NULL COMMENT 'Unique identifier',
  `jira_id` decimal(18,0) unsigned NOT NULL COMMENT 'JIRA - User identifier',
  `jira_user_name` varchar(255) NOT NULL COMMENT 'JIRA - User name',
  `user_name` varchar(80) NOT NULL COMMENT 'User name',
  `user_email` varchar(80) NOT NULL COMMENT 'User email',
  `user_mobile` varchar(15) DEFAULT NULL COMMENT 'User mobile',
  `location_id` char(36) NOT NULL COMMENT 'Identifier of the user location',
  `employee_id` int(10) unsigned NOT NULL COMMENT 'Employee ID',
  `product_org_id` char(36) NOT NULL COMMENT 'Identifier of the product organization',
  `product_category_id` char(36) NOT NULL COMMENT 'Identifier of the product category',
  `product_function_id` char(36) NOT NULL COMMENT 'Identifier of the product functional area',
  `skill_set_id` char(36) NOT NULL COMMENT 'Identifier of the skill-set',
  `skill_level_id` char(36) NOT NULL COMMENT 'Identifier of the skill-level',
  `job_function_id` char(36) NOT NULL COMMENT 'Identifier of the job function',
  `encrypted_access_code` varchar(512) DEFAULT NULL COMMENT 'Encrypted access code',
  `manager_id` char(36) DEFAULT NULL COMMENT 'Identifier of the manager',
  `contributor_flag` char(1) NOT NULL DEFAULT 'Y' COMMENT 'Flag to denote whether the user is an individual contributor',
  `joined_date` date DEFAULT NULL COMMENT 'Date of joining',
  `created_by` char(36) NOT NULL,
  `created_on` datetime NOT NULL,
  `active_flag` char(1) DEFAULT NULL,
  `last_updated_by` char(36) NOT NULL,
  `last_updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `app_user_uk1` (`jira_id`),
  UNIQUE KEY `app_user_uk2` (`jira_user_name`),
  UNIQUE KEY `app_user_uk3` (`user_name`),
  UNIQUE KEY `app_user_uk4` (`user_email`),
  KEY `app_user_ix1` (`location_id`),
  KEY `app_user_ix2` (`employee_id`),
  KEY `app_user_ix3` (`product_org_id`),
  KEY `app_user_ix4` (`product_category_id`),
  KEY `app_user_ix5` (`product_function_id`),
  KEY `app_user_ix6` (`skill_set_id`),
  KEY `app_user_ix7` (`skill_level_id`),
  KEY `app_user_ix9` (`job_function_id`),
  KEY `app_user_ix10` (`contributor_flag`),
  KEY `app_user_fk7` (`manager_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Application users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_user`
--

LOCK TABLES `app_user` WRITE;
/*!40000 ALTER TABLE `app_user` DISABLE KEYS */;
INSERT INTO `app_user` VALUES ('03bc2038-374b-468d-a83b-f2ec818b5e2a',2156256,'john','john','john@finastra.com','7795616821','ff8aaa14-8d0e-11e9-a552-005056bf7e34',7181811,'ff5d5e69-8d0e-11e9-a552-005056bf7e34','ff734cda-8d0e-11e9-a552-005056bf7e34','ffc67691-8d0e-11e9-a552-005056bf7e34','ffd9271c-8d0e-11e9-a552-005056bf7e34','ffef757c-8d0e-11e9-a552-005056bf7e34','000aa5aa-8d0f-11e9-a552-005056bf7e34','y','jaypillai','y','2019-07-02','user','2019-07-03 11:36:12','N','user','2019-07-03 11:36:12'),('060f8ae6-46b1-4fd5-86c8-58c25c6d4169',21231141,'amulyalv','amulyalv','amulya.lv@finastra.com','9945435418','ff8aaa14-8d0e-11e9-a552-005056bf7e34',718194,'ff5d5e69-8d0e-11e9-a552-005056bf7e34','ff734cda-8d0e-11e9-a552-005056bf7e34','ffbfe88c-8d0e-11e9-a552-005056bf7e34','ffd0b277-8d0e-11e9-a552-005056bf7e34','fff4c9ba-8d0e-11e9-a552-005056bf7e34','000aa5aa-8d0f-11e9-a552-005056bf7e34','12','prithdeb','y','2018-09-07','admin','2019-06-19 11:07:29','N','anonymousUser','2019-07-02 09:09:12'),('087f530e-641e-4612-9217-785d4a8fca52',2112972,'vishwan0','vishwan0','vishwa.n@finastra.com','8660321031','ff8aaa14-8d0e-11e9-a552-005056bf7e34',718185,'ff5d5e69-8d0e-11e9-a552-005056bf7e34','ff734cda-8d0e-11e9-a552-005056bf7e34','ffbfe88c-8d0e-11e9-a552-005056bf7e34','ffd0b277-8d0e-11e9-a552-005056bf7e34','fff4c9ba-8d0e-11e9-a552-005056bf7e34','000aa5aa-8d0f-11e9-a552-005056bf7e34','12','prithdeb','y','2018-09-10','admin','2019-06-19 11:07:29','N','admin','2019-06-28 11:40:44'),('0abe421b-091a-4d0e-90d6-53fb78ddeec4',2112971,'asbindra','asbindra','ashna.bindra@finastra.com','9621166256','ff8aaa14-8d0e-11e9-a552-005056bf7e34',710222,'ff5d5e69-8d0e-11e9-a552-005056bf7e34','ff734cda-8d0e-11e9-a552-005056bf7e34','ffbfe88c-8d0e-11e9-a552-005056bf7e34','ffd0b277-8d0e-11e9-a552-005056bf7e34','fff4c9ba-8d0e-11e9-a552-005056bf7e34','000aa5aa-8d0f-11e9-a552-005056bf7e34','12','prithdeb','y','2015-07-01','admin','2019-06-19 11:07:29','N','admin','2019-06-20 12:38:15'),('0abe421b-091a-4d0e-90d6-53fb78ddeec5',2160014,'padmavat','padmavat','Padmavathi.T@finastra.com','9998887776','ff8aaa14-8d0e-11e9-a552-005056bf7e34',710500,'ff5d5e69-8d0e-11e9-a552-005056bf7e34','ff734cda-8d0e-11e9-a552-005056bf7e34','ffbfe88c-8d0e-11e9-a552-005056bf7e34','ffccbc9a-8d0e-11e9-a552-005056bf7e34','ffef757c-8d0e-11e9-a552-005056bf7e34','000fa216-8d0f-11e9-a552-005056bf7e34','12','prithdeb','Y','2018-10-09','admin','2019-06-19 11:07:29','Y','admin','2019-06-19 11:07:29'),('0abe421b-091a-4d0e-90d6-53fb78ddeee5',2159037,'suha.noorain','suha.noorain','Suha.Noorain@finastra.com','9998887777','ff8aaa14-8d0e-11e9-a552-005056bf7e34',710500,'ff5d5e69-8d0e-11e9-a552-005056bf7e34','ff734cda-8d0e-11e9-a552-005056bf7e34','ffbfe88c-8d0e-11e9-a552-005056bf7e34','ffccbc9a-8d0e-11e9-a552-005056bf7e34','ffef757c-8d0e-11e9-a552-005056bf7e34','000fa216-8d0f-11e9-a552-005056bf7e34','12','abilotia','Y','2018-10-09','admin','2019-06-19 11:07:29','Y','admin','2019-06-19 11:07:29'),('0dab274b-a675-453a-a427-3762b0bc0912',2112970,'surghosh','surghosh','surangana.ghosh@finastra.com','7760582510','ff8aaa14-8d0e-11e9-a552-005056bf7e34',718183,'ff5d5e69-8d0e-11e9-a552-005056bf7e34','ff734cda-8d0e-11e9-a552-005056bf7e34','ffbfe88c-8d0e-11e9-a552-005056bf7e34','ffccbc9a-8d0e-11e9-a552-005056bf7e34','fff4c9ba-8d0e-11e9-a552-005056bf7e34','000aa5aa-8d0f-11e9-a552-005056bf7e34','12','prithdeb','y','2018-09-10','admin','2019-06-19 11:07:29','y','admin','2019-06-19 11:07:29'),('12eae01f-0775-4846-9e04-45b060d3351c',39964,'ricky','ricky','ricky@finastra.com','7795616821','ff8aaa14-8d0e-11e9-a552-005056bf7e34',7000001,'ff5d5e69-8d0e-11e9-a552-005056bf7e34','ff734cda-8d0e-11e9-a552-005056bf7e34','ffc2d46d-8d0e-11e9-a552-005056bf7e34','ffd2d1af-8d0e-11e9-a552-005056bf7e34','fff78509-8d0e-11e9-a552-005056bf7e34','00040a46-8d0f-11e9-a552-005056bf7e34','y','jaypillai','y','2019-07-03','anonymousUser','2019-07-05 05:29:09','N','anonymousUser','2019-07-05 05:29:09'),('15313874-d290-49ee-aa82-eba68e2dd35c',80902,'paul','paul','paul@finastra.com','7795616823','ff8aaa14-8d0e-11e9-a552-005056bf7e34',7181811,'ff5d5e69-8d0e-11e9-a552-005056bf7e34','ff734cda-8d0e-11e9-a552-005056bf7e34','ffc2d46d-8d0e-11e9-a552-005056bf7e34','ffd2d1af-8d0e-11e9-a552-005056bf7e34','fff78509-8d0e-11e9-a552-005056bf7e34','0005e491-8d0f-11e9-a552-005056bf7e34','y','jaypillai','y','2019-07-03','anonymousUser','2019-07-05 05:21:19','N','anonymousUser','2019-07-05 05:21:19'),('20b1c472-8e69-42ae-9277-2fd1d6f10a63',2112969,'shravaks','shravaks','shravankumar.ks@finastra.com','8861113609','ff8aaa14-8d0e-11e9-a552-005056bf7e34',718188,'ff5d5e69-8d0e-11e9-a552-005056bf7e34','ff734cda-8d0e-11e9-a552-005056bf7e34','ffbfe88c-8d0e-11e9-a552-005056bf7e34','ffccbc9a-8d0e-11e9-a552-005056bf7e34','fff4c9ba-8d0e-11e9-a552-005056bf7e34','000aa5aa-8d0f-11e9-a552-005056bf7e34','12','prithdeb','y','2018-10-09','admin','2019-06-19 11:07:29','y','admin','2019-06-19 11:07:29'),('24cf0e2e-c795-4b6e-9c45-fbd55b62e6aa',2112951,'phadiman','phadiman','pratiksha.hadimani@finastra.com','7204482285','ff8aaa14-8d0e-11e9-a552-005056bf7e34',718196,'ff5d5e69-8d0e-11e9-a552-005056bf7e34','ff734cda-8d0e-11e9-a552-005056bf7e34','ffbfe88c-8d0e-11e9-a552-005056bf7e34','ffccbc9a-8d0e-11e9-a552-005056bf7e34','fff4c9ba-8d0e-11e9-a552-005056bf7e34','000aa5aa-8d0f-11e9-a552-005056bf7e34','12','prithdeb','y','2018-09-10','admin','2019-06-19 11:07:29','y','admin','2019-06-19 11:07:29'),('31301a54-22cb-473b-96ed-41b54451bc0f',123451,'brad','brad','brad@finastra.com','7795616823','ff8aaa14-8d0e-11e9-a552-005056bf7e34',7181811,'ff5d5e69-8d0e-11e9-a552-005056bf7e34','ff734cda-8d0e-11e9-a552-005056bf7e34','ffc428d8-8d0e-11e9-a552-005056bf7e34','ffd2d1af-8d0e-11e9-a552-005056bf7e34','fff4c9ba-8d0e-11e9-a552-005056bf7e34','00040a46-8d0f-11e9-a552-005056bf7e34','y','jaypillai','y','2019-07-04','anonymousUser','2019-07-04 10:50:02','N','anonymousUser','2019-07-04 10:50:02'),('37eaefa3-5892-4857-ab7f-ae141f4813c0',2112946,'mdongala','mdongala','manjunatha.dongala@finastra.com','8884373812','ff8aaa14-8d0e-11e9-a552-005056bf7e34',719421,'ff5d5e69-8d0e-11e9-a552-005056bf7e34','ff734cda-8d0e-11e9-a552-005056bf7e34','ffbfe88c-8d0e-11e9-a552-005056bf7e34','ffccbc9a-8d0e-11e9-a552-005056bf7e34','fff4c9ba-8d0e-11e9-a552-005056bf7e34','000aa5aa-8d0f-11e9-a552-005056bf7e34','12','prithdeb','y','2019-02-19','admin','2019-06-19 11:07:29','y','admin','2019-06-19 11:07:29'),('39fe7be3-db89-4c5c-8a63-e9176d584039',2121759,'ldireddy','ldireddy','ldileepkumar.reddy@finastra.com','7799482361','ff8aaa14-8d0e-11e9-a552-005056bf7e34',718186,'ff5d5e69-8d0e-11e9-a552-005056bf7e34','ff734cda-8d0e-11e9-a552-005056bf7e34','ffbfe88c-8d0e-11e9-a552-005056bf7e34','ffd0b277-8d0e-11e9-a552-005056bf7e34','fff4c9ba-8d0e-11e9-a552-005056bf7e34','000aa5aa-8d0f-11e9-a552-005056bf7e34','12','prithdeb','y','2018-09-10','admin','2019-06-19 11:07:29','y','admin','2019-06-19 11:07:29'),('5556236e-d4f5-420d-84d4-17eadc97ac9f',2120263,'riymulla','riymulla','riyaj.mulla@finastra.com','7795949551','ff8aaa14-8d0e-11e9-a552-005056bf7e34',718190,'ff5d5e69-8d0e-11e9-a552-005056bf7e34','ff734cda-8d0e-11e9-a552-005056bf7e34','ffbfe88c-8d0e-11e9-a552-005056bf7e34','ffd0b277-8d0e-11e9-a552-005056bf7e34','fff4c9ba-8d0e-11e9-a552-005056bf7e34','000aa5aa-8d0f-11e9-a552-005056bf7e34','12','prithdeb','y','2018-09-10','admin','2019-06-19 11:07:29','N','admin','2019-07-01 06:48:12'),('5edabc3d-73db-45d7-8112-ab9a926af7d4',75798,'thor','thor','thor@finastra.com','7795616821','ff8aaa14-8d0e-11e9-a552-005056bf7e34',7188861,'ff5d5e69-8d0e-11e9-a552-005056bf7e34','ff7c9384-8d0e-11e9-a552-005056bf7e34','ffc2d46d-8d0e-11e9-a552-005056bf7e34','ffccbc9a-8d0e-11e9-a552-005056bf7e34','ffef757c-8d0e-11e9-a552-005056bf7e34','00040a46-8d0f-11e9-a552-005056bf7e34','y','prithdeb','y','2019-07-02','anonymousUser','2019-07-09 04:51:01','N','anonymousUser','2019-07-09 04:51:01'),('6c6b2785-ae86-44ea-a209-cc622127acda',2118268,'achauras','achauras','ajay.chaurasia@finastra.com','9871617066','ff8aaa14-8d0e-11e9-a552-005056bf7e34',718197,'ff5d5e69-8d0e-11e9-a552-005056bf7e34','ff734cda-8d0e-11e9-a552-005056bf7e34','ffbfe88c-8d0e-11e9-a552-005056bf7e34','ffccbc9a-8d0e-11e9-a552-005056bf7e34','fff4c9ba-8d0e-11e9-a552-005056bf7e34','000aa5aa-8d0f-11e9-a552-005056bf7e34','12','prithdeb','y','2018-09-10','admin','2019-06-19 11:07:29','y','admin','2019-06-19 11:07:29'),('8104488f-9bbf-411e-bce7-31e8cf87aa91',12345111,'tony','tony','tony@finastra.com','7795616826','ff8aaa14-8d0e-11e9-a552-005056bf7e34',71818421,'ff5d5e69-8d0e-11e9-a552-005056bf7e34','ff7c9384-8d0e-11e9-a552-005056bf7e34','ffbfe88c-8d0e-11e9-a552-005056bf7e34','ffd0b277-8d0e-11e9-a552-005056bf7e34','fff4c9ba-8d0e-11e9-a552-005056bf7e34','00075c34-8d0f-11e9-a552-005056bf7e34','y','jaypillai','y','2019-07-03','anonymousUser','2019-07-04 13:51:37','N','anonymousUser','2019-07-04 13:51:37'),('cfa9329b-8650-4a6b-be58-762e54b48333',2123114,'koteswara.rao','koteswara.rao','Koteswara.Rao@finastra.com','7899934005','ff8aaa14-8d0e-11e9-a552-005056bf7e34',707770,'ff5d5e69-8d0e-11e9-a552-005056bf7e34','ff734cda-8d0e-11e9-a552-005056bf7e34','ffc2d46d-8d0e-11e9-a552-005056bf7e34','ffccbc9a-8d0e-11e9-a552-005056bf7e34','ffef757c-8d0e-11e9-a552-005056bf7e34','000fa216-8d0f-11e9-a552-005056bf7e34','12','rprabhu','y','2005-05-25','admin','2019-06-19 11:07:29','y','admin','2019-06-19 11:07:29'),('cfa9329b-8650-4a6b-be58-762e54b48912',1753916,'anakshat','anakshat','akshatha.nakshatri@finastra.com','9663117203','ff8aaa14-8d0e-11e9-a552-005056bf7e34',718189,'ff5d5e69-8d0e-11e9-a552-005056bf7e34','ff734cda-8d0e-11e9-a552-005056bf7e34','ffbfe88c-8d0e-11e9-a552-005056bf7e34','ffccbc9a-8d0e-11e9-a552-005056bf7e34','fff4c9ba-8d0e-11e9-a552-005056bf7e34','000aa5aa-8d0f-11e9-a552-005056bf7e34','12','prithdeb','y','2018-09-10','admin','2019-06-19 11:07:29','y','admin','2019-06-19 11:07:29'),('ddcb812d-7cf2-4a04-891d-6c5286a60cd2',85281,'stephen','stephen','stephen@finastra.com','7795616821','ff8aaa14-8d0e-11e9-a552-005056bf7e34',7000004,'ff5d5e69-8d0e-11e9-a552-005056bf7e34','ff804d61-8d0e-11e9-a552-005056bf7e34','ffc2d46d-8d0e-11e9-a552-005056bf7e34','ffd486cc-8d0e-11e9-a552-005056bf7e34','ffef757c-8d0e-11e9-a552-005056bf7e34','00040a46-8d0f-11e9-a552-005056bf7e34','y','jaypillai','y','2019-06-25','anonymousUser','2019-07-05 05:37:27','N','anonymousUser','2019-07-05 05:55:53'),('e3240fdb-7435-4300-bbfa-724775a7bc83',1753914,'prithdeb','prithdeb','prithumit.deb1@finastra.com','9535352691','ff8aaa14-8d0e-11e9-a552-005056bf7e34',708783,'ff5d5e69-8d0e-11e9-a552-005056bf7e34','ff734cda-8d0e-11e9-a552-005056bf7e34','ffbc3930-8d0e-11e9-a552-005056bf7e34','ffd0b277-8d0e-11e9-a552-005056bf7e34','ffef757c-8d0e-11e9-a552-005056bf7e34','fffae091-8d0e-11e9-a552-005056bf7e34','12','jaypillai','y','2011-07-07','admin','2019-06-19 11:07:29','N','admin','2019-06-27 04:24:05'),('e3250fdb-7435-4300-bbfa-724775a7b222',2118084,'akaranth','akaranth','Ashwin.Karanth@finastra.com','9448759933','ff8aaa14-8d0e-11e9-a552-005056bf7e34',711372,'ff5d5e69-8d0e-11e9-a552-005056bf7e34','ff734cda-8d0e-11e9-a552-005056bf7e34','ffbfe88c-8d0e-11e9-a552-005056bf7e34','ffccbc9a-8d0e-11e9-a552-005056bf7e34','ffef757c-8d0e-11e9-a552-005056bf7e34','000fa216-8d0f-11e9-a552-005056bf7e34','12','vikkumar','y','2017-01-16','admin','2019-06-19 11:07:29','y','admin','2019-06-19 11:07:29'),('e3250fdb-7435-4300-bbfa-724775a7bc83',1753917,'vikkumar','vikkumar','vikash.kumar@finastra.com','9535572087','ff8aaa14-8d0e-11e9-a552-005056bf7e34',708999,'ff5d5e69-8d0e-11e9-a552-005056bf7e34','ff870147-8d0e-11e9-a552-005056bf7e34','ffbc3930-8d0e-11e9-a552-005056bf7e34','ffd0b277-8d0e-11e9-a552-005056bf7e34','ffef757c-8d0e-11e9-a552-005056bf7e34','ffffa131-8d0e-11e9-a552-005056bf7e34','12','jaypillai','y','2011-07-07','admin','2019-06-19 11:07:29','N','admin','2019-06-20 04:52:58'),('e3259fdb-7435-4300-bbfa-724775a7bc83',1753918,'admin','admin','prithumit.deb@finastra.com','7795616820','ff8aaa14-8d0e-11e9-a552-005056bf7e34',708783,'ff5d5e69-8d0e-11e9-a552-005056bf7e34','ff734cda-8d0e-11e9-a552-005056bf7e34','ffbc3930-8d0e-11e9-a552-005056bf7e34','ffd0b277-8d0e-11e9-a552-005056bf7e34','ffef757c-8d0e-11e9-a552-005056bf7e34','fffae091-8d0e-11e9-a552-005056bf7e34','12','jaypillai','y','2011-07-05','admin','2019-06-19 11:07:29','Y','admin','2019-07-16 05:06:38'),('f4f4e537-a383-42de-8602-27adaa38f21c',26404,'kevin','kevin','kevin@finastra.com','7795896823','ff8aaa14-8d0e-11e9-a552-005056bf7e34',7000002,'ff5d5e69-8d0e-11e9-a552-005056bf7e34','ff7c9384-8d0e-11e9-a552-005056bf7e34','ffc2d46d-8d0e-11e9-a552-005056bf7e34','ffd2d1af-8d0e-11e9-a552-005056bf7e34','fff78509-8d0e-11e9-a552-005056bf7e34','00040a46-8d0f-11e9-a552-005056bf7e34','y','shravaks','y','2019-07-02','anonymousUser','2019-07-05 05:31:28','N','anonymousUser','2019-07-05 05:59:01'),('fc093f7e-5cd6-4c60-b19d-e113e3b70107',18982,'user','user','user@finastra.com','7760882744','ff8aaa14-8d0e-11e9-a552-005056bf7e34',761616,'ff5d5e69-8d0e-11e9-a552-005056bf7e34','ff7c9384-8d0e-11e9-a552-005056bf7e34','ffbfe88c-8d0e-11e9-a552-005056bf7e34','ffd0b277-8d0e-11e9-a552-005056bf7e34','fff4c9ba-8d0e-11e9-a552-005056bf7e34','00040a46-8d0f-11e9-a552-005056bf7e34','y','','y','2019-07-01','user','2019-07-17 05:40:22','Y','user','2019-07-17 05:40:22'),('febcba46-4ca3-4882-8d26-53939fbae111',2118900,'gopalams','gopalams','Gopalakrishna.Ms@finastra.com','9448759922','ff8aaa14-8d0e-11e9-a552-005056bf7e34',708694,'ff5d5e69-8d0e-11e9-a552-005056bf7e34','ff734cda-8d0e-11e9-a552-005056bf7e34','ffbfe88c-8d0e-11e9-a552-005056bf7e34','ffccbc9a-8d0e-11e9-a552-005056bf7e34','ffef757c-8d0e-11e9-a552-005056bf7e34','000fa216-8d0f-11e9-a552-005056bf7e34','12','vikashk','y','2011-02-21','admin','2019-06-19 11:07:29','y','admin','2019-06-19 11:07:29'),('febcba46-4ca3-4882-8d26-53939fbae88c',1753921,'bnandima','bnandima','bhaskar.nandimandalam@finastra.com','9980081588','ff8aaa14-8d0e-11e9-a552-005056bf7e34',710569,'ff5d5e69-8d0e-11e9-a552-005056bf7e34','ff734cda-8d0e-11e9-a552-005056bf7e34','ffbfe88c-8d0e-11e9-a552-005056bf7e34','ffccbc9a-8d0e-11e9-a552-005056bf7e34','ffef757c-8d0e-11e9-a552-005056bf7e34','000fa216-8d0f-11e9-a552-005056bf7e34','12','prithdeb','y','2018-10-09','admin','2019-06-19 11:07:29','y','admin','2019-06-19 11:07:29');
/*!40000 ALTER TABLE `app_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_user_role`
--

DROP TABLE IF EXISTS `app_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_user_role` (
  `user_role_id` char(36) NOT NULL COMMENT 'Unique identifier',
  `user_id` char(36) NOT NULL COMMENT 'Identifier of the user',
  `role_id` char(36) NOT NULL COMMENT 'Identifier of the role',
  `default_role_flag` char(1) NOT NULL DEFAULT 'N' COMMENT 'Flag to denote whether the role is marked as default for user',
  `active_flag` char(1) NOT NULL DEFAULT 'N' COMMENT 'Flag to denote whether the entity is marked as active or inactive',
  `created_by` char(36) NOT NULL COMMENT 'Audit: WHO created',
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Audit: WHEN created',
  `app_role_role_id` char(36) DEFAULT NULL,
  `last_updated_by` varchar(36) NOT NULL,
  `last_updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`user_role_id`),
  UNIQUE KEY `app_user_role_uk1` (`user_id`,`role_id`),
  KEY `app_user_role_ix1` (`user_id`),
  KEY `app_user_role_ix2` (`role_id`),
  KEY `app_user_role_ix3` (`active_flag`),
  KEY `app_user_role_ix4` (`default_role_flag`),
  KEY `FKjfdchyvfh26mvp20ml1qqn7cb` (`app_role_role_id`),
  CONSTRAINT `FKjfdchyvfh26mvp20ml1qqn7cb` FOREIGN KEY (`app_role_role_id`) REFERENCES `app_role` (`role_id`),
  CONSTRAINT `app_user_role_fk1` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `app_user_role_fk2` FOREIGN KEY (`role_id`) REFERENCES `app_role` (`role_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Mapping of users to one or more application roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_user_role`
--

LOCK TABLES `app_user_role` WRITE;
/*!40000 ALTER TABLE `app_user_role` DISABLE KEYS */;
INSERT INTO `app_user_role` VALUES ('0c9de0fc-89cd-4a81-95aa-93ad7cbf03ef','060f8ae6-46b1-4fd5-86c8-58c25c6d4169','002e496f-8d0f-11e9-a552-005056bf7e34','y','N','admin','2019-06-21 07:08:17',NULL,'admin','2019-06-21 07:16:40'),('2cb72299-2072-47ac-b84a-70d474111471','060f8ae6-46b1-4fd5-86c8-58c25c6d4169','0031997c-8d0f-11e9-a552-005056bf7e34','y','N','admin','2019-06-12 04:38:24',NULL,'admin','2019-06-21 07:10:12'),('2cb72299-2072-47ac-b84a-70d474111472','087f530e-641e-4612-9217-785d4a8fca52','0031997c-8d0f-11e9-a552-005056bf7e34','y','N','admin','2019-06-12 04:38:24',NULL,'admin','2019-06-21 07:01:55'),('2cb72299-2072-47ac-b84a-70d474111473','0abe421b-091a-4d0e-90d6-53fb78ddeec4','0031997c-8d0f-11e9-a552-005056bf7e34','y','y','admin','2019-06-12 04:38:24',NULL,'',NULL),('2cb72299-2072-47ac-b84a-70d474111474','0dab274b-a675-453a-a427-3762b0bc0912','0031997c-8d0f-11e9-a552-005056bf7e34','y','y','admin','2019-06-12 04:38:24',NULL,'',NULL),('2cb72299-2072-47ac-b84a-70d474111475','20b1c472-8e69-42ae-9277-2fd1d6f10a63','0031997c-8d0f-11e9-a552-005056bf7e34','y','y','admin','2019-06-12 04:38:24',NULL,'',NULL),('2cb72299-2072-47ac-b84a-70d474111476','24cf0e2e-c795-4b6e-9c45-fbd55b62e6aa','0031997c-8d0f-11e9-a552-005056bf7e34','y','N','admin','2019-06-12 04:38:24',NULL,'anonymousUser','2019-07-12 11:30:16'),('2cb72299-2072-47ac-b84a-70d474111477','37eaefa3-5892-4857-ab7f-ae141f4813c0','0031997c-8d0f-11e9-a552-005056bf7e34','y','y','admin','2019-06-12 04:38:24',NULL,'',NULL),('2cb72299-2072-47ac-b84a-70d474111478','39fe7be3-db89-4c5c-8a63-e9176d584039','002e496f-8d0f-11e9-a552-005056bf7e34','y','N','admin','2019-06-12 04:38:24',NULL,'admin','2019-07-01 13:46:16'),('3374440a-398c-46d2-a870-906af1e80cd3','087f530e-641e-4612-9217-785d4a8fca52','003354cf-8d0f-11e9-a552-005056bf7e34','y','N','admin','2019-06-21 07:24:29',NULL,'admin','2019-06-21 07:24:29'),('3c82a4fe-7887-4c73-80b0-a4247515bf31','e3240fdb-7435-4300-bbfa-724775a7bc83','0031997c-8d0f-11e9-a552-005056bf7e34','y','N','admin','2019-08-22 10:15:33',NULL,'admin','2019-08-22 10:15:33'),('3d444e0d-bbff-4aa3-8131-71ab61df9c63','20b1c472-8e69-42ae-9277-2fd1d6f10a63','002a2ed3-8d0f-11e9-a552-005056bf7e34','y','N','admin','2019-06-21 07:01:41',NULL,'admin','2019-06-21 07:01:41'),('44a16467-bdb4-4c60-8632-736ad44ec454','087f530e-641e-4612-9217-785d4a8fca52','002a2ed3-8d0f-11e9-a552-005056bf7e34','y','N','admin','2019-06-21 06:19:56',NULL,'admin','2019-06-21 06:19:56'),('4ac0f177-0417-45f4-8a9d-a72f1c19d5ac','0abe421b-091a-4d0e-90d6-53fb78ddeec4','002a2ed3-8d0f-11e9-a552-005056bf7e34','y','N','admin','2019-06-21 07:07:27',NULL,'admin','2019-07-03 05:53:05'),('65aef5ab-a9ed-4aa0-96aa-417429b26648','20b1c472-8e69-42ae-9277-2fd1d6f10a63','002e496f-8d0f-11e9-a552-005056bf7e34','y','N','admin','2019-06-21 06:44:05',NULL,'admin','2019-06-21 06:44:05'),('737f9e10-111f-4ffe-88c0-2f46797f633c','8104488f-9bbf-411e-bce7-31e8cf87aa91','0031997c-8d0f-11e9-a552-005056bf7e34','y','N','anonymousUser','2019-07-04 13:53:41',NULL,'anonymousUser','2019-07-12 05:09:56'),('7406686e-621a-4dce-9e03-952cba990626','cfa9329b-8650-4a6b-be58-762e54b48912','002a2ed3-8d0f-11e9-a552-005056bf7e34','y','N','admin','2019-07-15 06:20:53',NULL,'admin','2019-08-22 10:13:41'),('87d95ea1-97a1-40ee-a75f-d3bfaed8ed76','5556236e-d4f5-420d-84d4-17eadc97ac9f','002e496f-8d0f-11e9-a552-005056bf7e34','y','N','admin','2019-06-25 08:46:03',NULL,'admin','2019-07-02 10:13:36'),('92d4e420-8631-4422-8c42-9e0ba2ae002d','060f8ae6-46b1-4fd5-86c8-58c25c6d4169','002a2ed3-8d0f-11e9-a552-005056bf7e34','y','N','admin','2019-06-21 07:07:54',NULL,'admin','2019-06-21 07:07:54'),('96f3e14c-6d46-4413-b19f-7a45a5debc21','e3259fdb-7435-4300-bbfa-724775a7bc83','002e496f-8d0f-11e9-a552-005056bf7e34','y','N','admin','2019-07-03 05:49:59',NULL,'admin','2019-07-03 05:49:59'),('aa72afde-c2fc-4e22-94a6-ec3783d78416','e3250fdb-7435-4300-bbfa-724775a7b222','0031997c-8d0f-11e9-a552-005056bf7e34','y','N','anonymousUser','2019-07-12 11:26:03',NULL,'anonymousUser','2019-07-12 11:26:03'),('abe35ced-3e9e-454c-9246-6ea57b44b316','087f530e-641e-4612-9217-785d4a8fca52','002e496f-8d0f-11e9-a552-005056bf7e34','y','N','admin','2019-06-21 06:41:53',NULL,'admin','2019-06-21 06:41:53'),('accce211-45e0-4dbd-9eb9-6d6954aa55a0','cfa9329b-8650-4a6b-be58-762e54b48912','002e496f-8d0f-11e9-a552-005056bf7e34','y','N','admin','2019-06-21 08:57:52',NULL,'admin','2019-06-21 08:57:52'),('c9ad2a3e-22c1-483a-aed1-c46973f01788','6c6b2785-ae86-44ea-a209-cc622127acda','002a2ed3-8d0f-11e9-a552-005056bf7e34','y','N','admin','2019-06-27 05:53:32',NULL,'admin','2019-07-04 05:22:05'),('d570b38b-67d9-4340-8e68-cb85ddd4137d','6c6b2785-ae86-44ea-a209-cc622127acda','002e496f-8d0f-11e9-a552-005056bf7e34','y','N','admin','2019-07-15 06:20:28',NULL,'admin','2019-07-15 06:20:28'),('de1b2003-e2e7-43ed-82f3-6d3dfb4f4d91','e3240fdb-7435-4300-bbfa-724775a7bc83','002e496f-8d0f-11e9-a552-005056bf7e34','y','N','anonymousUser','2019-07-10 12:24:18',NULL,'anonymousUser','2019-07-10 12:24:18'),('eaceec4c-c8ee-4d5d-ad1d-6d7a269d03c5','8104488f-9bbf-411e-bce7-31e8cf87aa91','002e496f-8d0f-11e9-a552-005056bf7e34','y','N','anonymousUser','2019-07-04 13:53:11',NULL,'anonymousUser','2019-07-04 13:53:11'),('eec6633a-e4f3-4261-91eb-3880c900b1d4','e3250fdb-7435-4300-bbfa-724775a7b222','002e496f-8d0f-11e9-a552-005056bf7e34','y','N','admin','2019-07-03 05:50:54',NULL,'admin','2019-07-03 05:50:54'),('f7141a27-1369-48f6-ba35-46bdda258d5f','060f8ae6-46b1-4fd5-86c8-58c25c6d4169','003354cf-8d0f-11e9-a552-005056bf7e34','y','N','admin','2019-06-21 07:08:58',NULL,'admin','2019-06-21 07:08:58');
/*!40000 ALTER TABLE `app_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `databasechangelog`
--

DROP TABLE IF EXISTS `databasechangelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `databasechangelog` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `databasechangelog`
--

LOCK TABLES `databasechangelog` WRITE;
/*!40000 ALTER TABLE `databasechangelog` DISABLE KEYS */;
INSERT INTO `databasechangelog` VALUES ('00000000000001','jhipster','config/liquibase/changelog/00000000000000_initial_schema.xml','2019-06-12 18:47:03',1,'EXECUTED','7:9d88ecd533d5a3530e304f778b9dc982','createTable tableName=jhi_persistent_audit_event; createTable tableName=jhi_persistent_audit_evt_data; addPrimaryKey tableName=jhi_persistent_audit_evt_data; createIndex indexName=idx_persistent_audit_event, tableName=jhi_persistent_audit_event; c...','',NULL,'3.5.4',NULL,NULL,'0345422334'),('20190629084530-1','jhipster','config/liquibase/changelog/20190629084530_added_entity_Book.xml','2019-06-29 14:55:12',2,'EXECUTED',NULL,'createTable tableName=book','',NULL,'3.6.3',NULL,NULL,'1800311911'),('20190629084530-1-data','jhipster','config/liquibase/changelog/20190629084530_added_entity_Book.xml','2019-06-29 14:55:13',3,'EXECUTED',NULL,'loadData tableName=book','',NULL,'3.6.3','faker',NULL,'1800311911'),('20190629084530-1-relations','jhipster','config/liquibase/changelog/20190629084530_added_entity_Book.xml','2019-06-29 14:55:13',4,'EXECUTED',NULL,'empty','',NULL,'3.6.3',NULL,NULL,'1800311911');
/*!40000 ALTER TABLE `databasechangelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `databasechangeloglock`
--

DROP TABLE IF EXISTS `databasechangeloglock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `databasechangeloglock` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `databasechangeloglock`
--

LOCK TABLES `databasechangeloglock` WRITE;
/*!40000 ALTER TABLE `databasechangeloglock` DISABLE KEYS */;
INSERT INTO `databasechangeloglock` VALUES (1,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `databasechangeloglock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jhi_persistent_audit_event`
--

DROP TABLE IF EXISTS `jhi_persistent_audit_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jhi_persistent_audit_event` (
  `event_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `principal` varchar(50) NOT NULL,
  `event_date` timestamp NULL DEFAULT NULL,
  `event_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`event_id`),
  KEY `idx_persistent_audit_event` (`principal`,`event_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jhi_persistent_audit_event`
--

LOCK TABLES `jhi_persistent_audit_event` WRITE;
/*!40000 ALTER TABLE `jhi_persistent_audit_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `jhi_persistent_audit_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jhi_persistent_audit_evt_data`
--

DROP TABLE IF EXISTS `jhi_persistent_audit_evt_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jhi_persistent_audit_evt_data` (
  `event_id` bigint(20) NOT NULL,
  `name` varchar(150) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`event_id`,`name`),
  KEY `idx_persistent_audit_evt_data` (`event_id`),
  CONSTRAINT `fk_evt_pers_audit_evt_data` FOREIGN KEY (`event_id`) REFERENCES `jhi_persistent_audit_event` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jhi_persistent_audit_evt_data`
--

LOCK TABLES `jhi_persistent_audit_evt_data` WRITE;
/*!40000 ALTER TABLE `jhi_persistent_audit_evt_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `jhi_persistent_audit_evt_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_complexity_score`
--

DROP TABLE IF EXISTS `job_complexity_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_complexity_score` (
  `complexity_score_id` char(36) NOT NULL COMMENT 'Unique identifier',
  `job_function_id` char(36) NOT NULL COMMENT 'Identifier of the job function',
  `complexity_id` char(8) NOT NULL COMMENT 'Identifier of the complexity',
  `success_score` int(11) NOT NULL COMMENT 'Mark scored for completing the task successfully',
  `failure_score` int(11) NOT NULL COMMENT 'Negative mark scored for failure in the task',
  `active_flag` char(1) NOT NULL DEFAULT 'N' COMMENT 'Flag to denote whether the entity is marked as active or inactive',
  `created_by` char(36) NOT NULL COMMENT 'Audit: WHO created',
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Audit: WHEN created',
  `last_updated_by` char(36) NOT NULL COMMENT 'Audit: WHEN last updated',
  `last_updated_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Audit: WHEN last updated',
  PRIMARY KEY (`complexity_score_id`),
  UNIQUE KEY `job_complexity_score_uk1` (`job_function_id`,`complexity_id`),
  KEY `job_complexity_score_fk2` (`complexity_id`),
  CONSTRAINT `job_complexity_score_fk1` FOREIGN KEY (`job_function_id`) REFERENCES `job_function` (`job_function_id`) ON UPDATE CASCADE,
  CONSTRAINT `job_complexity_score_fk2` FOREIGN KEY (`complexity_id`) REFERENCES `task_complexity` (`complexity_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Job function and complexity matrix';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_complexity_score`
--

LOCK TABLES `job_complexity_score` WRITE;
/*!40000 ALTER TABLE `job_complexity_score` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_complexity_score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_function`
--

DROP TABLE IF EXISTS `job_function`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_function` (
  `job_function_id` char(36) NOT NULL COMMENT 'Unique identifier',
  `product_function_id` char(36) NOT NULL COMMENT 'Identifier of the product functional area',
  `job_function_name` varchar(80) NOT NULL COMMENT 'Name of the job function',
  `job_function_desc` varchar(240) DEFAULT NULL COMMENT 'Brief description about the job function',
  `active_flag` char(1) NOT NULL DEFAULT 'N' COMMENT 'Flag to denote whether the entity is marked as active or inactive',
  `created_by` char(36) NOT NULL COMMENT 'Audit: WHO created',
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Audit: WHEN created',
  `last_updated_by` varchar(36) NOT NULL,
  `last_updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`job_function_id`),
  UNIQUE KEY `job_function_uk1` (`product_function_id`,`job_function_name`),
  KEY `job_function_ix1` (`product_function_id`),
  KEY `job_function_ix2` (`active_flag`),
  CONSTRAINT `job_function_fk1` FOREIGN KEY (`product_function_id`) REFERENCES `product_function` (`product_function_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Job functional codes associated with the product functional areas';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_function`
--

LOCK TABLES `job_function` WRITE;
/*!40000 ALTER TABLE `job_function` DISABLE KEYS */;
INSERT INTO `job_function` VALUES ('00027f8f-8d0f-11e9-a552-005056bf7e34','ffbc3930-8d0e-11e9-a552-005056bf7e34','M4','Manager -4','Y','SEED','2019-06-12 18:08:48','',NULL),('00040a46-8d0f-11e9-a552-005056bf7e34','ffbc3930-8d0e-11e9-a552-005056bf7e34','M5','Manager -5','Y','SEED','2019-06-12 18:08:48','',NULL),('0005e491-8d0f-11e9-a552-005056bf7e34','ffbc3930-8d0e-11e9-a552-005056bf7e34','M6','Manager -6','Y','SEED','2019-06-12 18:08:48','',NULL),('00075c34-8d0f-11e9-a552-005056bf7e34','ffbc3930-8d0e-11e9-a552-005056bf7e34','M7','Manager -7','Y','SEED','2019-06-12 18:08:48','',NULL),('000aa5aa-8d0f-11e9-a552-005056bf7e34','ffbfe88c-8d0e-11e9-a552-005056bf7e34','TP1','Professional - 1','Y','SEED','2019-06-12 18:08:48','',NULL),('000e5ed5-8d0f-11e9-a552-005056bf7e34','ffbfe88c-8d0e-11e9-a552-005056bf7e34','TP2','Professional - 2','Y','SEED','2019-06-12 18:08:48','',NULL),('000fa216-8d0f-11e9-a552-005056bf7e34','ffbfe88c-8d0e-11e9-a552-005056bf7e34','TP3','Professional - 3','Y','SEED','2019-06-12 18:08:48','',NULL),('001276d1-8d0f-11e9-a552-005056bf7e34','ffbfe88c-8d0e-11e9-a552-005056bf7e34','TP4','Professional - 4','Y','SEED','2019-06-12 18:08:48','',NULL),('0013be11-8d0f-11e9-a552-005056bf7e34','ffbfe88c-8d0e-11e9-a552-005056bf7e34','TP5','Professional - 5','Y','SEED','2019-06-12 18:08:48','',NULL),('0015c6ad-8d0f-11e9-a552-005056bf7e34','ffbfe88c-8d0e-11e9-a552-005056bf7e34','TP6','Professional - 6','Y','SEED','2019-06-12 18:08:48','',NULL),('0019cfb9-8d0f-11e9-a552-005056bf7e34','ffbfe88c-8d0e-11e9-a552-005056bf7e34','TP7','Professional - 7','Y','SEED','2019-06-12 18:08:48','',NULL),('001d19d8-8d0f-11e9-a552-005056bf7e34','ffc2d46d-8d0e-11e9-a552-005056bf7e34','TP1','Professional - 1','Y','SEED','2019-06-12 18:08:48','',NULL),('001e3c12-8d0f-11e9-a552-005056bf7e34','ffc2d46d-8d0e-11e9-a552-005056bf7e34','TP2','Professional - 2','Y','SEED','2019-06-12 18:08:48','',NULL),('001f8388-8d0f-11e9-a552-005056bf7e34','ffc2d46d-8d0e-11e9-a552-005056bf7e34','TP3','Professional - 3','Y','SEED','2019-06-12 18:08:48','',NULL),('0020f515-8d0f-11e9-a552-005056bf7e34','ffc2d46d-8d0e-11e9-a552-005056bf7e34','TP4','Professional - 4','Y','SEED','2019-06-12 18:08:48','',NULL),('0022500a-8d0f-11e9-a552-005056bf7e34','ffc2d46d-8d0e-11e9-a552-005056bf7e34','TP5','Professional - 5','Y','SEED','2019-06-12 18:08:48','',NULL),('0023acdb-8d0f-11e9-a552-005056bf7e34','ffc2d46d-8d0e-11e9-a552-005056bf7e34','TP6','Professional - 6','Y','SEED','2019-06-12 18:08:48','',NULL),('0027f40a-8d0f-11e9-a552-005056bf7e34','ffc2d46d-8d0e-11e9-a552-005056bf7e34','TP7','Professional - 7','Y','SEED','2019-06-12 18:08:48','',NULL),('fffae091-8d0e-11e9-a552-005056bf7e34','ffbc3930-8d0e-11e9-a552-005056bf7e34','M1','Manager -1','Y','SEED','2019-06-12 18:08:48','',NULL),('fffcd93e-8d0e-11e9-a552-005056bf7e34','ffbc3930-8d0e-11e9-a552-005056bf7e34','M2','Manager -2','Y','SEED','2019-06-12 18:08:48','',NULL),('ffffa131-8d0e-11e9-a552-005056bf7e34','ffbc3930-8d0e-11e9-a552-005056bf7e34','M3','Manager -3','Y','SEED','2019-06-12 18:08:48','',NULL);
/*!40000 ALTER TABLE `job_function` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location_capacity`
--

DROP TABLE IF EXISTS `location_capacity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location_capacity` (
  `capacity_id` char(36) NOT NULL COMMENT 'Unique identifier',
  `location_id` char(36) NOT NULL COMMENT 'Location identifier',
  `month_code` char(8) NOT NULL COMMENT 'Code associated with the month, stored using MON-YYYY format',
  `available_days` int(11) NOT NULL,
  `created_by` char(36) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `active_flag` char(1) DEFAULT NULL,
  `last_updated_by` char(36) DEFAULT NULL,
  `last_updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`capacity_id`),
  UNIQUE KEY `location_capacity_uk1` (`location_id`,`month_code`),
  KEY `location_capacity_ix1` (`month_code`),
  CONSTRAINT `location_capacity_fk1` FOREIGN KEY (`location_id`) REFERENCES `org_location` (`location_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Monthly available capacity in hours at locations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_capacity`
--

LOCK TABLES `location_capacity` WRITE;
/*!40000 ALTER TABLE `location_capacity` DISABLE KEYS */;
INSERT INTO `location_capacity` VALUES ('2242e8ad-9af9-4ff3-ac7e-fde0443b33fc','ff8aaa14-8d0e-11e9-a552-005056bf7e34','APR-2019',73,'admin','2019-06-21 09:25:52','N','admin','2019-08-13 06:47:12'),('2243e8ad-9af9-4ff3-ac7e-fde0443b33fc','ff8aaa14-8d0e-11e9-a552-005056bf7e34','MAY-2019',90,'admin','2019-06-21 09:25:52','N','admin','2019-08-13 06:47:12'),('2244e8ad-9af9-4ff3-ac7e-fde0443b33fc','ff8aaa14-8d0e-11e9-a552-005056bf7e34','JUN-2019',108,'admin','2019-06-21 09:25:52','N','admin','2019-08-13 06:47:12'),('2245e8ad-9af9-4ff3-ac7e-fde0443b33fc','ff8aaa14-8d0e-11e9-a552-005056bf7e34','JUL-2019',124,'admin','2019-06-21 09:25:52','N','admin','2019-08-13 06:47:12'),('2246e8ad-9af9-4ff3-ac7e-fde0443b33fc','ff8aaa14-8d0e-11e9-a552-005056bf7e34','AUG-2019',142,'admin','2019-06-21 09:25:52','N','admin','2019-08-13 06:47:12'),('2247e8ad-9af9-4ff3-ac7e-fde0443b33fc','ff8aaa14-8d0e-11e9-a552-005056bf7e34','SEP-2019',160,'admin','2019-06-21 09:25:52','N','admin','2019-08-13 06:47:12'),('2248e8ad-9af9-4ff3-ac7e-fde0443b33fc','ff8aaa14-8d0e-11e9-a552-005056bf7e34','OCT-2019',176,'admin','2019-06-21 09:25:52','N','admin','2019-08-13 06:47:12'),('2249e8ad-9af9-4ff3-ac7e-fde0443b33fc','ff8aaa14-8d0e-11e9-a552-005056bf7e34','NOV-2019',195,'admin','2019-06-21 09:25:52','N','admin','2019-08-13 06:47:12'),('2250e8ad-9af9-4ff3-ac7e-fde0443b33fc','ff8aaa14-8d0e-11e9-a552-005056bf7e34','DEC-2019',214,'admin','2019-06-21 09:25:52','Y','admin','2019-08-13 06:47:13'),('2251e8ad-9af9-4ff3-ac7e-fde0443b33fc','ff8aaa14-8d0e-11e9-a552-005056bf7e34','JAN-2019',18,'admin','2019-06-21 09:25:52','Y','admin','2019-08-13 06:47:12'),('2252e8ad-9af9-4ff3-ac7e-fde0443b33fc','ff8aaa14-8d0e-11e9-a552-005056bf7e34','FEB-2019',36,'admin','2019-06-21 09:25:52','N','admin','2019-08-13 06:47:12'),('2253e8ad-9af9-4ff3-ac7e-fde0443b33fc','ff8aaa14-8d0e-11e9-a552-005056bf7e34','MAR-2019',55,'admin','2019-06-21 09:25:52','N','admin','2019-08-13 06:47:12');
/*!40000 ALTER TABLE `location_capacity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location_holiday`
--

DROP TABLE IF EXISTS `location_holiday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location_holiday` (
  `holiday_id` char(36) NOT NULL COMMENT 'Unique identifier',
  `location_id` char(36) NOT NULL COMMENT 'Location identifier',
  `holiday_date` date NOT NULL COMMENT 'Holiday date',
  `holiday_name` varchar(60) NOT NULL COMMENT 'Name of the holiday observed',
  `half_day_flag` char(1) NOT NULL DEFAULT 'N' COMMENT 'Flag to denote whether the holiday is observed as half-day',
  `active_flag` char(1) NOT NULL DEFAULT 'N' COMMENT 'Flag to denote whether the entity is marked as active or inactive',
  `created_by` char(36) NOT NULL COMMENT 'Audit: WHO created',
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Audit: WHEN created',
  `last_updated_by` char(36) NOT NULL COMMENT 'Audit: WHEN last updated',
  `last_updated_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Audit: WHEN last updated',
  PRIMARY KEY (`holiday_id`),
  UNIQUE KEY `location_holiday_uk1` (`location_id`,`holiday_date`),
  KEY `location_holiday_ix1` (`holiday_date`),
  CONSTRAINT `location_holiday_fk1` FOREIGN KEY (`location_id`) REFERENCES `org_location` (`location_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Holidays observed at locations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_holiday`
--

LOCK TABLES `location_holiday` WRITE;
/*!40000 ALTER TABLE `location_holiday` DISABLE KEYS */;
INSERT INTO `location_holiday` VALUES ('821a2d62-ff5a-42a3-95d3-76d859299139','ff8aaa14-8d0e-11e9-a552-005056bf7e34','2019-05-01','May Day','N','N','admin','2019-06-13 04:38:24','admin','2019-06-21 10:51:56'),('821a2d63-ff5a-42a3-95d3-76d859299139','ff8aaa14-8d0e-11e9-a552-005056bf7e34','2019-06-06','Ramazan','N','N','admin','2019-06-13 04:38:24','admin','2019-06-13 04:38:24'),('821a2d64-ff5a-42a3-95d3-76d859299139','ff8aaa14-8d0e-11e9-a552-005056bf7e34','2019-08-15','Independence Day','N','Y','admin','2019-06-13 04:38:24','admin','2019-06-13 04:38:24'),('821a2d65-ff5a-42a3-95d3-76d859299139','ff8aaa14-8d0e-11e9-a552-005056bf7e34','2019-09-04','Ganesh Chaturthi','N','Y','admin','2019-06-13 04:38:24','admin','2019-06-13 04:38:24'),('821a2d66-ff5a-42a3-95d3-76d859299139','ff8aaa14-8d0e-11e9-a552-005056bf7e34','2019-10-08','Vijaya Dashami','N','N','admin','2019-06-13 04:38:24','admin','2019-06-13 04:38:24'),('821a2d67-ff5a-42a3-95d3-76d859299139','ff8aaa14-8d0e-11e9-a552-005056bf7e34','2019-10-29','Diwali','N','N','admin','2019-06-13 04:38:24','admin','2019-06-13 04:38:24'),('821a2d67-ff5a-42a3-95d3-76d859299140','ff8fc1d1-8d0e-11e9-a552-005056bf7e34','2019-10-08','Day of Arafat','N','Y','admin','2019-06-13 04:38:24','admin','2019-06-13 04:38:24'),('821a2d67-ff5a-42a3-95d3-76d859299141','ff8fc1d1-8d0e-11e9-a552-005056bf7e34','2019-10-09','Day of Arafat','N','Y','admin','2019-06-13 04:38:24','admin','2019-06-13 04:38:24'),('cb3fe34d-cb71-4d35-8981-3868a9d34f15','ff8aaa14-8d0e-11e9-a552-005056bf7e34','2019-11-01','kannada Rajyotsava','Y','Y','admin','2019-08-27 12:37:19','admin','2019-08-27 12:37:19');
/*!40000 ALTER TABLE `location_holiday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_jira_project`
--

DROP TABLE IF EXISTS `org_jira_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org_jira_project` (
  `jira_project_id` char(36) NOT NULL COMMENT 'Unique identifier',
  `product_org_id` char(36) NOT NULL COMMENT 'Identifier of the product organization',
  `jira_id` decimal(18,0) unsigned NOT NULL COMMENT 'JIRA - Project identifier',
  `jira_pkey` varchar(255) NOT NULL COMMENT 'JIRA - Project key',
  `jira_pname` varchar(255) NOT NULL COMMENT 'JIRA - Project Name',
  `jira_lead` varchar(255) DEFAULT NULL COMMENT 'JIRA - Project Lead',
  `last_updated_by` varchar(36) NOT NULL,
  `last_updated_on` datetime DEFAULT NULL,
  `active_flag` char(1) NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`jira_project_id`),
  UNIQUE KEY `org_jira_project_uk1` (`product_org_id`,`jira_id`),
  UNIQUE KEY `org_jira_project_uk2` (`product_org_id`,`jira_pkey`),
  UNIQUE KEY `org_jira_project_uk3` (`product_org_id`,`jira_pname`),
  KEY `org_jira_project_ix1` (`product_org_id`),
  CONSTRAINT `org_jira_project_fk1` FOREIGN KEY (`product_org_id`) REFERENCES `product_org` (`product_org_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Jira projects associated with product organizations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_jira_project`
--

LOCK TABLES `org_jira_project` WRITE;
/*!40000 ALTER TABLE `org_jira_project` DISABLE KEYS */;
INSERT INTO `org_jira_project` VALUES ('40eac61c-ad2d-4698-957e-26e2f645ca04','ff5d5e69-8d0e-11e9-a552-005056bf7e34',597,'MIS','Midas','akaranth','anonymousUser','2019-07-15 10:01:35','N','anonymousUser','2019-07-15 10:01:35'),('678d5d0a-da42-4475-a804-b86964026a00','ff5d5e69-8d0e-11e9-a552-005056bf7e34',193,'FBSB','FisBin','asbindra','anonymousUser','2019-07-12 09:08:09','N','anonymousUser','2019-07-12 09:07:28'),('a5becb09-0565-4b72-a983-b2ee55c87f2b','ff5d5e69-8d0e-11e9-a552-005056bf7e34',821,'FPN','FinPin','amulyalv','anonymousUser','2019-07-12 09:00:59','N','anonymousUser','2019-07-12 09:00:59'),('e78f367b-8870-43d8-ae84-7d134b995d8b','ff5d5e69-8d0e-11e9-a552-005056bf7e34',750,'EMM','MEquation','asbindra','anonymousUser','2019-07-04 07:01:05','N','admin','2019-07-04 05:14:09'),('e9eab7fe-59c0-4b16-80d6-9c9d8b089dc4','ff5d5e69-8d0e-11e9-a552-005056bf7e34',155,'KEY','Keycloack','admin','anonymousUser','2019-07-03 10:57:58','N','anonymousUser','2019-07-03 10:57:58'),('ff7284da-2f68-4db3-bcb2-e0507ce8af3e','ff5d5e69-8d0e-11e9-a552-005056bf7e34',170,'FBUXM','FB UX Modernization','prithdeb','admin','2019-07-16 06:48:37','Y','',NULL),('ff7285da-2f68-4db3-bcb2-e0507ce8af3e','ff5d5e69-8d0e-11e9-a552-005056bf7e34',188,'FSSO','Fusion  SSO','vikkumar','anonymousUser','2019-07-12 07:17:07','N','',NULL);
/*!40000 ALTER TABLE `org_jira_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_location`
--

DROP TABLE IF EXISTS `org_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org_location` (
  `location_id` char(36) NOT NULL COMMENT 'Unique identifier',
  `product_org_id` char(36) NOT NULL COMMENT 'Identifier of the product organization',
  `location_name` varchar(80) NOT NULL COMMENT 'Name of the location',
  `location_desc` varchar(240) DEFAULT NULL COMMENT 'Brief description about the location',
  `active_flag` char(1) NOT NULL DEFAULT 'N' COMMENT 'Flag to denote whether the entity is marked as active or inactive',
  `created_by` char(36) NOT NULL COMMENT 'Audit: WHO created',
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Audit: WHEN created',
  `last_updated_by` varchar(36) NOT NULL,
  `last_updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`location_id`),
  UNIQUE KEY `org_location_uk1` (`product_org_id`,`location_name`),
  KEY `org_location_ix1` (`active_flag`),
  KEY `org_location_ix2` (`product_org_id`),
  CONSTRAINT `org_location_fk1` FOREIGN KEY (`product_org_id`) REFERENCES `product_org` (`product_org_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Locations associated with product organizations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_location`
--

LOCK TABLES `org_location` WRITE;
/*!40000 ALTER TABLE `org_location` DISABLE KEYS */;
INSERT INTO `org_location` VALUES ('ff8aaa14-8d0e-11e9-a552-005056bf7e34','ff5d5e69-8d0e-11e9-a552-005056bf7e34','BANGALORE','Bangalore - India','Y','SEED','2019-06-12 18:08:47','',NULL),('ff8e8936-8d0e-11e9-a552-005056bf7e34','ff649d6c-8d0e-11e9-a552-005056bf7e35','MANILA','Manila - Phillippines','Y','SEED','2019-06-12 18:08:47','',NULL),('ff8fc1d1-8d0e-11e9-a552-005056bf7e34','ff67f8fd-8d0e-11e9-a552-005056bf7e36','DUBAI','Dubai - UAE','Y','SEED','2019-06-12 18:08:47','',NULL),('ff9184e6-8d0e-11e9-a552-005056bf7e34','ff67f8fd-8d0e-11e9-a552-005056bf7e36','PADDINGTON','Paddington - UK','Y','SEED','2019-06-12 18:08:47','',NULL);
/*!40000 ALTER TABLE `org_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_project`
--

DROP TABLE IF EXISTS `org_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org_project` (
  `project_id` char(36) NOT NULL COMMENT 'Unique identifier',
  `product_org_id` char(36) NOT NULL COMMENT 'Identifier of the product organization',
  `project_name` varchar(80) NOT NULL COMMENT 'JIRA - Project identifier',
  `project_desc` varchar(240) DEFAULT NULL COMMENT 'JIRA - Project key',
  `project_owner_id` char(36) NOT NULL COMMENT 'JIRA - Project Name',
  `active_flag` char(1) NOT NULL DEFAULT 'N' COMMENT 'Flag to denote whether the entity is marked as active or inactive',
  `est_pm_start_date` date DEFAULT NULL COMMENT 'Requirement - Estimated start date',
  `est_pm_end_date` date DEFAULT NULL COMMENT 'Requirement - Estimated end date',
  `est_dev_start_date` date DEFAULT NULL COMMENT 'Development - Estimated start date',
  `est_dev_end_date` date DEFAULT NULL COMMENT 'Development - Estimated end date',
  `est_test_start_date` date DEFAULT NULL COMMENT 'Testing - Estimated start date',
  `est_test_end_date` date DEFAULT NULL COMMENT 'Testing - Estimated end date',
  `est_release_date` date DEFAULT NULL COMMENT 'Release - Estimated date',
  `act_pm_start_date` date DEFAULT NULL COMMENT 'Requirement - Actual start date',
  `act_pm_end_date` date DEFAULT NULL COMMENT 'Requirement - Actual end date',
  `act_dev_start_date` date DEFAULT NULL COMMENT 'Development - Actual start date',
  `act_dev_end_date` date DEFAULT NULL COMMENT 'Development - Actual end date',
  `act_test_start_date` date DEFAULT NULL COMMENT 'Testing - Actual start date',
  `act_test_end_date` date DEFAULT NULL COMMENT 'Testing - Actual end date',
  `act_release_date` date DEFAULT NULL COMMENT 'Release - Actual date',
  `created_by` char(36) NOT NULL COMMENT 'Audit: WHO created',
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Audit: WHEN created',
  `last_updated_by` varchar(36) NOT NULL,
  `last_updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`project_id`),
  UNIQUE KEY `org_project_uk1` (`product_org_id`,`project_name`),
  KEY `org_project_ix1` (`product_org_id`),
  KEY `org_project_ix2` (`active_flag`),
  KEY `org_project_ix3` (`project_owner_id`),
  CONSTRAINT `org_project_fk1` FOREIGN KEY (`product_org_id`) REFERENCES `product_org` (`product_org_id`) ON UPDATE CASCADE,
  CONSTRAINT `org_project_fk2` FOREIGN KEY (`project_owner_id`) REFERENCES `app_user` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Projects belong to product organizations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_project`
--

LOCK TABLES `org_project` WRITE;
/*!40000 ALTER TABLE `org_project` DISABLE KEYS */;
INSERT INTO `org_project` VALUES ('28806','ff5d5e69-8d0e-11e9-a552-005056bf7e34','Essence Modernization','Persona Based Banking and REST APIs','e3240fdb-7435-4300-bbfa-724775a7bc83','Y','2019-06-10','2019-07-10','2019-07-20','2019-11-20','2019-08-20','2019-11-30','2019-12-05','2019-06-10','2019-07-10','2019-07-01','2019-11-20','2019-08-20','2019-11-30','2019-12-05','admin','2019-06-10 04:38:24','admin',NULL),('29804','ff649d6c-8d0e-11e9-a552-005056bf7e35','Essence Equation','Equation core Banking','0abe421b-091a-4d0e-90d6-53fb78ddeec4','N','2019-07-01','2019-08-01','2019-07-12','2019-07-31','2019-07-12','2019-07-31','2019-07-12','2019-07-12','2019-07-31','2019-07-12','2019-07-31','2019-07-12','2019-07-31','2019-07-31','admin','2019-07-12 07:21:01','admin','2019-07-12 11:54:37'),('29912','ff5d5e69-8d0e-11e9-a552-005056bf7e34','Authentication Management','Single Sign On User and Role Management','cfa9329b-8650-4a6b-be58-762e54b48912','Y','2019-06-07','2019-06-16','2019-07-01','2019-11-30','2019-08-17','2019-11-27','2020-12-12','2019-06-07','2019-07-07','2019-07-31','2019-11-17','2019-08-17','2019-11-27','2019-12-02','admin','2019-06-10 04:38:24','admin','2019-07-22 06:02:09');
/*!40000 ALTER TABLE `org_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_task_category`
--

DROP TABLE IF EXISTS `org_task_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org_task_category` (
  `task_category_id` char(36) NOT NULL COMMENT 'Unique identifier',
  `product_org_id` char(36) NOT NULL COMMENT 'Identifier of the task category',
  `task_category_name` varchar(80) NOT NULL COMMENT 'Name of the task category',
  `task_category_desc` varchar(240) DEFAULT NULL COMMENT 'Brief description about the task category',
  `active_flag` char(1) NOT NULL DEFAULT 'N' COMMENT 'Flag to denote whether the entity is marked as active or inactive',
  `created_by` char(36) NOT NULL COMMENT 'Audit: WHO created',
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Audit: WHEN created',
  `last_updated_by` varchar(36) NOT NULL,
  `last_updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`task_category_id`),
  UNIQUE KEY `org_task_category_uk1` (`product_org_id`,`task_category_name`),
  KEY `org_task_category_ix1` (`product_org_id`),
  KEY `org_task_category_ix2` (`active_flag`),
  CONSTRAINT `org_task_category_fk1` FOREIGN KEY (`product_org_id`) REFERENCES `product_org` (`product_org_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Task categories pertaining to product organization';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_task_category`
--

LOCK TABLES `org_task_category` WRITE;
/*!40000 ALTER TABLE `org_task_category` DISABLE KEYS */;
INSERT INTO `org_task_category` VALUES ('25d085dd-8614-40eb-be91-95131061647a','ff5d5e69-8d0e-11e9-a552-005056bf7e34','CUSTOMER','Customer Driven','Y','SEED','2019-06-12 18:08:47','',NULL),('ffb16ac0-8d0e-11e9-a552-005056bf7e34','ff5d5e69-8d0e-11e9-a552-005056bf7e34','TECH DEBT','Technical Debt','Y','SEED','2019-06-12 18:08:47','',NULL),('ffb3154a-8d0e-11e9-a552-005056bf7e34','ff5d5e69-8d0e-11e9-a552-005056bf7e34','QUALITY','Quality Improvement','Y','SEED','2019-06-12 18:08:47','',NULL),('ffb59d39-8d0e-11e9-a552-005056bf7e34','ff5d5e69-8d0e-11e9-a552-005056bf7e34','MARKET OPPORTUNITY','Market Opportunity','Y','SEED','2019-06-12 18:08:48','',NULL),('ffb83806-8d0e-11e9-a552-005056bf7e34','ff5d5e69-8d0e-11e9-a552-005056bf7e34','STABILTY','Product Stability','Y','SEED','2019-06-12 18:08:48','',NULL);
/*!40000 ALTER TABLE `org_task_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_task_type`
--

DROP TABLE IF EXISTS `org_task_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org_task_type` (
  `task_type_id` char(36) NOT NULL COMMENT 'Unique identifier',
  `product_org_id` char(36) NOT NULL COMMENT 'Identifier of the task type',
  `task_type_name` varchar(80) NOT NULL COMMENT 'Name of the task type',
  `task_type_desc` varchar(240) DEFAULT NULL COMMENT 'Brief description about the task type',
  `active_flag` char(1) NOT NULL DEFAULT 'N' COMMENT 'Flag to denote whether the entity is marked as active or inactive',
  `created_by` char(36) NOT NULL COMMENT 'Audit: WHO created',
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Audit: WHEN created',
  `last_updated_by` varchar(36) NOT NULL,
  `last_updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`task_type_id`),
  UNIQUE KEY `org_task_type_uk1` (`product_org_id`,`task_type_name`),
  KEY `org_task_type_ix1` (`product_org_id`),
  KEY `org_task_type_ix2` (`active_flag`),
  CONSTRAINT `org_task_type_fk1` FOREIGN KEY (`product_org_id`) REFERENCES `product_org` (`product_org_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Task types associated with product organization';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_task_type`
--

LOCK TABLES `org_task_type` WRITE;
/*!40000 ALTER TABLE `org_task_type` DISABLE KEYS */;
INSERT INTO `org_task_type` VALUES ('c3ede33b-721b-4fd9-acb9-2697c39ea6b4','ff5d5e69-8d0e-11e9-a552-005056bf7e34','STRATEGIC','Strategic Development','Y','SEED','2019-06-12 18:08:47','',NULL),('ffa362f0-8d0e-11e9-a552-005056bf7e34','ff5d5e69-8d0e-11e9-a552-005056bf7e34','MAINTENANCE','Maintenance Development','Y','SEED','2019-06-12 18:08:47','',NULL),('ffa5f121-8d0e-11e9-a552-005056bf7e34','ff5d5e69-8d0e-11e9-a552-005056bf7e34','IMPLEMENTATION','Implementation','Y','SEED','2019-06-12 18:08:47','',NULL),('ffa74e93-8d0e-11e9-a552-005056bf7e34','ff5d5e69-8d0e-11e9-a552-005056bf7e34','STABILIZATION','Stabilization Efforts','Y','SEED','2019-06-12 18:08:47','',NULL);
/*!40000 ALTER TABLE `org_task_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_category` (
  `product_category_id` char(36) NOT NULL COMMENT 'Unique identifier',
  `product_org_id` char(36) NOT NULL COMMENT 'Identifier of the product organization',
  `product_category_name` varchar(80) NOT NULL COMMENT 'Name of the product category, which is unique',
  `product_category_desc` varchar(240) DEFAULT NULL COMMENT 'Brief description about the product category',
  `active_flag` char(1) NOT NULL DEFAULT 'N' COMMENT 'Flag to denote whether the entity is marked as active or inactive',
  `created_by` char(36) NOT NULL COMMENT 'Audit: WHO created',
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Audit: WHEN created',
  `last_updated_by` varchar(36) NOT NULL,
  `last_updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`product_category_id`),
  UNIQUE KEY `product_category_uk1` (`product_org_id`,`product_category_name`),
  KEY `product_category_ix1` (`active_flag`),
  KEY `product_category_ix2` (`product_org_id`),
  CONSTRAINT `product_category_fk1` FOREIGN KEY (`product_org_id`) REFERENCES `product_org` (`product_org_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Product categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES ('ff734cda-8d0e-11e9-a552-005056bf7e34','ff5d5e69-8d0e-11e9-a552-005056bf7e34','CORE','Core Module','Y','SEED','2019-06-12 18:08:47','',NULL),('ff7c9384-8d0e-11e9-a552-005056bf7e34','ff5d5e69-8d0e-11e9-a552-005056bf7e34','PAYMENT','Payment Module','Y','SEED','2019-06-12 18:08:47','',NULL),('ff804d61-8d0e-11e9-a552-005056bf7e34','ff5d5e69-8d0e-11e9-a552-005056bf7e34','LENDING','Lending Module','Y','SEED','2019-06-12 18:08:47','',NULL),('ff83f10d-8d0e-11e9-a552-005056bf7e34','ff5d5e69-8d0e-11e9-a552-005056bf7e34','TELLER','Teller Module','Y','SEED','2019-06-12 18:08:47','',NULL),('ff857b50-8d0e-11e9-a552-005056bf7e34','ff5d5e69-8d0e-11e9-a552-005056bf7e34','PARTY','Party Module','Y','SEED','2019-06-12 18:08:47','',NULL),('ff870147-8d0e-11e9-a552-005056bf7e34','ff5d5e69-8d0e-11e9-a552-005056bf7e34','PLATFORM','Platform Module','Y','SEED','2019-06-12 18:08:47','',NULL),('ff890147-8d0e-11e9-a552-005056bf7e34','ff5d5e69-8d0e-11e9-a552-005056bf7e34','NEXTGEN','Digital Module','Y','SEED','2019-06-12 18:08:47','',NULL);
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_function`
--

DROP TABLE IF EXISTS `product_function`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_function` (
  `product_function_id` char(36) NOT NULL COMMENT 'Unique identifier',
  `product_function_name` varchar(80) NOT NULL COMMENT 'Name of the product functional area',
  `product_function_desc` varchar(240) DEFAULT NULL COMMENT 'Brief description about the product functional area',
  `active_flag` char(1) NOT NULL DEFAULT 'N' COMMENT 'Flag to denote whether the entity is marked as active or inactive',
  `created_by` char(36) NOT NULL COMMENT 'Audit: WHO created',
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Audit: WHEN created',
  `last_updated_by` varchar(36) NOT NULL,
  `last_updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`product_function_id`),
  UNIQUE KEY `product_function_ik1` (`product_function_name`),
  KEY `product_function_ix1` (`active_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Functional areas of product organization';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_function`
--

LOCK TABLES `product_function` WRITE;
/*!40000 ALTER TABLE `product_function` DISABLE KEYS */;
INSERT INTO `product_function` VALUES ('ffbc3930-8d0e-11e9-a552-005056bf7e34','MANAGEMENT','Management','Y','SEED','2019-06-12 18:08:48','',NULL),('ffbfe88c-8d0e-11e9-a552-005056bf7e34','DEVELOPMENT','Development','Y','SEED','2019-06-12 18:08:48','',NULL),('ffc2d46d-8d0e-11e9-a552-005056bf7e34','TESTING','Testing','Y','SEED','2019-06-12 18:08:48','',NULL),('ffc428d8-8d0e-11e9-a552-005056bf7e34','DOCUMENTATION','Documentation','Y','SEED','2019-06-12 18:08:48','',NULL),('ffc67691-8d0e-11e9-a552-005056bf7e34','PRODUCT MANAGEMENT','Product Management','Y','SEED','2019-06-12 18:08:48','',NULL),('ffc939bb-8d0e-11e9-a552-005056bf7e34','PROGRAM MANAGEMENT','Program Management','Y','SEED','2019-06-12 18:08:48','',NULL);
/*!40000 ALTER TABLE `product_function` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_org`
--

DROP TABLE IF EXISTS `product_org`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_org` (
  `product_org_id` char(36) NOT NULL COMMENT 'Unique identifier',
  `product_org_name` varchar(80) NOT NULL COMMENT 'Name of the product organization, which is unique',
  `product_org_desc` varchar(240) DEFAULT NULL COMMENT 'Brief description about the product organization',
  `active_flag` char(1) NOT NULL DEFAULT 'N' COMMENT 'Flag to denote whether the entity is marked as active or inactive',
  `created_by` char(36) NOT NULL COMMENT 'Audit: WHO created',
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Audit: WHEN created',
  `last_updated_by` varchar(36) NOT NULL,
  `last_updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`product_org_id`),
  UNIQUE KEY `product_org_uk1` (`product_org_name`),
  KEY `product_org_ix1` (`active_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Product organization';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_org`
--

LOCK TABLES `product_org` WRITE;
/*!40000 ALTER TABLE `product_org` DISABLE KEYS */;
INSERT INTO `product_org` VALUES ('ff5d5e69-8d0e-11e9-a552-005056bf7e34','ESSENCE','Essence Core Banking','Y','SEED','2019-06-12 18:08:47','',NULL),('ff649d6c-8d0e-11e9-a552-005056bf7e35','EQUATION','Equation Core Banking','Y','SEED','2019-06-12 18:08:47','',NULL),('ff67f8fd-8d0e-11e9-a552-005056bf7e36','MIDAS','Midas Core Banking','Y','SEED','2019-06-12 18:08:47','',NULL),('ff6e8ccd-8d0e-11e9-a552-005056bf7e37','MPM','Midas Payment Manager','Y','SEED','2019-06-12 18:08:47','',NULL);
/*!40000 ALTER TABLE `product_org` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_task`
--

DROP TABLE IF EXISTS `project_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_task` (
  `project_task_id` char(36) NOT NULL,
  `product_org_id` varchar(36) NOT NULL,
  `product_category_id` varchar(36) NOT NULL,
  `product_function_id` varchar(36) NOT NULL,
  `task_type_id` varchar(36) NOT NULL,
  `task_category_id` varchar(36) NOT NULL,
  `project_id` varchar(36) NOT NULL,
  `jira_project_id` varchar(36) NOT NULL,
  `complexity_id` varchar(36) NOT NULL,
  `success_score` int(11) DEFAULT NULL,
  `failure_score` int(11) DEFAULT NULL,
  `jira_issue_id` decimal(18,0) NOT NULL,
  `jira_pkey` varchar(255) NOT NULL,
  `jira_issue_num` varchar(36) NOT NULL,
  `jira_project` decimal(18,0) NOT NULL,
  `jira_reporter` varchar(255) DEFAULT NULL,
  `jira_assignee` varchar(255) DEFAULT NULL,
  `assignee_user_id` varchar(36) NOT NULL,
  `jira_issue_type` varchar(255) DEFAULT NULL,
  `jira_priority` varchar(255) DEFAULT NULL,
  `jira_resolution` varchar(255) DEFAULT NULL,
  `jira_issue_status` varchar(255) DEFAULT NULL,
  `jira_est_start_date` date DEFAULT NULL,
  `jira_est_end_date` date DEFAULT NULL,
  `jira_created` datetime DEFAULT NULL,
  `jira_updated` datetime DEFAULT NULL,
  `jira_time_org_estimate` decimal(18,0) DEFAULT NULL,
  `jira_time_estimate` decimal(18,0) DEFAULT NULL,
  `jira_time_spent` decimal(18,0) DEFAULT NULL,
  `created_by` varchar(36) NOT NULL,
  `created_on` datetime NOT NULL,
  `last_updated_by` varchar(36) NOT NULL,
  `last_updated_on` datetime DEFAULT NULL,
  `jira_summary` varchar(255) DEFAULT NULL,
  `risk_indicator` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`project_task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_task`
--

LOCK TABLES `project_task` WRITE;
/*!40000 ALTER TABLE `project_task` DISABLE KEYS */;
INSERT INTO `project_task` VALUES ('02f0e7af-d828-41b7-839c-077f37d50df6','ff649d6c-8d0e-11e9-a552-005056bf7e35','ff734cda-8d0e-11e9-a552-005056bf7e34','ffbc3930-8d0e-11e9-a552-005056bf7e34','c3ede33b-721b-4fd9-acb9-2697c39ea6b4','25d085dd-8614-40eb-be91-95131061647a','29912','ff7284da-2f68-4db3-bcb2-e0507ce8af3e','25d085dd-8614-40eb-be91-95131061647a',NULL,NULL,1753914,'FBUXM-149','1753914',29912,'Ganesan, Rakesh','Manjunathd','e3240fdb-7435-4300-bbfa-724775a7bc83','Story','Medium',NULL,'Open',NULL,NULL,'2017-08-27 00:57:02',NULL,0,22,1,'admin','2019-08-13 09:55:08','admin','2019-08-13 09:55:08','Account Amendment - Sole to Joint and Joint to Sole','T'),('2a1516ac-89ef-4d17-a724-dd9e24f76551','ff649d6c-8d0e-11e9-a552-005056bf7e35','ff734cda-8d0e-11e9-a552-005056bf7e34','ffbfe88c-8d0e-11e9-a552-005056bf7e34','c3ede33b-721b-4fd9-acb9-2697c39ea6b4','25d085dd-8614-40eb-be91-95131061647a','29912','ff7284da-2f68-4db3-bcb2-e0507ce8af3e','25d085dd-8614-40eb-be91-95131061647a',NULL,NULL,2121759,'FBUXM-795','2121759',29912,'Shetty, Nishita','siarbind','39fe7be3-db89-4c5c-8a63-e9176d584039','Defect','Medium','Fixed','Built',NULL,NULL,'2019-06-19 09:09:00',NULL,0,38,1,'anonymousUser','2019-07-04 14:32:31','anonymousUser','2019-07-04 14:32:31','FORWARD - [FBUXM 5.3.1.3.1]The address lookup doesn\'t work as expected in PBB','F'),('74c68628-3059-42f5-8ec1-564e4325bf8c','ff5d5e69-8d0e-11e9-a552-005056bf7e34','ff734cda-8d0e-11e9-a552-005056bf7e34','ffbfe88c-8d0e-11e9-a552-005056bf7e34','c3ede33b-721b-4fd9-acb9-2697c39ea6b4','25d085dd-8614-40eb-be91-95131061647a','28806','ff7285da-2f68-4db3-bcb2-e0507ce8af3e','25d085dd-8614-40eb-be91-95131061647a',NULL,NULL,2112971,'FSSO-857','2112971',28806,'Gopalakrishna Ms','asbindra','0abe421b-091a-4d0e-90d6-53fb78ddeec4','Defect','Medium','Fixed','Resolved',NULL,NULL,'2019-06-03 05:03:10',NULL,0,0,1,'system','2019-08-23 10:32:00','system','2019-09-03 05:54:02','[FBPQA]-should get proper error message if queue is down while creating a user is SSO','T'),('93b26005-23bc-420f-b12f-97b83dc0754d','ff5d5e69-8d0e-11e9-a552-005056bf7e34','ff734cda-8d0e-11e9-a552-005056bf7e34','ffbfe88c-8d0e-11e9-a552-005056bf7e34','c3ede33b-721b-4fd9-acb9-2697c39ea6b4','25d085dd-8614-40eb-be91-95131061647a','28806','ff7285da-2f68-4db3-bcb2-e0507ce8af3e','25d085dd-8614-40eb-be91-95131061647a',NULL,NULL,2159037,'FSSO-892','2159037',28806,'Gopalakrishna Ms','suha.noorain','0abe421b-091a-4d0e-90d6-53fb78ddeee5','Defect','High',NULL,'Open',NULL,NULL,'2019-08-29 05:32:24',NULL,0,0,0,'admin','2019-08-30 10:25:13','system','2019-09-03 05:54:02','Fusion SSO - 5.3.1.5.x- SessionID not deleted from on Logoff','T'),('990e2e21-04e7-4149-8268-fd8d00759825','ff5d5e69-8d0e-11e9-a552-005056bf7e34','ff734cda-8d0e-11e9-a552-005056bf7e34','ffbfe88c-8d0e-11e9-a552-005056bf7e34','c3ede33b-721b-4fd9-acb9-2697c39ea6b4','25d085dd-8614-40eb-be91-95131061647a','28806','ff7285da-2f68-4db3-bcb2-e0507ce8af3e','25d085dd-8614-40eb-be91-95131061647a',NULL,NULL,2118900,'FSSO-871','2118900',28806,'Tarayao, Rodel','gopalams','febcba46-4ca3-4882-8d26-53939fbae111','Defect','Medium','Fixed','Built',NULL,NULL,'2019-06-13 09:46:03',NULL,0,0,1,'admin','2019-08-27 09:02:00','system','2019-09-03 05:54:02','FORWARD - [USER API]  Misspelled EventID was logged  after sending an Invalid Phone Number','T'),('a34dade3-9468-4ee1-b106-07545c811484','ff5d5e69-8d0e-11e9-a552-005056bf7e34','ff734cda-8d0e-11e9-a552-005056bf7e34','ffbfe88c-8d0e-11e9-a552-005056bf7e34','c3ede33b-721b-4fd9-acb9-2697c39ea6b4','25d085dd-8614-40eb-be91-95131061647a','28806','ff7285da-2f68-4db3-bcb2-e0507ce8af3e','25d085dd-8614-40eb-be91-95131061647a',NULL,NULL,2112951,'FSSO-854','2112951',28806,'Gopalakrishna Ms','tejasyvl','24cf0e2e-c795-4b6e-9c45-fbd55b62e6aa','Story','Medium','Done','Done',NULL,NULL,'2019-06-03 04:44:52',NULL,0,0,3,'anonymousUser','2019-07-04 14:32:29','system','2019-08-13 10:43:02','[CLONED] Password encoding in cas.properties and Tomcat server.xml','F'),('b0908c00-f712-469d-8317-e1d1f5de8fbc','ff5d5e69-8d0e-11e9-a552-005056bf7e34','ff734cda-8d0e-11e9-a552-005056bf7e34','ffc2d46d-8d0e-11e9-a552-005056bf7e34','c3ede33b-721b-4fd9-acb9-2697c39ea6b4','25d085dd-8614-40eb-be91-95131061647a','29804','ff7285da-2f68-4db3-bcb2-e0507ce8af3e','25d085dd-8614-40eb-be91-95131061647a',NULL,NULL,2113389,'FSSO-859','2113389',28806,'Gopalakrishna Ms','Dillep','cfa9329b-8650-4a6b-be58-762e54b48333','Defect','Medium','Fixed','Built',NULL,NULL,'2019-06-03 09:50:15',NULL,0,2,1,'anonymousUser','2019-07-04 14:32:29','system','2019-07-11 06:34:02','[FBPQA]-Should not allow space for Application ID field in Maintain Application microflow','T'),('b7c0e28a-c086-4359-b78d-914b551f3694','ff67f8fd-8d0e-11e9-a552-005056bf7e36','ff734cda-8d0e-11e9-a552-005056bf7e34','ffc67691-8d0e-11e9-a552-005056bf7e34','c3ede33b-721b-4fd9-acb9-2697c39ea6b4','25d085dd-8614-40eb-be91-95131061647a','29912','ff7284da-2f68-4db3-bcb2-e0507ce8af3e','25d085dd-8614-40eb-be91-95131061647a',NULL,NULL,1762774,'FBUXM-220','1762774',29912,'Shetty, Nishita','prithdeb','03bc2038-374b-468d-a83b-f2ec818b5e2a','Improvement','Medium',NULL,'Open',NULL,NULL,'2017-09-08 13:35:11',NULL,0,9,8,'anonymousUser','2019-07-04 14:32:33','anonymousUser','2019-07-04 14:32:33','[FBUXM 5.2.1][T]The Name of the application should be dispalyed along with the branch and the date ','F'),('c1472fc9-df14-4346-b779-4f7181431234','ff6e8ccd-8d0e-11e9-a552-005056bf7e37','ff734cda-8d0e-11e9-a552-005056bf7e34','ffbfe88c-8d0e-11e9-a552-005056bf7e34','c3ede33b-721b-4fd9-acb9-2697c39ea6b4','25d085dd-8614-40eb-be91-95131061647a','29804','ff7284da-2f68-4db3-bcb2-e0507ce8af3e','25d085dd-8614-40eb-be91-95131061647a',NULL,NULL,2120263,'FBUXM-793','2120263',29912,'Prithumit Deb','asbindra','5556236e-d4f5-420d-84d4-17eadc97ac9f','Defect','High',NULL,'In Progress',NULL,NULL,'2019-06-17 07:11:34',NULL,0,8,7,'anonymousUser','2019-07-04 14:32:31','anonymousUser','2019-07-04 14:32:31','[Tech] Dependency build issues in PBB modules for dependent layers','T'),('ce2be20c-876a-4809-b619-72500f7a173f','ff67f8fd-8d0e-11e9-a552-005056bf7e36','ff734cda-8d0e-11e9-a552-005056bf7e34','ffbfe88c-8d0e-11e9-a552-005056bf7e34','c3ede33b-721b-4fd9-acb9-2697c39ea6b4','25d085dd-8614-40eb-be91-95131061647a','29804','ff7285da-2f68-4db3-bcb2-e0507ce8af3e','25d085dd-8614-40eb-be91-95131061647a',NULL,NULL,2118084,'FSSO-869','2118084',28806,'Karanth, Ashwin','Karanth, ','e3250fdb-7435-4300-bbfa-724775a7b222','Story','Medium','Done','Done',NULL,NULL,'2019-06-12 08:05:23',NULL,0,2,99,'anonymousUser','2019-07-04 14:32:28','system','2019-07-18 04:29:02','[Forward] Synchronization of Users from FSSO to FBP Global and Party applications','T'),('d1358a02-c903-4065-87ca-f225a573e0e3','ff5d5e69-8d0e-11e9-a552-005056bf7e34','ff734cda-8d0e-11e9-a552-005056bf7e34','ffbfe88c-8d0e-11e9-a552-005056bf7e34','c3ede33b-721b-4fd9-acb9-2697c39ea6b4','25d085dd-8614-40eb-be91-95131061647a','28806','ff7285da-2f68-4db3-bcb2-e0507ce8af3e','25d085dd-8614-40eb-be91-95131061647a',NULL,NULL,2112946,'FSSO-853','2112946',28806,'Gopalakrishna Ms','mdongala','37eaefa3-5892-4857-ab7f-ae141f4813c0','Defect','Medium','Fixed','Built',NULL,NULL,'2019-06-03 04:43:50',NULL,0,0,1,'system','2019-08-23 10:32:00','system','2019-09-03 05:54:02','[Dev] Moving FBPEncryptionUtil as part of bundle delivery.','T'),('d3093c4f-5445-4f74-96f6-5ae25234400f','ff5d5e69-8d0e-11e9-a552-005056bf7e34','ff734cda-8d0e-11e9-a552-005056bf7e34','ffbfe88c-8d0e-11e9-a552-005056bf7e34','c3ede33b-721b-4fd9-acb9-2697c39ea6b4','25d085dd-8614-40eb-be91-95131061647a','28806','ff7285da-2f68-4db3-bcb2-e0507ce8af3e','25d085dd-8614-40eb-be91-95131061647a',NULL,NULL,2112969,'FSSO-855','2112969',28806,'Gopalakrishna Ms','shravaks','20b1c472-8e69-42ae-9277-2fd1d6f10a63','Defect','Medium','Fixed','Built',NULL,NULL,'2019-06-03 05:01:00',NULL,0,0,0,'system','2019-08-23 10:27:00','system','2019-09-03 05:54:02','SSO Services dont come up when bankfusion.properties is having User.Maximum.Logins=1','T'),('e2e9ccda-0f94-4ed3-9af6-f4bce15f21e1','ff5d5e69-8d0e-11e9-a552-005056bf7e34','ff734cda-8d0e-11e9-a552-005056bf7e34','ffbfe88c-8d0e-11e9-a552-005056bf7e34','c3ede33b-721b-4fd9-acb9-2697c39ea6b4','25d085dd-8614-40eb-be91-95131061647a','28806','ff7285da-2f68-4db3-bcb2-e0507ce8af3e','25d085dd-8614-40eb-be91-95131061647a',NULL,NULL,2112970,'FSSO-856','2112970',28806,'Gopalakrishna Ms','surghosh','0dab274b-a675-453a-a427-3762b0bc0912','Defect','Medium','Fixed','Built',NULL,NULL,'2019-06-03 05:01:45',NULL,0,0,0,'system','2019-08-23 10:31:00','system','2019-09-03 05:54:02','[FBPQA]-In Create User microflow table lables are merging with tables','T'),('ee91d175-7c79-40a3-b6ad-0cc70e091b1b','ff5d5e69-8d0e-11e9-a552-005056bf7e34','ff734cda-8d0e-11e9-a552-005056bf7e34','ffbfe88c-8d0e-11e9-a552-005056bf7e34','c3ede33b-721b-4fd9-acb9-2697c39ea6b4','25d085dd-8614-40eb-be91-95131061647a','28806','ff7285da-2f68-4db3-bcb2-e0507ce8af3e','25d085dd-8614-40eb-be91-95131061647a',NULL,NULL,2112972,'FSSO-858','2112972',28806,'Gopalakrishna Ms','vishwan0','087f530e-641e-4612-9217-785d4a8fca52','Defect','High','Fixed','Resolved',NULL,NULL,'2019-06-03 05:04:14',NULL,0,0,1,'system','2019-08-23 10:32:00','system','2019-09-03 05:54:02','Failing to load the camel in FusionSSO_5.3.1.5.69','T'),('f3651a76-dddb-42f5-98b1-e3457591c12f','ff5d5e69-8d0e-11e9-a552-005056bf7e34','ff734cda-8d0e-11e9-a552-005056bf7e34','ffc67691-8d0e-11e9-a552-005056bf7e34','c3ede33b-721b-4fd9-acb9-2697c39ea6b4','25d085dd-8614-40eb-be91-95131061647a','29912','ff7284da-2f68-4db3-bcb2-e0507ce8af3e','25d085dd-8614-40eb-be91-95131061647a',NULL,NULL,2156256,'FBUXM-819','2156256',29912,'Prithumit Deb','john','03bc2038-374b-468d-a83b-f2ec818b5e2a','Technical task','High',NULL,'In Progress',NULL,NULL,'2019-08-23 06:00:40',NULL,0,0,4,'admin','2019-08-30 10:42:26','admin','2019-08-30 12:08:08','Documentation - [Tech] Tracking US - DCO UI - Technical Document on localization framework and guidelines ','F');
/*!40000 ALTER TABLE `project_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill_level`
--

DROP TABLE IF EXISTS `skill_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skill_level` (
  `skill_level_id` char(36) NOT NULL COMMENT 'Unique identifier',
  `skill_level_name` varchar(80) NOT NULL COMMENT 'Name of the skill level',
  `skill_level_desc` varchar(240) DEFAULT NULL COMMENT 'Brief description about the skill level',
  `active_flag` char(1) NOT NULL DEFAULT 'N' COMMENT 'Flag to denote whether the entity is marked as active or inactive',
  `created_by` char(36) NOT NULL COMMENT 'Audit: WHO created',
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Audit: WHEN created',
  `last_updated_by` varchar(36) NOT NULL,
  `last_updated_on` datetime DEFAULT NULL,
  `last_modified_by` varchar(50) DEFAULT NULL,
  `last_modified_on` datetime DEFAULT NULL,
  PRIMARY KEY (`skill_level_id`),
  UNIQUE KEY `skill_level_uk1` (`skill_level_name`),
  KEY `skill_level_ix1` (`active_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Skill levels associated with the product organization';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill_level`
--

LOCK TABLES `skill_level` WRITE;
/*!40000 ALTER TABLE `skill_level` DISABLE KEYS */;
INSERT INTO `skill_level` VALUES ('ffef757c-8d0e-11e9-a552-005056bf7e34','EXPERT','Expert','Y','SEED','2019-06-12 18:08:48','',NULL,NULL,NULL),('fff4c9ba-8d0e-11e9-a552-005056bf7e34','PLAYER','Player','Y','SEED','2019-06-12 18:08:48','',NULL,NULL,NULL),('fff78509-8d0e-11e9-a552-005056bf7e34','ROOKIE','Rookie','Y','SEED','2019-06-12 18:08:48','',NULL,NULL,NULL);
/*!40000 ALTER TABLE `skill_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill_set`
--

DROP TABLE IF EXISTS `skill_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skill_set` (
  `skill_set_id` char(36) NOT NULL COMMENT 'Unique identifier',
  `product_function_id` char(36) NOT NULL COMMENT 'Identifier of the product functional area',
  `skill_set_name` varchar(80) NOT NULL COMMENT 'Name of the skill-set',
  `skill_set_desc` varchar(240) DEFAULT NULL COMMENT 'Brief description about the skill-set',
  `active_flag` char(1) NOT NULL DEFAULT 'N' COMMENT 'Flag to denote whether the entity is marked as active or inactive',
  `created_by` char(36) NOT NULL COMMENT 'Audit: WHO created',
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Audit: WHEN created',
  `last_updated_by` varchar(36) NOT NULL,
  `last_updated_on` datetime DEFAULT NULL,
  `last_modified_by` varchar(50) DEFAULT NULL,
  `last_modified_on` datetime DEFAULT NULL,
  PRIMARY KEY (`skill_set_id`),
  UNIQUE KEY `skill_set_uk1` (`product_function_id`,`skill_set_name`),
  KEY `skill_set_ix1` (`active_flag`),
  CONSTRAINT `skill_set_fk1` FOREIGN KEY (`product_function_id`) REFERENCES `product_function` (`product_function_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Skill sets associated with the product organization';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill_set`
--

LOCK TABLES `skill_set` WRITE;
/*!40000 ALTER TABLE `skill_set` DISABLE KEYS */;
INSERT INTO `skill_set` VALUES ('ffccbc9a-8d0e-11e9-a552-005056bf7e34','ffbfe88c-8d0e-11e9-a552-005056bf7e34','SERVER SIDE','Server-side Development','Y','SEED','2019-06-12 18:08:48','',NULL,NULL,NULL),('ffd0b277-8d0e-11e9-a552-005056bf7e34','ffbfe88c-8d0e-11e9-a552-005056bf7e34','CLIENT SIDE','Client-side Development','Y','SEED','2019-06-12 18:08:48','',NULL,NULL,NULL),('ffd2d1af-8d0e-11e9-a552-005056bf7e34','ffbfe88c-8d0e-11e9-a552-005056bf7e34','ARCHITECT','Architect','Y','SEED','2019-06-12 18:08:48','',NULL,NULL,NULL),('ffd486cc-8d0e-11e9-a552-005056bf7e34','ffbfe88c-8d0e-11e9-a552-005056bf7e34','FULL STACK','Full Stack Development','Y','SEED','2019-06-12 18:08:48','',NULL,NULL,NULL),('ffd65b71-8d0e-11e9-a552-005056bf7e34','ffc2d46d-8d0e-11e9-a552-005056bf7e34','MANUAL','Manual Testing','Y','SEED','2019-06-12 18:08:48','',NULL,NULL,NULL),('ffd9271c-8d0e-11e9-a552-005056bf7e34','ffc2d46d-8d0e-11e9-a552-005056bf7e34','AUTOMATION','Automated Testing','Y','SEED','2019-06-12 18:08:48','',NULL,NULL,NULL),('ffdb71c1-8d0e-11e9-a552-005056bf7e34','ffbc3930-8d0e-11e9-a552-005056bf7e34','LEADERSHIP','Leadership Team','Y','SEED','2019-06-12 18:08:48','',NULL,NULL,NULL),('ffdd85e5-8d0e-11e9-a552-005056bf7e34','ffbc3930-8d0e-11e9-a552-005056bf7e34','SENIOR MANAGEMENT','Senior Management Team','Y','SEED','2019-06-12 18:08:48','',NULL,NULL,NULL),('ffe05d41-8d0e-11e9-a552-005056bf7e34','ffc428d8-8d0e-11e9-a552-005056bf7e34','TECHNICAL WRITER','Technical Writer','Y','SEED','2019-06-12 18:08:48','',NULL,NULL,NULL),('ffe4ae7d-8d0e-11e9-a552-005056bf7e34','ffc428d8-8d0e-11e9-a552-005056bf7e34','DOCUMENT WRITER','Document Writer','Y','SEED','2019-06-12 18:08:48','',NULL,NULL,NULL),('ffe84f4a-8d0e-11e9-a552-005056bf7e34','ffc67691-8d0e-11e9-a552-005056bf7e34','PRODUCT MANAGER','Product Manager','Y','SEED','2019-06-12 18:08:48','',NULL,NULL,NULL),('ffead6c9-8d0e-11e9-a552-005056bf7e34','ffc67691-8d0e-11e9-a552-005056bf7e34','BUSINESS ANALYST','Business Analyst','Y','SEED','2019-06-12 18:08:48','',NULL,NULL,NULL),('ffecc730-8d0e-11e9-a552-005056bf7e34','ffc939bb-8d0e-11e9-a552-005056bf7e34','PROGRAM MANAGER','Program Manager','Y','SEED','2019-06-12 18:08:48','',NULL,NULL,NULL);
/*!40000 ALTER TABLE `skill_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_complexity`
--

DROP TABLE IF EXISTS `task_complexity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_complexity` (
  `complexity_id` char(36) NOT NULL COMMENT 'Unique identifier',
  `complexity_name` varchar(80) NOT NULL COMMENT 'Name of the complexity, which is unique',
  `complexity_desc` varchar(240) DEFAULT NULL COMMENT 'Brief description about the complexity',
  `active_flag` char(1) NOT NULL DEFAULT 'N' COMMENT 'Flag to denote whether the entity is marked as active or inactive',
  `created_by` char(36) NOT NULL COMMENT 'Audit: WHO created',
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Audit: WHEN created',
  `last_updated_by` char(36) NOT NULL COMMENT 'Audit: WHEN last updated',
  `last_updated_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Audit: WHEN last updated',
  PRIMARY KEY (`complexity_id`),
  UNIQUE KEY `task_complexity_uk1` (`complexity_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Complexity definition';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_complexity`
--

LOCK TABLES `task_complexity` WRITE;
/*!40000 ALTER TABLE `task_complexity` DISABLE KEYS */;
INSERT INTO `task_complexity` VALUES ('25d085dd-8614-40eb-be91-95131061647a','Medium_Complex','Medium Complexitiy','Y','admin','2019-06-25 11:58:03','admin','2019-06-25 11:58:03');
/*!40000 ALTER TABLE `task_complexity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_capacity`
--

DROP TABLE IF EXISTS `user_capacity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_capacity` (
  `capacity_id` char(36) NOT NULL COMMENT 'Unique identifier',
  `user_id` char(36) NOT NULL COMMENT 'User identifier',
  `month_code` char(8) NOT NULL COMMENT 'Code associated with the month, stored using MON-YYYY format',
  `available_days` int(11) NOT NULL,
  `created_by` char(36) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `active_flag` char(1) DEFAULT NULL,
  `last_updated_by` char(36) DEFAULT NULL,
  `last_updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`capacity_id`),
  UNIQUE KEY `user_capacity_uk1` (`user_id`,`month_code`),
  KEY `user_capacity_ix1` (`month_code`),
  CONSTRAINT `user_capacity_fk1` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Monthly available capacty in hours of users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_capacity`
--

LOCK TABLES `user_capacity` WRITE;
/*!40000 ALTER TABLE `user_capacity` DISABLE KEYS */;
INSERT INTO `user_capacity` VALUES ('ce3251b0-f55b-4f59-a9f0-6a2dd1f62d4b','5556236e-d4f5-420d-84d4-17eadc97ac9f','JAN-2019',8,'admin','2019-06-21 07:52:56','N','admin','2019-08-27 09:36:26'),('ce3251b0-f55b-4f59-a9f0-6a2dd1f62d4c','5556236e-d4f5-420d-84d4-17eadc97ac9f','FEB-2019',8,'admin','2019-06-21 07:52:56','N','admin','2019-08-27 09:36:26'),('ce3251b0-f55b-4f59-a9f0-6a2dd1f62d4d','5556236e-d4f5-420d-84d4-17eadc97ac9f','MAR-2019',10,'admin','2019-06-21 07:52:56','N','admin','2019-08-27 09:36:26'),('ce3251b0-f55b-4f59-a9f0-6a2dd1f62d4e','5556236e-d4f5-420d-84d4-17eadc97ac9f','APR-2019',8,'admin','2019-06-21 07:52:56','Y','admin','2019-08-27 09:36:26'),('ce3251b0-f55b-4f59-a9f0-6a2dd1f62d4f','5556236e-d4f5-420d-84d4-17eadc97ac9f','MAY-2019',7,'admin','2019-06-21 07:52:56','N','admin','2019-08-27 09:36:26'),('ce3251b0-f55b-4f59-a9f0-6a2dd1f62d4g','5556236e-d4f5-420d-84d4-17eadc97ac9f','JUN-2019',9,'admin','2019-06-21 07:52:56','Y','admin','2019-08-27 09:36:26'),('ce3251b0-f55b-4f59-a9f0-6a2dd1f62d4h','5556236e-d4f5-420d-84d4-17eadc97ac9f','JUL-2019',8,'admin','2019-06-21 07:52:56','N','admin','2019-08-27 09:36:26'),('ce3251b0-f55b-4f59-a9f0-6a2dd1f62d4i','5556236e-d4f5-420d-84d4-17eadc97ac9f','AUG-2019',8,'admin','2019-06-21 07:52:56','Y','admin','2019-08-27 09:36:26'),('ce3251b0-f55b-4f59-a9f0-6a2dd1f62d4j','5556236e-d4f5-420d-84d4-17eadc97ac9f','SEP-2019',8,'admin','2019-06-21 07:52:56','Y','admin','2019-08-27 09:36:26'),('ce3251b0-f55b-4f59-a9f0-6a2dd1f62d4k','5556236e-d4f5-420d-84d4-17eadc97ac9f','OCT-2019',4,'admin','2019-06-21 07:52:56','Y','admin','2019-08-27 09:36:26'),('ce3251b0-f55b-4f59-a9f0-6a2dd1f62d4l','5556236e-d4f5-420d-84d4-17eadc97ac9f','NOV-2019',9,'admin','2019-06-21 07:52:56','Y','admin','2019-08-27 09:36:26'),('ce3251b0-f55b-4f59-a9f0-6a2dd1f62d4m','5556236e-d4f5-420d-84d4-17eadc97ac9f','DEC-2019',9,'admin','2019-06-21 07:52:56','Y','admin','2019-08-27 09:36:26'),('ce3251b0-f55b-4f59-a9f0-6a2dd1f62d4n','03bc2038-374b-468d-a83b-f2ec818b5e2a','JAN-2019',8,'admin','2019-06-21 07:52:56','Y','admin','2019-08-27 10:19:52'),('ce3251b0-f55b-4f59-a9f0-6a2dd1f62d4o','febcba46-4ca3-4882-8d26-53939fbae111','NOV-2019',9,'admin','2019-06-21 07:52:56','Y','admin','2019-08-27 10:19:52');
/*!40000 ALTER TABLE `user_capacity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_holiday`
--

DROP TABLE IF EXISTS `user_holiday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_holiday` (
  `holiday_id` char(36) NOT NULL COMMENT 'Unique identifier',
  `user_id` char(36) NOT NULL COMMENT 'User identifier',
  `holiday_date` date NOT NULL COMMENT 'Holiday date',
  `half_day_flag` char(1) NOT NULL DEFAULT 'N' COMMENT 'Flag to denote whether the holiday is observed as half-day',
  `created_by` char(36) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `active_flag` char(1) DEFAULT NULL,
  `last_updated_by` char(36) DEFAULT NULL,
  `last_updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`holiday_id`),
  UNIQUE KEY `user_holiday_uk1` (`user_id`,`holiday_date`),
  KEY `user_holiday_ix1` (`holiday_date`),
  CONSTRAINT `user_holiday_fk1` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Vacations taken by users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_holiday`
--

LOCK TABLES `user_holiday` WRITE;
/*!40000 ALTER TABLE `user_holiday` DISABLE KEYS */;
INSERT INTO `user_holiday` VALUES ('0a69e115-0fcd-4bb8-91b6-53d57874f38f','0abe421b-091a-4d0e-90d6-53fb78ddeec4','2019-09-04','N','admin','2019-07-04 04:54:10','Y','admin','2019-07-04 04:54:10'),('0b21dd2a-802f-4b7c-a339-cf9019ddb2ef','03bc2038-374b-468d-a83b-f2ec818b5e2a','2019-07-04','N','admin','2019-07-04 04:51:49','Y','admin','2019-07-04 04:51:49'),('0dd6f39b-27ef-4595-aa1e-aff4003c58b8','f4f4e537-a383-42de-8602-27adaa38f21c','2019-07-06','N','anonymousUser','2019-07-05 06:58:44','Y','anonymousUser','2019-07-05 06:58:44'),('0f2438b5-6f8a-4f3e-9b47-e49020bb6998','f4f4e537-a383-42de-8602-27adaa38f21c','2019-07-02','Y','anonymousUser','2019-07-05 07:12:28','N','anonymousUser','2019-07-05 09:24:57'),('113fcd05-a9da-4734-92be-d851b2611a97','e3259fdb-7435-4300-bbfa-724775a7bc83','2019-07-19','N','admin','2019-07-16 05:12:40','N','admin','2019-07-18 05:21:23'),('12e4f803-8a0b-4045-be39-a937543c270f','060f8ae6-46b1-4fd5-86c8-58c25c6d4169','2019-07-03','N','anonymousUser','2019-07-04 13:17:51','Y','anonymousUser','2019-07-04 13:17:51'),('13231db6-5b73-4dfc-b90f-db298518a6e9','e3259fdb-7435-4300-bbfa-724775a7bc83','2019-07-31','N','admin','2019-07-16 05:15:46','N','admin','2019-07-18 05:21:27'),('15337705-6d86-40c0-b7a9-3f92ae3f4ef2','e3259fdb-7435-4300-bbfa-724775a7bc83','2019-07-15','N','anonymousUser','2019-07-15 10:46:29','N','anonymousUser','2019-07-15 10:46:29'),('1ee6ccd1-6fcf-41de-9b58-23259dc19496','e3259fdb-7435-4300-bbfa-724775a7bc83','2019-07-17','N','admin','2019-07-16 05:07:53','N','admin','2019-07-16 05:19:11'),('218b17ea-50b7-4249-9684-05a1e3c2a056','060f8ae6-46b1-4fd5-86c8-58c25c6d4169','2019-07-04','N','admin','2019-07-04 04:52:28','Y','admin','2019-07-04 08:51:44'),('2bfdd0f8-87d6-4837-9c84-132f285a9515','e3259fdb-7435-4300-bbfa-724775a7bc83','2019-07-14','Y','anonymousUser','2019-07-15 10:46:29','N','anonymousUser','2019-07-15 10:46:29'),('3c139aa6-f4a7-48d3-a39a-1edd09e61665','20b1c472-8e69-42ae-9277-2fd1d6f10a63','2019-07-03','N','anonymousUser','2019-07-04 12:41:39','Y','anonymousUser','2019-07-04 12:41:39'),('3e1d0431-1c8a-4669-9fd9-345c9850b261','f4f4e537-a383-42de-8602-27adaa38f21c','2019-07-07','N','anonymousUser','2019-07-05 06:58:44','Y','anonymousUser','2019-07-05 06:58:44'),('3eccf177-62f9-43f1-847b-a0c05bb85dff','0abe421b-091a-4d0e-90d6-53fb78ddeec4','2019-08-04','N','admin','2019-07-04 04:53:44','Y','admin','2019-07-04 04:53:44'),('6e6547a0-b873-4335-af34-35f2b4d1dfce','060f8ae6-46b1-4fd5-86c8-58c25c6d4169','2019-10-27','Y','admin','2019-08-27 09:08:27','N','admin','2019-08-27 09:08:27'),('7cb1fe50-34e7-44f3-97be-758ac7d8effd','03bc2038-374b-468d-a83b-f2ec818b5e2a','2019-10-27','Y','admin','2019-08-27 12:19:03','N','admin','2019-08-27 12:19:03'),('89640d93-2039-45e4-bc8c-165f2106371b','f4f4e537-a383-42de-8602-27adaa38f21c','2019-07-05','N','admin','2019-07-05 09:21:29','Y','admin','2019-07-05 09:21:29'),('96136ed5-ab78-4581-bf48-d1393307c7c9','e3259fdb-7435-4300-bbfa-724775a7bc83','2019-07-30','Y','admin','2019-07-16 05:15:46','N','admin','2019-08-27 09:38:36'),('c214ec96-d2a2-4ad0-be85-a88aaca1cfed','060f8ae6-46b1-4fd5-86c8-58c25c6d4169','2019-08-03','N','admin','2019-07-04 04:52:41','N','anonymousUser','2019-07-04 13:19:55'),('c5700576-a82b-4d3d-bec6-0288688f26e2','f4f4e537-a383-42de-8602-27adaa38f21c','2019-07-04','N','anonymousUser','2019-07-05 07:12:28','N','anonymousUser','2019-07-05 08:49:31'),('d00f1d4c-3424-4741-b6ff-1523f2fa55e2','e3240fdb-7435-4300-bbfa-724775a7bc83','2019-07-09','N','anonymousUser','2019-07-05 13:21:16','Y','anonymousUser','2019-07-05 13:21:16'),('d67f0a0b-bba7-4745-8e22-29ca8cd2c5f4','cfa9329b-8650-4a6b-be58-762e54b48333','2019-08-07','Y','anonymousUser','2019-07-05 13:21:16','N','anonymousUser','2019-07-05 13:21:18'),('db14b302-8822-4638-a0ed-f4d61a9df126','060f8ae6-46b1-4fd5-86c8-58c25c6d4169','2019-05-11','Y','admin','2019-06-22 08:12:34','N','anonymousUser','2019-07-04 13:19:59'),('db14b302-8823-4638-a0ed-f4d61a9df126','060f8ae6-46b1-4fd5-86c8-58c25c6d4169','2019-06-22','Y','admin','2019-06-22 08:12:34','Y','admin','2019-07-04 12:20:07'),('db14b302-8824-4638-a0ed-f4d61a9df126','060f8ae6-46b1-4fd5-86c8-58c25c6d4169','2019-03-04','Y','admin','2019-06-22 08:12:34','Y','anonymousUser','2019-07-04 12:32:06'),('dca6ce8c-901c-49e1-8d36-22a63610d2b1','cfa9329b-8650-4a6b-be58-762e54b48333','2019-08-20','Y','admin','2019-07-16 05:12:40','Y','admin','2019-07-16 05:12:40'),('dfd3eb2b-6936-43fc-853d-4f420d2c8700','cfa9329b-8650-4a6b-be58-762e54b48333','2019-08-18','Y','admin','2019-07-16 05:07:53','N','admin','2019-07-16 05:50:20'),('e4363014-6793-435e-ba0a-8774c5ea3b87','087f530e-641e-4612-9217-785d4a8fca52','2019-10-27','Y','admin','2019-08-27 09:11:50','N','admin','2019-08-27 09:11:50');
/*!40000 ALTER TABLE `user_holiday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'fbecapacityplanningapp'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-03 12:16:32
