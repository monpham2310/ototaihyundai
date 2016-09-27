-- phpMyAdmin SQL Dump
-- version 3.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 27, 2016 at 01:33 PM
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=21 ;

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
  `CatImg` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`CatID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=17 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=24 ;

-- --------------------------------------------------------

--
-- Table structure for table `resourcecate`
--

CREATE TABLE IF NOT EXISTS `resourcecate` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Type` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `UserName`, `Email`, `Phone`, `Avatar`, `Password`, `Status`, `Permission`, `IsContact`, `Facebook`, `Youtube`, `Google`, `Twitter`) VALUES
(1, 'Mon Pham', 'monpham2310@gmail.com', '01268673096', 'assets/includes/upload/images/users/noimage.jpg', '91ca76fe14d86747af488654fe529f51', 1, 'Admin', 0, '', '', '', ''),
(3, 'Đỗ Tín', 'doquoctin94@gmail.com', '', 'assets/includes/upload/images/users/noimage.jpg', '94b5c4a1fd062fc17f3d837708b7cf2b', 1, 'Admin', 0, NULL, NULL, NULL, NULL),
(4, 'Hoàng Hùng', 'hoanghunglhu@gmail.com', '', 'assets/includes/upload/images/users/noimage.jpg', 'efb1c4e6bdf24f61b762cd6063f0e0f0', 1, 'Admin', 0, NULL, NULL, NULL, NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=49 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
