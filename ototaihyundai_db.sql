-- phpMyAdmin SQL Dump
-- version 3.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 27, 2016 at 05:37 AM
-- Server version: 5.5.25a
-- PHP Version: 5.4.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ototaihyundai_db`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_dashboardStatistic`()
begin	
        select count(ID) as Number     
        from mailcontact
        union
        select count(ID) as Number
        from myclient
        union
        select sum(NumOfTime) as Number       
        from visitor
        union
        select count(ID) as Number
        from myteam;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_widgetSortable`(IN table_name VARCHAR(40))
BEGIN
 SET @t1 =CONCAT('SELECT * FROM ',table_name );
 PREPARE stmt3 FROM @t1;
 EXECUTE stmt3;
 DEALLOCATE PREPARE stmt3;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE IF NOT EXISTS `articles` (
  `ArtID` int(11) NOT NULL AUTO_INCREMENT,
  `ArtName` text COLLATE utf8_unicode_ci,
  `ArtDescribes` text COLLATE utf8_unicode_ci,
  `ArtMeta` text COLLATE utf8_unicode_ci,
  `Image` text COLLATE utf8_unicode_ci,
  `DateCreated` datetime DEFAULT NULL,
  `CatId` int(11) DEFAULT NULL,
  `Author` int(11) DEFAULT NULL,
  `ViewCount` int(11) DEFAULT '0',
  `Content` longtext COLLATE utf8_unicode_ci,
  `Status` tinyint(4) DEFAULT '1',
  `TempId` int(11) DEFAULT NULL,
  `Price` varchar(255) COLLATE utf8_unicode_ci DEFAULT '0',
  `Discount` varchar(255) COLLATE utf8_unicode_ci DEFAULT '0',
  `Type` int(11) DEFAULT '1',
  `Manufacture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Estimate` text COLLATE utf8_unicode_ci,
  `PhoneContact` text COLLATE utf8_unicode_ci,
  `Video` text COLLATE utf8_unicode_ci,
  `Facebook` text COLLATE utf8_unicode_ci,
  `Youtube` text COLLATE utf8_unicode_ci,
  `Google` text COLLATE utf8_unicode_ci,
  `Twitter` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ArtID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=22 ;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`ArtID`, `ArtName`, `ArtDescribes`, `ArtMeta`, `Image`, `DateCreated`, `CatId`, `Author`, `ViewCount`, `Content`, `Status`, `TempId`, `Price`, `Discount`, `Type`, `Manufacture`, `Estimate`, `PhoneContact`, `Video`, `Facebook`, `Youtube`, `Google`, `Twitter`) VALUES
(6, 'Giới thiệu', '', 'vi/gioi-thieu', '', '2016-08-15 22:04:44', 0, 1, 14, '', 1, 3, '0', '0', 1, '', '', '', '', NULL, NULL, NULL, NULL),
(7, 'Hỗ trợ', '', 'vi/ho-tro', '', '2016-08-15 22:23:04', 0, 1, 3, '', 1, 1, '0', '0', 1, '', '', '', '', NULL, NULL, NULL, NULL),
(8, 'TỦ GỖ', '<p>Tủ gỗ gọn và sang trọng trong phòng khách</p>\n', 'vi/san-pham/tu-go', 'assets/includes/upload/images/w-1.jpg', '2016-08-16 14:02:39', 2, 1, 3, '<h2><span style="font-size:14px;">Ưu điểm:</span></h2>\n\n<p>+ Cách âm, cách nhiệt tốt<br />\n+ Sử dụng chốt đa điểm, đảm bảo độ kín, khít cao<br />\n+ Khung cửa vững chắc nhờ được làm từ profile định hình có kích thước lớn</p>\n\n<p>+ Phù hợp với tập quán sử dụng của người Việt Nam.</p>\n\n<p><img alt="http://austdoor.info/kinheditor/attached/image/20150825/20150825161256_64210.jpg" src="http://austdoor.info/kinheditor/attached/image/20150825/20150825161256_64210.jpg" /></p>\n', 1, 6, '0', '0', 2, 'Long Thịnh Phát', '', '', '', NULL, NULL, NULL, NULL),
(9, 'CỬA SỔ 3 CÁNH', '<p>Cửa sổ 3 cánh kiểu dáng Châu Âu.</p>\n', 'vi/san-pham/cua-so-3-canh', 'assets/includes/upload/images/w-2.jpg', '2016-08-16 14:12:05', 2, 1, 22, '', 1, 6, '3 000 000', '2 500 000', 2, 'Long Thịnh Phát', '', '01268 673 096', '', NULL, NULL, NULL, NULL),
(10, 'GHẾ NỆM SOFA TRẮNG', '<p>Ghế nệm sofa màu trắng dành cho phòng khách.</p>\n', 'vi/san-pham/ghe-nem-sofa-trang', 'assets/includes/upload/images/w-3.jpg', '2016-08-16 14:14:19', 2, 1, 6, '', 1, 6, '0', '0', 2, 'Long Thịnh Phát', '', '', '', NULL, NULL, NULL, NULL),
(11, 'Khuyến mãi', 'Thông tin các chương trình khuyến mãi của chúng tôi.', 'vi/khuyen-mai', 'assets/includes/upload/images/n-1.jpg', '2016-08-16 15:53:35', 7, 1, 37, '', 1, 1, '0', '0', 1, '', '', '', '', NULL, NULL, NULL, NULL),
(12, 'Sự kiện', 'Thông tin sự kiện của chúng tôi.', 'vi/su-kien', 'assets/includes/upload/images/n-2.jpg', '2016-08-16 15:55:42', 7, 1, 7, '', 1, 1, '0', '0', 1, '', '', '', '', NULL, NULL, NULL, NULL),
(13, 'Hoạt động', 'Các hoạt động của chúng tôi.', 'vi/hoat-dong', 'assets/includes/upload/images/n-3.jpg', '2016-08-16 15:57:33', 7, 1, 0, '', 1, 3, '0', '0', 1, '', '', '', '', NULL, NULL, NULL, NULL),
(14, 'Bảng báo giá', 'Thông tin về giá các sản phẩm của chúng tôi.', 'vi/bang-bao-gia', '', '2016-08-20 23:58:03', 0, 1, 0, '', 1, 1, '0', '0', 1, '', '', '', '', NULL, NULL, NULL, NULL),
(15, 'Nhạc hay', '', 'vi/nhac-hay', '', '2016-08-28 11:24:22', 11, 1, 9, '', 1, 1, '0', '0', 1, '', '', '', '<iframe width="560" height="315" src="https://www.youtube.com/embed/EAp6M8Ln4Ug?list=RD3BE0D9geu2o" frameborder="0" allowfullscreen></iframe>', NULL, NULL, NULL, NULL),
(16, 'Zack Hemsey', '', 'zack-hemsey', '', '2016-08-28 12:08:55', 11, 1, 0, '', 1, 1, '0', '0', 1, '', '', '', '<iframe width="560" height="315" src="https://www.youtube.com/embed/lCGlIjLT8OQ?list=RD3BE0D9geu2o" frameborder="0" allowfullscreen></iframe>', '', '', '', ''),
(17, 'Giường ngủ', '', 'vi/san-pham/giuong-ngu', 'assets/includes/upload/images/b2.jpg', '2016-08-28 14:53:26', 2, 1, 0, '', 1, 6, '0', '0', 2, '', '', '', '', NULL, NULL, NULL, NULL),
(18, 'Giường gỗ', '', 'vi/san-pham/giuong-go', 'assets/includes/upload/images/b5.jpg', '2016-08-28 14:56:08', 2, 1, 0, '', 1, 6, '0', '0', 2, '', '', '', '', NULL, NULL, NULL, NULL),
(19, 'Phòng bếp sang trọng', '', 'vi/san-pham/phong-bep-sang-trong', 'assets/includes/upload/images/r-4.jpg', '2016-08-28 15:02:03', 10, 1, 0, '', 1, 6, '0', '0', 2, '', '', '', '', NULL, NULL, NULL, NULL),
(20, 'Test', '', 'san-pham/test', '', '2016-08-29 14:20:59', 2, 1, 15, '', 1, 6, '0', '0', 2, '', '', '', '<iframe width="560" height="315" src="https://www.youtube.com/embed/MTPxWUs8nXs?list=RD3BE0D9geu2o" frameborder="0" allowfullscreen></iframe>', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE IF NOT EXISTS `banner` (
  `BannerId` int(11) NOT NULL AUTO_INCREMENT,
  `Logo` text COLLATE utf8_unicode_ci,
  `Banner` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`BannerId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=41 ;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`BannerId`, `Logo`, `Banner`) VALUES
(40, 'assets/includes/upload/images/ltp130x130.png', 'assets/includes/upload/images/banner.PNG');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `CatID` int(11) NOT NULL AUTO_INCREMENT,
  `CatName` text COLLATE utf8_unicode_ci,
  `CatMeta` text COLLATE utf8_unicode_ci,
  `CatDescribes` text COLLATE utf8_unicode_ci,
  `TempId` int(11) DEFAULT NULL,
  `Type` int(11) DEFAULT '1',
  `CatParent` int(11) DEFAULT NULL,
  PRIMARY KEY (`CatID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=17 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`CatID`, `CatName`, `CatMeta`, `CatDescribes`, `TempId`, `Type`, `CatParent`) VALUES
(2, 'Sản phẩm', 'vi/danh-muc/san-pham', 'Các sản phẩm của chúng tôi luôn mang lại cho bạn chất lượng cao nhất.', 5, 2, 0),
(3, 'Cửa cuốn LTP', 'vi/danh-muc/cua-cuon-ltp', '', 5, 2, 2),
(4, 'Cửa nhựa lõi thép UPVC', 'vi/danh-muc/cua-nhua-loi-thep-upvc', '', 5, 2, 2),
(5, 'Cửa nhôm cao cấp', 'vi/danh-muc/cua-nhom-cao-cap', '', 5, 2, 2),
(6, 'Cửa gỗ Huge', 'vi/danh-muc/cua-go-huge', 'Cửa gỗ cao cấp.', 5, 2, 2),
(7, 'Tin tức', 'vi/tin-tuc', 'Nơi chứa thông tin & tin tức sự kiện của chúng tôi.', 4, 1, 0),
(8, 'Dv Trọn gói', 'vi/dv-tron-goi', '', 4, 1, 0),
(10, 'Dự án', 'vi/danh-muc/du-an', '', 5, 2, 0),
(11, 'Video', 'vi/video', '', 4, 1, 0),
(12, 'Nhôm - Kính', 'vi/danh-muc/nhom-kinh', '', 5, 2, 0),
(14, 'Tủ kệ trưng bày', 'vi/danh-muc/tu-ke-trung-bay', '', 5, 2, 0),
(15, 'Quảng cáo', 'quang-cao', '', 4, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `information`
--

CREATE TABLE IF NOT EXISTS `information` (
  `InformId` int(11) NOT NULL AUTO_INCREMENT,
  `Name` text COLLATE utf8_unicode_ci,
  `Email` text COLLATE utf8_unicode_ci,
  `Phone` text COLLATE utf8_unicode_ci,
  `Facebook` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`InformId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `information`
--

INSERT INTO `information` (`InformId`, `Name`, `Email`, `Phone`, `Facebook`) VALUES
(1, 'LONG THỊNH PHÁT', 'monpham2310@gmail.com', '01268 673 096', 'https://www.facebook.com/profile.php?id=100013160436586');

-- --------------------------------------------------------

--
-- Table structure for table `mailcontact`
--

CREATE TABLE IF NOT EXISTS `mailcontact` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` text COLLATE utf8_unicode_ci,
  `Email` text COLLATE utf8_unicode_ci,
  `Subject` text COLLATE utf8_unicode_ci,
  `Content` text COLLATE utf8_unicode_ci,
  `DateSent` datetime DEFAULT NULL,
  `Phone` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `mailcontact`
--

INSERT INTO `mailcontact` (`ID`, `Name`, `Email`, `Subject`, `Content`, `DateSent`, `Phone`) VALUES
(1, 'Pham Van A', 'phamvana@gmail.com', 'Xin chào!', 'Xin chào quý khách!', NULL, '0123456789'),
(2, 'Pham Van A', 'phamvana@gmail.com', 'Xin chào!', 'alo', NULL, '0123456789'),
(3, 'Pham Van A', 'phamvana@gmail.com', 'Xin chào!', 'alo', '2016-08-19 11:13:02', '0123456789'),
(4, 'Mon', 'monpham2310@gmail.com', 'Test', 'Liên hệ', '2016-08-19 22:38:54', '01268673096');

-- --------------------------------------------------------

--
-- Table structure for table `map`
--

CREATE TABLE IF NOT EXISTS `map` (
  `MapID` int(11) NOT NULL AUTO_INCREMENT,
  `Address` text COLLATE utf8_unicode_ci,
  `Lattitude` double DEFAULT NULL,
  `Longitude` double DEFAULT NULL,
  `Phone` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`MapID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `map`
--

INSERT INTO `map` (`MapID`, `Address`, `Lattitude`, `Longitude`, `Phone`) VALUES
(1, 'Công ty Vnapptech, Khu Phố 4, Hố Nai, Bien Hoa, Dong Nai, Vietnam', 10.963153, 106.789722, '0123 456 789'),
(2, '12 Hồ Văn Thể khu phố 1 p, Tam Hòa tp. Biên Hòa Đồng Nai Vietnam', 10.942236, 106.864159, '0613 813 888');

-- --------------------------------------------------------

--
-- Table structure for table `myclient`
--

CREATE TABLE IF NOT EXISTS `myclient` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` text COLLATE utf8_unicode_ci,
  `Estimate` text COLLATE utf8_unicode_ci,
  `Image` text COLLATE utf8_unicode_ci,
  `Address` text COLLATE utf8_unicode_ci,
  `Phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `navigates`
--

CREATE TABLE IF NOT EXISTS `navigates` (
  `NavID` int(11) NOT NULL AUTO_INCREMENT,
  `NavName` text COLLATE utf8_unicode_ci,
  `NavMeta` text COLLATE utf8_unicode_ci,
  `ParentId` int(11) DEFAULT '0',
  `Status` tinyint(4) DEFAULT '1',
  `Position` int(11) DEFAULT '0',
  `Type` tinyint(4) DEFAULT '0',
  `TempId` int(11) DEFAULT '0',
  PRIMARY KEY (`NavID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=25 ;

--
-- Dumping data for table `navigates`
--

INSERT INTO `navigates` (`NavID`, `NavName`, `NavMeta`, `ParentId`, `Status`, `Position`, `Type`, `TempId`) VALUES
(2, 'Tin tức', 'vi/tin-tuc', 0, 1, 6, 0, 0),
(4, 'Giới thiệu', 'vi/gioi-thieu', 0, 1, 2, 0, NULL),
(9, 'Sản phẩm', 'vi/danh-muc/san-pham', 0, 1, 4, 0, NULL),
(12, 'Dự án', 'vi/danh-muc/du-an', 0, 1, 3, 0, NULL),
(13, 'DV Trọn gói', 'vi/dv-tron-goi', 0, 1, 5, 0, NULL),
(14, 'Trang chủ', 'vi/trang-chu', 0, 1, 1, 0, NULL),
(15, 'Liên hệ', 'vi/lien-he', 0, 1, 7, 0, NULL),
(16, 'GHẾ NỆM SOFA TRẮNG', 'vi/san-pham/ghe-nem-sofa-trang', 9, 1, 1, 0, 0),
(17, 'Giường gỗ', 'vi/san-pham/giuong-go', 9, 1, 2, 0, 0),
(23, 'Thư viện ảnh', 'thu-vien-anh', 0, 1, 8, 0, 9);

-- --------------------------------------------------------

--
-- Table structure for table `resourcecate`
--

CREATE TABLE IF NOT EXISTS `resourcecate` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Type` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `resourcecate`
--

INSERT INTO `resourcecate` (`ID`, `Name`, `Type`) VALUES
(1, 'Tủ', 1),
(3, 'Bàn', 1),
(6, 'Giới thiệu', 2);

-- --------------------------------------------------------

--
-- Table structure for table `resources`
--

CREATE TABLE IF NOT EXISTS `resources` (
  `ResID` int(11) NOT NULL AUTO_INCREMENT,
  `ResName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ResCate` int(11) DEFAULT NULL,
  `CateLink` int(11) DEFAULT NULL,
  `ProLink` int(11) DEFAULT NULL,
  `Image` text COLLATE utf8_unicode_ci,
  `Frame` text COLLATE utf8_unicode_ci,
  `File` text COLLATE utf8_unicode_ci,
  `Describes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ResID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Dumping data for table `resources`
--

INSERT INTO `resources` (`ResID`, `ResName`, `ResCate`, `CateLink`, `ProLink`, `Image`, `Frame`, `File`, `Describes`) VALUES
(1, 'Tủ gỗ', 1, 14, 8, 'assets/includes/upload/images/w-1.jpg', '', '', 'Tủ'),
(2, 'Wood Shelf', 2, NULL, NULL, 'assets/includes/upload/images/w-1.jpg', '', '', NULL),
(4, '3', 0, 0, 0, '0', 'assets/includes/upload/images/b3.jpg', '', NULL),
(5, '3', 0, 0, 0, '0', 'assets/includes/upload/images/b3.jpg', '', NULL),
(6, 'Bàn ăn', 3, 0, 0, 'assets/includes/upload/images/b3.jpg', '', '', ''),
(7, 'Giới thiệu về chúng tôi', 6, 0, 0, '', '<iframe width="560" height="315" src="https://www.youtube.com/embed/IcrbM1l_BoI" frameborder="0" allowfullscreen></iframe>', '', NULL),
(8, 'Cửa sổ', 1, 0, 0, 'assets/includes/upload/images/g-1.jpg', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `resourcetype`
--

CREATE TABLE IF NOT EXISTS `resourcetype` (
  `TypeID` int(11) NOT NULL AUTO_INCREMENT,
  `TypeName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`TypeID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `resourcetype`
--

INSERT INTO `resourcetype` (`TypeID`, `TypeName`, `Status`) VALUES
(1, 'Ảnh', 1),
(2, 'Video', 1),
(3, 'Tập tin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE IF NOT EXISTS `services` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` text COLLATE utf8_unicode_ci,
  `Describes` text COLLATE utf8_unicode_ci,
  `Image` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`ID`, `Name`, `Describes`, `Image`) VALUES
(1, 'Tinh tế', 'Với thiết kế đẹp mắt,tao nhã,chúng tôi luôn tạo được ấn tượng tốt trong mắt khách hàng.', 'assets/includes/upload/images/b3.jpg'),
(3, 'Sang trọng', 'Chúng tôi mang đến cho bạn sự sang trọng và quý phái và khách hàng có thể cảm nhận được mình như đang sống trong cung điện.', 'assets/includes/upload/images/o-2.jpg'),
(4, 'Thiết kế đặc biệt', 'Thiết kê đặc biệt theo phong cách riêng của từng khách hàng.', 'assets/includes/upload/images/o-3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `slides`
--

CREATE TABLE IF NOT EXISTS `slides` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Image` text COLLATE utf8_unicode_ci,
  `Describes` text COLLATE utf8_unicode_ci,
  `ProLink` int(11) DEFAULT NULL,
  `CateLink` int(11) DEFAULT NULL,
  `Title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `slides`
--

INSERT INTO `slides` (`ID`, `Image`, `Describes`, `ProLink`, `CateLink`, `Title`) VALUES
(4, 'assets/includes/upload/images/bnr-1.jpg', 'Ghế sofa', 0, 2, 'Sofa'),
(5, 'assets/includes/upload/images/bnr-2.jpg', '', 0, 0, 'Bàn ăn'),
(6, 'assets/includes/upload/images/bnr-3.jpg', '', 8, 2, 'Ghế đan'),
(9, 'assets/includes/upload/images/bnr-4.jpg', '', 0, 0, 'Ghế nệm cao cấp');

-- --------------------------------------------------------

--
-- Table structure for table `templates`
--

CREATE TABLE IF NOT EXISTS `templates` (
  `TempID` int(11) NOT NULL AUTO_INCREMENT,
  `TempName` text COLLATE utf8_unicode_ci,
  `Filename` text COLLATE utf8_unicode_ci,
  `Status` tinyint(4) DEFAULT '1',
  `Type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Meta` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`TempID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=16 ;

--
-- Dumping data for table `templates`
--

INSERT INTO `templates` (`TempID`, `TempName`, `Filename`, `Status`, `Type`, `Meta`) VALUES
(1, 'Full Width', 'fullWidthArticle', 1, 'article', ''),
(2, 'Left Sidebar', 'leftSidebarArticle', 1, 'article', ''),
(3, 'Right Sidebar', 'rightSidebarArticle', 1, 'article', ''),
(4, 'List view', 'listTemplate', 1, 'category', NULL),
(5, 'Grid view', 'gridTemplate', 1, 'category', NULL),
(6, 'Full Width', 'fullWidthProduct', 1, 'product', ''),
(7, 'Left sidebar', 'leftSidebarProduct', 1, 'product', ''),
(8, 'Right sidebar', 'rightSidebarProduct', 1, 'product', ''),
(9, 'Thư viện ảnh', 'gallery', 1, 'page', 'thu-vien-anh'),
(10, 'Trang chủ', 'home', 1, 'page', 'trang-chu'),
(12, 'Liên hệ', 'contact', 1, 'page', 'lien-he');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` text COLLATE utf8_unicode_ci,
  `Email` text COLLATE utf8_unicode_ci,
  `Phone` text COLLATE utf8_unicode_ci,
  `Avatar` text COLLATE utf8_unicode_ci,
  `Password` text COLLATE utf8_unicode_ci,
  `Status` tinyint(4) DEFAULT '1',
  `Permission` text COLLATE utf8_unicode_ci,
  `IsContact` tinyint(4) DEFAULT '0',
  `Facebook` text COLLATE utf8_unicode_ci,
  `Youtube` text COLLATE utf8_unicode_ci,
  `Google` text COLLATE utf8_unicode_ci,
  `Twitter` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `UserName`, `Email`, `Phone`, `Avatar`, `Password`, `Status`, `Permission`, `IsContact`, `Facebook`, `Youtube`, `Google`, `Twitter`) VALUES
(1, 'Mon Pham', 'monpham2310@gmail.com', '01268673096', 'assets/includes/upload/images/users/noimage.jpg', '91ca76fe14d86747af488654fe529f51', 1, 'Admin', 0, '', '', '', ''),
(2, 'Long Thịnh Phát', 'longthinhphatgroup.design@gmail.com', '0121 718 5000', 'assets/includes/upload/images/ltp120x120.png', '06020330d908790f4b18589c75d521ac', 1, 'Admin', 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `visitor`
--

CREATE TABLE IF NOT EXISTS `visitor` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Ip` text COLLATE utf8_unicode_ci,
  `TimeVisit` datetime DEFAULT NULL,
  `NumOfTime` int(11) DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=17 ;

--
-- Dumping data for table `visitor`
--

INSERT INTO `visitor` (`ID`, `Ip`, `TimeVisit`, `NumOfTime`) VALUES
(1, '::1', '2016-08-16 00:00:00', 14),
(2, '::1', '2016-08-17 00:00:00', 157),
(3, '::1', '2016-08-18 00:00:00', 85),
(4, '::1', '2016-08-19 00:00:00', 142),
(5, '::1', '2016-08-20 00:00:00', 34),
(6, '::1', '2016-08-21 00:00:00', 69),
(7, '::1', '2016-08-22 00:00:00', 71),
(8, '::1', '2016-08-23 00:00:00', 88),
(9, '::1', '2016-08-24 00:00:00', 18),
(10, '::1', '2016-08-26 00:00:00', 135),
(11, '::1', '2016-08-27 00:00:00', 37),
(12, '::1', '2016-08-28 00:00:00', 141),
(13, '::1', '2016-08-29 00:00:00', 35),
(14, '::1', '2016-08-30 00:00:00', 73),
(15, '::1', '2016-09-01 00:00:00', 1),
(16, '::1', '2016-09-02 00:00:00', 25);

-- --------------------------------------------------------

--
-- Table structure for table `widgets`
--

CREATE TABLE IF NOT EXISTS `widgets` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` text COLLATE utf8_unicode_ci,
  `Area` text COLLATE utf8_unicode_ci,
  `Status` tinyint(4) DEFAULT '1',
  `Describes` text COLLATE utf8_unicode_ci,
  `Position` int(11) DEFAULT '1',
  `CateID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=50 ;

--
-- Dumping data for table `widgets`
--

INSERT INTO `widgets` (`ID`, `Title`, `Area`, `Status`, `Describes`, `Position`, `CateID`) VALUES
(44, 'Tin tức', 'body', 1, '', 4, 7),
(45, 'Video', 'sidebar', 1, NULL, 1, 11),
(46, 'DV Trọn gói', 'body', 1, NULL, 3, 8),
(47, 'Tủ kệ trưng bày', 'body', 1, '', 1, 6),
(48, 'Sản phẩm', 'body', 1, '', 2, 2);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
