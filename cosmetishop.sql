-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  Dim 17 nov. 2019 à 20:32
-- Version du serveur :  5.7.24
-- Version de PHP :  7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `cosmetishop`
--

-- --------------------------------------------------------

--
-- Structure de la table `a_acheter`
--

DROP TABLE IF EXISTS `a_acheter`;
CREATE TABLE IF NOT EXISTS `a_acheter` (
  `ach_id` int(11) NOT NULL AUTO_INCREMENT,
  `art_id` int(11) DEFAULT NULL,
  `ach_date` date DEFAULT NULL,
  `ach_time` time DEFAULT NULL,
  `pers_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ach_id`),
  KEY `art_id` (`art_id`),
  KEY `pers_id` (`pers_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `a_couleur`
--

DROP TABLE IF EXISTS `a_couleur`;
CREATE TABLE IF NOT EXISTS `a_couleur` (
  `aco_id` int(11) NOT NULL AUTO_INCREMENT,
  `co_id` int(11) DEFAULT NULL,
  `art_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`aco_id`),
  KEY `co_id` (`co_id`),
  KEY `art_id` (`art_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `a_couleur`
--

INSERT INTO `a_couleur` (`aco_id`, `co_id`, `art_id`) VALUES
(1, 6, 1),
(2, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `t_article`
--

DROP TABLE IF EXISTS `t_article`;
CREATE TABLE IF NOT EXISTS `t_article` (
  `art_id` int(11) NOT NULL AUTO_INCREMENT,
  `art_nom` text,
  `marque_id` varchar(30) DEFAULT NULL,
  `art_prix` double DEFAULT NULL,
  `art_image` varchar(60) DEFAULT NULL,
  `art_description` text,
  `categorie_id` varchar(30) DEFAULT NULL,
  `type_id` varchar(30) DEFAULT NULL,
  `art_stock` int(11) DEFAULT NULL,
  `art_status` int(1) DEFAULT NULL,
  PRIMARY KEY (`art_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `t_article`
--

INSERT INTO `t_article` (`art_id`, `art_nom`, `marque_id`, `art_prix`, `art_image`, `art_description`, `categorie_id`, `type_id`, `art_stock`, `art_status`) VALUES
(1, 'Lait Demaquillant Apaisant - Peaux sensibles 390ml', 'Yves Rocher', 8.95, '01.jpg', 'Ce lait Demaquillant Apaisant demaquille parfaitement et procure un reconfort immediat a la peau.<br>\r\nA l\'extrait apaisant 100% vegetal issu du Sigesbeckia Orientalis.<br>\r\nSon + : Sa texture soyeuse previent les sensations d\'inconfort liees au demaquillage.', '1', 'Lait demaquillant', 2, 1),
(2, 'Lait Demaquillant Lissant', 'Yves Rocher', 6.5, '02.jpg', 'Ce Lait Demaquillant Lissant elimine toute trace de maquillage et impuretes en douceur et lisse les traits. Enrichi en extrait de Ficoide glaciale naturellement assimilable par la peau grace a un procede dextraction 100% naturel, et cultivee en France, a La Gacilly, coeur de notre expertise botanique<br>\r\nSon + : Sa texture fluide hydratante', '1', 'Lait demaquillant', 1, 1),
(3, 'Lait Demaquillant Hydratant - Peaux normales a mixtes', NULL, 4.5, '03.jpg', 'Ce lait demaquillant frais et fondant elimine en douceur les impuretes et le maquillage. Il laisse la peau souple, hydratee et confortable.<br>\r\nEnrichi en Eau Cellulaire dEdulis, activatrice dhydratation.<br>\r\nSon + : Sa texture confortable et agreable.', '1', 'Lait demaquillant', 1, 1),
(4, 'Creme Hydratante Apaisante - Peaux Sensibles', NULL, 10.95, '04.jpg', 'Cette creme hydrate efficacement et apaise immediatement les reactions excessives de la peau.<br><br>\r\nA l\'extrait apaisant 100% vegetal issu du Sigesbeckia Orientalis.<br><br>\r\nSon + : Sa texture legere fusionne avec la peau et l\'enveloppe d\'un voile de douceur.<br><br><br><br><br><br><br>\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '1', 'Creme jour', 1, 1),
(5, 'Gel Creme Hydratation Non-Stop 48H - Pot', NULL, 9.95, '05.jpg', 'Grace a ce gel creme, la peau est immediatement gorgee d\'eau. Pendant 48h, elle est hydratee en continu, pour une peau repulpee et un teint frais. Enrichi en Eau Cellulaire dEdulis, activatrice dhydratation.<br><br>\r\nSon + : Sa texture legere et fluide penetre rapidement.<br><br>\r\nEfficacite constatee : Hydratation Non-Stop 48H*<br><br>\r\nExiste aussi en format tube 50ml.\r\n<br><br><br>', '1', 'Creme jour', 2, 1),
(6, 'Gel Creme Zero Defaut - Peaux Mixtes a Grasses', NULL, 9.95, '06.jpg', 'Ce Gel Creme Zero Defaut a la texture fraiche et legere resserre les pores, matifie la peau et affine le grain de peau. Les brillances sont controlees, pour un teint mat et uniforme. Toute la journee, la peau est hydratee. Jour apres jour, elle retrouve son equilibre, elle est plus nette et plus belle.\r\nEnrichi en poudre de The Boreal aux vertus reequilibrantes* qui agit en profondeur sur la peau pour controler les brillances, neutraliser les imperfections et affiner le grain de peau.\r\nEfficacite constatee : Immediatement la peau est matifiee pour 80% des femmes, le teint est plus frais pour 78% des femmes**', '1', 'Creme jour', 2, 1),
(7, 'Creme Regeneratrice Jour/Nuit - Tous Types de Peaux', NULL, 5.95, '07.jpg', 'Cette creme reduit immediatement les sensations de tiraillements. Les rides et ridules sont lissees.<br><br>\r\nEnrichie en Calendula aux proprietes adoucissantes et regeneratrices, elle laisse la peau douce, confortable et nourrie.<br><br>\r\nSon + : Creme riche et fondante.<br><br><br><br><br>', '1', 'Creme nuit', 400, 2),
(8, 'Grand Soin Fermete Intense 75ml - Rides & Fermete', NULL, 32.5, '08.jpg', 'Le Grand Soin Fermete Intense comble les rides meme marquees. La peau parait redensifiee, elle retrouve volume et tonicite. Enrichi en extrait surpuissant anti-rides de Ficoide Glaciale.<br><br>\r\nSon + : Sa texture surconcentree en actifs est fondante, riche et confortable. Elle hydrate et tonifie la peau pour un effet cocooning.\r\nEfficacite constatee : La peau regagne en volume: +5.4%**. Immediatement, La peau est comme lissee*, les rides sont reduites dans 91%*** des cas.<br>', '1', 'Creme nuit', 3, 1),
(9, 'Creme Anti-Rides Bienfaisante Nuit', NULL, 36.5, '09.jpg', 'Avec la Creme Anti-Rides Bienfaisante Nuit, les rides sont lissees, la peau est plus souple et confortable. Des 1 mois, la peau est nourrie et regeneree. Enrichie en Huiles Precieuses aux benefices anti-age.<br><br>\r\nSon + : Sa texture onctueuse rend votre peau douce et rebondie au reveil.<br><br>\r\nEfficacite constatee : :La peau est intensement nourrie pour 90%* des femmes. La peau est regeneree pour 87%* des femmes.<br><br>', '1', 'Creme nuit', 50, 1),
(10, 'Gelee Micellaire Demaquillante Reparation + Detox', NULL, 9.9, '10.jpg', 'Cette gelee demaquillante laisse la peau immediatement detoxifiee, lissee et eclatante.<br>\r\nL extrait surconcentre d Aphloia lutte contre les accelerateurs du vieillissement (Pollution, UV, lumiere bleue, fatigue, stress ) grace a une double action : il booste les systemes de reparation* et d anti-pollution* de la peau.\r\nSon + : Sa texture en gelee fraiche hydratante.<br>\r\nEfficacite constatee : Immediatement*, la peau est parfaitement demaquillee et detoxifiee.', '2', 'Demaquillant visage', 4, 1),
(11, 'Huile Micellaire Demaquillante - Tous Types de Peaux', NULL, 5.5, '11.jpg', 'Cette huile soyeuse et non grasse, elimine le maquillage, meme longue tenue.<br><br>\r\nEnrichie en Camomille aux proprietes adoucissantes et protectrices.<br><br>\r\nSon + : Huile soyeuse et non grasse, qui se transforme en fluide lacte au contact de l eau.<br><br><br><br><br>', '2', 'Demaquillant visage', 3, 1),
(12, 'Lingettes Demaquillantes Defroissantes', NULL, 5.95, '12.jpg', 'Ces Lingettes Demaquillantes Defroissantes eliminent toute trace de maquillage et d impuretes en un clin d oeil, defroissent les traits, lissent la peau et la rehydratent intensement.<br><br>\r\nSon + : Leur texture douce comme un coton<br><br><br><br><br><br><br>', '2', 'Demaquillant visage', 3, 1),
(13, 'Poudre Peau Parfaite - Zero Defaut', NULL, 12.95, '13.jpg', 'Pour un teint matifie zero defaut au grain de peau pres.<br><br>\r\nLa poudre Zero Defaut est une poudre a la texture ultrafine pour un teint naturellement unifie et matifie.<br><br>\r\nGrace a son toucher soyeux elle sublime le teint tout en transparence pour une sensation de confort.<br><br>\r\nLe grain de peau est affine la peau est plus belle.<br><br>\r\nSon + : Texture fusionnelle<br>\r\nEnrichie en Poudre de Bambou aux proprietes matifiantes<br><br>', '2', 'Poudre', 1, 1),
(14, 'Poudre Libre Pure Light', NULL, 12.95, '14.jpg', 'Une poudre libre qui fixe et illumine le maquillage sans brillance. Sa texture ultra fine enrichie en Extrait de Riz laisse la peau respirer pour reveler l eclat naturel du teint tout en transparence. Le teint est aerien, naturellement lumineux tout au long de la journee.<br><br><br>\r\nSon +: Une application tout en douceur grace a sa houppette en coton glissee dans le boitier.<br><br><br><br><br><br>', '2', 'Poudre', 1, 1),
(15, 'Duo Poudre Soleil', NULL, 15.95, '15.jpg', 'Pour un teint sublime naturellement ensoleille.\r\nUn duo de teintes complementaires qui rechauffent naturellement toutes les carnations . Le Duo poudre soleil permet de creer un hale sur mesure adapte a l evolution du bronzage pour un teint naturellement ensoleille.<br>\r\nNous avons elargi notre gamme de teintes! Pour les adeptes de notre ancienne Duo Poudre Soleil, voici comment retrouver votre teinte adoree :\r\n- Hale leger de l ancienne Duo Poudre Soleil, nous vous conseillons maintenant la teinte Hale Moyen.<br>\r\n- Hale mat de l ancienne Duo Poudre Soleil, nous vous conseillons maintenant la teinte Hale Dore.', '2', 'Poudre', 1, 1),
(16, 'Fond de teint Peau Parfaite 14h* - Zero Defaut', NULL, 15.5, '16.jpg', 'Vous recherchez un fond de teint longue tenue qui camoufle vos imperfections ?\r\nLe Fond de Teint Peau Parfaite 14h** Zero Defaut* est pour vous.<br>\r\nNos chercheurs en Cosmetique Vegetale ont elabore les pigments Fusion Vegetal <br>- Mineral pour les integrer au cour d un fond de teint createur de peau parfaite.\r\nSa texture ultra fine fusionne parfaitement avec la peau pour devenir imperceptible et reveler un resultat Zero Defaut* au grain de peau pres. Le teint est irreprochable 14h** durant.\r\n- Teint parfait au grain de peau pres<br>\r\n- Longue Tenue<br>\r\nSon + : Sa texture ultra fine fusionne parfaitement avec la peau pour devenir imperceptible et reveler un resultat Zero Defaut* quelle que soit sa carnation.', '2', 'Fond de teint', 3, 1),
(17, 'Fond de Teint Creme Haute Couvrance - Zero Defaut', NULL, 11.95, '17.jpg', 'Le Fond de Teint Creme Haute Couvrance est une creme de teint reconfortante qui allie la haute couvrance d un fond de teint tenue 12h* et le confort d un soin pour une peau douce, nourrie et un teint parfaitement unifie, tout au long de la journee. Parce qu on a toutes besoin de douceur !<br><br><br>\r\nEnrichi en huile aux 1000 roses apaisante, elle convient a toutes les saisons, tous les moments, et aux peaux les plus seches.\r\nVous etiez fan du Teint Creme Confort ? Il s agit de la meme formule dans un tout nouveau format ! Disponible en 6 teintes. Existe egalement en format pot en 11 teintes<br><br><br><br>', '2', 'Fond de teint', 3, 1),
(18, 'Teint Rayonnant Jeunesse', NULL, 17.95, '18.jpg', 'Vous recherchez un fond de teint lissant ?\r\nLe fond de teint Teint Rayonnant Jeunesse est pour vous.\r\nNos chercheurs en Cosmetique Vegetale ont introduit au coeur d un fond de teint la premiere nacre lissante* a la Cire de Rose au pouvoir de correction optique du teint pour un effet jeunesse immediat.\r\nSa texture creme fluide veloutee fond sur la peau pour une sensation de confort toute la journee et une couvrance optimale.<br>\r\nInstantanement la peau est plus lisse le teint rayonne de jeunesse.<br><br>\r\n- Teint rayonnant<br>\r\n- Peau lissee<br>\r\n- Effet jeunesse immediat<br><br>\r\nSon + : Son flacon pompe qui delivre la juste dose de produit.<br><br>', '2', 'Fond de teint', 3, 1),
(19, 'Reparation - Apres-Shampooing Baume', NULL, 5.9, '19.jpg', 'Reparation - Apres-Shampooing Baume 5,90\r\nCet Apres-Shampooing Baume a l huile de Jojoba redonne substance a la fibre capillaire pour la restructurer demele et efface les dommages passes. Reparee, elle devient plus resistante pour lutter contre les futures agressions.<br><br>\r\nEt comme de beaux cheveux commencent par un cuir chevelu sain nous avons integre au coeur de chaque formule les fructanes d Agave. Cet actif inedit en cosmetique double la microcirculation* du cuir chevelu pour permettre au cheveu de pousser plus fort et plus beau.<br><br>', '3', 'Cheveux secs', 3, 1),
(20, 'Nutrition - Creme De Jour', NULL, 12.9, '20.jpg', 'Cette Creme de Jour a l huile d Avocat, riche en acides gras essentiels apporte au cheveu les elements nutritifs indispensables pour retablir son equilibre en lipides et le maintenir pendant 24h.<br><br>\r\nEt comme de beaux cheveux commencent par un cuir chevelu sain nous avons integre au coeur de chaque formule les fructanes d Agave. Cet actif inedit en cosmetique double la microcirculation* du cuir chevelu pour permettre au cheveu de pousser plus fort et plus beau.<br<br>\r\nEfficacite constatee : nutrition 24H sans alourdir et sans graisser**<br><br>', '3', 'Cheveux secs', 3, 1),
(21, 'Purete - Masque Absorbant Pre-Shampooing', NULL, 12.9, '21.jpg', 'Ce Masque Absorbant Pre-Shampooing a l Ortie purifiante cible et absorbe l exces de sebum produit par le cuir chevelu. Il agit sur la cause des cheveux gras, pour un cuir chevelu libere du sebum sur le long terme.\r\nEt comme de beaux cheveux commencent par un cuir chevelu sain, nous avons integre au coeur de chaque formule les fructanes d Agave. Cet actif inedit en cosmetique double la microcirculation* du cuir chevelu pour permettre au cheveu de pousser plus fort et plus beau.<br>\r\nSon + : Sa texture argile qui s utilise avant le shampooing pour absorber le sebum accumule par le cuir chevelu.', '3', 'Cheveux secs', 3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `t_categorie`
--

DROP TABLE IF EXISTS `t_categorie`;
CREATE TABLE IF NOT EXISTS `t_categorie` (
  `categorie_id` int(11) NOT NULL AUTO_INCREMENT,
  `categorie_nom` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`categorie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `t_categorie`
--

INSERT INTO `t_categorie` (`categorie_id`, `categorie_nom`) VALUES
(1, 'Soin Visage'),
(2, 'Maquillage'),
(3, 'Parfum'),
(4, 'Corps et douche'),
(5, 'Cheveux');

-- --------------------------------------------------------

--
-- Structure de la table `t_couleur`
--

DROP TABLE IF EXISTS `t_couleur`;
CREATE TABLE IF NOT EXISTS `t_couleur` (
  `co_id` int(11) NOT NULL AUTO_INCREMENT,
  `co_nom` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`co_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `t_couleur`
--

INSERT INTO `t_couleur` (`co_id`, `co_nom`) VALUES
(1, 'Bleu'),
(2, 'Rouge'),
(3, 'Noir'),
(4, 'Blanc'),
(5, 'Vert'),
(6, 'Jaune');

-- --------------------------------------------------------

--
-- Structure de la table `t_marque`
--

DROP TABLE IF EXISTS `t_marque`;
CREATE TABLE IF NOT EXISTS `t_marque` (
  `marque_id` int(11) NOT NULL AUTO_INCREMENT,
  `marque_nom` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`marque_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `t_marque`
--

INSERT INTO `t_marque` (`marque_id`, `marque_nom`) VALUES
(1, 'Ushuaia'),
(2, 'Dove'),
(3, 'Nivea'),
(4, 'YvesRochers');

-- --------------------------------------------------------

--
-- Structure de la table `t_personne`
--

DROP TABLE IF EXISTS `t_personne`;
CREATE TABLE IF NOT EXISTS `t_personne` (
  `pers_id` int(11) NOT NULL AUTO_INCREMENT,
  `pers_nom` varchar(100) DEFAULT NULL,
  `pers_email` varchar(100) DEFAULT NULL,
  `pers_contact` tinytext,
  `pers_mdp` longtext,
  PRIMARY KEY (`pers_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `t_personne`
--

INSERT INTO `t_personne` (`pers_id`, `pers_nom`, `pers_email`, `pers_contact`, `pers_mdp`) VALUES
(1, 'RAMANANANTSALAMA Nariniaina', 'nariniaina.ramanantsalama@esti.mg', '0346035685', 'uiop'),
(2, 'RAKOTOMANANA Falitiana', 'faly.rakotomanana@esti.mg', '0343490345', 'fade');

-- --------------------------------------------------------

--
-- Structure de la table `t_type`
--

DROP TABLE IF EXISTS `t_type`;
CREATE TABLE IF NOT EXISTS `t_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `categorie_id` int(11) DEFAULT NULL,
  `type_nom` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`type_id`),
  KEY `categorie_id` (`categorie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `t_type`
--

INSERT INTO `t_type` (`type_id`, `categorie_id`, `type_nom`) VALUES
(1, 1, 'Eau micellaire'),
(2, 1, 'Lait demaquillant'),
(3, 1, 'Creme jour'),
(4, 1, 'Creme nuit');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(30) DEFAULT NULL,
  `LastName` varchar(30) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `Hometown` varchar(30) DEFAULT NULL,
  `Job` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `FirstName`, `LastName`, `Age`, `Hometown`, `Job`) VALUES
(1, 'Peter', 'Griffin', 41, 'Quahog', 'Brewery'),
(2, 'Lois', 'Griffin', 40, 'Newport', 'Piano Teacher'),
(3, 'Joseph', 'Swanson', 39, 'Quahog', 'Police Officer'),
(4, 'Glenn', 'Quagmire', 41, 'Quahog', 'Pilot');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `a_acheter`
--
ALTER TABLE `a_acheter`
  ADD CONSTRAINT `a_acheter_ibfk_1` FOREIGN KEY (`art_id`) REFERENCES `t_article` (`art_id`),
  ADD CONSTRAINT `a_acheter_ibfk_2` FOREIGN KEY (`pers_id`) REFERENCES `t_personne` (`pers_id`);

--
-- Contraintes pour la table `a_couleur`
--
ALTER TABLE `a_couleur`
  ADD CONSTRAINT `a_couleur_ibfk_1` FOREIGN KEY (`co_id`) REFERENCES `t_couleur` (`co_id`),
  ADD CONSTRAINT `a_couleur_ibfk_2` FOREIGN KEY (`art_id`) REFERENCES `t_article` (`art_id`);

--
-- Contraintes pour la table `t_type`
--
ALTER TABLE `t_type`
  ADD CONSTRAINT `t_type_ibfk_1` FOREIGN KEY (`categorie_id`) REFERENCES `t_categorie` (`categorie_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
