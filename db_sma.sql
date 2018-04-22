/*
SQLyog Ultimate v12.4.3 (64 bit)
MySQL - 10.1.9-MariaDB : Database - db_sma
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_sma` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `db_sma`;

/*Table structure for table `tb_detail_kelas` */

DROP TABLE IF EXISTS `tb_detail_kelas`;

CREATE TABLE `tb_detail_kelas` (
  `id_detail_kelas` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_periode` bigint(20) NOT NULL,
  `id_kelas` bigint(20) NOT NULL,
  PRIMARY KEY (`id_detail_kelas`),
  KEY `id_periode` (`id_periode`),
  KEY `id_kelas` (`id_kelas`),
  CONSTRAINT `tb_detail_kelas_ibfk_1` FOREIGN KEY (`id_periode`) REFERENCES `tb_periode` (`id_periode`),
  CONSTRAINT `tb_detail_kelas_ibfk_2` FOREIGN KEY (`id_kelas`) REFERENCES `tb_kelas` (`id_kelas`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_detail_kelas` */

/*Table structure for table `tb_detail_wali` */

DROP TABLE IF EXISTS `tb_detail_wali`;

CREATE TABLE `tb_detail_wali` (
  `id_detail_wali` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_wali` bigint(20) NOT NULL,
  `id_siswa` bigint(20) NOT NULL,
  PRIMARY KEY (`id_detail_wali`),
  KEY `id_wali` (`id_wali`),
  KEY `id_siswa` (`id_siswa`),
  CONSTRAINT `tb_detail_wali_ibfk_1` FOREIGN KEY (`id_wali`) REFERENCES `tb_wali` (`id_wali`),
  CONSTRAINT `tb_detail_wali_ibfk_2` FOREIGN KEY (`id_siswa`) REFERENCES `tb_siswa` (`id_siswa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_detail_wali` */

/*Table structure for table `tb_guru` */

DROP TABLE IF EXISTS `tb_guru`;

CREATE TABLE `tb_guru` (
  `id_guru` bigint(20) NOT NULL,
  `nip` bigint(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` varchar(15) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jenis_kelamin` enum('pria','wanita') NOT NULL,
  `no_telp` bigint(12) DEFAULT NULL,
  `id_mata_pelajaran` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_guru`),
  KEY `id_mata_pelajaran` (`id_mata_pelajaran`),
  CONSTRAINT `tb_guru_ibfk_1` FOREIGN KEY (`id_mata_pelajaran`) REFERENCES `tb_mata_pelajaran` (`id_mata_pelajaran`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_guru` */

/*Table structure for table `tb_jadwal` */

DROP TABLE IF EXISTS `tb_jadwal`;

CREATE TABLE `tb_jadwal` (
  `id_jadwal` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_guru` bigint(20) NOT NULL,
  `hari` enum('senin','selasa','rabu','kamis','jumat','sabtu') NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_berakhir` time NOT NULL,
  `id_detail_kelas` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_jadwal`),
  KEY `id_detail_kelas` (`id_detail_kelas`),
  KEY `id_guru` (`id_guru`),
  CONSTRAINT `tb_jadwal_ibfk_4` FOREIGN KEY (`id_detail_kelas`) REFERENCES `tb_detail_kelas` (`id_detail_kelas`),
  CONSTRAINT `tb_jadwal_ibfk_5` FOREIGN KEY (`id_guru`) REFERENCES `tb_guru` (`id_guru`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_jadwal` */

/*Table structure for table `tb_kelas` */

DROP TABLE IF EXISTS `tb_kelas`;

CREATE TABLE `tb_kelas` (
  `id_kelas` bigint(20) NOT NULL AUTO_INCREMENT,
  `kelas` enum('10','11','12') NOT NULL,
  `jurusan` enum('IPA','IPS','Bahasa') NOT NULL,
  `indeks` varchar(5) NOT NULL,
  PRIMARY KEY (`id_kelas`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_kelas` */

/*Table structure for table `tb_mata_pelajaran` */

DROP TABLE IF EXISTS `tb_mata_pelajaran`;

CREATE TABLE `tb_mata_pelajaran` (
  `id_mata_pelajaran` bigint(20) NOT NULL AUTO_INCREMENT,
  `mata_pelajaran` varchar(50) NOT NULL,
  `keterangan` varchar(50) NOT NULL,
  PRIMARY KEY (`id_mata_pelajaran`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_mata_pelajaran` */

/*Table structure for table `tb_nilai` */

DROP TABLE IF EXISTS `tb_nilai`;

CREATE TABLE `tb_nilai` (
  `id_nilai` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_siswa` bigint(20) NOT NULL,
  `nilai` int(11) NOT NULL,
  `id_jadwal` bigint(20) NOT NULL,
  PRIMARY KEY (`id_nilai`),
  KEY `id_jadwal` (`nilai`),
  KEY `id_jadwal_2` (`id_jadwal`),
  KEY `id_siswa` (`id_siswa`),
  CONSTRAINT `tb_nilai_ibfk_1` FOREIGN KEY (`id_jadwal`) REFERENCES `tb_jadwal` (`id_jadwal`),
  CONSTRAINT `tb_nilai_ibfk_2` FOREIGN KEY (`id_siswa`) REFERENCES `tb_siswa` (`id_siswa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_nilai` */

/*Table structure for table `tb_periode` */

DROP TABLE IF EXISTS `tb_periode`;

CREATE TABLE `tb_periode` (
  `id_periode` bigint(20) NOT NULL AUTO_INCREMENT,
  `semester` int(11) NOT NULL,
  `periode1` year(4) NOT NULL,
  `periode2` year(4) NOT NULL,
  PRIMARY KEY (`id_periode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_periode` */

/*Table structure for table `tb_siswa` */

DROP TABLE IF EXISTS `tb_siswa`;

CREATE TABLE `tb_siswa` (
  `id_siswa` bigint(20) NOT NULL,
  `nis` bigint(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `jenis_kelamin` enum('pria','wanita') NOT NULL,
  `no_telp` int(12) NOT NULL,
  PRIMARY KEY (`id_siswa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_siswa` */

/*Table structure for table `tb_siswa_kelas` */

DROP TABLE IF EXISTS `tb_siswa_kelas`;

CREATE TABLE `tb_siswa_kelas` (
  `id_siswa_kelas` bigint(20) NOT NULL,
  `id_siswa` bigint(20) DEFAULT NULL,
  `id_kelas` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_siswa_kelas`),
  KEY `id_siswa` (`id_siswa`),
  KEY `id_kelas` (`id_kelas`),
  CONSTRAINT `tb_siswa_kelas_ibfk_1` FOREIGN KEY (`id_siswa`) REFERENCES `tb_siswa` (`id_siswa`),
  CONSTRAINT `tb_siswa_kelas_ibfk_2` FOREIGN KEY (`id_kelas`) REFERENCES `tb_kelas` (`id_kelas`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_siswa_kelas` */

/*Table structure for table `tb_wali` */

DROP TABLE IF EXISTS `tb_wali`;

CREATE TABLE `tb_wali` (
  `id_wali` bigint(20) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  PRIMARY KEY (`id_wali`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_wali` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
