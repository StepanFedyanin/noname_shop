-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema clothes
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema clothes
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `clothes` DEFAULT CHARACTER SET utf8 ;
USE `clothes` ;

-- -----------------------------------------------------
-- Table `clothes`.`characteristics`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clothes`.`characteristics` (
  `characteristics_id` INT NOT NULL,
  `characteristics_material` VARCHAR(45) NOT NULL,
  `characteristics_fasteners` VARCHAR(50) NOT NULL,
  `characteristics_picture` TINYINT(1) NULL,
  `characteristics_gender` VARCHAR(10) NULL,
  `characteristics_season` VARCHAR(25) NULL,
  `characteristics_type` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`characteristics_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clothes`.`color`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clothes`.`color` (
  `color_id` INT NOT NULL AUTO_INCREMENT,
  `color_value` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`color_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clothes`.`Product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clothes`.`Product` (
  `id_product` INT NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(25) NOT NULL,
  `product_url` VARCHAR(255) NOT NULL,
  `product_url_back` VARCHAR(255) NOT NULL,
  `product_url_additional` VARCHAR(255) NOT NULL,
  `product_price` VARCHAR(45) NOT NULL,
  `product_description` VARCHAR(255) NULL,
  `characteristics_characteristics_id` INT NOT NULL,
  `color_color_id` INT NOT NULL,
  PRIMARY KEY (`id_product`),
  INDEX `fk_Product_characteristics_idx` (`characteristics_characteristics_id` ASC) VISIBLE,
  INDEX `fk_Product_color1_idx` (`color_color_id` ASC) VISIBLE,
  CONSTRAINT `fk_Product_characteristics`
    FOREIGN KEY (`characteristics_characteristics_id`)
    REFERENCES `clothes`.`characteristics` (`characteristics_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Product_color1`
    FOREIGN KEY (`color_color_id`)
    REFERENCES `clothes`.`color` (`color_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clothes`.`Size`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clothes`.`Size` (
  `id_size` INT NOT NULL AUTO_INCREMENT,
  `value_size` VARCHAR(25) NOT NULL,
  `Product_id_product` INT NOT NULL,
  PRIMARY KEY (`id_size`),
  INDEX `fk_Size_Product1_idx` (`Product_id_product` ASC) VISIBLE,
  CONSTRAINT `fk_Size_Product1`
    FOREIGN KEY (`Product_id_product`)
    REFERENCES `clothes`.`Product` (`id_product`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clothes`.`Сlient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clothes`.`Сlient` (
  `client_id` INT NOT NULL AUTO_INCREMENT,
  `client_namel` VARCHAR(25) NOT NULL,
  `clietn_surname` VARCHAR(25) NOT NULL,
  `client_patronymic` VARCHAR(25) NOT NULL,
  `favorites_id` INT NULL,
  `basket_id` INT NULL,
  PRIMARY KEY (`client_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clothes`.`Raiting`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clothes`.`Raiting` (
  `raiting_id` INT NOT NULL AUTO_INCREMENT,
  `raiting_user_show` TINYINT(1) NOT NULL,
  `raiting_review` VARCHAR(255) NULL,
  `raiting_star` INT NOT NULL,
  `Сlient_client_id` INT NOT NULL,
  `Product_id_product` INT NOT NULL,
  PRIMARY KEY (`raiting_id`, `Product_id_product`),
  INDEX `fk_Raiting_Сlient1_idx` (`Сlient_client_id` ASC) VISIBLE,
  INDEX `fk_Raiting_Product1_idx` (`Product_id_product` ASC) VISIBLE,
  CONSTRAINT `fk_Raiting_Сlient1`
    FOREIGN KEY (`Сlient_client_id`)
    REFERENCES `clothes`.`Сlient` (`client_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Raiting_Product1`
    FOREIGN KEY (`Product_id_product`)
    REFERENCES `clothes`.`Product` (`id_product`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `clothes`.`characteristics`
-- -----------------------------------------------------
START TRANSACTION;
USE `clothes`;
INSERT INTO `clothes`.`characteristics` (`characteristics_id`, `characteristics_material`, `characteristics_fasteners`, `characteristics_picture`, `characteristics_gender`, `characteristics_season`, `characteristics_type`) VALUES (1, 'хлопок', 'молния', NULL, NULL, NULL, 'зип-худи');
INSERT INTO `clothes`.`characteristics` (`characteristics_id`, `characteristics_material`, `characteristics_fasteners`, `characteristics_picture`, `characteristics_gender`, `characteristics_season`, `characteristics_type`) VALUES (2, 'хлопок', 'пуговицы', NULL, NULL, NULL, 'рубашка');

COMMIT;


-- -----------------------------------------------------
-- Data for table `clothes`.`color`
-- -----------------------------------------------------
START TRANSACTION;
USE `clothes`;
INSERT INTO `clothes`.`color` (`color_id`, `color_value`) VALUES (1, '#79553c');
INSERT INTO `clothes`.`color` (`color_id`, `color_value`) VALUES (2, '#3eb489');

COMMIT;


-- -----------------------------------------------------
-- Data for table `clothes`.`Product`
-- -----------------------------------------------------
START TRANSACTION;
USE `clothes`;
INSERT INTO `clothes`.`Product` (`id_product`, `product_name`, `product_url`, `product_url_back`, `product_url_additional`, `product_price`, `product_description`, `characteristics_characteristics_id`, `color_color_id`) VALUES (1, 'Зип худи', 'https://basket-04.wb.ru/vol675/part67583/67583069/images/big/1.jpg', 'https://basket-04.wb.ru/vol675/part67583/67583069/images/big/2.jpg', 'https://basket-04.wb.ru/vol675/part67583/67583069/images/big/3.jpg', '2990', NULL, 1, 1);
INSERT INTO `clothes`.`Product` (`id_product`, `product_name`, `product_url`, `product_url_back`, `product_url_additional`, `product_price`, `product_description`, `characteristics_characteristics_id`, `color_color_id`) VALUES (2, 'Рубашка', 'https://basket-04.wb.ru/vol705/part70594/70594994/images/big/1.jpg', 'https://basket-04.wb.ru/vol705/part70594/70594994/images/big/3.jpg', 'https://basket-04.wb.ru/vol705/part70594/70594994/images/big/2.jpg', '1990', NULL, 2, 2);

COMMIT;

