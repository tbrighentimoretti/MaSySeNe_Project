-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Erstellungszeit: 18. Dez 2020 um 16:22
-- Server-Version: 5.7.26
-- PHP-Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Datenbank: `root`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `comment`
--

CREATE TABLE `comment` (
  `id` bigint(20) NOT NULL,
  `post` bigint(20) NOT NULL,
  `username` varchar(100) NOT NULL,
  `content` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `comment`
--

INSERT INTO `comment` (`id`, `post`, `username`, `content`) VALUES
(13, 20, 'manuel', 'write here your comment'),
(14, 21, 'manuel', 'write here your comment');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `post`
--

CREATE TABLE `post` (
  `id` bigint(20) NOT NULL,
  `username` varchar(100) NOT NULL,
  `title` varchar(200) NOT NULL,
  `content` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `post`
--

INSERT INTO `post` (`id`, `username`, `title`, `content`) VALUES
(20, 'manuel', 'How to Prevent SQL Injection Vulnerabilities in PHP Applications', 'Many PHP developers access databases using mysql or mysqli extensions. It is possible to use parameterized queries with the mysqli extension but PHP 5.1 introduced a better way to work with databases: PHP Data Objects (PDO). PDO provides methods that make parameterized queries easy to use. It also makes the code easier to read and more portable â€“ it works with several databases, not just MySQL.'),
(21, 'manuel', 'Cross Site Scripting (XSS)', 'Cross-Site Scripting (XSS) attacks are a type of injection, in which malicious scripts are injected into otherwise benign and trusted websites. XSS attacks occur when an attacker uses a web application to send malicious code, generally in the form of a browser side script, to a different end user. Flaws that allow these attacks to succeed are quite widespread and occur anywhere a web application uses input from a user within the output it generates without validating or encoding it.');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`username`, `password`) VALUES
('manuel', '$2y$10$NSSjcSurWTDfBnAnAV1je.SD5wemFovwIVXagkN1YLw94cY3GxVdi');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user_cookie_session`
--

CREATE TABLE `user_cookie_session` (
  `username` varchar(100) NOT NULL,
  `cookie_token` varchar(255) NOT NULL,
  `ip` char(15) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `user_cookie_session`
--

INSERT INTO `user_cookie_session` (`username`, `cookie_token`, `ip`, `created_at`) VALUES
('manuel', '$2y$10$X3JCZLgjqvXk/mucbrTvjeC.czou7anfxaIvG9unuak', '93.147.137.56', '0000-00-00 00:00:00'),
('manuel', '$2y$10$/0YaoYF7hGniggfv7mGxROs4fypd0VZBQ2SJYkZTyP2', '93.147.137.56', '0000-00-00 00:00:00'),
('manuel', '$2y$10$ZKWUid2G749RwVhHlI2r/.rv327zW4tChHl/IGt0P27', '93.147.137.56', '2020-12-16 19:59:21'),
('manuel', '$2y$10$wKRKGnvloyjtsDyPF8GTcumMLe1tV5o6/rtQotRPgy9', '93.147.137.56', '2020-12-16 20:01:05'),
('manuel', '$2y$10$J3iXhEYtxOyI5BZxpeseielZoRxXZOwyPQ2UOMa4BI2', '151.68.41.170', '2020-12-16 20:01:56'),
('manuel', '$2y$10$C5/WSHtSo3J1QItRMzAWa.51ktuLLNxsKIr4QDkSUdZ', '93.147.137.56', '2020-12-16 20:03:06'),
('manuel', '$2y$10$qBoiqUZEEMR5S/.se4PL/uRdhmcmfotDqRYdniQYLHB', '151.34.91.212', '2020-12-16 20:31:10'),
('GalloNoob', '$2y$10$ASXkGoAtMvEvC2gik8mKGOU/.PuvtgJFPcvy/VsOhmd', '146.241.75.71', '2020-12-16 20:32:42'),
('manuel', '$2y$10$1VRS3KbQnu/Xa4fgTnsBPOjqrNsku8wZ4.Qj8ndcNzL', '93.147.137.56', '2020-12-16 22:36:47'),
('GalloNoob', '$2y$10$gaeJ4HopeBZTMof4MTpSW.OWcj6xaoNVia4KWlzN16.', '5.89.221.202', '2020-12-17 08:17:33'),
('GalloNoob', '$2y$10$MCJqJrRJyjomVvYD8K7iBuacJZ/DF4p/mRxT9wIgBRy', '5.89.221.202', '2020-12-17 08:19:43'),
('manuel', '$2y$10$joLVtELYOuRmM66trhgz5edZo2hhAAH.2Z534NrlT5T', '5.89.221.202', '2020-12-17 17:08:21'),
('tbrighentimoretti', '$2y$10$wAWiny.eTaEEBlFUDFrDyubJMJCsglC8VnNtRML8ka6', '::1', '2020-12-18 11:35:40'),
('tbrighentimoretti', '$2y$10$.GHlY8oKfyLqKsCXKaH/0OmaKK8gIN3yPxWODlfSi6f', '::1', '2020-12-18 11:36:25');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`);

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`);

--
-- Indizes für die Tabelle `user_cookie_session`
--
ALTER TABLE `user_cookie_session`
  ADD KEY `username` (`username`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `comment`
--
ALTER TABLE `comment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT für Tabelle `post`
--
ALTER TABLE `post`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`);
