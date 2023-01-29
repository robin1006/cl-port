-- Adminer 4.8.1 MySQL 8.0.29-0ubuntu0.20.04.3 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `album`;
CREATE TABLE `album` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `year` date DEFAULT NULL,
  `id_artist` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_artist` (`id_artist`),
  CONSTRAINT `album_ibfk_1` FOREIGN KEY (`id_artist`) REFERENCES `artist` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `album` (`id`, `name`, `year`, `id_artist`) VALUES
(1,	'Old West Clothing',	'1990-08-12',	1),
(2,	'A mere Vatan Ke logo',	'1990-08-12',	1),
(3,	'Tum DIl ki',	'1990-08-12',	2),
(4,	'Yearly Income',	'2022-02-07',	2);

DROP TABLE IF EXISTS `artist`;
CREATE TABLE `artist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `creacted_on` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `artist` (`id`, `name`, `creacted_on`) VALUES
(1,	'Lata',	'2022-08-11 08:56:16'),
(2,	'Kishor',	'2022-08-11 08:56:39');

DROP TABLE IF EXISTS `song`;
CREATE TABLE `song` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `year` date DEFAULT NULL,
  `songable_type` text NOT NULL COMMENT '(artist or album) //one to many polymorphic',
  `songable_id` int NOT NULL COMMENT '(artist.id or album.id)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `song` (`id`, `name`, `year`, `songable_type`, `songable_id`) VALUES
(1,	'Some Notes on Attunement: A Voyage Around Joni Mitchell',	'2022-04-24',	'SAD',	1),
(2,	'Move Your Body',	'2022-04-24',	'LOVE',	1),
(3,	'Johnny In The House',	'2022-04-24',	'LOVE',	2),
(4,	'Move Your Body (Phatt Mix)',	'2022-04-24',	'POP',	2);

-- 2022-08-12 02:27:08