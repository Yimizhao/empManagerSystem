/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.7.21-log : Database - ssm_crud
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ssm_crud` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ssm_crud`;

/*Table structure for table `tbl_dept` */

DROP TABLE IF EXISTS `tbl_dept`;

CREATE TABLE `tbl_dept` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(255) NOT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_dept` */

insert  into `tbl_dept`(`dept_id`,`dept_name`) values (1,'开发部'),(2,'测试部');

/*Table structure for table `tbl_emp` */

DROP TABLE IF EXISTS `tbl_emp`;

CREATE TABLE `tbl_emp` (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_name` varchar(255) NOT NULL,
  `gender` char(1) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `d_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `fk_emp_dept` (`d_id`),
  CONSTRAINT `fk_emp_dept` FOREIGN KEY (`d_id`) REFERENCES `tbl_dept` (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=404 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_emp` */

insert  into `tbl_emp`(`emp_id`,`emp_name`,`gender`,`email`,`d_id`) values (1,'何东','M','hedong@yds.com',1),(2,'何西','M','hexi@yds.com',2),(3,'丽丽','F','lili@yds.com',2),(207,'王海峰','M','5202725@yds.com',2),(208,'a7fb1','M','a7fb1@yds.com',1),(209,'97f59','F','97f59@yds.com',1),(210,'337f1','F','337f1@yds.com',1),(211,'116b8','F','116b8@yds.com',1),(212,'8a68b','F','8a68b@yds.com',1),(213,'3f94d','F','3f94d@yds.com',1),(214,'00fb7','F','00fb7@yds.com',1),(215,'0865b','F','0865b@yds.com',1),(216,'47459','F','47459@yds.com',1),(217,'4e016','F','4e016@yds.com',1),(218,'36119','F','36119@yds.com',1),(219,'75186','F','75186@yds.com',1),(220,'eccc4','F','eccc4@yds.com',1),(221,'ba6da','F','ba6da@yds.com',1),(222,'54c79','F','54c79@yds.com',1),(223,'8bc5b','F','8bc5b@yds.com',1),(224,'9aec4','F','9aec4@yds.com',1),(225,'5f715','F','5f715@yds.com',1),(226,'3d615','F','3d615@yds.com',1),(227,'309a1','F','309a1@yds.com',1),(228,'0a40f','F','0a40f@yds.com',1),(229,'bf69f','F','bf69f@yds.com',1),(230,'8e240','F','8e240@yds.com',1),(231,'b7338','F','b7338@yds.com',1),(232,'6d733','F','6d733@yds.com',1),(233,'18b25','F','18b25@yds.com',1),(234,'62d21','F','62d21@yds.com',1),(235,'73589','F','73589@yds.com',1),(236,'ca8ad','F','ca8ad@yds.com',1),(237,'4c22f','F','4c22f@yds.com',1),(238,'e1d1e','F','e1d1e@yds.com',1),(239,'24309','F','24309@yds.com',1),(240,'4949c','F','4949c@yds.com',1),(241,'1beac','F','1beac@yds.com',1),(242,'2aea0','F','2aea0@yds.com',1),(243,'46108','F','46108@yds.com',1),(244,'0793f','F','0793f@yds.com',1),(245,'1ef61','F','1ef61@yds.com',1),(246,'b0644','F','b0644@yds.com',1),(247,'795c4','F','795c4@yds.com',1),(248,'0b32c','F','0b32c@yds.com',1),(249,'45b42','F','45b42@yds.com',1),(250,'4b025','F','4b025@yds.com',1),(251,'4a649','F','4a649@yds.com',1),(252,'b0cdb','F','b0cdb@yds.com',1),(253,'1a1f9','F','1a1f9@yds.com',1),(254,'19ddd','F','19ddd@yds.com',1),(255,'351ae','F','351ae@yds.com',1),(256,'63221','F','63221@yds.com',1),(257,'76fb7','F','76fb7@yds.com',1),(258,'db442','F','db442@yds.com',1),(259,'46752','F','46752@yds.com',1),(260,'15139','F','15139@yds.com',1),(261,'c8b3c','F','c8b3c@yds.com',1),(262,'5b5c2','F','5b5c2@yds.com',1),(263,'03349','F','03349@yds.com',1),(264,'ca36c','F','ca36c@yds.com',1),(265,'e3419','F','e3419@yds.com',1),(266,'1ecf8','F','1ecf8@yds.com',1),(267,'cb938','F','cb938@yds.com',1),(268,'46649','F','46649@yds.com',1),(269,'5686f','F','5686f@yds.com',1),(270,'564d2','F','564d2@yds.com',1),(271,'27615','F','27615@yds.com',1),(272,'4be68','F','4be68@yds.com',1),(273,'638d3','F','638d3@yds.com',1),(274,'b54b2','F','b54b2@yds.com',1),(275,'973ea','F','973ea@yds.com',1),(276,'41a70','F','41a70@yds.com',1),(277,'bd9b7','F','bd9b7@yds.com',1),(278,'81c71','F','81c71@yds.com',1),(279,'92a7d','F','92a7d@yds.com',1),(280,'efe42','F','efe42@yds.com',1),(281,'d2e25','F','d2e25@yds.com',1),(282,'e717f','F','e717f@yds.com',1),(283,'e2889','F','e2889@yds.com',1),(284,'68e52','F','68e52@yds.com',1),(285,'b2b50','F','b2b50@yds.com',1),(286,'9e372','F','9e372@yds.com',1),(287,'05356','F','05356@yds.com',1),(288,'f6299','F','f6299@yds.com',1),(289,'10bc4','F','10bc4@yds.com',1),(290,'3e97e','F','3e97e@yds.com',1),(291,'c8bd3','F','c8bd3@yds.com',1),(292,'820e3','F','820e3@yds.com',1),(293,'6f0be','F','6f0be@yds.com',1),(294,'f2f3c','F','f2f3c@yds.com',1),(295,'31048','F','31048@yds.com',1),(296,'175df','F','175df@yds.com',1),(297,'4ebc4','F','4ebc4@yds.com',1),(298,'3f654','F','3f654@yds.com',1),(299,'71d49','F','71d49@yds.com',1),(300,'87130','F','87130@yds.com',1),(301,'9ccdf','F','9ccdf@yds.com',1),(302,'ecb1f','F','ecb1f@yds.com',1),(303,'add6d','F','add6d@yds.com',1),(304,'fcf5d','F','fcf5d@yds.com',1),(305,'57f79','F','57f79@yds.com',1),(306,'f72bb','F','f72bb@yds.com',1),(307,'0439f','F','0439f@yds.com',1),(308,'bad6a','F','bad6a@yds.com',1),(309,'15ec0','F','15ec0@yds.com',1),(310,'beaf0','F','beaf0@yds.com',1),(311,'5c72f','F','5c72f@yds.com',1),(312,'fc4c2','F','fc4c2@yds.com',1),(313,'9fe1d','F','9fe1d@yds.com',1),(314,'df409','F','df409@yds.com',1),(315,'94508','F','94508@yds.com',1),(316,'4e4e7','F','4e4e7@yds.com',1),(317,'f983e','F','f983e@yds.com',1),(318,'ff91b','F','ff91b@yds.com',1),(319,'e47eb','F','e47eb@yds.com',1),(320,'8a671','F','8a671@yds.com',1),(321,'f0384','F','f0384@yds.com',1),(322,'f5b62','F','f5b62@yds.com',1),(323,'4d3e2','F','4d3e2@yds.com',1),(324,'436e4','F','436e4@yds.com',1),(325,'116f7','F','116f7@yds.com',1),(326,'17717','F','17717@yds.com',1),(327,'77e81','F','77e81@yds.com',1),(328,'c8442','F','c8442@yds.com',1),(329,'85542','F','85542@yds.com',1),(330,'937e3','F','937e3@yds.com',1),(331,'35cc0','F','35cc0@yds.com',1),(332,'e30d3','F','e30d3@yds.com',1),(333,'b433f','F','b433f@yds.com',1),(334,'3891b','F','3891b@yds.com',1),(335,'4b9dd','F','4b9dd@yds.com',1),(336,'4ad1c','F','4ad1c@yds.com',1),(337,'38733','F','38733@yds.com',1),(338,'8a4d8','F','8a4d8@yds.com',1),(339,'68cd5','F','68cd5@yds.com',1),(340,'b2c94','F','b2c94@yds.com',1),(341,'10310','F','10310@yds.com',1),(342,'08b15','F','08b15@yds.com',1),(343,'ae019','F','ae019@yds.com',1),(344,'0d31a','F','0d31a@yds.com',1),(345,'063e7','F','063e7@yds.com',1),(346,'7a98a','F','7a98a@yds.com',1),(347,'21406','F','21406@yds.com',1),(348,'33643','F','33643@yds.com',1),(349,'161da','F','161da@yds.com',1),(350,'bd6e5','F','bd6e5@yds.com',1),(351,'85305','F','85305@yds.com',1),(352,'6afb3','F','6afb3@yds.com',1),(353,'6aeec','F','6aeec@yds.com',1),(354,'b31bb','F','b31bb@yds.com',1),(355,'dc8b1','F','dc8b1@yds.com',1),(356,'9db8d','F','9db8d@yds.com',1),(357,'4679f','F','4679f@yds.com',1),(358,'d4620','F','d4620@yds.com',1),(359,'e540a','F','e540a@yds.com',1),(360,'e997c','F','e997c@yds.com',1),(361,'3379c','F','3379c@yds.com',1),(362,'667de','F','667de@yds.com',1),(363,'33e14','F','33e14@yds.com',1),(364,'a7b62','F','a7b62@yds.com',1),(365,'94217','F','94217@yds.com',1),(366,'4c9a2','F','4c9a2@yds.com',1),(367,'1777d','F','1777d@yds.com',1),(368,'03970','F','03970@yds.com',1),(369,'9682b','F','9682b@yds.com',1),(370,'9cc1b','F','9cc1b@yds.com',1),(371,'3d514','F','3d514@yds.com',1),(372,'5f5a1','F','5f5a1@yds.com',1),(373,'670dc','F','670dc@yds.com',1),(374,'8647f','F','8647f@yds.com',1),(375,'d2059','F','d2059@yds.com',1),(376,'a6cfd','F','a6cfd@yds.com',1),(377,'a67d2','F','a67d2@yds.com',1),(378,'9afde','F','9afde@yds.com',1),(379,'3aef7','F','3aef7@yds.com',1),(380,'f7c16','F','f7c16@yds.com',1),(381,'c08bd','F','c08bd@yds.com',1),(382,'b936c','F','b936c@yds.com',1),(383,'41d7b','F','41d7b@yds.com',1),(384,'8f6ae','F','8f6ae@yds.com',1),(385,'c6959','F','c6959@yds.com',1),(386,'dba4e','F','dba4e@yds.com',1),(387,'482dd','F','482dd@yds.com',1),(388,'c39ac','F','c39ac@yds.com',1),(389,'02f46','F','02f46@yds.com',1),(390,'3c993','F','3c993@yds.com',1),(391,'47f5d','F','47f5d@yds.com',1),(392,'664fa','F','664fa@yds.com',1),(393,'0df5d','F','0df5d@yds.com',1),(394,'c60b8','F','c60b8@yds.com',1),(395,'7e399','F','7e399@yds.com',1),(396,'6a82c','F','6a82c@yds.com',1),(397,'ac248','F','ac248@yds.com',1),(398,'b89dc','F','b89dc@yds.com',1),(399,'adc7f','F','adc7f@yds.com',1),(400,'74910','F','74910@yds.com',1),(401,'f97a6','F','f97a6@yds.com',1),(402,'b74ff','F','b74ff@yds.com',1),(403,'99263','F','99263@yds.com',1);

/*Table structure for table `tbl_employee` */

DROP TABLE IF EXISTS `tbl_employee`;

CREATE TABLE `tbl_employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_name` varchar(30) NOT NULL,
  `gender` char(1) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_employee` */

insert  into `tbl_employee`(`id`,`last_name`,`gender`,`email`) values (2,'Lee','0','123@2564'),(4,'0000000004','4','0000000004'),(8,'Lee','0','123@2564'),(9,'Lee','0','123@2564'),(10,'Lee','0','123@2564'),(11,'er','1','dff');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
