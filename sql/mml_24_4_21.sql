-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 24, 2021 at 06:06 AM
-- Server version: 8.0.23
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mml`
--

-- --------------------------------------------------------

--
-- Table structure for table `carousel_data`
--

DROP TABLE IF EXISTS `carousel_data`;
CREATE TABLE IF NOT EXISTS `carousel_data` (
  `id` int NOT NULL,
  `content_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `friends`
--

DROP TABLE IF EXISTS `friends`;
CREATE TABLE IF NOT EXISTS `friends` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `friend_id` int NOT NULL,
  `approved` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
CREATE TABLE IF NOT EXISTS `rating` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `content_id` int NOT NULL,
  `content_type` tinyint(1) NOT NULL,
  `rating` int NOT NULL,
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
CREATE TABLE IF NOT EXISTS `review` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `content_id` int NOT NULL,
  `content_type` tinyint(1) NOT NULL,
  `review_heading` varchar(200) NOT NULL,
  `review_content` varchar(10000) NOT NULL,
  `review_up` int NOT NULL DEFAULT '0',
  `review_down` int NOT NULL DEFAULT '0',
  `review_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `review_rating` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`id`, `user_id`, `content_id`, `content_type`, `review_heading`, `review_content`, `review_up`, `review_down`, `review_date`, `review_rating`) VALUES
(1, 4, 615457, 1, 'Quite good, must say', 'gonna give this one a solid 4.5', 1, 0, '2021-04-23 02:14:24', 4.5),
(2, 4, 615457, 1, 'Test 3', 'hey', 0, 1, '2021-04-23 03:30:16', 0),
(3, 4, 460465, 1, '0.5', '1', 0, 0, '2021-04-24 02:06:24', 0.5),
(4, 4, 460465, 1, '1', '1', 0, 0, '2021-04-24 02:06:35', 1),
(5, 4, 460465, 1, '1.5', '1', 0, 0, '2021-04-24 02:06:42', 1.5),
(6, 4, 460465, 1, '2', '1', 0, 0, '2021-04-24 02:06:46', 2),
(7, 4, 460465, 1, '2.5', '1', 0, 0, '2021-04-24 02:06:54', 2.5),
(8, 4, 460465, 1, '3', '1', 0, 0, '2021-04-24 02:06:59', 3),
(9, 4, 460465, 1, '3.5', '1', 0, 0, '2021-04-24 02:07:05', 3.5),
(10, 4, 460465, 1, '4', '1', 0, 0, '2021-04-24 02:07:10', 4),
(11, 4, 460465, 1, '4.5', '1', 0, 0, '2021-04-24 02:07:17', 4.5),
(12, 4, 460465, 1, '5', '1', 0, 0, '2021-04-24 02:07:21', 5),
(13, 3, 460465, 1, 'Yo Sukhi here', 'Test', 0, 0, '2021-04-24 02:22:47', 3.5);

-- --------------------------------------------------------

--
-- Table structure for table `review_likes`
--

DROP TABLE IF EXISTS `review_likes`;
CREATE TABLE IF NOT EXISTS `review_likes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `review_id` int NOT NULL,
  `user_id` int NOT NULL,
  `liked` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `review_id` (`review_id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `review_likes`
--

INSERT INTO `review_likes` (`id`, `review_id`, `user_id`, `liked`) VALUES
(70, 1, 4, 1),
(71, 2, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
CREATE TABLE IF NOT EXISTS `status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `content_id` int NOT NULL,
  `content_type` tinyint(1) NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id`, `user_id`, `content_id`, `content_type`, `status`) VALUES
(1, 4, 615457, 1, 'On hold'),
(2, 4, 460465, 1, 'Completed'),
(3, 4, 791373, 1, 'Completed'),
(4, 4, 412656, 1, 'Dropped');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `role` varchar(45) NOT NULL DEFAULT 'user',
  `banner_pic` longblob,
  `profile_pic` longblob,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `userId_UNIQUE` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `first_name`, `last_name`, `email`, `password`, `create_time`, `role`, `banner_pic`, `profile_pic`) VALUES
(2, 'tdp', 'Ishjot', 'Singh', 'ishjot11@yahoo.in', '743206e8e6b4c2763486c396f5904be1ef35bcb044c6d8de8f3c765e820a97d8', '2021-04-14 16:33:12', 'user', NULL, NULL),
(3, 'OneeyedKing_2000', 'Sukhbir', 'Singh', 'sukhbir.singh0619@gmail.com', '2e2b24f8ee40bb847fe85bb23336a39ef5948e6b49d897419ced68766b16967a', '2021-04-14 16:34:19', 'user', NULL, NULL);
INSERT INTO `user` (`user_id`, `username`, `first_name`, `last_name`, `email`, `password`, `create_time`, `role`, `banner_pic`, `profile_pic`) VALUES

-- --------------------------------------------------------

--
-- Table structure for table `user_auth`
--

DROP TABLE IF EXISTS `user_auth`;
CREATE TABLE IF NOT EXISTS `user_auth` (
  `id` int NOT NULL AUTO_INCREMENT,
  `selector` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `validator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `selector_UNIQUE` (`selector`),
  KEY `user_id_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_auth`
--

INSERT INTO `user_auth` (`id`, `selector`, `validator`, `user_id`) VALUES
(6, '0wjINNZIJ2QJ', 'bc07ebb00ad2575c1c5867a4baaf7e4038b2fbe86eeb3ed8f04fea422377383e', 4),
(7, '2r8Y1MSv8tVu', 'be223ce74d16a9198cbb5672fa76572c38b73f40153f2e289fe4085913c7b60c', 4),
(12, 'rAOkLUJWpXLv', '36456803a7552402483a03aba988a47c88e1ca61e1b071f482c81606bfa80ed0', 4),
(13, 'vSVnhHrOLpxM', '53b8d508b1ab09bb735653515b78e8f0654b038fe2b1d7564fabc7b2415eefbf', 4);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `fk_user_rating` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `status`
--
ALTER TABLE `status`
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `user_auth`
--
ALTER TABLE `user_auth`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;