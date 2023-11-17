-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 17, 2023 at 02:41 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `scd`
--

-- --------------------------------------------------------

--
-- Table structure for table `ecg`
--

CREATE TABLE `ecg` (
  `ecg_id` int(11) NOT NULL,
  `ecgValue` int(11) NOT NULL,
  `patientId` int(11) NOT NULL,
  `bpmValue` int(11) NOT NULL,
  `createdAt` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hospital`
--

CREATE TABLE `hospital` (
  `hospitalId` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `phone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `medicines`
--

CREATE TABLE `medicines` (
  `medicineId` int(11) NOT NULL,
  `patientId` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `frequency` int(11) NOT NULL,
  `time` varchar(100) NOT NULL,
  `additionalInfo` text NOT NULL,
  `createdAt` date NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `isDeleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medicines`
--

INSERT INTO `medicines` (`medicineId`, `patientId`, `image`, `name`, `frequency`, `time`, `additionalInfo`, `createdAt`, `updatedAt`, `isDeleted`) VALUES
(2, 20, 'test.jpg', 'test medicine', 2, '2 Aug 2023', '', '2023-11-16', '2023-11-16 16:15:49', 0),
(4, 20, 'test.jpg', 'test medicine 3', 3, '3 Aug 2023', '', '2023-11-17', '2023-11-17 08:03:00', 0),
(6, 20, 'test.jpg', 'test medicine 2', 3, '3 Aug 2023', '', '2023-11-17', '2023-11-17 13:31:31', 0);

-- --------------------------------------------------------

--
-- Table structure for table `model_inference_logs`
--

CREATE TABLE `model_inference_logs` (
  `inference_id` int(11) NOT NULL,
  `inference_status` int(11) NOT NULL,
  `message` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `model_results`
--

CREATE TABLE `model_results` (
  `record_id` int(11) NOT NULL,
  `patientId` int(11) NOT NULL,
  `feature_store` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`feature_store`)),
  `model_id` int(11) NOT NULL,
  `model_prediction` int(11) NOT NULL,
  `exc_time_sec` float NOT NULL,
  `data_snapshot_dt` date NOT NULL,
  `prc_dt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `model_training_logs`
--

CREATE TABLE `model_training_logs` (
  `model_id` int(11) NOT NULL,
  `model_name` varchar(100) NOT NULL,
  `model_version` varchar(50) NOT NULL,
  `cloud_storage_uri` varchar(300) NOT NULL,
  `metrics_train` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`metrics_train`)),
  `metrics_valid` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`metrics_valid`)),
  `device_type` varchar(3) NOT NULL,
  `device_name` varchar(100) NOT NULL,
  `device_count` int(11) NOT NULL,
  `exc_time_sec` float NOT NULL,
  `data_snapshot_dt` date NOT NULL,
  `prc_dt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `patientID` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `pin` varchar(10) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `cholesterollevel` varchar(100) DEFAULT NULL,
  `isSmoker` tinyint(1) DEFAULT NULL,
  `isHavingHypertension` tinyint(1) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `isDeleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`patientID`, `email`, `password`, `pin`, `gender`, `cholesterollevel`, `isSmoker`, `isHavingHypertension`, `createdAt`, `updatedAt`, `isDeleted`) VALUES
(18, 'none@nomail.com', '$2b$12$3Z4DDHJG.4kBIgsdQOs/2.e48XHtEWMFB00kgd7wsQq0RHKGfKeba', '123456', 'Female', 'High', 1, 1, '2023-11-12 05:21:30', '2023-11-12 15:57:22', 0),
(19, 'hello@nomail.com', '$2b$12$6z1nSeORm8.drnkKULJ51eHm9ytA8ZPqmQZq2rnvwaYRpkWsM95k2', NULL, NULL, NULL, NULL, NULL, '2023-11-12 06:14:21', '2023-11-12 06:14:21', 0),
(20, 'hello1@nomail.com', '$2b$12$Yud9NvKLDCH20na6wCKm7u8gsycpGmTTE7Y.jX/d9XczuIg1CR5LW', '123456', 'Female', 'High', 1, 1, '2023-11-12 06:14:57', '2023-11-17 06:40:42', 0),
(21, 'hello2@nomail.com', '$2b$12$MHfELxOqri4wRI4s/g5w1O1upAyzvWPAqTTJjmKueA13pUW9LtgPu', NULL, NULL, NULL, NULL, NULL, '2023-11-12 15:20:13', '2023-11-12 15:20:13', 0),
(22, 'hello3@nomail.com', '$2b$12$fQh4p2w3Em.r1FVvc/3JTuoKtkfYaIbRYERlfm4AY9rUHCOYY8cie', NULL, NULL, NULL, NULL, NULL, '2023-11-12 15:24:53', '2023-11-12 15:24:53', 0),
(23, 'hello4@nomail.com', '$2b$12$3TOhlsJudavQmIaRNhwjGOKPS9kLsSxD0r7oZOH.0OdSeiTl4l9WS', NULL, NULL, NULL, NULL, NULL, '2023-11-14 18:30:55', '2023-11-14 18:30:55', 0),
(25, 'hello5@nomail.com', '$2b$12$sQEpgOcJ.u9CdDX4CPGeB.Mr05FbiGzy7bsqeP7EdJfVGE.FtRRxu', NULL, NULL, NULL, NULL, NULL, '2023-11-14 18:41:59', '2023-11-14 18:41:59', 0),
(28, 'hello6@nomail.com', '$2b$12$5pJf8zFyLN6NzLVdCS1Yv.sAwlHMEuVlvIjTdNmDc43azHp41pbFW', NULL, NULL, NULL, NULL, NULL, '2023-11-17 04:22:14', '2023-11-17 04:22:14', 0),
(29, 'hello7@nomail.com', '$2b$12$cKja0aAX431UlH0wB.bFz.A4e3Uf/2BEWIe8bmiqjs4p6qNLM2gWO', NULL, NULL, NULL, NULL, NULL, '2023-11-17 06:03:40', '2023-11-17 06:03:40', 0),
(30, 'hello8@nomail.com', '$2b$12$hB4Wuj.EMI1n.I44QLFrY.BYScmSaiOfd.85P0.qntrRsqGDjXi1y', NULL, NULL, NULL, NULL, NULL, '2023-11-17 06:23:55', '2023-11-17 06:23:55', 0),
(31, 'hello9@nomail.com', '$2b$12$X6aR3kIPjmcq0lVer70YOeGbNXxXg5EpvSe5nlFQDQseOXk4hbiOS', '123456', NULL, NULL, NULL, NULL, '2023-11-17 12:44:22', '2023-11-17 13:05:55', 0);

-- --------------------------------------------------------

--
-- Table structure for table `record_details`
--

CREATE TABLE `record_details` (
  `record_id` int(11) NOT NULL,
  `data_snapshot_dt` date NOT NULL,
  `prc_dt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ecg`
--
ALTER TABLE `ecg`
  ADD PRIMARY KEY (`ecg_id`),
  ADD KEY `patientId` (`patientId`);

--
-- Indexes for table `hospital`
--
ALTER TABLE `hospital`
  ADD PRIMARY KEY (`hospitalId`);

--
-- Indexes for table `medicines`
--
ALTER TABLE `medicines`
  ADD PRIMARY KEY (`medicineId`),
  ADD KEY `patientId` (`patientId`);

--
-- Indexes for table `model_inference_logs`
--
ALTER TABLE `model_inference_logs`
  ADD PRIMARY KEY (`inference_id`);

--
-- Indexes for table `model_results`
--
ALTER TABLE `model_results`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `patientId` (`patientId`);

--
-- Indexes for table `model_training_logs`
--
ALTER TABLE `model_training_logs`
  ADD PRIMARY KEY (`model_id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`patientID`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `record_details`
--
ALTER TABLE `record_details`
  ADD KEY `record_id` (`record_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ecg`
--
ALTER TABLE `ecg`
  MODIFY `ecg_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hospital`
--
ALTER TABLE `hospital`
  MODIFY `hospitalId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medicines`
--
ALTER TABLE `medicines`
  MODIFY `medicineId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `model_inference_logs`
--
ALTER TABLE `model_inference_logs`
  MODIFY `inference_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `model_results`
--
ALTER TABLE `model_results`
  MODIFY `record_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `model_training_logs`
--
ALTER TABLE `model_training_logs`
  MODIFY `model_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `patientID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ecg`
--
ALTER TABLE `ecg`
  ADD CONSTRAINT `ecg_ibfk_1` FOREIGN KEY (`patientId`) REFERENCES `patients` (`patientID`);

--
-- Constraints for table `medicines`
--
ALTER TABLE `medicines`
  ADD CONSTRAINT `patientId` FOREIGN KEY (`patientId`) REFERENCES `patients` (`patientID`);

--
-- Constraints for table `model_results`
--
ALTER TABLE `model_results`
  ADD CONSTRAINT `model_results_ibfk_1` FOREIGN KEY (`patientId`) REFERENCES `patients` (`patientID`);

--
-- Constraints for table `record_details`
--
ALTER TABLE `record_details`
  ADD CONSTRAINT `record_details_ibfk_1` FOREIGN KEY (`record_id`) REFERENCES `model_results` (`record_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
