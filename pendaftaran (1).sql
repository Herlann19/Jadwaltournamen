-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 29, 2023 at 05:34 AM
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
-- Database: `pendaftaran`
--

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `teams_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`id`, `name`, `role`, `teams_id`) VALUES
(1, 'MUHAMMAD KASYAF ANUGRAH', 'SUPPORT', 12),
(2, 'MUHAMMAD RAYYIS', 'RUSHER', 12),
(3, 'DESTA JULPAESAL', 'RUSHER', 12),
(4, 'DEVANDRA APRILIAN', 'SUPPORT', 12),
(5, 'FARIDZ HENDRAWAN', 'LEADER', 12),
(6, 'HERLAN', 'RUSHER', 14);

-- --------------------------------------------------------

--
-- Table structure for table `registrasi`
--

CREATE TABLE `registrasi` (
  `id` int(11) NOT NULL,
  `Teams_id` int(10) NOT NULL,
  `Captain_Name_Email` varchar(100) DEFAULT NULL,
  `player1_Name` varchar(100) NOT NULL,
  `player2_Name` varchar(100) NOT NULL,
  `player3_Name` varchar(100) NOT NULL,
  `player4_Name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `registrasi`
--

INSERT INTO `registrasi` (`id`, `Teams_id`, `Captain_Name_Email`, `player1_Name`, `player2_Name`, `player3_Name`, `player4_Name`, `created_at`) VALUES
(1, 12, 'kasyafgaming@gmail.com', 'Ariq', 'Aflah', 'Desta', 'Kasap', '2023-08-01 04:59:55'),
(2, 12, 'MuhammadRayyis@gmail.com', 'Faridz', 'Herlan', 'Rayyis', 'Devan', '2023-08-02 04:59:55'),
(3, 12, 'Yusup01@gmail.com', 'Yusup', 'Aprilian', 'Anugrah', 'Febrian', '2023-08-28 02:05:00'),
(4, 12, 'SHALMAN01@gmail.com', 'Shalman', 'Alpha', 'Ardi', 'Julpa', '2023-08-28 02:05:00'),
(5, 12, 'Linar02@gmail.com', 'Linar', 'April', 'Anto', 'Asep', '2023-08-28 02:07:50');

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `Teams_id` int(11) NOT NULL,
  `captain_name_Email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `name`, `created_at`, `Teams_id`, `captain_name_Email`) VALUES
(1, 'Muhammad kasyaf', '2023-08-23 04:17:49', 12, 'Rayyis01@gmail.com'),
(2, 'Muhammad Rayyis', '2023-08-24 04:18:45', 12, 'Rayyis01@gmail.com'),
(3, 'Desta Julpaesal', '2023-08-28 01:56:06', 12, 'Rayyis01@gmail.com'),
(4, 'Devandra Aprilian', '2023-08-28 01:57:18', 12, 'Rayyis01@gmail.com'),
(5, 'Faridz Hendrawan', '2023-08-28 01:57:18', 12, 'Rayyis01@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `tournament`
--

CREATE TABLE `tournament` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `location` varchar(50) NOT NULL,
  `prizee_pool` int(10) NOT NULL,
  `Teams_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tournament`
--

INSERT INTO `tournament` (`id`, `name`, `start_date`, `end_date`, `location`, `prizee_pool`, `Teams_id`) VALUES
(1, 'GEFAM', '2023-08-02', '2023-08-09', 'KP CIRAWA', 2000000000, 12),
(2, 'EVOS', '2023-08-02', '2023-08-09', 'KP CITATAH', 2000000000, 13),
(3, 'RRQ', '2023-08-23', '2023-08-31', 'KP CIDADAP', 2000000000, 14),
(4, 'FIRST', '2023-08-28', '2023-08-31', 'KP CIBURIAL', 2000000000, 15),
(5, 'DEWA', '2023-08-28', '2023-08-31', 'KP POJOK', 2100000000, 16);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `registrasi`
--
ALTER TABLE `registrasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`,`Teams_id`);

--
-- Indexes for table `tournament`
--
ALTER TABLE `tournament`
  ADD PRIMARY KEY (`id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `registrasi`
--
ALTER TABLE `registrasi`
  ADD CONSTRAINT `registrasi_ibfk_1` FOREIGN KEY (`id`) REFERENCES `teams` (`id`);

--
-- Constraints for table `teams`
--
ALTER TABLE `teams`
  ADD CONSTRAINT `teams_ibfk_1` FOREIGN KEY (`id`) REFERENCES `players` (`id`);

--
-- Constraints for table `tournament`
--
ALTER TABLE `tournament`
  ADD CONSTRAINT `tournament_ibfk_1` FOREIGN KEY (`id`) REFERENCES `registrasi` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
