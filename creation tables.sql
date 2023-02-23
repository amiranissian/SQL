DROP DATABASE IF EXISTS travel_agency;
CREATE DATABASE IF NOT EXISTS travel_agency; 
USE travel_agency
#DROP TABLE IF EXISTS customers;


CREATE TABLE IF NOT EXISTS customers(
	customer_id 	INT 			NOT NULL,
    first_name 		VARCHAR(20) 	NOT NULL,
    last_name		VARCHAR(20) 	NOT NULL,
    gender	  	 	ENUM('M','F')	NOT NULL,
    birth_date  	DATE           	NOT NULL,
    customer_point  INT						,
    PRIMARY KEY(customer_id)
);
#DROP TABLE IF EXISTS excursion;
CREATE TABLE IF NOT EXISTS excursion(
	excursion_id		INT				NOT NULL,
    ecxursion_item	 	VARCHAR(20) 	NOT NULL,
    ecxursion_score		INT						,
    hotel_name			VARCHAR(20)		NOT NULL,
    PRIMARY KEY(excursion_id)					
);
#DROP TABLE IF EXISTS destinations;
CREATE TABLE IF NOT EXISTS destinations(
	destination_airport 		CHAR(3)			NOT NULL,
    city_name 					VARCHAR(20)				,
    country_name				varchar(20)				,
    PRIMARY KEY(destination_airport)					
);
#DROP TABLE IF EXISTS hotels;
CREATE TABLE IF NOT EXISTS  hotels(
	hotel_id 				INT 					,
    hotel_name				VARCHAR(20)		NOT NULL,
    hotel_score 			INT						,
    excursion_id			INT				NOT NULL,
    destination_airport 	CHAR(3)			NOT NULL,
    PRIMARY KEY(hotel_id)							,
    FOREIGN KEY (excursion_id)  REFERENCES excursion (excursion_id)    ON DELETE CASCADE,
    FOREIGN KEY (destination_airport)  REFERENCES destinations (destination_airport)    ON DELETE CASCADE
);


#DROP TABLE IF EXISTS flights;
CREATE TABLE IF NOT EXISTS flights(
	flight_id					CHAR(5)			 		,
    destination_airport 		CHAR(3)			NOT NULL,
    departure_date				DATE			NOT NULL,
    return_date					DATE			NOT NULL,
    PRIMARY KEY(flight_id)								,
    FOREIGN KEY (destination_airport)  REFERENCES destinations(destination_airport)    ON DELETE CASCADE
);

DROP TABLE IF EXISTS sales;
CREATE TABLE IF NOT EXISTS  sales(
	purchase_id 		INT 					,
    purchase_date		DATE					,
    customer_id 		INT 			NOT NULL,
    hotel_id			INT				NOT NULL,
    excursion_id		INT				NOT NULL,
    flight_id			CHAR(5)			NOT NULL,
    departure_date		DATE			NOT NULL,
    return_date			DATE			NOT NULL,
    price				int						,
    PRIMARY KEY(purchase_id)					,
    FOREIGN KEY (customer_id)  REFERENCES customers (customer_id)    ON DELETE CASCADE,
	FOREIGN KEY (hotel_id)  REFERENCES hotels (hotel_id)    ON DELETE CASCADE,
    FOREIGN KEY (excursion_id)  REFERENCES excursion (excursion_id)    ON DELETE CASCADE,
    FOREIGN KEY (flight_id)  REFERENCES flights (flight_id)    ON DELETE CASCADE
);

INSERT INTO customers(
	customer_id,
	birth_date,
    first_name, 		
    last_name,		
    gender,
    customer_point
    )  	
VALUES (10001,'1953-09-02','Georgi','Facello','M',1),
(10002,'1964-06-02','Bezalel','Simmel','F',5),
(10003,'1959-12-03','Parto','Bamford','M',0),
(10004,'1954-05-01','Chirstian','Koblick','M',1),
(10005,'1955-01-21','Kyoichi','Maliniak','M',5),
(10006,'1953-04-20','Anneke','Preusig','F',3),
(10007,'1957-05-23','Tzvetan','Zielinski','F',4),
(10008,'1958-02-19','Saniya','Kalloufi','M',4),
(10009,'1952-04-19','Sumant','Peac','F',2),
(10010,'1963-06-01','Duangkaew','Piveteau','F',5);

INSERT INTO destinations(
	destination_airport,
    city_name,
    country_name
    )
VALUES ('MMX', 'Malmö', 'SWEDEN'),
('SYZ', 'Shiraz', 'Iran'),
('AZD', 'Yazd', 'Iran'),
('ARN', 'Stockholm', 'Sweden'),
('YYZ', 'Toronto', 'Canada'),
('CPH', 'Copenhagen', 'Denmark'),
('JFK', 'New York', 'USA'),
('BER','Berlin','Germany');
INSERT INTO excursion(
	excursion_id,
    ecxursion_item,
    ecxursion_score,
    hotel_name
    )
    VALUES(10,'Turning Torso',2,'Savoy'),
    (11, 'Perspolis', 5,'Pars'),
    (12, 'Dowlat Abad Garden',3,'Azadi'),
    (13,'Vasa Museum',4, 'Generator'),
    (14,'CN Tower',4,'Hilton'),
    (15,'Rosenborg Castle',3,'Tivoli'),
    (16,'Empire State',5,'Bowery'),
    (17,'Checkpoint Charlie', 3,'Space Night'),
    (18,'Berlin Cathedral',3,'Cube Lodges'),
    (19,'The Royal Palace',4,'Clarion'),
    (20,'Malmö Castle',2,'Radisson'),
    (21,'The Round Tower',3,'Parkinn');
    
INSERT INTO hotels(
	hotel_id,
    hotel_name,
    hotel_score,
    excursion_id,
    destination_airport
    )
VALUES(20001,'Savoy',5,10,'MMX'),
(20002,'Pars',4,11,'SYZ'),
(20003,'Azadi',4,12,'AZD'),
(20004,'Generator',3,13,'ARN'),
(20005,'Hilton',5,14,'YYZ'),
(20006,'Tivoli',4,15,'CPH'),
(20007,'Bowery',5,16,'JFK'),
(20008,'Space Night',3,17,'BER'),
(20009,'Cube Lodges',5,18,'BER'),
(20010,'Clarion',4,19,'ARN'),
(20011,'Radisson',5,20,'MMX'),
(20012,'Parkinn',4,21,'CPH'); 

INSERT INTO flights(
	flight_id,
    destination_airport,
    departure_date,
    return_date)
VALUES 
('AL22','MMX','2022-12-23','2022-12-27'),
('AL23','SYZ','2022-12-23','2022-12-28'),
('AL24','AZD','2022-12-23','2022-12-29'),
('AL25','ARN','2022-12-23','2022-12-30'),
('AL26','YYZ','2022-12-23','2022-12-31'),
('AL27','CPH','2022-12-23','2022-01-01'),
('AL28','JFK','2022-12-23','2022-01-02'),
('AL29','BER','2022-12-23','2022-01-03'),
('AL30','BER','2022-12-23','2022-01-04'),
('AL31','ARN','2022-12-23','2022-01-05'),
('AL32','MMX','2022-12-23','2022-01-06'),
('AL33','CPH','2022-12-23','2022-01-07');
INSERT INTO  sales(
	purchase_id,
    purchase_date,
    customer_id,
    hotel_id,
    excursion_id,
    flight_id,
    departure_date,
    return_date,
    price
    )
VALUES(101,'2022-11-01',10001,20001,10,'AL22','2022-12-23','2022-12-27',1200),
(102,'2022-11-01',10002,20002,11,'AL23','2022-12-23','2022-12-28',500),
(103,'2022-11-02',10003,20003,12,'AL24','2022-12-23','2022-12-29',453),
(104,'2022-11-02',10004,20004,13,'AL25','2022-12-23','2022-12-30',1250),
(105,'2022-11-03',10005,20005,14,'AL26','2022-12-23','2022-12-31',1500),
(106,'2022-11-03',10006,20006,15,'AL27','2022-12-23','2022-01-01',1300),
(107,'2022-11-03',10007,20007,16,'AL28','2022-12-23','2022-01-02',1650),
(108,'2022-11-05',10008,20008,17,'AL29','2022-12-23','2022-01-03',1280),
(109,'2022-11-05',10009,20009,18,'AL30','2022-12-23','2022-01-04',1260),
(110,'2022-11-06',10010,20010,19,'AL31','2022-12-23','2022-01-05',1300);




