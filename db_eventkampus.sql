/*
SQLyog Ultimate v12.4.3 (64 bit)
MySQL - 10.1.9-MariaDB : Database - db_eventkampus
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_eventkampus` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `db_eventkampus`;

/*Table structure for table `tb_admin` */

DROP TABLE IF EXISTS `tb_admin`;

CREATE TABLE `tb_admin` (
  `id_admin` int(10) NOT NULL,
  `nama_admin` varchar(30) DEFAULT NULL,
  `no_hp` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_admin` */

/*Table structure for table `tb_barcode` */

DROP TABLE IF EXISTS `tb_barcode`;

CREATE TABLE `tb_barcode` (
  `id_barcode` int(10) NOT NULL,
  `barcode` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_barcode`),
  CONSTRAINT `tb_barcode_ibfk_1` FOREIGN KEY (`id_barcode`) REFERENCES `tb_lomba` (`id_lomba`),
  CONSTRAINT `tb_barcode_ibfk_2` FOREIGN KEY (`id_barcode`) REFERENCES `tb_hiburan` (`id_hiburan`),
  CONSTRAINT `tb_barcode_ibfk_3` FOREIGN KEY (`id_barcode`) REFERENCES `tb_seminar` (`id_seminar`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_barcode` */

/*Table structure for table `tb_barcode_hiburan` */

DROP TABLE IF EXISTS `tb_barcode_hiburan`;

CREATE TABLE `tb_barcode_hiburan` (
  `id_barcode` int(10) NOT NULL,
  `barcode_hiburan` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_barcode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_barcode_hiburan` */

/*Table structure for table `tb_barcode_seminar` */

DROP TABLE IF EXISTS `tb_barcode_seminar`;

CREATE TABLE `tb_barcode_seminar` (
  `id_barcode` int(10) NOT NULL,
  `barcode_seminar` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_barcode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_barcode_seminar` */

/*Table structure for table `tb_event` */

DROP TABLE IF EXISTS `tb_event`;

CREATE TABLE `tb_event` (
  `id_event` int(10) NOT NULL,
  `nama_event` varchar(30) DEFAULT NULL,
  `kategori` enum('''seminar''','''hiburan''','''lomba_lomba''') DEFAULT NULL,
  `id_admin` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_event`),
  KEY `id_admin` (`id_admin`),
  CONSTRAINT `tb_event_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `tb_admin` (`id_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_event` */

/*Table structure for table `tb_hiburan` */

DROP TABLE IF EXISTS `tb_hiburan`;

CREATE TABLE `tb_hiburan` (
  `id_hiburan` int(10) NOT NULL,
  `nama_peserta` varchar(50) DEFAULT NULL,
  `no_hp` int(12) DEFAULT NULL,
  `id_user` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_hiburan`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `tb_hiburan_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_hiburan` */

/*Table structure for table `tb_lomba` */

DROP TABLE IF EXISTS `tb_lomba`;

CREATE TABLE `tb_lomba` (
  `id_lomba` int(10) NOT NULL,
  `nama_peserta` varchar(50) DEFAULT NULL,
  `no_hp` int(12) DEFAULT NULL,
  `nama_kategori` varchar(50) DEFAULT NULL,
  `id_user` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_lomba`),
  KEY `id_user` (`nama_kategori`),
  KEY `id_user_2` (`id_user`),
  CONSTRAINT `tb_lomba_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_lomba` */

/*Table structure for table `tb_pembayaran` */

DROP TABLE IF EXISTS `tb_pembayaran`;

CREATE TABLE `tb_pembayaran` (
  `id_pembayaran` int(10) NOT NULL,
  `kode_pembayaran` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_pembayaran`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_pembayaran` */

/*Table structure for table `tb_seminar` */

DROP TABLE IF EXISTS `tb_seminar`;

CREATE TABLE `tb_seminar` (
  `id_seminar` int(10) NOT NULL,
  `nama_peserta` varchar(50) DEFAULT NULL,
  `no_hp` int(12) DEFAULT NULL,
  `konsumsi` enum('''veget''','''non veget''') DEFAULT NULL,
  `id_user` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_seminar`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `tb_seminar_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_seminar` */

/*Table structure for table `tb_user` */

DROP TABLE IF EXISTS `tb_user`;

CREATE TABLE `tb_user` (
  `id_user` int(10) NOT NULL,
  `Nama` varchar(30) DEFAULT NULL,
  `Tanggal_Lahir` date DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `id_event` int(10) DEFAULT NULL,
  `id_pembayaran` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  KEY `id_event` (`id_event`),
  KEY `id_pembayaran` (`id_pembayaran`),
  CONSTRAINT `tb_user_ibfk_1` FOREIGN KEY (`id_event`) REFERENCES `tb_event` (`id_event`),
  CONSTRAINT `tb_user_ibfk_2` FOREIGN KEY (`id_pembayaran`) REFERENCES `tb_pembayaran` (`id_pembayaran`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_user` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
