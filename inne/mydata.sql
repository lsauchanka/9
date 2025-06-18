-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 25, 2020 at 04:10 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mydata`
--

-- --------------------------------------------------------

--
-- Table structure for table `kursy`
--

CREATE TABLE `kursy` (
  `id` int(11) NOT NULL,
  `nazwa` text COLLATE utf8_polish_ci NOT NULL,
  `miejsce` text COLLATE utf8_polish_ci NOT NULL,
  `data` date NOT NULL,
  `cena` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `kursy`
--

INSERT INTO `kursy` (`id`, `nazwa`, `miejsce`, `data`, `cena`) VALUES
(1, 'Java dla opornych', 'Warsawa', '2020-07-21', 1000),
(2, 'PHP', 'Kraków', '2020-12-12', 900),
(3, 'Front-end dla każdego', 'Warszawa', '2020-11-30', 1500);

-- --------------------------------------------------------

--
-- Table structure for table `uzytkownicy_kursy`
--

CREATE TABLE `uzytkownicy_kursy` (
  `id` int(11) NOT NULL,
  `idkurs` int(11) NOT NULL,
  `iduzytkownik` int(11) NOT NULL,
  `status_platnosc` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `uzytkownicy_kursy`
--

INSERT INTO `uzytkownicy_kursy` (`id`, `idkurs`, `iduzytkownik`, `status_platnosc`) VALUES
(11, 1, 1, 1),
(12, 1, 2, 0),
(16, 1, 3, 0),
(15, 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `uzytkownik`
--

CREATE TABLE `uzytkownik` (
  `id` int(11) NOT NULL,
  `imie` text COLLATE utf8_polish_ci NOT NULL,
  `nazwisko` text COLLATE utf8_polish_ci NOT NULL,
  `rok_urodzenia` int(11) NOT NULL,
  `login` text COLLATE utf8_polish_ci DEFAULT NULL,
  `haslo` text COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `uzytkownik`
--

INSERT INTO `uzytkownik` (`id`, `imie`, `nazwisko`, `rok_urodzenia`, `login`, `haslo`) VALUES
(1, 'Łukasz', 'Birski', 1990, 'login', 'haslo'),
(2, 'Tomek', 'Nowak', 1995, 'tomek', 'nowak'),
(3, 'Jan', 'Nowak', 1975, 'jan', 'jan'),
(4, 'Lukasz', 'Birski', 1988, 'ania', 'haslo1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kursy`
--
ALTER TABLE `kursy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uzytkownicy_kursy`
--
ALTER TABLE `uzytkownicy_kursy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uzytkownik`
--
ALTER TABLE `uzytkownik`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kursy`
--
ALTER TABLE `kursy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `uzytkownicy_kursy`
--
ALTER TABLE `uzytkownicy_kursy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `uzytkownik`
--
ALTER TABLE `uzytkownik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
