CREATE DATABASE IF NOT EXISTS `echoSig`;
USE `echoSig`;

CREATE TABLE User (
                      userId INT NOT NULL AUTO_INCREMENT,
                      username VARCHAR(50) NOT NULL,
                      email VARCHAR(100) NOT NULL,
                      password VARCHAR(255) NOT NULL,
                      PRIMARY KEY (userId)
);

CREATE TABLE Type (
                      typeId INT NOT NULL AUTO_INCREMENT,
                      destinationId INT NOT NULL,
                      message VARCHAR(255),
                      PRIMARY KEY (typeId),
                      FOREIGN KEY (destinationId) REFERENCES Destination(destinationId)
);

CREATE TABLE Destination (
                             destinationId INT NOT NULL AUTO_INCREMENT,
                             service VARCHAR(50) NOT NULL,
                             endpoint VARCHAR(255) NOT NULL,
                             PRIMARY KEY (destinationId)
);

CREATE TABLE Node (
                      nodeId INT NOT NULL AUTO_INCREMENT,
                      userId INT NOT NULL,
                      typeId INT NOT NULL,
                      address VARCHAR(255),
                      PRIMARY KEY (nodeId),
                      FOREIGN KEY (userId) REFERENCES User(userId),
                      FOREIGN KEY (typeId) REFERENCES Type(typeId)
);

CREATE TABLE Event (
                       eventId INT NOT NULL AUTO_INCREMENT,
                       nodeId INT NOT NULL,
                       time DATETIME NOT NULL,
                       PRIMARY KEY (eventId),
                       FOREIGN KEY (nodeId) REFERENCES Node(nodeId)
);
