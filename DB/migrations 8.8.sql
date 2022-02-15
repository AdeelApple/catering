

UPDATE `food_package_items` SET `mr_cal` = '10', `is_meat_cal` = 1 WHERE `food_package_items`.`id` = 1700;
UPDATE `food_custom_items` SET `mr_cal` = '10', `is_meat_cal` = 1 WHERE `food_custom_items`.`id` = 100700;

INSERT INTO `mr_limits` (`id`, `meat_lg`, `meat_md`, `meat_sm`, `rice_lg`, `rice_md`, `rice_sm`, `meat_limit`, `rice_limit`) VALUES ('23', '3.5', '2.3', '1.75', NULL, NULL, NULL, '30', NULL);
UPDATE `food_package_items` SET `mr_limit_id` = '23' WHERE `food_package_items`.`id` = 1700;