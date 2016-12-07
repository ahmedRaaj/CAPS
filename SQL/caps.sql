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
  `userName` VARCHAR(255) NULL DEFAULT NULL,
  `password` VARCHAR(255) NULL DEFAULT NULL,
  `role` VARCHAR(255) NULL DEFAULT NULL,
  `status` VARCHAR(255) NULL DEFAULT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `phone` VARCHAR(255) NULL DEFAULT NULL,
  `address` VARCHAR(255) NULL DEFAULT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `dob` DATETIME NULL,
  `gender` VARCHAR(45) NULL,
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
  `user_userId` INT(11) NOT NULL,
  PRIMARY KEY (`adminId`),
  INDEX `fk_admins_users1_idx` (`user_userId` ASC),
  UNIQUE INDEX `user_userId_UNIQUE` (`user_userId` ASC),
  CONSTRAINT `fk_admins_users1`
    FOREIGN KEY (`user_userId`)
    REFERENCES `CAPS`.`users` (`userId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
  `user_userId` INT(11) NOT NULL,
  PRIMARY KEY (`lecturerId`),
  INDEX `fk_lecturers_users1_idx` (`user_userId` ASC),
  UNIQUE INDEX `user_userId_UNIQUE` (`user_userId` ASC),
  CONSTRAINT `fk_lecturers_users1`
    FOREIGN KEY (`user_userId`)
    REFERENCES `CAPS`.`users` (`userId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
  `duration` VARCHAR(255) NULL DEFAULT NULL,
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
  `nric` VARCHAR(255) NULL DEFAULT NULL,
  `citizenship` VARCHAR(255) NULL DEFAULT NULL,
  `user_userId` INT(11) NOT NULL,
  PRIMARY KEY (`studentId`),
  INDEX `fk_students_users1_idx` (`user_userId` ASC),
  UNIQUE INDEX `user_userId_UNIQUE` (`user_userId` ASC),
  CONSTRAINT `fk_students_users1`
    FOREIGN KEY (`user_userId`)
    REFERENCES `CAPS`.`users` (`userId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `CAPS`.`enroled_courses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CAPS`.`enrolled_courses` ;

CREATE TABLE IF NOT EXISTS `CAPS`.`enrolled_courses` (
  `students_studentId` INT(11) NOT NULL,
  `courses_courseId` INT(11) NOT NULL,
  `startingDate` VARCHAR(255) NULL DEFAULT NULL,
  `endingDate` VARCHAR(255) NULL DEFAULT NULL,
  `gradePoint` VARCHAR(255) NULL DEFAULT NULL,
  `status` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`students_studentId`, `courses_courseId`),
  INDEX `FK_enrolled_courses_courses_courseId` (`courses_courseId` ASC),
  CONSTRAINT `FK_enroled_courses_courses_courseId`
    FOREIGN KEY (`courses_courseId`)
    REFERENCES `CAPS`.`courses` (`courseId`),
  CONSTRAINT `FK_enrolled_courses_students_studentId`
    FOREIGN KEY (`students_studentId`)
    REFERENCES `CAPS`.`students` (`studentId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

insert into users 
(username, password, role, status, email, phone, address, first_name, last_name, dob, gender)
values
('admin1', 'password', 'admin', 'active', 'admin1@u.nus.edu', '12345678', 'Block 5, 01-25, Some Nice Street, 234568', 'admin', 'Sah', str_to_date('4-11-1980', '%d-%m-%Y'), 'Female'),
('raj', 'password', 'student', 'active', 'raj@u.nus.edu', '22345678', 'Block 5, 01-25, Some Nice Street, 234568', 'Raaj', 'Mohammad', str_to_date('5-10-1985', '%d-%m-%Y'), 'Male'),
('janaki', 'password', 'student', 'active', 'janaki@u.nus.edu', '32345678', 'Block 5, 01-25, Some Nice Street, 234568', 'Janaki', 'Mrs', str_to_date('1-4-1990', '%d-%m-%Y'), 'Female'),
('zoe', 'password', 'student', 'active', 'zoe@u.nus.edu', '42345678', 'Block 5, 01-25, Some Nice Street, 234568', 'Zoe', 'Wei', str_to_date('2-8-1993', '%d-%m-%Y'), 'Female'),
('kaung', 'password', 'student', 'active', 'kaung@u.nus.edu', '52345678', 'Block 5, 01-25, Some Nice Street, 234568', 'Kaung', 'Myat', str_to_date('17-4-1994', '%d-%m-%Y'), 'Male'),
('xuran', 'password', 'student', 'active', 'xuran@u.nus.edu', '62345678', 'Block 5, 01-25, Some Nice Street, 234568', 'Xuran', 'Liu', str_to_date('19-8-1993', '%d-%m-%Y'), 'Female'),
('zwe', 'password', 'student', 'active', 'zwe@u.nus.edu', '72345678', 'Block 5, 01-25, Some Nice Street, 234568', 'Zwe', 'Htet', str_to_date('3-8-1993', '%d-%m-%Y'), 'Male'),
('xianhan', 'password', 'student', 'active', 'xianhan@u.nus.edu', '82345678', 'Block 5, 01-25, Some Nice Street, 234568', 'Xian', 'Han', str_to_date('30-1-1993', '%d-%m-%Y'), 'Male'),
('lau', 'password', 'student', 'active', 'lau@u.nus.edu', '92345678', 'Block 5, 01-25, Some Nice Street, 234568', 'Lau', 'Pau', str_to_date('17-4-1978', '%d-%m-%Y'), 'Male'),
('suria', 'password', 'lecturer', 'active', 'suria@u.nus.edu', '10345678', 'Block 5, 01-25, Some Nice Street, 234568', 'Suria', 'R', str_to_date('4-11-1980', '%d-%m-%Y'), 'Female'),
('zhimin', 'password', 'lecturer', 'active', 'zhimin@u.nus.edu', '21345678', 'Block 5, 01-25, Some Nice Street, 234568', 'Zhi', 'Min', str_to_date('11-7-1980', '%d-%m-%Y'), 'Male'),
('derek', 'password', 'lecturer', 'active', 'derek@u.nus.edu', '23345678', 'Block 5, 01-25, Some Nice Street, 234568', 'Derek', 'Kiong', str_to_date('2-12-1980', '%d-%m-%Y'), 'Male'),
('esther', 'password', 'lecturer', 'active', 'estha@u.nus.edu', '24345678', 'Block 5, 01-25, Some Nice Street, 234568', 'Esther', 'Tan', str_to_date('24-7-1980', '%d-%m-%Y'), 'Female'),
('boonkui', 'password', 'lecturer', 'active', 'boonkui@u.nus.edu', '25345678', 'Block 5, 01-25, Some Nice Street, 234568', 'Boon', 'Kui', str_to_date('7-7-1980', '%d-%m-%Y'), 'Male'),
('han', 'password', 'lecturer', 'active', 'han@u.nus.edu', '26345678', 'Block 5, 01-25, Some Nice Street, 234568', 'Han', 'Mr', str_to_date('1-1-1980', '%d-%m-%Y'), 'Male');

insert into students 
(nric, citizenship, user_userId)
values
('S1234567A', 'Sri Lanka', 2),
('S2334567A', 'India', 3),
('S3434567A', 'Singapore', 4),
('S4534567A', 'Myanmar', 5),
('S5634567A', 'China', 6),
('S6734567A', 'Myanmar', 7),
('S7834567A', 'China', 8),
('S8934567A', 'Singapore', 9);

insert into admins (position, user_userId)
values
('admin', 2);

insert into lecturers
(startDate, endDate, position, user_userId)
values
(STR_TO_DATE('1-01-2000', '%d-%m-%Y'), null, 'lecturer', 10),
(STR_TO_DATE('2-02-2010', '%d-%m-%Y'), null, 'lecturer', 11),
(STR_TO_DATE('3-03-2000', '%d-%m-%Y'), null, 'lecturer', 12),
(STR_TO_DATE('4-04-2000', '%d-%m-%Y'), null, 'lecturer', 13),
(STR_TO_DATE('5-05-2005', '%d-%m-%Y'), null, 'lecturer', 14),
(STR_TO_DATE('6-06-2003', '%d-%m-%Y'), null, 'lecturer', 15);

insert into courses
(name, credits, duration, courseSize, lecturers_lecturerId)
values
('Java Programming', 4, 3, 120, 1),
('Web Application Development using Java EE', 5, 3, 120, 2),
('Android Application Development', 4, 1, 120, 5),
('ASP.NET Application Development', 3, 3, 120, 2),
('Object Oriented Analysis', 6, 3, 120, 3),
('Object Oriented Design', 6, 3, 120, 3),
('C-Sharp Programming', 6, 3, 120, 4),
('C-Sharp OO Programming', 10, 3, 120, 4);

insert into enrolled_courses
(students_studentId, courses_courseId, startingDate, endingDate, gradePoint, status)
values
-- Raj
(9, 1, STR_TO_DATE('31-10-2016', '%d-%m-%Y'), STR_TO_DATE('4-11-2016', '%d-%m-%Y'), null, 'Completed'),
(9, 2, STR_TO_DATE('24-11-2016', '%d-%m-%Y'), STR_TO_DATE('12-12-2016', '%d-%m-%Y'), null, 'In Progress'),
(9, 3, STR_TO_DATE('23-10-2016', '%d-%m-%Y'), STR_TO_DATE('14-12-2016', '%d-%m-%Y'), null, 'Ready'),
(9, 4, STR_TO_DATE('24-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-10-2016', '%d-%m-%Y'), null, 'Completed'),
(9, 5, STR_TO_DATE('8-8-2016', '%d-%m-%Y'), STR_TO_DATE('26-8-2016', '%d-%m-%Y'), null, 'Completed'),
(9, 6, STR_TO_DATE('5-9-2016', '%d-%m-%Y'), STR_TO_DATE('23-9-2016', '%d-%m-%Y'), null, 'Completed'),
(9, 7, STR_TO_DATE('29-8-2016', '%d-%m-%Y'), STR_TO_DATE('2-9-2016', '%d-%m-%Y'), null, 'Completed'),
(9, 8, STR_TO_DATE('26-9-2016', '%d-%m-%Y'), STR_TO_DATE('30-9-2016', '%d-%m-%Y'), null, 'Completed'),
-- Janaki
(2, 1, STR_TO_DATE('31-10-2016', '%d-%m-%Y'), STR_TO_DATE('4-11-2016', '%d-%m-%Y'), null, 'Completed'),
(2, 2, STR_TO_DATE('24-11-2016', '%d-%m-%Y'), STR_TO_DATE('12-12-2016', '%d-%m-%Y'), null, 'In Progress'),
(2, 3, STR_TO_DATE('14-12-2016', '%d-%m-%Y'), STR_TO_DATE('23-10-2016', '%d-%m-%Y'), null, 'Ready'),
(2, 4, STR_TO_DATE('24-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-10-2016', '%d-%m-%Y'), null, 'Completed'),
(2, 5, STR_TO_DATE('8-8-2016', '%d-%m-%Y'), STR_TO_DATE('26-8-2016', '%d-%m-%Y'), null, 'Completed'),
(2, 6, STR_TO_DATE('5-9-2016', '%d-%m-%Y'), STR_TO_DATE('23-9-2016', '%d-%m-%Y'), null, 'Completed'),
(2, 7, STR_TO_DATE('29-8-2016', '%d-%m-%Y'), STR_TO_DATE('2-9-2016', '%d-%m-%Y'), null, 'Completed'),
(2, 8, STR_TO_DATE('26-9-2016', '%d-%m-%Y'), STR_TO_DATE('30-9-2016', '%d-%m-%Y'), null, 'Completed'),
--  Zoe
(3, 1, STR_TO_DATE('31-10-2016', '%d-%m-%Y'), STR_TO_DATE('4-11-2016', '%d-%m-%Y'), null, 'Completed'),
(3, 2, STR_TO_DATE('24-11-2016', '%d-%m-%Y'), STR_TO_DATE('12-12-2016', '%d-%m-%Y'), null, 'In Progress'),
(3, 3, STR_TO_DATE('14-12-2016', '%d-%m-%Y'), STR_TO_DATE('23-10-2016', '%d-%m-%Y'), null, 'Ready'),
(3, 4, STR_TO_DATE('24-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-10-2016', '%d-%m-%Y'), null, 'Completed'),
(3, 5, STR_TO_DATE('8-8-2016', '%d-%m-%Y'), STR_TO_DATE('26-8-2016', '%d-%m-%Y'), null, 'Completed'),
(3, 6, STR_TO_DATE('5-9-2016', '%d-%m-%Y'), STR_TO_DATE('23-9-2016', '%d-%m-%Y'), null, 'Completed'),
(3, 7, STR_TO_DATE('29-8-2016', '%d-%m-%Y'), STR_TO_DATE('2-9-2016', '%d-%m-%Y'), null, 'Completed'),
(3, 8, STR_TO_DATE('26-9-2016', '%d-%m-%Y'), STR_TO_DATE('30-9-2016', '%d-%m-%Y'), null, 'Completed'),
-- Kaung
(4, 1, STR_TO_DATE('31-10-2016', '%d-%m-%Y'), STR_TO_DATE('4-11-2016', '%d-%m-%Y'), null, 'Completed'),
(4, 2, STR_TO_DATE('24-11-2016', '%d-%m-%Y'), STR_TO_DATE('12-12-2016', '%d-%m-%Y'), null, 'In Progress'),
(4, 3, STR_TO_DATE('14-12-2016', '%d-%m-%Y'), STR_TO_DATE('23-10-2016', '%d-%m-%Y'), null, 'Ready'),
(4, 4, STR_TO_DATE('24-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-10-2016', '%d-%m-%Y'), null, 'Completed'),
(4, 5, STR_TO_DATE('8-8-2016', '%d-%m-%Y'), STR_TO_DATE('26-8-2016', '%d-%m-%Y'), null, 'Completed'),
(4, 6, STR_TO_DATE('5-9-2016', '%d-%m-%Y'), STR_TO_DATE('23-9-2016', '%d-%m-%Y'), null, 'Completed'),
(4, 7, STR_TO_DATE('29-8-2016', '%d-%m-%Y'), STR_TO_DATE('2-9-2016', '%d-%m-%Y'), null, 'Completed'),
(4, 8, STR_TO_DATE('26-9-2016', '%d-%m-%Y'), STR_TO_DATE('30-9-2016', '%d-%m-%Y'), null, 'Completed'),
-- XuRan
(5, 1, STR_TO_DATE('31-10-2016', '%d-%m-%Y'), STR_TO_DATE('4-11-2016', '%d-%m-%Y'), null, 'Completed'),
(5, 2, STR_TO_DATE('24-11-2016', '%d-%m-%Y'), STR_TO_DATE('12-12-2016', '%d-%m-%Y'), null, 'In Progress'),
(5, 3, STR_TO_DATE('14-12-2016', '%d-%m-%Y'), STR_TO_DATE('23-10-2016', '%d-%m-%Y'), null, 'Ready'),
(5, 4, STR_TO_DATE('24-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-10-2016', '%d-%m-%Y'), null, 'Completed'),
(5, 5, STR_TO_DATE('8-8-2016', '%d-%m-%Y'), STR_TO_DATE('26-8-2016', '%d-%m-%Y'), null, 'Completed'),
(5, 6, STR_TO_DATE('5-9-2016', '%d-%m-%Y'), STR_TO_DATE('23-9-2016', '%d-%m-%Y'), null, 'Completed'),
(5, 7, STR_TO_DATE('29-8-2016', '%d-%m-%Y'), STR_TO_DATE('2-9-2016', '%d-%m-%Y'), null, 'Completed'),
(5, 8, STR_TO_DATE('26-9-2016', '%d-%m-%Y'), STR_TO_DATE('30-9-2016', '%d-%m-%Y'), null, 'Completed'),
-- Zwe
(6, 1, STR_TO_DATE('31-10-2016', '%d-%m-%Y'), STR_TO_DATE('4-11-2016', '%d-%m-%Y'), null, 'Completed'),
(6, 2, STR_TO_DATE('24-11-2016', '%d-%m-%Y'), STR_TO_DATE('12-12-2016', '%d-%m-%Y'), null, 'In Progress'),
(6, 3, STR_TO_DATE('14-12-2016', '%d-%m-%Y'), STR_TO_DATE('23-10-2016', '%d-%m-%Y'), null, 'Ready'),
(6, 4, STR_TO_DATE('24-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-10-2016', '%d-%m-%Y'), null, 'Completed'),
(6, 5, STR_TO_DATE('8-8-2016', '%d-%m-%Y'), STR_TO_DATE('26-8-2016', '%d-%m-%Y'), null, 'Completed'),
(6, 6, STR_TO_DATE('5-9-2016', '%d-%m-%Y'), STR_TO_DATE('23-9-2016', '%d-%m-%Y'), null, 'Completed'),
(6, 7, STR_TO_DATE('29-8-2016', '%d-%m-%Y'), STR_TO_DATE('2-9-2016', '%d-%m-%Y'), null, 'Completed'),
(6, 8, STR_TO_DATE('26-9-2016', '%d-%m-%Y'), STR_TO_DATE('30-9-2016', '%d-%m-%Y'), null, 'Completed'),
-- XianHan
(7, 1, STR_TO_DATE('31-10-2016', '%d-%m-%Y'), STR_TO_DATE('4-11-2016', '%d-%m-%Y'), null, 'Completed'),
(7, 2, STR_TO_DATE('24-11-2016', '%d-%m-%Y'), STR_TO_DATE('12-12-2016', '%d-%m-%Y'), null, 'In Progress'),
(7, 3, STR_TO_DATE('14-12-2016', '%d-%m-%Y'), STR_TO_DATE('23-10-2016', '%d-%m-%Y'), null, 'Ready'),
(7, 4, STR_TO_DATE('24-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-10-2016', '%d-%m-%Y'), null, 'Completed'),
(7, 5, STR_TO_DATE('8-8-2016', '%d-%m-%Y'), STR_TO_DATE('26-8-2016', '%d-%m-%Y'), null, 'Completed'),
(7, 6, STR_TO_DATE('5-9-2016', '%d-%m-%Y'), STR_TO_DATE('23-9-2016', '%d-%m-%Y'), null, 'Completed'),
(7, 7, STR_TO_DATE('29-8-2016', '%d-%m-%Y'), STR_TO_DATE('2-9-2016', '%d-%m-%Y'), null, 'Completed'),
(7, 8, STR_TO_DATE('26-9-2016', '%d-%m-%Y'), STR_TO_DATE('30-9-2016', '%d-%m-%Y'), null, 'Completed'),
-- Lau
(8, 1, STR_TO_DATE('31-10-2016', '%d-%m-%Y'), STR_TO_DATE('4-11-2016', '%d-%m-%Y'), null, 'Completed'),
(8, 2, STR_TO_DATE('24-11-2016', '%d-%m-%Y'), STR_TO_DATE('12-12-2016', '%d-%m-%Y'), null, 'In Progress'),
(8, 3, STR_TO_DATE('14-12-2016', '%d-%m-%Y'), STR_TO_DATE('23-10-2016', '%d-%m-%Y'), null, 'Ready'),
(8, 4, STR_TO_DATE('24-10-2016', '%d-%m-%Y'), STR_TO_DATE('28-10-2016', '%d-%m-%Y'), null, 'Completed'),
(8, 5, STR_TO_DATE('8-8-2016', '%d-%m-%Y'), STR_TO_DATE('26-8-2016', '%d-%m-%Y'), null, 'Completed'),
(8, 6, STR_TO_DATE('5-9-2016', '%d-%m-%Y'), STR_TO_DATE('23-9-2016', '%d-%m-%Y'), null, 'Completed'),
(8, 7, STR_TO_DATE('29-8-2016', '%d-%m-%Y'), STR_TO_DATE('2-9-2016', '%d-%m-%Y'), null, 'Completed'),
(8, 8, STR_TO_DATE('26-9-2016', '%d-%m-%Y'), STR_TO_DATE('30-9-2016', '%d-%m-%Y'), null, 'Completed');