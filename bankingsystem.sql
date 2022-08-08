-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 17, 2022 at 09:37 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bankingsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `fname` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `panNo` varchar(30) NOT NULL,
  `aadharNo` varchar(30) NOT NULL,
  `address` varchar(30) NOT NULL,
  `accountNo` int(30) NOT NULL,
  `ammount` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`id`, `name`, `fname`, `email`, `panNo`, `aadharNo`, `address`, `accountNo`, `ammount`) VALUES
(15, 'Mangal Jain', 'JK Jain', 'mangalj83.mj@gmail.com', '53dfgd', '54545454646', 'Sudama Nagar Indore', 166, 9000),
(16, 'Abhishek Jain', 'JK Jain', 'abhishekjain643@gmail.com', 'fh775', '54545454646', 'Deep Bhavan, Sec 22', 643, 9900),
(20, 'Dheeraj Jain', 'SK Jain', 'dheeraj@gmail.com', '53dfgd', '1656516', 'Deep Bhavan', 555, 15000);

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `id` int(11) NOT NULL,
  `accountNo` int(30) NOT NULL,
  `ammount` int(30) NOT NULL,
  `type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`id`, `accountNo`, `ammount`, `type`) VALUES
(55, 166, 5000, 'Credit'),
(56, 643, 10000, 'Credit'),
(57, 166, 100, 'Credit'),
(58, 166, 1000, 'Debit'),
(59, 643, 100, 'Debit'),
(61, 123, 4466, 'Credit'),
(62, 1235, 5000, 'Credit'),
(63, 555, 20000, 'Credit'),
(64, 555, 5000, 'Credit'),
(65, 555, 10000, 'Debit'),
(66, 166, 5000, 'Credit'),
(67, 166, 100, 'Debit');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`) VALUES
(1, 'Abhishek Jain', 'abhishekjain643@gmail.com', 1234),
(5, 'Mangal Jain', 'mangalj83.mj@gmail.com', 166);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
