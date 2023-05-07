CREATE DATABASE IF NOT EXISTS `echoSig`;
USE `echoSig`;

CREATE TABLE `Customers` (
                             `CustomerName` varchar(255) DEFAULT NULL,
                             `ContactName` varchar(255) DEFAULT NULL,
                             `Address` varchar(255) DEFAULT NULL,
                             `City` varchar(255) DEFAULT NULL,
                             `PostalCode` varchar(255) DEFAULT NULL,
                             `Country` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `Customers` VALUES ('Cardinal','Tom B. Erichsen','Skagen 21','Stavanger','4006','Norway'),('Wilman Kala','Matti Karttunen','Keskuskatu 45','Helsinki','21240','Finland');
