-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : mer. 07 sep. 2022 à 06:23
-- Version du serveur :  5.7.32
-- Version de PHP : 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données : `ExoMario`
--

-- --------------------------------------------------------

--
-- Structure de la table `Client`
--

CREATE TABLE `Client` (
  `IDClient` int(11) NOT NULL,
  `NomClient` varchar(25) NOT NULL,
  `EmailClient` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Client`
--

INSERT INTO `Client` (`IDClient`, `NomClient`, `EmailClient`) VALUES
(179, 'Mario', 'mario@mushroomy.com'),
(198, 'Peach', 'peach@mushroomy.com'),
(201, 'Mario', 'antimario@pinna.dno');

-- --------------------------------------------------------

--
-- Structure de la table `Facture`
--

CREATE TABLE `Facture` (
  `IDFacture` int(11) NOT NULL,
  `IDClient` int(11) NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Facture`
--

INSERT INTO `Facture` (`IDFacture`, `IDClient`, `Date`) VALUES
(19766, 179, '1994-08-26'),
(19789, 198, '1993-12-08'),
(19879, 179, '1993-10-07'),
(20001, 201, '1993-11-12');

-- --------------------------------------------------------

--
-- Structure de la table `LigneFacture`
--

CREATE TABLE `LigneFacture` (
  `IDFacture` int(11) NOT NULL,
  `IDProduit` int(11) NOT NULL,
  `Quantite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `LigneFacture`
--

INSERT INTO `LigneFacture` (`IDFacture`, `IDProduit`, `Quantite`) VALUES
(19879, 3, 5),
(19879, 7, 2),
(19789, 6, 3),
(19879, 2, 8),
(19766, 3, 1),
(20001, 3, 4);

-- --------------------------------------------------------

--
-- Structure de la table `Produit`
--

CREATE TABLE `Produit` (
  `IDProduit` int(11) NOT NULL,
  `NomProduit` varchar(30) NOT NULL,
  `PrixHT` int(11) NOT NULL,
  `Stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Produit`
--

INSERT INTO `Produit` (`IDProduit`, `NomProduit`, `PrixHT`, `Stock`) VALUES
(2, 'Etoile', 1, 30),
(3, 'Champi rouge', 1, 12),
(4, 'Plume', 4, 8),
(6, 'Fleur de feu', 7, 67),
(7, 'Champi vert', 4, 18);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Client`
--
ALTER TABLE `Client`
  ADD PRIMARY KEY (`IDClient`);

--
-- Index pour la table `Facture`
--
ALTER TABLE `Facture`
  ADD PRIMARY KEY (`IDFacture`),
  ADD KEY `IDClient` (`IDClient`);

--
-- Index pour la table `LigneFacture`
--
ALTER TABLE `LigneFacture`
  ADD KEY `IDFacture` (`IDFacture`),
  ADD KEY `IDProduit` (`IDProduit`);

--
-- Index pour la table `Produit`
--
ALTER TABLE `Produit`
  ADD PRIMARY KEY (`IDProduit`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Facture`
--
ALTER TABLE `Facture`
  ADD CONSTRAINT `facture_ibfk_1` FOREIGN KEY (`IDClient`) REFERENCES `Client` (`IDClient`);

--
-- Contraintes pour la table `LigneFacture`
--
ALTER TABLE `LigneFacture`
  ADD CONSTRAINT `lignefacture_ibfk_1` FOREIGN KEY (`IDFacture`) REFERENCES `Facture` (`IDFacture`),
  ADD CONSTRAINT `lignefacture_ibfk_2` FOREIGN KEY (`IDProduit`) REFERENCES `Produit` (`IDProduit`);
