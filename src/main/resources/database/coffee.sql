-- MySQL Script generated by MySQL Workbench
-- Чтв 23 Ноя 2017 04:30:58
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema coffee
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema coffee
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `coffee` DEFAULT CHARACTER SET utf8 ;
USE `coffee` ;

-- -----------------------------------------------------
-- Table `coffee`.`CoffeeType`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coffee`.`CoffeeType` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NOT NULL,
  `price` DECIMAL(6,2) NOT NULL,
  `disabled` VARCHAR(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `idCoffeeType_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coffee`.`CoffeeOrder`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coffee`.`CoffeeOrder` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date` TIMESTAMP NOT NULL DEFAULT NOW(),
  `delivery_address` VARCHAR(200) NOT NULL,
  `cost` DECIMAL(8,2) NOT NULL,
  `name` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `idCoffeeOrder_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coffee`.`CoffeeOrderItem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coffee`.`CoffeeOrderItem` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `order_id` INT NOT NULL,
  `type_id` INT NOT NULL,
  `quantity` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `idCoffeeOrderItem_UNIQUE` (`id` ASC),
  INDEX `fk_CoffeeOrderItem_CoffeeType_idx` (`type_id` ASC),
  INDEX `fk_CoffeeOrderItem_CoffeeOrder1_idx` (`order_id` ASC),
  CONSTRAINT `fk_CoffeeOrderItem_CoffeeType`
    FOREIGN KEY (`type_id`)
    REFERENCES `coffee`.`CoffeeType` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CoffeeOrderItem_CoffeeOrder1`
    FOREIGN KEY (`order_id`)
    REFERENCES `coffee`.`CoffeeOrder` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coffee`.`Configuration`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coffee`.`Configuration` (
  `id` VARCHAR(20) NOT NULL,
  `value` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;