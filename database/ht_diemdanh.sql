-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ht_diemdanh
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `buoi_hoc`
--

DROP TABLE IF EXISTS `buoi_hoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buoi_hoc` (
  `IDBUOIHOC` int NOT NULL AUTO_INCREMENT,
  `NGAYHOC` date NOT NULL,
  `TIETHOC` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`IDBUOIHOC`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buoi_hoc`
--

LOCK TABLES `buoi_hoc` WRITE;
/*!40000 ALTER TABLE `buoi_hoc` DISABLE KEYS */;
INSERT INTO `buoi_hoc` VALUES (1,'2023-01-05','1-4'),(2,'2023-01-05','7-10'),(3,'2023-01-06','1-4'),(4,'2023-01-07','7-10'),(5,'2023-01-12','1-4'),(6,'2023-01-12','7-10'),(7,'2023-01-14','7-10'),(8,'2023-02-02','1-4'),(9,'2023-02-02','7-10'),(10,'2023-02-04','7-10'),(11,'2023-02-09','1-4'),(12,'2023-02-09','7-10'),(13,'2023-02-11','7-10');
/*!40000 ALTER TABLE `buoi_hoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chi_tiet_buoi_hoc`
--

DROP TABLE IF EXISTS `chi_tiet_buoi_hoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chi_tiet_buoi_hoc` (
  `IDDANGKY` int NOT NULL,
  `IDBUOIHOC` int NOT NULL,
  `VANG` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`IDDANGKY`,`IDBUOIHOC`),
  KEY `FK_DK_CTBH_idx` (`IDDANGKY`),
  KEY `FK_BH_CTBH_idx` (`IDBUOIHOC`),
  CONSTRAINT `FK_BH_CTBH` FOREIGN KEY (`IDBUOIHOC`) REFERENCES `buoi_hoc` (`IDBUOIHOC`) ON UPDATE CASCADE,
  CONSTRAINT `FK_DK_CTBH` FOREIGN KEY (`IDDANGKY`) REFERENCES `dang_ky` (`IDDANGKY`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chi_tiet_buoi_hoc`
--

LOCK TABLES `chi_tiet_buoi_hoc` WRITE;
/*!40000 ALTER TABLE `chi_tiet_buoi_hoc` DISABLE KEYS */;
INSERT INTO `chi_tiet_buoi_hoc` VALUES (5,2,1),(5,6,1),(5,9,0),(5,12,0),(6,4,0),(6,7,0),(6,10,0),(6,13,0),(8,2,1),(8,6,1),(8,9,0),(8,12,0),(9,2,0),(9,6,1),(9,9,0),(9,12,0),(10,2,0),(10,6,0),(10,9,1),(10,12,1),(11,4,1),(11,7,1),(11,10,1),(11,13,0),(12,4,0),(12,7,1),(12,10,0),(12,13,0),(13,4,1),(13,7,1),(13,10,1),(13,13,1),(14,4,1),(14,7,1),(14,10,0),(14,13,0);
/*!40000 ALTER TABLE `chi_tiet_buoi_hoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dang_ky`
--

DROP TABLE IF EXISTS `dang_ky`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dang_ky` (
  `IDDANGKY` int NOT NULL AUTO_INCREMENT,
  `MALTC` int NOT NULL,
  `MASV` char(10) NOT NULL,
  `DIEM_CC` float DEFAULT '0',
  `THEDIEMDANH` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`IDDANGKY`),
  KEY `FK_LTC_DangKy_idx` (`MALTC`) /*!80000 INVISIBLE */,
  KEY `FK_SV_DangKy` (`MASV`),
  CONSTRAINT `FK_LTC_DangKy` FOREIGN KEY (`MALTC`) REFERENCES `lop_tin_chi` (`MALTC`) ON UPDATE CASCADE,
  CONSTRAINT `FK_SV_DangKy` FOREIGN KEY (`MASV`) REFERENCES `sinh_vien` (`MASV`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dang_ky`
--

LOCK TABLES `dang_ky` WRITE;
/*!40000 ALTER TABLE `dang_ky` DISABLE KEYS */;
INSERT INTO `dang_ky` VALUES (5,3,'N19DCCN216',0,NULL),(6,4,'N19DCCN216',0,NULL),(7,5,'N19DCCN216',0,NULL),(8,3,'N19DCCN024',0,NULL),(9,3,'N19DCCN022',0,NULL),(10,3,'N19DCCN222',0,'498BC80E'),(11,5,'N20DCCN013',7.5,NULL),(12,5,'N20DCCN024',2.5,NULL),(13,5,'N20DCCN030',10,NULL),(14,5,'N20DCCN074',5,NULL);
/*!40000 ALTER TABLE `dang_ky` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giang_vien`
--

DROP TABLE IF EXISTS `giang_vien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `giang_vien` (
  `MAGV` int NOT NULL AUTO_INCREMENT,
  `HO` varchar(50) COLLATE utf8mb3_bin NOT NULL,
  `TEN` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `PASSWORD` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`MAGV`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giang_vien`
--

LOCK TABLES `giang_vien` WRITE;
/*!40000 ALTER TABLE `giang_vien` DISABLE KEYS */;
INSERT INTO `giang_vien` VALUES (1,'Nguyễn Ngọc','Duy','1'),(2,'Nguyễn Thị Tuyết','Hải','1'),(3,'Nguyễn Anh','Hào','1'),(4,'Dương Thanh','Thảo','1');
/*!40000 ALTER TABLE `giang_vien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lop`
--

DROP TABLE IF EXISTS `lop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lop` (
  `MALOP` char(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `TENLOP` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `KHOAHOC` char(9) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`MALOP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lop`
--

LOCK TABLES `lop` WRITE;
/*!40000 ALTER TABLE `lop` DISABLE KEYS */;
INSERT INTO `lop` VALUES ('D19CQCN02','Công nghệ thông tin 2','2019-2024'),('D19CQCN03','Công nghệ thông tin 3','2019-2024'),('D20CQCN01','Công nghệ thông tin 1','2020-2025'),('D20CQCN02','Công nghệ thông tin 2','2020-2024');
/*!40000 ALTER TABLE `lop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lop_tin_chi`
--

DROP TABLE IF EXISTS `lop_tin_chi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lop_tin_chi` (
  `MALTC` int NOT NULL AUTO_INCREMENT,
  `NIENKHOA` char(9) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `HOCKY` int NOT NULL,
  `MAMH` char(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `NHOM` int NOT NULL,
  `MAGV` int NOT NULL,
  `TRANGTHAILOPHOC` char(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'DANGMO',
  PRIMARY KEY (`MALTC`),
  KEY `FK_MonHoc_LTC_idx` (`MAMH`),
  KEY `FK_GiangVien_LTC_idx` (`MAGV`),
  CONSTRAINT `FK_GiangVien_LTC` FOREIGN KEY (`MAGV`) REFERENCES `giang_vien` (`MAGV`) ON UPDATE CASCADE,
  CONSTRAINT `FK_MonHoc_LTC` FOREIGN KEY (`MAMH`) REFERENCES `mon_hoc` (`MAMH`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lop_tin_chi`
--

LOCK TABLES `lop_tin_chi` WRITE;
/*!40000 ALTER TABLE `lop_tin_chi` DISABLE KEYS */;
INSERT INTO `lop_tin_chi` VALUES (1,'2021-2022',2,'INT1341',3,1,'DADONG'),(2,'2022-2023',1,'INT14151',2,1,'DADONG'),(3,'2022-2023',2,'INT1341',2,1,'DANGMO'),(4,'2022-2023',2,'INT1427',2,4,'DANGMO'),(5,'2022-2023',2,'INT13147',1,3,'DANGMO'),(6,'2022-2023',2,'INT1341',1,1,'DANGMO');
/*!40000 ALTER TABLE `lop_tin_chi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mon_hoc`
--

DROP TABLE IF EXISTS `mon_hoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mon_hoc` (
  `MAMH` char(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `TENMH` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`MAMH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mon_hoc`
--

LOCK TABLES `mon_hoc` WRITE;
/*!40000 ALTER TABLE `mon_hoc` DISABLE KEYS */;
INSERT INTO `mon_hoc` VALUES ('INT13147','Thực tập cơ sở'),('INT1341','Nhập môn trí tuệ nhân tạo'),('INT1408','Chuyên đề công nghệ phần mềm'),('INT14151','Phát triển các hệ thống thông minh'),('INT1416','Đảm bảo chất lượng phần mềm'),('INT1427','Kiến trúc và thiết kế phần mêm');
/*!40000 ALTER TABLE `mon_hoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sinh_vien`
--

DROP TABLE IF EXISTS `sinh_vien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sinh_vien` (
  `MASV` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `HO` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `TEN` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `PHAI` bit(1) NOT NULL,
  `NGAYSINH` date DEFAULT NULL,
  `MALOP` char(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `PASSWORD` varchar(45) NOT NULL DEFAULT '1',
  PRIMARY KEY (`MASV`),
  KEY `FK_Lop_SinhVien_idx` (`MALOP`),
  KEY `idx_MALOP_TEN_HO` (`MALOP`,`TEN`,`HO`),
  CONSTRAINT `FK_Lop_SinhVien` FOREIGN KEY (`MALOP`) REFERENCES `lop` (`MALOP`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci KEY_BLOCK_SIZE=16;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sinh_vien`
--

LOCK TABLES `sinh_vien` WRITE;
/*!40000 ALTER TABLE `sinh_vien` DISABLE KEYS */;
INSERT INTO `sinh_vien` VALUES ('N19DCCN022','Nguyễn','Bảo',_binary '\0','2001-02-26','D19CQCN02','1'),('N19DCCN024','Nguyễn Thành','Đạt',_binary '\0','2001-01-21','D19CQCN02','1'),('N19DCCN216','Nguyễn Thành','Trung',_binary '\0','2001-02-26','D19CQCN03','1'),('N19DCCN222','Trần Hữu','Trưởng',_binary '\0','2001-02-26','D19CQCN03','1'),('N20DCCN013','Nguyễn Viết','Cường',_binary '\0','2002-03-12','D20CQCN02','1'),('N20DCCN024','Nguyễn Văn','Dương',_binary '\0','2002-05-06','D20CQCN02','1'),('N20DCCN030','Nguyễn Thị Tuyết','Ngân',_binary '','2002-03-12','D20CQCN02','1'),('N20DCCN074','Lê','Hùng',_binary '\0','2002-03-12','D20CQCN02','1');
/*!40000 ALTER TABLE `sinh_vien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thoi_khoa_bieu`
--

DROP TABLE IF EXISTS `thoi_khoa_bieu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thoi_khoa_bieu` (
  `IDBUOIHOC` int NOT NULL,
  `MALTC` int NOT NULL,
  `CHOTDIEMDANH` bit(1) NOT NULL DEFAULT b'0',
  `GHICHU` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`IDBUOIHOC`,`MALTC`),
  KEY `FK_MALTC_idx` (`MALTC`),
  KEY `FK_BuoiHoc_TKB_idx` (`IDBUOIHOC`),
  CONSTRAINT `FK_BuoiHoc_TKB` FOREIGN KEY (`IDBUOIHOC`) REFERENCES `buoi_hoc` (`IDBUOIHOC`) ON UPDATE CASCADE,
  CONSTRAINT `FK_LTC_TKB` FOREIGN KEY (`MALTC`) REFERENCES `lop_tin_chi` (`MALTC`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thoi_khoa_bieu`
--

LOCK TABLES `thoi_khoa_bieu` WRITE;
/*!40000 ALTER TABLE `thoi_khoa_bieu` DISABLE KEYS */;
INSERT INTO `thoi_khoa_bieu` VALUES (1,6,_binary '\0',NULL),(2,3,_binary '','điểm danh bù'),(4,4,_binary '','bù'),(4,5,_binary '',NULL),(5,6,_binary '\0',NULL),(6,3,_binary '',''),(7,4,_binary '\0',NULL),(7,5,_binary '',NULL),(8,6,_binary '\0',NULL),(9,3,_binary '\0',NULL),(10,4,_binary '\0',NULL),(10,5,_binary '',NULL),(11,6,_binary '\0',NULL),(12,3,_binary '\0',NULL),(13,4,_binary '\0',NULL),(13,5,_binary '',NULL);
/*!40000 ALTER TABLE `thoi_khoa_bieu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'ht_diemdanh'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_baoCaoDiemChuyenCan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_baoCaoDiemChuyenCan`(pMALTC INT, pHESODIEMTRU FLOAT, pSOBUOICAMTHIQUYDINH INT )
exit_label:BEGIN
	DECLARE _rollback INT DEFAULT 0;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET _rollback = 1;
	DECLARE EXIT HANDLER FOR 501 BEGIN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Lỗi trong quá trình cập nhật điểm chuyên cần', MYSQL_ERRNO = 501; END;
    DECLARE EXIT HANDLER FOR 500 BEGIN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Chưa hoàn thành tất cả buổi học', MYSQL_ERRNO = 500; END;
  
	SET @tongsobuoihoc = (SELECT COUNT(MALTC) FROM thoi_khoa_bieu WHERE MALTC = pMALTC);
	SET @sobuoidahoc = (SELECT COUNT(MALTC) FROM thoi_khoa_bieu WHERE MALTC = pMALTC AND CHOTDIEMDANH = b'1');
	
    
    IF( @sobuoidahoc< @tongsobuoihoc) THEN 
    BEGIN
		# SELECT 1 AS result_code, 'Chưa hoàn thành tất cả buổi học' AS message;
        # throw error
		# custion number code by using MYSQL_ERRNO 
		# To signal a generic SQLSTATE value, use '45000', which means “unhandled user-defined exception.”.
		# SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'A warning occurred',MYSQL_ERRNO = 500;	
        #SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Chưa hoàn thành tất cả buổi học', MYSQL_ERRNO = 500;
         SIGNAL SQLSTATE '45000' SET MYSQL_ERRNO = 500;

		LEAVE exit_label;
    END;
	END IF;
    
    CREATE TEMPORARY TABLE IF NOT EXISTS CalScore SELECT *, IF(SOBUOIVANG > pSOBUOICAMTHIQUYDINH, 0, TRUNCATE((DIEMDANH * 10 / @tongsobuoihoc) - VANGCOPHEP * pHESODIEMTRU, 1)) AS DIEM_CC
												  FROM (SELECT  DS_SVDK.IDDANGKY, DS_SVDK.MASV,COUNT(IF(CTBH.VANG = 1, 1, null)) AS DIEMDANH,
																							   COUNT(IF(CTBH.VANG = 2, 1, null)) AS VANGCOPHEP,
																							   COUNT(IF(CTBH.VANG = 0, 1, null)) AS SOBUOIVANG
														FROM chi_tiet_buoi_hoc CTBH
														INNER JOIN (SELECT * FROM dang_ky WHERE MALTC = pMALTC) DS_SVDK
														ON CTBH.IDDANGKY = DS_SVDK.IDDANGKY  
														GROUP BY IDDANGKY) TempTable1;  

	# update diem_cc
	START TRANSACTION;
    
	UPDATE dang_ky DKy, CalScore CS
	SET DKy.DIEM_CC =  CS.DIEM_CC
	WHERE DKy.IDDANGKY = CS.IDDANGKY;
	
    IF(_rollback = 1) THEN 
							BEGIN
								ROLLBACK;
                                
                                #SELECT -1 as result_code, 'Lỗi báo cáo. Thử lại!' as message; Optional
                                 # throw error
								# custion number code by using MYSQL_ERRNO 
								# To signal a generic SQLSTATE value, use '45000', which means “unhandled user-defined exception.”.
								# SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'A warning occurred',MYSQL_ERRNO = 500;	
								SIGNAL SQLSTATE '45000' SET MYSQL_ERRNO = 501;
							END;
	ELSE
		BEGIN
			COMMIT;
			SELECT SV.MASV, CONCAT(SV.HO,' ',SV.TEN) as HOTEN, IF(SV.PHAI,'Nữ','Nam') AS PHAI, SV.MALOP, CS.DIEMDANH, CS.VANGCOPHEP, CS.SOBUOIVANG, CS.DIEM_CC
			FROM CalScore CS 
			INNER JOIN sinh_vien SV USE INDEX (idx_MALOP_TEN_HO)
			ON SV.MASV = CS.MASV;
        END;
	END IF;
    
	DROP TABLE CalScore;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_CapNhatDiemDanhBangThe` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_CapNhatDiemDanhBangThe`(pTHEDIEMDANH VARCHAR(20), pMALTC INT, pNGAY DATE, pTIETHOC VARCHAR(5))
BEGIN
	SET @idbuoihoc = (SELECT IDBUOIHOC FROM buoi_hoc WHERE NGAYHOC = pNGAY AND TIETHOC = pTIETHOC);
    #SET @iddangky = (SELECT IDDANGKY FROM dang_ky WHERE THEDIEMDANH = pTHEDIEMDANH AND MALTC = pMALTC);
	SELECT IDDANGKY, MASV INTO @iddangky, @masv FROM dang_ky WHERE THEDIEMDANH = pTHEDIEMDANH AND MALTC = pMALTC;
    UPDATE chi_tiet_buoi_hoc SET VANG = 1 WHERE IDBUOIHOC = @idbuoihoc AND IDDANGKY = @iddangky;
#SELECT row_count(),pTHEDIEMDANH,pMALTC,@idbuoihoc, @iddangky;
    /* if no error update*/
	IF(SELECT row_count() > 0) THEN 
		SELECT 'Điểm danh thành công' AS message, @masv AS MASV;
	ELSE
		#SELECT 'Lỗi điểm danh. Vui lòng kiểm tra lại thẻ!' AS message;
        SIGNAL SQLSTATE  '45000' SET MESSAGE_TEXT='Lỗi điểm danh. Vui lòng kiểm tra lại thẻ!',MYSQL_ERRNO=500;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_CapNhatDiemDanhThuCong` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_CapNhatDiemDanhThuCong`(pMASV CHAR(10), pMALTC INT, pNGAY DATE, pTIETHOC VARCHAR(5), pVANG INT)
BEGIN
	SET @idbuoihoc = (SELECT IDBUOIHOC FROM buoi_hoc WHERE NGAYHOC = pNGAY AND TIETHOC = pTIETHOC);
    SET @iddangky = (SELECT IDDANGKY FROM dang_ky WHERE MASV = pMASV AND MALTC = pMALTC);
	
    UPDATE ht_diemdanh.chi_tiet_buoi_hoc SET VANG = pVang WHERE IDBUOIHOC = @idbuoihoc AND IDDANGKY = @iddangky;
    
    /* if no error update*/
	IF(SELECT row_count() > 0) THEN 
		IF pVang = 0 THEN SELECT 'Vắng' AS message;
		ELSEIF pVang = 1 THEN SELECT 'Có mặt' AS message;
		ELSE SELECT 'Vắng có phép' AS message;
		END IF;
	ELSE
		SELECT 'Lỗi điểm danh' AS message;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_capNhatTheDiemDanh` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_capNhatTheDiemDanh`( pTHEDIEMDANH VARCHAR(20), pMASV CHAR(10), pMALTC INT, pNGAYHOC DATE, pTIETHOC CHAR(5))
exit_label:BEGIN
	SET @masv = (SELECT MASV FROM dang_ky WHERE THEDIEMDANH = pTHEDIEMDANH AND MASV != pMASV AND MALTC = pMALTC);
	IF(@masv is not null)
    THEN
		BEGIN
        SET @message= CONCAT(@masv,' đang dùng thẻ này!');
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @message, MYSQL_ERRNO=500;
			#SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = CONCAT(@masv,' đang dùng thẻ này!') AS message, MYSQL_ERRNO=500;
			#SELECT CONCAT(@masv,' đang dùng thẻ này!') AS message;
            #LEAVE exit_label;
        END;
	END IF;
    
    SET @idbuoihoc = (SELECT IDBUOIHOC FROM buoi_hoc WHERE NGAYHOC = pNGAYHOC AND TIETHOC = pTIETHOC);
    SET @iddangky = (SELECT IDDANGKY FROM dang_ky WHERE MASV = pMASV AND MALTC = pMALTC);
    
	UPDATE chi_tiet_buoi_hoc SET VANG = 1 WHERE IDBUOIHOC = @idbuoihoc AND IDDANGKY = @iddangky;
    
	UPDATE ht_diemdanh.dang_ky SET THEDIEMDANH = pTHEDIEMDANH WHERE MASV = pMASV AND MALTC = pMALTC;
	SELECT 'Cập nhật thành công' AS message; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_chotDiemDanhBuoiHoc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_chotDiemDanhBuoiHoc`(pMALTC INT, pNGAYHOC DATE, pTIETHOC CHAR(5), pConfirmAllAttendance boolean, pGHICHU VARCHAR(100) )
exit_label:BEGIN
	/* Declare variable*/
	SET @idbuoihoc = (SELECT IDBUOIHOC FROM buoi_hoc WHERE NGAYHOC=pNGAYHOC AND TIETHOC = pTIETHOC);

	/* get all students belong to LTC*/
    /* update multi row*/
    /* True: if no have student attend or confirm pConfirmAllAttendance will update REGISTED attendance */
    IF(
    !EXISTS(SELECT * FROM chi_tiet_buoi_hoc CTBH 
					INNER JOIN (SELECT DK.IDDANGKY FROM dang_ky DK WHERE DK.MALTC = pMALTC) DSDK
					ON IDBUOIHOC = @idbuoihoc AND DSDK.IDDANGKY = CTBH.IDDANGKY AND CTBH.VANG = 1)
	OR pConfirmAllAttendance
    )
    THEN
		BEGIN /* then */
			DECLARE _rollback INT DEFAULT 0;
			DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET _rollback = 1;
			DECLARE EXIT HANDLER FOR 500 BEGIN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Lỗi trong quá trình chốt điểm danh', MYSQL_ERRNO = 500;END;
			START TRANSACTION; /* transaction */
			
            UPDATE chi_tiet_buoi_hoc CTBH, (SELECT IDDANGKY FROM dang_ky WHERE MALTC = pMALTC) DK
			SET CTBH.VANG = 1
			WHERE IDBUOIHOC = @idbuoihoc AND CTBH.IDDANGKY = DK.IDDANGKY ; # AND CTBH.VANG = 0
            IF(_rollback = 1) THEN
								BEGIN
									ROLLBACK;
										# SELECT -1 as result_code, 'Lỗi chốt điểm danh. Thử lại!' as message;
										# throw error
                                        # custion number code by using MYSQL_ERRNO 
										# To signal a generic SQLSTATE value, use '45000', which means “unhandled user-defined exception.”.
										 SIGNAL SQLSTATE '45000' SET MYSQL_ERRNO = 500;	
                                    LEAVE exit_label;
                                END;
            ELSE /* _rollback = 0 */
				COMMIT;
			END IF;
		END; /* end then */
    END IF;    
	
    UPDATE thoi_khoa_bieu SET CHOTDIEMDANH = b'1', GHICHU = pGHICHU WHERE IDBUOIHOC = @idbuoihoc AND MALTC = pMALTC;
    
    /* return result message */
    IF(row_count() > 0) THEN
			SELECT 'Chốt điểm danh thành công' as message;
	ELSE
			SELECT 'Lỗi chốt điểm danh. Thử lại!' as message;
            # throw error
			# custion number code by using MYSQL_ERRNO 
			# To signal a generic SQLSTATE value, use '45000', which means “unhandled user-defined exception.”.
			#SIGNAL SQLSTATE '45000' SET MYSQL_ERRNO = 500;
    END IF; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_HuyTheDiemDanh` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_HuyTheDiemDanh`( pMASV CHAR(10), pMALTC INT)
BEGIN
  UPDATE ht_diemdanh.dang_ky SET THEDIEMDANH = NULL WHERE MASV = pMASV AND MALTC = pMALTC;
  SELECT 'Hủy thành công' AS message; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_layDanhSachDiemDanhSinhVienTheoTKB_LTC` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_layDanhSachDiemDanhSinhVienTheoTKB_LTC`(pMALTC INT, pNGAYHOC DATE, pTIETHOC VARCHAR(5), filterByName VARCHAR(50), filterByVang INT )
BEGIN
	# filterByName default value: '' (empty
    # filterByVang default value: null
	SET @idbuoihoc = (SELECT IDBUOIHOC FROM buoi_hoc WHERE NGAYHOC = pNGAYHOC AND TIETHOC = pTIETHOC);
   
    SELECT ThongTinSV.MASV,ThongTinSV.hoten, ThongTinSV.MALOP, ThongTinSV.TENLOP, CTBH.VANG
	FROM
		(SELECT SV_SVDK.MASV,SV_SVDK.hoten, SV_SVDK.MALOP, L.TENLOP, SV_SVDK.IDDANGKY
		FROM
			(SELECT SV.MALOP, SV.MASV, SV.hoten, SVDK.IDDANGKY
			FROM (SELECT CONCAT(HO,' ',TEN) AS hoten, MALOP, MASV FROM sinh_vien ) SV
			INNER JOIN (SELECT * FROM dang_ky WHERE MALTC = pMALTC) SVDK
			ON SV.MASV = SVDK.MASV AND IF(filterByName ='', true, SV.hoten LIKE CONCAT('%',filterByName,'%'))) SV_SVDK # CreatedTable1  
		INNER JOIN lop L
		ON SV_SVDK.MALOP = L.MALOP) ThongTinSV # CreatedTable2
	INNER JOIN chi_tiet_buoi_hoc CTBH
	ON CTBH.IDDANGKY = ThongTinSV.IDDANGKY AND CTBH.IDBUOIHOC = @idbuoihoc AND IF(filterByVang = -1, true, CTBH.VANG = filterByVang); 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_layDanhSachLTCCuaSV` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_layDanhSachLTCCuaSV`(pMASV CHAR(10))
BEGIN
	CREATE TEMPORARY TABLE IF NOT EXISTS LTC_OPENING SELECT * FROM (SELECT MALTC, NIENKHOA, HOCKY, NHOM, MAMH FROM lop_tin_chi WHERE TRANGTHAILOPHOC='DANGMO') Table1;
    
	CREATE TEMPORARY TABLE IF NOT EXISTS all_LTC_cua_sinh_vien SELECT * FROM (SELECT MALTC FROM dang_ky WHERE MASV = pMASV) Table2;
    
	CREATE TEMPORARY TABLE IF NOT EXISTS LTC_cua_sinh_vien_hien_tai SELECT * FROM (SELECT ltcOPENING.MALTC, ltcOPENING.MAMH, ltcOPENING.NIENKHOA, ltcOPENING.HOCKY, ltcOPENING.NHOM
																			   FROM LTC_OPENING ltcOPENING 
																			   INNER JOIN all_LTC_cua_sinh_vien all_LTC_SV
																			   ON ltcOPENING.MALTC = all_LTC_SV.MALTC) Table3;
                                                                               
	SELECT LTC_HT.MALTC, CONCAT(MH.TENMH, ' - ','Nhóm ', LTC_HT.NHOM,' - ', 'Học kỳ ', LTC_HT.HOCKY,' - ','Niên khóa: ', LTC_HT.NIENKHOA) AS thongTinLopHoc
	FROM LTC_cua_sinh_vien_hien_tai LTC_HT
	INNER JOIN mon_hoc MH 
	ON MH.MAMH = LTC_HT.MAMH;

	# remove temporary table
	DROP TABLE IF EXISTS LTC_OPENING;
	DROP TABLE IF EXISTS all_LTC_cua_sinh_vien;
	DROP TABLE IF EXISTS LTC_cua_sinh_vien_hien_tai;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_layGhiChuCuaBuoiHoc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_layGhiChuCuaBuoiHoc`(pMALTC INT, pNGAYHOC DATE, pTIETHOC VARCHAR(5))
BEGIN
	SET @idbuoihoc = (SELECT IDBUOIHOC FROM buoi_hoc WHERE NGAYHOC = pNGAYHOC AND TIETHOC = pTIETHOC);
    
    SELECT GHICHU FROM thoi_khoa_bieu WHERE IDBUOIHOC=@idbuoihoc AND MALTC=pMALTC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_locTopSoLuongSinhVienVangNhieu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_locTopSoLuongSinhVienVangNhieu`(pMALTC INT, pSOLUONG INT)
BEGIN
	CREATE TEMPORARY TABLE IF NOT EXISTS SL_buoi_vang_table SELECT * FROM (SELECT DS_SVDK.IDDANGKY, DS_SVDK.MASV,COUNT(IF(CTBH.VANG = 0, 1, null)) AS SOBUOIVANG
	FROM chi_tiet_buoi_hoc CTBH 
	INNER JOIN (SELECT * FROM dang_ky WHERE MALTC = pMALTC) DS_SVDK
	ON CTBH.IDDANGKY = DS_SVDK.IDDANGKY
    INNER JOIN (SELECT * FROM thoi_khoa_bieu WHERE MALTC = pMALTC AND CHOTDIEMDANH = b'1') TKB
    ON CTBH.IDBUOIHOC = TKB.IDBUOIHOC
	GROUP BY IDDANGKY) Temptable1 ;

	SELECT SV.MASV, CONCAT(SV.HO,' ',SV.TEN) as HOTEN, IF(SV.PHAI, 'Nữ', 'Nam') AS PHAI, SV.MALOP, SLBV.SOBUOIVANG
	FROM sinh_vien SV  USE INDEX (idx_MALOP_TEN_HO)
	INNER JOIN SL_buoi_vang_table SLBV 
	ON SV.MASV = SLBV.MASV AND SLBV.SOBUOIVANG > 0
	ORDER BY SOBUOIVANG DESC
	LIMIT pSOLUONG;
    
    # drop temporary table
    DROP TABLE SL_buoi_vang_table;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_quaTrinhDiemDanhCuaMotSinhVienTheoLTC` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_quaTrinhDiemDanhCuaMotSinhVienTheoLTC`(pMALTC INT, pMASV CHAR(10),filterByTrangThaiVang INT)
BEGIN
	SELECT IDDANGKY INTO @sinhvien_dangky FROM dang_ky WHERE MALTC = pMALTC AND MASV= pMASV;
	
    DROP TABLE IF EXISTS TempTable1;
	CREATE TEMPORARY TABLE IF NOT EXISTS TempTable1
	SELECT * 
	FROM (SELECT TKB.IDBUOIHOC, CTBH_SVDK.VANG
		  FROM thoi_khoa_bieu TKB
	      INNER JOIN (SELECT VANG, IDBUOIHOC FROM chi_tiet_buoi_hoc WHERE IDDANGKY= @sinhvien_dangky AND IF(filterByTrangThaiVang = -1, true, VANG = filterByTrangThaiVang)) CTBH_SVDK
	      ON TKB.IDBUOIHOC = CTBH_SVDK.IDBUOIHOC AND TKB.MALTC=pMALTC
          WHERE TKB.CHOTDIEMDANH = b'1') TKB_SVDK;

	SELECT BH.NGAYHOC, BH.TIETHOC, TT1.VANG
	FROM buoi_hoc BH
	INNER JOIN TempTable1 TT1
	ON BH.IDBUOIHOC = TT1.IDBUOIHOC;

	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_xacThucGiangVien` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_xacThucGiangVien`(pMAGV INT, pPASSWORD VARCHAR(45))
BEGIN
	#SET @magv = (SELECT MAGV FROM giang_vien WHERE MAGV = pMAGV);
    declare varMagv int;
    declare varHoten varchar(60);
	SELECT MAGV, CONCAT(HO,' ',TEN) AS HOTEN INTO varMagv,varHoten FROM giang_vien WHERE MAGV = pMAGV AND PASSWORD=pPASSWORD ;
	IF(varMagv IS NOT NULL) THEN 
						BEGIN
							SELECT 'Đăng nhập thành công' as message, varHoten as HOTEN; 
                        END;
    ELSE 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Mã giảng viên hoặc mật khẩu không hợp lệ!', MYSQL_ERRNO = 500;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_xacThucSinhVien` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_xacThucSinhVien`(pMASV VARCHAR(10),pPASSWORD VARCHAR(45))
BEGIN	
	# Dùng SELECT này khi muốn vừa lưu KẾT QUẢ vào BIẾN vừa trả về tập Truy vấn
	#SELECT @masv:=MASV, @hoten:=CONCAT(HO,' ',TEN), @phai:=PHAI, @ngaysinh:=NGAYSINH, @malop:=MALOP FROM sinh_vien WHERE MASV = pMASV;
    declare varMasv varchar(10);
    declare varHoten varchar(60);
    declare varPhai varchar (5);
    declare varNgaysinh date;
    declare varMalop varchar(10);
    
    # Dùng SELECT này khi chỉ muốn lưu KẾT QUẢ vào BIẾN và không trả về tập Truy vấn
	SELECT MASV,
		   CONCAT(HO,' ',TEN),
           CASE WHEN PHAI = b'0' THEN 'Nam'
				ELSE 'Nữ'
		   END,
           NGAYSINH,
           MALOP
           INTO
           varMasv,
           varHoten,
           varPhai,
           varNgaysinh,
           varMalop
	FROM sinh_vien WHERE MASV = pMASV AND PASSWORD=pPASSWORD ;
	IF(varMasv IS NOT NULL) THEN 
						BEGIN
							SELECT 'Đăng nhập thành công' as message, varHoten as HOTEN, varPhai as PHAI,varNgaysinh as NGAYSINH, varMalop as MALOP; 
                        END;
    ELSE 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Mã sinh viên hoặc mật khẩu không hợp lệ!', MYSQL_ERRNO = 500;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_xuatLopTinChiTheoMaGV` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_xuatLopTinChiTheoMaGV`(pMAGV INT)
BEGIN
	SELECT LTC.MALTC, CONCAT(MH.TENMH,' - ','Nhóm ',LTC.NHOM,' - ', 'Học kỳ ',LTC.HOCKY,' - ','Niên khóa: ', LTC.NIENKHOA) AS thongTinLopHoc
    FROM lop_tin_chi LTC, mon_hoc MH
    WHERE MAGV = pMAGV AND LTC.MAMH = MH.MAMH AND TRANGTHAILOPHOC = 'DANGMO'
    ORDER BY thongTinLopHoc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_xuatNgayHocCuaMotLTC` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_xuatNgayHocCuaMotLTC`(pMALTC INT, pCHOTDIEMDANH BIT)
BEGIN
	# Để ý kiểu bit để set giá trị: b' '
    # ...................................
	SELECT DISTINCT BH.NGAYHOC
	FROM (SELECT MALTC, IDBUOIHOC FROM thoi_khoa_bieu WHERE MALTC = pMALTC AND CHOTDIEMDANH = pCHOTDIEMDANH) TKB
	INNER JOIN buoi_hoc BH
	ON TKB.IDBUOIHOC = BH.IDBUOIHOC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_xuatThongTinTatCaSinhVienCuaLopTinChi` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_xuatThongTinTatCaSinhVienCuaLopTinChi`(pMALTC INT, filterbyMASV CHAR(50), filterByTrangThaiTheDiemDanh BOOLEAN )
BEGIN
	SELECT SV_SVDK.MASV, SV_SVDK.hoten, SV_SVDK.MALOP, L.TENLOP, L.KHOAHOC, SV_SVDK.theDiemDanh
	FROM (
	SELECT SVDK.MASV, CONCAT(SV.HO,' ', SV.TEN) AS hoten, SVDK.theDiemDanh, SV.MALOP
	FROM sinh_vien SV
	INNER JOIN (SELECT * FROM dang_ky WHERE MALTC = pMALTC) SVDK
	ON SV.MASV = SVDK.MASV) SV_SVDK 
	INNER JOIN lop L
	ON SV_SVDK.MALOP = L.MALOP
    WHERE MASV LIKE CONCAT('%',filterbyMASV,'%') AND IF(filterByTrangThaiTheDiemDanh = false,theDiemDanh IS NULL, true);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_xuatTietHocCuaMotLTC` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_xuatTietHocCuaMotLTC`(pMALTC INT, pCHOTDIEMDANH BIT)
BEGIN
# Để ý kiểu bit để set giá trị: b' '
    # ...................................
	SELECT DISTINCT BH.TIETHOC
	FROM (SELECT MALTC, IDBUOIHOC FROM thoi_khoa_bieu WHERE MALTC = pMALTC AND CHOTDIEMDANH = pCHOTDIEMDANH) TKB
	INNER JOIN buoi_hoc BH
	ON TKB.IDBUOIHOC = BH.IDBUOIHOC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-17 19:33:43
