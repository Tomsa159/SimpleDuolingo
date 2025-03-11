-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Počítač: localhost
-- Vytvořeno: Úte 11. bře 2025, 14:09
-- Verze serveru: 10.3.39-MariaDB
-- Verze PHP: 7.2.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `student_ondrej.tomsicek_duolingo`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `exercises`
--

CREATE TABLE `exercises` (
  `id` int(11) NOT NULL,
  `difficulty` int(11) NOT NULL,
  `exercise_type_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_ID` int(11) NOT NULL,
  `language_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabulky `exercise_types`
--

CREATE TABLE `exercise_types` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Vypisuji data pro tabulku `exercise_types`
--

INSERT INTO `exercise_types` (`id`, `name`, `create_at`, `modified_at`) VALUES
(1, 'speach', '2025-01-15 11:57:36', '2025-01-15 12:00:14'),
(2, 'translate from', '2025-01-15 11:57:36', '2025-01-15 11:57:36'),
(3, 'listening', '2025-01-15 11:57:45', '2025-01-15 12:00:04'),
(4, 'translate to', '2025-01-15 11:57:45', '2025-01-15 11:57:45');

-- --------------------------------------------------------

--
-- Struktura tabulky `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Vypisuji data pro tabulku `languages`
--

INSERT INTO `languages` (`id`, `name`, `created_at`, `modified_at`) VALUES
(5, 'english', '2025-01-15 11:47:37', '2025-01-15 11:47:37'),
(6, 'spanish', '2025-01-15 11:47:37', '2025-01-15 11:47:37');

-- --------------------------------------------------------

--
-- Struktura tabulky `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(64) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Vypisuji data pro tabulku `users`
--

INSERT INTO `users` (`id`, `username`, `created_at`, `modified_at`) VALUES
(9, 'Pepa', '2025-01-22 11:40:05', '2025-01-22 11:40:05'),
(12, 'Kuba2', '2025-02-05 10:14:37', '2025-02-05 10:14:37');

-- --------------------------------------------------------

--
-- Struktura tabulky `user_friend_relation_records`
--

CREATE TABLE `user_friend_relation_records` (
  `id` int(11) NOT NULL,
  `user_1_id` int(11) NOT NULL,
  `user_2_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktura tabulky `user_language_registrations`
--

CREATE TABLE `user_language_registrations` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Vypisuji data pro tabulku `user_language_registrations`
--

INSERT INTO `user_language_registrations` (`id`, `user_id`, `language_id`) VALUES
(7, NULL, 6),
(8, NULL, 6);

--
-- Klíče pro exportované tabulky
--

--
-- Klíče pro tabulku `exercises`
--
ALTER TABLE `exercises`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exercise_type_id` (`exercise_type_id`),
  ADD KEY `user_ID` (`user_ID`),
  ADD KEY `language_ID` (`language_ID`);

--
-- Klíče pro tabulku `exercise_types`
--
ALTER TABLE `exercise_types`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `user_friend_relation_records`
--
ALTER TABLE `user_friend_relation_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_1_id` (`user_1_id`),
  ADD KEY `user_2_id` (`user_2_id`);

--
-- Klíče pro tabulku `user_language_registrations`
--
ALTER TABLE `user_language_registrations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `language_id` (`language_id`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `exercises`
--
ALTER TABLE `exercises`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `exercise_types`
--
ALTER TABLE `exercise_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pro tabulku `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pro tabulku `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pro tabulku `user_friend_relation_records`
--
ALTER TABLE `user_friend_relation_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `user_language_registrations`
--
ALTER TABLE `user_language_registrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `exercises`
--
ALTER TABLE `exercises`
  ADD CONSTRAINT `exercise_types_fk` FOREIGN KEY (`exercise_type_id`) REFERENCES `exercise_types` (`id`),
  ADD CONSTRAINT `languages_fk` FOREIGN KEY (`language_ID`) REFERENCES `languages` (`id`),
  ADD CONSTRAINT `users_fk` FOREIGN KEY (`user_ID`) REFERENCES `users` (`id`);

--
-- Omezení pro tabulku `user_friend_relation_records`
--
ALTER TABLE `user_friend_relation_records`
  ADD CONSTRAINT `user_1_fk` FOREIGN KEY (`user_1_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_2_fk` FOREIGN KEY (`user_2_id`) REFERENCES `users` (`id`);

--
-- Omezení pro tabulku `user_language_registrations`
--
ALTER TABLE `user_language_registrations`
  ADD CONSTRAINT `language_fk` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`),
  ADD CONSTRAINT `user_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
