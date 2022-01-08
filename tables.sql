
CREATE TABLE Team ( 
teamName char(50), 
league char(50),  
teamOwner char(20) NOT NULL,
PRIMARY KEY (teamName, league)
); 
 

CREATE TABLE managerManages ( 
managerId integer PRIMARY KEY,
managerName char(50) NOT NULL, 
league char(50) NOT NULL,  
teamName char(50) NOT NULL, 
nationality char(30) NOT NULL,
age integer NOT NULL,
nationalTeam char(40) NOT NULL,
FOREIGN KEY (teamName,league) REFERENCES Team ON DELETE CASCADE 
); 

CREATE TABLE Stadium ( 
stadiumName char(50) PRIMARY KEY, 
league char(50) NOT NULL,  
teamName char(50) NOT NULL, 
stadiumlocation char(50) NOT NULL,
sponsor char(50),
capacity integer,
FOREIGN KEY (teamName,league) REFERENCES Team ON DELETE CASCADE
); 


CREATE TABLE Player ( 
playerId integer PRIMARY KEY,
playerName char(50) NOT NULL, 
league char(50) NOT NULL,  
teamName char(50) NOT NULL, 
nationality char(30) NOT NULL,
jerseyNumber int NOT NULL,
goals int NOT NULL, 
salary float NOT NULL, 
FOREIGN KEY (teamName,league) REFERENCES Team ON DELETE CASCADE
); 

CREATE TABLE GoalKeeper ( 
playerId integer PRIMARY KEY,
saves integer,
FOREIGN KEY (playerId) REFERENCES Player
); 


CREATE TABLE Refree ( 
name char(50) ,
lNumber integer PRIMARY KEY,
salary integer,
nationality char(20)
); 


CREATE TABLE playsAMatch ( 
teamName char(50),
league char(50),
teamAgainst char(50),
leagueAgainst char(50),
date_on char(12),
kickOff char(14),
outcome char(20),
lNumber integer NOT NULL,
PRIMARY KEY (teamName,league,date_on),
FOREIGN KEY (teamName,league) REFERENCES Team,
FOREIGN KEY (teamAgainst,leagueAgainst) REFERENCES Team,
FOREIGN KEY (lNumber) REFERENCES Refree
); 



CREATE TABLE scoresGoalInMatch( 
goalId integer PRIMARY KEY,
playerId integer NOT NULL,
teamName char(50),
league char(50),
dateOn   char(12), 
timeAt  char(50),
assist char(50),
goalType char(20),
FOREIGN KEY (playerId) REFERENCES Player ON DELETE CASCADE,
FOREIGN KEY (dateOn,teamName,league) REFERENCES playsAMatch ON DELETE CASCADE
);







