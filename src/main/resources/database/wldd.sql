/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.7.17-log : Database - wldd
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`wldd` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `wldd`;

/*Table structure for table `point` */

DROP TABLE IF EXISTS `point`;

CREATE TABLE `point` (
  `loginName` varchar(100) DEFAULT NULL,
  `loginPassword` varchar(100) DEFAULT NULL,
  `userName` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `pointId` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`pointId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `point` */

insert  into `point`(`loginName`,`loginPassword`,`userName`,`phone`,`address`,`pointId`) values ('nihao','123','luchenxi','18408250533','',1);

/*Table structure for table `seller` */

DROP TABLE IF EXISTS `seller`;

CREATE TABLE `seller` (
  `accountCreateTime` timestamp(6) NULL DEFAULT NULL,
  `sellerId` int(100) NOT NULL AUTO_INCREMENT COMMENT '主键，卖家ID',
  `shopName` varchar(100) DEFAULT NULL COMMENT '店名',
  `shopAddress` varchar(100) DEFAULT NULL COMMENT '店地址',
  `sellerName` varchar(100) DEFAULT NULL COMMENT '卖家姓名',
  `sellerPhone` varchar(100) DEFAULT NULL COMMENT '卖家电话',
  `loginName` varchar(100) DEFAULT NULL COMMENT '登入名',
  `loginPassword` varchar(100) DEFAULT NULL COMMENT '密码',
  `status` varchar(100) NOT NULL DEFAULT '待审核' COMMENT '账号状态',
  `cardYY` varchar(100) DEFAULT NULL COMMENT '营业执照编号',
  `cardJY` varchar(100) DEFAULT NULL COMMENT '经营执照编号',
  PRIMARY KEY (`sellerId`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `seller` */

insert  into `seller`(`accountCreateTime`,`sellerId`,`shopName`,`shopAddress`,`sellerName`,`sellerPhone`,`loginName`,`loginPassword`,`status`,`cardYY`,`cardJY`) values ('2017-07-26 10:23:21.000000',15,'chuanchuanxiang ','西北地区|宁夏|银川市|市辖区|32111231366666','luchenxi','12313131313123','laowang','123','正常','1231','1312312'),('2017-07-27 10:49:12.000000',16,'chuancahun','西北地区|宁夏|银川市|市辖区|qweqeqeqwqeqweqw','luchenxi','1213131231321','lcx','123','正常','12sawsdad1231','312wdasd1233'),('2017-07-27 11:20:51.000000',17,'313','西北地区|宁夏|银川市|市辖区|123123123','312321312321313123','32131','lcdsa','123','正常','21312','3123213'),('2017-07-27 11:24:35.000000',18,'3213213','西北地区|宁夏|银川市|市辖区|231313123123','addasda','12313122312','  qweqeqeqe','wqe','正常','1233','213131'),('2017-07-27 13:45:22.000000',19,'32131','西北地区|宁夏|银川市|市辖区|3123123131','3131231','3213123131','12313','321','正常','131233','12312312');

/*Table structure for table `t_account` */

DROP TABLE IF EXISTS `t_account`;

CREATE TABLE `t_account` (
  `account` varchar(100) NOT NULL,
  `ident` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_account` */

insert  into `t_account`(`account`,`ident`) values ('  qweqeqeqe','1'),('12313','1'),('3213','0'),('666','0'),('lcdsa','1'),('lcx','1');

/*Table structure for table `t_order` */

DROP TABLE IF EXISTS `t_order`;

CREATE TABLE `t_order` (
  `orderId` varchar(100) NOT NULL,
  `owerType` varchar(100) DEFAULT NULL,
  `owerId` varchar(100) DEFAULT NULL,
  `orderTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `reciveTime` timestamp NULL DEFAULT NULL,
  `orderEmType` varchar(100) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `orderWeight` float DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `destination` varchar(100) DEFAULT NULL,
  `owerName` varchar(100) DEFAULT NULL,
  `owerPhone` varchar(100) DEFAULT NULL,
  `reviceName` varchar(100) DEFAULT NULL,
  `revicePhone` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT '待揽件',
  `nowAddress` varchar(100) DEFAULT '待揽件',
  `itemType` varchar(100) DEFAULT NULL,
  `payType` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_order` */

insert  into `t_order`(`orderId`,`owerType`,`owerId`,`orderTime`,`reciveTime`,`orderEmType`,`price`,`orderWeight`,`address`,`destination`,`owerName`,`owerPhone`,`reviceName`,`revicePhone`,`status`,`nowAddress`,`itemType`,`payType`) values ('30883246','个人','5','2017-07-26 17:49:00',NULL,'',NULL,NULL,'666666666','西北地区|宁夏|银川市|市辖区|666666','66666666','666666666','6666666','66666666','待揽件','待揽件','普通','到付');

/*Table structure for table `t_price` */

DROP TABLE IF EXISTS `t_price`;

CREATE TABLE `t_price` (
  `eid` varchar(100) NOT NULL COMMENT '主键',
  `ename` varchar(100) DEFAULT NULL COMMENT '快递名',
  `eprice1` int(11) DEFAULT NULL COMMENT '广东价格',
  `eprice2` int(11) DEFAULT NULL COMMENT '浙江江苏等价格',
  `eprice3` int(11) DEFAULT NULL COMMENT '天津重庆等价格',
  `eprice4` int(11) DEFAULT NULL COMMENT '四川河北等价格',
  `eprice5` int(11) DEFAULT NULL COMMENT '甘肃黑龙江等价格',
  `eprice6` int(11) DEFAULT NULL COMMENT '香港澳门等价格',
  `epricex1` int(11) DEFAULT NULL COMMENT '对应续重价格',
  `epricex2` int(11) DEFAULT NULL COMMENT '对应续重价格',
  `epricex3` int(11) DEFAULT NULL COMMENT '对应续重价格',
  `epricex4` int(11) DEFAULT NULL COMMENT '对应续重价格',
  `epricex5` int(11) DEFAULT NULL COMMENT '对应续重价格',
  `epricex6` int(11) DEFAULT NULL COMMENT '对应续重价格',
  PRIMARY KEY (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_price` */

insert  into `t_price`(`eid`,`ename`,`eprice1`,`eprice2`,`eprice3`,`eprice4`,`eprice5`,`eprice6`,`epricex1`,`epricex2`,`epricex3`,`epricex4`,`epricex5`,`epricex6`) values ('EMS','EMS',12,12,12,1,1,1,1,1,1,1,1,1),('SF','顺丰',1,1,1,1,1,1,1,1,1,1,12,1),('TT','天天',1,1,1,1,1,1,1,1,1,1,1,1),('YD','韵达',1,1,1,1,12,11,1,1,1,12,1,1),('YT','圆通',1,1,1,12,1,1,1,1,1,1,1,1);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `loginName` varchar(100) DEFAULT NULL,
  `loginPassword` varchar(100) DEFAULT NULL,
  `userName` varchar(100) DEFAULT NULL,
  `userPhone` varchar(100) DEFAULT NULL,
  `userId` int(100) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`loginName`,`loginPassword`,`userName`,`userPhone`,`userId`) values ('666','6666','66666666','666666666',5),('3213','123','1312','321312',6);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
