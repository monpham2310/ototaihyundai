-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 29, 2016 at 06:48 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ototaihyundai_db`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_dashboardStatistic` ()  begin	
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_widgetSortable` (IN `table_name` VARCHAR(40))  BEGIN
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

CREATE TABLE `articles` (
  `ArtID` int(11) NOT NULL,
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
  `Twitter` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`ArtID`, `ArtName`, `ArtDescribes`, `ArtMeta`, `Image`, `DateCreated`, `CatId`, `Author`, `ViewCount`, `Content`, `Status`, `TempId`, `Price`, `Discount`, `Type`, `Manufacture`, `Estimate`, `PhoneContact`, `Video`, `Facebook`, `Youtube`, `Google`, `Twitter`) VALUES
(22, 'Xe Tải Fuso 7t3, FI 7t3, Fuso Fi, Thùng Dài 5m8.', '<p style="box-sizing: border-box; border: 0px; font-family: Roboto, sans-serif; font-size: 14px; margin: 0px 0px 15px; outline: 0px; padding: 0px; vertical-align: baseline; line-height: 21px;">xe tải Fuso 7t3, FI 7t3, fuso fi, thùng dài 5m8.</p>\n\n<p style="box-sizing: border-box; border: 0px; font-family: Roboto, sans-serif; font-size: 14px; margin: 0px 0px 15px; outline: 0px; padding: 0px; vertical-align: baseline; line-height: 21px;"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">Động cơ common rail hiệu suất cao</strong></p>\n\n<p style="box-sizing: border-box; border: 0px; font-family: Roboto, sans-serif; font-size: 14px; margin: 0px 0px 15px; outline: 0px; padding: 0px; vertical-align: baseline; line-height: 21px;">Động cơ common rail, phun nhiên liệu điện tử -16 van kết hợp với turbo tăng áp cho công suất mạnh mẽ và tiết kiệm nhiên liệu.</p>\n\n<p style="box-sizing: border-box; border: 0px; font-family: Roboto, sans-serif; font-size: 14px; margin: 0px 0px 15px; outline: 0px; padding: 0px; vertical-align: baseline; line-height: 21px;"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">Hộp số êm ái, bền bỉ</strong></p>\n\n<p style="box-sizing: border-box; border: 0px; font-family: Roboto, sans-serif; font-size: 14px; margin: 0px 0px 15px; outline: 0px; padding: 0px; vertical-align: baseline; line-height: 21px;">Hộp số 6 cấp cho khả năng sang số êm, dễ dàng thao tác. Đĩa ly hợp được thiết kế đặc biệt từ vật liệu hữu cơ (organic) giúp tối đa khả năng truyền công suất và kéo dài tuổi thọ.</p>\n\n<p style="box-sizing: border-box; border: 0px; font-family: Roboto, sans-serif; font-size: 14px; margin: 0px 0px 15px; outline: 0px; padding: 0px; vertical-align: baseline; line-height: 21px;"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">Thiết kế khí động học</strong></p>\n\n<p style="box-sizing: border-box; border: 0px; font-family: Roboto, sans-serif; font-size: 14px; margin: 0px 0px 15px; outline: 0px; padding: 0px; vertical-align: baseline; line-height: 21px;">Thiết kế cabin mang tính khí động học giúp tiết kiệm nhiên liệu, giảm tiếng ồn và mệt mỏi cho tài xế khi di chuyển trên đường.</p>\n\n<p style="box-sizing: border-box; border: 0px; font-family: Roboto, sans-serif; font-size: 14px; margin: 0px 0px 15px; outline: 0px; padding: 0px; vertical-align: baseline; line-height: 21px;"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">Bảng điều khiển thông minh</strong></p>\n\n<p style="box-sizing: border-box; border: 0px; font-family: Roboto, sans-serif; font-size: 14px; margin: 0px 0px 15px; outline: 0px; padding: 0px; vertical-align: baseline; line-height: 21px;">Bảng hiển thị điện tử bằng đèn LED cung cấp mọi thông tin cho tài xế như: quãng đường đã di chuyển, tốc độ trung bình và mức tiêu hao nhiên liệu.</p>\n\n<p style="box-sizing: border-box; border: 0px; font-family: Roboto, sans-serif; font-size: 14px; margin: 0px 0px 15px; outline: 0px; padding: 0px; vertical-align: baseline; line-height: 21px;"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">Cabin thoải mái, giảm căng thẳng</strong></p>\n\n<p style="box-sizing: border-box; border: 0px; font-family: Roboto, sans-serif; font-size: 14px; margin: 0px 0px 15px; outline: 0px; padding: 0px; vertical-align: baseline; line-height: 21px;">Ghế hơi điều chỉnh đa hướng, tay lái gật gù, sang số mượt mà, kính cửa chỉnh điện, hộp đựng đồ bố trí xung quanh cabin, tất cả mang đến sự tiện nghi và thoải mái trong quá trình vận hành.</p>\n\n<p style="box-sizing: border-box; border: 0px; font-family: Roboto, sans-serif; font-size: 14px; margin: 0px 0px 15px; outline: 0px; padding: 0px; vertical-align: baseline; line-height: 21px;"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">Khung gầm tuổi thọ cao, chịu trọng tải lớn</strong></p>\n\n<p style="box-sizing: border-box; border: 0px; font-family: Roboto, sans-serif; font-size: 14px; margin: 0px 0px 15px; outline: 0px; padding: 0px; vertical-align: baseline; line-height: 21px;">Khung gầm được thiết kế từ thép chịu lực cao, tối đa khả năng chịu tải, cùng với công nghệ “shot-peening” tăng cường độ cứng bề mặt và sơn tĩnh điện giúp chống gỉ sét.</p>\n\n<p style="box-sizing: border-box; border: 0px; font-family: Roboto, sans-serif; font-size: 14px; margin: 0px 0px 15px; outline: 0px; padding: 0px; vertical-align: baseline; line-height: 21px;"><span style="font-family: Roboto, sans-serif; font-size: 14px; line-height: 21px;">Hệ thống treo sau kiểu lá nhíp, đa tầng tăng cường độ cứng vững và bền bỉ, kết hợp ống giảm chấn kép giúp gia tăng sự êm ái.</span></p>\n', 'san-pham/xe-tai-fuso-7t3-fi-7t3-fuso-fi-thung-dai-5m8', 'assets/includes/upload/files/FI1.jpg', '2016-09-29 23:35:41', 2, 3, 0, '<table style="box-sizing: border-box; border: 0px; font-family: Roboto, sans-serif; font-size: 14px; margin: 0px 0px 15px; outline: 0px; padding: 0px; vertical-align: baseline; border-collapse: collapse; border-spacing: 0px; width: 460px; line-height: 21px;">\n	<tbody style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="211"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">Nhãn Hiệu:</strong></td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="427"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">&nbsp;FUSO</strong></td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="211"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">Số Loại:</strong></td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="427"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">&nbsp;FI/TN-TMB-16</strong></td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="211"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">KLBT:</strong></td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="427"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">&nbsp;4.495kg</strong></td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="211"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">Tải Trọng:</strong></td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="427"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">7.300kg</strong></td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="211"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">Tổng Trọng Tải:</strong></td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="427"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">&nbsp;11.990kg</strong></td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="211"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">Kích Thước lòng thùng:</strong></td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="427"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">&nbsp;5.800 x 2.200&nbsp;x 735/2.100 mm ( DxRxC)</strong></td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="211"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">Kích thước tổng thể:</strong></td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="427"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">&nbsp;7.760 x 2.340&nbsp;x 3.380&nbsp;mm ( DxRxC)</strong></td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="211"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">Kiểu động cơ:</strong></td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="427"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">&nbsp;4D37 125</strong></td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="211"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">Loại :</strong></td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="427"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">&nbsp;4 kỳ, 4&nbsp;xilanh thẳng hàng, tăng áp.</strong></td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="211"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">Thể tích làm việc:</strong></td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="427"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">&nbsp;3.907cm3</strong></td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="211"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">Công suất lớn nhất:</strong></td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="427"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">125kW/2.500v/p.</strong></td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="211"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">Cỡ lốp trước/ sau:</strong></td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="427"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">&nbsp;8.25 R20</strong></td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="211"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">Công thức bánh xe</strong></td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="427"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">&nbsp;4×2</strong></td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="211"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">Bảo hành:</strong></td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="427"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">&nbsp;2 năm/ 100.000km</strong></td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="211"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">Tình trạng:</strong></td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="427"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">&nbsp;Mới 100%</strong></td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="211"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">Màu xe:</strong></td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="427"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">&nbsp;Trắng.</strong></td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="211"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">Phụ Kiện kèm theo:</strong></td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="427"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">&nbsp;Đồ nghề theo xe, bánh xe dự phòng, con đội…</strong></td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="211"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">Hộp số:</strong></td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="427"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">&nbsp;6 số tiến, 1 số lùi.</strong></td>\n		</tr>\n	</tbody>\n</table>\n', 1, 6, 'Liên Hệ', '0', 2, NULL, '<p><span style="font-family: Roboto, sans-serif; font-size: 14px; line-height: 21px;">Chưa có đánh giá nào.</span></p>\n', NULL, NULL, NULL, NULL, NULL, NULL),
(23, 'Xe Tải Fuso 15t , Fuso FJ, Fuso 3 Chân, Thùng Dài 9m.', '<p style="box-sizing: border-box; border: 0px; font-family: Roboto, sans-serif; font-size: 14px; margin: 0px 0px 15px; outline: 0px; padding: 0px; vertical-align: baseline; line-height: 21px;">xe tải Fuso 15t , fuso FJ, fuso 3 chân, thùng dài 9m.</p>\n\n<p style="box-sizing: border-box; border: 0px; font-family: Roboto, sans-serif; font-size: 14px; margin: 0px 0px 15px; outline: 0px; padding: 0px; vertical-align: baseline; line-height: 21px;">&nbsp;</p>\n\n<p style="box-sizing: border-box; border: 0px; font-family: Roboto, sans-serif; font-size: 14px; margin: 0px 0px 15px; outline: 0px; padding: 0px; vertical-align: baseline; line-height: 21px;"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">Động cơ mạnh mẽ hơn, tiết kiệm hơn</strong></p>\n\n<p style="box-sizing: border-box; border: 0px; font-family: Roboto, sans-serif; font-size: 14px; margin: 0px 0px 15px; outline: 0px; padding: 0px; vertical-align: baseline; line-height: 21px;">Động cơ diesel với hệ thống phun nhiên liệu trực tiếp cho công suất lên đến 280Ps cùng với moment xoắn tối đa phù hợp với yêu cầu tải trọng cao. Đầu phun nhiên liệu đặc biệt kết hợp với turbo cao áp tối ưu hóa trong quá trình đốt giúp giảm khí thải và tăng hiệu quả. Hệ thống bơm dầu bôi trơn giảm sự mài mòn và tăng độ bền.</p>\n\n<p style="box-sizing: border-box; border: 0px; font-family: Roboto, sans-serif; font-size: 14px; margin: 0px 0px 15px; outline: 0px; padding: 0px; vertical-align: baseline; line-height: 21px;"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">Thiết kế khí động học</strong></p>\n\n<p style="box-sizing: border-box; border: 0px; font-family: Roboto, sans-serif; font-size: 14px; margin: 0px 0px 15px; outline: 0px; padding: 0px; vertical-align: baseline; line-height: 21px;">Thiết kế cabin mang tính khí động học giúp tiết kiệm nhiên liệu, giảm tiếng ồn và mệt mỏi cho tài xế khi di chuyển trên đường.</p>\n\n<p style="box-sizing: border-box; border: 0px; font-family: Roboto, sans-serif; font-size: 14px; margin: 0px 0px 15px; outline: 0px; padding: 0px; vertical-align: baseline; line-height: 21px;"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">Bảng điều khiển thông minh</strong></p>\n\n<p style="box-sizing: border-box; border: 0px; font-family: Roboto, sans-serif; font-size: 14px; margin: 0px 0px 15px; outline: 0px; padding: 0px; vertical-align: baseline; line-height: 21px;">Bảng hiển thị điện tử bằng đèn LED cung cấp mọi thông tin cho tài xế như: quãng đường đã di chuyển, tốc độ trung bình và mức tiêu hao nhiên liệu.</p>\n\n<p style="box-sizing: border-box; border: 0px; font-family: Roboto, sans-serif; font-size: 14px; margin: 0px 0px 15px; outline: 0px; padding: 0px; vertical-align: baseline; line-height: 21px;"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">Cabin thoải mái, giảm căng thẳng</strong></p>\n\n<p style="box-sizing: border-box; border: 0px; font-family: Roboto, sans-serif; font-size: 14px; margin: 0px 0px 15px; outline: 0px; padding: 0px; vertical-align: baseline; line-height: 21px;">Ghế hơi điều chỉnh 3 chiều, tay lái gật gù cho phép tài xế lựa chọn được tư thế lái tốt nhất. Cabin với giường ngủ rộng rãi giúp tài xế nghỉ ngơi thư giãn.</p>\n\n<p style="box-sizing: border-box; border: 0px; font-family: Roboto, sans-serif; font-size: 14px; margin: 0px 0px 15px; outline: 0px; padding: 0px; vertical-align: baseline; line-height: 21px;"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">Hệ thống treo tân tiến</strong></p>\n\n<p style="box-sizing: border-box; border: 0px; font-family: Roboto, sans-serif; font-size: 14px; margin: 0px 0px 15px; outline: 0px; padding: 0px; vertical-align: baseline; line-height: 21px;">Hệ thống treo Parabol trục trước tăng sự êm ái khi lái xe. Trục sau với nhiều lá líp tăng độ cứng, bền bỉ cho khả năng tải hàng hóa nặng.</p>\n\n<p style="box-sizing: border-box; border: 0px; font-family: Roboto, sans-serif; font-size: 14px; margin: 0px 0px 15px; outline: 0px; padding: 0px; vertical-align: baseline; line-height: 21px;"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">An toàn với thanh cân bằng</strong></p>\n\n<p style="box-sizing: border-box; border: 0px; font-family: Roboto, sans-serif; font-size: 14px; margin: 0px 0px 15px; outline: 0px; padding: 0px; vertical-align: baseline; line-height: 21px;">Thanh cân bằng phía trước giúp cải thiện sự trượt và tăng tính ổn định, đặc biệt khi vào cua hay chuyển làn đường ở tốc độ cao.</p>\n\n<p style="box-sizing: border-box; border: 0px; font-family: Roboto, sans-serif; font-size: 14px; margin: 0px 0px 15px; outline: 0px; padding: 0px; vertical-align: baseline; line-height: 21px;"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">Khung gầm tuổi thọ cao, chịu trọng tải lớn</strong></p>\n\n<p style="box-sizing: border-box; border: 0px; font-family: Roboto, sans-serif; font-size: 14px; margin: 0px 0px 15px; outline: 0px; padding: 0px; vertical-align: baseline; line-height: 21px;">Với khung gầm dày, bảng rộng kết hợp với các thanh ngang liên kết tăng cường sự cứng cáp và khả năng chịu tải cao. Công nghệ “Spot-peened” tăng cường độ cứng bề mặt và sơn tĩnh điện giúp chống gỉ sét.</p>\n', 'san-pham/xe-tai-fuso-15t-fuso-fj-fuso-3-chan-thung-dai-9m', 'assets/includes/upload/files/FJ1.jpg', '2016-09-29 23:40:12', 2, 3, 0, '<table style="box-sizing: border-box; border: 0px; font-family: Roboto, sans-serif; font-size: 14px; margin: 0px 0px 15px; outline: 0px; padding: 0px; vertical-align: baseline; border-collapse: collapse; border-spacing: 0px; width: 460px; line-height: 21px;">\n	<tbody style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="211"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">Nhãn Hiệu:</strong></td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="427"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">&nbsp;FUSO</strong></td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="211"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">Số Loại:</strong></td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="427"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">&nbsp;FJY1WT2L/TN-TMB-16</strong></td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="211"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">KLBT:</strong></td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="427"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">&nbsp;8.770kg</strong></td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="211"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">Tải Trọng:</strong></td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="427"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">15.100kg</strong></td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="211"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">Tổng Trọng Tải:</strong></td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="427"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">&nbsp;24.000kg</strong></td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="211"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">Kích Thước lòng thùng:</strong></td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="427"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">&nbsp;9.000 x 2.350&nbsp;x 735/2.150 mm ( DxRxC)</strong></td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="211"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">Kích thước tổng thể:</strong></td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="427"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">&nbsp;11.650 x 2.500 x 3.500&nbsp;mm ( DxRxC)</strong></td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="211"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">Kiểu động cơ:</strong></td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="427"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">&nbsp;6S20205</strong></td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="211"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">Loại :</strong></td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="427"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">&nbsp;4 kỳ, 6&nbsp;xilanh thẳng hàng, tăng áp.</strong></td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="211"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">Thể tích làm việc:</strong></td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="427"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">&nbsp;6.373cm3</strong></td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="211"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">Công suất lớn nhất:</strong></td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="427"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">205kW/2.200v/p.</strong></td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="211"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">Cỡ lốp trước/ sau:</strong></td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="427"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">&nbsp;295/80 R22.5</strong></td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="211"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">Công thức bánh xe</strong></td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="427"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">&nbsp;6×2</strong></td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="211"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">Bảo hành:</strong></td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="427"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">&nbsp;2 năm/ 100.000km</strong></td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="211"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">Tình trạng:</strong></td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="427"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">&nbsp;Mới 100%</strong></td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="211"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">Màu xe:</strong></td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="427"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">&nbsp;Trắng.</strong></td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="211"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">Phụ Kiện kèm theo:</strong></td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="427"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">&nbsp;Đồ nghề theo xe, bánh xe dự phòng, con đội…</strong></td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="211"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">Hộp số:</strong></td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="427"><strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">&nbsp;8 số tiến, 1 số lùi.</strong></td>\n		</tr>\n	</tbody>\n</table>\n', 1, 6, 'Liên Hệ', '0', 2, NULL, '<p><span style="font-family: Roboto, sans-serif; font-size: 14px; line-height: 21px;">Chưa có đánh giá nào.</span></p>\n', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `articles` (`ArtID`, `ArtName`, `ArtDescribes`, `ArtMeta`, `Image`, `DateCreated`, `CatId`, `Author`, `ViewCount`, `Content`, `Status`, `TempId`, `Price`, `Discount`, `Type`, `Manufacture`, `Estimate`, `PhoneContact`, `Video`, `Facebook`, `Youtube`, `Google`, `Twitter`) VALUES
(24, 'Xe Tải ISUZU 2t2, ISUZU QKR55H, Thùng Dài 4m3.', '<p style="box-sizing: border-box; border: 0px; font-family: Roboto, sans-serif; font-size: 14px; margin: 0px 0px 15px; outline: 0px; padding: 0px; vertical-align: baseline; line-height: 21px;">Xe Tải ISUZU 2t2, ISUZU QKR55H, thùng dài 4m3.</p>\n\n<table border="0" cellpadding="0" cellspacing="0" style="box-sizing: border-box; border: 0px; font-family: Roboto, sans-serif; font-size: 14px; margin: 0px 0px 15px; outline: 0px; padding: 0px; vertical-align: baseline; border-collapse: collapse; border-spacing: 0px; width: 958px; line-height: 21px;">\n	<tbody style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="30%">Hãng sản xuất:</td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="70%">ISUZU</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Xuất xứ:</td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Nhật Bản</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Trọng tải:</td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">2.200 kg</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Tổng trọng tải:</td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">4.700 kg</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Kích thước tổng thể:</td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">5915 x 1860 x 2890 mm (dài x rộng x cao)</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Kích thước thùng :</td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">4110 x 1720 x 660/1880 mm (dài x rộng x cao)</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Dung tích xy lanh:</td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">2.771 cc</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Hộp số:</td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">5 số tới, 1 số lùi</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Hệ thống phanh:</td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">thủy lực với bộ trợ lực chân không, mạch kép</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Lốp xe:</td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">7.00-16</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Kiểu ca bin:</td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Ca bin tiêu chuẩn</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Hệ thống trợ lực:</td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Có</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Tiêu chuẩn khí thải:</td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Euro III</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Màu xe:</td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Trắng, bạc</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Phụ kiện kèm theo:</td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Lốp dự phòng, Sổ bảo hành, Đồ nghề sửa xe</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Tình trạng:</td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Mới 100%</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Bảo hành:</td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">3 năm 100.000 Km.</td>\n		</tr>\n	</tbody>\n</table>\n', 'san-pham/xe-tai-isuzu-2t2-isuzu-qkr55h-thung-dai-4m3', 'assets/includes/upload/files/ISUZU-2T2.jpg', '2016-09-29 23:42:24', 4, 3, 0, '<table border="0" cellpadding="0" cellspacing="0" style="box-sizing: border-box; border: 0px; font-family: Roboto, sans-serif; font-size: 14px; margin: 0px 0px 15px; outline: 0px; padding: 0px; vertical-align: baseline; border-collapse: collapse; border-spacing: 0px; width: 460px; line-height: 21px;">\n	<tbody style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="30%">Hãng sản xuất:</td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="70%">ISUZU</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Xuất xứ:</td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Nhật Bản</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Trọng tải:</td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">2.2 tấn</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Tổng trọng tải:</td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">4.700 kg</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Kích thước tổng thể:</td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">5915 x 1860 x 2890 mm (dài x rộng x cao)</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Kích thước thùng :</td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">4110 x 1720 x 660/1880 mm (dài x rộng x cao)</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Dung tích xy lanh:</td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">2.771 cc</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Hộp số:</td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">5 số tới, 1 số lùi</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Hệ thống phanh:</td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">thủy lực với bộ trợ lực chân không, mạch kép</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Lốp xe:</td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">7.00-16</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Kiểu ca bin:</td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Ca bin tiêu chuẩn</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Hệ thống trợ lực:</td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Có</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Tiêu chuẩn khí thải:</td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Euro III</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Màu xe:</td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Trắng, bạc</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Phụ kiện kèm theo:</td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Lốp dự phòng, Sổ bảo hành, Đồ nghề sửa xe</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Tình trạng:</td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Mới 100%</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Bảo hành:</td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">3 năm 100.000 Km.</td>\n		</tr>\n	</tbody>\n</table>\n', 1, 6, 'Liên Hệ', '0', 2, NULL, '<p>Không có đánh giá nào.</p>\n', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `articles` (`ArtID`, `ArtName`, `ArtDescribes`, `ArtMeta`, `Image`, `DateCreated`, `CatId`, `Author`, `ViewCount`, `Content`, `Status`, `TempId`, `Price`, `Discount`, `Type`, `Manufacture`, `Estimate`, `PhoneContact`, `Video`, `Facebook`, `Youtube`, `Google`, `Twitter`) VALUES
(25, 'Xe Tải Isuzu 1.4 Tấn, QKR55F, Xe Tải Nhẹ Vào Thành Phố.', '<p style="box-sizing: border-box; border: 0px; font-family: Roboto, sans-serif; font-size: 14px; margin: 0px 0px 15px; outline: 0px; padding: 0px; vertical-align: baseline; line-height: 21px;">Xe tải Isuzu 1.9 tấn, QKR55F, xe tải nhẹ vào thành phố.</p>\n\n<table border="0" cellpadding="0" cellspacing="0" style="box-sizing: border-box; border: 0px; font-family: Roboto, sans-serif; font-size: 14px; margin: 0px 0px 15px; outline: 0px; padding: 0px; vertical-align: baseline; border-collapse: collapse; border-spacing: 0px; width: 958px; line-height: 21px;">\n	<tbody style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="30%">Hãng sản xuất:</td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="70%">ISUZU</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Xuất xứ:</td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Nhật Bản</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Trọng tải:</td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">1.4 tấn</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Tổng trọng tải:</td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">3.550&nbsp;kg</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Kích thước tổng thể:</td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">5.380 x 1.860 x 2.800 mm (dài x rộng x cao)</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Kích thước thùng :</td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">3.620&nbsp;x 1.780 x 1810 mm (dài x rộng x cao)</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Dung tích xy lanh:</td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">2.771 cc</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Hộp số:</td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">5 số tới, 1 số lùi</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Hệ thống phanh:</td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">thủy lực với bộ trợ lực chân không, mạch kép</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Lốp xe:</td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">7.00-16</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Kiểu ca bin:</td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Ca bin tiêu chuẩn</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Hệ thống trợ lực:</td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Có</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Tiêu chuẩn khí thải:</td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Euro III</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Màu xe:</td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Trắng, bạc</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Phụ kiện kèm theo:</td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Lốp dự phòng, Sổ bảo hành, Đồ nghề sửa xe</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Tình trạng:</td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Mới 100%</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Bảo hành:</td>\n			<td style="box-sizing: border-box; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">3 năm 100.000 Km.</td>\n		</tr>\n	</tbody>\n</table>\n\n<p style="box-sizing: border-box; border: 0px; font-family: Roboto, sans-serif; font-size: 14px; margin: 0px 0px 15px; outline: 0px; padding: 0px; vertical-align: baseline; line-height: 21px;">Xe&nbsp;tải&nbsp;<b style="box-sizing: border-box;">Isuzu QKR55F 1,4T</b>&nbsp;được&nbsp;<strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">Isuzu Nhật Bản</strong>&nbsp;nghiên cứu, thử nghiệm, sản xuất và phân phối tại thị trường Việt Nam từ năm 2012. Dòng xe tải nhẹ này đã đạt được rất nhiều thành công tại thị trường Việt Nam.&nbsp;<strong style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">Isuzu QKR55F</strong>&nbsp;nổi trội so với các dòng xe tải nhẹ khác nhờ khả năng chuyên chở linh hoạt, giá xe rất mềm, cùng mức chi phí sử dụng thấp nhất. Hệ thống lốp trước – sau bằng nhau giúp cải thiện đáng kể những nhược điểm của hệ thống lốp cũ ( lốp sau nhỏ hơn lốp trước).</p>\n\n<p style="box-sizing: border-box; border: 0px; font-family: Roboto, sans-serif; font-size: 14px; margin: 0px 0px 15px; outline: 0px; padding: 0px; vertical-align: baseline; line-height: 21px;">Động cơ Diezel 4JB1 mạnh mẽ, hoạt động cực kỳ bền bỉ và tin cậy với mức tiêu hao nhiên liệu thấp đi cùng tiêu chuẩn an toàn khí thải đạt EURO II.<br style="box-sizing: border-box;" />\n<b style="box-sizing: border-box;">Thùng xe tải Isuzu</b>&nbsp;QKR55F đa dạng, có nhiều loại để khách hàng lựa chọn như: Thùng kín, thùng khung mui phủ bạt, thùng chở xe máy có bửng nâng, thùng đông lạnh, thùng tải lửng… với mức giá phải chăng cùng hồ sơ bản quyền thùng do Cục Đăng Kiểm Việt Nam cấp, đảm bảo cho bạn một chiếc xe như ý.</p>\n\n<p style="box-sizing: border-box; border: 0px; font-family: Roboto, sans-serif; font-size: 14px; margin: 0px 0px 15px; outline: 0px; padding: 0px; vertical-align: baseline; line-height: 21px;">Nội thất xe tải&nbsp;<b style="box-sizing: border-box;">Isuzu QKR55F</b>&nbsp;được thiết kế hiện đại, dễ dàng sử dụng vận hành, hệ thống giải trí CD/Mp3/Usb Radio AM-FM, cửa kính chỉnh điện…giúp bạn luôn thoải mái khi đi những chặng đường dài.</p>\n\n<p style="box-sizing: border-box; border: 0px; font-family: Roboto, sans-serif; font-size: 14px; margin: 0px 0px 15px; outline: 0px; padding: 0px; vertical-align: baseline; line-height: 21px;">Mọi chi tiết xin liên hệ. HotLine: 0911.615.134</p>\n', 'san-pham/xe-tai-isuzu-1-4-tan-qkr55f-xe-tai-nhe-vao-thanh-pho', 'assets/includes/upload/files/Isuzu-1t9.jpg', '2016-09-29 23:46:07', 4, 3, 0, '<table border="0" cellpadding="0" cellspacing="0" style="border: 0px; box-sizing: border-box; font-family: Roboto, sans-serif; font-size: 14px; margin: 0px 0px 15px; outline: 0px; padding: 0px; vertical-align: baseline; border-collapse: collapse; border-spacing: 0px; width: 958px; line-height: 21px;">\n	<tbody style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="border-style: solid; border-color: rgb(204, 204, 204); box-sizing: border-box; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="30%">Hãng sản xuất:</td>\n			<td style="border-style: solid; border-color: rgb(204, 204, 204); box-sizing: border-box; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;" width="70%">ISUZU</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="border-style: solid; border-color: rgb(204, 204, 204); box-sizing: border-box; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Xuất xứ:</td>\n			<td style="border-style: solid; border-color: rgb(204, 204, 204); box-sizing: border-box; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Nhật Bản</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="border-style: solid; border-color: rgb(204, 204, 204); box-sizing: border-box; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Trọng tải:</td>\n			<td style="border-style: solid; border-color: rgb(204, 204, 204); box-sizing: border-box; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">1.4 tấn</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="border-style: solid; border-color: rgb(204, 204, 204); box-sizing: border-box; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Tổng trọng tải:</td>\n			<td style="border-style: solid; border-color: rgb(204, 204, 204); box-sizing: border-box; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">3.550&nbsp;kg</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="border-style: solid; border-color: rgb(204, 204, 204); box-sizing: border-box; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Kích thước tổng thể:</td>\n			<td style="border-style: solid; border-color: rgb(204, 204, 204); box-sizing: border-box; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">5.380 x 1.860 x 2.800 mm (dài x rộng x cao)</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="border-style: solid; border-color: rgb(204, 204, 204); box-sizing: border-box; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Kích thước thùng :</td>\n			<td style="border-style: solid; border-color: rgb(204, 204, 204); box-sizing: border-box; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">3.620&nbsp;x 1.780 x 1810 mm (dài x rộng x cao)</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="border-style: solid; border-color: rgb(204, 204, 204); box-sizing: border-box; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Dung tích xy lanh:</td>\n			<td style="border-style: solid; border-color: rgb(204, 204, 204); box-sizing: border-box; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">2.771 cc</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="border-style: solid; border-color: rgb(204, 204, 204); box-sizing: border-box; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Hộp số:</td>\n			<td style="border-style: solid; border-color: rgb(204, 204, 204); box-sizing: border-box; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">5 số tới, 1 số lùi</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="border-style: solid; border-color: rgb(204, 204, 204); box-sizing: border-box; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Hệ thống phanh:</td>\n			<td style="border-style: solid; border-color: rgb(204, 204, 204); box-sizing: border-box; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">thủy lực với bộ trợ lực chân không, mạch kép</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="border-style: solid; border-color: rgb(204, 204, 204); box-sizing: border-box; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Lốp xe:</td>\n			<td style="border-style: solid; border-color: rgb(204, 204, 204); box-sizing: border-box; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">7.00-16</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="border-style: solid; border-color: rgb(204, 204, 204); box-sizing: border-box; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Kiểu ca bin:</td>\n			<td style="border-style: solid; border-color: rgb(204, 204, 204); box-sizing: border-box; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Ca bin tiêu chuẩn</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="border-style: solid; border-color: rgb(204, 204, 204); box-sizing: border-box; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Hệ thống trợ lực:</td>\n			<td style="border-style: solid; border-color: rgb(204, 204, 204); box-sizing: border-box; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Có</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="border-style: solid; border-color: rgb(204, 204, 204); box-sizing: border-box; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Tiêu chuẩn khí thải:</td>\n			<td style="border-style: solid; border-color: rgb(204, 204, 204); box-sizing: border-box; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Euro III</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="border-style: solid; border-color: rgb(204, 204, 204); box-sizing: border-box; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Màu xe:</td>\n			<td style="border-style: solid; border-color: rgb(204, 204, 204); box-sizing: border-box; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Trắng, bạc</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="border-style: solid; border-color: rgb(204, 204, 204); box-sizing: border-box; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Phụ kiện kèm theo:</td>\n			<td style="border-style: solid; border-color: rgb(204, 204, 204); box-sizing: border-box; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Lốp dự phòng, Sổ bảo hành, Đồ nghề sửa xe</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="border-style: solid; border-color: rgb(204, 204, 204); box-sizing: border-box; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Tình trạng:</td>\n			<td style="border-style: solid; border-color: rgb(204, 204, 204); box-sizing: border-box; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Mới 100%</td>\n		</tr>\n		<tr style="box-sizing: border-box; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;">\n			<td class="tieude" style="border-style: solid; border-color: rgb(204, 204, 204); box-sizing: border-box; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">Bảo hành:</td>\n			<td style="border-style: solid; border-color: rgb(204, 204, 204); box-sizing: border-box; font-family: inherit; font-style: inherit; margin: 0px; outline: 0px; padding: 5px 10px; vertical-align: baseline;">3 năm 100.000 Km.</td>\n		</tr>\n	</tbody>\n</table>\n', 1, 6, 'Liên Hệ', '0', 2, NULL, '<p>Không có đánh giá nào.</p>\n', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE `banner` (
  `BannerId` int(11) NOT NULL,
  `Logo` text COLLATE utf8_unicode_ci,
  `Banner` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `CatID` int(11) NOT NULL,
  `CatName` text COLLATE utf8_unicode_ci,
  `CatMeta` text COLLATE utf8_unicode_ci,
  `CatDescribes` text COLLATE utf8_unicode_ci,
  `TempId` int(11) DEFAULT NULL,
  `Type` int(11) DEFAULT '1',
  `CatParent` int(11) DEFAULT NULL,
  `CatImg` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`CatID`, `CatName`, `CatMeta`, `CatDescribes`, `TempId`, `Type`, `CatParent`, `CatImg`) VALUES
(1, 'XE TẢI DONGFENG', 'danh-muc/xe-tai-dongfeng', 'XE TẢI DONGFENG', 5, 2, 0, 'assets/includes/upload/files/1403668553365882-345x265.png'),
(2, 'XE TẢI FUSO', 'danh-muc/xe-tai-fuso', 'XE TẢI FUSO', 5, 2, 0, 'assets/includes/upload/files/Fuso.png'),
(3, 'XE TẢI HYUNDAI', 'danh-muc/xe-tai-hyundai', 'XE TẢI HYUNDAI', 5, 2, 0, 'assets/includes/upload/files/cropped-huynhdai.png'),
(4, 'XE TẢI ISUZU', 'danh-muc/xe-tai-isuzu', 'XE TẢI ISUZU', 5, 2, 0, 'assets/includes/upload/files/isuzu-old-vector-logo-400x400.png'),
(5, 'XE TẢI VEAM', 'danh-muc/xe-tai-veam', 'XE TẢI VEAM', 5, 2, 0, 'assets/includes/upload/files/veam_logo.png');

-- --------------------------------------------------------

--
-- Table structure for table `information`
--

CREATE TABLE `information` (
  `InformId` int(11) NOT NULL,
  `Name` text COLLATE utf8_unicode_ci,
  `Email` text COLLATE utf8_unicode_ci,
  `Phone` text COLLATE utf8_unicode_ci,
  `Facebook` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mailcontact`
--

CREATE TABLE `mailcontact` (
  `ID` int(11) NOT NULL,
  `Name` text COLLATE utf8_unicode_ci,
  `Email` text COLLATE utf8_unicode_ci,
  `Subject` text COLLATE utf8_unicode_ci,
  `Content` text COLLATE utf8_unicode_ci,
  `DateSent` datetime DEFAULT NULL,
  `Phone` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `map`
--

CREATE TABLE `map` (
  `MapID` int(11) NOT NULL,
  `Address` text COLLATE utf8_unicode_ci,
  `Lattitude` double DEFAULT NULL,
  `Longitude` double DEFAULT NULL,
  `Phone` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `myclient`
--

CREATE TABLE `myclient` (
  `ID` int(11) NOT NULL,
  `Name` text COLLATE utf8_unicode_ci,
  `Estimate` text COLLATE utf8_unicode_ci,
  `Image` text COLLATE utf8_unicode_ci,
  `Address` text COLLATE utf8_unicode_ci,
  `Phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `navigates`
--

CREATE TABLE `navigates` (
  `NavID` int(11) NOT NULL,
  `NavName` text COLLATE utf8_unicode_ci,
  `NavMeta` text COLLATE utf8_unicode_ci,
  `ParentId` int(11) DEFAULT '0',
  `Status` tinyint(4) DEFAULT '1',
  `Position` int(11) DEFAULT '0',
  `Type` tinyint(4) DEFAULT '0',
  `TempId` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resourcecate`
--

CREATE TABLE `resourcecate` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Type` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resources`
--

CREATE TABLE `resources` (
  `ResID` int(11) NOT NULL,
  `ResName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ResCate` int(11) DEFAULT NULL,
  `CateLink` int(11) DEFAULT NULL,
  `ProLink` int(11) DEFAULT NULL,
  `Image` text COLLATE utf8_unicode_ci,
  `Frame` text COLLATE utf8_unicode_ci,
  `File` text COLLATE utf8_unicode_ci,
  `Describes` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resourcetype`
--

CREATE TABLE `resourcetype` (
  `TypeID` int(11) NOT NULL,
  `TypeName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Status` tinyint(4) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `ID` int(11) NOT NULL,
  `Name` text COLLATE utf8_unicode_ci,
  `Describes` text COLLATE utf8_unicode_ci,
  `Image` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `slides`
--

CREATE TABLE `slides` (
  `ID` int(11) NOT NULL,
  `Image` text COLLATE utf8_unicode_ci,
  `Describes` text COLLATE utf8_unicode_ci,
  `ProLink` int(11) DEFAULT NULL,
  `CateLink` int(11) DEFAULT NULL,
  `Title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `templates`
--

CREATE TABLE `templates` (
  `TempID` int(11) NOT NULL,
  `TempName` text COLLATE utf8_unicode_ci,
  `Filename` text COLLATE utf8_unicode_ci,
  `Status` tinyint(4) DEFAULT '1',
  `Type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Meta` text COLLATE utf8_unicode_ci,
  `Language` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `templates`
--

INSERT INTO `templates` (`TempID`, `TempName`, `Filename`, `Status`, `Type`, `Meta`, `Language`) VALUES
(1, 'Bài viết', 'fullWidthArticle', 1, 'article', NULL, NULL),
(2, 'Left Sidebar', 'leftSidebarArticle', 0, 'article', NULL, NULL),
(3, 'Right Sidebar', 'rightSidebarArticle', 0, 'article', NULL, NULL),
(4, 'List view', 'listTemplate', 1, 'category', NULL, NULL),
(5, 'Grid view', 'gridTemplate', 1, 'category', NULL, NULL),
(6, 'Sản phẩm', 'fullWidthProduct', 1, 'product', NULL, NULL),
(7, 'Left sidebar', 'leftSidebarProduct', 0, 'product', NULL, NULL),
(8, 'Right sidebar', 'rightSidebarProduct', 0, 'product', NULL, NULL),
(9, 'Thư viện ảnh', 'gallery', 1, 'page', 'vi/thu-vien-anh', 'vi'),
(10, 'Trang chủ', 'home', 1, 'page', 'vi/trang-chu', 'vi'),
(11, 'Home', 'home', 1, 'page', 'en/home', 'en'),
(12, 'Liên hệ', 'contact', 1, 'page', 'vi/lien-he', 'vi'),
(13, 'Contact', 'contact', 1, 'page', 'en/home', 'en'),
(14, 'Photo Gallery', 'gallery', 1, 'page', 'en/photo-gallery', 'en');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
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
  `Twitter` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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

CREATE TABLE `visitor` (
  `ID` int(11) NOT NULL,
  `Ip` text COLLATE utf8_unicode_ci,
  `TimeVisit` datetime DEFAULT NULL,
  `NumOfTime` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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

CREATE TABLE `widgets` (
  `ID` int(11) NOT NULL,
  `Title` text COLLATE utf8_unicode_ci,
  `Area` text COLLATE utf8_unicode_ci,
  `Status` tinyint(4) DEFAULT '1',
  `Describes` text COLLATE utf8_unicode_ci,
  `Position` int(11) DEFAULT '1',
  `CateID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`ArtID`);

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`BannerId`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`CatID`);

--
-- Indexes for table `information`
--
ALTER TABLE `information`
  ADD PRIMARY KEY (`InformId`);

--
-- Indexes for table `mailcontact`
--
ALTER TABLE `mailcontact`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `map`
--
ALTER TABLE `map`
  ADD PRIMARY KEY (`MapID`);

--
-- Indexes for table `myclient`
--
ALTER TABLE `myclient`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `navigates`
--
ALTER TABLE `navigates`
  ADD PRIMARY KEY (`NavID`);

--
-- Indexes for table `resourcecate`
--
ALTER TABLE `resourcecate`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `resources`
--
ALTER TABLE `resources`
  ADD PRIMARY KEY (`ResID`);

--
-- Indexes for table `resourcetype`
--
ALTER TABLE `resourcetype`
  ADD PRIMARY KEY (`TypeID`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `slides`
--
ALTER TABLE `slides`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `templates`
--
ALTER TABLE `templates`
  ADD PRIMARY KEY (`TempID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`);

--
-- Indexes for table `visitor`
--
ALTER TABLE `visitor`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `widgets`
--
ALTER TABLE `widgets`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `ArtID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
  MODIFY `BannerId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `CatID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `information`
--
ALTER TABLE `information`
  MODIFY `InformId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mailcontact`
--
ALTER TABLE `mailcontact`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `map`
--
ALTER TABLE `map`
  MODIFY `MapID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `myclient`
--
ALTER TABLE `myclient`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `navigates`
--
ALTER TABLE `navigates`
  MODIFY `NavID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `resourcecate`
--
ALTER TABLE `resourcecate`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `resources`
--
ALTER TABLE `resources`
  MODIFY `ResID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `resourcetype`
--
ALTER TABLE `resourcetype`
  MODIFY `TypeID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `slides`
--
ALTER TABLE `slides`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `templates`
--
ALTER TABLE `templates`
  MODIFY `TempID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `visitor`
--
ALTER TABLE `visitor`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `widgets`
--
ALTER TABLE `widgets`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
