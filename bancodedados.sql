-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Unidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Unidade` (
  `idUnidade` INT NOT NULL AUTO_INCREMENT,
  `endereco_unidade` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`idUnidade`, `endereco_unidade`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cursos` (
  `idCursos` INT NOT NULL AUTO_INCREMENT,
  `nome_curso` VARCHAR(100) NULL,
  PRIMARY KEY (`idCursos`),
  CONSTRAINT `fk_Cursos_Unidade1`
    FOREIGN KEY (`idCursos`)
    REFERENCES `mydb`.`Unidade` (`idUnidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Turmas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Turmas` (
  `idTurmas` INT NOT NULL AUTO_INCREMENT,
  `codigo` INT NULL,
  PRIMARY KEY (`idTurmas`),
  CONSTRAINT `fk_Turmas_Cursos1`
    FOREIGN KEY (`idTurmas`)
    REFERENCES `mydb`.`Cursos` (`idCursos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Matricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Matricula` (
  `idMatricula` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idMatricula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Alunos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Alunos` (
  `idAlunos` INT NOT NULL AUTO_INCREMENT,
  `nome_aluno` VARCHAR(100) NULL,
  `Matricula_idMatricula` INT NOT NULL,
  PRIMARY KEY (`idAlunos`, `Matricula_idMatricula`),
  INDEX `fk_Alunos_Matricula_idx` (`Matricula_idMatricula` ASC) VISIBLE,
  CONSTRAINT `fk_Alunos_Matricula`
    FOREIGN KEY (`Matricula_idMatricula`)
    REFERENCES `mydb`.`Matricula` (`idMatricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alunos_Turmas1`
    FOREIGN KEY (`idAlunos`)
    REFERENCES `mydb`.`Turmas` (`idTurmas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Professores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Professores` (
  `idProfessores` INT NOT NULL AUTO_INCREMENT,
  `nome_professor` VARCHAR(100) NULL,
  `Turmas_idTurmas` INT NOT NULL,
  PRIMARY KEY (`idProfessores`, `Turmas_idTurmas`),
  INDEX `fk_Professores_Turmas1_idx` (`Turmas_idTurmas` ASC) VISIBLE,
  CONSTRAINT `fk_Professores_Turmas1`
    FOREIGN KEY (`Turmas_idTurmas`)
    REFERENCES `mydb`.`Turmas` (`idTurmas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
