-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2021 at 08:36 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `my_books`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `id` int(11) NOT NULL,
  `auth_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`id`, `auth_name`) VALUES
(1, 'Clive Barker'),
(2, 'Dan Brown'),
(3, 'J.K. Rowling');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `auth_id` int(11) NOT NULL,
  `book_title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `release_year` int(11) NOT NULL,
  `pub_id` int(11) NOT NULL,
  `style_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `auth_id`, `book_title`, `release_year`, `pub_id`, `style_id`) VALUES
(1, 1, 'Kárhozat', 1985, 1, 2),
(2, 1, 'Pokolkeltő', 1986, 2, 1),
(3, 1, 'Korbács', 1987, 2, 2),
(4, 1, 'Az éjszaka gyermekei', 1988, 2, 1),
(5, 1, 'Hírvivő', 1989, 2, 2),
(6, 1, 'Az öröklét tolvaja', 1992, 2, 2),
(7, 1, 'Abarat', 2002, 3, 2),
(8, 2, 'Angyalok és Démonok', 2003, 4, 4),
(9, 2, 'A Da Vinci kód', 2004, 4, 4),
(10, 2, 'Inferno', 2013, 4, 3),
(11, 2, 'Eredet', 2018, 4, 3),
(12, 3, 'Harry Potter és a bölcsek köve', 1997, 5, 2),
(13, 3, 'Harry Potter és a titkok kamrája', 1998, 5, 2),
(14, 3, 'Harry Potter és az Azkabani fogoly', 1999, 5, 2),
(15, 3, 'Harry Potter és a Tűz serlege', 2000, 5, 2),
(16, 3, 'Harry Potter és a Főnix rendje', 2003, 5, 2),
(17, 3, 'Harry Potter és a Félvér herceg', 2005, 5, 2),
(18, 3, 'Harry Potter és a Halál ereklyéi', 2007, 5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

CREATE TABLE `publisher` (
  `id` int(11) NOT NULL,
  `pub_name` varchar(255) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `publisher`
--

INSERT INTO `publisher` (`id`, `pub_name`) VALUES
(1, 'Hibiszkus'),
(2, 'Szukits'),
(3, 'Metropolis Media Group'),
(4, 'Gabo'),
(5, 'Animus');

-- --------------------------------------------------------

--
-- Table structure for table `styles`
--

CREATE TABLE `styles` (
  `id` int(11) NOT NULL,
  `styles` varchar(255) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `styles`
--

INSERT INTO `styles` (`id`, `styles`) VALUES
(1, 'Horror'),
(2, 'Fantasy'),
(3, 'Kaland'),
(4, 'Krimi');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD KEY `auth_id_index` (`auth_id`),
  ADD KEY `pub_id_index` (`pub_id`),
  ADD KEY `style_id_index` (`style_id`);

--
-- Indexes for table `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `styles`
--
ALTER TABLE `styles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `publisher`
--
ALTER TABLE `publisher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `styles`
--
ALTER TABLE `styles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`auth_id`) REFERENCES `authors` (`id`),
  ADD CONSTRAINT `books_ibfk_2` FOREIGN KEY (`pub_id`) REFERENCES `publisher` (`id`),
  ADD CONSTRAINT `books_ibfk_3` FOREIGN KEY (`style_id`) REFERENCES `styles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
