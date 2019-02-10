-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 10, 2019 at 05:21 PM
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
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`UserId`, `LogAdminId`, `AccNo`, `PaymentID`) VALUES
(13, 'ADM-001', '8976767', 'PAY-ADM-001');

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
  `FName` varchar(30) DEFAULT NULL,
  `LName` varchar(30) DEFAULT NULL,
  `Gender` varchar(30) DEFAULT NULL,
  `No` varchar(30) DEFAULT NULL,
  `Street` varchar(30) DEFAULT NULL,
  `City` varchar(30) DEFAULT NULL,
  `DOB` varchar(30) DEFAULT NULL,
  `PhoneNo` varchar(30) DEFAULT NULL,
  `NIC` varchar(30) DEFAULT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `PaymentID` varchar(30) DEFAULT NULL,
  `AccNo` varchar(30) DEFAULT NULL,
  `LogAdminId` varchar(30) DEFAULT NULL,
  UNIQUE KEY `UserId` (`UserId`),
  KEY `LogId` (`LogClerkId`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clerk`
--

INSERT INTO `clerk` (`UserId`, `LogClerkId`, `FName`, `LName`, `Gender`, `No`, `Street`, `City`, `DOB`, `PhoneNo`, `NIC`, `Email`, `PaymentID`, `AccNo`, `LogAdminId`) VALUES
(6, 'CLK-001', 'Himal', 'Deshaproya', 'Male', '22', 'Pussella Rd', 'Kegalle', '2019-02-07', '0716806080', '958778987v', 'himal@gmail.com', 'PAY-CLK-001', '8976776', 'ADM-001');

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fees`
--

INSERT INTO `fees` (`UserId`, `StudentId`, `StGrade`, `StSubjects`, `Amount`, `PayDate`) VALUES
(3, 'STD-10-001', '10', 'maths', '1000.00', '2019-02-05');

-- --------------------------------------------------------

--
-- Table structure for table `labour`
--

DROP TABLE IF EXISTS `labour`;
CREATE TABLE IF NOT EXISTS `labour` (
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
  `AccNo` varchar(30) DEFAULT NULL,
  `PaymentID` varchar(30) DEFAULT NULL,
  `Occupation` varchar(30) DEFAULT NULL,
  `LogClerkId` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`LabourId`),
  KEY `PaymentID` (`PaymentID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `labour`
--

INSERT INTO `labour` (`LabourId`, `FName`, `LName`, `Gender`, `No`, `Street`, `City`, `DOB`, `PhoneNo`, `NIC`, `AccNo`, `PaymentID`, `Occupation`, `LogClerkId`) VALUES
('LBR-001', 'Anuradha', 'Ranapana', 'Male', '44', 'Bulugahadeniya Rd', 'Kegalle', '2019-02-14', 726786545, '957678765v', '12344', 'PAY-LBR-001', 'Card Marker', 'CLK-001');

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
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`UserId`, `LogId`, `Password`, `Activated`) VALUES
(21, 'TEA-001', 'janaka', '1'),
(20, 'CLK-001', 'cccccc', '1'),
(18, 'ADM-001', 'randika', '1');

-- --------------------------------------------------------

--
-- Table structure for table `parent`
--

DROP TABLE IF EXISTS `parent`;
CREATE TABLE IF NOT EXISTS `parent` (
  `UserId` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(30) DEFAULT NULL,
  `StudentsID` varchar(30) NOT NULL,
  `ptelNo` varchar(30) DEFAULT NULL,
  UNIQUE KEY `UserId` (`UserId`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `parent`
--

INSERT INTO `parent` (`UserId`, `pname`, `StudentsID`, `ptelNo`) VALUES
(24, 'eeweqwe', 'STD-10-001', '32322');

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
  `Grade` varchar(50) DEFAULT NULL,
  `LogClerkId` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`StudentId`),
  UNIQUE KEY `UserId` (`UserId`),
  UNIQUE KEY `PhoneNo` (`PhoneNo`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`UserId`, `StudentId`, `FName`, `LName`, `Gender`, `No`, `Street`, `City`, `DOB`, `PhoneNo`, `NIC`, `Email`, `Grade`, `LogClerkId`) VALUES
(6, 'STD-10-001', 'Rusiru', 'Nawagamuwa', 'Male', '56', 'Udaha rd', 'Kefalle', '2019-02-08', 98675434, '9876545', 'rusiru@gmail.com', '10', 'CLK-001');

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

-- --------------------------------------------------------

--
-- Table structure for table `student_subject`
--

DROP TABLE IF EXISTS `student_subject`;
CREATE TABLE IF NOT EXISTS `student_subject` (
  `UserId` int(11) NOT NULL AUTO_INCREMENT,
  `StudentId` varchar(50) NOT NULL,
  `6_science` varchar(30) DEFAULT NULL,
  `6_maths` varchar(30) DEFAULT NULL,
  `6_english` varchar(30) DEFAULT NULL,
  `7_science` varchar(30) DEFAULT NULL,
  `7_maths` varchar(30) DEFAULT NULL,
  `7_english` varchar(30) DEFAULT NULL,
  `8_science` varchar(30) DEFAULT NULL,
  `8_maths` varchar(30) DEFAULT NULL,
  `8_english` varchar(30) DEFAULT NULL,
  `9_science` varchar(30) DEFAULT NULL,
  `9_maths` varchar(30) DEFAULT NULL,
  `9_english` varchar(30) DEFAULT NULL,
  `10_science` varchar(30) DEFAULT NULL,
  `10_maths` varchar(30) DEFAULT NULL,
  `10_english` varchar(30) DEFAULT NULL,
  `11_science` varchar(30) DEFAULT NULL,
  `11_maths` varchar(30) DEFAULT NULL,
  `11_english` varchar(30) DEFAULT NULL,
  `12_commaths` varchar(30) DEFAULT NULL,
  `12_biology` varchar(30) DEFAULT NULL,
  `12_chemistry` varchar(30) DEFAULT NULL,
  `12_physics` varchar(30) DEFAULT NULL,
  `12_sinhala` varchar(30) DEFAULT NULL,
  `12_history` varchar(30) DEFAULT NULL,
  `12_logic` varchar(30) DEFAULT NULL,
  `12_accounting` varchar(30) DEFAULT NULL,
  `12_econ` varchar(30) DEFAULT NULL,
  `12_commerce` varchar(30) DEFAULT NULL,
  `13_commaths` varchar(30) DEFAULT NULL,
  `13_biology` varchar(30) DEFAULT NULL,
  `13_chemistry` varchar(30) DEFAULT NULL,
  `13_physics` varchar(30) DEFAULT NULL,
  `13_sinhala` varchar(30) DEFAULT NULL,
  `13_history` varchar(30) DEFAULT NULL,
  `13_logic` varchar(30) DEFAULT NULL,
  `13_accounting` varchar(30) DEFAULT NULL,
  `13_econ` varchar(30) DEFAULT NULL,
  `13_commerce` varchar(30) DEFAULT NULL,
  `rev_commaths` varchar(30) DEFAULT NULL,
  `rev_biology` varchar(30) DEFAULT NULL,
  `rev_chemistry` varchar(30) DEFAULT NULL,
  `rev_physics` varchar(30) DEFAULT NULL,
  UNIQUE KEY `UserId` (`UserId`),
  KEY `StudentId` (`StudentId`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_subject`
--

INSERT INTO `student_subject` (`UserId`, `StudentId`, `6_science`, `6_maths`, `6_english`, `7_science`, `7_maths`, `7_english`, `8_science`, `8_maths`, `8_english`, `9_science`, `9_maths`, `9_english`, `10_science`, `10_maths`, `10_english`, `11_science`, `11_maths`, `11_english`, `12_commaths`, `12_biology`, `12_chemistry`, `12_physics`, `12_sinhala`, `12_history`, `12_logic`, `12_accounting`, `12_econ`, `12_commerce`, `13_commaths`, `13_biology`, `13_chemistry`, `13_physics`, `13_sinhala`, `13_history`, `13_logic`, `13_accounting`, `13_econ`, `13_commerce`, `rev_commaths`, `rev_biology`, `rev_chemistry`, `rev_physics`) VALUES
(13, 'STD-10-001', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', '1', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null');

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

-- --------------------------------------------------------

--
-- Table structure for table `subject_teacher`
--

DROP TABLE IF EXISTS `subject_teacher`;
CREATE TABLE IF NOT EXISTS `subject_teacher` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `Maths` varchar(30) DEFAULT NULL,
  `Science` varchar(30) DEFAULT NULL,
  `English` varchar(30) DEFAULT NULL,
  `Combine_Maths` varchar(30) DEFAULT NULL,
  `Biology` varchar(30) DEFAULT NULL,
  `Chemistry` varchar(30) DEFAULT NULL,
  `Physics` varchar(30) DEFAULT NULL,
  `Sinhala` varchar(30) DEFAULT NULL,
  `Logic` varchar(30) DEFAULT NULL,
  `History` varchar(30) DEFAULT NULL,
  `Accounting` varchar(30) DEFAULT NULL,
  `Econ` varchar(30) DEFAULT NULL,
  `Commerce` varchar(30) DEFAULT NULL,
  `Combine_Maths_rev` varchar(30) DEFAULT NULL,
  `Biology_rev` varchar(30) DEFAULT NULL,
  `Chemistry_rev` varchar(30) DEFAULT NULL,
  `Physics_rev` varchar(30) DEFAULT NULL,
  `LogTeacherId` varchar(30) DEFAULT NULL,
  UNIQUE KEY `UserID` (`UserID`),
  UNIQUE KEY `LogTeacherId` (`LogTeacherId`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subject_teacher`
--

INSERT INTO `subject_teacher` (`UserID`, `Maths`, `Science`, `English`, `Combine_Maths`, `Biology`, `Chemistry`, `Physics`, `Sinhala`, `Logic`, `History`, `Accounting`, `Econ`, `Commerce`, `Combine_Maths_rev`, `Biology_rev`, `Chemistry_rev`, `Physics_rev`, `LogTeacherId`) VALUES
(1, '1', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'TEA-001');

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
CREATE TABLE IF NOT EXISTS `teacher` (
  `UserId` int(15) NOT NULL AUTO_INCREMENT,
  `LogTeacherId` varchar(50) NOT NULL,
  `FName` varchar(50) NOT NULL,
  `LName` varchar(50) NOT NULL,
  `Gender` varchar(6) NOT NULL,
  `No` varchar(50) NOT NULL,
  `Street` varchar(50) NOT NULL,
  `City` varchar(50) NOT NULL,
  `DOB` date NOT NULL,
  `PhoneNo` int(10) NOT NULL,
  `Grade` varchar(50) NOT NULL,
  `NIC` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `AccNo` varchar(30) NOT NULL,
  `PaymentID` varchar(50) NOT NULL,
  `LogClerkId` varchar(50) NOT NULL,
  UNIQUE KEY `UserId` (`UserId`),
  KEY `LogId` (`LogTeacherId`),
  KEY `PaymentID` (`PaymentID`),
  KEY `LogClerkId` (`LogClerkId`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`UserId`, `LogTeacherId`, `FName`, `LName`, `Gender`, `No`, `Street`, `City`, `DOB`, `PhoneNo`, `Grade`, `NIC`, `Email`, `AccNo`, `PaymentID`, `LogClerkId`) VALUES
(11, 'TEA-001', 'Janaka', 'Nishantha', 'Male', '33', 'Welikada rd', 'Makevita', '2019-02-06', 716787865, '6-11', '7898786544v', 'kamal@gmail.com', '6787876', 'PAY-TEA-001', 'CLK-001');

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
  PRIMARY KEY (`LogId`),
  UNIQUE KEY `UserId` (`UserId`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserId`, `FName`, `LName`, `Gender`, `No`, `Street`, `City`, `DOB`, `PhoneNo`, `NIC`, `Email`, `LogId`) VALUES
(44, 'Janaka', 'Nishantha', 'Male', '33', 'Welikada rd', 'Makevita', '2019-02-06', 716787865, '7898786544v', 'kamal@gmail.com', 'TEA-001'),
(43, 'Himal', 'Deshaproya', 'Male', '22', 'Pussella Rd', 'Kegalle', '2019-02-07', 716806080, '958778987v', 'himal@gmail.com', 'CLK-001'),
(42, 'Randika', 'Madhushan', 'Male', '230', 'Udadeniya Rd', 'Kegalle', '2019-02-07', 763694098, '963121514v', 'randika@gmail.com', 'ADM-001');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
