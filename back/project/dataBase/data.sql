CREATE DATABASE IF NOT EXISTS `echoSigDataBase`;
USE `echoSigDataBase`;

CREATE TABLE User (
                      userId INT NOT NULL AUTO_INCREMENT,
                      username VARCHAR(50) NOT NULL,
                      email VARCHAR(100) NOT NULL,
                      password VARCHAR(255) NOT NULL,
                      PRIMARY KEY (userId)
);

CREATE TABLE Destination (
                             destinationId INT NOT NULL AUTO_INCREMENT,
                             service VARCHAR(50) NOT NULL,
                             endpoint VARCHAR(255) NOT NULL,
                             PRIMARY KEY (destinationId)
);

CREATE TABLE Type (
                      typeId INT NOT NULL AUTO_INCREMENT,
                      destinationId INT NOT NULL,
                      message VARCHAR(255),
                      PRIMARY KEY (typeId),
                      FOREIGN KEY (destinationId) REFERENCES Destination(destinationId)
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

INSERT INTO User (username, email, password) VALUES
                                                 ('JohnDoe', 'johndoe@example.com', 'password123'),
                                                 ('JaneSmith', 'janesmith@example.com', 'password456'),
                                                 ('BobJohnson', 'bobjohnson@example.com', 'password789');
INSERT INTO Destination (service, endpoint) VALUES
                                                ('Email', 'https://api.email.com'),
                                                ('SMS', 'https://api.sms.com'),
                                                ('Push Notification', 'https://api.push.com');
INSERT INTO Type (destinationId, message) VALUES
                                              (1, 'Welcome to our service!'),
                                              (2, 'Your appointment is coming up soon.'),
                                              (3, 'A new version of our app is available for download.');
INSERT INTO Node (userId, typeId, address) VALUES
                                               (1, 1, 'johndoe@example.com'),
                                               (1, 2, '555-555-1234'),
                                               (2, 1, 'janesmith@example.com'),
                                               (3, 3, 'https://www.example.com/app');
INSERT INTO Event (nodeId, time) VALUES
                                     (1, '2023-05-01 12:30:00'),
                                     (2, '2023-05-02 09:15:00'),
                                     (1, '2023-05-02 15:00:00'),
                                     (3, '2023-05-03 14:30:00'),
                                     (1, '2023-05-04 11:00:00'),
                                     (2, '2023-05-05 16:45:00'),
                                     (3, '2023-05-06 10:00:00');

-- Definimos un nuevo delimitador
DELIMITER $$

-- Stored procedures para la tabla User
CREATE PROCEDURE GetUser()
BEGIN
SELECT * FROM User;
END $$

CREATE PROCEDURE AddUser(
    IN p_username VARCHAR(50),
    IN p_email VARCHAR(100),
    IN p_password VARCHAR(255)
)
BEGIN
INSERT INTO User(username, email, password)
VALUES(p_username, p_email, p_password);
END $$

CREATE PROCEDURE UpdateUser(
    IN p_userId INT,
    IN p_username VARCHAR(50),
    IN p_email VARCHAR(100),
    IN p_password VARCHAR(255)
)
BEGIN
UPDATE User SET
                username = p_username,
                email = p_email,
                password = p_password
WHERE userId = p_userId;
END $$

CREATE PROCEDURE DeleteUser(
    IN p_userId INT
)
BEGIN
DELETE FROM User
WHERE userId = p_userId;
END $$

-- Stored procedures para la tabla Node
CREATE PROCEDURE GetNode()
BEGIN
SELECT * FROM Node;
END $$

CREATE PROCEDURE AddNode(
    IN p_userId INT,
    IN p_typeId INT,
    IN p_address VARCHAR(255)
)
BEGIN
INSERT INTO Node(userId, typeId, address)
VALUES(p_userId, p_typeId, p_address);
END $$

CREATE PROCEDURE UpdateNode(
    IN p_nodeId INT,
    IN p_userId INT,
    IN p_typeId INT,
    IN p_address VARCHAR(255)
)
BEGIN
UPDATE Node SET
                userId = p_userId,
                typeId = p_typeId,
                address = p_address
WHERE nodeId = p_nodeId;
END $$

CREATE PROCEDURE DeleteNode(
    IN p_nodeId INT
)
BEGIN
DELETE FROM Node
WHERE nodeId = p_nodeId;
END $$

-- Stored procedures para la tabla Type
CREATE PROCEDURE GetType()
BEGIN
SELECT * FROM Type;
END $$

CREATE PROCEDURE AddType(
    IN p_destinationId INT,
    IN p_message VARCHAR(255)
)
BEGIN
INSERT INTO Type(destinationId, message)
VALUES(p_destinationId, p_message);
END $$

CREATE PROCEDURE UpdateType(
    IN p_typeId INT,
    IN p_destinationId INT,
    IN p_message VARCHAR(255)
)
BEGIN
UPDATE Type SET
                destinationId = p_destinationId,
                message = p_message
WHERE typeId = p_typeId;
END $$

CREATE PROCEDURE DeleteType(
    IN p_typeId INT
)
BEGIN
DELETE FROM Type
WHERE typeId = p_typeId;
END $$

-- Stored procedures para la tabla Destination
CREATE PROCEDURE GetDestination()
BEGIN
SELECT * FROM Destination;
END $$

CREATE PROCEDURE AddDestination(
    IN p_service VARCHAR(50),
    IN p_endpoint VARCHAR(255)
)
BEGIN
INSERT INTO Destination(service, endpoint)
VALUES(p_service, p_endpoint);
END $$

CREATE PROCEDURE UpdateDestination(
    IN p_destinationId INT,
    IN p_service VARCHAR(50),
    IN p_endpoint VARCHAR(255)
)
BEGIN
UPDATE Destination SET
                       service = p_service,
                       endpoint = p_endpoint
WHERE destinationId = p_destinationId;
END $$

CREATE PROCEDURE DeleteDestination(
    IN p_destinationId INT
)
BEGIN
DELETE FROM Destination
WHERE destinationId = p_destinationId;
END $$

-- Stored procedures para la tabla Event
CREATE PROCEDURE GetEvent()
BEGIN
SELECT * FROM Event;
END $$

CREATE PROCEDURE AddEvent(
    IN p_nodeId INT,
    IN p_time DATETIME,
    IN p_message VARCHAR(255)
)
BEGIN
INSERT INTO Event(nodeId, time, message)
VALUES(p_nodeId, p_time, p_message);
END $$

CREATE PROCEDURE UpdateEvent(
    IN p_eventId INT,
    IN p_nodeId INT,
    IN p_time DATETIME,
    IN p_message VARCHAR(255)
)
BEGIN
UPDATE Event SET
                 nodeId = p_nodeId,
                 time = p_time,
                 message = p_message
WHERE eventId = p_eventId;
END $$

CREATE PROCEDURE DeleteEvent(
    IN p_eventId INT
)
BEGIN
DELETE FROM Event
WHERE eventId = p_eventId;
END $$

-- Restauramos el delimitador original
DELIMITER ;