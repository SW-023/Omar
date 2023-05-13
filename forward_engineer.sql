-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema little_lemon
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema little_lemon
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `little_lemon` ;
USE `little_lemon` ;

-- -----------------------------------------------------
-- Table `little_lemon`.`MenuItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon`.`MenuItems` (
  `MenuItemsID` INT NOT NULL AUTO_INCREMENT,
  `CourseName` VARCHAR(45) NOT NULL,
  `StarterName` VARCHAR(45) NOT NULL,
  `DesertName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`MenuItemsID`),
  UNIQUE INDEX `MenuItemsID_UNIQUE` (`MenuItemsID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon`.`Menus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon`.`Menus` (
  `MenuID` INT NOT NULL AUTO_INCREMENT,
  `MenuItemsID` INT NOT NULL,
  `MenuName` VARCHAR(45) NOT NULL,
  `Cuisine` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`MenuID`),
  UNIQUE INDEX `MenuID_UNIQUE` (`MenuID` ASC) VISIBLE,
  UNIQUE INDEX `Menuscol_UNIQUE` (`MenuItemsID` ASC) VISIBLE,
  CONSTRAINT `MenuItemsID`
    FOREIGN KEY (`MenuID`)
    REFERENCES `little_lemon`.`MenuItems` (`MenuItemsID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon`.`Customers` (
  `CustomersID` INT NOT NULL AUTO_INCREMENT,
  `FullName` VARCHAR(255) NOT NULL,
  `ContactNumber` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CustomersID`),
  UNIQUE INDEX `CustomersID_UNIQUE` (`CustomersID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon`.`Orders` (
  `OrdersID` INT NOT NULL AUTO_INCREMENT,
  `MenuID` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  `TotalCost` DECIMAL NOT NULL,
  PRIMARY KEY (`OrdersID`),
  UNIQUE INDEX `OrdersID_UNIQUE` (`OrdersID` ASC) VISIBLE,
  UNIQUE INDEX `MenuID_UNIQUE` (`MenuID` ASC) VISIBLE,
  UNIQUE INDEX `CustomerID_UNIQUE` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `MenuID`
    FOREIGN KEY (`MenuID`)
    REFERENCES `little_lemon`.`Menus` (`MenuID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Orders_Menus1`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `little_lemon`.`Customers` (`CustomersID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon`.`Booking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon`.`Booking` (
  `BookingID` INT NOT NULL AUTO_INCREMENT,
  `CustomerID` INT NOT NULL,
  `TableNumber` INT NOT NULL,
  `TableDate` DATE NOT NULL,
  PRIMARY KEY (`BookingID`),
  UNIQUE INDEX `BookingID_UNIQUE` (`BookingID` ASC) VISIBLE,
  UNIQUE INDEX `Bookingcol_UNIQUE` (`CustomerID` ASC) VISIBLE,
  UNIQUE INDEX `TableNumber_UNIQUE` (`TableNumber` ASC) VISIBLE,
  CONSTRAINT `CustomerID`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `little_lemon`.`Customers` (`CustomersID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
