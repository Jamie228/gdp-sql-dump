-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 11, 2020 at 01:04 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id12874597_purchase_order_system`
--
CREATE DATABASE IF NOT EXISTS `id12874597_purchase_order_system` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `id12874597_purchase_order_system`;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--
-- Creation: Mar 10, 2020 at 01:12 PM
-- Last update: Mar 10, 2020 at 11:51 AM
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `departmentID` varchar(6) NOT NULL COMMENT 'Unique ID for the department',
  `departmentName` varchar(20) NOT NULL COMMENT 'Name of the department',
  `departmentManager` varchar(6) DEFAULT NULL COMMENT 'StaffID for member of staff that manages the department'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='A list of departments within G4U';

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`departmentID`, `departmentName`, `departmentManager`) VALUES
('ACC', 'Accounts', NULL),
('GT', 'Games and Toys', 'VER121');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--
-- Creation: Mar 10, 2020 at 10:24 AM
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `orderNumber` int(11) NOT NULL,
  `orderDate` date NOT NULL,
  `orderTotalCost` decimal(10,0) NOT NULL,
  `orderState` enum('Delivered','Not Delivered') NOT NULL,
  `staffID` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orderline`
--
-- Creation: Mar 10, 2020 at 10:24 AM
--

DROP TABLE IF EXISTS `orderline`;
CREATE TABLE `orderline` (
  `orderNumber` int(11) NOT NULL,
  `productCode` varchar(6) NOT NULL,
  `supplierID` varchar(3) NOT NULL,
  `quantity` int(11) NOT NULL,
  `shippedOn` date DEFAULT NULL,
  `delivered` tinyint(1) DEFAULT NULL,
  `deliveryDate` date DEFAULT NULL,
  `staffID` varchar(6) NOT NULL,
  `orderState` enum('Requested','Dispatched','Delivered') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--
-- Creation: Mar 11, 2020 at 12:11 PM
-- Last update: Mar 11, 2020 at 12:29 PM
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `productCode` varchar(6) NOT NULL,
  `productName` varchar(50) NOT NULL,
  `productTypeCode` varchar(5) DEFAULT NULL,
  `productDescription` mediumtext NOT NULL,
  `amountInStock` int(11) NOT NULL,
  `productPhoto` varchar(100) DEFAULT NULL,
  `minStock` int(11) NOT NULL,
  `maxStock` int(11) NOT NULL DEFAULT 25
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`productCode`, `productName`, `productTypeCode`, `productDescription`, `amountInStock`, `productPhoto`, `minStock`, `maxStock`) VALUES
('FP59', 'Funko Pop! Disney: Frozen 2 - Olaf', 'TOY', 'A classic Funko Pop! figure of Olaf from Disney\'s Frozen and Frozen 2.', 6, NULL, 10, 25),
('KST01', 'KLIKBOT Studio Thud', 'TOY', 'A line of collectible, all-action figures. With interchangeable pieces, articulating limbs and accessories. Used for stop-frame animation movies.', 25, NULL, 10, 25),
('LEX95', 'LEGO Classic Bricks and Ideas - 11001', 'TOY', 'Play and learn with the colorful LEGO Classic 11001 Bricks and Ideas set. Choose from a selection of colorful LEGO bricks and pieces, including eyes, wheels and hinges to create classic toys such as buildings, animals, vehicles or objects. Build a LEGO keyboard, toy train, dinosaur toy or whatever you can imagine!', 23, NULL, 10, 25),
('NRF10', 'Nerf N-Strike Elite Disruptor', 'TOY', 'A Nerf Gun that fires foam darts.', 16, NULL, 10, 25),
('PIN00', 'Plan Toys Pinball', 'TOY', 'A fun wooden activity game set that will challenge children physically and mentally', 18, NULL, 10, 25),
('POL03', 'Polaroid Play 3D Pen', 'GDGTS', 'A handheld pen for creating 3D structures and models.', 11, NULL, 10, 25),
('PPF03', 'Portable Personal Fan', 'GDGTS', 'A miniature battery powered fan', 18, NULL, 10, 25),
('PWR41', 'USB Power Bank 10000mAh', 'GDGTS', 'A 10000mAh portable USB power bank', 14, NULL, 10, 25),
('PWR43', 'USB Power Bank 20000mAH', 'GDGTS', 'A 20000mAh portable USB power bank', 10, NULL, 10, 25),
('PWR44', 'USB Power Bank 25800mAh', 'GDGTS', 'A 25800mAh portable USB power bank', 6, NULL, 10, 25),
('SC01', 'Spider Catcher', 'GDGTS', 'A device for safely and humanely catching and disposing of spiders', 13, NULL, 10, 25),
('SW08', 'Star Wars USB Cup Warmer BB-8', 'GDGTS', 'A desktop device for warming the contents of a mug or cup powered over USB. In the shape of BB-8', 19, NULL, 10, 25);

-- --------------------------------------------------------

--
-- Table structure for table `productsupplier`
--
-- Creation: Mar 10, 2020 at 10:24 AM
-- Last update: Mar 11, 2020 at 12:43 PM
--

DROP TABLE IF EXISTS `productsupplier`;
CREATE TABLE `productsupplier` (
  `productCode` varchar(6) NOT NULL,
  `supplierID` varchar(3) NOT NULL,
  `costInPence` int(11) NOT NULL,
  `deliveryTimeInWorkingDays` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `productsupplier`
--

INSERT INTO `productsupplier` (`productCode`, `supplierID`, `costInPence`, `deliveryTimeInWorkingDays`) VALUES
('FP59', 'CT', 710, 6),
('FP59', 'SH', 750, 5),
('KST01', 'BS', 995, 12),
('KST01', 'SH', 750, 30),
('LEX95', 'CT', 800, 5),
('LEX95', 'SH', 768, 10),
('NRF10', 'BI', 1299, 12),
('NRF10', 'SH', 1050, 30),
('PIN00', 'BI', 4000, 5),
('PIN00', 'CT', 3825, 6),
('POL03', 'BS', 2859, 4),
('POL03', 'SH', 2200, 25),
('PPF03', 'BI', 565, 5),
('PPF03', 'SH', 480, 15),
('PWR41', 'BI', 995, 5),
('PWR41', 'BS', 995, 5),
('PWR43', 'BI', 1899, 5),
('PWR43', 'BS', 1864, 5),
('PWR44', 'BI', 1999, 5),
('PWR44', 'BS', 1900, 5),
('SC01', 'BS', 199, 3),
('SC01', 'SH', 158, 20),
('SW08', 'BI', 999, 4),
('SW08', 'BS', 1099, 5),
('SW08', 'SH', 985, 25);

-- --------------------------------------------------------

--
-- Table structure for table `producttype`
--
-- Creation: Mar 10, 2020 at 03:26 PM
-- Last update: Mar 10, 2020 at 03:54 PM
--

DROP TABLE IF EXISTS `producttype`;
CREATE TABLE `producttype` (
  `productTypeCode` varchar(5) NOT NULL,
  `productTypeName` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `producttype`
--

INSERT INTO `producttype` (`productTypeCode`, `productTypeName`) VALUES
('GDGTS', 'Gadgets'),
('TOY', 'Toys');

-- --------------------------------------------------------

--
-- Table structure for table `request`
--
-- Creation: Mar 10, 2020 at 10:24 AM
--

DROP TABLE IF EXISTS `request`;
CREATE TABLE `request` (
  `requestID` int(11) NOT NULL,
  `staffID` varchar(6) NOT NULL,
  `date` date NOT NULL,
  `subTotal` decimal(10,0) NOT NULL,
  `totalCost` decimal(10,0) NOT NULL,
  `authorised` tinyint(1) DEFAULT NULL,
  `authDate` date DEFAULT NULL,
  `authStaffID` varchar(6) DEFAULT NULL,
  `confirmed` tinyint(1) DEFAULT NULL,
  `confirmedDate` date DEFAULT NULL,
  `confirmedStaffID` varchar(6) DEFAULT NULL,
  `requestState` enum('Pending','Authorised','Confirmed','Issue') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `requestedproduct`
--
-- Creation: Mar 10, 2020 at 10:24 AM
--

DROP TABLE IF EXISTS `requestedproduct`;
CREATE TABLE `requestedproduct` (
  `requestID` int(11) NOT NULL,
  `productCode` varchar(6) NOT NULL,
  `quantity` int(11) NOT NULL,
  `supplierID` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--
-- Creation: Mar 10, 2020 at 10:24 AM
-- Last update: Mar 10, 2020 at 04:27 PM
--

DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff` (
  `staffID` varchar(6) NOT NULL COMMENT 'Staff Member unique ID',
  `title` varchar(4) NOT NULL,
  `firstName` varchar(10) NOT NULL,
  `lastName` varchar(30) NOT NULL,
  `appointment` varchar(50) NOT NULL,
  `departmentID` varchar(6) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='A table of the staff within the company';

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staffID`, `title`, `firstName`, `lastName`, `appointment`, `departmentID`, `password`) VALUES
('BRE510', 'Mr', 'Jason', 'Brentwood', 'Senior SalePerson GT', 'GT', '$2y$10$0qLD8nm.1jzWhg1XxqQpuevQ9b3uDPahfYShTUPXS7JrRk3YDs3n2'),
('DUN021', 'Ms', 'Sarah', 'Dunkley', 'CEO PG4U', NULL, '$2y$10$gWgVjlEyGQ8VUSb7F/7lOuT3noGRzxc5oA5XgPOkn1Zq/ZSIdBIau'),
('GRE056', 'Ms', 'Ann', 'Greengold', 'Assistant QA Controller', 'ACC', '$2y$10$RiA7UHk2OFLXduGqRI2Q4.eTrDfINJOD4XBo1frKCfNbgaK1RfbRy'),
('GRE123', 'Miss', 'Jennifer', 'Green', 'Sales Assistant', 'GT', '$2y$10$RUYXC7EsnDkpFqTWNZvyRu.hNtA7Egzr3W8fhVvtke7RQPCDuAvyi'),
('HID001', 'Sir', 'Adrian', 'Hidcote-Armstrong', 'MD and Chairman of the Board', NULL, '$2y$10$SfhYIDtn.iOuCW7zfoFLuuZHX6lja4lF4XA4JqNmpiH/.P3zB8JCa'),
('MAH042', 'Mr', 'Mustafa', 'Mahmood', 'Sales Assistant', 'GT', '$2y$10$DYHLWDbQRu9fDDc/FzdcJeQAXbcAn0wuuUj8VMV5K5mXZYK8cuTka'),
('PAT201', 'Ms', 'Amanda', 'Patel', 'Sales Assistant', 'GT', '$2y$10$HPXFPBM3RjkM3OUQSemj5OD5xdZXniREnnsZDwVV87tuzBBqPoImS'),
('PIA412', 'Mr', 'Enrico', 'Piam', 'Sales Assistant', 'GT', '$2y$10$BCQqrZwXL8XXoXBl.RUJ4OD5m1Qcf5w1v3n43IuTQTkMFTRtyiOfa'),
('PIT101', 'Mr', 'Derek', 'Pitts', 'Sales Assistant', 'GT', '$2y$10$bMeYHHTDTPabDMAd0b/P4udbrsOINqvdpJz5Fa9VyGSjzuD1BvkLy'),
('VER121', 'Mr', 'John', 'Vermont', 'Mgr PG4U GT Dept.', 'GT', '$2y$10$FLXXkwdNs18UDa80SXaA4ewZu8J0cXDM6m0vCnO..bFrmK2BDJsvK');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--
-- Creation: Mar 10, 2020 at 01:36 PM
-- Last update: Mar 10, 2020 at 01:43 PM
--

DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `supplierID` varchar(3) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(200) NOT NULL COMMENT 'Address of supplier',
  `city` varchar(20) NOT NULL,
  `postcode` varchar(15) NOT NULL,
  `country``` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supplierID`, `name`, `address`, `city`, `postcode`, `country``) VALUES
('BI', 'Bitmore Inc.', 'Park House, 15-19 Greenhill Crescent, Watford Business Park', 'Hertfordshire', 'WD18 8PH', 'England'),
('BS', 'BrainStorm Ltd', 'Unit 1A, Mill Lane, Gisburn', 'Lancashire', 'BB7 4LN', 'England'),
('CT', 'Cottage Toys', 'Unit 11, Spitfire Business Park, Hawker Road', 'Croydon', 'CR0 4WD', 'England'),
('SH', 'Shezhen Hosing Technology Development Co., Ltd', 'Weixanda Industrial Park, Caowei Xixiang Baoan District, Shenzhen', 'Guangdong', '518128', 'China');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`departmentID`),
  ADD KEY `FK_departmentManager` (`departmentManager`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`orderNumber`),
  ADD KEY `FK_staffIDOrder` (`staffID`);

--
-- Indexes for table `orderline`
--
ALTER TABLE `orderline`
  ADD PRIMARY KEY (`orderNumber`,`productCode`,`supplierID`),
  ADD KEY `FK_staffIDOrderLine` (`staffID`),
  ADD KEY `FK_productCodeOrderLine` (`productCode`),
  ADD KEY `FK_supplierIDOrderLine` (`supplierID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`productCode`),
  ADD KEY `FK_productTypeCode` (`productTypeCode`);

--
-- Indexes for table `productsupplier`
--
ALTER TABLE `productsupplier`
  ADD PRIMARY KEY (`productCode`,`supplierID`),
  ADD KEY `FK_supplierID` (`supplierID`),
  ADD KEY `productCode` (`productCode`);

--
-- Indexes for table `producttype`
--
ALTER TABLE `producttype`
  ADD PRIMARY KEY (`productTypeCode`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`requestID`),
  ADD KEY `FK_staffIDReq` (`staffID`),
  ADD KEY `FK_authStaffID` (`authStaffID`),
  ADD KEY `FK_confirmedStaffID` (`confirmedStaffID`);

--
-- Indexes for table `requestedproduct`
--
ALTER TABLE `requestedproduct`
  ADD PRIMARY KEY (`requestID`,`productCode`,`supplierID`),
  ADD KEY `FK_ReqProSupplier` (`supplierID`),
  ADD KEY `FK_ReqProProductCode` (`productCode`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staffID`),
  ADD KEY `FK_department` (`departmentID`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supplierID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `orderNumber` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `requestID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `FK_departmentManager` FOREIGN KEY (`departmentManager`) REFERENCES `staff` (`staffID`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FK_staffIDOrder` FOREIGN KEY (`staffID`) REFERENCES `staff` (`staffID`);

--
-- Constraints for table `orderline`
--
ALTER TABLE `orderline`
  ADD CONSTRAINT `FK_OrderLineOrderNumber` FOREIGN KEY (`orderNumber`) REFERENCES `order` (`orderNumber`),
  ADD CONSTRAINT `FK_productCodeOrderLine` FOREIGN KEY (`productCode`) REFERENCES `product` (`productCode`),
  ADD CONSTRAINT `FK_staffIDOrderLine` FOREIGN KEY (`staffID`) REFERENCES `staff` (`staffID`),
  ADD CONSTRAINT `FK_supplierIDOrderLine` FOREIGN KEY (`supplierID`) REFERENCES `productsupplier` (`supplierID`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_productTypeCode` FOREIGN KEY (`productTypeCode`) REFERENCES `producttype` (`productTypeCode`);

--
-- Constraints for table `productsupplier`
--
ALTER TABLE `productsupplier`
  ADD CONSTRAINT `FK_productCode` FOREIGN KEY (`productCode`) REFERENCES `product` (`productCode`),
  ADD CONSTRAINT `FK_supplierID` FOREIGN KEY (`supplierID`) REFERENCES `supplier` (`supplierID`);

--
-- Constraints for table `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `FK_authStaffID` FOREIGN KEY (`authStaffID`) REFERENCES `staff` (`staffID`),
  ADD CONSTRAINT `FK_confirmedStaffID` FOREIGN KEY (`confirmedStaffID`) REFERENCES `staff` (`staffID`),
  ADD CONSTRAINT `FK_staffIDReq` FOREIGN KEY (`staffID`) REFERENCES `staff` (`staffID`);

--
-- Constraints for table `requestedproduct`
--
ALTER TABLE `requestedproduct`
  ADD CONSTRAINT `FK_ReqProProductCode` FOREIGN KEY (`productCode`) REFERENCES `product` (`productCode`),
  ADD CONSTRAINT `FK_ReqProRequestID` FOREIGN KEY (`requestID`) REFERENCES `request` (`requestID`),
  ADD CONSTRAINT `FK_ReqProSupplier` FOREIGN KEY (`supplierID`) REFERENCES `productsupplier` (`supplierID`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `FK_department` FOREIGN KEY (`departmentID`) REFERENCES `department` (`departmentID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
