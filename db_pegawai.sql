/*
SQLyog Ultimate v12.4.3 (64 bit)
MySQL - 10.1.9-MariaDB : Database - db_pegawai
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_pegawai` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `db_pegawai`;

/*Table structure for table `tb_golongan` */

DROP TABLE IF EXISTS `tb_golongan`;

CREATE TABLE `tb_golongan` (
  `id_golongan` int(10) NOT NULL,
  `gaji` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_golongan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_golongan` */

insert  into `tb_golongan`(`id_golongan`,`gaji`) values 
(1,1000),
(2,2000),
(3,3000);

/*Table structure for table `tb_jabatan` */

DROP TABLE IF EXISTS `tb_jabatan`;

CREATE TABLE `tb_jabatan` (
  `id_jabatan` int(10) NOT NULL,
  `tunjangan` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_jabatan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_jabatan` */

insert  into `tb_jabatan`(`id_jabatan`,`tunjangan`) values 
(1,100),
(2,200),
(3,300);

/*Table structure for table `tb_pegawai` */

DROP TABLE IF EXISTS `tb_pegawai`;

CREATE TABLE `tb_pegawai` (
  `id_pegawai` int(10) NOT NULL,
  `nama` varchar(30) DEFAULT NULL,
  `id_golongan` int(10) DEFAULT NULL,
  `id_jabatan` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_pegawai`),
  KEY `id_golongan` (`id_golongan`),
  KEY `id_jabatan` (`id_jabatan`),
  CONSTRAINT `tb_pegawai_ibfk_1` FOREIGN KEY (`id_golongan`) REFERENCES `tb_golongan` (`id_golongan`),
  CONSTRAINT `tb_pegawai_ibfk_2` FOREIGN KEY (`id_jabatan`) REFERENCES `tb_jabatan` (`id_jabatan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_pegawai` */

insert  into `tb_pegawai`(`id_pegawai`,`nama`,`id_golongan`,`id_jabatan`) values 
(1,'Wayan',1,1),
(2,'Made',1,1),
(3,'Nyoman',2,2),
(4,'Ketut',3,3);

/* Function  structure for function  `hitgaji` */

/*!50003 DROP FUNCTION IF EXISTS `hitgaji` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `hitgaji`(id_p int ) RETURNS int(11)
BEGIN
	DECLARE id_g,id_j,tunj,gj,gaji_total INT;
	
	SELECT id_golongan,id_jabatan INTO id_g,id_j
	FROM tb_pegawai
	WHERE id_pegawai=id_p;
	
	SELECT tunjangan INTO tunj FROM tb_jabatan
	WHERE id_jabatan=id_j;
	
	SELECT gaji INTO gj FROM tb_golongan
	WHERE id_golongan=id_g;
	
	SET gaji_total = gj+tunj;
	
	return gaji_total;
	




    END */$$
DELIMITER ;

/* Procedure structure for procedure `gaji` */

/*!50003 DROP PROCEDURE IF EXISTS  `gaji` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `gaji`( )
BEGIN
	select nama, (gaji + tunjangan) as gaji_total
	from tb_pegawai
	inner join tb_golongan on tb_pegawai.id_golongan=tb_golongan.id_golongan
	inner join tb_jabatan on tb_pegawai.id_jabatan=tb_jabatan.id_jabatan;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `hitunggaji` */

/*!50003 DROP PROCEDURE IF EXISTS  `hitunggaji` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `hitunggaji`(IN id_p INT, OUT gaji_total INT  )
BEGIN
	DECLARE id_g,id_j,tunj,gj INT;
	
	SELECT id_golongan,id_jabatan INTO id_g,id_j
	FROM tb_pegawai
	WHERE id_pegawai=id_p;
	
	SELECT tunjangan INTO tunj FROM tb_jabatan
	WHERE id_jabatan=id_j;
	
	SELECT gaji INTO gj FROM tb_golongan
	WHERE id_golongan=id_g;
	
	SET gaji_total = gj+tunj;
	
	
	END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
