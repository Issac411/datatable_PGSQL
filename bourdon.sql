-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Mer 11 Octobre 2017 à 17:03
-- Version du serveur :  5.7.14
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `bourdon`
--

-- --------------------------------------------------------

--
-- Structure de la table `articles`
--

CREATE TABLE `articles` (
  `id` int(11) NOT NULL,
  `id_tva` int(11) DEFAULT NULL,
  `id_categorie` int(11) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `libelle` varchar(100) DEFAULT NULL,
  `taux_tva` float DEFAULT NULL,
  `prix_unitaire_ht` float DEFAULT NULL,
  `prix_ttc` float GENERATED ALWAYS AS (((`prix_unitaire_ht` + (`prix_unitaire_ht` * (`taux_tva` / 100))) - `reduction`)) VIRTUAL,
  `disponible` tinyint(1) DEFAULT NULL,
  `reduction` float DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `articles`
--

INSERT INTO `articles` (`id`, `id_tva`, `id_categorie`, `description`, `libelle`, `taux_tva`, `prix_unitaire_ht`, `prix_ttc`, `disponible`, `reduction`) VALUES
(1, 1, 1, 'Oreiller de haute marque', 'oreiller richonson Princier', 8, 1, NULL, 1, NULL),
(2, 1, 1, 'Oreiller \'paysan\'', 'Oreiller rembourré de paille', 10, 3, NULL, 1, NULL),
(3, 1, 1, 'Oreiller Richardeau', 'oreiller en forme d\'extincteur ', 3, 13, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `libelle` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `categories`
--

INSERT INTO `categories` (`id`, `libelle`) VALUES
(1, 'coussin'),
(2, 'coussin'),
(3, 'coussin'),
(4, 'coussin');

-- --------------------------------------------------------

--
-- Structure de la table `commandes`
--

CREATE TABLE `commandes` (
  `id` int(11) NOT NULL,
  `id_client` int(11) DEFAULT NULL,
  `id_paiement` int(11) DEFAULT NULL,
  `id_tva` int(11) DEFAULT NULL,
  `montant_ht` float DEFAULT NULL,
  `frais_livraison` float DEFAULT NULL,
  `taux_tva` float DEFAULT NULL,
  `montant_ttc` float GENERATED ALWAYS AS (((`montant_ht` + (`montant_ht` * (`taux_tva` / 100))) + `frais_livraison`)) VIRTUAL,
  `date_l` date NOT NULL,
  `livree` tinyint(1) DEFAULT NULL,
  `payee` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `commandes`
--

INSERT INTO `commandes` (`id`, `id_client`, `id_paiement`, `id_tva`, `montant_ht`, `frais_livraison`, `taux_tva`, `montant_ttc`, `date_l`, `livree`, `payee`) VALUES
(1, 2, 1, 1, 30, 15, 5.5, 46.65, '2017-06-08', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `commandes_lignes`
--

CREATE TABLE `commandes_lignes` (
  `id` int(11) NOT NULL,
  `id_commande` int(11) DEFAULT NULL,
  `id_produit` int(11) DEFAULT NULL,
  `id_tva` int(11) DEFAULT NULL,
  `libelle_article` varchar(100) DEFAULT NULL,
  `quantite` int(11) DEFAULT NULL,
  `prix_unitaire_ht` float DEFAULT NULL,
  `taux_tva` float DEFAULT NULL,
  `montant_ht` float GENERATED ALWAYS AS ((`prix_unitaire_ht` * `quantite`)) VIRTUAL,
  `montant_ttc` float GENERATED ALWAYS AS (((`prix_unitaire_ht` * `quantite`) + (`quantite` * (`prix_unitaire_ht` * (`taux_tva` / 100))))) VIRTUAL,
  `type` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `tva`
--

CREATE TABLE `tva` (
  `id` int(11) NOT NULL,
  `libelle` varchar(100) NOT NULL,
  `taux` float DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `tva`
--

INSERT INTO `tva` (`id`, `libelle`, `taux`) VALUES
(1, 'taxe réduite', 5.5);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `adresse_mail` varchar(100) NOT NULL,
  `mdp` varchar(500) NOT NULL,
  `adresse1` varchar(150) NOT NULL,
  `adresse2` varchar(150) DEFAULT NULL,
  `code_postal` int(11) NOT NULL,
  `ville` varchar(50) NOT NULL,
  `num_tel` int(11) NOT NULL,
  `num_mobile` int(11) DEFAULT NULL,
  `date_naissance` date NOT NULL,
  `type` tinyint(1) NOT NULL,
  `validation` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id`, `nom`, `prenom`, `adresse_mail`, `mdp`, `adresse1`, `adresse2`, `code_postal`, `ville`, `num_tel`, `num_mobile`, `date_naissance`, `type`, `validation`) VALUES
(1, 'SANTIAGO', 'Alberto', 'Santosreal@live.fr', '098f6bcd4621d373cade4e832627b4f6', '10 rue ferret', 'porte 7', 65240, 'Champigny', 645259472, 954872951, '1987-05-02', 1, 0),
(2, 'LASALLE', 'Jean', 'Marsault@live.fr', '21232f297a57a5a743894a0e4a801fc3', '7 rue beurk', '3 ème porte', 17140, 'méville', 758642354, 655884325, '1989-09-07', 0, 1),
(3, 'LASALLE', 'Jean', 'DuBonheur@outlook.com', '21232f297a57a5a743894a0e4a801fc3', '7 rue du champignon lumineux', 'impasse', 23140, 'Savoie la hausse', 585662144, 152339542, '1972-09-02', 1, 1),
(4, 'SANTIAGO', 'Alberto', 'Santosreal@live.fr', '098f6bcd4621d373cade4e832627b4f6', '10 rue ferret', 'porte 7', 65240, 'Champigny', 645259472, 954872951, '1987-05-02', 1, 0),
(5, 'LASALLE', 'Jean', 'Marsault@live.fr', '21232f297a57a5a743894a0e4a801fc3', '7 rue beurk', '3 ème porte', 17140, 'méville', 758642354, 655884325, '1989-09-07', 0, 1),
(6, 'LASALLE', 'Jean', 'DuBonheur@outlook.com', '21232f297a57a5a743894a0e4a801fc3', '7 rue du champignon lumineux', 'impasse', 23140, 'Savoie la hausse', 585662144, 152339542, '1972-09-02', 1, 1),
(7, 'SANTIAGO', 'Alberto', 'Santosreal@live.fr', '098f6bcd4621d373cade4e832627b4f6', '10 rue ferret', 'porte 7', 65240, 'Champigny', 645259472, 954872951, '1987-05-02', 1, 0),
(8, 'LASALLE', 'Jean', 'Marsault@live.fr', '21232f297a57a5a743894a0e4a801fc3', '7 rue beurk', '3 ème porte', 17140, 'méville', 758642354, 655884325, '1989-09-07', 0, 1),
(9, 'LASALLE', 'Jean', 'DuBonheur@outlook.com', '21232f297a57a5a743894a0e4a801fc3', '7 rue du champignon lumineux', 'impasse', 23140, 'Savoie la hausse', 585662144, 152339542, '1972-09-02', 1, 1),
(10, 'SANTIAGO', 'Alberto', 'Santosreal@live.fr', '098f6bcd4621d373cade4e832627b4f6', '10 rue ferret', 'porte 7', 65240, 'Champigny', 645259472, 954872951, '1987-05-02', 1, 0),
(11, 'LASALLE', 'Jean', 'Marsault@live.fr', '21232f297a57a5a743894a0e4a801fc3', '7 rue beurk', '3 ème porte', 17140, 'méville', 758642354, 655884325, '1989-09-07', 0, 1),
(12, 'LASALLE', 'Jean', 'DuBonheur@outlook.com', '21232f297a57a5a743894a0e4a801fc3', '7 rue du champignon lumineux', 'impasse', 23140, 'Savoie la hausse', 585662144, 152339542, '1972-09-02', 1, 1),
(13, 'SANTIAGO', 'Alberto', 'Santosreal@live.fr', '098f6bcd4621d373cade4e832627b4f6', '10 rue ferret', 'porte 7', 65240, 'Champigny', 645259472, 954872951, '1987-05-02', 1, 0),
(14, 'LASALLE', 'Jean', 'Marsault@live.fr', '21232f297a57a5a743894a0e4a801fc3', '7 rue beurk', '3 ème porte', 17140, 'méville', 758642354, 655884325, '1989-09-07', 0, 1),
(15, 'LASALLE', 'Jean', 'DuBonheur@outlook.com', '21232f297a57a5a743894a0e4a801fc3', '7 rue du champignon lumineux', 'impasse', 23140, 'Savoie la hausse', 585662144, 152339542, '1972-09-02', 1, 1);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `commandes_lignes`
--
ALTER TABLE `commandes_lignes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tva`
--
ALTER TABLE `tva`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `commandes`
--
ALTER TABLE `commandes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `commandes_lignes`
--
ALTER TABLE `commandes_lignes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `tva`
--
ALTER TABLE `tva`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
