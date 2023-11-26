DROP DATABASE IF EXISTS EMBASSY;
CREATE DATABASE EMBASSY;
USE EMBASSY;

-- Department table
DROP TABLE IF EXISTS Department;
CREATE TABLE Department (
  dname varchar(25) NOT NULL,
  mngr_ssn int DEFAULT NULL,
  PRIMARY KEY (dname)
);

-- Employee table
DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee (
  ssn int NOT NULL,
  f_name varchar(20) NOT NULL,
  l_name varchar(20) NOT NULL,
  position varchar(20) NOT NULL,
  phone_number varchar(10) NOT NULL,
  dep_name varchar(25) DEFAULT NULL,
  PRIMARY KEY (ssn),
  CONSTRAINT employye_of_department FOREIGN KEY (dep_name) REFERENCES department (dname) ON DELETE SET NULL ON UPDATE SET NULL
);

ALTER TABLE Department ADD CONSTRAINT ssn_of_mng FOREIGN KEY (mngr_ssn) REFERENCES employee (ssn) ON DELETE SET NULL ON UPDATE SET NULL;

-- Address table
DROP TABLE IF EXISTS Address;
CREATE TABLE Address (
  address_id int NOT NULL,
  city varchar(50) NOT NULL,
  street varchar(50) NOT NULL,
  building varchar(50) NOT NULL,
  visitor_phone_nb varchar(50) DEFAULT NULL,
  PRIMARY KEY (address_id)
);

-- Visitor table
DROP TABLE IF EXISTS Visitor;
CREATE TABLE Visitor (
  phone_nb varchar(50) NOT NULL,
  f_name varchar(50) NOT NULL,
  l_name varchar(50) NOT NULL,
  date_of_birth date NOT NULL,
  email varchar(50) DEFAULT NULL,
  PRIMARY KEY (phone_nb)
);

ALTER TABLE Address ADD CONSTRAINT address_ibfk_1 FOREIGN KEY (visitor_phone_nb) REFERENCES visitor (phone_nb) ON DELETE CASCADE ON UPDATE CASCADE;

-- Apply_for table
DROP TABLE IF EXISTS Apply_for;
CREATE TABLE Apply_for (
  visa_id int NOT NULL,
  resident_id int NOT NULL,
  status varchar(50) DEFAULT NULL,
  PRIMARY KEY (visa_id, resident_id)
);

-- Visa table
DROP TABLE IF EXISTS Visa;
CREATE TABLE Visa (
  id int NOT NULL,
  exp_date date NOT NULL,
  visa_type varchar(20) NOT NULL,
  issued_date date NOT NULL,
  empl_ssn int DEFAULT NULL,
  PRIMARY KEY (id),
  CONSTRAINT visa_ibfk_1 FOREIGN KEY (empl_ssn) REFERENCES employee (ssn) ON DELETE SET NULL ON UPDATE SET NULL
);

-- Resident table
DROP TABLE IF EXISTS Resident;
CREATE TABLE Resident (
  id int NOT NULL AUTO_INCREMENT,
  phone_number int NOT NULL,
  f_name varchar(50) NOT NULL,
  l_name varchar(50) NOT NULL,
  sex varchar(6) DEFAULT NULL,
  date_of_birth date NOT NULL,
  Visa_id int DEFAULT NULL,
  PRIMARY KEY (id),
  CONSTRAINT Visa_iden FOREIGN KEY (Visa_id) REFERENCES visa (id) ON DELETE SET NULL ON UPDATE SET NULL
);

ALTER TABLE Apply_for ADD CONSTRAINT to_resident FOREIGN KEY (resident_id) REFERENCES resident (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Apply_for ADD CONSTRAINT to_visa FOREIGN KEY (visa_id) REFERENCES visa (id) ON DELETE CASCADE ON UPDATE CASCADE;

-- Property table
DROP TABLE IF EXISTS Property;
CREATE TABLE Property (
  id int NOT NULL,
  p_type varchar(20) DEFAULT NULL,
  p_desc varchar(100) DEFAULT NULL,
  v_phone_number varchar(10) NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT visitor_property FOREIGN KEY (v_phone_number) REFERENCES visitor (phone_nb) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Dependent table
CREATE TABLE Dependent (
  visitor_phone_nb varchar(50) NOT NULL,
  dep_name varchar(50) NOT NULL,
  relation varchar(50) DEFAULT NULL,
  PRIMARY KEY (visitor_phone_nb, dep_name),
  CONSTRAINT number_of_visitor FOREIGN KEY (visitor_phone_nb) REFERENCES visitor (phone_nb) ON DELETE CASCADE ON UPDATE CASCADE
);

-- -- -- Populate tables -- -- -- 
SET FOREIGN_KEY_CHECKS = 0;

INSERT INTO Visitor (`phone_nb`, `f_name`, `l_name`, `date_of_birth`, `email`) VALUES ('123456789', 'Jane', 'Doe', '1995-02-02', 'janedoe@example.com'),('555555555', 'Bob', 'Smith', '2000-03-03', 'bobsmith@example.com'),('987654321', 'Alice', 'Johnson', '1985-04-04', 'alicejohnson@example.com');
INSERT INTO Address (`address_id`, `city`, `street`, `building`, `visitor_phone_nb`) VALUES(1, 'New York', '5th Ave', '123', '123456789'),(2, 'Paris', 'Champs Elysees', '456', '987654321'),(3, 'London', 'Oxford St', '789', '555555555');
INSERT INTO Department VALUES ('cultural center',1230986),('administration',1265882),('press and information',2022120),('public affairs',2147549),('education',7023345);
INSERT INTO Employee VALUES (1199920,'Bran','Roger','member','398820','press and information'),(1199928,'Brandon','silva','member','398823','press and information'),(1230986,'Jennifer','Holt','manager','273345','cultural center'),(1265882,'Peter','Robinson','manager','123456','administration'),(1812345,'farah','ahmad','member','372630','education'),(1827427,'ahmad','reed','member','372631','cultural center'),(1827456,'ahmad','shahrour','member','372637','cultural center'),(1838276,'nour','Rivera','member','372617','cultural center'),(2022120,'Jennifer','Holt','manager','27364','press and information'),(2147549,'Stacey','Reed','manager','123455','administration'),(7023345,'Gary','patel','manager','70207764','education');
INSERT INTO Resident VALUES (12,70202291,'hadi','hadi','male','2000-12-12',12736457),(13,70202290,'hadi','hadi','male','2000-02-12',19283720),(14,70209281,'ahmad','adada','male','1998-02-01',19283746),(15,70201981,'haysam','hhh','male','2000-01-12',19288888),(16,70219283,'nabih','berri','male','1999-12-12',20027365),(17,25367491,'sami','el khatib','male','2003-12-12',20029384),(18,19283746,'cristiano','ronaldo','male','1991-01-02',20041006),(19,23774737,'randa','berri','female','1989-01-12',20041007),(20,28374663,'mason','mount','male','1992-12-12',20041010),(21,20398484,'professor','wadi','male','2022-12-12',20041999),(22,29834747,'stephenie','zaatar','female','1970-12-12',21234567);
INSERT INTO Visa VALUES (12736457,'2023-11-11','Imigration','2017-06-16',1199920),(19283720,'2025-11-11','Imigration','2020-06-16',1199920),(19283746,'2027-11-11','Bussiness','2018-06-29',1838276),(19288888,'2020-11-11','Imigration','2016-06-16',1199920),(20027365,'2021-02-11','Student','2018-05-05',1838276),(20029384,'2020-11-11','Student','2017-05-05',1838276),(20041006,'2026-02-10','Tourest','2020-01-01',1199928),(20041007,'2024-01-01','Tourest','2020-01-01',1199928),(20041010,'2025-02-10','Tourest','2020-05-05',1199928),(20041999,'2022-02-11','Student','2018-05-05',1199928),(21234567,'2028-11-11','Bussiness','2020-06-29',1838276);
INSERT INTO Property (`id`, `p_type`, `p_desc`, `v_phone_number`) VALUES (1, 'Apartment', '2-bedroom apartment in downtown area', '1234567890'),(2, 'House', '3-bedroom house with a backyard', '2345678901'),(3, 'Condo', '1-bedroom condo with a view of the park', '3456789012'),(4, 'Apartment', 'Studio apartment near the university', '4567890123'),(5, 'House', '4-bedroom house with a pool', '5678901234');
INSERT INTO Dependent (visitor_phone_nb, dep_name, relation) VALUES ('555-555-1212', 'John Smith', 'Father'),('555-555-1212', 'Mary Smith', 'Mother'),('555-555-1213', 'Tom Johnson', 'Brother'),('555-555-1213', 'Jessica Johnson', 'Sister');

SET FOREIGN_KEY_CHECKS = 1;

-- -- -- indices -- -- -- 
CREATE INDEX visitor_phone_nb_indx ON Visitor(phone_nb);
CREATE INDEX Visa_id_idx ON Visa(id);
CREATE INDEX resident_id_idx ON Resident(id);
CREATE INDEX employee_ssn_idx ON Employee(ssn);
CREATE INDEX dep_name_idx ON Dependent(dep_name);
CREATE INDEX dep_relation_idx ON Dependent(relation);
CREATE INDEX visitor_property_idx ON Property(v_phone_number);

-- -- -- Views -- -- -- 
-- (1) This view shows the full address of each visitor, by joining the address and visitor tables.
CREATE VIEW address_visitor AS
SELECT address.`address_id`, `address`.`city`, `address`.`street`, `address`.`building`,
       `visitor`.`phone_nb`, `visitor`.`f_name`, `visitor`.`l_name`
FROM `address`
JOIN `visitor` ON `address`.`visitor_phone_nb` = `visitor`.`phone_nb`;

-- (2) Create a view to display visitors born in the 90s
CREATE VIEW `visitors_born_in_90s` AS
SELECT `phone_nb`, `f_name`, `l_name`, `date_of_birth`, `email`
FROM `visitor`
WHERE `date_of_birth` BETWEEN '1990-01-01' AND '1999-12-31';

-- (3) A view for property and visitor data
CREATE VIEW property_visitor AS
SELECT p.*, v.f_name, v.l_name
FROM property p
JOIN visitor v ON p.v_phone_number = v.phone_nb;

