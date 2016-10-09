/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  pc
 * Created: 9/10/2016
 */

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Marketplace
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Marketplace
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Marketplace` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema marketplace
-- -----------------------------------------------------
USE `Marketplace` ;

-- -----------------------------------------------------
-- Table `Marketplace`.`UBICACION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Marketplace`.`UBICACION` (
  `ID_UBICACION` INT NOT NULL,
  `CIUDAD` VARCHAR(45) NULL,
  `PAIS` VARCHAR(45) NULL,
  PRIMARY KEY (`ID_UBICACION`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Marketplace`.`PARQUE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Marketplace`.`PARQUE` (
  `ID_PARQUE` INT NOT NULL,
  `PARQUE` VARCHAR(45) NULL,
  `ID_UBICACION` INT NULL,
  PRIMARY KEY (`ID_PARQUE`),
  INDEX `FK_UBICACION_idx` (`ID_UBICACION` ASC),
  CONSTRAINT `FK_P_UBICACION`
    FOREIGN KEY (`ID_UBICACION`)
    REFERENCES `Marketplace`.`UBICACION` (`ID_UBICACION`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Marketplace`.`HOTEL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Marketplace`.`HOTEL` (
  `ID_HOTEL` INT NOT NULL AUTO_INCREMENT,
  `NOMBRE` VARCHAR(45) NULL,
  `NIVEL` INT NULL,
  `DIRECCION` VARCHAR(45) NULL,
  `ID_UBICACION` INT NULL,
  PRIMARY KEY (`ID_HOTEL`),
  INDEX `UBICACION_FK_idx` (`ID_UBICACION` ASC),
  CONSTRAINT `UBICACION_H_FK`
    FOREIGN KEY (`ID_UBICACION`)
    REFERENCES `Marketplace`.`UBICACION` (`ID_UBICACION`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Marketplace`.`PLAN`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Marketplace`.`PLAN` (
  `ID_PLAN` INT NOT NULL AUTO_INCREMENT,
  `NOMBRE_PLAN` VARCHAR(45) NULL,
  `COSTO` INT NULL,
  `DESCRIPCION` VARCHAR(255) NULL,
  `DIAS` INT NULL,
  `NOCHES` INT NULL,
  `ID_PARQUE` INT NULL,
  `ID_HOTEL` INT NULL,
  PRIMARY KEY (`ID_PLAN`),
  INDEX `DESTINO_idx` (`ID_PARQUE` ASC),
  INDEX `FK_HOTEL_idx` (`ID_HOTEL` ASC),
  CONSTRAINT `DESTINO`
    FOREIGN KEY (`ID_PARQUE`)
    REFERENCES `Marketplace`.`PARQUE` (`ID_PARQUE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_HOTEL`
    FOREIGN KEY (`ID_HOTEL`)
    REFERENCES `Marketplace`.`HOTEL` (`ID_HOTEL`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Marketplace`.`ROL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Marketplace`.`ROL` (
  `ID_ROL` INT NOT NULL AUTO_INCREMENT,
  `NOMBRE` VARCHAR(45) NULL,
  PRIMARY KEY (`ID_ROL`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Marketplace`.`USUARIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Marketplace`.`USUARIO` (
  `ID_USUARIO` INT NOT NULL AUTO_INCREMENT,
  `USUARIO` VARCHAR(10) NULL,
  `CONTRASENA` VARCHAR(10) NULL,
  `NOMBRE` VARCHAR(45) NULL,
  `EMPRESA` VARCHAR(45) NULL,
  `NUMERO_DOCUMENTO` INT NULL,
  `TIPO_DOCUMENTO` INT NULL,
  `DIRECCION` VARCHAR(45) NULL,
  `TELEFONO` INT NULL,
  `ROL` INT NULL,
  PRIMARY KEY (`ID_USUARIO`),
  INDEX `ROL_FK_idx` (`ROL` ASC),
  CONSTRAINT `ROL3_FK`
    FOREIGN KEY (`ROL`)
    REFERENCES `Marketplace`.`ROL` (`ID_ROL`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Marketplace`.`USUARIO_PLAN`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Marketplace`.`USUARIO_PLAN` (
  `ID_USUARIO_PLAN` INT NOT NULL AUTO_INCREMENT,
  `ID_USUARIO` INT NULL,
  `ID_PLAN` INT NULL,
  `ESTADO` CHAR NULL,
  PRIMARY KEY (`ID_USUARIO_PLAN`),
  INDEX `PLAN_FK_idx` (`ID_PLAN` ASC),
  INDEX `USUARIO_FK_idx` (`ID_USUARIO` ASC),
  CONSTRAINT `PLAN_UP_FK`
    FOREIGN KEY (`ID_PLAN`)
    REFERENCES `Marketplace`.`PLAN` (`ID_PLAN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `USUARIO_UP_FK`
    FOREIGN KEY (`ID_USUARIO`)
    REFERENCES `Marketplace`.`USUARIO` (`ID_USUARIO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Marketplace`.`ARCHIVO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Marketplace`.`ARCHIVO` (
  `ID_ARCHIVO` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `NOMBRE` VARCHAR(45) NULL,
  `IMG` longblob,
  `Int_IdPlan` INT not NULL,
  INDEX `PLAN_FK_idx` (`Int_IdPlan` ASC));

 alter table archivo add CONSTRAINT `PLAN_A_FK` FOREIGN KEY (`Int_IdPlan`) REFERENCES `Marketplace`.`PLAN` (`ID_PLAN`);




SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
