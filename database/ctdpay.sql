-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 21, 2023 at 09:36 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ctdpay`
--
create database cdtpay;
-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customerPhone` char(11) NOT NULL,
  `customerName` varchar(50) NOT NULL,
  `customerOTP` char(6) NOT NULL,
  `customerEmail` varchar(50) NOT NULL,
  `balance` int(20) NOT NULL,
  `createAt` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `request_form`
--

CREATE TABLE `request_form` (
  `requestID` int(11) NOT NULL,
  `customerPhone` varchar(11) NOT NULL,
  `requestType` varchar(20) NOT NULL,
  `requestDate` date NOT NULL,
  `requestStatus` varchar(20) NOT NULL,
  `requestDetails` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `saving`
--

CREATE TABLE `saving` (
  `savingID` int(11) NOT NULL,
  `customerPhone` varchar(11) NOT NULL,
  `initialAmount` int(11) NOT NULL,
  `interestRate` int(11) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `totalAmount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staffID` int(11) NOT NULL,
  `staffPassword` varchar(15) NOT NULL,
  `staffName` varchar(45) NOT NULL,
  `staffPhone` varchar(11) NOT NULL,
  `staffEmail` varchar(50) NOT NULL,
  `staffRole` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `transactionNumber` varchar(20) NOT NULL,
  `senderPhone` char(11) NOT NULL,
  `staffID` int(11) NOT NULL,
  `reciverPhone` varchar(11) NOT NULL,
  `transactionMessages` varchar(100) NOT NULL,
  `transactionAmount` int(11) NOT NULL,
  `transactionDate` date NOT NULL,
  `transactionStatus` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customerPhone`);

--
-- Indexes for table `request_form`
--
ALTER TABLE `request_form`
  ADD PRIMARY KEY (`requestID`),
  ADD KEY `FK_Request_Customer` (`customerPhone`);

--
-- Indexes for table `saving`
--
ALTER TABLE `saving`
  ADD PRIMARY KEY (`savingID`),
  ADD KEY `FK_Saving_Customer` (`customerPhone`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staffID`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`transactionNumber`),
  ADD KEY `FK_Transact_Customer` (`senderPhone`),
  ADD KEY `FK_Transact_Staff` (`staffID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `request_form`
--
ALTER TABLE `request_form`
  MODIFY `requestID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `saving`
--
ALTER TABLE `saving`
  MODIFY `savingID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `staffID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `request_form`
--
ALTER TABLE `request_form`
  ADD CONSTRAINT `FK_Request_Customer` FOREIGN KEY (`customerPhone`) REFERENCES `customer` (`customerPhone`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `saving`
--
ALTER TABLE `saving`
  ADD CONSTRAINT `FK_Saving_Customer` FOREIGN KEY (`customerPhone`) REFERENCES `customer` (`customerPhone`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `FK_Transact_Customer` FOREIGN KEY (`senderPhone`) REFERENCES `customer` (`customerPhone`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Transact_Staff` FOREIGN KEY (`staffID`) REFERENCES `staff` (`staffID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
