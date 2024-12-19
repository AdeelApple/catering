-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 19, 2024 at 01:05 PM
-- Server version: 10.6.20-MariaDB-cll-lve
-- PHP Version: 8.1.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `food_main` int(11) DEFAULT NULL,
  `pp` tinyint(4) NOT NULL DEFAULT 0,
  `none` decimal(10,2) DEFAULT NULL,
  `edit_none` tinyint(3) UNSIGNED DEFAULT NULL,
  `edit` tinyint(4) DEFAULT 0,
  `lg_min` smallint(5) UNSIGNED DEFAULT NULL,
  `lg_max` smallint(5) UNSIGNED DEFAULT NULL,
  `md_min` smallint(5) UNSIGNED DEFAULT NULL,
  `md_max` smallint(5) UNSIGNED DEFAULT NULL,
  `sm_min` smallint(5) UNSIGNED DEFAULT NULL,
  `sm_max` smallint(5) UNSIGNED DEFAULT NULL,
  `fun` varchar(50) DEFAULT NULL,
  `extra_fun` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `food_cat`
--

INSERT INTO `food_cat` (`id`, `name`, `visible`, `food_main`, `pp`, `none`, `edit_none`, `edit`, `lg_min`, `lg_max`, `md_min`, `md_max`, `sm_min`, `sm_max`, `fun`, `extra_fun`) VALUES
(100, 'rice', 1, 100, 0, 2.00, 1, 0, 15, 20, 11, 14, 1, 10, NULL, NULL),
(200, 'curry', 1, 100, 0, 2.00, 1, 0, 25, 35, 15, 24, 1, 14, NULL, NULL),
(300, 'veggie', 1, 100, 0, 0.50, 1, 0, 26, 40, 15, 25, 1, 14, NULL, NULL),
(400, 'dessert', 1, 100, 0, 0.50, 1, 1, 26, 40, 15, 25, 1, 14, NULL, NULL),
(500, 'boneless curry', 1, 100, 0, 2.50, 1, 0, 21, 40, 15, 20, 1, 14, NULL, NULL),
(600, 'bbq', 1, 100, 1, 3.00, 1, 1, 25, 40, 15, 25, 1, 14, 'cal_bbq($(this).closest(\'tr\'));', NULL),
(900, 'appetizer', 1, 200, 0, NULL, 0, 1, 26, 40, 15, 25, 1, 14, NULL, NULL),
(1000, 'appetizer2', 1, 200, 0, NULL, 0, 1, 26, 40, 15, 25, 1, 14, NULL, NULL),
(1100, 'salad', 1, 200, 0, NULL, 0, 1, 41, 50, 31, 40, 20, 30, NULL, NULL),
(1200, 'naan', 1, 100, 1, 0.50, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'cal_naan($(this).closest(\'tr\'));', 'cal_extra_naan($(this).closest(\'tr\'));'),
(1300, 'raita', 1, 100, 1, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'cal_raita($(this).closest(\'tr\'));', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `food_custom`
--

CREATE TABLE `food_custom` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `open` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
  `tspan` tinyint(3) UNSIGNED DEFAULT 4,
  `mr_cal` tinyint(3) UNSIGNED DEFAULT NULL,
  `is_meat_cal` tinyint(3) UNSIGNED DEFAULT NULL,
  `is_rice_cal` tinyint(3) UNSIGNED DEFAULT NULL,
  `rice_type` tinyint(4) DEFAULT NULL,
  `mr_limit_id` int(10) UNSIGNED DEFAULT NULL,
  `ingredient_id` int(11) DEFAULT NULL,
  `pp` tinyint(4) NOT NULL DEFAULT 0,
  `lg_min` tinyint(3) UNSIGNED DEFAULT NULL,
  `lg_max` tinyint(3) UNSIGNED DEFAULT NULL,
  `md_min` tinyint(3) UNSIGNED DEFAULT NULL,
  `md_max` tinyint(3) UNSIGNED DEFAULT NULL,
  `sm_min` tinyint(3) UNSIGNED DEFAULT NULL,
  `sm_max` tinyint(3) UNSIGNED DEFAULT NULL,
  `list` tinyint(4) NOT NULL DEFAULT 1,
  `visible` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `food_custom_items`
--

INSERT INTO `food_custom_items` (`id`, `name`, `rank`, `food_custom`, `sm_price`, `md_price`, `lg_price`, `price`, `tspan`, `mr_cal`, `is_meat_cal`, `is_rice_cal`, `rice_type`, `mr_limit_id`, `ingredient_id`, `pp`, `lg_min`, `lg_max`, `md_min`, `md_max`, `sm_min`, `sm_max`, `list`, `visible`) VALUES
(100000, 'Chicken Karahi', 7, 100, 50.00, 75.00, 100.00, NULL, 4, 7, 1, 0, NULL, 11, 2, 0, 25, 35, 15, 24, 1, 14, 1, 1),
(100200, 'Chicken Korma', 5, 100, 50.00, 75.00, 100.00, NULL, 4, 5, 1, 0, NULL, 12, 2, 0, 16, 20, 11, 15, 1, 10, 1, 1),
(100300, 'Chicken Biryani', 1, 100, 40.00, 60.00, 80.00, NULL, 4, 1, 0, 1, 2, 13, 1, 0, 25, 35, 15, 24, 1, 14, 1, 1),
(100400, 'Chicken Pulao', 3, 100, 40.00, 60.00, 80.00, NULL, 4, 3, 0, 1, 1, 14, 1, 0, 16, 20, 11, 15, 1, 10, 1, 1),
(100500, 'Haleem', 9, 100, 55.00, 85.00, 110.00, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 26, 40, 15, 25, 1, 14, 1, 1),
(100600, 'Nihari', 10, 100, 70.00, 110.00, 150.00, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 26, 40, 15, 25, 1, 14, 1, 1),
(100700, 'Butter Chicken', 11, 100, 65.00, 95.00, 130.00, NULL, 4, 10, 1, NULL, NULL, 15, 9, 0, 26, 40, 15, 25, 1, 14, 1, 1),
(100800, 'Veal Karahi', 8, 100, 55.00, 85.00, 110.00, NULL, 4, 8, 1, 0, NULL, 16, 5, 0, 25, 35, 15, 24, 1, 14, 1, 1),
(100900, 'Veal Korma', 6, 100, 55.00, 85.00, 110.00, NULL, 4, 6, 1, 0, NULL, 17, 5, 0, 25, 35, 15, 24, 1, 14, 1, 1),
(101000, 'Veal Biryani', 2, 100, 50.00, 75.00, 100.00, NULL, 4, 2, 0, 1, 2, 18, 4, 0, 16, 20, 11, 15, 1, 10, 1, 1),
(101100, 'Veal Pulao', 4, 100, 50.00, 75.00, 100.00, NULL, 4, 4, 0, 1, 1, 19, 4, 0, 16, 20, 11, 15, 1, 10, 1, 1),
(101200, 'Fruit Trifle', 12, 100, 35.00, 50.00, 70.00, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 26, 40, 15, 25, 1, 14, 6, 1),
(101300, 'Lab-e-Shireen', 13, 100, 35.00, 50.00, 70.00, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 26, 40, 15, 25, 1, 14, 6, 1),
(101400, 'Khoya Kheer', 14, 100, 40.00, 60.00, 80.00, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, 26, 40, 15, 25, 1, 14, 6, 1),
(101500, 'Zarda', 15, 100, 40.00, 60.00, 80.00, NULL, 4, 9, NULL, 1, 2, 20, 15, 0, 26, 40, 15, 25, 1, 14, 1, 1),
(101505, 'Gulab Jamun', 13, 100, NULL, NULL, NULL, 0.75, 4, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 6, 1),
(101600, 'Chicken Pasta', 16, 100, 50.00, 75.00, 100.00, NULL, 4, NULL, NULL, NULL, NULL, 21, 7, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1),
(101700, 'Tikka Masala', 17, 100, 65.00, 95.00, 130.00, NULL, 4, 6, 1, NULL, NULL, 22, 11, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1),
(101705, 'Mixed Vegetables', 18, 100, 35.00, 50.00, 70.00, NULL, 24, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1),
(101710, 'Channa', 19, 100, 35.00, 50.00, 70.00, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1),
(101715, 'Aloo Palak', 20, 100, 35.00, 50.00, 70.00, NULL, 24, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1),
(101800, 'Reshmi Kabab', 21, 100, NULL, NULL, NULL, 3.00, 4, NULL, NULL, NULL, NULL, NULL, 6, 1, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1),
(101900, 'Beef Kabab', 22, 100, NULL, NULL, NULL, 3.00, 4, NULL, NULL, NULL, NULL, NULL, 8, 1, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1),
(102000, 'Tandoori Chicken Tikka', 23, 100, NULL, NULL, NULL, 5.00, 4, NULL, NULL, NULL, NULL, NULL, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1),
(102100, 'Bihari Kabab', 24, 100, NULL, NULL, NULL, 8.50, 4, NULL, NULL, NULL, NULL, NULL, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1),
(102200, 'Chicken Bihari', 25, 100, NULL, NULL, NULL, 7.50, 4, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1),
(102300, 'Malai Boti', 26, 100, NULL, NULL, NULL, 7.50, 4, NULL, NULL, NULL, NULL, NULL, 10, 1, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1),
(102400, 'Boneless Chicken Tikka', 27, 100, NULL, NULL, NULL, 7.50, 4, NULL, NULL, NULL, NULL, NULL, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1),
(102500, 'Raita', 32, 100, NULL, NULL, NULL, 0.00, 4, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1),
(102600, 'Garden Salad', 27, 100, 0.00, 0.00, 0.25, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 4, 1),
(102700, 'Greek Salad', 28, 100, 10.00, 15.00, 20.00, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 4, 1),
(102800, 'Tandoori Naan', 30, 100, NULL, NULL, NULL, 2.00, 4, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 5, 1),
(102900, 'Peta Naan', 31, 100, NULL, NULL, NULL, 1.00, 4, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 5, 1),
(105000, 'Vegi Pasta', 33, 200, 40.00, 60.00, 80.00, NULL, 4, NULL, NULL, NULL, NULL, NULL, 17, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1),
(105100, 'Chicken', 34, 200, 45.00, NULL, 90.00, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1),
(105200, 'Italian Sausage', 35, 200, 45.00, NULL, 90.00, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1),
(105300, 'New York Striploin', 36, 200, 50.00, NULL, 100.00, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1),
(105400, 'House Special Herbal Rice', 37, 200, 20.00, NULL, 40.00, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1),
(105500, 'Roasted Potatoes', 38, 200, 32.00, NULL, 60.00, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1),
(105600, 'Mashed Potatoes', 39, 200, 30.00, NULL, 60.00, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1),
(105700, 'Vegetarian Lasagna', 40, 200, 45.00, NULL, 90.00, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1),
(105800, 'Beef Lasagna', 41, 200, 50.00, NULL, 100.00, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1),
(105900, 'Chicken Parmesan', 42, 200, 80.00, NULL, 120.00, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `food_full_custom`
--

CREATE TABLE `food_full_custom` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `open` tinyint(4) DEFAULT 0,
  `visible` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
  `cal` tinyint(11) NOT NULL DEFAULT 0,
  `rowspan` tinyint(4) NOT NULL DEFAULT 1,
  `reportspan` tinyint(1) DEFAULT NULL,
  `merge_name` varchar(100) DEFAULT NULL,
  `description` varchar(25) DEFAULT NULL,
  `unit1` varchar(50) DEFAULT NULL,
  `unit2` varchar(50) DEFAULT NULL,
  `display_report_unit` varchar(10) DEFAULT NULL,
  `visible` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `food_ingredients`
--

INSERT INTO `food_ingredients` (`id`, `name`, `cal`, `rowspan`, `reportspan`, `merge_name`, `description`, `unit1`, `unit2`, `display_report_unit`, `visible`) VALUES
(1, 'Chicken+Rice', 1, 2, 2, '4 Pieces', '', 'KG', 'LB', NULL, 1),
(2, 'Chicken+Curry', 2, 0, 0, NULL, '', 'KG', 'LB', NULL, 1),
(3, 'BBQ+Chicken', 3, 1, 1, NULL, 'PCs', 'PC', 'Full Legs', NULL, 1),
(4, 'Veal+Rice', 4, 2, 2, 'Veal', 'VEAL', 'KG', 'LB', NULL, 1),
(5, 'Veal+Curry', 5, 0, 0, NULL, NULL, 'KG', 'LB', NULL, 1),
(6, 'Reshmi Kabab', 6, 2, 1, NULL, NULL, 'KG', 'LB', NULL, 1),
(7, 'Chicken Pasta', 7, 0, 1, NULL, NULL, 'KG', 'LB', NULL, 1),
(8, 'Beef Keema', 8, 1, 1, NULL, NULL, 'KG', 'LB', NULL, 1),
(9, 'Butter Chicken', 9, 2, 1, NULL, NULL, 'KG', 'LB', NULL, 1),
(10, 'Malai Boti', 10, 0, 1, NULL, NULL, 'KG', 'LB', NULL, 1),
(11, 'Boneless Tikka Masala', 11, 1, 1, NULL, NULL, 'KG', 'LB', NULL, 1),
(12, 'Boneless Tikka', 12, 1, 1, NULL, NULL, 'KG', 'LB', NULL, 1),
(13, 'Bihari Kabab', 13, 1, 1, NULL, NULL, 'KG', 'LB', NULL, 1),
(14, 'Fish', 14, 1, 1, NULL, NULL, 'PC', 'PC', NULL, 1),
(15, 'Zarda Rice', 15, 1, 1, NULL, NULL, 'KG', 'LB', 'KG', 1),
(16, 'Boneless Chicken Karahi', 11, 1, 1, NULL, NULL, 'KG', 'LB', NULL, 1),
(17, 'Vegi Pasta', 17, 1, 1, NULL, NULL, 'Trays', 'Trays', NULL, 1),
(18, 'Samosa', 18, 1, 1, NULL, NULL, NULL, NULL, NULL, 1),
(19, 'Spring Rolls', 19, 1, 1, NULL, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `food_main`
--

CREATE TABLE `food_main` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `open` tinyint(4) NOT NULL DEFAULT 0,
  `visible` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
  `food_main` int(11) NOT NULL DEFAULT 0,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `visible` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `food_packages`
--

INSERT INTO `food_packages` (`id`, `name`, `food_main`, `price`, `visible`) VALUES
(100, 'PACKAGE1', 100, 8.99, 1),
(200, 'PACKAGE2', 100, 9.99, 1),
(300, 'PACKAGE3', 100, 11.49, 1),
(400, 'PACKAGE4', 100, 12.49, 1),
(500, 'Silver Package', 200, 13.99, 1),
(600, 'Gold Package', 200, 15.99, 1),
(700, 'Diamond Package', 200, 17.99, 1);

-- --------------------------------------------------------

--
-- Table structure for table `food_package_cat`
--

CREATE TABLE `food_package_cat` (
  `id` int(11) NOT NULL,
  `food_cat_id` int(11) NOT NULL,
  `food_package_id` int(11) NOT NULL,
  `visible` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
  `list` tinyint(4) NOT NULL DEFAULT 1,
  `food_cat_id` int(11) NOT NULL,
  `pp` tinyint(4) NOT NULL DEFAULT 0,
  `is_extra` tinyint(3) UNSIGNED DEFAULT 0,
  `reduce` decimal(10,2) DEFAULT 0.00,
  `increase` decimal(10,2) DEFAULT 0.00,
  `tspan` tinyint(3) UNSIGNED DEFAULT 4,
  `mr_cal` tinyint(3) UNSIGNED DEFAULT NULL,
  `is_meat_cal` tinyint(3) UNSIGNED DEFAULT NULL,
  `is_rice_cal` tinyint(3) UNSIGNED DEFAULT NULL,
  `rice_type` tinyint(4) DEFAULT NULL,
  `mr_limit_id` int(10) UNSIGNED DEFAULT NULL,
  `ingredient_id` int(11) DEFAULT NULL,
  `extra_price` decimal(5,2) UNSIGNED DEFAULT NULL,
  `selected` tinyint(4) DEFAULT NULL,
  `visible` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `food_package_items`
--

INSERT INTO `food_package_items` (`id`, `name`, `rank`, `list`, `food_cat_id`, `pp`, `is_extra`, `reduce`, `increase`, `tspan`, `mr_cal`, `is_meat_cal`, `is_rice_cal`, `rice_type`, `mr_limit_id`, `ingredient_id`, `extra_price`, `selected`, `visible`) VALUES
(100, 'Chicken Biryani', 1, 1, 100, 0, 0, 0.00, 0.00, 4, 1, 0, 1, 2, 1, 1, NULL, NULL, 1),
(200, 'Veal Biryani', 2, 1, 100, 0, 0, 0.00, 0.00, 4, 2, 0, 1, 2, 2, 4, NULL, NULL, 1),
(300, 'Chicken Pulao', 3, 1, 100, 0, 0, 0.00, 0.00, 4, 3, 0, 1, 1, 3, 1, NULL, NULL, 1),
(400, 'Veal Pulao', 4, 1, 100, 0, 0, 0.00, 0.00, 4, 4, 0, 1, 1, 4, 4, NULL, NULL, 1),
(500, 'Chicken Korma', 5, 1, 200, 0, 0, 0.00, 0.00, 4, 5, 1, 0, NULL, 5, 2, NULL, NULL, 1),
(600, 'Veal Korma', 6, 1, 200, 0, 0, 0.00, 0.00, 4, 6, 1, 0, NULL, 6, 5, NULL, NULL, 1),
(700, 'Chicken Karahi', 7, 1, 200, 0, 0, 0.00, 0.00, 4, 7, 1, 0, NULL, 7, 2, NULL, NULL, 1),
(800, 'Veal Karahi', 8, 1, 200, 0, 0, 0.00, 0.00, 4, 8, 1, 0, NULL, 8, 5, NULL, NULL, 1),
(900, 'Mixed Vegetables', 9, 1, 300, 0, 0, 0.00, 0.00, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1000, 'Channa', 10, 1, 300, 0, 0, 0.00, 0.00, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1100, 'Aloo Palak', 11, 1, 300, 0, 0, 0.00, 0.00, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1200, 'Khoya Kheer', 12, 6, 400, 0, 0, 0.00, 0.00, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1300, 'Gulab Jamun', 13, 6, 400, 1, 1, 0.00, 0.00, 4, NULL, NULL, NULL, NULL, NULL, NULL, 2.00, NULL, 1),
(1400, 'Fruit Trifle', 14, 6, 400, 0, 0, 0.00, 0.00, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1500, 'Lab-e-Shireen', 15, 6, 400, 0, 0, 0.00, 0.00, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1600, 'Zarda', 16, 1, 400, 0, 0, 0.00, 0.00, 4, 9, 0, 1, 2, 9, 15, NULL, NULL, 1),
(1700, 'Butter Chicken', 17, 1, 500, 0, 0, 0.00, 0.00, 4, 10, 1, NULL, NULL, 23, 9, NULL, NULL, 1),
(1800, 'Nihari', 18, 1, 500, 0, 0, 0.00, 0.00, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(1900, 'Haleem', 19, 1, 500, 0, 0, 0.00, 0.00, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(2000, 'Tikka Masala', 20, 1, 500, 0, 0, 0.00, 0.00, 4, 6, 1, NULL, NULL, 10, 11, NULL, NULL, 1),
(2010, 'Boneless Chicken Karahi', 21, 1, 500, 0, 0, 0.00, 0.00, 4, 6, 1, NULL, NULL, 10, 16, NULL, NULL, 1),
(2100, 'Tandoori Chicken Tikka', 21, 2, 600, 1, 1, 0.00, 0.00, 4, NULL, NULL, NULL, NULL, NULL, 3, 1.50, NULL, 1),
(2200, 'Beef Kabab', 22, 2, 600, 1, 1, 0.00, 0.00, 4, NULL, NULL, NULL, NULL, NULL, 8, 3.00, NULL, 1),
(2300, 'Reshmi Kabab', 23, 2, 600, 1, 1, 0.00, 0.00, 4, NULL, NULL, NULL, NULL, NULL, 6, 3.00, NULL, 1),
(2400, 'Samosa', 24, 1, 900, 1, 1, 0.00, 0.00, 4, NULL, NULL, NULL, NULL, NULL, 18, 1.50, NULL, 1),
(2500, 'Chaat Papri', 25, 1, 900, 0, 0, 0.00, 0.00, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(2600, 'Spring Rolls', 26, 1, 900, 1, 1, 0.00, 0.00, 4, NULL, NULL, NULL, NULL, NULL, 19, 1.50, NULL, 1),
(2700, 'Garden Salad', 27, 4, 1100, 0, 0, 0.00, 0.00, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1),
(2800, 'Greek Salad', 28, 4, 1100, 0, 0, 0.00, 0.00, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(2900, 'Fried Fish', 29, 1, 1000, 1, 0, 0.00, 0.00, 4, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, 1),
(3000, 'Tandoori Naan', 30, 5, 1200, 1, 1, 0.00, 0.50, 4, NULL, NULL, NULL, NULL, NULL, NULL, 2.00, 1, 1),
(3100, 'Peta Naan', 31, 5, 1200, 1, 1, 0.00, 0.00, 4, NULL, NULL, NULL, NULL, NULL, NULL, 1.00, NULL, 1),
(3200, 'Raita', 32, 3, 1300, 1, 1, 0.00, 0.00, 4, NULL, NULL, NULL, NULL, NULL, NULL, 1.00, 1, 1);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `home_cards`
--

INSERT INTO `home_cards` (`id`, `name`, `title`, `admin`, `operator`, `manager`, `chef`, `tandoor`, `icon`, `bg`, `link`, `text`) VALUES
(1, 'Booking', 'Go for booking', 1, 1, 0, 0, 0, 'fas fa-fw fa-book', 'bg-primary', 'booking.php', NULL),
(2, 'Orders', 'View Details', 1, 0, 0, 0, 0, 'fas fa-fw fa-dollar-sign', 'bg-warning', 'orders.php', '<span id=\'orders\'></span>'),
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
-- Table structure for table `manual_sweet_trays`
--

CREATE TABLE `manual_sweet_trays` (
  `id` int(11) NOT NULL,
  `people` int(11) NOT NULL,
  `qty_string` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `manual_sweet_trays`
--

INSERT INTO `manual_sweet_trays` (`id`, `people`, `qty_string`) VALUES
(1, 25, 'md_1'),
(2, 30, '30_1'),
(3, 35, '35_1'),
(4, 40, '40_1'),
(5, 45, '45_1'),
(6, 50, 'md_2'),
(7, 55, '55_1'),
(8, 60, '30_2'),
(9, 65, 'lg_1__md_1'),
(10, 70, '35_2'),
(11, 75, '75_1'),
(12, 80, '40_2'),
(13, 85, '85_1'),
(14, 90, '45_2'),
(15, 95, '95_1'),
(16, 100, 'lg_2__md_1'),
(17, 105, '105_1'),
(18, 110, '110_1'),
(19, 115, '115_1'),
(20, 120, 'lg_3'),
(21, 125, '125_1'),
(22, 130, '130_1'),
(23, 135, '135_1'),
(24, 140, '140_1'),
(25, 145, '145_1'),
(26, 150, '150_1'),
(27, 155, '155_1'),
(30, 160, 'lg_4');

-- --------------------------------------------------------

--
-- Table structure for table `mr_limits`
--

CREATE TABLE `mr_limits` (
  `id` int(11) NOT NULL,
  `meat_lg` decimal(10,3) UNSIGNED DEFAULT NULL,
  `meat_md` decimal(10,3) UNSIGNED DEFAULT NULL,
  `meat_sm` decimal(10,3) UNSIGNED DEFAULT NULL,
  `rice_lg` decimal(10,3) UNSIGNED DEFAULT NULL,
  `rice_md` decimal(10,3) UNSIGNED DEFAULT NULL,
  `rice_sm` decimal(10,3) UNSIGNED DEFAULT NULL,
  `meat_limit` decimal(5,2) UNSIGNED DEFAULT NULL,
  `rice_limit` decimal(5,2) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `mr_limits`
--

INSERT INTO `mr_limits` (`id`, `meat_lg`, `meat_md`, `meat_sm`, `rice_lg`, `rice_md`, `rice_sm`, `meat_limit`, `rice_limit`) VALUES
(1, 2.500, 2.000, 1.250, 1.500, 1.150, 0.750, 10.00, 6.00),
(2, 2.250, 1.750, 1.250, 1.500, 1.150, 0.750, 10.00, 4.50),
(3, 2.500, 2.000, 1.250, 1.500, 1.150, 0.750, 10.00, 6.00),
(4, 2.250, 1.750, 1.250, 1.500, 1.150, 0.750, 10.00, 4.90),
(5, 4.000, 3.000, 2.000, NULL, NULL, NULL, 50.00, NULL),
(6, 4.000, 3.000, 2.000, NULL, NULL, NULL, 50.00, NULL),
(7, 4.000, 3.000, 2.000, NULL, NULL, NULL, 50.00, NULL),
(8, 4.000, 3.000, 2.000, NULL, NULL, NULL, 40.00, NULL),
(9, NULL, NULL, NULL, 1.250, 1.000, 0.750, NULL, 10.00),
(10, 3.500, 2.300, 1.750, NULL, NULL, NULL, 30.00, NULL),
(11, 4.000, 3.000, 2.000, NULL, NULL, NULL, 50.00, NULL),
(12, 4.000, 3.000, 2.000, NULL, NULL, NULL, 40.00, NULL),
(13, 2.500, 2.000, 1.250, 1.500, 1.150, 0.750, 10.00, 6.00),
(14, 2.500, 2.000, 1.250, 1.500, 1.150, 0.750, 10.00, 6.00),
(15, 3.750, 2.810, 1.875, NULL, NULL, NULL, 40.00, NULL),
(16, 4.000, 3.000, 2.000, NULL, NULL, NULL, 40.00, NULL),
(17, 4.000, 3.000, 2.000, NULL, NULL, NULL, 50.00, NULL),
(18, 2.250, 1.750, 1.250, 1.500, 1.150, 0.750, 10.00, 6.75),
(19, 2.250, 1.750, 1.250, 1.500, 1.150, 0.750, 10.00, 6.00),
(20, NULL, NULL, NULL, 1.250, 1.000, 0.750, NULL, 10.00),
(21, 2.000, 1.500, 1.000, NULL, NULL, NULL, NULL, NULL),
(22, 3.500, 2.300, 1.750, NULL, NULL, NULL, 30.00, NULL),
(23, 3.500, 2.300, 1.750, NULL, NULL, NULL, 40.00, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `persons` smallint(6) DEFAULT NULL,
  `extra` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT 0.00,
  `advance` decimal(10,2) DEFAULT 0.00,
  `balance` decimal(10,2) DEFAULT 0.00,
  `phone1` varchar(15) DEFAULT NULL,
  `phone2` varchar(15) DEFAULT NULL,
  `shipping` tinyint(4) DEFAULT NULL,
  `delivery_time` datetime DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `remark` varchar(150) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `trays` int(11) DEFAULT NULL,
  `is_pre_booking` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `item` int(11) DEFAULT NULL,
  `name` varchar(300) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `package` int(11) DEFAULT NULL,
  `main` int(11) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `persons` smallint(6) UNSIGNED DEFAULT NULL,
  `mr_cal` tinyint(4) DEFAULT NULL,
  `is_meat_cal` tinyint(4) DEFAULT NULL,
  `is_rice_cal` tinyint(4) DEFAULT NULL,
  `rice_type` tinyint(4) DEFAULT NULL,
  `meat_type` tinyint(3) UNSIGNED DEFAULT NULL,
  `mr_limit_id` int(10) UNSIGNED DEFAULT NULL,
  `ingredient_id` int(11) DEFAULT NULL,
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
  `total` decimal(10,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `d_total` decimal(10,2) UNSIGNED DEFAULT NULL,
  `pp` tinyint(3) UNSIGNED DEFAULT NULL,
  `list` smallint(3) UNSIGNED DEFAULT NULL,
  `tspan` tinyint(3) UNSIGNED DEFAULT NULL,
  `rank` int(10) UNSIGNED DEFAULT NULL,
  `delivery_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchased_items`
--

CREATE TABLE `purchased_items` (
  `id` int(11) NOT NULL,
  `ingredient_id` int(11) DEFAULT NULL,
  `value` decimal(10,2) UNSIGNED DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `purchased_items`
--

INSERT INTO `purchased_items` (`id`, `ingredient_id`, `value`, `date`) VALUES
(1, 1, 0.00, '2020-01-20'),
(2, 3, 0.00, '2020-01-20'),
(3, 1, 100.00, '2024-11-04');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `value1` decimal(5,1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `value1`) VALUES
(1, 'refresh_interval', 9999.9);

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
  `super` tinyint(3) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sidebar`
--

INSERT INTO `sidebar` (`id`, `name`, `admin`, `operator`, `chef`, `tandoor`, `manager`, `link`, `allow`, `icon`, `submenu`, `super`) VALUES
(100, 'Booking', 1, 1, 0, 0, 0, 'booking.php', 1, 'fas fa-fw fa-book', 0, 0),
(105, 'Edit Order', 1, 0, 0, 0, 0, 'booking_edit.php', 0, NULL, 0, 0),
(106, 'Pre Booking', 1, 0, 0, 0, 0, 'pre_booking.php', 1, 'fa fa-calendar-check', 0, 0),
(110, 'Receipt', 1, 1, 0, 0, 0, 'receipt.php', 0, NULL, 0, 0),
(115, 'Admin Setting', 1, 0, 0, 0, 0, 'settings_admin.php', 0, NULL, 0, 1),
(200, 'Meat', 1, 0, 0, 0, 0, 'ingredients.php', 1, 'fas fa-clipboard-list', 0, 0),
(300, 'Kitchen', 1, 0, 1, 1, 0, 'kitchen.php', 1, 'fas fa-utensils', 0, 0),
(400, 'Orders List', 1, 0, 0, 0, 0, 'orders.php', 1, 'fas fa-fw fa-file-alt', 0, 0),
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sub_sidebar`
--

INSERT INTO `sub_sidebar` (`id`, `main`, `name`, `admin`, `operator`, `chef`, `tandoor`, `manager`, `allow`, `link`, `icon`) VALUES
(100, 500, 'Kabab Report', 1, 0, 0, 0, 1, 1, 'report_kabab.php', 'fas fa-chart-pie'),
(200, 500, 'Haleem Nihari Report', 1, 0, 0, 0, 1, 1, 'report_haleem_nihari.php', 'fas fa-chart-pie'),
(300, 500, 'Vegi And Naan', 1, 0, 0, 0, 1, 1, 'report_vegi_naan.php', 'fas fa-chart-pie'),
(400, 500, 'Sweets Report', 1, 0, 0, 0, 1, 1, 'report_sweets.php', 'fas fa-chart-pie'),
(405, 500, 'Sweets Report 2', 1, 0, 0, 0, 1, 1, 'report_sweets_2.php', 'fas fa-chart-pie'),
(410, 500, 'Meat Report', 1, 0, 0, 0, 1, 1, 'report_meat.php', 'fas fa-chart-pie'),
(415, 500, 'Pre Booking Report', 1, 0, 0, 0, 1, 1, 'report_pre_booking.php', 'fa fa-calendar-check'),
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
  `allow` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
(12, 'Haji Saeed', 'Haji Saeed', 'hajisaeed', NULL, 'operator', 1),
(13, 'Customer', 'Customer', '12345', NULL, 'operator', 1);

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
  ADD KEY `food_custom` (`food_custom`),
  ADD KEY `custom_mr_limits_index` (`mr_limit_id`),
  ADD KEY `ingredient_id_index` (`ingredient_id`);

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
  ADD KEY `food_cat` (`food_cat_id`),
  ADD KEY `package_mr_limits_index` (`mr_limit_id`),
  ADD KEY `ingredient_id_index` (`ingredient_id`);

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
-- Indexes for table `manual_sweet_trays`
--
ALTER TABLE `manual_sweet_trays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mr_limits`
--
ALTER TABLE `mr_limits`
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
  ADD KEY `cust_id` (`order_id`),
  ADD KEY `order_mr_limits_index` (`mr_limit_id`),
  ADD KEY `ingredient_id_index` (`ingredient_id`);

--
-- Indexes for table `purchased_items`
--
ALTER TABLE `purchased_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchased_ingredient_id` (`ingredient_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

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
-- AUTO_INCREMENT for table `manual_sweet_trays`
--
ALTER TABLE `manual_sweet_trays`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `mr_limits`
--
ALTER TABLE `mr_limits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17175;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141744;

--
-- AUTO_INCREMENT for table `purchased_items`
--
ALTER TABLE `purchased_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
  ADD CONSTRAINT `food_custom_items_ibfk_1` FOREIGN KEY (`food_custom`) REFERENCES `food_custom` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `food_custom_items_ibfk_2` FOREIGN KEY (`ingredient_id`) REFERENCES `food_ingredients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `food_package_items_ibfk_1` FOREIGN KEY (`food_cat_id`) REFERENCES `food_cat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `food_package_items_ibfk_2` FOREIGN KEY (`ingredient_id`) REFERENCES `food_ingredients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`ingredient_id`) REFERENCES `food_ingredients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sub_sidebar`
--
ALTER TABLE `sub_sidebar`
  ADD CONSTRAINT `sub_sidebar_ibfk_1` FOREIGN KEY (`main`) REFERENCES `sidebar` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
