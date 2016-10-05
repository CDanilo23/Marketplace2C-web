SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `Marketplace` ;
CREATE SCHEMA IF NOT EXISTS `Marketplace` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `Marketplace` ;

-- -----------------------------------------------------
-- Table `Marketplace`.`ROL`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Marketplace`.`ROL` ;

CREATE TABLE IF NOT EXISTS `Marketplace`.`ROL` (
  `ID_ROL` INT NOT NULL AUTO_INCREMENT,
  `NOMBRE` VARCHAR(45) NULL,
  PRIMARY KEY (`ID_ROL`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Marketplace`.`CLIENTE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Marketplace`.`CLIENTE` ;

CREATE TABLE IF NOT EXISTS `Marketplace`.`CLIENTE` (
  `ID_CLIENTE` INT NOT NULL,
  `NOMBRE` VARCHAR(45) NULL,
  `TELEFONO` VARCHAR(45) NULL,
  `EMAIL` VARCHAR(45) NULL,
  `DIRECCION` VARCHAR(45) NULL,
  `ID_ROL` INT NULL,
  PRIMARY KEY (`ID_CLIENTE`),
  INDEX `ROL_FK_idx` (`ID_ROL` ASC),
  CONSTRAINT `ROL_FK`
    FOREIGN KEY (`ID_ROL`)
    REFERENCES `Marketplace`.`ROL` (`ID_ROL`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Marketplace`.`PARQUE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Marketplace`.`PARQUE` ;

CREATE TABLE IF NOT EXISTS `Marketplace`.`PARQUE` (
  `ID_PARQUE` INT NOT NULL AUTO_INCREMENT,
  `CIUDAD` VARCHAR(45) NULL,
  `PAIS` VARCHAR(45) NULL,
  `PARQUE` VARCHAR(45) NULL,
  `IMG` VARCHAR(45) NULL,
  PRIMARY KEY (`ID_PARQUE`))
ENGINE = InnoDB;





-- -----------------------------------------------------
-- Table `Marketplace`.`HOTEL`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Marketplace`.`HOTEL` ;

CREATE TABLE IF NOT EXISTS `Marketplace`.`HOTEL` (
  `ID_HOTEL` INT NOT NULL AUTO_INCREMENT,
  `NOMBRE` VARCHAR(45) NULL,
  `NIVEL` VARCHAR(45) NULL,
  `DIRECCION` VARCHAR(45) NULL,
  PRIMARY KEY (`ID_HOTEL`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Marketplace`.`PROVEEDOR`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Marketplace`.`PROVEEDOR` ;

CREATE TABLE IF NOT EXISTS `Marketplace`.`PROVEEDOR` (
  `ID_PROVEEDOR` INT NOT NULL AUTO_INCREMENT,
  `NOMBRE` VARCHAR(45) NULL,
  `EMPRESA` VARCHAR(45) NULL,
  `NIT` VARCHAR(10) NULL,
  `DIRECCION` VARCHAR(45) NULL,
  `TELEFONO` INT NULL,
  `ID_ROL` INT NULL,
  PRIMARY KEY (`ID_PROVEEDOR`),
  INDEX `ROL2_FK_idx` (`ID_ROL` ASC),
  CONSTRAINT `ROL2_FK`
    FOREIGN KEY (`ID_ROL`)
    REFERENCES `Marketplace`.`ROL` (`ID_ROL`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Marketplace`.`PLAN`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Marketplace`.`PLAN` ;

CREATE TABLE IF NOT EXISTS `Marketplace`.`PLAN` (
  `ID_PLAN` INT NOT NULL AUTO_INCREMENT Primary key,
  `NOMBRE_PLAN` VARCHAR(45) NULL,
  `COSTO` INT NULL,
  `DESCRIPCION` VARCHAR(45) NULL,
  `DIAS` INT NULL,
  `NOCHES` INT NULL,
  `ID_PARQUE` INT NULL,
  `ID_ARCHIVO` VARCHAR(45) NULL,
  `ID_HOTEL` INT NULL,
  `ID_PROVEEDOR` INT NULL,
  `ESTADO` INT NULL,
  `DESCUENTO`  int,
  `PAGINA`  VARCHAR(45),
  INDEX `DESTINO_idx` (`ID_PARQUE` ASC),
  CONSTRAINT `DESTINO`
    FOREIGN KEY (`ID_PARQUE`)
    REFERENCES `Marketplace`.`PARQUE` (`ID_PARQUE`),
	FOREIGN KEY (`ID_HOTEL`)
    REFERENCES `Marketplace`.`HOTEL` (`ID_HOTEL`),
	FOREIGN KEY (`ID_PROVEEDOR`)
    REFERENCES `Marketplace`.`PROVEEDOR` (`ID_PROVEEDOR`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;






-- -----------------------------------------------------
-- Table `Marketplace`.`USUARIO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Marketplace`.`USUARIO` ;

CREATE TABLE IF NOT EXISTS `Marketplace`.`USUARIO` (
  `ID_USUARIO` INT NOT NULL AUTO_INCREMENT,
  `USUARIO` VARCHAR(20) NULL,
  `CONTRASENA` VARCHAR(20) NULL,
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
-- Table `Marketplace`.`CLIENTE_PLAN`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Marketplace`.`CLIENTE_PLAN` ;

CREATE TABLE IF NOT EXISTS `Marketplace`.`CLIENTE_PLAN` (
  `ID_PLAN_CLIENTE` INT NOT NULL AUTO_INCREMENT,
  `ID_CLIENTE` INT NULL,
  `ID_PLAN` INT NULL,
  `ESTADO` CHAR NULL,
  PRIMARY KEY (`ID_PLAN_CLIENTE`),
  INDEX `CLIENTE_FK_idx` (`ID_CLIENTE` ASC),
  INDEX `PLAN_idx` (`ID_PLAN` ASC),
  CONSTRAINT `CLIENTE_FK`
    FOREIGN KEY (`ID_CLIENTE`)
    REFERENCES `Marketplace`.`CLIENTE` (`ID_CLIENTE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PLAN_PK`
    FOREIGN KEY (`ID_PLAN`)
    REFERENCES `Marketplace`.`PLAN` (`ID_PLAN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Table `Marketplace`.`MENSAJE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Marketplace`.`MENSAJE` ;
CREATE TABLE IF NOT EXISTS `Marketplace`.`MENSAJE` (
  `ID_MENSAJE` INT NOT NULL AUTO_INCREMENT,
  `ID_PROVEEDOR` INT NULL,
  `ID_CLIENTE` INT NULL,
  `MENSAJE` VARCHAR(255) NULL,
  PRIMARY KEY (`ID_MENSAJE`),
  INDEX `FK_M_ID_PROVEEDOR_idx` (`ID_PROVEEDOR` ASC),
  INDEX `FK_M_ID_CLIENTE_idx` (`ID_CLIENTE` ASC),
  CONSTRAINT `FK_M_ID_PROVEEDOR`
    FOREIGN KEY (`ID_PROVEEDOR`)
    REFERENCES `Marketplace`.`PROVEEDOR` (`ID_PROVEEDOR`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_M_ID_CLIENTE`
    FOREIGN KEY (`ID_CLIENTE`)
    REFERENCES `Marketplace`.`CLIENTE` (`ID_CLIENTE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;