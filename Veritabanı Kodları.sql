-- Schema RehberlikMerkezi
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `RehberlikMerkezi` DEFAULT CHARACTER SET utf8 ;
USE `RehberlikMerkezi` ;

-- -----------------------------------------------------
-- Table `RehberlikMerkezi`.`merkez`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RehberlikMerkezi`.`merkez` (
  `merkez_id` INT NOT NULL AUTO_INCREMENT,
  `merkez_adı` VARCHAR(45) NULL,
  `merkez_şehir` VARCHAR(45) NULL,
  `merkez_mahalle` VARCHAR(45) NULL,
  `merkez_kapı_no` INT NULL,
  `merkez_tel_no` VARCHAR(20) NULL,
  PRIMARY KEY (`merkez_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RehberlikMerkezi`.`hasta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RehberlikMerkezi`.`hasta` (
  `hasta_id` INT NOT NULL AUTO_INCREMENT,
  `hasta_tc` VARCHAR(11) NOT NULL,
  `hasta_adı` VARCHAR(45) NULL,
  `hasta_soyadı` VARCHAR(45) NULL,
  `hasta_yaş` TINYINT(110) NULL,
  `hasta_erkek_mi` VARCHAR(5) NULL,
  `hasta_şehir` VARCHAR(45) NULL,
  `hasta_mahalle` VARCHAR(45) NULL,
  `hasta_ev_no` VARCHAR(45) NULL,
  `merkez_id` INT NOT NULL,
  PRIMARY KEY (`hasta_id`),
  INDEX `fk_hasta_merkez1_idx` (`merkez_id` ASC) VISIBLE,
  CONSTRAINT `fk_hasta_merkez1`
    FOREIGN KEY (`merkez_id`)
    REFERENCES `RehberlikMerkezi`.`merkez` (`merkez_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RehberlikMerkezi`.`terapsit`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RehberlikMerkezi`.`terapsit` (
  `terapist_id` INT NOT NULL AUTO_INCREMENT,
  `terapsit_tc` VARCHAR(11) NOT NULL,
  `terapsit_adı` VARCHAR(45) NULL,
  `terapist_soyadı` VARCHAR(45) NULL,
  `terapist_uzmanlık` VARCHAR(45) NULL,
  `hasta_id` INT NOT NULL,
  `merkez_id` INT NOT NULL,
  PRIMARY KEY (`terapist_id`),
  INDEX `fk_terapsit_hasta1_idx` (`hasta_id` ASC) VISIBLE,
  INDEX `fk_terapsit_merkez1_idx` (`merkez_id` ASC) VISIBLE,
  CONSTRAINT `fk_terapsit_hasta1`
    FOREIGN KEY (`hasta_id`)
    REFERENCES `RehberlikMerkezi`.`hasta` (`hasta_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_terapsit_merkez1`
    FOREIGN KEY (`merkez_id`)
    REFERENCES `RehberlikMerkezi`.`merkez` (`merkez_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RehberlikMerkezi`.`program`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RehberlikMerkezi`.`program` (
  `program_id` INT NOT NULL AUTO_INCREMENT,
  `program_kodu` VARCHAR(4) NULL,
  `program_adı` VARCHAR(45) NULL,
  `program__kac_hafta` INT NULL,
  `terapist_id` INT NOT NULL,
  `hasta_id` INT NOT NULL,
  `merkez_id` INT NOT NULL,
  PRIMARY KEY (`program_id`),
  INDEX `fk_program_terapsit1_idx` (`terapist_id` ASC) VISIBLE,
  INDEX `fk_program_hasta1_idx` (`hasta_id` ASC) VISIBLE,
  INDEX `fk_program_merkez1_idx` (`merkez_id` ASC) VISIBLE,
  CONSTRAINT `fk_program_terapsit1`
    FOREIGN KEY (`terapist_id`)
    REFERENCES `RehberlikMerkezi`.`terapsit` (`terapist_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_program_hasta1`
    FOREIGN KEY (`hasta_id`)
    REFERENCES `RehberlikMerkezi`.`hasta` (`hasta_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_program_merkez1`
    FOREIGN KEY (`merkez_id`)
    REFERENCES `RehberlikMerkezi`.`merkez` (`merkez_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RehberlikMerkezi`.`oda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RehberlikMerkezi`.`oda` (
  `oda_id` INT NOT NULL AUTO_INCREMENT,
  `oda_no` INT NULL,
  `oda_tipi` VARCHAR(45) NULL,
  `oda_kapasitesi` INT NULL,
  `hasta_id` INT NOT NULL,
  `merkez_id` INT NOT NULL,
  PRIMARY KEY (`oda_id`),
  INDEX `fk_oda_hasta1_idx` (`hasta_id` ASC) VISIBLE,
  INDEX `fk_oda_merkez1_idx` (`merkez_id` ASC) VISIBLE,
  CONSTRAINT `fk_oda_hasta1`
    FOREIGN KEY (`hasta_id`)
    REFERENCES `RehberlikMerkezi`.`hasta` (`hasta_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_oda_merkez1`
    FOREIGN KEY (`merkez_id`)
    REFERENCES `RehberlikMerkezi`.`merkez` (`merkez_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RehberlikMerkezi`.`hasta_kaydı`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RehberlikMerkezi`.`hasta_kaydı` (
  `hasta_kaydı_id` INT NOT NULL AUTO_INCREMENT,
  `hasta_kaydı_no` INT NULL,
  `hasta_kaydı_tarih` DATE NULL,
  `hasta_kaydı_teşhis` VARCHAR(45) NULL,
  `hasta_kaydı_tedavi_yöntemi` VARCHAR(45) NULL,
  `hasta_id` INT NOT NULL,
  PRIMARY KEY (`hasta_kaydı_id`),
  INDEX `fk_hasta_kaydı_hasta1_idx` (`hasta_id` ASC) VISIBLE,
  CONSTRAINT `fk_hasta_kaydı_hasta1`
    FOREIGN KEY (`hasta_id`)
    REFERENCES `RehberlikMerkezi`.`hasta` (`hasta_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '	';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
