-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 11, 2022 at 04:57 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `housekeeping`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(12) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `hostel` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `username`, `password`, `hostel`) VALUES
(1, 'admin', '123456', '1'),
(2, 'piyush', '0', '2');

-- --------------------------------------------------------

--
-- Table structure for table `cleanrequest`
--

CREATE TABLE `cleanrequest` (
  `request_id` int(12) NOT NULL,
  `rollnumber` int(12) NOT NULL,
  `worker_id` int(12) NOT NULL,
  `date` date NOT NULL,
  `cleaningtime` int(11) NOT NULL,
  `req_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `complaint_id` int(12) NOT NULL,
  `feedback_id` int(12) NOT NULL,
  `rollnumber` int(12) NOT NULL,
  `complaint` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedback_id` int(12) NOT NULL,
  `rollnumber` int(12) NOT NULL,
  `request_id` int(12) NOT NULL,
  `rating` tinyint(2) NOT NULL,
  `timein` time NOT NULL,
  `timeout` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `housekeeper`
--

CREATE TABLE `housekeeper` (
  `worker_id` int(12) NOT NULL,
  `name` varchar(30) NOT NULL,
  `hostel` varchar(5) NOT NULL,
  `floor` tinyint(4) NOT NULL,
  `rooms_cleaned` int(5) NOT NULL,
  `complaints` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `rollnumber` varchar(255) NOT NULL,
  `password` varchar(40) NOT NULL,
  `room` varchar(8) NOT NULL,
  `floor` tinyint(4) NOT NULL,
  `hostel` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `rollnumber`, `password`, `room`, `floor`, `hostel`) VALUES
(1, '13', '12345', '2112', 1, 'UG2'),
(2, '1', '12345', '15', 1, 'C/15 ');

-- --------------------------------------------------------

--
-- Table structure for table `suggestions`
--

CREATE TABLE `suggestions` (
  `suggestion_id` int(12) NOT NULL,
  `feedback_id` int(12) NOT NULL,
  `rollnumber` int(12) NOT NULL,
  `suggestion` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `cleanrequest`
--
ALTER TABLE `cleanrequest`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `rollnumber` (`rollnumber`),
  ADD KEY `worker_id` (`worker_id`);

--
-- Indexes for table `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`complaint_id`),
  ADD KEY `feedback_id` (`feedback_id`),
  ADD KEY `rollnumber` (`rollnumber`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedback_id`),
  ADD KEY `rollnumber` (`rollnumber`),
  ADD KEY `request_id` (`request_id`);

--
-- Indexes for table `housekeeper`
--
ALTER TABLE `housekeeper`
  ADD PRIMARY KEY (`worker_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suggestions`
--
ALTER TABLE `suggestions`
  ADD PRIMARY KEY (`suggestion_id`),
  ADD KEY `feedback_id` (`feedback_id`),
  ADD KEY `rollnumber` (`rollnumber`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cleanrequest`
--
ALTER TABLE `cleanrequest`
  ADD CONSTRAINT `cleanrequest_ibfk_1` FOREIGN KEY (`rollnumber`) REFERENCES `student` (`rollnumber`),
  ADD CONSTRAINT `cleanrequest_ibfk_2` FOREIGN KEY (`worker_id`) REFERENCES `housekeeper` (`worker_id`);

--
-- Constraints for table `complaints`
--
ALTER TABLE `complaints`
  ADD CONSTRAINT `complaints_ibfk_1` FOREIGN KEY (`feedback_id`) REFERENCES `feedback` (`feedback_id`),
  ADD CONSTRAINT `complaints_ibfk_2` FOREIGN KEY (`rollnumber`) REFERENCES `student` (`rollnumber`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`rollnumber`) REFERENCES `student` (`rollnumber`),
  ADD CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`request_id`) REFERENCES `cleanrequest` (`request_id`);

--
-- Constraints for table `suggestions`
--
ALTER TABLE `suggestions`
  ADD CONSTRAINT `suggestions_ibfk_1` FOREIGN KEY (`feedback_id`) REFERENCES `feedback` (`feedback_id`),
  ADD CONSTRAINT `suggestions_ibfk_2` FOREIGN KEY (`rollnumber`) REFERENCES `student` (`rollnumber`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
