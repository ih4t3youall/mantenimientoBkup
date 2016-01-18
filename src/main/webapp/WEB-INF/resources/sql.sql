drop schema mantenimiento;
CREATE SCHEMA IF NOT EXISTS `mantenimiento` DEFAULT CHARACTER SET utf8 ;
USE `mantenimiento` ;
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
-- Schema mantenimiento
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mantenimiento` DEFAULT CHARACTER SET utf8 ;
USE `mantenimiento` ;

-- -----------------------------------------------------
-- Table `mantenimiento`.`app_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mantenimiento`.`app_user` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '',
  `sso_id` VARCHAR(30) NOT NULL COMMENT '',
  `password` VARCHAR(100) NOT NULL COMMENT '',
  `first_name` VARCHAR(30) NOT NULL COMMENT '',
  `last_name` VARCHAR(30) NOT NULL COMMENT '',
  `email` VARCHAR(30) NOT NULL COMMENT '',
  `state` VARCHAR(30) NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  UNIQUE INDEX `sso_id` (`sso_id` ASC)  COMMENT '')
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mantenimiento`.`user_profile`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mantenimiento`.`user_profile` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '',
  `type` VARCHAR(30) NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  UNIQUE INDEX `type` (`type` ASC)  COMMENT '')
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mantenimiento`.`app_user_user_profile`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mantenimiento`.`app_user_user_profile` (
  `user_id` BIGINT(20) NOT NULL COMMENT '',
  `user_profile_id` BIGINT(20) NOT NULL COMMENT '',
  PRIMARY KEY (`user_id`, `user_profile_id`)  COMMENT '',
  INDEX `FK_USER_PROFILE` (`user_profile_id` ASC)  COMMENT '',
  CONSTRAINT `FK_APP_USER`
    FOREIGN KEY (`user_id`)
    REFERENCES `mantenimiento`.`app_user` (`id`),
  CONSTRAINT `FK_USER_PROFILE`
    FOREIGN KEY (`user_profile_id`)
    REFERENCES `mantenimiento`.`user_profile` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mantenimiento`.`maquina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mantenimiento`.`maquina` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `nombre` VARCHAR(45) NULL COMMENT '',
  `descripcion` VARCHAR(1500) NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mantenimiento`.`form`
-- -----------------------------------------------------
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
CREATE TABLE IF NOT EXISTS `mantenimiento`.`proyecto` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `nombre` VARCHAR(45) NULL COMMENT '',
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


-- -----------------------------------------------------
-- Table `mantenimiento`.`usuario_asignado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mantenimiento`.`usuario_asignado` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `sso_id` VARCHAR(30) NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mantenimiento`.`proyecto_has_usuario_asignado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mantenimiento`.`proyecto_has_usuario_asignado` (
  `proyecto_id` INT NOT NULL COMMENT '',
  `usuario_asignado_id` INT NOT NULL COMMENT '',
  PRIMARY KEY (`proyecto_id`, `usuario_asignado_id`)  COMMENT '',
  INDEX `fk_proyecto_has_usuario_asignado_usuario_asignado1_idx` (`usuario_asignado_id` ASC)  COMMENT '',
  INDEX `fk_proyecto_has_usuario_asignado_proyecto1_idx` (`proyecto_id` ASC)  COMMENT '',
  CONSTRAINT `fk_proyecto_has_usuario_asignado_proyecto1`
    FOREIGN KEY (`proyecto_id`)
    REFERENCES `mantenimiento`.`proyecto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_proyecto_has_usuario_asignado_usuario_asignado1`
    FOREIGN KEY (`usuario_asignado_id`)
    REFERENCES `mantenimiento`.`usuario_asignado` (`id`)
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
 
  
 --select * from APP_USER_USER_PROFILE inner join app_user on app_user.id = app_user_user_profile.USER_ID inner join user_profile on user_profile.id = app_user_user_profile.USER_PROFILE_ID; 
 --select * from app_user_user_profile;
