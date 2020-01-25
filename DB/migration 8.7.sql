



ALTER TABLE `food_ingredients` ADD `merge_name` VARCHAR(100) NULL DEFAULT NULL AFTER `rowspan`;



ALTER TABLE `food_ingredients` DROP `recipes`;


UPDATE `food_ingredients` SET `merge_name` = '4 Pieces' WHERE `food_ingredients`.`id` = 1;
UPDATE `food_ingredients` SET `merge_name` = 'Veal' WHERE `food_ingredients`.`id` = 4;

ALTER TABLE `order_items` ADD `meat_type` TINYINT UNSIGNED NULL DEFAULT NULL AFTER `rice_type`;
