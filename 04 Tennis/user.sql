-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 06, 2019 at 04:54 PM
-- Server version: 10.1.24-MariaDB-6
-- PHP Version: 7.0.22-3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `user`
--

-- --------------------------------------------------------

--
-- Table structure for table `Gain`
--

CREATE TABLE `Gain` (
  `nomjoueur` varchar(30) NOT NULL,
  `nomsponsor` varchar(30) DEFAULT NULL,
  `lieutournoi` varchar(30) NOT NULL,
  `annee` int(11) NOT NULL,
  `rang` int(11) DEFAULT NULL,
  `prime` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Gain`
--

INSERT INTO `Gain` (`nomjoueur`, `nomsponsor`, `lieutournoi`, `annee`, `rang`, `prime`) VALUES
('Djokovic', 'IBM', 'Australian Open', 2011, 1, 1000000),
('Djokovic', 'Wilson', 'Flushing-Meadows', 2010, 2, 500000),
('Federer', 'Peugeot', 'Roland-Garros', 2011, 2, 500000),
('Murray', 'IBM', 'Australian Open', 2011, 2, 500000),
('Nadal', 'Wilson', 'Flushing-Meadows', 2010, 1, 1000000),
('Nadal', 'Peugeot', 'Roland-Garros', 2011, 1, 1000000);

-- --------------------------------------------------------

--
-- Table structure for table `Joueurs`
--

CREATE TABLE `Joueurs` (
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `age` int(11) NOT NULL,
  `nationalite` varchar(30) NOT NULL,
  `taille` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Joueurs`
--

INSERT INTO `Joueurs` (`nom`, `prenom`, `age`, `nationalite`, `taille`) VALUES
('Berdych', 'Tomas', 35, 'Tchequie', NULL),
('Djokovic', 'Novak', 33, 'Serbie', NULL),
('Federer', 'Roger', 35, 'Suisse', NULL),
('FrenchPName1', 'FrenchPSurname1', 16, 'France', 185),
('FrenchPName2', 'FrenchPSurname2', 34, 'France', 176),
('Murray', 'Andy', 33, 'Royaume-Uni', NULL),
('Nadal', 'Rafael', 34, 'Espagne', NULL),
('Soderling', 'Robin', 36, 'Suede', NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `Joueurs_français`
-- (See below for the actual view)
--
CREATE TABLE `Joueurs_français` (
`nom` varchar(30)
,`prenom` varchar(30)
,`age` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `Matchs_perdus`
-- (See below for the actual view)
--
CREATE TABLE `Matchs_perdus` (
`Nom du Perdant` varchar(30)
,`Prenom du Perdant` varchar(30)
,`Tournoi` varchar(30)
,`Année` int(11)
,`Score` varchar(15)
,`Nom de l'Opposant` varchar(30)
,`Prenom de l'Opposant` varchar(30)
);

-- --------------------------------------------------------

--
-- Table structure for table `Rencontre`
--

CREATE TABLE `Rencontre` (
  `nomgagnant` varchar(30) NOT NULL,
  `nomperdant` varchar(30) NOT NULL,
  `lieutournoi` varchar(30) NOT NULL,
  `annee` int(11) NOT NULL,
  `score` varchar(15) DEFAULT NULL,
  `NomDuStade` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Rencontre`
--

INSERT INTO `Rencontre` (`nomgagnant`, `nomperdant`, `lieutournoi`, `annee`, `score`, `NomDuStade`) VALUES
('Djokovic', 'Murray', 'Australian Open', 2011, '6/4-6/2-6/3', NULL),
('Djokovic', 'Nadal', 'Flushing-Medows', 2011, '6/2-6/4-6/7-6/1', NULL),
('Djokovic', 'Nadal', 'Wimbledon', 2011, '6/4-6/1-1/6-6/3', NULL),
('Nadal', 'Berdych', 'wimbledon', 2010, '6/3-7/5-6/4', NULL),
('Nadal', 'Djokovic', 'flushing-medows', 2010, '6/4-5/7-6/4-6/2', NULL),
('Nadal', 'Federer', 'Roland-Garros', 2011, '7/5-7/6-5/7-6/1', NULL),
('Nadal', 'Soderling', 'roland-garros', 2010, '6/4-6/2-6/4', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Sponsor`
--

CREATE TABLE `Sponsor` (
  `nom` varchar(30) NOT NULL,
  `lieutournoi` varchar(30) NOT NULL,
  `annee` int(11) NOT NULL,
  `adresse` varchar(30) DEFAULT NULL,
  `montant` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Sponsor`
--

INSERT INTO `Sponsor` (`nom`, `lieutournoi`, `annee`, `adresse`, `montant`) VALUES
('IBM', 'Australian Open', 2010, 'Australia', 1500000),
('IBM', 'Australian Open', 2011, 'Australia', 1500000),
('Peugeot', 'Roland-Garros', 2010, 'France', 1500000),
('Peugeot', 'Roland-Garros', 2011, 'France', 1500000),
('Wilson', 'Flushing-Meadows', 2010, 'USA', 1500000),
('Wilson', 'Flushing-Meadows', 2011, 'USA', 1500000);

-- --------------------------------------------------------

--
-- Structure for view `Joueurs_français`
--
DROP TABLE IF EXISTS `Joueurs_français`;

CREATE ALGORITHM=UNDEFINED DEFINER=`user`@`localhost` SQL SECURITY DEFINER VIEW `Joueurs_français`  AS  select `J`.`nom` AS `nom`,`J`.`prenom` AS `prenom`,`J`.`age` AS `age` from `Joueurs` `J` where (`J`.`nationalite` = 'France') ;

-- --------------------------------------------------------

--
-- Structure for view `Matchs_perdus`
--
DROP TABLE IF EXISTS `Matchs_perdus`;

CREATE ALGORITHM=UNDEFINED DEFINER=`user`@`localhost` SQL SECURITY DEFINER VIEW `Matchs_perdus`  AS  select `R`.`nomperdant` AS `Nom du Perdant`,`J`.`prenom` AS `Prenom du Perdant`,`R`.`lieutournoi` AS `Tournoi`,`R`.`annee` AS `Année`,`R`.`score` AS `Score`,`R`.`nomgagnant` AS `Nom de l'Opposant`,`J`.`prenom` AS `Prenom de l'Opposant` from (`Rencontre` `R` join `Joueurs` `J`) where ((`R`.`nomperdant` = `J`.`nom`) and (`R`.`nomgagnant` = `J`.`nom`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Gain`
--
ALTER TABLE `Gain`
  ADD PRIMARY KEY (`nomjoueur`,`lieutournoi`,`annee`),
  ADD KEY `nomsponsor` (`nomsponsor`,`lieutournoi`,`annee`);

--
-- Indexes for table `Joueurs`
--
ALTER TABLE `Joueurs`
  ADD PRIMARY KEY (`nom`);

--
-- Indexes for table `Rencontre`
--
ALTER TABLE `Rencontre`
  ADD PRIMARY KEY (`nomgagnant`,`nomperdant`,`lieutournoi`,`annee`),
  ADD KEY `nomperdant` (`nomperdant`);

--
-- Indexes for table `Sponsor`
--
ALTER TABLE `Sponsor`
  ADD PRIMARY KEY (`nom`,`lieutournoi`,`annee`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Gain`
--
ALTER TABLE `Gain`
  ADD CONSTRAINT `Gain_ibfk_1` FOREIGN KEY (`nomjoueur`) REFERENCES `Joueurs` (`nom`),
  ADD CONSTRAINT `Gain_ibfk_2` FOREIGN KEY (`nomsponsor`,`lieutournoi`,`annee`) REFERENCES `Sponsor` (`nom`, `lieutournoi`, `annee`);

--
-- Constraints for table `Rencontre`
--
ALTER TABLE `Rencontre`
  ADD CONSTRAINT `Rencontre_ibfk_1` FOREIGN KEY (`nomgagnant`) REFERENCES `Joueurs` (`nom`),
  ADD CONSTRAINT `Rencontre_ibfk_2` FOREIGN KEY (`nomperdant`) REFERENCES `Joueurs` (`nom`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
