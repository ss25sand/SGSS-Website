-- Recreate gurdwaradatabase DB

-- Recreate logins table
-- MySQL
CREATE TABLE `gurdwaradatabase`.`logins`(
  `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `username` VARCHAR(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `passcode` VARCHAR(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `loginStatus` TINYINT(1) NOT NULL
);
-- Postgresql
CREATE TABLE logins(
  id SERIAL PRIMARY KEY,
  username VARCHAR(255) NOT NULL,
  passcode VARCHAR(255) NOT NULL,
  loginStatus SMALLINT NOT NULL
);

-- Repopulate logins table
-- MySQL
INSERT INTO `logins` (`id`, `username`, `passcode`, `loginStatus`) VALUES
(NULL, 'Jaswinder', '$2a$10$.tj9ZP18PuPWGU74ZdUFXuJGnBwHkfNOjS8MSZbhdK/pzS4bQArL6', '0'),
(NULL, 'Manmohan', '$2a$10$el4wtnb1D3ujGjfmEi7L5OIK9KpVEh3acGFBCOAj53vvNjk8bC9xO', '0'),
(NULL, 'Navdeep', '$2a$10$QLa9BToN9ikuFc/KgwnrtOUNBfCGmCGKZsQxQo9LPFb7Df6hgnYES', '0'),
(NULL, 'Sam', '$2a$10$mtQ70KeSBhGWhXE0bPmuheWWOQrFWc3IoPFaBxuHYN5mww/iyQhBK', '0'),
(NULL, 'test', '$2a$10$HGl4MIm/CvFttnSgkNXrPuZEDe3TULr4xgvP3SEY.yJALcg1vv/B6', '0');
-- Postgresql
INSERT INTO logins (username, passcode, loginStatus) VALUES
('Jaswinder', '$2a$10$.tj9ZP18PuPWGU74ZdUFXuJGnBwHkfNOjS8MSZbhdK/pzS4bQArL6', '0'),
('Manmohan', '$2a$10$el4wtnb1D3ujGjfmEi7L5OIK9KpVEh3acGFBCOAj53vvNjk8bC9xO', '0'),
('Navdeep', '$2a$10$QLa9BToN9ikuFc/KgwnrtOUNBfCGmCGKZsQxQo9LPFb7Df6hgnYES', '0'),
('Sam', '$2a$10$mtQ70KeSBhGWhXE0bPmuheWWOQrFWc3IoPFaBxuHYN5mww/iyQhBK', '0'),
('test', '$2a$10$HGl4MIm/CvFttnSgkNXrPuZEDe3TULr4xgvP3SEY.yJALcg1vv/B6', '0');

-- Recreate events TABLE
-- MySQL
CREATE TABLE `gurdwaradatabase`.`events`(
  `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `date` VARCHAR(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `event` VARCHAR(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL
);
-- Postgresql
CREATE TABLE events (
  id SERIAL PRIMARY KEY,
  date VARCHAR(255) NOT NULL,
  event VARCHAR(255) NOT NULL
);

-- Repopulate events TABLE
-- MySQL
INSERT INTO `events` (`id`, `date`, `event`) VALUES
(NULL, 'February 1, 2019', 'dfg'),
(NULL, 'February 2, 2019', ''),
(NULL, 'February 3, 2019', 'fdgfdg'),
(NULL, 'February 4, 2019', ''),
(NULL, 'February 5, 2019', ''),
(NULL, 'February 6, 2019', ''),
(NULL, 'February 7, 2019', 'Its not a saturday today'),
(NULL, 'February 8, 2019', ''),
(NULL, 'February 9, 2019', 'fdg'),
(NULL, 'February 10, 2019', 'sdfds'),
(NULL, 'February 11, 2019', 'dfgfdg'),
(NULL, 'February 12, 2019', ''),
(NULL, 'February 13, 2019', 'I have an interview today!!!'),
(NULL, 'February 14, 2019', ''),
(NULL, 'February 15, 2019', ''),
(NULL, 'February 16, 2019', ''),
(NULL, 'February 17, 2019', ''),
(NULL, 'February 18, 2019', ''),
(NULL, 'February 19, 2019', ''),
(NULL, 'February 20, 2019', ''),
(NULL, 'February 21, 2019', ''),
(NULL, 'February 22, 2019', ''),
(NULL, 'February 23, 2019', ''),
(NULL, 'February 24, 2019', ''),
(NULL, 'February 25, 2019', ''),
(NULL, 'February 26, 2019', ''),
(NULL, 'February 27, 2019', ''),
(NULL, 'February 28, 2019', '');

-- Postgresql
INSERT INTO events (date, event) VALUES
('February 1, 2019', 'dfg'),
('February 2, 2019', ''),
('February 3, 2019', 'fdgfdg'),
('February 4, 2019', ''),
('February 5, 2019', ''),
('February 6, 2019', ''),
('February 7, 2019', 'Its not a saturday today'),
('February 8, 2019', ''),
('February 9, 2019', 'fdg'),
('February 10, 2019', 'sdfds'),
('February 11, 2019', 'dfgfdg'),
('February 12, 2019', ''),
('February 13, 2019', 'I have an interview today!!!'),
('February 14, 2019', ''),
('February 15, 2019', ''),
('February 16, 2019', ''),
('February 17, 2019', ''),
('February 18, 2019', ''),
('February 19, 2019', ''),
('February 20, 2019', ''),
('February 21, 2019', ''),
('February 22, 2019', ''),
('February 23, 2019', ''),
('February 24, 2019', ''),
('February 25, 2019', ''),
('February 26, 2019', ''),
('February 27, 2019', ''),
('February 28, 2019', '');

-- ***** From MySQL *****
-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 20, 2019 at 05:55 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;

--
-- Database: `gurdwaradatabase`
--
CREATE DATABASE IF NOT EXISTS `gurdwaradatabase` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `gurdwaradatabase`;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `date` varchar(255) DEFAULT NULL,
  `event` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `date`, `event`) VALUES
(1, 'February 1, 2019', 'dfg'),
(2, 'February 2, 2019', ''),
(3, 'February 3, 2019', 'fdgfdg'),
(4, 'February 4, 2019', ''),
(5, 'February 5, 2019', ''),
(6, 'February 6, 2019', ''),
(7, 'February 7, 2019', 'Its not a saturday today'),
(8, 'February 8, 2019', ''),
(9, 'February 9, 2019', 'fdg'),
(10, 'February 10, 2019', 'sdfds'),
(11, 'February 11, 2019', 'dfgfdg'),
(12, 'February 12, 2019', ''),
(13, 'February 13, 2019', 'I have an interview today!!!'),
(14, 'February 14, 2019', ''),
(15, 'February 15, 2019', ''),
(16, 'February 16, 2019', ''),
(17, 'February 17, 2019', ''),
(18, 'February 18, 2019', ''),
(19, 'February 19, 2019', ''),
(20, 'February 20, 2019', ''),
(21, 'February 21, 2019', ''),
(22, 'February 22, 2019', ''),
(23, 'February 23, 2019', ''),
(24, 'February 24, 2019', ''),
(25, 'February 25, 2019', ''),
(26, 'February 26, 2019', ''),
(27, 'February 27, 2019', ''),
(28, 'February 28, 2019', '');

-- --------------------------------------------------------

--
-- Table structure for table `logins`
--

DROP TABLE IF EXISTS `logins`;
CREATE TABLE `logins` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `passcode` varchar(255) DEFAULT NULL,
  `loginStatus` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logins`
--

INSERT INTO `logins` (`id`, `username`, `passcode`, `loginStatus`) VALUES
(6, 'Jaswinder', '$2a$10$.tj9ZP18PuPWGU74ZdUFXuJGnBwHkfNOjS8MSZbhdK/pzS4bQArL6', 0),
(7, 'Sam', '$2a$10$mtQ70KeSBhGWhXE0bPmuheWWOQrFWc3IoPFaBxuHYN5mww/iyQhBK', 0),
(8, 'Manmohan', '$2a$10$el4wtnb1D3ujGjfmEi7L5OIK9KpVEh3acGFBCOAj53vvNjk8bC9xO', 0),
(9, 'Navdeep', '$2a$10$QLa9BToN9ikuFc/KgwnrtOUNBfCGmCGKZsQxQo9LPFb7Df6hgnYES', 0),
(22, 'test', '$2a$10$HGl4MIm/CvFttnSgkNXrPuZEDe3TULr4xgvP3SEY.yJALcg1vv/B6', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logins`
--
ALTER TABLE `logins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_3` (`id`),
  ADD UNIQUE KEY `id` (`id`,`username`,`passcode`,`loginStatus`),
  ADD UNIQUE KEY `id_2` (`id`,`username`,`passcode`,`loginStatus`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `logins`
--
ALTER TABLE `logins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;
