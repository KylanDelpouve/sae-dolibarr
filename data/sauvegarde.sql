/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.20-13.0.2-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: dolibarr
-- ------------------------------------------------------
-- Server version	13.0.2-MariaDB-ubu2604

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `llx_accounting_account`
--

DROP TABLE IF EXISTS `llx_accounting_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_accounting_account` (
  `rowid` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_pcg_version` varchar(32) NOT NULL,
  `pcg_type` varchar(60) NOT NULL,
  `account_number` varchar(32) NOT NULL,
  `account_parent` int(11) DEFAULT 0,
  `label` varchar(255) NOT NULL,
  `labelshort` varchar(255) DEFAULT NULL,
  `fk_accounting_category` int(11) DEFAULT 0,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `centralized` tinyint(4) NOT NULL DEFAULT 0,
  `reconcilable` tinyint(4) NOT NULL DEFAULT 0,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_accounting_account` (`account_number`,`entity`,`fk_pcg_version`),
  KEY `idx_accounting_account_fk_pcg_version` (`fk_pcg_version`),
  KEY `idx_accounting_account_account_parent` (`account_parent`),
  CONSTRAINT `fk_accounting_account_fk_pcg_version` FOREIGN KEY (`fk_pcg_version`) REFERENCES `llx_accounting_system` (`pcg_version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_accounting_account`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_accounting_account` WRITE;
/*!40000 ALTER TABLE `llx_accounting_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_accounting_account` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_accounting_analytic_account`
--

DROP TABLE IF EXISTS `llx_accounting_analytic_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_accounting_analytic_account` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  `code` varchar(32) NOT NULL,
  `description` text DEFAULT NULL,
  `fk_axis` int(11) NOT NULL,
  `active` int(11) DEFAULT 1,
  `entity` int(11) NOT NULL DEFAULT 1,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_author` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_accounting_analytic_account` (`code`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_accounting_analytic_account`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_accounting_analytic_account` WRITE;
/*!40000 ALTER TABLE `llx_accounting_analytic_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_accounting_analytic_account` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_accounting_analytic_axis`
--

DROP TABLE IF EXISTS `llx_accounting_analytic_axis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_accounting_analytic_axis` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  `code` varchar(32) NOT NULL,
  `active` int(11) DEFAULT 1,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_author` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_accounting_analytic_axis` (`code`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_accounting_analytic_axis`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_accounting_analytic_axis` WRITE;
/*!40000 ALTER TABLE `llx_accounting_analytic_axis` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_accounting_analytic_axis` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_accounting_analytic_distribution`
--

DROP TABLE IF EXISTS `llx_accounting_analytic_distribution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_accounting_analytic_distribution` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_source_line` int(11) NOT NULL,
  `sourcetype` varchar(32) NOT NULL,
  `fk_analytic_account` int(11) NOT NULL,
  `percentage` double DEFAULT 100,
  `amount` double(24,8) DEFAULT NULL,
  `entity` int(11) DEFAULT 1,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_author` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `fk_accounting_analytic_distribution_fk_analytic_account` (`fk_analytic_account`),
  CONSTRAINT `fk_accounting_analytic_distribution_fk_analytic_account` FOREIGN KEY (`fk_analytic_account`) REFERENCES `llx_accounting_analytic_account` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_accounting_analytic_distribution`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_accounting_analytic_distribution` WRITE;
/*!40000 ALTER TABLE `llx_accounting_analytic_distribution` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_accounting_analytic_distribution` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_accounting_balance_snapshot`
--

DROP TABLE IF EXISTS `llx_accounting_balance_snapshot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_accounting_balance_snapshot` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_fiscalyear` int(11) NOT NULL,
  `account_number` varchar(32) NOT NULL,
  `account_label` varchar(255) NOT NULL,
  `subledger_account` varchar(32) DEFAULT NULL,
  `subledger_label` varchar(255) DEFAULT NULL,
  `debit` double(24,8) NOT NULL DEFAULT 0.00000000,
  `credit` double(24,8) NOT NULL DEFAULT 0.00000000,
  `date_snapshot` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_accounting_balance_snapshot` (`entity`,`fk_fiscalyear`,`account_number`,`subledger_account`),
  KEY `idx_accounting_balance_snapshot_account` (`entity`,`fk_fiscalyear`,`account_number`,`debit`,`credit`),
  KEY `idx_accounting_balance_snapshot_subaccount` (`entity`,`fk_fiscalyear`,`subledger_account`,`debit`,`credit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_accounting_balance_snapshot`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_accounting_balance_snapshot` WRITE;
/*!40000 ALTER TABLE `llx_accounting_balance_snapshot` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_accounting_balance_snapshot` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_accounting_bookkeeping`
--

DROP TABLE IF EXISTS `llx_accounting_bookkeeping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_accounting_bookkeeping` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref` varchar(30) DEFAULT NULL,
  `piece_num` int(11) NOT NULL,
  `doc_date` date NOT NULL,
  `doc_type` varchar(30) NOT NULL,
  `doc_ref` varchar(300) NOT NULL,
  `fk_doc` int(11) NOT NULL,
  `fk_docdet` int(11) NOT NULL,
  `thirdparty_code` varchar(32) DEFAULT NULL,
  `subledger_account` varchar(32) DEFAULT NULL,
  `subledger_label` varchar(255) DEFAULT NULL,
  `numero_compte` varchar(32) NOT NULL,
  `label_compte` varchar(255) NOT NULL,
  `label_operation` varchar(255) DEFAULT NULL,
  `debit` double(24,8) NOT NULL,
  `credit` double(24,8) NOT NULL,
  `montant` double(24,8) DEFAULT NULL,
  `sens` varchar(1) DEFAULT NULL,
  `multicurrency_amount` double(24,8) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `matching_general` tinyint(4) NOT NULL DEFAULT 0,
  `lettering_code` varchar(255) DEFAULT NULL,
  `date_lettering` datetime DEFAULT NULL,
  `date_lim_reglement` datetime DEFAULT NULL,
  `fk_user_author` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user` int(11) DEFAULT NULL,
  `code_journal` varchar(32) NOT NULL,
  `journal_label` varchar(255) DEFAULT NULL,
  `date_validated` datetime DEFAULT NULL,
  `date_export` datetime DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_accounting_bookkeeping_ref` (`ref`),
  KEY `idx_accounting_bookkeeping_piece_num` (`piece_num`,`entity`),
  KEY `idx_accounting_bookkeeping_fk_doc` (`fk_doc`),
  KEY `idx_accounting_bookkeeping_fk_docdet` (`fk_docdet`),
  KEY `idx_accounting_bookkeeping_doc_date` (`doc_date`),
  KEY `idx_accounting_bookkeeping_numero_compte` (`numero_compte`,`entity`),
  KEY `idx_accounting_bookkeeping_code_journal` (`code_journal`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_accounting_bookkeeping`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_accounting_bookkeeping` WRITE;
/*!40000 ALTER TABLE `llx_accounting_bookkeeping` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_accounting_bookkeeping` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_accounting_bookkeeping_piece`
--

DROP TABLE IF EXISTS `llx_accounting_bookkeeping_piece`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_accounting_bookkeeping_piece` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref` varchar(128) DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `datep` date NOT NULL,
  `statut` smallint(6) DEFAULT 0,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_user_closing` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_accounting_bookkeeping_piece_ref` (`ref`,`entity`),
  KEY `idx_accounting_bookkeeping_piece_fk_user_author` (`fk_user_author`),
  KEY `idx_accounting_bookkeeping_piece_fk_user_modif` (`fk_user_modif`),
  KEY `idx_accounting_bookkeeping_piece_fk_user_valid` (`fk_user_valid`),
  KEY `idx_accounting_bookkeeping_piece_fk_user_closing` (`fk_user_closing`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_accounting_bookkeeping_piece`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_accounting_bookkeeping_piece` WRITE;
/*!40000 ALTER TABLE `llx_accounting_bookkeeping_piece` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_accounting_bookkeeping_piece` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_accounting_bookkeeping_tmp`
--

DROP TABLE IF EXISTS `llx_accounting_bookkeeping_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_accounting_bookkeeping_tmp` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `doc_date` date NOT NULL,
  `doc_type` varchar(30) NOT NULL,
  `doc_ref` varchar(300) NOT NULL,
  `fk_doc` int(11) NOT NULL,
  `fk_docdet` int(11) NOT NULL,
  `thirdparty_code` varchar(32) DEFAULT NULL,
  `subledger_account` varchar(32) DEFAULT NULL,
  `subledger_label` varchar(255) DEFAULT NULL,
  `numero_compte` varchar(32) DEFAULT NULL,
  `label_compte` varchar(255) NOT NULL,
  `label_operation` varchar(255) DEFAULT NULL,
  `debit` double(24,8) NOT NULL,
  `credit` double(24,8) NOT NULL,
  `montant` double(24,8) NOT NULL,
  `sens` varchar(1) DEFAULT NULL,
  `multicurrency_amount` double(24,8) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `matching_general` tinyint(4) NOT NULL DEFAULT 0,
  `lettering_code` varchar(255) DEFAULT NULL,
  `date_lettering` datetime DEFAULT NULL,
  `date_lim_reglement` datetime DEFAULT NULL,
  `fk_user_author` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user` int(11) DEFAULT NULL,
  `code_journal` varchar(32) NOT NULL,
  `journal_label` varchar(255) DEFAULT NULL,
  `piece_num` int(11) NOT NULL,
  `date_validated` datetime DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_accounting_bookkeeping_tmp_ref` (`ref`),
  KEY `idx_accounting_bookkeeping_tmp_doc_date` (`doc_date`),
  KEY `idx_accounting_bookkeeping_tmp_fk_docdet` (`fk_docdet`),
  KEY `idx_accounting_bookkeeping_tmp_numero_compte` (`numero_compte`),
  KEY `idx_accounting_bookkeeping_tmp_code_journal` (`code_journal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_accounting_bookkeeping_tmp`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_accounting_bookkeeping_tmp` WRITE;
/*!40000 ALTER TABLE `llx_accounting_bookkeeping_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_accounting_bookkeeping_tmp` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_accounting_category_account`
--

DROP TABLE IF EXISTS `llx_accounting_category_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_accounting_category_account` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_accounting_category` int(11) DEFAULT NULL,
  `fk_accounting_account` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_accounting_category_account` (`fk_accounting_category`,`fk_accounting_account`),
  KEY `idx_accounting_category_account_fk_accounting_category` (`fk_accounting_category`),
  KEY `idx_accounting_category_account_fk_accounting_account` (`fk_accounting_account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_accounting_category_account`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_accounting_category_account` WRITE;
/*!40000 ALTER TABLE `llx_accounting_category_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_accounting_category_account` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_accounting_fiscalyear`
--

DROP TABLE IF EXISTS `llx_accounting_fiscalyear`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_accounting_fiscalyear` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(128) NOT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `statut` tinyint(4) NOT NULL DEFAULT 0,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datec` datetime NOT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_accounting_fiscalyear`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_accounting_fiscalyear` WRITE;
/*!40000 ALTER TABLE `llx_accounting_fiscalyear` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_accounting_fiscalyear` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_accounting_groups_account`
--

DROP TABLE IF EXISTS `llx_accounting_groups_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_accounting_groups_account` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_accounting_account` int(11) NOT NULL,
  `fk_c_accounting_category` int(11) NOT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_accounting_groups_account`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_accounting_groups_account` WRITE;
/*!40000 ALTER TABLE `llx_accounting_groups_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_accounting_groups_account` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_accounting_journal`
--

DROP TABLE IF EXISTS `llx_accounting_journal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_accounting_journal` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `code` varchar(32) NOT NULL,
  `label` varchar(128) NOT NULL,
  `nature` smallint(6) NOT NULL DEFAULT 1,
  `active` smallint(6) DEFAULT 0,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_accounting_journal_code` (`code`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_accounting_journal`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_accounting_journal` WRITE;
/*!40000 ALTER TABLE `llx_accounting_journal` DISABLE KEYS */;
INSERT INTO `llx_accounting_journal` VALUES
(1,1,'VT','ACCOUNTING_SELL_JOURNAL',2,1),
(2,1,'AC','ACCOUNTING_PURCHASE_JOURNAL',3,1),
(3,1,'BQ','FinanceJournal',4,1),
(4,1,'OD','ACCOUNTING_MISCELLANEOUS_JOURNAL',1,1),
(5,1,'AN','ACCOUNTING_HAS_NEW_JOURNAL',9,1),
(6,1,'ER','ExpenseReportsJournal',5,1),
(7,1,'INV','InventoryJournal',8,1);
/*!40000 ALTER TABLE `llx_accounting_journal` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_accounting_system`
--

DROP TABLE IF EXISTS `llx_accounting_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_accounting_system` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_country` int(11) DEFAULT NULL,
  `pcg_version` varchar(32) NOT NULL,
  `label` varchar(128) NOT NULL,
  `active` smallint(6) DEFAULT 0,
  `date_creation` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_accounting_system_pcg_version` (`pcg_version`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_accounting_system`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_accounting_system` WRITE;
/*!40000 ALTER TABLE `llx_accounting_system` DISABLE KEYS */;
INSERT INTO `llx_accounting_system` VALUES
(1,1,'PCG25-DEV','The developed accountancy french plan 2025',1,NULL,NULL),
(2,1,'PCG18-ASSOC','French foundation chart of accounts 2018',1,NULL,NULL),
(3,1,'PCGAFR14-DEV','The developed farm accountancy french plan 2014',1,NULL,NULL),
(4,2,'PCMN-BASE','The base accountancy belgium plan',1,NULL,NULL),
(5,2,'MAR-VERKORT','The base accountancy belgium plan Dutch',1,NULL,NULL),
(6,4,'PCG08-PYME','The PYME accountancy spanish plan',1,NULL,NULL),
(7,4,'PCG08-PYME-CAT','The PYME accountancy spanish plan in catalan language',1,NULL,NULL),
(8,5,'SKR03','Standardkontenrahmen SKR 03',1,NULL,NULL),
(9,5,'SKR04','Standardkontenrahmen SKR 04',1,NULL,NULL),
(10,6,'PCG_SUISSE','Switzerland plan',1,NULL,NULL),
(11,7,'ENG-BASE','England plan',1,NULL,NULL),
(12,10,'PCT','The Tunisia plan',1,NULL,NULL),
(13,12,'PCG','The Moroccan chart of accounts',1,NULL,NULL),
(14,13,'NSCF','Nouveau systÃ¨me comptable financier',1,NULL,NULL),
(15,17,'NL-VERKORT','Verkort rekeningschema',1,NULL,NULL),
(16,20,'BAS-K1-MINI','The Swedish mini chart of accounts',1,NULL,NULL),
(17,41,'AT-BASE','Plan Austria',1,NULL,NULL),
(18,67,'PC-MIPYME','The PYME accountancy Chile plan',1,NULL,NULL),
(19,80,'DK-STD','Standardkontoplan fra SKAT',1,NULL,NULL),
(20,84,'EC-SUPERCIAS','Plan de cuentas Ecuador',1,NULL,NULL),
(21,70,'CO-PUC','Plan Ãºnico de cuentas Colombia',1,NULL,NULL),
(22,140,'PCN2020-LUXEMBURG','Plan comptable normalisÃ© 2020 Luxembourgeois',1,NULL,NULL),
(23,188,'RO-BASE','Plan de conturi romanesc',1,NULL,NULL),
(24,102,'Î•.Î›.Î .','Î•Î»Î»Î·Î½Î¹ÎºÎ¬ Î›Î¿Î³Î¹ÏƒÏ„Î¹ÎºÎ¬ Î ÏÏŒÏ„Ï…Ï€Î±',1,NULL,NULL),
(25,49,'SYSCOHADA-BJ','Plan comptable Ouest-Africain',1,NULL,NULL),
(26,60,'SYSCOHADA-BF','Plan comptable Ouest-Africain',1,NULL,NULL),
(27,73,'SYSCOHADA-CD','Plan comptable Ouest-Africain',1,NULL,NULL),
(28,65,'SYSCOHADA-CF','Plan comptable Ouest-Africain',1,NULL,NULL),
(29,72,'SYSCOHADA-CG','Plan comptable Ouest-Africain',1,NULL,NULL),
(30,21,'SYSCOHADA-CI','Plan comptable Ouest-Africain',1,NULL,NULL),
(31,24,'SYSCOHADA-CM','Plan comptable Ouest-Africain',1,NULL,NULL),
(32,16,'SYSCOHADA-GA','Plan comptable Ouest-Africain',1,NULL,NULL),
(33,87,'SYSCOHADA-GQ','Plan comptable Ouest-Africain',1,NULL,NULL),
(34,71,'SYSCOHADA-KM','Plan comptable Ouest-Africain',1,NULL,NULL),
(35,147,'SYSCOHADA-ML','Plan comptable Ouest-Africain',1,NULL,NULL),
(36,168,'SYSCOHADA-NE','Plan comptable Ouest-Africain',1,NULL,NULL),
(37,22,'SYSCOHADA-SN','Plan comptable Ouest-Africain',1,NULL,NULL),
(38,66,'SYSCOHADA-TD','Plan comptable Ouest-Africain',1,NULL,NULL),
(39,15,'SYSCOHADA-TG','Plan comptable Ouest-Africain',1,NULL,NULL),
(40,11,'US-BASE','USA basic chart of accounts',1,NULL,NULL),
(41,11,'US-GAAP-BASIC','USA GAAP basic chart of accounts',1,NULL,NULL),
(42,14,'CA-ENG-BASE','Canadian basic chart of accounts - English',1,NULL,NULL),
(43,154,'SAT/24-2019','Catalogo y codigo agrupador fiscal del 2019',1,NULL,NULL),
(44,123,'JPN-BASE','æ—¥æœ¬ å‹˜å®šç§‘ç›®è¡¨ åŸºæœ¬ç‰ˆ',1,NULL,NULL),
(45,165,'PCG99-ABREGE-NC','The simple accountancy plan for New Caledonia (PCG 1999)',1,NULL,NULL),
(46,165,'PCG99-BASE-NC','The base accountancy plan for New Caledonia (PCG 1999)',1,NULL,NULL);
/*!40000 ALTER TABLE `llx_accounting_system` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_accounting_transaction_template`
--

DROP TABLE IF EXISTS `llx_accounting_transaction_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_accounting_transaction_template` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `code` varchar(128) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_accounting_transaction_template_code` (`code`,`entity`),
  KEY `idx_accounting_transaction_template_rowid` (`rowid`),
  KEY `idx_accounting_transaction_template_code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_accounting_transaction_template`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_accounting_transaction_template` WRITE;
/*!40000 ALTER TABLE `llx_accounting_transaction_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_accounting_transaction_template` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_accounting_transaction_template_det`
--

DROP TABLE IF EXISTS `llx_accounting_transaction_template_det`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_accounting_transaction_template_det` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_transaction_template` int(11) NOT NULL,
  `general_account` varchar(32) NOT NULL,
  `general_label` varchar(255) NOT NULL,
  `subledger_account` varchar(32) DEFAULT NULL,
  `subledger_label` varchar(255) DEFAULT NULL,
  `operation_label` varchar(255) DEFAULT NULL,
  `debit` double(24,8) DEFAULT NULL,
  `credit` double(24,8) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_accounting_transaction_template_det_rowid` (`rowid`),
  KEY `llx_accounting_transaction_template_det_fk_transaction_template` (`fk_transaction_template`),
  CONSTRAINT `llx_accounting_transaction_template_det_fk_transaction_template` FOREIGN KEY (`fk_transaction_template`) REFERENCES `llx_accounting_transaction_template` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_accounting_transaction_template_det`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_accounting_transaction_template_det` WRITE;
/*!40000 ALTER TABLE `llx_accounting_transaction_template_det` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_accounting_transaction_template_det` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_actioncomm`
--

DROP TABLE IF EXISTS `llx_actioncomm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_actioncomm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) NOT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datep` datetime DEFAULT NULL,
  `datep2` datetime DEFAULT NULL,
  `fk_action` int(11) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_mod` int(11) DEFAULT NULL,
  `fk_project` int(11) DEFAULT NULL,
  `fk_task` int(11) DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_contact` int(11) DEFAULT NULL,
  `fk_parent` int(11) NOT NULL DEFAULT 0,
  `fk_user_action` int(11) DEFAULT NULL,
  `transparency` int(11) DEFAULT NULL,
  `priority` smallint(6) DEFAULT NULL,
  `visibility` varchar(12) DEFAULT 'default',
  `fulldayevent` smallint(6) NOT NULL DEFAULT 0,
  `percent` smallint(6) NOT NULL DEFAULT 0,
  `location` varchar(128) DEFAULT NULL,
  `durationp` double DEFAULT NULL,
  `label` varchar(255) NOT NULL,
  `note` mediumtext DEFAULT NULL,
  `calling_duration` int(11) DEFAULT NULL,
  `email_subject` varchar(255) DEFAULT NULL,
  `email_msgid` varchar(255) DEFAULT NULL,
  `email_from` varchar(255) DEFAULT NULL,
  `email_sender` varchar(255) DEFAULT NULL,
  `email_to` varchar(255) DEFAULT NULL,
  `email_tocc` varchar(255) DEFAULT NULL,
  `email_tobcc` varchar(255) DEFAULT NULL,
  `errors_to` varchar(255) DEFAULT NULL,
  `reply_to` varchar(255) DEFAULT NULL,
  `recurid` varchar(128) DEFAULT NULL,
  `recurrule` varchar(128) DEFAULT NULL,
  `recurdateend` datetime DEFAULT NULL,
  `num_vote` int(11) DEFAULT NULL,
  `event_paid` smallint(6) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL DEFAULT 0,
  `max_participants` int(11) DEFAULT NULL,
  `fk_element` int(11) DEFAULT NULL,
  `elementtype` varchar(255) DEFAULT NULL,
  `ip` varchar(250) DEFAULT NULL,
  `fk_bookcal_calendar` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_actioncomm_fk_soc` (`fk_soc`),
  KEY `idx_actioncomm_fk_contact` (`fk_contact`),
  KEY `idx_actioncomm_code` (`code`),
  KEY `idx_actioncomm_fk_element` (`fk_element`),
  KEY `idx_actioncomm_fk_user_action` (`fk_user_action`),
  KEY `idx_actioncomm_fk_project` (`fk_project`),
  KEY `idx_actioncomm_datep` (`datep`),
  KEY `idx_actioncomm_datep2` (`datep2`),
  KEY `idx_actioncomm_recurid` (`recurid`),
  KEY `idx_actioncomm_ref_ext` (`ref_ext`),
  KEY `idx_actioncomm_percent` (`percent`),
  KEY `idx_actioncomm_ref` (`ref`,`entity`),
  KEY `idx_actioncomm_max_participants` (`max_participants`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_actioncomm`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_actioncomm` WRITE;
/*!40000 ALTER TABLE `llx_actioncomm` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_actioncomm` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_actioncomm_extrafields`
--

DROP TABLE IF EXISTS `llx_actioncomm_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_actioncomm_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_actioncomm_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_actioncomm_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_actioncomm_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_actioncomm_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_actioncomm_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_actioncomm_reminder`
--

DROP TABLE IF EXISTS `llx_actioncomm_reminder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_actioncomm_reminder` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `dateremind` datetime NOT NULL,
  `typeremind` varchar(32) NOT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_contact` int(11) DEFAULT NULL,
  `offsetvalue` int(11) NOT NULL,
  `offsetunit` varchar(1) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `datedone` datetime DEFAULT NULL,
  `lasterror` varchar(128) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_actioncomm` int(11) NOT NULL,
  `fk_email_template` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_actioncomm_reminder_unique` (`fk_actioncomm`,`fk_user`,`fk_soc`,`fk_contact`,`typeremind`,`offsetvalue`,`offsetunit`),
  KEY `idx_actioncomm_reminder_dateremind` (`dateremind`),
  KEY `idx_actioncomm_reminder_fk_user` (`fk_user`),
  KEY `idx_actioncomm_reminder_fk_soc` (`fk_soc`),
  KEY `idx_actioncomm_reminder_fk_contact` (`fk_contact`),
  KEY `idx_actioncomm_reminder_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_actioncomm_reminder`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_actioncomm_reminder` WRITE;
/*!40000 ALTER TABLE `llx_actioncomm_reminder` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_actioncomm_reminder` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_actioncomm_resources`
--

DROP TABLE IF EXISTS `llx_actioncomm_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_actioncomm_resources` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_actioncomm` int(11) NOT NULL,
  `element_type` varchar(50) NOT NULL,
  `fk_element` int(11) NOT NULL,
  `answer_status` varchar(50) DEFAULT NULL,
  `mandatory` smallint(6) DEFAULT NULL,
  `transparency` smallint(6) DEFAULT 1,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_actioncomm_resources` (`fk_actioncomm`,`element_type`,`fk_element`),
  KEY `idx_actioncomm_resources_fk_element` (`fk_element`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_actioncomm_resources`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_actioncomm_resources` WRITE;
/*!40000 ALTER TABLE `llx_actioncomm_resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_actioncomm_resources` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_adherent`
--

DROP TABLE IF EXISTS `llx_adherent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_adherent` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref_ext` varchar(128) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `civility` varchar(6) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `login` varchar(50) DEFAULT NULL,
  `pass` varchar(50) DEFAULT NULL,
  `pass_crypted` varchar(128) DEFAULT NULL,
  `fk_adherent_type` int(11) NOT NULL,
  `morphy` varchar(3) NOT NULL,
  `societe` varchar(128) DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `zip` varchar(30) DEFAULT NULL,
  `town` varchar(50) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `country` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `socialnetworks` text DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `phone_perso` varchar(30) DEFAULT NULL,
  `phone_mobile` varchar(30) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `birth_place` varchar(64) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `statut` smallint(6) NOT NULL DEFAULT 0,
  `public` smallint(6) NOT NULL DEFAULT 0,
  `datefin` datetime DEFAULT NULL,
  `default_lang` varchar(6) DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `datevalid` datetime DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_mod` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `canvas` varchar(32) DEFAULT NULL,
  `ip` varchar(250) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_adherent_ref` (`ref`,`entity`),
  UNIQUE KEY `uk_adherent_login` (`login`,`entity`),
  UNIQUE KEY `uk_adherent_fk_soc` (`fk_soc`),
  KEY `idx_adherent_fk_adherent_type` (`fk_adherent_type`),
  CONSTRAINT `adherent_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `fk_adherent_adherent_type` FOREIGN KEY (`fk_adherent_type`) REFERENCES `llx_adherent_type` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_adherent`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_adherent` WRITE;
/*!40000 ALTER TABLE `llx_adherent` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_adherent` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_adherent_extrafields`
--

DROP TABLE IF EXISTS `llx_adherent_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_adherent_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_adherent_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_adherent_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_adherent_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_adherent_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_adherent_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_adherent_type`
--

DROP TABLE IF EXISTS `llx_adherent_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_adherent_type` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `statut` smallint(6) NOT NULL DEFAULT 0,
  `libelle` varchar(50) NOT NULL,
  `morphy` varchar(3) NOT NULL,
  `duration` varchar(6) DEFAULT NULL,
  `subscription` varchar(3) NOT NULL DEFAULT '1',
  `amount` double(24,8) DEFAULT NULL,
  `caneditamount` int(11) DEFAULT 0,
  `minimumamount` double(24,8) DEFAULT NULL,
  `amountformuladescription` text DEFAULT NULL,
  `vote` varchar(3) NOT NULL DEFAULT '1',
  `note` text DEFAULT NULL,
  `mail_valid` text DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_adherent_type_libelle` (`libelle`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_adherent_type`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_adherent_type` WRITE;
/*!40000 ALTER TABLE `llx_adherent_type` DISABLE KEYS */;
INSERT INTO `llx_adherent_type` VALUES
(1,1,'2026-09-23 07:33:58',1,'Type standard','','1y','1',NULL,0,NULL,'','1','','');
/*!40000 ALTER TABLE `llx_adherent_type` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_adherent_type_extrafields`
--

DROP TABLE IF EXISTS `llx_adherent_type_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_adherent_type_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_adherent_type_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_adherent_type_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_adherent_type_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_adherent_type_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_adherent_type_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_adherent_type_lang`
--

DROP TABLE IF EXISTS `llx_adherent_type_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_adherent_type_lang` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_type` int(11) NOT NULL DEFAULT 0,
  `lang` varchar(5) NOT NULL DEFAULT '0',
  `label` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_adherent_type_lang`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_adherent_type_lang` WRITE;
/*!40000 ALTER TABLE `llx_adherent_type_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_adherent_type_lang` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_ai_request_log`
--

DROP TABLE IF EXISTS `llx_ai_request_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_ai_request_log` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `date_request` datetime DEFAULT NULL,
  `fk_user` int(11) NOT NULL,
  `fk_actioncomm` int(11) DEFAULT NULL,
  `query_text` text DEFAULT NULL,
  `tool_name` varchar(255) DEFAULT NULL,
  `provider` varchar(50) DEFAULT NULL,
  `execution_time` float DEFAULT NULL,
  `confidence` float DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `error_msg` text DEFAULT NULL,
  `input_hash` varchar(80) DEFAULT NULL,
  `output_hash` varchar(80) DEFAULT NULL,
  `security_hash` varchar(80) DEFAULT NULL,
  `raw_request_payload` mediumtext DEFAULT NULL,
  `raw_response_payload` mediumtext DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_ai_request_log_entity` (`entity`),
  KEY `idx_ai_request_log_date` (`date_request`),
  KEY `idx_ai_request_log_user` (`fk_user`),
  KEY `idx_ai_request_log_fk_actioncomm` (`fk_actioncomm`),
  KEY `idx_ai_request_log_status` (`status`),
  KEY `idx_ai_request_log_input_hash` (`input_hash`),
  KEY `idx_ai_request_log_security_hash` (`security_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_ai_request_log`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_ai_request_log` WRITE;
/*!40000 ALTER TABLE `llx_ai_request_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_ai_request_log` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_asset`
--

DROP TABLE IF EXISTS `llx_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_asset` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(128) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `label` varchar(255) DEFAULT NULL,
  `fk_asset_model` int(11) DEFAULT NULL,
  `reversal_amount_ht` double(24,8) DEFAULT NULL,
  `acquisition_value_ht` double(24,8) DEFAULT NULL,
  `recovered_vat` double(24,8) DEFAULT NULL,
  `reversal_date` date DEFAULT NULL,
  `date_acquisition` date NOT NULL,
  `date_start` date NOT NULL,
  `qty` double NOT NULL DEFAULT 1,
  `acquisition_type` smallint(6) NOT NULL DEFAULT 0,
  `asset_type` smallint(6) NOT NULL DEFAULT 0,
  `not_depreciated` tinyint(1) DEFAULT 0,
  `disposal_date` date DEFAULT NULL,
  `disposal_amount_ht` double(24,8) DEFAULT NULL,
  `fk_disposal_type` int(11) DEFAULT NULL,
  `disposal_depreciated` tinyint(1) DEFAULT 0,
  `disposal_subject_to_vat` tinyint(1) DEFAULT 0,
  `note_public` text DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date_valid` datetime DEFAULT NULL,
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_asset_fk_asset_model` (`fk_asset_model`),
  KEY `idx_asset_fk_disposal_type` (`fk_disposal_type`),
  KEY `fk_asset_user_creat` (`fk_user_creat`),
  KEY `fk_asset_user_modif` (`fk_user_modif`),
  CONSTRAINT `fk_asset_asset_model` FOREIGN KEY (`fk_asset_model`) REFERENCES `llx_asset_model` (`rowid`),
  CONSTRAINT `fk_asset_disposal_type` FOREIGN KEY (`fk_disposal_type`) REFERENCES `llx_c_asset_disposal_type` (`rowid`),
  CONSTRAINT `fk_asset_user_creat` FOREIGN KEY (`fk_user_creat`) REFERENCES `llx_user` (`rowid`),
  CONSTRAINT `fk_asset_user_modif` FOREIGN KEY (`fk_user_modif`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_asset`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_asset` WRITE;
/*!40000 ALTER TABLE `llx_asset` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_asset` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_asset_accountancy_codes_economic`
--

DROP TABLE IF EXISTS `llx_asset_accountancy_codes_economic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_asset_accountancy_codes_economic` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_asset` int(11) DEFAULT NULL,
  `fk_asset_model` int(11) DEFAULT NULL,
  `asset` varchar(32) DEFAULT NULL,
  `depreciation_asset` varchar(32) DEFAULT NULL,
  `depreciation_expense` varchar(32) DEFAULT NULL,
  `value_asset_sold` varchar(32) DEFAULT NULL,
  `receivable_on_assignment` varchar(32) DEFAULT NULL,
  `proceeds_from_sales` varchar(32) DEFAULT NULL,
  `vat_collected` varchar(32) DEFAULT NULL,
  `vat_deductible` varchar(32) DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_modif` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_asset_ace_fk_asset` (`fk_asset`),
  UNIQUE KEY `uk_asset_ace_fk_asset_model` (`fk_asset_model`),
  KEY `idx_asset_ace_rowid` (`rowid`),
  KEY `fk_asset_ace_user_modif` (`fk_user_modif`),
  CONSTRAINT `fk_asset_ace_asset` FOREIGN KEY (`fk_asset`) REFERENCES `llx_asset` (`rowid`),
  CONSTRAINT `fk_asset_ace_asset_model` FOREIGN KEY (`fk_asset_model`) REFERENCES `llx_asset_model` (`rowid`),
  CONSTRAINT `fk_asset_ace_user_modif` FOREIGN KEY (`fk_user_modif`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_asset_accountancy_codes_economic`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_asset_accountancy_codes_economic` WRITE;
/*!40000 ALTER TABLE `llx_asset_accountancy_codes_economic` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_asset_accountancy_codes_economic` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_asset_accountancy_codes_fiscal`
--

DROP TABLE IF EXISTS `llx_asset_accountancy_codes_fiscal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_asset_accountancy_codes_fiscal` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_asset` int(11) DEFAULT NULL,
  `fk_asset_model` int(11) DEFAULT NULL,
  `accelerated_depreciation` varchar(32) DEFAULT NULL,
  `endowment_accelerated_depreciation` varchar(32) DEFAULT NULL,
  `provision_accelerated_depreciation` varchar(32) DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_modif` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_asset_acf_fk_asset` (`fk_asset`),
  UNIQUE KEY `uk_asset_acf_fk_asset_model` (`fk_asset_model`),
  KEY `idx_asset_acf_rowid` (`rowid`),
  KEY `fk_asset_acf_user_modif` (`fk_user_modif`),
  CONSTRAINT `fk_asset_acf_asset` FOREIGN KEY (`fk_asset`) REFERENCES `llx_asset` (`rowid`),
  CONSTRAINT `fk_asset_acf_asset_model` FOREIGN KEY (`fk_asset_model`) REFERENCES `llx_asset_model` (`rowid`),
  CONSTRAINT `fk_asset_acf_user_modif` FOREIGN KEY (`fk_user_modif`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_asset_accountancy_codes_fiscal`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_asset_accountancy_codes_fiscal` WRITE;
/*!40000 ALTER TABLE `llx_asset_accountancy_codes_fiscal` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_asset_accountancy_codes_fiscal` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_asset_depreciation`
--

DROP TABLE IF EXISTS `llx_asset_depreciation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_asset_depreciation` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_asset` int(11) NOT NULL,
  `depreciation_mode` varchar(255) NOT NULL,
  `ref` varchar(255) NOT NULL,
  `depreciation_date` datetime NOT NULL,
  `depreciation_ht` double(24,8) NOT NULL,
  `cumulative_depreciation_ht` double(24,8) NOT NULL,
  `accountancy_code_debit` varchar(32) DEFAULT NULL,
  `accountancy_code_credit` varchar(32) DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_modif` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_asset_depreciation_fk_asset` (`fk_asset`,`depreciation_mode`,`ref`),
  KEY `idx_asset_depreciation_rowid` (`rowid`),
  KEY `idx_asset_depreciation_fk_asset` (`fk_asset`),
  KEY `idx_asset_depreciation_depreciation_mode` (`depreciation_mode`),
  KEY `idx_asset_depreciation_ref` (`ref`),
  KEY `fk_asset_depreciation_user_modif` (`fk_user_modif`),
  CONSTRAINT `fk_asset_depreciation_asset` FOREIGN KEY (`fk_asset`) REFERENCES `llx_asset` (`rowid`),
  CONSTRAINT `fk_asset_depreciation_user_modif` FOREIGN KEY (`fk_user_modif`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_asset_depreciation`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_asset_depreciation` WRITE;
/*!40000 ALTER TABLE `llx_asset_depreciation` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_asset_depreciation` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_asset_depreciation_options_economic`
--

DROP TABLE IF EXISTS `llx_asset_depreciation_options_economic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_asset_depreciation_options_economic` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_asset` int(11) DEFAULT NULL,
  `fk_asset_model` int(11) DEFAULT NULL,
  `depreciation_type` smallint(6) NOT NULL DEFAULT 0,
  `accelerated_depreciation_option` tinyint(1) DEFAULT 0,
  `degressive_coefficient` double(24,8) DEFAULT NULL,
  `duration` smallint(6) NOT NULL,
  `duration_type` smallint(6) NOT NULL DEFAULT 0,
  `amount_base_depreciation_ht` double(24,8) DEFAULT NULL,
  `amount_base_deductible_ht` double(24,8) DEFAULT NULL,
  `total_amount_last_depreciation_ht` double(24,8) DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_modif` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_asset_doe_fk_asset` (`fk_asset`),
  UNIQUE KEY `uk_asset_doe_fk_asset_model` (`fk_asset_model`),
  KEY `idx_asset_doe_rowid` (`rowid`),
  KEY `fk_asset_doe_user_modif` (`fk_user_modif`),
  CONSTRAINT `fk_asset_doe_asset` FOREIGN KEY (`fk_asset`) REFERENCES `llx_asset` (`rowid`),
  CONSTRAINT `fk_asset_doe_asset_model` FOREIGN KEY (`fk_asset_model`) REFERENCES `llx_asset_model` (`rowid`),
  CONSTRAINT `fk_asset_doe_user_modif` FOREIGN KEY (`fk_user_modif`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_asset_depreciation_options_economic`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_asset_depreciation_options_economic` WRITE;
/*!40000 ALTER TABLE `llx_asset_depreciation_options_economic` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_asset_depreciation_options_economic` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_asset_depreciation_options_fiscal`
--

DROP TABLE IF EXISTS `llx_asset_depreciation_options_fiscal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_asset_depreciation_options_fiscal` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_asset` int(11) DEFAULT NULL,
  `fk_asset_model` int(11) DEFAULT NULL,
  `depreciation_type` smallint(6) NOT NULL DEFAULT 0,
  `degressive_coefficient` double(24,8) DEFAULT NULL,
  `duration` smallint(6) NOT NULL,
  `duration_type` smallint(6) NOT NULL DEFAULT 0,
  `amount_base_depreciation_ht` double(24,8) DEFAULT NULL,
  `amount_base_deductible_ht` double(24,8) DEFAULT NULL,
  `total_amount_last_depreciation_ht` double(24,8) DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_modif` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_asset_dof_fk_asset` (`fk_asset`),
  UNIQUE KEY `uk_asset_dof_fk_asset_model` (`fk_asset_model`),
  KEY `idx_asset_dof_rowid` (`rowid`),
  KEY `fk_asset_dof_user_modif` (`fk_user_modif`),
  CONSTRAINT `fk_asset_dof_asset` FOREIGN KEY (`fk_asset`) REFERENCES `llx_asset` (`rowid`),
  CONSTRAINT `fk_asset_dof_asset_model` FOREIGN KEY (`fk_asset_model`) REFERENCES `llx_asset_model` (`rowid`),
  CONSTRAINT `fk_asset_dof_user_modif` FOREIGN KEY (`fk_user_modif`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_asset_depreciation_options_fiscal`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_asset_depreciation_options_fiscal` WRITE;
/*!40000 ALTER TABLE `llx_asset_depreciation_options_fiscal` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_asset_depreciation_options_fiscal` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_asset_extrafields`
--

DROP TABLE IF EXISTS `llx_asset_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_asset_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_asset_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_asset_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_asset_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_asset_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_asset_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_asset_model`
--

DROP TABLE IF EXISTS `llx_asset_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_asset_model` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref` varchar(128) NOT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `label` varchar(255) NOT NULL,
  `asset_type` smallint(6) NOT NULL,
  `fk_pays` int(11) DEFAULT 0,
  `note_public` text DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_asset_model` (`entity`,`ref`),
  KEY `idx_asset_model_rowid` (`rowid`),
  KEY `idx_asset_model_entity` (`entity`),
  KEY `idx_asset_model_ref` (`ref`),
  KEY `idx_asset_model_pays` (`fk_pays`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_asset_model`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_asset_model` WRITE;
/*!40000 ALTER TABLE `llx_asset_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_asset_model` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_asset_model_extrafields`
--

DROP TABLE IF EXISTS `llx_asset_model_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_asset_model_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_asset_model_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_asset_model_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_asset_model_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_asset_model_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_asset_model_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_bank`
--

DROP TABLE IF EXISTS `llx_bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_bank` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datev` date DEFAULT NULL,
  `dateo` date DEFAULT NULL,
  `amount` double(24,8) NOT NULL DEFAULT 0.00000000,
  `amount_main_currency` double(24,8) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `fk_account` int(11) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_rappro` int(11) DEFAULT NULL,
  `fk_type` varchar(6) DEFAULT NULL,
  `num_releve` varchar(50) DEFAULT NULL,
  `num_chq` varchar(50) DEFAULT NULL,
  `numero_compte` varchar(32) DEFAULT NULL,
  `rappro` tinyint(4) DEFAULT 0,
  `note` text DEFAULT NULL,
  `fk_bordereau` int(11) DEFAULT 0,
  `position` int(11) DEFAULT 0,
  `banque` varchar(255) DEFAULT NULL,
  `emetteur` varchar(255) DEFAULT NULL,
  `author` varchar(40) DEFAULT NULL,
  `origin_id` int(11) DEFAULT NULL,
  `origin_type` varchar(64) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_bank_datev` (`datev`),
  KEY `idx_bank_dateo` (`dateo`),
  KEY `idx_bank_fk_account` (`fk_account`),
  KEY `idx_bank_rappro` (`rappro`),
  KEY `idx_bank_num_releve` (`num_releve`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_bank`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_bank` WRITE;
/*!40000 ALTER TABLE `llx_bank` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_bank` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_bank_account`
--

DROP TABLE IF EXISTS `llx_bank_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_bank_account` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ref` varchar(12) NOT NULL,
  `label` varchar(50) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `bank` varchar(60) DEFAULT NULL,
  `code_banque` varchar(128) DEFAULT NULL,
  `code_guichet` varchar(6) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `cle_rib` varchar(5) DEFAULT NULL,
  `bic` varchar(11) DEFAULT NULL,
  `bic_intermediate` varchar(11) DEFAULT NULL,
  `iban_prefix` varchar(100) DEFAULT NULL,
  `country_iban` varchar(2) DEFAULT NULL,
  `cle_iban` varchar(2) DEFAULT NULL,
  `domiciliation` varchar(255) DEFAULT NULL,
  `pti_in_ctti` smallint(6) DEFAULT 0,
  `state_id` int(11) DEFAULT NULL,
  `fk_pays` int(11) NOT NULL,
  `proprio` varchar(60) DEFAULT NULL,
  `owner_address` varchar(255) DEFAULT NULL,
  `owner_zip` varchar(25) DEFAULT NULL,
  `owner_town` varchar(50) DEFAULT NULL,
  `owner_country_id` int(11) DEFAULT NULL,
  `courant` smallint(6) NOT NULL DEFAULT 0,
  `clos` smallint(6) NOT NULL DEFAULT 0,
  `rappro` smallint(6) DEFAULT 1,
  `url` varchar(128) DEFAULT NULL,
  `account_number` varchar(32) DEFAULT NULL,
  `fk_accountancy_journal` int(11) DEFAULT NULL,
  `currency_code` varchar(3) NOT NULL,
  `min_allowed` int(11) DEFAULT 0,
  `min_desired` int(11) DEFAULT 0,
  `comment` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `ics` varchar(32) DEFAULT NULL,
  `ics_transfer` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_bank_account_label` (`label`,`entity`),
  KEY `idx_fk_accountancy_journal` (`fk_accountancy_journal`),
  CONSTRAINT `fk_bank_account_accountancy_journal` FOREIGN KEY (`fk_accountancy_journal`) REFERENCES `llx_accounting_journal` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_bank_account`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_bank_account` WRITE;
/*!40000 ALTER TABLE `llx_bank_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_bank_account` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_bank_account_extrafields`
--

DROP TABLE IF EXISTS `llx_bank_account_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_bank_account_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_bank_account_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_bank_account_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_bank_account_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_bank_account_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_bank_account_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_bank_extrafields`
--

DROP TABLE IF EXISTS `llx_bank_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_bank_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_bank_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_bank_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_bank_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_bank_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_bank_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_bank_import`
--

DROP TABLE IF EXISTS `llx_bank_import`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_bank_import` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `id_account` int(11) NOT NULL,
  `fitid` varchar(255) DEFAULT NULL,
  `record_type` varchar(64) DEFAULT NULL,
  `label` varchar(255) NOT NULL,
  `record_type_origin` varchar(255) NOT NULL,
  `label_origin` varchar(255) NOT NULL,
  `comment` text DEFAULT NULL,
  `note` text DEFAULT NULL,
  `bdate` date DEFAULT NULL,
  `vdate` date DEFAULT NULL,
  `date_scraped` datetime DEFAULT NULL,
  `original_amount` double(24,8) DEFAULT NULL,
  `original_currency` varchar(255) DEFAULT NULL,
  `amount_debit` double(24,8) NOT NULL,
  `amount_credit` double(24,8) NOT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `fk_duplicate_of` int(11) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `datec` datetime NOT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_author` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `datas` text NOT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_bank_import`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_bank_import` WRITE;
/*!40000 ALTER TABLE `llx_bank_import` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_bank_import` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_bank_record`
--

DROP TABLE IF EXISTS `llx_bank_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_bank_record` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(50) NOT NULL,
  `fk_bank` int(11) NOT NULL,
  `dt_from` date NOT NULL,
  `dt_to` date NOT NULL,
  `date_creation` datetime NOT NULL,
  `date_valid` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`rowid`),
  KEY `bank_record_fk_bank` (`fk_bank`),
  CONSTRAINT `bank_record_fk_bank` FOREIGN KEY (`fk_bank`) REFERENCES `llx_bank_account` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_bank_record`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_bank_record` WRITE;
/*!40000 ALTER TABLE `llx_bank_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_bank_record` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_bank_record_link`
--

DROP TABLE IF EXISTS `llx_bank_record_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_bank_record_link` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_bank_record` int(11) NOT NULL,
  `fk_bank_import` int(11) NOT NULL,
  PRIMARY KEY (`rowid`),
  KEY `fk_bank_record_bank_record` (`fk_bank_record`),
  KEY `fk_bank_import_bank_import` (`fk_bank_import`),
  CONSTRAINT `fk_bank_import_bank_import` FOREIGN KEY (`fk_bank_import`) REFERENCES `llx_bank_import` (`rowid`),
  CONSTRAINT `fk_bank_record_bank_record` FOREIGN KEY (`fk_bank_record`) REFERENCES `llx_bank_record` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_bank_record_link`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_bank_record_link` WRITE;
/*!40000 ALTER TABLE `llx_bank_record_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_bank_record_link` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_bank_url`
--

DROP TABLE IF EXISTS `llx_bank_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_bank_url` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_bank` int(11) DEFAULT NULL,
  `url_id` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `type` varchar(24) NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_bank_url` (`fk_bank`,`url_id`,`type`),
  KEY `idx_bank_url_url_id` (`url_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_bank_url`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_bank_url` WRITE;
/*!40000 ALTER TABLE `llx_bank_url` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_bank_url` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_blockedlog`
--

DROP TABLE IF EXISTS `llx_blockedlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_blockedlog` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `module_source` varchar(32) DEFAULT '',
  `pos_source` varchar(32) DEFAULT '',
  `action` varchar(50) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `date_creation` datetime DEFAULT NULL,
  `amounts` double(24,8) NOT NULL,
  `amounts_taxexcl` double(24,8) DEFAULT NULL,
  `ref_object` varchar(255) DEFAULT NULL,
  `date_object` datetime DEFAULT NULL,
  `type_code` varchar(8) DEFAULT '',
  `user_fullname` varchar(255) DEFAULT NULL,
  `linktoref` text DEFAULT NULL,
  `linktype` varchar(16) DEFAULT NULL,
  `object_data` mediumtext DEFAULT NULL,
  `signature` varchar(100) NOT NULL,
  `signature_backward` varchar(100) DEFAULT '',
  `element` varchar(50) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `fk_object` int(11) DEFAULT NULL,
  `object_version` varchar(32) DEFAULT '',
  `object_format` varchar(16) DEFAULT 'V1',
  `certified` int(11) DEFAULT NULL,
  `actionrefisunique` varchar(16) DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `debuginfo` mediumtext DEFAULT NULL,
  `note` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_entity_action_certified` (`entity`,`action`),
  KEY `idx_ref_object` (`ref_object`),
  KEY `signature` (`signature`),
  KEY `signature_backward` (`signature_backward`),
  KEY `fk_object_element` (`fk_object`,`element`),
  KEY `fk_user` (`fk_user`),
  KEY `entity_rowid` (`entity`,`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_blockedlog`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_blockedlog` WRITE;
/*!40000 ALTER TABLE `llx_blockedlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_blockedlog` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_bom_bom`
--

DROP TABLE IF EXISTS `llx_bom_bom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_bom_bom` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref` varchar(128) NOT NULL,
  `bomtype` int(11) DEFAULT 0,
  `label` varchar(255) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `fk_warehouse` int(11) DEFAULT NULL,
  `qty` double(24,8) DEFAULT NULL,
  `efficiency` double(24,8) DEFAULT 1.00000000,
  `duration` double(24,8) DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `date_valid` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_bom_bom_ref` (`ref`,`entity`),
  KEY `idx_bom_bom_rowid` (`rowid`),
  KEY `idx_bom_bom_ref` (`ref`),
  KEY `llx_bom_bom_fk_user_creat` (`fk_user_creat`),
  KEY `idx_bom_bom_status` (`status`),
  KEY `idx_bom_bom_fk_product` (`fk_product`),
  CONSTRAINT `llx_bom_bom_fk_user_creat` FOREIGN KEY (`fk_user_creat`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_bom_bom`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_bom_bom` WRITE;
/*!40000 ALTER TABLE `llx_bom_bom` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_bom_bom` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_bom_bom_extrafields`
--

DROP TABLE IF EXISTS `llx_bom_bom_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_bom_bom_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_bom_bom_extrafields_fk_object` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_bom_bom_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_bom_bom_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_bom_bom_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_bom_bom_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_bom_bomline`
--

DROP TABLE IF EXISTS `llx_bom_bomline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_bom_bomline` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_bom` int(11) NOT NULL,
  `fk_product` int(11) NOT NULL,
  `fk_bom_child` int(11) DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `description` text DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `qty` double(24,8) NOT NULL,
  `qty_frozen` smallint(6) DEFAULT 0,
  `disable_stock_change` smallint(6) DEFAULT 0,
  `efficiency` double(24,8) NOT NULL DEFAULT 1.00000000,
  `fk_unit` int(11) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `fk_default_workstation` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_bom_bomline_rowid` (`rowid`),
  KEY `idx_bom_bomline_fk_product` (`fk_product`),
  KEY `idx_bom_bomline_fk_bom` (`fk_bom`),
  CONSTRAINT `llx_bom_bomline_fk_bom` FOREIGN KEY (`fk_bom`) REFERENCES `llx_bom_bom` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_bom_bomline`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_bom_bomline` WRITE;
/*!40000 ALTER TABLE `llx_bom_bomline` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_bom_bomline` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_bom_bomline_extrafields`
--

DROP TABLE IF EXISTS `llx_bom_bomline_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_bom_bomline_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_bom_bomline_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_bom_bomline_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_bom_bomline_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_bom_bomline_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_bookcal_availabilities`
--

DROP TABLE IF EXISTS `llx_bookcal_availabilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_bookcal_availabilities` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `start` date NOT NULL,
  `end` date NOT NULL,
  `duration` int(11) NOT NULL DEFAULT 30,
  `startHour` int(11) NOT NULL,
  `endHour` int(11) NOT NULL,
  `fk_bookcal_calendar` int(11) NOT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_bookcal_availabilities_rowid` (`rowid`),
  KEY `fk_bookcal_availabilities_fk_user_creat` (`fk_user_creat`),
  KEY `idx_bookcal_availabilities_status` (`status`),
  KEY `idx_bookcal_availabilities_fk_bookcal_calendar` (`fk_bookcal_calendar`),
  CONSTRAINT `fk_bookcal_availabilities_fk_bookcal_calendar` FOREIGN KEY (`fk_bookcal_calendar`) REFERENCES `llx_bookcal_calendar` (`rowid`),
  CONSTRAINT `fk_bookcal_availabilities_fk_user_creat` FOREIGN KEY (`fk_user_creat`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_bookcal_availabilities`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_bookcal_availabilities` WRITE;
/*!40000 ALTER TABLE `llx_bookcal_availabilities` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_bookcal_availabilities` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_bookcal_availabilities_extrafields`
--

DROP TABLE IF EXISTS `llx_bookcal_availabilities_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_bookcal_availabilities_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_availabilities_fk_object` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_bookcal_availabilities_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_bookcal_availabilities_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_bookcal_availabilities_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_bookcal_availabilities_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_bookcal_calendar`
--

DROP TABLE IF EXISTS `llx_bookcal_calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_bookcal_calendar` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref` varchar(128) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_project` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL,
  `visibility` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`),
  KEY `idx_bookcal_calendar_rowid` (`rowid`),
  KEY `idx_bookcal_calendar_ref` (`ref`),
  KEY `idx_bookcal_calendar_fk_soc` (`fk_soc`),
  KEY `idx_bookcal_calendar_fk_project` (`fk_project`),
  KEY `llx_bookcal_calendar_fk_user_creat` (`fk_user_creat`),
  KEY `idx_bookcal_calendar_status` (`status`),
  CONSTRAINT `llx_bookcal_calendar_fk_user_creat` FOREIGN KEY (`fk_user_creat`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_bookcal_calendar`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_bookcal_calendar` WRITE;
/*!40000 ALTER TABLE `llx_bookcal_calendar` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_bookcal_calendar` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_bookcal_calendar_extrafields`
--

DROP TABLE IF EXISTS `llx_bookcal_calendar_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_bookcal_calendar_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_calendar_fk_object` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_bookcal_calendar_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_bookcal_calendar_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_bookcal_calendar_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_bookcal_calendar_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_bookmark`
--

DROP TABLE IF EXISTS `llx_bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_bookmark` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_user` int(11) NOT NULL,
  `dateb` datetime DEFAULT NULL,
  `url` text DEFAULT NULL,
  `target` varchar(16) DEFAULT NULL,
  `title` varchar(64) DEFAULT NULL,
  `favicon` varchar(24) DEFAULT NULL,
  `position` int(11) DEFAULT 0,
  `entity` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_bookmark_title` (`fk_user`,`entity`,`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_bookmark`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_bookmark` WRITE;
/*!40000 ALTER TABLE `llx_bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_bookmark` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_bordereau_cheque`
--

DROP TABLE IF EXISTS `llx_bordereau_cheque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_bordereau_cheque` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `type` varchar(6) DEFAULT 'CHQ',
  `datec` datetime NOT NULL,
  `date_bordereau` date DEFAULT NULL,
  `amount` double(24,8) NOT NULL,
  `nbcheque` smallint(6) NOT NULL,
  `fk_bank_account` int(11) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `statut` smallint(6) NOT NULL DEFAULT 0,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `note` text DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_bordereau_cheque` (`ref`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_bordereau_cheque`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_bordereau_cheque` WRITE;
/*!40000 ALTER TABLE `llx_bordereau_cheque` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_bordereau_cheque` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_boxes`
--

DROP TABLE IF EXISTS `llx_boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_boxes` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `box_id` int(11) NOT NULL,
  `position` smallint(6) NOT NULL,
  `box_order` varchar(3) NOT NULL,
  `fk_user` int(11) NOT NULL DEFAULT 0,
  `maxline` int(11) DEFAULT NULL,
  `params` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_boxes` (`entity`,`box_id`,`position`,`fk_user`),
  KEY `idx_boxes_boxid` (`box_id`),
  KEY `idx_boxes_fk_user` (`fk_user`),
  CONSTRAINT `fk_boxes_box_id` FOREIGN KEY (`box_id`) REFERENCES `llx_boxes_def` (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_boxes`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_boxes` WRITE;
/*!40000 ALTER TABLE `llx_boxes` DISABLE KEYS */;
INSERT INTO `llx_boxes` VALUES
(1,1,1,0,'0',0,NULL,NULL),
(2,1,2,0,'0',0,NULL,NULL),
(3,1,3,0,'0',0,NULL,NULL),
(4,1,4,0,'0',0,NULL,NULL),
(5,1,5,0,'0',0,NULL,NULL),
(6,1,6,0,'0',0,NULL,NULL),
(7,1,7,0,'0',0,NULL,NULL),
(8,1,8,0,'0',0,NULL,NULL);
/*!40000 ALTER TABLE `llx_boxes` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_boxes_def`
--

DROP TABLE IF EXISTS `llx_boxes_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_boxes_def` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `file` varchar(200) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_user` int(11) NOT NULL DEFAULT 0,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `note` varchar(130) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_boxes_def` (`file`,`entity`,`note`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_boxes_def`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_boxes_def` WRITE;
/*!40000 ALTER TABLE `llx_boxes_def` DISABLE KEYS */;
INSERT INTO `llx_boxes_def` VALUES
(1,'box_lastlogin.php',1,0,'2026-09-23 07:34:05',NULL),
(2,'box_birthdays.php',1,0,'2026-09-23 07:34:05',NULL),
(3,'box_dolibarr_state_board.php',1,0,'2026-09-23 07:34:05',NULL),
(4,'box_clients.php',1,0,'2026-09-23 07:46:42',NULL),
(5,'box_prospect.php',1,0,'2026-09-23 07:46:42',NULL),
(6,'box_contacts.php',1,0,'2026-09-23 07:46:42',NULL),
(7,'box_activity.php',1,0,'2026-09-23 07:46:42','(WarningUsingThisBoxSlowDown)'),
(8,'box_goodcustomers.php',1,0,'2026-09-23 07:46:42','(WarningUsingThisBoxSlowDown)');
/*!40000 ALTER TABLE `llx_boxes_def` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_budget`
--

DROP TABLE IF EXISTS `llx_budget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_budget` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `label` varchar(255) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_budget`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_budget` WRITE;
/*!40000 ALTER TABLE `llx_budget` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_budget` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_budget_lines`
--

DROP TABLE IF EXISTS `llx_budget_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_budget_lines` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_budget` int(11) NOT NULL,
  `fk_project_ids` varchar(180) NOT NULL,
  `amount` double(24,8) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_budget_lines` (`fk_budget`,`fk_project_ids`),
  CONSTRAINT `fk_budget_lines_budget` FOREIGN KEY (`fk_budget`) REFERENCES `llx_budget` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_budget_lines`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_budget_lines` WRITE;
/*!40000 ALTER TABLE `llx_budget_lines` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_budget_lines` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_accounting_category`
--

DROP TABLE IF EXISTS `llx_c_accounting_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_accounting_category` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_report` int(11) NOT NULL DEFAULT 1,
  `code` varchar(16) NOT NULL,
  `label` varchar(255) NOT NULL,
  `range_account` varchar(255) NOT NULL,
  `sens` tinyint(4) NOT NULL DEFAULT 0,
  `category_type` tinyint(4) NOT NULL DEFAULT 0,
  `formula` varchar(255) NOT NULL,
  `position` int(11) DEFAULT 0,
  `fk_country` int(11) DEFAULT NULL,
  `active` int(11) DEFAULT 1,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_accounting_category` (`code`,`entity`,`fk_report`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_accounting_category`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_accounting_category` WRITE;
/*!40000 ALTER TABLE `llx_c_accounting_category` DISABLE KEYS */;
INSERT INTO `llx_c_accounting_category` VALUES
(1,1,1,'INCOMES','Income of products/services','Example: 7xxxxx',0,0,'',10,0,1),
(2,1,1,'EXPENSES','Expenses of products/services','Example: 6xxxxx',0,0,'',20,0,1),
(3,1,1,'PROFIT','Balance','',0,1,'INCOMES+EXPENSES',30,0,1);
/*!40000 ALTER TABLE `llx_c_accounting_category` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_accounting_report`
--

DROP TABLE IF EXISTS `llx_c_accounting_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_accounting_report` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `code` varchar(16) NOT NULL,
  `label` varchar(255) NOT NULL,
  `fk_country` int(11) DEFAULT NULL,
  `active` int(11) DEFAULT 1,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_accounting_report` (`code`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_accounting_report`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_accounting_report` WRITE;
/*!40000 ALTER TABLE `llx_c_accounting_report` DISABLE KEYS */;
INSERT INTO `llx_c_accounting_report` VALUES
(1,1,'REP','Report personalized',0,1);
/*!40000 ALTER TABLE `llx_c_accounting_report` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_action_trigger`
--

DROP TABLE IF EXISTS `llx_c_action_trigger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_action_trigger` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `elementtype` varchar(64) NOT NULL,
  `code` varchar(128) NOT NULL,
  `contexts` varchar(255) DEFAULT NULL,
  `label` varchar(128) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `rang` int(11) DEFAULT 0,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_action_trigger_code` (`code`),
  KEY `idx_action_trigger_rang` (`rang`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_action_trigger`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_action_trigger` WRITE;
/*!40000 ALTER TABLE `llx_c_action_trigger` DISABLE KEYS */;
INSERT INTO `llx_c_action_trigger` VALUES
(1,'societe','COMPANY_CREATE',NULL,'Third party created','Executed when a third party is created',1),
(2,'societe','COMPANY_MODIFY',NULL,'Third party update','Executed when you update third party',2),
(3,'societe','COMPANY_SENTBYMAIL',NULL,'Mails sent from third party card','Executed when you send email from third party card',3),
(4,'societe','COMPANY_DELETE',NULL,'Third party deleted','Executed when you delete third party',4),
(5,'societe','COMPANY_RIB_CREATE',NULL,'Third party payment information created','Executed when a third party payment information is created',5),
(6,'societe','COMPANY_RIB_MODIFY',NULL,'Third party payment information updated','Executed when a third party payment information is updated',6),
(7,'societe','COMPANY_RIB_DELETE',NULL,'Third party payment information deleted','Executed when a third party payment information is deleted',7),
(8,'propal','PROPAL_VALIDATE',NULL,'Customer proposal validated','Executed when a commercial proposal is validated',20),
(9,'propal','PROPAL_MODIFY',NULL,'Customer proposal modified','Executed when a customer proposal is modified',21),
(10,'propal','PROPAL_SENTBYMAIL',NULL,'Commercial proposal sent by mail','Executed when a commercial proposal is sent by mail',22),
(11,'propal','PROPAL_CLOSE_SIGNED',NULL,'Customer proposal closed signed','Executed when a customer proposal is closed signed',23),
(12,'propal','PROPAL_CLOSE_REFUSED',NULL,'Customer proposal closed refused','Executed when a customer proposal is closed refused',24),
(13,'propal','PROPAL_CLASSIFY_BILLED',NULL,'Customer proposal set billed','Executed when a customer proposal is set to billed',25),
(14,'propal','PROPAL_DELETE',NULL,'Customer proposal deleted','Executed when a customer proposal is deleted',26),
(15,'commande','ORDER_VALIDATE',NULL,'Customer order validate','Executed when a customer order is validated',30),
(16,'commande','ORDER_CLOSE',NULL,'Customer order classify delivered','Executed when a customer order is set delivered',31),
(17,'commande','ORDER_MODIFY',NULL,'Customer order modified','Executed when a customer order is set modified',32),
(18,'commande','ORDER_CLASSIFY_BILLED',NULL,'Customer order classify billed','Executed when a customer order is set to billed',33),
(19,'commande','ORDER_CANCEL',NULL,'Customer order canceled','Executed when a customer order is canceled',34),
(20,'commande','ORDER_SENTBYMAIL',NULL,'Customer order sent by mail','Executed when a customer order is sent by mail ',35),
(21,'commande','ORDER_DELETE',NULL,'Customer order deleted','Executed when a customer order is deleted',36),
(22,'facture','BILL_VALIDATE',NULL,'Customer invoice validated','Executed when a customer invoice is approved',40),
(23,'facture','BILL_MODIFY',NULL,'Customer invoice modified','Executed when a customer invoice is modified',41),
(24,'facture','BILL_PAYED',NULL,'Customer invoice payed','Executed when a customer invoice is payed',42),
(25,'facture','BILL_CANCEL',NULL,'Customer invoice canceled','Executed when a customer invoice is canceled',43),
(26,'facture','BILL_SENTBYMAIL',NULL,'Customer invoice sent by mail','Executed when a customer invoice is sent by mail',44),
(27,'facture','BILL_UNVALIDATE',NULL,'Customer invoice unvalidated','Executed when a customer invoice status set back to draft',45),
(28,'facture','BILL_DELETE',NULL,'Customer invoice deleted','Executed when a customer invoice is deleted',46),
(29,'proposal_supplier','PROPOSAL_SUPPLIER_VALIDATE',NULL,'Price request validated','Executed when a commercial proposal is validated',50),
(30,'proposal_supplier','PROPOSAL_SUPPLIER_MODIFY',NULL,'Price request modified','Executed when a commercial proposal is modified',51),
(31,'proposal_supplier','PROPOSAL_SUPPLIER_SENTBYMAIL',NULL,'Price request sent by mail','Executed when a commercial proposal is sent by mail',52),
(32,'proposal_supplier','PROPOSAL_SUPPLIER_CLOSE_SIGNED',NULL,'Price request closed signed','Executed when a customer proposal is closed signed',53),
(33,'proposal_supplier','PROPOSAL_SUPPLIER_CLOSE_REFUSED',NULL,'Price request closed refused','Executed when a customer proposal is closed refused',54),
(34,'proposal_supplier','PROPOSAL_SUPPLIER_DELETE',NULL,'Price request deleted','Executed when a customer proposal delete',55),
(35,'order_supplier','ORDER_SUPPLIER_VALIDATE',NULL,'Purchase order validated','Executed when a supplier order is validated',60),
(36,'order_supplier','ORDER_SUPPLIER_MODIFY',NULL,'Purchase order request modified','Executed when a supplier order is modified',61),
(37,'order_supplier','ORDER_SUPPLIER_APPROVE',NULL,'Purchase order request approved','Executed when a supplier order is approved',62),
(38,'order_supplier','ORDER_SUPPLIER_REFUSE',NULL,'Purchase order request refused','Executed when a supplier order is refused',63),
(39,'order_supplier','ORDER_SUPPLIER_SUBMIT',NULL,'Purchase order request submited','Executed when a supplier order is approved',64),
(40,'order_supplier','ORDER_SUPPLIER_RECEIVE',NULL,'Purchase order request received','Executed when a supplier order is received',65),
(41,'order_supplier','ORDER_SUPPLIER_CANCEL',NULL,'Purchase order request canceled','Executed when a supplier order is canceled',66),
(42,'order_supplier','ORDER_SUPPLIER_SENTBYMAIL',NULL,'Purchase order sent by mail','Executed when a supplier order is sent by mail',67),
(43,'order_supplier','ORDER_SUPPLIER_CLASSIFY_BILLED',NULL,'Purchase order set billed','Executed when a supplier order is set as billed',68),
(44,'order_supplier','ORDER_SUPPLIER_DELETE',NULL,'Purchase order deleted','Executed when a supplier order is deleted',69),
(45,'invoice_supplier','BILL_SUPPLIER_VALIDATE',NULL,'Supplier invoice validated','Executed when a supplier invoice is validated',81),
(46,'invoice_supplier','BILL_SUPPLIER_MODIFY',NULL,'Supplier invoice modified','Executed when a supplier invoice is modified',82),
(47,'invoice_supplier','BILL_SUPPLIER_UNVALIDATE',NULL,'Supplier invoice unvalidated','Executed when a supplier invoice status is set back to draft',83),
(48,'invoice_supplier','BILL_SUPPLIER_PAYED',NULL,'Supplier invoice payed','Executed when a supplier invoice is payed',84),
(49,'invoice_supplier','BILL_SUPPLIER_SENTBYMAIL',NULL,'Supplier invoice sent by mail','Executed when a supplier invoice is sent by mail',85),
(50,'invoice_supplier','BILL_SUPPLIER_CANCELED',NULL,'Supplier invoice cancelled','Executed when a supplier invoice is cancelled',86),
(51,'invoice_supplier','BILL_SUPPLIER_DELETE',NULL,'Supplier invoice deleted','Executed when a supplier invoice is deleted',87),
(52,'contrat','CONTRACT_VALIDATE',NULL,'Contract validated','Executed when a contract is validated',90),
(53,'contrat','CONTRACT_MODIFY',NULL,'Contract modified','Executed when a contract is modified',91),
(54,'contrat','CONTRACT_SENTBYMAIL',NULL,'Contract sent by mail','Executed when a contract is sent by mail',92),
(55,'contrat','CONTRACT_DELETE',NULL,'Contract deleted','Executed when a contract is deleted',93),
(56,'shipping','SHIPPING_VALIDATE',NULL,'Shipping validated','Executed when a shipping is validated',100),
(57,'shipping','SHIPPING_MODIFY',NULL,'Shipping modified','Executed when a shipping is modified',101),
(58,'shipping','SHIPPING_SENTBYMAIL',NULL,'Shipping sent by mail','Executed when a shipping is sent by mail',102),
(59,'shipping','SHIPPING_DELETE',NULL,'Shipping sent is deleted','Executed when a shipping is deleted',103),
(60,'reception','RECEPTION_VALIDATE',NULL,'Reception validated','Executed when a reception is validated',110),
(61,'reception','RECEPTION_SENTBYMAIL',NULL,'Reception sent by mail','Executed when a reception is sent by mail',111),
(62,'member','MEMBER_VALIDATE',NULL,'Member validated','Executed when a member is validated',120),
(63,'member','MEMBER_MODIFY',NULL,'Member modified','Executed when a member is modified',121),
(64,'member','MEMBER_SENTBYMAIL',NULL,'Mails sent from member card','Executed when you send email from member card',122),
(65,'member','MEMBER_SUBSCRIPTION_CREATE',NULL,'Member subscribtion recorded','Executed when a member subscribtion is deleted',123),
(66,'member','MEMBER_SUBSCRIPTION_MODIFY',NULL,'Member subscribtion modified','Executed when a member subscribtion is modified',124),
(67,'member','MEMBER_SUBSCRIPTION_DELETE',NULL,'Member subscribtion deleted','Executed when a member subscribtion is deleted',125),
(68,'member','MEMBER_RESILIATE',NULL,'Member resiliated','Executed when a member is resiliated',126),
(69,'member','MEMBER_EXCLUDE',NULL,'Member excluded','Executed when a member is excluded',127),
(70,'member','MEMBER_DELETE',NULL,'Member deleted','Executed when a member is deleted',128),
(71,'ficheinter','FICHINTER_VALIDATE',NULL,'Intervention validated','Executed when a intervention is validated',130),
(72,'ficheinter','FICHINTER_MODIFY',NULL,'Intervention modified','Executed when a intervention is modify',131),
(73,'ficheinter','FICHINTER_CLASSIFY_BILLED',NULL,'Intervention set billed','Executed when a intervention is set to billed (when option FICHINTER_CLASSIFY_BILLED is set)',132),
(74,'ficheinter','FICHINTER_CLASSIFY_UNBILLED',NULL,'Intervention set unbilled','Executed when a intervention is set to unbilled (when option FICHINTER_CLASSIFY_BILLED is set)',133),
(75,'ficheinter','FICHINTER_REOPEN',NULL,'Intervention opened','Executed when a intervention is re-opened',134),
(76,'ficheinter','FICHINTER_SENTBYMAIL',NULL,'Intervention sent by mail','Executed when a intervention is sent by mail',135),
(77,'ficheinter','FICHINTER_DELETE',NULL,'Intervention is deleted','Executed when a intervention is deleted',136),
(78,'ficheinter','FICHINTER_CLOSE',NULL,'Intervention is done','Executed when a intervention is done',137),
(79,'product','PRODUCT_CREATE',NULL,'Product or service created','Executed when a product or sevice is created',150),
(80,'product','PRODUCT_MODIFY',NULL,'Product or service modified','Executed when a product or sevice is modified',151),
(81,'product','PRODUCT_DELETE',NULL,'Product or service deleted','Executed when a product or sevice is deleted',152),
(82,'stocktransfer','STOCKTRANSFER_CREATE',NULL,'Stock transfer created','Executed when a stock transfer is created',670),
(83,'stocktransfer','STOCKTRANSFER_MODIFY',NULL,'Stock transfer modified','Executed when a stock transfer is modified',671),
(84,'stocktransfer','STOCKTRANSFER_VALIDATE',NULL,'Stock transfer validated','Executed when a stock transfer is validated',672),
(85,'stocktransfer','STOCKTRANSFER_UNVALIDATE',NULL,'Stock transfer back to draft','Executed when a stock transfer is set back to draft',673),
(86,'stocktransfer','STOCKTRANSFER_CLOSE',NULL,'Stock transfer closed','Executed when a stock transfer is closed after destination stock increment',676),
(87,'expensereport','EXPENSE_REPORT_CREATE',NULL,'Expense report created','Executed when an expense report is created',201),
(88,'expensereport','EXPENSE_REPORT_VALIDATE',NULL,'Expense report validated','Executed when an expense report is validated',202),
(89,'expensereport','EXPENSE_REPORT_MODIFY',NULL,'Expense report modified','Executed when an expense report is modified',202),
(90,'expensereport','EXPENSE_REPORT_APPROVE',NULL,'Expense report approved','Executed when an expense report is approved',203),
(91,'expensereport','EXPENSE_REPORT_PAID',NULL,'Expense report billed','Executed when an expense report is set as billed',204),
(92,'expensereport','EXPENSE_REPORT_DELETE',NULL,'Expense report deleted','Executed when an expense report is deleted',205),
(93,'project','PROJECT_CREATE',NULL,'Project creation','Executed when a project is created',140),
(94,'project','PROJECT_VALIDATE',NULL,'Project validation','Executed when a project is validated',141),
(95,'project','PROJECT_MODIFY',NULL,'Project modified','Executed when a project is modified',142),
(96,'project','PROJECT_DELETE',NULL,'Project deleted','Executed when a project is deleted',143),
(97,'project','PROJECT_SENTBYMAIL',NULL,'Project sent by mail','Executed when a project is sent by email',144),
(98,'project','PROJECT_CLOSE',NULL,'Project closed','Executed when a project is closed',145),
(99,'ticket','TICKET_CREATE',NULL,'Ticket created','Executed when a ticket is created',161),
(100,'ticket','TICKET_MODIFY',NULL,'Ticket modified','Executed when a ticket is modified',163),
(101,'ticket','TICKET_ASSIGNED',NULL,'Ticket assigned','Executed when a ticket is modified',164),
(102,'ticket','TICKET_CLOSE',NULL,'Ticket closed','Executed when a ticket is closed',165),
(103,'ticket','TICKET_SENTBYMAIL',NULL,'Ticket message sent by email','Executed when a message is sent from the ticket record',166),
(104,'ticket','TICKET_DELETE',NULL,'Ticket deleted','Executed when a ticket is deleted',167),
(105,'user','USER_SENTBYMAIL',NULL,'Email sent','Executed when an email is sent from user card',300),
(106,'user','USER_CREATE',NULL,'User created','Executed when a user is created',301),
(107,'user','USER_MODIFY',NULL,'User update','Executed when a user is updated',302),
(108,'user','USER_DELETE',NULL,'User update','Executed when a user is deleted',303),
(109,'user','USER_NEW_PASSWORD',NULL,'User update','Executed when a user is change password',304),
(110,'user','USER_ENABLEDISABLE',NULL,'User update','Executed when a user is enable or disable',305),
(111,'bom','BOM_VALIDATE',NULL,'BOM validated','Executed when a BOM is validated',650),
(112,'bom','BOM_UNVALIDATE',NULL,'BOM unvalidated','Executed when a BOM is unvalidated',651),
(113,'bom','BOM_CLOSE',NULL,'BOM disabled','Executed when a BOM is disabled',652),
(114,'bom','BOM_REOPEN',NULL,'BOM reopen','Executed when a BOM is re-open',653),
(115,'bom','BOM_DELETE',NULL,'BOM deleted','Executed when a BOM deleted',654),
(116,'mrp','MRP_MO_VALIDATE',NULL,'MO validated','Executed when a MO is validated',660),
(117,'mrp','MRP_MO_PRODUCED',NULL,'MO produced','Executed when a MO is produced',661),
(118,'mrp','MRP_MO_DELETE',NULL,'MO deleted','Executed when a MO is deleted',662),
(119,'mrp','MRP_MO_CANCEL',NULL,'MO canceled','Executed when a MO is canceled',663),
(120,'contact','CONTACT_CREATE',NULL,'Contact address created','Executed when a contact is created',250),
(121,'contact','CONTACT_MODIFY',NULL,'Contact address update','Executed when a contact is updated',251),
(122,'contact','CONTACT_SENTBYMAIL',NULL,'Mails sent from third party card','Executed when you send email from contact address record',252),
(123,'contact','CONTACT_DELETE',NULL,'Contact address deleted','Executed when a contact is deleted',253),
(124,'recruitment','RECRUITMENTJOBPOSITION_CREATE',NULL,'Job created','Executed when a job is created',7500),
(125,'recruitment','RECRUITMENTJOBPOSITION_MODIFY',NULL,'Job modified','Executed when a job is modified',7502),
(126,'recruitment','RECRUITMENTJOBPOSITION_SENTBYMAIL',NULL,'Mails sent from job record','Executed when you send email from job record',7504),
(127,'recruitment','RECRUITMENTJOBPOSITION_DELETE',NULL,'Job deleted','Executed when a job is deleted',7506),
(128,'recruitment','RECRUITMENTCANDIDATURE_CREATE',NULL,'Candidature created','Executed when a candidature is created',7510),
(129,'recruitment','RECRUITMENTCANDIDATURE_MODIFY',NULL,'Candidature modified','Executed when a candidature is modified',7512),
(130,'recruitment','RECRUITMENTCANDIDATURE_SENTBYMAIL',NULL,'Mails sent from candidature record','Executed when you send email from candidature record',7514),
(131,'recruitment','RECRUITMENTCANDIDATURE_DELETE',NULL,'Candidature deleted','Executed when a candidature is deleted',7516),
(132,'project','TASK_CREATE',NULL,'Task created','Executed when a project task is created',150),
(133,'project','TASK_MODIFY',NULL,'Task modified','Executed when a project task is modified',151),
(134,'project','TASK_DELETE',NULL,'Task deleted','Executed when a project task is deleted',152),
(135,'agenda','ACTION_CREATE',NULL,'Action added','Executed when an action is added to the agenda',700),
(136,'holiday','HOLIDAY_CREATE',NULL,'Holiday created','Executed when a holiday is created',800),
(137,'holiday','HOLIDAY_MODIFY',NULL,'Holiday modified','Executed when a holiday is modified',801),
(138,'holiday','HOLIDAY_VALIDATE',NULL,'Holiday validated','Executed when a holiday is validated',802),
(139,'holiday','HOLIDAY_APPROVE',NULL,'Holiday approved','Executed when a holiday is aprouved',803),
(140,'holiday','HOLIDAY_CANCEL',NULL,'Holiday canceled','Executed when a holiday is canceled',802),
(141,'holiday','HOLIDAY_DELETE',NULL,'Holiday deleted','Executed when a holiday is deleted',804),
(142,'hrm','HRM_EVALUATION_CREATE',NULL,'HR Evaluation created','Executed when an evaluation is created',4000),
(143,'hrm','HRM_EVALUATION_MODIFY',NULL,'HR Evaluation modified','Executed when an evaluation is modified',4001),
(144,'hrm','HRM_EVALUATION_VALIDATE',NULL,'HR Evaluation validated','Executed when an evaluation is validated',4002),
(145,'hrm','HRM_EVALUATION_UNVALIDATE',NULL,'HR Evaluation back to draft','Executed when an evaluation is back to draft',4003),
(146,'hrm','HRM_EVALUATION_DELETE',NULL,'HR Evaluation deleted','Executed when an evaluation is dleted',4005),
(147,'facturerec','BILLREC_CREATE',NULL,'Template invoices created','Executed when a Template invoices is created',900),
(148,'facturerec','BILLREC_MODIFY',NULL,'Template invoices update','Executed when a Template invoices is updated',901),
(149,'facturerec','BILLREC_DELETE',NULL,'Template invoices deleted','Executed when a Template invoices is deleted',902),
(150,'partnership','PARTNERSHIP_CREATE',NULL,'Partnership created','Executed when a partnership is created',58000),
(151,'partnership','PARTNERSHIP_MODIFY',NULL,'Partnership modified','Executed when a partnership is modified',58002),
(152,'partnership','PARTNERSHIP_SENTBYMAIL',NULL,'Mails sent from partnership file','Executed when you send email from partnership file',58004),
(153,'partnership','PARTNERSHIP_DELETE',NULL,'Partnership deleted','Executed when a partnership is deleted',58006),
(154,'knowledgemanagement','KNOWLEDGERECORD_CREATE',NULL,'Knowledgerecord created','Executed when a knowledgerecord is created',57001),
(155,'knowledgemanagement','KNOWLEDGERECORD_MODIFY',NULL,'Knowledgerecord modified','Executed when a knowledgerecord is modified',57002),
(156,'knowledgemanagement','KNOWLEDGERECORD_VALIDATE',NULL,'Knowledgerecord Evaluation validated','Executed when an evaluation is validated',57004),
(157,'knowledgemanagement','KNOWLEDGERECORD_REOPEN',NULL,'Knowledgerecord reopen','Executed when an evaluation is back to draft',57004),
(158,'knowledgemanagement','KNOWLEDGERECORD_UNVALIDATE',NULL,'Knowledgerecord unvalidated','Executed when an evaluation is back to draft',57004),
(159,'knowledgemanagement','KNOWLEDGERECORD_CANCEL',NULL,'Knowledgerecord cancel','Executed when an evaluation to cancel',57004),
(160,'knowledgemanagement','KNOWLEDGERECORD_SENTBYMAIL',NULL,'Mails sent from knowledgerecord file','knowledgerecord when you send email from knowledgerecord file',57004),
(161,'knowledgemanagement','KNOWLEDGERECORD_DELETE',NULL,'Knowledgerecord deleted','Executed when a knowledgerecord is deleted',57006);
/*!40000 ALTER TABLE `llx_c_action_trigger` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_actioncomm`
--

DROP TABLE IF EXISTS `llx_c_actioncomm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_actioncomm` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL DEFAULT 'system',
  `libelle` varchar(128) NOT NULL,
  `module` varchar(50) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `todo` tinyint(4) DEFAULT NULL,
  `color` varchar(9) DEFAULT NULL,
  `picto` varchar(48) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_c_actioncomm` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_actioncomm`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_actioncomm` WRITE;
/*!40000 ALTER TABLE `llx_c_actioncomm` DISABLE KEYS */;
INSERT INTO `llx_c_actioncomm` VALUES
(1,'AC_TEL','system','Phone call',NULL,1,NULL,NULL,NULL,2),
(2,'AC_FAX','system','Send Fax',NULL,0,NULL,NULL,NULL,3),
(4,'AC_EMAIL','system','Send Email',NULL,0,NULL,NULL,NULL,4),
(5,'AC_RDV','system','Rendez-vous',NULL,1,NULL,NULL,NULL,1),
(6,'AC_EMAIL_IN','system','Reception Email',NULL,0,NULL,NULL,NULL,4),
(11,'AC_INT','system','Intervention on site',NULL,1,NULL,NULL,NULL,4),
(40,'AC_OTH_AUTO','systemauto','Other (automatically inserted events)',NULL,1,NULL,NULL,NULL,20),
(50,'AC_OTH','system','Other (manually inserted events)',NULL,1,NULL,NULL,NULL,5),
(60,'AC_EO_ONLINECONF','module','Online/Virtual conference','conference@eventorganization',1,NULL,NULL,NULL,60),
(61,'AC_EO_INDOORCONF','module','Indoor conference','conference@eventorganization',1,NULL,NULL,NULL,61),
(62,'AC_EO_ONLINEBOOTH','module','Online/Virtual booth','booth@eventorganization',1,NULL,NULL,NULL,62),
(63,'AC_EO_INDOORBOOTH','module','Indoor booth','booth@eventorganization',1,NULL,NULL,NULL,63);
/*!40000 ALTER TABLE `llx_c_actioncomm` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_asset_disposal_type`
--

DROP TABLE IF EXISTS `llx_c_asset_disposal_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_asset_disposal_type` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `code` varchar(16) NOT NULL,
  `label` varchar(50) NOT NULL,
  `active` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_asset_disposal_type` (`code`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_asset_disposal_type`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_asset_disposal_type` WRITE;
/*!40000 ALTER TABLE `llx_c_asset_disposal_type` DISABLE KEYS */;
INSERT INTO `llx_c_asset_disposal_type` VALUES
(1,1,'C','Sale',1),
(2,1,'HS','Putting out of service',1),
(3,1,'D','Destruction',1);
/*!40000 ALTER TABLE `llx_c_asset_disposal_type` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_availability`
--

DROP TABLE IF EXISTS `llx_c_availability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_availability` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) NOT NULL,
  `label` varchar(128) NOT NULL,
  `type_duration` varchar(1) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `position` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_availability` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_availability`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_availability` WRITE;
/*!40000 ALTER TABLE `llx_c_availability` DISABLE KEYS */;
INSERT INTO `llx_c_availability` VALUES
(1,'AV_NOW','Immediate',NULL,0,1,10),
(2,'AV_1D','1 day','d',1,1,11),
(3,'AV_2D','2 days','d',2,1,12),
(4,'AV_3D','3 days','d',3,1,13),
(5,'AV_4D','4 days','d',4,1,14),
(6,'AV_5D','5 days','d',5,1,15),
(7,'AV_1W','1 week','w',1,1,20),
(8,'AV_2W','2 weeks','w',2,1,30),
(9,'AV_3W','3 weeks','w',3,1,40),
(10,'AV_4W','4 weeks','w',4,1,50),
(11,'AV_5W','5 weeks','w',5,1,60),
(12,'AV_6W','6 weeks','w',6,1,70),
(13,'AV_8W','8 weeks','w',8,1,80),
(14,'AV_10W','10 weeks','w',10,1,90),
(15,'AV_12W','12 weeks','w',12,1,100),
(16,'AV_14W','14 weeks','w',14,1,110),
(17,'AV_16W','16 weeks','w',16,1,120);
/*!40000 ALTER TABLE `llx_c_availability` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_barcode_type`
--

DROP TABLE IF EXISTS `llx_c_barcode_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_barcode_type` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(16) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `libelle` varchar(128) NOT NULL,
  `coder` varchar(16) NOT NULL,
  `example` varchar(16) NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_barcode_type` (`code`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_barcode_type`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_barcode_type` WRITE;
/*!40000 ALTER TABLE `llx_c_barcode_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_c_barcode_type` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_chargesociales`
--

DROP TABLE IF EXISTS `llx_c_chargesociales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_chargesociales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(128) DEFAULT NULL,
  `deductible` smallint(6) NOT NULL DEFAULT 0,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `code` varchar(24) NOT NULL,
  `accountancy_code` varchar(32) DEFAULT NULL,
  `fk_pays` int(11) NOT NULL DEFAULT 1,
  `module` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10214 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_chargesociales`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_chargesociales` WRITE;
/*!40000 ALTER TABLE `llx_c_chargesociales` DISABLE KEYS */;
INSERT INTO `llx_c_chargesociales` VALUES
(1,'Securite sociale (URSSAF / MSA)',1,1,'TAXSECU',NULL,1,NULL),
(2,'Securite sociale des indÃ©pendants (URSSAF)',1,1,'TAXSSI',NULL,1,NULL),
(10,'Taxe apprentissage',1,1,'TAXAPP',NULL,1,NULL),
(11,'Formation professionnelle continue',1,1,'TAXFPC',NULL,1,NULL),
(12,'Cotisation fonciere des entreprises (CFE)',1,1,'TAXCFE',NULL,1,NULL),
(13,'Cotisation sur la valeur ajoutee des entreprises (CVAE)',1,1,'TAXCVAE',NULL,1,NULL),
(20,'Taxe fonciere',1,1,'TAXFON',NULL,1,NULL),
(25,'Prelevement Ã  la source (PAS)',0,1,'TAXPAS',NULL,1,NULL),
(30,'Prevoyance',1,1,'TAXPREV',NULL,1,NULL),
(40,'Mutuelle',1,1,'TAXMUT',NULL,1,NULL),
(50,'Retraite',1,1,'TAXRET',NULL,1,NULL),
(60,'Taxe sur vehicule societe (TVS)',0,1,'TAXTVS',NULL,1,NULL),
(70,'impÃ´ts sur les sociÃ©tÃ©s (IS)',0,1,'TAXIS',NULL,1,NULL),
(201,'ONSS',1,1,'TAXBEONSS',NULL,2,NULL),
(210,'Precompte professionnel',1,1,'TAXBEPREPRO',NULL,2,NULL),
(220,'Prime existence',1,1,'TAXBEPRIEXI',NULL,2,NULL),
(230,'Precompte immobilier',1,1,'TAXBEPREIMMO',NULL,2,NULL),
(600,'AVS / AI / APG (Basic social contributions grouped)',1,1,'TAXCHBASE',NULL,6,NULL),
(601,'Old-age insurance (AVS)',1,1,'TAXCHAVS',NULL,6,NULL),
(602,'Disability insurance (AI)',1,1,'TAXCHAI',NULL,6,NULL),
(603,'Income compensation allowance (APG)',1,1,'TAXCHAPG',NULL,6,NULL),
(604,'Family allowances (CAF)',1,1,'TAXCHAC',NULL,6,NULL),
(605,'Unemployment insurance (AC)',1,1,'TAXCHACHO',NULL,6,NULL),
(606,'Occupational pension plan (LPP / 2nd pillar)',1,1,'TAXCHLPP',NULL,6,NULL),
(607,'Occupational accident insurance (LAA - employer share)',1,1,'TAXCHAA',NULL,6,NULL),
(608,'Non-occupational accident insurance (LAA - employer share)',1,1,'TAXCHAA-NP',NULL,6,NULL),
(609,'Health insurance (LAMal - optional employer contribution)',1,1,'TAXCHLAMAL',NULL,6,NULL),
(610,'Withholding tax (employees taxed at source)',1,1,'TAXCHIS',NULL,6,NULL),
(4101,'Krankenversicherung',1,1,'TAXATKV',NULL,41,NULL),
(4102,'Unfallversicherung',1,1,'TAXATUV',NULL,41,NULL),
(4103,'Pensionsversicherung',1,1,'TAXATPV',NULL,41,NULL),
(4104,'Arbeitslosenversicherung',1,1,'TAXATAV',NULL,41,NULL),
(4105,'Insolvenzentgeltsicherungsfond',1,1,'TAXATIESG',NULL,41,NULL),
(4106,'WohnbaufÃ¶rderung',1,1,'TAXATWF',NULL,41,NULL),
(4107,'Arbeiterkammerumlage',1,1,'TAXATAK',NULL,41,NULL),
(4108,'Mitarbeitervorsorgekasse',1,1,'TAXATMVK',NULL,41,NULL),
(4109,'Familienlastenausgleichsfond',1,1,'TAXATFLAF',NULL,41,NULL),
(10201,'Î‘Î½Î±Î»Ï…Ï„Î¹ÎºÎ® Î ÎµÏÎ¹Î¿Î´Î¹ÎºÎ® Î”Î®Î»Ï‰ÏƒÎ· (Î‘Î Î”)',1,1,'Î‘Î Î”',NULL,102,NULL),
(10202,'Î¦ÏŒÏÎ¿Ï‚ ÎœÎ¹ÏƒÎ¸Ï‰Ï„ÏŽÎ½ Î¥Ï€Î·ÏÎµÏƒÎ¹ÏŽÎ½ (Î¦ÎœÎ¥)',1,1,'Î¦ÎœÎ¥',NULL,102,NULL),
(10203,'Î‘ÏƒÏ†Î±Î»Î¹ÏƒÏ„Î¹ÎºÎ­Ï‚ ÎµÎ¹ÏƒÏ†Î¿ÏÎ­Ï‚ (Î•Î¦ÎšÎ‘)',1,1,'Î•Î¦ÎšÎ‘',NULL,102,NULL),
(10204,'Î ÏÎ¿ÎºÎ±Ï„Î±Î²Î¿Î»Î® Î¦ÏŒÏÎ¿Ï… Î•Î¹ÏƒÎ¿Î´Î®Î¼Î±Ï„Î¿Ï‚',0,1,'Î•Î¦ÎŸÎ¡Î™Î‘',NULL,102,NULL),
(10205,'Î•Î½Î¹Î±Î¯Î¿Ï‚ Î¦ÏŒÏÎ¿Ï‚ Î™Î´Î¹Î¿ÎºÏ„Î·ÏƒÎ¯Î±Ï‚ Î‘ÎºÎ¹Î½Î®Ï„Ï‰Î½ (Î•Î.Î¦.Î™.Î‘) ',0,1,'Î•ÎÎ¦Î™Î‘',NULL,102,NULL),
(10206,'Î•Ï„Î®ÏƒÎ¹Î¿ Ï„Î­Î»Î¿Ï‚ Î´Î¹Î±Ï„Î®ÏÎ·ÏƒÎ·Ï‚ ÎœÎµÏÎ¯Î´Î±Ï‚ ÏƒÏ„Î¿ Î“.Î•.ÎœÎ—.',1,1,'Î“Î•ÎœÎ—',NULL,102,NULL),
(10207,'Î•Ï€Î±Î³Î³ÎµÎ»Î¼Î±Ï„Î¹ÎºÏŒ Î•Ï€Î¹Î¼ÎµÎ»Î·Ï„Î®ÏÎ¹Î¿',1,1,'Î•Î•',NULL,102,NULL),
(10208,'Î•Î¼Ï€Î¿ÏÎ¹ÎºÏŒ ÎºÎ±Î¹ Î’Î¹Î¿Î¼Î·Ï‡Î±Î½Î¹ÎºÏŒ Î•Ï€Î¹Î¼ÎµÎ»Î·Ï„Î·ÏÎ¯Î¿',1,1,'Î•Î’Î•',NULL,102,NULL),
(10209,'Î¤Î­Î»Î· ÎšÏ…ÎºÎ»Î¿Ï†Î¿ÏÎ¯Î±Ï‚',1,1,'Î¤Î•Î›Î—',NULL,102,NULL),
(10210,'Î‘ÏƒÏ†Î¬Î»Î¹ÏƒÎ· Î¿Ï‡Î®Î¼Î±Ï„Î¿Ï‚',1,1,'Î‘Î£Î¦Î‘Î›Î•Î™Î‘',NULL,102,NULL),
(10211,'Î•Î½Î¿Î¯ÎºÎ¹Î¿',1,1,'Î•ÎÎŸÎ™ÎšÎ™ÎŸ',NULL,102,NULL),
(10212,'ÎšÎ¿Î¹Î½ÏŒÏ‡ÏÎ·ÏƒÏ„Î±',1,1,'ÎšÎŸÎ™ÎÎŸ',NULL,102,NULL),
(10213,'Î—Î»ÎµÎºÏ„ÏÎ¿Î´ÏŒÏ„Î·ÏƒÎ·',1,1,'Î¡Î•Î¥ÎœÎ‘',NULL,102,NULL);
/*!40000 ALTER TABLE `llx_c_chargesociales` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_civility`
--

DROP TABLE IF EXISTS `llx_c_civility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_civility` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(6) NOT NULL,
  `label` varchar(128) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `module` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_civility` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_civility`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_civility` WRITE;
/*!40000 ALTER TABLE `llx_c_civility` DISABLE KEYS */;
INSERT INTO `llx_c_civility` VALUES
(1,'MME','Madame',1,NULL),
(2,'MR','Monsieur',1,NULL),
(3,'MLE','Mademoiselle',1,NULL),
(4,'MTRE','MaÃ®tre',1,NULL),
(5,'DR','Docteur',1,NULL);
/*!40000 ALTER TABLE `llx_c_civility` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_country`
--

DROP TABLE IF EXISTS `llx_c_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_country` (
  `rowid` int(11) NOT NULL,
  `code` varchar(2) NOT NULL,
  `code_iso` varchar(3) DEFAULT NULL,
  `numeric_code` varchar(3) DEFAULT NULL,
  `label` varchar(128) NOT NULL,
  `eec` tinyint(4) NOT NULL DEFAULT 0,
  `sepa` tinyint(4) NOT NULL DEFAULT 0,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `favorite` tinyint(4) NOT NULL DEFAULT 0,
  `phone_code` int(11) DEFAULT NULL,
  `trunk_prefix` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_c_country_code` (`code`),
  UNIQUE KEY `idx_c_country_label` (`label`),
  UNIQUE KEY `idx_c_country_code_iso` (`code_iso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_country`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_country` WRITE;
/*!40000 ALTER TABLE `llx_c_country` DISABLE KEYS */;
INSERT INTO `llx_c_country` VALUES
(0,'',NULL,NULL,'-',0,0,1,1,NULL,NULL),
(1,'FR','FRA','250','France',1,1,1,0,33,'0'),
(2,'BE','BEL','056','Belgium',1,1,1,0,32,'0'),
(3,'IT','ITA','380','Italy',1,1,1,0,39,NULL),
(4,'ES','ESP','724','Spain',1,1,1,0,34,NULL),
(5,'DE','DEU','276','Germany',1,1,1,0,49,'0'),
(6,'CH','CHE','756','Switzerland',0,1,1,0,41,'0'),
(7,'GB','GBR','826','United Kingdom',0,1,1,0,44,'0'),
(8,'IE','IRL','372','Ireland',1,1,1,0,353,'0'),
(9,'CN','CHN','156','China',0,0,1,0,86,'0'),
(10,'TN','TUN','788','Tunisia',0,0,1,0,216,NULL),
(11,'US','USA','840','United States',0,0,1,0,1,'1'),
(12,'MA','MAR','504','Morocco',0,0,1,0,212,'0'),
(13,'DZ','DZA','012','Algeria',0,0,1,0,213,'0'),
(14,'CA','CAN','124','Canada',0,0,1,0,1,'1'),
(15,'TG','TGO','768','Togo',0,0,1,0,228,NULL),
(16,'GA','GAB','266','Gabon',0,0,1,0,241,NULL),
(17,'NL','NLD','528','Netherlands',1,1,1,0,31,'0'),
(18,'HU','HUN','348','Hungary',1,1,1,0,36,'06'),
(19,'RU','RUS','643','Russia',0,0,1,0,7,'8'),
(20,'SE','SWE','752','Sweden',1,1,1,0,46,'0'),
(21,'CI','CIV','384','Ivory Cost',0,0,1,0,225,NULL),
(22,'SN','SEN','686','Senegal',0,0,1,0,221,NULL),
(23,'AR','ARG','032','Argentina',0,0,1,0,54,'0'),
(24,'CM','CMR','120','Cameroun',0,0,1,0,237,NULL),
(25,'PT','PRT','620','Portugal',1,1,1,0,351,NULL),
(26,'SA','SAU','682','Saudi Arabia',0,0,1,0,966,'0'),
(27,'MC','MCO','492','Monaco',1,1,1,0,377,NULL),
(28,'AU','AUS','036','Australia',0,0,1,0,61,'0'),
(29,'SG','SGP','702','Singapore',0,0,1,0,65,NULL),
(30,'AF','AFG','004','Afghanistan',0,0,1,0,93,'0'),
(31,'AX','ALA','248','Ã…land Islands',0,1,1,0,358,'0'),
(32,'AL','ALB','008','Albania',0,1,1,0,355,'0'),
(33,'AS','ASM','016','American Samoa',0,0,1,0,1684,'1'),
(34,'AD','AND','020','Andorra',0,1,1,0,376,NULL),
(35,'AO','AGO','024','Angola',0,0,1,0,244,'0'),
(36,'AI','AIA','660','Anguilla',0,0,1,0,1264,'1'),
(37,'AQ','ATA','010','Antarctica',0,0,1,0,NULL,NULL),
(38,'AG','ATG','028','Antigua and Barbuda',0,0,1,0,1268,'1'),
(39,'AM','ARM','051','Armenia',0,0,1,0,374,'0'),
(40,'AW','ABW','533','Aruba',0,0,1,0,297,NULL),
(41,'AT','AUT','040','Austria',1,1,1,0,43,'0'),
(42,'AZ','AZE','031','Azerbaijan',0,0,1,0,994,'0'),
(43,'BS','BHS','044','Bahamas',0,0,1,0,1242,'1'),
(44,'BH','BHR','048','Bahrain',0,0,1,0,973,NULL),
(45,'BD','BGD','050','Bangladesh',0,0,1,0,880,'0'),
(46,'BB','BRB','052','Barbados',0,0,1,0,1246,'1'),
(47,'BY','BLR','112','Belarus',0,0,1,0,375,'8'),
(48,'BZ','BLZ','084','Belize',0,0,1,0,501,NULL),
(49,'BJ','BEN','204','Benin',0,0,1,0,229,NULL),
(50,'BM','BMU','060','Bermuda',0,0,1,0,1441,'1'),
(51,'BT','BTN','064','Bhutan',0,0,1,0,975,NULL),
(52,'BO','BOL','068','Bolivia',0,0,1,0,591,'0'),
(53,'BA','BIH','070','Bosnia and Herzegovina',0,0,1,0,387,'0'),
(54,'BW','BWA','072','Botswana',0,0,1,0,267,NULL),
(55,'BV','BVT','074','Bouvet Island',0,0,0,0,NULL,NULL),
(56,'BR','BRA','076','Brazil',0,0,1,0,55,'0'),
(57,'IO','IOT','086','British Indian Ocean Territory',0,0,1,0,246,NULL),
(58,'BN','BRN','096','Brunei',0,0,1,0,673,NULL),
(59,'BG','BGR','100','Bulgaria',1,1,1,0,359,'0'),
(60,'BF','BFA','854','Burkina Faso',0,0,1,0,226,NULL),
(61,'BI','BDI','108','Burundi',0,0,1,0,257,NULL),
(62,'KH','KHM','116','Cambodia',0,0,1,0,855,'0'),
(63,'CV','CPV','132','Cape Verde',0,0,1,0,238,NULL),
(64,'KY','CYM','136','Cayman Islands',0,0,1,0,1345,'1'),
(65,'CF','CAF','140','Central African Republic (CAR/RCA)',0,0,1,0,236,NULL),
(66,'TD','TCD','148','Chad',0,0,1,0,235,NULL),
(67,'CL','CHL','152','Chile',0,0,1,0,56,NULL),
(68,'CX','CXR','162','Christmas Island',0,0,1,0,61,NULL),
(69,'CC','CCK','166','Cocos Islands (Keeling)',0,0,1,0,61,NULL),
(70,'CO','COL','170','Colombia',0,0,1,0,57,NULL),
(71,'KM','COM','174','Comoros',0,0,1,0,269,NULL),
(72,'CG','COG','178','Congo',0,0,1,0,242,NULL),
(73,'CD','COD','180','DR Congo (RDC)',0,0,1,0,243,'0'),
(74,'CK','COK','184','Cook Islands',0,0,1,0,682,NULL),
(75,'CR','CRI','188','Costa Rica',0,0,1,0,506,NULL),
(76,'HR','HRV','191','Croatia',1,1,1,0,385,'0'),
(77,'CU','CUB','192','Cuba',0,0,1,0,53,'0'),
(78,'CY','CYP','196','Cyprus',1,1,1,0,357,NULL),
(79,'CZ','CZE','203','Czech Republic',1,1,1,0,420,NULL),
(80,'DK','DNK','208','Denmark',1,1,1,0,45,NULL),
(81,'DJ','DJI','262','Djibouti',0,0,1,0,253,NULL),
(82,'DM','DMA','212','Dominica',0,0,1,0,1767,'1'),
(83,'DO','DOM','214','Dominican Republic',0,0,1,0,1809,'1'),
(84,'EC','ECU','218','Republic of Ecuador',0,0,1,0,593,'0'),
(85,'EG','EGY','818','Egypt',0,0,1,0,20,'0'),
(86,'SV','SLV','222','El Salvador',0,0,1,0,503,NULL),
(87,'GQ','GNQ','226','Equatorial Guinea',0,0,1,0,240,NULL),
(88,'ER','ERI','232','Eritrea',0,0,1,0,291,'0'),
(89,'EE','EST','233','Estonia',1,1,1,0,372,NULL),
(90,'ET','ETH','231','Ethiopia',0,0,1,0,251,'0'),
(91,'FK','FLK','238','Falkland Islands',0,0,1,0,500,NULL),
(92,'FO','FRO','234','Faroe Islands',0,0,1,0,298,NULL),
(93,'FJ','FJI','242','Fidji Islands',0,0,1,0,679,NULL),
(94,'FI','FIN','246','Finland',1,1,1,0,358,'0'),
(95,'GF','GUF','254','French Guiana',0,1,1,0,594,'0'),
(96,'PF','PYF','258','French Polynesia',0,0,1,0,689,NULL),
(97,'TF','ATF','260','French Southern and Antarctic Lands',0,0,1,0,NULL,NULL),
(98,'GM','GMB','270','Gambia',0,0,1,0,220,NULL),
(99,'GE','GEO','268','Georgia',0,0,1,0,995,'0'),
(100,'GH','GHA','288','Ghana',0,0,1,0,233,'0'),
(101,'GI','GIB','292','Gibraltar',0,1,1,0,350,NULL),
(102,'GR','GRC','300','Greece',1,1,1,0,30,'0'),
(103,'GL','GRL','304','Greenland',0,0,1,0,299,NULL),
(104,'GD','GRD','308','Grenade',0,0,1,0,1473,'1'),
(106,'GU','GUM','316','Guam',0,0,1,0,1671,'1'),
(107,'GT','GTM','320','Guatemala',0,0,1,0,502,NULL),
(108,'GN','GIN','324','Guinea',0,0,1,0,224,NULL),
(109,'GW','GNB','624','Guinea-Bissao',0,0,1,0,245,NULL),
(111,'HT','HTI','332','Haiti',0,0,1,0,509,NULL),
(112,'HM','HMD','334','Heard Island and McDonald Islands',0,0,1,0,NULL,NULL),
(113,'VA','VAT','336','Vatican City (Saint-SiÃ¨ge)',0,1,1,0,379,NULL),
(114,'HN','HND','340','Honduras',0,0,1,0,504,NULL),
(115,'HK','HKG','344','Hong Kong',0,0,1,0,852,NULL),
(116,'IS','ISL','352','Iceland',0,1,1,0,354,NULL),
(117,'IN','IND','356','India',0,0,1,0,91,'0'),
(118,'ID','IDN','360','Indonesia',0,0,1,0,62,'0'),
(119,'IR','IRN','364','Iran',0,0,1,0,98,'0'),
(120,'IQ','IRQ','368','Iraq',0,0,1,0,964,'0'),
(121,'IL','ISR','376','Israel',0,0,1,0,972,'0'),
(122,'JM','JAM','388','Jamaica',0,0,1,0,1876,'1'),
(123,'JP','JPN','392','Japan',0,0,1,0,81,'0'),
(124,'JO','JOR','400','Jordan',0,0,1,0,962,'0'),
(125,'KZ','KAZ','398','Kazakhstan',0,0,1,0,7,'8'),
(126,'KE','KEN','404','Kenya',0,0,1,0,254,'0'),
(127,'KI','KIR','296','Kiribati',0,0,1,0,686,NULL),
(128,'KP','PRK','408','North Corea',0,0,1,0,850,'0'),
(129,'KR','KOR','410','South Corea',0,0,1,0,82,'0'),
(130,'KW','KWT','414','KoweÃ¯t',0,0,1,0,965,NULL),
(131,'KG','KGZ','417','Kirghizistan',0,0,1,0,996,'0'),
(132,'LA','LAO','418','Laos',0,0,1,0,856,'0'),
(133,'LV','LVA','428','Latvia',1,1,1,0,371,NULL),
(134,'LB','LBN','422','Lebanon',0,0,1,0,961,'0'),
(135,'LS','LSO','426','Lesotho',0,0,1,0,266,NULL),
(136,'LR','LBR','430','Liberia',0,0,1,0,231,NULL),
(137,'LY','LBY','434','Libya',0,0,1,0,218,'0'),
(138,'LI','LIE','438','Liechtenstein',0,1,1,0,423,NULL),
(139,'LT','LTU','440','Lithuania',1,1,1,0,370,'0'),
(140,'LU','LUX','442','Luxembourg',1,1,1,0,352,NULL),
(141,'MO','MAC','446','Macao',0,0,1,0,853,NULL),
(142,'MK','MKD','807','North Macedonia',0,1,1,0,389,'0'),
(143,'MG','MDG','450','Madagascar',0,0,1,0,261,NULL),
(144,'MW','MWI','454','Malawi',0,0,1,0,265,NULL),
(145,'MY','MYS','458','Malaysia',0,0,1,0,60,'0'),
(146,'MV','MDV','462','Maldives',0,0,1,0,960,NULL),
(147,'ML','MLI','466','Mali',0,0,1,0,223,NULL),
(148,'MT','MLT','470','Malta',1,1,1,0,356,NULL),
(149,'MH','MHL','584','Marshall Islands',0,0,1,0,692,'1'),
(151,'MR','MRT','478','Mauritania',0,0,1,0,222,NULL),
(152,'MU','MUS','480','Mauritius',0,0,1,0,230,NULL),
(153,'YT','MYT','175','Mayotte',0,1,1,0,262,'0'),
(154,'MX','MEX','484','Mexico',0,0,1,0,52,NULL),
(155,'FM','FSM','583','Micronesia',0,0,1,0,691,'1'),
(156,'MD','MDA','498','Moldova',0,1,1,0,373,'0'),
(157,'MN','MNG','496','Mongolia',0,0,1,0,976,'0'),
(158,'MS','MSR','500','Montserrat',0,0,1,0,1664,'1'),
(159,'MZ','MOZ','508','Mozambique',0,0,1,0,258,NULL),
(160,'MM','MMR','104','Myanmar',0,0,1,0,95,'0'),
(161,'NA','NAM','516','Namibia',0,0,1,0,264,'0'),
(162,'NR','NRU','520','Nauru',0,0,1,0,674,NULL),
(163,'NP','NPL','524','NÃ©pal',0,0,1,0,977,'0'),
(165,'NC','NCL','540','New Caledonia',0,0,1,0,687,NULL),
(166,'NZ','NZL','554','New Zealand',0,0,1,0,64,'0'),
(167,'NI','NIC','558','Nicaragua',0,0,1,0,505,NULL),
(168,'NE','NER','562','Niger',0,0,1,0,227,NULL),
(169,'NG','NGA','566','Nigeria',0,0,1,0,234,'0'),
(170,'NU','NIU','570','Niue',0,0,1,0,683,NULL),
(171,'NF','NFK','574','Norfolk Island',0,0,1,0,672,NULL),
(172,'MP','MNP','580','Northern Mariana Islands',0,0,1,0,1670,'1'),
(173,'NO','NOR','578','Norway',0,1,1,0,47,NULL),
(174,'OM','OMN','512','Oman',0,0,1,0,968,NULL),
(175,'PK','PAK','586','Pakistan',0,0,1,0,92,'0'),
(176,'PW','PLW','585','Palau',0,0,1,0,680,NULL),
(177,'PS','PSE','275','Palestine',0,0,1,0,970,'0'),
(178,'PA','PAN','591','Panama',0,0,1,0,507,NULL),
(179,'PG','PNG','598','Papua New Guinea',0,0,1,0,675,NULL),
(180,'PY','PRY','600','Paraguay',0,0,1,0,595,'0'),
(181,'PE','PER','604','Peru',0,0,1,0,51,'0'),
(182,'PH','PHL','608','Philippines',0,0,1,0,63,'0'),
(183,'PN','PCN','612','Pitcairn Islands',0,0,1,0,NULL,NULL),
(184,'PL','POL','616','Poland',1,1,1,0,48,NULL),
(185,'PR','PRI','630','Puerto Rico',0,0,1,0,1787,'1'),
(186,'QA','QAT','634','Qatar',0,0,1,0,974,NULL),
(188,'RO','ROU','642','Romania',1,1,1,0,40,'0'),
(189,'RW','RWA','646','Rwanda',0,0,1,0,250,NULL),
(190,'SH','SHN','654','Saint Helena',0,0,1,0,290,NULL),
(191,'KN','KNA','659','Saint Kitts and Nevis',0,0,1,0,1869,'1'),
(192,'LC','LCA','662','Saint Lucia',0,0,1,0,1758,'1'),
(193,'PM','SPM','666','Saint Pierre and Miquelon',0,1,1,0,508,'0'),
(194,'VC','VCT','670','Saint Vincent and the Grenadines',0,0,1,0,1784,'1'),
(195,'WS','WSM','882','Samoa',0,0,1,0,685,NULL),
(196,'SM','SMR','674','San Marino ',0,1,1,0,378,NULL),
(197,'ST','STP','678','Saint Thomas and Prince',0,0,1,0,239,NULL),
(198,'RS','SRB','688','Serbia',0,1,1,0,381,'0'),
(199,'SC','SYC','690','Seychelles',0,0,1,0,248,NULL),
(200,'SL','SLE','694','Sierra Leone',0,0,1,0,232,'0'),
(201,'SK','SVK','703','Slovakia',1,1,1,0,421,'0'),
(202,'SI','SVN','705','Slovenia',1,1,1,0,386,'0'),
(203,'SB','SLB','090','Solomon Islands',0,0,1,0,677,NULL),
(204,'SO','SOM','706','Somalia',0,0,1,0,252,NULL),
(205,'ZA','ZAF','710','South Africa',0,0,1,0,27,'0'),
(206,'GS','SGS','239','South Georgia and the South Sandwich Islands ',0,0,1,0,NULL,NULL),
(207,'LK','LKA','144','Sri Lanka',0,0,1,0,94,'0'),
(208,'SD','SDN','729','Sudan',0,0,1,0,249,'0'),
(209,'SR','SUR','740','Suriname',0,0,1,0,597,'0'),
(210,'SJ','SJM','744','Svalbard and Jan Mayen',0,0,1,0,47,NULL),
(211,'SZ','SWZ','748','Swaziland / Eswatini',0,0,1,0,268,NULL),
(212,'SY','SYR','760','Syria',0,0,1,0,963,'0'),
(213,'TW','TWN','158','Taiwan',0,0,1,0,886,'0'),
(214,'TJ','TJK','762','Tajikistan',0,0,1,0,992,'8'),
(215,'TZ','TZA','834','Tanzania',0,0,1,0,255,'0'),
(216,'TH','THA','764','Thailand',0,0,1,0,66,'0'),
(217,'TL','TLS','626','Timor-Leste',0,0,1,0,670,NULL),
(218,'TK','TKL','772','Tokelau',0,0,1,0,690,NULL),
(219,'TO','TON','776','Tonga',0,0,1,0,676,NULL),
(220,'TT','TTO','780','Trinidad and Tobago',0,0,1,0,1868,'1'),
(221,'TR','TUR','792','Turkey',0,0,1,0,90,'0'),
(222,'TM','TKM','795','Turkmenistan',0,0,1,0,993,'8'),
(223,'TC','TCA','796','Turks and Caicos Islands',0,0,1,0,1649,'1'),
(224,'TV','TUV','798','Tuvalu',0,0,1,0,688,NULL),
(225,'UG','UGA','800','Uganda',0,0,1,0,256,'0'),
(226,'UA','UKR','804','Ukraine',0,0,1,0,380,'0'),
(227,'AE','ARE','784','United Arab Emirates',0,0,1,0,971,'0'),
(228,'UM','UMI','581','United States Minor Outlying Islands',0,0,1,0,NULL,NULL),
(229,'UY','URY','858','Uruguay',0,0,1,0,598,NULL),
(230,'UZ','UZB','860','Uzbekistan',0,0,1,0,998,'0'),
(231,'VU','VUT','548','Vanuatu',0,0,1,0,678,NULL),
(232,'VE','VEN','862','Venezuela',0,0,1,0,58,'0'),
(233,'VN','VNM','704','Vietnam',0,0,1,0,84,'0'),
(234,'VG','VGB','092','British Virgin Islands',0,0,1,0,1284,'1'),
(235,'VI','VIR','850','Virgin Islands of the United States',0,0,1,0,1340,'1'),
(236,'WF','WLF','876','Wallis and Futuna',0,0,1,0,681,NULL),
(237,'EH','ESH','732','Western Sahara',0,0,1,0,NULL,'0'),
(238,'YE','YEM','887','Yemen',0,0,1,0,967,'0'),
(239,'ZM','ZMB','894','Zambia',0,0,1,0,260,'0'),
(240,'ZW','ZWE','716','Zimbabwe',0,0,1,0,263,'0'),
(241,'GG','GGY','831','Guernsey',0,1,1,0,44,'0'),
(242,'IM','IMN','833','Isle of Man',0,1,1,0,44,'0'),
(243,'JE','JEY','832','Jersey',0,1,1,0,44,'0'),
(244,'ME','MNE','499','Montenegro',0,1,1,0,382,'0'),
(245,'BL','BLM','652','Saint-BarthÃ©lemy',0,1,0,0,590,'0'),
(246,'MF','MAF','663','Saint-Martin',0,1,0,0,590,'0'),
(247,'XK','XKX',NULL,'Kosovo',0,0,1,0,383,'0'),
(248,'BQ','BES','535','Bonaire, Sint Eustatius and Saba',0,0,1,0,NULL,NULL),
(249,'GP','GLP','312','Guadeloupe',0,1,0,0,NULL,NULL),
(250,'GY','GUY','328','Guyana',0,0,0,0,NULL,NULL),
(251,'MQ','MTQ','474','Martinique',0,1,0,0,NULL,NULL),
(252,'RE','REU','638','RÃ©union',0,1,0,0,NULL,NULL),
(253,'SS','SSD','728','South Sudan',0,0,1,0,NULL,NULL),
(300,'CW','CUW','531','CuraÃ§ao',0,0,1,0,599,NULL),
(301,'SX','SXM','534','Sint Maarten',0,0,1,0,1721,'1');
/*!40000 ALTER TABLE `llx_c_country` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_currencies`
--

DROP TABLE IF EXISTS `llx_c_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_currencies` (
  `code_iso` varchar(3) NOT NULL,
  `label` varchar(128) NOT NULL,
  `unicode` varchar(32) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `max_decimal_unit` tinyint(4) DEFAULT NULL,
  `max_decimal_tot` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`code_iso`),
  UNIQUE KEY `uk_c_currencies_code_iso` (`code_iso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_currencies`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_currencies` WRITE;
/*!40000 ALTER TABLE `llx_c_currencies` DISABLE KEYS */;
INSERT INTO `llx_c_currencies` VALUES
('AED','United Arab Emirates Dirham',NULL,1,NULL,NULL),
('AFN','Afghanistan Afghani','[1547]',1,NULL,NULL),
('ALL','Albania Lek','[76,101,107]',1,NULL,NULL),
('ANG','Netherlands Antilles Guilder','[402]',1,NULL,NULL),
('AOA','Angola Kwanza',NULL,1,NULL,NULL),
('ARP','Pesos argentins',NULL,0,NULL,NULL),
('ARS','Argentino Peso','[36]',1,NULL,NULL),
('ATS','Shiliing autrichiens',NULL,0,NULL,NULL),
('AUD','Australia Dollar','[36]',1,NULL,NULL),
('AWG','Aruba Guilder','[402]',1,NULL,NULL),
('AZN','Azerbaijan New Manat','[1084,1072,1085]',1,NULL,NULL),
('BAM','Bosnia and Herzegovina Convertible Marka','[75,77]',1,NULL,NULL),
('BBD','Barbados Dollar','[36]',1,NULL,NULL),
('BDT','Bangladeshi Taka','[2547]',1,NULL,NULL),
('BEF','Francs belges',NULL,0,NULL,NULL),
('BGN','Bulgaria Lev','[1083,1074]',1,NULL,NULL),
('BHD','Bahrain',NULL,1,NULL,NULL),
('BIF','Burundi Franc',NULL,1,NULL,NULL),
('BMD','Bermuda Dollar','[36]',1,NULL,NULL),
('BND','Brunei Darussalam Dollar','[36]',1,NULL,NULL),
('BOB','Bolivia Boliviano','[66,115]',1,NULL,NULL),
('BRL','Brazil Real','[82,36]',1,NULL,NULL),
('BSD','Bahamas Dollar','[36]',1,NULL,NULL),
('BWP','Botswana Pula','[80]',1,NULL,NULL),
('BYR','Belarus Ruble','[112,46]',1,NULL,NULL),
('BZD','Belize Dollar','[66,90,36]',1,NULL,NULL),
('CAD','Canada Dollar','[36]',1,NULL,NULL),
('CDF','Congolese Franc','[70,67]',1,NULL,NULL),
('CHF','Switzerland Franc','[67,72,70]',1,NULL,NULL),
('CLP','Chile Peso','[36]',1,NULL,NULL),
('CNY','China Yuan Renminbi','[165]',1,NULL,NULL),
('COP','Colombia Peso','[36]',1,NULL,NULL),
('CRC','Costa Rica Colon','[8353]',1,NULL,NULL),
('CUP','Cuba Peso','[8369]',1,NULL,NULL),
('CVE','Cap Verde Escudo','[4217]',1,NULL,NULL),
('CZK','Czech Republic Koruna','[75,269]',1,NULL,NULL),
('DEM','Deutsche Mark',NULL,0,NULL,NULL),
('DKK','Denmark Krone','[107,114]',1,NULL,NULL),
('DOP','Dominican Republic Peso','[82,68,36]',1,NULL,NULL),
('DZD','Algeria Dinar',NULL,1,NULL,NULL),
('ECS','Ecuador Sucre','[83,47,46]',1,NULL,NULL),
('EEK','Estonia Kroon','[107,114]',1,NULL,NULL),
('EGP','Egypt Pound','[163]',1,NULL,NULL),
('ESP','Pesete',NULL,0,NULL,NULL),
('ETB','Ethiopian Birr',NULL,1,NULL,NULL),
('EUR','Euro Member Countries','[8364]',1,NULL,NULL),
('FIM','Mark finlandais',NULL,0,NULL,NULL),
('FJD','Fiji Dollar','[36]',1,NULL,NULL),
('FKP','Falkland Islands (Malvinas) Pound','[163]',1,NULL,NULL),
('FRF','Francs francais',NULL,0,NULL,NULL),
('GBP','United Kingdom Pound','[163]',1,NULL,NULL),
('GGP','Guernsey Pound','[163]',1,NULL,NULL),
('GHC','Ghana Cedis','[162]',1,NULL,NULL),
('GIP','Gibraltar Pound','[163]',1,NULL,NULL),
('GNF','Guinea Franc','[70,71]',1,NULL,NULL),
('GRD','Drachme (grece)',NULL,0,NULL,NULL),
('GTQ','Guatemala Quetzal','[81]',1,NULL,NULL),
('GYD','Guyana Dollar','[36]',1,NULL,NULL),
('HKD','Hong Kong Dollar','[36]',1,NULL,NULL),
('HNL','Honduras Lempira','[76]',1,NULL,NULL),
('HRK','Croatia Kuna','[107,110]',1,NULL,NULL),
('HUF','Hungary Forint','[70,116]',1,NULL,NULL),
('IDR','Indonesia Rupiah','[82,112]',1,NULL,NULL),
('IEP','Livres irlandaises',NULL,0,NULL,NULL),
('ILS','Israel Shekel','[8362]',1,NULL,NULL),
('IMP','Isle of Man Pound','[163]',1,NULL,NULL),
('INR','India Rupee','[8377]',1,NULL,NULL),
('IRR','Iran Rial','[65020]',1,NULL,NULL),
('ISK','Iceland Krona','[107,114]',1,NULL,NULL),
('ITL','Lires',NULL,0,NULL,NULL),
('JEP','Jersey Pound','[163]',1,NULL,NULL),
('JMD','Jamaica Dollar','[74,36]',1,NULL,NULL),
('JPY','Japan Yen','[165]',1,NULL,NULL),
('KES','Kenya Shilling',NULL,1,NULL,NULL),
('KGS','Kyrgyzstan Som','[1083,1074]',1,NULL,NULL),
('KHR','Cambodia Riel','[6107]',1,NULL,NULL),
('KPW','Korea (North) Won','[8361]',1,NULL,NULL),
('KRW','Korea (South) Won','[8361]',1,NULL,NULL),
('KYD','Cayman Islands Dollar','[36]',1,NULL,NULL),
('KZT','Kazakhstan Tenge','[1083,1074]',1,NULL,NULL),
('LAK','Laos Kip','[8365]',1,NULL,NULL),
('LBP','Lebanon Pound','[163]',1,NULL,NULL),
('LKR','Sri Lanka Rupee','[8360]',1,NULL,NULL),
('LRD','Liberia Dollar','[36]',1,NULL,NULL),
('LTL','Lithuania Litas','[76,116]',1,NULL,NULL),
('LUF','Francs luxembourgeois',NULL,0,NULL,NULL),
('LVL','Latvia Lat','[76,115]',1,NULL,NULL),
('MAD','Morocco Dirham',NULL,1,NULL,NULL),
('MDL','Moldova Leu',NULL,1,NULL,NULL),
('MGA','Ariary',NULL,1,NULL,NULL),
('MKD','Macedonia Denar','[1076,1077,1085]',1,NULL,NULL),
('MMK','Myanmar Kyat','[75]',1,NULL,NULL),
('MNT','Mongolia Tughrik','[8366]',1,NULL,NULL),
('MRO','Mauritania Ouguiya',NULL,0,NULL,NULL),
('MRU','Mauritania Ouguiya','[77,85]',1,NULL,NULL),
('MUR','Mauritius Rupee','[8360]',1,NULL,NULL),
('MXN','Mexico Peso','[36]',1,NULL,NULL),
('MXP','Pesos Mexicans',NULL,0,NULL,NULL),
('MYR','Malaysia Ringgit','[82,77]',1,NULL,NULL),
('MZN','Mozambique Metical','[77,84]',1,NULL,NULL),
('NAD','Namibia Dollar','[36]',1,NULL,NULL),
('NGN','Nigeria Naira','[8358]',1,NULL,NULL),
('NIO','Nicaragua Cordoba','[67,36]',1,NULL,NULL),
('NLG','Florins',NULL,0,NULL,NULL),
('NOK','Norway Krone','[107,114]',1,NULL,NULL),
('NPR','Nepal Rupee','[8360]',1,NULL,NULL),
('NZD','New Zealand Dollar','[36]',1,NULL,NULL),
('OMR','Oman Rial','[65020]',1,NULL,NULL),
('PAB','Panama Balboa','[66,47,46]',1,NULL,NULL),
('PEN','PerÃº Sol','[83,47]',1,NULL,NULL),
('PGK','Papua New Guinea Kina','[75]',1,NULL,NULL),
('PHP','Philippines Peso','[8369]',1,NULL,NULL),
('PKR','Pakistan Rupee','[8360]',1,NULL,NULL),
('PLN','Poland Zloty','[122,322]',1,NULL,NULL),
('PTE','Escudos',NULL,0,NULL,NULL),
('PYG','Paraguay Guarani','[71,115]',1,NULL,NULL),
('QAR','Qatar Riyal','[65020]',1,NULL,NULL),
('RON','Romania New Leu','[108,101,105]',1,NULL,NULL),
('RSD','Serbia Dinar','[1044,1080,1085,46]',1,NULL,NULL),
('RUB','Russia Ruble','[1088,1091,1073]',1,NULL,NULL),
('SAR','Saudi Arabia Riyal','[65020]',1,NULL,NULL),
('SBD','Solomon Islands Dollar','[36]',1,NULL,NULL),
('SCR','Seychelles Rupee','[8360]',1,NULL,NULL),
('SEK','Sweden Krona','[107,114]',1,NULL,NULL),
('SGD','Singapore Dollar','[36]',1,NULL,NULL),
('SHP','Saint Helena Pound','[163]',1,NULL,NULL),
('SKK','Couronnes slovaques',NULL,0,NULL,NULL),
('SOS','Somalia Shilling','[83]',1,NULL,NULL),
('SRD','Suriname Dollar','[36]',1,NULL,NULL),
('SUR','Rouble',NULL,0,NULL,NULL),
('SVC','El Salvador Colon','[36]',1,NULL,NULL),
('SYP','Syria Pound','[163]',1,NULL,NULL),
('THB','Thailand Baht','[3647]',1,NULL,NULL),
('TND','Tunisia Dinar',NULL,1,NULL,NULL),
('TRL','Turkey Lira','[84,76]',0,NULL,NULL),
('TRY','Turkey Lira','[8378]',1,NULL,NULL),
('TTD','Trinidad and Tobago Dollar','[84,84,36]',1,NULL,NULL),
('TVD','Tuvalu Dollar','[36]',1,NULL,NULL),
('TWD','Taiwan New Dollar','[78,84,36]',1,NULL,NULL),
('UAH','Ukraine Hryvna','[8372]',1,NULL,NULL),
('USD','United States Dollar','[36]',1,NULL,NULL),
('UYU','Uruguay Peso','[36,85]',1,NULL,NULL),
('UZS','Uzbekistan Som','[1083,1074]',1,NULL,NULL),
('VEF','Venezuela Bolivar Fuerte','[66,115]',1,NULL,NULL),
('VND','Viet Nam Dong','[8363]',1,NULL,NULL),
('XAF','Communaute Financiere Africaine (BEAC) CFA Franc',NULL,1,NULL,NULL),
('XCD','East Caribbean Dollar','[36]',1,NULL,NULL),
('XEU','Ecus',NULL,0,NULL,NULL),
('XOF','Communaute Financiere Africaine (BCEAO) Franc',NULL,1,NULL,NULL),
('XPF','Franc CFP','[70]',1,NULL,NULL),
('YER','Yemen Rial','[65020]',1,NULL,NULL),
('ZAR','South Africa Rand','[82]',1,NULL,NULL),
('ZWD','Zimbabwe Dollar','[90,36]',1,NULL,NULL);
/*!40000 ALTER TABLE `llx_c_currencies` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_departements`
--

DROP TABLE IF EXISTS `llx_c_departements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_departements` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code_departement` varchar(6) NOT NULL,
  `fk_region` int(11) DEFAULT NULL,
  `cheflieu` varchar(50) DEFAULT NULL,
  `tncc` int(11) DEFAULT NULL,
  `ncc` varchar(50) DEFAULT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_departements` (`code_departement`,`fk_region`),
  KEY `idx_departements_fk_region` (`fk_region`),
  CONSTRAINT `fk_departements_fk_region` FOREIGN KEY (`fk_region`) REFERENCES `llx_c_regions` (`code_region`)
) ENGINE=InnoDB AUTO_INCREMENT=1039 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_departements`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_departements` WRITE;
/*!40000 ALTER TABLE `llx_c_departements` DISABLE KEYS */;
INSERT INTO `llx_c_departements` VALUES
(1,'0',0,'0',0,'-','-',1),
(2,'01',1301,'',0,'','Adrar',1),
(3,'02',1301,'',0,'','Chlef',1),
(4,'03',1301,'',0,'','Laghouat',1),
(5,'04',1301,'',0,'','Oum El Bouaghi',1),
(6,'05',1301,'',0,'','Batna',1),
(7,'06',1301,'',0,'','BÃ©jaÃ¯a',1),
(8,'07',1301,'',0,'','Biskra',1),
(9,'08',1301,'',0,'','BÃ©char',1),
(10,'09',1301,'',0,'','Blida',1),
(11,'10',1301,'',0,'','Bouira',1),
(12,'11',1301,'',0,'','Tamanrasset',1),
(13,'12',1301,'',0,'','TÃ©bessa',1),
(14,'13',1301,'',0,'','Tlemcen',1),
(15,'14',1301,'',0,'','Tiaret',1),
(16,'15',1301,'',0,'','Tizi Ouzou',1),
(17,'16',1301,'',0,'','Alger',1),
(18,'17',1301,'',0,'','Djelfa',1),
(19,'18',1301,'',0,'','Jijel',1),
(20,'19',1301,'',0,'','SÃ©tif',1),
(21,'20',1301,'',0,'','SaÃ¯da',1),
(22,'21',1301,'',0,'','Skikda',1),
(23,'22',1301,'',0,'','Sidi Bel AbbÃ¨s',1),
(24,'23',1301,'',0,'','Annaba',1),
(25,'24',1301,'',0,'','Guelma',1),
(26,'25',1301,'',0,'','Constantine',1),
(27,'26',1301,'',0,'','MÃ©dÃ©a',1),
(28,'27',1301,'',0,'','Mostaganem',1),
(29,'28',1301,'',0,'','M\'Sila',1),
(30,'29',1301,'',0,'','Mascara',1),
(31,'30',1301,'',0,'','Ouargla',1),
(32,'31',1301,'',0,'','Oran',1),
(33,'32',1301,'',0,'','El Bayadh',1),
(34,'33',1301,'',0,'','Illizi',1),
(35,'34',1301,'',0,'','Bordj Bou Arreridj',1),
(36,'35',1301,'',0,'','BoumerdÃ¨s',1),
(37,'36',1301,'',0,'','El Tarf',1),
(38,'37',1301,'',0,'','Tindouf',1),
(39,'38',1301,'',0,'','Tissemsilt',1),
(40,'39',1301,'',0,'','El Oued',1),
(41,'40',1301,'',0,'','Khenchela',1),
(42,'41',1301,'',0,'','Souk Ahras',1),
(43,'42',1301,'',0,'','Tipaza',1),
(44,'43',1301,'',0,'','Mila',1),
(45,'44',1301,'',0,'','AÃ¯n Defla',1),
(46,'45',1301,'',0,'','NaÃ¢ma',1),
(47,'46',1301,'',0,'','AÃ¯n TÃ©mouchent',1),
(48,'47',1301,'',0,'','GhardaÃ¯a',1),
(49,'48',1301,'',0,'','Relizane',1),
(50,'49',1301,'',0,'','Timimoun',1),
(51,'50',1301,'',0,'','Bordj Badji Mokhtar',1),
(52,'51',1301,'',0,'','Ouled Djellal',1),
(53,'52',1301,'',0,'','BÃ©ni AbbÃ¨s',1),
(54,'53',1301,'',0,'','In Salah',1),
(55,'54',1301,'',0,'','In Guezzam',1),
(56,'55',1301,'',0,'','Touggourt',1),
(57,'56',1301,'',0,'','Djanet',1),
(58,'57',1301,'',0,'','El M\'Ghair',1),
(59,'58',1301,'',0,'','El MÃ©nÃ©a',1),
(60,'AD-002',34000,'AD100',NULL,NULL,'Canillo',1),
(61,'AD-003',34000,'AD200',NULL,NULL,'Encamp',1),
(62,'AD-004',34000,'AD400',NULL,NULL,'La Massana',1),
(63,'AD-005',34000,'AD300',NULL,NULL,'Ordino',1),
(64,'AD-006',34000,'AD600',NULL,NULL,'Sant JuliÃ  de LÃ²ria',1),
(65,'AD-007',34000,'AD500',NULL,NULL,'Andorra la Vella',1),
(66,'AD-008',34000,'AD700',NULL,NULL,'Escaldes-Engordany',1),
(67,'AO-ABO',35001,NULL,NULL,'BENGO','Bengo',1),
(68,'AO-BGU',35001,NULL,NULL,'BENGUELA','Benguela',1),
(69,'AO-BIE',35001,NULL,NULL,'BIÃ‰','BiÃ©',1),
(70,'AO-CAB',35001,NULL,NULL,'CABINDA','Cabinda',1),
(71,'AO-CCU',35001,NULL,NULL,'KUANDO KUBANGO','Kuando Kubango',1),
(72,'AO-CNO',35001,NULL,NULL,'KWANZA NORTE','Kwanza Norte',1),
(73,'AO-CUS',35001,NULL,NULL,'KWANZA SUL','Kwanza Sul',1),
(74,'AO-CNN',35001,NULL,NULL,'CUNENE','Cunene',1),
(75,'AO-HUA',35001,NULL,NULL,'HUAMBO','Huambo',1),
(76,'AO-HUI',35001,NULL,NULL,'HUÃLA','Huila',1),
(77,'AO-LUA',35001,NULL,NULL,'LUANDA','Luanda',1),
(78,'AO-LNO',35001,NULL,NULL,'LUNDA-NORTE','Lunda-Norte',1),
(79,'AO-LSU',35001,NULL,NULL,'LUNDA-SUL','Lunda-Sul',1),
(80,'AO-MAL',35001,NULL,NULL,'MALANGE','Malange',1),
(81,'AO-MOX',35001,NULL,NULL,'MOXICO','Moxico',1),
(82,'AO-NAM',35001,NULL,NULL,'NAMÃBE','NamÃ­be',1),
(83,'AO-UIG',35001,NULL,NULL,'UÃGE','UÃ­ge',1),
(84,'AO-ZAI',35001,NULL,NULL,'ZAÃRE','ZaÃ­re',1),
(85,'2301',2301,'',0,'CATAMARCA','Catamarca',1),
(86,'2302',2301,'',0,'JUJUY','Jujuy',1),
(87,'2303',2301,'',0,'TUCAMAN','TucamÃ¡n',1),
(88,'2304',2301,'',0,'SANTIAGO DEL ESTERO','Santiago del Estero',1),
(89,'2305',2301,'',0,'SALTA','Salta',1),
(90,'2306',2302,'',0,'CHACO','Chaco',1),
(91,'2307',2302,'',0,'CORRIENTES','Corrientes',1),
(92,'2308',2302,'',0,'ENTRE RIOS','Entre RÃ­os',1),
(93,'2309',2302,'',0,'FORMOSA','Formosa',1),
(94,'2310',2302,'',0,'SANTA FE','Santa Fe',1),
(95,'2311',2303,'',0,'LA RIOJA','La Rioja',1),
(96,'2312',2303,'',0,'MENDOZA','Mendoza',1),
(97,'2313',2303,'',0,'SAN JUAN','San Juan',1),
(98,'2314',2303,'',0,'SAN LUIS','San Luis',1),
(99,'2315',2304,'',0,'CORDOBA','CÃ³rdoba',1),
(100,'2316',2304,'',0,'BUENOS AIRES','Buenos Aires',1),
(101,'2317',2304,'',0,'CABA','Caba',1),
(102,'2318',2305,'',0,'LA PAMPA','La Pampa',1),
(103,'2319',2305,'',0,'NEUQUEN','NeuquÃ©n',1),
(104,'2320',2305,'',0,'RIO NEGRO','RÃ­o Negro',1),
(105,'2321',2305,'',0,'CHUBUT','Chubut',1),
(106,'2322',2305,'',0,'SANTA CRUZ','Santa Cruz',1),
(107,'2323',2305,'',0,'TIERRA DEL FUEGO','Tierra del Fuego',1),
(108,'2324',2305,'',0,'ISLAS MALVINAS','Islas Malvinas',1),
(109,'2325',2305,'',0,'ANTARTIDA','AntÃ¡rtida',1),
(110,'2326',2305,'',0,'MISIONES','Misiones',1),
(111,'NSW',2801,'',1,'','New South Wales',1),
(112,'VIC',2801,'',1,'','Victoria',1),
(113,'QLD',2801,'',1,'','Queensland',1),
(114,'SA',2801,'',1,'','South Australia',1),
(115,'ACT',2801,'',1,'','Australia Capital Territory',1),
(116,'TAS',2801,'',1,'','Tasmania',1),
(117,'WA',2801,'',1,'','Western Australia',1),
(118,'NT',2801,'',1,'','Northern Territory',1),
(119,'B',4101,NULL,NULL,'BURGENLAND','Burgenland',1),
(120,'K',4101,NULL,NULL,'KAERNTEN','KÃ¤rnten',1),
(121,'N',4101,NULL,NULL,'NIEDEROESTERREICH','NiederÃ¶sterreich',1),
(122,'O',4101,NULL,NULL,'OBEROESTERREICH','OberÃ¶sterreich',1),
(123,'S',4101,NULL,NULL,'SALZBURG','Salzburg',1),
(124,'ST',4101,NULL,NULL,'STEIERMARK','Steiermark',1),
(125,'T',4101,NULL,NULL,'TIROL','Tirol',1),
(126,'V',4101,NULL,NULL,'VORARLBERG','Vorarlberg',1),
(127,'W',4101,NULL,NULL,'WIEN','Wien',1),
(128,'CC',4601,'Oistins',0,'CC','Christ Church',1),
(129,'SA',4601,'Greenland',0,'SA','Saint Andrew',1),
(130,'SG',4601,'Bulkeley',0,'SG','Saint George',1),
(131,'JA',4601,'Holetown',0,'JA','Saint James',1),
(132,'SJ',4601,'Four Roads',0,'SJ','Saint John',1),
(133,'SB',4601,'Bathsheba',0,'SB','Saint Joseph',1),
(134,'SL',4601,'Crab Hill',0,'SL','Saint Lucy',1),
(135,'SM',4601,'Bridgetown',0,'SM','Saint Michael',1),
(136,'SP',4601,'Speightstown',0,'SP','Saint Peter',1),
(137,'SC',4601,'Crane',0,'SC','Saint Philip',1),
(138,'ST',4601,'Hillaby',0,'ST','Saint Thomas',1),
(139,'01',201,'',1,'ANVERS','Anvers',1),
(140,'02',203,'',3,'BRUXELLES-CAPITALE','Bruxelles-Capitale',1),
(141,'03',202,'',2,'BRABANT-WALLON','Brabant-Wallon',1),
(142,'04',201,'',1,'BRABANT-FLAMAND','Brabant-Flamand',1),
(143,'05',201,'',1,'FLANDRE-OCCIDENTALE','Flandre-Occidentale',1),
(144,'06',201,'',1,'FLANDRE-ORIENTALE','Flandre-Orientale',1),
(145,'07',202,'',2,'HAINAUT','Hainaut',1),
(146,'08',202,'',2,'LIEGE','LiÃ¨ge',1),
(147,'09',202,'',1,'LIMBOURG','Limbourg',1),
(148,'10',202,'',2,'LUXEMBOURG','Luxembourg',1),
(149,'11',202,'',2,'NAMUR','Namur',1),
(150,'AC',5601,'ACRE',0,'AC','Acre',1),
(151,'AL',5601,'ALAGOAS',0,'AL','Alagoas',1),
(152,'AP',5601,'AMAPA',0,'AP','AmapÃ¡',1),
(153,'AM',5601,'AMAZONAS',0,'AM','Amazonas',1),
(154,'BA',5601,'BAHIA',0,'BA','Bahia',1),
(155,'CE',5601,'CEARA',0,'CE','CearÃ¡',1),
(156,'ES',5601,'ESPIRITO SANTO',0,'ES','Espirito Santo',1),
(157,'GO',5601,'GOIAS',0,'GO','GoiÃ¡s',1),
(158,'MA',5601,'MARANHAO',0,'MA','MaranhÃ£o',1),
(159,'MT',5601,'MATO GROSSO',0,'MT','Mato Grosso',1),
(160,'MS',5601,'MATO GROSSO DO SUL',0,'MS','Mato Grosso do Sul',1),
(161,'MG',5601,'MINAS GERAIS',0,'MG','Minas Gerais',1),
(162,'PA',5601,'PARA',0,'PA','ParÃ¡',1),
(163,'PB',5601,'PARAIBA',0,'PB','Paraiba',1),
(164,'PR',5601,'PARANA',0,'PR','ParanÃ¡',1),
(165,'PE',5601,'PERNAMBUCO',0,'PE','Pernambuco',1),
(166,'PI',5601,'PIAUI',0,'PI','PiauÃ­',1),
(167,'RJ',5601,'RIO DE JANEIRO',0,'RJ','Rio de Janeiro',1),
(168,'RN',5601,'RIO GRANDE DO NORTE',0,'RN','Rio Grande do Norte',1),
(169,'RS',5601,'RIO GRANDE DO SUL',0,'RS','Rio Grande do Sul',1),
(170,'RO',5601,'RONDONIA',0,'RO','RondÃ´nia',1),
(171,'RR',5601,'RORAIMA',0,'RR','Roraima',1),
(172,'SC',5601,'SANTA CATARINA',0,'SC','Santa Catarina',1),
(173,'SE',5601,'SERGIPE',0,'SE','Sergipe',1),
(174,'SP',5601,'SAO PAULO',0,'SP','Sao Paulo',1),
(175,'TO',5601,'TOCANTINS',0,'TO','Tocantins',1),
(176,'DF',5601,'DISTRITO FEDERAL',0,'DF','Distrito Federal',1),
(177,'ON',1401,'',1,'','Ontario',1),
(178,'QC',1401,'',1,'','Quebec',1),
(179,'NS',1401,'',1,'','Nova Scotia',1),
(180,'NB',1401,'',1,'','New Brunswick',1),
(181,'MB',1401,'',1,'','Manitoba',1),
(182,'BC',1401,'',1,'','British Columbia',1),
(183,'PE',1401,'',1,'','Prince Edward Island',1),
(184,'SK',1401,'',1,'','Saskatchewan',1),
(185,'AB',1401,'',1,'','Alberta',1),
(186,'NL',1401,'',1,'','Newfoundland and Labrador',1),
(187,'YT',1401,'',1,'','Yukon',1),
(188,'NT',1401,'',1,'','Northwest Territories',1),
(189,'NU',1401,'',1,'','Nunavut',1),
(190,'011',6701,'',0,'011','Iquique',1),
(191,'014',6701,'',0,'014','Tamarugal',1),
(192,'021',6702,'',0,'021','Antofagasa',1),
(193,'022',6702,'',0,'022','El Loa',1),
(194,'023',6702,'',0,'023','Tocopilla',1),
(195,'031',6703,'',0,'031','CopiapÃ³',1),
(196,'032',6703,'',0,'032','ChaÃ±aral',1),
(197,'033',6703,'',0,'033','Huasco',1),
(198,'041',6704,'',0,'041','Elqui',1),
(199,'042',6704,'',0,'042','Choapa',1),
(200,'043',6704,'',0,'043','LimarÃ­',1),
(201,'051',6705,'',0,'051','ValparaÃ­so',1),
(202,'052',6705,'',0,'052','Isla de Pascua',1),
(203,'053',6705,'',0,'053','Los Andes',1),
(204,'054',6705,'',0,'054','Petorca',1),
(205,'055',6705,'',0,'055','Quillota',1),
(206,'056',6705,'',0,'056','San Antonio',1),
(207,'057',6705,'',0,'057','San Felipe de Aconcagua',1),
(208,'058',6705,'',0,'058','Marga Marga',1),
(209,'061',6706,'',0,'061','Cachapoal',1),
(210,'062',6706,'',0,'062','Cardenal Caro',1),
(211,'063',6706,'',0,'063','Colchagua',1),
(212,'071',6707,'',0,'071','Talca',1),
(213,'072',6707,'',0,'072','Cauquenes',1),
(214,'073',6707,'',0,'073','CuricÃ³',1),
(215,'074',6707,'',0,'074','Linares',1),
(216,'081',6708,'',0,'081','ConcepciÃ³n',1),
(217,'082',6708,'',0,'082','Arauco',1),
(218,'083',6708,'',0,'083','BiobÃ­o',1),
(219,'084',6708,'',0,'084','Ã‘uble',1),
(220,'091',6709,'',0,'091','CautÃ­n',1),
(221,'092',6709,'',0,'092','Malleco',1),
(222,'101',6710,'',0,'101','Llanquihue',1),
(223,'102',6710,'',0,'102','ChiloÃ©',1),
(224,'103',6710,'',0,'103','Osorno',1),
(225,'104',6710,'',0,'104','Palena',1),
(226,'111',6711,'',0,'111','Coihaique',1),
(227,'112',6711,'',0,'112','AisÃ©n',1),
(228,'113',6711,'',0,'113','CapitÃ¡n Prat',1),
(229,'114',6711,'',0,'114','General Carrera',1),
(230,'121',6712,'',0,'121','Magallanes',1),
(231,'122',6712,'',0,'122','AntÃ¡rtica Chilena',1),
(232,'123',6712,'',0,'123','Tierra del Fuego',1),
(233,'124',6712,'',0,'124','Ãšltima Esperanza',1),
(234,'131',6713,'',0,'131','Santiago',1),
(235,'132',6713,'',0,'132','Cordillera',1),
(236,'133',6713,'',0,'133','Chacabuco',1),
(237,'134',6713,'',0,'134','Maipo',1),
(238,'135',6713,'',0,'135','Melipilla',1),
(239,'136',6713,'',0,'136','Talagante',1),
(240,'141',6714,'',0,'141','Valdivia',1),
(241,'142',6714,'',0,'142','Ranco',1),
(242,'151',6715,'',0,'151','Arica',1),
(243,'152',6715,'',0,'152','Parinacota',1),
(244,'ANT',7001,'',0,'ANT','Antioquia',1),
(245,'BOL',7001,'',0,'BOL','BolÃ­var',1),
(246,'BOY',7001,'',0,'BOY','BoyacÃ¡',1),
(247,'CAL',7001,'',0,'CAL','Caldas',1),
(248,'CAU',7001,'',0,'CAU','Cauca',1),
(249,'CUN',7001,'',0,'CUN','Cundinamarca',1),
(250,'HUI',7001,'',0,'HUI','Huila',1),
(251,'LAG',7001,'',0,'LAG','La Guajira',1),
(252,'MET',7001,'',0,'MET','Meta',1),
(253,'NAR',7001,'',0,'NAR','NariÃ±o',1),
(254,'NDS',7001,'',0,'NDS','Norte de Santander',1),
(255,'SAN',7001,'',0,'SAN','Santander',1),
(256,'SUC',7001,'',0,'SUC','Sucre',1),
(257,'TOL',7001,'',0,'TOL','Tolima',1),
(258,'VAC',7001,'',0,'VAC','Valle del Cauca',1),
(259,'RIS',7001,'',0,'RIS','Risalda',1),
(260,'ATL',7001,'',0,'ATL','AtlÃ¡ntico',1),
(261,'COR',7001,'',0,'COR','CÃ³rdoba',1),
(262,'SAP',7001,'',0,'SAP','San AndrÃ©s, Providencia y Santa Catalina',1),
(263,'ARA',7001,'',0,'ARA','Arauca',1),
(264,'CAS',7001,'',0,'CAS','Casanare',1),
(265,'AMA',7001,'',0,'AMA','Amazonas',1),
(266,'CAQ',7001,'',0,'CAQ','CaquetÃ¡',1),
(267,'CHO',7001,'',0,'CHO','ChocÃ³',1),
(268,'GUA',7001,'',0,'GUA','GuainÃ­a',1),
(269,'GUV',7001,'',0,'GUV','Guaviare',1),
(270,'PUT',7001,'',0,'PUT','Putumayo',1),
(271,'QUI',7001,'',0,'QUI','QuindÃ­o',1),
(272,'VAU',7001,'',0,'VAU','VaupÃ©s',1),
(273,'BOG',7001,'',0,'BOG','BogotÃ¡',1),
(274,'VID',7001,'',0,'VID','Vichada',1),
(275,'CES',7001,'',0,'CES','Cesar',1),
(276,'MAG',7001,'',0,'MAG','Magdalena',1),
(277,'HR-01',7601,'Bjelovar',0,NULL,'Bjelovarsko-bilogorska Å¾upanija',1),
(278,'HR-02',7601,'Karlovac',0,NULL,'KarlovaÄka Å¾upanija',1),
(279,'HR-03',7601,'Koprivnica',0,NULL,'KoprivniÄko-kriÅ¾evaÄka Å¾upanija',1),
(280,'HR-04',7601,'Krapina',0,NULL,'Krapinsko-zagorska Å¾upanija',1),
(281,'HR-05',7601,'GospiÄ‡',0,NULL,'LiÄko-senjska Å¾upanija',1),
(282,'HR-06',7601,'ÄŒakovec',0,NULL,'MeÄ‘imurska Å¾upanija',1),
(283,'HR-07',7601,'Rijeka',0,NULL,'Primorsko-goranska Å¾upanija',1),
(284,'HR-08',7601,'Sisak',0,NULL,'SisaÄko-moslavaÄka Å¾upanija',1),
(285,'HR-09',7601,'VaraÅ¾din',0,NULL,'VaraÅ¾dinska Å¾upanija',1),
(286,'HR-10',7601,'Zagreb',0,NULL,'ZagrebaÄka Å¾upanija',1),
(287,'HR-11',7601,'Zagreb',0,NULL,'Grad Zagreb',1),
(288,'HR-12',7602,'Zadar',0,NULL,'Zadarska Å¾upanija',1),
(289,'HR-13',7602,'Å ibenik',0,NULL,'Å ibensko-kninska Å¾upanija',1),
(290,'HR-14',7602,'Split',0,NULL,'Splitsko-dalmatinska Å¾upanija',1),
(291,'HR-15',7602,'Dubrovnik',0,NULL,'DubrovaÄko-neretvanska Å¾upanija',1),
(292,'HR-16',7603,'Slavonski Brod',0,NULL,'Brodsko-posavska Å¾upanija',1),
(293,'HR-17',7603,'Osijek',0,NULL,'OsjeÄko-baranjska Å¾upanija',1),
(294,'HR-18',7603,'PoÅ¾ega',0,NULL,'PoÅ¾eÅ¡ko-slavonska Å¾upanija',1),
(295,'HR-19',7603,'Virovitica',0,NULL,'VirovitiÄko-podravska Å¾upanija',1),
(296,'HR-20',7603,'Vukovar',0,NULL,'Vukovarsko-srijemska Å¾upanija',1),
(297,'HR-21',7604,'Pazin',0,NULL,'Istarska Å¾upanija',1),
(298,'971',1,'97105',3,'GUADELOUPE','Guadeloupe',1),
(299,'972',2,'97209',3,'MARTINIQUE','Martinique',1),
(300,'973',3,'97302',3,'GUYANE','Guyane',1),
(301,'974',4,'97411',3,'REUNION','RÃ©union',1),
(302,'976',6,'97601',3,'MAYOTTE','Mayotte',1),
(303,'97133',7,'97133',3,'SAINT BARTHELEMY','Saint Barthelemy',1),
(304,'97150',8,'97150',3,'SAINT MARTIN','Saint Martin',1),
(305,'01',84,'01053',5,'AIN','Ain',1),
(306,'02',32,'02408',5,'AISNE','Aisne',1),
(307,'03',84,'03190',5,'ALLIER','Allier',1),
(308,'04',93,'04070',4,'ALPES-DE-HAUTE-PROVENCE','Alpes-de-Haute-Provence',1),
(309,'05',93,'05061',4,'HAUTES-ALPES','Hautes-Alpes',1),
(310,'06',93,'06088',4,'ALPES-MARITIMES','Alpes-Maritimes',1),
(311,'07',84,'07186',5,'ARDECHE','ArdÃ¨che',1),
(312,'08',44,'08105',4,'ARDENNES','Ardennes',1),
(313,'09',76,'09122',5,'ARIEGE','AriÃ¨ge',1),
(314,'10',44,'10387',5,'AUBE','Aube',1),
(315,'11',76,'11069',5,'AUDE','Aude',1),
(316,'12',76,'12202',5,'AVEYRON','Aveyron',1),
(317,'13',93,'13055',4,'BOUCHES-DU-RHONE','Bouches-du-RhÃ´ne',1),
(318,'14',28,'14118',2,'CALVADOS','Calvados',1),
(319,'15',84,'15014',2,'CANTAL','Cantal',1),
(320,'16',75,'16015',3,'CHARENTE','Charente',1),
(321,'17',75,'17300',3,'CHARENTE-MARITIME','Charente-Maritime',1),
(322,'18',24,'18033',2,'CHER','Cher',1),
(323,'19',75,'19272',3,'CORREZE','CorrÃ¨ze',1),
(324,'2A',94,'2A004',3,'CORSE-DU-SUD','Corse-du-Sud',1),
(325,'2B',94,'2B033',3,'HAUTE-CORSE','Haute-Corse',1),
(326,'21',27,'21231',3,'COTE-D OR','CÃ´te-d Or',1),
(327,'22',53,'22278',4,'COTES-D ARMOR','CÃ´tes-d Armor',1),
(328,'23',75,'23096',3,'CREUSE','Creuse',1),
(329,'24',75,'24322',3,'DORDOGNE','Dordogne',1),
(330,'25',27,'25056',2,'DOUBS','Doubs',1),
(331,'26',84,'26362',3,'DROME','DrÃ´me',1),
(332,'27',28,'27229',5,'EURE','Eure',1),
(333,'28',24,'28085',1,'EURE-ET-LOIR','Eure-et-Loir',1),
(334,'29',53,'29232',2,'FINISTERE','FinistÃ¨re',1),
(335,'30',76,'30189',2,'GARD','Gard',1),
(336,'31',76,'31555',3,'HAUTE-GARONNE','Haute-Garonne',1),
(337,'32',76,'32013',2,'GERS','Gers',1),
(338,'33',75,'33063',3,'GIRONDE','Gironde',1),
(339,'34',76,'34172',5,'HERAULT','HÃ©rault',1),
(340,'35',53,'35238',1,'ILLE-ET-VILAINE','Ille-et-Vilaine',1),
(341,'36',24,'36044',5,'INDRE','Indre',1),
(342,'37',24,'37261',1,'INDRE-ET-LOIRE','Indre-et-Loire',1),
(343,'38',84,'38185',5,'ISERE','IsÃ¨re',1),
(344,'39',27,'39300',2,'JURA','Jura',1),
(345,'40',75,'40192',4,'LANDES','Landes',1),
(346,'41',24,'41018',0,'LOIR-ET-CHER','Loir-et-Cher',1),
(347,'42',84,'42218',3,'LOIRE','Loire',1),
(348,'43',84,'43157',3,'HAUTE-LOIRE','Haute-Loire',1),
(349,'44',52,'44109',3,'LOIRE-ATLANTIQUE','Loire-Atlantique',1),
(350,'45',24,'45234',2,'LOIRET','Loiret',1),
(351,'46',76,'46042',2,'LOT','Lot',1),
(352,'47',75,'47001',0,'LOT-ET-GARONNE','Lot-et-Garonne',1),
(353,'48',76,'48095',3,'LOZERE','LozÃ¨re',1),
(354,'49',52,'49007',0,'MAINE-ET-LOIRE','Maine-et-Loire',1),
(355,'50',28,'50502',3,'MANCHE','Manche',1),
(356,'51',44,'51108',3,'MARNE','Marne',1),
(357,'52',44,'52121',3,'HAUTE-MARNE','Haute-Marne',1),
(358,'53',52,'53130',3,'MAYENNE','Mayenne',1),
(359,'54',44,'54395',0,'MEURTHE-ET-MOSELLE','Meurthe-et-Moselle',1),
(360,'55',44,'55029',3,'MEUSE','Meuse',1),
(361,'56',53,'56260',2,'MORBIHAN','Morbihan',1),
(362,'57',44,'57463',3,'MOSELLE','Moselle',1),
(363,'58',27,'58194',3,'NIEVRE','NiÃ¨vre',1),
(364,'59',32,'59350',2,'NORD','Nord',1),
(365,'60',32,'60057',5,'OISE','Oise',1),
(366,'61',28,'61001',5,'ORNE','Orne',1),
(367,'62',32,'62041',2,'PAS-DE-CALAIS','Pas-de-Calais',1),
(368,'63',84,'63113',2,'PUY-DE-DOME','Puy-de-DÃ´me',1),
(369,'64',75,'64445',4,'PYRENEES-ATLANTIQUES','PyrÃ©nÃ©es-Atlantiques',1),
(370,'65',76,'65440',4,'HAUTES-PYRENEES','Hautes-PyrÃ©nÃ©es',1),
(371,'66',76,'66136',4,'PYRENEES-ORIENTALES','PyrÃ©nÃ©es-Orientales',1),
(372,'67',44,'67482',2,'BAS-RHIN','Bas-Rhin',1),
(373,'68',44,'68066',2,'HAUT-RHIN','Haut-Rhin',1),
(374,'69',84,'69123',2,'RHONE','RhÃ´ne',1),
(375,'70',27,'70550',3,'HAUTE-SAONE','Haute-SaÃ´ne',1),
(376,'71',27,'71270',0,'SAONE-ET-LOIRE','SaÃ´ne-et-Loire',1),
(377,'72',52,'72181',3,'SARTHE','Sarthe',1),
(378,'73',84,'73065',3,'SAVOIE','Savoie',1),
(379,'74',84,'74010',3,'HAUTE-SAVOIE','Haute-Savoie',1),
(380,'75',11,'75056',0,'PARIS','Paris',1),
(381,'76',28,'76540',3,'SEINE-MARITIME','Seine-Maritime',1),
(382,'77',11,'77288',0,'SEINE-ET-MARNE','Seine-et-Marne',1),
(383,'78',11,'78646',4,'YVELINES','Yvelines',1),
(384,'79',75,'79191',4,'DEUX-SEVRES','Deux-SÃ¨vres',1),
(385,'80',32,'80021',3,'SOMME','Somme',1),
(386,'81',76,'81004',2,'TARN','Tarn',1),
(387,'82',76,'82121',0,'TARN-ET-GARONNE','Tarn-et-Garonne',1),
(388,'83',93,'83137',2,'VAR','Var',1),
(389,'84',93,'84007',0,'VAUCLUSE','Vaucluse',1),
(390,'85',52,'85191',3,'VENDEE','VendÃ©e',1),
(391,'86',75,'86194',3,'VIENNE','Vienne',1),
(392,'87',75,'87085',3,'HAUTE-VIENNE','Haute-Vienne',1),
(393,'88',44,'88160',4,'VOSGES','Vosges',1),
(394,'89',27,'89024',5,'YONNE','Yonne',1),
(395,'90',27,'90010',0,'TERRITOIRE DE BELFORT','Territoire de Belfort',1),
(396,'91',11,'91228',5,'ESSONNE','Essonne',1),
(397,'92',11,'92050',4,'HAUTS-DE-SEINE','Hauts-de-Seine',1),
(398,'93',11,'93008',3,'SEINE-SAINT-DENIS','Seine-Saint-Denis',1),
(399,'94',11,'94028',2,'VAL-DE-MARNE','Val-de-Marne',1),
(400,'95',11,'95500',2,'VAL-D OISE','Val-d Oise',1),
(401,'BW',501,NULL,NULL,'BADEN-WÃœRTTEMBERG','Baden-WÃ¼rttemberg',1),
(402,'BY',501,NULL,NULL,'BAYERN','Bayern',1),
(403,'BE',501,NULL,NULL,'BERLIN','Berlin',1),
(404,'BB',501,NULL,NULL,'BRANDENBURG','Brandenburg',1),
(405,'HB',501,NULL,NULL,'BREMEN','Bremen',1),
(406,'HH',501,NULL,NULL,'HAMBURG','Hamburg',1),
(407,'HE',501,NULL,NULL,'HESSEN','Hessen',1),
(408,'MV',501,NULL,NULL,'MECKLENBURG-VORPOMMERN','Mecklenburg-Vorpommern',1),
(409,'NI',501,NULL,NULL,'NIEDERSACHSEN','Niedersachsen',1),
(410,'NW',501,NULL,NULL,'NORDRHEIN-WESTFALEN','Nordrhein-Westfalen',1),
(411,'RP',501,NULL,NULL,'RHEINLAND-PFALZ','Rheinland-Pfalz',1),
(412,'SL',501,NULL,NULL,'SAARLAND','Saarland',1),
(413,'SN',501,NULL,NULL,'SACHSEN','Sachsen',1),
(414,'ST',501,NULL,NULL,'SACHSEN-ANHALT','Sachsen-Anhalt',1),
(415,'SH',501,NULL,NULL,'SCHLESWIG-HOLSTEIN','Schleswig-Holstein',1),
(416,'TH',501,NULL,NULL,'THÃœRINGEN','ThÃ¼ringen',1),
(417,'66',10201,'',0,'','Î‘Î¸Î®Î½Î±',1),
(418,'67',10205,'',0,'','Î”ÏÎ¬Î¼Î±',1),
(419,'01',10205,'',0,'','ÎˆÎ²ÏÎ¿Ï‚',1),
(420,'02',10205,'',0,'','Î˜Î¬ÏƒÎ¿Ï‚',1),
(421,'03',10205,'',0,'','ÎšÎ±Î²Î¬Î»Î±',1),
(422,'04',10205,'',0,'','ÎžÎ¬Î½Î¸Î·',1),
(423,'05',10205,'',0,'','Î¡Î¿Î´ÏŒÏ€Î·',1),
(424,'06',10203,'',0,'','Î—Î¼Î±Î¸Î¯Î±',1),
(425,'07',10203,'',0,'','Î˜ÎµÏƒÏƒÎ±Î»Î¿Î½Î¯ÎºÎ·',1),
(426,'08',10203,'',0,'','ÎšÎ¹Î»ÎºÎ¯Ï‚',1),
(427,'09',10203,'',0,'','Î Î­Î»Î»Î±',1),
(428,'10',10203,'',0,'','Î Î¹ÎµÏÎ¯Î±',1),
(429,'11',10203,'',0,'','Î£Î­ÏÏÎµÏ‚',1),
(430,'12',10203,'',0,'','Î§Î±Î»ÎºÎ¹Î´Î¹ÎºÎ®',1),
(431,'13',10206,'',0,'','Î†ÏÏ„Î±',1),
(432,'14',10206,'',0,'','Î˜ÎµÏƒÏ€ÏÏ‰Ï„Î¯Î±',1),
(433,'15',10206,'',0,'','Î™Ï‰Î¬Î½Î½Î¹Î½Î±',1),
(434,'16',10206,'',0,'','Î ÏÎ­Î²ÎµÎ¶Î±',1),
(435,'17',10213,'',0,'','Î“ÏÎµÎ²ÎµÎ½Î¬',1),
(436,'18',10213,'',0,'','ÎšÎ±ÏƒÏ„Î¿ÏÎ¹Î¬',1),
(437,'19',10213,'',0,'','ÎšÎ¿Î¶Î¬Î½Î·',1),
(438,'20',10213,'',0,'','Î¦Î»ÏŽÏÎ¹Î½Î±',1),
(439,'21',10212,'',0,'','ÎšÎ±ÏÎ´Î¯Ï„ÏƒÎ±',1),
(440,'22',10212,'',0,'','Î›Î¬ÏÎ¹ÏƒÎ±',1),
(441,'23',10212,'',0,'','ÎœÎ±Î³Î½Î·ÏƒÎ¯Î±',1),
(442,'24',10212,'',0,'','Î¤ÏÎ¯ÎºÎ±Î»Î±',1),
(443,'25',10212,'',0,'','Î£Ï€Î¿ÏÎ¬Î´ÎµÏ‚',1),
(444,'26',10212,'',0,'','Î’Î¿Î¹Ï‰Ï„Î¯Î±',1),
(445,'27',10202,'',0,'','Î•ÏÎ²Î¿Î¹Î±',1),
(446,'28',10202,'',0,'','Î•Ï…ÏÏ…Ï„Î±Î½Î¯Î±',1),
(447,'29',10202,'',0,'','Î¦Î¸Î¹ÏŽÏ„Î¹Î´Î±',1),
(448,'30',10202,'',0,'','Î¦Ï‰ÎºÎ¯Î´Î±',1),
(449,'31',10209,'',0,'','Î‘ÏÎ³Î¿Î»Î¯Î´Î±',1),
(450,'32',10209,'',0,'','Î‘ÏÎºÎ±Î´Î¯Î±',1),
(451,'33',10209,'',0,'','ÎšÎ¿ÏÎ¹Î½Î¸Î¯Î±',1),
(452,'34',10209,'',0,'','Î›Î±ÎºÏ‰Î½Î¯Î±',1),
(453,'35',10209,'',0,'','ÎœÎµÏƒÏƒÎ·Î½Î¯Î±',1),
(454,'36',10211,'',0,'','Î‘Î¹Ï„Ï‰Î»Î¿Î±ÎºÎ±ÏÎ½Î±Î½Î¯Î±',1),
(455,'37',10211,'',0,'','Î‘Ï‡Î±ÎÎ±',1),
(456,'38',10211,'',0,'','Î—Î»ÎµÎ¯Î±',1),
(457,'39',10207,'',0,'','Î–Î¬ÎºÏ…Î½Î¸Î¿Ï‚',1),
(458,'40',10207,'',0,'','ÎšÎ­ÏÎºÏ…ÏÎ±',1),
(459,'41',10207,'',0,'','ÎšÎµÏ†Î±Î»Î»Î·Î½Î¯Î±',1),
(460,'42',10207,'',0,'','Î™Î¸Î¬ÎºÎ·',1),
(461,'43',10207,'',0,'','Î›ÎµÏ…ÎºÎ¬Î´Î±',1),
(462,'44',10208,'',0,'','Î™ÎºÎ±ÏÎ¯Î±',1),
(463,'45',10208,'',0,'','Î›Î­ÏƒÎ²Î¿Ï‚',1),
(464,'46',10208,'',0,'','Î›Î®Î¼Î½Î¿Ï‚',1),
(465,'47',10208,'',0,'','Î£Î¬Î¼Î¿Ï‚',1),
(466,'48',10208,'',0,'','Î§Î¯Î¿Ï‚',1),
(467,'49',10210,'',0,'','Î†Î½Î´ÏÎ¿Ï‚',1),
(468,'50',10210,'',0,'','Î˜Î®ÏÎ±',1),
(469,'51',10210,'',0,'','ÎšÎ¬Î»Ï…Î¼Î½Î¿Ï‚',1),
(470,'52',10210,'',0,'','ÎšÎ¬ÏÏ€Î±Î¸Î¿Ï‚',1),
(471,'53',10210,'',0,'','ÎšÎ­Î±-ÎšÏÎ¸Î½Î¿Ï‚',1),
(472,'54',10210,'',0,'','ÎšÏ‰',1),
(473,'55',10210,'',0,'','ÎœÎ®Î»Î¿Ï‚',1),
(474,'56',10210,'',0,'','ÎœÏÎºÎ¿Î½Î¿Ï‚',1),
(475,'57',10210,'',0,'','ÎÎ¬Î¾Î¿Ï‚',1),
(476,'58',10210,'',0,'','Î Î¬ÏÎ¿Ï‚',1),
(477,'59',10210,'',0,'','Î¡ÏŒÎ´Î¿Ï‚',1),
(478,'60',10210,'',0,'','Î£ÏÏÎ¿Ï‚',1),
(479,'61',10210,'',0,'','Î¤Î®Î½Î¿Ï‚',1),
(480,'62',10204,'',0,'','Î—ÏÎ¬ÎºÎ»ÎµÎ¹Î¿',1),
(481,'63',10204,'',0,'','Î›Î±ÏƒÎ¯Î¸Î¹',1),
(482,'64',10204,'',0,'','Î¡Î­Î¸Ï…Î¼Î½Î¿',1),
(483,'65',10204,'',0,'','Î§Î±Î½Î¹Î¬',1),
(484,'AT',11401,'',0,'AT','AtlÃ¡ntida',1),
(485,'CH',11401,'',0,'CH','Choluteca',1),
(486,'CL',11401,'',0,'CL','ColÃ³n',1),
(487,'CM',11401,'',0,'CM','Comayagua',1),
(488,'CO',11401,'',0,'CO','CopÃ¡n',1),
(489,'CR',11401,'',0,'CR','CortÃ©s',1),
(490,'EP',11401,'',0,'EP','El ParaÃ­so',1),
(491,'FM',11401,'',0,'FM','Francisco MorazÃ¡n',1),
(492,'GD',11401,'',0,'GD','Gracias a Dios',1),
(493,'IN',11401,'',0,'IN','IntibucÃ¡',1),
(494,'IB',11401,'',0,'IB','Islas de la BahÃ­a',1),
(495,'LP',11401,'',0,'LP','La Paz',1),
(496,'LM',11401,'',0,'LM','Lempira',1),
(497,'OC',11401,'',0,'OC','Ocotepeque',1),
(498,'OL',11401,'',0,'OL','Olancho',1),
(499,'SB',11401,'',0,'SB','Santa BÃ¡rbara',1),
(500,'VL',11401,'',0,'VL','Valle',1),
(501,'YO',11401,'',0,'YO','Yoro',1),
(502,'DC',11401,'',0,'DC','Distrito Central',1),
(503,'HU-BU',180100,'HU101',NULL,NULL,'Budapest',1),
(504,'HU-PE',180100,'HU102',NULL,NULL,'Pest',1),
(505,'HU-FE',182100,'HU211',NULL,NULL,'FejÃ©r',1),
(506,'HU-KE',182100,'HU212',NULL,NULL,'KomÃ¡rom-Esztergom',1),
(507,'HU-VE',182100,'HU213',NULL,NULL,'VeszprÃ©m',1),
(508,'HU-GS',182200,'HU221',NULL,NULL,'GyÅ‘r-Moson-Sopron',1),
(509,'HU-VA',182200,'HU222',NULL,NULL,'Vas',1),
(510,'HU-ZA',182200,'HU223',NULL,NULL,'Zala',1),
(511,'HU-BA',182300,'HU231',NULL,NULL,'Baranya',1),
(512,'HU-SO',182300,'HU232',NULL,NULL,'Somogy',1),
(513,'HU-TO',182300,'HU233',NULL,NULL,'Tolna',1),
(514,'HU-BZ',183100,'HU311',NULL,NULL,'Borsod-AbaÃºj-ZemplÃ©n',1),
(515,'HU-HE',183100,'HU312',NULL,NULL,'Heves',1),
(516,'HU-NO',183100,'HU313',NULL,NULL,'NÃ³grÃ¡d',1),
(517,'HU-HB',183200,'HU321',NULL,NULL,'HajdÃº-Bihar',1),
(518,'HU-JN',183200,'HU322',NULL,NULL,'JÃ¡sz-Nagykun-Szolnok',1),
(519,'HU-SZ',183200,'HU323',NULL,NULL,'Szabolcs-SzatmÃ¡r-Bereg',1),
(520,'HU-BK',183300,'HU331',NULL,NULL,'BÃ¡cs-Kiskun',1),
(521,'HU-BE',183300,'HU332',NULL,NULL,'BÃ©kÃ©s',1),
(522,'HU-CS',183300,'HU333',NULL,NULL,'CsongrÃ¡d',1),
(523,'AG',315,NULL,NULL,NULL,'AGRIGENTO',1),
(524,'AL',312,NULL,NULL,NULL,'ALESSANDRIA',1),
(525,'AN',310,NULL,NULL,NULL,'ANCONA',1),
(526,'AO',319,NULL,NULL,NULL,'AOSTA',1),
(527,'AR',316,NULL,NULL,NULL,'AREZZO',1),
(528,'AP',310,NULL,NULL,NULL,'ASCOLI PICENO',1),
(529,'AT',312,NULL,NULL,NULL,'ASTI',1),
(530,'AV',304,NULL,NULL,NULL,'AVELLINO',1),
(531,'BA',313,NULL,NULL,NULL,'BARI',1),
(532,'BT',313,NULL,NULL,NULL,'BARLETTA-ANDRIA-TRANI',1),
(533,'BL',320,NULL,NULL,NULL,'BELLUNO',1),
(534,'BN',304,NULL,NULL,NULL,'BENEVENTO',1),
(535,'BG',309,NULL,NULL,NULL,'BERGAMO',1),
(536,'BI',312,NULL,NULL,NULL,'BIELLA',1),
(537,'BO',305,NULL,NULL,NULL,'BOLOGNA',1),
(538,'BZ',317,NULL,NULL,NULL,'BOLZANO',1),
(539,'BS',309,NULL,NULL,NULL,'BRESCIA',1),
(540,'BR',313,NULL,NULL,NULL,'BRINDISI',1),
(541,'CA',314,NULL,NULL,NULL,'CAGLIARI',1),
(542,'CL',315,NULL,NULL,NULL,'CALTANISSETTA',1),
(543,'CB',311,NULL,NULL,NULL,'CAMPOBASSO',1),
(544,'CI',314,NULL,NULL,NULL,'CARBONIA-IGLESIAS',1),
(545,'CE',304,NULL,NULL,NULL,'CASERTA',1),
(546,'CT',315,NULL,NULL,NULL,'CATANIA',1),
(547,'CZ',303,NULL,NULL,NULL,'CATANZARO',1),
(548,'CH',301,NULL,NULL,NULL,'CHIETI',1),
(549,'CO',309,NULL,NULL,NULL,'COMO',1),
(550,'CS',303,NULL,NULL,NULL,'COSENZA',1),
(551,'CR',309,NULL,NULL,NULL,'CREMONA',1),
(552,'KR',303,NULL,NULL,NULL,'CROTONE',1),
(553,'CN',312,NULL,NULL,NULL,'CUNEO',1),
(554,'EN',315,NULL,NULL,NULL,'ENNA',1),
(555,'FM',310,NULL,NULL,NULL,'FERMO',1),
(556,'FE',305,NULL,NULL,NULL,'FERRARA',1),
(557,'FI',316,NULL,NULL,NULL,'FIRENZE',1),
(558,'FG',313,NULL,NULL,NULL,'FOGGIA',1),
(559,'FC',305,NULL,NULL,NULL,'FORLI-CESENA',1),
(560,'FR',307,NULL,NULL,NULL,'FROSINONE',1),
(561,'GE',308,NULL,NULL,NULL,'GENOVA',1),
(562,'GO',306,NULL,NULL,NULL,'GORIZIA',1),
(563,'GR',316,NULL,NULL,NULL,'GROSSETO',1),
(564,'IM',308,NULL,NULL,NULL,'IMPERIA',1),
(565,'IS',311,NULL,NULL,NULL,'ISERNIA',1),
(566,'SP',308,NULL,NULL,NULL,'LA SPEZIA',1),
(567,'AQ',301,NULL,NULL,NULL,'L AQUILA',1),
(568,'LT',307,NULL,NULL,NULL,'LATINA',1),
(569,'LE',313,NULL,NULL,NULL,'LECCE',1),
(570,'LC',309,NULL,NULL,NULL,'LECCO',1),
(571,'LI',316,NULL,NULL,NULL,'LIVORNO',1),
(572,'LO',309,NULL,NULL,NULL,'LODI',1),
(573,'LU',316,NULL,NULL,NULL,'LUCCA',1),
(574,'MC',310,NULL,NULL,NULL,'MACERATA',1),
(575,'MN',309,NULL,NULL,NULL,'MANTOVA',1),
(576,'MS',316,NULL,NULL,NULL,'MASSA-CARRARA',1),
(577,'MT',302,NULL,NULL,NULL,'MATERA',1),
(578,'VS',314,NULL,NULL,NULL,'MEDIO CAMPIDANO',1),
(579,'ME',315,NULL,NULL,NULL,'MESSINA',1),
(580,'MI',309,NULL,NULL,NULL,'MILANO',1),
(581,'MB',309,NULL,NULL,NULL,'MONZA e BRIANZA',1),
(582,'MO',305,NULL,NULL,NULL,'MODENA',1),
(583,'NA',304,NULL,NULL,NULL,'NAPOLI',1),
(584,'NO',312,NULL,NULL,NULL,'NOVARA',1),
(585,'NU',314,NULL,NULL,NULL,'NUORO',1),
(586,'OG',314,NULL,NULL,NULL,'OGLIASTRA',1),
(587,'OT',314,NULL,NULL,NULL,'OLBIA-TEMPIO',1),
(588,'OR',314,NULL,NULL,NULL,'ORISTANO',1),
(589,'PD',320,NULL,NULL,NULL,'PADOVA',1),
(590,'PA',315,NULL,NULL,NULL,'PALERMO',1),
(591,'PR',305,NULL,NULL,NULL,'PARMA',1),
(592,'PV',309,NULL,NULL,NULL,'PAVIA',1),
(593,'PG',318,NULL,NULL,NULL,'PERUGIA',1),
(594,'PU',310,NULL,NULL,NULL,'PESARO e URBINO',1),
(595,'PE',301,NULL,NULL,NULL,'PESCARA',1),
(596,'PC',305,NULL,NULL,NULL,'PIACENZA',1),
(597,'PI',316,NULL,NULL,NULL,'PISA',1),
(598,'PT',316,NULL,NULL,NULL,'PISTOIA',1),
(599,'PN',306,NULL,NULL,NULL,'PORDENONE',1),
(600,'PZ',302,NULL,NULL,NULL,'POTENZA',1),
(601,'PO',316,NULL,NULL,NULL,'PRATO',1),
(602,'RG',315,NULL,NULL,NULL,'RAGUSA',1),
(603,'RA',305,NULL,NULL,NULL,'RAVENNA',1),
(604,'RC',303,NULL,NULL,NULL,'REGGIO CALABRIA',1),
(605,'RE',305,NULL,NULL,NULL,'REGGIO NELL EMILIA',1),
(606,'RI',307,NULL,NULL,NULL,'RIETI',1),
(607,'RN',305,NULL,NULL,NULL,'RIMINI',1),
(608,'RM',307,NULL,NULL,NULL,'ROMA',1),
(609,'RO',320,NULL,NULL,NULL,'ROVIGO',1),
(610,'SA',304,NULL,NULL,NULL,'SALERNO',1),
(611,'SS',314,NULL,NULL,NULL,'SASSARI',1),
(612,'SV',308,NULL,NULL,NULL,'SAVONA',1),
(613,'SI',316,NULL,NULL,NULL,'SIENA',1),
(614,'SR',315,NULL,NULL,NULL,'SIRACUSA',1),
(615,'SO',309,NULL,NULL,NULL,'SONDRIO',1),
(616,'TA',313,NULL,NULL,NULL,'TARANTO',1),
(617,'TE',301,NULL,NULL,NULL,'TERAMO',1),
(618,'TR',318,NULL,NULL,NULL,'TERNI',1),
(619,'TO',312,NULL,NULL,NULL,'TORINO',1),
(620,'TP',315,NULL,NULL,NULL,'TRAPANI',1),
(621,'TN',317,NULL,NULL,NULL,'TRENTO',1),
(622,'TV',320,NULL,NULL,NULL,'TREVISO',1),
(623,'TS',306,NULL,NULL,NULL,'TRIESTE',1),
(624,'UD',306,NULL,NULL,NULL,'UDINE',1),
(625,'VA',309,NULL,NULL,NULL,'VARESE',1),
(626,'VE',320,NULL,NULL,NULL,'VENEZIA',1),
(627,'VB',312,NULL,NULL,NULL,'VERBANO-CUSIO-OSSOLA',1),
(628,'VC',312,NULL,NULL,NULL,'VERCELLI',1),
(629,'VR',320,NULL,NULL,NULL,'VERONA',1),
(630,'VV',303,NULL,NULL,NULL,'VIBO VALENTIA',1),
(631,'VI',320,NULL,NULL,NULL,'VICENZA',1),
(632,'VT',307,NULL,NULL,NULL,'VITERBO',1),
(633,'01',12301,'',0,'åŒ—æµ·','åŒ—æµ·é“',1),
(634,'02',12301,'',0,'é’æ£®','é’æ£®çœŒ',1),
(635,'03',12301,'',0,'å²©æ‰‹','å²©æ‰‹çœŒ',1),
(636,'04',12301,'',0,'å®®åŸŽ','å®®åŸŽçœŒ',1),
(637,'05',12301,'',0,'ç§‹ç”°','ç§‹ç”°çœŒ',1),
(638,'06',12301,'',0,'å±±å½¢','å±±å½¢çœŒ',1),
(639,'07',12301,'',0,'ç¦å³¶','ç¦å³¶çœŒ',1),
(640,'08',12301,'',0,'èŒ¨åŸŽ','èŒ¨åŸŽçœŒ',1),
(641,'09',12301,'',0,'æ ƒæœ¨','æ ƒæœ¨çœŒ',1),
(642,'10',12301,'',0,'ç¾¤é¦¬','ç¾¤é¦¬çœŒ',1),
(643,'11',12301,'',0,'åŸ¼çŽ‰','åŸ¼çŽ‰çœŒ',1),
(644,'12',12301,'',0,'åƒè‘‰','åƒè‘‰çœŒ',1),
(645,'13',12301,'',0,'æ±äº¬','æ±äº¬éƒ½',1),
(646,'14',12301,'',0,'ç¥žå¥ˆå·','ç¥žå¥ˆå·çœŒ',1),
(647,'15',12301,'',0,'æ–°æ½Ÿ','æ–°æ½ŸçœŒ',1),
(648,'16',12301,'',0,'å¯Œå±±','å¯Œå±±çœŒ',1),
(649,'17',12301,'',0,'çŸ³å·','çŸ³å·çœŒ',1),
(650,'18',12301,'',0,'ç¦äº•','ç¦äº•çœŒ',1),
(651,'19',12301,'',0,'å±±æ¢¨','å±±æ¢¨çœŒ',1),
(652,'20',12301,'',0,'é•·é‡Ž','é•·é‡ŽçœŒ',1),
(653,'21',12301,'',0,'å²é˜œ','å²é˜œçœŒ',1),
(654,'22',12301,'',0,'é™å²¡','é™å²¡çœŒ',1),
(655,'23',12301,'',0,'æ„›çŸ¥','æ„›çŸ¥çœŒ',1),
(656,'24',12301,'',0,'ä¸‰é‡','ä¸‰é‡çœŒ',1),
(657,'25',12301,'',0,'æ»‹è³€','æ»‹è³€çœŒ',1),
(658,'26',12301,'',0,'äº¬éƒ½','äº¬éƒ½åºœ',1),
(659,'27',12301,'',0,'å¤§é˜ª','å¤§é˜ªåºœ',1),
(660,'28',12301,'',0,'å…µåº«','å…µåº«çœŒ',1),
(661,'29',12301,'',0,'å¥ˆè‰¯','å¥ˆè‰¯çœŒ',1),
(662,'30',12301,'',0,'å’Œæ­Œå±±','å’Œæ­Œå±±çœŒ',1),
(663,'31',12301,'',0,'é³¥å–','é³¥å–çœŒ',1),
(664,'32',12301,'',0,'å³¶æ ¹','å³¶æ ¹çœŒ',1),
(665,'33',12301,'',0,'å²¡å±±','å²¡å±±çœŒ',1),
(666,'34',12301,'',0,'åºƒå³¶','åºƒå³¶çœŒ',1),
(667,'35',12301,'',0,'å±±å£','å±±å£çœŒ',1),
(668,'36',12301,'',0,'å¾³å³¶','å¾³å³¶çœŒ',1),
(669,'37',12301,'',0,'é¦™å·','é¦™å·çœŒ',1),
(670,'38',12301,'',0,'æ„›åª›','æ„›åª›çœŒ',1),
(671,'39',12301,'',0,'é«˜çŸ¥','é«˜çŸ¥çœŒ',1),
(672,'40',12301,'',0,'ç¦å²¡','ç¦å²¡çœŒ',1),
(673,'41',12301,'',0,'ä½è³€','ä½è³€çœŒ',1),
(674,'42',12301,'',0,'é•·å´Ž','é•·å´ŽçœŒ',1),
(675,'43',12301,'',0,'ç†Šæœ¬','ç†Šæœ¬çœŒ',1),
(676,'44',12301,'',0,'å¤§åˆ†','å¤§åˆ†çœŒ',1),
(677,'45',12301,'',0,'å®®å´Ž','å®®å´ŽçœŒ',1),
(678,'46',12301,'',0,'é¹¿å…å³¶','é¹¿å…å³¶çœŒ',1),
(679,'47',12301,'',0,'æ²–ç¸„','æ²–ç¸„çœŒ',1),
(680,'LU0001',14001,'',0,'','Clervaux',1),
(681,'LU0002',14001,'',0,'','Diekirch',1),
(682,'LU0003',14001,'',0,'','Redange',1),
(683,'LU0004',14001,'',0,'','Vianden',1),
(684,'LU0005',14001,'',0,'','Wiltz',1),
(685,'LU0006',14002,'',0,'','Echternach',1),
(686,'LU0007',14002,'',0,'','Grevenmacher',1),
(687,'LU0008',14002,'',0,'','Remich',1),
(688,'LU0009',14003,'',0,'','Capellen',1),
(689,'LU0010',14003,'',0,'','Esch-sur-Alzette',1),
(690,'LU0011',14003,'',0,'','Luxembourg',1),
(691,'LU0012',14003,'',0,'','Mersch',1),
(692,'MA',1209,'',0,'','Province de Benslimane',1),
(693,'MA1',1209,'',0,'','Province de Berrechid',1),
(694,'MA2',1209,'',0,'','Province de Khouribga',1),
(695,'MA3',1209,'',0,'','Province de Settat',1),
(696,'MA4',1210,'',0,'','Province d\'El Jadida',1),
(697,'MA5',1210,'',0,'','Province de Safi',1),
(698,'MA6',1210,'',0,'','Province de Sidi Bennour',1),
(699,'MA7',1210,'',0,'','Province de Youssoufia',1),
(700,'MA6B',1205,'',0,'','PrÃ©fecture de FÃ¨s',1),
(701,'MA7B',1205,'',0,'','Province de Boulemane',1),
(702,'MA8',1205,'',0,'','Province de Moulay Yacoub',1),
(703,'MA9',1205,'',0,'','Province de Sefrou',1),
(704,'MA8A',1202,'',0,'','Province de KÃ©nitra',1),
(705,'MA9A',1202,'',0,'','Province de Sidi Kacem',1),
(706,'MA10',1202,'',0,'','Province de Sidi Slimane',1),
(707,'MA11',1208,'',0,'','PrÃ©fecture de Casablanca',1),
(708,'MA12',1208,'',0,'','PrÃ©fecture de MohammÃ©dia',1),
(709,'MA13',1208,'',0,'','Province de MÃ©diouna',1),
(710,'MA14',1208,'',0,'','Province de Nouaceur',1),
(711,'MA15',1214,'',0,'','Province d\'Assa-Zag',1),
(712,'MA16',1214,'',0,'','Province d\'Es-Semara',1),
(713,'MA17A',1214,'',0,'','Province de Guelmim',1),
(714,'MA18',1214,'',0,'','Province de Tata',1),
(715,'MA19',1214,'',0,'','Province de Tan-Tan',1),
(716,'MA15',1215,'',0,'','Province de Boujdour',1),
(717,'MA16',1215,'',0,'','Province de LÃ¢ayoune',1),
(718,'MA17',1215,'',0,'','Province de Tarfaya',1),
(719,'MA18',1211,'',0,'','PrÃ©fecture de Marrakech',1),
(720,'MA19',1211,'',0,'','Province d\'Al Haouz',1),
(721,'MA20',1211,'',0,'','Province de Chichaoua',1),
(722,'MA21',1211,'',0,'','Province d\'El KelÃ¢a des Sraghna',1),
(723,'MA22',1211,'',0,'','Province d\'Essaouira',1),
(724,'MA23',1211,'',0,'','Province de Rehamna',1),
(725,'MA24',1206,'',0,'','PrÃ©fecture de MeknÃ¨s',1),
(726,'MA25',1206,'',0,'','Province dâ€™El Hajeb',1),
(727,'MA26',1206,'',0,'','Province d\'Errachidia',1),
(728,'MA27',1206,'',0,'','Province dâ€™Ifrane',1),
(729,'MA28',1206,'',0,'','Province de KhÃ©nifra',1),
(730,'MA29',1206,'',0,'','Province de Midelt',1),
(731,'MA30',1204,'',0,'','PrÃ©fecture d\'Oujda-Angad',1),
(732,'MA31',1204,'',0,'','Province de Berkane',1),
(733,'MA32',1204,'',0,'','Province de Driouch',1),
(734,'MA33',1204,'',0,'','Province de Figuig',1),
(735,'MA34',1204,'',0,'','Province de Jerada',1),
(736,'MA35',1204,'',0,'','Province de Nador',1),
(737,'MA36',1204,'',0,'','Province de Taourirt',1),
(738,'MA37',1216,'',0,'','Province d\'Aousserd',1),
(739,'MA38',1216,'',0,'','Province d\'Oued Ed-Dahab',1),
(740,'MA39',1207,'',0,'','PrÃ©fecture de Rabat',1),
(741,'MA40',1207,'',0,'','PrÃ©fecture de Skhirat-TÃ©mara',1),
(742,'MA41',1207,'',0,'','PrÃ©fecture de SalÃ©',1),
(743,'MA42',1207,'',0,'','Province de KhÃ©misset',1),
(744,'MA43',1213,'',0,'','PrÃ©fecture d\'Agadir Ida-Outanane',1),
(745,'MA44',1213,'',0,'','PrÃ©fecture d\'Inezgane-AÃ¯t Melloul',1),
(746,'MA45',1213,'',0,'','Province de Chtouka-AÃ¯t Baha',1),
(747,'MA46',1213,'',0,'','Province d\'Ouarzazate',1),
(748,'MA47',1213,'',0,'','Province de Sidi Ifni',1),
(749,'MA48',1213,'',0,'','Province de Taroudant',1),
(750,'MA49',1213,'',0,'','Province de Tinghir',1),
(751,'MA50',1213,'',0,'','Province de Tiznit',1),
(752,'MA51',1213,'',0,'','Province de Zagora',1),
(753,'MA52',1212,'',0,'','Province d\'Azilal',1),
(754,'MA53',1212,'',0,'','Province de Beni Mellal',1),
(755,'MA54',1212,'',0,'','Province de Fquih Ben Salah',1),
(756,'MA55',1201,'',0,'','PrÃ©fecture de M\'diq-Fnideq',1),
(757,'MA56',1201,'',0,'','PrÃ©fecture de Tanger-Asilah',1),
(758,'MA57',1201,'',0,'','Province de Chefchaouen',1),
(759,'MA58',1201,'',0,'','Province de Fahs-Anjra',1),
(760,'MA59',1201,'',0,'','Province de Larache',1),
(761,'MA60',1201,'',0,'','Province d\'Ouezzane',1),
(762,'MA61',1201,'',0,'','Province de TÃ©touan',1),
(763,'MA62',1203,'',0,'','Province de Guercif',1),
(764,'MA63',1203,'',0,'','Province d\'Al HoceÃ¯ma',1),
(765,'MA64',1203,'',0,'','Province de Taounate',1),
(766,'MA65',1203,'',0,'','Province de Taza',1),
(767,'MA6A',1205,'',0,'','PrÃ©fecture de FÃ¨s',1),
(768,'MA7A',1205,'',0,'','Province de Boulemane',1),
(769,'MA15A',1214,'',0,'','Province d\'Assa-Zag',1),
(770,'MA16A',1214,'',0,'','Province d\'Es-Semara',1),
(771,'MA18A',1211,'',0,'','PrÃ©fecture de Marrakech',1),
(772,'MA19A',1214,'',0,'','Province de Tan-Tan',1),
(773,'MA19B',1214,'',0,'','Province de Tan-Tan',1),
(774,'GR',1701,NULL,NULL,NULL,'Groningen',1),
(775,'FR',1701,NULL,NULL,NULL,'Friesland',1),
(776,'DR',1701,NULL,NULL,NULL,'Drenthe',1),
(777,'OV',1701,NULL,NULL,NULL,'Overijssel',1),
(778,'GD',1701,NULL,NULL,NULL,'Gelderland',1),
(779,'FL',1701,NULL,NULL,NULL,'Flevoland',1),
(780,'UT',1701,NULL,NULL,NULL,'Utrecht',1),
(781,'NH',1701,NULL,NULL,NULL,'Noord-Holland',1),
(782,'ZH',1701,NULL,NULL,NULL,'Zuid-Holland',1),
(783,'ZL',1701,NULL,NULL,NULL,'Zeeland',1),
(784,'NB',1701,NULL,NULL,NULL,'Noord-Brabant',1),
(785,'LB',1701,NULL,NULL,NULL,'Limburg',1),
(786,'PA-1',17801,'',0,'','Bocas del Toro',1),
(787,'PA-2',17801,'',0,'','CoclÃ©',1),
(788,'PA-3',17801,'',0,'','ColÃ³n',1),
(789,'PA-4',17801,'',0,'','ChiriquÃ­',1),
(790,'PA-5',17801,'',0,'','DariÃ©n',1),
(791,'PA-6',17801,'',0,'','Herrera',1),
(792,'PA-7',17801,'',0,'','Los Santos',1),
(793,'PA-8',17801,'',0,'','PanamÃ¡',1),
(794,'PA-9',17801,'',0,'','Veraguas',1),
(795,'PA-13',17801,'',0,'','PanamÃ¡ Oeste',1),
(796,'0101',18101,'',0,'','Chachapoyas',1),
(797,'0102',18101,'',0,'','Bagua',1),
(798,'0103',18101,'',0,'','BongarÃ¡',1),
(799,'0104',18101,'',0,'','Condorcanqui',1),
(800,'0105',18101,'',0,'','Luya',1),
(801,'0106',18101,'',0,'','RodrÃ­guez de Mendoza',1),
(802,'0107',18101,'',0,'','Utcubamba',1),
(803,'0201',18102,'',0,'','Huaraz',1),
(804,'0202',18102,'',0,'','Aija',1),
(805,'0203',18102,'',0,'','Antonio Raymondi',1),
(806,'0204',18102,'',0,'','AsunciÃ³n',1),
(807,'0205',18102,'',0,'','Bolognesi',1),
(808,'0206',18102,'',0,'','Carhuaz',1),
(809,'0207',18102,'',0,'','Carlos FermÃ­n Fitzcarrald',1),
(810,'0208',18102,'',0,'','Casma',1),
(811,'0209',18102,'',0,'','Corongo',1),
(812,'0210',18102,'',0,'','Huari',1),
(813,'0211',18102,'',0,'','Huarmey',1),
(814,'0212',18102,'',0,'','Huaylas',1),
(815,'0213',18102,'',0,'','Mariscal Luzuriaga',1),
(816,'0214',18102,'',0,'','Ocros',1),
(817,'0215',18102,'',0,'','Pallasca',1),
(818,'0216',18102,'',0,'','Pomabamba',1),
(819,'0217',18102,'',0,'','Recuay',1),
(820,'0218',18102,'',0,'','PapÃ¡',1),
(821,'0219',18102,'',0,'','Sihuas',1),
(822,'0220',18102,'',0,'','Yungay',1),
(823,'0301',18103,'',0,'','Abancay',1),
(824,'0302',18103,'',0,'','Andahuaylas',1),
(825,'0303',18103,'',0,'','Antabamba',1),
(826,'0304',18103,'',0,'','Aymaraes',1),
(827,'0305',18103,'',0,'','Cotabambas',1),
(828,'0306',18103,'',0,'','Chincheros',1),
(829,'0307',18103,'',0,'','Grau',1),
(830,'0401',18104,'',0,'','Arequipa',1),
(831,'0402',18104,'',0,'','CamanÃ¡',1),
(832,'0403',18104,'',0,'','CaravelÃ­',1),
(833,'0404',18104,'',0,'','Castilla',1),
(834,'0405',18104,'',0,'','Caylloma',1),
(835,'0406',18104,'',0,'','Condesuyos',1),
(836,'0407',18104,'',0,'','Islay',1),
(837,'0408',18104,'',0,'','La UniÃ³n',1),
(838,'0501',18105,'',0,'','Huamanga',1),
(839,'0502',18105,'',0,'','Cangallo',1),
(840,'0503',18105,'',0,'','Huanca Sancos',1),
(841,'0504',18105,'',0,'','Huanta',1),
(842,'0505',18105,'',0,'','La Mar',1),
(843,'0506',18105,'',0,'','Lucanas',1),
(844,'0507',18105,'',0,'','Parinacochas',1),
(845,'0508',18105,'',0,'','PÃ¡ucar del Sara Sara',1),
(846,'0509',18105,'',0,'','Sucre',1),
(847,'0510',18105,'',0,'','VÃ­ctor Fajardo',1),
(848,'0511',18105,'',0,'','Vilcas HuamÃ¡n',1),
(849,'0601',18106,'',0,'','Cajamarca',1),
(850,'0602',18106,'',0,'','Cajabamba',1),
(851,'0603',18106,'',0,'','CelendÃ­n',1),
(852,'0604',18106,'',0,'','Chota',1),
(853,'0605',18106,'',0,'','ContumazÃ¡',1),
(854,'0606',18106,'',0,'','Cutervo',1),
(855,'0607',18106,'',0,'','Hualgayoc',1),
(856,'0608',18106,'',0,'','JaÃ©n',1),
(857,'0609',18106,'',0,'','San Ignacio',1),
(858,'0610',18106,'',0,'','San Marcos',1),
(859,'0611',18106,'',0,'','San Miguel',1),
(860,'0612',18106,'',0,'','San Pablo',1),
(861,'0613',18106,'',0,'','Santa Cruz',1),
(862,'0701',18107,'',0,'','Callao',1),
(863,'0801',18108,'',0,'','Cusco',1),
(864,'0802',18108,'',0,'','Acomayo',1),
(865,'0803',18108,'',0,'','Anta',1),
(866,'0804',18108,'',0,'','Calca',1),
(867,'0805',18108,'',0,'','Canas',1),
(868,'0806',18108,'',0,'','Canchis',1),
(869,'0807',18108,'',0,'','Chumbivilcas',1),
(870,'0808',18108,'',0,'','Espinar',1),
(871,'0809',18108,'',0,'','La ConvenciÃ³n',1),
(872,'0810',18108,'',0,'','Paruro',1),
(873,'0811',18108,'',0,'','Paucartambo',1),
(874,'0812',18108,'',0,'','Quispicanchi',1),
(875,'0813',18108,'',0,'','Urubamba',1),
(876,'0901',18109,'',0,'','Huancavelica',1),
(877,'0902',18109,'',0,'','Acobamba',1),
(878,'0903',18109,'',0,'','Angaraes',1),
(879,'0904',18109,'',0,'','Castrovirreyna',1),
(880,'0905',18109,'',0,'','Churcampa',1),
(881,'0906',18109,'',0,'','HuaytarÃ¡',1),
(882,'0907',18109,'',0,'','Tayacaja',1),
(883,'1001',18110,'',0,'','HuÃ¡nuco',1),
(884,'1002',18110,'',0,'','AmbÃ³n',1),
(885,'1003',18110,'',0,'','Dos de Mayo',1),
(886,'1004',18110,'',0,'','Huacaybamba',1),
(887,'1005',18110,'',0,'','HuamalÃ­es',1),
(888,'1006',18110,'',0,'','Leoncio Prado',1),
(889,'1007',18110,'',0,'','MaraÃ±Ã³n',1),
(890,'1008',18110,'',0,'','Pachitea',1),
(891,'1009',18110,'',0,'','Puerto Inca',1),
(892,'1010',18110,'',0,'','Lauricocha',1),
(893,'1011',18110,'',0,'','Yarowilca',1),
(894,'1101',18111,'',0,'','Ica',1),
(895,'1102',18111,'',0,'','Chincha',1),
(896,'1103',18111,'',0,'','Nazca',1),
(897,'1104',18111,'',0,'','Palpa',1),
(898,'1105',18111,'',0,'','Pisco',1),
(899,'1201',18112,'',0,'','Huancayo',1),
(900,'1202',18112,'',0,'','ConcepciÃ³n',1),
(901,'1203',18112,'',0,'','Chanchamayo',1),
(902,'1204',18112,'',0,'','Jauja',1),
(903,'1205',18112,'',0,'','JunÃ­n',1),
(904,'1206',18112,'',0,'','Satipo',1),
(905,'1207',18112,'',0,'','Tarma',1),
(906,'1208',18112,'',0,'','Yauli',1),
(907,'1209',18112,'',0,'','Chupaca',1),
(908,'1301',18113,'',0,'','Trujillo',1),
(909,'1302',18113,'',0,'','Ascope',1),
(910,'1303',18113,'',0,'','BolÃ­var',1),
(911,'1304',18113,'',0,'','ChepÃ©n',1),
(912,'1305',18113,'',0,'','JulcÃ¡n',1),
(913,'1306',18113,'',0,'','Otuzco',1),
(914,'1307',18113,'',0,'','Pacasmayo',1),
(915,'1308',18113,'',0,'','Pataz',1),
(916,'1309',18113,'',0,'','SÃ¡nchez CarriÃ³n',1),
(917,'1310',18113,'',0,'','Santiago de Chuco',1),
(918,'1311',18113,'',0,'','Gran ChimÃº',1),
(919,'1312',18113,'',0,'','VirÃº',1),
(920,'1401',18114,'',0,'','Chiclayo',1),
(921,'1402',18114,'',0,'','FerreÃ±afe',1),
(922,'1403',18114,'',0,'','Lambayeque',1),
(923,'1501',18115,'',0,'','Lima',1),
(924,'1502',18116,'',0,'','Huaura',1),
(925,'1503',18116,'',0,'','Barranca',1),
(926,'1504',18116,'',0,'','Cajatambo',1),
(927,'1505',18116,'',0,'','Canta',1),
(928,'1506',18116,'',0,'','CaÃ±ete',1),
(929,'1507',18116,'',0,'','Huaral',1),
(930,'1508',18116,'',0,'','HuarochirÃ­',1),
(931,'1509',18116,'',0,'','OyÃ³n',1),
(932,'1510',18116,'',0,'','Yauyos',1),
(933,'1601',18117,'',0,'','Maynas',1),
(934,'1602',18117,'',0,'','Alto Amazonas',1),
(935,'1603',18117,'',0,'','Loreto',1),
(936,'1604',18117,'',0,'','Mariscal RamÃ³n Castilla',1),
(937,'1605',18117,'',0,'','Requena',1),
(938,'1606',18117,'',0,'','Ucayali',1),
(939,'1607',18117,'',0,'','Datem del MaraÃ±Ã³n',1),
(940,'1701',18118,'',0,'','Tambopata',1),
(941,'1702',18118,'',0,'','ManÃº',1),
(942,'1703',18118,'',0,'','Tahuamanu',1),
(943,'1801',18119,'',0,'','Mariscal Nieto',1),
(944,'1802',18119,'',0,'','General SÃ¡nchez Cerro',1),
(945,'1803',18119,'',0,'','Ilo',1),
(946,'1901',18120,'',0,'','Pasco',1),
(947,'1902',18120,'',0,'','Daniel Alcides CarriÃ³n',1),
(948,'1903',18120,'',0,'','Oxapampa',1),
(949,'2001',18121,'',0,'','Piura',1),
(950,'2002',18121,'',0,'','Ayabaca',1),
(951,'2003',18121,'',0,'','Huancabamba',1),
(952,'2004',18121,'',0,'','MorropÃ³n',1),
(953,'2005',18121,'',0,'','Paita',1),
(954,'2006',18121,'',0,'','Sullana',1),
(955,'2007',18121,'',0,'','Talara',1),
(956,'2008',18121,'',0,'','Sechura',1),
(957,'2101',18122,'',0,'','Puno',1),
(958,'2102',18122,'',0,'','AzÃ¡ngaro',1),
(959,'2103',18122,'',0,'','Carabaya',1),
(960,'2104',18122,'',0,'','Chucuito',1),
(961,'2105',18122,'',0,'','El Collao',1),
(962,'2106',18122,'',0,'','HuancanÃ©',1),
(963,'2107',18122,'',0,'','Lampa',1),
(964,'2108',18122,'',0,'','Melgar',1),
(965,'2109',18122,'',0,'','Moho',1),
(966,'2110',18122,'',0,'','San Antonio de Putina',1),
(967,'2111',18122,'',0,'','San RomÃ¡n',1),
(968,'2112',18122,'',0,'','Sandia',1),
(969,'2113',18122,'',0,'','Yunguyo',1),
(970,'2201',18123,'',0,'','Moyobamba',1),
(971,'2202',18123,'',0,'','Bellavista',1),
(972,'2203',18123,'',0,'','El Dorado',1),
(973,'2204',18123,'',0,'','Huallaga',1),
(974,'2205',18123,'',0,'','Lamas',1),
(975,'2206',18123,'',0,'','Mariscal CÃ¡ceres',1),
(976,'2207',18123,'',0,'','Picota',1),
(977,'2208',18123,'',0,'','La Rioja',1),
(978,'2209',18123,'',0,'','San MartÃ­n',1),
(979,'2210',18123,'',0,'','Tocache',1),
(980,'2301',18124,'',0,'','Tacna',1),
(981,'2302',18124,'',0,'','Candarave',1),
(982,'2303',18124,'',0,'','Jorge Basadre',1),
(983,'2304',18124,'',0,'','Tarata',1),
(984,'2401',18125,'',0,'','Tumbes',1),
(985,'2402',18125,'',0,'','Contralmirante Villar',1),
(986,'2403',18125,'',0,'','Zarumilla',1),
(987,'2501',18126,'',0,'','Coronel Portillo',1),
(988,'2502',18126,'',0,'','Atalaya',1),
(989,'2503',18126,'',0,'','Padre Abad',1),
(990,'2504',18126,'',0,'','PurÃºs',1),
(991,'PT-AV',15001,NULL,NULL,'AVEIRO','Aveiro',1),
(992,'PT-AC',15002,NULL,NULL,'AZORES','Azores',1),
(993,'PT-BE',15001,NULL,NULL,'BEJA','Beja',1),
(994,'PT-BR',15001,NULL,NULL,'BRAGA','Braga',1),
(995,'PT-BA',15001,NULL,NULL,'BRAGANCA','BraganÃ§a',1),
(996,'PT-CB',15001,NULL,NULL,'CASTELO BRANCO','Castelo Branco',1),
(997,'PT-CO',15001,NULL,NULL,'COIMBRA','Coimbra',1),
(998,'PT-EV',15001,NULL,NULL,'EVORA','Ã‰vora',1),
(999,'PT-FA',15001,NULL,NULL,'FARO','Faro',1),
(1000,'PT-GU',15001,NULL,NULL,'GUARDA','Guarda',1),
(1001,'PT-LE',15001,NULL,NULL,'LEIRIA','Leiria',1),
(1002,'PT-LI',15001,NULL,NULL,'LISBON','Lisboa',1),
(1003,'PT-AML',15001,NULL,NULL,'AREA METROPOLITANA LISBOA','Ãrea Metropolitana de Lisboa',1),
(1004,'PT-MA',15002,NULL,NULL,'MADEIRA','Madeira',1),
(1005,'PT-PA',15001,NULL,NULL,'PORTALEGRE','Portalegre',1),
(1006,'PT-PO',15001,NULL,NULL,'PORTO','Porto',1),
(1007,'PT-SA',15001,NULL,NULL,'SANTAREM','SantarÃ©m',1),
(1008,'PT-SE',15001,NULL,NULL,'SETUBAL','SetÃºbal',1),
(1009,'PT-VC',15001,NULL,NULL,'VIANA DO CASTELO','Viana Do Castelo',1),
(1010,'PT-VR',15001,NULL,NULL,'VILA REAL','Vila Real',1),
(1011,'PT-VI',15001,NULL,NULL,'VISEU','Viseu',1),
(1012,'KN',7301,'',0,'','Kinshasa',1),
(1013,'BC',7301,'',0,'','Kongo Central',1),
(1014,'KG',7301,'',0,'','Kwango',1),
(1015,'KL',7301,'',0,'','Kwilu',1),
(1016,'MN',7301,'',0,'','Mai-Ndombe',1),
(1017,'KS',7301,'',0,'','KasaÃ¯',1),
(1018,'KC',7301,'',0,'','KasaÃ¯-Central',1),
(1019,'KE',7301,'',0,'','KasaÃ¯-Oriental',1),
(1020,'LO',7301,'',0,'','Lomami',1),
(1021,'SA',7301,'',0,'','Sankuru',1),
(1022,'MA',7301,'',0,'','Maniema',1),
(1023,'SK',7301,'',0,'','South Kivu',1),
(1024,'NK',7301,'',0,'','North Kivu',1),
(1025,'IT',7301,'',0,'','Ituri',1),
(1026,'HU',7301,'',0,'','Haut-Uele',1),
(1027,'TO',7301,'',0,'','Tshopo',1),
(1028,'BU',7301,'',0,'','Bas-Uele',1),
(1029,'NU',7301,'',0,'','Nord-Ubangi',1),
(1030,'MO',7301,'',0,'','Mongala',1),
(1031,'SU',7301,'',0,'','Sud-Ubangi',1),
(1032,'EQ',7301,'',0,'','Ã‰quateur',1),
(1033,'TU',7301,'',0,'','Tshuapa',1),
(1034,'TA',7301,'',0,'','Tanganyika',1),
(1035,'HL',7301,'',0,'','Haut-Lomami',1),
(1036,'LU',7301,'',0,'','Lualaba',1),
(1037,'HK',7301,'',0,'','Haut-Katanga',1);
/*!40000 ALTER TABLE `llx_c_departements` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_ecotaxe`
--

DROP TABLE IF EXISTS `llx_c_ecotaxe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_ecotaxe` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `price` double(24,8) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `fk_pays` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_ecotaxe` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_ecotaxe`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_ecotaxe` WRITE;
/*!40000 ALTER TABLE `llx_c_ecotaxe` DISABLE KEYS */;
INSERT INTO `llx_c_ecotaxe` VALUES
(1,'25040','PETIT APPAREILS MENAGERS',0.25000000,'Eco-systÃ¨mes',1,1),
(2,'25050','TRES PETIT APPAREILS MENAGERS',0.08000000,'Eco-systÃ¨mes',1,1),
(3,'32070','ECRAN POIDS < 5 KG',2.08000000,'Eco-systÃ¨mes',1,1),
(4,'32080','ECRAN POIDS > 5 KG',1.25000000,'Eco-systÃ¨mes',1,1),
(5,'32051','ORDINATEUR PORTABLE',0.42000000,'Eco-systÃ¨mes',1,1),
(6,'32061','TABLETTE INFORMATIQUE',0.84000000,'Eco-systÃ¨mes',1,1),
(7,'36011','ORDINATEUR FIXE (UC)',1.15000000,'Eco-systÃ¨mes',1,1),
(8,'36021','IMPRIMANTES',0.83000000,'Eco-systÃ¨mes',1,1),
(9,'36030','IT (INFORMATIQUE ET TELECOMS)',0.83000000,'Eco-systÃ¨mes',1,1),
(10,'36040','PETIT IT (CLAVIERS / SOURIS)',0.08000000,'Eco-systÃ¨mes',1,1),
(11,'36050','TELEPHONIE MOBILE',0.02000000,'Eco-systÃ¨mes',1,1),
(12,'36060','CONNECTIQUE CABLES',0.02000000,'Eco-systÃ¨mes',1,1),
(13,'45010','GROS MATERIEL GRAND PUBLIC (TELEAGRANDISSEURS)',1.67000000,'Eco-systÃ¨mes',1,1),
(14,'45020','MOYEN MATERIEL GRAND PUBLIC (LOUPES ELECTRONIQUES)',0.42000000,'Eco-systÃ¨mes',1,1),
(15,'45030','PETIT MATERIEL GRAND PUBLIC (VIE QUOTIDIENNE)',0.08000000,'Eco-systÃ¨mes',1,1),
(16,'75030','JOUETS < 0,5 KG',0.08000000,'Eco-systÃ¨mes',1,1),
(17,'75040','JOUETS ENTRE 0,5 KG ET 10 KG',0.17000000,'Eco-systÃ¨mes',1,1),
(18,'74050','JOUETS > 10 KG',1.67000000,'Eco-systÃ¨mes',1,1),
(19,'85010','EQUIPEMENT MEDICAL < 0,5 KG',0.08000000,'Eco-systÃ¨mes',1,1);
/*!40000 ALTER TABLE `llx_c_ecotaxe` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_effectif`
--

DROP TABLE IF EXISTS `llx_c_effectif`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_effectif` (
  `id` int(11) NOT NULL,
  `code` varchar(12) NOT NULL,
  `libelle` varchar(128) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `module` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_c_effectif` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_effectif`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_effectif` WRITE;
/*!40000 ALTER TABLE `llx_c_effectif` DISABLE KEYS */;
INSERT INTO `llx_c_effectif` VALUES
(0,'EF0','-',1,NULL),
(1,'EF1-5','1 - 5',1,NULL),
(2,'EF6-10','6 - 10',1,NULL),
(3,'EF11-50','11 - 50',1,NULL),
(4,'EF51-100','51 - 100',1,NULL),
(5,'EF101-500','101 - 500',1,NULL),
(6,'EF500-','> 500',1,NULL);
/*!40000 ALTER TABLE `llx_c_effectif` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_email_senderprofile`
--

DROP TABLE IF EXISTS `llx_c_email_senderprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_email_senderprofile` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `private` smallint(6) NOT NULL DEFAULT 0,
  `date_creation` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `label` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `signature` text DEFAULT NULL,
  `position` smallint(6) DEFAULT 0,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_email_senderprofile` (`entity`,`label`,`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_email_senderprofile`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_email_senderprofile` WRITE;
/*!40000 ALTER TABLE `llx_c_email_senderprofile` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_c_email_senderprofile` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_email_templates`
--

DROP TABLE IF EXISTS `llx_c_email_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_email_templates` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `module` varchar(32) DEFAULT NULL,
  `type_template` varchar(32) DEFAULT NULL,
  `lang` varchar(6) DEFAULT '',
  `private` smallint(6) NOT NULL DEFAULT 0,
  `fk_user` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `label` varchar(180) DEFAULT NULL,
  `position` smallint(6) DEFAULT NULL,
  `defaultfortype` smallint(6) DEFAULT 0,
  `enabled` varchar(255) DEFAULT '1',
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `email_from` varchar(255) DEFAULT NULL,
  `email_to` varchar(255) DEFAULT NULL,
  `email_tocc` varchar(255) DEFAULT NULL,
  `email_tobcc` varchar(255) DEFAULT NULL,
  `topic` text DEFAULT NULL,
  `joinfiles` text DEFAULT NULL,
  `content` mediumtext DEFAULT NULL,
  `content_lines` text DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_email_templates` (`entity`,`label`,`lang`),
  KEY `idx_type` (`type_template`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_email_templates`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_email_templates` WRITE;
/*!40000 ALTER TABLE `llx_c_email_templates` DISABLE KEYS */;
INSERT INTO `llx_c_email_templates` VALUES
(1,0,'banque','thirdparty','',0,NULL,NULL,'2026-09-23 07:34:00','(YourSEPAMandate)',1,0,'isModEnabled(\"societe\") && isModEnabled(\"bank\") && isModEnabled(\"prelevement\")',0,NULL,NULL,NULL,NULL,'__(YourSEPAMandate)__','0','__(Hello)__,<br><br>\n\n__(FindYourSEPAMandate)__ :<br>\n__MYCOMPANY_NAME__<br>\n__MYCOMPANY_FULLADDRESS__<br><br>\n__(Sincerely)__<br>\\__SENDEREMAIL_SIGNATURE__',NULL),
(2,0,'adherent','member','',0,NULL,NULL,'2026-09-23 07:34:00','(SendingEmailOnAutoSubscription)',10,0,'isModEnabled(\"adherent\")',1,NULL,NULL,NULL,NULL,'[__[MAIN_INFO_SOCIETE_NOM]__] __(YourMembershipRequestWasReceived)__','0','__(Hello)__ __MEMBER_FULLNAME__,<br><br>\n\n__(ThisIsContentOfYourMembershipRequestWasReceived)__<br>\n<br>__ONLINE_PAYMENT_TEXT_AND_URL__<br>\n<br><br>\n__(Sincerely)__<br>__SENDEREMAIL_SIGNATURE__',NULL),
(3,0,'adherent','member','',0,NULL,NULL,'2026-09-23 07:34:00','(SendingEmailOnMemberValidation)',20,0,'isModEnabled(\"adherent\")',1,NULL,NULL,NULL,NULL,'[__[MAIN_INFO_SOCIETE_NOM]__] __(YourMembershipWasValidated)__','0','__(Hello)__ __MEMBER_FULLNAME__,<br><br>\n\n__(ThisIsContentOfYourMembershipWasValidated)__<br>__(FirstName)__ : __MEMBER_FIRSTNAME__<br>__(LastName)__ : __MEMBER_LASTNAME__<br>__(ID)__ : __MEMBER_ID__<br>\n<br>__ONLINE_PAYMENT_TEXT_AND_URL__<br>\n<br><br>\n__(Sincerely)__<br>__SENDEREMAIL_SIGNATURE__',NULL),
(4,0,'adherent','member','',0,NULL,NULL,'2026-09-23 07:34:00','(SendingEmailOnNewSubscription)',30,0,'isModEnabled(\"adherent\")',1,NULL,NULL,NULL,NULL,'[__[MAIN_INFO_SOCIETE_NOM]__] __(YourSubscriptionWasRecorded)__','1','__(Hello)__ __MEMBER_FULLNAME__,<br><br>\n\n__(ThisIsContentOfYourSubscriptionWasRecorded)__<br>\n\n<br><br>\n__(Sincerely)__<br>__SENDEREMAIL_SIGNATURE__',NULL),
(5,0,'adherent','member','',0,NULL,NULL,'2026-09-23 07:34:00','(SendingReminderForExpiredSubscription)',40,0,'isModEnabled(\"adherent\")',1,NULL,NULL,NULL,NULL,'[__[MAIN_INFO_SOCIETE_NOM]__] __(SubscriptionReminderEmail)__','0','__(Hello)__ __MEMBER_FULLNAME__,<br><br>\n\n__(ThisIsContentOfSubscriptionReminderEmail)__<br>\n<br>__ONLINE_PAYMENT_TEXT_AND_URL__<br>\n<br><br>\n__(Sincerely)__<br>__SENDEREMAIL_SIGNATURE__',NULL),
(6,0,'adherent','member','',0,NULL,NULL,'2026-09-23 07:34:00','(SendingEmailOnCancelation)',50,0,'isModEnabled(\"adherent\")',1,NULL,NULL,NULL,NULL,'[__[MAIN_INFO_SOCIETE_NOM]__] __(YourMembershipWasCanceled)__','0','__(Hello)__ __MEMBER_FULLNAME__,<br><br>\n\n__(YourMembershipWasCanceled)__<br>\n<br><br>\n__(Sincerely)__<br>__SENDEREMAIL_SIGNATURE__',NULL),
(7,0,'adherent','member','',0,NULL,NULL,'2026-09-23 07:34:00','(SendingAnEMailToMember)',60,0,'isModEnabled(\"adherent\")',1,NULL,NULL,NULL,NULL,'[__[MAIN_INFO_SOCIETE_NOM]__] __(CardContent)__','0','__(Hello)__,<br><br>\n\n__(ThisIsContentOfYourCard)__<br>\n__(ID)__ : __ID__<br>\n__(Civility)__ : __MEMBER_CIVILITY__<br>\n__(Firstname)__ : __MEMBER_FIRSTNAME__<br>\n__(Lastname)__ : __MEMBER_LASTNAME__<br>\n__(Fullname)__ : __MEMBER_FULLNAME__<br>\n__(Company)__ : __MEMBER_COMPANY__<br>\n__(Address)__ : __MEMBER_ADDRESS__<br>\n__(Zip)__ : __MEMBER_ZIP__<br>\n__(Town)__ : __MEMBER_TOWN__<br>\n__(Country)__ : __MEMBER_COUNTRY__<br>\n__(Email)__ : __MEMBER_EMAIL__<br>\n__(Birthday)__ : __MEMBER_BIRTH__<br>\n__(Photo)__ : __MEMBER_PHOTO__<br>\n__(Login)__ : __MEMBER_LOGIN__<br>\n__(Phone)__ : __MEMBER_PHONE__<br>\n__(PhonePerso)__ : __MEMBER_PHONEPRO__<br>\n__(PhoneMobile)__ : __MEMBER_PHONEMOBILE__<br><br>\n__(Sincerely)__<br>__SENDEREMAIL_SIGNATURE__',NULL),
(8,0,'recruitment','recruitmentcandidature_send','',0,NULL,NULL,'2026-09-23 07:34:00','(AnswerCandidature)',100,0,'isModEnabled(\"recruitment\")',1,NULL,NULL,NULL,NULL,'[__[MAIN_INFO_SOCIETE_NOM]__] __(YourCandidature)__','0','__(Hello)__ __CANDIDATE_FULLNAME__,<br><br>\n\n__(YourCandidatureAnswerMessage)__<br>__ONLINE_INTERVIEW_SCHEDULER_TEXT_AND_URL__\n<br><br>\n__(Sincerely)__<br>__SENDEREMAIL_SIGNATURE__',NULL),
(9,0,'holiday','holiday','',0,NULL,NULL,'2026-09-23 07:34:00','(HolidayHrInformationsPreviousMonth)',100,0,'isModEnabled(\"holiday\")',1,NULL,NULL,NULL,NULL,'__(HolidayHrInformationsPreviousMonthTopic)__','0','__(Hello)__<br><br>__(HolidayHrInformationsPreviousMonthContent)__:<br>__HOLIDAY_ARRAY_PER_EMPLOYEE_FOR_PERIOD__<br><br>__SENDEREMAIL_SIGNATURE__',NULL),
(10,0,'','conferenceorbooth','',0,NULL,NULL,'2026-09-23 07:34:00','(EventOrganizationEmailAskConf)',10,0,'1',1,NULL,NULL,NULL,NULL,'[__[MAIN_INFO_SOCIETE_NOM]__] __(EventOrganizationEmailAskConf)__',NULL,'__(Hello)__,<br /><br />__(OrganizationEventConfRequestWasReceived)__<br /><br /><br />__(Sincerely)__<br />__SENDEREMAIL_SIGNATURE__',NULL),
(11,0,'','conferenceorbooth','',0,NULL,NULL,'2026-09-23 07:34:00','(EventOrganizationEmailAskBooth)',20,0,'1',1,NULL,NULL,NULL,NULL,'[__[MAIN_INFO_SOCIETE_NOM]__] __(EventOrganizationEmailAskBooth)__',NULL,'__(Hello)__,<br /><br />__(OrganizationEventBoothRequestWasReceived)__<br /><br /><br />__(Sincerely)__<br />__SENDEREMAIL_SIGNATURE__',NULL),
(12,0,'','conferenceorbooth','',0,NULL,NULL,'2026-09-23 07:34:00','(EventOrganizationEmailBoothPayment)',30,0,'1',1,NULL,NULL,NULL,NULL,'[__[MAIN_INFO_SOCIETE_NOM]__] __(EventOrganizationEmailBoothPayment)__',NULL,'__(Hello)__,<br /><br />__(OrganizationEventPaymentOfBoothWasReceived)__<br /><br /><br />__(Sincerely)__<br />__SENDEREMAIL_SIGNATURE__',NULL),
(13,0,'','conferenceorbooth','',0,NULL,NULL,'2026-09-23 07:34:00','(EventOrganizationEmailRegistrationPayment)',40,0,'1',1,NULL,NULL,NULL,NULL,'[__[MAIN_INFO_SOCIETE_NOM]__] __(EventOrganizationEmailRegistrationPayment)__',NULL,'__(Hello)__,<br /><br />__(OrganizationEventPaymentOfRegistrationWasReceived)__<br /><br />__(Sincerely)__<br />__SENDEREMAIL_SIGNATURE__',NULL),
(14,0,'','conferenceorbooth','',0,NULL,NULL,'2026-09-23 07:34:00','(EventOrganizationMassEmailAttendees)',50,0,'1',1,NULL,NULL,NULL,NULL,'[__[MAIN_INFO_SOCIETE_NOM]__] __(EventOrganizationMassEmailAttendees)__',NULL,'__(Hello)__,<br /><br />__(OrganizationEventBulkMailToAttendees)__<br /><br />__(Sincerely)__<br />__SENDEREMAIL_SIGNATURE__',NULL),
(15,0,'','conferenceorbooth','',0,NULL,NULL,'2026-09-23 07:34:00','(EventOrganizationMassEmailSpeakers)',60,0,'1',1,NULL,NULL,NULL,NULL,'[__[MAIN_INFO_SOCIETE_NOM]__] __(EventOrganizationMassEmailSpeakers)__',NULL,'__(Hello)__,<br /><br />__(OrganizationEventBulkMailToSpeakers)__<br /><br />__(Sincerely)__<br />__SENDEREMAIL_SIGNATURE__',NULL),
(16,0,'partnership','partnership_send','',0,NULL,NULL,'2026-09-23 07:34:00','(SendingEmailOnPartnershipWillSoonBeCanceled)',100,0,'1',1,NULL,NULL,NULL,NULL,'[__[MAIN_INFO_SOCIETE_NOM]__] - __(YourPartnershipWillSoonBeCanceledTopic)__','0','<body>\n <p>__(Hello)__,<br><br>\n__(YourPartnershipWillSoonBeCanceledContent)__</p>\n<br />\n\n<br />\n\n            __(Sincerely)__ <br />\n            __[MAIN_INFO_SOCIETE_NOM]__ <br />\n </body>\n',NULL),
(17,0,'partnership','partnership_send','',0,NULL,NULL,'2026-09-23 07:34:00','(SendingEmailOnPartnershipCanceled)',100,0,'1',1,NULL,NULL,NULL,NULL,'[__[MAIN_INFO_SOCIETE_NOM]__] - __(YourPartnershipCanceledTopic)__','0','<body>\n <p>__(Hello)__,<br><br>\n__(YourPartnershipCanceledContent)__</p>\n<br />\n\n<br />\n\n            __(Sincerely)__ <br />\n            __[MAIN_INFO_SOCIETE_NOM]__ <br />\n </body>\n',NULL),
(18,0,'partnership','partnership_send','',0,NULL,NULL,'2026-09-23 07:34:00','(SendingEmailOnPartnershipRefused)',100,0,'1',1,NULL,NULL,NULL,NULL,'[__[MAIN_INFO_SOCIETE_NOM]__] - __(YourPartnershipRefusedTopic)__','0','<body>\n <p>__(Hello)__,<br><br>\n__(YourPartnershipRefusedContent)__</p>\n<br />\n\n<br />\n\n            __(Sincerely)__ <br />\n            __[MAIN_INFO_SOCIETE_NOM]__ <br />\n </body>\n',NULL),
(19,0,'partnership','partnership_send','',0,NULL,NULL,'2026-09-23 07:34:00','(SendingEmailOnPartnershipAccepted)',100,0,'1',1,NULL,NULL,NULL,NULL,'[__[MAIN_INFO_SOCIETE_NOM]__] - __(YourPartnershipAcceptedTopic)__','0','<body>\n <p>__(Hello)__,<br><br>\n__(YourPartnershipAcceptedContent)__</p>\n<br />\n\n<br />\n\n            __(Sincerely)__ <br />\n            __[MAIN_INFO_SOCIETE_NOM]__ <br />\n </body>\n',NULL),
(20,0,'supplier_invoice','invoice_supplier_send','',0,NULL,NULL,'2026-09-23 07:34:00','(SendingReminderEmailOnUnpaidSupplierInvoice)',100,0,'isModEnabled(\"supplier_invoice\")',1,NULL,NULL,NULL,NULL,'[__[MAIN_INFO_SOCIETE_NOM]__] - __(SupplierInvoice)__','0','__(Hello)__,<br /><br />__(SupplierInvoiceUnpaidContent)__<br />__URL_SUPPLIER_INVOICE__<br /><br />__(Sincerely)__<br />__SENDEREMAIL_SIGNATURE__',NULL),
(21,0,'ticket','ticket_send','',0,NULL,NULL,'2026-09-23 07:34:00','(SendingAdminEmailMessage)',100,0,'isModEnabled(\"ticket\")',1,NULL,NULL,NULL,NULL,'[__[MAIN_INFO_SOCIETE_NOM]__] __TICKET_EMAIL_SUBJECT__','0','__TICKET_EMAIL_BODY__<br><ul><li>(Title) : __TICKET_SUBJECT__</li><li>(Type) : __TICKET_TYPE__</li><li>(TicketCategory) : __TICKET_CATEGORY__</li><li>(Severity) : __TICKET_SEVERITY__</li><li>(From) : __TICKET_USER_ASSIGN__</li><li>(Company) : __THIRDPARTY_NAME__</li></ul><p>(Message) : <br><br>__TICKET_MESSAGE__ </p><br><p><a href=\"__TICKET_URL__\">(SeeThisTicketIntomanagementInterface)</a></p>',NULL);
/*!40000 ALTER TABLE `llx_c_email_templates` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_exp_tax_cat`
--

DROP TABLE IF EXISTS `llx_c_exp_tax_cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_exp_tax_cat` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(128) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `active` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_exp_tax_cat`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_exp_tax_cat` WRITE;
/*!40000 ALTER TABLE `llx_c_exp_tax_cat` DISABLE KEYS */;
INSERT INTO `llx_c_exp_tax_cat` VALUES
(1,'ExpAutoCat',1,0),
(2,'ExpCycloCat',1,0),
(3,'ExpMotoCat',1,0),
(4,'ExpAuto3CV',1,1),
(5,'ExpAuto4CV',1,1),
(6,'ExpAuto5CV',1,1),
(7,'ExpAuto6CV',1,1),
(8,'ExpAuto7CV',1,1),
(9,'ExpAuto8CV',1,1),
(10,'ExpAuto9CV',1,0),
(11,'ExpAuto10CV',1,0),
(12,'ExpAuto11CV',1,0),
(13,'ExpAuto12CV',1,0),
(14,'ExpAuto3PCV',1,0),
(15,'ExpAuto4PCV',1,0),
(16,'ExpAuto5PCV',1,0),
(17,'ExpAuto6PCV',1,0),
(18,'ExpAuto7PCV',1,0),
(19,'ExpAuto8PCV',1,0),
(20,'ExpAuto9PCV',1,0),
(21,'ExpAuto10PCV',1,0),
(22,'ExpAuto11PCV',1,0),
(23,'ExpAuto12PCV',1,0),
(24,'ExpAuto13PCV',1,0),
(25,'ExpCyclo',1,0),
(26,'ExpMoto12CV',1,0),
(27,'ExpMoto345CV',1,0),
(28,'ExpMoto5PCV',1,0);
/*!40000 ALTER TABLE `llx_c_exp_tax_cat` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_exp_tax_range`
--

DROP TABLE IF EXISTS `llx_c_exp_tax_range`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_exp_tax_range` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_c_exp_tax_cat` int(11) NOT NULL DEFAULT 1,
  `range_ik` double NOT NULL DEFAULT 0,
  `entity` int(11) NOT NULL DEFAULT 1,
  `active` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_exp_tax_range`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_exp_tax_range` WRITE;
/*!40000 ALTER TABLE `llx_c_exp_tax_range` DISABLE KEYS */;
INSERT INTO `llx_c_exp_tax_range` VALUES
(1,4,0,1,1),
(2,4,5000,1,1),
(3,4,20000,1,1),
(4,5,0,1,1),
(5,5,5000,1,1),
(6,5,20000,1,1),
(7,6,0,1,1),
(8,6,5000,1,1),
(9,6,20000,1,1),
(10,7,0,1,1),
(11,7,5000,1,1),
(12,7,20000,1,1),
(13,8,0,1,1),
(14,8,5000,1,1),
(15,8,20000,1,1);
/*!40000 ALTER TABLE `llx_c_exp_tax_range` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_field_list`
--

DROP TABLE IF EXISTS `llx_c_field_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_field_list` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `element` varchar(64) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `name` varchar(32) NOT NULL,
  `alias` varchar(32) NOT NULL,
  `title` varchar(32) NOT NULL,
  `align` varchar(6) DEFAULT 'left',
  `sort` tinyint(4) NOT NULL DEFAULT 1,
  `search` tinyint(4) NOT NULL DEFAULT 0,
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `enabled` varchar(255) DEFAULT '1',
  `rang` int(11) DEFAULT 0,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_field_list`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_field_list` WRITE;
/*!40000 ALTER TABLE `llx_c_field_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_c_field_list` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_format_cards`
--

DROP TABLE IF EXISTS `llx_c_format_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_format_cards` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `paper_size` varchar(20) NOT NULL,
  `orientation` varchar(1) NOT NULL,
  `metric` varchar(5) NOT NULL,
  `leftmargin` double(24,8) NOT NULL,
  `topmargin` double(24,8) NOT NULL,
  `nx` int(11) NOT NULL,
  `ny` int(11) NOT NULL,
  `spacex` double(24,8) NOT NULL,
  `spacey` double(24,8) NOT NULL,
  `width` double(24,8) NOT NULL,
  `height` double(24,8) NOT NULL,
  `font_size` int(11) NOT NULL,
  `custom_x` double(24,8) NOT NULL,
  `custom_y` double(24,8) NOT NULL,
  `active` int(11) NOT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_format_cards`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_format_cards` WRITE;
/*!40000 ALTER TABLE `llx_c_format_cards` DISABLE KEYS */;
INSERT INTO `llx_c_format_cards` VALUES
(1,'5160','Avery-5160, WL-875WX','letter','P','mm',5.58165000,12.70000000,3,10,3.55600000,0.00000000,65.87490000,25.40000000,7,0.00000000,0.00000000,1),
(2,'5161','Avery-5161, WL-75WX','letter','P','mm',4.44500000,12.70000000,2,10,3.96800000,0.00000000,101.60000000,25.40000000,7,0.00000000,0.00000000,1),
(3,'5162','Avery-5162, WL-100WX','letter','P','mm',3.87350000,22.35200000,2,7,4.95400000,0.00000000,101.60000000,33.78100000,8,0.00000000,0.00000000,1),
(4,'5163','Avery-5163, WL-125WX','letter','P','mm',4.57200000,12.70000000,2,5,3.55600000,0.00000000,101.60000000,50.80000000,10,0.00000000,0.00000000,1),
(5,'5164','Avery-5164 (inch)','letter','P','in',0.14800000,0.50000000,2,3,0.20310000,0.00000000,4.00000000,3.33000000,12,0.00000000,0.00000000,0),
(6,'8600','Avery-8600','letter','P','mm',7.10000000,19.00000000,3,10,9.50000000,3.10000000,66.60000000,25.40000000,7,0.00000000,0.00000000,1),
(7,'99012','DYMO 99012 89*36mm','custom','L','mm',1.00000000,1.00000000,1,1,0.00000000,0.00000000,36.00000000,89.00000000,10,36.00000000,89.00000000,1),
(8,'99014','DYMO 99014 101*54mm','custom','L','mm',1.00000000,1.00000000,1,1,0.00000000,0.00000000,54.00000000,101.00000000,10,54.00000000,101.00000000,1),
(9,'AVERYC32010','Avery-C32010','A4','P','mm',15.00000000,13.00000000,2,5,10.00000000,0.00000000,85.00000000,54.00000000,10,0.00000000,0.00000000,1),
(10,'CARD','Dolibarr Business cards','A4','P','mm',15.00000000,15.00000000,2,5,0.00000000,0.00000000,85.00000000,54.00000000,10,0.00000000,0.00000000,1),
(11,'L7163','Avery-L7163','A4','P','mm',5.00000000,15.00000000,2,7,2.50000000,0.00000000,99.10000000,38.10000000,8,0.00000000,0.00000000,1);
/*!40000 ALTER TABLE `llx_c_format_cards` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_forme_juridique`
--

DROP TABLE IF EXISTS `llx_c_forme_juridique`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_forme_juridique` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(11) NOT NULL,
  `fk_pays` int(11) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `isvatexempted` tinyint(4) NOT NULL DEFAULT 0,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `module` varchar(32) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_forme_juridique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=376 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_forme_juridique`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_forme_juridique` WRITE;
/*!40000 ALTER TABLE `llx_c_forme_juridique` DISABLE KEYS */;
INSERT INTO `llx_c_forme_juridique` VALUES
(1,0,0,'-',0,1,NULL,0),
(2,2301,23,'Monotributista',0,1,NULL,0),
(3,2302,23,'Sociedad Civil',0,1,NULL,0),
(4,2303,23,'Sociedades Comerciales',0,1,NULL,0),
(5,2304,23,'Sociedades de Hecho',0,1,NULL,0),
(6,2305,23,'Sociedades Irregulares',0,1,NULL,0),
(7,2306,23,'Sociedad Colectiva',0,1,NULL,0),
(8,2307,23,'Sociedad en Comandita Simple',0,1,NULL,0),
(9,2308,23,'Sociedad de Capital e Industria',0,1,NULL,0),
(10,2309,23,'Sociedad Accidental o en participaciÃ³n',0,1,NULL,0),
(11,2310,23,'Sociedad de Responsabilidad Limitada',0,1,NULL,0),
(12,2311,23,'Sociedad AnÃ³nima',0,1,NULL,0),
(13,2312,23,'Sociedad AnÃ³nima con ParticipaciÃ³n Estatal Mayoritaria',0,1,NULL,0),
(14,2313,23,'Sociedad en Comandita por Acciones (arts. 315 a 324, LSC)',0,1,NULL,0),
(15,4100,41,'GmbH - Gesellschaft mit beschrÃ¤nkter Haftung',0,1,NULL,0),
(16,4101,41,'GesmbH - Gesellschaft mit beschrÃ¤nkter Haftung',0,1,NULL,0),
(17,4102,41,'AG - Aktiengesellschaft',0,1,NULL,0),
(18,4103,41,'EWIV - EuropÃ¤ische wirtschaftliche Interessenvereinigung',0,1,NULL,0),
(19,4104,41,'KEG - Kommanditerwerbsgesellschaft',0,1,NULL,0),
(20,4105,41,'OEG - Offene Erwerbsgesellschaft',0,1,NULL,0),
(21,4106,41,'OHG - Offene Handelsgesellschaft',0,1,NULL,0),
(22,4107,41,'AG & Co KG - Kommanditgesellschaft',0,1,NULL,0),
(23,4108,41,'GmbH & Co KG - Kommanditgesellschaft',0,1,NULL,0),
(24,4109,41,'KG - Kommanditgesellschaft',0,1,NULL,0),
(25,4110,41,'OG - Offene Gesellschaft',0,1,NULL,0),
(26,4111,41,'GbR - Gesellschaft nach bÃ¼rgerlichem Recht',0,1,NULL,0),
(27,4112,41,'GesbR - Gesellschaft nach bÃ¼rgerlichem Recht',0,1,NULL,0),
(28,4113,41,'GesnbR - Gesellschaft nach bÃ¼rgerlichem Recht',0,1,NULL,0),
(29,4114,41,'e.U. - eingetragener Einzelunternehmer',0,1,NULL,0),
(30,4115,41,'FlexKapG - Flexible Kapitalgesellschaft',0,1,NULL,0),
(31,200,2,'IndÃ©pendant',0,1,NULL,0),
(32,201,2,'SRL - SociÃ©tÃ© Ã  responsabilitÃ© limitÃ©e',0,1,NULL,0),
(33,202,2,'SA   - SociÃ©tÃ© Anonyme',0,1,NULL,0),
(34,203,2,'SCRL - SociÃ©tÃ© coopÃ©rative Ã  responsabilitÃ© limitÃ©e',0,1,NULL,0),
(35,204,2,'ASBL - Association sans but Lucratif',0,1,NULL,0),
(36,205,2,'SCRI - SociÃ©tÃ© coopÃ©rative Ã  responsabilitÃ© illimitÃ©e',0,1,NULL,0),
(37,206,2,'SCS  - SociÃ©tÃ© en commandite simple',0,1,NULL,0),
(38,207,2,'SCA  - SociÃ©tÃ© en commandite par action',0,1,NULL,0),
(39,208,2,'SNC  - SociÃ©tÃ© en nom collectif',0,1,NULL,0),
(40,209,2,'GIE  - Groupement d intÃ©rÃªt Ã©conomique',0,1,NULL,0),
(41,210,2,'GEIE - Groupement europÃ©en d intÃ©rÃªt Ã©conomique',0,1,NULL,0),
(42,220,2,'Eenmanszaak',0,1,NULL,0),
(43,221,2,'BVBA - Besloten vennootschap met beperkte aansprakelijkheid',0,1,NULL,0),
(44,222,2,'NV   - Naamloze Vennootschap',0,1,NULL,0),
(45,223,2,'CVBA - CoÃ¶peratieve vennootschap met beperkte aansprakelijkheid',0,1,NULL,0),
(46,224,2,'VZW  - Vereniging zonder winstoogmerk',0,1,NULL,0),
(47,225,2,'CVOA - CoÃ¶peratieve vennootschap met onbeperkte aansprakelijkheid ',0,1,NULL,0),
(48,226,2,'GCV  - Gewone commanditaire vennootschap',0,1,NULL,0),
(49,227,2,'Comm.VA - Commanditaire vennootschap op aandelen',0,1,NULL,0),
(50,228,2,'VOF  - Vennootschap onder firma',0,1,NULL,0),
(51,229,2,'VS0  - Vennootschap met sociaal oogmerk',0,1,NULL,0),
(52,9,1,'Organisme de placement collectif en valeurs mobiliÃ¨res sans personnalitÃ© morale',0,1,NULL,0),
(53,10,1,'Entrepreneur individuel',0,1,NULL,0),
(54,21,1,'Indivision',0,1,NULL,0),
(55,22,1,'SociÃ©tÃ© crÃ©Ã©e de fait',0,1,NULL,0),
(56,23,1,'SociÃ©tÃ© en participation',0,1,NULL,0),
(57,24,1,'Fiducie',0,1,NULL,0),
(58,27,1,'Paroisse hors zone concordataire',0,1,NULL,0),
(59,28,1,'Assujetti unique Ã  la TVA',0,1,NULL,0),
(60,29,1,'Autre groupement de droit privÃ© non dotÃ© de la personnalitÃ© morale',0,1,NULL,0),
(61,31,1,'Personne morale de droit Ã©tranger, immatriculÃ©e au RCS',0,1,NULL,0),
(62,32,1,'Personne morale de droit Ã©tranger, non immatriculÃ©e au RCS',0,1,NULL,0),
(63,41,1,'Etablissement public ou rÃ©gie Ã  caractÃ¨re industriel ou commercial',0,1,NULL,0),
(64,51,1,'SociÃ©tÃ© coopÃ©rative commerciale particuliÃ¨re',0,1,NULL,0),
(65,52,1,'SociÃ©tÃ© en nom collectif',0,1,NULL,0),
(66,53,1,'SociÃ©tÃ© en commandite',0,1,NULL,0),
(67,54,1,'SociÃ©tÃ© Ã  responsabilitÃ© limitÃ©e (SARL)',0,1,NULL,0),
(68,55,1,'SociÃ©tÃ© anonyme Ã  conseil d\'administration',0,1,NULL,0),
(69,56,1,'SociÃ©tÃ© anonyme Ã  directoire',0,1,NULL,0),
(70,57,1,'SociÃ©tÃ© par actions simplifiÃ©e (SAS)',0,1,NULL,0),
(71,58,1,'SociÃ©tÃ© europÃ©enne',0,1,NULL,0),
(72,61,1,'Caisse d\'Ã©pargne et de prÃ©voyance',0,1,NULL,0),
(73,62,1,'Groupement d\'intÃ©rÃªt Ã©conomique (GIE)',0,1,NULL,0),
(74,63,1,'SociÃ©tÃ© coopÃ©rative agricole',0,1,NULL,0),
(75,64,1,'SociÃ©tÃ© d\'assurance mutuelle',0,1,NULL,0),
(76,65,1,'SociÃ©tÃ© civile',0,1,NULL,0),
(77,66,1,'SociÃ©tÃ© publiques locales',0,1,NULL,0),
(78,69,1,'Autre personne morale de droit privÃ© inscrite au RCS',0,1,NULL,0),
(79,71,1,'Administration de l Ã©tat',0,1,NULL,0),
(80,72,1,'CollectivitÃ© territoriale',0,1,NULL,0),
(81,73,1,'Etablissement public administratif',0,1,NULL,0),
(82,74,1,'Personne morale de droit public administratif',0,1,NULL,0),
(83,81,1,'Organisme gÃ©rant rÃ©gime de protection social Ã  adhÃ©sion obligatoire',0,1,NULL,0),
(84,82,1,'Organisme mutualiste',0,1,NULL,0),
(85,83,1,'ComitÃ© d entreprise',0,1,NULL,0),
(86,84,1,'Organisme professionnel',0,1,NULL,0),
(87,85,1,'Organisme de retraite Ã  adhÃ©sion non obligatoire',0,1,NULL,0),
(88,91,1,'Syndicat de propriÃ©taires',0,1,NULL,0),
(89,92,1,'Association loi 1901 ou assimilÃ©',0,1,NULL,0),
(90,93,1,'Fondation',0,1,NULL,0),
(91,99,1,'Autre personne morale de droit privÃ©',0,1,NULL,0),
(92,500,5,'GmbH - Gesellschaft mit beschrÃ¤nkter Haftung',0,1,NULL,0),
(93,501,5,'AG - Aktiengesellschaft ',0,1,NULL,0),
(94,502,5,'GmbH&Co. KG - Gesellschaft mit beschrÃ¤nkter Haftung & Compagnie Kommanditgesellschaft',0,1,NULL,0),
(95,503,5,'Gewerbe - Personengesellschaft',0,1,NULL,0),
(96,504,5,'UG - Unternehmergesellschaft -haftungsbeschrÃ¤nkt-',0,1,NULL,0),
(97,505,5,'GbR - Gesellschaft des bÃ¼rgerlichen Rechts',0,1,NULL,0),
(98,506,5,'KG - Kommanditgesellschaft',0,1,NULL,0),
(99,507,5,'Ltd. - Limited Company',0,1,NULL,0),
(100,508,5,'OHG - Offene Handelsgesellschaft',0,1,NULL,0),
(101,509,5,'eG - eingetragene Genossenschaft',0,1,NULL,0),
(102,510,5,'e.V. - eingetragener Verein',0,1,NULL,0),
(103,511,5,'eGbR - eingetragene Gesellschaft bÃ¼rgerlichen Rechts',0,1,NULL,0),
(104,512,5,'Einzelunternehmen',0,1,NULL,0),
(105,513,5,'PartG - Partnerschaftsgesellschaft',0,1,NULL,0),
(106,514,5,'PartG mbB - Partnerschaftsgesellschaft mit beschrÃ¤nkter Berufshaftung',0,1,NULL,0),
(107,515,5,'KGaA - Kommanditgesellschaft auf Aktien',0,1,NULL,0),
(108,516,5,'GmbH & Co. KGaA - Gesellschaft mit beschrÃ¤nkter Haftung & Compagnie Kommanditgesellschaft auf Aktien',0,1,NULL,0),
(109,517,5,'SE - Societas Europaea',0,1,NULL,0),
(110,518,5,'Stiftung',0,1,NULL,0),
(111,519,5,'gGmbH - gemeinnÃ¼tzige Gesellschaft mit beschrÃ¤nkter Haftung',0,1,NULL,0),
(112,520,5,'gUG - gemeinnÃ¼tzige Unternehmergesellschaft (haftungsbeschrÃ¤nkt)',0,1,NULL,0),
(113,8001,80,'Aktieselskab A/S',0,1,NULL,0),
(114,8002,80,'Anpartsselskab ApS',0,1,NULL,0),
(115,8003,80,'Personligt ejet mindre virksomhed PMV',1,1,NULL,0),
(116,8004,80,'IvÃ¦rksÃ¦tterselskab IVS',0,1,NULL,0),
(117,8005,80,'Interessentskab I/S',0,1,NULL,0),
(118,8006,80,'Holdingselskab',0,1,NULL,0),
(119,8007,80,'Selskab Med BegrÃ¦nset HÃ¦ftelse SMBA',0,1,NULL,0),
(120,8008,80,'Kommanditselskab K/S',0,1,NULL,0),
(121,8009,80,'SPE-selskab',0,1,NULL,0),
(122,8010,80,'Forening med begrÃ¦nset ansvar (f.m.b.a.)',0,1,NULL,0),
(123,8011,80,'Frivillig forening',1,1,NULL,0),
(124,8012,80,'Almindelig forening',1,1,NULL,0),
(125,8013,80,'Andelsboligforening',1,1,NULL,0),
(126,8014,80,'SÃ¦rlig forening',0,1,NULL,0),
(127,8015,80,'Enkeltmandsvirksomhed',0,1,NULL,0),
(128,10201,102,'Î‘Ï„Î¿Î¼Î¹ÎºÎ® ÎµÏ€Î¹Ï‡ÎµÎ¯ÏÎ·ÏƒÎ·',0,1,NULL,0),
(129,10202,102,'Î•Ï„Î±Î¹ÏÎ¹ÎºÎ®  ÎµÏ€Î¹Ï‡ÎµÎ¯ÏÎ·ÏƒÎ·',0,1,NULL,0),
(130,10203,102,'ÎŸÎ¼ÏŒÏÏÏ…Î¸Î¼Î· Î•Ï„Î±Î¹ÏÎµÎ¯Î± ÎŸ.Î•',0,1,NULL,0),
(131,10204,102,'Î•Ï„ÎµÏÏŒÏÏÏ…Î¸Î¼Î· Î•Ï„Î±Î¹ÏÎµÎ¯Î± Î•.Î•',0,1,NULL,0),
(132,10205,102,'Î•Ï„Î±Î¹ÏÎµÎ¯Î± Î ÎµÏÎ¹Î¿ÏÎ¹ÏƒÎ¼Î­Î½Î·Ï‚ Î•Ï…Î¸ÏÎ½Î·Ï‚ Î•.Î .Î•',0,1,NULL,0),
(133,10206,102,'Î‘Î½ÏŽÎ½Ï…Î¼Î· Î•Ï„Î±Î¹ÏÎµÎ¯Î± Î‘.Î•',0,1,NULL,0),
(134,10207,102,'Î‘Î½ÏŽÎ½Ï…Î¼Î· Î½Î±Ï…Ï„Î¹Î»Î¹Î±ÎºÎ® ÎµÏ„Î±Î¹ÏÎµÎ¯Î± Î‘.Î.Î•',0,1,NULL,0),
(135,10208,102,'Î£Ï…Î½ÎµÏ„Î±Î¹ÏÎ¹ÏƒÎ¼ÏŒÏ‚',0,1,NULL,0),
(136,10209,102,'Î£Ï…Î¼Ï€Î»Î¿Î¹Î¿ÎºÏ„Î·ÏƒÎ¯Î±',0,1,NULL,0),
(137,301,3,'SocietÃ  semplice',0,1,NULL,0),
(138,302,3,'SocietÃ  in nome collettivo s.n.c.',0,1,NULL,0),
(139,303,3,'SocietÃ  in accomandita semplice s.a.s.',0,1,NULL,0),
(140,304,3,'SocietÃ  per azioni s.p.a.',0,1,NULL,0),
(141,305,3,'SocietÃ  a responsabilitÃ  limitata s.r.l.',0,1,NULL,0),
(142,306,3,'SocietÃ  in accomandita per azioni s.a.p.a.',0,1,NULL,0),
(143,307,3,'SocietÃ  cooperativa a r.l.',0,1,NULL,0),
(144,308,3,'SocietÃ  consortile',0,1,NULL,0),
(145,309,3,'SocietÃ  europea',0,1,NULL,0),
(146,310,3,'SocietÃ  cooperativa europea',0,1,NULL,0),
(147,311,3,'SocietÃ  unipersonale',0,1,NULL,0),
(148,312,3,'SocietÃ  di professionisti',0,1,NULL,0),
(149,313,3,'SocietÃ  di fatto',0,1,NULL,0),
(150,315,3,'SocietÃ  apparente',0,1,NULL,0),
(151,316,3,'Impresa individuale ',0,1,NULL,0),
(152,317,3,'Impresa coniugale',0,1,NULL,0),
(153,318,3,'Impresa familiare',0,1,NULL,0),
(154,319,3,'Consorzio cooperativo',0,1,NULL,0),
(155,320,3,'SocietÃ  cooperativa sociale',0,1,NULL,0),
(156,321,3,'SocietÃ  cooperativa di consumo',0,1,NULL,0),
(157,322,3,'SocietÃ  cooperativa agricola',0,1,NULL,0),
(158,323,3,'A.T.I. Associazione temporanea di imprese',0,1,NULL,0),
(159,324,3,'R.T.I. Raggruppamento temporaneo di imprese',0,1,NULL,0),
(160,325,3,'Studio associato',0,1,NULL,0),
(161,600,6,'Raison Individuelle',0,1,NULL,0),
(162,601,6,'SociÃ©tÃ© Simple',0,1,NULL,0),
(163,602,6,'SociÃ©tÃ© en nom collectif',0,1,NULL,0),
(164,603,6,'SociÃ©tÃ© en commandite',0,1,NULL,0),
(165,604,6,'SociÃ©tÃ© anonyme (SA)',0,1,NULL,0),
(166,605,6,'SociÃ©tÃ© en commandite par actions',0,1,NULL,0),
(167,606,6,'SociÃ©tÃ© Ã  responsabilitÃ© limitÃ©e (SARL)',0,1,NULL,0),
(168,607,6,'SociÃ©tÃ© coopÃ©rative',0,1,NULL,0),
(169,608,6,'Association',0,1,NULL,0),
(170,609,6,'Fondation',0,1,NULL,0),
(171,700,7,'Sole Trader',0,1,NULL,0),
(172,701,7,'Partnership',0,1,NULL,0),
(173,702,7,'Private Limited Company by shares (LTD)',0,1,NULL,0),
(174,703,7,'Public Limited Company',0,1,NULL,0),
(175,704,7,'Workers Cooperative',0,1,NULL,0),
(176,705,7,'Limited Liability Partnership',0,1,NULL,0),
(177,706,7,'Franchise',0,1,NULL,0),
(178,1000,10,'SociÃ©tÃ© Ã  responsabilitÃ© limitÃ©e (SARL)',0,1,NULL,0),
(179,1001,10,'SociÃ©tÃ© en Nom Collectif (SNC)',0,1,NULL,0),
(180,1002,10,'SociÃ©tÃ© en Commandite Simple (SCS)',0,1,NULL,0),
(181,1003,10,'sociÃ©tÃ© en participation',0,1,NULL,0),
(182,1004,10,'SociÃ©tÃ© Anonyme (SA)',0,1,NULL,0),
(183,1005,10,'SociÃ©tÃ© Unipersonnelle Ã  ResponsabilitÃ© LimitÃ©e (SUARL)',0,1,NULL,0),
(184,1006,10,'Groupement d\'intÃ©rÃªt Ã©conomique (GEI)',0,1,NULL,0),
(185,1007,10,'Groupe de sociÃ©tÃ©s',0,1,NULL,0),
(186,1701,17,'Eenmanszaak',0,1,NULL,0),
(187,1702,17,'Maatschap',0,1,NULL,0),
(188,1703,17,'Vennootschap onder firma',0,1,NULL,0),
(189,1704,17,'Commanditaire vennootschap',0,1,NULL,0),
(190,1705,17,'Besloten vennootschap (BV)',0,1,NULL,0),
(191,1706,17,'Naamloze Vennootschap (NV)',0,1,NULL,0),
(192,1707,17,'Vereniging',0,1,NULL,0),
(193,1708,17,'Stichting',0,1,NULL,0),
(194,1709,17,'CoÃ¶peratie met beperkte aansprakelijkheid (BA)',0,1,NULL,0),
(195,1710,17,'CoÃ¶peratie met uitgesloten aansprakelijkheid (UA)',0,1,NULL,0),
(196,1711,17,'CoÃ¶peratie met wettelijke aansprakelijkheid (WA)',0,1,NULL,0),
(197,1712,17,'Onderlinge waarborgmaatschappij',0,1,NULL,0),
(198,401,4,'Empresario Individual',0,1,NULL,0),
(199,402,4,'Comunidad de Bienes',0,1,NULL,0),
(200,403,4,'Sociedad Civil',0,1,NULL,0),
(201,404,4,'Sociedad Colectiva',0,1,NULL,0),
(202,405,4,'Sociedad Limitada',0,1,NULL,0),
(203,406,4,'Sociedad AnÃ³nima',0,1,NULL,0),
(204,407,4,'Sociedad Comanditaria por Acciones',0,1,NULL,0),
(205,408,4,'Sociedad Comanditaria Simple',0,1,NULL,0),
(206,409,4,'Sociedad Laboral',0,1,NULL,0),
(207,410,4,'Sociedad Cooperativa',0,1,NULL,0),
(208,411,4,'Sociedad de GarantÃ­a RecÃ­proca',0,1,NULL,0),
(209,412,4,'Entidad de Capital-Riesgo',0,1,NULL,0),
(210,413,4,'AgrupaciÃ³n de InterÃ©s EconÃ³mico',0,1,NULL,0),
(211,414,4,'Sociedad de InversiÃ³n Mobiliaria',0,1,NULL,0),
(212,415,4,'AgrupaciÃ³n sin Ãnimo de Lucro',0,1,NULL,0),
(213,15201,152,'Mauritius Private Company Limited By Shares',0,1,NULL,0),
(214,15202,152,'Mauritius Company Limited By Guarantee',0,1,NULL,0),
(215,15203,152,'Mauritius Public Company Limited By Shares',0,1,NULL,0),
(216,15204,152,'Mauritius Foreign Company',0,1,NULL,0),
(217,15205,152,'Mauritius GBC1 (Offshore Company)',0,1,NULL,0),
(218,15206,152,'Mauritius GBC2 (International Company)',0,1,NULL,0),
(219,15207,152,'Mauritius General Partnership',0,1,NULL,0),
(220,15208,152,'Mauritius Limited Partnership',0,1,NULL,0),
(221,15209,152,'Mauritius Sole Proprietorship',0,1,NULL,0),
(222,15210,152,'Mauritius Trusts',0,1,NULL,0),
(223,15401,154,'601 - General de Ley Personas Morales',0,1,NULL,0),
(224,15402,154,'603 - Personas Morales con Fines no Lucrativos',0,1,NULL,0),
(225,15403,154,'605 - Sueldos y Salarios e Ingresos Asimilados a Salarios',0,1,NULL,0),
(226,15404,154,'606 - Arrendamiento',0,1,NULL,0),
(227,15405,154,'607 - RÃ©gimen de EnajenaciÃ³n o AdquisiciÃ³n de Bienes',0,1,NULL,0),
(228,15406,154,'608 - DemÃ¡s ingresos',0,1,NULL,0),
(229,15407,154,'610 - Residentes en el Extranjero sin Establecimiento Permanente en MÃ©xico',0,1,NULL,0),
(230,15408,154,'611 - Ingresos por Dividendos (socios y accionistas)',0,1,NULL,0),
(231,15409,154,'612 - Personas FÃ­sicas con Actividades Empresariales y Profesionales',0,1,NULL,0),
(232,15410,154,'614 - Ingresos por intereses',0,1,NULL,0),
(233,15411,154,'615 - RÃ©gimen de los ingresos por obtenciÃ³n de premios',0,1,NULL,0),
(234,15412,154,'616 - Sin obligaciones fiscales',0,1,NULL,0),
(235,15413,154,'620 - Sociedades Cooperativas de ProducciÃ³n que optan por diferir sus ingresos',0,1,NULL,0),
(236,15414,154,'621 - IncorporaciÃ³n Fiscal',0,1,NULL,0),
(237,15415,154,'622 - Actividades AgrÃ­colas, Ganaderas, SilvÃ­colas y Pesqueras',0,1,NULL,0),
(238,15416,154,'623 - Opcional para Grupos de Sociedades',0,1,NULL,0),
(239,15417,154,'624 - Coordinados',0,1,NULL,0),
(240,15418,154,'625 - RÃ©gimen de las Actividades Empresariales con ingresos a travÃ©s de Plataformas TecnolÃ³gicas',0,1,NULL,0),
(241,15419,154,'626 - RÃ©gimen Simplificado de Confianza',0,1,NULL,0),
(242,14001,140,'Entreprise individuelle',0,1,NULL,0),
(243,14002,140,'SociÃ©tÃ© en nom collectif (SENC)',0,1,NULL,0),
(244,14003,140,'SociÃ©tÃ© en commandite simple (SECS)',0,1,NULL,0),
(245,14004,140,'SociÃ©tÃ© en commandite par actions (SECA)',0,1,NULL,0),
(246,14005,140,'SociÃ©tÃ© Ã  responsabilitÃ© limitÃ©e (SARL)',0,1,NULL,0),
(247,14006,140,'SociÃ©tÃ© anonyme (SA)',0,1,NULL,0),
(248,14007,140,'SociÃ©tÃ© coopÃ©rative (SC)',0,1,NULL,0),
(249,14008,140,'SociÃ©tÃ© europÃ©enne (SE)',0,1,NULL,0),
(250,14009,140,'SociÃ©tÃ© Ã  responsabilitÃ© limitÃ©e simplifiÃ©e (SARL-S)',0,1,NULL,0),
(251,18801,188,'AFJ - Alte forme juridice',0,1,NULL,0),
(252,18802,188,'ASF - Asociatie familialÃ£',0,1,NULL,0),
(253,18803,188,'CON - Concesiune',0,1,NULL,0),
(254,18804,188,'CRL - Soc civilÃ£ profesionala cu pers. juridica si rÃ£spundere limitata (SPRL)',0,1,NULL,0),
(255,18805,188,'INC - ÃŽnchiriere',0,1,NULL,0),
(256,18806,188,'LOC - LocaÅ£ie de gestiune',0,1,NULL,0),
(257,18807,188,'OC1 - OrganizaÅ£ie cooperatistÃ£ meÅŸteÅŸugÃ£reascÃ£',0,1,NULL,0),
(258,18808,188,'OC2 - OrganizaÅ£ie cooperatistÃ£ de consum',0,1,NULL,0),
(259,18809,188,'OC3 - OrganizaÅ£ie cooperatistÃ£ de credit',0,1,NULL,0),
(260,18810,188,'PFA - PersoanÃ£ fizicÃ£ independentÃ£',0,1,NULL,0),
(261,18811,188,'RA - Regie autonomÃ£',0,1,NULL,0),
(262,18812,188,'SA - Societate comercialÃ£ pe acÅ£iuni',0,1,NULL,0),
(263,18813,188,'SCS - Societate comercialÃ£ Ã®n comanditÃ£ simplÃ£',0,1,NULL,0),
(264,18814,188,'SNC - Societate comercialÃ£ Ã®n nume colectiv',0,1,NULL,0),
(265,18815,188,'SPI - Societate profesionala practicieni in insolventa (SPPI)',0,1,NULL,0),
(266,18816,188,'SRL - Societate comercialÃ£ cu rÃ£spundere limitatÃ£',0,1,NULL,0),
(267,18817,188,'URL - Intreprindere profesionala unipersonala cu rÃ£spundere limitata (IPURL)',0,1,NULL,0),
(268,17801,178,'Empresa individual',0,1,NULL,0),
(269,17802,178,'AsociaciÃ³n General',0,1,NULL,0),
(270,17803,178,'Sociedad de Responsabilidad Limitada',0,1,NULL,0),
(271,17804,178,'Sociedad Civil',0,1,NULL,0),
(272,17805,178,'Sociedad AnÃ³nima',0,1,NULL,0),
(273,1300,13,'Personne physique',0,1,NULL,0),
(274,1301,13,'SociÃ©tÃ© Ã  responsabilitÃ© limitÃ©e (SARL)',0,1,NULL,0),
(275,1302,13,'Entreprise unipersonnelle Ã  responsabilitÃ© limitÃ©e (EURL)',0,1,NULL,0),
(276,1303,13,'SociÃ©tÃ© en Nom Collectif (SNC)',0,1,NULL,0),
(277,1304,13,'sociÃ©tÃ© par actions (SPA)',0,1,NULL,0),
(278,1305,13,'SociÃ©tÃ© en Commandite Simple (SCS)',0,1,NULL,0),
(279,1306,13,'SociÃ©tÃ© en commandite par actions (SCA)',0,1,NULL,0),
(280,1307,13,'SociÃ©tÃ© en participation',0,1,NULL,0),
(281,1308,13,'Groupe de sociÃ©tÃ©s',0,1,NULL,0),
(282,2001,20,'Aktiebolag',0,1,NULL,0),
(283,2002,20,'Publikt aktiebolag (AB publ)',0,1,NULL,0),
(284,2003,20,'Ekonomisk fÃ¶rening (ek. fÃ¶r.)',0,1,NULL,0),
(285,2004,20,'BostadsrÃ¤ttsfÃ¶rening (BRF)',0,1,NULL,0),
(286,2005,20,'HyresrÃ¤ttsfÃ¶rening (HRF)',0,1,NULL,0),
(287,2006,20,'Kooperativ',0,1,NULL,0),
(288,2007,20,'Enskild firma (EF)',0,1,NULL,0),
(289,2008,20,'Handelsbolag (HB)',0,1,NULL,0),
(290,2009,20,'Kommanditbolag (KB)',0,1,NULL,0),
(291,2010,20,'Enkelt bolag',0,1,NULL,0),
(292,2011,20,'Ideell fÃ¶rening',0,1,NULL,0),
(293,2012,20,'Stiftelse',0,1,NULL,0),
(294,6100,61,'IndÃ©pendant - Personne physique',0,1,NULL,0),
(295,6101,61,'SociÃ©tÃ© Unipersonnelle',0,1,NULL,0),
(296,6102,61,'SociÃ©tÃ© de personne Ã  responsabilitÃ© limitÃ© (SPRL)',0,1,NULL,0),
(297,6103,61,'SociÃ©tÃ© anonyme (SA)',0,1,NULL,0),
(298,6104,61,'SociÃ©tÃ© coopÃ©rative',0,1,NULL,0),
(299,7601,76,'DruÅ¡tvo s ograniÄenom odgovornoÅ¡Ä‡u (d.o.o.)',0,1,NULL,0),
(300,7602,76,'Jednostavno druÅ¡tvo s ograniÄenom odgovornoÅ¡Ä‡u (j.d.o.o.)',0,1,NULL,0),
(301,7603,76,'DioniÄko druÅ¡tvo (d.d.)',0,1,NULL,0),
(302,7604,76,'Obrt',0,1,NULL,0),
(303,7605,76,'Javno trgovaÄko druÅ¡tvo (j.t.d.)',0,1,NULL,0),
(304,7606,76,'Komanditno druÅ¡tvo (k.d.)',0,1,NULL,0),
(305,7607,76,'Gospodarsko interesno udruÅ¾enje (GIU)',0,1,NULL,0),
(306,7608,76,'PredstavniÅ¡tvo',0,1,NULL,0),
(307,7609,76,'DrÅ¾avno tijelo',0,1,NULL,0),
(308,7610,76,'KuÄ‡na radinost',0,1,NULL,0),
(309,7611,76,'Sporedno zanimanje',0,1,NULL,0),
(310,12301,123,'æ ªå¼ä¼šç¤¾',0,1,NULL,0),
(311,12302,123,'æœ‰é™ä¼šç¤¾',0,1,NULL,0),
(312,12303,123,'åˆè³‡ä¼šç¤¾',0,1,NULL,0),
(313,12304,123,'åˆåä¼šç¤¾',0,1,NULL,0),
(314,12305,123,'ç›¸äº’ä¼šç¤¾',0,1,NULL,0),
(315,12306,123,'åŒ»ç™‚æ³•äºº',0,1,NULL,0),
(316,12307,123,'è²¡å›£æ³•äºº',0,1,NULL,0),
(317,12308,123,'ç¤¾å›£æ³•äºº',0,1,NULL,0),
(318,12309,123,'ç¤¾ä¼šç¦ç¥‰æ³•äºº',0,1,NULL,0),
(319,12310,123,'å­¦æ ¡æ³•äºº',0,1,NULL,0),
(320,12311,123,'ç‰¹å®šéžå–¶åˆ©æ´»å‹•æ³•äºº',0,1,NULL,0),
(321,12312,123,'ï¼®ï¼°ï¼¯æ³•äºº',0,1,NULL,0),
(322,12313,123,'å•†å·¥çµ„åˆ',0,1,NULL,0),
(323,12314,123,'æž—æ¥­çµ„åˆ',0,1,NULL,0),
(324,12315,123,'åŒæ¥­çµ„åˆ',0,1,NULL,0),
(325,12316,123,'è¾²æ¥­å”åŒçµ„åˆ',0,1,NULL,0),
(326,12317,123,'æ¼æ¥­å”åŒçµ„åˆ',0,1,NULL,0),
(327,12318,123,'è¾²äº‹çµ„åˆæ³•äºº',0,1,NULL,0),
(328,12319,123,'ç”Ÿæ´»äº’åŠ©ä¼š',0,1,NULL,0),
(329,12320,123,'å”æ¥­çµ„åˆ',0,1,NULL,0),
(330,12321,123,'å”åŒçµ„åˆ',0,1,NULL,0),
(331,12322,123,'ç”Ÿæ´»å”åŒçµ„åˆ',0,1,NULL,0),
(332,12323,123,'é€£åˆä¼š',0,1,NULL,0),
(333,12324,123,'çµ„åˆé€£åˆä¼š',0,1,NULL,0),
(334,12325,123,'å”åŒçµ„åˆé€£åˆä¼š',0,1,NULL,0),
(335,12329,123,'ä¸€èˆ¬ç¤¾å›£æ³•äºº',0,1,NULL,0),
(336,12330,123,'å…¬ç›Šç¤¾å›£æ³•äºº',0,1,NULL,0),
(337,12331,123,'ä¸€èˆ¬è²¡å›£æ³•äºº',0,1,NULL,0),
(338,12332,123,'å…¬ç›Šè²¡å›£æ³•äºº',0,1,NULL,0),
(339,12333,123,'åˆåŒä¼šç¤¾',0,1,NULL,0),
(340,12399,123,'å€‹äººåˆã¯ãã®ä»–ã®æ³•äºº',0,1,NULL,0),
(341,1651,165,'Personne physique',0,1,NULL,0),
(342,16521,165,'Indivision',0,1,NULL,0),
(343,16522,165,'SociÃ©tÃ© crÃ©Ã©e de fait',0,1,NULL,0),
(344,16523,165,'SociÃ©tÃ© en participation',0,1,NULL,0),
(345,16524,165,'Fiducie',0,1,NULL,0),
(346,16529,165,'Autre groupement de droit privÃ© non dotÃ© de la personnalitÃ© morale',0,1,NULL,0),
(347,16531,165,'Personne morale de droit Ã©tranger, immatriculÃ©e au RCS',0,1,NULL,0),
(348,16532,165,'Personne morale de droit Ã©tranger, non immatriculÃ©e au RCS',0,1,NULL,0),
(349,16541,165,'Etablissement public ou rÃ©gie Ã  caractÃ¨re industriel ou commercial (EPIC)',0,1,NULL,0),
(350,16551,165,'SociÃ©tÃ© coopÃ©rative commerciale particuliÃ¨re',0,1,NULL,0),
(351,16552,165,'SociÃ©tÃ© en nom collectif (SNC)',0,1,NULL,0),
(352,16553,165,'SociÃ©tÃ© en commandite',0,1,NULL,0),
(353,16554,165,'SociÃ©tÃ© Ã  responsabilitÃ© limitÃ©e (SARL)',0,1,NULL,0),
(354,16555,165,'SociÃ©tÃ© anonyme Ã  conseil d\'administration (SA)',0,1,NULL,0),
(355,16556,165,'SociÃ©tÃ© anonyme Ã  directoire (SA)',0,1,NULL,0),
(356,16557,165,'SociÃ©tÃ© par actions simplifiÃ©e (SAS)',0,1,NULL,0),
(357,16561,165,'Caisse d\'Ã©pargne et de prÃ©voyance',0,1,NULL,0),
(358,16562,165,'Groupement d\'intÃ©rÃªt Ã©conomique (GIE)',0,1,NULL,0),
(359,16563,165,'SociÃ©tÃ© coopÃ©rative agricole',0,1,NULL,0),
(360,16564,165,'SociÃ©tÃ© d\'assurance mutuelle',0,1,NULL,0),
(361,16565,165,'SociÃ©tÃ© civile',0,1,NULL,0),
(362,16569,165,'Autre personne morale de droit privÃ© inscrite au RCS',0,1,NULL,0),
(363,16571,165,'Administration de l\'Ã‰tat',0,1,NULL,0),
(364,16572,165,'CollectivitÃ© territoriale',0,1,NULL,0),
(365,16573,165,'Etablissement public administratif (EPA)',0,1,NULL,0),
(366,16574,165,'Personne morale de droit public administratif',0,1,NULL,0),
(367,16581,165,'Organisme gÃ©rant rÃ©gime de protection social Ã  adhÃ©sion obligatoire',0,1,NULL,0),
(368,16582,165,'Organisme mutualiste',0,1,NULL,0),
(369,16583,165,'ComitÃ© d\'entreprise',0,1,NULL,0),
(370,16584,165,'Organisme professionnel',0,1,NULL,0),
(371,16591,165,'Syndicat de propriÃ©taires',0,1,NULL,0),
(372,16592,165,'Association loi 1901 ou assimilÃ©',0,1,NULL,0),
(373,16593,165,'Fondation',0,1,NULL,0),
(374,16599,165,'Autre personne morale de droit privÃ©',0,1,NULL,0),
(375,1656901,165,'Groupement de droit particulier local (GDPL)',0,1,NULL,0);
/*!40000 ALTER TABLE `llx_c_forme_juridique` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_holiday_types`
--

DROP TABLE IF EXISTS `llx_c_holiday_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_holiday_types` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `code` varchar(16) NOT NULL,
  `label` varchar(255) NOT NULL,
  `affect` int(11) NOT NULL,
  `delay` int(11) NOT NULL,
  `newbymonth` double(8,5) NOT NULL DEFAULT 0.00000,
  `fk_country` int(11) DEFAULT NULL,
  `block_if_negative` int(11) NOT NULL DEFAULT 0,
  `sortorder` smallint(6) DEFAULT NULL,
  `active` int(11) DEFAULT 1,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_holiday_types` (`entity`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_holiday_types`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_holiday_types` WRITE;
/*!40000 ALTER TABLE `llx_c_holiday_types` DISABLE KEYS */;
INSERT INTO `llx_c_holiday_types` VALUES
(1,1,'LEAVE_SICK','Sick leave',0,0,0.00000,NULL,0,1,1),
(2,1,'LEAVE_OTHER','Other leave',0,0,0.00000,NULL,0,2,1),
(3,1,'LEAVE_PAID','Paid vacation',1,7,0.00000,NULL,0,3,0),
(4,1,'LEAVE_RTT_FR','RTT',1,7,0.83000,1,0,4,1),
(5,1,'LEAVE_PAID_FR','Paid vacation',1,30,2.08334,1,0,5,1),
(6,1,'5D1Y','ÎšÎ±Î½Î¿Î½Î¹ÎºÎ® Î¬Î´ÎµÎ¹Î±(Î ÎµÎ½Î¸Î®Î¼ÎµÏÎ¿ 1Î¿ Î­Ï„Î¿Ï‚)',1,0,1.66700,102,0,6,1),
(7,1,'5D2Y','ÎšÎ±Î½Î¿Î½Î¹ÎºÎ® Î¬Î´ÎµÎ¹Î±(Î ÎµÎ½Î¸Î®Î¼ÎµÏÎ¿ 2Î¿ Î­Ï„Î¿Ï‚)',1,0,1.75000,102,0,7,1),
(8,1,'5D3-10Y','ÎšÎ±Î½Î¿Î½Î¹ÎºÎ® Î¬Î´ÎµÎ¹Î±(Î ÎµÎ½Î¸Î®Î¼ÎµÏÎ¿ 3Î¿ Î­Ï‰Ï‚ 10Î¿ Î­Ï„Î¿Ï‚)',1,0,1.83300,102,0,8,1),
(9,1,'5D10-25Y','ÎšÎ±Î½Î¿Î½Î¹ÎºÎ® Î¬Î´ÎµÎ¹Î±(Î ÎµÎ½Î¸Î®Î¼ÎµÏÎ¿ 10Î¿ Î­Ï‰Ï‚ 25Î¿ Î­Ï„Î¿Ï‚)',1,0,2.08300,102,0,9,1),
(10,1,'5D25+Y','ÎšÎ±Î½Î¿Î½Î¹ÎºÎ® Î¬Î´ÎµÎ¹Î±(Î ÎµÎ½Î¸Î®Î¼ÎµÏÎ¿ 25+ Î­Ï„Î·)',1,0,2.16600,102,0,10,1),
(11,1,'6D1Y','ÎšÎ±Î½Î¿Î½Î¹ÎºÎ® Î¬Î´ÎµÎ¹Î±(Î•Î¾Î±Î®Î¼ÎµÏÎ¿ 1Î¿ Î­Ï„Î¿Ï‚)',1,0,2.00000,102,0,11,1),
(12,1,'6D2Y','ÎšÎ±Î½Î¿Î½Î¹ÎºÎ® Î¬Î´ÎµÎ¹Î±(Î•Î¾Î±Î®Î¼ÎµÏÎ¿ 2Î¿ Î­Ï„Î¿Ï‚)',1,0,2.08300,102,0,12,1),
(13,1,'6D3-10Y','ÎšÎ±Î½Î¿Î½Î¹ÎºÎ® Î¬Î´ÎµÎ¹Î±(Î•Î¾Î±Î®Î¼ÎµÏÎ¿ 3Î¿ Î­Ï‰Ï‚ 10Î¿ Î­Ï„Î¿Ï‚)',1,0,2.16600,102,0,13,1),
(14,1,'6D10-25Y','ÎšÎ±Î½Î¿Î½Î¹ÎºÎ® Î¬Î´ÎµÎ¹Î±(Î•Î¾Î±Î®Î¼ÎµÏÎ¿ 10Î¿ Î­Ï‰Ï‚ 25Î¿ Î­Ï„Î¿Ï‚)',1,0,2.08300,102,0,14,1),
(15,1,'6D25+Y','ÎšÎ±Î½Î¿Î½Î¹ÎºÎ® Î¬Î´ÎµÎ¹Î±(Î•Î¾Î±Î®Î¼ÎµÏÎ¿ 25+ Î­Ï„Î·)',1,0,2.16600,102,0,15,1),
(16,1,'5D-WED','Î ÎµÎ½Î¸Î®Î¼ÎµÏÎ· Î¬Î´ÎµÎ¹Î± Î³Î¬Î¼Î¿Ï…(Î¼Îµ Î±Ï€Î¿Î´Î¿Ï‡Î­Ï‚)',0,0,0.00000,102,0,16,0),
(17,1,'6D-WED','Î•Î¾Î±Î®Î¼ÎµÏÎ· Î¬Î´ÎµÎ¹Î± Î³Î¬Î¼Î¿Ï…(Î¼Îµ Î±Ï€Î¿Î´Î¿Ï‡Î­Ï‚)',0,0,0.00000,102,0,17,0),
(18,1,'7D-AR','Î•Ï€Ï„Î±Î®Î¼ÎµÏÎ· Î¬Î´ÎµÎ¹Î± Î¹Î±Ï„ÏÎ¹ÎºÏŽÏ‚ Ï…Ï€Î¿Î²Î¿Î·Î¸Î¿ÏÎ¼ÎµÎ½Î·Ï‚ Î±Î½Î±Ï€Î±ÏÎ±Î³Ï‰Î³Î®Ï‚(Î¼Îµ Î±Ï€Î¿Î´Î¿Ï‡Î­Ï‚)',0,0,0.00000,102,0,18,0),
(19,1,'1D-BC','ÎœÎ¿Î½Î¿Î®Î¼ÎµÏÎ· Î¬Î´ÎµÎ¹Î± Ï€ÏÎ¿Î³ÎµÎ½Î½Î·Ï„Î¹ÎºÏŽÎ½ ÎµÎ¾ÎµÏ„Î¬ÏƒÎµÏ‰Î½(Î¼Îµ Î±Ï€Î¿Î´Î¿Ï‡Î­Ï‚)',0,0,0.00000,102,0,19,0),
(20,1,'1D-GYN','ÎœÎ¿Î½Î¿Î®Î¼ÎµÏÎ· Î¬Î´ÎµÎ¹Î± Î³Ï…Î½Î±Î¹ÎºÎ¿Î»Î¿Î³Î¹ÎºÎ¿Ï ÎµÎ»Î­Î³Ï‡Î¿Ï…(Î¼Îµ Î±Ï€Î¿Î´Î¿Ï‡Î­Ï‚)',0,0,0.00000,102,0,20,0),
(21,1,'149D-ML','Î†Î´ÎµÎ¹Î± ÎœÎ·Ï„ÏÏŒÏ„Î·Ï„Î±Ï‚ (Î†Î´ÎµÎ¹Î± ÎºÏÎ·ÏƒÎ·Ï‚ â€“ Î»Î¿Ï‡ÎµÎ¯Î±Ï‚)56 Î·Î¼Î­ÏÎµÏ‚ Ï€ÏÎ¹Î½-93 Î·Î¼Î­ÏÎµÏ‚ Î¼ÎµÏ„Î±(Î¼Îµ Î±Ï€Î¿Î´Î¿Ï‡Î­Ï‚)',0,0,0.00000,102,0,21,0),
(22,1,'14D-PL','14Î®Î¼ÎµÏÎ· Î†Î´ÎµÎ¹Î± Ï€Î±Ï„ÏÏŒÏ„Î·Ï„Î±Ï‚(Î¼Îµ Î±Ï€Î¿Î´Î¿Ï‡Î­Ï‚)',0,0,0.00000,102,0,22,0),
(23,1,'1-2H-CC','Î†Î´ÎµÎ¹Î± Ï†ÏÎ¿Î½Ï„Î¯Î´Î±Ï‚ Ï€Î±Î¹Î´Î¹ÏŽÎ½ (Î¼ÎµÎ¹Ï‰Î¼Î­Î½Î¿ Ï‰ÏÎ¬ÏÎ¹Î¿  https://www.kepea.gr/aarticle.php?id=1984)',0,0,0.00000,102,0,23,0),
(24,1,'9M-M','Î•Î¹Î´Î¹ÎºÎ® Î¬Î´ÎµÎ¹Î± Ï€ÏÎ¿ÏƒÏ„Î±ÏƒÎ¯Î±Ï‚ Î¼Î·Ï„ÏÏŒÏ„Î·Ï„Î±Ï‚ 9 Î¼Î·Î½ÏŽÎ½(Ï‡Ï‰ÏÎ¯Ï‚ Î±Ï€Î¿Î´Î¿Ï‡Î­Ï‚)',0,0,0.00000,102,0,24,0),
(25,1,'4M-M','Î¤ÎµÏ„ÏÎ¬Î¼Î·Î½Î· Î³Î¿Î½Î¹ÎºÎ® Î†Î´ÎµÎ¹Î± Î‘Î½Î±Ï„ÏÎ¿Ï†Î®Ï‚ Î¤Î­ÎºÎ½Ï‰Î½(Ï‡Ï‰ÏÎ¯Ï‚ Î±Ï€Î¿Î´Î¿Ï‡Î­Ï‚)',0,0,0.00000,102,0,25,0),
(26,1,'6-8D-SP','Î•Î¾Î±Î®Î¼ÎµÏÎ· Î® ÎŸÎºÏ„Î±Î®Î¼ÎµÏÎ· Î†Î´ÎµÎ¹Î± Î³Î¹Î± Î¼Î¿Î½Î¿Î³Î¿Î½ÎµÏŠÎºÎ­Ï‚ Î¿Î¹ÎºÎ¿Î³Î­Î½ÎµÎ¹ÎµÏ‚(Î¼Îµ Î±Ï€Î¿Î´Î¿Ï‡Î­Ï‚)',0,0,0.00000,102,0,26,0),
(27,1,'6-8-14D-FC','Î‘Î½Î±ÏÏÏ‰Ï„Î¹ÎºÎ® Î¬Î´ÎµÎ¹Î± (Î¬Î½ÎµÏ… Î±Ï€Î¿Î´Î¿Ï‡ÏŽÎ½, 6 Î·Î¼Î­ÏÎµÏ‚/Î­Ï„Î¿Ï‚ Î³Î¹Î± Î­Î½Î± Ï€Î±Î¹Î´Î¯ - 8 Î·Î¼Î­ÏÎµÏ‚/Î­Ï„Î¿Ï‚ Î³Î¹Î± Î´ÏÎ¿ ÎºÎ±Î¹ 14 Î·Î¼Î­ÏÎµÏ‚/Î­Ï„Î¿Ï‚ Î³Î¹Î± Ï„ÏÎ¯Î± Î® Ï€ÎµÏÎ¹ÏƒÏƒÏŒÏ„ÎµÏÎ±)',0,0,0.00000,102,0,27,0),
(28,1,'10D-CD','Î”ÎµÎºÎ±Î®Î¼ÎµÏÎ· Î“Î¿Î½Î¹ÎºÎ® Î†Î´ÎµÎ¹Î± Î³Î¹Î± Ï€Î±Î¹Î´Î¯ Î¼Îµ ÏƒÎ¿Î²Î±ÏÎ¬ Î½Î¿ÏƒÎ®Î¼Î±Ï„Î± ÎºÎ±Î¹ Î»ÏŒÎ³Ï‰ Î½Î¿ÏƒÎ·Î»ÎµÎ¯Î±Ï‚ Ï€Î±Î¹Î´Î¹ÏŽÎ½(Î¼Îµ Î±Ï€Î¿Î´Î¿Ï‡Î­Ï‚)',0,0,0.00000,102,0,28,0),
(29,1,'30D-CD','Î†Î´ÎµÎ¹Î± Î»ÏŒÎ³Ï‰ Î½Î¿ÏƒÎ·Î»ÎµÎ¯Î±Ï‚ Ï„Ï‰Î½ Ï€Î±Î¹Î´Î¹ÏŽÎ½(Î­Ï‰Ï‚ 30 Î·Î¼Î­ÏÎµÏ‚/Î­Ï„Î¿Ï‚ Ï‡Ï‰ÏÎ¯Ï‚ Î±Ï€Î¿Î´Î¿Ï‡Î­Ï‚)',0,0,0.00000,102,0,29,0),
(30,1,'5D-CG','Î†Î´ÎµÎ¹Î± Ï†ÏÎ¿Î½Ï„Î¹ÏƒÏ„Î®(Î­Ï‰Ï‚ 5 Î·Î¼Î­ÏÎµÏ‚/Î­Ï„Î¿Ï‚ Ï‡Ï‰ÏÎ¯Ï‚ Î±Ï€Î¿Î´Î¿Ï‡Î­Ï‚)',0,0,0.00000,102,0,30,0),
(31,1,'2D-CG','Î†Î´ÎµÎ¹Î± Î±Ï€Î¿Ï…ÏƒÎ¯Î±Ï‚ Î±Ï€ÏŒ Ï„Î·Î½ ÎµÏÎ³Î±ÏƒÎ¯Î± Î³Î¹Î± Î»ÏŒÎ³Î¿Ï…Ï‚ Î±Î½Ï‰Ï„Î­ÏÎ±Ï‚ Î²Î¯Î±Ï‚(Î­Ï‰Ï‚ 2 Î·Î¼Î­ÏÎµÏ‚/Î­Ï„Î¿Ï‚ Î¼Îµ Î±Ï€Î¿Î´Î¿Ï‡Î­Ï‚)',0,0,0.00000,102,0,31,0),
(32,1,'2D-SC','Î†Î´ÎµÎ¹Î± Î³Î¹Î± Ï€Î±ÏÎ±ÎºÎ¿Î»Î¿ÏÎ¸Î·ÏƒÎ· ÏƒÏ‡Î¿Î»Î¹ÎºÎ®Ï‚ ÎµÏ€Î¯Î´Î¿ÏƒÎ·Ï‚(Î­Ï‰Ï‚ 2 Î·Î¼Î­ÏÎµÏ‚/Î­Ï„Î¿Ï‚ Î¼Îµ Î±Ï€Î¿Î´Î¿Ï‡Î­Ï‚)',0,0,0.00000,102,0,32,0),
(33,1,'1D-BD','ÎœÎ¿Î½Î¿Î®Î¼ÎµÏÎ· Î¬Î´ÎµÎ¹Î± Î±Î¹Î¼Î¿Î´Î¿ÏƒÎ¯Î±Ï‚(Î¼Îµ Î±Ï€Î¿Î´Î¿Ï‡Î­Ï‚)',0,0,0.00000,102,0,33,0),
(34,1,'22D-BT','Î†Î´ÎµÎ¹Î± Î³Î¹Î± Î¼ÎµÏ„Î¬Î³Î³Î¹ÏƒÎ· Î±Î¯Î¼Î±Ï„Î¿Ï‚ & Î±Î¹Î¼Î¿ÎºÎ¬Î¸Î±ÏÏƒÎ·(Î­Ï‰Ï‚ 22 Î·Î¼Î­ÏÎµÏ‚/Î­Ï„Î¿Ï‚ Î¼Îµ Î±Ï€Î¿Î´Î¿Ï‡Î­Ï‚)',0,0,0.00000,102,0,34,0),
(35,1,'30D-HIV','Î†Î´ÎµÎ¹Î± Î»ÏŒÎ³Ï‰ AIDS(Î­Ï‰Ï‚ Î­Î½Î± (1) Î¼Î®Î½Î±/Î­Ï„Î¿Ï‚ Î¼Îµ Î±Ï€Î¿Î´Î¿Ï‡Î­Ï‚)',0,0,0.00000,102,0,35,0),
(36,1,'20D-CD','Î†Î´ÎµÎ¹Î± Ï€ÎµÎ½Î¸Î¿ÏÎ½Ï„Ï‰Î½ Î³Î¿Î½Î­Ï‰Î½(20 Î·Î¼Î­ÏÎµÏ‚ Î¼Îµ Î±Ï€Î¿Î´Î¿Ï‡Î­Ï‚)',0,0,0.00000,102,0,36,0),
(37,1,'2D-FD','Î†Î´ÎµÎ¹Î± Î»ÏŒÎ³Ï‰ Î¸Î±Î½Î¬Ï„Î¿Ï… ÏƒÏ…Î³Î³ÎµÎ½Î¿ÏÏ‚(2 Î·Î¼Î­ÏÎµÏ‚ Î¼Îµ Î±Ï€Î¿Î´Î¿Ï‡Î­Ï‚)',0,0,0.00000,102,0,37,0),
(38,1,'DIS','Î†Î´ÎµÎ¹ÎµÏ‚ Î±Î½Î±Ï€Î®ÏÏ‰Î½(30 Î·Î¼Î­ÏÎµÏ‚ Î¼Îµ Î±Ï€Î¿Î´Î¿Ï‡Î­Ï‚)',0,0,0.00000,102,0,38,0),
(39,1,'SE','Î†Î´ÎµÎ¹Î± ÎµÎ¾ÎµÏ„Î¬ÏƒÎµÏ‰Î½ Î¼Î±Î¸Î·Ï„ÏŽÎ½, ÏƒÏ€Î¿Ï…Î´Î±ÏƒÏ„ÏŽÎ½, Ï†Î¿Î¹Ï„Î·Ï„ÏŽÎ½(30 Î·Î¼Î­ÏÎµÏ‚ Ï‡Ï‰ÏÎ¯Ï‚ Î±Ï€Î¿Î´Î¿Ï‡Î­Ï‚)',0,0,0.00000,102,0,39,0),
(40,1,'NOT PAID','Î†Î´ÎµÎ¹Î± Î¬Î½ÎµÏ… Î±Ï€Î¿Î´Î¿Ï‡ÏŽÎ½(Î­Ï‰Ï‚ Î­Î½Î± (1) Î­Ï„Î¿Ï‚)',0,0,0.00000,102,0,40,0);
/*!40000 ALTER TABLE `llx_c_holiday_types` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_hrm_department`
--

DROP TABLE IF EXISTS `llx_c_hrm_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_hrm_department` (
  `rowid` int(11) NOT NULL,
  `pos` tinyint(4) NOT NULL DEFAULT 0,
  `code` varchar(16) NOT NULL,
  `label` varchar(128) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_hrm_department`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_hrm_department` WRITE;
/*!40000 ALTER TABLE `llx_c_hrm_department` DISABLE KEYS */;
INSERT INTO `llx_c_hrm_department` VALUES
(1,5,'MANAGEMENT','Management',1),
(3,15,'TRAINING','Training',1),
(4,20,'IT','Inform. Technology (IT)',0),
(5,25,'MARKETING','Marketing',0),
(6,30,'SALES','Sales',1),
(7,35,'LEGAL','Legal',0),
(8,40,'FINANCIAL','Financial accounting',1),
(9,45,'HUMANRES','Human resources',1),
(10,50,'PURCHASING','Purchasing',1),
(12,60,'CUSTOMSERV','Customer service',0),
(14,70,'LOGISTIC','Logistics',1),
(15,75,'CONSTRUCT','Engineering/design',0),
(16,80,'PRODUCTION','Production',1),
(17,85,'QUALITY','Quality assurance',0);
/*!40000 ALTER TABLE `llx_c_hrm_department` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_hrm_function`
--

DROP TABLE IF EXISTS `llx_c_hrm_function`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_hrm_function` (
  `rowid` int(11) NOT NULL,
  `pos` tinyint(4) NOT NULL DEFAULT 0,
  `code` varchar(16) NOT NULL,
  `label` varchar(128) DEFAULT NULL,
  `c_level` tinyint(4) NOT NULL DEFAULT 0,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_hrm_function`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_hrm_function` WRITE;
/*!40000 ALTER TABLE `llx_c_hrm_function` DISABLE KEYS */;
INSERT INTO `llx_c_hrm_function` VALUES
(1,5,'EXECBOARD','Executive board',0,1),
(2,10,'MANAGDIR','Managing director',1,1),
(3,15,'ACCOUNTMANAG','Account manager',0,1),
(4,20,'ENGAGDIR','Engagement director',1,1),
(5,25,'DIRECTOR','Director',1,1),
(6,30,'PROJMANAG','Project manager',0,1),
(7,35,'DEPHEAD','Department head',0,1),
(8,40,'SECRETAR','Secretary',0,1),
(9,45,'EMPLOYEE','Department employee',0,1);
/*!40000 ALTER TABLE `llx_c_hrm_function` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_hrm_public_holiday`
--

DROP TABLE IF EXISTS `llx_c_hrm_public_holiday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_hrm_public_holiday` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_country` int(11) DEFAULT NULL,
  `fk_departement` int(11) DEFAULT NULL,
  `code` varchar(62) DEFAULT NULL,
  `dayrule` varchar(64) DEFAULT '',
  `day` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `active` int(11) DEFAULT 1,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_c_hrm_public_holiday` (`entity`,`code`),
  UNIQUE KEY `uk_c_hrm_public_holiday2` (`entity`,`fk_country`,`dayrule`,`day`,`month`,`year`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_hrm_public_holiday`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_hrm_public_holiday` WRITE;
/*!40000 ALTER TABLE `llx_c_hrm_public_holiday` DISABLE KEYS */;
INSERT INTO `llx_c_hrm_public_holiday` VALUES
(1,1,0,NULL,'NEWYEARDAY1','',1,1,0,1,NULL),
(2,1,0,NULL,'LABORDAY1','',1,5,0,1,NULL),
(3,1,0,NULL,'ASSOMPTIONDAY1','',15,8,0,1,NULL),
(4,1,0,NULL,'CHRISTMASDAY1','',25,12,0,1,NULL),
(5,1,1,NULL,'FR-VICTORYDAY','',8,5,0,1,NULL),
(6,1,1,NULL,'FR-NATIONALDAY','',14,7,0,1,NULL),
(7,1,1,NULL,'FR-ASSOMPTION','',15,8,0,1,NULL),
(8,1,1,NULL,'FR-TOUSSAINT','',1,11,0,1,NULL),
(9,1,1,NULL,'FR-ARMISTICE','',11,11,0,1,NULL),
(10,1,1,NULL,'FR-EASTER','eastermonday',0,0,0,1,NULL),
(11,1,1,NULL,'FR-ASCENSION','ascension',0,0,0,1,NULL),
(12,1,1,NULL,'FR-PENTECOST','pentecost',0,0,0,1,NULL),
(13,1,2,NULL,'BE-VICTORYDAY','',8,5,0,1,NULL),
(14,1,2,NULL,'BE-NATIONALDAY','',21,7,0,1,NULL),
(15,1,2,NULL,'BE-ASSOMPTION','',15,8,0,1,NULL),
(16,1,2,NULL,'BE-TOUSSAINT','',1,11,0,1,NULL),
(17,1,2,NULL,'BE-ARMISTICE','',11,11,0,1,NULL),
(18,1,2,NULL,'BE-EASTER','eastermonday',0,0,0,1,NULL),
(19,1,2,NULL,'BE-ASCENSION','ascension',0,0,0,1,NULL),
(20,1,2,NULL,'BE-PENTECOST','pentecost',0,0,0,1,NULL),
(21,1,3,NULL,'IT-LIBEAZIONE','',25,4,0,1,NULL),
(22,1,3,NULL,'IT-EPIPHANY','',1,6,0,1,NULL),
(23,1,3,NULL,'IT-REPUBBLICA','',2,6,0,1,NULL),
(24,1,3,NULL,'IT-TUTTISANTIT','',1,11,0,1,NULL),
(25,1,3,NULL,'IT-IMMACULE','',8,12,0,1,NULL),
(26,1,3,NULL,'IT-SAINTSTEFAN','',26,12,0,1,NULL),
(27,1,4,NULL,'ES-EASTER','easter',0,0,0,1,NULL),
(28,1,4,NULL,'ES-REYE','',6,1,0,1,NULL),
(29,1,4,NULL,'ES-HISPANIDAD','',12,10,0,1,NULL),
(30,1,4,NULL,'ES-TOUSSAINT','',1,11,0,1,NULL),
(31,1,4,NULL,'ES-CONSTITUIZION','',6,12,0,1,NULL),
(32,1,4,NULL,'ES-IMMACULE','',8,12,0,1,NULL),
(33,1,5,NULL,'DE-NEUJAHR','',1,1,0,1,NULL),
(34,1,5,NULL,'DE-HL3KOEN--TLW','',6,1,0,0,NULL),
(35,1,5,NULL,'DE-INTFRAUENTAG--TLW','',8,3,0,0,NULL),
(36,1,5,NULL,'DE-KARFREITAG','goodfriday',0,0,0,1,NULL),
(37,1,5,NULL,'DE-OSTERMONTAG','eastermonday',0,0,0,1,NULL),
(38,1,5,NULL,'DE-TAGDERARBEIT','',1,5,0,1,NULL),
(39,1,5,NULL,'DE-HIMMELFAHRT','ascension',0,0,0,1,NULL),
(40,1,5,NULL,'DE-PFINGSTEN','pentecotemonday',0,0,0,1,NULL),
(41,1,5,NULL,'DE-FRONLEICHNAM--TLW','fronleichnam',0,0,0,0,NULL),
(42,1,5,NULL,'DE-MARIAEHIMMEL--TLW','',15,8,0,0,NULL),
(43,1,5,NULL,'DE-WELTKINDERTAG--TLW','',20,9,0,0,NULL),
(44,1,5,NULL,'DE-TAGDERDEUTEINHEIT','',3,10,0,1,NULL),
(45,1,5,NULL,'DE-REFORMATIONSTAG--TLW','',31,10,0,0,NULL),
(46,1,5,NULL,'DE-ALLERHEILIGEN--TLW','',1,11,0,0,NULL),
(47,1,5,NULL,'DE-WEIHNACHTSTAG1','',25,12,0,1,NULL),
(48,1,5,NULL,'DE-WEIHNACHTSTAG2','',26,12,0,1,NULL),
(49,1,41,NULL,'AT-EASTER','eastermonday',0,0,0,1,NULL),
(50,1,41,NULL,'AT-ASCENSION','ascension',0,0,0,1,NULL),
(51,1,41,NULL,'AT-PENTECOST','pentecost',0,0,0,1,NULL),
(52,1,41,NULL,'AT-FRONLEICHNAM','fronleichnam',0,0,0,1,NULL),
(53,1,41,NULL,'AT-KONEGIE','',1,6,0,1,NULL),
(54,1,41,NULL,'AT-26OKT','',26,10,0,1,NULL),
(55,1,41,NULL,'AT-TOUSSAINT','',1,11,0,1,NULL),
(56,1,41,NULL,'AT-IMMACULE','',8,12,0,1,NULL),
(57,1,41,NULL,'AT-24DEC','',24,12,0,1,NULL),
(58,1,41,NULL,'AT-SAINTSTEFAN','',26,12,0,1,NULL),
(59,1,41,NULL,'AT-Silvester','',31,12,0,1,NULL),
(60,1,102,NULL,'GR-Î Î¡Î©Î¤ÎŸÎ§Î¡ÎŸÎÎ™Î‘','',1,1,0,1,NULL),
(61,1,102,NULL,'GR-Î˜Î•ÎŸÎ¦Î‘ÎÎ•Î™Î‘','',6,1,0,1,NULL),
(62,1,102,NULL,'GR-25Î— ÎœÎ‘Î¡Î¤Î™ÎŸÎ¥','',25,3,0,1,NULL),
(63,1,102,NULL,'GR-Î Î¡Î©Î¤ÎŸÎœÎ‘Î“Î™Î‘','',1,5,0,1,NULL),
(64,1,102,NULL,'GR-ÎšÎ‘Î˜Î‘Î¡Î‘ Î”Î•Î¥Î¤Î•Î¡Î‘','ÎšÎ‘Î˜Î‘Î¡Î‘_Î”Î•Î¥Î¤Î•Î¡Î‘',0,0,0,1,NULL),
(65,1,102,NULL,'GR-ÎœÎ•Î“Î‘Î›Î— Î Î‘Î¡Î‘Î£ÎšÎ•Î¥Î—','ÎœÎ•Î“Î‘Î›Î—_Î Î‘Î¡Î‘Î£ÎšÎ•Î¥Î—',0,0,0,1,NULL),
(66,1,102,NULL,'GR-Î”Î•Î¥Î¤Î•Î¡Î‘ Î¤ÎŸÎ¥ Î Î‘Î£Î§Î‘','Î”Î•Î¥Î¤Î•Î¡Î‘_Î¤ÎŸÎ¥_Î Î‘Î£Î§Î‘',0,0,0,1,NULL),
(67,1,102,NULL,'GR-Î¤ÎŸÎ¥ Î‘Î“Î™ÎŸÎ¥ Î ÎÎ•Î¥ÎœÎ‘Î¤ÎŸÎ£','Î¤ÎŸÎ¥_Î‘Î“Î™ÎŸÎ¥_Î ÎÎ•Î¥ÎœÎ‘Î¤ÎŸÎ£',0,0,0,1,NULL),
(68,1,102,NULL,'GR-ÎšÎŸÎ™ÎœÎ—Î£Î— Î¤Î—Î£ Î˜Î•ÎŸÎ¤ÎŸÎšÎŸÎ¥','',15,8,0,1,NULL),
(69,1,102,NULL,'GR-28Î— ÎŸÎšÎ¤Î©Î’Î¡Î™ÎŸÎ¥','',28,10,0,1,NULL),
(70,1,102,NULL,'GR-Î§Î¡Î™Î£Î¤ÎŸÎ¥Î“Î•ÎÎÎ‘','',25,12,0,1,NULL),
(71,1,102,NULL,'GR-Î£Î¥ÎÎ‘ÎžÎ— Î˜Î•ÎŸÎ¤ÎŸÎšÎŸÎ¥','',26,12,0,1,NULL),
(72,1,117,NULL,'IN-REPUBLICDAY','',26,1,0,1,NULL),
(73,1,117,NULL,'IN-GANDI','',2,10,0,1,NULL);
/*!40000 ALTER TABLE `llx_c_hrm_public_holiday` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_incoterms`
--

DROP TABLE IF EXISTS `llx_c_incoterms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_incoterms` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(8) NOT NULL,
  `label` varchar(100) DEFAULT NULL,
  `libelle` varchar(255) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_incoterms` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_incoterms`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_incoterms` WRITE;
/*!40000 ALTER TABLE `llx_c_incoterms` DISABLE KEYS */;
INSERT INTO `llx_c_incoterms` VALUES
(1,'EXW','Ex Works','Ex Works, au dÃ©part non chargÃ©, non dÃ©douanÃ© sortie d\'usine (uniquement adaptÃ© aux flux domestiques, nationaux)',1),
(2,'FCA','Free Carrier','Free Carrier, marchandises dÃ©douanÃ©es et chargÃ©es dans le pays de dÃ©part, chez le vendeur ou chez le commissionnaire de transport de l\'acheteur',1),
(3,'FAS','Free Alongside Ship','Free Alongside Ship, sur le quai du port de dÃ©part',1),
(4,'FOB','Free On Board','Free On Board, chargÃ© sur le bateau, les frais de chargement dans celui-ci Ã©tant fonction du liner term indiquÃ© par la compagnie maritime (Ã  la charge du vendeur)',1),
(5,'CFR','Cost and Freight','Cost and Freight, chargÃ© dans le bateau, livraison au port de dÃ©part, frais payÃ©s jusqu\'au port d\'arrivÃ©e, sans assurance pour le transport, non dÃ©chargÃ© du navire Ã  destination (les frais de dÃ©chargement sont inclus ou non au port d\'arrivÃ©e)',1),
(6,'CIF','Cost, Insurance, Freight','Cost, Insurance and Freight, chargÃ© sur le bateau, frais jusqu\'au port d\'arrivÃ©e, avec l\'assurance marchandise transportÃ©e souscrite par le vendeur pour le compte de l\'acheteur (couverture standard, 10% de la valeur commerciale)',1),
(7,'CPT','Carriage Paid To','Carriage Paid To, livraison au premier transporteur, frais jusqu\'au dÃ©chargement du mode de transport, sans assurance pour le transport',1),
(8,'CIP','Carriage Insurance Paid','Carriage and Insurance Paid to, idem CPT, avec assurance marchandise transportÃ©e souscrite par le vendeur pour le compte de l\'acheteur (couverture tous risques)',1),
(9,'DAT','Delivered At Terminal','Delivered At Terminal, marchandises (dÃ©chargÃ©es) livrÃ©es sur quai, dans un terminal maritime, fluvial, aÃ©rien, routier ou ferroviaire dÃ©signÃ© (dÃ©douanement import, et post-acheminement payÃ©s par l\'acheteur)',0),
(10,'DAP','Delivered At Place','Delivered At Place, marchandises (non dÃ©chargÃ©es) mises Ã  disposition de l\'acheteur dans le pays d\'importation au lieu prÃ©cisÃ© dans le contrat (dÃ©chargement, dÃ©douanement import payÃ© par l\'acheteur)',1),
(11,'DDP','Delivered Duty Paid','Delivered Duty Paid, marchandises (non dÃ©chargÃ©es) livrÃ©es Ã  destination finale, dÃ©douanement import et taxes Ã  la charge du vendeur ; l\'acheteur prend en charge uniquement le dÃ©chargement (si exclusion des taxes type TVA, le prÃ©ciser clairement)',1),
(12,'DPU','Delivered at Place Unloaded','Delivered at Place Unloaded, marchandises dÃ©chargÃ©es et livrÃ©es au lieu de destination dÃ©signÃ© (remplace DAT, Ã©largit les lieux de livraison possibles)',1),
(13,'DTP','Delivered at Terminal Paid','Delivered at Terminal Paid, marchandises livrÃ©es et dÃ©douanÃ©es dans un terminal du pays de destination (proposition non officielle, parfois utilisÃ©e en contrat)',0),
(14,'DPP','Delivered at Place Paid','Delivered at Place Paid, marchandises livrÃ©es et dÃ©douanÃ©es Ã  une adresse prÃ©cise du pays de destination (proposition non officielle)',0),
(15,'DTP(DHL)','Duties and Taxes Paid','Duties and Taxes Paid (service DHL) : l\'expÃ©diteur paie les droits de douane et taxes Ã  l\'importation, Ã©vitant tout frais supplÃ©mentaire pour le destinataire (spÃ©cifique Ã  DHL)',0);
/*!40000 ALTER TABLE `llx_c_incoterms` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_input_method`
--

DROP TABLE IF EXISTS `llx_c_input_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_input_method` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) DEFAULT NULL,
  `libelle` varchar(128) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `module` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_input_method` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_input_method`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_input_method` WRITE;
/*!40000 ALTER TABLE `llx_c_input_method` DISABLE KEYS */;
INSERT INTO `llx_c_input_method` VALUES
(1,'OrderByMail','Courrier',1,NULL),
(2,'OrderByFax','Fax',1,NULL),
(3,'OrderByEMail','EMail',1,NULL),
(4,'OrderByPhone','TÃ©lÃ©phone',1,NULL),
(5,'OrderByWWW','En ligne',1,NULL);
/*!40000 ALTER TABLE `llx_c_input_method` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_input_reason`
--

DROP TABLE IF EXISTS `llx_c_input_reason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_input_reason` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) DEFAULT NULL,
  `label` varchar(128) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `module` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_input_reason` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_input_reason`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_input_reason` WRITE;
/*!40000 ALTER TABLE `llx_c_input_reason` DISABLE KEYS */;
INSERT INTO `llx_c_input_reason` VALUES
(1,'SRC_INTE','Web site',1,NULL),
(2,'SRC_CAMP_MAIL','Mailing campaign',1,NULL),
(3,'SRC_CAMP_PHO','Phone campaign',1,NULL),
(4,'SRC_CAMP_FAX','Fax campaign',0,NULL),
(5,'SRC_COMM','Commercial contact',1,NULL),
(6,'SRC_SHOP','Shop contact',1,NULL),
(7,'SRC_CAMP_EMAIL','EMailing campaign',1,NULL),
(8,'SRC_WOM','Word of mouth',1,NULL),
(9,'SRC_PARTNER','Partner',1,NULL),
(10,'SRC_EMPLOYEE','Employee',1,NULL),
(11,'SRC_SPONSORING','Sponsorship',1,NULL),
(12,'SRC_CUSTOMER','Incoming contact of a customer',1,NULL);
/*!40000 ALTER TABLE `llx_c_input_reason` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_invoice_subtype`
--

DROP TABLE IF EXISTS `llx_c_invoice_subtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_invoice_subtype` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_country` int(11) NOT NULL,
  `code` varchar(5) NOT NULL,
  `label` varchar(200) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_invoice_subtype` (`entity`,`code`,`fk_country`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_invoice_subtype`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_invoice_subtype` WRITE;
/*!40000 ALTER TABLE `llx_c_invoice_subtype` DISABLE KEYS */;
INSERT INTO `llx_c_invoice_subtype` VALUES
(1,1,102,'1.1','Î¤Î¹Î¼Î¿Î»ÏŒÎ³Î¹Î¿ Î ÏŽÎ»Î·ÏƒÎ·Ï‚',1),
(2,1,102,'1.2','Î¤Î¹Î¼Î¿Î»ÏŒÎ³Î¹Î¿ Î ÏŽÎ»Î·ÏƒÎ·Ï‚ / Î•Î½Î´Î¿ÎºÎ¿Î¹Î½Î¿Ï„Î¹ÎºÎ­Ï‚ Î Î±ÏÎ±Î´ÏŒÏƒÎµÎ¹Ï‚',1),
(3,1,102,'1.3','Î¤Î¹Î¼Î¿Î»ÏŒÎ³Î¹Î¿ Î ÏŽÎ»Î·ÏƒÎ·Ï‚ / Î Î±ÏÎ±Î´ÏŒÏƒÎµÎ¹Ï‚ Î¤ÏÎ¯Ï„Ï‰Î½ Î§Ï‰ÏÏŽÎ½',1),
(4,1,102,'1.4','Î¤Î¹Î¼Î¿Î»ÏŒÎ³Î¹Î¿ Î ÏŽÎ»Î·ÏƒÎ·Ï‚ / Î ÏŽÎ»Î·ÏƒÎ· Î³Î¹Î± Î›Î¿Î³Î±ÏÎ¹Î±ÏƒÎ¼ÏŒ Î¤ÏÎ¯Ï„Ï‰Î½',0),
(5,1,102,'1.5','Î¤Î¹Î¼Î¿Î»ÏŒÎ³Î¹Î¿ Î ÏŽÎ»Î·ÏƒÎ·Ï‚ / Î•ÎºÎºÎ±Î¸Î¬ÏÎ¹ÏƒÎ· Î Ï‰Î»Î®ÏƒÎµÏ‰Î½ Î¤ÏÎ¯Ï„Ï‰Î½ - Î‘Î¼Î¿Î¹Î²Î® Î±Ï€ÏŒ Î Ï‰Î»Î®ÏƒÎµÎ¹Ï‚ Î¤ÏÎ¯Ï„Ï‰Î½',0),
(6,1,102,'1.6','Î¤Î¹Î¼Î¿Î»ÏŒÎ³Î¹Î¿ Î ÏŽÎ»Î·ÏƒÎ·Ï‚ / Î£Ï…Î¼Ï€Î»Î·ÏÏ‰Î¼Î±Ï„Î¹ÎºÏŒ Î Î±ÏÎ±ÏƒÏ„Î±Ï„Î¹ÎºÏŒ',0),
(7,1,102,'2.1','Î¤Î¹Î¼Î¿Î»ÏŒÎ³Î¹Î¿ Î Î±ÏÎ¿Ï‡Î®Ï‚',1),
(8,1,102,'2.2','Î¤Î¹Î¼Î¿Î»ÏŒÎ³Î¹Î¿ Î Î±ÏÎ¿Ï‡Î®Ï‚ / Î•Î½Î´Î¿ÎºÎ¿Î¹Î½Î¿Ï„Î¹ÎºÎ® Î Î±ÏÎ¿Ï‡Î® Î¥Ï€Î·ÏÎµÏƒÎ¹ÏŽÎ½',1),
(9,1,102,'2.3','Î¤Î¹Î¼Î¿Î»ÏŒÎ³Î¹Î¿ Î Î±ÏÎ¿Ï‡Î®Ï‚ / Î Î±ÏÎ¿Ï‡Î® Î¥Ï€Î·ÏÎµÏƒÎ¹ÏŽÎ½ ÏƒÎµ Î»Î®Ï€Ï„Î· Î¤ÏÎ¯Ï„Î·Ï‚ Î§ÏŽÏÎ±Ï‚',1),
(10,1,102,'2.4','Î¤Î¹Î¼Î¿Î»ÏŒÎ³Î¹Î¿ Î Î±ÏÎ¿Ï‡Î®Ï‚ / Î£Ï…Î¼Ï€Î»Î·ÏÏ‰Î¼Î±Ï„Î¹ÎºÏŒ Î Î±ÏÎ±ÏƒÏ„Î±Ï„Î¹ÎºÏŒ',0),
(11,1,102,'3.1','Î¤Î¯Ï„Î»Î¿Ï‚ ÎšÏ„Î®ÏƒÎ·Ï‚ (Î¼Î· Ï…Ï€ÏŒÏ‡ÏÎµÎ¿Ï‚ Î•ÎºÎ´ÏŒÏ„Î·Ï‚)',0),
(12,1,102,'3.2','Î¤Î¯Ï„Î»Î¿Ï‚ ÎšÏ„Î®ÏƒÎ·Ï‚ (Î¬ÏÎ½Î·ÏƒÎ· Î­ÎºÎ´Î¿ÏƒÎ·Ï‚ Î±Ï€ÏŒ Ï…Ï€ÏŒÏ‡ÏÎµÎ¿ Î•ÎºÎ´ÏŒÏ„Î·)',0),
(13,1,102,'6.1','Î£Ï„Î¿Î¹Ï‡ÎµÎ¯Î¿ Î‘Ï…Ï„Î¿Ï€Î±ÏÎ¬Î´Î¿ÏƒÎ·Ï‚',0),
(14,1,102,'6.2','Î£Ï„Î¿Î¹Ï‡ÎµÎ¯Î¿ Î™Î´Î¹Î¿Ï‡ÏÎ·ÏƒÎ¹Î¼Î¿Ï€Î¿Î¯Î·ÏƒÎ·Ï‚',0),
(15,1,102,'7.1','Î£Ï…Î¼Î²ÏŒÎ»Î±Î¹Î¿ - ÎˆÏƒÎ¿Î´Î¿',0),
(16,1,102,'8.1','Î•Î½Î¿Î¯ÎºÎ¹Î± - ÎˆÏƒÎ¿Î´Î¿',0),
(17,1,102,'8.2','Î•Î¹Î´Î¹ÎºÏŒ Î£Ï„Î¿Î¹Ï‡ÎµÎ¯Î¿ â€“ Î‘Ï€ÏŒÎ´ÎµÎ¹Î¾Î·Ï‚ Î•Î¯ÏƒÏ€ÏÎ±Î¾Î·Ï‚ Î¦ÏŒÏÎ¿Ï… Î”Î¹Î±Î¼Î¿Î½Î®Ï‚',0),
(18,1,102,'11.1','Î‘Î›Î ',1),
(19,1,102,'11.2','Î‘Î Î¥',1),
(20,1,102,'11.3','Î‘Ï€Î»Î¿Ï€Î¿Î¹Î·Î¼Î­Î½Î¿ Î¤Î¹Î¼Î¿Î»ÏŒÎ³Î¹Î¿',0),
(21,1,102,'11.5','Î‘Ï€ÏŒÎ´ÎµÎ¹Î¾Î· Î›Î¹Î±Î½Î¹ÎºÎ®Ï‚ Î ÏŽÎ»Î·ÏƒÎ·Ï‚ Î³Î¹Î± Î›Î¿Î³/ÏƒÎ¼ÏŒ Î¤ÏÎ¯Ï„Ï‰Î½',0),
(22,1,102,'5.1','Î Î¹ÏƒÏ„Ï‰Ï„Î¹ÎºÏŒ Î¤Î¹Î¼Î¿Î»ÏŒÎ³Î¹Î¿ / Î£Ï…ÏƒÏ‡ÎµÏ„Î¹Î¶ÏŒÎ¼ÎµÎ½Î¿',0),
(23,1,102,'5.2','Î Î¹ÏƒÏ„Ï‰Ï„Î¹ÎºÏŒ Î¤Î¹Î¼Î¿Î»ÏŒÎ³Î¹Î¿ / ÎœÎ· Î£Ï…ÏƒÏ‡ÎµÏ„Î¹Î¶ÏŒÎ¼ÎµÎ½Î¿',1),
(24,1,102,'11.4','Î Î¹ÏƒÏ„Ï‰Ï„Î¹ÎºÏŒ Î£Ï„Î¿Î¹Ï‡ÎµÎ¯Î¿ Î›Î¹Î±Î½Î¹ÎºÎ®Ï‚',1);
/*!40000 ALTER TABLE `llx_c_invoice_subtype` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_lead_status`
--

DROP TABLE IF EXISTS `llx_c_lead_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_lead_status` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) DEFAULT NULL,
  `label` varchar(128) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `percent` double(5,2) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_lead_status_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_lead_status`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_lead_status` WRITE;
/*!40000 ALTER TABLE `llx_c_lead_status` DISABLE KEYS */;
INSERT INTO `llx_c_lead_status` VALUES
(1,'PROSP','Prospection',10,0.00,1),
(2,'QUAL','Qualification',20,20.00,1),
(3,'PROPO','Proposal',30,40.00,1),
(4,'NEGO','Negotiation',40,60.00,1),
(5,'PENDING','Pending',50,50.00,0),
(6,'WON','Won',60,100.00,1),
(7,'LOST','Lost',70,0.00,1);
/*!40000 ALTER TABLE `llx_c_lead_status` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_paiement`
--

DROP TABLE IF EXISTS `llx_c_paiement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_paiement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `code` varchar(6) NOT NULL,
  `libelle` varchar(128) DEFAULT NULL,
  `type` smallint(6) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `accountancy_code` varchar(32) DEFAULT NULL,
  `module` varchar(32) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_c_paiement_code` (`entity`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_paiement`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_paiement` WRITE;
/*!40000 ALTER TABLE `llx_c_paiement` DISABLE KEYS */;
INSERT INTO `llx_c_paiement` VALUES
(1,1,'TIP','TIP',2,0,NULL,NULL,0),
(2,1,'VIR','Credit Transfer',2,1,NULL,NULL,0),
(3,1,'PRE','Direct Debit',2,1,NULL,NULL,0),
(4,1,'LIQ','Cash',2,1,NULL,NULL,0),
(6,1,'CB','Credit card',2,1,NULL,NULL,0),
(7,1,'CHQ','Cheque',2,1,NULL,NULL,0),
(50,1,'VAD','Online payment',2,0,NULL,NULL,0),
(51,1,'TRA','Traite',2,0,NULL,NULL,0),
(52,1,'LCR','LCR',2,0,NULL,NULL,0),
(53,1,'FAC','Factor',2,0,NULL,NULL,0),
(100,1,'KLA','Klarna',1,0,NULL,NULL,0),
(101,1,'SOF','Sofort',1,0,NULL,NULL,0),
(102,1,'BANCON','Bancontact',1,0,NULL,NULL,0),
(103,1,'IDE','iDeal',1,0,NULL,NULL,0),
(104,1,'GIR','Giropay',1,0,NULL,NULL,0),
(105,1,'PPL','PayPal',1,0,NULL,NULL,0);
/*!40000 ALTER TABLE `llx_c_paiement` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_paper_format`
--

DROP TABLE IF EXISTS `llx_c_paper_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_paper_format` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(16) NOT NULL,
  `label` varchar(128) NOT NULL,
  `width` float(6,2) DEFAULT 0.00,
  `height` float(6,2) DEFAULT 0.00,
  `unit` varchar(5) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `module` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_paper_format`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_paper_format` WRITE;
/*!40000 ALTER TABLE `llx_c_paper_format` DISABLE KEYS */;
INSERT INTO `llx_c_paper_format` VALUES
(1,'EU4A0','Format 4A0',1682.00,2378.00,'mm',1,NULL),
(2,'EU2A0','Format 2A0',1189.00,1682.00,'mm',1,NULL),
(3,'EUA0','Format A0',840.00,1189.00,'mm',1,NULL),
(4,'EUA1','Format A1',594.00,840.00,'mm',1,NULL),
(5,'EUA2','Format A2',420.00,594.00,'mm',1,NULL),
(6,'EUA3','Format A3',297.00,420.00,'mm',1,NULL),
(7,'EUA4','Format A4',210.00,297.00,'mm',1,NULL),
(8,'EUA5','Format A5',148.00,210.00,'mm',1,NULL),
(9,'EUA6','Format A6',105.00,148.00,'mm',1,NULL),
(100,'USLetter','Format Letter (A)',216.00,279.00,'mm',1,NULL),
(105,'USLegal','Format Legal',216.00,356.00,'mm',1,NULL),
(110,'USExecutive','Format Executive',190.00,254.00,'mm',1,NULL),
(115,'USLedger','Format Ledger/Tabloid (B)',279.00,432.00,'mm',1,NULL),
(200,'CAP1','Format Canadian P1',560.00,860.00,'mm',1,NULL),
(205,'CAP2','Format Canadian P2',430.00,560.00,'mm',1,NULL),
(210,'CAP3','Format Canadian P3',280.00,430.00,'mm',1,NULL),
(215,'CAP4','Format Canadian P4',215.00,280.00,'mm',1,NULL),
(220,'CAP5','Format Canadian P5',140.00,215.00,'mm',1,NULL),
(225,'CAP6','Format Canadian P6',107.00,140.00,'mm',1,NULL);
/*!40000 ALTER TABLE `llx_c_paper_format` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_partnership_type`
--

DROP TABLE IF EXISTS `llx_c_partnership_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_partnership_type` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `code` varchar(32) NOT NULL,
  `label` varchar(128) NOT NULL,
  `keyword` varchar(128) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_partnership_type` (`entity`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_partnership_type`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_partnership_type` WRITE;
/*!40000 ALTER TABLE `llx_c_partnership_type` DISABLE KEYS */;
INSERT INTO `llx_c_partnership_type` VALUES
(1,1,'DEFAULT','Default',NULL,1);
/*!40000 ALTER TABLE `llx_c_partnership_type` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_payment_term`
--

DROP TABLE IF EXISTS `llx_c_payment_term`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_payment_term` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `code` varchar(16) DEFAULT NULL,
  `sortorder` smallint(6) DEFAULT NULL,
  `active` tinyint(4) DEFAULT 1,
  `libelle` varchar(255) DEFAULT NULL,
  `libelle_facture` text DEFAULT NULL,
  `type_cdr` tinyint(4) DEFAULT NULL,
  `nbjour` smallint(6) DEFAULT NULL,
  `decalage` smallint(6) DEFAULT NULL,
  `deposit_percent` varchar(63) DEFAULT NULL,
  `module` varchar(32) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_payment_term_code` (`entity`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_payment_term`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_payment_term` WRITE;
/*!40000 ALTER TABLE `llx_c_payment_term` DISABLE KEYS */;
INSERT INTO `llx_c_payment_term` VALUES
(1,1,'RECEP',1,1,'Due upon receipt','Due upon receipt',0,1,NULL,NULL,NULL,0),
(2,1,'30D',5,1,'30 days','Due in 30 days',0,30,NULL,NULL,NULL,0),
(3,1,'30DENDMONTH',7,1,'30 days end of month','Due in 30 days, end of month',1,30,NULL,NULL,NULL,0),
(4,1,'60D',20,1,'60 days','Due in 60 days',0,60,NULL,NULL,NULL,0),
(5,1,'60DENDMONTH',25,0,'60 days end of month','Due in 60 days, end of month',1,60,NULL,NULL,NULL,0),
(6,1,'PT_ORDER',30,1,'Due on order','Due on order',0,1,NULL,NULL,NULL,0),
(7,1,'PT_DELIVERY',35,1,'Due on delivery','Due on delivery',0,1,NULL,NULL,NULL,0),
(8,1,'PT_5050',40,1,'50 and 50','50% on order, 50% on delivery',0,1,NULL,NULL,NULL,0),
(9,1,'10D',50,1,'10 days','Due in 10 days',0,10,NULL,NULL,NULL,0),
(10,1,'10DENDMONTH',55,1,'10 days end of month','Due in 10 days, end of month',1,10,NULL,NULL,NULL,0),
(11,1,'14D',60,1,'14 days','Due in 14 days',0,14,NULL,NULL,NULL,0),
(12,1,'14DENDMONTH',65,1,'14 days end of month','Due in 14 days, end of month',1,14,NULL,NULL,NULL,0),
(13,1,'DEP30PCTDEL',90,0,'__DEPOSIT_PERCENT__% deposit','__DEPOSIT_PERCENT__% deposit, remainder on delivery',0,1,NULL,'30',NULL,0),
(14,1,'45D',10,1,'45 days','Due in 45 days',0,45,NULL,NULL,NULL,0),
(15,1,'45DENDMONTH',15,1,'45 days end of month','Due in 45 days, end of month',1,45,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `llx_c_payment_term` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_price_expression`
--

DROP TABLE IF EXISTS `llx_c_price_expression`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_price_expression` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL,
  `expression` varchar(255) NOT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_price_expression`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_price_expression` WRITE;
/*!40000 ALTER TABLE `llx_c_price_expression` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_c_price_expression` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_price_global_variable`
--

DROP TABLE IF EXISTS `llx_c_price_global_variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_price_global_variable` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `description` text DEFAULT NULL,
  `value` double(24,8) DEFAULT 0.00000000,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_price_global_variable`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_price_global_variable` WRITE;
/*!40000 ALTER TABLE `llx_c_price_global_variable` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_c_price_global_variable` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_price_global_variable_updater`
--

DROP TABLE IF EXISTS `llx_c_price_global_variable_updater`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_price_global_variable_updater` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `parameters` text DEFAULT NULL,
  `fk_variable` int(11) NOT NULL,
  `update_interval` int(11) DEFAULT 0,
  `next_update` int(11) DEFAULT 0,
  `last_status` text DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_price_global_variable_updater`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_price_global_variable_updater` WRITE;
/*!40000 ALTER TABLE `llx_c_price_global_variable_updater` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_c_price_global_variable_updater` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_product_nature`
--

DROP TABLE IF EXISTS `llx_c_product_nature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_product_nature` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` tinyint(4) NOT NULL,
  `label` varchar(128) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_product_nature` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_product_nature`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_product_nature` WRITE;
/*!40000 ALTER TABLE `llx_c_product_nature` DISABLE KEYS */;
INSERT INTO `llx_c_product_nature` VALUES
(1,0,'RowMaterial',1),
(2,1,'Finished',1);
/*!40000 ALTER TABLE `llx_c_product_nature` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_product_thirdparty_relation_type`
--

DROP TABLE IF EXISTS `llx_c_product_thirdparty_relation_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_product_thirdparty_relation_type` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(24) NOT NULL,
  `label` varchar(128) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_product_thirdparty_relation_type`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_product_thirdparty_relation_type` WRITE;
/*!40000 ALTER TABLE `llx_c_product_thirdparty_relation_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_c_product_thirdparty_relation_type` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_productbatch_qcstatus`
--

DROP TABLE IF EXISTS `llx_c_productbatch_qcstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_productbatch_qcstatus` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `code` varchar(16) NOT NULL,
  `label` varchar(128) NOT NULL,
  `active` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_productbatch_qcstatus` (`code`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_productbatch_qcstatus`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_productbatch_qcstatus` WRITE;
/*!40000 ALTER TABLE `llx_c_productbatch_qcstatus` DISABLE KEYS */;
INSERT INTO `llx_c_productbatch_qcstatus` VALUES
(1,1,'OK','InWorkingOrder',1),
(2,1,'KO','OutOfOrder',1);
/*!40000 ALTER TABLE `llx_c_productbatch_qcstatus` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_propalst`
--

DROP TABLE IF EXISTS `llx_c_propalst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_propalst` (
  `id` smallint(6) NOT NULL,
  `code` varchar(12) NOT NULL,
  `label` varchar(128) DEFAULT NULL,
  `sortorder` smallint(6) DEFAULT 0,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_c_propalst` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_propalst`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_propalst` WRITE;
/*!40000 ALTER TABLE `llx_c_propalst` DISABLE KEYS */;
INSERT INTO `llx_c_propalst` VALUES
(0,'PR_DRAFT','Brouillon',0,1),
(1,'PR_OPEN','Ouverte',0,1),
(2,'PR_SIGNED','SignÃ©e',0,1),
(3,'PR_NOTSIGNED','Non SignÃ©e',0,1),
(4,'PR_FAC','FacturÃ©e',0,1);
/*!40000 ALTER TABLE `llx_c_propalst` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_prospectcontactlevel`
--

DROP TABLE IF EXISTS `llx_c_prospectcontactlevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_prospectcontactlevel` (
  `code` varchar(12) NOT NULL,
  `label` varchar(128) DEFAULT NULL,
  `sortorder` smallint(6) DEFAULT NULL,
  `active` smallint(6) NOT NULL DEFAULT 1,
  `module` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_prospectcontactlevel`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_prospectcontactlevel` WRITE;
/*!40000 ALTER TABLE `llx_c_prospectcontactlevel` DISABLE KEYS */;
INSERT INTO `llx_c_prospectcontactlevel` VALUES
('PL_HIGH','High',4,1,NULL),
('PL_LOW','Low',2,1,NULL),
('PL_MEDIUM','Medium',3,1,NULL),
('PL_NONE','None',1,1,NULL);
/*!40000 ALTER TABLE `llx_c_prospectcontactlevel` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_prospectlevel`
--

DROP TABLE IF EXISTS `llx_c_prospectlevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_prospectlevel` (
  `code` varchar(12) NOT NULL,
  `label` varchar(128) DEFAULT NULL,
  `sortorder` smallint(6) DEFAULT NULL,
  `active` smallint(6) NOT NULL DEFAULT 1,
  `module` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_prospectlevel`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_prospectlevel` WRITE;
/*!40000 ALTER TABLE `llx_c_prospectlevel` DISABLE KEYS */;
INSERT INTO `llx_c_prospectlevel` VALUES
('PL_HIGH','High',4,1,NULL),
('PL_LOW','Low',2,1,NULL),
('PL_MEDIUM','Medium',3,1,NULL),
('PL_NONE','None',1,1,NULL);
/*!40000 ALTER TABLE `llx_c_prospectlevel` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_recruitment_origin`
--

DROP TABLE IF EXISTS `llx_c_recruitment_origin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_recruitment_origin` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `label` varchar(128) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_recruitment_origin`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_recruitment_origin` WRITE;
/*!40000 ALTER TABLE `llx_c_recruitment_origin` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_c_recruitment_origin` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_regions`
--

DROP TABLE IF EXISTS `llx_c_regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_regions` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code_region` int(11) NOT NULL,
  `fk_pays` int(11) NOT NULL,
  `cheflieu` varchar(50) DEFAULT NULL,
  `tncc` int(11) DEFAULT NULL,
  `nom` varchar(100) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_code_region` (`code_region`),
  KEY `idx_c_regions_fk_pays` (`fk_pays`)
) ENGINE=InnoDB AUTO_INCREMENT=258 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_regions`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_regions` WRITE;
/*!40000 ALTER TABLE `llx_c_regions` DISABLE KEYS */;
INSERT INTO `llx_c_regions` VALUES
(1,0,0,'0',0,'-',1),
(2,1301,13,'',0,'Algerie',1),
(3,34000,34,'AD',NULL,'Andorra',1),
(4,35001,35,'AO',NULL,'Angola',1),
(5,2301,23,'',0,'Norte',1),
(6,2302,23,'',0,'Litoral',1),
(7,2303,23,'',0,'Cuyana',1),
(8,2304,23,'',0,'Central',1),
(9,2305,23,'',0,'Patagonia',1),
(10,2801,28,'',0,'Australia',1),
(11,4101,41,'',0,'Ã–sterreich',1),
(12,4601,46,'',0,'Barbados',1),
(13,201,2,'',1,'Flandre',1),
(14,202,2,'',2,'Wallonie',1),
(15,203,2,'',3,'Bruxelles-Capitale',1),
(16,5201,52,'',0,'Chuquisaca',1),
(17,5202,52,'',0,'La Paz',1),
(18,5203,52,'',0,'Cochabamba',1),
(19,5204,52,'',0,'Oruro',1),
(20,5205,52,'',0,'PotosÃ­',1),
(21,5206,52,'',0,'Tarija',1),
(22,5207,52,'',0,'Santa Cruz',1),
(23,5208,52,'',0,'El Beni',1),
(24,5209,52,'',0,'Pando',1),
(25,5601,56,'',0,'Brasil',1),
(26,6101,61,'',0,'Bubanza',1),
(27,6102,61,'',0,'Bujumbura Mairie',1),
(28,6103,61,'',0,'Bujumbura Rural',1),
(29,6104,61,'',0,'Bururi',1),
(30,6105,61,'',0,'Cankuzo',1),
(31,6106,61,'',0,'Cibitoke',1),
(32,6107,61,'',0,'Gitega',1),
(33,6108,61,'',0,'Karuzi',1),
(34,6109,61,'',0,'Kayanza',1),
(35,6110,61,'',0,'Kirundo',1),
(36,6111,61,'',0,'Makamba',1),
(37,6112,61,'',0,'Muramvya',1),
(38,6113,61,'',0,'Muyinga',1),
(39,6114,61,'',0,'Mwaro',1),
(40,6115,61,'',0,'Ngozi',1),
(41,6116,61,'',0,'Rumonge',1),
(42,6117,61,'',0,'Rutana',1),
(43,6118,61,'',0,'Ruyigi',1),
(44,1401,14,'',0,'Canada',1),
(45,6701,67,NULL,NULL,'TarapacÃ¡',1),
(46,6702,67,NULL,NULL,'Antofagasta',1),
(47,6703,67,NULL,NULL,'Atacama',1),
(48,6704,67,NULL,NULL,'Coquimbo',1),
(49,6705,67,NULL,NULL,'ValparaÃ­so',1),
(50,6706,67,NULL,NULL,'General Bernardo O Higgins',1),
(51,6707,67,NULL,NULL,'Maule',1),
(52,6708,67,NULL,NULL,'BiobÃ­o',1),
(53,6709,67,NULL,NULL,'RaucanÃ­a',1),
(54,6710,67,NULL,NULL,'Los Lagos',1),
(55,6711,67,NULL,NULL,'AysÃ©n General Carlos IbÃ¡Ã±ez del Campo',1),
(56,6712,67,NULL,NULL,'Magallanes y AntÃ¡rtica Chilena',1),
(57,6713,67,NULL,NULL,'Metropolitana de Santiago',1),
(58,6714,67,NULL,NULL,'Los RÃ­os',1),
(59,6715,67,NULL,NULL,'Arica y Parinacota',1),
(60,901,9,'äº¬',0,'åŒ—äº¬å¸‚',1),
(61,902,9,'æ´¥',0,'å¤©æ´¥å¸‚',1),
(62,903,9,'æ²ª',0,'ä¸Šæµ·å¸‚',1),
(63,904,9,'æ¸',0,'é‡åº†å¸‚',1),
(64,905,9,'å†€',0,'æ²³åŒ—çœ',1),
(65,906,9,'æ™‹',0,'å±±è¥¿çœ',1),
(66,907,9,'è¾½',0,'è¾½å®çœ',1),
(67,908,9,'å‰',0,'å‰æž—çœ',1),
(68,909,9,'é»‘',0,'é»‘é¾™æ±Ÿçœ',1),
(69,910,9,'è‹',0,'æ±Ÿè‹çœ',1),
(70,911,9,'æµ™',0,'æµ™æ±Ÿçœ',1),
(71,912,9,'çš–',0,'å®‰å¾½çœ',1),
(72,913,9,'é—½',0,'ç¦å»ºçœ',1),
(73,914,9,'èµ£',0,'æ±Ÿè¥¿çœ',1),
(74,915,9,'é²',0,'å±±ä¸œçœ',1),
(75,916,9,'è±«',0,'æ²³å—çœ',1),
(76,917,9,'é„‚',0,'æ¹–åŒ—çœ',1),
(77,918,9,'æ¹˜',0,'æ¹–å—çœ',1),
(78,919,9,'ç²¤',0,'å¹¿ä¸œçœ',1),
(79,920,9,'ç¼',0,'æµ·å—çœ',1),
(80,921,9,'å·',0,'å››å·çœ',1),
(81,922,9,'è´µ',0,'è´µå·žçœ',1),
(82,923,9,'äº‘',0,'äº‘å—çœ',1),
(83,924,9,'é™•',0,'é™•è¥¿çœ',1),
(84,925,9,'ç”˜',0,'ç”˜è‚ƒçœ',1),
(85,926,9,'é’',0,'é’æµ·çœ',1),
(86,927,9,'å°',0,'å°æ¹¾çœ',1),
(87,928,9,'è’™',0,'å†…è’™å¤è‡ªæ²»åŒº',1),
(88,929,9,'æ¡‚',0,'å¹¿è¥¿å£®æ—è‡ªæ²»åŒº',1),
(89,930,9,'è—',0,'è¥¿è—è‡ªæ²»åŒº',1),
(90,931,9,'å®',0,'å®å¤å›žæ—è‡ªæ²»åŒº',1),
(91,932,9,'æ–°',0,'æ–°ç–†ç»´å¾å°”è‡ªæ²»åŒº',1),
(92,933,9,'æ¸¯',0,'é¦™æ¸¯ç‰¹åˆ«è¡Œæ”¿åŒº',1),
(93,934,9,'æ¾³',0,'æ¾³é—¨ç‰¹åˆ«è¡Œæ”¿åŒº',1),
(94,7001,70,'',0,'Colombie',1),
(95,7301,73,'Kinshasa',0,'Kinshasa',1),
(96,7302,73,'Matadi',0,'Kongo Central',1),
(97,7303,73,'Kenge',0,'Kwango',1),
(98,7304,73,'Bandundu',0,'Kwilu',1),
(99,7305,73,'Inongo',0,'Mai-Ndombe',1),
(100,7306,73,'Tshikapa',0,'KasaÃ¯',1),
(101,7307,73,'Kananga',0,'KasaÃ¯-Central',1),
(102,7308,73,'Mbuji-Mayi',0,'KasaÃ¯-Oriental',1),
(103,7309,73,'Kabinda',0,'Lomami',1),
(104,7310,73,'Lusambo',0,'Sankuru',1),
(105,7311,73,'Kindu',0,'Maniema',1),
(106,7312,73,'Bukavu',0,'Sud-Kivu',1),
(107,7313,73,'Goma',0,'Nord-Kivu',1),
(108,7314,73,'Bunia',0,'Ituri',1),
(109,7315,73,'Isiro',0,'Haut-UÃ©lÃ©',1),
(110,7316,73,'Buta',0,'Bas-UÃ©lÃ©',1),
(111,7317,73,'Kisangani',0,'Tshopo',1),
(112,7318,73,'Boende',0,'Tshuapa',1),
(113,7319,73,'Mbandaka',0,'Ã‰quateur',1),
(114,7320,73,'Lisala',0,'Mongala',1),
(115,7321,73,'Gbadolite',0,'Nord-Ubangi',1),
(116,7322,73,'Gemena',0,'Sud-Ubangi',1),
(117,7323,73,'Kamina',0,'Haut-Lomami',1),
(118,7324,73,'Kolwezi',0,'Lualaba',1),
(119,7325,73,'Lubumbashi',0,'Haut-Katanga',1),
(120,7326,73,'Kalemie',0,'Tanganyika',1),
(121,7601,76,'',0,'SrediÅ¡nja',1),
(122,7602,76,'',0,'Dalmacija',1),
(123,7603,76,'',0,'Slavonija',1),
(124,7604,76,'',0,'Istra',1),
(125,8001,80,'',0,'Nordjylland',1),
(126,8002,80,'',0,'Midtjylland',1),
(127,8003,80,'',0,'Syddanmark',1),
(128,8004,80,'',0,'Hovedstaden',1),
(129,8005,80,'',0,'SjÃ¦lland',1),
(130,1,1,'97105',3,'Guadeloupe',1),
(131,2,1,'97209',3,'Martinique',1),
(132,3,1,'97302',3,'Guyane',1),
(133,4,1,'97411',3,'RÃ©union',1),
(134,6,1,'97601',3,'Mayotte',1),
(135,7,1,'97133',3,'Saint Barthelemy',1),
(136,8,1,'97150',3,'Saint Martin',1),
(137,11,1,'75056',1,'ÃŽle-de-France',1),
(138,24,1,'45234',2,'Centre-Val de Loire',1),
(139,27,1,'21231',0,'Bourgogne-Franche-ComtÃ©',1),
(140,28,1,'76540',0,'Normandie',1),
(141,32,1,'59350',4,'Hauts-de-France',1),
(142,44,1,'67482',2,'Grand Est',1),
(143,52,1,'44109',4,'Pays de la Loire',1),
(144,53,1,'35238',0,'Bretagne',1),
(145,75,1,'33063',0,'Nouvelle-Aquitaine',1),
(146,76,1,'31355',1,'Occitanie',1),
(147,84,1,'69123',1,'Auvergne-RhÃ´ne-Alpes',1),
(148,93,1,'13055',0,'Provence-Alpes-CÃ´te d\'Azur',1),
(149,94,1,'2A004',0,'Corse',1),
(150,501,5,'',0,'Deutschland',1),
(151,10201,102,NULL,NULL,'Î‘Ï„Ï„Î¹ÎºÎ®',1),
(152,10202,102,NULL,NULL,'Î£Ï„ÎµÏÎµÎ¬ Î•Î»Î»Î¬Î´Î±',1),
(153,10203,102,NULL,NULL,'ÎšÎµÎ½Ï„ÏÎ¹ÎºÎ® ÎœÎ±ÎºÎµÎ´Î¿Î½Î¯Î±',1),
(154,10204,102,NULL,NULL,'ÎšÏÎ®Ï„Î·',1),
(155,10205,102,NULL,NULL,'Î‘Î½Î±Ï„Î¿Î»Î¹ÎºÎ® ÎœÎ±ÎºÎµÎ´Î¿Î½Î¯Î± ÎºÎ±Î¹ Î˜ÏÎ¬ÎºÎ·',1),
(156,10206,102,NULL,NULL,'Î‰Ï€ÎµÎ¹ÏÎ¿Ï‚',1),
(157,10207,102,NULL,NULL,'Î™ÏŒÎ½Î¹Î± Î½Î·ÏƒÎ¹Î¬',1),
(158,10208,102,NULL,NULL,'Î’ÏŒÏÎµÎ¹Î¿ Î‘Î¹Î³Î±Î¯Î¿',1),
(159,10209,102,NULL,NULL,'Î ÎµÎ»Î¿Ï€ÏŒÎ½Î½Î·ÏƒÎ¿Ï‚',1),
(160,10210,102,NULL,NULL,'ÎÏŒÏ„Î¹Î¿ Î‘Î¹Î³Î±Î¯Î¿',1),
(161,10211,102,NULL,NULL,'Î”Ï…Ï„Î¹ÎºÎ® Î•Î»Î»Î¬Î´Î±',1),
(162,10212,102,NULL,NULL,'Î˜ÎµÏƒÏƒÎ±Î»Î¯Î±',1),
(163,10213,102,NULL,NULL,'Î”Ï…Ï„Î¹ÎºÎ® ÎœÎ±ÎºÎµÎ´Î¿Î½Î¯Î±',1),
(164,11401,114,'',0,'Honduras',1),
(165,180100,18,'HU1',NULL,'KÃ¶zÃ©p-MagyarorszÃ¡g',1),
(166,182100,18,'HU21',NULL,'KÃ¶zÃ©p-DunÃ¡ntÃºl',1),
(167,182200,18,'HU22',NULL,'Nyugat-DunÃ¡ntÃºl',1),
(168,182300,18,'HU23',NULL,'DÃ©l-DunÃ¡ntÃºl',1),
(169,183100,18,'HU31',NULL,'Ã‰szak-MagyarorszÃ¡g',1),
(170,183200,18,'HU32',NULL,'Ã‰szak-AlfÃ¶ld',1),
(171,183300,18,'HU33',NULL,'DÃ©l-AlfÃ¶ld',1),
(172,11701,117,'',0,'India',1),
(173,11801,118,'',0,'Indonesia',1),
(174,301,3,NULL,1,'Abruzzo',1),
(175,302,3,NULL,1,'Basilicata',1),
(176,303,3,NULL,1,'Calabria',1),
(177,304,3,NULL,1,'Campania',1),
(178,305,3,NULL,1,'Emilia-Romagna',1),
(179,306,3,NULL,1,'Friuli-Venezia Giulia',1),
(180,307,3,NULL,1,'Lazio',1),
(181,308,3,NULL,1,'Liguria',1),
(182,309,3,NULL,1,'Lombardia',1),
(183,310,3,NULL,1,'Marche',1),
(184,311,3,NULL,1,'Molise',1),
(185,312,3,NULL,1,'Piemonte',1),
(186,313,3,NULL,1,'Puglia',1),
(187,314,3,NULL,1,'Sardegna',1),
(188,315,3,NULL,1,'Sicilia',1),
(189,316,3,NULL,1,'Toscana',1),
(190,317,3,NULL,1,'Trentino-Alto Adige',1),
(191,318,3,NULL,1,'Umbria',1),
(192,319,3,NULL,1,'Valle d Aosta',1),
(193,320,3,NULL,1,'Veneto',1),
(194,12301,123,'',0,'æ—¥æœ¬',1),
(195,14001,140,'',0,'Diekirch',1),
(196,14002,140,'',0,'Grevenmacher',1),
(197,14003,140,'',0,'Luxembourg',1),
(198,15201,152,'',0,'RiviÃ¨re Noire',1),
(199,15202,152,'',0,'Flacq',1),
(200,15203,152,'',0,'Grand Port',1),
(201,15204,152,'',0,'Moka',1),
(202,15205,152,'',0,'Pamplemousses',1),
(203,15206,152,'',0,'Plaines Wilhems',1),
(204,15207,152,'',0,'Port-Louis',1),
(205,15208,152,'',0,'RiviÃ¨re du Rempart',1),
(206,15209,152,'',0,'Savanne',1),
(207,15210,152,'',0,'Rodrigues',1),
(208,15211,152,'',0,'Les Ã®les AgalÃ©ga',1),
(209,15212,152,'',0,'Les Ã©cueils des Cargados Carajos',1),
(210,15401,154,'',0,'Mexique',1),
(211,1201,12,'',0,'Tanger-TÃ©touan',1),
(212,1202,12,'',0,'Gharb-Chrarda-Beni Hssen',1),
(213,1203,12,'',0,'Taza-Al Hoceima-Taounate',1),
(214,1204,12,'',0,'L\'Oriental',1),
(215,1205,12,'',0,'FÃ¨s-Boulemane',1),
(216,1206,12,'',0,'MeknÃ¨s-Tafialet',1),
(217,1207,12,'',0,'Rabat-SalÃ©-Zemour-ZaÃ«r',1),
(218,1208,12,'',0,'Grand Cassablanca',1),
(219,1209,12,'',0,'Chaouia-Ouardigha',1),
(220,1210,12,'',0,'Doukahla-Adba',1),
(221,1211,12,'',0,'Marrakech-Tensift-Al Haouz',1),
(222,1212,12,'',0,'Tadla-Azilal',1),
(223,1213,12,'',0,'Sous-Massa-DrÃ¢a',1),
(224,1214,12,'',0,'Guelmim-Es Smara',1),
(225,1215,12,'',0,'LaÃ¢youne-Boujdour-Sakia el Hamra',1),
(226,1216,12,'',0,'Oued Ed-Dahab Lagouira',1),
(227,1701,17,'',0,'Provincies van Nederland ',1),
(228,17801,178,'',0,'Panama',1),
(229,18101,181,'',0,'Amazonas',1),
(230,18102,181,'',0,'Ancash',1),
(231,18103,181,'',0,'Apurimac',1),
(232,18104,181,'',0,'Arequipa',1),
(233,18105,181,'',0,'Ayacucho',1),
(234,18106,181,'',0,'Cajamarca',1),
(235,18107,181,'',0,'Callao',1),
(236,18108,181,'',0,'Cuzco',1),
(237,18109,181,'',0,'Huancavelica',1),
(238,18110,181,'',0,'Huanuco',1),
(239,18111,181,'',0,'Ica',1),
(240,18112,181,'',0,'Junin',1),
(241,18113,181,'',0,'La Libertad',1),
(242,18114,181,'',0,'Lambayeque',1),
(243,18115,181,'',0,'Lima Metropolitana',1),
(244,18116,181,'',0,'Lima',1),
(245,18117,181,'',0,'Loreto',1),
(246,18118,181,'',0,'Madre de Dios',1),
(247,18119,181,'',0,'Moquegua',1),
(248,18120,181,'',0,'Pasco',1),
(249,18121,181,'',0,'Piura',1),
(250,18122,181,'',0,'Puno',1),
(251,18123,181,'',0,'San MartÃ­n',1),
(252,18124,181,'',0,'Tacna',1),
(253,18125,181,'',0,'Tumbes',1),
(254,18126,181,'',0,'Ucayali',1),
(255,15001,25,'PT',NULL,'Portugal',1),
(256,15002,25,'PT9',NULL,'Azores-Madeira',1);
/*!40000 ALTER TABLE `llx_c_regions` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_revenuestamp`
--

DROP TABLE IF EXISTS `llx_c_revenuestamp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_revenuestamp` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_pays` int(11) NOT NULL,
  `taux` double NOT NULL,
  `revenuestamp_type` varchar(16) NOT NULL DEFAULT 'fixed',
  `note` varchar(128) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `accountancy_code_sell` varchar(32) DEFAULT NULL,
  `accountancy_code_buy` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=22103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_revenuestamp`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_revenuestamp` WRITE;
/*!40000 ALTER TABLE `llx_c_revenuestamp` DISABLE KEYS */;
INSERT INTO `llx_c_revenuestamp` VALUES
(101,10,0.4,'fixed','Revenue stamp tunisia',1,NULL,NULL),
(1021,102,1.2,'percent','Î£Ï…Î½Ï„ÎµÎ»ÎµÏƒÏ„Î®Ï‚ 1,2 %',1,NULL,NULL),
(1022,102,2.4,'percent','Î£Ï…Î½Ï„ÎµÎ»ÎµÏƒÏ„Î®Ï‚ 2,4 %',1,NULL,NULL),
(1023,102,3.6,'percent','Î£Ï…Î½Ï„ÎµÎ»ÎµÏƒÏ„Î®Ï‚ 3,6 %',1,NULL,NULL),
(1024,102,1,'fixed','Î›Î¿Î¹Ï€Î­Ï‚ Ï€ÎµÏÎ¹Ï€Ï„ÏŽÏƒÎµÎ¹Ï‚ Î§Î±ÏÏ„Î¿ÏƒÎ®Î¼Î¿Ï…',1,NULL,NULL),
(1541,154,1.5,'percent','Revenue stamp mexico',1,NULL,NULL),
(1542,154,3,'percent','Revenue stamp mexico',1,NULL,NULL),
(22101,221,0.00948,'percent','Mukavelenameler Damga Vergisi',1,NULL,NULL),
(22102,221,0.00189,'percent','Kira mukavelenameleri Damga Vergisi',1,NULL,NULL);
/*!40000 ALTER TABLE `llx_c_revenuestamp` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_shipment_mode`
--

DROP TABLE IF EXISTS `llx_c_shipment_mode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_shipment_mode` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `code` varchar(30) NOT NULL,
  `libelle` varchar(128) NOT NULL,
  `description` text DEFAULT NULL,
  `tracking` varchar(255) DEFAULT NULL,
  `active` tinyint(4) DEFAULT 0,
  `module` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_shipment_mode` (`code`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_shipment_mode`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_shipment_mode` WRITE;
/*!40000 ALTER TABLE `llx_c_shipment_mode` DISABLE KEYS */;
INSERT INTO `llx_c_shipment_mode` VALUES
(1,1,'2026-09-23 07:34:02','CATCH','In-Store Collection','In-store collection by the customer','',1,NULL),
(2,1,'2026-09-23 07:34:02','TRANS','Generic transport service','Generic transport service','',1,NULL),
(3,1,'2026-09-23 07:34:02','COLSUI','Colissimo Suivi','Colissimo Suivi','https://www.laposte.fr/outils/suivre-vos-envois?code={TRACKID}',0,NULL),
(4,1,'2026-09-23 07:34:02','LETTREMAX','Lettre Max','Courrier Suivi et Lettre Max','https://www.laposte.fr/outils/suivre-vos-envois?code={TRACKID}',0,NULL),
(5,1,'2026-09-23 07:34:02','UPS','UPS','United Parcel Service','http://wwwapps.ups.com/etracking/tracking.cgi?InquiryNumber2=&InquiryNumber3=&tracknums_displayed=3&loc=fr_FR&TypeOfInquiryNumber=T&HTMLVersion=4.0&InquiryNumber22=&InquiryNumber32=&track=Track&Suivi.x=64&Suivi.y=7&Suivi=Valider&InquiryNumber1={TRACKID}',1,NULL),
(6,1,'2026-09-23 07:34:02','KIALA','KIALA','Relais Kiala','http://www.kiala.fr/tnt/delivery/{TRACKID}',0,NULL),
(7,1,'2026-09-23 07:34:02','GLS','GLS','General Logistics Systems','https://gls-group.eu/FR/fr/suivi-colis?match={TRACKID}',0,NULL),
(8,1,'2026-09-23 07:34:02','CHRONO','Chronopost','Chronopost','http://www.chronopost.fr/expedier/inputLTNumbersNoJahia.do?listeNumeros={TRACKID}',0,NULL),
(9,1,'2026-09-23 07:34:02','INPERSON','In person at your site',NULL,NULL,0,NULL),
(10,1,'2026-09-23 07:34:02','FEDEX','Fedex',NULL,'https://www.fedex.com/apps/fedextrack/index.html?tracknumbers={TRACKID}',0,NULL),
(11,1,'2026-09-23 07:34:02','TNT','TNT',NULL,'https://www.tnt.com/express/fr_fr/site/outils-expedition/suivi.html?searchType=con&cons=={TRACKID}',0,NULL),
(12,1,'2026-09-23 07:34:02','DHL','DHL',NULL,'https://www.dhl.com/fr-fr/home/tracking/tracking-global-forwarding.html?submit=1&tracking-id={TRACKID}',0,NULL),
(13,1,'2026-09-23 07:34:02','DPD','DPD',NULL,'https://www.dpd.fr/trace/{TRACKID}',0,NULL),
(14,1,'2026-09-23 07:34:02','MAINFREIGHT','Mainfreight',NULL,'https://www.mainfreight.com/track?{TRACKID}',0,NULL);
/*!40000 ALTER TABLE `llx_c_shipment_mode` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_shipment_package_type`
--

DROP TABLE IF EXISTS `llx_c_shipment_package_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_shipment_package_type` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(128) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT 1,
  `entity` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_shipment_package_type`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_shipment_package_type` WRITE;
/*!40000 ALTER TABLE `llx_c_shipment_package_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_c_shipment_package_type` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_socialnetworks`
--

DROP TABLE IF EXISTS `llx_c_socialnetworks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_socialnetworks` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `code` varchar(100) DEFAULT NULL,
  `label` varchar(150) DEFAULT NULL,
  `url` text DEFAULT NULL,
  `icon` varchar(20) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_c_socialnetworks_code_entity` (`entity`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_socialnetworks`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_socialnetworks` WRITE;
/*!40000 ALTER TABLE `llx_c_socialnetworks` DISABLE KEYS */;
INSERT INTO `llx_c_socialnetworks` VALUES
(1,1,'500px','500px','{socialid}','fa-500px',0),
(2,1,'dailymotion','Dailymotion','{socialid}','',0),
(3,1,'diaspora','Diaspora','{socialid}','',0),
(4,1,'discord','Discord','{socialid}','fa-discord',0),
(5,1,'facebook','Facebook','https://www.facebook.com/{socialid}','fa-facebook',1),
(6,1,'flickr','Flickr','{socialid}','fa-flickr',0),
(7,1,'gifycat','Gificat','{socialid}','',0),
(8,1,'giphy','Giphy','{socialid}','',0),
(9,1,'github','GitHub','https://www.github.com/{socialid}','',0),
(10,1,'instagram','Instagram','https://www.instagram.com/{socialid}','fa-instagram',0),
(11,1,'linkedin','LinkedIn','https://www.linkedin.com/in/{socialid}','fa-linkedin',1),
(12,1,'mastodon','Mastodon','{socialid}','fa-mastodon',1),
(13,1,'meetup','Meetup','{socialid}','fa-meetup',0),
(14,1,'periscope','Periscope','{socialid}','',0),
(15,1,'pinterest','Pinterest','{socialid}','fa-pinterest',0),
(16,1,'pixelfed','Pixelfed','{socialid}','fa-pixelfed',0),
(17,1,'quora','Quora','{socialid}','',0),
(18,1,'reddit','Reddit','{socialid}','fa-reddit',0),
(19,1,'slack','Slack','{socialid}','fa-slack',0),
(20,1,'snapchat','Snapchat','{socialid}','fa-snapchat',0),
(21,1,'skype','Skype','https://www.skype.com/{socialid}','fa-skype',0),
(22,1,'tripadvisor','Tripadvisor','{socialid}','',0),
(23,1,'tumblr','Tumblr','https://www.tumblr.com/{socialid}','fa-tumblr',0),
(24,1,'twitch','Twitch','{socialid}','',0),
(25,1,'twitter','X-Twitter','https://www.x.com/{socialid}','fa-twitter',1),
(26,1,'vero','Vero','https://vero.co/{socialid}','',0),
(27,1,'viadeo','Viadeo','https://fr.viadeo.com/fr/{socialid}','fa-viadeo',0),
(28,1,'viber','Viber','{socialid}','',0),
(29,1,'vimeo','Vimeo','{socialid}','fa-vimeo',0),
(30,1,'whatsapp','Whatsapp','https://web.whatsapp.com/send?phone={socialid}','fa-whatsapp',1),
(31,1,'wikipedia','Wikipedia','{socialid}','fa-wikipedia-w',0),
(32,1,'xing','Xing','{socialid}','fa-xing',0),
(33,1,'youtube','Youtube','https://www.youtube.com/{socialid}','fa-youtube',1);
/*!40000 ALTER TABLE `llx_c_socialnetworks` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_stcomm`
--

DROP TABLE IF EXISTS `llx_c_stcomm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_stcomm` (
  `id` int(11) NOT NULL,
  `code` varchar(24) NOT NULL,
  `libelle` varchar(128) DEFAULT NULL,
  `picto` varchar(128) DEFAULT NULL,
  `sortorder` smallint(6) DEFAULT 0,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_c_stcomm` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_stcomm`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_stcomm` WRITE;
/*!40000 ALTER TABLE `llx_c_stcomm` DISABLE KEYS */;
INSERT INTO `llx_c_stcomm` VALUES
(-1,'ST_NO','Do not contact',NULL,0,1),
(0,'ST_NEVER','Never contacted',NULL,0,1),
(1,'ST_TODO','To contact',NULL,0,1),
(2,'ST_PEND','Contact in progress',NULL,0,1),
(3,'ST_DONE','Contacted',NULL,0,1);
/*!40000 ALTER TABLE `llx_c_stcomm` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_stcommcontact`
--

DROP TABLE IF EXISTS `llx_c_stcommcontact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_stcommcontact` (
  `id` int(11) NOT NULL,
  `code` varchar(12) NOT NULL,
  `libelle` varchar(128) DEFAULT NULL,
  `picto` varchar(128) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_c_stcommcontact` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_stcommcontact`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_stcommcontact` WRITE;
/*!40000 ALTER TABLE `llx_c_stcommcontact` DISABLE KEYS */;
INSERT INTO `llx_c_stcommcontact` VALUES
(-1,'ST_NO','Do not contact',NULL,1),
(0,'ST_NEVER','Never contacted',NULL,1),
(1,'ST_TODO','To contact',NULL,1),
(2,'ST_PEND','Contact in progress',NULL,1),
(3,'ST_DONE','Contacted',NULL,1);
/*!40000 ALTER TABLE `llx_c_stcommcontact` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_ticket_category`
--

DROP TABLE IF EXISTS `llx_c_ticket_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_ticket_category` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) DEFAULT 1,
  `code` varchar(32) NOT NULL,
  `label` varchar(128) NOT NULL,
  `public` int(11) DEFAULT 0,
  `use_default` int(11) DEFAULT 1,
  `fk_parent` int(11) NOT NULL DEFAULT 0,
  `force_severity` varchar(32) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `pos` int(11) NOT NULL DEFAULT 0,
  `active` int(11) DEFAULT 1,
  `fk_ticket_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_code` (`code`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_ticket_category`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_ticket_category` WRITE;
/*!40000 ALTER TABLE `llx_c_ticket_category` DISABLE KEYS */;
INSERT INTO `llx_c_ticket_category` VALUES
(1,1,'OTHER','Other',1,1,0,NULL,NULL,10,1,NULL);
/*!40000 ALTER TABLE `llx_c_ticket_category` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_ticket_resolution`
--

DROP TABLE IF EXISTS `llx_c_ticket_resolution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_ticket_resolution` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) DEFAULT 1,
  `code` varchar(32) NOT NULL,
  `pos` varchar(32) NOT NULL,
  `label` varchar(128) NOT NULL,
  `active` int(11) DEFAULT 1,
  `use_default` int(11) DEFAULT 1,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_code` (`code`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_ticket_resolution`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_ticket_resolution` WRITE;
/*!40000 ALTER TABLE `llx_c_ticket_resolution` DISABLE KEYS */;
INSERT INTO `llx_c_ticket_resolution` VALUES
(1,1,'SOLVED','10','Solved',1,0,NULL),
(2,1,'CANCELED','50','Canceled',1,0,NULL),
(3,1,'OTHER','90','Other',1,0,NULL);
/*!40000 ALTER TABLE `llx_c_ticket_resolution` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_ticket_severity`
--

DROP TABLE IF EXISTS `llx_c_ticket_severity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_ticket_severity` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) DEFAULT 1,
  `code` varchar(32) NOT NULL,
  `pos` varchar(32) NOT NULL,
  `label` varchar(128) NOT NULL,
  `color` varchar(10) DEFAULT NULL,
  `active` int(11) DEFAULT 1,
  `use_default` int(11) DEFAULT 1,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_code` (`code`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_ticket_severity`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_ticket_severity` WRITE;
/*!40000 ALTER TABLE `llx_c_ticket_severity` DISABLE KEYS */;
INSERT INTO `llx_c_ticket_severity` VALUES
(1,1,'LOW','10','Low','',1,0,NULL),
(2,1,'NORMAL','20','Normal','',1,1,NULL),
(3,1,'HIGH','30','High','',1,0,NULL),
(4,1,'BLOCKING','40','Critical / blocking','',1,0,NULL);
/*!40000 ALTER TABLE `llx_c_ticket_severity` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_ticket_type`
--

DROP TABLE IF EXISTS `llx_c_ticket_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_ticket_type` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) DEFAULT 1,
  `code` varchar(32) NOT NULL,
  `pos` varchar(32) NOT NULL,
  `label` varchar(128) NOT NULL,
  `active` int(11) DEFAULT 1,
  `use_default` int(11) DEFAULT 1,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_code` (`code`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_ticket_type`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_ticket_type` WRITE;
/*!40000 ALTER TABLE `llx_c_ticket_type` DISABLE KEYS */;
INSERT INTO `llx_c_ticket_type` VALUES
(1,1,'COM','10','Commercial question',1,0,NULL),
(2,1,'HELP','15','Request for functionnal help',1,0,NULL),
(3,1,'ISSUE','20','Issue or bug',1,0,NULL),
(4,1,'PROBLEM','22','Problem',0,0,NULL),
(5,1,'REQUEST','25','Change or enhancement request',1,0,NULL),
(6,1,'PROJECT','30','Project',0,0,NULL),
(7,1,'OTHER','40','Other',1,1,NULL);
/*!40000 ALTER TABLE `llx_c_ticket_type` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_transport_mode`
--

DROP TABLE IF EXISTS `llx_c_transport_mode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_transport_mode` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `code` varchar(3) NOT NULL,
  `label` varchar(255) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_transport_mode` (`code`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_transport_mode`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_transport_mode` WRITE;
/*!40000 ALTER TABLE `llx_c_transport_mode` DISABLE KEYS */;
INSERT INTO `llx_c_transport_mode` VALUES
(1,1,'MAR','Transport maritime (y compris camions ou wagons sur bateau)',1),
(2,1,'TRA','Transport par chemin de fer (y compris camions sur wagon)',1),
(3,1,'ROU','Transport par route',1),
(4,1,'AIR','Transport par air',1),
(5,1,'POS','Envois postaux',1),
(6,1,'OLE','Installations de transport fixe (olÃ©oduc)',1),
(7,1,'NAV','Transport par navigation intÃ©rieure',1),
(8,1,'PRO','Propulsion propre',1);
/*!40000 ALTER TABLE `llx_c_transport_mode` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_tva`
--

DROP TABLE IF EXISTS `llx_c_tva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_tva` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_pays` int(11) NOT NULL,
  `fk_department_buyer` int(11) DEFAULT NULL,
  `code` varchar(10) DEFAULT '',
  `type_vat` smallint(6) NOT NULL DEFAULT 0,
  `taux` double NOT NULL,
  `localtax1` varchar(20) NOT NULL DEFAULT '0',
  `localtax1_type` varchar(10) NOT NULL DEFAULT '0',
  `localtax2` varchar(20) NOT NULL DEFAULT '0',
  `localtax2_type` varchar(10) NOT NULL DEFAULT '0',
  `use_default` tinyint(4) DEFAULT 0,
  `recuperableonly` int(11) NOT NULL DEFAULT 0,
  `einvoice_vatex` varchar(32) DEFAULT NULL,
  `note` varchar(128) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `accountancy_code_sell` varchar(32) DEFAULT NULL,
  `accountancy_code_buy` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_tva_id` (`entity`,`fk_pays`,`code`,`taux`,`recuperableonly`),
  KEY `idx_tva_fk_department_buyer` (`fk_department_buyer`),
  CONSTRAINT `fk_tva_fk_department_buyer` FOREIGN KEY (`fk_department_buyer`) REFERENCES `llx_c_departements` (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=235 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_tva`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_tva` WRITE;
/*!40000 ALTER TABLE `llx_c_tva` DISABLE KEYS */;
INSERT INTO `llx_c_tva` VALUES
(1,1,13,NULL,'',0,0,'0','0','0','0',0,0,NULL,'TVA 0%',1,NULL,NULL),
(2,1,13,NULL,'',0,9,'0','0','0','0',0,0,NULL,'TVA 9%',1,NULL,NULL),
(3,1,13,NULL,'',0,19,'0','0','0','0',0,0,NULL,'TVA 19%',1,NULL,NULL),
(4,1,35,NULL,'',0,0,'0','0','0','0',0,0,NULL,'VAT rate 0',1,NULL,NULL),
(5,1,35,NULL,'',0,7,'0','0','0','0',0,0,NULL,'VAT rate - reduced',1,NULL,NULL),
(6,1,35,NULL,'',0,14,'0','0','0','0',0,0,NULL,'VAT rate - standard',1,NULL,NULL),
(7,1,23,NULL,'',0,0,'0','0','0','0',0,0,NULL,'IVA Rate 0',1,NULL,NULL),
(8,1,23,NULL,'',0,10.5,'0','0','0','0',0,0,NULL,'IVA reduced rate',1,NULL,NULL),
(9,1,23,NULL,'',0,21,'0','0','0','0',0,0,NULL,'IVA standard rate',1,NULL,NULL),
(10,1,28,NULL,'',0,0,'0','0','0','0',0,0,NULL,'VAT rate 0',1,NULL,NULL),
(11,1,28,NULL,'',0,10,'0','0','0','0',0,0,NULL,'VAT rate - standard',1,NULL,NULL),
(12,1,41,NULL,'',0,0,'0','0','0','0',0,0,NULL,'VAT rate 0',1,NULL,NULL),
(13,1,41,NULL,'',0,10,'0','0','0','0',0,0,NULL,'VAT rate - reduced',1,NULL,NULL),
(14,1,41,NULL,'',0,20,'0','0','0','0',0,0,NULL,'VAT rate - standard',1,NULL,NULL),
(15,1,56,NULL,'',0,0,'0','0','0','0',0,0,NULL,'VAT rate - reduced',1,NULL,NULL),
(16,1,59,NULL,'',0,0,'0','0','0','0',0,0,NULL,'VAT rate 0',1,NULL,NULL),
(17,1,59,NULL,'',0,9,'0','0','0','0',0,0,NULL,'VAT rate 9 - reduced',1,NULL,NULL),
(18,1,59,NULL,'',0,20,'0','0','0','0',0,0,NULL,'VAT rate - standard',1,NULL,NULL),
(19,1,2,NULL,'',0,0,'0','0','0','0',0,0,NULL,'VAT rate 0 ou non applicable',1,NULL,NULL),
(20,1,2,NULL,'',0,6,'0','0','0','0',0,0,NULL,'VAT rate - reduced',1,NULL,NULL),
(21,1,2,NULL,'',0,21,'0','0','0','0',0,0,NULL,'VAT rate - standard',1,NULL,NULL),
(22,1,2,NULL,'',0,12,'0','0','0','0',0,0,NULL,'VAT rate - reduced',1,NULL,NULL),
(23,1,14,NULL,'',0,0,'0','0','0','0',0,0,NULL,'VAT rate 0',1,NULL,NULL),
(24,1,14,NULL,'',0,7,'0','0','0','0',0,0,NULL,'VAT rate - standard',1,NULL,NULL),
(25,1,14,NULL,'',0,5,'9.975','1','0','0',0,0,NULL,'GST/TPS and PST/TVQ rate for Province',1,NULL,NULL),
(26,1,24,NULL,'',0,0,'0','0','0','0',0,0,NULL,'VAT rate 0',1,NULL,NULL),
(27,1,24,NULL,'',0,19.25,'0','0','0','0',0,0,NULL,'VAT rate - standard',1,NULL,NULL),
(28,1,67,NULL,'',0,0,'0','0','0','0',0,0,NULL,'VAT rate 0',1,NULL,NULL),
(29,1,67,NULL,'',0,19,'0','0','0','0',0,0,NULL,'VAT rate - standard',1,NULL,NULL),
(30,1,9,NULL,'',0,0,'0','0','0','0',0,0,NULL,'VAT rate 0',1,NULL,NULL),
(31,1,9,NULL,'',0,13,'0','0','0','0',0,0,NULL,'VAT rate - reduced 0',1,NULL,NULL),
(32,1,9,NULL,'',0,3,'0','0','0','0',0,0,NULL,'VAT rate -  super-reduced 0',1,NULL,NULL),
(33,1,9,NULL,'',0,17,'0','0','0','0',0,0,NULL,'VAT rate - standard',1,NULL,NULL),
(34,1,72,NULL,'',0,0,'0','0','0','0',0,0,NULL,'VAT rate 0',1,NULL,NULL),
(35,1,72,NULL,'',0,18,'0.9','1','0','0',0,0,NULL,'VAT rate 18+0.9',1,NULL,NULL),
(36,1,76,NULL,'',0,25,'0','0','0','0',0,0,NULL,'PDV 25%',1,NULL,NULL),
(37,1,76,NULL,'',0,13,'0','0','0','0',0,0,NULL,'PDV 13%',1,NULL,NULL),
(38,1,76,NULL,'',0,5,'0','0','0','0',0,0,NULL,'PDV 5%',1,NULL,NULL),
(39,1,76,NULL,'',0,0,'0','0','0','0',0,0,NULL,'PDV 0%',1,NULL,NULL),
(40,1,78,NULL,'',0,0,'0','0','0','0',0,0,NULL,'VAT rate 0',1,NULL,NULL),
(41,1,78,NULL,'',0,9,'0','0','0','0',0,0,NULL,'VAT rate 9',1,NULL,NULL),
(42,1,78,NULL,'',0,5,'0','0','0','0',0,0,NULL,'VAT rate 5',1,NULL,NULL),
(43,1,78,NULL,'',0,19,'0','0','0','0',0,0,NULL,'VAT rate - standard',1,NULL,NULL),
(44,1,80,NULL,'',0,0,'0','0','0','0',0,0,NULL,'VAT rate 0',1,NULL,NULL),
(45,1,80,NULL,'',0,25,'0','0','0','0',0,0,NULL,'VAT rate - standard',1,NULL,NULL),
(46,1,1,NULL,'',0,0,'0','0','0','0',0,0,NULL,'VAT rate 0 ou non applicable',1,NULL,NULL),
(47,1,1,NULL,'',0,20,'0','0','0','0',0,0,NULL,'VAT rate - standard (France hors DOM-TOM)',1,NULL,NULL),
(48,1,1,NULL,'',0,10,'0','0','0','0',0,0,NULL,'VAT rate - reduced',1,NULL,NULL),
(49,1,1,NULL,'',0,5.5,'0','0','0','0',0,0,NULL,'VAT rate - reduced (France hors DOM-TOM)',1,NULL,NULL),
(50,1,1,NULL,'',0,2.1,'0','0','0','0',0,0,NULL,'VAT rate - super-reduced',1,NULL,NULL),
(51,1,1,NULL,'85',0,8.5,'0','0','0','0',0,0,NULL,'VAT rate - standard (DOM sauf Guyane et Saint-Martin)',0,NULL,NULL),
(52,1,1,NULL,'85NPR',0,8.5,'0','0','0','0',0,1,NULL,'VAT rate - standard (DOM sauf Guyane et Saint-Martin), non perÃ§u par le vendeur mais rÃ©cupÃ©rable par acheteur',0,NULL,NULL),
(53,1,1,NULL,'85NPROM',0,8.5,'2','3','0','0',0,1,NULL,'VAT rate - standard (DOM sauf Guyane et Saint-Martin), NPR, Octroi de Mer',0,NULL,NULL),
(54,1,1,NULL,'85NPROMOMR',0,8.5,'2','3','2.5','3',0,1,NULL,'VAT rate - standard (DOM sauf Guyane et Saint-Martin), NPR, Octroi de Mer et Octroi de Mer Regional',0,NULL,NULL),
(55,1,16,NULL,'',0,0,'0','0','0','0',0,0,NULL,'VAT rate 0',1,NULL,NULL),
(56,1,16,NULL,'TPS95',0,10,'0','0','0','0',0,0,NULL,'VAT 9.5',1,NULL,NULL),
(57,1,16,NULL,'TPS95C',0,10,'1','1','0','0',0,0,NULL,'VAT 9.5+CSS',1,NULL,NULL),
(58,1,16,NULL,'TPS10',0,10,'0','0','0','0',0,0,NULL,'VAT 10',1,NULL,NULL),
(59,1,16,NULL,'TPS10C',0,10,'1','1','0','0',0,0,NULL,'VAT 10+CSS',1,NULL,NULL),
(60,1,16,NULL,'TPS18',0,18,'0','0','0','0',0,0,NULL,'VAT 18',1,NULL,NULL),
(61,1,16,NULL,'TPS18C',0,18,'1','1','0','0',0,0,NULL,'VAT 18+CSS',1,NULL,NULL),
(62,1,5,NULL,'',0,0,'0','0','0','0',0,0,NULL,'No VAT',1,NULL,NULL),
(63,1,5,NULL,'',0,7,'0','0','0','0',0,0,NULL,'ermÃ¤ÃŸigte USt.',1,NULL,NULL),
(64,1,5,NULL,'',0,5.5,'0','0','0','0',0,0,NULL,'USt. Forst',0,NULL,NULL),
(65,1,5,NULL,'',0,10.7,'0','0','0','0',0,0,NULL,'USt. Landwirtschaft',0,NULL,NULL),
(66,1,5,NULL,'',0,19,'0','0','0','0',0,0,NULL,'allgemeine Ust.',1,NULL,NULL),
(67,1,102,NULL,'',0,0,'0','0','0','0',0,0,NULL,'ÎœÎ·Î´ÎµÎ½Î¹ÎºÏŒ Î¦.Î .Î‘.',1,NULL,NULL),
(68,1,102,NULL,'',0,24,'0','0','0','0',0,0,NULL,'ÎšÎ±Î½Î¿Î½Î¹ÎºÏŒÏ‚ Î¦.Î .Î‘.',1,NULL,NULL),
(69,1,102,NULL,'',0,13,'0','0','0','0',0,0,NULL,'ÎœÎµÎ¹Ï‰Î¼Î­Î½Î¿Ï‚ Î¦.Î .Î‘.',1,NULL,NULL),
(70,1,102,NULL,'',0,6,'0','0','0','0',0,0,NULL,'Î¥Ï€ÎµÏÎ¼ÎµÎ¹Ï‰Î¼Î­Î½Î¿Ï‚ Î¦.Î .Î‘.',1,NULL,NULL),
(71,1,102,NULL,'',0,3,'0','0','0','0',0,0,NULL,'ÎÎ®ÏƒÏ‰Î½ Ï…Ï€ÎµÏÎ¼ÎµÎ¹Ï‰Î¼Î­Î½Î¿Ï‚ Î¦.Î .Î‘.',1,NULL,NULL),
(72,1,102,NULL,'',0,9,'0','0','0','0',0,0,NULL,'ÎÎ®ÏƒÏ‰Î½ Î¼ÎµÎ¹Ï‰Î¼Î­Î½Î¿Ï‚ Î¦.Î .Î‘.',1,NULL,NULL),
(73,1,102,NULL,'',0,4,'0','0','0','0',0,0,NULL,'ÎÎ®ÏƒÏ‰Î½ Ï…Ï€ÎµÏÎ¼ÎµÎ¹Ï‰Î¼Î­Î½Î¿Ï‚ Î¦.Î .Î‘.',1,NULL,NULL),
(74,1,102,NULL,'',0,17,'0','0','0','0',0,0,NULL,'ÎÎ®ÏƒÏ‰Î½ Ï…Ï€ÎµÏÎ¼ÎµÎ¹Ï‰Î¼Î­Î½Î¿Ï‚ Î¦.Î .Î‘.',1,NULL,NULL),
(75,1,18,NULL,'',0,0,'0','0','0','0',0,0,NULL,'VAT rate 0',1,NULL,NULL),
(76,1,18,NULL,'',0,5,'0','0','0','0',0,0,NULL,'VAT rate 5',1,NULL,NULL),
(77,1,18,NULL,'',0,18,'0','0','0','0',0,0,NULL,'VAT rate 18',1,NULL,NULL),
(78,1,18,NULL,'',0,27,'0','0','0','0',0,0,NULL,'VAT rate - standard',1,NULL,NULL),
(79,1,116,NULL,'',0,0,'0','0','0','0',0,0,NULL,'VAT rate 0',1,NULL,NULL),
(80,1,116,NULL,'',0,25.5,'0','0','0','0',0,0,NULL,'VAT rate - standard',1,NULL,NULL),
(81,1,116,NULL,'',0,7,'0','0','0','0',0,0,NULL,'VAT rate - reduced',1,NULL,NULL),
(82,1,117,NULL,'',0,0,'0','0','0','0',0,0,NULL,'VAT rate 0',0,NULL,NULL),
(83,1,117,NULL,'C+S-5',0,0,'2.5','1','2.5','1',0,0,NULL,'CGST+SGST - Same state sales',1,NULL,NULL),
(84,1,117,NULL,'I-5',0,5,'0','0','0','0',0,0,NULL,'IGST',1,NULL,NULL),
(85,1,117,NULL,'C+S-12',0,0,'6','1','6','1',0,0,NULL,'CGST+SGST - Same state sales',1,NULL,NULL),
(86,1,117,NULL,'I-12',0,12,'0','0','0','0',0,0,NULL,'IGST',1,NULL,NULL),
(87,1,117,NULL,'C+S-18',0,0,'9','1','9','1',0,0,NULL,'CGST+SGST - Same state sales',1,NULL,NULL),
(88,1,117,NULL,'I-18',0,18,'0','0','0','0',0,0,NULL,'IGST',1,NULL,NULL),
(89,1,117,NULL,'C+S-28',0,0,'14','1','14','1',0,0,NULL,'CGST+SGST - Same state sales',1,NULL,NULL),
(90,1,117,NULL,'I-28',0,28,'0','0','0','0',0,0,NULL,'IGST',1,NULL,NULL),
(91,1,8,NULL,'',0,0,'0','0','0','0',0,0,NULL,'VAT rate 0',1,NULL,NULL),
(92,1,8,NULL,'',0,23,'0','0','0','0',0,0,NULL,'VAT rate - standard',1,NULL,NULL),
(93,1,8,NULL,'',0,13.5,'0','0','0','0',0,0,NULL,'VAT rate - reduced',1,NULL,NULL),
(94,1,8,NULL,'',0,9,'0','0','0','0',0,0,NULL,'VAT rate - reduced',1,NULL,NULL),
(95,1,8,NULL,'',0,4.8,'0','0','0','0',0,0,NULL,'VAT rate - reduced',1,NULL,NULL),
(96,1,3,NULL,'',0,0,'0','0','0','0',0,0,NULL,'VAT rate 0',1,NULL,NULL),
(97,1,3,NULL,'',0,10,'0','0','0','0',0,0,NULL,'VAT rate - reduced 1',1,NULL,NULL),
(98,1,3,NULL,'',0,5,'0','0','0','0',0,0,NULL,'VAT rate - reduced 2',1,NULL,NULL),
(99,1,3,NULL,'',0,4,'0','0','0','0',0,0,NULL,'VAT rate - super-reduced',1,NULL,NULL),
(100,1,3,NULL,'',0,22,'0','0','0','0',0,0,NULL,'VAT rate - standard',1,NULL,NULL),
(101,1,21,NULL,'',0,0,'0','0','0','0',0,0,NULL,'IVA Rate 0',1,NULL,NULL),
(102,1,21,NULL,'',0,18,'7.5','2','0','0',0,0,NULL,'IVA standard rate',1,NULL,NULL),
(103,1,123,NULL,'',0,0,'0','0','0','0',0,0,NULL,'VAT rate 0',1,NULL,NULL),
(104,1,123,NULL,'',0,5,'0','0','0','0',0,0,NULL,'VAT rate 5',1,NULL,NULL),
(105,1,140,NULL,'',0,0,'0','0','0','0',0,0,NULL,'VAT rate 0',1,NULL,NULL),
(106,1,140,NULL,'',0,14,'0','0','0','0',0,0,NULL,'VAT rate - intermediary',1,NULL,NULL),
(107,1,140,NULL,'',0,8,'0','0','0','0',0,0,NULL,'VAT rate - reduced',1,NULL,NULL),
(108,1,140,NULL,'',0,3,'0','0','0','0',0,0,NULL,'VAT rate - super-reduced',1,NULL,NULL),
(109,1,140,NULL,'',0,17,'0','0','0','0',0,0,NULL,'VAT rate - standard',1,NULL,NULL),
(110,1,147,NULL,'',0,0,'0','0','0','0',0,0,NULL,'VAT rate 0',1,NULL,NULL),
(111,1,147,NULL,'',0,18,'0','0','0','0',0,0,NULL,'VAT rate - standard',1,NULL,NULL),
(112,1,27,NULL,'',0,0,'0','0','0','0',0,0,NULL,'VAT rate 0 ou non applicable',1,NULL,NULL),
(113,1,27,NULL,'',0,8.5,'0','0','0','0',0,0,NULL,'VAT rate - standard (DOM sauf Guyane et Saint-Martin)',0,NULL,NULL),
(114,1,27,NULL,'',0,8.5,'0','0','0','0',0,1,NULL,'VAT rate - standard (DOM sauf Guyane et Saint-Martin), non perÃ§u par le vendeur mais rÃ©cupÃ©rable par acheteur',0,NULL,NULL),
(115,1,27,NULL,'',0,5.5,'0','0','0','0',0,0,NULL,'VAT rate - reduced (France hors DOM-TOM)',0,NULL,NULL),
(116,1,27,NULL,'',0,19.6,'0','0','0','0',0,0,NULL,'VAT rate - standard (France hors DOM-TOM)',1,NULL,NULL),
(117,1,27,NULL,'',0,2.1,'0','0','0','0',0,0,NULL,'VAT rate - super-reduced',1,NULL,NULL),
(118,1,27,NULL,'',0,7,'0','0','0','0',0,0,NULL,'VAT rate - reduced',1,NULL,NULL),
(119,1,12,NULL,'',0,0,'0','0','0','0',0,0,NULL,'VAT rate 0',1,NULL,NULL),
(120,1,12,NULL,'',0,14,'0','0','0','0',0,0,NULL,'VAT rate - reduced',1,NULL,NULL),
(121,1,12,NULL,'',0,10,'0','0','0','0',0,0,NULL,'VAT rate - reduced',1,NULL,NULL),
(122,1,12,NULL,'',0,7,'0','0','0','0',0,0,NULL,'VAT rate - super-reduced',1,NULL,NULL),
(123,1,12,NULL,'',0,20,'0','0','0','0',0,0,NULL,'VAT rate - standard',1,NULL,NULL),
(124,1,148,NULL,'',0,0,'0','0','0','0',0,0,NULL,'VAT rate 0',1,NULL,NULL),
(125,1,148,NULL,'',0,7,'0','0','0','0',0,0,NULL,'VAT rate - reduced',1,NULL,NULL),
(126,1,148,NULL,'',0,5,'0','0','0','0',0,0,NULL,'VAT rate - super-reduced',1,NULL,NULL),
(127,1,148,NULL,'',0,18,'0','0','0','0',0,0,NULL,'VAT rate - standard',1,NULL,NULL),
(128,1,17,NULL,'',0,0,'0','0','0','0',0,0,NULL,'0 BTW tarief',1,NULL,NULL),
(129,1,17,NULL,'',0,9,'0','0','0','0',0,0,NULL,'Verlaagd BTW tarief',1,NULL,NULL),
(130,1,17,NULL,'',0,21,'0','0','0','0',0,0,NULL,'Algemeen BTW tarief',0,NULL,NULL),
(131,1,165,NULL,'',0,0,'0','0','0','0',0,0,NULL,'VAT rate 0',1,NULL,NULL),
(132,1,165,NULL,'',0,3,'0','0','0','0',0,0,NULL,'VAT standard 3',1,NULL,NULL),
(133,1,165,NULL,'',0,6,'0','0','0','0',0,0,NULL,'VAT standard 6',1,NULL,NULL),
(134,1,165,NULL,'',0,11,'0','0','0','0',0,0,NULL,'VAT rate - standard',1,NULL,NULL),
(135,1,165,NULL,'',0,22,'0','0','0','0',0,0,NULL,'VAT standard high',1,NULL,NULL),
(136,1,166,NULL,'',0,0,'0','0','0','0',0,0,NULL,'VAT rate 0',1,NULL,NULL),
(137,1,166,NULL,'',0,15,'0','0','0','0',0,0,NULL,'VAT rate - standard',1,NULL,NULL),
(138,1,169,NULL,'',0,0,'0','0','0','0',0,0,NULL,'VAT rate 0',1,NULL,NULL),
(139,1,169,NULL,'',0,5,'0','0','0','0',0,0,NULL,'VAT rate - standard',1,NULL,NULL),
(140,1,173,NULL,'',0,0,'0','0','0','0',0,0,NULL,'VAT rate 0',1,NULL,NULL),
(141,1,173,NULL,'',0,14,'0','0','0','0',0,0,NULL,'VAT rate - reduced',1,NULL,NULL),
(142,1,173,NULL,'',0,8,'0','0','0','0',0,0,NULL,'VAT rate - reduced',1,NULL,NULL),
(143,1,173,NULL,'',0,25,'0','0','0','0',0,0,NULL,'VAT rate - standard',1,NULL,NULL),
(144,1,178,NULL,'',0,0,'0','0','0','0',0,0,NULL,'ITBMS Rate 0',1,NULL,NULL),
(145,1,178,NULL,'',0,7,'0','0','0','0',0,0,NULL,'ITBMS standard rate',1,NULL,NULL),
(146,1,181,NULL,'',0,0,'0','0','0','0',0,0,NULL,'VAT rate 0',1,NULL,NULL),
(147,1,181,NULL,'',0,18,'0','0','0','0',0,0,NULL,'VAT rate - standard',1,NULL,NULL),
(148,1,184,NULL,'',0,0,'0','0','0','0',0,0,NULL,'VAT rate 0',1,NULL,NULL),
(149,1,184,NULL,'',0,8,'0','0','0','0',0,0,NULL,'VAT rate 8 - reduced 2',1,NULL,NULL),
(150,1,184,NULL,'',0,5,'0','0','0','0',0,0,NULL,'VAT rate 5 - reduced 1',1,NULL,NULL),
(151,1,184,NULL,'',0,23,'0','0','0','0',0,0,NULL,'VAT rate - standard',1,NULL,NULL),
(152,1,25,NULL,'',0,0,'0','0','0','0',0,0,NULL,'VAT rate 0',1,NULL,NULL),
(153,1,25,NULL,'',0,13,'0','0','0','0',0,0,NULL,'VAT rate - reduced',1,NULL,NULL),
(154,1,25,NULL,'',0,23,'0','0','0','0',0,0,NULL,'VAT rate - standard',1,NULL,NULL),
(155,1,25,NULL,'',0,6,'0','0','0','0',0,0,NULL,'VAT rate - reduced',1,NULL,NULL),
(156,1,188,NULL,'',0,0,'0','0','0','0',0,0,NULL,'VAT rate 0',1,NULL,NULL),
(157,1,188,NULL,'',0,11,'0','0','0','0',0,0,NULL,'VAT rate - reduced',1,NULL,NULL),
(158,1,188,NULL,'',0,21,'0','0','0','0',0,0,NULL,'VAT rate - standard',1,NULL,NULL),
(159,1,26,NULL,'',0,0,'0','0','0','0',0,0,NULL,'VAT rate 0',1,NULL,NULL),
(160,1,26,NULL,'',0,5,'0','0','0','0',0,0,NULL,'VAT rate 5',1,NULL,NULL),
(161,1,86,NULL,'',0,0,'0','0','0','0',0,0,NULL,'SIN IVA',1,NULL,NULL),
(162,1,86,NULL,'',0,13,'0','0','0','0',0,0,NULL,'IVA 13',1,NULL,NULL),
(163,1,22,NULL,'',0,0,'0','0','0','0',0,0,NULL,'VAT rate 0',1,NULL,NULL),
(164,1,22,NULL,'',0,10,'0','0','0','0',0,0,NULL,'VAT rate - reduced',1,NULL,NULL),
(165,1,22,NULL,'',0,18,'0','0','0','0',0,0,NULL,'VAT rate - standard',1,NULL,NULL),
(166,1,201,NULL,'',0,0,'0','0','0','0',0,0,NULL,'VAT rate 0',1,NULL,NULL),
(167,1,201,NULL,'',0,10,'0','0','0','0',0,0,NULL,'VAT rate - reduced',1,NULL,NULL),
(168,1,201,NULL,'',0,20,'0','0','0','0',0,0,NULL,'VAT rate - standard',1,NULL,NULL),
(169,1,202,NULL,'',0,0,'0','0','0','0',0,0,NULL,'VAT rate 0',1,NULL,NULL),
(170,1,202,NULL,'',0,9.5,'0','0','0','0',0,0,NULL,'VAT rate - reduced',1,NULL,NULL),
(171,1,202,NULL,'',0,22,'0','0','0','0',0,0,NULL,'VAT rate - standard',1,NULL,NULL),
(172,1,205,NULL,'',0,0,'0','0','0','0',0,0,NULL,'VAT rate 0',1,NULL,NULL),
(173,1,205,NULL,'',0,15,'0','0','0','0',0,0,NULL,'VAT rate - standard',1,NULL,NULL),
(174,1,4,NULL,'',0,0,'0','3','-19:-15:-9','5',0,0,NULL,'VAT rate 0',1,NULL,NULL),
(175,1,4,NULL,'',0,10,'1.4','3','-19:-15:-9','5',0,0,NULL,'VAT rate - reduced',1,NULL,NULL),
(176,1,4,NULL,'',0,4,'0.5','3','-19:-15:-9','5',0,0,NULL,'VAT rate - super-reduced',1,NULL,NULL),
(177,1,4,NULL,'',0,21,'5.2','3','-19:-15:-9','5',0,0,NULL,'VAT rate - standard',1,NULL,NULL),
(178,1,20,NULL,'',0,0,'0','0','0','0',0,0,NULL,'VAT rate 0',1,NULL,NULL),
(179,1,20,NULL,'',0,12,'0','0','0','0',0,0,NULL,'VAT rate - reduced',1,NULL,NULL),
(180,1,20,NULL,'',0,6,'0','0','0','0',0,0,NULL,'VAT rate - super-reduced',1,NULL,NULL),
(181,1,20,NULL,'',0,25,'0','0','0','0',0,0,NULL,'VAT rate - standard',1,NULL,NULL),
(182,1,6,NULL,'',0,0,'0','0','0','0',0,0,NULL,'VAT rate 0',1,NULL,NULL),
(183,1,6,NULL,'',0,3.8,'0','0','0','0',0,0,NULL,'VAT rate - reduced',1,NULL,NULL),
(184,1,6,NULL,'',0,2.6,'0','0','0','0',0,0,NULL,'VAT rate - super-reduced',1,NULL,NULL),
(185,1,6,NULL,'',0,8.1,'0','0','0','0',0,0,NULL,'VAT rate - standard',1,NULL,NULL),
(186,1,207,NULL,'',0,0,'0','0','0','0',0,0,NULL,'VAT 0',1,NULL,NULL),
(187,1,207,NULL,'',0,15,'0','0','0','0',0,0,NULL,'VAT 15%',1,NULL,NULL),
(188,1,213,NULL,'',0,0,'0','0','0','0',0,0,NULL,'VAT 0',1,NULL,NULL),
(189,1,213,NULL,'',0,5,'0','0','0','0',0,0,NULL,'VAT 5%',1,NULL,NULL),
(190,1,10,NULL,'',0,0,'0','0','0','0',0,0,NULL,'VAT rate 0',1,NULL,NULL),
(191,1,10,NULL,'',0,12,'0','0','0','0',0,0,NULL,'VAT 12%',1,NULL,NULL),
(192,1,10,NULL,'',0,18,'0','0','0','0',0,0,NULL,'VAT 18%',1,NULL,NULL),
(193,1,10,NULL,'',0,7.5,'0','0','0','0',0,0,NULL,'VAT 6% MajorÃ© Ã  25% (7.5%)',1,NULL,NULL),
(194,1,10,NULL,'',0,15,'0','0','0','0',0,0,NULL,'VAT 12% MajorÃ© Ã  25% (15%)',1,NULL,NULL),
(195,1,10,NULL,'',0,22.5,'0','0','0','0',0,0,NULL,'VAT 18% MajorÃ© Ã  25% (22.5%)',1,NULL,NULL),
(196,1,10,NULL,'',0,6,'0','0','0','0',0,0,NULL,'VAT 6%',1,NULL,NULL),
(197,1,10,NULL,'',0,18.18,'1','4','0','0',0,0,NULL,'VAT 18%+FODEC',1,NULL,NULL),
(198,1,226,NULL,'',0,0,'0','0','0','0',0,0,NULL,'VAT rate 0',1,NULL,NULL),
(199,1,226,NULL,'',0,20,'0','0','0','0',0,0,NULL,'VAT standart rate',1,NULL,NULL),
(200,1,7,NULL,'',0,0,'0','0','0','0',0,0,NULL,'VAT rate 0',1,NULL,NULL),
(201,1,7,NULL,'',0,17.5,'0','0','0','0',0,0,NULL,'VAT rate - standard before 2011',1,NULL,NULL),
(202,1,7,NULL,'',0,5,'0','0','0','0',0,0,NULL,'VAT rate - reduced',1,NULL,NULL),
(203,1,7,NULL,'',0,20,'0','0','0','0',0,0,NULL,'VAT rate - standard',1,NULL,NULL),
(204,1,11,NULL,'',0,0,'0','0','0','0',0,0,NULL,'No Sales Tax',1,NULL,NULL),
(205,1,11,NULL,'',0,4,'0','0','0','0',0,0,NULL,'Sales Tax 4%',1,NULL,NULL),
(206,1,11,NULL,'',0,6,'0','0','0','0',0,0,NULL,'Sales Tax 6%',1,NULL,NULL),
(207,1,193,NULL,'',0,0,'0','0','0','0',0,0,NULL,'No VAT in SPM',1,NULL,NULL),
(208,1,246,NULL,'',0,0,'0','0','0','0',0,0,NULL,'VAT rate 0',1,NULL,NULL),
(209,1,151,NULL,'',0,0,'0','0','0','0',0,0,NULL,'VAT rate 0',1,NULL,NULL),
(210,1,151,NULL,'',0,14,'0','0','0','0',0,0,NULL,'VAT rate 14',1,NULL,NULL),
(211,1,152,NULL,'',0,0,'0','0','0','0',0,0,NULL,'VAT rate 0',1,NULL,NULL),
(212,1,152,NULL,'',0,15,'0','0','0','0',0,0,NULL,'VAT rate 15',1,NULL,NULL),
(213,1,114,NULL,'',0,0,'0','0','0','0',0,0,NULL,'No ISV',1,NULL,NULL),
(214,1,114,NULL,'',0,12,'0','0','0','0',0,0,NULL,'ISV 12%',1,NULL,NULL),
(215,1,154,NULL,'',0,0,'0','0','0','0',0,0,NULL,'No VAT',1,NULL,NULL),
(216,1,154,NULL,'',0,16,'0','0','0','0',0,0,NULL,'VAT 16%',1,NULL,NULL),
(217,1,154,NULL,'',0,10,'0','0','0','0',0,0,NULL,'VAT Frontero',1,NULL,NULL),
(218,1,46,NULL,'',0,0,'0','0','0','0',0,0,NULL,'No VAT',1,NULL,NULL),
(219,1,46,NULL,'',0,15,'0','0','0','0',0,0,NULL,'VAT 15%',1,NULL,NULL),
(220,1,46,NULL,'',0,7.5,'0','0','0','0',0,0,NULL,'VAT 7.5%',1,NULL,NULL),
(221,1,232,NULL,'',0,0,'0','0','0','0',0,0,NULL,'No VAT',1,NULL,NULL),
(222,1,232,NULL,'',0,12,'0','0','0','0',0,0,NULL,'VAT 12%',1,NULL,NULL),
(223,1,232,NULL,'',0,8,'0','0','0','0',0,0,NULL,'VAT 8%',1,NULL,NULL),
(224,1,233,NULL,'',0,0,'0','0','0','0',0,0,NULL,'Thuáº¿ GTGT Ä‘Æ°Æ¡c kháº¥u trá»« 0%',1,NULL,NULL),
(225,1,233,NULL,'',0,5,'0','0','0','0',0,0,NULL,'Thuáº¿ GTGT Ä‘Æ°Æ¡c kháº¥u trá»« 5%',1,NULL,NULL),
(226,1,233,NULL,'',0,8,'0','0','0','0',0,0,NULL,'Thuáº¿ GTGT Ä‘Æ°Æ¡c kháº¥u trá»« 8%',1,NULL,NULL),
(227,1,233,NULL,'',0,10,'0','0','0','0',0,0,NULL,'Thuáº¿ GTGT Ä‘Æ°Æ¡c kháº¥u trá»« 10%',1,NULL,NULL),
(228,1,61,NULL,'',0,0,'0','0','0','0',0,0,NULL,'No VAT',1,NULL,NULL),
(229,1,61,NULL,'',0,10,'0','0','0','0',0,0,NULL,'VAT 10%',1,NULL,NULL),
(230,1,61,NULL,'',0,18,'0','0','0','0',0,0,NULL,'VAT 18%',1,NULL,NULL),
(231,1,221,NULL,'',0,0,'0','0','0','0',0,0,NULL,'No VAT',1,NULL,NULL),
(232,1,221,NULL,'',0,1,'0','0','0','0',0,0,NULL,'VAT 1%',1,NULL,NULL),
(233,1,221,NULL,'',0,8,'0','0','0','0',0,0,NULL,'VAT 8%',1,NULL,NULL),
(234,1,221,NULL,'',0,18,'0','0','0','0',0,0,NULL,'VAT 18%',1,NULL,NULL);
/*!40000 ALTER TABLE `llx_c_tva` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_type_contact`
--

DROP TABLE IF EXISTS `llx_c_type_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_type_contact` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `element` varchar(64) NOT NULL,
  `source` varchar(8) NOT NULL DEFAULT 'external',
  `code` varchar(32) NOT NULL,
  `libelle` varchar(128) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `module` varchar(32) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_type_contact_id` (`element`,`source`,`code`),
  KEY `idx_c_type_contact_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_type_contact`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_type_contact` WRITE;
/*!40000 ALTER TABLE `llx_c_type_contact` DISABLE KEYS */;
INSERT INTO `llx_c_type_contact` VALUES
(1,'contrat','internal','SALESREPFOLL','Contract manager',1,NULL,0),
(2,'contrat','external','CUSTOMER','Customer contract manager',1,NULL,0),
(3,'contrat','external','BILLING','Customer billing manager',1,NULL,0),
(4,'contrat','internal','SALESREPSIGN','Contract signatory',1,NULL,0),
(5,'contrat','external','SALESREPSIGN','Contract signatory customer',1,NULL,0),
(6,'propal','internal','SALESREPFOLL','Pricing and quotation manager',1,NULL,0),
(7,'propal','external','CUSTOMER','Customer pricing and quotation manager',1,NULL,0),
(8,'propal','external','BILLING','Customer billing manager',1,NULL,0),
(9,'propal','external','SHIPPING','Customer shipping manager',1,NULL,0),
(10,'propal','external','SERVICE','Customer contact performing the service',0,NULL,0),
(11,'facture','internal','SALESREPFOLL','Billing manager',1,NULL,0),
(12,'facture','external','BILLING','Customer billing manager',1,NULL,0),
(13,'facture','external','SHIPPING','Customer shipping manager',1,NULL,0),
(14,'facture','external','SERVICE','Customer contact performing the service',0,NULL,0),
(15,'invoice_supplier','internal','SALESREPFOLL','Billing manager',1,NULL,0),
(16,'invoice_supplier','external','BILLING','Supplier billing manager',1,NULL,0),
(17,'invoice_supplier','external','SHIPPING','Supplier shipping manager',1,NULL,0),
(18,'invoice_supplier','external','SERVICE','Supplier contact performing the service',0,NULL,0),
(19,'agenda','internal','ACTOR','Owner',1,NULL,0),
(20,'agenda','internal','GUEST','Guest',1,NULL,0),
(21,'agenda','external','ACTOR','Owner',1,NULL,0),
(22,'agenda','external','GUEST','Guest',1,NULL,0),
(23,'commande','internal','SALESREPFOLL','Order fulfillment manager',1,NULL,0),
(24,'commande','external','CUSTOMER','Customer order fulfillment manager',1,NULL,0),
(25,'commande','external','BILLING','Customer billing manager',1,NULL,0),
(26,'commande','external','SHIPPING','Customer shipping manager',1,NULL,0),
(27,'commande','external','SERVICE','Customer contact performing the service',0,NULL,0),
(28,'shipping','internal','SALESREPFOLL','Shipping operations manager',1,NULL,0),
(29,'shipping','external','CUSTOMER','Customer shipping operations manager',1,NULL,0),
(30,'shipping','external','BILLING','Customer invoice contact',1,NULL,0),
(31,'shipping','external','SHIPPING','Customer loading contact',1,NULL,0),
(32,'shipping','external','DELIVERY','Delivery facility',0,NULL,0),
(33,'fichinter','internal','INTERREPFOLL','Intervention manager',1,NULL,0),
(34,'fichinter','internal','INTERVENING','Intervenant',0,NULL,0),
(35,'fichinter','external','BILLING','Customer billing manager',1,NULL,0),
(36,'fichinter','external','CUSTOMER','Customer intervention manager',1,NULL,0),
(37,'order_supplier','internal','SALESREPFOLL','Purchase order fulfillment manager',1,NULL,0),
(38,'order_supplier','internal','SHIPPING','Purchase order shipping manager',1,NULL,0),
(39,'order_supplier','external','CUSTOMER','Purchase order fulfillment manager',1,NULL,0),
(40,'order_supplier','external','BILLING','Supplier billing manager',1,NULL,0),
(41,'order_supplier','external','SHIPPING','Supplier shipping manager',1,NULL,0),
(42,'order_supplier','external','SERVICE','Supplier contact performing the service',0,NULL,0),
(43,'dolresource','internal','USERINCHARGE','In charge of resource',1,NULL,0),
(44,'dolresource','external','THIRDINCHARGE','In charge of resource',1,NULL,0),
(45,'ticket','internal','SUPPORTTEC','Ticket manager',1,NULL,0),
(46,'ticket','internal','CONTRIBUTOR','Intervenant',1,NULL,0),
(47,'ticket','external','SUPPORTCLI','Customer ticket manager',1,NULL,0),
(48,'ticket','external','CONTRIBUTOR','Intervenant',1,NULL,0),
(49,'product','internal','SALESREPFOLL','Product manager',1,NULL,0),
(50,'product','internal','BILLING','Billing manager',1,NULL,0),
(51,'product','external','CUSTOMER','Thirdparty product contact',1,NULL,0),
(52,'product','external','SHIPPING','Shipping manager',1,NULL,0),
(53,'project','internal','PROJECTLEADER','Project leader',1,NULL,0),
(54,'project','internal','PROJECTCONTRIBUTOR','Intervenant',1,NULL,0),
(55,'project','external','PROJECTLEADER','Project leader',1,NULL,0),
(56,'project','external','PROJECTCONTRIBUTOR','Intervenant',1,NULL,0),
(57,'project_task','internal','TASKEXECUTIVE','Responsable',1,NULL,0),
(58,'project_task','internal','TASKCONTRIBUTOR','Intervenant',1,NULL,0),
(59,'project_task','external','TASKEXECUTIVE','Responsable',1,NULL,0),
(60,'project_task','external','TASKCONTRIBUTOR','Intervenant',1,NULL,0),
(61,'supplier_proposal','internal','SALESREPFOLL','Pricing and Quotation manager',1,NULL,0),
(62,'supplier_proposal','external','BILLING','Supplier billing manager',1,NULL,0),
(63,'supplier_proposal','external','CUSTOMER','Pricing and quotation manager',1,NULL,0),
(64,'supplier_proposal','external','SHIPPING','Supplier shipping manager',1,NULL,0),
(65,'supplier_proposal','external','SERVICE','Supplier contact performing the service',0,NULL,0),
(66,'conferenceorbooth','internal','MANAGER','Conference or Booth manager',1,NULL,0),
(67,'conferenceorbooth','external','SPEAKER','Conference Speaker',1,NULL,0),
(68,'conferenceorbooth','external','RESPONSIBLE','Booth responsible',1,NULL,0),
(69,'societe','external','SALESREPTHIRD','Sales Representative',1,NULL,0);
/*!40000 ALTER TABLE `llx_c_type_contact` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_type_container`
--

DROP TABLE IF EXISTS `llx_c_type_container`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_type_container` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `label` varchar(128) NOT NULL,
  `module` varchar(32) DEFAULT NULL,
  `typecontainer` varchar(10) DEFAULT 'page',
  `position` int(11) DEFAULT 0,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_type_container_id` (`code`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_type_container`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_type_container` WRITE;
/*!40000 ALTER TABLE `llx_c_type_container` DISABLE KEYS */;
INSERT INTO `llx_c_type_container` VALUES
(1,'page',1,'Page','system','page',10,1),
(2,'blogpost',1,'BlogPost','system','page',15,1),
(3,'menu',1,'Menu','system','page',30,1),
(4,'banner',1,'Banner','system','page',35,1),
(5,'other',1,'Other','system','page',40,1),
(6,'service',1,'Web Service (for ajax or api call)','system','library',300,1),
(7,'library',1,'Library (functions)','system','library',400,1),
(8,'setup',1,'Setup screen','system','library',500,1);
/*!40000 ALTER TABLE `llx_c_type_container` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_type_fees`
--

DROP TABLE IF EXISTS `llx_c_type_fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_type_fees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(12) NOT NULL,
  `label` varchar(128) DEFAULT NULL,
  `type` int(11) DEFAULT 0,
  `accountancy_code` varchar(32) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `module` varchar(32) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_c_type_fees` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_type_fees`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_type_fees` WRITE;
/*!40000 ALTER TABLE `llx_c_type_fees` DISABLE KEYS */;
INSERT INTO `llx_c_type_fees` VALUES
(1,'TF_OTHER','Other',0,NULL,1,NULL,0),
(2,'TF_TRIP','Transportation',0,NULL,1,NULL,0),
(3,'TF_LUNCH','Lunch',0,NULL,1,NULL,0),
(4,'EX_KME','ExpLabelKm',0,NULL,1,NULL,0),
(5,'EX_FUE','ExpLabelFuelCV',0,NULL,0,NULL,0),
(6,'EX_HOT','ExpLabelHotel',0,NULL,0,NULL,0),
(7,'EX_PAR','ExpLabelParkingCV',0,NULL,0,NULL,0),
(8,'EX_TOL','ExpLabelTollCV',0,NULL,0,NULL,0),
(9,'EX_TAX','ExpLabelVariousTaxes',0,NULL,0,NULL,0),
(10,'EX_IND','ExpLabelIndemnityTransSubscrip',0,NULL,0,NULL,0),
(11,'EX_SUM','ExpLabelMaintenanceSupply',0,NULL,0,NULL,0),
(12,'EX_SUO','ExpLabelOfficeSupplies',0,NULL,0,NULL,0),
(13,'EX_CAR','ExpLabelCarRental',0,NULL,0,NULL,0),
(14,'EX_DOC','ExpLabelDocumentation',0,NULL,0,NULL,0),
(15,'EX_CUR','ExpLabelCustomersReceiving',0,NULL,0,NULL,0),
(16,'EX_OTR','ExpLabelOtherReceiving',0,NULL,0,NULL,0),
(17,'EX_POS','ExpLabelPostage',0,NULL,0,NULL,0),
(18,'EX_CAM','ExpLabelMaintenanceRepairCV',0,NULL,0,NULL,0),
(19,'EX_EMM','ExpLabelEmployeesMeal',0,NULL,0,NULL,0),
(20,'EX_GUM','ExpLabelGuestsMeal',0,NULL,0,NULL,0),
(21,'EX_BRE','ExpLabelBreakfast',0,NULL,0,NULL,0),
(22,'EX_FUE_VP','ExpLabelFuelPV',0,NULL,0,NULL,0),
(23,'EX_TOL_VP','ExpLabelTollPV',0,NULL,0,NULL,0),
(24,'EX_PAR_VP','ExpLabelParkingPV',0,NULL,0,NULL,0),
(25,'EX_CAM_VP','ExpLabelMaintenanceRepairPV',0,NULL,0,NULL,0);
/*!40000 ALTER TABLE `llx_c_type_fees` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_type_resource`
--

DROP TABLE IF EXISTS `llx_c_type_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_type_resource` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `label` varchar(128) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_type_resource_id` (`label`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_type_resource`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_type_resource` WRITE;
/*!40000 ALTER TABLE `llx_c_type_resource` DISABLE KEYS */;
INSERT INTO `llx_c_type_resource` VALUES
(1,'RES_ROOMS','Rooms',1),
(2,'RES_CARS','Cars',1);
/*!40000 ALTER TABLE `llx_c_type_resource` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_typent`
--

DROP TABLE IF EXISTS `llx_c_typent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_typent` (
  `id` int(11) NOT NULL,
  `code` varchar(12) NOT NULL,
  `libelle` varchar(128) DEFAULT NULL,
  `fk_country` int(11) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `module` varchar(32) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_c_typent` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_typent`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_typent` WRITE;
/*!40000 ALTER TABLE `llx_c_typent` DISABLE KEYS */;
INSERT INTO `llx_c_typent` VALUES
(1,'TE_STARTUP','Start-up',NULL,0,NULL,0),
(2,'TE_GROUP','Grand groupe',NULL,1,NULL,0),
(3,'TE_MEDIUM','PME/PMI',NULL,1,NULL,0),
(4,'TE_SMALL','TPE',NULL,1,NULL,0),
(5,'TE_ADMIN','Administration',NULL,1,NULL,0),
(6,'TE_WHOLE','Grossiste',NULL,0,NULL,0),
(7,'TE_RETAIL','Revendeur',NULL,0,NULL,0),
(8,'TE_PRIVATE','Particulier',NULL,1,NULL,0),
(100,'TE_OTHER','Autres',NULL,1,NULL,0),
(231,'TE_A_RI','Responsable Inscripto (typo A)',23,0,NULL,0),
(232,'TE_B_RNI','Responsable No Inscripto (typo B)',23,0,NULL,0),
(233,'TE_C_FE','Consumidor Final/Exento (typo C)',23,0,NULL,0);
/*!40000 ALTER TABLE `llx_c_typent` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_units`
--

DROP TABLE IF EXISTS `llx_c_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_units` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(3) DEFAULT NULL,
  `sortorder` smallint(6) DEFAULT NULL,
  `scale` int(11) DEFAULT NULL,
  `label` varchar(128) DEFAULT NULL,
  `short_label` varchar(5) DEFAULT NULL,
  `unit_type` varchar(10) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_units_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_units`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_units` WRITE;
/*!40000 ALTER TABLE `llx_c_units` DISABLE KEYS */;
INSERT INTO `llx_c_units` VALUES
(1,'T',100,3,'WeightUnitton','T','weight',1),
(2,'KG',110,0,'WeightUnitkg','kg','weight',1),
(3,'G',120,-3,'WeightUnitg','g','weight',1),
(4,'MG',130,-6,'WeightUnitmg','mg','weight',1),
(5,'OZ',140,98,'WeightUnitounce','Oz','weight',1),
(6,'LB',150,99,'WeightUnitpound','lb','weight',1),
(7,'M',200,0,'SizeUnitm','m','size',1),
(8,'DM',210,-1,'SizeUnitdm','dm','size',1),
(9,'CM',220,-2,'SizeUnitcm','cm','size',1),
(10,'MM',230,-3,'SizeUnitmm','mm','size',1),
(11,'FT',240,98,'SizeUnitfoot','ft','size',1),
(12,'IN',250,99,'SizeUnitinch','in','size',1),
(13,'M2',300,0,'SurfaceUnitm2','m2','surface',1),
(14,'DM2',310,-2,'SurfaceUnitdm2','dm2','surface',1),
(15,'CM2',320,-4,'SurfaceUnitcm2','cm2','surface',1),
(16,'MM2',330,-6,'SurfaceUnitmm2','mm2','surface',1),
(17,'FT2',340,98,'SurfaceUnitfoot2','ft2','surface',1),
(18,'IN2',350,99,'SurfaceUnitinch2','in2','surface',1),
(19,'M3',400,0,'VolumeUnitm3','m3','volume',1),
(20,'DM3',410,-3,'VolumeUnitdm3','dm3','volume',1),
(21,'CM3',420,-6,'VolumeUnitcm3','cm3','volume',1),
(22,'MM3',430,-9,'VolumeUnitmm3','mm3','volume',1),
(23,'FT3',440,88,'VolumeUnitfoot3','ft3','volume',1),
(24,'IN3',450,89,'VolumeUnitinch3','in3','volume',1),
(25,'OZ3',460,97,'VolumeUnitounce','Oz','volume',1),
(26,'L',470,98,'VolumeUnitlitre','L','volume',1),
(27,'GAL',480,99,'VolumeUnitgallon','gal','volume',1),
(28,'P',500,0,'unitP','p','qty',1),
(29,'SET',510,0,'Set','set','qty',1),
(30,'S',600,1,'second','s','time',1),
(31,'MI',610,60,'minute','mn','time',1),
(32,'H',620,3600,'hour','h','time',1),
(33,'D',630,86400,'day','d','time',1),
(34,'W',640,604800,'week','w','time',1),
(35,'MO',650,2629800,'month','m','time',1),
(36,'Y',660,31557600,'year','y','time',1);
/*!40000 ALTER TABLE `llx_c_units` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_c_ziptown`
--

DROP TABLE IF EXISTS `llx_c_ziptown`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_c_ziptown` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(5) DEFAULT NULL,
  `fk_county` int(11) DEFAULT NULL,
  `fk_pays` int(11) NOT NULL DEFAULT 0,
  `zip` varchar(10) NOT NULL,
  `town` varchar(180) NOT NULL,
  `town_up` varchar(180) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_ziptown_fk_pays` (`zip`,`town`,`fk_pays`),
  KEY `idx_c_ziptown_fk_county` (`fk_county`),
  KEY `idx_c_ziptown_fk_pays` (`fk_pays`),
  KEY `idx_c_ziptown_zip` (`zip`),
  CONSTRAINT `fk_c_ziptown_fk_county` FOREIGN KEY (`fk_county`) REFERENCES `llx_c_departements` (`rowid`),
  CONSTRAINT `fk_c_ziptown_fk_pays` FOREIGN KEY (`fk_pays`) REFERENCES `llx_c_country` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_ziptown`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_c_ziptown` WRITE;
/*!40000 ALTER TABLE `llx_c_ziptown` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_c_ziptown` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_categorie`
--

DROP TABLE IF EXISTS `llx_categorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_categorie` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_parent` int(11) NOT NULL DEFAULT 0,
  `label` varchar(180) NOT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT 1,
  `description` text DEFAULT NULL,
  `color` varchar(8) DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `position` int(11) DEFAULT 0,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_categorie_ref` (`entity`,`fk_parent`,`label`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_categorie`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_categorie` WRITE;
/*!40000 ALTER TABLE `llx_categorie` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_categorie` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_categorie_account`
--

DROP TABLE IF EXISTS `llx_categorie_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_categorie_account` (
  `fk_categorie` int(11) NOT NULL,
  `fk_account` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_account`),
  KEY `idx_categorie_account_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_account_fk_account` (`fk_account`),
  CONSTRAINT `fk_categorie_account_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_account_fk_account` FOREIGN KEY (`fk_account`) REFERENCES `llx_bank_account` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_categorie_account`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_categorie_account` WRITE;
/*!40000 ALTER TABLE `llx_categorie_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_categorie_account` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_categorie_actioncomm`
--

DROP TABLE IF EXISTS `llx_categorie_actioncomm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_categorie_actioncomm` (
  `fk_categorie` int(11) NOT NULL,
  `fk_actioncomm` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_actioncomm`),
  KEY `idx_categorie_actioncomm_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_actioncomm_fk_actioncomm` (`fk_actioncomm`),
  CONSTRAINT `fk_categorie_actioncomm_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_actioncomm_fk_actioncomm` FOREIGN KEY (`fk_actioncomm`) REFERENCES `llx_actioncomm` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_categorie_actioncomm`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_categorie_actioncomm` WRITE;
/*!40000 ALTER TABLE `llx_categorie_actioncomm` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_categorie_actioncomm` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_categorie_contact`
--

DROP TABLE IF EXISTS `llx_categorie_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_categorie_contact` (
  `fk_categorie` int(11) NOT NULL,
  `fk_socpeople` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_socpeople`),
  KEY `idx_categorie_contact_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_contact_fk_socpeople` (`fk_socpeople`),
  CONSTRAINT `fk_categorie_contact_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_contact_fk_socpeople` FOREIGN KEY (`fk_socpeople`) REFERENCES `llx_socpeople` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_categorie_contact`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_categorie_contact` WRITE;
/*!40000 ALTER TABLE `llx_categorie_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_categorie_contact` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_categorie_fichinter`
--

DROP TABLE IF EXISTS `llx_categorie_fichinter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_categorie_fichinter` (
  `fk_categorie` int(11) NOT NULL,
  `fk_fichinter` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_fichinter`),
  KEY `idx_categorie_fichinter_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_fichinter_fk_fichinter` (`fk_fichinter`),
  CONSTRAINT `fk_categorie_fichinter_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_fichinter_fk_fichinter` FOREIGN KEY (`fk_fichinter`) REFERENCES `llx_fichinter` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_categorie_fichinter`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_categorie_fichinter` WRITE;
/*!40000 ALTER TABLE `llx_categorie_fichinter` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_categorie_fichinter` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_categorie_fournisseur`
--

DROP TABLE IF EXISTS `llx_categorie_fournisseur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_categorie_fournisseur` (
  `fk_categorie` int(11) NOT NULL,
  `fk_soc` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_soc`),
  KEY `idx_categorie_fournisseur_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_fournisseur_fk_societe` (`fk_soc`),
  CONSTRAINT `fk_categorie_fournisseur_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_fournisseur_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_categorie_fournisseur`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_categorie_fournisseur` WRITE;
/*!40000 ALTER TABLE `llx_categorie_fournisseur` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_categorie_fournisseur` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_categorie_invoice`
--

DROP TABLE IF EXISTS `llx_categorie_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_categorie_invoice` (
  `fk_categorie` int(11) NOT NULL,
  `fk_invoice` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_invoice`),
  KEY `idx_categorie_invoice_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_invoice_fk_invoice` (`fk_invoice`),
  CONSTRAINT `fk_categorie_invoice_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_invoice_fk_invoice_rowid` FOREIGN KEY (`fk_invoice`) REFERENCES `llx_facture` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_categorie_invoice`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_categorie_invoice` WRITE;
/*!40000 ALTER TABLE `llx_categorie_invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_categorie_invoice` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_categorie_knowledgemanagement`
--

DROP TABLE IF EXISTS `llx_categorie_knowledgemanagement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_categorie_knowledgemanagement` (
  `fk_categorie` int(11) NOT NULL,
  `fk_knowledgemanagement` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_knowledgemanagement`),
  KEY `idx_categorie_knowledgemanagement_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_knowledgemanagement_fk_knowledgemanagement` (`fk_knowledgemanagement`),
  CONSTRAINT `fk_categorie_knowledgemanagement_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_knowledgemanagement_knowledgemanagement_rowid` FOREIGN KEY (`fk_knowledgemanagement`) REFERENCES `llx_knowledgemanagement_knowledgerecord` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_categorie_knowledgemanagement`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_categorie_knowledgemanagement` WRITE;
/*!40000 ALTER TABLE `llx_categorie_knowledgemanagement` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_categorie_knowledgemanagement` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_categorie_lang`
--

DROP TABLE IF EXISTS `llx_categorie_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_categorie_lang` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_category` int(11) NOT NULL DEFAULT 0,
  `lang` varchar(5) NOT NULL DEFAULT '0',
  `label` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_category_lang` (`fk_category`,`lang`),
  CONSTRAINT `fk_category_lang_fk_category` FOREIGN KEY (`fk_category`) REFERENCES `llx_categorie` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_categorie_lang`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_categorie_lang` WRITE;
/*!40000 ALTER TABLE `llx_categorie_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_categorie_lang` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_categorie_lang_extrafields`
--

DROP TABLE IF EXISTS `llx_categorie_lang_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_categorie_lang_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_categorie_lang_fk_object` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_categorie_lang_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_categorie_lang_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_categorie_lang_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_categorie_lang_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_categorie_member`
--

DROP TABLE IF EXISTS `llx_categorie_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_categorie_member` (
  `fk_categorie` int(11) NOT NULL,
  `fk_member` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_member`),
  KEY `idx_categorie_member_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_member_fk_member` (`fk_member`),
  CONSTRAINT `fk_categorie_member_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_member_member_rowid` FOREIGN KEY (`fk_member`) REFERENCES `llx_adherent` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_categorie_member`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_categorie_member` WRITE;
/*!40000 ALTER TABLE `llx_categorie_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_categorie_member` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_categorie_mo`
--

DROP TABLE IF EXISTS `llx_categorie_mo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_categorie_mo` (
  `fk_categorie` int(11) NOT NULL,
  `fk_mo` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_mo`),
  KEY `idx_categorie_mo_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_mo_fk_mo` (`fk_mo`),
  CONSTRAINT `fk_categorie_mo_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_mo_fk_mo_rowid` FOREIGN KEY (`fk_mo`) REFERENCES `llx_mrp_mo` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_categorie_mo`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_categorie_mo` WRITE;
/*!40000 ALTER TABLE `llx_categorie_mo` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_categorie_mo` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_categorie_order`
--

DROP TABLE IF EXISTS `llx_categorie_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_categorie_order` (
  `fk_categorie` int(11) NOT NULL,
  `fk_order` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_order`),
  KEY `idx_categorie_order_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_order_fk_order` (`fk_order`),
  CONSTRAINT `fk_categorie_order_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_order_fk_order_rowid` FOREIGN KEY (`fk_order`) REFERENCES `llx_commande` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_categorie_order`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_categorie_order` WRITE;
/*!40000 ALTER TABLE `llx_categorie_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_categorie_order` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_categorie_product`
--

DROP TABLE IF EXISTS `llx_categorie_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_categorie_product` (
  `fk_categorie` int(11) NOT NULL,
  `fk_product` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_product`),
  KEY `idx_categorie_product_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_product_fk_product` (`fk_product`),
  CONSTRAINT `fk_categorie_product_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_product_product_rowid` FOREIGN KEY (`fk_product`) REFERENCES `llx_product` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_categorie_product`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_categorie_product` WRITE;
/*!40000 ALTER TABLE `llx_categorie_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_categorie_product` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_categorie_project`
--

DROP TABLE IF EXISTS `llx_categorie_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_categorie_project` (
  `fk_categorie` int(11) NOT NULL,
  `fk_project` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_project`),
  KEY `idx_categorie_project_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_project_fk_project` (`fk_project`),
  CONSTRAINT `fk_categorie_project_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_project_fk_project_rowid` FOREIGN KEY (`fk_project`) REFERENCES `llx_projet` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_categorie_project`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_categorie_project` WRITE;
/*!40000 ALTER TABLE `llx_categorie_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_categorie_project` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_categorie_project_task`
--

DROP TABLE IF EXISTS `llx_categorie_project_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_categorie_project_task` (
  `fk_categorie` int(11) NOT NULL,
  `fk_project_task` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_project_task`),
  KEY `idx_categorie_project_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_project_fk_task` (`fk_project_task`),
  CONSTRAINT `fk_categorie_project_task_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_project_task_rowid` FOREIGN KEY (`fk_project_task`) REFERENCES `llx_projet_task` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_categorie_project_task`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_categorie_project_task` WRITE;
/*!40000 ALTER TABLE `llx_categorie_project_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_categorie_project_task` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_categorie_propal`
--

DROP TABLE IF EXISTS `llx_categorie_propal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_categorie_propal` (
  `fk_categorie` int(11) NOT NULL,
  `fk_propal` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_propal`),
  KEY `idx_categorie_propal_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_propal_fk_propal` (`fk_propal`),
  CONSTRAINT `fk_categorie_propal_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_propal_fk_propal_rowid` FOREIGN KEY (`fk_propal`) REFERENCES `llx_propal` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_categorie_propal`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_categorie_propal` WRITE;
/*!40000 ALTER TABLE `llx_categorie_propal` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_categorie_propal` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_categorie_societe`
--

DROP TABLE IF EXISTS `llx_categorie_societe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_categorie_societe` (
  `fk_categorie` int(11) NOT NULL,
  `fk_soc` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_soc`),
  KEY `idx_categorie_societe_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_societe_fk_societe` (`fk_soc`),
  CONSTRAINT `fk_categorie_societe_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_societe_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_categorie_societe`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_categorie_societe` WRITE;
/*!40000 ALTER TABLE `llx_categorie_societe` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_categorie_societe` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_categorie_supplier_invoice`
--

DROP TABLE IF EXISTS `llx_categorie_supplier_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_categorie_supplier_invoice` (
  `fk_categorie` int(11) NOT NULL,
  `fk_supplier_invoice` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_supplier_invoice`),
  KEY `idx_categorie_supplier_invoice_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_supplier_invoice_fk_supplier_invoice` (`fk_supplier_invoice`),
  CONSTRAINT `fk_categorie_supplier_invoice_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_supplier_invoice_fk_supplier_invoice_rowid` FOREIGN KEY (`fk_supplier_invoice`) REFERENCES `llx_facture_fourn` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_categorie_supplier_invoice`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_categorie_supplier_invoice` WRITE;
/*!40000 ALTER TABLE `llx_categorie_supplier_invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_categorie_supplier_invoice` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_categorie_supplier_order`
--

DROP TABLE IF EXISTS `llx_categorie_supplier_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_categorie_supplier_order` (
  `fk_categorie` int(11) NOT NULL,
  `fk_supplier_order` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_supplier_order`),
  KEY `idx_categorie_supplier_order_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_supplier_order_fk_supplier_order` (`fk_supplier_order`),
  CONSTRAINT `fk_categorie_supplier_order_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_supplier_order_fk_supplier_order_rowid` FOREIGN KEY (`fk_supplier_order`) REFERENCES `llx_commande_fournisseur` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_categorie_supplier_order`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_categorie_supplier_order` WRITE;
/*!40000 ALTER TABLE `llx_categorie_supplier_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_categorie_supplier_order` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_categorie_supplier_proposal`
--

DROP TABLE IF EXISTS `llx_categorie_supplier_proposal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_categorie_supplier_proposal` (
  `fk_categorie` int(11) NOT NULL,
  `fk_supplier_proposal` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_supplier_proposal`),
  KEY `idx_categorie_supplier_proposal_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_supplier_proposal_fk_supplier_proposal` (`fk_supplier_proposal`),
  CONSTRAINT `fk_categorie_supplier_proposal_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_supplier_proposal_fk_supplier_proposal_rowid` FOREIGN KEY (`fk_supplier_proposal`) REFERENCES `llx_supplier_proposal` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_categorie_supplier_proposal`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_categorie_supplier_proposal` WRITE;
/*!40000 ALTER TABLE `llx_categorie_supplier_proposal` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_categorie_supplier_proposal` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_categorie_ticket`
--

DROP TABLE IF EXISTS `llx_categorie_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_categorie_ticket` (
  `fk_categorie` int(11) NOT NULL,
  `fk_ticket` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_ticket`),
  KEY `idx_categorie_ticket_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_ticket_fk_ticket` (`fk_ticket`),
  CONSTRAINT `fk_categorie_ticket_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_ticket_ticket_rowid` FOREIGN KEY (`fk_ticket`) REFERENCES `llx_ticket` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_categorie_ticket`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_categorie_ticket` WRITE;
/*!40000 ALTER TABLE `llx_categorie_ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_categorie_ticket` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_categorie_user`
--

DROP TABLE IF EXISTS `llx_categorie_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_categorie_user` (
  `fk_categorie` int(11) NOT NULL,
  `fk_user` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_user`),
  KEY `idx_categorie_user_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_user_fk_user` (`fk_user`),
  CONSTRAINT `fk_categorie_user_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_user_fk_user` FOREIGN KEY (`fk_user`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_categorie_user`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_categorie_user` WRITE;
/*!40000 ALTER TABLE `llx_categorie_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_categorie_user` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_categorie_warehouse`
--

DROP TABLE IF EXISTS `llx_categorie_warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_categorie_warehouse` (
  `fk_categorie` int(11) NOT NULL,
  `fk_warehouse` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_warehouse`),
  KEY `idx_categorie_warehouse_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_warehouse_fk_warehouse` (`fk_warehouse`),
  CONSTRAINT `fk_categorie_warehouse_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_warehouse_fk_warehouse_rowid` FOREIGN KEY (`fk_warehouse`) REFERENCES `llx_entrepot` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_categorie_warehouse`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_categorie_warehouse` WRITE;
/*!40000 ALTER TABLE `llx_categorie_warehouse` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_categorie_warehouse` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_categorie_website_page`
--

DROP TABLE IF EXISTS `llx_categorie_website_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_categorie_website_page` (
  `fk_categorie` int(11) NOT NULL,
  `fk_website_page` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_website_page`),
  KEY `idx_categorie_website_page_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_website_page_fk_website_page` (`fk_website_page`),
  CONSTRAINT `fk_categorie_websitepage_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_websitepage_website_page_rowid` FOREIGN KEY (`fk_website_page`) REFERENCES `llx_website_page` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_categorie_website_page`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_categorie_website_page` WRITE;
/*!40000 ALTER TABLE `llx_categorie_website_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_categorie_website_page` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_categories_extrafields`
--

DROP TABLE IF EXISTS `llx_categories_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_categories_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_categories_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_categories_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_categories_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_categories_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_categories_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_category_bankline`
--

DROP TABLE IF EXISTS `llx_category_bankline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_category_bankline` (
  `lineid` int(11) NOT NULL,
  `fk_categ` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  UNIQUE KEY `uk_category_bankline_lineid` (`lineid`,`fk_categ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_category_bankline`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_category_bankline` WRITE;
/*!40000 ALTER TABLE `llx_category_bankline` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_category_bankline` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_chargesociales`
--

DROP TABLE IF EXISTS `llx_chargesociales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_chargesociales` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(16) DEFAULT NULL,
  `date_ech` datetime NOT NULL,
  `libelle` varchar(80) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date_creation` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_type` int(11) NOT NULL,
  `fk_account` int(11) DEFAULT NULL,
  `fk_mode_reglement` int(11) DEFAULT NULL,
  `amount` double(24,8) NOT NULL DEFAULT 0.00000000,
  `paye` smallint(6) NOT NULL DEFAULT 0,
  `periode` date DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_chargesociales_fk_type` (`fk_type`),
  KEY `idx_chargesociales_fk_account` (`fk_account`),
  KEY `idx_chargesociales_fk_mode_reglement` (`fk_mode_reglement`),
  KEY `idx_chargesociales_fk_user_author` (`fk_user_author`),
  KEY `idx_chargesociales_fk_user_modif` (`fk_user_modif`),
  KEY `idx_chargesociales_fk_user_valid` (`fk_user_valid`),
  KEY `idx_chargesociales_fk_projet` (`fk_projet`),
  KEY `idx_chargesociales_fk_user` (`fk_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_chargesociales`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_chargesociales` WRITE;
/*!40000 ALTER TABLE `llx_chargesociales` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_chargesociales` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_commande`
--

DROP TABLE IF EXISTS `llx_commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_commande` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref_ext` varchar(255) DEFAULT NULL,
  `ref_client` varchar(255) DEFAULT NULL,
  `fk_soc` int(11) NOT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date_creation` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `date_cloture` datetime DEFAULT NULL,
  `date_commande` date DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_user_cloture` int(11) DEFAULT NULL,
  `source` smallint(6) DEFAULT NULL,
  `fk_statut` smallint(6) DEFAULT 0,
  `amount_ht` double(24,8) DEFAULT 0.00000000,
  `remise_percent` double DEFAULT 0,
  `remise_absolue` double DEFAULT 0,
  `remise` double DEFAULT 0,
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `localtax1` double(24,8) DEFAULT 0.00000000,
  `localtax2` double(24,8) DEFAULT 0.00000000,
  `revenuestamp` double(24,8) DEFAULT 0.00000000,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `signed_status` smallint(6) DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `module_source` varchar(32) DEFAULT NULL,
  `pos_source` varchar(32) DEFAULT NULL,
  `facture` tinyint(4) DEFAULT 0,
  `fk_account` int(11) DEFAULT NULL,
  `fk_currency` varchar(3) DEFAULT NULL,
  `fk_cond_reglement` int(11) DEFAULT NULL,
  `deposit_percent` varchar(63) DEFAULT NULL,
  `fk_mode_reglement` int(11) DEFAULT NULL,
  `date_livraison` datetime DEFAULT NULL,
  `fk_shipping_method` int(11) DEFAULT NULL,
  `fk_warehouse` int(11) DEFAULT NULL,
  `fk_availability` int(11) DEFAULT NULL,
  `fk_input_reason` int(11) DEFAULT NULL,
  `fk_delivery_address` int(11) DEFAULT NULL,
  `fk_incoterms` int(11) DEFAULT NULL,
  `location_incoterms` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000,
  `ip` varchar(250) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_commande_ref` (`ref`,`entity`),
  KEY `idx_commande_fk_soc` (`fk_soc`),
  KEY `idx_commande_fk_user_author` (`fk_user_author`),
  KEY `idx_commande_fk_user_valid` (`fk_user_valid`),
  KEY `idx_commande_fk_user_cloture` (`fk_user_cloture`),
  KEY `idx_commande_fk_projet` (`fk_projet`),
  KEY `idx_commande_fk_account` (`fk_account`),
  KEY `idx_commande_fk_currency` (`fk_currency`),
  CONSTRAINT `fk_commande_fk_projet` FOREIGN KEY (`fk_projet`) REFERENCES `llx_projet` (`rowid`),
  CONSTRAINT `fk_commande_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `fk_commande_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llx_user` (`rowid`),
  CONSTRAINT `fk_commande_fk_user_cloture` FOREIGN KEY (`fk_user_cloture`) REFERENCES `llx_user` (`rowid`),
  CONSTRAINT `fk_commande_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_commande`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_commande` WRITE;
/*!40000 ALTER TABLE `llx_commande` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_commande` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_commande_extrafields`
--

DROP TABLE IF EXISTS `llx_commande_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_commande_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_commande_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_commande_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_commande_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_commande_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_commande_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_commande_fournisseur`
--

DROP TABLE IF EXISTS `llx_commande_fournisseur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_commande_fournisseur` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(180) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref_ext` varchar(255) DEFAULT NULL,
  `ref_supplier` varchar(255) DEFAULT NULL,
  `fk_soc` int(11) NOT NULL,
  `fk_projet` int(11) DEFAULT 0,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date_creation` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `date_approve` datetime DEFAULT NULL,
  `date_approve2` datetime DEFAULT NULL,
  `date_commande` date DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_user_approve` int(11) DEFAULT NULL,
  `fk_user_approve2` int(11) DEFAULT NULL,
  `source` smallint(6) NOT NULL,
  `fk_statut` smallint(6) DEFAULT 0,
  `billed` smallint(6) DEFAULT 0,
  `amount_ht` double(24,8) DEFAULT 0.00000000,
  `remise_percent` double DEFAULT 0,
  `remise` double DEFAULT 0,
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `localtax1` double(24,8) DEFAULT 0.00000000,
  `localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `date_livraison` datetime DEFAULT NULL,
  `date_reception` datetime DEFAULT NULL,
  `fk_account` int(11) DEFAULT NULL,
  `fk_cond_reglement` int(11) DEFAULT NULL,
  `deposit_percent` varchar(63) DEFAULT NULL,
  `fk_mode_reglement` int(11) DEFAULT NULL,
  `fk_input_method` int(11) DEFAULT 0,
  `fk_incoterms` int(11) DEFAULT NULL,
  `location_incoterms` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_commande_fournisseur_ref` (`ref`,`entity`),
  KEY `idx_commande_fournisseur_fk_soc` (`fk_soc`),
  KEY `billed` (`billed`),
  CONSTRAINT `fk_commande_fournisseur_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_commande_fournisseur`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_commande_fournisseur` WRITE;
/*!40000 ALTER TABLE `llx_commande_fournisseur` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_commande_fournisseur` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_commande_fournisseur_extrafields`
--

DROP TABLE IF EXISTS `llx_commande_fournisseur_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_commande_fournisseur_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_commande_fournisseur_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_commande_fournisseur_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_commande_fournisseur_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_commande_fournisseur_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_commande_fournisseur_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_commande_fournisseur_log`
--

DROP TABLE IF EXISTS `llx_commande_fournisseur_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_commande_fournisseur_log` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datelog` datetime NOT NULL,
  `fk_commande` int(11) NOT NULL,
  `fk_statut` smallint(6) NOT NULL,
  `fk_user` int(11) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_commande_fournisseur_log`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_commande_fournisseur_log` WRITE;
/*!40000 ALTER TABLE `llx_commande_fournisseur_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_commande_fournisseur_log` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_commande_fournisseurdet`
--

DROP TABLE IF EXISTS `llx_commande_fournisseurdet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_commande_fournisseurdet` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_commande` int(11) NOT NULL,
  `fk_parent_line` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `ref` varchar(128) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `vat_src_code` varchar(10) DEFAULT '',
  `tva_tx` double(7,4) DEFAULT 0.0000,
  `localtax1_tx` double(7,4) DEFAULT 0.0000,
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(7,4) DEFAULT 0.0000,
  `localtax2_type` varchar(10) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT 0,
  `remise` double DEFAULT 0,
  `subprice` double(24,8) DEFAULT 0.00000000,
  `subprice_ttc` double(24,8) DEFAULT 0.00000000,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `total_localtax1` double(24,8) DEFAULT 0.00000000,
  `total_localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `product_type` int(11) DEFAULT 0,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `info_bits` int(11) DEFAULT 0,
  `special_code` int(11) DEFAULT 0,
  `rang` int(11) DEFAULT 0,
  `import_key` varchar(14) DEFAULT NULL,
  `fk_unit` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT 0.00000000,
  `multicurrency_subprice_ttc` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `fk_commande_fournisseurdet_fk_unit` (`fk_unit`),
  KEY `idx_commande_fournisseurdet_fk_commande` (`fk_commande`),
  KEY `idx_commande_fournisseurdet_fk_product` (`fk_product`),
  CONSTRAINT `fk_commande_fournisseurdet_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `llx_c_units` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_commande_fournisseurdet`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_commande_fournisseurdet` WRITE;
/*!40000 ALTER TABLE `llx_commande_fournisseurdet` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_commande_fournisseurdet` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_commande_fournisseurdet_extrafields`
--

DROP TABLE IF EXISTS `llx_commande_fournisseurdet_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_commande_fournisseurdet_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_commande_fournisseurdet_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_commande_fournisseurdet_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_commande_fournisseurdet_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_commande_fournisseurdet_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_commande_fournisseurdet_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_commandedet`
--

DROP TABLE IF EXISTS `llx_commandedet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_commandedet` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_commande` int(11) NOT NULL,
  `fk_parent_line` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `vat_src_code` varchar(10) DEFAULT '',
  `tva_tx` double(7,4) DEFAULT NULL,
  `localtax1_tx` double(7,4) DEFAULT 0.0000,
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(7,4) DEFAULT 0.0000,
  `localtax2_type` varchar(10) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT 0,
  `remise` double DEFAULT 0,
  `fk_remise_except` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `subprice` double(24,8) DEFAULT 0.00000000,
  `subprice_ttc` double(24,8) DEFAULT 0.00000000,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `total_localtax1` double(24,8) DEFAULT 0.00000000,
  `total_localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `product_type` int(11) DEFAULT 0,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `info_bits` int(11) DEFAULT 0,
  `buy_price_ht` double(24,8) DEFAULT 0.00000000,
  `fk_product_fournisseur_price` int(11) DEFAULT NULL,
  `special_code` int(11) DEFAULT 0,
  `rang` int(11) DEFAULT 0,
  `fk_unit` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `fk_commandefourndet` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT 0.00000000,
  `multicurrency_subprice_ttc` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_commandedet_fk_commande` (`fk_commande`),
  KEY `idx_commandedet_fk_product` (`fk_product`),
  KEY `fk_commandedet_fk_unit` (`fk_unit`),
  KEY `fk_commandedet_fk_commandefourndet` (`fk_commandefourndet`),
  CONSTRAINT `fk_commandedet_fk_commande` FOREIGN KEY (`fk_commande`) REFERENCES `llx_commande` (`rowid`),
  CONSTRAINT `fk_commandedet_fk_commandefourndet` FOREIGN KEY (`fk_commandefourndet`) REFERENCES `llx_commande_fournisseurdet` (`rowid`),
  CONSTRAINT `fk_commandedet_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `llx_c_units` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_commandedet`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_commandedet` WRITE;
/*!40000 ALTER TABLE `llx_commandedet` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_commandedet` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_commandedet_extrafields`
--

DROP TABLE IF EXISTS `llx_commandedet_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_commandedet_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_commandedet_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_commandedet_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_commandedet_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_commandedet_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_commandedet_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_comment`
--

DROP TABLE IF EXISTS `llx_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_comment` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `description` text NOT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_element` int(11) DEFAULT NULL,
  `element_type` varchar(50) DEFAULT NULL,
  `entity` int(11) DEFAULT 1,
  `import_key` varchar(125) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_comment`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_comment` WRITE;
/*!40000 ALTER TABLE `llx_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_comment` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_const`
--

DROP TABLE IF EXISTS `llx_const`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_const` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(180) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `value` text NOT NULL,
  `type` varchar(64) DEFAULT 'string',
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `note` text DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_const` (`name`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_const`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_const` WRITE;
/*!40000 ALTER TABLE `llx_const` DISABLE KEYS */;
INSERT INTO `llx_const` VALUES
(2,'MAIN_FEATURES_LEVEL',1,'0','chaine',1,'Level of features to show: -1=stable+deprecated, 0=stable only (default), 1=stable+experimental, 2=stable+experimental+development','2026-09-23 07:34:04'),
(3,'SYSLOG_HANDLERS',0,'[\"mod_syslog_file\"]','chaine',0,'Which logger to use','2026-09-23 07:34:04'),
(4,'SYSLOG_FILE',0,'DOL_DATA_ROOT/dolibarr.log','chaine',0,'Directory where to write log file','2026-09-23 07:34:04'),
(5,'SYSLOG_LEVEL',0,'7','chaine',0,'Level of debug info to show','2026-09-23 07:34:04'),
(6,'MAILING_LIMIT_SENDBYWEB',0,'25','chaine',0,'Number of targets to defined packet size when sending mass email','2026-09-23 07:34:04'),
(7,'MAIN_UPLOAD_DOC',1,'2048','chaine',0,'Max size for file upload (0 means no upload allowed)','2026-09-23 07:34:04'),
(8,'MAIN_ENABLE_OVERWRITE_TRANSLATION',1,'1','chaine',0,'Enable translation overwrite','2026-09-23 07:34:04'),
(9,'MAIN_ENABLE_DEFAULT_VALUES',1,'1','chaine',0,'Enable default value overwrite','2026-09-23 07:34:04'),
(11,'MAIN_MAIL_SMTP_SERVER',1,'','chaine',0,'Host or ip address for SMTP server','2026-09-23 07:34:04'),
(12,'MAIN_MAIL_SMTP_PORT',1,'','chaine',0,'Port for SMTP server','2026-09-23 07:34:04'),
(13,'MAIN_MAIL_EMAIL_FROM',1,'robot@domain.com','chaine',0,'email emitter for Dolibarr automatic emails','2026-09-23 07:34:04'),
(14,'MAIN_SIZE_SHORTLIST_LIMIT',1,'3','chaine',0,'Maximum length of short lists','2026-09-23 07:34:04'),
(15,'MAIN_MENU_STANDARD',1,'eldy_menu.php','chaine',0,'Menu manager for internal users','2026-09-23 07:34:04'),
(16,'MAIN_MENUFRONT_STANDARD',1,'eldy_menu.php','chaine',0,'Menu manager for external users','2026-09-23 07:34:04'),
(17,'MAIN_MENU_SMARTPHONE',1,'eldy_menu.php','chaine',0,'Menu manager for internal users using smartphones','2026-09-23 07:34:04'),
(18,'MAIN_MENUFRONT_SMARTPHONE',1,'eldy_menu.php','chaine',0,'Menu manager for external users using smartphones','2026-09-23 07:34:04'),
(19,'THEME_ELDY_USEBORDERONTABLE',1,'1','chaine',0,'Enable the border in theme','2026-09-23 07:34:04'),
(20,'MAIN_DELAY_ACTIONS_TODO',1,'7','chaine',0,'TolÃ©rance de retard avant alerte (en jours) sur actions planifiÃ©es non rÃ©alisÃ©es','2026-09-23 07:34:04'),
(21,'MAIN_DELAY_ORDERS_TO_PROCESS',1,'2','chaine',0,'TolÃ©rance de retard avant alerte (en jours) sur commandes clients non traitÃ©es','2026-09-23 07:34:04'),
(22,'MAIN_DELAY_SUPPLIER_ORDERS_TO_PROCESS',1,'7','chaine',0,'TolÃ©rance de retard avant alerte (en jours) sur commandes fournisseurs non traitÃ©es','2026-09-23 07:34:04'),
(23,'MAIN_DELAY_PROPALS_TO_CLOSE',1,'31','chaine',0,'TolÃ©rance de retard avant alerte (en jours) sur propales Ã  cloturer','2026-09-23 07:34:04'),
(24,'MAIN_DELAY_PROPALS_TO_BILL',1,'7','chaine',0,'TolÃ©rance de retard avant alerte (en jours) sur propales non facturÃ©es','2026-09-23 07:34:04'),
(25,'MAIN_DELAY_CUSTOMER_BILLS_UNPAYED',1,'31','chaine',0,'TolÃ©rance de retard avant alerte (en jours) sur factures client impayÃ©es','2026-09-23 07:34:04'),
(26,'MAIN_DELAY_SUPPLIER_BILLS_TO_PAY',1,'2','chaine',0,'TolÃ©rance de retard avant alerte (en jours) sur factures fournisseur impayÃ©es','2026-09-23 07:34:04'),
(27,'MAIN_DELAY_NOT_ACTIVATED_SERVICES',1,'0','chaine',0,'TolÃ©rance de retard avant alerte (en jours) sur services Ã  activer','2026-09-23 07:34:04'),
(28,'MAIN_DELAY_RUNNING_SERVICES',1,'0','chaine',0,'TolÃ©rance de retard avant alerte (en jours) sur services expirÃ©s','2026-09-23 07:34:04'),
(29,'MAIN_DELAY_MEMBERS',1,'31','chaine',0,'TolÃ©rance de retard avant alerte (en jours) sur cotisations adhÃ©rent en retard','2026-09-23 07:34:04'),
(30,'MAIN_DELAY_TRANSACTIONS_TO_CONCILIATE',1,'62','chaine',0,'TolÃ©rance de retard avant alerte (en jours) sur rapprochements bancaires Ã  faire','2026-09-23 07:34:04'),
(31,'MAIN_DELAY_EXPENSEREPORTS_TO_PAY',1,'31','chaine',0,'TolÃ©rance de retard avant alerte (en jours) sur les notes de frais impayÃ©es','2026-09-23 07:34:04'),
(32,'MAILING_EMAIL_FROM',1,'no-reply@mydomain.tld','chaine',0,'EMail emmetteur pour les envois d emailings','2026-09-23 07:34:04'),
(33,'PRODUCT_ADDON_PDF_ODT_PATH',1,'DOL_DATA_ROOT/doctemplates/products','chaine',0,NULL,'2026-09-23 07:34:04'),
(34,'CONTRACT_ADDON_PDF_ODT_PATH',1,'DOL_DATA_ROOT/doctemplates/contracts','chaine',0,NULL,'2026-09-23 07:34:04'),
(35,'USERGROUP_ADDON_PDF_ODT_PATH',1,'DOL_DATA_ROOT/doctemplates/usergroups','chaine',0,NULL,'2026-09-23 07:34:04'),
(36,'USER_ADDON_PDF_ODT_PATH',1,'DOL_DATA_ROOT/doctemplates/users','chaine',0,NULL,'2026-09-23 07:34:04'),
(37,'PRODUCT_PRICE_BASE_TYPE',1,'HT','string',0,NULL,'2026-09-23 07:34:04'),
(38,'ADHERENT_LOGIN_NOT_REQUIRED',1,'1','string',0,NULL,'2026-09-23 07:34:04'),
(39,'MAIN_VERSION_LAST_INSTALL',0,'24.0.0','chaine',0,'Dolibarr version when install','2026-09-23 07:34:05'),
(40,'MAIN_LANG_DEFAULT',1,'auto','chaine',0,'Default language','2026-09-23 07:34:05'),
(41,'SYSTEMTOOLS_MYSQLDUMP',0,'/usr/bin/mysqldump','chaine',0,'','2026-09-23 07:34:05'),
(42,'MAIN_MODULE_USER',0,'1','string',0,'{\"authorid\":0,\"ip\":\"\",\"lastactivationversion\":\"dolibarr\"}','2026-09-23 07:34:05'),
(43,'MAIN_PROFID1_IN_ADDRESS',1,'1','chaine',0,'','2026-09-23 07:39:21'),
(48,'MAIN_INFO_SOCIETE_COUNTRY',1,'1:FR:France','chaine',0,'','2026-09-23 07:45:57'),
(49,'MAIN_INFO_SOCIETE_NOM',1,'SAE52','chaine',0,'','2026-09-23 07:45:57'),
(50,'MAIN_INFO_SOCIETE_ADDRESS',1,'24 Cr Gambetta','chaine',0,'','2026-09-23 07:45:57'),
(51,'MAIN_INFO_SOCIETE_TOWN',1,'Elbeuf','chaine',0,'','2026-09-23 07:45:57'),
(52,'MAIN_INFO_SOCIETE_ZIP',1,'76500','chaine',0,'','2026-09-23 07:45:57'),
(53,'MAIN_MONNAIE',1,'EUR','chaine',0,'','2026-09-23 07:45:57'),
(54,'MAIN_INFO_SOCIETE_FORME_JURIDIQUE',1,'0','chaine',0,'','2026-09-23 07:45:57'),
(55,'SOCIETE_FISCAL_MONTH_START',1,'1','chaine',0,'','2026-09-23 07:45:57'),
(56,'FACTURE_TVAOPTION',1,'1','chaine',0,'','2026-09-23 07:45:57'),
(57,'MAIN_MODULE_SOCIETE',1,'1','string',0,'{\"authorid\":\"1\",\"ip\":\"172.18.0.1\",\"lastactivationversion\":\"dolibarr\"}','2026-09-23 07:46:42'),
(58,'SOCIETE_CODECLIENT_ADDON',1,'mod_codeclient_monkey','chaine',0,'Module to control third parties codes','2026-09-23 07:46:42'),
(59,'SOCIETE_CODECOMPTA_ADDON',1,'mod_codecompta_panicum','chaine',0,'Module to control third parties codes','2026-09-23 07:46:42'),
(60,'COMPANY_ADDON_PDF_ODT_PATH',1,'DOL_DATA_ROOT/doctemplates/thirdparties','chaine',0,NULL,'2026-09-23 07:46:42'),
(61,'SOCIETE_ADD_REF_IN_LIST',1,'0','yesno',0,'Display customer ref into select list','2026-09-23 07:46:42'),
(62,'MAIN_IHM_PARAMS_REV',1,'1','chaine',0,'','2026-09-23 07:46:42'),
(63,'MAIN_LAST_PING_KO_DATE',1,'20260924110959','chaine',0,'','2026-09-24 11:09:59');
/*!40000 ALTER TABLE `llx_const` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_contrat`
--

DROP TABLE IF EXISTS `llx_contrat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_contrat` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(255) DEFAULT NULL,
  `ref_customer` varchar(255) DEFAULT NULL,
  `ref_supplier` varchar(255) DEFAULT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `date_contrat` datetime DEFAULT NULL,
  `statut` smallint(6) DEFAULT 0,
  `fin_validite` datetime DEFAULT NULL,
  `date_cloture` datetime DEFAULT NULL,
  `fk_soc` int(11) NOT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `fk_commercial_signature` int(11) DEFAULT NULL,
  `fk_commercial_suivi` int(11) DEFAULT NULL,
  `fk_user_author` int(11) NOT NULL DEFAULT 0,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_cloture` int(11) DEFAULT NULL,
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `localtax1` double(24,8) DEFAULT 0.00000000,
  `localtax2` double(24,8) DEFAULT 0.00000000,
  `revenuestamp` double(24,8) DEFAULT 0.00000000,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `denormalized_lower_planned_end_date` datetime DEFAULT NULL,
  `signed_status` smallint(6) DEFAULT NULL,
  `online_sign_ip` varchar(48) DEFAULT NULL,
  `online_sign_name` varchar(64) DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_contrat_ref` (`ref`,`entity`),
  KEY `idx_contrat_fk_soc` (`fk_soc`),
  KEY `idx_contrat_fk_user_author` (`fk_user_author`),
  CONSTRAINT `fk_contrat_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `fk_contrat_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_contrat`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_contrat` WRITE;
/*!40000 ALTER TABLE `llx_contrat` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_contrat` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_contrat_extrafields`
--

DROP TABLE IF EXISTS `llx_contrat_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_contrat_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_contrat_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_contrat_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_contrat_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_contrat_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_contrat_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_contratdet`
--

DROP TABLE IF EXISTS `llx_contratdet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_contratdet` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_contrat` int(11) NOT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `statut` smallint(6) DEFAULT 0,
  `label` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `fk_remise_except` int(11) DEFAULT NULL,
  `date_commande` datetime DEFAULT NULL,
  `date_ouverture_prevue` datetime DEFAULT NULL,
  `date_ouverture` datetime DEFAULT NULL,
  `date_fin_validite` datetime DEFAULT NULL,
  `date_cloture` datetime DEFAULT NULL,
  `vat_src_code` varchar(10) DEFAULT '',
  `tva_tx` double(7,4) DEFAULT 0.0000,
  `localtax1_tx` double(7,4) DEFAULT 0.0000,
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(7,4) DEFAULT 0.0000,
  `localtax2_type` varchar(10) DEFAULT NULL,
  `qty` double NOT NULL,
  `remise_percent` double DEFAULT 0,
  `subprice` double(24,8) DEFAULT 0.00000000,
  `subprice_ttc` double(24,8) DEFAULT 0.00000000,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `total_localtax1` double(24,8) DEFAULT 0.00000000,
  `total_localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `product_type` int(11) DEFAULT 1,
  `info_bits` int(11) DEFAULT 0,
  `rang` int(11) DEFAULT 0,
  `buy_price_ht` double(24,8) DEFAULT NULL,
  `fk_product_fournisseur_price` int(11) DEFAULT NULL,
  `fk_user_author` int(11) NOT NULL DEFAULT 0,
  `fk_user_ouverture` int(11) DEFAULT NULL,
  `fk_user_cloture` int(11) DEFAULT NULL,
  `commentaire` text DEFAULT NULL,
  `fk_unit` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT 0.00000000,
  `multicurrency_subprice_ttc` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_contratdet_fk_contrat` (`fk_contrat`),
  KEY `idx_contratdet_fk_product` (`fk_product`),
  KEY `idx_contratdet_date_ouverture_prevue` (`date_ouverture_prevue`),
  KEY `idx_contratdet_date_ouverture` (`date_ouverture`),
  KEY `idx_contratdet_date_fin_validite` (`date_fin_validite`),
  KEY `idx_contratdet_statut` (`statut`),
  KEY `fk_contratdet_fk_unit` (`fk_unit`),
  CONSTRAINT `fk_contratdet_fk_contrat` FOREIGN KEY (`fk_contrat`) REFERENCES `llx_contrat` (`rowid`),
  CONSTRAINT `fk_contratdet_fk_product` FOREIGN KEY (`fk_product`) REFERENCES `llx_product` (`rowid`),
  CONSTRAINT `fk_contratdet_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `llx_c_units` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_contratdet`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_contratdet` WRITE;
/*!40000 ALTER TABLE `llx_contratdet` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_contratdet` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_contratdet_extrafields`
--

DROP TABLE IF EXISTS `llx_contratdet_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_contratdet_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_contratdet_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_contratdet_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_contratdet_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_contratdet_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_contratdet_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_cronjob`
--

DROP TABLE IF EXISTS `llx_cronjob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_cronjob` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `jobtype` varchar(10) NOT NULL,
  `label` varchar(255) NOT NULL,
  `command` varchar(255) DEFAULT NULL,
  `classesname` varchar(255) DEFAULT NULL,
  `objectname` varchar(255) DEFAULT NULL,
  `methodename` varchar(255) DEFAULT NULL,
  `params` text DEFAULT NULL,
  `md5params` varchar(32) DEFAULT NULL,
  `module_name` varchar(255) DEFAULT NULL,
  `priority` int(11) DEFAULT 0,
  `datelastrun` datetime DEFAULT NULL,
  `datenextrun` datetime DEFAULT NULL,
  `datestart` datetime DEFAULT NULL,
  `dateend` datetime DEFAULT NULL,
  `datelastresult` datetime DEFAULT NULL,
  `lastresult` text DEFAULT NULL,
  `lastoutput` text DEFAULT NULL,
  `unitfrequency` varchar(255) NOT NULL DEFAULT '3600',
  `frequency` int(11) NOT NULL DEFAULT 0,
  `maxrun` int(11) NOT NULL DEFAULT 0,
  `nbrun` int(11) DEFAULT NULL,
  `autodelete` int(11) DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `processing` int(11) NOT NULL DEFAULT 0,
  `pid` int(11) DEFAULT NULL,
  `test` varchar(255) DEFAULT '1',
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_mod` int(11) DEFAULT NULL,
  `fk_mailing` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `libname` varchar(255) DEFAULT NULL,
  `email_alert` varchar(128) DEFAULT NULL,
  `entity` int(11) DEFAULT 0,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_cronjob` (`label`,`entity`),
  KEY `idx_cronjob_status` (`status`),
  KEY `idx_cronjob_datelastrun` (`datelastrun`),
  KEY `idx_cronjob_datenextrun` (`datenextrun`),
  KEY `idx_cronjob_datestart` (`datestart`),
  KEY `idx_cronjob_dateend` (`dateend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_cronjob`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_cronjob` WRITE;
/*!40000 ALTER TABLE `llx_cronjob` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_cronjob` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_default_values`
--

DROP TABLE IF EXISTS `llx_default_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_default_values` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `type` varchar(10) DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `page` varchar(255) DEFAULT NULL,
  `param` varchar(255) DEFAULT NULL,
  `value` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_default_values` (`type`,`entity`,`user_id`,`page`,`param`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_default_values`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_default_values` WRITE;
/*!40000 ALTER TABLE `llx_default_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_default_values` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_delivery`
--

DROP TABLE IF EXISTS `llx_delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_delivery` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ref` varchar(30) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_soc` int(11) NOT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `ref_customer` varchar(255) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `date_delivery` datetime DEFAULT NULL,
  `fk_address` int(11) DEFAULT NULL,
  `fk_statut` smallint(6) DEFAULT 0,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `fk_incoterms` int(11) DEFAULT NULL,
  `location_incoterms` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_delivery_uk_ref` (`ref`,`entity`),
  KEY `idx_delivery_fk_soc` (`fk_soc`),
  KEY `idx_delivery_fk_user_author` (`fk_user_author`),
  KEY `idx_delivery_fk_user_valid` (`fk_user_valid`),
  CONSTRAINT `fk_delivery_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `fk_delivery_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llx_user` (`rowid`),
  CONSTRAINT `fk_delivery_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_delivery`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_delivery` WRITE;
/*!40000 ALTER TABLE `llx_delivery` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_delivery` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_delivery_extrafields`
--

DROP TABLE IF EXISTS `llx_delivery_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_delivery_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_delivery_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_delivery_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_delivery_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_delivery_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_delivery_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_deliverydet`
--

DROP TABLE IF EXISTS `llx_deliverydet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_deliverydet` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_delivery` int(11) DEFAULT NULL,
  `fk_origin_line` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `subprice` double(24,8) DEFAULT 0.00000000,
  `subprice_ttc` double(24,8) DEFAULT 0.00000000,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `rang` int(11) DEFAULT 0,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_deliverydet_fk_delivery` (`fk_delivery`),
  CONSTRAINT `fk_deliverydet_fk_delivery` FOREIGN KEY (`fk_delivery`) REFERENCES `llx_delivery` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_deliverydet`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_deliverydet` WRITE;
/*!40000 ALTER TABLE `llx_deliverydet` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_deliverydet` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_deliverydet_extrafields`
--

DROP TABLE IF EXISTS `llx_deliverydet_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_deliverydet_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_deliverydet_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_deliverydet_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_deliverydet_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_deliverydet_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_deliverydet_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_deplacement`
--

DROP TABLE IF EXISTS `llx_deplacement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_deplacement` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datec` datetime NOT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `dated` datetime DEFAULT NULL,
  `fk_user` int(11) NOT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `type` varchar(12) NOT NULL,
  `fk_statut` int(11) NOT NULL DEFAULT 1,
  `km` double DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT 0,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_deplacement`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_deplacement` WRITE;
/*!40000 ALTER TABLE `llx_deplacement` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_deplacement` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_document_model`
--

DROP TABLE IF EXISTS `llx_document_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_document_model` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `type` varchar(64) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `description` text DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_document_model` (`nom`,`type`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_document_model`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_document_model` WRITE;
/*!40000 ALTER TABLE `llx_document_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_document_model` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_don`
--

DROP TABLE IF EXISTS `llx_don`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_don` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_statut` smallint(6) NOT NULL DEFAULT 0,
  `datedon` datetime DEFAULT NULL,
  `amount` double(24,8) DEFAULT 0.00000000,
  `fk_payment` int(11) DEFAULT NULL,
  `paid` smallint(6) NOT NULL DEFAULT 0,
  `fk_soc` int(11) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `societe` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `zip` varchar(30) DEFAULT NULL,
  `town` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `fk_country` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(24) DEFAULT NULL,
  `phone_mobile` varchar(24) DEFAULT NULL,
  `public` smallint(6) NOT NULL DEFAULT 1,
  `fk_projet` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `fk_user_author` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `ip` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_don_uk_ref` (`ref`,`entity`),
  KEY `idx_don_fk_soc` (`fk_soc`),
  KEY `idx_don_fk_project` (`fk_projet`),
  KEY `idx_don_fk_user_author` (`fk_user_author`),
  KEY `idx_don_fk_user_valid` (`fk_user_valid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_don`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_don` WRITE;
/*!40000 ALTER TABLE `llx_don` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_don` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_don_extrafields`
--

DROP TABLE IF EXISTS `llx_don_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_don_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_don_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_don_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_don_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_don_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_don_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_ecm_directories`
--

DROP TABLE IF EXISTS `llx_ecm_directories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_ecm_directories` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(64) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_parent` int(11) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `cachenbofdoc` int(11) NOT NULL DEFAULT 0,
  `fullpath` varchar(750) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `date_c` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_c` int(11) DEFAULT NULL,
  `fk_user_m` int(11) DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `acl` text DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_ecm_directories` (`label`,`fk_parent`,`entity`),
  KEY `idx_ecm_directories_fk_user_c` (`fk_user_c`),
  KEY `idx_ecm_directories_fk_user_m` (`fk_user_m`),
  CONSTRAINT `fk_ecm_directories_fk_user_c` FOREIGN KEY (`fk_user_c`) REFERENCES `llx_user` (`rowid`),
  CONSTRAINT `fk_ecm_directories_fk_user_m` FOREIGN KEY (`fk_user_m`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_ecm_directories`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_ecm_directories` WRITE;
/*!40000 ALTER TABLE `llx_ecm_directories` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_ecm_directories` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_ecm_directories_extrafields`
--

DROP TABLE IF EXISTS `llx_ecm_directories_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_ecm_directories_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_ecm_directories_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_ecm_directories_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_ecm_directories_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_ecm_directories_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_ecm_directories_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_ecm_files`
--

DROP TABLE IF EXISTS `llx_ecm_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_ecm_files` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(128) DEFAULT NULL,
  `label` varchar(128) NOT NULL,
  `share` varchar(128) DEFAULT NULL,
  `share_pass` varchar(32) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `filepath` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `src_object_type` varchar(64) DEFAULT NULL,
  `src_object_id` int(11) DEFAULT NULL,
  `agenda_id` int(11) DEFAULT NULL,
  `fullpath_orig` varchar(750) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `keywords` varchar(750) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `cover` varchar(32) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `gen_or_uploaded` varchar(12) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `date_c` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_c` int(11) DEFAULT NULL,
  `fk_user_m` int(11) DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `acl` text DEFAULT NULL,
  `geolat` double(24,8) DEFAULT NULL,
  `geolong` double(24,8) DEFAULT NULL,
  `geopoint` point DEFAULT NULL,
  `georesultcode` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_ecm_files` (`filepath`,`filename`,`entity`),
  KEY `idx_ecm_files_label` (`label`),
  KEY `idx_ecm_files_src_object_type_id` (`src_object_type`,`src_object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_ecm_files`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_ecm_files` WRITE;
/*!40000 ALTER TABLE `llx_ecm_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_ecm_files` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_ecm_files_extrafields`
--

DROP TABLE IF EXISTS `llx_ecm_files_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_ecm_files_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_ecm_files_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_ecm_files_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_ecm_files_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_ecm_files_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_ecm_files_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_element_categorie`
--

DROP TABLE IF EXISTS `llx_element_categorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_element_categorie` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_categorie` int(11) NOT NULL,
  `fk_element` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_element_categorie_idx` (`fk_element`,`fk_categorie`),
  KEY `idx_element_categorie_fk_categorie` (`fk_categorie`),
  CONSTRAINT `fk_element_categorie_fk_categorie` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_element_categorie`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_element_categorie` WRITE;
/*!40000 ALTER TABLE `llx_element_categorie` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_element_categorie` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_element_contact`
--

DROP TABLE IF EXISTS `llx_element_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_element_contact` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `datecreate` datetime DEFAULT NULL,
  `statut` smallint(6) DEFAULT 5,
  `element_id` int(11) NOT NULL,
  `mandatory_signature` tinyint(4) DEFAULT NULL,
  `fk_c_type_contact` int(11) NOT NULL,
  `fk_socpeople` int(11) NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_element_contact_idx1` (`element_id`,`fk_c_type_contact`,`fk_socpeople`),
  KEY `fk_element_contact_fk_c_type_contact` (`fk_c_type_contact`),
  KEY `idx_element_contact_fk_socpeople` (`fk_socpeople`),
  CONSTRAINT `fk_element_contact_fk_c_type_contact` FOREIGN KEY (`fk_c_type_contact`) REFERENCES `llx_c_type_contact` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_element_contact`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_element_contact` WRITE;
/*!40000 ALTER TABLE `llx_element_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_element_contact` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_element_element`
--

DROP TABLE IF EXISTS `llx_element_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_element_element` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_source` int(11) NOT NULL,
  `sourcetype` varchar(64) NOT NULL,
  `fk_target` int(11) NOT NULL,
  `targettype` varchar(64) NOT NULL,
  `relationtype` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_element_element_idx1` (`fk_source`,`sourcetype`,`fk_target`,`targettype`),
  KEY `idx_element_element_fk_target` (`fk_target`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_element_element`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_element_element` WRITE;
/*!40000 ALTER TABLE `llx_element_element` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_element_element` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_element_resources`
--

DROP TABLE IF EXISTS `llx_element_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_element_resources` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `element_id` int(11) DEFAULT NULL,
  `element_type` varchar(64) DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `resource_type` varchar(64) DEFAULT NULL,
  `busy` int(11) DEFAULT NULL,
  `mandatory` int(11) DEFAULT NULL,
  `duree` double DEFAULT NULL,
  `fk_user_create` int(11) DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_element_resources_idx1` (`resource_id`,`resource_type`,`element_id`,`element_type`),
  KEY `idx_element_element_element_id` (`element_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_element_resources`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_element_resources` WRITE;
/*!40000 ALTER TABLE `llx_element_resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_element_resources` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_element_time`
--

DROP TABLE IF EXISTS `llx_element_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_element_time` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref_ext` varchar(32) DEFAULT NULL,
  `fk_element` int(11) NOT NULL,
  `elementtype` varchar(32) NOT NULL,
  `element_date` date DEFAULT NULL,
  `element_datehour` datetime DEFAULT NULL,
  `element_date_withhour` int(11) DEFAULT NULL,
  `element_duration` double DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `thm` double(24,8) DEFAULT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `invoice_line_id` int(11) DEFAULT NULL,
  `intervention_id` int(11) DEFAULT NULL,
  `intervention_line_id` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `note` text DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_element_time_task` (`fk_element`),
  KEY `idx_element_time_date` (`element_date`),
  KEY `idx_element_time_datehour` (`element_datehour`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_element_time`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_element_time` WRITE;
/*!40000 ALTER TABLE `llx_element_time` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_element_time` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_emailcollector_emailcollector`
--

DROP TABLE IF EXISTS `llx_emailcollector_emailcollector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_emailcollector_emailcollector` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref` varchar(128) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `port` varchar(10) DEFAULT '993',
  `hostcharset` varchar(16) DEFAULT 'UTF-8',
  `imap_encryption` varchar(16) DEFAULT 'ssl',
  `norsh` int(11) DEFAULT 0,
  `login` varchar(128) DEFAULT NULL,
  `acces_type` int(11) DEFAULT 0,
  `oauth_service` varchar(128) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `source_directory` varchar(255) NOT NULL DEFAULT 'Inbox',
  `target_directory` varchar(255) DEFAULT NULL,
  `maxemailpercollect` int(11) DEFAULT 100,
  `datelastresult` datetime DEFAULT NULL,
  `codelastresult` varchar(16) DEFAULT NULL,
  `lastresult` text DEFAULT NULL,
  `datelastok` datetime DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `import_key` varchar(14) DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_emailcollector_emailcollector_ref` (`ref`,`entity`),
  KEY `idx_emailcollector_entity` (`entity`),
  KEY `idx_emailcollector_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_emailcollector_emailcollector`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_emailcollector_emailcollector` WRITE;
/*!40000 ALTER TABLE `llx_emailcollector_emailcollector` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_emailcollector_emailcollector` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_emailcollector_emailcollectoraction`
--

DROP TABLE IF EXISTS `llx_emailcollector_emailcollectoraction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_emailcollector_emailcollectoraction` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_emailcollector` int(11) NOT NULL,
  `type` varchar(128) NOT NULL,
  `actionparam` text DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT 0,
  `import_key` varchar(14) DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_emailcollector_emailcollectoraction` (`fk_emailcollector`,`type`),
  KEY `idx_emailcollector_fk_emailcollector` (`fk_emailcollector`),
  CONSTRAINT `fk_emailcollectoraction_fk_emailcollector` FOREIGN KEY (`fk_emailcollector`) REFERENCES `llx_emailcollector_emailcollector` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_emailcollector_emailcollectoraction`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_emailcollector_emailcollectoraction` WRITE;
/*!40000 ALTER TABLE `llx_emailcollector_emailcollectoraction` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_emailcollector_emailcollectoraction` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_emailcollector_emailcollectorfilter`
--

DROP TABLE IF EXISTS `llx_emailcollector_emailcollectorfilter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_emailcollector_emailcollectorfilter` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_emailcollector` int(11) NOT NULL,
  `type` varchar(128) NOT NULL,
  `rulevalue` varchar(128) DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_emailcollector_emailcollectorfilter` (`fk_emailcollector`,`type`,`rulevalue`),
  KEY `idx_emailcollector_fk_emailcollector` (`fk_emailcollector`),
  CONSTRAINT `fk_emailcollectorfilter_fk_emailcollector` FOREIGN KEY (`fk_emailcollector`) REFERENCES `llx_emailcollector_emailcollector` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_emailcollector_emailcollectorfilter`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_emailcollector_emailcollectorfilter` WRITE;
/*!40000 ALTER TABLE `llx_emailcollector_emailcollectorfilter` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_emailcollector_emailcollectorfilter` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_entrepot`
--

DROP TABLE IF EXISTS `llx_entrepot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_entrepot` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(255) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_project` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `lieu` varchar(64) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `town` varchar(50) DEFAULT NULL,
  `fk_departement` int(11) DEFAULT NULL,
  `fk_pays` int(11) DEFAULT 0,
  `phone` varchar(30) DEFAULT NULL,
  `fax` varchar(30) DEFAULT NULL,
  `barcode` varchar(180) DEFAULT NULL,
  `fk_barcode_type` int(11) DEFAULT NULL,
  `warehouse_usage` int(11) DEFAULT 1,
  `statut` tinyint(4) DEFAULT 1,
  `fk_user_author` int(11) DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `fk_parent` int(11) DEFAULT 0,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_entrepot_label` (`ref`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_entrepot`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_entrepot` WRITE;
/*!40000 ALTER TABLE `llx_entrepot` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_entrepot` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_entrepot_extrafields`
--

DROP TABLE IF EXISTS `llx_entrepot_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_entrepot_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_entrepot_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_entrepot_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_entrepot_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_entrepot_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_entrepot_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_establishment`
--

DROP TABLE IF EXISTS `llx_establishment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_establishment` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref` varchar(30) DEFAULT NULL,
  `label` varchar(255) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zip` varchar(25) DEFAULT NULL,
  `town` varchar(50) DEFAULT NULL,
  `fk_state` int(11) DEFAULT 0,
  `fk_country` int(11) DEFAULT 0,
  `profid1` varchar(20) DEFAULT NULL,
  `profid2` varchar(20) DEFAULT NULL,
  `profid3` varchar(20) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `fk_user_author` int(11) NOT NULL,
  `fk_user_mod` int(11) DEFAULT NULL,
  `datec` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` tinyint(4) DEFAULT 1,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_establishment`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_establishment` WRITE;
/*!40000 ALTER TABLE `llx_establishment` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_establishment` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_eventorganization_conferenceorboothattendee`
--

DROP TABLE IF EXISTS `llx_eventorganization_conferenceorboothattendee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_eventorganization_conferenceorboothattendee` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(128) NOT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_actioncomm` int(11) DEFAULT NULL,
  `fk_project` int(11) NOT NULL,
  `fk_invoice` int(11) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `email_company` varchar(128) DEFAULT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `date_subscription` datetime DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `ip` varchar(250) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `fk_replacement` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_eventorganization_confboothattendee` (`ref`),
  UNIQUE KEY `uk_eventorganization_conferenceorboothattendee` (`fk_project`,`email`,`fk_actioncomm`),
  UNIQUE KEY `uk_eventorganization_confboothattendee_replacement` (`fk_replacement`),
  KEY `idx_eventorganization_conferenceorboothattendee_rowid` (`rowid`),
  KEY `idx_eventorganization_conferenceorboothattendee_fk_soc` (`fk_soc`),
  KEY `idx_eventorganization_conferenceorboothattendee_fk_actioncomm` (`fk_actioncomm`),
  KEY `idx_eventorganization_conferenceorboothattendee_fk_project` (`fk_project`),
  KEY `idx_eventorganization_conferenceorboothattendee_email` (`email`),
  KEY `idx_eventorganization_conferenceorboothattendee_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_eventorganization_conferenceorboothattendee`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_eventorganization_conferenceorboothattendee` WRITE;
/*!40000 ALTER TABLE `llx_eventorganization_conferenceorboothattendee` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_eventorganization_conferenceorboothattendee` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_eventorganization_conferenceorboothattendee_extrafields`
--

DROP TABLE IF EXISTS `llx_eventorganization_conferenceorboothattendee_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_eventorganization_conferenceorboothattendee_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_conferenceorboothattendee_fk_object` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_eventorganization_conferenceorboothattendee_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_eventorganization_conferenceorboothattendee_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_eventorganization_conferenceorboothattendee_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_eventorganization_conferenceorboothattendee_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_events`
--

DROP TABLE IF EXISTS `llx_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_events` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `type` varchar(32) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `prefix_session` varchar(255) DEFAULT NULL,
  `dateevent` datetime DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `description` varchar(250) NOT NULL,
  `ip` varchar(250) NOT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `fk_object` int(11) DEFAULT NULL,
  `authentication_method` varchar(64) DEFAULT NULL,
  `fk_oauth_token` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_events_dateevent` (`dateevent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_events`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_events` WRITE;
/*!40000 ALTER TABLE `llx_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_events` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_expedition`
--

DROP TABLE IF EXISTS `llx_expedition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_expedition` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ref` varchar(30) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_soc` int(11) NOT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `ref_customer` varchar(255) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `date_delivery` datetime DEFAULT NULL,
  `date_expedition` datetime DEFAULT NULL,
  `fk_address` int(11) DEFAULT NULL,
  `fk_shipping_method` int(11) DEFAULT NULL,
  `tracking_number` varchar(50) DEFAULT NULL,
  `fk_statut` smallint(6) DEFAULT 0,
  `billed` smallint(6) DEFAULT 0,
  `height` float DEFAULT NULL,
  `width` float DEFAULT NULL,
  `size_units` int(11) DEFAULT NULL,
  `size` float DEFAULT NULL,
  `weight_units` int(11) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `signed_status` smallint(6) DEFAULT NULL,
  `online_sign_ip` varchar(48) DEFAULT NULL,
  `online_sign_name` varchar(64) DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `fk_incoterms` int(11) DEFAULT NULL,
  `location_incoterms` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_expedition_uk_ref` (`ref`,`entity`),
  KEY `idx_expedition_fk_soc` (`fk_soc`),
  KEY `idx_expedition_fk_user_author` (`fk_user_author`),
  KEY `idx_expedition_fk_user_valid` (`fk_user_valid`),
  KEY `idx_expedition_fk_shipping_method` (`fk_shipping_method`),
  CONSTRAINT `fk_expedition_fk_shipping_method` FOREIGN KEY (`fk_shipping_method`) REFERENCES `llx_c_shipment_mode` (`rowid`),
  CONSTRAINT `fk_expedition_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `fk_expedition_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llx_user` (`rowid`),
  CONSTRAINT `fk_expedition_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_expedition`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_expedition` WRITE;
/*!40000 ALTER TABLE `llx_expedition` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_expedition` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_expedition_extrafields`
--

DROP TABLE IF EXISTS `llx_expedition_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_expedition_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_expedition_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_expedition_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_expedition_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_expedition_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_expedition_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_expedition_package`
--

DROP TABLE IF EXISTS `llx_expedition_package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_expedition_package` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_expedition` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `value` double(24,8) DEFAULT 0.00000000,
  `fk_package_type` int(11) DEFAULT NULL,
  `height` float DEFAULT NULL,
  `width` float DEFAULT NULL,
  `size` float DEFAULT NULL,
  `size_units` int(11) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `weight_units` int(11) DEFAULT NULL,
  `dangerous_goods` varchar(20) DEFAULT '0',
  `tail_lift` smallint(6) DEFAULT 0,
  `rang` int(11) DEFAULT 0,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_expedition_package`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_expedition_package` WRITE;
/*!40000 ALTER TABLE `llx_expedition_package` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_expedition_package` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_expeditiondet`
--

DROP TABLE IF EXISTS `llx_expeditiondet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_expeditiondet` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_expedition` int(11) NOT NULL,
  `fk_element` int(11) DEFAULT NULL,
  `fk_elementdet` int(11) DEFAULT NULL,
  `element_type` varchar(50) NOT NULL DEFAULT 'commande',
  `fk_product` int(11) DEFAULT NULL,
  `fk_parent` int(11) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `fk_unit` int(11) DEFAULT NULL,
  `fk_entrepot` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `rang` int(11) DEFAULT 0,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_expeditiondet_fk_expedition` (`fk_expedition`),
  KEY `idx_expeditiondet_fk_elementdet` (`fk_elementdet`),
  KEY `idx_expeditiondet_fk_product` (`fk_product`),
  KEY `idx_expeditiondet_fk_parent` (`fk_parent`),
  CONSTRAINT `fk_expeditiondet_fk_expedition` FOREIGN KEY (`fk_expedition`) REFERENCES `llx_expedition` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_expeditiondet`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_expeditiondet` WRITE;
/*!40000 ALTER TABLE `llx_expeditiondet` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_expeditiondet` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_expeditiondet_batch`
--

DROP TABLE IF EXISTS `llx_expeditiondet_batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_expeditiondet_batch` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_expeditiondet` int(11) NOT NULL,
  `eatby` date DEFAULT NULL,
  `sellby` date DEFAULT NULL,
  `batch` varchar(128) DEFAULT NULL,
  `qty` double NOT NULL DEFAULT 0,
  `fk_origin_stock` int(11) NOT NULL,
  `fk_warehouse` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_fk_expeditiondet` (`fk_expeditiondet`),
  CONSTRAINT `fk_expeditiondet_batch_fk_expeditiondet` FOREIGN KEY (`fk_expeditiondet`) REFERENCES `llx_expeditiondet` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_expeditiondet_batch`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_expeditiondet_batch` WRITE;
/*!40000 ALTER TABLE `llx_expeditiondet_batch` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_expeditiondet_batch` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_expeditiondet_extrafields`
--

DROP TABLE IF EXISTS `llx_expeditiondet_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_expeditiondet_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_expeditiondet_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_expeditiondet_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_expeditiondet_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_expeditiondet_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_expeditiondet_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_expensereport`
--

DROP TABLE IF EXISTS `llx_expensereport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_expensereport` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(50) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref_number_int` int(11) DEFAULT NULL,
  `ref_ext` int(11) DEFAULT NULL,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `localtax1` double(24,8) DEFAULT 0.00000000,
  `localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `date_create` datetime NOT NULL,
  `date_valid` datetime DEFAULT NULL,
  `date_approve` datetime DEFAULT NULL,
  `date_refuse` datetime DEFAULT NULL,
  `date_cancel` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_author` int(11) NOT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_user_validator` int(11) DEFAULT NULL,
  `fk_user_approve` int(11) DEFAULT NULL,
  `fk_user_refuse` int(11) DEFAULT NULL,
  `fk_user_cancel` int(11) DEFAULT NULL,
  `fk_statut` int(11) NOT NULL,
  `fk_c_paiement` int(11) DEFAULT NULL,
  `paid` smallint(6) NOT NULL DEFAULT 0,
  `note_public` text DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `detail_refuse` varchar(255) DEFAULT NULL,
  `detail_cancel` varchar(255) DEFAULT NULL,
  `integration_compta` int(11) DEFAULT NULL,
  `fk_bank_account` int(11) DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_expensereport_uk_ref` (`ref`,`entity`),
  KEY `idx_expensereport_date_debut` (`date_debut`),
  KEY `idx_expensereport_date_fin` (`date_fin`),
  KEY `idx_expensereport_fk_statut` (`fk_statut`),
  KEY `idx_expensereport_fk_user_author` (`fk_user_author`),
  KEY `idx_expensereport_fk_user_valid` (`fk_user_valid`),
  KEY `idx_expensereport_fk_user_approve` (`fk_user_approve`),
  KEY `idx_expensereport_fk_refuse` (`fk_user_refuse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_expensereport`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_expensereport` WRITE;
/*!40000 ALTER TABLE `llx_expensereport` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_expensereport` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_expensereport_det`
--

DROP TABLE IF EXISTS `llx_expensereport_det`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_expensereport_det` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_expensereport` int(11) NOT NULL,
  `docnumber` varchar(128) DEFAULT NULL,
  `fk_c_type_fees` int(11) NOT NULL,
  `fk_c_exp_tax_cat` int(11) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `comments` text NOT NULL,
  `product_type` int(11) DEFAULT -1,
  `qty` double NOT NULL,
  `subprice` double(24,8) NOT NULL DEFAULT 0.00000000,
  `subprice_ttc` double(24,8) DEFAULT 0.00000000,
  `value_unit` double(24,8) NOT NULL,
  `remise_percent` double DEFAULT NULL,
  `vat_src_code` varchar(10) DEFAULT '',
  `tva_tx` double(7,4) DEFAULT NULL,
  `localtax1_tx` double(7,4) DEFAULT 0.0000,
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(7,4) DEFAULT 0.0000,
  `localtax2_type` varchar(10) DEFAULT NULL,
  `total_ht` double(24,8) NOT NULL DEFAULT 0.00000000,
  `total_tva` double(24,8) NOT NULL DEFAULT 0.00000000,
  `total_localtax1` double(24,8) DEFAULT 0.00000000,
  `total_localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) NOT NULL DEFAULT 0.00000000,
  `date` date NOT NULL,
  `info_bits` int(11) DEFAULT 0,
  `special_code` int(11) DEFAULT 0,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT 0.00000000,
  `multicurrency_subprice_ttc` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000,
  `fk_facture` int(11) DEFAULT 0,
  `fk_ecm_files` int(11) DEFAULT NULL,
  `tcheck_file` int(11) DEFAULT NULL,
  `fk_code_ventilation` int(11) DEFAULT 0,
  `rang` int(11) DEFAULT 0,
  `import_key` varchar(14) DEFAULT NULL,
  `rule_warning_message` text DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_expensereport_det`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_expensereport_det` WRITE;
/*!40000 ALTER TABLE `llx_expensereport_det` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_expensereport_det` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_expensereport_det_extrafields`
--

DROP TABLE IF EXISTS `llx_expensereport_det_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_expensereport_det_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_expensereport_det_fk_object` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_expensereport_det_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_expensereport_det_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_expensereport_det_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_expensereport_det_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_expensereport_extrafields`
--

DROP TABLE IF EXISTS `llx_expensereport_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_expensereport_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_expensereport_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_expensereport_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_expensereport_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_expensereport_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_expensereport_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_expensereport_ik`
--

DROP TABLE IF EXISTS `llx_expensereport_ik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_expensereport_ik` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_c_exp_tax_cat` int(11) NOT NULL DEFAULT 0,
  `fk_range` int(11) NOT NULL DEFAULT 0,
  `coef` double NOT NULL DEFAULT 0,
  `ikoffset` double NOT NULL DEFAULT 0,
  `active` int(11) DEFAULT 1,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_expensereport_ik`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_expensereport_ik` WRITE;
/*!40000 ALTER TABLE `llx_expensereport_ik` DISABLE KEYS */;
INSERT INTO `llx_expensereport_ik` VALUES
(1,NULL,'2026-09-23 07:34:04',4,1,0.41,0,1),
(2,NULL,'2026-09-23 07:34:04',4,2,0.244,824,1),
(3,NULL,'2026-09-23 07:34:04',4,3,0.286,0,1),
(4,NULL,'2026-09-23 07:34:04',5,4,0.493,0,1),
(5,NULL,'2026-09-23 07:34:04',5,5,0.277,1082,1),
(6,NULL,'2026-09-23 07:34:04',5,6,0.332,0,1),
(7,NULL,'2026-09-23 07:34:04',6,7,0.543,0,1),
(8,NULL,'2026-09-23 07:34:04',6,8,0.305,1180,1),
(9,NULL,'2026-09-23 07:34:04',6,9,0.364,0,1),
(10,NULL,'2026-09-23 07:34:04',7,10,0.568,0,1),
(11,NULL,'2026-09-23 07:34:04',7,11,0.32,1244,1),
(12,NULL,'2026-09-23 07:34:04',7,12,0.382,0,1),
(13,NULL,'2026-09-23 07:34:04',8,13,0.595,0,1),
(14,NULL,'2026-09-23 07:34:04',8,14,0.337,1288,1),
(15,NULL,'2026-09-23 07:34:04',8,15,0.401,0,1);
/*!40000 ALTER TABLE `llx_expensereport_ik` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_expensereport_rules`
--

DROP TABLE IF EXISTS `llx_expensereport_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_expensereport_rules` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `dates` datetime NOT NULL,
  `datee` datetime NOT NULL,
  `amount` double(24,8) NOT NULL,
  `restrictive` tinyint(4) NOT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `fk_usergroup` int(11) DEFAULT NULL,
  `fk_c_type_fees` int(11) NOT NULL,
  `code_expense_rules_type` varchar(50) NOT NULL,
  `is_for_all` tinyint(4) DEFAULT 0,
  `entity` int(11) DEFAULT 1,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_expensereport_rules`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_expensereport_rules` WRITE;
/*!40000 ALTER TABLE `llx_expensereport_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_expensereport_rules` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_export_model`
--

DROP TABLE IF EXISTS `llx_export_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_export_model` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) DEFAULT 0,
  `fk_user` int(11) NOT NULL DEFAULT 0,
  `label` varchar(50) NOT NULL,
  `type` varchar(64) NOT NULL,
  `field` text NOT NULL,
  `filter` text DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_export_model` (`label`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_export_model`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_export_model` WRITE;
/*!40000 ALTER TABLE `llx_export_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_export_model` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_extrafields`
--

DROP TABLE IF EXISTS `llx_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `elementtype` varchar(64) NOT NULL DEFAULT 'member',
  `label` varchar(255) NOT NULL,
  `type` varchar(8) DEFAULT NULL,
  `size` varchar(8) DEFAULT NULL,
  `fieldcomputed` text DEFAULT NULL,
  `fielddefault` text DEFAULT NULL,
  `fieldunique` int(11) DEFAULT 0,
  `fieldrequired` int(11) DEFAULT 0,
  `perms` varchar(255) DEFAULT NULL,
  `enabled` varchar(255) DEFAULT NULL,
  `module` varchar(64) DEFAULT NULL,
  `pos` int(11) DEFAULT 0,
  `alwayseditable` int(11) DEFAULT 0,
  `emptyonclone` int(11) DEFAULT 0,
  `param` text DEFAULT NULL,
  `list` varchar(255) DEFAULT '1',
  `printable` int(11) DEFAULT 0,
  `showintooltip` int(11) DEFAULT 0,
  `totalizable` tinyint(1) DEFAULT 0,
  `langs` varchar(64) DEFAULT NULL,
  `help` text DEFAULT NULL,
  `aiprompt` text DEFAULT NULL,
  `css` varchar(128) DEFAULT NULL,
  `cssview` varchar(128) DEFAULT NULL,
  `csslist` varchar(128) DEFAULT NULL,
  `personal_data` tinyint(4) DEFAULT 0,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_extrafields_name` (`name`,`entity`,`elementtype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_facture`
--

DROP TABLE IF EXISTS `llx_facture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_facture` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref_ext` varchar(255) DEFAULT NULL,
  `ref_client` varchar(255) DEFAULT NULL,
  `type` smallint(6) NOT NULL DEFAULT 0,
  `subtype` smallint(6) DEFAULT NULL,
  `fk_soc` int(11) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `datef` date DEFAULT NULL,
  `date_pointoftax` date DEFAULT NULL,
  `date_valid` date DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date_closing` datetime DEFAULT NULL,
  `paye` smallint(6) NOT NULL DEFAULT 0,
  `remise_percent` double DEFAULT 0,
  `remise_absolue` double DEFAULT 0,
  `remise` double DEFAULT 0,
  `close_code` varchar(16) DEFAULT NULL,
  `close_missing_amount` double(24,8) DEFAULT NULL,
  `close_note` varchar(128) DEFAULT NULL,
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `localtax1` double(24,8) DEFAULT 0.00000000,
  `localtax2` double(24,8) DEFAULT 0.00000000,
  `revenuestamp` double(24,8) DEFAULT 0.00000000,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `fk_statut` smallint(6) NOT NULL DEFAULT 0,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_user_closing` int(11) DEFAULT NULL,
  `module_source` varchar(32) DEFAULT NULL,
  `pos_source` varchar(32) DEFAULT NULL,
  `pos_print_counter` int(11) DEFAULT 0,
  `email_sent_counter` int(11) DEFAULT 0,
  `fk_fac_rec_source` int(11) DEFAULT NULL,
  `fk_facture_source` int(11) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `increment` varchar(10) DEFAULT NULL,
  `fk_account` int(11) DEFAULT NULL,
  `fk_currency` varchar(3) DEFAULT NULL,
  `fk_cond_reglement` int(11) NOT NULL DEFAULT 1,
  `fk_mode_reglement` int(11) DEFAULT NULL,
  `date_lim_reglement` date DEFAULT NULL,
  `payment_reference` varchar(25) DEFAULT NULL,
  `fk_thirdparty_rib_id` int(11) DEFAULT NULL,
  `dispute_status` int(11) DEFAULT 0,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `fk_input_reason` int(11) DEFAULT NULL,
  `fk_incoterms` int(11) DEFAULT NULL,
  `location_incoterms` varchar(255) DEFAULT NULL,
  `fk_transport_mode` int(11) DEFAULT NULL,
  `prorata_discount` double DEFAULT NULL,
  `situation_cycle_ref` int(11) DEFAULT NULL,
  `situation_counter` smallint(6) DEFAULT NULL,
  `situation_final` smallint(6) DEFAULT NULL,
  `retained_warranty` double DEFAULT NULL,
  `retained_warranty_amount` double(24,8) DEFAULT NULL,
  `retained_warranty_date_limit` date DEFAULT NULL,
  `retained_warranty_fk_cond_reglement` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `is_also_delivery_note` tinyint(4) NOT NULL DEFAULT 0,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000,
  `ip` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_facture_ref` (`ref`,`entity`),
  KEY `idx_facture_fk_soc` (`fk_soc`),
  KEY `idx_facture_fk_user_author` (`fk_user_author`),
  KEY `idx_facture_fk_user_valid` (`fk_user_valid`),
  KEY `idx_facture_fk_facture_source` (`fk_facture_source`),
  KEY `idx_facture_fk_projet` (`fk_projet`),
  KEY `idx_facture_fk_account` (`fk_account`),
  KEY `idx_facture_fk_currency` (`fk_currency`),
  KEY `idx_facture_fk_statut` (`fk_statut`),
  KEY `idx_facture_datef` (`datef`),
  KEY `idx_facture_tms` (`tms`),
  KEY `idx_facture_fk_input_reason` (`fk_input_reason`),
  CONSTRAINT `fk_facture_fk_facture_source` FOREIGN KEY (`fk_facture_source`) REFERENCES `llx_facture` (`rowid`),
  CONSTRAINT `fk_facture_fk_input_reason` FOREIGN KEY (`fk_input_reason`) REFERENCES `llx_c_input_reason` (`rowid`),
  CONSTRAINT `fk_facture_fk_projet` FOREIGN KEY (`fk_projet`) REFERENCES `llx_projet` (`rowid`),
  CONSTRAINT `fk_facture_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `fk_facture_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llx_user` (`rowid`),
  CONSTRAINT `fk_facture_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_facture`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_facture` WRITE;
/*!40000 ALTER TABLE `llx_facture` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_facture` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_facture_extrafields`
--

DROP TABLE IF EXISTS `llx_facture_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_facture_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_facture_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_facture_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_facture_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_facture_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_facture_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_facture_fourn`
--

DROP TABLE IF EXISTS `llx_facture_fourn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_facture_fourn` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(180) NOT NULL,
  `ref_supplier` varchar(180) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref_ext` varchar(255) DEFAULT NULL,
  `type` smallint(6) NOT NULL DEFAULT 0,
  `subtype` smallint(6) DEFAULT NULL,
  `fk_soc` int(11) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `datef` date DEFAULT NULL,
  `date_pointoftax` date DEFAULT NULL,
  `date_valid` date DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date_closing` datetime DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `paye` smallint(6) NOT NULL DEFAULT 0,
  `amount` double(24,8) NOT NULL DEFAULT 0.00000000,
  `remise` double(24,8) DEFAULT 0.00000000,
  `close_code` varchar(16) DEFAULT NULL,
  `close_missing_amount` double(24,8) DEFAULT NULL,
  `close_note` varchar(128) DEFAULT NULL,
  `vat_reverse_charge` tinyint(4) DEFAULT 0,
  `tva` double(24,8) DEFAULT 0.00000000,
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `localtax1` double(24,8) DEFAULT 0.00000000,
  `localtax2` double(24,8) DEFAULT 0.00000000,
  `revenuestamp` double(24,8) DEFAULT 0.00000000,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `fk_statut` smallint(6) NOT NULL DEFAULT 0,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_user_closing` int(11) DEFAULT NULL,
  `fk_fac_rec_source` int(11) DEFAULT NULL,
  `fk_facture_source` int(11) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `fk_account` int(11) DEFAULT NULL,
  `fk_cond_reglement` int(11) DEFAULT NULL,
  `fk_mode_reglement` int(11) DEFAULT NULL,
  `date_lim_reglement` date DEFAULT NULL,
  `payment_reference` varchar(25) DEFAULT NULL,
  `fk_thirdparty_rib_id` int(11) DEFAULT NULL,
  `dispute_status` int(11) DEFAULT 0,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `fk_incoterms` int(11) DEFAULT NULL,
  `location_incoterms` varchar(255) DEFAULT NULL,
  `fk_transport_mode` int(11) DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_facture_fourn_ref` (`ref`,`entity`),
  UNIQUE KEY `uk_facture_fourn_ref_supplier` (`ref_supplier`,`fk_soc`,`entity`),
  KEY `idx_facture_fourn_date_lim_reglement` (`date_lim_reglement`),
  KEY `idx_facture_fourn_fk_soc` (`fk_soc`),
  KEY `idx_facture_fourn_fk_user_author` (`fk_user_author`),
  KEY `idx_facture_fourn_fk_user_valid` (`fk_user_valid`),
  KEY `idx_facture_fourn_fk_projet` (`fk_projet`),
  KEY `idx_facture_fourn_tms` (`tms`),
  CONSTRAINT `fk_facture_fourn_fk_projet` FOREIGN KEY (`fk_projet`) REFERENCES `llx_projet` (`rowid`),
  CONSTRAINT `fk_facture_fourn_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `fk_facture_fourn_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llx_user` (`rowid`),
  CONSTRAINT `fk_facture_fourn_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_facture_fourn`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_facture_fourn` WRITE;
/*!40000 ALTER TABLE `llx_facture_fourn` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_facture_fourn` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_facture_fourn_det`
--

DROP TABLE IF EXISTS `llx_facture_fourn_det`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_facture_fourn_det` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_facture_fourn` int(11) NOT NULL,
  `fk_parent_line` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `ref` varchar(128) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `pu_ht` double(24,8) DEFAULT NULL,
  `pu_ttc` double(24,8) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT 0,
  `fk_remise_except` int(11) DEFAULT NULL,
  `vat_src_code` varchar(10) DEFAULT '',
  `tva_tx` double(7,4) DEFAULT NULL,
  `localtax1_tx` double(7,4) DEFAULT 0.0000,
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(7,4) DEFAULT 0.0000,
  `localtax2_type` varchar(10) DEFAULT NULL,
  `total_ht` double(24,8) DEFAULT NULL,
  `tva` double(24,8) DEFAULT NULL,
  `total_localtax1` double(24,8) DEFAULT 0.00000000,
  `total_localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT NULL,
  `product_type` int(11) DEFAULT 0,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `info_bits` int(11) DEFAULT 0,
  `fk_code_ventilation` int(11) NOT NULL DEFAULT 0,
  `special_code` int(11) DEFAULT 0,
  `rang` int(11) DEFAULT 0,
  `import_key` varchar(14) DEFAULT NULL,
  `fk_unit` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT 0.00000000,
  `multicurrency_subprice_ttc` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_fk_remise_except` (`fk_remise_except`,`fk_facture_fourn`),
  KEY `idx_facture_fourn_det_fk_facture` (`fk_facture_fourn`),
  KEY `idx_facture_fourn_det_fk_product` (`fk_product`),
  KEY `idx_facture_fourn_det_fk_code_ventilation` (`fk_code_ventilation`),
  KEY `fk_facture_fourn_det_fk_unit` (`fk_unit`),
  CONSTRAINT `fk_facture_fourn_det_fk_facture` FOREIGN KEY (`fk_facture_fourn`) REFERENCES `llx_facture_fourn` (`rowid`),
  CONSTRAINT `fk_facture_fourn_det_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `llx_c_units` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_facture_fourn_det`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_facture_fourn_det` WRITE;
/*!40000 ALTER TABLE `llx_facture_fourn_det` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_facture_fourn_det` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_facture_fourn_det_extrafields`
--

DROP TABLE IF EXISTS `llx_facture_fourn_det_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_facture_fourn_det_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_facture_fourn_det_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_facture_fourn_det_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_facture_fourn_det_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_facture_fourn_det_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_facture_fourn_det_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_facture_fourn_det_rec`
--

DROP TABLE IF EXISTS `llx_facture_fourn_det_rec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_facture_fourn_det_rec` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_facture_fourn` int(11) NOT NULL,
  `fk_parent_line` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `ref` varchar(50) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `pu_ht` double(24,8) DEFAULT NULL,
  `pu_ttc` double(24,8) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT 0,
  `fk_remise_except` int(11) DEFAULT NULL,
  `vat_src_code` varchar(10) DEFAULT '',
  `tva_tx` double(7,4) DEFAULT NULL,
  `localtax1_tx` double(7,4) DEFAULT 0.0000,
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(7,4) DEFAULT 0.0000,
  `localtax2_type` varchar(10) DEFAULT NULL,
  `total_ht` double(24,8) DEFAULT NULL,
  `total_tva` double(24,8) DEFAULT NULL,
  `total_localtax1` double(24,8) DEFAULT 0.00000000,
  `total_localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT NULL,
  `product_type` int(11) DEFAULT 0,
  `date_start` int(11) DEFAULT NULL,
  `date_end` int(11) DEFAULT NULL,
  `info_bits` int(11) DEFAULT 0,
  `special_code` int(10) unsigned DEFAULT 0,
  `rang` int(11) DEFAULT 0,
  `fk_unit` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT 0.00000000,
  `multicurrency_subprice_ttc` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `fk_facture_fourn_det_rec_fk_unit` (`fk_unit`),
  CONSTRAINT `fk_facture_fourn_det_rec_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `llx_c_units` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_facture_fourn_det_rec`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_facture_fourn_det_rec` WRITE;
/*!40000 ALTER TABLE `llx_facture_fourn_det_rec` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_facture_fourn_det_rec` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_facture_fourn_det_rec_extrafields`
--

DROP TABLE IF EXISTS `llx_facture_fourn_det_rec_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_facture_fourn_det_rec_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `llx_facture_fourn_det_rec_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_facture_fourn_det_rec_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_facture_fourn_det_rec_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_facture_fourn_det_rec_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_facture_fourn_det_rec_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_facture_fourn_extrafields`
--

DROP TABLE IF EXISTS `llx_facture_fourn_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_facture_fourn_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_facture_fourn_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_facture_fourn_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_facture_fourn_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_facture_fourn_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_facture_fourn_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_facture_fourn_rec`
--

DROP TABLE IF EXISTS `llx_facture_fourn_rec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_facture_fourn_rec` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(200) NOT NULL,
  `ref_supplier` varchar(180) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `subtype` smallint(6) DEFAULT NULL,
  `fk_soc` int(11) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `suspended` int(11) DEFAULT 0,
  `libelle` varchar(255) DEFAULT NULL,
  `amount` double(24,8) NOT NULL DEFAULT 0.00000000,
  `remise` double DEFAULT 0,
  `vat_src_code` varchar(10) DEFAULT '',
  `localtax1` double(24,8) DEFAULT 0.00000000,
  `localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `fk_account` int(11) DEFAULT NULL,
  `fk_cond_reglement` int(11) DEFAULT NULL,
  `fk_mode_reglement` int(11) DEFAULT NULL,
  `date_lim_reglement` date DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `modelpdf` varchar(255) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000,
  `usenewprice` int(11) DEFAULT 0,
  `usenewcurrencyrate` int(11) DEFAULT 0,
  `frequency` int(11) DEFAULT NULL,
  `unit_frequency` varchar(2) DEFAULT 'm',
  `date_when` datetime DEFAULT NULL,
  `date_last_gen` datetime DEFAULT NULL,
  `nb_gen_done` int(11) DEFAULT NULL,
  `nb_gen_max` int(11) DEFAULT NULL,
  `auto_validate` int(11) DEFAULT 0,
  `generate_pdf` int(11) DEFAULT 1,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_facture_fourn_rec_ref` (`titre`,`entity`),
  KEY `idx_facture_fourn_rec_fk_soc` (`fk_soc`),
  KEY `idx_facture_fourn_rec_fk_user_author` (`fk_user_author`),
  KEY `idx_facture_fourn_rec_fk_projet` (`fk_projet`),
  CONSTRAINT `fk_facture_fourn_rec_fk_projet` FOREIGN KEY (`fk_projet`) REFERENCES `llx_projet` (`rowid`),
  CONSTRAINT `fk_facture_fourn_rec_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `fk_facture_fourn_rec_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_facture_fourn_rec`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_facture_fourn_rec` WRITE;
/*!40000 ALTER TABLE `llx_facture_fourn_rec` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_facture_fourn_rec` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_facture_fourn_rec_extrafields`
--

DROP TABLE IF EXISTS `llx_facture_fourn_rec_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_facture_fourn_rec_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_facture_fourn_rec_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_facture_fourn_rec_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_facture_fourn_rec_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_facture_fourn_rec_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_facture_fourn_rec_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_facture_rec`
--

DROP TABLE IF EXISTS `llx_facture_rec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_facture_rec` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(200) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `subtype` smallint(6) DEFAULT NULL,
  `fk_soc` int(11) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `suspended` int(11) DEFAULT 0,
  `amount` double(24,8) NOT NULL DEFAULT 0.00000000,
  `remise` double DEFAULT 0,
  `remise_percent` double DEFAULT 0,
  `remise_absolue` double DEFAULT 0,
  `vat_src_code` varchar(10) DEFAULT '',
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `localtax1` double(24,8) DEFAULT 0.00000000,
  `localtax2` double(24,8) DEFAULT 0.00000000,
  `revenuestamp` double(24,8) DEFAULT 0.00000000,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `fk_cond_reglement` int(11) NOT NULL DEFAULT 1,
  `fk_mode_reglement` int(11) DEFAULT 0,
  `date_lim_reglement` date DEFAULT NULL,
  `fk_account` int(11) DEFAULT NULL,
  `fk_societe_rib` int(11) DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `modelpdf` varchar(255) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000,
  `usenewprice` int(11) DEFAULT 0,
  `usenewcurrencyrate` int(11) DEFAULT 0,
  `frequency` int(11) DEFAULT NULL,
  `unit_frequency` varchar(2) DEFAULT 'm',
  `rule_for_lines_dates` varchar(255) DEFAULT 'prepaid',
  `date_when` datetime DEFAULT NULL,
  `date_last_gen` datetime DEFAULT NULL,
  `nb_gen_done` int(11) DEFAULT NULL,
  `nb_gen_max` int(11) DEFAULT NULL,
  `auto_validate` int(11) DEFAULT 0,
  `fk_email_template` int(11) DEFAULT NULL,
  `generate_pdf` int(11) DEFAULT 1,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_facture_rec_uk_titre` (`titre`,`entity`),
  KEY `idx_facture_rec_fk_soc` (`fk_soc`),
  KEY `idx_facture_rec_fk_user_author` (`fk_user_author`),
  KEY `idx_facture_rec_fk_projet` (`fk_projet`),
  KEY `idx_facture_rec_datec` (`datec`),
  CONSTRAINT `fk_facture_rec_fk_projet` FOREIGN KEY (`fk_projet`) REFERENCES `llx_projet` (`rowid`),
  CONSTRAINT `fk_facture_rec_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `fk_facture_rec_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_facture_rec`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_facture_rec` WRITE;
/*!40000 ALTER TABLE `llx_facture_rec` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_facture_rec` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_facture_rec_extrafields`
--

DROP TABLE IF EXISTS `llx_facture_rec_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_facture_rec_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_facture_rec_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_facture_rec_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_facture_rec_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_facture_rec_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_facture_rec_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_facturedet`
--

DROP TABLE IF EXISTS `llx_facturedet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_facturedet` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_facture` int(11) NOT NULL,
  `fk_parent_line` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `vat_src_code` varchar(10) DEFAULT '',
  `tva_tx` double(7,4) DEFAULT NULL,
  `localtax1_tx` double(7,4) DEFAULT 0.0000,
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(7,4) DEFAULT 0.0000,
  `localtax2_type` varchar(10) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT 0,
  `remise` double DEFAULT 0,
  `fk_remise_except` int(11) DEFAULT NULL,
  `subprice` double(24,8) DEFAULT NULL,
  `subprice_ttc` double(24,8) DEFAULT 0.00000000,
  `price` double(24,8) DEFAULT NULL,
  `total_ht` double(24,8) DEFAULT NULL,
  `total_tva` double(24,8) DEFAULT NULL,
  `total_localtax1` double(24,8) DEFAULT 0.00000000,
  `total_localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT NULL,
  `product_type` int(11) DEFAULT 0,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `info_bits` int(11) DEFAULT 0,
  `buy_price_ht` double(24,8) DEFAULT 0.00000000,
  `fk_product_fournisseur_price` int(11) DEFAULT NULL,
  `batch` varchar(128) DEFAULT NULL,
  `fk_warehouse` int(11) DEFAULT NULL,
  `special_code` int(11) DEFAULT 0,
  `rang` int(11) DEFAULT 0,
  `fk_contract_line` int(11) DEFAULT NULL,
  `fk_unit` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `fk_code_ventilation` int(11) NOT NULL DEFAULT 0,
  `situation_percent` double DEFAULT 100,
  `fk_prev_id` int(11) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT 0.00000000,
  `multicurrency_subprice_ttc` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000,
  `ref_ext` varchar(255) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_fk_remise_except` (`fk_remise_except`,`fk_facture`),
  KEY `idx_facturedet_fk_facture` (`fk_facture`),
  KEY `idx_facturedet_fk_product` (`fk_product`),
  KEY `idx_facturedet_fk_code_ventilation` (`fk_code_ventilation`),
  KEY `fk_facturedet_fk_unit` (`fk_unit`),
  CONSTRAINT `fk_facturedet_fk_facture` FOREIGN KEY (`fk_facture`) REFERENCES `llx_facture` (`rowid`),
  CONSTRAINT `fk_facturedet_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `llx_c_units` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_facturedet`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_facturedet` WRITE;
/*!40000 ALTER TABLE `llx_facturedet` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_facturedet` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_facturedet_extrafields`
--

DROP TABLE IF EXISTS `llx_facturedet_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_facturedet_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_facturedet_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_facturedet_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_facturedet_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_facturedet_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_facturedet_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_facturedet_rec`
--

DROP TABLE IF EXISTS `llx_facturedet_rec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_facturedet_rec` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_facture` int(11) NOT NULL,
  `fk_parent_line` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `product_type` int(11) DEFAULT 0,
  `label` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `vat_src_code` varchar(10) DEFAULT '',
  `tva_tx` double(7,4) DEFAULT NULL,
  `localtax1_tx` double(7,4) DEFAULT 0.0000,
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(7,4) DEFAULT 0.0000,
  `localtax2_type` varchar(10) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT 0,
  `remise` double DEFAULT 0,
  `subprice` double(24,8) NOT NULL DEFAULT 0.00000000,
  `subprice_ttc` double(24,8) DEFAULT 0.00000000,
  `price` double(24,8) DEFAULT NULL,
  `total_ht` double(24,8) DEFAULT NULL,
  `total_tva` double(24,8) DEFAULT NULL,
  `total_localtax1` double(24,8) DEFAULT 0.00000000,
  `total_localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT NULL,
  `date_start_fill` int(11) DEFAULT 0,
  `date_end_fill` int(11) DEFAULT 0,
  `info_bits` int(11) DEFAULT 0,
  `buy_price_ht` double(24,8) DEFAULT 0.00000000,
  `fk_product_fournisseur_price` int(11) DEFAULT NULL,
  `special_code` int(10) unsigned DEFAULT 0,
  `rang` int(11) DEFAULT 0,
  `fk_contract_line` int(11) DEFAULT NULL,
  `fk_unit` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT 0.00000000,
  `multicurrency_subprice_ttc` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `fk_facturedet_rec_fk_unit` (`fk_unit`),
  CONSTRAINT `fk_facturedet_rec_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `llx_c_units` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_facturedet_rec`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_facturedet_rec` WRITE;
/*!40000 ALTER TABLE `llx_facturedet_rec` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_facturedet_rec` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_facturedet_rec_extrafields`
--

DROP TABLE IF EXISTS `llx_facturedet_rec_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_facturedet_rec_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_facturedet_rec_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_facturedet_rec_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_facturedet_rec_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_facturedet_rec_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_facturedet_rec_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_fichinter`
--

DROP TABLE IF EXISTS `llx_fichinter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_fichinter` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_soc` int(11) NOT NULL,
  `fk_projet` int(11) DEFAULT 0,
  `fk_contrat` int(11) DEFAULT 0,
  `ref` varchar(30) NOT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `ref_client` varchar(255) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `datei` date DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_statut` smallint(6) DEFAULT 0,
  `dateo` date DEFAULT NULL,
  `datee` date DEFAULT NULL,
  `datet` date DEFAULT NULL,
  `duree` double DEFAULT NULL,
  `description` text DEFAULT NULL,
  `signed_status` smallint(6) DEFAULT NULL,
  `online_sign_ip` varchar(48) DEFAULT NULL,
  `online_sign_name` varchar(64) DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_fichinter_ref` (`ref`,`entity`),
  KEY `idx_fichinter_fk_soc` (`fk_soc`),
  CONSTRAINT `fk_fichinter_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_fichinter`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_fichinter` WRITE;
/*!40000 ALTER TABLE `llx_fichinter` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_fichinter` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_fichinter_extrafields`
--

DROP TABLE IF EXISTS `llx_fichinter_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_fichinter_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_ficheinter_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_fichinter_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_fichinter_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_fichinter_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_fichinter_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_fichinter_rec`
--

DROP TABLE IF EXISTS `llx_fichinter_rec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_fichinter_rec` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_soc` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `fk_contrat` int(11) DEFAULT 0,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `duree` double DEFAULT NULL,
  `description` text DEFAULT NULL,
  `modelpdf` varchar(255) DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `frequency` int(11) DEFAULT NULL,
  `unit_frequency` varchar(2) DEFAULT 'm',
  `date_when` datetime DEFAULT NULL,
  `date_last_gen` datetime DEFAULT NULL,
  `nb_gen_done` int(11) DEFAULT NULL,
  `nb_gen_max` int(11) DEFAULT NULL,
  `auto_validate` int(11) DEFAULT NULL,
  `status` smallint(6) DEFAULT 0,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_fichinter_rec_uk_titre` (`title`,`entity`),
  KEY `idx_fichinter_rec_fk_soc` (`fk_soc`),
  KEY `idx_fichinter_rec_fk_user_author` (`fk_user_author`),
  KEY `idx_fichinter_rec_fk_projet` (`fk_projet`),
  CONSTRAINT `fk_fichinter_rec_fk_projet` FOREIGN KEY (`fk_projet`) REFERENCES `llx_projet` (`rowid`),
  CONSTRAINT `fk_fichinter_rec_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_fichinter_rec`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_fichinter_rec` WRITE;
/*!40000 ALTER TABLE `llx_fichinter_rec` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_fichinter_rec` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_fichinterdet`
--

DROP TABLE IF EXISTS `llx_fichinterdet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_fichinterdet` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_fichinter` int(11) DEFAULT NULL,
  `fk_parent_line` int(11) DEFAULT NULL,
  `special_code` int(11) DEFAULT 0,
  `product_type` int(11) DEFAULT 0,
  `date` datetime DEFAULT NULL,
  `description` text DEFAULT NULL,
  `duree` int(11) DEFAULT NULL,
  `rang` int(11) DEFAULT 0,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_fichinterdet_fk_fichinter` (`fk_fichinter`),
  CONSTRAINT `fk_fichinterdet_fk_fichinter` FOREIGN KEY (`fk_fichinter`) REFERENCES `llx_fichinter` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_fichinterdet`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_fichinterdet` WRITE;
/*!40000 ALTER TABLE `llx_fichinterdet` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_fichinterdet` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_fichinterdet_extrafields`
--

DROP TABLE IF EXISTS `llx_fichinterdet_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_fichinterdet_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_ficheinterdet_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_fichinterdet_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_fichinterdet_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_fichinterdet_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_fichinterdet_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_fichinterdet_rec`
--

DROP TABLE IF EXISTS `llx_fichinterdet_rec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_fichinterdet_rec` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_fichinter` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `description` text DEFAULT NULL,
  `duree` int(11) DEFAULT NULL,
  `rang` int(11) DEFAULT 0,
  `total_ht` double(24,8) DEFAULT NULL,
  `subprice` double(24,8) DEFAULT NULL,
  `subprice_ttc` double(24,8) DEFAULT 0.00000000,
  `fk_parent_line` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `tva_tx` double(6,3) DEFAULT NULL,
  `localtax1_tx` double(6,3) DEFAULT 0.000,
  `localtax1_type` varchar(1) DEFAULT NULL,
  `localtax2_tx` double(6,3) DEFAULT 0.000,
  `localtax2_type` varchar(1) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT 0,
  `fk_remise_except` int(11) DEFAULT NULL,
  `price` double(24,8) DEFAULT NULL,
  `total_tva` double(24,8) DEFAULT NULL,
  `total_localtax1` double(24,8) DEFAULT 0.00000000,
  `total_localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT NULL,
  `product_type` int(11) DEFAULT 0,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `info_bits` int(11) DEFAULT 0,
  `buy_price_ht` double(24,8) DEFAULT 0.00000000,
  `fk_product_fournisseur_price` int(11) DEFAULT NULL,
  `fk_code_ventilation` int(11) NOT NULL DEFAULT 0,
  `special_code` int(10) unsigned DEFAULT 0,
  `fk_unit` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_fichinterdet_rec`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_fichinterdet_rec` WRITE;
/*!40000 ALTER TABLE `llx_fichinterdet_rec` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_fichinterdet_rec` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_holiday`
--

DROP TABLE IF EXISTS `llx_holiday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_holiday` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) NOT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_user` int(11) NOT NULL,
  `fk_user_create` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_type` int(11) NOT NULL,
  `date_create` datetime NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `halfday` int(11) DEFAULT 0,
  `nb_open_day` double(24,8) DEFAULT NULL,
  `statut` int(11) NOT NULL DEFAULT 1,
  `fk_validator` int(11) NOT NULL,
  `date_valid` datetime DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `date_approval` datetime DEFAULT NULL,
  `fk_user_approve` int(11) DEFAULT NULL,
  `date_refuse` datetime DEFAULT NULL,
  `fk_user_refuse` int(11) DEFAULT NULL,
  `date_cancel` datetime DEFAULT NULL,
  `fk_user_cancel` int(11) DEFAULT NULL,
  `detail_refuse` varchar(250) DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_holiday_entity` (`entity`),
  KEY `idx_holiday_fk_user` (`fk_user`),
  KEY `idx_holiday_fk_user_create` (`fk_user_create`),
  KEY `idx_holiday_date_create` (`date_create`),
  KEY `idx_holiday_date_debut` (`date_debut`),
  KEY `idx_holiday_date_fin` (`date_fin`),
  KEY `idx_holiday_fk_validator` (`fk_validator`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_holiday`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_holiday` WRITE;
/*!40000 ALTER TABLE `llx_holiday` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_holiday` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_holiday_config`
--

DROP TABLE IF EXISTS `llx_holiday_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_holiday_config` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `name` varchar(128) NOT NULL,
  `value` text DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_holiday_config` (`entity`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_holiday_config`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_holiday_config` WRITE;
/*!40000 ALTER TABLE `llx_holiday_config` DISABLE KEYS */;
INSERT INTO `llx_holiday_config` VALUES
(1,1,'lastUpdate',NULL);
/*!40000 ALTER TABLE `llx_holiday_config` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_holiday_extrafields`
--

DROP TABLE IF EXISTS `llx_holiday_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_holiday_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_holiday_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_holiday_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_holiday_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_holiday_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_holiday_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_holiday_logs`
--

DROP TABLE IF EXISTS `llx_holiday_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_holiday_logs` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `date_action` datetime NOT NULL,
  `fk_user_action` int(11) NOT NULL,
  `fk_user_update` int(11) NOT NULL,
  `fk_type` int(11) NOT NULL,
  `type_action` varchar(255) NOT NULL,
  `prev_solde` varchar(255) NOT NULL,
  `new_solde` varchar(255) NOT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_holiday_logs`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_holiday_logs` WRITE;
/*!40000 ALTER TABLE `llx_holiday_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_holiday_logs` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_holiday_users`
--

DROP TABLE IF EXISTS `llx_holiday_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_holiday_users` (
  `fk_user` int(11) NOT NULL,
  `fk_type` int(11) NOT NULL,
  `nb_holiday` double NOT NULL DEFAULT 0,
  `import_key` varchar(14) DEFAULT NULL,
  UNIQUE KEY `uk_holiday_users` (`fk_user`,`fk_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_holiday_users`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_holiday_users` WRITE;
/*!40000 ALTER TABLE `llx_holiday_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_holiday_users` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_hrm_evaluation`
--

DROP TABLE IF EXISTS `llx_hrm_evaluation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_hrm_evaluation` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref` varchar(128) NOT NULL DEFAULT '(PROV)',
  `label` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `date_eval` date DEFAULT NULL,
  `fk_user` int(11) NOT NULL,
  `fk_job` int(11) NOT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_hrm_evaluation_rowid` (`rowid`),
  KEY `idx_hrm_evaluation_ref` (`ref`),
  KEY `llx_hrm_evaluation_fk_user_creat` (`fk_user_creat`),
  KEY `idx_hrm_evaluation_status` (`status`),
  CONSTRAINT `llx_hrm_evaluation_fk_user_creat` FOREIGN KEY (`fk_user_creat`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_hrm_evaluation`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_hrm_evaluation` WRITE;
/*!40000 ALTER TABLE `llx_hrm_evaluation` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_hrm_evaluation` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_hrm_evaluation_extrafields`
--

DROP TABLE IF EXISTS `llx_hrm_evaluation_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_hrm_evaluation_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_evaluation_fk_object` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_hrm_evaluation_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_hrm_evaluation_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_hrm_evaluation_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_hrm_evaluation_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_hrm_evaluationdet`
--

DROP TABLE IF EXISTS `llx_hrm_evaluationdet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_hrm_evaluationdet` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_skill` int(11) NOT NULL,
  `fk_evaluation` int(11) NOT NULL,
  `rankorder` int(11) NOT NULL,
  `required_rank` int(11) NOT NULL,
  `comment` text DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_hrm_evaluationdet_rowid` (`rowid`),
  KEY `llx_hrm_evaluationdet_fk_user_creat` (`fk_user_creat`),
  KEY `idx_hrm_evaluationdet_fk_skill` (`fk_skill`),
  KEY `idx_hrm_evaluationdet_fk_evaluation` (`fk_evaluation`),
  CONSTRAINT `llx_hrm_evaluationdet_fk_evaluation` FOREIGN KEY (`fk_evaluation`) REFERENCES `llx_hrm_evaluation` (`rowid`),
  CONSTRAINT `llx_hrm_evaluationdet_fk_user_creat` FOREIGN KEY (`fk_user_creat`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_hrm_evaluationdet`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_hrm_evaluationdet` WRITE;
/*!40000 ALTER TABLE `llx_hrm_evaluationdet` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_hrm_evaluationdet` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_hrm_evaluationdet_extrafields`
--

DROP TABLE IF EXISTS `llx_hrm_evaluationdet_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_hrm_evaluationdet_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_evaluationdet_fk_object` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_hrm_evaluationdet_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_hrm_evaluationdet_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_hrm_evaluationdet_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_hrm_evaluationdet_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_hrm_job`
--

DROP TABLE IF EXISTS `llx_hrm_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_hrm_job` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deplacement` varchar(255) DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_hrm_job_rowid` (`rowid`),
  KEY `idx_hrm_job_label` (`label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_hrm_job`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_hrm_job` WRITE;
/*!40000 ALTER TABLE `llx_hrm_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_hrm_job` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_hrm_job_extrafields`
--

DROP TABLE IF EXISTS `llx_hrm_job_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_hrm_job_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_job_fk_object` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_hrm_job_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_hrm_job_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_hrm_job_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_hrm_job_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_hrm_job_user`
--

DROP TABLE IF EXISTS `llx_hrm_job_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_hrm_job_user` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `description` text DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_contrat` int(11) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `fk_job` int(11) NOT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `abort_comment` varchar(255) DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_hrm_job_user_rowid` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_hrm_job_user`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_hrm_job_user` WRITE;
/*!40000 ALTER TABLE `llx_hrm_job_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_hrm_job_user` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_hrm_skill`
--

DROP TABLE IF EXISTS `llx_hrm_skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_hrm_skill` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `required_level` int(11) NOT NULL,
  `date_validite` int(11) NOT NULL,
  `temps_theorique` double(24,8) NOT NULL,
  `skill_type` int(11) NOT NULL,
  `note_public` text DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_hrm_skill_rowid` (`rowid`),
  KEY `llx_hrm_skill_fk_user_creat` (`fk_user_creat`),
  KEY `idx_hrm_skill_skill_type` (`skill_type`),
  CONSTRAINT `llx_hrm_skill_fk_user_creat` FOREIGN KEY (`fk_user_creat`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_hrm_skill`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_hrm_skill` WRITE;
/*!40000 ALTER TABLE `llx_hrm_skill` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_hrm_skill` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_hrm_skill_extrafields`
--

DROP TABLE IF EXISTS `llx_hrm_skill_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_hrm_skill_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_skill_fk_object` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_hrm_skill_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_hrm_skill_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_hrm_skill_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_hrm_skill_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_hrm_skilldet`
--

DROP TABLE IF EXISTS `llx_hrm_skilldet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_hrm_skilldet` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_skill` int(11) NOT NULL,
  `rankorder` int(11) NOT NULL DEFAULT 1,
  `description` text DEFAULT NULL,
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_hrm_skilldet_rowid` (`rowid`),
  KEY `llx_hrm_skilldet_fk_user_creat` (`fk_user_creat`),
  KEY `llx_hrm_skilldet_fk_skill` (`fk_skill`),
  CONSTRAINT `llx_hrm_skilldet_fk_skill` FOREIGN KEY (`fk_skill`) REFERENCES `llx_hrm_skill` (`rowid`),
  CONSTRAINT `llx_hrm_skilldet_fk_user_creat` FOREIGN KEY (`fk_user_creat`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_hrm_skilldet`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_hrm_skilldet` WRITE;
/*!40000 ALTER TABLE `llx_hrm_skilldet` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_hrm_skilldet` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_hrm_skillrank`
--

DROP TABLE IF EXISTS `llx_hrm_skillrank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_hrm_skillrank` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_skill` int(11) NOT NULL,
  `rankorder` int(11) NOT NULL,
  `fk_object` int(11) NOT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `objecttype` varchar(128) NOT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_hrm_skillrank_rowid` (`rowid`),
  KEY `idx_hrm_skillrank_fk_skill` (`fk_skill`),
  KEY `llx_hrm_skillrank_fk_user_creat` (`fk_user_creat`),
  CONSTRAINT `llx_hrm_skillrank_fk_skill` FOREIGN KEY (`fk_skill`) REFERENCES `llx_hrm_skill` (`rowid`),
  CONSTRAINT `llx_hrm_skillrank_fk_user_creat` FOREIGN KEY (`fk_user_creat`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_hrm_skillrank`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_hrm_skillrank` WRITE;
/*!40000 ALTER TABLE `llx_hrm_skillrank` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_hrm_skillrank` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_import_model`
--

DROP TABLE IF EXISTS `llx_import_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_import_model` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 0,
  `fk_user` int(11) NOT NULL DEFAULT 0,
  `label` varchar(50) NOT NULL,
  `type` varchar(64) NOT NULL,
  `field` text NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_import_model` (`label`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_import_model`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_import_model` WRITE;
/*!40000 ALTER TABLE `llx_import_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_import_model` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_intracommreport`
--

DROP TABLE IF EXISTS `llx_intracommreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_intracommreport` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `type_declaration` varchar(32) DEFAULT NULL,
  `periods` varchar(32) DEFAULT NULL,
  `mode` varchar(32) DEFAULT NULL,
  `content_xml` text DEFAULT NULL,
  `type_export` varchar(10) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_intracommreport`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_intracommreport` WRITE;
/*!40000 ALTER TABLE `llx_intracommreport` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_intracommreport` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_inventory`
--

DROP TABLE IF EXISTS `llx_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_inventory` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) DEFAULT 0,
  `ref` varchar(48) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_warehouse` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `categories_product` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  `title` varchar(255) NOT NULL,
  `date_inventory` datetime DEFAULT NULL,
  `date_validation` datetime DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_inventory_ref` (`ref`,`entity`),
  KEY `idx_inventory_tms` (`tms`),
  KEY `idx_inventory_date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_inventory`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_inventory` WRITE;
/*!40000 ALTER TABLE `llx_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_inventory` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_inventory_extrafields`
--

DROP TABLE IF EXISTS `llx_inventory_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_inventory_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_inventory_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_inventory_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_inventory_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_inventory_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_inventory_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_inventorydet`
--

DROP TABLE IF EXISTS `llx_inventorydet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_inventorydet` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_inventory` int(11) DEFAULT 0,
  `fk_warehouse` int(11) DEFAULT 0,
  `fk_product` int(11) DEFAULT 0,
  `batch` varchar(128) DEFAULT NULL,
  `qty_stock` double DEFAULT NULL,
  `qty_view` double DEFAULT NULL,
  `qty_regulated` double DEFAULT NULL,
  `pmp_real` double DEFAULT NULL,
  `pmp_expected` double DEFAULT NULL,
  `fk_movement` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_inventorydet` (`fk_inventory`,`fk_warehouse`,`fk_product`,`batch`),
  KEY `idx_inventorydet_tms` (`tms`),
  KEY `idx_inventorydet_datec` (`datec`),
  KEY `idx_inventorydet_fk_inventory` (`fk_inventory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_inventorydet`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_inventorydet` WRITE;
/*!40000 ALTER TABLE `llx_inventorydet` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_inventorydet` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_knowledgemanagement_knowledgerecord`
--

DROP TABLE IF EXISTS `llx_knowledgemanagement_knowledgerecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_knowledgemanagement_knowledgerecord` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref` varchar(128) NOT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_main_doc` varchar(255) DEFAULT NULL,
  `lang` varchar(6) DEFAULT NULL,
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `question` text NOT NULL,
  `answer` longtext DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `fk_ticket` int(11) DEFAULT NULL,
  `fk_c_ticket_category` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_knowledgemanagement_knowledgerecord_rowid` (`rowid`),
  KEY `idx_knowledgemanagement_knowledgerecord_ref` (`ref`),
  KEY `llx_knowledgemanagement_knowledgerecord_fk_user_creat` (`fk_user_creat`),
  KEY `idx_knowledgemanagement_knowledgerecord_status` (`status`),
  CONSTRAINT `llx_knowledgemanagement_knowledgerecord_fk_user_creat` FOREIGN KEY (`fk_user_creat`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_knowledgemanagement_knowledgerecord`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_knowledgemanagement_knowledgerecord` WRITE;
/*!40000 ALTER TABLE `llx_knowledgemanagement_knowledgerecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_knowledgemanagement_knowledgerecord` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_knowledgemanagement_knowledgerecord_extrafields`
--

DROP TABLE IF EXISTS `llx_knowledgemanagement_knowledgerecord_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_knowledgemanagement_knowledgerecord_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_knowledgerecord_fk_object` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_knowledgemanagement_knowledgerecord_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_knowledgemanagement_knowledgerecord_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_knowledgemanagement_knowledgerecord_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_knowledgemanagement_knowledgerecord_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_links`
--

DROP TABLE IF EXISTS `llx_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_links` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datea` datetime NOT NULL,
  `url` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `objecttype` varchar(255) NOT NULL,
  `objectid` int(11) NOT NULL,
  `share` varchar(128) DEFAULT NULL,
  `share_pass` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_links` (`objectid`,`objecttype`,`label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_links`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_links` WRITE;
/*!40000 ALTER TABLE `llx_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_links` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_loan`
--

DROP TABLE IF EXISTS `llx_loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_loan` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `label` varchar(80) NOT NULL,
  `fk_bank` int(11) DEFAULT NULL,
  `capital` double(24,8) NOT NULL DEFAULT 0.00000000,
  `insurance_amount` double(24,8) DEFAULT 0.00000000,
  `datestart` date DEFAULT NULL,
  `dateend` date DEFAULT NULL,
  `nbterm` double DEFAULT NULL,
  `rate` double NOT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `capital_position` double(24,8) DEFAULT 0.00000000,
  `date_position` date DEFAULT NULL,
  `paid` smallint(6) NOT NULL DEFAULT 0,
  `accountancy_account_capital` varchar(32) DEFAULT NULL,
  `accountancy_account_insurance` varchar(32) DEFAULT NULL,
  `accountancy_account_interest` varchar(32) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_loan`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_loan` WRITE;
/*!40000 ALTER TABLE `llx_loan` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_loan` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_loan_schedule`
--

DROP TABLE IF EXISTS `llx_loan_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_loan_schedule` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_loan` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datep` datetime DEFAULT NULL,
  `amount_capital` double(24,8) DEFAULT 0.00000000,
  `amount_insurance` double(24,8) DEFAULT 0.00000000,
  `amount_interest` double(24,8) DEFAULT 0.00000000,
  `fk_typepayment` int(11) NOT NULL,
  `num_payment` varchar(50) DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `fk_bank` int(11) NOT NULL,
  `fk_payment_loan` int(11) DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_loan_schedule_ref` (`fk_loan`,`datep`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_loan_schedule`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_loan_schedule` WRITE;
/*!40000 ALTER TABLE `llx_loan_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_loan_schedule` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_localtax`
--

DROP TABLE IF EXISTS `llx_localtax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_localtax` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `localtaxtype` tinyint(4) DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datep` date DEFAULT NULL,
  `datev` date DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `fk_bank` int(11) DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_localtax`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_localtax` WRITE;
/*!40000 ALTER TABLE `llx_localtax` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_localtax` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_mailing`
--

DROP TABLE IF EXISTS `llx_mailing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_mailing` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `messtype` varchar(16) DEFAULT 'email',
  `titre` varchar(128) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `sujet` varchar(128) DEFAULT NULL,
  `body` mediumtext DEFAULT NULL,
  `bgcolor` varchar(8) DEFAULT NULL,
  `bgimage` varchar(255) DEFAULT NULL,
  `evenunsubscribe` smallint(6) DEFAULT 0,
  `cible` varchar(60) DEFAULT NULL,
  `nbemail` int(11) DEFAULT NULL,
  `email_from` varchar(160) DEFAULT NULL,
  `name_from` varchar(128) DEFAULT NULL,
  `email_replyto` varchar(160) DEFAULT NULL,
  `email_errorsto` varchar(160) DEFAULT NULL,
  `tag` varchar(128) DEFAULT NULL,
  `date_creat` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `date_appro` datetime DEFAULT NULL,
  `date_envoi` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_user_appro` int(11) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `joined_file1` varchar(255) DEFAULT NULL,
  `joined_file2` varchar(255) DEFAULT NULL,
  `joined_file3` varchar(255) DEFAULT NULL,
  `joined_file4` varchar(255) DEFAULT NULL,
  `statut` smallint(6) DEFAULT 0,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `fk_project` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_mailing` (`titre`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_mailing`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_mailing` WRITE;
/*!40000 ALTER TABLE `llx_mailing` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_mailing` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_mailing_advtarget`
--

DROP TABLE IF EXISTS `llx_mailing_advtarget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_mailing_advtarget` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(180) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_element` int(11) NOT NULL,
  `type_element` varchar(180) NOT NULL,
  `filtervalue` text DEFAULT NULL,
  `fk_user_author` int(11) NOT NULL,
  `datec` datetime NOT NULL,
  `fk_user_mod` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_advtargetemailing_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_mailing_advtarget`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_mailing_advtarget` WRITE;
/*!40000 ALTER TABLE `llx_mailing_advtarget` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_mailing_advtarget` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_mailing_cibles`
--

DROP TABLE IF EXISTS `llx_mailing_cibles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_mailing_cibles` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_mailing` int(11) NOT NULL,
  `fk_contact` int(11) NOT NULL,
  `lastname` varchar(160) DEFAULT NULL,
  `firstname` varchar(160) DEFAULT NULL,
  `email` varchar(160) NOT NULL,
  `other` varchar(255) DEFAULT NULL,
  `tag` varchar(64) DEFAULT NULL,
  `statut` smallint(6) NOT NULL DEFAULT 0,
  `source_url` varchar(255) DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `source_type` varchar(32) DEFAULT NULL,
  `date_envoi` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `error_text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_mailing_cibles` (`fk_mailing`,`email`),
  KEY `idx_mailing_cibles_email` (`email`),
  KEY `idx_mailing_cibles_tag` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_mailing_cibles`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_mailing_cibles` WRITE;
/*!40000 ALTER TABLE `llx_mailing_cibles` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_mailing_cibles` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_mailing_unsubscribe`
--

DROP TABLE IF EXISTS `llx_mailing_unsubscribe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_mailing_unsubscribe` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `email` varchar(255) DEFAULT NULL,
  `unsubscribegroup` varchar(128) DEFAULT '',
  `ip` varchar(128) DEFAULT NULL,
  `date_creat` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_mailing_unsubscribe` (`email`,`entity`,`unsubscribegroup`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_mailing_unsubscribe`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_mailing_unsubscribe` WRITE;
/*!40000 ALTER TABLE `llx_mailing_unsubscribe` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_mailing_unsubscribe` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_menu`
--

DROP TABLE IF EXISTS `llx_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_menu` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `menu_handler` varchar(16) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `module` varchar(255) DEFAULT NULL,
  `type` varchar(4) NOT NULL,
  `mainmenu` varchar(100) NOT NULL,
  `leftmenu` varchar(100) DEFAULT NULL,
  `fk_menu` int(11) NOT NULL,
  `fk_mainmenu` varchar(100) DEFAULT NULL,
  `fk_leftmenu` varchar(100) DEFAULT NULL,
  `position` int(11) NOT NULL,
  `url` text NOT NULL,
  `showtopmenuinframe` int(11) DEFAULT 0,
  `target` varchar(100) DEFAULT NULL,
  `titre` varchar(255) NOT NULL,
  `prefix` varchar(255) DEFAULT NULL,
  `langs` varchar(100) DEFAULT NULL,
  `level` smallint(6) DEFAULT NULL,
  `perms` text DEFAULT NULL,
  `enabled` text DEFAULT NULL,
  `usertype` int(11) NOT NULL DEFAULT 0,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`rowid`),
  KEY `idx_menu_menuhandler_type` (`menu_handler`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_menu`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_menu` WRITE;
/*!40000 ALTER TABLE `llx_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_menu` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_mrp_mo`
--

DROP TABLE IF EXISTS `llx_mrp_mo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_mrp_mo` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref` varchar(128) NOT NULL DEFAULT '(PROV)',
  `mrptype` int(11) DEFAULT 0,
  `label` varchar(255) DEFAULT NULL,
  `qty` double NOT NULL,
  `fk_warehouse` int(11) DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `date_valid` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `fk_product` int(11) NOT NULL,
  `date_start_planned` datetime DEFAULT NULL,
  `date_end_planned` datetime DEFAULT NULL,
  `fk_bom` int(11) DEFAULT NULL,
  `fk_project` int(11) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `fk_parent_line` int(11) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_mrp_mo_ref` (`ref`),
  KEY `idx_mrp_mo_entity` (`entity`),
  KEY `idx_mrp_mo_fk_soc` (`fk_soc`),
  KEY `fk_mrp_mo_fk_user_creat` (`fk_user_creat`),
  KEY `idx_mrp_mo_status` (`status`),
  KEY `idx_mrp_mo_fk_product` (`fk_product`),
  KEY `idx_mrp_mo_date_start_planned` (`date_start_planned`),
  KEY `idx_mrp_mo_date_end_planned` (`date_end_planned`),
  KEY `idx_mrp_mo_fk_bom` (`fk_bom`),
  KEY `idx_mrp_mo_fk_project` (`fk_project`),
  CONSTRAINT `fk_mrp_mo_fk_user_creat` FOREIGN KEY (`fk_user_creat`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_mrp_mo`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_mrp_mo` WRITE;
/*!40000 ALTER TABLE `llx_mrp_mo` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_mrp_mo` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_mrp_mo_extrafields`
--

DROP TABLE IF EXISTS `llx_mrp_mo_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_mrp_mo_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_mrp_mo_fk_object` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_mrp_mo_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_mrp_mo_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_mrp_mo_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_mrp_mo_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_mrp_production`
--

DROP TABLE IF EXISTS `llx_mrp_production`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_mrp_production` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_mo` int(11) NOT NULL,
  `origin_id` int(11) DEFAULT NULL,
  `origin_type` varchar(10) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `fk_product` int(11) NOT NULL,
  `fk_warehouse` int(11) DEFAULT NULL,
  `qty` double NOT NULL DEFAULT 1,
  `qty_frozen` smallint(6) DEFAULT 0,
  `disable_stock_change` smallint(6) DEFAULT 0,
  `batch` varchar(128) DEFAULT NULL,
  `role` varchar(10) DEFAULT NULL,
  `fk_mrp_production` int(11) DEFAULT NULL,
  `fk_stock_movement` int(11) DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `fk_default_workstation` int(11) DEFAULT NULL,
  `fk_unit` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `fk_mrp_production_product` (`fk_product`),
  KEY `fk_mrp_production_stock_movement` (`fk_stock_movement`),
  KEY `idx_mrp_production_fk_mo` (`fk_mo`),
  CONSTRAINT `fk_mrp_production_mo` FOREIGN KEY (`fk_mo`) REFERENCES `llx_mrp_mo` (`rowid`),
  CONSTRAINT `fk_mrp_production_product` FOREIGN KEY (`fk_product`) REFERENCES `llx_product` (`rowid`),
  CONSTRAINT `fk_mrp_production_stock_movement` FOREIGN KEY (`fk_stock_movement`) REFERENCES `llx_stock_mouvement` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_mrp_production`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_mrp_production` WRITE;
/*!40000 ALTER TABLE `llx_mrp_production` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_mrp_production` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_mrp_production_extrafields`
--

DROP TABLE IF EXISTS `llx_mrp_production_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_mrp_production_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_mrp_production_fk_object` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_mrp_production_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_mrp_production_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_mrp_production_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_mrp_production_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_multicurrency`
--

DROP TABLE IF EXISTS `llx_multicurrency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_multicurrency` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `date_create` datetime DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `entity` int(11) DEFAULT 1,
  `fk_user` int(11) DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_multicurrency`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_multicurrency` WRITE;
/*!40000 ALTER TABLE `llx_multicurrency` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_multicurrency` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_multicurrency_rate`
--

DROP TABLE IF EXISTS `llx_multicurrency_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_multicurrency_rate` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `date_sync` datetime DEFAULT NULL,
  `rate` double NOT NULL DEFAULT 0,
  `rate_direct` double DEFAULT 0,
  `fk_multicurrency` int(11) NOT NULL,
  `entity` int(11) DEFAULT 1,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_multicurrency_rate`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_multicurrency_rate` WRITE;
/*!40000 ALTER TABLE `llx_multicurrency_rate` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_multicurrency_rate` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_notify`
--

DROP TABLE IF EXISTS `llx_notify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_notify` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `daten` datetime DEFAULT NULL,
  `fk_action` int(11) NOT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_contact` int(11) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `type` varchar(16) DEFAULT 'email',
  `type_target` varchar(16) DEFAULT NULL,
  `objet_type` varchar(24) NOT NULL,
  `objet_id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_notify`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_notify` WRITE;
/*!40000 ALTER TABLE `llx_notify` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_notify` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_notify_def`
--

DROP TABLE IF EXISTS `llx_notify_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_notify_def` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) DEFAULT 1,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` date DEFAULT NULL,
  `fk_action` int(11) NOT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_contact` int(11) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `threshold` double(24,8) DEFAULT NULL,
  `context` varchar(128) DEFAULT NULL,
  `type` varchar(16) DEFAULT 'email',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_notify_def`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_notify_def` WRITE;
/*!40000 ALTER TABLE `llx_notify_def` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_notify_def` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_notify_def_object`
--

DROP TABLE IF EXISTS `llx_notify_def_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_notify_def_object` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `objet_type` varchar(16) DEFAULT NULL,
  `objet_id` int(11) NOT NULL,
  `type_notif` varchar(16) DEFAULT 'browser',
  `date_notif` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `moreparam` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_notify_def_object`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_notify_def_object` WRITE;
/*!40000 ALTER TABLE `llx_notify_def_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_notify_def_object` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_oauth_state`
--

DROP TABLE IF EXISTS `llx_oauth_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_oauth_state` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `service` varchar(36) DEFAULT NULL,
  `state` varchar(128) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `fk_adherent` int(11) DEFAULT NULL,
  `entity` int(11) DEFAULT 1,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_oauth_state`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_oauth_state` WRITE;
/*!40000 ALTER TABLE `llx_oauth_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_oauth_state` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_oauth_token`
--

DROP TABLE IF EXISTS `llx_oauth_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_oauth_token` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `service` varchar(36) DEFAULT NULL,
  `token` text DEFAULT NULL,
  `tokenstring` text DEFAULT NULL,
  `tokenstring_refresh` text DEFAULT NULL,
  `expire_at` datetime DEFAULT NULL,
  `state` text DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `fk_adherent` int(11) DEFAULT NULL,
  `restricted_ips` varchar(200) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `entity` int(11) DEFAULT 1,
  `lastaccess` datetime DEFAULT NULL,
  `apicount_previous_month` bigint(20) unsigned DEFAULT 0,
  `apicount_month` bigint(20) unsigned DEFAULT 0,
  `apicount_total` bigint(20) unsigned DEFAULT 0,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_oauth_token`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_oauth_token` WRITE;
/*!40000 ALTER TABLE `llx_oauth_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_oauth_token` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_object_lang`
--

DROP TABLE IF EXISTS `llx_object_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_object_lang` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_object` int(11) NOT NULL DEFAULT 0,
  `type_object` varchar(32) NOT NULL,
  `property` varchar(32) NOT NULL,
  `lang` varchar(5) NOT NULL DEFAULT '',
  `value` text DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_object_lang` (`fk_object`,`type_object`,`property`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_object_lang`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_object_lang` WRITE;
/*!40000 ALTER TABLE `llx_object_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_object_lang` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_onlinesignature`
--

DROP TABLE IF EXISTS `llx_onlinesignature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_onlinesignature` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `object_type` varchar(32) NOT NULL,
  `object_id` int(11) NOT NULL,
  `datec` datetime NOT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `name` varchar(255) NOT NULL,
  `ip` varchar(128) DEFAULT NULL,
  `pathoffile` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_onlinesignature`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_onlinesignature` WRITE;
/*!40000 ALTER TABLE `llx_onlinesignature` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_onlinesignature` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_opensurvey_comments`
--

DROP TABLE IF EXISTS `llx_opensurvey_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_opensurvey_comments` (
  `id_comment` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_sondage` char(16) NOT NULL,
  `comment` text NOT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `usercomment` text DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `ip` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id_comment`),
  KEY `idx_id_comment` (`id_comment`),
  KEY `idx_id_sondage` (`id_sondage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_opensurvey_comments`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_opensurvey_comments` WRITE;
/*!40000 ALTER TABLE `llx_opensurvey_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_opensurvey_comments` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_opensurvey_formquestions`
--

DROP TABLE IF EXISTS `llx_opensurvey_formquestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_opensurvey_formquestions` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `id_sondage` varchar(16) DEFAULT NULL,
  `question` text DEFAULT NULL,
  `available_answers` text DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_opensurvey_formquestions`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_opensurvey_formquestions` WRITE;
/*!40000 ALTER TABLE `llx_opensurvey_formquestions` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_opensurvey_formquestions` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_opensurvey_sondage`
--

DROP TABLE IF EXISTS `llx_opensurvey_sondage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_opensurvey_sondage` (
  `id_sondage` varchar(16) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `commentaires` text DEFAULT NULL,
  `mail_admin` varchar(128) DEFAULT NULL,
  `nom_admin` varchar(64) DEFAULT NULL,
  `fk_user_creat` int(11) NOT NULL,
  `titre` text NOT NULL,
  `date_fin` datetime DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `format` varchar(2) NOT NULL,
  `mailsonde` tinyint(4) NOT NULL DEFAULT 0,
  `allow_comments` tinyint(4) NOT NULL DEFAULT 1,
  `allow_spy` tinyint(4) NOT NULL DEFAULT 1,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `sujet` text DEFAULT NULL,
  PRIMARY KEY (`id_sondage`),
  KEY `idx_date_fin` (`date_fin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_opensurvey_sondage`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_opensurvey_sondage` WRITE;
/*!40000 ALTER TABLE `llx_opensurvey_sondage` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_opensurvey_sondage` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_opensurvey_user_formanswers`
--

DROP TABLE IF EXISTS `llx_opensurvey_user_formanswers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_opensurvey_user_formanswers` (
  `fk_user_survey` int(11) NOT NULL,
  `fk_question` int(11) NOT NULL,
  `reponses` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_opensurvey_user_formanswers`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_opensurvey_user_formanswers` WRITE;
/*!40000 ALTER TABLE `llx_opensurvey_user_formanswers` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_opensurvey_user_formanswers` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_opensurvey_user_studs`
--

DROP TABLE IF EXISTS `llx_opensurvey_user_studs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_opensurvey_user_studs` (
  `id_users` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(64) NOT NULL,
  `id_sondage` varchar(16) NOT NULL,
  `reponses` varchar(200) NOT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date_creation` datetime NOT NULL,
  `ip` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id_users`),
  KEY `idx_opensurvey_user_studs_id_users` (`id_users`),
  KEY `idx_opensurvey_user_studs_nom` (`nom`),
  KEY `idx_opensurvey_user_studs_id_sondage` (`id_sondage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_opensurvey_user_studs`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_opensurvey_user_studs` WRITE;
/*!40000 ALTER TABLE `llx_opensurvey_user_studs` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_opensurvey_user_studs` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_overwrite_trans`
--

DROP TABLE IF EXISTS `llx_overwrite_trans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_overwrite_trans` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `lang` varchar(5) DEFAULT NULL,
  `transkey` varchar(128) DEFAULT NULL,
  `transvalue` text DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_overwrite_trans` (`entity`,`lang`,`transkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_overwrite_trans`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_overwrite_trans` WRITE;
/*!40000 ALTER TABLE `llx_overwrite_trans` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_overwrite_trans` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_paiement`
--

DROP TABLE IF EXISTS `llx_paiement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_paiement` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) DEFAULT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datep` datetime DEFAULT NULL,
  `amount` double(24,8) DEFAULT 0.00000000,
  `multicurrency_amount` double(24,8) DEFAULT 0.00000000,
  `fk_paiement` int(11) NOT NULL,
  `num_paiement` varchar(50) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `ext_payment_id` varchar(255) DEFAULT NULL,
  `ext_payment_site` varchar(128) DEFAULT NULL,
  `fk_bank` int(11) NOT NULL DEFAULT 0,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `statut` smallint(6) NOT NULL DEFAULT 0,
  `fk_export_compta` int(11) NOT NULL DEFAULT 0,
  `pos_change` double(24,8) DEFAULT 0.00000000,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_paiement`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_paiement` WRITE;
/*!40000 ALTER TABLE `llx_paiement` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_paiement` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_paiement_extrafields`
--

DROP TABLE IF EXISTS `llx_paiement_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_paiement_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_paiement_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_paiement_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_paiement_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_paiement_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_paiement_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_paiement_facture`
--

DROP TABLE IF EXISTS `llx_paiement_facture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_paiement_facture` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_paiement` int(11) DEFAULT NULL,
  `fk_facture` int(11) DEFAULT NULL,
  `amount` double(24,8) DEFAULT 0.00000000,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_amount` double(24,8) DEFAULT 0.00000000,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_paiement_facture` (`fk_paiement`,`fk_facture`),
  KEY `idx_paiement_facture_fk_facture` (`fk_facture`),
  KEY `idx_paiement_facture_fk_paiement` (`fk_paiement`),
  CONSTRAINT `fk_paiement_facture_fk_facture` FOREIGN KEY (`fk_facture`) REFERENCES `llx_facture` (`rowid`),
  CONSTRAINT `fk_paiement_facture_fk_paiement` FOREIGN KEY (`fk_paiement`) REFERENCES `llx_paiement` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_paiement_facture`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_paiement_facture` WRITE;
/*!40000 ALTER TABLE `llx_paiement_facture` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_paiement_facture` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_paiementcharge`
--

DROP TABLE IF EXISTS `llx_paiementcharge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_paiementcharge` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_charge` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datep` datetime DEFAULT NULL,
  `amount` double(24,8) DEFAULT 0.00000000,
  `fk_typepaiement` int(11) NOT NULL,
  `num_paiement` varchar(50) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `fk_bank` int(11) NOT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_paiementcharge_fk_charge` (`fk_charge`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_paiementcharge`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_paiementcharge` WRITE;
/*!40000 ALTER TABLE `llx_paiementcharge` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_paiementcharge` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_paiementfourn`
--

DROP TABLE IF EXISTS `llx_paiementfourn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_paiementfourn` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) DEFAULT NULL,
  `entity` int(11) DEFAULT 1,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `datep` datetime DEFAULT NULL,
  `amount` double(24,8) DEFAULT 0.00000000,
  `multicurrency_amount` double(24,8) DEFAULT 0.00000000,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_paiement` int(11) NOT NULL,
  `num_paiement` varchar(50) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `fk_bank` int(11) NOT NULL,
  `statut` smallint(6) NOT NULL DEFAULT 0,
  `model_pdf` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_paiementfourn`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_paiementfourn` WRITE;
/*!40000 ALTER TABLE `llx_paiementfourn` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_paiementfourn` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_paiementfourn_facturefourn`
--

DROP TABLE IF EXISTS `llx_paiementfourn_facturefourn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_paiementfourn_facturefourn` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_paiementfourn` int(11) DEFAULT NULL,
  `fk_facturefourn` int(11) DEFAULT NULL,
  `amount` double(24,8) DEFAULT 0.00000000,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_amount` double(24,8) DEFAULT 0.00000000,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_paiementfourn_facturefourn` (`fk_paiementfourn`,`fk_facturefourn`),
  KEY `idx_paiementfourn_facturefourn_fk_facture` (`fk_facturefourn`),
  KEY `idx_paiementfourn_facturefourn_fk_paiement` (`fk_paiementfourn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_paiementfourn_facturefourn`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_paiementfourn_facturefourn` WRITE;
/*!40000 ALTER TABLE `llx_paiementfourn_facturefourn` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_paiementfourn_facturefourn` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_partnership`
--

DROP TABLE IF EXISTS `llx_partnership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_partnership` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref` varchar(128) NOT NULL DEFAULT '(PROV)',
  `status` smallint(6) NOT NULL DEFAULT 0,
  `fk_type` int(11) NOT NULL DEFAULT 0,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_member` int(11) DEFAULT NULL,
  `email_partnership` varchar(64) DEFAULT NULL,
  `date_partnership_start` date NOT NULL,
  `date_partnership_end` date DEFAULT NULL,
  `reason_decline_or_cancel` text DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_modif` int(11) DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `url_to_check` varchar(255) DEFAULT NULL,
  `count_last_url_check_error` int(11) DEFAULT 0,
  `last_check_backlink` datetime DEFAULT NULL,
  `ip` varchar(250) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_partnership_ref` (`ref`,`entity`),
  UNIQUE KEY `uk_fk_type_fk_soc` (`fk_type`,`fk_soc`,`date_partnership_start`),
  UNIQUE KEY `uk_fk_type_fk_member` (`fk_type`,`fk_member`,`date_partnership_start`),
  KEY `idx_partnership_entity` (`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_partnership`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_partnership` WRITE;
/*!40000 ALTER TABLE `llx_partnership` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_partnership` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_partnership_extrafields`
--

DROP TABLE IF EXISTS `llx_partnership_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_partnership_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_partnership_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_partnership_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_partnership_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_partnership_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_partnership_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_payment_donation`
--

DROP TABLE IF EXISTS `llx_payment_donation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_payment_donation` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_donation` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datep` datetime DEFAULT NULL,
  `amount` double(24,8) DEFAULT 0.00000000,
  `fk_typepayment` int(11) NOT NULL,
  `num_payment` varchar(50) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `ext_payment_id` varchar(255) DEFAULT NULL,
  `ext_payment_site` varchar(128) DEFAULT NULL,
  `fk_bank` int(11) NOT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_payment_donation`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_payment_donation` WRITE;
/*!40000 ALTER TABLE `llx_payment_donation` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_payment_donation` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_payment_expensereport`
--

DROP TABLE IF EXISTS `llx_payment_expensereport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_payment_expensereport` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_expensereport` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datep` datetime DEFAULT NULL,
  `amount` double(24,8) DEFAULT 0.00000000,
  `fk_typepayment` int(11) NOT NULL,
  `num_payment` varchar(50) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `fk_bank` int(11) NOT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_payment_expensereport`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_payment_expensereport` WRITE;
/*!40000 ALTER TABLE `llx_payment_expensereport` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_payment_expensereport` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_payment_loan`
--

DROP TABLE IF EXISTS `llx_payment_loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_payment_loan` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_loan` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datep` datetime DEFAULT NULL,
  `amount_capital` double(24,8) DEFAULT 0.00000000,
  `amount_insurance` double(24,8) DEFAULT 0.00000000,
  `amount_interest` double(24,8) DEFAULT 0.00000000,
  `fk_typepayment` int(11) NOT NULL,
  `num_payment` varchar(50) DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `fk_bank` int(11) NOT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_payment_loan`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_payment_loan` WRITE;
/*!40000 ALTER TABLE `llx_payment_loan` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_payment_loan` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_payment_salary`
--

DROP TABLE IF EXISTS `llx_payment_salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_payment_salary` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `datep` datetime DEFAULT NULL,
  `datev` date DEFAULT NULL,
  `salary` double(24,8) DEFAULT NULL,
  `amount` double(24,8) NOT NULL DEFAULT 0.00000000,
  `fk_projet` int(11) DEFAULT NULL,
  `fk_typepayment` int(11) NOT NULL,
  `num_payment` varchar(50) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `datesp` date DEFAULT NULL,
  `dateep` date DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `note` text DEFAULT NULL,
  `fk_bank` int(11) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_salary` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_payment_salary_ref` (`num_payment`),
  KEY `idx_payment_salary_user` (`fk_user`,`entity`),
  KEY `idx_payment_salary_datep` (`datep`),
  KEY `idx_payment_salary_datesp` (`datesp`),
  KEY `idx_payment_salary_dateep` (`dateep`),
  CONSTRAINT `fk_payment_salary_user` FOREIGN KEY (`fk_user`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_payment_salary`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_payment_salary` WRITE;
/*!40000 ALTER TABLE `llx_payment_salary` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_payment_salary` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_payment_various`
--

DROP TABLE IF EXISTS `llx_payment_various`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_payment_various` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) DEFAULT NULL,
  `num_payment` varchar(50) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `datep` date DEFAULT NULL,
  `datev` date DEFAULT NULL,
  `sens` smallint(6) NOT NULL DEFAULT 0,
  `amount` double(24,8) NOT NULL DEFAULT 0.00000000,
  `fk_typepayment` int(11) NOT NULL,
  `accountancy_code` varchar(32) DEFAULT NULL,
  `subledger_account` varchar(32) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `note` text DEFAULT NULL,
  `fk_bank` int(11) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_payment_various`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_payment_various` WRITE;
/*!40000 ALTER TABLE `llx_payment_various` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_payment_various` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_payment_various_extrafields`
--

DROP TABLE IF EXISTS `llx_payment_various_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_payment_various_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_payment_various_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_payment_various_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_payment_various_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_payment_various_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_payment_various_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_payment_vat`
--

DROP TABLE IF EXISTS `llx_payment_vat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_payment_vat` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_tva` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datep` datetime DEFAULT NULL,
  `amount` double(24,8) DEFAULT 0.00000000,
  `fk_typepaiement` int(11) NOT NULL,
  `num_paiement` varchar(50) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `fk_bank` int(11) NOT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_payment_vat`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_payment_vat` WRITE;
/*!40000 ALTER TABLE `llx_payment_vat` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_payment_vat` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_paymentexpensereport_expensereport`
--

DROP TABLE IF EXISTS `llx_paymentexpensereport_expensereport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_paymentexpensereport_expensereport` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_payment` int(11) DEFAULT NULL,
  `fk_expensereport` int(11) DEFAULT NULL,
  `amount` double(24,8) DEFAULT 0.00000000,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_amount` double(24,8) DEFAULT 0.00000000,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_paymentexpensereport_expensereport`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_paymentexpensereport_expensereport` WRITE;
/*!40000 ALTER TABLE `llx_paymentexpensereport_expensereport` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_paymentexpensereport_expensereport` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_pos_cash_fence`
--

DROP TABLE IF EXISTS `llx_pos_cash_fence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_pos_cash_fence` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref` varchar(64) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `opening` double(24,8) DEFAULT 0.00000000,
  `cash` double(24,8) DEFAULT 0.00000000,
  `card` double(24,8) DEFAULT 0.00000000,
  `cheque` double(24,8) DEFAULT 0.00000000,
  `cash_declared` double(24,8) DEFAULT NULL,
  `card_declared` double(24,8) DEFAULT NULL,
  `cheque_declared` double(24,8) DEFAULT NULL,
  `cash_lifetime` double(24,8) DEFAULT NULL,
  `card_lifetime` double(24,8) DEFAULT NULL,
  `cheque_lifetime` double(24,8) DEFAULT NULL,
  `lifetime_start` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `date_valid` datetime DEFAULT NULL,
  `day_close` int(11) DEFAULT NULL,
  `month_close` int(11) DEFAULT NULL,
  `year_close` int(11) DEFAULT NULL,
  `hour_close` int(11) DEFAULT NULL,
  `min_close` int(11) DEFAULT NULL,
  `sec_close` int(11) DEFAULT NULL,
  `posmodule` varchar(30) DEFAULT NULL,
  `posnumber` varchar(30) DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_pos_cash_fence`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_pos_cash_fence` WRITE;
/*!40000 ALTER TABLE `llx_pos_cash_fence` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_pos_cash_fence` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_pos_cash_fence_extrafields`
--

DROP TABLE IF EXISTS `llx_pos_cash_fence_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_pos_cash_fence_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_pos_cash_fence_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_pos_cash_fence_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_pos_cash_fence_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_pos_cash_fence_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_pos_cash_fence_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_prelevement`
--

DROP TABLE IF EXISTS `llx_prelevement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_prelevement` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_facture` int(11) DEFAULT NULL,
  `fk_facture_fourn` int(11) DEFAULT NULL,
  `fk_salary` int(11) DEFAULT NULL,
  `fk_prelevement_lignes` int(11) NOT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_prelevement_fk_prelevement_lignes` (`fk_prelevement_lignes`),
  CONSTRAINT `fk_prelevement_fk_prelevement_lignes` FOREIGN KEY (`fk_prelevement_lignes`) REFERENCES `llx_prelevement_lignes` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_prelevement`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_prelevement` WRITE;
/*!40000 ALTER TABLE `llx_prelevement` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_prelevement` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_prelevement_bons`
--

DROP TABLE IF EXISTS `llx_prelevement_bons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_prelevement_bons` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(16) DEFAULT 'debit-order',
  `ref` varchar(12) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datec` datetime DEFAULT NULL,
  `amount` double(24,8) DEFAULT 0.00000000,
  `statut` smallint(6) DEFAULT 0,
  `credite` smallint(6) DEFAULT 0,
  `note` text DEFAULT NULL,
  `date_trans` datetime DEFAULT NULL,
  `method_trans` smallint(6) DEFAULT NULL,
  `fk_user_trans` int(11) DEFAULT NULL,
  `date_credit` datetime DEFAULT NULL,
  `fk_user_credit` int(11) DEFAULT NULL,
  `fk_bank_account` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_prelevement_bons_ref` (`ref`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_prelevement_bons`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_prelevement_bons` WRITE;
/*!40000 ALTER TABLE `llx_prelevement_bons` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_prelevement_bons` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_prelevement_demande`
--

DROP TABLE IF EXISTS `llx_prelevement_demande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_prelevement_demande` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_facture` int(11) DEFAULT NULL,
  `fk_facture_fourn` int(11) DEFAULT NULL,
  `fk_salary` int(11) DEFAULT NULL,
  `sourcetype` varchar(32) DEFAULT NULL,
  `amount` double(24,8) NOT NULL,
  `date_demande` datetime NOT NULL,
  `traite` smallint(6) DEFAULT 0,
  `date_traite` datetime DEFAULT NULL,
  `fk_prelevement_bons` int(11) DEFAULT NULL,
  `fk_user_demande` int(11) NOT NULL,
  `fk_societe_rib` int(11) DEFAULT NULL,
  `code_banque` varchar(128) DEFAULT NULL,
  `code_guichet` varchar(6) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `cle_rib` varchar(5) DEFAULT NULL,
  `type` varchar(12) DEFAULT '',
  `ext_payment_id` varchar(255) DEFAULT NULL,
  `ext_payment_site` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_prelevement_demande_fk_facture` (`fk_facture`),
  KEY `idx_prelevement_demande_fk_facture_fourn` (`fk_facture_fourn`),
  KEY `idx_prelevement_demande_ext_payment_id` (`ext_payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_prelevement_demande`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_prelevement_demande` WRITE;
/*!40000 ALTER TABLE `llx_prelevement_demande` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_prelevement_demande` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_prelevement_lignes`
--

DROP TABLE IF EXISTS `llx_prelevement_lignes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_prelevement_lignes` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_prelevement_bons` int(11) DEFAULT NULL,
  `fk_soc` int(11) NOT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `statut` smallint(6) DEFAULT 0,
  `client_nom` varchar(255) DEFAULT NULL,
  `amount` double(24,8) DEFAULT 0.00000000,
  `fk_prelevement_demande` int(11) DEFAULT 0,
  `note` text DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`rowid`),
  KEY `idx_prelevement_lignes_fk_prelevement_bons` (`fk_prelevement_bons`),
  CONSTRAINT `fk_prelevement_lignes_fk_prelevement_bons` FOREIGN KEY (`fk_prelevement_bons`) REFERENCES `llx_prelevement_bons` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_prelevement_lignes`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_prelevement_lignes` WRITE;
/*!40000 ALTER TABLE `llx_prelevement_lignes` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_prelevement_lignes` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_prelevement_rejet`
--

DROP TABLE IF EXISTS `llx_prelevement_rejet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_prelevement_rejet` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_prelevement_lignes` int(11) DEFAULT NULL,
  `date_rejet` datetime DEFAULT NULL,
  `motif` int(11) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `fk_user_creation` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `afacturer` tinyint(4) DEFAULT 0,
  `fk_facture` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_prelevement_rejet`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_prelevement_rejet` WRITE;
/*!40000 ALTER TABLE `llx_prelevement_rejet` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_prelevement_rejet` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_printer_receipt`
--

DROP TABLE IF EXISTS `llx_printer_receipt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_printer_receipt` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `fk_type` int(11) DEFAULT NULL,
  `fk_profile` int(11) DEFAULT NULL,
  `parameter` varchar(128) DEFAULT NULL,
  `entity` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_printer_receipt` (`name`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_printer_receipt`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_printer_receipt` WRITE;
/*!40000 ALTER TABLE `llx_printer_receipt` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_printer_receipt` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_printer_receipt_template`
--

DROP TABLE IF EXISTS `llx_printer_receipt_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_printer_receipt_template` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `template` text DEFAULT NULL,
  `entity` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_printer_receipt_template`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_printer_receipt_template` WRITE;
/*!40000 ALTER TABLE `llx_printer_receipt_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_printer_receipt_template` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_printing`
--

DROP TABLE IF EXISTS `llx_printing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_printing` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `printer_name` text NOT NULL,
  `printer_location` text NOT NULL,
  `printer_id` varchar(255) NOT NULL,
  `copy` int(11) NOT NULL DEFAULT 1,
  `module` varchar(16) NOT NULL,
  `driver` varchar(16) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_printing`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_printing` WRITE;
/*!40000 ALTER TABLE `llx_printing` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_printing` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_product`
--

DROP TABLE IF EXISTS `llx_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_product` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(128) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref_ext` varchar(128) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_parent` int(11) DEFAULT 0,
  `label` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `note_public` mediumtext DEFAULT NULL,
  `note` mediumtext DEFAULT NULL,
  `customcode` varchar(32) DEFAULT NULL,
  `fk_country` int(11) DEFAULT NULL,
  `fk_state` int(11) DEFAULT NULL,
  `price` double(24,8) DEFAULT 0.00000000,
  `price_ttc` double(24,8) DEFAULT 0.00000000,
  `price_min` double(24,8) DEFAULT 0.00000000,
  `price_min_ttc` double(24,8) DEFAULT 0.00000000,
  `price_base_type` varchar(3) DEFAULT 'HT',
  `price_label` varchar(255) DEFAULT NULL,
  `cost_price` double(24,8) DEFAULT NULL,
  `default_vat_code` varchar(10) DEFAULT NULL,
  `tva_tx` double(7,4) DEFAULT NULL,
  `recuperableonly` int(11) NOT NULL DEFAULT 0,
  `localtax1_tx` double(7,4) DEFAULT 0.0000,
  `localtax1_type` varchar(10) NOT NULL DEFAULT '0',
  `localtax2_tx` double(7,4) DEFAULT 0.0000,
  `localtax2_type` varchar(10) NOT NULL DEFAULT '0',
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `tosell` tinyint(4) DEFAULT 1,
  `tobuy` tinyint(4) DEFAULT 1,
  `tobatch` tinyint(4) NOT NULL DEFAULT 0,
  `sell_or_eat_by_mandatory` tinyint(4) NOT NULL DEFAULT 0,
  `batch_mask` varchar(32) DEFAULT NULL,
  `fk_product_type` int(11) DEFAULT 0,
  `duration` varchar(6) DEFAULT NULL,
  `seuil_stock_alerte` float DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `barcode` varchar(180) DEFAULT NULL,
  `fk_barcode_type` int(11) DEFAULT NULL,
  `accountancy_code_sell` varchar(32) DEFAULT NULL,
  `accountancy_code_sell_intra` varchar(32) DEFAULT NULL,
  `accountancy_code_sell_export` varchar(32) DEFAULT NULL,
  `accountancy_code_buy` varchar(32) DEFAULT NULL,
  `accountancy_code_buy_intra` varchar(32) DEFAULT NULL,
  `accountancy_code_buy_export` varchar(32) DEFAULT NULL,
  `partnumber` varchar(32) DEFAULT NULL,
  `net_measure` float DEFAULT NULL,
  `net_measure_units` tinyint(4) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `weight_units` tinyint(4) DEFAULT NULL,
  `length` float DEFAULT NULL,
  `length_units` tinyint(4) DEFAULT NULL,
  `width` float DEFAULT NULL,
  `width_units` tinyint(4) DEFAULT NULL,
  `height` float DEFAULT NULL,
  `height_units` tinyint(4) DEFAULT NULL,
  `surface` float DEFAULT NULL,
  `surface_units` tinyint(4) DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `volume_units` tinyint(4) DEFAULT NULL,
  `stockable_product` int(11) NOT NULL DEFAULT 1,
  `stock` double DEFAULT NULL,
  `pmp` double(24,8) NOT NULL DEFAULT 0.00000000,
  `fifo` double(24,8) DEFAULT NULL,
  `lifo` double(24,8) DEFAULT NULL,
  `fk_default_warehouse` int(11) DEFAULT NULL,
  `fk_default_bom` int(11) DEFAULT NULL,
  `fk_default_workstation` int(11) DEFAULT NULL,
  `canvas` varchar(32) DEFAULT NULL,
  `finished` tinyint(4) DEFAULT NULL,
  `lifetime` int(11) DEFAULT NULL,
  `qc_frequency` int(11) DEFAULT NULL,
  `hidden` tinyint(4) DEFAULT 0,
  `import_key` varchar(14) DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `fk_price_expression` int(11) DEFAULT NULL,
  `desiredstock` float DEFAULT 0,
  `fk_unit` int(11) DEFAULT NULL,
  `price_autogen` tinyint(4) DEFAULT 0,
  `fk_project` int(11) DEFAULT NULL,
  `mandatory_period` tinyint(4) DEFAULT 0,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `packaging` float(24,8) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_ref` (`ref`,`entity`),
  UNIQUE KEY `uk_product_barcode` (`barcode`,`fk_barcode_type`,`entity`),
  KEY `idx_product_label` (`label`),
  KEY `idx_product_barcode` (`barcode`),
  KEY `idx_product_import_key` (`import_key`),
  KEY `idx_product_seuil_stock_alerte` (`seuil_stock_alerte`),
  KEY `idx_product_fk_country` (`fk_country`),
  KEY `idx_product_fk_user_author` (`fk_user_author`),
  KEY `idx_product_fk_barcode_type` (`fk_barcode_type`),
  KEY `idx_product_fk_project` (`fk_project`),
  KEY `idx_product_entity_fk_product_type` (`entity`,`fk_product_type`),
  KEY `fk_product_fk_unit` (`fk_unit`),
  KEY `fk_product_finished` (`finished`),
  CONSTRAINT `fk_product_barcode_type` FOREIGN KEY (`fk_barcode_type`) REFERENCES `llx_c_barcode_type` (`rowid`),
  CONSTRAINT `fk_product_finished` FOREIGN KEY (`finished`) REFERENCES `llx_c_product_nature` (`code`),
  CONSTRAINT `fk_product_fk_country` FOREIGN KEY (`fk_country`) REFERENCES `llx_c_country` (`rowid`),
  CONSTRAINT `fk_product_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `llx_c_units` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_product` WRITE;
/*!40000 ALTER TABLE `llx_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_product_association`
--

DROP TABLE IF EXISTS `llx_product_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_product_association` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_product_pere` int(11) NOT NULL DEFAULT 0,
  `fk_product_fils` int(11) NOT NULL DEFAULT 0,
  `qty` double DEFAULT NULL,
  `incdec` int(11) DEFAULT 1,
  `rang` int(11) DEFAULT 0,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_association` (`fk_product_pere`,`fk_product_fils`),
  KEY `idx_product_association_fils` (`fk_product_fils`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_association`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_product_association` WRITE;
/*!40000 ALTER TABLE `llx_product_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_association` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_product_attribute`
--

DROP TABLE IF EXISTS `llx_product_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_product_attribute` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(255) NOT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `label` varchar(255) NOT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `entity` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_attribute_ref` (`ref`),
  KEY `idx_product_attribute_entity` (`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_attribute`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_product_attribute` WRITE;
/*!40000 ALTER TABLE `llx_product_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_attribute` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_product_attribute_combination`
--

DROP TABLE IF EXISTS `llx_product_attribute_combination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_product_attribute_combination` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_product_parent` int(11) NOT NULL,
  `fk_product_child` int(11) NOT NULL,
  `variation_price` double(24,8) NOT NULL,
  `variation_price_percentage` int(11) DEFAULT NULL,
  `variation_weight` double NOT NULL,
  `variation_ref_ext` varchar(255) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`),
  KEY `idx_product_att_com_product_parent` (`fk_product_parent`),
  KEY `idx_product_att_com_product_child` (`fk_product_child`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_attribute_combination`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_product_attribute_combination` WRITE;
/*!40000 ALTER TABLE `llx_product_attribute_combination` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_attribute_combination` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_product_attribute_combination2val`
--

DROP TABLE IF EXISTS `llx_product_attribute_combination2val`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_product_attribute_combination2val` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_prod_combination` int(11) NOT NULL,
  `fk_prod_attr` int(11) NOT NULL,
  `fk_prod_attr_val` int(11) NOT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_product_att_com2v_prod_combination` (`fk_prod_combination`),
  KEY `idx_product_att_com2v_prod_attr` (`fk_prod_attr`),
  KEY `idx_product_att_com2v_prod_attr_val` (`fk_prod_attr_val`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_attribute_combination2val`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_product_attribute_combination2val` WRITE;
/*!40000 ALTER TABLE `llx_product_attribute_combination2val` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_attribute_combination2val` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_product_attribute_combination_price_level`
--

DROP TABLE IF EXISTS `llx_product_attribute_combination_price_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_product_attribute_combination_price_level` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_product_attribute_combination` int(11) NOT NULL DEFAULT 1,
  `fk_price_level` int(11) NOT NULL DEFAULT 1,
  `variation_price` double(24,8) NOT NULL,
  `variation_price_percentage` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_prod_att_comb_price_level` (`fk_product_attribute_combination`,`fk_price_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_attribute_combination_price_level`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_product_attribute_combination_price_level` WRITE;
/*!40000 ALTER TABLE `llx_product_attribute_combination_price_level` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_attribute_combination_price_level` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_product_attribute_extrafields`
--

DROP TABLE IF EXISTS `llx_product_attribute_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_product_attribute_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_product_attribute_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_attribute_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_product_attribute_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_product_attribute_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_attribute_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_product_attribute_value`
--

DROP TABLE IF EXISTS `llx_product_attribute_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_product_attribute_value` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_product_attribute` int(11) NOT NULL,
  `ref` varchar(180) NOT NULL,
  `value` varchar(255) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `position` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_attribute_value` (`fk_product_attribute`,`ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_attribute_value`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_product_attribute_value` WRITE;
/*!40000 ALTER TABLE `llx_product_attribute_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_attribute_value` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_product_attribute_value_extrafields`
--

DROP TABLE IF EXISTS `llx_product_attribute_value_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_product_attribute_value_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_product_attribute_value_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_attribute_value_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_product_attribute_value_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_product_attribute_value_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_attribute_value_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_product_batch`
--

DROP TABLE IF EXISTS `llx_product_batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_product_batch` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_product_stock` int(11) NOT NULL,
  `eatby` datetime DEFAULT NULL,
  `sellby` datetime DEFAULT NULL,
  `batch` varchar(128) NOT NULL,
  `qty` double NOT NULL DEFAULT 0,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_batch` (`fk_product_stock`,`batch`),
  KEY `idx_fk_product_stock` (`fk_product_stock`),
  KEY `idx_batch` (`batch`),
  CONSTRAINT `fk_product_batch_fk_product_stock` FOREIGN KEY (`fk_product_stock`) REFERENCES `llx_product_stock` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_batch`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_product_batch` WRITE;
/*!40000 ALTER TABLE `llx_product_batch` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_batch` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_product_customer_price`
--

DROP TABLE IF EXISTS `llx_product_customer_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_product_customer_price` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_product` int(11) NOT NULL,
  `fk_soc` int(11) NOT NULL,
  `ref_customer` varchar(128) DEFAULT NULL,
  `date_begin` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `price` double(24,8) DEFAULT 0.00000000,
  `price_ttc` double(24,8) DEFAULT 0.00000000,
  `price_min` double(24,8) DEFAULT 0.00000000,
  `price_min_ttc` double(24,8) DEFAULT 0.00000000,
  `price_base_type` varchar(3) DEFAULT 'HT',
  `default_vat_code` varchar(10) DEFAULT NULL,
  `tva_tx` double(7,4) DEFAULT NULL,
  `recuperableonly` int(11) NOT NULL DEFAULT 0,
  `localtax1_tx` varchar(20) DEFAULT '0',
  `localtax1_type` varchar(10) NOT NULL DEFAULT '0',
  `localtax2_tx` varchar(20) DEFAULT '0',
  `localtax2_type` varchar(10) NOT NULL DEFAULT '0',
  `discount_percent` double DEFAULT 0,
  `fk_user` int(11) DEFAULT NULL,
  `price_label` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_customer_price_fk_product_fk_soc` (`fk_product`,`fk_soc`,`date_begin`),
  KEY `idx_product_customer_price_fk_user` (`fk_user`),
  KEY `idx_product_customer_price_fk_soc` (`fk_soc`),
  CONSTRAINT `fk_product_customer_price_fk_product` FOREIGN KEY (`fk_product`) REFERENCES `llx_product` (`rowid`),
  CONSTRAINT `fk_product_customer_price_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `fk_product_customer_price_fk_user` FOREIGN KEY (`fk_user`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_customer_price`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_product_customer_price` WRITE;
/*!40000 ALTER TABLE `llx_product_customer_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_customer_price` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_product_customer_price_extrafields`
--

DROP TABLE IF EXISTS `llx_product_customer_price_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_product_customer_price_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_customer_price_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_customer_price_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_product_customer_price_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_product_customer_price_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_customer_price_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_product_customer_price_log`
--

DROP TABLE IF EXISTS `llx_product_customer_price_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_product_customer_price_log` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datec` datetime DEFAULT NULL,
  `fk_product` int(11) NOT NULL,
  `fk_soc` int(11) NOT NULL DEFAULT 0,
  `ref_customer` varchar(30) DEFAULT NULL,
  `date_begin` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `price` double(24,8) DEFAULT 0.00000000,
  `price_ttc` double(24,8) DEFAULT 0.00000000,
  `price_min` double(24,8) DEFAULT 0.00000000,
  `price_min_ttc` double(24,8) DEFAULT 0.00000000,
  `price_base_type` varchar(3) DEFAULT 'HT',
  `default_vat_code` varchar(10) DEFAULT NULL,
  `tva_tx` double(7,4) DEFAULT NULL,
  `recuperableonly` int(11) NOT NULL DEFAULT 0,
  `localtax1_tx` varchar(20) DEFAULT '0',
  `localtax1_type` varchar(10) NOT NULL DEFAULT '0',
  `localtax2_tx` varchar(20) DEFAULT '0',
  `localtax2_type` varchar(10) NOT NULL DEFAULT '0',
  `discount_percent` double DEFAULT 0,
  `fk_user` int(11) DEFAULT NULL,
  `price_label` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_customer_price_log`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_product_customer_price_log` WRITE;
/*!40000 ALTER TABLE `llx_product_customer_price_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_customer_price_log` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_product_extrafields`
--

DROP TABLE IF EXISTS `llx_product_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_product_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_product_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_product_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_product_fournisseur_price`
--

DROP TABLE IF EXISTS `llx_product_fournisseur_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_product_fournisseur_price` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_product` int(11) DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `ref_fourn` varchar(128) DEFAULT NULL,
  `desc_fourn` text DEFAULT NULL,
  `fk_availability` int(11) DEFAULT NULL,
  `price` double(24,8) DEFAULT 0.00000000,
  `quantity` double DEFAULT NULL,
  `remise_percent` double NOT NULL DEFAULT 0,
  `remise` double NOT NULL DEFAULT 0,
  `unitprice` double(24,8) DEFAULT 0.00000000,
  `charges` double(24,8) DEFAULT 0.00000000,
  `default_vat_code` varchar(10) DEFAULT NULL,
  `barcode` varchar(180) DEFAULT NULL,
  `fk_barcode_type` int(11) DEFAULT NULL,
  `tva_tx` double(7,4) NOT NULL,
  `localtax1_tx` double(7,4) DEFAULT 0.0000,
  `localtax1_type` varchar(10) NOT NULL DEFAULT '0',
  `localtax2_tx` double(7,4) DEFAULT 0.0000,
  `localtax2_type` varchar(10) NOT NULL DEFAULT '0',
  `info_bits` int(11) NOT NULL DEFAULT 0,
  `fk_user` int(11) DEFAULT NULL,
  `fk_supplier_price_expression` int(11) DEFAULT NULL,
  `delivery_time_days` int(11) DEFAULT NULL,
  `supplier_reputation` varchar(10) DEFAULT NULL,
  `packaging` double DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_unitprice` double(24,8) DEFAULT NULL,
  `multicurrency_price` double(24,8) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_fournisseur_price_ref` (`ref_fourn`,`fk_soc`,`quantity`,`entity`),
  UNIQUE KEY `uk_product_barcode` (`barcode`,`fk_barcode_type`,`entity`),
  KEY `idx_product_fournisseur_price_fk_user` (`fk_user`),
  KEY `idx_product_fourn_price_fk_product` (`fk_product`,`entity`),
  KEY `idx_product_fourn_price_fk_soc` (`fk_soc`,`entity`),
  KEY `idx_product_barcode` (`barcode`),
  KEY `idx_product_fk_barcode_type` (`fk_barcode_type`),
  CONSTRAINT `fk_product_fournisseur_price_barcode_type` FOREIGN KEY (`fk_barcode_type`) REFERENCES `llx_c_barcode_type` (`rowid`),
  CONSTRAINT `fk_product_fournisseur_price_fk_product` FOREIGN KEY (`fk_product`) REFERENCES `llx_product` (`rowid`),
  CONSTRAINT `fk_product_fournisseur_price_fk_user` FOREIGN KEY (`fk_user`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_fournisseur_price`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_product_fournisseur_price` WRITE;
/*!40000 ALTER TABLE `llx_product_fournisseur_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_fournisseur_price` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_product_fournisseur_price_extrafields`
--

DROP TABLE IF EXISTS `llx_product_fournisseur_price_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_product_fournisseur_price_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_fournisseur_price_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_fournisseur_price_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_product_fournisseur_price_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_product_fournisseur_price_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_fournisseur_price_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_product_fournisseur_price_log`
--

DROP TABLE IF EXISTS `llx_product_fournisseur_price_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_product_fournisseur_price_log` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `datec` datetime DEFAULT NULL,
  `fk_product_fournisseur` int(11) NOT NULL,
  `price` double(24,8) DEFAULT 0.00000000,
  `quantity` double DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_unitprice` double(24,8) DEFAULT NULL,
  `multicurrency_price` double(24,8) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_product_fournisseur_price_log_fk_product_fournisseur` (`fk_product_fournisseur`),
  KEY `idx_product_fournisseur_price_log_fk_user` (`fk_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_fournisseur_price_log`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_product_fournisseur_price_log` WRITE;
/*!40000 ALTER TABLE `llx_product_fournisseur_price_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_fournisseur_price_log` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_product_lang`
--

DROP TABLE IF EXISTS `llx_product_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_product_lang` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_product` int(11) NOT NULL DEFAULT 0,
  `lang` varchar(5) NOT NULL DEFAULT '0',
  `label` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `note` mediumtext DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_lang` (`fk_product`,`lang`),
  CONSTRAINT `fk_product_lang_fk_product` FOREIGN KEY (`fk_product`) REFERENCES `llx_product` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_lang`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_product_lang` WRITE;
/*!40000 ALTER TABLE `llx_product_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_lang` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_product_lang_extrafields`
--

DROP TABLE IF EXISTS `llx_product_lang_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_product_lang_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_product_lang_fk_object` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_lang_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_product_lang_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_product_lang_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_lang_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_product_lot`
--

DROP TABLE IF EXISTS `llx_product_lot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_product_lot` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) DEFAULT 1,
  `fk_product` int(11) NOT NULL,
  `batch` varchar(128) DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `eatby` date DEFAULT NULL,
  `sellby` date DEFAULT NULL,
  `eol_date` datetime DEFAULT NULL,
  `manufacturing_date` datetime DEFAULT NULL,
  `scrapping_date` datetime DEFAULT NULL,
  `qc_frequency` int(11) DEFAULT NULL,
  `lifetime` int(11) DEFAULT NULL,
  `barcode` varchar(180) DEFAULT NULL,
  `fk_barcode_type` int(11) DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_lot` (`fk_product`,`batch`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_lot`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_product_lot` WRITE;
/*!40000 ALTER TABLE `llx_product_lot` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_lot` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_product_lot_extrafields`
--

DROP TABLE IF EXISTS `llx_product_lot_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_product_lot_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_lot_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_lot_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_product_lot_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_product_lot_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_lot_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_product_perentity`
--

DROP TABLE IF EXISTS `llx_product_perentity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_product_perentity` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_product` int(11) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `accountancy_code_sell` varchar(32) DEFAULT NULL,
  `accountancy_code_sell_intra` varchar(32) DEFAULT NULL,
  `accountancy_code_sell_export` varchar(32) DEFAULT NULL,
  `accountancy_code_buy` varchar(32) DEFAULT NULL,
  `accountancy_code_buy_intra` varchar(32) DEFAULT NULL,
  `accountancy_code_buy_export` varchar(32) DEFAULT NULL,
  `pmp` double(24,8) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_perentity` (`fk_product`,`entity`),
  KEY `idx_product_perentity_fk_product` (`fk_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_perentity`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_product_perentity` WRITE;
/*!40000 ALTER TABLE `llx_product_perentity` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_perentity` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_product_price`
--

DROP TABLE IF EXISTS `llx_product_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_product_price` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_product` int(11) NOT NULL,
  `date_price` datetime NOT NULL,
  `price_level` smallint(6) DEFAULT 1,
  `price` double(24,8) DEFAULT NULL,
  `price_ttc` double(24,8) DEFAULT NULL,
  `price_min` double(24,8) DEFAULT NULL,
  `price_min_ttc` double(24,8) DEFAULT NULL,
  `price_base_type` varchar(3) DEFAULT 'HT',
  `default_vat_code` varchar(10) DEFAULT NULL,
  `tva_tx` double(7,4) NOT NULL DEFAULT 0.0000,
  `recuperableonly` int(11) NOT NULL DEFAULT 0,
  `localtax1_tx` double(7,4) DEFAULT 0.0000,
  `localtax1_type` varchar(10) NOT NULL DEFAULT '0',
  `localtax2_tx` double(7,4) DEFAULT 0.0000,
  `localtax2_type` varchar(10) NOT NULL DEFAULT '0',
  `fk_user_author` int(11) DEFAULT NULL,
  `price_label` varchar(255) DEFAULT NULL,
  `tosell` tinyint(4) DEFAULT 1,
  `price_by_qty` int(11) NOT NULL DEFAULT 0,
  `fk_price_expression` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_price` double(24,8) DEFAULT NULL,
  `multicurrency_price_ttc` double(24,8) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_product_price_fk_user_author` (`fk_user_author`),
  KEY `idx_product_price_fk_product` (`fk_product`),
  CONSTRAINT `fk_product_price_user_author` FOREIGN KEY (`fk_product`) REFERENCES `llx_product` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_price`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_product_price` WRITE;
/*!40000 ALTER TABLE `llx_product_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_price` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_product_price_by_qty`
--

DROP TABLE IF EXISTS `llx_product_price_by_qty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_product_price_by_qty` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_product_price` int(11) NOT NULL,
  `price` double(24,8) DEFAULT 0.00000000,
  `price_base_type` varchar(3) DEFAULT 'HT',
  `quantity` double DEFAULT NULL,
  `remise_percent` double NOT NULL DEFAULT 0,
  `remise` double NOT NULL DEFAULT 0,
  `unitprice` double(24,8) DEFAULT 0.00000000,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_price` double(24,8) DEFAULT NULL,
  `multicurrency_price_ttc` double(24,8) DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_price_by_qty_level` (`fk_product_price`,`quantity`),
  KEY `idx_product_price_by_qty_fk_product_price` (`fk_product_price`),
  CONSTRAINT `fk_product_price_by_qty_fk_product_price` FOREIGN KEY (`fk_product_price`) REFERENCES `llx_product_price` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_price_by_qty`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_product_price_by_qty` WRITE;
/*!40000 ALTER TABLE `llx_product_price_by_qty` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_price_by_qty` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_product_price_extrafields`
--

DROP TABLE IF EXISTS `llx_product_price_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_product_price_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_price_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_price_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_product_price_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_product_price_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_price_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_product_pricerules`
--

DROP TABLE IF EXISTS `llx_product_pricerules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_product_pricerules` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `level` int(11) NOT NULL,
  `fk_level` int(11) NOT NULL,
  `var_percent` double NOT NULL,
  `var_min_percent` double NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `unique_level` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_pricerules`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_product_pricerules` WRITE;
/*!40000 ALTER TABLE `llx_product_pricerules` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_pricerules` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_product_stock`
--

DROP TABLE IF EXISTS `llx_product_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_product_stock` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_product` int(11) NOT NULL,
  `fk_entrepot` int(11) NOT NULL,
  `reel` double DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_stock` (`fk_product`,`fk_entrepot`),
  KEY `idx_product_stock_fk_product` (`fk_product`),
  KEY `idx_product_stock_fk_entrepot` (`fk_entrepot`),
  CONSTRAINT `fk_entrepot_entrepot_rowid` FOREIGN KEY (`fk_entrepot`) REFERENCES `llx_entrepot` (`rowid`),
  CONSTRAINT `fk_product_product_rowid` FOREIGN KEY (`fk_product`) REFERENCES `llx_product` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_stock`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_product_stock` WRITE;
/*!40000 ALTER TABLE `llx_product_stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_stock` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_product_thirdparty`
--

DROP TABLE IF EXISTS `llx_product_thirdparty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_product_thirdparty` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_product` int(11) NOT NULL,
  `fk_soc` int(11) NOT NULL,
  `fk_product_thirdparty_relation_type` int(11) NOT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `fk_project` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_thirdparty`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_product_thirdparty` WRITE;
/*!40000 ALTER TABLE `llx_product_thirdparty` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_thirdparty` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_product_warehouse_properties`
--

DROP TABLE IF EXISTS `llx_product_warehouse_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_product_warehouse_properties` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_product` int(11) NOT NULL,
  `fk_entrepot` int(11) NOT NULL,
  `seuil_stock_alerte` float DEFAULT 0,
  `desiredstock` float DEFAULT 0,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_product_warehouse_properties_fk_product` (`fk_product`),
  KEY `idx_product_warehouse_properties_fk_entrepot` (`fk_entrepot`),
  CONSTRAINT `fk_product_warehouse_properties_fk_entrepot` FOREIGN KEY (`fk_entrepot`) REFERENCES `llx_entrepot` (`rowid`),
  CONSTRAINT `fk_product_warehouse_properties_fk_product` FOREIGN KEY (`fk_product`) REFERENCES `llx_product` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_warehouse_properties`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_product_warehouse_properties` WRITE;
/*!40000 ALTER TABLE `llx_product_warehouse_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_warehouse_properties` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_projet`
--

DROP TABLE IF EXISTS `llx_projet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_projet` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_project` int(11) DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `dateo` date DEFAULT NULL,
  `datee` date DEFAULT NULL,
  `ref` varchar(50) DEFAULT NULL,
  `ref_ext` varchar(50) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `public` int(11) DEFAULT NULL,
  `fk_statut` int(11) NOT NULL DEFAULT 0,
  `fk_opp_status` int(11) DEFAULT NULL,
  `opp_percent` double(5,2) DEFAULT NULL,
  `fk_opp_status_end` int(11) DEFAULT NULL,
  `date_close` datetime DEFAULT NULL,
  `fk_user_close` int(11) DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `email_msgid` varchar(175) DEFAULT NULL,
  `email_date` datetime DEFAULT NULL,
  `opp_amount` double(24,8) DEFAULT NULL,
  `budget_amount` double(24,8) DEFAULT NULL,
  `usage_opportunity` int(11) DEFAULT 0,
  `usage_task` int(11) DEFAULT 1,
  `usage_bill_time` int(11) DEFAULT 0,
  `usage_organize_event` int(11) DEFAULT 0,
  `date_start_event` datetime DEFAULT NULL,
  `date_end_event` datetime DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `accept_conference_suggestions` int(11) DEFAULT 0,
  `accept_booth_suggestions` int(11) DEFAULT 0,
  `max_attendees` int(11) DEFAULT 0,
  `price_registration` double(24,8) DEFAULT NULL,
  `price_booth` double(24,8) DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `ip` varchar(250) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_projet_ref` (`ref`,`entity`),
  KEY `idx_projet_fk_soc` (`fk_soc`),
  KEY `idx_projet_ref` (`ref`),
  KEY `idx_projet_fk_statut` (`fk_statut`),
  KEY `idx_projet_fk_opp_status` (`fk_opp_status`),
  CONSTRAINT `fk_projet_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_projet`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_projet` WRITE;
/*!40000 ALTER TABLE `llx_projet` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_projet` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_projet_extrafields`
--

DROP TABLE IF EXISTS `llx_projet_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_projet_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_projet_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_projet_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_projet_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_projet_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_projet_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_projet_task`
--

DROP TABLE IF EXISTS `llx_projet_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_projet_task` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(50) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_projet` int(11) NOT NULL,
  `fk_task_parent` int(11) NOT NULL DEFAULT 0,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `dateo` datetime DEFAULT NULL,
  `datee` datetime DEFAULT NULL,
  `datev` datetime DEFAULT NULL,
  `label` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `duration_effective` double DEFAULT 0,
  `planned_workload` double DEFAULT 0,
  `progress` int(11) DEFAULT 0,
  `priority` int(11) DEFAULT 0,
  `budget_amount` double(24,8) DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_statut` smallint(6) NOT NULL DEFAULT 0,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `rang` int(11) DEFAULT 0,
  `model_pdf` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `billable` smallint(6) DEFAULT 1,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_projet_task_ref` (`ref`,`entity`),
  KEY `idx_projet_task_fk_projet` (`fk_projet`),
  KEY `idx_projet_task_fk_user_creat` (`fk_user_creat`),
  KEY `idx_projet_task_fk_user_valid` (`fk_user_valid`),
  CONSTRAINT `fk_projet_task_fk_projet` FOREIGN KEY (`fk_projet`) REFERENCES `llx_projet` (`rowid`),
  CONSTRAINT `fk_projet_task_fk_user_creat` FOREIGN KEY (`fk_user_creat`) REFERENCES `llx_user` (`rowid`),
  CONSTRAINT `fk_projet_task_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_projet_task`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_projet_task` WRITE;
/*!40000 ALTER TABLE `llx_projet_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_projet_task` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_projet_task_extrafields`
--

DROP TABLE IF EXISTS `llx_projet_task_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_projet_task_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_projet_task_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_projet_task_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_projet_task_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_projet_task_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_projet_task_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_propal`
--

DROP TABLE IF EXISTS `llx_propal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_propal` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref_ext` varchar(255) DEFAULT NULL,
  `ref_client` varchar(255) DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `datep` date DEFAULT NULL,
  `fin_validite` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `date_signature` datetime DEFAULT NULL,
  `date_cloture` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_user_signature` int(11) DEFAULT NULL,
  `fk_user_cloture` int(11) DEFAULT NULL,
  `fk_statut` smallint(6) NOT NULL DEFAULT 0,
  `price` double DEFAULT 0,
  `remise_percent` double DEFAULT 0,
  `remise_absolue` double DEFAULT 0,
  `remise` double DEFAULT 0,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `localtax1` double(24,8) DEFAULT 0.00000000,
  `localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `fk_account` int(11) DEFAULT NULL,
  `fk_currency` varchar(3) DEFAULT NULL,
  `fk_cond_reglement` int(11) DEFAULT NULL,
  `deposit_percent` varchar(63) DEFAULT NULL,
  `fk_mode_reglement` int(11) DEFAULT NULL,
  `online_sign_ip` varchar(48) DEFAULT NULL,
  `online_sign_name` varchar(64) DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `model_pdf_pos_sign` varchar(32) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `date_livraison` date DEFAULT NULL,
  `fk_shipping_method` int(11) DEFAULT NULL,
  `fk_warehouse` int(11) DEFAULT NULL,
  `fk_availability` int(11) DEFAULT NULL,
  `fk_input_reason` int(11) DEFAULT NULL,
  `fk_incoterms` int(11) DEFAULT NULL,
  `location_incoterms` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `fk_delivery_address` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_propal_ref` (`ref`,`entity`),
  KEY `idx_propal_fk_soc` (`fk_soc`),
  KEY `idx_propal_fk_user_author` (`fk_user_author`),
  KEY `idx_propal_fk_user_valid` (`fk_user_valid`),
  KEY `idx_propal_fk_user_signature` (`fk_user_signature`),
  KEY `idx_propal_fk_user_cloture` (`fk_user_cloture`),
  KEY `idx_propal_fk_projet` (`fk_projet`),
  KEY `idx_propal_fk_account` (`fk_account`),
  KEY `idx_propal_fk_currency` (`fk_currency`),
  KEY `idx_propal_fk_warehouse` (`fk_warehouse`),
  CONSTRAINT `fk_propal_fk_projet` FOREIGN KEY (`fk_projet`) REFERENCES `llx_projet` (`rowid`),
  CONSTRAINT `fk_propal_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `fk_propal_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llx_user` (`rowid`),
  CONSTRAINT `fk_propal_fk_user_cloture` FOREIGN KEY (`fk_user_cloture`) REFERENCES `llx_user` (`rowid`),
  CONSTRAINT `fk_propal_fk_user_signature` FOREIGN KEY (`fk_user_signature`) REFERENCES `llx_user` (`rowid`),
  CONSTRAINT `fk_propal_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_propal`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_propal` WRITE;
/*!40000 ALTER TABLE `llx_propal` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_propal` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_propal_extrafields`
--

DROP TABLE IF EXISTS `llx_propal_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_propal_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_propal_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_propal_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_propal_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_propal_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_propal_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_propal_merge_pdf_product`
--

DROP TABLE IF EXISTS `llx_propal_merge_pdf_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_propal_merge_pdf_product` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_product` int(11) NOT NULL,
  `file_name` varchar(200) NOT NULL,
  `lang` varchar(5) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_mod` int(11) NOT NULL,
  `datec` datetime NOT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_propal_merge_pdf_product`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_propal_merge_pdf_product` WRITE;
/*!40000 ALTER TABLE `llx_propal_merge_pdf_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_propal_merge_pdf_product` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_propaldet`
--

DROP TABLE IF EXISTS `llx_propaldet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_propaldet` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_propal` int(11) NOT NULL,
  `fk_parent_line` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `fk_remise_except` int(11) DEFAULT NULL,
  `vat_src_code` varchar(10) DEFAULT '',
  `tva_tx` double(7,4) DEFAULT 0.0000,
  `localtax1_tx` double(7,4) DEFAULT 0.0000,
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(7,4) DEFAULT 0.0000,
  `localtax2_type` varchar(10) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT 0,
  `remise` double DEFAULT 0,
  `price` double DEFAULT NULL,
  `subprice` double(24,8) DEFAULT 0.00000000,
  `subprice_ttc` double(24,8) DEFAULT 0.00000000,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `total_localtax1` double(24,8) DEFAULT 0.00000000,
  `total_localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `product_type` int(11) DEFAULT 0,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `info_bits` int(11) DEFAULT 0,
  `buy_price_ht` double(24,8) DEFAULT 0.00000000,
  `fk_product_fournisseur_price` int(11) DEFAULT NULL,
  `special_code` int(11) DEFAULT 0,
  `rang` int(11) DEFAULT 0,
  `fk_unit` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT 0.00000000,
  `multicurrency_subprice_ttc` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_propaldet_fk_propal` (`fk_propal`),
  KEY `idx_propaldet_fk_product` (`fk_product`),
  KEY `fk_propaldet_fk_unit` (`fk_unit`),
  CONSTRAINT `fk_propaldet_fk_propal` FOREIGN KEY (`fk_propal`) REFERENCES `llx_propal` (`rowid`),
  CONSTRAINT `fk_propaldet_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `llx_c_units` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_propaldet`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_propaldet` WRITE;
/*!40000 ALTER TABLE `llx_propaldet` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_propaldet` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_propaldet_extrafields`
--

DROP TABLE IF EXISTS `llx_propaldet_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_propaldet_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_propaldet_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_propaldet_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_propaldet_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_propaldet_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_propaldet_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_quickmemo_memo`
--

DROP TABLE IF EXISTS `llx_quickmemo_memo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_quickmemo_memo` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_element` int(11) NOT NULL,
  `element_type` varchar(64) NOT NULL,
  `quick_note` text DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_archived` int(11) DEFAULT NULL,
  `date_archived` timestamp NULL DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `pos_z` int(11) NOT NULL DEFAULT 0,
  `pos_y` int(11) NOT NULL DEFAULT 0,
  `pos_x` int(11) NOT NULL DEFAULT 0,
  `pos_w` int(11) NOT NULL DEFAULT 0,
  `pos_h` int(11) NOT NULL DEFAULT 0,
  `color` varchar(10) DEFAULT NULL,
  `context_tab` varchar(64) DEFAULT NULL,
  `private` tinyint(4) NOT NULL DEFAULT 1,
  `private_tpl` tinyint(4) DEFAULT 0,
  `rank_tpl` int(11) DEFAULT 0,
  `name_tpl` varchar(256) DEFAULT NULL,
  `shared_on_element` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`),
  KEY `idx_quickmemo_memo_rowid` (`rowid`),
  KEY `idx_quickmemo_memo_element` (`fk_element`,`element_type`),
  KEY `idx_quickmemo_memo_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_quickmemo_memo`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_quickmemo_memo` WRITE;
/*!40000 ALTER TABLE `llx_quickmemo_memo` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_quickmemo_memo` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_quickmemo_memo_extrafields`
--

DROP TABLE IF EXISTS `llx_quickmemo_memo_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_quickmemo_memo_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_memo_fk_object` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_quickmemo_memo_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_quickmemo_memo_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_quickmemo_memo_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_quickmemo_memo_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_quickmemo_memo_user`
--

DROP TABLE IF EXISTS `llx_quickmemo_memo_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_quickmemo_memo_user` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_memo` int(11) NOT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user` int(11) NOT NULL,
  `pos_z` int(11) NOT NULL DEFAULT 0,
  `pos_y` int(11) NOT NULL DEFAULT 0,
  `pos_x` int(11) NOT NULL DEFAULT 0,
  `pos_w` int(11) NOT NULL DEFAULT 0,
  `pos_h` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_memo_user` (`fk_memo`,`fk_user`),
  KEY `idx_quickmemo_memo_rowid` (`fk_memo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_quickmemo_memo_user`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_quickmemo_memo_user` WRITE;
/*!40000 ALTER TABLE `llx_quickmemo_memo_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_quickmemo_memo_user` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_reception`
--

DROP TABLE IF EXISTS `llx_reception`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_reception` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ref` varchar(30) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_soc` int(11) NOT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `ref_ext` varchar(30) DEFAULT NULL,
  `ref_supplier` varchar(255) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `date_delivery` datetime DEFAULT NULL,
  `date_reception` datetime DEFAULT NULL,
  `fk_shipping_method` int(11) DEFAULT NULL,
  `tracking_number` varchar(50) DEFAULT NULL,
  `fk_statut` smallint(6) DEFAULT 0,
  `billed` smallint(6) DEFAULT 0,
  `height` float DEFAULT NULL,
  `width` float DEFAULT NULL,
  `size_units` int(11) DEFAULT NULL,
  `size` float DEFAULT NULL,
  `weight_units` int(11) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `fk_incoterms` int(11) DEFAULT NULL,
  `location_incoterms` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_reception_uk_ref` (`ref`,`entity`),
  KEY `idx_reception_fk_soc` (`fk_soc`),
  KEY `idx_reception_fk_user_author` (`fk_user_author`),
  KEY `idx_reception_fk_user_valid` (`fk_user_valid`),
  KEY `idx_reception_fk_shipping_method` (`fk_shipping_method`),
  CONSTRAINT `fk_reception_fk_shipping_method` FOREIGN KEY (`fk_shipping_method`) REFERENCES `llx_c_shipment_mode` (`rowid`),
  CONSTRAINT `fk_reception_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `fk_reception_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llx_user` (`rowid`),
  CONSTRAINT `fk_reception_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_reception`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_reception` WRITE;
/*!40000 ALTER TABLE `llx_reception` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_reception` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_reception_extrafields`
--

DROP TABLE IF EXISTS `llx_reception_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_reception_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_reception_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_reception_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_reception_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_reception_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_reception_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_receptiondet_batch`
--

DROP TABLE IF EXISTS `llx_receptiondet_batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_receptiondet_batch` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_reception` int(11) DEFAULT NULL,
  `fk_element` int(11) DEFAULT NULL,
  `fk_elementdet` int(11) DEFAULT NULL,
  `element_type` varchar(50) NOT NULL DEFAULT 'supplier_order',
  `fk_product` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `qty` float DEFAULT NULL,
  `fk_unit` int(11) DEFAULT NULL,
  `fk_entrepot` int(11) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `batch` varchar(128) DEFAULT NULL,
  `eatby` date DEFAULT NULL,
  `sellby` date DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `cost_price` double(24,8) DEFAULT 0.00000000,
  `rang` int(11) DEFAULT 0,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_receptiondet_batch_fk_element` (`fk_element`),
  KEY `idx_receptiondet_batch_fk_reception` (`fk_reception`),
  KEY `idx_receptiondet_batch_fk_product` (`fk_product`),
  KEY `idx_receptiondet_batch_fk_elementdet` (`fk_elementdet`),
  CONSTRAINT `fk_receptiondet_batch_fk_reception` FOREIGN KEY (`fk_reception`) REFERENCES `llx_reception` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_receptiondet_batch`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_receptiondet_batch` WRITE;
/*!40000 ALTER TABLE `llx_receptiondet_batch` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_receptiondet_batch` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_receptiondet_batch_extrafields`
--

DROP TABLE IF EXISTS `llx_receptiondet_batch_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_receptiondet_batch_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_receptiondet_batch_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_receptiondet_batch_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_receptiondet_batch_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_receptiondet_batch_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_receptiondet_batch_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_recruitment_recruitmentcandidature`
--

DROP TABLE IF EXISTS `llx_recruitment_recruitmentcandidature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_recruitment_recruitmentcandidature` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref` varchar(128) NOT NULL DEFAULT '(PROV)',
  `fk_recruitmentjobposition` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `firstname` varchar(128) DEFAULT NULL,
  `lastname` varchar(128) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(64) DEFAULT NULL,
  `date_birth` date DEFAULT NULL,
  `remuneration_requested` int(11) DEFAULT NULL,
  `remuneration_proposed` int(11) DEFAULT NULL,
  `email_msgid` varchar(175) DEFAULT NULL,
  `email_date` datetime DEFAULT NULL,
  `fk_recruitment_origin` int(11) DEFAULT NULL,
  `ip` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_recruitmentcandidature_email_msgid` (`email_msgid`),
  KEY `idx_recruitment_recruitmentcandidature_rowid` (`rowid`),
  KEY `idx_recruitment_recruitmentcandidature_ref` (`ref`),
  KEY `llx_recruitment_recruitmentcandidature_fk_user_creat` (`fk_user_creat`),
  KEY `idx_recruitment_recruitmentcandidature_status` (`status`),
  CONSTRAINT `llx_recruitment_recruitmentcandidature_fk_user_creat` FOREIGN KEY (`fk_user_creat`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_recruitment_recruitmentcandidature`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_recruitment_recruitmentcandidature` WRITE;
/*!40000 ALTER TABLE `llx_recruitment_recruitmentcandidature` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_recruitment_recruitmentcandidature` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_recruitment_recruitmentcandidature_extrafields`
--

DROP TABLE IF EXISTS `llx_recruitment_recruitmentcandidature_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_recruitment_recruitmentcandidature_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_recruitmentcandidature_fk_object` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_recruitment_recruitmentcandidature_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_recruitment_recruitmentcandidature_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_recruitment_recruitmentcandidature_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_recruitment_recruitmentcandidature_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_recruitment_recruitmentjobposition`
--

DROP TABLE IF EXISTS `llx_recruitment_recruitmentjobposition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_recruitment_recruitmentjobposition` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(128) NOT NULL DEFAULT '(PROV)',
  `entity` int(11) NOT NULL DEFAULT 1,
  `label` varchar(255) NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 1,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_project` int(11) DEFAULT NULL,
  `fk_user_recruiter` int(11) DEFAULT NULL,
  `email_recruiter` varchar(255) DEFAULT NULL,
  `fk_user_supervisor` int(11) DEFAULT NULL,
  `fk_establishment` int(11) DEFAULT NULL,
  `date_planned` date DEFAULT NULL,
  `remuneration_suggested` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_recruitment_recruitmentjobposition_rowid` (`rowid`),
  KEY `idx_recruitment_recruitmentjobposition_ref` (`ref`),
  KEY `idx_recruitment_recruitmentjobposition_fk_soc` (`fk_soc`),
  KEY `idx_recruitment_recruitmentjobposition_fk_project` (`fk_project`),
  KEY `llx_recruitment_recruitmentjobposition_fk_user_recruiter` (`fk_user_recruiter`),
  KEY `llx_recruitment_recruitmentjobposition_fk_user_supervisor` (`fk_user_supervisor`),
  KEY `llx_recruitment_recruitmentjobposition_fk_establishment` (`fk_establishment`),
  KEY `llx_recruitment_recruitmentjobposition_fk_user_creat` (`fk_user_creat`),
  KEY `idx_recruitment_recruitmentjobposition_status` (`status`),
  CONSTRAINT `llx_recruitment_recruitmentjobposition_fk_establishment` FOREIGN KEY (`fk_establishment`) REFERENCES `llx_establishment` (`rowid`),
  CONSTRAINT `llx_recruitment_recruitmentjobposition_fk_user_creat` FOREIGN KEY (`fk_user_creat`) REFERENCES `llx_user` (`rowid`),
  CONSTRAINT `llx_recruitment_recruitmentjobposition_fk_user_recruiter` FOREIGN KEY (`fk_user_recruiter`) REFERENCES `llx_user` (`rowid`),
  CONSTRAINT `llx_recruitment_recruitmentjobposition_fk_user_supervisor` FOREIGN KEY (`fk_user_supervisor`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_recruitment_recruitmentjobposition`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_recruitment_recruitmentjobposition` WRITE;
/*!40000 ALTER TABLE `llx_recruitment_recruitmentjobposition` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_recruitment_recruitmentjobposition` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_recruitment_recruitmentjobposition_extrafields`
--

DROP TABLE IF EXISTS `llx_recruitment_recruitmentjobposition_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_recruitment_recruitmentjobposition_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_recruitmentjobposition_fk_object` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_recruitment_recruitmentjobposition_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_recruitment_recruitmentjobposition_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_recruitment_recruitmentjobposition_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_recruitment_recruitmentjobposition_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_resource`
--

DROP TABLE IF EXISTS `llx_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_resource` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref` varchar(255) DEFAULT NULL,
  `asset_number` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `fk_code_type_resource` varchar(32) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zip` varchar(25) DEFAULT NULL,
  `town` varchar(50) DEFAULT NULL,
  `photo_filename` varchar(255) DEFAULT NULL,
  `max_users` int(11) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_statut` smallint(6) NOT NULL DEFAULT 0,
  `note_public` text DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `fk_country` int(11) DEFAULT NULL,
  `fk_state` int(11) DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_resource_ref` (`ref`,`entity`),
  KEY `fk_code_type_resource_idx` (`fk_code_type_resource`),
  KEY `idx_resource_fk_country` (`fk_country`),
  KEY `idx_resource_fk_state` (`fk_state`),
  CONSTRAINT `fk_resource_fk_country` FOREIGN KEY (`fk_country`) REFERENCES `llx_c_country` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_resource`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_resource` WRITE;
/*!40000 ALTER TABLE `llx_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_resource` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_resource_extrafields`
--

DROP TABLE IF EXISTS `llx_resource_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_resource_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_resource_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_resource_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_resource_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_resource_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_resource_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_rights_def`
--

DROP TABLE IF EXISTS `llx_rights_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_rights_def` (
  `id` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `libelle` varchar(255) DEFAULT NULL,
  `module` varchar(64) DEFAULT NULL,
  `module_origin` varchar(64) DEFAULT NULL,
  `module_position` int(11) NOT NULL DEFAULT 0,
  `family` varchar(64) DEFAULT NULL,
  `family_position` int(11) NOT NULL DEFAULT 0,
  `perms` varchar(50) DEFAULT NULL,
  `subperms` varchar(50) DEFAULT NULL,
  `type` varchar(1) DEFAULT NULL,
  `bydefault` tinyint(4) DEFAULT 0,
  `enabled` text DEFAULT NULL,
  PRIMARY KEY (`id`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_rights_def`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_rights_def` WRITE;
/*!40000 ALTER TABLE `llx_rights_def` DISABLE KEYS */;
INSERT INTO `llx_rights_def` VALUES
(121,1,'Read third parties','societe','',9,'crm',0,'lire','','r',0,'1'),
(122,1,'Create and update third parties','societe','',9,'crm',0,'creer','','w',0,'1'),
(125,1,'Delete third parties','societe','',9,'crm',0,'supprimer','','d',0,'1'),
(126,1,'Export third parties','societe','',9,'crm',0,'export','','r',0,'1'),
(130,1,'Modify thirdparty information payment','societe','',9,'crm',0,'thirdparty_paymentinformation','write','w',0,'1'),
(251,1,'Read information of other users, groups and permissions','user','',5,'hr',0,'user','lire','w',0,'1'),
(252,1,'Read permissions of other users','user','',5,'hr',0,'user_advance','readperms','w',0,'1'),
(253,1,'Create/modify internal and external users, groups and permissions','user','',5,'hr',0,'user','creer','w',0,'1'),
(254,1,'Create/modify external users only','user','',5,'hr',0,'user_advance','write','w',0,'1'),
(255,1,'Modify the password of other users','user','',5,'hr',0,'user','password','w',0,'1'),
(256,1,'Delete or disable other users','user','',5,'hr',0,'user','supprimer','w',0,'1'),
(262,1,'Read all third parties (and their objects) by internal users (otherwise only if commercial contact). Not effective for external users (limited to themselves).','societe','',9,'crm',0,'client','voir','r',0,'1'),
(281,1,'Read contacts','societe','',9,'crm',0,'contact','lire','r',0,'1'),
(282,1,'Create and update contact','societe','',9,'crm',0,'contact','creer','w',0,'1'),
(283,1,'Delete contacts','societe','',9,'crm',0,'contact','supprimer','d',0,'1'),
(286,1,'Export contacts','societe','',9,'crm',0,'contact','export','d',0,'1'),
(341,1,'Read its own permissions','user','',5,'hr',0,'self_advance','readperms','w',0,'1'),
(342,1,'Create/modify of its own user','user','',5,'hr',0,'self','creer','w',0,'1'),
(343,1,'Modify its own password','user','',5,'hr',0,'self','password','w',0,'1'),
(344,1,'Modify its own permissions','user','',5,'hr',0,'self_advance','writeperms','w',0,'1'),
(351,1,'Read groups','user','',5,'hr',0,'group_advance','read','w',0,'1'),
(352,1,'Read permissions of groups','user','',5,'hr',0,'group_advance','readperms','w',0,'1'),
(353,1,'Create/modify groups and permissions','user','',5,'hr',0,'group_advance','write','w',0,'1'),
(354,1,'Delete groups','user','',5,'hr',0,'group_advance','delete','w',0,'1'),
(358,1,'Export all users','user','',5,'hr',0,'user','export','w',0,'1');
/*!40000 ALTER TABLE `llx_rights_def` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_salary`
--

DROP TABLE IF EXISTS `llx_salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_salary` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) DEFAULT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `fk_user` int(11) NOT NULL,
  `datep` date DEFAULT NULL,
  `datev` date DEFAULT NULL,
  `salary` double(24,8) DEFAULT NULL,
  `amount` double(24,8) NOT NULL DEFAULT 0.00000000,
  `fk_projet` int(11) DEFAULT NULL,
  `fk_typepayment` int(11) NOT NULL,
  `num_payment` varchar(50) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `datesp` date DEFAULT NULL,
  `dateep` date DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `note` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `fk_bank` int(11) DEFAULT NULL,
  `paye` smallint(6) NOT NULL DEFAULT 0,
  `fk_account` int(11) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_salary_ref` (`ref`,`entity`),
  KEY `idx_salary_fk_user` (`fk_user`),
  KEY `idx_salary_fk_user_author` (`fk_user_author`),
  KEY `idx_salary_fk_user_modif` (`fk_user_modif`),
  KEY `idx_salary_fk_projet` (`fk_projet`),
  KEY `idx_salary_fk_bank` (`fk_bank`),
  KEY `idx_salary_fk_account` (`fk_account`),
  KEY `idx_salary_fk_typepayment` (`fk_typepayment`),
  KEY `idx_salary_entity` (`entity`),
  CONSTRAINT `fk_salary_fk_account` FOREIGN KEY (`fk_account`) REFERENCES `llx_bank_account` (`rowid`),
  CONSTRAINT `fk_salary_fk_bank` FOREIGN KEY (`fk_bank`) REFERENCES `llx_bank` (`rowid`),
  CONSTRAINT `fk_salary_fk_projet` FOREIGN KEY (`fk_projet`) REFERENCES `llx_projet` (`rowid`),
  CONSTRAINT `fk_salary_fk_typepayment` FOREIGN KEY (`fk_typepayment`) REFERENCES `llx_c_paiement` (`id`),
  CONSTRAINT `fk_salary_fk_user` FOREIGN KEY (`fk_user`) REFERENCES `llx_user` (`rowid`),
  CONSTRAINT `fk_salary_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llx_user` (`rowid`),
  CONSTRAINT `fk_salary_fk_user_modif` FOREIGN KEY (`fk_user_modif`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_salary`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_salary` WRITE;
/*!40000 ALTER TABLE `llx_salary` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_salary` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_salary_extrafields`
--

DROP TABLE IF EXISTS `llx_salary_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_salary_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_salary_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_salary_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_salary_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_salary_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_salary_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_session`
--

DROP TABLE IF EXISTS `llx_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_session` (
  `session_id` varchar(50) NOT NULL,
  `session_variable` text DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `last_accessed` datetime NOT NULL,
  `fk_user` int(11) NOT NULL,
  `remote_ip` varchar(64) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_session`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_session` WRITE;
/*!40000 ALTER TABLE `llx_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_session` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_societe`
--

DROP TABLE IF EXISTS `llx_societe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_societe` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(128) DEFAULT NULL,
  `name_alias` varchar(128) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref_ext` varchar(255) DEFAULT NULL,
  `statut` tinyint(4) DEFAULT 0,
  `parent` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT 1,
  `code_client` varchar(24) DEFAULT NULL,
  `code_fournisseur` varchar(24) DEFAULT NULL,
  `tp_payment_reference` varchar(25) DEFAULT NULL,
  `accountancy_code_customer_general` varchar(32) DEFAULT NULL,
  `code_compta` varchar(32) DEFAULT NULL,
  `accountancy_code_supplier_general` varchar(32) DEFAULT NULL,
  `code_compta_fournisseur` varchar(32) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zip` varchar(25) DEFAULT NULL,
  `town` varchar(50) DEFAULT NULL,
  `fk_departement` int(11) DEFAULT 0,
  `fk_pays` int(11) DEFAULT 0,
  `geolat` double(24,8) DEFAULT NULL,
  `geolong` double(24,8) DEFAULT NULL,
  `geopoint` point DEFAULT NULL,
  `georesultcode` varchar(16) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `phone_mobile` varchar(30) DEFAULT NULL,
  `fax` varchar(30) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `fk_account` int(11) DEFAULT 0,
  `socialnetworks` text DEFAULT NULL,
  `fk_effectif` int(11) DEFAULT 0,
  `fk_typent` int(11) DEFAULT NULL,
  `fk_forme_juridique` int(11) DEFAULT 0,
  `birth` date DEFAULT NULL,
  `fk_currency` varchar(3) DEFAULT NULL,
  `siren` varchar(128) DEFAULT NULL,
  `siret` varchar(128) DEFAULT NULL,
  `ape` varchar(128) DEFAULT NULL,
  `idprof4` varchar(128) DEFAULT NULL,
  `idprof5` varchar(128) DEFAULT NULL,
  `idprof6` varchar(128) DEFAULT NULL,
  `euid` varchar(64) DEFAULT NULL,
  `tva_intra` varchar(20) DEFAULT NULL,
  `capital` double(24,8) DEFAULT NULL,
  `fk_stcomm` int(11) NOT NULL DEFAULT 0,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `prefix_comm` varchar(5) DEFAULT NULL,
  `client` tinyint(4) DEFAULT 0,
  `fournisseur` tinyint(4) DEFAULT 0,
  `supplier_account` varchar(32) DEFAULT NULL,
  `fk_prospectlevel` varchar(12) DEFAULT NULL,
  `fk_incoterms` int(11) DEFAULT NULL,
  `location_incoterms` varchar(255) DEFAULT NULL,
  `customer_bad` tinyint(4) DEFAULT 0,
  `customer_rate` double DEFAULT 0,
  `supplier_rate` double DEFAULT 0,
  `remise_client` double DEFAULT 0,
  `remise_supplier` double DEFAULT 0,
  `mode_reglement` int(11) DEFAULT NULL,
  `cond_reglement` tinyint(4) DEFAULT NULL,
  `deposit_percent` varchar(63) DEFAULT NULL,
  `transport_mode` tinyint(4) DEFAULT NULL,
  `mode_reglement_supplier` tinyint(4) DEFAULT NULL,
  `cond_reglement_supplier` tinyint(4) DEFAULT NULL,
  `transport_mode_supplier` tinyint(4) DEFAULT NULL,
  `fk_shipping_method` int(11) DEFAULT NULL,
  `tva_assuj` tinyint(4) DEFAULT 1,
  `vatexemptcode` varchar(24) DEFAULT NULL,
  `vat_reverse_charge` tinyint(4) DEFAULT 0,
  `localtax1_assuj` tinyint(4) DEFAULT 0,
  `localtax1_value` double(7,4) DEFAULT NULL,
  `localtax2_assuj` tinyint(4) DEFAULT 0,
  `localtax2_value` double(7,4) DEFAULT NULL,
  `barcode` varchar(180) DEFAULT NULL,
  `fk_barcode_type` int(11) DEFAULT 0,
  `price_level` int(11) DEFAULT NULL,
  `outstanding_limit` double(24,8) DEFAULT NULL,
  `order_min_amount` double(24,8) DEFAULT NULL,
  `supplier_order_min_amount` double(24,8) DEFAULT NULL,
  `default_lang` varchar(6) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `logo_squarred` varchar(255) DEFAULT NULL,
  `canvas` varchar(32) DEFAULT NULL,
  `fk_warehouse` int(11) DEFAULT NULL,
  `webservices_url` varchar(255) DEFAULT NULL,
  `webservices_key` varchar(128) DEFAULT NULL,
  `accountancy_code_sell` varchar(32) DEFAULT NULL,
  `accountancy_code_buy` varchar(32) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `ip` varchar(250) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_societe_prefix_comm` (`prefix_comm`,`entity`),
  UNIQUE KEY `uk_societe_code_client` (`code_client`,`entity`),
  UNIQUE KEY `uk_societe_code_fournisseur` (`code_fournisseur`,`entity`),
  UNIQUE KEY `uk_societe_barcode` (`barcode`,`fk_barcode_type`,`entity`),
  KEY `idx_societe_nom` (`nom`),
  KEY `idx_societe_user_creat` (`fk_user_creat`),
  KEY `idx_societe_user_modif` (`fk_user_modif`),
  KEY `idx_societe_stcomm` (`fk_stcomm`),
  KEY `idx_societe_pays` (`fk_pays`),
  KEY `idx_societe_account` (`fk_account`),
  KEY `idx_societe_prospectlevel` (`fk_prospectlevel`),
  KEY `idx_societe_typent` (`fk_typent`),
  KEY `idx_societe_forme_juridique` (`fk_forme_juridique`),
  KEY `idx_societe_shipping_method` (`fk_shipping_method`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_societe`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_societe` WRITE;
/*!40000 ALTER TABLE `llx_societe` DISABLE KEYS */;
INSERT INTO `llx_societe` VALUES
(1,'Client test','',1,NULL,0,NULL,1,'CU2609-00001',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[]',NULL,0,NULL,NULL,NULL,'','','','','','','','',NULL,0,NULL,NULL,'',NULL,NULL,1,0,NULL,'',0,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,0,0,0.0000,0,0.0000,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','2026-09-24 11:15:27','2026-09-24 11:15:27',1,1,0,'',NULL,NULL),
(9,'TechCorp',NULL,1,NULL,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'10 Rue de la Paix','75000','Paris',0,0,NULL,NULL,NULL,NULL,'0102030405',NULL,NULL,NULL,'contact@techcorp.fr',0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,0,0,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-09-24 11:52:54',NULL,NULL,NULL,NULL,NULL,NULL),
(10,'GlobalMarket',NULL,1,NULL,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'45 Avenue Jean Jaures','69000','Lyon',0,0,NULL,NULL,NULL,NULL,'0405060708',NULL,NULL,NULL,'hello@globalmarket.com',0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,1,0,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,0,0,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-09-24 11:52:55',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `llx_societe` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_societe_account`
--

DROP TABLE IF EXISTS `llx_societe_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_societe_account` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) DEFAULT 1,
  `login` varchar(128) NOT NULL,
  `pass_encoding` varchar(24) DEFAULT NULL,
  `pass_crypted` varchar(128) DEFAULT NULL,
  `pass_temp` varchar(128) DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_website` int(11) DEFAULT NULL,
  `site` varchar(128) NOT NULL,
  `site_account` varchar(128) DEFAULT NULL,
  `key_account` varchar(128) DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `date_last_login` datetime DEFAULT NULL,
  `date_previous_login` datetime DEFAULT NULL,
  `date_last_reset_password` datetime DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `ip` varchar(250) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_societe_account_login_website` (`entity`,`login`,`site`,`fk_website`),
  UNIQUE KEY `uk_societe_account_key_account_soc` (`entity`,`fk_soc`,`key_account`,`site`,`fk_website`),
  KEY `idx_societe_account_rowid` (`rowid`),
  KEY `idx_societe_account_login` (`login`),
  KEY `idx_societe_account_status` (`status`),
  KEY `idx_societe_account_fk_website` (`fk_website`),
  KEY `idx_societe_account_fk_soc` (`fk_soc`),
  CONSTRAINT `llx_societe_account_fk_societe` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_societe_account`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_societe_account` WRITE;
/*!40000 ALTER TABLE `llx_societe_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_societe_account` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_societe_commerciaux`
--

DROP TABLE IF EXISTS `llx_societe_commerciaux`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_societe_commerciaux` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `fk_c_type_contact_code` varchar(32) NOT NULL DEFAULT 'SALESREPTHIRD',
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_societe_commerciaux_c_type_contact` (`fk_soc`,`fk_user`,`fk_c_type_contact_code`),
  KEY `fk_societe_commerciaux_fk_user` (`fk_user`),
  CONSTRAINT `fk_societe_commerciaux_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `fk_societe_commerciaux_fk_user` FOREIGN KEY (`fk_user`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_societe_commerciaux`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_societe_commerciaux` WRITE;
/*!40000 ALTER TABLE `llx_societe_commerciaux` DISABLE KEYS */;
INSERT INTO `llx_societe_commerciaux` VALUES
(1,1,1,'SALESREPTHIRD',NULL);
/*!40000 ALTER TABLE `llx_societe_commerciaux` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_societe_contacts`
--

DROP TABLE IF EXISTS `llx_societe_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_societe_contacts` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `date_creation` datetime NOT NULL,
  `fk_soc` int(11) NOT NULL,
  `fk_c_type_contact` int(11) NOT NULL,
  `fk_socpeople` int(11) NOT NULL,
  `tms` timestamp NULL DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_societe_contacts_idx1` (`entity`,`fk_soc`,`fk_c_type_contact`,`fk_socpeople`),
  KEY `fk_societe_contacts_fk_c_type_contact` (`fk_c_type_contact`),
  KEY `fk_societe_contacts_fk_soc` (`fk_soc`),
  KEY `fk_societe_contacts_fk_socpeople` (`fk_socpeople`),
  CONSTRAINT `fk_societe_contacts_fk_c_type_contact` FOREIGN KEY (`fk_c_type_contact`) REFERENCES `llx_c_type_contact` (`rowid`),
  CONSTRAINT `fk_societe_contacts_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `fk_societe_contacts_fk_socpeople` FOREIGN KEY (`fk_socpeople`) REFERENCES `llx_socpeople` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_societe_contacts`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_societe_contacts` WRITE;
/*!40000 ALTER TABLE `llx_societe_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_societe_contacts` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_societe_extrafields`
--

DROP TABLE IF EXISTS `llx_societe_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_societe_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_societe_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_societe_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_societe_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_societe_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_societe_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_societe_perentity`
--

DROP TABLE IF EXISTS `llx_societe_perentity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_societe_perentity` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_soc` int(11) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `accountancy_code_customer_general` varchar(32) DEFAULT NULL,
  `accountancy_code_customer` varchar(32) DEFAULT NULL,
  `accountancy_code_supplier_general` varchar(32) DEFAULT NULL,
  `accountancy_code_supplier` varchar(32) DEFAULT NULL,
  `accountancy_code_sell` varchar(32) DEFAULT NULL,
  `accountancy_code_buy` varchar(32) DEFAULT NULL,
  `vat_reverse_charge` tinyint(4) DEFAULT 0,
  `fk_account` int(11) DEFAULT NULL,
  `mode_reglement` int(11) DEFAULT NULL,
  `cond_reglement` tinyint(4) DEFAULT NULL,
  `mode_reglement_supplier` tinyint(4) DEFAULT NULL,
  `cond_reglement_supplier` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_societe_perentity` (`fk_soc`,`entity`),
  KEY `idx_societe_perentity_fk_soc` (`fk_soc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_societe_perentity`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_societe_perentity` WRITE;
/*!40000 ALTER TABLE `llx_societe_perentity` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_societe_perentity` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_societe_prices`
--

DROP TABLE IF EXISTS `llx_societe_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_societe_prices` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_soc` int(11) DEFAULT 0,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `price_level` tinyint(4) DEFAULT 1,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_societe_prices`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_societe_prices` WRITE;
/*!40000 ALTER TABLE `llx_societe_prices` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_societe_prices` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_societe_remise`
--

DROP TABLE IF EXISTS `llx_societe_remise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_societe_remise` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_soc` int(11) NOT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `remise_client` double(7,4) NOT NULL DEFAULT 0.0000,
  `note` text DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_societe_remise`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_societe_remise` WRITE;
/*!40000 ALTER TABLE `llx_societe_remise` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_societe_remise` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_societe_remise_except`
--

DROP TABLE IF EXISTS `llx_societe_remise_except`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_societe_remise_except` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_soc` int(11) NOT NULL,
  `discount_type` int(11) NOT NULL DEFAULT 0,
  `datec` datetime DEFAULT NULL,
  `amount_ht` double(24,8) NOT NULL,
  `amount_tva` double(24,8) NOT NULL DEFAULT 0.00000000,
  `amount_localtax1` double(24,8) NOT NULL DEFAULT 0.00000000,
  `amount_localtax2` double(24,8) NOT NULL DEFAULT 0.00000000,
  `amount_ttc` double(24,8) NOT NULL DEFAULT 0.00000000,
  `tva_tx` double(7,4) NOT NULL DEFAULT 0.0000,
  `localtax1_tx` double(7,4) NOT NULL DEFAULT 0.0000,
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(7,4) NOT NULL DEFAULT 0.0000,
  `localtax2_type` varchar(10) DEFAULT NULL,
  `vat_src_code` varchar(10) DEFAULT '',
  `fk_user` int(11) NOT NULL,
  `fk_facture_line` int(11) DEFAULT NULL,
  `fk_facture` int(11) DEFAULT NULL,
  `fk_facture_source` int(11) DEFAULT NULL,
  `fk_invoice_supplier_line` int(11) DEFAULT NULL,
  `fk_invoice_supplier` int(11) DEFAULT NULL,
  `fk_invoice_supplier_source` int(11) DEFAULT NULL,
  `description` text NOT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT NULL,
  `multicurrency_amount_ht` double(24,8) NOT NULL DEFAULT 0.00000000,
  `multicurrency_amount_tva` double(24,8) NOT NULL DEFAULT 0.00000000,
  `multicurrency_amount_ttc` double(24,8) NOT NULL DEFAULT 0.00000000,
  PRIMARY KEY (`rowid`),
  KEY `idx_societe_remise_except_fk_user` (`fk_user`),
  KEY `idx_societe_remise_except_fk_soc` (`fk_soc`),
  KEY `idx_societe_remise_except_fk_facture_line` (`fk_facture_line`),
  KEY `idx_societe_remise_except_fk_facture` (`fk_facture`),
  KEY `idx_societe_remise_except_fk_facture_source` (`fk_facture_source`),
  KEY `idx_societe_remise_except_discount_type` (`discount_type`),
  KEY `fk_soc_remise_fk_invoice_supplier_line` (`fk_invoice_supplier_line`),
  KEY `fk_societe_remise_fk_invoice_supplier_source` (`fk_invoice_supplier`),
  CONSTRAINT `fk_soc_remise_fk_facture_line` FOREIGN KEY (`fk_facture_line`) REFERENCES `llx_facturedet` (`rowid`),
  CONSTRAINT `fk_soc_remise_fk_invoice_supplier_line` FOREIGN KEY (`fk_invoice_supplier_line`) REFERENCES `llx_facture_fourn_det` (`rowid`),
  CONSTRAINT `fk_soc_remise_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `fk_societe_remise_fk_facture` FOREIGN KEY (`fk_facture`) REFERENCES `llx_facture` (`rowid`),
  CONSTRAINT `fk_societe_remise_fk_facture_source` FOREIGN KEY (`fk_facture_source`) REFERENCES `llx_facture` (`rowid`),
  CONSTRAINT `fk_societe_remise_fk_invoice_supplier` FOREIGN KEY (`fk_invoice_supplier`) REFERENCES `llx_facture_fourn` (`rowid`),
  CONSTRAINT `fk_societe_remise_fk_invoice_supplier_source` FOREIGN KEY (`fk_invoice_supplier`) REFERENCES `llx_facture_fourn` (`rowid`),
  CONSTRAINT `fk_societe_remise_fk_user` FOREIGN KEY (`fk_user`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_societe_remise_except`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_societe_remise_except` WRITE;
/*!40000 ALTER TABLE `llx_societe_remise_except` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_societe_remise_except` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_societe_remise_supplier`
--

DROP TABLE IF EXISTS `llx_societe_remise_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_societe_remise_supplier` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_soc` int(11) NOT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `remise_supplier` double(7,4) NOT NULL DEFAULT 0.0000,
  `note` text DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_societe_remise_supplier`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_societe_remise_supplier` WRITE;
/*!40000 ALTER TABLE `llx_societe_remise_supplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_societe_remise_supplier` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_societe_rib`
--

DROP TABLE IF EXISTS `llx_societe_rib`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_societe_rib` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `type` varchar(32) NOT NULL DEFAULT 'ban',
  `label` varchar(180) DEFAULT NULL,
  `fk_soc` int(11) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `bank` varchar(255) DEFAULT NULL,
  `code_banque` varchar(128) DEFAULT NULL,
  `code_guichet` varchar(6) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `cle_rib` varchar(5) DEFAULT NULL,
  `bic` varchar(20) DEFAULT NULL,
  `bic_intermediate` varchar(11) DEFAULT NULL,
  `iban_prefix` varchar(100) DEFAULT NULL,
  `cci` varchar(100) DEFAULT NULL,
  `domiciliation` varchar(255) DEFAULT NULL,
  `proprio` varchar(60) DEFAULT NULL,
  `owner_address` varchar(255) DEFAULT NULL,
  `default_rib` smallint(6) NOT NULL DEFAULT 0,
  `state_id` int(11) DEFAULT NULL,
  `fk_country` int(11) DEFAULT NULL,
  `currency_code` varchar(3) DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `rum` varchar(32) DEFAULT NULL,
  `date_rum` date DEFAULT NULL,
  `frstrecur` varchar(16) DEFAULT 'FRST',
  `last_four` varchar(4) DEFAULT NULL,
  `card_type` varchar(255) DEFAULT NULL,
  `cvn` varchar(255) DEFAULT NULL,
  `exp_date_month` int(11) DEFAULT NULL,
  `exp_date_year` int(11) DEFAULT NULL,
  `country_code` varchar(10) DEFAULT NULL,
  `approved` int(11) DEFAULT 0,
  `email` varchar(255) DEFAULT NULL,
  `ending_date` date DEFAULT NULL,
  `max_total_amount_of_all_payments` double(24,8) DEFAULT NULL,
  `preapproval_key` varchar(255) DEFAULT NULL,
  `starting_date` date DEFAULT NULL,
  `total_amount_of_all_payments` double(24,8) DEFAULT NULL,
  `stripe_card_ref` varchar(128) DEFAULT NULL,
  `stripe_account` varchar(128) DEFAULT NULL,
  `ext_payment_site` varchar(128) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `date_signature` datetime DEFAULT NULL,
  `online_sign_ip` varchar(48) DEFAULT NULL,
  `online_sign_name` varchar(64) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `ipaddress` varchar(68) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_societe_rib` (`entity`,`label`,`fk_soc`),
  KEY `llx_societe_rib_fk_societe` (`fk_soc`),
  CONSTRAINT `llx_societe_rib_fk_societe` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_societe_rib`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_societe_rib` WRITE;
/*!40000 ALTER TABLE `llx_societe_rib` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_societe_rib` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_socpeople`
--

DROP TABLE IF EXISTS `llx_socpeople`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_socpeople` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_soc` int(11) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref_ext` varchar(255) DEFAULT NULL,
  `name_alias` varchar(255) DEFAULT NULL,
  `fk_parent` int(11) DEFAULT NULL,
  `civility` varchar(6) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zip` varchar(25) DEFAULT NULL,
  `town` varchar(255) DEFAULT NULL,
  `fk_departement` int(11) DEFAULT NULL,
  `fk_pays` int(11) DEFAULT 0,
  `geolat` double(24,8) DEFAULT NULL,
  `geolong` double(24,8) DEFAULT NULL,
  `geopoint` point DEFAULT NULL,
  `georesultcode` varchar(16) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `poste` varchar(255) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `phone_perso` varchar(30) DEFAULT NULL,
  `phone_mobile` varchar(30) DEFAULT NULL,
  `fax` varchar(30) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `socialnetworks` text DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `no_email` smallint(6) NOT NULL DEFAULT 0,
  `priv` smallint(6) NOT NULL DEFAULT 0,
  `fk_prospectlevel` varchar(12) DEFAULT NULL,
  `fk_stcommcontact` int(11) NOT NULL DEFAULT 0,
  `fk_user_creat` int(11) DEFAULT 0,
  `fk_user_modif` int(11) DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `default_lang` varchar(6) DEFAULT NULL,
  `canvas` varchar(32) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `statut` tinyint(4) NOT NULL DEFAULT 1,
  `ip` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_socpeople_fk_soc` (`fk_soc`),
  KEY `idx_socpeople_fk_user_creat` (`fk_user_creat`),
  KEY `idx_socpeople_lastname` (`lastname`),
  CONSTRAINT `fk_socpeople_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `fk_socpeople_user_creat_user_rowid` FOREIGN KEY (`fk_user_creat`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_socpeople`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_socpeople` WRITE;
/*!40000 ALTER TABLE `llx_socpeople` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_socpeople` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_socpeople_extrafields`
--

DROP TABLE IF EXISTS `llx_socpeople_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_socpeople_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_socpeople_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_socpeople_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_socpeople_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_socpeople_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_socpeople_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_stock_mouvement`
--

DROP TABLE IF EXISTS `llx_stock_mouvement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_stock_mouvement` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datem` datetime DEFAULT NULL,
  `fk_product` int(11) NOT NULL,
  `batch` varchar(128) DEFAULT NULL,
  `eatby` date DEFAULT NULL,
  `sellby` date DEFAULT NULL,
  `fk_entrepot` int(11) NOT NULL,
  `value` double DEFAULT NULL,
  `price` double(24,8) DEFAULT 0.00000000,
  `type_mouvement` smallint(6) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `inventorycode` varchar(128) DEFAULT NULL,
  `fk_project` int(11) DEFAULT NULL,
  `fk_origin` int(11) DEFAULT NULL,
  `origintype` varchar(64) DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `fk_projet` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`rowid`),
  KEY `idx_stock_mouvement_fk_product` (`fk_product`),
  KEY `idx_stock_mouvement_fk_entrepot` (`fk_entrepot`),
  KEY `idx_stock_mouvement_batch_entrepot_type_datem` (`batch`,`fk_entrepot`,`type_mouvement`,`datem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_stock_mouvement`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_stock_mouvement` WRITE;
/*!40000 ALTER TABLE `llx_stock_mouvement` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_stock_mouvement` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_stock_mouvement_extrafields`
--

DROP TABLE IF EXISTS `llx_stock_mouvement_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_stock_mouvement_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_stock_mouvement_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_stock_mouvement_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_stock_mouvement_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_stock_mouvement_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_stock_mouvement_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_stocktransfer_stocktransfer`
--

DROP TABLE IF EXISTS `llx_stocktransfer_stocktransfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_stocktransfer_stocktransfer` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref` varchar(128) NOT NULL DEFAULT '(PROV)',
  `label` varchar(255) DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_project` int(11) DEFAULT NULL,
  `fk_warehouse_source` int(11) DEFAULT NULL,
  `fk_warehouse_destination` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date_creation` datetime NOT NULL,
  `date_prevue_depart` date DEFAULT NULL,
  `date_reelle_depart` date DEFAULT NULL,
  `date_prevue_arrivee` date DEFAULT NULL,
  `date_reelle_arrivee` date DEFAULT NULL,
  `lead_time_for_warning` int(11) DEFAULT NULL,
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `fk_incoterms` int(11) DEFAULT NULL,
  `location_incoterms` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_stocktransfer_stocktransfer_rowid` (`rowid`),
  KEY `idx_stocktransfer_stocktransfer_ref` (`ref`),
  KEY `idx_stocktransfer_stocktransfer_fk_soc` (`fk_soc`),
  KEY `idx_stocktransfer_stocktransfer_fk_project` (`fk_project`),
  KEY `llx_stocktransfer_stocktransfer_fk_user_creat` (`fk_user_creat`),
  KEY `idx_stocktransfer_stocktransfer_status` (`status`),
  CONSTRAINT `llx_stocktransfer_stocktransfer_fk_user_creat` FOREIGN KEY (`fk_user_creat`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_stocktransfer_stocktransfer`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_stocktransfer_stocktransfer` WRITE;
/*!40000 ALTER TABLE `llx_stocktransfer_stocktransfer` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_stocktransfer_stocktransfer` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_stocktransfer_stocktransfer_extrafields`
--

DROP TABLE IF EXISTS `llx_stocktransfer_stocktransfer_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_stocktransfer_stocktransfer_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_fk_object` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_stocktransfer_stocktransfer_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_stocktransfer_stocktransfer_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_stocktransfer_stocktransfer_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_stocktransfer_stocktransfer_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_stocktransfer_stocktransferline`
--

DROP TABLE IF EXISTS `llx_stocktransfer_stocktransferline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_stocktransfer_stocktransferline` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `amount` double DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `fk_warehouse_source` int(11) NOT NULL,
  `fk_warehouse_destination` int(11) NOT NULL,
  `fk_stocktransfer` int(11) NOT NULL,
  `fk_product` int(11) NOT NULL,
  `batch` varchar(128) DEFAULT NULL,
  `pmp` double DEFAULT NULL,
  `rang` int(11) DEFAULT 0,
  `fk_parent_line` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_stocktransfer_stocktransferline_rowid` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_stocktransfer_stocktransferline`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_stocktransfer_stocktransferline` WRITE;
/*!40000 ALTER TABLE `llx_stocktransfer_stocktransferline` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_stocktransfer_stocktransferline` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_stocktransfer_stocktransferline_extrafields`
--

DROP TABLE IF EXISTS `llx_stocktransfer_stocktransferline_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_stocktransfer_stocktransferline_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_fk_object` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_stocktransfer_stocktransferline_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_stocktransfer_stocktransferline_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_stocktransfer_stocktransferline_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_stocktransfer_stocktransferline_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_subscription`
--

DROP TABLE IF EXISTS `llx_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_subscription` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `fk_adherent` int(11) DEFAULT NULL,
  `fk_type` int(11) DEFAULT NULL,
  `dateadh` datetime DEFAULT NULL,
  `datef` datetime DEFAULT NULL,
  `subscription` double(24,8) DEFAULT NULL,
  `fk_bank` int(11) DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `ref_ext` varchar(128) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_subscription` (`fk_adherent`,`dateadh`),
  KEY `idx_subscription_fk_adherent` (`fk_adherent`),
  KEY `idx_subscription_fk_bank` (`fk_bank`),
  KEY `idx_subscription_dateadh` (`dateadh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_subscription`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_subscription` WRITE;
/*!40000 ALTER TABLE `llx_subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_subscription` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_supplier_proposal`
--

DROP TABLE IF EXISTS `llx_supplier_proposal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_supplier_proposal` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref_ext` varchar(255) DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `date_cloture` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_user_cloture` int(11) DEFAULT NULL,
  `fk_statut` smallint(6) NOT NULL DEFAULT 0,
  `price` double DEFAULT 0,
  `remise_percent` double DEFAULT 0,
  `remise_absolue` double DEFAULT 0,
  `remise` double DEFAULT 0,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `localtax1` double(24,8) DEFAULT 0.00000000,
  `localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `fk_account` int(11) DEFAULT NULL,
  `fk_currency` varchar(3) DEFAULT NULL,
  `fk_cond_reglement` int(11) DEFAULT NULL,
  `deposit_percent` varchar(63) DEFAULT NULL,
  `fk_mode_reglement` int(11) DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `date_livraison` date DEFAULT NULL,
  `fk_shipping_method` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_supplier_proposal_ref` (`ref`,`entity`),
  KEY `idx_supplier_proposal_fk_soc` (`fk_soc`),
  KEY `idx_supplier_proposal_fk_user_author` (`fk_user_author`),
  KEY `idx_supplier_proposal_fk_user_valid` (`fk_user_valid`),
  KEY `idx_supplier_proposal_fk_projet` (`fk_projet`),
  KEY `idx_supplier_proposal_fk_account` (`fk_account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_supplier_proposal`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_supplier_proposal` WRITE;
/*!40000 ALTER TABLE `llx_supplier_proposal` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_supplier_proposal` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_supplier_proposal_extrafields`
--

DROP TABLE IF EXISTS `llx_supplier_proposal_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_supplier_proposal_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_supplier_proposal_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_supplier_proposal_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_supplier_proposal_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_supplier_proposal_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_supplier_proposal_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_supplier_proposaldet`
--

DROP TABLE IF EXISTS `llx_supplier_proposaldet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_supplier_proposaldet` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_supplier_proposal` int(11) NOT NULL,
  `fk_parent_line` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `fk_remise_except` int(11) DEFAULT NULL,
  `vat_src_code` varchar(10) DEFAULT '',
  `tva_tx` double(7,4) DEFAULT 0.0000,
  `localtax1_tx` double(7,4) DEFAULT 0.0000,
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(7,4) DEFAULT 0.0000,
  `localtax2_type` varchar(10) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT 0,
  `remise` double DEFAULT 0,
  `price` double DEFAULT NULL,
  `subprice` double(24,8) DEFAULT 0.00000000,
  `subprice_ttc` double(24,8) DEFAULT 0.00000000,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `total_localtax1` double(24,8) DEFAULT 0.00000000,
  `total_localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `product_type` int(11) DEFAULT 0,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `info_bits` int(11) DEFAULT 0,
  `buy_price_ht` double(24,8) DEFAULT 0.00000000,
  `fk_product_fournisseur_price` int(11) DEFAULT NULL,
  `special_code` int(11) DEFAULT 0,
  `rang` int(11) DEFAULT 0,
  `ref_fourn` varchar(128) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT 0.00000000,
  `multicurrency_subprice_ttc` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000,
  `fk_unit` int(11) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_supplier_proposaldet_fk_supplier_proposal` (`fk_supplier_proposal`),
  KEY `idx_supplier_proposaldet_fk_product` (`fk_product`),
  KEY `fk_supplier_proposaldet_fk_unit` (`fk_unit`),
  CONSTRAINT `fk_supplier_proposaldet_fk_supplier_proposal` FOREIGN KEY (`fk_supplier_proposal`) REFERENCES `llx_supplier_proposal` (`rowid`),
  CONSTRAINT `fk_supplier_proposaldet_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `llx_c_units` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_supplier_proposaldet`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_supplier_proposaldet` WRITE;
/*!40000 ALTER TABLE `llx_supplier_proposaldet` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_supplier_proposaldet` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_supplier_proposaldet_extrafields`
--

DROP TABLE IF EXISTS `llx_supplier_proposaldet_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_supplier_proposaldet_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_supplier_proposaldet_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_supplier_proposaldet_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_supplier_proposaldet_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_supplier_proposaldet_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_supplier_proposaldet_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_takepos_floor_tables`
--

DROP TABLE IF EXISTS `llx_takepos_floor_tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_takepos_floor_tables` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `label` varchar(255) DEFAULT NULL,
  `leftpos` float DEFAULT NULL,
  `toppos` float DEFAULT NULL,
  `floor` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_takepos_floor_tables` (`entity`,`label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_takepos_floor_tables`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_takepos_floor_tables` WRITE;
/*!40000 ALTER TABLE `llx_takepos_floor_tables` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_takepos_floor_tables` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_ticket`
--

DROP TABLE IF EXISTS `llx_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_ticket` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) DEFAULT 1,
  `ref` varchar(128) NOT NULL,
  `track_id` varchar(128) NOT NULL,
  `fk_soc` int(11) DEFAULT 0,
  `fk_project` int(11) DEFAULT 0,
  `fk_contract` int(11) DEFAULT 0,
  `origin_email` varchar(128) DEFAULT NULL,
  `origin_replyto` varchar(128) DEFAULT NULL,
  `origin_references` text DEFAULT NULL,
  `fk_user_create` int(11) DEFAULT NULL,
  `fk_user_assign` int(11) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` mediumtext DEFAULT NULL,
  `fk_statut` int(11) DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `resolution` int(11) DEFAULT NULL,
  `progress` int(11) DEFAULT 0,
  `timing` varchar(20) DEFAULT NULL,
  `type_code` varchar(32) DEFAULT NULL,
  `category_code` varchar(32) DEFAULT NULL,
  `severity_code` varchar(32) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `date_read` datetime DEFAULT NULL,
  `date_last_msg_sent` datetime DEFAULT NULL,
  `date_close` datetime DEFAULT NULL,
  `notify_tiers_at_create` tinyint(4) DEFAULT NULL,
  `email_msgid` varchar(255) DEFAULT NULL,
  `email_date` datetime DEFAULT NULL,
  `ip` varchar(250) DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `fk_barcode_type` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_ticket_track_id` (`track_id`),
  UNIQUE KEY `uk_ticket_ref` (`ref`,`entity`),
  UNIQUE KEY `uk_ticket_barcode_barcode_type` (`barcode`,`fk_barcode_type`,`entity`),
  KEY `idx_ticket_entity` (`entity`),
  KEY `idx_ticket_fk_soc` (`fk_soc`),
  KEY `idx_ticket_fk_user_assign` (`fk_user_assign`),
  KEY `idx_ticket_fk_project` (`fk_project`),
  KEY `idx_ticket_fk_statut` (`fk_statut`),
  KEY `llx_ticket_fk_product_barcode_type` (`fk_barcode_type`),
  CONSTRAINT `llx_ticket_fk_product_barcode_type` FOREIGN KEY (`fk_barcode_type`) REFERENCES `llx_c_barcode_type` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_ticket`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_ticket` WRITE;
/*!40000 ALTER TABLE `llx_ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_ticket` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_ticket_extrafields`
--

DROP TABLE IF EXISTS `llx_ticket_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_ticket_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_ticket_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_ticket_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_ticket_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_ticket_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_ticket_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_tva`
--

DROP TABLE IF EXISTS `llx_tva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_tva` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `datep` date DEFAULT NULL,
  `datev` date DEFAULT NULL,
  `amount` double(24,8) NOT NULL DEFAULT 0.00000000,
  `fk_typepayment` int(11) DEFAULT NULL,
  `num_payment` varchar(50) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `note` text DEFAULT NULL,
  `paye` smallint(6) NOT NULL DEFAULT 0,
  `fk_account` int(11) DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_tva`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_tva` WRITE;
/*!40000 ALTER TABLE `llx_tva` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_tva` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_user`
--

DROP TABLE IF EXISTS `llx_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_user` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref_employee` varchar(50) DEFAULT NULL,
  `ref_ext` varchar(50) DEFAULT NULL,
  `admin` smallint(6) DEFAULT 0,
  `employee` tinyint(4) DEFAULT 1,
  `fk_establishment` int(11) DEFAULT 0,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `login` varchar(50) NOT NULL,
  `pass_encoding` varchar(24) DEFAULT NULL,
  `pass` varchar(128) DEFAULT NULL,
  `pass_crypted` varchar(128) DEFAULT NULL,
  `pass_temp` varchar(128) DEFAULT NULL,
  `force_pass_change` tinyint(4) DEFAULT 0,
  `api_key` varchar(128) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `civility` varchar(6) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zip` varchar(25) DEFAULT NULL,
  `town` varchar(50) DEFAULT NULL,
  `fk_state` int(11) DEFAULT 0,
  `fk_country` int(11) DEFAULT 0,
  `birth` date DEFAULT NULL,
  `birth_place` varchar(64) DEFAULT NULL,
  `job` varchar(128) DEFAULT NULL,
  `office_phone` varchar(30) DEFAULT NULL,
  `office_fax` varchar(30) DEFAULT NULL,
  `user_mobile` varchar(30) DEFAULT NULL,
  `personal_mobile` varchar(30) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `personal_email` varchar(255) DEFAULT NULL,
  `email_oauth2` varchar(255) DEFAULT NULL,
  `signature` longtext DEFAULT NULL,
  `socialnetworks` text DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_socpeople` int(11) DEFAULT NULL,
  `fk_member` int(11) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `fk_user_expense_validator` int(11) DEFAULT NULL,
  `fk_user_holiday_validator` int(11) DEFAULT NULL,
  `national_registration_number` varchar(50) DEFAULT NULL,
  `idpers1` varchar(128) DEFAULT NULL,
  `idpers2` varchar(128) DEFAULT NULL,
  `idpers3` varchar(128) DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `datelastlogin` datetime DEFAULT NULL,
  `datepreviouslogin` datetime DEFAULT NULL,
  `datelastpassvalidation` datetime DEFAULT NULL,
  `datestartvalidity` datetime DEFAULT NULL,
  `dateendvalidity` datetime DEFAULT NULL,
  `flagdelsessionsbefore` datetime DEFAULT NULL,
  `iplastlogin` varchar(250) DEFAULT NULL,
  `ippreviouslogin` varchar(250) DEFAULT NULL,
  `ldap_sid` varchar(255) DEFAULT NULL,
  `openid` varchar(255) DEFAULT NULL,
  `statut` tinyint(4) DEFAULT 1,
  `photo` varchar(255) DEFAULT NULL,
  `lang` varchar(6) DEFAULT NULL,
  `color` varchar(6) DEFAULT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `fk_barcode_type` int(11) DEFAULT 0,
  `accountancy_code_user_general` varchar(32) DEFAULT NULL,
  `accountancy_code` varchar(32) DEFAULT NULL,
  `nb_holiday` int(11) DEFAULT 0,
  `thm` double(24,8) DEFAULT NULL,
  `tjm` double(24,8) DEFAULT NULL,
  `access_hours` varchar(128) DEFAULT NULL,
  `salary` double(24,8) DEFAULT NULL,
  `salaryextra` double(24,8) DEFAULT NULL,
  `dateemployment` date DEFAULT NULL,
  `dateemploymentend` date DEFAULT NULL,
  `weeklyhours` double(16,8) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `default_range` int(11) DEFAULT NULL,
  `default_c_exp_tax_cat` int(11) DEFAULT NULL,
  `fk_warehouse` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_user_login` (`login`,`entity`),
  UNIQUE KEY `uk_user_fk_socpeople` (`fk_socpeople`),
  UNIQUE KEY `uk_user_fk_member` (`fk_member`),
  UNIQUE KEY `uk_user_api_key` (`api_key`),
  KEY `idx_user_fk_societe` (`fk_soc`),
  KEY `idx_user_status_employee` (`statut`,`employee`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_user`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_user` WRITE;
/*!40000 ALTER TABLE `llx_user` DISABLE KEYS */;
INSERT INTO `llx_user` VALUES
(1,0,NULL,NULL,1,1,0,NULL,'2026-09-23 07:34:05',NULL,NULL,'admin',NULL,NULL,'21232f297a57a5a743894a0e4a801fc3',NULL,0,NULL,NULL,NULL,'SuperAdmin',NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-09-24 11:09:58','2026-09-23 07:37:26',NULL,NULL,NULL,NULL,'172.18.0.1','172.18.0.1',NULL,NULL,1,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(3,1,'',NULL,0,1,NULL,'2026-09-23 07:50:03','2026-09-23 07:50:03',1,1,'user',NULL,'user123456789','7eee07c4c334306b51c4f12691432d89',NULL,0,'dolcrypt:AES-256-CTR:10fbb3f05469219f:saRyV+LaBm9f7TKz',NULL,'','user','','','','',NULL,NULL,NULL,NULL,'','','','','','','',NULL,'','null',NULL,NULL,NULL,1,NULL,NULL,'',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,'2026-09-23 07:50:03',NULL,NULL,'2026-09-23 07:49:58',NULL,NULL,'',NULL,1,NULL,NULL,'',NULL,0,'','',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `llx_user` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_user_alert`
--

DROP TABLE IF EXISTS `llx_user_alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_user_alert` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `fk_contact` int(11) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_user_alert`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_user_alert` WRITE;
/*!40000 ALTER TABLE `llx_user_alert` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_user_alert` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_user_clicktodial`
--

DROP TABLE IF EXISTS `llx_user_clicktodial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_user_clicktodial` (
  `fk_user` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `login` varchar(32) DEFAULT NULL,
  `pass` varchar(64) DEFAULT NULL,
  `poste` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`fk_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_user_clicktodial`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_user_clicktodial` WRITE;
/*!40000 ALTER TABLE `llx_user_clicktodial` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_user_clicktodial` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_user_employment`
--

DROP TABLE IF EXISTS `llx_user_employment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_user_employment` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref` varchar(50) DEFAULT NULL,
  `ref_ext` varchar(50) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `job` varchar(128) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `salary` double(24,8) DEFAULT NULL,
  `salaryextra` double(24,8) DEFAULT NULL,
  `weeklyhours` double(16,8) DEFAULT NULL,
  `dateemployment` date DEFAULT NULL,
  `dateemploymentend` date DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_user_employment` (`ref`,`entity`),
  KEY `fk_user_employment_fk_user` (`fk_user`),
  CONSTRAINT `fk_user_employment_fk_user` FOREIGN KEY (`fk_user`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_user_employment`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_user_employment` WRITE;
/*!40000 ALTER TABLE `llx_user_employment` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_user_employment` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_user_extrafields`
--

DROP TABLE IF EXISTS `llx_user_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_user_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_user_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_user_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_user_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_user_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_user_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_user_param`
--

DROP TABLE IF EXISTS `llx_user_param`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_user_param` (
  `fk_user` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `param` varchar(180) NOT NULL,
  `value` text NOT NULL,
  UNIQUE KEY `uk_user_param` (`fk_user`,`param`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_user_param`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_user_param` WRITE;
/*!40000 ALTER TABLE `llx_user_param` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_user_param` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_user_rib`
--

DROP TABLE IF EXISTS `llx_user_rib`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_user_rib` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_user` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `label` varchar(30) DEFAULT NULL,
  `bank` varchar(255) DEFAULT NULL,
  `code_banque` varchar(128) DEFAULT NULL,
  `code_guichet` varchar(6) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `cle_rib` varchar(5) DEFAULT NULL,
  `bic` varchar(11) DEFAULT NULL,
  `bic_intermediate` varchar(11) DEFAULT NULL,
  `iban_prefix` varchar(100) DEFAULT NULL,
  `domiciliation` varchar(255) DEFAULT NULL,
  `proprio` varchar(60) DEFAULT NULL,
  `owner_address` varchar(255) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `fk_country` int(11) DEFAULT NULL,
  `currency_code` varchar(3) DEFAULT NULL,
  `default_rib` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_user_rib`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_user_rib` WRITE;
/*!40000 ALTER TABLE `llx_user_rib` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_user_rib` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_user_rights`
--

DROP TABLE IF EXISTS `llx_user_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_user_rights` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_user` int(11) NOT NULL,
  `fk_id` int(11) NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_user_rights` (`entity`,`fk_user`,`fk_id`),
  KEY `fk_user_rights_fk_user_user` (`fk_user`),
  CONSTRAINT `fk_user_rights_fk_user_user` FOREIGN KEY (`fk_user`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_user_rights`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_user_rights` WRITE;
/*!40000 ALTER TABLE `llx_user_rights` DISABLE KEYS */;
INSERT INTO `llx_user_rights` VALUES
(28,1,1,121),
(25,1,1,122),
(27,1,1,125),
(29,1,1,126),
(30,1,1,130),
(21,1,1,251),
(2,1,1,252),
(4,1,1,253),
(5,1,1,254),
(7,1,1,255),
(9,1,1,256),
(31,1,1,262),
(37,1,1,281),
(34,1,1,282),
(36,1,1,283),
(38,1,1,286),
(10,1,1,341),
(11,1,1,342),
(12,1,1,343),
(13,1,1,344),
(19,1,1,351),
(16,1,1,352),
(18,1,1,353),
(20,1,1,354),
(22,1,1,358);
/*!40000 ALTER TABLE `llx_user_rights` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_usergroup`
--

DROP TABLE IF EXISTS `llx_usergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_usergroup` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(180) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_parent` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `color` varchar(6) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_usergroup_name` (`nom`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_usergroup`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_usergroup` WRITE;
/*!40000 ALTER TABLE `llx_usergroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_usergroup` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_usergroup_extrafields`
--

DROP TABLE IF EXISTS `llx_usergroup_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_usergroup_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_usergroup_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_usergroup_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_usergroup_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_usergroup_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_usergroup_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_usergroup_rights`
--

DROP TABLE IF EXISTS `llx_usergroup_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_usergroup_rights` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_usergroup` int(11) NOT NULL,
  `fk_id` int(11) NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_usergroup_rights` (`entity`,`fk_usergroup`,`fk_id`),
  KEY `fk_usergroup_rights_fk_usergroup` (`fk_usergroup`),
  CONSTRAINT `fk_usergroup_rights_fk_usergroup` FOREIGN KEY (`fk_usergroup`) REFERENCES `llx_usergroup` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_usergroup_rights`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_usergroup_rights` WRITE;
/*!40000 ALTER TABLE `llx_usergroup_rights` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_usergroup_rights` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_usergroup_user`
--

DROP TABLE IF EXISTS `llx_usergroup_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_usergroup_user` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_user` int(11) NOT NULL,
  `fk_usergroup` int(11) NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_usergroup_user` (`entity`,`fk_user`,`fk_usergroup`),
  KEY `fk_usergroup_user_fk_user` (`fk_user`),
  KEY `fk_usergroup_user_fk_usergroup` (`fk_usergroup`),
  CONSTRAINT `fk_usergroup_user_fk_user` FOREIGN KEY (`fk_user`) REFERENCES `llx_user` (`rowid`),
  CONSTRAINT `fk_usergroup_user_fk_usergroup` FOREIGN KEY (`fk_usergroup`) REFERENCES `llx_usergroup` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_usergroup_user`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_usergroup_user` WRITE;
/*!40000 ALTER TABLE `llx_usergroup_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_usergroup_user` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_webhook_history`
--

DROP TABLE IF EXISTS `llx_webhook_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_webhook_history` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `trigger_code` varchar(128) NOT NULL,
  `trigger_data` text NOT NULL,
  `fk_target` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `error_message` text DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`rowid`),
  KEY `idx_webhook_history_rowid` (`rowid`),
  KEY `idx_webhook_history_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_webhook_history`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_webhook_history` WRITE;
/*!40000 ALTER TABLE `llx_webhook_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_webhook_history` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_webhook_target`
--

DROP TABLE IF EXISTS `llx_webhook_target`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_webhook_target` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref` varchar(128) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `url` varchar(255) NOT NULL,
  `connection_method` varchar(255) DEFAULT NULL,
  `connection_data` varchar(255) DEFAULT NULL,
  `trigger_codes` text DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_webhook_target_rowid` (`rowid`),
  KEY `idx_webhook_target_ref` (`ref`),
  KEY `idx_webhook_target_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_webhook_target`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_webhook_target` WRITE;
/*!40000 ALTER TABLE `llx_webhook_target` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_webhook_target` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_website`
--

DROP TABLE IF EXISTS `llx_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_website` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `type_container` varchar(16) NOT NULL DEFAULT 'page',
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref` varchar(128) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `maincolor` varchar(16) DEFAULT NULL,
  `maincolorbis` varchar(16) DEFAULT NULL,
  `lang` varchar(8) DEFAULT NULL,
  `otherlang` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `fk_default_home` int(11) DEFAULT NULL,
  `use_manifest` int(11) DEFAULT NULL,
  `virtualhost` varchar(255) DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `position` int(11) DEFAULT 0,
  `paymentframemode` int(11) DEFAULT 0,
  `lastaccess` datetime DEFAULT NULL,
  `lastpageid` int(11) DEFAULT 0,
  `pageviews_previous_month` bigint(20) unsigned DEFAULT 0,
  `pageviews_month` bigint(20) unsigned DEFAULT 0,
  `pageviews_total` bigint(20) unsigned DEFAULT 0,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `import_key` varchar(14) DEFAULT NULL,
  `name_template` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_website_ref` (`ref`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_website`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_website` WRITE;
/*!40000 ALTER TABLE `llx_website` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_website` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_website_extrafields`
--

DROP TABLE IF EXISTS `llx_website_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_website_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_website_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_website_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_website_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_website_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_website_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_website_page`
--

DROP TABLE IF EXISTS `llx_website_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_website_page` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_website` int(11) NOT NULL,
  `type_container` varchar(16) NOT NULL DEFAULT 'page',
  `pageurl` varchar(255) NOT NULL,
  `aliasalt` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `metarobots` varchar(128) DEFAULT NULL,
  `lang` varchar(6) DEFAULT NULL,
  `fk_page` int(11) DEFAULT NULL,
  `allowed_in_frames` int(11) DEFAULT 0,
  `htmlheader` text DEFAULT NULL,
  `content` mediumtext DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `grabbed_from` varchar(255) DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `author_alias` varchar(64) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `import_key` varchar(14) DEFAULT NULL,
  `object_type` varchar(255) DEFAULT NULL,
  `fk_object` varchar(255) DEFAULT NULL,
  `keep_history` int(11) DEFAULT 5,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_website_page_url` (`fk_website`,`pageurl`),
  CONSTRAINT `fk_website_page_website` FOREIGN KEY (`fk_website`) REFERENCES `llx_website` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_website_page`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_website_page` WRITE;
/*!40000 ALTER TABLE `llx_website_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_website_page` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_workstation_workstation`
--

DROP TABLE IF EXISTS `llx_workstation_workstation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_workstation_workstation` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(128) NOT NULL DEFAULT '(PROV)',
  `label` varchar(255) DEFAULT NULL,
  `type` varchar(7) DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `entity` int(11) DEFAULT 1,
  `note_private` text DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `nb_operators_required` int(11) DEFAULT NULL,
  `thm_operator_estimated` double DEFAULT NULL,
  `thm_machine_estimated` double DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_workstation_workstation_rowid` (`rowid`),
  KEY `idx_workstation_workstation_ref` (`ref`),
  KEY `fk_workstation_workstation_fk_user_creat` (`fk_user_creat`),
  KEY `idx_workstation_workstation_status` (`status`),
  CONSTRAINT `fk_workstation_workstation_fk_user_creat` FOREIGN KEY (`fk_user_creat`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_workstation_workstation`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_workstation_workstation` WRITE;
/*!40000 ALTER TABLE `llx_workstation_workstation` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_workstation_workstation` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_workstation_workstation_extrafields`
--

DROP TABLE IF EXISTS `llx_workstation_workstation_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_workstation_workstation_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_workstation_workstation_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_workstation_workstation_extrafields`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_workstation_workstation_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_workstation_workstation_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_workstation_workstation_extrafields` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_workstation_workstation_resource`
--

DROP TABLE IF EXISTS `llx_workstation_workstation_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_workstation_workstation_resource` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_resource` int(11) DEFAULT NULL,
  `fk_workstation` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_workstation_workstation_resource`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_workstation_workstation_resource` WRITE;
/*!40000 ALTER TABLE `llx_workstation_workstation_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_workstation_workstation_resource` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_workstation_workstation_usergroup`
--

DROP TABLE IF EXISTS `llx_workstation_workstation_usergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_workstation_workstation_usergroup` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_usergroup` int(11) DEFAULT NULL,
  `fk_workstation` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_workstation_workstation_usergroup`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_workstation_workstation_usergroup` WRITE;
/*!40000 ALTER TABLE `llx_workstation_workstation_usergroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_workstation_workstation_usergroup` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `llx_zapier_hook`
--

DROP TABLE IF EXISTS `llx_zapier_hook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `llx_zapier_hook` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT 1,
  `url` varchar(255) DEFAULT NULL,
  `event` varchar(255) DEFAULT NULL,
  `module` varchar(128) DEFAULT NULL,
  `action` varchar(128) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `fk_user` int(11) NOT NULL,
  `tms` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_zapier_hook`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `llx_zapier_hook` WRITE;
/*!40000 ALTER TABLE `llx_zapier_hook` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_zapier_hook` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-09-24 12:04:26
