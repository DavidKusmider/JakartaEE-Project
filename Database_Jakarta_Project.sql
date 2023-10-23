DROP TABLE IF EXISTS Client;
CREATE TABLE IF NOT EXISTS Client (
	clientId int(20) NOT NULL,
	firstName VARCHAR(30) NOT NULL,
	lastName VARCHAR(30) NOT NULL,
	password VARCHAR(30) NOT NULL,
	age int(30) NOT NULL
);

INSERT INTO Client (
	clientId,
	firstName,
	lastName,
	password,
	age
) VALUES 
( 0,'Romain', 'BArre','secret', 21 ),
(1,'Yann', 'Etrillard', 'secret', 30),
(2, 'Lucas', 'Je sais pas ','secret', 25);
