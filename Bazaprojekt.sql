-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 03 Lis 2023, 23:51
-- Wersja serwera: 10.4.22-MariaDB
-- Wersja PHP: 8.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `projekt`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `bonus`
--

CREATE TABLE `bonus` (
  `Bonus_id` int(11) NOT NULL,
  `Name` text NOT NULL,
  `Description` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `education`
--

CREATE TABLE `education` (
  `educatuion_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `place` text NOT NULL,
  `level_of_education` text NOT NULL,
  `type` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `expirence`
--

CREATE TABLE `expirence` (
  `expirence_id` int(11) NOT NULL,
  `position` text NOT NULL,
  `firm` text NOT NULL,
  `localozation` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `duties` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `form_of_agreement`
--

CREATE TABLE `form_of_agreement` (
  `form_of_agreement_id` int(11) NOT NULL,
  `form_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `form_of_agreement`
--

INSERT INTO `form_of_agreement` (`form_of_agreement_id`, `form_name`) VALUES
(1, 'Umowa o prace'),
(2, 'Umowa o zlecenie');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `form_of_agreement_user_offert`
--

CREATE TABLE `form_of_agreement_user_offert` (
  `form_of_agreement_user_offert_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `form_of_agreement_id` int(11) NOT NULL,
  `offert_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `form_of_agreement_user_offert`
--

INSERT INTO `form_of_agreement_user_offert` (`form_of_agreement_user_offert_id`, `user_id`, `form_of_agreement_id`, `offert_id`) VALUES
(1, 2, 1, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `language`
--

CREATE TABLE `language` (
  `language_id` int(11) NOT NULL,
  `language` text NOT NULL,
  `level_of_language` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `offert`
--

CREATE TABLE `offert` (
  `offert_id` int(11) NOT NULL,
  `offert_name` text NOT NULL,
  `date_of_add` date NOT NULL,
  `description` text NOT NULL,
  `form_of_agreement_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `offert`
--

INSERT INTO `offert` (`offert_id`, `offert_name`, `date_of_add`, `description`, `form_of_agreement_id`) VALUES
(1, 'Sprzedawca na stacji Paliw BP', '2023-10-09', 'Sprzedawca na stacji Paliw BP', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `position`
--

CREATE TABLE `position` (
  `position_id` int(11) NOT NULL,
  `position_name` text NOT NULL,
  `position_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `position`
--

INSERT INTO `position` (`position_id`, `position_name`, `position_desc`) VALUES
(1, 'programista', ''),
(2, 'informatyk', '');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` text NOT NULL,
  `user_surname` text NOT NULL,
  `email` text NOT NULL,
  `password_hash` text NOT NULL,
  `is_admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_surname`, `email`, `password_hash`, `is_admin`) VALUES
(2, 'Jan', 'Kowalski', 'kowaljan@gmail.com', '1234567890', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_position`
--

CREATE TABLE `user_position` (
  `user_position` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `position_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `user_position`
--

INSERT INTO `user_position` (`user_position`, `user_id`, `position_id`) VALUES
(1, 2, 1);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `bonus`
--
ALTER TABLE `bonus`
  ADD PRIMARY KEY (`Bonus_id`);

--
-- Indeksy dla tabeli `education`
--
ALTER TABLE `education`
  ADD PRIMARY KEY (`educatuion_id`);

--
-- Indeksy dla tabeli `expirence`
--
ALTER TABLE `expirence`
  ADD PRIMARY KEY (`expirence_id`);

--
-- Indeksy dla tabeli `form_of_agreement`
--
ALTER TABLE `form_of_agreement`
  ADD PRIMARY KEY (`form_of_agreement_id`);

--
-- Indeksy dla tabeli `form_of_agreement_user_offert`
--
ALTER TABLE `form_of_agreement_user_offert`
  ADD PRIMARY KEY (`form_of_agreement_user_offert_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `form_of_agreement_id` (`form_of_agreement_id`),
  ADD KEY `offert_id` (`offert_id`);

--
-- Indeksy dla tabeli `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`language_id`);

--
-- Indeksy dla tabeli `offert`
--
ALTER TABLE `offert`
  ADD PRIMARY KEY (`offert_id`),
  ADD KEY `form_of_agreement` (`form_of_agreement_id`);

--
-- Indeksy dla tabeli `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`position_id`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indeksy dla tabeli `user_position`
--
ALTER TABLE `user_position`
  ADD PRIMARY KEY (`user_position`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `position_id` (`position_id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `bonus`
--
ALTER TABLE `bonus`
  MODIFY `Bonus_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `education`
--
ALTER TABLE `education`
  MODIFY `educatuion_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `expirence`
--
ALTER TABLE `expirence`
  MODIFY `expirence_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `form_of_agreement`
--
ALTER TABLE `form_of_agreement`
  MODIFY `form_of_agreement_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `form_of_agreement_user_offert`
--
ALTER TABLE `form_of_agreement_user_offert`
  MODIFY `form_of_agreement_user_offert_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `language`
--
ALTER TABLE `language`
  MODIFY `language_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `offert`
--
ALTER TABLE `offert`
  MODIFY `offert_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `position`
--
ALTER TABLE `position`
  MODIFY `position_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `user_position`
--
ALTER TABLE `user_position`
  MODIFY `user_position` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `form_of_agreement_user_offert`
--
ALTER TABLE `form_of_agreement_user_offert`
  ADD CONSTRAINT `form_of_agreement_user_offert_ibfk_1` FOREIGN KEY (`offert_id`) REFERENCES `offert` (`offert_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `form_of_agreement_user_offert_ibfk_2` FOREIGN KEY (`form_of_agreement_id`) REFERENCES `form_of_agreement` (`form_of_agreement_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `form_of_agreement_user_offert_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `offert`
--
ALTER TABLE `offert`
  ADD CONSTRAINT `offert_ibfk_1` FOREIGN KEY (`form_of_agreement_id`) REFERENCES `form_of_agreement` (`form_of_agreement_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `user_position`
--
ALTER TABLE `user_position`
  ADD CONSTRAINT `user_position_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `user_position_ibfk_2` FOREIGN KEY (`position_id`) REFERENCES `position` (`position_id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
