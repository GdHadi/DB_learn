/*
SQLyog Ultimate v12.4.3 (64 bit)
MySQL - 10.1.9-MariaDB : Database - db_persegi
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_persegi` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `db_persegi`;

/*Table structure for table `tb_persegi_luas` */

DROP TABLE IF EXISTS `tb_persegi_luas`;

CREATE TABLE `tb_persegi_luas` (
  `sisi` int(11) DEFAULT NULL,
  `luas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_persegi_luas` */

insert  into `tb_persegi_luas`(`sisi`,`luas`) values 
(3,9),
(9,81),
(8,64),
(7,49),
(4,16);

/* Procedure structure for procedure `luaspersegi` */

/*!50003 DROP PROCEDURE IF EXISTS  `luaspersegi` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `luaspersegi`(in psisi int )
BEGIN

	declare luas int;
	
	if psisi not in (select sisi from tb_persegi_luas) then
	set luas=psisi*psisi;
	insert into tb_persegi_luas
	values (psisi,luas);
	end if;
	



	END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
