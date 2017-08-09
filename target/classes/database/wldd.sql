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
  `status` varchar(100) NOT NULL DEFAULT '0' COMMENT '账号状态',
  `cardYY` varchar(100) DEFAULT NULL COMMENT '营业执照编号',
  `cardJY` varchar(100) DEFAULT NULL COMMENT '经营执照编号',
  PRIMARY KEY (`sellerId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `seller` */

insert  into `seller`(`accountCreateTime`,`sellerId`,`shopName`,`shopAddress`,`sellerName`,`sellerPhone`,`loginName`,`loginPassword`,`status`,`cardYY`,`cardJY`) values ('2017-07-26 10:23:21.000000',15,'chuanchuanxiang ','西北地区|宁夏|银川市|市辖区|32111231366666','luchenxi','12313131313123','laowang','123','0','1231','1312312');

/*Table structure for table `t_account` */

DROP TABLE IF EXISTS `t_account`;

CREATE TABLE `t_account` (
  `account` varchar(100) NOT NULL,
  `ident` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_account` */

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

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `loginName` varchar(100) DEFAULT NULL,
  `loginPassword` varchar(100) DEFAULT NULL,
  `userName` varchar(100) DEFAULT NULL,
  `userPhone` varchar(100) DEFAULT NULL,
  `userId` int(100) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
