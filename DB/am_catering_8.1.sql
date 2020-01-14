-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2019 at 07:36 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `am_catering`
--

-- --------------------------------------------------------

--
-- Table structure for table `food_cat`
--

CREATE TABLE `food_cat` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `visible` tinyint(4) NOT NULL DEFAULT '1',
  `food_main` int(11) DEFAULT NULL,
  `pp` tinyint(4) NOT NULL DEFAULT '0',
  `none` decimal(10,2) DEFAULT NULL,
  `edit_none` tinyint(3) UNSIGNED DEFAULT NULL,
  `edit` tinyint(4) DEFAULT '0',
  `lg_min` smallint(5) UNSIGNED DEFAULT NULL,
  `lg_max` smallint(5) UNSIGNED DEFAULT NULL,
  `md_min` smallint(5) UNSIGNED DEFAULT NULL,
  `md_max` smallint(5) UNSIGNED DEFAULT NULL,
  `sm_min` smallint(5) UNSIGNED DEFAULT NULL,
  `sm_max` smallint(5) UNSIGNED DEFAULT NULL,
  `fun` varchar(50) DEFAULT NULL,
  `extra_fun` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `food_cat`
--

INSERT INTO `food_cat` (`id`, `name`, `visible`, `food_main`, `pp`, `none`, `edit_none`, `edit`, `lg_min`, `lg_max`, `md_min`, `md_max`, `sm_min`, `sm_max`, `fun`, `extra_fun`) VALUES
(100, 'rice', 1, 100, 0, '2.00', 1, 0, 16, 20, 11, 15, 1, 10, NULL, NULL),
(200, 'curry', 1, 100, 0, '2.00', 1, 0, 25, 35, 15, 24, 1, 14, NULL, NULL),
(300, 'veggie', 1, 100, 0, '0.50', 1, 0, 26, 40, 15, 25, 1, 14, NULL, NULL),
(400, 'dessert', 1, 100, 0, '0.50', 1, 1, 26, 40, 15, 25, 1, 14, NULL, NULL),
(500, 'boneless curry', 1, 100, 0, '2.50', 1, 0, 26, 40, 15, 25, 1, 14, NULL, NULL),
(600, 'bbq', 1, 100, 1, '2.00', 1, 1, 25, 40, 15, 25, 1, 14, 'cal_bbq($(this).closest(\'tr\'));', NULL),
(900, 'appetizer', 1, 200, 0, NULL, 0, 0, 26, 40, 15, 25, 1, 14, NULL, NULL),
(1000, 'appetizer2', 1, 200, 0, NULL, 0, 0, 26, 40, 15, 25, 1, 14, NULL, NULL),
(1100, 'salad', 1, 200, 0, NULL, 0, 1, 41, 50, 31, 40, 20, 30, NULL, NULL),
(1200, 'naan', 1, 100, 1, '0.50', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'cal_naan($(this).closest(\'tr\'));', 'cal_extra_naan($(this).closest(\'tr\'));'),
(1300, 'raita', 1, 100, 1, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'cal_raita($(this).closest(\'tr\'));', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `food_custom`
--

CREATE TABLE `food_custom` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `visible` tinyint(4) NOT NULL DEFAULT '1',
  `open` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `food_custom`
--

INSERT INTO `food_custom` (`id`, `name`, `visible`, `open`) VALUES
(100, 'Party trays', 1, 0),
(200, 'Italian Party Trays', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `food_custom_items`
--

CREATE TABLE `food_custom_items` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `rank` int(10) UNSIGNED DEFAULT NULL,
  `food_custom` int(11) NOT NULL,
  `sm_price` decimal(10,2) DEFAULT NULL,
  `md_price` decimal(10,2) DEFAULT NULL,
  `lg_price` decimal(10,2) DEFAULT NULL,
  `price` decimal(10,2) UNSIGNED DEFAULT NULL,
  `tspan` tinyint(3) UNSIGNED DEFAULT '4',
  `mr_cal` tinyint(3) UNSIGNED DEFAULT NULL,
  `is_meat_cal` tinyint(3) UNSIGNED DEFAULT NULL,
  `is_rice_cal` tinyint(3) UNSIGNED DEFAULT NULL,
  `pp` tinyint(4) NOT NULL DEFAULT '0',
  `meat_lg` decimal(10,3) UNSIGNED DEFAULT NULL,
  `meat_md` decimal(10,3) UNSIGNED DEFAULT NULL,
  `meat_sm` decimal(10,3) UNSIGNED DEFAULT NULL,
  `rice_lg` decimal(10,3) UNSIGNED DEFAULT NULL,
  `rice_md` decimal(10,3) UNSIGNED DEFAULT NULL,
  `rice_sm` decimal(10,3) UNSIGNED DEFAULT NULL,
  `lg_min` tinyint(3) UNSIGNED DEFAULT NULL,
  `lg_max` tinyint(3) UNSIGNED DEFAULT NULL,
  `md_min` tinyint(3) UNSIGNED DEFAULT NULL,
  `md_max` tinyint(3) UNSIGNED DEFAULT NULL,
  `sm_min` tinyint(3) UNSIGNED DEFAULT NULL,
  `sm_max` tinyint(3) UNSIGNED DEFAULT NULL,
  `meat_limit` decimal(5,2) UNSIGNED DEFAULT NULL,
  `rice_limit` decimal(5,2) UNSIGNED DEFAULT NULL,
  `list` tinyint(4) NOT NULL DEFAULT '1',
  `visible` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `food_custom_items`
--

INSERT INTO `food_custom_items` (`id`, `name`, `rank`, `food_custom`, `sm_price`, `md_price`, `lg_price`, `price`, `tspan`, `mr_cal`, `is_meat_cal`, `is_rice_cal`, `pp`, `meat_lg`, `meat_md`, `meat_sm`, `rice_lg`, `rice_md`, `rice_sm`, `lg_min`, `lg_max`, `md_min`, `md_max`, `sm_min`, `sm_max`, `meat_limit`, `rice_limit`, `list`, `visible`) VALUES
(100000, 'Chicken Karahi', 7, 100, '30.00', '45.00', '60.00', NULL, 4, 7, 1, 0, 0, '3.750', '2.810', '1.875', NULL, NULL, NULL, 25, 35, 15, 24, 1, 14, '20.00', NULL, 1, 1),
(100200, 'Chicken Korma', 5, 100, '30.00', '45.00', '60.00', NULL, 4, 5, 1, 0, 0, '3.750', '2.810', '2.875', NULL, NULL, NULL, 16, 20, 11, 15, 1, 10, '20.00', NULL, 1, 1),
(100300, 'Chicken Biryani', 1, 100, '30.00', '45.00', '60.00', NULL, 4, 1, 0, 1, 0, '2.500', '2.000', '1.250', '1.500', '1.150', '0.750', 25, 35, 15, 24, 1, 14, '10.00', '7.50', 1, 1),
(100400, 'Chicken Pulao', 3, 100, '30.00', '45.00', '60.00', NULL, 4, 3, 0, 1, 0, '2.500', '2.000', '1.250', '1.500', '1.150', '0.750', 16, 20, 11, 15, 1, 10, '10.00', '7.50', 1, 1),
(100500, 'Haleem', 9, 100, '35.00', '50.00', '70.00', NULL, 4, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 26, 40, 15, 25, 1, 14, NULL, NULL, 1, 1),
(100600, 'Nihari', 10, 100, '40.00', '70.00', '90.00', NULL, 4, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 26, 40, 15, 25, 1, 14, NULL, NULL, 1, 1),
(100700, 'Butter Chicken', 11, 100, '40.00', '50.00', '80.00', NULL, 4, NULL, NULL, NULL, 0, '3.750', '2.810', '1.875', NULL, NULL, NULL, 26, 40, 15, 25, 1, 14, NULL, NULL, 1, 1),
(100800, 'Veal Karahi', 8, 100, '35.00', '50.00', '70.00', NULL, 4, 8, 1, 0, 0, '3.750', '2.810', '1.875', NULL, NULL, NULL, 25, 35, 15, 24, 1, 14, '30.00', NULL, 1, 1),
(100900, 'Veal Korma', 6, 100, '35.00', '50.00', '70.00', NULL, 4, 6, 1, 0, 0, '3.750', '2.810', '1.875', NULL, NULL, NULL, 25, 35, 15, 24, 1, 14, '30.00', NULL, 1, 1),
(101000, 'Veal Biryani', 2, 100, '35.00', '50.00', '70.00', NULL, 4, 2, 0, 1, 0, '2.500', '2.000', '1.250', '1.500', '1.150', '0.750', 16, 20, 11, 15, 1, 10, '10.00', '7.50', 1, 1),
(101100, 'Veal Pulao', 4, 100, '35.00', '50.00', '70.00', NULL, 4, 4, 0, 1, 0, '2.500', '2.000', '1.250', '1.500', '1.150', '0.750', 16, 20, 11, 15, 1, 10, '10.00', '7.50', 1, 1),
(101200, 'Fruit Trifle', 12, 100, '25.00', '40.00', '50.00', NULL, 4, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 26, 40, 15, 25, 1, 14, NULL, NULL, 6, 1),
(101300, 'Lab-e-Shireen', 13, 100, '25.00', '40.00', '50.00', NULL, 4, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 26, 40, 15, 25, 1, 14, NULL, NULL, 6, 1),
(101400, 'Khoya Kheer', 14, 100, '25.00', '40.00', '50.00', NULL, 4, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 26, 40, 15, 25, 1, 14, NULL, NULL, 6, 1),
(101500, 'Zarda', 15, 100, '25.00', '40.00', '50.00', NULL, 4, 9, NULL, 1, 0, NULL, NULL, NULL, '1.250', '0.938', '0.625', 26, 40, 15, 25, 1, 14, NULL, NULL, 1, 1),
(101505, 'Gulab Jamun', 13, 100, NULL, NULL, NULL, '0.00', 4, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 1),
(101600, 'Chicken Pasta', 16, 100, '45.00', '70.00', '90.00', NULL, 4, NULL, NULL, NULL, 0, '2.000', '1.500', '1.000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1),
(101700, 'Chicken Tikka Masala', 17, 100, '35.00', '50.00', '70.00', NULL, 4, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1),
(101705, 'Mixed Vegetables', 18, 100, '25.00', '40.00', '50.00', NULL, 24, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1),
(101710, 'Channa', 19, 100, '25.00', '40.00', '50.00', NULL, 4, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1),
(101715, 'Aloo Palak', 20, 100, '25.00', '40.00', '50.00', NULL, 24, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1),
(101800, 'Reshmi Kabab', 21, 100, NULL, NULL, NULL, '2.50', 4, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1),
(101900, 'Beef Kabab', 22, 100, NULL, NULL, NULL, '2.50', 4, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1),
(102000, 'Tandoori Chicken Tikka', 23, 100, NULL, NULL, NULL, '3.50', 4, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1),
(102100, 'Bihari Kabab', 24, 100, NULL, NULL, NULL, '8.50', 4, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1),
(102200, 'Chicken Bihari', 25, 100, NULL, NULL, NULL, '7.50', 4, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1),
(102300, 'Malai Boti', 26, 100, NULL, NULL, NULL, '7.50', 4, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1),
(102400, 'Boneless Chicken Tikka', 27, 100, NULL, NULL, NULL, '7.50', 4, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1),
(102500, 'Raita', 32, 100, NULL, NULL, NULL, '0.00', 4, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1),
(102600, 'Garden Salad', 27, 100, '0.00', '0.00', '0.25', NULL, 4, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 1),
(102700, 'Greek Salad', 28, 100, '0.00', '0.00', '0.00', NULL, 4, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 1),
(102800, 'Tandoori Naan', 30, 100, NULL, NULL, NULL, '1.50', 4, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 1),
(102900, 'Peta Naan', 31, 100, NULL, NULL, NULL, '1.00', 4, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 1),
(105000, 'Vegetarian', 33, 200, '40.00', NULL, '80.00', NULL, 4, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1),
(105100, 'Chicken', 34, 200, '45.00', NULL, '90.00', NULL, 4, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1),
(105200, 'Italian Sausage', 35, 200, '45.00', NULL, '90.00', NULL, 4, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1),
(105300, 'New York Striploin', 36, 200, '50.00', NULL, '100.00', NULL, 4, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1),
(105400, 'House Special Herbal Rice', 37, 200, '20.00', NULL, '40.00', NULL, 4, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1),
(105500, 'Roasted Potatoes', 38, 200, '32.00', NULL, '60.00', NULL, 4, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1),
(105600, 'Mashed Potatoes', 39, 200, '30.00', NULL, '60.00', NULL, 4, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1),
(105700, 'Vegetarian Lasagna', 40, 200, '45.00', NULL, '90.00', NULL, 4, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1),
(105800, 'Beef Lasagna', 41, 200, '50.00', NULL, '100.00', NULL, 4, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1),
(105900, 'Chicken Parmesan', 42, 200, '80.00', NULL, '120.00', NULL, 4, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `food_full_custom`
--

CREATE TABLE `food_full_custom` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `open` tinyint(4) DEFAULT '0',
  `visible` tinyint(4) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `food_full_custom`
--

INSERT INTO `food_full_custom` (`id`, `name`, `open`, `visible`) VALUES
(100, 'Custom', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `food_ingredients`
--

CREATE TABLE `food_ingredients` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `cal` tinyint(11) NOT NULL DEFAULT '0',
  `rowspan` tinyint(4) NOT NULL DEFAULT '1',
  `sum1` tinyint(4) DEFAULT NULL,
  `sum2` tinyint(4) DEFAULT NULL,
  `description` varchar(25) DEFAULT NULL,
  `recipes` varchar(500) DEFAULT NULL,
  `visible` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `food_ingredients`
--

INSERT INTO `food_ingredients` (`id`, `name`, `cal`, `rowspan`, `sum1`, `sum2`, `description`, `recipes`, `visible`) VALUES
(1, 'Chicken+Rice', 1, 2, NULL, NULL, '', 'Chicken Biryani,Chicken Pulao', 1),
(2, 'Chicken+Curry', 2, 0, 1, 2, '', 'Chicken Karahi,Chicken Korma', 1),
(3, 'BBQ+Chicken', 3, 1, NULL, NULL, 'PCs', 'Tandoori Chicken Tikka', 1),
(4, 'Veal+Rice', 4, 2, NULL, NULL, 'VEAL', 'Veal Biryani,Veal Pulao', 1),
(5, 'Veal+Curry', 5, 0, 4, 5, NULL, 'Veal Karahi,Veal Korma', 1),
(6, 'Reshmi Kabab', 6, 2, NULL, NULL, NULL, 'Reshmi Kabab', 1),
(7, 'Chicken Pasta', 7, 0, 6, 7, NULL, 'Chicken Pasta', 1),
(8, 'Beef Keema', 8, 1, NULL, NULL, NULL, 'Beef Kabab', 1),
(9, 'Butter Chicken', 9, 1, NULL, NULL, NULL, 'Butter Chicken', 1),
(10, 'Boneless Tikka Masala', 10, 1, NULL, NULL, NULL, 'Tikka Masala', 1),
(11, 'Boneless Tikka', 11, 1, NULL, NULL, NULL, 'Boneless Chicken Tikka', 1),
(12, 'Bihari Kabab', 12, 1, NULL, NULL, NULL, 'Bihari Kabab', 1),
(13, 'Fish', 13, 1, NULL, NULL, NULL, 'Fried Fish', 1),
(14, 'Zarda Rice', 14, 1, NULL, NULL, NULL, 'Zarda', 1);

-- --------------------------------------------------------

--
-- Table structure for table `food_main`
--

CREATE TABLE `food_main` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `open` tinyint(4) NOT NULL DEFAULT '0',
  `visible` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `food_main`
--

INSERT INTO `food_main` (`id`, `name`, `open`, `visible`) VALUES
(100, 'Catering Packages', 0, 1),
(200, 'Special Events & Wedding Package', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `food_packages`
--

CREATE TABLE `food_packages` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `food_main` int(11) NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `visible` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `food_packages`
--

INSERT INTO `food_packages` (`id`, `name`, `food_main`, `price`, `visible`) VALUES
(100, 'PACKAGE1', 100, '6.99', 1),
(200, 'PACKAGE2', 100, '7.99', 1),
(300, 'PACKAGE3', 100, '8.49', 1),
(400, 'PACKAGE4', 100, '9.49', 1),
(500, 'Silver Package', 200, '9.99', 1),
(600, 'Gold Package', 200, '11.99', 1),
(700, 'Diamond Package', 200, '13.99', 1);

-- --------------------------------------------------------

--
-- Table structure for table `food_package_cat`
--

CREATE TABLE `food_package_cat` (
  `id` int(11) NOT NULL,
  `food_cat_id` int(11) NOT NULL,
  `food_package_id` int(11) NOT NULL,
  `visible` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `food_package_cat`
--

INSERT INTO `food_package_cat` (`id`, `food_cat_id`, `food_package_id`, `visible`) VALUES
(1, 100, 100, 1),
(2, 200, 100, 1),
(3, 300, 100, 1),
(4, 400, 100, 1),
(5, 100, 200, 1),
(6, 500, 200, 1),
(7, 300, 200, 1),
(8, 400, 200, 1),
(9, 100, 300, 1),
(10, 200, 300, 1),
(11, 300, 300, 1),
(12, 600, 300, 1),
(13, 400, 300, 1),
(14, 100, 400, 1),
(15, 500, 400, 1),
(16, 300, 400, 1),
(17, 600, 400, 1),
(18, 400, 400, 1),
(19, 900, 500, 1),
(20, 100, 500, 1),
(21, 200, 500, 1),
(22, 300, 500, 1),
(23, 300, 500, 1),
(24, 600, 500, 1),
(25, 400, 500, 1),
(26, 1100, 500, 1),
(27, 900, 600, 1),
(28, 100, 600, 1),
(29, 200, 600, 1),
(30, 300, 600, 1),
(31, 500, 600, 1),
(32, 600, 600, 1),
(33, 400, 600, 1),
(34, 1100, 600, 1),
(35, 900, 700, 1),
(36, 1100, 700, 1),
(37, 100, 700, 1),
(38, 200, 700, 1),
(39, 500, 700, 1),
(40, 600, 700, 1),
(41, 300, 700, 1),
(42, 400, 700, 1),
(43, 1100, 700, 1),
(44, 1000, 700, 1),
(45, 1200, 100, 1),
(46, 1300, 100, 1),
(47, 1200, 200, 1),
(48, 1300, 200, 1),
(49, 1200, 300, 1),
(50, 1300, 300, 1),
(51, 1200, 400, 1),
(52, 1300, 400, 1),
(53, 1200, 500, 1),
(54, 1300, 500, 1),
(55, 1200, 600, 1),
(56, 1300, 600, 1),
(57, 1200, 700, 1),
(58, 1300, 700, 1),
(59, 1100, 100, 1),
(60, 1100, 200, 1),
(61, 1100, 300, 1),
(62, 1100, 400, 1);

-- --------------------------------------------------------

--
-- Table structure for table `food_package_items`
--

CREATE TABLE `food_package_items` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `rank` int(10) UNSIGNED DEFAULT NULL,
  `list` tinyint(4) NOT NULL DEFAULT '1',
  `food_cat_id` int(11) NOT NULL,
  `pp` tinyint(4) NOT NULL DEFAULT '0',
  `is_extra` tinyint(3) UNSIGNED DEFAULT '0',
  `reduce` decimal(10,2) DEFAULT '0.00',
  `increase` decimal(10,2) DEFAULT '0.00',
  `tspan` tinyint(3) UNSIGNED DEFAULT '4',
  `mr_cal` tinyint(3) UNSIGNED DEFAULT NULL,
  `is_meat_cal` tinyint(3) UNSIGNED DEFAULT NULL,
  `is_rice_cal` tinyint(3) UNSIGNED DEFAULT NULL,
  `meat_lg` decimal(10,3) UNSIGNED DEFAULT NULL,
  `meat_md` decimal(10,3) UNSIGNED DEFAULT NULL,
  `meat_sm` decimal(10,3) UNSIGNED DEFAULT NULL,
  `rice_lg` decimal(10,3) UNSIGNED DEFAULT NULL,
  `rice_md` decimal(10,3) UNSIGNED DEFAULT NULL,
  `rice_sm` decimal(10,3) UNSIGNED DEFAULT NULL,
  `meat_limit` decimal(5,2) UNSIGNED DEFAULT NULL,
  `rice_limit` decimal(5,2) UNSIGNED DEFAULT NULL,
  `extra_price` decimal(5,2) UNSIGNED DEFAULT NULL,
  `selected` tinyint(4) DEFAULT NULL,
  `visible` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `food_package_items`
--

INSERT INTO `food_package_items` (`id`, `name`, `rank`, `list`, `food_cat_id`, `pp`, `is_extra`, `reduce`, `increase`, `tspan`, `mr_cal`, `is_meat_cal`, `is_rice_cal`, `meat_lg`, `meat_md`, `meat_sm`, `rice_lg`, `rice_md`, `rice_sm`, `meat_limit`, `rice_limit`, `extra_price`, `selected`, `visible`) VALUES
(100, 'Chicken Biryani', 1, 1, 100, 0, 0, '0.00', '0.00', 4, 1, 0, 1, '2.000', '1.500', '1.000', '1.500', '1.150', '0.750', '10.00', '7.50', NULL, NULL, 1),
(200, 'Veal Biryani', 2, 1, 100, 0, 0, '0.00', '0.00', 4, 2, 0, 1, '2.000', '1.500', '1.000', '1.500', '1.150', '0.750', '10.00', '7.50', NULL, NULL, 1),
(300, 'Chicken Pulao', 3, 1, 100, 0, 0, '0.00', '0.00', 4, 3, 0, 1, '2.000', '1.500', '1.000', '1.500', '1.150', '0.750', '10.00', '7.50', NULL, NULL, 1),
(400, 'Veal Pulao', 4, 1, 100, 0, 0, '0.00', '0.00', 4, 4, 0, 1, '2.000', '1.500', '1.000', '1.500', '1.150', '0.750', '10.00', '7.50', NULL, NULL, 1),
(500, 'Chicken Korma', 5, 1, 200, 0, 0, '0.00', '0.00', 4, 5, 1, 0, '4.250', '3.188', '2.125', NULL, NULL, NULL, '20.00', NULL, NULL, NULL, 1),
(600, 'Veal Korma', 6, 1, 200, 0, 0, '0.00', '0.00', 4, 6, 1, 0, '4.250', '3.188', '2.125', NULL, NULL, NULL, '30.00', NULL, NULL, NULL, 1),
(700, 'Chicken Karahi', 7, 1, 200, 0, 0, '0.00', '0.00', 4, 7, 1, 0, '4.250', '3.188', '2.125', NULL, NULL, NULL, '20.00', NULL, NULL, NULL, 1),
(800, 'Veal Karahi', 8, 1, 200, 0, 0, '0.00', '0.00', 4, 8, 1, 0, '4.250', '3.188', '2.125', NULL, NULL, NULL, '30.00', NULL, NULL, NULL, 1),
(900, 'Mixed Vegetables', 9, 1, 300, 0, 0, '0.00', '0.00', 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1000, 'Channa', 10, 1, 300, 0, 0, '0.00', '0.00', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1100, 'Aloo Palak', 11, 1, 300, 0, 0, '0.00', '0.00', 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1200, 'Khoya Kheer', 12, 6, 400, 0, 0, '0.00', '0.00', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1300, 'Gulab Jamun', 13, 6, 400, 1, 1, '0.00', '0.00', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2.00', NULL, 1),
(1400, 'Fruit Trifle', 14, 6, 400, 0, 0, '0.00', '0.00', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1500, 'Lab-e-Shireen', 15, 6, 400, 0, 0, '0.00', '0.00', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1600, 'Zarda', 16, 1, 400, 0, 0, '0.00', '0.00', 4, 9, 0, 1, NULL, NULL, NULL, '1.250', '0.938', '0.625', NULL, '7.50', NULL, NULL, 1),
(1700, 'Butter Chicken', 17, 1, 500, 0, 0, '0.00', '0.00', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1800, 'Nihari', 18, 1, 500, 0, 0, '0.00', '0.00', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1900, 'Haleem', 19, 1, 500, 0, 0, '0.00', '0.00', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(2000, 'Tikka Masala', 20, 1, 500, 0, 0, '0.00', '0.00', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(2100, 'Tandoori Chicken Tikka', 21, 2, 600, 1, 1, '0.00', '0.00', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2.00', NULL, 1),
(2200, 'Beef Kabab', 22, 2, 600, 1, 1, '0.00', '0.00', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2.50', NULL, 1),
(2300, 'Reshmi Kabab', 23, 2, 600, 1, 1, '0.00', '0.00', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2.50', NULL, 1),
(2400, 'Samosa', 24, 1, 900, 1, 1, '0.00', '0.00', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1.50', NULL, 1),
(2500, 'Chaat Papri', 25, 1, 900, 0, 0, '0.00', '0.00', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(2600, 'Spring Rolls', 26, 1, 900, 1, 1, '0.00', '0.00', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1.50', NULL, 1),
(2700, 'Garden Salad', 27, 4, 1100, 0, 0, '0.00', '0.00', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1),
(2800, 'Greek Salad', 28, 4, 1100, 0, 0, '0.00', '0.00', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(2900, 'Fried Fish', 29, 1, 1000, 1, 0, '0.00', '0.00', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(3000, 'Tandoori Naan', 30, 5, 1200, 1, 1, '0.00', '0.50', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1.50', 1, 1),
(3100, 'Peta Naan', 31, 5, 1200, 1, 1, '0.00', '0.00', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1.00', NULL, 1),
(3200, 'Raita', 32, 3, 1300, 1, 1, '0.00', '0.00', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1.00', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `home_cards`
--

CREATE TABLE `home_cards` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `admin` tinyint(4) DEFAULT NULL,
  `operator` tinyint(4) DEFAULT NULL,
  `manager` tinyint(4) DEFAULT NULL,
  `chef` tinyint(4) DEFAULT NULL,
  `tandoor` tinyint(4) DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `bg` varchar(25) DEFAULT NULL,
  `link` varchar(50) DEFAULT NULL,
  `text` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `home_cards`
--

INSERT INTO `home_cards` (`id`, `name`, `title`, `admin`, `operator`, `manager`, `chef`, `tandoor`, `icon`, `bg`, `link`, `text`) VALUES
(1, 'Booking', 'Go for booking', 1, 1, 0, 0, 0, 'fas fa-fw fa-book', 'bg-primary', 'booking.php', NULL),
(2, 'Orders', 'View Details', 1, 1, 0, 0, 0, 'fas fa-fw fa-dollar-sign', 'bg-warning', 'orders.php', '<span id=\'orders\'></span>'),
(3, 'Meat Report', 'View report', 1, 0, 0, 0, 0, 'fas fa-fw fa-clipboard-list', 'bg-success', 'ingredients.php', NULL),
(4, 'Kitchen Schedual', 'View Details', 1, 0, 0, 1, 1, 'fas fa-fw fa-utensils', 'bg-danger', 'kitchen.php', NULL),
(5, 'Kabab Report', 'view report', 1, 0, 1, 0, 0, 'fas fa-chart-pie', 'bg-info', 'report_kabab.php', NULL),
(6, 'Haleem Nihari Report', 'view report', 1, 0, 1, 0, 0, 'fas fa-chart-pie', 'bg-info', 'report_haleem_nihari.php', NULL),
(7, 'Vegi And Naan Report', 'view report', 1, 0, 1, 0, 0, 'fas fa-chart-pie', 'bg-info', 'report_vegi_naan.php', NULL),
(8, 'Sweets Report', 'view report', 1, 0, 1, 0, 0, 'fas fa-chart-pie', 'bg-info', 'report_sweets.php', NULL),
(9, 'Package Items Settings', 'Go to setup', 1, 0, 0, 0, 0, 'fas fa-tools', 'bg-secondary', 'setting_package.php', NULL),
(10, 'Custom Items Settings', 'Go to setup', 1, 0, 0, 0, 0, 'fas fa-tools', 'bg-secondary', 'setting_custom.php', NULL),
(11, 'Users Privileges Setup', 'Go to setup', 1, 0, 0, 0, 0, 'fa fa-users', 'bg-primary', 'setting_privileges.php', NULL),
(12, 'Users And Roles Setup', 'Go to Setup', 1, 0, 0, 0, 0, 'fa fa-users-cog', 'bg-success', 'setting_users.php', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kitchen_list`
--

CREATE TABLE `kitchen_list` (
  `id` smallint(11) UNSIGNED NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  `admin` tinyint(4) NOT NULL,
  `operator` tinyint(4) DEFAULT NULL,
  `chef` tinyint(4) NOT NULL,
  `tandoor` tinyint(4) NOT NULL,
  `manager` tinyint(4) NOT NULL,
  `allow` tinyint(4) NOT NULL,
  `custom` tinyint(4) DEFAULT NULL,
  `list` smallint(5) UNSIGNED DEFAULT NULL,
  `rank` tinyint(3) UNSIGNED DEFAULT NULL,
  `fun` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kitchen_list`
--

INSERT INTO `kitchen_list` (`id`, `name`, `admin`, `operator`, `chef`, `tandoor`, `manager`, `allow`, `custom`, `list`, `rank`, `fun`) VALUES
(1, 'Kitchen', 1, 0, 1, 0, 0, 1, 1, 1, 1, 6000),
(2, 'BBQ', 1, 0, 1, 0, 0, 1, 1, 2, 2, 6001),
(3, 'Naan', 1, 0, 0, 1, 0, 1, 1, 5, 4, 6002),
(4, 'Salad-Raita', 1, 0, 1, 0, 0, 1, 0, 4, NULL, 6003),
(5, 'Sweets', 1, 0, 1, 0, 0, 1, 1, 6, 3, 6004),
(6, 'Rice', 1, 0, 1, 0, 0, 1, 0, NULL, NULL, 6005),
(7, 'Salad', 0, 0, 0, 0, 0, 0, 1, 4, 5, NULL),
(8, 'Raita', 0, 0, 0, 0, 0, 0, 0, 3, 6, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `persons` smallint(6) DEFAULT NULL,
  `extra` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT '0.00',
  `advance` decimal(10,2) DEFAULT '0.00',
  `balance` decimal(10,2) DEFAULT '0.00',
  `phone1` varchar(15) DEFAULT NULL,
  `phone2` varchar(15) DEFAULT NULL,
  `shipping` tinyint(4) DEFAULT NULL,
  `delivery_time` datetime DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `remark` varchar(150) DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `name`, `persons`, `extra`, `total`, `advance`, `balance`, `phone1`, `phone2`, `shipping`, `delivery_time`, `address`, `remark`, `date`) VALUES
(1, 'Ali', 250, '0.00', '2292.50', '0.00', '2292.50', '', '', 2, '2019-05-07 10:00:00', '', '', '2019-05-06'),
(2, 'Ahmad', 25, '0.00', '187.25', '0.00', '187.25', '', '', 2, '2019-05-07 12:00:00', '', '', '2019-05-07'),
(3, 'Mirza', 25, '0.00', '250.00', '0.00', '250.00', '', '', 2, '2019-05-08 13:00:00', '', '', '2019-05-07'),
(4, 'Madina', 70, '0.00', '419.30', '0.00', '419.30', '', '', 2, '2019-05-09 19:00:00', '', '', '2019-05-07'),
(5, 'Shakeela', 25, '0.00', '840.00', '0.00', '840.00', '', '', 2, '2019-05-09 19:00:00', '', '', '2019-05-07'),
(6, 'Sami Ahmad', 150, '0.00', '1368.50', '0.00', '1368.50', '6479372786', '', 1, '2019-05-09 19:00:00', '', '', '2019-05-07'),
(7, 'Asma', 25, '0.00', '70.00', '0.00', '70.00', '', '', 2, '2019-05-10 17:00:00', '', '', '2019-05-07'),
(8, 'Atif', 30, '0.00', '254.70', '0.00', '254.70', '6479899786', '', 2, '2019-05-10 17:00:00', '', '', '2019-05-07'),
(9, 'Zia-Ul-Haq', 30, '0.00', '224.70', '0.00', '224.70', '4166280757', '', 2, '2019-05-10 18:00:00', '', '', '2019-05-07'),
(10, 'Asad', 25, '0.00', '212.25', '0.00', '212.25', '6475304165', '', 2, '2019-05-10 18:30:00', '', '', '2019-05-07'),
(11, 'Fawad Bajawa', 25, '0.00', '327.25', '0.00', '327.25', '4166899376', '', 1, '2019-05-10 18:15:00', '', '', '2019-05-07'),
(12, 'Adnan Bhati', 25, '0.00', '294.75', '0.00', '294.75', '2894891001', '', 2, '2019-05-10 19:00:00', '', '', '2019-05-07'),
(13, 'Madina', 70, '0.00', '279.30', '0.00', '279.30', '', '', 2, '2019-05-10 19:00:00', '', '', '2019-05-07'),
(14, 'Altaf Hussain', 25, '0.00', '147.50', '0.00', '147.50', '9052799389', '', 2, '2019-05-10 19:30:00', '', '', '2019-05-07'),
(15, 'Syeda Khateja', 25, '0.00', '900.00', '0.00', '900.00', '', '', 2, '2019-05-10 19:30:00', '', '', '2019-05-07'),
(16, 'Salman Masood', 40, '0.00', '359.60', '0.00', '359.60', '4168949077', '', 2, '2019-05-11 17:00:00', '', '', '2019-05-07'),
(17, 'Faisal Mehmood', 25, '0.00', '210.00', '0.00', '210.00', '4168587620', '', 2, '2019-05-11 15:00:00', '', '', '2019-05-07'),
(18, 'sabive', 25, '0.00', '25.00', '0.00', '25.00', '', '', 2, '2019-05-11 14:00:00', '', '', '2019-05-07'),
(19, 'Sis Mumtaz', 250, '0.00', '947.50', '0.00', '947.50', '', '', 2, '2019-05-11 17:30:00', '', '', '2019-05-07'),
(20, 'imran Din', 25, '0.00', '249.75', '0.00', '249.75', '', '', 2, '2019-05-11 19:00:00', '', '', '2019-05-07'),
(21, 'Reshma', 25, '0.00', '174.75', '0.00', '174.75', '', '', 2, '2019-05-11 19:00:00', '', '', '2019-05-07'),
(22, 'Rauf ', 25, '0.00', '192.50', '0.00', '192.50', '', '', 2, '2019-05-11 21:00:00', '', '', '2019-05-07'),
(23, 'Mir Ahmad', 250, '0.00', '2397.50', '0.00', '2397.50', '6474006351', '', 2, '2019-05-11 19:00:00', '', '', '2019-05-07'),
(24, 'Imran Ijaz', 550, '0.00', '7119.50', '0.00', '7119.50', '9055316627', '', 2, '2019-05-11 17:45:00', '', '', '2019-05-07'),
(25, 'Aysha ', 100, '0.00', '899.00', '0.00', '899.00', '', '', 2, '2019-05-18 15:00:00', '', '', '2019-05-07'),
(26, 'Baker Zdi', 70, '0.00', '489.30', '0.00', '489.30', '', '', 2, '2019-05-12 20:00:00', '', '', '2019-05-07'),
(27, 'Affan Ali', 50, '0.00', '574.50', '0.00', '574.50', '', '', 2, '2019-05-12 19:00:00', '', '', '2019-05-07'),
(28, 'Shahid Mughal', 250, '0.00', '2122.50', '0.00', '2122.50', '', '', 2, '2019-05-11 19:15:00', '', '', '2019-05-07'),
(29, 'abid', 100, '0.00', '749.00', '0.00', '749.00', '', '', 2, '2019-05-09 19:00:00', '', '', '2019-05-07'),
(31, 'asd', 25, '0.00', '174.75', '0.00', '174.75', '', '', 2, '2019-05-03 19:07:00', '', '', '2019-05-10'),
(32, 'Ahmareen', 25, '0.00', '35.00', '0.00', '35.00', '4167122290', '', 2, '2019-05-12 18:00:00', '', '', '2019-05-11'),
(34, 'ds', 25, '0.00', '0.00', '0.00', '0.00', '', '', 2, '2019-05-04 23:10:00', '', '', '2019-05-11'),
(36, 'M.Ali', 25, '0.00', '30.00', '0.00', '30.00', '', '', 2, '2019-05-12 16:00:00', '', '', '2019-05-11'),
(37, 'sis Almas', 225, '0.00', '1460.25', '0.00', '1460.25', '', '', 2, '2019-05-12 18:00:00', '', '', '2019-05-11'),
(38, 'Farah Mir', 25, '0.00', '174.75', '0.00', '174.75', '', '', 2, '2019-05-16 19:30:00', '', '', '2019-05-12'),
(39, 'Madina', 150, '0.00', '898.50', '0.00', '898.50', '', '', 2, '2019-05-16 19:00:00', '', '', '2019-05-12'),
(40, 'madina', 250, '0.00', '997.50', '0.00', '997.50', '', '', 2, '2019-05-17 19:00:00', '', '', '2019-05-12'),
(41, 'Haris Parcha', 25, '0.00', '850.00', '0.00', '850.00', '', '', 2, '2019-05-17 18:45:00', '', '', '2019-05-12'),
(42, 'Saleem', 120, '0.00', '1171.30', '0.00', '1171.30', '', '', 2, '2019-05-17 19:00:00', '', '', '2019-05-12'),
(44, 'Sis Shakeela', 25, '0.00', '0.00', '0.00', '0.00', '', '', 2, '2019-05-15 19:30:00', '', '', '2019-05-12'),
(45, 'Qari Waqar', 140, '0.00', '1188.60', '0.00', '1188.60', '6478897319', '', 2, '2019-05-18 19:30:00', '', '', '2019-05-12'),
(46, 'Zaheer Ahmad', 35, '0.00', '358.15', '0.00', '358.15', '4162589113', '', 2, '2019-05-18 19:00:00', '', '', '2019-05-12'),
(47, 'Zaeem Butt', 100, '0.00', '914.00', '0.00', '914.00', '6479873351', '', 1, '2019-05-18 18:00:00', '', '', '2019-05-12'),
(48, 'Rauf Khan', 25, '0.00', '255.00', '0.00', '255.00', '', '', 2, '2019-05-18 21:00:00', '', '', '2019-05-12'),
(49, 'Ihtisham', 60, '0.00', '719.40', '0.00', '719.40', '6479805060', '', 2, '2019-05-17 18:30:00', '', '', '2019-05-12'),
(50, 'Batul', 40, '70.00', '369.60', '0.00', '369.60', '4164573514', '', 2, '2019-05-17 18:00:00', '', '', '2019-05-12'),
(54, 'Mir Ahmad', 250, '0.00', '747.50', '0.00', '747.50', '', '', 2, '2019-05-18 18:45:00', '', '', '2019-05-12'),
(55, 'Madina', 200, '0.00', '1398.00', '0.00', '1398.00', '', '', 2, '2019-05-19 19:30:00', '', '', '2019-05-12'),
(56, 'dure', 25, '0.00', '140.00', '0.00', '140.00', '', '', 2, '2019-05-19 18:30:00', '', '', '2019-05-12'),
(57, 'Shabib', 100, '0.00', '899.00', '0.00', '899.00', '4168751651', '', 2, '2019-05-19 19:00:00', '', '', '2019-05-12'),
(58, 'Naseer', 150, '0.00', '1273.50', '0.00', '1273.50', '', '', 2, '2019-05-19 18:00:00', '', '', '2019-05-12'),
(59, 'Amir', 200, '0.00', '1513.00', '0.00', '1513.00', '4163320159', '', 2, '2019-05-19 17:30:00', '', '', '2019-05-12'),
(61, 'Moaiz ', 25, '0.00', '187.25', '0.00', '187.25', '4165666024', '', 2, '2019-05-15 18:30:00', '', '', '2019-05-13'),
(62, 'Farqan Butt', 30, '0.00', '344.70', '0.00', '344.70', '', '', 2, '2019-05-17 17:00:00', '', '', '2019-05-13'),
(63, 'Tahir Mehmood', 60, '0.00', '545.40', '0.00', '545.40', '', '', 2, '2019-05-17 19:00:00', '', '', '2019-05-13'),
(64, 'Rajani', 30, '0.00', '319.70', '0.00', '319.70', '5197295551', '', 2, '2019-05-17 18:30:00', '', '', '2019-05-13'),
(65, 'Umair', 25, '0.00', '25.00', '0.00', '25.00', '', '', 2, '2019-05-17 16:00:00', '', '', '2019-05-13'),
(66, 'Imrana', 50, '40.00', '489.50', '0.00', '489.50', '6477077237', '', 2, '2019-05-17 18:00:00', '', '', '2019-05-13'),
(67, 'Jame Mustafa', 25, '0.00', '0.00', '0.00', '0.00', '', '', 2, '2019-05-18 19:30:00', '', '', '2019-05-13'),
(68, 'Madina', 150, '0.00', '1438.50', '0.00', '1438.50', '', '', 2, '2019-05-18 19:30:00', '', '', '2019-05-14'),
(69, 'Fahad Saleem', 25, '0.00', '174.75', '0.00', '174.75', '4162301547', '', 2, '2019-05-19 19:00:00', '', '', '2019-05-14'),
(70, 'Adeel Khan', 40, '0.00', '299.60', '0.00', '299.60', '6477722791', '', 2, '2019-05-19 18:00:00', '', '', '2019-05-14'),
(71, 'Zakir', 25, '0.00', '240.00', '0.00', '240.00', '6479712064', '', 2, '2019-05-15 20:00:00', '', '', '2019-05-14'),
(72, 'mustafa', 25, '0.00', '155.00', '0.00', '155.00', '', '', 2, '2019-05-15 16:00:00', '', '', '2019-05-14'),
(73, 'madina', 120, '0.00', '490.80', '0.00', '490.80', '', '', 2, '2019-05-15 19:30:00', '', '', '2019-05-14'),
(74, 'Samina ', 100, '0.00', '789.00', '0.00', '789.00', '', '', 2, '2019-05-19 18:00:00', '', '', '2019-05-14'),
(75, 'Hina', 25, '0.00', '304.75', '0.00', '304.75', '5194377664', '', 2, '2019-05-19 13:00:00', '', '', '2019-05-14'),
(76, 'Rabia', 25, '0.00', '65.00', '0.00', '65.00', '9053349167', '', 2, '2019-05-17 19:00:00', '', '', '2019-05-14'),
(77, 'M.Abbas', 25, '0.00', '92.50', '0.00', '92.50', '6479940012', '', 2, '2019-05-19 13:30:00', '', '', '2019-05-14'),
(78, 'Stainley', 25, '0.00', '107.50', '0.00', '107.50', '', '', 2, '2019-05-17 17:00:00', '', '', '2019-05-14'),
(79, 'Zulifiqar', 25, '0.00', '172.50', '0.00', '172.50', '', '', 2, '2019-05-17 17:00:00', '', '', '2019-05-14'),
(80, 'Shazia', 25, '0.00', '25.00', '0.00', '25.00', '', '', 2, '2019-05-15 17:00:00', '', '', '2019-05-14'),
(81, 'Zubair Toyota', 30, '0.00', '398.20', '0.00', '398.20', '', '', 2, '2019-05-17 19:30:00', '', '', '2019-05-15'),
(82, 'Shazia', 25, '0.00', '132.50', '0.00', '132.50', '', '', 2, '2019-05-18 14:00:00', '', '', '2019-05-15'),
(83, 'Umer Al Abas', 25, '0.00', '0.00', '0.00', '0.00', '', '', 2, '2019-05-17 19:00:00', '', '', '2019-05-16'),
(84, 'Imran Husain', 25, '0.00', '108.00', '0.00', '108.00', '', '', 2, '2019-05-19 19:00:00', '', '', '2019-05-16'),
(85, 'Fahad Bram.', 25, '0.00', '95.00', '0.00', '95.00', '', '', 2, '2019-05-19 19:00:00', '', '', '2019-05-16'),
(86, 'Mir Ahmad', 25, '0.00', '162.25', '0.00', '162.25', '', '', 2, '2019-05-19 20:00:00', '', '', '2019-05-16'),
(87, 'Nasir', 25, '0.00', '70.00', '0.00', '70.00', '', '', 2, '2019-05-18 16:00:00', '', '', '2019-05-16'),
(88, 'Khizer', 25, '0.00', '256.50', '0.00', '256.50', '2899971626', '', 2, '2019-05-20 19:00:00', '', '', '2019-05-18'),
(89, 'M Shakeel', 25, '0.00', '192.50', '0.00', '192.50', '5199910004', '', 2, '2019-05-20 17:00:00', '', '', '2019-05-18'),
(90, 'Asim ', 25, '0.00', '40.00', '0.00', '40.00', '', '', 2, '2019-05-20 16:00:00', '', '', '2019-05-18'),
(91, 'Hassan Ahmad', 27, '0.00', '202.23', '0.00', '202.23', '', '', 2, '2019-05-06 19:00:00', '', '', '2019-05-18'),
(92, 'Salim Malik', 40, '0.00', '259.60', '0.00', '259.60', '', '', 2, '2019-05-20 13:00:00', '', '', '2019-05-18'),
(93, 'Afsar', 0, '0.00', '400.00', '0.00', '400.00', '', '', 2, '2019-05-20 17:00:00', '', '', '2019-05-18'),
(94, 'Tariq', 25, '0.00', '65.00', '0.00', '65.00', '', '', 2, '2019-05-20 17:00:00', '', '', '2019-05-18'),
(95, 'Zakir', 25, '0.00', '240.00', '0.00', '240.00', '6479712064', '', 2, '2019-05-21 20:00:00', '', '', '2019-05-18'),
(96, 'Ikram', 25, '0.00', '147.75', '0.00', '147.75', '', '', 2, '2019-05-21 18:35:00', '', '', '2019-05-18'),
(97, 'Tayyab', 25, '0.00', '455.00', '0.00', '455.00', '', '', 2, '2019-05-21 18:30:00', '', '', '2019-05-18'),
(98, 'Imran', 90, '0.00', '359.10', '0.00', '359.10', '6479902250', '', 2, '2019-05-21 19:30:00', '', '', '2019-05-18'),
(99, 'Sohail Aurora', 100, '0.00', '899.00', '0.00', '899.00', '', '', 2, '2019-05-22 19:00:00', '', '', '2019-05-18'),
(100, 'M-Riaz', 25, '0.00', '162.25', '0.00', '162.25', '2893836294', '', 2, '2019-05-22 18:30:00', '', '', '2019-05-18'),
(101, 'Saeeda', 25, '0.00', '35.00', '0.00', '35.00', '4168938842', '', 2, '2019-05-22 16:00:00', '', '', '2019-05-18'),
(102, 'Miguel', 25, '0.00', '400.00', '0.00', '400.00', '', '', 2, '2019-05-22 20:00:00', '', '', '2019-05-18'),
(103, 'Zeeshan', 25, '0.00', '120.00', '0.00', '120.00', '', '', 2, '2019-05-20 16:30:00', '', '', '2019-05-19'),
(104, 'Madina', 140, '0.00', '838.60', '0.00', '838.60', '', '', 2, '2019-05-21 19:00:00', '', '', '2019-05-20'),
(105, 'Madina', 90, '0.00', '629.10', '0.00', '629.10', '', '', 2, '2019-05-22 20:00:00', '', '', '2019-05-20'),
(106, 'Umer', 25, '0.00', '100.00', '0.00', '100.00', '', '', 2, '2019-05-22 18:30:00', '', '', '2019-05-20'),
(108, 'bilal', 25, '0.00', '40.00', '0.00', '40.00', '', '', 2, '2019-05-22 19:00:00', '', '', '2019-05-21'),
(109, 'Bilaa', 25, '0.00', '130.00', '0.00', '130.00', '6479262833', '', 2, '2019-05-23 17:30:00', '', '', '2019-05-21'),
(110, 'Sabir', 35, '0.00', '297.15', '0.00', '297.15', '4168547563', '', 2, '2019-05-23 18:30:00', '', '', '2019-05-21'),
(111, 'Farzana', 25, '0.00', '187.50', '0.00', '187.50', '4164574175', '', 2, '2019-05-23 18:30:00', '', '', '2019-05-21'),
(112, 'Muzzafar Tabish', 30, '0.00', '224.70', '0.00', '224.70', '6472675714', '', 2, '2019-05-24 19:30:00', '', '', '2019-05-21'),
(113, 'M. Khan', 40, '0.00', '359.60', '0.00', '359.60', '6472487054', '', 2, '2019-05-24 19:30:00', '', '', '2019-05-21'),
(114, 'M.Owais(Jame)', 70, '0.00', '255.00', '0.00', '255.00', '', '', 2, '2019-05-24 19:45:00', '', '', '2019-05-21'),
(115, 'Shoaib', 25, '0.00', '237.25', '0.00', '237.25', '', '', 2, '2019-05-24 18:30:00', '', '', '2019-05-21'),
(116, 'Sis Mumtaz', 200, '0.00', '200.00', '0.00', '200.00', '', '', 2, '2019-05-25 19:00:00', '', '', '2019-05-21'),
(117, 'Aysha Kamran', 25, '0.00', '224.75', '0.00', '224.75', '', '', 2, '2019-05-25 16:00:00', '', '', '2019-05-21'),
(118, 'Zahid Janjua', 30, '0.00', '239.70', '0.00', '239.70', '9055412680', '', 2, '2019-05-25 18:00:00', '', '', '2019-05-21'),
(119, 'Kamran', 25, '0.00', '224.75', '0.00', '224.75', '4168586319', '', 2, '2019-05-25 19:30:00', '', '', '2019-05-21'),
(120, 'Sohail Jaffer', 25, '0.00', '165.00', '0.00', '165.00', '4168245949', '', 2, '2019-05-25 19:00:00', '', '', '2019-05-21'),
(121, 'M.Naeem', 25, '0.00', '60.00', '0.00', '60.00', '6475751225', '', 2, '2019-05-25 19:00:00', '', '', '2019-05-21'),
(122, 'Waseem', 25, '0.00', '50.00', '0.00', '50.00', '4169082737', '', 2, '2019-05-25 12:00:00', '', '', '2019-05-21'),
(123, 'Mir Ahmad', 250, '0.00', '3.00', '0.00', '3.00', '', '', 2, '2019-05-25 18:30:00', '', '', '2019-05-21'),
(124, 'Ali Khan', 30, '0.00', '269.70', '0.00', '269.70', '6478767773', '', 2, '2019-05-26 20:00:00', '', '', '2019-05-21'),
(125, 'Habib Bhai', 175, '0.00', '1405.75', '0.00', '1405.75', '', '', 2, '2019-05-26 19:45:00', '', '', '2019-05-21'),
(126, 'Moaiz', 25, '0.00', '900.00', '0.00', '900.00', '4165666024', '', 2, '2019-05-26 18:00:00', '', '', '2019-05-21'),
(127, 'Sakina', 25, '0.00', '1301.00', '0.00', '1301.00', '4165202358', '', 2, '2019-05-26 18:30:00', '', '', '2019-05-21');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `item` int(11) DEFAULT NULL,
  `custom` varchar(50) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `package` int(11) DEFAULT NULL,
  `main` int(11) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `persons` smallint(6) UNSIGNED DEFAULT NULL,
  `spice` tinyint(4) DEFAULT NULL,
  `tray_lg` smallint(6) DEFAULT NULL,
  `tray_md` smallint(6) DEFAULT NULL,
  `tray_sm` smallint(6) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `extra_qty` int(4) UNSIGNED DEFAULT NULL,
  `extra_price` decimal(10,2) UNSIGNED DEFAULT NULL,
  `pkgprice` decimal(10,2) DEFAULT NULL,
  `ctmprice` decimal(10,2) UNSIGNED DEFAULT NULL,
  `sm_price` decimal(10,2) UNSIGNED DEFAULT NULL,
  `md_price` decimal(10,2) UNSIGNED DEFAULT NULL,
  `lg_price` decimal(10,2) UNSIGNED DEFAULT NULL,
  `pkgcmt` varchar(100) DEFAULT NULL,
  `total` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `d_total` decimal(10,2) UNSIGNED DEFAULT NULL,
  `pp` tinyint(3) UNSIGNED DEFAULT NULL,
  `list` smallint(3) UNSIGNED DEFAULT NULL,
  `delivery_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `item`, `custom`, `category`, `package`, `main`, `type`, `persons`, `spice`, `tray_lg`, `tray_md`, `tray_sm`, `description`, `qty`, `extra_qty`, `extra_price`, `pkgprice`, `ctmprice`, `sm_price`, `md_price`, `lg_price`, `pkgcmt`, `total`, `d_total`, `pp`, `list`, `delivery_time`) VALUES
(8, 1, 100, NULL, 100, 100, 100, 1, 250, NULL, 12, 0, 1, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '1872.50', NULL, 0, 1, '2019-05-07 10:00:00'),
(9, 1, 500, NULL, 200, 100, 100, 1, 250, NULL, 7, 0, 1, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '1872.50', NULL, 0, 1, '2019-05-07 10:00:00'),
(10, 1, 900, NULL, 300, 100, 100, 1, 250, NULL, 6, 0, 1, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '1872.50', NULL, 0, 1, '2019-05-07 10:00:00'),
(11, 1, 1600, NULL, 400, 100, 100, 1, 250, NULL, 6, 0, 1, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '1872.50', NULL, 0, 1, '2019-05-07 10:00:00'),
(12, 1, 2700, NULL, 1100, 100, 100, 1, 250, NULL, 0, 6, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '1872.50', NULL, 0, 4, '2019-05-07 10:00:00'),
(13, 1, 3000, NULL, 1200, 100, 100, 1, 250, NULL, NULL, NULL, NULL, '', 175, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '1872.50', NULL, 1, 5, '2019-05-07 10:00:00'),
(14, 1, 3200, NULL, 1300, 100, 100, 1, 250, NULL, NULL, NULL, NULL, '', 20, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '1872.50', NULL, 1, 3, '2019-05-07 10:00:00'),
(15, 1, 100200, NULL, NULL, NULL, 100, 2, NULL, NULL, 7, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '420.00', '420.00', 0, 1, '2019-05-07 10:00:00'),
(16, 2, 300, NULL, 100, 100, 100, 1, 25, NULL, 1, 0, 1, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '187.25', NULL, 0, 1, '2019-05-07 12:00:00'),
(17, 2, 700, NULL, 200, 100, 100, 1, 25, NULL, 1, 0, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '187.25', NULL, 0, 1, '2019-05-07 12:00:00'),
(18, 2, 1000, NULL, 300, 100, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '187.25', NULL, 0, 1, '2019-05-07 12:00:00'),
(19, 2, 1300, NULL, 400, 100, 100, 1, 25, NULL, NULL, NULL, NULL, '', 50, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '187.25', NULL, 1, 6, '2019-05-07 12:00:00'),
(20, 2, 2700, NULL, 1100, 100, 100, 1, 25, NULL, 0, 0, 1, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '187.25', NULL, 0, 4, '2019-05-07 12:00:00'),
(21, 2, 3000, NULL, 1200, 100, 100, 1, 25, NULL, NULL, NULL, NULL, '', 18, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '187.25', NULL, 1, 5, '2019-05-07 12:00:00'),
(22, 2, 3200, NULL, 1300, 100, 100, 1, 25, NULL, NULL, NULL, NULL, '', 2, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '187.25', NULL, 1, 3, '2019-05-07 12:00:00'),
(23, 3, 101800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 100, NULL, NULL, NULL, '2.50', NULL, NULL, NULL, NULL, '250.00', '250.00', 1, 2, '2019-05-08 13:00:00'),
(31, 5, 100000, NULL, NULL, NULL, 100, 2, NULL, 2, 14, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '840.00', '840.00', 0, 1, '2019-05-09 19:00:00'),
(32, 5, 1, 'White Rice', NULL, NULL, 100, 3, NULL, NULL, 20, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-05-09 19:00:00'),
(33, 6, 0, NULL, 100, 100, 100, 1, 150, NULL, 7, 0, 1, '', NULL, NULL, NULL, '1.99', NULL, NULL, NULL, NULL, '', '298.50', NULL, 0, 1, '2019-05-09 19:00:00'),
(34, 6, 0, NULL, 200, 100, 100, 1, 150, NULL, 4, 0, 1, '', NULL, NULL, NULL, '1.99', NULL, NULL, NULL, NULL, '', '298.50', NULL, 0, 1, '2019-05-09 19:00:00'),
(35, 6, 0, NULL, 300, 100, 100, 1, 150, NULL, 4, 0, 0, '', NULL, NULL, NULL, '1.99', NULL, NULL, NULL, NULL, '', '298.50', NULL, 0, 1, '2019-05-09 19:00:00'),
(36, 6, 0, NULL, 400, 100, 100, 1, 150, NULL, 4, 0, 0, '', NULL, NULL, NULL, '1.99', NULL, NULL, NULL, NULL, '', '298.50', NULL, 0, 1, '2019-05-09 19:00:00'),
(37, 6, 2700, NULL, 1100, 100, 100, 1, 150, NULL, 0, 3, 1, '', NULL, NULL, NULL, '1.99', NULL, NULL, NULL, NULL, '', '298.50', NULL, 0, 4, '2019-05-09 19:00:00'),
(38, 6, 3100, NULL, 1200, 100, 100, 1, 150, NULL, NULL, NULL, NULL, '', 150, NULL, NULL, '1.99', NULL, NULL, NULL, NULL, '', '298.50', NULL, 1, 5, '2019-05-09 19:00:00'),
(39, 6, 3200, NULL, 1300, 100, 100, 1, 150, NULL, NULL, NULL, NULL, '', 12, NULL, NULL, '1.99', NULL, NULL, NULL, NULL, '', '298.50', NULL, 1, 3, '2019-05-09 19:00:00'),
(40, 6, 100000, NULL, NULL, NULL, 100, 2, NULL, NULL, 5, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '300.00', '300.00', 0, 1, '2019-05-09 19:00:00'),
(41, 6, 100300, NULL, NULL, NULL, 100, 2, NULL, NULL, 7, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '420.00', '420.00', 0, 1, '2019-05-09 19:00:00'),
(42, 6, 101400, NULL, NULL, NULL, 100, 2, NULL, NULL, 4, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '200.00', '200.00', 0, 6, '2019-05-09 19:00:00'),
(43, 6, 101710, NULL, NULL, NULL, 100, 2, NULL, NULL, 3, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '150.00', '150.00', 0, 1, '2019-05-09 19:00:00'),
(44, 6, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 9, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-05-09 19:00:00'),
(45, 7, 101600, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 1, 0, '', NULL, NULL, NULL, NULL, NULL, '45.00', '70.00', '90.00', NULL, '70.00', '70.00', 0, 1, '2019-05-10 17:00:00'),
(46, 8, 200, NULL, 100, 400, 100, 1, 30, NULL, 1, 0, 1, 'give extra rice', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '254.70', NULL, 0, 1, '2019-05-10 17:00:00'),
(47, 8, 0, NULL, 300, 400, 100, 1, 30, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '254.70', NULL, 0, 1, '2019-05-10 17:00:00'),
(48, 8, 1200, NULL, 400, 400, 100, 1, 30, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '254.70', NULL, 0, 6, '2019-05-10 17:00:00'),
(49, 8, 1800, NULL, 500, 400, 100, 1, 30, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '254.70', NULL, 0, 1, '2019-05-10 17:00:00'),
(50, 8, 2100, NULL, 600, 400, 100, 1, 30, NULL, NULL, NULL, NULL, '', 60, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '254.70', NULL, 1, 2, '2019-05-10 17:00:00'),
(51, 8, 2700, NULL, 1100, 400, 100, 1, 30, NULL, 0, 0, 1, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '254.70', NULL, 0, 4, '2019-05-10 17:00:00'),
(52, 8, 0, NULL, 1200, 400, 100, 1, 30, NULL, 0, 0, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '254.70', NULL, 0, 1, '2019-05-10 17:00:00'),
(53, 8, 3200, NULL, 1300, 400, 100, 1, 30, NULL, NULL, NULL, NULL, '', 4, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '254.70', NULL, 1, 3, '2019-05-10 17:00:00'),
(54, 9, 400, NULL, 100, 100, 100, 1, 30, 2, 1, 0, 1, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '224.70', NULL, 0, 1, '2019-05-10 18:00:00'),
(55, 9, 800, NULL, 200, 100, 100, 1, 30, 2, 1, 0, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '224.70', NULL, 0, 1, '2019-05-10 18:00:00'),
(56, 9, 1000, NULL, 300, 100, 100, 1, 30, 2, 1, 0, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '224.70', NULL, 0, 1, '2019-05-10 18:00:00'),
(57, 9, 1200, NULL, 400, 100, 100, 1, 30, NULL, 1, 0, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '224.70', NULL, 0, 6, '2019-05-10 18:00:00'),
(58, 9, 2700, NULL, 1100, 100, 100, 1, 30, NULL, 0, 0, 1, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '224.70', NULL, 0, 4, '2019-05-10 18:00:00'),
(59, 9, 3000, NULL, 1200, 100, 100, 1, 30, 2, NULL, NULL, NULL, '', 21, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '224.70', NULL, 1, 5, '2019-05-10 18:00:00'),
(60, 9, 3200, NULL, 1300, 100, 100, 1, 30, NULL, NULL, NULL, NULL, '', 4, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '224.70', NULL, 1, 3, '2019-05-10 18:00:00'),
(68, 11, 400, NULL, 100, 300, 100, 1, 25, NULL, 1, 0, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 0, 1, '2019-05-10 18:15:00'),
(69, 11, 700, NULL, 200, 300, 100, 1, 25, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 0, 1, '2019-05-10 18:15:00'),
(70, 11, 1000, NULL, 300, 300, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 0, 1, '2019-05-10 18:15:00'),
(71, 11, 1200, NULL, 400, 300, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 0, 6, '2019-05-10 18:15:00'),
(72, 11, 2300, NULL, 600, 300, 100, 1, 25, NULL, NULL, NULL, NULL, '', 25, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 1, 2, '2019-05-10 18:15:00'),
(73, 11, 2700, NULL, 1100, 300, 100, 1, 25, NULL, 0, 0, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 0, 4, '2019-05-10 18:15:00'),
(74, 11, 3000, NULL, 1200, 300, 100, 1, 25, NULL, NULL, NULL, NULL, '', 18, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 1, 5, '2019-05-10 18:15:00'),
(75, 11, 3200, NULL, 1300, 300, 100, 1, 25, NULL, NULL, NULL, NULL, '', 2, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 1, 3, '2019-05-10 18:15:00'),
(76, 11, 100500, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '70.00', '70.00', 0, 1, '2019-05-10 18:15:00'),
(77, 11, 101800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 13, NULL, NULL, NULL, '2.50', NULL, NULL, NULL, NULL, '32.00', '32.50', 1, 2, '2019-05-10 18:15:00'),
(78, 12, 100, NULL, 100, 300, 100, 1, 25, NULL, 1, 0, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 0, 1, '2019-05-10 19:00:00'),
(79, 12, 700, NULL, 200, 300, 100, 1, 25, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 0, 1, '2019-05-10 19:00:00'),
(80, 12, 1000, NULL, 300, 300, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 0, 1, '2019-05-10 19:00:00'),
(81, 12, 1200, NULL, 400, 300, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 0, 6, '2019-05-10 19:00:00'),
(82, 12, 2300, NULL, 600, 300, 100, 1, 25, NULL, NULL, NULL, NULL, '', 25, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 1, 2, '2019-05-10 19:00:00'),
(83, 12, 2700, NULL, 1100, 300, 100, 1, 25, NULL, 0, 0, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 0, 4, '2019-05-10 19:00:00'),
(84, 12, 3000, NULL, 1200, 300, 100, 1, 25, NULL, NULL, NULL, NULL, '2 extra', 18, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 1, 5, '2019-05-10 19:00:00'),
(85, 12, 3200, NULL, 1300, 300, 100, 1, 25, NULL, NULL, NULL, NULL, '', 2, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 1, 3, '2019-05-10 19:00:00'),
(86, 12, 101100, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, 'one serving', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '35.00', '35.00', 0, 1, '2019-05-10 19:00:00'),
(87, 12, 101700, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, 'onr serving if availble', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '35.00', '35.00', 0, 1, '2019-05-10 19:00:00'),
(88, 13, 300, NULL, 100, 100, 100, 1, 70, NULL, 3, 0, 1, '', NULL, NULL, NULL, '3.99', NULL, NULL, NULL, NULL, '', '279.30', NULL, 0, 1, '2019-05-10 19:00:00'),
(89, 13, 0, NULL, 200, 100, 100, 1, 70, NULL, 2, 0, 0, '', NULL, NULL, NULL, '3.99', NULL, NULL, NULL, NULL, '', '279.30', NULL, 0, 1, '2019-05-10 19:00:00'),
(90, 13, 0, NULL, 300, 100, 100, 1, 70, NULL, 2, 0, 0, '', NULL, NULL, NULL, '3.99', NULL, NULL, NULL, NULL, '', '279.30', NULL, 0, 1, '2019-05-10 19:00:00'),
(91, 13, 1400, NULL, 400, 100, 100, 1, 70, NULL, 2, 0, 0, '', NULL, NULL, NULL, '3.99', NULL, NULL, NULL, NULL, '', '279.30', NULL, 0, 6, '2019-05-10 19:00:00'),
(92, 13, 0, NULL, 1100, 100, 100, 1, 70, NULL, 0, 1, 1, '', NULL, NULL, NULL, '3.99', NULL, NULL, NULL, NULL, '', '279.30', NULL, 0, 1, '2019-05-10 19:00:00'),
(93, 13, 0, NULL, 1200, 100, 100, 1, 70, NULL, 0, 0, 0, '', NULL, NULL, NULL, '3.99', NULL, NULL, NULL, NULL, '', '279.30', NULL, 0, 1, '2019-05-10 19:00:00'),
(94, 13, 3200, NULL, 1300, 100, 100, 1, 70, NULL, NULL, NULL, NULL, '', 6, NULL, NULL, '3.99', NULL, NULL, NULL, NULL, '', '279.30', NULL, 1, 3, '2019-05-10 19:00:00'),
(95, 13, 1, 'Bindi Gosh', NULL, NULL, 100, 3, NULL, NULL, 2, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-05-10 19:00:00'),
(99, 15, 100300, NULL, NULL, NULL, 100, 2, NULL, 2, 15, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '900.00', '900.00', 0, 1, '2019-05-10 19:30:00'),
(100, 15, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 10, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-05-10 19:30:00'),
(101, 16, 100, NULL, 100, 300, 100, 1, 40, NULL, 2, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '359.60', NULL, 0, 1, '2019-05-11 17:00:00'),
(102, 16, 600, NULL, 200, 300, 100, 1, 40, NULL, 1, 0, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '359.60', NULL, 0, 1, '2019-05-11 17:00:00'),
(103, 16, 1000, NULL, 300, 300, 100, 1, 40, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '359.60', NULL, 0, 1, '2019-05-11 17:00:00'),
(104, 16, 1200, NULL, 400, 300, 100, 1, 40, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '359.60', NULL, 0, 6, '2019-05-11 17:00:00'),
(105, 16, 2100, NULL, 600, 300, 100, 1, 40, NULL, NULL, NULL, NULL, '', 80, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '359.60', NULL, 1, 2, '2019-05-11 17:00:00'),
(106, 16, 2700, NULL, 1100, 300, 100, 1, 40, NULL, 0, 1, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '359.60', NULL, 0, 4, '2019-05-11 17:00:00'),
(107, 16, 3000, NULL, 1200, 300, 100, 1, 40, NULL, NULL, NULL, NULL, '', 28, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '359.60', NULL, 1, 5, '2019-05-11 17:00:00'),
(108, 16, 3200, NULL, 1300, 300, 100, 1, 40, NULL, NULL, NULL, NULL, '', 4, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '359.60', NULL, 1, 3, '2019-05-11 17:00:00'),
(109, 17, 100500, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '70.00', '70.00', 0, 1, '2019-05-11 15:00:00'),
(110, 17, 100600, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '40.00', '70.00', '90.00', NULL, '90.00', '90.00', 0, 1, '2019-05-11 15:00:00'),
(111, 17, 101400, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '50.00', '50.00', 0, 6, '2019-05-11 15:00:00'),
(112, 18, 101400, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '25.00', '25.00', 0, 6, '2019-05-11 14:00:00'),
(122, 20, 400, NULL, 100, 400, 100, 1, 25, NULL, 1, 0, 1, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '249.75', NULL, 0, 1, '2019-05-11 19:00:00'),
(123, 20, 1100, NULL, 300, 400, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '249.75', NULL, 0, 1, '2019-05-11 19:00:00'),
(124, 20, 1200, NULL, 400, 400, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '249.75', NULL, 0, 6, '2019-05-11 19:00:00'),
(125, 20, 1900, NULL, 500, 400, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '249.75', NULL, 0, 1, '2019-05-11 19:00:00'),
(126, 20, 2100, NULL, 600, 400, 100, 1, 25, NULL, NULL, NULL, NULL, '', 50, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '249.75', NULL, 1, 2, '2019-05-11 19:00:00'),
(127, 20, 2700, NULL, 1100, 400, 100, 1, 25, NULL, 0, 0, 1, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '249.75', NULL, 0, 4, '2019-05-11 19:00:00'),
(128, 20, 3000, NULL, 1200, 400, 100, 1, 25, NULL, NULL, NULL, NULL, '', 18, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '249.75', NULL, 1, 5, '2019-05-11 19:00:00'),
(129, 20, 3200, NULL, 1300, 400, 100, 1, 25, NULL, NULL, NULL, NULL, '', 2, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '249.75', NULL, 1, 3, '2019-05-11 19:00:00'),
(130, 21, 200, NULL, 100, 100, 100, 1, 25, NULL, 1, 0, 1, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '174.75', NULL, 0, 1, '2019-05-11 19:00:00'),
(131, 21, 700, NULL, 200, 100, 100, 1, 25, NULL, 1, 0, 0, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '174.75', NULL, 0, 1, '2019-05-11 19:00:00'),
(132, 21, 0, NULL, 300, 100, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '174.75', NULL, 0, 1, '2019-05-11 19:00:00'),
(133, 21, 1200, NULL, 400, 100, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '174.75', NULL, 0, 6, '2019-05-11 19:00:00'),
(134, 21, 2700, NULL, 1100, 100, 100, 1, 25, NULL, 0, 0, 1, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '174.75', NULL, 0, 4, '2019-05-11 19:00:00'),
(135, 21, 3000, NULL, 1200, 100, 100, 1, 25, NULL, NULL, NULL, NULL, '', 18, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '174.75', NULL, 1, 5, '2019-05-11 19:00:00'),
(136, 21, 3200, NULL, 1300, 100, 100, 1, 25, NULL, NULL, NULL, NULL, '', 2, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '174.75', NULL, 1, 3, '2019-05-11 19:00:00'),
(137, 22, 100500, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '35.00', '35.00', 0, 1, '2019-05-11 21:00:00'),
(138, 22, 101400, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, 'no NUTS', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '25.00', '25.00', 0, 6, '2019-05-11 21:00:00'),
(139, 22, 101900, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 25, NULL, NULL, NULL, '2.50', NULL, NULL, NULL, NULL, '62.00', '62.50', 1, 2, '2019-05-11 21:00:00'),
(140, 22, 102000, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 20, NULL, NULL, NULL, '3.50', NULL, NULL, NULL, NULL, '70.00', '70.00', 1, 2, '2019-05-11 21:00:00'),
(170, 26, 200, NULL, 100, 100, 100, 1, 70, NULL, 3, 0, 1, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '489.30', NULL, 0, 1, '2019-05-12 20:00:00'),
(171, 26, 600, NULL, 200, 100, 100, 1, 70, NULL, 2, 0, 0, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '489.30', NULL, 0, 1, '2019-05-12 20:00:00'),
(172, 26, 0, NULL, 300, 100, 100, 1, 70, NULL, 2, 0, 0, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '489.30', NULL, 0, 1, '2019-05-12 20:00:00'),
(173, 26, 1500, NULL, 400, 100, 100, 1, 70, NULL, 2, 0, 0, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '489.30', NULL, 0, 6, '2019-05-12 20:00:00'),
(174, 26, 2700, NULL, 1100, 100, 100, 1, 70, NULL, 0, 1, 1, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '489.30', NULL, 0, 4, '2019-05-12 20:00:00'),
(175, 26, 3000, NULL, 1200, 100, 100, 1, 70, NULL, NULL, NULL, NULL, '', 49, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '489.30', NULL, 1, 5, '2019-05-12 20:00:00'),
(176, 26, 3200, NULL, 1300, 100, 100, 1, 70, NULL, NULL, NULL, NULL, '', 6, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '489.30', NULL, 1, 3, '2019-05-12 20:00:00'),
(177, 27, 400, NULL, 100, 300, 100, 1, 50, NULL, 2, 0, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '449.50', NULL, 0, 1, '2019-05-12 19:00:00'),
(178, 27, 500, NULL, 200, 300, 100, 1, 50, NULL, 1, 1, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '449.50', NULL, 0, 1, '2019-05-12 19:00:00'),
(179, 27, 1100, NULL, 300, 300, 100, 1, 50, NULL, 1, 0, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '449.50', NULL, 0, 1, '2019-05-12 19:00:00'),
(180, 27, 1200, NULL, 400, 300, 100, 1, 50, NULL, 1, 0, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '449.50', NULL, 0, 6, '2019-05-12 19:00:00'),
(181, 27, 2100, NULL, 600, 300, 100, 1, 50, NULL, NULL, NULL, NULL, '', 100, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '449.50', NULL, 1, 2, '2019-05-12 19:00:00'),
(182, 27, 2700, NULL, 1100, 300, 100, 1, 50, NULL, 0, 1, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '449.50', NULL, 0, 4, '2019-05-12 19:00:00'),
(183, 27, 3000, NULL, 1200, 300, 100, 1, 50, NULL, NULL, NULL, NULL, '', 35, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '449.50', NULL, 1, 5, '2019-05-12 19:00:00'),
(184, 27, 3200, NULL, 1300, 300, 100, 1, 50, NULL, NULL, NULL, NULL, '', 4, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '449.50', NULL, 1, 3, '2019-05-12 19:00:00'),
(185, 27, 101800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 50, NULL, NULL, NULL, '2.50', NULL, NULL, NULL, NULL, '125.00', '125.00', 1, 2, '2019-05-12 19:00:00'),
(196, 28, 400, NULL, 100, 300, 100, 1, 250, NULL, 12, 0, 1, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '2122.50', NULL, 0, 1, '2019-05-11 19:15:00'),
(197, 28, 500, NULL, 200, 300, 100, 1, 250, NULL, 7, 0, 1, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '2122.50', NULL, 0, 1, '2019-05-11 19:15:00'),
(198, 28, 0, NULL, 300, 300, 100, 1, 250, NULL, 6, 0, 1, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '2122.50', NULL, 0, 1, '2019-05-11 19:15:00'),
(199, 28, 1200, NULL, 400, 300, 100, 1, 250, NULL, 6, 0, 1, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '2122.50', NULL, 0, 6, '2019-05-11 19:15:00'),
(200, 28, 2300, NULL, 600, 300, 100, 1, 250, NULL, NULL, NULL, NULL, '', 250, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '2122.50', NULL, 1, 2, '2019-05-11 19:15:00'),
(201, 28, 2700, NULL, 1100, 300, 100, 1, 250, NULL, 0, 6, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '2122.50', NULL, 0, 4, '2019-05-11 19:15:00'),
(202, 28, 3000, NULL, 1200, 300, 100, 1, 250, NULL, NULL, NULL, NULL, '', 175, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '2122.50', NULL, 1, 5, '2019-05-11 19:15:00'),
(203, 28, 3200, NULL, 1300, 300, 100, 1, 250, NULL, NULL, NULL, NULL, '', 20, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '2122.50', NULL, 1, 3, '2019-05-11 19:15:00'),
(204, 28, 1, 'Palak Paneer', NULL, NULL, 100, 3, NULL, NULL, 2, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-05-11 19:15:00'),
(205, 28, 1, 'Dal Fry', NULL, NULL, 100, 3, NULL, NULL, 2, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-05-11 19:15:00'),
(206, 29, 200, NULL, 100, 100, 100, 1, 100, NULL, 5, 0, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '749.00', NULL, 0, 1, '2019-05-09 19:00:00'),
(207, 29, 500, NULL, 200, 100, 100, 1, 100, NULL, 3, 0, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '749.00', NULL, 0, 1, '2019-05-09 19:00:00'),
(208, 29, 1000, NULL, 300, 100, 100, 1, 100, NULL, 2, 1, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '749.00', NULL, 0, 1, '2019-05-09 19:00:00'),
(209, 29, 1200, NULL, 400, 100, 100, 1, 100, NULL, 2, 1, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '749.00', NULL, 0, 6, '2019-05-09 19:00:00'),
(210, 29, 2700, NULL, 1100, 100, 100, 1, 100, NULL, 0, 2, 1, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '749.00', NULL, 0, 4, '2019-05-09 19:00:00'),
(211, 29, 3000, NULL, 1200, 100, 100, 1, 100, NULL, NULL, NULL, NULL, '75', 70, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '749.00', NULL, 1, 5, '2019-05-09 19:00:00'),
(212, 29, 3200, NULL, 1300, 100, 100, 1, 100, NULL, NULL, NULL, NULL, '', 8, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '749.00', NULL, 1, 3, '2019-05-09 19:00:00'),
(227, 4, 200, NULL, 100, 100, 100, 1, 70, NULL, 3, 0, 1, '', NULL, NULL, NULL, '5.99', NULL, NULL, NULL, NULL, '', '419.30', NULL, 0, 1, '2019-05-09 19:00:00'),
(228, 4, 500, NULL, 200, 100, 100, 1, 70, NULL, 2, 0, 0, '', NULL, NULL, NULL, '5.99', NULL, NULL, NULL, NULL, '', '419.30', NULL, 0, 1, '2019-05-09 19:00:00'),
(229, 4, 0, NULL, 300, 100, 100, 1, 70, NULL, 2, 0, 0, '', NULL, NULL, NULL, '5.99', NULL, NULL, NULL, NULL, '', '419.30', NULL, 0, 1, '2019-05-09 19:00:00'),
(230, 4, 1600, NULL, 400, 100, 100, 1, 70, NULL, 2, 0, 0, '', NULL, NULL, NULL, '5.99', NULL, NULL, NULL, NULL, '', '419.30', NULL, 0, 1, '2019-05-09 19:00:00'),
(231, 4, 0, NULL, 1100, 100, 100, 1, 70, NULL, 2, 0, 0, '', NULL, NULL, NULL, '5.99', NULL, NULL, NULL, NULL, '', '419.30', NULL, 0, 1, '2019-05-09 19:00:00'),
(232, 4, 0, NULL, 1200, 100, 100, 1, 70, NULL, 2, 0, 0, '', NULL, NULL, NULL, '5.99', NULL, NULL, NULL, NULL, '', '419.30', NULL, 0, 1, '2019-05-09 19:00:00'),
(233, 4, 3200, NULL, 1300, 100, 100, 1, 70, NULL, NULL, NULL, NULL, '', 6, NULL, NULL, '5.99', NULL, NULL, NULL, NULL, '', '419.30', NULL, 1, 3, '2019-05-09 19:00:00'),
(234, 14, 100300, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, 'less chicken', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '60.00', '60.00', 0, 1, '2019-05-10 19:30:00'),
(235, 14, 101400, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '25.00', '25.00', 0, 6, '2019-05-10 19:30:00'),
(236, 14, 101800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 25, NULL, NULL, NULL, '2.50', NULL, NULL, NULL, NULL, '62.00', '62.50', 1, 2, '2019-05-10 19:30:00'),
(237, 10, 100, NULL, 100, 200, 100, 1, 25, NULL, 1, 0, 1, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '212.25', NULL, 0, 1, '2019-05-10 18:30:00'),
(238, 10, 900, NULL, 300, 200, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '212.25', NULL, 0, 1, '2019-05-10 18:30:00'),
(239, 10, 1200, NULL, 400, 200, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '212.25', NULL, 0, 6, '2019-05-10 18:30:00'),
(240, 10, 1800, NULL, 500, 200, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '212.25', NULL, 0, 1, '2019-05-10 18:30:00'),
(241, 10, 2700, NULL, 1100, 200, 100, 1, 25, NULL, 0, 0, 1, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '212.25', NULL, 0, 4, '2019-05-10 18:30:00'),
(242, 10, 3000, NULL, 1200, 200, 100, 1, 25, NULL, NULL, NULL, NULL, '', 18, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '212.25', NULL, 1, 5, '2019-05-10 18:30:00'),
(243, 10, 3200, NULL, 1300, 200, 100, 1, 25, NULL, NULL, NULL, NULL, '', 2, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '212.25', NULL, 1, 3, '2019-05-10 18:30:00'),
(302, 24, 0, NULL, 100, 100, 100, 1, 550, NULL, 27, 0, 1, '', NULL, NULL, NULL, '1.49', NULL, NULL, NULL, NULL, '', '819.50', NULL, 0, 1, '2019-05-11 17:45:00'),
(303, 24, 0, NULL, 200, 100, 100, 1, 550, NULL, 27, 0, 1, '', NULL, NULL, NULL, '1.49', NULL, NULL, NULL, NULL, '', '819.50', NULL, 0, 1, '2019-05-11 17:45:00'),
(304, 24, 0, NULL, 300, 100, 100, 1, 550, NULL, 27, 0, 1, '', NULL, NULL, NULL, '1.49', NULL, NULL, NULL, NULL, '', '819.50', NULL, 0, 1, '2019-05-11 17:45:00'),
(305, 24, 0, NULL, 400, 100, 100, 1, 550, NULL, 27, 0, 1, '', NULL, NULL, NULL, '1.49', NULL, NULL, NULL, NULL, '', '819.50', NULL, 0, 1, '2019-05-11 17:45:00'),
(306, 24, 2700, NULL, 1100, 100, 100, 1, 550, NULL, 0, 13, 1, '', NULL, NULL, NULL, '1.49', NULL, NULL, NULL, NULL, '', '819.50', NULL, 0, 4, '2019-05-11 17:45:00'),
(307, 24, 0, NULL, 1200, 100, 100, 1, 550, NULL, 27, 0, 1, '', NULL, NULL, NULL, '1.49', NULL, NULL, NULL, NULL, '', '819.50', NULL, 0, 1, '2019-05-11 17:45:00'),
(308, 24, 0, NULL, 1300, 100, 100, 1, 550, NULL, 27, 0, 1, '', NULL, NULL, NULL, '1.49', NULL, NULL, NULL, NULL, '', '819.50', NULL, 0, 1, '2019-05-11 17:45:00'),
(309, 24, 102000, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, 'cut into 2 pc', 1800, NULL, NULL, NULL, '3.50', NULL, NULL, NULL, NULL, '6300.00', '6300.00', 1, 2, '2019-05-11 17:45:00'),
(310, 24, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '2 balti', 50, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-05-11 17:45:00'),
(311, 24, 1, 'V.Bir (8 POT rice 8.25 Meat 13))', NULL, NULL, 100, 3, NULL, NULL, 44, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-05-11 17:45:00'),
(312, 23, 0, NULL, 100, 100, 100, 1, 250, NULL, 12, 0, 1, '', NULL, NULL, NULL, '1.49', NULL, NULL, NULL, NULL, '', '372.50', NULL, 0, 1, '2019-05-11 19:00:00'),
(313, 23, 0, NULL, 200, 100, 100, 1, 250, NULL, 12, 0, 1, '', NULL, NULL, NULL, '1.49', NULL, NULL, NULL, NULL, '', '372.50', NULL, 0, 1, '2019-05-11 19:00:00'),
(314, 23, 0, NULL, 300, 100, 100, 1, 250, NULL, 12, 0, 1, '', NULL, NULL, NULL, '1.49', NULL, NULL, NULL, NULL, '', '372.50', NULL, 0, 1, '2019-05-11 19:00:00'),
(315, 23, 0, NULL, 400, 100, 100, 1, 250, NULL, 12, 0, 1, '', NULL, NULL, NULL, '1.49', NULL, NULL, NULL, NULL, '', '372.50', NULL, 0, 1, '2019-05-11 19:00:00'),
(316, 23, 2800, NULL, 1100, 100, 100, 1, 250, NULL, 0, 6, 0, '', NULL, NULL, NULL, '1.49', NULL, NULL, NULL, NULL, '', '372.50', NULL, 0, 4, '2019-05-11 19:00:00'),
(317, 23, 0, NULL, 1200, 100, 100, 1, 250, NULL, 12, 0, 1, '', NULL, NULL, NULL, '1.49', NULL, NULL, NULL, NULL, '', '372.50', NULL, 0, 1, '2019-05-11 19:00:00'),
(318, 23, 0, NULL, 1300, 100, 100, 1, 250, NULL, 12, 0, 1, '', NULL, NULL, NULL, '1.49', NULL, NULL, NULL, NULL, '', '372.50', NULL, 0, 1, '2019-05-11 19:00:00'),
(319, 23, 101000, NULL, NULL, NULL, 100, 2, NULL, 1, 20, 0, 0, 'Meat 11 KG in pot', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '1400.00', '1400.00', 0, 1, '2019-05-11 19:00:00'),
(320, 23, 101900, NULL, NULL, NULL, 100, 2, NULL, 1, NULL, NULL, NULL, '', 250, NULL, NULL, NULL, '2.50', NULL, NULL, NULL, NULL, '625.00', '625.00', 1, 2, '2019-05-11 19:00:00'),
(321, 23, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, 'Cuccumber and onion', 15, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-05-11 19:00:00'),
(332, 19, 0, NULL, 100, 300, 100, 1, 250, NULL, 12, 0, 1, '', NULL, NULL, NULL, '3.49', NULL, NULL, NULL, NULL, '', '872.50', NULL, 0, 1, '2019-05-11 17:30:00'),
(333, 19, 0, NULL, 200, 300, 100, 1, 250, NULL, 12, 0, 1, '', NULL, NULL, NULL, '3.49', NULL, NULL, NULL, NULL, '', '872.50', NULL, 0, 1, '2019-05-11 17:30:00'),
(334, 19, 0, NULL, 300, 300, 100, 1, 250, NULL, 12, 0, 1, '', NULL, NULL, NULL, '3.49', NULL, NULL, NULL, NULL, '', '872.50', NULL, 0, 1, '2019-05-11 17:30:00'),
(335, 19, 1200, NULL, 400, 300, 100, 1, 250, NULL, 6, 0, 1, '', NULL, NULL, NULL, '3.49', NULL, NULL, NULL, NULL, '', '872.50', NULL, 0, 6, '2019-05-11 17:30:00'),
(336, 19, 2300, NULL, 600, 300, 100, 1, 250, NULL, NULL, NULL, NULL, 'extra 30', 250, NULL, NULL, '3.49', NULL, NULL, NULL, NULL, '', '872.50', NULL, 1, 2, '2019-05-11 17:30:00'),
(337, 19, 0, NULL, 1100, 300, 100, 1, 250, NULL, 12, 0, 1, '', NULL, NULL, NULL, '3.49', NULL, NULL, NULL, NULL, '', '872.50', NULL, 0, 1, '2019-05-11 17:30:00'),
(338, 19, 0, NULL, 1200, 300, 100, 1, 250, NULL, 12, 0, 1, '', NULL, NULL, NULL, '3.49', NULL, NULL, NULL, NULL, '', '872.50', NULL, 0, 1, '2019-05-11 17:30:00'),
(339, 19, 3200, NULL, 1300, 300, 100, 1, 250, NULL, NULL, NULL, NULL, '', 20, NULL, NULL, '3.49', NULL, NULL, NULL, NULL, '', '872.50', NULL, 1, 3, '2019-05-11 17:30:00'),
(340, 19, 101800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 30, NULL, NULL, NULL, '2.50', NULL, NULL, NULL, NULL, '75.00', '75.00', 1, 2, '2019-05-11 17:30:00'),
(341, 19, 1, 'V.Puloa (3 POT Rice 7.5  Meat 9)', NULL, NULL, 100, 3, NULL, NULL, 0, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-05-11 17:30:00'),
(342, 31, 100, NULL, 100, 100, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '174.75', NULL, 0, 1, '2019-05-03 19:07:00'),
(343, 31, 800, NULL, 200, 100, 100, 1, 25, NULL, 0, 0, 0, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '174.75', NULL, 0, 1, '2019-05-03 19:07:00'),
(344, 31, 1000, NULL, 300, 100, 100, 1, 25, NULL, 1, 0, 0, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '174.75', NULL, 0, 1, '2019-05-03 19:07:00'),
(345, 31, 0, NULL, 400, 100, 100, 1, 25, NULL, 1, 0, 0, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '174.75', NULL, 0, 1, '2019-05-03 19:07:00'),
(346, 31, 2700, NULL, 1100, 100, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '174.75', NULL, 0, 4, '2019-05-03 19:07:00'),
(347, 31, 3000, NULL, 1200, 100, 100, 1, 25, NULL, NULL, NULL, NULL, '', 40, 22, '0.00', '6.99', NULL, NULL, NULL, NULL, '', '174.75', NULL, 1, 5, '2019-05-03 19:07:00'),
(348, 31, 3200, NULL, 1300, 100, 100, 1, 25, NULL, NULL, NULL, NULL, '', 9, 7, '0.00', '6.99', NULL, NULL, NULL, NULL, '', '174.75', NULL, 1, 3, '2019-05-03 19:07:00'),
(349, 32, 100900, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '35.00', '35.00', 0, 1, '2019-05-12 18:00:00'),
(350, 32, 102800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 8, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 5, '2019-05-12 18:00:00'),
(358, 34, 100000, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '0.00', '0.00', 0, 1, '2019-05-04 23:10:00'),
(362, 36, 100300, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, 'Masala dar', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '30.00', '30.00', 0, 1, '2019-05-12 16:00:00'),
(363, 37, 0, NULL, 100, 400, 100, 1, 225, NULL, 11, 0, 1, '', NULL, NULL, NULL, '6.49', NULL, NULL, NULL, NULL, '', '1460.25', NULL, 0, 1, '2019-05-12 18:00:00'),
(364, 37, 0, NULL, 300, 400, 100, 1, 225, NULL, 5, 1, 0, '', NULL, NULL, NULL, '6.49', NULL, NULL, NULL, NULL, '', '1460.25', NULL, 0, 1, '2019-05-12 18:00:00'),
(365, 37, 1200, NULL, 400, 400, 100, 1, 225, NULL, 5, 1, 0, '', NULL, NULL, NULL, '6.49', NULL, NULL, NULL, NULL, '', '1460.25', NULL, 0, 6, '2019-05-12 18:00:00'),
(366, 37, 1900, NULL, 500, 400, 100, 1, 225, NULL, 5, 1, 0, '', NULL, NULL, NULL, '6.49', NULL, NULL, NULL, NULL, '', '1460.25', NULL, 0, 1, '2019-05-12 18:00:00'),
(367, 37, 2100, NULL, 600, 400, 100, 1, 225, NULL, NULL, NULL, NULL, '', 450, 0, '0.00', '6.49', NULL, NULL, NULL, NULL, '', '1460.25', NULL, 1, 2, '2019-05-12 18:00:00'),
(368, 37, 2700, NULL, 1100, 400, 100, 1, 225, NULL, 0, 5, 1, '', NULL, NULL, NULL, '6.49', NULL, NULL, NULL, NULL, '', '1460.25', NULL, 0, 4, '2019-05-12 18:00:00'),
(369, 37, 0, NULL, 1200, 400, 100, 1, 225, NULL, 0, 0, 0, '', NULL, NULL, NULL, '6.49', NULL, NULL, NULL, NULL, '', '1460.25', NULL, 0, 1, '2019-05-12 18:00:00'),
(370, 37, 3200, NULL, 1300, 400, 100, 1, 225, NULL, NULL, NULL, NULL, '', 18, 0, '0.00', '6.49', NULL, NULL, NULL, NULL, '', '1460.25', NULL, 1, 3, '2019-05-12 18:00:00'),
(371, 37, 1, 'Chana Puloa(2 POT Rice 7.5 KG )', NULL, NULL, 100, 3, NULL, NULL, 0, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-05-12 18:00:00'),
(372, 38, 200, NULL, 100, 100, 100, 1, 25, NULL, 1, 0, 1, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '174.75', NULL, 0, 1, '2019-05-16 19:30:00'),
(373, 38, 500, NULL, 200, 100, 100, 1, 25, NULL, 1, 0, 0, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '174.75', NULL, 0, 1, '2019-05-16 19:30:00'),
(374, 38, 1000, NULL, 300, 100, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '174.75', NULL, 0, 1, '2019-05-16 19:30:00'),
(375, 38, 1200, NULL, 400, 100, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '174.75', NULL, 0, 6, '2019-05-16 19:30:00'),
(376, 38, 2700, NULL, 1100, 100, 100, 1, 25, NULL, 0, 0, 1, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '174.75', NULL, 0, 4, '2019-05-16 19:30:00'),
(377, 38, 3100, NULL, 1200, 100, 100, 1, 25, NULL, NULL, NULL, NULL, '', 25, 0, '0.00', '6.99', NULL, NULL, NULL, NULL, '', '174.75', NULL, 1, 5, '2019-05-16 19:30:00'),
(378, 38, 3200, NULL, 1300, 100, 100, 1, 25, NULL, NULL, NULL, NULL, '', 2, 0, '0.00', '6.99', NULL, NULL, NULL, NULL, '', '174.75', NULL, 1, 3, '2019-05-16 19:30:00'),
(395, 41, 100300, NULL, NULL, NULL, 100, 2, NULL, NULL, 10, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '600.00', '600.00', 0, 1, '2019-05-17 18:45:00'),
(396, 41, 101400, NULL, NULL, NULL, 100, 2, NULL, NULL, 5, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '250.00', '250.00', 0, 6, '2019-05-17 18:45:00'),
(397, 41, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 10, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-05-17 18:45:00'),
(445, 47, 400, NULL, 100, 300, 100, 1, 100, NULL, 5, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '899.00', NULL, 0, 1, '2019-05-18 18:00:00'),
(446, 47, 500, NULL, 200, 300, 100, 1, 100, NULL, 3, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '899.00', NULL, 0, 1, '2019-05-18 18:00:00'),
(447, 47, 1100, NULL, 300, 300, 100, 1, 100, NULL, 2, 1, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '899.00', NULL, 0, 1, '2019-05-18 18:00:00'),
(448, 47, 1200, NULL, 400, 300, 100, 1, 100, NULL, 2, 1, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '899.00', NULL, 0, 6, '2019-05-18 18:00:00'),
(449, 47, 2300, NULL, 600, 300, 100, 1, 100, NULL, NULL, NULL, NULL, '', 100, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '899.00', NULL, 1, 2, '2019-05-18 18:00:00'),
(450, 47, 2700, NULL, 1100, 300, 100, 1, 100, NULL, 0, 2, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '899.00', NULL, 0, 4, '2019-05-18 18:00:00'),
(451, 47, 3000, NULL, 1200, 300, 100, 1, 100, NULL, NULL, NULL, NULL, '', 80, 10, '15.00', '8.99', NULL, NULL, NULL, NULL, '', '899.00', NULL, 1, 5, '2019-05-18 18:00:00'),
(452, 47, 3200, NULL, 1300, 300, 100, 1, 100, NULL, NULL, NULL, NULL, '', 8, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '899.00', NULL, 1, 3, '2019-05-18 18:00:00'),
(453, 48, 100700, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '40.00', '50.00', '80.00', NULL, '80.00', '80.00', 0, 1, '2019-05-18 21:00:00'),
(454, 48, 101400, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '50.00', '50.00', 0, 6, '2019-05-18 21:00:00'),
(455, 48, 101800, NULL, NULL, NULL, 100, 2, NULL, 2, NULL, NULL, NULL, '', 25, NULL, NULL, NULL, '2.50', NULL, NULL, NULL, NULL, '62.50', '62.50', 1, 2, '2019-05-18 21:00:00'),
(456, 48, 101900, NULL, NULL, NULL, 100, 2, NULL, 2, NULL, NULL, NULL, '', 25, NULL, NULL, NULL, '2.50', NULL, NULL, NULL, NULL, '62.50', '62.50', 1, 2, '2019-05-18 21:00:00'),
(457, 48, 102800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 15, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 5, '2019-05-18 21:00:00'),
(511, 56, 101100, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '70.00', '70.00', 0, 1, '2019-05-19 18:30:00'),
(512, 56, 101700, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '70.00', '70.00', 0, 1, '2019-05-19 18:30:00'),
(513, 56, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 2, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-05-19 18:30:00'),
(514, 56, 102800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 15, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 5, '2019-05-19 18:30:00'),
(515, 57, 200, NULL, 100, 300, 100, 1, 100, NULL, 5, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '899.00', NULL, 0, 1, '2019-05-19 19:00:00'),
(516, 57, 700, NULL, 200, 300, 100, 1, 100, NULL, 3, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '899.00', NULL, 0, 1, '2019-05-19 19:00:00'),
(517, 57, 1100, NULL, 300, 300, 100, 1, 100, NULL, 2, 1, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '899.00', NULL, 0, 1, '2019-05-19 19:00:00'),
(518, 57, 1200, NULL, 400, 300, 100, 1, 100, NULL, 2, 1, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '899.00', NULL, 0, 6, '2019-05-19 19:00:00'),
(519, 57, 2100, NULL, 600, 300, 100, 1, 100, NULL, NULL, NULL, NULL, '', 200, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '899.00', NULL, 1, 2, '2019-05-19 19:00:00'),
(520, 57, 2700, NULL, 1100, 300, 100, 1, 100, NULL, 0, 2, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '899.00', NULL, 0, 4, '2019-05-19 19:00:00'),
(521, 57, 3000, NULL, 1200, 300, 100, 1, 100, NULL, NULL, NULL, NULL, '', 70, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '899.00', NULL, 1, 5, '2019-05-19 19:00:00'),
(522, 57, 3200, NULL, 1300, 300, 100, 1, 100, NULL, NULL, NULL, NULL, '', 8, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '899.00', NULL, 1, 3, '2019-05-19 19:00:00'),
(543, 61, 200, NULL, 100, 100, 100, 1, 25, NULL, 1, 0, 1, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '187.25', NULL, 0, 1, '2019-05-15 18:30:00'),
(544, 61, 700, NULL, 200, 100, 100, 1, 25, NULL, 1, 0, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '187.25', NULL, 0, 1, '2019-05-15 18:30:00'),
(545, 61, 1000, NULL, 300, 100, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '187.25', NULL, 0, 1, '2019-05-15 18:30:00'),
(546, 61, 1200, NULL, 400, 100, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '187.25', NULL, 0, 6, '2019-05-15 18:30:00'),
(547, 61, 2700, NULL, 1100, 100, 100, 1, 25, NULL, 0, 0, 1, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '187.25', NULL, 0, 4, '2019-05-15 18:30:00'),
(548, 61, 3000, NULL, 1200, 100, 100, 1, 25, NULL, NULL, NULL, NULL, '', 18, 0, '0.00', '7.49', NULL, NULL, NULL, NULL, '', '187.25', NULL, 1, 5, '2019-05-15 18:30:00'),
(549, 61, 3200, NULL, 1300, 100, 100, 1, 25, NULL, NULL, NULL, NULL, '', 2, 0, '0.00', '7.49', NULL, NULL, NULL, NULL, '', '187.25', NULL, 1, 3, '2019-05-15 18:30:00'),
(558, 46, 400, NULL, 100, 300, 100, 1, 35, NULL, 1, 1, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '314.65', NULL, 0, 1, '2019-05-18 19:00:00'),
(559, 46, 500, NULL, 200, 300, 100, 1, 35, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '314.65', NULL, 0, 1, '2019-05-18 19:00:00'),
(560, 46, 1000, NULL, 300, 300, 100, 1, 35, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '314.65', NULL, 0, 1, '2019-05-18 19:00:00'),
(561, 46, 1200, NULL, 400, 300, 100, 1, 35, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '314.65', NULL, 0, 6, '2019-05-18 19:00:00'),
(562, 46, 2100, NULL, 600, 300, 100, 1, 35, NULL, NULL, NULL, NULL, '', 88, 18, '36.00', '8.99', NULL, NULL, NULL, NULL, '', '314.65', NULL, 1, 2, '2019-05-18 19:00:00'),
(563, 46, 2700, NULL, 1100, 300, 100, 1, 35, NULL, 0, 1, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '314.65', NULL, 0, 4, '2019-05-18 19:00:00'),
(564, 46, 3000, NULL, 1200, 300, 100, 1, 35, NULL, NULL, NULL, NULL, '', 30, 5, '7.50', '8.99', NULL, NULL, NULL, NULL, '', '314.65', NULL, 1, 5, '2019-05-18 19:00:00'),
(565, 46, 3200, NULL, 1300, 300, 100, 1, 35, NULL, NULL, NULL, NULL, '', 4, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '314.65', NULL, 1, 3, '2019-05-18 19:00:00'),
(585, 66, 400, NULL, 100, 300, 100, 1, 50, NULL, 2, 0, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '449.50', NULL, 0, 1, '2019-05-17 18:00:00'),
(586, 66, 600, NULL, 200, 300, 100, 1, 50, NULL, 1, 1, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '449.50', NULL, 0, 1, '2019-05-17 18:00:00'),
(587, 66, 1000, NULL, 300, 300, 100, 1, 50, NULL, 1, 0, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '449.50', NULL, 0, 1, '2019-05-17 18:00:00'),
(588, 66, 1600, NULL, 400, 300, 100, 1, 50, NULL, 1, 0, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '449.50', NULL, 0, 1, '2019-05-17 18:00:00'),
(589, 66, 2300, NULL, 600, 300, 100, 1, 50, NULL, NULL, NULL, NULL, '', 50, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '449.50', NULL, 1, 2, '2019-05-17 18:00:00'),
(590, 66, 2700, NULL, 1100, 300, 100, 1, 50, NULL, 0, 1, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '449.50', NULL, 0, 4, '2019-05-17 18:00:00'),
(591, 66, 3000, NULL, 1200, 300, 100, 1, 50, NULL, NULL, NULL, NULL, '', 35, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '449.50', NULL, 1, 5, '2019-05-17 18:00:00'),
(592, 66, 3200, NULL, 1300, 300, 100, 1, 50, NULL, NULL, NULL, NULL, '', 4, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '449.50', NULL, 1, 3, '2019-05-17 18:00:00'),
(632, 39, 400, NULL, 100, 100, 100, 1, 150, 1, 7, 0, 1, '', NULL, NULL, NULL, '5.99', NULL, NULL, NULL, NULL, '', '898.50', NULL, 0, 1, '2019-05-16 19:00:00'),
(633, 39, 500, NULL, 200, 100, 100, 1, 150, 1, 4, 0, 1, '', NULL, NULL, NULL, '5.99', NULL, NULL, NULL, NULL, '', '898.50', NULL, 0, 1, '2019-05-16 19:00:00'),
(634, 39, 0, NULL, 300, 100, 100, 1, 150, NULL, 4, 0, 0, '', NULL, NULL, NULL, '5.99', NULL, NULL, NULL, NULL, '', '898.50', NULL, 0, 1, '2019-05-16 19:00:00'),
(635, 39, 1400, NULL, 400, 100, 100, 1, 150, NULL, 4, 0, 0, '', NULL, NULL, NULL, '5.99', NULL, NULL, NULL, NULL, '', '898.50', NULL, 0, 6, '2019-05-16 19:00:00'),
(636, 39, 0, NULL, 1100, 100, 100, 1, 150, NULL, 0, 3, 1, '', NULL, NULL, NULL, '5.99', NULL, NULL, NULL, NULL, '', '898.50', NULL, 0, 1, '2019-05-16 19:00:00'),
(637, 39, 0, NULL, 1200, 100, 100, 1, 150, NULL, 3, 0, 0, '', NULL, NULL, NULL, '5.99', NULL, NULL, NULL, NULL, '', '898.50', NULL, 0, 1, '2019-05-16 19:00:00'),
(638, 39, 3200, NULL, 1300, 100, 100, 1, 150, NULL, NULL, NULL, NULL, '', 12, 0, '0.00', '5.99', NULL, NULL, NULL, NULL, '', '898.50', NULL, 1, 3, '2019-05-16 19:00:00'),
(648, 69, 200, NULL, 100, 100, 100, 1, 25, NULL, 1, 0, 1, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '174.75', NULL, 0, 1, '2019-05-19 19:00:00'),
(649, 69, 700, NULL, 200, 100, 100, 1, 25, NULL, 1, 0, 0, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '174.75', NULL, 0, 1, '2019-05-19 19:00:00'),
(650, 69, 900, NULL, 300, 100, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '174.75', NULL, 0, 1, '2019-05-19 19:00:00'),
(651, 69, 1200, NULL, 400, 100, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '174.75', NULL, 0, 6, '2019-05-19 19:00:00'),
(652, 69, 2700, NULL, 1100, 100, 100, 1, 25, NULL, 0, 0, 1, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '174.75', NULL, 0, 4, '2019-05-19 19:00:00'),
(653, 69, 3100, NULL, 1200, 100, 100, 1, 25, NULL, NULL, NULL, NULL, '', 25, 0, '0.00', '6.99', NULL, NULL, NULL, NULL, '', '174.75', NULL, 1, 5, '2019-05-19 19:00:00'),
(654, 69, 3200, NULL, 1300, 100, 100, 1, 25, NULL, NULL, NULL, NULL, '', 2, 0, '0.00', '6.99', NULL, NULL, NULL, NULL, '', '174.75', NULL, 1, 3, '2019-05-19 19:00:00'),
(655, 70, 100, NULL, 100, 100, 100, 1, 40, NULL, 2, 0, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '299.60', NULL, 0, 1, '2019-05-19 18:00:00'),
(656, 70, 600, NULL, 200, 100, 100, 1, 40, NULL, 1, 0, 1, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '299.60', NULL, 0, 1, '2019-05-19 18:00:00'),
(657, 70, 1000, NULL, 300, 100, 100, 1, 40, NULL, 1, 0, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '299.60', NULL, 0, 1, '2019-05-19 18:00:00'),
(658, 70, 1200, NULL, 400, 100, 100, 1, 40, NULL, 1, 0, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '299.60', NULL, 0, 6, '2019-05-19 18:00:00'),
(659, 70, 2700, NULL, 1100, 100, 100, 1, 40, NULL, 0, 1, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '299.60', NULL, 0, 4, '2019-05-19 18:00:00'),
(660, 70, 3000, NULL, 1200, 100, 100, 1, 40, NULL, NULL, NULL, NULL, '', 28, 0, '0.00', '7.49', NULL, NULL, NULL, NULL, '', '299.60', NULL, 1, 5, '2019-05-19 18:00:00'),
(661, 70, 3200, NULL, 1300, 100, 100, 1, 40, NULL, NULL, NULL, NULL, '', 4, 0, '0.00', '7.49', NULL, NULL, NULL, NULL, '', '299.60', NULL, 1, 3, '2019-05-19 18:00:00'),
(662, 71, 100300, NULL, NULL, NULL, 100, 2, NULL, NULL, 4, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '240.00', '240.00', 0, 1, '2019-05-15 20:00:00'),
(663, 71, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 5, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-05-15 20:00:00'),
(664, 44, 1, 'Dal Ghosh  POT  40 KG Each', NULL, NULL, 100, 3, NULL, NULL, 0, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-05-15 19:30:00'),
(665, 44, 1, 'White Rice(2 POT Rice 11.5 KG', NULL, NULL, 100, 3, NULL, NULL, 0, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-05-15 19:30:00'),
(666, 72, 100600, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '40.00', '70.00', '90.00', NULL, '40.00', '40.00', 0, 1, '2019-05-15 16:00:00'),
(667, 72, 101100, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '35.00', '35.00', 0, 1, '2019-05-15 16:00:00'),
(668, 72, 101600, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '45.00', '70.00', '90.00', NULL, '45.00', '45.00', 0, 1, '2019-05-15 16:00:00'),
(669, 72, 102000, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 10, NULL, NULL, NULL, '3.50', NULL, NULL, NULL, NULL, '35.00', '35.00', 1, 2, '2019-05-15 16:00:00'),
(670, 73, 300, NULL, 100, 100, 100, 1, 120, 1, 6, 0, 0, '', NULL, NULL, NULL, '3.99', NULL, NULL, NULL, NULL, '', '478.80', NULL, 0, 1, '2019-05-15 19:30:00'),
(671, 73, 0, NULL, 200, 100, 100, 1, 120, NULL, 3, 1, 0, '', NULL, NULL, NULL, '3.99', NULL, NULL, NULL, NULL, '', '478.80', NULL, 0, 1, '2019-05-15 19:30:00'),
(672, 73, 0, NULL, 300, 100, 100, 1, 120, NULL, 3, 0, 0, '', NULL, NULL, NULL, '3.99', NULL, NULL, NULL, NULL, '', '478.80', NULL, 0, 1, '2019-05-15 19:30:00'),
(673, 73, 1200, NULL, 400, 100, 100, 1, 120, NULL, 3, 0, 0, '', NULL, NULL, NULL, '3.99', NULL, NULL, NULL, NULL, '', '478.80', NULL, 0, 6, '2019-05-15 19:30:00');
INSERT INTO `order_items` (`id`, `order_id`, `item`, `custom`, `category`, `package`, `main`, `type`, `persons`, `spice`, `tray_lg`, `tray_md`, `tray_sm`, `description`, `qty`, `extra_qty`, `extra_price`, `pkgprice`, `ctmprice`, `sm_price`, `md_price`, `lg_price`, `pkgcmt`, `total`, `d_total`, `pp`, `list`, `delivery_time`) VALUES
(674, 73, 0, NULL, 1100, 100, 100, 1, 120, NULL, 0, 3, 0, '', NULL, NULL, NULL, '3.99', NULL, NULL, NULL, NULL, '', '478.80', NULL, 0, 1, '2019-05-15 19:30:00'),
(675, 73, 0, NULL, 1200, 100, 100, 1, 120, NULL, 0, 0, 0, '', NULL, NULL, NULL, '3.99', NULL, NULL, NULL, NULL, '', '478.80', NULL, 0, 1, '2019-05-15 19:30:00'),
(676, 73, 3200, NULL, 1300, 100, 100, 1, 120, NULL, NULL, NULL, NULL, '', 10, 0, '0.00', '3.99', NULL, NULL, NULL, NULL, '', '478.80', NULL, 1, 3, '2019-05-15 19:30:00'),
(677, 73, 1, 'Aloo Ghosh( 120 PPL)', NULL, NULL, 100, 3, NULL, 1, 3, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '4.00', NULL, '12.00', '12.00', 0, 1, '2019-05-15 19:30:00'),
(678, 74, 100, NULL, 100, 300, 100, 1, 100, NULL, 5, 0, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '749.00', NULL, 0, 1, '2019-05-19 18:00:00'),
(679, 74, 600, NULL, 200, 300, 100, 1, 100, NULL, 3, 0, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '749.00', NULL, 0, 1, '2019-05-19 18:00:00'),
(680, 74, 0, NULL, 300, 300, 100, 1, 100, NULL, 2, 1, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '749.00', NULL, 0, 1, '2019-05-19 18:00:00'),
(681, 74, 0, NULL, 400, 300, 100, 1, 100, NULL, 2, 1, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '749.00', NULL, 0, 1, '2019-05-19 18:00:00'),
(682, 74, 2300, NULL, 600, 300, 100, 1, 100, NULL, NULL, NULL, NULL, 'cut into 3 pc', 100, 0, '0.00', '7.49', NULL, NULL, NULL, NULL, '', '749.00', NULL, 1, 2, '2019-05-19 18:00:00'),
(683, 74, 2700, NULL, 1100, 300, 100, 1, 100, NULL, 0, 2, 1, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '749.00', NULL, 0, 4, '2019-05-19 18:00:00'),
(684, 74, 3100, NULL, 1200, 300, 100, 1, 100, NULL, NULL, NULL, NULL, '', 100, 0, '0.00', '7.49', NULL, NULL, NULL, NULL, '', '749.00', NULL, 1, 5, '2019-05-19 18:00:00'),
(685, 74, 3200, NULL, 1300, 300, 100, 1, 100, NULL, NULL, NULL, NULL, '', 8, 0, '0.00', '7.49', NULL, NULL, NULL, NULL, '', '749.00', NULL, 1, 3, '2019-05-19 18:00:00'),
(686, 74, 101715, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 1, 0, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '40.00', '40.00', 0, 1, '2019-05-19 18:00:00'),
(697, 76, 100300, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '30.00', '30.00', 0, 1, '2019-05-17 19:00:00'),
(698, 76, 102000, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 10, NULL, NULL, NULL, '3.50', NULL, NULL, NULL, NULL, '35.00', '35.00', 1, 2, '2019-05-17 19:00:00'),
(699, 76, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 1, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-05-17 19:00:00'),
(700, 77, 100500, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '70.00', '70.00', 0, 1, '2019-05-19 13:30:00'),
(701, 77, 102800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 15, NULL, NULL, NULL, '1.50', NULL, NULL, NULL, NULL, '22.50', '22.50', 1, 5, '2019-05-19 13:30:00'),
(702, 25, 100, NULL, 100, 300, 100, 1, 100, NULL, 5, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '899.00', NULL, 0, 1, '2019-05-18 15:00:00'),
(703, 25, 600, NULL, 200, 300, 100, 1, 100, NULL, 3, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '899.00', NULL, 0, 1, '2019-05-18 15:00:00'),
(704, 25, 1100, NULL, 300, 300, 100, 1, 100, NULL, 2, 1, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '899.00', NULL, 0, 1, '2019-05-18 15:00:00'),
(705, 25, 1200, NULL, 400, 300, 100, 1, 100, NULL, 2, 1, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '899.00', NULL, 0, 6, '2019-05-18 15:00:00'),
(706, 25, 2100, NULL, 600, 300, 100, 1, 100, NULL, NULL, NULL, NULL, '', 200, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '899.00', NULL, 1, 2, '2019-05-18 15:00:00'),
(707, 25, 2700, NULL, 1100, 300, 100, 1, 100, NULL, 0, 2, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '899.00', NULL, 0, 4, '2019-05-18 15:00:00'),
(708, 25, 3000, NULL, 1200, 300, 100, 1, 100, NULL, NULL, NULL, NULL, '', 70, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '899.00', NULL, 1, 5, '2019-05-18 15:00:00'),
(709, 25, 3200, NULL, 1300, 300, 100, 1, 100, NULL, NULL, NULL, NULL, '', 8, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '899.00', NULL, 1, 3, '2019-05-18 15:00:00'),
(710, 78, 100300, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 1, 0, 'Mild', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '45.00', '45.00', 0, 1, '2019-05-17 17:00:00'),
(711, 78, 101800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, 'mild', 15, NULL, NULL, NULL, '2.50', NULL, NULL, NULL, NULL, '37.50', '37.50', 1, 2, '2019-05-17 17:00:00'),
(712, 78, 101900, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, 'mild', 10, NULL, NULL, NULL, '2.50', NULL, NULL, NULL, NULL, '25.00', '25.00', 1, 2, '2019-05-17 17:00:00'),
(713, 63, 100, NULL, 100, 300, 100, 1, 60, NULL, 3, 0, 0, 'Pack half half', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '539.40', NULL, 0, 1, '2019-05-17 19:00:00'),
(714, 63, 600, NULL, 200, 300, 100, 1, 60, NULL, 2, 0, 0, 'Pack half half', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '539.40', NULL, 0, 1, '2019-05-17 19:00:00'),
(715, 63, 900, NULL, 300, 300, 100, 1, 60, NULL, 1, 1, 0, 'Pack half half', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '539.40', NULL, 0, 1, '2019-05-17 19:00:00'),
(716, 63, 1200, NULL, 400, 300, 100, 1, 60, NULL, 1, 1, 0, 'Pack half half', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '539.40', NULL, 0, 6, '2019-05-17 19:00:00'),
(717, 63, 2100, NULL, 600, 300, 100, 1, 60, NULL, NULL, NULL, NULL, 'Pack half half', 120, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '539.40', NULL, 1, 2, '2019-05-17 19:00:00'),
(718, 63, 2700, NULL, 1100, 300, 100, 1, 60, NULL, 0, 1, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '539.40', NULL, 0, 4, '2019-05-17 19:00:00'),
(719, 63, 3000, NULL, 1200, 300, 100, 1, 60, NULL, NULL, NULL, NULL, '', 46, 4, '6.00', '8.99', NULL, NULL, NULL, NULL, '', '539.40', NULL, 1, 5, '2019-05-17 19:00:00'),
(720, 63, 3200, NULL, 1300, 300, 100, 1, 60, NULL, NULL, NULL, NULL, '', 6, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '539.40', NULL, 1, 3, '2019-05-17 19:00:00'),
(726, 80, 101400, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '25.00', '25.00', 0, 6, '2019-05-15 17:00:00'),
(727, 42, 400, NULL, 100, 300, 100, 1, 120, NULL, 6, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '1078.80', NULL, 0, 1, '2019-05-17 19:00:00'),
(728, 42, 700, NULL, 200, 300, 100, 1, 120, NULL, 3, 1, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '1078.80', NULL, 0, 1, '2019-05-17 19:00:00'),
(729, 42, 1100, NULL, 300, 300, 100, 1, 120, NULL, 3, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '1078.80', NULL, 0, 1, '2019-05-17 19:00:00'),
(730, 42, 1500, NULL, 400, 300, 100, 1, 120, NULL, 3, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '1078.80', NULL, 0, 6, '2019-05-17 19:00:00'),
(731, 42, 2300, NULL, 600, 300, 100, 1, 120, NULL, NULL, NULL, NULL, '', 120, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '1078.80', NULL, 1, 2, '2019-05-17 19:00:00'),
(732, 42, 2700, NULL, 1100, 300, 100, 1, 120, NULL, 0, 3, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '1078.80', NULL, 0, 4, '2019-05-17 19:00:00'),
(733, 42, 3000, NULL, 1200, 300, 100, 1, 120, NULL, NULL, NULL, NULL, '', 84, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '1078.80', NULL, 1, 5, '2019-05-17 19:00:00'),
(734, 42, 3200, NULL, 1300, 300, 100, 1, 120, NULL, NULL, NULL, NULL, '', 10, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '1078.80', NULL, 1, 3, '2019-05-17 19:00:00'),
(735, 42, 100300, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '30.00', '30.00', 0, 1, '2019-05-17 19:00:00'),
(736, 42, 101800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 25, NULL, NULL, NULL, '2.50', NULL, NULL, NULL, NULL, '62.50', '62.50', 1, 2, '2019-05-17 19:00:00'),
(737, 81, 400, NULL, 100, 200, 100, 1, 30, NULL, 1, 0, 1, 'Give only one tray and 3.5 KG Meat', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '254.70', NULL, 0, 1, '2019-05-17 19:30:00'),
(738, 81, 1000, NULL, 300, 200, 100, 1, 30, 1, 1, 0, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '254.70', NULL, 0, 1, '2019-05-17 19:30:00'),
(739, 81, 1200, NULL, 400, 200, 100, 1, 30, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '254.70', NULL, 0, 6, '2019-05-17 19:30:00'),
(740, 81, 1800, NULL, 500, 200, 100, 1, 30, 1, 1, 0, 0, 'extra mild', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '254.70', NULL, 0, 1, '2019-05-17 19:30:00'),
(741, 81, 2700, NULL, 1100, 200, 100, 1, 30, NULL, 0, 0, 1, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '254.70', NULL, 0, 4, '2019-05-17 19:30:00'),
(742, 81, 3000, NULL, 1200, 200, 100, 1, 30, NULL, NULL, NULL, NULL, '4 cut', 25, 4, '6.00', '8.49', NULL, NULL, NULL, NULL, '', '254.70', NULL, 1, 5, '2019-05-17 19:30:00'),
(743, 81, 3200, NULL, 1300, 200, 100, 1, 30, NULL, NULL, NULL, NULL, '', 4, 0, '0.00', '8.49', NULL, NULL, NULL, NULL, '', '254.70', NULL, 1, 3, '2019-05-17 19:30:00'),
(744, 81, 101500, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '25.00', '25.00', 0, 1, '2019-05-17 19:30:00'),
(745, 81, 102200, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 15, NULL, NULL, NULL, '7.50', NULL, NULL, NULL, NULL, '112.50', '112.50', 1, 2, '2019-05-17 19:30:00'),
(746, 45, 400, NULL, 100, 300, 100, 1, 140, NULL, 7, 0, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '1188.60', NULL, 0, 1, '2019-05-18 19:30:00'),
(747, 45, 500, NULL, 200, 300, 100, 1, 140, NULL, 4, 0, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '1188.60', NULL, 0, 1, '2019-05-18 19:30:00'),
(748, 45, 0, NULL, 300, 300, 100, 1, 140, NULL, 3, 1, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '1188.60', NULL, 0, 1, '2019-05-18 19:30:00'),
(749, 45, 1200, NULL, 400, 300, 100, 1, 140, NULL, 3, 1, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '1188.60', NULL, 0, 6, '2019-05-18 19:30:00'),
(750, 45, 2100, NULL, 600, 300, 100, 1, 140, NULL, NULL, NULL, NULL, '', 280, 0, '0.00', '8.49', NULL, NULL, NULL, NULL, '', '1188.60', NULL, 1, 2, '2019-05-18 19:30:00'),
(751, 45, 2700, NULL, 1100, 300, 100, 1, 140, NULL, 0, 3, 1, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '1188.60', NULL, 0, 4, '2019-05-18 19:30:00'),
(752, 45, 3000, NULL, 1200, 300, 100, 1, 140, NULL, NULL, NULL, NULL, '', 98, 0, '0.00', '8.49', NULL, NULL, NULL, NULL, '', '1188.60', NULL, 1, 5, '2019-05-18 19:30:00'),
(753, 45, 3200, NULL, 1300, 300, 100, 1, 140, NULL, NULL, NULL, NULL, '', 12, 0, '0.00', '8.49', NULL, NULL, NULL, NULL, '', '1188.60', NULL, 1, 3, '2019-05-18 19:30:00'),
(761, 82, 100500, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '70.00', '70.00', 0, 1, '2019-05-18 14:00:00'),
(762, 82, 101800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 25, NULL, NULL, NULL, '2.50', NULL, NULL, NULL, NULL, '62.50', '62.50', 1, 2, '2019-05-18 14:00:00'),
(763, 49, 300, NULL, 100, 300, 100, 1, 60, NULL, 3, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '539.40', NULL, 0, 1, '2019-05-17 18:30:00'),
(764, 49, 700, NULL, 200, 300, 100, 1, 60, NULL, 2, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '539.40', NULL, 0, 1, '2019-05-17 18:30:00'),
(765, 49, 1100, NULL, 300, 300, 100, 1, 60, NULL, 1, 1, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '539.40', NULL, 0, 1, '2019-05-17 18:30:00'),
(766, 49, 1200, NULL, 400, 300, 100, 1, 60, NULL, 1, 1, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '539.40', NULL, 0, 6, '2019-05-17 18:30:00'),
(767, 49, 2300, NULL, 600, 300, 100, 1, 60, NULL, NULL, NULL, NULL, '', 60, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '539.40', NULL, 1, 2, '2019-05-17 18:30:00'),
(768, 49, 2700, NULL, 1100, 300, 100, 1, 60, NULL, 0, 1, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '539.40', NULL, 0, 4, '2019-05-17 18:30:00'),
(769, 49, 3000, NULL, 1200, 300, 100, 1, 60, NULL, NULL, NULL, NULL, '', 42, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '539.40', NULL, 1, 5, '2019-05-17 18:30:00'),
(770, 49, 3200, NULL, 1300, 300, 100, 1, 60, NULL, NULL, NULL, NULL, '', 6, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '539.40', NULL, 1, 3, '2019-05-17 18:30:00'),
(771, 49, 100600, NULL, NULL, NULL, 100, 2, NULL, NULL, 2, 0, 0, 'for 60 PPL no Garnish on top', NULL, NULL, NULL, NULL, NULL, '40.00', '70.00', '90.00', NULL, '180.00', '180.00', 0, 1, '2019-05-17 18:30:00'),
(772, 58, 400, NULL, 100, 300, 100, 1, 150, NULL, 7, 0, 1, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '1273.50', NULL, 0, 1, '2019-05-19 18:00:00'),
(773, 58, 700, NULL, 200, 300, 100, 1, 150, NULL, 4, 0, 1, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '1273.50', NULL, 0, 1, '2019-05-19 18:00:00'),
(774, 58, 1000, NULL, 300, 300, 100, 1, 150, NULL, 4, 0, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '1273.50', NULL, 0, 1, '2019-05-19 18:00:00'),
(775, 58, 1400, NULL, 400, 300, 100, 1, 150, NULL, 4, 0, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '1273.50', NULL, 0, 6, '2019-05-19 18:00:00'),
(776, 58, 2200, NULL, 600, 300, 100, 1, 150, NULL, NULL, NULL, NULL, '', 150, 0, '0.00', '8.49', NULL, NULL, NULL, NULL, '', '1273.50', NULL, 1, 2, '2019-05-19 18:00:00'),
(777, 58, 2700, NULL, 1100, 300, 100, 1, 150, NULL, 0, 3, 1, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '1273.50', NULL, 0, 4, '2019-05-19 18:00:00'),
(778, 58, 3100, NULL, 1200, 300, 100, 1, 150, NULL, NULL, NULL, NULL, 'give only 120', 150, 0, '0.00', '8.49', NULL, NULL, NULL, NULL, '', '1273.50', NULL, 1, 5, '2019-05-19 18:00:00'),
(779, 58, 3200, NULL, 1300, 300, 100, 1, 150, NULL, NULL, NULL, NULL, '', 12, 0, '0.00', '8.49', NULL, NULL, NULL, NULL, '', '1273.50', NULL, 1, 3, '2019-05-19 18:00:00'),
(780, 58, 102800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 30, NULL, NULL, NULL, '1.50', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 5, '2019-05-19 18:00:00'),
(781, 54, 0, NULL, 100, 300, 100, 1, 250, NULL, 12, 0, 1, '', NULL, NULL, NULL, '2.99', NULL, NULL, NULL, NULL, '', '747.50', NULL, 0, 1, '2019-05-18 18:45:00'),
(782, 54, 0, NULL, 200, 300, 100, 1, 250, NULL, 12, 0, 1, '', NULL, NULL, NULL, '2.99', NULL, NULL, NULL, NULL, '', '747.50', NULL, 0, 1, '2019-05-18 18:45:00'),
(783, 54, 0, NULL, 300, 300, 100, 1, 250, NULL, 12, 0, 1, '', NULL, NULL, NULL, '2.99', NULL, NULL, NULL, NULL, '', '747.50', NULL, 0, 1, '2019-05-18 18:45:00'),
(784, 54, 0, NULL, 400, 300, 100, 1, 250, NULL, 12, 0, 1, '', NULL, NULL, NULL, '2.99', NULL, NULL, NULL, NULL, '', '747.50', NULL, 0, 1, '2019-05-18 18:45:00'),
(785, 54, 2300, NULL, 600, 300, 100, 1, 250, 2, NULL, NULL, NULL, '', 270, 20, '0.00', '2.99', NULL, NULL, NULL, NULL, '', '747.50', NULL, 1, 2, '2019-05-18 18:45:00'),
(786, 54, 2800, NULL, 1100, 300, 100, 1, 250, NULL, 0, 6, 0, '2 tub', NULL, NULL, NULL, '2.99', NULL, NULL, NULL, NULL, '', '747.50', NULL, 0, 4, '2019-05-18 18:45:00'),
(787, 54, 0, NULL, 1200, 300, 100, 1, 250, NULL, 12, 0, 1, '', NULL, NULL, NULL, '2.99', NULL, NULL, NULL, NULL, '', '747.50', NULL, 0, 1, '2019-05-18 18:45:00'),
(788, 54, 3200, NULL, 1300, 300, 100, 1, 250, NULL, NULL, NULL, NULL, 'balti cuecumber tomato carrot', 20, 0, '0.00', '2.99', NULL, NULL, NULL, NULL, '', '747.50', NULL, 1, 3, '2019-05-18 18:45:00'),
(789, 54, 1, 'CH . Pulao ( 3 POT Rice 6.25 3 pc Ch.)', NULL, NULL, 100, 3, NULL, NULL, 25, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-05-18 18:45:00'),
(793, 84, 100600, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '40.00', '70.00', '90.00', NULL, '90.00', '90.00', 0, 1, '2019-05-19 19:00:00'),
(794, 84, 102800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 12, NULL, NULL, NULL, '1.50', NULL, NULL, NULL, NULL, '18.00', '18.00', 1, 5, '2019-05-19 19:00:00'),
(795, 85, 100300, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '60.00', '60.00', 0, 1, '2019-05-19 19:00:00'),
(796, 85, 101000, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '35.00', '35.00', 0, 1, '2019-05-19 19:00:00'),
(797, 85, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 2, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-05-19 19:00:00'),
(813, 86, 0, NULL, 100, 300, 100, 1, 25, NULL, 1, 0, 1, '', NULL, NULL, NULL, '6.49', NULL, NULL, NULL, NULL, '', '162.25', NULL, 0, 1, '2019-05-19 20:00:00'),
(814, 86, 600, NULL, 200, 300, 100, 1, 25, NULL, 1, 0, 0, '', NULL, NULL, NULL, '6.49', NULL, NULL, NULL, NULL, '', '162.25', NULL, 0, 1, '2019-05-19 20:00:00'),
(815, 86, 0, NULL, 300, 300, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '6.49', NULL, NULL, NULL, NULL, '', '162.25', NULL, 0, 1, '2019-05-19 20:00:00'),
(816, 86, 1200, NULL, 400, 300, 100, 1, 25, 1, 0, 1, 0, '', NULL, NULL, NULL, '6.49', NULL, NULL, NULL, NULL, '', '162.25', NULL, 0, 6, '2019-05-19 20:00:00'),
(817, 86, 2300, NULL, 600, 300, 100, 1, 25, 1, NULL, NULL, NULL, '', 25, 0, '0.00', '6.49', NULL, NULL, NULL, NULL, '', '162.25', NULL, 1, 2, '2019-05-19 20:00:00'),
(818, 86, 2800, NULL, 1100, 300, 100, 1, 25, NULL, 0, 0, 1, '', NULL, NULL, NULL, '6.49', NULL, NULL, NULL, NULL, '', '162.25', NULL, 0, 4, '2019-05-19 20:00:00'),
(819, 86, 3000, NULL, 1200, 300, 100, 1, 25, NULL, NULL, NULL, NULL, '', 18, 0, '0.00', '6.49', NULL, NULL, NULL, NULL, '', '162.25', NULL, 1, 5, '2019-05-19 20:00:00'),
(820, 86, 3200, NULL, 1300, 300, 100, 1, 25, NULL, NULL, NULL, NULL, 'cue cumber', 2, 0, '0.00', '6.49', NULL, NULL, NULL, NULL, '', '162.25', NULL, 1, 3, '2019-05-19 20:00:00'),
(821, 86, 1, 'V. Biryani V.Mild M =2.5 R=2.25', NULL, NULL, 100, 3, NULL, NULL, 1, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-05-19 20:00:00'),
(822, 87, 101100, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '70.00', '70.00', 0, 1, '2019-05-18 16:00:00'),
(826, 83, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 6, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-05-17 19:00:00'),
(827, 83, 102600, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 3, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.25', NULL, '0.00', '0.00', 0, 4, '2019-05-17 19:00:00'),
(828, 83, 1, 'V. Biryani Mild (M=13 R =8.25)', NULL, NULL, 100, 3, NULL, 2, 5, 0, 1, 'half is for Umair', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-05-17 19:00:00'),
(829, 65, 101400, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '25.00', '25.00', 0, 6, '2019-05-17 16:00:00'),
(848, 64, 100, NULL, 100, 400, 100, 1, 30, NULL, 1, 0, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '269.70', NULL, 0, 1, '2019-05-17 18:30:00'),
(849, 64, 0, NULL, 300, 400, 100, 1, 30, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '269.70', NULL, 0, 1, '2019-05-17 18:30:00'),
(850, 64, 1200, NULL, 400, 400, 100, 1, 30, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '269.70', NULL, 0, 6, '2019-05-17 18:30:00'),
(851, 64, 2000, NULL, 500, 400, 100, 1, 30, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '269.70', NULL, 0, 1, '2019-05-17 18:30:00'),
(852, 64, 2300, NULL, 600, 400, 100, 1, 30, NULL, NULL, NULL, NULL, '', 50, 20, '50.00', '8.99', NULL, NULL, NULL, NULL, '', '269.70', NULL, 1, 2, '2019-05-17 18:30:00'),
(853, 64, 2700, NULL, 1100, 400, 100, 1, 30, NULL, 0, 0, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '269.70', NULL, 0, 4, '2019-05-17 18:30:00'),
(854, 64, 3100, NULL, 1200, 400, 100, 1, 30, NULL, NULL, NULL, NULL, '', 30, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '269.70', NULL, 1, 5, '2019-05-17 18:30:00'),
(855, 64, 3200, NULL, 1300, 400, 100, 1, 30, NULL, NULL, NULL, NULL, '', 4, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '269.70', NULL, 1, 3, '2019-05-17 18:30:00'),
(856, 64, 1, 'Vagi Pasta', NULL, NULL, 100, 3, NULL, NULL, 0, 1, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-05-17 18:30:00'),
(874, 62, 100, NULL, 100, 300, 100, 1, 30, NULL, 1, 0, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '269.70', NULL, 0, 1, '2019-05-17 17:00:00'),
(875, 62, 600, NULL, 200, 300, 100, 1, 30, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '269.70', NULL, 0, 1, '2019-05-17 17:00:00'),
(876, 62, 1000, NULL, 300, 300, 100, 1, 30, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '269.70', NULL, 0, 1, '2019-05-17 17:00:00'),
(877, 62, 1200, NULL, 400, 300, 100, 1, 30, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '269.70', NULL, 0, 6, '2019-05-17 17:00:00'),
(878, 62, 2300, NULL, 600, 300, 100, 1, 30, NULL, NULL, NULL, NULL, '', 60, 30, '75.00', '8.99', NULL, NULL, NULL, NULL, '', '269.70', NULL, 1, 2, '2019-05-17 17:00:00'),
(879, 62, 2700, NULL, 1100, 300, 100, 1, 30, NULL, 0, 0, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '269.70', NULL, 0, 4, '2019-05-17 17:00:00'),
(880, 62, 3000, NULL, 1200, 300, 100, 1, 30, NULL, NULL, NULL, NULL, '', 21, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '269.70', NULL, 1, 5, '2019-05-17 17:00:00'),
(881, 62, 3200, NULL, 1300, 300, 100, 1, 30, NULL, NULL, NULL, NULL, '', 4, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '269.70', NULL, 1, 3, '2019-05-17 17:00:00'),
(882, 79, 101400, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '50.00', '50.00', 0, 6, '2019-05-17 17:00:00'),
(883, 79, 102000, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, 'jucy V.Mild', 35, NULL, NULL, NULL, '3.50', NULL, NULL, NULL, NULL, '122.50', '122.50', 1, 2, '2019-05-17 17:00:00'),
(884, 79, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 4, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-05-17 17:00:00'),
(885, 79, 102600, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 2, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.25', NULL, '0.00', '0.00', 0, 4, '2019-05-17 17:00:00'),
(906, 50, 0, NULL, 100, 400, 100, 1, 40, NULL, 2, 0, 0, 'with Aloo less spicy', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '299.60', NULL, 0, 1, '2019-05-17 18:00:00'),
(907, 50, 0, NULL, 300, 400, 100, 1, 40, NULL, 2, 0, 0, 'with Aloo less spicy', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '299.60', NULL, 0, 1, '2019-05-17 18:00:00'),
(908, 50, 1200, NULL, 400, 400, 100, 1, 40, NULL, 1, 0, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '299.60', NULL, 0, 6, '2019-05-17 18:00:00'),
(909, 50, 1800, NULL, 500, 400, 100, 1, 40, NULL, 1, 0, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '299.60', NULL, 0, 1, '2019-05-17 18:00:00'),
(910, 50, 2200, NULL, 600, 400, 100, 1, 40, NULL, NULL, NULL, NULL, 'Mild', 40, 0, '0.00', '7.49', NULL, NULL, NULL, NULL, '', '299.60', NULL, 1, 2, '2019-05-17 18:00:00'),
(911, 50, 2700, NULL, 1100, 400, 100, 1, 40, NULL, 0, 1, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '299.60', NULL, 0, 4, '2019-05-17 18:00:00'),
(912, 50, 3000, NULL, 1200, 400, 100, 1, 40, NULL, NULL, NULL, NULL, '', 28, 0, '0.00', '7.49', NULL, NULL, NULL, NULL, '', '299.60', NULL, 1, 5, '2019-05-17 18:00:00'),
(913, 50, 3200, NULL, 1300, 400, 100, 1, 40, NULL, NULL, NULL, NULL, '', 4, 0, '0.00', '7.49', NULL, NULL, NULL, NULL, '', '299.60', NULL, 1, 3, '2019-05-17 18:00:00'),
(914, 50, 1, 'Ch Biryani with Aloo 40 PPL M= 12.75R=8.00', NULL, NULL, 100, 3, NULL, 1, 2, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-05-17 18:00:00'),
(915, 50, 1, 'Ch Biryani with Aloo 40 PPL M= 12.75R=8.00', NULL, NULL, 100, 3, NULL, 1, 3, 0, 1, 'no Aloo', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-05-17 18:00:00'),
(932, 40, 0, NULL, 100, 100, 100, 1, 250, 1, 12, 0, 1, '', NULL, NULL, NULL, '3.99', NULL, NULL, NULL, NULL, '', '997.50', NULL, 0, 1, '2019-05-17 19:00:00'),
(933, 40, 600, NULL, 200, 100, 100, 1, 250, 1, 7, 0, 1, '', NULL, NULL, NULL, '3.99', NULL, NULL, NULL, NULL, '', '997.50', NULL, 0, 1, '2019-05-17 19:00:00'),
(934, 40, 0, NULL, 300, 100, 100, 1, 250, 1, 12, 0, 1, '', NULL, NULL, NULL, '3.99', NULL, NULL, NULL, NULL, '', '997.50', NULL, 0, 1, '2019-05-17 19:00:00'),
(935, 40, 1200, NULL, 400, 100, 100, 1, 250, NULL, 6, 0, 1, '', NULL, NULL, NULL, '3.99', NULL, NULL, NULL, NULL, '', '997.50', NULL, 0, 6, '2019-05-17 19:00:00'),
(936, 40, 0, NULL, 1100, 100, 100, 1, 250, 1, 12, 0, 1, '', NULL, NULL, NULL, '3.99', NULL, NULL, NULL, NULL, '', '997.50', NULL, 0, 1, '2019-05-17 19:00:00'),
(937, 40, 0, NULL, 1200, 100, 100, 1, 250, 1, 12, 0, 1, '', NULL, NULL, NULL, '3.99', NULL, NULL, NULL, NULL, '', '997.50', NULL, 0, 1, '2019-05-17 19:00:00'),
(938, 40, 3200, NULL, 1300, 100, 100, 1, 250, NULL, NULL, NULL, NULL, '', 20, 0, '0.00', '3.99', NULL, NULL, NULL, NULL, '', '997.50', NULL, 1, 3, '2019-05-17 19:00:00'),
(939, 40, 1, 'Ch Bir. (3 POT M=8.5 each R=6 one 6.5)', NULL, NULL, 100, 3, NULL, NULL, 0, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-05-17 19:00:00'),
(940, 67, 1, 'Ch. Qurma(450 PPL   4 POT  18.75 KG each', NULL, NULL, 100, 3, NULL, NULL, 0, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-05-18 19:30:00'),
(941, 67, 1, 'Chana (350 PPL)', NULL, NULL, 100, 3, NULL, NULL, 0, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-05-18 19:30:00'),
(942, 67, 1, 'Yellow Zarda with Gulab Jaman Rice 7.5 KG', NULL, NULL, 100, 3, NULL, NULL, 0, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-05-18 19:30:00'),
(950, 68, 100, NULL, 100, 200, 100, 1, 150, 1, 7, 0, 1, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '1048.50', NULL, 0, 1, '2019-05-18 19:30:00'),
(951, 68, 0, NULL, 300, 200, 100, 1, 150, NULL, 4, 0, 0, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '1048.50', NULL, 0, 1, '2019-05-18 19:30:00'),
(952, 68, 1200, NULL, 400, 200, 100, 1, 150, NULL, 4, 0, 0, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '1048.50', NULL, 0, 6, '2019-05-18 19:30:00'),
(953, 68, 1900, NULL, 500, 200, 100, 1, 150, 1, 4, 0, 0, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '1048.50', NULL, 0, 1, '2019-05-18 19:30:00'),
(954, 68, 0, NULL, 1100, 200, 100, 1, 150, NULL, 4, 0, 0, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '1048.50', NULL, 0, 1, '2019-05-18 19:30:00'),
(955, 68, 0, NULL, 1200, 200, 100, 1, 150, NULL, 4, 0, 0, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '1048.50', NULL, 0, 1, '2019-05-18 19:30:00'),
(956, 68, 3200, NULL, 1300, 200, 100, 1, 150, NULL, NULL, NULL, NULL, '', 12, 0, '0.00', '6.99', NULL, NULL, NULL, NULL, '', '1048.50', NULL, 1, 3, '2019-05-18 19:30:00'),
(957, 68, 100900, NULL, NULL, NULL, 100, 2, NULL, 1, 5, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '350.00', '350.00', 0, 1, '2019-05-18 19:30:00'),
(958, 68, 1, 'Aloo Mator (120 PPL)', NULL, NULL, 100, 3, NULL, 1, 2, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '20.00', NULL, '40.00', '40.00', 0, 1, '2019-05-18 19:30:00'),
(959, 59, 100, NULL, 100, 100, 100, 1, 200, NULL, 10, 0, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '1498.00', NULL, 0, 1, '2019-05-19 17:30:00'),
(960, 59, 600, NULL, 200, 100, 100, 1, 200, NULL, 6, 0, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '1498.00', NULL, 0, 1, '2019-05-19 17:30:00'),
(961, 59, 1000, NULL, 300, 100, 100, 1, 200, NULL, 5, 0, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '1498.00', NULL, 0, 1, '2019-05-19 17:30:00'),
(962, 59, 1600, NULL, 400, 100, 100, 1, 200, NULL, 5, 0, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '1498.00', NULL, 0, 1, '2019-05-19 17:30:00'),
(963, 59, 2700, NULL, 1100, 100, 100, 1, 200, NULL, 0, 5, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '1498.00', NULL, 0, 4, '2019-05-19 17:30:00'),
(964, 59, 3000, NULL, 1200, 100, 100, 1, 200, NULL, NULL, NULL, NULL, '', 150, 10, '15.00', '7.49', NULL, NULL, NULL, NULL, '', '1498.00', NULL, 1, 5, '2019-05-19 17:30:00'),
(965, 59, 3200, NULL, 1300, 100, 100, 1, 200, NULL, NULL, NULL, NULL, '', 16, 0, '0.00', '7.49', NULL, NULL, NULL, NULL, '', '1498.00', NULL, 1, 3, '2019-05-19 17:30:00'),
(973, 55, 200, NULL, 100, 100, 100, 1, 200, 2, 10, 0, 0, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '1398.00', NULL, 0, 1, '2019-05-19 19:30:00'),
(974, 55, 500, NULL, 200, 100, 100, 1, 200, 2, 6, 0, 0, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '1398.00', NULL, 0, 1, '2019-05-19 19:30:00'),
(975, 55, 0, NULL, 300, 100, 100, 1, 200, NULL, 5, 0, 0, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '1398.00', NULL, 0, 1, '2019-05-19 19:30:00'),
(976, 55, 1200, NULL, 400, 100, 100, 1, 200, NULL, 5, 0, 0, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '1398.00', NULL, 0, 6, '2019-05-19 19:30:00'),
(977, 55, 0, NULL, 1100, 100, 100, 1, 200, NULL, 5, 0, 0, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '1398.00', NULL, 0, 1, '2019-05-19 19:30:00'),
(978, 55, 3000, NULL, 1200, 100, 100, 1, 200, NULL, NULL, NULL, NULL, '', 140, 0, '0.00', '6.99', NULL, NULL, NULL, NULL, '', '1398.00', NULL, 1, 5, '2019-05-19 19:30:00'),
(979, 55, 3200, NULL, 1300, 100, 100, 1, 200, NULL, NULL, NULL, NULL, '', 16, 0, '0.00', '6.99', NULL, NULL, NULL, NULL, '', '1398.00', NULL, 1, 3, '2019-05-19 19:30:00'),
(990, 75, 200, NULL, 100, 300, 100, 1, 25, NULL, 1, 0, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 0, 1, '2019-05-19 13:00:00'),
(991, 75, 500, NULL, 200, 300, 100, 1, 25, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 0, 1, '2019-05-19 13:00:00'),
(992, 75, 1100, NULL, 300, 300, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 0, 1, '2019-05-19 13:00:00'),
(993, 75, 1600, NULL, 400, 300, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 0, 1, '2019-05-19 13:00:00'),
(994, 75, 2300, NULL, 600, 300, 100, 1, 25, NULL, NULL, NULL, NULL, '', 25, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 1, 2, '2019-05-19 13:00:00'),
(995, 75, 2700, NULL, 1100, 300, 100, 1, 25, NULL, 0, 0, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 0, 4, '2019-05-19 13:00:00'),
(996, 75, 3000, NULL, 1200, 300, 100, 1, 25, NULL, NULL, NULL, NULL, '', 18, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 1, 5, '2019-05-19 13:00:00'),
(997, 75, 3200, NULL, 1300, 300, 100, 1, 25, NULL, NULL, NULL, NULL, '', 2, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 1, 3, '2019-05-19 13:00:00'),
(998, 75, 100600, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '40.00', '70.00', '90.00', NULL, '40.00', '40.00', 0, 1, '2019-05-19 13:00:00'),
(999, 75, 101400, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 1, 0, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '40.00', '40.00', 0, 6, '2019-05-19 13:00:00'),
(1000, 88, 101100, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '105.00', '105.00', 0, 1, '2019-05-20 19:00:00'),
(1001, 88, 101400, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '50.00', '50.00', 0, 6, '2019-05-20 19:00:00'),
(1002, 88, 102000, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 29, NULL, NULL, NULL, '3.50', NULL, NULL, NULL, NULL, '101.50', '101.50', 1, 2, '2019-05-20 19:00:00'),
(1003, 88, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 3, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-05-20 19:00:00'),
(1008, 89, 100200, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '30.00', '30.00', 0, 1, '2019-05-20 17:00:00'),
(1009, 89, 100400, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '60.00', '60.00', 0, 1, '2019-05-20 17:00:00'),
(1010, 89, 100500, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '35.00', '35.00', 0, 1, '2019-05-20 17:00:00'),
(1011, 89, 101400, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '25.00', '25.00', 0, 6, '2019-05-20 17:00:00'),
(1012, 89, 101800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 17, NULL, NULL, NULL, '2.50', NULL, NULL, NULL, NULL, '42.50', '42.50', 1, 2, '2019-05-20 17:00:00'),
(1013, 90, 100600, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '40.00', '70.00', '90.00', NULL, '40.00', '40.00', 0, 1, '2019-05-20 16:00:00'),
(1021, 91, 200, NULL, 100, 100, 100, 1, 27, NULL, 1, 0, 1, 'Extra meat', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '202.23', NULL, 0, 1, '2019-05-06 19:00:00'),
(1022, 91, 500, NULL, 200, 100, 100, 1, 27, NULL, 1, 0, 0, 'Extra meat', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '202.23', NULL, 0, 1, '2019-05-06 19:00:00'),
(1023, 91, 1100, NULL, 300, 100, 100, 1, 27, NULL, 1, 0, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '202.23', NULL, 0, 1, '2019-05-06 19:00:00'),
(1024, 91, 1200, NULL, 400, 100, 100, 1, 27, NULL, 1, 0, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '202.23', NULL, 0, 6, '2019-05-06 19:00:00'),
(1025, 91, 2700, NULL, 1100, 100, 100, 1, 27, NULL, 0, 0, 1, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '202.23', NULL, 0, 4, '2019-05-06 19:00:00'),
(1026, 91, 3000, NULL, 1200, 100, 100, 1, 27, NULL, NULL, NULL, NULL, '', 19, 0, '0.00', '7.49', NULL, NULL, NULL, NULL, '', '202.23', NULL, 1, 5, '2019-05-06 19:00:00'),
(1027, 91, 3200, NULL, 1300, 100, 100, 1, 27, NULL, NULL, NULL, NULL, '', 4, 0, '0.00', '7.49', NULL, NULL, NULL, NULL, '', '202.23', NULL, 1, 3, '2019-05-06 19:00:00'),
(1028, 92, 0, NULL, 100, 200, 100, 1, 40, NULL, 2, 0, 0, '', NULL, NULL, NULL, '6.49', NULL, NULL, NULL, NULL, '', '259.60', NULL, 0, 1, '2019-05-20 13:00:00'),
(1029, 92, 1100, NULL, 300, 200, 100, 1, 40, NULL, 1, 0, 0, '', NULL, NULL, NULL, '6.49', NULL, NULL, NULL, NULL, '', '259.60', NULL, 0, 1, '2019-05-20 13:00:00'),
(1030, 92, 1200, NULL, 400, 200, 100, 1, 40, NULL, 1, 0, 0, '', NULL, NULL, NULL, '6.49', NULL, NULL, NULL, NULL, '', '259.60', NULL, 0, 6, '2019-05-20 13:00:00'),
(1031, 92, 1900, NULL, 500, 200, 100, 1, 40, NULL, 1, 0, 0, '', NULL, NULL, NULL, '6.49', NULL, NULL, NULL, NULL, '', '259.60', NULL, 0, 1, '2019-05-20 13:00:00'),
(1032, 92, 2700, NULL, 1100, 200, 100, 1, 40, NULL, 0, 1, 0, '', NULL, NULL, NULL, '6.49', NULL, NULL, NULL, NULL, '', '259.60', NULL, 0, 4, '2019-05-20 13:00:00'),
(1033, 92, 3000, NULL, 1200, 200, 100, 1, 40, NULL, NULL, NULL, NULL, '4 cut', 28, 0, '0.00', '6.49', NULL, NULL, NULL, NULL, '', '259.60', NULL, 1, 5, '2019-05-20 13:00:00'),
(1034, 92, 3200, NULL, 1300, 200, 100, 1, 40, NULL, NULL, NULL, NULL, '', 4, 0, '0.00', '6.49', NULL, NULL, NULL, NULL, '', '259.60', NULL, 1, 3, '2019-05-20 13:00:00'),
(1035, 92, 1, 'Motor Puloa(R=3 KG)', NULL, NULL, 100, 3, NULL, NULL, 2, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-05-20 13:00:00'),
(1036, 93, 100300, NULL, NULL, NULL, 100, 2, NULL, NULL, 5, 0, 0, 'Rice 7.5', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '300.00', '300.00', 0, 1, '2019-05-20 17:00:00'),
(1037, 93, 101400, NULL, NULL, NULL, 100, 2, NULL, NULL, 2, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '100.00', '100.00', 0, 6, '2019-05-20 17:00:00'),
(1038, 93, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 1, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-05-20 17:00:00'),
(1039, 94, 100200, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '30.00', '30.00', 0, 1, '2019-05-20 17:00:00'),
(1040, 94, 101100, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '35.00', '35.00', 0, 1, '2019-05-20 17:00:00'),
(1041, 94, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 1, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-05-20 17:00:00'),
(1042, 95, 100300, NULL, NULL, NULL, 100, 2, NULL, 2, 4, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '240.00', '240.00', 0, 1, '2019-05-21 20:00:00'),
(1043, 95, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 3, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-05-21 20:00:00'),
(1051, 97, 101000, NULL, NULL, NULL, 100, 2, NULL, 2, 4, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '315.00', '315.00', 0, 1, '2019-05-21 18:30:00'),
(1052, 97, 102000, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 40, NULL, NULL, NULL, '3.50', NULL, NULL, NULL, NULL, '140.00', '140.00', 1, 2, '2019-05-21 18:30:00'),
(1053, 97, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 5, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-05-21 18:30:00'),
(1078, 101, 100500, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '35.00', '35.00', 0, 1, '2019-05-22 16:00:00'),
(1084, 103, 101100, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '70.00', '70.00', 0, 1, '2019-05-20 16:30:00'),
(1085, 103, 101400, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '50.00', '50.00', 0, 6, '2019-05-20 16:30:00'),
(1086, 104, 300, NULL, 100, 100, 100, 1, 140, NULL, 7, 0, 0, '', NULL, NULL, NULL, '5.99', NULL, NULL, NULL, NULL, '', '838.60', NULL, 0, 1, '2019-05-21 19:00:00'),
(1087, 104, 600, NULL, 200, 100, 100, 1, 140, NULL, 4, 0, 0, '', NULL, NULL, NULL, '5.99', NULL, NULL, NULL, NULL, '', '838.60', NULL, 0, 1, '2019-05-21 19:00:00'),
(1088, 104, 0, NULL, 300, 100, 100, 1, 140, NULL, 3, 1, 0, '', NULL, NULL, NULL, '5.99', NULL, NULL, NULL, NULL, '', '838.60', NULL, 0, 1, '2019-05-21 19:00:00'),
(1089, 104, 1200, NULL, 400, 100, 100, 1, 140, NULL, 3, 1, 0, '', NULL, NULL, NULL, '5.99', NULL, NULL, NULL, NULL, '', '838.60', NULL, 0, 6, '2019-05-21 19:00:00'),
(1090, 104, 0, NULL, 1100, 100, 100, 1, 140, NULL, 0, 3, 1, '', NULL, NULL, NULL, '5.99', NULL, NULL, NULL, NULL, '', '838.60', NULL, 0, 1, '2019-05-21 19:00:00'),
(1091, 104, 0, NULL, 1200, 100, 100, 1, 140, NULL, 0, 0, 0, '', NULL, NULL, NULL, '5.99', NULL, NULL, NULL, NULL, '', '838.60', NULL, 0, 1, '2019-05-21 19:00:00'),
(1092, 104, 3200, NULL, 1300, 100, 100, 1, 140, NULL, NULL, NULL, NULL, '', 12, 0, '0.00', '5.99', NULL, NULL, NULL, NULL, '', '838.60', NULL, 1, 3, '2019-05-21 19:00:00'),
(1093, 104, 1, 'Aloo Gosh (140 PPL)', NULL, NULL, 100, 3, NULL, NULL, 4, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-05-21 19:00:00'),
(1126, 96, 0, NULL, 100, 100, 100, 1, 25, NULL, 1, 0, 1, '', NULL, NULL, NULL, '5.49', NULL, NULL, NULL, NULL, '', '137.25', NULL, 0, 1, '2019-05-21 18:35:00'),
(1127, 96, 600, NULL, 200, 100, 100, 1, 25, NULL, 1, 0, 0, '', NULL, NULL, NULL, '5.49', NULL, NULL, NULL, NULL, '', '137.25', NULL, 0, 1, '2019-05-21 18:35:00'),
(1128, 96, 1000, NULL, 300, 100, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '5.49', NULL, NULL, NULL, NULL, '', '137.25', NULL, 0, 1, '2019-05-21 18:35:00'),
(1129, 96, 1500, NULL, 400, 100, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '5.49', NULL, NULL, NULL, NULL, '', '137.25', NULL, 0, 6, '2019-05-21 18:35:00'),
(1130, 96, 2700, NULL, 1100, 100, 100, 1, 25, NULL, 0, 0, 1, '', NULL, NULL, NULL, '5.49', NULL, NULL, NULL, NULL, '', '137.25', NULL, 0, 4, '2019-05-21 18:35:00'),
(1131, 96, 3000, NULL, 1200, 100, 100, 1, 25, NULL, NULL, NULL, NULL, '', 25, 7, '10.50', '5.49', NULL, NULL, NULL, NULL, '', '137.25', NULL, 1, 5, '2019-05-21 18:35:00'),
(1132, 96, 3200, NULL, 1300, 100, 100, 1, 25, NULL, NULL, NULL, NULL, '', 2, 0, '0.00', '5.49', NULL, NULL, NULL, NULL, '', '137.25', NULL, 1, 3, '2019-05-21 18:35:00'),
(1133, 96, 1, 'Ch Bir(25 PPL R=2.25 M=2.5)', NULL, NULL, 100, 3, NULL, NULL, 1, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-05-21 18:35:00'),
(1142, 98, 0, NULL, 100, 300, 100, 1, 90, NULL, 4, 0, 1, '', NULL, NULL, NULL, '3.99', NULL, NULL, NULL, NULL, '', '359.10', NULL, 0, 1, '2019-05-21 19:30:00'),
(1143, 98, 0, NULL, 200, 300, 100, 1, 90, NULL, 4, 0, 1, '', NULL, NULL, NULL, '3.99', NULL, NULL, NULL, NULL, '', '359.10', NULL, 0, 1, '2019-05-21 19:30:00'),
(1144, 98, 1000, NULL, 300, 300, 100, 1, 90, NULL, 2, 0, 1, '', NULL, NULL, NULL, '3.99', NULL, NULL, NULL, NULL, '', '359.10', NULL, 0, 1, '2019-05-21 19:30:00'),
(1145, 98, 1200, NULL, 400, 300, 100, 1, 90, NULL, 2, 0, 1, '', NULL, NULL, NULL, '3.99', NULL, NULL, NULL, NULL, '', '359.10', NULL, 0, 6, '2019-05-21 19:30:00'),
(1146, 98, 2100, NULL, 600, 300, 100, 1, 90, NULL, NULL, NULL, NULL, '', 180, 0, '0.00', '3.99', NULL, NULL, NULL, NULL, '', '359.10', NULL, 1, 2, '2019-05-21 19:30:00'),
(1147, 98, 2700, NULL, 1100, 300, 100, 1, 90, NULL, 0, 2, 0, '', NULL, NULL, NULL, '3.99', NULL, NULL, NULL, NULL, '', '359.10', NULL, 0, 4, '2019-05-21 19:30:00'),
(1148, 98, 0, NULL, 1200, 300, 100, 1, 90, NULL, 4, 0, 1, '', NULL, NULL, NULL, '3.99', NULL, NULL, NULL, NULL, '', '359.10', NULL, 0, 1, '2019-05-21 19:30:00'),
(1149, 98, 3200, NULL, 1300, 300, 100, 1, 90, NULL, NULL, NULL, NULL, '', 8, 0, '0.00', '3.99', NULL, NULL, NULL, NULL, '', '359.10', NULL, 1, 3, '2019-05-21 19:30:00'),
(1150, 98, 1, 'Ch Bir.(90 PPL R=6.75 M=9)', NULL, NULL, 100, 3, NULL, NULL, 4, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-05-21 19:30:00'),
(1151, 106, 101715, NULL, NULL, NULL, 100, 2, NULL, NULL, 2, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '100.00', '100.00', 0, 1, '2019-05-22 18:30:00'),
(1161, 100, 0, NULL, 100, 300, 100, 1, 25, 1, 1, 0, 1, '', NULL, NULL, NULL, '6.49', NULL, NULL, NULL, NULL, '', '162.25', NULL, 0, 1, '2019-05-22 18:30:00'),
(1162, 100, 700, NULL, 200, 300, 100, 1, 25, 1, 1, 0, 0, '', NULL, NULL, NULL, '6.49', NULL, NULL, NULL, NULL, '', '162.25', NULL, 0, 1, '2019-05-22 18:30:00'),
(1163, 100, 1000, NULL, 300, 300, 100, 1, 25, 1, 0, 1, 0, '', NULL, NULL, NULL, '6.49', NULL, NULL, NULL, NULL, '', '162.25', NULL, 0, 1, '2019-05-22 18:30:00'),
(1164, 100, 1200, NULL, 400, 300, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '6.49', NULL, NULL, NULL, NULL, '', '162.25', NULL, 0, 6, '2019-05-22 18:30:00'),
(1165, 100, 2200, NULL, 600, 300, 100, 1, 25, 1, NULL, NULL, NULL, '', 25, 0, '0.00', '6.49', NULL, NULL, NULL, NULL, '', '162.25', NULL, 1, 2, '2019-05-22 18:30:00'),
(1166, 100, 2700, NULL, 1100, 300, 100, 1, 25, NULL, 0, 0, 1, '', NULL, NULL, NULL, '6.49', NULL, NULL, NULL, NULL, '', '162.25', NULL, 0, 4, '2019-05-22 18:30:00'),
(1167, 100, 3100, NULL, 1200, 300, 100, 1, 25, NULL, NULL, NULL, NULL, '', 25, 0, '0.00', '6.49', NULL, NULL, NULL, NULL, '', '162.25', NULL, 1, 5, '2019-05-22 18:30:00'),
(1168, 100, 3200, NULL, 1300, 300, 100, 1, 25, NULL, NULL, NULL, NULL, '', 2, 0, '0.00', '6.49', NULL, NULL, NULL, NULL, '', '162.25', NULL, 1, 3, '2019-05-22 18:30:00'),
(1169, 100, 1, 'Ch. Bir 25 PPL M=2.5 R=2.25)', NULL, NULL, 100, 3, NULL, 1, 1, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-05-22 18:30:00'),
(1170, 99, 400, NULL, 100, 300, 100, 1, 100, NULL, 5, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '899.00', NULL, 0, 1, '2019-05-22 19:00:00'),
(1171, 99, 500, NULL, 200, 300, 100, 1, 100, NULL, 3, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '899.00', NULL, 0, 1, '2019-05-22 19:00:00'),
(1172, 99, 1000, NULL, 300, 300, 100, 1, 100, NULL, 2, 1, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '899.00', NULL, 0, 1, '2019-05-22 19:00:00'),
(1173, 99, 1600, NULL, 400, 300, 100, 1, 100, NULL, 2, 1, 0, 'give only 2 tray', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '899.00', NULL, 0, 1, '2019-05-22 19:00:00'),
(1174, 99, 2100, NULL, 600, 300, 100, 1, 100, NULL, NULL, NULL, NULL, '', 200, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '899.00', NULL, 1, 2, '2019-05-22 19:00:00'),
(1175, 99, 2700, NULL, 1100, 300, 100, 1, 100, NULL, 0, 2, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '899.00', NULL, 0, 4, '2019-05-22 19:00:00'),
(1176, 99, 3000, NULL, 1200, 300, 100, 1, 100, NULL, NULL, NULL, NULL, '', 70, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '899.00', NULL, 1, 5, '2019-05-22 19:00:00'),
(1177, 99, 3200, NULL, 1300, 300, 100, 1, 100, NULL, NULL, NULL, NULL, '', 8, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '899.00', NULL, 1, 3, '2019-05-22 19:00:00'),
(1178, 105, 400, NULL, 100, 200, 100, 1, 90, NULL, 4, 0, 1, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '629.10', NULL, 0, 1, '2019-05-22 20:00:00'),
(1179, 105, 0, NULL, 300, 200, 100, 1, 90, NULL, 2, 0, 1, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '629.10', NULL, 0, 1, '2019-05-22 20:00:00'),
(1180, 105, 1600, NULL, 400, 200, 100, 1, 90, NULL, 2, 0, 1, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '629.10', NULL, 0, 1, '2019-05-22 20:00:00'),
(1181, 105, 1900, NULL, 500, 200, 100, 1, 90, NULL, 2, 0, 1, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '629.10', NULL, 0, 1, '2019-05-22 20:00:00'),
(1182, 105, 0, NULL, 1100, 200, 100, 1, 90, NULL, 2, 0, 1, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '629.10', NULL, 0, 1, '2019-05-22 20:00:00'),
(1183, 105, 0, NULL, 1200, 200, 100, 1, 90, NULL, 2, 0, 1, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '629.10', NULL, 0, 1, '2019-05-22 20:00:00'),
(1184, 105, 3200, NULL, 1300, 200, 100, 1, 90, NULL, NULL, NULL, NULL, '', 8, 0, '0.00', '6.99', NULL, NULL, NULL, NULL, '', '629.10', NULL, 1, 3, '2019-05-22 20:00:00'),
(1191, 102, 100700, NULL, NULL, NULL, 100, 2, NULL, NULL, 5, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '40.00', '50.00', '80.00', NULL, '400.00', '400.00', 0, 1, '2019-05-22 20:00:00'),
(1192, 102, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 8, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-05-22 20:00:00'),
(1193, 102, 1, 'White Rice (R=5.25)', NULL, NULL, 100, 3, NULL, NULL, 3, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-05-22 20:00:00'),
(1194, 102, 1, 'Vagi Pasta', NULL, NULL, 100, 3, NULL, NULL, 4, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-05-22 20:00:00'),
(1195, 102, 1, '2 POT Ch Bir( M=10 R=6)', NULL, NULL, 100, 3, NULL, NULL, 4, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-05-22 20:00:00'),
(1196, 102, 1, '2 POT Ch Bir( M=10 R=6)', NULL, NULL, 100, 3, NULL, NULL, 4, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-05-22 20:00:00'),
(1198, 108, 101500, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 1, 0, 'for thursday', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '40.00', '40.00', 0, 1, '2019-05-22 19:00:00'),
(1199, 109, 100300, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '90.00', '90.00', 0, 1, '2019-05-23 17:30:00'),
(1200, 109, 101500, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 1, 0, 'with Gulab Jaman', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '40.00', '40.00', 0, 1, '2019-05-23 17:30:00'),
(1201, 110, 200, NULL, 100, 300, 100, 1, 35, NULL, 1, 1, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '297.15', NULL, 0, 1, '2019-05-23 18:30:00'),
(1202, 110, 700, NULL, 200, 300, 100, 1, 35, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '297.15', NULL, 0, 1, '2019-05-23 18:30:00'),
(1203, 110, 1000, NULL, 300, 300, 100, 1, 35, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '297.15', NULL, 0, 1, '2019-05-23 18:30:00'),
(1204, 110, 1200, NULL, 400, 300, 100, 1, 35, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '297.15', NULL, 0, 6, '2019-05-23 18:30:00'),
(1205, 110, 2100, NULL, 600, 300, 100, 1, 35, NULL, NULL, NULL, NULL, '', 70, 0, '0.00', '8.49', NULL, NULL, NULL, NULL, '', '297.15', NULL, 1, 2, '2019-05-23 18:30:00');
INSERT INTO `order_items` (`id`, `order_id`, `item`, `custom`, `category`, `package`, `main`, `type`, `persons`, `spice`, `tray_lg`, `tray_md`, `tray_sm`, `description`, `qty`, `extra_qty`, `extra_price`, `pkgprice`, `ctmprice`, `sm_price`, `md_price`, `lg_price`, `pkgcmt`, `total`, `d_total`, `pp`, `list`, `delivery_time`) VALUES
(1206, 110, 2700, NULL, 1100, 300, 100, 1, 35, NULL, 0, 1, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '297.15', NULL, 0, 4, '2019-05-23 18:30:00'),
(1207, 110, 3100, NULL, 1200, 300, 100, 1, 35, NULL, NULL, NULL, NULL, '', 35, 0, '0.00', '8.49', NULL, NULL, NULL, NULL, '', '297.15', NULL, 1, 5, '2019-05-23 18:30:00'),
(1208, 110, 3200, NULL, 1300, 300, 100, 1, 35, NULL, NULL, NULL, NULL, '', 4, 0, '0.00', '8.49', NULL, NULL, NULL, NULL, '', '297.15', NULL, 1, 3, '2019-05-23 18:30:00'),
(1209, 111, 101400, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '25.00', '25.00', 0, 6, '2019-05-23 18:30:00'),
(1210, 111, 101715, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '25.00', '25.00', 0, 1, '2019-05-23 18:30:00'),
(1211, 111, 101800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, 'Less Salt', 25, NULL, NULL, NULL, '2.50', NULL, NULL, NULL, NULL, '62.50', '62.50', 1, 2, '2019-05-23 18:30:00'),
(1212, 111, 102400, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, 'Less Salt', 10, NULL, NULL, NULL, '7.50', NULL, NULL, NULL, NULL, '75.00', '75.00', 1, 2, '2019-05-23 18:30:00'),
(1213, 111, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 1, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-05-23 18:30:00'),
(1214, 112, 200, NULL, 100, 100, 100, 1, 30, NULL, 1, 0, 1, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '224.70', NULL, 0, 1, '2019-05-24 19:30:00'),
(1215, 112, 500, NULL, 200, 100, 100, 1, 30, NULL, 1, 0, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '224.70', NULL, 0, 1, '2019-05-24 19:30:00'),
(1216, 112, 1000, NULL, 300, 100, 100, 1, 30, NULL, 1, 0, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '224.70', NULL, 0, 1, '2019-05-24 19:30:00'),
(1217, 112, 1200, NULL, 400, 100, 100, 1, 30, NULL, 1, 0, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '224.70', NULL, 0, 6, '2019-05-24 19:30:00'),
(1218, 112, 2700, NULL, 1100, 100, 100, 1, 30, NULL, 0, 0, 1, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '224.70', NULL, 0, 4, '2019-05-24 19:30:00'),
(1219, 112, 3000, NULL, 1200, 100, 100, 1, 30, NULL, NULL, NULL, NULL, '', 21, 0, '0.00', '7.49', NULL, NULL, NULL, NULL, '', '224.70', NULL, 1, 5, '2019-05-24 19:30:00'),
(1220, 112, 3200, NULL, 1300, 100, 100, 1, 30, NULL, NULL, NULL, NULL, '', 4, 0, '0.00', '7.49', NULL, NULL, NULL, NULL, '', '224.70', NULL, 1, 3, '2019-05-24 19:30:00'),
(1221, 113, 100, NULL, 100, 300, 100, 1, 40, NULL, 2, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '359.60', NULL, 0, 1, '2019-05-24 19:30:00'),
(1222, 113, 600, NULL, 200, 300, 100, 1, 40, NULL, 1, 0, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '359.60', NULL, 0, 1, '2019-05-24 19:30:00'),
(1223, 113, 1000, NULL, 300, 300, 100, 1, 40, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '359.60', NULL, 0, 1, '2019-05-24 19:30:00'),
(1224, 113, 1200, NULL, 400, 300, 100, 1, 40, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '359.60', NULL, 0, 6, '2019-05-24 19:30:00'),
(1225, 113, 2100, NULL, 600, 300, 100, 1, 40, NULL, NULL, NULL, NULL, '', 80, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '359.60', NULL, 1, 2, '2019-05-24 19:30:00'),
(1226, 113, 2700, NULL, 1100, 300, 100, 1, 40, NULL, 0, 1, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '359.60', NULL, 0, 4, '2019-05-24 19:30:00'),
(1227, 113, 3000, NULL, 1200, 300, 100, 1, 40, NULL, NULL, NULL, NULL, '', 28, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '359.60', NULL, 1, 5, '2019-05-24 19:30:00'),
(1228, 113, 3200, NULL, 1300, 300, 100, 1, 40, NULL, NULL, NULL, NULL, '', 4, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '359.60', NULL, 1, 3, '2019-05-24 19:30:00'),
(1229, 113, 1, 'Haleem', NULL, NULL, 100, 3, NULL, NULL, 1, 0, 1, 'for 40 PPL', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-05-24 19:30:00'),
(1230, 114, 100200, NULL, NULL, NULL, 100, 2, NULL, NULL, 3, 0, 0, 'for 70 PPL', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '180.00', '180.00', 0, 1, '2019-05-24 19:45:00'),
(1231, 114, 101500, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 1, 'for 70 PPL', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '75.00', '75.00', 0, 1, '2019-05-24 19:45:00'),
(1232, 115, 400, NULL, 100, 400, 100, 1, 25, NULL, 1, 0, 1, '', NULL, NULL, NULL, '9.49', NULL, NULL, NULL, NULL, '', '237.25', NULL, 0, 1, '2019-05-24 18:30:00'),
(1233, 115, 0, NULL, 300, 400, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '9.49', NULL, NULL, NULL, NULL, '', '237.25', NULL, 0, 1, '2019-05-24 18:30:00'),
(1234, 115, 1200, NULL, 400, 400, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '9.49', NULL, NULL, NULL, NULL, '', '237.25', NULL, 0, 6, '2019-05-24 18:30:00'),
(1235, 115, 1800, NULL, 500, 400, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '9.49', NULL, NULL, NULL, NULL, '', '237.25', NULL, 0, 1, '2019-05-24 18:30:00'),
(1236, 115, 2300, NULL, 600, 400, 100, 1, 25, NULL, NULL, NULL, NULL, '', 25, 0, '0.00', '9.49', NULL, NULL, NULL, NULL, '', '237.25', NULL, 1, 2, '2019-05-24 18:30:00'),
(1237, 115, 2700, NULL, 1100, 400, 100, 1, 25, NULL, 0, 0, 1, '', NULL, NULL, NULL, '9.49', NULL, NULL, NULL, NULL, '', '237.25', NULL, 0, 4, '2019-05-24 18:30:00'),
(1238, 115, 3000, NULL, 1200, 400, 100, 1, 25, NULL, NULL, NULL, NULL, '', 18, 0, '0.00', '9.49', NULL, NULL, NULL, NULL, '', '237.25', NULL, 1, 5, '2019-05-24 18:30:00'),
(1239, 115, 3200, NULL, 1300, 400, 100, 1, 25, NULL, NULL, NULL, NULL, '', 2, 0, '0.00', '9.49', NULL, NULL, NULL, NULL, '', '237.25', NULL, 1, 3, '2019-05-24 18:30:00'),
(1240, 116, 101400, NULL, NULL, NULL, 100, 2, NULL, NULL, 4, 0, 0, 'for 200 PPL', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '200.00', '200.00', 0, 6, '2019-05-25 19:00:00'),
(1241, 116, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 10, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-05-25 19:00:00'),
(1242, 116, 1, '3 POT Ch Bir( M= ?  R=7.5*3)', NULL, NULL, 100, 3, NULL, 1, 15, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-05-25 19:00:00'),
(1243, 117, 400, NULL, 100, 300, 100, 1, 25, NULL, 1, 0, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 0, 1, '2019-05-25 16:00:00'),
(1244, 117, 500, NULL, 200, 300, 100, 1, 25, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 0, 1, '2019-05-25 16:00:00'),
(1245, 117, 1000, NULL, 300, 300, 100, 1, 25, NULL, 0, 1, 0, 'Soft', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 0, 1, '2019-05-25 16:00:00'),
(1246, 117, 1200, NULL, 400, 300, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 0, 6, '2019-05-25 16:00:00'),
(1247, 117, 2100, NULL, 600, 300, 100, 1, 25, NULL, NULL, NULL, NULL, '', 50, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 1, 2, '2019-05-25 16:00:00'),
(1248, 117, 2700, NULL, 1100, 300, 100, 1, 25, NULL, 0, 0, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 0, 4, '2019-05-25 16:00:00'),
(1249, 117, 3000, NULL, 1200, 300, 100, 1, 25, NULL, NULL, NULL, NULL, '', 18, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 1, 5, '2019-05-25 16:00:00'),
(1250, 117, 3200, NULL, 1300, 300, 100, 1, 25, NULL, NULL, NULL, NULL, '', 2, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 1, 3, '2019-05-25 16:00:00'),
(1251, 118, 200, NULL, 100, 300, 100, 1, 30, NULL, 1, 0, 1, 'Pack in 2 M', NULL, NULL, NULL, '7.99', NULL, NULL, NULL, NULL, '', '239.70', NULL, 0, 1, '2019-05-25 18:00:00'),
(1252, 118, 600, NULL, 200, 300, 100, 1, 30, NULL, 1, 0, 0, 'Pack in 2 M', NULL, NULL, NULL, '7.99', NULL, NULL, NULL, NULL, '', '239.70', NULL, 0, 1, '2019-05-25 18:00:00'),
(1253, 118, 1000, NULL, 300, 300, 100, 1, 30, NULL, 1, 0, 0, 'Pack in 2 S', NULL, NULL, NULL, '7.99', NULL, NULL, NULL, NULL, '', '239.70', NULL, 0, 1, '2019-05-25 18:00:00'),
(1254, 118, 1200, NULL, 400, 300, 100, 1, 30, NULL, 1, 0, 0, 'Pack in 2 S', NULL, NULL, NULL, '7.99', NULL, NULL, NULL, NULL, '', '239.70', NULL, 0, 6, '2019-05-25 18:00:00'),
(1255, 118, 2200, NULL, 600, 300, 100, 1, 30, 3, NULL, NULL, NULL, 'Pack 15+15', 30, 0, '0.00', '7.99', NULL, NULL, NULL, NULL, '', '239.70', NULL, 1, 2, '2019-05-25 18:00:00'),
(1256, 118, 2700, NULL, 1100, 300, 100, 1, 30, NULL, 0, 0, 1, '', NULL, NULL, NULL, '7.99', NULL, NULL, NULL, NULL, '', '239.70', NULL, 0, 4, '2019-05-25 18:00:00'),
(1257, 118, 0, NULL, 1200, 300, 100, 1, 30, NULL, 0, 0, 0, '', NULL, NULL, NULL, '7.99', NULL, NULL, NULL, NULL, '', '239.70', NULL, 0, 1, '2019-05-25 18:00:00'),
(1258, 118, 3200, NULL, 1300, 300, 100, 1, 30, NULL, NULL, NULL, NULL, '', 4, 0, '0.00', '7.99', NULL, NULL, NULL, NULL, '', '239.70', NULL, 1, 3, '2019-05-25 18:00:00'),
(1259, 119, 400, NULL, 100, 300, 100, 1, 25, NULL, 1, 0, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 0, 1, '2019-05-25 19:30:00'),
(1260, 119, 700, NULL, 200, 300, 100, 1, 25, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 0, 1, '2019-05-25 19:30:00'),
(1261, 119, 1000, NULL, 300, 300, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 0, 1, '2019-05-25 19:30:00'),
(1262, 119, 1400, NULL, 400, 300, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 0, 6, '2019-05-25 19:30:00'),
(1263, 119, 2100, NULL, 600, 300, 100, 1, 25, NULL, NULL, NULL, NULL, '', 50, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 1, 2, '2019-05-25 19:30:00'),
(1264, 119, 2700, NULL, 1100, 300, 100, 1, 25, NULL, 0, 0, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 0, 4, '2019-05-25 19:30:00'),
(1265, 119, 3000, NULL, 1200, 300, 100, 1, 25, NULL, NULL, NULL, NULL, '', 18, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 1, 5, '2019-05-25 19:30:00'),
(1266, 119, 3200, NULL, 1300, 300, 100, 1, 25, NULL, NULL, NULL, NULL, '', 2, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 1, 3, '2019-05-25 19:30:00'),
(1267, 120, 100500, NULL, NULL, NULL, 100, 2, NULL, NULL, 2, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '140.00', '140.00', 0, 1, '2019-05-25 19:00:00'),
(1268, 120, 101400, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '25.00', '25.00', 0, 6, '2019-05-25 19:00:00'),
(1269, 121, 100300, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '60.00', '60.00', 0, 1, '2019-05-25 19:00:00'),
(1270, 122, 101400, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 2, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '50.00', '50.00', 0, 6, '2019-05-25 12:00:00'),
(1273, 124, 400, NULL, 100, 300, 100, 1, 30, NULL, 1, 0, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '269.70', NULL, 0, 1, '2019-05-26 20:00:00'),
(1274, 124, 500, NULL, 200, 300, 100, 1, 30, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '269.70', NULL, 0, 1, '2019-05-26 20:00:00'),
(1275, 124, 1000, NULL, 300, 300, 100, 1, 30, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '269.70', NULL, 0, 1, '2019-05-26 20:00:00'),
(1276, 124, 1200, NULL, 400, 300, 100, 1, 30, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '269.70', NULL, 0, 6, '2019-05-26 20:00:00'),
(1277, 124, 2100, NULL, 600, 300, 100, 1, 30, NULL, NULL, NULL, NULL, '', 60, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '269.70', NULL, 1, 2, '2019-05-26 20:00:00'),
(1278, 124, 2700, NULL, 1100, 300, 100, 1, 30, NULL, 0, 0, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '269.70', NULL, 0, 4, '2019-05-26 20:00:00'),
(1279, 124, 3000, NULL, 1200, 300, 100, 1, 30, NULL, NULL, NULL, NULL, '', 21, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '269.70', NULL, 1, 5, '2019-05-26 20:00:00'),
(1280, 124, 3200, NULL, 1300, 300, 100, 1, 30, NULL, NULL, NULL, NULL, '', 4, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '269.70', NULL, 1, 3, '2019-05-26 20:00:00'),
(1281, 125, 0, NULL, 100, 100, 100, 1, 175, NULL, 8, 1, 0, '', NULL, NULL, NULL, '4.49', NULL, NULL, NULL, NULL, '', '785.75', NULL, 0, 1, '2019-05-26 19:45:00'),
(1282, 125, 500, NULL, 200, 100, 100, 1, 175, NULL, 5, 0, 0, '', NULL, NULL, NULL, '4.49', NULL, NULL, NULL, NULL, '', '785.75', NULL, 0, 1, '2019-05-26 19:45:00'),
(1283, 125, 1100, NULL, 300, 100, 100, 1, 175, NULL, 4, 1, 0, '', NULL, NULL, NULL, '4.49', NULL, NULL, NULL, NULL, '', '785.75', NULL, 0, 1, '2019-05-26 19:45:00'),
(1284, 125, 1300, NULL, 400, 100, 100, 1, 175, NULL, NULL, NULL, NULL, 'just 200 pc', 350, 0, '0.00', '4.49', NULL, NULL, NULL, NULL, '', '785.75', NULL, 1, 6, '2019-05-26 19:45:00'),
(1285, 125, 0, NULL, 1100, 100, 100, 1, 175, NULL, 0, 4, 0, '', NULL, NULL, NULL, '4.49', NULL, NULL, NULL, NULL, '', '785.75', NULL, 0, 1, '2019-05-26 19:45:00'),
(1286, 125, 0, NULL, 1200, 100, 100, 1, 175, NULL, 0, 0, 0, '', NULL, NULL, NULL, '4.49', NULL, NULL, NULL, NULL, '', '785.75', NULL, 0, 1, '2019-05-26 19:45:00'),
(1287, 125, 3200, NULL, 1300, 100, 100, 1, 175, NULL, NULL, NULL, NULL, '', 14, 0, '0.00', '4.49', NULL, NULL, NULL, NULL, '', '785.75', NULL, 1, 3, '2019-05-26 19:45:00'),
(1288, 125, 100500, NULL, NULL, NULL, 100, 2, NULL, NULL, 6, 0, 0, 'for 175 PPL and 1L extra', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '420.00', '420.00', 0, 1, '2019-05-26 19:45:00'),
(1289, 125, 101200, NULL, NULL, NULL, 100, 2, NULL, NULL, 4, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '200.00', '200.00', 0, 6, '2019-05-26 19:45:00'),
(1290, 125, 1, 'Chana Puloa( R=', NULL, NULL, 100, 3, NULL, NULL, 0, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-05-26 19:45:00'),
(1291, 126, 101000, NULL, NULL, NULL, 100, 2, NULL, NULL, 10, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '700.00', '700.00', 0, 1, '2019-05-26 18:00:00'),
(1292, 126, 101400, NULL, NULL, NULL, 100, 2, NULL, NULL, 4, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '200.00', '200.00', 0, 6, '2019-05-26 18:00:00'),
(1293, 126, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, 'give half small round', 20, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-05-26 18:00:00'),
(1294, 123, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, 'with cucumber onion tomato', 20, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-05-25 18:30:00'),
(1295, 123, 102700, NULL, NULL, NULL, 100, 2, NULL, NULL, 5, 0, 0, 'give in black bin', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '3.00', 0, 4, '2019-05-25 18:30:00'),
(1296, 123, 1, '4 POT (V.Puloa M=12 R=7.5)', NULL, NULL, 100, 3, NULL, 2, 12, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-05-25 18:30:00'),
(1297, 123, 1, 'Mali Boti( M=110 LB)', NULL, NULL, 100, 3, NULL, 2, 0, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-05-25 18:30:00'),
(1299, 127, 101705, NULL, NULL, NULL, 100, 2, NULL, NULL, 26, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '1300.00', '1300.00', 0, 1, '2019-05-26 18:30:00'),
(1300, 127, 102600, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 24, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.25', NULL, '0.00', '1.00', 0, 4, '2019-05-26 18:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `value1` decimal(5,1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `value1`) VALUES
(1, 'refresh_interval', '120.0');

-- --------------------------------------------------------

--
-- Table structure for table `sidebar`
--

CREATE TABLE `sidebar` (
  `id` int(10) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `admin` tinyint(4) DEFAULT NULL,
  `operator` tinyint(4) DEFAULT NULL,
  `chef` tinyint(4) DEFAULT NULL,
  `tandoor` tinyint(4) DEFAULT NULL,
  `manager` tinyint(4) DEFAULT NULL,
  `link` varchar(50) DEFAULT NULL,
  `allow` tinyint(4) DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `submenu` tinyint(4) DEFAULT NULL,
  `super` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sidebar`
--

INSERT INTO `sidebar` (`id`, `name`, `admin`, `operator`, `chef`, `tandoor`, `manager`, `link`, `allow`, `icon`, `submenu`, `super`) VALUES
(100, 'Booking', 1, 1, 0, 0, 0, 'booking.php', 1, 'fas fa-fw fa-book', 0, 0),
(105, 'Edit Order', 1, 1, 0, 0, 0, 'booking_edit.php', 0, NULL, 0, 0),
(110, 'Receipt', 1, 1, 0, 0, 0, 'receipt.php', 0, NULL, 0, 0),
(115, 'Admin Setting', 1, 0, 0, 0, 0, 'settings_admin.php', 0, NULL, 0, 1),
(200, 'Meat', 1, 0, 0, 0, 0, 'ingredients.php', 1, 'fas fa-clipboard-list', 0, 0),
(300, 'Kitchen', 1, 0, 1, 1, 0, 'kitchen.php', 1, 'fas fa-utensils', 0, 0),
(400, 'Orders List', 1, 1, 0, 0, 0, 'orders.php', 1, 'fas fa-fw fa-file-alt', 0, 0),
(500, 'Reports', 1, 0, 0, 0, 1, 'reports', 1, 'fa fa-chart-bar', 1, 0),
(600, 'Settings', 1, 0, 0, 0, 0, 'settings', 1, 'fa fa-cog', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sub_sidebar`
--

CREATE TABLE `sub_sidebar` (
  `id` int(11) NOT NULL,
  `main` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `admin` tinyint(4) DEFAULT NULL,
  `operator` tinyint(4) DEFAULT NULL,
  `chef` tinyint(4) DEFAULT NULL,
  `tandoor` tinyint(4) DEFAULT NULL,
  `manager` tinyint(4) DEFAULT NULL,
  `allow` tinyint(4) DEFAULT NULL,
  `link` varchar(50) DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub_sidebar`
--

INSERT INTO `sub_sidebar` (`id`, `main`, `name`, `admin`, `operator`, `chef`, `tandoor`, `manager`, `allow`, `link`, `icon`) VALUES
(100, 500, 'Kabab Report', 1, 0, 0, 0, 1, 1, 'report_kabab.php', 'fas fa-chart-pie'),
(200, 500, 'Haleem Nihari Report', 1, 0, 0, 0, 1, 1, 'report_haleem_nihari.php', 'fas fa-chart-pie'),
(300, 500, 'Vegi And Naan', 1, 0, 0, 0, 1, 1, 'report_vegi_naan.php', 'fas fa-chart-pie'),
(400, 500, 'Sweets Report', 1, 0, 0, 0, 1, 1, 'report_sweets.php', 'fas fa-chart-pie'),
(500, 600, 'Package Items', 1, 0, 0, 0, 0, 1, 'setting_package.php', 'fas fa-tools'),
(600, 600, 'Custom Items', 1, 0, 0, 0, 0, 1, 'setting_custom.php', 'fas fa-tools'),
(700, 600, 'Privileges', 1, 0, 0, 0, 0, 1, 'setting_privileges.php', 'fa fa-users'),
(800, 600, 'Users', 1, 0, 0, 0, 0, 1, 'setting_users.php', 'fas fa-users-cog'),
(900, 600, 'General', 1, 0, 0, 0, 0, 1, 'setting_general.php', 'fa fa-wrench');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullname` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `pass` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `allow` tinyint(4) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullname`, `username`, `pass`, `email`, `type`, `allow`) VALUES
(1, 'Administrator', 'admin', 'admin', 'Admin@gmail.com', 'admin', 0),
(2, 'Hamid Ali', 'manager', 'manager', NULL, 'manager', 1),
(3, 'Ahmad Ali', 'chef', 'chef', NULL, 'chef', 1),
(4, 'Ahmad Ali', 'tandoor', 'tandoor', NULL, 'tandoor', 1),
(6, 'Hamza Ali', 'hamzaali', 'hamzaali', NULL, 'chef', 1),
(8, 'Ali', 'Ali', '123', NULL, 'manager', 1),
(12, 'Asad Ali', 'asad44', 'asad44', NULL, 'operator', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `food_cat`
--
ALTER TABLE `food_cat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `food_main` (`food_main`);

--
-- Indexes for table `food_custom`
--
ALTER TABLE `food_custom`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `food_custom_items`
--
ALTER TABLE `food_custom_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `food_custom` (`food_custom`);

--
-- Indexes for table `food_full_custom`
--
ALTER TABLE `food_full_custom`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `food_ingredients`
--
ALTER TABLE `food_ingredients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `food_main`
--
ALTER TABLE `food_main`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `food_packages`
--
ALTER TABLE `food_packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `food_main` (`food_main`);

--
-- Indexes for table `food_package_cat`
--
ALTER TABLE `food_package_cat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `food_package_id` (`food_package_id`),
  ADD KEY `food_cat_id` (`food_cat_id`);

--
-- Indexes for table `food_package_items`
--
ALTER TABLE `food_package_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `food_cat` (`food_cat_id`);

--
-- Indexes for table `home_cards`
--
ALTER TABLE `home_cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kitchen_list`
--
ALTER TABLE `kitchen_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cust_id` (`order_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sidebar`
--
ALTER TABLE `sidebar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_sidebar`
--
ALTER TABLE `sub_sidebar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main_sidebar` (`main`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `food_cat`
--
ALTER TABLE `food_cat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1301;

--
-- AUTO_INCREMENT for table `food_custom`
--
ALTER TABLE `food_custom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT for table `food_custom_items`
--
ALTER TABLE `food_custom_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105901;

--
-- AUTO_INCREMENT for table `food_full_custom`
--
ALTER TABLE `food_full_custom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `food_ingredients`
--
ALTER TABLE `food_ingredients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `food_main`
--
ALTER TABLE `food_main`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT for table `food_packages`
--
ALTER TABLE `food_packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=701;

--
-- AUTO_INCREMENT for table `food_package_cat`
--
ALTER TABLE `food_package_cat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `food_package_items`
--
ALTER TABLE `food_package_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3201;

--
-- AUTO_INCREMENT for table `home_cards`
--
ALTER TABLE `home_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `kitchen_list`
--
ALTER TABLE `kitchen_list`
  MODIFY `id` smallint(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1301;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sidebar`
--
ALTER TABLE `sidebar`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=601;

--
-- AUTO_INCREMENT for table `sub_sidebar`
--
ALTER TABLE `sub_sidebar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=901;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `food_cat`
--
ALTER TABLE `food_cat`
  ADD CONSTRAINT `food_cat_ibfk_1` FOREIGN KEY (`food_main`) REFERENCES `food_main` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `food_custom_items`
--
ALTER TABLE `food_custom_items`
  ADD CONSTRAINT `food_custom_items_ibfk_1` FOREIGN KEY (`food_custom`) REFERENCES `food_custom` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `food_packages`
--
ALTER TABLE `food_packages`
  ADD CONSTRAINT `food_packages_ibfk_1` FOREIGN KEY (`food_main`) REFERENCES `food_main` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `food_package_cat`
--
ALTER TABLE `food_package_cat`
  ADD CONSTRAINT `food_package_cat_ibfk_1` FOREIGN KEY (`food_package_id`) REFERENCES `food_packages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `food_package_cat_ibfk_2` FOREIGN KEY (`food_cat_id`) REFERENCES `food_cat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `food_package_items`
--
ALTER TABLE `food_package_items`
  ADD CONSTRAINT `food_package_items_ibfk_1` FOREIGN KEY (`food_cat_id`) REFERENCES `food_cat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sub_sidebar`
--
ALTER TABLE `sub_sidebar`
  ADD CONSTRAINT `sub_sidebar_ibfk_1` FOREIGN KEY (`main`) REFERENCES `sidebar` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
