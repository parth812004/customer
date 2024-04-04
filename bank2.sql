-- MySQL dump 10.13  Distrib 8.3.0, for macos14 (arm64)
--
-- Host: localhost    Database: Bank
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Account`
--

DROP TABLE IF EXISTS `Account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Account` (
  `ac_no` int NOT NULL,
  `type` char(10) DEFAULT NULL,
  `balance` float DEFAULT NULL,
  `date_open` date DEFAULT NULL,
  `aifsc_code` varchar(11) DEFAULT NULL,
  `c_id` int DEFAULT NULL,
  PRIMARY KEY (`ac_no`),
  KEY `aifsc_code` (`aifsc_code`),
  KEY `c_id` (`c_id`),
  CONSTRAINT `fk_ac_id` FOREIGN KEY (`c_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `fk_ifsc2` FOREIGN KEY (`aifsc_code`) REFERENCES `Branch` (`IFSC_Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Account`
--

LOCK TABLES `Account` WRITE;
/*!40000 ALTER TABLE `Account` DISABLE KEYS */;
INSERT INTO `Account` VALUES (201,'SAVINGS',10500,'2022-01-20','1234MUM6789',1001),(202,'SAVINGS',20300,'2023-01-20','1234MUM6789',1002),(203,'CURRENT',100000,'2020-03-20','1234MUM6789',1003),(204,'CURRENT',105000,'2019-01-20','1234MUM6789',1004),(205,'SAVINGS',50300,'2022-08-10','1234MUM6789',1005);
/*!40000 ALTER TABLE `Account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BRANCH`
--

DROP TABLE IF EXISTS `BRANCH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BRANCH` (
  `IFSC_Code` varchar(11) NOT NULL DEFAULT '1234MUM6789',
  `name` char(20) NOT NULL,
  `Address` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`IFSC_Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BRANCH`
--

LOCK TABLES `BRANCH` WRITE;
/*!40000 ALTER TABLE `BRANCH` DISABLE KEYS */;
INSERT INTO `BRANCH` VALUES ('1234MUM6789','XYZ Bank','Mumbai'),('1235MUM5678','ABC Bank','Mumbai'),('3233DEL7598','PQR Bank','Delhi');
/*!40000 ALTER TABLE `BRANCH` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CAR_LOAN`
--

DROP TABLE IF EXISTS `CAR_LOAN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CAR_LOAN` (
  `cl_id` int DEFAULT NULL,
  `car_no` varchar(15) NOT NULL,
  KEY `cl_id` (`cl_id`),
  CONSTRAINT `cl_id` FOREIGN KEY (`cl_id`) REFERENCES `LOAN` (`loan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CAR_LOAN`
--

LOCK TABLES `CAR_LOAN` WRITE;
/*!40000 ALTER TABLE `CAR_LOAN` DISABLE KEYS */;
INSERT INTO `CAR_LOAN` VALUES (303,'MH 03 AD 4512');
/*!40000 ALTER TABLE `CAR_LOAN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `f_name` char(10) DEFAULT NULL,
  `m_name` char(10) DEFAULT NULL,
  `l_name` char(10) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `cifsc_code` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `cifsc_code` (`cifsc_code`),
  CONSTRAINT `fk_ifsc3` FOREIGN KEY (`cifsc_code`) REFERENCES `Branch` (`IFSC_Code`)
) ENGINE=InnoDB AUTO_INCREMENT=1235 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES (1001,'QWERTY','ASDF','ZXCV','1995-04-03','Vashi','1234MUM6789'),(1002,'dscjef','sfgf','wer','2002-08-06','Mumbai','1234MUM6789'),(1003,'PLMN','OKNJ','IJBH','1979-05-09','Panvel','1234MUM6789'),(1004,'shb','sdkhmb','fkjbflsn','1999-12-01','Sion','1234MUM6789'),(1005,'hnbn','inhhi','inin','2004-09-06','Sion','1234MUM6789'),(1006,'Bhavana','Rahul','Soni','1990-09-17','Ghatkopar','1234MUM6789'),(1008,'a','b','c','1999-04-07','Mumbai','1234MUM6789');
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employee` (
  `Emp_id` int NOT NULL,
  `f_name` varchar(10) NOT NULL,
  `m_name` varchar(10) NOT NULL,
  `l_name` varchar(10) NOT NULL,
  `salary` float DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `position` varchar(20) NOT NULL,
  `address` varchar(30) DEFAULT NULL,
  `gender` char(10) DEFAULT NULL,
  `date_join` date DEFAULT NULL,
  `ifsc_code` varchar(11) DEFAULT NULL,
  `super_id` int DEFAULT NULL,
  `gross_salary` float DEFAULT NULL,
  PRIMARY KEY (`Emp_id`),
  KEY `ifsc_code` (`ifsc_code`),
  KEY `super_id` (`super_id`),
  CONSTRAINT `fk_ifsc1` FOREIGN KEY (`ifsc_code`) REFERENCES `Branch` (`IFSC_Code`),
  CONSTRAINT `super_id` FOREIGN KEY (`super_id`) REFERENCES `Employee` (`Emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES (101,'ABC','PQR','XYZ',30000,'1999-12-02','Accountant','Sion','Male','2022-03-23',NULL,103,NULL),(102,'BC','QR','YZ',10000,'1919-12-04','Clerk','Sion','Male','2023-03-23',NULL,NULL,NULL),(103,'AABB','CCDD','EEFF',35000,'1980-05-30','Supervisor','Thane','Male','2021-08-12','1234MUM6789',103,NULL),(104,'AAB','CCD','EEF',25000,'1970-05-30','Accountant','Mumbai','Male','2020-08-12','1234MUM6789',103,NULL),(105,'AABc','CCDe','EEFd',20000,'1990-01-30','Accountant','Panvel','Male','2023-02-12','1234MUM6789',103,NULL),(106,'Parth','Rahul','Soni',38000,'1993-12-03','Supervisor','Dadar','Male','2021-02-07','1234MUM6789',106,NULL),(107,'hjgf','dfg','dsf',10000,'1995-01-31','Clerk','Andheri','Female','2023-02-17','1234MUM6789',106,NULL),(108,'ZXCV','QWER','ASDF',25000,'1999-12-08','Accountant','Mumbai','Male','2023-10-23','1234MUM6789',106,300000);
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EMPLOYEE_PHONE`
--

DROP TABLE IF EXISTS `EMPLOYEE_PHONE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EMPLOYEE_PHONE` (
  `Emp_id` int DEFAULT NULL,
  `phone_no` int NOT NULL,
  KEY `Emp_id` (`Emp_id`),
  CONSTRAINT `Emp_id` FOREIGN KEY (`Emp_id`) REFERENCES `EMPLOYEE` (`Emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMPLOYEE_PHONE`
--

LOCK TABLES `EMPLOYEE_PHONE` WRITE;
/*!40000 ALTER TABLE `EMPLOYEE_PHONE` DISABLE KEYS */;
INSERT INTO `EMPLOYEE_PHONE` VALUES (101,1234567890),(103,1468101357),(104,1537924680),(105,691215182);
/*!40000 ALTER TABLE `EMPLOYEE_PHONE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GOLD_LOAN`
--

DROP TABLE IF EXISTS `GOLD_LOAN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GOLD_LOAN` (
  `loan_id` int DEFAULT NULL,
  `jewellery` varchar(30) NOT NULL,
  KEY `loan_id` (`loan_id`),
  CONSTRAINT `loan_id` FOREIGN KEY (`loan_id`) REFERENCES `LOAN` (`loan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GOLD_LOAN`
--

LOCK TABLES `GOLD_LOAN` WRITE;
/*!40000 ALTER TABLE `GOLD_LOAN` DISABLE KEYS */;
INSERT INTO `GOLD_LOAN` VALUES (301,'bangles'),(302,'necklace');
/*!40000 ALTER TABLE `GOLD_LOAN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HOME_LOAN`
--

DROP TABLE IF EXISTS `HOME_LOAN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HOME_LOAN` (
  `l_id` int DEFAULT NULL,
  `home_address` varchar(40) NOT NULL DEFAULT 'Mumbai',
  KEY `l_id` (`l_id`),
  CONSTRAINT `l_id` FOREIGN KEY (`l_id`) REFERENCES `LOAN` (`loan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HOME_LOAN`
--

LOCK TABLES `HOME_LOAN` WRITE;
/*!40000 ALTER TABLE `HOME_LOAN` DISABLE KEYS */;
INSERT INTO `HOME_LOAN` VALUES (302,'Bandra');
/*!40000 ALTER TABLE `HOME_LOAN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Loan`
--

DROP TABLE IF EXISTS `Loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Loan` (
  `loan_id` int NOT NULL,
  `amount` float DEFAULT NULL,
  `rate_of_interest` float DEFAULT NULL,
  `status` char(20) DEFAULT NULL,
  `lc_id` int DEFAULT NULL,
  PRIMARY KEY (`loan_id`),
  KEY `lc_id` (`lc_id`),
  CONSTRAINT `fk_lc_id` FOREIGN KEY (`lc_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Loan`
--

LOCK TABLES `Loan` WRITE;
/*!40000 ALTER TABLE `Loan` DISABLE KEYS */;
INSERT INTO `Loan` VALUES (301,4561.23,5.6,'Pending',1001),(302,2432.12,6,'Completed',1001),(303,5243.74,100,'Pending',1002);
/*!40000 ALTER TABLE `Loan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Performs`
--

DROP TABLE IF EXISTS `Performs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Performs` (
  `t_id` int DEFAULT NULL,
  `ac_no` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  KEY `t_id` (`t_id`),
  KEY `ac_no` (`ac_no`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `ac_no` FOREIGN KEY (`ac_no`) REFERENCES `ACCOUNT` (`ac_no`),
  CONSTRAINT `fk_p_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `t_id` FOREIGN KEY (`t_id`) REFERENCES `TRANSACTION` (`t_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Performs`
--

LOCK TABLES `Performs` WRITE;
/*!40000 ALTER TABLE `Performs` DISABLE KEYS */;
INSERT INTO `Performs` VALUES (14504,201,1001),(14502,204,1003),(14503,202,1002),(14503,203,1001),(14504,205,1003);
/*!40000 ALTER TABLE `Performs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Salary_history`
--

DROP TABLE IF EXISTS `Salary_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Salary_history` (
  `Emp_id` int DEFAULT NULL,
  `prev_s` float DEFAULT NULL,
  `current_s` float DEFAULT NULL,
  KEY `fk_c1` (`Emp_id`),
  CONSTRAINT `fk_c1` FOREIGN KEY (`Emp_id`) REFERENCES `Employee` (`Emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Salary_history`
--

LOCK TABLES `Salary_history` WRITE;
/*!40000 ALTER TABLE `Salary_history` DISABLE KEYS */;
INSERT INTO `Salary_history` VALUES (102,8000,10000),(107,8500,10000);
/*!40000 ALTER TABLE `Salary_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TRANSACTION`
--

DROP TABLE IF EXISTS `TRANSACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TRANSACTION` (
  `t_id` int NOT NULL,
  `time` time DEFAULT NULL,
  `date` date DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `tac_no` int DEFAULT NULL,
  PRIMARY KEY (`t_id`),
  KEY `tac_no` (`tac_no`),
  CONSTRAINT `tac_no` FOREIGN KEY (`tac_no`) REFERENCES `ACCOUNT` (`ac_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TRANSACTION`
--

LOCK TABLES `TRANSACTION` WRITE;
/*!40000 ALTER TABLE `TRANSACTION` DISABLE KEYS */;
INSERT INTO `TRANSACTION` VALUES (14501,'12:34:00','2023-12-02','Credit',201),(14502,'13:04:00','2023-12-25','Debit',204),(14503,'17:37:00','2024-01-31','Credit',203),(14504,'12:34:00','2023-12-02','Credit',201),(14505,'14:00:00','2024-01-01','Debit',202);
/*!40000 ALTER TABLE `TRANSACTION` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-04 10:05:35
