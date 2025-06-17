-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 24 Cze 2020, 12:43
-- Wersja serwera: 8.0.11
-- Wersja PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `zaliczenie2`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kurs`
--

CREATE TABLE `kurs` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Zrzut danych tabeli `kurs`
--

INSERT INTO `kurs` (`id`, `nazwa`) VALUES
(1, 'Angielski - podstawowy'),
(2, 'Angielski - rozszerzony'),
(3, 'Niemiecki - podstawowy'),
(4, 'Niemiecki - rozszerzony'),
(5, 'Chinski - podstawowy'),
(6, 'Wloski - podstawowy '),
(7, 'Francuski - podstawowy '),
(8, 'Hiszpanski - podstawowy');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `prawodostepu`
--

CREATE TABLE `prawodostepu` (
  `id` int(11) NOT NULL,
  `dostep` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Zrzut danych tabeli `prawodostepu`
--

INSERT INTO `prawodostepu` (`id`, `dostep`) VALUES
(1, 'Tak'),
(2, 'Nie');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownik`
--

CREATE TABLE `uzytkownik` (
  `ID` int(11) NOT NULL,
  `login` varchar(30) NOT NULL,
  `pass` varchar(30) NOT NULL,
  `ID_pd` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Zrzut danych tabeli `uzytkownik`
--

INSERT INTO `uzytkownik` (`ID`, `login`, `pass`, `ID_pd`) VALUES
(1, 'Administrator', 'pass', 1),
(2, 'ZalogowanyUzytkownik', 'pass', 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zapis`
--

CREATE TABLE `zapis` (
  `id_uz` int(11) NOT NULL,
  `id_kr` int(11) NOT NULL,
  `oplata` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Zrzut danych tabeli `zapis`
--

INSERT INTO `zapis` (`id_uz`, `id_kr`, `oplata`) VALUES
(2, 2, 'Tak'),
(2, 7, 'Nie'),
(1, 2, 'Tak'),
(2, 5, 'Nie');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `kurs`
--
ALTER TABLE `kurs`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `prawodostepu`
--
ALTER TABLE `prawodostepu`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `uzytkownik`
--
ALTER TABLE `uzytkownik`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_pd` (`ID_pd`);

--
-- Indeksy dla tabeli `zapis`
--
ALTER TABLE `zapis`
  ADD KEY `id_kr` (`id_kr`),
  ADD KEY `id_uz` (`id_uz`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `kurs`
--
ALTER TABLE `kurs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT dla tabeli `prawodostepu`
--
ALTER TABLE `prawodostepu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `uzytkownik`
--
ALTER TABLE `uzytkownik`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `uzytkownik`
--
ALTER TABLE `uzytkownik`
  ADD CONSTRAINT `uzytkownik_ibfk_1` FOREIGN KEY (`ID_pd`) REFERENCES `prawodostepu` (`id`);

--
-- Ograniczenia dla tabeli `zapis`
--
ALTER TABLE `zapis`
  ADD CONSTRAINT `zapis_ibfk_1` FOREIGN KEY (`id_uz`) REFERENCES `uzytkownik` (`id`),
  ADD CONSTRAINT `zapis_ibfk_2` FOREIGN KEY (`id_kr`) REFERENCES `kurs` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
