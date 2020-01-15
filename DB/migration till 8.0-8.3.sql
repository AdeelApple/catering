


ALTER TABLE `order_items` ADD `mr_cal` TINYINT NULL DEFAULT NULL AFTER `persons`, ADD `rice_type` TINYINT NULL DEFAULT NULL AFTER `mr_cal`;



ALTER TABLE `food_package_items` ADD `rice_type` TINYINT NULL DEFAULT NULL AFTER `is_rice_cal`;



ALTER TABLE `food_custom_items` ADD `rice_type` TINYINT NULL DEFAULT NULL AFTER `is_rice_cal`;




UPDATE `food_custom_items` SET `rice_type` = 1 WHERE `name` IN('Chicken Pulao','Veal Pulao');

UPDATE `food_custom_items` SET `rice_type` = 2 WHERE `name` IN('Chicken Biryani','Veal Biryani','Zarda');



UPDATE `food_package_items` SET `rice_type` = 1 WHERE `name` IN('Chicken Pulao','Veal Pulao');

UPDATE `food_package_items` SET `rice_type` = 2 WHERE `name` IN('Chicken Biryani','Veal Biryani','Zarda');







ALTER TABLE `order_items` ADD `is_meat_cal` TINYINT NULL DEFAULT NULL AFTER `mr_cal`, ADD `is_rice_cal` TINYINT NULL DEFAULT NULL AFTER `is_meat_cal`;



ALTER TABLE `order_items` CHANGE `custom` `name` VARCHAR(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL;




CREATE TABLE `am_catering`.`mr_limits` ( `id` INT NULL DEFAULT NULL AUTO_INCREMENT , `meat_lg` DECIMAL(10,3) UNSIGNED NULL DEFAULT NULL , `meat_md` DECIMAL(10,3) UNSIGNED NULL DEFAULT NULL , `meat_sm` DECIMAL(10,3) UNSIGNED NULL DEFAULT NULL , `rice_lg` DECIMAL(10,3) UNSIGNED NULL DEFAULT NULL , `rice_md` DECIMAL(10,3) UNSIGNED NULL DEFAULT NULL , `rice_sm` DECIMAL(10,3) UNSIGNED NULL DEFAULT NULL , `meat_limit` DECIMAL(5,2) UNSIGNED NULL DEFAULT NULL , `rice_limit` DECIMAL(5,2) UNSIGNED NULL DEFAULT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;








INSERT INTO `mr_limits` (`id`, `meat_lg`, `meat_md`, `meat_sm`, `rice_lg`, `rice_md`, `rice_sm`, `meat_limit`, `rice_limit`) VALUES (NULL, '2.00', '1.500', '1.000', '1.50', '1.15', '0.75', '10', '7.5');
INSERT INTO `mr_limits` (`id`, `meat_lg`, `meat_md`, `meat_sm`, `rice_lg`, `rice_md`, `rice_sm`, `meat_limit`, `rice_limit`) VALUES (NULL, '2.00', '1.500', '1.000', '1.50', '1.15', '0.75', '10', '7.5');
INSERT INTO `mr_limits` (`id`, `meat_lg`, `meat_md`, `meat_sm`, `rice_lg`, `rice_md`, `rice_sm`, `meat_limit`, `rice_limit`) VALUES (NULL, '2.00', '1.500', '1.000', '1.50', '1.15', '0.75', '10', '7.5');
INSERT INTO `mr_limits` (`id`, `meat_lg`, `meat_md`, `meat_sm`, `rice_lg`, `rice_md`, `rice_sm`, `meat_limit`, `rice_limit`) VALUES (NULL, '2.00', '1.500', '1.000', '1.50', '1.15', '0.75', '10', '7.5');
INSERT INTO `mr_limits` (`id`, `meat_lg`, `meat_md`, `meat_sm`, `meat_limit`) VALUES (NULL, '4.25', '3.188', '2.125', '20');
INSERT INTO `mr_limits` (`id`, `meat_lg`, `meat_md`, `meat_sm`, `meat_limit`) VALUES (NULL, '4.25', '3.188', '2.125', '30');
INSERT INTO `mr_limits` (`id`, `meat_lg`, `meat_md`, `meat_sm`, `meat_limit`) VALUES (NULL, '4.25', '3.188', '2.125', '20');
INSERT INTO `mr_limits` (`id`, `meat_lg`, `meat_md`, `meat_sm`, `meat_limit`) VALUES (NULL, '4.25', '3.188', '2.125', '30');
INSERT INTO `mr_limits` (`id`, `rice_lg`, `rice_md`, `rice_sm`, `rice_limit`) VALUES (NULL, '1.15', '0.80', '0.50', '7.5');

INSERT INTO `mr_limits` (`id`, `meat_lg`, `meat_md`, `meat_sm`, `meat_limit`) VALUES (NULL, '3.50', '2.300', '1.750', '20');
INSERT INTO `mr_limits` (`id`, `meat_lg`, `meat_md`, `meat_sm`, `meat_limit`) VALUES (NULL, '3.75', '2.81', '1.875', '20');
INSERT INTO `mr_limits` (`id`, `meat_lg`, `meat_md`, `meat_sm`, `meat_limit`) VALUES (NULL, '3.75', '2.81', '1.875', '20');
INSERT INTO `mr_limits` (`id`, `meat_lg`, `meat_md`, `meat_sm`, `rice_lg`, `rice_md`, `rice_sm`, `meat_limit`, `rice_limit`) VALUES (NULL, '2.50', '2.00', '1.250', '1.50', '1.150', '0.750', '10', '6.0');
INSERT INTO `mr_limits` (`id`, `meat_lg`, `meat_md`, `meat_sm`, `rice_lg`, `rice_md`, `rice_sm`, `meat_limit`, `rice_limit`) VALUES (NULL, '2.50', '2.00', '1.250', '1.50', '1.150', '0.750', '10', '7.5');
INSERT INTO `mr_limits` (`id`, `meat_lg`, `meat_md`, `meat_sm`, `meat_limit`) VALUES (NULL, '3.75', '2.81', '1.875', '00');
INSERT INTO `mr_limits` (`id`, `meat_lg`, `meat_md`, `meat_sm`, `meat_limit`) VALUES (NULL, '3.75', '2.81', '1.875', '30');
INSERT INTO `mr_limits` (`id`, `meat_lg`, `meat_md`, `meat_sm`, `meat_limit`) VALUES (NULL, '3.75', '2.81', '1.875', '30');
INSERT INTO `mr_limits` (`id`, `meat_lg`, `meat_md`, `meat_sm`, `rice_lg`, `rice_md`, `rice_sm`, `meat_limit`, `rice_limit`) VALUES (NULL, '2.50', '2.00', '1.250', '1.50', '1.150', '0.750', '10', '7.5');
INSERT INTO `mr_limits` (`id`, `meat_lg`, `meat_md`, `meat_sm`, `rice_lg`, `rice_md`, `rice_sm`, `meat_limit`, `rice_limit`) VALUES (NULL, '2.50', '2.00', '1.250', '1.50', '1.150', '0.750', '10', '6.0');
INSERT INTO `mr_limits` (`id`, `rice_lg`, `rice_md`, `rice_sm`, `rice_limit`) VALUES (NULL, '1.25', '0.938', '0.625', '7.5');
INSERT INTO `mr_limits` (`id`, `meat_lg`, `meat_md`, `meat_sm`) VALUES (NULL, '2.00', '1.50', '1.000');
INSERT INTO `mr_limits` (`id`, `meat_lg`, `meat_md`, `meat_sm`, `meat_limit`) VALUES (NULL, '3.50', '2.30', '1.750', '30');







ALTER TABLE `food_package_items` ADD `mr_limits` TINYINT UNSIGNED NULL DEFAULT NULL AFTER `rice_type`;
ALTER TABLE `food_custom_items` ADD `mr_limits` TINYINT UNSIGNED NULL DEFAULT NULL AFTER `rice_type`;



UPDATE `food_package_items` SET `mr_limits` = 1 WHERE id = 100;
UPDATE `food_package_items` SET `mr_limits` = 2 WHERE id = 200;
UPDATE `food_package_items` SET `mr_limits` = 3 WHERE id = 300;
UPDATE `food_package_items` SET `mr_limits` = 4 WHERE id = 400;
UPDATE `food_package_items` SET `mr_limits` = 5 WHERE id = 500;
UPDATE `food_package_items` SET `mr_limits` = 6 WHERE id = 600;
UPDATE `food_package_items` SET `mr_limits` = 7 WHERE id = 700;
UPDATE `food_package_items` SET `mr_limits` = 8 WHERE id = 800;
UPDATE `food_package_items` SET `mr_limits` = 9 WHERE id = 1600;
UPDATE `food_package_items` SET `mr_limits` = 10 WHERE id = 2000;

UPDATE `food_custom_items` SET `mr_limits` = 11  WHERE id = 100000;
UPDATE `food_custom_items` SET `mr_limits` = 12  WHERE id = 100200;
UPDATE `food_custom_items` SET `mr_limits` = 13  WHERE id = 100300;
UPDATE `food_custom_items` SET `mr_limits` = 14  WHERE id = 100400;
UPDATE `food_custom_items` SET `mr_limits` = 15  WHERE id = 100700;
UPDATE `food_custom_items` SET `mr_limits` = 16  WHERE id = 100800;
UPDATE `food_custom_items` SET `mr_limits` = 17  WHERE id = 100900;
UPDATE `food_custom_items` SET `mr_limits` = 18  WHERE id = 101000;
UPDATE `food_custom_items` SET `mr_limits` = 19  WHERE id = 101100;
UPDATE `food_custom_items` SET `mr_limits` = 20  WHERE id = 101500;
UPDATE `food_custom_items` SET `mr_limits` = 21  WHERE id = 101600;
UPDATE `food_custom_items` SET `mr_limits` = 22  WHERE id = 101700;


ALTER TABLE `food_package_items` DROP `meat_lg`, DROP `meat_md`, DROP `meat_sm`, DROP `rice_lg`, DROP `rice_md`, DROP `rice_sm`, DROP `meat_limit`, DROP `rice_limit`;

ALTER TABLE `food_custom_items` DROP `meat_lg`, DROP `meat_md`, DROP `meat_sm`, DROP `rice_lg`, DROP `rice_md`, DROP `rice_sm`, DROP `meat_limit`, DROP `rice_limit`;





ALTER TABLE `order_items` ADD `tspan` TINYINT UNSIGNED NULL DEFAULT NULL AFTER `list`, ADD `rank` INT UNSIGNED NULL DEFAULT NULL AFTER `tspan`;
ALTER TABLE `order_items` ADD `mr_limits` TINYINT UNSIGNED NULL DEFAULT NULL AFTER `rice_type`;







UPDATE `order_items` SET `rice_type` = (SELECT rice_type FROM food_package_items WHERE id = 100) WHERE item = 100;
UPDATE `order_items` SET `rice_type` = (SELECT rice_type FROM food_package_items WHERE id = 200) WHERE item = 200;
UPDATE `order_items` SET `rice_type` = (SELECT rice_type FROM food_package_items WHERE id = 300) WHERE item = 300;
UPDATE `order_items` SET `rice_type` = (SELECT rice_type FROM food_package_items WHERE id = 400) WHERE item = 400;
UPDATE `order_items` SET `rice_type` = (SELECT rice_type FROM food_package_items WHERE id = 500) WHERE item = 500;
UPDATE `order_items` SET `rice_type` = (SELECT rice_type FROM food_package_items WHERE id = 600) WHERE item = 600;
UPDATE `order_items` SET `rice_type` = (SELECT rice_type FROM food_package_items WHERE id = 700) WHERE item = 700;
UPDATE `order_items` SET `rice_type` = (SELECT rice_type FROM food_package_items WHERE id = 800) WHERE item = 800;
UPDATE `order_items` SET `rice_type` = (SELECT rice_type FROM food_package_items WHERE id = 1600) WHERE item = 1600;
UPDATE `order_items` SET `rice_type` = (SELECT rice_type FROM food_package_items WHERE id = 2000) WHERE item = 2000;

UPDATE `order_items` SET `rice_type` = (SELECT rice_type FROM food_custom_items WHERE id = 100000)  WHERE item = 100000;
UPDATE `order_items` SET `rice_type` = (SELECT rice_type FROM food_custom_items WHERE id = 100200)  WHERE item = 100200;
UPDATE `order_items` SET `rice_type` = (SELECT rice_type FROM food_custom_items WHERE id = 100300)  WHERE item = 100300;
UPDATE `order_items` SET `rice_type` = (SELECT rice_type FROM food_custom_items WHERE id = 100400)  WHERE item = 100400;
UPDATE `order_items` SET `rice_type` = (SELECT rice_type FROM food_custom_items WHERE id = 100700)  WHERE item = 100700;
UPDATE `order_items` SET `rice_type` = (SELECT rice_type FROM food_custom_items WHERE id = 100800)  WHERE item = 100800;
UPDATE `order_items` SET `rice_type` = (SELECT rice_type FROM food_custom_items WHERE id = 100900)  WHERE item = 100900;
UPDATE `order_items` SET `rice_type` = (SELECT rice_type FROM food_custom_items WHERE id = 101000)  WHERE item = 101000;
UPDATE `order_items` SET `rice_type` = (SELECT rice_type FROM food_custom_items WHERE id = 101100)  WHERE item = 101100;
UPDATE `order_items` SET `rice_type` = (SELECT rice_type FROM food_custom_items WHERE id = 101500)  WHERE item = 101500;
UPDATE `order_items` SET `rice_type` = (SELECT rice_type FROM food_custom_items WHERE id = 101600)  WHERE item = 101600;
UPDATE `order_items` SET `rice_type` = (SELECT rice_type FROM food_custom_items WHERE id = 101700)  WHERE item = 101700;




















-- For Running Old data and processing

UPDATE `order_items` SET mr_cal = (SELECT mr_cal FROM food_package_items WHERE id = 100), is_meat_cal = (SELECT is_meat_cal FROM food_package_items WHERE id = 100), is_rice_cal = (SELECT is_rice_cal FROM food_package_items WHERE id = 100), mr_limits = (SELECT mr_limits FROM food_package_items WHERE id = 100) WHERE item = 100 AND type=1;
UPDATE `order_items` SET mr_cal = (SELECT mr_cal FROM food_package_items WHERE id = 200), is_meat_cal = (SELECT is_meat_cal FROM food_package_items WHERE id = 200), is_rice_cal = (SELECT is_rice_cal FROM food_package_items WHERE id = 200), mr_limits = (SELECT mr_limits FROM food_package_items WHERE id = 200) WHERE item = 200 AND type=1;
UPDATE `order_items` SET mr_cal = (SELECT mr_cal FROM food_package_items WHERE id = 300), is_meat_cal = (SELECT is_meat_cal FROM food_package_items WHERE id = 300), is_rice_cal = (SELECT is_rice_cal FROM food_package_items WHERE id = 300), mr_limits = (SELECT mr_limits FROM food_package_items WHERE id = 300) WHERE item = 300 AND type=1;
UPDATE `order_items` SET mr_cal = (SELECT mr_cal FROM food_package_items WHERE id = 400), is_meat_cal = (SELECT is_meat_cal FROM food_package_items WHERE id = 400), is_rice_cal = (SELECT is_rice_cal FROM food_package_items WHERE id = 400), mr_limits = (SELECT mr_limits FROM food_package_items WHERE id = 400) WHERE item = 400 AND type=1;
UPDATE `order_items` SET mr_cal = (SELECT mr_cal FROM food_package_items WHERE id = 500), is_meat_cal = (SELECT is_meat_cal FROM food_package_items WHERE id = 500), is_rice_cal = (SELECT is_rice_cal FROM food_package_items WHERE id = 500), mr_limits = (SELECT mr_limits FROM food_package_items WHERE id = 500) WHERE item = 500 AND type=1;
UPDATE `order_items` SET mr_cal = (SELECT mr_cal FROM food_package_items WHERE id = 600), is_meat_cal = (SELECT is_meat_cal FROM food_package_items WHERE id = 600), is_rice_cal = (SELECT is_rice_cal FROM food_package_items WHERE id = 600), mr_limits = (SELECT mr_limits FROM food_package_items WHERE id = 600) WHERE item = 600 AND type=1;
UPDATE `order_items` SET mr_cal = (SELECT mr_cal FROM food_package_items WHERE id = 700), is_meat_cal = (SELECT is_meat_cal FROM food_package_items WHERE id = 700), is_rice_cal = (SELECT is_rice_cal FROM food_package_items WHERE id = 700), mr_limits = (SELECT mr_limits FROM food_package_items WHERE id = 700) WHERE item = 700 AND type=1;
UPDATE `order_items` SET mr_cal = (SELECT mr_cal FROM food_package_items WHERE id = 800), is_meat_cal = (SELECT is_meat_cal FROM food_package_items WHERE id = 800), is_rice_cal = (SELECT is_rice_cal FROM food_package_items WHERE id = 800), mr_limits = (SELECT mr_limits FROM food_package_items WHERE id = 800) WHERE item = 800 AND type=1;
UPDATE `order_items` SET mr_cal = (SELECT mr_cal FROM food_package_items WHERE id = 1600), is_meat_cal = (SELECT is_meat_cal FROM food_package_items WHERE id = 1600), is_rice_cal = (SELECT is_rice_cal FROM food_package_items WHERE id = 1600), mr_limits = (SELECT mr_limits FROM food_package_items WHERE id = 1600) WHERE item = 1600 AND type=1;
UPDATE `order_items` SET mr_cal = (SELECT mr_cal FROM food_package_items WHERE id = 2000), is_meat_cal = (SELECT is_meat_cal FROM food_package_items WHERE id = 2000), is_rice_cal = (SELECT is_rice_cal FROM food_package_items WHERE id = 2000), mr_limits = (SELECT mr_limits FROM food_package_items WHERE id = 2000) WHERE item = 2000 AND type=1;



UPDATE `order_items` SET mr_cal = (SELECT mr_cal FROM food_custom_items WHERE id = 100000), is_meat_cal = (SELECT is_meat_cal FROM food_custom_items WHERE id = 100000), is_rice_cal = (SELECT is_rice_cal FROM food_custom_items WHERE id = 100000), mr_limits = (SELECT mr_limits FROM food_custom_items WHERE id = 100000) WHERE item = 100000 AND type=2;
UPDATE `order_items` SET mr_cal = (SELECT mr_cal FROM food_custom_items WHERE id = 100200), is_meat_cal = (SELECT is_meat_cal FROM food_custom_items WHERE id = 100200), is_rice_cal = (SELECT is_rice_cal FROM food_custom_items WHERE id = 100200), mr_limits = (SELECT mr_limits FROM food_custom_items WHERE id = 100200) WHERE item = 100200 AND type=2;
UPDATE `order_items` SET mr_cal = (SELECT mr_cal FROM food_custom_items WHERE id = 100300), is_meat_cal = (SELECT is_meat_cal FROM food_custom_items WHERE id = 100300), is_rice_cal = (SELECT is_rice_cal FROM food_custom_items WHERE id = 100300), mr_limits = (SELECT mr_limits FROM food_custom_items WHERE id = 100300) WHERE item = 100300 AND type=2;
UPDATE `order_items` SET mr_cal = (SELECT mr_cal FROM food_custom_items WHERE id = 100400), is_meat_cal = (SELECT is_meat_cal FROM food_custom_items WHERE id = 100400), is_rice_cal = (SELECT is_rice_cal FROM food_custom_items WHERE id = 100400), mr_limits = (SELECT mr_limits FROM food_custom_items WHERE id = 100400) WHERE item = 100400 AND type=2;
UPDATE `order_items` SET mr_cal = (SELECT mr_cal FROM food_custom_items WHERE id = 100800), is_meat_cal = (SELECT is_meat_cal FROM food_custom_items WHERE id = 100800), is_rice_cal = (SELECT is_rice_cal FROM food_custom_items WHERE id = 100800), mr_limits = (SELECT mr_limits FROM food_custom_items WHERE id = 100800) WHERE item = 100800 AND type=2;
UPDATE `order_items` SET mr_cal = (SELECT mr_cal FROM food_custom_items WHERE id = 100900), is_meat_cal = (SELECT is_meat_cal FROM food_custom_items WHERE id = 100900), is_rice_cal = (SELECT is_rice_cal FROM food_custom_items WHERE id = 100900), mr_limits = (SELECT mr_limits FROM food_custom_items WHERE id = 100900) WHERE item = 100900 AND type=2;
UPDATE `order_items` SET mr_cal = (SELECT mr_cal FROM food_custom_items WHERE id = 101000), is_meat_cal = (SELECT is_meat_cal FROM food_custom_items WHERE id = 101000), is_rice_cal = (SELECT is_rice_cal FROM food_custom_items WHERE id = 101000), mr_limits = (SELECT mr_limits FROM food_custom_items WHERE id = 101000) WHERE item = 101000 AND type=2;
UPDATE `order_items` SET mr_cal = (SELECT mr_cal FROM food_custom_items WHERE id = 101100), is_meat_cal = (SELECT is_meat_cal FROM food_custom_items WHERE id = 101100), is_rice_cal = (SELECT is_rice_cal FROM food_custom_items WHERE id = 101100), mr_limits = (SELECT mr_limits FROM food_custom_items WHERE id = 101100) WHERE item = 101100 AND type=2;
UPDATE `order_items` SET mr_cal = (SELECT mr_cal FROM food_custom_items WHERE id = 101500), is_meat_cal = (SELECT is_meat_cal FROM food_custom_items WHERE id = 101500), is_rice_cal = (SELECT is_rice_cal FROM food_custom_items WHERE id = 101500), mr_limits = (SELECT mr_limits FROM food_custom_items WHERE id = 101500) WHERE item = 101500 AND type=2;
UPDATE `order_items` SET mr_cal = (SELECT mr_cal FROM food_custom_items WHERE id = 101700), is_meat_cal = (SELECT is_meat_cal FROM food_custom_items WHERE id = 101700), is_rice_cal = (SELECT is_rice_cal FROM food_custom_items WHERE id = 101700), mr_limits = (SELECT mr_limits FROM food_custom_items WHERE id = 101700) WHERE item = 101700 AND type=2;















UPDATE `order_items` SET `name` = (SELECT name FROM food_package_items WHERE id = 100) , `tspan` = (SELECT tspan FROM food_package_items WHERE id = 100), `rank` = (SELECT rank FROM food_package_items WHERE id = 100) WHERE `item` = 100;
UPDATE `order_items` SET `name` = (SELECT name FROM food_package_items WHERE id = 200) , `tspan` = (SELECT tspan FROM food_package_items WHERE id = 200), `rank` = (SELECT rank FROM food_package_items WHERE id = 200) WHERE `item` = 200;
UPDATE `order_items` SET `name` = (SELECT name FROM food_package_items WHERE id = 300) , `tspan` = (SELECT tspan FROM food_package_items WHERE id = 300), `rank` = (SELECT rank FROM food_package_items WHERE id = 300) WHERE `item` = 300;
UPDATE `order_items` SET `name` = (SELECT name FROM food_package_items WHERE id = 400) , `tspan` = (SELECT tspan FROM food_package_items WHERE id = 400), `rank` = (SELECT rank FROM food_package_items WHERE id = 400) WHERE `item` = 400;
UPDATE `order_items` SET `name` = (SELECT name FROM food_package_items WHERE id = 500) , `tspan` = (SELECT tspan FROM food_package_items WHERE id = 500), `rank` = (SELECT rank FROM food_package_items WHERE id = 500) WHERE `item` = 500;
UPDATE `order_items` SET `name` = (SELECT name FROM food_package_items WHERE id = 600) , `tspan` = (SELECT tspan FROM food_package_items WHERE id = 600), `rank` = (SELECT rank FROM food_package_items WHERE id = 600) WHERE `item` = 600;
UPDATE `order_items` SET `name` = (SELECT name FROM food_package_items WHERE id = 700) , `tspan` = (SELECT tspan FROM food_package_items WHERE id = 700), `rank` = (SELECT rank FROM food_package_items WHERE id = 700) WHERE `item` = 700;
UPDATE `order_items` SET `name` = (SELECT name FROM food_package_items WHERE id = 800) , `tspan` = (SELECT tspan FROM food_package_items WHERE id = 800), `rank` = (SELECT rank FROM food_package_items WHERE id = 800) WHERE `item` = 800;
UPDATE `order_items` SET `name` = (SELECT name FROM food_package_items WHERE id = 900) , `tspan` = (SELECT tspan FROM food_package_items WHERE id = 900), `rank` = (SELECT rank FROM food_package_items WHERE id = 900) WHERE `item` = 900;
UPDATE `order_items` SET `name` = (SELECT name FROM food_package_items WHERE id = 1000), `tspan` = (SELECT tspan FROM food_package_items WHERE id = 1000), `rank` = (SELECT rank FROM food_package_items WHERE id = 1000) WHERE `item` = 1000;
UPDATE `order_items` SET `name` = (SELECT name FROM food_package_items WHERE id = 1100), `tspan` = (SELECT tspan FROM food_package_items WHERE id = 1100), `rank` = (SELECT rank FROM food_package_items WHERE id = 1100) WHERE `item` = 1100;
UPDATE `order_items` SET `name` = (SELECT name FROM food_package_items WHERE id = 1200), `tspan` = (SELECT tspan FROM food_package_items WHERE id = 1200), `rank` = (SELECT rank FROM food_package_items WHERE id = 1200) WHERE `item` = 1200;
UPDATE `order_items` SET `name` = (SELECT name FROM food_package_items WHERE id = 1300), `tspan` = (SELECT tspan FROM food_package_items WHERE id = 1300), `rank` = (SELECT rank FROM food_package_items WHERE id = 1300) WHERE `item` = 1300;
UPDATE `order_items` SET `name` = (SELECT name FROM food_package_items WHERE id = 1400), `tspan` = (SELECT tspan FROM food_package_items WHERE id = 1400), `rank` = (SELECT rank FROM food_package_items WHERE id = 1400) WHERE `item` = 1400;
UPDATE `order_items` SET `name` = (SELECT name FROM food_package_items WHERE id = 1500), `tspan` = (SELECT tspan FROM food_package_items WHERE id = 1500), `rank` = (SELECT rank FROM food_package_items WHERE id = 1500) WHERE `item` = 1500;
UPDATE `order_items` SET `name` = (SELECT name FROM food_package_items WHERE id = 1600), `tspan` = (SELECT tspan FROM food_package_items WHERE id = 1600), `rank` = (SELECT rank FROM food_package_items WHERE id = 1600) WHERE `item` = 1600;
UPDATE `order_items` SET `name` = (SELECT name FROM food_package_items WHERE id = 1700), `tspan` = (SELECT tspan FROM food_package_items WHERE id = 1700), `rank` = (SELECT rank FROM food_package_items WHERE id = 1700) WHERE `item` = 1700;
UPDATE `order_items` SET `name` = (SELECT name FROM food_package_items WHERE id = 1800), `tspan` = (SELECT tspan FROM food_package_items WHERE id = 1800), `rank` = (SELECT rank FROM food_package_items WHERE id = 1800) WHERE `item` = 1800;
UPDATE `order_items` SET `name` = (SELECT name FROM food_package_items WHERE id = 1900), `tspan` = (SELECT tspan FROM food_package_items WHERE id = 1900), `rank` = (SELECT rank FROM food_package_items WHERE id = 1900) WHERE `item` = 1900;
UPDATE `order_items` SET `name` = (SELECT name FROM food_package_items WHERE id = 2000), `tspan` = (SELECT tspan FROM food_package_items WHERE id = 2000), `rank` = (SELECT rank FROM food_package_items WHERE id = 2000) WHERE `item` = 2000;
UPDATE `order_items` SET `name` = (SELECT name FROM food_package_items WHERE id = 2100), `tspan` = (SELECT tspan FROM food_package_items WHERE id = 2100), `rank` = (SELECT rank FROM food_package_items WHERE id = 2100) WHERE `item` = 2100;
UPDATE `order_items` SET `name` = (SELECT name FROM food_package_items WHERE id = 2200), `tspan` = (SELECT tspan FROM food_package_items WHERE id = 2200), `rank` = (SELECT rank FROM food_package_items WHERE id = 2200) WHERE `item` = 2200;
UPDATE `order_items` SET `name` = (SELECT name FROM food_package_items WHERE id = 2300), `tspan` = (SELECT tspan FROM food_package_items WHERE id = 2300), `rank` = (SELECT rank FROM food_package_items WHERE id = 2300) WHERE `item` = 2300;
UPDATE `order_items` SET `name` = (SELECT name FROM food_package_items WHERE id = 2400), `tspan` = (SELECT tspan FROM food_package_items WHERE id = 2400), `rank` = (SELECT rank FROM food_package_items WHERE id = 2400) WHERE `item` = 2400;
UPDATE `order_items` SET `name` = (SELECT name FROM food_package_items WHERE id = 2500), `tspan` = (SELECT tspan FROM food_package_items WHERE id = 2500), `rank` = (SELECT rank FROM food_package_items WHERE id = 2500) WHERE `item` = 2500;
UPDATE `order_items` SET `name` = (SELECT name FROM food_package_items WHERE id = 2600), `tspan` = (SELECT tspan FROM food_package_items WHERE id = 2600), `rank` = (SELECT rank FROM food_package_items WHERE id = 2600) WHERE `item` = 2600;
UPDATE `order_items` SET `name` = (SELECT name FROM food_package_items WHERE id = 2700), `tspan` = (SELECT tspan FROM food_package_items WHERE id = 2700), `rank` = (SELECT rank FROM food_package_items WHERE id = 2700) WHERE `item` = 2700;
UPDATE `order_items` SET `name` = (SELECT name FROM food_package_items WHERE id = 2800), `tspan` = (SELECT tspan FROM food_package_items WHERE id = 2800), `rank` = (SELECT rank FROM food_package_items WHERE id = 2800) WHERE `item` = 2800;
UPDATE `order_items` SET `name` = (SELECT name FROM food_package_items WHERE id = 2900), `tspan` = (SELECT tspan FROM food_package_items WHERE id = 2900), `rank` = (SELECT rank FROM food_package_items WHERE id = 2900) WHERE `item` = 2900;
UPDATE `order_items` SET `name` = (SELECT name FROM food_package_items WHERE id = 3000), `tspan` = (SELECT tspan FROM food_package_items WHERE id = 3000), `rank` = (SELECT rank FROM food_package_items WHERE id = 3000) WHERE `item` = 3000;
UPDATE `order_items` SET `name` = (SELECT name FROM food_package_items WHERE id = 3100), `tspan` = (SELECT tspan FROM food_package_items WHERE id = 3100), `rank` = (SELECT rank FROM food_package_items WHERE id = 3100) WHERE `item` = 3100;
UPDATE `order_items` SET `name` = (SELECT name FROM food_package_items WHERE id = 3200), `tspan` = (SELECT tspan FROM food_package_items WHERE id = 3200), `rank` = (SELECT rank FROM food_package_items WHERE id = 3200) WHERE `item` = 3200;











UPDATE `order_items` SET `name` = (SELECT name FROM food_custom_items WHERE id = 100000), `tspan` = (SELECT tspan FROM food_custom_items WHERE id = 100000), `rank` = (SELECT rank FROM food_custom_items WHERE id = 100000) WHERE `item` = 100000;
UPDATE `order_items` SET `name` = (SELECT name FROM food_custom_items WHERE id = 100200), `tspan` = (SELECT tspan FROM food_custom_items WHERE id = 100200), `rank` = (SELECT rank FROM food_custom_items WHERE id = 100200) WHERE `item` = 100200;
UPDATE `order_items` SET `name` = (SELECT name FROM food_custom_items WHERE id = 100300), `tspan` = (SELECT tspan FROM food_custom_items WHERE id = 100300), `rank` = (SELECT rank FROM food_custom_items WHERE id = 100300) WHERE `item` = 100300;
UPDATE `order_items` SET `name` = (SELECT name FROM food_custom_items WHERE id = 100400), `tspan` = (SELECT tspan FROM food_custom_items WHERE id = 100400), `rank` = (SELECT rank FROM food_custom_items WHERE id = 100400) WHERE `item` = 100400;
UPDATE `order_items` SET `name` = (SELECT name FROM food_custom_items WHERE id = 100500), `tspan` = (SELECT tspan FROM food_custom_items WHERE id = 100500), `rank` = (SELECT rank FROM food_custom_items WHERE id = 100500) WHERE `item` = 100500;
UPDATE `order_items` SET `name` = (SELECT name FROM food_custom_items WHERE id = 100600), `tspan` = (SELECT tspan FROM food_custom_items WHERE id = 100600), `rank` = (SELECT rank FROM food_custom_items WHERE id = 100600) WHERE `item` = 100600;
UPDATE `order_items` SET `name` = (SELECT name FROM food_custom_items WHERE id = 100700), `tspan` = (SELECT tspan FROM food_custom_items WHERE id = 100700), `rank` = (SELECT rank FROM food_custom_items WHERE id = 100700) WHERE `item` = 100700;
UPDATE `order_items` SET `name` = (SELECT name FROM food_custom_items WHERE id = 100800), `tspan` = (SELECT tspan FROM food_custom_items WHERE id = 100800), `rank` = (SELECT rank FROM food_custom_items WHERE id = 100800) WHERE `item` = 100800;
UPDATE `order_items` SET `name` = (SELECT name FROM food_custom_items WHERE id = 100900), `tspan` = (SELECT tspan FROM food_custom_items WHERE id = 100900), `rank` = (SELECT rank FROM food_custom_items WHERE id = 100900) WHERE `item` = 100900;
UPDATE `order_items` SET `name` = (SELECT name FROM food_custom_items WHERE id = 101000), `tspan` = (SELECT tspan FROM food_custom_items WHERE id = 101000), `rank` = (SELECT rank FROM food_custom_items WHERE id = 101000) WHERE `item` = 101000;
UPDATE `order_items` SET `name` = (SELECT name FROM food_custom_items WHERE id = 101100), `tspan` = (SELECT tspan FROM food_custom_items WHERE id = 101100), `rank` = (SELECT rank FROM food_custom_items WHERE id = 101100) WHERE `item` = 101100;
UPDATE `order_items` SET `name` = (SELECT name FROM food_custom_items WHERE id = 101200), `tspan` = (SELECT tspan FROM food_custom_items WHERE id = 101200), `rank` = (SELECT rank FROM food_custom_items WHERE id = 101200) WHERE `item` = 101200;
UPDATE `order_items` SET `name` = (SELECT name FROM food_custom_items WHERE id = 101300), `tspan` = (SELECT tspan FROM food_custom_items WHERE id = 101300), `rank` = (SELECT rank FROM food_custom_items WHERE id = 101300) WHERE `item` = 101300;
UPDATE `order_items` SET `name` = (SELECT name FROM food_custom_items WHERE id = 101400), `tspan` = (SELECT tspan FROM food_custom_items WHERE id = 101400), `rank` = (SELECT rank FROM food_custom_items WHERE id = 101400) WHERE `item` = 101400;
UPDATE `order_items` SET `name` = (SELECT name FROM food_custom_items WHERE id = 101500), `tspan` = (SELECT tspan FROM food_custom_items WHERE id = 101500), `rank` = (SELECT rank FROM food_custom_items WHERE id = 101500) WHERE `item` = 101500;
UPDATE `order_items` SET `name` = (SELECT name FROM food_custom_items WHERE id = 101505), `tspan` = (SELECT tspan FROM food_custom_items WHERE id = 101505), `rank` = (SELECT rank FROM food_custom_items WHERE id = 101505) WHERE `item` = 101505;
UPDATE `order_items` SET `name` = (SELECT name FROM food_custom_items WHERE id = 101600), `tspan` = (SELECT tspan FROM food_custom_items WHERE id = 101600), `rank` = (SELECT rank FROM food_custom_items WHERE id = 101600) WHERE `item` = 101600;
UPDATE `order_items` SET `name` = (SELECT name FROM food_custom_items WHERE id = 101700), `tspan` = (SELECT tspan FROM food_custom_items WHERE id = 101700), `rank` = (SELECT rank FROM food_custom_items WHERE id = 101700) WHERE `item` = 101700;
UPDATE `order_items` SET `name` = (SELECT name FROM food_custom_items WHERE id = 101705), `tspan` = (SELECT tspan FROM food_custom_items WHERE id = 101705), `rank` = (SELECT rank FROM food_custom_items WHERE id = 101705) WHERE `item` = 101705;
UPDATE `order_items` SET `name` = (SELECT name FROM food_custom_items WHERE id = 101710), `tspan` = (SELECT tspan FROM food_custom_items WHERE id = 101710), `rank` = (SELECT rank FROM food_custom_items WHERE id = 101710) WHERE `item` = 101710;
UPDATE `order_items` SET `name` = (SELECT name FROM food_custom_items WHERE id = 101715), `tspan` = (SELECT tspan FROM food_custom_items WHERE id = 101715), `rank` = (SELECT rank FROM food_custom_items WHERE id = 101715) WHERE `item` = 101715;
UPDATE `order_items` SET `name` = (SELECT name FROM food_custom_items WHERE id = 101800), `tspan` = (SELECT tspan FROM food_custom_items WHERE id = 101800), `rank` = (SELECT rank FROM food_custom_items WHERE id = 101800) WHERE `item` = 101800;
UPDATE `order_items` SET `name` = (SELECT name FROM food_custom_items WHERE id = 101900), `tspan` = (SELECT tspan FROM food_custom_items WHERE id = 101900), `rank` = (SELECT rank FROM food_custom_items WHERE id = 101900) WHERE `item` = 101900;
UPDATE `order_items` SET `name` = (SELECT name FROM food_custom_items WHERE id = 102000), `tspan` = (SELECT tspan FROM food_custom_items WHERE id = 102000), `rank` = (SELECT rank FROM food_custom_items WHERE id = 102000) WHERE `item` = 102000;
UPDATE `order_items` SET `name` = (SELECT name FROM food_custom_items WHERE id = 102100), `tspan` = (SELECT tspan FROM food_custom_items WHERE id = 102100), `rank` = (SELECT rank FROM food_custom_items WHERE id = 102100) WHERE `item` = 102100;
UPDATE `order_items` SET `name` = (SELECT name FROM food_custom_items WHERE id = 102200), `tspan` = (SELECT tspan FROM food_custom_items WHERE id = 102200), `rank` = (SELECT rank FROM food_custom_items WHERE id = 102200) WHERE `item` = 102200;
UPDATE `order_items` SET `name` = (SELECT name FROM food_custom_items WHERE id = 102300), `tspan` = (SELECT tspan FROM food_custom_items WHERE id = 102300), `rank` = (SELECT rank FROM food_custom_items WHERE id = 102300) WHERE `item` = 102300;
UPDATE `order_items` SET `name` = (SELECT name FROM food_custom_items WHERE id = 102400), `tspan` = (SELECT tspan FROM food_custom_items WHERE id = 102400), `rank` = (SELECT rank FROM food_custom_items WHERE id = 102400) WHERE `item` = 102400;
UPDATE `order_items` SET `name` = (SELECT name FROM food_custom_items WHERE id = 102500), `tspan` = (SELECT tspan FROM food_custom_items WHERE id = 102500), `rank` = (SELECT rank FROM food_custom_items WHERE id = 102500) WHERE `item` = 102500;
UPDATE `order_items` SET `name` = (SELECT name FROM food_custom_items WHERE id = 102600), `tspan` = (SELECT tspan FROM food_custom_items WHERE id = 102600), `rank` = (SELECT rank FROM food_custom_items WHERE id = 102600) WHERE `item` = 102600;
UPDATE `order_items` SET `name` = (SELECT name FROM food_custom_items WHERE id = 102700), `tspan` = (SELECT tspan FROM food_custom_items WHERE id = 102700), `rank` = (SELECT rank FROM food_custom_items WHERE id = 102700) WHERE `item` = 102700;
UPDATE `order_items` SET `name` = (SELECT name FROM food_custom_items WHERE id = 102800), `tspan` = (SELECT tspan FROM food_custom_items WHERE id = 102800), `rank` = (SELECT rank FROM food_custom_items WHERE id = 102800) WHERE `item` = 102800;
UPDATE `order_items` SET `name` = (SELECT name FROM food_custom_items WHERE id = 102900), `tspan` = (SELECT tspan FROM food_custom_items WHERE id = 102900), `rank` = (SELECT rank FROM food_custom_items WHERE id = 102900) WHERE `item` = 102900;
UPDATE `order_items` SET `name` = (SELECT name FROM food_custom_items WHERE id = 105000), `tspan` = (SELECT tspan FROM food_custom_items WHERE id = 105000), `rank` = (SELECT rank FROM food_custom_items WHERE id = 105000) WHERE `item` = 105000;
UPDATE `order_items` SET `name` = (SELECT name FROM food_custom_items WHERE id = 105100), `tspan` = (SELECT tspan FROM food_custom_items WHERE id = 105100), `rank` = (SELECT rank FROM food_custom_items WHERE id = 105100) WHERE `item` = 105100;
UPDATE `order_items` SET `name` = (SELECT name FROM food_custom_items WHERE id = 105200), `tspan` = (SELECT tspan FROM food_custom_items WHERE id = 105200), `rank` = (SELECT rank FROM food_custom_items WHERE id = 105200) WHERE `item` = 105200;
UPDATE `order_items` SET `name` = (SELECT name FROM food_custom_items WHERE id = 105300), `tspan` = (SELECT tspan FROM food_custom_items WHERE id = 105300), `rank` = (SELECT rank FROM food_custom_items WHERE id = 105300) WHERE `item` = 105300;
UPDATE `order_items` SET `name` = (SELECT name FROM food_custom_items WHERE id = 105400), `tspan` = (SELECT tspan FROM food_custom_items WHERE id = 105400), `rank` = (SELECT rank FROM food_custom_items WHERE id = 105400) WHERE `item` = 105400;
UPDATE `order_items` SET `name` = (SELECT name FROM food_custom_items WHERE id = 105500), `tspan` = (SELECT tspan FROM food_custom_items WHERE id = 105500), `rank` = (SELECT rank FROM food_custom_items WHERE id = 105500) WHERE `item` = 105500;
UPDATE `order_items` SET `name` = (SELECT name FROM food_custom_items WHERE id = 105600), `tspan` = (SELECT tspan FROM food_custom_items WHERE id = 105600), `rank` = (SELECT rank FROM food_custom_items WHERE id = 105600) WHERE `item` = 105600;
UPDATE `order_items` SET `name` = (SELECT name FROM food_custom_items WHERE id = 105700), `tspan` = (SELECT tspan FROM food_custom_items WHERE id = 105700), `rank` = (SELECT rank FROM food_custom_items WHERE id = 105700) WHERE `item` = 105700;
UPDATE `order_items` SET `name` = (SELECT name FROM food_custom_items WHERE id = 105800), `tspan` = (SELECT tspan FROM food_custom_items WHERE id = 105800), `rank` = (SELECT rank FROM food_custom_items WHERE id = 105800) WHERE `item` = 105800;
UPDATE `order_items` SET `name` = (SELECT name FROM food_custom_items WHERE id = 105900), `tspan` = (SELECT tspan FROM food_custom_items WHERE id = 105900), `rank` = (SELECT rank FROM food_custom_items WHERE id = 105900) WHERE `item` = 105900;




UPDATE `order_items` SET `name` = NULL, `tspan` = 4, `rank` = 10000 WHERE `item` = 0;
UPDATE `order_items` SET `tspan` = 4, `rank` = 10000 WHERE `type` = 3;
