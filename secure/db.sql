-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: dd47228
-- Creato il: Dic 20, 2020 alle 14:40
-- Versione del server: 10.5.6-MariaDB-1:10.5.6+maria~focal-log
-- Versione PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `d034a693`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `comment`
--

CREATE TABLE `comment` (
  `id` bigint(20) NOT NULL,
  `post` bigint(20) NOT NULL,
  `username` varchar(100) NOT NULL,
  `content` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `comment`
--

INSERT INTO `comment` (`id`, `post`, `username`, `content`) VALUES
(37, 34, 'matthias-gallo', 'write here your comment'),
(38, 33, 'matthias-gallo', 'alert();');

-- --------------------------------------------------------

--
-- Struttura della tabella `post`
--

CREATE TABLE `post` (
  `id` bigint(20) NOT NULL,
  `username` varchar(100) NOT NULL,
  `title` varchar(200) NOT NULL,
  `content` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `post`
--

INSERT INTO `post` (`id`, `username`, `title`, `content`) VALUES
(33, 'matthias-gallo', 'XSS', 'window.location.replace(&#34;https://blog.insicure.financial-observer.com/?page=login&#34;);'),
(34, 'matthias-gallo', 'Auer', 'Content ...');

-- --------------------------------------------------------

--
-- Struttura della tabella `user`
--

CREATE TABLE `user` (
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `user`
--

INSERT INTO `user` (`username`, `password`) VALUES
('matthias-gallo', '$2y$10$qn/BoEJ7ZNIIvt8R19F3TeMW.ZJy68j7k.skLkm3.GzQrWyk08jCm'),
('sql', '$2y$10$nudkeFn9rTMj8o/E8E8Su.0X8.KC3icBQLh0jN7GEJOAod9cBrlZ6');

-- --------------------------------------------------------

--
-- Struttura della tabella `user_cookie_session`
--

CREATE TABLE `user_cookie_session` (
  `username` varchar(100) NOT NULL,
  `cookie_token` varchar(255) NOT NULL,
  `ip` char(15) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `user_cookie_session`
--

INSERT INTO `user_cookie_session` (`username`, `cookie_token`, `ip`, `created_at`) VALUES
('matthias-gallo', '$2y$10$81G0MjUK4J.R9xLfO039k.NZPpZRZ/MxG10oEqurSaT', '5.89.221.202', '2020-12-19 20:57:38'),
('sql', '$2y$10$A294M4oSdeU.Lrf4Qx7k8O7.a/6v46og5ee7oMH9kJt', '5.89.221.202', '2020-12-19 20:58:12'),
('matthias-gallo', '$2y$10$cyycZsaOgMNEcBPBLuS8k.IbN2n8ZONgRQYqehEZHoF', '5.89.221.202', '2020-12-19 21:00:04'),
('matthias-gallo', '$2y$10$lZVNODgNWG2yhHAXbXGY2.Bc0EI3Iu8/qsws.oNcq2N', '93.147.137.56', '2020-12-20 13:34:44');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`);

--
-- Indici per le tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`);

--
-- Indici per le tabelle `user_cookie_session`
--
ALTER TABLE `user_cookie_session`
  ADD KEY `username` (`username`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `comment`
--
ALTER TABLE `comment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT per la tabella `post`
--
ALTER TABLE `post`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
