-- MySQL Script generated by MySQL Workbench
-- 01/24/17 09:05:30
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Utilsateur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Utilsateur` (
  `idUtilsateur` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NULL,
  `Prenom` VARCHAR(45) NULL,
  `Mail` VARCHAR(45) NULL,
  `Mdp` VARCHAR(45) NULL,
  `Type` VARCHAR(45) NULL,
  `Rue` VARCHAR(45) NULL,
  `Numero` INT NULL,
  `CodePostal` INT NULL,
  `Ville` VARCHAR(45) NULL,
  PRIMARY KEY (`idUtilsateur`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Piece`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Piece` (
  `idPiece` INT NOT NULL AUTO_INCREMENT,
  `NomPiece` VARCHAR(45) NULL,
  `Surface` INT NULL,
  `Utilsateur_idUtilsateur` INT NOT NULL,
  PRIMARY KEY (`idPiece`, `Utilsateur_idUtilsateur`),
  INDEX `fk_Pièce_Utilsateur1_idx` (`Utilsateur_idUtilsateur` ASC),
  CONSTRAINT `fk_Pièce_Utilsateur1`
    FOREIGN KEY (`Utilsateur_idUtilsateur`)
    REFERENCES `mydb`.`Utilsateur` (`idUtilsateur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Fonctionnalite`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Fonctionnalite` (
  `idFonctionnalite` INT NOT NULL AUTO_INCREMENT,
  `CeMac_idCeMac` INT NOT NULL,
  `CeMac_Piece_idPiece` INT NOT NULL,
  `NomFonctionnalite` VARCHAR(45) NULL,
  `Description` VARCHAR(45) NULL,
  `CleProduit` INT NULL,
  `Piece_idPiece` INT NOT NULL,
  `Piece_Utilsateur_idUtilsateur` INT NOT NULL,
  PRIMARY KEY (`idFonctionnalite`, `CeMac_idCeMac`, `CeMac_Piece_idPiece`, `Piece_idPiece`, `Piece_Utilsateur_idUtilsateur`),
  INDEX `fk_Fonctionnalite_Piece1_idx` (`Piece_idPiece` ASC, `Piece_Utilsateur_idUtilsateur` ASC),
  CONSTRAINT `fk_Fonctionnalite_Piece1`
    FOREIGN KEY (`Piece_idPiece` , `Piece_Utilsateur_idUtilsateur`)
    REFERENCES `mydb`.`Piece` (`idPiece` , `Utilsateur_idUtilsateur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CapteurActionneur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CapteurActionneur` (
  `idCapteurActionneur` INT NOT NULL AUTO_INCREMENT,
  `CapteurActionneur` TINYINT(1) NULL,
  `Etat` TINYINT(1) NULL,
  `Fonctionnalite_idFonctionnalite` INT NOT NULL,
  `Fonctionnalite_Piece_idPiece` INT NOT NULL,
  `Fonctionnalite_Piece_Utilsateur_idUtilsateur` INT NOT NULL,
  PRIMARY KEY (`idCapteurActionneur`, `Fonctionnalite_idFonctionnalite`, `Fonctionnalite_Piece_idPiece`, `Fonctionnalite_Piece_Utilsateur_idUtilsateur`),
  INDEX `fk_CapteurActionneur_Fonctionnalite1_idx` (`Fonctionnalite_idFonctionnalite` ASC, `Fonctionnalite_Piece_idPiece` ASC, `Fonctionnalite_Piece_Utilsateur_idUtilsateur` ASC),
  CONSTRAINT `fk_CapteurActionneur_Fonctionnalite1`
    FOREIGN KEY (`Fonctionnalite_idFonctionnalite` , `Fonctionnalite_Piece_idPiece` , `Fonctionnalite_Piece_Utilsateur_idUtilsateur`)
    REFERENCES `mydb`.`Fonctionnalite` (`idFonctionnalite` , `Piece_idPiece` , `Piece_Utilsateur_idUtilsateur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Donnee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Donnee` (
  `idDonnee` INT NOT NULL AUTO_INCREMENT,
  `Valeur` INT NULL,
  `DateHeure` DATETIME NULL,
  `CapteurActionneur_idCapteurActionneur` INT NOT NULL,
  `CapteurActionneur_Fonctionnalite_idFonctionnalite` INT NOT NULL,
  `CapteurActionneur_Fonctionnalite_Piece_idPiece` INT NOT NULL,
  `CapteurActionneur_Fonctionnalite_Piece_Utilsateur_idUtilsateur` INT NOT NULL,
  PRIMARY KEY (`idDonnee`, `CapteurActionneur_idCapteurActionneur`, `CapteurActionneur_Fonctionnalite_idFonctionnalite`, `CapteurActionneur_Fonctionnalite_Piece_idPiece`, `CapteurActionneur_Fonctionnalite_Piece_Utilsateur_idUtilsateur`),
  INDEX `fk_Donnee_CapteurActionneur1_idx` (`CapteurActionneur_idCapteurActionneur` ASC, `CapteurActionneur_Fonctionnalite_idFonctionnalite` ASC, `CapteurActionneur_Fonctionnalite_Piece_idPiece` ASC, `CapteurActionneur_Fonctionnalite_Piece_Utilsateur_idUtilsateur` ASC),
  CONSTRAINT `fk_Donnee_CapteurActionneur1`
    FOREIGN KEY (`CapteurActionneur_idCapteurActionneur` , `CapteurActionneur_Fonctionnalite_idFonctionnalite` , `CapteurActionneur_Fonctionnalite_Piece_idPiece` , `CapteurActionneur_Fonctionnalite_Piece_Utilsateur_idUtilsateur`)
    REFERENCES `mydb`.`CapteurActionneur` (`idCapteurActionneur` , `Fonctionnalite_idFonctionnalite` , `Fonctionnalite_Piece_idPiece` , `Fonctionnalite_Piece_Utilsateur_idUtilsateur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Question/Reponse`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Question/Reponse` (
  `idQuestion` INT NOT NULL AUTO_INCREMENT,
  `Question` MEDIUMTEXT NULL,
  `Reponse` MEDIUMTEXT NULL,
  PRIMARY KEY (`idQuestion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Panne`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Panne` (
  `idPanne` INT NOT NULL AUTO_INCREMENT,
  `Type` VARCHAR(45) NULL,
  `DateHeure` DATETIME NULL,
  `Fonctionnalite_idFonctionnalite` INT NOT NULL,
  `Fonctionnalite_Piece_idPiece` INT NOT NULL,
  `Fonctionnalite_Piece_Utilsateur_idUtilsateur` INT NOT NULL,
  PRIMARY KEY (`idPanne`, `Fonctionnalite_idFonctionnalite`, `Fonctionnalite_Piece_idPiece`, `Fonctionnalite_Piece_Utilsateur_idUtilsateur`),
  INDEX `fk_Panne_Fonctionnalite1_idx` (`Fonctionnalite_idFonctionnalite` ASC, `Fonctionnalite_Piece_idPiece` ASC, `Fonctionnalite_Piece_Utilsateur_idUtilsateur` ASC),
  CONSTRAINT `fk_Panne_Fonctionnalite1`
    FOREIGN KEY (`Fonctionnalite_idFonctionnalite` , `Fonctionnalite_Piece_idPiece` , `Fonctionnalite_Piece_Utilsateur_idUtilsateur`)
    REFERENCES `mydb`.`Fonctionnalite` (`idFonctionnalite` , `Piece_idPiece` , `Piece_Utilsateur_idUtilsateur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ProduitReference`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ProduitReference` (
  `idProduitReference` INT NOT NULL AUTO_INCREMENT,
  `CleProduit` INT NULL,
  `DateLivraison` DATETIME NULL,
  `DateEmission` DATETIME NULL,
  `Type` VARCHAR(45) NULL,
  PRIMARY KEY (`idProduitReference`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Consigne`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Consigne` (
  `idConsigne` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NULL,
  `DateDebut` DATETIME NULL,
  `DateFin` DATETIME NULL,
  `Fonctionnalite_idFonctionnalite` INT NOT NULL,
  `Fonctionnalite_Piece_idPiece` INT NOT NULL,
  `Fonctionnalite_Piece_Utilsateur_idUtilsateur` INT NOT NULL,
  PRIMARY KEY (`idConsigne`, `Fonctionnalite_idFonctionnalite`, `Fonctionnalite_Piece_idPiece`, `Fonctionnalite_Piece_Utilsateur_idUtilsateur`),
  INDEX `fk_Consigne_Fonctionnalite1_idx` (`Fonctionnalite_idFonctionnalite` ASC, `Fonctionnalite_Piece_idPiece` ASC, `Fonctionnalite_Piece_Utilsateur_idUtilsateur` ASC),
  CONSTRAINT `fk_Consigne_Fonctionnalite1`
    FOREIGN KEY (`Fonctionnalite_idFonctionnalite` , `Fonctionnalite_Piece_idPiece` , `Fonctionnalite_Piece_Utilsateur_idUtilsateur`)
    REFERENCES `mydb`.`Fonctionnalite` (`idFonctionnalite` , `Piece_idPiece` , `Piece_Utilsateur_idUtilsateur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ContactSupport`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ContactSupport` (
  `idContactSupport` INT NOT NULL AUTO_INCREMENT,
  `Telephone` INT NULL,
  `Mail` VARCHAR(45) NULL,
  `Rue` VARCHAR(45) NULL,
  `Numero` INT NULL,
  `CodePostal` VARCHAR(45) NULL,
  PRIMARY KEY (`idContactSupport`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
