-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema bancodedados
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bancodedados
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bancodedados` DEFAULT CHARACTER SET utf8 ;
USE `bancodedados` ;

-- -----------------------------------------------------
-- Table `bancodedados`.`Unidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancodedados`.`Unidade` (
  `idUnidade` INT NOT NULL AUTO_INCREMENT,
  `endereço_unidade` VARCHAR(45) NULL,
  PRIMARY KEY (`idUnidade`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bancodedados`.`Cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancodedados`.`Cursos` (
  `idCursos` INT NOT NULL AUTO_INCREMENT,
  `nome_curso` VARCHAR(45) NULL,
  PRIMARY KEY (`idCursos`),
  CONSTRAINT `fk_Cursos_Unidade1`
    FOREIGN KEY (`idCursos`)
    REFERENCES `bancodedados`.`Unidade` (`idUnidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bancodedados`.`Turmas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancodedados`.`Turmas` (
  `idTurmas` INT NOT NULL AUTO_INCREMENT,
  `codigo` VARCHAR(45) NULL,
  PRIMARY KEY (`idTurmas`),
  CONSTRAINT `fk_Turmas_Cursos1`
    FOREIGN KEY (`idTurmas`)
    REFERENCES `bancodedados`.`Cursos` (`idCursos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bancodedados`.`Matricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancodedados`.`Matricula` (
  `idMatricula` INT NOT NULL AUTO_INCREMENT,
  `nome_aluno` VARCHAR(45) NULL,
  PRIMARY KEY (`idMatricula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bancodedados`.`Alunos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancodedados`.`Alunos` (
  `idAlunos` INT NOT NULL AUTO_INCREMENT,
  `nome_aluno` VARCHAR(45) NULL,
  `Matricula_idMatricula` INT NOT NULL,
  PRIMARY KEY (`idAlunos`, `Matricula_idMatricula`),
  INDEX `fk_Alunos_Matricula1_idx` (`Matricula_idMatricula` ASC) VISIBLE,
  CONSTRAINT `fk_Alunos_Turmas1`
    FOREIGN KEY (`idAlunos`)
    REFERENCES `bancodedados`.`Turmas` (`idTurmas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alunos_Matricula1`
    FOREIGN KEY (`Matricula_idMatricula`)
    REFERENCES `bancodedados`.`Matricula` (`idMatricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bancodedados`.`Professores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancodedados`.`Professores` (
  `idProfessores` INT NOT NULL AUTO_INCREMENT,
  `nome_professor` VARCHAR(45) NULL,
  `Turmas_idTurmas` INT NOT NULL,
  PRIMARY KEY (`idProfessores`, `Turmas_idTurmas`),
  INDEX `fk_Professores_Turmas1_idx` (`Turmas_idTurmas` ASC) VISIBLE,
  CONSTRAINT `fk_Professores_Turmas1`
    FOREIGN KEY (`Turmas_idTurmas`)
    REFERENCES `bancodedados`.`Turmas` (`idTurmas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
