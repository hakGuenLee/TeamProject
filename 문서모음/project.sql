CREATE DATABASE  IF NOT EXISTS `project` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `project`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: project
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addr_manage`
--

DROP TABLE IF EXISTS `addr_manage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addr_manage` (
  `addr_no` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(30) NOT NULL,
  `addr_nm` varchar(50) NOT NULL,
  `addr_gb` varchar(30) DEFAULT NULL,
  `addr_nik` varchar(20) DEFAULT NULL,
  `addr_tel` varchar(20) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `addr` varchar(100) NOT NULL,
  `addr_road` varchar(100) NOT NULL,
  `addr_detail` varchar(200) NOT NULL,
  `addr_dt` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`addr_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addr_manage`
--

LOCK TABLES `addr_manage` WRITE;
/*!40000 ALTER TABLE `addr_manage` DISABLE KEYS */;
/*!40000 ALTER TABLE `addr_manage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_master`
--

DROP TABLE IF EXISTS `admin_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_master` (
  `adm_id` varchar(30) NOT NULL,
  `adm_nm` varchar(50) NOT NULL,
  `adm_vnm` varchar(50) NOT NULL,
  `adm_pw` varchar(200) NOT NULL,
  `emp_id` varchar(30) NOT NULL,
  `use_yn` varchar(1) NOT NULL DEFAULT 'Y',
  `proc_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mod_dt` datetime DEFAULT NULL,
  `exp_dt` datetime DEFAULT NULL,
  `proc_id` varchar(30) NOT NULL,
  `mod_id` varchar(30) DEFAULT NULL,
  `exp_id` varchar(30) DEFAULT NULL,
  `role` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`adm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_master`
--

LOCK TABLES `admin_master` WRITE;
/*!40000 ALTER TABLE `admin_master` DISABLE KEYS */;
INSERT INTO `admin_master` VALUES ('sys','코쿤','최고관리자','{bcrypt}$2a$10$SH8TZytKUt8V.CgvpC3A1ONkbQXY6x.ejURjaxoZWA/DMAxWC4xCK','32569009','Y','2023-08-01 00:00:00','2023-08-08 00:00:00','2028-08-08 00:00:00','admin','admin','admin','ROLE_ADMIN'),('test','김숙','중간관리자','{bcrypt}$2a$10$3hKZQ290Ye5rm0eycGzlI.BhR8HxE6/V.kONpPZ.S4cOTSLllJhDW','13005050','Y','2023-08-08 00:00:00','2023-08-08 00:00:00','2028-08-08 00:00:00','admin','admin','admin','ROLE_MANAGER'),('test2','유재석','매니저','{bcrypt}$2a$10$o2DHMCJlE3jNAHYXyxXaJOLsAUNah7Oe3JNEDlZaQk0H2rAjKnXqe','11001345','Y','2023-08-01 00:00:00','2023-08-08 00:00:00','2023-09-09 00:00:00','admin','admin','admin','ROLE_MANAGER2');
/*!40000 ALTER TABLE `admin_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cart_no` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(30) NOT NULL,
  `prod_no` varchar(50) NOT NULL,
  `op_code` varchar(50) DEFAULT NULL,
  `qty` int NOT NULL DEFAULT '1',
  `buy_yn` varchar(50) NOT NULL,
  `cart_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cart_no`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (4,'t1','2',NULL,1,'N','2023-08-14 14:54:25');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmmn_cd`
--

DROP TABLE IF EXISTS `cmmn_cd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cmmn_cd` (
  `cm_no` int NOT NULL AUTO_INCREMENT,
  `cm_cd` varchar(10) NOT NULL,
  `cm_nm` varchar(100) NOT NULL,
  `item_cd` varchar(10) NOT NULL,
  `item_nm` varchar(50) NOT NULL,
  `use_yn` varchar(2) NOT NULL DEFAULT 'Y',
  `proc_id` varchar(30) NOT NULL,
  `proc_dt` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cm_no`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmmn_cd`
--

LOCK TABLES `cmmn_cd` WRITE;
/*!40000 ALTER TABLE `cmmn_cd` DISABLE KEYS */;
INSERT INTO `cmmn_cd` VALUES (1,'100','게시글 등록구분','001','팝업','Y','21005432','2023-07-24 15:15:35'),(2,'100','게시글 등록구분','002','공지사항','Y','21005432','2023-07-24 15:15:35'),(3,'200','사용구분','Y','Y','Y','21005432','2023-07-24 15:15:35'),(4,'200','사용구분','N','N','Y','21005432','2023-07-24 15:15:35'),(5,'300','주문 상태코드','001','결제 완료','Y','21005432','2023-07-24 15:15:35'),(6,'300','주문 상태코드','002','상품준비중','Y','21005432','2023-07-24 15:15:35'),(7,'300','주문 상태코드','003','배송중','Y','21005432','2023-07-24 15:15:35'),(8,'300','주문 상태코드','004','배송 완료','Y','21005432','2023-07-24 15:15:35'),(9,'300','주문 상태코드','005','교환요청(전체)','N','21005432','2023-07-24 15:15:35'),(10,'300','주문 상태코드','006','교환요청(부분)','N','21005432','2023-07-24 15:15:35'),(11,'300','주문 상태코드','007','교환상품 픽업','N','21005432','2023-07-24 15:15:35'),(12,'300','주문 상태코드','008','교환상품 배송중','N','21005432','2023-07-24 15:15:35'),(13,'300','주문 상태코드','009','교환상품 배송 완료','N','21005432','2023-07-24 15:15:35'),(14,'300','주문 상태코드','010','환불 요청(전체)','N','21005432','2023-07-24 15:15:35'),(15,'300','주문 상태코드','011','환불 요청(부분)','N','21005432','2023-07-24 15:15:35'),(16,'300','주문 상태코드','012','환불 상품 픽업','N','21005432','2023-07-24 15:15:35'),(17,'300','주문 상태코드','013','환불 처리 중','N','21005432','2023-07-24 15:15:35'),(18,'300','주문 상태코드','014','환불 처리 완료','N','21005432','2023-07-24 15:15:35'),(19,'400','상품문의','001','제품','Y','21005432','2023-07-24 15:15:35'),(20,'400','상품문의','002','배송','Y','21005432','2023-07-24 15:15:35'),(21,'400','상품문의','003','교환 및 환불','Y','21005432','2023-07-24 15:15:35'),(22,'400','상품문의','004','기타','Y','21005432','2023-07-24 15:15:35'),(23,'500','고객문의 일대일','001','회원/정보관리','Y','21005432','2023-07-24 15:15:35'),(24,'500','고객문의 일대일','002','주문/결제','Y','21005432','2023-07-24 15:15:35'),(25,'500','고객문의 일대일','003','배송','Y','21005432','2023-07-24 15:15:35'),(26,'500','고객문의 일대일','004','반품/환불/교환/AS','Y','21005432','2023-07-24 15:15:35'),(27,'500','고객문의 일대일','005','영수증/증빙서류','Y','21005432','2023-07-24 15:15:35'),(28,'500','고객문의 일대일','006','상품/이벤트','Y','21005432','2023-07-24 15:15:35'),(29,'500','고객문의 일대일','007','기타','Y','21005432','2023-07-24 15:15:35'),(30,'600','옵션 코드(의류)','WS','화이트/S','Y','21005432','2023-07-24 15:15:35'),(31,'600','옵션 코드(의류)','WM','화이트/M','Y','21005432','2023-07-24 15:15:35'),(32,'600','옵션 코드(의류)','WL','화이트/L','Y','21005432','2023-07-24 15:15:35'),(33,'600','옵션 코드(의류)','WXL','화이트/XL','Y','21005432','2023-07-24 15:15:35'),(34,'600','옵션 코드(의류)','BS','블랙/S','Y','21005432','2023-07-24 15:15:35'),(35,'600','옵션 코드(의류)','BM','블랙/M','Y','21005432','2023-07-24 15:15:35'),(36,'600','옵션 코드(의류)','BL','블랙/L','Y','21005432','2023-07-24 15:15:35'),(37,'600','옵션 코드(의류)','BXL','블랙/XL','Y','21005432','2023-07-24 15:15:35'),(38,'700','옵션 코드(가전)','W','화이트','Y','21005432','2023-07-24 15:15:35'),(39,'700','옵션 코드(가전)','B','블랙','Y','21005432','2023-07-24 15:15:35'),(40,'800','연락처 구분','SU','02','Y','21005432','2023-07-24 15:15:35'),(41,'800','연락처 구분','KG','031','Y','21005432','2023-07-24 15:15:35'),(42,'800','연락처 구분','IC','032','Y','21005432','2023-07-24 15:15:35'),(43,'800','연락처 구분','KW','033','Y','21005432','2023-07-24 15:15:35'),(44,'800','연락처 구분','CN','041','Y','21005432','2023-07-24 15:15:35'),(45,'800','연락처 구분','DJ','042','Y','21005432','2023-07-24 15:15:35'),(46,'800','연락처 구분','CB','043','Y','21005432','2023-07-24 15:15:35'),(47,'800','연락처 구분','SJ','044','Y','21005432','2023-07-24 15:15:35'),(48,'800','연락처 구분','BS','051','Y','21005432','2023-07-24 15:15:35'),(49,'800','연락처 구분','US','052','Y','21005432','2023-07-24 15:15:35'),(50,'800','연락처 구분','DG','053','Y','21005432','2023-07-24 15:15:35'),(51,'800','연락처 구분','KB','054','Y','21005432','2023-07-24 15:15:35'),(52,'800','연락처 구분','KN','055','Y','21005432','2023-07-24 15:15:35'),(53,'800','연락처 구분','JN','061','Y','21005432','2023-07-24 15:15:35'),(54,'800','연락처 구분','GJ','062','Y','21005432','2023-07-24 15:15:35'),(55,'800','연락처 구분','JB','063','Y','21005432','2023-07-24 15:15:35'),(56,'800','연락처 구분','JJ','064','Y','21005432','2023-07-24 15:15:35'),(57,'800','연락처 구분','HP','010','Y','21005432','2023-07-24 15:15:35'),(58,'900','이메일 구분','NV','naver.com','Y','21005432','2023-07-24 15:15:35'),(59,'900','이메일 구분','HM','hanmail.net','Y','21005432','2023-07-24 15:15:35'),(60,'900','이메일 구분','DM','daum.net','Y','21005432','2023-07-24 15:15:35'),(61,'900','이메일 구분','NT','nate.com','Y','21005432','2023-07-24 15:15:35'),(62,'900','이메일 구분','HM','hotmail.com','Y','21005432','2023-07-24 15:15:35'),(63,'900','이메일 구분','GM','gmail.com','Y','21005432','2023-07-24 15:15:35'),(64,'900','이메일 구분','IC','icloud.com','Y','21005432','2023-07-24 15:15:35'),(65,'990','관리자 role','ROLE_ADMIN','SuperAdmin','Y','21005432','2023-07-24 15:15:35'),(68,'310','처리상태','1','접수 완료','Y','21005432','2023-07-25 10:56:04'),(69,'310','처리상태','2','처리 완료','Y','21005432','2023-07-25 10:56:04');
/*!40000 ALTER TABLE `cmmn_cd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cs_master`
--

DROP TABLE IF EXISTS `cs_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cs_master` (
  `cs_no` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(30) NOT NULL,
  `prod_no` varchar(100) DEFAULT NULL,
  `cs_code` varchar(50) NOT NULL,
  `cs_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cs_ttl` varchar(50) NOT NULL,
  `cs_con` varchar(500) NOT NULL,
  `proc_id` varchar(55) DEFAULT NULL,
  `proc_sts` varchar(1) DEFAULT '1',
  `sts_dt` datetime DEFAULT NULL,
  PRIMARY KEY (`cs_no`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cs_master`
--

LOCK TABLES `cs_master` WRITE;
/*!40000 ALTER TABLE `cs_master` DISABLE KEYS */;
INSERT INTO `cs_master` VALUES (1,'t1',NULL,'003','2023-08-14 13:12:40','배송관련 질문입니다.','8월 13일에 주문했는데 언제 오나요 ?',NULL,'2','2023-08-14 15:01:13'),(2,'t1',NULL,'005','2023-08-14 15:06:33','영수증이 필요해요','최근에 구매한 제품들 종이영수증 사진 찍어서 메일로 보내주세요.\r\n감사합니다',NULL,'1',NULL);
/*!40000 ALTER TABLE `cs_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cs_reply`
--

DROP TABLE IF EXISTS `cs_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cs_reply` (
  `csre_no` int NOT NULL AUTO_INCREMENT,
  `cs_no` varchar(30) NOT NULL,
  `csre_con` varchar(500) NOT NULL,
  `proc_id` varchar(30) NOT NULL,
  `proc_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`csre_no`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cs_reply`
--

LOCK TABLES `cs_reply` WRITE;
/*!40000 ALTER TABLE `cs_reply` DISABLE KEYS */;
INSERT INTO `cs_reply` VALUES (1,'1','8월 15일 광복절이 지난 후 16일부터 순차배송됩니다.\r\n감사합니다 ^^','sys','2023-08-14 15:01:13');
/*!40000 ALTER TABLE `cs_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ctgry_mng`
--

DROP TABLE IF EXISTS `ctgry_mng`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ctgry_mng` (
  `ctgry_no` int NOT NULL AUTO_INCREMENT,
  `ct_cd1` varchar(10) NOT NULL,
  `ct_nm1` varchar(50) NOT NULL,
  `ct_seq1` int NOT NULL,
  `ct_cd2` varchar(10) DEFAULT NULL,
  `ct_nm2` varchar(50) DEFAULT NULL,
  `ct_seq2` int DEFAULT NULL,
  `use_yn` varchar(1) NOT NULL DEFAULT 'Y',
  `proc_id` varchar(30) DEFAULT NULL,
  `proc_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ctgry_no`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ctgry_mng`
--

LOCK TABLES `ctgry_mng` WRITE;
/*!40000 ALTER TABLE `ctgry_mng` DISABLE KEYS */;
INSERT INTO `ctgry_mng` VALUES (1,'A100','과일',1,'A100001','과일',1,'Y','manager','2023-08-14 10:54:31'),(2,'A100','과일',1,'A100002','견과/특용작물',2,'Y','manager','2023-08-14 10:54:31'),(3,'A100','과일',1,'A100003','냉동과일',3,'Y','manager','2023-08-14 10:54:31'),(4,'B100','채소',2,'B100001','잎채소',4,'Y','manager','2023-08-14 10:54:31'),(5,'B100','채소',2,'B100002','열매채소',5,'Y','manager','2023-08-14 10:54:31'),(6,'B100','채소',2,'B100003','뿌리채소',6,'Y','manager','2023-08-14 10:54:31'),(7,'B100','채소',2,'B100004','버섯',7,'Y','manager','2023-08-14 10:54:31'),(8,'B100','채소',2,'B100005','나물류',8,'Y','manager','2023-08-14 10:54:31'),(9,'C100','축산',3,'C100001','한우',9,'Y','manager','2023-08-14 10:54:31'),(10,'C100','축산',3,'C100002','돈육',10,'Y','manager','2023-08-14 10:54:31'),(11,'C100','축산',3,'C100003','닭/오리',11,'Y','manager','2023-08-14 10:54:31'),(12,'C100','축산',3,'C100004','유정란',12,'Y','manager','2023-08-14 10:54:31'),(13,'S100','의류',4,'S100001','아우터',13,'Y','manager','2023-08-14 10:54:31'),(14,'S100','의류',4,'S100002','팬츠',14,'Y','manager','2023-08-14 10:54:31'),(15,'S100','의류',4,'S100003','스커트',15,'Y','manager','2023-08-14 10:54:31'),(16,'S100','의류',4,'S100004','상의',16,'Y','manager','2023-08-14 10:54:31'),(17,'K100','가전',5,'K100001','주방가전',17,'Y','manager','2023-08-14 10:54:31'),(18,'K100','가전',5,'K100002','생활가전',18,'Y','manager','2023-08-14 10:54:31'),(19,'K100','가전',5,'K100003','욕실가전',19,'Y','manager','2023-08-14 10:54:31');
/*!40000 ALTER TABLE `ctgry_mng` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp_info`
--

DROP TABLE IF EXISTS `emp_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emp_info` (
  `emp_id` int DEFAULT NULL,
  `emp_nm` text,
  `emp_grd` text,
  `emp_role` text,
  `dept_cd` int DEFAULT NULL,
  `dept_nm` text,
  `cell_phone` text,
  `off_tel` text,
  `email` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_info`
--

LOCK TABLES `emp_info` WRITE;
/*!40000 ALTER TABLE `emp_info` DISABLE KEYS */;
INSERT INTO `emp_info` VALUES (11001345,'유재석','임원','그룹장',30000,'마케팅본부','010-1111-2222','02-2222-3434','youjs@ezen.co.kr'),(13005050,'김숙','선임','팀장',30600,'고객관리팀','010-1313-5622','02-2222-3438','kimsuk@ezen.co.kr'),(21005432,'하하','선임','팀장',34000,'상품관리팀1','010-2121-2223','02-2222-3435','haha@ezen.co.kr'),(23006742,'전현무','선임','팀장',39800,'상품관리팀2','010-2323-7723','02-2222-3440','jeunhm@ezen.co.kr'),(26007895,'이미주','주임','팀원',34000,'상품관리팀1','010-2626-2256','02-2222-3437','mjlee@ezen.co.kr'),(32569009,'코쿤','주임','팀원',39800,'상품관리팀2','010-3232-2293','02-2222-3443','cocun@ezen.co.kr'),(34006425,'조세호','주임','팀원',34000,'상품관리팀1','010-3434-2253','02-2222-3436','chosh@ezen.co.kr'),(34789800,'양세찬','주임','팀원',30600,'고객관리팀','010-3434-3222','02-2222-3439','yang@ezen.co.kr'),(78540092,'박나래','주임','팀원',39800,'상품관리팀2','010-7878-8923','02-2222-3442','parknr@ezen.co.kr'),(93970021,'기안84','주임','팀원',39800,'상품관리팀2','010-9393-2213','02-2222-3441','gian84@ezen.co.kr');
/*!40000 ALTER TABLE `emp_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp_info_db`
--

DROP TABLE IF EXISTS `emp_info_db`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emp_info_db` (
  `emp_id` int DEFAULT NULL,
  `emp_nm` text,
  `emp_grd` text,
  `emp_role` text,
  `dept_cd` int DEFAULT NULL,
  `dept_nm` text,
  `cell_phone` text,
  `off_tel` text,
  `email` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_info_db`
--

LOCK TABLES `emp_info_db` WRITE;
/*!40000 ALTER TABLE `emp_info_db` DISABLE KEYS */;
INSERT INTO `emp_info_db` VALUES (11001345,'유재석','임원','그룹장',30000,'마케팅본부','010-1111-2222','02-2222-3434','youjs@ezen.co.kr'),(13005050,'김숙','선임','팀장',30600,'고객관리팀','010-1313-5622','02-2222-3438','kimsuk@ezen.co.kr'),(21005432,'하하','선임','팀장',34000,'상품관리팀1','010-2121-2223','02-2222-3435','haha@ezen.co.kr'),(23006742,'전현무','선임','팀장',39800,'상품관리팀2','010-2323-7723','02-2222-3440','jeunhm@ezen.co.kr'),(26007895,'이미주','주임','팀원',34000,'상품관리팀1','010-2626-2256','02-2222-3437','mjlee@ezen.co.kr'),(32569009,'코쿤','주임','팀원',39800,'상품관리팀2','010-3232-2293','02-2222-3443','cocun@ezen.co.kr'),(34006425,'조세호','주임','팀원',34000,'상품관리팀1','010-3434-2253','02-2222-3436','chosh@ezen.co.kr'),(34789800,'양세찬','주임','팀원',30600,'고객관리팀','010-3434-3222','02-2222-3439','yang@ezen.co.kr'),(78540092,'박나래','주임','팀원',39800,'상품관리팀2','010-7878-8923','02-2222-3442','parknr@ezen.co.kr'),(93970021,'기안84','주임','팀원',39800,'상품관리팀2','010-9393-2213','02-2222-3441','gian84@ezen.co.kr');
/*!40000 ALTER TABLE `emp_info_db` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `od_no` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(30) NOT NULL,
  `prod_no` varchar(50) NOT NULL,
  `order_no` varchar(50) NOT NULL,
  `od_seq` int NOT NULL DEFAULT '1',
  `op_code` varchar(50) DEFAULT NULL,
  `addr_no` varchar(50) NOT NULL,
  `price` int NOT NULL,
  `qty` int NOT NULL DEFAULT '1',
  `point` int DEFAULT '0',
  `tot_price` int NOT NULL,
  `buy_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `payback_yn` varchar(1) DEFAULT NULL,
  `cs_yn` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`od_no`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (1,'t1','1','202308141451293',1,NULL,'1',11900,1,120,11900,'2023-08-14 14:51:29',NULL,NULL);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_master`
--

DROP TABLE IF EXISTS `order_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_master` (
  `order_no` varchar(30) NOT NULL,
  `user_id` varchar(30) NOT NULL,
  `od_seq` int NOT NULL DEFAULT '1',
  `tot_qty` int DEFAULT NULL,
  `order_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `addr_no` int NOT NULL,
  `order_sts` varchar(30) NOT NULL,
  PRIMARY KEY (`order_no`,`order_dt`,`od_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_master`
--

LOCK TABLES `order_master` WRITE;
/*!40000 ALTER TABLE `order_master` DISABLE KEYS */;
INSERT INTO `order_master` VALUES ('202308141451293','t1',1,NULL,'2023-08-14 14:51:29',1,'결제완료');
/*!40000 ALTER TABLE `order_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_mng`
--

DROP TABLE IF EXISTS `post_mng`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_mng` (
  `pst_no` int NOT NULL AUTO_INCREMENT,
  `pst_gb` varchar(10) NOT NULL,
  `pst_ttl` varchar(200) NOT NULL,
  `wrt_id` varchar(30) NOT NULL,
  `aprv_id` varchar(30) NOT NULL,
  `strt_ymd` datetime NOT NULL,
  `end_ymd` datetime NOT NULL,
  `pst_img` varchar(300) DEFAULT NULL,
  `pst_txt` varchar(10000) DEFAULT NULL,
  `pst_sts` varchar(30) DEFAULT NULL,
  `proc_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mod_dt` datetime DEFAULT NULL,
  `req_id` varchar(30) DEFAULT NULL,
  `req_dt` datetime DEFAULT NULL,
  `aprv_dt` datetime DEFAULT NULL,
  `hit` int DEFAULT '0',
  PRIMARY KEY (`pst_no`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_mng`
--

LOCK TABLES `post_mng` WRITE;
/*!40000 ALTER TABLE `post_mng` DISABLE KEYS */;
INSERT INTO `post_mng` VALUES (1,'002','쇼핑몰 오픈 안내','Daven','SuperAdmin','2023-08-14 00:00:00','2023-12-31 00:00:00',NULL,'안녕하세요.  Daven 입니다.\r\n쇼핑몰을 오픈하게 되어 인사드립니다.\r\n많은 관심 부탁드리며, 고객님들이 만족스러운 쇼핑을 하실 수 있도록 최선을 다하겠습니다.\r\n감사합니다 ( _ _ )','1','2023-08-14 12:11:36',NULL,'Daven','2023-08-14 12:11:36',NULL,11),(2,'002','회원약관 조항 공지','Daven','SuperAdmin','2023-08-14 00:00:00','2060-12-25 00:00:00',NULL,'2023년 8월 14일 부로 회원약관을 시행합니다.\r\n\r\n하단의 회원약관을 참고해주시기 바랍니다.\r\n\r\n인터넷 쇼핑몰 『 이젠 쇼핑몰』회원 약관\r\n\r\n제1조(목적)\r\n이 약관은 이젠 회사(전자상거래 사업자)가 운영하는 이젠 쇼핑몰(이하 \"몰\"이라 한다)에서 제공\r\n하는 인터넷 관련 서비스(이하 \"서비스\"라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리·의\r\n무 및 책임사항을 규정함을 목적으로 합니다.\r\n\r\n 「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준\r\n용합니다」\r\n\r\n제2조(정의)\r\n①\"몰\" 이란 이젠 회사가 재화 또는 용역(이하 \"재화등\"이라 함)을 이용자에게 제공하기 위하여 컴\r\n퓨터등 정보통신설비를 이용하여 재화등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울\r\n러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.\r\n\r\n②\"이용자\"란 \"몰\"에 접속하여 이 약관에 따라 \"몰\"이 제공하는 서비스를 받는 회원 및 비회원을\r\n말합니다.\r\n\r\n③ \'회원\'이라 함은 \"몰\"에 개인정보를 제공하여 회원등록을 한 자로서, \"몰\"의 정보를 지속적으로\r\n제공받으며, \"몰\"이 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.\r\n\r\n④ \'비회원\'이라 함은 회원에 가입하지 않고 \"몰\"이 제공하는 서비스를 이용하는 자를 말합니다.\r\n\r\n제3조 (약관등의 명시와 설명 및 개정)\r\n① \"몰\"은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수\r\n있는 곳의 주소를 포함), 전화번호·모사전송번호·전자우편주소, 사업자등록번호, 통신판매업신고\r\n번호, 개인정보관리책임자등을 이용자가 쉽게 알 수 있도록 이젠 쇼핑몰의 초기 서비스화면(전면)\r\n에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.\r\n\r\n② \"몰은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회·배송책임·\r\n환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등\r\n을 제공하여 이용자의 확인을 구하여야 합니다.\r\n\r\n③ \"몰\"은 전자상거래등에서의소비자보호에관한법률, 약관의규제에관한법률, 전자거래기본법, 전자\r\n서명법, 정보통신망이용촉진등에관한법률, 방문판매등에관한법률, 소비자보호법 등 관련법을 위배하\r\n지 않는 범위에서 이 약관을 개정할 수 있습니다.\r\n\r\n④ \"몰\"이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기\r\n화면에 그 적용일자 7일이전부터 적용일자 전일까지 공지합니다.\r\n다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두\r\n고 공지합니다. 이 경우 \"몰\"은 개정전 내용과 개정후 내용을 명확하게 비교하여 이용자가 알기 쉽\r\n도록 표시합니다.\r\n\r\n⑤ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래등에서의소비자보호\r\n에관한법률, 약관의규제등에관한법률, 공정거래위원회가 정하는 전자상거래등에서의소비자보호지침\r\n및 관계법령 또는 상관례에 따릅니다.\r\n\r\n제4조(서비스의 제공 및 변경)\r\n① \"몰\"은 다음과 같은 업무를 수행합니다.\r\n1. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결\r\n2. 구매계약이 체결된 재화 또는 용역의 배송\r\n3. 기타 \"몰\"이 정하는 업무\r\n\r\n②\"몰\"은 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에\r\n의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의\r\n내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.\r\n\r\n③\"몰\"이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화등의 품절 또는 기술적 사양의\r\n변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다.\r\n\r\n④전항의 경우 \"몰\"은 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, \"몰\"이 고의 또는 과\r\n실이 없음을 입증하는 경우에는 그러하지 아니합니다.\r\n\r\n⑤\"몰\"은 회원가입, 주문안내, 배송안내, 등 비광고성 정보를 카카오톡 알림톡으로 알려드리며,\r\n만약 알림톡 수신이 불가능하거나 수신 차단하신 경우에는 일반 문자 메시지로 보내드립니다.\r\n카카오 알림톡을 통해 안내되는 정보를 와이파이가 아닌 이동통신망으로 이용할 경우, 알림톡\r\n수신 중 데이터 요금이 발생할 수 있습니다. 카카오톡을 통해 발송되는 알림톡 수신을 원치 않으실\r\n경우 반드시 알림톡을 차단하여 주시기 바랍니다.\r\n\r\n제5조(서비스의 중단)\r\n① \"몰\"은 컴퓨터 등 정보통신설비의 보수점검·교체 및 고장, 통신의 두절 등의 사유가 발생한 경\r\n우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.\r\n\r\n②\"몰\"은 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입\r\n은 손해에 대하여 배상합니다. 단, \"몰\"이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지\r\n아니합니다.\r\n\r\n③사업종목의 전환, 사업의 포기, 업체간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우\r\n에는 \"몰\"은 제8조에 정한 방법으로 이용자에게 통지하고 당초 \"몰\"에서 제시한 조건에 따라 소비\r\n자에게 보상합니다. 다만, \"몰\"이 보상기준 등을 고지하지 아니한 경우에는 이용자들의 마일리지\r\n또는 적립금 등을 \"몰\"에서 통용되는 통화가치에 상응하는 현물 또는 현금으로 이용자에게 지급합\r\n니다.\r\n\r\n제6조(회원가입)\r\n① 이용자는 \"몰\"이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시\r\n를 함으로서 회원가입을 신청합니다.\r\n\r\n② \"몰\"은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각호에 해당하지 않는 한\r\n회원으로 등록합니다.\r\n1. 가입신청자가 이 약관 제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제\r\n7조제3항에 의한 회원자격 상실후 3년이 경과한 자로서 \"몰\"의 회원재가입 승낙을 얻은 경우에는\r\n예외로 한다.\r\n2. 등록 내용에 허위, 기재누락, 오기가 있는 경우\r\n3. 기타 회원으로 등록하는 것이 \"몰\"의 기술상 현저히 지장이 있다고 판단되는 경우\r\n\r\n③ 회원가입계약의 성립시기는 \"몰\"의 승낙이 회원에게 도달한 시점으로 합니다.\r\n\r\n④ 회원은 제15조제1항에 의한 등록사항에 변경이 있는 경우, 즉시 전자우편 기타 방법으로 \"몰\"에\r\n대하여 그 변경사항을 알려야 합니다.\r\n\r\n제7조(회원 탈퇴 및 자격 상실 등)\r\n① 회원은 \"몰\"에 언제든지 탈퇴를 요청할 수 있으며 \"몰\"은 즉시 회원탈퇴를 처리합니다.\r\n\r\n② 회원이 다음 각호의 사유에 해당하는 경우, \"몰\"은 회원자격을 제한 및 정지시킬 수 있습니다.\r\n1. 가입 신청시에 허위 내용을 등록한 경우\r\n2. \"몰\"을 이용하여 구입한 재화등의 대금, 기타 \"몰\"이용에 관련하여 회원이 부담하는 채무를 기\r\n일에 지급하지 않는 경우\r\n3. 다른 사람의 \"몰\" 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우\r\n4. \"몰\"을 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우\r\n\r\n③ \"몰\"이 회원 자격을 제한·정지 시킨후, 동일한 행위가 2회이상 반복되거나 30일이내에 그 사유\r\n가 시정되지 아니하는 경우 \"몰\"은 회원자격을 상실시킬 수 있습니다.\r\n\r\n④ \"몰\"이 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하\r\n고, 회원등록 말소전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.\r\n\r\n제8조(회원에 대한 통지)\r\n① \"몰\"이 회원에 대한 통지를 하는 경우, 회원이 \"몰\"과 미리 약정하여 지정한 전자우편 주소로\r\n할 수 있습니다.\r\n\r\n② \"몰\"은 불특정다수 회원에 대한 통지의 경우 1주일이상 \"몰\" 게시판에 게시함으로서 개별 통지\r\n에 갈음할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는\r\n개별통지를 합니다.\r\n\r\n제9조(구매신청)\r\n\"몰\"이용자는 \"몰\"상에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, \"몰\"은 이용자가\r\n구매신청을 함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다.  단, 회원인 경우 제2호\r\n내지 제4호의 적용을 제외할 수 있습니다.\r\n1. 재화등의 검색 및 선택\r\n2. 성명, 주소, 전화번호, 전자우편주소(또는 이동전화번호) 등의 입력\r\n3. 약관내용, 청약철회권이 제한되는 서비스, 배송료·설치비 등의 비용부담과 관련한 내용에 대한\r\n확인\r\n4. 이 약관에 동의하고 위 3.호의 사항을 확인하거나 거부하는 표시(예, 마우스 클릭)\r\n5. 재화등의 구매신청 및 이에 관한 확인 또는 \"몰\"의 확인에 대한 동의\r\n6. 결제방법의 선택\r\n\r\n제10조 (계약의 성립)\r\n① \"몰\"은 제9조와 같은 구매신청에 대하여 다음 각호에 해당하면 승낙하지 않을 수 있습니다. 다\r\n만, 미성년자와 계약을 체결하는 경우에는 법정대리인의 동의를 얻지 못하면 미성년자 본인 또는\r\n법정대리인이 계약을 취소할 수 있다는 내용을 고지하여야 합니다.\r\n1. 신청 내용에 허위, 기재누락, 오기가 있는 경우\r\n2. 미성년자가 담배, 주류등 청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우\r\n3. 기타 구매신청에 승낙하는 것이 \"몰\" 기술상 현저히 지장이 있다고 판단하는 경우\r\n\r\n② \"몰\"의 승낙이 제12조제1항의 수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것\r\n으로 봅니다.\r\n\r\n③ \"몰\"의 승낙의 의사표시에는 이용자의 구매 신청에 대한 확인 및 판매가능 여부, 구매신청의 정정\r\n취소등에 관한 정보등을 포함하여야 합니다.\r\n','1','2023-08-14 12:19:05',NULL,'Daven','2023-08-14 12:19:05',NULL,2),(3,'002','고객센터 운영 안내','Daven','SuperAdmin','2023-08-14 00:00:00','2023-08-31 00:00:00',NULL,'■CS CENTER\r\n1234-5678 call\r\n\r\n\r\n\r\n평일 1PM - 5PM\r\n\r\n점심 12PM - 1PM\r\n\r\n\r\n\r\n주말, 공휴일 휴무\r\n\r\n\r\n\r\n\r\n\r\n■BANK INFO\r\n\r\n기업 221-349321-01-011 윤용식 (이젠)','1','2023-08-14 12:25:40',NULL,'Daven','2023-08-14 12:25:40',NULL,1),(4,'002','배송 안내 및 교환 / 반품 안내','Daven','SuperAdmin','2023-08-14 00:00:00','2023-08-31 00:00:00',NULL,'택배사 - CJ 대한통운\r\n\r\n\r\n\r\n* 제주도 및 도서/산간지역 추가비용 3,000원\r\n\r\n\r\n\r\n교환은 1회만 가능하며, 왕복 배송비 6,000원 동봉 및 입금\r\n\r\n반품시 직접 대한통운 택배사 이용하여 착불로 반송 / 무료배송 혜택 받으신 경우, 왕복 택배비 6,000원 동봉 및 입금\r\n\r\n(타택배 이용시 선불로 결제 후 반송. 편의점 택배 포함) \r\n\r\n\r\n\r\n반품 주소 :  서울시 구로구 이젠 아카데미\r\n\r\n타 택배 반품 주소 :  서울 이젠 아카데미 신도림 \r\n\r\n\r\n\r\n* 반드시 반품예약 접수로 반송 해주셔야되시며, 일반 접수로 반송 시 무게수로 측정되기에 배송비 3,000원이 초과되실 수 있으며,\r\n\r\n초과되는 차액금을 고객님께서 추가 입금해주셔야 되는 점 참고부탁드립니다.\r\n\r\n\r\n\r\n수령일로부터 3일이내에 Q&A 게시물 작성 후 반송 부탁드립니다:)\r\n\r\n','1','2023-08-14 12:27:00',NULL,'Daven','2023-08-14 12:27:00',NULL,19),(5,'002','사이즈 측정법','Daven','SuperAdmin','2023-08-14 00:00:00','2023-08-31 00:00:00',NULL,'사이즈는 단면 CM로 측정되었습니다. \r\n\r\n측정 방법에따라 1~3cm 오차가 발생하실 수 있습니다.\r\n\r\n제품 컬러는 모니터 해상도에따라 차이가 있으실 수 있습니다.\r\n\r\n\r\n\r\n어깨단면 소매가 달린 최상단 지점에서 가로로 측정\r\n\r\n가슴단면 양 암홀 지점에서 가로로 측정\r\n\r\n암홀 겨드랑이 부분에서 어깨 최상단 지점까지 일자로 측정\r\n\r\n소매길이 어깨 최상단 지점에서 소매 끝단까지 일자로 측정','1','2023-08-14 12:27:24',NULL,'Daven','2023-08-14 12:27:24',NULL,4),(6,'001','댓글 이벤트 안내','Daven','SuperAdmin','2023-08-14 00:00:00','2023-08-31 00:00:00','팝업1.jpg',NULL,'1','2023-08-14 12:31:12','2023-08-14 14:38:52','Daven','2023-08-14 12:31:12','2023-08-14 14:38:52',0),(7,'001','8.14 택배없는 날 안내','Daven','SuperAdmin','2023-08-14 00:00:00','2023-08-31 00:00:00','1691984099533_팝업11.jpg',NULL,'1','2023-08-14 12:31:42','2023-08-14 14:38:43','Daven','2023-08-14 12:31:42','2023-08-14 14:38:43',0);
/*!40000 ALTER TABLE `post_mng` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prod_image`
--

DROP TABLE IF EXISTS `prod_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prod_image` (
  `img_no` int NOT NULL AUTO_INCREMENT,
  `prod_no` int NOT NULL,
  `detail_img` varchar(1000) NOT NULL,
  `sub_img1` varchar(1000) DEFAULT NULL,
  `sub_img2` varchar(1000) DEFAULT NULL,
  `proc_id` varchar(30) NOT NULL,
  `proc_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`img_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prod_image`
--

LOCK TABLES `prod_image` WRITE;
/*!40000 ALTER TABLE `prod_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `prod_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prod_master`
--

DROP TABLE IF EXISTS `prod_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prod_master` (
  `prod_no` int NOT NULL AUTO_INCREMENT,
  `ctgry_no` int NOT NULL,
  `prod_nm` varchar(200) NOT NULL,
  `main_img` varchar(300) NOT NULL,
  `detail_img` varchar(300) DEFAULT NULL,
  `sub_img1` varchar(300) DEFAULT NULL,
  `sub_img2` varchar(300) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `point` int DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `dc_price` int DEFAULT NULL,
  `etc1` varchar(100) DEFAULT NULL,
  `etc2` varchar(100) DEFAULT NULL,
  `etc3` varchar(100) DEFAULT NULL,
  `etc4` varchar(100) DEFAULT NULL,
  `etc5` varchar(100) DEFAULT NULL,
  `use_yn` varchar(1) NOT NULL DEFAULT 'Y',
  `proc_id` varchar(30) NOT NULL,
  `proc_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mod_id` varchar(30) DEFAULT NULL,
  `mod_dt` datetime DEFAULT NULL,
  PRIMARY KEY (`prod_no`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prod_master`
--

LOCK TABLES `prod_master` WRITE;
/*!40000 ALTER TABLE `prod_master` DISABLE KEYS */;
INSERT INTO `prod_master` VALUES (1,1,'연두사과 (4-8입/봉)','사과1.jpg','사과3.jpg','사과2.jpg','',11900,120,50,0,NULL,NULL,NULL,NULL,NULL,'Y','manager','2023-08-14 11:28:50',NULL,'2023-08-14 14:39:40'),(2,1,'국내산 고당도 시원한 수박 1통(6-6.5kg내외)','수박2.jpg','수박4.jpg','수박1.jpg','수박3.jpg',45900,500,50,0,NULL,NULL,NULL,NULL,NULL,'Y','manager','2023-08-14 11:30:33',NULL,'2023-08-14 14:57:55'),(3,1,'애플망고 선물세트 2.4kg 이상 (6입/로얄과)','애플망고1.jpg','애플망고3.jpg','애플망고2.jpg','',53900,500,50,0,NULL,NULL,NULL,NULL,NULL,'Y','manager','2023-08-14 11:31:09',NULL,'2023-08-14 14:47:59'),(4,4,'로메인 상추 2kg/box','상추1.jpg','상추3.jpg','상추2.jpg','',56000,1000,50,0,NULL,NULL,NULL,NULL,NULL,'Y','manager','2023-08-14 11:31:46',NULL,'2023-08-14 15:28:56'),(5,4,'청경채 4kg/box','청경채1.jpg','청경채3.jpg','청경채2.jpg','',33000,500,50,0,NULL,NULL,NULL,NULL,NULL,'Y','manager','2023-08-14 11:32:17',NULL,'2023-08-14 15:28:47'),(6,4,'시금치 4kg/box','시금치1.jpg','시금치3.jpg','시금치2.jpg','',107000,1000,50,0,NULL,NULL,NULL,NULL,NULL,'Y','manager','2023-08-14 11:32:44',NULL,'2023-08-14 15:28:35'),(7,9,'스테이크용 한우안심 1++ (100G)','한우안심1.jpg','한우안심3.jpg','한우안심2.jpg','',24490,200,50,0,NULL,NULL,NULL,NULL,NULL,'Y','manager','2023-08-14 11:33:16',NULL,'2023-08-14 15:28:27'),(8,9,'한우 등심 구이용(1+등급) (300G)','한우등심1.jpg','한우등심3.jpg','한우등심2.jpg','',23900,500,50,0,NULL,NULL,NULL,NULL,NULL,'Y','manager','2023-08-14 11:33:44',NULL,'2023-08-14 15:30:23'),(9,9,'한우 정육 국거리용(세절/1+등급) (300G)','한우국거리1.jpg','한우국거리3.jpg','한우국거리2.jpg','',11670,0,50,0,NULL,NULL,NULL,NULL,NULL,'Y','manager','2023-08-14 11:34:14',NULL,'2023-08-14 14:46:22'),(10,13,'점퍼 남성아우터','남자옷1.jpg','남자옷3.jpg','남자옷2.jpg','',89900,2000,50,0,NULL,NULL,NULL,NULL,NULL,'Y','manager','2023-08-14 11:34:50',NULL,'2023-08-14 14:45:25'),(11,13,'여성 리본롱집업 22FW 아우터','여자옷1.jpg','여자옷2.jpg','','',58900,500,50,0,NULL,NULL,NULL,NULL,NULL,'Y','manager','2023-08-14 11:35:19',NULL,'2023-08-14 14:45:14'),(12,13,'오리털경량패딩조끼 22FW 아우터','조끼1.jpg','조끼2.jpg','','',41900,500,50,0,NULL,NULL,NULL,NULL,NULL,'Y','manager','2023-08-14 11:35:44',NULL,'2023-08-14 14:29:05'),(13,17,'린나이 인덕션 전기레인지 RBI-P3001A','인덕션1.jpg','인덕션2.jpg','','',1050000,10000,30,0,NULL,NULL,NULL,NULL,NULL,'Y','manager','2023-08-14 11:46:58',NULL,'2023-08-14 14:28:54'),(14,17,'LG 디오스 오브제 양문형 냉장고 S834MGG1D.CKOR [832L]','냉장고1.jpg','냉장고4.jpg','냉장고2.jpg','냉장고3.jpg',1485000,30000,20,0,NULL,NULL,NULL,NULL,NULL,'Y','manager','2023-08-14 11:47:34',NULL,'2023-08-14 14:28:36'),(15,17,'쿠쿠_ IH 전기압력 밥솥 CRP-DHB0660FT (프리미엄 메탈릭,6인)','밥솥1.jpg','밥솥2.jpg','','',302500,3000,30,0,NULL,NULL,NULL,NULL,NULL,'Y','manager','2023-08-14 11:48:01',NULL,'2023-08-14 14:45:03');
/*!40000 ALTER TABLE `prod_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qna_master`
--

DROP TABLE IF EXISTS `qna_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qna_master` (
  `qna_no` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(30) NOT NULL,
  `prod_no` varchar(100) NOT NULL,
  `qna_code` varchar(30) NOT NULL,
  `qna_pw` varchar(50) DEFAULT NULL,
  `qna_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `qna_ttl` varchar(100) NOT NULL,
  `qna_con` varchar(500) NOT NULL,
  `proc_id` varchar(50) DEFAULT NULL,
  `proc_sts` varchar(50) NOT NULL DEFAULT '1',
  `proc_dt` datetime DEFAULT NULL,
  PRIMARY KEY (`qna_no`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qna_master`
--

LOCK TABLES `qna_master` WRITE;
/*!40000 ALTER TABLE `qna_master` DISABLE KEYS */;
INSERT INTO `qna_master` VALUES (1,'t1','1','003',NULL,'2023-08-14 15:34:48','배송이 왔는데 진공포장이 풀려서 왔어요.','핏물이 다 세고 고기에서 쉰내가 나요.\r\n환불해주세요.',NULL,'1',NULL);
/*!40000 ALTER TABLE `qna_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qna_reply`
--

DROP TABLE IF EXISTS `qna_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qna_reply` (
  `qr_no` int NOT NULL AUTO_INCREMENT,
  `qna_no` varchar(30) NOT NULL,
  `qr_con` varchar(500) NOT NULL,
  `proc_id` varchar(30) NOT NULL,
  `proc_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`qr_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qna_reply`
--

LOCK TABLES `qna_reply` WRITE;
/*!40000 ALTER TABLE `qna_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `qna_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rv_master`
--

DROP TABLE IF EXISTS `rv_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rv_master` (
  `rv_no` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(30) NOT NULL,
  `prod_no` varchar(30) NOT NULL,
  `rv_star` int NOT NULL,
  `rv_con` varchar(500) NOT NULL,
  `rv_img` varchar(500) DEFAULT NULL,
  `review_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rv_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rv_master`
--

LOCK TABLES `rv_master` WRITE;
/*!40000 ALTER TABLE `rv_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `rv_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rv_reply`
--

DROP TABLE IF EXISTS `rv_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rv_reply` (
  `rr_no` int NOT NULL AUTO_INCREMENT,
  `rv_no` varchar(50) NOT NULL,
  `rr_con` varchar(500) NOT NULL,
  `proc_id` varchar(50) NOT NULL,
  `proc_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rr_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rv_reply`
--

LOCK TABLES `rv_reply` WRITE;
/*!40000 ALTER TABLE `rv_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `rv_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_master`
--

DROP TABLE IF EXISTS `user_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_master` (
  `user_no` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(30) NOT NULL,
  `user_pw` varchar(200) NOT NULL,
  `user_nm` varchar(50) NOT NULL,
  `user_home` varchar(50) DEFAULT NULL,
  `user_phone` varchar(50) DEFAULT NULL,
  `user_email` varchar(200) NOT NULL,
  `birth_ymd` date DEFAULT NULL,
  `zipcode` varchar(10) DEFAULT NULL,
  `addr` varchar(100) DEFAULT NULL,
  `addr_road` varchar(200) NOT NULL,
  `addr_detail` varchar(200) DEFAULT NULL,
  `use_yn` varchar(1) DEFAULT 'Y',
  `user_dt` datetime DEFAULT CURRENT_TIMESTAMP,
  `point` int DEFAULT '0',
  PRIMARY KEY (`user_no`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_master`
--

LOCK TABLES `user_master` WRITE;
/*!40000 ALTER TABLE `user_master` DISABLE KEYS */;
INSERT INTO `user_master` VALUES (1,'t1','{bcrypt}$2a$10$jAvCYujkkexO519OPImUx.zoBkBOlp8DqjkGYM8wEJKmH0fYGwH7O','학근이','','010-1234-5678','11@com','1996-10-04','39347','경북 구미시 광평동 792-119','경북 구미시 1공단로 15-37','123-34','Y','2023-08-14 12:59:16',120);
/*!40000 ALTER TABLE `user_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_wish`
--

DROP TABLE IF EXISTS `user_wish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_wish` (
  `wish_no` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(30) NOT NULL,
  `prod_no` varchar(50) NOT NULL,
  PRIMARY KEY (`wish_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_wish`
--

LOCK TABLES `user_wish` WRITE;
/*!40000 ALTER TABLE `user_wish` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_wish` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-14 15:38:37
