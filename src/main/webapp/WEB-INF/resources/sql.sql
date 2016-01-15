-- -----------------------------------------------------
-- Schema mantenimiento
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mantenimiento` DEFAULT CHARACTER SET utf8 ;
USE `mantenimiento` ;

drop table form_item;
drop table epp;
drop table epp_obligatorio;
drop table epp_opcional;
drop table form;
drop table maquina_has_proyecto;
drop table maquina;

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema mantenimiento
-- -----------------------------------------------------



-- -----------------------------------------------------
-- Table `mantenimiento`.`maquina`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mantenimiento`.`maquina` ;

CREATE TABLE IF NOT EXISTS `mantenimiento`.`maquina` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `nombre` VARCHAR(45) NULL COMMENT '',
  `descripcion` VARCHAR(1500) NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mantenimiento`.`form`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mantenimiento`.`form` ;

CREATE TABLE IF NOT EXISTS `mantenimiento`.`form` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `equipo` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `fecha_realizacion` DATE NULL DEFAULT NULL COMMENT '',
  `fecha_programada` DATE NULL DEFAULT NULL COMMENT '',
  `nro_interno` INT(11) NULL DEFAULT NULL COMMENT '',
  `nro_orden` INT(11) NULL DEFAULT NULL COMMENT '',
  `epp_obligatorio` INT(11) NULL DEFAULT NULL COMMENT '',
  `epp_opcional` INT(11) NULL DEFAULT NULL COMMENT '',
  `conclusion` VARCHAR(10) NULL DEFAULT NULL COMMENT '',
  `observaciones` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `formcol` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `maquina_id` INT NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_form_maquina1_idx` (`maquina_id` ASC)  COMMENT '',
  CONSTRAINT `fk_form_maquina1`
    FOREIGN KEY (`maquina_id`)
    REFERENCES `mantenimiento`.`maquina` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mantenimiento`.`epp_obligatorio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mantenimiento`.`epp_obligatorio` ;

CREATE TABLE IF NOT EXISTS `mantenimiento`.`epp_obligatorio` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `form_id` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_epp_obligatorio_form1_idx` (`form_id` ASC)  COMMENT '',
  CONSTRAINT `fk_epp_obligatorio_form1`
    FOREIGN KEY (`form_id`)
    REFERENCES `mantenimiento`.`form` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mantenimiento`.`epp_opcional`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mantenimiento`.`epp_opcional` ;

CREATE TABLE IF NOT EXISTS `mantenimiento`.`epp_opcional` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `form_id` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_epp_opcional_form1_idx` (`form_id` ASC)  COMMENT '',
  CONSTRAINT `fk_epp_opcional_form1`
    FOREIGN KEY (`form_id`)
    REFERENCES `mantenimiento`.`form` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mantenimiento`.`epp`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mantenimiento`.`epp` ;

CREATE TABLE IF NOT EXISTS `mantenimiento`.`epp` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `nombre` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `descripcion` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `imagen` VARCHAR(1500) NULL DEFAULT NULL COMMENT '',
  `epp_obligatorio_id` INT(11) NOT NULL COMMENT '',
  `epp_opcional_id` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_epp_epp_obligatorio1_idx` (`epp_obligatorio_id` ASC)  COMMENT '',
  INDEX `fk_epp_epp_opcional1_idx` (`epp_opcional_id` ASC)  COMMENT '',
  CONSTRAINT `fk_epp_epp_obligatorio1`
    FOREIGN KEY (`epp_obligatorio_id`)
    REFERENCES `mantenimiento`.`epp_obligatorio` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_epp_epp_opcional1`
    FOREIGN KEY (`epp_opcional_id`)
    REFERENCES `mantenimiento`.`epp_opcional` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mantenimiento`.`form_item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mantenimiento`.`form_item` ;

CREATE TABLE IF NOT EXISTS `mantenimiento`.`form_item` (
  `idform_item` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `form_id` INT(11) NOT NULL COMMENT '',
  `label` VARCHAR(250) NULL DEFAULT NULL COMMENT '',
  `posee` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `estado` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `observaciones` VARCHAR(1500) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`idform_item`)  COMMENT '',
  INDEX `fk_form_item_form_idx` (`form_id` ASC)  COMMENT '',
  CONSTRAINT `fk_form_item_form`
    FOREIGN KEY (`form_id`)
    REFERENCES `mantenimiento`.`form` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mantenimiento`.`empresa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mantenimiento`.`empresa` ;

CREATE TABLE IF NOT EXISTS `mantenimiento`.`empresa` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `nombre` VARCHAR(45) NULL COMMENT '',
  `descripcion` VARCHAR(1500) NULL COMMENT '',
  `urlImagen` VARCHAR(1500) NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mantenimiento`.`proyecto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mantenimiento`.`proyecto` ;

CREATE TABLE IF NOT EXISTS `mantenimiento`.`proyecto` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `nombre` VARCHAR(45) NULL COMMENT '',
  `sso_id` VARCHAR(30) NULL COMMENT '',
  `descripcion` VARCHAR(1500) NULL COMMENT '',
  `empresa_id` INT NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_proyecto_empresa1_idx` (`empresa_id` ASC)  COMMENT '',
  CONSTRAINT `fk_proyecto_empresa1`
    FOREIGN KEY (`empresa_id`)
    REFERENCES `mantenimiento`.`empresa` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mantenimiento`.`maquina_has_proyecto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mantenimiento`.`maquina_has_proyecto` ;

CREATE TABLE IF NOT EXISTS `mantenimiento`.`maquina_has_proyecto` (
  `maquina_id` INT NOT NULL COMMENT '',
  `proyecto_id` INT NOT NULL COMMENT '',
  PRIMARY KEY (`maquina_id`, `proyecto_id`)  COMMENT '',
  INDEX `fk_maquina_has_proyecto_proyecto1_idx` (`proyecto_id` ASC)  COMMENT '',
  INDEX `fk_maquina_has_proyecto_maquina1_idx` (`maquina_id` ASC)  COMMENT '',
  CONSTRAINT `fk_maquina_has_proyecto_maquina1`
    FOREIGN KEY (`maquina_id`)
    REFERENCES `mantenimiento`.`maquina` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_maquina_has_proyecto_proyecto1`
    FOREIGN KEY (`proyecto_id`)
    REFERENCES `mantenimiento`.`proyecto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

/* Populate USER_PROFILE Table */
/*INSERT INTO USER_PROFILE(type)
VALUES ('USER');*/
 
INSERT INTO USER_PROFILE(type)
VALUES ('ADMIN');

INSERT INTO USER_PROFILE(type)
VALUES ('OPERARIO');

INSERT INTO USER_PROFILE(type)
VALUES ('USUARIO ');
 
INSERT INTO USER_PROFILE(type)
VALUES ('DBA');
 
/* Populate APP_USER Table */
INSERT INTO APP_USER(sso_id, password, first_name, last_name, email, state)
VALUES ('admin','admin', 'admin','admin','bill@xyz.com', 'Active');
 
INSERT INTO APP_USER(sso_id, password, first_name, last_name, email, state)
VALUES ('user','user', 'user','user','danny@xyz.com', 'Active');
 
INSERT INTO APP_USER(sso_id, password, first_name, last_name, email, state)
VALUES ('operario','abc125', 'Sam','Smith','samy@xyz.com', 'Active');
 
 
/* Populate JOIN Table */
INSERT INTO APP_USER_USER_PROFILE (user_id, user_profile_id)
  SELECT user.id, profile.id FROM app_user user, user_profile profile  
  where user.sso_id='admin' and profile.type='USUARIO';
 
INSERT INTO APP_USER_USER_PROFILE (user_id, user_profile_id)
  SELECT user.id, profile.id FROM app_user user, user_profile profile
  where user.sso_id='admin' and profile.type='DBA';
 
INSERT INTO APP_USER_USER_PROFILE (user_id, user_profile_id)
  SELECT user.id, profile.id FROM app_user user, user_profile profile
  where user.sso_id='admin' and profile.type='ADMIN';
  
 INSERT INTO APP_USER_USER_PROFILE (user_id, user_profile_id)
  SELECT user.id, profile.id FROM app_user user, user_profile profile  
  where user.sso_id='user' and profile.type='USUARIO';
 
INSERT INTO APP_USER_USER_PROFILE (user_id, user_profile_id)
  SELECT user.id, profile.id FROM app_user user, user_profile profile
  where user.sso_id='operario' and profile.type='OPERARIO';
 
  
 select * from APP_USER_USER_PROFILE inner join app_user on app_user.id = app_user_user_profile.USER_ID inner join user_profile on user_profile.id = app_user_user_profile.USER_PROFILE_ID; 
 select * from app_user_user_profile;
  