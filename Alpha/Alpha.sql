-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : mar. 13 sep. 2022 à 13:59
-- Version du serveur :  5.7.32
-- Version de PHP : 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données : `AFDB`
--

-- --------------------------------------------------------

--
-- Structure de la table `Chantiers`
--

CREATE TABLE `Chantiers` (
  `IDChantier` int(11) NOT NULL,
  `Ville` varchar(50) DEFAULT NULL,
  `Dates` varchar(255) DEFAULT NULL,
  `IDClient` int(11) NOT NULL,
  `Facture` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Chantiers`
--

INSERT INTO `Chantiers` (`IDChantier`, `Ville`, `Dates`, `IDClient`, `Facture`) VALUES
(1, 'Lille', '29/08/22 - 30/09/22', 1, '17630€'),
(2, 'Paris', '05/09/22 - 09/09/22', 2, '3015€'),
(3, 'Poix Du Nord', '26/09/22 - 08/10/22', 3, '8310€'),
(4, 'Jenlain', '02/01/23 - 03/02/23', 4, '11213€');

-- --------------------------------------------------------

--
-- Structure de la table `Clients`
--

CREATE TABLE `Clients` (
  `IDClient` int(11) NOT NULL,
  `Nom` varchar(50) DEFAULT NULL,
  `Prenom` varchar(50) DEFAULT NULL,
  `Adresse` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Clients`
--

INSERT INTO `Clients` (`IDClient`, `Nom`, `Prenom`, `Adresse`) VALUES
(1, 'Abbott', 'Laurine', '2 rue de le Republique 59000 Lille'),
(2, 'Baker', 'Bastien', '112 avenue de la charbonniere 75008 Paris'),
(3, 'Colins', 'Ethan', '125 rue de l epee 59218 Poix Du Nord'),
(4, 'Davidson', 'Fanny', '21 rue longvic 59323 Jenlain');

-- --------------------------------------------------------

--
-- Structure de la table `Employe`
--

CREATE TABLE `Employe` (
  `IDEmploye` int(11) NOT NULL,
  `Nom` varchar(50) DEFAULT NULL,
  `Prenom` varchar(50) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `IDChantier` int(11) DEFAULT NULL,
  `IDStatus` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Employe`
--

INSERT INTO `Employe` (`IDEmploye`, `Nom`, `Prenom`, `Age`, `IDChantier`, `IDStatus`) VALUES
(1, 'BRIAN', 'Audrey', 20, 2, 2),
(2, 'PATEL', 'Tanguy', 23, 2, 1),
(3, 'RICHER', 'Fitz', 33, 1, 1),
(4, 'DOYON', 'Cedric', 40, 3, 2),
(5, 'ROCHEFORT', 'Andre', 36, 4, 3),
(6, 'GOUSSE', 'Felix', 36, 1, 1),
(7, 'GRENIER', 'Germaine', 32, 1, 2),
(8, 'FORET', 'Pascal', 44, 3, 4),
(9, 'GADIEU', 'Fred', 37, 1, 1),
(10, 'DUTRIEUX', 'Simon', 24, 2, 1),
(11, 'PLOURDE', 'Christophe', 27, 4, 1),
(12, 'DUPONT', 'Marine', 31, 2, 4),
(13, 'DUJARDIN', 'Gregoire', 35, 1, 2),
(14, 'MATH', 'Lucas', 25, 3, 3),
(15, 'GAUDRE', 'Quentin', 29, 2, 1),
(16, 'CONTENSCEAUX', 'Thomas', 22, 4, 2),
(17, 'HMID', 'Safae', 24, 3, 2);

-- --------------------------------------------------------

--
-- Structure de la table `Salaire`
--

CREATE TABLE `Salaire` (
  `IDSalaire` int(11) NOT NULL,
  `Salaire` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Salaire`
--

INSERT INTO `Salaire` (`IDSalaire`, `Salaire`) VALUES
(1, '20€/H'),
(2, '34€/H'),
(3, '22€/H'),
(4, '12€/H');

-- --------------------------------------------------------

--
-- Structure de la table `Status`
--

CREATE TABLE `Status` (
  `IDStatus` int(11) NOT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `IDSalaire` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Status`
--

INSERT INTO `Status` (`IDStatus`, `Status`, `IDSalaire`) VALUES
(1, 'OuvriersQualif', 1),
(2, 'Cadres', 2),
(3, 'Interims', 3),
(4, 'IntervenantsExt', 4);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Chantiers`
--
ALTER TABLE `Chantiers`
  ADD PRIMARY KEY (`IDChantier`),
  ADD KEY `IDClient` (`IDClient`);

--
-- Index pour la table `Clients`
--
ALTER TABLE `Clients`
  ADD PRIMARY KEY (`IDClient`);

--
-- Index pour la table `Employe`
--
ALTER TABLE `Employe`
  ADD PRIMARY KEY (`IDEmploye`),
  ADD KEY `IDChantier` (`IDChantier`),
  ADD KEY `IDStatus` (`IDStatus`);

--
-- Index pour la table `Salaire`
--
ALTER TABLE `Salaire`
  ADD PRIMARY KEY (`IDSalaire`);

--
-- Index pour la table `Status`
--
ALTER TABLE `Status`
  ADD PRIMARY KEY (`IDStatus`),
  ADD KEY `IDSalaire` (`IDSalaire`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Chantiers`
--
ALTER TABLE `Chantiers`
  ADD CONSTRAINT `chantiers_ibfk_1` FOREIGN KEY (`IDClient`) REFERENCES `Clients` (`IDClient`);

--
-- Contraintes pour la table `Employe`
--
ALTER TABLE `Employe`
  ADD CONSTRAINT `employe_ibfk_1` FOREIGN KEY (`IDChantier`) REFERENCES `Chantiers` (`IDChantier`),
  ADD CONSTRAINT `employe_ibfk_2` FOREIGN KEY (`IDStatus`) REFERENCES `Status` (`IDStatus`);

--
-- Contraintes pour la table `Status`
--
ALTER TABLE `Status`
  ADD CONSTRAINT `status_ibfk_1` FOREIGN KEY (`IDSalaire`) REFERENCES `Salaire` (`IDSalaire`),
  ADD CONSTRAINT `status_ibfk_2` FOREIGN KEY (`IDSalaire`) REFERENCES `Salaire` (`IDSalaire`);
