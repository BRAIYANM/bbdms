-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 26, 2018 at 11:51 AM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bbdms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `UserName`, `Password`, `updationDate`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '2017-10-18 18:36:05');

-- --------------------------------------------------------

--
-- Table structure for table `tblblooddonars`
--

CREATE TABLE `tblblooddonars` (
  `id` int(11) NOT NULL,
  `FullName` varchar(100) DEFAULT NULL,
  `MobileNumber` char(11) DEFAULT NULL,
  `EmailId` varchar(100) DEFAULT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Gender` varchar(20) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `BloodGroup` varchar(20) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Message` mediumtext,
  `PostingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblblooddonars`
--

INSERT INTO `tblblooddonars` (`id`, `FullName`, `MobileNumber`, `EmailId`, `Username`, `Password`, `Gender`, `Age`, `BloodGroup`, `Address`, `Message`, `PostingDate`, `status`) VALUES
(1, 'john doe', '0701234569', 'john.doe@gmail.com', 'johndoe', 'e10adc3949ba59abbe56e057f20f883e', 'Male', 20, 'AB+', '', ' ', '2017-10-22 14:24:45', 0),
(2, 'Ian Muriithi', '0712345678', 'iano@gmail.com', 'ianoh', 'e10adc3949ba59abbe56e057f20f883e', 'Male', 22, 'O+', 'gg', '   xxxxbbbb', '2017-11-25 15:03:50', 1),
(3, 'Hellenlyn Mwai', '0701234569', 'helllenlyn@gmail.com', 'hellen', 'e10adc3949ba59abbe56e057f20f883e', 'Female', 17, 'O-', '', ' ', '2017-12-08 17:22:22', 1),
(4, 'Karen Karimi', '0701234569', 'karimikaren@gmail.com', 'karenk', 'e10adc3949ba59abbe56e057f20f883e', 'Female', 22, 'A+', 'London 333', ' nothing', '2018-01-02 11:26:06', 1),
(5, 'Emma Stacy', '0734567345', 'emma.stacy@gmail.com', 'emmah', '96e79218965eb72c92a549dd5a330112', 'Female', 22, 'A-', '', ' ', '2018-01-05 18:47:16', 1),
(6, 'Lavington Mutembei', '0711789234', 'lavimtembei@gmail.com', 'lavington', 'e10adc3949ba59abbe56e057f20f883e', 'Male', 10, 'AB-', '', ' ', '2018-01-06 09:58:53', 1),
(7, 'Lavington Mutembei', '0711789234', 'lavimtembei@gmail.com', 'lavington', '11ddbaf3386aea1f2974eee984542152', 'Male', 10, 'AB-', '', ' ', '2018-01-06 11:12:36', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblbloodgroup`
--

CREATE TABLE `tblbloodgroup` (
  `id` int(11) NOT NULL,
  `BloodGroup` varchar(20) DEFAULT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblbloodgroup`
--

INSERT INTO `tblbloodgroup` (`id`, `BloodGroup`, `PostingDate`) VALUES
(1, 'AB+', '2017-10-13 14:18:29'),
(2, 'AB-', '2017-10-13 14:18:36'),
(3, 'B+', '2017-10-13 14:18:52'),
(4, 'B-', '2017-10-13 14:18:58'),
(5, 'A+', '2017-10-13 14:19:12'),
(6, 'A-', '2017-10-13 14:19:19'),
(7, 'O+', '2017-10-13 14:19:26'),
(8, 'O-', '2017-10-13 14:19:31');

-- --------------------------------------------------------

--
-- Table structure for table `tblcomplains`
--

CREATE TABLE `tblcomplains` (
  `id` int(11) NOT NULL,
  `About` varchar(50) NOT NULL,
  `Details` varchar(200) NOT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblcontactusinfo`
--

CREATE TABLE `tblcontactusinfo` (
  `id` int(11) NOT NULL,
  `Address` tinytext,
  `EmailId` varchar(255) DEFAULT NULL,
  `ContactNo` char(21) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcontactusinfo`
--

INSERT INTO `tblcontactusinfo` (`id`, `Address`, `EmailId`, `ContactNo`) VALUES
(1, 'Nairobi, Kenya		\r\nLimuru Rd																						', 'info@bloodbank.com', '+254 711 111 111');

-- --------------------------------------------------------

--
-- Table structure for table `tblcontactusquery`
--

CREATE TABLE `tblcontactusquery` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `EmailId` varchar(120) DEFAULT NULL,
  `ContactNumber` char(11) DEFAULT NULL,
  `Message` longtext,
  `PostingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcontactusquery`
--

INSERT INTO `tblcontactusquery` (`id`, `name`, `EmailId`, `ContactNumber`, `Message`, `PostingDate`, `status`) VALUES
(1, 'Mutunga Evans', 'mutunga.evans@krep.co.ke', '0711222333', 'in need of a blood transfusion for blood group A- at the Kenyatta national hospital, please help.\r\nKind regards,', '2017-10-13 09:58:30', NULL),
(2, 'Hilary Gitari', 'a@d.k', '(+254) 7000', 'b', '2017-10-21 06:06:14', NULL),
(3, 'nobody', 'admin@gmail.com', '(+254) 7000', 'ddd', '2017-12-17 08:47:41', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbldonateblood`
--

CREATE TABLE `tbldonateblood` (
  `id` int(11) NOT NULL,
  `FullName` varchar(50) NOT NULL,
  `EmailID` varchar(50) NOT NULL,
  `BloodGroup` varchar(11) NOT NULL,
  `Amount` varchar(20) NOT NULL,
  `Station` varchar(50) NOT NULL,
  `Officer` varchar(50) NOT NULL,
  `PostinDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbldonateblood`
--

INSERT INTO `tbldonateblood` (`id`, `FullName`, `EmailID`, `BloodGroup`, `Amount`, `Station`, `Officer`, `PostinDate`, `Status`) VALUES
(1, 'Emma Stacy', 'emma.stacy@gmail.com', 'B+', '2000', 'vvv', 'vvvv', '2018-01-06 09:22:01', 'CANCELLED'),
(2, 'Consolata Hamisi', 'hamisi@yahoo.com', 'B+', '2000', 'vvv', 'vvvv', '2018-01-14 08:31:08', 'APPROVED'),
(3, 'Ian Muriithi', 'iano@gmail.com', 'AB+', '2 bags', 'thika level 5', 'Dr. King''ori', '2018-01-14 03:57:01', 'SENT');

-- --------------------------------------------------------

--
-- Table structure for table `tblpages`
--

CREATE TABLE `tblpages` (
  `id` int(11) NOT NULL,
  `PageName` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL DEFAULT '',
  `detail` longtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblpages`
--

INSERT INTO `tblpages` (`id`, `PageName`, `type`, `detail`) VALUES
(2, 'Why Become Donor', 'donor', '										<div>										<span style=''color: rgb(0, 0, 0); font-family: "Open Sans", Arial, sans-serif; font-size: 16px; text-align: justify;''>Blood is the part of life that is given to those who need it by those who have the resource to satisfy the need. The love of fellow human and a desire to share something of oneself is what singles out a blood donor from the others. Emergencies occur every minute. For each patient requiring blood, it is an emergency and the patients could have set back if blood is not available.</span></div><div><span style=''color: rgb(0, 0, 0); font-family: "Open Sans", Arial, sans-serif; font-size: 14px; text-align: justify;''>Your blood donation may be even more special than you realize A single donation from you can help one or more patients. This is possible because whole blood is made up of several useful components. These components perform special functions in your body and in the body of patients who receive your blood.</span></div><div><span style=''color: rgb(0, 0, 0); font-family: "Open Sans", Arial, sans-serif; font-size: 14px; text-align: justify;''>Various blood components are Red Blood Cells, White Blood Cells, Platelets, Plasma and selected Plasma Proteins. Each of these components can be separated from your donated volume of blood and transfused into a specific patient requiring that particular component. Thus, many can benefit from one unit of blood.</span></div><div><span style=''color: rgb(0, 0, 0); font-family: "Open Sans", Arial, sans-serif; font-size: 14px; text-align: justify;''>Someone needs it and you’ve got it why not. All it takes is the ability and the will.<br>Where will it come from when you need it? If we all take up blood donation then we will be confident about its availability in case we or those we care about need it.<br>It helps us live a disciplined lifestyle when we look up to the next time to donate. The sure result will be behavior change and the zeal to live a healthy lifestyle, and live on a healthy diet to ensure full health after </span></div>\n										'),
(3, 'About Us ', 'aboutus', '<span style="color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;">At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat</span>');

-- --------------------------------------------------------

--
-- Table structure for table `tblreciepient`
--

CREATE TABLE `tblreciepient` (
  `id` int(11) NOT NULL,
  `FullName` varchar(100) DEFAULT NULL,
  `MobileNumber` char(11) DEFAULT NULL,
  `EmailId` varchar(100) DEFAULT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Gender` varchar(20) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `BloodGroup` varchar(20) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Message` mediumtext,
  `PostingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblreciepient`
--

INSERT INTO `tblreciepient` (`id`, `FullName`, `MobileNumber`, `EmailId`, `Username`, `Password`, `Gender`, `Age`, `BloodGroup`, `Address`, `Message`, `PostingDate`, `status`) VALUES
(1, 'Hilary Gitari', '0701234569', 'HG12@hotmail.com', 'hilary', '96e79218965eb72c92a549dd5a330112', 'Male', 20, 'AB+', 'cc', '  bbb', '2018-01-04 10:18:40', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblrequetblood`
--

CREATE TABLE `tblrequetblood` (
  `id` int(11) NOT NULL,
  `FullName` varchar(50) NOT NULL,
  `EmailID` varchar(50) NOT NULL,
  `BloodGroup` varchar(11) NOT NULL,
  `Mobile` int(11) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Details` varchar(100) NOT NULL,
  `PostinDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblrequetblood`
--

INSERT INTO `tblrequetblood` (`id`, `FullName`, `EmailID`, `BloodGroup`, `Mobile`, `Address`, `Details`, `PostinDate`, `Status`) VALUES
(1, 'Consolata Hamisi', 'emma.stacy@gmail.com', 'B+', 5555, 'vv', 'vv', '2018-01-05 11:15:52', 'APPROVED'),
(2, 'Hilary Gitari', 'HG12@hotmail.com', 'B+', 5555, 'fff', 'fff', '2018-01-05 21:37:23', 'SENT');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblblooddonars`
--
ALTER TABLE `tblblooddonars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblbloodgroup`
--
ALTER TABLE `tblbloodgroup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcomplains`
--
ALTER TABLE `tblcomplains`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcontactusinfo`
--
ALTER TABLE `tblcontactusinfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcontactusquery`
--
ALTER TABLE `tblcontactusquery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbldonateblood`
--
ALTER TABLE `tbldonateblood`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblpages`
--
ALTER TABLE `tblpages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblreciepient`
--
ALTER TABLE `tblreciepient`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblrequetblood`
--
ALTER TABLE `tblrequetblood`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tblblooddonars`
--
ALTER TABLE `tblblooddonars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tblbloodgroup`
--
ALTER TABLE `tblbloodgroup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tblcomplains`
--
ALTER TABLE `tblcomplains`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tblcontactusinfo`
--
ALTER TABLE `tblcontactusinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tblcontactusquery`
--
ALTER TABLE `tblcontactusquery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tbldonateblood`
--
ALTER TABLE `tbldonateblood`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tblpages`
--
ALTER TABLE `tblpages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `tblreciepient`
--
ALTER TABLE `tblreciepient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tblrequetblood`
--
ALTER TABLE `tblrequetblood`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
