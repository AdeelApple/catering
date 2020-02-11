



ALTER TABLE `food_ingredients` ADD `merge_name` VARCHAR(100) NULL DEFAULT NULL AFTER `rowspan`;



ALTER TABLE `food_ingredients` DROP `recipes`;


UPDATE `food_ingredients` SET `merge_name` = '4 Pieces' WHERE `food_ingredients`.`id` = 1;
UPDATE `food_ingredients` SET `merge_name` = 'Veal' WHERE `food_ingredients`.`id` = 4;

ALTER TABLE `order_items` ADD `meat_type` TINYINT UNSIGNED NULL DEFAULT NULL AFTER `rice_type`;


ALTER TABLE `food_ingredients` ADD `reportspan` TINYINT(1) NULL DEFAULT NULL AFTER `rowspan`;


UPDATE `food_ingredients` SET `reportspan` = 2 WHERE `id`= 1;
UPDATE `food_ingredients` SET `reportspan` = 0 WHERE `id`= 2;
UPDATE `food_ingredients` SET `reportspan` = 1 WHERE `id`= 3;
UPDATE `food_ingredients` SET `reportspan` = 2 WHERE `id`= 4;
UPDATE `food_ingredients` SET `reportspan` = 0 WHERE `id`= 5;
UPDATE `food_ingredients` SET `reportspan` = 1 WHERE `id`= 6;
UPDATE `food_ingredients` SET `reportspan` = 1 WHERE `id`= 7;
UPDATE `food_ingredients` SET `reportspan` = 1 WHERE `id`= 8;
UPDATE `food_ingredients` SET `reportspan` = 1 WHERE `id`= 9;
UPDATE `food_ingredients` SET `reportspan` = 1 WHERE `id`= 10;
UPDATE `food_ingredients` SET `reportspan` = 1 WHERE `id`= 11;
UPDATE `food_ingredients` SET `reportspan` = 1 WHERE `id`= 12;
UPDATE `food_ingredients` SET `reportspan` = 1 WHERE `id`= 13;
UPDATE `food_ingredients` SET `reportspan` = 1 WHERE `id`= 14;
UPDATE `food_ingredients` SET `reportspan` = 1 WHERE `id`= 15;