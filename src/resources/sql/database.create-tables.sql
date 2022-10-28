CREATE SCHEMA `AccidentManagement` ;

CREATE TABLE `AccidentManagement`.`Car` (
  `licensePlate` VARCHAR(7) PRIMARY KEY NOT NULL,
  `brand` VARCHAR(50) NOT NULL,
  `engineSize` INT NOT NULL,
  `power` INT NOT NULL,
  `taxCode` CHAR(16) NOT NULL,
  `insuranceCode` CHAR(16) NOT NULL
);

CREATE TABLE `AccidentManagement`.`Owner` (
  `taxCode` CHAR(16) PRIMARY KEY NOT NULL,
  `firstName` VARCHAR(100) NOT NULL,
  `lastName` VARCHAR(100) NOT NULL,
  `address` VARCHAR(255) NOT NULL
);

CREATE TABLE `AccidentManagement`.`Insurance` (
  `insuranceCode` CHAR(16) PRIMARY KEY NOT NULL,
  `name` CHAR(100) NOT NULL,
  `location` VARCHAR(255) NOT NULL
);

CREATE TABLE `AccidentManagement`.`Accident` (
  `accidentCode` CHAR(16) PRIMARY KEY NOT NULL,
  `location` VARCHAR(255) NOT NULL,
  `accidentDate` DATE NOT NULL
);

CREATE TABLE `AccidentManagement`.`CarInvolved` (
  `involvedCode` CHAR(16) PRIMARY KEY NOT NULL,
  `accidentCode` CHAR(16) NOT NULL,
  `licensePlate` VARCHAR(7) NOT NULL,
  `damageAmount` DOUBLE NOT NULL
);

ALTER TABLE `AccidentManagement`.`CarInvolved` 
ADD INDEX `fkCarInvolvedAccident_idx` (`accidentCode` ASC) VISIBLE,
ADD INDEX `fkCarInvolvedCar_idx` (`licensePlate` ASC) VISIBLE;
;
ALTER TABLE `AccidentManagement`.`CarInvolved` 
ADD CONSTRAINT `fkCarInvolvedAccident`
  FOREIGN KEY (`accidentCode`)
  REFERENCES `AccidentManagement`.`Accident` (`accidentCode`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fkCarInvolvedCar`
  FOREIGN KEY (`licensePlate`)
  REFERENCES `AccidentManagement`.`Car` (`licensePlate`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `AccidentManagement`.`Car` 
ADD INDEX `fkCarOwner_idx` (`taxCode` ASC) VISIBLE,
ADD INDEX `fkCarInsurance_idx` (`insuranceCode` ASC) VISIBLE;
;
ALTER TABLE `AccidentManagement`.`Car` 
ADD CONSTRAINT `fkCarOwner`
  FOREIGN KEY (`taxCode`)
  REFERENCES `AccidentManagement`.`Owner` (`taxCode`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fkCarInsurance`
  FOREIGN KEY (`insuranceCode`)
  REFERENCES `AccidentManagement`.`Insurance` (`insuranceCode`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;