-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : mer. 07 sep. 2022 à 06:26
-- Version du serveur :  5.7.32
-- Version de PHP : 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données : `Ecole`
--

-- --------------------------------------------------------

--
-- Structure de la table `Etudiants`
--

CREATE TABLE `Etudiants` (
  `CodeEtudiant` varchar(5) NOT NULL,
  `NomEtudiant` varchar(25) NOT NULL,
  `PrenomEtudiant` varchar(25) DEFAULT NULL,
  `DateNaissance` date DEFAULT NULL,
  `VilleEtudiant` varchar(25) DEFAULT NULL,
  `IDFiliere` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Etudiants`
--

INSERT INTO `Etudiants` (`CodeEtudiant`, `NomEtudiant`, `PrenomEtudiant`, `DateNaissance`, `VilleEtudiant`, `IDFiliere`) VALUES
('E1', 'Wengel', 'Céline', '2000-04-10', 'Lens', 2),
('E2', 'Wengel', 'Gwendoline', '2005-11-11', 'Lens', 2),
('E3', 'Wengel', 'Matthieu', '2004-08-28', 'Los-En-Gohelle', 3),
('E4', 'Damiens', 'Léa', '2005-09-12', 'Billy-Montigny', 4);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Etudiants`
--
ALTER TABLE `Etudiants`
  ADD PRIMARY KEY (`CodeEtudiant`),
  ADD KEY `IDFiliere_idx` (`IDFiliere`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Etudiants`
--
ALTER TABLE `Etudiants`
  ADD CONSTRAINT `IDFiliere` FOREIGN KEY (`IDFiliere`) REFERENCES `Filiere` (`IDFiliere`) ON DELETE SET NULL ON UPDATE SET NULL;
