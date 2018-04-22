/*
SQLyog Ultimate v12.4.3 (64 bit)
MySQL - 10.1.9-MariaDB : Database - db_market
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_market` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `db_market`;

/*Table structure for table `tb_barang` */

DROP TABLE IF EXISTS `tb_barang`;

CREATE TABLE `tb_barang` (
  `id_barang` char(5) NOT NULL,
  `nama_barang` varchar(20) DEFAULT NULL,
  `tanggal_terima` datetime DEFAULT NULL,
  `stok_barang` tinyint(3) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_barang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_barang` */

insert  into `tb_barang`(`id_barang`,`nama_barang`,`tanggal_terima`,`stok_barang`,`harga`) values 
('BRG01','Susu Ultra','2014-04-24 00:00:00',6,3000),
('BRG02','Teh Botol','2014-04-24 00:00:00',5,4000),
('BRG03','Susu Dancow','2014-04-24 00:00:00',4,5000),
('BRG04','Teh Poci','2014-04-24 00:00:00',5,3500),
('BRG09','Buavita','2014-04-24 00:00:00',10,5000),
('BRG10','Susu Milo','2014-04-24 00:00:00',4,1000),
('BRG11','Susu Bendera','2014-04-25 00:00:00',3,5000);

/*Table structure for table `tb_pelanggan` */

DROP TABLE IF EXISTS `tb_pelanggan`;

CREATE TABLE `tb_pelanggan` (
  `id_pelanggan` char(3) NOT NULL,
  `nama_pelanggan` varchar(30) DEFAULT NULL,
  `alamat` varchar(30) DEFAULT NULL,
  `jk` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`id_pelanggan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_pelanggan` */

insert  into `tb_pelanggan`(`id_pelanggan`,`nama_pelanggan`,`alamat`,`jk`) values 
('P01','Tono','Denpasar',1),
('P02','Toni','Badung',1),
('P03','Tini','Gianyar',0),
('P04','Tino','Denpasar',1),
('P05','Budo','Denpasar',1),
('P06','Wayan','Denpasar',1);

/*Table structure for table `tb_penjualan` */

DROP TABLE IF EXISTS `tb_penjualan`;

CREATE TABLE `tb_penjualan` (
  `id_penjualan` char(4) NOT NULL,
  `id_pelanggan` char(3) DEFAULT NULL,
  `tgl_penjualan` date DEFAULT NULL,
  PRIMARY KEY (`id_penjualan`),
  KEY `id_pelanggan` (`id_pelanggan`),
  CONSTRAINT `tb_penjualan_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `tb_pelanggan` (`id_pelanggan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_penjualan` */

insert  into `tb_penjualan`(`id_penjualan`,`id_pelanggan`,`tgl_penjualan`) values 
('PJ01','P01','2016-01-01'),
('PJ02','P02','2016-02-02'),
('PJ03','P01','2016-03-03');

/*Table structure for table `tb_penjualan_detail` */

DROP TABLE IF EXISTS `tb_penjualan_detail`;

CREATE TABLE `tb_penjualan_detail` (
  `id_penjualan` char(4) DEFAULT NULL,
  `id_barang` char(5) DEFAULT NULL,
  `jumlah` tinyint(3) DEFAULT NULL,
  KEY `id_penjualan` (`id_penjualan`),
  KEY `id_barang` (`id_barang`),
  CONSTRAINT `tb_penjualan_detail_ibfk_1` FOREIGN KEY (`id_penjualan`) REFERENCES `tb_penjualan` (`id_penjualan`),
  CONSTRAINT `tb_penjualan_detail_ibfk_2` FOREIGN KEY (`id_barang`) REFERENCES `tb_barang` (`id_barang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_penjualan_detail` */

insert  into `tb_penjualan_detail`(`id_penjualan`,`id_barang`,`jumlah`) values 
('PJ01','BRG10',5),
('PJ01','BRG10',1),
('PJ02','BRG01',4),
('PJ02','BRG02',2),
('PJ02','BRG03',3),
('PJ03','BRG01',4),
('PJ03','BRG03',2),
('PJ03','BRG02',3);

/* Function  structure for function  `tampil_nama` */

/*!50003 DROP FUNCTION IF EXISTS `tampil_nama` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `tampil_nama`(nobarang char (5)) RETURNS varchar(100) CHARSET latin1
BEGIN
    declare nb varchar (100);
    select nama_barang FROM tb_barang
    where id_barang=nobarang into nb;
    
    
    
    return nb;

    END */$$
DELIMITER ;

/* Procedure structure for procedure `gettest1` */

/*!50003 DROP PROCEDURE IF EXISTS  `gettest1` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `gettest1`()
BEGIN
	
	SELECT nama_barang, jumlah
	FROM tb_penjualan_detail
	JOIN tb_barang ON tb_penjualan_detail.id_barang = tb_barang.id_barang
	GROUP BY tb_barang.id_barang HAVING SUM(jumlah) > 3;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `get_nama_pelanggan` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_nama_pelanggan` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `get_nama_pelanggan`(in pelanggan_id int, out pelanggan_nama varchar (225))
BEGIN
	select name into pelanggan_nama
	from tb_pelanggan
	where id_pelanggan = pelanggan_id;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `Hapus_Kode_Barang` */

/*!50003 DROP PROCEDURE IF EXISTS  `Hapus_Kode_Barang` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Hapus_Kode_Barang`(in kode_produk_barang CHAR (5))
BEGIN
	delete from tb_barang where id_barang = kode_produk_barang;
	delete from tb_penjualan_detail where id_barang = kode_produk_barang;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `input1` */

/*!50003 DROP PROCEDURE IF EXISTS  `input1` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `input1`(in s1 int)
BEGIN	
		
		declare luas int;
		set luas=s1*s1;
		insert into tb_persegi_luas
		values (sisi,luas);
		
	END */$$
DELIMITER ;

/* Procedure structure for procedure `protoko1` */

/*!50003 DROP PROCEDURE IF EXISTS  `protoko1` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `protoko1`(in p int, in l int, in t int, out luas int)
BEGIN
	
		set luas = p*l*t;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `tambah_field_barang` */

/*!50003 DROP PROCEDURE IF EXISTS  `tambah_field_barang` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `tambah_field_barang`(id_barang char (5),nama_barang varchar (25), 
						   tanggal_terima datetime, stok_barang tinyint, 
						   harga int)
BEGIN
	
		insert into tb_barang values (id_barang,nama_barang,tanggal_terima,stok_barang,harga);
		

	END */$$
DELIMITER ;

/* Procedure structure for procedure `tampil_tb_barang` */

/*!50003 DROP PROCEDURE IF EXISTS  `tampil_tb_barang` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `tampil_tb_barang`()
BEGIN
		
		select nama_barang from tb_barang;
		
	END */$$
DELIMITER ;

/* Procedure structure for procedure `testcount` */

/*!50003 DROP PROCEDURE IF EXISTS  `testcount` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `testcount`()
BEGIN
 
 select count(*) from tb_barang;

END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
