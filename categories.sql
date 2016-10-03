-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 02, 2016 at 12:41 PM
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

-- --------------------------------------------------------

INSERT INTO `categories` (`CatID`, `CatName`, `CatMeta`, `CatDescribes`, `TempId`, `Type`, `CatParent`, `CatImg`) VALUES
(1, 'XE TẢI DONGFENG', 'danh-muc/xe-tai-dongfeng', 'XE TẢI DONGFENG', 5, 2, 0, 'assets/includes/upload/files/1403668553365882-345x265.png'),
(2, 'XE TẢI FUSO', 'danh-muc/xe-tai-fuso', 'XE TẢI FUSO', 5, 2, 0, 'assets/includes/upload/files/Fuso.png'),
(3, 'XE TẢI HYUNDAI', 'danh-muc/xe-tai-hyundai', 'XE TẢI HYUNDAI', 5, 2, 0, 'assets/includes/upload/files/cropped-huynhdai.png'),
(4, 'XE TẢI ISUZU', 'danh-muc/xe-tai-isuzu', 'XE TẢI ISUZU', 5, 2, 0, 'assets/includes/upload/files/isuzu-old-vector-logo-400x400.png'),
(5, 'XE TẢI VEAM', 'danh-muc/xe-tai-veam', 'XE TẢI VEAM', 5, 2, 0, 'assets/includes/upload/files/veam_logo.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
