/*
SQLyog Ultimate v12.4.3 (64 bit)
MySQL - 10.1.9-MariaDB : Database - db_sosial_media
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_sosial_media` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `db_sosial_media`;

/*Table structure for table `tb_group` */

DROP TABLE IF EXISTS `tb_group`;

CREATE TABLE `tb_group` (
  `id_group` int(10) NOT NULL,
  `nama_group` varchar(20) NOT NULL,
  `jenis_group` enum('''public''','''private''') NOT NULL,
  PRIMARY KEY (`id_group`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_group` */

insert  into `tb_group`(`id_group`,`nama_group`,`jenis_group`) values 
(1,'FINDING BULU BURUNG','\'private\''),
(2,'MATKUL PEMROGRAMAN','\'public\''),
(3,'MATKUL BASIS DATA','\'public\''),
(4,'MATKUL ASTI','\'public\''),
(5,'MATKUL JARKOM','\'private\''),
(6,'MATKUL SIM','\'private\'');

/*Table structure for table `tb_komentar` */

DROP TABLE IF EXISTS `tb_komentar`;

CREATE TABLE `tb_komentar` (
  `id_komentar` int(10) NOT NULL,
  `isi_komentar` text NOT NULL,
  `waktu_posting` datetime NOT NULL,
  `id_user` int(10) DEFAULT NULL,
  `id_postingan` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_komentar`),
  KEY `id_postingan` (`id_postingan`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `tb_komentar_ibfk_1` FOREIGN KEY (`id_postingan`) REFERENCES `tb_postingan` (`id_postingan`),
  CONSTRAINT `tb_komentar_ibfk_2` FOREIGN KEY (`id_postingan`) REFERENCES `tb_postingan` (`id_postingan`),
  CONSTRAINT `tb_komentar_ibfk_3` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_komentar` */

insert  into `tb_komentar`(`id_komentar`,`isi_komentar`,`waktu_posting`,`id_user`,`id_postingan`) values 
(1,'Mantap','2017-06-15 12:12:13',1,1),
(2,'Bagus','2017-07-15 12:12:14',2,2),
(3,'Mantap Gan','2017-08-15 12:12:15',3,3),
(4,'Mantap Coy','2017-09-15 12:12:16',4,4),
(5,'Astaga','2017-10-15 12:12:17',6,5),
(6,'Sadis','2017-12-15 12:18:12',7,6),
(7,'Good','2017-03-15 12:19:12',8,7),
(8,'Astaga','2017-05-15 12:22:12',1,8),
(9,'Siapp','2017-07-15 12:15:12',10,9),
(10,'Mantap','2017-08-15 12:18:12',1,10);

/*Table structure for table `tb_komentar_group` */

DROP TABLE IF EXISTS `tb_komentar_group`;

CREATE TABLE `tb_komentar_group` (
  `id_komentar_group` int(10) NOT NULL,
  `isi_kometar` text,
  `waktu_komentar_group` datetime DEFAULT NULL,
  `id_member_group` int(10) DEFAULT NULL,
  `id_postingan_group` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_komentar_group`),
  KEY `id_postingan_group` (`id_postingan_group`),
  KEY `id_member_group` (`id_member_group`),
  CONSTRAINT `tb_komentar_group_ibfk_1` FOREIGN KEY (`id_postingan_group`) REFERENCES `tb_postingan_group` (`id_postingan_group`),
  CONSTRAINT `tb_komentar_group_ibfk_2` FOREIGN KEY (`id_member_group`) REFERENCES `tb_member_group` (`id_member_group`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_komentar_group` */

/*Table structure for table `tb_like` */

DROP TABLE IF EXISTS `tb_like`;

CREATE TABLE `tb_like` (
  `id_like` int(10) NOT NULL,
  `waktu_like` datetime DEFAULT NULL,
  `id_user` int(10) DEFAULT NULL,
  `id_postingan` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_like`),
  KEY `id_user` (`waktu_like`),
  KEY `id_postingan` (`id_postingan`),
  KEY `id_user_2` (`id_user`),
  CONSTRAINT `tb_like_ibfk_1` FOREIGN KEY (`id_postingan`) REFERENCES `tb_postingan` (`id_postingan`),
  CONSTRAINT `tb_like_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_like` */

insert  into `tb_like`(`id_like`,`waktu_like`,`id_user`,`id_postingan`) values 
(1,'2017-06-15 12:12:13',2,1),
(2,'2017-06-15 12:12:15',3,2),
(3,'2017-06-15 12:12:16',4,3),
(4,'2017-06-15 12:12:17',5,4),
(5,'2017-06-15 12:12:18',6,5),
(6,'2017-06-15 12:12:19',7,6),
(7,'2017-06-15 12:12:20',8,7),
(8,'2017-06-15 12:12:21',9,8),
(9,'2017-06-15 12:12:22',1,9),
(10,'2017-06-15 12:12:23',10,10),
(11,'2017-06-15 12:12:15',2,1),
(12,'2017-06-15 12:12:17',3,12),
(13,'2017-06-15 12:12:19',4,33),
(14,'2017-06-15 12:15:17',5,44),
(15,'2017-06-15 12:16:18',6,25),
(16,'2017-06-15 12:17:19',7,26),
(17,'2017-06-15 12:19:20',8,17),
(18,'2017-06-15 12:20:21',9,38),
(19,'2017-06-15 12:21:22',1,39),
(20,'2017-06-15 12:33:23',10,40);

/*Table structure for table `tb_like_group` */

DROP TABLE IF EXISTS `tb_like_group`;

CREATE TABLE `tb_like_group` (
  `id_like_group` int(10) NOT NULL,
  `waktu_like_group` datetime DEFAULT NULL,
  `id_postingan_group` int(10) DEFAULT NULL,
  `id_member_group` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_like_group`),
  KEY `id_member_group` (`waktu_like_group`),
  KEY `id_member_group_2` (`id_member_group`),
  KEY `id_postingan_group` (`id_postingan_group`),
  CONSTRAINT `tb_like_group_ibfk_1` FOREIGN KEY (`id_postingan_group`) REFERENCES `tb_postingan_group` (`id_postingan_group`),
  CONSTRAINT `tb_like_group_ibfk_2` FOREIGN KEY (`id_postingan_group`) REFERENCES `tb_member_group` (`id_member_group`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_like_group` */

insert  into `tb_like_group`(`id_like_group`,`waktu_like_group`,`id_postingan_group`,`id_member_group`) values 
(1,'2018-03-08 17:14:50',1,1),
(2,'2018-03-25 19:38:56',2,2),
(3,'2018-03-25 19:38:53',3,3),
(4,'2018-03-25 19:38:50',6,4),
(5,'2018-03-25 19:38:47',5,6),
(6,'2018-03-25 19:38:44',4,5),
(7,'2018-03-25 19:38:40',8,7),
(8,'2018-03-25 19:38:36',9,8),
(9,'2018-03-30 19:38:23',7,9),
(10,'2018-03-25 19:41:12',10,10);

/*Table structure for table `tb_media` */

DROP TABLE IF EXISTS `tb_media`;

CREATE TABLE `tb_media` (
  `id_media` int(10) NOT NULL,
  `jenis_media` enum('''Foto''','''Video''','''Suara''','''Text''') NOT NULL,
  `path` varchar(50) DEFAULT NULL,
  `id_postingan` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_media`),
  KEY `id_user` (`path`),
  KEY `id_postingan` (`id_postingan`),
  CONSTRAINT `tb_media_ibfk_1` FOREIGN KEY (`id_postingan`) REFERENCES `tb_postingan` (`id_postingan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_media` */

insert  into `tb_media`(`id_media`,`jenis_media`,`path`,`id_postingan`) values 
(1,'\'Text\'',NULL,1),
(2,'\'Text\'',NULL,2),
(3,'\'Text\'',NULL,3),
(4,'\'Text\'',NULL,4),
(5,'\'Text\'',NULL,5),
(6,'\'Text\'',NULL,6),
(7,'\'Text\'',NULL,7),
(8,'\'Text\'',NULL,8),
(9,'\'Text\'',NULL,9),
(10,'\'Text\'',NULL,10),
(11,'\'Text\'',NULL,11),
(12,'\'Text\'',NULL,12),
(13,'\'Text\'',NULL,13),
(14,'\'Text\'',NULL,14),
(15,'\'Text\'',NULL,15),
(16,'\'Text\'',NULL,16),
(17,'\'Text\'',NULL,17),
(18,'\'Text\'',NULL,18),
(19,'\'Text\'',NULL,19),
(20,'\'Text\'',NULL,20),
(21,'\'Text\'',NULL,21),
(22,'\'Text\'',NULL,22),
(23,'\'Text\'',NULL,23),
(24,'\'Text\'',NULL,24),
(25,'\'Text\'',NULL,25),
(26,'\'Text\'',NULL,26),
(27,'\'Text\'',NULL,27),
(28,'\'Text\'',NULL,28),
(29,'\'Text\'',NULL,29),
(30,'\'Text\'',NULL,30),
(31,'\'Text\'',NULL,31),
(32,'\'Text\'',NULL,32),
(33,'\'Text\'',NULL,33),
(34,'\'Text\'',NULL,34),
(35,'\'Text\'',NULL,35),
(36,'\'Text\'',NULL,36),
(37,'\'Text\'',NULL,37),
(38,'\'Text\'',NULL,38),
(39,'\'Text\'',NULL,39),
(40,'\'Text\'',NULL,40),
(41,'\'Text\'',NULL,41),
(42,'\'Text\'',NULL,42),
(43,'\'Text\'',NULL,43),
(44,'\'Text\'',NULL,44),
(45,'\'Text\'',NULL,45),
(46,'\'Text\'',NULL,46),
(47,'\'Text\'',NULL,47),
(48,'\'Text\'',NULL,48),
(49,'\'Text\'',NULL,49),
(50,'\'Text\'',NULL,50);

/*Table structure for table `tb_media_group` */

DROP TABLE IF EXISTS `tb_media_group`;

CREATE TABLE `tb_media_group` (
  `id_media_group` int(10) DEFAULT NULL,
  `jenis_media_group` enum('''Foto'',''Video'',''Suara''') DEFAULT NULL,
  `path` varchar(30) DEFAULT NULL,
  `id_postingan_group` int(10) DEFAULT NULL,
  KEY `id_postingan_group` (`id_postingan_group`),
  CONSTRAINT `tb_media_group_ibfk_1` FOREIGN KEY (`id_postingan_group`) REFERENCES `tb_postingan_group` (`id_postingan_group`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_media_group` */

/*Table structure for table `tb_member_group` */

DROP TABLE IF EXISTS `tb_member_group`;

CREATE TABLE `tb_member_group` (
  `id_member_group` int(10) NOT NULL,
  `id_user` int(10) DEFAULT NULL,
  `id_group` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_member_group`),
  KEY `id_user` (`id_user`),
  KEY `id_group` (`id_group`),
  CONSTRAINT `tb_member_group_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id_user`),
  CONSTRAINT `tb_member_group_ibfk_2` FOREIGN KEY (`id_group`) REFERENCES `tb_group` (`id_group`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_member_group` */

insert  into `tb_member_group`(`id_member_group`,`id_user`,`id_group`) values 
(1,1,1),
(2,2,2),
(3,3,3),
(4,4,4),
(5,5,5),
(6,6,6),
(7,7,1),
(8,8,2),
(9,9,3),
(10,10,4);

/*Table structure for table `tb_postingan` */

DROP TABLE IF EXISTS `tb_postingan`;

CREATE TABLE `tb_postingan` (
  `id_postingan` int(10) NOT NULL,
  `isi` text NOT NULL,
  `waktu_postingan` datetime NOT NULL,
  `id_user` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_postingan`),
  KEY `id_user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_postingan` */

insert  into `tb_postingan`(`id_postingan`,`isi`,`waktu_postingan`,`id_user`) values 
(1,'Anak Sapi Minta Susu','2017-06-15 12:12:12',1),
(2,'Anak Sapi Minta Kambing','2017-07-15 12:12:12',2),
(3,'Anak Sapi Minta Anjing','2017-08-15 12:12:12',3),
(4,'Anak Sapi Minta Susu Coklat','2017-09-15 12:12:12',4),
(5,'Anak Sapi Minta Kucing','2017-10-15 12:12:12',5),
(6,'Anak Sapi Minta Monyet','2017-12-15 12:12:12',6),
(7,'Anak Sapi Minta Ibu','2017-03-15 12:12:12',7),
(8,'Anak Sapi Minta Ayah','2017-05-15 12:12:12',8),
(9,'Anak Sapi Minta Anak','2017-07-15 12:12:12',9),
(10,'Anak Sapi Minta Anjing','2017-08-15 12:12:12',10),
(11,'Anak Ayam Minta Susu','2017-06-11 12:12:12',2),
(12,'Anak Ayam Minta Kambing','2017-12-15 13:12:12',2),
(13,'Anak Ayam Minta Anjing','2017-08-13 14:12:12',3),
(14,'Anak Ayam Minta Susu Coklat','2017-09-14 15:12:12',4),
(15,'Anak Ayam Minta Kucing','2017-10-15 12:15:12',6),
(16,'Anak Ayam Minta Monyet','2017-12-16 12:16:12',6),
(17,'Anak Ayam Minta Ibu','2017-03-17 12:17:12',9),
(18,'Anak Ayam Minta Ayah','2017-05-18 12:18:12',8),
(19,'Anak Ayam Minta Anak','2017-07-19 12:19:12',10),
(20,'Anak Ayam Minta Anjing','2017-08-20 12:20:12',10),
(21,'Anak Monyet Minta Susu','2017-07-11 13:12:12',1),
(22,'Anak Monyet Minta Kambing','2017-08-15 13:12:12',3),
(23,'Anak Monyet Minta Anjing','2017-08-13 14:12:12',4),
(24,'Anak Monyet Minta Susu Coklat','2017-10-14 15:12:12',5),
(25,'Anak Monyet Minta Kucing','2017-11-15 12:15:12',10),
(26,'Anak Monyet Minta Monyet','2017-11-16 12:18:12',9),
(27,'Anak Monyet Minta Ibu','2017-04-17 12:26:12',5),
(28,'Anak Monyet Minta Ayah','2017-07-18 12:27:12',3),
(29,'Anak Monyet Minta Anak','2017-09-19 12:17:12',2),
(30,'Anak Monyet Minta Anjing','2017-05-20 12:18:12',2),
(31,'Anak Babi Minta Susu','2017-02-11 13:13:12',1),
(32,'Anak Babi Minta Kambing','2017-02-15 13:13:12',2),
(33,'Anak Babi Minta Anjing','2017-01-13 14:14:12',5),
(34,'Anak Babi Minta Susu Coklat','2017-11-14 15:14:12',7),
(35,'Anak Babi Minta Kucing','2017-12-15 12:17:12',10),
(36,'Anak Babi Minta Monyet','2017-12-16 12:19:12',10),
(37,'Anak Babi Minta Ibu','2017-05-17 12:30:12',6),
(38,'Anak Babi Minta Ayah','2017-06-18 12:57:12',7),
(39,'Anak Babi Minta Anak','2017-08-19 12:37:12',2),
(40,'Anak Babi Minta Anjing','2017-04-20 12:28:12',1),
(41,'Anak Tikus Minta Susu','2017-01-11 13:13:12',1),
(42,'Anak Tikus Minta Kambing','2017-03-15 13:14:12',3),
(43,'Anak Tikus Minta Anjing','2017-05-13 14:16:12',7),
(44,'Anak Tikus Minta Susu Coklat','2017-07-14 15:18:12',8),
(45,'Anak Tikus Minta Kucing','2017-08-15 12:19:12',9),
(46,'Anak Tikus Minta Monyet','2017-09-16 12:20:12',4),
(47,'Anak Tikus Minta Ibu','2017-05-17 13:30:12',3),
(48,'Anak Tikus Minta Ayah','2017-07-18 14:57:12',2),
(49,'Anak Tikus Minta Anak','2017-09-19 15:37:12',2),
(50,'Anak Tikus Minta Anjing','2017-10-20 16:28:12',6);

/*Table structure for table `tb_postingan_group` */

DROP TABLE IF EXISTS `tb_postingan_group`;

CREATE TABLE `tb_postingan_group` (
  `id_postingan_group` int(10) NOT NULL,
  `isi_postingan` text,
  `waktu_posting` datetime DEFAULT NULL,
  `id_member_group` int(10) DEFAULT NULL,
  `id_group` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_postingan_group`),
  KEY `id_member_group` (`id_member_group`),
  KEY `id_group` (`id_group`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_postingan_group` */

insert  into `tb_postingan_group`(`id_postingan_group`,`isi_postingan`,`waktu_posting`,`id_member_group`,`id_group`) values 
(1,'Diberitahukan bahwa dosen hari ini tidak mengajar','2018-04-01 17:13:56',1,1),
(2,'Diberitahukan bahwa hari ini akan dilakukan quiz\r\n','2018-03-28 17:14:06',2,2),
(3,'Diberitahukan bahwa jadwal kuliah diundur','2018-03-30 17:14:12',3,3),
(4,'Ketika kau akan menyerah, janganlah lupa bahwa setiap langkahmu bermakna\r\n','2018-03-28 17:14:19',4,4),
(5,'Mohon segera mengumpulkan tugas pada pukul 20.00','2018-03-31 17:14:25',5,5),
(6,'jangan lupa untuk segera mendafatarkan diri dalam lomba jaringan','2018-03-11 17:14:33',6,6),
(7,'Inget besok kumpul di Kober sebelum semnas','2018-02-13 17:14:40',7,1),
(8,'Untuk team FBB, mohon segera on karena akan latihan analog','2018-03-02 17:14:45',8,2),
(9,'Kuliah ditiadakan karena dosennya radang tenggorokan','2018-03-27 17:14:53',9,1),
(10,'Sekali coba akan terus ketagihan\r\n','2018-04-01 17:15:02',10,1),
(11,'Kuliah hari ini libur','2018-04-01 17:29:31',9,1),
(12,'Besok ada upacara agama','2018-04-01 17:30:13',8,1);

/*Table structure for table `tb_repost` */

DROP TABLE IF EXISTS `tb_repost`;

CREATE TABLE `tb_repost` (
  `id_repost` int(10) NOT NULL,
  `waktu_repost` datetime DEFAULT NULL,
  `id_user` int(10) DEFAULT NULL,
  `id_postingan` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_repost`),
  KEY `id_user` (`waktu_repost`),
  KEY `id_postingan` (`id_postingan`),
  KEY `id_user_2` (`id_user`),
  CONSTRAINT `tb_repost_ibfk_1` FOREIGN KEY (`id_postingan`) REFERENCES `tb_postingan` (`id_postingan`),
  CONSTRAINT `tb_repost_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_repost` */

insert  into `tb_repost`(`id_repost`,`waktu_repost`,`id_user`,`id_postingan`) values 
(1,'2017-12-01 19:53:41',1,5),
(2,'2017-12-25 19:53:50',2,7),
(3,'2017-12-22 19:54:10',3,4),
(4,'2017-12-14 19:54:28',4,6),
(5,'2017-12-28 19:54:37',6,3),
(6,'2017-12-12 19:54:47',8,2),
(7,'2018-03-30 19:54:55',7,9),
(8,'2018-01-01 19:55:06',9,1),
(9,'2018-01-25 19:55:13',10,10),
(10,'2018-01-24 19:55:21',5,4);

/*Table structure for table `tb_repost_group` */

DROP TABLE IF EXISTS `tb_repost_group`;

CREATE TABLE `tb_repost_group` (
  `id_repost_group` int(10) NOT NULL,
  `id_postingan_group` int(10) DEFAULT NULL,
  `id_member_group` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_repost_group`),
  KEY `id_post_group` (`id_postingan_group`),
  KEY `id_member_group` (`id_member_group`),
  CONSTRAINT `tb_repost_group_ibfk_1` FOREIGN KEY (`id_postingan_group`) REFERENCES `tb_postingan_group` (`id_postingan_group`),
  CONSTRAINT `tb_repost_group_ibfk_2` FOREIGN KEY (`id_member_group`) REFERENCES `tb_member_group` (`id_member_group`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_repost_group` */

insert  into `tb_repost_group`(`id_repost_group`,`id_postingan_group`,`id_member_group`) values 
(1,1,2),
(2,3,3),
(3,2,4),
(4,4,6),
(5,5,5),
(6,6,8),
(7,7,7),
(8,9,9),
(9,8,1),
(10,10,10);

/*Table structure for table `tb_teman` */

DROP TABLE IF EXISTS `tb_teman`;

CREATE TABLE `tb_teman` (
  `id_teman` int(10) NOT NULL,
  `id_user1` int(10) DEFAULT NULL,
  `id_user2` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_teman`),
  KEY `id_user1` (`id_user1`),
  KEY `id_user2` (`id_user2`),
  CONSTRAINT `tb_teman_ibfk_1` FOREIGN KEY (`id_user1`) REFERENCES `tb_user` (`id_user`),
  CONSTRAINT `tb_teman_ibfk_2` FOREIGN KEY (`id_user2`) REFERENCES `tb_user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_teman` */

insert  into `tb_teman`(`id_teman`,`id_user1`,`id_user2`) values 
(1,1,3),
(2,8,2),
(3,4,5),
(4,6,7),
(5,1,10),
(6,2,3),
(7,7,8),
(8,5,6),
(9,10,3),
(10,3,8),
(11,7,9),
(12,10,7);

/*Table structure for table `tb_user` */

DROP TABLE IF EXISTS `tb_user`;

CREATE TABLE `tb_user` (
  `id_user` int(10) NOT NULL,
  `username` varchar(30) NOT NULL,
  `ket_user` text NOT NULL,
  `nama_depan` varchar(50) DEFAULT NULL,
  `nama_belakang` varchar(50) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `foto` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_user` */

insert  into `tb_user`(`id_user`,`username`,`ket_user`,`nama_depan`,`nama_belakang`,`tgl_lahir`,`foto`) values 
(1,'KBayu','Denpasar','Krisna','Bayu','1999-01-19','foto_profil/foto1.jpg'),
(2,'Aputra','Badung','Ari','Putra','1999-02-19','foto_profil/foto2.jpg'),
(3,'YPutri','Denpasar','Yuli','Putri','1999-03-19','foto_profil/foto3.jpg'),
(4,'Arai','Gianyar','Agus','Rai','1999-04-19','foto_profil/foto4.jpg'),
(5,'YDewi','Klungkung','Yuli','Dewi','1999-05-19','foto_profil/foto5.jpg'),
(6,'JFlora','Tabanan','Jhosua','Flora','1999-06-19','foto_profil/foto6.jpg'),
(7,'AgusP','Buleleng','Agus','Putra','1999-07-19','foto_profil/foto7.jpg'),
(8,'Abang','Gianyar','Abang','None','1999-08-19','foto_profil/foto8.jpg'),
(9,'Kiki','Bangli','Kiki','Firmansyah','1999-09-19','foto_profil/foto9.jpg'),
(10,'MadeAdi','Tabanan','Made','Adi','1999-10-19','foto_profil/foto10.jpg');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
