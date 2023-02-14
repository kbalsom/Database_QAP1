/* QAP1 - Database Programming and Data Processing
Written by: Kara Balsom
Date Written: October 7, 2022*/


/* Create the cities table. 
This will contain the following columns: id (primary key, bigint),
name (text), country (text), and population(text) */ 

CREATE TABLE qap1.cities
(
    id bigint NOT NULL,
    name "text",
    country "text",
    population "text",
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS qap1.cities
    OWNER to postgres;

COMMENT ON TABLE qap1.cities
    IS 'Table of Cities';
	
/* Create the airports table. 
This will contain the following columns: id (primary key, bigint),
name (text), code (up to 3 characters), and cities_id (foreign key to cities table primary key, bigint) */ 
CREATE TABLE qap1.airports
(
    id bigint NOT NULL,
    name text,
    code character varying(3),
    cities_id bigint,
    PRIMARY KEY (id),
    CONSTRAINT cities_id FOREIGN KEY (cities_id)
        REFERENCES qap1.cities (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

ALTER TABLE IF EXISTS qap1.airports
    OWNER to postgres;

COMMENT ON TABLE qap1.airports
    IS 'Table of Airports';

/* Create the aircrafts table. 
This will contain the following columns: id (primary key, bigint),
type (text), airlineName (text), and numberOfPassengers (text) */ 

CREATE TABLE qap1.aircrafts
(
    id bigint NOT NULL,
    type text,
    "airlineName" text,
    "numberOfPassengers" text,
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS qap1.aircrafts
    OWNER to postgres;

COMMENT ON TABLE qap1.aircrafts
    IS 'Table of Aircrafts';
	
/* Create the aircrafts_airports table. 
This will contain the following columns: id (primary key, bigint),
aircrafts_id (foreign key, linked to aircrafts table primary key, bigint), and
airports_id (foreign key, linked to airports table primary key, bigint) */ 

CREATE TABLE qap1.aircrafts_airports
(
    id bigint NOT NULL,
    aircrafts_id bigint,
    airports_id bigint,
    CONSTRAINT aircrafts_id FOREIGN KEY (aircrafts_id)
        REFERENCES qap1.aircrafts (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT airports_id FOREIGN KEY (airports_id)
        REFERENCES qap1.airports (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

ALTER TABLE IF EXISTS qap1.aircrafts_airports
    OWNER to postgres;

COMMENT ON TABLE qap1.aircrafts_airports
    IS 'Table of Aircrafts and Airports';
	
/* Create the passengers table. 
This will contain the following columns: id (primary key, bigint),
firstName (text), lastName (text), and phoneNumber (up to 11 characters).  */ 

CREATE TABLE qap1.passengers
(
    id bigint NOT NULL,
    "firstName" text,
    "lastName" text,
    "phoneNumber" character varying(11),
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS qap1.passengers
    OWNER to postgres;

COMMENT ON TABLE qap1.passengers
    IS 'Table of Passengers';
	
/* Create the passengers_aircrafts table. 
This will contain the following columns: id (primary key, bigint),
passengers_id (foreign key, linked to passengers table primary key, bigint), and
aircrafts_id (foreign key, linked to aircrafts table primary key, bigint) */

CREATE TABLE qap1.passengers_aircrafts
(
    id bigint NOT NULL,
    passengers_id bigint,
    aircrafts_id bigint,
    PRIMARY KEY (id),
    CONSTRAINT passengers_id FOREIGN KEY (passengers_id)
        REFERENCES qap1.passengers (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT aircrafts_id FOREIGN KEY (aircrafts_id)
        REFERENCES qap1.aircrafts (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

ALTER TABLE IF EXISTS qap1.passengers_aircrafts
    OWNER to postgres;

COMMENT ON TABLE qap1.passengers_aircrafts
    IS 'Table of Passengers and Aircrafts';

/*Insert the data for the cities table */

INSERT into qap1.cities values (1, 'London', 'UK', '14,257,962');
INSERT into qap1.cities values (2, 'Tokyo', 'Japan', '40,700,000');
INSERT into qap1.cities values (3, 'St. Johns', 'Canada', '205,955');
INSERT into qap1.cities values (4, 'Doha', 'Qatar', '2,382,000');

/* Check it*/
SELECT * FROM qap1.cities;

/*Insert the data for the airports table */

INSERT into qap1.airports values (1, 'London City Airport', 'LCY', 1);
INSERT into qap1.airports values (2, 'Gatwick Airport', 'LGW', 1);
INSERT into qap1.airports values (3, 'Heathrow Airport', 'LHR', 1);
INSERT into qap1.airports values (4, 'Luton Airport', 'LTN', 1);
INSERT into qap1.airports values (5, 'Stansted Airport', 'STN', 1);
INSERT into qap1.airports values (6, 'Southend Airport', 'SEN', 1);
INSERT into qap1.airports values (7, 'Haneda Airport', 'HND', 2);
INSERT into qap1.airports values (8, 'Narita Airport', 'NRT', 2); 
INSERT into qap1.airports values (9, 'St Johns International Airport', 'YYT', 3);
INSERT into qap1.airports values (10, 'Hamad International Airport', 'DOH', 4);

/* Check it*/
SELECT * FROM qap1.airports;

/*Insert the data for the aircrafts table */

INSERT into qap1.aircrafts values (1, 'Airbus A380', 'British Airways', 525);
INSERT into qap1.aircrafts values (2, 'Boeing 777', 'British Airways', 396);
INSERT into qap1.aircrafts values (3, 'Boeing 787', 'EasyJet', 242);
INSERT into qap1.aircrafts values (4, 'Boeing 767', 'Japan Airlines', 375);
INSERT into qap1.aircrafts values (5, 'Boeing 777', 'Japan Airlines', 396);
INSERT into qap1.aircrafts values (6, 'Boeing 737', 'ANA', 162);
INSERT into qap1.aircrafts values (7, 'Boeing 787', 'Air Canada', 242);
INSERT into qap1.aircrafts values (8, 'Airbus A380', 'Air Canada', 525, 9, 4);
INSERT into qap1.aircrafts values (9, 'Airbus A350', 'Qatar Airways', 410);
INSERT into qap1.aircrafts values (10, 'Airbus A380', 'Qatar Airways', 853);
INSERT into qap1.aircrafts values (11, 'Boeing 777', 'Qatar Airways', 396);
INSERT into qap1.aircrafts values (12, 'Boeing 767', 'Ryanair', 375);

/* Check it*/
SELECT * FROM qap1.aircrafts;

/*Insert the data for the aircrafts_airports table */

INSERT into qap1.aircrafts_airports values (1, 1, 3);
INSERT into qap1.aircrafts_airports values (2, 1, 10);
INSERT into qap1.aircrafts_airports values (3, 1, 4);
INSERT into qap1.aircrafts_airports values (4, 2, 2);
INSERT into qap1.aircrafts_airports values (5, 2, 9);
INSERT into qap1.aircrafts_airports values (6, 2, 6);
INSERT into qap1.aircrafts_airports values (7, 3, 1);
INSERT into qap1.aircrafts_airports values (8, 3, 8);
INSERT into qap1.aircrafts_airports values (9, 3, 7);
INSERT into qap1.aircrafts_airports values (10, 4, 7);
INSERT into qap1.aircrafts_airports values (11, 4, 5);
INSERT into qap1.aircrafts_airports values (12, 4, 10);
INSERT into qap1.aircrafts_airports values (13, 5, 8);
INSERT into qap1.aircrafts_airports values (14, 5, 6);
INSERT into qap1.aircrafts_airports values (15, 5, 1);
INSERT into qap1.aircrafts_airports values (16, 6, 10);
INSERT into qap1.aircrafts_airports values (17,6, 8);
INSERT into qap1.aircrafts_airports values (18,6, 7);
INSERT into qap1.aircrafts_airports values (19, 7, 9);
INSERT into qap1.aircrafts_airports values (20, 7, 3);
INSERT into qap1.aircrafts_airports values (21, 7, 2);
INSERT into qap1.aircrafts_airports values (22, 8, 9);
INSERT into qap1.aircrafts_airports values (23, 8, 4);
INSERT into qap1.aircrafts_airports values (24, 9, 10);
INSERT into qap1.aircrafts_airports values (25, 9, 3);
INSERT into qap1.aircrafts_airports values (26, 9, 8);
INSERT into qap1.aircrafts_airports values (27, 10, 10);
INSERT into qap1.aircrafts_airports values (28, 10, 5);
INSERT into qap1.aircrafts_airports values (29, 10, 4);
INSERT into qap1.aircrafts_airports values (30, 11, 10);
INSERT into qap1.aircrafts_airports values (31, 11, 8);
INSERT into qap1.aircrafts_airports values (32, 11, 7);
INSERT into qap1.aircrafts_airports values (33, 12, 4);
INSERT into qap1.aircrafts_airports values (34, 12, 10);
INSERT into qap1.aircrafts_airports values (35, 12, 6);

/* Check it*/
SELECT * FROM qap1.aircrafts_airports;

/*Insert the data for the passengers table */

INSERT into qap1.passengers values (1, 'George', 'Mills', '0207323800');
INSERT into qap1.passengers values (2, 'Charlotte', 'Jenkins', '02078509973');
INSERT into qap1.passengers values (3, 'Frederick', 'Welch', '02046574984');
INSERT into qap1.passengers values (4, 'Ranveer', 'Singh', '02048575985');
INSERT into qap1.passengers values (5, 'Miriam', 'Khalil', '02073482519');
INSERT into qap1.passengers values (6, 'Jodie', 'Browne', '02056382946');
INSERT into qap1.passengers values (7, 'Imogen', 'Parsons', '02047473541');
INSERT into qap1.passengers values (8, 'Florence', 'Campbell', '02002013038');
INSERT into qap1.passengers values (9, 'Jordan', 'Ojo', '02093932726');
INSERT into qap1.passengers values (10, 'Gabriel', 'Navarro', '02020938390');
INSERT into qap1.passengers values (11, 'Hina', 'Murata', '02055418600');
INSERT into qap1.passengers values (12, 'Jiro', 'Nishimura', '02020399832');
INSERT into qap1.passengers values (13, 'Touma', 'Kinoshita', '02023935240');
INSERT into qap1.passengers values (14, 'Yayoi', 'James', '02021101047');
INSERT into qap1.passengers values (15, 'Ren', 'Hara', '02006019000');
INSERT into qap1.passengers values (16, 'Keith', 'Williams', '7096630193');
INSERT into qap1.passengers values (17, 'Ava', 'Connors', '7094890349');
INSERT into qap1.passengers values (18, 'Blanche', 'DesRosiers', '7096993049');
INSERT into qap1.passengers values (19, 'Virat', 'Prakash', '7096093930');
INSERT into qap1.passengers values (20, 'Valerie', 'Squires', '7093033738');
INSERT into qap1.passengers values (21, 'Mohammed', 'Al Kuwari', '97444525555');
INSERT into qap1.passengers values (22, 'Noor', 'Al Manna', '97402081011');
INSERT into qap1.passengers values (23, 'Fatima', 'Al Fardan', '97423030474');
INSERT into qap1.passengers values (24, 'Fahad', 'Al Misnad', '97423401033');

/* Check it*/
SELECT * FROM qap1.passengers;

/*Insert the data for the passengers_aircrafts table */

INSERT into qap1.passengers_aircrafts values (1, 1, 1);
INSERT into qap1.passengers_aircrafts values (2, 1, 2);
INSERT into qap1.passengers_aircrafts values (3, 1, 3);
INSERT into qap1.passengers_aircrafts values (4, 2, 4);
INSERT into qap1.passengers_aircrafts values (5, 2, 5);
INSERT into qap1.passengers_aircrafts values (6, 2, 6);
INSERT into qap1.passengers_aircrafts values (7, 3, 7);
INSERT into qap1.passengers_aircrafts values (8, 3, 8);
INSERT into qap1.passengers_aircrafts values (9, 3, 9);
INSERT into qap1.passengers_aircrafts values (10, 4, 10);
INSERT into qap1.passengers_aircrafts values (11, 4, 11);
INSERT into qap1.passengers_aircrafts values (12, 4, 12);
INSERT into qap1.passengers_aircrafts values (13, 5, 1);
INSERT into qap1.passengers_aircrafts values (14, 5, 2);
INSERT into qap1.passengers_aircrafts values (15, 5, 3);
INSERT into qap1.passengers_aircrafts values (16, 6, 4);
INSERT into qap1.passengers_aircrafts values (17,6, 5);
INSERT into qap1.passengers_aircrafts values (18,6, 6);
INSERT into qap1.passengers_aircrafts values (19, 7, 7);
INSERT into qap1.passengers_aircrafts values (20, 7, 8);
INSERT into qap1.passengers_aircrafts values (21, 7, 9);
INSERT into qap1.passengers_aircrafts values (22, 8, 10);
INSERT into qap1.passengers_aircrafts values (23, 8, 11);
INSERT into qap1.passengers_aircrafts values (24, 9, 12);
INSERT into qap1.passengers_aircrafts values (25, 9, 1);
INSERT into qap1.passengers_aircrafts values (26, 9, 2);
INSERT into qap1.passengers_aircrafts values (27, 10, 3);
INSERT into qap1.passengers_aircrafts values (28, 10, 4);
INSERT into qap1.passengers_aircrafts values (29, 10, 5);
INSERT into qap1.passengers_aircrafts values (30, 11, 6);
INSERT into qap1.passengers_aircrafts values (31, 11, 7);
INSERT into qap1.passengers_aircrafts values (32, 11, 8);
INSERT into qap1.passengers_aircrafts values (33, 12, 9);
INSERT into qap1.passengers_aircrafts values (34, 12, 10);
INSERT into qap1.passengers_aircrafts values (35, 12, 11);
INSERT into qap1.passengers_aircrafts values (36, 13, 12);
INSERT into qap1.passengers_aircrafts values (37, 13, 1);
INSERT into qap1.passengers_aircrafts values (38, 13, 2);
INSERT into qap1.passengers_aircrafts values (39, 14, 3);
INSERT into qap1.passengers_aircrafts values (40, 14, 4);
INSERT into qap1.passengers_aircrafts values (41, 14, 5);
INSERT into qap1.passengers_aircrafts values (42, 15, 6);
INSERT into qap1.passengers_aircrafts values (43, 15, 7);
INSERT into qap1.passengers_aircrafts values (44, 15, 8);
INSERT into qap1.passengers_aircrafts values (45, 16, 9);
INSERT into qap1.passengers_aircrafts values (46, 16, 10);
INSERT into qap1.passengers_aircrafts values (47, 16, 11);
INSERT into qap1.passengers_aircrafts values (48, 17, 12);
INSERT into qap1.passengers_aircrafts values (49, 17, 1);
INSERT into qap1.passengers_aircrafts values (50, 17, 2);
INSERT into qap1.passengers_aircrafts values (51, 18, 3);
INSERT into qap1.passengers_aircrafts values (52, 18, 4);
INSERT into qap1.passengers_aircrafts values (53, 19, 5);
INSERT into qap1.passengers_aircrafts values (54, 19, 6);
INSERT into qap1.passengers_aircrafts values (55, 19, 7);
INSERT into qap1.passengers_aircrafts values (56, 20, 8);
INSERT into qap1.passengers_aircrafts values (57, 20, 9);
INSERT into qap1.passengers_aircrafts values (58, 20, 10);
INSERT into qap1.passengers_aircrafts values (59, 21, 11);
INSERT into qap1.passengers_aircrafts values (60, 21, 12);
INSERT into qap1.passengers_aircrafts values (61, 21, 1);
INSERT into qap1.passengers_aircrafts values (62, 22, 2);
INSERT into qap1.passengers_aircrafts values (63, 22, 3);
INSERT into qap1.passengers_aircrafts values (64, 23, 4);
INSERT into qap1.passengers_aircrafts values (65, 23, 5);
INSERT into qap1.passengers_aircrafts values (66, 23, 6);
INSERT into qap1.passengers_aircrafts values (67, 24, 7);
INSERT into qap1.passengers_aircrafts values (68, 24, 8);
INSERT into qap1.passengers_aircrafts values (69, 24, 9);

/* Check it*/
SELECT * FROM qap1.passengers_aircrafts;

/* What airports are in what cities? */

SELECT a."name", c."name"
FROM qap1.airports a
INNER JOIN qap1.cities c ON a."cities_id"= c.id;

/* List all aircraftst passengers have travelled on? */

select p."firstName", p."lastName" , c."type", c."airlineName"
from qap1.passengers_aircrafts a
inner join qap1.passengers p on a."passengers_id" = p.id
inner join qap1.aircrafts c on a."aircrafts_id" = c.id
order by p.id ASC;

/* Which airports can aircraft take off from and land at? */

select c."type", c."airlineName", p."name"
from qap1.aircrafts_airports a
inner join qap1.aircrafts c on a."aircrafts_id"=c.id
inner join qap1.airports p on a."airports_id"=p.id
order by p."name" ASC;

/* What airports have passengers used? */

select p."firstName", p."lastName", c."name"
from qap1.passengers_aircrafts g
inner join qap1.passengers p on g."passengers_id" = p.id
inner join qap1.aircrafts_airports t on g."aircrafts_id"=t.id
inner join qap1.airports c on t."airports_id" = c.id
order by p.id ASC;










	


