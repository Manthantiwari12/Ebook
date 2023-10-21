/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 8.0.32 : Database - ebook
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ebook` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `ebook`;

/*Table structure for table `book_details` */

DROP TABLE IF EXISTS `book_details`;

CREATE TABLE `book_details` (
  `bookid` int NOT NULL AUTO_INCREMENT,
  `bookname` varchar(45) DEFAULT NULL,
  `author` varchar(45) DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL,
  `bookcategory` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `photo` varchar(45) DEFAULT NULL,
  `useremail` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`bookid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `book_details` */

insert  into `book_details`(`bookid`,`bookname`,`author`,`price`,`bookcategory`,`status`,`photo`,`useremail`) values 
(6,'java programming','Bertt spell','400','new','active','java.jpeg','admin'),
(7,'Linux for beginners','Richard Meyers','699','old','active','linux.jpg','admin'),
(8,'Sql','Thomas Nield','599','new','active','sql.jpg','admin'),
(9,'Moral Stories for kids','Inikao','199','new','active','story.jpg','admin'),
(10,'c programming','Darrel l. graham','999','new','active','c programming.jpg','admin');

/*Table structure for table `book_order` */

DROP TABLE IF EXISTS `book_order`;

CREATE TABLE `book_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `orderid` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `bookname` varchar(45) DEFAULT NULL,
  `author` varchar(45) DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL,
  `payment` varchar(45) DEFAULT NULL,
  `userid` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `book_order` */

insert  into `book_order`(`id`,`orderid`,`username`,`email`,`address`,`phone`,`bookname`,`author`,`price`,`payment`,`userid`) values 
(4,'BOOK-ORD-001','manthan tiwari','manthantiwari172005@gmail.com','gali no.2 , pareek colony, near hanuman mandir, Hanumangarh town, RAJASTHAN, 335513','06367396616','Moral Stories for kids','Inikao','199.0','cod',2),
(5,'BOOK-ORD-002','manthan tiwari','manthantiwari172005@gmail.com','gali no.2 , pareek colony, near hanuman mandir, Hanumangarh town, RAJASTHAN, 335513','06367396616','Sql','Thomas Nield','599.0','cod',2),
(6,'BOOK-ORD-003','manu','manthantiwari172005@gmail.com','ward no.33, gali no.2 , pareek colony, near hanuman mandir, Hanumangarh town, RAJASTHAN, 335513','06367396616','Moral Stories for kids','Inikao','199.0','cod',2),
(7,'BOOK-ORD-004','manu','manthantiwari172005@gmail.com','ward no.33, gali no.2 , pareek colony, near hanuman mandir, Hanumangarh town, RAJASTHAN, 335513','06367396616','Sql','Thomas Nield','599.0','cod',2),
(8,'BOOK-ORD-005','manu','manthantiwari172005@gmail.com','ward no.33, gali no.2 , pareek colony, near hanuman mandir, Hanumangarh town, RAJASTHAN, 335513','06367396616','Linux for beginners','Richard Meyers','699.0','cod',2),
(9,'BOOK-ORD-006','manthan tiwari','manthantiwari172005@gmail.com','gali no.2 , pareek colony, , Hanumangarh town, RAJASTHAN, 335513','06367396616','java programming','Bertt spell','400.0','cod',2),
(10,'BOOK-ORD-007','manthan tiwari','manthantiwari172005@gmail.com','gali no.2 , pareek colony, hanumangarh, rajasthan, , Hanumangarh town, RAJASTHAN, 335513','06367396616','Moral Stories for kids','Inikao','199.0','cod',1),
(11,'BOOK-ORD-008','manthan tiwari','manthantiwari172005@gmail.com','gali no.2 , pareek colony, hanumangarh, rajasthan, , Hanumangarh town, RAJASTHAN, 335513','06367396616','Sql','Thomas Nield','599.0','cod',1);

/*Table structure for table `cart` */

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `bid` int DEFAULT NULL,
  `uid` int DEFAULT NULL,
  `bookname` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `author` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `totalprice` double DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `cart` */

insert  into `cart`(`cid`,`bid`,`uid`,`bookname`,`author`,`price`,`totalprice`) values 
(26,6,2,'java programming','Bertt spell',400,400),
(27,9,1,'Moral Stories for kids','Inikao',199,199),
(28,8,1,'Sql','Thomas Nield',599,599);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phno` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `landmark` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `zip` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `user` */

insert  into `user`(`id`,`name`,`email`,`phno`,`password`,`address`,`landmark`,`city`,`state`,`zip`) values 
(1,'manthan tiwari','manthantiwari172005@gmail.com','6367396616','12345678',NULL,NULL,NULL,NULL,NULL),
(2,'manu','arpit@gmail.com','9352185698','arpit@123',NULL,NULL,NULL,NULL,NULL),
(3,'aarya','aarya@gmail.com','9876543210','aarys@123',NULL,NULL,NULL,NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
