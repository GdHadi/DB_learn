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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `tb_detail_kelas` */

insert  into `tb_detail_kelas`(`id_detail_kelas`,`id_periode`,`id_kelas`) values 
(1,1,1),
(2,1,2),
(3,2,3),
(4,2,4),
(5,3,5),
(6,3,6),
(7,4,7),
(8,4,8),
(9,5,9),
(10,5,1);

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

insert  into `tb_guru`(`id_guru`,`nip`,`nama`,`alamat`,`tgl_lahir`,`jenis_kelamin`,`no_telp`,`id_mata_pelajaran`) values 
(1,201,'Audrey','Jl. Kepundung','1981-09-23','wanita',81234567831,1),
(2,202,'Nita','Jl. Kamboja','1981-08-23','wanita',81234567832,2),
(3,203,'Nurul','Jl. Suli','1981-07-21','wanita',81234567833,3),
(4,204,'Wahyu','Jl. Kerobokan','1981-07-23','pria',81234567834,4),
(5,205,'Eka','Jl. Durian','1981-03-05','pria',81234567835,5),
(6,206,'Putu','Jl. Anggur','1981-04-04','pria',81234567836,6),
(7,207,'Satria','Jl. Anggrek','1981-03-02','pria',81234567837,7),
(8,208,'Mika','Jl. Trijata','1981-08-25','wanita',81234567838,8),
(9,209,'Erva','Jl. Canggu','1981-05-24','wanita',81234567839,9),
(10,210,'Bima','Jl. Noja','1981-07-27','pria',81234567830,10);

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `tb_jadwal` */

/*Table structure for table `tb_kelas` */

DROP TABLE IF EXISTS `tb_kelas`;

CREATE TABLE `tb_kelas` (
  `id_kelas` bigint(20) NOT NULL AUTO_INCREMENT,
  `kelas` enum('10','11','12') NOT NULL,
  `jurusan` enum('IPA','IPS','Bahasa') NOT NULL,
  `indeks` varchar(5) NOT NULL,
  PRIMARY KEY (`id_kelas`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `tb_kelas` */

insert  into `tb_kelas`(`id_kelas`,`kelas`,`jurusan`,`indeks`) values 
(1,'10','Bahasa','1'),
(2,'10','IPA','2'),
(3,'10','IPS','3'),
(4,'11','Bahasa','1'),
(5,'11','IPA','2'),
(6,'11','IPS','3'),
(7,'12','Bahasa','1'),
(8,'12','IPA','2'),
(9,'12','IPS','3');

/*Table structure for table `tb_mata_pelajaran` */

DROP TABLE IF EXISTS `tb_mata_pelajaran`;

CREATE TABLE `tb_mata_pelajaran` (
  `id_mata_pelajaran` bigint(20) NOT NULL,
  `mata_pelajaran` varchar(50) NOT NULL,
  `keterangan` varchar(50) NOT NULL,
  PRIMARY KEY (`id_mata_pelajaran`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_mata_pelajaran` */

insert  into `tb_mata_pelajaran`(`id_mata_pelajaran`,`mata_pelajaran`,`keterangan`) values 
(1,'Bahasa Indonesia','K.13'),
(2,'Bahasa Bali','K.13'),
(3,'Bahasa Inggris','K.13'),
(4,'Biologi','K.13'),
(5,'Kimia','K.13'),
(6,'Fisika','K.13'),
(7,'Astronomi','K.13'),
(8,'Ekonomi','K.13'),
(9,'Sejarah','K.13'),
(10,'Sosiologi','K.13');

/*Table structure for table `tb_nilai` */

DROP TABLE IF EXISTS `tb_nilai`;

CREATE TABLE `tb_nilai` (
  `id_nilai` bigint(20) NOT NULL AUTO_INCREMENT,
  `nilai` int(11) NOT NULL,
  `id_siswa` bigint(20) NOT NULL,
  `id_guru` bigint(20) DEFAULT NULL,
  `id_detail_kelas` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_nilai`),
  KEY `id_siswa` (`nilai`),
  KEY `id_siswa_2` (`id_siswa`),
  KEY `id_detail_kelas` (`id_detail_kelas`),
  KEY `id_guru` (`id_guru`),
  CONSTRAINT `tb_nilai_ibfk_2` FOREIGN KEY (`id_siswa`) REFERENCES `tb_siswa` (`id_siswa`),
  CONSTRAINT `tb_nilai_ibfk_3` FOREIGN KEY (`id_detail_kelas`) REFERENCES `tb_detail_kelas` (`id_detail_kelas`),
  CONSTRAINT `tb_nilai_ibfk_4` FOREIGN KEY (`id_guru`) REFERENCES `tb_guru` (`id_guru`)
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `tb_periode` */

insert  into `tb_periode`(`id_periode`,`semester`,`periode1`,`periode2`) values 
(1,1,2014,2015),
(2,2,2014,2015),
(3,3,2015,2016),
(4,4,2015,2016),
(5,5,2016,2017),
(6,6,2016,2017);

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

insert  into `tb_siswa`(`id_siswa`,`nis`,`nama`,`tgl_lahir`,`alamat`,`jenis_kelamin`,`no_telp`) values 
(1,101,'Dinda','1999-02-19','Jl. Kamboja','wanita',2147483647),
(2,102,'Meli','1999-03-05','Jl. Kedondong','wanita',2147483647),
(3,103,'Kiki','1999-04-06','Jl. Suli','pria',2147483647),
(4,104,'Andi','1999-07-08','Jl. Trijata','pria',2147483647),
(5,105,'Bayu','1999-01-19','Jl. Kerobokan','pria',2147483647),
(6,106,'Krisna','1999-09-25','Jl. Padonan','pria',2147483647),
(7,107,'Mega','1999-08-07','Jl. Nuri','wanita',2147483647),
(8,108,'Widya','1999-08-05','Jl. Kamboja','wanita',2147483647),
(9,109,'Nurul','1999-02-03','Jl. Kepundung','wanita',2147483647),
(10,110,'Hidayat','1999-12-12','Jl. Imam Bonjol','pria',2147483647);

/*Table structure for table `tb_siswa_kelas` */

DROP TABLE IF EXISTS `tb_siswa_kelas`;

CREATE TABLE `tb_siswa_kelas` (
  `id_siswa_kelas` bigint(20) NOT NULL,
  `id_siswa` bigint(20) DEFAULT NULL,
  `id_detail_kelas` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_siswa_kelas`),
  KEY `id_siswa` (`id_siswa`),
  KEY `id_detail_kelas` (`id_detail_kelas`),
  CONSTRAINT `tb_siswa_kelas_ibfk_1` FOREIGN KEY (`id_siswa`) REFERENCES `tb_siswa` (`id_siswa`),
  CONSTRAINT `tb_siswa_kelas_ibfk_2` FOREIGN KEY (`id_detail_kelas`) REFERENCES `tb_detail_kelas` (`id_detail_kelas`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_siswa_kelas` */

insert  into `tb_siswa_kelas`(`id_siswa_kelas`,`id_siswa`,`id_detail_kelas`) values 
(1,1,1),
(2,2,2),
(3,3,3),
(4,4,4),
(5,5,5),
(6,6,6),
(7,7,7),
(8,8,8),
(9,9,9),
(10,10,10);

/*Table structure for table `tb_siswa_wali` */

DROP TABLE IF EXISTS `tb_siswa_wali`;

CREATE TABLE `tb_siswa_wali` (
  `id_siswa_wali` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_wali` bigint(20) NOT NULL,
  `id_siswa` bigint(20) NOT NULL,
  PRIMARY KEY (`id_siswa_wali`),
  KEY `id_wali` (`id_wali`),
  KEY `id_siswa` (`id_siswa`),
  CONSTRAINT `tb_siswa_wali_ibfk_1` FOREIGN KEY (`id_wali`) REFERENCES `tb_wali` (`id_wali`),
  CONSTRAINT `tb_siswa_wali_ibfk_2` FOREIGN KEY (`id_siswa`) REFERENCES `tb_siswa` (`id_siswa`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `tb_siswa_wali` */

insert  into `tb_siswa_wali`(`id_siswa_wali`,`id_wali`,`id_siswa`) values 
(1,1,1),
(2,1,2),
(3,2,3),
(4,2,4),
(5,3,5),
(6,3,6),
(7,4,7),
(8,4,8),
(9,5,9),
(10,5,10);

/*Table structure for table `tb_wali` */

DROP TABLE IF EXISTS `tb_wali`;

CREATE TABLE `tb_wali` (
  `id_wali` bigint(20) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  PRIMARY KEY (`id_wali`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `tb_wali` */

insert  into `tb_wali`(`id_wali`,`nama`,`alamat`,`no_telp`) values 
(1,'Bu Laksmi','Jl. Kepundung','081234567821'),
(2,'Bu Dayu','Jl. Kamboja','081234567822'),
(3,'Bu Eka','Jl. Jepun','081234567823'),
(4,'Bu Made','Jl. Kedondong','081234567824'),
(5,'Bu Rika','Jl. Trijata','081234567825');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
