USE Olympics
GO
create schema olympics;

GO
DROP TABLE IF EXISTS olympics.athlete_data;
CREATE TABLE olympics.athlete_data
(
	id INTEGER,
	name NVARCHAR(MAX),
	gender NVARCHAR(MAX),
	born NVARCHAR(MAX),
	died NVARCHAR(MAX),
	height NVARCHAR(MAX),
	weight NVARCHAR(MAX), 	
	team NVARCHAR(MAX),
	game NVARCHAR(MAX),
	noc NVARCHAR(MAX),
	sport NVARCHAR(MAX),
	event NVARCHAR(MAX),
	position NVARCHAR(MAX),
	medal NVARCHAR(MAX)
);

GO
DROP TABLE IF EXISTS olympics.olympic_data;
CREATE TABLE olympics.olympic_data
(
	id INTEGER,
	name NVARCHAR(MAX),
	gender NVARCHAR(MAX),
	born NVARCHAR(MAX),
	died NVARCHAR(MAX),
	height NVARCHAR(MAX),
	weight NVARCHAR(MAX), 	
	team NVARCHAR(MAX),
	game NVARCHAR(MAX),
	noc NVARCHAR(MAX),
	sport NVARCHAR(MAX),
	event NVARCHAR(MAX),
	position NVARCHAR(MAX),
	medal NVARCHAR(MAX)
);

GO
DROP TABLE IF EXISTS olympics.olympic_roles;
CREATE TABLE olympics.athletes_roles
(
	id INTEGER,
	name NVARCHAR(MAX),
	roles NVARCHAR(MAX)
);

GO
DROP TABLE IF EXISTS olympics.host_cities
CREATE TABLE olympics.host_cities
(
	year INTEGER,
	season NVARCHAR(MAX),
	game NVARCHAR(MAX),
	host_city NVARCHAR(MAX)
);

GO
DROP TABLE IF EXISTS olympics.countries_noc;
CREATE TABLE olympics.countries_noc
(
	noc NVARCHAR(MAX),
	country NVARCHAR(MAX)
);

select * from olympics.athlete_data

ALTER TABLE olympics.host_cities
ALTER COLUMN year INT NOT NULL;

ALTER TABLE olympics.host_cities
ALTER COLUMN season NVARCHAR(225) NOT NULL;

ALTER TABLE olympics.host_cities
ADD CONSTRAINT PK_host_city PRIMARY KEY (year, season);

select * from olympics.countries_noc

ALTER TABLE olympics.countries_noc
ALTER COLUMN noc NVARCHAR(225) NOT NULL;

ALTER TABLE olympics.countries_noc
ALTER COLUMN country NVARCHAR(225) NOT NULL;

ALTER TABLE olympics.countries_noc
ADD CONSTRAINT PK_countries_noc PRIMARY KEY (noc);

select * from olympics.athletes_roles

ALTER TABLE olympics.athletes_roles
ALTER COLUMN id INT NOT NULL;

ALTER TABLE olympics.athletes_roles
ADD CONSTRAINT PK_athletes_roles PRIMARY KEY (id);

select * from olympics.athlete_data


GO
DROP TABLE IF EXISTS olympics.athlete_data_dbtemp;
CREATE TABLE olympics.athlete_data_dbtemp
(
	id INTEGER,
	name NVARCHAR(MAX),
	gender NVARCHAR(MAX),
	born NVARCHAR(MAX),
	died NVARCHAR(MAX),
	height NVARCHAR(MAX),
	weight NVARCHAR(MAX), 	
	team NVARCHAR(MAX),
	game NVARCHAR(MAX),
	noc NVARCHAR(MAX),
	sport NVARCHAR(MAX),
	event NVARCHAR(MAX),
	position NVARCHAR(MAX),
	medal NVARCHAR(MAX),
	birth_year INTEGER,
	death_year INTEGER
);


GO
DROP TABLE IF EXISTS olympics.olympic_roles_dbtemp;
CREATE TABLE olympics.athletes_roles_dbtemp
(
	id INTEGER,
	name NVARCHAR(MAX),
	roles NVARCHAR(MAX)
);

GO
DROP TABLE IF EXISTS olympics.host_cities_dbtemp
CREATE TABLE olympics.host_cities_dbtemp
(
	year INTEGER,
	season NVARCHAR(MAX),
	game NVARCHAR(MAX),
	host_city NVARCHAR(MAX)
);

GO
DROP TABLE IF EXISTS olympics.countries_noc_dbtemp
CREATE TABLE olympics.countries_noc_dbtemp
(
	noc NVARCHAR(MAX),
	country NVARCHAR(MAX)
);


Go
DROP TABLE IF EXISTS olympics.OlympicGames
CREATE TABLE olympics.OlympicGames (
    GameName NVARCHAR(1000) PRIMARY KEY,
    Year INT,
    Season NVARCHAR(20),
    HostCity NVARCHAR(100)
);
select * from olympics.OlympicGames

Go
DROP TABLE IF EXISTS olympics.Sport
CREATE TABLE olympics.Sport (
    SportName NVARCHAR(1000),
    GameName NVARCHAR(1000),
    PRIMARY KEY (SportName, GameName),
    FOREIGN KEY (GameName) REFERENCES olympics.OlympicGames(GameName)
);
select * from olympics.Sport

Go
DROP TABLE IF EXISTS olympics.Event
CREATE TABLE olympics.Event (
    EventName NVARCHAR(1000),
    SportName NVARCHAR(1000),
    GameName NVARCHAR(1000),
    PRIMARY KEY (EventName, SportName, GameName),
    FOREIGN KEY (SportName, GameName) REFERENCES olympics.Sport(SportName, GameName)
);
select * from olympics.Event

Go
DROP TABLE IF EXISTS olympics.noc_Country
CREATE TABLE olympics.noc_Country(
    noc NVARCHAR(100),
	country NVARCHAR(100) PRIMARY KEY
);
select * from olympics.noc_Country

Go
DROP TABLE IF EXISTS olympics.Athlete
CREATE TABLE olympics.Athlete (
    AthleteId INT PRIMARY KEY,
    AthleteName NVARCHAR(100),
    Gender NVARCHAR(10),
    Born NVARCHAR(100),
    Died NVARCHAR(100),
	BirthYear Integer,
	DeathYear Integer,
    Weight Integer,
    Height Integer,
    Team NVARCHAR(100),
    FOREIGN KEY (Team) REFERENCES olympics.noc_Country(country)
);
select * from olympics.Athlete

Go
DROP TABLE IF EXISTS olympics.Participation
CREATE TABLE olympics.Participation (
    AthleteId INT,
    GameName NVARCHAR(1000),
    SportName NVARCHAR(1000),
    EventName NVARCHAR(1000),
	Position NVARCHAR(100),
	Medal NVARCHAR(100),
    FOREIGN KEY (AthleteId) REFERENCES olympics.Athlete(AthleteId),
    FOREIGN KEY (EventName, SportName, GameName) REFERENCES olympics.Event(EventName, SportName, GameName)
);
select * from olympics.Participation


select * from olympics.athlete_data