-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 07, 2019 at 08:25 AM
-- Server version: 5.7.24
-- PHP Version: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `backoffice`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id_admin` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `prenom` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `fonction` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `role` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `locked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `credentials_expired` tinyint(1) NOT NULL,
  `credentials_expire_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_admin`),
  UNIQUE KEY `UNIQ_880E0D7692FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_880E0D76A0D96FBF` (`email_canonical`),
  UNIQUE KEY `UNIQ_880E0D76C05FB297` (`confirmation_token`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `prenom`, `email`, `fonction`, `role`, `password`, `username_canonical`, `email_canonical`, `last_login`, `enabled`, `salt`, `roles`, `locked`, `expired`, `expires_at`, `confirmation_token`, `password_requested_at`, `credentials_expired`, `credentials_expire_at`) VALUES
(1, 'Tongahasina', 'Victor', 'randriamampionona@gmail.com', 'Etudiant', 'Administrateur', '$2y$13$249JD2mH5hsd7jwpLANu7OSMeypC6qH/xN/W7ARi/I/ofHQq3p.y.', 'tongahasina', 'randriamampionona@gmail.com', '2019-10-06 18:21:16', 1, 'qm1uupq0wu84ogoww484oswkocg088k', 'a:0:{}', 0, 0, NULL, 'pATjJEPnU_xRl_WhnlY5RDicvJLzpoJ-oN-SW6hnpic', '2019-09-30 08:37:24', 0, NULL),
(2, 'Tempo One', '', 'tempo@gmail.com', '', '', '$2y$13$ulFvUOeEnRyMyLE3hsqcRO72kwRC5AM6Ttt4PZmHwXCwnR84Kg1pa', 'tempo one', 'tempo@gmail.com', '2019-10-07 09:15:12', 1, '5n52wyzg6gw0gg8s00soww4owww4s4k', 'a:0:{}', 0, 0, NULL, NULL, NULL, 0, NULL),
(8, 'Pk Junior', '', 'pk@gmail.com', '', '', '$2y$13$Sk094wp2ZZDBGN1jK1Q3.OmtZskfTuE8ofTUJnAj9eYCtYi1icky2', 'pk junior', 'randriamampiononatongahasina@gmail.com', '2019-10-03 10:54:15', 1, 'nitphc6mg6sc0o4gs8o0kg4ow8cckck', 'a:0:{}', 0, 0, NULL, 'sb2bGktQ2qy8BRzwJDuVCZy5CePSYnUp26vygsGGGC4', NULL, 0, NULL),
(11, 'rueoute', 'eqqe', 'fggsffsfs@gmail.com', 'qeeq', 'Responsable exploitation', '$2y$13$05kfL8FX.B8OERy6j7ae..wiRw9n4acRrusoB3QiuRh/aQyLC.8.C', 'rueoute', 'fggsffsfs@gmail.com', NULL, 0, '60pt1lm3a4w84gc88g08808cwck88kg', 'a:0:{}', 0, 0, NULL, 'TOOPP61L3ISe8E22QkKHOMcU7KMR7JQaS3Po2yek8bQ', NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contrainte`
--

DROP TABLE IF EXISTS `contrainte`;
CREATE TABLE IF NOT EXISTS `contrainte` (
  `id_contr` int(11) NOT NULL AUTO_INCREMENT,
  `intutile` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `priorite` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `creneauDebut` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `creneauFin` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `periodeDebut` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `periodeFin` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `jourLivraison` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `id_pdl` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_contr`),
  KEY `IDX_17925A707081DAC8` (`id_pdl`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `contrainte`
--

INSERT INTO `contrainte` (`id_contr`, `intutile`, `priorite`, `creneauDebut`, `creneauFin`, `periodeDebut`, `periodeFin`, `jourLivraison`, `id_pdl`) VALUES
(6, 'maika2', '2eme classement', '6h30', '14h30', '18/09/19', '16/11/19', 'Mardi,Jeudi,Samedi', 32),
(7, 'Livraison de collis', 'tsy azo atao', '7h', '12h00', '03/04/15', '12/05/15', 'Mardi,Mercredi,Jeudi,Vendredi', 32),
(8, 'Transport', 'Maika be', '4h20', '7h30', '12/09/18', '16/11/18', 'Lundi,Mercredi,Vendredi', 32),
(9, 'Livraison normal', 'Assez important', '6h', '18h00', '02/04/16', '24/06/16', 'Lundi,Mardi', 33),
(10, 'Livraison Week-end', 'Normal', '7h', '15h17', '20/01/16', '22/03/16', 'Jeudi,Samedi,Dimanche', 33),
(12, 'Livraisaon yaourt', 'Rapide', '6h', '8h30', '13/10/19', '16/10/19', 'Lundi,Mercredi,Vendredi', 33);

-- --------------------------------------------------------

--
-- Table structure for table `oauth2_access_tokens`
--

DROP TABLE IF EXISTS `oauth2_access_tokens`;
CREATE TABLE IF NOT EXISTS `oauth2_access_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expires_at` int(11) DEFAULT NULL,
  `scope` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_D247A21B5F37A13B` (`token`),
  KEY `IDX_D247A21B19EB6921` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth2_auth_codes`
--

DROP TABLE IF EXISTS `oauth2_auth_codes`;
CREATE TABLE IF NOT EXISTS `oauth2_auth_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `redirect_uri` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expires_at` int(11) DEFAULT NULL,
  `scope` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_A018A10D5F37A13B` (`token`),
  KEY `IDX_A018A10D19EB6921` (`client_id`),
  KEY `IDX_A018A10D642B8210` (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth2_clients`
--

DROP TABLE IF EXISTS `oauth2_clients`;
CREATE TABLE IF NOT EXISTS `oauth2_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `random_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `redirect_uris` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `secret` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `allowed_grant_types` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth2_clients`
--

INSERT INTO `oauth2_clients` (`id`, `random_id`, `redirect_uris`, `secret`, `allowed_grant_types`) VALUES
(1, '3bcbxd9e24g0gk4swg0kwgcwg4o8k8g4g888kwc44gcc0gwwk4', 'a:0:{}', '4ok2x70rlfokc8g0wws8c8kwcokw80k44sg48goc0ok4w0so0k', 'a:1:{i:0;s:8:\"password\";}');

-- --------------------------------------------------------

--
-- Table structure for table `oauth2_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth2_refresh_tokens`;
CREATE TABLE IF NOT EXISTS `oauth2_refresh_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expires_at` int(11) DEFAULT NULL,
  `scope` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_D394478C5F37A13B` (`token`),
  KEY `IDX_D394478C19EB6921` (`client_id`),
  KEY `IDX_D394478C642B8210` (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pdl`
--

DROP TABLE IF EXISTS `pdl`;
CREATE TABLE IF NOT EXISTS `pdl` (
  `id_pdl` int(11) NOT NULL AUTO_INCREMENT,
  `magasin` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `numero` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `rue` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ville` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `complement` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `id_prest` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_pdl`),
  KEY `IDX_EE253292D25A82E` (`id_prest`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pdl`
--

INSERT INTO `pdl` (`id_pdl`, `magasin`, `numero`, `code`, `rue`, `ville`, `complement`, `id_prest`) VALUES
(10, 'SORAKO', '54APS', '301', 'Sorako hotel', 'Fianarantsoa', 'Ampasambazaha', 9),
(13, 'SOPHRITE', '7609MV', '754', 'Rabezavana', 'Ambatondrazaka', 'Andoharanofotsy centre', 14),
(14, 'MITSINJO', '098', '7635MK', 'Bazaribe', 'Majunga', 'Le randez-vous', 14),
(15, 'SOABAR', '476', '987', 'Jean Ravahatra', 'Manakara', 'Maison green', 14),
(16, 'Magasin le BAZAR', '76MB', '487', 'Richard Ratsimandrava', 'Tamatave', 'Au bord de la mer', 9),
(17, 'Romyald', '809', '206', 'rue 209 Andranomahery', 'Ambanja', 'Au pallais de sport', 14),
(18, 'ADRWARE', '304', '101', 'Fjkm', 'Antananarivo', 'Soavimasoandro', 15),
(19, 'L\'ETOILE ROUGE', '201', '204', 'Centre ville', 'Antsirabe', 'Ville Bas', 15),
(20, 'Presta Shop', '8976', '301', 'rue Lamseck', 'Fianarantsoa', 'En Face de Chambre de commerce', 9),
(23, 'MADVISION', '2524', '301', 'rue cathedrale', 'Fianarantsoa', 'Andohanatady', 14),
(24, 'TORMALINE', '255HG', '301', 'Ankazobe', 'Fianarantsoa', 'Ankidona', 15),
(25, 'EX-SHOP', '2308BP', '301', 'Isaha-Ankazondrano', 'Fianarantsoa', 'A cote de la stade', 9),
(26, 'GOD AFO', '230', '490', 'Savika', 'Ambositra', 'Complexe', 11),
(28, 'adrclient', '390', '501', 'la gastro', 'Tulear', 'Sud plast', 15),
(32, 'Cyber Fast', '234LC', '101', 'rue Anosy', 'Antananarivo', '', 18),
(33, 'Magro', '728RF', '301', 'rue de la gare', 'Fiananrantsoa', 'au pres jardin publique', 18);

-- --------------------------------------------------------

--
-- Table structure for table `prestataire`
--

DROP TABLE IF EXISTS `prestataire`;
CREATE TABLE IF NOT EXISTS `prestataire` (
  `id_prest` int(11) NOT NULL AUTO_INCREMENT,
  `logo` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `entreprise` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `adresse` varchar(90) COLLATE utf8_unicode_ci NOT NULL,
  `telephone` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `siret` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `nom` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `prenom` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_prest`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `prestataire`
--

INSERT INTO `prestataire` (`id_prest`, `logo`, `entreprise`, `adresse`, `telephone`, `email`, `siret`, `nom`, `prenom`, `password`) VALUES
(1, 'e4dd29cc59c28fe6448f4e7fba54ba4d.png', 'Deliver 69', '209 Rue Tour Eiffel Paris', '+(234)567 092 28', 'deliver@erickdupountsociety.fr', 'Renovation', 'David', 'Lopez', '2345'),
(3, 'd3f10e97147c56cabc583a3c5f4dde5b.png', 'HASRP', 'Monaco centre', '022373475', 'justin@cksm.fr', 'SIRET 1', 'Justin', 'Bieber', '1234'),
(5, '00b814c755dc3ee2b7c929a260e676d7.png', 'SOCOTA', 'Antsirabe', '0344793187', 'sylver@gmail.com', 'Informatique', 'Andrianirina', 'Sylver Harris', 'sylver'),
(7, '166ba262e1049fae8925f182537dcb3a.jpeg', 'Lazan\'i Betsileo', 'Ampasambazaha Fianarantsoa 301', '+(261) 34 89 354 02', 'jeannotrod@yahoo.com', 'Fabrication du vin', 'Razaka', 'Jeennot Rodlin', 'j12390'),
(9, '8acc14b2e6df6b55d49f7d7b3425e965.png', 'TELMA', 'Soarano Manakara', '034 78 809 37', 'emilie@gmail.com', 'Appel telephonique', 'Andriniaina', 'Emilie', 'weqw'),
(11, '514acec86dc2c85f8dec6c80a8a2ee02.png', 'AFOMA', 'Ambositra Madagasicar', '034 56 654 39', 'flav@ndimb.gmail.com', 'Fabrication d\'allumette', 'Randriatsihoarana', 'Ndimbinirina Flavien', 'poiuyt'),
(12, 'cdc508022d0f14bcd6c4e245a6efb65c.png', 'COLLIS EXPRESS', 'Andrahaharo Antananarivo', '+261 34 98 765 58', 'dina@yahoo.fr', 'Transfert de collis', 'Nivomalala', 'Dina Fitiavana', '2345'),
(14, '5c4912d295657c4d60daa8eb759eb9ac.png', 'KOFIAM', 'Fasankarana Antananarivo 101', '034 56 748 89', 'jeandedieu@gmail.com', 'Transport des voyageurs', 'Rafaralahy', 'Jean de Dieu', '56788'),
(15, 'b593eadfdfcb7d2d57059bc71d5d5f1d.png', 'ADRWARE', 'Lot II 22 M Soavimasoandro Antananarivo', '034 13 493 96', 'rahajanirina@yahoo.com', 'Developpeur d\'application Android', 'Rahajanirina', 'Mamie Freddy', 'dimaria'),
(16, '6c81a433510d36976c11bd280637e925.png', 'MARGARINE', 'Allemagne', '+(223) 34 484 598', 'sunjan@email.com', 'Fabrication de beurre', 'Amadou', 'Sun Jan Abdahim', 'pkjr'),
(18, 'e7da548d20c76ecebbadbd30b387e3aa.png', 'PES', 'Espagne', '+234 938 3837', 'gorzol@yahoo.esp', 'Jeux Video Football', 'Hernadez', 'Gorzola', 'gorz');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `prenom` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `fonction` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `role` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nom`, `prenom`, `fonction`, `email`, `role`, `password`) VALUES
(1, 'Randriamampionona', 'Tongahasina Victor', 'Charge de projet', 'tongahasina@gmail.com', 'Administrateur', 'pk junior'),
(5, 'Mohamed', 'Salah', 'Joueur', 'salah@yahoo.eg', 'Administrateur', 'sala'),
(9, 'Ilaimaharitra', 'Marco', 'Joueur', 'marco@moov.fr', 'Utilisateur Tempo One', '1234'),
(11, 'Lionel', 'Messi', 'Joueur', 'messi@bar.arg', 'Responsable exploitation', 'messi10'),
(16, 'Nirimalala', 'Nathalie Edwige', 'Directrice', 'nathalie@gmail.com', 'Administrateur', 'natha12'),
(18, 'Veromanana', 'Faneva Aurelia', 'Fournisseur', 'aurelvero@gmail.com', 'Livreur', 'vero'),
(19, 'Razafimandimby', 'Lalaina', 'Collecteur', 'lalaina@yahoo.fr', 'Livreur', 'lala'),
(20, 'Raholiarimalala', 'Rindraniaina Sarah', 'Avocat', 'sara@gmail.com', 'Utilisateur Tempo One', 'sarindra'),
(21, 'Rabearilanto', 'Sarindra', 'Ministre de l\'education', 'bearlantosarindra@gmail.com', 'Responsable exploitation', 'oknbv'),
(22, 'Rakotoarisoa', 'Manjakavelo Arsene', 'Chauffeur', 'arsen@gmail.com', 'Responsable exploitation', 'nhtrewq'),
(23, 'Randrianantenaina', 'Marolahy Francis', 'Etudiant', 'francis@gmail.com', 'Responsable exploitation', 'franc');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contrainte`
--
ALTER TABLE `contrainte`
  ADD CONSTRAINT `FK_17925A707081DAC8` FOREIGN KEY (`id_pdl`) REFERENCES `pdl` (`id_pdl`) ON DELETE CASCADE;

--
-- Constraints for table `oauth2_access_tokens`
--
ALTER TABLE `oauth2_access_tokens`
  ADD CONSTRAINT `FK_D247A21B19EB6921` FOREIGN KEY (`client_id`) REFERENCES `oauth2_clients` (`id`);

--
-- Constraints for table `oauth2_auth_codes`
--
ALTER TABLE `oauth2_auth_codes`
  ADD CONSTRAINT `FK_A018A10D19EB6921` FOREIGN KEY (`client_id`) REFERENCES `oauth2_clients` (`id`);

--
-- Constraints for table `oauth2_refresh_tokens`
--
ALTER TABLE `oauth2_refresh_tokens`
  ADD CONSTRAINT `FK_D394478C19EB6921` FOREIGN KEY (`client_id`) REFERENCES `oauth2_clients` (`id`),
  ADD CONSTRAINT `FK_D394478C642B8210` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id_admin`);

--
-- Constraints for table `pdl`
--
ALTER TABLE `pdl`
  ADD CONSTRAINT `FK_EE253292D25A82E` FOREIGN KEY (`id_prest`) REFERENCES `prestataire` (`id_prest`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
