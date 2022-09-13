-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : lun. 05 sep. 2022 à 12:43
-- Version du serveur :  5.7.32
-- Version de PHP : 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données : `ecommerce`
--

-- --------------------------------------------------------

--
-- Structure de la table `entreprise`
--

CREATE TABLE `entreprise` (
  `ID` int(11) NOT NULL,
  `NOM_ENT` varchar(255) NOT NULL,
  `SIRET` int(25) NOT NULL,
  `ADRESSE` varchar(255) NOT NULL,
  `TEL` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `entreprise`
--

INSERT INTO `entreprise` (`ID`, `NOM_ENT`, `SIRET`, `ADRESSE`, `TEL`) VALUES
(1, 'APPLE', 123568941, '7 rue des Fleurs 37000 Tours', 789675643),
(3, 'IGA', 123763465, '2 rue des Vaches 62210 Henin-Beaumont', 782623949),
(4, 'MENISSEZ', 401239868, '630 RUE DANIEL GAILLARD 59750 FEIGNIES', 890109409),
(2, 'ORANGE', 123456789, '5 rue de Templiers 75008 Paris', 656327865),
(5, 'SOCIETE_GENERAL', 456234987, '24 rue de la Glissoire 62300 LENS', 723764513);

-- --------------------------------------------------------

--
-- Structure de la table `salarie`
--

CREATE TABLE `salarie` (
  `ID` int(11) NOT NULL,
  `NOM` varchar(255) NOT NULL,
  `PRENOM` varchar(255) NOT NULL,
  `AGE` int(11) NOT NULL,
  `SECU` int(11) NOT NULL,
  `ADRESSE` varchar(255) NOT NULL,
  `NOM_ENT` varchar(255) NOT NULL,
  `SEXE` varchar(255) NOT NULL,
  `SALAIRE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `salarie`
--

INSERT INTO `salarie` (`ID`, `NOM`, `PRENOM`, `AGE`, `SECU`, `ADRESSE`, `NOM_ENT`, `SEXE`, `SALAIRE`) VALUES
(1, 'WENGEL', 'Perrine', 20, 2011162498, '24 rue de Templiers 59600 MAUBEUGE', 'APPLE', 'F', 2500),
(2, 'WENGEL', 'Pascal', 44, 2011162890, '26 rue Paul-Bert 62300 LENS', 'IGA', 'M', 1800),
(3, 'WENGEL', 'Céline', 22, 2011162456, '14 rue de Londres 62300 LENS', 'SOCIETE_GENERAL', 'F', 2000),
(4, 'WENGEL', 'Gwendoline', 18, 2011162234, '21 rue L\'Arsenal 62300 LENS', 'ORANGE', 'F', 1700),
(5, 'DELETTRE', 'Estebane', 22, 10159567, '24 rue de Templiers 59600 MAUBEUGE', 'MENISSEZ', 'M', 1700),
(6, 'WENGEL', 'Benjamin', 23, 2011162657, '3 rue de Mars 62300 LENS', 'IGA', 'M', 1800),
(7, 'WENGEL', 'Sarah', 21, 2011162432, '2 rue de MARS 62300 LENS ', 'APPLE', 'F', 2500),
(8, 'WENGEL', 'Matthieu', 19, 2011162987, '2 rue de Mars 62300 LENS', 'ORANGE', 'M', 1700),
(9, 'DAMIENS', 'Léa', 19, 2011162785, '12 rue de la glissoire 62210 Henin-Beaumont', 'SOCIETE_GENERAL', 'F', 2000),
(10, 'LEFEBVRE', 'Dany', 38, 2011162273, '14 rue de lorier 62300 LENS', 'MENISSEZ', 'M', 1700);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `entreprise`
--
ALTER TABLE `entreprise`
  ADD PRIMARY KEY (`NOM_ENT`),
  ADD UNIQUE KEY `ID` (`ID`,`NOM_ENT`);

--
-- Index pour la table `salarie`
--
ALTER TABLE `salarie`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `NOM_ENT` (`NOM_ENT`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `entreprise`
--
ALTER TABLE `entreprise`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `salarie`
--
ALTER TABLE `salarie`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `salarie`
--
ALTER TABLE `salarie`
  ADD CONSTRAINT `salarie_ibfk_1` FOREIGN KEY (`NOM_ENT`) REFERENCES `entreprise` (`NOM_ENT`);
