CREATE DATABASE DISTRIBUTION_SYSTEM;
USE DISTRIBUTION_SYSTEM;
-- -----------------Create Tables--------------------
-- ------------------------------------------------------------
CREATE TABLE SUPPLIER(
SUPPLIER_ID VARCHAR(15) NOT NULL,
SUPPLIER_NAME VARCHAR(50) NOT NULL,
EMAIL VARCHAR(25) NOT NULL,
CONTACT_NO INT NOT NULL,
COUNTRY VARCHAR(25),
CITY VARCHAR(25),
STREET VARCHAR(25),
PRIMARY KEY(SUPPLIER_ID)
);
-- --------------------------------------------------------------
CREATE TABLE PRODUCT(
PRODUCT_ID VARCHAR(15) NOT NULL,
PRODUCT_NAME VARCHAR(25) NOT NULL,
UNIT_PRICE FLOAT(4) NOT NULL, 
VENDOR VARCHAR(25),
DESCRIP VARCHAR(50),
PRIMARY KEY(PRODUCT_ID)
);
-- -------------------------------------------------------------
CREATE TABLE PRODUCT_CATEGORY(
CATEGORY_ID VARCHAR(15) NOT NULL,
CATEGORY_NAME VARCHAR(25) NOT NULL,
STORING_CONDITION VARCHAR(10) NOT NULL,
DESCRIP VARCHAR(50),
PRIMARY KEY(CATEGORY_ID)
);
-- --------------------------------------------------------------
CREATE TABLE OUTLET(
PRODUCT_ID VARCHAR(15) NOT NULL,
PRODUCT_NAME VARCHAR(25) NOT NULL,
QUANTITY INT NOT NULL,
VENDOR VARCHAR(25) NOT NULL,
CONTACT_NO INT NOT NULL,
PRIMARY KEY(PRODUCT_ID)
);
ALTER TABLE OUTLET
ADD CONSTRAINT FK_productID
FOREIGN KEY(PRODUCT_ID) REFERENCES PRODUCT(PRODUCT_ID) ON DELETE cascade on update cascade;

-- --------------------------------------------------------------
CREATE TABLE STORE(
STORE_ID VARCHAR(15) NOT NULL,
SOTRE_NAME VARCHAR(25) NOT NULL,
CONTACT_NO INT NOT NULL,
LOCATION VARCHAR(25),
PRIMARY KEY(STORE_ID)
 );
-- --------------------------------------------------------------
CREATE TABLE EMPLOYEE(
EMP_ID VARCHAR(15) NOT NULL,
EMP_NAME VARCHAR(25) NOT NULL,
CONTACT_NO INT NOT NULL,
COUNTRY VARCHAR(25),
CITY VARCHAR(25),
STREET VARCHAR(25),
PRIMARY KEY(EMP_ID)
);
ALTER TABLE SUPPLIER
ADD CONSTRAINT FK_EMPID3
FOREIGN KEY(SUPPLIER_ID) REFERENCES EMPLOYEE(EMP_ID) ON DELETE cascade on update cascade;
-- ----------------------------------------------------------------
CREATE TABLE VEHICLE(
VEHICLE_NO VARCHAR(15) NOT NULL,
MODEL VARCHAR(15) ,
COLOR VARCHAR(15),
VEHICLE_TYPE VARCHAR(15),
PRIMARY KEY(VEHICLE_NO)
);
-- -----------------------------------------------------------------
CREATE TABLE DRIVER(
DRIVER_ID VARCHAR(15) NOT NULL,
FIRST_NAME VARCHAR(15) NOT NULL,
LAST_NAME VARCHAR(15) NOT NULL,
LICENSE_NO VARCHAR(15) NOT NULL,
CONTACT_NO INT NOT NULL,
COUNTRY VARCHAR(25),
CITY VARCHAR(25),
STREET VARCHAR(25),
PRIMARY KEY(DRIVER_ID)
);
ALTER TABLE DRIVER
ADD CONSTRAINT FK_EMPID
FOREIGN KEY(DRIVER_ID) REFERENCES EMPLOYEE(EMP_ID) ON DELETE cascade on update cascade;
-- ------------------------------------------------------------------
CREATE TABLE PAYMENT (
    PAYMENT_ID VARCHAR(25) NOT NULL,
    PAYMENT_TYPE VARCHAR(15) NOT NULL,
    AMOUNT FLOAT(15) NOT NULL,
    PAYMENT_DATE DATE DEFAULT '2023-02-01',
    PRIMARY KEY(PAYMENT_ID)
);
-- -------------------------------------------------------------------
CREATE TABLE HELPER(
HELPER_ID VARCHAR(25) NOT NULL,
HELPER_NAME VARCHAR(25) NOT NULL,
CONTACT_NO INT NOT NULL,
COUNTRY VARCHAR(25),
CITY VARCHAR(25),
STREET VARCHAR(25),
PRIMARY KEY(HELPER_ID)
);
ALTER TABLE HELPER
ADD CONSTRAINT FK_EMPID2
FOREIGN KEY(HELPER_ID) REFERENCES EMPLOYEE(EMP_ID) ON DELETE cascade on update cascade;
-- --------------------------------------------------------------------
CREATE TABLE INSURANCE(
INSURANCE_ID VARCHAR(15) NOT  NULL,
VEHICLE_NO VARCHAR(15),
EMP_ID VARCHAR(15),
INSURANCE_TYPE VARCHAR(15),
INSURANCE_VALUE FLOAT(15),
PRIMARY KEY(INSURANCE_ID)
);
-- --------------------------------------------------------------------
CREATE TABLE CUSTOMER(
CUSTOMER_ID VARCHAR(15) NOT NULL,
CUSTOMER_NAME VARCHAR(25) NOT NULL,
CONTACT_NO INT NOT NULL,
PRODUCT_CATEGORY VARCHAR(25) NOT NULL,
QUANTITY INT NOT NULL,
COUNTRY VARCHAR(25),
CITY VARCHAR(25) NOT NULL,
STREET VARCHAR(25) NOT NULL,
PRIMARY KEY(CUSTOMER_ID)
);
-- -----------------------------------------------------------------------
CREATE TABLE FUEL_EXPENSES(
STATION VARCHAR(25),
QUANTITY FLOAT(5) NOT NULL,
COST FLOAT(15) NOT NULL,
DATE date DEFAULT '2023-02-01',
TIME time DEFAULT '00:00:00',
PRIMARY KEY(STATION)
);

-- ------------------------Insertion--------------------------------------------------
-- EMPLOYEE---------------------------------------------------------------------
Insert into EMPLOYEE(EMP_ID,EMP_NAME,CONTACT_NO,COUNTRY,CITY,STREET)  
values('E001', 'John ', 1234567890, 'Sri lanka', 'Mathar', '123 Main St');
INSERT INTO EMPLOYEE (EMP_ID, EMP_NAME, CONTACT_NO, COUNTRY, CITY, STREET)
VALUES
    ('E002', 'Alice', '98765430', 'Sri Lanka', 'Galle', '456 Elm Ave'),
    ('E003', 'David', '55667777', 'Canada', 'Toronto', '789 Oak Rd'),
    ('E004', 'Emily', '22234444', 'Sri Lanka', 'Kandy', '101 High St'),
    ('E005', 'Michael', '7789999', 'Australia', 'Sydney', '321 Park Ave');
Insert into EMPLOYEE(EMP_ID,EMP_NAME,CONTACT_NO,COUNTRY,CITY,STREET)  
values('E008', 'Sanju ', 12356790, 'Sri lanka', 'Matale', '123 Main St');
Insert into EMPLOYEE(EMP_ID,EMP_NAME,CONTACT_NO,COUNTRY,CITY,STREET)  
values('E009', 'Sahan ', 1267890, 'Sri lanka', 'KANDY', '123 Main St');
Insert into EMPLOYEE(EMP_ID,EMP_NAME,CONTACT_NO,COUNTRY,CITY,STREET)  
values('E007', 'Saw ', 123575890, 'Sri lanka', 'Matale', '123 Main St');
Insert into EMPLOYEE(EMP_ID,EMP_NAME,CONTACT_NO,COUNTRY,CITY,STREET)  
values('E010', 'Sani ', 123347890, 'Sri lanka', 'MaTARA', '123 Main St');
-- SUPPLIER---------------------------------------------------
-- -----------------------------------------------------------
INSERT INTO SUPPLIER (SUPPLIER_ID,SUPPLIER_NAME,EMAIL,CONTACT_NO,COUNTRY,CITY,STREET)
VALUES('E001', 'ABC Suppliers', 'abc@example.com', 1234567890, ' Sri lanka', 'Galle', ' Supply St');
INSERT INTO SUPPLIER (SUPPLIER_ID,SUPPLIER_NAME,EMAIL,CONTACT_NO,COUNTRY,CITY,STREET)
VALUES   ('E008', 'XYZ Distributors', 'xyz@example.com', 98765410, 'Canada', 'Toronto', 'Distributor Ave');
INSERT INTO SUPPLIER (SUPPLIER_ID,SUPPLIER_NAME,EMAIL,CONTACT_NO,COUNTRY,CITY,STREET)
VALUES ('E002', 'Global Imports', 'global@example.com', 55567777, 'Sri lanka', 'Mathara', 'Import Rd');
INSERT INTO SUPPLIER (SUPPLIER_ID,SUPPLIER_NAME,EMAIL,CONTACT_NO,COUNTRY,CITY,STREET)
VALUES ('E004', 'Mega Suppliers', 'mega@example.com', 22233344, 'Australia', 'Sydney', ' Mega St');
INSERT INTO SUPPLIER (SUPPLIER_ID,SUPPLIER_NAME,EMAIL,CONTACT_NO,COUNTRY,CITY,STREET)
VALUES  ('E005', 'Best Electronics', 'best@example.com', 77788999, 'Sri lanka', 'Galle', 'Electronics Ave');
INSERT INTO SUPPLIER (SUPPLIER_ID,SUPPLIER_NAME,EMAIL,CONTACT_NO,COUNTRY,CITY,STREET)
VALUES  ('E003', 'M&M Electronics', 'mm@example.com', 77788999, 'Sri lanka', 'Galle', 'Main Ave');

-- PRODUCT----------------------------------------------------------
-- ----------------------------------------------------------------
Insert into PRODUCT(PRODUCT_ID,PRODUCT_NAME,UNIT_PRICE,VENDOR,DESCRIP)
values('P001','Calin','230.00','surya','5% offer');
Insert into PRODUCT(PRODUCT_ID,PRODUCT_NAME,UNIT_PRICE,VENDOR,DESCRIP)
values('P002','garlic mayonis','450.00','kothmale','null');
Insert into PRODUCT(PRODUCT_ID,PRODUCT_NAME,UNIT_PRICE,VENDOR,DESCRIP)
values('P003','chocolate ice-cream','1000.00','elephenthouse','10% offer');
Insert into PRODUCT(PRODUCT_ID,PRODUCT_NAME,UNIT_PRICE,VENDOR,DESCRIP)
values('P004','Nice','250.00','Maliban','null');
Insert into PRODUCT(PRODUCT_ID,PRODUCT_NAME,UNIT_PRICE,VENDOR,DESCRIP)
values('P005','Source','500.00','MD','null');
Insert into PRODUCT(PRODUCT_ID,PRODUCT_NAME,UNIT_PRICE,VENDOR,DESCRIP)
values('P008','flavored milk','700.00','highland','chocolate');
-- PRODUCT_CATOGARY---------------------------------------------------
-- -------------------------------------------------------------------
INSERT INTO PRODUCT_CATEGORY (CATEGORY_ID,CATEGORY_NAME,STORING_CONDITION,DESCRIP)
VALUES('C006', 'Furniture', 'Dry', 'Furniture and home decor');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_ID,CATEGORY_NAME,STORING_CONDITION,DESCRIP)
VALUES('C007', 'Groceries', 'Cool', 'Fresh and packaged groceries');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_ID,CATEGORY_NAME,STORING_CONDITION,DESCRIP)
VALUES('C008', 'Health & Beauty', 'Dry', 'Health and beauty products');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_ID,CATEGORY_NAME,STORING_CONDITION,DESCRIP)
VALUES('C009', 'Electrical Appliances', 'Dry', 'Electronic appliances');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_ID,CATEGORY_NAME,STORING_CONDITION,DESCRIP)
VALUES('C010', 'Sporting Goods', 'Dry', 'Sporting equipment and accessories');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_ID,CATEGORY_NAME,STORING_CONDITION,DESCRIP)
VALUES('C001', 'Medical items', 'cool', 'Medicine/drugs');
-- OUTLET--------------------------------------------------------------
-- --------------------------------------------------------------------
Insert into  OUTLET(PRODUCT_ID,PRODUCT_NAME,QUANTITY,VENDOR,CONTACT_NO)
values('P001','Calin',100,'surya',0771234567);
Insert into OUTLET(PRODUCT_ID,PRODUCT_NAME,QUANTITY,VENDOR,CONTACT_NO)
values('P002','garlic mayonis',50,'kothmale',09978868);
Insert into OUTLET(PRODUCT_ID,PRODUCT_NAME,QUANTITY,VENDOR,CONTACT_NO)
values('P003','chocolate ice-cream',200,'elephenthouse',45667779);
Insert into OUTLET(PRODUCT_ID,PRODUCT_NAME,QUANTITY,VENDOR,CONTACT_NO)
values('P004','Nice',150,'Maliban',24456773);
Insert into OUTLET(PRODUCT_ID,PRODUCT_NAME,QUANTITY,VENDOR,CONTACT_NO)
values('P005','Source', 59,'MD',99077584);
Insert into OUTLET(PRODUCT_ID,PRODUCT_NAME,QUANTITY,VENDOR,CONTACT_NO)
values('P008','milk', 590,'highland',9987584);
-- STORE-----------------------------------------------------------------
-- ---------------------------------------------------------------------

 Insert into STORE(STORE_ID,SOTRE_NAME,CONTACT_NO,LOCATION)
 values  ('002', 'Central Warehouse', 98743210, 'wherehouse side');
 Insert into STORE(STORE_ID,SOTRE_NAME,CONTACT_NO,LOCATION)
 values ('003', 'Regional Supply Center', 55566777, 'Supply side');
 Insert into STORE(STORE_ID,SOTRE_NAME,CONTACT_NO,LOCATION)
 values  ('006', 'Distribution Center A', 2223344, 'DistributN side');
 Insert into STORE(STORE_ID,SOTRE_NAME,CONTACT_NO,LOCATION)
 values ('005', 'Warehouse X', 77889999, 'whrehouse side');
 Insert into STORE(STORE_ID,SOTRE_NAME,CONTACT_NO,LOCATION)
 values ('001', 'Warehouse y', 70889999, 'whrehouse right side'); 
  Insert into STORE(STORE_ID,SOTRE_NAME,CONTACT_NO,LOCATION)
 values ('009', 'Warehouse m', 778344999, 'whrehouse left side');
-- vehical--------------------------------------------------------------
-- ---------------------------------------------------------------------
INSERT INTO VEHICLE (VEHICLE_NO,MODEL,COLOR,VEHICLE_TYPE)
VALUES('V001', 'Toyota Corolla', 'Blue', 'Sedan');
INSERT INTO VEHICLE (VEHICLE_NO,MODEL,COLOR,VEHICLE_TYPE)
VALUES('V002', 'Ford F-150', 'Black', 'Truck');
INSERT INTO VEHICLE (VEHICLE_NO,MODEL,COLOR,VEHICLE_TYPE)
VALUES ('V005', 'Nissan Altima', 'Red', 'Sedan');
INSERT INTO VEHICLE (VEHICLE_NO,MODEL,COLOR,VEHICLE_TYPE)
VALUES ('V006', 'Chevrolet', 'White', 'SUV');
INSERT INTO VEHICLE (VEHICLE_NO,MODEL,COLOR,VEHICLE_TYPE)
VALUES ('V003', 'Honda Civic', 'Silver', 'Sedan');
INSERT INTO VEHICLE (VEHICLE_NO,MODEL,COLOR,VEHICLE_TYPE)
VALUES ('V007', 'Izuzu', 'Silver', 'Truck');
-- DRIVER--------------------------------------------------------------
-- --------------------------------------------------------------------
INSERT INTO DRIVER(Driver_ID,FIRST_NAME,LAST_NAME,LICENSE_NO,CONTACT_NO,COUNTRY,CITY,STREET)  
VALUES('E001', 'John', 'Smith', 'DL12345', 1234567890, 'Sri lanka', 'Galle', 'Driver St');
INSERT INTO DRIVER  (Driver_ID,FIRST_NAME,LAST_NAME,LICENSE_NO,CONTACT_NO,COUNTRY,CITY,STREET)  
VALUES('E002', 'Alice', 'Johnson', 'DL67890', 98743210, 'Sri lanka', 'Mathara', ' Driver Rd');
INSERT INTO DRIVER  (Driver_ID,FIRST_NAME,LAST_NAME,LICENSE_NO,CONTACT_NO,COUNTRY,CITY,STREET)  
VALUES('E003', 'David', 'Lee', 'DL24680', 55566677, 'Sri lanka', 'Galle', 'Driver Rd');
INSERT INTO DRIVER  (Driver_ID,FIRST_NAME,LAST_NAME,LICENSE_NO,CONTACT_NO,COUNTRY,CITY,STREET)  
VALUES('E004', 'Emily', 'Wilson', 'DL13579', 22233344, 'Australia', 'Sydney', ' Driver St');
INSERT INTO DRIVER  (Driver_ID,FIRST_NAME,LAST_NAME,LICENSE_NO,CONTACT_NO,COUNTRY,CITY,STREET)  
VALUES('E007', 'Michael', 'Brown', 'DL86420', 77789999, 'Germany', 'Berlin', 'Driver Ave');
INSERT INTO DRIVER  (Driver_ID,FIRST_NAME,LAST_NAME,LICENSE_NO,CONTACT_NO,COUNTRY,CITY,STREET)  
VALUES('E010', 'Mick', 'tison', 'DL86420', 77789999, 'Germany', 'Berlin', 'Driver Ave');
-- 	PAYMENT-----------------------------------------------------------------------
-- --------------------------------------------------------------------------------
INSERT INTO PAYMENT(PAYMENT_ID,PAYMENT_TYPE,AMOUNT,PAYMENT_DATE)  
VALUES('PAY001', 'Credit Card', 100000.00, '2023-09-09');
INSERT INTO PAYMENT(PAYMENT_ID,PAYMENT_TYPE,AMOUNT,PAYMENT_DATE)  
VALUES('PAY002', 'Cash', 50000.00, '2023-09-08');
INSERT INTO PAYMENT(PAYMENT_ID,PAYMENT_TYPE,AMOUNT,PAYMENT_DATE)  
VALUES('PAY003', 'Debit Card', 75000.00, '2023-09-07');
INSERT INTO PAYMENT(PAYMENT_ID,PAYMENT_TYPE,AMOUNT,PAYMENT_DATE)  
VALUES('PAY004', 'Online Transfer', 200000.00, '2023-09-06');
INSERT INTO PAYMENT(PAYMENT_ID,PAYMENT_TYPE,AMOUNT,PAYMENT_DATE)  
VALUES('PAY005', 'Cheq', 60000.00, '2023-09-05');
INSERT INTO PAYMENT(PAYMENT_ID,PAYMENT_TYPE,AMOUNT,PAYMENT_DATE)  
VALUES('PAY006', 'Cheq', 600000.00, '2023-09-10');
-- HELPER----------------------------------------------------------
-- ----------------------------------------------------------------
INSERT INTO HELPER (HELPER_ID,HELPER_NAME,CONTACT_NO,COUNTRY,CITY,STREET)
VALUES('E001', 'Smith', 1234567890, 'Sri lanka', 'Kandy', 'Helper St');
INSERT INTO HELPER (HELPER_ID,HELPER_NAME,CONTACT_NO,COUNTRY,CITY,STREET)
VALUES('E007', 'Robert', 9873210, 'Canada', 'Toronto', 'Helper Ave' );
INSERT INTO HELPER (HELPER_ID,HELPER_NAME,CONTACT_NO,COUNTRY,CITY,STREET)
VALUES('E003', 'Megan', 55567777, 'Sri lanka', 'kurunegla', 'Helper Rd' );
INSERT INTO HELPER (HELPER_ID,HELPER_NAME,CONTACT_NO,COUNTRY,CITY,STREET)
VALUES('E010', 'James', 22233444, 'Australia', 'Sydney', 'Helper St');
INSERT INTO HELPER (HELPER_ID,HELPER_NAME,CONTACT_NO,COUNTRY,CITY,STREET)
VALUES('E004', 'Emma ', 77789999, 'Sri lanka', 'Colombo', 'Helper Ave' );
INSERT INTO HELPER (HELPER_ID,HELPER_NAME,CONTACT_NO,COUNTRY,CITY,STREET)
VALUES('E008', 'aNN ', 77789999, 'Sri lanka', 'Colombo', 'Helper Ave' );
-- INSURANCE-----------------------------------------------------------------
-- ------------------------------------------------------------------------
INSERT INTO INSURANCE (INSURANCE_ID,VEHICLE_NO,EMP_ID,INSURANCE_TYPE,INSURANCE_VALUE) 
VALUES('INS001', 'V001', 'E001', 'Auto', 5000.00);
INSERT INTO INSURANCE(INSURANCE_ID,VEHICLE_NO,EMP_ID,INSURANCE_TYPE,INSURANCE_VALUE)   
VALUES('INS002', 'V002', 'E002', 'Auto', 6000.00);
INSERT INTO INSURANCE (INSURANCE_ID,VEHICLE_NO,EMP_ID,INSURANCE_TYPE,INSURANCE_VALUE)  
VALUES('INS003', 'V003', 'E003', 'Auto', 5500.00);
INSERT INTO INSURANCE (INSURANCE_ID,VEHICLE_NO,EMP_ID,INSURANCE_TYPE,INSURANCE_VALUE)  
VALUES ('INS004', 'V004', 'E004', 'Auto', 7000.00);
INSERT INTO INSURANCE  (INSURANCE_ID,VEHICLE_NO,EMP_ID,INSURANCE_TYPE,INSURANCE_VALUE) 
VALUES ('INS005', 'V005', 'E005', 'Auto', 6500.00);
INSERT INTO INSURANCE  (INSURANCE_ID,VEHICLE_NO,EMP_ID,INSURANCE_TYPE,INSURANCE_VALUE) 
VALUES ('INS006', 'V007', 'E000', 'Manual', 65000.00);
-- CUSTOMER----------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------
INSERT INTO CUSTOMER(CUSTOMER_ID,CUSTOMER_NAME,CONTACT_NO,PRODUCT_CATEGORY,QUANTITY,COUNTRY,CITY,STREET)  
VALUES('C001', 'John Doe', 12345670, 'Electronics', 3, ' Sri lanka', 'Kandy', ' Main St');
INSERT INTO CUSTOMER(CUSTOMER_ID,CUSTOMER_NAME,CONTACT_NO,PRODUCT_CATEGORY,QUANTITY,COUNTRY,CITY,STREET)  
VALUES ('C002', 'Alice Smith', 96543210, 'Appliances', 2, 'Canada', 'Toronto', 'Elm Ave');
INSERT INTO CUSTOMER  (CUSTOMER_ID,CUSTOMER_NAME,CONTACT_NO,PRODUCT_CATEGORY,QUANTITY,COUNTRY,CITY,STREET)
VALUES ('C003', 'David Johnson', 55566777, 'Office Supplies', 5, 'Sri lanka', 'Colombo', 'Oak Rd');
INSERT INTO CUSTOMER  (CUSTOMER_ID,CUSTOMER_NAME,CONTACT_NO,PRODUCT_CATEGORY,QUANTITY,COUNTRY,CITY,STREET)
VALUES ('C004', 'Emily Wilson', 2224444, 'Clothing', 4, 'Australia', 'Sydney', 'Maple Lane');
INSERT INTO CUSTOMER  (CUSTOMER_ID,CUSTOMER_NAME,CONTACT_NO,PRODUCT_CATEGORY,QUANTITY,COUNTRY,CITY,STREET)
VALUES ('C005', 'Michael Brown', 78889999, 'Books', 6, 'Sri lanka', 'Galle', 'Pine Street');
INSERT INTO CUSTOMER  (CUSTOMER_ID,CUSTOMER_NAME,CONTACT_NO,PRODUCT_CATEGORY,QUANTITY,COUNTRY,CITY,STREET)
VALUES ('C006', 'ael Brown', 78899, 'Boks', 6, 'Sri lanka', 'Galle', 'Pine Street');
-- FUEL-EXPENCES--------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------------------
INSERT INTO FUEL_EXPENSES (STATION,QUANTITY,COST,DATE,TIME) 
VALUES('Shell', 20.5, 45.75, '2023-09-01','08:30:00');
INSERT INTO FUEL_EXPENSES(STATION,QUANTITY,COST,DATE,TIME)   
VALUES('Exxon', 18.2, 38.60, '2023-09-03', '10:15:00');
INSERT INTO FUEL_EXPENSES  (STATION,QUANTITY,COST,DATE,TIME) 
VALUES('BP', 22.0, 51.80, '2023-09-05','14:45:00');
INSERT INTO FUEL_EXPENSES  (STATION,QUANTITY,COST,DATE,TIME) 
VALUES('Chevron', 17.8, 41.20, '2023-09-07','12:00:00');
INSERT INTO FUEL_EXPENSES  (STATION,QUANTITY,COST,DATE,TIME) 
VALUES ('Texaco', 19.3, 44.15, '2023-09-09','09:20:00');
INSERT INTO FUEL_EXPENSES  (STATION,QUANTITY,COST,DATE,TIME) 
VALUES ('SUBASH', 19.3, 44.15, '2023-09-09','09:20:00');



-- -----------------------------------UPDATE---------------------------------------------------
-- --------------------------------------------------------------------------------------------
-- EMPLOYEE-----------
UPDATE EMPLOYEE
SET EMP_NAME = 'Siriwardana',
    CONTACT_NO = 98765410
WHERE EMP_ID = 'E001';

UPDATE EMPLOYEE
SET EMP_NAME = 'Sumanadasa',
    CONTACT_NO = 9999999
WHERE EMP_ID = 'E002';

-- SUPPLIER------------

UPDATE SUPPLIER
SET SUPPLIER_NAME = 'M&M Suppliers',
    EMAIL = 'newemail@example.com'
WHERE SUPPLIER_ID = 'E001';

UPDATE SUPPLIER
SET SUPPLIER_NAME = 'XYZ Distributors',
    CONTACT_NO = 9874321
WHERE SUPPLIER_ID = 'E002';

-- PRODUCT-----------------

UPDATE PRODUCT
SET PRODUCT_NAME = 'CALVIN KLEVIN',
    UNIT_PRICE = 250.00
WHERE PRODUCT_ID = 'P001';

UPDATE PRODUCT
SET PRODUCT_NAME = 'Garlic Mayonnaise',
    VENDOR = 'Kothmale Foods'
WHERE PRODUCT_ID = 'P002';

-- PRODUCT_CATAGORY--------------
UPDATE PRODUCT_CATEGORY
SET CATEGORY_NAME = 'Furniture',
    STORING_CONDITION = 'Dry'
WHERE CATEGORY_ID = 'C006';

UPDATE PRODUCT_CATEGORY
SET CATEGORY_NAME = 'Grocery ',
    DESCRIP = 'Packaged Groceries'
WHERE CATEGORY_ID = 'C007';

-- OUTLET---------------------

UPDATE OUTLET
SET QUANTITY = 120
WHERE PRODUCT_ID = 'P001';


UPDATE OUTLET
SET QUANTITY = 750
WHERE PRODUCT_ID = 'P002';

-- STORE---------------------

UPDATE STORE
SET SOTRE_NAME = 'Central Warehouse ',
    LOCATION = 'Updated Location'
WHERE STORE_ID = '002';


UPDATE STORE
SET SOTRE_NAME = 'Regional Supply Center )',
    CONTACT_NO = 44879999
WHERE STORE_ID = '003';

-- VEHICAL-----------------------

UPDATE VEHICLE
SET MODEL = 'Toyota Cruiser',
    COLOR = 'Red'
WHERE VEHICLE_NO = 'V001';

UPDATE VEHICLE
SET MODEL = 'Ford mastang',
    VEHICLE_TYPE = 'Racing car'
WHERE VEHICLE_NO = 'V002';

-- DRIVER-------------------------

UPDATE DRIVER
SET FIRST_NAME = 'John',
    LAST_NAME = 'Silva',
    LICENSE_NO = '4321',
    COUNTRY = 'USA'
WHERE DRIVER_ID = 'E001';


UPDATE DRIVER
SET FIRST_NAME = 'Arjuna',
    LAST_NAME = 'Ranathunga',
    LICENSE_NO = '8765',
    CITY = 'New York'
WHERE DRIVER_ID = 'E002';

-- PAYMENT----------------------

UPDATE PAYMENT
SET PAYMENT_TYPE = 'Card',
    AMOUNT = 85000.00
WHERE PAYMENT_ID = 'PAY001';


UPDATE PAYMENT
SET PAYMENT_TYPE = 'Online Transfer',
    PAYMENT_DATE = '2023-09-10'
WHERE PAYMENT_ID = 'PAY002';

-- HELPER---------------------------

UPDATE HELPER
SET HELPER_NAME = 'Sumith ',
    CONTACT_NO = 9876540
WHERE HELPER_ID = 'E001';


UPDATE HELPER
SET HELPER_NAME = 'Rosan',
    CONTACT_NO = 976663
WHERE HELPER_ID = 'E007';

-- INSURANCE-------------------------

UPDATE INSURANCE
SET VEHICLE_NO = 'V002',
    EMP_ID = 'E002',
    INSURANCE_TYPE = 'Auto Insurance',
    INSURANCE_VALUE = 60000.00
WHERE INSURANCE_ID = 'INS001';


UPDATE INSURANCE
SET VEHICLE_NO = 'V003',
    EMP_ID = 'E003',
    INSURANCE_TYPE = 'Auto Insurance',
    INSURANCE_VALUE = 55000.00
WHERE INSURANCE_ID = 'INS002';
-- CUSTOMER----------------------------

UPDATE CUSTOMER
SET CUSTOMER_NAME = 'JohnTHAN',
    CONTACT_NO = 9876510,
    QUANTITY = 4
WHERE CUSTOMER_ID = 'C001';

UPDATE CUSTOMER
SET QUANTITY = 8
WHERE CUSTOMER_ID = 'C003';
-- FUEL_EXPENCES--------------------

UPDATE FUEL_EXPENSES
SET QUANTITY = 25.0, 
    COST = 55.00    
WHERE STATION = 'Shell';


UPDATE FUEL_EXPENSES
SET DATE = '2023-09-06', 
    TIME = '15:30:00' 
WHERE STATION = 'BP';

-- -------------------------------------------------------------------DELETE-------------------------------------------------------------------

-- Delete from EMPLOYEE
DELETE FROM EMPLOYEE
WHERE EMP_ID = 'E007';

-- Delete from SUPPLIER
DELETE FROM SUPPLIER
WHERE SUPPLIER_ID = 'E008';

-- Delete from PRODUCT
DELETE FROM PRODUCT
WHERE PRODUCT_ID = 'P003';

-- Delete from PRODUCT_CATEGORY
DELETE FROM PRODUCT_CATEGORY
WHERE CATEGORY_ID = 'C008';

-- Delete from OUTLET
DELETE FROM OUTLET
WHERE PRODUCT_ID = 'P005';

-- Delete from STORE
DELETE FROM STORE
WHERE STORE_ID = '006';

-- Delete from VEHICLE
DELETE FROM VEHICLE
WHERE VEHICLE_NO = 'V007';

-- Delete from DRIVER
DELETE FROM DRIVER
WHERE DRIVER_ID = 'E010';

-- Delete from PAYMENT
DELETE FROM PAYMENT
WHERE PAYMENT_ID = 'PAY005';

-- Delete from HELPER
DELETE FROM HELPER
WHERE HELPER_ID = 'E008';

-- Delete from INSURANCE
DELETE FROM INSURANCE
WHERE INSURANCE_ID = 'INS006';

-- Delete from CUSTOMER
DELETE FROM CUSTOMER
WHERE CUSTOMER_ID = 'C005';

-- Delete from FUEL_EXPENSES
DELETE FROM FUEL_EXPENSES
WHERE STATION = 'Exxon';

-- ---------------------------------------TRANSACTION------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------------
-- Simple Operations---------------------------


-- Select Oparetion--------------
SELECT * FROM PRODUCT;

-- Project Operation-------------
SELECT PRODUCT_NAME, UNIT_PRICE FROM PRODUCT;

-- Cartesian Product Operation------
SELECT * FROM SUPPLIER, PRODUCT;

-- Creating a user view------------
CREATE VIEW PRODUCT_VIEW AS
SELECT PRODUCT_NAME, UNIT_PRICE FROM PRODUCT;

-- Renaming Operation--------------
SELECT PRODUCT_NAME AS PRODUCT_TITLE, UNIT_PRICE FROM PRODUCT;

-- Average Operation----------------
SELECT AVG(UNIT_PRICE) AS AVERAGE_PRICE FROM PRODUCT;

-- Use of LIKE keyword--------------
SELECT * FROM PRODUCT WHERE PRODUCT_NAME LIKE '%chocolate%';

-- Complex Queries-------------------------------------------------------------------------------------

-- Natural join--------------------------
CREATE VIEW SUPPLIER_PRODUCT_VIEW AS
SELECT * FROM SUPPLIER NATURAL JOIN PRODUCT;

-- Union----------------------------------
SELECT PRODUCT_ID FROM PRODUCT
UNION
SELECT CATEGORY_ID FROM PRODUCT_CATEGORY;

-- Inner Join------------------------------
SELECT *
FROM SUPPLIER
INNER JOIN EMPLOYEE ON SUPPLIER.SUPPLIER_ID = EMPLOYEE.EMP_ID;

-- Left Outer Join-------------------------------
SELECT *
FROM DRIVER
LEFT OUTER JOIN EMPLOYEE ON DRIVER.DRIVER_ID = EMPLOYEE.EMP_ID;

-- Right Outer Join-------------------------------
SELECT *
FROM SUPPLIER
RIGHT OUTER JOIN EMPLOYEE ON SUPPLIER.SUPPLIER_ID = EMPLOYEE.EMP_ID;

-- Full Outer Join--------------------------------
-- Left Join
SELECT *
FROM STORE
LEFT JOIN VEHICLE ON STORE.STORE_ID = VEHICLE.VEHICLE_NO

UNION

-- Right Join
SELECT *
FROM STORE
RIGHT JOIN VEHICLE ON STORE.STORE_ID = VEHICLE.VEHICLE_NO;

-- Division operation--------------

SELECT DISTINCT SUPPLIER_ID
FROM SUPPLIER
WHERE NOT EXISTS (
    SELECT EMP_ID
    FROM Employee                    
    WHERE EMP_ID NOT IN (
        SELECT DRIVER_ID
        FROM DRIVER
        WHERE DRIVER.DRIVER_ID = SUPPLIER.SUPPLIER_ID
    )
);

SELECT DISTINCT V.VEHICLE_NO
FROM VEHICLE V
WHERE NOT EXISTS (
    SELECT I.VEHICLE_NO
    FROM INSURANCE I
    WHERE I.VEHICLE_NO = V.VEHICLE_NO
) AND NOT EXISTS (
    SELECT 1
    FROM INSURANCE
);

SELECT DISTINCT V.VEHICLE_NO
FROM VEHICLE V
WHERE NOT EXISTS (
    SELECT I.VEHICLE_NO
    FROM INSURANCE AS I
    WHERE NOT EXISTS (
        SELECT D.DRIVER_ID
        FROM DRIVER D
        JOIN SUPPLIER S ON D.DRIVER_ID = S.SUPPLIER_ID
        JOIN EMPLOYEE E ON D.DRIVER_ID = E.EMP_ID  
        WHERE D.DRIVER_ID = E.EMP_ID
        AND NOT EXISTS (
            SELECT 1
            FROM DRIVER D2
            WHERE D2.DRIVER_ID = E.EMP_ID
        )
    )
);
-- NESTED QUERY----------------------
SELECT EMP_NAME
FROM EMPLOYEE
WHERE EMP_ID IN (
    SELECT EMP_ID
    FROM DRIVER
);


SELECT PRODUCT_NAME, SUM(QUANTITY) AS TOTAL_QUANTITY
FROM OUTLET  
GROUP BY PRODUCT_NAME;
--  --------------------------------------------------------------------------------
SELECT S.SUPPLIER_NAME, SUM(O.QUANTITY) AS TOTAL_QUANTITY
FROM OUTLET O
JOIN SUPPLIER S ON O.VENDOR = S.SUPPLIER_ID
GROUP BY S.SUPPLIER_NAME;


 -- ---------------------------------------------------------
SELECT DISTINCT S.SUPPLIER_NAME
FROM SUPPLIER S
WHERE EXISTS (
    SELECT *
    FROM EMPLOYEE E
    WHERE E.EMP_ID = S.SUPPLIER_ID
);
 -- ---------------------------------------------------------
 SELECT DISTINCT E.EMP_NAME
FROM EMPLOYEE E
WHERE NOT EXISTS (
    SELECT *
    FROM SUPPLIER S
    WHERE S.SUPPLIER_ID = E.EMP_ID
);
-- ----------------------------------------------------------------------

 -- CREATED A CONNECTION BETWEEEN PRODUCT AND PRODUCT_CATEGORY TABLE -------------------------------------
ALTER TABLE PRODUCT
ADD COLUMN CATEGORY_ID VARCHAR(15);

ALTER TABLE PRODUCT
ADD CONSTRAINT FK_Product_Category
FOREIGN KEY (CATEGORY_ID) REFERENCES PRODUCT_CATEGORY(CATEGORY_ID)
ON DELETE CASCADE
ON UPDATE CASCADE;


SELECT PC.CATEGORY_NAME, MAX(P.UNIT_PRICE) AS MAX_PRICE
FROM PRODUCT P
JOIN PRODUCT_CATEGORY PC ON P.CATEGORY_ID = PC.CATEGORY_ID
GROUP BY PC.CATEGORY_NAME;
-- -------------------------------------------------------------------------------------------------------


SELECT STATION, AVG(COST) AS AVERAGE_COST
FROM FUEL_EXPENSES
WHERE DATE BETWEEN '2023-09-01' AND '2023-09-30'
GROUP BY STATION;

SELECT CUSTOMER_NAME
FROM CUSTOMER
WHERE CUSTOMER_ID IN (
    SELECT CUSTOMER_ID  
    FROM CUSTOMER
    WHERE QUANTITY > 5
);



-- --------------------------------------------------------Tuning-----------------------------------------------------------------------
-- -------------------------------------------------------------------------------------------------------------------------------------


-- TUNING OF UNION OPERATION ------------------------------------------------------------------------------
CREATE INDEX idx_product_product_id ON PRODUCT(PRODUCT_ID);
CREATE INDEX idx_product_category_category_id ON PRODUCT_CATEGORY(CATEGORY_ID);

SELECT PRODUCT_ID FROM PRODUCT
UNION ALL
SELECT CATEGORY_ID FROM PRODUCT_CATEGORY;

-- FULL OUTER JOIN OPTIMIZATION ---------------------------------------------------------------------------
SELECT *
FROM STORE
LEFT JOIN VEHICLE ON STORE.STORE_ID = VEHICLE.VEHICLE_NO
UNION ALL
SELECT *
FROM STORE
RIGHT JOIN VEHICLE ON STORE.STORE_ID = VEHICLE.VEHICLE_NO;

-- GROUP BY QUERY OPTIMIZATION---------------------------------------------------------------------------
SELECT PRODUCT_NAME, SUM(QUANTITY) AS TOTAL_QUANTITY
FROM OUTLET
GROUP BY PRODUCT_NAME;


-- NESTED QUERY TUNING -------------------------------------------------------------------------------------
SELECT DISTINCT C.CUSTOMER_NAME
FROM CUSTOMER C
JOIN (
    SELECT CUSTOMER_ID
    FROM CUSTOMER
    WHERE QUANTITY > 5
) AS Subquery
ON C.CUSTOMER_ID = Subquery.CUSTOMER_ID;

SELECT DISTINCT V.VEHICLE_NO
FROM VEHICLE V
WHERE NOT EXISTS (
    SELECT I.VEHICLE_NO
    FROM INSURANCE AS I
    WHERE NOT EXISTS (
        SELECT D.DRIVER_ID
        FROM DRIVER D
        JOIN SUPPLIER S ON D.DRIVER_ID = S.SUPPLIER_ID
        JOIN EMPLOYEE E ON D.DRIVER_ID = E.EMP_ID
        WHERE D.DRIVER_ID = V.VEHICLE_NO
    )
);

SELECT C.CUSTOMER_NAME
FROM CUSTOMER C
JOIN (
    SELECT CUSTOMER_ID
    FROM CUSTOMER
    WHERE QUANTITY > 5
) AS Subquery
ON C.CUSTOMER_ID = Subquery.CUSTOMER_ID;


-- 	CREATING INDEXES ----------------------------------------------------------------------------------------------------------------
CREATE INDEX idx_supplier_product_supplier_id ON SUPPLIER(SUPPLIER_ID);
CREATE INDEX idx_supplier_product_product_id ON PRODUCT(PRODUCT_ID);

CREATE INDEX idx_employee_emp_id ON EMPLOYEE(EMP_ID);
CREATE INDEX idx_supplier_supplier_id ON SUPPLIER(SUPPLIER_ID);

CREATE INDEX idx_customer_customer_id ON CUSTOMER(CUSTOMER_ID);
CREATE INDEX idx_customer_quantity ON CUSTOMER(QUANTITY);

CREATE INDEX idx_fuel_expenses_date ON FUEL_EXPENSES(DATE);
CREATE INDEX idx_fuel_expenses_station ON FUEL_EXPENSES(STATION);























