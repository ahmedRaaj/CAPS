SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema CAPS
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `CAPS` ;
CREATE SCHEMA IF NOT EXISTS `CAPS` DEFAULT CHARACTER SET utf8 ;
USE `CAPS` ;

-- -----------------------------------------------------
-- Table `CAPS`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CAPS`.`users` ;

CREATE TABLE IF NOT EXISTS `CAPS`.`users` (
  `userId` INT(11) NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(255) NULL DEFAULT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `password` VARCHAR(255) NULL DEFAULT NULL,
  `phone` VARCHAR(255) NULL DEFAULT NULL,
  `role` VARCHAR(255) NULL DEFAULT NULL,
  `status` VARCHAR(255) NULL DEFAULT NULL,
  `userName` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`userId`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `CAPS`.`admins`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CAPS`.`admins` ;

CREATE TABLE IF NOT EXISTS `CAPS`.`admins` (
  `adminId` INT(11) NOT NULL AUTO_INCREMENT,
  `position` VARCHAR(255) NULL DEFAULT NULL,
  `users_userId` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`adminId`),
  INDEX `FK_admins_users_userId` (`users_userId` ASC),
  CONSTRAINT `FK_admins_users_userId`
    FOREIGN KEY (`users_userId`)
    REFERENCES `CAPS`.`users` (`userId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `CAPS`.`lecturers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CAPS`.`lecturers` ;

CREATE TABLE IF NOT EXISTS `CAPS`.`lecturers` (
  `lecturerId` INT(11) NOT NULL AUTO_INCREMENT,
  `endDate` DATETIME NULL DEFAULT NULL,
  `position` VARCHAR(255) NULL DEFAULT NULL,
  `startDate` DATETIME NULL DEFAULT NULL,
  `users_userId` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`lecturerId`),
  INDEX `FK_lecturers_users_userId` (`users_userId` ASC),
  CONSTRAINT `FK_lecturers_users_userId`
    FOREIGN KEY (`users_userId`)
    REFERENCES `CAPS`.`users` (`userId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `CAPS`.`courses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CAPS`.`courses` ;

CREATE TABLE IF NOT EXISTS `CAPS`.`courses` (
  `courseId` INT(11) NOT NULL AUTO_INCREMENT,
  `courseSize` INT(11) NULL DEFAULT NULL,
  `credits` INT(11) NULL DEFAULT NULL,
  `duration` DATETIME NULL DEFAULT NULL,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `lecturers_lecturerId` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`courseId`),
  INDEX `FK_courses_lecturers_lecturerId` (`lecturers_lecturerId` ASC),
  CONSTRAINT `FK_courses_lecturers_lecturerId`
    FOREIGN KEY (`lecturers_lecturerId`)
    REFERENCES `CAPS`.`lecturers` (`lecturerId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `CAPS`.`students`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CAPS`.`students` ;

CREATE TABLE IF NOT EXISTS `CAPS`.`students` (
  `studentId` INT(11) NOT NULL AUTO_INCREMENT,
  `citizenship` VARCHAR(255) NULL DEFAULT NULL,
  `nric` VARCHAR(255) NULL DEFAULT NULL,
  `users_userId` INT(11) NULL DEFAULT NULL,
  `first_name` VARCHAR(45) NULL DEFAULT NULL,
  `last_name` VARCHAR(45) NULL DEFAULT NULL,
  `dob` DATETIME NULL DEFAULT NULL,
  `gender` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`studentId`),
  INDEX `FK_students_users_userId` (`users_userId` ASC),
  CONSTRAINT `FK_students_users_userId`
    FOREIGN KEY (`users_userId`)
    REFERENCES `CAPS`.`users` (`userId`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `CAPS`.`enroled_courses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CAPS`.`enroled_courses` ;

CREATE TABLE IF NOT EXISTS `CAPS`.`enroled_courses` (
  `endingDate` VARCHAR(255) NULL DEFAULT NULL,
  `gradePoint` VARCHAR(255) NULL DEFAULT NULL,
  `startingDate` VARCHAR(255) NULL DEFAULT NULL,
  `status` VARCHAR(255) NULL DEFAULT NULL,
  `students_studentId` INT(11) NOT NULL,
  `courses_courseId` INT(11) NOT NULL,
  PRIMARY KEY (`students_studentId`, `courses_courseId`),
  INDEX `FK_enroled_courses_courses_courseId` (`courses_courseId` ASC),
  CONSTRAINT `FK_enroled_courses_courses_courseId`
    FOREIGN KEY (`courses_courseId`)
    REFERENCES `CAPS`.`courses` (`courseId`),
  CONSTRAINT `FK_enroled_courses_students_studentId`
    FOREIGN KEY (`students_studentId`)
    REFERENCES `CAPS`.`students` (`studentId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
