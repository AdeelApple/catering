-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 19, 2019 at 05:55 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.0

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
(100200, 'Chicken Korma', 5, 100, '30.00', '45.00', '60.00', NULL, 4, 5, 1, 0, 0, '3.750', '2.810', '1.875', NULL, NULL, NULL, 16, 20, 11, 15, 1, 10, '20.00', NULL, 1, 1),
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
(101500, 'Zarda', 15, 100, '25.00', '40.00', '50.00', NULL, 4, 9, NULL, 1, 0, NULL, NULL, NULL, '1.250', '0.938', '0.625', 26, 40, 15, 25, 1, 14, NULL, '7.50', 1, 1),
(101505, 'Gulab Jamun', 13, 100, NULL, NULL, NULL, '2.00', 4, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 1),
(101600, 'Chicken Pasta', 16, 100, '45.00', '70.00', '90.00', NULL, 4, NULL, NULL, NULL, 0, '2.000', '1.500', '1.000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1),
(101700, 'Tikka Masala', 17, 100, '35.00', '50.00', '70.00', NULL, 4, NULL, 1, NULL, 0, '3.750', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1),
(101705, 'Mixed Vegetables', 18, 100, '25.00', '40.00', '50.00', NULL, 24, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1),
(101710, 'Channa', 19, 100, '25.00', '40.00', '50.00', NULL, 4, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1),
(101715, 'Aloo Palak', 20, 100, '25.00', '40.00', '50.00', NULL, 24, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1),
(101800, 'Reshmi Kabab', 21, 100, NULL, NULL, NULL, '2.50', 4, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1),
(101900, 'Beef Kabab', 22, 100, NULL, NULL, NULL, '2.50', 4, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1),
(102000, 'Tandoori Chicken Tikka', 23, 100, NULL, NULL, NULL, '3.50', 4, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1),
(102100, 'Bihari Kabab', 24, 100, NULL, NULL, NULL, '8.50', 4, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1),
(102200, 'Chicken Bihari', 25, 100, NULL, NULL, NULL, '7.50', 4, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1),
(102300, 'Malai Boti', 26, 100, NULL, NULL, NULL, '7.50', 4, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1),
(102400, 'Boneless Chicken Tikka', 27, 100, NULL, NULL, NULL, '7.50', 4, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1),
(102500, 'Raita', 32, 100, NULL, NULL, NULL, '0.00', 4, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1),
(102600, 'Garden Salad', 27, 100, '0.00', '0.00', '0.25', NULL, 4, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 1),
(102700, 'Greek Salad', 28, 100, '10.00', '15.00', '20.00', NULL, 4, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 1),
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
(9, 'Butter Chicken', 9, 2, NULL, NULL, NULL, 'Butter Chicken', 1),
(10, 'Malai Boti', 10, 0, 9, 10, NULL, 'Malai Boti', 1),
(11, 'Boneless Tikka Masala', 11, 1, NULL, NULL, NULL, 'Tikka Masala', 1),
(12, 'Boneless Tikka', 12, 1, NULL, NULL, NULL, 'Boneless Chicken Tikka', 1),
(13, 'Bihari Kabab', 13, 1, NULL, NULL, NULL, 'Bihari Kabab', 1),
(14, 'Fish', 14, 1, NULL, NULL, NULL, 'Fried Fish', 1),
(15, 'Zarda Rice', 15, 1, NULL, NULL, NULL, 'Zarda', 1);

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
(25, 'Aysha ', 100, '0.00', '899.00', '0.00', '899.00', '', '', 2, '2019-05-18 15:00:00', '', '', '2019-05-07'),
(26, 'Baker Zdi', 70, '0.00', '489.30', '0.00', '489.30', '', '', 2, '2019-05-12 20:00:00', '', '', '2019-05-07'),
(27, 'Affan Ali', 50, '0.00', '574.50', '0.00', '574.50', '', '', 2, '2019-05-12 19:00:00', '', '', '2019-05-07'),
(32, 'Ahmareen', 25, '0.00', '35.00', '0.00', '35.00', '4167122290', '', 2, '2019-05-12 18:00:00', '', '', '2019-05-11'),
(36, 'M.Ali', 25, '0.00', '30.00', '0.00', '30.00', '', '', 2, '2019-05-12 16:00:00', '', '', '2019-05-11'),
(37, 'sis Almas', 225, '0.00', '1460.25', '0.00', '1460.25', '', '', 2, '2019-05-12 18:00:00', '', '', '2019-05-11'),
(40, 'madina', 250, '0.00', '997.50', '0.00', '997.50', '', '', 2, '2019-05-17 19:00:00', '', '', '2019-05-12'),
(41, 'Haris Parcha', 25, '0.00', '850.00', '0.00', '850.00', '', '', 2, '2019-05-17 18:45:00', '', '', '2019-05-12'),
(42, 'Saleem', 120, '0.00', '1171.30', '0.00', '1171.30', '', '', 2, '2019-05-17 19:00:00', '', '', '2019-05-12'),
(45, 'Qari Waqar', 140, '0.00', '1188.60', '0.00', '1188.60', '6478897319', '', 2, '2019-05-18 19:30:00', '', '', '2019-05-12'),
(46, 'Zaheer Ahmad', 35, '0.00', '358.15', '0.00', '358.15', '4162589113', '', 2, '2019-05-18 19:00:00', '', '', '2019-05-12'),
(47, 'Zaeem Butt', 100, '0.00', '914.00', '0.00', '914.00', '6479873351', '', 1, '2019-05-18 18:00:00', '', '', '2019-05-12'),
(48, 'Rauf Khan', 25, '0.00', '255.00', '0.00', '255.00', '', '', 2, '2019-05-18 21:00:00', '', '', '2019-05-12'),
(49, 'Ihtisham', 120, '0.00', '1198.80', '0.00', '1198.80', '6479805060', '', 2, '2019-05-24 19:00:00', '', '', '2019-05-12'),
(50, 'Batul', 40, '70.00', '369.60', '0.00', '369.60', '4164573514', '', 2, '2019-05-17 18:00:00', '', '', '2019-05-12'),
(54, 'Mir Ahmad', 250, '0.00', '747.50', '0.00', '747.50', '', '', 2, '2019-05-18 18:45:00', '', '', '2019-05-12'),
(55, 'Madina', 200, '0.00', '1398.00', '0.00', '1398.00', '', '', 2, '2019-05-19 19:30:00', '', '', '2019-05-12'),
(56, 'dure', 25, '0.00', '140.00', '0.00', '140.00', '', '', 2, '2019-05-19 18:30:00', '', '', '2019-05-12'),
(57, 'Shabib', 100, '0.00', '899.00', '0.00', '899.00', '4168751651', '', 2, '2019-05-19 19:00:00', '', '', '2019-05-12'),
(58, 'Naseer', 150, '0.00', '1273.50', '0.00', '1273.50', '', '', 2, '2019-05-19 18:00:00', '', '', '2019-05-12'),
(59, 'Amir', 200, '0.00', '1513.00', '0.00', '1513.00', '4163320159', '', 2, '2019-05-19 17:30:00', '', '', '2019-05-12'),
(62, 'Farqan Butt', 30, '0.00', '344.70', '0.00', '344.70', '', '', 2, '2019-05-17 17:00:00', '', '', '2019-05-13'),
(63, 'Tahir Mehmood', 60, '0.00', '545.40', '0.00', '545.40', '', '', 2, '2019-05-17 19:00:00', '', '', '2019-05-13'),
(64, 'Rajani', 30, '0.00', '319.70', '0.00', '319.70', '5197295551', '', 2, '2019-05-17 18:30:00', '', '', '2019-05-13'),
(65, 'Umair', 25, '0.00', '25.00', '0.00', '25.00', '', '', 2, '2019-05-17 16:00:00', '', '', '2019-05-13'),
(66, 'Imrana', 50, '40.00', '489.50', '0.00', '489.50', '6477077237', '', 2, '2019-05-17 18:00:00', '', '', '2019-05-13'),
(67, 'Jame Mustafa', 25, '0.00', '0.00', '0.00', '0.00', '', '', 2, '2019-05-18 19:30:00', '', '', '2019-05-13'),
(68, 'Madina', 150, '0.00', '1438.50', '0.00', '1438.50', '', '', 2, '2019-05-18 19:30:00', '', '', '2019-05-14'),
(69, 'Fahad Saleem', 25, '0.00', '174.75', '0.00', '174.75', '4162301547', '', 2, '2019-05-19 19:00:00', '', '', '2019-05-14'),
(70, 'Adeel Khan', 40, '0.00', '299.60', '0.00', '299.60', '6477722791', '', 2, '2019-05-19 18:00:00', '', '', '2019-05-14'),
(74, 'Samina ', 100, '0.00', '789.00', '0.00', '789.00', '', '', 2, '2019-05-19 18:00:00', '', '', '2019-05-14'),
(75, 'Hina', 25, '0.00', '304.75', '0.00', '304.75', '5194377664', '', 2, '2019-05-19 13:00:00', '', '', '2019-05-14'),
(76, 'Rabia', 25, '0.00', '65.00', '0.00', '65.00', '9053349167', '', 2, '2019-05-17 19:00:00', '', '', '2019-05-14'),
(77, 'M.Abbas', 25, '0.00', '92.50', '0.00', '92.50', '6479940012', '', 2, '2019-05-19 13:30:00', '', '', '2019-05-14'),
(78, 'Stainley', 25, '0.00', '107.50', '0.00', '107.50', '', '', 2, '2019-05-17 17:00:00', '', '', '2019-05-14'),
(79, 'Zulifiqar', 25, '0.00', '172.50', '0.00', '172.50', '', '', 2, '2019-05-17 17:00:00', '', '', '2019-05-14'),
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
(109, 'Bilal', 25, '0.00', '130.00', '0.00', '130.00', '6479262833', '', 2, '2019-05-23 17:30:00', '', '', '2019-05-21'),
(110, 'Sabir', 35, '0.00', '297.15', '0.00', '297.15', '4168547563', '', 2, '2019-05-23 18:30:00', '', '', '2019-05-21'),
(111, 'Farzana', 25, '0.00', '187.50', '0.00', '187.50', '4164574175', '', 2, '2019-05-23 18:30:00', '', '', '2019-05-21'),
(112, 'Muzzafar Tabish', 30, '0.00', '224.70', '0.00', '224.70', '6472675714', '', 2, '2019-05-24 19:30:00', '', '', '2019-05-21'),
(113, 'M. Khan', 40, '0.00', '359.60', '0.00', '359.60', '6472487054', '', 2, '2019-05-24 19:30:00', '', '', '2019-05-21'),
(114, 'M.Owais(Jame)', 70, '0.00', '75.00', '0.00', '75.00', '', '', 2, '2019-05-24 19:45:00', '', '', '2019-05-21'),
(115, 'Shoaib', 25, '0.00', '262.25', '0.00', '262.25', '', '', 2, '2019-05-24 18:00:00', '', '', '2019-05-21'),
(116, 'Sis Mumtaz', 200, '0.00', '200.00', '0.00', '200.00', '', '', 2, '2019-05-25 19:00:00', '', '', '2019-05-21'),
(117, 'Aysha Kamran', 25, '0.00', '252.25', '0.00', '252.25', '', '', 2, '2019-05-25 15:00:00', '', '', '2019-05-21'),
(118, 'Zahid Janjua', 30, '0.00', '239.70', '0.00', '239.70', '9055412680', '', 2, '2019-05-25 18:00:00', '', '', '2019-05-21'),
(119, 'Kamran', 25, '0.00', '224.75', '0.00', '224.75', '4168586319', '', 2, '2019-05-25 19:30:00', '', '', '2019-05-21'),
(120, 'Sohail Jaffer', 25, '0.00', '165.00', '0.00', '165.00', '4168245949', '', 2, '2019-05-25 19:00:00', '', '', '2019-05-21'),
(121, 'M.Naeem', 25, '0.00', '60.00', '0.00', '60.00', '6475751225', '', 2, '2019-05-25 19:00:00', '', '', '2019-05-21'),
(122, 'Waseem', 25, '0.00', '50.00', '0.00', '50.00', '4169082737', '', 2, '2019-05-25 12:00:00', '', '', '2019-05-21'),
(123, 'Mir Ahmad', 250, '0.00', '3.00', '0.00', '3.00', '', '', 2, '2019-05-25 18:30:00', '', '', '2019-05-21'),
(124, 'Ali Khan', 30, '0.00', '269.70', '0.00', '269.70', '6478767773', '', 2, '2019-05-26 20:00:00', '', '', '2019-05-21'),
(125, 'Habib Bhai', 175, '0.00', '1430.75', '0.00', '1430.75', '', '', 2, '2019-05-26 19:45:00', '', '', '2019-05-21'),
(126, 'Moaiz', 25, '0.00', '860.00', '0.00', '860.00', '4165666024', '', 2, '2019-05-26 18:00:00', '', '', '2019-05-21'),
(127, 'Sakina', 25, '0.00', '1301.00', '0.00', '1301.00', '4165202358', '', 2, '2019-05-26 18:30:00', '', '', '2019-05-21'),
(128, 'Salman', 25, '0.00', '95.00', '0.00', '95.00', '', '', 2, '2019-05-23 18:30:00', '', '', '2019-05-21'),
(129, 'Madina', 90, '0.00', '359.10', '0.00', '359.10', '', '', 2, '2019-05-23 21:35:00', '', '', '2019-05-21'),
(130, 'madina', 175, '0.00', '1048.25', '0.00', '1048.25', '', '', 2, '2019-05-24 22:30:00', '', '', '2019-05-21'),
(131, 'madina', 200, '0.00', '1963.50', '0.00', '1963.50', '', '', 2, '2019-05-25 19:30:00', '', '', '2019-05-21'),
(133, 'Nada', 175, '0.00', '406.00', '0.00', '406.00', '', '', 2, '2019-05-25 18:00:00', '', '', '2019-05-21'),
(134, 'Haris Butt', 30, '0.00', '447.20', '0.00', '447.20', '', '', 2, '2019-05-25 19:30:00', '', '', '2019-05-21'),
(135, 'Shamma', 40, '0.00', '459.60', '0.00', '459.60', '6479798079', '', 2, '2019-05-23 18:00:00', '', '', '2019-05-21'),
(136, 'Nadeem Nawaz', 25, '0.00', '290.00', '0.00', '290.00', '', '', 2, '2019-05-24 17:00:00', '', '', '2019-05-21'),
(137, 'naveed khan', 25, '0.00', '160.00', '0.00', '160.00', '', '', 2, '2019-05-25 18:00:00', '', '', '2019-05-21'),
(138, 'mansabdar', 70, '0.00', '879.30', '0.00', '879.30', '6478224269', '', 2, '2019-05-25 19:00:00', '', '', '2019-05-21'),
(139, 'Habib bahi', 25, '0.00', '25.00', '0.00', '25.00', '', '', 2, '2019-05-24 18:30:00', '', '', '2019-05-22'),
(140, 'Imran', 250, '0.00', '1497.50', '0.00', '1497.50', '', '', 2, '2019-05-26 17:50:00', '', '', '2019-05-22'),
(141, 'Faisal Khan', 25, '0.00', '60.00', '0.00', '60.00', '', '', 2, '2019-05-24 18:00:00', '', '', '2019-05-22'),
(142, 'Ahmad', 25, '0.00', '42.00', '0.00', '42.00', '', '', 2, '2019-05-25 18:00:00', '', '', '2019-05-22'),
(143, 'saif', 25, '0.00', '182.50', '0.00', '182.50', '', '', 2, '2019-05-26 19:30:00', '', '', '2019-05-22'),
(144, 'Rehan', 25, '0.00', '95.00', '0.00', '95.00', '', '', 2, '2019-05-24 18:30:00', '', '', '2019-05-22'),
(145, 'Saba', 25, '0.00', '65.00', '0.00', '65.00', '', '', 2, '2019-05-25 11:30:00', '', '', '2019-05-23'),
(146, 'Altaf', 25, '0.00', '345.00', '0.00', '345.00', '', '', 2, '2019-05-26 15:00:00', '', '', '2019-05-23'),
(147, 'altaf for sunday', 25, '0.00', '25.00', '0.00', '25.00', '', '', 2, '2019-05-24 15:00:00', '', '', '2019-05-23'),
(148, 'M. Salman', 25, '0.00', '56.50', '0.00', '56.50', '', '', 2, '2019-05-25 19:30:00', '', '', '2019-05-23'),
(149, 'Umer', 25, '0.00', '175.00', '0.00', '175.00', '', '', 2, '2019-05-25 19:00:00', '', '', '2019-05-23'),
(150, 'Umer', 25, '0.00', '200.00', '0.00', '200.00', '', '', 2, '2019-05-26 19:00:00', '', '', '2019-05-23'),
(151, 'Tariq', 25, '0.00', '25.00', '0.00', '25.00', '', '', 2, '2019-05-25 18:00:00', '', '', '2019-05-23'),
(152, 'tariq for sat', 25, '0.00', '25.00', '0.00', '25.00', '', '', 2, '2019-05-24 18:00:00', '', '', '2019-05-23'),
(153, 'khader', 25, '0.00', '165.00', '0.00', '165.00', '', '', 2, '2019-05-24 19:30:00', '', '', '2019-05-23'),
(154, 'Tariq Khan', 25, '0.00', '100.00', '0.00', '100.00', '', '', 2, '2019-05-26 16:00:00', '', '', '2019-05-24'),
(155, 'Lazeez', 25, '0.00', '77.00', '0.00', '77.00', '', '', 2, '2019-05-26 17:30:00', '', '', '2019-05-24'),
(156, 'tofeeq', 25, '0.00', '95.00', '0.00', '95.00', '', '', 2, '2019-05-26 18:00:00', '', '', '2019-05-24'),
(157, 'Shahid Mughal', 25, '0.00', '70.00', '0.00', '70.00', '', '', 2, '2019-05-25 18:00:00', '', '', '2019-05-24'),
(158, 'asim', 25, '0.00', '44.00', '0.00', '44.00', '', '', 2, '2019-05-26 15:00:00', '', '', '2019-05-24'),
(159, 'Shakeela', 25, '0.00', '0.00', '0.00', '0.00', '', '', 2, '2019-05-26 19:30:00', '', '', '2019-05-25'),
(160, 'Nadeem', 120, '0.00', '1018.80', '0.00', '1018.80', '', '', 2, '2019-05-27 17:00:00', '', '', '2019-05-25'),
(161, 'Benazir', 25, '0.00', '250.00', '0.00', '250.00', '', '', 2, '2019-05-27 17:30:00', '', '', '2019-05-25'),
(162, 'Madina', 90, '0.00', '629.10', '0.00', '629.10', '', '', 2, '2019-05-27 19:30:00', '', '', '2019-05-25'),
(163, 'Khalil', 25, '0.00', '172.50', '0.00', '172.50', '', '', 2, '2019-05-27 20:00:00', '', '', '2019-05-25'),
(164, 'Madina', 90, '0.00', '359.10', '0.00', '359.10', '', '', 2, '2019-05-28 19:00:00', '', '', '2019-05-25'),
(165, 'Naveed', 25, '0.00', '180.00', '0.00', '180.00', '', '', 2, '2019-05-28 19:00:00', '', '', '2019-05-25'),
(166, 'Sis Shakeela', 0, '0.00', '0.00', '0.00', '0.00', '', '', 2, '2019-05-28 19:30:00', '', '', '2019-05-25'),
(167, 'Hamid', 25, '0.00', '110.00', '0.00', '110.00', '', '', 2, '2019-05-27 17:30:00', '', '', '2019-05-26'),
(168, 'Muzafer', 25, '0.00', '40.00', '0.00', '40.00', '', '', 2, '2019-05-28 16:00:00', '', '', '2019-05-27'),
(169, 'm. kHAN ', 25, '0.00', '30.00', '0.00', '30.00', '', '', 2, '2019-05-28 17:00:00', '', '', '2019-05-27'),
(170, 'Mirza', 30, '0.00', '80.00', '0.00', '80.00', '', '', 2, '2019-05-30 16:00:00', '', '', '2019-05-28'),
(171, 'Saleem', 25, '0.00', '105.00', '0.00', '105.00', '', '', 2, '2019-05-30 17:00:00', '', '', '2019-05-28'),
(172, 'Madina', 110, '0.00', '658.90', '0.00', '658.90', '', '', 2, '2019-05-30 19:30:00', '', '', '2019-05-28'),
(173, 'Shakeela', 25, '0.00', '350.00', '0.00', '350.00', '', '', 2, '2019-05-30 19:30:00', '', '', '2019-05-28'),
(174, 'Aysha', 25, '0.00', '125.00', '0.00', '125.00', '', '', 2, '2019-05-30 22:00:00', '', '', '2019-05-28'),
(175, 'Madina', 175, '0.00', '1223.25', '0.00', '1223.25', '', '', 2, '2019-05-31 19:30:00', '', '', '2019-05-28'),
(176, 'tariq', 25, '0.00', '25.00', '0.00', '25.00', '', '', 2, '2019-05-31 16:00:00', '', '', '2019-05-28'),
(177, 'Ateeq Khan', 40, '0.00', '359.60', '0.00', '359.60', '', '', 2, '2019-05-31 19:45:00', '', '', '2019-05-28'),
(178, 'Gulam Rasool', 25, '0.00', '0.00', '0.00', '0.00', '', '', 2, '2019-05-31 19:00:00', '', '', '2019-05-28'),
(179, 'Shahzad', 25, '0.00', '250.00', '0.00', '250.00', '', '', 2, '2019-05-31 17:00:00', '', '', '2019-05-28'),
(180, 'Mir Ahmad', 25, '0.00', '560.00', '0.00', '560.00', '', '', 2, '2019-05-31 18:30:00', '', '', '2019-05-28'),
(181, 'Niazi', 25, '0.00', '514.50', '0.00', '514.50', '', '', 2, '2019-06-01 15:00:00', '', '', '2019-05-28'),
(182, 'Aysha kamran', 30, '0.00', '324.70', '0.00', '324.70', '', '', 2, '2019-06-01 13:30:00', '', '', '2019-05-28'),
(183, 'Farooqi', 40, '0.00', '364.60', '0.00', '364.60', '', '', 2, '2019-06-01 14:00:00', '', '', '2019-05-28'),
(184, 'doctorni', 25, '0.00', '122.50', '0.00', '122.50', '', '', 2, '2019-06-01 15:00:00', '', '', '2019-05-28'),
(185, 'Nadir', 150, '0.00', '1348.50', '0.00', '1348.50', '', '', 2, '2019-06-01 19:00:00', '', '', '2019-05-28'),
(186, 'Mir Ahmad', 25, '0.00', '1886.00', '0.00', '1886.00', '', '', 2, '2019-06-01 19:00:00', '', '', '2019-05-28'),
(187, 'Ijaz', 25, '0.00', '252.50', '0.00', '252.50', '', '', 2, '2019-06-01 19:00:00', '', '', '2019-05-28'),
(188, 'sis Mumtaz', 25, '0.00', '925.00', '0.00', '925.00', '', '', 2, '2019-06-02 18:30:00', '', '', '2019-05-28'),
(189, 'sis Mumtaz for monday', 25, '0.00', '500.00', '0.00', '500.00', '', '', 2, '2019-06-02 19:00:00', '', '', '2019-05-28'),
(190, 'Kaleem', 110, '0.00', '988.90', '0.00', '988.90', '', '', 2, '2019-06-02 19:15:00', '', '', '2019-05-28'),
(191, 'Madina', 150, '0.00', '1048.50', '0.00', '1048.50', '', '', 2, '2019-06-02 19:30:00', '', '', '2019-05-28'),
(192, 'Asim', 25, '0.00', '260.25', '0.00', '260.25', '', '', 2, '2019-06-02 19:00:00', '', '', '2019-05-28'),
(193, 'J. Islamia', 25, '4.00', '304.00', '0.00', '304.00', '', '', 2, '2019-06-02 19:15:00', '', '', '2019-05-28'),
(194, 'Danish', 25, '0.00', '195.00', '0.00', '195.00', '', '', 2, '2019-06-02 19:30:00', '', '', '2019-05-28'),
(195, 'IJaz Khan', 25, '0.00', '50.00', '0.00', '50.00', '', '', 2, '2019-06-02 19:00:00', '', '', '2019-05-28'),
(196, 'Rehan', 25, '0.00', '80.00', '0.00', '80.00', '', '', 2, '2019-06-02 17:00:00', '', '', '2019-05-28'),
(197, 'Shafqat', 45, '0.00', '352.05', '0.00', '352.05', '', '', 2, '2019-06-02 19:00:00', '', '', '2019-05-28'),
(198, 'm Adnan', 25, '0.00', '100.00', '0.00', '100.00', '', '', 2, '2019-06-03 15:00:00', '', '', '2019-05-29'),
(199, 'Madina', 110, '0.00', '708.90', '0.00', '708.90', '', '', 2, '2019-06-03 19:30:00', '', '', '2019-05-29'),
(200, 'Irfan', 25, '0.00', '80.00', '0.00', '80.00', '', '', 2, '2019-06-03 18:30:00', '', '', '2019-05-29'),
(201, 'Rashid', 25, '0.00', '177.50', '0.00', '177.50', '', '', 2, '2019-06-03 18:00:00', '', '', '2019-05-29'),
(202, 'Naseema', 25, '0.00', '350.00', '0.00', '350.00', '', '', 2, '2019-06-03 18:00:00', '', '', '2019-05-29'),
(203, 'Anty Rehana', 25, '0.00', '90.00', '0.00', '90.00', '', '', 2, '2019-06-03 16:00:00', '', '', '2019-05-29'),
(204, 'Shamim', 25, '0.00', '220.00', '0.00', '220.00', '', '', 2, '2019-06-03 19:00:00', '', '', '2019-05-29'),
(205, 'Shahnaz', 30, '0.00', '277.20', '0.00', '277.20', '', '', 2, '2019-06-03 19:30:00', '', '', '2019-05-29'),
(206, 'Rubina', 25, '0.00', '250.00', '0.00', '250.00', '', '', 2, '2019-06-03 16:00:00', '', '', '2019-05-29'),
(207, 'Hamid Sheikh', 25, '0.00', '135.00', '0.00', '135.00', '', '', 2, '2019-06-03 19:00:00', '', '', '2019-05-29'),
(208, 'Mazhar', 25, '0.00', '287.50', '0.00', '287.50', '', '', 2, '2019-06-03 20:00:00', '', '', '2019-05-29'),
(209, 'Sis Razia', 25, '0.00', '40.00', '0.00', '40.00', '', '', 2, '2019-06-03 16:00:00', '', '', '2019-05-29'),
(210, 'Imran Husan', 25, '0.00', '150.00', '0.00', '150.00', '', '', 2, '2019-06-01 18:00:00', '', '', '2019-05-29'),
(211, 'Mustafa', 25, '0.00', '200.00', '0.00', '200.00', '', '', 2, '2019-06-03 18:00:00', '', '', '2019-05-29'),
(212, 'Majid', 25, '0.00', '287.25', '0.00', '287.25', '', '', 2, '2019-06-03 19:30:00', '', '', '2019-05-29'),
(213, 'Jawad', 25, '0.00', '190.00', '0.00', '190.00', '', '', 2, '2019-05-30 15:00:00', '', '', '2019-05-29'),
(215, 'Tariq', 35, '0.00', '312.15', '0.00', '312.15', '', '', 2, '2019-06-01 19:45:00', '', '', '2019-05-30'),
(216, 'Ali Ahmad', 25, '0.00', '90.00', '0.00', '90.00', '', '', 2, '2019-06-03 16:00:00', '', '', '2019-05-30'),
(217, 'Waseem ', 25, '0.00', '40.00', '0.00', '40.00', '', '', 2, '2019-06-03 17:00:00', '', '', '2019-05-30'),
(218, 'Yohana', 25, '0.00', '140.00', '0.00', '140.00', '', '', 2, '2019-06-03 17:00:00', '', '', '2019-05-30'),
(219, 'Mona', 25, '0.00', '257.25', '0.00', '257.25', '', '', 2, '2019-06-01 16:00:00', '', '', '2019-05-31'),
(220, 'Muhammad', 25, '0.00', '105.00', '0.00', '105.00', '', '', 2, '2019-06-01 18:00:00', '', '', '2019-05-31'),
(221, 'Tariq', 35, '0.00', '122.15', '0.00', '122.15', '', '', 2, '2019-06-01 15:00:00', '', '', '2019-05-31'),
(222, 'Hamid', 25, '0.00', '122.50', '0.00', '122.50', '', '', 2, '2019-06-02 16:00:00', '', '', '2019-05-31'),
(223, 'Hassan', 25, '0.00', '35.00', '0.00', '35.00', '', '', 2, '2019-06-03 16:00:00', '', '', '2019-05-31'),
(224, 'Atif', 25, '0.00', '35.00', '0.00', '35.00', '', '', 2, '2019-06-03 15:00:00', '', '', '2019-05-31'),
(225, 'Zeeshan', 25, '0.00', '53.00', '0.00', '53.00', '', '', 2, '2019-06-03 15:30:00', '', '', '2019-05-31'),
(226, 'Faad', 25, '0.00', '80.00', '0.00', '80.00', '', '', 2, '2019-06-01 16:00:00', '', '', '2019-05-31'),
(227, 'Faheem', 25, '0.00', '144.00', '0.00', '144.00', '', '', 2, '2019-06-01 19:00:00', '', '', '2019-05-31'),
(228, 'Shokat', 25, '0.00', '80.00', '0.00', '80.00', '', '', 2, '2019-06-02 19:30:00', '', '', '2019-05-31'),
(229, 'Sadia', 25, '0.00', '40.00', '0.00', '40.00', '', '', 2, '2019-06-01 19:00:00', '', '', '2019-05-31'),
(230, 'Umer Al Abas', 25, '0.00', '0.00', '0.00', '0.00', '', '', 2, '2019-06-02 19:00:00', '', '', '2019-06-01'),
(231, 'Kauser', 25, '0.00', '100.00', '0.00', '100.00', '', '', 2, '2019-06-03 16:00:00', '', '', '2019-06-01'),
(232, 'umer', 100, '0.00', '499.00', '0.00', '499.00', '', '', 2, '2019-06-03 19:00:00', '', '', '2019-06-02'),
(233, 'Jenna', 25, '0.00', '274.75', '0.00', '274.75', '', '', 2, '2019-06-06 17:00:00', '', '', '2019-06-02'),
(235, 'Fatima ', 25, '0.00', '187.25', '0.00', '187.25', '', '', 2, '2019-06-06 17:30:00', '', '', '2019-06-02'),
(236, 'Irum', 25, '0.00', '115.00', '0.00', '115.00', '', '', 2, '2019-06-06 16:00:00', '', '', '2019-06-02'),
(237, 'Noman', 35, '0.00', '454.65', '0.00', '454.65', '', '', 2, '2019-06-07 17:15:00', '', '', '2019-06-02'),
(238, 'Munir', 140, '0.00', '1468.60', '0.00', '1468.60', '', '', 2, '2019-06-07 19:00:00', '', '', '2019-06-02'),
(239, 'Moshin', 75, '0.00', '764.25', '0.00', '764.25', '', '', 2, '2019-06-07 19:15:00', '', '', '2019-06-02'),
(240, 'Ghazala', 25, '0.00', '140.00', '0.00', '140.00', '', '', 2, '2019-06-07 18:45:00', '', '', '2019-06-02'),
(242, 'Saad', 25, '0.00', '187.25', '0.00', '187.25', '', '', 2, '2019-06-07 19:00:00', '', '', '2019-06-02'),
(243, 'Nazim', 25, '0.00', '425.00', '0.00', '425.00', '', '', 2, '2019-06-07 19:30:00', '', '', '2019-06-02'),
(244, 'Reshma', 35, '0.00', '297.15', '0.00', '297.15', '', '', 2, '2019-06-07 18:30:00', '', '', '2019-06-02'),
(245, 'Amir', 25, '0.00', '90.00', '0.00', '90.00', '', '', 2, '2019-06-07 19:00:00', '', '', '2019-06-02'),
(246, 'M. Salman', 25, '0.00', '102.50', '0.00', '102.50', '', '', 2, '2019-06-07 14:30:00', '', '', '2019-06-02'),
(247, 'Fatima', 55, '0.00', '411.95', '0.00', '411.95', '', '', 2, '2019-06-07 18:30:00', '', '', '2019-06-02'),
(248, 'Mehmood', 25, '0.00', '100.00', '0.00', '100.00', '', '', 2, '2019-06-08 12:30:00', '', '', '2019-06-02'),
(250, 'Risa Khan', 35, '0.00', '349.65', '0.00', '349.65', '', '', 2, '2019-06-08 16:00:00', '', '', '2019-06-02'),
(251, 'Asad Khan', 35, '0.00', '384.65', '0.00', '384.65', '', '', 2, '2019-06-08 18:30:00', '', '', '2019-06-02'),
(252, 'Imran', 50, '0.00', '482.00', '0.00', '482.00', '', '', 2, '2019-06-08 16:45:00', '', '', '2019-06-02'),
(253, 'Sabeen', 25, '0.00', '349.75', '0.00', '349.75', '', '', 2, '2019-06-08 19:00:00', '', '', '2019-06-02'),
(254, 'Gulam Rasool', 25, '0.00', '50.00', '0.00', '50.00', '', '', 2, '2019-06-08 15:00:00', '', '', '2019-06-02'),
(255, 'Shoaib', 25, '0.00', '174.75', '0.00', '174.75', '', '', 2, '2019-06-06 17:00:00', '', '', '2019-06-02'),
(256, 'Umair', 40, '0.00', '429.60', '0.00', '429.60', '', '', 2, '2019-06-08 15:30:00', '', '', '2019-06-02'),
(257, 'Sohail', 25, '0.00', '445.00', '0.00', '445.00', '', '', 2, '2019-06-08 19:00:00', '', '', '2019-06-02'),
(258, 'Shazia Khan', 35, '0.00', '314.65', '0.00', '314.65', '', '', 2, '2019-06-08 19:30:00', '', '', '2019-06-02'),
(259, 'Khizar', 50, '0.00', '549.50', '0.00', '549.50', '', '', 2, '2019-06-08 18:30:00', '', '', '2019-06-02'),
(260, 'Ahmad Raza', 60, '0.00', '539.40', '0.00', '539.40', '', '', 2, '2019-06-08 19:15:00', '', '', '2019-06-02'),
(261, 'shafeeq', 25, '0.00', '60.00', '0.00', '60.00', '', '', 2, '2019-06-07 19:00:00', '', '', '2019-06-02'),
(262, 'Dr. Nadeem', 25, '0.00', '239.75', '0.00', '239.75', '', '', 2, '2019-06-08 14:30:00', '', '', '2019-06-02'),
(263, 'Saad', 50, '0.00', '524.50', '0.00', '524.50', '', '', 2, '2019-06-08 19:00:00', '', '', '2019-06-02'),
(264, 'Syed M.Shakeel', 90, '0.00', '809.10', '0.00', '809.10', '', '', 2, '2019-06-08 19:30:00', '', '', '2019-06-02'),
(265, 'Yasmeen', 25, '0.00', '140.00', '0.00', '140.00', '', '', 2, '2019-06-08 12:13:00', '', '', '2019-06-02'),
(266, 'Salman Shaikh', 25, '0.00', '140.00', '0.00', '140.00', '', '', 2, '2019-06-08 16:00:00', '', '', '2019-06-02'),
(267, 'Sis suria', 70, '0.00', '774.30', '0.00', '774.30', '', '', 2, '2019-06-08 19:00:00', '', '', '2019-06-02'),
(268, 'Asma', 25, '0.00', '237.25', '0.00', '237.25', '', '', 2, '2019-06-08 17:05:00', '', '', '2019-06-02'),
(269, 'Samina Hall', 100, '0.00', '899.00', '0.00', '899.00', '', '', 2, '2019-06-08 18:00:00', '', '', '2019-06-02'),
(270, 'Ihtisham', 50, '0.00', '729.50', '0.00', '729.50', '', '', 2, '2019-06-08 17:00:00', '', '', '2019-06-02'),
(271, 'Sadia', 25, '0.00', '187.25', '0.00', '187.25', '', '', 2, '2019-06-08 20:00:00', '', '', '2019-06-02'),
(272, 'Dure', 40, '0.00', '414.60', '0.00', '414.60', '', '', 2, '2019-06-08 19:00:00', '', '', '2019-06-02'),
(274, 'Kamran', 25, '0.00', '95.00', '0.00', '95.00', '', '', 2, '2019-06-09 17:00:00', '', '', '2019-06-02'),
(275, 'Nadeem Haris', 25, '0.00', '252.25', '0.00', '252.25', '', '', 2, '2019-06-09 13:00:00', '', '', '2019-06-02'),
(276, 'Azhar', 35, '0.00', '349.65', '0.00', '349.65', '', '', 2, '2019-06-09 14:00:00', '', '', '2019-06-02'),
(277, 'Amir', 50, '0.00', '575.00', '0.00', '575.00', '', '', 2, '2019-06-09 20:00:00', '', '', '2019-06-02'),
(278, 'Rizwan', 30, '0.00', '309.70', '0.00', '309.70', '', '', 2, '2019-06-09 13:00:00', '', '', '2019-06-03'),
(279, 'Ali bin', 25, '0.00', '0.00', '0.00', '0.00', '', '', 2, '2019-06-09 16:00:00', '', '', '2019-06-03'),
(280, 'Sabir', 25, '0.00', '249.75', '0.00', '249.75', '', '', 2, '2019-06-09 13:00:00', '', '', '2019-06-03'),
(281, 'Samia', 25, '0.00', '90.00', '0.00', '90.00', '', '', 2, '2019-06-06 16:15:00', '', '', '2019-06-03'),
(282, 'saad', 25, '0.00', '70.00', '0.00', '70.00', '', '', 2, '2019-06-06 15:00:00', '', '', '2019-06-03'),
(283, 'Haris', 25, '0.00', '90.00', '0.00', '90.00', '', '', 2, '2019-06-08 13:00:00', '', '', '2019-06-03'),
(284, 'Asif', 65, '0.00', '460.35', '0.00', '460.35', '', '', 2, '2019-06-06 18:30:00', '', '', '2019-06-03'),
(285, 'M. Kamil', 25, '0.00', '187.25', '0.00', '187.25', '', '', 2, '2019-06-06 20:00:00', '', '', '2019-06-05'),
(286, 'Mansoor', 25, '0.00', '257.50', '0.00', '257.50', '', '', 2, '2019-06-07 15:00:00', '', '', '2019-06-05'),
(287, 'Christopher', 120, '0.00', '778.80', '0.00', '778.80', '', '', 2, '2019-06-08 13:00:00', '', '', '2019-06-05'),
(288, 'Tariq', 25, '0.00', '25.00', '0.00', '25.00', '', '', 2, '2019-06-09 14:00:00', '', '', '2019-06-05'),
(289, 'Asma', 25, '0.00', '60.00', '0.00', '60.00', '', '', 2, '2019-06-09 12:00:00', '', '', '2019-06-05'),
(290, 'Nadeem', 300, '0.00', '1715.00', '0.00', '1715.00', '', '', 2, '2019-06-09 17:00:00', '', '', '2019-06-05'),
(291, 'syed', 25, '0.00', '30.00', '0.00', '30.00', '', '', 2, '2019-06-06 20:00:00', '', '', '2019-06-06'),
(292, 'Sidra Khan', 25, '0.00', '257.50', '0.00', '257.50', '', '', 2, '2019-06-07 18:00:00', '', '', '2019-06-06'),
(293, 'Mashkoor', 60, '0.00', '551.40', '0.00', '551.40', '', '', 2, '2019-06-09 20:00:00', '', '', '2019-06-06'),
(294, 'M.Salman', 25, '0.00', '60.00', '0.00', '60.00', '', '', 2, '2019-06-08 13:00:00', '', '', '2019-06-06'),
(295, 'Sohail Bahi', 25, '0.00', '70.00', '0.00', '70.00', '', '', 2, '2019-06-09 22:30:00', '', '', '2019-06-07'),
(296, 'Abrar Ahmad', 50, '0.00', '429.50', '0.00', '429.50', '4168775207', '', 1, '2019-06-14 18:15:00', '125 Featherstone Av. Markham  Mccown Denisan', '', '2019-06-11'),
(297, 'Ruksana', 25, '0.00', '60.00', '0.00', '60.00', '', '', 2, '2019-06-14 14:30:00', '', '', '2019-06-11'),
(298, 'Seema ', 35, '0.00', '314.65', '0.00', '314.65', '', '', 2, '2019-06-14 20:30:00', '', '', '2019-06-11'),
(299, 'Murtaza', 33, '0.00', '329.67', '0.00', '329.67', '', '', 2, '2019-06-14 18:30:00', '', '', '2019-06-11'),
(300, 'Humayon', 25, '0.00', '35.00', '0.00', '35.00', '', '', 2, '2019-06-14 18:30:00', '', '', '2019-06-11'),
(301, 'Asim', 25, '0.00', '105.00', '0.00', '105.00', '', '', 2, '2019-06-14 19:30:00', '', '', '2019-06-11'),
(302, 'Tanveer', 25, '0.00', '0.00', '0.00', '0.00', '', '', 2, '2019-06-14 21:00:00', '', '', '2019-06-11'),
(303, 'Kamran', 25, '0.00', '339.75', '0.00', '339.75', '', '', 2, '2019-06-14 12:30:00', '', '', '2019-06-11'),
(304, 'Hina', 25, '0.00', '180.00', '0.00', '180.00', '', '', 2, '2019-06-14 18:30:00', '', '', '2019-06-11'),
(305, 'Rizwan', 80, '0.00', '599.20', '0.00', '599.20', '', '', 2, '2019-06-14 14:00:00', '', '', '2019-06-11'),
(306, 'Jame Mustafa', 25, '0.00', '250.00', '0.00', '250.00', '', '', 2, '2019-06-15 20:15:00', '', '', '2019-06-11'),
(307, 'Shahab', 25, '0.00', '170.00', '0.00', '170.00', '', '', 2, '2019-06-15 17:00:00', '', '', '2019-06-11'),
(308, 'Bilal', 25, '0.00', '212.25', '0.00', '212.25', '', '', 2, '2019-06-15 18:00:00', '', '', '2019-06-11'),
(309, 'Zubair', 30, '0.00', '402.20', '0.00', '402.20', '', '', 2, '2019-06-15 12:00:00', '', '', '2019-06-11'),
(310, 'Ruksana', 25, '0.00', '0.00', '0.00', '0.00', '', '', 2, '2019-06-15 14:00:00', '', '', '2019-06-11'),
(311, 'Jasbir', 25, '0.00', '95.00', '0.00', '95.00', '', '', 2, '2019-06-15 12:00:00', '', '', '2019-06-11'),
(312, 'Sara', 30, '0.00', '394.70', '0.00', '394.70', '', '', 2, '2019-06-15 16:00:00', '', '', '2019-06-11'),
(313, 'Heart', 150, '0.00', '1498.50', '0.00', '1498.50', '', '', 2, '2019-06-15 20:30:00', '', '', '2019-06-11'),
(314, 'Sahira', 60, '0.00', '455.50', '0.00', '455.50', '', '', 2, '2019-06-15 12:00:00', '', '', '2019-06-11'),
(315, 'Batool', 80, '0.00', '0.00', '0.00', '0.00', '', '', 2, '2019-06-14 17:00:00', '', '', '2019-06-11'),
(316, 'Laila', 100, '0.00', '1049.00', '0.00', '1049.00', '', '', 2, '2019-06-16 12:15:00', '', '', '2019-06-11'),
(317, 'Kausar', 50, '0.00', '374.50', '0.00', '374.50', '', '', 2, '2019-06-16 13:15:00', '', '', '2019-06-11'),
(318, 'MR. Aftab', 65, '0.00', '649.35', '0.00', '649.35', '', '', 2, '2019-06-16 12:30:00', '', '', '2019-06-11'),
(319, 'Durdana', 25, '0.00', '165.00', '0.00', '165.00', '', '', 2, '2019-06-16 19:00:00', '', '', '2019-06-11'),
(320, 'Saad', 30, '0.00', '224.70', '0.00', '224.70', '', '', 2, '2019-06-16 13:30:00', '', '', '2019-06-11'),
(321, 'Zulqurnana', 60, '0.00', '534.40', '0.00', '534.40', '', '', 2, '2019-06-16 13:15:00', '', '', '2019-06-11'),
(322, 'Khalil', 30, '0.00', '269.70', '0.00', '269.70', '', '', 2, '2019-06-16 18:00:00', '', '', '2019-06-11'),
(323, 'M.Bhati', 25, '0.00', '232.25', '0.00', '232.25', '', '', 2, '2019-06-16 16:30:00', '', '', '2019-06-11'),
(324, 'Noman ', 25, '0.00', '220.00', '0.00', '220.00', '', '', 2, '2019-06-16 14:00:00', '', '', '2019-06-11'),
(325, 'Dure ', 25, '0.00', '177.50', '0.00', '177.50', '', '', 2, '2019-06-16 11:30:00', '', '', '2019-06-11'),
(326, 'Dastgir', 90, '0.00', '584.10', '0.00', '584.10', '', '', 2, '2019-06-16 17:00:00', '', '', '2019-06-11'),
(327, 'Saba', 65, '0.00', '454.35', '0.00', '454.35', '', '', 2, '2019-06-16 14:00:00', '', '', '2019-06-11'),
(328, 'Kamal', 25, '0.00', '155.00', '0.00', '155.00', '', '', 2, '2019-06-16 12:30:00', '', '', '2019-06-11'),
(329, 'Yaqoob', 25, '0.00', '249.75', '0.00', '249.75', '', '', 2, '2019-06-16 17:00:00', '', '', '2019-06-11'),
(330, 'Raiz Malik', 25, '0.00', '110.00', '0.00', '110.00', '', '', 2, '2019-06-07 18:00:00', '', '', '2019-06-11'),
(331, 'Riaz Malik', 25, '0.00', '190.00', '0.00', '190.00', '', '', 2, '2019-06-16 12:03:00', '', '', '2019-06-11'),
(332, 'Tariq', 25, '0.00', '60.00', '0.00', '60.00', '', '', 2, '2019-06-16 12:00:00', '', '', '2019-06-12'),
(333, 'Owais', 25, '0.00', '115.00', '0.00', '115.00', '', '', 2, '2019-06-15 15:00:00', '', '', '2019-06-12'),
(334, 'Ahmad bilal', 25, '0.00', '35.00', '0.00', '35.00', '', '', 2, '2019-06-15 15:00:00', '', '', '2019-06-12'),
(335, 'Zahid', 80, '0.00', '799.20', '0.00', '799.20', '', '', 2, '2019-06-15 16:30:00', '', '', '2019-06-12'),
(336, 'Ali syed', 25, '0.00', '25.00', '0.00', '25.00', '', '', 2, '2019-06-16 17:00:00', '', '', '2019-06-12'),
(337, 'Anty Rehana', 25, '0.00', '115.00', '0.00', '115.00', '', '', 2, '2019-06-14 12:30:00', '', '', '2019-06-12'),
(338, 'Abdullah', 25, '0.00', '65.00', '0.00', '65.00', '', '', 2, '2019-06-16 13:00:00', '', '', '2019-06-12'),
(339, 'M.Sethi', 100, '0.00', '944.00', '0.00', '944.00', '', '', 2, '2019-06-16 17:30:00', '', '', '2019-06-12'),
(340, 'Raiz Malik', 25, '0.00', '2135.50', '0.00', '2135.50', '', '', 2, '2019-06-15 17:30:00', '', '', '2019-06-12'),
(341, 'Shazia', 25, '0.00', '108.00', '0.00', '108.00', '', '', 2, '2019-06-15 14:00:00', '', '', '2019-06-12'),
(342, 'Kiteeja', 25, '0.00', '30.00', '0.00', '30.00', '', '', 2, '2019-06-14 15:00:00', '', '', '2019-06-12'),
(343, 'Umer', 25, '0.00', '212.25', '0.00', '212.25', '', '', 2, '2019-06-16 19:30:00', '', '', '2019-06-12'),
(344, 'Arif', 25, '0.00', '40.00', '0.00', '40.00', '', '', 2, '2019-06-15 18:00:00', '', '', '2019-06-13'),
(345, 'Akmal', 25, '0.00', '150.00', '0.00', '150.00', '', '', 2, '2019-06-16 12:30:00', '', '', '2019-06-13'),
(346, 'Riaz', 25, '0.00', '110.00', '0.00', '110.00', '', '', 2, '2019-06-14 18:00:00', '', '', '2019-06-13'),
(347, 'temp1', 50, '0.00', '2100.00', '0.00', '2100.00', '', '', 2, '2019-08-19 13:30:00', '', '', '2019-08-19');

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
(349, 32, 100900, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '35.00', '35.00', 0, 1, '2019-05-12 18:00:00'),
(350, 32, 102800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 8, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 5, '2019-05-12 18:00:00'),
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
(1086, 104, 300, NULL, 100, 100, 100, 1, 140, NULL, 7, 0, 0, '', NULL, NULL, NULL, '5.99', NULL, NULL, NULL, NULL, '', '838.60', NULL, 0, 1, '2019-05-21 19:00:00');
INSERT INTO `order_items` (`id`, `order_id`, `item`, `custom`, `category`, `package`, `main`, `type`, `persons`, `spice`, `tray_lg`, `tray_md`, `tray_sm`, `description`, `qty`, `extra_qty`, `extra_price`, `pkgprice`, `ctmprice`, `sm_price`, `md_price`, `lg_price`, `pkgcmt`, `total`, `d_total`, `pp`, `list`, `delivery_time`) VALUES
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
(1170, 99, 400, NULL, 100, 300, 100, 1, 100, NULL, 5, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '899.00', NULL, 0, 1, '2019-05-22 19:00:00'),
(1171, 99, 500, NULL, 200, 300, 100, 1, 100, NULL, 3, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '899.00', NULL, 0, 1, '2019-05-22 19:00:00'),
(1172, 99, 1000, NULL, 300, 300, 100, 1, 100, NULL, 2, 1, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '899.00', NULL, 0, 1, '2019-05-22 19:00:00'),
(1173, 99, 1600, NULL, 400, 300, 100, 1, 100, NULL, 2, 1, 0, 'give only 2 tray', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '899.00', NULL, 0, 1, '2019-05-22 19:00:00'),
(1174, 99, 2100, NULL, 600, 300, 100, 1, 100, NULL, NULL, NULL, NULL, '', 200, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '899.00', NULL, 1, 2, '2019-05-22 19:00:00'),
(1175, 99, 2700, NULL, 1100, 300, 100, 1, 100, NULL, 0, 2, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '899.00', NULL, 0, 4, '2019-05-22 19:00:00'),
(1176, 99, 3000, NULL, 1200, 300, 100, 1, 100, NULL, NULL, NULL, NULL, '', 70, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '899.00', NULL, 1, 5, '2019-05-22 19:00:00'),
(1177, 99, 3200, NULL, 1300, 300, 100, 1, 100, NULL, NULL, NULL, NULL, '', 8, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '899.00', NULL, 1, 3, '2019-05-22 19:00:00'),
(1191, 102, 100700, NULL, NULL, NULL, 100, 2, NULL, NULL, 5, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '40.00', '50.00', '80.00', NULL, '400.00', '400.00', 0, 1, '2019-05-22 20:00:00'),
(1192, 102, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 8, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-05-22 20:00:00'),
(1193, 102, 1, 'White Rice (R=5.25)', NULL, NULL, 100, 3, NULL, NULL, 3, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-05-22 20:00:00'),
(1194, 102, 1, 'Vagi Pasta', NULL, NULL, 100, 3, NULL, NULL, 4, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-05-22 20:00:00'),
(1195, 102, 1, '2 POT Ch Bir( M=10 R=6)', NULL, NULL, 100, 3, NULL, NULL, 4, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-05-22 20:00:00'),
(1196, 102, 1, '2 POT Ch Bir( M=10 R=6)', NULL, NULL, 100, 3, NULL, NULL, 4, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-05-22 20:00:00'),
(1198, 108, 101500, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 1, 0, 'for thursday', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '40.00', '40.00', 0, 1, '2019-05-22 19:00:00'),
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
(1294, 123, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, 'with cucumber onion tomato', 20, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-05-25 18:30:00'),
(1295, 123, 102700, NULL, NULL, NULL, 100, 2, NULL, NULL, 5, 0, 0, 'give in black bin', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '3.00', 0, 4, '2019-05-25 18:30:00'),
(1296, 123, 1, '4 POT (V.Puloa M=12 R=7.5)', NULL, NULL, 100, 3, NULL, 2, 12, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-05-25 18:30:00'),
(1297, 123, 1, 'Mali Boti( M=110 LB)', NULL, NULL, 100, 3, NULL, 2, 0, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-05-25 18:30:00'),
(1352, 133, 102000, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 116, NULL, NULL, NULL, '3.50', NULL, NULL, NULL, NULL, '406.00', '406.00', 1, 2, '2019-05-25 18:00:00'),
(1353, 133, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, 'cucumber and onion', 0, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-05-25 18:00:00'),
(1354, 133, 102700, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 5, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 4, '2019-05-25 18:00:00'),
(1355, 133, 1, '3 POT Puloa Rice( R=8.5*3)', NULL, NULL, 100, 3, NULL, NULL, 15, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-05-25 18:00:00'),
(1356, 133, 1, 'Veal Qurma( M=22 KG)', NULL, NULL, 100, 3, NULL, NULL, 5, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-05-25 18:00:00'),
(1366, 134, 100, NULL, 100, 400, 100, 1, 30, NULL, 1, 0, 1, 'extra rice', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '299.70', NULL, 0, 1, '2019-05-25 19:30:00'),
(1367, 134, 1000, NULL, 300, 400, 100, 1, 30, NULL, 1, 0, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '299.70', NULL, 0, 1, '2019-05-25 19:30:00'),
(1368, 134, 1200, NULL, 400, 400, 100, 1, 30, NULL, 1, 0, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '299.70', NULL, 0, 6, '2019-05-25 19:30:00'),
(1369, 134, 1900, NULL, 500, 400, 100, 1, 30, NULL, 1, 0, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '299.70', NULL, 0, 1, '2019-05-25 19:30:00'),
(1370, 134, 2100, NULL, 600, 400, 100, 1, 30, NULL, NULL, NULL, NULL, '', 105, 45, '90.00', '9.99', NULL, NULL, NULL, NULL, '', '299.70', NULL, 1, 2, '2019-05-25 19:30:00'),
(1371, 134, 2700, NULL, 1100, 400, 100, 1, 30, NULL, 0, 0, 1, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '299.70', NULL, 0, 4, '2019-05-25 19:30:00'),
(1372, 134, 3000, NULL, 1200, 400, 100, 1, 30, NULL, NULL, NULL, NULL, '', 36, 15, '22.50', '9.99', NULL, NULL, NULL, NULL, '', '299.70', NULL, 1, 5, '2019-05-25 19:30:00'),
(1373, 134, 3200, NULL, 1300, 400, 100, 1, 30, NULL, NULL, NULL, NULL, '', 4, 0, '0.00', '9.99', NULL, NULL, NULL, NULL, '', '299.70', NULL, 1, 3, '2019-05-25 19:30:00'),
(1374, 134, 100500, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '35.00', '35.00', 0, 1, '2019-05-25 19:30:00'),
(1393, 136, 100200, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '60.00', '60.00', 0, 1, '2019-05-24 17:00:00'),
(1394, 136, 100700, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '40.00', '50.00', '80.00', NULL, '80.00', '80.00', 0, 1, '2019-05-24 17:00:00'),
(1395, 136, 101000, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '70.00', '70.00', 0, 1, '2019-05-24 17:00:00'),
(1396, 136, 101400, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '50.00', '50.00', 0, 6, '2019-05-24 17:00:00'),
(1397, 136, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 1, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-05-24 17:00:00'),
(1398, 136, 102800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 20, NULL, NULL, NULL, '1.50', NULL, NULL, NULL, NULL, '30.00', '30.00', 1, 5, '2019-05-24 17:00:00'),
(1399, 135, 400, NULL, 100, 300, 100, 1, 40, NULL, 2, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '359.60', NULL, 0, 1, '2019-05-23 18:00:00'),
(1400, 135, 700, NULL, 200, 300, 100, 1, 40, NULL, 1, 0, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '359.60', NULL, 0, 1, '2019-05-23 18:00:00'),
(1401, 135, 900, NULL, 300, 300, 100, 1, 40, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '359.60', NULL, 0, 1, '2019-05-23 18:00:00'),
(1402, 135, 1200, NULL, 400, 300, 100, 1, 40, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '359.60', NULL, 0, 6, '2019-05-23 18:00:00'),
(1403, 135, 2100, NULL, 600, 300, 100, 1, 40, NULL, NULL, NULL, NULL, 'well done', 80, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '359.60', NULL, 1, 2, '2019-05-23 18:00:00'),
(1404, 135, 2700, NULL, 1100, 300, 100, 1, 40, NULL, 0, 1, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '359.60', NULL, 0, 4, '2019-05-23 18:00:00'),
(1405, 135, 3000, NULL, 1200, 300, 100, 1, 40, NULL, NULL, NULL, NULL, '', 28, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '359.60', NULL, 1, 5, '2019-05-23 18:00:00'),
(1406, 135, 3200, NULL, 1300, 300, 100, 1, 40, NULL, NULL, NULL, NULL, '', 4, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '359.60', NULL, 1, 3, '2019-05-23 18:00:00'),
(1407, 135, 101900, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 40, NULL, NULL, NULL, '2.50', NULL, NULL, NULL, NULL, '100.00', '100.00', 1, 2, '2019-05-23 18:00:00'),
(1416, 128, 100300, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '60.00', '60.00', 0, 1, '2019-05-23 18:30:00'),
(1417, 128, 102000, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 10, NULL, NULL, NULL, '3.50', NULL, NULL, NULL, NULL, '35.00', '35.00', 1, 2, '2019-05-23 18:30:00'),
(1418, 111, 101400, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '25.00', '25.00', 0, 6, '2019-05-23 18:30:00'),
(1419, 111, 101715, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '25.00', '25.00', 0, 1, '2019-05-23 18:30:00'),
(1420, 111, 101800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, 'Less Salt', 25, NULL, NULL, NULL, '2.50', NULL, NULL, NULL, NULL, '62.50', '62.50', 1, 2, '2019-05-23 18:30:00'),
(1421, 111, 102400, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, 'Less Salt', 10, NULL, NULL, NULL, '7.50', NULL, NULL, NULL, NULL, '75.00', '75.00', 1, 2, '2019-05-23 18:30:00'),
(1422, 111, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 1, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-05-23 18:30:00'),
(1423, 109, 100300, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '90.00', '90.00', 0, 1, '2019-05-23 17:30:00'),
(1424, 109, 101500, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 1, 0, 'with Gulab Jaman', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '40.00', '40.00', 0, 1, '2019-05-23 17:30:00'),
(1425, 110, 200, NULL, 100, 300, 100, 1, 35, NULL, 1, 1, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '297.15', NULL, 0, 1, '2019-05-23 18:30:00'),
(1426, 110, 700, NULL, 200, 300, 100, 1, 35, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '297.15', NULL, 0, 1, '2019-05-23 18:30:00'),
(1427, 110, 1000, NULL, 300, 300, 100, 1, 35, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '297.15', NULL, 0, 1, '2019-05-23 18:30:00'),
(1428, 110, 1200, NULL, 400, 300, 100, 1, 35, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '297.15', NULL, 0, 6, '2019-05-23 18:30:00'),
(1429, 110, 2100, NULL, 600, 300, 100, 1, 35, NULL, NULL, NULL, NULL, '', 70, 0, '0.00', '8.49', NULL, NULL, NULL, NULL, '', '297.15', NULL, 1, 2, '2019-05-23 18:30:00'),
(1430, 110, 2700, NULL, 1100, 300, 100, 1, 35, NULL, 0, 1, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '297.15', NULL, 0, 4, '2019-05-23 18:30:00'),
(1431, 110, 3100, NULL, 1200, 300, 100, 1, 35, NULL, NULL, NULL, NULL, '', 35, 0, '0.00', '8.49', NULL, NULL, NULL, NULL, '', '297.15', NULL, 1, 5, '2019-05-23 18:30:00'),
(1432, 110, 3200, NULL, 1300, 300, 100, 1, 35, NULL, NULL, NULL, NULL, '', 4, 0, '0.00', '8.49', NULL, NULL, NULL, NULL, '', '297.15', NULL, 1, 3, '2019-05-23 18:30:00'),
(1433, 100, 0, NULL, 100, 300, 100, 1, 25, 1, 1, 0, 1, '', NULL, NULL, NULL, '6.49', NULL, NULL, NULL, NULL, '', '162.25', NULL, 0, 1, '2019-05-22 18:30:00'),
(1434, 100, 700, NULL, 200, 300, 100, 1, 25, 1, 1, 0, 0, '', NULL, NULL, NULL, '6.49', NULL, NULL, NULL, NULL, '', '162.25', NULL, 0, 1, '2019-05-22 18:30:00'),
(1435, 100, 1000, NULL, 300, 300, 100, 1, 25, 1, 0, 1, 0, '', NULL, NULL, NULL, '6.49', NULL, NULL, NULL, NULL, '', '162.25', NULL, 0, 1, '2019-05-22 18:30:00'),
(1436, 100, 1200, NULL, 400, 300, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '6.49', NULL, NULL, NULL, NULL, '', '162.25', NULL, 0, 6, '2019-05-22 18:30:00'),
(1437, 100, 2200, NULL, 600, 300, 100, 1, 25, 1, NULL, NULL, NULL, '', 25, 0, '0.00', '6.49', NULL, NULL, NULL, NULL, '', '162.25', NULL, 1, 2, '2019-05-22 18:30:00'),
(1438, 100, 2700, NULL, 1100, 300, 100, 1, 25, NULL, 0, 0, 1, '', NULL, NULL, NULL, '6.49', NULL, NULL, NULL, NULL, '', '162.25', NULL, 0, 4, '2019-05-22 18:30:00'),
(1439, 100, 3100, NULL, 1200, 300, 100, 1, 25, NULL, NULL, NULL, NULL, '', 25, 0, '0.00', '6.49', NULL, NULL, NULL, NULL, '', '162.25', NULL, 1, 5, '2019-05-22 18:30:00'),
(1440, 100, 3200, NULL, 1300, 300, 100, 1, 25, NULL, NULL, NULL, NULL, '', 2, 0, '0.00', '6.49', NULL, NULL, NULL, NULL, '', '162.25', NULL, 1, 3, '2019-05-22 18:30:00'),
(1441, 100, 1, 'Ch. Bir 25 PPL M=2.5 R=2.25)', NULL, NULL, 100, 3, NULL, 1, 1, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-05-22 18:30:00'),
(1442, 137, 100300, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '60.00', '60.00', 0, 1, '2019-05-25 18:00:00'),
(1443, 137, 100500, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 1, 0, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '50.00', '50.00', 0, 1, '2019-05-25 18:00:00'),
(1444, 137, 101400, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '50.00', '50.00', 0, 6, '2019-05-25 18:00:00'),
(1454, 117, 400, NULL, 100, 300, 100, 1, 25, NULL, 1, 0, 1, '', NULL, NULL, NULL, '6.49', NULL, NULL, NULL, NULL, '', '162.25', NULL, 0, 1, '2019-05-25 15:00:00'),
(1455, 117, 500, NULL, 200, 300, 100, 1, 25, NULL, 1, 0, 0, '', NULL, NULL, NULL, '6.49', NULL, NULL, NULL, NULL, '', '162.25', NULL, 0, 1, '2019-05-25 15:00:00'),
(1456, 117, 0, NULL, 300, 300, 100, 1, 25, NULL, 0, 1, 0, 'Soft', NULL, NULL, NULL, '6.49', NULL, NULL, NULL, NULL, '', '162.25', NULL, 0, 1, '2019-05-25 15:00:00'),
(1457, 117, 1200, NULL, 400, 300, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '6.49', NULL, NULL, NULL, NULL, '', '162.25', NULL, 0, 6, '2019-05-25 15:00:00'),
(1465, 105, 400, NULL, 100, 200, 100, 1, 90, NULL, 4, 0, 1, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '629.10', NULL, 0, 1, '2019-05-22 20:00:00'),
(1466, 105, 0, NULL, 300, 200, 100, 1, 90, NULL, 2, 0, 1, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '629.10', NULL, 0, 1, '2019-05-22 20:00:00'),
(1467, 105, 1600, NULL, 400, 200, 100, 1, 90, NULL, 2, 0, 1, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '629.10', NULL, 0, 1, '2019-05-22 20:00:00'),
(1468, 105, 1900, NULL, 500, 200, 100, 1, 90, NULL, 2, 0, 1, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '629.10', NULL, 0, 1, '2019-05-22 20:00:00'),
(1469, 105, 0, NULL, 1100, 200, 100, 1, 90, NULL, 0, 2, 0, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '629.10', NULL, 0, 1, '2019-05-22 20:00:00'),
(1470, 105, 0, NULL, 1200, 200, 100, 1, 90, NULL, 22, 1, 0, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '629.10', NULL, 0, 1, '2019-05-22 20:00:00'),
(1471, 105, 3200, NULL, 1300, 200, 100, 1, 90, NULL, NULL, NULL, NULL, '', 8, 0, '0.00', '6.99', NULL, NULL, NULL, NULL, '', '629.10', NULL, 1, 3, '2019-05-22 20:00:00'),
(1472, 115, 400, NULL, 100, 400, 100, 1, 25, NULL, 1, 0, 1, '', NULL, NULL, NULL, '9.49', NULL, NULL, NULL, NULL, '', '237.25', NULL, 0, 1, '2019-05-24 18:00:00'),
(1473, 115, 0, NULL, 300, 400, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '9.49', NULL, NULL, NULL, NULL, '', '237.25', NULL, 0, 1, '2019-05-24 18:00:00'),
(1474, 115, 1200, NULL, 400, 400, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '9.49', NULL, NULL, NULL, NULL, '', '237.25', NULL, 0, 6, '2019-05-24 18:00:00'),
(1475, 115, 1800, NULL, 500, 400, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '9.49', NULL, NULL, NULL, NULL, '', '237.25', NULL, 0, 1, '2019-05-24 18:00:00'),
(1476, 115, 2300, NULL, 600, 400, 100, 1, 25, NULL, NULL, NULL, NULL, '', 35, 10, '25.00', '9.49', NULL, NULL, NULL, NULL, '', '237.25', NULL, 1, 2, '2019-05-24 18:00:00'),
(1477, 115, 2700, NULL, 1100, 400, 100, 1, 25, NULL, 0, 0, 1, '', NULL, NULL, NULL, '9.49', NULL, NULL, NULL, NULL, '', '237.25', NULL, 0, 4, '2019-05-24 18:00:00'),
(1478, 115, 3000, NULL, 1200, 400, 100, 1, 25, NULL, NULL, NULL, NULL, '', 18, 0, '0.00', '9.49', NULL, NULL, NULL, NULL, '', '237.25', NULL, 1, 5, '2019-05-24 18:00:00'),
(1479, 115, 3200, NULL, 1300, 400, 100, 1, 25, NULL, NULL, NULL, NULL, '', 2, 0, '0.00', '9.49', NULL, NULL, NULL, NULL, '', '237.25', NULL, 1, 3, '2019-05-24 18:00:00'),
(1488, 49, 400, NULL, 100, 400, 100, 1, 120, NULL, 6, 0, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '1198.80', NULL, 0, 1, '2019-05-24 19:00:00'),
(1489, 49, 1000, NULL, 300, 400, 100, 1, 120, NULL, 3, 0, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '1198.80', NULL, 0, 1, '2019-05-24 19:00:00'),
(1490, 49, 1200, NULL, 400, 400, 100, 1, 120, NULL, 3, 0, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '1198.80', NULL, 0, 6, '2019-05-24 19:00:00'),
(1491, 49, 1900, NULL, 500, 400, 100, 1, 120, NULL, 3, 0, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '1198.80', NULL, 0, 1, '2019-05-24 19:00:00'),
(1492, 49, 2300, NULL, 600, 400, 100, 1, 120, NULL, NULL, NULL, NULL, '', 120, 0, '0.00', '9.99', NULL, NULL, NULL, NULL, '', '1198.80', NULL, 1, 2, '2019-05-24 19:00:00'),
(1493, 49, 2700, NULL, 1100, 400, 100, 1, 120, NULL, 0, 3, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '1198.80', NULL, 0, 4, '2019-05-24 19:00:00'),
(1494, 49, 3000, NULL, 1200, 400, 100, 1, 120, NULL, NULL, NULL, NULL, '', 84, 0, '0.00', '9.99', NULL, NULL, NULL, NULL, '', '1198.80', NULL, 1, 5, '2019-05-24 19:00:00'),
(1495, 49, 3200, NULL, 1300, 400, 100, 1, 120, NULL, NULL, NULL, NULL, '', 10, 0, '0.00', '9.99', NULL, NULL, NULL, NULL, '', '1198.80', NULL, 1, 3, '2019-05-24 19:00:00'),
(1507, 139, 101500, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '25.00', '25.00', 0, 1, '2019-05-24 18:30:00'),
(1540, 129, 100, NULL, 100, 100, 100, 1, 90, NULL, 4, 0, 1, '', NULL, NULL, NULL, '3.99', NULL, NULL, NULL, NULL, '', '359.10', NULL, 0, 1, '2019-05-23 21:35:00'),
(1541, 129, 0, NULL, 200, 100, 100, 1, 90, NULL, 2, 1, 0, '', NULL, NULL, NULL, '3.99', NULL, NULL, NULL, NULL, '', '359.10', NULL, 0, 1, '2019-05-23 21:35:00'),
(1542, 129, 0, NULL, 300, 100, 100, 1, 90, NULL, 2, 1, 0, '', NULL, NULL, NULL, '3.99', NULL, NULL, NULL, NULL, '', '359.10', NULL, 0, 1, '2019-05-23 21:35:00'),
(1543, 129, 1200, NULL, 400, 100, 100, 1, 90, NULL, 2, 0, 1, '', NULL, NULL, NULL, '3.99', NULL, NULL, NULL, NULL, '', '359.10', NULL, 0, 6, '2019-05-23 21:35:00'),
(1544, 129, 0, NULL, 1100, 100, 100, 1, 90, NULL, 2, 1, 0, '', NULL, NULL, NULL, '3.99', NULL, NULL, NULL, NULL, '', '359.10', NULL, 0, 1, '2019-05-23 21:35:00'),
(1545, 129, 0, NULL, 1200, 100, 100, 1, 90, NULL, 2, 1, 0, '', NULL, NULL, NULL, '3.99', NULL, NULL, NULL, NULL, '', '359.10', NULL, 0, 1, '2019-05-23 21:35:00'),
(1546, 129, 3200, NULL, 1300, 100, 100, 1, 90, NULL, NULL, NULL, NULL, '', 8, 0, '0.00', '3.99', NULL, NULL, NULL, NULL, '', '359.10', NULL, 1, 3, '2019-05-23 21:35:00'),
(1547, 129, 1, 'Achari Chicken(90 PPL)', NULL, NULL, 100, 3, NULL, NULL, 3, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-05-23 21:35:00'),
(1552, 126, 101000, NULL, NULL, NULL, 100, 2, NULL, NULL, 8, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '560.00', '560.00', 0, 1, '2019-05-26 18:00:00'),
(1553, 126, 101400, NULL, NULL, NULL, 100, 2, NULL, NULL, 3, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '150.00', '150.00', 0, 6, '2019-05-26 18:00:00'),
(1554, 126, 101710, NULL, NULL, NULL, 100, 2, NULL, NULL, 3, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '150.00', '150.00', 0, 1, '2019-05-26 18:00:00'),
(1555, 126, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 8, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-05-26 18:00:00'),
(1556, 140, 100, NULL, 100, 100, 100, 1, 250, NULL, 12, 0, 1, '', NULL, NULL, NULL, '5.99', NULL, NULL, NULL, NULL, '', '1497.50', NULL, 0, 1, '2019-05-26 17:50:00'),
(1557, 140, 600, NULL, 200, 100, 100, 1, 250, NULL, 7, 0, 1, '', NULL, NULL, NULL, '5.99', NULL, NULL, NULL, NULL, '', '1497.50', NULL, 0, 1, '2019-05-26 17:50:00'),
(1558, 140, 0, NULL, 300, 100, 100, 1, 250, NULL, 6, 0, 1, '', NULL, NULL, NULL, '5.99', NULL, NULL, NULL, NULL, '', '1497.50', NULL, 0, 1, '2019-05-26 17:50:00'),
(1559, 140, 1200, NULL, 400, 100, 100, 1, 250, NULL, 6, 0, 1, '', NULL, NULL, NULL, '5.99', NULL, NULL, NULL, NULL, '', '1497.50', NULL, 0, 6, '2019-05-26 17:50:00'),
(1560, 140, 2700, NULL, 1100, 100, 100, 1, 250, NULL, 0, 6, 0, '', NULL, NULL, NULL, '5.99', NULL, NULL, NULL, NULL, '', '1497.50', NULL, 0, 4, '2019-05-26 17:50:00'),
(1561, 140, 0, NULL, 1200, 100, 100, 1, 250, NULL, 0, 0, 0, '', NULL, NULL, NULL, '5.99', NULL, NULL, NULL, NULL, '', '1497.50', NULL, 0, 1, '2019-05-26 17:50:00'),
(1562, 140, 3200, NULL, 1300, 100, 100, 1, 250, NULL, NULL, NULL, NULL, '', 20, 0, '0.00', '5.99', NULL, NULL, NULL, NULL, '', '1497.50', NULL, 1, 3, '2019-05-26 17:50:00'),
(1563, 141, 100300, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '60.00', '60.00', 0, 1, '2019-05-24 18:00:00'),
(1564, 141, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 1, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-05-24 18:00:00'),
(1565, 142, 101800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 4, NULL, NULL, NULL, '2.50', NULL, NULL, NULL, NULL, '10.00', '10.00', 1, 2, '2019-05-25 18:00:00'),
(1566, 142, 101900, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 4, NULL, NULL, NULL, '2.50', NULL, NULL, NULL, NULL, '10.00', '10.00', 1, 2, '2019-05-25 18:00:00'),
(1567, 142, 102000, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 2, NULL, NULL, NULL, '3.50', NULL, NULL, NULL, NULL, '7.00', '7.00', 1, 2, '2019-05-25 18:00:00'),
(1568, 142, 102300, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 2, NULL, NULL, NULL, '7.50', NULL, NULL, NULL, NULL, '15.00', '15.00', 1, 2, '2019-05-25 18:00:00'),
(1576, 143, 100300, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '90.00', '90.00', 0, 1, '2019-05-26 19:30:00'),
(1577, 143, 101800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 25, NULL, NULL, NULL, '2.50', NULL, NULL, NULL, NULL, '62.50', '62.50', 1, 2, '2019-05-26 19:30:00'),
(1578, 143, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 2, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-05-26 19:30:00'),
(1579, 143, 102800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 20, NULL, NULL, NULL, '1.50', NULL, NULL, NULL, NULL, '30.00', '30.00', 1, 5, '2019-05-26 19:30:00'),
(1587, 144, 100300, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 1, 0, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '45.00', '45.00', 0, 1, '2019-05-24 18:30:00'),
(1588, 144, 100500, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 1, 0, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '50.00', '50.00', 0, 1, '2019-05-24 18:30:00'),
(1589, 138, 400, NULL, 100, 300, 100, 1, 70, NULL, 3, 0, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '629.30', NULL, 0, 1, '2019-05-25 19:00:00'),
(1590, 138, 700, NULL, 200, 300, 100, 1, 70, NULL, 2, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '629.30', NULL, 0, 1, '2019-05-25 19:00:00'),
(1591, 138, 1000, NULL, 300, 300, 100, 1, 70, NULL, 2, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '629.30', NULL, 0, 1, '2019-05-25 19:00:00'),
(1592, 138, 1200, NULL, 400, 300, 100, 1, 70, NULL, 2, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '629.30', NULL, 0, 6, '2019-05-25 19:00:00'),
(1593, 138, 2100, NULL, 600, 300, 100, 1, 70, NULL, NULL, NULL, NULL, '', 140, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '629.30', NULL, 1, 2, '2019-05-25 19:00:00'),
(1594, 138, 2700, NULL, 1100, 300, 100, 1, 70, NULL, 0, 1, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '629.30', NULL, 0, 4, '2019-05-25 19:00:00'),
(1595, 138, 3000, NULL, 1200, 300, 100, 1, 70, NULL, NULL, NULL, NULL, '', 49, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '629.30', NULL, 1, 5, '2019-05-25 19:00:00'),
(1596, 138, 3200, NULL, 1300, 300, 100, 1, 70, NULL, NULL, NULL, NULL, '', 6, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '629.30', NULL, 1, 3, '2019-05-25 19:00:00'),
(1597, 138, 101800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 100, NULL, NULL, NULL, '2.50', NULL, NULL, NULL, NULL, '250.00', '250.00', 1, 2, '2019-05-25 19:00:00'),
(1612, 130, 100, NULL, 100, 100, 100, 1, 175, NULL, 8, 1, 0, '', NULL, NULL, NULL, '5.99', NULL, NULL, NULL, NULL, '', '1048.25', NULL, 0, 1, '2019-05-24 22:30:00'),
(1613, 130, 600, NULL, 200, 100, 100, 1, 175, NULL, 5, 0, 0, '', NULL, NULL, NULL, '5.99', NULL, NULL, NULL, NULL, '', '1048.25', NULL, 0, 1, '2019-05-24 22:30:00'),
(1614, 130, 0, NULL, 300, 100, 100, 1, 175, NULL, 4, 1, 0, '', NULL, NULL, NULL, '5.99', NULL, NULL, NULL, NULL, '', '1048.25', NULL, 0, 1, '2019-05-24 22:30:00'),
(1615, 130, 1400, NULL, 400, 100, 100, 1, 175, NULL, 4, 1, 0, '', NULL, NULL, NULL, '5.99', NULL, NULL, NULL, NULL, '', '1048.25', NULL, 0, 6, '2019-05-24 22:30:00'),
(1616, 130, 0, NULL, 1100, 100, 100, 1, 175, NULL, 4, 1, 0, '', NULL, NULL, NULL, '5.99', NULL, NULL, NULL, NULL, '', '1048.25', NULL, 0, 1, '2019-05-24 22:30:00'),
(1617, 130, 0, NULL, 1200, 100, 100, 1, 175, NULL, 4, 1, 0, '', NULL, NULL, NULL, '5.99', NULL, NULL, NULL, NULL, '', '1048.25', NULL, 0, 1, '2019-05-24 22:30:00'),
(1618, 130, 3200, NULL, 1300, 100, 100, 1, 175, NULL, NULL, NULL, NULL, '', 14, 0, '0.00', '5.99', NULL, NULL, NULL, NULL, '', '1048.25', NULL, 1, 3, '2019-05-24 22:30:00'),
(1619, 145, 100600, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '40.00', '70.00', '90.00', NULL, '40.00', '40.00', 0, 1, '2019-05-25 11:30:00'),
(1620, 145, 101400, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '25.00', '25.00', 0, 6, '2019-05-25 11:30:00'),
(1632, 116, 101400, NULL, NULL, NULL, 100, 2, NULL, NULL, 4, 0, 0, 'for 200 PPL', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '200.00', '200.00', 0, 6, '2019-05-25 19:00:00'),
(1633, 116, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 10, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-05-25 19:00:00'),
(1634, 116, 1, '3 POT Ch Bir( M= ?  R=7.5*3)', NULL, NULL, 100, 3, NULL, 1, 15, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-05-25 19:00:00'),
(1635, 148, 100000, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '30.00', '30.00', 0, 1, '2019-05-25 19:30:00'),
(1636, 148, 102000, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 5, NULL, NULL, NULL, '3.50', NULL, NULL, NULL, NULL, '17.50', '17.50', 1, 2, '2019-05-25 19:30:00'),
(1637, 148, 102800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 6, NULL, NULL, NULL, '1.50', NULL, NULL, NULL, NULL, '9.00', '9.00', 1, 5, '2019-05-25 19:30:00'),
(1638, 149, 100500, NULL, NULL, NULL, 100, 2, NULL, NULL, 2, 0, 1, 'for 70 PPL', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '175.00', '175.00', 0, 1, '2019-05-25 19:00:00'),
(1639, 149, 102600, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 3, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.25', NULL, '0.00', '0.00', 0, 4, '2019-05-25 19:00:00'),
(1640, 150, 100700, NULL, NULL, NULL, 100, 2, NULL, NULL, 2, 0, 1, 'for 75 PPL', NULL, NULL, NULL, NULL, NULL, '40.00', '50.00', '80.00', NULL, '200.00', '200.00', 0, 1, '2019-05-26 19:00:00'),
(1641, 150, 102600, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 3, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.25', NULL, '0.00', '0.00', 0, 4, '2019-05-26 19:00:00'),
(1642, 151, 101500, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '25.00', '25.00', 0, 1, '2019-05-25 18:00:00'),
(1643, 152, 101500, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '25.00', '25.00', 0, 1, '2019-05-24 18:00:00'),
(1644, 153, 100200, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '60.00', '60.00', 0, 1, '2019-05-24 19:30:00'),
(1645, 153, 101100, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '105.00', '105.00', 0, 1, '2019-05-24 19:30:00'),
(1648, 114, 101500, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 1, 'for 70 PPL', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '75.00', '75.00', 0, 1, '2019-05-24 19:45:00'),
(1649, 114, 1, 'Ch Qurma9 M=11.25)', NULL, NULL, 100, 3, NULL, NULL, 3, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-05-24 19:45:00'),
(1651, 155, 100600, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '40.00', '70.00', '90.00', NULL, '40.00', '40.00', 0, 1, '2019-05-26 17:30:00'),
(1652, 155, 101800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 10, NULL, NULL, NULL, '2.50', NULL, NULL, NULL, NULL, '25.00', '25.00', 1, 2, '2019-05-26 17:30:00'),
(1653, 155, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 1, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-05-26 17:30:00'),
(1654, 155, 102800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 8, NULL, NULL, NULL, '1.50', NULL, NULL, NULL, NULL, '12.00', '12.00', 1, 5, '2019-05-26 17:30:00'),
(1655, 154, 101500, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 2, 'rice only 2.5 KG', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '100.00', '100.00', 0, 1, '2019-05-26 16:00:00'),
(1656, 131, 400, NULL, 100, 100, 100, 1, 200, NULL, 10, 0, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '1498.00', NULL, 0, 1, '2019-05-25 19:30:00'),
(1657, 131, 700, NULL, 200, 100, 100, 1, 200, NULL, 6, 0, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '1498.00', NULL, 0, 1, '2019-05-25 19:30:00'),
(1658, 131, 1000, NULL, 300, 100, 100, 1, 200, NULL, 5, 0, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '1498.00', NULL, 0, 1, '2019-05-25 19:30:00'),
(1659, 131, 1200, NULL, 400, 100, 100, 1, 200, NULL, 5, 0, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '1498.00', NULL, 0, 6, '2019-05-25 19:30:00'),
(1660, 131, 0, NULL, 1100, 100, 100, 1, 200, NULL, 0, 5, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '1498.00', NULL, 0, 1, '2019-05-25 19:30:00'),
(1661, 131, 3000, NULL, 1200, 100, 100, 1, 200, NULL, NULL, NULL, NULL, '', 140, 0, '0.00', '7.49', NULL, NULL, NULL, NULL, '', '1498.00', NULL, 1, 5, '2019-05-25 19:30:00'),
(1662, 131, 3200, NULL, 1300, 100, 100, 1, 200, NULL, NULL, NULL, NULL, '', 16, 0, '0.00', '7.49', NULL, NULL, NULL, NULL, '', '1498.00', NULL, 1, 3, '2019-05-25 19:30:00'),
(1663, 131, 102000, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 133, NULL, NULL, NULL, '3.50', NULL, NULL, NULL, NULL, '465.50', '465.50', 1, 2, '2019-05-25 19:30:00'),
(1667, 125, 0, NULL, 100, 100, 100, 1, 175, NULL, 8, 1, 0, '', NULL, NULL, NULL, '4.49', NULL, NULL, NULL, NULL, '', '785.75', NULL, 0, 1, '2019-05-26 19:45:00'),
(1668, 125, 500, NULL, 200, 100, 100, 1, 175, NULL, 5, 0, 0, '', NULL, NULL, NULL, '4.49', NULL, NULL, NULL, NULL, '', '785.75', NULL, 0, 1, '2019-05-26 19:45:00'),
(1669, 125, 1100, NULL, 300, 100, 100, 1, 175, NULL, 4, 1, 0, '', NULL, NULL, NULL, '4.49', NULL, NULL, NULL, NULL, '', '785.75', NULL, 0, 1, '2019-05-26 19:45:00'),
(1670, 125, 1300, NULL, 400, 100, 100, 1, 175, NULL, NULL, NULL, NULL, 'just 200 pc', 350, 0, '0.00', '4.49', NULL, NULL, NULL, NULL, '', '785.75', NULL, 1, 6, '2019-05-26 19:45:00'),
(1671, 125, 0, NULL, 1100, 100, 100, 1, 175, NULL, 8, 1, 0, '', NULL, NULL, NULL, '4.49', NULL, NULL, NULL, NULL, '', '785.75', NULL, 0, 1, '2019-05-26 19:45:00'),
(1672, 125, 0, NULL, 1200, 100, 100, 1, 175, NULL, 8, 1, 0, '', NULL, NULL, NULL, '4.49', NULL, NULL, NULL, NULL, '', '785.75', NULL, 0, 1, '2019-05-26 19:45:00'),
(1673, 125, 3200, NULL, 1300, 100, 100, 1, 175, NULL, NULL, NULL, NULL, '', 14, 0, '0.00', '4.49', NULL, NULL, NULL, NULL, '', '785.75', NULL, 1, 3, '2019-05-26 19:45:00'),
(1674, 125, 100500, NULL, NULL, NULL, 100, 2, NULL, NULL, 6, 0, 0, 'for 175 PPL and 1L extra', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '420.00', '420.00', 0, 1, '2019-05-26 19:45:00'),
(1675, 125, 101200, NULL, NULL, NULL, 100, 2, NULL, NULL, 4, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '200.00', '200.00', 0, 6, '2019-05-26 19:45:00'),
(1676, 125, 101500, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '25.00', '25.00', 0, 1, '2019-05-26 19:45:00'),
(1677, 125, 1, '2 POT Chana Puloa( R=5.25 *2)', NULL, NULL, 100, 3, NULL, NULL, 0, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-05-26 19:45:00'),
(1678, 157, 100500, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '70.00', '70.00', 0, 1, '2019-05-25 18:00:00'),
(1679, 158, 100500, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '35.00', '35.00', 0, 1, '2019-05-26 15:00:00'),
(1680, 158, 102800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '4 CUT', 6, NULL, NULL, NULL, '1.50', NULL, NULL, NULL, NULL, '9.00', '9.00', 1, 5, '2019-05-26 15:00:00'),
(1681, 147, 101500, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '25.00', '25.00', 0, 1, '2019-05-24 15:00:00'),
(1682, 127, 101705, NULL, NULL, NULL, 100, 2, NULL, 2, 26, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '1300.00', '1300.00', 0, 1, '2019-05-26 18:30:00'),
(1683, 127, 102600, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 24, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.25', NULL, '0.00', '1.00', 0, 4, '2019-05-26 18:30:00'),
(1684, 146, 100000, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '30.00', '30.00', 0, 1, '2019-05-26 15:00:00'),
(1685, 146, 100400, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '60.00', '60.00', 0, 1, '2019-05-26 15:00:00'),
(1686, 146, 100900, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '35.00', '35.00', 0, 1, '2019-05-26 15:00:00'),
(1687, 146, 101500, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '25.00', '25.00', 0, 1, '2019-05-26 15:00:00'),
(1688, 146, 101900, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 50, NULL, NULL, NULL, '2.50', NULL, NULL, NULL, NULL, '125.00', '125.00', 1, 2, '2019-05-26 15:00:00'),
(1689, 146, 102000, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 20, NULL, NULL, NULL, '3.50', NULL, NULL, NULL, NULL, '70.00', '70.00', 1, 2, '2019-05-26 15:00:00'),
(1690, 146, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 1, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-05-26 15:00:00'),
(1691, 146, 1, 'Dal Chana', NULL, NULL, 100, 3, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-05-26 15:00:00'),
(1692, 156, 100300, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '60.00', '60.00', 0, 1, '2019-05-26 18:00:00'),
(1693, 156, 100500, NULL, NULL, NULL, 100, 2, NULL, 2, 0, 0, 1, 'mild', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '35.00', '35.00', 0, 1, '2019-05-26 18:00:00'),
(1694, 156, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 1, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-05-26 18:00:00'),
(1695, 159, 1, 'Dal Aloo Gosh 550 PPL)', NULL, NULL, 100, 3, NULL, 2, 10, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-05-26 19:30:00'),
(1696, 159, 1, '4 POT Whate Rice (8.75 *4)', NULL, NULL, 100, 3, NULL, NULL, 10, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-05-26 19:30:00'),
(1697, 160, 300, NULL, 100, 300, 100, 1, 120, NULL, 6, 0, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '1018.80', NULL, 0, 1, '2019-05-27 17:00:00'),
(1698, 160, 600, NULL, 200, 300, 100, 1, 120, NULL, 3, 1, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '1018.80', NULL, 0, 1, '2019-05-27 17:00:00'),
(1699, 160, 1100, NULL, 300, 300, 100, 1, 120, NULL, 3, 0, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '1018.80', NULL, 0, 1, '2019-05-27 17:00:00'),
(1700, 160, 1200, NULL, 400, 300, 100, 1, 120, NULL, 3, 0, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '1018.80', NULL, 0, 6, '2019-05-27 17:00:00'),
(1701, 160, 2200, NULL, 600, 300, 100, 1, 120, NULL, NULL, NULL, NULL, '', 120, 0, '0.00', '8.49', NULL, NULL, NULL, NULL, '', '1018.80', NULL, 1, 2, '2019-05-27 17:00:00'),
(1702, 160, 2700, NULL, 1100, 300, 100, 1, 120, NULL, 0, 3, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '1018.80', NULL, 0, 4, '2019-05-27 17:00:00');
INSERT INTO `order_items` (`id`, `order_id`, `item`, `custom`, `category`, `package`, `main`, `type`, `persons`, `spice`, `tray_lg`, `tray_md`, `tray_sm`, `description`, `qty`, `extra_qty`, `extra_price`, `pkgprice`, `ctmprice`, `sm_price`, `md_price`, `lg_price`, `pkgcmt`, `total`, `d_total`, `pp`, `list`, `delivery_time`) VALUES
(1703, 160, 3100, NULL, 1200, 300, 100, 1, 120, NULL, NULL, NULL, NULL, '', 120, 0, '0.00', '8.49', NULL, NULL, NULL, NULL, '', '1018.80', NULL, 1, 5, '2019-05-27 17:00:00'),
(1704, 160, 3200, NULL, 1300, 300, 100, 1, 120, NULL, NULL, NULL, NULL, '', 10, 0, '0.00', '8.49', NULL, NULL, NULL, NULL, '', '1018.80', NULL, 1, 3, '2019-05-27 17:00:00'),
(1705, 161, 101100, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '70.00', '70.00', 0, 1, '2019-05-27 17:30:00'),
(1706, 161, 101500, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '50.00', '50.00', 0, 1, '2019-05-27 17:30:00'),
(1707, 161, 102000, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 20, NULL, NULL, NULL, '3.50', NULL, NULL, NULL, NULL, '70.00', '70.00', 1, 2, '2019-05-27 17:30:00'),
(1708, 161, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 2, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-05-27 17:30:00'),
(1709, 161, 102600, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.25', NULL, '0.00', '0.00', 0, 4, '2019-05-27 17:30:00'),
(1710, 161, 102800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 40, NULL, NULL, NULL, '1.50', NULL, NULL, NULL, NULL, '60.00', '60.00', 1, 5, '2019-05-27 17:30:00'),
(1711, 161, 1, 'Fish', NULL, NULL, 100, 3, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-05-27 17:30:00'),
(1712, 161, 1, 'Lamb Kari', NULL, NULL, 100, 3, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-05-27 17:30:00'),
(1713, 161, 1, 'Palak Gosh', NULL, NULL, 100, 3, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-05-27 17:30:00'),
(1714, 162, 0, NULL, 100, 200, 100, 1, 90, NULL, 4, 0, 1, '', NULL, NULL, NULL, '4.99', NULL, NULL, NULL, NULL, '', '449.10', NULL, 0, 1, '2019-05-27 19:30:00'),
(1715, 162, 0, NULL, 300, 200, 100, 1, 90, NULL, 2, 0, 1, '', NULL, NULL, NULL, '4.99', NULL, NULL, NULL, NULL, '', '449.10', NULL, 0, 1, '2019-05-27 19:30:00'),
(1716, 162, 1600, NULL, 400, 200, 100, 1, 90, NULL, 2, 0, 1, '', NULL, NULL, NULL, '4.99', NULL, NULL, NULL, NULL, '', '449.10', NULL, 0, 1, '2019-05-27 19:30:00'),
(1717, 162, 1900, NULL, 500, 200, 100, 1, 90, NULL, 2, 0, 1, '', NULL, NULL, NULL, '4.99', NULL, NULL, NULL, NULL, '', '449.10', NULL, 0, 1, '2019-05-27 19:30:00'),
(1718, 162, 0, NULL, 1100, 200, 100, 1, 90, NULL, 0, 2, 0, '', NULL, NULL, NULL, '4.99', NULL, NULL, NULL, NULL, '', '449.10', NULL, 0, 1, '2019-05-27 19:30:00'),
(1719, 162, 0, NULL, 1200, 200, 100, 1, 90, NULL, 0, 0, 0, '', NULL, NULL, NULL, '4.99', NULL, NULL, NULL, NULL, '', '449.10', NULL, 0, 1, '2019-05-27 19:30:00'),
(1720, 162, 3200, NULL, 1300, 200, 100, 1, 90, NULL, NULL, NULL, NULL, '', 8, 0, '0.00', '4.99', NULL, NULL, NULL, NULL, '', '449.10', NULL, 1, 3, '2019-05-27 19:30:00'),
(1721, 162, 101600, NULL, NULL, NULL, 100, 2, NULL, NULL, 2, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '45.00', '70.00', '90.00', NULL, '180.00', '180.00', 0, 1, '2019-05-27 19:30:00'),
(1731, 163, 100900, NULL, NULL, NULL, 100, 2, NULL, 1, 0, 0, 1, 'v.v.Mild', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '35.00', '35.00', 0, 1, '2019-05-27 20:00:00'),
(1732, 163, 101000, NULL, NULL, NULL, 100, 2, NULL, 1, 0, 0, 1, 'v.v.Mild', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '35.00', '35.00', 0, 1, '2019-05-27 20:00:00'),
(1733, 163, 101400, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '25.00', '25.00', 0, 6, '2019-05-27 20:00:00'),
(1734, 163, 101900, NULL, NULL, NULL, 100, 2, NULL, 1, NULL, NULL, NULL, 'v.v.Mild', 25, NULL, NULL, NULL, '2.50', NULL, NULL, NULL, NULL, '62.50', '62.50', 1, 2, '2019-05-27 20:00:00'),
(1735, 163, 102800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 10, NULL, NULL, NULL, '1.50', NULL, NULL, NULL, NULL, '15.00', '15.00', 1, 5, '2019-05-27 20:00:00'),
(1744, 165, 100200, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '30.00', '30.00', 0, 1, '2019-05-28 19:00:00'),
(1745, 165, 100500, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '35.00', '35.00', 0, 1, '2019-05-28 19:00:00'),
(1746, 165, 101800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 25, NULL, NULL, NULL, '2.50', NULL, NULL, NULL, NULL, '62.50', '62.50', 1, 2, '2019-05-28 19:00:00'),
(1747, 165, 102000, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 15, NULL, NULL, NULL, '3.50', NULL, NULL, NULL, NULL, '52.50', '52.50', 1, 2, '2019-05-28 19:00:00'),
(1748, 165, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 2, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-05-28 19:00:00'),
(1749, 165, 102600, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.25', NULL, '0.00', '0.00', 0, 4, '2019-05-28 19:00:00'),
(1750, 166, 1, '2 POT Veal Qurma(75 KG)', NULL, NULL, 100, 3, NULL, NULL, 0, 0, 0, 'in 2 POTS', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-05-28 19:30:00'),
(1751, 166, 1, '3 POT White Rice 9*3)', NULL, NULL, 100, 3, NULL, NULL, 0, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-05-28 19:30:00'),
(1752, 167, 100600, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '40.00', '70.00', '90.00', NULL, '40.00', '40.00', 0, 1, '2019-05-27 17:30:00'),
(1753, 167, 101000, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '70.00', '70.00', 0, 1, '2019-05-27 17:30:00'),
(1754, 168, 100600, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '40.00', '70.00', '90.00', NULL, '40.00', '40.00', 0, 1, '2019-05-28 16:00:00'),
(1762, 164, 100, NULL, 100, 100, 100, 1, 90, NULL, 4, 0, 1, '', NULL, NULL, NULL, '3.99', NULL, NULL, NULL, NULL, '', '359.10', NULL, 0, 1, '2019-05-28 19:00:00'),
(1763, 164, 0, NULL, 200, 100, 100, 1, 90, NULL, 2, 1, 0, '', NULL, NULL, NULL, '3.99', NULL, NULL, NULL, NULL, '', '359.10', NULL, 0, 1, '2019-05-28 19:00:00'),
(1764, 164, 0, NULL, 300, 100, 100, 1, 90, NULL, 2, 1, 0, '', NULL, NULL, NULL, '3.99', NULL, NULL, NULL, NULL, '', '359.10', NULL, 0, 1, '2019-05-28 19:00:00'),
(1765, 164, 1400, NULL, 400, 100, 100, 1, 90, NULL, 2, 0, 1, '', NULL, NULL, NULL, '3.99', NULL, NULL, NULL, NULL, '', '359.10', NULL, 0, 6, '2019-05-28 19:00:00'),
(1766, 164, 0, NULL, 1100, 100, 100, 1, 90, NULL, 2, 1, 0, '', NULL, NULL, NULL, '3.99', NULL, NULL, NULL, NULL, '', '359.10', NULL, 0, 1, '2019-05-28 19:00:00'),
(1767, 164, 0, NULL, 1200, 100, 100, 1, 90, NULL, 2, 1, 0, '', NULL, NULL, NULL, '3.99', NULL, NULL, NULL, NULL, '', '359.10', NULL, 0, 1, '2019-05-28 19:00:00'),
(1768, 164, 3200, NULL, 1300, 100, 100, 1, 90, NULL, NULL, NULL, NULL, '', 8, 0, '0.00', '3.99', NULL, NULL, NULL, NULL, '', '359.10', NULL, 1, 3, '2019-05-28 19:00:00'),
(1769, 164, 1, 'Ch Achari 990 ppl)', NULL, NULL, 100, 3, NULL, NULL, 3, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-05-28 19:00:00'),
(1770, 169, 100300, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '30.00', '30.00', 0, 1, '2019-05-28 17:00:00'),
(1773, 171, 100500, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '105.00', '105.00', 0, 1, '2019-05-30 17:00:00'),
(1774, 172, 400, NULL, 100, 100, 100, 1, 110, NULL, 5, 0, 1, '', NULL, NULL, NULL, '5.99', NULL, NULL, NULL, NULL, '', '658.90', NULL, 0, 1, '2019-05-30 19:30:00'),
(1775, 172, 500, NULL, 200, 100, 100, 1, 110, NULL, 3, 0, 1, '', NULL, NULL, NULL, '5.99', NULL, NULL, NULL, NULL, '', '658.90', NULL, 0, 1, '2019-05-30 19:30:00'),
(1776, 172, 0, NULL, 300, 100, 100, 1, 110, NULL, 3, 0, 0, '', NULL, NULL, NULL, '5.99', NULL, NULL, NULL, NULL, '', '658.90', NULL, 0, 1, '2019-05-30 19:30:00'),
(1777, 172, 1400, NULL, 400, 100, 100, 1, 110, NULL, 3, 0, 0, '', NULL, NULL, NULL, '5.99', NULL, NULL, NULL, NULL, '', '658.90', NULL, 0, 6, '2019-05-30 19:30:00'),
(1778, 172, 0, NULL, 1100, 100, 100, 1, 110, NULL, 0, 2, 1, '', NULL, NULL, NULL, '5.99', NULL, NULL, NULL, NULL, '', '658.90', NULL, 0, 1, '2019-05-30 19:30:00'),
(1779, 172, 0, NULL, 1200, 100, 100, 1, 110, NULL, 0, 0, 0, '', NULL, NULL, NULL, '5.99', NULL, NULL, NULL, NULL, '', '658.90', NULL, 0, 1, '2019-05-30 19:30:00'),
(1780, 172, 0, NULL, 1300, 100, 100, 1, 110, NULL, 0, 0, 0, '', NULL, NULL, NULL, '5.99', NULL, NULL, NULL, NULL, '', '658.90', NULL, 0, 1, '2019-05-30 19:30:00'),
(1782, 174, 101900, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 50, NULL, NULL, NULL, '2.50', NULL, NULL, NULL, NULL, '125.00', '125.00', 1, 2, '2019-05-30 22:00:00'),
(1783, 174, 1, 'Ch Biryani (B/L Leg)', NULL, NULL, 100, 3, NULL, NULL, 2, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-05-30 22:00:00'),
(1784, 174, 1, 'Ch Kari (B/L Leg)', NULL, NULL, 100, 3, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-05-30 22:00:00'),
(1785, 175, 100, NULL, 100, 200, 100, 1, 175, NULL, 8, 1, 0, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '1223.25', NULL, 0, 1, '2019-05-31 19:30:00'),
(1786, 175, 0, NULL, 300, 200, 100, 1, 175, NULL, 4, 1, 0, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '1223.25', NULL, 0, 1, '2019-05-31 19:30:00'),
(1787, 175, 1600, NULL, 400, 200, 100, 1, 175, NULL, 4, 1, 0, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '1223.25', NULL, 0, 1, '2019-05-31 19:30:00'),
(1788, 175, 1900, NULL, 500, 200, 100, 1, 175, NULL, 4, 1, 0, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '1223.25', NULL, 0, 1, '2019-05-31 19:30:00'),
(1789, 175, 0, NULL, 1100, 200, 100, 1, 175, NULL, 0, 4, 0, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '1223.25', NULL, 0, 1, '2019-05-31 19:30:00'),
(1790, 175, 0, NULL, 1200, 200, 100, 1, 175, NULL, 0, 0, 0, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '1223.25', NULL, 0, 1, '2019-05-31 19:30:00'),
(1791, 175, 0, NULL, 1300, 200, 100, 1, 175, NULL, 0, 0, 0, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '1223.25', NULL, 0, 1, '2019-05-31 19:30:00'),
(1792, 176, 101400, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '25.00', '25.00', 0, 6, '2019-05-31 16:00:00'),
(1793, 177, 100, NULL, 100, 300, 100, 1, 40, NULL, 2, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '359.60', NULL, 0, 1, '2019-05-31 19:45:00'),
(1794, 177, 500, NULL, 200, 300, 100, 1, 40, NULL, 1, 0, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '359.60', NULL, 0, 1, '2019-05-31 19:45:00'),
(1795, 177, 1000, NULL, 300, 300, 100, 1, 40, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '359.60', NULL, 0, 1, '2019-05-31 19:45:00'),
(1796, 177, 1200, NULL, 400, 300, 100, 1, 40, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '359.60', NULL, 0, 6, '2019-05-31 19:45:00'),
(1797, 177, 2100, NULL, 600, 300, 100, 1, 40, NULL, NULL, NULL, NULL, '', 80, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '359.60', NULL, 1, 2, '2019-05-31 19:45:00'),
(1798, 177, 2700, NULL, 1100, 300, 100, 1, 40, NULL, 0, 1, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '359.60', NULL, 0, 4, '2019-05-31 19:45:00'),
(1799, 177, 3000, NULL, 1200, 300, 100, 1, 40, NULL, NULL, NULL, NULL, '', 28, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '359.60', NULL, 1, 5, '2019-05-31 19:45:00'),
(1800, 177, 3200, NULL, 1300, 300, 100, 1, 40, NULL, NULL, NULL, NULL, '', 4, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '359.60', NULL, 1, 3, '2019-05-31 19:45:00'),
(1801, 178, 1, '2 POT Ch. Bir( M=17.5 R=7.5) each', NULL, NULL, 100, 3, NULL, NULL, 10, 0, 0, 'small pc chicken', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-05-31 19:00:00'),
(1802, 179, 100000, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, 'littl mild', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '60.00', '60.00', 0, 1, '2019-05-31 17:00:00'),
(1803, 179, 100600, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, 'littl mild', NULL, NULL, NULL, NULL, NULL, '40.00', '70.00', '90.00', NULL, '90.00', '90.00', 0, 1, '2019-05-31 17:00:00'),
(1804, 179, 101800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, 'littl mild', 40, NULL, NULL, NULL, '2.50', NULL, NULL, NULL, NULL, '100.00', '100.00', 1, 2, '2019-05-31 17:00:00'),
(1805, 179, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 1, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-05-31 17:00:00'),
(1806, 180, 100500, NULL, NULL, NULL, 100, 2, NULL, NULL, 8, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '560.00', '560.00', 0, 1, '2019-05-31 18:30:00'),
(1822, 183, 400, NULL, 100, 300, 100, 1, 40, NULL, 2, 0, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '339.60', NULL, 0, 1, '2019-06-01 14:00:00'),
(1823, 183, 500, NULL, 200, 300, 100, 1, 40, NULL, 1, 0, 1, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '339.60', NULL, 0, 1, '2019-06-01 14:00:00'),
(1824, 183, 0, NULL, 300, 300, 100, 1, 40, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '339.60', NULL, 0, 1, '2019-06-01 14:00:00'),
(1825, 183, 1200, NULL, 400, 300, 100, 1, 40, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '339.60', NULL, 0, 6, '2019-06-01 14:00:00'),
(1826, 183, 2300, NULL, 600, 300, 100, 1, 40, NULL, NULL, NULL, NULL, '', 40, 0, '0.00', '8.49', NULL, NULL, NULL, NULL, '', '339.60', NULL, 1, 2, '2019-06-01 14:00:00'),
(1827, 183, 2700, NULL, 1100, 300, 100, 1, 40, NULL, 0, 1, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '339.60', NULL, 0, 4, '2019-06-01 14:00:00'),
(1828, 183, 3000, NULL, 1200, 300, 100, 1, 40, NULL, NULL, NULL, NULL, '', 28, 0, '0.00', '8.49', NULL, NULL, NULL, NULL, '', '339.60', NULL, 1, 5, '2019-06-01 14:00:00'),
(1829, 183, 3200, NULL, 1300, 300, 100, 1, 40, NULL, NULL, NULL, NULL, '', 4, 0, '0.00', '8.49', NULL, NULL, NULL, NULL, '', '339.60', NULL, 1, 3, '2019-06-01 14:00:00'),
(1830, 183, 101710, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, 'or mix vagi', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '25.00', '25.00', 0, 1, '2019-06-01 14:00:00'),
(1833, 185, 200, NULL, 100, 300, 100, 1, 150, NULL, 7, 0, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '1348.50', NULL, 0, 1, '2019-06-01 19:00:00'),
(1834, 185, 700, NULL, 200, 300, 100, 1, 150, NULL, 4, 0, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '1348.50', NULL, 0, 1, '2019-06-01 19:00:00'),
(1835, 185, 1000, NULL, 300, 300, 100, 1, 150, NULL, 4, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '1348.50', NULL, 0, 1, '2019-06-01 19:00:00'),
(1836, 185, 1200, NULL, 400, 300, 100, 1, 150, NULL, 4, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '1348.50', NULL, 0, 6, '2019-06-01 19:00:00'),
(1837, 185, 2100, NULL, 600, 300, 100, 1, 150, NULL, NULL, NULL, NULL, '', 300, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '1348.50', NULL, 1, 2, '2019-06-01 19:00:00'),
(1838, 185, 2700, NULL, 1100, 300, 100, 1, 150, NULL, 0, 3, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '1348.50', NULL, 0, 4, '2019-06-01 19:00:00'),
(1839, 185, 3000, NULL, 1200, 300, 100, 1, 150, NULL, NULL, NULL, NULL, '', 105, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '1348.50', NULL, 1, 5, '2019-06-01 19:00:00'),
(1840, 185, 3200, NULL, 1300, 300, 100, 1, 150, NULL, NULL, NULL, NULL, '', 12, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '1348.50', NULL, 1, 3, '2019-06-01 19:00:00'),
(1853, 187, 100600, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '40.00', '70.00', '90.00', NULL, '90.00', '90.00', 0, 1, '2019-06-01 19:00:00'),
(1854, 187, 101400, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '25.00', '25.00', 0, 6, '2019-06-01 19:00:00'),
(1855, 187, 101800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 20, NULL, NULL, NULL, '2.50', NULL, NULL, NULL, NULL, '50.00', '50.00', 1, 2, '2019-06-01 19:00:00'),
(1856, 187, 101900, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 20, NULL, NULL, NULL, '2.50', NULL, NULL, NULL, NULL, '50.00', '50.00', 1, 2, '2019-06-01 19:00:00'),
(1857, 187, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 1, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-06-01 19:00:00'),
(1858, 187, 102800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 25, NULL, NULL, NULL, '1.50', NULL, NULL, NULL, NULL, '37.50', '37.50', 1, 5, '2019-06-01 19:00:00'),
(1863, 190, 400, NULL, 100, 300, 100, 1, 110, NULL, 5, 0, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '988.90', NULL, 0, 1, '2019-06-02 19:15:00'),
(1864, 190, 500, NULL, 200, 300, 100, 1, 110, NULL, 3, 0, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '988.90', NULL, 0, 1, '2019-06-02 19:15:00'),
(1865, 190, 900, NULL, 300, 300, 100, 1, 110, NULL, 3, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '988.90', NULL, 0, 1, '2019-06-02 19:15:00'),
(1866, 190, 1500, NULL, 400, 300, 100, 1, 110, NULL, 3, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '988.90', NULL, 0, 6, '2019-06-02 19:15:00'),
(1867, 190, 2300, NULL, 600, 300, 100, 1, 110, NULL, NULL, NULL, NULL, '', 110, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '988.90', NULL, 1, 2, '2019-06-02 19:15:00'),
(1868, 190, 2700, NULL, 1100, 300, 100, 1, 110, NULL, 0, 2, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '988.90', NULL, 0, 4, '2019-06-02 19:15:00'),
(1869, 190, 3000, NULL, 1200, 300, 100, 1, 110, NULL, NULL, NULL, NULL, '', 77, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '988.90', NULL, 1, 5, '2019-06-02 19:15:00'),
(1870, 190, 3200, NULL, 1300, 300, 100, 1, 110, NULL, NULL, NULL, NULL, '', 10, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '988.90', NULL, 1, 3, '2019-06-02 19:15:00'),
(1871, 189, 101800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 200, NULL, NULL, NULL, '2.50', NULL, NULL, NULL, NULL, '500.00', '500.00', 1, 2, '2019-06-02 19:00:00'),
(1872, 188, 101500, NULL, NULL, NULL, 100, 2, NULL, NULL, 6, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '300.00', '300.00', 0, 1, '2019-06-02 18:30:00'),
(1873, 188, 101800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 250, NULL, NULL, NULL, '2.50', NULL, NULL, NULL, NULL, '625.00', '625.00', 1, 2, '2019-06-02 18:30:00'),
(1874, 188, 1, '3 POT  (V . Puloa M=9 R=9', NULL, NULL, 100, 3, NULL, NULL, 20, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-06-02 18:30:00'),
(1882, 192, 200, NULL, 100, 400, 100, 1, 25, NULL, 1, 0, 1, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '249.75', NULL, 0, 1, '2019-06-02 19:00:00'),
(1883, 192, 1000, NULL, 300, 400, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '249.75', NULL, 0, 1, '2019-06-02 19:00:00'),
(1884, 192, 1200, NULL, 400, 400, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '249.75', NULL, 0, 6, '2019-06-02 19:00:00'),
(1885, 192, 1800, NULL, 500, 400, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '249.75', NULL, 0, 1, '2019-06-02 19:00:00'),
(1886, 192, 2200, NULL, 600, 400, 100, 1, 25, NULL, NULL, NULL, NULL, '', 25, 0, '0.00', '9.99', NULL, NULL, NULL, NULL, '', '249.75', NULL, 1, 2, '2019-06-02 19:00:00'),
(1887, 192, 2700, NULL, 1100, 400, 100, 1, 25, NULL, 0, 0, 1, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '249.75', NULL, 0, 4, '2019-06-02 19:00:00'),
(1888, 192, 3000, NULL, 1200, 400, 100, 1, 25, NULL, NULL, NULL, NULL, '', 25, 7, '10.50', '9.99', NULL, NULL, NULL, NULL, '', '249.75', NULL, 1, 5, '2019-06-02 19:00:00'),
(1889, 192, 3200, NULL, 1300, 400, 100, 1, 25, NULL, NULL, NULL, NULL, '', 2, 0, '0.00', '9.99', NULL, NULL, NULL, NULL, '', '249.75', NULL, 1, 3, '2019-06-02 19:00:00'),
(1897, 195, 101400, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 2, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '50.00', '50.00', 0, 6, '2019-06-02 19:00:00'),
(1908, 170, 100200, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '30.00', '30.00', 0, 1, '2019-05-30 16:00:00'),
(1909, 170, 101800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 20, NULL, NULL, NULL, '2.50', NULL, NULL, NULL, NULL, '50.00', '50.00', 1, 2, '2019-05-30 16:00:00'),
(1910, 198, 101400, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 2, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '100.00', '100.00', 0, 6, '2019-06-03 15:00:00'),
(1919, 200, 100200, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '30.00', '30.00', 0, 1, '2019-06-03 18:30:00'),
(1920, 200, 101400, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '50.00', '50.00', 0, 6, '2019-06-03 18:30:00'),
(1921, 201, 100300, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '60.00', '60.00', 0, 1, '2019-06-03 18:00:00'),
(1922, 201, 101400, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 1, 0, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '40.00', '40.00', 0, 6, '2019-06-03 18:00:00'),
(1923, 201, 101710, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '25.00', '25.00', 0, 1, '2019-06-03 18:00:00'),
(1924, 201, 102000, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 15, NULL, NULL, NULL, '3.50', NULL, NULL, NULL, NULL, '52.50', '52.50', 1, 2, '2019-06-03 18:00:00'),
(1929, 203, 100600, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, 'no Garnish ', NULL, NULL, NULL, NULL, NULL, '40.00', '70.00', '90.00', NULL, '90.00', '90.00', 0, 1, '2019-06-03 16:00:00'),
(1930, 204, 100800, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '70.00', '70.00', 0, 1, '2019-06-03 19:00:00'),
(1931, 204, 101900, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 60, NULL, NULL, NULL, '2.50', NULL, NULL, NULL, NULL, '150.00', '150.00', 1, 2, '2019-06-03 19:00:00'),
(1940, 206, 100600, NULL, NULL, NULL, 100, 2, NULL, NULL, 2, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '40.00', '70.00', '90.00', NULL, '180.00', '180.00', 0, 1, '2019-06-03 16:00:00'),
(1941, 206, 101100, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '70.00', '70.00', 0, 1, '2019-06-03 16:00:00'),
(1942, 206, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 2, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-06-03 16:00:00'),
(1943, 207, 100300, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '30.00', '30.00', 0, 1, '2019-06-03 19:00:00'),
(1944, 207, 100500, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '70.00', '70.00', 0, 1, '2019-06-03 19:00:00'),
(1945, 207, 101000, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '35.00', '35.00', 0, 1, '2019-06-03 19:00:00'),
(1946, 207, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 1, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-06-03 19:00:00'),
(1951, 208, 100400, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '60.00', '60.00', 0, 1, '2019-06-03 20:00:00'),
(1952, 208, 100600, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '40.00', '70.00', '90.00', NULL, '90.00', '90.00', 0, 1, '2019-06-03 20:00:00'),
(1953, 208, 101400, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '25.00', '25.00', 0, 6, '2019-06-03 20:00:00'),
(1954, 208, 102200, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 15, NULL, NULL, NULL, '7.50', NULL, NULL, NULL, NULL, '112.50', '112.50', 1, 2, '2019-06-03 20:00:00'),
(1955, 208, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 2, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-06-03 20:00:00'),
(1956, 209, 100600, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, 'Less Oil', NULL, NULL, NULL, NULL, NULL, '40.00', '70.00', '90.00', NULL, '40.00', '40.00', 0, 1, '2019-06-03 16:00:00'),
(1957, 210, 100700, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '40.00', '50.00', '80.00', NULL, '80.00', '80.00', 0, 1, '2019-06-01 18:00:00'),
(1958, 210, 101100, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '70.00', '70.00', 0, 1, '2019-06-01 18:00:00'),
(1970, 213, 100600, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '40.00', '70.00', '90.00', NULL, '90.00', '90.00', 0, 1, '2019-05-30 15:00:00'),
(1971, 213, 101000, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '70.00', '70.00', 0, 1, '2019-05-30 15:00:00'),
(1972, 213, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 2, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-05-30 15:00:00'),
(1973, 213, 102800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '4 cut', 20, NULL, NULL, NULL, '1.50', NULL, NULL, NULL, NULL, '30.00', '30.00', 1, 5, '2019-05-30 15:00:00'),
(1974, 173, 100500, NULL, NULL, NULL, 100, 2, NULL, NULL, 5, 0, 0, 'for 400 PPL', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '350.00', '350.00', 0, 1, '2019-05-30 19:30:00'),
(1975, 202, 101300, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '50.00', '50.00', 0, 6, '2019-06-03 18:00:00'),
(1976, 202, 101400, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '50.00', '50.00', 0, 6, '2019-06-03 18:00:00'),
(1977, 202, 101800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 100, NULL, NULL, NULL, '2.50', NULL, NULL, NULL, NULL, '250.00', '250.00', 1, 2, '2019-06-03 18:00:00'),
(1998, 196, 100500, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '35.00', '35.00', 0, 1, '2019-06-02 17:00:00'),
(1999, 196, 102300, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 6, NULL, NULL, NULL, '7.50', NULL, NULL, NULL, NULL, '45.00', '45.00', 1, 2, '2019-06-02 17:00:00'),
(2000, 196, 1, 'Whole Ch Qurma', NULL, NULL, 100, 3, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-06-02 17:00:00'),
(2004, 216, 100600, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, 'NO Garnish on Top', NULL, NULL, NULL, NULL, NULL, '40.00', '70.00', '90.00', NULL, '90.00', '90.00', 0, 1, '2019-06-03 16:00:00'),
(2005, 181, 100300, NULL, NULL, NULL, 100, 2, NULL, NULL, 2, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '120.00', '120.00', 0, 1, '2019-06-01 15:00:00'),
(2006, 181, 100900, NULL, NULL, NULL, 100, 2, NULL, NULL, 2, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '140.00', '140.00', 0, 1, '2019-06-01 15:00:00'),
(2007, 181, 101400, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 2, 0, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '80.00', '80.00', 0, 6, '2019-06-01 15:00:00'),
(2008, 181, 101710, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 2, 0, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '80.00', '80.00', 0, 1, '2019-06-01 15:00:00'),
(2009, 181, 102000, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, 'pack 40+40', 27, NULL, NULL, NULL, '3.50', NULL, NULL, NULL, NULL, '94.50', '94.50', 1, 2, '2019-06-01 15:00:00'),
(2010, 181, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 3, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-06-01 15:00:00'),
(2011, 181, 102600, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 2, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.25', NULL, '0.00', '0.00', 0, 4, '2019-06-01 15:00:00'),
(2012, 186, 101600, NULL, NULL, NULL, 100, 2, NULL, 2, 7, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '45.00', '70.00', '90.00', NULL, '630.00', '630.00', 0, 1, '2019-06-01 19:00:00'),
(2013, 186, 101800, NULL, NULL, NULL, 100, 2, NULL, 2, NULL, NULL, NULL, '', 270, NULL, NULL, NULL, '2.50', NULL, NULL, NULL, NULL, '675.00', '675.00', 1, 2, '2019-06-01 19:00:00'),
(2014, 186, 102000, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, 'Mild', 166, NULL, NULL, NULL, '3.50', NULL, NULL, NULL, NULL, '581.00', '581.00', 1, 2, '2019-06-01 19:00:00'),
(2015, 186, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, 'cuecumber onion', 20, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-06-01 19:00:00'),
(2016, 186, 102700, NULL, NULL, NULL, 100, 2, NULL, NULL, 3, 0, 0, '2 bin', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 4, '2019-06-01 19:00:00'),
(2017, 186, 1, 'Puloa Rice (7.5*4)', NULL, NULL, 100, 3, NULL, 2, 20, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-06-01 19:00:00'),
(2021, 211, 100000, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '60.00', '60.00', 0, 1, '2019-06-03 18:00:00'),
(2022, 211, 100600, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '40.00', '70.00', '90.00', NULL, '90.00', '90.00', 0, 1, '2019-06-03 18:00:00'),
(2023, 211, 101400, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '50.00', '50.00', 0, 6, '2019-06-03 18:00:00'),
(2024, 217, 100600, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '40.00', '70.00', '90.00', NULL, '40.00', '40.00', 0, 1, '2019-06-03 17:00:00'),
(2025, 184, 100400, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '30.00', '30.00', 0, 1, '2019-06-01 15:00:00'),
(2026, 184, 101400, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '25.00', '25.00', 0, 6, '2019-06-01 15:00:00'),
(2027, 184, 101800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, 'mild', 27, NULL, NULL, NULL, '2.50', NULL, NULL, NULL, NULL, '67.50', '67.50', 1, 2, '2019-06-01 15:00:00'),
(2028, 218, 100500, NULL, NULL, NULL, 100, 2, NULL, NULL, 2, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '140.00', '140.00', 0, 1, '2019-06-03 17:00:00'),
(2037, 182, 100, NULL, 100, 200, 100, 1, 30, NULL, 1, 0, 1, 'pack half half', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '254.70', NULL, 0, 1, '2019-06-01 13:30:00'),
(2038, 182, 1100, NULL, 300, 200, 100, 1, 30, NULL, 1, 0, 0, 'pack half half', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '254.70', NULL, 0, 1, '2019-06-01 13:30:00'),
(2039, 182, 1200, NULL, 400, 200, 100, 1, 30, NULL, 1, 0, 0, 'pack half half', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '254.70', NULL, 0, 6, '2019-06-01 13:30:00'),
(2040, 182, 1900, NULL, 500, 200, 100, 1, 30, NULL, 1, 0, 0, 'pack half half', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '254.70', NULL, 0, 1, '2019-06-01 13:30:00'),
(2041, 182, 2700, NULL, 1100, 200, 100, 1, 30, NULL, 0, 0, 1, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '254.70', NULL, 0, 4, '2019-06-01 13:30:00'),
(2042, 182, 3000, NULL, 1200, 200, 100, 1, 30, NULL, NULL, NULL, NULL, 'pack half half', 21, 0, '0.00', '8.49', NULL, NULL, NULL, NULL, '', '254.70', NULL, 1, 5, '2019-06-01 13:30:00'),
(2043, 182, 3200, NULL, 1300, 200, 100, 1, 30, NULL, NULL, NULL, NULL, '', 4, 0, '0.00', '8.49', NULL, NULL, NULL, NULL, '', '254.70', NULL, 1, 3, '2019-06-01 13:30:00'),
(2044, 182, 100900, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, 'for 30 PPL pack half half', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '70.00', '70.00', 0, 1, '2019-06-01 13:30:00'),
(2045, 197, 400, NULL, 100, 100, 100, 1, 45, NULL, 2, 0, 1, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '337.05', NULL, 0, 1, '2019-06-02 19:00:00'),
(2046, 197, 700, NULL, 200, 100, 100, 1, 45, NULL, 1, 0, 1, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '337.05', NULL, 0, 1, '2019-06-02 19:00:00'),
(2047, 197, 1000, NULL, 300, 100, 100, 1, 45, NULL, 1, 0, 1, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '337.05', NULL, 0, 1, '2019-06-02 19:00:00'),
(2048, 197, 1200, NULL, 400, 100, 100, 1, 45, NULL, 1, 0, 1, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '337.05', NULL, 0, 6, '2019-06-02 19:00:00'),
(2049, 197, 2700, NULL, 1100, 100, 100, 1, 45, NULL, 0, 1, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '337.05', NULL, 0, 4, '2019-06-02 19:00:00'),
(2050, 197, 3000, NULL, 1200, 100, 100, 1, 45, NULL, NULL, NULL, NULL, '', 42, 10, '15.00', '7.49', NULL, NULL, NULL, NULL, '', '337.05', NULL, 1, 5, '2019-06-02 19:00:00'),
(2051, 197, 3200, NULL, 1300, 100, 100, 1, 45, NULL, NULL, NULL, NULL, '', 4, 0, '0.00', '7.49', NULL, NULL, NULL, NULL, '', '337.05', NULL, 1, 3, '2019-06-02 19:00:00'),
(2052, 219, 300, NULL, 100, 200, 100, 1, 25, NULL, 1, 0, 1, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '187.25', NULL, 0, 1, '2019-06-01 16:00:00'),
(2053, 219, 0, NULL, 300, 200, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '187.25', NULL, 0, 1, '2019-06-01 16:00:00'),
(2054, 219, 0, NULL, 400, 200, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '187.25', NULL, 0, 1, '2019-06-01 16:00:00'),
(2055, 219, 1700, NULL, 500, 200, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '187.25', NULL, 0, 1, '2019-06-01 16:00:00'),
(2056, 219, 2700, NULL, 1100, 200, 100, 1, 25, NULL, 0, 0, 1, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '187.25', NULL, 0, 4, '2019-06-01 16:00:00'),
(2057, 219, 3000, NULL, 1200, 200, 100, 1, 25, NULL, NULL, NULL, NULL, '', 18, 0, '0.00', '7.49', NULL, NULL, NULL, NULL, '', '187.25', NULL, 1, 5, '2019-06-01 16:00:00'),
(2058, 219, 3200, NULL, 1300, 200, 100, 1, 25, NULL, NULL, NULL, NULL, '', 2, 0, '0.00', '7.49', NULL, NULL, NULL, NULL, '', '187.25', NULL, 1, 3, '2019-06-01 16:00:00'),
(2059, 219, 100500, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, 'for 25 ppl', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '70.00', '70.00', 0, 1, '2019-06-01 16:00:00'),
(2063, 220, 101000, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '105.00', '105.00', 0, 1, '2019-06-01 18:00:00'),
(2064, 220, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 1, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-06-01 18:00:00'),
(2065, 215, 400, NULL, 100, 500, 200, 1, 35, NULL, 1, 1, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '297.15', NULL, 0, 1, '2019-06-01 19:45:00'),
(2066, 215, 0, NULL, 200, 500, 200, 1, 35, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '297.15', NULL, 0, 1, '2019-06-01 19:45:00'),
(2067, 215, 1000, NULL, 300, 500, 200, 1, 35, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '297.15', NULL, 0, 1, '2019-06-01 19:45:00'),
(2068, 215, 1200, NULL, 400, 500, 200, 1, 35, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '297.15', NULL, 0, 6, '2019-06-01 19:45:00'),
(2069, 215, 2100, NULL, 600, 500, 200, 1, 35, NULL, NULL, NULL, NULL, '', 70, 0, '0.00', '8.49', NULL, NULL, NULL, NULL, '', '297.15', NULL, 1, 2, '2019-06-01 19:45:00'),
(2070, 215, 2500, NULL, 900, 500, 200, 1, 35, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '297.15', NULL, 0, 1, '2019-06-01 19:45:00'),
(2071, 215, 2700, NULL, 1100, 500, 200, 1, 35, NULL, 0, 1, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '297.15', NULL, 0, 4, '2019-06-01 19:45:00'),
(2072, 215, 3000, NULL, 1200, 500, 200, 1, 35, NULL, NULL, NULL, NULL, '', 35, 10, '15.00', '8.49', NULL, NULL, NULL, NULL, '', '297.15', NULL, 1, 5, '2019-06-01 19:45:00'),
(2073, 215, 3200, NULL, 1300, 500, 200, 1, 35, NULL, NULL, NULL, NULL, '', 4, 0, '0.00', '8.49', NULL, NULL, NULL, NULL, '', '297.15', NULL, 1, 3, '2019-06-01 19:45:00'),
(2074, 221, 0, NULL, 100, 100, 100, 1, 35, NULL, 1, 1, 0, '', NULL, NULL, NULL, '3.49', NULL, NULL, NULL, NULL, '', '122.15', NULL, 0, 1, '2019-06-01 15:00:00'),
(2075, 221, 500, NULL, 200, 100, 100, 1, 35, NULL, 1, 0, 0, '', NULL, NULL, NULL, '3.49', NULL, NULL, NULL, NULL, '', '122.15', NULL, 0, 1, '2019-06-01 15:00:00'),
(2076, 221, 0, NULL, 300, 100, 100, 1, 35, NULL, 1, 0, 0, '', NULL, NULL, NULL, '3.49', NULL, NULL, NULL, NULL, '', '122.15', NULL, 0, 1, '2019-06-01 15:00:00'),
(2077, 221, 0, NULL, 400, 100, 100, 1, 35, NULL, 1, 0, 0, '', NULL, NULL, NULL, '3.49', NULL, NULL, NULL, NULL, '', '122.15', NULL, 0, 1, '2019-06-01 15:00:00'),
(2078, 221, 0, NULL, 1100, 100, 100, 1, 35, NULL, 0, 1, 0, '', NULL, NULL, NULL, '3.49', NULL, NULL, NULL, NULL, '', '122.15', NULL, 0, 1, '2019-06-01 15:00:00'),
(2079, 221, 0, NULL, 1200, 100, 100, 1, 35, NULL, 0, 0, 0, '', NULL, NULL, NULL, '3.49', NULL, NULL, NULL, NULL, '', '122.15', NULL, 0, 1, '2019-06-01 15:00:00'),
(2080, 221, 0, NULL, 1300, 100, 100, 1, 35, NULL, 0, 0, 0, '', NULL, NULL, NULL, '3.49', NULL, NULL, NULL, NULL, '', '122.15', NULL, 0, 1, '2019-06-01 15:00:00'),
(2081, 222, 100300, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '60.00', '60.00', 0, 1, '2019-06-02 16:00:00'),
(2082, 222, 101800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 25, NULL, NULL, NULL, '2.50', NULL, NULL, NULL, NULL, '62.50', '62.50', 1, 2, '2019-06-02 16:00:00'),
(2083, 222, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 2, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-06-02 16:00:00'),
(2085, 212, 400, NULL, 100, 300, 100, 1, 25, NULL, 1, 0, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 0, 1, '2019-06-03 19:30:00'),
(2086, 212, 700, NULL, 200, 300, 100, 1, 25, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 0, 1, '2019-06-03 19:30:00'),
(2087, 212, 1000, NULL, 300, 300, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 0, 1, '2019-06-03 19:30:00'),
(2088, 212, 1200, NULL, 400, 300, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 0, 6, '2019-06-03 19:30:00'),
(2089, 212, 2100, NULL, 600, 300, 100, 1, 25, NULL, NULL, NULL, NULL, '', 50, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 1, 2, '2019-06-03 19:30:00'),
(2090, 212, 2700, NULL, 1100, 300, 100, 1, 25, NULL, 0, 0, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 0, 4, '2019-06-03 19:30:00'),
(2091, 212, 3000, NULL, 1200, 300, 100, 1, 25, NULL, NULL, NULL, NULL, '', 18, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 1, 5, '2019-06-03 19:30:00'),
(2092, 212, 3200, NULL, 1300, 300, 100, 1, 25, NULL, NULL, NULL, NULL, '', 2, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 1, 3, '2019-06-03 19:30:00'),
(2093, 212, 101800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 25, NULL, NULL, NULL, '2.50', NULL, NULL, NULL, NULL, '62.50', '62.50', 1, 2, '2019-06-03 19:30:00'),
(2094, 224, 100900, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, 'Extra meat', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '35.00', '35.00', 0, 1, '2019-06-03 15:00:00'),
(2095, 225, 100500, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '35.00', '35.00', 0, 1, '2019-06-03 15:30:00'),
(2096, 225, 102800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 12, NULL, NULL, NULL, '1.50', NULL, NULL, NULL, NULL, '18.00', '18.00', 1, 5, '2019-06-03 15:30:00'),
(2097, 226, 100600, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '40.00', '70.00', '90.00', NULL, '40.00', '40.00', 0, 1, '2019-06-01 16:00:00'),
(2098, 226, 100700, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '40.00', '50.00', '80.00', NULL, '40.00', '40.00', 0, 1, '2019-06-01 16:00:00'),
(2107, 227, 100400, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '60.00', '60.00', 0, 1, '2019-06-01 19:00:00'),
(2108, 227, 100500, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 1, 0, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '50.00', '50.00', 0, 1, '2019-06-01 19:00:00'),
(2109, 227, 101500, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '25.00', '25.00', 0, 1, '2019-06-01 19:00:00'),
(2110, 227, 102800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 6, NULL, NULL, NULL, '1.50', NULL, NULL, NULL, NULL, '9.00', '9.00', 1, 5, '2019-06-01 19:00:00'),
(2111, 228, 101800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 20, NULL, NULL, NULL, '2.50', NULL, NULL, NULL, NULL, '50.00', '50.00', 1, 2, '2019-06-02 19:30:00'),
(2112, 228, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 2, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-06-02 19:30:00'),
(2113, 228, 102800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 20, NULL, NULL, NULL, '1.50', NULL, NULL, NULL, NULL, '30.00', '30.00', 1, 5, '2019-06-02 19:30:00'),
(2114, 229, 100600, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '40.00', '70.00', '90.00', NULL, '40.00', '40.00', 0, 1, '2019-06-01 19:00:00'),
(2119, 193, 101500, NULL, NULL, NULL, 100, 2, NULL, NULL, 6, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '300.00', '300.00', 0, 1, '2019-06-02 19:15:00'),
(2120, 193, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 20, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-06-02 19:15:00'),
(2121, 193, 1, '4 POT Ch. Bir M=12.5  R=7.5', NULL, NULL, 100, 3, NULL, NULL, 0, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-06-02 19:15:00'),
(2138, 194, 100200, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '30.00', '30.00', 0, 1, '2019-06-02 19:30:00'),
(2139, 194, 100300, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '60.00', '60.00', 0, 1, '2019-06-02 19:30:00'),
(2140, 194, 100500, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 1, 'more quantity', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '105.00', '105.00', 0, 1, '2019-06-02 19:30:00'),
(2141, 194, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 1, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-06-02 19:30:00'),
(2142, 191, 100, NULL, 100, 200, 100, 1, 150, NULL, 7, 0, 1, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '1048.50', NULL, 0, 1, '2019-06-02 19:30:00'),
(2143, 191, 0, NULL, 300, 200, 100, 1, 150, NULL, 4, 0, 0, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '1048.50', NULL, 0, 1, '2019-06-02 19:30:00'),
(2144, 191, 1200, NULL, 400, 200, 100, 1, 150, NULL, 4, 0, 0, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '1048.50', NULL, 0, 6, '2019-06-02 19:30:00'),
(2145, 191, 1900, NULL, 500, 200, 100, 1, 150, NULL, 4, 0, 0, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '1048.50', NULL, 0, 1, '2019-06-02 19:30:00'),
(2146, 191, 0, NULL, 1100, 200, 100, 1, 150, NULL, 0, 3, 1, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '1048.50', NULL, 0, 1, '2019-06-02 19:30:00'),
(2147, 191, 0, NULL, 1200, 200, 100, 1, 150, NULL, 0, 0, 0, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '1048.50', NULL, 0, 1, '2019-06-02 19:30:00'),
(2148, 191, 3200, NULL, 1300, 200, 100, 1, 150, NULL, NULL, NULL, NULL, '', 12, 0, '0.00', '6.99', NULL, NULL, NULL, NULL, '', '1048.50', NULL, 1, 3, '2019-06-02 19:30:00'),
(2149, 191, 1, 'Ch. Kari 150 PPL M=18.75', NULL, NULL, 100, 3, NULL, NULL, 4, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-06-02 19:30:00'),
(2150, 230, 1, '2 POT Qeema Aloo Biryani  R=6*2)', NULL, NULL, 100, 3, NULL, 2, 8, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-06-02 19:00:00'),
(2151, 231, 100900, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 1, 0, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '50.00', '50.00', 0, 1, '2019-06-03 16:00:00'),
(2152, 231, 101100, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 1, 0, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '50.00', '50.00', 0, 1, '2019-06-03 16:00:00'),
(2153, 223, 100500, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '35.00', '35.00', 0, 1, '2019-06-03 16:00:00'),
(2154, 199, 0, NULL, 100, 100, 100, 1, 110, NULL, 5, 0, 1, '', NULL, NULL, NULL, '3.99', NULL, NULL, NULL, NULL, '', '438.90', NULL, 0, 1, '2019-06-03 19:30:00'),
(2155, 199, 600, NULL, 200, 100, 100, 1, 110, NULL, 3, 0, 1, '', NULL, NULL, NULL, '3.99', NULL, NULL, NULL, NULL, '', '438.90', NULL, 0, 1, '2019-06-03 19:30:00'),
(2156, 199, 0, NULL, 300, 100, 100, 1, 110, NULL, 5, 0, 1, '', NULL, NULL, NULL, '3.99', NULL, NULL, NULL, NULL, '', '438.90', NULL, 0, 1, '2019-06-03 19:30:00'),
(2157, 199, 1200, NULL, 400, 100, 100, 1, 110, NULL, 3, 0, 0, '', NULL, NULL, NULL, '3.99', NULL, NULL, NULL, NULL, '', '438.90', NULL, 0, 6, '2019-06-03 19:30:00'),
(2158, 199, 0, NULL, 1100, 100, 100, 1, 110, NULL, 5, 0, 1, '', NULL, NULL, NULL, '3.99', NULL, NULL, NULL, NULL, '', '438.90', NULL, 0, 1, '2019-06-03 19:30:00'),
(2159, 199, 0, NULL, 1200, 100, 100, 1, 110, NULL, 5, 0, 1, '', NULL, NULL, NULL, '3.99', NULL, NULL, NULL, NULL, '', '438.90', NULL, 0, 1, '2019-06-03 19:30:00'),
(2160, 199, 0, NULL, 1300, 100, 100, 1, 110, NULL, 5, 0, 1, '', NULL, NULL, NULL, '3.99', NULL, NULL, NULL, NULL, '', '438.90', NULL, 0, 1, '2019-06-03 19:30:00'),
(2161, 199, 101600, NULL, NULL, NULL, 100, 2, NULL, NULL, 3, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '45.00', '70.00', '90.00', NULL, '270.00', '270.00', 0, 1, '2019-06-03 19:30:00'),
(2162, 232, 0, NULL, 100, 200, 100, 1, 100, NULL, 5, 0, 0, '', NULL, NULL, NULL, '4.99', NULL, NULL, NULL, NULL, '', '499.00', NULL, 0, 1, '2019-06-03 19:00:00'),
(2163, 232, 0, NULL, 300, 200, 100, 1, 100, NULL, 2, 1, 0, '', NULL, NULL, NULL, '4.99', NULL, NULL, NULL, NULL, '', '499.00', NULL, 0, 1, '2019-06-03 19:00:00'),
(2164, 232, 1600, NULL, 400, 200, 100, 1, 100, NULL, 2, 1, 0, '', NULL, NULL, NULL, '4.99', NULL, NULL, NULL, NULL, '', '499.00', NULL, 0, 1, '2019-06-03 19:00:00'),
(2165, 232, 1900, NULL, 500, 200, 100, 1, 100, NULL, 2, 1, 0, '', NULL, NULL, NULL, '4.99', NULL, NULL, NULL, NULL, '', '499.00', NULL, 0, 1, '2019-06-03 19:00:00'),
(2166, 232, 2700, NULL, 1100, 200, 100, 1, 100, NULL, 0, 2, 1, '', NULL, NULL, NULL, '4.99', NULL, NULL, NULL, NULL, '', '499.00', NULL, 0, 4, '2019-06-03 19:00:00'),
(2167, 232, 0, NULL, 1200, 200, 100, 1, 100, NULL, 0, 0, 0, '', NULL, NULL, NULL, '4.99', NULL, NULL, NULL, NULL, '', '499.00', NULL, 0, 1, '2019-06-03 19:00:00'),
(2168, 232, 0, NULL, 1300, 200, 100, 1, 100, NULL, 0, 0, 0, '', NULL, NULL, NULL, '4.99', NULL, NULL, NULL, NULL, '', '499.00', NULL, 0, 1, '2019-06-03 19:00:00'),
(2169, 205, 300, NULL, 100, 300, 100, 1, 30, NULL, 1, 0, 1, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '254.70', NULL, 0, 1, '2019-06-03 19:30:00'),
(2170, 205, 800, NULL, 200, 300, 100, 1, 30, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '254.70', NULL, 0, 1, '2019-06-03 19:30:00'),
(2171, 205, 1100, NULL, 300, 300, 100, 1, 30, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '254.70', NULL, 0, 1, '2019-06-03 19:30:00'),
(2172, 205, 1600, NULL, 400, 300, 100, 1, 30, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '254.70', NULL, 0, 1, '2019-06-03 19:30:00'),
(2173, 205, 2300, NULL, 600, 300, 100, 1, 30, NULL, NULL, NULL, NULL, '', 39, 9, '22.50', '8.49', NULL, NULL, NULL, NULL, '', '254.70', NULL, 1, 2, '2019-06-03 19:30:00');
INSERT INTO `order_items` (`id`, `order_id`, `item`, `custom`, `category`, `package`, `main`, `type`, `persons`, `spice`, `tray_lg`, `tray_md`, `tray_sm`, `description`, `qty`, `extra_qty`, `extra_price`, `pkgprice`, `ctmprice`, `sm_price`, `md_price`, `lg_price`, `pkgcmt`, `total`, `d_total`, `pp`, `list`, `delivery_time`) VALUES
(2174, 205, 2700, NULL, 1100, 300, 100, 1, 30, NULL, 0, 0, 1, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '254.70', NULL, 0, 4, '2019-06-03 19:30:00'),
(2175, 205, 3100, NULL, 1200, 300, 100, 1, 30, NULL, NULL, NULL, NULL, 'Dont Warm', 30, 0, '0.00', '8.49', NULL, NULL, NULL, NULL, '', '254.70', NULL, 1, 5, '2019-06-03 19:30:00'),
(2176, 205, 3200, NULL, 1300, 300, 100, 1, 30, NULL, NULL, NULL, NULL, '', 4, 0, '0.00', '8.49', NULL, NULL, NULL, NULL, '', '254.70', NULL, 1, 3, '2019-06-03 19:30:00'),
(2177, 233, 100, NULL, 100, 400, 100, 1, 25, NULL, 1, 0, 1, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '249.75', NULL, 0, 1, '2019-06-06 17:00:00'),
(2178, 233, 1000, NULL, 300, 400, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '249.75', NULL, 0, 1, '2019-06-06 17:00:00'),
(2179, 233, 1300, NULL, 400, 400, 100, 1, 25, NULL, NULL, NULL, NULL, '', 50, 0, '0.00', '9.99', NULL, NULL, NULL, NULL, '', '249.75', NULL, 1, 6, '2019-06-06 17:00:00'),
(2180, 233, 1700, NULL, 500, 400, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '249.75', NULL, 0, 1, '2019-06-06 17:00:00'),
(2181, 233, 2200, NULL, 600, 400, 100, 1, 25, NULL, NULL, NULL, NULL, '', 25, 0, '0.00', '9.99', NULL, NULL, NULL, NULL, '', '249.75', NULL, 1, 2, '2019-06-06 17:00:00'),
(2182, 233, 2700, NULL, 1100, 400, 100, 1, 25, NULL, 0, 0, 1, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '249.75', NULL, 0, 4, '2019-06-06 17:00:00'),
(2183, 233, 3000, NULL, 1200, 400, 100, 1, 25, NULL, NULL, NULL, NULL, '', 18, 0, '0.00', '9.99', NULL, NULL, NULL, NULL, '', '249.75', NULL, 1, 5, '2019-06-06 17:00:00'),
(2184, 233, 3200, NULL, 1300, 400, 100, 1, 25, NULL, NULL, NULL, NULL, '', 2, 0, '0.00', '9.99', NULL, NULL, NULL, NULL, '', '249.75', NULL, 1, 3, '2019-06-06 17:00:00'),
(2185, 233, 101715, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '25.00', '25.00', 0, 1, '2019-06-06 17:00:00'),
(2187, 235, 100, NULL, 100, 100, 100, 1, 25, NULL, 1, 0, 1, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '187.25', NULL, 0, 1, '2019-06-06 17:30:00'),
(2188, 235, 600, NULL, 200, 100, 100, 1, 25, NULL, 1, 0, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '187.25', NULL, 0, 1, '2019-06-06 17:30:00'),
(2189, 235, 900, NULL, 300, 100, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '187.25', NULL, 0, 1, '2019-06-06 17:30:00'),
(2190, 235, 1200, NULL, 400, 100, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '187.25', NULL, 0, 6, '2019-06-06 17:30:00'),
(2191, 235, 2700, NULL, 1100, 100, 100, 1, 25, NULL, 0, 0, 1, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '187.25', NULL, 0, 4, '2019-06-06 17:30:00'),
(2192, 235, 3000, NULL, 1200, 100, 100, 1, 25, NULL, NULL, NULL, NULL, '', 18, 0, '0.00', '7.49', NULL, NULL, NULL, NULL, '', '187.25', NULL, 1, 5, '2019-06-06 17:30:00'),
(2193, 235, 3200, NULL, 1300, 100, 100, 1, 25, NULL, NULL, NULL, NULL, '', 2, 0, '0.00', '7.49', NULL, NULL, NULL, NULL, '', '187.25', NULL, 1, 3, '2019-06-06 17:30:00'),
(2194, 236, 100600, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 1, 0, 'no garnish on top', NULL, NULL, NULL, NULL, NULL, '40.00', '70.00', '90.00', NULL, '70.00', '70.00', 0, 1, '2019-06-06 16:00:00'),
(2195, 236, 101600, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '45.00', '70.00', '90.00', NULL, '45.00', '45.00', 0, 1, '2019-06-06 16:00:00'),
(2196, 237, 400, NULL, 100, 400, 100, 1, 35, NULL, 1, 1, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '349.65', NULL, 0, 1, '2019-06-07 17:15:00'),
(2197, 237, 1000, NULL, 300, 400, 100, 1, 35, NULL, 1, 0, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '349.65', NULL, 0, 1, '2019-06-07 17:15:00'),
(2198, 237, 1200, NULL, 400, 400, 100, 1, 35, NULL, 1, 0, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '349.65', NULL, 0, 6, '2019-06-07 17:15:00'),
(2199, 237, 1800, NULL, 500, 400, 100, 1, 35, NULL, 1, 0, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '349.65', NULL, 0, 1, '2019-06-07 17:15:00'),
(2200, 237, 2100, NULL, 600, 400, 100, 1, 35, NULL, NULL, NULL, NULL, '', 70, 0, '0.00', '9.99', NULL, NULL, NULL, NULL, '', '349.65', NULL, 1, 2, '2019-06-07 17:15:00'),
(2201, 237, 2700, NULL, 1100, 400, 100, 1, 35, NULL, 0, 1, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '349.65', NULL, 0, 4, '2019-06-07 17:15:00'),
(2202, 237, 3000, NULL, 1200, 400, 100, 1, 35, NULL, NULL, NULL, NULL, '', 25, 0, '0.00', '9.99', NULL, NULL, NULL, NULL, '', '349.65', NULL, 1, 5, '2019-06-07 17:15:00'),
(2203, 237, 3200, NULL, 1300, 400, 100, 1, 35, NULL, NULL, NULL, NULL, '', 4, 0, '0.00', '9.99', NULL, NULL, NULL, NULL, '', '349.65', NULL, 1, 3, '2019-06-07 17:15:00'),
(2204, 237, 100500, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '70.00', '70.00', 0, 1, '2019-06-07 17:15:00'),
(2205, 237, 101700, NULL, NULL, NULL, 100, 2, NULL, 2, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '35.00', '35.00', 0, 1, '2019-06-07 17:15:00'),
(2206, 238, 100, NULL, 100, 500, 200, 1, 140, NULL, 7, 0, 0, '', NULL, NULL, NULL, '10.49', NULL, NULL, NULL, NULL, '', '1468.60', NULL, 0, 1, '2019-06-07 19:00:00'),
(2207, 238, 800, NULL, 200, 500, 200, 1, 140, NULL, 4, 0, 0, '', NULL, NULL, NULL, '10.49', NULL, NULL, NULL, NULL, '', '1468.60', NULL, 0, 1, '2019-06-07 19:00:00'),
(2208, 238, 1000, NULL, 300, 500, 200, 1, 140, NULL, 3, 1, 0, '', NULL, NULL, NULL, '10.49', NULL, NULL, NULL, NULL, '', '1468.60', NULL, 0, 1, '2019-06-07 19:00:00'),
(2209, 238, 1200, NULL, 400, 500, 200, 1, 140, NULL, 3, 1, 0, '', NULL, NULL, NULL, '10.49', NULL, NULL, NULL, NULL, '', '1468.60', NULL, 0, 6, '2019-06-07 19:00:00'),
(2210, 238, 2100, NULL, 600, 500, 200, 1, 140, NULL, NULL, NULL, NULL, '', 280, 0, '0.00', '10.49', NULL, NULL, NULL, NULL, '', '1468.60', NULL, 1, 2, '2019-06-07 19:00:00'),
(2211, 238, 2500, NULL, 900, 500, 200, 1, 140, NULL, 3, 1, 0, '', NULL, NULL, NULL, '10.49', NULL, NULL, NULL, NULL, '', '1468.60', NULL, 0, 1, '2019-06-07 19:00:00'),
(2212, 238, 2700, NULL, 1100, 500, 200, 1, 140, NULL, 0, 3, 1, '', NULL, NULL, NULL, '10.49', NULL, NULL, NULL, NULL, '', '1468.60', NULL, 0, 4, '2019-06-07 19:00:00'),
(2213, 238, 3000, NULL, 1200, 500, 200, 1, 140, NULL, NULL, NULL, NULL, '', 98, 0, '0.00', '10.49', NULL, NULL, NULL, NULL, '', '1468.60', NULL, 1, 5, '2019-06-07 19:00:00'),
(2214, 238, 3200, NULL, 1300, 500, 200, 1, 140, NULL, NULL, NULL, NULL, '', 12, 0, '0.00', '10.49', NULL, NULL, NULL, NULL, '', '1468.60', NULL, 1, 3, '2019-06-07 19:00:00'),
(2215, 239, 200, NULL, 100, 600, 200, 1, 75, NULL, 3, 1, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '749.25', NULL, 0, 1, '2019-06-07 19:15:00'),
(2216, 239, 0, NULL, 200, 600, 200, 1, 75, NULL, 2, 0, 1, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '749.25', NULL, 0, 1, '2019-06-07 19:15:00'),
(2217, 239, 0, NULL, 300, 600, 200, 1, 75, NULL, 2, 0, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '749.25', NULL, 0, 1, '2019-06-07 19:15:00'),
(2218, 239, 1500, NULL, 400, 600, 200, 1, 75, NULL, 2, 0, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '749.25', NULL, 0, 6, '2019-06-07 19:15:00'),
(2219, 239, 1800, NULL, 500, 600, 200, 1, 75, NULL, 2, 0, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '749.25', NULL, 0, 1, '2019-06-07 19:15:00'),
(2220, 239, 2100, NULL, 600, 600, 200, 1, 75, NULL, NULL, NULL, NULL, '', 150, 0, '0.00', '9.99', NULL, NULL, NULL, NULL, '', '749.25', NULL, 1, 2, '2019-06-07 19:15:00'),
(2221, 239, 2500, NULL, 900, 600, 200, 1, 75, NULL, 2, 0, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '749.25', NULL, 0, 1, '2019-06-07 19:15:00'),
(2222, 239, 2700, NULL, 1100, 600, 200, 1, 75, NULL, 0, 2, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '749.25', NULL, 0, 4, '2019-06-07 19:15:00'),
(2223, 239, 3000, NULL, 1200, 600, 200, 1, 75, NULL, NULL, NULL, NULL, '', 63, 10, '15.00', '9.99', NULL, NULL, NULL, NULL, '', '749.25', NULL, 1, 5, '2019-06-07 19:15:00'),
(2224, 239, 3200, NULL, 1300, 600, 200, 1, 75, NULL, NULL, NULL, NULL, '', 6, 0, '0.00', '9.99', NULL, NULL, NULL, NULL, '', '749.25', NULL, 1, 3, '2019-06-07 19:15:00'),
(2225, 240, 100600, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '40.00', '70.00', '90.00', NULL, '90.00', '90.00', 0, 1, '2019-06-07 18:45:00'),
(2226, 240, 101400, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '50.00', '50.00', 0, 6, '2019-06-07 18:45:00'),
(2234, 242, 200, NULL, 100, 100, 100, 1, 25, NULL, 1, 0, 1, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '187.25', NULL, 0, 1, '2019-06-07 19:00:00'),
(2235, 242, 700, NULL, 200, 100, 100, 1, 25, NULL, 1, 0, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '187.25', NULL, 0, 1, '2019-06-07 19:00:00'),
(2236, 242, 1100, NULL, 300, 100, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '187.25', NULL, 0, 1, '2019-06-07 19:00:00'),
(2237, 242, 1200, NULL, 400, 100, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '187.25', NULL, 0, 6, '2019-06-07 19:00:00'),
(2238, 242, 2700, NULL, 1100, 100, 100, 1, 25, NULL, 0, 0, 1, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '187.25', NULL, 0, 4, '2019-06-07 19:00:00'),
(2239, 242, 3000, NULL, 1200, 100, 100, 1, 25, NULL, NULL, NULL, NULL, '', 18, 0, '0.00', '7.49', NULL, NULL, NULL, NULL, '', '187.25', NULL, 1, 5, '2019-06-07 19:00:00'),
(2240, 242, 3200, NULL, 1300, 100, 100, 1, 25, NULL, NULL, NULL, NULL, '', 2, 0, '0.00', '7.49', NULL, NULL, NULL, NULL, '', '187.25', NULL, 1, 3, '2019-06-07 19:00:00'),
(2241, 243, 100300, NULL, NULL, NULL, 100, 2, NULL, NULL, 2, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '120.00', '120.00', 0, 1, '2019-06-07 19:30:00'),
(2242, 243, 100600, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '40.00', '70.00', '90.00', NULL, '90.00', '90.00', 0, 1, '2019-06-07 19:30:00'),
(2243, 243, 101400, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '50.00', '50.00', 0, 6, '2019-06-07 19:30:00'),
(2244, 243, 102000, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 30, NULL, NULL, NULL, '3.50', NULL, NULL, NULL, NULL, '105.00', '105.00', 1, 2, '2019-06-07 19:30:00'),
(2245, 243, 102800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 40, NULL, NULL, NULL, '1.50', NULL, NULL, NULL, NULL, '60.00', '60.00', 1, 5, '2019-06-07 19:30:00'),
(2246, 244, 100, NULL, 100, 300, 100, 1, 35, NULL, 1, 1, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '297.15', NULL, 0, 1, '2019-06-07 18:30:00'),
(2247, 244, 700, NULL, 200, 300, 100, 1, 35, NULL, 1, 0, 0, 'more gravey', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '297.15', NULL, 0, 1, '2019-06-07 18:30:00'),
(2248, 244, 0, NULL, 300, 300, 100, 1, 35, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '297.15', NULL, 0, 1, '2019-06-07 18:30:00'),
(2249, 244, 1600, NULL, 400, 300, 100, 1, 35, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '297.15', NULL, 0, 1, '2019-06-07 18:30:00'),
(2250, 244, 2100, NULL, 600, 300, 100, 1, 35, NULL, NULL, NULL, NULL, '', 70, 0, '0.00', '8.49', NULL, NULL, NULL, NULL, '', '297.15', NULL, 1, 2, '2019-06-07 18:30:00'),
(2251, 244, 2700, NULL, 1100, 300, 100, 1, 35, NULL, 0, 1, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '297.15', NULL, 0, 4, '2019-06-07 18:30:00'),
(2252, 244, 3000, NULL, 1200, 300, 100, 1, 35, NULL, NULL, NULL, NULL, '', 25, 0, '0.00', '8.49', NULL, NULL, NULL, NULL, '', '297.15', NULL, 1, 5, '2019-06-07 18:30:00'),
(2253, 244, 3200, NULL, 1300, 300, 100, 1, 35, NULL, NULL, NULL, NULL, '', 4, 0, '0.00', '8.49', NULL, NULL, NULL, NULL, '', '297.15', NULL, 1, 3, '2019-06-07 18:30:00'),
(2260, 247, 400, NULL, 100, 100, 100, 1, 55, NULL, 2, 1, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '411.95', NULL, 0, 1, '2019-06-07 18:30:00'),
(2261, 247, 500, NULL, 200, 100, 100, 1, 55, NULL, 1, 1, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '411.95', NULL, 0, 1, '2019-06-07 18:30:00'),
(2262, 247, 900, NULL, 300, 100, 100, 1, 55, NULL, 1, 1, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '411.95', NULL, 0, 1, '2019-06-07 18:30:00'),
(2263, 247, 1200, NULL, 400, 100, 100, 1, 55, NULL, 1, 1, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '411.95', NULL, 0, 6, '2019-06-07 18:30:00'),
(2264, 247, 2700, NULL, 1100, 100, 100, 1, 55, NULL, 0, 1, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '411.95', NULL, 0, 4, '2019-06-07 18:30:00'),
(2265, 247, 3000, NULL, 1200, 100, 100, 1, 55, NULL, NULL, NULL, NULL, '', 39, 0, '0.00', '7.49', NULL, NULL, NULL, NULL, '', '411.95', NULL, 1, 5, '2019-06-07 18:30:00'),
(2266, 247, 3200, NULL, 1300, 100, 100, 1, 55, NULL, NULL, NULL, NULL, '', 6, 0, '0.00', '7.49', NULL, NULL, NULL, NULL, '', '411.95', NULL, 1, 3, '2019-06-07 18:30:00'),
(2267, 248, 101400, NULL, NULL, NULL, 100, 2, NULL, NULL, 2, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '100.00', '100.00', 0, 6, '2019-06-08 12:30:00'),
(2276, 250, 100, NULL, 100, 400, 100, 1, 35, NULL, 1, 1, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '349.65', NULL, 0, 1, '2019-06-08 16:00:00'),
(2277, 250, 1000, NULL, 300, 400, 100, 1, 35, NULL, 1, 0, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '349.65', NULL, 0, 1, '2019-06-08 16:00:00'),
(2278, 250, 1200, NULL, 400, 400, 100, 1, 35, NULL, 1, 0, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '349.65', NULL, 0, 6, '2019-06-08 16:00:00'),
(2279, 250, 1800, NULL, 500, 400, 100, 1, 35, NULL, 1, 0, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '349.65', NULL, 0, 1, '2019-06-08 16:00:00'),
(2280, 250, 2200, NULL, 600, 400, 100, 1, 35, NULL, NULL, NULL, NULL, '', 35, 0, '0.00', '9.99', NULL, NULL, NULL, NULL, '', '349.65', NULL, 1, 2, '2019-06-08 16:00:00'),
(2281, 250, 2700, NULL, 1100, 400, 100, 1, 35, NULL, 0, 1, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '349.65', NULL, 0, 4, '2019-06-08 16:00:00'),
(2282, 250, 3000, NULL, 1200, 400, 100, 1, 35, NULL, NULL, NULL, NULL, '', 25, 0, '0.00', '9.99', NULL, NULL, NULL, NULL, '', '349.65', NULL, 1, 5, '2019-06-08 16:00:00'),
(2283, 250, 3200, NULL, 1300, 400, 100, 1, 35, NULL, NULL, NULL, NULL, '', 4, 0, '0.00', '9.99', NULL, NULL, NULL, NULL, '', '349.65', NULL, 1, 3, '2019-06-08 16:00:00'),
(2293, 251, 100, NULL, 100, 400, 100, 1, 35, NULL, 1, 1, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '297.15', NULL, 0, 1, '2019-06-08 18:30:00'),
(2294, 251, 0, NULL, 300, 400, 100, 1, 35, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '297.15', NULL, 0, 1, '2019-06-08 18:30:00'),
(2295, 251, 1200, NULL, 400, 400, 100, 1, 35, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '297.15', NULL, 0, 6, '2019-06-08 18:30:00'),
(2296, 251, 1800, NULL, 500, 400, 100, 1, 35, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '297.15', NULL, 0, 1, '2019-06-08 18:30:00'),
(2297, 251, 2100, NULL, 600, 400, 100, 1, 35, NULL, NULL, NULL, NULL, '', 70, 0, '0.00', '8.49', NULL, NULL, NULL, NULL, '', '297.15', NULL, 1, 2, '2019-06-08 18:30:00'),
(2298, 251, 2700, NULL, 1100, 400, 100, 1, 35, NULL, 0, 1, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '297.15', NULL, 0, 4, '2019-06-08 18:30:00'),
(2299, 251, 0, NULL, 1200, 400, 100, 1, 35, NULL, 0, 1, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '297.15', NULL, 0, 1, '2019-06-08 18:30:00'),
(2300, 251, 3200, NULL, 1300, 400, 100, 1, 35, NULL, NULL, NULL, NULL, '', 4, 0, '0.00', '8.49', NULL, NULL, NULL, NULL, '', '297.15', NULL, 1, 3, '2019-06-08 18:30:00'),
(2301, 251, 101900, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 35, NULL, NULL, NULL, '2.50', NULL, NULL, NULL, NULL, '87.50', '87.50', 1, 2, '2019-06-08 18:30:00'),
(2302, 252, 400, NULL, 100, 400, 100, 1, 50, NULL, 2, 0, 1, '', NULL, NULL, NULL, '9.49', NULL, NULL, NULL, NULL, '', '474.50', NULL, 0, 1, '2019-06-08 16:45:00'),
(2303, 252, 0, NULL, 300, 400, 100, 1, 50, NULL, 1, 0, 1, '', NULL, NULL, NULL, '9.49', NULL, NULL, NULL, NULL, '', '474.50', NULL, 0, 1, '2019-06-08 16:45:00'),
(2304, 252, 1200, NULL, 400, 400, 100, 1, 50, NULL, 1, 0, 1, '', NULL, NULL, NULL, '9.49', NULL, NULL, NULL, NULL, '', '474.50', NULL, 0, 6, '2019-06-08 16:45:00'),
(2305, 252, 1800, NULL, 500, 400, 100, 1, 50, NULL, 1, 0, 1, '', NULL, NULL, NULL, '9.49', NULL, NULL, NULL, NULL, '', '474.50', NULL, 0, 1, '2019-06-08 16:45:00'),
(2306, 252, 2100, NULL, 600, 400, 100, 1, 50, NULL, NULL, NULL, NULL, '', 100, 0, '0.00', '9.49', NULL, NULL, NULL, NULL, '', '474.50', NULL, 1, 2, '2019-06-08 16:45:00'),
(2307, 252, 2700, NULL, 1100, 400, 100, 1, 50, NULL, 0, 1, 0, '', NULL, NULL, NULL, '9.49', NULL, NULL, NULL, NULL, '', '474.50', NULL, 0, 4, '2019-06-08 16:45:00'),
(2308, 252, 3000, NULL, 1200, 400, 100, 1, 50, NULL, NULL, NULL, NULL, '', 40, 5, '7.50', '9.49', NULL, NULL, NULL, NULL, '', '474.50', NULL, 1, 5, '2019-06-08 16:45:00'),
(2309, 252, 3200, NULL, 1300, 400, 100, 1, 50, NULL, NULL, NULL, NULL, '', 4, 0, '0.00', '9.49', NULL, NULL, NULL, NULL, '', '474.50', NULL, 1, 3, '2019-06-08 16:45:00'),
(2326, 254, 101400, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '50.00', '50.00', 0, 6, '2019-06-08 15:00:00'),
(2327, 255, 100, NULL, 100, 100, 100, 1, 25, NULL, 1, 0, 1, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '174.75', NULL, 0, 1, '2019-06-06 17:00:00'),
(2328, 255, 500, NULL, 200, 100, 100, 1, 25, NULL, 1, 0, 0, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '174.75', NULL, 0, 1, '2019-06-06 17:00:00'),
(2329, 255, 1000, NULL, 300, 100, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '174.75', NULL, 0, 1, '2019-06-06 17:00:00'),
(2330, 255, 1200, NULL, 400, 100, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '174.75', NULL, 0, 6, '2019-06-06 17:00:00'),
(2331, 255, 2700, NULL, 1100, 100, 100, 1, 25, NULL, 0, 0, 1, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '174.75', NULL, 0, 4, '2019-06-06 17:00:00'),
(2332, 255, 3100, NULL, 1200, 100, 100, 1, 25, NULL, NULL, NULL, NULL, '', 25, 0, '0.00', '6.99', NULL, NULL, NULL, NULL, '', '174.75', NULL, 1, 5, '2019-06-06 17:00:00'),
(2333, 255, 3200, NULL, 1300, 100, 100, 1, 25, NULL, NULL, NULL, NULL, '', 2, 0, '0.00', '6.99', NULL, NULL, NULL, NULL, '', '174.75', NULL, 1, 3, '2019-06-06 17:00:00'),
(2334, 256, 100, NULL, 100, 300, 100, 1, 40, NULL, 2, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '359.60', NULL, 0, 1, '2019-06-08 15:30:00'),
(2335, 256, 800, NULL, 200, 300, 100, 1, 40, NULL, 1, 0, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '359.60', NULL, 0, 1, '2019-06-08 15:30:00'),
(2336, 256, 1000, NULL, 300, 300, 100, 1, 40, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '359.60', NULL, 0, 1, '2019-06-08 15:30:00'),
(2337, 256, 1200, NULL, 400, 300, 100, 1, 40, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '359.60', NULL, 0, 6, '2019-06-08 15:30:00'),
(2338, 256, 2300, NULL, 600, 300, 100, 1, 40, NULL, NULL, NULL, NULL, '', 40, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '359.60', NULL, 1, 2, '2019-06-08 15:30:00'),
(2339, 256, 2700, NULL, 1100, 300, 100, 1, 40, NULL, 0, 1, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '359.60', NULL, 0, 4, '2019-06-08 15:30:00'),
(2340, 256, 3000, NULL, 1200, 300, 100, 1, 40, NULL, NULL, NULL, NULL, '', 28, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '359.60', NULL, 1, 5, '2019-06-08 15:30:00'),
(2341, 256, 3200, NULL, 1300, 300, 100, 1, 40, NULL, NULL, NULL, NULL, '', 4, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '359.60', NULL, 1, 3, '2019-06-08 15:30:00'),
(2342, 256, 102000, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 20, NULL, NULL, NULL, '3.50', NULL, NULL, NULL, NULL, '70.00', '70.00', 1, 2, '2019-06-08 15:30:00'),
(2343, 257, 100200, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '90.00', '90.00', 0, 1, '2019-06-08 19:00:00'),
(2344, 257, 101200, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '75.00', '75.00', 0, 6, '2019-06-08 19:00:00'),
(2345, 257, 101600, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, 'Mild Less Vagi', NULL, NULL, NULL, NULL, NULL, '45.00', '70.00', '90.00', NULL, '90.00', '90.00', 0, 1, '2019-06-08 19:00:00'),
(2346, 257, 101710, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '50.00', '50.00', 0, 1, '2019-06-08 19:00:00'),
(2347, 257, 102000, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, 'less red', 40, NULL, NULL, NULL, '3.50', NULL, NULL, NULL, NULL, '140.00', '140.00', 1, 2, '2019-06-08 19:00:00'),
(2348, 257, 1, 'Veal Achari', NULL, NULL, 100, 3, NULL, NULL, 1, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-06-08 19:00:00'),
(2349, 257, 1, 'Pea Puloa (R=3)', NULL, NULL, 100, 3, NULL, NULL, 2, 0, 0, 'In hot box', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-06-08 19:00:00'),
(2350, 258, 100, NULL, 100, 300, 100, 1, 35, NULL, 1, 1, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '314.65', NULL, 0, 1, '2019-06-08 19:30:00'),
(2351, 258, 800, NULL, 200, 300, 100, 1, 35, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '314.65', NULL, 0, 1, '2019-06-08 19:30:00'),
(2352, 258, 900, NULL, 300, 300, 100, 1, 35, NULL, 1, 0, 0, 'mild if possible', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '314.65', NULL, 0, 1, '2019-06-08 19:30:00'),
(2353, 258, 1300, NULL, 400, 300, 100, 1, 35, NULL, NULL, NULL, NULL, '', 70, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '314.65', NULL, 1, 6, '2019-06-08 19:30:00'),
(2354, 258, 2100, NULL, 600, 300, 100, 1, 35, NULL, NULL, NULL, NULL, '', 70, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '314.65', NULL, 1, 2, '2019-06-08 19:30:00'),
(2355, 258, 2700, NULL, 1100, 300, 100, 1, 35, NULL, 0, 1, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '314.65', NULL, 0, 4, '2019-06-08 19:30:00'),
(2356, 258, 3000, NULL, 1200, 300, 100, 1, 35, NULL, NULL, NULL, NULL, '', 25, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '314.65', NULL, 1, 5, '2019-06-08 19:30:00'),
(2357, 258, 3200, NULL, 1300, 300, 100, 1, 35, NULL, NULL, NULL, NULL, '', 4, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '314.65', NULL, 1, 3, '2019-06-08 19:30:00'),
(2358, 253, 400, NULL, 100, 400, 100, 1, 25, NULL, 1, 0, 1, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '249.75', NULL, 0, 1, '2019-06-08 19:00:00'),
(2359, 253, 1000, NULL, 300, 400, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '249.75', NULL, 0, 1, '2019-06-08 19:00:00'),
(2360, 253, 1200, NULL, 400, 400, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '249.75', NULL, 0, 6, '2019-06-08 19:00:00'),
(2361, 253, 1800, NULL, 500, 400, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '249.75', NULL, 0, 1, '2019-06-08 19:00:00'),
(2362, 253, 2300, NULL, 600, 400, 100, 1, 25, NULL, NULL, NULL, NULL, '', 45, 20, '50.00', '9.99', NULL, NULL, NULL, NULL, '', '249.75', NULL, 1, 2, '2019-06-08 19:00:00'),
(2363, 253, 2700, NULL, 1100, 400, 100, 1, 25, NULL, 0, 0, 1, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '249.75', NULL, 0, 4, '2019-06-08 19:00:00'),
(2364, 253, 3000, NULL, 1200, 400, 100, 1, 25, NULL, NULL, NULL, NULL, '', 18, 0, '0.00', '9.99', NULL, NULL, NULL, NULL, '', '249.75', NULL, 1, 5, '2019-06-08 19:00:00'),
(2365, 253, 3200, NULL, 1300, 400, 100, 1, 25, NULL, NULL, NULL, NULL, '', 2, 0, '0.00', '9.99', NULL, NULL, NULL, NULL, '', '249.75', NULL, 1, 3, '2019-06-08 19:00:00'),
(2366, 253, 101100, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 1, 0, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '50.00', '50.00', 0, 1, '2019-06-08 19:00:00'),
(2385, 261, 100300, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '60.00', '60.00', 0, 1, '2019-06-07 19:00:00'),
(2386, 262, 0, NULL, 100, 200, 100, 1, 25, NULL, 1, 0, 1, '', NULL, NULL, NULL, '5.99', NULL, NULL, NULL, NULL, '', '149.75', NULL, 0, 1, '2019-06-08 14:30:00'),
(2387, 262, 0, NULL, 300, 200, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '5.99', NULL, NULL, NULL, NULL, '', '149.75', NULL, 0, 1, '2019-06-08 14:30:00'),
(2388, 262, 1200, NULL, 400, 200, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '5.99', NULL, NULL, NULL, NULL, '', '149.75', NULL, 0, 6, '2019-06-08 14:30:00'),
(2389, 262, 1700, NULL, 500, 200, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '5.99', NULL, NULL, NULL, NULL, '', '149.75', NULL, 0, 1, '2019-06-08 14:30:00'),
(2390, 262, 2700, NULL, 1100, 200, 100, 1, 25, NULL, 0, 0, 1, '', NULL, NULL, NULL, '5.99', NULL, NULL, NULL, NULL, '', '149.75', NULL, 0, 4, '2019-06-08 14:30:00'),
(2391, 262, 3000, NULL, 1200, 200, 100, 1, 25, NULL, NULL, NULL, NULL, '', 18, 0, '0.00', '5.99', NULL, NULL, NULL, NULL, '', '149.75', NULL, 1, 5, '2019-06-08 14:30:00'),
(2392, 262, 3200, NULL, 1300, 200, 100, 1, 25, NULL, NULL, NULL, NULL, 'with cucumber', 2, 0, '0.00', '5.99', NULL, NULL, NULL, NULL, '', '149.75', NULL, 1, 3, '2019-06-08 14:30:00'),
(2393, 262, 100600, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, 'for 30 PPL', NULL, NULL, NULL, NULL, NULL, '40.00', '70.00', '90.00', NULL, '90.00', '90.00', 0, 1, '2019-06-08 14:30:00'),
(2394, 262, 1, ' Basmati Ch Bir(M=3 R=2.25)', NULL, NULL, 100, 3, NULL, NULL, 1, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-06-08 14:30:00'),
(2395, 263, 200, NULL, 100, 500, 200, 1, 50, NULL, 2, 0, 1, '', NULL, NULL, NULL, '10.49', NULL, NULL, NULL, NULL, '', '524.50', NULL, 0, 1, '2019-06-08 19:00:00'),
(2396, 263, 700, NULL, 200, 500, 200, 1, 50, NULL, 1, 1, 0, '', NULL, NULL, NULL, '10.49', NULL, NULL, NULL, NULL, '', '524.50', NULL, 0, 1, '2019-06-08 19:00:00'),
(2397, 263, 1100, NULL, 300, 500, 200, 1, 50, NULL, 1, 0, 1, '', NULL, NULL, NULL, '10.49', NULL, NULL, NULL, NULL, '', '524.50', NULL, 0, 1, '2019-06-08 19:00:00'),
(2398, 263, 1500, NULL, 400, 500, 200, 1, 50, NULL, 1, 0, 1, '', NULL, NULL, NULL, '10.49', NULL, NULL, NULL, NULL, '', '524.50', NULL, 0, 6, '2019-06-08 19:00:00'),
(2399, 263, 2100, NULL, 600, 500, 200, 1, 50, NULL, NULL, NULL, NULL, '', 100, 0, '0.00', '10.49', NULL, NULL, NULL, NULL, '', '524.50', NULL, 1, 2, '2019-06-08 19:00:00'),
(2400, 263, 2500, NULL, 900, 500, 200, 1, 50, NULL, 1, 0, 1, '', NULL, NULL, NULL, '10.49', NULL, NULL, NULL, NULL, '', '524.50', NULL, 0, 1, '2019-06-08 19:00:00'),
(2401, 263, 2700, NULL, 1100, 500, 200, 1, 50, NULL, 0, 1, 0, '', NULL, NULL, NULL, '10.49', NULL, NULL, NULL, NULL, '', '524.50', NULL, 0, 4, '2019-06-08 19:00:00'),
(2402, 263, 3000, NULL, 1200, 500, 200, 1, 50, NULL, NULL, NULL, NULL, '', 35, 0, '0.00', '10.49', NULL, NULL, NULL, NULL, '', '524.50', NULL, 1, 5, '2019-06-08 19:00:00'),
(2403, 263, 3200, NULL, 1300, 500, 200, 1, 50, NULL, NULL, NULL, NULL, '', 4, 0, '0.00', '10.49', NULL, NULL, NULL, NULL, '', '524.50', NULL, 1, 3, '2019-06-08 19:00:00'),
(2404, 264, 200, NULL, 100, 300, 100, 1, 90, NULL, 4, 0, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '809.10', NULL, 0, 1, '2019-06-08 19:30:00'),
(2405, 264, 800, NULL, 200, 300, 100, 1, 90, NULL, 2, 1, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '809.10', NULL, 0, 1, '2019-06-08 19:30:00'),
(2406, 264, 900, NULL, 300, 300, 100, 1, 90, NULL, 2, 0, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '809.10', NULL, 0, 1, '2019-06-08 19:30:00'),
(2407, 264, 1200, NULL, 400, 300, 100, 1, 90, NULL, 2, 0, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '809.10', NULL, 0, 6, '2019-06-08 19:30:00'),
(2408, 264, 2100, NULL, 600, 300, 100, 1, 90, NULL, NULL, NULL, NULL, '', 180, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '809.10', NULL, 1, 2, '2019-06-08 19:30:00'),
(2409, 264, 2700, NULL, 1100, 300, 100, 1, 90, NULL, 0, 2, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '809.10', NULL, 0, 4, '2019-06-08 19:30:00'),
(2410, 264, 3000, NULL, 1200, 300, 100, 1, 90, NULL, NULL, NULL, NULL, '', 63, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '809.10', NULL, 1, 5, '2019-06-08 19:30:00'),
(2411, 264, 3200, NULL, 1300, 300, 100, 1, 90, NULL, NULL, NULL, NULL, '', 8, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '809.10', NULL, 1, 3, '2019-06-08 19:30:00'),
(2414, 267, 100, NULL, 100, 200, 100, 1, 70, NULL, 3, 0, 1, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '594.30', NULL, 0, 1, '2019-06-08 19:00:00'),
(2415, 267, 1100, NULL, 300, 200, 100, 1, 70, NULL, 2, 0, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '594.30', NULL, 0, 1, '2019-06-08 19:00:00'),
(2416, 267, 1200, NULL, 400, 200, 100, 1, 70, NULL, 2, 0, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '594.30', NULL, 0, 6, '2019-06-08 19:00:00'),
(2417, 267, 1700, NULL, 500, 200, 100, 1, 70, NULL, 2, 0, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '594.30', NULL, 0, 1, '2019-06-08 19:00:00'),
(2418, 267, 2700, NULL, 1100, 200, 100, 1, 70, NULL, 0, 1, 1, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '594.30', NULL, 0, 4, '2019-06-08 19:00:00'),
(2419, 267, 3000, NULL, 1200, 200, 100, 1, 70, NULL, NULL, NULL, NULL, '', 49, 0, '0.00', '8.49', NULL, NULL, NULL, NULL, '', '594.30', NULL, 1, 5, '2019-06-08 19:00:00'),
(2420, 267, 3200, NULL, 1300, 200, 100, 1, 70, NULL, NULL, NULL, NULL, '', 6, 0, '0.00', '8.49', NULL, NULL, NULL, NULL, '', '594.30', NULL, 1, 3, '2019-06-08 19:00:00'),
(2421, 267, 100600, NULL, NULL, NULL, 100, 2, NULL, NULL, 2, 0, 0, 'for 70 PPL', NULL, NULL, NULL, NULL, NULL, '40.00', '70.00', '90.00', NULL, '180.00', '180.00', 0, 1, '2019-06-08 19:00:00'),
(2430, 269, 200, NULL, 100, 300, 100, 1, 100, NULL, 5, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '899.00', NULL, 0, 1, '2019-06-08 18:00:00'),
(2431, 269, 700, NULL, 200, 300, 100, 1, 100, NULL, 3, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '899.00', NULL, 0, 1, '2019-06-08 18:00:00'),
(2432, 269, 900, NULL, 300, 300, 100, 1, 100, NULL, 2, 1, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '899.00', NULL, 0, 1, '2019-06-08 18:00:00'),
(2433, 269, 1200, NULL, 400, 300, 100, 1, 100, NULL, 2, 1, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '899.00', NULL, 0, 6, '2019-06-08 18:00:00'),
(2434, 269, 2100, NULL, 600, 300, 100, 1, 100, NULL, NULL, NULL, NULL, '', 200, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '899.00', NULL, 1, 2, '2019-06-08 18:00:00'),
(2435, 269, 2700, NULL, 1100, 300, 100, 1, 100, NULL, 0, 2, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '899.00', NULL, 0, 4, '2019-06-08 18:00:00'),
(2436, 269, 3000, NULL, 1200, 300, 100, 1, 100, NULL, NULL, NULL, NULL, '', 70, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '899.00', NULL, 1, 5, '2019-06-08 18:00:00'),
(2437, 269, 3200, NULL, 1300, 300, 100, 1, 100, NULL, NULL, NULL, NULL, '', 8, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '899.00', NULL, 1, 3, '2019-06-08 18:00:00'),
(2459, 271, 200, NULL, 100, 100, 100, 1, 25, NULL, 1, 0, 1, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '187.25', NULL, 0, 1, '2019-06-08 20:00:00'),
(2460, 271, 600, NULL, 200, 100, 100, 1, 25, NULL, 1, 0, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '187.25', NULL, 0, 1, '2019-06-08 20:00:00'),
(2461, 271, 900, NULL, 300, 100, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '187.25', NULL, 0, 1, '2019-06-08 20:00:00'),
(2462, 271, 1200, NULL, 400, 100, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '187.25', NULL, 0, 6, '2019-06-08 20:00:00'),
(2463, 271, 2700, NULL, 1100, 100, 100, 1, 25, NULL, 0, 0, 1, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '187.25', NULL, 0, 4, '2019-06-08 20:00:00'),
(2464, 271, 3000, NULL, 1200, 100, 100, 1, 25, NULL, NULL, NULL, NULL, '', 18, 0, '0.00', '7.49', NULL, NULL, NULL, NULL, '', '187.25', NULL, 1, 5, '2019-06-08 20:00:00'),
(2465, 271, 3200, NULL, 1300, 100, 100, 1, 25, NULL, NULL, NULL, NULL, '', 2, 0, '0.00', '7.49', NULL, NULL, NULL, NULL, '', '187.25', NULL, 1, 3, '2019-06-08 20:00:00'),
(2466, 272, 400, NULL, 100, 300, 100, 1, 40, NULL, 2, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '359.60', NULL, 0, 1, '2019-06-08 19:00:00'),
(2467, 272, 700, NULL, 200, 300, 100, 1, 40, NULL, 1, 0, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '359.60', NULL, 0, 1, '2019-06-08 19:00:00'),
(2468, 272, 1000, NULL, 300, 300, 100, 1, 40, NULL, 1, 0, 0, 'only 1 M half', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '359.60', NULL, 0, 1, '2019-06-08 19:00:00'),
(2469, 272, 1200, NULL, 400, 300, 100, 1, 40, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '359.60', NULL, 0, 6, '2019-06-08 19:00:00'),
(2470, 272, 2300, NULL, 600, 300, 100, 1, 40, NULL, NULL, NULL, NULL, '', 40, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '359.60', NULL, 1, 2, '2019-06-08 19:00:00'),
(2471, 272, 2700, NULL, 1100, 300, 100, 1, 40, NULL, 0, 1, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '359.60', NULL, 0, 4, '2019-06-08 19:00:00'),
(2472, 272, 3000, NULL, 1200, 300, 100, 1, 40, NULL, NULL, NULL, NULL, '', 38, 10, '15.00', '8.99', NULL, NULL, NULL, NULL, '', '359.60', NULL, 1, 5, '2019-06-08 19:00:00'),
(2473, 272, 3200, NULL, 1300, 300, 100, 1, 40, NULL, NULL, NULL, NULL, '', 4, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '359.60', NULL, 1, 3, '2019-06-08 19:00:00'),
(2474, 272, 101705, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 1, 0, 'only 1 M half', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '40.00', '40.00', 0, 1, '2019-06-08 19:00:00'),
(2484, 274, 100200, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '30.00', '30.00', 0, 1, '2019-06-09 17:00:00'),
(2485, 274, 100300, NULL, NULL, NULL, 100, 2, NULL, 3, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '30.00', '30.00', 0, 1, '2019-06-09 17:00:00'),
(2486, 274, 100500, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '35.00', '35.00', 0, 1, '2019-06-09 17:00:00'),
(2487, 274, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 2, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-06-09 17:00:00'),
(2498, 276, 400, NULL, 100, 400, 100, 1, 35, NULL, 1, 1, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '349.65', NULL, 0, 1, '2019-06-09 14:00:00'),
(2499, 276, 1000, NULL, 300, 400, 100, 1, 35, NULL, 1, 0, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '349.65', NULL, 0, 1, '2019-06-09 14:00:00'),
(2500, 276, 1200, NULL, 400, 400, 100, 1, 35, NULL, 1, 0, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '349.65', NULL, 0, 6, '2019-06-09 14:00:00'),
(2501, 276, 1800, NULL, 500, 400, 100, 1, 35, NULL, 1, 0, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '349.65', NULL, 0, 1, '2019-06-09 14:00:00'),
(2502, 276, 2300, NULL, 600, 400, 100, 1, 35, NULL, NULL, NULL, NULL, '', 35, 0, '0.00', '9.99', NULL, NULL, NULL, NULL, '', '349.65', NULL, 1, 2, '2019-06-09 14:00:00'),
(2503, 276, 2700, NULL, 1100, 400, 100, 1, 35, NULL, 0, 1, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '349.65', NULL, 0, 4, '2019-06-09 14:00:00'),
(2504, 276, 3000, NULL, 1200, 400, 100, 1, 35, NULL, NULL, NULL, NULL, '', 25, 0, '0.00', '9.99', NULL, NULL, NULL, NULL, '', '349.65', NULL, 1, 5, '2019-06-09 14:00:00'),
(2505, 276, 3200, NULL, 1300, 400, 100, 1, 35, NULL, NULL, NULL, NULL, '', 4, 0, '0.00', '9.99', NULL, NULL, NULL, NULL, '', '349.65', NULL, 1, 3, '2019-06-09 14:00:00'),
(2506, 277, 100000, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, 'extra meat', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '60.00', '60.00', 0, 1, '2019-06-09 20:00:00'),
(2507, 277, 100300, NULL, NULL, NULL, 100, 2, NULL, NULL, 2, 0, 0, 'extra meat', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '120.00', '120.00', 0, 1, '2019-06-09 20:00:00'),
(2508, 277, 100900, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, 'extra meat', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '70.00', '70.00', 0, 1, '2019-06-09 20:00:00'),
(2509, 277, 101300, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '50.00', '50.00', 0, 6, '2019-06-09 20:00:00'),
(2510, 277, 101600, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '45.00', '70.00', '90.00', NULL, '90.00', '90.00', 0, 1, '2019-06-09 20:00:00'),
(2511, 277, 101800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 50, NULL, NULL, NULL, '2.50', NULL, NULL, NULL, NULL, '125.00', '125.00', 1, 2, '2019-06-09 20:00:00'),
(2512, 277, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 5, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-06-09 20:00:00'),
(2513, 277, 102600, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 2, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.25', NULL, '0.00', '0.00', 0, 4, '2019-06-09 20:00:00'),
(2514, 277, 102800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 40, NULL, NULL, NULL, '1.50', NULL, NULL, NULL, NULL, '60.00', '60.00', 1, 5, '2019-06-09 20:00:00'),
(2515, 278, 200, NULL, 100, 300, 100, 1, 30, NULL, 1, 0, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '269.70', NULL, 0, 1, '2019-06-09 13:00:00'),
(2516, 278, 600, NULL, 200, 300, 100, 1, 30, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '269.70', NULL, 0, 1, '2019-06-09 13:00:00'),
(2517, 278, 1100, NULL, 300, 300, 100, 1, 30, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '269.70', NULL, 0, 1, '2019-06-09 13:00:00'),
(2518, 278, 1200, NULL, 400, 300, 100, 1, 30, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '269.70', NULL, 0, 6, '2019-06-09 13:00:00'),
(2519, 278, 2200, NULL, 600, 300, 100, 1, 30, NULL, NULL, NULL, NULL, '', 30, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '269.70', NULL, 1, 2, '2019-06-09 13:00:00'),
(2520, 278, 2700, NULL, 1100, 300, 100, 1, 30, NULL, 0, 0, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '269.70', NULL, 0, 4, '2019-06-09 13:00:00'),
(2521, 278, 3000, NULL, 1200, 300, 100, 1, 30, NULL, NULL, NULL, NULL, '', 21, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '269.70', NULL, 1, 5, '2019-06-09 13:00:00'),
(2522, 278, 3200, NULL, 1300, 300, 100, 1, 30, NULL, NULL, NULL, NULL, '', 4, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '269.70', NULL, 1, 3, '2019-06-09 13:00:00'),
(2523, 278, 100600, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '40.00', '70.00', '90.00', NULL, '40.00', '40.00', 0, 1, '2019-06-09 13:00:00'),
(2524, 279, 1, 'Whole Ch. Kari (Fresh Tomato)', NULL, NULL, 100, 3, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-06-09 16:00:00'),
(2525, 280, 200, NULL, 100, 300, 100, 1, 25, NULL, 1, 0, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 0, 1, '2019-06-09 13:00:00'),
(2526, 280, 800, NULL, 200, 300, 100, 1, 25, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 0, 1, '2019-06-09 13:00:00'),
(2527, 280, 1000, NULL, 300, 300, 100, 1, 25, NULL, 0, 1, 0, '1 Small Tray half hlaf', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 0, 1, '2019-06-09 13:00:00'),
(2528, 280, 1200, NULL, 400, 300, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 0, 6, '2019-06-09 13:00:00'),
(2529, 280, 2100, NULL, 600, 300, 100, 1, 25, NULL, NULL, NULL, NULL, '', 50, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 1, 2, '2019-06-09 13:00:00'),
(2530, 280, 2700, NULL, 1100, 300, 100, 1, 25, NULL, 0, 0, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 0, 4, '2019-06-09 13:00:00'),
(2531, 280, 3000, NULL, 1200, 300, 100, 1, 25, NULL, NULL, NULL, NULL, '', 18, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 1, 5, '2019-06-09 13:00:00'),
(2532, 280, 3200, NULL, 1300, 300, 100, 1, 25, NULL, NULL, NULL, NULL, '', 2, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 1, 3, '2019-06-09 13:00:00'),
(2533, 280, 101705, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '25.00', '25.00', 0, 1, '2019-06-09 13:00:00'),
(2534, 275, 200, NULL, 100, 300, 100, 1, 25, NULL, 1, 0, 1, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '212.25', NULL, 0, 1, '2019-06-09 13:00:00'),
(2535, 275, 700, NULL, 200, 300, 100, 1, 25, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '212.25', NULL, 0, 1, '2019-06-09 13:00:00'),
(2536, 275, 0, NULL, 300, 300, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '212.25', NULL, 0, 1, '2019-06-09 13:00:00'),
(2537, 275, 1200, NULL, 400, 300, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '212.25', NULL, 0, 6, '2019-06-09 13:00:00'),
(2538, 275, 2100, NULL, 600, 300, 100, 1, 25, NULL, NULL, NULL, NULL, '', 50, 0, '0.00', '8.49', NULL, NULL, NULL, NULL, '', '212.25', NULL, 1, 2, '2019-06-09 13:00:00'),
(2539, 275, 2700, NULL, 1100, 300, 100, 1, 25, NULL, 0, 0, 1, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '212.25', NULL, 0, 4, '2019-06-09 13:00:00'),
(2540, 275, 3000, NULL, 1200, 300, 100, 1, 25, NULL, NULL, NULL, NULL, '', 18, 0, '0.00', '8.49', NULL, NULL, NULL, NULL, '', '212.25', NULL, 1, 5, '2019-06-09 13:00:00'),
(2541, 275, 3200, NULL, 1300, 300, 100, 1, 25, NULL, NULL, NULL, NULL, '', 2, 0, '0.00', '8.49', NULL, NULL, NULL, NULL, '', '212.25', NULL, 1, 3, '2019-06-09 13:00:00'),
(2542, 275, 101300, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 1, 0, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '40.00', '40.00', 0, 6, '2019-06-09 13:00:00'),
(2543, 275, 1, 'Palak Panerr (25 PPL)', NULL, NULL, 100, 3, NULL, NULL, 0, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-06-09 13:00:00'),
(2552, 260, 200, NULL, 100, 300, 100, 1, 60, NULL, 3, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '539.40', NULL, 0, 1, '2019-06-08 19:15:00'),
(2553, 260, 500, NULL, 200, 300, 100, 1, 60, NULL, 2, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '539.40', NULL, 0, 1, '2019-06-08 19:15:00'),
(2554, 260, 900, NULL, 300, 300, 100, 1, 60, NULL, 1, 1, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '539.40', NULL, 0, 1, '2019-06-08 19:15:00'),
(2555, 260, 1200, NULL, 400, 300, 100, 1, 60, NULL, 1, 1, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '539.40', NULL, 0, 6, '2019-06-08 19:15:00'),
(2556, 260, 2100, NULL, 600, 300, 100, 1, 60, NULL, NULL, NULL, NULL, '', 120, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '539.40', NULL, 1, 2, '2019-06-08 19:15:00'),
(2557, 260, 2700, NULL, 1100, 300, 100, 1, 60, NULL, 0, 1, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '539.40', NULL, 0, 4, '2019-06-08 19:15:00'),
(2558, 260, 3000, NULL, 1200, 300, 100, 1, 60, NULL, NULL, NULL, NULL, '', 42, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '539.40', NULL, 1, 5, '2019-06-08 19:15:00'),
(2559, 260, 3200, NULL, 1300, 300, 100, 1, 60, NULL, NULL, NULL, NULL, '', 6, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '539.40', NULL, 1, 3, '2019-06-08 19:15:00'),
(2560, 259, 100, NULL, 100, 300, 100, 1, 50, NULL, 2, 0, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '449.50', NULL, 0, 1, '2019-06-08 18:30:00'),
(2561, 259, 700, NULL, 200, 300, 100, 1, 50, NULL, 1, 1, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '449.50', NULL, 0, 1, '2019-06-08 18:30:00'),
(2562, 259, 1000, NULL, 300, 300, 100, 1, 50, NULL, 1, 0, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '449.50', NULL, 0, 1, '2019-06-08 18:30:00'),
(2563, 259, 1200, NULL, 400, 300, 100, 1, 50, NULL, 1, 0, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '449.50', NULL, 0, 6, '2019-06-08 18:30:00'),
(2564, 259, 2100, NULL, 600, 300, 100, 1, 50, NULL, NULL, NULL, NULL, '', 100, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '449.50', NULL, 1, 2, '2019-06-08 18:30:00'),
(2565, 259, 2700, NULL, 1100, 300, 100, 1, 50, NULL, 0, 1, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '449.50', NULL, 0, 4, '2019-06-08 18:30:00'),
(2566, 259, 3000, NULL, 1200, 300, 100, 1, 50, NULL, NULL, NULL, NULL, '', 35, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '449.50', NULL, 1, 5, '2019-06-08 18:30:00'),
(2567, 259, 3200, NULL, 1300, 300, 100, 1, 50, NULL, NULL, NULL, NULL, '', 4, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '449.50', NULL, 1, 3, '2019-06-08 18:30:00'),
(2568, 259, 101505, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 50, NULL, NULL, NULL, '2.00', NULL, NULL, NULL, NULL, '100.00', '100.00', 1, 6, '2019-06-08 18:30:00'),
(2569, 259, 1, 'Vagi Pata', NULL, NULL, 100, 3, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-06-08 18:30:00'),
(2579, 281, 100300, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '30.00', '30.00', 0, 1, '2019-06-06 16:15:00'),
(2580, 281, 100500, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '35.00', '35.00', 0, 1, '2019-06-06 16:15:00'),
(2581, 281, 101400, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '25.00', '25.00', 0, 6, '2019-06-06 16:15:00'),
(2583, 283, 100600, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, 'Mild', NULL, NULL, NULL, NULL, NULL, '40.00', '70.00', '90.00', NULL, '90.00', '90.00', 0, 1, '2019-06-08 13:00:00'),
(2593, 284, 0, NULL, 100, 300, 100, 1, 65, NULL, 3, 0, 1, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '454.35', NULL, 0, 1, '2019-06-06 18:30:00'),
(2594, 284, 600, NULL, 200, 300, 100, 1, 65, NULL, 2, 0, 0, 'M=12.5 KG', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '454.35', NULL, 0, 1, '2019-06-06 18:30:00'),
(2595, 284, 900, NULL, 300, 300, 100, 1, 65, NULL, 1, 1, 0, 'give 2 Large', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '454.35', NULL, 0, 1, '2019-06-06 18:30:00'),
(2596, 284, 1200, NULL, 400, 300, 100, 1, 65, NULL, 1, 1, 0, '2 Large', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '454.35', NULL, 0, 6, '2019-06-06 18:30:00'),
(2597, 284, 2300, NULL, 600, 300, 100, 1, 65, NULL, NULL, NULL, NULL, '', 65, 0, '0.00', '6.99', NULL, NULL, NULL, NULL, '', '454.35', NULL, 1, 2, '2019-06-06 18:30:00'),
(2598, 284, 2700, NULL, 1100, 300, 100, 1, 65, NULL, 0, 1, 1, '2 m', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '454.35', NULL, 0, 4, '2019-06-06 18:30:00'),
(2599, 284, 3000, NULL, 1200, 300, 100, 1, 65, NULL, NULL, NULL, NULL, '', 50, 4, '6.00', '6.99', NULL, NULL, NULL, NULL, '', '454.35', NULL, 1, 5, '2019-06-06 18:30:00'),
(2600, 284, 3200, NULL, 1300, 300, 100, 1, 65, NULL, NULL, NULL, NULL, '', 6, 0, '0.00', '6.99', NULL, NULL, NULL, NULL, '', '454.35', NULL, 1, 3, '2019-06-06 18:30:00'),
(2601, 284, 1, 'Ch Bir  ( M=8  R=6)', NULL, NULL, 100, 3, NULL, NULL, 0, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-06-06 18:30:00'),
(2602, 285, 100, NULL, 100, 100, 100, 1, 25, NULL, 1, 0, 1, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '187.25', NULL, 0, 1, '2019-06-06 20:00:00'),
(2603, 285, 500, NULL, 200, 100, 100, 1, 25, NULL, 1, 0, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '187.25', NULL, 0, 1, '2019-06-06 20:00:00'),
(2604, 285, 900, NULL, 300, 100, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '187.25', NULL, 0, 1, '2019-06-06 20:00:00'),
(2605, 285, 1400, NULL, 400, 100, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '187.25', NULL, 0, 6, '2019-06-06 20:00:00'),
(2606, 285, 2700, NULL, 1100, 100, 100, 1, 25, NULL, 0, 0, 1, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '187.25', NULL, 0, 4, '2019-06-06 20:00:00'),
(2607, 285, 3000, NULL, 1200, 100, 100, 1, 25, NULL, NULL, NULL, NULL, '', 18, 0, '0.00', '7.49', NULL, NULL, NULL, NULL, '', '187.25', NULL, 1, 5, '2019-06-06 20:00:00'),
(2608, 285, 3200, NULL, 1300, 100, 100, 1, 25, NULL, NULL, NULL, NULL, '', 2, 0, '0.00', '7.49', NULL, NULL, NULL, NULL, '', '187.25', NULL, 1, 3, '2019-06-06 20:00:00');
INSERT INTO `order_items` (`id`, `order_id`, `item`, `custom`, `category`, `package`, `main`, `type`, `persons`, `spice`, `tray_lg`, `tray_md`, `tray_sm`, `description`, `qty`, `extra_qty`, `extra_price`, `pkgprice`, `ctmprice`, `sm_price`, `md_price`, `lg_price`, `pkgcmt`, `total`, `d_total`, `pp`, `list`, `delivery_time`) VALUES
(2609, 245, 100600, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, 'give cold', NULL, NULL, NULL, NULL, NULL, '40.00', '70.00', '90.00', NULL, '90.00', '90.00', 0, 1, '2019-06-07 19:00:00'),
(2610, 286, 100700, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 2, '', NULL, NULL, NULL, NULL, NULL, '40.00', '50.00', '80.00', NULL, '80.00', '80.00', 0, 1, '2019-06-07 15:00:00'),
(2611, 286, 101100, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 4, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '140.00', '140.00', 0, 1, '2019-06-07 15:00:00'),
(2612, 286, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 2, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-06-07 15:00:00'),
(2613, 286, 102800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 25, NULL, NULL, NULL, '1.50', NULL, NULL, NULL, NULL, '37.50', '37.50', 1, 5, '2019-06-07 15:00:00'),
(2622, 287, 0, NULL, 100, 300, 100, 1, 120, 1, 6, 0, 0, '', NULL, NULL, NULL, '6.49', NULL, NULL, NULL, NULL, '', '778.80', NULL, 0, 1, '2019-06-08 13:00:00'),
(2623, 287, 600, NULL, 200, 300, 100, 1, 120, 1, 3, 1, 0, 'V.Less Oil', NULL, NULL, NULL, '6.49', NULL, NULL, NULL, NULL, '', '778.80', NULL, 0, 1, '2019-06-08 13:00:00'),
(2624, 287, 1000, NULL, 300, 300, 100, 1, 120, 1, 3, 0, 0, 'V.Less Oil', NULL, NULL, NULL, '6.49', NULL, NULL, NULL, NULL, '', '778.80', NULL, 0, 1, '2019-06-08 13:00:00'),
(2625, 287, 1300, NULL, 400, 300, 100, 1, 120, NULL, NULL, NULL, NULL, '', 240, 0, '0.00', '6.49', NULL, NULL, NULL, NULL, '', '778.80', NULL, 1, 6, '2019-06-08 13:00:00'),
(2626, 287, 2100, NULL, 600, 300, 100, 1, 120, NULL, NULL, NULL, NULL, '', 240, 0, '0.00', '6.49', NULL, NULL, NULL, NULL, '', '778.80', NULL, 1, 2, '2019-06-08 13:00:00'),
(2627, 287, 2700, NULL, 1100, 300, 100, 1, 120, NULL, 0, 3, 0, '', NULL, NULL, NULL, '6.49', NULL, NULL, NULL, NULL, '', '778.80', NULL, 0, 4, '2019-06-08 13:00:00'),
(2628, 287, 3100, NULL, 1200, 300, 100, 1, 120, NULL, NULL, NULL, NULL, '', 120, 0, '0.00', '6.49', NULL, NULL, NULL, NULL, '', '778.80', NULL, 1, 5, '2019-06-08 13:00:00'),
(2629, 287, 3200, NULL, 1300, 300, 100, 1, 120, NULL, NULL, NULL, NULL, '', 10, 0, '0.00', '6.49', NULL, NULL, NULL, NULL, '', '778.80', NULL, 1, 3, '2019-06-08 13:00:00'),
(2630, 287, 1, '2 POT CH. Bir (M=6 R= 4.5 ) Each', NULL, NULL, 100, 3, NULL, 1, 6, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-06-08 13:00:00'),
(2631, 288, 101400, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '25.00', '25.00', 0, 6, '2019-06-09 14:00:00'),
(2632, 289, 100900, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '35.00', '35.00', 0, 1, '2019-06-09 12:00:00'),
(2633, 289, 101400, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '25.00', '25.00', 0, 6, '2019-06-09 12:00:00'),
(2634, 290, 100600, NULL, NULL, NULL, 100, 2, NULL, NULL, 5, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '40.00', '70.00', '90.00', NULL, '450.00', '450.00', 0, 1, '2019-06-09 17:00:00'),
(2635, 290, 101400, NULL, NULL, NULL, 100, 2, NULL, NULL, 4, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '200.00', '200.00', 0, 6, '2019-06-09 17:00:00'),
(2636, 290, 101800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '3 Cut', 300, NULL, NULL, NULL, '2.50', NULL, NULL, NULL, NULL, '750.00', '750.00', 1, 2, '2019-06-09 17:00:00'),
(2637, 290, 102600, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 6, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.25', NULL, '0.00', '0.00', 0, 4, '2019-06-09 17:00:00'),
(2638, 290, 102800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 210, NULL, NULL, NULL, '1.50', NULL, NULL, NULL, NULL, '315.00', '315.00', 1, 5, '2019-06-09 17:00:00'),
(2639, 290, 1, 'Vagi Samosa  (600 PC)', NULL, NULL, 100, 3, NULL, NULL, 0, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-06-09 17:00:00'),
(2640, 290, 1, 'B/L Tikka  (55 LB)', NULL, NULL, 100, 3, NULL, NULL, 0, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-06-09 17:00:00'),
(2641, 290, 1, '2 POT Veal Puloa (M=10 R=7.5 ) Each', NULL, NULL, 100, 3, NULL, NULL, 10, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-06-09 17:00:00'),
(2642, 290, 1, 'Ch Kari (M=20 KG)', NULL, NULL, 100, 3, NULL, NULL, 0, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-06-09 17:00:00'),
(2643, 290, 1, 'Ch Pasta (M=6 KG)', NULL, NULL, 100, 3, NULL, NULL, 0, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-06-09 17:00:00'),
(2644, 290, 1, 'Fish( 3 Box)', NULL, NULL, 100, 3, NULL, NULL, 0, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-06-09 17:00:00'),
(2645, 290, 1, 'Spicila Salad', NULL, NULL, 100, 3, NULL, NULL, 0, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-06-09 17:00:00'),
(2646, 290, 1, 'Zarda( R=3.75 )', NULL, NULL, 100, 3, NULL, NULL, 3, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-06-09 17:00:00'),
(2647, 291, 100300, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '30.00', '30.00', 0, 1, '2019-06-06 20:00:00'),
(2648, 282, 101000, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '70.00', '70.00', 0, 1, '2019-06-06 15:00:00'),
(2671, 292, 100500, NULL, NULL, NULL, 100, 2, NULL, 2, 0, 2, 0, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '100.00', '100.00', 0, 1, '2019-06-07 18:00:00'),
(2672, 292, 101000, NULL, NULL, NULL, 100, 2, NULL, 2, 1, 1, 0, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '120.00', '120.00', 0, 1, '2019-06-07 18:00:00'),
(2673, 292, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 2, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-06-07 18:00:00'),
(2674, 292, 102800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 25, NULL, NULL, NULL, '1.50', NULL, NULL, NULL, NULL, '37.50', '37.50', 1, 5, '2019-06-07 18:00:00'),
(2675, 293, 200, NULL, 100, 300, 100, 1, 60, NULL, 3, 0, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '509.40', NULL, 0, 1, '2019-06-09 20:00:00'),
(2676, 293, 700, NULL, 200, 300, 100, 1, 60, NULL, 2, 0, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '509.40', NULL, 0, 1, '2019-06-09 20:00:00'),
(2677, 293, 0, NULL, 300, 300, 100, 1, 60, NULL, 1, 1, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '509.40', NULL, 0, 1, '2019-06-09 20:00:00'),
(2678, 293, 1500, NULL, 400, 300, 100, 1, 60, NULL, 1, 1, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '509.40', NULL, 0, 6, '2019-06-09 20:00:00'),
(2679, 293, 2300, NULL, 600, 300, 100, 1, 60, NULL, NULL, NULL, NULL, '', 75, 15, '37.50', '8.49', NULL, NULL, NULL, NULL, '', '509.40', NULL, 1, 2, '2019-06-09 20:00:00'),
(2680, 293, 2700, NULL, 1100, 300, 100, 1, 60, NULL, 0, 1, 1, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '509.40', NULL, 0, 4, '2019-06-09 20:00:00'),
(2681, 293, 3000, NULL, 1200, 300, 100, 1, 60, NULL, NULL, NULL, NULL, '', 45, 3, '4.50', '8.49', NULL, NULL, NULL, NULL, '', '509.40', NULL, 1, 5, '2019-06-09 20:00:00'),
(2682, 293, 3200, NULL, 1300, 300, 100, 1, 60, NULL, NULL, NULL, NULL, '', 6, 0, '0.00', '8.49', NULL, NULL, NULL, NULL, '', '509.40', NULL, 1, 3, '2019-06-09 20:00:00'),
(2684, 266, 100500, NULL, NULL, NULL, 100, 2, NULL, NULL, 2, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '140.00', '140.00', 0, 1, '2019-06-08 16:00:00'),
(2685, 265, 100500, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 2, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '140.00', '140.00', 0, 1, '2019-06-08 12:13:00'),
(2686, 270, 300, NULL, 100, 400, 100, 1, 50, NULL, 2, 0, 1, '', NULL, NULL, NULL, '9.49', NULL, NULL, NULL, NULL, '', '474.50', NULL, 0, 1, '2019-06-08 17:00:00'),
(2687, 270, 0, NULL, 300, 400, 100, 1, 50, NULL, 1, 0, 1, '', NULL, NULL, NULL, '9.49', NULL, NULL, NULL, NULL, '', '474.50', NULL, 0, 1, '2019-06-08 17:00:00'),
(2688, 270, 1200, NULL, 400, 400, 100, 1, 50, NULL, 1, 0, 1, '', NULL, NULL, NULL, '9.49', NULL, NULL, NULL, NULL, '', '474.50', NULL, 0, 6, '2019-06-08 17:00:00'),
(2689, 270, 1800, NULL, 500, 400, 100, 1, 50, NULL, 1, 0, 1, 'no garnish on top', NULL, NULL, NULL, '9.49', NULL, NULL, NULL, NULL, '', '474.50', NULL, 0, 1, '2019-06-08 17:00:00'),
(2690, 270, 2300, NULL, 600, 400, 100, 1, 50, NULL, NULL, NULL, NULL, '3 CUT', 50, 0, '0.00', '9.49', NULL, NULL, NULL, NULL, '', '474.50', NULL, 1, 2, '2019-06-08 17:00:00'),
(2691, 270, 2700, NULL, 1100, 400, 100, 1, 50, NULL, 0, 1, 0, '', NULL, NULL, NULL, '9.49', NULL, NULL, NULL, NULL, '', '474.50', NULL, 0, 4, '2019-06-08 17:00:00'),
(2692, 270, 3000, NULL, 1200, 400, 100, 1, 50, NULL, NULL, NULL, NULL, '', 35, 0, '0.00', '9.49', NULL, NULL, NULL, NULL, '', '474.50', NULL, 1, 5, '2019-06-08 17:00:00'),
(2693, 270, 3200, NULL, 1300, 400, 100, 1, 50, NULL, NULL, NULL, NULL, '', 4, 0, '0.00', '9.49', NULL, NULL, NULL, NULL, '', '474.50', NULL, 1, 3, '2019-06-08 17:00:00'),
(2694, 270, 100000, NULL, NULL, NULL, 100, 2, NULL, NULL, 2, 0, 0, 'for 50 PPL', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '120.00', '120.00', 0, 1, '2019-06-08 17:00:00'),
(2695, 270, 101600, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 1, 'for 50 PPL', NULL, NULL, NULL, NULL, NULL, '45.00', '70.00', '90.00', NULL, '135.00', '135.00', 0, 1, '2019-06-08 17:00:00'),
(2696, 270, 1, 'Dal Fry (for 50 PPL', NULL, NULL, 100, 3, NULL, NULL, 1, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-06-08 17:00:00'),
(2706, 246, 100200, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '30.00', '30.00', 0, 1, '2019-06-07 14:30:00'),
(2707, 246, 101400, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '25.00', '25.00', 0, 6, '2019-06-07 14:30:00'),
(2708, 246, 101500, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '25.00', '25.00', 0, 1, '2019-06-07 14:30:00'),
(2709, 246, 102800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 15, NULL, NULL, NULL, '1.50', NULL, NULL, NULL, NULL, '22.50', '22.50', 1, 5, '2019-06-07 14:30:00'),
(2710, 294, 100300, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '60.00', '60.00', 0, 1, '2019-06-08 13:00:00'),
(2727, 268, 100, NULL, 100, 400, 100, 1, 25, NULL, 1, 0, 1, '', NULL, NULL, NULL, '9.49', NULL, NULL, NULL, NULL, '', '237.25', NULL, 0, 1, '2019-06-08 17:05:00'),
(2728, 268, 1000, NULL, 300, 400, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '9.49', NULL, NULL, NULL, NULL, '', '237.25', NULL, 0, 1, '2019-06-08 17:05:00'),
(2729, 268, 0, NULL, 400, 400, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '9.49', NULL, NULL, NULL, NULL, '', '237.25', NULL, 0, 1, '2019-06-08 17:05:00'),
(2730, 268, 1800, NULL, 500, 400, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '9.49', NULL, NULL, NULL, NULL, '', '237.25', NULL, 0, 1, '2019-06-08 17:05:00'),
(2731, 268, 2100, NULL, 600, 400, 100, 1, 25, NULL, NULL, NULL, NULL, '', 50, 0, '0.00', '9.49', NULL, NULL, NULL, NULL, '', '237.25', NULL, 1, 2, '2019-06-08 17:05:00'),
(2732, 268, 0, NULL, 1100, 400, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '9.49', NULL, NULL, NULL, NULL, '', '237.25', NULL, 0, 1, '2019-06-08 17:05:00'),
(2733, 268, 3000, NULL, 1200, 400, 100, 1, 25, NULL, NULL, NULL, NULL, '', 18, 0, '0.00', '9.49', NULL, NULL, NULL, NULL, '', '237.25', NULL, 1, 5, '2019-06-08 17:05:00'),
(2734, 268, 3200, NULL, 1300, 400, 100, 1, 25, NULL, NULL, NULL, NULL, '', 2, 0, '0.00', '9.49', NULL, NULL, NULL, NULL, '', '237.25', NULL, 1, 3, '2019-06-08 17:05:00'),
(2735, 295, 100600, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 1, 0, '', NULL, NULL, NULL, NULL, NULL, '40.00', '70.00', '90.00', NULL, '70.00', '70.00', 0, 1, '2019-06-09 22:30:00'),
(2736, 296, 400, NULL, 100, 100, 100, 1, 50, NULL, 2, 0, 1, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '349.50', NULL, 0, 1, '2019-06-14 18:15:00'),
(2737, 296, 700, NULL, 200, 100, 100, 1, 50, NULL, 1, 1, 0, 'More Gravey', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '349.50', NULL, 0, 1, '2019-06-14 18:15:00'),
(2738, 296, 1100, NULL, 300, 100, 100, 1, 50, NULL, 1, 0, 1, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '349.50', NULL, 0, 1, '2019-06-14 18:15:00'),
(2739, 296, 0, NULL, 400, 100, 100, 1, 50, NULL, 1, 0, 1, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '349.50', NULL, 0, 1, '2019-06-14 18:15:00'),
(2740, 296, 2700, NULL, 1100, 100, 100, 1, 50, NULL, 0, 1, 0, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '349.50', NULL, 0, 4, '2019-06-14 18:15:00'),
(2741, 296, 3000, NULL, 1200, 100, 100, 1, 50, NULL, NULL, NULL, NULL, '', 35, 0, '0.00', '6.99', NULL, NULL, NULL, NULL, '', '349.50', NULL, 1, 5, '2019-06-14 18:15:00'),
(2742, 296, 3200, NULL, 1300, 100, 100, 1, 50, NULL, NULL, NULL, NULL, '', 4, 0, '0.00', '6.99', NULL, NULL, NULL, NULL, '', '349.50', NULL, 1, 3, '2019-06-14 18:15:00'),
(2743, 296, 101300, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 1, 0, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '40.00', '40.00', 0, 6, '2019-06-14 18:15:00'),
(2744, 296, 101400, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 1, 0, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '40.00', '40.00', 0, 6, '2019-06-14 18:15:00'),
(2745, 297, 100000, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '60.00', '60.00', 0, 1, '2019-06-14 14:30:00'),
(2754, 299, 200, NULL, 100, 400, 100, 1, 33, NULL, 1, 1, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '329.67', NULL, 0, 1, '2019-06-14 18:30:00'),
(2755, 299, 1000, NULL, 300, 400, 100, 1, 33, NULL, 1, 0, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '329.67', NULL, 0, 1, '2019-06-14 18:30:00'),
(2756, 299, 1400, NULL, 400, 400, 100, 1, 33, NULL, 1, 0, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '329.67', NULL, 0, 6, '2019-06-14 18:30:00'),
(2757, 299, 2000, NULL, 500, 400, 100, 1, 33, NULL, 1, 0, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '329.67', NULL, 0, 1, '2019-06-14 18:30:00'),
(2758, 299, 2200, NULL, 600, 400, 100, 1, 33, NULL, NULL, NULL, NULL, '', 33, 0, '0.00', '9.99', NULL, NULL, NULL, NULL, '', '329.67', NULL, 1, 2, '2019-06-14 18:30:00'),
(2759, 299, 2700, NULL, 1100, 400, 100, 1, 33, NULL, 0, 1, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '329.67', NULL, 0, 4, '2019-06-14 18:30:00'),
(2760, 299, 3000, NULL, 1200, 400, 100, 1, 33, NULL, NULL, NULL, NULL, '', 24, 0, '0.00', '9.99', NULL, NULL, NULL, NULL, '', '329.67', NULL, 1, 5, '2019-06-14 18:30:00'),
(2761, 299, 3200, NULL, 1300, 400, 100, 1, 33, NULL, NULL, NULL, NULL, '', 4, 0, '0.00', '9.99', NULL, NULL, NULL, NULL, '', '329.67', NULL, 1, 3, '2019-06-14 18:30:00'),
(2762, 300, 100500, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '35.00', '35.00', 0, 1, '2019-06-14 18:30:00'),
(2767, 301, 100300, NULL, NULL, NULL, 100, 2, NULL, 3, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '30.00', '30.00', 0, 1, '2019-06-14 19:30:00'),
(2768, 301, 100500, NULL, NULL, NULL, 100, 2, NULL, 3, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '35.00', '35.00', 0, 1, '2019-06-14 19:30:00'),
(2769, 301, 100600, NULL, NULL, NULL, 100, 2, NULL, 3, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '40.00', '70.00', '90.00', NULL, '40.00', '40.00', 0, 1, '2019-06-14 19:30:00'),
(2770, 301, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 1, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-06-14 19:30:00'),
(2771, 302, 1, '2 Lamb Leg', NULL, NULL, 100, 3, NULL, NULL, 0, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-06-14 21:00:00'),
(2772, 302, 1, 'Puloa Rice R=1.5', NULL, NULL, 100, 3, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-06-14 21:00:00'),
(2773, 303, 100, NULL, 100, 300, 100, 1, 25, NULL, 1, 0, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 0, 1, '2019-06-14 12:30:00'),
(2774, 303, 500, NULL, 200, 300, 100, 1, 25, NULL, 1, 0, 0, 'Pack 1 M 1 S', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 0, 1, '2019-06-14 12:30:00'),
(2775, 303, 1000, NULL, 300, 300, 100, 1, 25, NULL, 0, 1, 0, 'Pack 1 M 1 S', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 0, 1, '2019-06-14 12:30:00'),
(2776, 303, 1200, NULL, 400, 300, 100, 1, 25, NULL, 0, 1, 0, 'Pack 1 M 1 S', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 0, 6, '2019-06-14 12:30:00'),
(2777, 303, 2300, NULL, 600, 300, 100, 1, 25, NULL, NULL, NULL, NULL, 'Pack 10+3', 25, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 1, 2, '2019-06-14 12:30:00'),
(2778, 303, 2700, NULL, 1100, 300, 100, 1, 25, NULL, 0, 0, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 0, 4, '2019-06-14 12:30:00'),
(2779, 303, 3000, NULL, 1200, 300, 100, 1, 25, NULL, NULL, NULL, NULL, 'Pack 15+5', 18, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 1, 5, '2019-06-14 12:30:00'),
(2780, 303, 3200, NULL, 1300, 300, 100, 1, 25, NULL, NULL, NULL, NULL, '', 2, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 1, 3, '2019-06-14 12:30:00'),
(2781, 303, 101900, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, 'Pack 10+2', 12, NULL, NULL, NULL, '2.50', NULL, NULL, NULL, NULL, '30.00', '30.00', 1, 2, '2019-06-14 12:30:00'),
(2782, 303, 102100, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 10, NULL, NULL, NULL, '8.50', NULL, NULL, NULL, NULL, '85.00', '85.00', 1, 2, '2019-06-14 12:30:00'),
(2783, 304, 100300, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '90.00', '90.00', 0, 1, '2019-06-14 18:30:00'),
(2784, 304, 100600, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '40.00', '70.00', '90.00', NULL, '90.00', '90.00', 0, 1, '2019-06-14 18:30:00'),
(2785, 305, 0, NULL, 100, 600, 200, 1, 80, NULL, 4, 0, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '599.20', NULL, 0, 1, '2019-06-14 14:00:00'),
(2786, 305, 0, NULL, 200, 600, 200, 1, 80, NULL, 2, 0, 1, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '599.20', NULL, 0, 1, '2019-06-14 14:00:00'),
(2787, 305, 1100, NULL, 300, 600, 200, 1, 80, NULL, 2, 0, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '599.20', NULL, 0, 1, '2019-06-14 14:00:00'),
(2788, 305, 1300, NULL, 400, 600, 200, 1, 80, NULL, NULL, NULL, NULL, '', 160, 0, '0.00', '7.49', NULL, NULL, NULL, NULL, '', '599.20', NULL, 1, 6, '2019-06-14 14:00:00'),
(2789, 305, 1700, NULL, 500, 600, 200, 1, 80, NULL, 2, 0, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '599.20', NULL, 0, 1, '2019-06-14 14:00:00'),
(2790, 305, 2200, NULL, 600, 600, 200, 1, 80, NULL, NULL, NULL, NULL, '', 80, 0, '0.00', '7.49', NULL, NULL, NULL, NULL, '', '599.20', NULL, 1, 2, '2019-06-14 14:00:00'),
(2791, 305, 2600, NULL, 900, 600, 200, 1, 80, NULL, NULL, NULL, NULL, '', 0, 0, '0.00', '7.49', NULL, NULL, NULL, NULL, '', '599.20', NULL, 1, 1, '2019-06-14 14:00:00'),
(2792, 305, 0, NULL, 1100, 600, 200, 1, 80, NULL, 0, 2, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '599.20', NULL, 0, 1, '2019-06-14 14:00:00'),
(2793, 305, 0, NULL, 1200, 600, 200, 1, 80, NULL, 0, 0, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '599.20', NULL, 0, 1, '2019-06-14 14:00:00'),
(2794, 305, 3200, NULL, 1300, 600, 200, 1, 80, NULL, NULL, NULL, NULL, '', 8, 0, '0.00', '7.49', NULL, NULL, NULL, NULL, '', '599.20', NULL, 1, 3, '2019-06-14 14:00:00'),
(2795, 305, 1, 'White Rice R=6 kg Sella', NULL, NULL, 100, 3, NULL, NULL, 3, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-06-14 14:00:00'),
(2796, 306, 101710, NULL, NULL, NULL, 100, 2, NULL, NULL, 5, 0, 0, 'Half Sack', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '250.00', '250.00', 0, 1, '2019-06-15 20:15:00'),
(2797, 306, 1, '2 POT CH Qurma (22 KG Each)', NULL, NULL, 100, 3, NULL, NULL, 0, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-06-15 20:15:00'),
(2798, 306, 1, 'Yellow Zarda (5 KG)', NULL, NULL, 100, 3, NULL, NULL, 0, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-06-15 20:15:00'),
(2799, 307, 100300, NULL, NULL, NULL, 100, 2, NULL, NULL, 2, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '120.00', '120.00', 0, 1, '2019-06-15 17:00:00'),
(2800, 307, 101500, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '50.00', '50.00', 0, 1, '2019-06-15 17:00:00'),
(2801, 307, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 2, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-06-15 17:00:00'),
(2802, 308, 100, NULL, 100, 300, 100, 1, 25, NULL, 1, 0, 1, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '212.25', NULL, 0, 1, '2019-06-15 18:00:00'),
(2803, 308, 600, NULL, 200, 300, 100, 1, 25, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '212.25', NULL, 0, 1, '2019-06-15 18:00:00'),
(2804, 308, 0, NULL, 300, 300, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '212.25', NULL, 0, 1, '2019-06-15 18:00:00'),
(2805, 308, 1200, NULL, 400, 300, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '212.25', NULL, 0, 6, '2019-06-15 18:00:00'),
(2806, 308, 2300, NULL, 600, 300, 100, 1, 25, NULL, NULL, NULL, NULL, '', 25, 0, '0.00', '8.49', NULL, NULL, NULL, NULL, '', '212.25', NULL, 1, 2, '2019-06-15 18:00:00'),
(2807, 308, 2700, NULL, 1100, 300, 100, 1, 25, NULL, 0, 0, 1, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '212.25', NULL, 0, 4, '2019-06-15 18:00:00'),
(2808, 308, 3000, NULL, 1200, 300, 100, 1, 25, NULL, NULL, NULL, NULL, '', 18, 0, '0.00', '8.49', NULL, NULL, NULL, NULL, '', '212.25', NULL, 1, 5, '2019-06-15 18:00:00'),
(2809, 308, 3200, NULL, 1300, 300, 100, 1, 25, NULL, NULL, NULL, NULL, '', 2, 0, '0.00', '8.49', NULL, NULL, NULL, NULL, '', '212.25', NULL, 1, 3, '2019-06-15 18:00:00'),
(2820, 309, 400, NULL, 100, 200, 100, 1, 30, 2, 1, 0, 1, '', NULL, NULL, NULL, '7.99', NULL, NULL, NULL, NULL, '', '239.70', NULL, 0, 1, '2019-06-15 12:00:00'),
(2821, 309, 1000, NULL, 300, 200, 100, 1, 30, 2, 1, 0, 0, '', NULL, NULL, NULL, '7.99', NULL, NULL, NULL, NULL, '', '239.70', NULL, 0, 1, '2019-06-15 12:00:00'),
(2822, 309, 0, NULL, 400, 200, 100, 1, 30, NULL, 1, 0, 0, '', NULL, NULL, NULL, '7.99', NULL, NULL, NULL, NULL, '', '239.70', NULL, 0, 1, '2019-06-15 12:00:00'),
(2823, 309, 1800, NULL, 500, 200, 100, 1, 30, 2, 1, 0, 0, '', NULL, NULL, NULL, '7.99', NULL, NULL, NULL, NULL, '', '239.70', NULL, 0, 1, '2019-06-15 12:00:00'),
(2824, 309, 2700, NULL, 1100, 200, 100, 1, 30, NULL, 0, 0, 1, '', NULL, NULL, NULL, '7.99', NULL, NULL, NULL, NULL, '', '239.70', NULL, 0, 4, '2019-06-15 12:00:00'),
(2825, 309, 3000, NULL, 1200, 200, 100, 1, 30, NULL, NULL, NULL, NULL, '', 21, 0, '0.00', '7.99', NULL, NULL, NULL, NULL, '', '239.70', NULL, 1, 5, '2019-06-15 12:00:00'),
(2826, 309, 3200, NULL, 1300, 200, 100, 1, 30, NULL, NULL, NULL, NULL, '', 4, 0, '0.00', '7.99', NULL, NULL, NULL, NULL, '', '239.70', NULL, 1, 3, '2019-06-15 12:00:00'),
(2827, 309, 101400, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '25.00', '25.00', 0, 6, '2019-06-15 12:00:00'),
(2828, 309, 101500, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '25.00', '25.00', 0, 1, '2019-06-15 12:00:00'),
(2829, 309, 102200, NULL, NULL, NULL, 100, 2, NULL, 2, NULL, NULL, NULL, '', 15, NULL, NULL, NULL, '7.50', NULL, NULL, NULL, NULL, '112.50', '112.50', 1, 2, '2019-06-15 12:00:00'),
(2831, 310, 1, 'Dum Qeema', NULL, NULL, 100, 3, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-06-15 14:00:00'),
(2832, 311, 100300, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '60.00', '60.00', 0, 1, '2019-06-15 12:00:00'),
(2833, 311, 101700, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '35.00', '35.00', 0, 1, '2019-06-15 12:00:00'),
(2834, 311, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 1, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-06-15 12:00:00'),
(2835, 312, 100, NULL, 100, 600, 200, 1, 30, NULL, 1, 0, 1, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '299.70', NULL, 0, 1, '2019-06-15 16:00:00'),
(2836, 312, 0, NULL, 200, 600, 200, 1, 30, NULL, 1, 0, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '299.70', NULL, 0, 1, '2019-06-15 16:00:00'),
(2837, 312, 0, NULL, 300, 600, 200, 1, 30, NULL, 1, 0, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '299.70', NULL, 0, 1, '2019-06-15 16:00:00'),
(2838, 312, 1200, NULL, 400, 600, 200, 1, 30, NULL, 1, 0, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '299.70', NULL, 0, 6, '2019-06-15 16:00:00'),
(2839, 312, 1900, NULL, 500, 600, 200, 1, 30, NULL, 1, 0, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '299.70', NULL, 0, 1, '2019-06-15 16:00:00'),
(2840, 312, 2300, NULL, 600, 600, 200, 1, 30, NULL, NULL, NULL, NULL, '', 30, 0, '0.00', '9.99', NULL, NULL, NULL, NULL, '', '299.70', NULL, 1, 2, '2019-06-15 16:00:00'),
(2841, 312, 2500, NULL, 900, 600, 200, 1, 30, NULL, 1, 0, 0, 'only M', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '299.70', NULL, 0, 1, '2019-06-15 16:00:00'),
(2842, 312, 0, NULL, 1100, 600, 200, 1, 30, NULL, 0, 0, 1, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '299.70', NULL, 0, 1, '2019-06-15 16:00:00'),
(2843, 312, 3000, NULL, 1200, 600, 200, 1, 30, NULL, NULL, NULL, NULL, '', 21, 0, '0.00', '9.99', NULL, NULL, NULL, NULL, '', '299.70', NULL, 1, 5, '2019-06-15 16:00:00'),
(2844, 312, 3200, NULL, 1300, 600, 200, 1, 30, NULL, NULL, NULL, NULL, '', 4, 0, '0.00', '9.99', NULL, NULL, NULL, NULL, '', '299.70', NULL, 1, 3, '2019-06-15 16:00:00'),
(2845, 312, 100800, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 1, 0, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '50.00', '50.00', 0, 1, '2019-06-15 16:00:00'),
(2846, 312, 101600, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '45.00', '70.00', '90.00', NULL, '45.00', '45.00', 0, 1, '2019-06-15 16:00:00'),
(2869, 314, 100600, NULL, NULL, NULL, 100, 2, NULL, NULL, 2, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '40.00', '70.00', '90.00', NULL, '180.00', '180.00', 0, 1, '2019-06-15 12:00:00'),
(2870, 314, 101800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 70, NULL, NULL, NULL, '2.50', NULL, NULL, NULL, NULL, '175.00', '175.00', 1, 2, '2019-06-15 12:00:00'),
(2871, 314, 102000, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 3, NULL, NULL, NULL, '3.50', NULL, NULL, NULL, NULL, '10.50', '10.50', 1, 2, '2019-06-15 12:00:00'),
(2872, 314, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 5, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-06-15 12:00:00'),
(2873, 314, 102800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 60, NULL, NULL, NULL, '1.50', NULL, NULL, NULL, NULL, '90.00', '90.00', 1, 5, '2019-06-15 12:00:00'),
(2874, 314, 1, 'Whole Ch Tikka(M=8 whole ch. 14 PC Cut)', NULL, NULL, 100, 3, NULL, NULL, 0, 0, 0, '8 Whole Ch 14 PC cut', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-06-15 12:00:00'),
(2875, 314, 1, 'Veal Aloo Biryani (M=6 R= 4.5)', NULL, NULL, 100, 3, NULL, NULL, 0, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-06-15 12:00:00'),
(2884, 315, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, 'Cucumbeer+tomato +onion', 8, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-06-14 17:00:00'),
(2885, 315, 1, '2 POT Veal Aloo Bir( M=7.75 R-4.25)', NULL, NULL, 100, 3, NULL, NULL, 6, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-06-14 17:00:00'),
(2886, 316, 400, NULL, 100, 500, 200, 1, 100, NULL, 5, 0, 0, '', NULL, NULL, NULL, '10.49', NULL, NULL, NULL, NULL, '', '1049.00', NULL, 0, 1, '2019-06-16 12:15:00'),
(2887, 316, 500, NULL, 200, 500, 200, 1, 100, NULL, 3, 0, 0, '', NULL, NULL, NULL, '10.49', NULL, NULL, NULL, NULL, '', '1049.00', NULL, 0, 1, '2019-06-16 12:15:00'),
(2888, 316, 1100, NULL, 300, 500, 200, 1, 100, NULL, 2, 1, 0, '', NULL, NULL, NULL, '10.49', NULL, NULL, NULL, NULL, '', '1049.00', NULL, 0, 1, '2019-06-16 12:15:00'),
(2889, 316, 1200, NULL, 400, 500, 200, 1, 100, NULL, 2, 1, 0, '', NULL, NULL, NULL, '10.49', NULL, NULL, NULL, NULL, '', '1049.00', NULL, 0, 6, '2019-06-16 12:15:00'),
(2890, 316, 2300, NULL, 600, 500, 200, 1, 100, NULL, NULL, NULL, NULL, '', 100, 0, '0.00', '10.49', NULL, NULL, NULL, NULL, '', '1049.00', NULL, 1, 2, '2019-06-16 12:15:00'),
(2891, 316, 2500, NULL, 900, 500, 200, 1, 100, NULL, 2, 1, 0, '', NULL, NULL, NULL, '10.49', NULL, NULL, NULL, NULL, '', '1049.00', NULL, 0, 1, '2019-06-16 12:15:00'),
(2892, 316, 2700, NULL, 1100, 500, 200, 1, 100, NULL, 0, 2, 1, '', NULL, NULL, NULL, '10.49', NULL, NULL, NULL, NULL, '', '1049.00', NULL, 0, 4, '2019-06-16 12:15:00'),
(2893, 316, 3000, NULL, 1200, 500, 200, 1, 100, NULL, NULL, NULL, NULL, '', 70, 0, '0.00', '10.49', NULL, NULL, NULL, NULL, '', '1049.00', NULL, 1, 5, '2019-06-16 12:15:00'),
(2894, 316, 3200, NULL, 1300, 500, 200, 1, 100, NULL, NULL, NULL, NULL, '', 8, 0, '0.00', '10.49', NULL, NULL, NULL, NULL, '', '1049.00', NULL, 1, 3, '2019-06-16 12:15:00'),
(2895, 317, 400, NULL, 100, 100, 100, 1, 50, NULL, 2, 0, 1, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '374.50', NULL, 0, 1, '2019-06-16 13:15:00'),
(2896, 317, 800, NULL, 200, 100, 100, 1, 50, NULL, 1, 1, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '374.50', NULL, 0, 1, '2019-06-16 13:15:00'),
(2897, 317, 1000, NULL, 300, 100, 100, 1, 50, NULL, 1, 0, 1, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '374.50', NULL, 0, 1, '2019-06-16 13:15:00'),
(2898, 317, 1200, NULL, 400, 100, 100, 1, 50, NULL, 1, 0, 1, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '374.50', NULL, 0, 6, '2019-06-16 13:15:00'),
(2899, 317, 2700, NULL, 1100, 100, 100, 1, 50, NULL, 0, 1, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '374.50', NULL, 0, 4, '2019-06-16 13:15:00'),
(2900, 317, 3000, NULL, 1200, 100, 100, 1, 50, NULL, NULL, NULL, NULL, '', 35, 0, '0.00', '7.49', NULL, NULL, NULL, NULL, '', '374.50', NULL, 1, 5, '2019-06-16 13:15:00'),
(2901, 317, 3200, NULL, 1300, 100, 100, 1, 50, NULL, NULL, NULL, NULL, '', 4, 0, '0.00', '7.49', NULL, NULL, NULL, NULL, '', '374.50', NULL, 1, 3, '2019-06-16 13:15:00'),
(2902, 318, 100, NULL, 100, 400, 100, 1, 65, NULL, 3, 0, 1, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '649.35', NULL, 0, 1, '2019-06-16 12:30:00'),
(2903, 318, 1000, NULL, 300, 400, 100, 1, 65, NULL, 1, 1, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '649.35', NULL, 0, 1, '2019-06-16 12:30:00'),
(2904, 318, 1200, NULL, 400, 400, 100, 1, 65, NULL, 1, 1, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '649.35', NULL, 0, 6, '2019-06-16 12:30:00'),
(2905, 318, 1700, NULL, 500, 400, 100, 1, 65, NULL, 1, 1, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '649.35', NULL, 0, 1, '2019-06-16 12:30:00'),
(2906, 318, 2100, NULL, 600, 400, 100, 1, 65, NULL, NULL, NULL, NULL, '', 130, 0, '0.00', '9.99', NULL, NULL, NULL, NULL, '', '649.35', NULL, 1, 2, '2019-06-16 12:30:00'),
(2907, 318, 2700, NULL, 1100, 400, 100, 1, 65, NULL, 0, 1, 1, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '649.35', NULL, 0, 4, '2019-06-16 12:30:00'),
(2908, 318, 3000, NULL, 1200, 400, 100, 1, 65, NULL, NULL, NULL, NULL, '', 46, 0, '0.00', '9.99', NULL, NULL, NULL, NULL, '', '649.35', NULL, 1, 5, '2019-06-16 12:30:00'),
(2909, 318, 3200, NULL, 1300, 400, 100, 1, 65, NULL, NULL, NULL, NULL, '', 6, 0, '0.00', '9.99', NULL, NULL, NULL, NULL, '', '649.35', NULL, 1, 3, '2019-06-16 12:30:00'),
(2910, 319, 100500, NULL, NULL, NULL, 100, 2, NULL, NULL, 2, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '140.00', '140.00', 0, 1, '2019-06-16 19:00:00'),
(2911, 319, 101400, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '25.00', '25.00', 0, 6, '2019-06-16 19:00:00'),
(2912, 320, 100, NULL, 100, 100, 100, 1, 30, NULL, 1, 0, 1, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '224.70', NULL, 0, 1, '2019-06-16 13:30:00'),
(2913, 320, 800, NULL, 200, 100, 100, 1, 30, NULL, 1, 0, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '224.70', NULL, 0, 1, '2019-06-16 13:30:00'),
(2914, 320, 1000, NULL, 300, 100, 100, 1, 30, NULL, 1, 0, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '224.70', NULL, 0, 1, '2019-06-16 13:30:00'),
(2915, 320, 1200, NULL, 400, 100, 100, 1, 30, NULL, 1, 0, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '224.70', NULL, 0, 6, '2019-06-16 13:30:00'),
(2916, 320, 2700, NULL, 1100, 100, 100, 1, 30, NULL, 0, 0, 1, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '224.70', NULL, 0, 4, '2019-06-16 13:30:00'),
(2917, 320, 3000, NULL, 1200, 100, 100, 1, 30, NULL, NULL, NULL, NULL, '', 21, 0, '0.00', '7.49', NULL, NULL, NULL, NULL, '', '224.70', NULL, 1, 5, '2019-06-16 13:30:00'),
(2918, 320, 3200, NULL, 1300, 100, 100, 1, 30, NULL, NULL, NULL, NULL, '', 4, 0, '0.00', '7.49', NULL, NULL, NULL, NULL, '', '224.70', NULL, 1, 3, '2019-06-16 13:30:00'),
(2919, 321, 400, NULL, 100, 100, 100, 1, 60, NULL, 3, 0, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '449.40', NULL, 0, 1, '2019-06-16 13:15:00'),
(2920, 321, 500, NULL, 200, 100, 100, 1, 60, NULL, 2, 0, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '449.40', NULL, 0, 1, '2019-06-16 13:15:00'),
(2921, 321, 1000, NULL, 300, 100, 100, 1, 60, NULL, 1, 1, 0, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '449.40', NULL, 0, 1, '2019-06-16 13:15:00'),
(2922, 321, 1300, NULL, 400, 100, 100, 1, 60, NULL, NULL, NULL, NULL, '', 120, 0, '0.00', '7.49', NULL, NULL, NULL, NULL, '', '449.40', NULL, 1, 6, '2019-06-16 13:15:00'),
(2923, 321, 2700, NULL, 1100, 100, 100, 1, 60, NULL, 0, 1, 1, '', NULL, NULL, NULL, '7.49', NULL, NULL, NULL, NULL, '', '449.40', NULL, 0, 4, '2019-06-16 13:15:00'),
(2924, 321, 3000, NULL, 1200, 100, 100, 1, 60, NULL, NULL, NULL, NULL, '', 42, 0, '0.00', '7.49', NULL, NULL, NULL, NULL, '', '449.40', NULL, 1, 5, '2019-06-16 13:15:00'),
(2925, 321, 3200, NULL, 1300, 100, 100, 1, 60, NULL, NULL, NULL, NULL, '', 6, 0, '0.00', '7.49', NULL, NULL, NULL, NULL, '', '449.40', NULL, 1, 3, '2019-06-16 13:15:00'),
(2926, 321, 100700, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '40.00', '50.00', '80.00', NULL, '40.00', '40.00', 0, 1, '2019-06-16 13:15:00'),
(2927, 321, 101600, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, 'NO green Papper', NULL, NULL, NULL, NULL, NULL, '45.00', '70.00', '90.00', NULL, '45.00', '45.00', 0, 1, '2019-06-16 13:15:00'),
(2936, 323, 100, NULL, 100, 300, 100, 1, 25, NULL, 1, 0, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 0, 1, '2019-06-16 16:30:00'),
(2937, 323, 600, NULL, 200, 300, 100, 1, 25, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 0, 1, '2019-06-16 16:30:00'),
(2938, 323, 1100, NULL, 300, 300, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 0, 1, '2019-06-16 16:30:00'),
(2939, 323, 1400, NULL, 400, 300, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 0, 6, '2019-06-16 16:30:00'),
(2940, 323, 2100, NULL, 600, 300, 100, 1, 25, NULL, NULL, NULL, NULL, '', 50, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 1, 2, '2019-06-16 16:30:00'),
(2941, 323, 2700, NULL, 1100, 300, 100, 1, 25, NULL, 0, 0, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 0, 4, '2019-06-16 16:30:00'),
(2942, 323, 3000, NULL, 1200, 300, 100, 1, 25, NULL, NULL, NULL, NULL, '', 23, 5, '7.50', '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 1, 5, '2019-06-16 16:30:00'),
(2943, 323, 3200, NULL, 1300, 300, 100, 1, 25, NULL, NULL, NULL, NULL, '', 2, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '224.75', NULL, 1, 3, '2019-06-16 16:30:00'),
(2944, 324, 100500, NULL, NULL, NULL, 100, 2, NULL, NULL, 2, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '140.00', '140.00', 0, 1, '2019-06-16 14:00:00'),
(2945, 324, 101710, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '50.00', '50.00', 0, 1, '2019-06-16 14:00:00'),
(2946, 324, 102800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 20, NULL, NULL, NULL, '1.50', NULL, NULL, NULL, NULL, '30.00', '30.00', 1, 5, '2019-06-16 14:00:00'),
(2947, 325, 100600, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '40.00', '70.00', '90.00', NULL, '90.00', '90.00', 0, 1, '2019-06-16 11:30:00'),
(2948, 325, 102000, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 25, NULL, NULL, NULL, '3.50', NULL, NULL, NULL, NULL, '87.50', '87.50', 1, 2, '2019-06-16 11:30:00'),
(2949, 326, 300, NULL, 100, 300, 100, 1, 90, NULL, 4, 0, 1, '', NULL, NULL, NULL, '6.49', NULL, NULL, NULL, NULL, '', '584.10', NULL, 0, 1, '2019-06-16 17:00:00'),
(2950, 326, 0, NULL, 200, 300, 100, 1, 90, NULL, 2, 1, 0, '', NULL, NULL, NULL, '6.49', NULL, NULL, NULL, NULL, '', '584.10', NULL, 0, 1, '2019-06-16 17:00:00'),
(2951, 326, 0, NULL, 300, 300, 100, 1, 90, NULL, 2, 0, 1, '', NULL, NULL, NULL, '6.49', NULL, NULL, NULL, NULL, '', '584.10', NULL, 0, 1, '2019-06-16 17:00:00'),
(2952, 326, 1200, NULL, 400, 300, 100, 1, 90, NULL, 2, 0, 1, '', NULL, NULL, NULL, '6.49', NULL, NULL, NULL, NULL, '', '584.10', NULL, 0, 6, '2019-06-16 17:00:00'),
(2953, 326, 2100, NULL, 600, 300, 100, 1, 90, NULL, NULL, NULL, NULL, '', 180, 0, '0.00', '6.49', NULL, NULL, NULL, NULL, '', '584.10', NULL, 1, 2, '2019-06-16 17:00:00'),
(2954, 326, 2700, NULL, 1100, 300, 100, 1, 90, NULL, 0, 2, 0, '', NULL, NULL, NULL, '6.49', NULL, NULL, NULL, NULL, '', '584.10', NULL, 0, 4, '2019-06-16 17:00:00'),
(2955, 326, 3000, NULL, 1200, 300, 100, 1, 90, NULL, NULL, NULL, NULL, '', 63, 0, '0.00', '6.49', NULL, NULL, NULL, NULL, '', '584.10', NULL, 1, 5, '2019-06-16 17:00:00'),
(2956, 326, 3200, NULL, 1300, 300, 100, 1, 90, NULL, NULL, NULL, NULL, '', 8, 0, '0.00', '6.49', NULL, NULL, NULL, NULL, '', '584.10', NULL, 1, 3, '2019-06-16 17:00:00'),
(2957, 326, 1, 'Mutton Qurma', NULL, NULL, 100, 3, NULL, NULL, 0, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-06-16 17:00:00'),
(2958, 327, 200, NULL, 100, 100, 100, 1, 65, NULL, 3, 0, 1, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '454.35', NULL, 0, 1, '2019-06-16 14:00:00'),
(2959, 327, 700, NULL, 200, 100, 100, 1, 65, NULL, 2, 0, 0, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '454.35', NULL, 0, 1, '2019-06-16 14:00:00'),
(2960, 327, 900, NULL, 300, 100, 100, 1, 65, NULL, 1, 1, 0, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '454.35', NULL, 0, 1, '2019-06-16 14:00:00'),
(2961, 327, 1200, NULL, 400, 100, 100, 1, 65, NULL, 1, 1, 0, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '454.35', NULL, 0, 6, '2019-06-16 14:00:00'),
(2962, 327, 2700, NULL, 1100, 100, 100, 1, 65, NULL, 0, 1, 1, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '454.35', NULL, 0, 4, '2019-06-16 14:00:00'),
(2963, 327, 3100, NULL, 1200, 100, 100, 1, 65, NULL, NULL, NULL, NULL, '', 65, 0, '0.00', '6.99', NULL, NULL, NULL, NULL, '', '454.35', NULL, 1, 5, '2019-06-16 14:00:00'),
(2964, 327, 3200, NULL, 1300, 100, 100, 1, 65, NULL, NULL, NULL, NULL, '', 6, 0, '0.00', '6.99', NULL, NULL, NULL, NULL, '', '454.35', NULL, 1, 3, '2019-06-16 14:00:00'),
(2965, 328, 100000, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '30.00', '30.00', 0, 1, '2019-06-16 12:30:00'),
(2966, 328, 100900, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 1, 0, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '50.00', '50.00', 0, 1, '2019-06-16 12:30:00'),
(2967, 328, 101100, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 1, 0, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '50.00', '50.00', 0, 1, '2019-06-16 12:30:00'),
(2968, 328, 101200, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '25.00', '25.00', 0, 6, '2019-06-16 12:30:00'),
(2969, 328, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 1, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-06-16 12:30:00'),
(2970, 329, 200, NULL, 100, 400, 100, 1, 25, NULL, 1, 0, 1, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '249.75', NULL, 0, 1, '2019-06-16 17:00:00'),
(2971, 329, 1100, NULL, 300, 400, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '249.75', NULL, 0, 1, '2019-06-16 17:00:00'),
(2972, 329, 1200, NULL, 400, 400, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '249.75', NULL, 0, 6, '2019-06-16 17:00:00'),
(2973, 329, 1800, NULL, 500, 400, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '249.75', NULL, 0, 1, '2019-06-16 17:00:00'),
(2974, 329, 2300, NULL, 600, 400, 100, 1, 25, NULL, NULL, NULL, NULL, '', 25, 0, '0.00', '9.99', NULL, NULL, NULL, NULL, '', '249.75', NULL, 1, 2, '2019-06-16 17:00:00'),
(2975, 329, 2700, NULL, 1100, 400, 100, 1, 25, NULL, 0, 0, 1, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '249.75', NULL, 0, 4, '2019-06-16 17:00:00'),
(2976, 329, 3000, NULL, 1200, 400, 100, 1, 25, NULL, NULL, NULL, NULL, '', 18, 0, '0.00', '9.99', NULL, NULL, NULL, NULL, '', '249.75', NULL, 1, 5, '2019-06-16 17:00:00'),
(2977, 329, 3200, NULL, 1300, 400, 100, 1, 25, NULL, NULL, NULL, NULL, '', 2, 0, '0.00', '9.99', NULL, NULL, NULL, NULL, '', '249.75', NULL, 1, 3, '2019-06-16 17:00:00'),
(2978, 330, 100400, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '60.00', '60.00', 0, 1, '2019-06-07 18:00:00'),
(2979, 330, 100900, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '35.00', '35.00', 0, 1, '2019-06-07 18:00:00'),
(2980, 330, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 1, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-06-07 18:00:00'),
(2981, 330, 102800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 10, NULL, NULL, NULL, '1.50', NULL, NULL, NULL, NULL, '15.00', '15.00', 1, 5, '2019-06-07 18:00:00'),
(2982, 331, 100600, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '40.00', '70.00', '90.00', NULL, '40.00', '40.00', 0, 1, '2019-06-16 12:03:00'),
(2983, 331, 102300, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 20, NULL, NULL, NULL, '7.50', NULL, NULL, NULL, NULL, '150.00', '150.00', 1, 2, '2019-06-16 12:03:00'),
(2984, 332, 100400, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '60.00', '60.00', 0, 1, '2019-06-16 12:00:00'),
(2985, 332, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 1, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-06-16 12:00:00'),
(2986, 333, 101100, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '70.00', '70.00', 0, 1, '2019-06-15 15:00:00'),
(2987, 333, 101600, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '45.00', '70.00', '90.00', NULL, '45.00', '45.00', 0, 1, '2019-06-15 15:00:00'),
(2988, 333, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 1, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-06-15 15:00:00'),
(2989, 334, 101000, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '35.00', '35.00', 0, 1, '2019-06-15 15:00:00'),
(2990, 334, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 1, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-06-15 15:00:00'),
(2991, 335, 400, NULL, 100, 600, 200, 1, 80, NULL, 4, 0, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '799.20', NULL, 0, 1, '2019-06-15 16:30:00'),
(2992, 335, 600, NULL, 200, 600, 200, 1, 80, NULL, 2, 0, 1, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '799.20', NULL, 0, 1, '2019-06-15 16:30:00'),
(2993, 335, 1000, NULL, 300, 600, 200, 1, 80, NULL, 2, 0, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '799.20', NULL, 0, 1, '2019-06-15 16:30:00'),
(2994, 335, 1200, NULL, 400, 600, 200, 1, 80, NULL, 2, 0, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '799.20', NULL, 0, 6, '2019-06-15 16:30:00'),
(2995, 335, 0, NULL, 500, 600, 200, 1, 80, NULL, 2, 0, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '799.20', NULL, 0, 1, '2019-06-15 16:30:00'),
(2996, 335, 2300, NULL, 600, 600, 200, 1, 80, NULL, NULL, NULL, NULL, 'Pack 40+40', 80, 0, '0.00', '9.99', NULL, NULL, NULL, NULL, '', '799.20', NULL, 1, 2, '2019-06-15 16:30:00'),
(2997, 335, 2500, NULL, 900, 600, 200, 1, 80, NULL, 2, 0, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '799.20', NULL, 0, 1, '2019-06-15 16:30:00'),
(2998, 335, 2700, NULL, 1100, 600, 200, 1, 80, NULL, 0, 2, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '799.20', NULL, 0, 4, '2019-06-15 16:30:00'),
(2999, 335, 3000, NULL, 1200, 600, 200, 1, 80, NULL, NULL, NULL, NULL, '', 56, 0, '0.00', '9.99', NULL, NULL, NULL, NULL, '', '799.20', NULL, 1, 5, '2019-06-15 16:30:00'),
(3000, 335, 3200, NULL, 1300, 600, 200, 1, 80, NULL, NULL, NULL, NULL, '', 8, 0, '0.00', '9.99', NULL, NULL, NULL, NULL, '', '799.20', NULL, 1, 3, '2019-06-15 16:30:00'),
(3001, 335, 1, 'B/L ch Kari M= 8 KG)', NULL, NULL, 100, 3, NULL, NULL, 0, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-06-15 16:30:00'),
(3002, 336, 101400, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '25.00', '25.00', 0, 6, '2019-06-16 17:00:00'),
(3003, 337, 101600, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 1, 1, 'M Spicy S mild', NULL, NULL, NULL, NULL, NULL, '45.00', '70.00', '90.00', NULL, '115.00', '115.00', 0, 1, '2019-06-14 12:30:00'),
(3004, 322, 100, NULL, 100, 300, 100, 1, 30, NULL, 1, 0, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '269.70', NULL, 0, 1, '2019-06-16 18:00:00'),
(3005, 322, 600, NULL, 200, 300, 100, 1, 30, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '269.70', NULL, 0, 1, '2019-06-16 18:00:00'),
(3006, 322, 1000, NULL, 300, 300, 100, 1, 30, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '269.70', NULL, 0, 1, '2019-06-16 18:00:00'),
(3007, 322, 1200, NULL, 400, 300, 100, 1, 30, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '269.70', NULL, 0, 6, '2019-06-16 18:00:00'),
(3008, 322, 2300, NULL, 600, 300, 100, 1, 30, NULL, NULL, NULL, NULL, '', 30, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '269.70', NULL, 1, 2, '2019-06-16 18:00:00'),
(3009, 322, 2700, NULL, 1100, 300, 100, 1, 30, NULL, 0, 0, 1, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '269.70', NULL, 0, 4, '2019-06-16 18:00:00'),
(3010, 322, 3000, NULL, 1200, 300, 100, 1, 30, NULL, NULL, NULL, NULL, '', 21, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '269.70', NULL, 1, 5, '2019-06-16 18:00:00'),
(3011, 322, 3200, NULL, 1300, 300, 100, 1, 30, NULL, NULL, NULL, NULL, '', 4, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '269.70', NULL, 1, 3, '2019-06-16 18:00:00'),
(3012, 338, 100200, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '30.00', '30.00', 0, 1, '2019-06-16 13:00:00'),
(3013, 338, 101000, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '35.00', '35.00', 0, 1, '2019-06-16 13:00:00');
INSERT INTO `order_items` (`id`, `order_id`, `item`, `custom`, `category`, `package`, `main`, `type`, `persons`, `spice`, `tray_lg`, `tray_md`, `tray_sm`, `description`, `qty`, `extra_qty`, `extra_price`, `pkgprice`, `ctmprice`, `sm_price`, `md_price`, `lg_price`, `pkgcmt`, `total`, `d_total`, `pp`, `list`, `delivery_time`) VALUES
(3014, 338, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 1, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-06-16 13:00:00'),
(3015, 313, 400, NULL, 100, 400, 100, 1, 150, 1, 7, 0, 1, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '1498.50', NULL, 0, 1, '2019-06-15 20:30:00'),
(3016, 313, 1000, NULL, 300, 400, 100, 1, 150, 1, 4, 0, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '1498.50', NULL, 0, 1, '2019-06-15 20:30:00'),
(3017, 313, 1200, NULL, 400, 400, 100, 1, 150, 1, 4, 0, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '1498.50', NULL, 0, 6, '2019-06-15 20:30:00'),
(3018, 313, 2000, NULL, 500, 400, 100, 1, 150, 1, 4, 0, 0, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '1498.50', NULL, 0, 1, '2019-06-15 20:30:00'),
(3019, 313, 2100, NULL, 600, 400, 100, 1, 150, 1, NULL, NULL, NULL, '', 300, 0, '0.00', '9.99', NULL, NULL, NULL, NULL, '', '1498.50', NULL, 1, 2, '2019-06-15 20:30:00'),
(3020, 313, 2700, NULL, 1100, 400, 100, 1, 150, NULL, 0, 3, 1, '', NULL, NULL, NULL, '9.99', NULL, NULL, NULL, NULL, '', '1498.50', NULL, 0, 4, '2019-06-15 20:30:00'),
(3021, 313, 3000, NULL, 1200, 400, 100, 1, 150, NULL, NULL, NULL, NULL, '', 105, 0, '0.00', '9.99', NULL, NULL, NULL, NULL, '', '1498.50', NULL, 1, 5, '2019-06-15 20:30:00'),
(3022, 313, 3200, NULL, 1300, 400, 100, 1, 150, NULL, NULL, NULL, NULL, '', 12, 0, '0.00', '9.99', NULL, NULL, NULL, NULL, '', '1498.50', NULL, 1, 3, '2019-06-15 20:30:00'),
(3023, 339, 300, NULL, 100, 100, 100, 1, 100, NULL, 5, 0, 0, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '699.00', NULL, 0, 1, '2019-06-16 17:30:00'),
(3024, 339, 600, NULL, 200, 100, 100, 1, 100, NULL, 3, 0, 0, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '699.00', NULL, 0, 1, '2019-06-16 17:30:00'),
(3025, 339, 0, NULL, 300, 100, 100, 1, 100, NULL, 2, 1, 0, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '699.00', NULL, 0, 1, '2019-06-16 17:30:00'),
(3026, 339, 1200, NULL, 400, 100, 100, 1, 100, NULL, 2, 1, 0, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '699.00', NULL, 0, 6, '2019-06-16 17:30:00'),
(3027, 339, 2700, NULL, 1100, 100, 100, 1, 100, NULL, 0, 2, 1, '', NULL, NULL, NULL, '6.99', NULL, NULL, NULL, NULL, '', '699.00', NULL, 0, 4, '2019-06-16 17:30:00'),
(3028, 339, 3000, NULL, 1200, 100, 100, 1, 100, NULL, NULL, NULL, NULL, '', 70, 0, '0.00', '6.99', NULL, NULL, NULL, NULL, '', '699.00', NULL, 1, 5, '2019-06-16 17:30:00'),
(3029, 339, 3200, NULL, 1300, 100, 100, 1, 100, NULL, NULL, NULL, NULL, '', 8, 0, '0.00', '6.99', NULL, NULL, NULL, NULL, '', '699.00', NULL, 1, 3, '2019-06-16 17:30:00'),
(3030, 339, 100500, NULL, NULL, NULL, 100, 2, NULL, NULL, 3, 0, 1, 'For 100 PPL', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '245.00', '245.00', 0, 1, '2019-06-16 17:30:00'),
(3068, 340, 101400, NULL, NULL, NULL, 100, 2, NULL, NULL, 4, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '200.00', '200.00', 0, 6, '2019-06-15 17:30:00'),
(3069, 340, 101500, NULL, NULL, NULL, 100, 2, NULL, NULL, 4, 0, 0, '5 KG Rice', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '200.00', '200.00', 0, 1, '2019-06-15 17:30:00'),
(3070, 340, 101710, NULL, NULL, NULL, 100, 2, NULL, NULL, 4, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '200.00', '200.00', 0, 1, '2019-06-15 17:30:00'),
(3071, 340, 101715, NULL, NULL, NULL, 100, 2, NULL, NULL, 2, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '25.00', '40.00', '50.00', NULL, '100.00', '100.00', 0, 1, '2019-06-15 17:30:00'),
(3072, 340, 101900, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 280, NULL, NULL, NULL, '2.50', NULL, NULL, NULL, NULL, '700.00', '700.00', 1, 2, '2019-06-15 17:30:00'),
(3073, 340, 102000, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 93, NULL, NULL, NULL, '3.50', NULL, NULL, NULL, NULL, '325.50', '325.50', 1, 2, '2019-06-15 17:30:00'),
(3074, 340, 102700, NULL, NULL, NULL, 100, 2, NULL, NULL, 4, 0, 0, '1 Bin', NULL, NULL, NULL, NULL, NULL, '10.00', '15.00', '20.00', NULL, '80.00', '80.00', 0, 4, '2019-06-15 17:30:00'),
(3075, 340, 102800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 220, NULL, NULL, NULL, '1.50', NULL, NULL, NULL, NULL, '330.00', '330.00', 1, 5, '2019-06-15 17:30:00'),
(3076, 340, 1, 'Bean Sald', NULL, NULL, 100, 3, NULL, NULL, 0, 0, 0, '1 Bin', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-06-15 17:30:00'),
(3077, 340, 1, 'Macroni Sald', NULL, NULL, 100, 3, NULL, NULL, 0, 0, 0, '1 Bin', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-06-15 17:30:00'),
(3078, 340, 1, 'Namkeen Gosh (50 KG)', NULL, NULL, 100, 3, NULL, NULL, 0, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-06-15 17:30:00'),
(3079, 340, 1, 'Vagi Samosa (1 Box +20 PC.', NULL, NULL, 100, 3, NULL, NULL, 0, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-06-15 17:30:00'),
(3080, 340, 1, 'Fish (2 Box)', NULL, NULL, 100, 3, NULL, NULL, 0, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-06-15 17:30:00'),
(3081, 340, 1, 'Mix Vagi Fried', NULL, NULL, 100, 3, NULL, NULL, 4, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-06-15 17:30:00'),
(3082, 340, 1, 'Dum Qeema (35 Lb)', NULL, NULL, 100, 3, NULL, NULL, 0, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-06-15 17:30:00'),
(3083, 340, 1, '2 POT Ch Qurma (14 KG0 Each', NULL, NULL, 100, 3, NULL, NULL, 0, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-06-15 17:30:00'),
(3084, 340, 1, 'Ch Biy (M=12 R=7.5)', NULL, NULL, 100, 3, NULL, NULL, 5, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-06-15 17:30:00'),
(3085, 340, 1, 'Veal Puloa (m=12 R=7.5)', NULL, NULL, 100, 3, NULL, NULL, 5, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-06-15 17:30:00'),
(3086, 340, 1, 'Veal Kari M-25 KG)', NULL, NULL, 100, 3, NULL, NULL, 0, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '0.00', '0.00', '0.00', NULL, '0.00', '0.00', 0, 1, '2019-06-15 17:30:00'),
(3087, 298, 200, NULL, 100, 300, 100, 1, 35, NULL, 1, 1, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '314.65', NULL, 0, 1, '2019-06-14 20:30:00'),
(3088, 298, 700, NULL, 200, 300, 100, 1, 35, NULL, 1, 0, 0, 'More Gravey', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '314.65', NULL, 0, 1, '2019-06-14 20:30:00'),
(3089, 298, 900, NULL, 300, 300, 100, 1, 35, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '314.65', NULL, 0, 1, '2019-06-14 20:30:00'),
(3090, 298, 1200, NULL, 400, 300, 100, 1, 35, NULL, 1, 0, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '314.65', NULL, 0, 6, '2019-06-14 20:30:00'),
(3091, 298, 2100, NULL, 600, 300, 100, 1, 35, NULL, NULL, NULL, NULL, '', 70, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '314.65', NULL, 1, 2, '2019-06-14 20:30:00'),
(3092, 298, 2700, NULL, 1100, 300, 100, 1, 35, NULL, 0, 1, 0, '', NULL, NULL, NULL, '8.99', NULL, NULL, NULL, NULL, '', '314.65', NULL, 0, 4, '2019-06-14 20:30:00'),
(3093, 298, 3000, NULL, 1200, 300, 100, 1, 35, NULL, NULL, NULL, NULL, '', 25, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '314.65', NULL, 1, 5, '2019-06-14 20:30:00'),
(3094, 298, 3200, NULL, 1300, 300, 100, 1, 35, NULL, NULL, NULL, NULL, '', 4, 0, '0.00', '8.99', NULL, NULL, NULL, NULL, '', '314.65', NULL, 1, 3, '2019-06-14 20:30:00'),
(3095, 341, 100600, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '40.00', '70.00', '90.00', NULL, '90.00', '90.00', 0, 1, '2019-06-15 14:00:00'),
(3096, 341, 102800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 12, NULL, NULL, NULL, '1.50', NULL, NULL, NULL, NULL, '18.00', '18.00', 1, 5, '2019-06-15 14:00:00'),
(3097, 342, 101800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 12, NULL, NULL, NULL, '2.50', NULL, NULL, NULL, NULL, '30.00', '30.00', 1, 2, '2019-06-14 15:00:00'),
(3098, 343, 400, NULL, 100, 400, 100, 1, 25, NULL, 1, 0, 1, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '212.25', NULL, 0, 1, '2019-06-16 19:30:00'),
(3099, 343, 0, NULL, 300, 400, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '212.25', NULL, 0, 1, '2019-06-16 19:30:00'),
(3100, 343, 1200, NULL, 400, 400, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '212.25', NULL, 0, 6, '2019-06-16 19:30:00'),
(3101, 343, 1800, NULL, 500, 400, 100, 1, 25, NULL, 0, 1, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '212.25', NULL, 0, 1, '2019-06-16 19:30:00'),
(3102, 343, 2100, NULL, 600, 400, 100, 1, 25, NULL, NULL, NULL, NULL, '', 50, 0, '0.00', '8.49', NULL, NULL, NULL, NULL, '', '212.25', NULL, 1, 2, '2019-06-16 19:30:00'),
(3103, 343, 2700, NULL, 1100, 400, 100, 1, 25, NULL, 0, 0, 1, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '212.25', NULL, 0, 4, '2019-06-16 19:30:00'),
(3104, 343, 0, NULL, 1200, 400, 100, 1, 25, NULL, 0, 0, 0, '', NULL, NULL, NULL, '8.49', NULL, NULL, NULL, NULL, '', '212.25', NULL, 0, 1, '2019-06-16 19:30:00'),
(3105, 343, 3200, NULL, 1300, 400, 100, 1, 25, NULL, NULL, NULL, NULL, '', 2, 0, '0.00', '8.49', NULL, NULL, NULL, NULL, '', '212.25', NULL, 1, 3, '2019-06-16 19:30:00'),
(3106, 344, 100600, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '40.00', '70.00', '90.00', NULL, '40.00', '40.00', 0, 1, '2019-06-15 18:00:00'),
(3108, 345, 100300, NULL, NULL, NULL, 100, 2, NULL, NULL, 2, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '150.00', '150.00', 0, 1, '2019-06-16 12:30:00'),
(3109, 345, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 3, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-06-16 12:30:00'),
(3114, 346, 100400, NULL, NULL, NULL, 100, 2, NULL, NULL, 1, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '30.00', '45.00', '60.00', NULL, '60.00', '60.00', 0, 1, '2019-06-14 18:00:00'),
(3115, 346, 100900, NULL, NULL, NULL, 100, 2, NULL, NULL, 0, 0, 1, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '35.00', '35.00', 0, 1, '2019-06-14 18:00:00'),
(3116, 346, 102500, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 2, NULL, NULL, NULL, '0.00', NULL, NULL, NULL, NULL, '0.00', '0.00', 1, 3, '2019-06-14 18:00:00'),
(3117, 346, 102800, NULL, NULL, NULL, 100, 2, NULL, NULL, NULL, NULL, NULL, '', 10, NULL, NULL, NULL, '1.50', NULL, NULL, NULL, NULL, '15.00', '15.00', 1, 5, '2019-06-14 18:00:00'),
(3118, 347, 101700, NULL, NULL, NULL, 100, 2, NULL, NULL, 30, 0, 0, '', NULL, NULL, NULL, NULL, NULL, '35.00', '50.00', '70.00', NULL, '2100.00', '2100.00', 0, 1, '2019-08-19 13:30:00');

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
(1, 'refresh_interval', '9999.9');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=348;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3119;

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
