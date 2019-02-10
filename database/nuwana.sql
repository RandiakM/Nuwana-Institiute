-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 02, 2019 at 05:39 PM
-- Server version: 5.7.23
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nuwana`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `UserId` int(15) NOT NULL AUTO_INCREMENT,
  `LogAdminId` varchar(50) NOT NULL,
  `AccNo` varchar(30) NOT NULL,
  `PaymentID` varchar(50) NOT NULL,
  UNIQUE KEY `UserId` (`UserId`),
  KEY `LogId` (`LogAdminId`),
  KEY `PaymentID` (`PaymentID`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`UserId`, `LogAdminId`, `AccNo`, `PaymentID`) VALUES
(7, 'ADM-001', '7812345', 'PAY-ADM-001');

-- --------------------------------------------------------

--
-- Table structure for table `calendar`
--

DROP TABLE IF EXISTS `calendar`;
CREATE TABLE IF NOT EXISTS `calendar` (
  `EventName` char(30) DEFAULT NULL,
  `StartTime` varchar(30) DEFAULT NULL,
  `EndTime` varchar(30) DEFAULT NULL,
  `EventDate` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `calendar`
--

INSERT INTO `calendar` (`EventName`, `StartTime`, `EndTime`, `EventDate`) VALUES
('awrudu', '12:00:00', '14:00:00', 'Jan 3, 2019');

-- --------------------------------------------------------

--
-- Table structure for table `clerk`
--

DROP TABLE IF EXISTS `clerk`;
CREATE TABLE IF NOT EXISTS `clerk` (
  `UserId` int(11) NOT NULL AUTO_INCREMENT,
  `LogClerkId` varchar(50) NOT NULL,
  `AccNo` varchar(30) DEFAULT NULL,
  `PaymentID` varchar(30) DEFAULT NULL,
  UNIQUE KEY `UserId` (`UserId`),
  KEY `PaymentID` (`PaymentID`),
  KEY `LogId` (`LogClerkId`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clerk`
--

INSERT INTO `clerk` (`UserId`, `LogClerkId`, `AccNo`, `PaymentID`) VALUES
(2, 'CLK-003', '7856765', 'PAY-CLK-003');

-- --------------------------------------------------------

--
-- Table structure for table `extra_classes`
--

DROP TABLE IF EXISTS `extra_classes`;
CREATE TABLE IF NOT EXISTS `extra_classes` (
  `TeacherId` varchar(10) NOT NULL,
  `SubjectCode` varchar(30) DEFAULT NULL,
  `StartTime` varchar(30) DEFAULT NULL,
  `EndTime` varchar(30) DEFAULT NULL,
  `HallName` varchar(10) DEFAULT NULL,
  `ClassDay` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`TeacherId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `extra_classes`
--

INSERT INTO `extra_classes` (`TeacherId`, `SubjectCode`, `StartTime`, `EndTime`, `HallName`, `ClassDay`) VALUES
('', '', '00:00:00', '00:00:00', 'A', 'Monday'),
('2323', '', '12:14:00', '01:40:00', 'B', 'Tuesday'),
('123', '', '13:15:00', '15:30:00', 'B', 'Tuesday'),
('68', '54', '00:00:00', '00:00:00', 'A', 'Monday');

-- --------------------------------------------------------

--
-- Table structure for table `fees`
--

DROP TABLE IF EXISTS `fees`;
CREATE TABLE IF NOT EXISTS `fees` (
  `UserId` int(11) NOT NULL AUTO_INCREMENT,
  `StudentId` varchar(50) NOT NULL,
  `StGrade` varchar(50) NOT NULL,
  `StSubjects` varchar(50) NOT NULL,
  `Amount` varchar(50) NOT NULL,
  `PayDate` date DEFAULT NULL,
  UNIQUE KEY `UserId` (`UserId`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fees`
--

INSERT INTO `fees` (`UserId`, `StudentId`, `StGrade`, `StSubjects`, `Amount`, `PayDate`) VALUES
(1, 'STD-11-001', '11', 'Maths', '100.00', '2019-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `labour`
--

DROP TABLE IF EXISTS `labour`;
CREATE TABLE IF NOT EXISTS `labour` (
  `UserId` int(11) NOT NULL AUTO_INCREMENT,
  `LabourId` varchar(50) NOT NULL,
  `FName` varchar(50) NOT NULL,
  `LName` varchar(50) NOT NULL,
  `Gender` varchar(6) NOT NULL,
  `No` varchar(50) NOT NULL,
  `Street` varchar(50) NOT NULL,
  `City` varchar(50) NOT NULL,
  `DOB` date NOT NULL,
  `PhoneNo` int(10) NOT NULL,
  `NIC` varchar(15) NOT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `AccNo` varchar(30) DEFAULT NULL,
  `PaymentID` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`LabourId`),
  UNIQUE KEY `UserId` (`UserId`),
  KEY `PaymentID` (`PaymentID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `labour`
--

INSERT INTO `labour` (`UserId`, `LabourId`, `FName`, `LName`, `Gender`, `No`, `Street`, `City`, `DOB`, `PhoneNo`, `NIC`, `Email`, `AccNo`, `PaymentID`) VALUES
(1, 'LBR-001', 'Rajith', 'Dsananjaya', 'Male', '44', 'Udaha Rd', 'Kegalle', '2019-01-19', 772222345, '867878980v', 'rajith@gmail.com', '9982323', 'PAY-LBR-001');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `UserId` int(11) NOT NULL AUTO_INCREMENT,
  `LogId` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Activated` char(1) NOT NULL,
  UNIQUE KEY `Password` (`Password`),
  UNIQUE KEY `UserId` (`UserId`),
  KEY `LogId` (`LogId`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`UserId`, `LogId`, `Password`, `Activated`) VALUES
(1, 'ADM-001', 'randika', '1'),
(14, 'TEA-001', 'kalitha', '1'),
(15, 'CLK-003', 'wwwwww', '1');

-- --------------------------------------------------------

--
-- Table structure for table `parent`
--

DROP TABLE IF EXISTS `parent`;
CREATE TABLE IF NOT EXISTS `parent` (
  `ParentName` varchar(50) DEFAULT NULL,
  `ParentTelNo` int(10) DEFAULT NULL,
  `StudentId` varchar(50) DEFAULT NULL,
  KEY `StudentId` (`StudentId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `parent`
--

INSERT INTO `parent` (`ParentName`, `ParentTelNo`, `StudentId`) VALUES
('cc', 11, 'STD-987');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `UserId` int(11) NOT NULL AUTO_INCREMENT,
  `LogpayId` varchar(50) NOT NULL,
  `PaymentID` varchar(50) NOT NULL,
  `Amount` varchar(50) NOT NULL,
  `PayDate` date NOT NULL,
  PRIMARY KEY (`PaymentID`),
  UNIQUE KEY `UserId` (`UserId`),
  KEY `LogId` (`LogpayId`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`UserId`, `LogpayId`, `PaymentID`, `Amount`, `PayDate`) VALUES
(1, 'ADM-001', 'PAY-ADM-001', '10000.00', '2019-01-08');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `UserId` int(15) NOT NULL AUTO_INCREMENT,
  `StudentId` varchar(50) NOT NULL,
  `FName` varchar(30) DEFAULT NULL,
  `LName` varchar(30) DEFAULT NULL,
  `Gender` char(6) DEFAULT NULL,
  `No` varchar(10) DEFAULT NULL,
  `Street` varchar(30) DEFAULT NULL,
  `City` varchar(30) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `PhoneNo` int(10) NOT NULL,
  `NIC` varchar(10) DEFAULT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `LogClerkId` varchar(50) DEFAULT '6',
  PRIMARY KEY (`StudentId`),
  UNIQUE KEY `UserId` (`UserId`),
  UNIQUE KEY `PhoneNo` (`PhoneNo`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`UserId`, `StudentId`, `FName`, `LName`, `Gender`, `No`, `Street`, `City`, `DOB`, `PhoneNo`, `NIC`, `Email`, `LogClerkId`) VALUES
(1, 'STD-8-001', 'sandaru', 'imal', 'Male', '34', 'badulla', 'haliela', '2019-01-04', 334444, '23322', 'sandaru', '6'),
(5, 'STD-987', 'qq', 'qqqq', 'Female', '22', 'ss', 'dd', '2019-01-18', 33, '43', 'ddf', 'CLK-003');

-- --------------------------------------------------------

--
-- Table structure for table `student_attendance`
--

DROP TABLE IF EXISTS `student_attendance`;
CREATE TABLE IF NOT EXISTS `student_attendance` (
  `UserId` int(11) NOT NULL AUTO_INCREMENT,
  `StudentId` varchar(50) NOT NULL,
  `AtDate` date NOT NULL,
  UNIQUE KEY `UserId` (`UserId`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_attendance`
--

INSERT INTO `student_attendance` (`UserId`, `StudentId`, `AtDate`) VALUES
(1, 'STD-8-001', '2019-02-02'),
(2, 'STD-9-005', '2019-02-02');

-- --------------------------------------------------------

--
-- Table structure for table `student_parent`
--

DROP TABLE IF EXISTS `student_parent`;
CREATE TABLE IF NOT EXISTS `student_parent` (
  `UserId` int(11) NOT NULL AUTO_INCREMENT,
  `StudentId` varchar(50) NOT NULL,
  `ParentName` varchar(50) NOT NULL,
  `ParentTelNo` int(10) NOT NULL,
  UNIQUE KEY `UserId` (`UserId`),
  KEY `StudentId` (`StudentId`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_parent`
--

INSERT INTO `student_parent` (`UserId`, `StudentId`, `ParentName`, `ParentTelNo`) VALUES
(1, 'STD-8-001', 'father', 711212123),
(7, 'STD-10-001', 'u', 6);

-- --------------------------------------------------------

--
-- Table structure for table `student_subject`
--

DROP TABLE IF EXISTS `student_subject`;
CREATE TABLE IF NOT EXISTS `student_subject` (
  `UserId` int(11) NOT NULL AUTO_INCREMENT,
  `StudentId` varchar(50) NOT NULL,
  `StSubjects` varchar(50) NOT NULL,
  UNIQUE KEY `UserId` (`UserId`),
  KEY `StudentId` (`StudentId`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_subject`
--

INSERT INTO `student_subject` (`UserId`, `StudentId`, `StSubjects`) VALUES
(1, 'STD-8-001', 'Science|'),
(7, 'STD-10-001', 'Maths|');

-- --------------------------------------------------------

--
-- Table structure for table `student_teacher`
--

DROP TABLE IF EXISTS `student_teacher`;
CREATE TABLE IF NOT EXISTS `student_teacher` (
  `UserId` int(11) NOT NULL AUTO_INCREMENT,
  `StudentId` varchar(50) NOT NULL,
  `LogId` varchar(50) NOT NULL,
  UNIQUE KEY `UserId` (`UserId`),
  KEY `StudentId` (`StudentId`),
  KEY `LogId` (`LogId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
CREATE TABLE IF NOT EXISTS `subject` (
  `UserId` int(11) NOT NULL AUTO_INCREMENT,
  `LogId` varchar(50) NOT NULL,
  `SubjectId` varchar(50) NOT NULL,
  `TeGrade` varchar(50) NOT NULL,
  `TeSubjects` varchar(100) NOT NULL,
  PRIMARY KEY (`SubjectId`),
  UNIQUE KEY `LogId` (`LogId`),
  UNIQUE KEY `UserId` (`UserId`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`UserId`, `LogId`, `SubjectId`, `TeGrade`, `TeSubjects`) VALUES
(1, 'TEA-001', 'TEA-001-SUB-6-9/M', '10 to 11', 'Maths|');

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
CREATE TABLE IF NOT EXISTS `teacher` (
  `UserId` int(15) NOT NULL AUTO_INCREMENT,
  `LogTeacherId` varchar(50) NOT NULL,
  `PaymentID` varchar(50) NOT NULL,
  `AccNo` varchar(30) NOT NULL,
  `TeGrade` varchar(50) NOT NULL,
  `TeSubjects` varchar(100) NOT NULL,
  UNIQUE KEY `UserId` (`UserId`),
  KEY `LogId` (`LogTeacherId`),
  KEY `PaymentID` (`PaymentID`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`UserId`, `LogTeacherId`, `PaymentID`, `AccNo`, `TeGrade`, `TeSubjects`) VALUES
(8, 'TEA-001', 'PAY-TEA-001', '1233456', '10 to 11', 'Maths|');

-- --------------------------------------------------------

--
-- Table structure for table `timetable`
--

DROP TABLE IF EXISTS `timetable`;
CREATE TABLE IF NOT EXISTS `timetable` (
  `HallName` char(10) DEFAULT NULL,
  `ClassDay` char(20) DEFAULT NULL,
  `SubjectCode` char(6) DEFAULT NULL,
  `StartTime` varchar(10) DEFAULT NULL,
  `EndTime` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `timetable`
--

INSERT INTO `timetable` (`HallName`, `ClassDay`, `SubjectCode`, `StartTime`, `EndTime`) VALUES
('A', 'Tuesday', '12sc', '12:00:00', '13:00:00'),
('B', 'Wednesday', '12sc', '13:14:00', '14:00:00'),
('A', 'Wednesday', '12sc', '13:14:00', '14:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `UserId` int(11) NOT NULL AUTO_INCREMENT,
  `FName` varchar(50) NOT NULL,
  `LName` varchar(50) NOT NULL,
  `Gender` char(6) NOT NULL,
  `No` varchar(10) DEFAULT NULL,
  `Street` varchar(50) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `PhoneNo` int(11) NOT NULL DEFAULT '10',
  `NIC` varchar(20) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `LogId` varchar(50) NOT NULL,
  `UserType` varchar(50) NOT NULL,
  PRIMARY KEY (`LogId`),
  UNIQUE KEY `UserId` (`UserId`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserId`, `FName`, `LName`, `Gender`, `No`, `Street`, `City`, `DOB`, `PhoneNo`, `NIC`, `Email`, `LogId`, `UserType`) VALUES
(1, 'Randika', 'Madhushan', 'Male', '230', 'Udadeniya Rd', 'Kegalle', '1995-11-07', 716885362, '953121514v', 'randikamadu1995@gmail.com', 'ADM-001', 'Admin'),
(23, 'Kalitha', 'Dissanayake', 'Male', '12', 'Ambepussa Rd', 'Kegalle', '2019-01-10', 719999999, '959090909v', 'kalitha@gmail.com', 'TEA-001', 'Teacher');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
