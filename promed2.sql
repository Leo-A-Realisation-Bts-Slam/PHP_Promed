-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 13 mai 2023 à 12:24
-- Version du serveur : 5.7.36
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `promed2`
--

-- --------------------------------------------------------

--
-- Structure de la table `adresse`
--

DROP TABLE IF EXISTS `adresse`;
CREATE TABLE IF NOT EXISTS `adresse` (
  `id_user` int(10) NOT NULL,
  `numero` int(10) NOT NULL,
  `type_de_voie` varchar(25) NOT NULL,
  `adresse` varchar(40) NOT NULL,
  `code_postal` int(7) NOT NULL,
  `ville` varchar(50) NOT NULL,
  `departement` varchar(56) NOT NULL,
  `pays` varchar(50) NOT NULL,
  `role` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `adresse`
--

INSERT INTO `adresse` (`id_user`, `numero`, `type_de_voie`, `adresse`, `code_postal`, `ville`, `departement`, `pays`, `role`) VALUES
(4, 12, 'Avenue', '24 Jaaj', 56000, 'Vannes', '56', 'France', 'praticien'),
(5, 12, 'Route', '24 Jaaj', 56000, 'Vannes', '16', 'France', 'praticien'),
(6, 12, 'Place', '24 Jaaj', 56000, 'Vannes', '16', 'France', 'praticien'),
(7, 112, 'Place', '24 Jaaj', 56000, 'Vannes', '18', 'France', 'praticien'),
(1, 12, 'Avenue', 'Hibiscus', 56000, 'Vannes', '56', 'France', 'patient'),
(2, 12, 'Avenue', 'Hibiscus', 56000, 'Vannes', '56', 'France', 'patient'),
(3, 12, 'Avenue', 'Hibiscus', 56000, 'Vannes', '56', 'France', 'patient'),
(4, 12, 'Avenue', 'Hibiscus', 56000, 'Vannes', '56', 'France', 'patient'),
(5, 12, 'Avenue', 'Hibiscus', 56000, 'Vannes', '56', 'France', 'patient'),
(6, 112, 'Gaffe', 'Hibiscus', 56000, 'Vannes', '38', 'France', 'patient');

-- --------------------------------------------------------

--
-- Structure de la table `patient`
--

DROP TABLE IF EXISTS `patient`;
CREATE TABLE IF NOT EXISTS `patient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(20) NOT NULL,
  `mail` varchar(50) NOT NULL,
  `tel` varchar(12) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  `activite` varchar(255) NOT NULL,
  `num_secu` int(16) NOT NULL,
  `mutuelle` varchar(25) NOT NULL,
  `caisse` varchar(25) NOT NULL,
  `date_naissance` date NOT NULL,
  `genre` varchar(15) NOT NULL,
  `nom_tuteur` varchar(25) NOT NULL,
  `prenom_tuteur` varchar(25) NOT NULL,
  `mail_tuteur` varchar(255) NOT NULL,
  `tel_tuteur` varchar(255) NOT NULL,
  `nom_generaliste` varchar(25) NOT NULL,
  `prenom_generaliste` varchar(25) NOT NULL,
  `mail_generaliste` varchar(25) NOT NULL,
  `tel_generaliste` varchar(255) NOT NULL,
  `date_inscription` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `patient`
--

INSERT INTO `patient` (`id`, `nom`, `prenom`, `mail`, `tel`, `mot_de_passe`, `activite`, `num_secu`, `mutuelle`, `caisse`, `date_naissance`, `genre`, `nom_tuteur`, `prenom_tuteur`, `mail_tuteur`, `tel_tuteur`, `nom_generaliste`, `prenom_generaliste`, `mail_generaliste`, `tel_generaliste`, `date_inscription`) VALUES
(1, 'Michel', 'Dante', 'xzibit@gmail.com', '0468721345', '$2y$10$GBNUqQTlqbMGMrMjlYsgMuWVBdy.t5307UcZzJNlhK7OAN9sbaRmy', 'Cadre et profession intellectuelle supérieure', 12772237, 'Hypercash', '13', '1998-02-21', 'Masculin', 'Momo', 'Jiji', 'momo@gmail.com', '054787512', 'Sans-Plomb', 'Gilles', 'gilles@sansplomb.com', '0475878624524', '2023-05-01'),
(2, 'Louis', 'Malreau', 'JetpackTriceratops@gmail.com', '0845451212', '$2y$10$mo3g7URKIfaWi/j2HWrqD.DFLv6FOsNPfQwmrQphYwIx0QJ3p/NPu', 'Cadre et profession intellectuelle supérieure', 12772237, 'Hypercash', '13', '4000-05-21', 'Autre', 'de Michel', 'Le papa ', 'lepapadeMichel@superpapa.com', '054787512132', '', '', '', '', '2023-05-03');

-- --------------------------------------------------------

--
-- Structure de la table `praticien`
--

DROP TABLE IF EXISTS `praticien`;
CREATE TABLE IF NOT EXISTS `praticien` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_praticien` int(11) NOT NULL,
  `nom` varchar(40) NOT NULL,
  `profession` varchar(25) NOT NULL,
  `prenom` varchar(40) NOT NULL,
  `mail` varchar(40) NOT NULL,
  `tel` int(20) NOT NULL,
  `num_adelie` int(20) NOT NULL,
  `nom_cabinet` varchar(100) NOT NULL,
  `mot_de_passe` varchar(200) NOT NULL,
  `mot_de_passe_confirmation` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mail` (`mail`,`profession`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `praticien`
--

INSERT INTO `praticien` (`id`, `id_praticien`, `nom`, `profession`, `prenom`, `mail`, `tel`, `num_adelie`, `nom_cabinet`, `mot_de_passe`, `mot_de_passe_confirmation`) VALUES
(6, 0, 'Laroomba', 'Chomiste', 'John', 'laroom.john@gmail.com', 468721345, 114547, 'Laroomba', '$2y$10$s25BN2sLvDZqAL1AgEejrO2ymiwKXQDflICuegy0fjCIErbE7lW/.', NULL),
(7, 0, 'Mercier', 'Chomiste', 'Jacques', 'laroom.john@gmail.com', 468721345, 114547, 'Laroomba', '$2y$10$elWA.4TX7LXcGMJ1D.uZNu4/lCckoyhu2jMOCpK7L9G..cqhjDDVq', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `prestation`
--

DROP TABLE IF EXISTS `prestation`;
CREATE TABLE IF NOT EXISTS `prestation` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_praticien` int(11) NOT NULL,
  `nom_prestation` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `prix` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `prestation`
--

INSERT INTO `prestation` (`id`, `id_praticien`, `nom_prestation`, `description`, `prix`) VALUES
(1, 6, 'Psychiatre', 'Super Psy', 12),
(3, 6, 'Demi Bière', 'Prix en Terasse', 5);

-- --------------------------------------------------------

--
-- Structure de la table `rendez_vous`
--

DROP TABLE IF EXISTS `rendez_vous`;
CREATE TABLE IF NOT EXISTS `rendez_vous` (
  `id_patient` int(10) NOT NULL,
  `date` date NOT NULL,
  `id_praticien` int(11) NOT NULL,
  `id_prestation` int(11) NOT NULL,
  `isAnnule` tinyint(1) NOT NULL,
  `is_presentiel` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `rendez_vous`
--

INSERT INTO `rendez_vous` (`id_patient`, `date`, `id_praticien`, `id_prestation`, `isAnnule`, `is_presentiel`) VALUES
(1, '2023-02-21', 6, 3, 0, 0),
(1, '2023-12-21', 6, 1, 0, 0),
(1, '2023-06-21', 6, 3, 0, 0),
(1, '0445-05-12', 6, 1, 0, 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
